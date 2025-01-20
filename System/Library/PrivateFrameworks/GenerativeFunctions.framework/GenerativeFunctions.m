uint64_t sub_24FC0B1A8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v6;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  void *v16;
  void v18[2];

  v18[1] = a6;
  v12 = *(void *)(a3 - 8);
  MEMORY[0x270FA5388](a1);
  v14 = (char *)v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getAssociatedTypeWitness();
  v15 = swift_allocBox();
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, v6, a3);
  sub_24FC4FA08();
  v16 = (void *)swift_allocObject();
  v16[2] = a3;
  v16[3] = a4;
  v16[4] = a5;
  v16[5] = v15;
  v16[6] = a1;
  v16[7] = a2;
  swift_retain();
  return sub_24FC4FAC8();
}

uint64_t sub_24FC0B318(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[9] = a6;
  v7[10] = a7;
  v7[7] = a4;
  v7[8] = a5;
  v7[5] = a1;
  v7[6] = a3;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v7[11] = AssociatedTypeWitness;
  uint64_t v9 = sub_24FC4FB08();
  v7[12] = v9;
  v7[13] = *(void *)(v9 - 8);
  v7[14] = swift_task_alloc();
  v7[15] = *(void *)(AssociatedTypeWitness - 8);
  v7[16] = swift_task_alloc();
  v7[17] = swift_getAssociatedTypeWitness();
  v7[18] = swift_projectBox();
  return MEMORY[0x270FA2498](sub_24FC0B4A8, 0, 0);
}

uint64_t sub_24FC0B4A8()
{
  swift_beginAccess();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v2 = (void *)swift_task_alloc();
  v0[19] = v2;
  void *v2 = v0;
  v2[1] = sub_24FC0B590;
  uint64_t v3 = v0[17];
  uint64_t v4 = v0[14];
  return MEMORY[0x270FA1E80](v4, v3, AssociatedConformanceWitness);
}

uint64_t sub_24FC0B590()
{
  sub_24FC0BAB0();
  *(void *)(v1 + 160) = v0;
  swift_task_dealloc();
  if (v0)
  {
    v2 = sub_24FC0B80C;
  }
  else
  {
    swift_endAccess();
    v2 = sub_24FC0B688;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24FC0B688()
{
  v2 = v0 + 11;
  uint64_t v1 = v0[11];
  uint64_t v3 = v0[14];
  int v4 = _s19GenerativeFunctions24JsonObjectFieldContainerOwet_0(v3, 1, v1);
  uint64_t v5 = v0[16];
  if (v4 == 1)
  {
    uint64_t v6 = v0 + 13;
    v2 = v0 + 12;
    uint64_t v7 = 1;
    uint64_t v8 = v3;
  }
  else
  {
    uint64_t v6 = v0 + 15;
    uint64_t v7 = v0[20];
    uint64_t v9 = (void (*)(uint64_t))v0[6];
    (*(void (**)(void, uint64_t, uint64_t))(v0[15] + 32))(v0[16], v3, v1);
    v9(v5);
    if (v7)
    {
      (*(void (**)(void, void))(v0[15] + 8))(v0[16], v0[11]);
      swift_task_dealloc();
      swift_task_dealloc();
      sub_24FC0BAC8();
      goto LABEL_7;
    }
    uint64_t v8 = v0[16];
  }
  uint64_t v11 = v0[9];
  uint64_t v12 = v0[5];
  (*(void (**)(uint64_t, void))(*v6 + 8))(v8, *v2);
  _s19GenerativeFunctions24JsonObjectFieldContainerOwst_0(v12, v7, 1, v11);
  swift_task_dealloc();
  swift_task_dealloc();
  sub_24FC0BAC8();
LABEL_7:
  return v10();
}

uint64_t sub_24FC0B80C()
{
  swift_endAccess();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_24FC0BAC8();
  return v0();
}

uint64_t sub_24FC0B880()
{
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 64, 7);
}

uint64_t sub_24FC0B8C0(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v9 = v1[6];
  uint64_t v8 = v1[7];
  v10 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v10;
  void *v10 = v2;
  v10[1] = sub_24FC0B994;
  return sub_24FC0B318(a1, v7, v9, v8, v4, v5, v6);
}

uint64_t sub_24FC0B994()
{
  sub_24FC0BAB0();
  swift_task_dealloc();
  sub_24FC0BAC8();
  return v0();
}

uint64_t _s19GenerativeFunctions24JsonObjectFieldContainerOwet_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t _s19GenerativeFunctions24JsonObjectFieldContainerOwst_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_24FC0BAC8()
{
  return v0 + 8;
}

uint64_t GenerativeConfigurationProtocol.with<A>(model:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_24FC12094();
  uint64_t v7 = v6;
  MEMORY[0x270FA5388]();
  sub_24FC126B4();
  uint64_t v10 = v9 - v8;
  sub_24FC12094();
  MEMORY[0x270FA5388]();
  sub_24FC126B4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 16))(v12 - v11, v14, a2);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v10, a1, a3);
  swift_getAssociatedTypeWitness();
  return sub_24FC0BC1C();
}

uint64_t sub_24FC0BC1C()
{
  sub_24FC1255C();
  v0();
  type metadata accessor for GenerativeConfigurationRunnable();
  sub_24FC1255C();
  return v5(v1, v2, v3, v4);
}

uint64_t GenerativeConfigurationProtocol.with<A>(model:modelType:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return GenerativeConfigurationProtocol.with<A>(model:)(a1, a3, a4);
}

uint64_t GenerativeConfigurationProtocol.withModel<A>(model:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_24FC12094();
  uint64_t v8 = v7;
  MEMORY[0x270FA5388]();
  sub_24FC126B4();
  uint64_t v11 = v10 - v9;
  uint64_t result = v12();
  if (!v4)
  {
    GenerativeConfigurationProtocol.with<A>(model:)(v11, a3, a4);
    return (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8))(v11, a4);
  }
  return result;
}

uint64_t GenerativeConfigurationRunnable.model.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_24FC1245C(*(uint64_t (**)(uint64_t))(*(void *)(*(void *)(a1 + 24) - 8) + 16), a2);
}

uint64_t GenerativeConfigurationRunnable.model.setter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a2 + 24) - 8) + 40))(v2 + *(int *)(a2 + 52), a1);
}

uint64_t (*GenerativeConfigurationRunnable.model.modify())()
{
  return nullsub_1;
}

uint64_t GenerativeConfigurationRunnable<>.prompt.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_24FC1245C(*(uint64_t (**)(uint64_t))(*(void *)(*(void *)(a1 + 16) - 8) + 16), a2);
}

uint64_t GenerativeConfigurationRunnable<>.run(returning:)()
{
  sub_24FC12030();
  sub_24FC127FC(v1, v2);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v0[8] = AssociatedTypeWitness;
  sub_24FC12018(AssociatedTypeWitness);
  v0[9] = v4;
  v0[10] = sub_24FC12200();
  sub_24FC12064();
  return MEMORY[0x270FA2498](v5, v6, v7);
}

{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  sub_24FC12314();
  sub_24FC12258();
  sub_24FC120F0();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)sub_24FC121E0(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_24FC0C22C;
  sub_24FC12198();
  sub_24FC12300();
  return MEMORY[0x270F2F320](v3, v4, v5, v6, v7, v8, v9, v10);
}

{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  sub_24FC12314();
  sub_24FC12258();
  sub_24FC120F0();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)sub_24FC121E0(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_24FC12014;
  sub_24FC12198();
  sub_24FC12300();
  return MEMORY[0x270F2F350](v3, v4, v5, v6, v7, v8, v9, v10);
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t AssociatedTypeWitness;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  sub_24FC12030();
  sub_24FC1269C(v1, v2, v3, v4);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v0[7] = AssociatedTypeWitness;
  sub_24FC12018(AssociatedTypeWitness);
  v0[8] = v6;
  v0[9] = sub_24FC12200();
  sub_24FC12064();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  sub_24FC12314();
  sub_24FC12258();
  sub_24FC120F0();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)sub_24FC121E0(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_24FC12014;
  sub_24FC12198();
  sub_24FC12300();
  return MEMORY[0x270F2F378](v3, v4, v5, v6, v7, v8, v9, v10);
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t AssociatedTypeWitness;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  sub_24FC12030();
  sub_24FC127FC(v1, v2);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v0[8] = AssociatedTypeWitness;
  sub_24FC12018(AssociatedTypeWitness);
  v0[9] = v4;
  v0[10] = sub_24FC12200();
  sub_24FC12064();
  return MEMORY[0x270FA2498](v5, v6, v7);
}

{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  sub_24FC12314();
  sub_24FC12258();
  sub_24FC120F0();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)sub_24FC121E0(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_24FC12014;
  sub_24FC12198();
  sub_24FC12300();
  return MEMORY[0x270F2F310](v3, v4, v5, v6, v7, v8, v9, v10);
}

{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  sub_24FC12314();
  sub_24FC12258();
  sub_24FC120F0();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)sub_24FC121E0(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_24FC12014;
  sub_24FC12198();
  sub_24FC12300();
  return MEMORY[0x270F2F328](v3, v4, v5, v6, v7, v8, v9, v10);
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t AssociatedTypeWitness;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  sub_24FC12030();
  sub_24FC1269C(v1, v2, v3, v4);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v0[7] = AssociatedTypeWitness;
  sub_24FC12018(AssociatedTypeWitness);
  v0[8] = v6;
  v0[9] = sub_24FC12200();
  sub_24FC12064();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  sub_24FC12314();
  sub_24FC12258();
  sub_24FC120F0();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)sub_24FC121E0(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_24FC12014;
  sub_24FC12198();
  sub_24FC12300();
  return MEMORY[0x270F2F340](v3, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_24FC0BF28()
{
  sub_24FC12030();
  sub_24FC0C17C();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)sub_24FC121F0(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_24FC0BFBC;
  sub_24FC127C0();
  return GenerativeConfigurationRunnable<>.run(returning:)();
}

uint64_t sub_24FC0BFBC()
{
  sub_24FC12030();
  sub_24FC0BAB0();
  sub_24FC1204C();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  sub_24FC1203C();
  *uint64_t v5 = v4;
  *(void *)(v6 + 96) = v0;
  swift_task_dealloc();
  sub_24FC12064();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_24FC0C098()
{
  sub_24FC12240();
  sub_24FC127AC();
  swift_getAssociatedConformanceWitness();
  sub_24FC1276C();
  uint64_t v0 = sub_24FC122D0();
  v1(v0);
  swift_task_dealloc();
  uint64_t v2 = sub_24FC122A0();
  return v3(v2);
}

uint64_t sub_24FC0C124()
{
  sub_24FC12030();
  swift_task_dealloc();
  sub_24FC12658();
  return v0();
}

uint64_t sub_24FC0C17C()
{
  return sub_24FC1224C();
}

uint64_t sub_24FC0C22C()
{
  sub_24FC12030();
  sub_24FC0BAB0();
  uint64_t v1 = *v0;
  sub_24FC1203C();
  void *v2 = v1;
  swift_task_dealloc();
  sub_24FC0BAC8();
  return v3();
}

uint64_t GenerativeConfigurationRunnable<>.run<A>(returning:)()
{
  sub_24FC12030();
  sub_24FC125D0(v1, v2, v3, v4, v5, v6);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v0[11] = AssociatedTypeWitness;
  sub_24FC12018(AssociatedTypeWitness);
  v0[12] = v8;
  v0[13] = sub_24FC12200();
  sub_24FC12064();
  return MEMORY[0x270FA2498](v9, v10, v11);
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t AssociatedTypeWitness;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;

  sub_24FC12030();
  sub_24FC125D0(v1, v2, v3, v4, v5, v6);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v0[11] = AssociatedTypeWitness;
  sub_24FC12018(AssociatedTypeWitness);
  v0[12] = v8;
  v0[13] = sub_24FC12200();
  sub_24FC12064();
  return MEMORY[0x270FA2498](v9, v10, v11);
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  sub_24FC12314();
  sub_24FC12258();
  v0[6] = v1;
  v0[7] = v2;
  uint64_t v4 = *(void *)(v3 + 24);
  v0[2] = v2;
  v0[3] = v4;
  v0[4] = v5;
  v0[5] = v6;
  uint64_t v7 = type metadata accessor for ChatOneShotGenerableResponseOutput();
  v0[8] = v7;
  sub_24FC12018(v7);
  v0[9] = v8;
  v0[10] = sub_24FC12200();
  uint64_t v9 = swift_task_alloc();
  uint64_t v10 = (void *)sub_24FC121F0(v9);
  void *v10 = v11;
  v10[1] = sub_24FC0FF5C;
  sub_24FC12344();
  sub_24FC12300();
  return GenerativeConfigurationRunnable<>.run<A>(returning:)(v12, v13, v14, v15, v16);
}

uint64_t sub_24FC0C388()
{
  sub_24FC12030();
  sub_24FC127D4();
  sub_24FC0C17C();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 112) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_24FC0C41C;
  sub_24FC12704();
  return GenerativeConfigurationRunnable<>.run(returning:)();
}

uint64_t sub_24FC0C41C()
{
  sub_24FC12030();
  sub_24FC0BAB0();
  sub_24FC1204C();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  sub_24FC1203C();
  *uint64_t v5 = v4;
  *(void *)(v6 + 120) = v0;
  swift_task_dealloc();
  sub_24FC12064();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_24FC0C4F8()
{
  sub_24FC12258();
  sub_24FC12568();
  swift_getAssociatedConformanceWitness();
  sub_24FC1276C();
  uint64_t v1 = sub_24FC122D0();
  uint64_t v3 = v2(v1);
  sub_24FC12824(v3, v4, v5, v6, v7, v8, v9, v10, v15, v16);
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v0 + 128) = v11;
  *uint64_t v11 = v0;
  v11[1] = sub_24FC0C600;
  uint64_t v12 = sub_24FC123F0();
  return v13(v12);
}

uint64_t sub_24FC0C600()
{
  sub_24FC12240();
  uint64_t v1 = *v0;
  sub_24FC1203C();
  void *v2 = v1;
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(void))(v1 + 8);
  return v3();
}

uint64_t sub_24FC0C70C()
{
  sub_24FC12030();
  swift_task_dealloc();
  sub_24FC0BAC8();
  return v0();
}

uint64_t GenerativeConfigurationRunnable<>.run(returning:)(uint64_t a1)
{
  *(void *)(v2 + 72) = a1;
  *(void *)(v2 + 80) = v1;
  return sub_24FC12058((uint64_t)sub_24FC0C818);
}

{
  uint64_t v1;
  uint64_t v2;

  *(void *)(v2 + 72) = a1;
  *(void *)(v2 + 80) = v1;
  return sub_24FC12058((uint64_t)sub_24FC0EF5C);
}

uint64_t sub_24FC0C818()
{
  sub_24FC12030();
  uint64_t v1 = swift_task_alloc();
  uint64_t v2 = (void *)sub_24FC121F0(v1);
  void *v2 = v3;
  v2[1] = sub_24FC0C8A8;
  uint64_t v4 = *(void *)(v0 + 72);
  return GenerativeConfigurationRunnable<>.run(returning:)(v0 + 16, v4);
}

uint64_t sub_24FC0C8A8()
{
  sub_24FC12030();
  sub_24FC0BAB0();
  sub_24FC1204C();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  sub_24FC1203C();
  *uint64_t v5 = v4;
  *(void *)(v6 + 96) = v0;
  swift_task_dealloc();
  sub_24FC12064();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_24FC0C984()
{
  sub_24FC12240();
  sub_24FC124A8();
  sub_24FC4F508();
  _s19GenerativeFunctions26TokenStreamProcessorCloserVwxx_0(v0);
  uint64_t v1 = sub_24FC122A0();
  return v2(v1);
}

uint64_t sub_24FC0C9F0()
{
  sub_24FC12658();
  return v0();
}

uint64_t GenerativeConfigurationRunnable<>.run(returning:)(uint64_t a1, uint64_t a2)
{
  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  return sub_24FC12058((uint64_t)sub_24FC0CA24);
}

{
  uint64_t v2;
  void *v3;

  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  return sub_24FC12058((uint64_t)sub_24FC0CDA4);
}

{
  uint64_t v2;
  void *v3;

  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  return sub_24FC12058((uint64_t)sub_24FC0E78C);
}

{
  uint64_t v2;
  void *v3;

  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  return sub_24FC12058((uint64_t)sub_24FC0F150);
}

{
  uint64_t v2;
  void *v3;

  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  return sub_24FC12058((uint64_t)sub_24FC0F230);
}

{
  uint64_t v2;
  void *v3;

  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  return sub_24FC12058((uint64_t)sub_24FC0F660);
}

uint64_t sub_24FC0CA24()
{
  sub_24FC12314();
  sub_24FC12258();
  sub_24FC120C0();
  uint64_t v0 = sub_24FC12264();
  sub_24FC1259C(v0);
  uint64_t v1 = sub_24FC12328();
  sub_24FC12584(v1);
  uint64_t v2 = swift_task_alloc();
  uint64_t v3 = (void *)sub_24FC12360(v2);
  *uint64_t v3 = v4;
  v3[1] = sub_24FC0CAE8;
  sub_24FC121C8();
  sub_24FC12300();
  return MEMORY[0x270F2F320](v5, v6, v7, v8, v9, v10, v11, v12);
}

uint64_t sub_24FC0CAE8()
{
  sub_24FC12030();
  sub_24FC0BAB0();
  sub_24FC1204C();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  sub_24FC1203C();
  *uint64_t v5 = v4;
  *(void *)(v6 + 48) = v0;
  swift_task_dealloc();
  if (v0)
  {
    sub_24FC12064();
    return MEMORY[0x270FA2498](v7, v8, v9);
  }
  else
  {
    sub_24FC0BAC8();
    return v10();
  }
}

uint64_t sub_24FC0CBE0()
{
  sub_24FC12030();
  sub_24FC0CD34(*(void *)(v0 + 16));
  sub_24FC0BAC8();
  return v1();
}

void *sub_24FC0CC3C(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t _s19GenerativeFunctions26TokenStreamProcessorCloserVwxx_0(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t *sub_24FC0CCD0(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_24FC0CD34(uint64_t result)
{
  if ((*(_DWORD *)(*(void *)(*(void *)(result + 24) - 8) + 80) & 0x20000) != 0) {
    JUMPOUT(0x253373A70);
  }
  return result;
}

uint64_t sub_24FC0CDA4()
{
  sub_24FC12314();
  sub_24FC12258();
  sub_24FC120C0();
  uint64_t v0 = sub_24FC12264();
  sub_24FC1259C(v0);
  uint64_t v1 = sub_24FC12328();
  sub_24FC12584(v1);
  uint64_t v2 = swift_task_alloc();
  uint64_t v3 = (void *)sub_24FC12360(v2);
  *uint64_t v3 = v4;
  v3[1] = sub_24FC0CE68;
  sub_24FC121C8();
  sub_24FC12300();
  return MEMORY[0x270F2F350](v5, v6, v7, v8, v9, v10, v11, v12);
}

uint64_t sub_24FC0CE68()
{
  sub_24FC12030();
  sub_24FC0BAB0();
  sub_24FC1204C();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  sub_24FC1203C();
  *uint64_t v5 = v4;
  *(void *)(v6 + 48) = v0;
  swift_task_dealloc();
  if (v0)
  {
    sub_24FC12064();
    return MEMORY[0x270FA2498](v7, v8, v9);
  }
  else
  {
    sub_24FC0BAC8();
    return v10();
  }
}

uint64_t GenerativeConfigurationRunnable<>.run<A>(type:returning:)()
{
  sub_24FC12030();
  uint64_t v8 = sub_24FC12734(v1, v2, v3, v4, v5, v6, v7);
  v0[8] = v8;
  sub_24FC12018(v8);
  v0[9] = v9;
  v0[10] = sub_24FC12200();
  sub_24FC12064();
  return MEMORY[0x270FA2498](v10, v11, v12);
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;

  sub_24FC12030();
  uint64_t v8 = sub_24FC12734(v1, v2, v3, v4, v5, v6, v7);
  v0[8] = v8;
  sub_24FC12018(v8);
  v0[9] = v9;
  v0[10] = sub_24FC12200();
  sub_24FC12064();
  return MEMORY[0x270FA2498](v10, v11, v12);
}

{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;

  sub_24FC12030();
  v1[10] = v2;
  v1[11] = v0;
  v1[8] = v3;
  v1[9] = v4;
  v1[6] = v5;
  v1[7] = v6;
  uint64_t v7 = *(void *)(v6 + 24);
  v1[2] = v3;
  v1[3] = v7;
  v1[4] = v2;
  v1[5] = v4;
  uint64_t v8 = type metadata accessor for CompletionOneShotGenerableResponseOutput();
  v1[12] = v8;
  sub_24FC12018(v8);
  v1[13] = v9;
  v1[14] = sub_24FC12200();
  sub_24FC12064();
  return MEMORY[0x270FA2498](v10, v11, v12);
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;

  sub_24FC12030();
  sub_24FC1271C(v1, v2, v3, v4, v5, v6);
  uint64_t v7 = sub_24FC4F498();
  v0[7] = v7;
  sub_24FC12018(v7);
  v0[8] = v8;
  v0[9] = sub_24FC12200();
  sub_24FC12064();
  return MEMORY[0x270FA2498](v9, v10, v11);
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;

  sub_24FC12030();
  sub_24FC125A8(v1, v2, v3, v4, v5, v6);
  uint64_t v7 = sub_24FC4F498();
  v0[8] = v7;
  sub_24FC12018(v7);
  v0[9] = v8;
  v0[10] = sub_24FC12200();
  sub_24FC12064();
  return MEMORY[0x270FA2498](v9, v10, v11);
}

{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;

  sub_24FC12030();
  v1[6] = v2;
  v1[7] = v0;
  v1[4] = v3;
  v1[5] = v4;
  v1[2] = v5;
  v1[3] = v6;
  uint64_t v7 = sub_24FC4F4D8();
  v1[8] = v7;
  sub_24FC12018(v7);
  v1[9] = v8;
  v1[10] = sub_24FC12200();
  sub_24FC12064();
  return MEMORY[0x270FA2498](v9, v10, v11);
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  sub_24FC12314();
  sub_24FC12258();
  v0[2] = v1;
  uint64_t v2 = sub_24FC4F4D8();
  v0[3] = v2;
  sub_24FC12018(v2);
  v0[4] = v3;
  v0[5] = sub_24FC12200();
  uint64_t v4 = swift_task_alloc();
  uint64_t v5 = (void *)sub_24FC126C4(v4);
  *uint64_t v5 = v6;
  v5[1] = sub_24FC0FD20;
  sub_24FC12344();
  sub_24FC12300();
  return GenerativeConfigurationRunnable<>.run<A>(returning:)();
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;

  sub_24FC12030();
  sub_24FC1271C(v1, v2, v3, v4, v5, v6);
  uint64_t v7 = sub_24FC4F4D8();
  v0[7] = v7;
  sub_24FC12018(v7);
  v0[8] = v8;
  v0[9] = sub_24FC12200();
  sub_24FC12064();
  return MEMORY[0x270FA2498](v9, v10, v11);
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;

  sub_24FC12030();
  sub_24FC125A8(v1, v2, v3, v4, v5, v6);
  uint64_t v7 = sub_24FC4F4D8();
  v0[8] = v7;
  sub_24FC12018(v7);
  v0[9] = v8;
  v0[10] = sub_24FC12200();
  sub_24FC12064();
  return MEMORY[0x270FA2498](v9, v10, v11);
}

uint64_t sub_24FC0CFE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  sub_24FC12030();
  uint64_t v10 = swift_task_alloc();
  uint64_t v11 = (void *)sub_24FC121F0(v10);
  *uint64_t v11 = v12;
  v11[1] = sub_24FC0D068;
  uint64_t v13 = sub_24FC122E8();
  return GenerativeConfigurationRunnable<>.run<A>(type:returning:)(v13, v14, v15, v16, v17, v18, v19, v20, a9, a10);
}

uint64_t sub_24FC0D068()
{
  sub_24FC12030();
  sub_24FC0BAB0();
  sub_24FC1204C();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  sub_24FC1203C();
  *uint64_t v5 = v4;
  *(void *)(v6 + 96) = v0;
  swift_task_dealloc();
  sub_24FC12064();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_24FC0D144()
{
  sub_24FC12240();
  sub_24FC12758();
  sub_24FC4F488();
  uint64_t v0 = sub_24FC121B0();
  v1(v0);
  swift_task_dealloc();
  sub_24FC12110();
  return v2();
}

uint64_t GenerativeConfigurationRunnable<>.run<A>(type:returning:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  sub_24FC123A8();
  sub_24FC1249C();
  sub_24FC12218();
  uint64_t v10 = swift_task_alloc();
  uint64_t v11 = (void *)sub_24FC121E0(v10);
  *uint64_t v11 = v12;
  v11[1] = sub_24FC12014;
  sub_24FC12120();
  sub_24FC12284();
  return MEMORY[0x270F2F360](v13, v14, v15, v16, v17, v18, v19, v20, a9, a10);
}

{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  sub_24FC123A8();
  sub_24FC1249C();
  sub_24FC12414(v11);
  uint64_t v12 = sub_24FC4F498();
  *(void *)(v10 + 24) = v12;
  sub_24FC12018(v12);
  *(void *)(v10 + 32) = v13;
  uint64_t v14 = sub_24FC12200();
  sub_24FC1261C(v14);
  uint64_t v15 = swift_task_alloc();
  uint64_t v16 = (void *)sub_24FC126C4(v15);
  *uint64_t v16 = v17;
  v16[1] = sub_24FC0E0C4;
  sub_24FC12438();
  sub_24FC12284();
  return MEMORY[0x270F2EF20](v18, v19, v20, v21, v22, v23, v24, v25, a9, a10);
}

{
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  sub_24FC123A8();
  sub_24FC1249C();
  sub_24FC12218();
  uint64_t v10 = swift_task_alloc();
  uint64_t v11 = (void *)sub_24FC121E0(v10);
  *uint64_t v11 = v12;
  v11[1] = sub_24FC12014;
  sub_24FC12120();
  sub_24FC12284();
  return MEMORY[0x270F2EF18](v13, v14, v15, v16, v17, v18, v19, v20, a9, a10);
}

{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  sub_24FC123A8();
  sub_24FC1249C();
  sub_24FC12414(v11);
  uint64_t v12 = sub_24FC4F4D8();
  *(void *)(v10 + 24) = v12;
  sub_24FC12018(v12);
  *(void *)(v10 + 32) = v13;
  uint64_t v14 = sub_24FC12200();
  sub_24FC1261C(v14);
  uint64_t v15 = swift_task_alloc();
  uint64_t v16 = (void *)sub_24FC126C4(v15);
  *uint64_t v16 = v17;
  v16[1] = sub_24FC10894;
  sub_24FC12438();
  sub_24FC12284();
  return MEMORY[0x270F2EF10](v18, v19, v20, v21, v22, v23, v24, v25, a9, a10);
}

{
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  sub_24FC123A8();
  sub_24FC1249C();
  sub_24FC12218();
  uint64_t v10 = swift_task_alloc();
  uint64_t v11 = (void *)sub_24FC121E0(v10);
  *uint64_t v11 = v12;
  v11[1] = sub_24FC12014;
  sub_24FC12120();
  sub_24FC12284();
  return MEMORY[0x270F2EF08](v13, v14, v15, v16, v17, v18, v19, v20, a9, a10);
}

uint64_t CompletionOneShotGenerableResponseOutput.response.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_24FC0FA64(a1);
}

uint64_t CompletionOneShotGenerableResponseOutput.additionalInfo.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_24FC0FAE0(a1, a2);
}

uint64_t sub_24FC0D2FC()
{
  sub_24FC12030();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)sub_24FC121F0(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_24FC0D380;
  sub_24FC122E8();
  return GenerativeConfigurationRunnable<>.run<A>(type:returning:)();
}

uint64_t sub_24FC0D380()
{
  sub_24FC12030();
  sub_24FC0BAB0();
  sub_24FC1204C();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  sub_24FC1203C();
  *uint64_t v5 = v4;
  *(void *)(v6 + 96) = v0;
  swift_task_dealloc();
  sub_24FC12064();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_24FC0D504()
{
  sub_24FC12030();
  uint64_t v2 = (void *)swift_task_alloc();
  v0[15] = v2;
  void *v2 = v0;
  v2[1] = sub_24FC0D5A0;
  uint64_t v3 = v0[14];
  uint64_t v4 = v0[10];
  uint64_t v5 = v0[8];
  uint64_t v6 = v0[9];
  uint64_t v7 = v0[7];
  return GenerativeConfigurationRunnable<>.run<A>(type:returning:)(v3, v1, v7, v5, v6, v4);
}

uint64_t sub_24FC0D5A0()
{
  sub_24FC12030();
  sub_24FC0BAB0();
  sub_24FC1204C();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  sub_24FC1203C();
  *uint64_t v5 = v4;
  *(void *)(v6 + 128) = v0;
  swift_task_dealloc();
  sub_24FC12064();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_24FC0D67C()
{
  sub_24FC12240();
  sub_24FC4F498();
  sub_24FC12070();
  sub_24FC123C0();
  v0();
  uint64_t v1 = sub_24FC122B8();
  v2(v1);
  swift_task_dealloc();
  sub_24FC12110();
  return v3();
}

uint64_t sub_24FC0D720()
{
  sub_24FC12030();
  swift_task_dealloc();
  sub_24FC0BAC8();
  return v0();
}

uint64_t type metadata accessor for CompletionOneShotGenerableResponseOutput()
{
  return swift_getGenericMetadata();
}

uint64_t GenerativeConfigurationRunnable<>.run<A>(type:returning:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[4] = a5;
  v6[5] = a6;
  v6[2] = a1;
  v6[3] = a4;
  uint64_t v7 = sub_24FC4F498();
  sub_24FC12810(v7);
  v6[8] = swift_getAssociatedTypeWitness();
  v6[9] = swift_getTupleTypeMetadata2();
  sub_24FC12084();
  v6[10] = swift_task_alloc();
  v6[11] = swift_task_alloc();
  uint64_t v8 = swift_task_alloc();
  sub_24FC124E0(v8);
  uint64_t v9 = (void *)swift_task_alloc();
  v6[13] = v9;
  *uint64_t v9 = v6;
  v9[1] = sub_24FC0D904;
  uint64_t v10 = sub_24FC123CC();
  return MEMORY[0x270F2F390](v10);
}

uint64_t sub_24FC0D904()
{
  sub_24FC12030();
  sub_24FC0BAB0();
  sub_24FC1204C();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  sub_24FC1203C();
  *uint64_t v5 = v4;
  *(void *)(v6 + 112) = v0;
  swift_task_dealloc();
  sub_24FC12064();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_24FC0D9E0()
{
  uint64_t v48 = v0[5];
  uint64_t v49 = v0[7];
  uint64_t v46 = v0[3];
  uint64_t v47 = v0[4];
  uint64_t v45 = v0[2];
  uint64_t v40 = v0[10];
  uint64_t v43 = v0[11] + *(int *)(v0[9] + 48);
  sub_24FC12094();
  sub_24FC123C0();
  v1();
  sub_24FC120AC();
  uint64_t v2 = sub_24FC12540();
  uint64_t v4 = v3(v2);
  uint64_t v12 = sub_24FC12370(v4, v5, v6, v7, v8, v9, v10, v11, v36, v38, v40);
  v13(v12);
  uint64_t v14 = sub_24FC1246C();
  uint64_t v16 = v15(v14);
  sub_24FC12634(v16, v17, v18, v19, v20, v21, MEMORY[0x263F40C98], (void (*)(void, void *))type metadata accessor for CompletionOneShotGenerableResponseOutput, MEMORY[0x263F40DB0], MEMORY[0x263F40E78], v41, v43, v45, v46, v47, v48, v49);
  uint64_t v22 = sub_24FC12604();
  uint64_t v24 = v23(v22);
  uint64_t v32 = sub_24FC125EC(v24, v25, v26, v27, v28, v29, v30, v31, v37, v39, v42, v44);
  v33(v32);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_24FC12110();
  return v34();
}

uint64_t sub_24FC0DB58()
{
  sub_24FC12030();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_24FC0BAC8();
  return v0();
}

uint64_t sub_24FC0DC50()
{
  sub_24FC12030();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)sub_24FC12510(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_24FC0DCD4;
  uint64_t v3 = sub_24FC1284C();
  return GenerativeConfigurationRunnable<>.run<A>(returning:)(v3, v4, v5, v6);
}

uint64_t sub_24FC0DCD4()
{
  sub_24FC12030();
  sub_24FC0BAB0();
  sub_24FC1204C();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  sub_24FC1203C();
  *uint64_t v5 = v4;
  *(void *)(v6 + 88) = v0;
  swift_task_dealloc();
  sub_24FC12064();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_24FC0DDB0()
{
  sub_24FC12240();
  sub_24FC12838();
  sub_24FC4F488();
  uint64_t v0 = sub_24FC121B0();
  v1(v0);
  swift_task_dealloc();
  sub_24FC12110();
  return v2();
}

uint64_t sub_24FC0DE20()
{
  sub_24FC12030();
  swift_task_dealloc();
  sub_24FC0BAC8();
  return v0();
}

uint64_t GenerativeConfigurationRunnable<>.run<A>(returning:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[5] = a4;
  v5[6] = v4;
  v5[3] = a2;
  v5[4] = a3;
  v5[2] = a1;
  return sub_24FC12058((uint64_t)sub_24FC0DE9C);
}

{
  uint64_t v4;
  void *v5;

  v5[5] = a4;
  v5[6] = v4;
  v5[3] = a2;
  v5[4] = a3;
  v5[2] = a1;
  return sub_24FC12058((uint64_t)sub_24FC1072C);
}

uint64_t sub_24FC0DE9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  sub_24FC12240();
  sub_24FC126D4();
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v10 + 56) = v11;
  *uint64_t v11 = v10;
  v11[1] = sub_24FC0DF40;
  uint64_t v12 = sub_24FC12520();
  return MEMORY[0x270F2F360](v12, v13, v14, v15, v16, v17, v18, v19, a9, a10);
}

uint64_t sub_24FC0DF40()
{
  sub_24FC12030();
  sub_24FC0BAB0();
  uint64_t v1 = *v0;
  sub_24FC1203C();
  void *v2 = v1;
  swift_task_dealloc();
  sub_24FC0BAC8();
  return v3();
}

uint64_t sub_24FC0E0C4()
{
  sub_24FC12030();
  sub_24FC0BAB0();
  sub_24FC1204C();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  sub_24FC1203C();
  *uint64_t v5 = v4;
  *(void *)(v6 + 56) = v0;
  swift_task_dealloc();
  sub_24FC12064();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_24FC0E1A0()
{
  sub_24FC12240();
  sub_24FC4F488();
  uint64_t v0 = sub_24FC121B0();
  v1(v0);
  swift_task_dealloc();
  sub_24FC12110();
  return v2();
}

uint64_t sub_24FC0E218()
{
  sub_24FC12030();
  swift_task_dealloc();
  sub_24FC0BAC8();
  return v0();
}

uint64_t sub_24FC0E304(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  sub_24FC12030();
  uint64_t v10 = swift_task_alloc();
  uint64_t v11 = (void *)sub_24FC121F0(v10);
  *uint64_t v11 = v12;
  v11[1] = sub_24FC0D380;
  uint64_t v13 = sub_24FC122E8();
  return GenerativeConfigurationRunnable<>.run<A>(type:returning:)(v13, v14, v15, v16, v17, v18, v19, v20, a9, a10);
}

uint64_t sub_24FC0E4BC()
{
  sub_24FC12030();
  sub_24FC0E6C0();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)sub_24FC12510(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_24FC0E550;
  sub_24FC12860();
  return GenerativeConfigurationRunnable<>.run(returning:)();
}

uint64_t sub_24FC0E550()
{
  sub_24FC12030();
  sub_24FC0BAB0();
  sub_24FC1204C();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  sub_24FC1203C();
  *uint64_t v5 = v4;
  *(void *)(v6 + 88) = v0;
  swift_task_dealloc();
  sub_24FC12064();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_24FC0E62C()
{
  sub_24FC12240();
  sub_24FC127E8();
  swift_getAssociatedConformanceWitness();
  sub_24FC4F5D8();
  uint64_t v0 = sub_24FC122B8();
  v1(v0);
  swift_task_dealloc();
  sub_24FC12110();
  return v2();
}

uint64_t sub_24FC0E6C0()
{
  return sub_24FC1224C();
}

uint64_t sub_24FC0E78C()
{
  sub_24FC12314();
  sub_24FC12258();
  sub_24FC120C0();
  uint64_t v0 = sub_24FC12264();
  sub_24FC1259C(v0);
  uint64_t v1 = sub_24FC12328();
  sub_24FC12584(v1);
  uint64_t v2 = swift_task_alloc();
  uint64_t v3 = (void *)sub_24FC12360(v2);
  *uint64_t v3 = v4;
  v3[1] = sub_24FC0CE68;
  sub_24FC121C8();
  sub_24FC12300();
  return MEMORY[0x270F2F378](v5, v6, v7, v8, v9, v10, v11, v12);
}

uint64_t sub_24FC0E8EC()
{
  sub_24FC12030();
  sub_24FC0EAE8();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)sub_24FC121F0(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_24FC0E980;
  sub_24FC127C0();
  return GenerativeConfigurationRunnable<>.run(returning:)();
}

uint64_t sub_24FC0E980()
{
  sub_24FC12030();
  sub_24FC0BAB0();
  sub_24FC1204C();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  sub_24FC1203C();
  *uint64_t v5 = v4;
  *(void *)(v6 + 96) = v0;
  swift_task_dealloc();
  sub_24FC12064();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_24FC0EA5C()
{
  sub_24FC12240();
  sub_24FC127AC();
  swift_getAssociatedConformanceWitness();
  sub_24FC1278C();
  uint64_t v0 = sub_24FC122D0();
  v1(v0);
  swift_task_dealloc();
  uint64_t v2 = sub_24FC122A0();
  return v3(v2);
}

uint64_t sub_24FC0EAE8()
{
  return sub_24FC1224C();
}

uint64_t sub_24FC0EC34()
{
  sub_24FC12030();
  sub_24FC127D4();
  sub_24FC0EAE8();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 112) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_24FC0ECC8;
  sub_24FC12704();
  return GenerativeConfigurationRunnable<>.run(returning:)();
}

uint64_t sub_24FC0ECC8()
{
  sub_24FC12030();
  sub_24FC0BAB0();
  sub_24FC1204C();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  sub_24FC1203C();
  *uint64_t v5 = v4;
  *(void *)(v6 + 120) = v0;
  swift_task_dealloc();
  sub_24FC12064();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_24FC0EDA4()
{
  sub_24FC12258();
  sub_24FC12568();
  swift_getAssociatedConformanceWitness();
  sub_24FC1278C();
  uint64_t v1 = sub_24FC122D0();
  uint64_t v3 = v2(v1);
  sub_24FC12824(v3, v4, v5, v6, v7, v8, v9, v10, v15, v16);
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v0 + 128) = v11;
  *uint64_t v11 = v0;
  v11[1] = sub_24FC11FF8;
  uint64_t v12 = sub_24FC123F0();
  return v13(v12);
}

uint64_t sub_24FC0EF5C()
{
  sub_24FC12030();
  uint64_t v1 = swift_task_alloc();
  uint64_t v2 = (void *)sub_24FC121F0(v1);
  void *v2 = v3;
  v2[1] = sub_24FC0EFEC;
  uint64_t v4 = *(void *)(v0 + 72);
  return GenerativeConfigurationRunnable<>.run(returning:)(v0 + 16, v4);
}

uint64_t sub_24FC0EFEC()
{
  sub_24FC12030();
  sub_24FC0BAB0();
  sub_24FC1204C();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  sub_24FC1203C();
  *uint64_t v5 = v4;
  *(void *)(v6 + 96) = v0;
  swift_task_dealloc();
  sub_24FC12064();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_24FC0F0C8()
{
  sub_24FC12240();
  sub_24FC124A8();
  sub_24FC4F4E8();
  _s19GenerativeFunctions26TokenStreamProcessorCloserVwxx_0(v0);
  uint64_t v1 = sub_24FC122A0();
  return v2(v1);
}

uint64_t sub_24FC0F150()
{
  sub_24FC12314();
  sub_24FC12258();
  sub_24FC120C0();
  uint64_t v0 = sub_24FC12264();
  sub_24FC1259C(v0);
  uint64_t v1 = sub_24FC12328();
  sub_24FC12584(v1);
  uint64_t v2 = swift_task_alloc();
  uint64_t v3 = (void *)sub_24FC12360(v2);
  *uint64_t v3 = v4;
  v3[1] = sub_24FC0CE68;
  sub_24FC121C8();
  sub_24FC12300();
  return MEMORY[0x270F2F310](v5, v6, v7, v8, v9, v10, v11, v12);
}

uint64_t sub_24FC0F230()
{
  sub_24FC12314();
  sub_24FC12258();
  sub_24FC120C0();
  uint64_t v0 = sub_24FC12264();
  sub_24FC1259C(v0);
  uint64_t v1 = sub_24FC12328();
  sub_24FC12584(v1);
  uint64_t v2 = swift_task_alloc();
  uint64_t v3 = (void *)sub_24FC12360(v2);
  *uint64_t v3 = v4;
  v3[1] = sub_24FC0CE68;
  sub_24FC121C8();
  sub_24FC12300();
  return MEMORY[0x270F2F328](v5, v6, v7, v8, v9, v10, v11, v12);
}

uint64_t sub_24FC0F390()
{
  sub_24FC12030();
  sub_24FC0F594();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)sub_24FC12510(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_24FC0F424;
  sub_24FC12860();
  return GenerativeConfigurationRunnable<>.run(returning:)();
}

uint64_t sub_24FC0F424()
{
  sub_24FC12030();
  sub_24FC0BAB0();
  sub_24FC1204C();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  sub_24FC1203C();
  *uint64_t v5 = v4;
  *(void *)(v6 + 88) = v0;
  swift_task_dealloc();
  sub_24FC12064();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_24FC0F500()
{
  sub_24FC12240();
  sub_24FC127E8();
  swift_getAssociatedConformanceWitness();
  sub_24FC4F568();
  uint64_t v0 = sub_24FC122B8();
  v1(v0);
  swift_task_dealloc();
  sub_24FC12110();
  return v2();
}

uint64_t sub_24FC0F594()
{
  return sub_24FC1224C();
}

uint64_t sub_24FC0F660()
{
  sub_24FC12314();
  sub_24FC12258();
  sub_24FC120C0();
  uint64_t v0 = sub_24FC12264();
  sub_24FC1259C(v0);
  uint64_t v1 = sub_24FC12328();
  sub_24FC12584(v1);
  uint64_t v2 = swift_task_alloc();
  uint64_t v3 = (void *)sub_24FC12360(v2);
  *uint64_t v3 = v4;
  v3[1] = sub_24FC0CE68;
  sub_24FC121C8();
  sub_24FC12300();
  return MEMORY[0x270F2F340](v5, v6, v7, v8, v9, v10, v11, v12);
}

uint64_t sub_24FC0F7BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  sub_24FC12030();
  uint64_t v11 = swift_task_alloc();
  uint64_t v12 = (void *)sub_24FC121F0(v11);
  *uint64_t v12 = v16;
  v12[1] = sub_24FC0F850;
  uint64_t v17 = v10[10];
  uint64_t v18 = v10[6];
  uint64_t v19 = v10[4];
  uint64_t v20 = v10[5];
  uint64_t v21 = v10[3];
  return GenerativeConfigurationRunnable<>.run<A>(returning:)(v17, v21, v19, v20, v18, v13, v14, v15, a9, a10);
}

uint64_t sub_24FC0F850()
{
  sub_24FC12030();
  sub_24FC0BAB0();
  sub_24FC1204C();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  sub_24FC1203C();
  *uint64_t v5 = v4;
  *(void *)(v6 + 96) = v0;
  swift_task_dealloc();
  sub_24FC12064();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_24FC0F92C()
{
  sub_24FC12240();
  sub_24FC12758();
  sub_24FC4F4C8();
  uint64_t v0 = sub_24FC121B0();
  v1(v0);
  swift_task_dealloc();
  sub_24FC12110();
  return v2();
}

uint64_t GenerativeConfigurationRunnable<>.run<A>(returning:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  sub_24FC123A8();
  sub_24FC1249C();
  sub_24FC12668();
  uint64_t v10 = swift_task_alloc();
  uint64_t v11 = (void *)sub_24FC121E0(v10);
  *uint64_t v11 = v12;
  v11[1] = sub_24FC12014;
  sub_24FC12120();
  sub_24FC12284();
  return MEMORY[0x270F2F330](v13, v14, v15, v16, v17, v18, v19, v20, a9, a10);
}

uint64_t ChatOneShotGenerableResponseOutput.response.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_24FC0FA64(a1);
}

uint64_t sub_24FC0FA64@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_24FC1239C();
  v4(v3);
  sub_24FC12084();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
  return v7(a1, v1, v5);
}

uint64_t ChatOneShotGenerableResponseOutput.additionalInfo.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_24FC0FAE0(a1, a2);
}

uint64_t sub_24FC0FAE0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1 + 52);
  swift_getAssociatedTypeWitness();
  sub_24FC12084();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
  return v7(a2, v4, v5);
}

uint64_t sub_24FC0FB58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void (*a8)(void, void *))
{
  sub_24FC12668();
  v14(0, v13);
  sub_24FC12070();
  sub_24FC1255C();
  v15();
  v18[0] = v8;
  v18[1] = a4;
  v18[2] = a5;
  v18[3] = a6;
  a8(0, v18);
  swift_getAssociatedTypeWitness();
  sub_24FC12070();
  sub_24FC1255C();
  return v16();
}

uint64_t sub_24FC0FD20()
{
  sub_24FC12030();
  sub_24FC0BAB0();
  sub_24FC1204C();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  sub_24FC1203C();
  *uint64_t v5 = v4;
  *(void *)(v6 + 56) = v0;
  swift_task_dealloc();
  sub_24FC12064();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_24FC0FDFC()
{
  sub_24FC12240();
  sub_24FC4F4C8();
  uint64_t v0 = sub_24FC121B0();
  v1(v0);
  swift_task_dealloc();
  sub_24FC12110();
  return v2();
}

uint64_t sub_24FC0FF5C()
{
  sub_24FC12030();
  sub_24FC0BAB0();
  sub_24FC1204C();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  sub_24FC1203C();
  *uint64_t v5 = v4;
  *(void *)(v6 + 96) = v0;
  swift_task_dealloc();
  sub_24FC12064();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_24FC10038()
{
  sub_24FC12240();
  sub_24FC4F4D8();
  sub_24FC12070();
  sub_24FC123C0();
  v0();
  uint64_t v1 = sub_24FC122B8();
  v2(v1);
  swift_task_dealloc();
  sub_24FC12110();
  return v3();
}

uint64_t type metadata accessor for ChatOneShotGenerableResponseOutput()
{
  return swift_getGenericMetadata();
}

uint64_t GenerativeConfigurationRunnable<>.run<A>(returning:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[4] = a4;
  v5[5] = a5;
  v5[2] = a1;
  v5[3] = a3;
  uint64_t v6 = sub_24FC4F4D8();
  sub_24FC12810(v6);
  v5[8] = swift_getAssociatedTypeWitness();
  v5[9] = swift_getTupleTypeMetadata2();
  sub_24FC12084();
  v5[10] = swift_task_alloc();
  v5[11] = swift_task_alloc();
  uint64_t v7 = swift_task_alloc();
  sub_24FC124E0(v7);
  uint64_t v8 = (void *)swift_task_alloc();
  v5[13] = v8;
  *uint64_t v8 = v5;
  v8[1] = sub_24FC10260;
  uint64_t v9 = sub_24FC123CC();
  return MEMORY[0x270F2F368](v9);
}

uint64_t sub_24FC10260()
{
  sub_24FC12030();
  sub_24FC0BAB0();
  sub_24FC1204C();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  sub_24FC1203C();
  *uint64_t v5 = v4;
  *(void *)(v6 + 112) = v0;
  swift_task_dealloc();
  sub_24FC12064();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_24FC1033C()
{
  uint64_t v48 = v0[5];
  uint64_t v49 = v0[7];
  uint64_t v46 = v0[3];
  uint64_t v47 = v0[4];
  uint64_t v45 = v0[2];
  uint64_t v40 = v0[10];
  uint64_t v43 = v0[11] + *(int *)(v0[9] + 48);
  sub_24FC12094();
  sub_24FC123C0();
  v1();
  sub_24FC120AC();
  uint64_t v2 = sub_24FC12540();
  uint64_t v4 = v3(v2);
  uint64_t v12 = sub_24FC12370(v4, v5, v6, v7, v8, v9, v10, v11, v36, v38, v40);
  v13(v12);
  uint64_t v14 = sub_24FC1246C();
  uint64_t v16 = v15(v14);
  sub_24FC12634(v16, v17, v18, v19, v20, v21, MEMORY[0x263F40CC8], (void (*)(void, void *))type metadata accessor for ChatOneShotGenerableResponseOutput, MEMORY[0x263F40D78], MEMORY[0x263F40E70], v41, v43, v45, v46, v47, v48, v49);
  uint64_t v22 = sub_24FC12604();
  uint64_t v24 = v23(v22);
  uint64_t v32 = sub_24FC125EC(v24, v25, v26, v27, v28, v29, v30, v31, v37, v39, v42, v44);
  v33(v32);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_24FC12110();
  return v34();
}

uint64_t sub_24FC1053C()
{
  sub_24FC12030();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)sub_24FC12510(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_24FC105C0;
  uint64_t v3 = sub_24FC1284C();
  return GenerativeConfigurationRunnable<>.run<A>(returning:)(v3, v4, v5, v6);
}

uint64_t sub_24FC105C0()
{
  sub_24FC12030();
  sub_24FC0BAB0();
  sub_24FC1204C();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  sub_24FC1203C();
  *uint64_t v5 = v4;
  *(void *)(v6 + 88) = v0;
  swift_task_dealloc();
  sub_24FC12064();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_24FC1069C()
{
  sub_24FC12240();
  sub_24FC12838();
  sub_24FC4F4C8();
  uint64_t v0 = sub_24FC121B0();
  v1(v0);
  swift_task_dealloc();
  sub_24FC12110();
  return v2();
}

uint64_t sub_24FC1072C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  sub_24FC12240();
  sub_24FC126D4();
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v10 + 56) = v11;
  *uint64_t v11 = v10;
  v11[1] = sub_24FC12008;
  uint64_t v12 = sub_24FC12520();
  return MEMORY[0x270F2F330](v12, v13, v14, v15, v16, v17, v18, v19, a9, a10);
}

uint64_t sub_24FC10894()
{
  sub_24FC12030();
  sub_24FC0BAB0();
  sub_24FC1204C();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  sub_24FC1203C();
  *uint64_t v5 = v4;
  *(void *)(v6 + 56) = v0;
  swift_task_dealloc();
  sub_24FC12064();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_24FC10A00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  sub_24FC12030();
  uint64_t v10 = swift_task_alloc();
  uint64_t v11 = (void *)sub_24FC121F0(v10);
  *uint64_t v11 = v12;
  v11[1] = sub_24FC10A84;
  uint64_t v13 = sub_24FC122E8();
  return GenerativeConfigurationRunnable<>.run<A>(type:returning:)(v13, v14, v15, v16, v17, v18, v19, v20, a9, a10);
}

uint64_t sub_24FC10A84()
{
  sub_24FC12030();
  sub_24FC0BAB0();
  sub_24FC1204C();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  sub_24FC1203C();
  *uint64_t v5 = v4;
  *(void *)(v6 + 96) = v0;
  swift_task_dealloc();
  sub_24FC12064();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_24FC10BF8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 40);
}

uint64_t sub_24FC10C00()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_checkMetadataState();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t *sub_24FC10CD0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  uint64_t v5 = *(void *)(*(void *)(a3 + 32) - 8);
  uint64_t v6 = *(void *)(a3 + 24);
  uint64_t v7 = *(void *)(v6 - 8);
  int v8 = *(_DWORD *)(v7 + 80);
  uint64_t v9 = v8;
  uint64_t v10 = *(void *)(v5 + 64) + v8;
  int v11 = *(_DWORD *)(v5 + 80) | v8;
  uint64_t v12 = v11;
  int v13 = v11 & 0x100000;
  if (v12 > 7 || v13 != 0 || (v10 & (unint64_t)~v9) + *(void *)(v7 + 64) > 0x18)
  {
    uint64_t v16 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v16 + ((v12 + 16) & ~v12));
    swift_retain();
  }
  else
  {
    uint64_t v17 = ~v9;
    (*(void (**)(uint64_t *, uint64_t *))(v5 + 16))(a1, a2);
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v7 + 16))(((unint64_t)v4 + v10) & v17, ((unint64_t)a2 + v10) & v17, v6);
  }
  return v4;
}

uint64_t sub_24FC10E2C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(*(void *)(a2 + 32) - 8) + 8;
  (*(void (**)(void))v4)();
  uint64_t v5 = *(void *)(*(void *)(a2 + 24) - 8);
  uint64_t v6 = *(uint64_t (**)(unint64_t))(v5 + 8);
  unint64_t v7 = (*(void *)(v4 + 56) + a1 + *(unsigned __int8 *)(v5 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  return v6(v7);
}

uint64_t sub_24FC10ED0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(*(void *)(a3 + 32) - 8) + 16;
  (*(void (**)(void))v6)();
  uint64_t v7 = *(void *)(*(void *)(a3 + 24) - 8);
  (*(void (**)(unint64_t, unint64_t))(v7 + 16))((*(void *)(v6 + 48) + *(unsigned __int8 *)(v7 + 80) + a1) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80), (*(void *)(v6 + 48) + *(unsigned __int8 *)(v7 + 80) + a2) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
  return a1;
}

uint64_t sub_24FC10F78(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(*(void *)(a3 + 32) - 8) + 24;
  (*(void (**)(void))v6)();
  uint64_t v7 = *(void *)(*(void *)(a3 + 24) - 8);
  (*(void (**)(unint64_t, unint64_t))(v7 + 24))((*(void *)(v6 + 40) + *(unsigned __int8 *)(v7 + 80) + a1) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80), (*(void *)(v6 + 40) + *(unsigned __int8 *)(v7 + 80) + a2) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
  return a1;
}

uint64_t sub_24FC11020(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(*(void *)(a3 + 32) - 8) + 32;
  (*(void (**)(void))v6)();
  uint64_t v7 = *(void *)(*(void *)(a3 + 24) - 8);
  (*(void (**)(unint64_t, unint64_t))(v7 + 32))((*(void *)(v6 + 32) + *(unsigned __int8 *)(v7 + 80) + a1) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80), (*(void *)(v6 + 32) + *(unsigned __int8 *)(v7 + 80) + a2) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
  return a1;
}

uint64_t sub_24FC110C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(*(void *)(a3 + 32) - 8) + 40;
  (*(void (**)(void))v6)();
  uint64_t v7 = *(void *)(*(void *)(a3 + 24) - 8);
  (*(void (**)(unint64_t, unint64_t))(v7 + 40))((*(void *)(v6 + 24) + *(unsigned __int8 *)(v7 + 80) + a1) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80), (*(void *)(v6 + 24) + *(unsigned __int8 *)(v7 + 80) + a2) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
  return a1;
}

uint64_t sub_24FC11170(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 32);
  uint64_t v6 = *(void *)(a3 + 24);
  uint64_t v7 = *(unsigned int *)(*(void *)(v5 - 8) + 84);
  uint64_t v8 = *(void *)(v6 - 8);
  unsigned int v9 = *(_DWORD *)(v8 + 84);
  uint64_t v10 = *(unsigned __int8 *)(v8 + 80);
  if (v9 <= v7) {
    unsigned int v11 = *(_DWORD *)(*(void *)(v5 - 8) + 84);
  }
  else {
    unsigned int v11 = *(_DWORD *)(v8 + 84);
  }
  if (!a2) {
    return 0;
  }
  uint64_t v12 = *(void *)(*(void *)(v5 - 8) + 64) + v10;
  unsigned int v13 = a2 - v11;
  if (a2 <= v11) {
    goto LABEL_24;
  }
  uint64_t v14 = (v12 & ~v10) + *(void *)(*(void *)(v6 - 8) + 64);
  char v15 = 8 * v14;
  if (v14 <= 3)
  {
    unsigned int v17 = ((v13 + ~(-1 << v15)) >> v15) + 1;
    if (HIWORD(v17))
    {
      int v16 = *(_DWORD *)((char *)a1 + v14);
      if (!v16) {
        goto LABEL_24;
      }
      goto LABEL_14;
    }
    if (v17 > 0xFF)
    {
      int v16 = *(unsigned __int16 *)((char *)a1 + v14);
      if (!*(unsigned __int16 *)((char *)a1 + v14)) {
        goto LABEL_24;
      }
      goto LABEL_14;
    }
    if (v17 < 2)
    {
LABEL_24:
      if (v11)
      {
        if (v7 < v9)
        {
          a1 = (unsigned __int16 *)(((unint64_t)a1 + v12) & ~v10);
          uint64_t v7 = *(unsigned int *)(v8 + 84);
          uint64_t v5 = v6;
        }
        return _s19GenerativeFunctions24JsonObjectFieldContainerOwet_0((uint64_t)a1, v7, v5);
      }
      return 0;
    }
  }
  int v16 = *((unsigned __int8 *)a1 + v14);
  if (!*((unsigned char *)a1 + v14)) {
    goto LABEL_24;
  }
LABEL_14:
  int v18 = (v16 - 1) << v15;
  if (v14 > 3) {
    int v18 = 0;
  }
  if (v14)
  {
    if (v14 <= 3) {
      int v19 = v14;
    }
    else {
      int v19 = 4;
    }
    switch(v19)
    {
      case 2:
        int v20 = *a1;
        break;
      case 3:
        int v20 = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        int v20 = *(_DWORD *)a1;
        break;
      default:
        int v20 = *(unsigned __int8 *)a1;
        break;
    }
  }
  else
  {
    int v20 = 0;
  }
  return v11 + (v20 | v18) + 1;
}

void sub_24FC11348(char *a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = a1;
  uint64_t v7 = *(void *)(a4 + 32);
  uint64_t v8 = *(unsigned int *)(*(void *)(v7 - 8) + 84);
  uint64_t v9 = *(void *)(a4 + 24);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(unsigned int *)(v10 + 84);
  if (v11 <= v8) {
    unsigned int v12 = *(_DWORD *)(*(void *)(v7 - 8) + 84);
  }
  else {
    unsigned int v12 = *(_DWORD *)(v10 + 84);
  }
  uint64_t v13 = *(unsigned __int8 *)(v10 + 80);
  uint64_t v14 = *(void *)(*(void *)(v7 - 8) + 64) + v13;
  size_t v15 = (v14 & ~v13) + *(void *)(*(void *)(v9 - 8) + 64);
  char v16 = 8 * v15;
  BOOL v17 = a3 >= v12;
  unsigned int v18 = a3 - v12;
  if (v18 != 0 && v17)
  {
    if (v15 <= 3)
    {
      unsigned int v22 = ((v18 + ~(-1 << v16)) >> v16) + 1;
      if (HIWORD(v22))
      {
        int v19 = 4;
      }
      else if (v22 >= 0x100)
      {
        int v19 = 2;
      }
      else
      {
        int v19 = v22 > 1;
      }
    }
    else
    {
      int v19 = 1;
    }
  }
  else
  {
    int v19 = 0;
  }
  if (v12 < a2)
  {
    unsigned int v20 = ~v12 + a2;
    if (v15 < 4)
    {
      int v21 = (v20 >> v16) + 1;
      if (v15)
      {
        int v23 = v20 & ~(-1 << v16);
        bzero(a1, v15);
        if (v15 == 3)
        {
          *(_WORD *)uint64_t v6 = v23;
          v6[2] = BYTE2(v23);
        }
        else if (v15 == 2)
        {
          *(_WORD *)uint64_t v6 = v23;
        }
        else
        {
          *uint64_t v6 = v23;
        }
      }
    }
    else
    {
      bzero(a1, v15);
      *(_DWORD *)uint64_t v6 = v20;
      int v21 = 1;
    }
    switch(v19)
    {
      case 1:
        v6[v15] = v21;
        return;
      case 2:
        *(_WORD *)&v6[v15] = v21;
        return;
      case 3:
        goto LABEL_39;
      case 4:
        *(_DWORD *)&v6[v15] = v21;
        return;
      default:
        return;
    }
  }
  switch(v19)
  {
    case 1:
      a1[v15] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_24;
    case 2:
      *(_WORD *)&a1[v15] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_24;
    case 3:
LABEL_39:
      __break(1u);
      JUMPOUT(0x24FC115D4);
    case 4:
      *(_DWORD *)&a1[v15] = 0;
      goto LABEL_23;
    default:
LABEL_23:
      if (a2)
      {
LABEL_24:
        if (v8 < v11)
        {
          a1 = (char *)((unint64_t)&a1[v14] & ~v13);
          uint64_t v8 = v11;
          uint64_t v7 = v9;
        }
        _s19GenerativeFunctions24JsonObjectFieldContainerOwst_0((uint64_t)a1, a2, v8, v7);
      }
      return;
  }
}

uint64_t type metadata accessor for GenerativeConfigurationRunnable()
{
  return swift_getGenericMetadata();
}

uint64_t dispatch thunk of GenerativeResultDecodable.init(promptOutput:)()
{
  sub_24FC1249C();
  sub_24FC12668();
  uint64_t v6 = (uint64_t (*)(uint64_t))(*(void *)(v0 + 8) + **(int **)(v0 + 8));
  uint64_t v1 = swift_task_alloc();
  unint64_t v2 = (void *)sub_24FC121E0(v1);
  void *v2 = v3;
  v2[1] = sub_24FC0C22C;
  uint64_t v4 = sub_24FC12344();
  return v6(v4);
}

uint64_t sub_24FC1170C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24FC118C4(a1, a2, a3, MEMORY[0x263F40C98]);
}

uint64_t *sub_24FC11734(uint64_t *a1, uint64_t *a2)
{
  return sub_24FC119DC(a1, a2);
}

uint64_t sub_24FC1175C(uint64_t a1, uint64_t a2)
{
  return sub_24FC11AF0(a1, a2);
}

uint64_t sub_24FC11784()
{
  return sub_24FC11BD4();
}

uint64_t sub_24FC117AC()
{
  return sub_24FC11C80();
}

uint64_t sub_24FC117D4()
{
  return sub_24FC11D24();
}

uint64_t sub_24FC117FC()
{
  return sub_24FC11DC8();
}

uint64_t sub_24FC11824(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24FC11838);
}

uint64_t sub_24FC11838(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24FC11E80(a1, a2, a3);
}

uint64_t sub_24FC11860(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24FC11874);
}

uint64_t sub_24FC11874(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  return sub_24FC11F4C(a1, a2, a3, a4);
}

uint64_t sub_24FC1189C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24FC118C4(a1, a2, a3, MEMORY[0x263F40CC8]);
}

uint64_t sub_24FC118C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, void))
{
  uint64_t result = a4(319, *(void *)(a1 + 16));
  if (v5 <= 0x3F)
  {
    uint64_t result = swift_getAssociatedTypeWitness();
    if (v6 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t *sub_24FC119B4(uint64_t *a1, uint64_t *a2)
{
  return sub_24FC119DC(a1, a2);
}

uint64_t *sub_24FC119DC(uint64_t *a1, uint64_t *a2)
{
  sub_24FC120AC();
  int v5 = *(_DWORD *)(v4 + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = sub_24FC1239C();
    v7(v6);
    sub_24FC12070();
    sub_24FC123C0();
    v8();
    swift_getAssociatedTypeWitness();
    sub_24FC12070();
    sub_24FC123C0();
    v9();
  }
  return a1;
}

uint64_t sub_24FC11AC8(uint64_t a1, uint64_t a2)
{
  return sub_24FC11AF0(a1, a2);
}

uint64_t sub_24FC11AF0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24FC1239C();
  v5(v4);
  sub_24FC12084();
  (*(void (**)(uint64_t))(v6 + 8))(a1);
  uint64_t v7 = a1 + *(int *)(a2 + 52);
  swift_getAssociatedTypeWitness();
  sub_24FC12084();
  uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t))(v9 + 8);
  return v10(v7, v8);
}

uint64_t sub_24FC11BAC()
{
  return sub_24FC11BD4();
}

uint64_t sub_24FC11BD4()
{
  uint64_t v1 = sub_24FC12144();
  v2(v1);
  sub_24FC12070();
  sub_24FC123C0();
  v3();
  sub_24FC12168();
  sub_24FC12070();
  sub_24FC123C0();
  v4();
  return v0;
}

uint64_t sub_24FC11C58()
{
  return sub_24FC11C80();
}

uint64_t sub_24FC11C80()
{
  uint64_t v1 = sub_24FC12144();
  v2(v1);
  sub_24FC12070();
  uint64_t v3 = sub_24FC1248C();
  v4(v3);
  sub_24FC12168();
  sub_24FC12070();
  uint64_t v5 = sub_24FC12500();
  v6(v5);
  return v0;
}

uint64_t sub_24FC11CFC()
{
  return sub_24FC11D24();
}

uint64_t sub_24FC11D24()
{
  uint64_t v1 = sub_24FC12144();
  v2(v1);
  sub_24FC12070();
  uint64_t v3 = sub_24FC1248C();
  v4(v3);
  sub_24FC12168();
  sub_24FC12070();
  uint64_t v5 = sub_24FC12500();
  v6(v5);
  return v0;
}

uint64_t sub_24FC11DA0()
{
  return sub_24FC11DC8();
}

uint64_t sub_24FC11DC8()
{
  uint64_t v1 = sub_24FC12144();
  v2(v1);
  sub_24FC12070();
  uint64_t v3 = sub_24FC1248C();
  v4(v3);
  sub_24FC12168();
  sub_24FC12070();
  uint64_t v5 = sub_24FC12500();
  v6(v5);
  return v0;
}

uint64_t sub_24FC11E44(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24FC11E58);
}

uint64_t sub_24FC11E58(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24FC11E80(a1, a2, a3);
}

uint64_t sub_24FC11E80(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24FC1239C();
  v7(v6);
  sub_24FC120AC();
  if (*(_DWORD *)(v9 + 84) == a2)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a1;
  }
  else
  {
    uint64_t v10 = sub_24FC12678();
    uint64_t v11 = a1 + *(int *)(a3 + 52);
  }
  return _s19GenerativeFunctions24JsonObjectFieldContainerOwet_0(v11, a2, v10);
}

uint64_t sub_24FC11F10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24FC11F24);
}

uint64_t sub_24FC11F24(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  return sub_24FC11F4C(a1, a2, a3, a4);
}

uint64_t sub_24FC11F4C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = sub_24FC1239C();
  v9(v8);
  sub_24FC120AC();
  if (*(_DWORD *)(v11 + 84) == a3)
  {
    uint64_t v12 = v10;
    uint64_t v13 = a1;
  }
  else
  {
    uint64_t v12 = sub_24FC12678();
    uint64_t v13 = a1 + *(int *)(a4 + 52);
  }
  return _s19GenerativeFunctions24JsonObjectFieldContainerOwst_0(v13, a2, a2, v12);
}

uint64_t sub_24FC12018(uint64_t a1)
{
  return a1 - 8;
}

uint64_t sub_24FC12058(uint64_t a1)
{
  return MEMORY[0x270FA2498](a1, 0, 0);
}

void *sub_24FC120C0()
{
  uint64_t v1 = (void *)(*(void *)(v0 + 32) + *(int *)(*(void *)(v0 + 24) + 52));
  return sub_24FC0CC3C(v1, v1[3]);
}

uint64_t sub_24FC12110()
{
  return v0 + 8;
}

uint64_t sub_24FC12120()
{
  *(void *)(v2 + 16) = v0;
  return v1;
}

uint64_t sub_24FC12144()
{
  return 0;
}

uint64_t sub_24FC12168()
{
  return swift_getAssociatedTypeWitness();
}

uint64_t sub_24FC12198()
{
  return v0;
}

uint64_t sub_24FC121B0()
{
  return v0;
}

uint64_t sub_24FC121C8()
{
  return v0;
}

uint64_t sub_24FC121E0(uint64_t result)
{
  *(void *)(v1 + 16) = result;
  return result;
}

uint64_t sub_24FC121F0(uint64_t result)
{
  *(void *)(v1 + 88) = result;
  return result;
}

uint64_t sub_24FC12200()
{
  return swift_task_alloc();
}

uint64_t sub_24FC1224C()
{
  return swift_getAssociatedTypeWitness();
}

uint64_t sub_24FC12264()
{
  return swift_getAssociatedTypeWitness();
}

uint64_t sub_24FC122A0()
{
  return v0;
}

uint64_t sub_24FC122B8()
{
  return v0;
}

uint64_t sub_24FC122D0()
{
  return v0;
}

uint64_t sub_24FC122E8()
{
  return *(void *)(v0 + 80);
}

uint64_t sub_24FC12328()
{
  return swift_getAssociatedConformanceWitness();
}

uint64_t sub_24FC12344()
{
  return v0;
}

uint64_t sub_24FC12360(uint64_t result)
{
  *(void *)(v1 + 40) = result;
  return result;
}

uint64_t sub_24FC12370(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  return a11;
}

uint64_t sub_24FC1239C()
{
  return 0;
}

uint64_t sub_24FC123CC()
{
  *(void *)(v3 + 16) = v0;
  *(void *)(v3 + 24) = v1;
  return v2;
}

uint64_t sub_24FC123F0()
{
  return *(void *)(v0 + 32);
}

uint64_t sub_24FC12414(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return 0;
}

uint64_t sub_24FC12438()
{
  *(void *)(v2 + 16) = v0;
  return v1;
}

uint64_t sub_24FC1245C@<X0>(uint64_t (*a1)(uint64_t)@<X3>, uint64_t a2@<X8>)
{
  return a1(a2);
}

uint64_t sub_24FC1246C()
{
  return v0;
}

uint64_t sub_24FC1248C()
{
  return v0;
}

uint64_t sub_24FC124A8()
{
  uint64_t v1 = *(void *)(v0 + 40);
  sub_24FC0CC3C((void *)(v0 + 16), v1);
  return v1;
}

uint64_t sub_24FC124E0(uint64_t result)
{
  *(void *)(v1 + 96) = result;
  *(_DWORD *)(v1 + 120) = *(_DWORD *)(v2 + 48);
  return result;
}

uint64_t sub_24FC12500()
{
  return v0;
}

uint64_t sub_24FC12510(uint64_t result)
{
  *(void *)(v1 + 80) = result;
  return result;
}

uint64_t sub_24FC12520()
{
  uint64_t result = *(void *)(v0 + 16);
  *(void *)(v2 + 16) = v1;
  return result;
}

uint64_t sub_24FC12540()
{
  return v0;
}

uint64_t sub_24FC12568()
{
  return *(void *)(v0 + 56);
}

uint64_t *sub_24FC12584(uint64_t a1)
{
  v1[4] = a1;
  return sub_24FC0CCD0(v1);
}

uint64_t sub_24FC1259C(uint64_t result)
{
  *(void *)(v1 + 24) = result;
  return result;
}

uint64_t sub_24FC125A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v7[6] = a6;
  v7[7] = v6;
  v7[4] = a4;
  v7[5] = a5;
  v7[2] = a1;
  v7[3] = a3;
  return MEMORY[0x270F2F168](255, a4, a6);
}

uint64_t sub_24FC125D0(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v7[8] = a6;
  v7[9] = v6;
  v7[6] = a4;
  v7[7] = a5;
  v7[4] = result;
  v7[5] = a3;
  v7[10] = *(void *)(a3 + 24);
  return result;
}

uint64_t sub_24FC125EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  return a12;
}

uint64_t sub_24FC12604()
{
  return v0;
}

uint64_t sub_24FC1261C(uint64_t result)
{
  *(void *)(v1 + 40) = result;
  return result;
}

uint64_t sub_24FC12634(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void (*a8)(void, void *), uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  return sub_24FC0FB58(v17, v18, a14, a17, a16, a15, a7, a8);
}

uint64_t sub_24FC12658()
{
  return v0 + 8;
}

uint64_t sub_24FC12678()
{
  return swift_getAssociatedTypeWitness();
}

uint64_t sub_24FC1269C(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[4] = a4;
  v5[5] = v4;
  v5[2] = result;
  v5[3] = a3;
  v5[6] = *(void *)(a3 + 24);
  return result;
}

uint64_t sub_24FC126C4(uint64_t result)
{
  *(void *)(v1 + 48) = result;
  return result;
}

void *sub_24FC126D4()
{
  uint64_t v1 = (void *)(*(void *)(v0 + 48) + *(int *)(*(void *)(v0 + 24) + 52));
  return sub_24FC0CC3C(v1, v1[3]);
}

uint64_t sub_24FC12704()
{
  return *(void *)(v0 + 104);
}

uint64_t sub_24FC1271C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v7[5] = a6;
  v7[6] = v6;
  v7[3] = a4;
  v7[4] = a5;
  v7[2] = a1;
  return 0;
}

uint64_t sub_24FC12734(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v8[6] = a7;
  v8[7] = v7;
  v8[4] = a5;
  v8[5] = a6;
  v8[2] = a1;
  v8[3] = a4;
  return sub_24FC4F498();
}

uint64_t sub_24FC12758()
{
  return *(void *)(v0 + 64);
}

uint64_t sub_24FC1276C()
{
  return sub_24FC4F508();
}

uint64_t sub_24FC1278C()
{
  return sub_24FC4F4E8();
}

uint64_t sub_24FC127AC()
{
  return *(void *)(v0 + 40);
}

uint64_t sub_24FC127C0()
{
  return *(void *)(v0 + 80);
}

uint64_t sub_24FC127D4()
{
  return *(void *)(v0 + 80);
}

uint64_t sub_24FC127E8()
{
  return *(void *)(v0 + 32);
}

uint64_t sub_24FC127FC(uint64_t result, uint64_t a2)
{
  v3[5] = a2;
  v3[6] = v2;
  v3[4] = result;
  v3[7] = *(void *)(result + 24);
  return result;
}

uint64_t sub_24FC12810(uint64_t result)
{
  *(void *)(v1 + 48) = result;
  *(void *)(v3 + 56) = *(void *)(v2 + 24);
  return result;
}

uint64_t sub_24FC12824(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  return a10 + 8;
}

uint64_t sub_24FC12838()
{
  return *(void *)(v0 + 56);
}

uint64_t sub_24FC1284C()
{
  return *(void *)(v0 + 72);
}

uint64_t sub_24FC12860()
{
  return *(void *)(v0 + 72);
}

uint64_t CompletionPrompt.tokenCount<A>(with:)()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  sub_24FC4F6D8();
  sub_24FC12B5C(&qword_26B1FD7B0, MEMORY[0x263F61F60]);
  *uint64_t v1 = v0;
  v1[1] = sub_24FC12968;
  uint64_t v2 = sub_24FC12BA8();
  return MEMORY[0x270F2F388](v2);
}

uint64_t sub_24FC12968(uint64_t a1)
{
  uint64_t v7 = *v2;
  uint64_t v4 = swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v7 + 8);
  if (!v1) {
    uint64_t v4 = a1;
  }
  return v5(v4);
}

uint64_t ChatMessagesPrompt.tokenCount<A>(with:)()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  sub_24FC4F708();
  sub_24FC12B5C(qword_269A5C9B8, MEMORY[0x263F61FA8]);
  *uint64_t v1 = v0;
  v1[1] = sub_24FC12BA4;
  uint64_t v2 = sub_24FC12BA8();
  return MEMORY[0x270F2F358](v2);
}

uint64_t sub_24FC12B5C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_24FC12BA8()
{
  return v0;
}

uint64_t StreamSignal.valueOrThrow()@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = *(void *)(a1 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v4 + 16))(v6);
  uint64_t v7 = *(void *)(a1 + 16);
  if (_s19GenerativeFunctions24JsonObjectFieldContainerOwet_0((uint64_t)v6, 1, v7) != 1) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a2, v6, v7);
  }
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, a1);
  type metadata accessor for StreamSignal.StreamSignalError();
  swift_getWitnessTable();
  swift_allocError();
  return swift_willThrow();
}

uint64_t type metadata accessor for StreamSignal.StreamSignalError()
{
  return sub_24FC13970();
}

uint64_t sub_24FC12D60(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 8);
}

uint64_t sub_24FC12D68()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataSinglePayload();
    return 0;
  }
  return result;
}

uint64_t *sub_24FC12DE4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  if (*(_DWORD *)(v6 + 84)) {
    size_t v7 = *(void *)(v6 + 64);
  }
  else {
    size_t v7 = *(void *)(v6 + 64) + 1;
  }
  uint64_t v8 = *(_DWORD *)(v6 + 80);
  if (v8 > 7 || (*(_DWORD *)(v6 + 80) & 0x100000) != 0 || v7 > 0x18)
  {
    uint64_t v11 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v11 + ((v8 + 16) & ~v8));
    swift_retain();
  }
  else if (_s19GenerativeFunctions24JsonObjectFieldContainerOwet_0((uint64_t)a2, 1, v5))
  {
    memcpy(a1, a2, v7);
  }
  else
  {
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v6 + 16))(a1, a2, v5);
    _s19GenerativeFunctions24JsonObjectFieldContainerOwst_0((uint64_t)a1, 0, 1, v5);
  }
  return a1;
}

uint64_t sub_24FC12F00(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  uint64_t result = _s19GenerativeFunctions24JsonObjectFieldContainerOwet_0(a1, 1, v3);
  if (!result)
  {
    uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);
    return v5(a1, v3);
  }
  return result;
}

void *sub_24FC12F7C(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  int v6 = _s19GenerativeFunctions24JsonObjectFieldContainerOwet_0((uint64_t)a2, 1, v5);
  uint64_t v7 = *(void *)(v5 - 8);
  if (v6)
  {
    if (*(_DWORD *)(v7 + 84)) {
      size_t v8 = *(void *)(v7 + 64);
    }
    else {
      size_t v8 = *(void *)(v7 + 64) + 1;
    }
    memcpy(a1, a2, v8);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v7 + 16))(a1, a2, v5);
    _s19GenerativeFunctions24JsonObjectFieldContainerOwst_0((uint64_t)a1, 0, 1, v5);
  }
  return a1;
}

void *sub_24FC13040(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  int v6 = _s19GenerativeFunctions24JsonObjectFieldContainerOwet_0((uint64_t)a1, 1, v5);
  int v7 = _s19GenerativeFunctions24JsonObjectFieldContainerOwet_0((uint64_t)a2, 1, v5);
  uint64_t v8 = *(void *)(v5 - 8);
  if (v6)
  {
    if (!v7)
    {
      (*(void (**)(void *, const void *, uint64_t))(v8 + 16))(a1, a2, v5);
      _s19GenerativeFunctions24JsonObjectFieldContainerOwst_0((uint64_t)a1, 0, 1, v5);
      return a1;
    }
    int v9 = *(_DWORD *)(v8 + 84);
    size_t v10 = *(void *)(v8 + 64);
  }
  else
  {
    if (!v7)
    {
      (*(void (**)(void *, const void *, uint64_t))(v8 + 24))(a1, a2, v5);
      return a1;
    }
    uint64_t v11 = v8 + 8;
    (*(void (**)(void *, uint64_t))(v8 + 8))(a1, v5);
    int v9 = *(_DWORD *)(v11 + 76);
    size_t v10 = *(void *)(v11 + 56);
  }
  if (v9) {
    size_t v12 = v10;
  }
  else {
    size_t v12 = v10 + 1;
  }
  memcpy(a1, a2, v12);
  return a1;
}

void *sub_24FC13168(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  int v6 = _s19GenerativeFunctions24JsonObjectFieldContainerOwet_0((uint64_t)a2, 1, v5);
  uint64_t v7 = *(void *)(v5 - 8);
  if (v6)
  {
    if (*(_DWORD *)(v7 + 84)) {
      size_t v8 = *(void *)(v7 + 64);
    }
    else {
      size_t v8 = *(void *)(v7 + 64) + 1;
    }
    memcpy(a1, a2, v8);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v7 + 32))(a1, a2, v5);
    _s19GenerativeFunctions24JsonObjectFieldContainerOwst_0((uint64_t)a1, 0, 1, v5);
  }
  return a1;
}

void *sub_24FC1322C(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  int v6 = _s19GenerativeFunctions24JsonObjectFieldContainerOwet_0((uint64_t)a1, 1, v5);
  int v7 = _s19GenerativeFunctions24JsonObjectFieldContainerOwet_0((uint64_t)a2, 1, v5);
  uint64_t v8 = *(void *)(v5 - 8);
  if (v6)
  {
    if (!v7)
    {
      (*(void (**)(void *, const void *, uint64_t))(v8 + 32))(a1, a2, v5);
      _s19GenerativeFunctions24JsonObjectFieldContainerOwst_0((uint64_t)a1, 0, 1, v5);
      return a1;
    }
    int v9 = *(_DWORD *)(v8 + 84);
    size_t v10 = *(void *)(v8 + 64);
  }
  else
  {
    if (!v7)
    {
      (*(void (**)(void *, const void *, uint64_t))(v8 + 40))(a1, a2, v5);
      return a1;
    }
    uint64_t v11 = v8 + 8;
    (*(void (**)(void *, uint64_t))(v8 + 8))(a1, v5);
    int v9 = *(_DWORD *)(v11 + 76);
    size_t v10 = *(void *)(v11 + 56);
  }
  if (v9) {
    size_t v12 = v10;
  }
  else {
    size_t v12 = v10 + 1;
  }
  memcpy(a1, a2, v12);
  return a1;
}

uint64_t sub_24FC13354(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = *(unsigned int *)(*(void *)(v4 - 8) + 84);
  unsigned int v6 = v5 - 1;
  if (!v5) {
    unsigned int v6 = 0;
  }
  uint64_t v7 = *(void *)(*(void *)(v4 - 8) + 64);
  if (!v5) {
    ++v7;
  }
  if (!a2) {
    return 0;
  }
  unsigned int v8 = a2 - v6;
  if (a2 > v6)
  {
    char v9 = 8 * v7;
    if (v7 > 3) {
      goto LABEL_8;
    }
    unsigned int v11 = ((v8 + ~(-1 << v9)) >> v9) + 1;
    if (HIWORD(v11))
    {
      int v10 = *(_DWORD *)((char *)a1 + v7);
      if (v10) {
        goto LABEL_15;
      }
    }
    else
    {
      if (v11 <= 0xFF)
      {
        if (v11 < 2) {
          goto LABEL_23;
        }
LABEL_8:
        int v10 = *((unsigned __int8 *)a1 + v7);
        if (!*((unsigned char *)a1 + v7)) {
          goto LABEL_23;
        }
LABEL_15:
        int v12 = (v10 - 1) << v9;
        if (v7 > 3) {
          int v12 = 0;
        }
        if (v7)
        {
          if (v7 > 3) {
            LODWORD(v7) = 4;
          }
          switch((int)v7)
          {
            case 2:
              LODWORD(v7) = *a1;
              break;
            case 3:
              LODWORD(v7) = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
              break;
            case 4:
              LODWORD(v7) = *(_DWORD *)a1;
              break;
            default:
              LODWORD(v7) = *(unsigned __int8 *)a1;
              break;
          }
        }
        return v6 + (v7 | v12) + 1;
      }
      int v10 = *(unsigned __int16 *)((char *)a1 + v7);
      if (*(unsigned __int16 *)((char *)a1 + v7)) {
        goto LABEL_15;
      }
    }
  }
LABEL_23:
  if (v5 < 2) {
    return 0;
  }
  unsigned int v14 = _s19GenerativeFunctions24JsonObjectFieldContainerOwet_0((uint64_t)a1, v5, v4);
  if (v14 >= 2) {
    return v14 - 1;
  }
  else {
    return 0;
  }
}

void sub_24FC134D8(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  int v6 = 0;
  uint64_t v7 = *(void *)(a4 + 16);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(unsigned int *)(v8 + 84);
  if (v9) {
    unsigned int v10 = v9 - 1;
  }
  else {
    unsigned int v10 = 0;
  }
  if (v9) {
    size_t v11 = *(void *)(v8 + 64);
  }
  else {
    size_t v11 = *(void *)(v8 + 64) + 1;
  }
  char v12 = 8 * v11;
  BOOL v13 = a3 >= v10;
  unsigned int v14 = a3 - v10;
  if (v14 != 0 && v13)
  {
    if (v11 <= 3)
    {
      unsigned int v15 = ((v14 + ~(-1 << v12)) >> v12) + 1;
      if (HIWORD(v15))
      {
        int v6 = 4;
      }
      else if (v15 >= 0x100)
      {
        int v6 = 2;
      }
      else
      {
        int v6 = v15 > 1;
      }
    }
    else
    {
      int v6 = 1;
    }
  }
  if (v10 < a2)
  {
    unsigned int v16 = ~v10 + a2;
    if (v11 < 4)
    {
      int v17 = (v16 >> v12) + 1;
      if (v11)
      {
        int v18 = v16 & ~(-1 << v12);
        bzero(a1, v11);
        if (v11 == 3)
        {
          *(_WORD *)a1 = v18;
          a1[2] = BYTE2(v18);
        }
        else if (v11 == 2)
        {
          *(_WORD *)a1 = v18;
        }
        else
        {
          *a1 = v18;
        }
      }
    }
    else
    {
      bzero(a1, v11);
      *(_DWORD *)a1 = v16;
      int v17 = 1;
    }
    switch(v6)
    {
      case 1:
        a1[v11] = v17;
        return;
      case 2:
        *(_WORD *)&a1[v11] = v17;
        return;
      case 3:
        goto LABEL_41;
      case 4:
        *(_DWORD *)&a1[v11] = v17;
        return;
      default:
        return;
    }
  }
  switch(v6)
  {
    case 1:
      a1[v11] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_28;
    case 2:
      *(_WORD *)&a1[v11] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_28;
    case 3:
LABEL_41:
      __break(1u);
      JUMPOUT(0x24FC136F8);
    case 4:
      *(_DWORD *)&a1[v11] = 0;
      goto LABEL_27;
    default:
LABEL_27:
      if (a2)
      {
LABEL_28:
        if (v9 >= 2)
        {
          uint64_t v19 = a2 + 1;
          _s19GenerativeFunctions24JsonObjectFieldContainerOwst_0((uint64_t)a1, v19, v9, v7);
        }
      }
      return;
  }
}

uint64_t sub_24FC13720(uint64_t a1, uint64_t a2)
{
  return _s19GenerativeFunctions24JsonObjectFieldContainerOwet_0(a1, 1, *(void *)(a2 + 16));
}

uint64_t sub_24FC1372C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _s19GenerativeFunctions24JsonObjectFieldContainerOwst_0(a1, a2, 1, *(void *)(a3 + 16));
}

uint64_t type metadata accessor for StreamSignal()
{
  return sub_24FC13970();
}

uint64_t _s19GenerativeFunctions58_GenerativeFunctionOverridableInternals_ChatMessagesPromptV10CodingKeysOwet_0(unsigned int *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if ((a2 + 1) >= 0x10000) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) < 0x100) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4) {
    return *a1;
  }
  if (v3 == 2) {
    return *(unsigned __int16 *)a1;
  }
  return *(unsigned __int8 *)a1;
}

unsigned char *sub_24FC137A8(unsigned char *result, int a2, int a3)
{
  if ((a3 + 1) >= 0x10000) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) < 0x100) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2)
  {
    switch(v5)
    {
      case 1:
        *uint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)uint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)uint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *uint64_t result = 0;
      break;
    case 2:
      *(_WORD *)uint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x24FC13844);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_24FC1386C()
{
  return 0;
}

uint64_t sub_24FC13874()
{
  return swift_getWitnessTable();
}

uint64_t sub_24FC13890()
{
  return 1;
}

uint64_t sub_24FC13898()
{
  return sub_24FC4FD18();
}

uint64_t sub_24FC138C0()
{
  return sub_24FC4FD28();
}

uint64_t sub_24FC13904()
{
  return sub_24FC13890();
}

uint64_t sub_24FC1390C()
{
  return sub_24FC138C0();
}

uint64_t sub_24FC13914()
{
  return sub_24FC13898();
}

uint64_t sub_24FC1391C()
{
  return sub_24FC4FD28();
}

uint64_t sub_24FC13970()
{
  return swift_getGenericMetadata();
}

uint64_t dispatch thunk of static _GenerativeFunctionExtractable.id.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of static _GenerativeFunctionExtractable.syntaxTree.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t _GenerativeFunctionOverridableInternals_CompletionPrompt.prompt.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_24FC14450(MEMORY[0x263F61F60], a1);
}

uint64_t _GenerativeFunctionOverridableInternals_CompletionPrompt.init(prompt:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_24FC144D0(a1, MEMORY[0x263F61F60], a2);
}

uint64_t sub_24FC139F8()
{
  return 0;
}

uint64_t sub_24FC13A04()
{
  return 0x74706D6F7270;
}

uint64_t sub_24FC13A1C()
{
  return sub_24FC138C0();
}

uint64_t sub_24FC13A40@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24FC13EFC(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_24FC13A6C()
{
  return sub_24FC139F8();
}

uint64_t sub_24FC13A88@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_24FC13890();
  *a1 = result & 1;
  return result;
}

uint64_t sub_24FC13AB4(uint64_t a1)
{
  unint64_t v2 = sub_24FC13C80();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24FC13AF0(uint64_t a1)
{
  unint64_t v2 = sub_24FC13C80();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t _GenerativeFunctionOverridableInternals_CompletionPrompt.encode(to:)(void *a1)
{
  sub_24FC13C3C(&qword_269A5CAC0);
  sub_24FC14ED0();
  MEMORY[0x270FA5388]();
  sub_24FC0CC3C(a1, a1[3]);
  unint64_t v2 = sub_24FC13C80();
  sub_24FC15054((uint64_t)&type metadata for _GenerativeFunctionOverridableInternals_CompletionPrompt.CodingKeys, v3, v2);
  sub_24FC4F6D8();
  uint64_t v4 = sub_24FC14360(&qword_269A5CAD0, MEMORY[0x263F61F60]);
  sub_24FC14FE4(v4, v5);
  uint64_t v6 = sub_24FC14FC8();
  return v7(v6);
}

uint64_t sub_24FC13C3C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_24FC13C80()
{
  unint64_t result = qword_269A5CAC8;
  if (!qword_269A5CAC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A5CAC8);
  }
  return result;
}

uint64_t _GenerativeFunctionOverridableInternals_CompletionPrompt.init(from:)@<X0>(uint64_t a1@<X8>)
{
  sub_24FC15040(a1);
  sub_24FC4F6D8();
  sub_24FC14ED0();
  v18[1] = v3;
  MEMORY[0x270FA5388]();
  sub_24FC14FAC(v4, v18[0]);
  sub_24FC13C3C(&qword_269A5CAD8);
  sub_24FC14ED0();
  v18[3] = v5;
  MEMORY[0x270FA5388]();
  uint64_t v6 = sub_24FC14F90();
  type metadata accessor for _GenerativeFunctionOverridableInternals_CompletionPrompt(v6);
  MEMORY[0x270FA5388]();
  uint64_t v8 = (char *)v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24FC0CC3C(v1, v1[3]);
  unint64_t v9 = sub_24FC13C80();
  sub_24FC1501C((uint64_t)&type metadata for _GenerativeFunctionOverridableInternals_CompletionPrompt.CodingKeys, v10, v9);
  if (!v2)
  {
    uint64_t v11 = sub_24FC14360(&qword_269A5CAE0, MEMORY[0x263F61F60]);
    sub_24FC14F20(v11, v12);
    uint64_t v13 = sub_24FC14F4C();
    v14(v13);
    uint64_t v15 = sub_24FC14F00();
    v16(v15);
    sub_24FC143A8((uint64_t)v8, v18[2], (void (*)(void))type metadata accessor for _GenerativeFunctionOverridableInternals_CompletionPrompt);
  }
  return _s19GenerativeFunctions26TokenStreamProcessorCloserVwxx_0((uint64_t)v1);
}

uint64_t type metadata accessor for _GenerativeFunctionOverridableInternals_CompletionPrompt(uint64_t a1)
{
  return sub_24FC14B1C(a1, (uint64_t *)&unk_269A5CB10);
}

uint64_t sub_24FC13E9C@<X0>(uint64_t a1@<X8>)
{
  return _GenerativeFunctionOverridableInternals_CompletionPrompt.init(from:)(a1);
}

uint64_t sub_24FC13EB4(void *a1)
{
  return _GenerativeFunctionOverridableInternals_CompletionPrompt.encode(to:)(a1);
}

uint64_t _GenerativeFunctionOverridableInternals_ChatMessagesPrompt.prompt.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_24FC14450(MEMORY[0x263F61FA8], a1);
}

uint64_t _GenerativeFunctionOverridableInternals_ChatMessagesPrompt.init(prompt:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_24FC144D0(a1, MEMORY[0x263F61FA8], a2);
}

uint64_t sub_24FC13EFC(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x74706D6F7270 && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_24FC4FC78();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_24FC13F7C()
{
  return sub_24FC4FD28();
}

uint64_t sub_24FC13FBC(uint64_t a1)
{
  unint64_t v2 = sub_24FC14144();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24FC13FF8(uint64_t a1)
{
  unint64_t v2 = sub_24FC14144();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t _GenerativeFunctionOverridableInternals_ChatMessagesPrompt.encode(to:)(void *a1)
{
  sub_24FC13C3C(&qword_269A5CAE8);
  sub_24FC14ED0();
  MEMORY[0x270FA5388]();
  sub_24FC0CC3C(a1, a1[3]);
  unint64_t v2 = sub_24FC14144();
  sub_24FC15054((uint64_t)&type metadata for _GenerativeFunctionOverridableInternals_ChatMessagesPrompt.CodingKeys, v3, v2);
  sub_24FC4F708();
  uint64_t v4 = sub_24FC14360(&qword_269A5CAF8, MEMORY[0x263F61FA8]);
  sub_24FC14FE4(v4, v5);
  uint64_t v6 = sub_24FC14FC8();
  return v7(v6);
}

unint64_t sub_24FC14144()
{
  unint64_t result = qword_269A5CAF0;
  if (!qword_269A5CAF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A5CAF0);
  }
  return result;
}

uint64_t _GenerativeFunctionOverridableInternals_ChatMessagesPrompt.init(from:)@<X0>(uint64_t a1@<X8>)
{
  sub_24FC15040(a1);
  sub_24FC4F708();
  sub_24FC14ED0();
  v18[1] = v3;
  MEMORY[0x270FA5388]();
  sub_24FC14FAC(v4, v18[0]);
  sub_24FC13C3C(&qword_269A5CB00);
  sub_24FC14ED0();
  v18[3] = v5;
  MEMORY[0x270FA5388]();
  uint64_t v6 = sub_24FC14F90();
  type metadata accessor for _GenerativeFunctionOverridableInternals_ChatMessagesPrompt(v6);
  MEMORY[0x270FA5388]();
  uint64_t v8 = (char *)v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24FC0CC3C(v1, v1[3]);
  unint64_t v9 = sub_24FC14144();
  sub_24FC1501C((uint64_t)&type metadata for _GenerativeFunctionOverridableInternals_ChatMessagesPrompt.CodingKeys, v10, v9);
  if (!v2)
  {
    uint64_t v11 = sub_24FC14360(&qword_269A5CB08, MEMORY[0x263F61FA8]);
    sub_24FC14F20(v11, v12);
    uint64_t v13 = sub_24FC14F4C();
    v14(v13);
    uint64_t v15 = sub_24FC14F00();
    v16(v15);
    sub_24FC143A8((uint64_t)v8, v18[2], (void (*)(void))type metadata accessor for _GenerativeFunctionOverridableInternals_ChatMessagesPrompt);
  }
  return _s19GenerativeFunctions26TokenStreamProcessorCloserVwxx_0((uint64_t)v1);
}

uint64_t type metadata accessor for _GenerativeFunctionOverridableInternals_ChatMessagesPrompt(uint64_t a1)
{
  return sub_24FC14B1C(a1, (uint64_t *)&unk_269A5CB20);
}

uint64_t sub_24FC14360(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_24FC143A8(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  sub_24FC12084();
  (*(void (**)(uint64_t, uint64_t))(v5 + 32))(a2, a1);
  return a2;
}

uint64_t sub_24FC14408@<X0>(uint64_t a1@<X8>)
{
  return _GenerativeFunctionOverridableInternals_ChatMessagesPrompt.init(from:)(a1);
}

uint64_t sub_24FC14420(void *a1)
{
  return _GenerativeFunctionOverridableInternals_ChatMessagesPrompt.encode(to:)(a1);
}

uint64_t _GenerativeFunctionInternals_Metadata.functionIdentifier.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_24FC14450(MEMORY[0x263F40CA8], a1);
}

uint64_t sub_24FC14450@<X0>(void (*a1)(void)@<X0>, uint64_t a2@<X8>)
{
  a1(0);
  sub_24FC12084();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
  return v6(a2, v2, v4);
}

uint64_t _GenerativeFunctionInternals_Metadata.init(functionIdentifier:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_24FC144D0(a1, MEMORY[0x263F40CA8], a2);
}

uint64_t sub_24FC144D0@<X0>(uint64_t a1@<X0>, void (*a2)(void)@<X1>, uint64_t a3@<X8>)
{
  a2(0);
  sub_24FC12084();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 32);
  return v7(a3, a1, v5);
}

uint64_t initializeBufferWithCopyOfBuffer for _GenerativeFunctionOverridableInternals_CompletionPrompt()
{
  return sub_24FC147F0();
}

uint64_t destroy for _GenerativeFunctionOverridableInternals_CompletionPrompt(uint64_t a1, uint64_t a2)
{
  return sub_24FC14864(a1, a2, MEMORY[0x263F61F60]);
}

uint64_t initializeWithCopy for _GenerativeFunctionOverridableInternals_CompletionPrompt()
{
  return sub_24FC148DC();
}

uint64_t assignWithCopy for _GenerativeFunctionOverridableInternals_CompletionPrompt()
{
  return sub_24FC14940();
}

uint64_t initializeWithTake for _GenerativeFunctionOverridableInternals_CompletionPrompt()
{
  return sub_24FC149A4();
}

uint64_t assignWithTake for _GenerativeFunctionOverridableInternals_CompletionPrompt()
{
  return sub_24FC14A08();
}

uint64_t getEnumTagSinglePayload for _GenerativeFunctionOverridableInternals_CompletionPrompt(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24FC145DC);
}

uint64_t sub_24FC145DC()
{
  sub_24FC4F6D8();
  uint64_t v0 = sub_24FC1500C();
  return _s19GenerativeFunctions24JsonObjectFieldContainerOwet_0(v0, v1, v2);
}

uint64_t storeEnumTagSinglePayload for _GenerativeFunctionOverridableInternals_CompletionPrompt(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24FC14630);
}

uint64_t sub_24FC14630()
{
  sub_24FC4F6D8();
  uint64_t v0 = sub_24FC14F6C();
  return _s19GenerativeFunctions24JsonObjectFieldContainerOwst_0(v0, v1, v2, v3);
}

uint64_t sub_24FC14670(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24FC14B68(a1, a2, a3, MEMORY[0x263F61F60]);
}

uint64_t initializeBufferWithCopyOfBuffer for _GenerativeFunctionOverridableInternals_ChatMessagesPrompt()
{
  return sub_24FC147F0();
}

uint64_t destroy for _GenerativeFunctionOverridableInternals_ChatMessagesPrompt(uint64_t a1, uint64_t a2)
{
  return sub_24FC14864(a1, a2, MEMORY[0x263F61FA8]);
}

uint64_t initializeWithCopy for _GenerativeFunctionOverridableInternals_ChatMessagesPrompt()
{
  return sub_24FC148DC();
}

uint64_t assignWithCopy for _GenerativeFunctionOverridableInternals_ChatMessagesPrompt()
{
  return sub_24FC14940();
}

uint64_t initializeWithTake for _GenerativeFunctionOverridableInternals_ChatMessagesPrompt()
{
  return sub_24FC149A4();
}

uint64_t assignWithTake for _GenerativeFunctionOverridableInternals_ChatMessagesPrompt()
{
  return sub_24FC14A08();
}

uint64_t getEnumTagSinglePayload for _GenerativeFunctionOverridableInternals_ChatMessagesPrompt(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24FC1472C);
}

uint64_t sub_24FC1472C()
{
  sub_24FC4F708();
  uint64_t v0 = sub_24FC1500C();
  return _s19GenerativeFunctions24JsonObjectFieldContainerOwet_0(v0, v1, v2);
}

uint64_t storeEnumTagSinglePayload for _GenerativeFunctionOverridableInternals_ChatMessagesPrompt(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24FC14780);
}

uint64_t sub_24FC14780()
{
  sub_24FC4F708();
  uint64_t v0 = sub_24FC14F6C();
  return _s19GenerativeFunctions24JsonObjectFieldContainerOwst_0(v0, v1, v2, v3);
}

uint64_t sub_24FC147C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24FC14B68(a1, a2, a3, MEMORY[0x263F61FA8]);
}

uint64_t initializeBufferWithCopyOfBuffer for _GenerativeFunctionInternals_Metadata()
{
  return sub_24FC147F0();
}

uint64_t sub_24FC147F0()
{
  uint64_t v2 = sub_24FC14EEC();
  v3(v2);
  sub_24FC12084();
  uint64_t v6 = *v5;
  return v6(v1, v0, v4);
}

uint64_t destroy for _GenerativeFunctionInternals_Metadata(uint64_t a1, uint64_t a2)
{
  return sub_24FC14864(a1, a2, MEMORY[0x263F40CA8]);
}

uint64_t sub_24FC14864(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  sub_24FC12084();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 8);
  return v6(a1, v4);
}

uint64_t initializeWithCopy for _GenerativeFunctionInternals_Metadata()
{
  return sub_24FC148DC();
}

uint64_t sub_24FC148DC()
{
  uint64_t v1 = sub_24FC14EEC();
  v2(v1);
  sub_24FC12084();
  uint64_t v3 = sub_24FC14F80();
  v4(v3);
  return v0;
}

uint64_t assignWithCopy for _GenerativeFunctionInternals_Metadata()
{
  return sub_24FC14940();
}

uint64_t sub_24FC14940()
{
  uint64_t v1 = sub_24FC14EEC();
  v2(v1);
  sub_24FC12084();
  uint64_t v3 = sub_24FC14F80();
  v4(v3);
  return v0;
}

uint64_t initializeWithTake for _GenerativeFunctionInternals_Metadata()
{
  return sub_24FC149A4();
}

uint64_t sub_24FC149A4()
{
  uint64_t v1 = sub_24FC14EEC();
  v2(v1);
  sub_24FC12084();
  uint64_t v3 = sub_24FC14F80();
  v4(v3);
  return v0;
}

uint64_t assignWithTake for _GenerativeFunctionInternals_Metadata()
{
  return sub_24FC14A08();
}

uint64_t sub_24FC14A08()
{
  uint64_t v1 = sub_24FC14EEC();
  v2(v1);
  sub_24FC12084();
  uint64_t v3 = sub_24FC14F80();
  v4(v3);
  return v0;
}

uint64_t getEnumTagSinglePayload for _GenerativeFunctionInternals_Metadata(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24FC14A68);
}

uint64_t sub_24FC14A68()
{
  sub_24FC4F4A8();
  uint64_t v0 = sub_24FC1500C();
  return _s19GenerativeFunctions24JsonObjectFieldContainerOwet_0(v0, v1, v2);
}

uint64_t storeEnumTagSinglePayload for _GenerativeFunctionInternals_Metadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24FC14ABC);
}

uint64_t sub_24FC14ABC()
{
  sub_24FC4F4A8();
  uint64_t v0 = sub_24FC14F6C();
  return _s19GenerativeFunctions24JsonObjectFieldContainerOwst_0(v0, v1, v2, v3);
}

uint64_t type metadata accessor for _GenerativeFunctionInternals_Metadata(uint64_t a1)
{
  return sub_24FC14B1C(a1, (uint64_t *)&unk_269A5CB30);
}

uint64_t sub_24FC14B1C(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24FC14B50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24FC14B68(a1, a2, a3, MEMORY[0x263F40CA8]);
}

uint64_t sub_24FC14B68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t))
{
  uint64_t result = a4(319);
  if (v5 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for _GenerativeFunctionOverridableInternals_ChatMessagesPrompt.CodingKeys()
{
  return &type metadata for _GenerativeFunctionOverridableInternals_ChatMessagesPrompt.CodingKeys;
}

unsigned char *_s19GenerativeFunctions58_GenerativeFunctionOverridableInternals_ChatMessagesPromptV10CodingKeysOwst_0(unsigned char *result, int a2, int a3)
{
  if ((a3 + 1) >= 0x10000) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) < 0x100) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2)
  {
    switch(v5)
    {
      case 1:
        *uint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)uint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)uint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *uint64_t result = 0;
      break;
    case 2:
      *(_WORD *)uint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x24FC14CACLL);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for _GenerativeFunctionOverridableInternals_CompletionPrompt.CodingKeys()
{
  return &type metadata for _GenerativeFunctionOverridableInternals_CompletionPrompt.CodingKeys;
}

unint64_t sub_24FC14CE8()
{
  unint64_t result = qword_269A5CB40;
  if (!qword_269A5CB40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A5CB40);
  }
  return result;
}

unint64_t sub_24FC14D38()
{
  unint64_t result = qword_269A5CB48;
  if (!qword_269A5CB48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A5CB48);
  }
  return result;
}

unint64_t sub_24FC14D88()
{
  unint64_t result = qword_269A5CB50;
  if (!qword_269A5CB50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A5CB50);
  }
  return result;
}

unint64_t sub_24FC14DD8()
{
  unint64_t result = qword_269A5CB58;
  if (!qword_269A5CB58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A5CB58);
  }
  return result;
}

unint64_t sub_24FC14E28()
{
  unint64_t result = qword_269A5CB60;
  if (!qword_269A5CB60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A5CB60);
  }
  return result;
}

unint64_t sub_24FC14E78()
{
  unint64_t result = qword_269A5CB68;
  if (!qword_269A5CB68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A5CB68);
  }
  return result;
}

uint64_t sub_24FC14EEC()
{
  return 0;
}

uint64_t sub_24FC14F00()
{
  return v0;
}

uint64_t sub_24FC14F20(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270F9F318](v2, a2, v3, v2, a1);
}

uint64_t sub_24FC14F4C()
{
  return v0;
}

uint64_t sub_24FC14F6C()
{
  return v0;
}

uint64_t sub_24FC14F80()
{
  return v0;
}

uint64_t sub_24FC14F90()
{
  return 0;
}

void sub_24FC14FAC(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 72) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t sub_24FC14FC8()
{
  return v0;
}

uint64_t sub_24FC14FE4(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270F9F458](v4, a2, v2, v3, a1);
}

uint64_t sub_24FC1500C()
{
  return v0;
}

uint64_t sub_24FC1501C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270F9FD70](a1, a1, a3, v3, v4);
}

uint64_t sub_24FC15040@<X0>(uint64_t a1@<X8>)
{
  *(void *)(v1 - 96) = a1;
  return 0;
}

uint64_t sub_24FC15054(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270F9FD98](a1, a1, a3, v3, v4);
}

uint64_t static _GenerativeFunctionOverrideHelpers._generateGenerativeFunctionOverride(promptBody:identifier:)()
{
  uint64_t v2 = sub_24FC159DC();
  type metadata accessor for _GenerativeFunctionOverridableInternals_ChatMessagesPrompt(v2);
  sub_24FC12084();
  MEMORY[0x270FA5388]();
  sub_24FC15970();
  sub_24FC4F708();
  sub_24FC12084();
  uint64_t v3 = sub_24FC15A08();
  v4(v3);
  sub_24FC4F338();
  swift_allocObject();
  sub_24FC4F328();
  uint64_t v5 = sub_24FC1587C(&qword_269A5CB70, (void (*)(uint64_t))type metadata accessor for _GenerativeFunctionOverridableInternals_ChatMessagesPrompt);
  sub_24FC159A8(v5);
  sub_24FC1530C(v1, (void (*)(void))type metadata accessor for _GenerativeFunctionOverridableInternals_ChatMessagesPrompt);
  swift_release();
  if (!v0) {
    swift_bridgeObjectRetain();
  }
  return sub_24FC1598C();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void (*v4)(uint64_t);
  uint64_t v5;

  uint64_t v2 = sub_24FC159DC();
  type metadata accessor for _GenerativeFunctionOverridableInternals_CompletionPrompt(v2);
  sub_24FC12084();
  MEMORY[0x270FA5388]();
  sub_24FC15970();
  sub_24FC4F6D8();
  sub_24FC12084();
  uint64_t v3 = sub_24FC15A08();
  v4(v3);
  sub_24FC4F338();
  swift_allocObject();
  sub_24FC4F328();
  uint64_t v5 = sub_24FC1587C(&qword_269A5CB78, (void (*)(uint64_t))type metadata accessor for _GenerativeFunctionOverridableInternals_CompletionPrompt);
  sub_24FC159A8(v5);
  sub_24FC1530C(v1, (void (*)(void))type metadata accessor for _GenerativeFunctionOverridableInternals_CompletionPrompt);
  swift_release();
  if (!v0) {
    swift_bridgeObjectRetain();
  }
  return sub_24FC1598C();
}

uint64_t sub_24FC1530C(uint64_t a1, void (*a2)(void))
{
  a2(0);
  sub_24FC12084();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t static _GenerativeFunctionOverrideHelpers._configurePrompt(_:withOverride:bindingVariables:)()
{
  sub_24FC15A1C();
  sub_24FC4F7A8();
  sub_24FC159F4();
  static _GenerativeFunctionOverrideHelpers._configurePrompt(_:withOverride:bindingVariables:bindingConfigurations:)(v0, v1, v2);
  return swift_bridgeObjectRelease();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t vars8;

  sub_24FC15A1C();
  sub_24FC13C3C(&qword_269A5CB80);
  uint64_t v1 = MEMORY[0x263F8EE78];
  uint64_t v2 = sub_24FC4F7A8();
  sub_24FC4F7A8();
  uint64_t v3 = sub_24FC159F4();
  static _GenerativeFunctionOverrideHelpers._configurePrompt(_:withOverride:bindingChatMessagesPrompts:bindingVariables:bindingConfigurations:)(v3, v2, v0, v1, v4);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t static _GenerativeFunctionOverrideHelpers._configurePrompt(_:withOverride:bindingVariables:bindingConfigurations:)@<X0>(uint64_t a1@<X2>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  v18[2] = a3;
  v18[3] = a2;
  v18[1] = a1;
  uint64_t v3 = sub_24FC4F798();
  sub_24FC14ED0();
  uint64_t v5 = v4;
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v7 = (char *)v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_24FC4F6D8();
  sub_24FC14ED0();
  uint64_t v10 = v9;
  uint64_t v11 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v13 = (char *)v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)v18 - v14;
  sub_24FC4F6C8();
  sub_24FC1587C(&qword_26B1FD7B0, MEMORY[0x263F61F60]);
  sub_24FC4F758();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v3);
  sub_24FC4F768();
  unsigned int v16 = *(void (**)(char *, uint64_t))(v10 + 8);
  v16(v13, v8);
  sub_24FC4F778();
  return ((uint64_t (*)(char *, uint64_t))v16)(v15, v8);
}

uint64_t static _GenerativeFunctionOverrideHelpers._configurePrompt(_:withOverride:bindingChatMessagesPrompts:bindingVariables:bindingConfigurations:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  void v18[4] = a5;
  v18[5] = a4;
  v18[2] = a2;
  v18[3] = a3;
  v18[1] = a1;
  uint64_t v5 = sub_24FC4F798();
  sub_24FC14ED0();
  uint64_t v7 = v6;
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24FC4F708();
  sub_24FC14ED0();
  uint64_t v12 = v11;
  uint64_t v14 = MEMORY[0x270FA5388](v13);
  uint64_t v15 = MEMORY[0x270FA5388](v14);
  MEMORY[0x270FA5388](v15);
  sub_24FC4F6F8();
  sub_24FC1587C(qword_269A5C9B8, MEMORY[0x263F61FA8]);
  sub_24FC15A30();
  sub_24FC4F758();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v5);
  sub_24FC15A30();
  sub_24FC4F788();
  unsigned int v16 = *(void (**)(void))(v12 + 8);
  sub_24FC159CC();
  v16();
  sub_24FC15A30();
  sub_24FC4F768();
  sub_24FC159CC();
  v16();
  sub_24FC15A30();
  sub_24FC4F778();
  sub_24FC159CC();
  return ((uint64_t (*)(void))v16)();
}

uint64_t sub_24FC1587C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t static _GenerativeFunctionOverrideHelpers._configurePrompt(_:withOverride:bindingChatMessagesPrompts:bindingVariables:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v8 = sub_24FC4F7A8();
  static _GenerativeFunctionOverrideHelpers._configurePrompt(_:withOverride:bindingChatMessagesPrompts:bindingVariables:bindingConfigurations:)(a1, a2, a3, v8, a4);
  return swift_bridgeObjectRelease();
}

ValueMetadata *type metadata accessor for _GenerativeFunctionOverrideHelpers()
{
  return &type metadata for _GenerativeFunctionOverrideHelpers;
}

uint64_t sub_24FC15970()
{
  return 0;
}

uint64_t sub_24FC1598C()
{
  return v0;
}

uint64_t sub_24FC159A8(uint64_t a1)
{
  return MEMORY[0x270EEDEE8](v1, v2, a1);
}

uint64_t sub_24FC159DC()
{
  return 0;
}

uint64_t sub_24FC159F4()
{
  return v0;
}

uint64_t sub_24FC15A08()
{
  return v0;
}

uint64_t sub_24FC15A40()
{
  return sub_24FC4FD28();
}

uint64_t static GenerativeStream.makeStream(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[9] = a3;
  v4[10] = a4;
  v4[7] = a1;
  v4[8] = a2;
  return sub_24FC12058((uint64_t)sub_24FC15A98);
}

uint64_t sub_24FC15A98()
{
  sub_24FC12030();
  sub_24FC16C50();
  swift_task_alloc();
  sub_24FC16C44();
  *(void *)(v0 + 88) = v1;
  *uint64_t v1 = v2;
  v1[1] = sub_24FC15B2C;
  sub_24FC16C68();
  return static GenerativeStream.makeStream(_:timeout:sanitizer:)();
}

uint64_t sub_24FC15B2C()
{
  sub_24FC12030();
  sub_24FC0BAB0();
  sub_24FC1204C();
  *uint64_t v3 = v2;
  uint64_t v4 = v2 + 16;
  uint64_t v5 = *v1;
  sub_24FC1204C();
  *uint64_t v6 = v5;
  *(void *)(v7 + 96) = v0;
  swift_task_dealloc();
  sub_24FC1601C(v4);
  if (v0)
  {
    sub_24FC12064();
    return MEMORY[0x270FA2498](v8, v9, v10);
  }
  else
  {
    sub_24FC0BAC8();
    return v11();
  }
}

uint64_t sub_24FC15C34()
{
  sub_24FC0BAC8();
  return v0();
}

uint64_t static GenerativeStream.makeStream(_:timeout:sanitizer:)()
{
  sub_24FC12030();
  *(void *)(v0 + 88) = v1;
  *(void *)(v0 + 96) = v2;
  *(unsigned char *)(v0 + 136) = v3;
  *(void *)(v0 + 72) = v4;
  *(void *)(v0 + 80) = v5;
  *(void *)(v0 + 56) = v6;
  *(void *)(v0 + 64) = v7;
  sub_24FC1607C(&qword_269A5CBA0);
  sub_24FC4FAD8();
  *(void *)(v0 + 104) = sub_24FC12200();
  sub_24FC12064();
  return MEMORY[0x270FA2498](v8, v9, v10);
}

uint64_t sub_24FC15CFC()
{
  sub_24FC12240();
  uint64_t v1 = v0[8];
  sub_24FC160C4(v0[10], (uint64_t)(v0 + 2));
  type metadata accessor for StreamingObjectTokenStreamProcessor(0);
  swift_allocObject();
  v0[14] = StreamingObjectTokenStreamProcessor.init(_:)((uint64_t)(v0 + 2));
  sub_24FC3ADE4(v1);
  swift_task_alloc();
  sub_24FC16C44();
  v0[15] = v2;
  void *v2 = v3;
  v2[1] = sub_24FC15E40;
  return sub_24FC3C560();
}

uint64_t sub_24FC15E40()
{
  sub_24FC12030();
  sub_24FC0BAB0();
  sub_24FC1204C();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  sub_24FC1204C();
  *uint64_t v5 = v4;
  *(void *)(v6 + 128) = v0;
  swift_task_dealloc();
  sub_24FC12064();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_24FC15F20()
{
  sub_24FC12240();
  sub_24FC4F418();
  swift_task_dealloc();
  sub_24FC0BAC8();
  return v0();
}

uint64_t sub_24FC15FB8()
{
  sub_24FC12030();
  swift_release();
  swift_task_dealloc();
  sub_24FC0BAC8();
  return v0();
}

uint64_t sub_24FC1601C(uint64_t a1)
{
  uint64_t v2 = sub_24FC13C3C(&qword_269A5CB98);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24FC1607C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_24FC160C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24FC13C3C(&qword_269A5CB98);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t static GenerativeStream.makeSingleElementStream(_:produces:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[10] = a4;
  v5[11] = a5;
  v5[8] = a2;
  v5[9] = a3;
  v5[7] = a1;
  return sub_24FC12058((uint64_t)sub_24FC1614C);
}

uint64_t sub_24FC1614C()
{
  sub_24FC12030();
  sub_24FC16C50();
  swift_task_alloc();
  sub_24FC16C44();
  *(void *)(v0 + 96) = v1;
  *uint64_t v1 = v2;
  v1[1] = sub_24FC161E0;
  sub_24FC16C68();
  return static GenerativeStream.makeSingleElementStream(_:timeout:produces:sanitizer:)();
}

uint64_t sub_24FC161E0()
{
  sub_24FC12030();
  sub_24FC0BAB0();
  sub_24FC1204C();
  *uint64_t v3 = v2;
  uint64_t v4 = v2 + 16;
  uint64_t v5 = *v1;
  sub_24FC1204C();
  *uint64_t v6 = v5;
  *(void *)(v7 + 104) = v0;
  swift_task_dealloc();
  sub_24FC1601C(v4);
  if (v0)
  {
    sub_24FC12064();
    return MEMORY[0x270FA2498](v8, v9, v10);
  }
  else
  {
    sub_24FC0BAC8();
    return v11();
  }
}

uint64_t sub_24FC162E8()
{
  sub_24FC0BAC8();
  return v0();
}

uint64_t static GenerativeStream.makeSingleElementStream(_:timeout:produces:sanitizer:)()
{
  sub_24FC12240();
  *(void *)(v0 + 96) = v1;
  *(void *)(v0 + 104) = v2;
  *(unsigned char *)(v0 + 208) = v3;
  *(void *)(v0 + 80) = v4;
  *(void *)(v0 + 88) = v5;
  *(void *)(v0 + 64) = v6;
  *(void *)(v0 + 72) = v7;
  sub_24FC4FB08();
  *(void *)(v0 + 112) = sub_24FC12200();
  sub_24FC1607C(&qword_269A5CBA0);
  sub_24FC16C7C();
  uint64_t v8 = sub_24FC4FAD8();
  *(void *)(v0 + 120) = v8;
  sub_24FC12018(v8);
  *(void *)(v0 + 128) = v9;
  *(void *)(v0 + 136) = sub_24FC12200();
  sub_24FC16C7C();
  uint64_t v10 = sub_24FC4FAB8();
  *(void *)(v0 + 144) = v10;
  sub_24FC12018(v10);
  *(void *)(v0 + 152) = v11;
  *(void *)(v0 + 160) = sub_24FC12200();
  sub_24FC12064();
  return MEMORY[0x270FA2498](v12, v13, v14);
}

uint64_t sub_24FC16418()
{
  sub_24FC12240();
  uint64_t v1 = v0[9];
  sub_24FC160C4(v0[11], (uint64_t)(v0 + 2));
  type metadata accessor for StreamingObjectTokenStreamProcessor(0);
  swift_allocObject();
  v0[21] = StreamingObjectTokenStreamProcessor.init(_:)((uint64_t)(v0 + 2));
  sub_24FC3ADE4(v1);
  swift_task_alloc();
  sub_24FC16C44();
  v0[22] = v2;
  void *v2 = v3;
  v2[1] = sub_24FC16574;
  return sub_24FC3C560();
}

uint64_t sub_24FC16574()
{
  sub_24FC12030();
  sub_24FC0BAB0();
  sub_24FC1204C();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  sub_24FC1204C();
  *uint64_t v5 = v4;
  *(void *)(v6 + 184) = v0;
  swift_task_dealloc();
  sub_24FC12064();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_24FC16654()
{
  sub_24FC12240();
  uint64_t v2 = v0[16];
  uint64_t v1 = v0[17];
  uint64_t v3 = v0[15];
  sub_24FC4F9B8();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_alloc();
  sub_24FC16C44();
  v0[24] = v4;
  *uint64_t v4 = v5;
  v4[1] = sub_24FC1672C;
  sub_24FC12064();
  return MEMORY[0x270FA20F8]();
}

uint64_t sub_24FC1672C()
{
  sub_24FC12030();
  sub_24FC0BAB0();
  sub_24FC1204C();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  sub_24FC1204C();
  *uint64_t v5 = v4;
  *(void *)(v6 + 200) = v0;
  swift_task_dealloc();
  sub_24FC12064();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_24FC1680C()
{
  uint64_t v1 = v0[14];
  uint64_t v2 = v0[12];
  if (_s19GenerativeFunctions24JsonObjectFieldContainerOwet_0(v1, 1, v2) == 1)
  {
    (*(void (**)(void, void))(v0[19] + 8))(v0[20], v0[18]);
    _s21GenerativeStreamErrorOMa();
    swift_getWitnessTable();
    swift_allocError();
    swift_willThrow();
    swift_release();
LABEL_5:
    sub_24FC16C28();
    swift_task_dealloc();
    swift_task_dealloc();
    sub_24FC0BAC8();
    goto LABEL_7;
  }
  uint64_t v3 = v0[25];
  uint64_t v4 = *(void *)(v2 - 8);
  (*(void (**)(void, uint64_t, uint64_t))(v4 + 32))(v0[8], v1, v2);
  sub_24FC4F9F8();
  if (v3)
  {
    uint64_t v5 = v0[12];
    uint64_t v6 = v0[8];
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v6, v5);
    uint64_t v7 = sub_24FC16C90();
    v8(v7);
    goto LABEL_5;
  }
  uint64_t v10 = sub_24FC16C90();
  v11(v10);
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_24FC0BAC8();
LABEL_7:
  return v9();
}

uint64_t sub_24FC16A18()
{
  sub_24FC12240();
  swift_release();
  sub_24FC16C28();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_24FC0BAC8();
  return v0();
}

uint64_t sub_24FC16A90()
{
  sub_24FC12240();
  uint64_t v1 = v0[20];
  uint64_t v2 = v0[18];
  uint64_t v3 = v0[19];
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  sub_24FC16C28();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_24FC0BAC8();
  return v4();
}

uint64_t _s21GenerativeStreamErrorOMa()
{
  return sub_24FC13970();
}

uint64_t sub_24FC16B40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 16);
}

unsigned char *sub_24FC16B48(unsigned char *result, int a2, int a3)
{
  if ((a3 + 1) >= 0x10000) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) < 0x100) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2)
  {
    switch(v5)
    {
      case 1:
        *uint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)uint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)uint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *uint64_t result = 0;
      break;
    case 2:
      *(_WORD *)uint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x24FC16BE4);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_24FC16C0C()
{
  return swift_getWitnessTable();
}

uint64_t sub_24FC16C28()
{
  return swift_task_dealloc();
}

double sub_24FC16C50()
{
  *(void *)(v0 + 48) = 0;
  double result = 0.0;
  *(_OWORD *)(v0 + 32) = 0u;
  *(_OWORD *)(v0 + 16) = 0u;
  return result;
}

uint64_t sub_24FC16C68()
{
  return *(void *)(v0 + 56);
}

uint64_t sub_24FC16C7C()
{
  return 0;
}

uint64_t sub_24FC16C90()
{
  return v0;
}

uint64_t *initializeBufferWithCopyOfBuffer for JsonObjectFieldContainer(uint64_t *a1, char *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v11 = *(void *)a2;
    *a1 = *(void *)a2;
    a1 = (uint64_t *)(v11 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = *(void *)(a3 - 8);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2 || EnumCaseMultiPayload == 1)
    {
      uint64_t v12 = sub_24FC4F388();
      (*(void (**)(uint64_t *, char *, uint64_t))(*(void *)(v12 - 8) + 16))(a1, a2, v12);
    }
    else
    {
      if (EnumCaseMultiPayload)
      {
        memcpy(a1, a2, *(void *)(v6 + 64));
        return a1;
      }
      uint64_t v8 = *(void *)a2;
      uint64_t v9 = *((void *)a2 + 1);
      char v10 = a2[16];
      sub_24FC16E30(v8, v9, v10);
      *a1 = v8;
      a1[1] = v9;
      *((unsigned char *)a1 + 16) = v10;
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_24FC16E30(uint64_t a1, uint64_t a2, char a3)
{
  if (!a3) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t destroy for JsonObjectFieldContainer(uint64_t a1)
{
  uint64_t result = swift_getEnumCaseMultiPayload();
  if (result == 2 || result == 1)
  {
    uint64_t v6 = sub_24FC4F388();
    uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);
    return v7(a1, v6);
  }
  else if (!result)
  {
    uint64_t v3 = *(void *)a1;
    uint64_t v4 = *(void *)(a1 + 8);
    char v5 = *(unsigned char *)(a1 + 16);
    return sub_24FC16EF0(v3, v4, v5);
  }
  return result;
}

uint64_t sub_24FC16EF0(uint64_t a1, uint64_t a2, char a3)
{
  if (!a3) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t *initializeWithCopy for JsonObjectFieldContainer(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 2 || EnumCaseMultiPayload == 1)
  {
    uint64_t v10 = sub_24FC4F388();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v10 - 8) + 16))(a1, a2, v10);
  }
  else
  {
    if (EnumCaseMultiPayload)
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
      return a1;
    }
    uint64_t v7 = *a2;
    uint64_t v8 = a2[1];
    char v9 = *((unsigned char *)a2 + 16);
    sub_24FC16E30(v7, v8, v9);
    *a1 = v7;
    a1[1] = v8;
    *((unsigned char *)a1 + 16) = v9;
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t *assignWithCopy for JsonObjectFieldContainer(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_24FC171A4((uint64_t)a1);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2 || EnumCaseMultiPayload == 1)
    {
      uint64_t v10 = sub_24FC4F388();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v10 - 8) + 16))(a1, a2, v10);
    }
    else
    {
      if (EnumCaseMultiPayload)
      {
        memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
        return a1;
      }
      uint64_t v7 = *a2;
      uint64_t v8 = a2[1];
      char v9 = *((unsigned char *)a2 + 16);
      sub_24FC16E30(v7, v8, v9);
      *a1 = v7;
      a1[1] = v8;
      *((unsigned char *)a1 + 16) = v9;
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_24FC171A4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for JsonObjectFieldContainer();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for JsonObjectFieldContainer()
{
  uint64_t result = qword_269A5CC38;
  if (!qword_269A5CC38) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void *initializeWithTake for JsonObjectFieldContainer(void *a1, const void *a2, uint64_t a3)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 2 || EnumCaseMultiPayload == 1)
  {
    uint64_t v7 = sub_24FC4F388();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  return a1;
}

void *assignWithTake for JsonObjectFieldContainer(void *a1, const void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_24FC171A4((uint64_t)a1);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2 || EnumCaseMultiPayload == 1)
    {
      uint64_t v7 = sub_24FC4F388();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_24FC1747C()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_24FC1748C()
{
  uint64_t result = sub_24FC4F388();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

void JsonStreamDescriptor.fieldType.getter(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t JsonStreamDescriptor.fields.getter()
{
  return swift_bridgeObjectRetain();
}

GenerativeFunctions::JsonStreamDescriptor __swiftcall JsonStreamDescriptor.init(fieldType:fields:)(GenerativeFunctions::JsonObjectFieldType fieldType, Swift::OpaquePointer fields)
{
  *(unsigned char *)uint64_t v2 = *(unsigned char *)fieldType;
  *(Swift::OpaquePointer *)(v2 + 8) = fields;
  result.fields = fields;
  result.fieldType = fieldType;
  return result;
}

uint64_t static JsonStreamDescriptor.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *(void *)(a2 + 8);
  if (*(void *)(v2 + 16) != *(void *)(v3 + 16)) {
    return 0;
  }
  swift_bridgeObjectRetain();
  uint64_t v4 = swift_bridgeObjectRetain();
  char v5 = sub_24FC177A4(v4, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v5) {
    return 0;
  }
  uint64_t v6 = v2 + 64;
  uint64_t v7 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v8 = -1;
  if (v7 < 64) {
    uint64_t v8 = ~(-1 << v7);
  }
  unint64_t v9 = v8 & *(void *)(v2 + 64);
  int64_t v29 = (unint64_t)(v7 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v11 = 0;
  while (1)
  {
    if (v9)
    {
      unint64_t v12 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      unint64_t v13 = v12 | (v11 << 6);
      goto LABEL_22;
    }
    int64_t v14 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_31;
    }
    if (v14 >= v29) {
      goto LABEL_29;
    }
    unint64_t v15 = *(void *)(v6 + 8 * v14);
    ++v11;
    if (!v15)
    {
      int64_t v11 = v14 + 1;
      if (v14 + 1 >= v29) {
        goto LABEL_29;
      }
      unint64_t v15 = *(void *)(v6 + 8 * v11);
      if (!v15)
      {
        int64_t v11 = v14 + 2;
        if (v14 + 2 >= v29) {
          goto LABEL_29;
        }
        unint64_t v15 = *(void *)(v6 + 8 * v11);
        if (!v15) {
          break;
        }
      }
    }
LABEL_21:
    unint64_t v9 = (v15 - 1) & v15;
    unint64_t v13 = __clz(__rbit64(v15)) + (v11 << 6);
LABEL_22:
    if (!*(void *)(v3 + 16)) {
      goto LABEL_25;
    }
    int v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v13);
    uint64_t v18 = *(void *)(v2 + 56) + 16 * v13;
    char v19 = *(unsigned char *)v18;
    uint64_t v20 = *(void *)(v18 + 8);
    uint64_t v22 = *v17;
    uint64_t v21 = v17[1];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v23 = sub_24FC17BF4(v22, v21);
    if ((v24 & 1) == 0)
    {
      swift_bridgeObjectRelease();
      swift_release();
      swift_bridgeObjectRelease();
      return 0;
    }
    uint64_t v25 = *(void *)(v3 + 56) + 16 * v23;
    char v26 = *(unsigned char *)v25;
    uint64_t v27 = *(void *)(v25 + 8);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v32[0] = v19;
    uint64_t v33 = v20;
    v30[0] = v26;
    uint64_t v31 = v27;
    char v28 = static JsonStreamDescriptor.== infix(_:_:)(v32, v30);
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
    if ((v28 & 1) == 0)
    {
LABEL_25:
      swift_release();
      return 0;
    }
  }
  int64_t v16 = v14 + 3;
  if (v16 >= v29)
  {
LABEL_29:
    swift_release();
    return 1;
  }
  unint64_t v15 = *(void *)(v6 + 8 * v16);
  if (v15)
  {
    int64_t v11 = v16;
    goto LABEL_21;
  }
  while (1)
  {
    int64_t v11 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v11 >= v29) {
      goto LABEL_29;
    }
    unint64_t v15 = *(void *)(v6 + 8 * v11);
    ++v16;
    if (v15) {
      goto LABEL_21;
    }
  }
LABEL_31:
  __break(1u);
  return result;
}

uint64_t sub_24FC177A4(uint64_t a1, uint64_t a2)
{
  sub_24FC181A4(a2, v35);
  uint64_t v3 = v35[0];
  uint64_t v32 = v35[1];
  uint64_t v4 = v35[2];
  int64_t v5 = v35[3];
  unint64_t v6 = v35[4];
  sub_24FC181A4(a1, v36);
  uint64_t v7 = v36[0];
  int64_t v8 = v36[3];
  unint64_t v9 = v36[4];
  int64_t v33 = (unint64_t)(v36[2] + 64) >> 6;
  int64_t v34 = (unint64_t)(v4 + 64) >> 6;
  uint64_t v31 = v36[1];
  swift_bridgeObjectRetain();
  uint64_t result = swift_bridgeObjectRetain();
  while (1)
  {
    if (v6)
    {
      unint64_t v11 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      unint64_t v12 = v11 | (v5 << 6);
      goto LABEL_4;
    }
    int64_t v23 = v5 + 1;
    if (__OFADD__(v5, 1)) {
      break;
    }
    if (v23 >= v34)
    {
      unint64_t v6 = 0;
      uint64_t v15 = 0;
      uint64_t v14 = 0;
      goto LABEL_5;
    }
    unint64_t v24 = *(void *)(v32 + 8 * v23);
    if (v24) {
      goto LABEL_20;
    }
    int64_t v27 = v5 + 2;
    if (v5 + 2 >= v34)
    {
      unint64_t v6 = 0;
      uint64_t v15 = 0;
      uint64_t v14 = 0;
      ++v5;
      goto LABEL_5;
    }
    unint64_t v24 = *(void *)(v32 + 8 * v27);
    if (v24) {
      goto LABEL_29;
    }
    if (v5 + 3 >= v34)
    {
LABEL_49:
      unint64_t v6 = 0;
      uint64_t v15 = 0;
      uint64_t v14 = 0;
      int64_t v5 = v27;
      goto LABEL_5;
    }
    unint64_t v24 = *(void *)(v32 + 8 * (v5 + 3));
    if (v24)
    {
      int64_t v23 = v5 + 3;
LABEL_20:
      unint64_t v6 = (v24 - 1) & v24;
      unint64_t v12 = __clz(__rbit64(v24)) + (v23 << 6);
      int64_t v5 = v23;
LABEL_4:
      unint64_t v13 = (uint64_t *)(*(void *)(v3 + 48) + 16 * v12);
      uint64_t v15 = *v13;
      uint64_t v14 = v13[1];
      uint64_t result = swift_bridgeObjectRetain();
      goto LABEL_5;
    }
    int64_t v27 = v5 + 4;
    if (v5 + 4 >= v34)
    {
      unint64_t v6 = 0;
      uint64_t v15 = 0;
      uint64_t v14 = 0;
      v5 += 3;
    }
    else
    {
      unint64_t v24 = *(void *)(v32 + 8 * v27);
      if (v24)
      {
LABEL_29:
        int64_t v23 = v27;
        goto LABEL_20;
      }
      int64_t v23 = v5 + 5;
      if (v5 + 5 >= v34) {
        goto LABEL_49;
      }
      unint64_t v24 = *(void *)(v32 + 8 * v23);
      if (v24) {
        goto LABEL_20;
      }
      int64_t v29 = v5 + 6;
      while (v29 < v34)
      {
        unint64_t v24 = *(void *)(v32 + 8 * v29++);
        if (v24)
        {
          int64_t v23 = v29 - 1;
          goto LABEL_20;
        }
      }
      unint64_t v6 = 0;
      uint64_t v15 = 0;
      uint64_t v14 = 0;
      int64_t v5 = v34 - 1;
    }
LABEL_5:
    if (v9)
    {
      unint64_t v16 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      unint64_t v17 = v16 | (v8 << 6);
      goto LABEL_7;
    }
    int64_t v25 = v8 + 1;
    if (__OFADD__(v8, 1)) {
      goto LABEL_71;
    }
    if (v25 >= v33)
    {
      unint64_t v9 = 0;
      uint64_t v20 = 0;
      uint64_t v19 = 0;
      goto LABEL_8;
    }
    unint64_t v26 = *(void *)(v31 + 8 * v25);
    if (v26) {
      goto LABEL_24;
    }
    int64_t v28 = v8 + 2;
    if (v8 + 2 >= v33)
    {
      unint64_t v9 = 0;
      uint64_t v20 = 0;
      uint64_t v19 = 0;
      ++v8;
      goto LABEL_8;
    }
    unint64_t v26 = *(void *)(v31 + 8 * v28);
    if (v26) {
      goto LABEL_32;
    }
    if (v8 + 3 >= v33)
    {
LABEL_58:
      unint64_t v9 = 0;
      uint64_t v20 = 0;
      uint64_t v19 = 0;
      int64_t v8 = v28;
      goto LABEL_8;
    }
    unint64_t v26 = *(void *)(v31 + 8 * (v8 + 3));
    if (v26)
    {
      int64_t v25 = v8 + 3;
LABEL_24:
      unint64_t v9 = (v26 - 1) & v26;
      unint64_t v17 = __clz(__rbit64(v26)) + (v25 << 6);
      int64_t v8 = v25;
LABEL_7:
      uint64_t v18 = (uint64_t *)(*(void *)(v7 + 48) + 16 * v17);
      uint64_t v20 = *v18;
      uint64_t v19 = v18[1];
      swift_bridgeObjectRetain();
      goto LABEL_8;
    }
    int64_t v28 = v8 + 4;
    if (v8 + 4 >= v33)
    {
      unint64_t v9 = 0;
      uint64_t v20 = 0;
      uint64_t v19 = 0;
      v8 += 3;
    }
    else
    {
      unint64_t v26 = *(void *)(v31 + 8 * v28);
      if (v26)
      {
LABEL_32:
        int64_t v25 = v28;
        goto LABEL_24;
      }
      int64_t v25 = v8 + 5;
      if (v8 + 5 >= v33) {
        goto LABEL_58;
      }
      unint64_t v26 = *(void *)(v31 + 8 * v25);
      if (v26) {
        goto LABEL_24;
      }
      int64_t v30 = v8 + 6;
      while (v30 < v33)
      {
        unint64_t v26 = *(void *)(v31 + 8 * v30++);
        if (v26)
        {
          int64_t v25 = v30 - 1;
          goto LABEL_24;
        }
      }
      unint64_t v9 = 0;
      uint64_t v20 = 0;
      uint64_t v19 = 0;
      int64_t v8 = v33 - 1;
    }
LABEL_8:
    if (!v14)
    {
      swift_release();
      swift_release();
      if (!v19) {
        return 1;
      }
      goto LABEL_66;
    }
    if (!v19)
    {
      swift_release();
      swift_release();
LABEL_66:
      swift_bridgeObjectRelease();
      return 0;
    }
    if (v15 == v20 && v14 == v19)
    {
      swift_bridgeObjectRelease();
      uint64_t result = swift_bridgeObjectRelease();
    }
    else
    {
      char v22 = sub_24FC4FC78();
      swift_bridgeObjectRelease();
      uint64_t result = swift_bridgeObjectRelease();
      if ((v22 & 1) == 0)
      {
        swift_release();
        swift_release();
        return 0;
      }
    }
  }
  __break(1u);
LABEL_71:
  __break(1u);
  return result;
}

unint64_t sub_24FC17BF4(uint64_t a1, uint64_t a2)
{
  sub_24FC4FD08();
  swift_bridgeObjectRetain();
  sub_24FC4F858();
  swift_bridgeObjectRelease();
  uint64_t v4 = sub_24FC4FD28();
  return sub_24FC17ED0(a1, a2, v4);
}

uint64_t initializeBufferWithCopyOfBuffer for JsonStreamDescriptor(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for JsonStreamField()
{
  return swift_bridgeObjectRelease();
}

uint64_t assignWithCopy for JsonStreamDescriptor(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for JsonStreamField(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t assignWithTake for JsonStreamDescriptor(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for JsonStreamField(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 16))
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

uint64_t storeEnumTagSinglePayload for JsonStreamField(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 16) = 1;
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
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for JsonStreamDescriptor()
{
  return &type metadata for JsonStreamDescriptor;
}

unint64_t sub_24FC17DD4(uint64_t a1, uint64_t a2)
{
  sub_24FC4FD08();
  sub_24FC4F858();
  uint64_t v4 = sub_24FC4FD28();
  return sub_24FC17ED0(a1, a2, v4);
}

unint64_t sub_24FC17E4C(uint64_t a1)
{
  sub_24FC4F388();
  sub_24FC18160(&qword_269A5CC48);
  uint64_t v2 = sub_24FC4F7B8();
  return sub_24FC17FB4(a1, v2);
}

unint64_t sub_24FC17ED0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_24FC4FC78() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        unint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_24FC4FC78() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_24FC17FB4(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = a1;
  uint64_t v4 = sub_24FC4F388();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = v2;
  uint64_t v8 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v9 = a2 & ~v8;
  uint64_t v18 = v2 + 64;
  if ((*(void *)(v2 + 64 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9))
  {
    uint64_t v10 = ~v8;
    unint64_t v13 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
    uint64_t v12 = v5 + 16;
    BOOL v11 = v13;
    uint64_t v14 = *(void *)(v12 + 56);
    do
    {
      v11(v7, *(void *)(v20 + 48) + v14 * v9, v4);
      sub_24FC18160(&qword_269A5CC50);
      char v15 = sub_24FC4F818();
      (*(void (**)(char *, uint64_t))(v12 - 8))(v7, v4);
      if (v15) {
        break;
      }
      unint64_t v9 = (v9 + 1) & v10;
    }
    while (((*(void *)(v18 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) != 0);
  }
  return v9;
}

uint64_t sub_24FC18160(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_24FC4F388();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_24FC181A4@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v2 = -1;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  *a2 = a1;
  uint64_t v6 = *(void *)(a1 + 64);
  uint64_t result = a1 + 64;
  uint64_t v5 = v6;
  if (-v3 < 64) {
    uint64_t v2 = ~(-1 << -(char)v3);
  }
  a2[1] = result;
  a2[2] = ~v3;
  a2[3] = 0;
  a2[4] = v2 & v5;
  return result;
}

uint64_t JsonObjectFieldType.hash(into:)()
{
  return sub_24FC4FD18();
}

BOOL static JsonObjectFieldType.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t JsonObjectFieldType.hashValue.getter()
{
  return sub_24FC4FD28();
}

uint64_t sub_24FC18274()
{
  return sub_24FC4FD28();
}

uint64_t static JsonValueContainer.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(uint64_t *)a1;
  uint64_t v3 = *(void *)(a1 + 8);
  char v4 = *(unsigned char *)(a1 + 16);
  uint64_t v5 = *(uint64_t *)a2;
  uint64_t v6 = *(void *)(a2 + 8);
  int v7 = *(unsigned __int8 *)(a2 + 16);
  switch(v4)
  {
    case 1:
      if (v7 != 1) {
        goto LABEL_14;
      }
      uint64_t v8 = sub_24FC1B9AC();
      uint64_t v10 = sub_24FC1B990(v8, v9, 1);
      sub_24FC16EF0(v10, v11, 1);
      char v12 = ((v2 & 1) == 0) ^ v5;
      break;
    case 2:
      if (v7 != 2) {
        goto LABEL_14;
      }
      uint64_t v13 = sub_24FC1B9AC();
      uint64_t v15 = sub_24FC1B990(v13, v14, 2);
      sub_24FC16EF0(v15, v16, 2);
      char v12 = v2 == v5;
      break;
    case 3:
      if (v7 != 3) {
        goto LABEL_14;
      }
      uint64_t v17 = sub_24FC1B9AC();
      uint64_t v19 = sub_24FC1B990(v17, v18, 3);
      sub_24FC16EF0(v19, v20, 3);
      char v12 = *(double *)&v2 == *(double *)&v5;
      break;
    case 4:
      if (v7 != 4 || (v6 | v5) != 0) {
        goto LABEL_14;
      }
      uint64_t v27 = sub_24FC1B9AC();
      sub_24FC16EF0(v27, v28, 4);
      sub_24FC16EF0(0, 0, 4);
      char v12 = 1;
      break;
    default:
      if (*(unsigned char *)(a2 + 16))
      {
        swift_bridgeObjectRetain();
LABEL_14:
        sub_24FC16E30(v5, v6, v7);
        uint64_t v22 = sub_24FC1B9AC();
        uint64_t v24 = sub_24FC1B990(v22, v23, v4);
        sub_24FC16EF0(v24, v25, v7);
        char v12 = 0;
      }
      else
      {
        if (v2 == v5 && v3 == v6)
        {
          char v12 = 1;
        }
        else
        {
          sub_24FC1B9AC();
          char v12 = sub_24FC4FC78();
        }
        sub_24FC16E30(v5, v6, 0);
        sub_24FC16E30(v2, v3, 0);
        uint64_t v30 = sub_24FC1B990(v2, v3, 0);
        sub_24FC16EF0(v30, v31, 0);
      }
      break;
  }
  return v12 & 1;
}

uint64_t static JsonStreamEvent.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v186 = a1;
  v187 = (char *)a2;
  v171[0] = type metadata accessor for JsonFieldValueEvent(0);
  sub_24FC12084();
  MEMORY[0x270FA5388](v2);
  sub_24FC1B970();
  uint64_t v178 = v3;
  sub_24FC1B8F4();
  MEMORY[0x270FA5388](v4);
  uint64_t v179 = (uint64_t)v171 - v5;
  uint64_t v6 = sub_24FC4F388();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v184 = v6;
  uint64_t v185 = v7;
  MEMORY[0x270FA5388](v6);
  sub_24FC1B970();
  uint64_t v175 = v8;
  sub_24FC1B8F4();
  MEMORY[0x270FA5388](v9);
  sub_24FC1B900();
  uint64_t v176 = v10;
  sub_24FC1B8F4();
  MEMORY[0x270FA5388](v11);
  sub_24FC1B900();
  uint64_t v177 = v12;
  sub_24FC1B8F4();
  MEMORY[0x270FA5388](v13);
  sub_24FC1B900();
  uint64_t v180 = v14;
  sub_24FC1B8F4();
  MEMORY[0x270FA5388](v15);
  sub_24FC1B900();
  uint64_t v173 = v16;
  sub_24FC1B8F4();
  MEMORY[0x270FA5388](v17);
  sub_24FC1B900();
  uint64_t v174 = v18;
  sub_24FC1B8F4();
  MEMORY[0x270FA5388](v19);
  sub_24FC1B900();
  v171[4] = v20;
  sub_24FC1B8F4();
  MEMORY[0x270FA5388](v21);
  sub_24FC1B900();
  v171[3] = v22;
  sub_24FC1B8F4();
  MEMORY[0x270FA5388](v23);
  sub_24FC1B900();
  uint64_t v172 = v24;
  sub_24FC1B8F4();
  MEMORY[0x270FA5388](v25);
  sub_24FC1B900();
  v171[5] = v26;
  sub_24FC1B8F4();
  MEMORY[0x270FA5388](v27);
  sub_24FC1B900();
  uint64_t v181 = v28;
  sub_24FC1B8F4();
  MEMORY[0x270FA5388](v29);
  sub_24FC1B900();
  v171[2] = v30;
  sub_24FC1B8F4();
  MEMORY[0x270FA5388](v31);
  v171[1] = (char *)v171 - v32;
  type metadata accessor for JsonStreamEvent(0);
  sub_24FC12084();
  MEMORY[0x270FA5388](v33);
  sub_24FC1B970();
  uint64_t v183 = v34;
  sub_24FC1B8F4();
  MEMORY[0x270FA5388](v35);
  sub_24FC1B900();
  uint64_t v182 = v36;
  sub_24FC1B8F4();
  uint64_t v38 = MEMORY[0x270FA5388](v37);
  uint64_t v40 = (char *)v171 - v39;
  uint64_t v41 = MEMORY[0x270FA5388](v38);
  uint64_t v43 = (char *)v171 - v42;
  uint64_t v44 = MEMORY[0x270FA5388](v41);
  uint64_t v46 = (char *)v171 - v45;
  uint64_t v47 = MEMORY[0x270FA5388](v44);
  uint64_t v49 = (char *)v171 - v48;
  uint64_t v50 = MEMORY[0x270FA5388](v47);
  v52 = (char *)v171 - v51;
  uint64_t v53 = MEMORY[0x270FA5388](v50);
  v55 = (char *)v171 - v54;
  MEMORY[0x270FA5388](v53);
  v57 = (char *)v171 - v56;
  uint64_t v58 = sub_24FC13C3C(&qword_269A5CC58);
  uint64_t v59 = MEMORY[0x270FA5388](v58 - 8);
  v61 = (char *)v171 - ((v60 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v62 = (uint64_t)&v61[*(int *)(v59 + 56)];
  sub_24FC19570(v186, (uint64_t)v61);
  sub_24FC19570((uint64_t)v187, v62);
  v187 = v61;
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t v66 = sub_24FC1B954();
      sub_24FC19570(v66, (uint64_t)v55);
      if (sub_24FC1B93C() == 1)
      {
        uint64_t v67 = v185;
        sub_24FC1B9F8();
        sub_24FC1B924();
        v68();
        char v69 = sub_24FC4F368();
        v70 = *(void (**)(void))(v67 + 8);
        sub_24FC1B9B8();
        v70();
        ((void (*)(char *, uint64_t))v70)(v55, v62);
        goto LABEL_70;
      }
      sub_24FC1B9C4();
      v65 = v55;
      goto LABEL_64;
    case 2u:
      uint64_t v71 = sub_24FC1B954();
      sub_24FC19570(v71, (uint64_t)v52);
      uint64_t v72 = *(int *)(sub_24FC13C3C(&qword_269A5CC70) + 48);
      uint64_t v74 = *(void *)&v52[v72];
      uint64_t v73 = *(void *)&v52[v72 + 8];
      if (sub_24FC1B93C() != 2)
      {
        swift_bridgeObjectRelease();
        sub_24FC1B9C4();
        v65 = v52;
        goto LABEL_64;
      }
      uint64_t v75 = *(void *)(v62 + v72);
      uint64_t v76 = *(void *)(v62 + v72 + 8);
      uint64_t v186 = v75;
      uint64_t v77 = v185;
      sub_24FC1BA04();
      sub_24FC1B984();
      v78();
      char v79 = sub_24FC4F368();
      v80 = *(void (**)(void))(v77 + 8);
      sub_24FC1B8D4();
      v80();
      if (v79)
      {
        BOOL v81 = v74 == v186 && v73 == v76;
        if (v81 || (sub_24FC4FC78() & 1) != 0)
        {
          sub_24FC1B8D4();
          v80();
          swift_bridgeObjectRelease();
          goto LABEL_55;
        }
      }
      sub_24FC1B8D4();
      v80();
      swift_bridgeObjectRelease();
      goto LABEL_83;
    case 3u:
      sub_24FC19570((uint64_t)v187, (uint64_t)v49);
      uint64_t v82 = *(int *)(sub_24FC13C3C(&qword_269A5CC70) + 48);
      uint64_t v84 = *(void *)&v49[v82];
      uint64_t v83 = *(void *)&v49[v82 + 8];
      if (sub_24FC1B93C() != 3)
      {
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v185 + 8))(v49, v184);
        uint64_t v49 = v187;
        goto LABEL_67;
      }
      uint64_t v86 = *(void *)(v62 + v82);
      uint64_t v85 = *(void *)(v62 + v82 + 8);
      uint64_t v87 = v185;
      sub_24FC1B984();
      v88();
      char v89 = sub_24FC4F368();
      v90 = *(void (**)(void))(v87 + 8);
      sub_24FC1B960();
      v90();
      if ((v89 & 1) == 0)
      {
        sub_24FC1B960();
        v90();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        goto LABEL_74;
      }
      BOOL v91 = v84 == v86 && v83 == v85;
      uint64_t v92 = (uint64_t)v187;
      if (v91 || (sub_24FC4FC78() & 1) != 0)
      {
        sub_24FC1B960();
        v90();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v93 = v92;
        goto LABEL_57;
      }
      sub_24FC1B960();
      v90();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v169 = v92;
      goto LABEL_85;
    case 4u:
      uint64_t v94 = sub_24FC1B954();
      sub_24FC19570(v94, (uint64_t)v46);
      uint64_t v95 = *(int *)(sub_24FC13C3C(&qword_269A5CC68) + 48);
      uint64_t v96 = (uint64_t)&v46[v95];
      if (sub_24FC1B93C() != 4)
      {
        sub_24FC19634((uint64_t)&v46[v95], (void (*)(void))type metadata accessor for JsonFieldValueEvent);
        sub_24FC1B9C4();
        v65 = v46;
        goto LABEL_64;
      }
      uint64_t v97 = v62 + v95;
      uint64_t v99 = v184;
      uint64_t v98 = v185;
      sub_24FC1B9F8();
      uint64_t v100 = v172;
      sub_24FC1B984();
      v101();
      uint64_t v102 = v179;
      sub_24FC1968C(v96, v179);
      uint64_t v103 = v178;
      sub_24FC1968C(v97, v178);
      char v104 = sub_24FC4F368();
      v105 = *(void (**)(void))(v98 + 8);
      sub_24FC1B9B8();
      v105();
      if ((v104 & 1) == 0) {
        goto LABEL_68;
      }
      char v106 = sub_24FC4F368();
      uint64_t v107 = v171[0];
      if ((v106 & 1) == 0) {
        goto LABEL_68;
      }
      uint64_t v108 = *(int *)(v171[0] + 20);
      uint64_t v109 = *(void *)(v102 + v108);
      uint64_t v110 = *(void *)(v102 + v108 + 8);
      v111 = (void *)(v103 + v108);
      BOOL v112 = v109 == *v111 && v110 == v111[1];
      if (!v112 && (sub_24FC4FC78() & 1) == 0) {
        goto LABEL_68;
      }
      uint64_t v113 = *(int *)(v107 + 24);
      char v114 = *(unsigned char *)(v102 + v113 + 16);
      long long v190 = *(_OWORD *)(v102 + v113);
      char v191 = v114;
      v115 = (long long *)(v103 + v113);
      char v116 = *((unsigned char *)v115 + 16);
      long long v188 = *v115;
      char v189 = v116;
      if (static JsonValueContainer.== infix(_:_:)((uint64_t)&v190, (uint64_t)&v188))
      {
        uint64_t v117 = *(int *)(v107 + 28);
        uint64_t v118 = v100;
        int v119 = *(unsigned __int8 *)(v102 + v117);
        int v120 = *(unsigned __int8 *)(v103 + v117);
        sub_24FC19634(v103, (void (*)(void))type metadata accessor for JsonFieldValueEvent);
        sub_24FC19634(v102, (void (*)(void))type metadata accessor for JsonFieldValueEvent);
        ((void (*)(uint64_t, uint64_t))v105)(v118, v99);
        if (v119 == v120) {
          goto LABEL_56;
        }
      }
      else
      {
LABEL_68:
        sub_24FC19634(v103, (void (*)(void))type metadata accessor for JsonFieldValueEvent);
        sub_24FC19634(v102, (void (*)(void))type metadata accessor for JsonFieldValueEvent);
        ((void (*)(uint64_t, uint64_t))v105)(v100, v99);
      }
      goto LABEL_84;
    case 5u:
      uint64_t v121 = sub_24FC1B954();
      sub_24FC19570(v121, (uint64_t)v43);
      if (sub_24FC1B93C() == 5)
      {
        uint64_t v122 = v185;
        sub_24FC1B9F8();
        sub_24FC1BA04();
        sub_24FC1B984();
        v123();
        char v69 = sub_24FC4F368();
        v124 = *(void (**)(void))(v122 + 8);
        sub_24FC1B9B8();
        v124();
        sub_24FC1B9B8();
        v124();
        goto LABEL_70;
      }
      sub_24FC1B9C4();
      v65 = v43;
      goto LABEL_64;
    case 6u:
      uint64_t v125 = sub_24FC1B954();
      sub_24FC19570(v125, (uint64_t)v40);
      if (sub_24FC1B93C() == 6)
      {
        uint64_t v126 = v185;
        sub_24FC1B9F8();
        sub_24FC1B924();
        v127();
        char v69 = sub_24FC4F368();
        v128 = *(void (**)(void))(v126 + 8);
        sub_24FC1B9B8();
        v128();
        ((void (*)(char *, uint64_t))v128)(v40, v62);
        goto LABEL_70;
      }
      sub_24FC1B9C4();
      v65 = v40;
      goto LABEL_64;
    case 7u:
      uint64_t v129 = sub_24FC1B954();
      uint64_t v130 = v182;
      sub_24FC19570(v129, v182);
      uint64_t v131 = sub_24FC13C3C(&qword_269A5CC60);
      uint64_t v132 = *(int *)(v131 + 48);
      uint64_t v133 = *(int *)(v131 + 64);
      uint64_t v135 = *(void *)(v130 + v133);
      uint64_t v134 = *(void *)(v130 + v133 + 8);
      if (sub_24FC1B93C() != 7)
      {
        swift_bridgeObjectRelease();
        uint64_t v161 = v184;
        v162 = *(void (**)(uint64_t, uint64_t))(v185 + 8);
        v162(v130 + v132, v184);
        v162(v130, v161);
        goto LABEL_67;
      }
      uint64_t v183 = v135;
      uint64_t v136 = *(void *)(v62 + v133 + 8);
      uint64_t v181 = *(void *)(v62 + v133);
      uint64_t v186 = v136;
      uint64_t v137 = v185;
      v138 = *(void (**)(void))(v185 + 32);
      uint64_t v139 = v174;
      uint64_t v140 = v184;
      sub_24FC1B9D8();
      v138();
      sub_24FC1B9D8();
      v138();
      sub_24FC1B9D8();
      v138();
      uint64_t v141 = v140;
      LOBYTE(v140) = sub_24FC4F368();
      v142 = *(void (**)(void))(v137 + 8);
      sub_24FC1B8D4();
      v142();
      if (v140)
      {
        uint64_t v143 = v186;
        char v144 = sub_24FC4F368();
        uint64_t v145 = (uint64_t)v187;
        if (v144)
        {
          BOOL v146 = v183 == v181 && v134 == v143;
          if (v146 || (sub_24FC4FC78() & 1) != 0)
          {
            sub_24FC1B8D4();
            v142();
            sub_24FC1B8D4();
            v142();
            sub_24FC1B8D4();
            v142();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            uint64_t v93 = v145;
            goto LABEL_57;
          }
          sub_24FC1B8D4();
          v142();
          sub_24FC1B8D4();
          v142();
          sub_24FC1B8D4();
          v142();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
        }
        else
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          sub_24FC1B8D4();
          v142();
          sub_24FC1B8D4();
          v142();
          sub_24FC1B8D4();
          v142();
        }
        uint64_t v169 = v145;
      }
      else
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_24FC1B8D4();
        v142();
        sub_24FC1B8D4();
        v142();
        ((void (*)(uint64_t, uint64_t))v142)(v139, v141);
LABEL_74:
        uint64_t v169 = (uint64_t)v187;
      }
      goto LABEL_85;
    case 8u:
      uint64_t v147 = sub_24FC1B954();
      uint64_t v148 = v183;
      sub_24FC19570(v147, v183);
      uint64_t v149 = sub_24FC13C3C(&qword_269A5CC60);
      uint64_t v150 = *(int *)(v149 + 48);
      uint64_t v151 = *(int *)(v149 + 64);
      uint64_t v153 = *(void *)(v148 + v151);
      uint64_t v152 = *(void *)(v148 + v151 + 8);
      if (sub_24FC1B93C() != 8)
      {
        swift_bridgeObjectRelease();
        uint64_t v163 = v184;
        v164 = *(void (**)(uint64_t))(v185 + 8);
        uint64_t v165 = sub_24FC1BA04();
        v164(v165);
        ((void (*)(uint64_t, uint64_t))v164)(v148, v163);
        goto LABEL_67;
      }
      uint64_t v180 = v153;
      uint64_t v181 = v152;
      uint64_t v182 = v62 + v150;
      uint64_t v154 = *(void *)(v62 + v151 + 8);
      uint64_t v179 = *(void *)(v62 + v151);
      uint64_t v186 = v154;
      uint64_t v155 = v185;
      v156 = *(void (**)(void))(v185 + 32);
      sub_24FC1B9E8();
      v156();
      sub_24FC1B9E8();
      v156();
      sub_24FC1B9E8();
      v156();
      char v157 = sub_24FC4F368();
      v158 = *(void (**)(void))(v155 + 8);
      sub_24FC1B8E4();
      v158();
      if (v157 & 1) != 0 && (uint64_t v159 = v186, (sub_24FC4F368()))
      {
        BOOL v160 = v180 == v179 && v181 == v159;
        if (v160 || (sub_24FC4FC78() & 1) != 0)
        {
          sub_24FC1B8E4();
          v158();
          sub_24FC1B8E4();
          v158();
          sub_24FC1B8E4();
          v158();
          swift_bridgeObjectRelease();
LABEL_55:
          swift_bridgeObjectRelease();
LABEL_56:
          uint64_t v93 = (uint64_t)v49;
LABEL_57:
          sub_24FC19634(v93, (void (*)(void))type metadata accessor for JsonStreamEvent);
          char v69 = 1;
          return v69 & 1;
        }
        sub_24FC1B8E4();
        v158();
        sub_24FC1B8E4();
        v158();
        sub_24FC1B8E4();
        v158();
        swift_bridgeObjectRelease();
LABEL_83:
        swift_bridgeObjectRelease();
      }
      else
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_24FC1B8E4();
        v158();
        sub_24FC1B8E4();
        v158();
        sub_24FC1B8E4();
        v158();
      }
LABEL_84:
      uint64_t v169 = (uint64_t)v49;
LABEL_85:
      sub_24FC19634(v169, (void (*)(void))type metadata accessor for JsonStreamEvent);
      goto LABEL_86;
    default:
      uint64_t v63 = sub_24FC1B954();
      sub_24FC19570(v63, (uint64_t)v57);
      if (sub_24FC1B93C())
      {
        sub_24FC1B9C4();
        v65 = v57;
LABEL_64:
        v64(v65, v184);
LABEL_67:
        sub_24FC195D4((uint64_t)v49);
LABEL_86:
        char v69 = 0;
      }
      else
      {
        uint64_t v166 = v185;
        sub_24FC1B9F8();
        sub_24FC1B924();
        v167();
        char v69 = sub_24FC4F368();
        v168 = *(void (**)(void))(v166 + 8);
        sub_24FC1BA04();
        sub_24FC1B9B8();
        v168();
        ((void (*)(char *, uint64_t))v168)(v57, v62);
LABEL_70:
        sub_24FC19634((uint64_t)v49, (void (*)(void))type metadata accessor for JsonStreamEvent);
      }
      return v69 & 1;
  }
}

uint64_t static JsonStreamField.== infix(_:_:)(void *a1, void *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1]) {
    return 1;
  }
  else {
    return sub_24FC4FC78();
  }
}

uint64_t static JsonFieldValueEvent.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  if ((sub_24FC4F368() & 1) == 0) {
    goto LABEL_9;
  }
  uint64_t v4 = (int *)type metadata accessor for JsonFieldValueEvent(0);
  uint64_t v5 = v4[5];
  uint64_t v6 = *(void *)(a1 + v5);
  uint64_t v7 = *(void *)(a1 + v5 + 8);
  uint64_t v8 = (void *)(a2 + v5);
  BOOL v9 = v6 == *v8 && v7 == v8[1];
  if (v9 || (v10 = sub_24FC4FC78(), char v11 = 0, (v10 & 1) != 0))
  {
    uint64_t v12 = v4[6];
    char v13 = *(unsigned char *)(a1 + v12 + 16);
    long long v19 = *(_OWORD *)(a1 + v12);
    char v20 = v13;
    uint64_t v14 = (long long *)(a2 + v12);
    char v15 = *((unsigned char *)v14 + 16);
    long long v17 = *v14;
    char v18 = v15;
    if (static JsonValueContainer.== infix(_:_:)((uint64_t)&v19, (uint64_t)&v17))
    {
      char v11 = *(unsigned char *)(a1 + v4[7]) ^ *(unsigned char *)(a2 + v4[7]) ^ 1;
      return v11 & 1;
    }
LABEL_9:
    char v11 = 0;
  }
  return v11 & 1;
}

uint64_t type metadata accessor for JsonFieldValueEvent(uint64_t a1)
{
  return sub_24FC14B1C(a1, (uint64_t *)&unk_269A5CC98);
}

uint64_t type metadata accessor for JsonStreamEvent(uint64_t a1)
{
  return sub_24FC14B1C(a1, (uint64_t *)&unk_269A5CC88);
}

uint64_t sub_24FC19570(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for JsonStreamEvent(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24FC195D4(uint64_t a1)
{
  uint64_t v2 = sub_24FC13C3C(&qword_269A5CC58);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24FC19634(uint64_t a1, void (*a2)(void))
{
  a2(0);
  sub_24FC12084();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t sub_24FC1968C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for JsonFieldValueEvent(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t JsonFieldValueEvent.objectID.getter@<X0>(uint64_t a1@<X8>)
{
  sub_24FC4F388();
  sub_24FC12084();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
  return v5(a1, v1, v3);
}

uint64_t JsonFieldValueEvent.field.getter@<X0>(void *a1@<X8>)
{
  uint64_t v3 = (void *)(v1 + *(int *)(type metadata accessor for JsonFieldValueEvent(0) + 20));
  uint64_t v4 = v3[1];
  *a1 = *v3;
  a1[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t JsonFieldValueEvent.value.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for JsonFieldValueEvent(0) + 24);
  uint64_t v4 = *(void *)v3;
  uint64_t v5 = *(void *)(v3 + 8);
  *(void *)a1 = *(void *)v3;
  *(void *)(a1 + 8) = v5;
  char v6 = *(unsigned char *)(v3 + 16);
  *(unsigned char *)(a1 + 16) = v6;
  return sub_24FC16E30(v4, v5, v6);
}

uint64_t JsonFieldValueEvent.isArrayElement.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for JsonFieldValueEvent(0) + 28));
}

int *JsonFieldValueEvent.init(objectID:field:value:isArrayElement:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X2>, char a4@<W3>, uint64_t a5@<X8>)
{
  uint64_t v8 = *a2;
  uint64_t v9 = a2[1];
  uint64_t v10 = *a3;
  uint64_t v11 = a3[1];
  char v12 = *((unsigned char *)a3 + 16);
  sub_24FC4F388();
  sub_24FC12084();
  (*(void (**)(uint64_t, uint64_t))(v13 + 32))(a5, a1);
  uint64_t result = (int *)type metadata accessor for JsonFieldValueEvent(0);
  char v15 = (void *)(a5 + result[5]);
  *char v15 = v8;
  v15[1] = v9;
  uint64_t v16 = a5 + result[6];
  *(void *)uint64_t v16 = v10;
  *(void *)(v16 + 8) = v11;
  *(unsigned char *)(v16 + 16) = v12;
  *(unsigned char *)(a5 + result[7]) = a4;
  return result;
}

GenerativeFunctions::JsonStreamField __swiftcall JsonStreamField.init(name:)(GenerativeFunctions::JsonStreamField name)
{
  *uint64_t v1 = name;
  return name;
}

void static JsonStreamField.root.getter(void *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0xE000000000000000;
}

uint64_t JsonStreamField.description.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t JsonStreamField.hash(into:)()
{
  swift_bridgeObjectRetain();
  sub_24FC4F858();
  return swift_bridgeObjectRelease();
}

uint64_t JsonStreamField.hashValue.getter()
{
  return sub_24FC4FD28();
}

uint64_t sub_24FC199C4()
{
  return sub_24FC4FD28();
}

unint64_t sub_24FC19A20()
{
  unint64_t result = qword_269A5CC78;
  if (!qword_269A5CC78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A5CC78);
  }
  return result;
}

unint64_t sub_24FC19A70()
{
  unint64_t result = qword_269A5CC80;
  if (!qword_269A5CC80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A5CC80);
  }
  return result;
}

void type metadata accessor for JsonNull()
{
}

unsigned char *initializeBufferWithCopyOfBuffer for JsonObjectFieldType(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for JsonObjectFieldType(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFB)
  {
    if (a2 + 5 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 5) >> 8 < 0xFF) {
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
    int v5 = (*a1 | (v4 << 8)) - 6;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 6;
  int v5 = v6 - 6;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for JsonObjectFieldType(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 5 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 5) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFB) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFA)
  {
    unsigned int v6 = ((a2 - 251) >> 8) + 1;
    *unint64_t result = a2 + 5;
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
        JUMPOUT(0x24FC19C2CLL);
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
          *unint64_t result = a2 + 5;
        break;
    }
  }
  return result;
}

uint64_t sub_24FC19C54(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_24FC19C5C(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

void type metadata accessor for JsonObjectFieldType()
{
}

uint64_t destroy for JsonValueContainer(uint64_t a1)
{
  return sub_24FC16EF0(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t _s19GenerativeFunctions18JsonValueContainerOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_24FC16E30(*(void *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for JsonValueContainer(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_24FC16E30(*(void *)a2, v4, v5);
  uint64_t v6 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  char v8 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v5;
  sub_24FC16EF0(v6, v7, v8);
  return a1;
}

__n128 initializeWithTake for JsonValueContainer(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for JsonValueContainer(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  char v6 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v3;
  sub_24FC16EF0(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for JsonValueContainer(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFC && *(unsigned char *)(a1 + 17))
    {
      int v2 = *(_DWORD *)a1 + 251;
    }
    else
    {
      unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
      if (v3 <= 4) {
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

uint64_t storeEnumTagSinglePayload for JsonValueContainer(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFB)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 252;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFC) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFC) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_24FC19E08(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 3u) {
    return *(unsigned __int8 *)(a1 + 16);
  }
  else {
    return (*(_DWORD *)a1 + 4);
  }
}

uint64_t sub_24FC19E20(uint64_t result, unsigned int a2)
{
  if (a2 >= 4)
  {
    *(void *)__n128 result = a2 - 4;
    *(void *)(result + 8) = 0;
    LOBYTE(a2) = 4;
  }
  *(unsigned char *)(result + 16) = a2;
  return result;
}

void type metadata accessor for JsonValueContainer()
{
}

uint64_t *initializeBufferWithCopyOfBuffer for JsonStreamEvent(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v7 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v7 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    switch(swift_getEnumCaseMultiPayload())
    {
      case 2u:
      case 3u:
        uint64_t v8 = sub_24FC4F388();
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v8 - 8) + 16))(a1, a2, v8);
        uint64_t v9 = *(int *)(sub_24FC13C3C(&qword_269A5CC70) + 48);
        uint64_t v10 = (uint64_t *)((char *)a1 + v9);
        uint64_t v11 = (uint64_t *)((char *)a2 + v9);
        uint64_t v12 = v11[1];
        void *v10 = *v11;
        v10[1] = v12;
        swift_bridgeObjectRetain();
        break;
      case 4u:
        uint64_t v13 = sub_24FC4F388();
        uint64_t v14 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v13 - 8) + 16);
        v14(a1, a2, v13);
        uint64_t v15 = *(int *)(sub_24FC13C3C(&qword_269A5CC68) + 48);
        uint64_t v16 = (char *)a1 + v15;
        long long v17 = (char *)a2 + v15;
        v14((uint64_t *)((char *)a1 + v15), (uint64_t *)v17, v13);
        char v18 = (int *)type metadata accessor for JsonFieldValueEvent(0);
        uint64_t v19 = v18[5];
        char v20 = &v16[v19];
        uint64_t v21 = &v17[v19];
        uint64_t v22 = *((void *)v21 + 1);
        *(void *)char v20 = *(void *)v21;
        *((void *)v20 + 1) = v22;
        uint64_t v23 = v18[6];
        uint64_t v24 = &v16[v23];
        uint64_t v25 = &v17[v23];
        uint64_t v26 = *(void *)v25;
        uint64_t v27 = *((void *)v25 + 1);
        char v28 = v25[16];
        swift_bridgeObjectRetain();
        sub_24FC16E30(v26, v27, v28);
        *(void *)uint64_t v24 = v26;
        *((void *)v24 + 1) = v27;
        v24[16] = v28;
        v16[v18[7]] = v17[v18[7]];
        break;
      case 7u:
      case 8u:
        uint64_t v29 = sub_24FC4F388();
        uint64_t v30 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v29 - 8) + 16);
        v30(a1, a2, v29);
        uint64_t v31 = sub_24FC13C3C(&qword_269A5CC60);
        v30((uint64_t *)((char *)a1 + *(int *)(v31 + 48)), (uint64_t *)((char *)a2 + *(int *)(v31 + 48)), v29);
        uint64_t v32 = *(int *)(v31 + 64);
        uint64_t v33 = (uint64_t *)((char *)a1 + v32);
        uint64_t v34 = (uint64_t *)((char *)a2 + v32);
        uint64_t v35 = v34[1];
        *uint64_t v33 = *v34;
        v33[1] = v35;
        swift_bridgeObjectRetain();
        break;
      default:
        uint64_t v6 = sub_24FC4F388();
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
        break;
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t destroy for JsonStreamEvent(uint64_t a1)
{
  uint64_t result = swift_getEnumCaseMultiPayload();
  switch((int)result)
  {
    case 0:
    case 1:
    case 5:
    case 6:
      uint64_t v3 = sub_24FC4F388();
      uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);
      uint64_t result = v4(a1, v3);
      break;
    case 2:
    case 3:
      uint64_t v5 = sub_24FC4F388();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(a1, v5);
      sub_24FC13C3C(&qword_269A5CC70);
      goto LABEL_7;
    case 4:
      uint64_t v9 = sub_24FC4F388();
      uint64_t v10 = *(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8);
      v10(a1, v9);
      uint64_t v11 = a1 + *(int *)(sub_24FC13C3C(&qword_269A5CC68) + 48);
      v10(v11, v9);
      uint64_t v12 = type metadata accessor for JsonFieldValueEvent(0);
      swift_bridgeObjectRelease();
      uint64_t v13 = v11 + *(int *)(v12 + 24);
      uint64_t v14 = *(void *)v13;
      uint64_t v15 = *(void *)(v13 + 8);
      char v16 = *(unsigned char *)(v13 + 16);
      uint64_t result = sub_24FC16EF0(v14, v15, v16);
      break;
    case 7:
    case 8:
      uint64_t v6 = sub_24FC4F388();
      uint64_t v7 = *(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);
      v7(a1, v6);
      uint64_t v8 = sub_24FC13C3C(&qword_269A5CC60);
      v7(a1 + *(int *)(v8 + 48), v6);
LABEL_7:
      uint64_t result = swift_bridgeObjectRelease();
      break;
    default:
      return result;
  }
  return result;
}

uint64_t initializeWithCopy for JsonStreamEvent(uint64_t a1, uint64_t a2)
{
  switch(swift_getEnumCaseMultiPayload())
  {
    case 2u:
    case 3u:
      uint64_t v5 = sub_24FC4F388();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a1, a2, v5);
      uint64_t v6 = *(int *)(sub_24FC13C3C(&qword_269A5CC70) + 48);
      goto LABEL_5;
    case 4u:
      uint64_t v13 = sub_24FC4F388();
      uint64_t v14 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 16);
      v14(a1, a2, v13);
      uint64_t v15 = *(int *)(sub_24FC13C3C(&qword_269A5CC68) + 48);
      uint64_t v16 = a1 + v15;
      uint64_t v17 = a2 + v15;
      v14(a1 + v15, v17, v13);
      char v18 = (int *)type metadata accessor for JsonFieldValueEvent(0);
      uint64_t v19 = v18[5];
      char v20 = (void *)(v16 + v19);
      uint64_t v21 = (void *)(v17 + v19);
      uint64_t v22 = v21[1];
      *char v20 = *v21;
      v20[1] = v22;
      uint64_t v23 = v18[6];
      uint64_t v24 = v16 + v23;
      uint64_t v25 = v17 + v23;
      uint64_t v26 = *(void *)v25;
      uint64_t v27 = *(void *)(v25 + 8);
      char v28 = *(unsigned char *)(v25 + 16);
      swift_bridgeObjectRetain();
      sub_24FC16E30(v26, v27, v28);
      *(void *)uint64_t v24 = v26;
      *(void *)(v24 + 8) = v27;
      *(unsigned char *)(v24 + 16) = v28;
      *(unsigned char *)(v16 + v18[7]) = *(unsigned char *)(v17 + v18[7]);
      break;
    case 7u:
    case 8u:
      uint64_t v7 = sub_24FC4F388();
      uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16);
      v8(a1, a2, v7);
      uint64_t v9 = sub_24FC13C3C(&qword_269A5CC60);
      v8(a1 + *(int *)(v9 + 48), a2 + *(int *)(v9 + 48), v7);
      uint64_t v6 = *(int *)(v9 + 64);
LABEL_5:
      uint64_t v10 = (void *)(a1 + v6);
      uint64_t v11 = (void *)(a2 + v6);
      uint64_t v12 = v11[1];
      void *v10 = *v11;
      v10[1] = v12;
      swift_bridgeObjectRetain();
      break;
    default:
      uint64_t v4 = sub_24FC4F388();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
      break;
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t assignWithCopy for JsonStreamEvent(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    sub_24FC19634(a1, (void (*)(void))type metadata accessor for JsonStreamEvent);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 2u:
      case 3u:
        uint64_t v5 = sub_24FC4F388();
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a1, a2, v5);
        uint64_t v6 = *(int *)(sub_24FC13C3C(&qword_269A5CC70) + 48);
        goto LABEL_6;
      case 4u:
        uint64_t v12 = sub_24FC4F388();
        uint64_t v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 16);
        v13(a1, a2, v12);
        uint64_t v14 = *(int *)(sub_24FC13C3C(&qword_269A5CC68) + 48);
        uint64_t v15 = a1 + v14;
        uint64_t v16 = a2 + v14;
        v13(a1 + v14, v16, v12);
        uint64_t v17 = (int *)type metadata accessor for JsonFieldValueEvent(0);
        uint64_t v18 = v17[5];
        uint64_t v19 = (void *)(v15 + v18);
        char v20 = (void *)(v16 + v18);
        *uint64_t v19 = *v20;
        v19[1] = v20[1];
        uint64_t v21 = v17[6];
        uint64_t v22 = v15 + v21;
        uint64_t v23 = v16 + v21;
        uint64_t v24 = *(void *)v23;
        uint64_t v25 = *(void *)(v23 + 8);
        char v26 = *(unsigned char *)(v23 + 16);
        swift_bridgeObjectRetain();
        sub_24FC16E30(v24, v25, v26);
        *(void *)uint64_t v22 = v24;
        *(void *)(v22 + 8) = v25;
        *(unsigned char *)(v22 + 16) = v26;
        *(unsigned char *)(v15 + v17[7]) = *(unsigned char *)(v16 + v17[7]);
        break;
      case 7u:
      case 8u:
        uint64_t v7 = sub_24FC4F388();
        uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16);
        v8(a1, a2, v7);
        uint64_t v9 = sub_24FC13C3C(&qword_269A5CC60);
        v8(a1 + *(int *)(v9 + 48), a2 + *(int *)(v9 + 48), v7);
        uint64_t v6 = *(int *)(v9 + 64);
LABEL_6:
        uint64_t v10 = (void *)(a1 + v6);
        uint64_t v11 = (void *)(a2 + v6);
        void *v10 = *v11;
        v10[1] = v11[1];
        swift_bridgeObjectRetain();
        break;
      default:
        uint64_t v4 = sub_24FC4F388();
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
        break;
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t initializeWithTake for JsonStreamEvent(uint64_t a1, uint64_t a2)
{
  switch(swift_getEnumCaseMultiPayload())
  {
    case 2u:
    case 3u:
      uint64_t v5 = sub_24FC4F388();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a1, a2, v5);
      uint64_t v6 = *(int *)(sub_24FC13C3C(&qword_269A5CC70) + 48);
      goto LABEL_5;
    case 4u:
      uint64_t v10 = sub_24FC4F388();
      uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32);
      v11(a1, a2, v10);
      uint64_t v12 = *(int *)(sub_24FC13C3C(&qword_269A5CC68) + 48);
      uint64_t v13 = a1 + v12;
      uint64_t v14 = a2 + v12;
      v11(a1 + v12, v14, v10);
      uint64_t v15 = (int *)type metadata accessor for JsonFieldValueEvent(0);
      *(_OWORD *)(v13 + v15[5]) = *(_OWORD *)(v14 + v15[5]);
      uint64_t v16 = v15[6];
      uint64_t v17 = v13 + v16;
      uint64_t v18 = v14 + v16;
      *(_OWORD *)uint64_t v17 = *(_OWORD *)v18;
      *(unsigned char *)(v17 + 16) = *(unsigned char *)(v18 + 16);
      *(unsigned char *)(v13 + v15[7]) = *(unsigned char *)(v14 + v15[7]);
      break;
    case 7u:
    case 8u:
      uint64_t v7 = sub_24FC4F388();
      uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 32);
      v8(a1, a2, v7);
      uint64_t v9 = sub_24FC13C3C(&qword_269A5CC60);
      v8(a1 + *(int *)(v9 + 48), a2 + *(int *)(v9 + 48), v7);
      uint64_t v6 = *(int *)(v9 + 64);
LABEL_5:
      *(_OWORD *)(a1 + v6) = *(_OWORD *)(a2 + v6);
      break;
    default:
      uint64_t v4 = sub_24FC4F388();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
      break;
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t assignWithTake for JsonStreamEvent(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    sub_24FC19634(a1, (void (*)(void))type metadata accessor for JsonStreamEvent);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 2u:
      case 3u:
        uint64_t v5 = sub_24FC4F388();
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a1, a2, v5);
        uint64_t v6 = *(int *)(sub_24FC13C3C(&qword_269A5CC70) + 48);
        goto LABEL_6;
      case 4u:
        uint64_t v10 = sub_24FC4F388();
        uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32);
        v11(a1, a2, v10);
        uint64_t v12 = *(int *)(sub_24FC13C3C(&qword_269A5CC68) + 48);
        uint64_t v13 = a1 + v12;
        uint64_t v14 = a2 + v12;
        v11(a1 + v12, v14, v10);
        uint64_t v15 = (int *)type metadata accessor for JsonFieldValueEvent(0);
        *(_OWORD *)(v13 + v15[5]) = *(_OWORD *)(v14 + v15[5]);
        uint64_t v16 = v15[6];
        uint64_t v17 = v13 + v16;
        uint64_t v18 = v14 + v16;
        *(_OWORD *)uint64_t v17 = *(_OWORD *)v18;
        *(unsigned char *)(v17 + 16) = *(unsigned char *)(v18 + 16);
        *(unsigned char *)(v13 + v15[7]) = *(unsigned char *)(v14 + v15[7]);
        break;
      case 7u:
      case 8u:
        uint64_t v7 = sub_24FC4F388();
        uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 32);
        v8(a1, a2, v7);
        uint64_t v9 = sub_24FC13C3C(&qword_269A5CC60);
        v8(a1 + *(int *)(v9 + 48), a2 + *(int *)(v9 + 48), v7);
        uint64_t v6 = *(int *)(v9 + 64);
LABEL_6:
        *(_OWORD *)(a1 + v6) = *(_OWORD *)(a2 + v6);
        break;
      default:
        uint64_t v4 = sub_24FC4F388();
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
        break;
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_24FC1B008()
{
  uint64_t result = sub_24FC4F388();
  if (v1 <= 0x3F)
  {
    uint64_t v2 = *(void *)(result - 8) + 64;
    uint64_t v9 = v2;
    uint64_t v10 = v2;
    swift_getTupleTypeLayout2();
    uint64_t v11 = &v8;
    swift_getTupleTypeLayout2();
    uint64_t v12 = &v7;
    uint64_t result = type metadata accessor for JsonFieldValueEvent(319);
    if (v3 <= 0x3F)
    {
      swift_getTupleTypeLayout2();
      uint64_t v13 = &v6;
      uint64_t v14 = v2;
      uint64_t v15 = v2;
      swift_getTupleTypeLayout3();
      uint64_t v16 = &v5;
      swift_getTupleTypeLayout3();
      uint64_t v17 = &v4;
      swift_initEnumMetadataMultiPayload();
      return 0;
    }
  }
  return result;
}

void *initializeBufferWithCopyOfBuffer for JsonFieldValueEvent(void *a1, void *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v17 = *a2;
    *a1 = *a2;
    a1 = (void *)(v17 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_24FC4F388();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[5];
    uint64_t v9 = a3[6];
    uint64_t v10 = (void *)((char *)a1 + v8);
    uint64_t v11 = (void *)((char *)a2 + v8);
    uint64_t v12 = v11[1];
    void *v10 = *v11;
    v10[1] = v12;
    uint64_t v13 = (char *)a1 + v9;
    uint64_t v14 = *(void *)((char *)a2 + v9);
    uint64_t v15 = *(void *)((char *)a2 + v9 + 8);
    char v16 = *((unsigned char *)a2 + v9 + 16);
    swift_bridgeObjectRetain();
    sub_24FC16E30(v14, v15, v16);
    *(void *)uint64_t v13 = v14;
    *((void *)v13 + 1) = v15;
    v13[16] = v16;
    *((unsigned char *)a1 + a3[7]) = *((unsigned char *)a2 + a3[7]);
  }
  return a1;
}

uint64_t destroy for JsonFieldValueEvent(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24FC4F388();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  swift_bridgeObjectRelease();
  uint64_t v5 = a1 + *(int *)(a2 + 24);
  uint64_t v6 = *(void *)v5;
  uint64_t v7 = *(void *)(v5 + 8);
  char v8 = *(unsigned char *)(v5 + 16);
  return sub_24FC16EF0(v6, v7, v8);
}

uint64_t initializeWithCopy for JsonFieldValueEvent(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_24FC4F388();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a3[6];
  uint64_t v9 = (void *)(a1 + v7);
  uint64_t v10 = (void *)(a2 + v7);
  uint64_t v11 = v10[1];
  *uint64_t v9 = *v10;
  v9[1] = v11;
  uint64_t v12 = a1 + v8;
  uint64_t v13 = *(void *)(a2 + v8);
  uint64_t v14 = *(void *)(a2 + v8 + 8);
  char v15 = *(unsigned char *)(a2 + v8 + 16);
  swift_bridgeObjectRetain();
  sub_24FC16E30(v13, v14, v15);
  *(void *)uint64_t v12 = v13;
  *(void *)(v12 + 8) = v14;
  *(unsigned char *)(v12 + 16) = v15;
  *(unsigned char *)(a1 + a3[7]) = *(unsigned char *)(a2 + a3[7]);
  return a1;
}

uint64_t assignWithCopy for JsonFieldValueEvent(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_24FC4F388();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  *uint64_t v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v10 = a3[6];
  uint64_t v11 = a1 + v10;
  uint64_t v12 = a2 + v10;
  uint64_t v13 = *(void *)v12;
  uint64_t v14 = *(void *)(v12 + 8);
  char v15 = *(unsigned char *)(v12 + 16);
  sub_24FC16E30(*(void *)v12, v14, v15);
  uint64_t v16 = *(void *)v11;
  uint64_t v17 = *(void *)(v11 + 8);
  *(void *)uint64_t v11 = v13;
  *(void *)(v11 + 8) = v14;
  char v18 = *(unsigned char *)(v11 + 16);
  *(unsigned char *)(v11 + 16) = v15;
  sub_24FC16EF0(v16, v17, v18);
  *(unsigned char *)(a1 + a3[7]) = *(unsigned char *)(a2 + a3[7]);
  return a1;
}

uint64_t initializeWithTake for JsonFieldValueEvent(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_24FC4F388();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(_OWORD *)(a1 + a3[5]) = *(_OWORD *)(a2 + a3[5]);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  *(unsigned char *)(v8 + 16) = *(unsigned char *)(v9 + 16);
  *(_OWORD *)uint64_t v8 = *(_OWORD *)v9;
  *(unsigned char *)(a1 + a3[7]) = *(unsigned char *)(a2 + a3[7]);
  return a1;
}

uint64_t assignWithTake for JsonFieldValueEvent(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_24FC4F388();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (uint64_t *)(a2 + v7);
  uint64_t v11 = *v9;
  uint64_t v10 = v9[1];
  *uint64_t v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  uint64_t v12 = a3[6];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  char v15 = *(unsigned char *)(v14 + 16);
  uint64_t v16 = *(void *)v13;
  uint64_t v17 = *(void *)(v13 + 8);
  *(_OWORD *)uint64_t v13 = *(_OWORD *)v14;
  char v18 = *(unsigned char *)(v13 + 16);
  *(unsigned char *)(v13 + 16) = v15;
  sub_24FC16EF0(v16, v17, v18);
  *(unsigned char *)(a1 + a3[7]) = *(unsigned char *)(a2 + a3[7]);
  return a1;
}

uint64_t getEnumTagSinglePayload for JsonFieldValueEvent(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24FC1B640);
}

uint64_t sub_24FC1B640(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_24FC4F388();
  sub_24FC1B90C();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    return _s19GenerativeFunctions24JsonObjectFieldContainerOwet_0(a1, a2, v6);
  }
  else
  {
    unint64_t v9 = *(void *)(a1 + *(int *)(a3 + 20) + 8);
    if (v9 >= 0xFFFFFFFF) {
      LODWORD(v9) = -1;
    }
    return (v9 + 1);
  }
}

uint64_t storeEnumTagSinglePayload for JsonFieldValueEvent(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24FC1B6E4);
}

void sub_24FC1B6E4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  sub_24FC4F388();
  sub_24FC1B90C();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    _s19GenerativeFunctions24JsonObjectFieldContainerOwst_0(a1, a2, a2, v8);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20) + 8) = (a2 - 1);
  }
}

uint64_t sub_24FC1B770()
{
  uint64_t result = sub_24FC4F388();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void *initializeBufferWithCopyOfBuffer for JsonStreamField(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for JsonStreamField(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *assignWithTake for JsonStreamField(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

void type metadata accessor for JsonStreamField()
{
}

uint64_t sub_24FC1B93C()
{
  return swift_getEnumCaseMultiPayload();
}

uint64_t sub_24FC1B954()
{
  return *(void *)(v0 - 152);
}

uint64_t sub_24FC1B990(uint64_t a1, uint64_t a2, char a3)
{
  sub_24FC16EF0(a1, a2, a3);
  return v3;
}

uint64_t sub_24FC1B9AC()
{
  return v0;
}

uint64_t sub_24FC1BA04()
{
  return v0;
}

void sub_24FC1BA10()
{
  qword_269A5CCA8 = 0x24746F6F7224;
  unk_269A5CCB0 = 0xE600000000000000;
}

uint64_t sub_24FC1BA30()
{
  swift_beginAccess();
  uint64_t v1 = *(void *)(v0 + 112);
  uint64_t v2 = *(void *)(v1 + 16);
  if (!v2) {
    return 0;
  }
  uint64_t v3 = *(void *)(v1 + 16 * v2 + 16);
  swift_bridgeObjectRetain();
  return v3;
}

uint64_t sub_24FC1BA98@<X0>(uint64_t a1@<X8>)
{
  swift_beginAccess();
  uint64_t v3 = *(void *)(v1 + 120);
  uint64_t v4 = *(void *)(v3 + 16);
  uint64_t v5 = sub_24FC4F388();
  uint64_t v6 = v5;
  if (v4)
  {
    (*(void (**)(uint64_t, unint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a1, v3+ ((*(unsigned __int8 *)(*(void *)(v5 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v5 - 8) + 80)), v5);
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v7 = 1;
  }
  return _s19GenerativeFunctions24JsonObjectFieldContainerOwst_0(a1, v7, 1, v6);
}

uint64_t sub_24FC1BB50@<X0>(uint64_t a1@<X8>)
{
  swift_beginAccess();
  uint64_t v3 = *(void *)(v1 + 120);
  uint64_t v4 = *(void *)(v3 + 16);
  if (v4)
  {
    uint64_t v5 = v4 - 1;
    uint64_t v6 = sub_24FC4F388();
    (*(void (**)(uint64_t, unint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, v3+ ((*(unsigned __int8 *)(*(void *)(v6 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v6 - 8) + 80))+ *(void *)(*(void *)(v6 - 8) + 72) * v5, v6);
    uint64_t v7 = a1;
    uint64_t v8 = 0;
    uint64_t v9 = v6;
  }
  else
  {
    uint64_t v9 = sub_24FC4F388();
    uint64_t v7 = a1;
    uint64_t v8 = 1;
  }
  return _s19GenerativeFunctions24JsonObjectFieldContainerOwst_0(v7, v8, 1, v9);
}

uint64_t sub_24FC1BC2C()
{
  *(void *)(v1 + 72) = v0;
  sub_24FC12064();
  return MEMORY[0x270FA2498](v2, v3, v4);
}

uint64_t sub_24FC1BC50()
{
  uint64_t v1 = *(void *)(v0 + 72);
  uint64_t v2 = *(void *)(v1 + 88);
  uint64_t v3 = *(void *)(v1 + 96);
  *(void *)(v1 + 64) = v2;
  *(void *)(v1 + 72) = v3;
  unsigned __int8 v4 = *(unsigned char *)(v1 + 104);
  unsigned __int8 v5 = *(unsigned char *)(v1 + 80);
  *(unsigned char *)(v1 + 80) = v4;
  sub_24FC20BC0(v2, v3, v4);
  uint64_t v6 = sub_24FC213D8();
  sub_24FC20B1C(v6, v7, v5);
  swift_beginAccess();
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v0 + 80) = v8;
  *uint64_t v8 = v0;
  v8[1] = sub_24FC1BD44;
  return sub_24FC21C68(v0 + 40);
}

uint64_t sub_24FC1BD44()
{
  sub_24FC12030();
  sub_24FC0BAB0();
  uint64_t v3 = v2;
  sub_24FC1204C();
  *unsigned __int8 v4 = v3;
  uint64_t v5 = *v1;
  sub_24FC1203C();
  *uint64_t v6 = v5;
  *(void *)(v3 + 88) = v0;
  swift_task_dealloc();
  if (!v0) {
    swift_endAccess();
  }
  sub_24FC12064();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_24FC1BE28()
{
  sub_24FC12030();
  uint64_t v1 = *(void *)(v0 + 72);
  char v2 = *(unsigned char *)(v0 + 56);
  uint64_t v3 = *(void *)(v1 + 88);
  uint64_t v4 = *(void *)(v1 + 96);
  *(_OWORD *)(v1 + 88) = *(_OWORD *)(v0 + 40);
  unsigned __int8 v5 = *(unsigned char *)(v1 + 104);
  *(unsigned char *)(v1 + 104) = v2;
  sub_24FC20B1C(v3, v4, v5);
  sub_24FC0BAC8();
  return v6();
}

uint64_t sub_24FC1BE98()
{
  swift_endAccess();
  if (qword_269A5C730 != -1) {
    swift_once();
  }
  uint64_t v1 = v0[11];
  uint64_t v2 = sub_24FC4F6B8();
  sub_24FC20B5C(v2, (uint64_t)qword_269A5E9F8);
  MEMORY[0x2533738D0](v1);
  MEMORY[0x2533738D0](v1);
  uint64_t v3 = sub_24FC4F698();
  os_log_type_t v4 = sub_24FC4FAF8();
  BOOL v5 = os_log_type_enabled(v3, v4);
  uint64_t v6 = v0[11];
  if (v5)
  {
    uint64_t v7 = (uint8_t *)sub_24FC213F4();
    uint64_t v8 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 138412290;
    MEMORY[0x2533738D0](v6);
    uint64_t v9 = _swift_stdlib_bridgeErrorToNSError();
    v0[8] = v9;
    sub_24FC4FB18();
    *uint64_t v8 = v9;
    MEMORY[0x2533738C0](v6);
    MEMORY[0x2533738C0](v6);
    _os_log_impl(&dword_24FC09000, v3, v4, "Error while retrieving next token: %@", v7, 0xCu);
    sub_24FC13C3C(qword_269A5CD10);
    swift_arrayDestroy();
    sub_24FC211C4();
    sub_24FC211C4();
  }
  else
  {
    MEMORY[0x2533738C0](v0[11]);
    MEMORY[0x2533738C0](v6);
  }
  uint64_t v10 = v0[11];
  uint64_t v11 = v0[9];

  sub_24FC0CC3C((void *)(v11 + 24), *(void *)(v11 + 48));
  uint64_t v12 = sub_24FC21308();
  v13(v12);
  MEMORY[0x2533738C0](v10);
  sub_24FC0BAC8();
  return v14();
}

uint64_t sub_24FC1C09C()
{
  sub_24FC12030();
  *(void *)(v1 + 16) = v0;
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  void *v2 = v1;
  v2[1] = sub_24FC1C12C;
  return sub_24FC1C310(0);
}

uint64_t sub_24FC1C12C()
{
  sub_24FC12030();
  sub_24FC0BAB0();
  sub_24FC1204C();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  sub_24FC1203C();
  *BOOL v5 = v4;
  *(void *)(v6 + 32) = v0;
  swift_task_dealloc();
  sub_24FC12064();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_24FC1C208()
{
  sub_24FC12240();
  sub_24FC0CC3C((void *)(*(void *)(v0 + 16) + 24), *(void *)(*(void *)(v0 + 16) + 48));
  uint64_t v1 = sub_24FC2161C();
  v2(v1);
  sub_24FC0BAC8();
  return v3();
}

uint64_t sub_24FC1C290()
{
  sub_24FC12240();
  uint64_t v1 = *(void *)(v0 + 32);
  sub_24FC0CC3C((void *)(*(void *)(v0 + 16) + 24), *(void *)(*(void *)(v0 + 16) + 48));
  uint64_t v2 = sub_24FC21308();
  v3(v2);
  MEMORY[0x2533738C0](v1);
  sub_24FC0BAC8();
  return v4();
}

uint64_t sub_24FC1C310(char a1)
{
  *(void *)(v2 + 312) = v1;
  *(unsigned char *)(v2 + 257) = a1;
  sub_24FC13C3C(&qword_269A5CCC8);
  *(void *)(v2 + 320) = swift_task_alloc();
  *(void *)(v2 + 328) = swift_task_alloc();
  *(void *)(v2 + 336) = swift_task_alloc();
  *(void *)(v2 + 344) = type metadata accessor for JsonStreamEvent(0);
  *(void *)(v2 + 352) = swift_task_alloc();
  *(void *)(v2 + 360) = swift_task_alloc();
  *(void *)(v2 + 368) = swift_task_alloc();
  uint64_t v3 = sub_24FC4F388();
  *(void *)(v2 + 376) = v3;
  *(void *)(v2 + 384) = *(void *)(v3 - 8);
  *(void *)(v2 + 392) = swift_task_alloc();
  *(void *)(v2 + 400) = swift_task_alloc();
  *(void *)(v2 + 408) = swift_task_alloc();
  *(void *)(v2 + 416) = swift_task_alloc();
  *(void *)(v2 + 424) = swift_task_alloc();
  *(void *)(v2 + 432) = swift_task_alloc();
  *(void *)(v2 + 440) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24FC1C4B8, 0, 0);
}

uint64_t sub_24FC1C4B8()
{
  uint64_t v95 = v0;
  uint64_t v1 = *(void *)(v0 + 312);
  uint64_t v2 = *(void *)(v1 + 64);
  *(void *)(v0 + 448) = v2;
  uint64_t v3 = *(void *)(v1 + 72);
  *(void *)(v0 + 456) = v3;
  int v4 = *(unsigned __int8 *)(v1 + 80);
  *(unsigned char *)(v0 + 258) = v4;
  if ((v4 - 5) < 2)
  {
    v94[0] = 0;
    v94[1] = 0xE000000000000000;
    sub_24FC20B94(v2, v3, v4);
    sub_24FC4FB78();
    *(void *)(v0 + 264) = 0;
    *(void *)(v0 + 272) = 0xE000000000000000;
    sub_24FC4F898();
    *(void *)(v0 + 240) = v2;
    *(void *)(v0 + 248) = v3;
    *(unsigned char *)(v0 + 256) = v4;
    sub_24FC4FBE8();
    sub_24FC20B1C(v2, v3, v4);
    uint64_t v10 = *(void *)(v0 + 264);
    uint64_t v9 = *(void *)(v0 + 272);
    sub_24FC20DAC();
    uint64_t v91 = sub_24FC212F0();
    *uint64_t v11 = v10;
    v11[1] = v9;
    sub_24FC21548(v91, (uint64_t)v11);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    sub_24FC0BAC8();
    goto LABEL_10;
  }
  if (v4 != 7)
  {
    if (v4 == 255)
    {
      if (qword_269A5C730 != -1) {
        swift_once();
      }
      uint64_t v5 = sub_24FC4F6B8();
      sub_24FC20B5C(v5, (uint64_t)qword_269A5E9F8);
      uint64_t v6 = sub_24FC4F698();
      os_log_type_t v7 = sub_24FC4FAE8();
      if (os_log_type_enabled(v6, v7))
      {
        uint64_t v8 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v8 = 0;
        _os_log_impl(&dword_24FC09000, v6, v7, "Reached end of stream", v8, 2u);
        sub_24FC211C4();
      }

      sub_24FC21214();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      sub_24FC12110();
LABEL_10:
      sub_24FC211F8();
      __asm { BRAA            X1, X16 }
    }
    goto LABEL_18;
  }
  if (!(v2 ^ 2 | v3))
  {
    uint64_t v25 = *(void *)(v0 + 336);
    uint64_t v26 = v1 + 120;
    swift_beginAccess();
    sub_24FC3A414(*(void *)(v1 + 120), v25);
    uint64_t v27 = *(void (**)(uint64_t))(v1 + 136);
    sub_24FC20BC0(v2, v3, 7u);
    uint64_t v28 = swift_retain();
    v27(v28);
    swift_release();
    uint64_t v29 = *(void *)(*(void *)(v1 + 120) + 16);
    *(void *)(v0 + 504) = v29;
    if (v29)
    {
      uint64_t v93 = v1 + 120;
      uint64_t v30 = *(void *)(v0 + 376);
      uint64_t v32 = *(void *)(v0 + 328);
      uint64_t v31 = *(void *)(v0 + 336);
      uint64_t v33 = sub_24FC215BC();
      sub_24FC20BD4(v33, v0 + 56);
      sub_24FC0CC3C((void *)(v0 + 56), *(void *)(v0 + 80));
      sub_24FC20C38(v31, v32);
      uint64_t result = _s19GenerativeFunctions24JsonObjectFieldContainerOwet_0(v32, 1, v30);
      if (result == 1)
      {
        __break(1u);
      }
      else
      {
        uint64_t v34 = *(void *)(v0 + 408);
        uint64_t v36 = *(void *)(v0 + 376);
        uint64_t v35 = *(void *)(v0 + 384);
        uint64_t v37 = *(void *)(v0 + 360);
        uint64_t v38 = *(void *)(v0 + 328);
        uint64_t v39 = sub_24FC13C3C(&qword_269A5CC60);
        uint64_t v40 = v37 + *(int *)(v39 + 48);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v35 + 32))(v37, v38, v36);
        uint64_t v41 = *(void (**)(void))(v35 + 16);
        ((void (*)(uint64_t, uint64_t, uint64_t))v41)(v40, v34, v36);
        uint64_t result = sub_24FC1BA30();
        if (v42)
        {
          unint64_t v43 = (v35 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
          uint64_t v44 = *(void *)(v0 + 360);
          uint64_t v45 = (uint64_t *)(v44 + *(int *)(v39 + 64));
          *uint64_t v45 = result;
          v45[1] = v42;
          swift_storeEnumTagMultiPayload();
          sub_24FC213B0();
          v46();
          sub_24FC20CA0(v44);
          _s19GenerativeFunctions26TokenStreamProcessorCloserVwxx_0(v0 + 56);
          uint64_t v26 = v93;
LABEL_44:
          *(void *)(v0 + 512) = v41;
          uint64_t v83 = *(void *)(v0 + 408);
          uint64_t v84 = *(void *)(v0 + 376);
          sub_24FC21250();
          sub_24FC49CE4();
          sub_24FC49D70(*(void *)(*(void *)v26 + 16));
          unint64_t v85 = sub_24FC212C8();
          *(void *)(v0 + 520) = v43;
          ((void (*)(unint64_t, uint64_t, uint64_t))v41)(v85, v83, v84);
          swift_endAccess();
          uint64_t v86 = (void *)swift_task_alloc();
          *(void *)(v0 + 528) = v86;
          *uint64_t v86 = v0;
          v86[1] = sub_24FC1D570;
          sub_24FC211F8();
          return sub_24FC1EFF0();
        }
      }
      __break(1u);
      return result;
    }
    if (qword_269A5C730 != -1) {
      swift_once();
    }
    uint64_t v56 = *(void *)(v0 + 384);
    uint64_t v57 = sub_24FC4F6B8();
    sub_24FC20B5C(v57, (uint64_t)qword_269A5E9F8);
    char v89 = *(void (**)(void))(v56 + 16);
    sub_24FC211B8();
    v58();
    uint64_t v59 = sub_24FC4F698();
    os_log_type_t v60 = sub_24FC4FAE8();
    uint64_t v61 = v60;
    if (os_log_type_enabled(v59, v60))
    {
      uint64_t v62 = (uint8_t *)sub_24FC213F4();
      v94[0] = sub_24FC21434();
      *(_DWORD *)uint64_t v62 = 136315138;
      sub_24FC20D5C();
      uint64_t v63 = sub_24FC4FC68();
      *(void *)(v0 + 280) = sub_24FC49DD0(v63, v64, v94);
      sub_24FC4FB18();
      swift_bridgeObjectRelease();
      sub_24FC215C8();
      v65();
      _os_log_impl(&dword_24FC09000, v59, (os_log_type_t)v61, "Starting to parse all fields for array with id=%s", v62, 0xCu);
      swift_arrayDestroy();
      sub_24FC211C4();
      sub_24FC211C4();
    }
    else
    {
      (*(void (**)(void, void))(*(void *)(v0 + 384) + 8))(*(void *)(v0 + 400), *(void *)(v0 + 376));
    }

    sub_24FC2132C();
    sub_24FC211B8();
    v89();
    swift_storeEnumTagMultiPayload();
    sub_24FC2144C();
    uint64_t v41 = v89;
    sub_24FC213B0();
    v82();
    sub_24FC20CA0(v61);
    unint64_t v43 = (v56 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
    goto LABEL_44;
  }
  if (v2 | v3)
  {
LABEL_18:
    sub_24FC20B94(v2, v3, v4);
    uint64_t v21 = (void *)swift_task_alloc();
    *(void *)(v0 + 544) = v21;
    *uint64_t v21 = v0;
    v21[1] = sub_24FC1DAA8;
    sub_24FC215D4();
    sub_24FC211F8();
    return sub_24FC1F6EC(v22);
  }
  uint64_t v14 = *(void (**)(uint64_t))(v1 + 136);
  sub_24FC20BC0(v2, v3, 7u);
  uint64_t v15 = swift_retain();
  v14(v15);
  swift_release();
  uint64_t v16 = v1 + 120;
  swift_beginAccess();
  uint64_t v17 = *(void *)(*(void *)(v1 + 120) + 16);
  *(void *)(v0 + 464) = v17;
  if (v17)
  {
    uint64_t v18 = sub_24FC1BA30();
    uint64_t v92 = v1 + 120;
    if (v19)
    {
      char v20 = v19;
      os_log_t log = (os_log_t)v18;
    }
    else
    {
      if (qword_269A5C720 != -1) {
        swift_once();
      }
      char v20 = unk_269A5CCB0;
      os_log_t log = (os_log_t)qword_269A5CCA8;
      swift_bridgeObjectRetain();
    }
    uint64_t v66 = *(void *)(v0 + 384);
    uint64_t v67 = *(void *)(v0 + 368);
    v68 = (void *)sub_24FC215BC();
    sub_24FC0CC3C(v68, *(void *)(v69 + 48));
    v70 = (os_log_t *)(v67 + *(int *)(sub_24FC13C3C(&qword_269A5CC70) + 48));
    uint64_t v71 = *(void (**)(void))(v66 + 16);
    unint64_t v72 = (v66 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
    sub_24FC211B8();
    v71();
    os_log_t *v70 = log;
    v70[1] = v20;
    swift_storeEnumTagMultiPayload();
    sub_24FC213B0();
    v73();
    uint64_t v16 = v92;
  }
  else
  {
    if (qword_269A5C730 != -1) {
      swift_once();
    }
    uint64_t v47 = *(void *)(v0 + 384);
    uint64_t v48 = sub_24FC4F6B8();
    sub_24FC20B5C(v48, (uint64_t)qword_269A5E9F8);
    v90 = *(void (**)(void))(v47 + 16);
    sub_24FC211B8();
    v49();
    uint64_t v50 = sub_24FC4F698();
    os_log_type_t v51 = sub_24FC4FAE8();
    if (os_log_type_enabled(v50, v51))
    {
      v52 = (uint8_t *)sub_24FC213F4();
      v94[0] = sub_24FC21434();
      *(_DWORD *)v52 = 136315138;
      sub_24FC20D5C();
      uint64_t v53 = sub_24FC4FC68();
      *(void *)(v0 + 304) = sub_24FC49DD0(v53, v54, v94);
      sub_24FC4FB18();
      swift_bridgeObjectRelease();
      sub_24FC2149C();
      v55();
      _os_log_impl(&dword_24FC09000, v50, v51, "Starting to parse all fields for object with id=%s", v52, 0xCu);
      swift_arrayDestroy();
      sub_24FC211C4();
      uint64_t v16 = v1 + 120;
      sub_24FC211C4();
    }
    else
    {
      sub_24FC2149C();
      v74();
    }
    sub_24FC2132C();
    uint64_t v71 = v90;
    sub_24FC211B8();
    v90();
    swift_storeEnumTagMultiPayload();
    sub_24FC2144C();
    sub_24FC213B0();
    v75();
    unint64_t v72 = (v47 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  }
  *(void *)(v0 + 472) = v71;
  uint64_t v76 = v71;
  uint64_t v77 = *(void *)(v0 + 440);
  uint64_t v78 = *(void *)(v0 + 376);
  sub_24FC20CA0(*(void *)(v0 + 368));
  sub_24FC21250();
  sub_24FC49CE4();
  sub_24FC49D70(*(void *)(*(void *)v16 + 16));
  unint64_t v79 = sub_24FC212C8();
  *(void *)(v0 + 480) = v72;
  ((void (*)(unint64_t, uint64_t, uint64_t))v76)(v79, v77, v78);
  swift_endAccess();
  v80 = (void *)swift_task_alloc();
  *(void *)(v0 + 488) = v80;
  void *v80 = v0;
  v80[1] = sub_24FC1D080;
  sub_24FC215D4();
  sub_24FC211F8();
  return sub_24FC1DEF8();
}

uint64_t sub_24FC1D080()
{
  sub_24FC12030();
  sub_24FC0BAB0();
  sub_24FC1204C();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  sub_24FC1203C();
  *uint64_t v5 = v4;
  *(void *)(v6 + 496) = v0;
  swift_task_dealloc();
  sub_24FC12064();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_24FC1D15C()
{
  uint64_t v38 = v0;
  uint64_t v1 = v0[58];
  uint64_t v2 = v0[53];
  sub_24FC21250();
  sub_24FC1EEEC(v2);
  swift_endAccess();
  uint64_t v3 = sub_24FC213D8();
  uint64_t v36 = v4;
  ((void (*)(uint64_t))v4)(v3);
  if (v1)
  {
    uint64_t v5 = sub_24FC1BA30();
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v35 = v5;
    }
    else
    {
      if (qword_269A5C720 != -1) {
        swift_once();
      }
      uint64_t v7 = unk_269A5CCB0;
      uint64_t v35 = qword_269A5CCA8;
      swift_bridgeObjectRetain();
    }
    uint64_t v23 = (void (*)(uint64_t, uint64_t, uint64_t))v0[59];
    uint64_t v24 = v0[55];
    uint64_t v26 = v0[46];
    uint64_t v25 = v0[47];
    uint64_t v27 = (void *)sub_24FC215BC();
    sub_24FC0CC3C(v27, *(void *)(v28 + 48));
    uint64_t v29 = (uint64_t *)(v26 + *(int *)(sub_24FC13C3C(&qword_269A5CC70) + 48));
    v23(v26, v24, v25);
    *uint64_t v29 = v35;
    v29[1] = v7;
    swift_storeEnumTagMultiPayload();
    sub_24FC213B0();
    v30();
    sub_24FC20CA0(v26);
    sub_24FC213D8();
    sub_24FC2153C();
    v31();
  }
  else
  {
    uint64_t v8 = (void (*)(uint64_t))v0[59];
    uint64_t v9 = v0[46];
    uint64_t v10 = (void *)sub_24FC215BC();
    sub_24FC0CC3C(v10, *(void *)(v11 + 48));
    uint64_t v12 = sub_24FC215A8();
    v8(v12);
    sub_24FC213D8();
    swift_storeEnumTagMultiPayload();
    uint64_t v13 = sub_24FC2138C();
    v14(v13);
    sub_24FC20CA0(v9);
    if (qword_269A5C730 != -1) {
      swift_once();
    }
    uint64_t v15 = (void (*)(uint64_t))v0[59];
    uint64_t v16 = sub_24FC4F6B8();
    sub_24FC20B5C(v16, (uint64_t)qword_269A5E9F8);
    uint64_t v17 = sub_24FC215E8();
    v15(v17);
    uint64_t v18 = sub_24FC4F698();
    os_log_type_t v19 = sub_24FC4FAE8();
    if (os_log_type_enabled(v18, v19))
    {
      char v20 = (uint8_t *)sub_24FC213F4();
      uint64_t v37 = sub_24FC21434();
      *(_DWORD *)char v20 = 136315138;
      sub_24FC20D5C();
      uint64_t v21 = sub_24FC4FC68();
      v0[37] = sub_24FC49DD0(v21, v22, &v37);
      sub_24FC4FB18();
      swift_bridgeObjectRelease();
      sub_24FC213BC();
      v36();
      _os_log_impl(&dword_24FC09000, v18, v19, "Consumed all fields for object with id=%s", v20, 0xCu);
      swift_arrayDestroy();
      sub_24FC211C4();
      sub_24FC211C4();

      sub_24FC213BC();
      v36();
    }
    else
    {

      sub_24FC213BC();
      v36();
      uint64_t v32 = sub_24FC213D8();
      ((void (*)(uint64_t))v36)(v32);
    }
  }
  sub_24FC21368();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_24FC12110();
  return v33();
}

uint64_t sub_24FC1D570()
{
  sub_24FC12030();
  sub_24FC0BAB0();
  sub_24FC1204C();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  sub_24FC1203C();
  *uint64_t v5 = v4;
  *(void *)(v6 + 536) = v0;
  swift_task_dealloc();
  sub_24FC12064();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_24FC1D64C()
{
  uint64_t v44 = v0;
  uint64_t v1 = v0[63];
  uint64_t v2 = v0[53];
  uint64_t v3 = v0[39];
  sub_24FC21250();
  sub_24FC1EEEC(v2);
  swift_endAccess();
  sub_24FC213D8();
  uint64_t v42 = v4;
  sub_24FC215C8();
  v5();
  uint64_t v6 = (void *)(v3 + 24);
  if (!v1)
  {
    uint64_t v25 = (void (*)(uint64_t))v0[64];
    uint64_t v26 = v0[46];
    sub_24FC0CC3C(v6, *(void *)(v0[39] + 48));
    uint64_t v27 = sub_24FC215A8();
    v25(v27);
    sub_24FC213D8();
    swift_storeEnumTagMultiPayload();
    uint64_t v28 = sub_24FC2138C();
    v29(v28);
    sub_24FC20CA0(v26);
    if (qword_269A5C730 != -1) {
      swift_once();
    }
    uint64_t v30 = (void (*)(uint64_t))v0[64];
    uint64_t v31 = sub_24FC4F6B8();
    sub_24FC20B5C(v31, (uint64_t)qword_269A5E9F8);
    uint64_t v32 = sub_24FC215E8();
    v30(v32);
    uint64_t v33 = sub_24FC4F698();
    os_log_type_t v34 = sub_24FC4FAE8();
    BOOL v35 = os_log_type_enabled(v33, v34);
    uint64_t v36 = v0[42];
    if (v35)
    {
      uint64_t v37 = (uint8_t *)sub_24FC213F4();
      uint64_t v43 = sub_24FC21434();
      *(_DWORD *)uint64_t v37 = 136315138;
      sub_24FC20D5C();
      uint64_t v38 = sub_24FC4FC68();
      v0[36] = sub_24FC49DD0(v38, v39, &v43);
      sub_24FC4FB18();
      swift_bridgeObjectRelease();
      sub_24FC213BC();
      v42();
      _os_log_impl(&dword_24FC09000, v33, v34, "Consumed all fields for array with id=%s", v37, 0xCu);
      swift_arrayDestroy();
      sub_24FC211C4();
      sub_24FC211C4();

      sub_24FC213BC();
      v42();
    }
    else
    {

      sub_24FC213BC();
      v42();
      sub_24FC213BC();
      v42();
    }
    sub_24FC20CFC(v36);
LABEL_11:
    sub_24FC21214();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    sub_24FC12110();
    sub_24FC21480();
    __asm { BRAA            X1, X16 }
  }
  uint64_t v7 = v0[47];
  uint64_t v8 = v0[42];
  uint64_t v9 = v0[40];
  sub_24FC20BD4((uint64_t)v6, (uint64_t)(v0 + 2));
  sub_24FC0CC3C(v0 + 2, v0[5]);
  sub_24FC20C38(v8, v9);
  uint64_t result = _s19GenerativeFunctions24JsonObjectFieldContainerOwet_0(v9, 1, v7);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    uint64_t v11 = (void (*)(uint64_t, uint64_t, uint64_t))v0[64];
    uint64_t v12 = v0[51];
    uint64_t v14 = v0[47];
    uint64_t v13 = v0[48];
    uint64_t v15 = v0[44];
    uint64_t v16 = v0[40];
    uint64_t v17 = sub_24FC13C3C(&qword_269A5CC60);
    uint64_t v18 = v15 + *(int *)(v17 + 48);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 32))(v15, v16, v14);
    v11(v18, v12, v14);
    uint64_t result = sub_24FC1BA30();
    if (v19)
    {
      uint64_t v20 = v0[44];
      uint64_t v21 = v0[42];
      unint64_t v22 = (uint64_t *)(v20 + *(int *)(v17 + 64));
      *unint64_t v22 = result;
      v22[1] = v19;
      swift_storeEnumTagMultiPayload();
      sub_24FC213B0();
      v23();
      sub_24FC20CA0(v20);
      sub_24FC2153C();
      v24();
      sub_24FC20CFC(v21);
      _s19GenerativeFunctions26TokenStreamProcessorCloserVwxx_0((uint64_t)(v0 + 2));
      goto LABEL_11;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_24FC1DAA8()
{
  sub_24FC12030();
  sub_24FC0BAB0();
  sub_24FC1204C();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  sub_24FC1203C();
  *uint64_t v5 = v4;
  *(void *)(v6 + 552) = v0;
  swift_task_dealloc();
  sub_24FC12064();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_24FC1DB84()
{
  sub_24FC20B1C(*(void *)(v0 + 448), *(void *)(v0 + 456), *(unsigned char *)(v0 + 258));
  sub_24FC21368();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_24FC12110();
  return v1();
}

uint64_t sub_24FC1DC78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  sub_24FC2126C();
  sub_24FC21464();
  sub_24FC2153C();
  v16();
  sub_24FC210E0();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_24FC21470();
  sub_24FC211DC();
  return v18(v17, v18, v19, v20, v21, v22, v23, v24, a9, a10, a11, a12, a13, a14, a15, a16);
}

uint64_t sub_24FC1DD4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  sub_24FC2126C();
  sub_24FC21464();
  uint64_t v17 = *(void *)(v16 + 336);
  sub_24FC2153C();
  v18();
  sub_24FC20CFC(v17);
  sub_24FC210E0();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_24FC21470();
  sub_24FC211DC();
  return v20(v19, v20, v21, v22, v23, v24, v25, v26, a9, a10, a11, a12, a13, a14, a15, a16);
}

uint64_t sub_24FC1DE2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  sub_24FC2126C();
  sub_24FC21464();
  sub_24FC20B1C(*(void *)(v16 + 448), *(void *)(v16 + 456), *(unsigned char *)(v16 + 258));
  sub_24FC210E0();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_24FC21470();
  sub_24FC211DC();
  return v18(v17, v18, v19, v20, v21, v22, v23, v24, a9, a10, a11, a12, a13, a14, a15, a16);
}

uint64_t sub_24FC1DEF8()
{
  *(void *)(v1 + 80) = v0;
  uint64_t v2 = sub_24FC4F6B8();
  *(void *)(v1 + 88) = v2;
  *(void *)(v1 + 96) = *(void *)(v2 - 8);
  *(void *)(v1 + 104) = swift_task_alloc();
  *(void *)(v1 + 112) = swift_task_alloc();
  *(void *)(v1 + 24) = 0;
  *(void *)(v1 + 16) = 0;
  *(unsigned char *)(v1 + 32) = 7;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 120) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_24FC1E00C;
  return sub_24FC20118(v1 + 16);
}

uint64_t sub_24FC1E00C()
{
  sub_24FC12030();
  sub_24FC0BAB0();
  sub_24FC1204C();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  sub_24FC1203C();
  *uint64_t v5 = v4;
  *(void *)(v6 + 128) = v0;
  swift_task_dealloc();
  sub_24FC12064();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_24FC1E0E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22,uint64_t a23,uint64_t a24)
{
  sub_24FC2126C();
  a23 = v25;
  a24 = v26;
  sub_24FC21464();
  a22 = v24;
  if (qword_269A5C730 != -1) {
    swift_once();
  }
  uint64_t v27 = v24[14];
  uint64_t v28 = v24[11];
  uint64_t v29 = v24[12];
  uint64_t v30 = sub_24FC20B5C(v28, (uint64_t)qword_269A5E9F8);
  v24[17] = v30;
  uint64_t v31 = *(void (**)(uint64_t, uint64_t, uint64_t))(v29 + 16);
  v24[18] = v31;
  v24[19] = (v29 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v31(v27, v30, v28);
  swift_retain_n();
  uint64_t v32 = sub_24FC4F698();
  os_log_type_t v33 = sub_24FC4FAE8();
  BOOL v34 = os_log_type_enabled(v32, v33);
  uint64_t v35 = v24[14];
  unint64_t v36 = v24[11];
  uint64_t v37 = v24[12];
  if (v34)
  {
    uint64_t v54 = v24[11];
    uint64_t v53 = v24[14];
    uint64_t v35 = sub_24FC213F4();
    a13 = sub_24FC21434();
    *(_DWORD *)uint64_t v35 = 136315138;
    uint64_t v38 = sub_24FC1BA30();
    if (v39)
    {
      unint64_t v36 = v39;
    }
    else
    {
      uint64_t v38 = 0x3E746F6F723CLL;
      unint64_t v36 = 0xE600000000000000;
    }
    v24[9] = sub_24FC49DD0(v38, v36, &a13);
    sub_24FC4FB18();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24FC09000, v32, v33, "Starting object in %s", (uint8_t *)v35, 0xCu);
    swift_arrayDestroy();
    sub_24FC211C4();
    sub_24FC211C4();

    uint64_t v40 = *(void *)(v37 + 8);
    ((void (*)(uint64_t, uint64_t))v40)(v53, v54);
  }
  else
  {

    swift_release_n();
    uint64_t v40 = *(void *)(v37 + 8);
    uint64_t v41 = sub_24FC2161C();
    ((void (*)(uint64_t, uint64_t))v40)(v41, v42);
  }
  v24[20] = v40;
  sub_24FC213E4();
  if (!v44 & v43)
  {
    sub_24FC214AC();
    goto LABEL_14;
  }
  sub_24FC21288();
  if (!v44)
  {
    sub_24FC21060();
LABEL_13:
    sub_24FC20B30(v35, v40, v36);
    sub_24FC21008(1);
LABEL_14:
    uint64_t v46 = (void *)swift_task_alloc();
    v24[21] = v46;
    *uint64_t v46 = v24;
    v46[1] = sub_24FC1E43C;
    sub_24FC211DC();
    return sub_24FC20510(v47);
  }
  if ((v45 & 0x1C) != 0 || v35 ^ 1 | v40) {
    goto LABEL_13;
  }
  sub_24FC20B30(v35, v40, 7u);
  sub_24FC20FB0(1);
  sub_24FC213C8((__n128)xmmword_24FC52890);
  uint64_t v50 = (void *)swift_task_alloc();
  v24[23] = v50;
  *uint64_t v50 = v24;
  v50[1] = sub_24FC1EB2C;
  sub_24FC2140C();
  sub_24FC211DC();
  return sub_24FC20118(v51);
}

uint64_t sub_24FC1E43C()
{
  sub_24FC12030();
  sub_24FC0BAB0();
  uint64_t v3 = v2;
  sub_24FC1204C();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  sub_24FC1203C();
  *uint64_t v6 = v5;
  swift_task_dealloc();
  if (v0)
  {
    swift_task_dealloc();
    swift_task_dealloc();
    sub_24FC0BAC8();
    return v7();
  }
  else
  {
    sub_24FC12064();
    return MEMORY[0x270FA2498](v9, v10, v11);
  }
}

uint64_t sub_24FC1E540()
{
  sub_24FC12030();
  uint64_t v1 = v0[10];
  uint64_t v2 = *(void *)(v1 + 64);
  uint64_t v3 = *(void *)(v1 + 72);
  switch(*(unsigned char *)(v1 + 80))
  {
    case 0:
      sub_24FC20BC0(*(void *)(v1 + 64), *(void *)(v1 + 72), 0);
      sub_24FC20BC0(v2, v3, 0);
      uint64_t v4 = sub_24FC210B4(v2, v3, 0);
      unsigned __int8 v6 = 0;
      goto LABEL_13;
    case 1:
      sub_24FC20BC0(*(void *)(v1 + 64), *(void *)(v1 + 72), 1u);
      sub_24FC20BC0(v2, v3, 1u);
      uint64_t v4 = sub_24FC210B4(v2, v3, 1u);
      unsigned __int8 v6 = 1;
      goto LABEL_13;
    case 2:
      uint64_t v7 = sub_24FC210B4(*(void *)(v1 + 64), *(void *)(v1 + 72), 2u);
      sub_24FC20B1C(v7, v8, 2u);
      sub_24FC20B1C(v2, v3, 2u);
      uint64_t v9 = v2;
      uint64_t v10 = v3;
      unsigned __int8 v11 = 2;
      goto LABEL_11;
    case 3:
      uint64_t v12 = sub_24FC210B4(*(void *)(v1 + 64), *(void *)(v1 + 72), 3u);
      sub_24FC20B1C(v12, v13, 3u);
      sub_24FC20B1C(v2, v3, 3u);
      uint64_t v9 = v2;
      uint64_t v10 = v3;
      unsigned __int8 v11 = 3;
      goto LABEL_11;
    case 4:
      uint64_t v14 = sub_24FC210B4(*(void *)(v1 + 64), *(void *)(v1 + 72), 4u);
      sub_24FC20B1C(v14, v15, 4u);
      sub_24FC20B1C(v2, v3, 4u);
      uint64_t v9 = v2;
      uint64_t v10 = v3;
      unsigned __int8 v11 = 4;
      goto LABEL_11;
    case 5:
      sub_24FC20BC0(*(void *)(v1 + 64), *(void *)(v1 + 72), 5u);
      sub_24FC20BC0(v2, v3, 5u);
      uint64_t v4 = sub_24FC210B4(v2, v3, 5u);
      unsigned __int8 v6 = 5;
      goto LABEL_13;
    case 6:
      sub_24FC20BC0(*(void *)(v1 + 64), *(void *)(v1 + 72), 6u);
      sub_24FC20BC0(v2, v3, 6u);
      uint64_t v4 = sub_24FC210B4(v2, v3, 6u);
      unsigned __int8 v6 = 6;
      goto LABEL_13;
    case 7:
      if (v2 == 4)
      {
        sub_24FC20B30(*(void *)(v1 + 64), *(void *)(v1 + 72), 7u);
        sub_24FC20FB0(4);
        uint64_t v19 = (void *)swift_task_alloc();
        v0[22] = v19;
        *uint64_t v19 = v0;
        v19[1] = sub_24FC1E8E8;
        return sub_24FC1BC2C();
      }
      else
      {
        sub_24FC20B30(*(void *)(v1 + 64), *(void *)(v1 + 72), 7u);
        sub_24FC20B30(4, 0, 7u);
        sub_24FC20B1C(v2, v3, 7u);
        sub_24FC20B1C(v2, v3, 7u);
        uint64_t v9 = v2;
        uint64_t v10 = v3;
        unsigned __int8 v11 = 7;
LABEL_11:
        sub_24FC20B30(v9, v10, v11);
LABEL_14:
        sub_24FC21628((__n128)xmmword_24FC52890);
        uint64_t v16 = (void *)swift_task_alloc();
        v0[23] = v16;
        *uint64_t v16 = v0;
        v16[1] = sub_24FC1EB2C;
        uint64_t v17 = sub_24FC2140C();
        return sub_24FC20118(v17);
      }
    default:
      sub_24FC20B1C(*(void *)(v1 + 64), *(void *)(v1 + 72), 0xFFu);
      uint64_t v4 = 4;
      uint64_t v5 = 0;
      unsigned __int8 v6 = 7;
LABEL_13:
      sub_24FC20B1C(v4, v5, v6);
      goto LABEL_14;
  }
}

uint64_t sub_24FC1E8E8()
{
  sub_24FC12030();
  sub_24FC0BAB0();
  uint64_t v1 = *v0;
  sub_24FC1203C();
  void *v2 = v1;
  swift_task_dealloc();
  sub_24FC12064();
  return MEMORY[0x270FA2498](v3, v4, v5);
}

uint64_t sub_24FC1E9B0()
{
  sub_24FC12240();
  sub_24FC213E4();
  if (!v5 & v4)
  {
    sub_24FC214AC();
    goto LABEL_6;
  }
  sub_24FC21288();
  if (!v5)
  {
    sub_24FC21060();
LABEL_5:
    sub_24FC20B30(v0, v1, v2);
    sub_24FC21008(1);
LABEL_6:
    uint64_t v7 = (void *)swift_task_alloc();
    *(void *)(v3 + 168) = v7;
    void *v7 = v3;
    v7[1] = sub_24FC1E43C;
    return sub_24FC20510(0);
  }
  if ((v6 & 0x1C) != 0 || v0 ^ 1 | v1) {
    goto LABEL_5;
  }
  sub_24FC20B30(v0, v1, 7u);
  sub_24FC20FB0(1);
  sub_24FC213C8((__n128)xmmword_24FC52890);
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v3 + 184) = v9;
  *uint64_t v9 = v3;
  v9[1] = sub_24FC1EB2C;
  uint64_t v10 = sub_24FC2140C();
  return sub_24FC20118(v10);
}

uint64_t sub_24FC1EB2C()
{
  sub_24FC12030();
  sub_24FC0BAB0();
  sub_24FC1204C();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  sub_24FC1203C();
  *char v5 = v4;
  *(void *)(v6 + 192) = v0;
  swift_task_dealloc();
  sub_24FC12064();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_24FC1EC08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  sub_24FC2126C();
  a23 = v25;
  a24 = v26;
  sub_24FC21464();
  a22 = v24;
  (*(void (**)(void, void, void))(v24 + 144))(*(void *)(v24 + 104), *(void *)(v24 + 136), *(void *)(v24 + 88));
  swift_retain_n();
  uint64_t v27 = sub_24FC4F698();
  os_log_type_t v28 = sub_24FC4FAE8();
  if (os_log_type_enabled(v27, v28))
  {
    a11 = *(void *)(v24 + 104);
    a12 = *(void *)(v24 + 160);
    a10 = *(void *)(v24 + 88);
    uint64_t v29 = (uint8_t *)sub_24FC213F4();
    a13 = sub_24FC21434();
    *(_DWORD *)uint64_t v29 = 136315138;
    uint64_t v30 = sub_24FC1BA30();
    if (v31)
    {
      unint64_t v32 = v31;
    }
    else
    {
      uint64_t v30 = 0x3E746F6F723CLL;
      unint64_t v32 = 0xE600000000000000;
    }
    *(void *)(v24 + 64) = sub_24FC49DD0(v30, v32, &a13);
    sub_24FC4FB18();
    swift_bridgeObjectRelease();
    swift_release_n();
    _os_log_impl(&dword_24FC09000, v27, v28, "Ending object in %s", v29, 0xCu);
    swift_arrayDestroy();
    sub_24FC211C4();
    sub_24FC211C4();

    sub_24FC2153C();
    v33();
  }
  else
  {
    BOOL v34 = *(void (**)(uint64_t, uint64_t))(v24 + 160);
    uint64_t v35 = *(void *)(v24 + 104);
    uint64_t v36 = *(void *)(v24 + 88);
    swift_release_n();

    v34(v35, v36);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  sub_24FC12110();
  sub_24FC211DC();
  return v38(v37, v38, v39, v40, v41, v42, v43, v44, a9, a10, a11, a12, a13, a14, a15, a16);
}

uint64_t sub_24FC1EDE8()
{
  sub_24FC12030();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_24FC0BAC8();
  return v0();
}

uint64_t sub_24FC1EE4C()
{
  sub_24FC12030();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_24FC0BAC8();
  return v0();
}

uint64_t sub_24FC1EEB0()
{
  if (*(void *)(*(void *)v0 + 16))
  {
    uint64_t result = sub_24FC4DA84();
    if (!v2) {
      return sub_24FC4D824(*(void *)(*(void *)v0 + 16) - 1);
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_24FC1EEEC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_24FC13C3C(&qword_269A5CCC8);
  uint64_t result = MEMORY[0x270FA5388](v3 - 8);
  uint64_t v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(void *)(*(void *)v1 + 16))
  {
    sub_24FC4DAE0((uint64_t)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
    uint64_t v7 = sub_24FC4F388();
    if (_s19GenerativeFunctions24JsonObjectFieldContainerOwet_0((uint64_t)v6, 1, v7) == 1)
    {
      sub_24FC20CFC((uint64_t)v6);
      return sub_24FC4D8B0(*(void *)(*(void *)v1 + 16) - 1);
    }
    else
    {
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, v6, v7);
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_24FC1EFF0()
{
  *(void *)(v1 + 64) = v0;
  *(_OWORD *)(v1 + 16) = xmmword_24FC528A0;
  *(unsigned char *)(v1 + 32) = 7;
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 72) = v2;
  void *v2 = v1;
  v2[1] = sub_24FC1F09C;
  return sub_24FC20118(v1 + 16);
}

uint64_t sub_24FC1F09C()
{
  sub_24FC12030();
  sub_24FC0BAB0();
  sub_24FC1204C();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  sub_24FC1203C();
  *uint64_t v5 = v4;
  *(void *)(v6 + 80) = v0;
  swift_task_dealloc();
  sub_24FC12064();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_24FC1F178()
{
  sub_24FC12240();
  sub_24FC213E4();
  if (!v5 & v4)
  {
    sub_24FC214E8();
    goto LABEL_6;
  }
  sub_24FC21288();
  if (!v5)
  {
    sub_24FC21060();
LABEL_5:
    sub_24FC20B30(v0, v1, v2);
    sub_24FC21008(3);
LABEL_6:
    uint64_t v7 = (void *)swift_task_alloc();
    *(void *)(v3 + 88) = v7;
    void *v7 = v3;
    v7[1] = sub_24FC1F2F4;
    return sub_24FC1C310(1);
  }
  if ((v6 & 0x1C) != 0 || v0 ^ 3 | v1) {
    goto LABEL_5;
  }
  sub_24FC20B30(v0, v1, 7u);
  sub_24FC20FB0(3);
  sub_24FC213C8((__n128)xmmword_24FC528B0);
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v3 + 104) = v9;
  *uint64_t v9 = v3;
  v9[1] = sub_24FC1F5E4;
  uint64_t v10 = sub_24FC2140C();
  return sub_24FC20118(v10);
}

uint64_t sub_24FC1F2F4()
{
  sub_24FC12030();
  sub_24FC0BAB0();
  uint64_t v2 = *v1;
  sub_24FC1203C();
  *uint64_t v3 = v2;
  swift_task_dealloc();
  if (v0)
  {
    sub_24FC0BAC8();
    return v4();
  }
  else
  {
    sub_24FC12064();
    return MEMORY[0x270FA2498](v6, v7, v8);
  }
}

uint64_t sub_24FC1F3EC()
{
  sub_24FC12030();
  uint64_t v1 = v0[8];
  if (*(unsigned char *)(v1 + 80) == 7
    && ((uint64_t v3 = v1 + 64, v2 = *(void *)(v1 + 64), !*(void *)(v3 + 8)) ? (v4 = v2 == 4) : (v4 = 0), v4))
  {
    sub_24FC20B94(4, 0, 7u);
    uint64_t v8 = (void *)swift_task_alloc();
    v0[12] = v8;
    *uint64_t v8 = v0;
    v8[1] = sub_24FC1F51C;
    return sub_24FC1BC2C();
  }
  else
  {
    sub_24FC21628((__n128)xmmword_24FC528B0);
    char v5 = (void *)swift_task_alloc();
    v0[13] = v5;
    *char v5 = v0;
    v5[1] = sub_24FC1F5E4;
    uint64_t v6 = sub_24FC2140C();
    return sub_24FC20118(v6);
  }
}

uint64_t sub_24FC1F51C()
{
  sub_24FC12030();
  sub_24FC0BAB0();
  uint64_t v1 = *v0;
  sub_24FC1203C();
  void *v2 = v1;
  swift_task_dealloc();
  sub_24FC12064();
  return MEMORY[0x270FA2498](v3, v4, v5);
}

uint64_t sub_24FC1F5E4()
{
  sub_24FC12030();
  sub_24FC0BAB0();
  sub_24FC1204C();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  sub_24FC1203C();
  *uint64_t v5 = v4;
  *(void *)(v6 + 112) = v0;
  swift_task_dealloc();
  if (v0)
  {
    sub_24FC12064();
    return MEMORY[0x270FA2498](v7, v8, v9);
  }
  else
  {
    sub_24FC0BAC8();
    return v10();
  }
}

uint64_t sub_24FC1F6DC()
{
  return sub_24FC2129C();
}

uint64_t sub_24FC1F6E4()
{
  return sub_24FC2129C();
}

uint64_t sub_24FC1F6EC(char a1)
{
  *(void *)(v2 + 56) = v1;
  *(unsigned char *)(v2 + 33) = a1;
  *(void *)(v2 + 64) = type metadata accessor for JsonStreamEvent(0);
  *(void *)(v2 + 72) = swift_task_alloc();
  sub_24FC13C3C(&qword_269A5CCC8);
  *(void *)(v2 + 80) = swift_task_alloc();
  *(void *)(v2 + 88) = swift_task_alloc();
  uint64_t v3 = sub_24FC4F388();
  *(void *)(v2 + 96) = v3;
  *(void *)(v2 + 104) = *(void *)(v3 - 8);
  *(void *)(v2 + 112) = swift_task_alloc();
  *(void *)(v2 + 120) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24FC1F830, 0, 0);
}

uint64_t sub_24FC1F830()
{
  uint64_t v1 = sub_24FC1BA30();
  if (!v2)
  {
    sub_24FC20DAC();
    sub_24FC212F0();
    sub_24FC2163C();
    uint64_t v12 = "Got a value token without a field name to map to";
    uint64_t v14 = v13 + 30;
LABEL_7:
    *(void *)uint64_t v11 = v14;
    *(void *)(v11 + 8) = (unint64_t)(v12 - 32) | 0x8000000000000000;
    goto LABEL_8;
  }
  uint64_t v3 = v2;
  uint64_t v4 = *(void *)(v0 + 56);
  int v5 = *(unsigned __int8 *)(v4 + 80);
  if (v5 == 255)
  {
    swift_bridgeObjectRelease();
    sub_24FC20DAC();
    sub_24FC212F0();
    sub_24FC2163C();
    uint64_t v12 = "No current token available to be parsed";
    uint64_t v14 = v15 + 21;
    goto LABEL_7;
  }
  uint64_t v6 = v1;
  uint64_t v8 = *(void *)(v4 + 64);
  uint64_t v7 = *(void *)(v4 + 72);
  uint64_t v10 = *(void *)(v0 + 88);
  uint64_t v9 = *(void *)(v0 + 96);
  sub_24FC1BA98(v10);
  if (_s19GenerativeFunctions24JsonObjectFieldContainerOwet_0(v10, 1, v9) == 1)
  {
    sub_24FC20CFC(*(void *)(v0 + 88));
    sub_24FC21598();
    sub_24FC4FB78();
    sub_24FC4F898();
    sub_24FC4F898();
    swift_bridgeObjectRelease();
    sub_24FC20DAC();
    sub_24FC212F0();
    *(void *)uint64_t v11 = v116;
    *(void *)(v11 + 8) = v117;
LABEL_8:
    *(unsigned char *)(v11 + 16) = 0;
    swift_willThrow();
    goto LABEL_9;
  }
  uint64_t v114 = v7;
  uint64_t v18 = *(void *)(v0 + 96);
  uint64_t v19 = *(void *)(v0 + 104);
  uint64_t v20 = *(void *)(v0 + 80);
  uint64_t v21 = *(void *)(v0 + 56);
  uint64_t v24 = *(void (**)(void, void, void))(v19 + 32);
  uint64_t v23 = (void (*)(void))(v19 + 32);
  uint64_t v22 = v24;
  v24(*(void *)(v0 + 120), *(void *)(v0 + 88), v18);
  sub_24FC1BB50(v20);
  if (_s19GenerativeFunctions24JsonObjectFieldContainerOwet_0(v20, 1, v18) == 1)
  {
    sub_24FC20CFC(*(void *)(v0 + 80));
    sub_24FC21598();
    sub_24FC4FB78();
    sub_24FC2163C();
    sub_24FC4F898();
    sub_24FC4F898();
    swift_bridgeObjectRelease();
    sub_24FC20DAC();
    sub_24FC212F0();
    *(void *)uint64_t v25 = v116;
    *(void *)(v25 + 8) = v117;
    *(unsigned char *)(v25 + 16) = 0;
    swift_willThrow();
    sub_24FC2149C();
    v26();
  }
  else
  {
    v22(*(void *)(v0 + 112), *(void *)(v0 + 80), *(void *)(v0 + 96));
    switch(v5)
    {
      case 1:
        sub_24FC2111C();
        sub_24FC13C3C(&qword_269A5CC68);
        uint64_t v27 = (void (*)(void))*((void *)v22 + 2);
        sub_24FC211A8();
        v27();
        sub_24FC211A8();
        v27();
        uint64_t v28 = type metadata accessor for JsonFieldValueEvent(0);
        uint64_t v29 = sub_24FC21524(v28);
        *(void *)uint64_t v30 = v8;
        *(void *)(v30 + 8) = v114;
        *(unsigned char *)(v30 + 16) = 0;
        sub_24FC2115C(v29, v31, v32, v33, v34, v35, v36, v37, v103, v105, *(int *)v106, v106[4]);
        uint64_t v38 = *(void (**)(uint64_t))(v107 + 8);
        uint64_t v39 = sub_24FC21588();
        sub_24FC20BC0(v39, v40, v41);
        uint64_t v42 = sub_24FC21588();
        sub_24FC20B94(v42, v43, v44);
        v38(v21);
        uint64_t v45 = sub_24FC21588();
        sub_24FC20B1C(v45, v46, v47);
        goto LABEL_21;
      case 2:
        sub_24FC2111C();
        sub_24FC13C3C(&qword_269A5CC68);
        uint64_t v48 = sub_24FC21184();
        ((void (*)(uint64_t))v23)(v48);
        sub_24FC211A8();
        v23();
        uint64_t v49 = type metadata accessor for JsonFieldValueEvent(0);
        uint64_t v50 = sub_24FC21418(v49);
        *(unsigned char *)(v51 + 16) = 2;
        sub_24FC2115C(v50, v52, v53, v54, v55, v56, v57, v58, v103, v105, *(int *)v106, v106[4]);
        uint64_t v59 = sub_24FC212B0();
        unsigned __int8 v61 = 2;
        goto LABEL_19;
      case 3:
        sub_24FC2111C();
        sub_24FC13C3C(&qword_269A5CC68);
        uint64_t v62 = sub_24FC21184();
        ((void (*)(uint64_t))v23)(v62);
        sub_24FC211A8();
        v23();
        uint64_t v63 = type metadata accessor for JsonFieldValueEvent(0);
        uint64_t v64 = sub_24FC21418(v63);
        *(unsigned char *)(v65 + 16) = 3;
        sub_24FC2115C(v64, v66, v67, v68, v69, v70, v71, v72, v103, v105, *(int *)v106, v106[4]);
        uint64_t v59 = sub_24FC212B0();
        unsigned __int8 v61 = 3;
        goto LABEL_19;
      case 4:
        uint64_t v21 = *(void *)(v0 + 72);
        uint64_t v73 = *(void *)(v0 + 56);
        v106[4] = *(unsigned char *)(v0 + 33);
        uint64_t v104 = *(void *)(v0 + 112);
        uint64_t v112 = *(void *)(v73 + 48);
        sub_24FC0CC3C((void *)(v73 + 24), v112);
        sub_24FC13C3C(&qword_269A5CC68);
        uint64_t v74 = sub_24FC21184();
        ((void (*)(uint64_t))v23)(v74);
        sub_24FC211A8();
        v23();
        uint64_t v75 = type metadata accessor for JsonFieldValueEvent(0);
        uint64_t v76 = sub_24FC21524(v75);
        *(void *)uint64_t v77 = v8 & 1;
        *(void *)(v77 + 8) = 0;
        *(unsigned char *)(v77 + 16) = 1;
        sub_24FC2115C(v76, v78, v79, v80, v81, v82, v83, v84, v104, v8 & 1, *(int *)v106, v106[4]);
        uint64_t v59 = sub_24FC212B0();
        unsigned __int8 v61 = 4;
LABEL_19:
        sub_24FC20BC0(v59, v60, v61);
        v3(v21, v112, v6);
        goto LABEL_21;
      case 7:
        if (v8 != 5 || v114) {
          goto LABEL_27;
        }
        uint64_t v88 = *(void *)(v0 + 104);
        uint64_t v89 = *(void *)(v0 + 72);
        v90 = *(void **)(v0 + 56);
        char v108 = *(unsigned char *)(v0 + 33);
        uint64_t v115 = v90[6];
        uint64_t v109 = v90[7];
        sub_24FC0CC3C(v90 + 3, v115);
        uint64_t v91 = v89 + *(int *)(sub_24FC13C3C(&qword_269A5CC68) + 48);
        uint64_t v92 = *(void (**)(void))(v88 + 16);
        sub_24FC211B8();
        v92();
        sub_24FC211B8();
        v92();
        uint64_t v93 = (int *)type metadata accessor for JsonFieldValueEvent(0);
        uint64_t v94 = (uint64_t *)(v91 + v93[5]);
        *uint64_t v94 = v6;
        v94[1] = (uint64_t)v3;
        uint64_t v95 = v91 + v93[6];
        *(void *)uint64_t v95 = 0;
        *(void *)(v95 + 8) = 0;
        *(unsigned char *)(v95 + 16) = 4;
        *(unsigned char *)(v91 + v93[7]) = v108;
        swift_storeEnumTagMultiPayload();
        uint64_t v96 = *(void (**)(uint64_t, uint64_t, uint64_t))(v109 + 8);
        sub_24FC20BC0(5, 0, 7u);
        v96(v89, v115, v109);
LABEL_21:
        sub_24FC20CA0(*(void *)(v0 + 72));
        unint64_t v85 = (void *)swift_task_alloc();
        *(void *)(v0 + 128) = v85;
        *unint64_t v85 = v0;
        v85[1] = sub_24FC1FF8C;
        sub_24FC211F8();
        return sub_24FC1BC2C();
      default:
LABEL_27:
        uint64_t v97 = *(void *)(v0 + 104);
        uint64_t v111 = *(void *)(v0 + 112);
        uint64_t v113 = *(void *)(v0 + 120);
        uint64_t v110 = *(void *)(v0 + 96);
        sub_24FC20BC0(v8, v114, v5);
        swift_bridgeObjectRelease();
        sub_24FC21598();
        sub_24FC4FB78();
        *(void *)(v0 + 40) = v116;
        *(void *)(v0 + 48) = v117;
        sub_24FC4F898();
        *(void *)(v0 + 16) = v8;
        *(void *)(v0 + 24) = v114;
        *(unsigned char *)(v0 + 32) = v5;
        sub_24FC4FBE8();
        uint64_t v98 = *(void *)(v0 + 40);
        uint64_t v99 = *(void *)(v0 + 48);
        sub_24FC20DAC();
        uint64_t v100 = sub_24FC212F0();
        void *v101 = v98;
        v101[1] = v99;
        sub_24FC21548(v100, (uint64_t)v101);
        sub_24FC20B1C(v8, v114, v5);
        uint64_t v102 = *(void (**)(uint64_t, uint64_t))(v97 + 8);
        v102(v111, v110);
        v102(v113, v110);
        break;
    }
  }
LABEL_9:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_24FC0BAC8();
  sub_24FC211F8();
  __asm { BRAA            X1, X16 }
  return result;
}

uint64_t sub_24FC1FF8C()
{
  sub_24FC12030();
  sub_24FC0BAB0();
  uint64_t v1 = *v0;
  sub_24FC1203C();
  void *v2 = v1;
  swift_task_dealloc();
  sub_24FC12064();
  return MEMORY[0x270FA2498](v3, v4, v5);
}

uint64_t sub_24FC20054()
{
  uint64_t v1 = *(void (**)(void))(*(void *)(v0 + 104) + 8);
  sub_24FC2161C();
  sub_24FC215C8();
  v1();
  sub_24FC215C8();
  v1();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_24FC12110();
  return v2();
}

uint64_t sub_24FC20118(uint64_t a1)
{
  *(void *)(v2 + 120) = v1;
  *(_OWORD *)(v2 + 128) = *(_OWORD *)a1;
  *(unsigned char *)(v2 + 33) = *(unsigned char *)(a1 + 16);
  return MEMORY[0x270FA2498](sub_24FC20148, 0, 0);
}

uint64_t sub_24FC20148()
{
  uint64_t v35 = v0;
  uint64_t v1 = v0;
  uint64_t v2 = *(void *)(v0 + 120);
  uint64_t v3 = *(void *)(v1 + 128);
  uint64_t v4 = *(void *)(v1 + 136);
  uint64_t v5 = *(void *)(v2 + 64);
  uint64_t v6 = *(void *)(v2 + 72);
  int v7 = *(unsigned __int8 *)(v2 + 80);
  unsigned __int8 v8 = *(unsigned char *)(v1 + 33);
  if (v7 == 255)
  {
    sub_24FC20B94(*(void *)(v1 + 128), *(void *)(v1 + 136), *(unsigned char *)(v1 + 33));
    sub_24FC20B1C(v5, v6, 0xFFu);
    sub_24FC20B1C(v3, v4, v8);
LABEL_7:
    int v13 = *(unsigned __int8 *)(v2 + 80);
    char v14 = *(unsigned char *)(v1 + 33);
    uint64_t v16 = *(void *)(v1 + 128);
    uint64_t v15 = *(void *)(v1 + 136);
    if (v13 == 255)
    {
      uint64_t v17 = (uint64_t *)(v1 + 88);
      uint64_t v32 = 0;
      unint64_t v33 = 0xE000000000000000;
      sub_24FC4FB78();
      uint64_t v22 = v32;
      *(void *)(v1 + 96) = v33;
      uint64_t v21 = (uint64_t *)(v1 + 96);
      *(void *)(v1 + 88) = v22;
      sub_24FC21564();
      *(void *)(v1 + 16) = v16;
      *(void *)(v1 + 24) = v15;
      *(unsigned char *)(v1 + 32) = v14;
      sub_24FC4FBE8();
      sub_24FC4F898();
    }
    else
    {
      uint64_t v17 = (uint64_t *)(v1 + 104);
      uint64_t v19 = *(void *)(v2 + 64);
      uint64_t v18 = *(void *)(v2 + 72);
      uint64_t v32 = 0;
      unint64_t v33 = 0xE000000000000000;
      sub_24FC20B94(v19, v18, v13);
      sub_24FC4FB78();
      uint64_t v20 = v32;
      *(void *)(v1 + 112) = v33;
      uint64_t v21 = (uint64_t *)(v1 + 112);
      *(void *)(v1 + 104) = v20;
      sub_24FC21564();
      *(void *)(v1 + 40) = v16;
      *(void *)(v1 + 48) = v15;
      *(unsigned char *)(v1 + 56) = v14;
      sub_24FC215FC();
      sub_24FC2163C();
      sub_24FC4F898();
      *(void *)(v1 + 64) = v19;
      *(void *)(v1 + 72) = v18;
      *(unsigned char *)(v1 + 80) = v13;
      sub_24FC215FC();
      sub_24FC20B1C(v19, v18, v13);
    }
    uint64_t v23 = *v17;
    uint64_t v24 = *v21;
    sub_24FC20DAC();
    uint64_t v25 = sub_24FC212F0();
    *uint64_t v26 = v23;
    v26[1] = v24;
    sub_24FC21548(v25, (uint64_t)v26);
    sub_24FC21480();
    __asm { BRAA            X1, X16 }
  }
  uint64_t v29 = *(void *)(v2 + 64);
  uint64_t v30 = v6;
  unsigned __int8 v31 = v7;
  uint64_t v32 = v3;
  unint64_t v33 = v4;
  unsigned __int8 v34 = v8;
  sub_24FC20B94(v5, v6, v7);
  sub_24FC20B94(v5, v6, v7);
  char v9 = static JsonToken.== infix(_:_:)((uint64_t)&v29, (uint64_t)&v32);
  sub_24FC20B30(v29, v30, v31);
  sub_24FC20B1C(v5, v6, v7);
  if ((v9 & 1) == 0) {
    goto LABEL_7;
  }
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v1 + 144) = v10;
  void *v10 = v1;
  v10[1] = sub_24FC20450;
  sub_24FC21480();
  return sub_24FC1BC2C();
}

uint64_t sub_24FC20450()
{
  sub_24FC12030();
  sub_24FC0BAB0();
  uint64_t v1 = *v0;
  sub_24FC1203C();
  void *v2 = v1;
  swift_task_dealloc();
  sub_24FC12110();
  return v3();
}

uint64_t sub_24FC20510(char a1)
{
  *(void *)(v2 + 104) = v1;
  *(unsigned char *)(v2 + 81) = a1;
  return MEMORY[0x270FA2498](sub_24FC20534, 0, 0);
}

uint64_t sub_24FC20534()
{
  uint64_t v1 = *(void *)(v0 + 104);
  uint64_t v2 = *(void *)(v1 + 64);
  *(void *)(v0 + 112) = v2;
  uint64_t v3 = *(void *)(v1 + 72);
  *(void *)(v0 + 120) = v3;
  int v4 = *(unsigned __int8 *)(v1 + 80);
  if (v4 == 255)
  {
    sub_24FC20DAC();
    sub_24FC212F0();
    *(void *)uint64_t v9 = 0xD000000000000035;
    unint64_t v10 = 0x800000024FC50FF0;
  }
  else
  {
    if (!*(unsigned char *)(v1 + 80))
    {
      uint64_t v5 = sub_24FC2161C();
      sub_24FC20B94(v5, v6, 0);
      int v7 = (void *)swift_task_alloc();
      *(void *)(v0 + 128) = v7;
      void *v7 = v0;
      v7[1] = sub_24FC20738;
      return sub_24FC1BC2C();
    }
    sub_24FC20B94(v2, v3, v4);
    sub_24FC4FB78();
    *(void *)(v0 + 88) = 0;
    *(void *)(v0 + 96) = 0xE000000000000000;
    sub_24FC4F898();
    *(void *)(v0 + 64) = v2;
    *(void *)(v0 + 72) = v3;
    *(unsigned char *)(v0 + 80) = v4;
    sub_24FC4FBE8();
    sub_24FC20B1C(v2, v3, v4);
    uint64_t v11 = *(void *)(v0 + 88);
    unint64_t v10 = *(void *)(v0 + 96);
    sub_24FC20DAC();
    sub_24FC212F0();
    *(void *)uint64_t v9 = v11;
  }
  *(void *)(v9 + 8) = v10;
  *(unsigned char *)(v9 + 16) = 1;
  swift_willThrow();
  sub_24FC0BAC8();
  return v12();
}

uint64_t sub_24FC20738()
{
  sub_24FC12030();
  sub_24FC0BAB0();
  uint64_t v1 = *v0;
  sub_24FC1203C();
  void *v2 = v1;
  swift_task_dealloc();
  sub_24FC12064();
  return MEMORY[0x270FA2498](v3, v4, v5);
}

uint64_t sub_24FC20800()
{
  uint64_t v2 = *(void *)(v0 + 112);
  uint64_t v1 = *(void *)(v0 + 120);
  uint64_t v3 = *(void *)(v0 + 104);
  sub_24FC21250();
  sub_24FC49CCC();
  uint64_t v4 = *(void *)(*(void *)(v3 + 112) + 16);
  sub_24FC49D58(v4);
  uint64_t v5 = *(void *)(v3 + 112);
  *(void *)(v5 + 16) = v4 + 1;
  uint64_t v6 = v5 + 16 * v4;
  *(void *)(v6 + 32) = v2;
  *(void *)(v6 + 40) = v1;
  swift_endAccess();
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v0 + 136) = v7;
  void *v7 = v0;
  v7[1] = sub_24FC208F0;
  uint64_t v8 = *(unsigned __int8 *)(v0 + 81);
  return sub_24FC1C310(v8);
}

uint64_t sub_24FC208F0()
{
  sub_24FC12030();
  sub_24FC0BAB0();
  uint64_t v2 = *v1;
  sub_24FC1203C();
  *uint64_t v3 = v2;
  swift_task_dealloc();
  if (v0)
  {
    sub_24FC0BAC8();
    return v4();
  }
  else
  {
    sub_24FC12064();
    return MEMORY[0x270FA2498](v6, v7, v8);
  }
}

uint64_t sub_24FC209E8()
{
  sub_24FC12030();
  sub_24FC21250();
  sub_24FC1EEB0();
  swift_endAccess();
  swift_bridgeObjectRelease();
  sub_24FC12110();
  return v0();
}

uint64_t sub_24FC20A64()
{
  swift_release();
  _s19GenerativeFunctions26TokenStreamProcessorCloserVwxx_0(v0 + 24);
  sub_24FC20B1C(*(void *)(v0 + 64), *(void *)(v0 + 72), *(unsigned char *)(v0 + 80));
  sub_24FC20B1C(*(void *)(v0 + 88), *(void *)(v0 + 96), *(unsigned char *)(v0 + 104));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return v0;
}

uint64_t sub_24FC20AC4()
{
  sub_24FC20A64();
  return MEMORY[0x270FA0228](v0, 152, 7);
}

uint64_t type metadata accessor for JsonStreamParser()
{
  return self;
}

uint64_t sub_24FC20B1C(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 != 0xFF) {
    return sub_24FC20B30(a1, a2, a3);
  }
  return a1;
}

uint64_t sub_24FC20B30(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 6u && ((1 << a3) & 0x63) != 0) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_24FC20B5C(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_24FC20B94(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 6u && ((1 << a3) & 0x63) != 0) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_24FC20BC0(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 != 0xFF) {
    return sub_24FC20B94(a1, a2, a3);
  }
  return a1;
}

uint64_t sub_24FC20BD4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_24FC20C38(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24FC13C3C(&qword_269A5CCC8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24FC20CA0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for JsonStreamEvent(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24FC20CFC(uint64_t a1)
{
  uint64_t v2 = sub_24FC13C3C(&qword_269A5CCC8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_24FC20D5C()
{
  unint64_t result = qword_269A5CCE0;
  if (!qword_269A5CCE0)
  {
    sub_24FC4F388();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_269A5CCE0);
  }
  return result;
}

unint64_t sub_24FC20DAC()
{
  unint64_t result = qword_269A5CCF0;
  if (!qword_269A5CCF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_269A5CCF0);
  }
  return result;
}

uint64_t sub_24FC20DFC()
{
  return swift_bridgeObjectRetain();
}

uint64_t destroy for JsonStreamParser.ParserError()
{
  return sub_24FC20E14();
}

uint64_t sub_24FC20E14()
{
  return swift_bridgeObjectRelease();
}

uint64_t _s19GenerativeFunctions16JsonStreamParserC11ParserErrorOwCP_0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  char v5 = *((unsigned char *)a2 + 16);
  sub_24FC20DFC();
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for JsonStreamParser.ParserError(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  char v5 = *((unsigned char *)a2 + 16);
  sub_24FC20DFC();
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  sub_24FC20E14();
  return a1;
}

uint64_t assignWithTake for JsonStreamParser.ParserError(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = v3;
  sub_24FC20E14();
  return a1;
}

uint64_t getEnumTagSinglePayload for JsonStreamParser.ParserError(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFF && *(unsigned char *)(a1 + 17))
    {
      int v2 = *(_DWORD *)a1 + 254;
    }
    else
    {
      unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
      if (v3 <= 1) {
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

uint64_t storeEnumTagSinglePayload for JsonStreamParser.ParserError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)unint64_t result = a2 - 255;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_24FC20F8C(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_24FC20F94(uint64_t result, char a2)
{
  *(unsigned char *)(result + 16) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for JsonStreamParser.ParserError()
{
  return &type metadata for JsonStreamParser.ParserError;
}

uint64_t sub_24FC20FB0(uint64_t a1)
{
  sub_24FC20B30(a1, 0, 7u);
  sub_24FC20B1C(v1, v2, 7u);
  sub_24FC20B1C(v1, v2, 7u);
  return sub_24FC20B30(v1, v2, 7u);
}

uint64_t sub_24FC21008(uint64_t a1)
{
  sub_24FC20B30(a1, 0, 7u);
  sub_24FC20B1C(v1, v2, v3);
  sub_24FC20B1C(v1, v2, v3);
  return sub_24FC20B30(v1, v2, v3);
}

uint64_t sub_24FC21060()
{
  sub_24FC20BC0(v0, v1, v2);
  sub_24FC20BC0(v0, v1, v2);
  sub_24FC20B94(v0, v1, v2);
  return swift_bridgeObjectRetain();
}

uint64_t sub_24FC210B4(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  sub_24FC20B30(a1, a2, a3);
  sub_24FC20B30(4, 0, 7u);
  return v3;
}

uint64_t sub_24FC210E0()
{
  return swift_task_dealloc();
}

void *sub_24FC2111C()
{
  return sub_24FC0CC3C((void *)(*(void *)(v0 + 56) + 24), *(void *)(*(void *)(v0 + 56) + 48));
}

uint64_t sub_24FC2115C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, int a11, char a12)
{
  *(unsigned char *)(v12 + *(int *)(a1 + 28)) = a12;
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_24FC21184()
{
  return v0;
}

void sub_24FC211C4()
{
  JUMPOUT(0x253373A70);
}

uint64_t sub_24FC21214()
{
  return swift_task_dealloc();
}

uint64_t sub_24FC21250()
{
  return swift_beginAccess();
}

uint64_t sub_24FC2129C()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_24FC212B0()
{
  return v0;
}

unint64_t sub_24FC212C8()
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 16) = v0 + 1;
  return v3
       + ((*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80))
       + *(void *)(v1 + 72) * v0;
}

uint64_t sub_24FC212F0()
{
  return swift_allocError();
}

uint64_t sub_24FC21308()
{
  return v0;
}

uint64_t sub_24FC2132C()
{
  uint64_t v1 = *(void *)(v0 + 368);
  sub_24FC0CC3C((void *)(*(void *)(v0 + 312) + 24), *(void *)(*(void *)(v0 + 312) + 48));
  return v1;
}

uint64_t sub_24FC21368()
{
  return *(void *)(v0 + 440);
}

uint64_t sub_24FC2138C()
{
  return v0;
}

void sub_24FC213C8(__n128 a1)
{
  *(__n128 *)(v2 + 40) = a1;
  *(unsigned char *)(v2 + 56) = v1;
}

uint64_t sub_24FC213D8()
{
  return v0;
}

uint64_t sub_24FC213F4()
{
  return swift_slowAlloc();
}

uint64_t sub_24FC2140C()
{
  return v0;
}

uint64_t sub_24FC21418(uint64_t result)
{
  uint64_t v5 = (void *)(v4 + *(int *)(result + 20));
  *uint64_t v5 = v3;
  v5[1] = v1;
  uint64_t v6 = (void *)(v4 + *(int *)(result + 24));
  *uint64_t v6 = v2;
  v6[1] = 0;
  return result;
}

uint64_t sub_24FC21434()
{
  return swift_slowAlloc();
}

uint64_t sub_24FC2144C()
{
  return v0;
}

uint64_t sub_24FC21470()
{
  return v0 + 8;
}

uint64_t sub_24FC214AC()
{
  sub_24FC20B1C(v0, v1, 0xFFu);
  return sub_24FC20B1C(1, 0, 7u);
}

uint64_t sub_24FC214E8()
{
  sub_24FC20B1C(v0, v1, 0xFFu);
  return sub_24FC20B1C(3, 0, 7u);
}

uint64_t sub_24FC21524(uint64_t result)
{
  uint64_t v4 = (void *)(v3 + *(int *)(result + 20));
  *uint64_t v4 = v2;
  v4[1] = v1;
  return result;
}

uint64_t sub_24FC21548(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(a2 + 16) = 1;
  return swift_willThrow();
}

uint64_t sub_24FC21564()
{
  return sub_24FC4F898();
}

uint64_t sub_24FC21588()
{
  return v0;
}

uint64_t sub_24FC215A8()
{
  return v0;
}

uint64_t sub_24FC215BC()
{
  return *(void *)(v0 + 312) + 24;
}

uint64_t sub_24FC215D4()
{
  return *(unsigned __int8 *)(v0 + 257);
}

uint64_t sub_24FC215E8()
{
  return v0;
}

uint64_t sub_24FC215FC()
{
  return sub_24FC4FBE8();
}

uint64_t sub_24FC2161C()
{
  return v0;
}

void sub_24FC21628(__n128 a1)
{
  *(__n128 *)(v1 + 40) = a1;
  *(unsigned char *)(v1 + 56) = 7;
}

uint64_t static JsonToken.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(uint64_t *)a1;
  uint64_t v2 = *(void *)(a1 + 8);
  unsigned __int8 v4 = *(unsigned char *)(a1 + 16);
  uint64_t v5 = *(uint64_t *)a2;
  uint64_t v6 = *(void *)(a2 + 8);
  int v7 = *(unsigned __int8 *)(a2 + 16);
  switch(v4)
  {
    case 1u:
      if (v7 != 1) {
        goto LABEL_32;
      }
      if (v3 == v5 && v2 == v6) {
        char v9 = 1;
      }
      else {
        char v9 = sub_24FC21BE4();
      }
      sub_24FC20B94(v5, v6, 1u);
      sub_24FC20B94(v3, v2, 1u);
      uint64_t v31 = sub_24FC21C24(v3, v2, 1u);
      unsigned __int8 v33 = 1;
      goto LABEL_49;
    case 2u:
      if (v7 != 2) {
        goto LABEL_33;
      }
      uint64_t v11 = sub_24FC21C40();
      uint64_t v13 = sub_24FC21C24(v11, v12, 2u);
      sub_24FC20B30(v13, v14, 2u);
      char v9 = v3 == v5;
      return v9 & 1;
    case 3u:
      if (v7 != 3) {
        goto LABEL_33;
      }
      uint64_t v15 = sub_24FC21C40();
      uint64_t v17 = sub_24FC21C24(v15, v16, 3u);
      sub_24FC20B30(v17, v18, 3u);
      char v9 = *(double *)&v3 == *(double *)&v5;
      return v9 & 1;
    case 4u:
      if (v7 != 4) {
        goto LABEL_33;
      }
      uint64_t v19 = sub_24FC21C40();
      uint64_t v21 = sub_24FC21C24(v19, v20, 4u);
      sub_24FC20B30(v21, v22, 4u);
      char v9 = ((v3 & 1) == 0) ^ v5;
      return v9 & 1;
    case 5u:
      if (v7 != 5) {
        goto LABEL_32;
      }
      if (v3 == v5 && v2 == v6) {
        char v9 = 1;
      }
      else {
        char v9 = sub_24FC21BE4();
      }
      sub_24FC20B94(v5, v6, 5u);
      sub_24FC20B94(v3, v2, 5u);
      uint64_t v31 = sub_24FC21C24(v3, v2, 5u);
      unsigned __int8 v33 = 5;
      goto LABEL_49;
    case 6u:
      if (v7 != 6) {
        goto LABEL_32;
      }
      if (v3 == v5 && v2 == v6) {
        char v9 = 1;
      }
      else {
        char v9 = sub_24FC21BE4();
      }
      sub_24FC20B94(v5, v6, 6u);
      sub_24FC20B94(v3, v2, 6u);
      uint64_t v31 = sub_24FC21C24(v3, v2, 6u);
      unsigned __int8 v33 = 6;
      goto LABEL_49;
    case 7u:
      switch(v3)
      {
        case 1:
          if (v7 != 7 || v5 != 1 || v6 != 0) {
            goto LABEL_33;
          }
          sub_24FC21C08();
          char v9 = 1;
          uint64_t v31 = 1;
          uint64_t v32 = 0;
          unsigned __int8 v33 = 7;
          goto LABEL_49;
        case 2:
          if (v7 != 7 || v5 != 2 || v6 != 0) {
            goto LABEL_33;
          }
          sub_24FC21C08();
          uint64_t v30 = 2;
          break;
        case 3:
          if (v7 != 7 || v5 != 3 || v6 != 0) {
            goto LABEL_33;
          }
          sub_24FC21C08();
          uint64_t v30 = 3;
          break;
        case 4:
          if (v7 != 7 || v5 != 4 || v6 != 0) {
            goto LABEL_33;
          }
          sub_24FC21C08();
          uint64_t v30 = 4;
          break;
        case 5:
          if (v7 != 7 || v5 != 5 || v6 != 0) {
            goto LABEL_33;
          }
          sub_24FC21C08();
          uint64_t v30 = 5;
          break;
        case 6:
          if (v7 != 7 || v5 != 6 || v6 != 0) {
            goto LABEL_33;
          }
          sub_24FC21C08();
          uint64_t v30 = 6;
          break;
        default:
          if (v7 != 7 || (v6 | v5) != 0) {
            goto LABEL_33;
          }
          sub_24FC21C08();
          uint64_t v30 = 0;
          break;
      }
      sub_24FC20B30(v30, 0, 7u);
      char v9 = 1;
      return v9 & 1;
    default:
      if (*(unsigned char *)(a2 + 16))
      {
LABEL_32:
        swift_bridgeObjectRetain();
LABEL_33:
        sub_24FC20B94(v5, v6, v7);
        uint64_t v25 = sub_24FC21C40();
        uint64_t v27 = sub_24FC21C24(v25, v26, v4);
        sub_24FC20B30(v27, v28, v7);
        char v9 = 0;
      }
      else
      {
        if (v3 == v5 && v2 == v6) {
          char v9 = 1;
        }
        else {
          char v9 = sub_24FC21BE4();
        }
        sub_24FC20B94(v5, v6, 0);
        sub_24FC20B94(v3, v2, 0);
        uint64_t v31 = sub_24FC21C24(v3, v2, 0);
        unsigned __int8 v33 = 0;
LABEL_49:
        sub_24FC20B30(v31, v32, v33);
      }
      return v9 & 1;
  }
}

uint64_t destroy for JsonToken(uint64_t a1)
{
  return sub_24FC20B30(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t _s19GenerativeFunctions9JsonTokenOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 16);
  sub_24FC20B94(*(void *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for JsonToken(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 16);
  sub_24FC20B94(*(void *)a2, v4, v5);
  uint64_t v6 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  unsigned __int8 v8 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v5;
  sub_24FC20B30(v6, v7, v8);
  return a1;
}

uint64_t assignWithTake for JsonToken(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  unsigned __int8 v6 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v3;
  sub_24FC20B30(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for JsonToken(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xF9 && *(unsigned char *)(a1 + 17))
    {
      int v2 = *(_DWORD *)a1 + 248;
    }
    else
    {
      unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
      if (v3 <= 7) {
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

uint64_t storeEnumTagSinglePayload for JsonToken(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xF8)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)unint64_t result = a2 - 249;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xF9) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xF9) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_24FC21BA4(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 6u) {
    return *(unsigned __int8 *)(a1 + 16);
  }
  else {
    return (*(_DWORD *)a1 + 7);
  }
}

uint64_t sub_24FC21BBC(uint64_t result, unsigned int a2)
{
  if (a2 >= 7)
  {
    *(void *)unint64_t result = a2 - 7;
    *(void *)(result + 8) = 0;
    LOBYTE(a2) = 7;
  }
  *(unsigned char *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for JsonToken()
{
  return &type metadata for JsonToken;
}

uint64_t sub_24FC21BE4()
{
  return sub_24FC4FC78();
}

uint64_t sub_24FC21C08()
{
  return sub_24FC20B30(v1, v0, 7u);
}

uint64_t sub_24FC21C24(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  sub_24FC20B30(a1, a2, a3);
  return v3;
}

uint64_t sub_24FC21C40()
{
  return v0;
}

ValueMetadata *type metadata accessor for JsonTokenizer()
{
  return &type metadata for JsonTokenizer;
}

uint64_t sub_24FC21C5C()
{
  return MEMORY[0x263F8E4E0];
}

uint64_t sub_24FC21C68(uint64_t a1)
{
  *(void *)(v2 + 184) = a1;
  *(void *)(v2 + 192) = v1;
  sub_24FC12064();
  return MEMORY[0x270FA2498](v3, v4, v5);
}

uint64_t sub_24FC21C8C()
{
  sub_24FC12030();
  sub_24FC24028();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 200) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_24FC21D18;
  return sub_24FC243D8();
}

uint64_t sub_24FC21D18()
{
  sub_24FC12030();
  sub_24FC0BAB0();
  uint64_t v2 = *v1;
  sub_24FC1204C();
  *uint64_t v3 = v2;
  swift_task_dealloc();
  if (v0)
  {
    sub_24FC0BAC8();
    return v4();
  }
  else
  {
    sub_24FC12064();
    return MEMORY[0x270FA2498](v6, v7, v8);
  }
}

uint64_t sub_24FC21E14()
{
  uint64_t v1 = **(void **)(v0 + 192);
  uint64_t v2 = OBJC_IVAR____TtC19GenerativeFunctions15JsonTokenStream_currentCharacter;
  *(void *)(v0 + 208) = v1;
  *(void *)(v0 + 216) = v2;
  return sub_24FC24010((uint64_t)sub_24FC21E40, v1);
}

uint64_t sub_24FC21E40()
{
  sub_24FC12030();
  uint64_t v1 = (void *)(v0[26] + v0[27]);
  v0[28] = *v1;
  v0[29] = v1[1];
  swift_bridgeObjectRetain();
  sub_24FC12064();
  return MEMORY[0x270FA2498](v2, v3, v4);
}

uint64_t sub_24FC21EB8()
{
  uint64_t v36 = v0;
  if (!*(void *)(v0 + 232))
  {
    uint64_t v9 = *(void **)(v0 + 184);
    *uint64_t v9 = 0;
    v9[1] = 0;
    *(unsigned char *)(*(void *)(v0 + 184) + 16) = -1;
    sub_24FC0BAC8();
    sub_24FC23FDC();
    __asm { BRAA            X1, X16 }
  }
  if (qword_269A5C728 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_24FC4F6B8();
  sub_24FC20B5C(v1, (uint64_t)qword_269A5E9E0);
  swift_bridgeObjectRetain_n();
  uint64_t v2 = sub_24FC4F698();
  os_log_type_t v3 = sub_24FC4FAE8();
  BOOL v4 = os_log_type_enabled(v2, v3);
  unint64_t v5 = *(void *)(v0 + 232);
  if (v4)
  {
    uint64_t v6 = *(void *)(v0 + 224);
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    uint64_t v35 = v8;
    *(_DWORD *)uint64_t v7 = 136315138;
    swift_bridgeObjectRetain();
    *(void *)(v0 + 176) = sub_24FC49DD0(v6, v5, &v35);
    sub_24FC4FB18();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_24FC09000, v2, v3, "#JsonTokenizer next character is %s", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x253373A70](v8, -1, -1);
    MEMORY[0x253373A70](v7, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v12 = *(void *)(v0 + 232);
  if (*(void *)(v0 + 224) == 123 && v12 == 0xE100000000000000)
  {
    uint64_t v14 = 0;
    goto LABEL_17;
  }
  if (sub_24FC4FC78())
  {
    uint64_t v14 = 0;
LABEL_17:
    swift_bridgeObjectRelease();
    *(unsigned char *)(v0 + 416) = 7;
    *(void *)(v0 + 392) = v14;
    *(void *)(v0 + 400) = 0;
    sub_24FC24028();
    uint64_t v15 = (void *)swift_task_alloc();
    *(void *)(v0 + 408) = v15;
    *uint64_t v15 = v0;
    v15[1] = sub_24FC232FC;
    sub_24FC23FDC();
    return sub_24FC256BC();
  }
  if (*(void *)(v0 + 224) == 125 && v12 == 0xE100000000000000)
  {
    uint64_t v14 = 1;
    goto LABEL_17;
  }
  if (sub_24FC24034())
  {
    uint64_t v14 = 1;
    goto LABEL_17;
  }
  if (*(void *)(v0 + 224) == 91 && v12 == 0xE100000000000000)
  {
    uint64_t v14 = 2;
    goto LABEL_17;
  }
  if (sub_24FC24034())
  {
    uint64_t v14 = 2;
    goto LABEL_17;
  }
  if (*(void *)(v0 + 224) == 93 && v12 == 0xE100000000000000)
  {
    uint64_t v14 = 3;
    goto LABEL_17;
  }
  if (sub_24FC24034())
  {
    uint64_t v14 = 3;
    goto LABEL_17;
  }
  BOOL v21 = *(void *)(v0 + 224) == 34 && v12 == 0xE100000000000000;
  if (v21 || (sub_24FC24034() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    uint64_t v22 = (void *)swift_task_alloc();
    *(void *)(v0 + 240) = v22;
    *uint64_t v22 = v0;
    v22[1] = sub_24FC22448;
    sub_24FC23FDC();
    return sub_24FC246D0();
  }
  else
  {
    if (*(void *)(v0 + 224) == 44 && v12 == 0xE100000000000000)
    {
      uint64_t v14 = 4;
      goto LABEL_17;
    }
    if (sub_24FC24034())
    {
      uint64_t v14 = 4;
      goto LABEL_17;
    }
    BOOL v25 = *(void *)(v0 + 224) == 45 && v12 == 0xE100000000000000;
    if (v25 || (sub_24FC24034() & 1) != 0)
    {
      sub_24FC24028();
      uint64_t v26 = (void *)swift_task_alloc();
      *(void *)(v0 + 304) = v26;
      *uint64_t v26 = v0;
      v26[1] = sub_24FC22834;
      sub_24FC23FDC();
      return sub_24FC259C4(v27, v28);
    }
    else if (sub_24FC4F7F8())
    {
      sub_24FC24028();
      uint64_t v30 = (void *)swift_task_alloc();
      *(void *)(v0 + 352) = v30;
      *uint64_t v30 = v0;
      v30[1] = sub_24FC22E50;
      sub_24FC23FDC();
      return sub_24FC25E14(v31);
    }
    else
    {
      swift_bridgeObjectRelease();
      unsigned __int8 v33 = (void *)swift_task_alloc();
      *(void *)(v0 + 368) = v33;
      *unsigned __int8 v33 = v0;
      v33[1] = sub_24FC23050;
      sub_24FC23FDC();
      return sub_24FC268B4();
    }
  }
}

uint64_t sub_24FC22448()
{
  sub_24FC12030();
  sub_24FC0BAB0();
  sub_24FC1204C();
  *os_log_type_t v3 = v2;
  *os_log_type_t v3 = *v1;
  *(void *)(v2 + 248) = v4;
  *(void *)(v2 + 256) = v5;
  swift_task_dealloc();
  if (v0)
  {
    sub_24FC0BAC8();
    return v6();
  }
  else
  {
    sub_24FC12064();
    return MEMORY[0x270FA2498](v8, v9, v10);
  }
}

uint64_t sub_24FC22548()
{
  uint64_t v1 = **(void **)(v0 + 192);
  uint64_t v2 = OBJC_IVAR____TtC19GenerativeFunctions15JsonTokenStream_currentCharacter;
  *(void *)(v0 + 264) = v1;
  *(void *)(v0 + 272) = v2;
  return sub_24FC24010((uint64_t)sub_24FC22574, v1);
}

uint64_t sub_24FC22574()
{
  sub_24FC12030();
  uint64_t v1 = (void *)(v0[33] + v0[34]);
  v0[35] = *v1;
  v0[36] = v1[1];
  swift_bridgeObjectRetain();
  sub_24FC12064();
  return MEMORY[0x270FA2498](v2, v3, v4);
}

uint64_t sub_24FC225EC()
{
  sub_24FC12030();
  uint64_t v1 = v0[36];
  if (v1)
  {
    if (v1 == 0xE100000000000000 && v0[35] == 58)
    {
      swift_bridgeObjectRelease();
LABEL_6:
      sub_24FC24028();
      uint64_t v3 = (void *)swift_task_alloc();
      v0[37] = v3;
      *uint64_t v3 = v0;
      v3[1] = sub_24FC2270C;
      return sub_24FC256BC();
    }
    char v2 = sub_24FC4FC78();
    swift_bridgeObjectRelease();
    if (v2) {
      goto LABEL_6;
    }
  }
  uint64_t v5 = v0[32];
  uint64_t v6 = (void *)v0[23];
  *uint64_t v6 = v0[31];
  v6[1] = v5;
  *(unsigned char *)(v0[23] + 16) = 1;
  sub_24FC12110();
  return v7();
}

uint64_t sub_24FC2270C()
{
  sub_24FC12240();
  sub_24FC0BAB0();
  uint64_t v3 = v2;
  sub_24FC1204C();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  sub_24FC1204C();
  *uint64_t v6 = v5;
  swift_task_dealloc();
  if (v0)
  {
    swift_bridgeObjectRelease();
    sub_24FC24018();
    return v7();
  }
  else
  {
    sub_24FC12064();
    return MEMORY[0x270FA2498](v9, v10, v11);
  }
}

uint64_t sub_24FC2281C()
{
  uint64_t v1 = v0[32];
  uint64_t v2 = (void *)v0[23];
  void *v2 = v0[31];
  v2[1] = v1;
  *(unsigned char *)(v0[23] + 16) = 0;
  return sub_24FC23FF8();
}

uint64_t sub_24FC22834()
{
  sub_24FC12240();
  sub_24FC0BAB0();
  uint64_t v3 = v2;
  sub_24FC1204C();
  *uint64_t v4 = v3;
  *uint64_t v4 = *v1;
  *(void *)(v3 + 312) = v5;
  *(void *)(v3 + 320) = v6;
  swift_task_dealloc();
  if (v0)
  {
    swift_bridgeObjectRelease();
    sub_24FC24018();
    return v7();
  }
  else
  {
    sub_24FC12064();
    return MEMORY[0x270FA2498](v9, v10, v11);
  }
}

uint64_t sub_24FC2294C()
{
  sub_24FC12030();
  if (*(void *)(v0 + 320) && (char v1 = sub_24FC4F7F8(), swift_bridgeObjectRelease(), (v1 & 1) != 0))
  {
    sub_24FC24028();
    uint64_t v2 = (void *)swift_task_alloc();
    *(void *)(v0 + 328) = v2;
    void *v2 = v0;
    v2[1] = sub_24FC22A40;
    return sub_24FC256BC();
  }
  else
  {
    *(_OWORD *)*(void *)(v0 + 184) = *(_OWORD *)(v0 + 224);
    *(unsigned char *)(*(void *)(v0 + 184) + 16) = 5;
    sub_24FC12110();
    return v4();
  }
}

uint64_t sub_24FC22A40()
{
  sub_24FC12240();
  sub_24FC0BAB0();
  uint64_t v3 = v2;
  sub_24FC1204C();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  sub_24FC1204C();
  *uint64_t v6 = v5;
  swift_task_dealloc();
  if (v0)
  {
    swift_bridgeObjectRelease();
    sub_24FC24018();
    return v7();
  }
  else
  {
    sub_24FC12064();
    return MEMORY[0x270FA2498](v9, v10, v11);
  }
}

uint64_t sub_24FC22B50()
{
  sub_24FC12030();
  sub_24FC24028();
  char v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 336) = v1;
  *char v1 = v0;
  v1[1] = sub_24FC22BE8;
  return sub_24FC25E14(v0 + 136);
}

uint64_t sub_24FC22BE8()
{
  sub_24FC12030();
  sub_24FC0BAB0();
  uint64_t v3 = v2;
  sub_24FC1204C();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  sub_24FC1204C();
  *uint64_t v6 = v5;
  *(void *)(v3 + 344) = v0;
  swift_task_dealloc();
  if (v0) {
    swift_bridgeObjectRelease();
  }
  sub_24FC12064();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_24FC22CD0()
{
  uint64_t v13 = v0;
  if (!*(void *)(v0 + 160))
  {
    uint64_t v4 = *(void *)(v0 + 224);
    uint64_t v3 = *(void *)(v0 + 232);
    uint64_t v5 = *(void **)(v0 + 184);
    sub_24FC23F08(v0 + 136);
    *uint64_t v5 = v4;
    v5[1] = v3;
    *(unsigned char *)(*(void *)(v0 + 184) + 16) = 5;
    sub_24FC12110();
    goto LABEL_5;
  }
  uint64_t v1 = *(void *)(v0 + 344);
  swift_bridgeObjectRelease();
  sub_24FC23F68((long long *)(v0 + 136), v0 + 96);
  sub_24FC0CC3C((void *)(v0 + 96), *(void *)(v0 + 120));
  sub_24FC237A8(v0 + 96, -1, (uint64_t)v11);
  if (v1)
  {
    _s19GenerativeFunctions26TokenStreamProcessorCloserVwxx_0(v0 + 96);
    uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
LABEL_5:
    return v2();
  }
  uint64_t v7 = v11[0];
  uint64_t v8 = v11[1];
  char v9 = v12;
  _s19GenerativeFunctions26TokenStreamProcessorCloserVwxx_0(v0 + 96);
  *(unsigned char *)(v0 + 416) = v9;
  *(void *)(v0 + 392) = v7;
  *(void *)(v0 + 400) = v8;
  sub_24FC24028();
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v0 + 408) = v10;
  void *v10 = v0;
  v10[1] = sub_24FC232FC;
  return sub_24FC256BC();
}

uint64_t sub_24FC22E50()
{
  sub_24FC12030();
  sub_24FC0BAB0();
  uint64_t v3 = v2;
  sub_24FC1204C();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  sub_24FC1204C();
  *uint64_t v6 = v5;
  *(void *)(v3 + 360) = v0;
  swift_task_dealloc();
  if (v0) {
    swift_bridgeObjectRelease();
  }
  sub_24FC12064();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_24FC22F38()
{
  uint64_t v11 = v0;
  if (*(void *)(v0 + 80))
  {
    uint64_t v1 = *(void *)(v0 + 360);
    swift_bridgeObjectRelease();
    sub_24FC23F68((long long *)(v0 + 56), v0 + 16);
    sub_24FC0CC3C((void *)(v0 + 16), *(void *)(v0 + 40));
    sub_24FC237A8(v0 + 16, 1, (uint64_t)v9);
    if (v1)
    {
      _s19GenerativeFunctions26TokenStreamProcessorCloserVwxx_0(v0 + 16);
      uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
      goto LABEL_7;
    }
    uint64_t v5 = *(void **)(v0 + 184);
    uint64_t v7 = v9[0];
    uint64_t v4 = v9[1];
    char v6 = v10;
    _s19GenerativeFunctions26TokenStreamProcessorCloserVwxx_0(v0 + 16);
    *uint64_t v5 = v7;
  }
  else
  {
    uint64_t v3 = *(void *)(v0 + 224);
    uint64_t v4 = *(void *)(v0 + 232);
    uint64_t v5 = *(void **)(v0 + 184);
    sub_24FC23F08(v0 + 56);
    *uint64_t v5 = v3;
    char v6 = 5;
  }
  v5[1] = v4;
  *(unsigned char *)(*(void *)(v0 + 184) + 16) = v6;
  sub_24FC12110();
LABEL_7:
  return v2();
}

uint64_t sub_24FC23050()
{
  sub_24FC12030();
  sub_24FC0BAB0();
  sub_24FC1204C();
  *uint64_t v3 = v2;
  *uint64_t v3 = *v1;
  *(void *)(v2 + 376) = v4;
  *(void *)(v2 + 384) = v5;
  swift_task_dealloc();
  if (v0)
  {
    sub_24FC0BAC8();
    return v6();
  }
  else
  {
    sub_24FC12064();
    return MEMORY[0x270FA2498](v8, v9, v10);
  }
}

uint64_t sub_24FC23150()
{
  sub_24FC12240();
  uint64_t v1 = sub_24FC4F838();
  BOOL v3 = v1 == 1819047278 && v2 == 0xE400000000000000;
  if (v3 || (uint64_t v4 = v1, v5 = v2, (sub_24FC2404C() & 1) != 0))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    *(_OWORD *)v0[23] = xmmword_24FC52A00;
    char v6 = 7;
    goto LABEL_14;
  }
  BOOL v7 = v4 == 1702195828 && v5 == 0xE400000000000000;
  if (v7 || (sub_24FC2404C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    *(_OWORD *)v0[23] = xmmword_24FC52890;
LABEL_13:
    char v6 = 4;
    goto LABEL_14;
  }
  if (v4 == 0x65736C6166 && v5 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    goto LABEL_24;
  }
  char v11 = sub_24FC2404C();
  swift_bridgeObjectRelease();
  uint64_t v12 = v0[48];
  if (v11)
  {
LABEL_24:
    swift_bridgeObjectRelease();
    uint64_t v14 = (void *)v0[23];
    *uint64_t v14 = 0;
    v14[1] = 0;
    goto LABEL_13;
  }
  uint64_t v13 = (void *)v0[23];
  *uint64_t v13 = v0[47];
  v13[1] = v12;
  char v6 = 6;
LABEL_14:
  *(unsigned char *)(v0[23] + 16) = v6;
  sub_24FC12110();
  return v8();
}

uint64_t sub_24FC232FC()
{
  sub_24FC12030();
  sub_24FC0BAB0();
  uint64_t v3 = v2;
  sub_24FC1204C();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  sub_24FC1204C();
  *char v6 = v5;
  swift_task_dealloc();
  if (v0)
  {
    sub_24FC20B30(*(void *)(v3 + 392), *(void *)(v3 + 400), *(unsigned char *)(v3 + 416));
    sub_24FC0BAC8();
    return v7();
  }
  else
  {
    sub_24FC12064();
    return MEMORY[0x270FA2498](v9, v10, v11);
  }
}

uint64_t sub_24FC23400()
{
  *(_OWORD *)*(void *)(v0 + 184) = *(_OWORD *)(v0 + 392);
  *(unsigned char *)(*(void *)(v0 + 184) + 16) = *(unsigned char *)(v0 + 416);
  return sub_24FC23FF8();
}

uint64_t sub_24FC23420()
{
  return sub_24FC2129C();
}

uint64_t sub_24FC23428()
{
  return sub_24FC2129C();
}

uint64_t sub_24FC23430()
{
  sub_24FC12030();
  v0[2] = v1;
  uint64_t v2 = sub_24FC13C3C(&qword_269A5CD60);
  v0[3] = v2;
  v0[4] = *(void *)(v2 - 8);
  v0[5] = swift_task_alloc();
  sub_24FC12064();
  return MEMORY[0x270FA2498](v3, v4, v5);
}

uint64_t sub_24FC234EC()
{
  sub_24FC12030();
  uint64_t v1 = v0[5];
  (*(void (**)(uint64_t, void, void))(v0[4] + 16))(v1, v0[2], v0[3]);
  type metadata accessor for JsonTokenStream();
  swift_allocObject();
  v0[6] = sub_24FC26DA8(v1);
  uint64_t v2 = (void *)swift_task_alloc();
  v0[7] = v2;
  void *v2 = v0;
  v2[1] = sub_24FC235BC;
  return sub_24FC24068();
}

uint64_t sub_24FC235BC()
{
  sub_24FC12030();
  sub_24FC0BAB0();
  sub_24FC1204C();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  sub_24FC1204C();
  *uint64_t v5 = v4;
  *(void *)(v6 + 64) = v0;
  swift_task_dealloc();
  sub_24FC12064();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_24FC2369C()
{
  sub_24FC12030();
  (*(void (**)(void, void))(v0[4] + 8))(v0[2], v0[3]);
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(uint64_t))v0[1];
  uint64_t v2 = v0[6];
  return v1(v2);
}

uint64_t sub_24FC23718()
{
  sub_24FC12240();
  uint64_t v1 = v0[3];
  uint64_t v2 = v0[4];
  uint64_t v3 = v0[2];
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v3, v1);
  swift_task_dealloc();
  sub_24FC0BAC8();
  return v4();
}

uint64_t sub_24FC237A8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  sub_24FC20BD4(a1, (uint64_t)v10);
  sub_24FC13C3C(&qword_269A5CD48);
  uint64_t result = swift_dynamicCast();
  if (result)
  {
    *(void *)&double v6 = *(void *)&v9 * a2;
    if ((unsigned __int128)(*(uint64_t *)&v9 * (__int128)a2) >> 64 == (*(void *)&v9 * a2) >> 63)
    {
      char v7 = 2;
LABEL_6:
      uint64_t result = _s19GenerativeFunctions26TokenStreamProcessorCloserVwxx_0((uint64_t)v10);
      *(double *)a3 = v6;
      *(void *)(a3 + 8) = 0;
      *(unsigned char *)(a3 + 16) = v7;
      return result;
    }
    __break(1u);
  }
  else
  {
    if (swift_dynamicCast())
    {
      double v6 = v9 * (double)a2;
      char v7 = 3;
      goto LABEL_6;
    }
    sub_24FC4FB78();
    sub_24FC4F898();
    sub_24FC4FBE8();
    sub_24FC23F80();
    swift_allocError();
    *uint64_t v8 = 0;
    v8[1] = 0xE000000000000000;
    swift_willThrow();
    return _s19GenerativeFunctions26TokenStreamProcessorCloserVwxx_0((uint64_t)v10);
  }
  return result;
}

uint64_t sub_24FC23924@<X0>(void *a1@<X8>)
{
  uint64_t v3 = *v1;
  j__swift_retain();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_24FC23958(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_24FC239F0;
  return sub_24FC21C68(a1);
}

uint64_t sub_24FC239F0()
{
  sub_24FC12030();
  sub_24FC0BAB0();
  uint64_t v1 = *v0;
  sub_24FC1204C();
  void *v2 = v1;
  swift_task_dealloc();
  sub_24FC0BAC8();
  return v3();
}

uint64_t sub_24FC23AB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a4;
  uint64_t v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_269A5CD30 + dword_269A5CD30);
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v4 + 24) = v8;
  *uint64_t v8 = v4;
  v8[1] = sub_24FC23B80;
  return v10(a1, a2, a3);
}

uint64_t sub_24FC23B80()
{
  sub_24FC12240();
  sub_24FC0BAB0();
  uint64_t v3 = v2;
  sub_24FC1204C();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  sub_24FC1204C();
  *double v6 = v5;
  swift_task_dealloc();
  if (v0) {
    **(void **)(v3 + 16) = v0;
  }
  sub_24FC24018();
  return v7();
}

unint64_t sub_24FC23C64()
{
  unint64_t result = qword_269A5CD28;
  if (!qword_269A5CD28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A5CD28);
  }
  return result;
}

uint64_t sub_24FC23CB0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  uint64_t v5 = (void *)swift_task_alloc();
  v3[5] = v5;
  *uint64_t v5 = v3;
  v5[1] = sub_24FC23D4C;
  return sub_24FC21C68(a1);
}

uint64_t sub_24FC23D4C()
{
  sub_24FC12240();
  sub_24FC0BAB0();
  uint64_t v3 = v2;
  sub_24FC1204C();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  sub_24FC1204C();
  *double v6 = v5;
  *(void *)(v3 + 48) = v0;
  swift_task_dealloc();
  if (v0)
  {
    if (*(void *)(v3 + 24))
    {
      swift_getObjectType();
      uint64_t v7 = sub_24FC4F978();
      uint64_t v9 = v8;
    }
    else
    {
      uint64_t v7 = 0;
      uint64_t v9 = 0;
    }
    return MEMORY[0x270FA2498](sub_24FC23E88, v7, v9);
  }
  else
  {
    sub_24FC0BAC8();
    return v10();
  }
}

uint64_t sub_24FC23E88()
{
  sub_24FC12030();
  *(void *)(v0 + 16) = *(void *)(v0 + 48);
  sub_24FC13C3C(&qword_269A5CBA0);
  swift_willThrowTypedImpl();
  sub_24FC0BAC8();
  return v1();
}

uint64_t sub_24FC23F08(uint64_t a1)
{
  uint64_t v2 = sub_24FC13C3C(&qword_269A5CD40);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24FC23F68(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

unint64_t sub_24FC23F80()
{
  unint64_t result = qword_269A5CD50;
  if (!qword_269A5CD50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_269A5CD50);
  }
  return result;
}

ValueMetadata *type metadata accessor for JsonTokenizer.JsonTokenizerError()
{
  return &type metadata for JsonTokenizer.JsonTokenizerError;
}

uint64_t sub_24FC23FF8()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_24FC24010(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA2498](a1, a2, 0);
}

uint64_t sub_24FC24018()
{
  return v0 + 8;
}

uint64_t sub_24FC24034()
{
  return sub_24FC4FC78();
}

uint64_t sub_24FC2404C()
{
  return sub_24FC4FC78();
}

uint64_t sub_24FC24068()
{
  sub_24FC12030();
  *(void *)(v1 + 16) = v0;
  sub_24FC13C3C(&qword_269A5CE70);
  *(void *)(v1 + 24) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24FC240F8, v0, 0);
}

uint64_t sub_24FC240F8()
{
  sub_24FC12240();
  uint64_t v1 = OBJC_IVAR____TtC19GenerativeFunctions15JsonTokenStream_started;
  v0[4] = OBJC_IVAR____TtC19GenerativeFunctions15JsonTokenStream_started;
  uint64_t v3 = v0[2];
  uint64_t v2 = v0[3];
  if (*(unsigned char *)(v3 + v1))
  {
    swift_task_dealloc();
    sub_24FC12110();
    return v4();
  }
  else
  {
    uint64_t v6 = sub_24FC4F9A8();
    _s19GenerativeFunctions24JsonObjectFieldContainerOwst_0(v2, 1, 1, v6);
    unint64_t v7 = sub_24FC2B7B8();
    uint64_t v8 = (void *)swift_allocObject();
    v8[2] = v3;
    v8[3] = v7;
    v8[4] = v3;
    swift_retain_n();
    *(void *)(v3 + OBJC_IVAR____TtC19GenerativeFunctions15JsonTokenStream_streamingTask) = sub_24FC3A56C(v2, (uint64_t)&unk_269A5CE88, (uint64_t)v8);
    swift_release();
    uint64_t v9 = (void *)swift_task_alloc();
    v0[5] = v9;
    *uint64_t v9 = v0;
    v9[1] = sub_24FC24264;
    return sub_24FC256BC();
  }
}

uint64_t sub_24FC24264()
{
  sub_24FC12240();
  sub_24FC0BAB0();
  uint64_t v3 = v2;
  sub_24FC1204C();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  sub_24FC1203C();
  *uint64_t v6 = v5;
  swift_task_dealloc();
  if (v0)
  {
    swift_task_dealloc();
    sub_24FC24018();
    return v7();
  }
  else
  {
    sub_24FC2BDA0();
    return MEMORY[0x270FA2498](v9, v10, v11);
  }
}

uint64_t sub_24FC24370()
{
  sub_24FC12030();
  *(unsigned char *)(*(void *)(v0 + 16) + *(void *)(v0 + 32)) = 1;
  swift_task_dealloc();
  sub_24FC12110();
  return v1();
}

uint64_t sub_24FC243D8()
{
  *(void *)(v1 + 16) = v0;
  return sub_24FC24010((uint64_t)sub_24FC243F4, v0);
}

uint64_t sub_24FC243F4()
{
  sub_24FC12030();
  *(void *)(v1 + 24) = OBJC_IVAR____TtC19GenerativeFunctions15JsonTokenStream_currentCharacter;
  sub_24FC2C034();
  if (v0 && (sub_24FC2C01C(), char v2 = sub_24FC4F7C8(), swift_bridgeObjectRelease(), (v2 & 1) != 0))
  {
    uint64_t v3 = (void *)swift_task_alloc();
    *(void *)(v1 + 32) = v3;
    *uint64_t v3 = v1;
    v3[1] = sub_24FC244E4;
    return sub_24FC256BC();
  }
  else
  {
    sub_24FC12110();
    return v5();
  }
}

uint64_t sub_24FC244E4()
{
  sub_24FC12240();
  sub_24FC0BAB0();
  uint64_t v3 = v2;
  sub_24FC1204C();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  sub_24FC1203C();
  *uint64_t v6 = v5;
  swift_task_dealloc();
  if (v0)
  {
    sub_24FC24018();
    return v7();
  }
  else
  {
    sub_24FC2BDA0();
    return MEMORY[0x270FA2498](v9, v10, v11);
  }
}

uint64_t sub_24FC245E8()
{
  sub_24FC12030();
  if (*(void *)(v0[2] + v0[3] + 8)
    && (sub_24FC2C01C(), char v1 = sub_24FC4F7C8(), swift_bridgeObjectRelease(), (v1 & 1) != 0))
  {
    uint64_t v2 = (void *)swift_task_alloc();
    v0[4] = v2;
    void *v2 = v0;
    v2[1] = sub_24FC244E4;
    return sub_24FC256BC();
  }
  else
  {
    sub_24FC12110();
    return v4();
  }
}

uint64_t sub_24FC246D0()
{
  *(void *)(v1 + 64) = v0;
  *(void *)(v1 + 72) = *v0;
  return sub_24FC24010((uint64_t)sub_24FC24714, (uint64_t)v0);
}

uint64_t sub_24FC24714()
{
  sub_24FC12030();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 80) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_24FC2479C;
  uint64_t v2 = sub_24FC2BC48();
  return sub_24FC27AAC(v2, v3);
}

uint64_t sub_24FC2479C()
{
  sub_24FC12240();
  sub_24FC0BAB0();
  uint64_t v3 = v2;
  sub_24FC1204C();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  sub_24FC1203C();
  *uint64_t v6 = v5;
  swift_task_dealloc();
  if (v0)
  {
    sub_24FC24018();
    return v7();
  }
  else
  {
    sub_24FC2BDA0();
    return MEMORY[0x270FA2498](v9, v10, v11);
  }
}

uint64_t sub_24FC248A0()
{
  sub_24FC12240();
  v0[2] = 0;
  uint64_t v1 = v0[8];
  v0[3] = 0xE000000000000000;
  uint64_t v2 = OBJC_IVAR____TtC19GenerativeFunctions15JsonTokenStream_currentCharacter;
  v0[11] = OBJC_IVAR____TtC19GenerativeFunctions15JsonTokenStream_currentCharacter;
  uint64_t v3 = (uint64_t *)(v1 + v2);
  uint64_t v4 = v3[1];
  if (!v4 || (uint64_t v5 = *v3, sub_24FC2C1D0(), v6) && v5 == 34 || (sub_24FC2BC10() & 1) != 0)
  {
    unint64_t v7 = (void *)swift_task_alloc();
    v0[24] = v7;
    void *v7 = v0;
    v7[1] = sub_24FC25574;
    uint64_t v8 = sub_24FC2BC48();
    return sub_24FC27AAC(v8, v9);
  }
  else
  {
    if (v4 == 0xE100000000000000 && v5 == 92 || (sub_24FC2BC10() & 1) != 0)
    {
      uint64_t v11 = (void *)swift_task_alloc();
      v0[12] = v11;
      *uint64_t v11 = v0;
      uint64_t v12 = sub_24FC24A88;
    }
    else
    {
      sub_24FC2BF88();
      sub_24FC4F7D8();
      swift_bridgeObjectRelease();
      sub_24FC2BF54();
      swift_bridgeObjectRelease();
      uint64_t v13 = swift_task_alloc();
      uint64_t v11 = (void *)sub_24FC2BDAC(v13);
      *uint64_t v11 = v14;
      uint64_t v12 = sub_24FC25298;
    }
    v11[1] = v12;
    sub_24FC2BFE8();
    return sub_24FC256BC();
  }
}

uint64_t sub_24FC24A88()
{
  sub_24FC12240();
  sub_24FC2BB58();
  uint64_t v3 = v2;
  sub_24FC1203C();
  *uint64_t v4 = v3;
  *uint64_t v4 = *v1;
  *(void *)(v3 + 104) = v0;
  swift_task_dealloc();
  sub_24FC2BF14();
  if (v0) {
    swift_bridgeObjectRelease();
  }
  sub_24FC2BCB0();
  return MEMORY[0x270FA2498](v5, v6, v7);
}

uint64_t sub_24FC24B84()
{
  sub_24FC12258();
  sub_24FC2C0BC();
  if (!v0)
  {
    swift_bridgeObjectRelease();
    sub_24FC2A360();
    swift_allocError();
    *(void *)uint64_t v8 = 0;
    *(void *)(v8 + 8) = 0;
    *(unsigned char *)(v8 + 16) = 2;
    swift_willThrow();
    goto LABEL_14;
  }
  BOOL v3 = *v2 == 117 && v0 == 0xE100000000000000;
  if (v3 || (sub_24FC2C15C(), (sub_24FC2BC10() & 1) != 0))
  {
    uint64_t v4 = (void *)swift_task_alloc();
    v1[14] = v4;
    *uint64_t v4 = v1;
    uint64_t v5 = sub_24FC24D4C;
    goto LABEL_8;
  }
  uint64_t v9 = v1[13];
  swift_bridgeObjectRetain();
  uint64_t v10 = sub_24FC2C15C();
  sub_24FC29200(v10, v11);
  if (v9)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_14:
    sub_24FC0BAC8();
    sub_24FC2BEE8();
    __asm { BRAA            X1, X16 }
  }
  swift_bridgeObjectRelease();
  sub_24FC4F898();
  swift_bridgeObjectRelease();
  uint64_t v4 = (void *)swift_task_alloc();
  v1[20] = v4;
  *uint64_t v4 = v1;
  uint64_t v5 = sub_24FC2519C;
LABEL_8:
  v4[1] = v5;
  sub_24FC2BFE8();
  sub_24FC2BEE8();
  return sub_24FC256BC();
}

uint64_t sub_24FC24D4C()
{
  sub_24FC12030();
  sub_24FC0BAB0();
  BOOL v3 = v2;
  sub_24FC1204C();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  sub_24FC1203C();
  *uint64_t v6 = v5;
  v3[15] = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v7 = v3[8];
    swift_bridgeObjectRelease();
    return MEMORY[0x270FA2498](sub_24FC25694, v7, 0);
  }
  else
  {
    uint64_t v8 = (void *)swift_task_alloc();
    v3[16] = v8;
    *uint64_t v8 = v5;
    v8[1] = sub_24FC24E90;
    return sub_24FC27CDC();
  }
}

uint64_t sub_24FC24E90()
{
  sub_24FC12240();
  sub_24FC2BB58();
  BOOL v3 = v2;
  sub_24FC1203C();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  sub_24FC1204C();
  *uint64_t v6 = v5;
  v3[17] = v7;
  v3[18] = v8;
  v3[19] = v0;
  swift_task_dealloc();
  sub_24FC2BF14();
  if (v0) {
    swift_bridgeObjectRelease();
  }
  sub_24FC2BCB0();
  return MEMORY[0x270FA2498](v9, v10, v11);
}

uint64_t sub_24FC24F94()
{
  sub_24FC12240();
  uint64_t v2 = v1[18];
  if (v2)
  {
    v1[6] = v1[17];
    v1[7] = v2;
    sub_24FC4F938();
    uint64_t v0 = v3;
    sub_24FC4F898();
    swift_bridgeObjectRelease();
  }
  sub_24FC2C0BC();
  if (!v0 || (uint64_t v5 = *v4, sub_24FC2C1D0(), v6) && v5 == 34 || (sub_24FC2BC10() & 1) != 0)
  {
    uint64_t v7 = (void *)swift_task_alloc();
    v1[24] = v7;
    void *v7 = v1;
    v7[1] = sub_24FC25574;
    uint64_t v8 = sub_24FC2BC48();
    return sub_24FC27AAC(v8, v9);
  }
  else
  {
    if (v0 == 0xE100000000000000 && v5 == 92 || (sub_24FC2BC10() & 1) != 0)
    {
      uint64_t v11 = (void *)swift_task_alloc();
      v1[12] = v11;
      *uint64_t v11 = v1;
      uint64_t v12 = sub_24FC24A88;
    }
    else
    {
      sub_24FC2BF88();
      sub_24FC4F7D8();
      swift_bridgeObjectRelease();
      sub_24FC2BF54();
      swift_bridgeObjectRelease();
      uint64_t v13 = swift_task_alloc();
      uint64_t v11 = (void *)sub_24FC2BDAC(v13);
      *uint64_t v11 = v14;
      uint64_t v12 = sub_24FC25298;
    }
    v11[1] = v12;
    sub_24FC2BFE8();
    return sub_24FC256BC();
  }
}

uint64_t sub_24FC2519C()
{
  sub_24FC12240();
  sub_24FC2BB58();
  uint64_t v3 = v2;
  sub_24FC1203C();
  *uint64_t v4 = v3;
  *uint64_t v4 = *v1;
  *(void *)(v3 + 168) = v0;
  swift_task_dealloc();
  sub_24FC2BF14();
  if (v0) {
    swift_bridgeObjectRelease();
  }
  sub_24FC2BCB0();
  return MEMORY[0x270FA2498](v5, v6, v7);
}

uint64_t sub_24FC25298()
{
  sub_24FC12240();
  sub_24FC2BB58();
  uint64_t v3 = v2;
  sub_24FC1203C();
  *uint64_t v4 = v3;
  *uint64_t v4 = *v1;
  *(void *)(v3 + 184) = v0;
  swift_task_dealloc();
  sub_24FC2BF14();
  if (v0) {
    swift_bridgeObjectRelease();
  }
  sub_24FC2BCB0();
  return MEMORY[0x270FA2498](v5, v6, v7);
}

uint64_t sub_24FC25394()
{
  sub_24FC12240();
  uint64_t v1 = (uint64_t *)(v0[8] + v0[11]);
  uint64_t v2 = v1[1];
  if (!v2 || (uint64_t v3 = *v1, v2 == 0xE100000000000000) && v3 == 34 || (sub_24FC2161C(), (sub_24FC2BC10() & 1) != 0))
  {
    uint64_t v4 = (void *)swift_task_alloc();
    v0[24] = v4;
    *uint64_t v4 = v0;
    v4[1] = sub_24FC25574;
    uint64_t v5 = sub_24FC2BC48();
    return sub_24FC27AAC(v5, v6);
  }
  else
  {
    if (v2 == 0xE100000000000000 && v3 == 92 || (sub_24FC2161C(), (sub_24FC2BC10() & 1) != 0))
    {
      uint64_t v8 = (void *)swift_task_alloc();
      v0[12] = v8;
      *uint64_t v8 = v0;
      uint64_t v9 = sub_24FC24A88;
    }
    else
    {
      v0[4] = 0;
      v0[5] = 0xE000000000000000;
      swift_bridgeObjectRetain();
      sub_24FC2C15C();
      sub_24FC4F7D8();
      swift_bridgeObjectRelease();
      sub_24FC2BF54();
      swift_bridgeObjectRelease();
      uint64_t v10 = swift_task_alloc();
      uint64_t v8 = (void *)sub_24FC2BDAC(v10);
      *uint64_t v8 = v11;
      uint64_t v9 = sub_24FC25298;
    }
    v8[1] = v9;
    sub_24FC2BFE8();
    return sub_24FC256BC();
  }
}

uint64_t sub_24FC25574()
{
  sub_24FC12240();
  sub_24FC2BB58();
  uint64_t v3 = v2;
  sub_24FC1203C();
  *uint64_t v4 = v3;
  *uint64_t v4 = *v1;
  *(void *)(v3 + 200) = v0;
  swift_task_dealloc();
  sub_24FC2BF14();
  if (v0) {
    swift_bridgeObjectRelease();
  }
  sub_24FC2BCB0();
  return MEMORY[0x270FA2498](v5, v6, v7);
}

uint64_t sub_24FC25670()
{
  sub_24FC2BC84();
  return v0();
}

uint64_t sub_24FC2568C()
{
  return sub_24FC2129C();
}

uint64_t sub_24FC25694()
{
  return sub_24FC2129C();
}

uint64_t sub_24FC2569C()
{
  return sub_24FC2129C();
}

uint64_t sub_24FC256A4()
{
  return sub_24FC2129C();
}

uint64_t sub_24FC256AC()
{
  return sub_24FC2129C();
}

uint64_t sub_24FC256B4()
{
  return sub_24FC2129C();
}

uint64_t sub_24FC256BC()
{
  *(void *)(v1 + 40) = v0;
  return sub_24FC24010((uint64_t)sub_24FC256D8, v0);
}

uint64_t sub_24FC256D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  sub_24FC2BFD0();
  sub_24FC1249C();
  uint64_t v11 = *(void *)(v10 + 40);
  uint64_t v12 = OBJC_IVAR____TtC19GenerativeFunctions15JsonTokenStream_readPosition;
  uint64_t v13 = *(void *)(v11 + OBJC_IVAR____TtC19GenerativeFunctions15JsonTokenStream_readPosition);
  sub_24FC2BDD8();
  swift_bridgeObjectRetain();
  uint64_t v14 = sub_24FC4F868();
  swift_bridgeObjectRelease();
  uint64_t v15 = *(void *)(v10 + 40);
  if (v13 < v14)
  {
    swift_bridgeObjectRetain();
    sub_24FC4F878();
    uint64_t v16 = sub_24FC4F918();
    uint64_t v18 = v17;
    swift_bridgeObjectRelease();
    uint64_t v19 = (uint64_t *)(v15 + OBJC_IVAR____TtC19GenerativeFunctions15JsonTokenStream_currentCharacter);
    *uint64_t v19 = v16;
    v19[1] = v18;
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v21 = *(void *)(v11 + v12);
    BOOL v22 = __OFADD__(v21, 1);
    uint64_t v23 = v21 + 1;
    if (v22)
    {
      __break(1u);
      return result;
    }
    *(void *)(v11 + v12) = v23;
    goto LABEL_6;
  }
  if (*(unsigned char *)(v15 + OBJC_IVAR____TtC19GenerativeFunctions15JsonTokenStream_complete))
  {
    uint64_t v24 = (void *)(v15 + OBJC_IVAR____TtC19GenerativeFunctions15JsonTokenStream_currentCharacter);
    *uint64_t v24 = 0;
    v24[1] = 0;
    swift_bridgeObjectRelease();
LABEL_6:
    sub_24FC12110();
    sub_24FC2BBF8();
    return v26(v25, v26, v27, v28, v29, v30, v31, v32, a9, a10);
  }
  unsigned __int8 v33 = (void *)swift_task_alloc();
  *(void *)(v10 + 48) = v33;
  *unsigned __int8 v33 = v10;
  v33[1] = sub_24FC25890;
  sub_24FC2BBF8();
  return sub_24FC29514(v34);
}

uint64_t sub_24FC25890()
{
  sub_24FC12240();
  sub_24FC0BAB0();
  uint64_t v3 = v2;
  sub_24FC1204C();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  sub_24FC1203C();
  *uint64_t v6 = v5;
  swift_task_dealloc();
  if (v0)
  {
    sub_24FC24018();
    return v7();
  }
  else
  {
    uint64_t v9 = (void *)swift_task_alloc();
    *(void *)(v3 + 56) = v9;
    *uint64_t v9 = v5;
    v9[1] = sub_24FC0DF40;
    return sub_24FC256BC();
  }
}

uint64_t sub_24FC259C4(uint64_t a1, char a2)
{
  *(unsigned char *)(v3 + 96) = a2;
  *(void *)(v3 + 64) = a1;
  *(void *)(v3 + 72) = v2;
  return sub_24FC24010((uint64_t)sub_24FC259E4, v2);
}

void sub_24FC259E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  sub_24FC2BFD0();
  sub_24FC1249C();
  uint64_t v11 = v10[9];
  uint64_t v12 = OBJC_IVAR____TtC19GenerativeFunctions15JsonTokenStream_readPosition;
  uint64_t v13 = *(void *)(v11 + OBJC_IVAR____TtC19GenerativeFunctions15JsonTokenStream_readPosition);
  if (*(unsigned char *)(v11 + OBJC_IVAR____TtC19GenerativeFunctions15JsonTokenStream_complete) == 1)
  {
    sub_24FC2BDD8();
    swift_bridgeObjectRetain();
    uint64_t v14 = sub_24FC4F868();
    swift_bridgeObjectRelease();
    if (v13 >= v14)
    {
LABEL_12:
      sub_24FC2161C();
      sub_24FC2BBF8();
      v28(v25, v26, v27, v28, v29, v30, v31, v32, a9, a10);
      return;
    }
    uint64_t v15 = v10[8];
    uint64_t v16 = *(void *)(v11 + v12);
    BOOL v17 = __OFADD__(v16, v15);
    uint64_t v18 = v16 + v15;
    if (v17) {
      goto LABEL_19;
    }
    if (!__OFSUB__(v18, 1)) {
      goto LABEL_11;
    }
    __break(1u);
  }
  uint64_t v19 = v10[8];
  uint64_t v20 = v13 + v19;
  if (__OFADD__(v13, v19))
  {
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  sub_24FC2BDD8();
  swift_bridgeObjectRetain();
  uint64_t v21 = sub_24FC4F868();
  swift_bridgeObjectRelease();
  if (v20 < v21)
  {
    uint64_t v22 = v10[8];
    uint64_t v23 = *(void *)(v11 + v12);
    BOOL v17 = __OFADD__(v23, v22);
    uint64_t v24 = v23 + v22;
    if (!v17)
    {
      if (!__OFSUB__(v24, 1))
      {
LABEL_11:
        swift_bridgeObjectRetain();
        sub_24FC4F878();
        sub_24FC4F918();
        swift_bridgeObjectRelease();
        goto LABEL_12;
      }
LABEL_21:
      __break(1u);
      return;
    }
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  unsigned __int8 v33 = (void *)swift_task_alloc();
  v10[10] = v33;
  *unsigned __int8 v33 = v10;
  v33[1] = sub_24FC25BF8;
  sub_24FC2BBF8();
  sub_24FC29514(v34);
}

uint64_t sub_24FC25BF8()
{
  sub_24FC12240();
  sub_24FC0BAB0();
  uint64_t v3 = v2;
  sub_24FC1204C();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  sub_24FC1203C();
  *uint64_t v6 = v5;
  swift_task_dealloc();
  if (v0)
  {
    sub_24FC24018();
    return v7();
  }
  else
  {
    uint64_t v9 = (void *)swift_task_alloc();
    *(void *)(v3 + 88) = v9;
    *uint64_t v9 = v5;
    v9[1] = sub_24FC25D34;
    uint64_t v10 = *(unsigned __int8 *)(v3 + 96);
    uint64_t v11 = *(void *)(v3 + 64);
    return sub_24FC259C4(v11, v10);
  }
}

uint64_t sub_24FC25D34()
{
  sub_24FC12240();
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  sub_24FC0BAB0();
  uint64_t v6 = *v1;
  sub_24FC1203C();
  void *v7 = v6;
  uint64_t v8 = swift_task_dealloc();
  uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t))(v6 + 8);
  if (!v0)
  {
    uint64_t v8 = v5;
    uint64_t v9 = v3;
  }
  return v10(v8, v9);
}

uint64_t sub_24FC25E14(uint64_t a1)
{
  *(void *)(v2 + 32) = a1;
  *(void *)(v2 + 40) = v1;
  return sub_24FC24010((uint64_t)sub_24FC25E30, v1);
}

void sub_24FC25E30()
{
  *(void *)(v2 + 48) = OBJC_IVAR____TtC19GenerativeFunctions15JsonTokenStream_currentCharacter;
  sub_24FC2C034();
  uint64_t v3 = MEMORY[0x263F8EE78];
  if (!v1)
  {
LABEL_17:
    if (!*(void *)(v3 + 16))
    {
      uint64_t v18 = *(void *)(v2 + 32);
      swift_bridgeObjectRelease();
      *(void *)(v18 + 32) = 0;
      *(_OWORD *)uint64_t v18 = 0u;
      *(_OWORD *)(v18 + 16) = 0u;
      goto LABEL_75;
    }
    uint64_t v12 = v2 + 16;
    *(void *)(v2 + 16) = v3;
    uint64_t v13 = sub_24FC13C3C(&qword_269A5CDF0);
    sub_24FC2A3AC();
    sub_24FC2BC68();
    sub_24FC2BE08();
    if (!v16)
    {
      swift_bridgeObjectRelease();
      goto LABEL_74;
    }
    if ((v12 & 0x1000000000000000) != 0)
    {
      uint64_t v13 = sub_24FC2B600(v14, v2 + 16, 10, (uint64_t (*)(void *, uint64_t, uint64_t))sub_24FC2AE88);
      LOBYTE(v3) = v41;
      goto LABEL_64;
    }
    if ((v12 & 0x2000000000000000) == 0)
    {
      if ((v14 & 0x1000000000000000) != 0) {
        BOOL v17 = (unsigned __int8 *)((v12 & 0xFFFFFFFFFFFFFFFLL) + 32);
      }
      else {
        BOOL v17 = (unsigned __int8 *)sub_24FC4FB98();
      }
      uint64_t v13 = (uint64_t)sub_24FC2AE88(v17, v15, 10);
      LOBYTE(v3) = v24 & 1;
LABEL_64:
      swift_bridgeObjectRelease();
      if ((v3 & 1) == 0)
      {
        unsigned __int8 v33 = *(uint64_t **)(v2 + 32);
        uint64_t v34 = MEMORY[0x263F8D700];
        v33[3] = MEMORY[0x263F8D6C8];
        v33[4] = v34;
        *unsigned __int8 v33 = v13;
        goto LABEL_75;
      }
LABEL_74:
      uint64_t v38 = *(void *)(v2 + 32);
      *(void *)(v38 + 32) = 0;
      *(_OWORD *)uint64_t v38 = 0u;
      *(_OWORD *)(v38 + 16) = 0u;
LABEL_75:
      sub_24FC12110();
      sub_24FC2C008();
      __asm { BRAA            X1, X16 }
    }
    sub_24FC2C1F0();
    if (v21)
    {
      if (!v19) {
        goto LABEL_81;
      }
      if (v19 != 1)
      {
        sub_24FC2BB98();
        if (!(!v21 & v8))
        {
          uint64_t v13 = v26;
          if (v25 == 2) {
            goto LABEL_63;
          }
          sub_24FC2BC5C();
          if (!(!v21 & v8))
          {
            sub_24FC2C1A8();
            if (!v21)
            {
              sub_24FC2BD34();
              while (1)
              {
                sub_24FC2BC28();
                if (!v21 & v8) {
                  goto LABEL_49;
                }
                sub_24FC2BB84();
                if (!v21) {
                  goto LABEL_49;
                }
                uint64_t v13 = v28 + v27;
                if (__OFADD__(v28, v27)) {
                  goto LABEL_49;
                }
                sub_24FC2BC38();
                if (v21) {
                  goto LABEL_64;
                }
              }
            }
            goto LABEL_63;
          }
        }
      }
    }
    else
    {
      if (v20 == 45)
      {
        if (v19)
        {
          if (v19 == 1) {
            goto LABEL_49;
          }
          sub_24FC2BB98();
          if (!v21 & v8) {
            goto LABEL_49;
          }
          if (v22 == 2)
          {
            LOBYTE(v3) = 0;
            uint64_t v13 = -(uint64_t)v23;
            goto LABEL_64;
          }
          sub_24FC2C0E4();
          if (!v21 & v8) {
            goto LABEL_49;
          }
          sub_24FC2BEFC();
          if (!v21)
          {
            sub_24FC2BD34();
            while (1)
            {
              sub_24FC2BC28();
              if (!v21 & v8) {
                goto LABEL_49;
              }
              sub_24FC2BB84();
              if (!v21) {
                goto LABEL_49;
              }
              uint64_t v13 = v36 - v35;
              if (__OFSUB__(v36, v35)) {
                goto LABEL_49;
              }
              sub_24FC2BC38();
              if (v21) {
                goto LABEL_64;
              }
            }
          }
LABEL_63:
          LOBYTE(v3) = 0;
          goto LABEL_64;
        }
        __break(1u);
LABEL_81:
        __break(1u);
        return;
      }
      if (v19)
      {
        sub_24FC2BC5C();
        if (!(!v21 & v8))
        {
          uint64_t v13 = v30;
          if (v29 == 1) {
            goto LABEL_63;
          }
          sub_24FC2BB98();
          if (!(!v21 & v8))
          {
            sub_24FC2C1BC();
            if (!v21)
            {
              while (1)
              {
                sub_24FC2BC28();
                if (!v21 & v8) {
                  goto LABEL_49;
                }
                sub_24FC2BB84();
                if (!v21) {
                  goto LABEL_49;
                }
                uint64_t v13 = v32 + v31;
                if (__OFADD__(v32, v31)) {
                  goto LABEL_49;
                }
                sub_24FC2BC38();
                if (v21) {
                  goto LABEL_64;
                }
              }
            }
            goto LABEL_63;
          }
        }
      }
    }
LABEL_49:
    uint64_t v13 = 0;
    LOBYTE(v3) = 1;
    goto LABEL_64;
  }
  sub_24FC2C01C();
  if ((sub_24FC4F7F8() & 1) == 0 && (v1 != 0xE100000000000000 || v0 != 46) && (sub_24FC2BC10() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_17;
  }
  if (v1 != 0xE100000000000000 || v0 != 46)
  {
    char v5 = sub_24FC2BC10();
    uint64_t v4 = (void *)MEMORY[0x263F8EE78];
    if (swift_isUniquelyReferenced_nonNull_native()) {
      goto LABEL_11;
    }
    goto LABEL_9;
  }
  uint64_t v4 = (void *)MEMORY[0x263F8EE78];
  char v5 = 1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
LABEL_9:
  }
    uint64_t v4 = sub_24FC2A434(0, *(void *)(v3 + 16) + 1, 1, v3, &qword_269A5CE08, (void (*)(void, uint64_t, void *, uint64_t))sub_24FC2A7CC, (void (*)(uint64_t, uint64_t, void *))sub_24FC2AB00);
LABEL_11:
  *(unsigned char *)(v2 + 80) = v5 & 1;
  uint64_t v6 = v4[2];
  sub_24FC2C040();
  if (v8)
  {
    BOOL v37 = sub_24FC2BCF0(v7);
    uint64_t v4 = sub_24FC2A434((void *)v37, v3, 1, (uint64_t)v4, &qword_269A5CE08, (void (*)(void, uint64_t, void *, uint64_t))sub_24FC2A7CC, (void (*)(uint64_t, uint64_t, void *))sub_24FC2AB00);
  }
  *(void *)(v2 + 56) = v4;
  v4[2] = v3;
  uint64_t v9 = &v4[2 * v6];
  v9[4] = v0;
  v9[5] = v1;
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v2 + 64) = v10;
  void *v10 = v2;
  v10[1] = sub_24FC262CC;
  sub_24FC2C008();
  sub_24FC256BC();
}

uint64_t sub_24FC262CC()
{
  sub_24FC12240();
  sub_24FC0BAB0();
  uint64_t v3 = v2;
  sub_24FC1204C();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  sub_24FC1203C();
  *uint64_t v6 = v5;
  *(void *)(v3 + 72) = v0;
  swift_task_dealloc();
  if (v0)
  {
    swift_bridgeObjectRelease();
    sub_24FC24018();
    return v7();
  }
  else
  {
    sub_24FC2BDA0();
    return MEMORY[0x270FA2498](v9, v10, v11);
  }
}

void sub_24FC263DC()
{
  uint64_t v1 = (uint64_t *)(*(void *)(v0 + 40) + *(void *)(v0 + 48));
  uint64_t v2 = v1[1];
  uint64_t v3 = *(void *)(v0 + 72);
  uint64_t v4 = *(void **)(v0 + 56);
  int v5 = *(unsigned __int8 *)(v0 + 80);
  if (!v2)
  {
LABEL_24:
    if (!v4[2])
    {
LABEL_28:
      uint64_t v23 = *(void *)(v0 + 32);
      swift_bridgeObjectRelease();
      *(void *)(v23 + 32) = 0;
      *(_OWORD *)uint64_t v23 = 0u;
      *(_OWORD *)(v23 + 16) = 0u;
      goto LABEL_88;
    }
    if (v5) {
      goto LABEL_26;
    }
    uint64_t v24 = v0 + 16;
    *(void *)(v0 + 16) = v4;
    uint64_t v25 = sub_24FC13C3C(&qword_269A5CDF0);
    sub_24FC2A3AC();
    sub_24FC2BE20();
    sub_24FC2BE08();
    if (!v28)
    {
      swift_bridgeObjectRelease();
LABEL_86:
      uint64_t v20 = *(void *)(v0 + 32);
LABEL_87:
      *(void *)(v20 + 32) = 0;
      *(_OWORD *)uint64_t v20 = 0u;
      *(_OWORD *)(v20 + 16) = 0u;
LABEL_88:
      sub_24FC12110();
      sub_24FC2C008();
      __asm { BRAA            X1, X16 }
    }
    if ((v25 & 0x1000000000000000) != 0)
    {
      uint64_t v24 = sub_24FC2B600(v26, v25, 10, (uint64_t (*)(void *, uint64_t, uint64_t))sub_24FC2AE88);
      LOBYTE(v3) = v53;
      goto LABEL_76;
    }
    if ((v25 & 0x2000000000000000) == 0)
    {
      if ((v26 & 0x1000000000000000) != 0) {
        uint64_t v29 = (unsigned __int8 *)((v25 & 0xFFFFFFFFFFFFFFFLL) + 32);
      }
      else {
        uint64_t v29 = (unsigned __int8 *)sub_24FC4FB98();
      }
      unsigned __int8 v30 = sub_24FC2AE88(v29, v27, 10);
      if (v3)
      {
        sub_24FC2C008();
        return;
      }
      uint64_t v24 = (uint64_t)v30;
      LOBYTE(v3) = v31 & 1;
LABEL_76:
      swift_bridgeObjectRelease();
      if ((v3 & 1) == 0)
      {
        unsigned __int8 v44 = *(uint64_t **)(v0 + 32);
        uint64_t v45 = MEMORY[0x263F8D700];
        v44[3] = MEMORY[0x263F8D6C8];
        v44[4] = v45;
        *unsigned __int8 v44 = v24;
        goto LABEL_88;
      }
      goto LABEL_86;
    }
    sub_24FC2C1F0();
    if (v7)
    {
      if (!v32) {
        goto LABEL_94;
      }
      if (v32 != 1)
      {
        sub_24FC2BB98();
        if (!(!v7 & v13))
        {
          uint64_t v24 = v37;
          if (v36 == 2) {
            goto LABEL_75;
          }
          sub_24FC2BC5C();
          if (!(!v7 & v13))
          {
            sub_24FC2C1A8();
            if (!v7)
            {
              sub_24FC2BD34();
              while (1)
              {
                sub_24FC2BC28();
                if (!v7 & v13) {
                  goto LABEL_61;
                }
                sub_24FC2BB84();
                if (!v7) {
                  goto LABEL_61;
                }
                uint64_t v24 = v39 + v38;
                if (__OFADD__(v39, v38)) {
                  goto LABEL_61;
                }
                sub_24FC2BC38();
                if (v7) {
                  goto LABEL_76;
                }
              }
            }
            goto LABEL_75;
          }
        }
      }
    }
    else
    {
      if (v33 == 45)
      {
        if (v32)
        {
          if (v32 == 1) {
            goto LABEL_61;
          }
          sub_24FC2BB98();
          if (!v7 & v13) {
            goto LABEL_61;
          }
          if (v34 == 2)
          {
            LOBYTE(v3) = 0;
            uint64_t v24 = -(uint64_t)v35;
            goto LABEL_76;
          }
          sub_24FC2C0E4();
          if (!v7 & v13) {
            goto LABEL_61;
          }
          sub_24FC2BEFC();
          if (!v7)
          {
            sub_24FC2BD34();
            while (1)
            {
              sub_24FC2BC28();
              if (!v7 & v13) {
                goto LABEL_61;
              }
              sub_24FC2BB84();
              if (!v7) {
                goto LABEL_61;
              }
              uint64_t v24 = v47 - v46;
              if (__OFSUB__(v47, v46)) {
                goto LABEL_61;
              }
              sub_24FC2BC38();
              if (v7) {
                goto LABEL_76;
              }
            }
          }
LABEL_75:
          LOBYTE(v3) = 0;
          goto LABEL_76;
        }
        __break(1u);
LABEL_94:
        __break(1u);
        return;
      }
      if (v32)
      {
        sub_24FC2BC5C();
        if (!(!v7 & v13))
        {
          uint64_t v24 = v41;
          if (v40 == 1) {
            goto LABEL_75;
          }
          sub_24FC2BB98();
          if (!(!v7 & v13))
          {
            sub_24FC2C1BC();
            if (!v7)
            {
              while (1)
              {
                sub_24FC2BC28();
                if (!v7 & v13) {
                  goto LABEL_61;
                }
                sub_24FC2BB84();
                if (!v7) {
                  goto LABEL_61;
                }
                uint64_t v24 = v43 + v42;
                if (__OFADD__(v43, v42)) {
                  goto LABEL_61;
                }
                sub_24FC2BC38();
                if (v7) {
                  goto LABEL_76;
                }
              }
            }
            goto LABEL_75;
          }
        }
      }
    }
LABEL_61:
    uint64_t v24 = 0;
    LOBYTE(v3) = 1;
    goto LABEL_76;
  }
  uint64_t v6 = *v1;
  swift_bridgeObjectRetain();
  sub_24FC2C15C();
  if (sub_24FC4F7F8())
  {
    if (v5) {
      goto LABEL_15;
    }
    goto LABEL_12;
  }
  sub_24FC2C1D0();
  if ((!v7 || v6 != 46) && (sub_24FC2BC10() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_24;
  }
  if (v5)
  {
    swift_bridgeObjectRelease();
    if (!v4[2]) {
      goto LABEL_28;
    }
LABEL_26:
    *(void *)(v0 + 24) = v4;
    sub_24FC13C3C(&qword_269A5CDF0);
    sub_24FC2A3AC();
    uint64_t v17 = sub_24FC2BE20();
    uint64_t v19 = sub_24FC2791C(v17, v18);
    uint64_t v20 = *(void *)(v0 + 32);
    if ((v21 & 1) == 0)
    {
      uint64_t v22 = MEMORY[0x263F8D578];
      *(void *)(v20 + 24) = MEMORY[0x263F8D538];
      *(void *)(v20 + 32) = v22;
      *(void *)uint64_t v20 = v19;
      goto LABEL_88;
    }
    goto LABEL_87;
  }
LABEL_12:
  sub_24FC2C1D0();
  if (!v7 || v6 != 46)
  {
    int64_t v10 = sub_24FC2BC10();
    if (swift_isUniquelyReferenced_nonNull_native()) {
      goto LABEL_16;
    }
LABEL_22:
    uint64_t v4 = sub_24FC2C0A4(0, v4[2] + 1, v8, v9, &qword_269A5CE08, (void (*)(void, uint64_t, void *, uint64_t))sub_24FC2A7CC, (void (*)(uint64_t, uint64_t, void *))sub_24FC2AB00);
    goto LABEL_16;
  }
LABEL_15:
  int64_t v10 = 1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    goto LABEL_22;
  }
LABEL_16:
  *(unsigned char *)(v0 + 80) = v10 & 1;
  uint64_t v11 = v4[2];
  sub_24FC2C040();
  if (v13)
  {
    BOOL v48 = sub_24FC2BCF0(v12);
    uint64_t v4 = sub_24FC2C0A4((void *)v48, v10, v49, v50, &qword_269A5CE08, (void (*)(void, uint64_t, void *, uint64_t))sub_24FC2A7CC, (void (*)(uint64_t, uint64_t, void *))sub_24FC2AB00);
  }
  *(void *)(v0 + 56) = v4;
  v4[2] = v10;
  uint64_t v14 = &v4[2 * v11];
  v14[4] = v6;
  v14[5] = v2;
  uint64_t v15 = (void *)swift_task_alloc();
  *(void *)(v0 + 64) = v15;
  *uint64_t v15 = v0;
  v15[1] = sub_24FC262CC;
  sub_24FC2C008();
  sub_24FC256BC();
}

uint64_t sub_24FC268B4()
{
  *(void *)(v1 + 24) = v0;
  return sub_24FC24010((uint64_t)sub_24FC268D0, v0);
}

uint64_t sub_24FC268D0()
{
  sub_24FC12258();
  v2[4] = OBJC_IVAR____TtC19GenerativeFunctions15JsonTokenStream_currentCharacter;
  sub_24FC2C034();
  if (!v1)
  {
LABEL_11:
    v2[2] = MEMORY[0x263F8EE78];
    sub_24FC13C3C(&qword_269A5CDF0);
    sub_24FC2A3AC();
    sub_24FC2BC68();
    sub_24FC2BC84();
    sub_24FC2BEE8();
    __asm { BRAA            X3, X16 }
  }
  sub_24FC2C01C();
  if ((sub_24FC4F7E8() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_11;
  }
  uint64_t v3 = (void *)MEMORY[0x263F8EE78];
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v3 = sub_24FC2A434(0, v3[2] + 1, 1, (uint64_t)v3, &qword_269A5CE08, (void (*)(void, uint64_t, void *, uint64_t))sub_24FC2A7CC, (void (*)(uint64_t, uint64_t, void *))sub_24FC2AB00);
  }
  unint64_t v5 = v3[2];
  unint64_t v4 = v3[3];
  if (v5 >= v4 >> 1)
  {
    BOOL v12 = sub_24FC2BCF0(v4);
    uint64_t v3 = sub_24FC2A434((void *)v12, v5 + 1, 1, (uint64_t)v3, &qword_269A5CE08, (void (*)(void, uint64_t, void *, uint64_t))sub_24FC2A7CC, (void (*)(uint64_t, uint64_t, void *))sub_24FC2AB00);
  }
  v2[5] = v3;
  v3[2] = v5 + 1;
  uint64_t v6 = &v3[2 * v5];
  v6[4] = v0;
  v6[5] = v1;
  char v7 = (void *)swift_task_alloc();
  v2[6] = v7;
  void *v7 = v2;
  v7[1] = sub_24FC26AC4;
  sub_24FC2BEE8();
  return sub_24FC256BC();
}

uint64_t sub_24FC26AC4()
{
  sub_24FC12240();
  sub_24FC0BAB0();
  uint64_t v3 = v2;
  sub_24FC1204C();
  *unint64_t v4 = v3;
  uint64_t v5 = *v1;
  sub_24FC1203C();
  *uint64_t v6 = v5;
  swift_task_dealloc();
  if (v0)
  {
    swift_bridgeObjectRelease();
    sub_24FC24018();
    return v7();
  }
  else
  {
    sub_24FC2BDA0();
    return MEMORY[0x270FA2498](v9, v10, v11);
  }
}

uint64_t sub_24FC26BD0()
{
  sub_24FC12258();
  uint64_t v1 = (uint64_t *)(v0[3] + v0[4]);
  uint64_t v2 = v1[1];
  uint64_t v3 = (void *)v0[5];
  if (!v2)
  {
LABEL_11:
    v0[2] = v3;
    sub_24FC13C3C(&qword_269A5CDF0);
    sub_24FC2A3AC();
    sub_24FC2BC68();
    sub_24FC2BC84();
    sub_24FC2BEE8();
    __asm { BRAA            X3, X16 }
  }
  uint64_t v4 = *v1;
  swift_bridgeObjectRetain();
  if ((sub_24FC4F7E8() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_11;
  }
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v3 = sub_24FC2BDC0(0, v3[2] + 1, v5, v6, &qword_269A5CE08, (void (*)(void, uint64_t, void *, uint64_t))sub_24FC2A7CC, (void (*)(uint64_t, uint64_t, void *))sub_24FC2AB00);
  }
  unint64_t v8 = v3[2];
  unint64_t v7 = v3[3];
  if (v8 >= v7 >> 1)
  {
    BOOL v15 = sub_24FC2BCF0(v7);
    uint64_t v3 = sub_24FC2BDC0((void *)v15, v8 + 1, v16, v17, &qword_269A5CE08, (void (*)(void, uint64_t, void *, uint64_t))sub_24FC2A7CC, (void (*)(uint64_t, uint64_t, void *))sub_24FC2AB00);
  }
  v0[5] = v3;
  v3[2] = v8 + 1;
  uint64_t v9 = &v3[2 * v8];
  v9[4] = v4;
  v9[5] = v2;
  uint64_t v10 = (void *)swift_task_alloc();
  v0[6] = v10;
  void *v10 = v0;
  v10[1] = sub_24FC26AC4;
  sub_24FC2BEE8();
  return sub_24FC256BC();
}

uint64_t sub_24FC26DA8(uint64_t a1)
{
  uint64_t v27 = sub_24FC13C3C(&qword_269A5CEA8);
  sub_24FC14ED0();
  uint64_t v4 = v3;
  MEMORY[0x270FA5388](v5);
  sub_24FC126B4();
  uint64_t v8 = v7 - v6;
  sub_24FC13C3C(&qword_269A5CE48);
  sub_24FC14ED0();
  uint64_t v28 = v10;
  uint64_t v29 = v9;
  MEMORY[0x270FA5388](v9);
  sub_24FC126B4();
  uint64_t v13 = v12 - v11;
  uint64_t v26 = sub_24FC13C3C(&qword_269A5CE28);
  sub_24FC14ED0();
  uint64_t v15 = v14;
  MEMORY[0x270FA5388](v16);
  sub_24FC126B4();
  uint64_t v19 = v18 - v17;
  swift_defaultActor_initialize();
  *(void *)(v1 + OBJC_IVAR____TtC19GenerativeFunctions15JsonTokenStream_readPosition) = 0;
  uint64_t v20 = (void *)(v1 + OBJC_IVAR____TtC19GenerativeFunctions15JsonTokenStream_buffer);
  *uint64_t v20 = 0;
  v20[1] = 0xE000000000000000;
  *(unsigned char *)(v1 + OBJC_IVAR____TtC19GenerativeFunctions15JsonTokenStream_complete) = 0;
  *(void *)(v1 + OBJC_IVAR____TtC19GenerativeFunctions15JsonTokenStream_streamingTask) = 0;
  char v21 = (void *)(v1 + OBJC_IVAR____TtC19GenerativeFunctions15JsonTokenStream_currentCharacter);
  *char v21 = 0;
  v21[1] = 0;
  *(unsigned char *)(v1 + OBJC_IVAR____TtC19GenerativeFunctions15JsonTokenStream_started) = 0;
  uint64_t v22 = v1 + OBJC_IVAR____TtC19GenerativeFunctions15JsonTokenStream_sourceStream;
  uint64_t v23 = sub_24FC13C3C(&qword_269A5CD60);
  uint64_t v24 = *(void *)(v23 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v24 + 16))(v22, a1, v23);
  (*(void (**)(uint64_t, void, uint64_t))(v4 + 104))(v8, *MEMORY[0x263F8F680], v27);
  sub_24FC4FA18();
  (*(void (**)(uint64_t, uint64_t))(v24 + 8))(a1, v23);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v8, v27);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 32))(v1 + OBJC_IVAR____TtC19GenerativeFunctions15JsonTokenStream_inputStream, v19, v26);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v28 + 32))(v1 + OBJC_IVAR____TtC19GenerativeFunctions15JsonTokenStream_inputStreamContinuation, v13, v29);
  return v1;
}

uint64_t sub_24FC27058()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_24FC12014;
  return sub_24FC270E8();
}

uint64_t sub_24FC270E8()
{
  v1[19] = v0;
  uint64_t v2 = sub_24FC13C3C(&qword_269A5CE98);
  v1[20] = v2;
  v1[21] = *(void *)(v2 - 8);
  v1[22] = swift_task_alloc();
  uint64_t v3 = sub_24FC13C3C(&qword_269A5CEA0);
  v1[23] = v3;
  v1[24] = *(void *)(v3 - 8);
  v1[25] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24FC2720C, v0, 0);
}

uint64_t sub_24FC2720C()
{
  sub_24FC12258();
  if (qword_269A5C728 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_24FC4F6B8();
  v0[26] = sub_24FC20B5C(v1, (uint64_t)qword_269A5E9E0);
  uint64_t v2 = (void *)sub_24FC4F698();
  os_log_type_t v3 = sub_24FC4FAE8();
  if (sub_24FC2BE88(v3))
  {
    *(_WORD *)swift_slowAlloc() = 0;
    sub_24FC2BD64(&dword_24FC09000, v4, v5, "Source stream consumer task starting");
    sub_24FC211C4();
  }

  v0[13] = 0;
  v0[14] = 0xE000000000000000;
  sub_24FC13C3C(&qword_269A5CD60);
  sub_24FC4F9B8();
  unint64_t v6 = sub_24FC2B7B8();
  uint64_t v7 = OBJC_IVAR____TtC19GenerativeFunctions15JsonTokenStream_inputStreamContinuation;
  v0[27] = v6;
  v0[28] = v7;
  uint64_t v8 = (void *)swift_task_alloc();
  v0[29] = v8;
  *uint64_t v8 = v0;
  v8[1] = sub_24FC273A4;
  sub_24FC2BEE8();
  return MEMORY[0x270FA20F8](v9);
}

uint64_t sub_24FC273A4()
{
  sub_24FC12030();
  sub_24FC0BAB0();
  uint64_t v3 = v2;
  sub_24FC1204C();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  sub_24FC1203C();
  *unint64_t v6 = v5;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v7 = *(void *)(v3 + 152);
    swift_bridgeObjectRelease();
    uint64_t v8 = sub_24FC27740;
    uint64_t v9 = v7;
  }
  else
  {
    uint64_t v9 = *(void *)(v3 + 152);
    uint64_t v8 = sub_24FC27494;
  }
  return MEMORY[0x270FA2498](v8, v9, 0);
}

uint64_t sub_24FC27494()
{
  uint64_t v1 = v0[11];
  unint64_t v2 = v0[12];
  if (v2)
  {
    uint64_t v21 = v0[11];
    uint64_t v3 = HIBYTE(v2) & 0xF;
    v0[2] = v1;
    v0[3] = v2;
    if ((v2 & 0x2000000000000000) == 0) {
      uint64_t v3 = v1 & 0xFFFFFFFFFFFFLL;
    }
    v0[4] = 0;
    v0[5] = v3;
    swift_bridgeObjectRetain();
    for (uint64_t i = sub_24FC4F8A8(); v5; uint64_t i = sub_24FC4F8A8())
    {
      uint64_t v6 = v0[21];
      uint64_t v7 = v0[22];
      uint64_t v8 = v0[20];
      v0[9] = i;
      v0[10] = v5;
      sub_24FC13C3C(&qword_269A5CE48);
      sub_24FC4FA58();
      (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v7, v8);
    }
    swift_bridgeObjectRelease();
    MEMORY[0x253373140](v21, v2);
    swift_bridgeObjectRelease();
    uint64_t v9 = (void *)swift_task_alloc();
    v0[29] = v9;
    *uint64_t v9 = v0;
    v9[1] = sub_24FC273A4;
    uint64_t v10 = sub_24FC2C128();
    return MEMORY[0x270FA20F8](v10);
  }
  else
  {
    uint64_t v11 = v0[19];
    (*(void (**)(void, void))(v0[24] + 8))(v0[25], v0[23]);
    v0[17] = 0;
    sub_24FC13C3C(&qword_269A5CE48);
    sub_24FC4FA68();
    *(unsigned char *)(v11 + OBJC_IVAR____TtC19GenerativeFunctions15JsonTokenStream_complete) = 1;
    uint64_t v13 = v0[13];
    uint64_t v12 = v0[14];
    uint64_t v14 = (void *)(v11 + OBJC_IVAR____TtC19GenerativeFunctions15JsonTokenStream_buffer);
    swift_beginAccess();
    *uint64_t v14 = v13;
    v14[1] = v12;
    swift_bridgeObjectRelease();
    uint64_t v15 = (void *)sub_24FC4F698();
    os_log_type_t v16 = sub_24FC4FAE8();
    if (sub_24FC2BE88(v16))
    {
      *(_WORD *)swift_slowAlloc() = 0;
      sub_24FC2BD64(&dword_24FC09000, v17, v18, "Source stream is now completely consumed");
      sub_24FC211C4();
    }

    swift_task_dealloc();
    swift_task_dealloc();
    sub_24FC0BAC8();
    return v19();
  }
}

uint64_t sub_24FC27740()
{
  sub_24FC1249C();
  (*(void (**)(void, void))(v0[24] + 8))(v0[25], v0[23]);
  uint64_t v1 = v0[16];
  MEMORY[0x2533738D0](v1);
  MEMORY[0x2533738D0](v1);
  unint64_t v2 = sub_24FC4F698();
  os_log_type_t v3 = sub_24FC4FAF8();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)sub_24FC213F4();
    uint64_t v5 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 138412290;
    MEMORY[0x2533738D0](v1);
    uint64_t v6 = _swift_stdlib_bridgeErrorToNSError();
    v0[18] = v6;
    sub_24FC4FB18();
    *uint64_t v5 = v6;
    MEMORY[0x2533738C0](v1);
    MEMORY[0x2533738C0](v1);
    _os_log_impl(&dword_24FC09000, v2, v3, "Received an error from the ource stream while tokenizing: %@", v4, 0xCu);
    sub_24FC13C3C(qword_269A5CD10);
    swift_arrayDestroy();
    sub_24FC211C4();
    sub_24FC211C4();
  }
  else
  {
    MEMORY[0x2533738C0](v1);
    MEMORY[0x2533738C0](v1);
  }

  v0[15] = v1;
  MEMORY[0x2533738D0](v1);
  sub_24FC13C3C(&qword_269A5CE48);
  sub_24FC4FA68();
  MEMORY[0x2533738C0](v1);
  swift_task_dealloc();
  swift_task_dealloc();
  sub_24FC0BAC8();
  return v7();
}

uint64_t sub_24FC2791C(uint64_t a1, uint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0 || !(a2 & 0x2000000000000000 | a1 & 0x1000000000000000))
  {
    sub_24FC4FB68();
    swift_bridgeObjectRelease();
    char v6 = v9;
  }
  else
  {
    MEMORY[0x270FA5388](a1);
    if ((a2 & 0x2000000000000000) != 0)
    {
      char v6 = (v3 > 0x20u || ((0x100003E01uLL >> v3) & 1) == 0)
        && (uint64_t v7 = (unsigned char *)_swift_stdlib_strtod_clocale()) != 0
        && *v7 == 0;
      swift_bridgeObjectRelease();
    }
    else
    {
      if ((v3 & 0x1000000000000000) != 0)
      {
        uint64_t v4 = (a2 & 0xFFFFFFFFFFFFFFFLL) + 32;
        uint64_t v5 = v3 & 0xFFFFFFFFFFFFLL;
      }
      else
      {
        uint64_t v4 = sub_24FC4FB98();
      }
      char v6 = sub_24FC2B6F8(v4, v5, (void (*)(uint64_t *__return_ptr))sub_24FC2B774);
      swift_bridgeObjectRelease();
    }
  }
  if (v6) {
    return 0;
  }
  else {
    return 0;
  }
}

uint64_t sub_24FC27AAC(uint64_t a1, uint64_t a2)
{
  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  return sub_24FC24010((uint64_t)sub_24FC27ACC, v2);
}

uint64_t sub_24FC27ACC()
{
  sub_24FC12258();
  uint64_t v1 = (uint64_t *)(v0[4] + OBJC_IVAR____TtC19GenerativeFunctions15JsonTokenStream_currentCharacter);
  uint64_t v3 = *v1;
  uint64_t v2 = v1[1];
  if (v2 && (v3 == v0[2] ? (BOOL v4 = v2 == v0[3]) : (BOOL v4 = 0), v4 || (sub_24FC4FC78() & 1) != 0))
  {
    uint64_t v5 = (void *)swift_task_alloc();
    v0[5] = v5;
    *uint64_t v5 = v0;
    v5[1] = sub_24FC27C1C;
    return sub_24FC256BC();
  }
  else
  {
    sub_24FC2A360();
    swift_allocError();
    *(void *)uint64_t v7 = v3;
    *(void *)(v7 + 8) = v2;
    *(unsigned char *)(v7 + 16) = 0;
    swift_bridgeObjectRetain();
    swift_willThrow();
    sub_24FC0BAC8();
    return v8();
  }
}

uint64_t sub_24FC27C1C()
{
  sub_24FC12030();
  sub_24FC0BAB0();
  uint64_t v1 = *v0;
  sub_24FC1203C();
  void *v2 = v1;
  swift_task_dealloc();
  sub_24FC0BAC8();
  return v3();
}

uint64_t sub_24FC27CDC()
{
  *(void *)(v1 + 96) = v0;
  return MEMORY[0x270FA2498](sub_24FC27CFC, v0, 0);
}

uint64_t sub_24FC27CFC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint8_t *a10, void *a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22,uint64_t a23,uint64_t a24)
{
  sub_24FC2126C();
  a23 = v28;
  a24 = v29;
  a22 = v26;
  uint64_t v30 = v26[12];
  uint64_t v31 = OBJC_IVAR____TtC19GenerativeFunctions15JsonTokenStream_currentCharacter;
  v26[13] = OBJC_IVAR____TtC19GenerativeFunctions15JsonTokenStream_currentCharacter;
  uint64_t v32 = *(void *)(v30 + v31 + 8);
  if (v32)
  {
    BOOL v33 = *(void *)(v30 + v31) == 34 && v32 == 0xE100000000000000;
    if (v33 || (sub_24FC2BC10() & 1) != 0)
    {
      if (qword_269A5C728 != -1) {
        swift_once();
      }
      uint64_t v34 = sub_24FC4F6B8();
      sub_24FC20B5C(v34, (uint64_t)qword_269A5E9E0);
      unsigned __int8 v35 = (void *)sub_24FC4F698();
      os_log_type_t v36 = sub_24FC4FAF8();
      if (!sub_24FC2BE88(v36)) {
        goto LABEL_12;
      }
      *(_WORD *)swift_slowAlloc() = 0;
      sub_24FC2BD64(&dword_24FC09000, v37, v38, "Unexpected use of unicode escape sequence");
      goto LABEL_11;
    }
  }
  v26[9] = MEMORY[0x263F8EE78];
  v26[14] = 0;
  sub_24FC2C034();
  if (v24)
  {
    swift_bridgeObjectRetain();
    uint64_t v49 = MEMORY[0x263F8EE78];
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      sub_24FC2BDC0(0, *(void *)(v49 + 16) + 1, v50, v51, &qword_269A5CE08, (void (*)(void, uint64_t, void *, uint64_t))sub_24FC2A7CC, (void (*)(uint64_t, uint64_t, void *))sub_24FC2AB00);
    }
    sub_24FC2C040();
    if (v53)
    {
      BOOL v89 = sub_24FC2BCF0(v52);
      sub_24FC2BDC0((void *)v89, v25, v90, v91, &qword_269A5CE08, (void (*)(void, uint64_t, void *, uint64_t))sub_24FC2A7CC, (void (*)(uint64_t, uint64_t, void *))sub_24FC2AB00);
    }
    sub_24FC2BDF0();
    uint64_t v54 = swift_task_alloc();
    uint64_t v55 = (void *)sub_24FC2C08C(v54);
    void *v55 = v56;
    v55[1] = sub_24FC2845C;
    sub_24FC2C1DC();
    sub_24FC211DC();
    return sub_24FC259C4(v57, v58);
  }
  if (*(void *)(v48 + 16) > 3uLL)
  {
    v26[5] = v48;
    sub_24FC13C3C(&qword_269A5CDF0);
    sub_24FC2A3AC();
    uint64_t v67 = sub_24FC4F928();
    unint64_t v69 = v68;
    swift_bridgeObjectRetain();
    sub_24FC29C58(v67, v69, 16);
    if (v70)
    {
      if (qword_269A5C728 != -1) {
        swift_once();
      }
      uint64_t v79 = sub_24FC4F6B8();
      sub_24FC20B5C(v79, (uint64_t)qword_269A5E9E0);
      swift_bridgeObjectRetain();
      unsigned __int8 v35 = (void *)sub_24FC4F698();
      os_log_type_t v80 = sub_24FC4FAF8();
      if (sub_24FC2BC94(v80))
      {
        a12 = v26 + 7;
        uint64_t v81 = (_DWORD *)sub_24FC213F4();
        sub_24FC21434();
        sub_24FC2BE7C();
        *uint64_t v81 = 136315138;
        swift_bridgeObjectRetain();
        v26[6] = sub_24FC49DD0(v67, v69, &a13);
        sub_24FC2BE60();
        swift_bridgeObjectRelease_n();
        sub_24FC2C168(&dword_24FC09000, v82, v83, "Failed to parse unicode sequence %s");
        sub_24FC2BCC0();
        sub_24FC211C4();
LABEL_11:
        sub_24FC211C4();
LABEL_12:

LABEL_13:
        sub_24FC2BC84();
        sub_24FC211DC();
        return v42(v39, v40, v41, v42, v43, v44, v45, v46, a9, a10, a11, a12, a13, a14, a15, a16);
      }
    }
    else
    {
      uint64_t v71 = sub_24FC4FD58();
      if ((v71 & 0x100000000) == 0)
      {
        unsigned int v72 = v71;
        uint64_t result = swift_bridgeObjectRelease();
        if ((v72 & 0xFFFFFF80) != 0)
        {
          sub_24FC2BAFC();
          if (v72 >= 0x800) {
            unsigned int v73 = v92;
          }
        }
        else
        {
          if (v72 > 0xFF)
          {
            __break(1u);
            return result;
          }
          unsigned int v73 = (v72 + 1);
        }
        v26[8] = (v73 + 0xFEFEFEFEFEFEFFLL) & ~(-1 << (8 * ((4 - (__clz(v73) >> 3)) & 7)));
        MEMORY[0x253373100](v26 + 8);
        goto LABEL_13;
      }
      if (qword_269A5C728 != -1) {
        swift_once();
      }
      uint64_t v84 = sub_24FC4F6B8();
      sub_24FC20B5C(v84, (uint64_t)qword_269A5E9E0);
      swift_bridgeObjectRetain();
      unsigned __int8 v35 = (void *)sub_24FC4F698();
      os_log_type_t v85 = sub_24FC4FAF8();
      if (sub_24FC2BD84(v85))
      {
        a12 = v26 + 8;
        uint64_t v86 = (_DWORD *)sub_24FC213F4();
        sub_24FC21434();
        sub_24FC2C098();
        *uint64_t v86 = 136315138;
        swift_bridgeObjectRetain();
        v26[7] = sub_24FC49DD0(v67, v69, &a13);
        sub_24FC4FB18();
        swift_bridgeObjectRelease_n();
        sub_24FC2BD44(&dword_24FC09000, v87, v88, "Failed to parse unicode sequence %s");
        sub_24FC2BCFC();
        sub_24FC211C4();
        goto LABEL_11;
      }
    }
    swift_bridgeObjectRelease_n();
    goto LABEL_12;
  }
  uint64_t v60 = v26 + 9;
  if (qword_269A5C728 != -1) {
    swift_once();
  }
  uint64_t v61 = sub_24FC4F6B8();
  sub_24FC20B5C(v61, (uint64_t)qword_269A5E9E0);
  swift_bridgeObjectRetain_n();
  uint64_t v62 = sub_24FC4F698();
  os_log_type_t v63 = sub_24FC4FAF8();
  if (sub_24FC2BD84(v63))
  {
    a11 = v26 + 2;
    a12 = v26 + 9;
    uint64_t v64 = (uint8_t *)sub_24FC213F4();
    sub_24FC21434();
    sub_24FC2C098();
    *(_DWORD *)uint64_t v64 = 136315138;
    a10 = v64 + 4;
    v26[10] = MEMORY[0x263F8EE78];
    swift_bridgeObjectRetain();
    sub_24FC13C3C(&qword_269A5CDF0);
    sub_24FC2A3AC();
    uint64_t v65 = sub_24FC4F928();
    v26[11] = sub_24FC49DD0(v65, v66, &a13);
    sub_24FC4FB18();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_24FC09000, v62, v27, "Incomplete unicode sequence: %s", v64, 0xCu);
    sub_24FC2BCFC();
    sub_24FC211C4();
    uint64_t v60 = v26 + 9;
    sub_24FC211C4();
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  sub_24FC2BDD8();
  uint64_t v74 = *(void *)(*v60 + 16);
  swift_bridgeObjectRelease();
  if (!v74) {
    goto LABEL_13;
  }
  uint64_t v75 = swift_task_alloc();
  uint64_t v76 = (void *)sub_24FC2BDAC(v75);
  *uint64_t v76 = v77;
  v76[1] = sub_24FC290C0;
  sub_24FC211DC();
  return sub_24FC256BC();
}

uint64_t sub_24FC2845C()
{
  sub_24FC12030();
  sub_24FC0BAB0();
  uint64_t v3 = v2;
  sub_24FC1204C();
  *BOOL v4 = v3;
  *BOOL v4 = *v1;
  v3[17] = v5;
  v3[18] = v6;
  v3[19] = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v7 = v3[12];
    swift_bridgeObjectRelease();
    uint64_t v8 = sub_24FC2569C;
    uint64_t v9 = v7;
  }
  else
  {
    uint64_t v9 = v3[12];
    uint64_t v8 = sub_24FC2855C;
  }
  return MEMORY[0x270FA2498](v8, v9, 0);
}

uint64_t sub_24FC2855C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22,uint64_t a23,uint64_t a24)
{
  sub_24FC2126C();
  a23 = v25;
  a24 = v26;
  a22 = v24;
  uint64_t v27 = v24[18];
  if (!v27) {
    goto LABEL_11;
  }
  if (v27 == 0xE100000000000000 && v24[17] == 34)
  {
    swift_bridgeObjectRelease();
    goto LABEL_6;
  }
  char v28 = sub_24FC2BC10();
  swift_bridgeObjectRelease();
  if ((v28 & 1) == 0)
  {
LABEL_11:
    uint64_t v39 = (void *)swift_task_alloc();
    v24[20] = v39;
    *uint64_t v39 = v24;
    uint64_t v40 = sub_24FC28A3C;
LABEL_21:
    v39[1] = v40;
    sub_24FC211DC();
    return sub_24FC256BC();
  }
LABEL_6:
  uint64_t v29 = v24[15];
  if (*(void *)(v29 + 16) > 3uLL)
  {
    v24[5] = v29;
    sub_24FC13C3C(&qword_269A5CDF0);
    sub_24FC2A3AC();
    uint64_t v41 = sub_24FC2BC68();
    unint64_t v43 = v42;
    swift_bridgeObjectRetain();
    sub_24FC29C58(v41, v43, 16);
    if (v44)
    {
      if (qword_269A5C728 != -1) {
        swift_once();
      }
      uint64_t v53 = sub_24FC4F6B8();
      sub_24FC2BEBC(v53, (uint64_t)qword_269A5E9E0);
      uint64_t v54 = (void *)sub_24FC4F698();
      os_log_type_t v55 = sub_24FC4FAF8();
      if (sub_24FC2BC94(v55))
      {
        a12 = v24 + 7;
        sub_24FC213F4();
        sub_24FC21434();
        sub_24FC2BE7C();
        uint64_t v56 = sub_24FC2C13C(4.8149e-34);
        v24[6] = sub_24FC2BD18(v56, v57, v58, v59);
        sub_24FC2BE60();
        sub_24FC2C0F8();
        sub_24FC2C188(&dword_24FC09000, v60, v61, "Failed to parse unicode sequence %s");
        sub_24FC2BCC0();
        sub_24FC211C4();
LABEL_32:
        sub_24FC211C4();
LABEL_34:

        goto LABEL_35;
      }
    }
    else
    {
      uint64_t v45 = sub_24FC4FD58();
      if ((v45 & 0x100000000) == 0)
      {
        unsigned int v46 = v45;
        uint64_t result = swift_bridgeObjectRelease();
        if ((v46 & 0xFFFFFF80) != 0)
        {
          sub_24FC2BAFC();
          if (v46 >= 0x800) {
            unsigned int v48 = v79;
          }
        }
        else
        {
          if (v46 > 0xFF)
          {
            __break(1u);
            return result;
          }
          unsigned int v48 = (v46 + 1);
        }
        sub_24FC2BBAC(v48);
        goto LABEL_35;
      }
      if (qword_269A5C728 != -1) {
        swift_once();
      }
      uint64_t v62 = sub_24FC4F6B8();
      sub_24FC2BEBC(v62, (uint64_t)qword_269A5E9E0);
      uint64_t v54 = (void *)sub_24FC4F698();
      os_log_type_t v63 = sub_24FC4FAF8();
      if (sub_24FC2BD84(v63))
      {
        a12 = v24 + 8;
        sub_24FC213F4();
        sub_24FC21434();
        sub_24FC2C098();
        uint64_t v64 = sub_24FC2C058(4.8149e-34);
        uint64_t v68 = sub_24FC2BD18(v64, v65, v66, v67);
        sub_24FC2BF20(v68);
        sub_24FC2C0F8();
        sub_24FC2BD44(&dword_24FC09000, v69, v70, "Failed to parse unicode sequence %s");
        sub_24FC2BCFC();
        sub_24FC211C4();
        goto LABEL_32;
      }
    }
    sub_24FC2C110();
    goto LABEL_34;
  }
  if (qword_269A5C728 != -1) {
    swift_once();
  }
  uint64_t v30 = sub_24FC4F6B8();
  sub_24FC20B5C(v30, (uint64_t)qword_269A5E9E0);
  swift_bridgeObjectRetain_n();
  uint64_t v31 = (void *)sub_24FC4F698();
  os_log_type_t v32 = sub_24FC4FAF8();
  if (sub_24FC2BC94(v32))
  {
    a10 = v24 + 10;
    a11 = v24 + 11;
    a12 = v24 + 2;
    BOOL v33 = (_DWORD *)sub_24FC213F4();
    sub_24FC21434();
    sub_24FC2BE7C();
    *BOOL v33 = 136315138;
    v24[10] = v29;
    swift_bridgeObjectRetain();
    sub_24FC13C3C(&qword_269A5CDF0);
    sub_24FC2A3AC();
    uint64_t v34 = sub_24FC4F928();
    uint64_t v36 = sub_24FC49DD0(v34, v35, &a13);
    sub_24FC2BFAC(v36);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    sub_24FC2C168(&dword_24FC09000, v37, v38, "Incomplete unicode sequence: %s");
    sub_24FC2BCC0();
    sub_24FC211C4();
    sub_24FC211C4();
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  sub_24FC2BDD8();
  uint64_t v49 = *(void *)(v24[9] + 16);
  swift_bridgeObjectRelease();
  if (v49)
  {
    uint64_t v50 = swift_task_alloc();
    uint64_t v39 = (void *)sub_24FC2BDAC(v50);
    *uint64_t v39 = v51;
    uint64_t v40 = sub_24FC290C0;
    goto LABEL_21;
  }
LABEL_35:
  sub_24FC2BC84();
  sub_24FC211DC();
  return v74(v71, v72, v73, v74, v75, v76, v77, v78, a9, a10, a11, a12, a13, a14, a15, a16);
}

uint64_t sub_24FC28A3C()
{
  sub_24FC12030();
  sub_24FC0BAB0();
  uint64_t v3 = v2;
  sub_24FC1204C();
  *BOOL v4 = v3;
  uint64_t v5 = *v1;
  sub_24FC1203C();
  *uint64_t v6 = v5;
  *(void *)(v3 + 168) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v7 = *(void *)(v3 + 96);
    swift_bridgeObjectRelease();
    uint64_t v8 = sub_24FC256A4;
    uint64_t v9 = v7;
  }
  else
  {
    uint64_t v9 = *(void *)(v3 + 96);
    uint64_t v8 = sub_24FC28B30;
  }
  return MEMORY[0x270FA2498](v8, v9, 0);
}

uint64_t sub_24FC28B30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22,uint64_t a23,uint64_t a24)
{
  sub_24FC2126C();
  a23 = v27;
  a24 = v28;
  a22 = v25;
  uint64_t v29 = v25[15];
  if (v25[14] != 3)
  {
    ++v25[14];
    if (*(void *)(v25[12] + v25[13] + 8))
    {
      swift_bridgeObjectRetain();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        sub_24FC2BDC0(0, *(void *)(v29 + 16) + 1, v30, v31, &qword_269A5CE08, (void (*)(void, uint64_t, void *, uint64_t))sub_24FC2A7CC, (void (*)(uint64_t, uint64_t, void *))sub_24FC2AB00);
      }
      sub_24FC2C040();
      if (v33)
      {
        BOOL v86 = sub_24FC2BCF0(v32);
        sub_24FC2BDC0((void *)v86, v24, v87, v88, &qword_269A5CE08, (void (*)(void, uint64_t, void *, uint64_t))sub_24FC2A7CC, (void (*)(uint64_t, uint64_t, void *))sub_24FC2AB00);
      }
      sub_24FC2BDF0();
      uint64_t v34 = swift_task_alloc();
      unint64_t v35 = (void *)sub_24FC2C08C(v34);
      *unint64_t v35 = v36;
      v35[1] = sub_24FC2845C;
      sub_24FC2C1DC();
      sub_24FC211DC();
      return sub_24FC259C4(v37, v38);
    }
  }
  if (*(void *)(v29 + 16) > 3uLL)
  {
    v25[5] = v29;
    sub_24FC13C3C(&qword_269A5CDF0);
    sub_24FC2A3AC();
    uint64_t v48 = sub_24FC2BC68();
    unint64_t v50 = v49;
    swift_bridgeObjectRetain();
    sub_24FC29C58(v48, v50, 16);
    if (v51)
    {
      if (qword_269A5C728 != -1) {
        swift_once();
      }
      uint64_t v60 = sub_24FC4F6B8();
      sub_24FC2BEBC(v60, (uint64_t)qword_269A5E9E0);
      uint64_t v61 = (void *)sub_24FC4F698();
      os_log_type_t v62 = sub_24FC4FAF8();
      if (sub_24FC2BC94(v62))
      {
        a12 = v25 + 7;
        sub_24FC213F4();
        sub_24FC21434();
        sub_24FC2BE7C();
        uint64_t v63 = sub_24FC2C13C(4.8149e-34);
        v25[6] = sub_24FC2BD18(v63, v64, v65, v66);
        sub_24FC2BE60();
        sub_24FC2C0F8();
        sub_24FC2C188(&dword_24FC09000, v67, v68, "Failed to parse unicode sequence %s");
        sub_24FC2BCC0();
        sub_24FC211C4();
LABEL_33:
        sub_24FC211C4();
LABEL_35:

        goto LABEL_36;
      }
LABEL_34:
      sub_24FC2C110();
      goto LABEL_35;
    }
    uint64_t v52 = sub_24FC4FD58();
    if ((v52 & 0x100000000) != 0)
    {
      if (qword_269A5C728 == -1) {
        goto LABEL_31;
      }
    }
    else
    {
      unsigned int v53 = v52;
      swift_bridgeObjectRelease();
      if ((v53 & 0xFFFFFF80) != 0)
      {
        sub_24FC2BAFC();
        if (v53 >= 0x800) {
          unsigned int v54 = v89;
        }
        goto LABEL_20;
      }
      if (v53 <= 0xFF)
      {
        unsigned int v54 = (v53 + 1);
LABEL_20:
        sub_24FC2BBAC(v54);
        goto LABEL_36;
      }
      __break(1u);
    }
    swift_once();
LABEL_31:
    uint64_t v69 = sub_24FC4F6B8();
    sub_24FC2BEBC(v69, (uint64_t)qword_269A5E9E0);
    uint64_t v61 = (void *)sub_24FC4F698();
    os_log_type_t v70 = sub_24FC4FAF8();
    if (sub_24FC2BD84(v70))
    {
      a12 = v25 + 8;
      sub_24FC213F4();
      sub_24FC21434();
      sub_24FC2C098();
      uint64_t v71 = sub_24FC2C058(4.8149e-34);
      uint64_t v75 = sub_24FC2BD18(v71, v72, v73, v74);
      sub_24FC2BF20(v75);
      sub_24FC2C0F8();
      sub_24FC2BD44(&dword_24FC09000, v76, v77, "Failed to parse unicode sequence %s");
      sub_24FC2BCFC();
      sub_24FC211C4();
      goto LABEL_33;
    }
    goto LABEL_34;
  }
  if (qword_269A5C728 != -1) {
    swift_once();
  }
  uint64_t v41 = sub_24FC4F6B8();
  sub_24FC20B5C(v41, (uint64_t)qword_269A5E9E0);
  swift_bridgeObjectRetain_n();
  unint64_t v42 = sub_24FC4F698();
  os_log_type_t v43 = sub_24FC4FAF8();
  if (sub_24FC2BC94(v43))
  {
    a10 = v25 + 10;
    a11 = v25 + 11;
    a12 = v25 + 2;
    char v44 = (uint8_t *)sub_24FC213F4();
    sub_24FC21434();
    sub_24FC2BE7C();
    *(_DWORD *)char v44 = 136315138;
    v25[10] = v29;
    swift_bridgeObjectRetain();
    sub_24FC13C3C(&qword_269A5CDF0);
    sub_24FC2A3AC();
    uint64_t v45 = sub_24FC4F928();
    uint64_t v47 = sub_24FC49DD0(v45, v46, &a13);
    sub_24FC2BFAC(v47);
    swift_bridgeObjectRelease();
    sub_24FC2C110();
    _os_log_impl(&dword_24FC09000, v42, v26, "Incomplete unicode sequence: %s", v44, 0xCu);
    sub_24FC2BCC0();
    sub_24FC211C4();
    sub_24FC211C4();
  }
  else
  {
    sub_24FC2C110();
  }

  sub_24FC2BDD8();
  uint64_t v55 = *(void *)(v25[9] + 16);
  swift_bridgeObjectRelease();
  if (v55)
  {
    uint64_t v56 = swift_task_alloc();
    uint64_t v57 = (void *)sub_24FC2BDAC(v56);
    void *v57 = v58;
    v57[1] = sub_24FC290C0;
    sub_24FC211DC();
    return sub_24FC256BC();
  }
LABEL_36:
  sub_24FC2BC84();
  sub_24FC211DC();
  return v81(v78, v79, v80, v81, v82, v83, v84, v85, a9, a10, a11, a12, a13, a14, a15, a16);
}

uint64_t sub_24FC290C0()
{
  sub_24FC12240();
  sub_24FC1204C();
  *uint64_t v3 = v2;
  *uint64_t v3 = *v1;
  *(void *)(v2 + 184) = v0;
  swift_task_dealloc();
  sub_24FC2BDA0();
  return MEMORY[0x270FA2498](v4, v5, v6);
}

uint64_t sub_24FC291E0()
{
  return (*(uint64_t (**)(void, void))(v0 + 8))(0, 0);
}

uint64_t sub_24FC29200(uint64_t a1, unint64_t a2)
{
  BOOL v2 = a1 == 110 && a2 == 0xE100000000000000;
  if (v2 || (sub_24FC4FC78() & 1) != 0) {
    return 10;
  }
  BOOL v6 = a1 == 116 && a2 == 0xE100000000000000;
  if (v6 || (sub_24FC4FC78() & 1) != 0) {
    return 9;
  }
  BOOL v8 = a1 == 98 && a2 == 0xE100000000000000;
  if (v8 || (sub_24FC4FC78() & 1) != 0) {
    return 8;
  }
  BOOL v9 = a1 == 102 && a2 == 0xE100000000000000;
  if (v9 || (sub_24FC4FC78() & 1) != 0) {
    return 12;
  }
  BOOL v10 = a1 == 114 && a2 == 0xE100000000000000;
  if (v10 || (sub_24FC4FC78() & 1) != 0) {
    return 13;
  }
  uint64_t v5 = 34;
  BOOL v11 = a1 == 34 && a2 == 0xE100000000000000;
  if (!v11 && (sub_24FC4FC78() & 1) == 0)
  {
    uint64_t v5 = 92;
    BOOL v12 = a1 == 92 && a2 == 0xE100000000000000;
    if (!v12 && (sub_24FC4FC78() & 1) == 0)
    {
      if (qword_269A5C728 != -1) {
        swift_once();
      }
      uint64_t v13 = sub_24FC4F6B8();
      sub_24FC20B5C(v13, (uint64_t)qword_269A5E9E0);
      swift_bridgeObjectRetain_n();
      uint64_t v14 = sub_24FC4F698();
      os_log_type_t v15 = sub_24FC4FAF8();
      if (os_log_type_enabled(v14, v15))
      {
        os_log_type_t v16 = (uint8_t *)swift_slowAlloc();
        uint64_t v17 = swift_slowAlloc();
        uint64_t v18 = v17;
        *(_DWORD *)os_log_type_t v16 = 136315138;
        swift_bridgeObjectRetain();
        sub_24FC49DD0(a1, a2, &v18);
        sub_24FC4FB18();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_24FC09000, v14, v15, "Unknown json escape sequence of type \\%s", v16, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x253373A70](v17, -1, -1);
        MEMORY[0x253373A70](v16, -1, -1);
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      return 0;
    }
  }
  return v5;
}

uint64_t sub_24FC29514(uint64_t a1)
{
  v2[9] = a1;
  v2[10] = v1;
  uint64_t v3 = sub_24FC13C3C(&qword_269A5CE20);
  v2[11] = v3;
  v2[12] = *(void *)(v3 - 8);
  v2[13] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24FC295D8, v1, 0);
}

uint64_t sub_24FC295D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  sub_24FC2BFD0();
  sub_24FC1249C();
  uint64_t v11 = v10[10];
  uint64_t v12 = OBJC_IVAR____TtC19GenerativeFunctions15JsonTokenStream_complete;
  v10[14] = OBJC_IVAR____TtC19GenerativeFunctions15JsonTokenStream_complete;
  if (*(unsigned char *)(v11 + v12))
  {
LABEL_2:
    swift_task_dealloc();
    sub_24FC12110();
    sub_24FC2BBF8();
    return v14(v13, v14, v15, v16, v17, v18, v19, v20, a9, a10);
  }
  uint64_t v22 = v10[9];
  sub_24FC13C3C(&qword_269A5CE28);
  sub_24FC4F9B8();
  if (v22 < 1)
  {
    if (*(unsigned char *)(v10[10] + v10[14]))
    {
      uint64_t v34 = sub_24FC2BEA4();
      v35(v34);
      swift_bridgeObjectRelease();
    }
    else
    {
      v10[7] = MEMORY[0x263F8EE78];
      sub_24FC13C3C(&qword_269A5CDF0);
      sub_24FC2A3AC();
      sub_24FC4F928();
      swift_beginAccess();
      sub_24FC4F898();
      swift_endAccess();
      swift_bridgeObjectRelease();
      uint64_t v36 = sub_24FC2BEA4();
      v37(v36);
    }
    goto LABEL_2;
  }
  v10[15] = MEMORY[0x263F8EE78];
  uint64_t v23 = swift_task_alloc();
  int64_t v24 = (void *)sub_24FC2C08C(v23);
  *int64_t v24 = v25;
  v24[1] = sub_24FC297B4;
  sub_24FC2BFF4();
  sub_24FC2BBF8();
  return MEMORY[0x270FA2100](v26, v27, v28, v29, v30, v31, v32, v33, a9, a10);
}

uint64_t sub_24FC297B4()
{
  sub_24FC12030();
  sub_24FC0BAB0();
  uint64_t v3 = v2;
  sub_24FC1204C();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  sub_24FC1203C();
  *BOOL v6 = v5;
  *(void *)(v3 + 136) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v7 = *(void *)(v3 + 80);
    swift_bridgeObjectRelease();
    BOOL v8 = sub_24FC29BE0;
    uint64_t v9 = v7;
  }
  else
  {
    uint64_t v9 = *(void *)(v3 + 80);
    BOOL v8 = sub_24FC298A8;
  }
  return MEMORY[0x270FA2498](v8, v9, 0);
}

uint64_t sub_24FC298A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  sub_24FC2BFD0();
  sub_24FC1249C();
  uint64_t v11 = v10[5];
  uint64_t v12 = v10[6];
  if (v12)
  {
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v16 = (void *)v10[15];
    if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
      uint64_t v16 = sub_24FC2C0A4(0, v16[2] + 1, v14, v15, &qword_269A5CE08, (void (*)(void, uint64_t, void *, uint64_t))sub_24FC2A7CC, (void (*)(uint64_t, uint64_t, void *))sub_24FC2AB00);
    }
    unint64_t v18 = v16[2];
    unint64_t v17 = v16[3];
    int64_t v19 = v18 + 1;
    if (v18 >= v17 >> 1)
    {
      BOOL v52 = sub_24FC2BCF0(v17);
      uint64_t v16 = sub_24FC2C0A4((void *)v52, v18 + 1, v53, v54, &qword_269A5CE08, (void (*)(void, uint64_t, void *, uint64_t))sub_24FC2A7CC, (void (*)(uint64_t, uint64_t, void *))sub_24FC2AB00);
    }
    int64_t v20 = v10[9];
    v16[2] = v19;
    uint64_t v21 = &v16[2 * v18];
    v21[4] = v11;
    v21[5] = v12;
    if (v19 < v20)
    {
      v10[15] = v16;
      uint64_t v22 = swift_task_alloc();
      uint64_t v23 = (void *)sub_24FC2C08C(v22);
      *uint64_t v23 = v24;
      v23[1] = sub_24FC297B4;
      sub_24FC2BFF4();
      sub_24FC2BBF8();
      return MEMORY[0x270FA2100](v25, v26, v27, v28, v29, v30, v31, v32, a9, a10);
    }
    if (*(unsigned char *)(v10[10] + v10[14]))
    {
      uint64_t v40 = sub_24FC2C078();
      v41(v40);
      swift_bridgeObjectRelease();
    }
    else
    {
      v10[7] = v16;
      sub_24FC13C3C(&qword_269A5CDF0);
      sub_24FC2A3AC();
      sub_24FC2BE20();
      swift_beginAccess();
      sub_24FC4F898();
      swift_endAccess();
      swift_bridgeObjectRelease();
      uint64_t v42 = sub_24FC2C078();
      v43(v42);
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    if (qword_269A5C730 != -1) {
      swift_once();
    }
    uint64_t v33 = sub_24FC4F6B8();
    sub_24FC20B5C(v33, (uint64_t)qword_269A5E9F8);
    uint64_t v34 = sub_24FC4F698();
    os_log_type_t v35 = sub_24FC4FAF8();
    if (os_log_type_enabled(v34, v35))
    {
      uint64_t v36 = v10[9];
      uint64_t v37 = (uint8_t *)sub_24FC213F4();
      *(_DWORD *)uint64_t v37 = 134217984;
      v10[8] = v36;
      sub_24FC4FB18();
      _os_log_impl(&dword_24FC09000, v34, v35, "Async iteration ended prematurely while awaiting for %ld characters to be buffered in", v37, 0xCu);
      sub_24FC211C4();
    }

    uint64_t v38 = sub_24FC2161C();
    v39(v38);
  }
  swift_task_dealloc();
  sub_24FC12110();
  sub_24FC2BBF8();
  return v45(v44, v45, v46, v47, v48, v49, v50, v51, a9, a10);
}

uint64_t sub_24FC29BE0()
{
  sub_24FC12030();
  (*(void (**)(void, void))(v0[12] + 8))(v0[13], v0[11]);
  swift_task_dealloc();
  sub_24FC0BAC8();
  return v1();
}

uint64_t sub_24FC29C58(uint64_t result, unint64_t a2, uint64_t a3)
{
  if ((unint64_t)(a3 - 37) < 0xFFFFFFFFFFFFFFDDLL)
  {
    __break(1u);
LABEL_74:
    swift_bridgeObjectRelease();
    return 0;
  }
  uint64_t v4 = HIBYTE(a2) & 0xF;
  uint64_t v5 = result & 0xFFFFFFFFFFFFLL;
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v6 = v4;
  }
  else {
    uint64_t v6 = result & 0xFFFFFFFFFFFFLL;
  }
  if (!v6) {
    goto LABEL_74;
  }
  if ((a2 & 0x1000000000000000) == 0)
  {
    if ((a2 & 0x2000000000000000) == 0)
    {
      if ((result & 0x1000000000000000) != 0) {
        BOOL v8 = (unsigned __int8 *)((a2 & 0xFFFFFFFFFFFFFFFLL) + 32);
      }
      else {
        BOOL v8 = (unsigned __int8 *)sub_24FC4FB98();
      }
      uint64_t v9 = (uint64_t)sub_24FC2AE88(v8, v5, a3);
      char v11 = v10 & 1;
      goto LABEL_11;
    }
    v37[0] = result;
    v37[1] = a2 & 0xFFFFFFFFFFFFFFLL;
    if (result == 43)
    {
      if (v4)
      {
        uint64_t v21 = v4 - 1;
        if (v21)
        {
          uint64_t v13 = 0;
          unsigned __int8 v22 = a3 + 48;
          unsigned __int8 v23 = a3 + 55;
          unsigned __int8 v24 = a3 + 87;
          if ((unint64_t)a3 > 0xA)
          {
            unsigned __int8 v22 = 58;
          }
          else
          {
            unsigned __int8 v24 = 97;
            unsigned __int8 v23 = 65;
          }
          uint64_t v25 = (unsigned __int8 *)v37 + 1;
          char v11 = 1;
          do
          {
            unsigned int v26 = *v25;
            if (v26 < 0x30 || v26 >= v22)
            {
              if (v26 < 0x41 || v26 >= v23)
              {
                uint64_t v9 = 0;
                if (v26 < 0x61 || v26 >= v24) {
                  goto LABEL_11;
                }
                char v27 = -87;
              }
              else
              {
                char v27 = -55;
              }
            }
            else
            {
              char v27 = -48;
            }
            uint64_t v28 = v13 * a3;
            if ((unsigned __int128)(v13 * (__int128)a3) >> 64 != (v13 * a3) >> 63) {
              goto LABEL_72;
            }
            uint64_t v13 = v28 + (v26 + v27);
            if (__OFADD__(v28, (v26 + v27))) {
              goto LABEL_72;
            }
            ++v25;
            --v21;
          }
          while (v21);
LABEL_71:
          char v11 = 0;
          uint64_t v9 = v13;
          goto LABEL_11;
        }
        goto LABEL_72;
      }
    }
    else
    {
      if (result != 45)
      {
        if (v4)
        {
          uint64_t v13 = 0;
          unsigned __int8 v29 = a3 + 48;
          unsigned __int8 v30 = a3 + 55;
          unsigned __int8 v31 = a3 + 87;
          if ((unint64_t)a3 > 0xA)
          {
            unsigned __int8 v29 = 58;
          }
          else
          {
            unsigned __int8 v31 = 97;
            unsigned __int8 v30 = 65;
          }
          uint64_t v32 = (unsigned __int8 *)v37;
          char v11 = 1;
          while (1)
          {
            unsigned int v33 = *v32;
            if (v33 < 0x30 || v33 >= v29)
            {
              if (v33 < 0x41 || v33 >= v30)
              {
                uint64_t v9 = 0;
                if (v33 < 0x61 || v33 >= v31) {
                  goto LABEL_11;
                }
                char v34 = -87;
              }
              else
              {
                char v34 = -55;
              }
            }
            else
            {
              char v34 = -48;
            }
            uint64_t v35 = v13 * a3;
            if ((unsigned __int128)(v13 * (__int128)a3) >> 64 != (v13 * a3) >> 63) {
              goto LABEL_72;
            }
            uint64_t v13 = v35 + (v33 + v34);
            if (__OFADD__(v35, (v33 + v34))) {
              goto LABEL_72;
            }
            ++v32;
            if (!--v4) {
              goto LABEL_71;
            }
          }
        }
        goto LABEL_72;
      }
      if (v4)
      {
        uint64_t v12 = v4 - 1;
        if (v12)
        {
          uint64_t v13 = 0;
          unsigned __int8 v14 = a3 + 48;
          unsigned __int8 v15 = a3 + 55;
          unsigned __int8 v16 = a3 + 87;
          if ((unint64_t)a3 > 0xA)
          {
            unsigned __int8 v14 = 58;
          }
          else
          {
            unsigned __int8 v16 = 97;
            unsigned __int8 v15 = 65;
          }
          unint64_t v17 = (unsigned __int8 *)v37 + 1;
          char v11 = 1;
          while (1)
          {
            unsigned int v18 = *v17;
            if (v18 < 0x30 || v18 >= v14)
            {
              if (v18 < 0x41 || v18 >= v15)
              {
                uint64_t v9 = 0;
                if (v18 < 0x61 || v18 >= v16) {
                  goto LABEL_11;
                }
                char v19 = -87;
              }
              else
              {
                char v19 = -55;
              }
            }
            else
            {
              char v19 = -48;
            }
            uint64_t v20 = v13 * a3;
            if ((unsigned __int128)(v13 * (__int128)a3) >> 64 != (v13 * a3) >> 63) {
              break;
            }
            uint64_t v13 = v20 - (v18 + v19);
            if (__OFSUB__(v20, (v18 + v19))) {
              break;
            }
            ++v17;
            if (!--v12) {
              goto LABEL_71;
            }
          }
        }
LABEL_72:
        uint64_t v9 = 0;
        char v11 = 1;
        goto LABEL_11;
      }
      __break(1u);
    }
    __break(1u);
    return result;
  }
  uint64_t v9 = sub_24FC2B600(result, a2, a3, (uint64_t (*)(void *, uint64_t, uint64_t))sub_24FC2BAE0);
  char v11 = v36;
LABEL_11:
  swift_bridgeObjectRelease();
  if (v11) {
    return 0;
  }
  else {
    return v9;
  }
}

uint64_t sub_24FC29F98()
{
  sub_24FC13C3C(&qword_269A5CD60);
  sub_24FC2BCDC();
  uint64_t v1 = sub_24FC2BF44();
  v2(v1);
  sub_24FC13C3C(&qword_269A5CE28);
  sub_24FC2BCDC();
  uint64_t v3 = sub_24FC2BF44();
  v4(v3);
  sub_24FC13C3C(&qword_269A5CE48);
  sub_24FC2BCDC();
  uint64_t v5 = sub_24FC2BF44();
  v6(v5);
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();
  return v0;
}

uint64_t sub_24FC2A094()
{
  sub_24FC29F98();
  return MEMORY[0x270FA2418](v0);
}

uint64_t sub_24FC2A0C0()
{
  return type metadata accessor for JsonTokenStream();
}

uint64_t type metadata accessor for JsonTokenStream()
{
  uint64_t result = qword_269A5CDA0;
  if (!qword_269A5CDA0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_24FC2A110()
{
  sub_24FC2A2C4(319, &qword_269A5CDB0, MEMORY[0x263F8D310], MEMORY[0x263F8F6B8]);
  if (v0 <= 0x3F)
  {
    sub_24FC2A2C4(319, &qword_269A5CDB8, MEMORY[0x263F8D120], MEMORY[0x263F8F6B8]);
    if (v1 <= 0x3F)
    {
      sub_24FC2A2C4(319, &qword_269A5CDC0, MEMORY[0x263F8D120], MEMORY[0x263F8F690]);
      if (v2 <= 0x3F) {
        swift_updateClassMetadata2();
      }
    }
  }
}

void sub_24FC2A2C4(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t, uint64_t, void))
{
  if (!*a2)
  {
    uint64_t v8 = sub_24FC1607C(&qword_269A5CBA0);
    unint64_t v9 = a4(a1, a3, v8, MEMORY[0x263F8E4E0]);
    if (!v10) {
      atomic_store(v9, a2);
    }
  }
}

uint64_t sub_24FC2A338()
{
  return v0;
}

uint64_t sub_24FC2A344()
{
  return sub_24FC2A338();
}

unint64_t sub_24FC2A360()
{
  unint64_t result = qword_269A5CDE0;
  if (!qword_269A5CDE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_269A5CDE0);
  }
  return result;
}

unint64_t sub_24FC2A3AC()
{
  unint64_t result = qword_269A5CDF8;
  if (!qword_269A5CDF8)
  {
    sub_24FC1607C(&qword_269A5CDF0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_269A5CDF8);
  }
  return result;
}

void *sub_24FC2A400(void *a1, int64_t a2, char a3, uint64_t a4)
{
  return sub_24FC2A434(a1, a2, a3, a4, &qword_269A5CE58, (void (*)(void, uint64_t, void *, uint64_t))sub_24FC2A8C4, (void (*)(uint64_t, uint64_t, void *))sub_24FC2AB94);
}

void *sub_24FC2A434(void *result, int64_t a2, char a3, uint64_t a4, uint64_t *a5, void (*a6)(void, uint64_t, void *, uint64_t), void (*a7)(uint64_t, uint64_t, void *))
{
  char v10 = (char)result;
  if (a3)
  {
    unint64_t v11 = *(void *)(a4 + 24);
    int64_t v12 = v11 >> 1;
    if ((uint64_t)(v11 >> 1) < a2)
    {
      if (v12 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v12 = v11 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v11 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v12 = a2;
      }
    }
  }
  else
  {
    int64_t v12 = a2;
  }
  uint64_t v13 = *(void *)(a4 + 16);
  if (v12 <= v13) {
    uint64_t v14 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v14 = v12;
  }
  if (v14)
  {
    sub_24FC13C3C(a5);
    unsigned __int8 v15 = (void *)swift_allocObject();
    size_t v16 = j__malloc_size(v15);
    v15[2] = v13;
    v15[3] = 2 * ((uint64_t)(v16 - 32) / 16);
  }
  else
  {
    unsigned __int8 v15 = (void *)MEMORY[0x263F8EE78];
  }
  unint64_t v17 = v15 + 4;
  if (v10)
  {
    a7(a4 + 32, v13, v17);
    *(void *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    a6(0, v13, v17, a4);
  }
  return v15;
}

uint64_t sub_24FC2A538(char a1, int64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return sub_24FC2BDB8(a1, a2, a3, a4, &qword_269A5CE60, MEMORY[0x263F07508], a7, MEMORY[0x263F07508]);
}

uint64_t sub_24FC2A56C(char a1, int64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return sub_24FC2BDB8(a1, a2, a3, a4, &qword_269A5CE50, type metadata accessor for ObjectStreamingSupport, a7, (void (*)(void))type metadata accessor for ObjectStreamingSupport);
}

uint64_t sub_24FC2A5A0(char a1, int64_t a2, char a3, uint64_t a4, uint64_t *a5, uint64_t (*a6)(void), uint64_t (*a7)(void), void (*a8)(void))
{
  if (a3)
  {
    unint64_t v13 = *(void *)(a4 + 24);
    uint64_t v14 = v13 >> 1;
    if ((uint64_t)(v13 >> 1) < a2)
    {
      if (v14 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_24;
      }
      uint64_t v14 = v13 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v13 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v14 = a2;
      }
    }
  }
  else
  {
    uint64_t v14 = a2;
  }
  uint64_t v15 = *(void *)(a4 + 16);
  if (v14 <= v15) {
    uint64_t v16 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v16 = v14;
  }
  if (!v16)
  {
    uint64_t v20 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  sub_24FC13C3C(a5);
  uint64_t v17 = *(void *)(a6(0) - 8);
  uint64_t v18 = *(void *)(v17 + 72);
  unint64_t v19 = (*(unsigned __int8 *)(v17 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80);
  uint64_t v20 = (void *)swift_allocObject();
  size_t v21 = j__malloc_size(v20);
  if (!v18 || (v21 - v19 == 0x8000000000000000 ? (BOOL v22 = v18 == -1) : (BOOL v22 = 0), v22))
  {
LABEL_24:
    sub_24FC2BB70();
    sub_24FC2C04C();
    uint64_t result = sub_24FC4FC18();
    __break(1u);
    return result;
  }
  v20[2] = v15;
  v20[3] = 2 * ((uint64_t)(v21 - v19) / v18);
LABEL_19:
  uint64_t v23 = *(void *)(a6(0) - 8);
  unint64_t v24 = (*(unsigned __int8 *)(v23 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v23 + 80);
  unint64_t v25 = (unint64_t)v20 + v24;
  if (a1)
  {
    sub_24FC2AC50(a4 + v24, v15, v25, a8);
    *(void *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_24FC2A9BC(0, v15, v25, a4, a7);
  }
  return (uint64_t)v20;
}

uint64_t sub_24FC2A7CC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  uint64_t result = sub_24FC4FC38();
  __break(1u);
  return result;
}

uint64_t sub_24FC2A8C4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  uint64_t result = sub_24FC4FC38();
  __break(1u);
  return result;
}

uint64_t sub_24FC2A9BC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  uint64_t v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v5 & 0x8000000000000000) == 0)
  {
    uint64_t v9 = *(void *)(a5(0) - 8);
    uint64_t v10 = a4 + ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));
    uint64_t v11 = *(void *)(v9 + 72);
    unint64_t v12 = v10 + v11 * a1;
    unint64_t v13 = a3 + v11 * v5;
    if (v12 >= v13 || v12 + v11 * v5 <= a3)
    {
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v13;
    }
  }
  sub_24FC2BB70();
  sub_24FC2C04C();
  uint64_t result = sub_24FC4FC38();
  __break(1u);
  return result;
}

char *sub_24FC2AB00(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_24FC4FC38();
    __break(1u);
  }
  else if (__dst != __src || &__src[16 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 16 * a2);
  }
  return __src;
}

char *sub_24FC2AB94(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    sub_24FC2BB70();
    __src = (char *)sub_24FC2BE3C();
    __break(1u);
  }
  else if (__dst != __src || &__src[16 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 16 * a2);
  }
  return __src;
}

uint64_t sub_24FC2AC08(unint64_t a1, uint64_t a2, unint64_t a3)
{
  return sub_24FC2AC50(a1, a2, a3, MEMORY[0x263F07508]);
}

uint64_t sub_24FC2AC20(unint64_t a1, uint64_t a2, unint64_t a3)
{
  return sub_24FC2AC50(a1, a2, a3, MEMORY[0x263F40C00]);
}

uint64_t sub_24FC2AC38(unint64_t a1, uint64_t a2, unint64_t a3)
{
  return sub_24FC2AC50(a1, a2, a3, (void (*)(void))type metadata accessor for ObjectStreamingSupport);
}

uint64_t sub_24FC2AC50(unint64_t a1, uint64_t a2, unint64_t a3, void (*a4)(void))
{
  if (a2 < 0)
  {
    sub_24FC2BB70();
    uint64_t result = sub_24FC2BE3C();
    __break(1u);
  }
  else if (a3 < a1 {
         || (uint64_t result = ((uint64_t (*)(void))a4)(0),
  }
             a1 + *(void *)(*(void *)(result - 8) + 72) * a2 <= a3))
  {
    a4(0);
    sub_24FC2C0D0();
    return swift_arrayInitWithTakeFrontToBack();
  }
  else if (a3 != a1)
  {
    sub_24FC2C0D0();
    return swift_arrayInitWithTakeBackToFront();
  }
  return result;
}

void *sub_24FC2AD58(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return (void *)MEMORY[0x263F8EE78];
  }
  sub_24FC13C3C(&qword_269A5CE10);
  uint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_24FC2ADC0(unint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    uint64_t v6 = sub_24FC4F908();
    sub_24FC2BF70(v6);
    return v7 | 4;
  }
  else
  {
    uint64_t v3 = MEMORY[0x253373190](15, a1 >> 16);
    sub_24FC2BF70(v3);
    return v4 | 8;
  }
}

unsigned char *sub_24FC2AE1C@<X0>(unsigned char *result@<X0>, BOOL *a2@<X8>)
{
  unsigned int v3 = *result;
  BOOL v4 = v3 > 0x20;
  uint64_t v5 = (1 << v3) & 0x100003E01;
  BOOL v6 = v4 || v5 == 0;
  BOOL v7 = v6 && (result = (unsigned char *)_swift_stdlib_strtod_clocale()) != 0 && *result == 0;
  *a2 = v7;
  return result;
}

unsigned __int8 *sub_24FC2AE88(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a2;
  int v4 = *result;
  if (v4 == 43)
  {
    if (a2 >= 1)
    {
      uint64_t v15 = a2 - 1;
      if (a2 != 1)
      {
        unsigned __int8 v16 = a3 + 48;
        unsigned __int8 v17 = a3 + 55;
        unsigned __int8 v18 = a3 + 87;
        if (a3 > 10)
        {
          unsigned __int8 v16 = 58;
        }
        else
        {
          unsigned __int8 v18 = 97;
          unsigned __int8 v17 = 65;
        }
        if (result)
        {
          uint64_t v9 = 0;
          unint64_t v19 = result + 1;
          do
          {
            unsigned int v20 = *v19;
            if (v20 < 0x30 || v20 >= v16)
            {
              if (v20 < 0x41 || v20 >= v17)
              {
                uint64_t v13 = 0;
                if (v20 < 0x61 || v20 >= v18) {
                  return (unsigned __int8 *)v13;
                }
                char v21 = -87;
              }
              else
              {
                char v21 = -55;
              }
            }
            else
            {
              char v21 = -48;
            }
            uint64_t v22 = v9 * a3;
            if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63) {
              return 0;
            }
            uint64_t v9 = v22 + (v20 + v21);
            if (__OFADD__(v22, (v20 + v21))) {
              return 0;
            }
            ++v19;
            --v15;
          }
          while (v15);
          return (unsigned __int8 *)v9;
        }
        return 0;
      }
      return 0;
    }
  }
  else
  {
    if (v4 != 45)
    {
      if (a2)
      {
        unsigned __int8 v23 = a3 + 48;
        unsigned __int8 v24 = a3 + 55;
        unsigned __int8 v25 = a3 + 87;
        if (a3 > 10)
        {
          unsigned __int8 v23 = 58;
        }
        else
        {
          unsigned __int8 v25 = 97;
          unsigned __int8 v24 = 65;
        }
        if (result)
        {
          uint64_t v26 = 0;
          do
          {
            unsigned int v27 = *result;
            if (v27 < 0x30 || v27 >= v23)
            {
              if (v27 < 0x41 || v27 >= v24)
              {
                uint64_t v13 = 0;
                if (v27 < 0x61 || v27 >= v25) {
                  return (unsigned __int8 *)v13;
                }
                char v28 = -87;
              }
              else
              {
                char v28 = -55;
              }
            }
            else
            {
              char v28 = -48;
            }
            uint64_t v29 = v26 * a3;
            if ((unsigned __int128)(v26 * (__int128)a3) >> 64 != (v26 * a3) >> 63) {
              return 0;
            }
            uint64_t v26 = v29 + (v27 + v28);
            if (__OFADD__(v29, (v27 + v28))) {
              return 0;
            }
            ++result;
            --v3;
          }
          while (v3);
          return (unsigned __int8 *)(v29 + (v27 + v28));
        }
        return 0;
      }
      return 0;
    }
    if (a2 >= 1)
    {
      uint64_t v5 = a2 - 1;
      if (a2 != 1)
      {
        unsigned __int8 v6 = a3 + 48;
        unsigned __int8 v7 = a3 + 55;
        unsigned __int8 v8 = a3 + 87;
        if (a3 > 10)
        {
          unsigned __int8 v6 = 58;
        }
        else
        {
          unsigned __int8 v8 = 97;
          unsigned __int8 v7 = 65;
        }
        if (result)
        {
          uint64_t v9 = 0;
          for (uint64_t i = result + 1; ; ++i)
          {
            unsigned int v11 = *i;
            if (v11 < 0x30 || v11 >= v6)
            {
              if (v11 < 0x41 || v11 >= v7)
              {
                uint64_t v13 = 0;
                if (v11 < 0x61 || v11 >= v8) {
                  return (unsigned __int8 *)v13;
                }
                char v12 = -87;
              }
              else
              {
                char v12 = -55;
              }
            }
            else
            {
              char v12 = -48;
            }
            uint64_t v14 = v9 * a3;
            if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63) {
              return 0;
            }
            uint64_t v9 = v14 - (v11 + v12);
            if (__OFSUB__(v14, (v11 + v12))) {
              return 0;
            }
            if (!--v5) {
              return (unsigned __int8 *)v9;
            }
          }
        }
        return 0;
      }
      return 0;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_24FC2B104(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = sub_24FC2B170((uint64_t)sub_24FC2B16C, 0, a1, a2);
  uint64_t v6 = sub_24FC2B1A4(v2, v3, v4, v5);
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_24FC2B170(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v4 = HIBYTE(a4) & 0xF;
  if ((a4 & 0x2000000000000000) == 0) {
    uint64_t v4 = a3;
  }
  uint64_t v5 = 7;
  if (((a4 >> 60) & ((a3 & 0x800000000000000) == 0)) != 0) {
    uint64_t v5 = 11;
  }
  return MEMORY[0x270F9D8F0](15, v5 | (v4 << 16));
}

uint64_t sub_24FC2B1A4(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  if ((a4 & 0x1000000000000000) != 0)
  {
    uint64_t v9 = sub_24FC2B2FC(a1, a2, a3, a4);
    if (v9)
    {
      uint64_t v10 = v9;
      unsigned int v11 = sub_24FC2AD58(v9, 0);
      unint64_t v12 = sub_24FC2B3FC((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (v12 != v10)
      {
        __break(1u);
LABEL_11:
        sub_24FC4FB98();
LABEL_4:
        JUMPOUT(0x253373100);
      }
    }
    else
    {
      unsigned int v11 = (void *)MEMORY[0x263F8EE78];
    }
    uint64_t v13 = MEMORY[0x253373100](v11 + 4, v11[2]);
    swift_release();
    return v13;
  }
  else
  {
    if ((a4 & 0x2000000000000000) == 0)
    {
      if ((a3 & 0x1000000000000000) != 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
    v14[0] = a3;
    v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    return MEMORY[0x253373100]((char *)v14 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }
}

uint64_t sub_24FC2B2FC(unint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4)
{
  unint64_t v4 = a4;
  uint64_t v5 = a3;
  unint64_t v6 = a2;
  unint64_t v7 = a1;
  uint64_t v8 = (a3 >> 59) & 1;
  if ((a4 & 0x1000000000000000) == 0) {
    LOBYTE(v8) = 1;
  }
  uint64_t v9 = 4 << v8;
  if ((a1 & 0xC) == 4 << v8)
  {
    a1 = sub_24FC2ADC0(a1, a3, a4);
    unint64_t v7 = a1;
  }
  if ((v6 & 0xC) == v9)
  {
    a1 = sub_24FC2ADC0(v6, v5, v4);
    unint64_t v6 = a1;
    if ((v4 & 0x1000000000000000) == 0) {
      return (v6 >> 16) - (v7 >> 16);
    }
  }
  else if ((v4 & 0x1000000000000000) == 0)
  {
    return (v6 >> 16) - (v7 >> 16);
  }
  unint64_t v11 = HIBYTE(v4) & 0xF;
  if ((v4 & 0x2000000000000000) == 0) {
    unint64_t v11 = v5 & 0xFFFFFFFFFFFFLL;
  }
  if (v11 < v7 >> 16)
  {
    __break(1u);
  }
  else if (v11 >= v6 >> 16)
  {
    a1 = v7;
    a2 = v6;
    a3 = v5;
    a4 = v4;
    return MEMORY[0x270F9D808](a1, a2, a3, a4);
  }
  __break(1u);
  return MEMORY[0x270F9D808](a1, a2, a3, a4);
}

unint64_t sub_24FC2B3FC(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  uint64_t v9 = (void *)result;
  if (!a2) {
    goto LABEL_5;
  }
  if (!a3)
  {
    unint64_t v12 = a4;
    uint64_t v11 = 0;
    goto LABEL_35;
  }
  if (a3 < 0) {
    goto LABEL_38;
  }
  unint64_t v10 = a5 >> 14;
  unint64_t v27 = a4 >> 14;
  if (a4 >> 14 == a5 >> 14)
  {
LABEL_5:
    uint64_t v11 = 0;
    unint64_t v12 = a4;
LABEL_35:
    *uint64_t v9 = a4;
    v9[1] = a5;
    void v9[2] = a6;
    v9[3] = a7;
    v9[4] = v12;
    return v11;
  }
  uint64_t v11 = 0;
  uint64_t v14 = (a6 >> 59) & 1;
  if ((a7 & 0x1000000000000000) == 0) {
    LOBYTE(v14) = 1;
  }
  uint64_t v15 = 4 << v14;
  uint64_t v21 = (a7 & 0xFFFFFFFFFFFFFFFLL) + 32;
  uint64_t v22 = a7 & 0xFFFFFFFFFFFFFFLL;
  uint64_t v16 = HIBYTE(a7) & 0xF;
  if ((a7 & 0x2000000000000000) == 0) {
    uint64_t v16 = a6 & 0xFFFFFFFFFFFFLL;
  }
  unint64_t v23 = v16;
  uint64_t v26 = a3 - 1;
  unint64_t v12 = a4;
  while (1)
  {
    uint64_t result = v12;
    if ((v12 & 0xC) == v15) {
      uint64_t result = sub_24FC2ADC0(v12, a6, a7);
    }
    if (result >> 14 < v27 || result >> 14 >= v10) {
      break;
    }
    if ((a7 & 0x1000000000000000) != 0)
    {
      uint64_t result = sub_24FC4F8F8();
      char v19 = result;
    }
    else
    {
      unint64_t v18 = result >> 16;
      if ((a7 & 0x2000000000000000) != 0)
      {
        v28[0] = a6;
        v28[1] = v22;
        char v19 = *((unsigned char *)v28 + v18);
      }
      else
      {
        uint64_t result = v21;
        if ((a6 & 0x1000000000000000) == 0) {
          uint64_t result = sub_24FC4FB98();
        }
        char v19 = *(unsigned char *)(result + v18);
      }
    }
    if ((v12 & 0xC) == v15)
    {
      uint64_t result = sub_24FC2ADC0(v12, a6, a7);
      unint64_t v12 = result;
      if ((a7 & 0x1000000000000000) == 0)
      {
LABEL_27:
        unint64_t v12 = (v12 & 0xFFFFFFFFFFFF0000) + 65540;
        goto LABEL_31;
      }
    }
    else if ((a7 & 0x1000000000000000) == 0)
    {
      goto LABEL_27;
    }
    if (v23 <= v12 >> 16) {
      goto LABEL_37;
    }
    unint64_t v12 = sub_24FC4F8C8();
LABEL_31:
    *(unsigned char *)(a2 + v11) = v19;
    if (v26 == v11)
    {
      uint64_t v11 = a3;
      goto LABEL_35;
    }
    ++v11;
    if (v10 == v12 >> 14) {
      goto LABEL_35;
    }
  }
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
  return result;
}

uint64_t sub_24FC2B600(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void *, uint64_t, uint64_t))
{
  uint64_t v16 = a1;
  uint64_t v17 = a2;
  swift_bridgeObjectRetain();
  uint64_t v6 = sub_24FC4F938();
  uint64_t v8 = v6;
  unint64_t v9 = v7;
  if ((v7 & 0x1000000000000000) == 0)
  {
    if ((v7 & 0x2000000000000000) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v11 = HIBYTE(v9) & 0xF;
    uint64_t v16 = v8;
    uint64_t v17 = v9 & 0xFFFFFFFFFFFFFFLL;
    unint64_t v10 = &v16;
    goto LABEL_7;
  }
  uint64_t v8 = sub_24FC2B104(v6, v7);
  unint64_t v13 = v12;
  swift_bridgeObjectRelease();
  unint64_t v9 = v13;
  if ((v13 & 0x2000000000000000) != 0) {
    goto LABEL_6;
  }
LABEL_3:
  if ((v8 & 0x1000000000000000) != 0)
  {
    unint64_t v10 = (void *)((v9 & 0xFFFFFFFFFFFFFFFLL) + 32);
    uint64_t v11 = v8 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    unint64_t v10 = (void *)sub_24FC4FB98();
  }
LABEL_7:
  uint64_t v14 = a4(v10, v11, a3);
  swift_bridgeObjectRelease();
  return v14;
}

uint64_t sub_24FC2B6F8(uint64_t a1, uint64_t a2, void (*a3)(uint64_t *__return_ptr))
{
  if (a1)
  {
    a3(&var2);
    if (!v3) {
      char v4 = var2;
    }
  }
  else
  {
    ((void (*)(uint64_t *__return_ptr, void, void))a3)((uint64_t *)((char *)&var2 + 1), 0, 0);
    if (!v3) {
      char v4 = BYTE1(var2);
    }
  }
  return v4 & 1;
}

unsigned char *sub_24FC2B758@<X0>(unsigned char *a1@<X0>, BOOL *a2@<X8>)
{
  return sub_24FC2AE1C(a1, a2);
}

void *sub_24FC2B774@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = (*(void *(**)(uint64_t *__return_ptr))(v1 + 16))(&v5);
  if (!v2) {
    *a1 = v5;
  }
  return result;
}

unint64_t sub_24FC2B7B8()
{
  unint64_t result = qword_269A5CE80;
  if (!qword_269A5CE80)
  {
    type metadata accessor for JsonTokenStream();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A5CE80);
  }
  return result;
}

uint64_t sub_24FC2B808()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_24FC2B848()
{
  sub_24FC12240();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_24FC0C22C;
  sub_24FC2C128();
  return sub_24FC27058();
}

uint64_t sub_24FC2B8F0(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 1u) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t destroy for JsonTokenStream.TokenizerError(uint64_t a1)
{
  return sub_24FC2B918(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t sub_24FC2B918(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 1u) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t _s19GenerativeFunctions15JsonTokenStreamC14TokenizerErrorOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 16);
  sub_24FC2B8F0(*(void *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for JsonTokenStream.TokenizerError(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 16);
  sub_24FC2B8F0(*(void *)a2, v4, v5);
  uint64_t v6 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  unsigned __int8 v8 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v5;
  sub_24FC2B918(v6, v7, v8);
  return a1;
}

uint64_t assignWithTake for JsonTokenStream.TokenizerError(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  unsigned __int8 v6 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v3;
  sub_24FC2B918(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for JsonTokenStream.TokenizerError(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFE && *(unsigned char *)(a1 + 17))
    {
      int v2 = *(_DWORD *)a1 + 253;
    }
    else
    {
      unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
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

uint64_t storeEnumTagSinglePayload for JsonTokenStream.TokenizerError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)uint64_t result = a2 - 254;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_24FC2BAA0(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 1u) {
    return *(unsigned __int8 *)(a1 + 16);
  }
  else {
    return (*(_DWORD *)a1 + 2);
  }
}

uint64_t sub_24FC2BAB8(uint64_t result, unsigned int a2)
{
  if (a2 >= 2)
  {
    *(void *)uint64_t result = a2 - 2;
    *(void *)(result + 8) = 0;
    LOBYTE(a2) = 2;
  }
  *(unsigned char *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for JsonTokenStream.TokenizerError()
{
  return &type metadata for JsonTokenStream.TokenizerError;
}

unsigned __int8 *sub_24FC2BAE0(unsigned __int8 *a1, uint64_t a2, uint64_t a3)
{
  return sub_24FC2AE88(a1, a2, a3);
}

void sub_24FC2BBAC(unsigned int a1@<W8>)
{
  *uint64_t v1 = (a1 + 0xFEFEFEFEFEFEFFLL) & ~(-1 << (8 * ((4 - (__clz(a1) >> 3)) & 7)));
  JUMPOUT(0x253373100);
}

uint64_t sub_24FC2BC10()
{
  return sub_24FC4FC78();
}

uint64_t sub_24FC2BC48()
{
  return 34;
}

uint64_t sub_24FC2BC68()
{
  return sub_24FC4F928();
}

BOOL sub_24FC2BC94(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t sub_24FC2BCC0()
{
  return swift_arrayDestroy();
}

BOOL sub_24FC2BCF0@<W0>(unint64_t a1@<X8>)
{
  return a1 > 1;
}

uint64_t sub_24FC2BCFC()
{
  return swift_arrayDestroy();
}

uint64_t sub_24FC2BD18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  return sub_24FC49DD0(v5, v4, (uint64_t *)va);
}

void sub_24FC2BD44(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v6, a4, v5, 0xCu);
}

void sub_24FC2BD64(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v5, v4, a4, v6, 2u);
}

BOOL sub_24FC2BD84(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t sub_24FC2BDAC(uint64_t result)
{
  *(void *)(v1 + 176) = result;
  return result;
}

uint64_t sub_24FC2BDB8(char a1, int64_t a2, char a3, uint64_t a4, uint64_t *a5, uint64_t (*a6)(void), uint64_t a7, void (*a8)(void))
{
  return sub_24FC2A5A0(a1, a2, a3, a4, a5, a6, a6, a8);
}

void *sub_24FC2BDC0(void *a1, int64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5, void (*a6)(void, uint64_t, void *, uint64_t), void (*a7)(uint64_t, uint64_t, void *))
{
  return sub_24FC2A434(a1, a2, 1, v7, a5, a6, a7);
}

uint64_t sub_24FC2BDD8()
{
  return swift_beginAccess();
}

void sub_24FC2BDF0()
{
  *(void *)(v3 + 120) = v0;
  *(void *)(v0 + 16) = v2;
  uint64_t v6 = v0 + 16 * v5;
  *(void *)(v6 + 32) = v4;
  *(void *)(v6 + 40) = v1;
  *(void *)(v3 + 72) = v0;
}

uint64_t sub_24FC2BE20()
{
  return sub_24FC4F928();
}

uint64_t sub_24FC2BE3C()
{
  return sub_24FC4FC38();
}

uint64_t sub_24FC2BE60()
{
  return sub_24FC4FB18();
}

BOOL sub_24FC2BE88(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t sub_24FC2BEA4()
{
  return v0;
}

uint64_t sub_24FC2BEBC(uint64_t a1, uint64_t a2)
{
  sub_24FC20B5C(a1, a2);
  return swift_bridgeObjectRetain();
}

uint64_t sub_24FC2BF20(uint64_t a1)
{
  *uint64_t v1 = a1;
  return sub_24FC4FB18();
}

uint64_t sub_24FC2BF44()
{
  return v0;
}

uint64_t sub_24FC2BF54()
{
  return sub_24FC4F898();
}

unint64_t sub_24FC2BF70(uint64_t a1)
{
  return a1 & 0xFFFFFFFFFFFFFFFCLL | v1 & 3;
}

uint64_t sub_24FC2BF88()
{
  *(void *)(v0 + 32) = 0;
  *(void *)(v0 + 40) = 0xE000000000000000;
  return swift_bridgeObjectRetain();
}

uint64_t sub_24FC2BFAC(uint64_t a1)
{
  *(void *)(v1 + 88) = a1;
  return sub_24FC4FB18();
}

uint64_t sub_24FC2BFF4()
{
  return v0;
}

uint64_t sub_24FC2C01C()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_24FC2C058(float a1)
{
  *uint64_t v1 = a1;
  return swift_bridgeObjectRetain();
}

uint64_t sub_24FC2C078()
{
  return v0;
}

uint64_t sub_24FC2C08C(uint64_t result)
{
  *(void *)(v1 + 128) = result;
  return result;
}

void *sub_24FC2C0A4(void *a1, int64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5, void (*a6)(void, uint64_t, void *, uint64_t), void (*a7)(uint64_t, uint64_t, void *))
{
  return sub_24FC2A434(a1, a2, 1, v7, a5, a6, a7);
}

uint64_t sub_24FC2C0D0()
{
  return v0;
}

uint64_t sub_24FC2C0F8()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t sub_24FC2C110()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t sub_24FC2C128()
{
  return v0;
}

uint64_t sub_24FC2C13C(float a1)
{
  *uint64_t v1 = a1;
  return swift_bridgeObjectRetain();
}

uint64_t sub_24FC2C15C()
{
  return v0;
}

void sub_24FC2C168(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v5, v6, a4, v4, 0xCu);
}

void sub_24FC2C188(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v6, a4, v5, 0xCu);
}

uint64_t sub_24FC2C1DC()
{
  return 1;
}

uint64_t sub_24FC2C204(uint64_t a1)
{
  return sub_24FC2C2C8(a1, qword_269A5E9E0);
}

uint64_t sub_24FC2C228(uint64_t a1)
{
  return sub_24FC2C2C8(a1, qword_269A5E9F8);
}

uint64_t *sub_24FC2C244(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_24FC2C2A8(uint64_t a1)
{
  return sub_24FC2C2C8(a1, qword_269A5EA10);
}

uint64_t sub_24FC2C2C8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_24FC4F6B8();
  sub_24FC2C244(v3, a2);
  sub_24FC20B5C(v3, (uint64_t)a2);
  return sub_24FC4F6A8();
}

uint64_t sub_24FC2C340()
{
  uint64_t v0 = sub_24FC4F728();
  sub_24FC2C244(v0, qword_269A5CEB0);
  sub_24FC20B5C(v0, (uint64_t)qword_269A5CEB0);
  return sub_24FC4F738();
}

uint64_t ChatLanguageModelProviding.respond(to:parameters:)()
{
  sub_24FC12240();
  v0[26] = sub_24FC30254(v1, v2, v3, v4, v5, v6, v7);
  sub_24FC14ED0();
  v0[27] = v8;
  v0[28] = sub_24FC3021C();
  uint64_t v9 = swift_task_alloc();
  v0[30] = sub_24FC304FC(v9);
  uint64_t v10 = sub_24FC2FD9C(qword_269A5C9B8, MEMORY[0x263F61FA8]);
  uint64_t v11 = sub_24FC2FEC4(v10);
  v0[32] = v11;
  sub_24FC12018(v11);
  v0[33] = v12;
  uint64_t v13 = sub_24FC30200();
  v0[35] = sub_24FC304B8(v13);
  v0[36] = sub_24FC30238();
  v0[37] = sub_24FC12200();
  sub_24FC12064();
  return MEMORY[0x270FA2498](v14, v15, v16);
}

#error "24FC2C664: call analysis failed (funcsize=142)"

uint64_t sub_24FC2C734()
{
  sub_24FC12240();
  sub_24FC300B4();
  sub_24FC1204C();
  *uint64_t v3 = v2;
  *uint64_t v3 = *v1;
  *(void *)(v2 + 312) = v0;
  swift_task_dealloc();
  sub_24FC2153C();
  v4();
  sub_24FC12064();
  return MEMORY[0x270FA2498](v5, v6, v7);
}

uint64_t sub_24FC2C868()
{
  sub_24FC2FFBC();
  sub_24FC12258();
  _s19GenerativeFunctions26TokenStreamProcessorCloserVwxx_0(v0 + 16);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_24FC12110();
  sub_24FC2BEE8();
  return v2(v1, v2, v3, v4, v5, v6, v7, v8);
}

uint64_t sub_24FC2C904()
{
  sub_24FC2FFBC();
  sub_24FC12258();
  sub_24FC3005C();
  uint64_t v3 = v2;
  sub_24FC1203C();
  *uint64_t v4 = v3;
  *uint64_t v4 = *v1;
  *(void *)(v3 + 328) = v0;
  swift_task_dealloc();
  sub_24FC2153C();
  v5();
  if (v0)
  {
    sub_24FC12064();
    sub_24FC2BEE8();
    return MEMORY[0x270FA2498](v6, v7, v8);
  }
  else
  {
    sub_24FC304D0();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    sub_24FC30490();
    sub_24FC2BEE8();
    return v11(v10, v11, v12, v13, v14, v15, v16, v17);
  }
}

uint64_t sub_24FC2CA80()
{
  sub_24FC12258();
  _s19GenerativeFunctions26TokenStreamProcessorCloserVwxx_0(v0 + 16);
  sub_24FC3055C();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_24FC0BAC8();
  return v1();
}

uint64_t sub_24FC2CB20()
{
  sub_24FC12258();
  sub_24FC3055C();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_24FC0BAC8();
  return v0();
}

uint64_t sub_24FC2CBB8(uint64_t a1)
{
  uint64_t v2 = sub_24FC13C3C(qword_26B1FD7C0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

_OWORD *sub_24FC2CC18(long long *a1, _OWORD *a2)
{
  long long v2 = *a1;
  long long v3 = a1[2];
  a2[1] = a1[1];
  a2[2] = v3;
  *a2 = v2;
  return a2;
}

uint64_t ChatLanguageModelProviding.respond<A>(to:)()
{
  sub_24FC12030();
  v0[12] = sub_24FC303C4(v1, v2, v3, v4, v5, v6);
  sub_24FC14ED0();
  v0[13] = v7;
  v0[14] = sub_24FC12200();
  uint64_t v8 = sub_24FC2FD9C(qword_269A5C9B8, MEMORY[0x263F61FA8]);
  v0[15] = v8;
  uint64_t v9 = sub_24FC2FEA0(v8);
  v0[16] = v9;
  sub_24FC12018(v9);
  v0[17] = v10;
  v0[18] = sub_24FC12200();
  sub_24FC12064();
  return MEMORY[0x270FA2498](v11, v12, v13);
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;

  sub_24FC12030();
  v0[11] = sub_24FC30430(v1, v2, v3, v4, v5);
  uint64_t v6 = sub_24FC2FD9C(qword_269A5C9B8, MEMORY[0x263F61FA8]);
  v0[12] = v6;
  uint64_t v7 = sub_24FC2FEA0(v6);
  v0[13] = v7;
  sub_24FC12018(v7);
  v0[14] = v8;
  v0[15] = sub_24FC12200();
  sub_24FC12064();
  return MEMORY[0x270FA2498](v9, v10, v11);
}

uint64_t sub_24FC2CD1C()
{
  sub_24FC3014C();
  v2();
  if (v0)
  {
    swift_task_dealloc();
    swift_task_dealloc();
    sub_24FC2FEEC();
    sub_24FC30454();
    __asm { BRAA            X1, X16 }
  }
  sub_24FC2FFA0(*(void *)(v1 + 88));
  uint64_t v5 = sub_24FC2FF88();
  v6(v5);
  sub_24FC301C0();
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v1 + 152) = v7;
  void *v7 = v1;
  v7[1] = sub_24FC2CE54;
  sub_24FC30110();
  sub_24FC30454();
  return GenerativeConfigurationRunnable<>.run(returning:)();
}

uint64_t sub_24FC2CE54()
{
  sub_24FC2FFBC();
  sub_24FC12258();
  sub_24FC30074();
  uint64_t v3 = v2;
  sub_24FC1203C();
  *uint64_t v4 = v3;
  *uint64_t v4 = *v1;
  *(void *)(v3 + 160) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v5 = sub_24FC300A0();
    v6(v5);
    sub_24FC12064();
    sub_24FC2BEE8();
    return MEMORY[0x270FA2498](v7, v8, v9);
  }
  else
  {
    uint64_t v11 = sub_24FC300A0();
    v12(v11);
    swift_task_dealloc();
    swift_task_dealloc();
    sub_24FC30514();
    sub_24FC2BEE8();
    return v14(v13, v14, v15, v16, v17, v18, v19, v20);
  }
}

uint64_t sub_24FC2CFBC()
{
  sub_24FC12030();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_24FC0BAC8();
  return v0();
}

uint64_t sub_24FC2D0EC()
{
  sub_24FC2FFBC();
  sub_24FC12258();
  sub_24FC2FF44();
  sub_24FC301C0();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)sub_24FC30100(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_24FC2D188;
  sub_24FC2FFD0();
  sub_24FC2BEE8();
  return GenerativeConfigurationRunnable<>.run(returning:)();
}

uint64_t sub_24FC2D188()
{
  sub_24FC2FFBC();
  sub_24FC12258();
  sub_24FC0BAB0();
  uint64_t v3 = v2;
  sub_24FC1204C();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  sub_24FC1203C();
  *uint64_t v6 = v5;
  *(void *)(v3 + 136) = v0;
  swift_task_dealloc();
  uint64_t v7 = sub_24FC2FE88();
  v8(v7);
  if (v0)
  {
    sub_24FC12064();
    sub_24FC2BEE8();
    return MEMORY[0x270FA2498](v9, v10, v11);
  }
  else
  {
    swift_task_dealloc();
    sub_24FC0BAC8();
    sub_24FC2BEE8();
    return v14(v13, v14, v15, v16, v17, v18, v19, v20);
  }
}

uint64_t sub_24FC2D2D8()
{
  sub_24FC12030();
  swift_task_dealloc();
  sub_24FC0BAC8();
  return v0();
}

uint64_t ChatLanguageModelProvidingStreamable.streamResponse(to:parameters:)()
{
  sub_24FC12240();
  v0[26] = sub_24FC30254(v1, v2, v3, v4, v5, v6, v7);
  sub_24FC14ED0();
  v0[27] = v8;
  v0[28] = sub_24FC3021C();
  uint64_t v9 = swift_task_alloc();
  v0[30] = sub_24FC304FC(v9);
  uint64_t v10 = sub_24FC2FD9C(qword_269A5C9B8, MEMORY[0x263F61FA8]);
  uint64_t v11 = sub_24FC2FEC4(v10);
  v0[32] = v11;
  sub_24FC12018(v11);
  v0[33] = v12;
  uint64_t v13 = sub_24FC30200();
  v0[35] = sub_24FC304B8(v13);
  v0[36] = sub_24FC30238();
  v0[37] = sub_24FC12200();
  sub_24FC12064();
  return MEMORY[0x270FA2498](v14, v15, v16);
}

#error "24FC2D5F4: call analysis failed (funcsize=142)"

uint64_t sub_24FC2D6C4()
{
  sub_24FC12240();
  sub_24FC300B4();
  sub_24FC1204C();
  *uint64_t v3 = v2;
  *uint64_t v3 = *v1;
  *(void *)(v2 + 312) = v0;
  swift_task_dealloc();
  sub_24FC2153C();
  v4();
  sub_24FC12064();
  return MEMORY[0x270FA2498](v5, v6, v7);
}

uint64_t sub_24FC2D7F8()
{
  sub_24FC2FFBC();
  sub_24FC12258();
  sub_24FC3005C();
  uint64_t v3 = v2;
  sub_24FC1203C();
  *uint64_t v4 = v3;
  *uint64_t v4 = *v1;
  *(void *)(v3 + 328) = v0;
  swift_task_dealloc();
  sub_24FC2153C();
  v5();
  if (v0)
  {
    sub_24FC12064();
    sub_24FC2BEE8();
    return MEMORY[0x270FA2498](v6, v7, v8);
  }
  else
  {
    sub_24FC304D0();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    sub_24FC30490();
    sub_24FC2BEE8();
    return v11(v10, v11, v12, v13, v14, v15, v16, v17);
  }
}

uint64_t ChatLanguageModelProvidingStreamable.streamResponse<A>(to:)()
{
  sub_24FC12030();
  v0[12] = sub_24FC303C4(v1, v2, v3, v4, v5, v6);
  sub_24FC14ED0();
  v0[13] = v7;
  v0[14] = sub_24FC12200();
  uint64_t v8 = sub_24FC2FD9C(qword_269A5C9B8, MEMORY[0x263F61FA8]);
  v0[15] = v8;
  uint64_t v9 = sub_24FC2FEA0(v8);
  v0[16] = v9;
  sub_24FC12018(v9);
  v0[17] = v10;
  v0[18] = sub_24FC12200();
  sub_24FC12064();
  return MEMORY[0x270FA2498](v11, v12, v13);
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;

  sub_24FC12030();
  v0[11] = sub_24FC30430(v1, v2, v3, v4, v5);
  uint64_t v6 = sub_24FC2FD9C(qword_269A5C9B8, MEMORY[0x263F61FA8]);
  v0[12] = v6;
  uint64_t v7 = sub_24FC2FEA0(v6);
  v0[13] = v7;
  sub_24FC12018(v7);
  v0[14] = v8;
  v0[15] = sub_24FC12200();
  sub_24FC12064();
  return MEMORY[0x270FA2498](v9, v10, v11);
}

uint64_t sub_24FC2DA60()
{
  sub_24FC3014C();
  v2();
  if (v0)
  {
    swift_task_dealloc();
    swift_task_dealloc();
    sub_24FC2FEEC();
    sub_24FC30454();
    __asm { BRAA            X1, X16 }
  }
  sub_24FC2FFA0(*(void *)(v1 + 88));
  uint64_t v5 = sub_24FC2FF88();
  v6(v5);
  sub_24FC301E0();
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v1 + 152) = v7;
  void *v7 = v1;
  v7[1] = sub_24FC2DB98;
  sub_24FC30110();
  sub_24FC30454();
  return GenerativeConfigurationRunnable<>.run(returning:)();
}

uint64_t sub_24FC2DB98()
{
  sub_24FC2FFBC();
  sub_24FC12258();
  sub_24FC30074();
  uint64_t v3 = v2;
  sub_24FC1203C();
  *uint64_t v4 = v3;
  *uint64_t v4 = *v1;
  *(void *)(v3 + 160) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v5 = sub_24FC300A0();
    v6(v5);
    sub_24FC12064();
    sub_24FC2BEE8();
    return MEMORY[0x270FA2498](v7, v8, v9);
  }
  else
  {
    uint64_t v11 = sub_24FC300A0();
    v12(v11);
    swift_task_dealloc();
    swift_task_dealloc();
    sub_24FC30514();
    sub_24FC2BEE8();
    return v14(v13, v14, v15, v16, v17, v18, v19, v20);
  }
}

uint64_t sub_24FC2DDC8()
{
  sub_24FC2FFBC();
  sub_24FC12258();
  sub_24FC2FF44();
  sub_24FC301E0();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)sub_24FC30100(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_24FC2DE64;
  sub_24FC2FFD0();
  sub_24FC2BEE8();
  return GenerativeConfigurationRunnable<>.run(returning:)();
}

uint64_t sub_24FC2DE64()
{
  sub_24FC2FFBC();
  sub_24FC12258();
  sub_24FC0BAB0();
  uint64_t v3 = v2;
  sub_24FC1204C();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  sub_24FC1203C();
  *uint64_t v6 = v5;
  *(void *)(v3 + 136) = v0;
  swift_task_dealloc();
  uint64_t v7 = sub_24FC2FE88();
  v8(v7);
  if (v0)
  {
    sub_24FC12064();
    sub_24FC2BEE8();
    return MEMORY[0x270FA2498](v9, v10, v11);
  }
  else
  {
    swift_task_dealloc();
    sub_24FC0BAC8();
    sub_24FC2BEE8();
    return v14(v13, v14, v15, v16, v17, v18, v19, v20);
  }
}

uint64_t CompletionLanguageModelProviding.complete(prompt:parameters:)()
{
  sub_24FC12030();
  sub_24FC305C8(v1, v2, v3, v4, v5, v6, v7);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v0[10] = AssociatedTypeWitness;
  sub_24FC12018(AssociatedTypeWitness);
  v0[11] = v9;
  v0[12] = sub_24FC12200();
  uint64_t v10 = sub_24FC4F718();
  v0[13] = v10;
  sub_24FC12018(v10);
  v0[14] = v11;
  v0[15] = sub_24FC12200();
  sub_24FC12064();
  return MEMORY[0x270FA2498](v12, v13, v14);
}

uint64_t sub_24FC2E088()
{
  sub_24FC12240();
  sub_24FC3014C();
  uint64_t v3 = v2();
  if (v0)
  {
    swift_task_dealloc();
    swift_task_dealloc();
    sub_24FC2FEEC();
    return v4();
  }
  else
  {
    (*(void (**)(uint64_t))(v1 + 40))(v3);
    uint64_t v6 = swift_task_alloc();
    uint64_t v7 = (void *)sub_24FC30100(v6);
    void *v7 = v8;
    v7[1] = sub_24FC2E18C;
    sub_24FC30340();
    return sub_24FC2E398();
  }
}

uint64_t sub_24FC2E18C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  sub_24FC30158();
  sub_24FC304F0();
  sub_24FC0BAB0();
  uint64_t v15 = v14;
  sub_24FC1204C();
  *uint64_t v16 = v15;
  uint64_t v17 = *v13;
  sub_24FC1203C();
  *uint64_t v18 = v17;
  *(void *)(v15 + 136) = v12;
  swift_task_dealloc();
  uint64_t v19 = sub_24FC2FF70();
  v20(v19);
  uint64_t v21 = sub_24FC2FE0C();
  v22(v21);
  if (v12)
  {
    sub_24FC12064();
    sub_24FC23FDC();
    return MEMORY[0x270FA2498](v23, v24, v25);
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    sub_24FC3008C();
    sub_24FC23FDC();
    return v28(v27, v28, v29, v30, v31, v32, v33, v34, a9, a10, a11, a12);
  }
}

uint64_t sub_24FC2E330()
{
  sub_24FC12030();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_24FC0BAC8();
  return v0();
}

uint64_t sub_24FC2E398()
{
  sub_24FC12240();
  uint64_t v6 = sub_24FC302D4(v1, v2, v3, v4, v5);
  v0[24] = v6;
  sub_24FC12018(v6);
  v0[25] = v7;
  v0[26] = sub_24FC12200();
  v0[27] = sub_24FC4F6D8();
  sub_24FC14ED0();
  v0[28] = v8;
  uint64_t v9 = sub_24FC3021C();
  v0[30] = sub_24FC304FC(v9);
  uint64_t v10 = sub_24FC2FD9C(&qword_26B1FD7B0, MEMORY[0x263F61F60]);
  uint64_t v11 = sub_24FC2FEC4(v10);
  v0[32] = v11;
  sub_24FC12018(v11);
  v0[33] = v12;
  uint64_t v13 = sub_24FC30200();
  v0[35] = sub_24FC304B8(v13);
  uint64_t v14 = sub_24FC30238();
  v0[36] = v14;
  sub_24FC12018(v14);
  v0[37] = v15;
  v0[38] = sub_24FC12200();
  sub_24FC12064();
  return MEMORY[0x270FA2498](v16, v17, v18);
}

#error "24FC2E610: call analysis failed (funcsize=107)"

uint64_t sub_24FC2E6C8()
{
  sub_24FC12240();
  sub_24FC0BAB0();
  sub_24FC1204C();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  sub_24FC1203C();
  *uint64_t v5 = v4;
  *(void *)(v6 + 320) = v0;
  swift_task_dealloc();
  uint64_t v7 = sub_24FC122D0();
  v8(v7);
  sub_24FC12064();
  return MEMORY[0x270FA2498](v9, v10, v11);
}

uint64_t sub_24FC2E7F0()
{
  sub_24FC2FFBC();
  sub_24FC12258();
  _s19GenerativeFunctions26TokenStreamProcessorCloserVwxx_0(v0 + 16);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_24FC12110();
  sub_24FC2BEE8();
  return v2(v1, v2, v3, v4, v5, v6, v7, v8);
}

uint64_t sub_24FC2E88C()
{
  sub_24FC2FFBC();
  sub_24FC12258();
  sub_24FC0BAB0();
  uint64_t v3 = v2;
  sub_24FC1204C();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  sub_24FC1203C();
  *uint64_t v6 = v5;
  *(void *)(v3 + 336) = v0;
  swift_task_dealloc();
  uint64_t v7 = sub_24FC2FE88();
  v8(v7);
  if (v0)
  {
    sub_24FC12064();
    sub_24FC2BEE8();
    return MEMORY[0x270FA2498](v9, v10, v11);
  }
  else
  {
    sub_24FC30588();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    sub_24FC12110();
    sub_24FC2BEE8();
    return v14(v13, v14, v15, v16, v17, v18, v19, v20);
  }
}

uint64_t sub_24FC2EA00()
{
  sub_24FC12258();
  _s19GenerativeFunctions26TokenStreamProcessorCloserVwxx_0(v0 + 16);
  sub_24FC305A8();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_24FC0BAC8();
  return v1();
}

uint64_t sub_24FC2EA98()
{
  sub_24FC12258();
  sub_24FC305A8();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_24FC0BAC8();
  return v0();
}

uint64_t CompletionLanguageModelProviding.complete<A>(prompt:)()
{
  sub_24FC12030();
  uint64_t v7 = sub_24FC3035C(v1, v2, v3, v4, v5, v6);
  v0[9] = v7;
  sub_24FC12018(v7);
  v0[10] = v8;
  v0[11] = sub_24FC12200();
  uint64_t v9 = sub_24FC4F718();
  v0[12] = v9;
  sub_24FC12018(v9);
  v0[13] = v10;
  v0[14] = sub_24FC12200();
  sub_24FC12064();
  return MEMORY[0x270FA2498](v11, v12, v13);
}

uint64_t sub_24FC2EBDC()
{
  sub_24FC12240();
  sub_24FC3014C();
  v2();
  if (v0)
  {
    swift_task_dealloc();
    swift_task_dealloc();
    sub_24FC2FEEC();
    return v3();
  }
  else
  {
    sub_24FC3053C();
    uint64_t v5 = (void *)swift_task_alloc();
    *(void *)(v1 + 120) = v5;
    *uint64_t v5 = v1;
    v5[1] = sub_24FC2ECCC;
    sub_24FC30324();
    return sub_24FC2E398();
  }
}

uint64_t sub_24FC2ECCC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  sub_24FC30158();
  sub_24FC304F0();
  sub_24FC0BAB0();
  uint64_t v15 = v14;
  sub_24FC1204C();
  *uint64_t v16 = v15;
  uint64_t v17 = *v13;
  sub_24FC1203C();
  *uint64_t v18 = v17;
  *(void *)(v15 + 128) = v12;
  swift_task_dealloc();
  uint64_t v19 = sub_24FC2FF70();
  v20(v19);
  uint64_t v21 = sub_24FC2FE0C();
  v22(v21);
  if (v12)
  {
    sub_24FC12064();
    sub_24FC23FDC();
    return MEMORY[0x270FA2498](v23, v24, v25);
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    sub_24FC3008C();
    sub_24FC23FDC();
    return v28(v27, v28, v29, v30, v31, v32, v33, v34, a9, a10, a11, a12);
  }
}

uint64_t sub_24FC2EE70()
{
  sub_24FC12030();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_24FC0BAC8();
  return v0();
}

uint64_t CompletionLanguageModelProviding.complete<A>(prompt:)(uint64_t a1)
{
  *(void *)(v1 + 32) = a1;
  sub_24FC12064();
  return MEMORY[0x270FA2498](v2, v3, v4);
}

uint64_t sub_24FC2EEFC()
{
  sub_24FC12030();
  *(void *)(v0 + 16) = 0x6F77206F6C6C6568;
  *(void *)(v0 + 24) = 0xEB00000000646C72;
  sub_24FC4F478();
  sub_24FC12110();
  return v1();
}

uint64_t CompletionLanguageModelProvidingStreamable.streamCompletion(of:parameters:)()
{
  sub_24FC12030();
  sub_24FC305C8(v1, v2, v3, v4, v5, v6, v7);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v0[10] = AssociatedTypeWitness;
  sub_24FC12018(AssociatedTypeWitness);
  v0[11] = v9;
  v0[12] = sub_24FC12200();
  uint64_t v10 = sub_24FC4F718();
  v0[13] = v10;
  sub_24FC12018(v10);
  v0[14] = v11;
  v0[15] = sub_24FC12200();
  sub_24FC12064();
  return MEMORY[0x270FA2498](v12, v13, v14);
}

uint64_t sub_24FC2F058()
{
  sub_24FC12240();
  sub_24FC3014C();
  uint64_t v3 = v2();
  if (v0)
  {
    swift_task_dealloc();
    swift_task_dealloc();
    sub_24FC2FEEC();
    return v4();
  }
  else
  {
    (*(void (**)(uint64_t))(v1 + 40))(v3);
    uint64_t v6 = swift_task_alloc();
    uint64_t v7 = (void *)sub_24FC30100(v6);
    void *v7 = v8;
    v7[1] = sub_24FC2F15C;
    sub_24FC30340();
    return sub_24FC2F300();
  }
}

uint64_t sub_24FC2F15C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  sub_24FC30158();
  sub_24FC304F0();
  sub_24FC0BAB0();
  uint64_t v15 = v14;
  sub_24FC1204C();
  *uint64_t v16 = v15;
  uint64_t v17 = *v13;
  sub_24FC1203C();
  *uint64_t v18 = v17;
  *(void *)(v15 + 136) = v12;
  swift_task_dealloc();
  uint64_t v19 = sub_24FC2FF70();
  v20(v19);
  uint64_t v21 = sub_24FC2FE0C();
  v22(v21);
  if (v12)
  {
    sub_24FC12064();
    sub_24FC23FDC();
    return MEMORY[0x270FA2498](v23, v24, v25);
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    sub_24FC3008C();
    sub_24FC23FDC();
    return v28(v27, v28, v29, v30, v31, v32, v33, v34, a9, a10, a11, a12);
  }
}

uint64_t sub_24FC2F300()
{
  sub_24FC12240();
  uint64_t v6 = sub_24FC302D4(v1, v2, v3, v4, v5);
  v0[24] = v6;
  sub_24FC12018(v6);
  v0[25] = v7;
  v0[26] = sub_24FC12200();
  v0[27] = sub_24FC4F6D8();
  sub_24FC14ED0();
  v0[28] = v8;
  uint64_t v9 = sub_24FC3021C();
  v0[30] = sub_24FC304FC(v9);
  uint64_t v10 = sub_24FC2FD9C(&qword_26B1FD7B0, MEMORY[0x263F61F60]);
  uint64_t v11 = sub_24FC2FEC4(v10);
  v0[32] = v11;
  sub_24FC12018(v11);
  v0[33] = v12;
  uint64_t v13 = sub_24FC30200();
  v0[35] = sub_24FC304B8(v13);
  uint64_t v14 = sub_24FC30238();
  v0[36] = v14;
  sub_24FC12018(v14);
  v0[37] = v15;
  v0[38] = sub_24FC12200();
  sub_24FC12064();
  return MEMORY[0x270FA2498](v16, v17, v18);
}

#error "24FC2F578: call analysis failed (funcsize=107)"

uint64_t sub_24FC2F630()
{
  sub_24FC12240();
  sub_24FC0BAB0();
  sub_24FC1204C();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  sub_24FC1203C();
  *uint64_t v5 = v4;
  *(void *)(v6 + 320) = v0;
  swift_task_dealloc();
  uint64_t v7 = sub_24FC122D0();
  v8(v7);
  sub_24FC12064();
  return MEMORY[0x270FA2498](v9, v10, v11);
}

uint64_t sub_24FC2F758()
{
  sub_24FC2FFBC();
  sub_24FC12258();
  sub_24FC0BAB0();
  uint64_t v3 = v2;
  sub_24FC1204C();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  sub_24FC1203C();
  *uint64_t v6 = v5;
  *(void *)(v3 + 336) = v0;
  swift_task_dealloc();
  uint64_t v7 = sub_24FC2FE88();
  v8(v7);
  if (v0)
  {
    sub_24FC12064();
    sub_24FC2BEE8();
    return MEMORY[0x270FA2498](v9, v10, v11);
  }
  else
  {
    sub_24FC30588();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    sub_24FC12110();
    sub_24FC2BEE8();
    return v14(v13, v14, v15, v16, v17, v18, v19, v20);
  }
}

uint64_t CompletionLanguageModelProvidingStreamable.streamCompletion<A>(of:)()
{
  sub_24FC12030();
  uint64_t v7 = sub_24FC3035C(v1, v2, v3, v4, v5, v6);
  v0[9] = v7;
  sub_24FC12018(v7);
  v0[10] = v8;
  v0[11] = sub_24FC12200();
  uint64_t v9 = sub_24FC4F718();
  v0[12] = v9;
  sub_24FC12018(v9);
  v0[13] = v10;
  v0[14] = sub_24FC12200();
  sub_24FC12064();
  return MEMORY[0x270FA2498](v11, v12, v13);
}

{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;

  sub_24FC12030();
  v1[9] = v2;
  v1[10] = v0;
  v1[7] = v3;
  v1[8] = v4;
  v1[6] = v5;
  v1[11] = sub_24FC4F6D8();
  uint64_t v6 = sub_24FC2FD9C(&qword_26B1FD7B0, MEMORY[0x263F61F60]);
  v1[12] = v6;
  uint64_t v7 = sub_24FC2FEA0(v6);
  v1[13] = v7;
  sub_24FC12018(v7);
  v1[14] = v8;
  v1[15] = sub_24FC12200();
  sub_24FC12064();
  return MEMORY[0x270FA2498](v9, v10, v11);
}

uint64_t sub_24FC2F980()
{
  sub_24FC12240();
  sub_24FC3014C();
  v2();
  if (v0)
  {
    swift_task_dealloc();
    swift_task_dealloc();
    sub_24FC2FEEC();
    return v3();
  }
  else
  {
    sub_24FC3053C();
    uint64_t v5 = (void *)swift_task_alloc();
    *(void *)(v1 + 120) = v5;
    *uint64_t v5 = v1;
    v5[1] = sub_24FC2FA70;
    sub_24FC30324();
    return sub_24FC2F300();
  }
}

uint64_t sub_24FC2FA70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  sub_24FC30158();
  sub_24FC304F0();
  sub_24FC0BAB0();
  uint64_t v15 = v14;
  sub_24FC1204C();
  *uint64_t v16 = v15;
  uint64_t v17 = *v13;
  sub_24FC1203C();
  *uint64_t v18 = v17;
  *(void *)(v15 + 128) = v12;
  swift_task_dealloc();
  uint64_t v19 = sub_24FC2FF70();
  v20(v19);
  uint64_t v21 = sub_24FC2FE0C();
  v22(v21);
  if (v12)
  {
    sub_24FC12064();
    sub_24FC23FDC();
    return MEMORY[0x270FA2498](v23, v24, v25);
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    sub_24FC3008C();
    sub_24FC23FDC();
    return v28(v27, v28, v29, v30, v31, v32, v33, v34, a9, a10, a11, a12);
  }
}

uint64_t sub_24FC2FCF0()
{
  sub_24FC2FFBC();
  sub_24FC12258();
  sub_24FC2FF44();
  sub_24FC0E6C0();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)sub_24FC30100(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_24FC2DE64;
  sub_24FC2FFD0();
  sub_24FC2BEE8();
  return GenerativeConfigurationRunnable<>.run(returning:)();
}

uint64_t sub_24FC2FD9C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_24FC2FE0C()
{
  return v0;
}

uint64_t sub_24FC2FE24()
{
  uint64_t v2 = *(void *)(v1 + 208);
  sub_24FC2CC18(v0, (_OWORD *)(v1 + 16));
  sub_24FC0CC3C((void *)(v1 + 16), *(void *)(v1 + 40));
  return v2;
}

uint64_t sub_24FC2FE88()
{
  return v0;
}

uint64_t sub_24FC2FEA0(uint64_t a1)
{
  v3[2] = v2;
  v3[3] = v1;
  v3[4] = v2;
  v3[5] = a1;
  return type metadata accessor for GenerativeConfigurationRunnable();
}

uint64_t sub_24FC2FEC4(uint64_t a1)
{
  v3[31] = a1;
  v3[14] = v1;
  v3[15] = v2;
  v3[16] = v1;
  v3[17] = a1;
  return type metadata accessor for GenerativeConfigurationRunnable();
}

uint64_t sub_24FC2FEEC()
{
  return v0 + 8;
}

uint64_t sub_24FC2FEFC()
{
  _OWORD *v0 = 0u;
  v0[1] = 0u;
  v0[2] = 0u;
  return sub_24FC2CBB8((uint64_t)v0);
}

uint64_t sub_24FC2FF44()
{
  uint64_t v2 = v0[10];
  uint64_t v3 = v0[11];
  uint64_t v4 = v0[8];
  return GenerativeConfigurationProtocol.with<A>(model:)(v2, v3, v4);
}

uint64_t sub_24FC2FF70()
{
  return v0;
}

uint64_t sub_24FC2FF88()
{
  return v0;
}

uint64_t sub_24FC2FFA0(uint64_t a1)
{
  return GenerativeConfigurationProtocol.with<A>(model:)(a1, v1, v2);
}

uint64_t sub_24FC2FFD0()
{
  return *(void *)(v0 + 48);
}

uint64_t sub_24FC2FFEC()
{
  return *(void *)(v0 + 304);
}

void *sub_24FC30018()
{
  sub_24FC2CC18(v0, (_OWORD *)(v1 + 16));
  return sub_24FC0CC3C((void *)(v1 + 16), *(void *)(v1 + 40));
}

uint64_t sub_24FC3008C()
{
  return v0 + 8;
}

uint64_t sub_24FC300A0()
{
  return v0;
}

uint64_t sub_24FC300CC()
{
  return sub_24FC4F728();
}

uint64_t sub_24FC30100(uint64_t result)
{
  *(void *)(v1 + 128) = result;
  return result;
}

uint64_t sub_24FC3011C()
{
  return sub_24FC4F728();
}

uint64_t sub_24FC30194(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  return MEMORY[0x270F583C0](a1, a11, v15, v13, v14, a13, a12);
}

uint64_t sub_24FC301C0()
{
  return sub_24FC0EAE8();
}

uint64_t sub_24FC301E0()
{
  return sub_24FC0F594();
}

uint64_t sub_24FC30200()
{
  return swift_task_alloc();
}

uint64_t sub_24FC3021C()
{
  return swift_task_alloc();
}

uint64_t sub_24FC30238()
{
  return swift_getAssociatedTypeWitness();
}

uint64_t sub_24FC30254(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v8[24] = a7;
  v8[25] = v7;
  v8[22] = a5;
  v8[23] = a6;
  v8[20] = a3;
  v8[21] = a4;
  v8[18] = a1;
  v8[19] = a2;
  return sub_24FC4F708();
}

uint64_t sub_24FC30280(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  return MEMORY[0x270F583C0](a1, v14, v16, v13, v15, a12, v12);
}

uint64_t sub_24FC302AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  return GenerativeConfigurationProtocol.with<A>(model:)(a10, v10, v11);
}

uint64_t sub_24FC302D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[22] = a5;
  v6[23] = v5;
  v6[20] = a3;
  v6[21] = a4;
  v6[18] = a1;
  v6[19] = a2;
  return sub_24FC4F718();
}

uint64_t sub_24FC302FC()
{
  return GenerativeConfigurationProtocol.with<A>(model:)(v0, v2, v1);
}

uint64_t sub_24FC30324()
{
  return *(void *)(v0 + 16);
}

uint64_t sub_24FC30340()
{
  return *(void *)(v0 + 16);
}

uint64_t sub_24FC3035C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v7[7] = a6;
  v7[8] = v6;
  v7[5] = a4;
  v7[6] = a5;
  v7[3] = a2;
  v7[4] = a3;
  v7[2] = a1;
  return sub_24FC4FB08();
}

uint64_t sub_24FC30384()
{
  return v0;
}

uint64_t sub_24FC303A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return GenerativeConfigurationProtocol.with<A>(model:)(a9, v10, v9);
}

uint64_t sub_24FC303C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v7[10] = a6;
  v7[11] = v6;
  v7[8] = a3;
  v7[9] = a4;
  v7[6] = a1;
  v7[7] = a2;
  return sub_24FC4F708();
}

uint64_t sub_24FC303E8()
{
  return swift_dynamicCast();
}

uint64_t sub_24FC3040C()
{
  return swift_dynamicCast();
}

uint64_t sub_24FC30430(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[9] = a5;
  v6[10] = v5;
  v6[7] = a2;
  v6[8] = a3;
  v6[6] = a1;
  return sub_24FC4F708();
}

uint64_t sub_24FC3046C()
{
  _OWORD *v0 = 0u;
  v0[1] = 0u;
  v0[2] = 0u;
  return sub_24FC2CBB8((uint64_t)v0);
}

uint64_t sub_24FC30490()
{
  return v0 + 8;
}

uint64_t sub_24FC304A4()
{
  return v0;
}

uint64_t sub_24FC304B8(uint64_t a1)
{
  *(void *)(v1 + 272) = a1;
  return swift_task_alloc();
}

uint64_t sub_24FC304D0()
{
  return swift_task_dealloc();
}

uint64_t sub_24FC304FC(uint64_t a1)
{
  *(void *)(v1 + 232) = a1;
  return swift_task_alloc();
}

uint64_t sub_24FC30514()
{
  return v0 + 8;
}

uint64_t sub_24FC30528()
{
  return v0;
}

uint64_t sub_24FC3053C()
{
  uint64_t v3 = *(void *)(v1 + 48);
  return _s19GenerativeFunctions24JsonObjectFieldContainerOwst_0(v0, 1, 1, v3);
}

uint64_t sub_24FC3055C()
{
  return swift_task_dealloc();
}

uint64_t sub_24FC30574()
{
  return *(void *)(v0 + 120);
}

uint64_t sub_24FC30588()
{
  return swift_task_dealloc();
}

uint64_t sub_24FC305A8()
{
  return swift_task_dealloc();
}

uint64_t sub_24FC305C8(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v8[8] = a7;
  v8[9] = v7;
  v8[6] = a5;
  v8[7] = a6;
  v8[4] = a3;
  v8[5] = a4;
  v8[2] = result;
  v8[3] = a2;
  return result;
}

uint64_t sub_24FC305DC()
{
  return v0;
}

uint64_t CompletionPrompt.overestimatedTokenCount<A>(with:)()
{
  return sub_24FC4F638();
}

uint64_t CompletionPrompt.tokenCountOverestimated<A>(with:)()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  sub_24FC4F6D8();
  sub_24FC12B5C(&qword_26B1FD7B0, MEMORY[0x263F61F60]);
  *uint64_t v1 = v0;
  v1[1] = sub_24FC12968;
  uint64_t v2 = sub_24FC12BA8();
  return MEMORY[0x270F2F3F8](v2);
}

uint64_t ChatMessagesPrompt.overestimatedTokenCount<A>(with:)()
{
  return sub_24FC4F618();
}

uint64_t ChatMessagesPrompt.tokenCountOverestimated<A>(with:)()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  sub_24FC4F708();
  sub_24FC12B5C(qword_269A5C9B8, MEMORY[0x263F61FA8]);
  *uint64_t v1 = v0;
  v1[1] = sub_24FC12BA4;
  uint64_t v2 = sub_24FC12BA8();
  return MEMORY[0x270F2F3E8](v2);
}

uint64_t sub_24FC308C0()
{
  return v0;
}

uint64_t sub_24FC308E0()
{
  return 0;
}

uint64_t sub_24FC308F8()
{
  uint64_t v0 = sub_24FC4F728();
  sub_24FC2C244(v0, qword_269A5CF48);
  sub_24FC20B5C(v0, (uint64_t)qword_269A5CF48);
  return sub_24FC4F738();
}

uint64_t CompletionPromptRunConfig.Typed.prompt.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_24FC3509C(MEMORY[0x263F61F60], a1);
}

uint64_t CompletionPromptRunConfig.Typed.completionParameters.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_24FC34088(a1, a2);
}

uint64_t CompletionPromptRunConfig.Typed.run(returning:)()
{
  sub_24FC12030();
  sub_24FC391F4(v1);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v0[8] = AssociatedTypeWitness;
  sub_24FC12018(AssociatedTypeWitness);
  v0[9] = v3;
  v0[10] = sub_24FC12200();
  sub_24FC12064();
  return MEMORY[0x270FA2498](v4, v5, v6);
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;

  sub_24FC12240();
  v0[21] = sub_24FC3928C(v1, v2, v3);
  sub_24FC12094();
  v0[22] = v4;
  uint64_t v5 = sub_24FC12200();
  sub_24FC38FD4(v5);
  uint64_t v6 = sub_24FC12B5C(&qword_26B1FD7B0, MEMORY[0x263F61F60]);
  uint64_t v7 = sub_24FC38BA4(v6);
  v0[26] = v7;
  sub_24FC12018(v7);
  v0[27] = v8;
  uint64_t v9 = sub_24FC30200();
  uint64_t v10 = sub_24FC3920C(v9);
  sub_24FC38FB4(v10);
  uint64_t v11 = sub_24FC393B0();
  v0[31] = v11;
  sub_24FC12018(v11);
  v0[32] = v12;
  v0[33] = sub_24FC12200();
  sub_24FC12064();
  return MEMORY[0x270FA2498](v13, v14, v15);
}

uint64_t sub_24FC30A28()
{
  sub_24FC12030();
  sub_24FC30C84();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)sub_24FC121F0(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_24FC30ABC;
  return CompletionPromptRunConfig.Typed.run(returning:)();
}

uint64_t sub_24FC30ABC()
{
  sub_24FC12030();
  sub_24FC0BAB0();
  sub_24FC1204C();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  sub_24FC1203C();
  *uint64_t v5 = v4;
  *(void *)(v6 + 96) = v0;
  swift_task_dealloc();
  sub_24FC12064();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_24FC30B98()
{
  sub_24FC12240();
  sub_24FC39330();
  swift_getAssociatedConformanceWitness();
  sub_24FC1276C();
  uint64_t v0 = sub_24FC122D0();
  v1(v0);
  swift_task_dealloc();
  uint64_t v2 = sub_24FC122A0();
  return v3(v2);
}

uint64_t sub_24FC30C24()
{
  sub_24FC12030();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24FC30C84()
{
  return swift_getAssociatedTypeWitness();
}

#error "24FC30E38: call analysis failed (funcsize=85)"

uint64_t sub_24FC30F4C()
{
  sub_24FC12240();
  sub_24FC0BAB0();
  sub_24FC1204C();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  sub_24FC1203C();
  *uint64_t v5 = v4;
  *(void *)(v6 + 280) = v0;
  swift_task_dealloc();
  uint64_t v7 = sub_24FC122D0();
  v8(v7);
  sub_24FC12064();
  return MEMORY[0x270FA2498](v9, v10, v11);
}

uint64_t sub_24FC31074()
{
  sub_24FC12258();
  sub_24FC0BAB0();
  uint64_t v3 = v2;
  sub_24FC1204C();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  sub_24FC1203C();
  *uint64_t v6 = v5;
  *(void *)(v3 + 296) = v0;
  swift_task_dealloc();
  uint64_t v7 = sub_24FC2FE88();
  v8(v7);
  if (!v0)
  {
    sub_24FC38F98();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    sub_24FC12110();
    sub_24FC2BEE8();
    __asm { BRAA            X1, X16 }
  }
  sub_24FC12064();
  sub_24FC2BEE8();
  return MEMORY[0x270FA2498](v9, v10, v11);
}

uint64_t CompletionPromptRunConfig.Typed.run<A>(returning:)()
{
  sub_24FC12030();
  sub_24FC38F78(v1, v2, v3, v4, v5);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v0[11] = AssociatedTypeWitness;
  sub_24FC12018(AssociatedTypeWitness);
  v0[12] = v7;
  v0[13] = sub_24FC12200();
  sub_24FC12064();
  return MEMORY[0x270FA2498](v8, v9, v10);
}

uint64_t sub_24FC31278()
{
  sub_24FC12030();
  sub_24FC30C84();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 112) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_24FC3130C;
  sub_24FC393D4();
  return CompletionPromptRunConfig.Typed.run(returning:)();
}

uint64_t sub_24FC3130C()
{
  sub_24FC12030();
  sub_24FC0BAB0();
  sub_24FC1204C();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  sub_24FC1203C();
  *uint64_t v5 = v4;
  *(void *)(v6 + 120) = v0;
  swift_task_dealloc();
  sub_24FC12064();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_24FC313E8()
{
  sub_24FC12258();
  sub_24FC39100();
  swift_getAssociatedConformanceWitness();
  sub_24FC1276C();
  uint64_t v1 = sub_24FC122D0();
  uint64_t v3 = v2(v1);
  sub_24FC12824(v3, v4, v5, v6, v7, v8, v9, v10, v15, v16);
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v0 + 128) = v11;
  *uint64_t v11 = v0;
  v11[1] = sub_24FC0C600;
  uint64_t v12 = sub_24FC39098();
  return v13(v12);
}

uint64_t CompletionPromptRunConfig.TypedStreamable.prompt.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_24FC3509C(MEMORY[0x263F61F60], a1);
}

uint64_t CompletionPromptRunConfig.TypedStreamable.completionParameters.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_24FC34088(a1, a2);
}

uint64_t CompletionPromptRunConfig.TypedStreamable.run(returning:)()
{
  sub_24FC12030();
  sub_24FC39138(v1, v2, v3);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v0[7] = AssociatedTypeWitness;
  sub_24FC12018(AssociatedTypeWitness);
  v0[8] = v5;
  v0[9] = sub_24FC12200();
  sub_24FC12064();
  return MEMORY[0x270FA2498](v6, v7, v8);
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;

  sub_24FC12240();
  v0[21] = sub_24FC3928C(v1, v2, v3);
  sub_24FC12094();
  v0[22] = v4;
  uint64_t v5 = sub_24FC12200();
  sub_24FC38FD4(v5);
  uint64_t v6 = sub_24FC12B5C(&qword_26B1FD7B0, MEMORY[0x263F61F60]);
  uint64_t v7 = sub_24FC38BA4(v6);
  v0[26] = v7;
  sub_24FC12018(v7);
  v0[27] = v8;
  uint64_t v9 = sub_24FC30200();
  uint64_t v10 = sub_24FC3920C(v9);
  sub_24FC38FB4(v10);
  uint64_t v11 = sub_24FC393B0();
  v0[31] = v11;
  sub_24FC12018(v11);
  v0[32] = v12;
  v0[33] = sub_24FC12200();
  sub_24FC12064();
  return MEMORY[0x270FA2498](v13, v14, v15);
}

uint64_t sub_24FC315BC()
{
  sub_24FC12030();
  sub_24FC317C8();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 80) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_24FC31658;
  return CompletionPromptRunConfig.TypedStreamable.run(returning:)();
}

uint64_t sub_24FC31658()
{
  sub_24FC12030();
  sub_24FC0BAB0();
  sub_24FC1204C();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  sub_24FC1203C();
  *uint64_t v5 = v4;
  *(void *)(v6 + 88) = v0;
  swift_task_dealloc();
  sub_24FC12064();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_24FC31734()
{
  sub_24FC12240();
  sub_24FC39358();
  swift_getAssociatedConformanceWitness();
  sub_24FC4F5D8();
  uint64_t v0 = sub_24FC122B8();
  v1(v0);
  swift_task_dealloc();
  sub_24FC12110();
  return v2();
}

uint64_t sub_24FC317C8()
{
  return swift_getAssociatedTypeWitness();
}

#error "24FC3197C: call analysis failed (funcsize=85)"

uint64_t sub_24FC31A90()
{
  sub_24FC12240();
  sub_24FC0BAB0();
  sub_24FC1204C();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  sub_24FC1203C();
  *uint64_t v5 = v4;
  *(void *)(v6 + 280) = v0;
  swift_task_dealloc();
  uint64_t v7 = sub_24FC122D0();
  v8(v7);
  sub_24FC12064();
  return MEMORY[0x270FA2498](v9, v10, v11);
}

uint64_t sub_24FC31BB8()
{
  sub_24FC12240();
  _s19GenerativeFunctions26TokenStreamProcessorCloserVwxx_0(v0 + 16);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_24FC12110();
  return v1();
}

uint64_t sub_24FC31C40()
{
  sub_24FC12258();
  sub_24FC0BAB0();
  uint64_t v3 = v2;
  sub_24FC1204C();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  sub_24FC1203C();
  *uint64_t v6 = v5;
  *(void *)(v3 + 296) = v0;
  swift_task_dealloc();
  uint64_t v7 = sub_24FC2FE88();
  v8(v7);
  if (!v0)
  {
    sub_24FC38F98();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    sub_24FC12110();
    sub_24FC2BEE8();
    __asm { BRAA            X1, X16 }
  }
  sub_24FC12064();
  sub_24FC2BEE8();
  return MEMORY[0x270FA2498](v9, v10, v11);
}

uint64_t sub_24FC31DA8()
{
  sub_24FC12240();
  _s19GenerativeFunctions26TokenStreamProcessorCloserVwxx_0(v0 + 16);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_24FC0BAC8();
  return v1();
}

uint64_t sub_24FC31E34()
{
  sub_24FC12240();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_24FC0BAC8();
  return v0();
}

uint64_t CompletionPromptRunConfig.Untyped.prompt.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_24FC3509C(MEMORY[0x263F61F60], a1);
}

uint64_t CompletionPromptRunConfig.Untyped.run(returning:)(uint64_t a1)
{
  *(void *)(v2 + 72) = a1;
  *(void *)(v2 + 80) = v1;
  return sub_24FC12058((uint64_t)sub_24FC31EEC);
}

uint64_t sub_24FC31EEC()
{
  sub_24FC12030();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)sub_24FC121F0(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_24FC31F7C;
  return CompletionPromptRunConfig.Untyped.run(returning:)();
}

uint64_t sub_24FC31F7C()
{
  sub_24FC12030();
  sub_24FC0BAB0();
  sub_24FC1204C();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  sub_24FC1203C();
  *uint64_t v5 = v4;
  *(void *)(v6 + 96) = v0;
  swift_task_dealloc();
  sub_24FC12064();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_24FC32058()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t CompletionPromptRunConfig.Untyped.run(returning:)()
{
  sub_24FC12030();
  uint64_t v4 = sub_24FC392E0(v2, v3);
  v1[22] = v4;
  sub_24FC12018(v4);
  v1[23] = v5;
  v1[24] = sub_24FC12200();
  uint64_t v6 = sub_24FC13C3C(&qword_269A5CF98);
  sub_24FC38FC4(v6);
  uint64_t v7 = sub_24FC30200();
  v1[27] = sub_24FC39224(v7);
  v1[28] = *(void *)(v0 + 16);
  sub_24FC12094();
  v1[29] = v8;
  v1[30] = sub_24FC12200();
  sub_24FC12064();
  return MEMORY[0x270FA2498](v9, v10, v11);
}

#error "24FC321E8: call analysis failed (funcsize=159)"

uint64_t sub_24FC323D8()
{
  sub_24FC12030();
  sub_24FC0BAB0();
  sub_24FC1204C();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  sub_24FC1203C();
  *uint64_t v5 = v4;
  *(void *)(v6 + 256) = v0;
  swift_task_dealloc();
  sub_24FC12064();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_24FC324B4()
{
  sub_24FC12240();
  uint64_t v1 = sub_24FC39324();
  sub_24FC35880(v1, &qword_269A5CF98);
  _s19GenerativeFunctions26TokenStreamProcessorCloserVwxx_0(v0);
  sub_24FC38C80();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_24FC12110();
  return v2();
}

uint64_t sub_24FC32540()
{
  sub_24FC12240();
  sub_24FC39010();
  sub_24FC35880(v0, &qword_269A5CF98);
  _s19GenerativeFunctions26TokenStreamProcessorCloserVwxx_0(v1);
  sub_24FC38C64();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_24FC0BAC8();
  return v2();
}

uint64_t sub_24FC325D4()
{
  sub_24FC12030();
  sub_24FC0BAB0();
  sub_24FC1204C();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  sub_24FC1203C();
  *uint64_t v5 = v4;
  *(void *)(v6 + 272) = v0;
  swift_task_dealloc();
  sub_24FC12064();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_24FC326B0()
{
  sub_24FC12240();
  sub_24FC35880(*(void *)(v0 + 208), &qword_269A5CF98);
  sub_24FC38C80();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_24FC12110();
  return v1();
}

uint64_t sub_24FC32734()
{
  sub_24FC12240();
  sub_24FC39254();
  sub_24FC35880(v0, &qword_269A5CF98);
  sub_24FC38C64();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_24FC0BAC8();
  return v1();
}

uint64_t CompletionPromptRunConfig.UntypedStreamable.prompt.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_24FC3509C(MEMORY[0x263F61F60], a1);
}

uint64_t CompletionPromptRunConfig.UntypedStreamable.model.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_24FC362F4(v2 + *(int *)(a1 + 28), a2);
}

uint64_t CompletionPromptRunConfig.UntypedStreamable.run(returning:)()
{
  sub_24FC12030();
  uint64_t v4 = sub_24FC392E0(v2, v3);
  v1[22] = v4;
  sub_24FC12018(v4);
  v1[23] = v5;
  v1[24] = sub_24FC12200();
  uint64_t v6 = sub_24FC13C3C(&qword_269A5CFA8);
  sub_24FC38FC4(v6);
  uint64_t v7 = sub_24FC30200();
  v1[27] = sub_24FC39224(v7);
  v1[28] = *(void *)(v0 + 16);
  sub_24FC12094();
  v1[29] = v8;
  v1[30] = sub_24FC12200();
  sub_24FC12064();
  return MEMORY[0x270FA2498](v9, v10, v11);
}

#error "24FC32978: call analysis failed (funcsize=159)"

uint64_t sub_24FC32B68()
{
  sub_24FC12030();
  sub_24FC0BAB0();
  sub_24FC1204C();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  sub_24FC1203C();
  *uint64_t v5 = v4;
  *(void *)(v6 + 256) = v0;
  swift_task_dealloc();
  sub_24FC12064();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_24FC32C44()
{
  sub_24FC12240();
  uint64_t v1 = sub_24FC39324();
  sub_24FC35880(v1, &qword_269A5CFA8);
  _s19GenerativeFunctions26TokenStreamProcessorCloserVwxx_0(v0);
  sub_24FC38C80();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_24FC12110();
  return v2();
}

uint64_t sub_24FC32CD0()
{
  sub_24FC12240();
  sub_24FC39010();
  sub_24FC35880(v0, &qword_269A5CFA8);
  _s19GenerativeFunctions26TokenStreamProcessorCloserVwxx_0(v1);
  sub_24FC38C64();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_24FC0BAC8();
  return v2();
}

uint64_t sub_24FC32D64()
{
  sub_24FC12030();
  sub_24FC0BAB0();
  sub_24FC1204C();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  sub_24FC1203C();
  *uint64_t v5 = v4;
  *(void *)(v6 + 272) = v0;
  swift_task_dealloc();
  sub_24FC12064();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_24FC32E40()
{
  sub_24FC12240();
  sub_24FC35880(*(void *)(v0 + 208), &qword_269A5CFA8);
  sub_24FC38C80();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_24FC12110();
  return v1();
}

uint64_t sub_24FC32EC4()
{
  sub_24FC12240();
  sub_24FC39254();
  sub_24FC35880(v0, &qword_269A5CFA8);
  sub_24FC38C64();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_24FC0BAC8();
  return v1();
}

void CompletionPrompt.with<A>(model:completionParameters:modelType:)()
{
}

{
  sub_24FC33038();
}

{
  sub_24FC33468();
}

{
  sub_24FC33468();
}

uint64_t CompletionPrompt.withModel<A>(modelType:model:completionParameters:)@<X0>(uint64_t (*a1)(uint64_t)@<X1>, void (*a2)(uint64_t)@<X3>, uint64_t a3@<X4>, uint64_t a4@<X5>, uint64_t a5@<X8>)
{
  return sub_24FC35C08(a1, a2, a3, a4, a5, MEMORY[0x263F409D8], (void (*)(char *, char *))CompletionPrompt.with<A>(model:completionParameters:modelType:));
}

{
  return sub_24FC35C08(a1, a2, a3, a4, a5, MEMORY[0x263F40E68], (void (*)(char *, char *))CompletionPrompt.with<A>(model:completionParameters:modelType:));
}

void CompletionPrompt.with<A, B>(model:modelType:)()
{
}

{
  sub_24FC331C8();
}

uint64_t CompletionPrompt.withModel<A, B>(modelType:model:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return sub_24FC35F1C(a1, a2, a3, a4, a5, a6, (void (*)(uint64_t))CompletionPrompt.with<A, B>(model:modelType:));
}

{
  return sub_24FC35F1C(a1, a2, a3, a4, a5, a6, (void (*)(uint64_t))CompletionPrompt.with<A, B>(model:modelType:));
}

void sub_24FC33038()
{
  sub_24FC38D9C();
  sub_24FC38D5C(v1, v2, v3, v4);
  sub_24FC12094();
  sub_24FC38F24();
  MEMORY[0x270FA5388](v5);
  sub_24FC12094();
  MEMORY[0x270FA5388](v6);
  sub_24FC15970();
  sub_24FC4F6D8();
  sub_24FC12094();
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = sub_24FC38EDC(v8, v23);
  v10(v9);
  uint64_t v11 = sub_24FC39170();
  v12(v11);
  uint64_t v13 = sub_24FC39154();
  uint64_t v15 = v14(v13);
  sub_24FC3902C(v15, v16, v17, v18, v19, MEMORY[0x263F61F60], v20, v21, v0, v22, v24, v25);
  sub_24FC3936C();
  sub_24FC38DB4();
}

void sub_24FC331C8()
{
  sub_24FC38D9C();
  sub_24FC38E2C(v2, v3, v4, v5, v6, v7, v8);
  sub_24FC38F24();
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)v27 - v10;
  sub_24FC12094();
  MEMORY[0x270FA5388](v12);
  sub_24FC3918C();
  sub_24FC4F6D8();
  sub_24FC12094();
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = sub_24FC38EB0(v14, v27[0]);
  v16(v15);
  uint64_t v17 = sub_24FC390C8();
  v18(v17);
  uint64_t v19 = _s19GenerativeFunctions24JsonObjectFieldContainerOwst_0((uint64_t)v11, 1, 1, v1);
  sub_24FC38F4C(v19, v20, v21, v22, v23, MEMORY[0x263F61F60], v24, v25, v0, v26, v27[0], v27[1]);
  sub_24FC3936C();
  sub_24FC38DB4();
}

void *CompletionPrompt.withModel<A>(modelType:model:completionParameters:)(uint64_t a1, uint64_t a2, void (*a3)(void *), uint64_t a4, uint64_t a5)
{
  return sub_24FC36184(a1, a2, a3, a4, a5, (void (*)(void *, char *, uint64_t))CompletionPrompt.with<A>(model:completionParameters:modelType:));
}

{
  return sub_24FC36184(a1, a2, a3, a4, a5, (void (*)(void *, char *, uint64_t))CompletionPrompt.with<A>(model:completionParameters:modelType:));
}

void CompletionPrompt.with<A>(model:modelType:)()
{
}

{
  sub_24FC33624();
}

void *CompletionPrompt.withModel<A>(modelType:model:)(void *(*a1)(void *__return_ptr), uint64_t a2, uint64_t a3)
{
  return sub_24FC36380(a1, a2, a3, (void (*)(void *, uint64_t))CompletionPrompt.with<A>(model:modelType:));
}

{
  return sub_24FC36380(a1, a2, a3, (void (*)(void *, uint64_t))CompletionPrompt.with<A>(model:modelType:));
}

void sub_24FC33468()
{
  sub_24FC38D9C();
  uint64_t v24 = v2;
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v7 = v0;
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  uint64_t v13 = v12;
  sub_24FC12094();
  uint64_t v15 = v14;
  MEMORY[0x270FA5388](v16);
  sub_24FC391DC();
  uint64_t v17 = sub_24FC393C8();
  v18(v17);
  sub_24FC12094();
  sub_24FC38F24();
  MEMORY[0x270FA5388](v19);
  uint64_t v21 = (char *)&v25[-1] - v20;
  (*(void (**)(char *, uint64_t))(v22 + 16))((char *)&v25[-1] - v20, v7);
  sub_24FC362F4(v13, (uint64_t)v25);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 16))(v1, v11, v9);
  sub_24FC358D4((uint64_t)v21, (uint64_t)v25, v1, v9, v6, v4, v24, v23, v24, v25[0]);
  sub_24FC38DB4();
}

void sub_24FC33624()
{
  sub_24FC38D9C();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  uint64_t v13 = sub_24FC4FB08();
  sub_24FC12084();
  sub_24FC38F24();
  MEMORY[0x270FA5388](v14);
  uint64_t v16 = (char *)&v24[-1] - v15;
  uint64_t v17 = sub_24FC393C8();
  v8(v17);
  sub_24FC12094();
  sub_24FC38F24();
  MEMORY[0x270FA5388](v18);
  uint64_t v20 = (char *)&v24[-1] - v19;
  (*(void (**)(char *, uint64_t))(v21 + 16))((char *)&v24[-1] - v19, v0);
  sub_24FC362F4(v12, (uint64_t)v24);
  _s19GenerativeFunctions24JsonObjectFieldContainerOwst_0((uint64_t)v16, 1, 1, v10);
  sub_24FC358D4((uint64_t)v20, (uint64_t)v24, (uint64_t)v16, v13, v6, v4, v2, v22, v23, v24[0]);
  sub_24FC38DB4();
}

uint64_t ChatMessagesPromptRunConfig.Typed.prompt.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_24FC3509C(MEMORY[0x263F61FA8], a1);
}

uint64_t ChatMessagesPromptRunConfig.Typed.chatParameters.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_24FC34088(a1, a2);
}

uint64_t ChatMessagesPromptRunConfig.Typed.run(returning:)()
{
  sub_24FC12030();
  sub_24FC391F4(v1);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v0[8] = AssociatedTypeWitness;
  sub_24FC12018(AssociatedTypeWitness);
  v0[9] = v3;
  v0[10] = sub_24FC12200();
  sub_24FC12064();
  return MEMORY[0x270FA2498](v4, v5, v6);
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;

  sub_24FC12240();
  v0[21] = sub_24FC3926C(v1, v2, v3);
  sub_24FC12094();
  v0[22] = v4;
  uint64_t v5 = sub_24FC12200();
  sub_24FC38FD4(v5);
  uint64_t v6 = sub_24FC12B5C(qword_269A5C9B8, MEMORY[0x263F61FA8]);
  uint64_t v7 = sub_24FC38BA4(v6);
  v0[26] = v7;
  sub_24FC12018(v7);
  v0[27] = v8;
  uint64_t v9 = sub_24FC30200();
  uint64_t v10 = sub_24FC3920C(v9);
  sub_24FC38FB4(v10);
  uint64_t v11 = sub_24FC393B0();
  v0[31] = v11;
  sub_24FC12018(v11);
  v0[32] = v12;
  v0[33] = sub_24FC12200();
  sub_24FC12064();
  return MEMORY[0x270FA2498](v13, v14, v15);
}

uint64_t sub_24FC33854()
{
  sub_24FC12030();
  sub_24FC33A50();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)sub_24FC121F0(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_24FC338E8;
  return ChatMessagesPromptRunConfig.Typed.run(returning:)();
}

uint64_t sub_24FC338E8()
{
  sub_24FC12030();
  sub_24FC0BAB0();
  sub_24FC1204C();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  sub_24FC1203C();
  *uint64_t v5 = v4;
  *(void *)(v6 + 96) = v0;
  swift_task_dealloc();
  sub_24FC12064();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_24FC339C4()
{
  sub_24FC12240();
  sub_24FC39330();
  swift_getAssociatedConformanceWitness();
  sub_24FC1278C();
  uint64_t v0 = sub_24FC122D0();
  v1(v0);
  swift_task_dealloc();
  uint64_t v2 = sub_24FC122A0();
  return v3(v2);
}

uint64_t sub_24FC33A50()
{
  return swift_getAssociatedTypeWitness();
}

#error "24FC33C04: call analysis failed (funcsize=85)"

uint64_t ChatMessagesPromptRunConfig.Typed.run<A>(returning:)()
{
  sub_24FC12030();
  sub_24FC38F78(v1, v2, v3, v4, v5);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v0[11] = AssociatedTypeWitness;
  sub_24FC12018(AssociatedTypeWitness);
  v0[12] = v7;
  v0[13] = sub_24FC12200();
  sub_24FC12064();
  return MEMORY[0x270FA2498](v8, v9, v10);
}

uint64_t sub_24FC33DB4()
{
  sub_24FC12030();
  sub_24FC33A50();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 112) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_24FC33E48;
  sub_24FC393D4();
  return ChatMessagesPromptRunConfig.Typed.run(returning:)();
}

uint64_t sub_24FC33E48()
{
  sub_24FC12030();
  sub_24FC0BAB0();
  sub_24FC1204C();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  sub_24FC1203C();
  *uint64_t v5 = v4;
  *(void *)(v6 + 120) = v0;
  swift_task_dealloc();
  sub_24FC12064();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_24FC33F24()
{
  sub_24FC12258();
  sub_24FC39100();
  swift_getAssociatedConformanceWitness();
  sub_24FC1278C();
  uint64_t v1 = sub_24FC122D0();
  uint64_t v3 = v2(v1);
  sub_24FC12824(v3, v4, v5, v6, v7, v8, v9, v10, v15, v16);
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v0 + 128) = v11;
  *uint64_t v11 = v0;
  v11[1] = sub_24FC11FF8;
  uint64_t v12 = sub_24FC39098();
  return v13(v12);
}

uint64_t ChatMessagesPromptRunConfig.TypedStreamable.prompt.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_24FC3509C(MEMORY[0x263F61FA8], a1);
}

uint64_t _s19GenerativeFunctions25CompletionPromptRunConfigO5TypedV5modelxvg_0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_24FC1245C(*(uint64_t (**)(uint64_t))(*(void *)(*(void *)(a1 + 16) - 8) + 16), a2);
}

uint64_t ChatMessagesPromptRunConfig.TypedStreamable.chatParameters.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_24FC34088(a1, a2);
}

uint64_t sub_24FC34088@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1 + 40);
  swift_getAssociatedTypeWitness();
  sub_24FC12084();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
  return v7(a2, v4, v5);
}

uint64_t ChatMessagesPromptRunConfig.TypedStreamable.run(returning:)()
{
  sub_24FC12030();
  sub_24FC39138(v1, v2, v3);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v0[7] = AssociatedTypeWitness;
  sub_24FC12018(AssociatedTypeWitness);
  v0[8] = v5;
  v0[9] = sub_24FC12200();
  sub_24FC12064();
  return MEMORY[0x270FA2498](v6, v7, v8);
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;

  sub_24FC12240();
  v0[21] = sub_24FC3926C(v1, v2, v3);
  sub_24FC12094();
  v0[22] = v4;
  uint64_t v5 = sub_24FC12200();
  sub_24FC38FD4(v5);
  uint64_t v6 = sub_24FC12B5C(qword_269A5C9B8, MEMORY[0x263F61FA8]);
  uint64_t v7 = sub_24FC38BA4(v6);
  v0[26] = v7;
  sub_24FC12018(v7);
  v0[27] = v8;
  uint64_t v9 = sub_24FC30200();
  uint64_t v10 = sub_24FC3920C(v9);
  sub_24FC38FB4(v10);
  uint64_t v11 = sub_24FC393B0();
  v0[31] = v11;
  sub_24FC12018(v11);
  v0[32] = v12;
  v0[33] = sub_24FC12200();
  sub_24FC12064();
  return MEMORY[0x270FA2498](v13, v14, v15);
}

uint64_t sub_24FC34198()
{
  sub_24FC12030();
  sub_24FC343A4();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 80) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_24FC34234;
  return ChatMessagesPromptRunConfig.TypedStreamable.run(returning:)();
}

uint64_t sub_24FC34234()
{
  sub_24FC12030();
  sub_24FC0BAB0();
  sub_24FC1204C();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  sub_24FC1203C();
  *uint64_t v5 = v4;
  *(void *)(v6 + 88) = v0;
  swift_task_dealloc();
  sub_24FC12064();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_24FC34310()
{
  sub_24FC12240();
  sub_24FC39358();
  swift_getAssociatedConformanceWitness();
  sub_24FC4F568();
  uint64_t v0 = sub_24FC122B8();
  v1(v0);
  swift_task_dealloc();
  sub_24FC12110();
  return v2();
}

uint64_t sub_24FC343A4()
{
  return swift_getAssociatedTypeWitness();
}

#error "24FC34558: call analysis failed (funcsize=85)"

uint64_t sub_24FC3466C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  sub_24FC38D9C();
  uint64_t v13 = v12;
  uint64_t v15 = v14;
  uint64_t v17 = v16;
  uint64_t v19 = v18;
  uint64_t v21 = v20;
  uint64_t v22 = sub_24FC38C58();
  v23(v22);
  sub_24FC12084();
  (*(void (**)(uint64_t, uint64_t))(v24 + 32))(v21, v19);
  v13(0, v17, v15);
  sub_24FC38810();
  (*(void (**)(void))(v25 + 32))();
  swift_getAssociatedTypeWitness();
  sub_24FC12084();
  sub_24FC38DB4();
  return v29(v26, v27, v28, v29, v30, v31, v32, v33, a9, a10, a11, a12);
}

uint64_t ChatMessagesPromptRunConfig.Untyped.prompt.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_24FC3509C(MEMORY[0x263F61FA8], a1);
}

uint64_t ChatMessagesPromptRunConfig.Untyped.run(returning:)(uint64_t a1)
{
  *(void *)(v2 + 72) = a1;
  *(void *)(v2 + 80) = v1;
  return sub_24FC12058((uint64_t)sub_24FC347C8);
}

uint64_t sub_24FC347C8()
{
  sub_24FC12030();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)sub_24FC121F0(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_24FC34858;
  return ChatMessagesPromptRunConfig.Untyped.run(returning:)();
}

uint64_t sub_24FC34858()
{
  sub_24FC12030();
  sub_24FC0BAB0();
  sub_24FC1204C();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  sub_24FC1203C();
  *uint64_t v5 = v4;
  *(void *)(v6 + 96) = v0;
  swift_task_dealloc();
  sub_24FC12064();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t ChatMessagesPromptRunConfig.Untyped.run(returning:)()
{
  sub_24FC12030();
  uint64_t v4 = sub_24FC392C0(v2, v3);
  v1[22] = v4;
  sub_24FC12018(v4);
  v1[23] = v5;
  v1[24] = sub_24FC12200();
  uint64_t v6 = sub_24FC13C3C(&qword_269A5CFE8);
  sub_24FC38FC4(v6);
  uint64_t v7 = sub_24FC30200();
  v1[27] = sub_24FC39224(v7);
  v1[28] = *(void *)(v0 + 16);
  sub_24FC12094();
  v1[29] = v8;
  v1[30] = sub_24FC12200();
  sub_24FC12064();
  return MEMORY[0x270FA2498](v9, v10, v11);
}

#error "24FC34AAC: call analysis failed (funcsize=159)"

uint64_t sub_24FC34C9C()
{
  sub_24FC12030();
  sub_24FC0BAB0();
  sub_24FC1204C();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  sub_24FC1203C();
  *uint64_t v5 = v4;
  *(void *)(v6 + 256) = v0;
  swift_task_dealloc();
  sub_24FC12064();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_24FC34D78()
{
  sub_24FC12240();
  uint64_t v1 = sub_24FC39324();
  sub_24FC35880(v1, &qword_269A5CFE8);
  _s19GenerativeFunctions26TokenStreamProcessorCloserVwxx_0(v0);
  sub_24FC38C80();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_24FC12110();
  return v2();
}

uint64_t sub_24FC34E04()
{
  sub_24FC12240();
  sub_24FC39010();
  sub_24FC35880(v0, &qword_269A5CFE8);
  _s19GenerativeFunctions26TokenStreamProcessorCloserVwxx_0(v1);
  sub_24FC38C64();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_24FC0BAC8();
  return v2();
}

uint64_t sub_24FC34E98()
{
  sub_24FC12030();
  sub_24FC0BAB0();
  sub_24FC1204C();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  sub_24FC1203C();
  *uint64_t v5 = v4;
  *(void *)(v6 + 272) = v0;
  swift_task_dealloc();
  sub_24FC12064();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_24FC34F74()
{
  sub_24FC12240();
  sub_24FC35880(*(void *)(v0 + 208), &qword_269A5CFE8);
  sub_24FC38C80();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_24FC12110();
  return v1();
}

uint64_t sub_24FC34FF8()
{
  sub_24FC12240();
  sub_24FC39254();
  sub_24FC35880(v0, &qword_269A5CFE8);
  sub_24FC38C64();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_24FC0BAC8();
  return v1();
}

uint64_t ChatMessagesPromptRunConfig.UntypedStreamable.prompt.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_24FC3509C(MEMORY[0x263F61FA8], a1);
}

uint64_t sub_24FC3509C@<X0>(void (*a1)(void)@<X1>, uint64_t a2@<X8>)
{
  a1(0);
  sub_24FC12084();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
  return v6(a2, v2, v4);
}

uint64_t _s19GenerativeFunctions25CompletionPromptRunConfigO7UntypedV20completionParametersxvg_0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_24FC1245C(*(uint64_t (**)(uint64_t))(*(void *)(*(void *)(a1 + 16) - 8) + 16), a2);
}

uint64_t ChatMessagesPromptRunConfig.UntypedStreamable.run(returning:)()
{
  sub_24FC12030();
  uint64_t v4 = sub_24FC392C0(v2, v3);
  v1[22] = v4;
  sub_24FC12018(v4);
  v1[23] = v5;
  v1[24] = sub_24FC12200();
  uint64_t v6 = sub_24FC13C3C(&qword_269A5CFF8);
  sub_24FC38FC4(v6);
  uint64_t v7 = sub_24FC30200();
  v1[27] = sub_24FC39224(v7);
  v1[28] = *(void *)(v0 + 16);
  sub_24FC12094();
  v1[29] = v8;
  v1[30] = sub_24FC12200();
  sub_24FC12064();
  return MEMORY[0x270FA2498](v9, v10, v11);
}

#error "24FC352A8: call analysis failed (funcsize=159)"

uint64_t sub_24FC35498()
{
  sub_24FC12030();
  sub_24FC0BAB0();
  sub_24FC1204C();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  sub_24FC1203C();
  *uint64_t v5 = v4;
  *(void *)(v6 + 256) = v0;
  swift_task_dealloc();
  sub_24FC12064();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_24FC35574()
{
  sub_24FC12240();
  uint64_t v1 = sub_24FC39324();
  sub_24FC35880(v1, &qword_269A5CFF8);
  _s19GenerativeFunctions26TokenStreamProcessorCloserVwxx_0(v0);
  sub_24FC38C80();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_24FC12110();
  return v2();
}

uint64_t sub_24FC35600()
{
  sub_24FC12240();
  sub_24FC39010();
  sub_24FC35880(v0, &qword_269A5CFF8);
  _s19GenerativeFunctions26TokenStreamProcessorCloserVwxx_0(v1);
  sub_24FC38C64();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_24FC0BAC8();
  return v2();
}

uint64_t sub_24FC35694()
{
  sub_24FC12030();
  sub_24FC0BAB0();
  sub_24FC1204C();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  sub_24FC1203C();
  *uint64_t v5 = v4;
  *(void *)(v6 + 272) = v0;
  swift_task_dealloc();
  sub_24FC12064();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_24FC35770()
{
  sub_24FC12240();
  sub_24FC35880(*(void *)(v0 + 208), &qword_269A5CFF8);
  sub_24FC38C80();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_24FC12110();
  return v1();
}

uint64_t sub_24FC357F4()
{
  sub_24FC12240();
  sub_24FC39254();
  sub_24FC35880(v0, &qword_269A5CFF8);
  sub_24FC38C64();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_24FC0BAC8();
  return v1();
}

uint64_t sub_24FC35880(uint64_t a1, uint64_t *a2)
{
  sub_24FC13C3C(a2);
  sub_24FC12084();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t sub_24FC358D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  sub_24FC39378();
  uint64_t v11 = v10;
  uint64_t v13 = v12;
  uint64_t v15 = v14;
  uint64_t v17 = v16;
  uint64_t v19 = v18;
  uint64_t v21 = v20;
  uint64_t v22 = sub_24FC38C58();
  v23(v22);
  sub_24FC12084();
  (*(void (**)(uint64_t, uint64_t))(v24 + 32))(v21, v19);
  uint64_t v25 = v13(0, v15);
  v11(v17, v21 + *(int *)(v25 + 28));
  sub_24FC38810();
  sub_24FC39344();
  return v29(v26, v27, v28, v29, v30, v31, v32, v33, a9, a10);
}

void ChatMessagesPrompt.with<A>(model:chatParameters:modelType:)()
{
}

{
  sub_24FC35AA0();
}

{
  sub_24FC33468();
}

{
  sub_24FC33468();
}

uint64_t ChatMessagesPrompt.withModel<A>(modelType:model:chatParameters:)@<X0>(uint64_t (*a1)(uint64_t)@<X1>, void (*a2)(uint64_t)@<X3>, uint64_t a3@<X4>, uint64_t a4@<X5>, uint64_t a5@<X8>)
{
  return sub_24FC35C08(a1, a2, a3, a4, a5, MEMORY[0x263F409B0], (void (*)(char *, char *))ChatMessagesPrompt.with<A>(model:chatParameters:modelType:));
}

{
  return sub_24FC35C08(a1, a2, a3, a4, a5, MEMORY[0x263F409D0], (void (*)(char *, char *))ChatMessagesPrompt.with<A>(model:chatParameters:modelType:));
}

void ChatMessagesPrompt.with<A, B>(model:modelType:)()
{
}

{
  sub_24FC35DD0();
}

uint64_t ChatMessagesPrompt.withModel<A, B>(modelType:model:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return sub_24FC35F1C(a1, a2, a3, a4, a5, a6, (void (*)(uint64_t))ChatMessagesPrompt.with<A, B>(model:modelType:));
}

{
  return sub_24FC35F1C(a1, a2, a3, a4, a5, a6, (void (*)(uint64_t))ChatMessagesPrompt.with<A, B>(model:modelType:));
}

void sub_24FC35AA0()
{
  sub_24FC38D9C();
  sub_24FC38D5C(v1, v2, v3, v4);
  sub_24FC12094();
  sub_24FC38F24();
  MEMORY[0x270FA5388](v5);
  sub_24FC12094();
  MEMORY[0x270FA5388](v6);
  sub_24FC15970();
  sub_24FC4F708();
  sub_24FC12094();
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = sub_24FC38EDC(v8, v23);
  v10(v9);
  uint64_t v11 = sub_24FC39170();
  v12(v11);
  uint64_t v13 = sub_24FC39154();
  uint64_t v15 = v14(v13);
  sub_24FC3902C(v15, v16, v17, v18, v19, MEMORY[0x263F61FA8], v20, v21, v0, v22, v24, v25);
  sub_24FC3936C();
  sub_24FC38DB4();
}

uint64_t sub_24FC35C08@<X0>(uint64_t (*a1)(uint64_t)@<X1>, void (*a2)(uint64_t)@<X3>, uint64_t a3@<X4>, uint64_t a4@<X5>, uint64_t a5@<X8>, uint64_t a6, void (*a7)(char *, char *))
{
  uint64_t v26 = a5;
  uint64_t v27 = a3;
  uint64_t v28 = a2;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  sub_24FC12094();
  uint64_t v25 = v11;
  sub_24FC38F24();
  MEMORY[0x270FA5388](v12);
  uint64_t v14 = (char *)&v23 - v13;
  sub_24FC12094();
  uint64_t v16 = v15;
  uint64_t v18 = MEMORY[0x270FA5388](v17);
  uint64_t v20 = (char *)&v23 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = a1(v18);
  if (!v7)
  {
    uint64_t v24 = AssociatedTypeWitness;
    uint64_t v22 = v25;
    v28(result);
    a7(v20, v14);
    (*(void (**)(char *, uint64_t))(v22 + 8))(v14, v24);
    return (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v20, a4);
  }
  return result;
}

void sub_24FC35DD0()
{
  sub_24FC38D9C();
  sub_24FC38E2C(v2, v3, v4, v5, v6, v7, v8);
  sub_24FC38F24();
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)v27 - v10;
  sub_24FC12094();
  MEMORY[0x270FA5388](v12);
  sub_24FC3918C();
  sub_24FC4F708();
  sub_24FC12094();
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = sub_24FC38EB0(v14, v27[0]);
  v16(v15);
  uint64_t v17 = sub_24FC390C8();
  v18(v17);
  uint64_t v19 = _s19GenerativeFunctions24JsonObjectFieldContainerOwst_0((uint64_t)v11, 1, 1, v1);
  sub_24FC38F4C(v19, v20, v21, v22, v23, MEMORY[0x263F61FA8], v24, v25, v0, v26, v27[0], v27[1]);
  sub_24FC3936C();
  sub_24FC38DB4();
}

uint64_t sub_24FC35F1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void (*a7)(uint64_t))
{
  sub_24FC12094();
  uint64_t v11 = v10;
  MEMORY[0x270FA5388](v12);
  sub_24FC391DC();
  uint64_t result = v13();
  if (!v7)
  {
    a7(v8);
    return (*(uint64_t (**)(uint64_t, uint64_t))(v11 + 8))(v8, a4);
  }
  return result;
}

void *ChatMessagesPrompt.withModel<A>(modelType:model:chatParameters:)(uint64_t a1, uint64_t a2, void (*a3)(void *), uint64_t a4, uint64_t a5)
{
  return sub_24FC36184(a1, a2, a3, a4, a5, (void (*)(void *, char *, uint64_t))ChatMessagesPrompt.with<A>(model:chatParameters:modelType:));
}

{
  return sub_24FC36184(a1, a2, a3, a4, a5, (void (*)(void *, char *, uint64_t))ChatMessagesPrompt.with<A>(model:chatParameters:modelType:));
}

void ChatMessagesPrompt.with<A>(model:modelType:)()
{
}

{
  sub_24FC33624();
}

void *ChatMessagesPrompt.withModel<A>(modelType:model:)(void *(*a1)(void *__return_ptr), uint64_t a2, uint64_t a3)
{
  return sub_24FC36380(a1, a2, a3, (void (*)(void *, uint64_t))ChatMessagesPrompt.with<A>(model:modelType:));
}

{
  return sub_24FC36380(a1, a2, a3, (void (*)(void *, uint64_t))ChatMessagesPrompt.with<A>(model:modelType:));
}

void *sub_24FC36184(uint64_t a1, uint64_t a2, void (*a3)(void *), uint64_t a4, uint64_t a5, void (*a6)(void *, char *, uint64_t))
{
  void *(*v12)(void *__return_ptr);
  uint64_t v13;
  char *v14;
  void *result;
  void v17[5];
  void (*v18)(void *);

  uint64_t v18 = a3;
  sub_24FC12094();
  uint64_t v10 = v9;
  uint64_t v12 = (void *(*)(void *__return_ptr))MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v17[-1] - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = v12(v17);
  if (!v6)
  {
    v18(result);
    a6(v17, v14, a5);
    (*(void (**)(char *, uint64_t))(v10 + 8))(v14, a5);
    return (void *)_s19GenerativeFunctions26TokenStreamProcessorCloserVwxx_0((uint64_t)v17);
  }
  return result;
}

uint64_t sub_24FC362F4(uint64_t a1, uint64_t a2)
{
  *(void *)(a2 + 24) = *(void *)(a1 + 24);
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  sub_24FC38810();
  (*v3)(a2);
  return a2;
}

void *sub_24FC36380(void *(*a1)(void *__return_ptr), uint64_t a2, uint64_t a3, void (*a4)(void *, uint64_t))
{
  uint64_t result = a1(v8);
  if (!v4)
  {
    a4(v8, a3);
    return (void *)_s19GenerativeFunctions26TokenStreamProcessorCloserVwxx_0((uint64_t)v8);
  }
  return result;
}

uint64_t dispatch thunk of PromptRunResultDecodable.init(promptOutput:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v13 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a5 + 8) + **(int **)(a5 + 8));
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v11;
  *uint64_t v11 = v5;
  v11[1] = sub_24FC0C22C;
  return v13(a1, a2, a3, a4, a5);
}

ValueMetadata *type metadata accessor for CompletionPromptRunConfig()
{
  return &type metadata for CompletionPromptRunConfig;
}

uint64_t sub_24FC36530(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 32);
}

uint64_t sub_24FC36538(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24FC36E90(a1, a2, a3, MEMORY[0x263F61F60]);
}

uint64_t *sub_24FC36560(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  return sub_24FC36FBC(a1, a2, a3);
}

uint64_t sub_24FC36588(uint64_t a1, uint64_t a2)
{
  return sub_24FC371BC(a1, a2);
}

void sub_24FC365B0()
{
}

void sub_24FC365D8()
{
}

void sub_24FC36600()
{
}

void sub_24FC36628()
{
}

void sub_24FC36650(uint64_t a1, unsigned int a2, uint64_t a3)
{
}

void sub_24FC36678(unsigned char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
}

uint64_t type metadata accessor for CompletionPromptRunConfig.Typed()
{
  return sub_24FC13970();
}

uint64_t sub_24FC366B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24FC36E90(a1, a2, a3, MEMORY[0x263F61F60]);
}

uint64_t *sub_24FC366E0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  return sub_24FC36FBC(a1, a2, a3);
}

uint64_t sub_24FC36708(uint64_t a1, uint64_t a2)
{
  return sub_24FC371BC(a1, a2);
}

void sub_24FC36730()
{
}

void sub_24FC36758()
{
}

void sub_24FC36780()
{
}

void sub_24FC367A8()
{
}

void sub_24FC367D0(uint64_t a1, unsigned int a2, uint64_t a3)
{
}

void sub_24FC367F8(unsigned char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
}

uint64_t type metadata accessor for CompletionPromptRunConfig.TypedStreamable()
{
  return sub_24FC13970();
}

uint64_t sub_24FC36838(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 24);
}

uint64_t sub_24FC36840(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24FC37E24(a1, a2, a3, MEMORY[0x263F61F60]);
}

void sub_24FC36858()
{
}

uint64_t sub_24FC36870(uint64_t a1)
{
  return sub_24FC36B60(a1);
}

uint64_t sub_24FC36888(uint64_t a1, uint64_t a2)
{
  return sub_24FC38054(a1, a2);
}

uint64_t sub_24FC368A0(uint64_t a1, uint64_t *a2)
{
  return sub_24FC38134(a1, a2);
}

uint64_t *sub_24FC368B8(uint64_t *result, uint64_t *a2)
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

uint64_t sub_24FC36AE8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24FC381D0(a1, a2, a3);
}

uint64_t sub_24FC36B00(uint64_t a1, long long *a2)
{
  return sub_24FC36C18(a1, a2);
}

uint64_t sub_24FC36B18(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  return sub_24FC3829C(a1, a2, a3);
}

double sub_24FC36B30(unsigned char *a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  return sub_24FC384E0(a1, a2, a3, a4);
}

uint64_t type metadata accessor for CompletionPromptRunConfig.Untyped()
{
  return sub_24FC13970();
}

uint64_t sub_24FC36B60(uint64_t a1)
{
  uint64_t v2 = sub_24FC393C8();
  v3(v2);
  sub_24FC12084();
  uint64_t v5 = v4 + 8;
  (*(void (**)(uint64_t))(v4 + 8))(a1);
  unint64_t v6 = (a1 + *(void *)(v5 + 56) + 7) & 0xFFFFFFFFFFFFFFF8;
  _s19GenerativeFunctions26TokenStreamProcessorCloserVwxx_0(v6);
  sub_24FC38810();
  uint64_t v8 = *(uint64_t (**)(unint64_t))(v7 + 8);
  unint64_t v9 = (v6 + *(unsigned __int8 *)(v7 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  return v8(v9);
}

uint64_t sub_24FC36C18(uint64_t a1, long long *a2)
{
  uint64_t v4 = sub_24FC393C8();
  v5(v4);
  sub_24FC12084();
  uint64_t v7 = v6 + 40;
  uint64_t v8 = sub_24FC391CC();
  v9(v8);
  unint64_t v10 = sub_24FC3911C(*(void *)(v7 + 24));
  _s19GenerativeFunctions26TokenStreamProcessorCloserVwxx_0(v10);
  long long v11 = *a2;
  long long v12 = a2[1];
  *(void *)(v7 + 32) = *((void *)a2 + 4);
  *(_OWORD *)uint64_t v7 = v11;
  *(_OWORD *)(v7 + 16) = v12;
  sub_24FC38810();
  uint64_t v13 = sub_24FC390E4();
  v14(v13);
  return a1;
}

uint64_t type metadata accessor for CompletionPromptRunConfig.UntypedStreamable()
{
  return sub_24FC13970();
}

ValueMetadata *type metadata accessor for ChatMessagesPromptRunConfig()
{
  return &type metadata for ChatMessagesPromptRunConfig;
}

uint64_t sub_24FC36CE8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24FC36E90(a1, a2, a3, MEMORY[0x263F61FA8]);
}

uint64_t *sub_24FC36D10(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  return sub_24FC36FBC(a1, a2, a3);
}

uint64_t sub_24FC36D38(uint64_t a1, uint64_t a2)
{
  return sub_24FC371BC(a1, a2);
}

void sub_24FC36D60()
{
}

void sub_24FC36D88()
{
}

void sub_24FC36DB0()
{
}

void sub_24FC36DD8()
{
}

void sub_24FC36E00(uint64_t a1, unsigned int a2, uint64_t a3)
{
}

void sub_24FC36E28(unsigned char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
}

uint64_t type metadata accessor for ChatMessagesPromptRunConfig.Typed()
{
  return sub_24FC13970();
}

uint64_t sub_24FC36E68(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24FC36E90(a1, a2, a3, MEMORY[0x263F61FA8]);
}

uint64_t sub_24FC36E90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t))
{
  uint64_t AssociatedTypeWitness = a4(319);
  if (v5 <= 0x3F)
  {
    uint64_t AssociatedTypeWitness = swift_checkMetadataState();
    if (v6 <= 0x3F)
    {
      sub_24FC38B50();
      uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
      if (v7 <= 0x3F)
      {
        sub_24FC391A8();
        return 0;
      }
    }
  }
  return AssociatedTypeWitness;
}

uint64_t *sub_24FC36F94(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  return sub_24FC36FBC(a1, a2, a3);
}

uint64_t *sub_24FC36FBC(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = sub_24FC38C58();
  uint64_t v34 = v5(v4);
  sub_24FC12094();
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)(a3 + 16);
  sub_24FC38A40();
  uint64_t v10 = v9;
  int v11 = *(_DWORD *)(v9 + 80);
  uint64_t v13 = v12 + v11;
  uint64_t v15 = *(void *)(v14 + 64);
  swift_getAssociatedTypeWitness();
  sub_24FC12094();
  uint64_t v18 = v17;
  uint64_t v20 = v19;
  LODWORD(v19) = *(_DWORD *)(v18 + 80);
  uint64_t v21 = v19;
  unint64_t v22 = ((v15 + v19 + (v13 & ~(unint64_t)v11)) & ~(unint64_t)v19)
      + *(void *)(v20 + 64);
  int v23 = v11 | *(_DWORD *)(v7 + 80) | v19;
  uint64_t v24 = (v11 | *(unsigned char *)(v7 + 80) | v19);
  int v25 = v23 & 0x100000;
  if (v24 <= 7 && v22 <= 0x18 && v25 == 0)
  {
    uint64_t v33 = v16;
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(a1, a2, v34);
    uint64_t v29 = a1;
    unint64_t v30 = ((unint64_t)a1 + v13) & ~(unint64_t)v11;
    unint64_t v31 = ((unint64_t)a2 + v13) & ~(unint64_t)v11;
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v10 + 16))(v30, v31, v8);
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v18 + 16))((v30 + v15 + v21) & ~v21, (v31 + v15 + v21) & ~v21, v33);
  }
  else
  {
    uint64_t v28 = *a2;
    *a1 = *a2;
    uint64_t v29 = (uint64_t *)(v28 + ((v24 + 16) & ~v24));
    swift_retain();
  }
  return v29;
}

uint64_t sub_24FC37194(uint64_t a1, uint64_t a2)
{
  return sub_24FC371BC(a1, a2);
}

uint64_t sub_24FC371BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24FC38C58();
  v5(v4);
  sub_24FC12084();
  uint64_t v7 = v6 + 8;
  (*(void (**)(uint64_t))(v6 + 8))(a1);
  uint64_t v8 = *(void *)(*(void *)(a2 + 16) - 8);
  uint64_t v9 = v8 + 8;
  unint64_t v10 = (*(void *)(v7 + 56) + a1 + *(unsigned __int8 *)(v8 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  (*(void (**)(unint64_t, void))(v8 + 8))(v10, *(void *)(a2 + 16));
  uint64_t v11 = *(void *)(v9 + 56);
  swift_getAssociatedTypeWitness();
  sub_24FC12084();
  uint64_t v13 = *(uint64_t (**)(unint64_t, uint64_t))(v12 + 8);
  uint64_t v15 = v14;
  unint64_t v16 = (v10 + v11 + *(unsigned __int8 *)(v12 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  return v13(v16, v15);
}

void sub_24FC372D0()
{
}

void sub_24FC372F8()
{
  sub_24FC39378();
  uint64_t v0 = sub_24FC38AC4();
  v1(v0);
  sub_24FC12084();
  uint64_t v2 = sub_24FC39000();
  v3(v2);
  sub_24FC38E7C();
  uint64_t v5 = sub_24FC38994(v4);
  v6(v5);
  sub_24FC38CB4();
  sub_24FC12084();
  uint64_t v7 = sub_24FC38C10();
  v8(v7);
  sub_24FC39344();
}

void sub_24FC373AC()
{
}

void sub_24FC373D4()
{
  sub_24FC39378();
  uint64_t v0 = sub_24FC38AC4();
  v1(v0);
  sub_24FC12084();
  uint64_t v2 = sub_24FC39000();
  v3(v2);
  sub_24FC38E7C();
  uint64_t v5 = sub_24FC38994(v4);
  v6(v5);
  sub_24FC38CB4();
  sub_24FC12084();
  uint64_t v7 = sub_24FC38C10();
  v8(v7);
  sub_24FC39344();
}

void sub_24FC37488()
{
}

void sub_24FC374B0()
{
  sub_24FC39378();
  uint64_t v0 = sub_24FC38AC4();
  v1(v0);
  sub_24FC12084();
  uint64_t v2 = sub_24FC39000();
  v3(v2);
  sub_24FC38E7C();
  uint64_t v5 = sub_24FC38994(v4);
  v6(v5);
  sub_24FC38CB4();
  sub_24FC12084();
  uint64_t v7 = sub_24FC38C10();
  v8(v7);
  sub_24FC39344();
}

void sub_24FC37564()
{
}

void sub_24FC3758C()
{
  sub_24FC39378();
  uint64_t v0 = sub_24FC38AC4();
  v1(v0);
  sub_24FC12084();
  uint64_t v2 = sub_24FC39000();
  v3(v2);
  sub_24FC38E7C();
  uint64_t v5 = sub_24FC38994(v4);
  v6(v5);
  sub_24FC38CB4();
  sub_24FC12084();
  uint64_t v7 = sub_24FC38C10();
  v8(v7);
  sub_24FC39344();
}

void sub_24FC37640(uint64_t a1, unsigned int a2, uint64_t a3)
{
}

void sub_24FC37668(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v5 = sub_24FC38C58();
  uint64_t v18 = v6(v5);
  uint64_t v7 = *(void *)(v18 - 8);
  uint64_t v8 = *(void *)(*(void *)(a3 + 16) - 8);
  if (*(_DWORD *)(v8 + 84) <= *(_DWORD *)(v7 + 84)) {
    unsigned int v9 = *(_DWORD *)(*(void *)(v18 - 8) + 84);
  }
  else {
    unsigned int v9 = *(_DWORD *)(v8 + 84);
  }
  uint64_t v10 = *(void *)(swift_getAssociatedTypeWitness() - 8);
  if (*(_DWORD *)(v10 + 84) <= v9) {
    unsigned int v11 = v9;
  }
  else {
    unsigned int v11 = *(_DWORD *)(v10 + 84);
  }
  if (!a2) {
    goto LABEL_24;
  }
  if (a2 > v11)
  {
    unint64_t v12 = ((*(void *)(v8 + 64)
          + *(unsigned __int8 *)(v10 + 80)
          + ((*(void *)(v7 + 64) + *(unsigned __int8 *)(v8 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80))) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80))
        + *(void *)(v10 + 64);
    if (v12 > 3) {
      goto LABEL_27;
    }
    unsigned int v13 = ((a2 - v11 + ~(-1 << (8 * v12))) >> (8 * v12)) + 1;
    if (HIWORD(v13))
    {
      if (!*(_DWORD *)(a1 + v12)) {
        goto LABEL_19;
      }
      goto LABEL_24;
    }
    if (v13 > 0xFF)
    {
      if (!*(_WORD *)(a1 + v12)) {
        goto LABEL_19;
      }
      goto LABEL_24;
    }
    if (v13 >= 2)
    {
LABEL_27:
      if (!*(unsigned char *)(a1 + v12)) {
        goto LABEL_19;
      }
LABEL_24:
      sub_24FC38F08();
      return;
    }
  }
LABEL_19:
  if (!v11) {
    goto LABEL_24;
  }
  sub_24FC38F08();
  _s19GenerativeFunctions24JsonObjectFieldContainerOwet_0(v14, v15, v16);
}

void sub_24FC37960(unsigned char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
}

void sub_24FC37988(unsigned char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = sub_24FC38C58();
  uint64_t v26 = v7(v6);
  uint64_t v8 = *(void *)(v26 - 8);
  uint64_t v9 = *(void *)(*(void *)(a4 + 16) - 8);
  if (*(_DWORD *)(v9 + 84) <= *(_DWORD *)(v8 + 84)) {
    unsigned int v10 = *(_DWORD *)(*(void *)(v26 - 8) + 84);
  }
  else {
    unsigned int v10 = *(_DWORD *)(v9 + 84);
  }
  uint64_t v11 = *(void *)(swift_getAssociatedTypeWitness() - 8);
  if (*(_DWORD *)(v11 + 84) <= v10) {
    unsigned int v12 = v10;
  }
  else {
    unsigned int v12 = *(_DWORD *)(v11 + 84);
  }
  size_t v13 = ((*(void *)(v9 + 64)
        + *(unsigned __int8 *)(v11 + 80)
        + ((*(void *)(v8 + 64) + *(unsigned __int8 *)(v9 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80))) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80))
      + *(void *)(v11 + 64);
  char v14 = 8 * v13;
  if (a3 <= v12)
  {
    int v16 = 0;
    uint64_t v15 = a1;
  }
  else
  {
    uint64_t v15 = a1;
    if (v13 <= 3)
    {
      unsigned int v19 = ((a3 - v12 + ~(-1 << v14)) >> v14) + 1;
      if (HIWORD(v19))
      {
        int v16 = 4;
      }
      else if (v19 >= 0x100)
      {
        int v16 = 2;
      }
      else
      {
        int v16 = v19 > 1;
      }
    }
    else
    {
      int v16 = 1;
    }
  }
  if (v12 < a2)
  {
    unsigned int v17 = ~v12 + a2;
    if (v13 < 4)
    {
      int v18 = (v17 >> v14) + 1;
      if (v13)
      {
        int v20 = v17 & ~(-1 << v14);
        bzero(v15, v13);
        if (v13 == 3)
        {
          *(_WORD *)uint64_t v15 = v20;
          v15[2] = BYTE2(v20);
        }
        else if (v13 == 2)
        {
          *(_WORD *)uint64_t v15 = v20;
        }
        else
        {
          *uint64_t v15 = v20;
        }
      }
    }
    else
    {
      bzero(v15, v13);
      *(_DWORD *)uint64_t v15 = v17;
      int v18 = 1;
    }
    switch(v16)
    {
      case 1:
        v15[v13] = v18;
        goto LABEL_40;
      case 2:
        *(_WORD *)&v15[v13] = v18;
        goto LABEL_40;
      case 3:
        goto LABEL_41;
      case 4:
        *(_DWORD *)&v15[v13] = v18;
        goto LABEL_40;
      default:
        goto LABEL_40;
    }
  }
  switch(v16)
  {
    case 1:
      v15[v13] = 0;
      if (!a2) {
        goto LABEL_40;
      }
      goto LABEL_31;
    case 2:
      *(_WORD *)&v15[v13] = 0;
      if (!a2) {
        goto LABEL_40;
      }
      goto LABEL_31;
    case 3:
LABEL_41:
      __break(1u);
      JUMPOUT(0x24FC37CF4);
    case 4:
      *(_DWORD *)&v15[v13] = 0;
      goto LABEL_26;
    default:
LABEL_26:
      if (a2)
      {
LABEL_31:
        sub_24FC38F08();
        _s19GenerativeFunctions24JsonObjectFieldContainerOwst_0(v21, v22, v23, v24);
      }
      else
      {
LABEL_40:
        sub_24FC38F08();
      }
      return;
  }
}

uint64_t type metadata accessor for ChatMessagesPromptRunConfig.TypedStreamable()
{
  return sub_24FC13970();
}

uint64_t sub_24FC37D34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24FC37E24(a1, a2, a3, MEMORY[0x263F61FA8]);
}

void sub_24FC37D4C()
{
}

uint64_t sub_24FC37D64(uint64_t a1)
{
  return sub_24FC36B60(a1);
}

uint64_t sub_24FC37D7C(uint64_t a1, uint64_t a2)
{
  return sub_24FC38054(a1, a2);
}

uint64_t sub_24FC37D94(uint64_t a1, uint64_t *a2)
{
  return sub_24FC38134(a1, a2);
}

uint64_t sub_24FC37DAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24FC381D0(a1, a2, a3);
}

uint64_t sub_24FC37DC4(uint64_t a1, long long *a2)
{
  return sub_24FC36C18(a1, a2);
}

uint64_t sub_24FC37DDC(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  return sub_24FC3829C(a1, a2, a3);
}

double sub_24FC37DF4(unsigned char *a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  return sub_24FC384E0(a1, a2, a3, a4);
}

uint64_t type metadata accessor for ChatMessagesPromptRunConfig.Untyped()
{
  return sub_24FC13970();
}

uint64_t sub_24FC37E24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t))
{
  uint64_t result = a4(319);
  if (v5 <= 0x3F)
  {
    uint64_t result = swift_checkMetadataState();
    if (v6 <= 0x3F)
    {
      sub_24FC391A8();
      return 0;
    }
  }
  return result;
}

void sub_24FC37EE8()
{
  sub_24FC39378();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  unint64_t v5 = v4;
  uint64_t v6 = sub_24FC38C58();
  v7(v6);
  sub_24FC38A40();
  uint64_t v9 = *(void *)(v8 + 64);
  uint64_t v10 = *(void *)(v1 + 16);
  sub_24FC38A40();
  uint64_t v13 = v12;
  uint64_t v15 = v14;
  int v16 = *(_DWORD *)(v13 + 80);
  uint64_t v17 = v16;
  if (((*(_DWORD *)(v11 + 80) | v16) & 0x100000) != 0
    || (((((v9 + 7) & 0xFFFFFFFFFFFFFFF8) + v16 + 40) & ~(unint64_t)v16)
      + *(void *)(v15 + 64) <= 0x18
      ? (BOOL v18 = (v16 | *(_DWORD *)(v11 + 80) & 0xF8u) > 7)
      : (BOOL v18 = 1),
        v18))
  {
    *unint64_t v5 = *v3;
    swift_retain();
  }
  else
  {
    sub_24FC123C0();
    v19();
    unint64_t v20 = ((unint64_t)v5 + v9 + 7) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v21 = ((unint64_t)v3 + v9 + 7) & 0xFFFFFFFFFFFFFFF8;
    *(void *)(v20 + 24) = *(void *)(v21 + 24);
    *(void *)(v20 + 32) = *(void *)(v21 + 32);
    sub_24FC38B50();
    uint64_t v22 = sub_24FC392AC();
    v23(v22);
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v13 + 16))((v20 + v17 + 40) & ~v17, (v21 + v17 + 40) & ~v17, v10);
  }
  sub_24FC39344();
}

uint64_t sub_24FC38054(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24FC38C58();
  v5(v4);
  sub_24FC12084();
  uint64_t v7 = v6 + 16;
  (*(void (**)(uint64_t, uint64_t))(v6 + 16))(a1, a2);
  uint64_t v8 = *(void *)(v7 + 48) + 7;
  unint64_t v9 = (v8 + a1) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v10 = (v8 + a2) & 0xFFFFFFFFFFFFFFF8;
  *(void *)(v9 + 24) = *(void *)(v10 + 24);
  *(void *)(v9 + 32) = *(void *)(v10 + 32);
  sub_24FC38B50();
  uint64_t v11 = sub_24FC392AC();
  v12(v11);
  sub_24FC38810();
  sub_24FC123C0();
  v13();
  return a1;
}

uint64_t sub_24FC38134(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = sub_24FC38C58();
  v5(v4);
  sub_24FC12084();
  uint64_t v7 = v6 + 24;
  uint64_t v8 = sub_24FC391CC();
  v9(v8);
  unint64_t v10 = (uint64_t *)sub_24FC3911C(*(void *)(v7 + 40));
  sub_24FC368B8(v10, a2);
  sub_24FC38810();
  uint64_t v11 = sub_24FC390E4();
  v12(v11);
  return a1;
}

uint64_t sub_24FC381D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24FC38C58();
  v7(v6);
  sub_24FC12084();
  uint64_t v9 = v8 + 32;
  uint64_t v10 = sub_24FC391CC();
  v11(v10);
  uint64_t v12 = *(void *)(v9 + 32) + 7;
  unint64_t v13 = (v12 + a1) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v14 = (v12 + a2) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v15 = *(void *)(v14 + 32);
  long long v16 = *(_OWORD *)(v14 + 16);
  *(_OWORD *)unint64_t v13 = *(_OWORD *)v14;
  *(_OWORD *)(v13 + 16) = v16;
  *(void *)(v13 + 32) = v15;
  uint64_t v17 = *(void *)(*(void *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v17 + 32))((*(unsigned __int8 *)(v17 + 80) + 40 + v13) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80), (*(unsigned __int8 *)(v17 + 80) + 40 + v14) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80));
  return a1;
}

uint64_t sub_24FC3829C(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v6 = sub_24FC38C58();
  v7(v6);
  sub_24FC38E64(*(void *)(a3 + 16));
  uint64_t v14 = *(unsigned int *)(v13 + 84);
  if (v10 <= v14) {
    unsigned int v15 = *(_DWORD *)(v13 + 84);
  }
  else {
    unsigned int v15 = v10;
  }
  if (v15 <= 0x7FFFFFFF) {
    unsigned int v16 = 0x7FFFFFFF;
  }
  else {
    unsigned int v16 = v15;
  }
  uint64_t v17 = *(void *)(v11 + 64);
  uint64_t v18 = *(unsigned __int8 *)(v13 + 80);
  uint64_t v19 = *(void *)(v12 + 64);
  if (!a2) {
    return 0;
  }
  if (a2 <= v16) {
    goto LABEL_28;
  }
  uint64_t v20 = ((v18 + ((v17 + 7) & 0xFFFFFFFFFFFFFFF8) + 40) & ~v18) + v19;
  char v21 = 8 * v20;
  if (v20 > 3) {
    goto LABEL_10;
  }
  unsigned int v24 = ((a2 - v16 + ~(-1 << v21)) >> v21) + 1;
  if (HIWORD(v24))
  {
    int v22 = *(_DWORD *)((char *)a1 + v20);
    if (v22) {
      goto LABEL_18;
    }
  }
  else
  {
    if (v24 <= 0xFF)
    {
      if (v24 < 2) {
        goto LABEL_28;
      }
LABEL_10:
      int v22 = *((unsigned __int8 *)a1 + v20);
      if (!*((unsigned char *)a1 + v20)) {
        goto LABEL_28;
      }
LABEL_18:
      int v25 = (v22 - 1) << v21;
      if (v20 > 3) {
        int v25 = 0;
      }
      if (v20)
      {
        if (v20 <= 3) {
          int v26 = v20;
        }
        else {
          int v26 = 4;
        }
        switch(v26)
        {
          case 2:
            int v27 = *a1;
            break;
          case 3:
            int v27 = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
            break;
          case 4:
            int v27 = *(_DWORD *)a1;
            break;
          default:
            int v27 = *(unsigned __int8 *)a1;
            break;
        }
      }
      else
      {
        int v27 = 0;
      }
      return v16 + (v27 | v25) + 1;
    }
    int v22 = *(unsigned __int16 *)((char *)a1 + v20);
    if (*(unsigned __int16 *)((char *)a1 + v20)) {
      goto LABEL_18;
    }
  }
LABEL_28:
  if (v10 == v16)
  {
    uint64_t v28 = (uint64_t)a1;
    uint64_t v14 = v10;
    uint64_t v8 = v9;
LABEL_35:
    return _s19GenerativeFunctions24JsonObjectFieldContainerOwet_0(v28, v14, v8);
  }
  unint64_t v29 = ((unint64_t)a1 + v17 + 7) & 0xFFFFFFFFFFFFFFF8;
  if ((v15 & 0x80000000) != 0)
  {
    uint64_t v28 = (v29 + v18 + 40) & ~v18;
    goto LABEL_35;
  }
  unint64_t v30 = *(void *)(v29 + 24);
  if (v30 >= 0xFFFFFFFF) {
    LODWORD(v30) = -1;
  }
  return (v30 + 1);
}

double sub_24FC384E0(unsigned char *a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  uint64_t v8 = sub_24FC38C58();
  v9(v8);
  sub_24FC38E64(*(void *)(a4 + 16));
  uint64_t v17 = *(unsigned int *)(v15 + 84);
  if (v12 <= v17) {
    unsigned int v18 = *(_DWORD *)(v15 + 84);
  }
  else {
    unsigned int v18 = v12;
  }
  if (v18 <= 0x7FFFFFFF) {
    unsigned int v19 = 0x7FFFFFFF;
  }
  else {
    unsigned int v19 = v18;
  }
  uint64_t v20 = *(void *)(v13 + 64);
  uint64_t v21 = *(unsigned __int8 *)(v15 + 80);
  size_t v22 = ((v21 + ((v20 + 7) & 0xFFFFFFFFFFFFFFF8) + 40) & ~v21) + *(void *)(v14 + 64);
  char v23 = 8 * v22;
  if (a3 <= v19)
  {
    int v24 = 0;
  }
  else if (v22 <= 3)
  {
    unsigned int v27 = ((a3 - v19 + ~(-1 << v23)) >> v23) + 1;
    if (HIWORD(v27))
    {
      int v24 = 4;
    }
    else if (v27 >= 0x100)
    {
      int v24 = 2;
    }
    else
    {
      int v24 = v27 > 1;
    }
  }
  else
  {
    int v24 = 1;
  }
  if (v19 < a2)
  {
    unsigned int v25 = ~v19 + a2;
    if (v22 < 4)
    {
      int v26 = (v25 >> v23) + 1;
      if (v22)
      {
        int v28 = v25 & ~(-1 << v23);
        bzero(a1, v22);
        if (v22 == 3)
        {
          *(_WORD *)a1 = v28;
          a1[2] = BYTE2(v28);
        }
        else if (v22 == 2)
        {
          *(_WORD *)a1 = v28;
        }
        else
        {
          *a1 = v28;
        }
      }
    }
    else
    {
      bzero(a1, v22);
      *(_DWORD *)a1 = v25;
      int v26 = 1;
    }
    switch(v24)
    {
      case 1:
        a1[v22] = v26;
        return result;
      case 2:
        *(_WORD *)&a1[v22] = v26;
        return result;
      case 3:
        goto LABEL_47;
      case 4:
        *(_DWORD *)&a1[v22] = v26;
        return result;
      default:
        return result;
    }
  }
  switch(v24)
  {
    case 1:
      a1[v22] = 0;
      if (!a2) {
        return result;
      }
      goto LABEL_27;
    case 2:
      *(_WORD *)&a1[v22] = 0;
      if (!a2) {
        return result;
      }
      goto LABEL_27;
    case 3:
LABEL_47:
      __break(1u);
      JUMPOUT(0x24FC387B0);
    case 4:
      *(_DWORD *)&a1[v22] = 0;
      goto LABEL_26;
    default:
LABEL_26:
      if (!a2) {
        return result;
      }
LABEL_27:
      if (v12 == v19)
      {
        uint64_t v29 = (uint64_t)a1;
        uint64_t v30 = a2;
        uint64_t v17 = v12;
        uint64_t v10 = v11;
      }
      else
      {
        unint64_t v31 = (unint64_t)&a1[v20 + 7] & 0xFFFFFFFFFFFFFFF8;
        if ((v18 & 0x80000000) == 0)
        {
          if ((a2 & 0x80000000) != 0)
          {
            double result = 0.0;
            *(_OWORD *)(v31 + 8) = 0u;
            *(_OWORD *)(v31 + 24) = 0u;
            *(void *)unint64_t v31 = a2 ^ 0x80000000;
          }
          else
          {
            *(void *)(v31 + 24) = (a2 - 1);
          }
          return result;
        }
        uint64_t v29 = (v31 + v21 + 40) & ~v21;
        uint64_t v30 = a2;
      }
      _s19GenerativeFunctions24JsonObjectFieldContainerOwst_0(v29, v30, v17, v10);
      return result;
  }
}

uint64_t type metadata accessor for ChatMessagesPromptRunConfig.UntypedStreamable()
{
  return sub_24FC13970();
}

uint64_t *sub_24FC3881C()
{
  uint64_t v4 = (void *)(v1 + *(int *)(v2 + 28));
  long long v8 = *(_OWORD *)(v4 + 3);
  sub_24FC0CC3C(v4, v4[3]);
  uint64_t v5 = v0 + *(int *)(v3 + 52);
  *(_OWORD *)(v5 + 24) = v8;
  return sub_24FC0CCD0((uint64_t *)v5);
}

uint64_t sub_24FC38870()
{
  return *(void *)(v0 + 240);
}

uint64_t sub_24FC388A0()
{
  return *(void *)(v0 + 264);
}

uint64_t *sub_24FC388D0()
{
  uint64_t v4 = (void *)(v1 + *(int *)(v0 + 28));
  long long v7 = *(_OWORD *)(v4 + 3);
  sub_24FC0CC3C(v4, v4[3]);
  *(_OWORD *)(v2 + 136) = v7;
  return sub_24FC0CCD0(v3);
}

void *sub_24FC3891C()
{
  sub_24FC2CC18(v0, (_OWORD *)(v1 + 16));
  return sub_24FC0CC3C((void *)(v1 + 16), *(void *)(v1 + 40));
}

void *sub_24FC38958()
{
  sub_24FC2CC18(v1, (_OWORD *)(v0 + 16));
  return sub_24FC0CC3C((void *)(v0 + 16), *(void *)(v0 + 40));
}

uint64_t sub_24FC38994@<X0>(uint64_t a1@<X8>)
{
  return (a1 + v1 + v2) & ~v1;
}

uint64_t sub_24FC389BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  return MEMORY[0x270F583C0](v13, a9, v11, v12, a1, a11, a10);
}

uint64_t sub_24FC389EC()
{
  return sub_24FC4F728();
}

double sub_24FC38A1C()
{
  double result = 0.0;
  _OWORD *v0 = 0u;
  v0[1] = 0u;
  v0[2] = 0u;
  return result;
}

uint64_t sub_24FC38A58()
{
  return v0;
}

uint64_t sub_24FC38A78()
{
  return v0;
}

uint64_t sub_24FC38A98()
{
  uint64_t v5 = v1 + *(int *)(v2 + 36);
  return GenerativeConfigurationProtocol.with<A>(model:)(v5, v0, v3);
}

uint64_t sub_24FC38AC4()
{
  return 0;
}

uint64_t sub_24FC38AE4()
{
  return sub_24FC4F728();
}

double sub_24FC38B10()
{
  double result = 0.0;
  _OWORD *v0 = 0u;
  v0[1] = 0u;
  v0[2] = 0u;
  return result;
}

uint64_t sub_24FC38B30()
{
  return v0;
}

uint64_t sub_24FC38B68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  uint64_t v16 = sub_24FC20B5C(a1, a2);
  return MEMORY[0x270F583C0](v16, a10, v13, v14, v15, a13, a12);
}

uint64_t sub_24FC38BA4(uint64_t a1)
{
  v3[25] = a1;
  v3[14] = v1;
  v3[15] = v2;
  v3[16] = v1;
  v3[17] = a1;
  return type metadata accessor for GenerativeConfigurationRunnable();
}

uint64_t sub_24FC38BCC()
{
  uint64_t v5 = v0 + *(int *)(v3 + 36);
  return GenerativeConfigurationProtocol.with<A>(model:)(v5, v2, v1);
}

uint64_t sub_24FC38BF4()
{
  return v0;
}

uint64_t sub_24FC38C10()
{
  return (v2 + v0 + v1) & ~v0;
}

void *sub_24FC38C2C()
{
  _s19GenerativeFunctions26TokenStreamProcessorCloserVwxx_0(v1);
  return sub_24FC0CC3C(v0, v0[3]);
}

uint64_t sub_24FC38C58()
{
  return 0;
}

uint64_t sub_24FC38C64()
{
  return swift_task_dealloc();
}

uint64_t sub_24FC38C80()
{
  return swift_task_dealloc();
}

uint64_t sub_24FC38C9C()
{
  return v0;
}

uint64_t sub_24FC38CB4()
{
  return swift_getAssociatedTypeWitness();
}

uint64_t sub_24FC38CD8()
{
  return swift_dynamicCast();
}

uint64_t sub_24FC38CFC()
{
  return swift_dynamicCast();
}

uint64_t sub_24FC38D20()
{
  return v0;
}

uint64_t sub_24FC38D38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  uint64_t v17 = v15 + *(int *)(a14 + 52);
  return sub_24FC362F4(v14, v17);
}

uint64_t sub_24FC38D5C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X7>, uint64_t a4@<X8>)
{
  *(void *)(v5 - 96) = a4;
  *(void *)(v5 - 88) = a3;
  *(void *)(v5 - 120) = v4;
  *(void *)(v5 - 112) = a1;
  *(void *)(v5 - 104) = a2;
  return swift_getAssociatedTypeWitness();
}

uint64_t sub_24FC38DCC()
{
  return *(void *)(v0 + 144);
}

uint64_t sub_24FC38DE0()
{
  return v0;
}

uint64_t sub_24FC38DF4()
{
  return v0;
}

void *sub_24FC38E08()
{
  return sub_24FC0CC3C(v0, v0[3]);
}

uint64_t sub_24FC38E2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  *(void *)(v7 - 96) = a6;
  *(void *)(v7 - 88) = a7;
  *(void *)(v7 - 104) = a5;
  return sub_24FC4FB08();
}

uint64_t sub_24FC38E64(uint64_t a1)
{
  return a1 - 8;
}

uint64_t sub_24FC38E90()
{
  return swift_getAssociatedTypeWitness();
}

char *sub_24FC38EB0@<X0>(uint64_t a1@<X8>, uint64_t a2)
{
  return (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

char *sub_24FC38EDC@<X0>(uint64_t a1@<X8>, uint64_t a2)
{
  return (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t sub_24FC38F4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v18 = *(void *)(v16 - 104);
  uint64_t v19 = *(void *)(v16 - 96);
  uint64_t v20 = *(void *)(v16 - 88);
  return sub_24FC3466C(v13, v12, v15, v14, v18, a6, v19, v20, a9, a10, a11, a12);
}

uint64_t sub_24FC38F78(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[7] = a5;
  v6[8] = v5;
  v6[5] = a3;
  v6[6] = a4;
  v6[4] = result;
  v6[9] = *(void *)(a3 + 24);
  v6[10] = *(void *)(a3 + 16);
  return result;
}

uint64_t sub_24FC38F98()
{
  return swift_task_dealloc();
}

uint64_t sub_24FC38FB4(uint64_t result)
{
  *(void *)(v2 + 232) = result;
  *(void *)(v2 + 240) = *(void *)(v1 + 24);
  return result;
}

uint64_t sub_24FC38FC4(uint64_t a1)
{
  *(void *)(v1 + 200) = a1;
  return a1 - 8;
}

uint64_t sub_24FC38FD4(uint64_t result)
{
  *(void *)(v2 + 184) = result;
  *(void *)(v2 + 192) = *(void *)(v1 + 16);
  return result;
}

uint64_t sub_24FC38FE4()
{
  return swift_getAssociatedConformanceWitness();
}

uint64_t sub_24FC39000()
{
  return v0;
}

uint64_t sub_24FC39010()
{
  uint64_t v2 = *(void *)(v0 + 152);
  return sub_24FC0CD34(v2);
}

uint64_t sub_24FC3902C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v20 = *(void *)(v18 - 88);
  return sub_24FC3466C(v17, v16, v12, v15, v13, a6, v20, v14, a9, a10, a11, a12);
}

uint64_t sub_24FC39058(uint64_t result)
{
  *(void *)(v1 + 248) = result;
  return result;
}

uint64_t sub_24FC39068(uint64_t result)
{
  *(void *)(v1 + 272) = result;
  return result;
}

uint64_t sub_24FC39078(uint64_t result)
{
  *(void *)(v1 + 288) = result;
  return result;
}

uint64_t sub_24FC39088(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  *(void *)(a15 + 24) = result;
  return result;
}

uint64_t sub_24FC39098()
{
  return *(void *)(v0 + 32);
}

uint64_t sub_24FC390C8()
{
  return v0;
}

uint64_t sub_24FC390E4()
{
  return (v0 + 40 + v1) & ~v0;
}

uint64_t sub_24FC39100()
{
  return *(void *)(v0 + 72);
}

unint64_t sub_24FC3911C@<X0>(uint64_t a1@<X8>)
{
  return (a1 + 7 + v1) & 0xFFFFFFFFFFFFFFF8;
}

uint64_t sub_24FC39138(uint64_t result, uint64_t a2, uint64_t a3)
{
  v4[3] = a3;
  v4[4] = v3;
  v4[2] = result;
  v4[5] = *(void *)(a3 + 24);
  v4[6] = *(void *)(a3 + 16);
  return result;
}

uint64_t sub_24FC39154()
{
  return v0;
}

uint64_t sub_24FC39170()
{
  return v0;
}

uint64_t sub_24FC3918C()
{
  return 0;
}

uint64_t sub_24FC391A8()
{
  return swift_initStructMetadata();
}

uint64_t sub_24FC391CC()
{
  return v0;
}

uint64_t sub_24FC391F4(uint64_t result)
{
  v2[4] = result;
  v2[5] = v1;
  v2[6] = *(void *)(result + 24);
  v2[7] = *(void *)(result + 16);
  return result;
}

uint64_t sub_24FC3920C(uint64_t a1)
{
  *(void *)(v1 + 224) = a1;
  return swift_task_alloc();
}

uint64_t sub_24FC39224(uint64_t a1)
{
  *(void *)(v1 + 208) = a1;
  return swift_task_alloc();
}

uint64_t sub_24FC39254()
{
  uint64_t v2 = *(void *)(v0 + 152);
  return sub_24FC0CD34(v2);
}

uint64_t sub_24FC3926C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[19] = a3;
  v4[20] = v3;
  v4[18] = a1;
  return sub_24FC4F708();
}

uint64_t sub_24FC3928C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[19] = a3;
  v4[20] = v3;
  v4[18] = a1;
  return sub_24FC4F6D8();
}

uint64_t sub_24FC392AC()
{
  return v0;
}

uint64_t sub_24FC392C0(uint64_t a1, uint64_t a2)
{
  v3[20] = a2;
  v3[21] = v2;
  v3[19] = a1;
  return sub_24FC4F708();
}

uint64_t sub_24FC392E0(uint64_t a1, uint64_t a2)
{
  v3[20] = a2;
  v3[21] = v2;
  v3[19] = a1;
  return sub_24FC4F6D8();
}

uint64_t sub_24FC39300(uint64_t result)
{
  *(void *)(v1 + 264) = result;
  return result;
}

uint64_t *sub_24FC3930C(uint64_t a1)
{
  v1[4] = a1;
  return sub_24FC0CCD0(v1);
}

uint64_t sub_24FC39324()
{
  return *(void *)(v0 + 216);
}

uint64_t sub_24FC39330()
{
  return *(void *)(v0 + 48);
}

uint64_t sub_24FC39358()
{
  return *(void *)(v0 + 40);
}

uint64_t *sub_24FC3938C(uint64_t a1)
{
  v1[4] = a1;
  return sub_24FC0CCD0(v1);
}

uint64_t sub_24FC393A4(uint64_t result)
{
  *(void *)(v1 + 24) = result;
  return result;
}

uint64_t sub_24FC393B0()
{
  return swift_getAssociatedTypeWitness();
}

uint64_t sub_24FC393C8()
{
  return 0;
}

uint64_t sub_24FC393D4()
{
  return *(void *)(v0 + 104);
}

uint64_t CompletionPrompt.render<A>(with:)()
{
  sub_24FC396E8();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  sub_24FC4F6D8();
  sub_24FC12B5C(&qword_26B1FD7B0, MEMORY[0x263F61F60]);
  *uint64_t v1 = v0;
  v1[1] = sub_24FC394DC;
  uint64_t v2 = sub_24FC396C8();
  return MEMORY[0x270F2F370](v2);
}

uint64_t sub_24FC394DC()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t ChatMessagesPrompt.render<A>(with:)()
{
  sub_24FC396E8();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  sub_24FC4F708();
  sub_24FC12B5C(qword_269A5C9B8, MEMORY[0x263F61FA8]);
  *uint64_t v1 = v0;
  v1[1] = sub_24FC396C4;
  uint64_t v2 = sub_24FC396C8();
  return MEMORY[0x270F2F338](v2);
}

uint64_t sub_24FC396C8()
{
  return v0;
}

uint64_t sub_24FC396FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24FC13C3C(&qword_269A5D398);
  MEMORY[0x270FA5388](v4 - 8);
  sub_24FC3A238();
  uint64_t v75 = v5;
  uint64_t v76 = sub_24FC4F678();
  sub_24FC14ED0();
  uint64_t v88 = v6;
  uint64_t v8 = MEMORY[0x270FA5388](v7);
  uint64_t v74 = (char *)&v65 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v65 - v10;
  uint64_t v90 = sub_24FC4F458();
  sub_24FC14ED0();
  uint64_t v87 = v12;
  MEMORY[0x270FA5388](v13);
  sub_24FC3A238();
  uint64_t v89 = v14;
  uint64_t v15 = sub_24FC4F468();
  sub_24FC14ED0();
  uint64_t v17 = v16;
  uint64_t v18 = v16;
  uint64_t v20 = MEMORY[0x270FA5388](v19);
  size_t v22 = (char *)&v65 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = MEMORY[0x270FA5388](v20);
  uint64_t v73 = (char *)&v65 - v24;
  uint64_t v25 = MEMORY[0x270FA5388](v23);
  BOOL v86 = (char *)&v65 - v26;
  MEMORY[0x270FA5388](v25);
  int v28 = (char *)&v65 - v27;
  sub_24FC4F658();
  uint64_t v29 = v17;
  uint64_t v84 = *(unsigned int (**)(char *, uint64_t))(v17 + 88);
  uint64_t v85 = v17 + 88;
  if (v84(v28, v15) != *MEMORY[0x263F40C30])
  {
    (*(void (**)(char *, uint64_t))(v18 + 8))(v28, v15);
    return 0;
  }
  uint64_t v71 = *(void (**)(char *, uint64_t))(v18 + 96);
  uint64_t v72 = v18 + 96;
  v71(v28, v15);
  uint64_t v30 = *(void *)(*(void *)v28 + 16);
  swift_bridgeObjectRetain();
  swift_release();
  swift_bridgeObjectRetain();
  uint64_t v31 = sub_24FC39DC4(v30, a1, a2);
  uint64_t v32 = *(void *)(v31 + 16);
  if (!v32)
  {
    swift_bridgeObjectRelease();
    uint64_t v35 = (void *)MEMORY[0x263F8EE78];
LABEL_29:
    if (!v35[2])
    {
      sub_24FC13C3C(&qword_269A5CE58);
      uint64_t v63 = swift_allocObject();
      *(_OWORD *)(v63 + 16) = xmmword_24FC52F00;
      *(void *)(v63 + 32) = a1;
      *(void *)(v63 + 40) = a2;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      return v63;
    }
    return (uint64_t)v35;
  }
  uint64_t v66 = a1;
  uint64_t v67 = a2;
  uint64_t v83 = *(void (**)(uint64_t, unint64_t, uint64_t))(v87 + 16);
  unint64_t v33 = v31 + ((*(unsigned __int8 *)(v87 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v87 + 80));
  uint64_t v77 = *(void *)(v87 + 72);
  uint64_t v82 = (void (**)(char *, uint64_t))(v29 + 8);
  int v81 = *MEMORY[0x263F40C18];
  uint64_t v69 = (void (**)(uint64_t, uint64_t, uint64_t))(v29 + 16);
  uint64_t v68 = (void (**)(char *, uint64_t, uint64_t))(v29 + 32);
  uint64_t v34 = v88 + 8;
  v87 += 16;
  uint64_t v79 = (void (**)(uint64_t, uint64_t))(v87 - 8);
  uint64_t v65 = v31;
  swift_bridgeObjectRetain();
  uint64_t v35 = (void *)MEMORY[0x263F8EE78];
  uint64_t v80 = v34;
  uint64_t v78 = (unint64_t)v34 & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  uint64_t v88 = v11;
  uint64_t v36 = v76;
  uint64_t v37 = v86;
  os_log_type_t v70 = v22;
  while (1)
  {
    v83(v89, v33, v90);
    sub_24FC4F448();
    sub_24FC4F668();
    sub_24FC4F658();
    unsigned int v38 = v84(v22, v15);
    if (v38 == v81)
    {
      v71(v22, v15);
      uint64_t v39 = swift_projectBox();
      uint64_t v76 = (uint64_t)v35;
      uint64_t v40 = *v69;
      uint64_t v41 = v36;
      uint64_t v42 = v75;
      (*v69)(v75, v39, v15);
      os_log_type_t v43 = v73;
      uint64_t v44 = v42;
      uint64_t v36 = v41;
      (*v68)(v73, v44, v15);
      swift_release();
      v40((uint64_t)v37, (uint64_t)v43, v15);
      uint64_t v35 = (void *)v76;
      uint64_t v45 = v74;
      sub_24FC4F668();
      uint64_t v46 = sub_24FC4F648();
      uint64_t v47 = *(void (**)(char *, uint64_t))v80;
      uint64_t v48 = v45;
      uint64_t v11 = v88;
      (*(void (**)(char *, uint64_t))v80)(v48, v36);
      uint64_t v49 = v43;
      size_t v22 = v70;
      (*v82)(v49, v15);
    }
    else
    {
      (*v82)(v22, v15);
      uint64_t v46 = sub_24FC4F648();
      uint64_t v47 = *(void (**)(char *, uint64_t))v80;
    }
    uint64_t v50 = v11;
    uint64_t v51 = v36;
    v47(v50, v36);
    (*v79)(v89, v90);
    uint64_t v52 = *(void *)(v46 + 16);
    int64_t v53 = v35[2];
    int64_t v54 = v53 + v52;
    if (__OFADD__(v53, v52)) {
      break;
    }
    char isUniquelyReferenced_nonNull_native = (void *)swift_isUniquelyReferenced_nonNull_native();
    if (!isUniquelyReferenced_nonNull_native || v54 > v35[3] >> 1)
    {
      if (v53 <= v54) {
        int64_t v56 = v53 + v52;
      }
      else {
        int64_t v56 = v53;
      }
      uint64_t v35 = sub_24FC2A400(isUniquelyReferenced_nonNull_native, v56, 1, (uint64_t)v35);
    }
    uint64_t v36 = v51;
    uint64_t v37 = v86;
    uint64_t v11 = v88;
    if (*(void *)(v46 + 16))
    {
      uint64_t v57 = v35[2];
      if ((v35[3] >> 1) - v57 < v52) {
        goto LABEL_34;
      }
      unint64_t v58 = (unint64_t)&v35[2 * v57 + 4];
      if (v46 + 32 < v58 + 16 * v52 && v58 < v46 + 32 + 16 * v52) {
        goto LABEL_36;
      }
      swift_arrayInitWithCopy();
      if (v52)
      {
        uint64_t v60 = v35[2];
        BOOL v61 = __OFADD__(v60, v52);
        uint64_t v62 = v60 + v52;
        if (v61) {
          goto LABEL_35;
        }
        v35[2] = v62;
      }
    }
    else if (v52)
    {
      goto LABEL_33;
    }
    swift_bridgeObjectRelease();
    v33 += v77;
    if (!--v32)
    {
      swift_bridgeObjectRelease_n();
      a2 = v67;
      a1 = v66;
      goto LABEL_29;
    }
  }
  __break(1u);
LABEL_33:
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  sub_24FC2BB70();
  sub_24FC3A228();
  uint64_t result = sub_24FC4FC38();
  __break(1u);
  return result;
}

uint64_t sub_24FC39DC4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v34 = sub_24FC4F458();
  uint64_t v7 = MEMORY[0x270FA5388](v34);
  unint64_t v33 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = MEMORY[0x270FA5388](v7);
  uint64_t v12 = (char *)&v25 - v11;
  uint64_t v13 = MEMORY[0x263F8EE78];
  uint64_t v35 = MEMORY[0x263F8EE78];
  uint64_t v31 = *(void *)(a1 + 16);
  if (!v31)
  {
LABEL_18:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return v13;
  }
  unint64_t v14 = 0;
  uint64_t v28 = a1;
  uint64_t v29 = v10 + 16;
  uint64_t v25 = v3;
  uint64_t v26 = (uint64_t (**)(char *, uint64_t))(v10 + 8);
  uint64_t v32 = (void (**)(char *, char *, uint64_t))(v10 + 32);
  uint64_t v27 = a2;
  uint64_t v30 = v10;
  while (v14 < *(void *)(a1 + 16))
  {
    unint64_t v15 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
    uint64_t v16 = *(void *)(v10 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v10 + 16))(v12, a1 + v15 + v16 * v14, v34);
    if (sub_24FC4F438() == a2 && v17 == a3)
    {
      swift_bridgeObjectRelease();
LABEL_11:
      uint64_t v20 = a3;
      uint64_t v21 = *v32;
      (*v32)(v33, v12, v34);
      uint64_t v22 = v35;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_24FC4B92C(0, *(void *)(v22 + 16) + 1, 1);
        uint64_t v22 = v35;
      }
      unint64_t v24 = *(void *)(v22 + 16);
      unint64_t v23 = *(void *)(v22 + 24);
      if (v24 >= v23 >> 1)
      {
        sub_24FC4B92C(v23 > 1, v24 + 1, 1);
        uint64_t v22 = v35;
      }
      *(void *)(v22 + 16) = v24 + 1;
      uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))v21)(v22 + v15 + v24 * v16, v33, v34);
      uint64_t v35 = v22;
      a3 = v20;
      a2 = v27;
      a1 = v28;
      goto LABEL_16;
    }
    char v19 = sub_24FC4FC78();
    swift_bridgeObjectRelease();
    if (v19) {
      goto LABEL_11;
    }
    uint64_t result = (*v26)(v12, v34);
LABEL_16:
    ++v14;
    uint64_t v10 = v30;
    if (v31 == v14)
    {
      uint64_t v13 = v35;
      goto LABEL_18;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_24FC3A070(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0)
  {
    sub_24FC2BB70();
LABEL_11:
    uint64_t result = sub_24FC4FC38();
    __break(1u);
    return result;
  }
  if (a3 + 16 * a2 > a1 && a1 + 16 * a2 > a3)
  {
    sub_24FC2BB70();
    sub_24FC3A228();
    goto LABEL_11;
  }
  return swift_arrayInitWithCopy();
}

uint64_t sub_24FC3A130(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0)
  {
    sub_24FC2BB70();
LABEL_11:
    uint64_t result = sub_24FC4FC38();
    __break(1u);
    return result;
  }
  uint64_t v5 = *(void *)(*(void *)(sub_24FC4F458() - 8) + 72) * a2;
  unint64_t v6 = a3 + v5;
  unint64_t v7 = a1 + v5;
  if (v6 > a1 && v7 > a3)
  {
    sub_24FC2BB70();
    sub_24FC3A228();
    goto LABEL_11;
  }
  return swift_arrayInitWithCopy();
}

uint64_t StreamingObjectTokenStreamProcessor.__allocating_init(_:)(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  StreamingObjectTokenStreamProcessor.init(_:)(a1);
  return v2;
}

uint64_t sub_24FC3A28C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  if (*(void *)(a3 + 16) && (sub_24FC17DD4(a1, a2), (v5 & 1) != 0))
  {
    uint64_t v6 = type metadata accessor for FieldStreamingSupport(0);
    sub_24FC4A574();
    uint64_t v7 = a4;
    uint64_t v8 = 0;
    uint64_t v9 = v6;
  }
  else
  {
    uint64_t v9 = type metadata accessor for FieldStreamingSupport(0);
    uint64_t v7 = a4;
    uint64_t v8 = 1;
  }
  return _s19GenerativeFunctions24JsonObjectFieldContainerOwst_0(v7, v8, 1, v9);
}

uint64_t sub_24FC3A350@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (*(void *)(a2 + 16) && (sub_24FC17E4C(a1), (v4 & 1) != 0))
  {
    uint64_t v5 = type metadata accessor for ObjectStreamingSupport(0);
    sub_24FC4A574();
    uint64_t v6 = a3;
    uint64_t v7 = 0;
    uint64_t v8 = v5;
  }
  else
  {
    uint64_t v8 = type metadata accessor for ObjectStreamingSupport(0);
    uint64_t v6 = a3;
    uint64_t v7 = 1;
  }
  return _s19GenerativeFunctions24JsonObjectFieldContainerOwst_0(v6, v7, 1, v8);
}

uint64_t sub_24FC3A414@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  if (*(void *)(a1 + 16))
  {
    uint64_t v3 = sub_24FC4F388();
    sub_24FC12084();
    sub_24FC123C0();
    v4();
    uint64_t v5 = a2;
    uint64_t v6 = 0;
    uint64_t v7 = v3;
  }
  else
  {
    uint64_t v7 = sub_24FC4F388();
    uint64_t v5 = a2;
    uint64_t v6 = 1;
  }
  return _s19GenerativeFunctions24JsonObjectFieldContainerOwst_0(v5, v6, 1, v7);
}

uint64_t sub_24FC3A4D0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *MEMORY[0x263F8F680];
  sub_24FC1607C(&qword_269A5CBA0);
  uint64_t v3 = sub_24FC4FA48();
  char v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 104);
  return v4(a1, v2, v3);
}

uint64_t sub_24FC3A56C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24FC4F9A8();
  sub_24FC4E53C(a1, 1, v6);
  if (v7)
  {
    sub_24FC4DD90(a1, &qword_269A5CE70);
  }
  else
  {
    sub_24FC4F998();
    sub_24FC4E814();
    v8();
  }
  if (*(void *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_24FC4F978();
    swift_unknownObjectRelease();
  }
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = a2;
  *(void *)(v9 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_24FC3A6D4(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  *(_OWORD *)(v2 + 24) = *(_OWORD *)a2;
  *(unsigned char *)(v2 + 40) = *(unsigned char *)(a2 + 16);
  sub_24FC12064();
  return MEMORY[0x270FA2498](v3, v4, v5);
}

uint64_t sub_24FC3A708()
{
  sub_24FC12030();
  uint64_t v1 = *(void *)(v0 + 24);
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = *(void *)(v0 + 16);
  char v4 = *(unsigned char *)(v0 + 40);
  *(void *)uint64_t v3 = v1;
  *(void *)(v3 + 8) = v2;
  *(unsigned char *)(v3 + 16) = v4;
  sub_24FC16E30(v1, v2, v4);
  sub_24FC12110();
  return v5();
}

uint64_t sub_24FC3A770(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_24FC0C22C;
  return sub_24FC3A6D4(a1, a2);
}

uint64_t sub_24FC3A810(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return sub_24FC4E6E4();
}

uint64_t sub_24FC3A81C(uint64_t a1)
{
  *(void *)(v1 + 24) = a1;
  return sub_24FC4E6E4();
}

uint64_t sub_24FC3A828(uint64_t a1)
{
  *(void *)(v1 + OBJC_IVAR____TtC19GenerativeFunctions35StreamingObjectTokenStreamProcessor_taskMonitor) = a1;
  return sub_24FC4E6E4();
}

uint64_t StreamingObjectTokenStreamProcessor.__allocating_init()()
{
  uint64_t v3 = &type metadata for NoOpStreamSanitizer;
  char v4 = &off_270131638;
  type metadata accessor for StreamingObjectTokenStreamProcessor(0);
  uint64_t v0 = swift_allocObject();
  StreamingObjectTokenStreamProcessor.init(_:)((uint64_t)v2);
  return v0;
}

uint64_t StreamingObjectTokenStreamProcessor.init(_:)(uint64_t a1)
{
  *(void *)(v1 + 16) = 0;
  *(void *)(v1 + 24) = 0;
  uint64_t v3 = v1 + OBJC_IVAR____TtC19GenerativeFunctions35StreamingObjectTokenStreamProcessor_parserStream;
  uint64_t v4 = sub_24FC13C3C(&qword_269A5D3A8);
  sub_24FC4E5AC(v3, v5, v6, v4);
  uint64_t v7 = v1 + OBJC_IVAR____TtC19GenerativeFunctions35StreamingObjectTokenStreamProcessor_parserStreamContinuation;
  uint64_t v8 = sub_24FC13C3C(&qword_269A5D3B8);
  sub_24FC4E5AC(v7, v9, v10, v8);
  uint64_t v11 = OBJC_IVAR____TtC19GenerativeFunctions35StreamingObjectTokenStreamProcessor_objectStreamMap;
  type metadata accessor for StreamSupport();
  uint64_t v12 = swift_allocObject();
  swift_defaultActor_initialize();
  *(void *)(v12 + 112) = MEMORY[0x263F8EE80];
  *(void *)(v1 + v11) = v12;
  *(void *)(v1 + OBJC_IVAR____TtC19GenerativeFunctions35StreamingObjectTokenStreamProcessor_taskMonitor) = 0;
  sub_24FC4DD24(a1, (uint64_t)&v16, &qword_269A5CB98);
  if (v17)
  {
    sub_24FC4DD90(a1, &qword_269A5CB98);
    sub_24FC23F68(&v16, (uint64_t)&v18);
  }
  else
  {
    char v19 = &type metadata for NoOpStreamSanitizer;
    uint64_t v20 = &off_270131638;
    uint64_t v13 = sub_24FC2161C();
    sub_24FC4DD90(v13, v14);
    sub_24FC4DD90((uint64_t)&v16, &qword_269A5CB98);
  }
  sub_24FC23F68(&v18, v1 + OBJC_IVAR____TtC19GenerativeFunctions35StreamingObjectTokenStreamProcessor_sanitizer);
  return v1;
}

uint64_t type metadata accessor for StreamingObjectTokenStreamProcessor(uint64_t a1)
{
  return sub_24FC14B1C(a1, (uint64_t *)&unk_269A5D4F8);
}

uint64_t type metadata accessor for StreamSupport()
{
  return self;
}

uint64_t sub_24FC3AA1C()
{
  uint64_t v1 = sub_24FC13C3C(&qword_269A5CD60);
  sub_24FC14ED0();
  uint64_t v3 = v2;
  MEMORY[0x270FA5388](v4);
  sub_24FC4EB9C();
  sub_24FC13C3C(&qword_269A5D3D8);
  swift_allocBox();
  sub_24FC13C3C(&qword_269A5D3E0);
  sub_24FC4F9B8();
  swift_retain();
  sub_24FC4FAC8();
  sub_24FC3ADE4(v0);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v0, v1);
  return swift_release();
}

uint64_t sub_24FC3AB38(uint64_t a1)
{
  v1[7] = a1;
  v1[8] = sub_24FC13C3C(&qword_269A5D3D8);
  v1[9] = swift_projectBox();
  return MEMORY[0x270FA2498](sub_24FC3ABBC, 0, 0);
}

uint64_t sub_24FC3ABBC()
{
  sub_24FC12030();
  sub_24FC4E8F0();
  swift_task_alloc();
  sub_24FC16C44();
  *(void *)(v0 + 80) = v1;
  *uint64_t v1 = v2;
  v1[1] = sub_24FC3AC60;
  uint64_t v3 = *(void *)(v0 + 64);
  return MEMORY[0x270FA1F70](v0 + 40, v3);
}

uint64_t sub_24FC3AC60()
{
  sub_24FC12030();
  sub_24FC0BAB0();
  sub_24FC1204C();
  void *v2 = v1;
  uint64_t v3 = *v0;
  sub_24FC1203C();
  *uint64_t v4 = v3;
  swift_task_dealloc();
  swift_endAccess();
  sub_24FC12064();
  return MEMORY[0x270FA2498](v5, v6, v7);
}

uint64_t sub_24FC3AD30()
{
  *(_OWORD *)*(void *)(v0 + 56) = *(_OWORD *)(v0 + 40);
  sub_24FC12110();
  return v1();
}

uint64_t sub_24FC3AD54()
{
  sub_24FC12030();
  uint64_t v1 = v0;
  uint64_t v2 = swift_task_alloc();
  uint64_t v3 = (void *)sub_24FC121E0(v2);
  *uint64_t v3 = v4;
  v3[1] = sub_24FC12014;
  return sub_24FC3AB38(v1);
}

uint64_t sub_24FC3ADE4(uint64_t a1)
{
  uint64_t v69 = a1;
  uint64_t v65 = sub_24FC13C3C(&qword_269A5CD60);
  sub_24FC14ED0();
  uint64_t v72 = v3;
  MEMORY[0x270FA5388](v4);
  uint64_t v70 = v5;
  uint64_t v71 = (char *)&v58 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_24FC13C3C(&qword_269A5CE70);
  uint64_t v7 = sub_24FC4E60C(v6);
  MEMORY[0x270FA5388](v7);
  sub_24FC3A238();
  uint64_t v73 = v8;
  uint64_t v9 = sub_24FC13C3C(&qword_269A5D3F8);
  uint64_t v10 = sub_24FC4E60C(v9);
  MEMORY[0x270FA5388](v10);
  sub_24FC3A238();
  uint64_t v66 = v11;
  uint64_t v12 = sub_24FC13C3C(&qword_269A5D400);
  uint64_t v13 = sub_24FC4E60C(v12);
  MEMORY[0x270FA5388](v13);
  sub_24FC126B4();
  uint64_t v16 = v15 - v14;
  uint64_t v17 = sub_24FC13C3C(&qword_269A5D408);
  sub_24FC14ED0();
  uint64_t v19 = v18;
  MEMORY[0x270FA5388](v20);
  sub_24FC126B4();
  uint64_t v23 = v22 - v21;
  uint64_t v75 = sub_24FC13C3C(&qword_269A5D3B8);
  sub_24FC14ED0();
  uint64_t v68 = v24;
  uint64_t v26 = *(void *)(v25 + 64);
  uint64_t v28 = MEMORY[0x270FA5388](v27);
  uint64_t v67 = (char *)&v58 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v28);
  uint64_t v74 = (char *)&v58 - v29;
  sub_24FC13C3C(&qword_269A5D3A8);
  sub_24FC14ED0();
  MEMORY[0x270FA5388](v30);
  sub_24FC126B4();
  uint64_t v35 = v34 - v33;
  if (*(void *)(v1 + 16))
  {
    sub_24FC3B314();
    swift_allocError();
    *(_OWORD *)uint64_t v36 = xmmword_24FC52890;
    *(unsigned char *)(v36 + 16) = 3;
    return swift_willThrow();
  }
  else
  {
    uint64_t v38 = v1;
    uint64_t v63 = v32;
    uint64_t v64 = v31;
    uint64_t v61 = v2;
    uint64_t v39 = v32;
    uint64_t v40 = v35;
    type metadata accessor for JsonStreamEvent(0);
    (*(void (**)(uint64_t, void, uint64_t))(v19 + 104))(v23, *MEMORY[0x263F8F680], v17);
    uint64_t v62 = v40;
    sub_24FC4FA18();
    sub_24FC1B9B8();
    v41();
    uint64_t v42 = v64;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v39 + 16))(v16, v40, v64);
    _s19GenerativeFunctions24JsonObjectFieldContainerOwst_0(v16, 0, 1, v42);
    uint64_t v60 = v38;
    uint64_t v43 = v38 + OBJC_IVAR____TtC19GenerativeFunctions35StreamingObjectTokenStreamProcessor_parserStream;
    sub_24FC4EE08();
    sub_24FC3B360(v16, v43, &qword_269A5D400);
    swift_endAccess();
    uint64_t v59 = *(void (**)(uint64_t, char *, uint64_t))(v68 + 16);
    uint64_t v44 = v66;
    uint64_t v45 = v74;
    v59(v66, v74, v75);
    uint64_t v46 = sub_24FC4EDC4();
    _s19GenerativeFunctions24JsonObjectFieldContainerOwst_0(v46, v47, v48, v49);
    uint64_t v50 = v38 + OBJC_IVAR____TtC19GenerativeFunctions35StreamingObjectTokenStreamProcessor_parserStreamContinuation;
    sub_24FC4EE08();
    sub_24FC3B360(v44, v50, &qword_269A5D3F8);
    swift_endAccess();
    uint64_t v51 = sub_24FC4F9A8();
    _s19GenerativeFunctions24JsonObjectFieldContainerOwst_0(v73, 1, 1, v51);
    sub_24FC4E820();
    v52();
    v59((uint64_t)v67, v45, v75);
    uint64_t v53 = swift_allocObject();
    *(void *)(v53 + 16) = 0;
    *(void *)(v53 + 24) = 0;
    sub_24FC4E8C8();
    v54();
    sub_24FC1B984();
    v55();
    uint64_t v56 = sub_24FC3BE44(v73, (uint64_t)&unk_269A5D420, v53);
    sub_24FC3A810(v56);
    sub_24FC215C8();
    v57();
    return (*(uint64_t (**)(uint64_t, uint64_t))(v63 + 8))(v62, v64);
  }
}

unint64_t sub_24FC3B314()
{
  unint64_t result = qword_269A5D410;
  if (!qword_269A5D410)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_269A5D410);
  }
  return result;
}

uint64_t sub_24FC3B360(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  sub_24FC13C3C(a3);
  sub_24FC12084();
  uint64_t v4 = sub_24FC4EEF4();
  v5(v4);
  return a2;
}

uint64_t sub_24FC3B3B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[4] = a4;
  v5[5] = a5;
  uint64_t v6 = sub_24FC13C3C(&qword_269A5D3B8);
  v5[6] = v6;
  v5[7] = *(void *)(v6 - 8);
  v5[8] = swift_task_alloc();
  uint64_t v7 = sub_24FC13C3C(&qword_269A5CD60);
  v5[9] = v7;
  v5[10] = *(void *)(v7 - 8);
  v5[11] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24FC3B4D4, 0, 0);
}

uint64_t sub_24FC3B4D4()
{
  sub_24FC12258();
  if (qword_269A5C730 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_24FC4F6B8();
  v0[12] = sub_24FC20B5C(v1, (uint64_t)qword_269A5E9F8);
  uint64_t v2 = (void *)sub_24FC4F698();
  os_log_type_t v3 = sub_24FC4FAE8();
  if (sub_24FC2BE88(v3))
  {
    *(_WORD *)sub_24FC4EBB4() = 0;
    sub_24FC2BD64(&dword_24FC09000, v4, v5, "Starting streaming task");
    sub_24FC211C4();
  }
  uint64_t v7 = v0[10];
  uint64_t v6 = v0[11];
  uint64_t v8 = v0[9];
  uint64_t v9 = v0[4];

  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v6, v9, v8);
  uint64_t v10 = (void *)swift_task_alloc();
  v0[13] = v10;
  void *v10 = v0;
  v10[1] = sub_24FC3B628;
  return sub_24FC23430();
}

uint64_t sub_24FC3B628()
{
  sub_24FC12240();
  uint64_t v3 = v2;
  sub_24FC0BAB0();
  uint64_t v5 = v4;
  sub_24FC1204C();
  *uint64_t v6 = v5;
  uint64_t v7 = *v1;
  sub_24FC1203C();
  *uint64_t v8 = v7;
  *(void *)(v5 + 112) = v0;
  swift_task_dealloc();
  if (!v0) {
    *(void *)(v5 + 120) = v3;
  }
  sub_24FC12064();
  return MEMORY[0x270FA2498](v9, v10, v11);
}

uint64_t sub_24FC3B718()
{
  sub_24FC12258();
  uint64_t v2 = v0[7];
  uint64_t v1 = v0[8];
  uint64_t v4 = v0[5];
  uint64_t v3 = v0[6];
  type metadata accessor for JsonStreamParser();
  uint64_t v5 = swift_allocObject();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  uint64_t v6 = (void *)sub_24FC4ECF0();
  v0[16] = v6;
  *uint64_t v6 = v0;
  v6[1] = sub_24FC3B800;
  uint64_t v7 = v0[15];
  uint64_t v8 = v0[8];
  return v10(v7, v8, v5);
}

uint64_t sub_24FC3B800()
{
  sub_24FC12030();
  uint64_t v2 = v1;
  sub_24FC0BAB0();
  uint64_t v4 = v3;
  sub_24FC1204C();
  *uint64_t v5 = v4;
  uint64_t v6 = *v0;
  sub_24FC1203C();
  void *v7 = v6;
  *(void *)(v4 + 136) = v2;
  swift_task_dealloc();
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v4 + 144) = v8;
  *uint64_t v8 = v6;
  v8[1] = sub_24FC3B8FC;
  return sub_24FC1C09C();
}

uint64_t sub_24FC3B8FC()
{
  sub_24FC12030();
  sub_24FC0BAB0();
  uint64_t v1 = *v0;
  sub_24FC1203C();
  void *v2 = v1;
  swift_task_dealloc();
  sub_24FC12064();
  return MEMORY[0x270FA2498](v3, v4, v5);
}

uint64_t sub_24FC3B9C4()
{
  sub_24FC12240();
  uint64_t v0 = (void *)sub_24FC4F698();
  os_log_type_t v1 = sub_24FC4FAE8();
  if (sub_24FC4E70C(v1))
  {
    *(_WORD *)sub_24FC4EBB4() = 0;
    sub_24FC4EF58(&dword_24FC09000, v2, v3, "Finished streaming task");
    sub_24FC211C4();
  }
  swift_release();

  swift_task_dealloc();
  swift_task_dealloc();
  sub_24FC12110();
  return v4();
}

uint64_t sub_24FC3BA80()
{
  sub_24FC1249C();
  uint64_t v1 = v0[14];
  MEMORY[0x2533738D0](v1);
  MEMORY[0x2533738D0](v1);
  uint64_t v2 = (void *)sub_24FC4F698();
  os_log_type_t v3 = sub_24FC4FAF8();
  if (sub_24FC4E70C(v3))
  {
    uint64_t v4 = v0[14];
    uint64_t v5 = (_DWORD *)sub_24FC213F4();
    uint64_t v6 = (void *)swift_slowAlloc();
    *uint64_t v5 = 138412290;
    MEMORY[0x2533738D0](v4);
    uint64_t v7 = _swift_stdlib_bridgeErrorToNSError();
    v0[3] = v7;
    sub_24FC4FB18();
    *uint64_t v6 = v7;
    MEMORY[0x2533738C0](v4);
    MEMORY[0x2533738C0](v4);
    sub_24FC4EA18(&dword_24FC09000, v8, v9, "Finished streaming task with error %@");
    sub_24FC13C3C(qword_269A5CD10);
    swift_arrayDestroy();
    sub_24FC211C4();
    sub_24FC211C4();
  }
  else
  {
    uint64_t v10 = v0[14];
    MEMORY[0x2533738C0](v10);
    MEMORY[0x2533738C0](v10);
  }

  v0[2] = v0[14];
  sub_24FC4FA68();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_24FC12110();
  return v11();
}

uint64_t sub_24FC3BC0C()
{
  sub_24FC38D9C();
  sub_24FC13C3C(&qword_269A5CD60);
  sub_24FC14ED0();
  sub_24FC13C3C(&qword_269A5D3B8);
  sub_24FC14ED0();
  sub_24FC4EE9C();
  sub_24FC4E5D0();
  v0();
  sub_24FC215C8();
  v1();
  sub_24FC38DB4();
  return MEMORY[0x270FA0238](v2, v3, v4);
}

uint64_t sub_24FC3BCF4()
{
  sub_24FC12258();
  uint64_t v2 = sub_24FC13C3C(&qword_269A5CD60);
  sub_24FC12018(v2);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v6 = *(void *)(v5 + 64);
  uint64_t v7 = sub_24FC13C3C(&qword_269A5D3B8);
  sub_24FC4E56C(v7);
  uint64_t v9 = *(unsigned __int8 *)(v8 + 80);
  unint64_t v10 = v4 + v6 + v9;
  uint64_t v11 = v0 + v4;
  uint64_t v12 = v0 + (v10 & ~v9);
  uint64_t v13 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v13;
  *uint64_t v13 = v1;
  v13[1] = sub_24FC12014;
  sub_24FC4ED28();
  return sub_24FC3B3B0(v14, v15, v16, v11, v12);
}

uint64_t AsyncThrowingStream.Continuation<>.completeWithError(_:)()
{
  return sub_24FC4FA68();
}

uint64_t sub_24FC3BE44(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_24FC4F9A8();
  if (_s19GenerativeFunctions24JsonObjectFieldContainerOwet_0(a1, 1, v5) == 1)
  {
    sub_24FC4DD90(a1, &qword_269A5CE70);
  }
  else
  {
    sub_24FC4F998();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(a1, v5);
  }
  if (*(void *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_24FC4F978();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

void sub_24FC3BF8C()
{
  sub_24FC38D9C();
  uint64_t v3 = v0;
  uint64_t v4 = sub_24FC13C3C(&qword_269A5D400);
  uint64_t v5 = sub_24FC4E60C(v4);
  MEMORY[0x270FA5388](v5);
  sub_24FC4EB84();
  uint64_t v6 = sub_24FC13C3C(&qword_269A5D3B8);
  sub_24FC14ED0();
  uint64_t v8 = v7;
  MEMORY[0x270FA5388](v9);
  sub_24FC4EB9C();
  uint64_t v10 = sub_24FC13C3C(&qword_269A5D3F8);
  uint64_t v11 = sub_24FC4E60C(v10);
  uint64_t v12 = MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)v32 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)v32 - v15;
  uint64_t v17 = sub_24FC13C3C(&qword_269A5CE70);
  uint64_t v18 = sub_24FC4E60C(v17);
  MEMORY[0x270FA5388](v18);
  sub_24FC126B4();
  uint64_t v21 = v20 - v19;
  uint64_t v22 = sub_24FC4F9A8();
  sub_24FC4E5AC(v21, v23, v24, v22);
  uint64_t v25 = (void *)swift_allocObject();
  v25[2] = 0;
  v25[3] = 0;
  v25[4] = v3;
  swift_retain();
  sub_24FC3A56C(v21, (uint64_t)&unk_269A5D430, (uint64_t)v25);
  swift_release();
  if (*(void *)(v3 + 24))
  {
    swift_retain();
    sub_24FC13C3C(&qword_269A5CBA0);
    sub_24FC4F9D8();
    swift_release();
  }
  sub_24FC3A81C(0);
  if (*(void *)(v3 + 16))
  {
    swift_retain();
    sub_24FC13C3C(&qword_269A5CBA0);
    sub_24FC4F9D8();
    swift_release();
  }
  uint64_t v26 = v3 + OBJC_IVAR____TtC19GenerativeFunctions35StreamingObjectTokenStreamProcessor_parserStreamContinuation;
  sub_24FC2BDD8();
  sub_24FC4DD24(v26, (uint64_t)v16, &qword_269A5D3F8);
  if (_s19GenerativeFunctions24JsonObjectFieldContainerOwet_0((uint64_t)v16, 1, v6))
  {
    sub_24FC4DD90((uint64_t)v16, &qword_269A5D3F8);
  }
  else
  {
    sub_24FC4EA90();
    sub_24FC4E820();
    v27();
    sub_24FC4DD90((uint64_t)v16, &qword_269A5D3F8);
    v32[0] = 0;
    sub_24FC4FA68();
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v2, v6);
  }
  uint64_t v28 = sub_24FC13C3C(&qword_269A5D3A8);
  sub_24FC4E5AC(v1, v29, v30, v28);
  uint64_t v31 = v3 + OBJC_IVAR____TtC19GenerativeFunctions35StreamingObjectTokenStreamProcessor_parserStream;
  sub_24FC4E8F0();
  sub_24FC3B360(v1, v31, &qword_269A5D400);
  swift_endAccess();
  sub_24FC4EEBC((uint64_t)v14, 1);
  sub_24FC4E8F0();
  sub_24FC3B360((uint64_t)v14, v26, &qword_269A5D3F8);
  swift_endAccess();
  sub_24FC3A810(0);
  if (*(void *)(v3 + OBJC_IVAR____TtC19GenerativeFunctions35StreamingObjectTokenStreamProcessor_taskMonitor))
  {
    swift_retain();
    sub_24FC13C3C(&qword_269A5CBA0);
    sub_24FC4F9D8();
    swift_release();
  }
  sub_24FC3A828(0);
  sub_24FC38DB4();
}

uint64_t sub_24FC3C34C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a4;
  return MEMORY[0x270FA2498](sub_24FC3C36C, 0, 0);
}

uint64_t sub_24FC3C36C()
{
  sub_24FC12030();
  *(void *)(v0 + 24) = *(void *)(*(void *)(v0 + 16)
                                   + OBJC_IVAR____TtC19GenerativeFunctions35StreamingObjectTokenStreamProcessor_objectStreamMap);
  swift_retain();
  uint64_t v1 = sub_24FC4E580();
  return MEMORY[0x270FA2498](v1, v2, v3);
}

uint64_t sub_24FC3C3E0()
{
  sub_24FC12030();
  sub_24FC49354(0);
  swift_release();
  sub_24FC0BAC8();
  return v0();
}

uint64_t sub_24FC3C444()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_24FC3C484()
{
  sub_24FC12240();
  uint64_t v1 = *(void *)(v0 + 32);
  uint64_t v2 = swift_task_alloc();
  uint64_t v3 = (void *)sub_24FC121E0(v2);
  *uint64_t v3 = v4;
  v3[1] = sub_24FC0C22C;
  sub_24FC4ED28();
  return sub_24FC3C34C(v5, v6, v7, v1);
}

uint64_t AsyncThrowingStream.Continuation<>.complete()()
{
  return sub_24FC4FA68();
}

uint64_t sub_24FC3C560()
{
  sub_24FC12240();
  *(void *)(v1 + 40) = v2;
  *(void *)(v1 + 48) = v0;
  *(void *)(v1 + 24) = v3;
  *(void *)(v1 + 32) = v4;
  *(unsigned char *)(v1 + 168) = v5;
  *(void *)(v1 + 16) = v6;
  uint64_t v7 = sub_24FC13C3C(&qword_269A5CE70);
  sub_24FC4E60C(v7);
  *(void *)(v1 + 56) = sub_24FC12200();
  sub_24FC1607C(&qword_269A5CBA0);
  sub_24FC4EED4();
  uint64_t v8 = sub_24FC4FA48();
  *(void *)(v1 + 64) = v8;
  sub_24FC12018(v8);
  *(void *)(v1 + 72) = v9;
  *(void *)(v1 + 80) = sub_24FC12200();
  sub_24FC4EED4();
  uint64_t v10 = sub_24FC4FA78();
  *(void *)(v1 + 88) = v10;
  sub_24FC12018(v10);
  *(void *)(v1 + 96) = v11;
  *(void *)(v1 + 104) = *(void *)(v12 + 64);
  *(void *)(v1 + 112) = sub_24FC30200();
  *(void *)(v1 + 120) = swift_task_alloc();
  uint64_t v13 = sub_24FC4F678();
  *(void *)(v1 + 128) = v13;
  sub_24FC12018(v13);
  *(void *)(v1 + 136) = v14;
  *(void *)(v1 + 144) = *(void *)(v15 + 64);
  *(void *)(v1 + 152) = sub_24FC30200();
  *(void *)(v1 + 160) = swift_task_alloc();
  sub_24FC12064();
  return MEMORY[0x270FA2498](v16, v17, v18);
}

uint64_t sub_24FC3C6C8()
{
  if (*(void *)(*(void *)(v0 + 48) + 24))
  {
    sub_24FC3B314();
    sub_24FC212F0();
    *uint64_t v1 = xmmword_24FC52890;
    sub_24FC4E554((uint64_t)v1, 3);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    sub_24FC0BAC8();
  }
  else
  {
    uint64_t v3 = *(void *)(v0 + 80);
    char v33 = *(unsigned char *)(v0 + 168);
    sub_24FC4EBCC();
    swift_getAssociatedTypeWitness();
    sub_24FC4EA90();
    swift_getAssociatedConformanceWitness();
    sub_24FC4F688();
    sub_24FC3A4D0(v3);
    sub_24FC4FA18();
    sub_24FC4EA78();
    v4();
    if ((v33 & 1) == 0)
    {
      uint64_t v5 = *(void *)(v0 + 96);
      uint64_t v6 = *(void *)(v0 + 104);
      uint64_t v8 = *(void *)(v0 + 48);
      uint64_t v7 = *(void *)(v0 + 56);
      uint64_t v9 = *(void *)(v0 + 24);
      uint64_t v10 = sub_24FC4F9A8();
      long long v34 = *(_OWORD *)(v0 + 32);
      sub_24FC4E5AC(v7, v11, v12, v10);
      sub_24FC4E974();
      sub_24FC4E820();
      v13();
      unint64_t v14 = (v6 + ((*(unsigned __int8 *)(v5 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80)) + 7) & 0xFFFFFFFFFFFFFFF8;
      uint64_t v15 = swift_allocObject();
      *(void *)(v15 + 16) = 0;
      *(void *)(v15 + 24) = 0;
      *(_OWORD *)(v15 + 32) = v34;
      *(void *)(v15 + 48) = v9;
      sub_24FC4E628();
      v16();
      *(void *)(v15 + v14) = v8;
      swift_retain();
      uint64_t v17 = sub_24FC3BE44(v7, (uint64_t)&unk_269A5D458, v15);
      sub_24FC3A828(v17);
    }
    uint64_t v18 = *(void *)(v0 + 56);
    uint64_t v32 = *(void *)(v0 + 48);
    uint64_t v19 = sub_24FC4F9A8();
    long long v31 = *(_OWORD *)(v0 + 32);
    sub_24FC4E5AC(v18, v20, v21, v19);
    sub_24FC4E820();
    v22();
    sub_24FC4EE3C();
    sub_24FC4E820();
    v23();
    uint64_t v24 = swift_allocObject();
    *(void *)(v24 + 16) = 0;
    *(void *)(v24 + 24) = 0;
    *(_OWORD *)(v24 + 32) = v31;
    *(void *)(v24 + 48) = v32;
    sub_24FC1B984();
    v25();
    sub_24FC1B984();
    v26();
    swift_retain();
    uint64_t v27 = sub_24FC3BE44(v18, (uint64_t)&unk_269A5D448, v24);
    sub_24FC3A81C(v27);
    sub_24FC4E848();
    v28();
    sub_24FC4E65C();
    v29();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    sub_24FC12110();
  }
  return v2();
}

uint64_t sub_24FC3CAE8(double a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  *(void *)(v7 + 40) = a6;
  *(void *)(v7 + 48) = a7;
  *(void *)(v7 + 32) = a5;
  *(double *)(v7 + 24) = a1;
  sub_24FC13C3C(&qword_269A5D5A8);
  *(void *)(v7 + 56) = swift_task_alloc();
  uint64_t v8 = sub_24FC4F3E8();
  *(void *)(v7 + 64) = v8;
  *(void *)(v7 + 72) = *(void *)(v8 - 8);
  *(void *)(v7 + 80) = swift_task_alloc();
  uint64_t v9 = sub_24FC4FBC8();
  *(void *)(v7 + 88) = v9;
  *(void *)(v7 + 96) = *(void *)(v9 - 8);
  *(void *)(v7 + 104) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24FC3CC3C, 0, 0);
}

uint64_t sub_24FC3CC3C()
{
  sub_24FC12240();
  sub_24FC4FD68();
  sub_24FC4FBB8();
  uint64_t v1 = (void *)sub_24FC4ECF0();
  *(void *)(v0 + 112) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_24FC3CD00;
  uint64_t v2 = sub_24FC2161C();
  return v4(v2);
}

uint64_t sub_24FC3CD00()
{
  sub_24FC12240();
  sub_24FC0BAB0();
  sub_24FC1204C();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  sub_24FC1203C();
  *uint64_t v5 = v4;
  *(void *)(v6 + 120) = v0;
  swift_task_dealloc();
  sub_24FC2161C();
  sub_24FC4EA78();
  v7();
  sub_24FC12064();
  return MEMORY[0x270FA2498](v8, v9, v10);
}

uint64_t sub_24FC3CE30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  sub_24FC30158();
  sub_24FC304F0();
  uint64_t v14 = v12[9];
  uint64_t v13 = v12[10];
  uint64_t v15 = v12[7];
  uint64_t v16 = v12[8];
  uint64_t v17 = sub_24FC4F348();
  sub_24FC4E5AC(v15, v18, v19, v17);
  sub_24FC4F3D8();
  (*(void (**)(uint64_t, void, uint64_t))(v14 + 104))(v13, *MEMORY[0x263F40B50], v16);
  sub_24FC4F408();
  sub_24FC4D6F4(&qword_269A5D5B8, MEMORY[0x263F40B88]);
  uint64_t v20 = sub_24FC212F0();
  sub_24FC4F3F8();
  sub_24FC4E700();
  v21();
  v12[2] = v20;
  sub_24FC1607C(&qword_269A5CBA0);
  sub_24FC4FA78();
  sub_24FC4FA68();
  sub_24FC3BF8C();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_24FC12110();
  sub_24FC23FDC();
  return v23(v22, v23, v24, v25, v26, v27, v28, v29, a9, a10, a11, a12);
}

uint64_t sub_24FC3CFAC()
{
  sub_24FC12030();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24FC3D024(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[48] = a7;
  v8[49] = a8;
  v8[46] = a5;
  v8[47] = a6;
  v8[45] = a4;
  uint64_t v9 = sub_24FC4F6B8();
  v8[50] = v9;
  v8[51] = *(void *)(v9 - 8);
  v8[52] = swift_task_alloc();
  v8[53] = sub_24FC13C3C(&qword_269A5D5D0);
  v8[54] = swift_task_alloc();
  v8[55] = type metadata accessor for JsonFieldValueEvent(0);
  v8[56] = swift_task_alloc();
  v8[57] = swift_task_alloc();
  v8[58] = swift_task_alloc();
  v8[59] = swift_task_alloc();
  v8[60] = type metadata accessor for JsonObjectFieldContainer();
  v8[61] = swift_task_alloc();
  v8[62] = swift_task_alloc();
  uint64_t v10 = sub_24FC13C3C(&qword_269A5D5D8);
  v8[63] = v10;
  v8[64] = *(void *)(v10 - 8);
  v8[65] = swift_task_alloc();
  sub_24FC13C3C(&qword_269A5D468);
  v8[66] = swift_task_alloc();
  v8[67] = swift_task_alloc();
  v8[68] = swift_task_alloc();
  uint64_t v11 = type metadata accessor for FieldStreamingSupport(0);
  v8[69] = v11;
  v8[70] = *(void *)(v11 - 8);
  v8[71] = swift_task_alloc();
  v8[72] = swift_task_alloc();
  v8[73] = swift_task_alloc();
  sub_24FC13C3C(&qword_269A5D470);
  v8[74] = swift_task_alloc();
  v8[75] = swift_task_alloc();
  v8[76] = swift_task_alloc();
  v8[77] = sub_24FC13C3C(&qword_269A5CCC8);
  v8[78] = swift_task_alloc();
  v8[79] = swift_task_alloc();
  v8[80] = swift_task_alloc();
  v8[81] = swift_task_alloc();
  v8[82] = swift_task_alloc();
  v8[83] = swift_task_alloc();
  v8[84] = swift_task_alloc();
  v8[85] = swift_task_alloc();
  v8[86] = swift_task_alloc();
  v8[87] = swift_task_alloc();
  v8[88] = swift_task_alloc();
  v8[89] = swift_task_alloc();
  v8[90] = swift_task_alloc();
  v8[91] = swift_task_alloc();
  v8[92] = swift_task_alloc();
  v8[93] = sub_24FC1607C(&qword_269A5CBA0);
  uint64_t v12 = sub_24FC4FA28();
  v8[94] = v12;
  v8[95] = *(void *)(v12 - 8);
  v8[96] = swift_task_alloc();
  v8[97] = swift_task_alloc();
  uint64_t v13 = type metadata accessor for ObjectStreamingSupport(0);
  v8[98] = v13;
  v8[99] = *(void *)(v13 - 8);
  v8[100] = swift_task_alloc();
  v8[101] = swift_task_alloc();
  v8[102] = swift_task_alloc();
  v8[103] = swift_task_alloc();
  v8[104] = swift_task_alloc();
  v8[105] = swift_task_alloc();
  v8[106] = swift_task_alloc();
  v8[107] = swift_task_alloc();
  v8[108] = swift_task_alloc();
  v8[109] = swift_task_alloc();
  v8[110] = swift_task_alloc();
  v8[111] = swift_task_alloc();
  uint64_t v14 = sub_24FC4F388();
  v8[112] = v14;
  v8[113] = *(void *)(v14 - 8);
  v8[114] = swift_task_alloc();
  v8[115] = swift_task_alloc();
  v8[116] = swift_task_alloc();
  v8[117] = swift_task_alloc();
  v8[118] = swift_task_alloc();
  v8[119] = swift_task_alloc();
  v8[120] = swift_task_alloc();
  v8[121] = swift_task_alloc();
  v8[122] = swift_task_alloc();
  v8[123] = swift_task_alloc();
  v8[124] = swift_task_alloc();
  v8[125] = swift_task_alloc();
  v8[126] = swift_task_alloc();
  v8[127] = swift_task_alloc();
  v8[128] = swift_task_alloc();
  v8[129] = swift_task_alloc();
  v8[130] = swift_task_alloc();
  v8[131] = swift_task_alloc();
  v8[132] = swift_task_alloc();
  v8[133] = swift_task_alloc();
  v8[134] = swift_task_alloc();
  v8[135] = swift_task_alloc();
  v8[136] = swift_task_alloc();
  v8[137] = swift_task_alloc();
  v8[138] = swift_task_alloc();
  v8[139] = swift_task_alloc();
  v8[140] = type metadata accessor for JsonStreamEvent(0);
  v8[141] = swift_task_alloc();
  v8[142] = swift_task_alloc();
  v8[143] = swift_task_alloc();
  v8[144] = swift_task_alloc();
  sub_24FC13C3C(&qword_269A5D5E0);
  v8[145] = swift_task_alloc();
  uint64_t v15 = sub_24FC13C3C(&qword_269A5D3A8);
  v8[146] = v15;
  v8[147] = *(void *)(v15 - 8);
  v8[148] = swift_task_alloc();
  uint64_t v16 = sub_24FC13C3C(&qword_269A5D5E8);
  v8[149] = v16;
  v8[150] = *(void *)(v16 - 8);
  v8[151] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24FC3D870, 0, 0);
}

uint64_t sub_24FC3D870()
{
  sub_24FC12258();
  uint64_t v1 = v0[148];
  uint64_t v2 = MEMORY[0x263F8EE78];
  v0[32] = MEMORY[0x263F8EE78];
  v0[43] = MEMORY[0x263F8EE88];
  v0[39] = v2;
  sub_24FC44EBC(v1);
  sub_24FC4F9B8();
  sub_24FC4E5C4();
  v3();
  v0[152] = OBJC_IVAR____TtC19GenerativeFunctions35StreamingObjectTokenStreamProcessor_sanitizer;
  v0[153] = OBJC_IVAR____TtC19GenerativeFunctions35StreamingObjectTokenStreamProcessor_objectStreamMap;
  uint64_t v4 = swift_task_alloc();
  uint64_t v5 = (void *)sub_24FC4E668(v4);
  *uint64_t v5 = v6;
  v5[1] = sub_24FC3D980;
  uint64_t v7 = sub_24FC4E984();
  return MEMORY[0x270FA20F8](v7);
}

uint64_t sub_24FC3D980()
{
  sub_24FC12030();
  sub_24FC0BAB0();
  uint64_t v3 = v2;
  sub_24FC1204C();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  sub_24FC1203C();
  *uint64_t v6 = v5;
  swift_task_dealloc();
  if (v0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  sub_24FC12064();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

void sub_24FC3DA68()
{
  uint64_t v582 = v0;
  unint64_t v1 = v0 + 256;
  int v2 = _s19GenerativeFunctions24JsonObjectFieldContainerOwet_0(*(void *)(v0 + 1160), 1, *(void *)(v0 + 1120));
  unint64_t v3 = 0x269A5C000uLL;
  uint64_t v4 = MEMORY[0x263F8EE58];
  uint64_t v577 = v0;
  if (v2 == 1)
  {
    sub_24FC4E950();
    v5();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (*(void *)(*(void *)(v0 + 256) + 16))
    {
      if (qword_269A5C738 != -1) {
        swift_once();
      }
      uint64_t v6 = v0;
      uint64_t v9 = v0 + 408;
      uint64_t v8 = *(void *)(v0 + 408);
      uint64_t v7 = *(void *)(v9 + 8);
      uint64_t v10 = *(void *)(v6 + 400);
      uint64_t v11 = sub_24FC20B5C(v10, (uint64_t)qword_269A5EA10);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v7, v11, v10);
      uint64_t v12 = sub_24FC4F698();
      os_log_type_t v13 = sub_24FC4FAF8();
      if (os_log_type_enabled(v12, v13))
      {
        uint64_t v14 = (uint8_t *)sub_24FC213F4();
        sub_24FC21434();
        v568 = v14;
        *(_DWORD *)uint64_t v14 = 136315138;
        sub_24FC2BDD8();
        uint64_t v15 = *(void *)v1;
        int64_t v16 = *(void *)(*(void *)v1 + 16);
        uint64_t v17 = MEMORY[0x263F8EE78];
        uint64_t v0 = v6;
        if (v16)
        {
          *(void *)type = v12;
          uint64_t v18 = *(void *)(v6 + 904);
          uint64_t v580 = MEMORY[0x263F8EE78];
          swift_bridgeObjectRetain();
          sub_24FC4B94C(0, v16, 0);
          uint64_t v19 = v15 + ((*(unsigned __int8 *)(v18 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80));
          uint64_t v20 = *(void *)(v18 + 72);
          uint64_t v21 = *(void (**)(void))(v18 + 16);
          do
          {
            sub_24FC4E820();
            v21();
            uint64_t v22 = sub_24FC4F358();
            uint64_t v24 = v23;
            sub_24FC4EC9C();
            sub_24FC4E65C();
            v25();
            uint64_t v17 = v580;
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            {
              sub_24FC4B94C(0, *(void *)(v580 + 16) + 1, 1);
              uint64_t v17 = v580;
            }
            unint64_t v27 = *(void *)(v17 + 16);
            unint64_t v26 = *(void *)(v17 + 24);
            if (v27 >= v26 >> 1)
            {
              sub_24FC4B94C((char *)(v26 > 1), v27 + 1, 1);
              uint64_t v17 = v580;
            }
            *(void *)(v17 + 16) = v27 + 1;
            uint64_t v28 = v17 + 16 * v27;
            *(void *)(v28 + 32) = v22;
            *(void *)(v28 + 40) = v24;
            v19 += v20;
            --v16;
          }
          while (v16);
          swift_bridgeObjectRelease();
          uint64_t v0 = v577;
          unint64_t v3 = 0x269A5C000;
          uint64_t v12 = *(NSObject **)type;
        }
        uint64_t v46 = *(void *)(v0 + 408);
        *(void *)typec = *(void *)(v0 + 416);
        uint64_t v47 = *(void *)(v0 + 400);
        unint64_t v44 = (unint64_t)(v568 + 4);
        *(void *)(v0 + 216) = v17;
        sub_24FC13C3C(&qword_269A5D5F0);
        sub_24FC4DBB0(&qword_269A5D5F8, &qword_269A5D5F0);
        sub_24FC4F808();
        swift_bridgeObjectRelease();
        uint64_t v48 = sub_24FC4EA9C();
        *(void *)(v0 + 224) = sub_24FC49DD0(v48, v49, v50);
        sub_24FC4FB18();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_24FC09000, v12, v13, "An object remained incomplete in the stack, object_id=%s", v568, 0xCu);
        swift_arrayDestroy();
        sub_24FC211C4();
        sub_24FC211C4();

        (*(void (**)(os_log_type_t *, uint64_t))(v46 + 8))(*(os_log_type_t **)typec, v47);
      }
      else
      {
        unint64_t v44 = *(void *)(v6 + 400);

        sub_24FC4EC9C();
        sub_24FC1B9B8();
        v45();
        uint64_t v0 = v6;
      }
      sub_24FC3B314();
      uint64_t v41 = (uint64_t *)sub_24FC212F0();
      *uint64_t v51 = xmmword_24FC528A0;
      sub_24FC4E554((uint64_t)v51, 3);
      goto LABEL_193;
    }
    *(void *)(v0 + 1408) = *(void *)(*(void *)(v0 + 360) + *(void *)(v0 + 1224));
LABEL_199:
    swift_retain();
    sub_24FC4E580();
    sub_24FC4E890();
    MEMORY[0x270FA2498](v437, v438, v439);
    return;
  }
  sub_24FC45A60();
  if (qword_269A5C738 != -1) {
    swift_once();
  }
  uint64_t v538 = v0 + 240;
  uint64_t v539 = v0 + 248;
  uint64_t v541 = v0 + 280;
  uint64_t typea = v0 + 288;
  uint64_t v548 = v0 + 192;
  uint64_t v29 = v0 + 344;
  v558 = (void (*)(void))(v0 + 352);
  uint64_t v30 = sub_24FC20B5C(*(void *)(v0 + 400), (uint64_t)qword_269A5EA10);
  sub_24FC4A574();
  v569 = v30;
  long long v31 = sub_24FC4F698();
  os_log_type_t v32 = sub_24FC4FAE8();
  BOOL v33 = os_log_type_enabled(v31, v32);
  uint64_t v34 = *(void *)(v0 + 1144);
  uint64_t v563 = v0 + 344;
  os_log_t v552 = (os_log_t)(v0 + 304);
  if (v33)
  {
    uint64_t v29 = v4;
    uint64_t v35 = sub_24FC213F4();
    uint64_t v580 = sub_24FC21434();
    *(_DWORD *)uint64_t v35 = 136315138;
    sub_24FC4A574();
    uint64_t v36 = sub_24FC4F828();
    *(void *)(v35 + 4) = sub_24FC49DD0(v36, v37, &v580);
    swift_bridgeObjectRelease();
    sub_24FC46FBC(v34, (void (*)(void))type metadata accessor for JsonStreamEvent);
    _os_log_impl(&dword_24FC09000, v31, v32, "Received stream event %s", (uint8_t *)v35, 0xCu);
    swift_arrayDestroy();
    sub_24FC211C4();
    sub_24FC211C4();
  }
  else
  {
    sub_24FC46FBC(v34, (void (*)(void))type metadata accessor for JsonStreamEvent);
  }

  unint64_t v38 = v0 + 312;
  uint64_t v39 = v0 + 320;
  uint64_t v40 = (void (*)(void))(v0 + 328);
  uint64_t v41 = (uint64_t *)(v0 + 336);
  uint64_t v42 = *(void *)(v0 + 1128);
  sub_24FC4A574();
  sub_24FC4EC9C();
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t v39 = v0 + 312;
      uint64_t v52 = *(void *)(v0 + 904);
      uint64_t v53 = *(void *)(v0 + 896);
      uint64_t v54 = *(void *)(v0 + 720);
      uint64_t v56 = *(void (**)(void))(v52 + 32);
      uint64_t v55 = v52 + 32;
      uint64_t v40 = v56;
      sub_24FC4E628();
      v56();
      sub_24FC4392C(v54);
      sub_24FC4E53C(v54, 1, v53);
      if (v333)
      {
        sub_24FC4E6EC();
        sub_24FC4EE90();
        uint64_t v41 = *(uint64_t **)(v0 + 720);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_24FC4DD90((uint64_t)v41, &qword_269A5CCC8);
        sub_24FC3B314();
        sub_24FC212F0();
        sub_24FC4E52C();
        uint64_t v59 = v58 + 29;
        goto LABEL_36;
      }
      sub_24FC4E628();
      v40();
      sub_24FC4EBD8();
      char v154 = sub_24FC4F368();
      if ((v154 & 1) == 0)
      {
        sub_24FC4E9D8();
        goto LABEL_188;
      }
      uint64_t v155 = *(void *)(v0 + 784);
      uint64_t v54 = *(void *)(v0 + 608);
      sub_24FC43AF4(v54);
      sub_24FC4E53C(v54, 1, v155);
      if (v333)
      {
        sub_24FC4E9D8();
        sub_24FC4EEE8();
        uint64_t v156 = *(void *)(v0 + 608);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_24FC4DD90(v156, &qword_269A5D470);
        sub_24FC4E59C();
        sub_24FC4FB78();
        swift_bridgeObjectRelease();
        sub_24FC4E590();
        sub_24FC4E5DC(v157 + 3);
        sub_24FC4D6F4(&qword_269A5CCE0, MEMORY[0x263F07508]);
        sub_24FC4FC68();
        sub_24FC4EA60();
        swift_bridgeObjectRelease();
        uint64_t v0 = v581;
        sub_24FC3B314();
        uint64_t v158 = sub_24FC212F0();
        sub_24FC4EF44(v158, v159);
        goto LABEL_190;
      }
      sub_24FC4E744();
      uint64_t v386 = *(void *)(v385 + 896);
      sub_24FC45A60();
      uint64_t v387 = sub_24FC4EBD8();
      v388(v387);
      v389 = sub_24FC4F698();
      os_log_type_t v390 = sub_24FC4FAE8();
      BOOL v391 = sub_24FC4EC0C(v390);
      uint64_t v392 = *(void *)(v0 + 904);
      if (v391)
      {
        v393 = (uint8_t *)sub_24FC213F4();
        uint64_t v580 = sub_24FC21434();
        *(_DWORD *)v393 = 136315138;
        sub_24FC4D6F4(&qword_269A5CCE0, MEMORY[0x263F07508]);
        uint64_t v394 = sub_24FC4FC68();
        *uint64_t v41 = sub_24FC49DD0(v394, v395, &v580);
        sub_24FC4FB18();
        swift_bridgeObjectRelease();
        v396 = *(void (**)(void))(v392 + 8);
        sub_24FC215C8();
        v396();
        _os_log_impl(&dword_24FC09000, v389, (os_log_type_t)v386, "Root object ended with id=%s", v393, 0xCu);
        swift_arrayDestroy();
        sub_24FC211C4();
        sub_24FC211C4();
      }
      else
      {
        v396 = *(void (**)(void))(v392 + 8);
        sub_24FC215C8();
        v396();
      }

      uint64_t v162 = *(void *)(v0 + 1152);
      sub_24FC4E854();
      uint64_t v452 = *(void *)(v0 + 864);
      sub_24FC43C90(0);
      sub_24FC46FBC(v452, (void (*)(void))type metadata accessor for ObjectStreamingSupport);
      sub_24FC1B9B8();
      v396();
      sub_24FC1B9B8();
      v396();
      goto LABEL_214;
    case 2u:
      uint64_t v60 = *(void *)(v0 + 1128);
      uint64_t v61 = *(void *)(v0 + 1064);
      sub_24FC4ED60();
      uint64_t v62 = (uint64_t *)(v60 + *(int *)(sub_24FC13C3C(&qword_269A5CC70) + 48));
      uint64_t v63 = *v62;
      unint64_t v564 = v62[1];
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 32))(v61, v60, v29);
      if (*(void *)(*(void *)(v0 + 256) + 16))
      {
        uint64_t v66 = *(void *)(v0 + 904);
        uint64_t v67 = *(void *)(v0 + 896);
        uint64_t v68 = *(void *)(v0 + 712);
        uint64_t v70 = *(void (**)(void))(v66 + 16);
        unint64_t v38 = v66 + 16;
        uint64_t v69 = v70;
        *(_DWORD *)(v0 + 140) = *(_DWORD *)(v38 + 64);
        *(void *)(v0 + 1296) = *(void *)(v38 + 56);
        *(void *)(v0 + 1304) = v70;
        *(void *)(v0 + 1312) = v38 & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
        sub_24FC4EE54();
        v70();
        _s19GenerativeFunctions24JsonObjectFieldContainerOwst_0(v68, 0, 1, v67);
        sub_24FC4E53C(v68, 1, v67);
        if (!v333)
        {
          uint64_t v559 = v63;
          sub_24FC4DD90(*(void *)(v0 + 712), &qword_269A5CCC8);
          v542 = v69;
          sub_24FC4EF08();
          v69();
          uint64_t v71 = (void (*)(void))v564;
          swift_bridgeObjectRetain_n();
          uint64_t v72 = sub_24FC4F698();
          os_log_type_t typeb = sub_24FC4FAE8();
          BOOL v73 = os_log_type_enabled(v72, typeb);
          uint64_t v74 = *(NSObject **)(v0 + 1056);
          uint64_t v75 = *(void *)(v0 + 904);
          if (v73)
          {
            uint64_t v76 = swift_slowAlloc();
            uint64_t v580 = sub_24FC4EDF0();
            *(_DWORD *)uint64_t v76 = 136315394;
            uint64_t v77 = sub_24FC4F358();
            logb = v72;
            *(void *)uint64_t v39 = sub_24FC49DD0(v77, v78, &v580);
            sub_24FC4FB18();
            swift_bridgeObjectRelease();
            uint64_t v79 = *(void (**)(void))(v75 + 8);
            sub_24FC4E5C4();
            v79();
            *(_WORD *)(v76 + 12) = 2080;
            swift_bridgeObjectRetain();
            unint64_t v44 = v559;
            *(void *)uint64_t v40 = sub_24FC49DD0(v559, v564, &v580);
            sub_24FC4FB18();
            swift_bridgeObjectRelease_n();
            uint64_t v74 = logb;
            _os_log_impl(&dword_24FC09000, logb, typeb, "Starting a child object with object id=%s for field=%s", (uint8_t *)v76, 0x16u);
            swift_arrayDestroy();
            sub_24FC211C4();
            uint64_t v71 = (void (*)(void))v564;
            sub_24FC211C4();
          }
          else
          {
            uint64_t v79 = *(void (**)(void))(v75 + 8);
            sub_24FC4E5C4();
            v79();

            sub_24FC4EDD8();
            unint64_t v44 = v559;
          }
          *(void *)(v0 + 1320) = v79;
          uint64_t v41 = *(uint64_t **)(v0 + 312);
          if (v41[2])
          {
            uint64_t v316 = *(void *)(v0 + 792);
            *(_DWORD *)(v0 + 164) = *(_DWORD *)(v316 + 80);
            *(void *)(v0 + 1360) = *(void *)(v316 + 72);
            sub_24FC4A574();
            swift_bridgeObjectRetain();
            uint64_t v317 = sub_24FC213D8();
            uint64_t v319 = sub_24FC396FC(v317, v318);
            swift_bridgeObjectRelease();
            if (v319)
            {
              if (*(void *)(*(void *)(*(void *)(v0 + 840) + *(int *)(*(void *)(v0 + 784) + 20)) + 16))
              {
                swift_bridgeObjectRetain();
                swift_bridgeObjectRetain();
                uint64_t v322 = sub_24FC213D8();
                unint64_t v324 = sub_24FC17DD4(v322, v323);
                if (v325)
                {
                  uint64_t v327 = *(void *)(v0 + 544);
                  sub_24FC4EAF8(v324, *(void *)(v0 + 560));
                  sub_24FC4A574();
                  sub_24FC4EEBC(v327, 0);
                }
                else
                {
                  sub_24FC4E5AC(*(void *)(v0 + 544), v325, v326, *(void *)(v0 + 552));
                }
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
              }
              else
              {
                sub_24FC4E5AC(*(void *)(v0 + 544), v320, v321, *(void *)(v0 + 552));
              }
              uint64_t v456 = *(void *)(v0 + 544);
              sub_24FC4E53C(v456, 1, *(void *)(v0 + 552));
              if (!v333)
              {
                uint64_t v576 = *(void *)(v0 + 1224);
                uint64_t v463 = *(void *)(v0 + 832);
                uint64_t v464 = *(void *)(v0 + 784);
                uint64_t v465 = *(void *)(v0 + 360);
                swift_bridgeObjectRelease();
                sub_24FC45A60();
                sub_24FC4E860();
                sub_24FC4EE54();
                v466();
                sub_24FC4465C();
                uint64_t v468 = v467;
                swift_bridgeObjectRelease();
                *(void *)(v463 + *(int *)(v464 + 20)) = v468;
                *(void *)(v0 + 1368) = *(void *)(v465 + v576);
                goto LABEL_199;
              }
              uint64_t v575 = *(void *)(v0 + 1208);
              uint64_t v457 = *(void *)(v0 + 1200);
              uint64_t v550 = *(void *)(v0 + 1152);
              os_log_t v557 = *(os_log_t *)(v0 + 1192);
              sub_24FC4E744();
              uint64_t v458 = *(void *)(v0 + 840);
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              sub_24FC4DD90(v456, &qword_269A5D468);
              sub_24FC4E678();
              swift_bridgeObjectRelease();
              sub_24FC4EAB8();
              sub_24FC4E5DC(v459);
              sub_24FC4F898();
              swift_bridgeObjectRelease();
              uint64_t v0 = v581;
              sub_24FC3B314();
              uint64_t v460 = sub_24FC212F0();
              sub_24FC4EF44(v460, v461);
              unint64_t v44 = (unint64_t)v462;
              swift_willThrow();
              sub_24FC46FBC(v458, (void (*)(void))type metadata accessor for ObjectStreamingSupport);
              sub_24FC4E5D0();
              v79();
              sub_24FC46FBC(v550, (void (*)(void))type metadata accessor for JsonStreamEvent);
              (*(void (**)(uint64_t, os_log_t))(v457 + 8))(v575, v557);
            }
            else
            {
              uint64_t v574 = *(void *)(v0 + 1208);
              uint64_t v447 = *(void *)(v0 + 1200);
              os_log_t v556 = *(os_log_t *)(v0 + 1152);
              uint64_t v562 = *(void *)(v0 + 1192);
              uint64_t v448 = *(void *)(v0 + 840);
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              sub_24FC4E59C();
              sub_24FC4FB78();
              swift_bridgeObjectRelease();
              sub_24FC4E590();
              sub_24FC4E5DC(v449 + 1);
              swift_bridgeObjectRetain();
              sub_24FC213D8();
              sub_24FC4F898();
              sub_24FC4EDD8();
              uint64_t v0 = v581;
              sub_24FC3B314();
              uint64_t v450 = sub_24FC212F0();
              sub_24FC4E4DC(v450, v451);
              sub_24FC46FBC(v448, (void (*)(void))type metadata accessor for ObjectStreamingSupport);
              sub_24FC4E5C4();
              v79();
              sub_24FC46FBC((uint64_t)v556, (void (*)(void))type metadata accessor for JsonStreamEvent);
              (*(void (**)(uint64_t, uint64_t))(v447 + 8))(v574, v562);
            }
          }
          else
          {
            unint64_t v44 = (unint64_t)v71;
            uint64_t v82 = *(void *)v1;
            if (*(void *)(*(void *)v1 + 16) == 1)
            {
              swift_bridgeObjectRelease();
              v412 = (void *)sub_24FC4F698();
              os_log_type_t v413 = sub_24FC4FAE8();
              if (sub_24FC2BE88(v413))
              {
                *(_WORD *)sub_24FC4EBB4() = 0;
                sub_24FC2BD64(&dword_24FC09000, v414, v415, "Upgrading child object to root object");
                sub_24FC211C4();
              }

              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
                uint64_t v82 = sub_24FC2A538(0, *(void *)(v82 + 16) + 1, 1, v82, v416, v417, v418);
              }
              unint64_t v420 = *(void *)(v82 + 16);
              unint64_t v419 = *(void *)(v82 + 24);
              if (v420 >= v419 >> 1) {
                uint64_t v82 = sub_24FC2A538(v419 > 1, v420 + 1, 1, v82, v416, v417, v418);
              }
              uint64_t v421 = *(void *)(v0 + 856);
              uint64_t v567 = *(void *)(v0 + 784);
              uint64_t v573 = *(void *)(v0 + 1224);
              uint64_t v422 = *(void *)(v0 + 360);
              *(void *)(v82 + 16) = v420 + 1;
              sub_24FC4E860();
              sub_24FC4EE54();
              v542();
              *(void *)(v0 + 256) = v82;
              sub_24FC4F648();
              sub_24FC4465C();
              uint64_t v424 = v423;
              swift_bridgeObjectRelease();
              sub_24FC4E860();
              sub_24FC4EE54();
              v542();
              *(void *)(v421 + *(int *)(v567 + 20)) = v424;
              *(void *)(v0 + 1328) = *(void *)(v422 + v573);
              goto LABEL_199;
            }
            sub_24FC4EE28();
            sub_24FC4E744();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            sub_24FC3B314();
            sub_24FC212F0();
            sub_24FC4E52C();
            void *v453 = v454;
            v453[1] = 0x800000024FC51A60;
            sub_24FC21548(v455, (uint64_t)v453);
            sub_24FC1B9B8();
            v79();
LABEL_106:
            sub_24FC46FBC(v1, (void (*)(void))type metadata accessor for JsonStreamEvent);
            v240 = *(void (**)(NSObject *, uint64_t))(v38 + 8);
            v241 = v74;
LABEL_153:
            v240(v241, v82);
          }
LABEL_192:
          unint64_t v3 = 0x269A5C000uLL;
LABEL_193:
          *(void *)(v0 + 1416) = v41;
          if (*(void *)(v3 + 1848) != -1) {
            swift_once();
          }
          sub_24FC4E924(*(void *)(v0 + 400), (uint64_t)qword_269A5EA10);
          MEMORY[0x2533738D0](v41);
          v430 = (void *)sub_24FC4F698();
          os_log_type_t v431 = sub_24FC4FAF8();
          if (sub_24FC4E79C(v431))
          {
            sub_24FC213F4();
            sub_24FC4E82C();
            *(_DWORD *)unint64_t v44 = 138412290;
            uint64_t v0 = v577;
            MEMORY[0x2533738D0](v41);
            uint64_t v432 = _swift_stdlib_bridgeErrorToNSError();
            sub_24FC4E504(v432);
            sub_24FC4EB6C();
            MEMORY[0x2533738C0](v41);
            sub_24FC4E5EC(&dword_24FC09000, v433, v434, "Received an error from the stream source %@");
            sub_24FC13C3C(qword_269A5CD10);
            sub_24FC4E728();
            sub_24FC211C4();
            sub_24FC211C4();
          }
          else
          {
            MEMORY[0x2533738C0](v41);
            MEMORY[0x2533738C0](v41);
          }
          uint64_t v435 = *(void *)(v0 + 1224);
          uint64_t v436 = *(void *)(v0 + 360);

          *(void *)(v0 + 1424) = *(void *)(v436 + v435);
          MEMORY[0x2533738D0](v41);
          goto LABEL_199;
        }
      }
      else
      {
        sub_24FC4E5AC(*(void *)(v0 + 712), v64, v65, *(void *)(v0 + 896));
      }
      sub_24FC4E6EC();
      sub_24FC4EE90();
      uint64_t v41 = *(uint64_t **)(v0 + 712);
      swift_bridgeObjectRelease();
      sub_24FC4DD90((uint64_t)v41, &qword_269A5CCC8);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_24FC3B314();
      sub_24FC212F0();
      sub_24FC4E52C();
      uint64_t v180 = "No parent object found for child object";
      goto LABEL_147;
    case 3u:
      uint64_t v80 = *(void *)(v0 + 904);
      uint64_t v81 = *(void *)(v0 + 896);
      uint64_t v82 = *(void *)(v0 + 704);
      sub_24FC13C3C(&qword_269A5CC70);
      swift_bridgeObjectRelease();
      uint64_t v83 = *(void (**)(void))(v80 + 32);
      sub_24FC4E628();
      v83();
      sub_24FC4392C(v82);
      sub_24FC4E53C(v82, 1, v81);
      if (v333)
      {
        sub_24FC4E6EC();
        sub_24FC4EE90();
        uint64_t v41 = *(uint64_t **)(v0 + 704);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_24FC4DD90((uint64_t)v41, &qword_269A5CCC8);
        sub_24FC3B314();
        sub_24FC212F0();
        sub_24FC4E52C();
        uint64_t v59 = v84 + 25;
LABEL_36:
        sub_24FC4ED74(v57, v59);
        goto LABEL_148;
      }
      uint64_t v74 = *(NSObject **)(v0 + 1040);
      uint64_t v41 = *(uint64_t **)(v0 + 1032);
      sub_24FC4E628();
      v83();
      char v161 = sub_24FC4F368();
      if ((v161 & 1) == 0)
      {
        sub_24FC4EE28();
        sub_24FC4E744();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_24FC3B314();
        sub_24FC212F0();
        sub_24FC4E52C();
        void *v237 = v236 - 18;
        v237[1] = 0x800000024FC51C10;
        sub_24FC21548(v238, (uint64_t)v237);
        unint64_t v44 = *(void *)(v0 + 8);
        sub_24FC4EA84();
        sub_24FC1B9B8();
        ((void (*)(void))v44)();
        uint64_t v239 = sub_24FC4EE3C();
        ((void (*)(uint64_t))v44)(v239);
        goto LABEL_106;
      }
      if (*(void *)(*(void *)v38 + 16) == 1 && *(void *)(*(void *)v1 + 16) == 1)
      {
        uint64_t v162 = *(void *)(v0 + 784);
        uint64_t v163 = *(void *)(v0 + 600);
        uint64_t v164 = v0 + 312;
        sub_24FC43AF4(v163);
        sub_24FC4E4BC(v163);
        if (v333)
        {
          sub_24FC4E698();
          uint64_t v41 = *(uint64_t **)(v0 + 600);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          sub_24FC4DD90((uint64_t)v41, &qword_269A5D470);
          sub_24FC3B314();
          sub_24FC212F0();
          sub_24FC4E52C();
          uint64_t v167 = v166 + 5;
          goto LABEL_152;
        }
        sub_24FC4E86C();
        uint64_t v470 = *(void *)(v469 + 816);
      }
      else
      {
        uint64_t v162 = *(void *)(v0 + 784);
        uint64_t v163 = *(void *)(v0 + 592);
        uint64_t v164 = v0 + 312;
        sub_24FC43AF4(v163);
        sub_24FC4E4BC(v163);
        if (v333)
        {
          sub_24FC4E698();
          uint64_t v41 = *(uint64_t **)(v0 + 592);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          sub_24FC4DD90((uint64_t)v41, &qword_269A5D470);
          sub_24FC3B314();
          sub_24FC212F0();
          sub_24FC4E52C();
          uint64_t v167 = v288 - 9;
          goto LABEL_152;
        }
        sub_24FC4E86C();
        uint64_t v470 = *(void *)(v425 + 808);
      }
      sub_24FC45A60();
      sub_24FC43C90(0);
      sub_24FC46FBC(v470, (void (*)(void))type metadata accessor for ObjectStreamingSupport);
      v471 = *(void (**)(void))(v0 + 8);
      sub_24FC1B9B8();
      v471();
      ((void (*)(uint64_t, unint64_t))v471)(v163, v1);
LABEL_214:
      uint64_t v315 = v162;
LABEL_215:
      sub_24FC46FBC(v315, (void (*)(void))type metadata accessor for JsonStreamEvent);
      goto LABEL_216;
    case 4u:
      os_log_t loga = (os_log_t)(v0 + 312);
      uint64_t v86 = *(void *)(v0 + 904);
      sub_24FC13C3C(&qword_269A5CC68);
      uint64_t v87 = *(void (**)(uint64_t))(v86 + 32);
      uint64_t v88 = sub_24FC4EC74();
      v87(v88);
      sub_24FC45A60();
      uint64_t v89 = *(void *)(v0 + 904);
      uint64_t v90 = *(void *)(v0 + 896);
      uint64_t v91 = *(void *)(v0 + 696);
      unsigned int v92 = (void (**)(void))(v89 + 16);
      if (*(void *)(*(void *)(v0 + 256) + 16))
      {
        uint64_t v93 = *(void (**)(void))(v89 + 16);
        sub_24FC4EF08();
        v93();
        _s19GenerativeFunctions24JsonObjectFieldContainerOwst_0(v91, 0, 1, v90);
      }
      else
      {
        _s19GenerativeFunctions24JsonObjectFieldContainerOwst_0(*(void *)(v0 + 696), 1, 1, *(void *)(v0 + 896));
        uint64_t v93 = *v92;
      }
      uint64_t v181 = *(void *)(v0 + 896);
      uint64_t v182 = *(void *)(v0 + 688);
      uint64_t v183 = *(void *)(v0 + 424);
      uint64_t v184 = *(void *)(v0 + 432);
      sub_24FC4E820();
      v93();
      uint64_t v185 = sub_24FC4EDC4();
      _s19GenerativeFunctions24JsonObjectFieldContainerOwst_0(v185, v186, v187, v188);
      uint64_t v189 = v184 + *(int *)(v183 + 48);
      sub_24FC4EBCC();
      sub_24FC4DD24(v190, v191, v192);
      sub_24FC4DD24(v182, v189, &qword_269A5CCC8);
      int v193 = _s19GenerativeFunctions24JsonObjectFieldContainerOwet_0(v184, 1, v181);
      uint64_t v41 = *(uint64_t **)(v0 + 896);
      if (v193 == 1)
      {
        unint64_t v44 = *(void *)(v0 + 696);
        sub_24FC4DD90(*(void *)(v0 + 688), &qword_269A5CCC8);
        uint64_t v194 = sub_24FC213D8();
        sub_24FC4DD90(v194, v195);
        sub_24FC4E4BC(v189);
        if (!v333) {
          goto LABEL_97;
        }
        sub_24FC4DD90(*(void *)(v0 + 432), &qword_269A5CCC8);
      }
      else
      {
        sub_24FC4DD24(*(void *)(v0 + 432), *(void *)(v0 + 680), &qword_269A5CCC8);
        sub_24FC4E4BC(v189);
        if (v333)
        {
          sub_24FC4E744();
          uint64_t v196 = *(void *)(v0 + 696);
          sub_24FC4DD90(*(void *)(v0 + 688), &qword_269A5CCC8);
          sub_24FC4DD90(v196, &qword_269A5CCC8);
          sub_24FC4EBD8();
          sub_24FC1B9B8();
          v197();
LABEL_97:
          sub_24FC4DD90(*(void *)(v0 + 432), &qword_269A5D5D0);
LABEL_98:
          uint64_t v198 = *(void *)(v0 + 1200);
          sub_24FC4EC8C();
          uint64_t v560 = v199;
          uint64_t v200 = *(void *)(v0 + 672);
          unint64_t v44 = *(void *)(v0 + 616);
          uint64_t v201 = *(void *)(v0 + 472);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          sub_24FC4E59C();
          sub_24FC4FB78();
          sub_24FC4ECA8();
          sub_24FC4E644();
          sub_24FC4D6F4(&qword_269A5CCE0, MEMORY[0x263F07508]);
          sub_24FC4FC68();
          sub_24FC4F898();
          swift_bridgeObjectRelease();
          sub_24FC4E644();
          sub_24FC3A414(*(void *)(v577 + 256), v200);
          sub_24FC2161C();
          sub_24FC4F828();
          uint64_t v41 = v202;
          sub_24FC4F898();
          swift_bridgeObjectRelease();
          uint64_t v0 = v581;
          sub_24FC3B314();
          uint64_t v203 = sub_24FC212F0();
          sub_24FC4E4DC(v203, v204);
          sub_24FC46FBC(v201, (void (*)(void))type metadata accessor for JsonFieldValueEvent);
          sub_24FC4EA84();
          sub_24FC4E5C4();
          v205();
          sub_24FC46FBC(v560, (void (*)(void))type metadata accessor for JsonStreamEvent);
          (*(void (**)(NSObject *, uint64_t))(v198 + 8))(v569, v563);
          goto LABEL_192;
        }
        uint64_t v242 = *(void *)(v0 + 904);
        unint64_t v44 = *(void *)(v0 + 896);
        uint64_t v243 = *(void *)(v0 + 696);
        uint64_t v244 = *(void *)(v0 + 688);
        uint64_t v563 = *(void *)(v0 + 432);
        uint64_t v245 = sub_24FC4EC74();
        v87(v245);
        sub_24FC4D6F4(&qword_269A5CC50, MEMORY[0x263F07508]);
        char v246 = sub_24FC4F818();
        v247 = *(void (**)(void))(v242 + 8);
        sub_24FC2161C();
        sub_24FC215C8();
        v247();
        uint64_t v41 = &qword_269A5CCC8;
        sub_24FC4DD90(v244, &qword_269A5CCC8);
        sub_24FC4DD90(v243, &qword_269A5CCC8);
        sub_24FC215C8();
        v247();
        uint64_t v0 = v577;
        sub_24FC4DD90(v563, &qword_269A5CCC8);
        if ((v246 & 1) == 0) {
          goto LABEL_98;
        }
      }
      if (*((void *)loga->isa + 2))
      {
        sub_24FC4A574();
        sub_24FC4A574();
        sub_24FC4A574();
        sub_24FC4EA9C();
        sub_24FC4A574();
        v248 = sub_24FC4F698();
        os_log_type_t v249 = sub_24FC4FAE8();
        if (os_log_type_enabled(v248, v249))
        {
          uint64_t v250 = *(void *)(v0 + 464);
          uint64_t v540 = *(void *)(v0 + 456);
          uint64_t v251 = *(void *)(v0 + 440);
          uint64_t v566 = *(void *)(v0 + 448);
          uint64_t v252 = sub_24FC21434();
          uint64_t v580 = swift_slowAlloc();
          *(_DWORD *)uint64_t v252 = 136315650;
          sub_24FC4D6F4(&qword_269A5CCE0, MEMORY[0x263F07508]);
          uint64_t v253 = sub_24FC4FC68();
          *(void *)(v0 + 280) = sub_24FC49DD0(v253, v254, &v580);
          sub_24FC4FB18();
          swift_bridgeObjectRelease();
          sub_24FC46FBC(v250, (void (*)(void))type metadata accessor for JsonFieldValueEvent);
          *(_WORD *)(v252 + 12) = 2080;
          v255 = (uint64_t *)(v540 + *(int *)(v251 + 20));
          uint64_t v256 = *v255;
          unint64_t v257 = v255[1];
          swift_bridgeObjectRetain();
          *(void *)(v577 + 288) = sub_24FC49DD0(v256, v257, &v580);
          sub_24FC4FB18();
          swift_bridgeObjectRelease();
          sub_24FC46FBC(v540, (void (*)(void))type metadata accessor for JsonFieldValueEvent);
          *(_WORD *)(v252 + 22) = 2080;
          uint64_t v0 = v577;
          uint64_t v258 = v566 + *(int *)(v251 + 24);
          uint64_t v259 = *(void *)v258;
          uint64_t v260 = *(void *)(v258 + 8);
          char v261 = *(unsigned char *)(v258 + 16);
          *(void *)(v577 + 192) = *(void *)v258;
          *(void *)(v577 + 200) = v260;
          *(unsigned char *)(v577 + 208) = v261;
          sub_24FC16E30(v259, v260, v261);
          uint64_t v262 = sub_24FC4F828();
          *(void *)(v577 + 304) = sub_24FC49DD0(v262, v263, &v580);
          sub_24FC4FB18();
          swift_bridgeObjectRelease();
          sub_24FC46FBC(v566, (void (*)(void))type metadata accessor for JsonFieldValueEvent);
          _os_log_impl(&dword_24FC09000, v248, v249, "Field value for object id=%s field=%s value=%s", (uint8_t *)v252, 0x20u);
          swift_arrayDestroy();
          sub_24FC211C4();
          sub_24FC211C4();
        }
        else
        {
          sub_24FC46FBC(*(void *)(v0 + 464), (void (*)(void))type metadata accessor for JsonFieldValueEvent);
          uint64_t v397 = sub_24FC4EA9C();
          sub_24FC46FBC(v397, v398);
          uint64_t v399 = sub_24FC213D8();
          sub_24FC46FBC(v399, v400);
        }

        uint64_t v401 = *(void *)(v0 + 1216);
        uint64_t v402 = v0;
        uint64_t v403 = *(void *)(v0 + 472);
        uint64_t v404 = *(void *)(v402 + 440);
        sub_24FC0CC3C((void *)(*(void *)(v402 + 360) + v401), *(void *)(*(void *)(v402 + 360) + v401 + 24));
        uint64_t v405 = v403 + *(int *)(v404 + 24);
        uint64_t v406 = *(void *)v405;
        *(void *)(v402 + 1376) = *(void *)v405;
        uint64_t v407 = *(void *)(v405 + 8);
        *(void *)(v402 + 1384) = v407;
        char v408 = *(unsigned char *)(v405 + 16);
        *(unsigned char *)(v402 + 137) = v408;
        *(void *)(v402 + 168) = v406;
        *(void *)(v402 + 176) = v407;
        *(unsigned char *)(v402 + 184) = v408;
        sub_24FC16E30(v406, v407, v408);
        v409 = (void *)swift_task_alloc();
        *(void *)(v402 + 1392) = v409;
        void *v409 = v402;
        v409[1] = sub_24FC423E8;
        sub_24FC4E890();
        __asm { BRAA            X5, X16 }
      }
      uint64_t v54 = *(void *)(v0 + 1200);
      uint64_t v563 = *(void *)(v0 + 1192);
      v569 = *(NSObject **)(v0 + 1208);
      uint64_t v55 = *(void *)(v0 + 1152);
      sub_24FC4EEE8();
      uint64_t v380 = *(void *)(v0 + 472);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_24FC4E59C();
      sub_24FC4FB78();
      swift_bridgeObjectRelease();
      sub_24FC4E590();
      sub_24FC4E5DC(v381 - 10);
      sub_24FC4D6F4(&qword_269A5CCE0, MEMORY[0x263F07508]);
      sub_24FC4FC68();
      sub_24FC4EA60();
      swift_bridgeObjectRelease();
      uint64_t v0 = v581;
      sub_24FC3B314();
      uint64_t v382 = sub_24FC212F0();
      sub_24FC4E4DC(v382, v383);
      sub_24FC46FBC(v380, (void (*)(void))type metadata accessor for JsonFieldValueEvent);
      sub_24FC4E5D0();
      v384();
      goto LABEL_191;
    case 5u:
      uint64_t v94 = *(void (**)(void))(*(void *)(v0 + 904) + 32);
      ((void (*)(void, void, void))v94)(*(void *)(v0 + 1008), *(void *)(v0 + 1128), *(void *)(v0 + 896));
      uint64_t v41 = *(uint64_t **)(v0 + 256);
      if (v41[2]) {
        goto LABEL_40;
      }
      v578 = v94;
      v561 = *(void (**)(void))(*(void *)(v0 + 904) + 16);
      sub_24FC123C0();
      v206();
      v207 = sub_24FC4F698();
      os_log_type_t v208 = sub_24FC4FAE8();
      os_log_type_enabled(v207, v208);
      uint64_t v209 = *(void *)(v0 + 1000);
      sub_24FC4E854();
      v211 = (void (**)(void))(v210 + 8);
      if (v212)
      {
        uint64_t v213 = sub_24FC213F4();
        uint64_t v580 = sub_24FC21434();
        *(_DWORD *)uint64_t v213 = 136315138;
        sub_24FC4D6F4(&qword_269A5CCE0, MEMORY[0x263F07508]);
        uint64_t v214 = sub_24FC4EE60();
        *(void *)(v213 + 4) = sub_24FC49DD0(v214, v215, &v580);
        swift_bridgeObjectRelease();
        v549 = *v211;
        sub_24FC4E5C4();
        v216();
        _os_log_impl(&dword_24FC09000, v207, v208, "Root array starts with id=%s", (uint8_t *)v213, 0xCu);
        swift_arrayDestroy();
        sub_24FC211C4();
        sub_24FC211C4();
      }
      else
      {
        v549 = *v211;
        ((void (*)(uint64_t, uint64_t))*v211)(v209, v0 + 256);
      }

      uint64_t v299 = *(void *)(v0 + 1016);
      v300 = *(char **)(v0 + 992);
      sub_24FC4E854();
      sub_24FC4EA38();
      v561();
      sub_24FC4BBEC(v299, v300);
      sub_24FC4E700();
      v549();
      sub_24FC4E974();
      sub_24FC4EA38();
      v561();
      uint64_t v301 = *(void *)(v0 + 256);
      uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
        uint64_t v301 = sub_24FC4E778(isUniquelyReferenced_nonNull_native, v303, v304, v305, v306, v307, v308);
      }
      unint64_t v310 = *(void *)(v301 + 16);
      unint64_t v309 = *(void *)(v301 + 24);
      if (v310 >= v309 >> 1)
      {
        char v523 = sub_24FC4ED4C(v309);
        uint64_t v301 = sub_24FC2A538(v523, v524, v525, v301, v526, v527, v528);
      }
      uint64_t v311 = *(void *)(v0 + 1152);
      uint64_t v312 = *(void *)(v0 + 1008);
      sub_24FC4E854();
      *(void *)(v301 + 16) = v310 + 1;
      sub_24FC4EAE0();
      v578(v314 + v313 * v310);
      *(void *)(v0 + 256) = v301;
      ((void (*)(uint64_t, uint64_t))v549)(v312, v0 + 256);
      uint64_t v315 = v311;
      goto LABEL_215;
    case 6u:
      uint64_t v101 = *(void *)(v0 + 904);
      uint64_t v102 = *(void (**)(void))(v101 + 32);
      uint64_t v54 = v101 + 32;
      unint64_t v1 = (unint64_t)v102;
      sub_24FC4E8C8();
      v102();
      sub_24FC4ED34();
      if (v105)
      {
        uint64_t v106 = swift_isUniquelyReferenced_nonNull_native();
        if ((v106 & 1) == 0) {
          uint64_t v106 = sub_24FC4EF14(v106, v107, v108, v109, v110, v111, v112);
        }
        uint64_t v113 = *(void *)(v42 + 16);
        if (!v113)
        {
          __break(1u);
          goto LABEL_235;
        }
        uint64_t v114 = *(void *)(v0 + 904);
        uint64_t v115 = *(void *)(v0 + 896);
        uint64_t v116 = *(void *)(v0 + 656);
        uint64_t v117 = v113 - 1;
        uint64_t v40 = (void (*)(void))((*(unsigned __int8 *)(v114 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v114 + 80));
        uint64_t v55 = *(void *)(v114 + 72);
        sub_24FC4E8C8();
        ((void (*)(void))v1)();
        *(void *)(v42 + 16) = v117;
        uint64_t v0 = v577;
        *(void *)(v577 + 256) = v42;
        _s19GenerativeFunctions24JsonObjectFieldContainerOwst_0(v116, 0, 1, v115);
        sub_24FC4E4BC(v116);
        if (v333)
        {
          sub_24FC4DD90(*(void *)(v577 + 656), &qword_269A5CCC8);
          sub_24FC4ED34();
          unint64_t v44 = v118 - 1;
          uint64_t v119 = swift_isUniquelyReferenced_nonNull_native();
          if ((v119 & 1) == 0) {
            uint64_t v119 = sub_24FC4EF14(v119, v120, v121, v122, v123, v124, v125);
          }
          unint64_t v126 = *(void *)(v42 + 16);
          if (v44 >= v126)
          {
            __break(1u);
            goto LABEL_239;
          }
          uint64_t v39 = v126 - 1;
          sub_24FC4E8C8();
          ((void (*)(void))v1)();
          if ((uint64_t)(v39 - v44) < 0) {
            goto LABEL_237;
          }
          if (v55 > 0
            || (unint64_t)v40 + v42 + v44 * v55 >= (unint64_t)v40
                                                        + v42
                                                        + v44 * v55
                                                        + v55
                                                        + (v39 - v44) * v55)
          {
            swift_arrayInitWithTakeFrontToBack();
          }
          else if (v55)
          {
            swift_arrayInitWithTakeBackToFront();
          }
          uint64_t v232 = *(void *)(v577 + 896);
          uint64_t v233 = *(void *)(v577 + 664);
          *(void *)(v42 + 16) = v39;
          *(void *)(v577 + 256) = v42;
        }
        else
        {
          uint64_t v232 = *(void *)(v577 + 896);
          uint64_t v233 = *(void *)(v577 + 664);
          sub_24FC4E8C8();
          ((void (*)(void))v1)();
          sub_24FC4EBD8();
          sub_24FC4E8C8();
          ((void (*)(void))v1)();
        }
        _s19GenerativeFunctions24JsonObjectFieldContainerOwst_0(v233, 0, 1, v232);
        sub_24FC4E4BC(v233);
        if (!v333)
        {
          uint64_t v331 = *(void *)(v577 + 976);
          uint64_t v41 = *(uint64_t **)(v577 + 896);
          uint64_t v332 = *(void *)(v577 + 648);
          sub_24FC4E8C8();
          ((void (*)(void))v1)();
          sub_24FC4BF10(v331, v332);
          sub_24FC4E4BC(v332);
          if (v333)
          {
            v569 = *(NSObject **)(v577 + 1208);
            unint64_t v38 = *(void *)(v577 + 1200);
            uint64_t v82 = *(void *)(v577 + 1192);
            unint64_t v1 = *(void *)(v577 + 1152);
            uint64_t v164 = *(void *)(v577 + 904);
            sub_24FC4DD90(*(void *)(v577 + 648), &qword_269A5CCC8);
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            sub_24FC3B314();
            sub_24FC212F0();
            sub_24FC4E52C();
            uint64_t v167 = v334 - 2;
LABEL_152:
            sub_24FC4ED74(v165, v167);
            unint64_t v44 = (unint64_t)v335;
            swift_willThrow();
            v336 = *(void (**)(void))(v164 + 8);
            sub_24FC4EA84();
            sub_24FC213BC();
            v336();
            sub_24FC4EE3C();
            sub_24FC213BC();
            v336();
            uint64_t v0 = v577;
            sub_24FC46FBC(v1, (void (*)(void))type metadata accessor for JsonStreamEvent);
            v240 = *(void (**)(NSObject *, uint64_t))(v38 + 8);
            v241 = v569;
            goto LABEL_153;
          }
          sub_24FC4DD90(*(void *)(v577 + 648), &qword_269A5CCC8);
          char v337 = sub_24FC4F368();
          if (v337)
          {
            uint64_t v338 = *(void *)v38;
            if (!*(void *)(*(void *)v38 + 16))
            {
              sub_24FC4E820();
              v477();
              v478 = sub_24FC4F698();
              os_log_type_t v479 = sub_24FC4FAE8();
              BOOL v480 = os_log_type_enabled(v478, v479);
              uint64_t v481 = *(void *)(v577 + 1152);
              uint64_t v482 = *(void *)(v577 + 904);
              if (v480)
              {
                uint64_t v483 = sub_24FC213F4();
                uint64_t v580 = sub_24FC21434();
                *(_DWORD *)uint64_t v483 = 136315138;
                sub_24FC4D6F4(&qword_269A5CCE0, MEMORY[0x263F07508]);
                uint64_t v484 = sub_24FC4FC68();
                *(void *)(v483 + 4) = sub_24FC49DD0(v484, v485, &v580);
                swift_bridgeObjectRelease();
                v486 = *(void (**)(void))(v482 + 8);
                sub_24FC4E804();
                v486();
                _os_log_impl(&dword_24FC09000, v478, v479, "Root array ended with id=%s", (uint8_t *)v483, 0xCu);
                swift_arrayDestroy();
                sub_24FC211C4();
                sub_24FC211C4();
              }
              else
              {

                v486 = *(void (**)(void))(v482 + 8);
                sub_24FC4E804();
                v486();
              }
              sub_24FC4E804();
              v486();
              sub_24FC4E804();
              v486();
              sub_24FC46FBC(v481, (void (*)(void))type metadata accessor for JsonStreamEvent);
              goto LABEL_216;
            }
            sub_24FC4E9F8();
            sub_24FC4EEE8();
            swift_bridgeObjectRelease();
            sub_24FC4E59C();
            sub_24FC4FB78();
            sub_24FC4ECA8();
            sub_24FC4E644();
            uint64_t v339 = *(void *)(v338 + 16);
            swift_bridgeObjectRelease();
            *(void *)(v577 + 248) = v339;
            sub_24FC4FC68();
            sub_24FC4EA60();
            swift_bridgeObjectRelease();
            sub_24FC4E644();
          }
          else
          {
            sub_24FC4E9F8();
LABEL_188:
            sub_24FC4EEE8();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            sub_24FC4ECBC();
            sub_24FC4EAC8();
            sub_24FC4E644();
            sub_24FC4D6F4(&qword_269A5CCE0, MEMORY[0x263F07508]);
            sub_24FC4EE78();
            sub_24FC4F898();
            swift_bridgeObjectRelease();
            sub_24FC4E644();
            sub_24FC4EE78();
            sub_24FC4EA60();
            swift_bridgeObjectRelease();
          }
          uint64_t v426 = v580;
          uint64_t v427 = v581;
          sub_24FC3B314();
          uint64_t v160 = sub_24FC212F0();
          uint64_t v41 = (uint64_t *)v160;
          *(void *)uint64_t v428 = v426;
          *(void *)(v428 + 8) = v427;
          uint64_t v0 = v577;
          *(unsigned char *)(v428 + 16) = 1;
LABEL_190:
          unint64_t v44 = v160;
          swift_willThrow();
          v429 = *(void (**)(void))(v1 + 8);
          sub_24FC4E5D0();
          v429();
          ((void (*)(void (*)(void), uint64_t))v429)(v40, v39);
LABEL_191:
          sub_24FC46FBC(v55, (void (*)(void))type metadata accessor for JsonStreamEvent);
          (*(void (**)(NSObject *, uint64_t))(v54 + 8))(v569, v563);
          goto LABEL_192;
        }
      }
      else
      {
        sub_24FC4E5AC(*(void *)(v0 + 664), v103, v104, *(void *)(v0 + 896));
      }
      sub_24FC4E6EC();
      sub_24FC4EE90();
      uint64_t v41 = *(uint64_t **)(v0 + 664);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_24FC4DD90((uint64_t)v41, &qword_269A5CCC8);
      sub_24FC3B314();
      sub_24FC212F0();
      sub_24FC4EF30();
      uint64_t v180 = "Received a root array end marker but there's no object in the stack";
LABEL_147:
      *(void *)uint64_t v178 = v179;
      *(void *)(v178 + 8) = (unint64_t)(v180 - 32) | 0x8000000000000000;
      *(unsigned char *)(v178 + 16) = 1;
LABEL_148:
      unint64_t v44 = (unint64_t)v85;
      swift_willThrow();
      sub_24FC4E700();
      v328();
      sub_24FC46FBC(v1, (void (*)(void))type metadata accessor for JsonStreamEvent);
      uint64_t v329 = sub_24FC4EA9C();
      v330(v329);
      goto LABEL_192;
    case 7u:
      uint64_t v0 = *(void *)(v0 + 1128);
      uint64_t v128 = *(void *)(v577 + 944);
      uint64_t v129 = *(void *)(v577 + 904);
      sub_24FC13C3C(&qword_269A5CC60);
      uint64_t v130 = *(NSObject **)(v129 + 32);
      sub_24FC4EC5C();
      uint64_t v41 = *(uint64_t **)v131;
      unint64_t v44 = *(void *)(v131 + 8);
      ((void (*)(uint64_t))v130)(v128);
      if (!*(void *)(*(void *)(v0 + 312) + 16))
      {
        uint64_t v217 = *(void *)(v0 + 1152);
        uint64_t v565 = *(void *)(v0 + 1208);
        uint64_t v570 = *(void *)(v0 + 1128);
        uint64_t v218 = *(void *)(v0 + 904);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_24FC3B314();
        sub_24FC212F0();
        sub_24FC4E52C();
        void *v219 = v220;
        v219[1] = 0x800000024FC51A60;
        sub_24FC21548(v221, (uint64_t)v219);
        v222 = *(void (**)(void))(v218 + 8);
        sub_24FC4EE48();
        sub_24FC213BC();
        v222();
        sub_24FC46FBC(v217, (void (*)(void))type metadata accessor for JsonStreamEvent);
        sub_24FC4E5D0();
        uint64_t v224 = v223();
        sub_24FC4ED40(v224, v225, v226, v227, v228, v229, v230, v231, v530, v531, v532, v533, (uint64_t)log, v538, v539, v541, typea, v548, (uint64_t)v552,
          (uint64_t)v558,
          v565,
          v570);
        sub_24FC213BC();
        v222();
        goto LABEL_163;
      }
      sub_24FC4EA44();
      sub_24FC4EB54();
      if (v134)
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        uint64_t v135 = sub_24FC2161C();
        unint64_t v137 = sub_24FC17DD4(v135, v136);
        if (v138)
        {
          sub_24FC4EAF8(v137, *(void *)(v0 + 560));
          sub_24FC4A574();
          uint64_t v139 = 0;
        }
        else
        {
          uint64_t v139 = 1;
        }
        uint64_t v264 = *(void *)(v0 + 552);
        uint64_t v265 = *(void *)(v0 + 536);
        _s19GenerativeFunctions24JsonObjectFieldContainerOwst_0(v265, v139, 1, v264);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_24FC4E53C(v265, 1, v264);
        if (!v333)
        {
          v569 = v130;
          uint64_t v274 = *(void *)(v0 + 1016);
          v275 = *(char **)(v0 + 992);
          uint64_t v276 = *(void *)(v0 + 904);
          swift_bridgeObjectRelease();
          sub_24FC45A60();
          v277 = *(void (**)(void))(v276 + 16);
          sub_24FC4EA9C();
          sub_24FC4EF08();
          v277();
          sub_24FC4BBEC(v274, v275);
          v558 = *(void (**)(void))(v276 + 8);
          sub_24FC4EA90();
          sub_24FC4E65C();
          v278();
          sub_24FC4EF08();
          v277();
          uint64_t v279 = *(void *)(v0 + 256);
          uint64_t v119 = swift_isUniquelyReferenced_nonNull_native();
          if (v119) {
            goto LABEL_117;
          }
          goto LABEL_241;
        }
      }
      else
      {
        sub_24FC4E5AC(*(void *)(v0 + 536), v132, v133, *(void *)(v0 + 552));
      }
      uint64_t v266 = *(void *)(v0 + 1152);
      uint64_t v267 = *(void *)(v0 + 904);
      uint64_t v268 = *(void *)(v0 + 536);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_24FC4DD90(v268, &qword_269A5D468);
      sub_24FC4E678();
      swift_bridgeObjectRelease();
      sub_24FC4EAB8();
      sub_24FC4E5DC(v269);
      sub_24FC2161C();
      sub_24FC4F898();
      swift_bridgeObjectRelease();
      uint64_t v0 = v581;
      sub_24FC3B314();
      uint64_t v270 = sub_24FC212F0();
      sub_24FC4E4DC(v270, v271);
      v272 = *(void (**)(void))(v267 + 8);
      sub_24FC4E5C4();
      v272();
      sub_24FC46FBC(v266, (void (*)(void))type metadata accessor for JsonStreamEvent);
      sub_24FC215C8();
      v273();
      sub_24FC4E5C4();
      v272();
      goto LABEL_192;
    case 8u:
      uint64_t v0 = *(void *)(v0 + 1128);
      uint64_t v42 = *(void *)(v577 + 928);
      uint64_t v140 = *(void *)(v577 + 904);
      sub_24FC13C3C(&qword_269A5CC60);
      uint64_t v40 = *(void (**)(void))(v140 + 32);
      sub_24FC4EC5C();
      uint64_t v54 = *v141;
      unint64_t v44 = v141[1];
      sub_24FC4E628();
      v40();
      sub_24FC4ED34();
      v558 = (void (*)(void))v44;
      if (!v144)
      {
        sub_24FC4E5AC(*(void *)(v0 + 640), v142, v143, *(void *)(v0 + 896));
LABEL_162:
        uint64_t v340 = *(void *)(v0 + 1152);
        uint64_t v572 = *(void *)(v0 + 1128);
        uint64_t v341 = *(void *)(v0 + 904);
        uint64_t v41 = *(uint64_t **)(v0 + 640);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_24FC4DD90((uint64_t)v41, &qword_269A5CCC8);
        sub_24FC3B314();
        sub_24FC212F0();
        sub_24FC4EF30();
        void *v342 = v343;
        v342[1] = 0x800000024FC51960;
        sub_24FC21548(v344, (uint64_t)v342);
        v345 = *(void (**)(void))(v341 + 8);
        sub_24FC4EE48();
        sub_24FC4EA78();
        v345();
        sub_24FC46FBC(v340, (void (*)(void))type metadata accessor for JsonStreamEvent);
        sub_24FC4EA90();
        sub_24FC213BC();
        uint64_t v347 = v346();
        uint64_t v355 = sub_24FC4ED40(v347, v348, v349, v350, v351, v352, v353, v354, v530, v531, v532, v533, (uint64_t)log, v538, v539, v541, typea, v548, (uint64_t)v552,
                 (uint64_t)v558,
                 v563,
                 v572);
        ((void (*)(uint64_t))v345)(v355);
LABEL_163:
        uint64_t v0 = v577;
        goto LABEL_192;
      }
      uint64_t v106 = swift_isUniquelyReferenced_nonNull_native();
      if ((v106 & 1) == 0) {
LABEL_235:
      }
        sub_24FC4EF14(v106, v107, v108, v109, v110, v111, v112);
      uint64_t v145 = *(void *)(v42 + 16);
      if (!v145)
      {
        __break(1u);
        goto LABEL_237;
      }
      unint64_t v44 = v38;
      uint64_t v146 = *(void *)(v0 + 904);
      uint64_t v147 = *(void *)(v0 + 896);
      uint64_t v148 = *(void *)(v0 + 632);
      uint64_t v149 = v145 - 1;
      unint64_t v38 = (*(unsigned __int8 *)(v146 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v146 + 80);
      uint64_t v39 = *(void *)(v146 + 72);
      sub_24FC4E628();
      v40();
      *(void *)(v42 + 16) = v149;
      uint64_t v0 = v577;
      *(void *)(v577 + 256) = v42;
      _s19GenerativeFunctions24JsonObjectFieldContainerOwst_0(v148, 0, 1, v147);
      sub_24FC4E4BC(v148);
      os_log_t v552 = (os_log_t)v54;
      if (!v333)
      {
        uint64_t v234 = *(void *)(v577 + 896);
        uint64_t v235 = *(void *)(v577 + 640);
        sub_24FC4E628();
        v40();
        sub_24FC4E628();
        v40();
        goto LABEL_160;
      }
      sub_24FC4DD90(*(void *)(v577 + 632), &qword_269A5CCC8);
      sub_24FC4ED34();
      unint64_t v1 = v150 - 1;
      uint64_t v119 = swift_isUniquelyReferenced_nonNull_native();
      if ((v119 & 1) == 0) {
LABEL_239:
      }
        uint64_t v119 = sub_24FC4EF14(v119, v120, v121, v122, v123, v124, v125);
      unint64_t v151 = *(void *)(v42 + 16);
      if (v1 >= v151)
      {
        __break(1u);
LABEL_241:
        uint64_t v279 = sub_24FC4E778(v119, v120, v121, v122, v123, v124, v125);
LABEL_117:
        unint64_t v281 = *(void *)(v279 + 16);
        unint64_t v280 = *(void *)(v279 + 24);
        unint64_t v282 = v281 + 1;
        if (v281 >= v280 >> 1)
        {
          uint64_t v529 = sub_24FC2A538(v280 > 1, v281 + 1, 1, v279, v123, v124, v125);
          unint64_t v282 = v281 + 1;
          uint64_t v279 = v529;
        }
        uint64_t typed = *(void *)(v0 + 1152);
        os_log_t logc = *(os_log_t *)(v0 + 576);
        uint64_t v283 = *(void *)(v577 + 496);
        *(void *)(v279 + 16) = v282;
        sub_24FC4EAE0();
        ((void (*)(unint64_t))v569)(v285 + v284 * v281);
        *(void *)(v577 + 256) = v279;
        sub_24FC4E860();
        sub_24FC123C0();
        v286();
        swift_storeEnumTagMultiPayload();
        sub_24FC4A574();
        sub_24FC13C3C(&qword_269A5D490);
        sub_24FC4FA58();
        sub_24FC4E5C4();
        v287();
        sub_24FC46FBC(v283, (void (*)(void))type metadata accessor for JsonObjectFieldContainer);
        sub_24FC46FBC((uint64_t)logc, (void (*)(void))type metadata accessor for FieldStreamingSupport);
        sub_24FC213BC();
        v558();
        sub_24FC46FBC(typed, (void (*)(void))type metadata accessor for JsonStreamEvent);
        sub_24FC213BC();
        v558();
        goto LABEL_216;
      }
      unint64_t v152 = v151 - 1;
      sub_24FC4E628();
      v40();
      if ((uint64_t)(v152 - v1) < 0)
      {
LABEL_237:
        sub_24FC4FC38();
        sub_24FC4E890();
        return;
      }
      if (v39 > 0 || v42 + v38 + v1 * v39 >= v42 + v38 + v1 * v39 + v39 + (v152 - v1) * v39)
      {
        swift_arrayInitWithTakeFrontToBack();
      }
      else if (v39)
      {
        swift_arrayInitWithTakeBackToFront();
      }
      uint64_t v234 = *(void *)(v0 + 896);
      uint64_t v235 = *(void *)(v0 + 640);
      *(void *)(v42 + 16) = v152;
      *(void *)(v0 + 256) = v42;
LABEL_160:
      _s19GenerativeFunctions24JsonObjectFieldContainerOwst_0(v235, 0, 1, v234);
      sub_24FC4E4BC(v235);
      if (v333) {
        goto LABEL_162;
      }
      uint64_t v356 = *(void *)(v0 + 928);
      uint64_t v357 = *(void *)(v0 + 624);
      sub_24FC4E628();
      v40();
      sub_24FC4BF10(v356, v357);
      sub_24FC4E4BC(v357);
      if (v358)
      {
        os_log_t v554 = *(os_log_t *)(v0 + 1192);
        sub_24FC4EC44();
        uint64_t v359 = *(void *)(v0 + 904);
        uint64_t v41 = *(uint64_t **)(v0 + 624);
        swift_bridgeObjectRelease();
        sub_24FC4DD90((uint64_t)v41, &qword_269A5CCC8);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_24FC3B314();
        sub_24FC212F0();
        sub_24FC4E52C();
        *(void *)uint64_t v361 = v360 - 2;
        *(void *)(v361 + 8) = 0x800000024FC519B0;
        *(unsigned char *)(v361 + 16) = 1;
        unint64_t v44 = (unint64_t)v362;
        swift_willThrow();
        v363 = *(void (**)(void))(v359 + 8);
        sub_24FC4E5C4();
        v363();
        sub_24FC4EE48();
        sub_24FC4E5C4();
        v363();
        sub_24FC46FBC(v39, (void (*)(void))type metadata accessor for JsonStreamEvent);
        sub_24FC4E5D0();
        uint64_t v365 = v364();
        sub_24FC4ED40(v365, v366, v367, v368, v369, v370, v371, v372, v530, v531, v532, v533, (uint64_t)log, v538, v539, v541, typea, v548, (uint64_t)v554,
          (uint64_t)v558,
          v563,
          (uint64_t)v569);
        sub_24FC4E5C4();
        v363();
        goto LABEL_163;
      }
      sub_24FC4DD90(*(void *)(v0 + 624), &qword_269A5CCC8);
      char v373 = sub_24FC4F368();
      if ((v373 & 1) == 0)
      {
        sub_24FC4EC8C();
        os_log_t v555 = v441;
        sub_24FC4EB20();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_24FC4ECBC();
        sub_24FC4EAC8();
        sub_24FC4E644();
        uint64_t v41 = (uint64_t *)sub_24FC4D6F4(&qword_269A5CCE0, MEMORY[0x263F07508]);
        sub_24FC4EE78();
        unint64_t v44 = (unint64_t)v442;
        sub_24FC4F898();
        swift_bridgeObjectRelease();
        sub_24FC4E644();
        sub_24FC4EE78();
        sub_24FC4EA60();
        swift_bridgeObjectRelease();
        uint64_t v0 = v581;
        sub_24FC3B314();
        uint64_t v443 = sub_24FC212F0();
        sub_24FC4E4DC(v443, v444);
        v445 = *(void (**)(void))(v38 + 8);
        sub_24FC4E618();
        v445();
        sub_24FC4E618();
        v445();
        uint64_t v446 = (uint64_t)v555;
LABEL_227:
        sub_24FC46FBC(v446, (void (*)(void))type metadata accessor for JsonStreamEvent);
        sub_24FC215C8();
        v508();
        sub_24FC4E618();
        v445();
        goto LABEL_192;
      }
      uint64_t v41 = *(uint64_t **)v44;
      if (!*(void *)(*(void *)v44 + 16))
      {
        sub_24FC4EC44();
        uint64_t v487 = *(void *)(v0 + 904);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_24FC3B314();
        sub_24FC212F0();
        sub_24FC4E52C();
        void *v488 = v489;
        v488[1] = 0x800000024FC51A60;
        sub_24FC21548(v490, (uint64_t)v488);
        v491 = *(void (**)(void))(v487 + 8);
        sub_24FC4E5D0();
        v491();
        sub_24FC4EE48();
        sub_24FC4E5D0();
        v491();
        sub_24FC46FBC(v39, (void (*)(void))type metadata accessor for JsonStreamEvent);
        sub_24FC4EA78();
        uint64_t v493 = v492();
        sub_24FC4ED40(v493, v494, v495, v496, v497, v498, v499, v500, v530, v531, v532, v533, (uint64_t)log, v538, v539, v541, typea, v548, (uint64_t)v552,
          (uint64_t)v558,
          v563,
          (uint64_t)v569);
        sub_24FC4E5D0();
        v491();
        goto LABEL_163;
      }
      sub_24FC4EA44();
      sub_24FC4EB54();
      unint64_t v44 = (unint64_t)v558;
      if (!v376)
      {
        sub_24FC4E5AC(*(void *)(v0 + 528), v374, v375, *(void *)(v0 + 552));
LABEL_226:
        sub_24FC4EC8C();
        uint64_t v551 = v503;
        sub_24FC4EB20();
        uint64_t v504 = *(void *)(v0 + 528);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_24FC4DD90(v504, &qword_269A5D468);
        sub_24FC4E678();
        swift_bridgeObjectRelease();
        sub_24FC4EAB8();
        sub_24FC4E5DC(v505);
        sub_24FC4F898();
        swift_bridgeObjectRelease();
        uint64_t v0 = v581;
        sub_24FC3B314();
        uint64_t v506 = sub_24FC212F0();
        sub_24FC4E4DC(v506, v507);
        v445 = *(void (**)(void))(v38 + 8);
        sub_24FC4E618();
        v445();
        sub_24FC4E618();
        v445();
        uint64_t v446 = v551;
        goto LABEL_227;
      }
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      unint64_t v377 = sub_24FC17DD4((uint64_t)v552, (uint64_t)v558);
      if (v378)
      {
        sub_24FC4EAF8(v377, *(void *)(v0 + 560));
        sub_24FC4A574();
        uint64_t v379 = 0;
      }
      else
      {
        uint64_t v379 = 1;
      }
      uint64_t v501 = *(void *)(v0 + 552);
      uint64_t v502 = *(void *)(v0 + 528);
      _s19GenerativeFunctions24JsonObjectFieldContainerOwst_0(v502, v379, 1, v501);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_24FC4E53C(v502, 1, v501);
      if (v333) {
        goto LABEL_226;
      }
      sub_24FC45A60();
      swift_bridgeObjectRetain();
      v509 = sub_24FC4F698();
      os_log_type_t v510 = sub_24FC4FAE8();
      if (os_log_type_enabled(v509, v510))
      {
        uint64_t v512 = sub_24FC213F4();
        uint64_t v502 = sub_24FC21434();
        uint64_t v580 = v502;
        *(_DWORD *)uint64_t v512 = 136315138;
        swift_bridgeObjectRetain();
        *(void *)(v512 + 4) = sub_24FC49DD0((uint64_t)v552, (unint64_t)v558, &v580);
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_24FC09000, v509, v510, "Array %s ended, completing the stream for the field", (uint8_t *)v512, 0xCu);
        swift_arrayDestroy();
        sub_24FC211C4();
        sub_24FC211C4();
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      uint64_t v513 = *(void *)(v0 + 1152);
      uint64_t v514 = *(void *)(v0 + 1128);
      sub_24FC4ED60();
      uint64_t v515 = *(void *)(v577 + 568);
      *(void *)(v577 + 240) = 0;
      sub_24FC13C3C(&qword_269A5D490);
      sub_24FC4FA68();
      sub_24FC46FBC(v515, (void (*)(void))type metadata accessor for FieldStreamingSupport);
      v516 = *(void (**)(void))(v0 + 8);
      sub_24FC4EA90();
      sub_24FC1B9B8();
      v516();
      sub_24FC1B9B8();
      v516();
      sub_24FC46FBC(v513, (void (*)(void))type metadata accessor for JsonStreamEvent);
      ((void (*)(uint64_t, uint64_t))v516)(v514, v502);
LABEL_216:
      uint64_t v472 = swift_task_alloc();
      v473 = (void *)sub_24FC4E668(v472);
      void *v473 = v474;
      v473[1] = sub_24FC3D980;
      sub_24FC4E984();
      sub_24FC4E890();
      MEMORY[0x270FA20F8](v475);
      return;
    default:
      sub_24FC1B984();
      v43();
      uint64_t v41 = *(uint64_t **)(v0 + 256);
      if (v41[2])
      {
LABEL_40:
        sub_24FC4EB08();
        uint64_t v95 = *(void *)(v0 + 896);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_24FC4E59C();
        sub_24FC4FB78();
        sub_24FC4E590();
        sub_24FC4E644();
        uint64_t v96 = swift_bridgeObjectRetain();
        MEMORY[0x253373220](v96, v95);
        unint64_t v44 = (unint64_t)v97;
        sub_24FC4F898();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v0 = v581;
        sub_24FC3B314();
        uint64_t v98 = sub_24FC212F0();
        sub_24FC4E4DC(v98, v99);
        sub_24FC4EA84();
        sub_24FC4EA78();
        v100();
        sub_24FC46FBC(v29, (void (*)(void))type metadata accessor for JsonStreamEvent);
        (*(void (**)(NSObject *, unint64_t))(v38 + 8))(v569, v1);
        goto LABEL_192;
      }
      uint64_t v168 = *(void *)(v0 + 904);
      uint64_t v169 = *(void (**)(void))(v168 + 16);
      *(void *)(v0 + 1240) = v169;
      *(void *)(v0 + 1248) = (v168 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
      sub_24FC4EA38();
      v169();
      v170 = sub_24FC4F698();
      os_log_type_t v171 = sub_24FC4FAE8();
      BOOL v172 = os_log_type_enabled(v170, v171);
      uint64_t v173 = *(void *)(v0 + 904);
      v553 = v169;
      if (v172)
      {
        uint64_t v174 = (uint8_t *)sub_24FC213F4();
        uint64_t v580 = sub_24FC21434();
        *(_DWORD *)uint64_t v174 = 136315138;
        sub_24FC4D6F4(&qword_269A5CCE0, MEMORY[0x263F07508]);
        uint64_t v175 = sub_24FC4EE60();
        *(void *)(v0 + 352) = sub_24FC49DD0(v175, v176, &v580);
        sub_24FC4FB18();
        swift_bridgeObjectRelease();
        uint64_t v177 = *(void (**)(void))(v173 + 8);
        sub_24FC4E634();
        v177();
        _os_log_impl(&dword_24FC09000, v170, v171, "Root object starts with id=%s", v174, 0xCu);
        swift_arrayDestroy();
        sub_24FC211C4();
        sub_24FC211C4();
      }
      else
      {
        uint64_t v177 = *(void (**)(void))(v173 + 8);
        sub_24FC4E634();
        v177();
      }

      *(void *)(v0 + 1256) = v177;
      uint64_t v289 = *(void *)(v0 + 256);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v289 = sub_24FC2A538(0, *(void *)(v289 + 16) + 1, 1, v289, v290, v291, v292);
      }
      unint64_t v294 = *(void *)(v289 + 16);
      unint64_t v293 = *(void *)(v289 + 24);
      if (v294 >= v293 >> 1)
      {
        char v517 = sub_24FC4ED4C(v293);
        uint64_t v289 = sub_24FC2A538(v517, v518, v519, v289, v520, v521, v522);
      }
      uint64_t v295 = *(void *)(v0 + 888);
      uint64_t v296 = *(void *)(v0 + 784);
      uint64_t v571 = *(void *)(v0 + 360);
      uint64_t v579 = *(void *)(v0 + 1224);
      *(void *)(v289 + 16) = v294 + 1;
      sub_24FC4ED28();
      v553();
      *(void *)(v0 + 256) = v289;
      sub_24FC4F648();
      sub_24FC4465C();
      uint64_t v298 = v297;
      swift_bridgeObjectRelease();
      sub_24FC4ED28();
      v553();
      *(void *)(v295 + *(int *)(v296 + 20)) = v298;
      *(void *)(v0 + 1264) = *(void *)(v571 + v579);
      goto LABEL_199;
  }
}

uint64_t sub_24FC41784()
{
  sub_24FC12030();
  uint64_t v1 = *(void *)(v0 + 880);
  sub_24FC48B44(*(void *)(v0 + 1112));
  swift_release();
  sub_24FC46FBC(v1, (void (*)(void))type metadata accessor for ObjectStreamingSupport);
  sub_24FC12064();
  return MEMORY[0x270FA2498](v2, v3, v4);
}

uint64_t sub_24FC41818(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  sub_24FC30158();
  sub_24FC304F0();
  sub_24FC4A574();
  uint64_t v14 = v12[39];
  uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
    uint64_t v14 = sub_24FC4E754(isUniquelyReferenced_nonNull_native, v16, v17, v18, v19, v20, v21);
  }
  unint64_t v22 = *(void *)(v14 + 24);
  if (*(void *)(v14 + 16) >= v22 >> 1) {
    uint64_t v14 = sub_24FC4EB38(v22 > 1, v16, v17, v18, v19, v20, v21);
  }
  v12[159] = v14;
  uint64_t v23 = (void (*)(uint64_t))v12[155];
  sub_24FC4E7DC();
  sub_24FC45A60();
  v12[39] = v14;
  uint64_t v24 = sub_24FC4E974();
  v23(v24);
  v12[5] = type metadata accessor for StreamingObjectTokenStreamProcessor(0);
  v12[6] = sub_24FC4D6F4(&qword_269A5D5A0, (void (*)(uint64_t))type metadata accessor for StreamingObjectTokenStreamProcessor);
  v12[2] = v13;
  swift_retain();
  swift_task_alloc();
  sub_24FC16C44();
  v12[160] = v25;
  *uint64_t v25 = v26;
  v25[1] = sub_24FC419B4;
  sub_24FC4EAA8();
  sub_24FC23FDC();
  return MEMORY[0x270F2F2E8](v27, v28, v29, v30, v31, v32, v33, v34, a9, a10, a11, a12);
}

uint64_t sub_24FC419B4()
{
  sub_24FC12030();
  sub_24FC0BAB0();
  uint64_t v3 = v2;
  sub_24FC1204C();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  sub_24FC1203C();
  *uint64_t v6 = v5;
  *(void *)(v3 + 1288) = v0;
  swift_task_dealloc();
  if (v0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  sub_24FC12064();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_24FC41AA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  sub_24FC4EC28();
  sub_24FC4ED88();
  sub_24FC4E854();
  uint64_t v11 = *(void *)(v10 + 888);
  sub_24FC4FA78();
  sub_24FC4FA58();
  sub_24FC4E848();
  v12();
  sub_24FC46FBC(v11, (void (*)(void))type metadata accessor for ObjectStreamingSupport);
  sub_24FC4E65C();
  v13();
  sub_24FC46FBC(a10, (void (*)(void))type metadata accessor for JsonStreamEvent);
  uint64_t v14 = swift_task_alloc();
  uint64_t v15 = (void *)sub_24FC4E668(v14);
  *uint64_t v15 = v16;
  v15[1] = sub_24FC3D980;
  sub_24FC4E9A4();
  sub_24FC4E8D4();
  return MEMORY[0x270FA20F8](v17);
}

uint64_t sub_24FC41BE4()
{
  sub_24FC12030();
  uint64_t v1 = *(void *)(v0 + 880);
  sub_24FC48B44(*(void *)(v0 + 1064));
  swift_release();
  sub_24FC46FBC(v1, (void (*)(void))type metadata accessor for ObjectStreamingSupport);
  sub_24FC12064();
  return MEMORY[0x270FA2498](v2, v3, v4);
}

uint64_t sub_24FC41C78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  sub_24FC30158();
  sub_24FC304F0();
  sub_24FC4A574();
  uint64_t v14 = v12[39];
  uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
    uint64_t v14 = sub_24FC4E754(isUniquelyReferenced_nonNull_native, v16, v17, v18, v19, v20, v21);
  }
  unint64_t v22 = *(void *)(v14 + 24);
  if (*(void *)(v14 + 16) >= v22 >> 1) {
    uint64_t v14 = sub_24FC4EB38(v22 > 1, v16, v17, v18, v19, v20, v21);
  }
  v12[167] = v14;
  uint64_t v23 = (void (*)(uint64_t))v12[163];
  sub_24FC4E7DC();
  sub_24FC45A60();
  v12[39] = v14;
  uint64_t v24 = sub_24FC4E974();
  v23(v24);
  v12[10] = type metadata accessor for StreamingObjectTokenStreamProcessor(0);
  v12[11] = sub_24FC4D6F4(&qword_269A5D5A0, (void (*)(uint64_t))type metadata accessor for StreamingObjectTokenStreamProcessor);
  v12[7] = v13;
  swift_retain();
  swift_task_alloc();
  sub_24FC16C44();
  v12[168] = v25;
  *uint64_t v25 = v26;
  v25[1] = sub_24FC41E14;
  sub_24FC4EAA8();
  sub_24FC23FDC();
  return MEMORY[0x270F2F2E8](v27, v28, v29, v30, v31, v32, v33, v34, a9, a10, a11, a12);
}

uint64_t sub_24FC41E14()
{
  sub_24FC12030();
  sub_24FC0BAB0();
  uint64_t v3 = v2;
  sub_24FC1204C();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  sub_24FC1203C();
  *uint64_t v6 = v5;
  *(void *)(v3 + 1352) = v0;
  swift_task_dealloc();
  if (v0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  sub_24FC12064();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_24FC41F00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  sub_24FC4EC28();
  sub_24FC4ED88();
  sub_24FC4E854();
  uint64_t v11 = *(void *)(v10 + 856);
  sub_24FC4FA78();
  sub_24FC4FA58();
  sub_24FC4E848();
  v12();
  sub_24FC46FBC(v11, (void (*)(void))type metadata accessor for ObjectStreamingSupport);
  sub_24FC4E65C();
  v13();
  sub_24FC46FBC(a10, (void (*)(void))type metadata accessor for JsonStreamEvent);
  uint64_t v14 = swift_task_alloc();
  uint64_t v15 = (void *)sub_24FC4E668(v14);
  *uint64_t v15 = v16;
  v15[1] = sub_24FC3D980;
  sub_24FC4E9A4();
  sub_24FC4E8D4();
  return MEMORY[0x270FA20F8](v17);
}

uint64_t sub_24FC42044()
{
  sub_24FC12030();
  uint64_t v1 = *(void *)(v0 + 880);
  sub_24FC48B44(*(void *)(v0 + 1064));
  swift_release();
  sub_24FC46FBC(v1, (void (*)(void))type metadata accessor for ObjectStreamingSupport);
  sub_24FC12064();
  return MEMORY[0x270FA2498](v2, v3, v4);
}

uint64_t sub_24FC420D8()
{
  sub_24FC4A574();
  uint64_t v1 = *(void *)(v0 + 312);
  uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
    uint64_t v1 = sub_24FC4E754(isUniquelyReferenced_nonNull_native, v3, v4, v5, v6, v7, v8);
  }
  unint64_t v10 = *(void *)(v1 + 16);
  unint64_t v9 = *(void *)(v1 + 24);
  if (v10 >= v9 >> 1) {
    uint64_t v1 = sub_24FC4EB38(v9 > 1, v3, v4, v5, v6, v7, v8);
  }
  *(void *)(v1 + 16) = v10 + 1;
  sub_24FC45A60();
  *(void *)(v0 + 312) = v1;
  uint64_t v11 = *(void *)(v0 + 256);
  uint64_t v12 = swift_isUniquelyReferenced_nonNull_native();
  if ((v12 & 1) == 0) {
    uint64_t v11 = sub_24FC4E778(v12, v13, v14, v15, v16, v17, v18);
  }
  unint64_t v20 = *(void *)(v11 + 16);
  unint64_t v19 = *(void *)(v11 + 24);
  if (v20 >= v19 >> 1) {
    uint64_t v11 = sub_24FC2A538(v19 > 1, v20 + 1, 1, v11, v16, v17, v18);
  }
  uint64_t v21 = *(void (**)(unint64_t))(v0 + 1304);
  uint64_t v38 = *(void *)(v0 + 1152);
  uint64_t v22 = *(void *)(v0 + 1064);
  uint64_t v23 = *(void *)(v0 + 896);
  uint64_t v37 = *(void *)(v0 + 840);
  uint64_t v36 = *(void *)(v0 + 832);
  uint64_t v24 = *(void *)(v0 + 584);
  uint64_t v25 = *(void *)(v0 + 496);
  unint64_t v26 = v11
      + ((*(unsigned __int8 *)(v0 + 140) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0 + 140))
      + *(void *)(v0 + 1296) * v20;
  *(void *)(v11 + 16) = v20 + 1;
  uint64_t v27 = v22;
  uint64_t v28 = v23;
  v21(v26);
  *(void *)(v0 + 256) = v11;
  ((void (*)(uint64_t, uint64_t, uint64_t))v21)(v25, v27, v28);
  sub_24FC4EE3C();
  swift_storeEnumTagMultiPayload();
  sub_24FC13C3C(&qword_269A5D490);
  sub_24FC4FA58();
  sub_24FC4E5D0();
  v29();
  sub_24FC46FBC(v36, (void (*)(void))type metadata accessor for ObjectStreamingSupport);
  sub_24FC46FBC(v24, (void (*)(void))type metadata accessor for FieldStreamingSupport);
  sub_24FC46FBC(v37, (void (*)(void))type metadata accessor for ObjectStreamingSupport);
  sub_24FC4E814();
  v30();
  sub_24FC46FBC(v38, (void (*)(void))type metadata accessor for JsonStreamEvent);
  uint64_t v31 = swift_task_alloc();
  uint64_t v32 = (void *)sub_24FC4E668(v31);
  *uint64_t v32 = v33;
  v32[1] = sub_24FC3D980;
  sub_24FC12064();
  return MEMORY[0x270FA20F8](v34);
}

uint64_t sub_24FC423E8()
{
  sub_24FC12030();
  sub_24FC0BAB0();
  uint64_t v3 = v2;
  sub_24FC1204C();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  sub_24FC1203C();
  *uint64_t v6 = v5;
  *(void *)(v3 + 1400) = v0;
  swift_task_dealloc();
  sub_24FC16EF0(*(void *)(v3 + 1376), *(void *)(v3 + 1384), *(unsigned char *)(v3 + 137));
  if (v0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  sub_24FC12064();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_24FC424F4()
{
  uint64_t v16 = *(void *)(v0 + 1152);
  uint64_t v1 = *(void *)(v0 + 800);
  uint64_t v2 = *(void *)(v0 + 472);
  uint64_t v3 = *(void *)(v0 + 128);
  *(void *)(v0 + 144) = *(void *)(v0 + 120);
  *(void *)(v0 + 152) = v3;
  char v4 = *(unsigned char *)(v0 + 136);
  *(unsigned char *)(v0 + 160) = v4;
  swift_bridgeObjectRetain();
  sub_24FC4E860();
  sub_24FC4425C(v5, v6, v7);
  swift_bridgeObjectRelease();
  sub_24FC46FBC(v1, (void (*)(void))type metadata accessor for ObjectStreamingSupport);
  sub_24FC46FBC(v2, (void (*)(void))type metadata accessor for JsonFieldValueEvent);
  sub_24FC4E5D0();
  v8();
  sub_24FC46FBC(v16, (void (*)(void))type metadata accessor for JsonStreamEvent);
  uint64_t v9 = sub_24FC4EA84();
  sub_24FC16EF0(v9, v10, v4);
  uint64_t v11 = swift_task_alloc();
  uint64_t v12 = (void *)sub_24FC4E668(v11);
  *uint64_t v12 = v13;
  v12[1] = sub_24FC3D980;
  sub_24FC12064();
  return MEMORY[0x270FA20F8](v14);
}

uint64_t sub_24FC4268C()
{
  sub_24FC12030();
  sub_24FC49354(0);
  swift_release();
  sub_24FC12064();
  return MEMORY[0x270FA2498](v0, v1, v2);
}

void sub_24FC426F8()
{
  sub_24FC30158();
  sub_24FC304F0();
  *(void *)(v0 + 232) = 0;
  sub_24FC4FA78();
  sub_24FC4FA68();
  if (*(void *)(*(void *)(v0 + 360)
                 + OBJC_IVAR____TtC19GenerativeFunctions35StreamingObjectTokenStreamProcessor_taskMonitor))
  {
    swift_retain();
    sub_24FC4F9D8();
    swift_release();
  }
  sub_24FC4E2D8();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_24FC4EDB0();
  sub_24FC23FDC();
  __asm { BRAA            X1, X16 }
}

uint64_t sub_24FC42A48()
{
  sub_24FC12030();
  uint64_t v1 = *(void *)(v0 + 1416);
  sub_24FC49354(v1);
  MEMORY[0x2533738C0](v1);
  swift_release();
  sub_24FC12064();
  return MEMORY[0x270FA2498](v2, v3, v4);
}

void sub_24FC42AC0()
{
  sub_24FC30158();
  sub_24FC304F0();
  v0[34] = v0[177];
  sub_24FC4FA78();
  sub_24FC4FA68();
  if (*(void *)(v0[45] + OBJC_IVAR____TtC19GenerativeFunctions35StreamingObjectTokenStreamProcessor_taskMonitor))
  {
    swift_retain();
    sub_24FC4F9D8();
    swift_release();
  }
  sub_24FC4E2D8();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_24FC4EDB0();
  sub_24FC23FDC();
  __asm { BRAA            X1, X16 }
}

uint64_t sub_24FC42E14()
{
  sub_24FC30158();
  sub_24FC304F0();
  sub_24FC4E950();
  v1();
  uint64_t v2 = v0[37];
  v0[177] = v2;
  if (qword_269A5C738 != -1) {
    swift_once();
  }
  sub_24FC4E924(v0[50], (uint64_t)qword_269A5EA10);
  MEMORY[0x2533738D0](v2);
  sub_24FC4F698();
  os_log_type_t v3 = sub_24FC4FAF8();
  if (sub_24FC4E79C(v3))
  {
    sub_24FC213F4();
    sub_24FC4E82C();
    sub_24FC4E6C4(5.7779e-34);
    uint64_t v4 = _swift_stdlib_bridgeErrorToNSError();
    sub_24FC4E504(v4);
    sub_24FC4EB6C();
    MEMORY[0x2533738C0](v2);
    sub_24FC4E5EC(&dword_24FC09000, v5, v6, "Received an error from the stream source %@");
    sub_24FC13C3C(qword_269A5CD10);
    sub_24FC4E728();
    sub_24FC211C4();
    sub_24FC211C4();
  }
  else
  {
    MEMORY[0x2533738C0](v2);
    MEMORY[0x2533738C0](v2);
  }
  sub_24FC4ED10();
  sub_24FC4E908();
  swift_retain();
  sub_24FC4E580();
  sub_24FC23FDC();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_24FC42F7C()
{
  sub_24FC30158();
  sub_24FC304F0();
  uint64_t v2 = (void (*)(uint64_t))v1[157];
  sub_24FC4E9C4();
  sub_24FC4E854();
  sub_24FC46FBC(v1[111], (void (*)(void))type metadata accessor for ObjectStreamingSupport);
  uint64_t v3 = sub_24FC4E960();
  v2(v3);
  sub_24FC46FBC(v0, (void (*)(void))type metadata accessor for JsonStreamEvent);
  sub_24FC215C8();
  v4();
  uint64_t v5 = v1[161];
  v1[177] = v5;
  if (qword_269A5C738 != -1) {
    swift_once();
  }
  sub_24FC4E924(v1[50], (uint64_t)qword_269A5EA10);
  MEMORY[0x2533738D0](v5);
  sub_24FC4F698();
  os_log_type_t v6 = sub_24FC4FAF8();
  if (sub_24FC4E79C(v6))
  {
    sub_24FC213F4();
    sub_24FC4E82C();
    sub_24FC4E6C4(5.7779e-34);
    uint64_t v7 = _swift_stdlib_bridgeErrorToNSError();
    sub_24FC4E504(v7);
    sub_24FC4EB6C();
    MEMORY[0x2533738C0](v5);
    sub_24FC4E5EC(&dword_24FC09000, v8, v9, "Received an error from the stream source %@");
    sub_24FC13C3C(qword_269A5CD10);
    sub_24FC4E728();
    sub_24FC211C4();
    sub_24FC211C4();
  }
  else
  {
    MEMORY[0x2533738C0](v5);
    MEMORY[0x2533738C0](v5);
  }
  sub_24FC4ED10();
  sub_24FC4E908();
  swift_retain();
  sub_24FC4E580();
  sub_24FC23FDC();
  return MEMORY[0x270FA2498](v10, v11, v12);
}

uint64_t sub_24FC43138()
{
  sub_24FC30158();
  sub_24FC304F0();
  uint64_t v2 = (void (*)(uint64_t))v1[165];
  sub_24FC4E9C4();
  sub_24FC4E854();
  sub_24FC46FBC(v1[107], (void (*)(void))type metadata accessor for ObjectStreamingSupport);
  uint64_t v3 = sub_24FC4E960();
  v2(v3);
  sub_24FC46FBC(v0, (void (*)(void))type metadata accessor for JsonStreamEvent);
  sub_24FC215C8();
  v4();
  uint64_t v5 = v1[169];
  v1[177] = v5;
  if (qword_269A5C738 != -1) {
    swift_once();
  }
  sub_24FC4E924(v1[50], (uint64_t)qword_269A5EA10);
  MEMORY[0x2533738D0](v5);
  sub_24FC4F698();
  os_log_type_t v6 = sub_24FC4FAF8();
  if (sub_24FC4E79C(v6))
  {
    sub_24FC213F4();
    sub_24FC4E82C();
    sub_24FC4E6C4(5.7779e-34);
    uint64_t v7 = _swift_stdlib_bridgeErrorToNSError();
    sub_24FC4E504(v7);
    sub_24FC4EB6C();
    MEMORY[0x2533738C0](v5);
    sub_24FC4E5EC(&dword_24FC09000, v8, v9, "Received an error from the stream source %@");
    sub_24FC13C3C(qword_269A5CD10);
    sub_24FC4E728();
    sub_24FC211C4();
    sub_24FC211C4();
  }
  else
  {
    MEMORY[0x2533738C0](v5);
    MEMORY[0x2533738C0](v5);
  }
  sub_24FC4ED10();
  sub_24FC4E908();
  swift_retain();
  sub_24FC4E580();
  sub_24FC23FDC();
  return MEMORY[0x270FA2498](v10, v11, v12);
}

uint64_t sub_24FC432F4()
{
  sub_24FC30158();
  sub_24FC304F0();
  sub_24FC4E9C4();
  uint64_t v2 = v1[59];
  sub_24FC46FBC(v1[100], (void (*)(void))type metadata accessor for ObjectStreamingSupport);
  sub_24FC46FBC(v2, (void (*)(void))type metadata accessor for JsonFieldValueEvent);
  uint64_t v3 = sub_24FC4E960();
  v4(v3);
  sub_24FC46FBC(v0, (void (*)(void))type metadata accessor for JsonStreamEvent);
  sub_24FC215C8();
  v5();
  uint64_t v6 = v1[175];
  v1[177] = v6;
  if (qword_269A5C738 != -1) {
    swift_once();
  }
  sub_24FC4E924(v1[50], (uint64_t)qword_269A5EA10);
  MEMORY[0x2533738D0](v6);
  sub_24FC4F698();
  os_log_type_t v7 = sub_24FC4FAF8();
  if (sub_24FC4E79C(v7))
  {
    sub_24FC213F4();
    sub_24FC4E82C();
    sub_24FC4E6C4(5.7779e-34);
    uint64_t v8 = _swift_stdlib_bridgeErrorToNSError();
    sub_24FC4E504(v8);
    sub_24FC4EB6C();
    MEMORY[0x2533738C0](v6);
    sub_24FC4E5EC(&dword_24FC09000, v9, v10, "Received an error from the stream source %@");
    sub_24FC13C3C(qword_269A5CD10);
    sub_24FC4E728();
    sub_24FC211C4();
    sub_24FC211C4();
  }
  else
  {
    MEMORY[0x2533738C0](v6);
    MEMORY[0x2533738C0](v6);
  }
  sub_24FC4ED10();
  sub_24FC4E908();
  swift_retain();
  sub_24FC4E580();
  sub_24FC23FDC();
  return MEMORY[0x270FA2498](v11, v12, v13);
}

uint64_t sub_24FC434D0()
{
  sub_24FC38D9C();
  sub_24FC4F678();
  sub_24FC14ED0();
  sub_24FC1607C(&qword_269A5CBA0);
  sub_24FC4FA78();
  sub_24FC14ED0();
  sub_24FC4EE9C();
  swift_release();
  sub_24FC4E5D0();
  v0();
  sub_24FC215C8();
  v1();
  sub_24FC38DB4();
  return MEMORY[0x270FA0238](v2, v3, v4);
}

uint64_t sub_24FC435D8()
{
  sub_24FC1249C();
  uint64_t v3 = v0[4];
  uint64_t v2 = v0[5];
  uint64_t v4 = sub_24FC4F678();
  sub_24FC12018(v4);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  unint64_t v8 = v6 + *(void *)(v7 + 64);
  sub_24FC1607C(&qword_269A5CBA0);
  uint64_t v9 = sub_24FC4FA78();
  sub_24FC4E56C(v9);
  uint64_t v11 = v0[6];
  uint64_t v12 = (uint64_t)v0 + v6;
  uint64_t v13 = (uint64_t)v0 + ((v8 + *(unsigned __int8 *)(v10 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80));
  uint64_t v14 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v14;
  *uint64_t v14 = v1;
  v14[1] = sub_24FC12014;
  sub_24FC4EBCC();
  return sub_24FC3D024(v15, v16, v17, v11, v12, v13, v3, v2);
}

uint64_t sub_24FC4371C()
{
  sub_24FC1607C(&qword_269A5CBA0);
  sub_24FC4FA78();
  sub_24FC14ED0();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v5 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v6 = v5 | 7;
  unint64_t v7 = ((*(void *)(v4 + 64) + ((v5 + 56) & ~v5) + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  swift_unknownObjectRelease();
  sub_24FC4EA78();
  v8();
  swift_release();
  return MEMORY[0x270FA0238](v0, v7, v6);
}

uint64_t sub_24FC437F8()
{
  sub_24FC1249C();
  uint64_t v2 = *(void *)(v0 + 32);
  sub_24FC1607C(&qword_269A5CBA0);
  uint64_t v3 = sub_24FC4FA78();
  sub_24FC12018(v3);
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  unint64_t v8 = (*(unsigned __int8 *)(v5 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  double v9 = *(double *)(v0 + 48);
  uint64_t v10 = v0 + v8;
  uint64_t v11 = *(void *)(v0 + ((*(void *)(v7 + 64) + v8 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v12 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v12;
  *uint64_t v12 = v1;
  v12[1] = sub_24FC12014;
  sub_24FC4EBCC();
  return sub_24FC3CAE8(v9, v13, v14, v15, v10, v11, v2);
}

uint64_t sub_24FC4392C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_24FC13C3C(&qword_269A5CCC8);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_24FC4F388();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  double v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(void *)(*(void *)v1 + 16))
  {
    sub_24FC4DAE0((uint64_t)v5);
    if (_s19GenerativeFunctions24JsonObjectFieldContainerOwet_0((uint64_t)v5, 1, v6) == 1)
    {
      sub_24FC4DD90((uint64_t)v5, &qword_269A5CCC8);
      sub_24FC4D8B0(*(void *)(*(void *)v1 + 16) - 1);
    }
    else
    {
      uint64_t v11 = *(void (**)(char *, char *, uint64_t))(v7 + 32);
      v11(v9, v5, v6);
      v11((char *)a1, v9, v6);
    }
    return _s19GenerativeFunctions24JsonObjectFieldContainerOwst_0(a1, 0, 1, v6);
  }
  else
  {
    return _s19GenerativeFunctions24JsonObjectFieldContainerOwst_0(a1, 1, 1, v6);
  }
}

uint64_t sub_24FC43AF4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_24FC13C3C(&qword_269A5D470);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for ObjectStreamingSupport(0);
  MEMORY[0x270FA5388](v6);
  if (*(void *)(*(void *)v1 + 16))
  {
    sub_24FC4DBF4((uint64_t)v5);
    if (_s19GenerativeFunctions24JsonObjectFieldContainerOwet_0((uint64_t)v5, 1, v6) == 1)
    {
      sub_24FC4DD90((uint64_t)v5, &qword_269A5D470);
      sub_24FC4D980(*(void *)(*(void *)v1 + 16) - 1);
    }
    else
    {
      sub_24FC45A60();
      sub_24FC45A60();
    }
    return _s19GenerativeFunctions24JsonObjectFieldContainerOwst_0(a1, 0, 1, v6);
  }
  else
  {
    return _s19GenerativeFunctions24JsonObjectFieldContainerOwst_0(a1, 1, 1, v6);
  }
}

uint64_t sub_24FC43C90(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for FieldStreamingSupport(0);
  uint64_t v46 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)&v38 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_24FC13C3C(&qword_269A5D560);
  uint64_t v7 = MEMORY[0x270FA5388](v6 - 8);
  double v9 = (int64_t *)((char *)&v38 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (int64_t *)((char *)&v38 - v10);
  uint64_t v12 = *(void *)(v1 + *(int *)(type metadata accessor for ObjectStreamingSupport(0) + 20));
  uint64_t v13 = *(void *)(v12 + 64);
  uint64_t v39 = v12 + 64;
  uint64_t v14 = 1 << *(unsigned char *)(v12 + 32);
  uint64_t v15 = -1;
  if (v14 < 64) {
    uint64_t v15 = ~(-1 << v14);
  }
  unint64_t v16 = v15 & v13;
  int64_t v40 = (unint64_t)(v14 + 63) >> 6;
  int64_t v38 = v40 - 1;
  uint64_t v47 = v12;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v48 = 0;
  *(void *)&long long v18 = 136315394;
  long long v42 = v18;
  uint64_t v41 = MEMORY[0x263F8EE58] + 8;
  unint64_t v44 = v5;
  uint64_t v45 = v3;
  uint64_t v43 = v9;
  if (!v16) {
    goto LABEL_6;
  }
LABEL_4:
  unint64_t v19 = __clz(__rbit64(v16));
  v16 &= v16 - 1;
  unint64_t v20 = v19 | (v48 << 6);
  while (2)
  {
    uint64_t v21 = (void *)(*(void *)(v47 + 48) + 16 * v20);
    uint64_t v22 = v21[1];
    *double v9 = *v21;
    v9[1] = v22;
    uint64_t v23 = sub_24FC13C3C(&qword_269A5D568);
    sub_24FC4A574();
    _s19GenerativeFunctions24JsonObjectFieldContainerOwst_0((uint64_t)v9, 0, 1, v23);
    swift_bridgeObjectRetain();
    while (1)
    {
      sub_24FC4B8C4((uint64_t)v9, (uint64_t)v11);
      uint64_t v28 = sub_24FC13C3C(&qword_269A5D568);
      if (_s19GenerativeFunctions24JsonObjectFieldContainerOwet_0((uint64_t)v11, 1, v28) == 1) {
        return swift_release();
      }
      uint64_t v29 = *v11;
      unint64_t v30 = v11[1];
      sub_24FC45A60();
      if (qword_269A5C738 != -1) {
        swift_once();
      }
      uint64_t v31 = sub_24FC4F6B8();
      sub_24FC20B5C(v31, (uint64_t)qword_269A5EA10);
      MEMORY[0x2533738D0](a1);
      MEMORY[0x2533738D0](a1);
      swift_bridgeObjectRetain();
      uint64_t v32 = sub_24FC4F698();
      os_log_type_t v33 = sub_24FC4FAE8();
      if (os_log_type_enabled(v32, v33))
      {
        uint64_t v34 = swift_slowAlloc();
        uint64_t v35 = (void *)swift_slowAlloc();
        uint64_t v36 = swift_slowAlloc();
        uint64_t v49 = v36;
        *(_DWORD *)uint64_t v34 = v42;
        swift_bridgeObjectRetain();
        *(void *)(v34 + 4) = sub_24FC49DD0(v29, v30, &v49);
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v34 + 12) = 2112;
        if (a1)
        {
          MEMORY[0x2533738D0](a1);
          uint64_t v37 = _swift_stdlib_bridgeErrorToNSError();
        }
        else
        {
          uint64_t v37 = 0;
        }
        *(void *)(v34 + 14) = v37;
        *uint64_t v35 = v37;
        MEMORY[0x2533738C0](a1);
        MEMORY[0x2533738C0](a1);
        _os_log_impl(&dword_24FC09000, v32, v33, "Terminating stream for %s with error=%@", (uint8_t *)v34, 0x16u);
        sub_24FC13C3C(qword_269A5CD10);
        swift_arrayDestroy();
        MEMORY[0x253373A70](v35, -1, -1);
        swift_arrayDestroy();
        MEMORY[0x253373A70](v36, -1, -1);
        MEMORY[0x253373A70](v34, -1, -1);

        uint64_t v5 = v44;
        double v9 = v43;
      }
      else
      {
        swift_bridgeObjectRelease_n();
        MEMORY[0x2533738C0](a1);
        MEMORY[0x2533738C0](a1);
      }
      uint64_t v49 = a1;
      MEMORY[0x2533738D0](a1);
      sub_24FC13C3C(&qword_269A5D490);
      sub_24FC4FA68();
      uint64_t result = sub_24FC46FBC((uint64_t)v5, (void (*)(void))type metadata accessor for FieldStreamingSupport);
      if (v16) {
        goto LABEL_4;
      }
LABEL_6:
      int64_t v24 = v48 + 1;
      if (__OFADD__(v48, 1))
      {
        __break(1u);
        goto LABEL_37;
      }
      if (v24 < v40)
      {
        unint64_t v25 = *(void *)(v39 + 8 * v24);
        if (v25) {
          goto LABEL_9;
        }
        int64_t v26 = v48 + 2;
        ++v48;
        if (v24 + 1 < v40)
        {
          unint64_t v25 = *(void *)(v39 + 8 * v26);
          if (v25) {
            goto LABEL_12;
          }
          int64_t v48 = v24 + 1;
          if (v24 + 2 < v40)
          {
            unint64_t v25 = *(void *)(v39 + 8 * (v24 + 2));
            if (v25)
            {
              v24 += 2;
              goto LABEL_9;
            }
            int64_t v26 = v24 + 3;
            int64_t v48 = v24 + 2;
            if (v24 + 3 < v40) {
              break;
            }
          }
        }
      }
LABEL_23:
      uint64_t v27 = sub_24FC13C3C(&qword_269A5D568);
      _s19GenerativeFunctions24JsonObjectFieldContainerOwst_0((uint64_t)v9, 1, 1, v27);
      unint64_t v16 = 0;
    }
    unint64_t v25 = *(void *)(v39 + 8 * v26);
    if (v25)
    {
LABEL_12:
      int64_t v24 = v26;
LABEL_9:
      unint64_t v16 = (v25 - 1) & v25;
      unint64_t v20 = __clz(__rbit64(v25)) + (v24 << 6);
      int64_t v48 = v24;
      continue;
    }
    break;
  }
  while (1)
  {
    int64_t v24 = v26 + 1;
    if (__OFADD__(v26, 1)) {
      break;
    }
    if (v24 >= v40)
    {
      int64_t v48 = v38;
      goto LABEL_23;
    }
    unint64_t v25 = *(void *)(v39 + 8 * v24);
    ++v26;
    if (v25) {
      goto LABEL_9;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_24FC4425C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24FC13C3C(&qword_269A5D5D8);
  uint64_t v29 = *(void *)(v6 - 8);
  uint64_t v30 = v6;
  MEMORY[0x270FA5388](v6);
  uint64_t v28 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = type metadata accessor for JsonObjectFieldContainer();
  uint64_t v8 = MEMORY[0x270FA5388](v26);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v24 - v9;
  uint64_t v11 = sub_24FC13C3C(&qword_269A5D468);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for FieldStreamingSupport(0);
  MEMORY[0x270FA5388](v14);
  unint64_t v16 = (char *)&v24 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = *(void *)a3;
  uint64_t v18 = *(void *)(a3 + 8);
  int v27 = *(unsigned __int8 *)(a3 + 16);
  uint64_t v19 = *(void *)(v25 + *(int *)(type metadata accessor for ObjectStreamingSupport(0) + 20));
  swift_bridgeObjectRetain();
  uint64_t v25 = a1;
  sub_24FC3A28C(a1, a2, v19, (uint64_t)v13);
  swift_bridgeObjectRelease();
  if (_s19GenerativeFunctions24JsonObjectFieldContainerOwet_0((uint64_t)v13, 1, v14) == 1)
  {
    sub_24FC4DD90((uint64_t)v13, &qword_269A5D468);
    uint64_t v31 = 0;
    unint64_t v32 = 0xE000000000000000;
    char v23 = v27;
    sub_24FC16E30(v17, v18, v27);
    sub_24FC4FB78();
    uint64_t v34 = v31;
    unint64_t v35 = v32;
    sub_24FC4F898();
    sub_24FC4F898();
    sub_24FC4F898();
    uint64_t v31 = v17;
    unint64_t v32 = v18;
    char v33 = v23;
    sub_24FC4FBE8();
    uint64_t result = sub_24FC4FC28();
    __break(1u);
  }
  else
  {
    sub_24FC45A60();
    *(void *)uint64_t v10 = v17;
    *((void *)v10 + 1) = v18;
    char v20 = v27;
    v10[16] = v27;
    swift_storeEnumTagMultiPayload();
    sub_24FC4A574();
    sub_24FC16E30(v17, v18, v20);
    sub_24FC13C3C(&qword_269A5D490);
    uint64_t v21 = v28;
    sub_24FC4FA58();
    (*(void (**)(char *, uint64_t))(v29 + 8))(v21, v30);
    sub_24FC46FBC((uint64_t)v10, (void (*)(void))type metadata accessor for JsonObjectFieldContainer);
    return sub_24FC46FBC((uint64_t)v16, (void (*)(void))type metadata accessor for FieldStreamingSupport);
  }
  return result;
}

void sub_24FC4465C()
{
  sub_24FC38D9C();
  uint64_t v1 = v0;
  uint64_t v51 = type metadata accessor for FieldStreamingSupport(0);
  sub_24FC14ED0();
  uint64_t v47 = v2;
  uint64_t v4 = MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)v43 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v50 = (char *)v43 - v7;
  uint64_t v49 = sub_24FC13C3C(&qword_269A5D580);
  sub_24FC14ED0();
  uint64_t v9 = v8;
  MEMORY[0x270FA5388](v10);
  sub_24FC3A238();
  uint64_t v48 = v11;
  uint64_t v12 = sub_24FC13C3C(&qword_269A5D490);
  sub_24FC14ED0();
  uint64_t v14 = v13;
  MEMORY[0x270FA5388](v15);
  sub_24FC3A238();
  uint64_t v55 = v16;
  uint64_t v54 = sub_24FC13C3C(&qword_269A5D480);
  MEMORY[0x270FA5388](v54);
  uint64_t v53 = (char *)v43 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = *(void *)(v1 + 16);
  if (!v19)
  {
LABEL_17:
    sub_24FC38DB4();
    return;
  }
  uint64_t v45 = v9 + 8;
  uint64_t v46 = (void (**)(uint64_t, void, uint64_t))(v9 + 104);
  unsigned int v44 = *MEMORY[0x263F8F680];
  v43[6] = v14 + 16;
  v43[7] = v17 + 16;
  v43[2] = v17 + 8;
  v43[3] = v14 + 8;
  swift_bridgeObjectRetain();
  uint64_t v20 = MEMORY[0x263F8EE80];
  v43[1] = v1;
  uint64_t v21 = (uint64_t *)(v1 + 40);
  v43[4] = v12;
  v43[5] = v6;
  while (1)
  {
    uint64_t v23 = *(v21 - 1);
    uint64_t v22 = *v21;
    uint64_t v24 = *(void *)(v20 + 16);
    swift_bridgeObjectRetain();
    if (v24)
    {
      swift_bridgeObjectRetain();
      sub_24FC17DD4(v23, v22);
      char v26 = v25;
      swift_bridgeObjectRelease();
      if (v26)
      {
        swift_bridgeObjectRelease();
        goto LABEL_15;
      }
    }
    uint64_t v52 = v19;
    type metadata accessor for JsonObjectFieldContainer();
    (*v46)(v48, v44, v49);
    sub_24FC4FA18();
    sub_24FC4E814();
    v27();
    uint64_t v28 = swift_allocObject();
    *(void *)(v28 + 16) = v23;
    *(void *)(v28 + 24) = v22;
    swift_bridgeObjectRetain();
    sub_24FC4FA38();
    sub_24FC123C0();
    v29();
    sub_24FC4EBCC();
    sub_24FC123C0();
    v30();
    sub_24FC45A60();
    swift_isUniquelyReferenced_nonNull_native();
    uint64_t v56 = v20;
    unint64_t v31 = sub_24FC17DD4(v23, v22);
    if (__OFADD__(*(void *)(v20 + 16), (v32 & 1) == 0)) {
      break;
    }
    unint64_t v33 = v31;
    char v34 = v32;
    sub_24FC13C3C(&qword_269A5D588);
    if (sub_24FC4FBF8())
    {
      unint64_t v35 = sub_24FC17DD4(v23, v22);
      if ((v34 & 1) != (v36 & 1)) {
        goto LABEL_20;
      }
      unint64_t v33 = v35;
    }
    uint64_t v20 = v56;
    if (v34)
    {
      sub_24FC4ED9C();
      sub_24FC4D77C();
    }
    else
    {
      *(void *)(v56 + 8 * (v33 >> 6) + 64) |= 1 << v33;
      uint64_t v37 = (uint64_t *)(*(void *)(v20 + 48) + 16 * v33);
      *uint64_t v37 = v23;
      v37[1] = v22;
      sub_24FC4ED9C();
      sub_24FC45A60();
      uint64_t v38 = *(void *)(v20 + 16);
      BOOL v39 = __OFADD__(v38, 1);
      uint64_t v40 = v38 + 1;
      if (v39) {
        goto LABEL_19;
      }
      *(void *)(v20 + 16) = v40;
      swift_bridgeObjectRetain();
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_24FC4E814();
    v41();
    sub_24FC4E814();
    v42();
    uint64_t v19 = v52;
LABEL_15:
    v21 += 2;
    if (!--v19)
    {
      swift_bridgeObjectRelease();
      goto LABEL_17;
    }
  }
  __break(1u);
LABEL_19:
  __break(1u);
LABEL_20:
  sub_24FC4FC98();
  __break(1u);
}

void sub_24FC44B68(uint64_t a1, uint64_t a2, unint64_t a3)
{
  if (qword_269A5C738 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_24FC4F6B8();
  sub_24FC20B5C(v5, (uint64_t)qword_269A5EA10);
  swift_bridgeObjectRetain_n();
  uint64_t v6 = sub_24FC4F698();
  os_log_type_t v7 = sub_24FC4FAE8();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v9 = swift_slowAlloc();
    uint64_t v10 = v9;
    *(_DWORD *)uint64_t v8 = 136315138;
    swift_bridgeObjectRetain();
    sub_24FC49DD0(a2, a3, &v10);
    sub_24FC4FB18();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_24FC09000, v6, v7, "Terminating stream for %s", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x253373A70](v9, -1, -1);
    MEMORY[0x253373A70](v8, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
}

uint64_t sub_24FC44D10(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24FC13C3C(&qword_269A5D470);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for ObjectStreamingSupport(0);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (_s19GenerativeFunctions24JsonObjectFieldContainerOwet_0(a1, 1, v10) == 1)
  {
    sub_24FC4DD90(a1, &qword_269A5D470);
    sub_24FC4D1EC(a2, (uint64_t)v6);
    uint64_t v11 = sub_24FC4F388();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(a2, v11);
    return sub_24FC4DD90((uint64_t)v6, &qword_269A5D470);
  }
  else
  {
    sub_24FC45A60();
    sub_24FC4D3C4((uint64_t)v9, a2);
    uint64_t v13 = sub_24FC4F388();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v13 - 8) + 8))(a2, v13);
  }
}

uint64_t sub_24FC44EBC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v4 = sub_24FC13C3C(&qword_269A5D400);
  uint64_t v5 = sub_24FC4E60C(v4);
  MEMORY[0x270FA5388](v5);
  sub_24FC4EB84();
  uint64_t v6 = v1 + OBJC_IVAR____TtC19GenerativeFunctions35StreamingObjectTokenStreamProcessor_parserStream;
  sub_24FC2BDD8();
  sub_24FC4DD24(v6, v2, &qword_269A5D400);
  uint64_t v7 = sub_24FC13C3C(&qword_269A5D3A8);
  sub_24FC4E53C(v2, 1, v7);
  if (!v8) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 32))(a1, v2, v7);
  }
  sub_24FC4DD90(v2, &qword_269A5D400);
  type metadata accessor for JsonStreamEvent(0);
  return sub_24FC4FAC8();
}

uint64_t sub_24FC44FE4()
{
  return MEMORY[0x270FA2498](sub_24FC45000, 0, 0);
}

uint64_t sub_24FC45000()
{
  sub_24FC12240();
  sub_24FC3B314();
  sub_24FC212F0();
  void *v0 = 0;
  v0[1] = 0;
  sub_24FC4E554((uint64_t)v0, 3);
  sub_24FC0BAC8();
  return v1();
}

uint64_t StreamingObjectTokenStreamProcessor.deinit()
{
  swift_release();
  swift_release();
  sub_24FC4DD90(v0 + OBJC_IVAR____TtC19GenerativeFunctions35StreamingObjectTokenStreamProcessor_parserStream, &qword_269A5D400);
  sub_24FC4DD90(v0 + OBJC_IVAR____TtC19GenerativeFunctions35StreamingObjectTokenStreamProcessor_parserStreamContinuation, &qword_269A5D3F8);
  swift_release();
  _s19GenerativeFunctions26TokenStreamProcessorCloserVwxx_0(v0 + OBJC_IVAR____TtC19GenerativeFunctions35StreamingObjectTokenStreamProcessor_sanitizer);
  swift_release();
  return v0;
}

uint64_t StreamingObjectTokenStreamProcessor.__deallocating_deinit()
{
  StreamingObjectTokenStreamProcessor.deinit();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t sub_24FC4515C(uint64_t a1)
{
  return sub_24FC3ADE4(a1);
}

uint64_t sub_24FC45180()
{
  return sub_24FC3AA1C();
}

void sub_24FC451A4()
{
}

uint64_t sub_24FC451C8()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_24FC12014;
  return sub_24FC3C560();
}

uint64_t StreamingObjectTokenStreamProcessor.stream<A>(parentObjectID:field:of:)()
{
  sub_24FC12030();
  v1[10] = v2;
  v1[11] = v0;
  v1[8] = v3;
  v1[9] = v4;
  v1[6] = v5;
  v1[7] = v6;
  v1[5] = v7;
  uint64_t v8 = sub_24FC13C3C(&qword_269A5D468);
  sub_24FC4E60C(v8);
  v1[12] = sub_24FC12200();
  uint64_t v9 = type metadata accessor for FieldStreamingSupport(0);
  v1[13] = v9;
  sub_24FC12018(v9);
  v1[14] = v10;
  v1[15] = *(void *)(v11 + 64);
  v1[16] = sub_24FC30200();
  v1[17] = swift_task_alloc();
  uint64_t v12 = sub_24FC13C3C(&qword_269A5D470);
  sub_24FC4E60C(v12);
  v1[18] = sub_24FC12200();
  uint64_t v13 = sub_24FC4F388();
  v1[19] = v13;
  sub_24FC12018(v13);
  v1[20] = v14;
  v1[21] = *(void *)(v15 + 64);
  v1[22] = sub_24FC30200();
  v1[23] = swift_task_alloc();
  uint64_t v16 = type metadata accessor for ObjectStreamingSupport(0);
  v1[24] = v16;
  sub_24FC4E60C(v16);
  v1[25] = sub_24FC12200();
  sub_24FC12064();
  return MEMORY[0x270FA2498](v17, v18, v19);
}

uint64_t sub_24FC453F0()
{
  sub_24FC12030();
  uint64_t v1 = v0[20];
  v0[26] = *(void *)(v0[11]
                     + OBJC_IVAR____TtC19GenerativeFunctions35StreamingObjectTokenStreamProcessor_objectStreamMap);
  v0[27] = *(void *)(v1 + 16);
  v0[28] = (v1 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  sub_24FC4E820();
  v2();
  swift_retain();
  uint64_t v3 = sub_24FC4E580();
  return MEMORY[0x270FA2498](v3, v4, v5);
}

uint64_t sub_24FC45488()
{
  sub_24FC12030();
  uint64_t v1 = *(void *)(v0 + 208);
  sub_24FC2BDD8();
  *(void *)(v0 + 232) = *(void *)(v1 + 112);
  swift_bridgeObjectRetain();
  swift_release();
  sub_24FC12064();
  return MEMORY[0x270FA2498](v2, v3, v4);
}

uint64_t sub_24FC45504()
{
  uint64_t v1 = *(void *)(v0 + 144);
  uint64_t v2 = sub_24FC4EBD8();
  sub_24FC3A350(v2, v3, v4);
  swift_bridgeObjectRelease();
  sub_24FC213D8();
  sub_24FC4E5C4();
  v5();
  sub_24FC4E4BC(v1);
  if (v13)
  {
    sub_24FC4DD90(*(void *)(v0 + 144), &qword_269A5D470);
    sub_24FC4E59C();
    sub_24FC4FB78();
    sub_24FC4E644();
    sub_24FC4D6F4(&qword_269A5CCE0, MEMORY[0x263F07508]);
    sub_24FC4FC68();
    sub_24FC4EA60();
    swift_bridgeObjectRelease();
    sub_24FC3B314();
    sub_24FC212F0();
    *(void *)uint64_t v6 = v34;
    *(void *)(v6 + 8) = v35;
    *(unsigned char *)(v6 + 16) = 1;
    swift_willThrow();
  }
  else
  {
    uint64_t v8 = *(void *)(v0 + 192);
    uint64_t v7 = *(void *)(v0 + 200);
    uint64_t v9 = *(void *)(v0 + 96);
    uint64_t v11 = *(void *)(v0 + 56);
    uint64_t v10 = *(void *)(v0 + 64);
    sub_24FC45A60();
    uint64_t v12 = *(void *)(v7 + *(int *)(v8 + 20));
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_24FC3A28C(v11, v10, v12, v9);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_24FC4E4BC(v9);
    if (!v13)
    {
      int v27 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 216);
      uint64_t v16 = *(void *)(v0 + 176);
      uint64_t v17 = *(void *)(v0 + 160);
      uint64_t v18 = *(void *)(v0 + 152);
      uint64_t v28 = *(void *)(v0 + 168);
      uint64_t v32 = *(void *)(v0 + 200);
      uint64_t v19 = *(void *)(v0 + 48);
      uint64_t v29 = *(void *)(v0 + 56);
      uint64_t v30 = *(void *)(v0 + 64);
      uint64_t v31 = *(void *)(v0 + 88);
      long long v33 = *(_OWORD *)(v0 + 72);
      uint64_t v20 = *(void *)(v0 + 136);
      sub_24FC45A60();
      sub_24FC13C3C(&qword_269A5D478);
      uint64_t v21 = swift_allocBox();
      sub_24FC13C3C(&qword_269A5D480);
      sub_24FC4F9B8();
      v27(v16, v19, v18);
      sub_24FC4A574();
      unint64_t v22 = (v28 + ((*(unsigned __int8 *)(v17 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80)) + 7) & 0xFFFFFFFFFFFFFFF8;
      uint64_t v23 = swift_allocObject();
      *(_OWORD *)(v23 + 16) = v33;
      *(void *)(v23 + 32) = v21;
      *(void *)(v23 + 40) = v29;
      *(void *)(v23 + 48) = v30;
      sub_24FC4E8C8();
      v24();
      *(void *)(v23 + v22) = v31;
      sub_24FC45A60();
      swift_bridgeObjectRetain();
      swift_retain();
      swift_retain();
      sub_24FC4FAC8();
      sub_24FC46FBC(v20, (void (*)(void))type metadata accessor for FieldStreamingSupport);
      sub_24FC46FBC(v32, (void (*)(void))type metadata accessor for ObjectStreamingSupport);
      swift_release();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      sub_24FC12110();
      goto LABEL_8;
    }
    uint64_t v14 = *(void *)(v0 + 200);
    sub_24FC4DD90(*(void *)(v0 + 96), &qword_269A5D468);
    sub_24FC4E678();
    swift_bridgeObjectRelease();
    sub_24FC4E5DC(0xD00000000000002BLL);
    swift_bridgeObjectRetain();
    sub_24FC4F898();
    swift_bridgeObjectRelease();
    sub_24FC3B314();
    sub_24FC212F0();
    *(void *)uint64_t v15 = v34;
    *(void *)(v15 + 8) = v35;
    *(unsigned char *)(v15 + 16) = 1;
    swift_willThrow();
    sub_24FC46FBC(v14, (void (*)(void))type metadata accessor for ObjectStreamingSupport);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_24FC0BAC8();
LABEL_8:
  return v25();
}

uint64_t type metadata accessor for FieldStreamingSupport(uint64_t a1)
{
  return sub_24FC14B1C(a1, (uint64_t *)&unk_269A5D530);
}

uint64_t type metadata accessor for ObjectStreamingSupport(uint64_t a1)
{
  return sub_24FC14B1C(a1, (uint64_t *)&unk_269A5D520);
}

uint64_t sub_24FC45A60()
{
  uint64_t v1 = sub_24FC4EBFC();
  v2(v1);
  sub_24FC12084();
  sub_24FC1255C();
  v3();
  return v0;
}

uint64_t sub_24FC45AB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[24] = a8;
  v8[25] = v12;
  v8[22] = a6;
  v8[23] = a7;
  v8[20] = a4;
  v8[21] = a5;
  v8[18] = a1;
  v8[19] = a3;
  uint64_t v9 = sub_24FC4F388();
  v8[26] = v9;
  v8[27] = *(void *)(v9 - 8);
  v8[28] = swift_task_alloc();
  v8[29] = swift_task_alloc();
  v8[30] = swift_task_alloc();
  v8[31] = swift_task_alloc();
  v8[32] = swift_task_alloc();
  sub_24FC13C3C(&qword_269A5D590);
  v8[33] = swift_task_alloc();
  v8[34] = type metadata accessor for JsonObjectFieldContainer();
  v8[35] = swift_task_alloc();
  v8[36] = swift_task_alloc();
  v8[37] = swift_task_alloc();
  v8[38] = swift_task_alloc();
  v8[39] = sub_24FC13C3C(&qword_269A5D478);
  v8[40] = swift_projectBox();
  return MEMORY[0x270FA2498](sub_24FC45C64, 0, 0);
}

uint64_t sub_24FC45C64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  sub_24FC12030();
  sub_24FC4E8F0();
  uint64_t v17 = (void *)swift_task_alloc();
  v10[41] = v17;
  *uint64_t v17 = v10;
  v17[1] = sub_24FC45D08;
  uint64_t v18 = v10[39];
  uint64_t v19 = v10[33];
  return MEMORY[0x270FA2100](v19, v18, v11, v12, v13, v14, v15, v16, a9, a10);
}

uint64_t sub_24FC45D08()
{
  sub_24FC12030();
  sub_24FC0BAB0();
  uint64_t v3 = v2;
  sub_24FC1204C();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  sub_24FC1203C();
  *uint64_t v6 = v5;
  *(void *)(v3 + 336) = v0;
  swift_task_dealloc();
  if (!v0) {
    swift_endAccess();
  }
  sub_24FC12064();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_24FC45DEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v115 = v12;
  uint64_t v13 = *(void *)(v12 + 264);
  sub_24FC4E53C(v13, 1, *(void *)(v12 + 272));
  if (v14)
  {
    sub_24FC4DD90(v13, &qword_269A5D590);
    if (qword_269A5C738 != -1) {
      swift_once();
    }
    uint64_t v15 = *(void *)(v12 + 160);
    uint64_t v16 = sub_24FC4F6B8();
    sub_24FC20B5C(v16, (uint64_t)qword_269A5EA10);
    sub_24FC4EA38();
    v17();
    swift_bridgeObjectRetain_n();
    uint64_t v18 = sub_24FC4F698();
    os_log_type_t v19 = sub_24FC4FAE8();
    BOOL v20 = sub_24FC4EC0C(v19);
    uint64_t v21 = *(void *)(v12 + 256);
    uint64_t v22 = *(void *)(v12 + 208);
    unint64_t v23 = *(void *)(v12 + 160);
    uint64_t v24 = (void (**)(uint64_t, uint64_t))(*(void *)(v12 + 216) + 8);
    if (v20)
    {
      uint64_t v25 = *(void *)(v12 + 152);
      uint64_t v26 = swift_slowAlloc();
      uint64_t v113 = sub_24FC4EDF0();
      *(_DWORD *)uint64_t v26 = 136315394;
      swift_bridgeObjectRetain();
      *(void *)(v12 + 128) = sub_24FC49DD0(v25, v23, &v113);
      sub_24FC4FB18();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v26 + 12) = 2080;
      sub_24FC4D6F4(&qword_269A5CCE0, MEMORY[0x263F07508]);
      uint64_t v27 = sub_24FC4EE60();
      *(void *)(v12 + 120) = sub_24FC49DD0(v27, v28, &v113);
      sub_24FC4FB18();
      swift_bridgeObjectRelease();
      sub_24FC215C8();
      v29();
      _os_log_impl(&dword_24FC09000, v18, (os_log_type_t)v15, "Stream for field %s owned by %s is terminated", (uint8_t *)v26, 0x16u);
      swift_arrayDestroy();
      sub_24FC211C4();
      sub_24FC211C4();
    }
    else
    {
      swift_bridgeObjectRelease_n();
      (*v24)(v21, v22);
    }

LABEL_34:
    sub_24FC4EBE4();
    sub_24FC4E5AC(*(void *)(v12 + 144), v99, v100, *(void *)(v12 + 192));
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    sub_24FC12110();
LABEL_35:
    sub_24FC4E8AC();
    __asm { BRAA            X1, X16 }
  }
  sub_24FC45A60();
  if (qword_269A5C738 != -1) {
    swift_once();
  }
  uint64_t v30 = *(void *)(v12 + 160);
  uint64_t v31 = sub_24FC4F6B8();
  sub_24FC20B5C(v31, (uint64_t)qword_269A5EA10);
  sub_24FC4A574();
  swift_bridgeObjectRetain_n();
  uint64_t v32 = sub_24FC4F698();
  os_log_type_t v33 = sub_24FC4FAE8();
  BOOL v34 = sub_24FC4EC0C(v33);
  uint64_t v35 = *(void *)(v12 + 296);
  if (v34)
  {
    uint64_t v36 = *(void *)(v12 + 152);
    unint64_t v37 = *(void *)(v12 + 160);
    uint64_t v38 = swift_slowAlloc();
    uint64_t v113 = sub_24FC4EDF0();
    *(_DWORD *)uint64_t v38 = 136315394;
    swift_bridgeObjectRetain();
    *(void *)(v38 + 4) = sub_24FC49DD0(v36, v37, &v113);
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v38 + 12) = 2080;
    sub_24FC4A574();
    uint64_t v39 = sub_24FC4F828();
    *(void *)(v38 + 14) = sub_24FC49DD0(v39, v40, &v113);
    swift_bridgeObjectRelease();
    sub_24FC46FBC(v35, (void (*)(void))type metadata accessor for JsonObjectFieldContainer);
    _os_log_impl(&dword_24FC09000, v32, (os_log_type_t)v30, "Field Stream %s got: %s", (uint8_t *)v38, 0x16u);
    swift_arrayDestroy();
    sub_24FC211C4();
    sub_24FC211C4();
  }
  else
  {
    swift_bridgeObjectRelease_n();
    sub_24FC46FBC(v35, (void (*)(void))type metadata accessor for JsonObjectFieldContainer);
  }

  sub_24FC4A574();
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      sub_24FC1B984();
      v52();
      uint64_t v53 = (void *)sub_24FC4F698();
      os_log_type_t v54 = sub_24FC4FAE8();
      if (sub_24FC2BE88(v54))
      {
        *(_WORD *)sub_24FC4EBB4() = 0;
        sub_24FC2BD64(&dword_24FC09000, v55, v56, "Top level object START marker received, initializing streaming object");
        sub_24FC211C4();
      }
      uint64_t v57 = *(void *)(v12 + 176);

      sub_24FC4EA38();
      v58();
      *(void *)(v12 + 40) = type metadata accessor for StreamingObjectTokenStreamProcessor(0);
      *(void *)(v12 + 48) = sub_24FC4D6F4(&qword_269A5D5A0, (void (*)(uint64_t))type metadata accessor for StreamingObjectTokenStreamProcessor);
      *(void *)(v12 + 16) = v57;
      swift_retain();
      swift_task_alloc();
      sub_24FC16C44();
      *(void *)(v12 + 344) = v59;
      *uint64_t v59 = v60;
      v59[1] = sub_24FC46988;
      sub_24FC4EAA8();
      sub_24FC4E8AC();
      return MEMORY[0x270F2F2E8](v61, v62, v63, v64, v65, v66, v67, v68, a9, a10, a11, a12);
    case 2u:
      uint64_t v69 = *(void *)(v12 + 224);
      uint64_t v70 = *(void *)(v12 + 232);
      uint64_t v71 = *(void *)(v12 + 208);
      uint64_t v72 = *(void *)(v12 + 216);
      sub_24FC1B984();
      v73();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v72 + 16))(v69, v70, v71);
      uint64_t v74 = sub_24FC4F698();
      os_log_type_t v75 = sub_24FC4FAE8();
      BOOL v76 = os_log_type_enabled(v74, v75);
      uint64_t v77 = *(void *)(v12 + 304);
      uint64_t v78 = *(void *)(v12 + 216);
      if (v76)
      {
        uint64_t v79 = sub_24FC213F4();
        uint64_t v113 = sub_24FC21434();
        *(_DWORD *)uint64_t v79 = 136315138;
        sub_24FC4D6F4(&qword_269A5CCE0, MEMORY[0x263F07508]);
        uint64_t v80 = sub_24FC4EE60();
        *(void *)(v79 + 4) = sub_24FC49DD0(v80, v81, &v113);
        swift_bridgeObjectRelease();
        uint64_t v82 = *(void (**)(void))(v78 + 8);
        sub_24FC4E634();
        v82();
        _os_log_impl(&dword_24FC09000, v74, v75, "Top level array start marker received with id=%s", (uint8_t *)v79, 0xCu);
        swift_arrayDestroy();
        sub_24FC211C4();
        sub_24FC211C4();

        sub_24FC4E634();
        v82();
      }
      else
      {

        uint64_t v98 = *(void (**)(void))(v78 + 8);
        sub_24FC4E634();
        v98();
        sub_24FC4E634();
        v98();
      }
      uint64_t v83 = v77;
      goto LABEL_33;
    case 3u:
      uint64_t v84 = (void *)sub_24FC4F698();
      os_log_type_t v85 = sub_24FC4FAE8();
      BOOL v86 = sub_24FC4E70C(v85);
      uint64_t v87 = *(void *)(v12 + 304);
      if (v86)
      {
        *(_WORD *)sub_24FC4EBB4() = 0;
        sub_24FC4EF58(&dword_24FC09000, v88, v89, "Top level object END marker received, no more data will follow for the current object");
        sub_24FC211C4();
      }

      goto LABEL_32;
    case 4u:
      swift_bridgeObjectRetain_n();
      uint64_t v90 = (void *)sub_24FC4F698();
      os_log_type_t v91 = sub_24FC4FAE8();
      BOOL v92 = sub_24FC4E70C(v91);
      unint64_t v93 = *(void *)(v12 + 160);
      if (v92)
      {
        uint64_t v94 = *(void *)(v12 + 152);
        uint64_t v95 = sub_24FC213F4();
        uint64_t v113 = sub_24FC21434();
        *(_DWORD *)uint64_t v95 = 136315138;
        swift_bridgeObjectRetain();
        *(void *)(v95 + 4) = sub_24FC49DD0(v94, v93, &v113);
        swift_bridgeObjectRelease_n();
        sub_24FC4EA18(&dword_24FC09000, v96, v97, "Top level array END marker received, will terminate stream for field %s");
        swift_arrayDestroy();
        sub_24FC211C4();
        sub_24FC211C4();
      }
      else
      {

        sub_24FC4EDD8();
      }
      uint64_t v87 = *(void *)(v12 + 304);
      type metadata accessor for FieldStreamingSupport(0);
      *(void *)(v12 + 136) = 0;
      sub_24FC13C3C(&qword_269A5D490);
      sub_24FC4FA68();
LABEL_32:
      uint64_t v83 = v87;
LABEL_33:
      sub_24FC46FBC(v83, (void (*)(void))type metadata accessor for JsonObjectFieldContainer);
      if (sub_24FC4F9E8()) {
        goto LABEL_34;
      }
      sub_24FC4E8F0();
      uint64_t v103 = (void *)swift_task_alloc();
      *(void *)(v12 + 328) = v103;
      *uint64_t v103 = v12;
      v103[1] = sub_24FC45D08;
      sub_24FC4E8AC();
      return MEMORY[0x270FA2100](v104, v105, v106, v107, v108, v109, v110, v111, a9, a10);
    default:
      uint64_t v41 = *(void *)(v12 + 304);
      long long v42 = *(uint64_t **)(v12 + 280);
      uint64_t v43 = *v42;
      uint64_t v44 = v42[1];
      char v45 = *((unsigned char *)v42 + 16);
      uint64_t v113 = 0;
      unint64_t v114 = 0xE000000000000000;
      sub_24FC4FB78();
      unint64_t v46 = v114;
      *(void *)(v12 + 104) = v113;
      *(void *)(v12 + 112) = v46;
      sub_24FC4E644();
      *(void *)(v12 + 80) = v43;
      *(void *)(v12 + 88) = v44;
      *(unsigned char *)(v12 + 96) = v45;
      sub_24FC4FBE8();
      uint64_t v47 = sub_24FC213D8();
      sub_24FC16EF0(v47, v48, v45);
      sub_24FC4F898();
      uint64_t v49 = *(void *)(v12 + 104);
      uint64_t v50 = *(void *)(v12 + 112);
      sub_24FC3B314();
      sub_24FC212F0();
      *uint64_t v51 = v49;
      v51[1] = v50;
      sub_24FC4E554((uint64_t)v51, 2);
      sub_24FC46FBC(v41, (void (*)(void))type metadata accessor for JsonObjectFieldContainer);
      sub_24FC4E7B8();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      sub_24FC0BAC8();
      goto LABEL_35;
  }
}

uint64_t sub_24FC46988()
{
  sub_24FC12030();
  sub_24FC0BAB0();
  sub_24FC1204C();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  sub_24FC1203C();
  *uint64_t v5 = v4;
  *(void *)(v6 + 352) = v0;
  swift_task_dealloc();
  sub_24FC12064();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_24FC46A64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  sub_24FC30158();
  sub_24FC304F0();
  uint64_t v13 = v12[38];
  sub_24FC4E950();
  v14();
  sub_24FC46FBC(v13, (void (*)(void))type metadata accessor for JsonObjectFieldContainer);
  sub_24FC4EBE4();
  uint64_t v25 = v15;
  _s19GenerativeFunctions24JsonObjectFieldContainerOwst_0(v12[18], 0, 1, v12[24]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_24FC12110();
  sub_24FC23FDC();
  return v17(v16, v17, v18, v19, v20, v21, v22, v23, v25, a10, a11, a12);
}

uint64_t sub_24FC46B58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  sub_24FC30158();
  sub_24FC304F0();
  swift_endAccess();
  uint64_t v22 = *(void *)(v12 + 336);
  sub_24FC4E7B8();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_24FC23FDC();
  return v14(v13, v14, v15, v16, v17, v18, v19, v20, v22, a10, a11, a12);
}

uint64_t sub_24FC46C14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  sub_24FC30158();
  sub_24FC304F0();
  uint64_t v13 = *(void *)(v12 + 304);
  sub_24FC4E950();
  v14();
  sub_24FC46FBC(v13, (void (*)(void))type metadata accessor for JsonObjectFieldContainer);
  uint64_t v24 = *(void *)(v12 + 352);
  sub_24FC4E7B8();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_24FC23FDC();
  return v16(v15, v16, v17, v18, v19, v20, v21, v22, v24, a10, a11, a12);
}

uint64_t sub_24FC46CF8()
{
  sub_24FC38D9C();
  sub_24FC4F388();
  sub_24FC14ED0();
  type metadata accessor for FieldStreamingSupport(0);
  swift_release();
  swift_bridgeObjectRelease();
  sub_24FC4E5D0();
  v0();
  swift_release();
  sub_24FC13C3C(&qword_269A5D480);
  sub_24FC12084();
  sub_24FC4E814();
  v1();
  sub_24FC13C3C(&qword_269A5D490);
  sub_24FC12084();
  sub_24FC4E814();
  v2();
  sub_24FC4E860();
  sub_24FC38DB4();
  return MEMORY[0x270FA0238](v3, v4, v5);
}

uint64_t sub_24FC46E7C()
{
  sub_24FC304F0();
  uint64_t v1 = sub_24FC4F388();
  sub_24FC12018(v1);
  uint64_t v2 = type metadata accessor for FieldStreamingSupport(0);
  sub_24FC4E56C(v2);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_24FC12014;
  sub_24FC23FDC();
  return sub_24FC45AB4(v4, v5, v6, v7, v8, v9, v10, v11);
}

uint64_t sub_24FC46FBC(uint64_t a1, void (*a2)(void))
{
  a2(0);
  sub_24FC12084();
  sub_24FC4E814();
  v3();
  return a1;
}

uint64_t StreamingObjectTokenStreamProcessor.stream<A>(objectID:field:of:)()
{
  sub_24FC12030();
  v1[10] = v2;
  v1[11] = v0;
  v1[8] = v3;
  v1[9] = v4;
  v1[6] = v5;
  v1[7] = v6;
  v1[5] = v7;
  uint64_t v8 = sub_24FC4F388();
  v1[12] = v8;
  sub_24FC12018(v8);
  v1[13] = v9;
  v1[14] = sub_24FC12200();
  uint64_t v10 = sub_24FC13C3C(&qword_269A5D480);
  v1[15] = v10;
  sub_24FC12018(v10);
  v1[16] = v11;
  v1[17] = sub_24FC12200();
  sub_24FC12064();
  return MEMORY[0x270FA2498](v12, v13, v14);
}

uint64_t sub_24FC470DC()
{
  sub_24FC12030();
  *(void *)(v0 + 144) = *(void *)(*(void *)(v0 + 88)
                                    + OBJC_IVAR____TtC19GenerativeFunctions35StreamingObjectTokenStreamProcessor_objectStreamMap);
  swift_retain();
  uint64_t v1 = sub_24FC4E580();
  return MEMORY[0x270FA2498](v1, v2, v3);
}

uint64_t sub_24FC47150()
{
  sub_24FC12240();
  sub_24FC48CD8(v0[6], v0[7], v0[8], v0[17]);
  v0[19] = 0;
  swift_release();
  sub_24FC12064();
  return MEMORY[0x270FA2498](v1, v2, v3);
}

void sub_24FC471E4()
{
  if (qword_269A5C738 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_24FC4F6B8();
  sub_24FC20B5C(v1, (uint64_t)qword_269A5EA10);
  sub_24FC4EA9C();
  sub_24FC4EA38();
  v2();
  swift_bridgeObjectRetain_n();
  uint64_t v3 = sub_24FC4F698();
  os_log_type_t v4 = sub_24FC4FAE8();
  BOOL v5 = os_log_type_enabled(v3, v4);
  uint64_t v7 = v0[13];
  uint64_t v6 = v0[14];
  uint64_t v8 = v0[12];
  if (v5)
  {
    os_log_type_t type = v4;
    uint64_t v9 = sub_24FC21434();
    uint64_t v27 = swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 136315650;
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_24FC4EA90();
    v0[2] = sub_24FC49DD0(v10, v11, v12);
    sub_24FC4FB18();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v9 + 12) = 2080;
    sub_24FC4D6F4(&qword_269A5CCE0, MEMORY[0x263F07508]);
    uint64_t v13 = sub_24FC4FC68();
    v0[3] = sub_24FC49DD0(v13, v14, &v27);
    sub_24FC4FB18();
    swift_bridgeObjectRelease();
    sub_24FC4E848();
    v15();
    *(_WORD *)(v9 + 22) = 2080;
    uint64_t v16 = sub_24FC4FD98();
    v0[4] = sub_24FC49DD0(v16, v17, &v27);
    sub_24FC4FB18();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24FC09000, v3, type, "Created stream for field name %s with objectID %s of type %s", (uint8_t *)v9, 0x20u);
    swift_arrayDestroy();
    sub_24FC211C4();
    sub_24FC211C4();
  }
  else
  {
    swift_bridgeObjectRelease_n();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
  }

  uint64_t v18 = v0[10];
  uint64_t v19 = v0[7];
  uint64_t v20 = v0[8];
  sub_24FC13C3C(&qword_269A5D478);
  uint64_t v21 = swift_allocBox();
  sub_24FC4F9B8();
  uint64_t v22 = (void *)swift_allocObject();
  v22[2] = v18;
  v22[3] = v21;
  v22[4] = v19;
  v22[5] = v20;
  swift_bridgeObjectRetain();
  swift_retain();
  sub_24FC4FAC8();
  sub_24FC4EC9C();
  sub_24FC4E700();
  v23();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_24FC12110();
  sub_24FC4E8AC();
  __asm { BRAA            X1, X16 }
}

uint64_t sub_24FC47578()
{
  sub_24FC12030();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_24FC0BAC8();
  return v0();
}

uint64_t sub_24FC475E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[14] = a4;
  v5[15] = a5;
  v5[12] = a1;
  v5[13] = a3;
  uint64_t v6 = sub_24FC4FB08();
  v5[16] = v6;
  v5[17] = *(void *)(v6 - 8);
  v5[18] = swift_task_alloc();
  sub_24FC13C3C(&qword_269A5D590);
  v5[19] = swift_task_alloc();
  v5[20] = type metadata accessor for JsonObjectFieldContainer();
  v5[21] = swift_task_alloc();
  v5[22] = swift_task_alloc();
  v5[23] = swift_task_alloc();
  v5[24] = swift_task_alloc();
  v5[25] = sub_24FC13C3C(&qword_269A5D478);
  v5[26] = swift_projectBox();
  return MEMORY[0x270FA2498](sub_24FC47750, 0, 0);
}

uint64_t sub_24FC47750(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  sub_24FC12030();
  sub_24FC4E8F0();
  unint64_t v17 = (void *)swift_task_alloc();
  v10[27] = v17;
  *unint64_t v17 = v10;
  v17[1] = sub_24FC477F4;
  uint64_t v18 = v10[25];
  uint64_t v19 = v10[19];
  return MEMORY[0x270FA2100](v19, v18, v11, v12, v13, v14, v15, v16, a9, a10);
}

uint64_t sub_24FC477F4()
{
  sub_24FC12030();
  sub_24FC0BAB0();
  uint64_t v3 = v2;
  sub_24FC1204C();
  *os_log_type_t v4 = v3;
  uint64_t v5 = *v1;
  sub_24FC1203C();
  *uint64_t v6 = v5;
  *(void *)(v3 + 224) = v0;
  swift_task_dealloc();
  if (!v0) {
    swift_endAccess();
  }
  sub_24FC12064();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_24FC478D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, unint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
  sub_24FC4EC28();
  a21 = v23;
  a22 = v24;
  a20 = v22;
  uint64_t v25 = *(void *)(v22 + 152);
  sub_24FC4E53C(v25, 1, *(void *)(v22 + 160));
  if (v26)
  {
    sub_24FC4DD90(v25, &qword_269A5D590);
    if (qword_269A5C738 != -1) {
      swift_once();
    }
    uint64_t v27 = sub_24FC4F6B8();
    sub_24FC20B5C(v27, (uint64_t)qword_269A5EA10);
    swift_bridgeObjectRetain_n();
    unint64_t v28 = (void *)sub_24FC4F698();
    os_log_type_t v29 = sub_24FC4FAE8();
    BOOL v30 = sub_24FC4E70C(v29);
    unint64_t v31 = *(void *)(v22 + 112);
    if (!v30)
    {
      sub_24FC4EDD8();

LABEL_15:
      uint64_t v36 = 1;
      goto LABEL_16;
    }
    uint64_t v32 = *(void *)(v22 + 104);
    os_log_type_t v33 = (_DWORD *)sub_24FC213F4();
    a9 = sub_24FC21434();
    *os_log_type_t v33 = 136315138;
    swift_bridgeObjectRetain();
    *(void *)(v22 + 88) = sub_24FC49DD0(v32, v31, &a9);
    sub_24FC4FB18();
    swift_bridgeObjectRelease_n();
    sub_24FC4EA18(&dword_24FC09000, v34, v35, "Field Stream %s is terminating");
    uint64_t v36 = 1;
    swift_arrayDestroy();
    sub_24FC211C4();
    sub_24FC211C4();

LABEL_16:
    _s19GenerativeFunctions24JsonObjectFieldContainerOwst_0(*(void *)(v22 + 96), v36, 1, *(void *)(v22 + 120));
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    sub_24FC12110();
LABEL_17:
    sub_24FC4E8D4();
    return v50(v49, v50, v51, v52, v53, v54, v55, v56, a9, a10, a11, a12, a13, a14);
  }
  sub_24FC45A60();
  if (qword_269A5C738 != -1) {
    swift_once();
  }
  uint64_t v37 = *(void *)(v22 + 184);
  uint64_t v38 = sub_24FC4F6B8();
  sub_24FC20B5C(v38, (uint64_t)qword_269A5EA10);
  sub_24FC4A574();
  swift_bridgeObjectRetain_n();
  uint64_t v39 = sub_24FC4F698();
  os_log_type_t v40 = sub_24FC4FAE8();
  BOOL v41 = sub_24FC2BE88(v40);
  uint64_t v42 = *(void *)(v22 + 184);
  if (v41)
  {
    uint64_t v44 = *(void *)(v22 + 104);
    unint64_t v43 = *(void *)(v22 + 112);
    uint64_t v45 = swift_slowAlloc();
    a9 = sub_24FC4EDF0();
    *(_DWORD *)uint64_t v45 = 136315394;
    swift_bridgeObjectRetain();
    *(void *)(v45 + 4) = sub_24FC49DD0(v44, v43, &a9);
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v45 + 12) = 2080;
    sub_24FC4A574();
    uint64_t v46 = sub_24FC4F828();
    *(void *)(v45 + 14) = sub_24FC49DD0(v46, v47, &a9);
    swift_bridgeObjectRelease();
    sub_24FC46FBC(v42, (void (*)(void))type metadata accessor for JsonObjectFieldContainer);
    _os_log_impl(&dword_24FC09000, v39, (os_log_type_t)v37, "Field Stream %s got: %s", (uint8_t *)v45, 0x16u);
    swift_arrayDestroy();
    sub_24FC211C4();
    sub_24FC211C4();
  }
  else
  {
    swift_bridgeObjectRelease_n();
    sub_24FC46FBC(v42, (void (*)(void))type metadata accessor for JsonObjectFieldContainer);
  }

  sub_24FC4A574();
  if (!swift_getEnumCaseMultiPayload())
  {
    uint64_t v58 = *(uint64_t **)(v22 + 168);
    uint64_t v59 = *v58;
    uint64_t v60 = v58[1];
    switch(*((unsigned char *)v58 + 16))
    {
      case 1:
        *(void *)(v22 + 40) = MEMORY[0x263F8D4F8];
        *(unsigned char *)(v22 + 16) = v59 & 1;
        break;
      case 2:
        uint64_t v70 = MEMORY[0x263F8D6C8];
        goto LABEL_28;
      case 3:
        uint64_t v70 = MEMORY[0x263F8D538];
LABEL_28:
        *(void *)(v22 + 40) = v70;
        *(void *)(v22 + 16) = v59;
        break;
      case 4:
        *(void *)(v22 + 40) = &type metadata for JsonNull;
        break;
      default:
        *(void *)(v22 + 40) = MEMORY[0x263F8D310];
        *(void *)(v22 + 16) = v59;
        *(void *)(v22 + 24) = v60;
        break;
    }
    if ((swift_dynamicCast() & 1) == 0)
    {
      uint64_t v73 = *(void *)(v22 + 192);
      sub_24FC4EEBC(*(void *)(v22 + 144), 1);
      sub_24FC4E5C4();
      v74();
      a9 = 0;
      a10 = 0xE000000000000000;
      sub_24FC4FB78();
      unint64_t v75 = a10;
      *(void *)(v22 + 72) = a9;
      *(void *)(v22 + 80) = v75;
      sub_24FC4F898();
      sub_24FC4FBE8();
      sub_24FC4F898();
      sub_24FC4FD98();
      sub_24FC4F898();
      swift_bridgeObjectRelease();
      uint64_t v76 = *(void *)(v22 + 72);
      uint64_t v77 = *(void *)(v22 + 80);
      sub_24FC3B314();
      sub_24FC212F0();
      *uint64_t v78 = v76;
      v78[1] = v77;
      sub_24FC4E554((uint64_t)v78, 2);
      sub_24FC46FBC(v73, (void (*)(void))type metadata accessor for JsonObjectFieldContainer);
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      sub_24FC0BAC8();
      goto LABEL_17;
    }
    uint64_t v71 = *(void *)(v22 + 192);
    sub_24FC4EEBC(*(void *)(v22 + 144), 0);
    sub_24FC46FBC(v71, (void (*)(void))type metadata accessor for JsonObjectFieldContainer);
    sub_24FC4E860();
    sub_24FC1255C();
    v72();
    uint64_t v36 = 0;
    goto LABEL_16;
  }
  uint64_t v48 = *(void *)(v22 + 168);
  sub_24FC46FBC(*(void *)(v22 + 192), (void (*)(void))type metadata accessor for JsonObjectFieldContainer);
  sub_24FC46FBC(v48, (void (*)(void))type metadata accessor for JsonObjectFieldContainer);
  if (sub_24FC4F9E8()) {
    goto LABEL_15;
  }
  sub_24FC4E8F0();
  uint64_t v61 = (void *)swift_task_alloc();
  *(void *)(v22 + 216) = v61;
  void *v61 = v22;
  v61[1] = sub_24FC477F4;
  sub_24FC4E8D4();
  return MEMORY[0x270FA2100](v62, v63, v64, v65, v66, v67, v68, v69, a9, a10);
}

uint64_t sub_24FC4804C()
{
  sub_24FC12258();
  swift_endAccess();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_24FC0BAC8();
  return v0();
}

uint64_t StreamingObjectTokenStreamProcessor.enumStream<A>(objectID:field:)()
{
  sub_24FC12030();
  v1[7] = v2;
  v1[8] = v0;
  v1[5] = v3;
  v1[6] = v4;
  v1[3] = v5;
  v1[4] = v6;
  v1[2] = v7;
  uint64_t v8 = sub_24FC13C3C(&qword_269A5D480);
  v1[9] = v8;
  sub_24FC12018(v8);
  v1[10] = v9;
  v1[11] = sub_24FC12200();
  sub_24FC12064();
  return MEMORY[0x270FA2498](v10, v11, v12);
}

uint64_t sub_24FC4818C()
{
  sub_24FC12030();
  *(void *)(v0 + 96) = *(void *)(*(void *)(v0 + 64)
                                   + OBJC_IVAR____TtC19GenerativeFunctions35StreamingObjectTokenStreamProcessor_objectStreamMap);
  swift_retain();
  uint64_t v1 = sub_24FC4E580();
  return MEMORY[0x270FA2498](v1, v2, v3);
}

uint64_t sub_24FC48200()
{
  sub_24FC12240();
  sub_24FC48CD8(v0[3], v0[4], v0[5], v0[11]);
  v0[13] = 0;
  swift_release();
  sub_24FC12064();
  return MEMORY[0x270FA2498](v1, v2, v3);
}

uint64_t sub_24FC48294()
{
  sub_24FC304F0();
  uint64_t v1 = *(void *)(v0 + 72);
  uint64_t v3 = *(void *)(v0 + 32);
  uint64_t v2 = *(void *)(v0 + 40);
  uint64_t v4 = *(void *)(v0 + 16);
  uint64_t v5 = swift_allocObject();
  long long v10 = *(_OWORD *)(v0 + 48);
  *(_OWORD *)(v5 + 16) = v10;
  *(void *)(v5 + 32) = v3;
  *(void *)(v5 + 40) = v2;
  uint64_t v6 = sub_24FC4DBB0(&qword_269A5D4C0, &qword_269A5D480);
  swift_bridgeObjectRetain();
  sub_24FC0B1A8((uint64_t)sub_24FC4A554, v5, v1, v10, v6, v4);
  swift_release();
  sub_24FC215C8();
  v7();
  swift_task_dealloc();
  sub_24FC12110();
  return v8();
}

uint64_t sub_24FC483BC()
{
  sub_24FC12030();
  swift_task_dealloc();
  sub_24FC0BAC8();
  return v0();
}

uint64_t sub_24FC48418@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v24 = a2;
  v20[0] = a4;
  v20[1] = a1;
  uint64_t v5 = sub_24FC4FB08();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)v20 - v7;
  uint64_t v9 = type metadata accessor for JsonObjectFieldContainer();
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24FC4A574();
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
    case 2u:
      sub_24FC3B314();
      swift_allocError();
      *(void *)uint64_t v12 = 0xD000000000000029;
      *(void *)(v12 + 8) = 0x800000024FC51610;
      *(unsigned char *)(v12 + 16) = 2;
      swift_willThrow();
      return sub_24FC46FBC((uint64_t)v11, (void (*)(void))type metadata accessor for JsonObjectFieldContainer);
    case 3u:
    case 4u:
      sub_24FC3B314();
      swift_allocError();
      *(void *)uint64_t v14 = 0xD000000000000029;
      *(void *)(v14 + 8) = 0x800000024FC51610;
      goto LABEL_16;
    default:
      unint64_t v15 = *(void *)v11;
      unint64_t v16 = *((void *)v11 + 1);
      switch(v11[16])
      {
        case 1:
          uint64_t v23 = (ValueMetadata *)MEMORY[0x263F8D4F8];
          LOBYTE(v21) = v15 & 1;
          break;
        case 2:
          unint64_t v17 = (ValueMetadata *)MEMORY[0x263F8D6C8];
          goto LABEL_9;
        case 3:
          unint64_t v17 = (ValueMetadata *)MEMORY[0x263F8D538];
LABEL_9:
          uint64_t v23 = v17;
          unint64_t v21 = v15;
          break;
        case 4:
          uint64_t v23 = &type metadata for JsonNull;
          break;
        default:
          uint64_t v23 = (ValueMetadata *)MEMORY[0x263F8D310];
          unint64_t v21 = v15;
          unint64_t v22 = v16;
          break;
      }
      if (swift_dynamicCast())
      {
        unint64_t v21 = v20[2];
        unint64_t v22 = v20[3];
        swift_bridgeObjectRetain();
        sub_24FC4F958();
        if (_s19GenerativeFunctions24JsonObjectFieldContainerOwet_0((uint64_t)v8, 1, a3) != 1)
        {
          swift_bridgeObjectRelease();
          return (*(uint64_t (**)(void, char *, uint64_t))(*(void *)(a3 - 8) + 32))(v20[0], v8, a3);
        }
        (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
        unint64_t v21 = 0;
        unint64_t v22 = 0xE000000000000000;
        sub_24FC4FB78();
        sub_24FC4F898();
        sub_24FC4F898();
        swift_bridgeObjectRelease();
        sub_24FC4F898();
      }
      else
      {
        unint64_t v21 = 0;
        unint64_t v22 = 0xE000000000000000;
        sub_24FC4FB78();
        swift_bridgeObjectRelease();
        unint64_t v21 = 0xD000000000000015;
        unint64_t v22 = 0x800000024FC51640;
        sub_24FC4F898();
      }
      sub_24FC4F898();
      unint64_t v18 = v21;
      unint64_t v19 = v22;
      sub_24FC3B314();
      swift_allocError();
      *(void *)uint64_t v14 = v18;
      *(void *)(v14 + 8) = v19;
LABEL_16:
      *(unsigned char *)(v14 + 16) = 2;
      return swift_willThrow();
  }
}

uint64_t sub_24FC488AC()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_24FC12014;
  return StreamingObjectTokenStreamProcessor.stream<A>(parentObjectID:field:of:)();
}

uint64_t sub_24FC4898C()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_24FC12014;
  return StreamingObjectTokenStreamProcessor.enumStream<A>(objectID:field:)();
}

uint64_t sub_24FC48A68()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_24FC12014;
  return StreamingObjectTokenStreamProcessor.stream<A>(objectID:field:of:)();
}

uint64_t sub_24FC48B44(uint64_t a1)
{
  uint64_t v2 = sub_24FC13C3C(&qword_269A5D470);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_24FC4F388();
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v8 + 16))(v7, a1);
  sub_24FC4A574();
  uint64_t v9 = type metadata accessor for ObjectStreamingSupport(0);
  _s19GenerativeFunctions24JsonObjectFieldContainerOwst_0((uint64_t)v4, 0, 1, v9);
  swift_beginAccess();
  sub_24FC44D10((uint64_t)v4, (uint64_t)v7);
  swift_endAccess();
  return sub_24FC4A574();
}

uint64_t sub_24FC48CD8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v37 = a4;
  uint64_t v42 = a2;
  uint64_t v43 = a3;
  uint64_t v6 = type metadata accessor for ObjectStreamingSupport(0);
  uint64_t v7 = MEMORY[0x270FA5388](v6);
  uint64_t v38 = (char *)&v36 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v36 - v9;
  uint64_t v11 = sub_24FC13C3C(&qword_269A5D470);
  uint64_t v12 = MEMORY[0x270FA5388](v11 - 8);
  uint64_t v39 = (uint64_t)&v36 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  unint64_t v15 = (char *)&v36 - v14;
  uint64_t v16 = sub_24FC13C3C(&qword_269A5D468);
  MEMORY[0x270FA5388](v16 - 8);
  unint64_t v18 = (char *)&v36 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_24FC13C3C(&qword_269A5D480);
  uint64_t v20 = *(void *)(v19 - 8);
  MEMORY[0x270FA5388](v19);
  unint64_t v22 = (char *)&v36 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  os_log_type_t v40 = (uint64_t *)(v4 + 112);
  swift_beginAccess();
  uint64_t v23 = *(void *)(v4 + 112);
  swift_bridgeObjectRetain();
  uint64_t v41 = a1;
  sub_24FC3A350(a1, v23, (uint64_t)v15);
  swift_bridgeObjectRelease();
  if (_s19GenerativeFunctions24JsonObjectFieldContainerOwet_0((uint64_t)v15, 1, v6))
  {
    sub_24FC4DD90((uint64_t)v15, &qword_269A5D470);
  }
  else
  {
    sub_24FC4A574();
    sub_24FC4DD90((uint64_t)v15, &qword_269A5D470);
    uint64_t v24 = *(void *)&v10[*(int *)(v6 + 20)];
    swift_bridgeObjectRetain();
    sub_24FC46FBC((uint64_t)v10, (void (*)(void))type metadata accessor for ObjectStreamingSupport);
    uint64_t v25 = v43;
    swift_bridgeObjectRetain();
    sub_24FC3A28C(v42, v25, v24, (uint64_t)v18);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v26 = type metadata accessor for FieldStreamingSupport(0);
    if (_s19GenerativeFunctions24JsonObjectFieldContainerOwet_0((uint64_t)v18, 1, v26) != 1)
    {
      (*(void (**)(char *, char *, uint64_t))(v20 + 16))(v22, v18, v19);
      sub_24FC46FBC((uint64_t)v18, (void (*)(void))type metadata accessor for FieldStreamingSupport);
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v20 + 32))(v37, v22, v19);
    }
    sub_24FC4DD90((uint64_t)v18, &qword_269A5D468);
  }
  uint64_t v44 = 0;
  unint64_t v45 = 0xE000000000000000;
  sub_24FC4FB78();
  sub_24FC4F898();
  sub_24FC4F388();
  sub_24FC4D6F4(&qword_269A5CCE0, MEMORY[0x263F07508]);
  uint64_t v27 = v41;
  sub_24FC4FC68();
  sub_24FC4F898();
  swift_bridgeObjectRelease();
  sub_24FC4F898();
  sub_24FC4F898();
  sub_24FC4F898();
  uint64_t v28 = *v40;
  swift_bridgeObjectRetain();
  uint64_t v29 = v39;
  sub_24FC3A350(v27, v28, v39);
  swift_bridgeObjectRelease();
  if (_s19GenerativeFunctions24JsonObjectFieldContainerOwet_0(v29, 1, v6))
  {
    sub_24FC4DD90(v29, &qword_269A5D470);
    uint64_t v30 = 0;
  }
  else
  {
    uint64_t v31 = (uint64_t)v38;
    sub_24FC4A574();
    sub_24FC4DD90(v29, &qword_269A5D470);
    uint64_t v30 = *(void *)(v31 + *(int *)(v6 + 20));
    swift_bridgeObjectRetain();
    sub_24FC46FBC(v31, (void (*)(void))type metadata accessor for ObjectStreamingSupport);
  }
  uint64_t v46 = v30;
  sub_24FC13C3C(&qword_269A5D598);
  sub_24FC4F828();
  sub_24FC4F898();
  swift_bridgeObjectRelease();
  uint64_t v32 = v44;
  unint64_t v33 = v45;
  sub_24FC3B314();
  swift_allocError();
  *(void *)uint64_t v34 = v32;
  *(void *)(v34 + 8) = v33;
  *(unsigned char *)(v34 + 16) = 2;
  return swift_willThrow();
}

uint64_t sub_24FC49260()
{
  swift_release();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_24FC492A0()
{
  sub_24FC12258();
  uint64_t v2 = v1;
  uint64_t v3 = v0[2];
  uint64_t v4 = v0[3];
  uint64_t v6 = v0[4];
  uint64_t v5 = v0[5];
  uint64_t v7 = swift_task_alloc();
  uint64_t v8 = (void *)sub_24FC121E0(v7);
  *uint64_t v8 = v9;
  v8[1] = sub_24FC12014;
  return sub_24FC475E0(v2, v4, v6, v5, v3);
}

uint64_t sub_24FC49354(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for ObjectStreamingSupport(0) - 8;
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t v6 = *(void *)(v1 + 112);
  uint64_t v9 = *(void *)(v6 + 64);
  uint64_t v8 = v6 + 64;
  uint64_t v7 = v9;
  uint64_t v10 = 1 << *(unsigned char *)(*(void *)(v1 + 112) + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  uint64_t v12 = v11 & v7;
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v15 = 0;
  if (!v12) {
    goto LABEL_5;
  }
LABEL_4:
  for (v12 &= v12 - 1; ; uint64_t v12 = (v17 - 1) & v17)
  {
    sub_24FC4A574();
    sub_24FC43C90(a1);
    uint64_t result = sub_24FC46FBC((uint64_t)v5, (void (*)(void))type metadata accessor for ObjectStreamingSupport);
    if (v12) {
      goto LABEL_4;
    }
LABEL_5:
    int64_t v16 = v15 + 1;
    if (__OFADD__(v15, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v16 >= v13) {
      return swift_release();
    }
    uint64_t v17 = *(void *)(v8 + 8 * v16);
    ++v15;
    if (!v17)
    {
      int64_t v15 = v16 + 1;
      if (v16 + 1 >= v13) {
        return swift_release();
      }
      uint64_t v17 = *(void *)(v8 + 8 * v15);
      if (!v17)
      {
        int64_t v15 = v16 + 2;
        if (v16 + 2 >= v13) {
          return swift_release();
        }
        uint64_t v17 = *(void *)(v8 + 8 * v15);
        if (!v17)
        {
          int64_t v15 = v16 + 3;
          if (v16 + 3 >= v13) {
            return swift_release();
          }
          uint64_t v17 = *(void *)(v8 + 8 * v15);
          if (!v17) {
            break;
          }
        }
      }
    }
LABEL_20:
    ;
  }
  int64_t v18 = v16 + 4;
  if (v18 >= v13) {
    return swift_release();
  }
  uint64_t v17 = *(void *)(v8 + 8 * v18);
  if (v17)
  {
    int64_t v15 = v18;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v15 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v15 >= v13) {
      return swift_release();
    }
    uint64_t v17 = *(void *)(v8 + 8 * v15);
    ++v18;
    if (v17) {
      goto LABEL_20;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_24FC49588()
{
  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();
  return MEMORY[0x270FA2418](v0);
}

uint64_t AsyncThrowingStream.Continuation<>.emit(_:)()
{
  uint64_t v0 = type metadata accessor for JsonStreamEvent(0);
  uint64_t v1 = sub_24FC4E60C(v0);
  MEMORY[0x270FA5388](v1);
  sub_24FC126B4();
  sub_24FC13C3C(&qword_269A5D4C8);
  sub_24FC14ED0();
  MEMORY[0x270FA5388](v2);
  sub_24FC126B4();
  sub_24FC4A574();
  sub_24FC13C3C(&qword_269A5D3B8);
  sub_24FC4FA58();
  sub_24FC4E5D0();
  return v3();
}

uint64_t sub_24FC496D8(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_24FC497B4;
  return v6(a1);
}

uint64_t sub_24FC497B4()
{
  sub_24FC12030();
  sub_24FC0BAB0();
  uint64_t v1 = *v0;
  sub_24FC1203C();
  void *v2 = v1;
  swift_task_dealloc();
  sub_24FC12110();
  return v3();
}

uint64_t sub_24FC49874(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  *(void *)(v6 + 56) = v5;
  uint64_t v12 = sub_24FC4FBA8();
  *(void *)(v6 + 64) = v12;
  *(void *)(v6 + 72) = *(void *)(v12 - 8);
  *(void *)(v6 + 80) = swift_task_alloc();
  *(void *)(v6 + 88) = swift_task_alloc();
  *(void *)(v6 + 40) = a1;
  *(void *)(v6 + 48) = a2;
  *(void *)(v6 + 16) = a3;
  *(void *)(v6 + 24) = a4;
  *(unsigned char *)(v6 + 32) = a5 & 1;
  return MEMORY[0x270FA2498](sub_24FC49978, 0, 0);
}

uint64_t sub_24FC49978(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  sub_24FC30158();
  sub_24FC304F0();
  uint64_t v13 = v12[9];
  sub_24FC4FBC8();
  sub_24FC4D6F4(&qword_269A5D5C0, MEMORY[0x263F8F710]);
  sub_24FC213D8();
  sub_24FC4FCA8();
  sub_24FC4D6F4(&qword_269A5D5C8, MEMORY[0x263F8F6D8]);
  sub_24FC4FBD8();
  v12[12] = *(void *)(v13 + 8);
  v12[13] = (v13 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  sub_24FC4E618();
  v14();
  int64_t v15 = (void *)swift_task_alloc();
  v12[14] = v15;
  *int64_t v15 = v12;
  v15[1] = sub_24FC49AEC;
  sub_24FC4E860();
  sub_24FC23FDC();
  return MEMORY[0x270FA2380](v16, v17, v18, v19, v20, v21, v22, v23, a9, a10, a11, a12);
}

uint64_t sub_24FC49AEC()
{
  sub_24FC12258();
  sub_24FC0BAB0();
  uint64_t v3 = v2;
  sub_24FC1204C();
  *uint64_t v4 = v3;
  uint64_t v6 = *(void (**)(uint64_t))(v5 + 96);
  uint64_t v7 = *v1;
  sub_24FC1203C();
  *uint64_t v8 = v7;
  *(void *)(v3 + 120) = v0;
  swift_task_dealloc();
  uint64_t v9 = sub_24FC213D8();
  v6(v9);
  if (v0)
  {
    sub_24FC12064();
    return MEMORY[0x270FA2498](v10, v11, v12);
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    sub_24FC12110();
    return v13();
  }
}

uint64_t sub_24FC49C64()
{
  sub_24FC12030();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24FC49CCC()
{
  return sub_24FC49CFC((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_24FC2A400);
}

uint64_t sub_24FC49CE4()
{
  return sub_24FC49CFC((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_24FC2A538);
}

uint64_t sub_24FC49CFC(uint64_t (*a1)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v3 = *v1;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  *uint64_t v1 = v3;
  if (!result)
  {
    uint64_t result = a1(result, *(void *)(v3 + 16) + 1, 1, v3);
    *uint64_t v1 = result;
  }
  return result;
}

uint64_t sub_24FC49D58(uint64_t a1)
{
  return sub_24FC49D88(a1, (uint64_t (*)(BOOL))sub_24FC2A400);
}

uint64_t sub_24FC49D70(uint64_t a1)
{
  return sub_24FC49D88(a1, (uint64_t (*)(BOOL))sub_24FC2A538);
}

uint64_t sub_24FC49D88(uint64_t result, uint64_t (*a2)(BOOL))
{
  unint64_t v3 = *(void *)(*(void *)v2 + 24);
  if (result + 1 > (uint64_t)(v3 >> 1))
  {
    uint64_t result = a2(v3 > 1);
    *(void *)uint64_t v2 = result;
  }
  return result;
}

uint64_t sub_24FC49DD0(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  sub_24FC12064();
  uint64_t v9 = sub_24FC49EA0(v6, v7, v8, 1, a1, a2);
  uint64_t v10 = v15[0];
  if (v9)
  {
    uint64_t v11 = v9;
    uint64_t ObjectType = swift_getObjectType();
    v15[0] = v11;
    uint64_t v12 = *a3;
    if (*a3)
    {
      sub_24FC4D7C8((uint64_t)v15, *a3);
      *a3 = v12 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = MEMORY[0x263F8DBE0];
    v15[0] = a1;
    v15[1] = a2;
    uint64_t v13 = *a3;
    if (*a3)
    {
      sub_24FC4D7C8((uint64_t)v15, *a3);
      *a3 = v13 + 32;
    }
    swift_bridgeObjectRetain();
  }
  _s19GenerativeFunctions26TokenStreamProcessorCloserVwxx_0((uint64_t)v15);
  return v10;
}

uint64_t sub_24FC49EA0(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_24FC49FF8((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_24FC4FB28();
      uint64_t result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    uint64_t result = sub_24FC4A0D0(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    uint64_t v8 = sub_24FC4FB98();
    if (!v8)
    {
      uint64_t result = sub_24FC4FC18();
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

void *sub_24FC49FF8(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_24FC4FC38();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

uint64_t sub_24FC4A0D0(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_24FC4A168(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = (uint64_t)sub_24FC4A2DC(0, *(void *)(v2 + 16) + 1, 1, v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = (uint64_t)sub_24FC4A2DC((char *)(v3 > 1), v4 + 1, 1, v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_24FC4A168(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    uint64_t v2 = sub_24FC4F8B8();
    if (v2) {
      goto LABEL_6;
    }
    return MEMORY[0x263F8EE78];
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v2) {
    return MEMORY[0x263F8EE78];
  }
LABEL_6:
  unint64_t v3 = sub_24FC2AD58(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    unint64_t v4 = v3;
    uint64_t v5 = sub_24FC4FB88();
    if ((v6 & 1) != 0 || v5 != v2) {
      goto LABEL_14;
    }
    return (uint64_t)v4;
  }
  sub_24FC4FC38();
  __break(1u);
LABEL_14:
  uint64_t result = sub_24FC4FC18();
  __break(1u);
  return result;
}

char *sub_24FC4A2DC(char *result, int64_t a2, char a3, uint64_t a4)
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
    sub_24FC13C3C(&qword_269A5CE10);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_24FC4A48C(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_24FC4A3B4(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_24FC4A3B4(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_24FC4FC38();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

char *sub_24FC4A48C(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_24FC4FC38();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

uint64_t sub_24FC4A51C()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_24FC4A554@<X0>(uint64_t a1@<X8>)
{
  return sub_24FC48418(v1[4], v1[5], v1[2], a1);
}

uint64_t sub_24FC4A574()
{
  uint64_t v1 = sub_24FC4EBFC();
  v2(v1);
  sub_24FC12084();
  sub_24FC123C0();
  v3();
  return v0;
}

uint64_t dispatch thunk of _StreamSanitizer._sanitize(_:)()
{
  sub_24FC1249C();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v12 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v0 + 8) + **(int **)(v0 + 8));
  uint64_t v8 = swift_task_alloc();
  int64_t v9 = (void *)sub_24FC121E0(v8);
  *int64_t v9 = v10;
  v9[1] = sub_24FC0C22C;
  return v12(v7, v5, v3, v1);
}

uint64_t sub_24FC4A6CC()
{
  return type metadata accessor for StreamingObjectTokenStreamProcessor(0);
}

void sub_24FC4A6D4()
{
  sub_24FC4A9F4(319, &qword_269A5D510, &qword_269A5D3A8);
  if (v0 <= 0x3F)
  {
    sub_24FC4A9F4(319, &qword_269A5D518, &qword_269A5D3B8);
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

uint64_t method lookup function for StreamingObjectTokenStreamProcessor(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for StreamingObjectTokenStreamProcessor);
}

uint64_t dispatch thunk of StreamingObjectTokenStreamProcessor.__allocating_init(_:)()
{
  return (*(uint64_t (**)(void))(v0 + 280))();
}

uint64_t dispatch thunk of StreamingObjectTokenStreamProcessor.startStreaming(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 288))();
}

{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(void *)v0 + 296))();
}

uint64_t dispatch thunk of StreamingObjectTokenStreamProcessor.stopStreaming()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 304))();
}

uint64_t dispatch thunk of StreamingObjectTokenStreamProcessor.stream<A>(timeout:_:)()
{
  sub_24FC304F0();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  uint64_t v17 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(*(void *)v0 + 312)
                                                                                     + **(int **)(*(void *)v0 + 312));
  uint64_t v12 = v11 & 1;
  uint64_t v13 = swift_task_alloc();
  uint64_t v14 = (void *)sub_24FC121E0(v13);
  *uint64_t v14 = v15;
  v14[1] = sub_24FC12014;
  return v17(v10, v8, v12, v6, v4, v2);
}

void sub_24FC4A9F4(uint64_t a1, unint64_t *a2, uint64_t *a3)
{
  if (!*a2)
  {
    sub_24FC1607C(a3);
    unint64_t v4 = sub_24FC4FB08();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t *sub_24FC4AA44(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v7 = sub_24FC4F388();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 20));
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_24FC4AB14(uint64_t a1)
{
  uint64_t v2 = sub_24FC4F388();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return swift_bridgeObjectRelease();
}

uint64_t sub_24FC4AB88(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24FC4F388();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_24FC4AC08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24FC4F388();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_24FC4AC94(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24FC4F388();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_24FC4AD10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24FC4F388();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_24FC4AD94(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24FC4ADA8);
}

uint64_t sub_24FC4ADA8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_24FC4F388();
  sub_24FC1B90C();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    return _s19GenerativeFunctions24JsonObjectFieldContainerOwet_0(a1, a2, v6);
  }
  else
  {
    unint64_t v9 = *(void *)(a1 + *(int *)(a3 + 20));
    if (v9 >= 0xFFFFFFFF) {
      LODWORD(v9) = -1;
    }
    return (v9 + 1);
  }
}

uint64_t sub_24FC4AE34(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24FC4AE48);
}

void sub_24FC4AE48()
{
  sub_24FC4ECDC();
  sub_24FC4F388();
  sub_24FC1B90C();
  if (*(_DWORD *)(v5 + 84) == v3)
  {
    _s19GenerativeFunctions24JsonObjectFieldContainerOwst_0(v1, v0, v0, v4);
  }
  else
  {
    *(void *)(v1 + *(int *)(v2 + 20)) = (v0 - 1);
  }
}

uint64_t sub_24FC4AEC4()
{
  uint64_t result = sub_24FC4F388();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_24FC4AF5C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_24FC13C3C(&qword_269A5D480);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    unint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_24FC13C3C(&qword_269A5D490);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
  }
  return a1;
}

uint64_t sub_24FC4B06C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24FC13C3C(&qword_269A5D480);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t v6 = sub_24FC13C3C(&qword_269A5D490);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);
  return v7(v5, v6);
}

uint64_t sub_24FC4B11C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24FC13C3C(&qword_269A5D480);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_24FC13C3C(&qword_269A5D490);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  return a1;
}

uint64_t sub_24FC4B1DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24FC13C3C(&qword_269A5D480);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_24FC13C3C(&qword_269A5D490);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  return a1;
}

uint64_t sub_24FC4B29C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24FC13C3C(&qword_269A5D480);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_24FC13C3C(&qword_269A5D490);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  return a1;
}

uint64_t sub_24FC4B35C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24FC13C3C(&qword_269A5D480);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_24FC13C3C(&qword_269A5D490);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t sub_24FC4B41C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24FC4B430);
}

uint64_t sub_24FC4B430(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_24FC13C3C(&qword_269A5D480);
  sub_24FC1B90C();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1;
  }
  else
  {
    uint64_t v8 = sub_24FC13C3C(&qword_269A5D490);
    uint64_t v9 = a1 + *(int *)(a3 + 20);
  }
  return _s19GenerativeFunctions24JsonObjectFieldContainerOwet_0(v9, a2, v8);
}

uint64_t sub_24FC4B4B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24FC4B4C8);
}

uint64_t sub_24FC4B4C8()
{
  sub_24FC4ECDC();
  sub_24FC13C3C(&qword_269A5D480);
  sub_24FC1B90C();
  if (*(_DWORD *)(v5 + 84) == v3)
  {
    uint64_t v6 = v4;
    uint64_t v7 = v1;
  }
  else
  {
    uint64_t v6 = sub_24FC13C3C(&qword_269A5D490);
    uint64_t v7 = v1 + *(int *)(v2 + 20);
  }
  return _s19GenerativeFunctions24JsonObjectFieldContainerOwst_0(v7, v0, v0, v6);
}

void sub_24FC4B548()
{
  sub_24FC4B648(319, &qword_269A5D540, MEMORY[0x263F8F6B8]);
  if (v0 <= 0x3F)
  {
    sub_24FC4B648(319, &qword_269A5D548, MEMORY[0x263F8F690]);
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_24FC4B648(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t, uint64_t, void))
{
  if (!*a2)
  {
    uint64_t v6 = type metadata accessor for JsonObjectFieldContainer();
    uint64_t v7 = sub_24FC1607C(&qword_269A5CBA0);
    unint64_t v8 = a3(a1, v6, v7, MEMORY[0x263F8E4E0]);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

uint64_t sub_24FC4B6C8(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 2u) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t destroy for TokenStreamingError(uint64_t a1)
{
  return sub_24FC4B6F0(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t sub_24FC4B6F0(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 2u) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t _s19GenerativeFunctions19TokenStreamingErrorOwCP_0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  unsigned __int8 v5 = *((unsigned char *)a2 + 16);
  uint64_t v6 = sub_24FC4EC9C();
  sub_24FC4B6C8(v6, v7, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for TokenStreamingError(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 16);
  sub_24FC4B6C8(*(void *)a2, v4, v5);
  uint64_t v6 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  unsigned __int8 v8 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v5;
  sub_24FC4B6F0(v6, v7, v8);
  return a1;
}

uint64_t assignWithTake for TokenStreamingError(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  unsigned __int8 v6 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v3;
  sub_24FC4B6F0(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for TokenStreamingError(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFD && *(unsigned char *)(a1 + 17))
    {
      int v2 = *(_DWORD *)a1 + 252;
    }
    else
    {
      unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
      if (v3 <= 3) {
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

uint64_t storeEnumTagSinglePayload for TokenStreamingError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)uint64_t result = a2 - 253;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_24FC4B874(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 2u) {
    return *(unsigned __int8 *)(a1 + 16);
  }
  else {
    return (*(_DWORD *)a1 + 3);
  }
}

uint64_t sub_24FC4B88C(uint64_t result, unsigned int a2)
{
  if (a2 >= 3)
  {
    *(void *)uint64_t result = a2 - 3;
    *(void *)(result + 8) = 0;
    LOBYTE(a2) = 3;
  }
  *(unsigned char *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for TokenStreamingError()
{
  return &type metadata for TokenStreamingError;
}

ValueMetadata *type metadata accessor for NoOpStreamSanitizer()
{
  return &type metadata for NoOpStreamSanitizer;
}

uint64_t sub_24FC4B8C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24FC13C3C(&qword_269A5D560);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

size_t sub_24FC4B92C(size_t a1, int64_t a2, char a3)
{
  size_t result = sub_24FC4B96C(a1, a2, a3, *v3);
  *unsigned int v3 = result;
  return result;
}

char *sub_24FC4B94C(char *a1, int64_t a2, char a3)
{
  size_t result = sub_24FC4BB08(a1, a2, a3, *v3);
  *unsigned int v3 = (uint64_t)result;
  return result;
}

size_t sub_24FC4B96C(size_t result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = result;
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_25:
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
  if (!v9)
  {
    uint64_t v13 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  sub_24FC13C3C(&qword_269A5D600);
  uint64_t v10 = *(void *)(sub_24FC4F458() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t result = j__malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  if (result - v12 == 0x8000000000000000 && v11 == -1) {
    goto LABEL_24;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(result - v12) / v11);
LABEL_19:
  uint64_t v15 = *(void *)(sub_24FC4F458() - 8);
  unint64_t v16 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  unint64_t v17 = (unint64_t)v13 + v16;
  unint64_t v18 = a4 + v16;
  if (v5)
  {
    sub_24FC2AC20(v18, v8, v17);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_24FC3A130(v18, v8, v17);
  }
  swift_release();
  return (size_t)v13;
}

char *sub_24FC4BB08(char *result, int64_t a2, char a3, uint64_t a4)
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
    sub_24FC13C3C(&qword_269A5CE58);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  unint64_t v12 = v10 + 32;
  uint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_24FC2AB94(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_24FC3A070((unint64_t)v13, v8, (unint64_t)v12);
  }
  swift_release();
  return v10;
}

uint64_t sub_24FC4BBEC(uint64_t a1, char *a2)
{
  unsigned int v3 = v2;
  uint64_t v6 = sub_24FC4F388();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *v2;
  sub_24FC4D6F4(&qword_269A5CC48, MEMORY[0x263F07508]);
  swift_bridgeObjectRetain();
  unint64_t v33 = a2;
  uint64_t v11 = sub_24FC4F7B8();
  uint64_t v12 = -1 << *(unsigned char *)(v10 + 32);
  unint64_t v13 = v11 & ~v12;
  uint64_t v32 = v10 + 56;
  if ((*(void *)(v10 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13))
  {
    uint64_t v28 = v2;
    uint64_t v29 = a1;
    uint64_t v30 = ~v12;
    uint64_t v27 = v7;
    unint64_t v16 = *(void (**)(void, void, void))(v7 + 16);
    uint64_t v15 = v7 + 16;
    uint64_t v14 = v16;
    uint64_t v31 = *(void *)(v15 + 56);
    unint64_t v17 = (void (**)(char *, uint64_t))(v15 - 8);
    v26[1] = v15 & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
    while (1)
    {
      uint64_t v18 = v10;
      unint64_t v19 = v31 * v13;
      uint64_t v20 = v14;
      v14(v9, *(void *)(v10 + 48) + v31 * v13, v6);
      sub_24FC4D6F4(&qword_269A5CC50, MEMORY[0x263F07508]);
      char v21 = sub_24FC4F818();
      uint64_t v22 = *v17;
      (*v17)(v9, v6);
      if (v21) {
        break;
      }
      unint64_t v13 = (v13 + 1) & v30;
      uint64_t v10 = v18;
      uint64_t v14 = v20;
      if (((*(void *)(v32 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13) & 1) == 0)
      {
        swift_bridgeObjectRelease();
        unsigned int v3 = v28;
        a1 = v29;
        uint64_t v7 = v27;
        goto LABEL_7;
      }
    }
    swift_bridgeObjectRelease();
    v22(v33, v6);
    v20(v29, *(void *)(*v28 + 48) + v19, v6);
    return 0;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v14 = *(void (**)(void, void, void))(v7 + 16);
LABEL_7:
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v24 = v33;
    v14(v9, v33, v6);
    uint64_t v34 = *v3;
    *unsigned int v3 = 0x8000000000000000;
    sub_24FC4CF4C((uint64_t)v9, v13, isUniquelyReferenced_nonNull_native);
    *unsigned int v3 = v34;
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(a1, v24, v6);
    return 1;
  }
}

uint64_t sub_24FC4BF10@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = sub_24FC4F388();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *v2;
  sub_24FC4D6F4(&qword_269A5CC48, MEMORY[0x263F07508]);
  swift_bridgeObjectRetain();
  uint64_t v30 = a1;
  uint64_t v10 = sub_24FC4F7B8();
  uint64_t v11 = -1 << *(unsigned char *)(v9 + 32);
  unint64_t v12 = v10 & ~v11;
  uint64_t v29 = v9 + 56;
  if ((*(void *)(v9 + 56 + ((v12 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v12))
  {
    uint64_t v26 = v2;
    uint64_t v27 = a2;
    uint64_t v28 = ~v11;
    uint64_t v25 = v6;
    uint64_t v15 = *(void (**)(char *, unint64_t, uint64_t))(v6 + 16);
    uint64_t v14 = v6 + 16;
    unint64_t v13 = v15;
    uint64_t v16 = *(void *)(v14 + 56);
    while (1)
    {
      v13(v8, *(void *)(v9 + 48) + v16 * v12, v5);
      sub_24FC4D6F4(&qword_269A5CC50, MEMORY[0x263F07508]);
      char v17 = sub_24FC4F818();
      (*(void (**)(char *, uint64_t))(v14 - 8))(v8, v5);
      if (v17) {
        break;
      }
      unint64_t v12 = (v12 + 1) & v28;
      if (((*(void *)(v29 + ((v12 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v12) & 1) == 0)
      {
        swift_bridgeObjectRelease();
        uint64_t v18 = 1;
        a2 = v27;
        return _s19GenerativeFunctions24JsonObjectFieldContainerOwst_0(a2, v18, 1, v5);
      }
    }
    swift_bridgeObjectRelease();
    unint64_t v19 = v26;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v21 = *v19;
    uint64_t v31 = *v19;
    *unint64_t v19 = 0x8000000000000000;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      sub_24FC4C1EC();
      uint64_t v21 = v31;
    }
    unint64_t v22 = *(void *)(v21 + 48) + v16 * v12;
    a2 = v27;
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v25 + 32))(v27, v22, v5);
    sub_24FC4CC40(v12);
    *unint64_t v19 = v31;
    swift_bridgeObjectRelease();
    uint64_t v18 = 0;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v18 = 1;
  }
  return _s19GenerativeFunctions24JsonObjectFieldContainerOwst_0(a2, v18, 1, v5);
}

void *sub_24FC4C1EC()
{
  unint64_t v1 = v0;
  uint64_t v2 = sub_24FC4F388();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24FC13C3C(&qword_269A5D608);
  uint64_t v6 = *v0;
  uint64_t v7 = sub_24FC4FB48();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
    size_t result = (void *)swift_release();
LABEL_30:
    *unint64_t v1 = v8;
    return result;
  }
  size_t result = (void *)(v7 + 56);
  unint64_t v10 = (unint64_t)((1 << *(unsigned char *)(v8 + 32)) + 63) >> 6;
  uint64_t v24 = v1;
  uint64_t v25 = (const void *)(v6 + 56);
  if (v8 != v6 || (unint64_t)result >= v6 + 56 + 8 * v10) {
    size_t result = memmove(result, v25, 8 * v10);
  }
  int64_t v12 = 0;
  *(void *)(v8 + 16) = *(void *)(v6 + 16);
  uint64_t v13 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v14 = *(void *)(v6 + 56);
  uint64_t v15 = -1;
  if (v13 < 64) {
    uint64_t v15 = ~(-1 << v13);
  }
  unint64_t v16 = v15 & v14;
  int64_t v26 = (unint64_t)(v13 + 63) >> 6;
  if ((v15 & v14) == 0) {
    goto LABEL_12;
  }
LABEL_11:
  unint64_t v17 = __clz(__rbit64(v16));
  v16 &= v16 - 1;
  for (unint64_t i = v17 | (v12 << 6); ; unint64_t i = __clz(__rbit64(v20)) + (v12 << 6))
  {
    unint64_t v22 = *(void *)(v3 + 72) * i;
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v5, *(void *)(v6 + 48) + v22, v2);
    size_t result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(void *)(v8 + 48) + v22, v5, v2);
    if (v16) {
      goto LABEL_11;
    }
LABEL_12:
    int64_t v19 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_32;
    }
    if (v19 >= v26) {
      goto LABEL_28;
    }
    unint64_t v20 = *((void *)v25 + v19);
    ++v12;
    if (!v20)
    {
      int64_t v12 = v19 + 1;
      if (v19 + 1 >= v26) {
        goto LABEL_28;
      }
      unint64_t v20 = *((void *)v25 + v12);
      if (!v20)
      {
        int64_t v12 = v19 + 2;
        if (v19 + 2 >= v26) {
          goto LABEL_28;
        }
        unint64_t v20 = *((void *)v25 + v12);
        if (!v20) {
          break;
        }
      }
    }
LABEL_25:
    unint64_t v16 = (v20 - 1) & v20;
  }
  int64_t v21 = v19 + 3;
  if (v21 >= v26)
  {
LABEL_28:
    size_t result = (void *)swift_release();
    unint64_t v1 = v24;
    goto LABEL_30;
  }
  unint64_t v20 = *((void *)v25 + v21);
  if (v20)
  {
    int64_t v12 = v21;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v12 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v12 >= v26) {
      goto LABEL_28;
    }
    unint64_t v20 = *((void *)v25 + v12);
    ++v21;
    if (v20) {
      goto LABEL_25;
    }
  }
LABEL_32:
  __break(1u);
  return result;
}

uint64_t sub_24FC4C49C()
{
  unint64_t v1 = v0;
  uint64_t v2 = sub_24FC4F388();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *v0;
  sub_24FC13C3C(&qword_269A5D608);
  uint64_t v7 = sub_24FC4FB58();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
    uint64_t result = swift_release();
LABEL_34:
    *unint64_t v1 = v8;
    return result;
  }
  uint64_t v9 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v10 = *(void *)(v6 + 56);
  uint64_t v34 = v0;
  uint64_t v35 = v6 + 56;
  if (v9 < 64) {
    uint64_t v11 = ~(-1 << v9);
  }
  else {
    uint64_t v11 = -1;
  }
  unint64_t v12 = v11 & v10;
  int64_t v36 = (unint64_t)(v9 + 63) >> 6;
  uint64_t v37 = v3 + 16;
  uint64_t v13 = v7 + 56;
  uint64_t v38 = v3;
  uint64_t v14 = (uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32);
  uint64_t result = swift_retain();
  int64_t v16 = 0;
  if (!v12) {
    goto LABEL_7;
  }
LABEL_6:
  unint64_t v17 = __clz(__rbit64(v12));
  v12 &= v12 - 1;
  for (unint64_t i = v17 | (v16 << 6); ; unint64_t i = __clz(__rbit64(v20)) + (v16 << 6))
  {
    uint64_t v22 = v6;
    uint64_t v23 = *(void *)(v6 + 48);
    uint64_t v24 = *(void *)(v38 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v38 + 16))(v5, v23 + v24 * i, v2);
    sub_24FC4D6F4(&qword_269A5CC48, MEMORY[0x263F07508]);
    uint64_t result = sub_24FC4F7B8();
    uint64_t v25 = -1 << *(unsigned char *)(v8 + 32);
    unint64_t v26 = result & ~v25;
    unint64_t v27 = v26 >> 6;
    if (((-1 << v26) & ~*(void *)(v13 + 8 * (v26 >> 6))) == 0)
    {
      char v29 = 0;
      unint64_t v30 = (unint64_t)(63 - v25) >> 6;
      while (++v27 != v30 || (v29 & 1) == 0)
      {
        BOOL v31 = v27 == v30;
        if (v27 == v30) {
          unint64_t v27 = 0;
        }
        v29 |= v31;
        uint64_t v32 = *(void *)(v13 + 8 * v27);
        if (v32 != -1)
        {
          unint64_t v28 = __clz(__rbit64(~v32)) + (v27 << 6);
          goto LABEL_30;
        }
      }
      __break(1u);
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    unint64_t v28 = __clz(__rbit64((-1 << v26) & ~*(void *)(v13 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
    *(void *)(v13 + ((v28 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v28;
    uint64_t result = (*v14)(*(void *)(v8 + 48) + v28 * v24, v5, v2);
    ++*(void *)(v8 + 16);
    uint64_t v6 = v22;
    if (v12) {
      goto LABEL_6;
    }
LABEL_7:
    int64_t v19 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      goto LABEL_36;
    }
    if (v19 >= v36) {
      goto LABEL_32;
    }
    unint64_t v20 = *(void *)(v35 + 8 * v19);
    ++v16;
    if (!v20)
    {
      int64_t v16 = v19 + 1;
      if (v19 + 1 >= v36) {
        goto LABEL_32;
      }
      unint64_t v20 = *(void *)(v35 + 8 * v16);
      if (!v20)
      {
        int64_t v16 = v19 + 2;
        if (v19 + 2 >= v36) {
          goto LABEL_32;
        }
        unint64_t v20 = *(void *)(v35 + 8 * v16);
        if (!v20) {
          break;
        }
      }
    }
LABEL_20:
    unint64_t v12 = (v20 - 1) & v20;
  }
  int64_t v21 = v19 + 3;
  if (v21 >= v36)
  {
LABEL_32:
    uint64_t result = swift_release_n();
    unint64_t v1 = v34;
    goto LABEL_34;
  }
  unint64_t v20 = *(void *)(v35 + 8 * v21);
  if (v20)
  {
    int64_t v16 = v21;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v16 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v16 >= v36) {
      goto LABEL_32;
    }
    unint64_t v20 = *(void *)(v35 + 8 * v16);
    ++v21;
    if (v20) {
      goto LABEL_20;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_24FC4C848()
{
  unint64_t v1 = v0;
  uint64_t v42 = sub_24FC4F388();
  uint64_t v2 = *(void *)(v42 - 8);
  MEMORY[0x270FA5388](v42);
  uint64_t v41 = (char *)&v35 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = *v0;
  sub_24FC13C3C(&qword_269A5D608);
  uint64_t v5 = sub_24FC4FB58();
  uint64_t v6 = v5;
  if (*(void *)(v4 + 16))
  {
    uint64_t v7 = 1 << *(unsigned char *)(v4 + 32);
    uint64_t v8 = *(void *)(v4 + 56);
    uint64_t v37 = (void *)(v4 + 56);
    if (v7 < 64) {
      uint64_t v9 = ~(-1 << v7);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & v8;
    uint64_t v35 = v0;
    int64_t v36 = (unint64_t)(v7 + 63) >> 6;
    uint64_t v39 = v2;
    uint64_t v11 = v5 + 56;
    uint64_t result = swift_retain();
    int64_t v13 = 0;
    uint64_t v38 = v6;
    uint64_t v14 = v41;
    uint64_t v15 = v42;
    if (!v10) {
      goto LABEL_7;
    }
LABEL_6:
    unint64_t v16 = __clz(__rbit64(v10));
    v10 &= v10 - 1;
    int64_t v40 = v13;
    for (unint64_t i = v16 | (v13 << 6); ; unint64_t i = __clz(__rbit64(v19)) + (v20 << 6))
    {
      uint64_t v22 = v4;
      uint64_t v23 = *(void *)(v4 + 48);
      uint64_t v24 = *(void *)(v39 + 72);
      uint64_t v25 = *(void (**)(char *, unint64_t, uint64_t))(v39 + 32);
      v25(v14, v23 + v24 * i, v15);
      uint64_t v6 = v38;
      sub_24FC4D6F4(&qword_269A5CC48, MEMORY[0x263F07508]);
      uint64_t result = sub_24FC4F7B8();
      uint64_t v26 = -1 << *(unsigned char *)(v6 + 32);
      unint64_t v27 = result & ~v26;
      unint64_t v28 = v27 >> 6;
      if (((-1 << v27) & ~*(void *)(v11 + 8 * (v27 >> 6))) == 0)
      {
        char v30 = 0;
        unint64_t v31 = (unint64_t)(63 - v26) >> 6;
        while (++v28 != v31 || (v30 & 1) == 0)
        {
          BOOL v32 = v28 == v31;
          if (v28 == v31) {
            unint64_t v28 = 0;
          }
          v30 |= v32;
          uint64_t v33 = *(void *)(v11 + 8 * v28);
          if (v33 != -1)
          {
            unint64_t v29 = __clz(__rbit64(~v33)) + (v28 << 6);
            goto LABEL_30;
          }
        }
        __break(1u);
LABEL_38:
        __break(1u);
LABEL_39:
        __break(1u);
        return result;
      }
      unint64_t v29 = __clz(__rbit64((-1 << v27) & ~*(void *)(v11 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
      *(void *)(v11 + ((v29 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v29;
      uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))v25)(*(void *)(v6 + 48) + v29 * v24, v41, v42);
      ++*(void *)(v6 + 16);
      uint64_t v4 = v22;
      int64_t v13 = v40;
      if (v10) {
        goto LABEL_6;
      }
LABEL_7:
      int64_t v18 = v13 + 1;
      if (__OFADD__(v13, 1)) {
        goto LABEL_38;
      }
      if (v18 >= v36) {
        goto LABEL_32;
      }
      unint64_t v19 = v37[v18];
      int64_t v20 = v13 + 1;
      if (!v19)
      {
        int64_t v20 = v13 + 2;
        if (v13 + 2 >= v36) {
          goto LABEL_32;
        }
        unint64_t v19 = v37[v20];
        if (!v19)
        {
          int64_t v20 = v13 + 3;
          if (v13 + 3 >= v36) {
            goto LABEL_32;
          }
          unint64_t v19 = v37[v20];
          if (!v19)
          {
            uint64_t v21 = v13 + 4;
            if (v13 + 4 >= v36)
            {
LABEL_32:
              swift_release();
              unint64_t v1 = v35;
              uint64_t v34 = 1 << *(unsigned char *)(v4 + 32);
              if (v34 > 63) {
                sub_24FC4CF30(0, (unint64_t)(v34 + 63) >> 6, v37);
              }
              else {
                *uint64_t v37 = -1 << v34;
              }
              *(void *)(v4 + 16) = 0;
              break;
            }
            unint64_t v19 = v37[v21];
            if (!v19)
            {
              while (1)
              {
                int64_t v20 = v21 + 1;
                if (__OFADD__(v21, 1)) {
                  goto LABEL_39;
                }
                if (v20 >= v36) {
                  goto LABEL_32;
                }
                unint64_t v19 = v37[v20];
                ++v21;
                if (v19) {
                  goto LABEL_20;
                }
              }
            }
            int64_t v20 = v13 + 4;
          }
        }
      }
LABEL_20:
      unint64_t v10 = (v19 - 1) & v19;
      int64_t v40 = v20;
    }
  }
  uint64_t result = swift_release();
  *unint64_t v1 = v6;
  return result;
}

uint64_t sub_24FC4CC40(int64_t a1)
{
  uint64_t v3 = sub_24FC4F388();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t result = MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)&v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *v1;
  uint64_t v9 = *v1 + 56;
  uint64_t v10 = -1 << *(unsigned char *)(*v1 + 32);
  unint64_t v11 = (a1 + 1) & ~v10;
  if (((1 << v11) & *(void *)(v9 + 8 * (v11 >> 6))) != 0)
  {
    uint64_t v34 = v1;
    uint64_t v12 = ~v10;
    swift_retain();
    uint64_t v13 = sub_24FC4FB38();
    if ((*(void *)(v9 + 8 * (v11 >> 6)) & (1 << v11)) != 0)
    {
      unint64_t v36 = (v13 + 1) & v12;
      uint64_t v15 = *(void (**)(char *, unint64_t, uint64_t))(v4 + 16);
      uint64_t v14 = v4 + 16;
      uint64_t v35 = v15;
      uint64_t v16 = *(void *)(v14 + 56);
      uint64_t v37 = v14;
      uint64_t v38 = v16;
      unint64_t v17 = (void (**)(char *, uint64_t))(v14 - 8);
      do
      {
        uint64_t v18 = v9;
        int64_t v19 = v38 * v11;
        v35(v7, *(void *)(v8 + 48) + v38 * v11, v3);
        sub_24FC4D6F4(&qword_269A5CC48, MEMORY[0x263F07508]);
        uint64_t v20 = sub_24FC4F7B8();
        (*v17)(v7, v3);
        unint64_t v21 = v20 & v12;
        if (a1 >= (uint64_t)v36)
        {
          if (v21 < v36 || a1 < (uint64_t)v21)
          {
LABEL_20:
            uint64_t v9 = v18;
            goto LABEL_24;
          }
        }
        else if (v21 < v36 && a1 < (uint64_t)v21)
        {
          goto LABEL_20;
        }
        uint64_t v23 = *(void *)(v8 + 48);
        int64_t v24 = v38 * a1;
        unint64_t v25 = v23 + v38 * a1;
        unint64_t v26 = v23 + v19 + v38;
        BOOL v27 = v38 * a1 < v19 || v25 >= v26;
        uint64_t v9 = v18;
        if (v27)
        {
          swift_arrayInitWithTakeFrontToBack();
LABEL_23:
          a1 = v11;
          goto LABEL_24;
        }
        a1 = v11;
        if (v24 != v19)
        {
          swift_arrayInitWithTakeBackToFront();
          goto LABEL_23;
        }
LABEL_24:
        unint64_t v11 = (v11 + 1) & v12;
      }
      while (((*(void *)(v9 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11) & 1) != 0);
    }
    *(void *)(v9 + (((unint64_t)a1 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a1) - 1;
    uint64_t result = swift_release();
    unint64_t v1 = v34;
  }
  else
  {
    *(void *)(v9 + (((unint64_t)a1 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a1) - 1;
  }
  uint64_t v29 = *v1;
  uint64_t v30 = *(void *)(*v1 + 16);
  BOOL v31 = __OFSUB__(v30, 1);
  uint64_t v32 = v30 - 1;
  if (v31)
  {
    __break(1u);
  }
  else
  {
    *(void *)(v29 + 16) = v32;
    ++*(_DWORD *)(v29 + 36);
  }
  return result;
}

uint64_t sub_24FC4CF30(uint64_t result, uint64_t a2, void *a3)
{
  if (a2 < 0)
  {
    __break(1u);
  }
  else
  {
    for (; a2; --a2)
      *a3++ = result;
  }
  return result;
}

uint64_t sub_24FC4CF4C(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t v31 = a1;
  uint64_t v6 = sub_24FC4F388();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v10 = *(void *)(*v3 + 16);
  unint64_t v11 = *(void *)(*v3 + 24);
  unint64_t v28 = v3;
  uint64_t v29 = v7;
  if (v11 > v10 && (a3 & 1) != 0) {
    goto LABEL_12;
  }
  if (a3)
  {
    sub_24FC4C848();
  }
  else
  {
    if (v11 > v10)
    {
      sub_24FC4C1EC();
      goto LABEL_12;
    }
    sub_24FC4C49C();
  }
  uint64_t v12 = *v3;
  sub_24FC4D6F4(&qword_269A5CC48, MEMORY[0x263F07508]);
  uint64_t v13 = sub_24FC4F7B8();
  uint64_t v14 = -1 << *(unsigned char *)(v12 + 32);
  a2 = v13 & ~v14;
  uint64_t v30 = v12;
  uint64_t v15 = v12 + 56;
  if ((*(void *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    uint64_t v16 = ~v14;
    int64_t v19 = *(void (**)(char *, unint64_t, uint64_t))(v7 + 16);
    uint64_t v18 = v7 + 16;
    unint64_t v17 = v19;
    uint64_t v20 = *(void *)(v18 + 56);
    do
    {
      v17(v9, *(void *)(v30 + 48) + v20 * a2, v6);
      sub_24FC4D6F4(&qword_269A5CC50, MEMORY[0x263F07508]);
      char v21 = sub_24FC4F818();
      (*(void (**)(char *, uint64_t))(v18 - 8))(v9, v6);
      if (v21) {
        goto LABEL_15;
      }
      a2 = (a2 + 1) & v16;
    }
    while (((*(void *)(v15 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
  }
LABEL_12:
  uint64_t v22 = v29;
  uint64_t v23 = *v28;
  *(void *)(v23 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v22 + 32))(*(void *)(v23 + 48) + *(void *)(v22 + 72) * a2, v31, v6);
  uint64_t v25 = *(void *)(v23 + 16);
  BOOL v26 = __OFADD__(v25, 1);
  uint64_t v27 = v25 + 1;
  if (!v26)
  {
    *(void *)(v23 + 16) = v27;
    return result;
  }
  __break(1u);
LABEL_15:
  uint64_t result = sub_24FC4FC88();
  __break(1u);
  return result;
}

uint64_t sub_24FC4D1EC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_24FC17E4C(a1);
  LOBYTE(a1) = v7;
  swift_bridgeObjectRelease();
  if (a1)
  {
    swift_isUniquelyReferenced_nonNull_native();
    uint64_t v15 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    sub_24FC13C3C(&qword_269A5D570);
    sub_24FC4FBF8();
    uint64_t v8 = *(void *)(v15 + 48);
    uint64_t v9 = sub_24FC4F388();
    (*(void (**)(unint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v8 + *(void *)(*(void *)(v9 - 8) + 72) * v6, v9);
    uint64_t v10 = type metadata accessor for ObjectStreamingSupport(0);
    sub_24FC45A60();
    sub_24FC4D6F4(&qword_269A5CC48, MEMORY[0x263F07508]);
    sub_24FC4FC08();
    *uint64_t v3 = v15;
    swift_bridgeObjectRelease();
    uint64_t v11 = a2;
    uint64_t v12 = 0;
    uint64_t v13 = v10;
  }
  else
  {
    uint64_t v13 = type metadata accessor for ObjectStreamingSupport(0);
    uint64_t v11 = a2;
    uint64_t v12 = 1;
  }
  return _s19GenerativeFunctions24JsonObjectFieldContainerOwst_0(v11, v12, 1, v13);
}

uint64_t sub_24FC4D3C4(uint64_t a1, uint64_t a2)
{
  swift_isUniquelyReferenced_nonNull_native();
  uint64_t v6 = *v2;
  uint64_t *v2 = 0x8000000000000000;
  sub_24FC4D444(a1, a2);
  uint64_t *v2 = v6;
  return swift_bridgeObjectRelease();
}

uint64_t sub_24FC4D444(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_24FC4F388();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *v2;
  unint64_t v11 = sub_24FC17E4C(a2);
  if (__OFADD__(*(void *)(v10 + 16), (v12 & 1) == 0))
  {
    __break(1u);
    goto LABEL_10;
  }
  unint64_t v13 = v11;
  char v14 = v12;
  sub_24FC13C3C(&qword_269A5D570);
  if ((sub_24FC4FBF8() & 1) == 0) {
    goto LABEL_5;
  }
  unint64_t v15 = sub_24FC17E4C(a2);
  if ((v14 & 1) != (v16 & 1))
  {
LABEL_10:
    uint64_t result = sub_24FC4FC98();
    __break(1u);
    return result;
  }
  unint64_t v13 = v15;
LABEL_5:
  uint64_t v17 = *v3;
  if (v14)
  {
    type metadata accessor for ObjectStreamingSupport(0);
    return sub_24FC4D77C();
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a2, v6);
    return sub_24FC4D604(v13, (uint64_t)v9, a1, v17);
  }
}

uint64_t sub_24FC4D604(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(a4 + 8 * (a1 >> 6) + 64) |= 1 << a1;
  uint64_t v7 = *(void *)(a4 + 48);
  uint64_t v8 = sub_24FC4F388();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 32))(v7 + *(void *)(*(void *)(v8 - 8) + 72) * a1, a2, v8);
  type metadata accessor for ObjectStreamingSupport(0);
  uint64_t result = sub_24FC45A60();
  uint64_t v10 = *(void *)(a4 + 16);
  BOOL v11 = __OFADD__(v10, 1);
  uint64_t v12 = v10 + 1;
  if (v11) {
    __break(1u);
  }
  else {
    *(void *)(a4 + 16) = v12;
  }
  return result;
}

uint64_t sub_24FC4D6F4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_24FC4D73C()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_24FC4D774(uint64_t a1)
{
  sub_24FC44B68(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_24FC4D77C()
{
  uint64_t v1 = sub_24FC4EBFC();
  v2(v1);
  sub_24FC12084();
  uint64_t v3 = sub_24FC4EEF4();
  v4(v3);
  return v0;
}

uint64_t sub_24FC4D7C8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_24FC4D824(unint64_t a1)
{
  uint64_t v3 = *v1;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if ((result & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_24FC4DCFC(v3);
    uint64_t v3 = result;
  }
  unint64_t v5 = *(void *)(v3 + 16);
  if (v5 <= a1)
  {
    __break(1u);
  }
  else
  {
    unint64_t v6 = v5 - 1;
    uint64_t v7 = v3 + 16 * a1;
    uint64_t v8 = *(void *)(v7 + 32);
    sub_24FC2AB94((char *)(v7 + 48), v5 - 1 - a1, (char *)(v7 + 32));
    *(void *)(v3 + 16) = v6;
    *uint64_t v1 = v3;
    return v8;
  }
  return result;
}

uint64_t sub_24FC4D8B0(unint64_t a1)
{
  uint64_t v3 = *v1;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if ((result & 1) == 0)
  {
    uint64_t result = sub_24FC4DD10(v3, v5, v6, v7, v8, v9, v10);
    uint64_t v3 = result;
  }
  unint64_t v11 = *(void *)(v3 + 16);
  if (v11 <= a1)
  {
    __break(1u);
  }
  else
  {
    sub_24FC4F388();
    sub_24FC12084();
    v12 += 32;
    uint64_t v13 = *(void *)(v12 + 40);
    unint64_t v14 = v3 + ((*(unsigned __int8 *)(v12 + 48) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 48)) + v13 * a1;
    sub_24FC1255C();
    v15();
    uint64_t result = sub_24FC2AC08(v14 + v13, v11 - 1 - a1, v14);
    *(void *)(v3 + 16) = v11 - 1;
    *uint64_t v1 = v3;
  }
  return result;
}

uint64_t sub_24FC4D980(unint64_t a1)
{
  uint64_t v3 = *v1;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if ((result & 1) == 0)
  {
    uint64_t result = sub_24FC4DD7C(v3, v5, v6, v7, v8, v9, v10);
    uint64_t v3 = result;
  }
  unint64_t v11 = *(void *)(v3 + 16);
  if (v11 <= a1)
  {
    __break(1u);
  }
  else
  {
    uint64_t v12 = *(void *)(type metadata accessor for ObjectStreamingSupport(0) - 8);
    uint64_t v13 = *(void *)(v12 + 72);
    unint64_t v14 = v3 + ((*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80)) + v13 * a1;
    sub_24FC45A60();
    uint64_t result = sub_24FC2AC38(v14 + v13, v11 - 1 - a1, v14);
    *(void *)(v3 + 16) = v11 - 1;
    *uint64_t v1 = v3;
  }
  return result;
}

uint64_t sub_24FC4DA84()
{
  uint64_t v1 = *v0;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if ((result & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_24FC4DCFC(v1);
    uint64_t v1 = result;
  }
  uint64_t v3 = *(void *)(v1 + 16);
  if (v3)
  {
    uint64_t v4 = v3 - 1;
    uint64_t result = *(void *)(v1 + 16 * v4 + 32);
    *(void *)(v1 + 16) = v4;
    uint64_t *v0 = v1;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_24FC4DAE0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *v1;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if ((result & 1) == 0)
  {
    uint64_t result = sub_24FC4DD10(v3, v5, v6, v7, v8, v9, v10);
    uint64_t v3 = result;
  }
  uint64_t v11 = *(void *)(v3 + 16);
  if (v11)
  {
    uint64_t v12 = v11 - 1;
    uint64_t v13 = sub_24FC4F388();
    sub_24FC12084();
    sub_24FC1255C();
    v14();
    *(void *)(v3 + 16) = v12;
    *uint64_t v1 = v3;
    return _s19GenerativeFunctions24JsonObjectFieldContainerOwst_0(a1, 0, 1, v13);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_24FC4DBB0(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_24FC1607C(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_24FC4DBF4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *v1;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if ((result & 1) == 0)
  {
    uint64_t result = sub_24FC4DD7C(v3, v5, v6, v7, v8, v9, v10);
    uint64_t v3 = result;
  }
  uint64_t v11 = *(void *)(v3 + 16);
  if (v11)
  {
    uint64_t v12 = v11 - 1;
    uint64_t v13 = type metadata accessor for ObjectStreamingSupport(0);
    sub_24FC45A60();
    *(void *)(v3 + 16) = v12;
    *uint64_t v1 = v3;
    return _s19GenerativeFunctions24JsonObjectFieldContainerOwst_0(a1, 0, 1, v13);
  }
  else
  {
    __break(1u);
  }
  return result;
}

void *sub_24FC4DCFC(uint64_t a1)
{
  return sub_24FC2A400(0, *(void *)(a1 + 16), 0, a1);
}

uint64_t sub_24FC4DD10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return sub_24FC2A538(0, *(void *)(a1 + 16), 0, a1, a5, a6, a7);
}

uint64_t sub_24FC4DD24(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  sub_24FC13C3C(a3);
  sub_24FC12084();
  sub_24FC123C0();
  v4();
  return a2;
}

uint64_t sub_24FC4DD7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return sub_24FC2A56C(0, *(void *)(a1 + 16), 0, a1, a5, a6, a7);
}

uint64_t sub_24FC4DD90(uint64_t a1, uint64_t *a2)
{
  sub_24FC13C3C(a2);
  sub_24FC12084();
  sub_24FC4E814();
  v3();
  return a1;
}

uint64_t sub_24FC4DDE0()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24FC4DE18()
{
  sub_24FC12240();
  uint64_t v2 = v1;
  uint64_t v3 = *(int **)(v0 + 16);
  uint64_t v4 = swift_task_alloc();
  uint64_t v5 = (void *)sub_24FC121E0(v4);
  *uint64_t v5 = v6;
  v5[1] = sub_24FC12014;
  uint64_t v7 = (uint64_t (*)(uint64_t, int *))((char *)&dword_269A5D610 + dword_269A5D610);
  return v7(v2, v3);
}

uint64_t sub_24FC4DEC4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[7] = a1;
  v3[8] = a3;
  uint64_t v5 = sub_24FC13C3C(&qword_269A5D3B8);
  v3[5] = v5;
  v3[6] = (uint64_t)&off_2701320F0;
  uint64_t v6 = sub_24FC0CCD0(v3 + 2);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(v6, a2, v5);
  return MEMORY[0x270FA2498](sub_24FC4DF8C, 0, 0);
}

uint64_t sub_24FC4DF8C()
{
  sub_24FC12030();
  uint64_t v2 = v0[7];
  uint64_t v1 = v0[8];
  *(void *)(v1 + 64) = 0;
  *(void *)(v1 + 72) = 0;
  *(unsigned char *)(v1 + 80) = -1;
  *(void *)(v1 + 88) = 0;
  *(void *)(v1 + 96) = 0;
  *(unsigned char *)(v1 + 104) = -1;
  uint64_t v3 = MEMORY[0x263F8EE78];
  *(void *)(v1 + 112) = MEMORY[0x263F8EE78];
  *(void *)(v1 + 120) = v3;
  *(void *)(v1 + 128) = v3;
  *(void *)(v1 + 136) = sub_24FC1BC28;
  *(void *)(v1 + 144) = 0;
  *(void *)(v1 + 16) = v2;
  sub_24FC20BD4((uint64_t)(v0 + 2), v1 + 24);
  swift_retain();
  uint64_t v4 = (void *)swift_task_alloc();
  v0[9] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_24FC4E070;
  return sub_24FC1BC2C();
}

uint64_t sub_24FC4E070()
{
  sub_24FC12240();
  uint64_t v1 = *v0;
  sub_24FC1203C();
  uint64_t *v2 = v1;
  uint64_t v3 = *v0;
  uint64_t *v2 = *v0;
  swift_task_dealloc();
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 80) = v4;
  *uint64_t v4 = v3;
  v4[1] = sub_24FC4E1A4;
  return sub_24FC1BC2C();
}

uint64_t sub_24FC4E1A4()
{
  sub_24FC12030();
  sub_24FC0BAB0();
  uint64_t v1 = *v0;
  sub_24FC1203C();
  void *v2 = v1;
  swift_task_dealloc();
  sub_24FC12064();
  return MEMORY[0x270FA2498](v3, v4, v5);
}

uint64_t sub_24FC4E26C()
{
  sub_24FC12030();
  swift_release();
  _s19GenerativeFunctions26TokenStreamProcessorCloserVwxx_0(v0 + 16);
  uint64_t v1 = *(uint64_t (**)(uint64_t))(v0 + 8);
  uint64_t v2 = *(void *)(v0 + 64);
  return v1(v2);
}

uint64_t sub_24FC4E2D8()
{
  uint64_t v3 = v0[80];
  *(void *)(v1 - 256) = v0[81];
  *(void *)(v1 - 248) = v3;
  uint64_t v4 = v0[78];
  *(void *)(v1 - 240) = v0[79];
  *(void *)(v1 - 232) = v4;
  uint64_t v5 = v0[75];
  *(void *)(v1 - 224) = v0[76];
  *(void *)(v1 - 216) = v5;
  uint64_t v6 = v0[73];
  *(void *)(v1 - 208) = v0[74];
  *(void *)(v1 - 200) = v6;
  uint64_t v7 = v0[71];
  *(void *)(v1 - 192) = v0[72];
  *(void *)(v1 - 184) = v7;
  uint64_t v8 = v0[67];
  *(void *)(v1 - 176) = v0[68];
  *(void *)(v1 - 168) = v8;
  uint64_t v9 = v0[65];
  *(void *)(v1 - 160) = v0[66];
  *(void *)(v1 - 152) = v9;
  uint64_t v10 = v0[61];
  *(void *)(v1 - 144) = v0[62];
  *(void *)(v1 - 136) = v10;
  uint64_t v11 = v0[58];
  *(void *)(v1 - 128) = v0[59];
  *(void *)(v1 - 120) = v11;
  uint64_t v12 = v0[56];
  *(void *)(v1 - 112) = v0[57];
  *(void *)(v1 - 104) = v12;
  uint64_t v13 = v0[52];
  *(void *)(v1 - 96) = v0[54];
  *(void *)(v1 - 88) = v13;
  return swift_bridgeObjectRelease();
}

uint64_t sub_24FC4E4BC(uint64_t a1)
{
  return _s19GenerativeFunctions24JsonObjectFieldContainerOwet_0(a1, 1, v1);
}

uint64_t sub_24FC4E4DC(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = v2;
  *(void *)(a2 + 8) = v3;
  *(unsigned char *)(a2 + 16) = 1;
  return swift_willThrow();
}

uint64_t sub_24FC4E504(uint64_t a1)
{
  *(void *)(v1 + 264) = a1;
  return sub_24FC4FB18();
}

uint64_t sub_24FC4E53C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _s19GenerativeFunctions24JsonObjectFieldContainerOwet_0(a1, a2, a3);
}

uint64_t sub_24FC4E554@<X0>(uint64_t a1@<X1>, char a2@<W8>)
{
  *(unsigned char *)(a1 + 16) = a2;
  return swift_willThrow();
}

uint64_t sub_24FC4E56C(uint64_t a1)
{
  return a1 - 8;
}

uint64_t sub_24FC4E580()
{
  return v0;
}

void sub_24FC4E59C()
{
  *(void *)(v0 - 96) = 0;
  *(void *)(v0 - 88) = 0xE000000000000000;
}

uint64_t sub_24FC4E5AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _s19GenerativeFunctions24JsonObjectFieldContainerOwst_0(a1, 1, 1, a4);
}

void sub_24FC4E5DC(uint64_t a1@<X8>)
{
  *(void *)(v2 - 96) = a1;
  *(void *)(v2 - 88) = (v1 - 32) | 0x8000000000000000;
}

void sub_24FC4E5EC(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v6, a4, v5, 0xCu);
}

uint64_t sub_24FC4E60C(uint64_t a1)
{
  return a1 - 8;
}

uint64_t sub_24FC4E644()
{
  return sub_24FC4F898();
}

uint64_t sub_24FC4E668(uint64_t result)
{
  *(void *)(v1 + 1232) = result;
  return result;
}

uint64_t sub_24FC4E678()
{
  *(void *)(v0 - 96) = 0;
  *(void *)(v0 - 88) = 0xE000000000000000;
  return sub_24FC4FB78();
}

void sub_24FC4E6C4(float a1)
{
  *uint64_t v1 = a1;
  JUMPOUT(0x2533738D0);
}

uint64_t sub_24FC4E6E4()
{
  return swift_release();
}

BOOL sub_24FC4E70C(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t sub_24FC4E728()
{
  return swift_arrayDestroy();
}

uint64_t sub_24FC4E754(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  int64_t v9 = *(void *)(v7 + 16) + 1;
  return sub_24FC2A56C(0, v9, 1, v7, a5, a6, a7);
}

uint64_t sub_24FC4E778(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  int64_t v9 = *(void *)(v7 + 16) + 1;
  return sub_24FC2A538(0, v9, 1, v7, a5, a6, a7);
}

BOOL sub_24FC4E79C(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t sub_24FC4E7B8()
{
  return swift_task_dealloc();
}

void sub_24FC4E7DC()
{
  *(void *)(v1 + 16) = v0;
}

uint64_t sub_24FC4E82C()
{
  return swift_slowAlloc();
}

uint64_t sub_24FC4E8F0()
{
  return swift_beginAccess();
}

void sub_24FC4E908()
{
  *(void *)(v1 + 1424) = *(void *)(v2 + v0);
  JUMPOUT(0x2533738D0);
}

void sub_24FC4E924(uint64_t a1, uint64_t a2)
{
  sub_24FC20B5C(a1, a2);
  JUMPOUT(0x2533738D0);
}

uint64_t sub_24FC4E960()
{
  return v0;
}

uint64_t sub_24FC4E974()
{
  return v0;
}

uint64_t sub_24FC4E984()
{
  return *(void *)(v0 + 1160);
}

uint64_t sub_24FC4E9A4()
{
  return *(void *)(v0 + 1160);
}

void sub_24FC4EA18(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v5, v6, a4, v4, 0xCu);
}

uint64_t sub_24FC4EA60()
{
  return sub_24FC4F898();
}

uint64_t sub_24FC4EA84()
{
  return v0;
}

uint64_t sub_24FC4EA90()
{
  return v0;
}

uint64_t sub_24FC4EA9C()
{
  return v0;
}

unint64_t sub_24FC4EAC8()
{
  uint64_t v1 = *(void *)(v0 - 88);
  *(void *)(v0 - 96) = *(void *)(v0 - 96);
  *(void *)(v0 - 88) = v1;
  return 0xD000000000000056;
}

uint64_t sub_24FC4EAF8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return *(void *)(v2 + 56) + *(void *)(a2 + 72) * a1;
}

uint64_t sub_24FC4EB38(char a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return sub_24FC2A56C(a1, v7, 1, v8, a5, a6, a7);
}

void sub_24FC4EB6C()
{
  void *v0 = v1;
  JUMPOUT(0x2533738C0);
}

uint64_t sub_24FC4EBB4()
{
  return swift_slowAlloc();
}

uint64_t sub_24FC4EBD8()
{
  return v0;
}

uint64_t sub_24FC4EBFC()
{
  return 0;
}

BOOL sub_24FC4EC0C(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t sub_24FC4EC74()
{
  return v0;
}

uint64_t sub_24FC4EC9C()
{
  return v0;
}

void sub_24FC4ECA8()
{
  uint64_t v1 = *(void *)(v0 - 88);
  *(void *)(v0 - 96) = *(void *)(v0 - 96);
  *(void *)(v0 - 88) = v1;
}

uint64_t sub_24FC4ECBC()
{
  *(void *)(v0 - 96) = 0;
  *(void *)(v0 - 88) = 0xE000000000000000;
  return sub_24FC4FB78();
}

uint64_t sub_24FC4ECF0()
{
  return swift_task_alloc();
}

void sub_24FC4ED10()
{
}

uint64_t sub_24FC4ED40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
  return a22;
}

BOOL sub_24FC4ED4C@<W0>(unint64_t a1@<X8>)
{
  return a1 > 1;
}

void sub_24FC4ED74(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  *(void *)a1 = a2;
  *(void *)(a1 + 8) = (v2 - 32) | 0x8000000000000000;
  *(unsigned char *)(a1 + 16) = v3;
}

uint64_t sub_24FC4EDB0()
{
  return v0 + 8;
}

uint64_t sub_24FC4EDC4()
{
  return v0;
}

uint64_t sub_24FC4EDD8()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t sub_24FC4EDF0()
{
  return swift_slowAlloc();
}

uint64_t sub_24FC4EE08()
{
  return swift_beginAccess();
}

uint64_t sub_24FC4EE3C()
{
  return v0;
}

uint64_t sub_24FC4EE48()
{
  return v0;
}

uint64_t sub_24FC4EE60()
{
  return sub_24FC4FC68();
}

uint64_t sub_24FC4EE78()
{
  return sub_24FC4FC68();
}

uint64_t sub_24FC4EE9C()
{
  return swift_unknownObjectRelease();
}

uint64_t sub_24FC4EEBC(uint64_t a1, uint64_t a2)
{
  return _s19GenerativeFunctions24JsonObjectFieldContainerOwst_0(a1, a2, 1, v2);
}

uint64_t sub_24FC4EED4()
{
  return 0;
}

uint64_t sub_24FC4EEF4()
{
  return v0;
}

uint64_t sub_24FC4EF14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return sub_24FC4DD10(v7, a2, a3, a4, a5, a6, a7);
}

void sub_24FC4EF44(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = v2;
  *(void *)(a2 + 8) = v4;
  *(unsigned char *)(a2 + 16) = v3;
}

void sub_24FC4EF58(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

uint64_t TokenStreamProcessorCloser.init(streamer:)@<X0>(long long *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_24FC23F68(a1, a2);
}

Swift::Void __swiftcall TokenStreamProcessorCloser.stopStream()()
{
  uint64_t v1 = v0[3];
  uint64_t v2 = v0[4];
  sub_24FC0CC3C(v0, v1);
  (*(void (**)(uint64_t, uint64_t))(v2 + 24))(v1, v2);
}

uint64_t dispatch thunk of TokenStreamProcessor.startStreaming(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t dispatch thunk of TokenStreamProcessor.stopStreaming()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of TokenStreamProcessor.stream<A>(timeout:_:)(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v19 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a8 + 32) + **(int **)(a8 + 32));
  uint64_t v16 = a3 & 1;
  uint64_t v17 = (void *)swift_task_alloc();
  *(void *)(v8 + 16) = v17;
  *uint64_t v17 = v8;
  v17[1] = sub_24FC394DC;
  return v19(a1, a2, v16, a4, a5, a6, a7, a8);
}

uint64_t initializeBufferWithCopyOfBuffer for TokenStreamProcessorCloser(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t initializeWithCopy for TokenStreamProcessorCloser(uint64_t a1, uint64_t a2)
{
  long long v3 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v3;
  (**(void (***)(void))(v3 - 8))();
  return a1;
}

uint64_t *assignWithCopy for TokenStreamProcessorCloser(uint64_t *a1, uint64_t *a2)
{
  return a1;
}

__n128 initializeWithTake for TokenStreamProcessorCloser(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for TokenStreamProcessorCloser(uint64_t a1, uint64_t a2)
{
  _s19GenerativeFunctions26TokenStreamProcessorCloserVwxx_0(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for TokenStreamProcessorCloser(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for TokenStreamProcessorCloser(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for TokenStreamProcessorCloser()
{
  return &type metadata for TokenStreamProcessorCloser;
}

uint64_t sub_24FC4F328()
{
  return MEMORY[0x270EEDF30]();
}

uint64_t sub_24FC4F338()
{
  return MEMORY[0x270EEDF38]();
}

uint64_t sub_24FC4F348()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_24FC4F358()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_24FC4F368()
{
  return MEMORY[0x270EF0CB0]();
}

uint64_t sub_24FC4F378()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_24FC4F388()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_24FC4F3D8()
{
  return MEMORY[0x270F2F0D8]();
}

uint64_t sub_24FC4F3E8()
{
  return MEMORY[0x270F2F0F0]();
}

uint64_t sub_24FC4F3F8()
{
  return MEMORY[0x270F2F108]();
}

uint64_t sub_24FC4F408()
{
  return MEMORY[0x270F2F150]();
}

uint64_t sub_24FC4F418()
{
  return MEMORY[0x270F2F160]();
}

uint64_t sub_24FC4F438()
{
  return MEMORY[0x270F2F238]();
}

uint64_t sub_24FC4F448()
{
  return MEMORY[0x270F2F240]();
}

uint64_t sub_24FC4F458()
{
  return MEMORY[0x270F2F250]();
}

uint64_t sub_24FC4F468()
{
  return MEMORY[0x270F2F270]();
}

uint64_t sub_24FC4F478()
{
  return MEMORY[0x270F2F290]();
}

uint64_t sub_24FC4F488()
{
  return MEMORY[0x270F2F298]();
}

uint64_t sub_24FC4F498()
{
  return MEMORY[0x270F2F2A0]();
}

uint64_t sub_24FC4F4A8()
{
  return MEMORY[0x270F2F2E0]();
}

uint64_t sub_24FC4F4C8()
{
  return MEMORY[0x270F2F2F8]();
}

uint64_t sub_24FC4F4D8()
{
  return MEMORY[0x270F2F300]();
}

uint64_t sub_24FC4F4E8()
{
  return MEMORY[0x270F2F308]();
}

uint64_t sub_24FC4F508()
{
  return MEMORY[0x270F2F318]();
}

uint64_t sub_24FC4F568()
{
  return MEMORY[0x270F2F348]();
}

uint64_t sub_24FC4F5D8()
{
  return MEMORY[0x270F2F380]();
}

uint64_t sub_24FC4F618()
{
  return MEMORY[0x270F2F3F0]();
}

uint64_t sub_24FC4F638()
{
  return MEMORY[0x270F2F400]();
}

uint64_t sub_24FC4F648()
{
  return MEMORY[0x270F2F408]();
}

uint64_t sub_24FC4F658()
{
  return MEMORY[0x270F2F420]();
}

uint64_t sub_24FC4F668()
{
  return MEMORY[0x270F2F428]();
}

uint64_t sub_24FC4F678()
{
  return MEMORY[0x270F2F458]();
}

uint64_t sub_24FC4F688()
{
  return MEMORY[0x270F2F4E8]();
}

uint64_t sub_24FC4F698()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_24FC4F6A8()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_24FC4F6B8()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_24FC4F6C8()
{
  return MEMORY[0x270F58038]();
}

uint64_t sub_24FC4F6D8()
{
  return MEMORY[0x270F58050]();
}

uint64_t sub_24FC4F6E8()
{
  return MEMORY[0x270F58058]();
}

uint64_t sub_24FC4F6F8()
{
  return MEMORY[0x270F580D8]();
}

uint64_t sub_24FC4F708()
{
  return MEMORY[0x270F580E8]();
}

uint64_t sub_24FC4F718()
{
  return MEMORY[0x270F582E8]();
}

uint64_t sub_24FC4F728()
{
  return MEMORY[0x270F58388]();
}

uint64_t sub_24FC4F738()
{
  return MEMORY[0x270F58390]();
}

uint64_t sub_24FC4F758()
{
  return MEMORY[0x270F583C8]();
}

uint64_t sub_24FC4F768()
{
  return MEMORY[0x270F583D0]();
}

uint64_t sub_24FC4F778()
{
  return MEMORY[0x270F583E8]();
}

uint64_t sub_24FC4F788()
{
  return MEMORY[0x270F583F8]();
}

uint64_t sub_24FC4F798()
{
  return MEMORY[0x270F58400]();
}

uint64_t sub_24FC4F7A8()
{
  return MEMORY[0x270F9D0A8]();
}

uint64_t sub_24FC4F7B8()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_24FC4F7C8()
{
  return MEMORY[0x270F9D380]();
}

uint64_t sub_24FC4F7D8()
{
  return MEMORY[0x270F9D3C8]();
}

uint64_t sub_24FC4F7E8()
{
  return MEMORY[0x270F9D3D8]();
}

uint64_t sub_24FC4F7F8()
{
  return MEMORY[0x270F9D3E0]();
}

uint64_t sub_24FC4F808()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_24FC4F818()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_24FC4F828()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_24FC4F838()
{
  return MEMORY[0x270F9D5F8]();
}

uint64_t sub_24FC4F848()
{
  return MEMORY[0x270F9D6B8]();
}

uint64_t sub_24FC4F858()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_24FC4F868()
{
  return MEMORY[0x270F9D740]();
}

uint64_t sub_24FC4F878()
{
  return MEMORY[0x270F9D760]();
}

uint64_t sub_24FC4F888()
{
  return MEMORY[0x270F9D778]();
}

uint64_t sub_24FC4F898()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_24FC4F8A8()
{
  return MEMORY[0x270F9D7D8]();
}

uint64_t sub_24FC4F8B8()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_24FC4F8C8()
{
  return MEMORY[0x270F9D7E8]();
}

uint64_t sub_24FC4F8D8()
{
  return MEMORY[0x270F9D800]();
}

uint64_t sub_24FC4F8F8()
{
  return MEMORY[0x270F9D810]();
}

uint64_t sub_24FC4F908()
{
  return MEMORY[0x270F9D860]();
}

uint64_t sub_24FC4F918()
{
  return MEMORY[0x270F9D8B0]();
}

uint64_t sub_24FC4F928()
{
  return MEMORY[0x270F9D8D8]();
}

uint64_t sub_24FC4F938()
{
  return MEMORY[0x270F9D8E0]();
}

uint64_t sub_24FC4F958()
{
  return MEMORY[0x270F9DA78]();
}

uint64_t sub_24FC4F968()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_24FC4F978()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_24FC4F998()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_24FC4F9A8()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_24FC4F9B8()
{
  return MEMORY[0x270FA1F60]();
}

uint64_t sub_24FC4F9D8()
{
  return MEMORY[0x270FA1FB0]();
}

uint64_t sub_24FC4F9E8()
{
  return MEMORY[0x270FA1FD8]();
}

uint64_t sub_24FC4F9F8()
{
  return MEMORY[0x270FA1FE8]();
}

uint64_t sub_24FC4FA08()
{
  return MEMORY[0x270FA2080]();
}

uint64_t sub_24FC4FA18()
{
  return MEMORY[0x270FA20B0]();
}

uint64_t sub_24FC4FA28()
{
  return MEMORY[0x270FA20B8]();
}

uint64_t sub_24FC4FA38()
{
  return MEMORY[0x270FA20C0]();
}

uint64_t sub_24FC4FA48()
{
  return MEMORY[0x270FA20C8]();
}

uint64_t sub_24FC4FA58()
{
  return MEMORY[0x270FA20D8]();
}

uint64_t sub_24FC4FA68()
{
  return MEMORY[0x270FA20E0]();
}

uint64_t sub_24FC4FA78()
{
  return MEMORY[0x270FA20E8]();
}

uint64_t sub_24FC4FA88()
{
  return MEMORY[0x270FA20F0]();
}

uint64_t sub_24FC4FAB8()
{
  return MEMORY[0x270FA2108]();
}

uint64_t sub_24FC4FAC8()
{
  return MEMORY[0x270FA2110]();
}

uint64_t sub_24FC4FAD8()
{
  return MEMORY[0x270FA2118]();
}

uint64_t sub_24FC4FAE8()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_24FC4FAF8()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_24FC4FB08()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_24FC4FB18()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_24FC4FB28()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_24FC4FB38()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_24FC4FB48()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_24FC4FB58()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_24FC4FB68()
{
  return MEMORY[0x270F9E988]();
}

uint64_t sub_24FC4FB78()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_24FC4FB88()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_24FC4FB98()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_24FC4FBA8()
{
  return MEMORY[0x270FA21A0]();
}

uint64_t sub_24FC4FBB8()
{
  return MEMORY[0x270FA21A8]();
}

uint64_t sub_24FC4FBC8()
{
  return MEMORY[0x270FA21B0]();
}

uint64_t sub_24FC4FBD8()
{
  return MEMORY[0x270F9ECD8]();
}

uint64_t sub_24FC4FBE8()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_24FC4FBF8()
{
  return MEMORY[0x270F9EF08]();
}

uint64_t sub_24FC4FC08()
{
  return MEMORY[0x270F9EF20]();
}

uint64_t sub_24FC4FC18()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_24FC4FC28()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_24FC4FC38()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_24FC4FC68()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_24FC4FC78()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_24FC4FC88()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_24FC4FC98()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_24FC4FCA8()
{
  return MEMORY[0x270FA2378]();
}

uint64_t sub_24FC4FCC8()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_24FC4FCD8()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_24FC4FCE8()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_24FC4FCF8()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_24FC4FD08()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_24FC4FD18()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_24FC4FD28()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_24FC4FD58()
{
  return MEMORY[0x270F9FF58]();
}

uint64_t sub_24FC4FD68()
{
  return MEMORY[0x270F9FFE8]();
}

uint64_t sub_24FC4FD98()
{
  return MEMORY[0x270FA0128]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
}

uint64_t _swift_stdlib_strtod_clocale()
{
  return MEMORY[0x270FA0170]();
}

void bzero(void *a1, size_t a2)
{
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x270FA0180]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x270FA0190]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x270FA01C8]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x270FA01D0]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x270FA01D8]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x270FA01F0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x270FA0200]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x270FA0208]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x270FA2420]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x270FA2428]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x270FA02D0]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x270FA02F8]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x270FA0300]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x270FA0410]();
}

uint64_t swift_getTupleTypeLayout3()
{
  return MEMORY[0x270FA0418]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x270FA0428]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x270FA0448]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x270FA0460]();
}

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x270FA0470]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_projectBox()
{
  return MEMORY[0x270FA04F8]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x270FA0528]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x270FA0538]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x270FA0578]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x270FA2450]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x270FA2458]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x270FA2460]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}

uint64_t swift_willThrowTypedImpl()
{
  return MEMORY[0x270FA0678]();
}