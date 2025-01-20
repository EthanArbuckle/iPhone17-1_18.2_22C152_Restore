__n128 sub_24A0F5534(uint64_t a1, uint64_t a2)
{
  __n128 result;
  long long v3;
  long long v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t sub_24A0F5548(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 64))
    {
      int v2 = *(_DWORD *)a1 + 2147483646;
    }
    else
    {
      unint64_t v3 = *(void *)(a1 + 16);
      if (v3 >= 0xFFFFFFFF) {
        LODWORD(v3) = -1;
      }
      int v2 = v3 - 1;
      if (v2 < 0) {
        int v2 = -1;
      }
    }
  }
  else
  {
    int v2 = -1;
  }
  return (v2 + 1);
}

uint64_t sub_24A0F559C(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 64) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 64) = 0;
    }
    if (a2) {
      *(void *)(result + 16) = a2;
    }
  }
  return result;
}

void type metadata accessor for MMCSEngineClientContext(uint64_t a1)
{
}

uint64_t sub_24A0F5614(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 sub_24A0F5648(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_24A0F5654(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_24A0F5674(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = (a2 - 1);
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
  *(unsigned char *)(result + 32) = v3;
  return result;
}

void type metadata accessor for audit_token_t(uint64_t a1)
{
}

void type metadata accessor for CFError(uint64_t a1)
{
}

void type metadata accessor for CFString(uint64_t a1)
{
}

void sub_24A0F56DC(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_24A0F5728()
{
  return dispatch thunk of Hashable.hash(into:)();
}

uint64_t sub_24A0F57D4(void *a1, void *a2)
{
  BOOL v2 = *a1 == *a2 && a1[1] == a2[1];
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    type metadata accessor for ProcessorFactory.TenantDomain();
    JUMPOUT(0x24C5BBEC0);
  }
  return 0;
}

Swift::Int sub_24A0F5850()
{
  return Hasher._finalize()();
}

Swift::Int sub_24A0F591C()
{
  return Hasher._finalize()();
}

uint64_t sub_24A0F59DC()
{
  swift_defaultActor_initialize();
  type metadata accessor for RequestTracker();
  swift_allocObject();
  *(void *)(v0 + 112) = sub_24A114E50();
  type metadata accessor for ProcessorFactory.TenantDomain();
  type metadata accessor for Engine();
  sub_24A0F6184(&qword_26976A0B8, (void (*)(uint64_t))type metadata accessor for ProcessorFactory.TenantDomain);
  *(void *)(v0 + 120) = Dictionary.init(dictionaryLiteral:)();
  return v0;
}

uint64_t sub_24A0F5A98()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();
  return v0;
}

uint64_t sub_24A0F5AC8()
{
  sub_24A0F5A98();
  return MEMORY[0x270FA2418](v0);
}

uint64_t type metadata accessor for ProcessorFactory()
{
  return self;
}

uint64_t *sub_24A0F5B18(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  char v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v11 = *a2;
    *char v3 = *a2;
    char v3 = (uint64_t *)(v11 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    uint64_t v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    uint64_t v6 = *(int *)(a3 + 20);
    v7 = (char *)a1 + v6;
    v8 = (char *)a2 + v6;
    uint64_t v9 = type metadata accessor for URL();
    v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16);
    swift_bridgeObjectRetain();
    v10(v7, v8, v9);
  }
  return v3;
}

uint64_t sub_24A0F5C00(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = type metadata accessor for URL();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  return v6(v4, v5);
}

void *sub_24A0F5C78(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = *(int *)(a3 + 20);
  uint64_t v6 = (char *)a1 + v5;
  v7 = (char *)a2 + v5;
  uint64_t v8 = type metadata accessor for URL();
  uint64_t v9 = *(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 16);
  swift_bridgeObjectRetain();
  v9(v6, v7, v8);
  return a1;
}

void *sub_24A0F5D10(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = type metadata accessor for URL();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

_OWORD *sub_24A0F5DAC(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = type metadata accessor for URL();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

void *sub_24A0F5E28(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = type metadata accessor for URL();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t sub_24A0F5EB4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24A0F5EC8);
}

uint64_t sub_24A0F5EC8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = type metadata accessor for URL();
    uint64_t v9 = a1 + *(int *)(a3 + 20);
    return sub_24A0F5F50(v9, a2, v8);
  }
}

uint64_t sub_24A0F5F50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_24A0F5F78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24A0F5F8C);
}

uint64_t sub_24A0F5F8C(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = type metadata accessor for URL();
    uint64_t v8 = v5 + *(int *)(a4 + 20);
    return sub_24A0F600C(v8, a2, a2, v7);
  }
  return result;
}

uint64_t sub_24A0F600C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t type metadata accessor for ProcessorFactory.TenantDomain()
{
  uint64_t result = qword_26976A098;
  if (!qword_26976A098) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24A0F607C()
{
  uint64_t result = type metadata accessor for URL();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_24A0F6114()
{
  return sub_24A0F6184(&qword_26976A0A8, (void (*)(uint64_t))type metadata accessor for ProcessorFactory.TenantDomain);
}

uint64_t sub_24A0F615C()
{
  return v0;
}

uint64_t sub_24A0F6168()
{
  return sub_24A0F615C();
}

uint64_t sub_24A0F6184(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_24A0F61CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v26[0] = a3;
  uint64_t v28 = a2;
  uint64_t v6 = type metadata accessor for ProcessorFactory.TenantDomain();
  uint64_t v7 = v6 - 8;
  MEMORY[0x270FA5388](v6);
  v27 = (void *)((char *)v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v9 = type metadata accessor for URL();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  v12 = (char *)v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  v13(v12, a3, v9);
  uint64_t v14 = *(void *)(v3 + 112);
  type metadata accessor for TenantContext();
  swift_allocObject();
  uint64_t v15 = v28;
  uint64_t v16 = (uint64_t)v12;
  v17 = v27;
  sub_24A115FA0(a1, v28, v16, v14);
  v13((char *)v17 + *(int *)(v7 + 28), v26[0], v9);
  uint64_t *v17 = a1;
  v17[1] = v15;
  uint64_t v18 = v26[1];
  swift_beginAccess();
  uint64_t v19 = *(void *)(v18 + 120);
  swift_bridgeObjectRetain_n();
  swift_retain();
  swift_bridgeObjectRetain();
  uint64_t v20 = sub_24A114C10(v17, v19);
  swift_bridgeObjectRelease();
  if (v20)
  {
    swift_release();
LABEL_3:
    sub_24A0FA988((uint64_t)v17);
    type metadata accessor for Uploader();
    swift_allocObject();
    return sub_24A0FDA78(v20);
  }
  type metadata accessor for Engine();
  swift_allocObject();
  uint64_t v22 = swift_retain();
  uint64_t v23 = v29;
  sub_24A11527C(v22);
  if (!v23)
  {
    uint64_t v20 = v24;
    swift_beginAccess();
    uint64_t v25 = swift_retain();
    sub_24A0FA9E4(v25, v17);
    swift_endAccess();
    swift_release();
    goto LABEL_3;
  }
  sub_24A0FA988((uint64_t)v17);
  return swift_release();
}

uint64_t sub_24A0F6480(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v26[0] = a3;
  uint64_t v28 = a2;
  uint64_t v6 = type metadata accessor for ProcessorFactory.TenantDomain();
  uint64_t v7 = v6 - 8;
  MEMORY[0x270FA5388](v6);
  v27 = (void *)((char *)v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v9 = type metadata accessor for URL();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  v12 = (char *)v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  v13(v12, a3, v9);
  uint64_t v14 = *(void *)(v3 + 112);
  type metadata accessor for TenantContext();
  swift_allocObject();
  uint64_t v15 = v28;
  uint64_t v16 = (uint64_t)v12;
  v17 = v27;
  sub_24A115FA0(a1, v28, v16, v14);
  v13((char *)v17 + *(int *)(v7 + 28), v26[0], v9);
  uint64_t *v17 = a1;
  v17[1] = v15;
  uint64_t v18 = v26[1];
  swift_beginAccess();
  uint64_t v19 = *(void *)(v18 + 120);
  swift_bridgeObjectRetain_n();
  swift_retain();
  swift_bridgeObjectRetain();
  uint64_t v20 = sub_24A114C10(v17, v19);
  swift_bridgeObjectRelease();
  if (v20)
  {
    swift_release();
LABEL_3:
    sub_24A0FA988((uint64_t)v17);
    type metadata accessor for Downloader();
    uint64_t result = swift_allocObject();
    *(void *)(result + 16) = v20;
    return result;
  }
  type metadata accessor for Engine();
  swift_allocObject();
  uint64_t v22 = swift_retain();
  uint64_t v23 = v29;
  sub_24A11527C(v22);
  if (!v23)
  {
    uint64_t v20 = v24;
    swift_beginAccess();
    uint64_t v25 = swift_retain();
    sub_24A0FA9E4(v25, v17);
    swift_endAccess();
    swift_release();
    goto LABEL_3;
  }
  sub_24A0FA988((uint64_t)v17);
  return swift_release();
}

double sub_24A0F672C@<D0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v41 = a1;
  sub_24A0FA334(&qword_26976A0D0);
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v42 = (uint64_t)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24A0FA334(&qword_26976A0D8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v7 = (char *)&v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for XPCAsyncSequenceRequest();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  uint64_t v11 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  v12 = (char *)&v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v30 - v13;
  sub_24A0FAEF0(&qword_26976A0E0, MEMORY[0x263F32248]);
  XPCReceivedMessage.decode<A>(as:)();
  sub_24A0F600C((uint64_t)v7, 0, 1, v8);
  uint64_t v36 = a2;
  v35 = *(void (**)(char *, char *, uint64_t))(v9 + 32);
  v35(v14, v7, v8);
  unint64_t v15 = XPCReceivedMessage.auditToken.getter();
  unint64_t v34 = v16;
  unint64_t v30 = v15;
  unint64_t v31 = HIDWORD(v15);
  unint64_t v32 = v17;
  unint64_t v33 = HIDWORD(v17);
  unint64_t v37 = HIDWORD(v16);
  unint64_t v38 = v18;
  unint64_t v39 = HIDWORD(v18);
  uint64_t v19 = type metadata accessor for TaskPriority();
  sub_24A0F600C(v42, 1, 1, v19);
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v12, v14, v8);
  unint64_t v20 = (*(unsigned __int8 *)(v9 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  unint64_t v21 = (v10 + v20 + 3) & 0xFFFFFFFFFFFFFFFCLL;
  uint64_t v22 = (char *)swift_allocObject();
  *((void *)v22 + 2) = 0;
  *((void *)v22 + 3) = 0;
  uint64_t v40 = a3;
  uint64_t v23 = v35;
  uint64_t v24 = v36;
  *((void *)v22 + 4) = v41;
  *((void *)v22 + 5) = v24;
  v23(&v22[v20], v12, v8);
  uint64_t v25 = &v22[v21];
  int v26 = v31;
  *(_DWORD *)uint64_t v25 = v30;
  *((_DWORD *)v25 + 1) = v26;
  int v27 = v33;
  *((_DWORD *)v25 + 2) = v32;
  *((_DWORD *)v25 + 3) = v27;
  *((_DWORD *)v25 + 4) = v34;
  *((_DWORD *)v25 + 5) = v37;
  *((_DWORD *)v25 + 6) = v38;
  *((_DWORD *)v25 + 7) = v39;
  swift_retain();
  uint64_t v28 = v40;
  swift_retain();
  sub_24A0F7EC4(v42, (uint64_t)&unk_26976A0F0, (uint64_t)v22);
  swift_release();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v14, v8);
  *(void *)(v28 + 32) = 0;
  double result = 0.0;
  *(_OWORD *)uint64_t v28 = 0u;
  *(_OWORD *)(v28 + 16) = 0u;
  return result;
}

uint64_t sub_24A0F6AC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v14 = (void *)swift_task_alloc();
  *(void *)(v8 + 16) = v14;
  *uint64_t v14 = v8;
  v14[1] = sub_24A0FB008;
  return sub_24A0F6B9C(a6, a7, a8, v17, v18, a4, a5);
}

uint64_t sub_24A0F6B9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[7] = a6;
  v7[8] = a7;
  v7[5] = a4;
  v7[6] = a5;
  v7[3] = a2;
  v7[4] = a3;
  v7[2] = a1;
  uint64_t v8 = sub_24A0FA334(&qword_26976A110);
  v7[9] = v8;
  v7[10] = *(void *)(v8 - 8);
  v7[11] = swift_task_alloc();
  sub_24A0FA334(&qword_26976A118);
  v7[12] = swift_task_alloc();
  uint64_t v9 = type metadata accessor for DownloadRequestMessage();
  v7[13] = v9;
  v7[14] = *(void *)(v9 - 8);
  v7[15] = swift_task_alloc();
  uint64_t v10 = type metadata accessor for UUID();
  v7[16] = v10;
  v7[17] = *(void *)(v10 - 8);
  v7[18] = swift_task_alloc();
  v7[19] = swift_task_alloc();
  v7[20] = swift_task_alloc();
  uint64_t v11 = sub_24A0FA334(&qword_26976A120);
  v7[21] = v11;
  v7[22] = *(void *)(v11 - 8);
  v7[23] = swift_task_alloc();
  sub_24A0FA334(&qword_26976A128);
  v7[24] = swift_task_alloc();
  uint64_t v12 = type metadata accessor for UploadRequestMessage();
  v7[25] = v12;
  v7[26] = *(void *)(v12 - 8);
  v7[27] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24A0F6E5C, 0, 0);
}

uint64_t sub_24A0F6E5C()
{
  sub_24A0FB188();
  sub_24A0FB34C();
  type metadata accessor for JSONDecoder();
  swift_allocObject();
  *(void *)(v0 + 224) = JSONDecoder.init()();
  XPCAsyncSequenceRequest.data.getter();
  sub_24A0FAEF0(&qword_26976A130, MEMORY[0x263F321C8]);
  dispatch thunk of JSONDecoder.decode<A>(_:from:)();
  sub_24A0FB394();
  uint64_t v1 = sub_24A0FB134();
  v2(v1);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 232) = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_24A0F7204;
  sub_24A0FB0CC();
  return sub_24A0F8030();
}

uint64_t sub_24A0F7204()
{
  sub_24A0FB204();
  sub_24A0FB00C();
  sub_24A0FB128();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  sub_24A0FB118();
  *uint64_t v5 = v4;
  *(void *)(v6 + 240) = v0;
  swift_task_dealloc();
  sub_24A0FB244();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_24A0F72E0()
{
  sub_24A0FB204();
  XPCAsyncSequenceRequest.id.getter();
  uint64_t v1 = (void *)swift_task_alloc();
  v0[31] = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_24A0F7384;
  uint64_t v2 = v0[23];
  uint64_t v3 = v0[20];
  uint64_t v4 = v0[7];
  return sub_24A0F8634(v2, v3, v4);
}

uint64_t sub_24A0F7384()
{
  sub_24A0FB2D0();
  sub_24A0FB00C();
  sub_24A0FB128();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  sub_24A0FB118();
  *uint64_t v5 = v4;
  *(void *)(v6 + 256) = v0;
  swift_task_dealloc();
  sub_24A0FB358();
  v7();
  sub_24A0FB244();
  return MEMORY[0x270FA2498](v8, v9, v10);
}

uint64_t sub_24A0F74B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  sub_24A0FB188();
  sub_24A0FB34C();
  sub_24A0FB1C0();
  v19();
  uint64_t v20 = sub_24A0FB170();
  v21(v20);
  uint64_t v22 = (void *)v18[32];
  XPCAsyncSequenceRequest.data.getter();
  sub_24A0FAEF0(&qword_26976A138, MEMORY[0x263F32218]);
  dispatch thunk of JSONDecoder.decode<A>(_:from:)();
  if (v22)
  {
    uint64_t v23 = v18[12];

    sub_24A0FB394();
    sub_24A0FB2DC();
    sub_24A0FA930(v23, &qword_26976A118);
    type metadata accessor for XPCError();
    sub_24A0FAEF0(&qword_26976A140, MEMORY[0x263F322A0]);
    uint64_t v24 = (void *)sub_24A0FB32C();
    sub_24A0FB4CC();
    sub_24A0FB4BC();
    v25();
    swift_willThrow();
    swift_release();
    sub_24A0FB084();
    sub_24A0FB1E8((uint64_t)v24);

    uint64_t v26 = sub_24A0FB0E8();
    v27(v26);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    sub_24A0FB1D0();
    sub_24A0FB0CC();
    return v29(v28, v29, v30, v31, v32, v33, v34, v35, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18);
  }
  else
  {
    sub_24A0FB394();
    uint64_t v37 = sub_24A0FB134();
    v38(v37);
    unint64_t v39 = (void *)swift_task_alloc();
    v18[33] = v39;
    *unint64_t v39 = v18;
    v39[1] = sub_24A0F7734;
    sub_24A0FB408();
    sub_24A0FB0CC();
    return sub_24A0F969C();
  }
}

uint64_t sub_24A0F7734()
{
  sub_24A0FB204();
  sub_24A0FB00C();
  sub_24A0FB128();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  sub_24A0FB118();
  *uint64_t v5 = v4;
  *(void *)(v6 + 272) = v0;
  swift_task_dealloc();
  sub_24A0FB244();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_24A0F7810()
{
  sub_24A0FB204();
  XPCAsyncSequenceRequest.id.getter();
  uint64_t v1 = (void *)swift_task_alloc();
  v0[35] = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_24A0F78B4;
  uint64_t v2 = v0[19];
  uint64_t v3 = v0[11];
  uint64_t v4 = v0[7];
  return sub_24A0F8ED4(v3, v2, v4);
}

uint64_t sub_24A0F78B4()
{
  sub_24A0FB2D0();
  sub_24A0FB00C();
  sub_24A0FB128();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  sub_24A0FB118();
  *uint64_t v5 = v4;
  *(void *)(v6 + 288) = v0;
  swift_task_dealloc();
  sub_24A0FB358();
  v7();
  sub_24A0FB244();
  return MEMORY[0x270FA2498]();
}

uint64_t sub_24A0F79E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  sub_24A0FB188();
  sub_24A0FB34C();
  sub_24A0FB1C0();
  v18();
  uint64_t v19 = sub_24A0FB170();
  v20(v19);
  type metadata accessor for XPCError();
  sub_24A0FAEF0(&qword_26976A140, MEMORY[0x263F322A0]);
  unint64_t v21 = (void *)sub_24A0FB32C();
  sub_24A0FB4CC();
  sub_24A0FB4BC();
  v22();
  swift_willThrow();
  swift_release();
  sub_24A0FB084();
  sub_24A0FB1E8((uint64_t)v21);

  uint64_t v23 = sub_24A0FB0E8();
  v24(v23);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_24A0FB1D0();
  sub_24A0FB0CC();
  return v26(v25, v26, v27, v28, v29, v30, v31, v32, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18);
}

uint64_t sub_24A0F7B4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  sub_24A0FB188();
  sub_24A0FB34C();
  swift_release();
  uint64_t v19 = sub_24A0FB170();
  v20(v19);
  unint64_t v21 = *(void **)(v18 + 240);
  sub_24A0FB03C();
  sub_24A0FB1E8((uint64_t)v21);

  uint64_t v22 = sub_24A0FB0E8();
  v23(v22);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_24A0FB1D0();
  sub_24A0FB0CC();
  return v25(v24, v25, v26, v27, v28, v29, v30, v31, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18);
}

uint64_t sub_24A0F7C20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  sub_24A0FB188();
  sub_24A0FB34C();
  swift_release();
  uint64_t v19 = sub_24A0FB100();
  v20(v19);
  uint64_t v21 = sub_24A0FB4A4();
  v22(v21);
  uint64_t v23 = *(void **)(v18 + 256);
  sub_24A0FB03C();
  sub_24A0FB1E8((uint64_t)v23);

  uint64_t v24 = sub_24A0FB0E8();
  v25(v24);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_24A0FB1D0();
  sub_24A0FB0CC();
  return v27(v26, v27, v28, v29, v30, v31, v32, v33, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18);
}

uint64_t sub_24A0F7D04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  sub_24A0FB188();
  sub_24A0FB34C();
  swift_release();
  uint64_t v19 = sub_24A0FB170();
  v20(v19);
  uint64_t v21 = *(void **)(v18 + 272);
  sub_24A0FB03C();
  sub_24A0FB1E8((uint64_t)v21);

  uint64_t v22 = sub_24A0FB0E8();
  v23(v22);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_24A0FB1D0();
  sub_24A0FB0CC();
  return v25(v24, v25, v26, v27, v28, v29, v30, v31, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18);
}

uint64_t sub_24A0F7DDC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  sub_24A0FB188();
  sub_24A0FB34C();
  swift_release();
  uint64_t v19 = sub_24A0FB100();
  v20(v19);
  uint64_t v21 = sub_24A0FB4A4();
  v22(v21);
  uint64_t v23 = *(void **)(v18 + 288);
  sub_24A0FB03C();
  sub_24A0FB1E8((uint64_t)v23);

  uint64_t v24 = sub_24A0FB0E8();
  v25(v24);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_24A0FB1D0();
  sub_24A0FB0CC();
  return v27(v26, v27, v28, v29, v30, v31, v32, v33, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18);
}

uint64_t sub_24A0F7EC4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TaskPriority();
  if (sub_24A0F5F50(a1, 1, v6) == 1)
  {
    sub_24A0FA930(a1, &qword_26976A0D0);
  }
  else
  {
    TaskPriority.rawValue.getter();
    sub_24A0FB4CC();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
  }
  if (*(void *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    dispatch thunk of Actor.unownedExecutor.getter();
    swift_unknownObjectRelease();
  }
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_24A0F8030()
{
  sub_24A0FB204();
  v1[3] = v2;
  v1[4] = v0;
  v1[2] = v3;
  uint64_t v4 = type metadata accessor for URL();
  v1[5] = v4;
  sub_24A0FB024(v4);
  v1[6] = v5;
  v1[7] = sub_24A0FB3AC();
  uint64_t v6 = type metadata accessor for AssetUploadRequest();
  v1[8] = v6;
  sub_24A0FB024(v6);
  v1[9] = v7;
  v1[10] = sub_24A0FB3AC();
  uint64_t v8 = type metadata accessor for UploadRequestMessage();
  v1[11] = v8;
  sub_24A0FB024(v8);
  v1[12] = v9;
  v1[13] = sub_24A0FB3AC();
  sub_24A0FB244();
  return MEMORY[0x270FA2498](v10, v11, v12);
}

uint64_t sub_24A0F8120()
{
  sub_24A0FB388();
  uint64_t v1 = sub_24A0FB368();
  v2(v1);
  uint64_t v3 = sub_24A0FB508();
  int v5 = v4(v3);
  if (v5 != *MEMORY[0x263F321B8] && v5 != *MEMORY[0x263F321C0]) {
    return sub_24A0FB3C4();
  }
  uint64_t v7 = v0[13];
  uint64_t v8 = sub_24A0FB58C();
  uint64_t v10 = (uint64_t (*)())v9(v8);
  if (*(void *)(*(void *)v7 + 16))
  {
    uint64_t v13 = v0[4];
    uint64_t v14 = sub_24A0FB2AC();
    v15(v14);
    swift_bridgeObjectRelease();
    v0[14] = AssetUploadRequest.tenantName.getter();
    v0[15] = v16;
    AssetUploadRequest.workingDirectory.getter();
    uint64_t v11 = *(void *)(v13 + 16);
    v0[16] = v11;
    uint64_t v10 = sub_24A0F8260;
    uint64_t v12 = 0;
  }
  else
  {
    __break(1u);
  }
  return MEMORY[0x270FA2498](v10, v11, v12);
}

uint64_t sub_24A0F8260()
{
  sub_24A0FB2D0();
  v0[17] = sub_24A0F61CC(v0[14], v0[15], v0[7]);
  v0[18] = 0;
  swift_bridgeObjectRelease();
  uint64_t v1 = (void *)swift_task_alloc();
  v0[19] = (uint64_t)v1;
  *uint64_t v1 = v0;
  v1[1] = sub_24A0F835C;
  return sub_24A0FB5B4();
}

uint64_t sub_24A0F835C()
{
  sub_24A0FB204();
  sub_24A0FB00C();
  sub_24A0FB128();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  sub_24A0FB118();
  *int v5 = v4;
  *(void *)(v6 + 160) = v0;
  swift_task_dealloc();
  sub_24A0FB244();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_24A0F8438()
{
  swift_release();
  uint64_t v0 = sub_24A0FB4D8();
  v1(v0);
  uint64_t v2 = sub_24A0FB48C();
  v3(v2);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_24A0FB280();
  return v4();
}

uint64_t sub_24A0F84E4()
{
  sub_24A0FB388();
  sub_24A0FB1DC();
  v0();
  uint64_t v1 = sub_24A0FB100();
  v2(v1);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_24A0FB1D0();
  return v3();
}

uint64_t sub_24A0F8588()
{
  sub_24A0FB388();
  swift_release();
  sub_24A0FB1DC();
  v0();
  uint64_t v1 = sub_24A0FB100();
  v2(v1);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_24A0FB1D0();
  return v3();
}

uint64_t sub_24A0F8634(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[4] = a2;
  v3[5] = a3;
  v3[3] = a1;
  uint64_t v4 = type metadata accessor for XPCAsyncSequenceResponse.Event();
  v3[6] = v4;
  v3[7] = *(void *)(v4 - 8);
  v3[8] = swift_task_alloc();
  v3[9] = swift_task_alloc();
  uint64_t v5 = type metadata accessor for UUID();
  v3[10] = v5;
  v3[11] = *(void *)(v5 - 8);
  v3[12] = swift_task_alloc();
  v3[13] = swift_task_alloc();
  uint64_t v6 = type metadata accessor for XPCAsyncSequenceResponse();
  v3[14] = v6;
  v3[15] = *(void *)(v6 - 8);
  v3[16] = swift_task_alloc();
  v3[17] = swift_task_alloc();
  uint64_t v7 = type metadata accessor for UploadResponseMessage();
  v3[18] = v7;
  v3[19] = *(void *)(v7 - 8);
  v3[20] = swift_task_alloc();
  sub_24A0FA334(&qword_26976A168);
  v3[21] = swift_task_alloc();
  uint64_t v8 = sub_24A0FA334(&qword_26976A170);
  v3[22] = v8;
  v3[23] = *(void *)(v8 - 8);
  v3[24] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24A0F88CC, 0, 0);
}

uint64_t sub_24A0F88CC()
{
  sub_24A0FB2D0();
  sub_24A0FB56C();
  swift_allocObject();
  *(void *)(v0 + 200) = JSONEncoder.init()();
  uint64_t v1 = sub_24A0FA334(&qword_26976A120);
  MEMORY[0x24C5BC240](v1);
  *(_DWORD *)(v0 + 224) = *MEMORY[0x263F32260];
  uint64_t v2 = swift_task_alloc();
  uint64_t v3 = (void *)sub_24A0FB31C(v2);
  *uint64_t v3 = v4;
  v3[1] = sub_24A0F89A0;
  uint64_t v5 = sub_24A0FB1A4();
  return MEMORY[0x270FA20F8](v5);
}

uint64_t sub_24A0F89A0()
{
  sub_24A0FB204();
  sub_24A0FB00C();
  sub_24A0FB128();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  sub_24A0FB118();
  *uint64_t v5 = v4;
  *(void *)(v6 + 216) = v0;
  swift_task_dealloc();
  sub_24A0FB244();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_24A0F8A7C()
{
  sub_24A0FB45C();
  if (v1)
  {
    sub_24A0FB1C0();
    v2();
    uint64_t v3 = sub_24A0FB440();
    v4(v3);
    uint64_t v5 = sub_24A0FB4F0();
    v6(v5);
    XPCAsyncSequenceResponse.init(id:event:)();
    sub_24A0FAEF0(&qword_26976A178, MEMORY[0x263F32270]);
    dispatch thunk of XPCSession.send<A>(_:)();
    if (!v0)
    {
      sub_24A0FB1DC();
      v14();
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
      sub_24A0FB280();
      goto LABEL_10;
    }
    sub_24A0FB1C0();
    v7();
    swift_release();
LABEL_9:
    sub_24A0FB520();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
LABEL_10:
    sub_24A0FB290();
    __asm { BRAA            X1, X16 }
  }
  uint64_t v8 = sub_24A0FB250();
  v9(v8);
  uint64_t v10 = sub_24A0FB424();
  v11(v10);
  sub_24A0FAEF0(&qword_26976A180, MEMORY[0x263F321F8]);
  uint64_t v12 = dispatch thunk of JSONEncoder.encode<A>(_:)();
  if (v0)
  {
    sub_24A0FB2FC();
    swift_release();
    uint64_t v17 = sub_24A0FB554();
    v18(v17);
    uint64_t v19 = sub_24A0FB53C();
    uint64_t v21 = v20(v19);
    uint64_t v29 = sub_24A0FB5A0(v21, v22, v23, v24, v25, v26, v27, v28, v41, v42);
    v30(v29);
    goto LABEL_9;
  }
  unint64_t v15 = sub_24A0FB210(v12, v13);
  v16(v15);
  XPCAsyncSequenceResponse.init(id:event:)();
  sub_24A0FAEF0(&qword_26976A178, MEMORY[0x263F32270]);
  dispatch thunk of XPCSession.send<A>(_:)();
  sub_24A0FB1C0();
  v33();
  sub_24A0FB358();
  v34();
  uint64_t v35 = swift_task_alloc();
  uint64_t v36 = (void *)sub_24A0FB31C(v35);
  *uint64_t v36 = v37;
  v36[1] = sub_24A0F89A0;
  sub_24A0FB1A4();
  sub_24A0FB290();
  return MEMORY[0x270FA20F8](v38);
}

uint64_t sub_24A0F8DFC()
{
  swift_release();
  uint64_t v0 = sub_24A0FB170();
  v1(v0);
  sub_24A0FB520();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_24A0FB1D0();
  return v2();
}

uint64_t sub_24A0F8ED4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[4] = a2;
  v3[5] = a3;
  v3[3] = a1;
  uint64_t v4 = type metadata accessor for XPCAsyncSequenceResponse.Event();
  v3[6] = v4;
  v3[7] = *(void *)(v4 - 8);
  v3[8] = swift_task_alloc();
  v3[9] = swift_task_alloc();
  uint64_t v5 = type metadata accessor for UUID();
  v3[10] = v5;
  v3[11] = *(void *)(v5 - 8);
  v3[12] = swift_task_alloc();
  v3[13] = swift_task_alloc();
  uint64_t v6 = type metadata accessor for XPCAsyncSequenceResponse();
  v3[14] = v6;
  v3[15] = *(void *)(v6 - 8);
  v3[16] = swift_task_alloc();
  v3[17] = swift_task_alloc();
  uint64_t v7 = type metadata accessor for DownloadResponseMessage();
  v3[18] = v7;
  v3[19] = *(void *)(v7 - 8);
  v3[20] = swift_task_alloc();
  sub_24A0FA334(&qword_26976A190);
  v3[21] = swift_task_alloc();
  uint64_t v8 = sub_24A0FA334(&qword_26976A198);
  v3[22] = v8;
  v3[23] = *(void *)(v8 - 8);
  v3[24] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24A0F916C, 0, 0);
}

uint64_t sub_24A0F916C()
{
  sub_24A0FB2D0();
  sub_24A0FB56C();
  swift_allocObject();
  *(void *)(v0 + 200) = JSONEncoder.init()();
  uint64_t v1 = sub_24A0FA334(&qword_26976A110);
  MEMORY[0x24C5BC240](v1);
  *(_DWORD *)(v0 + 224) = *MEMORY[0x263F32260];
  uint64_t v2 = swift_task_alloc();
  uint64_t v3 = (void *)sub_24A0FB31C(v2);
  *uint64_t v3 = v4;
  v3[1] = sub_24A0F9240;
  uint64_t v5 = sub_24A0FB1A4();
  return MEMORY[0x270FA20F8](v5);
}

uint64_t sub_24A0F9240()
{
  sub_24A0FB204();
  sub_24A0FB00C();
  sub_24A0FB128();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  sub_24A0FB118();
  *uint64_t v5 = v4;
  *(void *)(v6 + 216) = v0;
  swift_task_dealloc();
  sub_24A0FB244();
  return MEMORY[0x270FA2498]();
}

uint64_t sub_24A0F931C()
{
  sub_24A0FB45C();
  if (v1)
  {
    sub_24A0FB1C0();
    v2();
    uint64_t v3 = sub_24A0FB440();
    v4(v3);
    uint64_t v5 = sub_24A0FB4F0();
    v6(v5);
    XPCAsyncSequenceResponse.init(id:event:)();
    sub_24A0FAEF0(&qword_26976A178, MEMORY[0x263F32270]);
    dispatch thunk of XPCSession.send<A>(_:)();
    if (!v0)
    {
      sub_24A0FB1DC();
      v14();
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
      sub_24A0FB280();
      goto LABEL_10;
    }
    sub_24A0FB1C0();
    v7();
    swift_release();
LABEL_9:
    sub_24A0FB520();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
LABEL_10:
    sub_24A0FB290();
    __asm { BRAA            X1, X16 }
  }
  uint64_t v8 = sub_24A0FB250();
  v9(v8);
  uint64_t v10 = sub_24A0FB424();
  v11(v10);
  sub_24A0FAEF0(&qword_26976A1A0, MEMORY[0x263F32238]);
  uint64_t v12 = dispatch thunk of JSONEncoder.encode<A>(_:)();
  if (v0)
  {
    sub_24A0FB2FC();
    swift_release();
    uint64_t v17 = sub_24A0FB554();
    v18(v17);
    uint64_t v19 = sub_24A0FB53C();
    uint64_t v21 = v20(v19);
    uint64_t v29 = sub_24A0FB5A0(v21, v22, v23, v24, v25, v26, v27, v28, v40, v41);
    v30(v29);
    goto LABEL_9;
  }
  unint64_t v15 = sub_24A0FB210(v12, v13);
  v16(v15);
  XPCAsyncSequenceResponse.init(id:event:)();
  sub_24A0FAEF0(&qword_26976A178, MEMORY[0x263F32270]);
  dispatch thunk of XPCSession.send<A>(_:)();
  sub_24A0FB1C0();
  v33();
  sub_24A0FB358();
  v34();
  uint64_t v35 = swift_task_alloc();
  uint64_t v36 = (void *)sub_24A0FB31C(v35);
  *uint64_t v36 = v37;
  v36[1] = sub_24A0F9240;
  sub_24A0FB1A4();
  sub_24A0FB290();
  return MEMORY[0x270FA20F8]();
}

uint64_t sub_24A0F969C()
{
  sub_24A0FB204();
  v1[7] = v2;
  v1[8] = v0;
  v1[5] = v3;
  v1[6] = v4;
  v1[3] = v5;
  v1[4] = v6;
  v1[2] = v7;
  uint64_t v8 = type metadata accessor for URL();
  v1[9] = v8;
  sub_24A0FB024(v8);
  v1[10] = v9;
  v1[11] = sub_24A0FB3AC();
  uint64_t v10 = type metadata accessor for AssetDownloadRequest();
  v1[12] = v10;
  sub_24A0FB024(v10);
  v1[13] = v11;
  v1[14] = sub_24A0FB3AC();
  uint64_t v12 = type metadata accessor for DownloadRequestMessage();
  v1[15] = v12;
  sub_24A0FB024(v12);
  v1[16] = v13;
  v1[17] = sub_24A0FB3AC();
  sub_24A0FB244();
  return MEMORY[0x270FA2498](v14, v15, v16);
}

uint64_t sub_24A0F9794()
{
  sub_24A0FB388();
  uint64_t v1 = sub_24A0FB368();
  v2(v1);
  uint64_t v3 = sub_24A0FB508();
  int v5 = v4(v3);
  if (v5 != *MEMORY[0x263F32208] && v5 != *MEMORY[0x263F32210]) {
    return sub_24A0FB3C4();
  }
  uint64_t v7 = v0[17];
  uint64_t v8 = sub_24A0FB58C();
  uint64_t v10 = (uint64_t (*)())v9(v8);
  if (*(void *)(*(void *)v7 + 16))
  {
    uint64_t v13 = v0[8];
    uint64_t v14 = sub_24A0FB2AC();
    v15(v14);
    swift_bridgeObjectRelease();
    v0[18] = AssetDownloadRequest.tenantName.getter();
    v0[19] = v16;
    AssetDownloadRequest.workingDirectory.getter();
    uint64_t v11 = *(void *)(v13 + 16);
    v0[20] = v11;
    uint64_t v10 = sub_24A0F98D4;
    uint64_t v12 = 0;
  }
  else
  {
    __break(1u);
  }
  return MEMORY[0x270FA2498](v10, v11, v12);
}

uint64_t sub_24A0F98D4()
{
  sub_24A0FB2D0();
  v0[21] = sub_24A0F6480(v0[18], v0[19], v0[11]);
  v0[22] = 0;
  swift_bridgeObjectRelease();
  uint64_t v1 = (void *)swift_task_alloc();
  v0[23] = (uint64_t)v1;
  *uint64_t v1 = v0;
  v1[1] = sub_24A0F99D8;
  return sub_24A10AC7C();
}

uint64_t sub_24A0F99D8()
{
  sub_24A0FB204();
  sub_24A0FB00C();
  sub_24A0FB128();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  sub_24A0FB118();
  *int v5 = v4;
  *(void *)(v6 + 192) = v0;
  swift_task_dealloc();
  sub_24A0FB244();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_24A0F9AB4()
{
  swift_release();
  uint64_t v0 = sub_24A0FB4D8();
  v1(v0);
  uint64_t v2 = sub_24A0FB48C();
  v3(v2);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_24A0FB280();
  return v4();
}

uint64_t sub_24A0F9B60()
{
  sub_24A0FB388();
  sub_24A0FB1DC();
  v0();
  uint64_t v1 = sub_24A0FB100();
  v2(v1);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_24A0FB1D0();
  return v3();
}

uint64_t sub_24A0F9C04()
{
  sub_24A0FB388();
  swift_release();
  sub_24A0FB1DC();
  v0();
  uint64_t v1 = sub_24A0FB100();
  v2(v1);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_24A0FB1D0();
  return v3();
}

uint64_t sub_24A0F9CB0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v17[0] = a3;
  uint64_t v4 = type metadata accessor for XPCAsyncSequenceResponse.Event();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for UUID();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for XPCAsyncSequenceResponse();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)v17 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x263F32258], v4);
  XPCAsyncSequenceResponse.init(id:event:)();
  sub_24A0FAEF0(&qword_26976A178, MEMORY[0x263F32270]);
  dispatch thunk of XPCSession.send<A>(_:)();
  return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v12);
}

double sub_24A0F9F40@<D0>(uint64_t a1@<X8>)
{
  return sub_24A0F672C(*v1, v1[1], a1);
}

uint64_t sub_24A0F9F4C()
{
  type metadata accessor for Dispatcher();
  uint64_t v0 = swift_allocObject();
  type metadata accessor for ProcessorFactory();
  swift_allocObject();
  uint64_t result = sub_24A0F59DC();
  *(void *)(v0 + 16) = result;
  qword_26976A0C0 = v0;
  return result;
}

uint64_t static Dispatcher.shared.getter()
{
  if (qword_26976A050 != -1) {
    swift_once();
  }
  return swift_retain();
}

uint64_t Dispatcher.dispatchRequest(_:)()
{
  return dispatch thunk of XPCListener.IncomingSessionRequest.accept<A>(_:)();
}

uint64_t sub_24A0FA060@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  *a3 = a1;
  a3[1] = a2;
  swift_retain();
  return swift_retain();
}

uint64_t sub_24A0FA09C@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return sub_24A0FA060(a1, v2, a2);
}

unint64_t sub_24A0FA0A4()
{
  unint64_t result = qword_26976A0C8;
  if (!qword_26976A0C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26976A0C8);
  }
  return result;
}

uint64_t Dispatcher.deinit()
{
  swift_release();
  return v0;
}

uint64_t Dispatcher.__deallocating_deinit()
{
  swift_release();
  return MEMORY[0x270FA0228](v0, 24, 7);
}

uint64_t type metadata accessor for Dispatcher()
{
  return self;
}

uint64_t method lookup function for Dispatcher(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for Dispatcher);
}

uint64_t destroy for Dispatcher.Handler()
{
  swift_release();
  return swift_release();
}

void *_s16CloudAssetDaemon10DispatcherC7HandlerVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  swift_retain();
  return a1;
}

void *assignWithCopy for Dispatcher.Handler(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  return a1;
}

__n128 initializeWithTake for Dispatcher.Handler(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

_OWORD *assignWithTake for Dispatcher.Handler(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for Dispatcher.Handler(uint64_t *a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *((unsigned char *)a1 + 16))
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

uint64_t storeEnumTagSinglePayload for Dispatcher.Handler(uint64_t result, int a2, int a3)
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Dispatcher.Handler()
{
  return &type metadata for Dispatcher.Handler;
}

uint64_t sub_24A0FA334(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_24A0FA378()
{
  uint64_t v1 = type metadata accessor for XPCAsyncSequenceRequest();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 48) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((*(void *)(v2 + 64) + v4 + 3) & 0xFFFFFFFFFFFFFFFCLL) + 32;
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v6, v5);
}

uint64_t sub_24A0FA460(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for XPCAsyncSequenceRequest();
  sub_24A0FB024(v3);
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  unint64_t v8 = (*(unsigned __int8 *)(v5 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v9 = v1[2];
  uint64_t v10 = v1[3];
  uint64_t v11 = v1[4];
  uint64_t v12 = v1[5];
  uint64_t v13 = (uint64_t)v1 + v8;
  uint64_t v14 = (void *)((char *)v1 + ((*(void *)(v7 + 64) + v8 + 3) & 0xFFFFFFFFFFFFFFFCLL));
  uint64_t v15 = *v14;
  uint64_t v16 = v14[1];
  uint64_t v17 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v17;
  void *v17 = v2;
  v17[1] = sub_24A0FA590;
  return sub_24A0F6AC0(a1, v9, v10, v11, v12, v13, v15, v16);
}

uint64_t sub_24A0FA590()
{
  sub_24A0FB204();
  sub_24A0FB00C();
  uint64_t v1 = *v0;
  sub_24A0FB118();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  sub_24A0FB1D0();
  return v3();
}

uint64_t sub_24A0FA650(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_24A0FA72C;
  return v6(a1);
}

uint64_t sub_24A0FA72C()
{
  sub_24A0FB204();
  sub_24A0FB00C();
  uint64_t v1 = *v0;
  sub_24A0FB118();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  sub_24A0FB280();
  return v3();
}

uint64_t sub_24A0FA7EC()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24A0FA824()
{
  sub_24A0FB2D0();
  uint64_t v3 = v2;
  uint64_t v4 = *(int **)(v0 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_24A0FA590;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_26976A0F8 + dword_26976A0F8);
  return v6(v3, v4);
}

uint64_t sub_24A0FA8D8(uint64_t a1, unint64_t a2)
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

uint64_t sub_24A0FA930(uint64_t a1, uint64_t *a2)
{
  sub_24A0FA334(a2);
  sub_24A0FB4CC();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t sub_24A0FA988(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ProcessorFactory.TenantDomain();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24A0FA9E4(uint64_t a1, void *a2)
{
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v7 = *v2;
  *uint64_t v2 = 0x8000000000000000;
  sub_24A0FAAF4(a1, a2, isUniquelyReferenced_nonNull_native);
  *uint64_t v2 = v7;
  return swift_bridgeObjectRelease();
}

uint64_t sub_24A0FAA64(_OWORD *a1, uint64_t a2, uint64_t a3)
{
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v9 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  sub_24A0FACAC(a1, a2, a3, isUniquelyReferenced_nonNull_native);
  *uint64_t v3 = v9;
  return swift_bridgeObjectRelease();
}

uint64_t sub_24A0FAAF4(uint64_t a1, void *a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = type metadata accessor for ProcessorFactory.TenantDomain();
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = (void *)*v3;
  unint64_t v12 = sub_24A1065B4(a2);
  uint64_t v14 = v11[2];
  BOOL v15 = (v13 & 1) == 0;
  Swift::Int v16 = v14 + v15;
  if (__OFADD__(v14, v15))
  {
    __break(1u);
    goto LABEL_10;
  }
  unint64_t v17 = v12;
  char v18 = v13;
  sub_24A0FA334(&qword_26976A188);
  if (!_NativeDictionary.ensureUnique(isUnique:capacity:)(a3 & 1, v16)) {
    goto LABEL_5;
  }
  unint64_t v19 = sub_24A1065B4(a2);
  if ((v18 & 1) != (v20 & 1))
  {
LABEL_10:
    uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return result;
  }
  unint64_t v17 = v19;
LABEL_5:
  uint64_t v21 = *v4;
  if (v18)
  {
    uint64_t v22 = v21[7];
    uint64_t result = swift_release();
    *(void *)(v22 + 8 * v17) = a1;
  }
  else
  {
    sub_24A0FAC48((uint64_t)a2, (uint64_t)v10);
    return sub_24A0FADEC(v17, (uint64_t)v10, a1, v21);
  }
  return result;
}

uint64_t sub_24A0FAC48(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ProcessorFactory.TenantDomain();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_24A0FACAC(_OWORD *a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  uint64_t v10 = (void *)*v4;
  unint64_t v11 = sub_24A106774();
  uint64_t v13 = v10[2];
  BOOL v14 = (v12 & 1) == 0;
  Swift::Int v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_13;
  }
  unint64_t v16 = v11;
  char v17 = v12;
  sub_24A0FA334(&qword_26976A1A8);
  if (!_NativeDictionary.ensureUnique(isUnique:capacity:)(a4 & 1, v15)) {
    goto LABEL_5;
  }
  unint64_t v18 = sub_24A106774();
  if ((v17 & 1) != (v19 & 1))
  {
LABEL_13:
    uint64_t result = (_OWORD *)KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return result;
  }
  unint64_t v16 = v18;
LABEL_5:
  char v20 = *v5;
  if (v17)
  {
    uint64_t v21 = (_OWORD *)(v20[7] + 32 * v16);
    sub_24A0FAFA4((uint64_t)v21);
    return sub_24A0FAFF4(a1, v21);
  }
  else
  {
    sub_24A0FAF38(v16, a2, a3, a1, v20);
    return (_OWORD *)swift_bridgeObjectRetain();
  }
}

uint64_t sub_24A0FADEC(unint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v8 = a4[6];
  uint64_t v9 = type metadata accessor for ProcessorFactory.TenantDomain();
  uint64_t result = sub_24A0FAE8C(a2, v8 + *(void *)(*(void *)(v9 - 8) + 72) * a1);
  *(void *)(a4[7] + 8 * a1) = a3;
  uint64_t v11 = a4[2];
  BOOL v12 = __OFADD__(v11, 1);
  uint64_t v13 = v11 + 1;
  if (v12) {
    __break(1u);
  }
  else {
    a4[2] = v13;
  }
  return result;
}

uint64_t sub_24A0FAE8C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ProcessorFactory.TenantDomain();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24A0FAEF0(unint64_t *a1, void (*a2)(uint64_t))
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

_OWORD *sub_24A0FAF38(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v6 = (void *)(a5[6] + 16 * a1);
  *uint64_t v6 = a2;
  v6[1] = a3;
  uint64_t result = sub_24A0FAFF4(a4, (_OWORD *)(a5[7] + 32 * a1));
  uint64_t v8 = a5[2];
  BOOL v9 = __OFADD__(v8, 1);
  uint64_t v10 = v8 + 1;
  if (v9) {
    __break(1u);
  }
  else {
    a5[2] = v10;
  }
  return result;
}

uint64_t sub_24A0FAFA4(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

_OWORD *sub_24A0FAFF4(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_24A0FB024(uint64_t a1)
{
  return a1 - 8;
}

uint64_t sub_24A0FB03C()
{
  return XPCAsyncSequenceRequest.id.getter();
}

uint64_t sub_24A0FB084()
{
  return XPCAsyncSequenceRequest.id.getter();
}

uint64_t sub_24A0FB0E8()
{
  return v0;
}

uint64_t sub_24A0FB100()
{
  return v0;
}

uint64_t sub_24A0FB134()
{
  sub_24A0F600C(v2, 0, 1, v1);
  return v0;
}

uint64_t sub_24A0FB170()
{
  return v0;
}

uint64_t sub_24A0FB1A4()
{
  return *(void *)(v0 + 168);
}

uint64_t sub_24A0FB1D0()
{
  return v0 + 8;
}

uint64_t sub_24A0FB1E8(uint64_t a1)
{
  return sub_24A0F9CB0(a1, v2, v1);
}

void *sub_24A0FB210(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)(v2 + 72);
  *uint64_t v3 = a1;
  v3[1] = a2;
  return v3;
}

uint64_t sub_24A0FB250()
{
  return *(void *)(v0 + 160);
}

uint64_t sub_24A0FB280()
{
  return v0 + 8;
}

uint64_t sub_24A0FB2AC()
{
  return v0;
}

uint64_t sub_24A0FB2DC()
{
  return sub_24A0F600C(v1, 1, 1, v0);
}

uint64_t sub_24A0FB2FC()
{
  return *(void *)(v0 + 200);
}

uint64_t sub_24A0FB31C(uint64_t result)
{
  *(void *)(v1 + 208) = result;
  return result;
}

uint64_t sub_24A0FB32C()
{
  return swift_allocError();
}

uint64_t sub_24A0FB368()
{
  return v0;
}

uint64_t sub_24A0FB394()
{
  return sub_24A0FA8D8(v1, v0);
}

uint64_t sub_24A0FB3AC()
{
  return swift_task_alloc();
}

uint64_t sub_24A0FB3C4()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_24A0FB3EC()
{
  return *(void *)(v0 + 200);
}

uint64_t sub_24A0FB408()
{
  return *(void *)(v0 + 88);
}

uint64_t sub_24A0FB424()
{
  return v0;
}

uint64_t sub_24A0FB440()
{
  return v0;
}

uint64_t sub_24A0FB45C()
{
  return sub_24A0F5F50(*(void *)(v0 + 168), 1, *(void *)(v0 + 144));
}

uint64_t sub_24A0FB48C()
{
  return v0;
}

uint64_t sub_24A0FB4A4()
{
  return v0;
}

uint64_t sub_24A0FB4D8()
{
  return v0;
}

uint64_t sub_24A0FB4F0()
{
  return v0;
}

uint64_t sub_24A0FB508()
{
  return v0;
}

uint64_t sub_24A0FB520()
{
  return swift_task_dealloc();
}

uint64_t sub_24A0FB53C()
{
  return v0;
}

uint64_t sub_24A0FB554()
{
  return v0;
}

uint64_t sub_24A0FB56C()
{
  return MEMORY[0x270EEDF38](0);
}

uint64_t sub_24A0FB58C()
{
  return v0;
}

uint64_t sub_24A0FB5A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  return a10;
}

uint64_t sub_24A0FB5B4()
{
  sub_24A0FB204();
  v1[3] = v2;
  v1[4] = v0;
  v1[2] = v3;
  uint64_t v4 = type metadata accessor for UploadRequestMessage();
  v1[5] = v4;
  sub_24A0FB024(v4);
  v1[6] = v5;
  v1[7] = swift_task_alloc();
  sub_24A0FB244();
  return MEMORY[0x270FA2498](v6, v7, v8);
}

uint64_t sub_24A0FB64C()
{
  uint64_t v2 = v0[6];
  uint64_t v1 = v0[7];
  uint64_t v3 = v0[5];
  (*(void (**)(uint64_t, void, uint64_t))(v2 + 16))(v1, v0[3], v3);
  int v4 = (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 88))(v1, v3);
  if (v4 == *MEMORY[0x263F321B8])
  {
    uint64_t v5 = (uint64_t *)v0[7];
    (*(void (**)(uint64_t *, void))(v0[6] + 96))(v5, v0[5]);
    uint64_t v6 = *v5;
    v0[8] = *v5;
    swift_task_alloc();
    sub_24A10AB88();
    v0[9] = v7;
    void *v7 = v8;
    BOOL v9 = sub_24A0FB868;
LABEL_5:
    v7[1] = v9;
    uint64_t v14 = v0[2];
    return sub_24A101AA4(v14, v6);
  }
  uint64_t v11 = v0[6];
  uint64_t v10 = (uint64_t *)v0[7];
  uint64_t v12 = v0[5];
  if (v4 == *MEMORY[0x263F321C0])
  {
    (*(void (**)(void, void))(v11 + 96))(v0[7], v0[5]);
    uint64_t v6 = *v10;
    v0[11] = *v10;
    swift_task_alloc();
    sub_24A10AB88();
    v0[12] = v7;
    void *v7 = v13;
    BOOL v9 = sub_24A0FB9A8;
    goto LABEL_5;
  }
  sub_24A104500();
  swift_allocError();
  swift_willThrow();
  (*(void (**)(uint64_t *, uint64_t))(v11 + 8))(v10, v12);
  swift_task_dealloc();
  sub_24A0FB1D0();
  return v16();
}

uint64_t sub_24A0FB868()
{
  sub_24A0FB204();
  sub_24A0FB00C();
  sub_24A0FB128();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  sub_24A0FB128();
  *uint64_t v5 = v4;
  *(void *)(v6 + 80) = v0;
  swift_task_dealloc();
  sub_24A0FB244();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_24A0FB948()
{
  sub_24A0FB204();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  sub_24A0FB280();
  return v0();
}

uint64_t sub_24A0FB9A8()
{
  sub_24A0FB204();
  sub_24A0FB00C();
  sub_24A0FB128();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  sub_24A0FB128();
  *uint64_t v5 = v4;
  *(void *)(v6 + 104) = v0;
  swift_task_dealloc();
  sub_24A0FB244();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_24A0FBA88()
{
  sub_24A0FB204();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  sub_24A0FB280();
  return v0();
}

uint64_t sub_24A0FBAEC()
{
  sub_24A0FB204();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  sub_24A0FB1D0();
  return v0();
}

uint64_t sub_24A0FBB50()
{
  sub_24A0FB204();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  sub_24A0FB1D0();
  return v0();
}

uint64_t sub_24A0FBBB4(uint64_t a1, uint64_t a2)
{
  uint64_t v57 = a1;
  uint64_t v3 = type metadata accessor for Asset.ID();
  uint64_t v51 = *(void *)(v3 - 8);
  uint64_t v52 = v3;
  MEMORY[0x270FA5388](v3);
  v50 = (char *)&v48 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for Asset.Protector();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v48 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v48 - v10;
  Asset.protector.getter();
  uint64_t v12 = Asset.Protector.securityKey.getter();
  unint64_t v14 = v13;
  Swift::Int v15 = *(void (**)(char *, uint64_t))(v6 + 8);
  v15(v11, v5);
  uint64_t v55 = a2;
  Asset.protector.getter();
  uint64_t v58 = Asset.Protector.privacyKey.getter();
  unint64_t v59 = v16;
  v53 = v15;
  uint64_t v54 = v5;
  v15(v11, v5);
  sub_24A0FA334(&qword_26976A2D8);
  uint64_t inited = swift_initStackObject();
  long long v56 = xmmword_24A11C2F0;
  *(_OWORD *)(inited + 16) = xmmword_24A11C2F0;
  if (!*MEMORY[0x263F534E8])
  {
    __break(1u);
    goto LABEL_13;
  }
  *(void *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(inited + 40) = v18;
  *(void *)(inited + 72) = MEMORY[0x263F8D6C8];
  *(void *)(inited + 48) = v57;
  uint64_t v19 = Dictionary.init(dictionaryLiteral:)();
  if (!sub_24A0FC110(v12, v14))
  {
    uint64_t v57 = v12;
    sub_24A0FA334(&qword_26976A2F0);
    uint64_t v20 = swift_initStackObject();
    *(_OWORD *)(v20 + 16) = v56;
    if (*MEMORY[0x263F53598])
    {
      unint64_t v49 = v14;
      *(void *)(v20 + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)();
      *(void *)(v20 + 40) = v21;
      sub_24A0FA334(&qword_26976A2F8);
      uint64_t v22 = swift_initStackObject();
      *(_OWORD *)(v22 + 16) = xmmword_24A11C300;
      if (*MEMORY[0x263F534F0])
      {
        *(void *)(v22 + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)();
        *(void *)(v22 + 40) = v23;
        Asset.protector.getter();
        uint64_t v24 = Asset.Protector.securityKey.getter();
        uint64_t v26 = v25;
        v53(v9, v54);
        *(void *)(v22 + 48) = v24;
        *(void *)(v22 + 56) = v26;
        if (*MEMORY[0x263F534F8])
        {
          *(void *)(v22 + 64) = static String._unconditionallyBridgeFromObjectiveC(_:)();
          *(void *)(v22 + 72) = v27;
          uint64_t v28 = v50;
          Asset.id.getter();
          uint64_t v29 = Asset.ID.referenceSignature.getter();
          uint64_t v31 = v30;
          (*(void (**)(char *, uint64_t))(v51 + 8))(v28, v52);
          *(void *)(v22 + 80) = v29;
          *(void *)(v22 + 88) = v31;
          *(void *)(v20 + 48) = Dictionary.init(dictionaryLiteral:)();
          sub_24A0FA334(&qword_26976A300);
          Dictionary.init(dictionaryLiteral:)();
          sub_24A0FC174();
          uint64_t v33 = v32;
          swift_bridgeObjectRelease();
          char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          v60[0] = v19;
          sub_24A1084A4(v33, (uint64_t)sub_24A107BE0, 0, isUniquelyReferenced_nonNull_native, v60);
          unint64_t v14 = v49;
          uint64_t v19 = v60[0];
          swift_bridgeObjectRelease();
          uint64_t v12 = v57;
          goto LABEL_7;
        }
LABEL_15:
        __break(1u);
        goto LABEL_16;
      }
LABEL_14:
      __break(1u);
      goto LABEL_15;
    }
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
LABEL_7:
  uint64_t v36 = v58;
  unint64_t v35 = v59;
  if (sub_24A0FC110(v58, v59))
  {
    sub_24A0FA8D8(v12, v14);
    uint64_t v37 = v36;
    unint64_t v38 = v35;
LABEL_11:
    sub_24A0FA8D8(v37, v38);
    return v19;
  }
  sub_24A0FA334(&qword_26976A2F8);
  uint64_t v39 = swift_initStackObject();
  *(_OWORD *)(v39 + 16) = v56;
  if (*MEMORY[0x263F534B8])
  {
    *(void *)(v39 + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)();
    *(void *)(v39 + 40) = v40;
    Asset.protector.getter();
    uint64_t v41 = Asset.Protector.privacyKey.getter();
    uint64_t v43 = v42;
    v53(v11, v54);
    *(void *)(v39 + 48) = v41;
    *(void *)(v39 + 56) = v43;
    Dictionary.init(dictionaryLiteral:)();
    sub_24A0FC400();
    uint64_t v45 = v44;
    swift_bridgeObjectRelease();
    char v46 = swift_isUniquelyReferenced_nonNull_native();
    v60[0] = v19;
    sub_24A1084A4(v45, (uint64_t)sub_24A107BE0, 0, v46, v60);
    uint64_t v19 = v60[0];
    swift_bridgeObjectRelease();
    sub_24A0FA8D8(v12, v14);
    uint64_t v37 = v58;
    unint64_t v38 = v59;
    goto LABEL_11;
  }
LABEL_16:
  __break(1u);
  uint64_t result = swift_bridgeObjectRelease();
  __break(1u);
  return result;
}

BOOL sub_24A0FC110(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = 0;
  uint64_t v3 = 0;
  switch(a2 >> 62)
  {
    case 1uLL:
      uint64_t v3 = (int)a1;
      uint64_t v2 = a1 >> 32;
      break;
    case 2uLL:
      uint64_t v3 = *(void *)(a1 + 16);
      uint64_t v2 = *(void *)(a1 + 24);
      break;
    case 3uLL:
      return v3 == v2;
    default:
      uint64_t v3 = 0;
      uint64_t v2 = BYTE6(a2);
      break;
  }
  return v3 == v2;
}

void sub_24A0FC174()
{
  sub_24A10AA30();
  if (v1)
  {
    sub_24A0FA334(&qword_26976A308);
    uint64_t v4 = (void *)sub_24A10A68C();
  }
  else
  {
    uint64_t v4 = (void *)MEMORY[0x263F8EE80];
  }
  sub_24A10A4B8();
  uint64_t v7 = v6 & v5;
  sub_24A10A44C();
  uint64_t v8 = 0;
  uint64_t v9 = (uint64_t *)&unk_26976A300;
  uint64_t v10 = MEMORY[0x263F8EE58] + 8;
  while (1)
  {
    while (1)
    {
      if (v7)
      {
        uint64_t v32 = (v7 - 1) & v7;
      }
      else
      {
        if (__OFADD__(v8, 1)) {
          goto LABEL_36;
        }
        sub_24A10A994();
        if (v12 == v13)
        {
LABEL_33:
          sub_24A10A904();
          return;
        }
        if (!*(void *)(v31 + 8 * v11))
        {
          sub_24A10A598();
          if (v12 == v13) {
            goto LABEL_33;
          }
          sub_24A10A6E0();
          if (!v14)
          {
            sub_24A10A598();
            if (v12 == v13) {
              goto LABEL_33;
            }
            sub_24A10A6E0();
            if (!v15)
            {
              sub_24A10A598();
              if (v12 == v13) {
                goto LABEL_33;
              }
              sub_24A10A6E0();
              if (!v16)
              {
                sub_24A10A994();
                if (v12 == v13) {
                  goto LABEL_33;
                }
                if (!*(void *)(v31 + 8 * v17))
                {
                  while (!__OFADD__(v17, 1))
                  {
                    sub_24A10A598();
                    if (v12 == v13) {
                      goto LABEL_33;
                    }
                    uint64_t v17 = v19 + 1;
                    if (*(void *)(v31 + 8 * v18)) {
                      goto LABEL_27;
                    }
                  }
                  goto LABEL_37;
                }
              }
            }
          }
        }
LABEL_27:
        sub_24A10A630();
      }
      uint64_t v20 = sub_24A10A790();
      uint64_t v33 = v21;
      uint64_t v34 = v20;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_24A0FA334(v9);
      swift_dynamicCast();
      sub_24A0FAFF4(v2, v3);
      sub_24A0FAFF4(v3, v36);
      sub_24A0FAFF4(v36, v35);
      unint64_t v22 = sub_24A106774();
      unint64_t v23 = v22;
      if ((v24 & 1) == 0) {
        break;
      }
      uint64_t v8 = v3;
      uint64_t v3 = v2;
      uint64_t v2 = v0;
      uint64_t v0 = (_OWORD *)v10;
      uint64_t v10 = (uint64_t)v9;
      uint64_t v25 = (void *)(v4[6] + 16 * v22);
      swift_bridgeObjectRelease();
      *uint64_t v25 = v33;
      v25[1] = v34;
      uint64_t v9 = (uint64_t *)v10;
      sub_24A10A6C4();
      uint64_t v27 = (_OWORD *)(v26 + 32 * v23);
      sub_24A0FAFA4((uint64_t)v27);
      sub_24A0FAFF4(v35, v27);
      uint64_t v7 = v32;
    }
    if (v4[2] >= v4[3]) {
      break;
    }
    *(void *)(v30 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v22;
    uint64_t v28 = (void *)(v4[6] + 16 * v22);
    *uint64_t v28 = v33;
    v28[1] = v34;
    sub_24A0FAFF4(v35, (_OWORD *)(v4[7] + 32 * v22));
    sub_24A10ABC8();
    if (v13) {
      goto LABEL_35;
    }
    v4[2] = v29;
    uint64_t v7 = v32;
  }
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
LABEL_37:
  __break(1u);
}

void sub_24A0FC400()
{
  sub_24A10AA30();
  if (v1)
  {
    sub_24A0FA334(&qword_26976A308);
    uint64_t v2 = (void *)sub_24A10A68C();
  }
  else
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
  }
  uint64_t v33 = v0 + 8;
  uint64_t v3 = -1 << *((unsigned char *)v0 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  uint64_t v5 = v4 & v0[8];
  int64_t v32 = (unint64_t)(63 - v3) >> 6;
  uint64_t v6 = &v37;
  uint64_t v7 = &v39;
  swift_bridgeObjectRetain();
  uint64_t v8 = 0;
  uint64_t v9 = (uint64_t *)(MEMORY[0x263F8EE58] + 8);
  uint64_t v10 = (uint64_t *)MEMORY[0x263F06F78];
  while (1)
  {
    while (1)
    {
      if (v5)
      {
        sub_24A10ABA0();
        uint64_t v34 = v5;
      }
      else
      {
        int64_t v11 = (int64_t)v8 + 1;
        if (__OFADD__(v8, 1)) {
          goto LABEL_38;
        }
        if (v11 >= v32)
        {
LABEL_35:
          sub_24A10A080();
          return;
        }
        uint64_t v12 = *((void *)v33 + v11);
        char v13 = (_OWORD *)((char *)v8 + 1);
        if (!v12)
        {
          sub_24A10A988();
          if (v14 == v15) {
            goto LABEL_35;
          }
          sub_24A10AB94();
          if (!v12)
          {
            sub_24A10A988();
            if (v14 == v15) {
              goto LABEL_35;
            }
            sub_24A10AB94();
            if (!v12)
            {
              sub_24A10A988();
              if (v14 == v15) {
                goto LABEL_35;
              }
              sub_24A10AB94();
              if (!v12)
              {
                int64_t v17 = v16 + 4;
                if (v17 >= v32) {
                  goto LABEL_35;
                }
                uint64_t v12 = *((void *)v33 + v17);
                if (!v12)
                {
                  while (!__OFADD__(v17, 1))
                  {
                    sub_24A10A988();
                    if (v14 == v15) {
                      goto LABEL_35;
                    }
                    sub_24A10AB94();
                    int64_t v17 = v18 + 1;
                    if (v12) {
                      goto LABEL_29;
                    }
                  }
                  goto LABEL_39;
                }
                char v13 = (_OWORD *)v17;
              }
            }
          }
        }
LABEL_29:
        uint64_t v34 = (v12 - 1) & v12;
        uint64_t v8 = v13;
      }
      uint64_t v19 = sub_24A10A790();
      unint64_t v22 = (uint64_t *)(v21 + 16 * v20);
      uint64_t v23 = *v22;
      unint64_t v24 = v22[1];
      uint64_t v35 = v25;
      uint64_t v36 = v19;
      swift_bridgeObjectRetain();
      sub_24A109F34(v23, v24);
      sub_24A10AAB0();
      sub_24A0FAFF4(v6, v7);
      sub_24A0FAFF4(v7, v40);
      sub_24A0FAFF4(v40, &v38);
      unint64_t v26 = sub_24A106774();
      if ((v27 & 1) == 0) {
        break;
      }
      sub_24A10A604();
      *uint64_t v9 = v35;
      v9[1] = v36;
      uint64_t v9 = v10;
      uint64_t v10 = v0;
      uint64_t v0 = v6;
      uint64_t v6 = v7;
      uint64_t v7 = (uint64_t *)v8;
      uint64_t v28 = (_OWORD *)(v2[7] + 32 * v26);
      sub_24A0FAFA4((uint64_t)v28);
      sub_24A0FAFF4(&v38, v28);
      uint64_t v5 = v34;
    }
    if (v2[2] >= v2[3]) {
      break;
    }
    sub_24A10AB34();
    sub_24A10A5E0(v29);
    sub_24A0FAFF4(&v38, v30);
    sub_24A10ABC8();
    if (v15) {
      goto LABEL_37;
    }
    v2[2] = v31;
    uint64_t v5 = v34;
  }
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
LABEL_39:
  __break(1u);
}

void sub_24A0FC6C8()
{
  sub_24A10AA30();
  if (v0)
  {
    sub_24A0FA334(&qword_26976A308);
    uint64_t v3 = sub_24A10A68C();
  }
  else
  {
    uint64_t v3 = MEMORY[0x263F8EE80];
  }
  sub_24A10A4B8();
  uint64_t v6 = v5 & v4;
  sub_24A10A44C();
  uint64_t v7 = (void *)(MEMORY[0x263F8EE58] + 8);
  uint64_t v8 = (void *)MEMORY[0x263F8D6C8];
  while (v6)
  {
    sub_24A10ABA0();
    uint64_t v28 = v6;
LABEL_27:
    uint64_t v18 = sub_24A10A790();
    uint64_t v29 = v19;
    uint64_t v30 = v18;
    swift_bridgeObjectRetain();
    sub_24A10AAB0();
    sub_24A0FAFF4(v1, v2);
    sub_24A0FAFF4(v2, v32);
    sub_24A0FAFF4(v32, v31);
    unint64_t v20 = sub_24A106774();
    if (v21)
    {
      sub_24A10A604();
      void *v7 = v29;
      v7[1] = v30;
      uint64_t v7 = v8;
      sub_24A10A6C4();
      uint64_t v23 = (_OWORD *)(v22 + 32 * v20);
      sub_24A0FAFA4((uint64_t)v23);
      sub_24A0FAFF4(v31, v23);
      uint64_t v6 = v28;
    }
    else
    {
      if (*(void *)(v3 + 16) >= *(void *)(v3 + 24))
      {
        __break(1u);
LABEL_34:
        __break(1u);
        __break(1u);
        goto LABEL_35;
      }
      sub_24A10AB34();
      sub_24A10A5E0(v24);
      sub_24A0FAFF4(v31, v25);
      sub_24A10ABC8();
      if (v11) {
        goto LABEL_34;
      }
      *(void *)(v3 + 16) = v26;
      uint64_t v6 = v28;
    }
  }
  sub_24A10A994();
  if (v10 == v11) {
    goto LABEL_32;
  }
  if (*(void *)(v27 + 8 * v9)) {
    goto LABEL_26;
  }
  sub_24A10A598();
  if (v10 == v11) {
    goto LABEL_32;
  }
  sub_24A10A6E0();
  if (v12) {
    goto LABEL_26;
  }
  sub_24A10A598();
  if (v10 == v11) {
    goto LABEL_32;
  }
  sub_24A10A6E0();
  if (v13) {
    goto LABEL_26;
  }
  sub_24A10A598();
  if (v10 == v11) {
    goto LABEL_32;
  }
  sub_24A10A6E0();
  if (v14) {
    goto LABEL_26;
  }
  sub_24A10A994();
  if (v10 == v11)
  {
LABEL_32:
    sub_24A10A904();
    return;
  }
  if (*(void *)(v27 + 8 * v15))
  {
LABEL_26:
    sub_24A10A630();
    goto LABEL_27;
  }
  while (!__OFADD__(v15, 1))
  {
    sub_24A10A598();
    if (v10 == v11) {
      goto LABEL_32;
    }
    uint64_t v15 = v17 + 1;
    if (*(void *)(v27 + 8 * v16)) {
      goto LABEL_26;
    }
  }
LABEL_35:
  __break(1u);
}

void sub_24A0FC8E4(uint64_t a1)
{
  uint64_t v33 = sub_24A0FA334(&qword_26976A2E8);
  uint64_t v3 = MEMORY[0x270FA5388](v33);
  int64_t v32 = (void *)((char *)v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  uint64_t v31 = (void *)((char *)v27 - v6);
  MEMORY[0x270FA5388](v5);
  uint64_t v30 = (char *)v27 - v7;
  uint64_t v8 = *(void *)(a1 + 16);
  if (v8)
  {
    v27[1] = v1;
    uint64_t v38 = MEMORY[0x263F8EE78];
    sub_24A108C9C();
    uint64_t v9 = sub_24A109EB4(a1);
    if ((v9 & 0x8000000000000000) == 0)
    {
      unint64_t v11 = v9;
      if (v9 < 1 << *(unsigned char *)(a1 + 32))
      {
        uint64_t v12 = a1 + 64;
        uint64_t v28 = a1 + 64;
        uint64_t v29 = a1;
        uint64_t v13 = v30;
        while ((*(void *)(v12 + 8 * (v11 >> 6)) & (1 << v11)) != 0)
        {
          if (v10 != *(_DWORD *)(a1 + 36)) {
            goto LABEL_20;
          }
          uint64_t v36 = 1 << v11;
          unint64_t v37 = v11 >> 6;
          uint64_t v34 = v8;
          uint64_t v35 = v10;
          uint64_t v14 = v33;
          uint64_t v15 = (char *)v13 + *(int *)(v33 + 48);
          uint64_t v16 = *(void *)(a1 + 56);
          uint64_t v17 = *(void *)(*(void *)(a1 + 48) + 8 * v11);
          uint64_t v18 = type metadata accessor for Asset();
          uint64_t v19 = *(void *)(v18 - 8);
          unint64_t v20 = *(void (**)(char *, unint64_t, uint64_t))(v19 + 16);
          v20(v15, v16 + *(void *)(v19 + 72) * v11, v18);
          *uint64_t v13 = v17;
          uint64_t v21 = (uint64_t)v31;
          *uint64_t v31 = v17;
          v20((char *)(v21 + *(int *)(v14 + 48)), (unint64_t)v15, v18);
          uint64_t v22 = v32;
          sub_24A10A088(v21, (uint64_t)v32, &qword_26976A2E8);
          sub_24A10A26C((uint64_t)v13, &qword_26976A2E8);
          uint64_t v23 = sub_24A0FBBB4(*v22, (uint64_t)v22 + *(int *)(v14 + 48));
          sub_24A10A26C((uint64_t)v22, &qword_26976A2E8);
          uint64_t v24 = v38;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            sub_24A108C9C();
            uint64_t v24 = v38;
          }
          unint64_t v25 = *(void *)(v24 + 16);
          a1 = v29;
          if (v25 >= *(void *)(v24 + 24) >> 1)
          {
            sub_24A108C9C();
            uint64_t v24 = v38;
          }
          *(void *)(v24 + 16) = v25 + 1;
          *(void *)(v24 + 8 * v25 + 32) = v23;
          if ((uint64_t)v11 >= -(-1 << *(unsigned char *)(a1 + 32))) {
            goto LABEL_21;
          }
          uint64_t v12 = v28;
          if ((*(void *)(v28 + 8 * v37) & v36) == 0) {
            goto LABEL_22;
          }
          if (v35 != *(_DWORD *)(a1 + 36)) {
            goto LABEL_23;
          }
          uint64_t v26 = _HashTable.occupiedBucket(after:)();
          uint64_t v8 = v34 - 1;
          if (v34 == 1) {
            return;
          }
          unint64_t v11 = v26;
          if ((v26 & 0x8000000000000000) == 0)
          {
            uint64_t v10 = *(unsigned int *)(a1 + 36);
            if (v26 < 1 << *(unsigned char *)(a1 + 32)) {
              continue;
            }
          }
          goto LABEL_24;
        }
        __break(1u);
LABEL_20:
        __break(1u);
LABEL_21:
        __break(1u);
LABEL_22:
        __break(1u);
LABEL_23:
        __break(1u);
      }
    }
LABEL_24:
    __break(1u);
  }
}

uint64_t sub_24A0FCC28(uint64_t a1)
{
  uint64_t v19 = type metadata accessor for Asset.ID();
  uint64_t v3 = *(void *)(v19 - 8);
  MEMORY[0x270FA5388](v19);
  uint64_t v5 = (char *)v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *(void *)(a1 + 16);
  uint64_t v7 = MEMORY[0x263F8EE78];
  if (v6)
  {
    v17[1] = v1;
    uint64_t v20 = MEMORY[0x263F8EE78];
    sub_24A108DA4();
    uint64_t v8 = *(void *)(type metadata accessor for Asset() - 8);
    uint64_t v9 = a1 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
    uint64_t v18 = *(void *)(v8 + 72);
    uint64_t v10 = (void (**)(char *, uint64_t))(v3 + 8);
    do
    {
      Asset.id.getter();
      uint64_t v11 = Asset.ID.signature.getter();
      uint64_t v13 = v12;
      (*v10)(v5, v19);
      uint64_t v7 = v20;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_24A108DA4();
        uint64_t v7 = v20;
      }
      unint64_t v14 = *(void *)(v7 + 16);
      if (v14 >= *(void *)(v7 + 24) >> 1)
      {
        sub_24A108DA4();
        uint64_t v7 = v20;
      }
      *(void *)(v7 + 16) = v14 + 1;
      uint64_t v15 = v7 + 16 * v14;
      *(void *)(v15 + 32) = v11;
      *(void *)(v15 + 40) = v13;
      v9 += v18;
      --v6;
    }
    while (v6);
  }
  return v7;
}

uint64_t sub_24A0FCE34(uint64_t a1)
{
  uint64_t v17 = type metadata accessor for Credential();
  uint64_t v3 = *(void *)(v17 - 8);
  MEMORY[0x270FA5388](v17);
  uint64_t v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *(void *)(a1 + 16);
  uint64_t v7 = MEMORY[0x263F8EE78];
  if (v6)
  {
    uint64_t v16 = v1;
    uint64_t v18 = MEMORY[0x263F8EE78];
    sub_24A108E1C();
    uint64_t v8 = (void *)(a1 + 32);
    uint64_t v9 = (void (**)(char *, uint64_t))(v3 + 8);
    do
    {
      sub_24A109F8C(v8, v8[3]);
      dispatch thunk of AssetRequest.credential.getter();
      uint64_t v10 = Credential.accessToken.getter();
      uint64_t v12 = v11;
      (*v9)(v5, v17);
      uint64_t v7 = v18;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_24A108E1C();
        uint64_t v7 = v18;
      }
      unint64_t v13 = *(void *)(v7 + 16);
      if (v13 >= *(void *)(v7 + 24) >> 1)
      {
        sub_24A108E1C();
        uint64_t v7 = v18;
      }
      *(void *)(v7 + 16) = v13 + 1;
      uint64_t v14 = v7 + 16 * v13;
      *(void *)(v14 + 32) = v10;
      *(void *)(v14 + 40) = v12;
      v8 += 5;
      --v6;
    }
    while (v6);
  }
  return v7;
}

uint64_t sub_24A0FCFFC(uint64_t a1)
{
  int64_t v2 = *(void *)(a1 + 16);
  if (v2)
  {
    uint64_t v14 = MEMORY[0x263F8EE78];
    sub_24A108EEC(0, v2, 0);
    uint64_t v4 = v14;
    uint64_t v5 = (uint64_t *)(a1 + 32);
    while (1)
    {
      uint64_t v7 = *v5++;
      uint64_t result = v7;
      if (v7 < 0) {
        break;
      }
      *(void *)&v13[0] = result;
      sub_24A114D74(result, (uint64_t)v13 + 8);
      if (v1)
      {
        swift_release();
        swift_release();
        return v4;
      }
      uint64_t v14 = v4;
      unint64_t v9 = *(void *)(v4 + 16);
      unint64_t v8 = *(void *)(v4 + 24);
      if (v9 >= v8 >> 1)
      {
        sub_24A108EEC((char *)(v8 > 1), v9 + 1, 1);
        uint64_t v4 = v14;
      }
      *(void *)(v4 + 16) = v9 + 1;
      uint64_t v10 = (_OWORD *)(v4 + 48 * v9);
      long long v11 = v13[0];
      long long v12 = v13[2];
      v10[3] = v13[1];
      v10[4] = v12;
      v10[2] = v11;
      if (!--v2)
      {
        swift_release();
        return v4;
      }
    }
    __break(1u);
  }
  else
  {
    swift_release();
    return MEMORY[0x263F8EE78];
  }
  return result;
}

unint64_t sub_24A0FD140(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = type metadata accessor for Asset();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = *(void *)(a1 + 16);
  if (v8)
  {
    v19[1] = v2;
    uint64_t v22 = MEMORY[0x263F8EE78];
    uint64_t v21 = (char *)v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
    sub_24A108EAC(0, v8, 0);
    uint64_t v9 = v22;
    uint64_t v10 = (unint64_t *)(a1 + 32);
    v19[2] = v6 + 32;
    v19[3] = v6 + 16;
    uint64_t v20 = a2;
    while (1)
    {
      unint64_t v12 = *v10++;
      unint64_t result = v12;
      if ((v12 & 0x8000000000000000) != 0) {
        break;
      }
      if (!*(void *)(a2 + 16)) {
        goto LABEL_13;
      }
      unint64_t result = sub_24A106698(result);
      if ((v13 & 1) == 0) {
        goto LABEL_14;
      }
      uint64_t v14 = *(void *)(v6 + 72);
      uint64_t v15 = v21;
      (*(void (**)(char *, unint64_t, uint64_t))(v6 + 16))(v21, *(void *)(a2 + 56) + v14 * result, v5);
      uint64_t v22 = v9;
      uint64_t v16 = v5;
      unint64_t v18 = *(void *)(v9 + 16);
      unint64_t v17 = *(void *)(v9 + 24);
      if (v18 >= v17 >> 1)
      {
        sub_24A108EAC(v17 > 1, v18 + 1, 1);
        uint64_t v15 = v21;
        uint64_t v9 = v22;
      }
      *(void *)(v9 + 16) = v18 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))(v9 + ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80)) + v18 * v14, v15, v16);
      --v8;
      uint64_t v5 = v16;
      a2 = v20;
      if (!v8)
      {
        swift_bridgeObjectRelease();
        return v9;
      }
    }
    __break(1u);
LABEL_13:
    __break(1u);
LABEL_14:
    __break(1u);
  }
  else
  {
    swift_bridgeObjectRelease();
    return MEMORY[0x263F8EE78];
  }
  return result;
}

uint64_t sub_24A0FD350(uint64_t a1)
{
  int64_t v2 = *(void *)(a1 + 16);
  if (v2)
  {
    uint64_t v11 = MEMORY[0x263F8EE78];
    sub_24A108E8C(0, v2, 0);
    uint64_t v4 = v11;
    uint64_t v5 = (uint64_t *)(a1 + 32);
    while (1)
    {
      uint64_t v7 = *v5++;
      uint64_t result = v7;
      if (v7 < 0) {
        break;
      }
      sub_24A114D74(result, (uint64_t)v10);
      if (v1)
      {
        swift_release();
        swift_release();
        return v4;
      }
      uint64_t v11 = v4;
      unint64_t v9 = *(void *)(v4 + 16);
      unint64_t v8 = *(void *)(v4 + 24);
      if (v9 >= v8 >> 1)
      {
        sub_24A108E8C((char *)(v8 > 1), v9 + 1, 1);
        uint64_t v4 = v11;
      }
      *(void *)(v4 + 16) = v9 + 1;
      sub_24A10A130(v10, v4 + 40 * v9 + 32);
      if (!--v2)
      {
        swift_release();
        return v4;
      }
    }
    __break(1u);
  }
  else
  {
    swift_release();
    return MEMORY[0x263F8EE78];
  }
  return result;
}

uint64_t sub_24A0FD484(void (*a1)(char *), uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v38 = a1;
  uint64_t v39 = a2;
  uint64_t v6 = type metadata accessor for Asset();
  uint64_t v41 = *(void *)(v6 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v6);
  unint64_t v9 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  unint64_t v37 = (char *)&v29 - v10;
  uint64_t v36 = type metadata accessor for AssetSkeleton();
  uint64_t v40 = *(void *)(v36 - 8);
  MEMORY[0x270FA5388](v36);
  char v46 = (char *)&v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = *(void *)(a3 + 16);
  uint64_t v13 = MEMORY[0x263F8EE78];
  if (!v12) {
    return v13;
  }
  uint64_t v35 = v9;
  uint64_t v47 = MEMORY[0x263F8EE78];
  sub_24A108F5C(0, v12, 0);
  uint64_t result = sub_24A109EB4(a3);
  if ((result & 0x8000000000000000) == 0)
  {
    unint64_t v16 = result;
    uint64_t v17 = a3;
    if (result < 1 << *(unsigned char *)(a3 + 32))
    {
      uint64_t v18 = v6;
      uint64_t v19 = v17 + 64;
      uint64_t v32 = v41 + 32;
      uint64_t v33 = v41 + 16;
      uint64_t v34 = (void (**)(char *, uint64_t))(v41 + 8);
      uint64_t v30 = v6;
      uint64_t v31 = v40 + 32;
      while (1)
      {
        uint64_t v45 = v12;
        if ((*(void *)(v19 + 8 * (v16 >> 6)) & (1 << v16)) == 0) {
          break;
        }
        if (v15 != *(_DWORD *)(v17 + 36)) {
          goto LABEL_22;
        }
        uint64_t v43 = v15;
        unint64_t v44 = v16 >> 6;
        uint64_t v20 = v19;
        uint64_t v21 = v17;
        uint64_t v22 = v41;
        uint64_t v23 = v4;
        uint64_t v24 = v37;
        (*(void (**)(char *, unint64_t, uint64_t))(v41 + 16))(v37, *(void *)(v17 + 56) + *(void *)(v41 + 72) * v16, v18);
        unint64_t v25 = v35;
        (*(void (**)(char *, char *, uint64_t))(v22 + 32))(v35, v24, v18);
        uint64_t v13 = v39;
        v38(v25);
        if (v23)
        {
          (*v34)(v25, v18);
          swift_release();
          return v13;
        }
        (*v34)(v25, v18);
        uint64_t v13 = v47;
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v42 = 0;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          sub_24A108F5C(0, *(void *)(v13 + 16) + 1, 1);
          uint64_t v13 = v47;
        }
        uint64_t v17 = v21;
        uint64_t v19 = v20;
        unint64_t v28 = *(void *)(v13 + 16);
        unint64_t v27 = *(void *)(v13 + 24);
        if (v28 >= v27 >> 1)
        {
          sub_24A108F5C(v27 > 1, v28 + 1, 1);
          uint64_t v13 = v47;
        }
        *(void *)(v13 + 16) = v28 + 1;
        uint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v40 + 32))(v13+ ((*(unsigned __int8 *)(v40 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v40 + 80))+ *(void *)(v40 + 72) * v28, v46, v36);
        uint64_t v47 = v13;
        if ((uint64_t)v16 >= -(-1 << *(unsigned char *)(v21 + 32))) {
          goto LABEL_23;
        }
        if ((*(void *)(v20 + 8 * v44) & (1 << v16)) == 0) {
          goto LABEL_24;
        }
        if (v43 != *(_DWORD *)(v21 + 36)) {
          goto LABEL_25;
        }
        uint64_t result = _HashTable.occupiedBucket(after:)();
        uint64_t v12 = v45 - 1;
        if (v45 == 1) {
          return v13;
        }
        unint64_t v16 = result;
        uint64_t v4 = v42;
        uint64_t v18 = v30;
        if ((result & 0x8000000000000000) == 0)
        {
          uint64_t v15 = *(unsigned int *)(v17 + 36);
          if (result < 1 << *(unsigned char *)(v17 + 32)) {
            continue;
          }
        }
        goto LABEL_26;
      }
      __break(1u);
LABEL_22:
      __break(1u);
LABEL_23:
      __break(1u);
LABEL_24:
      __break(1u);
LABEL_25:
      __break(1u);
    }
  }
LABEL_26:
  __break(1u);
  return result;
}

uint64_t sub_24A0FD8AC()
{
  sub_24A0FA334(&qword_26976A2D8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24A11C300;
  uint64_t result = *MEMORY[0x263F53520];
  if (*MEMORY[0x263F53520])
  {
    *(void *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)();
    *(void *)(inited + 40) = v3;
    uint64_t v4 = swift_bridgeObjectRetain();
    sub_24A0FC8E4(v4);
    uint64_t v6 = v5;
    swift_bridgeObjectRelease();
    uint64_t v7 = sub_24A0FA334(&qword_26976A2E0);
    *(void *)(inited + 48) = v6;
    *(void *)(inited + 72) = v7;
    *(void *)(inited + 80) = 0xD00000000000001BLL;
    *(void *)(inited + 88) = 0x800000024A11D570;
    char v8 = *(unsigned char *)(v0 + 24);
    *(void *)(inited + 120) = MEMORY[0x263F8D4F8];
    *(unsigned char *)(inited + 96) = v8;
    return Dictionary.init(dictionaryLiteral:)();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_24A0FD9A4()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0228](v0, 25, 7);
}

uint64_t sub_24A0FD9DC()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_24A10A208(v0, qword_26976A1B0);
  sub_24A1058C4(v0, (uint64_t)qword_26976A1B0);
  static LoggerSubsystem.server.getter();
  type metadata accessor for Uploader();
  sub_24A0FA334(&qword_26976A400);
  String.init<A>(describing:)();
  return Logger.init(subsystem:category:)();
}

uint64_t sub_24A0FDA78(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  type metadata accessor for Registerer();
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = a1;
  *(void *)(v1 + 24) = v3;
  swift_retain();
  return v1;
}

uint64_t sub_24A0FDAC4(uint64_t a1)
{
  return sub_24A0FDB04(a1, (uint64_t)&qword_26976A3E0, (void (*)(uint64_t, uint64_t, uint64_t *))sub_24A108040);
}

uint64_t sub_24A0FDAE4(uint64_t a1)
{
  return sub_24A0FDB04(a1, (uint64_t)&qword_26976A3A0, (void (*)(uint64_t, uint64_t, uint64_t *))sub_24A107C18);
}

uint64_t sub_24A0FDB04(uint64_t a1, uint64_t a2, void (*a3)(uint64_t, uint64_t, uint64_t *))
{
  sub_24A10AA30();
  if (v3)
  {
    sub_24A0FA334(v5);
    uint64_t v6 = sub_24A10A68C();
  }
  else
  {
    uint64_t v6 = MEMORY[0x263F8EE80];
  }
  uint64_t v9 = v6;
  uint64_t v7 = swift_bridgeObjectRetain();
  a3(v7, 1, &v9);
  swift_bridgeObjectRelease();
  return v9;
}

uint64_t sub_24A0FDBA4(uint64_t a1)
{
  return sub_24A0FDB04(a1, (uint64_t)&qword_26976A370, (void (*)(uint64_t, uint64_t, uint64_t *))sub_24A1086D0);
}

uint64_t sub_24A0FDBC4(uint64_t a1)
{
  return sub_24A0FDB04(a1, (uint64_t)&qword_26976A3C0, (void (*)(uint64_t, uint64_t, uint64_t *))sub_24A1089AC);
}

uint64_t sub_24A0FDBE4(uint64_t a1)
{
  uint64_t v28 = type metadata accessor for Data.Iterator();
  uint64_t v2 = *(void *)(v28 - 8);
  MEMORY[0x270FA5388](v28);
  uint64_t v4 = (char *)v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_24A0FCC28(a1);
  uint64_t v6 = *(void *)(v5 + 16);
  if (v6)
  {
    uint64_t v7 = (void *)MEMORY[0x263F8EE78];
    uint64_t v29 = MEMORY[0x263F8EE78];
    sub_24A108D7C(0, v6, 0);
    char v8 = (void (**)(char *, uint64_t))(v2 + 8);
    v27[1] = v5;
    uint64_t v9 = (unint64_t *)(v5 + 40);
    while (2)
    {
      uint64_t v10 = *(v9 - 1);
      unint64_t v11 = *v9;
      unint64_t v12 = *v9 >> 62;
      v9 += 2;
      uint64_t v13 = v7;
      switch(v12)
      {
        case 1uLL:
          if (__OFSUB__(HIDWORD(v10), v10)) {
            goto LABEL_28;
          }
          uint64_t v14 = HIDWORD(v10) - (int)v10;
LABEL_9:
          sub_24A109F34(v10, v11);
          if (v14)
          {
LABEL_10:
            if (v14 < 1)
            {
              uint64_t v13 = v7;
            }
            else
            {
              sub_24A0FA334(&qword_26976A1F0);
              uint64_t v13 = (void *)swift_allocObject();
              size_t v17 = j__malloc_size(v13);
              v13[2] = v14;
              _OWORD v13[3] = 2 * v17 - 64;
            }
            uint64_t v18 = Data._copyContents(initializing:)();
            (*v8)(v4, v28);
            if (v18 != v14)
            {
              __break(1u);
LABEL_28:
              __break(1u);
LABEL_29:
              __break(1u);
LABEL_30:
              _fatalErrorMessage(_:_:file:line:flags:)();
              __break(1u);
              JUMPOUT(0x24A0FDF0CLL);
            }
          }
          else
          {
LABEL_5:
            uint64_t v13 = v7;
          }
LABEL_14:
          size_t v19 = v13[2];
          uint64_t v20 = (char *)swift_slowAlloc();
          if (v13 + 4 < (void *)&v20[v19] && v20 < (char *)v13 + v19 + 32) {
            goto LABEL_30;
          }
          uint64_t v22 = v20;
          memcpy(v20, v13 + 4, v19);
          swift_release();
          sub_24A0FA8D8(v10, v11);
          uint64_t v23 = v29;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            sub_24A108D7C(0, *(void *)(v23 + 16) + 1, 1);
            uint64_t v23 = v29;
          }
          unint64_t v25 = *(void *)(v23 + 16);
          unint64_t v24 = *(void *)(v23 + 24);
          if (v25 >= v24 >> 1)
          {
            sub_24A108D7C(v24 > 1, v25 + 1, 1);
            uint64_t v23 = v29;
          }
          *(void *)(v23 + 16) = v25 + 1;
          *(void *)(v23 + 8 * v25 + 32) = v22;
          if (--v6) {
            continue;
          }
          swift_bridgeObjectRelease();
          break;
        case 2uLL:
          uint64_t v16 = *(void *)(v10 + 16);
          uint64_t v15 = *(void *)(v10 + 24);
          uint64_t v14 = v15 - v16;
          if (!__OFSUB__(v15, v16)) {
            goto LABEL_9;
          }
          goto LABEL_29;
        case 3uLL:
          goto LABEL_14;
        default:
          uint64_t v14 = BYTE6(v11);
          if (!BYTE6(v11)) {
            goto LABEL_5;
          }
          goto LABEL_10;
      }
      break;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    return MEMORY[0x263F8EE78];
  }
  return v23;
}

uint64_t sub_24A0FDF1C(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0 || (a3 + 8 * a2 > a1 ? (BOOL v3 = a1 + 8 * a2 > a3) : (BOOL v3 = 0), v3))
  {
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    sub_24A0FA334(&qword_26976A328);
    return swift_arrayInitWithCopy();
  }
  return result;
}

uint64_t sub_24A0FE01C(uint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0)
  {
    sub_24A10A39C();
    sub_24A10A52C();
LABEL_11:
    uint64_t result = sub_24A10A5A4();
    __break(1u);
    return result;
  }
  sub_24A10AA10();
  sub_24A0FA334(v4);
  sub_24A10A3CC();
  sub_24A10A9FC();
  if (!v7 & v6) {
    BOOL v8 = v5 > a3;
  }
  else {
    BOOL v8 = 0;
  }
  if (v8)
  {
    sub_24A10A39C();
    sub_24A10A51C();
    goto LABEL_11;
  }
  sub_24A10A9E8();
  return swift_arrayInitWithCopy();
}

uint64_t sub_24A0FE0E0(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0 || (a3 + 16 * a2 > a1 ? (BOOL v3 = a1 + 16 * a2 > a3) : (BOOL v3 = 0), v3))
  {
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    return swift_arrayInitWithCopy();
  }
  return result;
}

void *sub_24A0FE1C0(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    sub_24A10A39C();
    sub_24A10A52C();
LABEL_11:
    uint64_t result = (void *)sub_24A10A5A4();
    __break(1u);
    return result;
  }
  if (&__dst[8 * a2] > __src && &__src[8 * a2] > __dst)
  {
    sub_24A10A39C();
    sub_24A10A51C();
    goto LABEL_11;
  }
  return memcpy(__dst, __src, 8 * a2);
}

uint64_t sub_24A0FE26C(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0 || (a3 + 16 * a2 > a1 ? (BOOL v3 = a1 + 16 * a2 > a3) : (BOOL v3 = 0), v3))
  {
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    return swift_arrayInitWithCopy();
  }
  return result;
}

void *sub_24A0FE34C(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0)
  {
    sub_24A10A39C();
    sub_24A10A52C();
LABEL_11:
    uint64_t result = (void *)sub_24A10A5A4();
    __break(1u);
    return result;
  }
  if (&__dst[__n] > __src && &__src[__n] > __dst)
  {
    sub_24A10A39C();
    sub_24A10A51C();
    goto LABEL_11;
  }
  return memcpy(__dst, __src, __n);
}

void *sub_24A0FE3F4(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0 || (&__dst[4 * a2] > __src ? (BOOL v3 = &__src[4 * a2] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, 4 * a2);
  }
  return result;
}

uint64_t sub_24A0FE4D0(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0 || (a3 + 40 * a2 > a1 ? (BOOL v3 = a1 + 40 * a2 > a3) : (BOOL v3 = 0), v3))
  {
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    sub_24A0FA334(&qword_26976A350);
    return swift_arrayInitWithCopy();
  }
  return result;
}

uint64_t sub_24A0FE5D4(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0 || (a3 + 48 * a2 > a1 ? (BOOL v3 = a1 + 48 * a2 > a3) : (BOOL v3 = 0), v3))
  {
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    sub_24A0FA334(&qword_26976A378);
    return swift_arrayInitWithCopy();
  }
  return result;
}

void *sub_24A0FE6D8(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0 || (&__dst[8 * a2] > __src ? (BOOL v3 = &__src[8 * a2] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, 8 * a2);
  }
  return result;
}

uint64_t sub_24A0FE7B4(uint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0)
  {
    sub_24A10A39C();
    sub_24A10A52C();
LABEL_11:
    uint64_t result = sub_24A10A5A4();
    __break(1u);
    return result;
  }
  sub_24A10AA10();
  uint64_t v4 = sub_24A10A934();
  v5(v4);
  sub_24A10A3CC();
  sub_24A10A9FC();
  if (!v8 & v7) {
    BOOL v9 = v6 > a3;
  }
  else {
    BOOL v9 = 0;
  }
  if (v9)
  {
    sub_24A10A39C();
    sub_24A10A51C();
    goto LABEL_11;
  }
  sub_24A10A9E8();
  return swift_arrayInitWithCopy();
}

void *sub_24A0FE878(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0 || (&__dst[32 * a2] > __src ? (BOOL v3 = &__src[32 * a2] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, 32 * a2);
  }
  return result;
}

uint64_t sub_24A0FE954(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0 || (a3 + 24 * a2 > a1 ? (BOOL v3 = a1 + 24 * a2 > a3) : (BOOL v3 = 0), v3))
  {
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    sub_24A0FA334(&qword_26976A3D8);
    return swift_arrayInitWithCopy();
  }
  return result;
}

uint64_t sub_24A0FEA58(uint64_t a1)
{
  uint64_t v1 = sub_24A0FCE34(a1);
  uint64_t v2 = *(void *)(v1 + 16);
  if (v2)
  {
    uint64_t v12 = MEMORY[0x263F8EE78];
    sub_24A108DF4(0, v2, 0);
    uint64_t v3 = v12;
    uint64_t v4 = (uint64_t *)(v1 + 40);
    do
    {
      uint64_t v5 = *v4;
      v10[0] = *(v4 - 1);
      v10[1] = v5;
      sub_24A0FEB6C(v10, &v11);
      unint64_t v6 = v11;
      uint64_t v12 = v3;
      unint64_t v8 = *(void *)(v3 + 16);
      unint64_t v7 = *(void *)(v3 + 24);
      if (v8 >= v7 >> 1)
      {
        sub_24A108DF4(v7 > 1, v8 + 1, 1);
        uint64_t v3 = v12;
      }
      v4 += 2;
      *(void *)(v3 + 16) = v8 + 1;
      *(void *)(v3 + 8 * v8 + 32) = v6;
      --v2;
    }
    while (v2);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    return MEMORY[0x263F8EE78];
  }
  return v3;
}

void sub_24A0FEB6C(uint64_t *a1@<X0>, char **a2@<X8>)
{
  uint64_t v5 = type metadata accessor for String.Encoding();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  unint64_t v8 = (char *)v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *a1;
  uint64_t v9 = a1[1];
  v21[0] = *a1;
  v21[1] = v9;
  static String.Encoding.utf8.getter();
  sub_24A10A0E4();
  uint64_t v11 = StringProtocol.cString(using:)();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  if (v11)
  {
    size_t v12 = *(void *)(v11 + 16);
    uint64_t v13 = (char *)swift_slowAlloc();
    sub_24A0FE34C((char *)(v11 + 32), v12, v13);
    swift_bridgeObjectRelease();
  }
  else
  {
    if (qword_26976A058 != -1) {
      swift_once();
    }
    uint64_t v14 = type metadata accessor for Logger();
    sub_24A1058C4(v14, (uint64_t)qword_26976A1B0);
    swift_bridgeObjectRetain_n();
    uint64_t v15 = Logger.logObject.getter();
    os_log_type_t v16 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v15, v16))
    {
      size_t v17 = (uint8_t *)swift_slowAlloc();
      uint64_t v18 = swift_slowAlloc();
      v20[1] = v2;
      v21[0] = v18;
      uint64_t v19 = v18;
      *(_DWORD *)size_t v17 = 136315138;
      swift_bridgeObjectRetain();
      v21[3] = sub_24A10590C(v10, v9, v21);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_24A0F4000, v15, v16, "unable to convert token %s to C string.", v17, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24C5BCA40](v19, -1, -1);
      MEMORY[0x24C5BCA40](v17, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    uint64_t v13 = 0;
  }
  *a2 = v13;
}

void sub_24A0FEE24(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8 = sub_24A0FA334(&qword_26976A2C0);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v87 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    uint64_t v12 = *a1;
    if (a5)
    {
      *(void *)&long long v95 = 0;
      swift_retain();
      static Dictionary._conditionallyBridgeFromObjectiveC(_:result:)();
      uint64_t v13 = v95;
      if ((void)v95)
      {
        if (!*MEMORY[0x263F53568])
        {
          __break(1u);
LABEL_72:
          __break(1u);
          return;
        }
        static String._unconditionallyBridgeFromObjectiveC(_:)();
        sub_24A114C54(v13, &v95);
        swift_bridgeObjectRelease();
        uint64_t v14 = *((void *)&v96 + 1);
        sub_24A10A26C((uint64_t)&v95, &qword_26976A410);
        if (v14)
        {
          static String._unconditionallyBridgeFromObjectiveC(_:)();
          sub_24A114C54(v13, &v93);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (v94)
          {
            sub_24A0FAFF4(&v93, &v95);
            sub_24A10A2C0();
            swift_dynamicCast();
            uint64_t v15 = v92;
            if ([v92 code] == (id)51)
            {
              v91 = v15;
              id v16 = [v15 localizedDescription];
              uint64_t v17 = static String._unconditionallyBridgeFromObjectiveC(_:)();
              unint64_t v19 = v18;

              *(void *)&long long v95 = 44;
              *((void *)&v95 + 1) = 0xE100000000000000;
              MEMORY[0x270FA5388](v20);
              *(&v87 - 2) = (uint64_t)&v95;
              swift_bridgeObjectRetain();
              uint64_t v21 = sub_24A1045F8(0x7FFFFFFFFFFFFFFFLL, 1u, sub_24A10A378, (uint64_t)(&v87 - 4), v17, v19);
              swift_bridgeObjectRelease();
              uint64_t v22 = *(void *)(v21 + 16);
              if (v22)
              {
                uint64_t v89 = v12;
                v90 = v11;
                uint64_t v88 = v9;
                *(void *)&long long v95 = MEMORY[0x263F8EE78];
                sub_24A108E1C();
                uint64_t v23 = v95;
                unint64_t v24 = (uint64_t *)(v21 + 56);
                do
                {
                  uint64_t v25 = *(v24 - 3);
                  uint64_t v26 = *(v24 - 2);
                  uint64_t v28 = *(v24 - 1);
                  uint64_t v27 = *v24;
                  swift_bridgeObjectRetain();
                  uint64_t v29 = MEMORY[0x24C5BC0E0](v25, v26, v28, v27);
                  uint64_t v31 = v30;
                  swift_bridgeObjectRelease();
                  *(void *)&long long v95 = v23;
                  unint64_t v32 = *(void *)(v23 + 16);
                  if (v32 >= *(void *)(v23 + 24) >> 1)
                  {
                    sub_24A108E1C();
                    uint64_t v23 = v95;
                  }
                  *(void *)(v23 + 16) = v32 + 1;
                  uint64_t v33 = v23 + 16 * v32;
                  *(void *)(v33 + 32) = v29;
                  *(void *)(v33 + 40) = v31;
                  v24 += 4;
                  --v22;
                }
                while (v22);
                swift_bridgeObjectRelease();
                uint64_t v9 = v88;
                uint64_t v12 = v89;
                uint64_t v11 = v90;
              }
              else
              {
                swift_bridgeObjectRelease();
                uint64_t v23 = MEMORY[0x263F8EE78];
              }
              uint64_t v54 = v12 + OBJC_IVAR____TtC16CloudAssetDaemon20UploadRequestContext_storageReferenceContinuation;
              swift_beginAccess();
              int v55 = sub_24A0F5F50(v54, 1, v8);
              uint64_t v15 = v91;
              if (v55)
              {
                swift_bridgeObjectRelease();
                goto LABEL_48;
              }
              (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v54, v8);
              uint64_t v56 = type metadata accessor for SimultaneousTransferError();
              sub_24A10A330(&qword_26976A420, MEMORY[0x263F32288]);
              uint64_t v57 = swift_allocError();
              *uint64_t v58 = v23;
              (*(void (**)(void *, void, uint64_t))(*(void *)(v56 - 8) + 104))(v58, *MEMORY[0x263F32280], v56);
              *(void *)&long long v93 = v57;
            }
            else
            {
              id v45 = [v15 underlyingErrors];
              sub_24A0FA334(&qword_26976A248);
              uint64_t v46 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

              uint64_t v47 = *(void *)(v46 + 16);
              if (v47)
              {
                v90 = v11;
                v91 = v15;
                swift_bridgeObjectRetain();
                uint64_t v48 = 0;
                while (1)
                {
                  unint64_t v49 = *(void **)(v46 + 8 * v48 + 32);
                  id v50 = v49;
                  uint64_t v51 = (void *)_convertErrorToNSError(_:)();
                  id v52 = objc_msgSend(v51, sel_code);

                  if (v52 == (id)51) {
                    break;
                  }
                  ++v48;

                  if (v47 == v48)
                  {
                    swift_bridgeObjectRelease();
                    uint64_t v11 = v90;
                    uint64_t v15 = v91;
                    goto LABEL_39;
                  }
                }
                swift_bridgeObjectRelease_n();
                swift_getErrorValue();
                uint64_t v65 = Error.localizedDescription.getter();
                unint64_t v67 = v66;
                *(void *)&long long v95 = 44;
                *((void *)&v95 + 1) = 0xE100000000000000;
                MEMORY[0x270FA5388](v65);
                *(&v87 - 2) = (uint64_t)&v95;
                swift_bridgeObjectRetain();
                uint64_t v68 = sub_24A1045F8(0x7FFFFFFFFFFFFFFFLL, 1u, sub_24A10A378, (uint64_t)(&v87 - 4), v65, v67);
                swift_bridgeObjectRelease();
                uint64_t v69 = *(void *)(v68 + 16);
                if (v69)
                {
                  uint64_t v88 = v9;
                  uint64_t v89 = v12;
                  *(void *)&long long v95 = MEMORY[0x263F8EE78];
                  sub_24A108E1C();
                  uint64_t v70 = v95;
                  uint64_t v87 = v68;
                  v71 = (uint64_t *)(v68 + 56);
                  do
                  {
                    uint64_t v72 = *(v71 - 3);
                    uint64_t v73 = *(v71 - 2);
                    uint64_t v75 = *(v71 - 1);
                    uint64_t v74 = *v71;
                    swift_bridgeObjectRetain();
                    uint64_t v76 = MEMORY[0x24C5BC0E0](v72, v73, v75, v74);
                    uint64_t v78 = v77;
                    swift_bridgeObjectRelease();
                    *(void *)&long long v95 = v70;
                    unint64_t v79 = *(void *)(v70 + 16);
                    if (v79 >= *(void *)(v70 + 24) >> 1)
                    {
                      sub_24A108E1C();
                      uint64_t v70 = v95;
                    }
                    *(void *)(v70 + 16) = v79 + 1;
                    uint64_t v80 = v70 + 16 * v79;
                    *(void *)(v80 + 32) = v76;
                    *(void *)(v80 + 40) = v78;
                    v71 += 4;
                    --v69;
                  }
                  while (v69);
                  swift_bridgeObjectRelease();
                  uint64_t v9 = v88;
                  uint64_t v12 = v89;
                }
                else
                {
                  swift_bridgeObjectRelease();
                  uint64_t v70 = MEMORY[0x263F8EE78];
                }
                uint64_t v81 = v12 + OBJC_IVAR____TtC16CloudAssetDaemon20UploadRequestContext_storageReferenceContinuation;
                swift_beginAccess();
                int v82 = sub_24A0F5F50(v81, 1, v8);
                v83 = v90;
                if (v82)
                {
                  swift_bridgeObjectRelease();
                }
                else
                {
                  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v90, v81, v8);
                  uint64_t v84 = type metadata accessor for SimultaneousTransferError();
                  sub_24A10A330(&qword_26976A420, MEMORY[0x263F32288]);
                  uint64_t v85 = swift_allocError();
                  void *v86 = v70;
                  (*(void (**)(void *, void, uint64_t))(*(void *)(v84 - 8) + 104))(v86, *MEMORY[0x263F32280], v84);
                  *(void *)&long long v93 = v85;
                  CheckedContinuation.resume(throwing:)();
                  (*(void (**)(char *, uint64_t))(v9 + 8))(v83, v8);
                }
                sub_24A1164B0();

                uint64_t v15 = v91;
                goto LABEL_49;
              }
LABEL_39:
              swift_bridgeObjectRelease();
              uint64_t v53 = v12 + OBJC_IVAR____TtC16CloudAssetDaemon20UploadRequestContext_storageReferenceContinuation;
              swift_beginAccess();
              if (sub_24A0F5F50(v53, 1, v8))
              {
LABEL_48:
                sub_24A1164B0();
LABEL_49:
                if (qword_26976A058 != -1) {
                  swift_once();
                }
                uint64_t v59 = type metadata accessor for Logger();
                sub_24A1058C4(v59, (uint64_t)qword_26976A1B0);
                v60 = v15;
                uint64_t v38 = Logger.logObject.getter();
                os_log_type_t v61 = static os_log_type_t.error.getter();
                if (os_log_type_enabled(v38, v61))
                {
                  v62 = (uint8_t *)swift_slowAlloc();
                  v63 = (void *)swift_slowAlloc();
                  *(_DWORD *)v62 = 138412290;
                  *(void *)&long long v93 = v60;
                  v64 = v60;
                  UnsafeMutableRawBufferPointer.copyMemory(from:)();
                  void *v63 = v60;

                  _os_log_impl(&dword_24A0F4000, v38, v61, "mmcs engine returns error %@", v62, 0xCu);
                  sub_24A0FA334(&qword_26976A250);
                  swift_arrayDestroy();
                  MEMORY[0x24C5BCA40](v63, -1, -1);
                  MEMORY[0x24C5BCA40](v62, -1, -1);

                  goto LABEL_53;
                }

LABEL_55:
                swift_release();
                return;
              }
              (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v53, v8);
              sub_24A104500();
              *(void *)&long long v93 = swift_allocError();
            }
            CheckedContinuation.resume(throwing:)();
            (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
            goto LABEL_48;
          }
          goto LABEL_72;
        }
        sub_24A114C54(v13, &v95);
        if (*((void *)&v96 + 1))
        {
          if ((swift_dynamicCast() & 1) == 0)
          {
            swift_release();
            swift_bridgeObjectRelease();
            return;
          }
          long long v42 = v93;
          sub_24A114C54(v13, &v95);
          swift_bridgeObjectRelease();
          if (*((void *)&v96 + 1))
          {
            if (swift_dynamicCast())
            {
              long long v43 = v93;
              uint64_t v44 = v12 + OBJC_IVAR____TtC16CloudAssetDaemon20UploadRequestContext_storageReferenceContinuation;
              swift_beginAccess();
              if (!sub_24A0F5F50(v44, 1, v8))
              {
                (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v44, v8);
                long long v95 = v42;
                long long v96 = v43;
                sub_24A109F34(v42, *((unint64_t *)&v42 + 1));
                sub_24A109F34(v43, *((unint64_t *)&v43 + 1));
                CheckedContinuation.resume(returning:)();
                (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
              }
              sub_24A1164B0();
              swift_release();
              sub_24A0FA8D8(v43, *((unint64_t *)&v43 + 1));
            }
            else
            {
              swift_release();
            }
            sub_24A0FA8D8(v42, *((unint64_t *)&v42 + 1));
            return;
          }
          swift_release();
          sub_24A0FA8D8(v42, *((unint64_t *)&v42 + 1));
        }
        else
        {
          swift_release();
          swift_bridgeObjectRelease();
        }
        sub_24A10A26C((uint64_t)&v95, &qword_26976A410);
        return;
      }
    }
    else
    {
      swift_retain();
    }
    sub_24A104500();
    *(void *)&long long v95 = swift_allocError();
    sub_24A0FA334(&qword_26976A2B0);
    AsyncThrowingStream.Continuation.finish(throwing:)();
    if (qword_26976A058 != -1) {
      swift_once();
    }
    uint64_t v37 = type metadata accessor for Logger();
    sub_24A1058C4(v37, (uint64_t)qword_26976A1B0);
    uint64_t v38 = Logger.logObject.getter();
    os_log_type_t v39 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v38, v39))
    {
      uint64_t v40 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v40 = 0;
      _os_log_impl(&dword_24A0F4000, v38, v39, "mmcs engine returns nil results", v40, 2u);
      MEMORY[0x24C5BCA40](v40, -1, -1);
LABEL_53:
      swift_release();

      return;
    }

    goto LABEL_55;
  }
  if (qword_26976A058 != -1) {
    swift_once();
  }
  uint64_t v34 = type metadata accessor for Logger();
  sub_24A1058C4(v34, (uint64_t)qword_26976A1B0);
  v91 = Logger.logObject.getter();
  os_log_type_t v35 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v91, v35))
  {
    uint64_t v36 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v36 = 134349056;
    *(void *)&long long v95 = a2;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl(&dword_24A0F4000, v91, v35, "context for uploading asset with tracking number %{public}llu can not be loaded", v36, 0xCu);
    MEMORY[0x24C5BCA40](v36, -1, -1);
  }
  else
  {
    uint64_t v41 = v91;
  }
}

void sub_24A0FFC28(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v10 = a5;
  sub_24A0FEE24(a1, a2, a3, a4, (uint64_t)a5);
}

void sub_24A0FFCB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = sub_24A0FA334(&qword_26976A408);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  id v10 = (char *)&v75 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    if (a4)
    {
      *(void *)&long long v80 = 0;
      swift_retain();
      static Dictionary._conditionallyBridgeFromObjectiveC(_:result:)();
      uint64_t v11 = v80;
      if ((void)v80)
      {
        if (*MEMORY[0x263F53568])
        {
          static String._unconditionallyBridgeFromObjectiveC(_:)();
          sub_24A114C54(v11, &v80);
          swift_bridgeObjectRelease();
          if (v81)
          {
            sub_24A10A26C((uint64_t)&v80, &qword_26976A410);
            static String._unconditionallyBridgeFromObjectiveC(_:)();
            sub_24A114C54(v11, &v78);
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            if (v79)
            {
              sub_24A0FAFF4(&v78, &v80);
              sub_24A10A2C0();
              swift_dynamicCast();
              uint64_t v12 = v77;
              if ([v77 code] == (id)51)
              {
                id v13 = [v12 localizedDescription];
                uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)();
                unint64_t v16 = v15;

                *(void *)&long long v80 = 44;
                *((void *)&v80 + 1) = 0xE100000000000000;
                MEMORY[0x270FA5388](v17);
                *(&v75 - 2) = (uint64_t)&v80;
                swift_bridgeObjectRetain();
                uint64_t v18 = sub_24A1045F8(0x7FFFFFFFFFFFFFFFLL, 1u, sub_24A10A378, (uint64_t)(&v75 - 4), v14, v16);
                swift_bridgeObjectRelease();
                uint64_t v19 = *(void *)(v18 + 16);
                if (v19)
                {
                  uint64_t v76 = v12;
                  *(void *)&long long v80 = MEMORY[0x263F8EE78];
                  sub_24A108E1C();
                  uint64_t v20 = v80;
                  uint64_t v21 = (uint64_t *)(v18 + 56);
                  do
                  {
                    uint64_t v22 = *(v21 - 3);
                    uint64_t v23 = *(v21 - 2);
                    uint64_t v24 = *(v21 - 1);
                    uint64_t v25 = *v21;
                    swift_bridgeObjectRetain();
                    uint64_t v26 = MEMORY[0x24C5BC0E0](v22, v23, v24, v25);
                    uint64_t v28 = v27;
                    swift_bridgeObjectRelease();
                    *(void *)&long long v80 = v20;
                    unint64_t v29 = *(void *)(v20 + 16);
                    if (v29 >= *(void *)(v20 + 24) >> 1)
                    {
                      sub_24A108E1C();
                      uint64_t v20 = v80;
                    }
                    *(void *)(v20 + 16) = v29 + 1;
                    uint64_t v30 = v20 + 16 * v29;
                    *(void *)(v30 + 32) = v26;
                    *(void *)(v30 + 40) = v28;
                    v21 += 4;
                    --v19;
                  }
                  while (v19);
                  swift_bridgeObjectRelease();
                  uint64_t v12 = v76;
                }
                else
                {
                  swift_bridgeObjectRelease();
                  uint64_t v20 = MEMORY[0x263F8EE78];
                }
                uint64_t v47 = type metadata accessor for SimultaneousTransferError();
                sub_24A10A330(&qword_26976A420, MEMORY[0x263F32288]);
                uint64_t v48 = swift_allocError();
                *unint64_t v49 = v20;
                (*(void (**)(void *, void, uint64_t))(*(void *)(v47 - 8) + 104))(v49, *MEMORY[0x263F32280], v47);
                *(void *)&long long v80 = v48;
              }
              else
              {
                id v39 = [v12 underlyingErrors];
                sub_24A0FA334(&qword_26976A248);
                uint64_t v40 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

                uint64_t v41 = *(void *)(v40 + 16);
                if (v41)
                {
                  swift_bridgeObjectRetain();
                  uint64_t v42 = 0;
                  while (1)
                  {
                    long long v43 = *(void **)(v40 + 8 * v42 + 32);
                    id v44 = v43;
                    id v45 = (void *)_convertErrorToNSError(_:)();
                    id v46 = objc_msgSend(v45, sel_code);

                    if (v46 == (id)51) {
                      break;
                    }
                    ++v42;

                    if (v41 == v42)
                    {
                      swift_bridgeObjectRelease();
                      goto LABEL_34;
                    }
                  }
                  uint64_t v76 = v12;
                  swift_bridgeObjectRelease_n();
                  swift_getErrorValue();
                  uint64_t v56 = Error.localizedDescription.getter();
                  unint64_t v58 = v57;
                  *(void *)&long long v80 = 44;
                  *((void *)&v80 + 1) = 0xE100000000000000;
                  MEMORY[0x270FA5388](v56);
                  *(&v75 - 2) = (uint64_t)&v80;
                  swift_bridgeObjectRetain();
                  uint64_t v59 = sub_24A1045F8(0x7FFFFFFFFFFFFFFFLL, 1u, sub_24A10A300, (uint64_t)(&v75 - 4), v56, v58);
                  swift_bridgeObjectRelease();
                  uint64_t v60 = *(void *)(v59 + 16);
                  if (v60)
                  {
                    *(void *)&long long v80 = MEMORY[0x263F8EE78];
                    sub_24A108E1C();
                    uint64_t v61 = v80;
                    uint64_t v75 = v59;
                    v62 = (uint64_t *)(v59 + 56);
                    do
                    {
                      uint64_t v63 = *(v62 - 3);
                      uint64_t v64 = *(v62 - 2);
                      uint64_t v65 = *(v62 - 1);
                      uint64_t v66 = *v62;
                      swift_bridgeObjectRetain();
                      uint64_t v67 = MEMORY[0x24C5BC0E0](v63, v64, v65, v66);
                      uint64_t v69 = v68;
                      swift_bridgeObjectRelease();
                      *(void *)&long long v80 = v61;
                      unint64_t v70 = *(void *)(v61 + 16);
                      if (v70 >= *(void *)(v61 + 24) >> 1)
                      {
                        sub_24A108E1C();
                        uint64_t v61 = v80;
                      }
                      *(void *)(v61 + 16) = v70 + 1;
                      uint64_t v71 = v61 + 16 * v70;
                      *(void *)(v71 + 32) = v67;
                      *(void *)(v71 + 40) = v69;
                      v62 += 4;
                      --v60;
                    }
                    while (v60);
                    swift_bridgeObjectRelease();
                  }
                  else
                  {
                    swift_bridgeObjectRelease();
                    uint64_t v61 = MEMORY[0x263F8EE78];
                  }
                  uint64_t v72 = type metadata accessor for SimultaneousTransferError();
                  sub_24A10A330(&qword_26976A420, MEMORY[0x263F32288]);
                  uint64_t v73 = swift_allocError();
                  *uint64_t v74 = v61;
                  (*(void (**)(void *, void, uint64_t))(*(void *)(v72 - 8) + 104))(v74, *MEMORY[0x263F32280], v72);
                  *(void *)&long long v80 = v73;
                  sub_24A0FA334(&qword_26976A2B0);
                  AsyncThrowingStream.Continuation.finish(throwing:)();

                  uint64_t v12 = v76;
                  goto LABEL_38;
                }
LABEL_34:
                swift_bridgeObjectRelease();
                sub_24A104500();
                *(void *)&long long v80 = swift_allocError();
              }
              sub_24A0FA334(&qword_26976A2B0);
              AsyncThrowingStream.Continuation.finish(throwing:)();
LABEL_38:
              if (qword_26976A058 != -1) {
                swift_once();
              }
              uint64_t v50 = type metadata accessor for Logger();
              sub_24A1058C4(v50, (uint64_t)qword_26976A1B0);
              uint64_t v51 = v12;
              os_log_type_t v35 = Logger.logObject.getter();
              os_log_type_t v52 = static os_log_type_t.error.getter();
              if (os_log_type_enabled(v35, v52))
              {
                uint64_t v53 = (uint8_t *)swift_slowAlloc();
                uint64_t v54 = (void *)swift_slowAlloc();
                *(_DWORD *)uint64_t v53 = 138412290;
                *(void *)&long long v80 = v51;
                int v55 = v51;
                UnsafeMutableRawBufferPointer.copyMemory(from:)();
                *uint64_t v54 = v51;

                _os_log_impl(&dword_24A0F4000, v35, v52, "mmcs engine returns error %@", v53, 0xCu);
                sub_24A0FA334(&qword_26976A250);
                swift_arrayDestroy();
                MEMORY[0x24C5BCA40](v54, -1, -1);
                MEMORY[0x24C5BCA40](v53, -1, -1);

                goto LABEL_42;
              }

LABEL_44:
              swift_release();
              return;
            }
            goto LABEL_55;
          }
          swift_bridgeObjectRelease();
          sub_24A10A26C((uint64_t)&v80, &qword_26976A410);
          if ((a2 & 0x8000000000000000) == 0)
          {
            *(void *)&long long v80 = a2;
            sub_24A0FA334(&qword_26976A2B0);
            AsyncThrowingStream.Continuation.yield(_:)();
            swift_release();
            (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
            return;
          }
          __break(1u);
        }
        __break(1u);
LABEL_55:
        __break(1u);
        return;
      }
    }
    else
    {
      swift_retain();
    }
    sub_24A104500();
    *(void *)&long long v80 = swift_allocError();
    sub_24A0FA334(&qword_26976A2B0);
    AsyncThrowingStream.Continuation.finish(throwing:)();
    if (qword_26976A058 != -1) {
      swift_once();
    }
    uint64_t v34 = type metadata accessor for Logger();
    sub_24A1058C4(v34, (uint64_t)qword_26976A1B0);
    os_log_type_t v35 = Logger.logObject.getter();
    os_log_type_t v36 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v35, v36))
    {
      uint64_t v37 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v37 = 0;
      _os_log_impl(&dword_24A0F4000, v35, v36, "mmcs engine returns nil results", v37, 2u);
      MEMORY[0x24C5BCA40](v37, -1, -1);
LABEL_42:
      swift_release();

      return;
    }

    goto LABEL_44;
  }
  if (qword_26976A058 != -1) {
    swift_once();
  }
  uint64_t v31 = type metadata accessor for Logger();
  sub_24A1058C4(v31, (uint64_t)qword_26976A1B0);
  uint64_t v76 = Logger.logObject.getter();
  os_log_type_t v32 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v76, v32))
  {
    uint64_t v33 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v33 = 134349056;
    *(void *)&long long v80 = a2;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl(&dword_24A0F4000, v76, v32, "context for uploading asset with tracking number %{public}llu can not be loaded", v33, 0xCu);
    MEMORY[0x24C5BCA40](v33, -1, -1);
  }
  else
  {
    uint64_t v38 = v76;
  }
}

void sub_24A100814(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  sub_24A10A968();
  id v8 = a4;
  sub_24A0FFCB4(v5, v4, a3, (uint64_t)a4);
}

uint64_t sub_24A10087C@<X0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t result = sub_24A109EB4(a1);
  if (v6) {
    goto LABEL_8;
  }
  if (*(_DWORD *)(a1 + 36) != v5)
  {
    __break(1u);
LABEL_8:
    __break(1u);
    return result;
  }
  if (result == 1 << *(unsigned char *)(a1 + 32))
  {
    a2[1] = 0u;
    a2[2] = 0u;
    *a2 = 0u;
  }
  else
  {
    uint64_t v7 = sub_24A109A3C((uint64_t)v8, result, v5, 0, a1);
    *(void *)a2 = v7;
    sub_24A10A148((uint64_t)v8, (uint64_t)a2 + 8);
    return sub_24A10A26C((uint64_t)&v7, &qword_26976A368);
  }
  return result;
}

uint64_t sub_24A10093C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[19] = a3;
  v4[20] = v3;
  v4[17] = a1;
  v4[18] = a2;
  v4[21] = *v3;
  sub_24A0FA334(&qword_26976A288);
  v4[22] = swift_task_alloc();
  v4[23] = swift_task_alloc();
  sub_24A0FA334(&qword_26976A290);
  v4[24] = swift_task_alloc();
  uint64_t v5 = type metadata accessor for Credential();
  v4[25] = v5;
  v4[26] = *(void *)(v5 - 8);
  v4[27] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24A100A98, 0, 0);
}

void sub_24A100A98()
{
  *(void *)(v0 + 224) = *(void *)(*(void *)(*(void *)(*(void *)(v0 + 160) + 16) + 24)
                                    + OBJC_IVAR____TtC16CloudAssetDaemon13TenantContext_requestTracker);
  swift_retain();
  uint64_t v1 = swift_bridgeObjectRetain();
  uint64_t v2 = sub_24A109968(v1);
  swift_bridgeObjectRelease();
  unint64_t v3 = v2[2];
  if (v3)
  {
    uint64_t v41 = MEMORY[0x263F8EE78];
    sub_24A108F0C();
    unint64_t v4 = v2[4];
    if ((v4 & 0x8000000000000000) != 0)
    {
LABEL_30:
      sub_24A10A39C();
      sub_24A10A6EC();
      _assertionFailure(_:_:file:line:flags:)();
      sub_24A10A488();
      return;
    }
    uint64_t v5 = v41;
    unint64_t v6 = *(void *)(v41 + 16);
    unint64_t v7 = v6 + 1;
    if (v6 >= *(void *)(v41 + 24) >> 1) {
      goto LABEL_32;
    }
    while (1)
    {
      *(void *)(v5 + 16) = v7;
      *(void *)(v5 + 8 * v6 + 32) = v4;
      unint64_t v4 = v3 - 1;
      if (v3 == 1) {
        break;
      }
      uint64_t v21 = 0;
      v6 += 5;
      while (v21 + 1 < v3)
      {
        uint64_t v22 = v2[v21 + 5];
        if (v22 < 0) {
          goto LABEL_30;
        }
        uint64_t v41 = v5;
        unint64_t v7 = v6 - 3;
        if (v6 - 4 >= *(void *)(v5 + 24) >> 1) {
          sub_24A10A834();
        }
        *(void *)(v5 + 16) = v7;
        *(void *)(v5 + 8 * v6++) = v22;
        if (v4 == ++v21) {
          goto LABEL_5;
        }
      }
      __break(1u);
LABEL_32:
      sub_24A10A834();
      uint64_t v5 = v41;
    }
LABEL_5:
    swift_release();
  }
  else
  {
    swift_release();
    uint64_t v5 = MEMORY[0x263F8EE78];
  }
  *(void *)(v0 + 104) = v5;
  swift_retain();
  uint64_t v8 = swift_bridgeObjectRetain();
  uint64_t v9 = sub_24A0FCFFC(v8);
  swift_bridgeObjectRelease();
  uint64_t v10 = sub_24A0FDB04(v9, (uint64_t)&qword_26976A370, (void (*)(uint64_t, uint64_t, uint64_t *))sub_24A1086D0);
  *(void *)(v0 + 232) = v10;
  uint64_t v11 = swift_bridgeObjectRetain();
  sub_24A10087C(v11, (_OWORD *)(v0 + 16));
  swift_bridgeObjectRelease();
  uint64_t v12 = *(void *)(v0 + 48);
  uint64_t v14 = *(void *)(v0 + 192);
  uint64_t v13 = *(void *)(v0 + 200);
  if (!v12)
  {
    sub_24A10A26C(v0 + 16, &qword_26976A298);
    sub_24A0F600C(v14, 1, 1, v13);
LABEL_18:
    uint64_t v23 = *(void *)(v0 + 192);
    swift_bridgeObjectRelease();
    sub_24A10A26C(v23, &qword_26976A290);
    sub_24A104500();
    swift_allocError();
    swift_willThrow();
    swift_release();
    sub_24A10AA70();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    sub_24A0FB1D0();
    sub_24A10A488();
    __asm { BRAA            X1, X16 }
  }
  sub_24A109F8C((void *)(v0 + 24), v12);
  dispatch thunk of AssetRequest.credential.getter();
  sub_24A0F600C(v14, 0, 1, v13);
  sub_24A0FAFA4(v0 + 24);
  if (sub_24A0F5F50(v14, 1, v13) == 1) {
    goto LABEL_18;
  }
  uint64_t v15 = *(void *)(v0 + 144);
  (*(void (**)(void, void, void))(*(void *)(v0 + 208) + 32))(*(void *)(v0 + 216), *(void *)(v0 + 192), *(void *)(v0 + 200));
  uint64_t v16 = *(void *)(v0 + 104);
  swift_bridgeObjectRetain();
  uint64_t v17 = swift_bridgeObjectRetain();
  unint64_t v18 = sub_24A0FD140(v17, v15);
  swift_bridgeObjectRelease();
  uint64_t v19 = sub_24A0FDBE4(v18);
  swift_bridgeObjectRelease();
  *(void *)(v0 + 96) = v19;
  swift_retain();
  uint64_t v20 = swift_bridgeObjectRetain();
  uint64_t v26 = sub_24A0FD350(v20);
  uint64_t v27 = v0 + 96;
  swift_bridgeObjectRelease();
  uint64_t v28 = sub_24A0FEA58(v26);
  swift_bridgeObjectRelease();
  *(void *)(v0 + 112) = v28;
  int64_t v29 = *(void *)(v16 + 16);
  uint64_t v30 = MEMORY[0x263F8EE78];
  if (v29)
  {
    uint64_t v42 = MEMORY[0x263F8EE78];
    swift_bridgeObjectRetain();
    sub_24A108E6C(0, v29, 0);
    uint64_t v30 = v42;
    unint64_t v31 = *(void *)(v42 + 16);
    do
    {
      unint64_t v32 = *(void *)(v42 + 24);
      if (v31 >= v32 >> 1) {
        sub_24A108E6C((char *)(v32 > 1), v31 + 1, 1);
      }
      *(void *)(v42 + 16) = v31 + 1;
      *(_DWORD *)(v42 + 4 * v31++ + 32) = 1;
      --v29;
    }
    while (v29);
    swift_bridgeObjectRelease();
    uint64_t v27 = v0 + 96;
  }
  uint64_t v33 = *(void *)(v0 + 216);
  uint64_t v34 = *(void *)(v0 + 184);
  uint64_t v35 = *(void *)(v0 + 144);
  *(void *)(v0 + 120) = v30;
  uint64_t v36 = sub_24A0FA334(&qword_26976A238);
  *(void *)(v0 + 240) = v36;
  int8x16_t v40 = *(int8x16_t *)(v0 + 152);
  sub_24A0F600C(v34, 1, 1, v36);
  uint64_t v37 = (int8x16_t *)swift_task_alloc();
  *(void *)(v0 + 248) = v37;
  v37[1].i64[0] = v34;
  v37[1].i64[1] = v10;
  v37[2].i64[0] = v27;
  v37[2].i64[1] = v0 + 112;
  v37[3] = vextq_s8(v40, v40, 8uLL);
  v37[4].i64[0] = v33;
  v37[4].i64[1] = v35;
  v37[5].i64[0] = v0 + 104;
  v37[5].i64[1] = v0 + 120;
  uint64_t v38 = (void *)swift_task_alloc();
  *(void *)(v0 + 256) = v38;
  sub_24A0FA334(&qword_26976A2A0);
  *uint64_t v38 = v0;
  v38[1] = sub_24A1010E4;
  sub_24A0FB244();
  sub_24A10A488();
  MEMORY[0x270FA2360]();
}

uint64_t sub_24A1010E4()
{
  sub_24A0FB2D0();
  sub_24A0FB128();
  *unint64_t v3 = v2;
  *unint64_t v3 = *v1;
  *(void *)(v2 + 264) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  sub_24A0FB244();
  return MEMORY[0x270FA2498](v4, v5, v6);
}

uint64_t sub_24A101228()
{
  uint64_t v1 = v0[30];
  uint64_t v2 = v0[22];
  uint64_t v14 = v0[9];
  uint64_t v15 = v0[8];
  uint64_t v3 = v0[11];
  uint64_t v13 = v0[10];
  sub_24A10A1AC(v0[23], v2, &qword_26976A288);
  uint64_t result = sub_24A0F5F50(v2, 1, v1);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    uint64_t v5 = v0[30];
    uint64_t v6 = v0[27];
    uint64_t v8 = v0[25];
    uint64_t v7 = v0[26];
    uint64_t v9 = v0[23];
    uint64_t v10 = v0[22];
    uint64_t v11 = v0[17];
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(v11, v10, v5);
    sub_24A10A26C(v9, &qword_26976A288);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v12 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))v0[1];
    return v12(v15, v14, v13, v3);
  }
  return result;
}

uint64_t sub_24A1013B4()
{
  uint64_t v1 = v0[27];
  uint64_t v2 = v0[25];
  uint64_t v3 = v0[26];
  uint64_t v4 = v0[23];
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  sub_24A10A26C(v4, &qword_26976A288);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_24A10AA70();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_24A0FB1D0();
  return v5();
}

uint64_t sub_24A101490(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, long long a9, uint64_t a10)
{
  uint64_t v25 = a7;
  uint64_t v26 = a8;
  uint64_t v27 = a2;
  long long v24 = a9;
  uint64_t v15 = sub_24A0FA334(&qword_26976A2A8);
  uint64_t v16 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15);
  unint64_t v18 = (char *)&v24 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_24A0FA334(&qword_26976A288);
  MEMORY[0x270FA5388](v19 - 8);
  uint64_t v21 = (char *)&v24 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = a3;
  uint64_t v29 = a1;
  uint64_t v30 = a4;
  uint64_t v31 = a5;
  uint64_t v32 = a6;
  uint64_t v33 = v25;
  uint64_t v34 = v26;
  long long v35 = v24;
  uint64_t v36 = a10;
  (*(void (**)(char *, void, uint64_t))(v16 + 104))(v18, *MEMORY[0x263F8F680], v15);
  AsyncThrowingStream.init<>(_:bufferingPolicy:_:)();
  uint64_t v22 = sub_24A0FA334(&qword_26976A238);
  sub_24A0F600C((uint64_t)v21, 0, 1, v22);
  return sub_24A10A018((uint64_t)v21, v27);
}

uint64_t sub_24A101664(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5, NSURL *a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v36 = a7;
  uint64_t v37 = a8;
  reserved = a6;
  uint64_t v38 = a5;
  uint64_t v39 = a11;
  uint64_t v40 = a10;
  uint64_t v14 = sub_24A0FA334(&qword_26976A2B0);
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)v34 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_24A0FA334(&qword_26976A2B8);
  MEMORY[0x270FA5388](v18 - 8);
  uint64_t v20 = (char *)v34 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_24A0FA334(&qword_26976A2C0);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v21 - 8) + 16))(v20, a3, v21);
  sub_24A0F600C((uint64_t)v20, 0, 1, v21);
  uint64_t v22 = *(void (**)(char *, uint64_t, uint64_t))(v15 + 16);
  v34[1] = v14;
  v34[2] = a1;
  v22(v17, a1, v14);
  type metadata accessor for UploadRequestContext();
  swift_allocObject();
  uint64_t v23 = swift_bridgeObjectRetain();
  uint64_t v24 = sub_24A116570(v23, (uint64_t)v20, (uint64_t)v17);
  reserved = (NSURL *)reserved->_baseURL->_reserved;
  URL._bridgeToObjectiveC()(reserved);
  uint64_t v26 = v25;
  uint64_t v27 = Credential.requestorID.getter();
  uint64_t v28 = (void *)MEMORY[0x24C5BC080](v27);
  swift_bridgeObjectRelease();
  uint64_t v37 = v24;
  type metadata accessor for Uploader.OptionsBuilder();
  uint64_t inited = swift_initStackObject();
  *(void *)(inited + 16) = a9;
  *(unsigned char *)(inited + 24) = 1;
  sub_24A0FD8AC();
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24A10454C();
  uint64_t v40 = a4;
  swift_bridgeObjectRetain();
  uint64_t v31 = v38;
  sub_24A10454C();
  int v32 = MMCSPutItems();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!v32)
  {
    sub_24A104500();
    uint64_t v41 = swift_allocError();
    AsyncThrowingStream.Continuation.finish(throwing:)();
  }
  sub_24A1019D8(v40, v31);
  return swift_release();
}

uint64_t sub_24A1019D8(uint64_t result, uint64_t *a2)
{
  uint64_t v3 = *(void *)result;
  uint64_t v4 = *(void *)(*(void *)result + 16);
  if (v4)
  {
    swift_bridgeObjectRetain();
    for (uint64_t i = 0; i != v4; ++i)
    {
      uint64_t v6 = *(void *)(v3 + 8 * i + 32);
      if (v6) {
        MEMORY[0x24C5BCA40](v6, -1, -1);
      }
    }
    uint64_t result = swift_bridgeObjectRelease();
  }
  uint64_t v7 = *a2;
  uint64_t v8 = *(void *)(v7 + 16);
  if (v8)
  {
    swift_bridgeObjectRetain();
    for (uint64_t j = 0; j != v8; ++j)
    {
      uint64_t v10 = *(void *)(v7 + 8 * j + 32);
      if (v10) {
        MEMORY[0x24C5BCA40](v10, -1, -1);
      }
    }
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_24A101AA4(uint64_t a1, uint64_t a2)
{
  v3[7] = a2;
  v3[8] = v2;
  v3[6] = a1;
  v3[9] = *v2;
  uint64_t v4 = sub_24A0FA334(&qword_26976A1E0);
  v3[10] = v4;
  v3[11] = *(void *)(v4 - 8);
  v3[12] = swift_task_alloc();
  uint64_t v5 = type metadata accessor for Credential();
  v3[13] = v5;
  v3[14] = *(void *)(v5 - 8);
  v3[15] = swift_task_alloc();
  uint64_t v6 = type metadata accessor for URL();
  v3[16] = v6;
  v3[17] = *(void *)(v6 - 8);
  v3[18] = swift_task_alloc();
  uint64_t v7 = type metadata accessor for TaskPriority();
  v3[19] = v7;
  v3[20] = *(void *)(v7 - 8);
  v3[21] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24A101CA8, 0, 0);
}

void sub_24A101CA8(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, os_log_type_t type, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,void *a25,uint64_t a26,uint64_t a27)
{
  sub_24A0FB188();
  a26 = v28;
  a27 = v29;
  sub_24A0FB34C();
  a25 = v27;
  if (qword_26976A058 != -1) {
    swift_once();
  }
  uint64_t v30 = type metadata accessor for Logger();
  v27[22] = sub_24A1058C4(v30, (uint64_t)qword_26976A1B0);
  swift_bridgeObjectRetain_n();
  uint64_t v31 = Logger.logObject.getter();
  os_log_type_t v32 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v31, v32))
  {
    os_log_type_t typea = v32;
    uint64_t v34 = v27[20];
    uint64_t v33 = v27[21];
    uint64_t v54 = v27[19];
    uint64_t v35 = swift_slowAlloc();
    a16 = swift_slowAlloc();
    *(_DWORD *)uint64_t v35 = 136315394;
    uint64_t v36 = type metadata accessor for AssetUploadRequest();
    uint64_t v37 = swift_bridgeObjectRetain();
    uint64_t v38 = MEMORY[0x24C5BC170](v37, v36);
    uint64_t v40 = v39;
    swift_bridgeObjectRelease();
    v27[4] = sub_24A10590C(v38, v40, &a16);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v35 + 12) = 2080;
    static Task<>.currentPriority.getter();
    sub_24A10A330(&qword_26976A1E8, MEMORY[0x263F8F520]);
    uint64_t v41 = dispatch thunk of CustomStringConvertible.description.getter();
    uint64_t v43 = v42;
    (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v33, v54);
    v27[5] = sub_24A10590C(v41, v43, &a16);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24A0F4000, v31, typea, "processing stream %s with priority %s", (uint8_t *)v35, 0x16u);
    swift_arrayDestroy();
    sub_24A10A3DC();
    sub_24A10A3DC();
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  if (*(void *)(v27[7] + 16))
  {
    uint64_t v44 = type metadata accessor for AssetUploadRequest();
    sub_24A10AB7C();
    AssetUploadRequest.storageLocation.getter();
    AssetUploadRequest.credential.getter();
    swift_bridgeObjectRetain_n();
    id v45 = Logger.logObject.getter();
    os_log_type_t v46 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v45, v46))
    {
      uint64_t v47 = (uint8_t *)swift_slowAlloc();
      a16 = sub_24A10A8B0();
      *(_DWORD *)uint64_t v47 = 136315138;
      uint64_t v48 = swift_bridgeObjectRetain();
      uint64_t v49 = MEMORY[0x24C5BC170](v48, v44);
      uint64_t v51 = v50;
      swift_bridgeObjectRelease();
      v27[3] = sub_24A10590C(v49, v51, &a16);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_24A0F4000, v45, v46, "start registering assets with requests %s", v47, 0xCu);
      sub_24A10A870();
      sub_24A10A3DC();
      sub_24A10A3DC();
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    os_log_type_t v52 = (void *)swift_task_alloc();
    v27[23] = v52;
    *os_log_type_t v52 = v27;
    v52[1] = sub_24A102124;
    sub_24A0FB0CC();
    sub_24A11775C();
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_24A102124()
{
  sub_24A0FB204();
  sub_24A0FB00C();
  sub_24A0FB128();
  *uint64_t v3 = v2;
  *uint64_t v3 = *v1;
  *(void *)(v2 + 192) = v4;
  *(void *)(v2 + 200) = v0;
  swift_task_dealloc();
  sub_24A0FB244();
  return MEMORY[0x270FA2498](v5, v6, v7);
}

uint64_t sub_24A102208(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *a24,uint64_t a25,uint64_t a26)
{
  sub_24A0FB188();
  a25 = v27;
  a26 = v28;
  sub_24A0FB34C();
  a24 = v26;
  swift_bridgeObjectRetain_n();
  uint64_t v29 = Logger.logObject.getter();
  os_log_type_t v30 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v29, v30))
  {
    uint64_t v31 = (uint8_t *)swift_slowAlloc();
    a15 = sub_24A10A8B0();
    *(_DWORD *)uint64_t v31 = 136315138;
    type metadata accessor for Asset();
    swift_bridgeObjectRetain();
    uint64_t v32 = Dictionary.description.getter();
    uint64_t v34 = v33;
    swift_bridgeObjectRelease();
    void v26[2] = sub_24A10590C(v32, v34, &a15);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_24A0F4000, v29, v30, "start transfer assets %s", v31, 0xCu);
    swift_arrayDestroy();
    sub_24A10A3DC();
    sub_24A10A3DC();
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  uint64_t v35 = v26[24];
  uint64_t v36 = v26[18];
  uint64_t v37 = v26[15];
  uint64_t v57 = v26[16];
  uint64_t v58 = v26[21];
  uint64_t v38 = v26[14];
  uint64_t v39 = v26[11];
  uint64_t v40 = v26[9];
  uint64_t v53 = v26[12];
  uint64_t v54 = v26[10];
  uint64_t v41 = v26[8];
  uint64_t v55 = v26[6];
  uint64_t v56 = v26[13];
  uint64_t v42 = (void *)swift_task_alloc();
  v42[2] = v41;
  v42[3] = v35;
  v42[4] = v36;
  v42[5] = v37;
  v42[6] = v40;
  type metadata accessor for UploadResponseMessage();
  (*(void (**)(uint64_t, void, uint64_t))(v39 + 104))(v53, *MEMORY[0x263F8F680], v54);
  AsyncThrowingStream.init<>(_:bufferingPolicy:_:)();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v37, v56);
  sub_24A10A9A0();
  v43();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_24A0FB280();
  sub_24A0FB0CC();
  return v45(v44, v45, v46, v47, v48, v49, v50, v51, v53, v54, v55, v56, v57, v58, a15, a16, a17, a18);
}

uint64_t sub_24A1024A4()
{
  (*(void (**)(void, void))(v0[14] + 8))(v0[15], v0[13]);
  sub_24A10A7B8();
  v1();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_24A0FB1D0();
  return v2();
}

uint64_t sub_24A102568(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v36 = a3;
  uint64_t v37 = a6;
  uint64_t v31 = a4;
  uint64_t v32 = a5;
  uint64_t v35 = a2;
  uint64_t v33 = a1;
  uint64_t v39 = sub_24A0FA334(&qword_26976A1F8);
  uint64_t v6 = *(void *)(v39 - 8);
  uint64_t v34 = *(void *)(v6 + 64);
  MEMORY[0x270FA5388](v39);
  uint64_t v38 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for Credential();
  uint64_t v28 = v8;
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  MEMORY[0x270FA5388](v8);
  uint64_t v29 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for URL();
  uint64_t v27 = v11;
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(void *)(v12 + 64);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v26 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_24A0FA334(&qword_26976A0D0);
  MEMORY[0x270FA5388](v15 - 8);
  uint64_t v17 = (char *)&v26 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  os_log_type_t v30 = v17;
  uint64_t v18 = type metadata accessor for TaskPriority();
  sub_24A0F600C((uint64_t)v17, 1, 1, v18);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, v31, v11);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))((char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v32, v8);
  uint64_t v26 = v6;
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v38, v33, v39);
  unint64_t v19 = (*(unsigned __int8 *)(v12 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  unint64_t v20 = (v13 + *(unsigned __int8 *)(v9 + 80) + v19) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  unint64_t v21 = (v10 + *(unsigned __int8 *)(v6 + 80) + v20) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  unint64_t v22 = (v34 + v21 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v23 = (char *)swift_allocObject();
  *((void *)v23 + 2) = 0;
  *((void *)v23 + 3) = 0;
  uint64_t v24 = v36;
  *((void *)v23 + 4) = v35;
  *((void *)v23 + 5) = v24;
  (*(void (**)(char *, char *, uint64_t))(v12 + 32))(&v23[v19], v14, v27);
  (*(void (**)(char *, char *, uint64_t))(v9 + 32))(&v23[v20], v29, v28);
  (*(void (**)(char *, char *, uint64_t))(v26 + 32))(&v23[v21], v38, v39);
  *(void *)&v23[v22] = v37;
  swift_retain();
  swift_bridgeObjectRetain();
  sub_24A0F7EC4((uint64_t)v30, (uint64_t)&unk_26976A208, (uint64_t)v23);
  return swift_release();
}

uint64_t sub_24A1028F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[18] = a7;
  v8[19] = a8;
  v8[17] = a5;
  uint64_t v11 = type metadata accessor for SimultaneousTransferError();
  v8[20] = v11;
  v8[21] = *(void *)(v11 - 8);
  v8[22] = swift_task_alloc();
  sub_24A0FA334(&qword_26976A210);
  v8[23] = swift_task_alloc();
  v8[24] = sub_24A0FA334(&qword_26976A218);
  v8[25] = swift_task_alloc();
  uint64_t v12 = sub_24A0FA334(&qword_26976A220);
  v8[26] = v12;
  v8[27] = *(void *)(v12 - 8);
  v8[28] = swift_task_alloc();
  v8[29] = swift_task_alloc();
  uint64_t v13 = sub_24A0FA334(&qword_26976A228);
  v8[30] = v13;
  v8[31] = *(void *)(v13 - 8);
  v8[32] = swift_task_alloc();
  uint64_t v14 = type metadata accessor for UploadResponseMessage();
  v8[33] = v14;
  v8[34] = *(void *)(v14 - 8);
  v8[35] = swift_task_alloc();
  uint64_t v15 = sub_24A0FA334(&qword_26976A230);
  v8[36] = v15;
  v8[37] = *(void *)(v15 - 8);
  v8[38] = swift_task_alloc();
  uint64_t v16 = sub_24A0FA334(&qword_26976A238);
  v8[39] = v16;
  unsigned char v8[40] = *(void *)(v16 - 8);
  v8[41] = swift_task_alloc();
  uint64_t v17 = swift_task_alloc();
  v8[42] = v17;
  uint64_t v18 = (void *)swift_task_alloc();
  v8[43] = v18;
  *uint64_t v18 = v8;
  v18[1] = sub_24A102C78;
  return sub_24A10093C(v17, a5, a6);
}

uint64_t sub_24A102C78()
{
  sub_24A0FB204();
  sub_24A0FB00C();
  sub_24A0FB128();
  *uint64_t v3 = v2;
  *uint64_t v3 = *v1;
  v2[44] = v4;
  v2[45] = v5;
  v2[46] = v6;
  v2[47] = v7;
  v2[48] = v0;
  swift_task_dealloc();
  sub_24A0FB244();
  return MEMORY[0x270FA2498](v8, v9, v10);
}

uint64_t sub_24A102D64()
{
  uint64_t v38 = v0;
  uint64_t v1 = v0 + 17;
  uint64_t v2 = v0[17];
  uint64_t v3 = v0[46];
  uint64_t v35 = v0[47];
  uint64_t v4 = v0[44];
  uint64_t v5 = v0[45];
  uint64_t v6 = v1[20];
  uint64_t v7 = (uint64_t *)v1[18];
  uint64_t v8 = v1[17];
  uint64_t v9 = v1[1];
  uint64_t v10 = (void *)swift_task_alloc();
  uint64_t v10[2] = v9;
  v10[3] = v4;
  v10[4] = v5;
  v10[5] = v3;
  v10[6] = v35;
  swift_bridgeObjectRetain();
  uint64_t v11 = sub_24A0FD484((void (*)(char *))sub_24A10635C, (uint64_t)v10, v2);
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  uint64_t *v7 = v11;
  uint64_t v12 = *(void (**)(uint64_t))(v8 + 104);
  v1[32] = v12;
  v1[33] = (v8 + 104) & 0xFFFFFFFFFFFFLL | 0xB2E4000000000000;
  uint64_t v13 = sub_24A10A974();
  v12(v13);
  swift_bridgeObjectRetain();
  uint64_t v14 = sub_24A0FA334(&qword_26976A1F8);
  os_log_type_t v15 = v14;
  v1[34] = v14;
  AsyncThrowingStream.Continuation.yield(_:)();
  uint64_t v16 = *(void (**)(void))(v6 + 8);
  v1[35] = v16;
  v1[36] = (v6 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  sub_24A10A9A0();
  v16();
  Signal.init()();
  uint64_t v17 = sub_24A10A974();
  v12(v17);
  AsyncThrowingStream.Continuation.yield(_:)();
  sub_24A10A9A0();
  v16();
  if (qword_26976A058 != -1) {
    swift_once();
  }
  uint64_t v18 = type metadata accessor for Logger();
  sub_24A1058C4(v18, (uint64_t)qword_26976A1B0);
  swift_bridgeObjectRetain();
  unint64_t v19 = Logger.logObject.getter();
  os_log_type_t v20 = static os_log_type_t.default.getter();
  if (sub_24A10A738(v20))
  {
    unint64_t v21 = (uint8_t *)swift_slowAlloc();
    uint64_t v22 = sub_24A10A8B0();
    *(_DWORD *)unint64_t v21 = 136315138;
    uint64_t v37 = v22;
    uint64_t v23 = type metadata accessor for AssetSkeleton();
    uint64_t v24 = swift_bridgeObjectRetain();
    uint64_t v25 = MEMORY[0x24C5BC170](v24, v23);
    uint64_t v27 = v26;
    swift_bridgeObjectRelease();
    *(v1 - 1) = sub_24A10590C(v25, v27, &v37);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_24A0F4000, v19, v15, "send back ephemeral assets %s", v21, 0xCu);
    swift_arrayDestroy();
    sub_24A10A3DC();
    sub_24A10A3DC();
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  uint64_t v28 = *(void *)(v36 + 240);
  uint64_t v29 = *(void *)(v36 + 136);
  (*(void (**)(void, void, void))(*(void *)(v36 + 320) + 16))(*(void *)(v36 + 328), *(void *)(v36 + 336), *(void *)(v36 + 312));
  *(void *)(swift_allocObject() + 16) = v29;
  *(void *)(v36 + 432) = type metadata accessor for Asset();
  sub_24A106570(&qword_26976A268, &qword_26976A238);
  swift_bridgeObjectRetain();
  AsyncMapSequence.init(_:transform:)();
  MEMORY[0x24C5BC370](v28);
  dispatch thunk of AsyncSequence.makeAsyncIterator()();
  AsyncMapSequence.Iterator.transform.getter();
  AsyncMapSequence.Iterator.init(_:transform:)();
  *(_DWORD *)(v36 + 60) = *MEMORY[0x263F322B8];
  *(_DWORD *)(v36 + 480) = *MEMORY[0x263F321E0];
  sub_24A0FB244();
  sub_24A10A488();
  return MEMORY[0x270FA2498](v30, v31, v32);
}

uint64_t sub_24A1031D4()
{
  sub_24A0FB2D0();
  *(void *)(v0 + 440) = AsyncMapSequence.Iterator.baseIterator.modify();
  sub_24A106570(&qword_26976A270, &qword_26976A218);
  swift_task_alloc();
  sub_24A10AB88();
  *(void *)(v0 + 448) = v1;
  *uint64_t v1 = v2;
  v1[1] = sub_24A1032C8;
  sub_24A0FB244();
  return MEMORY[0x270FA1E88]();
}

uint64_t sub_24A1032C8()
{
  sub_24A0FB204();
  sub_24A0FB00C();
  uint64_t v3 = v2;
  sub_24A0FB128();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  sub_24A0FB128();
  *uint64_t v6 = v5;
  swift_task_dealloc();
  if (!v0) {
    (*(void (**)(void))(v3 + 440))();
  }
  sub_24A0FB244();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_24A1033BC()
{
  if (*(unsigned char *)(v0 + 56))
  {
    sub_24A0F600C(*(void *)(v0 + 184), 1, 1, *(void *)(v0 + 432));
    sub_24A0FB244();
    return MEMORY[0x270FA2498](v1, v2, v3);
  }
  else
  {
    uint64_t v5 = *(void *)(v0 + 224);
    uint64_t v4 = *(void *)(v0 + 232);
    uint64_t v6 = *(void *)(v0 + 208);
    uint64_t v7 = *(void *)(v0 + 216);
    *(void *)(v0 + 96) = *(void *)(v0 + 48);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v5, v4, v6);
    uint64_t v8 = (int *)AsyncMapSequence.Iterator.transform.getter();
    *(void *)(v0 + 464) = v9;
    sub_24A10A7B8();
    v10();
    os_log_type_t v15 = (uint64_t (*)(uint64_t, uint64_t))((char *)v8 + *v8);
    swift_task_alloc();
    sub_24A10AB88();
    *(void *)(v0 + 472) = v11;
    *uint64_t v11 = v12;
    v11[1] = sub_24A1039F8;
    uint64_t v13 = *(void *)(v0 + 184);
    return v15(v13, v0 + 96);
  }
}

uint64_t sub_24A103558()
{
  sub_24A0FB204();
  uint64_t v1 = (void (*)(void))v0[55];
  v0[57] = v0[15];
  v1();
  sub_24A0FB244();
  return MEMORY[0x270FA2498](v2, v3, v4);
}

#error "24A10368C: call analysis failed (funcsize=251)"

uint64_t sub_24A1039F8()
{
  sub_24A0FB204();
  sub_24A0FB00C();
  uint64_t v1 = *v0;
  sub_24A0FB128();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  swift_release();
  sub_24A0FB244();
  return MEMORY[0x270FA2498](v3, v4, v5);
}

uint64_t sub_24A103AE0()
{
  sub_24A0FB204();
  sub_24A0F600C(*(void *)(v0 + 184), 0, 1, *(void *)(v0 + 432));
  sub_24A0FB244();
  return MEMORY[0x270FA2498](v1, v2, v3);
}

uint64_t sub_24A103B4C()
{
  uint64_t v1 = *(void *)(v0 + 432);
  uint64_t v2 = *(void *)(v0 + 184);
  if (sub_24A0F5F50(v2, 1, v1) == 1)
  {
    uint64_t v3 = *(void *)(v0 + 368);
    unint64_t v4 = *(void *)(v0 + 376);
    uint64_t v5 = *(void *)(v0 + 320);
    uint64_t v23 = *(void *)(v0 + 312);
    uint64_t v25 = *(void *)(v0 + 336);
    sub_24A0FA8D8(*(void *)(v0 + 352), *(void *)(v0 + 360));
    sub_24A0FA8D8(v3, v4);
    uint64_t v6 = sub_24A10A720();
    v7(v6);
    uint64_t v8 = sub_24A10A778();
    v9(v8);
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v25, v23);
    *(void *)(v0 + 64) = 0;
    sub_24A0FA334(&qword_26976A1F8);
    AsyncThrowingStream.Continuation.finish(throwing:)();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    sub_24A0FB1D0();
    return v10();
  }
  else
  {
    unsigned int v21 = *(_DWORD *)(v0 + 480);
    uint64_t v12 = *(unsigned int *)(v0 + 60);
    uint64_t v24 = *(void (**)(uint64_t, uint64_t))(v0 + 416);
    uint64_t v13 = *(void (**)(uint64_t, void, uint64_t))(v0 + 392);
    uint64_t v14 = *(void *)(v0 + 304);
    uint64_t v15 = *(void *)(v0 + 280);
    uint64_t v22 = *(void *)(v0 + 288);
    uint64_t v16 = *(void *)(v0 + 264);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v1 - 8) + 32))(v15, v2, v1);
    sub_24A0FA334(&qword_26976A278);
    sub_24A10A3CC();
    (*(void (**)(uint64_t, uint64_t))(v17 + 104))(v15, v12);
    v13(v15, v21, v16);
    AsyncThrowingStream.Continuation.yield(_:)();
    v24(v14, v22);
    sub_24A0FB244();
    return MEMORY[0x270FA2498](v18, v19, v20);
  }
}

#error "24A103E4C: call analysis failed (funcsize=229)"

uint64_t sub_24A1041B8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X4>, unint64_t a6@<X5>, uint64_t a7@<X8>)
{
  v20[0] = a2;
  v20[1] = a7;
  uint64_t v12 = type metadata accessor for Credential();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = type metadata accessor for Asset();
  MEMORY[0x270FA5388](v16);
  (*(void (**)(char *, uint64_t))(v18 + 16))((char *)v20 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  (*(void (**)(char *, void, uint64_t))(v13 + 16))(v15, v20[0], v12);
  sub_24A109F34(a3, a4);
  sub_24A109F34(a5, a6);
  return AssetSkeleton.init(asset:credential:storageReference:storageReferenceSignature:)();
}

uint64_t sub_24A104378(uint64_t a1, void *a2, uint64_t a3)
{
  v3[2] = a1;
  v3[3] = a3;
  v3[4] = *a2;
  return MEMORY[0x270FA2498](sub_24A1043A0, 0, 0);
}

void sub_24A1043A0()
{
  sub_24A0FB2D0();
  if (!*(void *)(v0[3] + 16))
  {
    __break(1u);
    goto LABEL_7;
  }
  unint64_t v1 = sub_24A106698(v0[4]);
  if ((v2 & 1) == 0)
  {
LABEL_7:
    __break(1u);
    return;
  }
  unint64_t v3 = v1;
  uint64_t v4 = v0[2];
  uint64_t v5 = *(void *)(v0[3] + 56);
  type metadata accessor for Asset();
  sub_24A10A3CC();
  (*(void (**)(uint64_t, unint64_t))(v6 + 16))(v4, v5 + *(void *)(v6 + 72) * v3);
  sub_24A0FB1D0();
  v7();
}

uint64_t sub_24A10445C()
{
  swift_release();
  swift_release();
  return v0;
}

uint64_t sub_24A104484()
{
  sub_24A10445C();
  return MEMORY[0x270FA0228](v0, 32, 7);
}

uint64_t type metadata accessor for Uploader()
{
  return self;
}

uint64_t type metadata accessor for Uploader.OptionsBuilder()
{
  return self;
}

unint64_t sub_24A104500()
{
  unint64_t result = qword_26976A1D0;
  if (!qword_26976A1D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_26976A1D0);
  }
  return result;
}

void sub_24A10454C()
{
  sub_24A10A968();
  uint64_t v3 = *v0;
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (!isUniquelyReferenced_nonNull_native || v2 > *(void *)(v3 + 24) >> 1)
  {
    if (*(void *)(v3 + 16) <= v2) {
      uint64_t v5 = v2;
    }
    else {
      uint64_t v5 = *(void *)(v3 + 16);
    }
    sub_24A104E84(isUniquelyReferenced_nonNull_native, v5, 0, v3, v1);
    uint64_t v3 = v6;
  }
  *uint64_t v0 = v3;
}

uint64_t sub_24A1045B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a1 == a3 && a2 == a4) {
    return 1;
  }
  else {
    return _stringCompareWithSmolCheck(_:_:expecting:)() & 1;
  }
}

uint64_t sub_24A1045F8(uint64_t a1, unsigned __int8 a2, uint64_t (*a3)(void *), uint64_t a4, uint64_t a5, unint64_t a6)
{
  v49[3] = a4;
  if (a1 < 0)
  {
    sub_24A10A39C();
    sub_24A10A6EC();
    goto LABEL_40;
  }
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = MEMORY[0x263F8EE78];
  uint64_t v41 = (char **)(v10 + 16);
  uint64_t v46 = swift_allocObject();
  *(void *)(v46 + 16) = 15;
  uint64_t v11 = HIBYTE(a6) & 0xF;
  if (!a1 || ((a6 & 0x2000000000000000) != 0 ? (uint64_t v12 = HIBYTE(a6) & 0xF) : (uint64_t v12 = a5 & 0xFFFFFFFFFFFFLL), !v12))
  {
    if ((a6 & 0x2000000000000000) == 0) {
      uint64_t v11 = a5 & 0xFFFFFFFFFFFFLL;
    }
    uint64_t v29 = 7;
    if (((a6 >> 60) & ((a5 & 0x800000000000000) == 0)) != 0) {
      uint64_t v29 = 11;
    }
    sub_24A104A28(v29 | (v11 << 16), v46, a2 & 1, v10);
    swift_bridgeObjectRelease();
    uint64_t v13 = *(char **)(v10 + 16);
    swift_bridgeObjectRetain();
    swift_release();
LABEL_36:
    swift_release();
    return (uint64_t)v13;
  }
  uint64_t v40 = a1;
  unint64_t v47 = 4 * v12;
  uint64_t v13 = (char *)MEMORY[0x263F8EE78];
  unint64_t v14 = 15;
  unint64_t v15 = 15;
  unint64_t v16 = 15;
  while (1)
  {
    v49[0] = String.subscript.getter();
    v49[1] = v17;
    char v18 = a3(v49);
    if (v6)
    {
      swift_release();
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return (uint64_t)v13;
    }
    char v19 = v18;
    swift_bridgeObjectRelease();
    if ((v19 & 1) == 0)
    {
      unint64_t v14 = String.index(after:)();
      goto LABEL_21;
    }
    int v20 = (v15 >> 14 == v14 >> 14) & a2;
    if (v20 != 1)
    {
      if (v14 >> 14 < v15 >> 14) {
        goto LABEL_38;
      }
      uint64_t v21 = String.subscript.getter();
      uint64_t v42 = v23;
      uint64_t v43 = v22;
      uint64_t v44 = v24;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v13 = sub_24A104D7C(0, *((void *)v13 + 2) + 1, 1, (uint64_t)v13);
      }
      unint64_t v26 = *((void *)v13 + 2);
      unint64_t v25 = *((void *)v13 + 3);
      if (v26 >= v25 >> 1) {
        uint64_t v13 = sub_24A104D7C((char *)(v25 > 1), v26 + 1, 1, (uint64_t)v13);
      }
      *((void *)v13 + 2) = v26 + 1;
      uint64_t v27 = &v13[32 * v26];
      *((void *)v27 + 4) = v21;
      *((void *)v27 + 5) = v44;
      *((void *)v27 + 6) = v43;
      *((void *)v27 + 7) = v42;
      *uint64_t v41 = v13;
    }
    uint64_t v28 = String.index(after:)();
    unint64_t v14 = v28;
    *(void *)(v46 + 16) = v28;
    if ((v20 & 1) == 0 && *((void *)v13 + 2) == v40) {
      break;
    }
    unint64_t v15 = v28;
    unint64_t v16 = v28;
LABEL_21:
    if (v47 == v14 >> 14) {
      goto LABEL_30;
    }
  }
  unint64_t v16 = v28;
  unint64_t v15 = v28;
LABEL_30:
  if (v47 == v15 >> 14 && (a2 & 1) != 0)
  {
    swift_bridgeObjectRelease();
LABEL_35:
    swift_bridgeObjectRetain();
    swift_release();
    goto LABEL_36;
  }
  if (v47 >= v16 >> 14)
  {
    uint64_t v30 = String.subscript.getter();
    uint64_t v32 = v31;
    uint64_t v34 = v33;
    uint64_t v36 = v35;
    swift_bridgeObjectRelease();
    sub_24A104B30();
    uint64_t v37 = (char *)*((void *)*v41 + 2);
    sub_24A104B7C(v37);
    uint64_t v13 = *v41;
    *((void *)v13 + 2) = v37 + 1;
    uint64_t v38 = &v13[32 * (void)v37];
    *((void *)v38 + 4) = v30;
    *((void *)v38 + 5) = v32;
    *((void *)v38 + 6) = v34;
    *((void *)v38 + 7) = v36;
    *uint64_t v41 = v13;
    goto LABEL_35;
  }
LABEL_38:
  sub_24A10A39C();
  sub_24A10A6EC();
LABEL_40:
  uint64_t result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_24A104A28(unint64_t a1, uint64_t a2, unsigned __int8 a3, uint64_t a4)
{
  unint64_t v4 = *(void *)(a2 + 16) >> 14;
  int v5 = (v4 == a1 >> 14) & a3;
  if (v5 == 1) {
    return v5 ^ 1u;
  }
  if (a1 >> 14 >= v4)
  {
    uint64_t v7 = String.subscript.getter();
    uint64_t v9 = v8;
    uint64_t v11 = v10;
    uint64_t v13 = v12;
    sub_24A104B30();
    unint64_t v14 = *(char **)(*(void *)(a4 + 16) + 16);
    sub_24A104B7C(v14);
    uint64_t v15 = *(void *)(a4 + 16);
    *(void *)(v15 + 16) = v14 + 1;
    unint64_t v16 = (void *)(v15 + 32 * (void)v14);
    v16[4] = v7;
    v16[5] = v9;
    v16[6] = v11;
    v16[7] = v13;
    return v5 ^ 1u;
  }
  uint64_t result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

char *sub_24A104B30()
{
  uint64_t v1 = *v0;
  uint64_t result = (char *)swift_isUniquelyReferenced_nonNull_native();
  *uint64_t v0 = v1;
  if (!result)
  {
    uint64_t result = sub_24A104D7C(result, *(void *)(v1 + 16) + 1, 1, v1);
    *uint64_t v0 = (uint64_t)result;
  }
  return result;
}

char *sub_24A104B7C(char *result)
{
  unint64_t v2 = *(void *)(*v1 + 24);
  if ((uint64_t)(result + 1) > (uint64_t)(v2 >> 1))
  {
    uint64_t result = sub_24A104D7C((char *)(v2 > 1), (int64_t)(result + 1), 1, *v1);
    *uint64_t v1 = (uint64_t)result;
  }
  return result;
}

uint64_t sub_24A104BBC(char a1, uint64_t a2, char a3, uint64_t a4)
{
  if (a3)
  {
    sub_24A10A43C();
    if (v7 != v8)
    {
      sub_24A10A664();
      if (v7)
      {
        __break(1u);
        goto LABEL_23;
      }
      sub_24A10A42C();
    }
  }
  else
  {
    uint64_t v6 = a2;
  }
  uint64_t v9 = *(void *)(a4 + 16);
  if (v6 <= v9) {
    uint64_t v10 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v10 = v6;
  }
  if (!v10)
  {
    unint64_t v16 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_18;
  }
  sub_24A0FA334(&qword_26976A450);
  uint64_t v11 = sub_24A0FA334(&qword_26976A2E8);
  sub_24A0FB024(v11);
  uint64_t v13 = *(void *)(v12 + 72);
  unint64_t v15 = (*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  unint64_t v16 = (void *)swift_allocObject();
  size_t v17 = j__malloc_size(v16);
  if (!v13 || (v17 - v15 == 0x8000000000000000 ? (BOOL v18 = v13 == -1) : (BOOL v18 = 0), v18))
  {
LABEL_23:
    sub_24A10A39C();
    sub_24A10A6EC();
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
    return result;
  }
  v16[2] = v9;
  v16[3] = 2 * ((uint64_t)(v17 - v15) / v13);
LABEL_18:
  uint64_t v19 = sub_24A0FA334(&qword_26976A2E8);
  sub_24A10A560(v19);
  sub_24A10AB7C();
  if (a1)
  {
    sub_24A1052F8(a4 + v20, v9);
    *(void *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_24A104F44(0, v9, (unint64_t)v16 + v20, a4);
  }
  return (uint64_t)v16;
}

char *sub_24A104D7C(char *result, int64_t a2, char a3, uint64_t a4)
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
    sub_24A0FA334(&qword_26976A428);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 32);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  if (v5)
  {
    sub_24A1054E4((char *)(a4 + 32), v8, v12);
    *(void *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_24A1050A8(0, v8, (unint64_t)v12, a4);
  }
  return v10;
}

void sub_24A104E6C(char a1, uint64_t a2, char a3, uint64_t a4)
{
}

void sub_24A104E78(char a1, uint64_t a2, char a3, uint64_t a4)
{
}

void sub_24A104E84(char a1, uint64_t a2, char a3, uint64_t a4, uint64_t *a5)
{
  if (a3)
  {
    sub_24A10A43C();
    if (v8 != v9)
    {
      sub_24A10A664();
      if (v8)
      {
        __break(1u);
        return;
      }
      sub_24A10A42C();
    }
  }
  else
  {
    uint64_t v7 = a2;
  }
  uint64_t v10 = *(void *)(a4 + 16);
  if (v7 <= v10) {
    uint64_t v11 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v11 = v7;
  }
  if (v11)
  {
    sub_24A0FA334(a5);
    uint64_t v12 = (char *)sub_24A10A7EC();
    size_t v13 = j__malloc_size(v12);
    sub_24A10A7D4(v13);
  }
  else
  {
    uint64_t v12 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v14 = v12 + 32;
  if (a1)
  {
    sub_24A105470((char *)(a4 + 32), v10, v14);
    *(void *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_24A1051A0(0, v10, v14, a4);
  }
}

uint64_t sub_24A104F44(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = *(void *)(sub_24A0FA334(&qword_26976A2E8) - 8);
    uint64_t v9 = a4 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
    uint64_t v10 = *(void *)(v8 + 72);
    unint64_t v11 = v9 + v10 * a1;
    unint64_t v12 = a3 + v10 * v4;
    if (v11 >= v12 || v11 + v10 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v12;
    }
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_24A1050A8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 32 * a1 + 32;
    unint64_t v6 = a3 + 32 * v4;
    if (v5 >= v6 || v5 + 32 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

char *sub_24A1051A0(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v4 < 0)
  {
LABEL_9:
    sub_24A10A39C();
    sub_24A10A52C();
    goto LABEL_11;
  }
  unint64_t v5 = (char *)(a4 + 8 * a1 + 32);
  unint64_t v6 = &__dst[8 * v4];
  if (v5 >= v6 || &v5[8 * v4] <= __dst)
  {
    memcpy(__dst, v5, 8 * v4);
    swift_bridgeObjectRelease();
    return v6;
  }
  sub_24A10A39C();
  sub_24A10A51C();
LABEL_11:
  uint64_t result = (char *)sub_24A10A5A4();
  __break(1u);
  return result;
}

char *sub_24A105264(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else if (__dst != __src || &__src[8 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 8 * a2);
  }
  return __src;
}

void sub_24A1052F8(uint64_t a1, uint64_t a2)
{
  if (a2 < 0)
  {
    sub_24A10A39C();
    uint64_t v8 = sub_24A10A53C();
    __break(1u);
_swift_arrayInitWithTakeBackToFront:
    MEMORY[0x270FA01D0](v8);
    return;
  }
  sub_24A10A7A0();
  if (v6 && (sub_24A0FA334(v5), sub_24A10A3CC(), v3 + *(void *)(v7 + 72) * v2 > v4))
  {
    if (v4 != v3)
    {
      uint64_t v8 = sub_24A10A4A4();
      goto _swift_arrayInitWithTakeBackToFront;
    }
  }
  else
  {
    sub_24A0FA334(v5);
    uint64_t v9 = sub_24A10A4A4();
    MEMORY[0x270FA01D8](v9);
  }
}

char *sub_24A1053DC(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else if (__dst != __src || &__src[16 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 16 * a2);
  }
  return __src;
}

char *sub_24A105470(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    sub_24A10A39C();
    __src = (char *)sub_24A10A53C();
    __break(1u);
  }
  else if (__dst != __src || &__src[8 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 8 * a2);
  }
  return __src;
}

char *sub_24A1054E4(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else if (__dst != __src || &__src[32 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 32 * a2);
  }
  return __src;
}

char *sub_24A105578(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else if (__dst != __src || &__src[4 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 4 * a2);
  }
  return __src;
}

char *sub_24A10560C(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else if (__dst != __src || &__src[40 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 40 * a2);
  }
  return __src;
}

char *sub_24A1056A8(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else if (__dst != __src || &__src[48 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 48 * a2);
  }
  return __src;
}

void sub_24A105744(uint64_t a1, uint64_t a2)
{
  if (a2 < 0)
  {
    sub_24A10A39C();
    uint64_t v9 = sub_24A10A53C();
    __break(1u);
_swift_arrayInitWithTakeBackToFront:
    MEMORY[0x270FA01D0](v9);
    return;
  }
  sub_24A10A7A0();
  if (v6 && (uint64_t v7 = sub_24A10A934(), v5(v7), sub_24A10A3CC(), v3 + *(void *)(v8 + 72) * v2 > v4))
  {
    if (v4 != v3)
    {
      uint64_t v9 = sub_24A10A4A4();
      goto _swift_arrayInitWithTakeBackToFront;
    }
  }
  else
  {
    uint64_t v10 = sub_24A10A934();
    v5(v10);
    uint64_t v11 = sub_24A10A4A4();
    MEMORY[0x270FA01D8](v11);
  }
}

char *sub_24A105828(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else if (__dst != __src || &__src[24 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 24 * a2);
  }
  return __src;
}

uint64_t sub_24A1058C4(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_24A1058FC(uint64_t a1)
{
  return sub_24A102568(a1, v1[2], v1[3], v1[4], v1[5], v1[6]);
}

uint64_t sub_24A10590C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  sub_24A10A968();
  sub_24A0FB244();
  uint64_t v9 = sub_24A1059D8(v6, v7, v8, 1, v4, v3);
  uint64_t v10 = v15[0];
  if (v9)
  {
    uint64_t v11 = v9;
    uint64_t ObjectType = swift_getObjectType();
    v15[0] = v11;
    uint64_t v12 = *a3;
    if (*a3)
    {
      sub_24A105FE4((uint64_t)v15, *a3);
      *a3 = v12 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = MEMORY[0x263F8DBE0];
    v15[0] = v4;
    v15[1] = v3;
    uint64_t v13 = *a3;
    if (*a3)
    {
      sub_24A105FE4((uint64_t)v15, *a3);
      *a3 = v13 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_24A0FAFA4((uint64_t)v15);
  return v10;
}

uint64_t sub_24A1059D8(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_24A105B30((char *)__src, HIBYTE(a6) & 0xF, __dst);
      UnsafeMutableRawBufferPointer.subscript.setter();
      uint64_t result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    uint64_t result = sub_24A105C08(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    uint64_t v8 = _StringObject.sharedUTF8.getter();
    if (!v8)
    {
      uint64_t result = _assertionFailure(_:_:file:line:flags:)();
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

void *sub_24A105B30(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

uint64_t sub_24A105C08(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_24A105CA0(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = (uint64_t)sub_24A105E7C(0, *(void *)(v2 + 16) + 1, 1, v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = (uint64_t)sub_24A105E7C((char *)(v3 > 1), v4 + 1, 1, v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_24A105CA0(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    Swift::Int v2 = String.UTF8View._foreignCount()();
    if (v2) {
      goto LABEL_6;
    }
    return MEMORY[0x263F8EE78];
  }
  if ((a2 & 0x2000000000000000) != 0) {
    Swift::Int v2 = HIBYTE(a2) & 0xF;
  }
  else {
    Swift::Int v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v2) {
    return MEMORY[0x263F8EE78];
  }
LABEL_6:
  unint64_t v3 = sub_24A105E14(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    unint64_t v4 = v3;
    uint64_t v5 = _StringGuts.copyUTF8(into:)();
    if ((v6 & 1) != 0 || v5 != v2) {
      goto LABEL_14;
    }
    return (uint64_t)v4;
  }
  _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
LABEL_14:
  uint64_t result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

void *sub_24A105E14(uint64_t a1, uint64_t a2)
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
  sub_24A0FA334(&qword_26976A1F0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_24A105E7C(char *result, int64_t a2, char a3, uint64_t a4)
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
    sub_24A0FA334(&qword_26976A1F0);
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
    sub_24A105F54(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_24A0FE34C(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_24A105F54(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

uint64_t sub_24A105FE4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_24A106044()
{
  type metadata accessor for URL();
  sub_24A10A3B0();
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v4 = *(void *)(v3 + 64);
  type metadata accessor for Credential();
  sub_24A10A3B0();
  uint64_t v6 = *(unsigned __int8 *)(v5 + 80);
  uint64_t v7 = (((v2 + 48) & ~v2) + v4 + v6) & ~v6;
  uint64_t v9 = *(void *)(v8 + 64);
  uint64_t v10 = sub_24A0FA334(&qword_26976A1F8);
  sub_24A10A3B0();
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  uint64_t v15 = *(unsigned __int8 *)(v12 + 80);
  uint64_t v16 = (v7 + v9 + v15) & ~v15;
  uint64_t v17 = v2 | v6 | v15 | 7;
  unint64_t v18 = ((*(void *)(v14 + 64) + v16 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  sub_24A10A7B8();
  v19();
  sub_24A10A9A0();
  v20();
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v0 + v16, v10);
  return MEMORY[0x270FA0238](v0, v18, v17);
}

uint64_t sub_24A1061C0(uint64_t a1)
{
  uint64_t v4 = type metadata accessor for URL();
  sub_24A0FB024(v4);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v8 = *(void *)(v7 + 64);
  uint64_t v9 = type metadata accessor for Credential();
  sub_24A0FB024(v9);
  unint64_t v11 = (v6 + v8 + *(unsigned __int8 *)(v10 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = *(void *)(v12 + 64);
  uint64_t v14 = sub_24A0FA334(&qword_26976A1F8);
  sub_24A0FB024(v14);
  unint64_t v16 = (v11 + v13 + *(unsigned __int8 *)(v15 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  uint64_t v17 = v1[2];
  uint64_t v18 = v1[3];
  uint64_t v19 = v1[4];
  uint64_t v20 = v1[5];
  uint64_t v21 = (uint64_t)v1 + v16;
  uint64_t v22 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v22;
  *uint64_t v22 = v2;
  v22[1] = sub_24A10A398;
  return sub_24A1028F8(a1, v17, v18, v19, v20, (uint64_t)v1 + v6, (uint64_t)v1 + v11, v21);
}

uint64_t sub_24A10635C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_24A1041B8(a1, *(void *)(v2 + 16), *(void *)(v2 + 24), *(void *)(v2 + 32), *(void *)(v2 + 40), *(void *)(v2 + 48), a2);
}

uint64_t sub_24A106384()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_24A1063BC()
{
  sub_24A0FB2D0();
  sub_24A10AA10();
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v5;
  *uint64_t v5 = v3;
  v5[1] = sub_24A106464;
  return sub_24A104378(v2, v0, v4);
}

uint64_t sub_24A106464()
{
  sub_24A0FB204();
  sub_24A0FB00C();
  uint64_t v1 = *v0;
  sub_24A0FB128();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  sub_24A0FB1D0();
  return v3();
}

uint64_t sub_24A106528(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_24A106570(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_24A106528(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_24A1065B4(void *a1)
{
  Hasher.init(_seed:)();
  swift_bridgeObjectRetain();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  type metadata accessor for ProcessorFactory.TenantDomain();
  type metadata accessor for URL();
  sub_24A10A330(&qword_26976A0B0, MEMORY[0x263F06EA8]);
  dispatch thunk of Hashable.hash(into:)();
  Swift::Int v2 = Hasher._finalize()();
  return sub_24A1067E8(a1, v2);
}

unint64_t sub_24A106698(uint64_t a1)
{
  uint64_t v2 = static Hasher._hash(seed:_:)();
  return sub_24A106950(a1, v2);
}

unint64_t sub_24A1066DC(uint64_t a1)
{
  type metadata accessor for URL();
  sub_24A10A330(&qword_26976A0B0, MEMORY[0x263F06EA8]);
  uint64_t v2 = dispatch thunk of Hashable._rawHashValue(seed:)();
  return sub_24A1069EC(a1, v2);
}

unint64_t sub_24A106774()
{
  sub_24A10A968();
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v2 = Hasher._finalize()();
  return sub_24A106BAC(v1, v0, v2);
}

unint64_t sub_24A1067E8(void *a1, uint64_t a2)
{
  uint64_t v5 = type metadata accessor for ProcessorFactory.TenantDomain();
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (uint64_t *)((char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v9 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v10 = a2 & ~v9;
  if ((*(void *)(v2 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = ~v9;
    uint64_t v12 = *(void *)(v6 + 72);
    while (1)
    {
      sub_24A0FAC48(*(void *)(v2 + 48) + v12 * v10, (uint64_t)v8);
      BOOL v13 = *v8 == *a1 && v8[1] == a1[1];
      if (v13 || (_stringCompareWithSmolCheck(_:_:expecting:)())
        && (MEMORY[0x24C5BBEC0]((char *)v8 + *(int *)(v5 + 20), (char *)a1 + *(int *)(v5 + 20)) & 1) != 0)
      {
        break;
      }
      sub_24A0FA988((uint64_t)v8);
      unint64_t v10 = (v10 + 1) & v11;
      if (((*(void *)(v2 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0) {
        return v10;
      }
    }
    sub_24A0FA988((uint64_t)v8);
  }
  return v10;
}

unint64_t sub_24A106950(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t result = a2 & ~v5;
  if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v7 = *(void *)(v2 + 48);
    if (*(void *)(v7 + 8 * result) != a1)
    {
      uint64_t v8 = ~v5;
      for (unint64_t result = (result + 1) & v8;
            ((*(void *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            unint64_t result = (result + 1) & v8)
      {
        if (*(void *)(v7 + 8 * result) == a1) {
          break;
        }
      }
    }
  }
  return result;
}

unint64_t sub_24A1069EC(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = a1;
  uint64_t v4 = type metadata accessor for URL();
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
    BOOL v13 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
    uint64_t v12 = v5 + 16;
    uint64_t v11 = v13;
    uint64_t v14 = *(void *)(v12 + 56);
    do
    {
      v11(v7, *(void *)(v20 + 48) + v14 * v9, v4);
      sub_24A10A330(&qword_26976A458, MEMORY[0x263F06EA8]);
      char v15 = dispatch thunk of static Equatable.== infix(_:_:)();
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

unint64_t sub_24A106BAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        BOOL v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0);
    }
  }
  return v6;
}

void sub_24A106C90(uint64_t a1, int a2, uint64_t (*a3)(void), uint64_t *a4)
{
  unint64_t v6 = v4;
  uint64_t v8 = a3(0);
  sub_24A10A3B0();
  uint64_t v10 = v9;
  MEMORY[0x270FA5388](v11);
  BOOL v13 = (char *)&v47 - v12;
  uint64_t v14 = *v4;
  sub_24A0FA334(a4);
  int v52 = a2;
  uint64_t v15 = static _DictionaryStorage.resize(original:capacity:move:)();
  unint64_t v16 = (void *)v15;
  if (*(void *)(v14 + 16))
  {
    unint64_t v47 = v6;
    int64_t v17 = 0;
    uint64_t v18 = *(void *)(v14 + 64);
    uint64_t v49 = v14 + 64;
    uint64_t v19 = 1 << *(unsigned char *)(v14 + 32);
    if (v19 < 64) {
      uint64_t v20 = ~(-1 << v19);
    }
    else {
      uint64_t v20 = -1;
    }
    uint64_t v21 = v20 & v18;
    int64_t v48 = (unint64_t)(v19 + 63) >> 6;
    uint64_t v50 = (void (**)(char *, uint64_t, uint64_t))(v10 + 16);
    uint64_t v51 = v10;
    uint64_t v22 = (void (**)(char *, uint64_t, uint64_t))(v10 + 32);
    uint64_t v23 = v15 + 64;
    if ((v20 & v18) == 0) {
      goto LABEL_7;
    }
LABEL_6:
    sub_24A10A858();
    while (1)
    {
      uint64_t v27 = *(void *)(*(void *)(v14 + 48) + 8 * v24);
      uint64_t v28 = *(void *)(v51 + 72);
      uint64_t v29 = *(void *)(v14 + 56) + v28 * v24;
      if (v52) {
        (*v22)(v13, v29, v8);
      }
      else {
        (*v50)(v13, v29, v8);
      }
      static Hasher._hash(seed:_:)();
      sub_24A10AA3C();
      if (((v32 << v31) & ~*(void *)(v23 + 8 * v30)) == 0)
      {
        sub_24A10A650();
        while (++v34 != v35 || (v33 & 1) == 0)
        {
          BOOL v36 = v34 == v35;
          if (v34 == v35) {
            uint64_t v34 = 0;
          }
          v33 |= v36;
          if (*(void *)(v23 + 8 * v34) != -1)
          {
            sub_24A10A9D4();
            goto LABEL_31;
          }
        }
        __break(1u);
LABEL_42:
        __break(1u);
LABEL_43:
        __break(1u);
        return;
      }
      sub_24A10AA1C();
LABEL_31:
      sub_24A10A9C0();
      *(void *)(v23 + v37) |= v38;
      *(void *)(v16[6] + 8 * v39) = v27;
      (*v22)((char *)(v16[7] + v28 * v39), (uint64_t)v13, v8);
      ++v16[2];
      if (v21) {
        goto LABEL_6;
      }
LABEL_7:
      int64_t v25 = v17 + 1;
      if (__OFADD__(v17, 1)) {
        goto LABEL_42;
      }
      if (v25 >= v48) {
        goto LABEL_33;
      }
      ++v17;
      if (!*(void *)(v49 + 8 * v25))
      {
        int64_t v17 = v25 + 1;
        if (v25 + 1 >= v48) {
          goto LABEL_33;
        }
        if (!*(void *)(v49 + 8 * v17))
        {
          int64_t v26 = v25 + 2;
          if (v26 >= v48)
          {
LABEL_33:
            if ((v52 & 1) == 0)
            {
              swift_release();
              unint64_t v6 = v47;
              goto LABEL_40;
            }
            sub_24A10A940();
            if (v42 != v43)
            {
              *uint64_t v40 = -1 << v41;
            }
            else
            {
              uint64_t v44 = sub_24A10A7C4();
              sub_24A107B84(v44, v45, v46);
            }
            unint64_t v6 = v47;
            *(void *)(v14 + 16) = 0;
            break;
          }
          if (!*(void *)(v49 + 8 * v26))
          {
            while (1)
            {
              int64_t v17 = v26 + 1;
              if (__OFADD__(v26, 1)) {
                goto LABEL_43;
              }
              if (v17 >= v48) {
                goto LABEL_33;
              }
              ++v26;
              if (*(void *)(v49 + 8 * v17)) {
                goto LABEL_18;
              }
            }
          }
          int64_t v17 = v26;
        }
      }
LABEL_18:
      sub_24A10A81C();
    }
  }
  swift_release();
LABEL_40:
  *unint64_t v6 = v16;
}

void sub_24A106F9C(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = type metadata accessor for URL();
  sub_24A10A3B0();
  uint64_t v7 = v6;
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v46 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *v2;
  sub_24A0FA334(&qword_26976A448);
  int v53 = a2;
  uint64_t v12 = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v13 = v11;
  uint64_t v14 = (void *)v12;
  if (!*(void *)(v13 + 16)) {
    goto LABEL_40;
  }
  uint64_t v15 = 1 << *(unsigned char *)(v13 + 32);
  uint64_t v16 = *(void *)(v13 + 64);
  uint64_t v49 = (void *)(v13 + 64);
  if (v15 < 64) {
    uint64_t v17 = ~(-1 << v15);
  }
  else {
    uint64_t v17 = -1;
  }
  unint64_t v18 = v17 & v16;
  unint64_t v47 = v3;
  int64_t v48 = (unint64_t)(v15 + 63) >> 6;
  uint64_t v50 = (void (**)(char *, unint64_t, uint64_t))(v7 + 16);
  uint64_t v52 = v7;
  uint64_t v19 = (void (**)(char *, unint64_t, uint64_t))(v7 + 32);
  uint64_t v20 = v12 + 64;
  swift_retain();
  int64_t v21 = 0;
  uint64_t v51 = v13;
  if (!v18) {
    goto LABEL_7;
  }
LABEL_6:
  unint64_t v22 = __clz(__rbit64(v18));
  v18 &= v18 - 1;
  for (unint64_t i = v22 | (v21 << 6); ; unint64_t i = __clz(__rbit64(v26)) + (v21 << 6))
  {
    uint64_t v28 = *(void *)(v52 + 72);
    unint64_t v29 = *(void *)(v13 + 48) + v28 * i;
    if (v53)
    {
      (*v19)(v10, v29, v5);
      uint64_t v30 = *(void *)(*(void *)(v13 + 56) + 8 * i);
    }
    else
    {
      (*v50)(v10, v29, v5);
      uint64_t v30 = *(void *)(*(void *)(v13 + 56) + 8 * i);
      swift_bridgeObjectRetain();
    }
    sub_24A10A330(&qword_26976A0B0, MEMORY[0x263F06EA8]);
    dispatch thunk of Hashable._rawHashValue(seed:)();
    sub_24A10AA3C();
    unint64_t v34 = (v33 << v31) & ~*(void *)(v20 + 8 * v32);
    if (!v34)
    {
      sub_24A10A650();
      while (++v37 != v38 || (v36 & 1) == 0)
      {
        BOOL v39 = v37 == v38;
        if (v37 == v38) {
          uint64_t v37 = 0;
        }
        v36 |= v39;
        uint64_t v40 = *(void *)(v20 + 8 * v37);
        if (v40 != -1)
        {
          unint64_t v35 = __clz(__rbit64(~v40)) + (v37 << 6);
          goto LABEL_31;
        }
      }
      __break(1u);
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return;
    }
    unint64_t v35 = __clz(__rbit64(v34)) | v31 & 0x7FFFFFFFFFFFFFC0;
LABEL_31:
    *(void *)(v20 + ((v35 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v35;
    (*v19)((char *)(v14[6] + v28 * v35), (unint64_t)v10, v5);
    *(void *)(v14[7] + 8 * v35) = v30;
    ++v14[2];
    uint64_t v13 = v51;
    if (v18) {
      goto LABEL_6;
    }
LABEL_7:
    int64_t v24 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      goto LABEL_42;
    }
    if (v24 >= v48)
    {
      swift_release();
      uint64_t v3 = v47;
      int64_t v25 = v49;
      goto LABEL_35;
    }
    int64_t v25 = v49;
    unint64_t v26 = v49[v24];
    ++v21;
    if (!v26)
    {
      int64_t v21 = v24 + 1;
      if (v24 + 1 >= v48) {
        goto LABEL_33;
      }
      unint64_t v26 = v49[v21];
      if (!v26) {
        break;
      }
    }
LABEL_18:
    unint64_t v18 = (v26 - 1) & v26;
  }
  int64_t v27 = v24 + 2;
  if (v27 < v48)
  {
    unint64_t v26 = v49[v27];
    if (!v26)
    {
      while (1)
      {
        int64_t v21 = v27 + 1;
        if (__OFADD__(v27, 1)) {
          goto LABEL_43;
        }
        if (v21 >= v48) {
          goto LABEL_33;
        }
        unint64_t v26 = v49[v21];
        ++v27;
        if (v26) {
          goto LABEL_18;
        }
      }
    }
    int64_t v21 = v27;
    goto LABEL_18;
  }
LABEL_33:
  swift_release();
  uint64_t v3 = v47;
LABEL_35:
  if (v53)
  {
    sub_24A10A940();
    if (v42 != v43)
    {
      *int64_t v25 = -1 << v41;
    }
    else
    {
      uint64_t v44 = sub_24A10A7C4();
      sub_24A107B84(v44, v45, v25);
    }
    *(void *)(v13 + 16) = 0;
  }
LABEL_40:
  swift_release();
  *uint64_t v3 = v14;
}

void sub_24A107364(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_24A0FA334(&qword_26976A308);
  uint64_t v6 = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    unint64_t v35 = (void *)(v5 + 64);
    if (v8 < 64) {
      uint64_t v9 = ~(-1 << v8);
    }
    else {
      uint64_t v9 = -1;
    }
    uint64_t v10 = v9 & *(void *)(v5 + 64);
    int64_t v34 = (unint64_t)(v8 + 63) >> 6;
    uint64_t v11 = v6 + 64;
    swift_retain();
    int64_t v12 = 0;
    if (!v10) {
      goto LABEL_7;
    }
LABEL_6:
    sub_24A10A858();
    while (1)
    {
      uint64_t v16 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v13);
      uint64_t v18 = *v16;
      uint64_t v17 = v16[1];
      uint64_t v19 = (_OWORD *)(*(void *)(v5 + 56) + 32 * v13);
      if (a2)
      {
        sub_24A0FAFF4(v19, v36);
      }
      else
      {
        sub_24A105FE4((uint64_t)v19, (uint64_t)v36);
        swift_bridgeObjectRetain();
      }
      Hasher.init(_seed:)();
      String.hash(into:)();
      unint64_t v20 = Hasher._finalize()() & ~(-1 << *(unsigned char *)(v7 + 32));
      if (((-1 << v20) & ~*(void *)(v11 + 8 * (v20 >> 6))) == 0)
      {
        sub_24A10A650();
        while (++v22 != v23 || (v21 & 1) == 0)
        {
          BOOL v24 = v22 == v23;
          if (v22 == v23) {
            uint64_t v22 = 0;
          }
          v21 |= v24;
          if (*(void *)(v11 + 8 * v22) != -1)
          {
            sub_24A10A9D4();
            goto LABEL_31;
          }
        }
        __break(1u);
LABEL_40:
        __break(1u);
LABEL_41:
        __break(1u);
        return;
      }
      sub_24A10AA1C();
LABEL_31:
      sub_24A10A9C0();
      *(void *)(v11 + v25) |= v26;
      uint64_t v28 = (void *)(*(void *)(v7 + 48) + 16 * v27);
      *uint64_t v28 = v18;
      v28[1] = v17;
      sub_24A0FAFF4(v36, (_OWORD *)(*(void *)(v7 + 56) + 32 * v27));
      ++*(void *)(v7 + 16);
      if (v10) {
        goto LABEL_6;
      }
LABEL_7:
      int64_t v14 = v12 + 1;
      if (__OFADD__(v12, 1)) {
        goto LABEL_40;
      }
      if (v14 >= v34) {
        goto LABEL_33;
      }
      ++v12;
      if (!v35[v14])
      {
        int64_t v12 = v14 + 1;
        if (v14 + 1 >= v34) {
          goto LABEL_33;
        }
        if (!v35[v12])
        {
          int64_t v15 = v14 + 2;
          if (v15 >= v34)
          {
LABEL_33:
            swift_release();
            uint64_t v3 = v2;
            if (a2)
            {
              sub_24A10A940();
              if (v30 != v31)
              {
                *unint64_t v35 = -1 << v29;
              }
              else
              {
                uint64_t v32 = sub_24A10A7C4();
                sub_24A107B84(v32, v33, v35);
              }
              *(void *)(v5 + 16) = 0;
            }
            break;
          }
          if (!v35[v15])
          {
            while (1)
            {
              int64_t v12 = v15 + 1;
              if (__OFADD__(v15, 1)) {
                goto LABEL_41;
              }
              if (v12 >= v34) {
                goto LABEL_33;
              }
              ++v15;
              if (v35[v12]) {
                goto LABEL_18;
              }
            }
          }
          int64_t v12 = v15;
        }
      }
LABEL_18:
      sub_24A10A81C();
    }
  }
  swift_release();
  *uint64_t v3 = v7;
}

uint64_t sub_24A107600(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_24A0FA334(&qword_26976A370);
  uint64_t result = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    int64_t v8 = 0;
    uint64_t v9 = *(void *)(v5 + 64);
    char v31 = (void *)(v5 + 64);
    uint64_t v10 = 1 << *(unsigned char *)(v5 + 32);
    if (v10 < 64) {
      uint64_t v11 = ~(-1 << v10);
    }
    else {
      uint64_t v11 = -1;
    }
    unint64_t v12 = v11 & v9;
    int64_t v13 = (unint64_t)(v10 + 63) >> 6;
    uint64_t v14 = result + 64;
    if ((v11 & v9) == 0) {
      goto LABEL_7;
    }
LABEL_6:
    unint64_t v15 = __clz(__rbit64(v12));
    v12 &= v12 - 1;
    for (unint64_t i = v15 | (v8 << 6); ; unint64_t i = __clz(__rbit64(v18)) + (v8 << 6))
    {
      uint64_t v20 = *(void *)(*(void *)(v5 + 48) + 8 * i);
      char v21 = (long long *)(*(void *)(v5 + 56) + 40 * i);
      if (a2) {
        sub_24A10A130(v21, (uint64_t)v32);
      }
      else {
        sub_24A10A148((uint64_t)v21, (uint64_t)v32);
      }
      uint64_t result = static Hasher._hash(seed:_:)();
      uint64_t v22 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v23 = result & ~v22;
      unint64_t v24 = v23 >> 6;
      if (((-1 << v23) & ~*(void *)(v14 + 8 * (v23 >> 6))) == 0)
      {
        char v26 = 0;
        unint64_t v27 = (unint64_t)(63 - v22) >> 6;
        while (++v24 != v27 || (v26 & 1) == 0)
        {
          BOOL v28 = v24 == v27;
          if (v24 == v27) {
            unint64_t v24 = 0;
          }
          v26 |= v28;
          uint64_t v29 = *(void *)(v14 + 8 * v24);
          if (v29 != -1)
          {
            unint64_t v25 = __clz(__rbit64(~v29)) + (v24 << 6);
            goto LABEL_31;
          }
        }
        __break(1u);
LABEL_41:
        __break(1u);
LABEL_42:
        __break(1u);
        return result;
      }
      unint64_t v25 = __clz(__rbit64((-1 << v23) & ~*(void *)(v14 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
LABEL_31:
      *(void *)(v14 + ((v25 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v25;
      *(void *)(*(void *)(v7 + 48) + 8 * v25) = v20;
      uint64_t result = sub_24A10A130(v32, *(void *)(v7 + 56) + 40 * v25);
      ++*(void *)(v7 + 16);
      if (v12) {
        goto LABEL_6;
      }
LABEL_7:
      int64_t v17 = v8 + 1;
      if (__OFADD__(v8, 1)) {
        goto LABEL_41;
      }
      if (v17 >= v13) {
        goto LABEL_33;
      }
      unint64_t v18 = v31[v17];
      ++v8;
      if (!v18)
      {
        int64_t v8 = v17 + 1;
        if (v17 + 1 >= v13) {
          goto LABEL_33;
        }
        unint64_t v18 = v31[v8];
        if (!v18)
        {
          int64_t v19 = v17 + 2;
          if (v19 >= v13)
          {
LABEL_33:
            if (a2)
            {
              uint64_t v30 = 1 << *(unsigned char *)(v5 + 32);
              if (v30 >= 64) {
                sub_24A107B84(0, (unint64_t)(v30 + 63) >> 6, v31);
              }
              else {
                *char v31 = -1 << v30;
              }
              *(void *)(v5 + 16) = 0;
            }
            break;
          }
          unint64_t v18 = v31[v19];
          if (!v18)
          {
            while (1)
            {
              int64_t v8 = v19 + 1;
              if (__OFADD__(v19, 1)) {
                goto LABEL_42;
              }
              if (v8 >= v13) {
                goto LABEL_33;
              }
              unint64_t v18 = v31[v8];
              ++v19;
              if (v18) {
                goto LABEL_18;
              }
            }
          }
          int64_t v8 = v19;
        }
      }
LABEL_18:
      unint64_t v12 = (v18 - 1) & v18;
    }
  }
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_24A1078C4(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_24A0FA334(&qword_26976A3C0);
  uint64_t result = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    uint64_t v30 = v3;
    int64_t v8 = 0;
    uint64_t v9 = (void *)(v5 + 64);
    uint64_t v10 = 1 << *(unsigned char *)(v5 + 32);
    if (v10 < 64) {
      uint64_t v11 = ~(-1 << v10);
    }
    else {
      uint64_t v11 = -1;
    }
    unint64_t v12 = v11 & *(void *)(v5 + 64);
    int64_t v13 = (unint64_t)(v10 + 63) >> 6;
    uint64_t v14 = result + 64;
    if (!v12) {
      goto LABEL_7;
    }
LABEL_6:
    unint64_t v15 = __clz(__rbit64(v12));
    v12 &= v12 - 1;
    for (unint64_t i = v15 | (v8 << 6); ; unint64_t i = __clz(__rbit64(v18)) + (v8 << 6))
    {
      uint64_t v20 = *(void *)(*(void *)(v5 + 48) + 8 * i);
      long long v31 = *(_OWORD *)(*(void *)(v5 + 56) + 16 * i);
      if ((a2 & 1) == 0) {
        sub_24A109F34(v31, *((unint64_t *)&v31 + 1));
      }
      uint64_t result = static Hasher._hash(seed:_:)();
      uint64_t v21 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v22 = result & ~v21;
      unint64_t v23 = v22 >> 6;
      if (((-1 << v22) & ~*(void *)(v14 + 8 * (v22 >> 6))) == 0)
      {
        char v25 = 0;
        unint64_t v26 = (unint64_t)(63 - v21) >> 6;
        while (++v23 != v26 || (v25 & 1) == 0)
        {
          BOOL v27 = v23 == v26;
          if (v23 == v26) {
            unint64_t v23 = 0;
          }
          v25 |= v27;
          uint64_t v28 = *(void *)(v14 + 8 * v23);
          if (v28 != -1)
          {
            unint64_t v24 = __clz(__rbit64(~v28)) + (v23 << 6);
            goto LABEL_30;
          }
        }
        __break(1u);
LABEL_41:
        __break(1u);
LABEL_42:
        __break(1u);
        return result;
      }
      unint64_t v24 = __clz(__rbit64((-1 << v22) & ~*(void *)(v14 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
      *(void *)(v14 + ((v24 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v24;
      *(void *)(*(void *)(v7 + 48) + 8 * v24) = v20;
      *(_OWORD *)(*(void *)(v7 + 56) + 16 * v24) = v31;
      ++*(void *)(v7 + 16);
      if (v12) {
        goto LABEL_6;
      }
LABEL_7:
      int64_t v17 = v8 + 1;
      if (__OFADD__(v8, 1)) {
        goto LABEL_41;
      }
      if (v17 >= v13) {
        goto LABEL_32;
      }
      unint64_t v18 = v9[v17];
      ++v8;
      if (!v18)
      {
        int64_t v8 = v17 + 1;
        if (v17 + 1 >= v13) {
          goto LABEL_32;
        }
        unint64_t v18 = v9[v8];
        if (!v18)
        {
          int64_t v19 = v17 + 2;
          if (v19 >= v13)
          {
LABEL_32:
            if ((a2 & 1) == 0)
            {
              uint64_t result = swift_release();
              uint64_t v3 = v30;
              goto LABEL_39;
            }
            uint64_t v29 = 1 << *(unsigned char *)(v5 + 32);
            if (v29 >= 64) {
              sub_24A107B84(0, (unint64_t)(v29 + 63) >> 6, (void *)(v5 + 64));
            }
            else {
              *uint64_t v9 = -1 << v29;
            }
            uint64_t v3 = v30;
            *(void *)(v5 + 16) = 0;
            break;
          }
          unint64_t v18 = v9[v19];
          if (!v18)
          {
            while (1)
            {
              int64_t v8 = v19 + 1;
              if (__OFADD__(v19, 1)) {
                goto LABEL_42;
              }
              if (v8 >= v13) {
                goto LABEL_32;
              }
              unint64_t v18 = v9[v8];
              ++v19;
              if (v18) {
                goto LABEL_18;
              }
            }
          }
          int64_t v8 = v19;
        }
      }
LABEL_18:
      unint64_t v12 = (v18 - 1) & v18;
    }
  }
  uint64_t result = swift_release();
LABEL_39:
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_24A107B84(uint64_t result, uint64_t a2, void *a3)
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

uint64_t sub_24A107BA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return a2;
}

uint64_t sub_24A107BE0@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_24A107BA0((uint64_t)(a2 + 2), *a1, a1[1], (uint64_t)(a1 + 2));
  *a2 = result;
  a2[1] = v4;
  return result;
}

void sub_24A107C18(uint64_t a1, char a2, void *a3)
{
  uint64_t v45 = a3;
  uint64_t v6 = type metadata accessor for Asset();
  sub_24A10A3B0();
  uint64_t v8 = v7;
  MEMORY[0x270FA5388](v9);
  uint64_t v44 = (char *)v38 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_24A0FA334(&qword_26976A3A8);
  uint64_t v12 = MEMORY[0x270FA5388](v11);
  unint64_t v15 = (void *)((char *)v38 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v16 = *(void *)(a1 + 16);
  if (!v16)
  {
    swift_bridgeObjectRelease();
    return;
  }
  v38[0] = v3;
  v38[1] = a1;
  char v42 = (char *)v15 + *(int *)(v12 + 48);
  uint64_t v17 = a1 + ((*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80));
  uint64_t v39 = *(void *)(v13 + 72);
  char v43 = (void (**)(char *, char *, uint64_t))(v8 + 32);
  swift_bridgeObjectRetain();
  uint64_t v40 = v6;
  uint64_t v41 = v8;
  while (1)
  {
    sub_24A10A1AC(v17, (uint64_t)v15, &qword_26976A3A8);
    unint64_t v18 = v15;
    uint64_t v49 = *v15;
    uint64_t v19 = v49;
    uint64_t v20 = *v43;
    (*v43)(v44, v42, v6);
    uint64_t v21 = (void *)*v45;
    unint64_t v22 = sub_24A106698(v19);
    uint64_t v24 = sub_24A10ABD4(v22, v23);
    if (v26)
    {
      __break(1u);
LABEL_18:
      __break(1u);
LABEL_19:
      KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
      __break(1u);
      goto LABEL_20;
    }
    char v27 = v25;
    if (v21[3] < v24) {
      break;
    }
    if (a2)
    {
      if (v25) {
        goto LABEL_14;
      }
    }
    else
    {
      sub_24A0FA334(&qword_26976A3B0);
      _NativeDictionary.copy()();
      if (v27) {
        goto LABEL_14;
      }
    }
LABEL_10:
    uint64_t v30 = v44;
    long long v31 = (void *)*v45;
    *(void *)(*v45 + 8 * (v22 >> 6) + 64) |= 1 << v22;
    *(void *)(v31[6] + 8 * v22) = v19;
    unint64_t v32 = v31[7] + *(void *)(v41 + 72) * v22;
    uint64_t v6 = v40;
    v20((char *)v32, v30, v40);
    sub_24A10ABC8();
    if (v26) {
      goto LABEL_18;
    }
    v31[2] = v33;
    v17 += v39;
    a2 = 1;
    --v16;
    unint64_t v15 = v18;
    if (!v16)
    {
      swift_bridgeObjectRelease_n();
      return;
    }
  }
  sub_24A106C90(v24, a2 & 1, MEMORY[0x263F32188], &qword_26976A3A0);
  unint64_t v28 = sub_24A106698(v19);
  if ((v27 & 1) != (v29 & 1)) {
    goto LABEL_19;
  }
  unint64_t v22 = v28;
  if ((v27 & 1) == 0) {
    goto LABEL_10;
  }
LABEL_14:
  int64_t v34 = (void *)swift_allocError();
  swift_willThrow();
  id v48 = v34;
  id v35 = v34;
  sub_24A0FA334(&qword_26976A248);
  if ((swift_dynamicCast() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v41 + 8))(v44, v40);
    swift_bridgeObjectRelease();

    return;
  }
LABEL_20:
  uint64_t v46 = 0;
  unint64_t v47 = 0xE000000000000000;
  _StringGuts.grow(_:)(30);
  v36._object = (void *)0x800000024A11D5B0;
  v36._countAndFlagsBits = 0xD00000000000001BLL;
  String.append(_:)(v36);
  _print_unlocked<A, B>(_:_:)();
  v37._countAndFlagsBits = 39;
  v37._object = (void *)0xE100000000000000;
  String.append(_:)(v37);
  sub_24A10A6EC();
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void sub_24A108040(uint64_t a1, char a2, void *a3)
{
  uint64_t v45 = a3;
  uint64_t v6 = type metadata accessor for AssetUploadRequest();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v44 = (char *)v38 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_24A0FA334(&qword_26976A3E8);
  uint64_t v10 = MEMORY[0x270FA5388](v9);
  uint64_t v13 = (void *)((char *)v38 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v14 = *(void *)(a1 + 16);
  if (!v14)
  {
    swift_bridgeObjectRelease();
    return;
  }
  v38[0] = v3;
  v38[1] = a1;
  char v42 = (char *)v13 + *(int *)(v10 + 48);
  uint64_t v15 = a1 + ((*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80));
  uint64_t v39 = *(void *)(v11 + 72);
  char v43 = (void (**)(char *, char *, uint64_t))(v7 + 32);
  swift_bridgeObjectRetain();
  uint64_t v40 = v6;
  uint64_t v41 = v7;
  while (1)
  {
    sub_24A10A1AC(v15, (uint64_t)v13, &qword_26976A3E8);
    uint64_t v16 = v13;
    uint64_t v49 = *v13;
    uint64_t v17 = v49;
    unint64_t v18 = *v43;
    (*v43)(v44, v42, v6);
    uint64_t v19 = (void *)*v45;
    unint64_t v21 = sub_24A106698(v17);
    uint64_t v22 = v19[2];
    BOOL v23 = (v20 & 1) == 0;
    uint64_t v24 = v22 + v23;
    if (__OFADD__(v22, v23))
    {
      __break(1u);
LABEL_18:
      __break(1u);
LABEL_19:
      KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
      __break(1u);
      goto LABEL_20;
    }
    char v25 = v20;
    if (v19[3] < v24) {
      break;
    }
    if (a2)
    {
      if (v20) {
        goto LABEL_14;
      }
    }
    else
    {
      sub_24A0FA334(&qword_26976A3F0);
      _NativeDictionary.copy()();
      if (v25) {
        goto LABEL_14;
      }
    }
LABEL_10:
    unint64_t v28 = v44;
    char v29 = (void *)*v45;
    *(void *)(*v45 + 8 * (v21 >> 6) + 64) |= 1 << v21;
    *(void *)(v29[6] + 8 * v21) = v17;
    unint64_t v30 = v29[7] + *(void *)(v41 + 72) * v21;
    uint64_t v6 = v40;
    v18((char *)v30, v28, v40);
    uint64_t v31 = v29[2];
    BOOL v32 = __OFADD__(v31, 1);
    uint64_t v33 = v31 + 1;
    if (v32) {
      goto LABEL_18;
    }
    v29[2] = v33;
    v15 += v39;
    a2 = 1;
    --v14;
    uint64_t v13 = v16;
    if (!v14)
    {
      swift_bridgeObjectRelease_n();
      return;
    }
  }
  sub_24A106C90(v24, a2 & 1, MEMORY[0x263F32198], &qword_26976A3E0);
  unint64_t v26 = sub_24A106698(v17);
  if ((v25 & 1) != (v27 & 1)) {
    goto LABEL_19;
  }
  unint64_t v21 = v26;
  if ((v25 & 1) == 0) {
    goto LABEL_10;
  }
LABEL_14:
  int64_t v34 = (void *)swift_allocError();
  swift_willThrow();
  id v48 = v34;
  id v35 = v34;
  sub_24A0FA334(&qword_26976A248);
  if ((swift_dynamicCast() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v41 + 8))(v44, v40);
    swift_bridgeObjectRelease();

    return;
  }
LABEL_20:
  uint64_t v46 = 0;
  unint64_t v47 = 0xE000000000000000;
  _StringGuts.grow(_:)(30);
  v36._object = (void *)0x800000024A11D5B0;
  v36._countAndFlagsBits = 0xD00000000000001BLL;
  String.append(_:)(v36);
  _print_unlocked<A, B>(_:_:)();
  v37._countAndFlagsBits = 39;
  v37._object = (void *)0xE100000000000000;
  String.append(_:)(v37);
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

uint64_t sub_24A1084A4(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t *a5)
{
  sub_24A109C74(a1, &v29);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_24A109C9C(&v27);
  uint64_t v7 = *((void *)&v27 + 1);
  if (!*((void *)&v27 + 1))
  {
LABEL_14:
    swift_release();
    swift_bridgeObjectRelease();
    sub_24A10A080();
    return swift_release();
  }
  while (1)
  {
    uint64_t v8 = v27;
    sub_24A0FAFF4(&v28, v26);
    uint64_t v9 = *a5;
    unint64_t v10 = sub_24A106774();
    uint64_t v12 = sub_24A10ABD4(v10, v11);
    if (v14) {
      break;
    }
    char v15 = v13;
    if (*(void *)(v9 + 24) >= v12)
    {
      if (a4)
      {
        if (v13) {
          goto LABEL_9;
        }
      }
      else
      {
        sub_24A0FA334(&qword_26976A1A8);
        _NativeDictionary.copy()();
        if (v15) {
          goto LABEL_9;
        }
      }
    }
    else
    {
      sub_24A107364(v12, a4 & 1);
      unint64_t v16 = sub_24A106774();
      if ((v15 & 1) != (v17 & 1)) {
        goto LABEL_17;
      }
      unint64_t v10 = v16;
      if (v15)
      {
LABEL_9:
        sub_24A105FE4(*(void *)(*a5 + 56) + 32 * v10, (uint64_t)v24);
        sub_24A105FE4((uint64_t)v24, (uint64_t)v25);
        sub_24A0FAFA4((uint64_t)v24);
        sub_24A0FAFA4((uint64_t)v26);
        swift_bridgeObjectRelease();
        unint64_t v18 = (_OWORD *)(*(void *)(*a5 + 56) + 32 * v10);
        sub_24A0FAFA4((uint64_t)v18);
        sub_24A0FAFF4(v25, v18);
        goto LABEL_13;
      }
    }
    uint64_t v19 = (void *)*a5;
    *(void *)(*a5 + 8 * (v10 >> 6) + 64) |= 1 << v10;
    char v20 = (void *)(v19[6] + 16 * v10);
    *char v20 = v8;
    v20[1] = v7;
    sub_24A0FAFF4(v26, (_OWORD *)(v19[7] + 32 * v10));
    uint64_t v21 = v19[2];
    BOOL v14 = __OFADD__(v21, 1);
    uint64_t v22 = v21 + 1;
    if (v14) {
      goto LABEL_16;
    }
    v19[2] = v22;
LABEL_13:
    sub_24A109C9C(&v27);
    uint64_t v7 = *((void *)&v27 + 1);
    a4 = 1;
    if (!*((void *)&v27 + 1)) {
      goto LABEL_14;
    }
  }
  __break(1u);
LABEL_16:
  __break(1u);
LABEL_17:
  uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
  return result;
}

void sub_24A1086D0(uint64_t a1, char a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
    swift_bridgeObjectRelease();
    return;
  }
  uint64_t v6 = a1 + 32;
  swift_bridgeObjectRetain();
  while (1)
  {
    sub_24A10A1AC(v6, (uint64_t)&v26, &qword_26976A378);
    uint64_t v7 = v26;
    uint64_t v28 = v26;
    sub_24A10A130(&v27, (uint64_t)v25);
    uint64_t v8 = (void *)*a3;
    unint64_t v10 = sub_24A106698(v7);
    uint64_t v11 = v8[2];
    BOOL v12 = (v9 & 1) == 0;
    uint64_t v13 = v11 + v12;
    if (__OFADD__(v11, v12))
    {
      __break(1u);
LABEL_18:
      __break(1u);
LABEL_19:
      KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
      __break(1u);
      goto LABEL_20;
    }
    char v14 = v9;
    if (v8[3] < v13) {
      break;
    }
    if (a2)
    {
      if (v9) {
        goto LABEL_14;
      }
    }
    else
    {
      sub_24A0FA334(&qword_26976A380);
      _NativeDictionary.copy()();
      if (v14) {
        goto LABEL_14;
      }
    }
LABEL_10:
    char v17 = (void *)*a3;
    *(void *)(*a3 + 8 * (v10 >> 6) + 64) |= 1 << v10;
    *(void *)(v17[6] + 8 * v10) = v7;
    sub_24A10A130(v25, v17[7] + 40 * v10);
    uint64_t v18 = v17[2];
    BOOL v19 = __OFADD__(v18, 1);
    uint64_t v20 = v18 + 1;
    if (v19) {
      goto LABEL_18;
    }
    void v17[2] = v20;
    v6 += 48;
    a2 = 1;
    if (!--v3)
    {
      swift_bridgeObjectRelease_n();
      return;
    }
  }
  sub_24A107600(v13, a2 & 1);
  unint64_t v15 = sub_24A106698(v7);
  if ((v14 & 1) != (v16 & 1)) {
    goto LABEL_19;
  }
  unint64_t v10 = v15;
  if ((v14 & 1) == 0) {
    goto LABEL_10;
  }
LABEL_14:
  uint64_t v21 = (void *)swift_allocError();
  swift_willThrow();
  id v22 = v21;
  sub_24A0FA334(&qword_26976A248);
  if ((swift_dynamicCast() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    sub_24A0FAFA4((uint64_t)v25);
    swift_bridgeObjectRelease();

    return;
  }
LABEL_20:
  _StringGuts.grow(_:)(30);
  v23._object = (void *)0x800000024A11D5B0;
  v23._countAndFlagsBits = 0xD00000000000001BLL;
  String.append(_:)(v23);
  _print_unlocked<A, B>(_:_:)();
  v24._countAndFlagsBits = 39;
  v24._object = (void *)0xE100000000000000;
  String.append(_:)(v24);
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void sub_24A1089AC(uint64_t a1, char a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 16);
  swift_bridgeObjectRetain();
  if (!v4)
  {
LABEL_18:
    swift_bridgeObjectRelease_n();
    return;
  }
  unint64_t v5 = 0;
  uint64_t v6 = (unint64_t *)(a1 + 48);
  while (1)
  {
    if (v5 >= *(void *)(a1 + 16))
    {
      __break(1u);
LABEL_21:
      __break(1u);
LABEL_22:
      __break(1u);
LABEL_23:
      KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
      __break(1u);
      goto LABEL_24;
    }
    uint64_t v8 = *(v6 - 1);
    unint64_t v7 = *v6;
    uint64_t v9 = *(v6 - 2);
    sub_24A109F34(v8, *v6);
    if (v7 >> 60 == 15) {
      goto LABEL_18;
    }
    unint64_t v10 = (void *)*a3;
    unint64_t v12 = sub_24A106698(v9);
    uint64_t v13 = v10[2];
    BOOL v14 = (v11 & 1) == 0;
    uint64_t v15 = v13 + v14;
    if (__OFADD__(v13, v14)) {
      goto LABEL_21;
    }
    char v16 = v11;
    if (v10[3] < v15) {
      break;
    }
    if (a2)
    {
      if (v11) {
        goto LABEL_16;
      }
    }
    else
    {
      sub_24A0FA334(&qword_26976A3C8);
      _NativeDictionary.copy()();
      if (v16) {
        goto LABEL_16;
      }
    }
LABEL_12:
    BOOL v19 = (void *)*a3;
    *(void *)(*a3 + 8 * (v12 >> 6) + 64) |= 1 << v12;
    *(void *)(v19[6] + 8 * v12) = v9;
    uint64_t v20 = (uint64_t *)(v19[7] + 16 * v12);
    *uint64_t v20 = v8;
    v20[1] = v7;
    uint64_t v21 = v19[2];
    BOOL v22 = __OFADD__(v21, 1);
    uint64_t v23 = v21 + 1;
    if (v22) {
      goto LABEL_22;
    }
    ++v5;
    v19[2] = v23;
    v6 += 3;
    a2 = 1;
    if (v4 == v5) {
      goto LABEL_18;
    }
  }
  sub_24A1078C4(v15, a2 & 1);
  unint64_t v17 = sub_24A106698(v9);
  if ((v16 & 1) != (v18 & 1)) {
    goto LABEL_23;
  }
  unint64_t v12 = v17;
  if ((v16 & 1) == 0) {
    goto LABEL_12;
  }
LABEL_16:
  Swift::String v24 = (void *)swift_allocError();
  swift_willThrow();
  id v25 = v24;
  sub_24A0FA334(&qword_26976A248);
  if ((swift_dynamicCast() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    sub_24A0FA8D8(v8, v7);
    swift_bridgeObjectRelease();

    return;
  }
LABEL_24:
  _StringGuts.grow(_:)(30);
  v26._object = (void *)0x800000024A11D5B0;
  v26._countAndFlagsBits = 0xD00000000000001BLL;
  String.append(_:)(v26);
  _print_unlocked<A, B>(_:_:)();
  v27._countAndFlagsBits = 39;
  v27._object = (void *)0xE100000000000000;
  String.append(_:)(v27);
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void sub_24A108C9C()
{
  sub_24A109560();
  *uint64_t v0 = v1;
}

void sub_24A108CEC(char a1, uint64_t a2, char a3)
{
  sub_24A108FDC(a1, a2, a3, *v3, &qword_26976A3B8, &qword_26976A3A8);
  *uint64_t v3 = v4;
}

void sub_24A108D1C(char a1, uint64_t a2, char a3)
{
  sub_24A108FDC(a1, a2, a3, *v3, &qword_26976A3F8, &qword_26976A3E8);
  *uint64_t v3 = v4;
}

void sub_24A108D4C(char a1, uint64_t a2, char a3)
{
  sub_24A108FDC(a1, a2, a3, *v3, &qword_26976A438, &qword_26976A440);
  *uint64_t v3 = v4;
}

void sub_24A108D7C(char a1, uint64_t a2, char a3)
{
  sub_24A109120(a1, a2, a3, *v3, &qword_26976A2D0);
  *uint64_t v3 = v4;
}

void sub_24A108DA4()
{
  sub_24A1091D4();
  *uint64_t v0 = v1;
}

void sub_24A108DF4(char a1, uint64_t a2, char a3)
{
  sub_24A109120(a1, a2, a3, *v3, &qword_26976A2C8);
  *uint64_t v3 = v4;
}

void sub_24A108E1C()
{
  sub_24A1091D4();
  *uint64_t v0 = v1;
}

char *sub_24A108E6C(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_24A1092A4(a1, a2, a3, *v3);
  *uint64_t v3 = (uint64_t)result;
  return result;
}

char *sub_24A108E8C(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_24A109388(a1, a2, a3, *v3);
  *uint64_t v3 = (uint64_t)result;
  return result;
}

void sub_24A108EAC(char a1, uint64_t a2, char a3)
{
  sub_24A109624(a1, a2, a3, *v3, &qword_26976A360, MEMORY[0x263F32188]);
  *uint64_t v3 = v4;
}

char *sub_24A108EEC(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_24A109474(a1, a2, a3, *v3);
  *uint64_t v3 = (uint64_t)result;
  return result;
}

void sub_24A108F0C()
{
  sub_24A109560();
  *uint64_t v0 = v1;
}

void sub_24A108F5C(char a1, uint64_t a2, char a3)
{
  sub_24A109624(a1, a2, a3, *v3, &qword_26976A280, MEMORY[0x263F321B0]);
  *uint64_t v3 = v4;
}

char *sub_24A108F9C(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_24A109794(a1, a2, a3, *v3);
  *uint64_t v3 = (uint64_t)result;
  return result;
}

char *sub_24A108FBC(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_24A109878(a1, a2, a3, *v3);
  *uint64_t v3 = (uint64_t)result;
  return result;
}

void sub_24A108FDC(char a1, uint64_t a2, char a3, uint64_t a4, uint64_t *a5, uint64_t *a6)
{
  if (a3)
  {
    sub_24A10A43C();
    if (v10 != v11)
    {
      sub_24A10A664();
      if (v10)
      {
LABEL_24:
        __break(1u);
        return;
      }
      sub_24A10A42C();
    }
  }
  else
  {
    uint64_t v9 = a2;
  }
  uint64_t v12 = *(void *)(a4 + 16);
  if (v9 <= v12) {
    uint64_t v13 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v13 = v9;
  }
  if (!v13)
  {
    BOOL v19 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_18;
  }
  sub_24A0FA334(a5);
  uint64_t v14 = sub_24A0FA334(a6);
  sub_24A0FB024(v14);
  uint64_t v16 = *(void *)(v15 + 72);
  unint64_t v18 = (*(unsigned __int8 *)(v17 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80);
  BOOL v19 = (void *)swift_allocObject();
  size_t v20 = j__malloc_size(v19);
  if (!v16)
  {
    __break(1u);
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  if (v20 - v18 == 0x8000000000000000 && v16 == -1) {
    goto LABEL_23;
  }
  v19[2] = v12;
  v19[3] = 2 * ((uint64_t)(v20 - v18) / v16);
LABEL_18:
  uint64_t v22 = sub_24A0FA334(a6);
  sub_24A10A560(v22);
  sub_24A10AB7C();
  uint64_t v24 = a4 + v23;
  if (a1)
  {
    sub_24A1052F8(v24, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_24A0FE01C(v24, v12, (unint64_t)v19 + v23);
  }
  swift_release();
}

void sub_24A109120(char a1, uint64_t a2, char a3, uint64_t a4, uint64_t *a5)
{
  if (a3)
  {
    sub_24A10A43C();
    if (v8 != v9)
    {
      sub_24A10A664();
      if (v8)
      {
        __break(1u);
        return;
      }
      sub_24A10A42C();
    }
  }
  else
  {
    uint64_t v7 = a2;
  }
  uint64_t v10 = *(void *)(a4 + 16);
  if (v7 <= v10) {
    uint64_t v11 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v11 = v7;
  }
  if (v11)
  {
    sub_24A0FA334(a5);
    uint64_t v12 = (char *)sub_24A10A7EC();
    size_t v13 = j__malloc_size(v12);
    sub_24A10A7D4(v13);
  }
  else
  {
    uint64_t v12 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v14 = v12 + 32;
  uint64_t v15 = (char *)(a4 + 32);
  if (a1)
  {
    sub_24A105470(v15, v10, v14);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_24A0FE1C0(v15, v10, v14);
  }
  swift_release();
}

void sub_24A1091D4()
{
  sub_24A10ABB4();
  if (v6)
  {
    sub_24A10A43C();
    if (v8 != v9)
    {
      sub_24A10A664();
      if (v8)
      {
        __break(1u);
        return;
      }
      sub_24A10A42C();
    }
  }
  else
  {
    uint64_t v7 = v4;
  }
  uint64_t v10 = *(void *)(v0 + 16);
  if (v7 <= v10) {
    uint64_t v11 = *(void *)(v0 + 16);
  }
  else {
    uint64_t v11 = v7;
  }
  if (v11)
  {
    sub_24A0FA334(v5);
    uint64_t v12 = (void *)sub_24A10A7EC();
    size_t v13 = j__malloc_size(v12);
    v12[2] = v10;
    v12[3] = 2 * ((uint64_t)(v13 - 32) / 16);
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x263F8EE78];
  }
  uint64_t v14 = v12 + 4;
  uint64_t v15 = v0 + 32;
  if (v3)
  {
    v2(v15, v10, v14);
    *(void *)(v0 + 16) = 0;
  }
  else
  {
    v1(v15, v10, v14);
  }
  swift_release();
}

char *sub_24A1092A4(char *result, int64_t a2, char a3, uint64_t a4)
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
    sub_24A0FA334(&qword_26976A330);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 4);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  size_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_24A105578(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_24A0FE3F4(v13, v8, v12);
  }
  swift_release();
  return v10;
}

char *sub_24A109388(char *result, int64_t a2, char a3, uint64_t a4)
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
    sub_24A0FA334(&qword_26976A348);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  size_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_24A10560C(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_24A0FE4D0((unint64_t)v13, v8, (unint64_t)v12);
  }
  swift_release();
  return v10;
}

char *sub_24A109474(char *result, int64_t a2, char a3, uint64_t a4)
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
    sub_24A0FA334(&qword_26976A388);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 48);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  size_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_24A1056A8(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_24A0FE5D4((unint64_t)v13, v8, (unint64_t)v12);
  }
  swift_release();
  return v10;
}

void sub_24A109560()
{
  sub_24A10ABB4();
  if (v6)
  {
    sub_24A10A43C();
    if (v8 != v9)
    {
      sub_24A10A664();
      if (v8)
      {
        __break(1u);
        return;
      }
      sub_24A10A42C();
    }
  }
  else
  {
    uint64_t v7 = v4;
  }
  uint64_t v10 = *(void *)(v0 + 16);
  if (v7 <= v10) {
    uint64_t v11 = *(void *)(v0 + 16);
  }
  else {
    uint64_t v11 = v7;
  }
  if (v11)
  {
    sub_24A0FA334(v5);
    uint64_t v12 = (void *)sub_24A10A7EC();
    j__malloc_size(v12);
    sub_24A10A9AC();
    v12[2] = v10;
    v12[3] = v13;
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x263F8EE78];
  }
  uint64_t v14 = v12 + 4;
  uint64_t v15 = v0 + 32;
  if (v3)
  {
    v2(v15, v10, v14);
    *(void *)(v0 + 16) = 0;
  }
  else
  {
    v1(v15, v10, v14);
  }
  swift_release();
}

void sub_24A109624(char a1, uint64_t a2, char a3, uint64_t a4, uint64_t *a5, uint64_t (*a6)(uint64_t))
{
  if (a3)
  {
    sub_24A10A43C();
    if (v10 != v11)
    {
      sub_24A10A664();
      if (v10)
      {
LABEL_24:
        __break(1u);
        return;
      }
      sub_24A10A42C();
    }
  }
  else
  {
    uint64_t v9 = a2;
  }
  uint64_t v12 = *(void *)(a4 + 16);
  if (v9 <= v12) {
    uint64_t v13 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v13 = v9;
  }
  if (!v13)
  {
    size_t v20 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_18;
  }
  sub_24A0FA334(a5);
  uint64_t v14 = sub_24A10A934();
  uint64_t v15 = a6(v14);
  sub_24A0FB024(v15);
  uint64_t v17 = *(void *)(v16 + 72);
  unint64_t v19 = (*(unsigned __int8 *)(v18 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80);
  size_t v20 = (void *)swift_allocObject();
  size_t v21 = j__malloc_size(v20);
  if (!v17)
  {
    __break(1u);
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  if (v21 - v19 == 0x8000000000000000 && v17 == -1) {
    goto LABEL_23;
  }
  void v20[2] = v12;
  v20[3] = 2 * ((uint64_t)(v21 - v19) / v17);
LABEL_18:
  uint64_t v23 = sub_24A10A934();
  a6(v23);
  sub_24A10AB7C();
  uint64_t v25 = a4 + v24;
  if (a1)
  {
    sub_24A105744(v25, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_24A0FE7B4(v25, v12, (unint64_t)v20 + v24);
  }
  swift_release();
}

char *sub_24A109794(char *result, int64_t a2, char a3, uint64_t a4)
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
    sub_24A0FA334(&qword_26976A430);
    char v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 32);
  }
  else
  {
    char v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_24A1054E4(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_24A0FE878(v13, v8, v12);
  }
  swift_release();
  return v10;
}

char *sub_24A109878(char *result, int64_t a2, char a3, uint64_t a4)
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
    sub_24A0FA334(&qword_26976A3D0);
    char v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    char v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_24A105828(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_24A0FE954((unint64_t)v13, v8, (unint64_t)v12);
  }
  swift_release();
  return v10;
}

void *sub_24A109968(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (void *)MEMORY[0x263F8EE78];
  }
  sub_24A0FA334(&qword_26976A398);
  char v3 = (void *)sub_24A10A7EC();
  j__malloc_size(v3);
  sub_24A10A9AC();
  v3[2] = v1;
  v3[3] = v4;
  char v5 = sub_24A109AE0(&v7, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_24A10A080();
  if (v5 != (void *)v1)
  {
    __break(1u);
    return (void *)MEMORY[0x263F8EE78];
  }
  return v3;
}

uint64_t sub_24A109A3C(uint64_t result, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  if (a2 < 0 || 1 << *(unsigned char *)(a5 + 32) <= a2)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (((*(void *)(a5 + 8 * ((unint64_t)a2 >> 6) + 64) >> a2) & 1) == 0)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (*(_DWORD *)(a5 + 36) == a3)
  {
    uint64_t v5 = *(void *)(*(void *)(a5 + 48) + 8 * a2);
    sub_24A10A148(*(void *)(a5 + 56) + 40 * a2, result);
    return v5;
  }
LABEL_8:
  __break(1u);
  return result;
}

uint64_t sub_24A109ABC@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t result = sub_24A10AB10(a1, a2);
  if (v8 != v9) {
    uint64_t v5 = ~v7;
  }
  v3[1] = result;
  v3[2] = ~v4;
  v3[3] = 0;
  v3[4] = v5 & v6;
  return result;
}

void *sub_24A109AE0(void *result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4 + 64;
  uint64_t v5 = -1;
  uint64_t v6 = -1 << *(unsigned char *)(a4 + 32);
  if (-v6 < 64) {
    uint64_t v5 = ~(-1 << -(char)v6);
  }
  unint64_t v7 = v5 & *(void *)(a4 + 64);
  if (!a2)
  {
    int64_t v8 = 0;
    a3 = 0;
LABEL_36:
    *uint64_t result = a4;
    result[1] = v4;
    result[2] = ~v6;
    result[3] = v8;
    result[4] = v7;
    return (void *)a3;
  }
  if (!a3)
  {
    int64_t v8 = 0;
    goto LABEL_36;
  }
  if (a3 < 0)
  {
LABEL_38:
    __break(1u);
    goto LABEL_39;
  }
  int64_t v8 = 0;
  uint64_t v9 = 0;
  int64_t v10 = (unint64_t)(63 - v6) >> 6;
  while (v7)
  {
    unint64_t v11 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    unint64_t v12 = v11 | (v8 << 6);
LABEL_19:
    ++v9;
    *a2++ = *(void *)(*(void *)(a4 + 48) + 8 * v12);
    if (v9 == a3) {
      goto LABEL_36;
    }
  }
  int64_t v13 = v8 + 1;
  if (__OFADD__(v8, 1))
  {
    __break(1u);
    goto LABEL_38;
  }
  if (v13 >= v10) {
    goto LABEL_31;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v13);
  if (v14) {
    goto LABEL_18;
  }
  v8 += 2;
  if (v13 + 1 >= v10)
  {
    unint64_t v7 = 0;
    int64_t v8 = v13;
    goto LABEL_35;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v8);
  if (v14)
  {
LABEL_14:
    int64_t v13 = v8;
LABEL_18:
    unint64_t v16 = __clz(__rbit64(v14));
    unint64_t v7 = (v14 - 1) & v14;
    unint64_t v12 = v16 + (v13 << 6);
    int64_t v8 = v13;
    goto LABEL_19;
  }
  int64_t v15 = v13 + 2;
  if (v13 + 2 >= v10) {
    goto LABEL_31;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v15);
  if (v14)
  {
LABEL_17:
    int64_t v13 = v15;
    goto LABEL_18;
  }
  int64_t v8 = v13 + 3;
  if (v13 + 3 >= v10)
  {
    unint64_t v7 = 0;
    int64_t v8 = v13 + 2;
    goto LABEL_35;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v8);
  if (v14) {
    goto LABEL_14;
  }
  int64_t v15 = v13 + 4;
  if (v13 + 4 >= v10)
  {
LABEL_31:
    unint64_t v7 = 0;
LABEL_35:
    a3 = v9;
    goto LABEL_36;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v15);
  if (v14) {
    goto LABEL_17;
  }
  while (1)
  {
    int64_t v13 = v15 + 1;
    if (__OFADD__(v15, 1)) {
      break;
    }
    if (v13 >= v10)
    {
      unint64_t v7 = 0;
      int64_t v8 = v10 - 1;
      goto LABEL_35;
    }
    unint64_t v14 = *(void *)(v4 + 8 * v13);
    ++v15;
    if (v14) {
      goto LABEL_18;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_24A109C74@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t result = sub_24A10AB10(a1, a2);
  v5[1] = result;
  v5[2] = ~v9;
  if (v10 != v11) {
    uint64_t v12 = ~v8;
  }
  else {
    uint64_t v12 = v6;
  }
  v5[3] = 0;
  v5[4] = v12 & v7;
  v5[5] = v3;
  v5[6] = v4;
  return result;
}

uint64_t sub_24A109C9C@<X0>(_OWORD *a1@<X8>)
{
  uint64_t v3 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v6 = v1[2];
  int64_t v5 = v1[3];
  int64_t v7 = v5;
  unint64_t v8 = v1[4];
  if (v8)
  {
    uint64_t v9 = (v8 - 1) & v8;
    unint64_t v10 = __clz(__rbit64(v8)) | (v5 << 6);
LABEL_3:
    char v11 = (uint64_t *)(*(void *)(v3 + 48) + 16 * v10);
    uint64_t v13 = *v11;
    uint64_t v12 = v11[1];
    sub_24A105FE4(*(void *)(v3 + 56) + 32 * v10, (uint64_t)v24);
    *(void *)&long long v23 = v13;
    *((void *)&v23 + 1) = v12;
    swift_bridgeObjectRetain();
    goto LABEL_23;
  }
  int64_t v14 = v5 + 1;
  if (__OFADD__(v5, 1))
  {
    __break(1u);
    return result;
  }
  int64_t v15 = (unint64_t)(v6 + 64) >> 6;
  if (v14 < v15)
  {
    unint64_t v16 = *(void *)(v4 + 8 * v14);
    if (v16)
    {
LABEL_7:
      uint64_t v9 = (v16 - 1) & v16;
      unint64_t v10 = __clz(__rbit64(v16)) + (v14 << 6);
      int64_t v7 = v14;
      goto LABEL_3;
    }
    int64_t v17 = v5 + 2;
    int64_t v7 = v5 + 1;
    if (v5 + 2 < v15)
    {
      unint64_t v16 = *(void *)(v4 + 8 * v17);
      if (v16)
      {
LABEL_10:
        int64_t v14 = v17;
        goto LABEL_7;
      }
      int64_t v7 = v5 + 2;
      if (v5 + 3 < v15)
      {
        unint64_t v16 = *(void *)(v4 + 8 * (v5 + 3));
        if (v16)
        {
          int64_t v14 = v5 + 3;
          goto LABEL_7;
        }
        int64_t v17 = v5 + 4;
        int64_t v7 = v5 + 3;
        if (v5 + 4 < v15)
        {
          unint64_t v16 = *(void *)(v4 + 8 * v17);
          if (v16) {
            goto LABEL_10;
          }
          int64_t v14 = v5 + 5;
          int64_t v7 = v5 + 4;
          if (v5 + 5 < v15)
          {
            unint64_t v16 = *(void *)(v4 + 8 * v14);
            if (v16) {
              goto LABEL_7;
            }
            int64_t v7 = v15 - 1;
            int64_t v18 = v5 + 6;
            while (v18 < v15)
            {
              unint64_t v16 = *(void *)(v4 + 8 * v18++);
              if (v16)
              {
                int64_t v14 = v18 - 1;
                goto LABEL_7;
              }
            }
          }
        }
      }
    }
  }
  uint64_t v9 = 0;
  memset(v24, 0, sizeof(v24));
  long long v23 = 0u;
LABEL_23:
  *uint64_t v1 = v3;
  v1[1] = v4;
  v1[2] = v6;
  v1[3] = v7;
  v1[4] = v9;
  unint64_t v19 = (void (*)(_OWORD *))v1[5];
  uint64_t result = sub_24A10A088((uint64_t)&v23, (uint64_t)v22, &qword_26976A310);
  if (*((void *)&v22[0] + 1))
  {
    v21[0] = v22[0];
    v21[1] = v22[1];
    v21[2] = v22[2];
    v19(v21);
    return sub_24A10A26C((uint64_t)v21, &qword_26976A318);
  }
  else
  {
    a1[1] = 0u;
    a1[2] = 0u;
    *a1 = 0u;
  }
  return result;
}

uint64_t sub_24A109E88(uint64_t *a1, uint64_t *a2)
{
  return sub_24A1045B4(*a1, a1[1], *a2, a2[1]) & 1;
}

uint64_t sub_24A109EB4(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 64);
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
  unint64_t v1 = *(void *)(a1 + 72);
  if (v1)
  {
    uint64_t v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  uint64_t v2 = 64;
  for (uint64_t i = 10; i - 8 < (unint64_t)(v3 + 63) >> 6; ++i)
  {
    unint64_t v1 = *(void *)(a1 + 8 * i);
    v2 += 64;
    if (v1) {
      return __clz(__rbit64(v1)) + v2;
    }
  }
  return v3;
}

uint64_t sub_24A109F34(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_retain();
  }
  return swift_retain();
}

void *sub_24A109F8C(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_24A109FD0()
{
  sub_24A10A574();
  return sub_24A101490(v0, v1, v2, v3, v4, v5, v6, v7, v9, v10);
}

uint64_t sub_24A109FF4()
{
  sub_24A10A574();
  return sub_24A101664(v0, v1, v2, v3, v4, v5, v6, v7, v9, v10, v11);
}

uint64_t sub_24A10A018(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24A0FA334(&qword_26976A288);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_24A10A080()
{
  return swift_release();
}

uint64_t sub_24A10A088(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  sub_24A0FA334(a3);
  sub_24A10A3CC();
  (*(void (**)(uint64_t, uint64_t))(v5 + 32))(a2, a1);
  return a2;
}

unint64_t sub_24A10A0E4()
{
  unint64_t result = qword_26976A338;
  if (!qword_26976A338)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26976A338);
  }
  return result;
}

uint64_t sub_24A10A130(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_24A10A148(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_24A10A1AC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  sub_24A0FA334(a3);
  sub_24A10A3CC();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(a2, a1);
  return a2;
}

uint64_t *sub_24A10A208(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_24A10A26C(uint64_t a1, uint64_t *a2)
{
  sub_24A0FA334(a2);
  sub_24A10A3CC();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

unint64_t sub_24A10A2C0()
{
  unint64_t result = qword_26976A418;
  if (!qword_26976A418)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26976A418);
  }
  return result;
}

uint64_t sub_24A10A300(uint64_t *a1)
{
  return sub_24A109E88(a1, *(uint64_t **)(v1 + 16)) & 1;
}

uint64_t sub_24A10A320()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_24A10A330(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_24A10A378(uint64_t *a1)
{
  return sub_24A10A300(a1) & 1;
}

void sub_24A10A3DC()
{
  JUMPOUT(0x24C5BCA40);
}

void sub_24A10A3F4()
{
  *(void *)(v0 + 64) = 0;
}

uint64_t sub_24A10A44C()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_24A10A4A4()
{
  return v0;
}

void sub_24A10A4E4(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
}

uint64_t sub_24A10A53C()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_24A10A560(uint64_t a1)
{
  return a1 - 8;
}

__n128 sub_24A10A574()
{
  return *(__n128 *)(v0 + 72);
}

uint64_t sub_24A10A5A4()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

void *sub_24A10A5BC()
{
  *uint64_t v0 = *v1;
  return v0;
}

void sub_24A10A5E0(uint64_t a1@<X8>)
{
  *(void *)(v2 + a1) |= v1;
  uint64_t v7 = (void *)(*(void *)(v3 + 48) + 16 * v4);
  void *v7 = v5;
  v7[1] = v6;
}

uint64_t sub_24A10A604()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_24A10A670()
{
  return swift_slowAlloc();
}

uint64_t sub_24A10A68C()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_24A10A6A8()
{
  return v0;
}

uint64_t sub_24A10A6F8(uint64_t a1)
{
  *uint64_t v1 = a1;
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_24A10A720()
{
  return v0;
}

BOOL sub_24A10A738(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t sub_24A10A754()
{
  return swift_dynamicCast();
}

uint64_t sub_24A10A778()
{
  return v0;
}

uint64_t sub_24A10A790()
{
  return *(void *)(*(void *)(v1 + 48) + 16 * v0 + 8);
}

uint64_t sub_24A10A7C4()
{
  return 0;
}

uint64_t sub_24A10A7D4(uint64_t result)
{
  *(void *)(v2 + 16) = v1;
  *(void *)(v2 + 24) = 2 * ((result - 32) / 8);
  return result;
}

uint64_t sub_24A10A7EC()
{
  return swift_allocObject();
}

uint64_t sub_24A10A804()
{
  return v0;
}

void sub_24A10A834()
{
  sub_24A108F0C();
}

uint64_t sub_24A10A870()
{
  return swift_arrayDestroy();
}

uint64_t sub_24A10A88C(float a1)
{
  *uint64_t v1 = a1;
  return swift_bridgeObjectRetain();
}

uint64_t sub_24A10A8B0()
{
  return swift_slowAlloc();
}

uint64_t sub_24A10A8C8()
{
  return *(void *)(v0 + 176);
}

id sub_24A10A8E0()
{
  *(void *)(v0 + 112) = v1;
  return v1;
}

uint64_t sub_24A10A904()
{
  sub_24A10A080();
  return v0;
}

uint64_t sub_24A10A934()
{
  return 0;
}

uint64_t sub_24A10A950()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t sub_24A10A974()
{
  return v0;
}

uint64_t sub_24A10A9E8()
{
  return v0;
}

id sub_24A10AA50(float a1)
{
  *uint64_t v1 = a1;
  return v2;
}

uint64_t sub_24A10AA70()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_24A10AA90(uint64_t a1)
{
  *(void *)(v1 + 80) = a1;
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_24A10AAB0()
{
  return swift_dynamicCast();
}

void sub_24A10AAD0(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v6, a4, v5, 0xCu);
}

void sub_24A10AAF0(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v6, a4, v5, 0xCu);
}

uint64_t sub_24A10AB10@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  *a2 = a1;
  return a1 + 64;
}

uint64_t sub_24A10AB48()
{
  return AsyncThrowingStream.Continuation.yield(_:)();
}

uint64_t sub_24A10AB68()
{
  return *(void *)(v0 + 176);
}

uint64_t sub_24A10ABD4(uint64_t a1, char a2)
{
  return *(void *)(v2 + 16) + ((a2 & 1) == 0);
}

uint64_t sub_24A10ABE8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a1 + 24))
  {
    sub_24A0FAFF4((_OWORD *)a1, v6);
    sub_24A0FAA64(v6, a2, a3);
    return swift_bridgeObjectRelease();
  }
  else
  {
    sub_24A114898(a1, &qword_26976A410);
    sub_24A114058(v6);
    swift_bridgeObjectRelease();
    return sub_24A114898((uint64_t)v6, &qword_26976A410);
  }
}

uint64_t sub_24A10AC7C()
{
  sub_24A0FB204();
  v1[7] = v2;
  v1[8] = v0;
  v1[5] = v3;
  v1[6] = v4;
  v1[3] = v5;
  v1[4] = v6;
  v1[2] = v7;
  uint64_t v8 = type metadata accessor for DownloadRequestMessage();
  v1[9] = v8;
  sub_24A0FB024(v8);
  v1[10] = v9;
  v1[11] = swift_task_alloc();
  sub_24A0FB244();
  return MEMORY[0x270FA2498](v10, v11, v12);
}

uint64_t sub_24A10AD1C()
{
  uint64_t v2 = v0[10];
  uint64_t v1 = v0[11];
  uint64_t v3 = v0[9];
  (*(void (**)(uint64_t, void, uint64_t))(v2 + 16))(v1, v0[3], v3);
  int v4 = (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 88))(v1, v3);
  if (v4 == *MEMORY[0x263F32208] || v4 == *MEMORY[0x263F32210])
  {
    uint64_t v6 = (uint64_t *)v0[11];
    (*(void (**)(uint64_t *, void))(v0[10] + 96))(v6, v0[9]);
    uint64_t v7 = *v6;
    v0[12] = *v6;
    swift_task_alloc();
    sub_24A10AB88();
    v0[13] = v8;
    void *v8 = v9;
    v8[1] = sub_24A10AEDC;
    uint64_t v10 = v0[7];
    uint64_t v11 = v0[5];
    uint64_t v12 = v0[6];
    uint64_t v13 = v0[4];
    uint64_t v14 = v0[2];
    return sub_24A10F31C(v14, v7, v13, v11, v12, v10);
  }
  else
  {
    uint64_t v17 = v0[10];
    uint64_t v16 = v0[11];
    uint64_t v18 = v0[9];
    sub_24A104500();
    swift_allocError();
    swift_willThrow();
    (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v16, v18);
    swift_task_dealloc();
    sub_24A0FB1D0();
    return v19();
  }
}

uint64_t sub_24A10AEDC()
{
  sub_24A0FB204();
  sub_24A0FB00C();
  sub_24A0FB128();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  sub_24A0FB128();
  *uint64_t v5 = v4;
  *(void *)(v6 + 112) = v0;
  swift_task_dealloc();
  sub_24A0FB244();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_24A10AFBC()
{
  sub_24A0FB204();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  sub_24A0FB280();
  return v0();
}

uint64_t sub_24A10B01C()
{
  sub_24A0FB204();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  sub_24A0FB1D0();
  return v0();
}

uint64_t sub_24A10B080(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v48 = sub_24A0FA334(&qword_26976A578);
  uint64_t v4 = MEMORY[0x270FA5388](v48);
  uint64_t v54 = (uint64_t)&v40 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  unint64_t v47 = (char *)&v40 - v7;
  MEMORY[0x270FA5388](v6);
  uint64_t v46 = (char *)&v40 - v8;
  uint64_t v9 = sub_24A0FA334(&qword_26976A440);
  uint64_t v44 = *(void *)(v9 - 8);
  uint64_t v45 = v9;
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v40 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = *(void *)(a1 + 16);
  uint64_t v13 = MEMORY[0x263F8EE78];
  if (!v12) {
    return v13;
  }
  uint64_t v56 = MEMORY[0x263F8EE78];
  sub_24A108D4C(0, v12, 0);
  uint64_t v14 = sub_24A109A38(a1);
  if (v14 < 0 || (unint64_t v16 = v14, v14 >= 1 << *(unsigned char *)(a1 + 32)))
  {
LABEL_23:
    __break(1u);
  }
  else
  {
    uint64_t v17 = a1 + 64;
    char v42 = v11;
    uint64_t v43 = a1;
    uint64_t v41 = a1 + 64;
    while ((*(void *)(v17 + 8 * (v16 >> 6)) & (1 << v16)) != 0)
    {
      if (v15 != *(_DWORD *)(a1 + 36)) {
        goto LABEL_25;
      }
      uint64_t v51 = 1 << v16;
      unint64_t v52 = v16 >> 6;
      uint64_t v49 = v12;
      uint64_t v50 = v15;
      uint64_t v53 = v2;
      uint64_t v18 = v48;
      uint64_t v19 = *(int *)(v48 + 48);
      uint64_t v20 = *(void *)(a1 + 48);
      uint64_t v21 = type metadata accessor for URL();
      uint64_t v22 = *(void *)(v21 - 8);
      long long v23 = *(void (**)(char *, unint64_t, uint64_t))(v22 + 16);
      uint64_t v24 = (uint64_t)v46;
      v23(v46, v20 + *(void *)(v22 + 72) * v16, v21);
      uint64_t v25 = *(void *)(*(void *)(a1 + 56) + 8 * v16);
      *(void *)(v24 + v19) = v25;
      Swift::String v26 = v47;
      v23(v47, v24, v21);
      *(void *)&v26[*(int *)(v18 + 48)] = v25;
      uint64_t v27 = (uint64_t)v26;
      uint64_t v28 = v54;
      sub_24A114948(v27, v54, &qword_26976A578);
      swift_bridgeObjectRetain_n();
      sub_24A114898(v24, &qword_26976A578);
      uint64_t v29 = *(int *)(v18 + 48);
      uint64_t v30 = (uint64_t)v42;
      uint64_t v31 = *(void *)(v28 + v29);
      v23(v42, v28, v21);
      if (*(void *)(sub_24A10CEA4(v31) + 16))
      {
        sub_24A0FA334(&qword_26976A3A0);
        uint64_t v32 = static _DictionaryStorage.allocate(capacity:)();
      }
      else
      {
        uint64_t v32 = MEMORY[0x263F8EE80];
      }
      uint64_t v33 = v53;
      uint64_t v55 = v32;
      uint64_t v34 = swift_bridgeObjectRetain();
      sub_24A107C18(v34, 1, &v55);
      uint64_t v2 = v33;
      if (v33) {
        goto LABEL_29;
      }
      swift_bridgeObjectRelease();
      uint64_t v35 = v54;
      *(void *)(v30 + *(int *)(v45 + 48)) = v55;
      sub_24A114898(v35, &qword_26976A578);
      uint64_t v13 = v56;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_24A108D4C(0, *(void *)(v13 + 16) + 1, 1);
        uint64_t v13 = v56;
      }
      unint64_t v37 = *(void *)(v13 + 16);
      unint64_t v36 = *(void *)(v13 + 24);
      if (v37 >= v36 >> 1)
      {
        sub_24A108D4C(v36 > 1, v37 + 1, 1);
        uint64_t v13 = v56;
      }
      *(void *)(v13 + 16) = v37 + 1;
      sub_24A114948(v30, v13+ ((*(unsigned __int8 *)(v44 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v44 + 80))+ *(void *)(v44 + 72) * v37, &qword_26976A440);
      a1 = v43;
      if ((uint64_t)v16 >= -(-1 << *(unsigned char *)(v43 + 32))) {
        goto LABEL_26;
      }
      uint64_t v17 = v41;
      if ((*(void *)(v41 + 8 * v52) & v51) == 0) {
        goto LABEL_27;
      }
      if (v50 != *(_DWORD *)(v43 + 36)) {
        goto LABEL_28;
      }
      uint64_t v38 = _HashTable.occupiedBucket(after:)();
      uint64_t v12 = v49 - 1;
      if (v49 == 1) {
        return v13;
      }
      unint64_t v16 = v38;
      if ((v38 & 0x8000000000000000) == 0)
      {
        uint64_t v15 = *(unsigned int *)(a1 + 36);
        if (v38 < 1 << *(unsigned char *)(a1 + 32)) {
          continue;
        }
      }
      goto LABEL_23;
    }
  }
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  __break(1u);
LABEL_27:
  __break(1u);
LABEL_28:
  __break(1u);
LABEL_29:
  uint64_t result = swift_unexpectedError();
  __break(1u);
  return result;
}

uint64_t sub_24A10B514(uint64_t a1, void *a2)
{
  uint64_t v4 = type metadata accessor for AssetDownloadRequest();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = &v44[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v8 = sub_24A0FA334(&qword_26976A3A8);
  uint64_t v51 = *(void *)(v8 - 8);
  uint64_t v52 = v8;
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (uint64_t *)&v44[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v11 = *(void *)(a1 + 16);
  if (v11)
  {
    uint64_t v61 = MEMORY[0x263F8EE78];
    sub_24A108CEC(0, v11, 0);
    uint64_t v14 = *(void (**)(uint64_t *, uint64_t, uint64_t))(v5 + 16);
    uint64_t v12 = v5 + 16;
    uint64_t v13 = v14;
    uint64_t v15 = a1 + ((*(unsigned __int8 *)(v12 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 64));
    uint64_t v55 = v7;
    uint64_t v56 = a2 + 4;
    uint64_t v45 = *(void *)(v12 + 56);
    uint64_t v46 = (void (**)(unsigned char *, uint64_t))(v12 - 8);
    uint64_t v49 = v12;
    uint64_t v50 = a2;
    unint64_t v47 = v14;
    uint64_t v48 = v10;
    while (1)
    {
      uint64_t v54 = v11;
      v13((uint64_t *)v7, v15, v4);
      unint64_t v16 = (void *)a2[2];
      objc_msgSend(v16, sel_lock);
      uint64_t v17 = a2[3];
      if (__OFADD__(v17, 1)) {
        break;
      }
      id v53 = v16;
      a2[3] = v17 + 1;
      swift_beginAccess();
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v60 = (void *)a2[4];
      uint64_t v19 = v60;
      a2[4] = 0x8000000000000000;
      uint64_t v58 = v4;
      uint64_t v59 = sub_24A1149A0(&qword_26976A580, MEMORY[0x263F321A8]);
      uint64_t v20 = sub_24A1149E8((uint64_t *)&v57);
      uint64_t v21 = v7;
      uint64_t v22 = v4;
      v13(v20, (uint64_t)v21, v4);
      unint64_t v23 = sub_24A106698(v17);
      uint64_t v25 = v19[2];
      BOOL v26 = (v24 & 1) == 0;
      Swift::Int v27 = v25 + v26;
      if (__OFADD__(v25, v26)) {
        goto LABEL_20;
      }
      unint64_t v28 = v23;
      char v29 = v24;
      sub_24A0FA334(&qword_26976A380);
      if (_NativeDictionary.ensureUnique(isUnique:capacity:)(isUniquelyReferenced_nonNull_native, v27))
      {
        unint64_t v30 = sub_24A106698(v17);
        if ((v29 & 1) != (v31 & 1)) {
          goto LABEL_21;
        }
        unint64_t v28 = v30;
      }
      uint64_t v32 = v60;
      if (v29)
      {
        uint64_t v33 = v60[7] + 40 * v28;
        sub_24A0FAFA4(v33);
        sub_24A10A130(&v57, v33);
      }
      else
      {
        uint64_t v34 = sub_24A114A4C((uint64_t)&v57, v58);
        MEMORY[0x270FA5388](v34);
        unint64_t v36 = &v44[-((v35 + 15) & 0xFFFFFFFFFFFFFFF0)];
        (*(void (**)(unsigned char *))(v37 + 16))(v36);
        sub_24A114A9C(v28, v17, (uint64_t)v36, v32);
        sub_24A0FAFA4((uint64_t)&v57);
      }
      uint64_t v38 = v48;
      *uint64_t v56 = v32;
      swift_bridgeObjectRelease();
      swift_endAccess();
      objc_msgSend(v53, sel_unlock);
      uint64_t v4 = v22;
      (*v46)(v55, v22);
      *uint64_t v38 = v17;
      AssetDownloadRequest.asset.getter();
      uint64_t v39 = v61;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_24A108CEC(0, *(void *)(v39 + 16) + 1, 1);
        uint64_t v39 = v61;
      }
      uint64_t v40 = v54;
      uint64_t v7 = v55;
      uint64_t v13 = v47;
      unint64_t v42 = *(void *)(v39 + 16);
      unint64_t v41 = *(void *)(v39 + 24);
      if (v42 >= v41 >> 1)
      {
        sub_24A108CEC(v41 > 1, v42 + 1, 1);
        uint64_t v39 = v61;
      }
      *(void *)(v39 + 16) = v42 + 1;
      sub_24A114948((uint64_t)v38, v39+ ((*(unsigned __int8 *)(v51 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v51 + 80))+ *(void *)(v51 + 72) * v42, &qword_26976A3A8);
      v15 += v45;
      uint64_t v11 = v40 - 1;
      a2 = v50;
      if (!v11)
      {
        swift_release();
        return v39;
      }
    }
    __break(1u);
LABEL_20:
    __break(1u);
LABEL_21:
    uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
  }
  else
  {
    swift_release();
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void sub_24A10BA20(uint64_t a1, uint64_t (*a2)(void, char *), uint64_t a3)
{
  unint64_t v36 = a2;
  uint64_t v37 = a3;
  uint64_t v35 = sub_24A0FA334(&qword_26976A2E8);
  uint64_t v5 = MEMORY[0x270FA5388](v35);
  uint64_t v34 = (char *)v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v33 = (void *)((char *)v29 - v8);
  MEMORY[0x270FA5388](v7);
  uint64_t v32 = (char *)v29 - v9;
  uint64_t v10 = *(void *)(a1 + 16);
  if (v10)
  {
    v29[1] = v3;
    uint64_t v42 = MEMORY[0x263F8EE78];
    sub_24A108C9C();
    uint64_t v11 = sub_24A109A38(a1);
    if ((v11 & 0x8000000000000000) == 0)
    {
      unint64_t v13 = v11;
      if (v11 < 1 << *(unsigned char *)(a1 + 32))
      {
        uint64_t v14 = a1 + 64;
        uint64_t v30 = a1 + 64;
        uint64_t v31 = a1;
        uint64_t v15 = v32;
        while ((*(void *)(v14 + 8 * (v13 >> 6)) & (1 << v13)) != 0)
        {
          if (v12 != *(_DWORD *)(a1 + 36)) {
            goto LABEL_20;
          }
          uint64_t v40 = 1 << v13;
          unint64_t v41 = v13 >> 6;
          uint64_t v38 = v10;
          uint64_t v39 = v12;
          uint64_t v16 = v35;
          uint64_t v17 = (char *)v15 + *(int *)(v35 + 48);
          uint64_t v18 = *(void *)(a1 + 56);
          uint64_t v19 = *(void *)(*(void *)(a1 + 48) + 8 * v13);
          uint64_t v20 = type metadata accessor for Asset();
          uint64_t v21 = *(void *)(v20 - 8);
          uint64_t v22 = *(void (**)(char *, unint64_t, uint64_t))(v21 + 16);
          v22(v17, v18 + *(void *)(v21 + 72) * v13, v20);
          *uint64_t v15 = v19;
          uint64_t v23 = (uint64_t)v33;
          *uint64_t v33 = v19;
          v22((char *)(v23 + *(int *)(v16 + 48)), (unint64_t)v17, v20);
          char v24 = v34;
          sub_24A114948(v23, (uint64_t)v34, &qword_26976A2E8);
          sub_24A114898((uint64_t)v15, &qword_26976A2E8);
          uint64_t v25 = v36(*(void *)v24, &v24[*(int *)(v16 + 48)]);
          sub_24A114898((uint64_t)v24, &qword_26976A2E8);
          uint64_t v26 = v42;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            sub_24A108C9C();
            uint64_t v26 = v42;
          }
          unint64_t v27 = *(void *)(v26 + 16);
          a1 = v31;
          if (v27 >= *(void *)(v26 + 24) >> 1)
          {
            sub_24A108C9C();
            uint64_t v26 = v42;
          }
          *(void *)(v26 + 16) = v27 + 1;
          *(void *)(v26 + 8 * v27 + 32) = v25;
          if ((uint64_t)v13 >= -(-1 << *(unsigned char *)(a1 + 32))) {
            goto LABEL_21;
          }
          uint64_t v14 = v30;
          if ((*(void *)(v30 + 8 * v41) & v40) == 0) {
            goto LABEL_22;
          }
          if (v39 != *(_DWORD *)(a1 + 36)) {
            goto LABEL_23;
          }
          uint64_t v28 = _HashTable.occupiedBucket(after:)();
          uint64_t v10 = v38 - 1;
          if (v38 == 1) {
            return;
          }
          unint64_t v13 = v28;
          if ((v28 & 0x8000000000000000) == 0)
          {
            uint64_t v12 = *(unsigned int *)(a1 + 36);
            if (v28 < 1 << *(unsigned char *)(a1 + 32)) {
              continue;
            }
          }
          goto LABEL_24;
        }
        __break(1u);
LABEL_20:
        __break(1u);
LABEL_21:
        __break(1u);
LABEL_22:
        __break(1u);
LABEL_23:
        __break(1u);
      }
    }
LABEL_24:
    __break(1u);
  }
}

uint64_t sub_24A10BD70(uint64_t a1)
{
  uint64_t v19 = type metadata accessor for Asset.ID();
  uint64_t v3 = *(void *)(v19 - 8);
  MEMORY[0x270FA5388](v19);
  uint64_t v5 = (char *)v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *(void *)(a1 + 16);
  uint64_t v7 = MEMORY[0x263F8EE78];
  if (v6)
  {
    v17[1] = v1;
    uint64_t v20 = MEMORY[0x263F8EE78];
    sub_24A108DA4();
    uint64_t v8 = *(void *)(type metadata accessor for Asset() - 8);
    uint64_t v9 = a1 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
    uint64_t v18 = *(void *)(v8 + 72);
    uint64_t v10 = (void (**)(char *, uint64_t))(v3 + 8);
    do
    {
      Asset.id.getter();
      uint64_t v11 = Asset.ID.signature.getter();
      uint64_t v13 = v12;
      (*v10)(v5, v19);
      uint64_t v7 = v20;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_24A108DA4();
        uint64_t v7 = v20;
      }
      unint64_t v14 = *(void *)(v7 + 16);
      if (v14 >= *(void *)(v7 + 24) >> 1)
      {
        sub_24A108DA4();
        uint64_t v7 = v20;
      }
      *(void *)(v7 + 16) = v14 + 1;
      uint64_t v15 = v7 + 16 * v14;
      *(void *)(v15 + 32) = v11;
      *(void *)(v15 + 40) = v13;
      v9 += v18;
      --v6;
    }
    while (v6);
  }
  return v7;
}

uint64_t sub_24A10BF7C(uint64_t a1)
{
  uint64_t v17 = type metadata accessor for Credential();
  uint64_t v3 = *(void *)(v17 - 8);
  MEMORY[0x270FA5388](v17);
  uint64_t v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *(void *)(a1 + 16);
  uint64_t v7 = MEMORY[0x263F8EE78];
  if (v6)
  {
    uint64_t v16 = v1;
    uint64_t v18 = MEMORY[0x263F8EE78];
    sub_24A108E1C();
    uint64_t v8 = (void *)(a1 + 32);
    uint64_t v9 = (void (**)(char *, uint64_t))(v3 + 8);
    do
    {
      sub_24A109F8C(v8, v8[3]);
      dispatch thunk of AssetRequest.credential.getter();
      uint64_t v10 = Credential.accessToken.getter();
      uint64_t v12 = v11;
      (*v9)(v5, v17);
      uint64_t v7 = v18;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_24A108E1C();
        uint64_t v7 = v18;
      }
      unint64_t v13 = *(void *)(v7 + 16);
      if (v13 >= *(void *)(v7 + 24) >> 1)
      {
        sub_24A108E1C();
        uint64_t v7 = v18;
      }
      *(void *)(v7 + 16) = v13 + 1;
      uint64_t v14 = v7 + 16 * v13;
      *(void *)(v14 + 32) = v10;
      *(void *)(v14 + 40) = v12;
      v8 += 5;
      --v6;
    }
    while (v6);
  }
  return v7;
}

unint64_t sub_24A10C144(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = type metadata accessor for Asset();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = *(void *)(a1 + 16);
  if (v8)
  {
    v19[1] = v2;
    uint64_t v22 = MEMORY[0x263F8EE78];
    uint64_t v21 = (char *)v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
    sub_24A108EAC(0, v8, 0);
    uint64_t v9 = v22;
    uint64_t v10 = (unint64_t *)(a1 + 32);
    v19[2] = v6 + 32;
    v19[3] = v6 + 16;
    uint64_t v20 = a2;
    while (1)
    {
      unint64_t v12 = *v10++;
      unint64_t result = v12;
      if ((v12 & 0x8000000000000000) != 0) {
        break;
      }
      if (!*(void *)(a2 + 16)) {
        goto LABEL_13;
      }
      unint64_t result = sub_24A106698(result);
      if ((v13 & 1) == 0) {
        goto LABEL_14;
      }
      uint64_t v14 = *(void *)(v6 + 72);
      uint64_t v15 = v21;
      (*(void (**)(char *, unint64_t, uint64_t))(v6 + 16))(v21, *(void *)(a2 + 56) + v14 * result, v5);
      uint64_t v22 = v9;
      uint64_t v16 = v5;
      unint64_t v18 = *(void *)(v9 + 16);
      unint64_t v17 = *(void *)(v9 + 24);
      if (v18 >= v17 >> 1)
      {
        sub_24A108EAC(v17 > 1, v18 + 1, 1);
        uint64_t v15 = v21;
        uint64_t v9 = v22;
      }
      *(void *)(v9 + 16) = v18 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))(v9 + ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80)) + v18 * v14, v15, v16);
      --v8;
      uint64_t v5 = v16;
      a2 = v20;
      if (!v8)
      {
        swift_bridgeObjectRelease();
        return v9;
      }
    }
    __break(1u);
LABEL_13:
    __break(1u);
LABEL_14:
    __break(1u);
  }
  else
  {
    swift_bridgeObjectRelease();
    return MEMORY[0x263F8EE78];
  }
  return result;
}

uint64_t sub_24A10C354(uint64_t a1)
{
  uint64_t v3 = sub_24A0FA334(&qword_26976A530);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  int64_t v6 = *(void *)(a1 + 16);
  uint64_t v7 = MEMORY[0x263F8EE78];
  if (!v6) {
    return v7;
  }
  v22[1] = v1;
  uint64_t v37 = MEMORY[0x263F8EE78];
  sub_24A108F9C(0, v6, 0);
  uint64_t result = sub_24A109A38(a1);
  if ((result & 0x8000000000000000) == 0)
  {
    unint64_t v10 = result;
    if (result < 1 << *(unsigned char *)(a1 + 32))
    {
      uint64_t v11 = a1 + 64;
      unint64_t v27 = &v36;
      uint64_t v26 = (uint64_t)v34 + 8;
      uint64_t v25 = (uint64_t)v33 + 8;
      uint64_t v23 = v5;
      uint64_t v24 = a1 + 64;
      while ((*(void *)(v11 + 8 * (v10 >> 6)) & (1 << v10)) != 0)
      {
        if (v9 != *(_DWORD *)(a1 + 36)) {
          goto LABEL_23;
        }
        uint64_t v28 = v9;
        uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8 * v10);
        uint64_t v13 = (uint64_t)v27;
        sub_24A10A148(*(void *)(a1 + 56) + 40 * v10, (uint64_t)v27);
        uint64_t v35 = v12;
        *(void *)&v34[0] = v12;
        sub_24A10A148(v13, v26);
        v33[0] = v34[0];
        v33[1] = v34[1];
        v33[2] = v34[2];
        sub_24A114898((uint64_t)&v35, &qword_26976A368);
        uint64_t v31 = *(void *)&v33[0];
        sub_24A10A148(v25, (uint64_t)v32);
        sub_24A0FA334(&qword_26976A350);
        uint64_t v14 = type metadata accessor for AssetDownloadRequest();
        if (swift_dynamicCast())
        {
          sub_24A0F600C((uint64_t)v5, 0, 1, v14);
          uint64_t v29 = AssetDownloadRequest.range.getter();
          uint64_t v16 = v15;
          int v30 = v17 & 1;
          (*(void (**)(char *, uint64_t))(*(void *)(v14 - 8) + 8))(v5, v14);
        }
        else
        {
          int v30 = 1;
          sub_24A0F600C((uint64_t)v5, 1, 1, v14);
          sub_24A114898((uint64_t)v5, &qword_26976A530);
          uint64_t v29 = 0;
          uint64_t v16 = 0;
        }
        sub_24A114898((uint64_t)v33, &qword_26976A368);
        uint64_t v7 = v37;
        uint64_t result = swift_isUniquelyReferenced_nonNull_native();
        if ((result & 1) == 0)
        {
          uint64_t result = (uint64_t)sub_24A108F9C(0, *(void *)(v7 + 16) + 1, 1);
          uint64_t v7 = v37;
        }
        unint64_t v19 = *(void *)(v7 + 16);
        unint64_t v18 = *(void *)(v7 + 24);
        if (v19 >= v18 >> 1)
        {
          uint64_t result = (uint64_t)sub_24A108F9C((char *)(v18 > 1), v19 + 1, 1);
          uint64_t v7 = v37;
        }
        *(void *)(v7 + 16) = v19 + 1;
        uint64_t v20 = v7 + 32 * v19;
        uint64_t v21 = v29;
        *(void *)(v20 + 32) = v31;
        *(void *)(v20 + 40) = v21;
        *(void *)(v20 + 48) = v16;
        *(unsigned char *)(v20 + 56) = v30;
        if ((uint64_t)v10 >= -(-1 << *(unsigned char *)(a1 + 32))) {
          goto LABEL_24;
        }
        uint64_t v11 = v24;
        if ((*(void *)(v24 + 8 * (v10 >> 6)) & (1 << v10)) == 0) {
          goto LABEL_25;
        }
        if (v28 != *(_DWORD *)(a1 + 36)) {
          goto LABEL_26;
        }
        uint64_t result = _HashTable.occupiedBucket(after:)();
        if (!--v6) {
          return v7;
        }
        unint64_t v10 = result;
        uint64_t v5 = v23;
        if ((result & 0x8000000000000000) == 0)
        {
          uint64_t v9 = *(unsigned int *)(a1 + 36);
          if (result < 1 << *(unsigned char *)(a1 + 32)) {
            continue;
          }
        }
        goto LABEL_27;
      }
      __break(1u);
LABEL_23:
      __break(1u);
LABEL_24:
      __break(1u);
LABEL_25:
      __break(1u);
LABEL_26:
      __break(1u);
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_24A10C744(uint64_t a1)
{
  uint64_t v77 = type metadata accessor for Asset.ID();
  uint64_t v2 = *(void *)(v77 - 8);
  MEMORY[0x270FA5388](v77);
  uint64_t v76 = &v60[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v69 = type metadata accessor for URL();
  uint64_t v4 = *(void *)(v69 - 8);
  MEMORY[0x270FA5388](v69);
  uint64_t v75 = &v60[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v74 = sub_24A0FA334(&qword_26976A2E8);
  uint64_t v68 = *(void *)(v74 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v74);
  uint64_t v67 = &v60[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v73 = &v60[-v9];
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v72 = &v60[-v11];
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v81 = (uint64_t *)&v60[-v13];
  MEMORY[0x270FA5388](v12);
  uint64_t v71 = &v60[-v14];
  uint64_t v15 = (void *)MEMORY[0x263F8EE80];
  v83 = (void *)MEMORY[0x263F8EE80];
  sub_24A109ABC(a1, v82);
  uint64_t v78 = v82[0];
  uint64_t v65 = v82[1];
  int64_t v79 = v82[3];
  unint64_t v16 = v82[4];
  int64_t v66 = (unint64_t)(v82[2] + 64) >> 6;
  unint64_t v70 = (void (**)(unsigned char *, uint64_t))(v2 + 8);
  uint64_t v63 = v4 + 32;
  uint64_t v64 = v4;
  v62 = (void (**)(uint64_t, uint64_t))(v4 + 8);
  long long v61 = xmmword_24A11C2F0;
  while (1)
  {
    if (v16)
    {
      uint64_t v80 = (v16 - 1) & v16;
      unint64_t v17 = __clz(__rbit64(v16)) | (v79 << 6);
    }
    else
    {
      int64_t v18 = v79 + 1;
      if (__OFADD__(v79, 1)) {
        goto LABEL_35;
      }
      if (v18 >= v66) {
        goto LABEL_32;
      }
      unint64_t v19 = *(void *)(v65 + 8 * v18);
      int64_t v20 = v79 + 1;
      if (!v19)
      {
        int64_t v20 = v79 + 2;
        if (v79 + 2 >= v66) {
          goto LABEL_32;
        }
        unint64_t v19 = *(void *)(v65 + 8 * v20);
        if (!v19)
        {
          int64_t v20 = v79 + 3;
          if (v79 + 3 >= v66) {
            goto LABEL_32;
          }
          unint64_t v19 = *(void *)(v65 + 8 * v20);
          if (!v19)
          {
            int64_t v20 = v79 + 4;
            if (v79 + 4 >= v66) {
              goto LABEL_32;
            }
            unint64_t v19 = *(void *)(v65 + 8 * v20);
            if (!v19)
            {
              int64_t v20 = v79 + 5;
              if (v79 + 5 >= v66) {
                goto LABEL_32;
              }
              unint64_t v19 = *(void *)(v65 + 8 * v20);
              if (!v19)
              {
                int64_t v21 = v79 + 6;
                while (v21 < v66)
                {
                  unint64_t v19 = *(void *)(v65 + 8 * v21++);
                  if (v19)
                  {
                    int64_t v20 = v21 - 1;
                    goto LABEL_19;
                  }
                }
LABEL_32:
                swift_release();
                return (uint64_t)v15;
              }
            }
          }
        }
      }
LABEL_19:
      int64_t v79 = v20;
      uint64_t v80 = (v19 - 1) & v19;
      unint64_t v17 = __clz(__rbit64(v19)) + (v20 << 6);
    }
    uint64_t v22 = *(void *)(v78 + 56);
    uint64_t v23 = *(void *)(*(void *)(v78 + 48) + 8 * v17);
    uint64_t v24 = type metadata accessor for Asset();
    uint64_t v25 = *(void *)(v24 - 8);
    uint64_t v26 = v22 + *(void *)(v25 + 72) * v17;
    uint64_t v27 = v74;
    uint64_t v28 = v71;
    uint64_t v29 = *(void (**)(unsigned char *, uint64_t, uint64_t))(v25 + 16);
    v29(&v71[*(int *)(v74 + 48)], v26, v24);
    *uint64_t v28 = v23;
    int v30 = v81;
    sub_24A114948((uint64_t)v28, (uint64_t)v81, &qword_26976A2E8);
    uint64_t v31 = *(int *)(v27 + 48);
    uint64_t v32 = v72;
    uint64_t v33 = (char *)v72 + v31;
    uint64_t v34 = (char *)v30 + v31;
    uint64_t v35 = *v30;
    *uint64_t v72 = v35;
    v29((unsigned char *)v32 + v31, (uint64_t)v34, v24);
    uint64_t v36 = *(int *)(v27 + 48);
    uint64_t v37 = (uint64_t)v73;
    uint64_t v38 = (char *)v73 + v36;
    *uint64_t v73 = v35;
    (*(void (**)(char *, char *, uint64_t))(v25 + 32))(v38, v33, v24);
    uint64_t v39 = v76;
    Asset.id.getter();
    uint64_t v40 = (uint64_t)v75;
    Asset.ID.storageLocation.getter();
    (*v70)(v39, v77);
    sub_24A114898(v37, &qword_26976A2E8);
    unint64_t v42 = sub_24A1066DC(v40);
    uint64_t v43 = v15[2];
    BOOL v44 = (v41 & 1) == 0;
    uint64_t v45 = v43 + v44;
    if (__OFADD__(v43, v44)) {
      break;
    }
    char v46 = v41;
    if (v15[3] < v45)
    {
      sub_24A106F9C(v45, 1);
      uint64_t v15 = v83;
      unint64_t v47 = sub_24A1066DC(v40);
      if ((v46 & 1) != (v48 & 1)) {
        goto LABEL_36;
      }
      unint64_t v42 = v47;
    }
    if (v46)
    {
      (*v62)(v40, v69);
      uint64_t v15 = v83;
      uint64_t v49 = v83[7];
      sub_24A114948((uint64_t)v81, (uint64_t)v67, &qword_26976A2E8);
      uint64_t v50 = *(void *)(v49 + 8 * v42);
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *(void *)(v49 + 8 * v42) = v50;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        uint64_t v50 = sub_24A104BBC(0, *(void *)(v50 + 16) + 1, 1, v50);
        *(void *)(v49 + 8 * v42) = v50;
      }
      unint64_t v53 = *(void *)(v50 + 16);
      unint64_t v52 = *(void *)(v50 + 24);
      if (v53 >= v52 >> 1)
      {
        uint64_t v50 = sub_24A104BBC(v52 > 1, v53 + 1, 1, v50);
        *(void *)(v49 + 8 * v42) = v50;
      }
      *(void *)(v50 + 16) = v53 + 1;
      sub_24A114948((uint64_t)v67, v50+ ((*(unsigned __int8 *)(v68 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v68 + 80))+ *(void *)(v68 + 72) * v53, &qword_26976A2E8);
      unint64_t v16 = v80;
    }
    else
    {
      sub_24A0FA334(&qword_26976A450);
      unint64_t v54 = (*(unsigned __int8 *)(v68 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v68 + 80);
      uint64_t v55 = swift_allocObject();
      *(_OWORD *)(v55 + 16) = v61;
      sub_24A114948((uint64_t)v81, v55 + v54, &qword_26976A2E8);
      v15[(v42 >> 6) + 8] |= 1 << v42;
      (*(void (**)(unint64_t, uint64_t, uint64_t))(v64 + 32))(v15[6] + *(void *)(v64 + 72) * v42, v40, v69);
      *(void *)(v15[7] + 8 * v42) = v55;
      uint64_t v56 = v15[2];
      BOOL v57 = __OFADD__(v56, 1);
      uint64_t v58 = v56 + 1;
      if (v57) {
        goto LABEL_34;
      }
      v15[2] = v58;
      unint64_t v16 = v80;
    }
  }
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
  return result;
}

uint64_t sub_24A10CEA4(uint64_t a1)
{
  uint64_t v16 = sub_24A0FA334(&qword_26976A2E8);
  uint64_t v2 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  uint64_t v4 = (char *)&v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_24A0FA334(&qword_26976A3A8);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *(void *)(a1 + 16);
  uint64_t v10 = MEMORY[0x263F8EE78];
  if (v9)
  {
    uint64_t v17 = MEMORY[0x263F8EE78];
    sub_24A108CEC(0, v9, 0);
    uint64_t v11 = a1 + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
    uint64_t v12 = *(void *)(v2 + 72);
    uint64_t v10 = v17;
    do
    {
      sub_24A1148F0(v11, (uint64_t)v4, &qword_26976A2E8);
      swift_dynamicCast();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_24A108CEC(0, *(void *)(v10 + 16) + 1, 1);
        uint64_t v10 = v17;
      }
      unint64_t v14 = *(void *)(v10 + 16);
      unint64_t v13 = *(void *)(v10 + 24);
      if (v14 >= v13 >> 1)
      {
        sub_24A108CEC(v13 > 1, v14 + 1, 1);
        uint64_t v10 = v17;
      }
      *(void *)(v10 + 16) = v14 + 1;
      sub_24A114948((uint64_t)v8, v10+ ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))+ *(void *)(v6 + 72) * v14, &qword_26976A3A8);
      v11 += v12;
      --v9;
    }
    while (v9);
  }
  return v10;
}

uint64_t sub_24A10D0E8(uint64_t a1)
{
  *(_OWORD *)(v1 + 32) = xmmword_24A11C390;
  *(_OWORD *)(v1 + 48) = xmmword_24A11C390;
  *(void *)(v1 + 72) = 0;
  *(void *)(v1 + 80) = 0;
  *(void *)(v1 + 16) = a1;
  sub_24A0FA334(&qword_26976A570);
  *(void *)(v1 + 24) = Dictionary.init(dictionaryLiteral:)();
  uint64_t v2 = *(void *)(v1 + 32);
  unint64_t v3 = *(void *)(v1 + 40);
  *(_OWORD *)(v1 + 32) = xmmword_24A11C390;
  sub_24A11487C(v2, v3);
  uint64_t v4 = *(void *)(v1 + 48);
  unint64_t v5 = *(void *)(v1 + 56);
  *(_OWORD *)(v1 + 48) = xmmword_24A11C390;
  sub_24A11487C(v4, v5);
  *(unsigned char *)(v1 + 64) = 0;
  return v1;
}

uint64_t sub_24A10D174()
{
  uint64_t v1 = swift_bridgeObjectRetain();
  sub_24A10BA20(v1, (uint64_t (*)(void, char *))sub_24A114890, v0);
  uint64_t v3 = v2;
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t sub_24A10D1E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = type metadata accessor for Asset.ID();
  uint64_t v53 = *(void *)(v5 - 8);
  uint64_t v54 = v5;
  MEMORY[0x270FA5388](v5);
  unint64_t v52 = (char *)&v51 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for Asset.Protector();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v51 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  unint64_t v13 = (char *)&v51 - v12;
  Asset.protector.getter();
  uint64_t v58 = Asset.Protector.securityKey.getter();
  unint64_t v59 = v14;
  uint64_t v15 = *(void (**)(char *, uint64_t))(v8 + 8);
  uint64_t v55 = v7;
  uint64_t v56 = v15;
  v15(v13, v7);
  sub_24A0FA334(&qword_26976A2D8);
  uint64_t inited = swift_initStackObject();
  long long v57 = xmmword_24A11C2F0;
  *(_OWORD *)(inited + 16) = xmmword_24A11C2F0;
  if (!*MEMORY[0x263F534E8]) {
    goto LABEL_16;
  }
  *(void *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(inited + 40) = v17;
  *(void *)(inited + 72) = MEMORY[0x263F8D6C8];
  *(void *)(inited + 48) = a1;
  uint64_t v18 = Dictionary.init(dictionaryLiteral:)();
  swift_beginAccess();
  uint64_t v19 = sub_24A114D24(a1, *(void *)(a3 + 24));
  uint64_t v21 = v20;
  char v23 = v22;
  swift_endAccess();
  if (v23) {
    goto LABEL_7;
  }
  sub_24A0FA334(&qword_26976A568);
  uint64_t v24 = swift_initStackObject();
  *(_OWORD *)(v24 + 16) = xmmword_24A11C300;
  if (!*MEMORY[0x263F53558]) {
    goto LABEL_17;
  }
  *(void *)(v24 + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(v24 + 40) = v25;
  *(void *)(v24 + 48) = v19;
  if (!*MEMORY[0x263F53560])
  {
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  *(void *)(v24 + 56) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(v24 + 64) = v26;
  if (__OFSUB__(v21, v19))
  {
    __break(1u);
LABEL_16:
    __break(1u);
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  *(void *)(v24 + 72) = v21 - v19;
  Dictionary.init(dictionaryLiteral:)();
  sub_24A0FC6C8();
  uint64_t v28 = v27;
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v60[0] = v18;
  sub_24A114190(v28, (uint64_t)sub_24A107BE0, 0, isUniquelyReferenced_nonNull_native, v60);
  uint64_t v18 = v60[0];
  swift_bridgeObjectRelease();
LABEL_7:
  uint64_t v31 = v58;
  unint64_t v30 = v59;
  if (sub_24A0FC110(v58, v59))
  {
    uint64_t v32 = v31;
    unint64_t v33 = v30;
LABEL_14:
    sub_24A0FA8D8(v32, v33);
    return v18;
  }
  uint64_t v51 = 0;
  sub_24A0FA334(&qword_26976A2F0);
  uint64_t v34 = swift_initStackObject();
  *(_OWORD *)(v34 + 16) = v57;
  if (!*MEMORY[0x263F53588]) {
    goto LABEL_19;
  }
  *(void *)(v34 + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(v34 + 40) = v35;
  sub_24A0FA334(&qword_26976A2F8);
  uint64_t v36 = swift_initStackObject();
  *(_OWORD *)(v36 + 16) = xmmword_24A11C300;
  if (!*MEMORY[0x263F534F0])
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  *(void *)(v36 + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(v36 + 40) = v37;
  Asset.protector.getter();
  uint64_t v38 = Asset.Protector.securityKey.getter();
  uint64_t v40 = v39;
  v56(v11, v55);
  *(void *)(v36 + 48) = v38;
  *(void *)(v36 + 56) = v40;
  if (!*MEMORY[0x263F534F8])
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  *(void *)(v36 + 64) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(v36 + 72) = v41;
  unint64_t v42 = v52;
  Asset.id.getter();
  uint64_t v43 = Asset.ID.referenceSignature.getter();
  uint64_t v45 = v44;
  (*(void (**)(char *, uint64_t))(v53 + 8))(v42, v54);
  *(void *)(v36 + 80) = v43;
  *(void *)(v36 + 88) = v45;
  *(void *)(v34 + 48) = Dictionary.init(dictionaryLiteral:)();
  sub_24A0FA334(&qword_26976A300);
  Dictionary.init(dictionaryLiteral:)();
  sub_24A0FC174();
  uint64_t v47 = v46;
  swift_bridgeObjectRelease();
  char v48 = swift_isUniquelyReferenced_nonNull_native();
  v60[0] = v18;
  uint64_t v49 = v51;
  sub_24A114190(v47, (uint64_t)sub_24A107BE0, 0, v48, v60);
  if (!v49)
  {
    uint64_t v18 = v60[0];
    swift_bridgeObjectRelease();
    uint64_t v32 = v58;
    unint64_t v33 = v59;
    goto LABEL_14;
  }
LABEL_22:
  uint64_t result = swift_bridgeObjectRelease();
  __break(1u);
  return result;
}

uint64_t sub_24A10D70C(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v9 = v4[4];
  unint64_t v10 = v4[5];
  v4[4] = a1;
  v4[5] = a2;
  sub_24A11487C(v9, v10);
  uint64_t v11 = v4[6];
  unint64_t v12 = v4[7];
  v4[6] = a3;
  v4[7] = a4;
  sub_24A109F34(a1, a2);
  sub_24A11487C(v11, v12);
  sub_24A109F34(a3, a4);
  return swift_retain();
}

uint64_t sub_24A10D79C(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 72) = a1;
  *(void *)(v2 + 80) = a2;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  return swift_retain();
}

uint64_t sub_24A10D7E8()
{
  uint64_t v1 = v0;
  sub_24A0FA334(&qword_26976A2D8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24A11C300;
  uint64_t result = *MEMORY[0x263F53520];
  if (!*MEMORY[0x263F53520])
  {
    __break(1u);
    goto LABEL_13;
  }
  *(void *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(inited + 40) = v4;
  uint64_t v5 = sub_24A10D174();
  uint64_t v6 = sub_24A0FA334(&qword_26976A2E0);
  *(void *)(inited + 48) = v5;
  *(void *)(inited + 72) = v6;
  *(void *)(inited + 80) = 0xD00000000000001BLL;
  *(void *)(inited + 88) = 0x800000024A11D570;
  char v7 = *(unsigned char *)(v1 + 64);
  *(void *)(inited + 120) = MEMORY[0x263F8D4F8];
  *(unsigned char *)(inited + 96) = v7;
  uint64_t v8 = MEMORY[0x263F8D310];
  uint64_t v32 = Dictionary.init(dictionaryLiteral:)();
  unint64_t v9 = *(void *)(v1 + 40);
  if (v9 >> 60 == 15 || (unint64_t v10 = *(void *)(v1 + 56), v10 >> 60 == 15))
  {
LABEL_6:
    unint64_t v17 = *(void *)(v1 + 80);
    if (!v17) {
      return v32;
    }
    uint64_t result = *MEMORY[0x263F53510];
    if (*MEMORY[0x263F53510])
    {
      uint64_t v18 = *(void *)(v1 + 72);
      uint64_t v19 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v21 = v20;
      uint64_t v31 = v8;
      uint64_t v29 = v18;
      unint64_t v30 = v17;
      swift_bridgeObjectRetain_n();
      sub_24A10ABE8((uint64_t)&v29, v19, v21);
      uint64_t result = *MEMORY[0x263F53550];
      if (*MEMORY[0x263F53550])
      {
        uint64_t v22 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        uint64_t v24 = v23;
        sub_24A0FA334(&qword_26976A548);
        uint64_t v25 = swift_initStackObject();
        *(_OWORD *)(v25 + 16) = xmmword_24A11C2F0;
        uint64_t result = *MEMORY[0x263F53518];
        if (*MEMORY[0x263F53518])
        {
          *(void *)(v25 + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)();
          *(void *)(v25 + 40) = v26;
          sub_24A0FA334(&qword_26976A550);
          uint64_t v27 = swift_initStackObject();
          *(_OWORD *)(v27 + 16) = xmmword_24A11C2F0;
          *(void *)(v27 + 32) = 0xD000000000000014;
          *(void *)(v27 + 40) = 0x800000024A11D860;
          *(void *)(v27 + 48) = v18;
          *(void *)(v27 + 56) = v17;
          *(void *)(v25 + 48) = Dictionary.init(dictionaryLiteral:)();
          sub_24A0FA334(&qword_26976A558);
          uint64_t v28 = Dictionary.init(dictionaryLiteral:)();
          uint64_t v31 = sub_24A0FA334(&qword_26976A560);
          uint64_t v29 = v28;
          sub_24A10ABE8((uint64_t)&v29, v22, v24);
          return v32;
        }
        goto LABEL_15;
      }
LABEL_14:
      __break(1u);
LABEL_15:
      __break(1u);
      goto LABEL_16;
    }
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  uint64_t result = *MEMORY[0x263F53528];
  if (*MEMORY[0x263F53528])
  {
    uint64_t v11 = *(void *)(v1 + 32);
    uint64_t v12 = *(void *)(v1 + 48);
    uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v15 = v14;
    uint64_t v16 = MEMORY[0x263F06F78];
    uint64_t v31 = MEMORY[0x263F06F78];
    uint64_t v29 = v11;
    unint64_t v30 = v9;
    sub_24A114868(v11, v9);
    sub_24A114868(v11, v9);
    sub_24A114868(v12, v10);
    sub_24A10ABE8((uint64_t)&v29, v13, v15);
    uint64_t v31 = v16;
    uint64_t v29 = v12;
    unint64_t v30 = v10;
    sub_24A109F34(v12, v10);
    sub_24A10ABE8((uint64_t)&v29, 0xD00000000000002BLL, 0x800000024A11D880);
    sub_24A11487C(v11, v9);
    sub_24A11487C(v12, v10);
    goto LABEL_6;
  }
LABEL_16:
  __break(1u);
  return result;
}

uint64_t sub_24A10DB30()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_24A11487C(*(void *)(v0 + 32), *(void *)(v0 + 40));
  sub_24A11487C(*(void *)(v0 + 48), *(void *)(v0 + 56));
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_24A10DB70()
{
  uint64_t v0 = sub_24A10DB30();
  return MEMORY[0x270FA0228](v0, 88, 7);
}

uint64_t sub_24A10DBA0()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_24A10A208(v0, qword_26976A460);
  sub_24A1058C4(v0, (uint64_t)qword_26976A460);
  static LoggerSubsystem.server.getter();
  type metadata accessor for Downloader();
  sub_24A0FA334(&qword_26976A4A8);
  String.init<A>(describing:)();
  return Logger.init(subsystem:category:)();
}

void sub_24A10DC44(uint64_t *a1, uint64_t a2, uint64_t a3, const char *a4, void *a5, uint64_t a6)
{
  uint64_t v143 = type metadata accessor for Downloader.AssetDownloadResult();
  MEMORY[0x270FA5388](v143);
  v144 = (char *)&v138 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_24A0FA334(&qword_26976A488);
  Class isa = v12[-1].isa;
  v146 = v12;
  MEMORY[0x270FA5388](v12);
  uint64_t v14 = (char *)&v138 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = type metadata accessor for URL.DirectoryHint();
  uint64_t v16 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15);
  uint64_t v18 = (char *)&v138 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_24A0FA334(&qword_26976A490);
  MEMORY[0x270FA5388](v19 - 8);
  uint64_t v21 = (char *)&v138 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = type metadata accessor for URL();
  uint64_t v23 = MEMORY[0x270FA5388](v22);
  unint64_t v26 = (v25 + 15) & 0xFFFFFFFFFFFFFFF0;
  if (a1)
  {
    uint64_t v27 = *a1;
    if (a5)
    {
      type metadata accessor for CFError(0);
      sub_24A1149A0(&qword_26976A4A0, type metadata accessor for CFError);
      uint64_t v28 = (void *)swift_allocError();
      *uint64_t v29 = a5;
      unint64_t v30 = a5;
      swift_retain();
      uint64_t v31 = (void *)_convertErrorToNSError(_:)();

      if (objc_msgSend(v31, sel_code) == (id)51)
      {
        if (qword_26976A060 != -1) {
          swift_once();
        }
        uint64_t v142 = v27;
        uint64_t v32 = type metadata accessor for Logger();
        sub_24A1058C4(v32, (uint64_t)qword_26976A460);
        id v33 = v31;
        uint64_t v34 = Logger.logObject.getter();
        os_log_type_t v35 = static os_log_type_t.error.getter();
        BOOL v36 = os_log_type_enabled(v34, v35);
        v146 = v30;
        if (v36)
        {
          uint64_t v37 = (uint8_t *)swift_slowAlloc();
          uint64_t v38 = (void *)swift_slowAlloc();
          *(_DWORD *)uint64_t v37 = 138412290;
          *(void *)&long long v150 = v33;
          id v39 = v33;
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          *uint64_t v38 = v33;

          _os_log_impl(&dword_24A0F4000, v34, v35, "download failed due to server blocking %@", v37, 0xCu);
          sub_24A0FA334(&qword_26976A250);
          swift_arrayDestroy();
          MEMORY[0x24C5BCA40](v38, -1, -1);
          MEMORY[0x24C5BCA40](v37, -1, -1);
        }
        else
        {
        }
        id v70 = objc_msgSend(v33, sel_localizedDescription);
        uint64_t v71 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        unint64_t v73 = v72;

        *(void *)&long long v150 = 44;
        *((void *)&v150 + 1) = 0xE100000000000000;
        MEMORY[0x270FA5388](v74);
        *(&v138 - 2) = (uint64_t)&v150;
        swift_bridgeObjectRetain();
        uint64_t v75 = sub_24A1045F8(0x7FFFFFFFFFFFFFFFLL, 1u, sub_24A10A378, (uint64_t)(&v138 - 4), v71, v73);
        swift_bridgeObjectRelease();
        uint64_t v76 = *(void *)(v75 + 16);
        if (v76)
        {
          *(void *)&long long v150 = MEMORY[0x263F8EE78];
          sub_24A108E1C();
          uint64_t v77 = v150;
          uint64_t v78 = (uint64_t *)(v75 + 56);
          do
          {
            uint64_t v79 = *(v78 - 3);
            uint64_t v80 = *(v78 - 2);
            uint64_t v81 = *(v78 - 1);
            uint64_t v82 = *v78;
            swift_bridgeObjectRetain();
            uint64_t v83 = MEMORY[0x24C5BC0E0](v79, v80, v81, v82);
            uint64_t v85 = v84;
            swift_bridgeObjectRelease();
            *(void *)&long long v150 = v77;
            unint64_t v86 = *(void *)(v77 + 16);
            if (v86 >= *(void *)(v77 + 24) >> 1)
            {
              sub_24A108E1C();
              uint64_t v77 = v150;
            }
            *(void *)(v77 + 16) = v86 + 1;
            uint64_t v87 = v77 + 16 * v86;
            *(void *)(v87 + 32) = v83;
            *(void *)(v87 + 40) = v85;
            v78 += 4;
            --v76;
          }
          while (v76);
          swift_bridgeObjectRelease();
        }
        else
        {
          swift_bridgeObjectRelease();
          uint64_t v77 = MEMORY[0x263F8EE78];
        }
        uint64_t v96 = type metadata accessor for SimultaneousTransferError();
        sub_24A1149A0(&qword_26976A420, MEMORY[0x263F32288]);
        uint64_t v97 = swift_allocError();
        void *v98 = v77;
        (*(void (**)(void *, void, uint64_t))(*(void *)(v96 - 8) + 104))(v98, *MEMORY[0x263F32280], v96);
        *(void *)&long long v150 = v97;
        sub_24A0FA334(&qword_26976A498);
        AsyncThrowingStream.Continuation.finish(throwing:)();
        swift_release();
      }
      else
      {
        if (qword_26976A060 != -1) {
          swift_once();
        }
        uint64_t v61 = type metadata accessor for Logger();
        sub_24A1058C4(v61, (uint64_t)qword_26976A460);
        id v62 = v31;
        uint64_t v63 = Logger.logObject.getter();
        os_log_type_t v64 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v63, v64))
        {
          uint64_t v65 = (uint8_t *)swift_slowAlloc();
          uint64_t v66 = swift_slowAlloc();
          v146 = v30;
          uint64_t v67 = (void *)v66;
          *(_DWORD *)uint64_t v65 = 138412290;
          *(void *)&long long v150 = v62;
          id v68 = v62;
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          *uint64_t v67 = v62;

          _os_log_impl(&dword_24A0F4000, v63, v64, "mmcs engine returns error %@", v65, 0xCu);
          sub_24A0FA334(&qword_26976A250);
          swift_arrayDestroy();
          unint64_t v30 = v146;
          MEMORY[0x24C5BCA40](v67, -1, -1);
          MEMORY[0x24C5BCA40](v65, -1, -1);
        }
        else
        {
        }
        sub_24A104500();
        *(void *)&long long v150 = swift_allocError();
        sub_24A0FA334(&qword_26976A498);
        AsyncThrowingStream.Continuation.finish(throwing:)();
        swift_release();
      }
      return;
    }
    if (a4)
    {
      uint64_t v138 = a2;
      uint64_t v140 = v24;
      v141 = (char *)&v138 - v26;
      uint64_t v43 = v23;
      uint64_t v44 = self;
      uint64_t v142 = v27;
      swift_retain();
      id v45 = objc_msgSend(v44, sel_defaultManager);
      id v46 = objc_msgSend(v45, sel_stringWithFileSystemRepresentation_length_, a4, strlen(a4));

      static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v139 = v43;
      uint64_t v47 = v43;
      char v48 = v141;
      sub_24A0F600C((uint64_t)v21, 1, 1, v47);
      (*(void (**)(char *, void, uint64_t))(v16 + 104))(v18, *MEMORY[0x263F06E50], v15);
      URL.init(filePath:directoryHint:relativeTo:)();
      if (!a6
        || (*(void *)&v150 = 0, static Dictionary._conditionallyBridgeFromObjectiveC(_:result:)(), (uint64_t v49 = v150) == 0))
      {
        sub_24A104500();
        *(void *)&long long v150 = swift_allocError();
        sub_24A0FA334(&qword_26976A498);
        AsyncThrowingStream.Continuation.finish(throwing:)();
        if (qword_26976A060 != -1) {
          swift_once();
        }
        uint64_t v88 = type metadata accessor for Logger();
        sub_24A1058C4(v88, (uint64_t)qword_26976A460);
        uint64_t v89 = Logger.logObject.getter();
        os_log_type_t v90 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v89, v90))
        {
          v91 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v91 = 0;
          _os_log_impl(&dword_24A0F4000, v89, v90, "mmcs engine returns nil results", v91, 2u);
          MEMORY[0x24C5BCA40](v91, -1, -1);
        }
        swift_release();

        goto LABEL_90;
      }
      if (!*MEMORY[0x263F53568]) {
        goto LABEL_94;
      }
      static String._unconditionallyBridgeFromObjectiveC(_:)();
      sub_24A114C54(v49, &v150);
      swift_bridgeObjectRelease();
      uint64_t v50 = v151;
      sub_24A114898((uint64_t)&v150, &qword_26976A410);
      if (v50)
      {
        static String._unconditionallyBridgeFromObjectiveC(_:)();
        sub_24A114C54(v49, &v148);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v149)
        {
          sub_24A0FAFF4(&v148, &v150);
          sub_24A10A2C0();
          swift_dynamicCast();
          id v51 = v147;
          id v52 = objc_msgSend(v147, sel_code);
          uint64_t v53 = qword_26976A060;
          if (v52 == (id)51)
          {
            if (qword_26976A060 != -1) {
              swift_once();
            }
            uint64_t v54 = type metadata accessor for Logger();
            sub_24A1058C4(v54, (uint64_t)qword_26976A460);
            uint64_t v55 = v51;
            uint64_t v56 = Logger.logObject.getter();
            os_log_type_t v57 = static os_log_type_t.error.getter();
            if (os_log_type_enabled(v56, v57))
            {
              uint64_t v58 = (uint8_t *)swift_slowAlloc();
              unint64_t v59 = (void *)swift_slowAlloc();
              *(_DWORD *)uint64_t v58 = 138412290;
              *(void *)&long long v150 = v55;
              uint64_t v60 = v55;
              char v48 = v141;
              UnsafeMutableRawBufferPointer.copyMemory(from:)();
              *unint64_t v59 = v55;

              _os_log_impl(&dword_24A0F4000, v56, v57, "download failed due to server blocking %@", v58, 0xCu);
              sub_24A0FA334(&qword_26976A250);
              swift_arrayDestroy();
              MEMORY[0x24C5BCA40](v59, -1, -1);
              MEMORY[0x24C5BCA40](v58, -1, -1);
            }
            else
            {

              uint64_t v56 = v55;
            }

            id v113 = [v55 description];
            uint64_t v114 = static String._unconditionallyBridgeFromObjectiveC(_:)();
            unint64_t v116 = v115;

            *(void *)&long long v150 = 44;
            *((void *)&v150 + 1) = 0xE100000000000000;
            MEMORY[0x270FA5388](v117);
            *(&v138 - 2) = (uint64_t)&v150;
            swift_bridgeObjectRetain();
            uint64_t v118 = sub_24A1045F8(0x7FFFFFFFFFFFFFFFLL, 1u, sub_24A10A300, (uint64_t)(&v138 - 4), v114, v116);
            swift_bridgeObjectRelease();
            uint64_t v119 = *(void *)(v118 + 16);
            if (v119)
            {
              *(void *)&long long v150 = MEMORY[0x263F8EE78];
              sub_24A108E1C();
              uint64_t v120 = v150;
              v121 = (uint64_t *)(v118 + 56);
              do
              {
                uint64_t v122 = *(v121 - 3);
                uint64_t v123 = *(v121 - 2);
                uint64_t v124 = *(v121 - 1);
                uint64_t v125 = *v121;
                swift_bridgeObjectRetain();
                uint64_t v126 = MEMORY[0x24C5BC0E0](v122, v123, v124, v125);
                uint64_t v128 = v127;
                swift_bridgeObjectRelease();
                *(void *)&long long v150 = v120;
                unint64_t v129 = *(void *)(v120 + 16);
                if (v129 >= *(void *)(v120 + 24) >> 1)
                {
                  sub_24A108E1C();
                  uint64_t v120 = v150;
                }
                *(void *)(v120 + 16) = v129 + 1;
                uint64_t v130 = v120 + 16 * v129;
                *(void *)(v130 + 32) = v126;
                *(void *)(v130 + 40) = v128;
                v121 += 4;
                --v119;
              }
              while (v119);
              swift_bridgeObjectRelease();
              char v48 = v141;
            }
            else
            {
              swift_bridgeObjectRelease();
              uint64_t v120 = MEMORY[0x263F8EE78];
            }
            uint64_t v135 = type metadata accessor for SimultaneousTransferError();
            sub_24A1149A0(&qword_26976A420, MEMORY[0x263F32288]);
            uint64_t v136 = swift_allocError();
            void *v137 = v120;
            (*(void (**)(void *, void, uint64_t))(*(void *)(v135 - 8) + 104))(v137, *MEMORY[0x263F32280], v135);
            *(void *)&long long v150 = v136;
            sub_24A0FA334(&qword_26976A498);
            AsyncThrowingStream.Continuation.finish(throwing:)();

LABEL_89:
            swift_release();
LABEL_90:
            (*(void (**)(char *, uint64_t))(v140 + 8))(v48, v139);
            return;
          }
LABEL_60:
          if (v53 != -1) {
            swift_once();
          }
          uint64_t v100 = type metadata accessor for Logger();
          sub_24A1058C4(v100, (uint64_t)qword_26976A460);
          v101 = v51;
          v102 = Logger.logObject.getter();
          os_log_type_t v103 = static os_log_type_t.error.getter();
          if (os_log_type_enabled(v102, v103))
          {
            v104 = (uint8_t *)swift_slowAlloc();
            v105 = (void *)swift_slowAlloc();
            *(_DWORD *)v104 = 138412290;
            *(void *)&long long v150 = v101;
            v106 = v101;
            char v48 = v141;
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            void *v105 = v101;

            _os_log_impl(&dword_24A0F4000, v102, v103, "mmcs engine returns error %@", v104, 0xCu);
            sub_24A0FA334(&qword_26976A250);
            swift_arrayDestroy();
            MEMORY[0x24C5BCA40](v105, -1, -1);
            MEMORY[0x24C5BCA40](v104, -1, -1);
          }
          else
          {

            v102 = v101;
          }

          sub_24A104500();
          *(void *)&long long v150 = swift_allocError();
          sub_24A0FA334(&qword_26976A498);
          AsyncThrowingStream.Continuation.finish(throwing:)();

          goto LABEL_89;
        }
        goto LABEL_95;
      }
      if (!*MEMORY[0x263F53570])
      {
LABEL_96:
        __break(1u);
        goto LABEL_97;
      }
      static String._unconditionallyBridgeFromObjectiveC(_:)();
      sub_24A114C54(v49, &v150);
      swift_bridgeObjectRelease();
      if (!v151) {
        goto LABEL_64;
      }
      if ((swift_dynamicCast() & 1) == 0) {
        goto LABEL_65;
      }
      if (!*MEMORY[0x263F53578])
      {
LABEL_98:
        __break(1u);
        return;
      }
      uint64_t v99 = v148;
      static String._unconditionallyBridgeFromObjectiveC(_:)();
      sub_24A114C54(v49, &v150);
      swift_bridgeObjectRelease();
      if (v151)
      {
        if (swift_dynamicCast())
        {
          swift_bridgeObjectRelease();
          uint64_t v53 = v148;
          id v51 = (id)(v99 + v148);
          if (__OFADD__(v99, (void)v148))
          {
LABEL_93:
            __break(1u);
LABEL_94:
            __break(1u);
LABEL_95:
            __break(1u);
            goto LABEL_96;
          }
          if ((uint64_t)v51 < v99)
          {
            __break(1u);
            goto LABEL_60;
          }
          goto LABEL_70;
        }
      }
      else
      {
LABEL_64:
        sub_24A114898((uint64_t)&v150, &qword_26976A410);
      }
LABEL_65:
      if (!*MEMORY[0x263F534E0])
      {
LABEL_97:
        __break(1u);
        goto LABEL_98;
      }
      static String._unconditionallyBridgeFromObjectiveC(_:)();
      sub_24A114C54(v49, &v150);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v151)
      {
        if (swift_dynamicCast())
        {
          id v51 = (id)v148;
          if ((v148 & 0x8000000000000000) != 0)
          {
LABEL_92:
            __break(1u);
            goto LABEL_93;
          }
          uint64_t v99 = 0;
LABEL_70:
          uint64_t v107 = v138;
          if ((v138 & 0x8000000000000000) == 0)
          {
            uint64_t v108 = v143;
            v109 = v144;
            uint64_t v111 = v139;
            uint64_t v110 = v140;
            (*(void (**)(char *, char *, uint64_t))(v140 + 16))(&v144[*(int *)(v143 + 20)], v48, v139);
            void *v109 = v107;
            v112 = (void *)((char *)v109 + *(int *)(v108 + 24));
            uint64_t *v112 = v99;
            v112[1] = (uint64_t)v51;
            sub_24A0FA334(&qword_26976A498);
            AsyncThrowingStream.Continuation.yield(_:)();
            swift_release();
            (*((void (**)(char *, NSObject *))isa + 1))(v14, v146);
            (*(void (**)(char *, uint64_t))(v110 + 8))(v48, v111);
            return;
          }
          __break(1u);
          goto LABEL_92;
        }
      }
      else
      {
        sub_24A114898((uint64_t)&v150, &qword_26976A410);
      }
      if (qword_26976A060 != -1) {
        swift_once();
      }
      uint64_t v131 = type metadata accessor for Logger();
      sub_24A1058C4(v131, (uint64_t)qword_26976A460);
      v132 = Logger.logObject.getter();
      os_log_type_t v133 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v132, v133))
      {
        v134 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v134 = 0;
        _os_log_impl(&dword_24A0F4000, v132, v133, "", v134, 2u);
        MEMORY[0x24C5BCA40](v134, -1, -1);
      }

      sub_24A104500();
      *(void *)&long long v150 = swift_allocError();
      sub_24A0FA334(&qword_26976A498);
      AsyncThrowingStream.Continuation.finish(throwing:)();
      goto LABEL_89;
    }
    sub_24A104500();
    *(void *)&long long v150 = swift_allocError();
    swift_retain();
    sub_24A0FA334(&qword_26976A498);
    AsyncThrowingStream.Continuation.finish(throwing:)();
    if (qword_26976A060 != -1) {
      swift_once();
    }
    uint64_t v92 = type metadata accessor for Logger();
    sub_24A1058C4(v92, (uint64_t)qword_26976A460);
    long long v93 = Logger.logObject.getter();
    os_log_type_t v94 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v93, v94))
    {
      long long v95 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)long long v95 = 134349056;
      *(void *)&long long v150 = a2;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_24A0F4000, v93, v94, "file path for asset with tracking number %{public}llu is nil", v95, 0xCu);
      MEMORY[0x24C5BCA40](v95, -1, -1);
      swift_release();
    }
    else
    {

      swift_release();
    }
  }
  else
  {
    if (qword_26976A060 != -1) {
      swift_once();
    }
    uint64_t v40 = type metadata accessor for Logger();
    sub_24A1058C4(v40, (uint64_t)qword_26976A460);
    v146 = Logger.logObject.getter();
    os_log_type_t v41 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v146, v41))
    {
      unint64_t v42 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)unint64_t v42 = 134349056;
      *(void *)&long long v150 = a2;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_24A0F4000, v146, v41, "context for downloading asset with tracking number %{public}llu can not be loaded", v42, 0xCu);
      MEMORY[0x24C5BCA40](v42, -1, -1);
    }
    else
    {
      uint64_t v69 = v146;
    }
  }
}

void sub_24A10F284(uint64_t *a1, uint64_t a2, uint64_t a3, const char *a4, void *a5, void *a6)
{
  id v12 = a5;
  id v13 = a6;
  sub_24A10DC44(a1, a2, a3, a4, a5, (uint64_t)a6);
}

uint64_t sub_24A10F31C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v7[11] = a6;
  v7[12] = v6;
  v7[9] = a4;
  v7[10] = a5;
  v7[7] = a2;
  v7[8] = a3;
  v7[6] = a1;
  v7[13] = *v6;
  uint64_t v8 = sub_24A0FA334(&qword_26976A4C0);
  v7[14] = v8;
  v7[15] = *(void *)(v8 - 8);
  v7[16] = swift_task_alloc();
  uint64_t v9 = sub_24A0FA334(&qword_26976A4C8);
  v7[17] = v9;
  v7[18] = *(void *)(v9 - 8);
  v7[19] = swift_task_alloc();
  uint64_t v10 = type metadata accessor for TaskPriority();
  v7[20] = v10;
  v7[21] = *(void *)(v10 - 8);
  v7[22] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24A10F4D0, 0, 0);
}

uint64_t sub_24A10F4D0()
{
  uint64_t v28 = v0;
  if (qword_26976A060 != -1) {
    swift_once();
  }
  uint64_t v1 = type metadata accessor for Logger();
  sub_24A1058C4(v1, (uint64_t)qword_26976A460);
  swift_bridgeObjectRetain_n();
  uint64_t v2 = Logger.logObject.getter();
  os_log_type_t v3 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = swift_slowAlloc();
    v27[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 136315394;
    uint64_t v5 = type metadata accessor for AssetDownloadRequest();
    uint64_t v6 = swift_bridgeObjectRetain();
    uint64_t v7 = MEMORY[0x24C5BC170](v6, v5);
    os_log_type_t type = v3;
    uint64_t v9 = v8;
    swift_bridgeObjectRelease();
    v0[4] = sub_24A10590C(v7, v9, v27);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    sub_24A10A950();
    *(_WORD *)(v4 + 12) = 2080;
    static Task<>.currentPriority.getter();
    sub_24A1149A0(&qword_26976A1E8, MEMORY[0x263F8F520]);
    uint64_t v10 = dispatch thunk of CustomStringConvertible.description.getter();
    uint64_t v12 = v11;
    sub_24A114BF0();
    v13();
    v0[5] = sub_24A10590C(v10, v12, v27);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24A0F4000, v2, type, "processing %s with priority %s", (uint8_t *)v4, 0x16u);
    swift_arrayDestroy();
    sub_24A10A3DC();
    sub_24A10A3DC();
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  uint64_t v14 = v0[7];
  uint64_t v15 = *(void **)(*(void *)(*(void *)(v0[12] + 16) + 24)
                   + OBJC_IVAR____TtC16CloudAssetDaemon13TenantContext_requestTracker);
  v0[23] = v15;
  swift_retain_n();
  uint64_t v16 = sub_24A10B514(v14, v15);
  v0[24] = sub_24A0FDAE4(v16);
  swift_bridgeObjectRetain_n();
  uint64_t v17 = Logger.logObject.getter();
  os_log_type_t v18 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v17, v18))
  {
    uint64_t v19 = (uint8_t *)sub_24A114BC0();
    v27[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v19 = 136315138;
    type metadata accessor for Asset();
    swift_bridgeObjectRetain();
    uint64_t v20 = Dictionary.Keys.description.getter();
    uint64_t v22 = v21;
    swift_bridgeObjectRelease();
    v0[3] = sub_24A10590C(v20, v22, v27);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_24A0F4000, v17, v18, "start downloading assets with tracking numbers %s", v19, 0xCu);
    swift_arrayDestroy();
    sub_24A10A3DC();
    sub_24A10A3DC();
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  swift_task_alloc();
  sub_24A10AB88();
  v0[25] = v23;
  *uint64_t v23 = v24;
  v23[1] = sub_24A10F960;
  return sub_24A10FCAC();
}

uint64_t sub_24A10F960()
{
  sub_24A0FB128();
  *os_log_type_t v3 = v2;
  *os_log_type_t v3 = *v1;
  *(void *)(v2 + 208) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  sub_24A0FB244();
  return MEMORY[0x270FA2498](v4, v5, v6);
}

uint64_t sub_24A10FA8C()
{
  uint64_t v1 = v0[19];
  uint64_t v2 = v0[15];
  uint64_t v13 = v0[16];
  uint64_t v14 = v0[14];
  uint64_t v11 = v0[23];
  uint64_t v12 = v0[13];
  uint64_t v4 = v0[8];
  uint64_t v3 = v0[9];
  uint64_t v5 = v0[10];
  uint64_t v6 = v0[11];
  uint64_t v7 = (void *)swift_task_alloc();
  v7[2] = v1;
  v7[3] = v11;
  v7[4] = v4;
  v7[5] = v3;
  v7[6] = v5;
  v7[7] = v6;
  v7[8] = v12;
  type metadata accessor for DownloadResponseMessage();
  (*(void (**)(uint64_t, void, uint64_t))(v2 + 104))(v13, *MEMORY[0x263F8F680], v14);
  AsyncThrowingStream.init<>(_:bufferingPolicy:_:)();
  swift_release();
  sub_24A114BF0();
  v8();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_24A0FB280();
  return v9();
}

uint64_t sub_24A10FC24()
{
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_24A0FB1D0();
  return v0();
}

uint64_t sub_24A10FCAC()
{
  sub_24A0FB204();
  v1[4] = v2;
  v1[5] = v0;
  v1[3] = v3;
  v1[6] = *v0;
  uint64_t v4 = sub_24A0FA334(&qword_26976A528);
  v1[7] = v4;
  sub_24A0FB024(v4);
  v1[8] = v5;
  v1[9] = swift_task_alloc();
  sub_24A0FB244();
  return MEMORY[0x270FA2498](v6, v7, v8);
}

uint64_t sub_24A10FD70()
{
  uint64_t v2 = v0[8];
  uint64_t v1 = v0[9];
  uint64_t v4 = v0[6];
  uint64_t v3 = v0[7];
  uint64_t v5 = v0[5];
  uint64_t v6 = *(void *)(*(void *)(*(void *)(v5 + 16) + 24)
                 + OBJC_IVAR____TtC16CloudAssetDaemon13TenantContext_requestTracker);
  swift_retain();
  uint64_t v7 = swift_bridgeObjectRetain();
  uint64_t v8 = sub_24A10C744(v7);
  uint64_t v9 = sub_24A10B080(v8);
  swift_bridgeObjectRelease();
  uint64_t v10 = (void *)swift_task_alloc();
  uint64_t v10[2] = v9;
  v10[3] = v6;
  v10[4] = v5;
  v10[5] = v4;
  type metadata accessor for Downloader.AssetDownloadResult();
  (*(void (**)(uint64_t, void, uint64_t))(v2 + 104))(v1, *MEMORY[0x263F8F680], v3);
  AsyncThrowingStream.init<>(_:bufferingPolicy:_:)();
  swift_bridgeObjectRelease();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_24A0FB280();
  return v11();
}

uint64_t sub_24A10FED4(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7, uint64_t a8)
{
  unint64_t v35 = a4;
  uint64_t v36 = a3;
  uint64_t v33 = a2;
  unint64_t v37 = HIDWORD(a4);
  unint64_t v38 = a5;
  unint64_t v39 = HIDWORD(a5);
  unint64_t v40 = a6;
  unint64_t v41 = HIDWORD(a6);
  unint64_t v42 = a7;
  unint64_t v43 = HIDWORD(a7);
  uint64_t v44 = a8;
  uint64_t v9 = sub_24A0FA334(&qword_26976A4D8);
  uint64_t v31 = v9;
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  MEMORY[0x270FA5388](v9);
  uint64_t v32 = (char *)&v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_24A0FA334(&qword_26976A4C8);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = *(void *)(v13 + 64);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v31 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_24A0FA334(&qword_26976A0D0);
  MEMORY[0x270FA5388](v16 - 8);
  os_log_type_t v18 = (char *)&v31 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = v18;
  uint64_t v19 = type metadata accessor for TaskPriority();
  sub_24A0F600C((uint64_t)v18, 1, 1, v19);
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v15, v33, v12);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))((char *)&v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v9);
  unint64_t v20 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  unint64_t v21 = (v14 + v20 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v22 = (v21 + 11) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v23 = (*(unsigned __int8 *)(v10 + 80) + v22 + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  unint64_t v24 = (v11 + v23 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v25 = swift_allocObject();
  *(void *)(v25 + 16) = 0;
  *(void *)(v25 + 24) = 0;
  (*(void (**)(unint64_t, char *, uint64_t))(v13 + 32))(v25 + v20, v15, v12);
  int v26 = v35;
  *(void *)(v25 + v21) = v36;
  uint64_t v27 = (_DWORD *)(v25 + v22);
  int v28 = v37;
  _DWORD *v27 = v26;
  v27[1] = v28;
  int v29 = v39;
  uint64_t v27[2] = v38;
  v27[3] = v29;
  v27[4] = v40;
  v27[5] = v41;
  v27[6] = v42;
  v27[7] = v43;
  (*(void (**)(unint64_t, char *, uint64_t))(v10 + 32))(v25 + v23, v32, v31);
  *(void *)(v25 + v24) = v44;
  swift_retain();
  sub_24A0F7EC4((uint64_t)v34, (uint64_t)&unk_26976A4E8, v25);
  return swift_release();
}

uint64_t sub_24A1101F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[23] = v18;
  v8[24] = v19;
  v8[21] = a7;
  v8[22] = a8;
  v8[19] = a5;
  v8[20] = a6;
  v8[18] = a4;
  uint64_t v9 = type metadata accessor for SimultaneousTransferError();
  v8[25] = v9;
  v8[26] = *(void *)(v9 - 8);
  v8[27] = swift_task_alloc();
  uint64_t v10 = type metadata accessor for URL();
  v8[28] = v10;
  v8[29] = *(void *)(v10 - 8);
  v8[30] = swift_task_alloc();
  type metadata accessor for Asset();
  v8[31] = swift_task_alloc();
  uint64_t v11 = type metadata accessor for UUID();
  v8[32] = v11;
  v8[33] = *(void *)(v11 - 8);
  v8[34] = swift_task_alloc();
  uint64_t v12 = type metadata accessor for DownloadResponseMessage();
  v8[35] = v12;
  v8[36] = *(void *)(v12 - 8);
  v8[37] = swift_task_alloc();
  uint64_t v13 = sub_24A0FA334(&qword_26976A4F0);
  v8[38] = v13;
  v8[39] = *(void *)(v13 - 8);
  unsigned char v8[40] = swift_task_alloc();
  uint64_t v14 = type metadata accessor for AssetDownloadRequest();
  v8[41] = v14;
  v8[42] = *(void *)(v14 - 8);
  v8[43] = swift_task_alloc();
  v8[44] = swift_task_alloc();
  v8[45] = swift_task_alloc();
  v8[46] = type metadata accessor for Downloader.AssetDownloadResult();
  v8[47] = swift_task_alloc();
  v8[48] = swift_task_alloc();
  v8[49] = swift_task_alloc();
  v8[50] = swift_task_alloc();
  v8[51] = swift_task_alloc();
  sub_24A0FA334(&qword_26976A4F8);
  v8[52] = swift_task_alloc();
  uint64_t v15 = sub_24A0FA334(&qword_26976A500);
  v8[53] = v15;
  v8[54] = *(void *)(v15 - 8);
  v8[55] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24A1105D0, 0, 0);
}

uint64_t sub_24A1105D0()
{
  uint64_t v1 = sub_24A0FA334(&qword_26976A4C8);
  MEMORY[0x24C5BC240](v1);
  *(void *)(v0 + 448) = *MEMORY[0x263EF8008];
  uint64_t v2 = (_DWORD *)MEMORY[0x263F32230];
  *(_DWORD *)(v0 + 504) = *MEMORY[0x263F322B8];
  *(_DWORD *)(v0 + 508) = *v2;
  swift_task_alloc();
  sub_24A10AB88();
  *(void *)(v0 + 456) = v3;
  *uint64_t v3 = v4;
  v3[1] = sub_24A1106C0;
  sub_24A114BFC();
  return MEMORY[0x270FA20F8](v5);
}

uint64_t sub_24A1106C0()
{
  sub_24A0FB204();
  sub_24A0FB00C();
  sub_24A0FB128();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  sub_24A0FB128();
  *uint64_t v5 = v4;
  *(void *)(v6 + 464) = v0;
  swift_task_dealloc();
  sub_24A0FB244();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_24A1107A0()
{
  v146 = v0;
  uint64_t v1 = v0;
  uint64_t v2 = v0[52];
  if (sub_24A0F5F50(v2, 1, v0[46]) == 1)
  {
    sub_24A0FB1DC();
    v3();
LABEL_33:
    v1[7] = 0;
    sub_24A0FA334(&qword_26976A4D8);
    AsyncThrowingStream.Continuation.finish(throwing:)();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v120 = (uint64_t (*)(void))v1[1];
    return v120();
  }
  uint64_t v4 = (void *)v0[58];
  uint64_t v5 = (uint64_t *)v0[51];
  sub_24A1146A0(v2, (uint64_t)v5);
  sub_24A114D74(*v5, (uint64_t)(v0 + 2));
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = v0[54];
    uint64_t v8 = v0[55];
    uint64_t v9 = v0[53];
    sub_24A114704(v1[51]);
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v8, v9);
    goto LABEL_5;
  }
  uint64_t v30 = v0[51];
  uint64_t v31 = v1[46];
  uint64_t v33 = v1[22];
  uint64_t v32 = v1[23];
  uint64_t v35 = v1[20];
  uint64_t v34 = v1[21];
  sub_24A0FA334(&qword_26976A350);
  sub_24A114BD8();
  swift_dynamicCast();
  uint64_t v36 = v30 + *(int *)(v31 + 20);
  URL.path(percentEncoded:)(1);
  String.utf8CString.getter();
  swift_bridgeObjectRelease();
  v1[59] = v35;
  v1[60] = v34;
  v1[61] = v33;
  v1[62] = v32;
  uint64_t v37 = sandbox_extension_issue_file_to_process();
  swift_release();
  if (!v37)
  {
    if (qword_26976A060 != -1) {
      swift_once();
    }
    uint64_t v93 = v1[50];
    uint64_t v94 = v1[51];
    uint64_t v96 = v1[44];
    uint64_t v95 = v1[45];
    uint64_t v98 = v1[41];
    uint64_t v97 = v1[42];
    uint64_t v99 = type metadata accessor for Logger();
    sub_24A1058C4(v99, (uint64_t)qword_26976A460);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v97 + 16))(v96, v95, v98);
    sub_24A114760(v94, v93);
    uint64_t v100 = Logger.logObject.getter();
    os_log_type_t v101 = static os_log_type_t.error.getter();
    BOOL v102 = os_log_type_enabled(v100, v101);
    uint64_t v103 = v1[50];
    if (v102)
    {
      uint64_t v133 = v1[44];
      uint64_t v104 = v1[42];
      uint64_t v143 = v1[41];
      uint64_t v105 = v1[33];
      uint64_t v106 = v1[34];
      uint64_t v135 = v1[50];
      uint64_t v107 = v1[32];
      uint64_t v108 = swift_slowAlloc();
      v145[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v108 = 136315394;
      os_log_type_t v138 = v101;
      AssetDownloadRequest.id.getter();
      sub_24A1149A0(&qword_26976A518, MEMORY[0x263F07508]);
      uint64_t v109 = dispatch thunk of CustomStringConvertible.description.getter();
      uint64_t v111 = v110;
      (*(void (**)(uint64_t, uint64_t))(v105 + 8))(v106, v107);
      v1[12] = sub_24A10590C(v109, v111, v145);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      uint64_t v112 = v143;
      v144 = *(void (**)(uint64_t, uint64_t))(v104 + 8);
      v144(v133, v112);
      *(_WORD *)(v108 + 12) = 2080;
      sub_24A1149A0(&qword_26976A520, MEMORY[0x263F06EA8]);
      uint64_t v113 = dispatch thunk of CustomStringConvertible.description.getter();
      v1[13] = sub_24A10590C(v113, v114, v145);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      sub_24A114704(v135);
      _os_log_impl(&dword_24A0F4000, v100, v138, "[request id = %s] failed to issue sandbox extension token for file at %s", (uint8_t *)v108, 0x16u);
      swift_arrayDestroy();
      sub_24A10A3DC();
      sub_24A10A3DC();
    }
    else
    {
      v144 = *(void (**)(uint64_t, uint64_t))(v1[42] + 8);
      sub_24A0FB1DC();
      v121();
      sub_24A114704(v103);
    }

    uint64_t v123 = v1[54];
    uint64_t v122 = v1[55];
    uint64_t v124 = v1[53];
    uint64_t v125 = v1[51];
    uint64_t v126 = v1[45];
    uint64_t v127 = v1[41];
    sub_24A104500();
    uint64_t v6 = (void *)swift_allocError();
    swift_willThrow();
    sub_24A114704(v125);
    (*(void (**)(uint64_t, uint64_t))(v123 + 8))(v122, v124);
    v144(v126, v127);
LABEL_5:
    v1[10] = (uint64_t)v6;
    id v10 = v6;
    sub_24A0FA334(&qword_26976A248);
    sub_24A114BD8();
    if (swift_dynamicCast())
    {
      uint64_t v11 = (*(uint64_t (**)(uint64_t, uint64_t))(v1[26] + 88))(v1[27], v1[25]);
      if (v11 == *MEMORY[0x263F32280])
      {
        uint64_t v12 = v11;
        uint64_t v14 = v1[39];
        uint64_t v13 = v1[40];
        uint64_t v15 = (void *)v1[37];
        os_log_t log = (os_log_t)v1[38];
        uint64_t v16 = v1[36];
        uint64_t v17 = v1[26];
        uint64_t v18 = (void *)v1[27];
        uint64_t v19 = v1[25];
        *(void *)os_log_type_t type = v1[35];

        (*(void (**)(void *, uint64_t))(v17 + 96))(v18, v19);
        *uint64_t v15 = *v18;
        (*(void (**)(void *, uint64_t, uint64_t))(v17 + 104))(v15, v12, v19);
        (*(void (**)(void *, void, os_log_type_t *))(v16 + 104))(v15, *MEMORY[0x263F32228], *(os_log_type_t **)type);
        swift_bridgeObjectRetain();
        sub_24A0FA334(&qword_26976A4D8);
        AsyncThrowingStream.Continuation.yield(_:)();
        (*(void (**)(uint64_t, os_log_t))(v14 + 8))(v13, log);
        if (qword_26976A060 != -1) {
          swift_once();
        }
        uint64_t v20 = type metadata accessor for Logger();
        sub_24A1058C4(v20, (uint64_t)qword_26976A460);
        swift_bridgeObjectRetain();
        unint64_t v21 = Logger.logObject.getter();
        os_log_type_t v22 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v21, v22))
        {
          unint64_t v23 = (_DWORD *)sub_24A114BC0();
          v145[0] = swift_slowAlloc();
          *unint64_t v23 = 136315138;
          uint64_t v24 = swift_bridgeObjectRetain();
          uint64_t v25 = MEMORY[0x24C5BC170](v24, MEMORY[0x263F8D310]);
          uint64_t v27 = v26;
          swift_bridgeObjectRelease();
          v1[9] = sub_24A10590C(v25, v27, v145);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease();
          sub_24A10A950();
          sub_24A10AAD0(&dword_24A0F4000, v28, v29, "failed to download due to server blocking %s");
          swift_arrayDestroy();
          sub_24A10A3DC();
          sub_24A10A3DC();
        }
        else
        {
          sub_24A10A950();
        }

        uint64_t v92 = (void *)v1[10];
        goto LABEL_32;
      }
      (*(void (**)(uint64_t, uint64_t))(v1[26] + 8))(v1[27], v1[25]);
    }
    uint64_t v75 = *((unsigned int *)v1 + 127);
    uint64_t v77 = v1[39];
    uint64_t v76 = v1[40];
    uint64_t v78 = v1[37];
    uint64_t v142 = v1[38];
    uint64_t v79 = v1[35];
    uint64_t v80 = v1[36];

    uint64_t v81 = (void *)(v78 + *(int *)(sub_24A0FA334(&qword_26976A508) + 48));
    sub_24A0FA334(&qword_26976A510);
    sub_24A114BAC();
    sub_24A114BE4();
    v82();
    *uint64_t v81 = 0;
    v81[1] = 0xE000000000000000;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v80 + 104))(v78, v75, v79);
    sub_24A0FA334(&qword_26976A4D8);
    AsyncThrowingStream.Continuation.yield(_:)();
    (*(void (**)(uint64_t, uint64_t))(v77 + 8))(v76, v142);
    if (qword_26976A060 != -1) {
      swift_once();
    }
    uint64_t v83 = type metadata accessor for Logger();
    sub_24A1058C4(v83, (uint64_t)qword_26976A460);
    id v84 = v6;
    id v85 = v6;
    unint64_t v86 = Logger.logObject.getter();
    os_log_type_t v87 = static os_log_type_t.error.getter();
    if (!os_log_type_enabled(v86, v87))
    {

      goto LABEL_33;
    }
    uint64_t v88 = (uint8_t *)sub_24A114BC0();
    uint64_t v89 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v88 = 138412290;
    id v90 = v6;
    uint64_t v91 = _swift_stdlib_bridgeErrorToNSError();
    v1[8] = v91;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v89 = v91;

    _os_log_impl(&dword_24A0F4000, v86, v87, "failed to download assets with %@", v88, 0xCu);
    sub_24A0FA334(&qword_26976A250);
    swift_arrayDestroy();
    sub_24A10A3DC();
    sub_24A10A3DC();

    uint64_t v92 = v6;
LABEL_32:

    goto LABEL_33;
  }
  uint64_t v38 = v1[37];
  uint64_t v39 = v1[30];
  uint64_t v40 = v1[28];
  uint64_t v41 = v1[29];
  v132 = (uint64_t *)(v38 + *(int *)(sub_24A0FA334(&qword_26976A508) + 48));
  AssetDownloadRequest.id.getter();
  AssetDownloadRequest.asset.getter();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v41 + 16))(v39, v36, v40);
  AssetDownloadResponse.init(id:asset:fileURL:range:)();
  sub_24A0FA334(&qword_26976A510);
  sub_24A114BAC();
  sub_24A114BE4();
  v42();
  uint64_t *v132 = String.init(cString:)();
  v132[1] = v43;
  sub_24A114BE4();
  v44();
  sub_24A0FA334(&qword_26976A4D8);
  AsyncThrowingStream.Continuation.yield(_:)();
  sub_24A114BF0();
  v45();
  if (qword_26976A060 != -1) {
    swift_once();
  }
  uint64_t v46 = v1[51];
  uint64_t v48 = v1[48];
  uint64_t v47 = v1[49];
  uint64_t v49 = v1[47];
  uint64_t v50 = v1[45];
  uint64_t v52 = v1[42];
  uint64_t v51 = v1[43];
  uint64_t v53 = v1[41];
  uint64_t v54 = type metadata accessor for Logger();
  sub_24A1058C4(v54, (uint64_t)qword_26976A460);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v52 + 16))(v51, v50, v53);
  sub_24A114760(v46, v47);
  sub_24A114760(v46, v48);
  sub_24A114760(v46, v49);
  uint64_t v55 = Logger.logObject.getter();
  os_log_type_t v56 = static os_log_type_t.default.getter();
  BOOL v57 = os_log_type_enabled(v55, v56);
  uint64_t v141 = v1[51];
  uint64_t v59 = v1[48];
  uint64_t v58 = (uint64_t *)v1[49];
  uint64_t v60 = v1[47];
  if (v57)
  {
    uint64_t v129 = v1[43];
    loga = v55;
    uint64_t v61 = v1[42];
    uint64_t v130 = v1[41];
    uint64_t v131 = v1[48];
    uint64_t v134 = v1[47];
    uint64_t v62 = v1[33];
    uint64_t v63 = v1[34];
    uint64_t v64 = v1[32];
    uint64_t v65 = swift_slowAlloc();
    v145[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v65 = 136315906;
    os_log_type_t typea = v56;
    AssetDownloadRequest.id.getter();
    sub_24A1149A0(&qword_26976A518, MEMORY[0x263F07508]);
    uint64_t v66 = dispatch thunk of CustomStringConvertible.description.getter();
    uint64_t v68 = v67;
    (*(void (**)(uint64_t, uint64_t))(v62 + 8))(v63, v64);
    v1[14] = sub_24A10590C(v66, v68, v145);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    uint64_t v69 = *(void (**)(void))(v61 + 8);
    ((void (*)(uint64_t, uint64_t))v69)(v129, v130);
    *(_WORD *)(v65 + 12) = 2050;
    uint64_t v70 = *v58;
    sub_24A114704((uint64_t)v58);
    v1[15] = v70;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v65 + 22) = 2080;
    sub_24A1149A0(&qword_26976A520, MEMORY[0x263F06EA8]);
    uint64_t v71 = dispatch thunk of CustomStringConvertible.description.getter();
    v1[16] = sub_24A10590C(v71, v72, v145);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    sub_24A114704(v131);
    *(_WORD *)(v65 + 32) = 2080;
    uint64_t v73 = sub_24A1147C4();
    v1[17] = sub_24A10590C(v73, v74, v145);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    sub_24A114704(v134);
    _os_log_impl(&dword_24A0F4000, loga, typea, "[request id = %s] downloaded asset with tracking number %{public}ld at %s for range %s", (uint8_t *)v65, 0x2Au);
    swift_arrayDestroy();
    sub_24A10A3DC();
    sub_24A10A3DC();
  }
  else
  {
    uint64_t v116 = v1[42];
    uint64_t v115 = v1[43];
    uint64_t v117 = v1[41];
    sub_24A114704(v1[49]);

    sub_24A114704(v60);
    sub_24A114704(v59);
    uint64_t v69 = *(void (**)(void))(v116 + 8);
    ((void (*)(uint64_t, uint64_t))v69)(v115, v117);
  }
  sub_24A114704(v141);
  sub_24A0FB1DC();
  v69();
  uint64_t v118 = (void *)swift_task_alloc();
  v1[57] = (uint64_t)v118;
  *uint64_t v118 = v1;
  v118[1] = sub_24A1106C0;
  sub_24A114BFC();
  return MEMORY[0x270FA20F8](v119);
}

uint64_t sub_24A111850()
{
  uint64_t v51 = v0;
  uint64_t v1 = v0;
  sub_24A0FB1DC();
  v2();
  uint64_t v3 = *(void **)(v0 + 88);
  *(void *)(v0 + 80) = v3;
  uint64_t v4 = (void **)(v0 + 80);
  id v5 = v3;
  sub_24A0FA334(&qword_26976A248);
  sub_24A114BD8();
  if (swift_dynamicCast())
  {
    uint64_t v6 = (*(uint64_t (**)(void, void))(*(void *)(v1 + 208) + 88))(*(void *)(v1 + 216), *(void *)(v1 + 200));
    if (v6 == *MEMORY[0x263F32280])
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)(v1 + 312);
      uint64_t v9 = *(void **)(v1 + 296);
      uint64_t v48 = *(void *)(v1 + 304);
      uint64_t v10 = *(void *)(v1 + 288);
      uint64_t v45 = *(void *)(v1 + 280);
      uint64_t v11 = *(void *)(v1 + 208);
      uint64_t v12 = *(void **)(v1 + 216);
      uint64_t v13 = *(void *)(v1 + 200);
      uint64_t v46 = *(void *)(v1 + 320);

      (*(void (**)(void *, uint64_t))(v11 + 96))(v12, v13);
      *uint64_t v9 = *v12;
      (*(void (**)(void *, uint64_t, uint64_t))(v11 + 104))(v9, v7, v13);
      (*(void (**)(void *, void, uint64_t))(v10 + 104))(v9, *MEMORY[0x263F32228], v45);
      swift_bridgeObjectRetain();
      sub_24A0FA334(&qword_26976A4D8);
      AsyncThrowingStream.Continuation.yield(_:)();
      (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v46, v48);
      if (qword_26976A060 != -1) {
        swift_once();
      }
      uint64_t v14 = type metadata accessor for Logger();
      sub_24A1058C4(v14, (uint64_t)qword_26976A460);
      swift_bridgeObjectRetain();
      uint64_t v15 = Logger.logObject.getter();
      os_log_type_t v16 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v15, v16))
      {
        uint64_t v17 = (_DWORD *)sub_24A114BC0();
        uint64_t v18 = swift_slowAlloc();
        _DWORD *v17 = 136315138;
        uint64_t v50 = v18;
        uint64_t v19 = swift_bridgeObjectRetain();
        uint64_t v20 = MEMORY[0x24C5BC170](v19, MEMORY[0x263F8D310]);
        uint64_t v22 = v21;
        swift_bridgeObjectRelease();
        *(v4 - 1) = (void *)sub_24A10590C(v20, v22, &v50);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        sub_24A10A950();
        sub_24A10AAD0(&dword_24A0F4000, v23, v24, "failed to download due to server blocking %s");
        swift_arrayDestroy();
        sub_24A10A3DC();
        sub_24A10A3DC();
      }
      else
      {
        sub_24A10A950();
      }

      unint64_t v42 = *v4;
      goto LABEL_15;
    }
    (*(void (**)(void, void))(*(void *)(v1 + 208) + 8))(*(void *)(v1 + 216), *(void *)(v1 + 200));
  }
  uint64_t v49 = v4;
  uint64_t v25 = *(unsigned int *)(v1 + 508);
  uint64_t v27 = *(void *)(v1 + 312);
  uint64_t v26 = *(void *)(v1 + 320);
  uint64_t v28 = *(void *)(v1 + 296);
  uint64_t v30 = *(void *)(v1 + 280);
  uint64_t v29 = *(void *)(v1 + 288);
  uint64_t v47 = *(void *)(v1 + 304);

  uint64_t v31 = (void *)(v28 + *(int *)(sub_24A0FA334(&qword_26976A508) + 48));
  sub_24A0FA334(&qword_26976A510);
  sub_24A114BAC();
  sub_24A114BE4();
  v32();
  *uint64_t v31 = 0;
  v31[1] = 0xE000000000000000;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v29 + 104))(v28, v25, v30);
  sub_24A0FA334(&qword_26976A4D8);
  AsyncThrowingStream.Continuation.yield(_:)();
  (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v26, v47);
  if (qword_26976A060 != -1) {
    swift_once();
  }
  uint64_t v33 = type metadata accessor for Logger();
  sub_24A1058C4(v33, (uint64_t)qword_26976A460);
  id v34 = v3;
  id v35 = v3;
  uint64_t v36 = Logger.logObject.getter();
  os_log_type_t v37 = static os_log_type_t.error.getter();
  if (!os_log_type_enabled(v36, v37))
  {

    goto LABEL_16;
  }
  uint64_t v38 = (uint8_t *)sub_24A114BC0();
  uint64_t v39 = (void *)swift_slowAlloc();
  *(_DWORD *)uint64_t v38 = 138412290;
  id v40 = v3;
  uint64_t v41 = _swift_stdlib_bridgeErrorToNSError();
  *(v49 - 2) = (void *)v41;
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  *uint64_t v39 = v41;

  _os_log_impl(&dword_24A0F4000, v36, v37, "failed to download assets with %@", v38, 0xCu);
  sub_24A0FA334(&qword_26976A250);
  swift_arrayDestroy();
  sub_24A10A3DC();
  sub_24A10A3DC();

  unint64_t v42 = v3;
LABEL_15:

LABEL_16:
  *(void *)(v1 + 56) = 0;
  sub_24A0FA334(&qword_26976A4D8);
  AsyncThrowingStream.Continuation.finish(throwing:)();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v43 = *(uint64_t (**)(void))(v1 + 8);
  return v43();
}

uint64_t sub_24A111EB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v191 = a4;
  uint64_t v211 = a3;
  uint64_t v203 = a1;
  uint64_t v239 = *MEMORY[0x263EF8340];
  uint64_t v229 = type metadata accessor for String.Encoding();
  uint64_t v5 = *(void *)(v229 - 8);
  MEMORY[0x270FA5388](v229);
  v228 = (char *)v181 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v225 = type metadata accessor for Data.Iterator();
  uint64_t v7 = *(void *)(v225 - 8);
  MEMORY[0x270FA5388](v225);
  v224 = (char *)v181 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v202 = sub_24A0FA334(&qword_26976A498);
  uint64_t v9 = *(void *)(v202 - 8);
  MEMORY[0x270FA5388](v202);
  v192 = (char *)v181 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_24A0FA334(&qword_26976A530);
  MEMORY[0x270FA5388](v11 - 8);
  v209 = (char *)v181 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v218 = type metadata accessor for AssetDownloadRequest();
  uint64_t v13 = *(void *)(v218 - 8);
  MEMORY[0x270FA5388](v218);
  v210 = (char *)v181 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_24A0FA334(&qword_26976A290);
  MEMORY[0x270FA5388](v15 - 8);
  uint64_t v198 = (uint64_t)v181 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v204 = type metadata accessor for Credential();
  uint64_t v17 = *(void *)(v204 - 8);
  MEMORY[0x270FA5388](v204);
  v217 = (char *)v181 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v201 = type metadata accessor for URL();
  uint64_t v19 = *(void *)(v201 - 8);
  MEMORY[0x270FA5388](v201);
  v212 = (char *)v181 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_24A0FA334(&qword_26976A440);
  uint64_t result = MEMORY[0x270FA5388](v21);
  uint64_t v199 = (uint64_t)v181 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v190 = *(void *)(a2 + 16);
  if (!v190) {
    return result;
  }
  uint64_t v196 = *(int *)(result + 48);
  uint64_t v195 = a2 + ((*(unsigned __int8 *)(v23 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v23 + 80));
  v194 = (void (**)(char *, uint64_t, uint64_t))(v19 + 32);
  v200 = (void *)&__src + 1;
  uint64_t v193 = *(void *)(v23 + 72);
  v188 = (void (**)(char *, uint64_t, uint64_t))(v17 + 32);
  v187 = (void (**)(char *, uint64_t))(v13 + 8);
  v186 = (void (**)(char *, uint64_t, uint64_t))(v9 + 16);
  v185 = (void (**)(char *, uint64_t))(v9 + 8);
  v223 = (void (**)(char *, uint64_t))(v7 + 8);
  v227 = (void (**)(char *, uint64_t))(v5 + 8);
  v184 = (void (**)(char *, uint64_t))(v17 + 8);
  v189 = (void (**)(char *, uint64_t))(v19 + 8);
  v181[1] = a2;
  swift_bridgeObjectRetain();
  uint64_t v25 = 0;
  uint64_t v26 = 0;
  uint64_t v183 = MEMORY[0x263F8EE58] + 8;
  *(void *)&long long v27 = 138412290;
  long long v182 = v27;
  *(void *)&long long v27 = 136315138;
  long long v219 = v27;
  uint64_t v28 = (uint64_t)v209;
  uint64_t v29 = v204;
  uint64_t v30 = v201;
  uint64_t v31 = v212;
  while (1)
  {
    uint64_t v32 = v199;
    sub_24A1148F0(v195 + v193 * v25, v199, &qword_26976A440);
    uint64_t v33 = *(void *)(v32 + v196);
    (*v194)(v31, v32, v30);
    uint64_t v34 = swift_bridgeObjectRetain();
    uint64_t v35 = sub_24A109964(v34);
    uint64_t v220 = v33;
    swift_bridgeObjectRelease();
    unint64_t v36 = *(void *)(v35 + 16);
    uint64_t v208 = v25;
    if (v36)
    {
      *(void *)&long long __src = MEMORY[0x263F8EE78];
      sub_24A108F0C();
      uint64_t v37 = *(void *)(v35 + 32);
      if (v37 < 0)
      {
LABEL_168:
        _assertionFailure(_:_:file:line:flags:)();
LABEL_169:
        __break(1u);
LABEL_170:
        KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
        __break(1u);
LABEL_171:
        swift_bridgeObjectRelease();
        swift_unexpectedError();
        __break(1u);
        JUMPOUT(0x24A113A5CLL);
      }
      uint64_t v38 = __src;
      unint64_t v39 = *(void *)(__src + 16);
      if (v39 >= *(void *)(__src + 24) >> 1)
      {
        sub_24A108F0C();
        uint64_t v38 = __src;
      }
      *(void *)(v38 + 16) = v39 + 1;
      *(void *)(v38 + 8 * v39 + 32) = v37;
      if (v36 != 1)
      {
        uint64_t v178 = 0;
        unint64_t v179 = v39 + 5;
        while (v178 + 1 < v36)
        {
          uint64_t v180 = *(void *)(v35 + 40 + 8 * v178);
          if (v180 < 0) {
            goto LABEL_168;
          }
          *(void *)&long long __src = v38;
          if (v179 - 4 >= *(void *)(v38 + 24) >> 1)
          {
            sub_24A108F0C();
            uint64_t v38 = __src;
          }
          *(void *)(v38 + 16) = v179 - 3;
          *(void *)(v38 + 8 * v179++) = v180;
          if (v36 - 1 == ++v178) {
            goto LABEL_8;
          }
        }
        __break(1u);
LABEL_148:
        __break(1u);
LABEL_149:
        __break(1u);
LABEL_150:
        __break(1u);
LABEL_151:
        __break(1u);
LABEL_152:
        __break(1u);
LABEL_153:
        __break(1u);
LABEL_154:
        __break(1u);
LABEL_155:
        __break(1u);
LABEL_156:
        __break(1u);
LABEL_157:
        __break(1u);
LABEL_158:
        __break(1u);
LABEL_159:
        __break(1u);
LABEL_160:
        __break(1u);
LABEL_161:
        __break(1u);
LABEL_162:
        __break(1u);
LABEL_163:
        __break(1u);
LABEL_164:
        __break(1u);
LABEL_165:
        __break(1u);
LABEL_166:
        __break(1u);
      }
LABEL_8:
      swift_release();
      uint64_t v28 = (uint64_t)v209;
      uint64_t v29 = v204;
    }
    else
    {
      swift_release();
      uint64_t v38 = MEMORY[0x263F8EE78];
    }
    swift_retain();
    uint64_t v40 = swift_bridgeObjectRetain();
    uint64_t v41 = sub_24A0FCFFC(v40);
    if (v26) {
      goto LABEL_171;
    }
    uint64_t v42 = v41;
    swift_bridgeObjectRelease();
    uint64_t v43 = sub_24A0FDBA4(v42);
    uint64_t v44 = swift_bridgeObjectRetain();
    sub_24A10087C(v44, &__src);
    swift_bridgeObjectRelease();
    if (!v238) {
      break;
    }
    uint64_t v45 = v200;
    sub_24A109F8C(v200, v238);
    uint64_t v221 = v38;
    uint64_t v46 = v198;
    dispatch thunk of AssetRequest.credential.getter();
    uint64_t v47 = v221;
    sub_24A0F600C(v46, 0, 1, v29);
    sub_24A0FAFA4((uint64_t)v45);
    if (sub_24A0F5F50(v46, 1, v29) == 1) {
      goto LABEL_145;
    }
    (*v188)(v217, v46, v29);
    if (!*(void *)(v47 + 16)) {
      goto LABEL_157;
    }
    uint64_t v49 = (uint64_t *)(v47 + 32);
    uint64_t v48 = *(void *)(v47 + 32);
    if (v48 < 0) {
      goto LABEL_158;
    }
    sub_24A114CB8(v48, v43, (uint64_t)&v234);
    if (!v235) {
      goto LABEL_164;
    }
    sub_24A10A130(&v234, (uint64_t)&__src);
    sub_24A0FA334(&qword_26976A350);
    uint64_t v50 = v210;
    uint64_t v51 = v218;
    swift_dynamicCast();
    uint64_t v216 = AssetDownloadRequest.storageReference.getter();
    unint64_t v215 = v52;
    uint64_t v53 = *v187;
    (*v187)(v50, v51);
    uint64_t v54 = *v49;
    if (*v49 < 0) {
      goto LABEL_159;
    }
    v214 = v49;
    uint64_t v222 = v43;
    sub_24A114CB8(v54, v43, (uint64_t)&v234);
    if (!v235) {
      goto LABEL_165;
    }
    sub_24A10A130(&v234, (uint64_t)&__src);
    uint64_t v55 = v210;
    uint64_t v56 = v218;
    swift_dynamicCast();
    uint64_t v57 = AssetDownloadRequest.storageReferenceSignature.getter();
    unint64_t v59 = v58;
    v53(v55, v56);
    type metadata accessor for Downloader.OptionsBuilder();
    swift_initStackObject();
    uint64_t v60 = swift_bridgeObjectRetain();
    uint64_t v61 = sub_24A10D0E8(v60);
    uint64_t v62 = v216;
    unint64_t v63 = v215;
    BOOL v64 = sub_24A0FC110(v216, v215);
    uint64_t v206 = v57;
    if (!v64)
    {
      uint64_t v65 = sub_24A10D70C(v62, v63, v57, v59);
      *(unsigned char *)(v65 + 64) = 1;
      swift_release();
      uint64_t v61 = v65;
    }
    if (*v214 < 0) {
      goto LABEL_160;
    }
    sub_24A114CB8(*v214, v222, (uint64_t)&__src);
    if (!v237)
    {
      sub_24A114898((uint64_t)&__src, &qword_26976A538);
      sub_24A0F600C(v28, 1, 1, v218);
LABEL_26:
      sub_24A114898(v28, &qword_26976A530);
LABEL_27:
      uint64_t v72 = v61;
      goto LABEL_28;
    }
    uint64_t v66 = v218;
    int v67 = swift_dynamicCast();
    sub_24A0F600C(v28, v67 ^ 1u, 1, v66);
    if (sub_24A0F5F50(v28, 1, v66) == 1) {
      goto LABEL_26;
    }
    uint64_t v68 = AssetDownloadRequest.applicationID.getter();
    uint64_t v70 = v69;
    v53((char *)v28, v218);
    if (!v70) {
      goto LABEL_27;
    }
    swift_retain();
    uint64_t v71 = sub_24A10D79C(v68, v70);
    swift_release_n();
    swift_bridgeObjectRelease();
    uint64_t v72 = v71;
LABEL_28:
    uint64_t v73 = sub_24A10C354(v222);
    uint64_t v207 = 0;
    uint64_t v74 = *(void *)(v73 + 16);
    unint64_t v205 = v59;
    uint64_t v226 = v72;
    if (v74)
    {
      uint64_t v75 = (unsigned char *)(v73 + 56);
      do
      {
        if ((*v75 & 1) == 0)
        {
          uint64_t v76 = *((void *)v75 - 3);
          long long v230 = *((_OWORD *)v75 - 1);
          swift_beginAccess();
          swift_retain();
          char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          *(void *)&long long v234 = *(void *)(v72 + 24);
          uint64_t v78 = v234;
          *(void *)(v72 + 24) = 0x8000000000000000;
          unint64_t v79 = sub_24A106698(v76);
          uint64_t v81 = *(void *)(v78 + 16);
          BOOL v82 = (v80 & 1) == 0;
          Swift::Int v83 = v81 + v82;
          if (__OFADD__(v81, v82)) {
            goto LABEL_148;
          }
          unint64_t v84 = v79;
          char v85 = v80;
          sub_24A0FA334(&qword_26976A540);
          Swift::Bool v86 = _NativeDictionary.ensureUnique(isUnique:capacity:)(isUniquelyReferenced_nonNull_native, v83);
          uint64_t v72 = v226;
          if (v86)
          {
            unint64_t v87 = sub_24A106698(v76);
            if ((v85 & 1) != (v88 & 1)) {
              goto LABEL_170;
            }
            unint64_t v84 = v87;
          }
          uint64_t v89 = (void *)v234;
          if (v85)
          {
            *(_OWORD *)(*(void *)(v234 + 56) + 16 * v84) = v230;
          }
          else
          {
            *(void *)(v234 + 8 * (v84 >> 6) + 64) |= 1 << v84;
            *(void *)(v89[6] + 8 * v84) = v76;
            *(_OWORD *)(v89[7] + 16 * v84) = v230;
            uint64_t v90 = v89[2];
            BOOL v91 = __OFADD__(v90, 1);
            uint64_t v92 = v90 + 1;
            if (v91) {
              goto LABEL_150;
            }
            v89[2] = v92;
          }
          *(void *)(v72 + 24) = v89;
          swift_bridgeObjectRelease();
          swift_endAccess();
          swift_release();
        }
        v75 += 32;
        --v74;
      }
      while (v74);
    }
    swift_bridgeObjectRelease();
    uint64_t v93 = *v186;
    uint64_t v94 = v192;
    uint64_t v95 = v202;
    (*v186)(v192, v203, v202);
    type metadata accessor for DownloadRequestContext();
    uint64_t v96 = swift_allocObject();
    v93((char *)(v96 + OBJC_IVAR____TtC16CloudAssetDaemon22DownloadRequestContext_continuation), (uint64_t)v94, v95);
    uint64_t v213 = sub_24A115CBC(v222);
    (*v185)(v94, v95);
    uint64_t v97 = v220;
    swift_bridgeObjectRetain();
    uint64_t v98 = swift_bridgeObjectRetain();
    uint64_t v99 = v207;
    unint64_t v100 = sub_24A10C144(v98, v97);
    swift_bridgeObjectRelease();
    uint64_t v101 = sub_24A10BD70(v100);
    swift_bridgeObjectRelease();
    uint64_t v102 = *(void *)(v101 + 16);
    if (v102)
    {
      uint64_t v207 = v99;
      *(void *)&long long v234 = MEMORY[0x263F8EE78];
      sub_24A108D7C(0, v102, 0);
      uint64_t v197 = v101;
      uint64_t v103 = (unint64_t *)(v101 + 40);
      while (2)
      {
        uint64_t v104 = *(v103 - 1);
        unint64_t v105 = *v103;
        unint64_t v106 = *v103 >> 62;
        v103 += 2;
        uint64_t v107 = (void *)MEMORY[0x263F8EE78];
        switch(v106)
        {
          case 1uLL:
            if (__OFSUB__(HIDWORD(v104), v104)) {
              goto LABEL_152;
            }
            uint64_t v108 = HIDWORD(v104) - (int)v104;
LABEL_49:
            sub_24A109F34(v104, v105);
            sub_24A109F34(v104, v105);
            if (!v108) {
              goto LABEL_88;
            }
LABEL_50:
            if (v108 >= 1)
            {
              sub_24A0FA334(&qword_26976A1F0);
              uint64_t v107 = (void *)swift_allocObject();
              size_t v111 = j__malloc_size(v107);
              v107[2] = v108;
              v107[3] = 2 * v111 - 64;
            }
            if (v106)
            {
              if (v106 == 1)
              {
                if (!((v104 ^ (unint64_t)(v104 << 32)) >> 32)) {
                  goto LABEL_62;
                }
              }
              else
              {
                uint64_t v115 = *(void *)(v104 + 16);
                uint64_t v114 = *(void *)(v104 + 24);
                if (v115 == v114)
                {
LABEL_62:
                  sub_24A109F34(v104, v105);
LABEL_79:
                  size_t v112 = 0;
                  goto LABEL_87;
                }
                if (v106 == 2)
                {
                  BOOL v91 = __OFSUB__(v114, v115);
                  int64_t v116 = v114 - v115;
                  if (v91) {
                    goto LABEL_161;
                  }
                  *(void *)&long long v230 = v107 + 4;
                  if (v108 >= v116) {
                    size_t v112 = v116;
                  }
                  else {
                    size_t v112 = v108;
                  }
                  swift_retain();
                  swift_retain();
                  uint64_t v117 = __DataStorage._bytes.getter();
                  if (v117)
                  {
                    uint64_t v118 = v117;
                    uint64_t v119 = __DataStorage._offset.getter();
                    if (__OFSUB__(v115, v119)) {
                      goto LABEL_162;
                    }
                    uint64_t v120 = (const void *)(v118 + v115 - v119);
                  }
                  else
                  {
                    uint64_t v120 = 0;
                  }
                  __DataStorage._length.getter();
                  if (!v120) {
                    goto LABEL_166;
                  }
                  memcpy((void *)v230, v120, v112);
                  swift_release();
                  swift_release();
                  uint64_t v126 = *(void *)(v104 + 16);
                  sub_24A109F34(v104, v105);
                  uint64_t v113 = v126;
                  goto LABEL_86;
                }
              }
              int v121 = HIDWORD(v104) - v104;
              if (__OFSUB__(HIDWORD(v104), v104)) {
                goto LABEL_154;
              }
              if (v108 >= v121) {
                size_t v112 = v121;
              }
              else {
                size_t v112 = v108;
              }
              if ((int)v104 > v104 >> 32) {
                goto LABEL_155;
              }
              uint64_t v222 = (int)v104;
              *(void *)&long long v230 = v107 + 4;
              sub_24A109F34(v104, v105);
              uint64_t v122 = __DataStorage._bytes.getter();
              if (v122)
              {
                uint64_t v123 = v122;
                uint64_t v124 = __DataStorage._offset.getter();
                if (__OFSUB__(v222, v124)) {
                  goto LABEL_156;
                }
                uint64_t v125 = (const void *)(v123 + v222 - v124);
              }
              else
              {
                uint64_t v125 = 0;
              }
              __DataStorage._length.getter();
              if (!v125) {
                goto LABEL_163;
              }
              memcpy((void *)v230, v125, v112);
              sub_24A0FA8D8(v104, v105);
              sub_24A109F34(v104, v105);
              uint64_t v113 = v222;
            }
            else
            {
              if ((v105 & 0xFF000000000000) == 0) {
                goto LABEL_79;
              }
              *(void *)&long long __src = v104;
              WORD4(__src) = v105;
              if (v108 >= BYTE6(v105)) {
                size_t v112 = BYTE6(v105);
              }
              else {
                size_t v112 = v108;
              }
              BYTE10(__src) = BYTE2(v105);
              BYTE11(__src) = BYTE3(v105);
              BYTE12(__src) = BYTE4(v105);
              BYTE13(__src) = BYTE5(v105);
              memcpy(v107 + 4, &__src, v112);
              uint64_t v113 = 0;
            }
LABEL_86:
            if (__OFADD__(v113, v112)) {
              goto LABEL_151;
            }
LABEL_87:
            uint64_t v127 = v224;
            Data.Iterator.init(_:at:)();
            (*v223)(v127, v225);
            if (v112 != v108) {
              goto LABEL_149;
            }
LABEL_88:
            sub_24A0FA8D8(v104, v105);
            size_t v128 = v107[2];
            uint64_t v129 = (char *)swift_slowAlloc();
            if (v107 + 4 < (void *)&v129[v128] && v129 < (char *)v107 + v128 + 32)
            {
LABEL_167:
              _fatalErrorMessage(_:_:file:line:flags:)();
              goto LABEL_169;
            }
            uint64_t v131 = v129;
            memcpy(v129, v107 + 4, v128);
            swift_release();
            sub_24A0FA8D8(v104, v105);
            uint64_t v132 = v234;
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            {
              sub_24A108D7C(0, *(void *)(v132 + 16) + 1, 1);
              uint64_t v132 = v234;
            }
            unint64_t v134 = *(void *)(v132 + 16);
            unint64_t v133 = *(void *)(v132 + 24);
            if (v134 >= v133 >> 1)
            {
              sub_24A108D7C(v133 > 1, v134 + 1, 1);
              uint64_t v132 = v234;
            }
            *(void *)(v132 + 16) = v134 + 1;
            *(void *)(v132 + 8 * v134 + 32) = v131;
            if (--v102) {
              continue;
            }
            swift_bridgeObjectRelease();
            uint64_t v99 = v207;
            break;
          case 2uLL:
            uint64_t v110 = *(void *)(v104 + 16);
            uint64_t v109 = *(void *)(v104 + 24);
            uint64_t v108 = v109 - v110;
            if (!__OFSUB__(v109, v110)) {
              goto LABEL_49;
            }
            goto LABEL_153;
          case 3uLL:
            goto LABEL_88;
          default:
            uint64_t v108 = BYTE6(v105);
            if (!BYTE6(v105)) {
              goto LABEL_88;
            }
            goto LABEL_50;
        }
        break;
      }
    }
    else
    {
      swift_bridgeObjectRelease();
      uint64_t v132 = MEMORY[0x263F8EE78];
    }
    *(void *)&long long v234 = v132;
    swift_retain();
    uint64_t v135 = swift_bridgeObjectRetain();
    uint64_t v136 = sub_24A0FD350(v135);
    if (v99) {
      goto LABEL_171;
    }
    uint64_t v137 = v136;
    swift_bridgeObjectRelease();
    uint64_t v138 = sub_24A10BF7C(v137);
    *(void *)&long long v230 = 0;
    swift_bridgeObjectRelease();
    uint64_t v139 = *(void *)(v138 + 16);
    if (v139)
    {
      uint64_t v231 = MEMORY[0x263F8EE78];
      sub_24A108DF4(0, v139, 0);
      uint64_t v140 = v231;
      uint64_t v141 = (uint64_t *)(v138 + 40);
      do
      {
        uint64_t v143 = *(v141 - 1);
        uint64_t v142 = *v141;
        *(void *)&long long __src = v143;
        *((void *)&__src + 1) = v142;
        v144 = v228;
        static String.Encoding.utf8.getter();
        sub_24A10A0E4();
        uint64_t v145 = StringProtocol.cString(using:)();
        (*v227)(v144, v229);
        if (v145)
        {
          size_t v146 = *(void *)(v145 + 16);
          uint64_t v147 = (void *)swift_slowAlloc();
          if (v145 + 32 < (unint64_t)v147 + v146 && (unint64_t)v147 < v145 + 32 + v146) {
            goto LABEL_167;
          }
          uint64_t v149 = v147;
          memcpy(v147, (const void *)(v145 + 32), v146);
          swift_bridgeObjectRelease();
        }
        else
        {
          if (qword_26976A060 != -1) {
            swift_once();
          }
          uint64_t v150 = type metadata accessor for Logger();
          sub_24A1058C4(v150, (uint64_t)qword_26976A460);
          swift_bridgeObjectRetain_n();
          uint64_t v151 = Logger.logObject.getter();
          os_log_type_t v152 = static os_log_type_t.error.getter();
          if (os_log_type_enabled(v151, v152))
          {
            uint64_t v153 = swift_slowAlloc();
            uint64_t v154 = swift_slowAlloc();
            *(void *)&long long __src = v154;
            *(_DWORD *)uint64_t v153 = v219;
            swift_bridgeObjectRetain();
            *(void *)(v153 + 4) = sub_24A10590C(v143, v142, (uint64_t *)&__src);
            swift_bridgeObjectRelease_n();
            _os_log_impl(&dword_24A0F4000, v151, v152, "unable to convert token %s to C string.", (uint8_t *)v153, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x24C5BCA40](v154, -1, -1);
            MEMORY[0x24C5BCA40](v153, -1, -1);
          }
          else
          {

            swift_bridgeObjectRelease_n();
          }
          uint64_t v149 = 0;
        }
        uint64_t v231 = v140;
        unint64_t v156 = *(void *)(v140 + 16);
        unint64_t v155 = *(void *)(v140 + 24);
        if (v156 >= v155 >> 1)
        {
          sub_24A108DF4(v155 > 1, v156 + 1, 1);
          uint64_t v140 = v231;
        }
        v141 += 2;
        *(void *)(v140 + 16) = v156 + 1;
        *(void *)(v140 + 8 * v156 + 32) = v149;
        --v139;
      }
      while (v139);
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
      uint64_t v140 = MEMORY[0x263F8EE78];
    }
    uint64_t v232 = 0;
    URL._bridgeToObjectiveC()(&v233);
    v158 = v157;
    uint64_t v159 = Credential.requestorID.getter();
    v160 = (void *)MEMORY[0x24C5BC080](v159);
    swift_bridgeObjectRelease();
    swift_retain();
    sub_24A10D7E8();
    swift_release();
    v161.super.Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v162 = v234;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      sub_24A104E78(0, *(void *)(v162 + 16), 0, v162);
      uint64_t v162 = v163;
    }
    *(void *)&long long v234 = v162;
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      sub_24A104E6C(0, *(void *)(v140 + 16), 0, v140);
      uint64_t v140 = v164;
    }
    uint64_t v231 = v140;
    swift_beginAccess();
    swift_bridgeObjectRetain();
    int v165 = MMCSGetItems();
    swift_endAccess();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v165)
    {
      uint64_t v28 = (uint64_t)v209;
      uint64_t v30 = v201;
      uint64_t v31 = v212;
      uint64_t v166 = v208;
      unint64_t v167 = v215;
      uint64_t v168 = v206;
      uint64_t v26 = v230;
    }
    else
    {
      sub_24A104500();
      *(void *)&long long __src = swift_allocError();
      AsyncThrowingStream.Continuation.finish(throwing:)();
      uint64_t v28 = (uint64_t)v209;
      uint64_t v30 = v201;
      uint64_t v168 = v206;
      if (qword_26976A060 != -1) {
        swift_once();
      }
      uint64_t v169 = type metadata accessor for Logger();
      sub_24A1058C4(v169, (uint64_t)qword_26976A460);
      v170 = Logger.logObject.getter();
      os_log_type_t v171 = static os_log_type_t.error.getter();
      BOOL v172 = os_log_type_enabled(v170, v171);
      uint64_t v31 = v212;
      uint64_t v166 = v208;
      uint64_t v26 = v230;
      if (v172)
      {
        uint64_t v173 = v168;
        v174 = (uint8_t *)swift_slowAlloc();
        v175 = (void *)swift_slowAlloc();
        *(_DWORD *)v174 = v182;
        uint64_t v176 = v232;
        if (v232)
        {
          type metadata accessor for CFError(0);
          sub_24A1149A0(&qword_26976A4A0, type metadata accessor for CFError);
          uint64_t v30 = v201;
          swift_allocError();
          uint64_t *v177 = v176;
          uint64_t v176 = _swift_stdlib_bridgeErrorToNSError();
          *(void *)&long long __src = v176;
        }
        else
        {
          *(void *)&long long __src = 0;
        }
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        void *v175 = v176;
        _os_log_impl(&dword_24A0F4000, v170, v171, "failed to create download request due to error %@", v174, 0xCu);
        sub_24A0FA334(&qword_26976A250);
        swift_arrayDestroy();
        MEMORY[0x24C5BCA40](v175, -1, -1);
        MEMORY[0x24C5BCA40](v174, -1, -1);
        uint64_t v28 = (uint64_t)v209;
        uint64_t v31 = v212;
        uint64_t v168 = v173;
      }

      unint64_t v167 = v215;
    }
    uint64_t v25 = v166 + 1;
    sub_24A1019D8((uint64_t)&v234, &v231);
    sub_24A0FA8D8(v168, v205);
    swift_release();
    sub_24A0FA8D8(v216, v167);
    uint64_t v29 = v204;
    (*v184)(v217, v204);
    (*v189)(v31, v30);
    swift_bridgeObjectRelease();
    swift_release();
    swift_bridgeObjectRelease();
    if (v25 == v190) {
      return swift_bridgeObjectRelease();
    }
  }
  sub_24A114898((uint64_t)&__src, &qword_26976A298);
  uint64_t v46 = v198;
  sub_24A0F600C(v198, 1, 1, v29);
LABEL_145:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*v189)(v212, v201);
  swift_bridgeObjectRelease();
  return sub_24A114898(v46, &qword_26976A290);
}

uint64_t sub_24A113A6C()
{
  swift_release();
  return MEMORY[0x270FA0228](v0, 24, 7);
}

uint64_t type metadata accessor for Downloader()
{
  return self;
}

uint64_t type metadata accessor for Downloader.OptionsBuilder()
{
  return self;
}

uint64_t *sub_24A113AEC(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v11 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v11 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *a1 = *a2;
    uint64_t v7 = *(int *)(a3 + 20);
    uint64_t v8 = (char *)a1 + v7;
    uint64_t v9 = (char *)a2 + v7;
    uint64_t v10 = type metadata accessor for URL();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
    *(_OWORD *)((char *)v4 + *(int *)(a3 + 24)) = *(_OWORD *)((char *)a2 + *(int *)(a3 + 24));
  }
  return v4;
}

uint64_t sub_24A113BD4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a1 + *(int *)(a2 + 20);
  uint64_t v3 = type metadata accessor for URL();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);
  return v4(v2, v3);
}

void *sub_24A113C3C(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = type metadata accessor for URL();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
  *(_OWORD *)((char *)a1 + *(int *)(a3 + 24)) = *(_OWORD *)((char *)a2 + *(int *)(a3 + 24));
  return a1;
}

void *sub_24A113CD4(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = type metadata accessor for URL();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  uint64_t v10 = *(int *)(a3 + 24);
  uint64_t v11 = (void *)((char *)a1 + v10);
  uint64_t v12 = (void *)((char *)a2 + v10);
  *uint64_t v11 = *v12;
  v11[1] = v12[1];
  return a1;
}

void *sub_24A113D7C(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = type metadata accessor for URL();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  *(_OWORD *)((char *)a1 + *(int *)(a3 + 24)) = *(_OWORD *)((char *)a2 + *(int *)(a3 + 24));
  return a1;
}

void *sub_24A113E14(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = type metadata accessor for URL();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 40))(v7, v8, v9);
  *(_OWORD *)((char *)a1 + *(int *)(a3 + 24)) = *(_OWORD *)((char *)a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t sub_24A113EAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24A113EC0);
}

uint64_t sub_24A113EC0(uint64_t a1, uint64_t a2)
{
  type metadata accessor for URL();
  uint64_t v3 = sub_24A114BD8();
  return sub_24A0F5F50(v3, a2, v4);
}

uint64_t sub_24A113F08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24A113F1C);
}

uint64_t sub_24A113F1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = a1 + *(int *)(a4 + 20);
  uint64_t v6 = type metadata accessor for URL();
  return sub_24A0F600C(v5, a2, a2, v6);
}

uint64_t type metadata accessor for Downloader.AssetDownloadResult()
{
  uint64_t result = qword_26976A478;
  if (!qword_26976A478) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24A113FB4()
{
  uint64_t result = type metadata accessor for URL();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

double sub_24A114058@<D0>(_OWORD *a1@<X8>)
{
  uint64_t v2 = v1;
  swift_bridgeObjectRetain();
  unint64_t v4 = sub_24A106774();
  char v6 = v5;
  swift_bridgeObjectRelease();
  if (v6)
  {
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v11 = *v2;
    uint64_t v8 = *v2;
    *uint64_t v2 = 0x8000000000000000;
    Swift::Int v9 = *(void *)(v8 + 24);
    sub_24A0FA334(&qword_26976A1A8);
    _NativeDictionary.ensureUnique(isUnique:capacity:)(isUniquelyReferenced_nonNull_native, v9);
    swift_bridgeObjectRelease();
    sub_24A0FAFF4((_OWORD *)(*(void *)(v11 + 56) + 32 * v4), a1);
    _NativeDictionary._delete(at:)();
    *uint64_t v2 = v11;
    swift_bridgeObjectRelease();
  }
  else
  {
    double result = 0.0;
    *a1 = 0u;
    a1[1] = 0u;
  }
  return result;
}

uint64_t sub_24A114190(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t *a5)
{
  sub_24A109C74(a1, &v30);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_24A109C9C(&v28);
  uint64_t v7 = *((void *)&v28 + 1);
  if (!*((void *)&v28 + 1))
  {
LABEL_14:
    swift_release();
    swift_bridgeObjectRelease();
    sub_24A10A080();
    return swift_release();
  }
  while (1)
  {
    uint64_t v8 = v28;
    sub_24A0FAFF4(&v29, v27);
    uint64_t v9 = *a5;
    unint64_t v11 = sub_24A106774();
    uint64_t v12 = *(void *)(v9 + 16);
    BOOL v13 = (v10 & 1) == 0;
    uint64_t v14 = v12 + v13;
    if (__OFADD__(v12, v13)) {
      break;
    }
    char v15 = v10;
    if (*(void *)(v9 + 24) >= v14)
    {
      if (a4)
      {
        if (v10) {
          goto LABEL_9;
        }
      }
      else
      {
        sub_24A0FA334(&qword_26976A1A8);
        _NativeDictionary.copy()();
        if (v15) {
          goto LABEL_9;
        }
      }
    }
    else
    {
      sub_24A107364(v14, a4 & 1);
      unint64_t v16 = sub_24A106774();
      if ((v15 & 1) != (v17 & 1)) {
        goto LABEL_17;
      }
      unint64_t v11 = v16;
      if (v15)
      {
LABEL_9:
        sub_24A105FE4(*(void *)(*a5 + 56) + 32 * v11, (uint64_t)v25);
        sub_24A105FE4((uint64_t)v25, (uint64_t)v26);
        sub_24A0FAFA4((uint64_t)v25);
        sub_24A0FAFA4((uint64_t)v27);
        swift_bridgeObjectRelease();
        uint64_t v18 = (_OWORD *)(*(void *)(*a5 + 56) + 32 * v11);
        sub_24A0FAFA4((uint64_t)v18);
        sub_24A0FAFF4(v26, v18);
        goto LABEL_13;
      }
    }
    uint64_t v19 = (void *)*a5;
    *(void *)(*a5 + 8 * (v11 >> 6) + 64) |= 1 << v11;
    uint64_t v20 = (void *)(v19[6] + 16 * v11);
    *uint64_t v20 = v8;
    v20[1] = v7;
    sub_24A0FAFF4(v27, (_OWORD *)(v19[7] + 32 * v11));
    uint64_t v21 = v19[2];
    BOOL v22 = __OFADD__(v21, 1);
    uint64_t v23 = v21 + 1;
    if (v22) {
      goto LABEL_16;
    }
    v19[2] = v23;
LABEL_13:
    sub_24A109C9C(&v28);
    uint64_t v7 = *((void *)&v28 + 1);
    a4 = 1;
    if (!*((void *)&v28 + 1)) {
      goto LABEL_14;
    }
  }
  __break(1u);
LABEL_16:
  __break(1u);
LABEL_17:
  uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
  return result;
}

uint64_t sub_24A1143C8(uint64_t a1)
{
  return sub_24A10FED4(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40), *(void *)(v1 + 48), *(void *)(v1 + 56), *(void *)(v1 + 64));
}

uint64_t sub_24A1143DC()
{
  uint64_t v1 = sub_24A0FA334(&qword_26976A4C8);
  sub_24A10A3B0();
  uint64_t v3 = v2;
  uint64_t v4 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v5 = (v4 + 32) & ~v4;
  unint64_t v7 = (*(void *)(v6 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v8 = sub_24A0FA334(&qword_26976A4D8);
  sub_24A10A3B0();
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  uint64_t v13 = *(unsigned __int8 *)(v10 + 80);
  unint64_t v14 = (((v7 + 11) & 0xFFFFFFFFFFFFFFF8) + v13 + 32) & ~v13;
  uint64_t v15 = v4 | v13 | 7;
  unint64_t v16 = ((*(void *)(v12 + 64) + v14 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v0 + v5, v1);
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v10 + 8))(v0 + v14, v8);
  return MEMORY[0x270FA0238](v0, v16, v15);
}

uint64_t sub_24A114514(uint64_t a1)
{
  uint64_t v3 = sub_24A0FA334(&qword_26976A4C8);
  sub_24A0FB024(v3);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  unint64_t v7 = (*(void *)(v6 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v8 = (v7 + 11) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v9 = sub_24A0FA334(&qword_26976A4D8);
  sub_24A0FB024(v9);
  uint64_t v10 = *(void *)(v1 + 24);
  uint64_t v19 = *(void *)(v1 + 16);
  uint64_t v11 = *(void *)(v1 + v7);
  uint64_t v12 = v1 + v8;
  uint64_t v13 = *(void *)(v1 + v8);
  uint64_t v14 = *(void *)(v12 + 8);
  uint64_t v15 = *(void *)(v12 + 16);
  swift_task_alloc();
  sub_24A10AB88();
  *(void *)(v2 + 16) = v16;
  *unint64_t v16 = v17;
  v16[1] = sub_24A106464;
  return sub_24A1101F0(a1, v19, v10, v1 + v5, v11, v13, v14, v15);
}

uint64_t sub_24A1146A0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Downloader.AssetDownloadResult();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24A114704(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Downloader.AssetDownloadResult();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24A114760(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Downloader.AssetDownloadResult();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24A1147C4()
{
  _print_unlocked<A, B>(_:_:)();
  v0._countAndFlagsBits = 3943982;
  v0._object = (void *)0xE300000000000000;
  String.append(_:)(v0);
  _print_unlocked<A, B>(_:_:)();
  return 0;
}

uint64_t sub_24A11485C(uint64_t a1)
{
  return sub_24A111EB0(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_24A114868(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_24A109F34(a1, a2);
  }
  return a1;
}

uint64_t sub_24A11487C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_24A0FA8D8(a1, a2);
  }
  return a1;
}

uint64_t sub_24A114890(uint64_t a1, uint64_t a2)
{
  return sub_24A10D1E0(a1, a2, v2);
}

uint64_t sub_24A114898(uint64_t a1, uint64_t *a2)
{
  sub_24A0FA334(a2);
  sub_24A114BF0();
  v3();
  return a1;
}

uint64_t sub_24A1148F0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  sub_24A0FA334(a3);
  sub_24A114BAC();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(a2, a1);
  return a2;
}

uint64_t sub_24A114948(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  sub_24A0FA334(a3);
  sub_24A114BAC();
  (*(void (**)(uint64_t, uint64_t))(v5 + 32))(a2, a1);
  return a2;
}

uint64_t sub_24A1149A0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t *sub_24A1149E8(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_24A114A4C(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

uint64_t sub_24A114A9C(unint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v8 = type metadata accessor for AssetDownloadRequest();
  uint64_t v15 = v8;
  uint64_t v16 = sub_24A1149A0(&qword_26976A580, MEMORY[0x263F321A8]);
  uint64_t v9 = sub_24A1149E8((uint64_t *)&v14);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 32))(v9, a3, v8);
  a4[(a1 >> 6) + 8] |= 1 << a1;
  *(void *)(a4[6] + 8 * a1) = a2;
  uint64_t result = sub_24A10A130(&v14, a4[7] + 40 * a1);
  uint64_t v11 = a4[2];
  BOOL v12 = __OFADD__(v11, 1);
  uint64_t v13 = v11 + 1;
  if (v12) {
    __break(1u);
  }
  else {
    a4[2] = v13;
  }
  return result;
}

uint64_t sub_24A114BC0()
{
  return swift_slowAlloc();
}

uint64_t sub_24A114BD8()
{
  return v0;
}

uint64_t sub_24A114C10(void *a1, uint64_t a2)
{
  if (*(void *)(a2 + 16) && (sub_24A1065B4(a1), (v2 & 1) != 0)) {
    return swift_retain();
  }
  else {
    return 0;
  }
}

double sub_24A114C54@<D0>(uint64_t a1@<X2>, _OWORD *a2@<X8>)
{
  if (*(void *)(a1 + 16) && (unint64_t v4 = sub_24A106774(), (v5 & 1) != 0))
  {
    uint64_t v6 = *(void *)(a1 + 56) + 32 * v4;
    sub_24A105FE4(v6, (uint64_t)a2);
  }
  else
  {
    double result = 0.0;
    *a2 = 0u;
    a2[1] = 0u;
  }
  return result;
}

double sub_24A114CB8@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (*(void *)(a2 + 16) && (unint64_t v5 = sub_24A106698(a1), (v6 & 1) != 0))
  {
    uint64_t v7 = *(void *)(a2 + 56) + 40 * v5;
    sub_24A10A148(v7, a3);
  }
  else
  {
    *(void *)(a3 + 32) = 0;
    double result = 0.0;
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
  }
  return result;
}

uint64_t sub_24A114D24(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a2 + 16) && (unint64_t v3 = sub_24A106698(a1), (v4 & 1) != 0)) {
    return *(void *)(*(void *)(a2 + 56) + 16 * v3);
  }
  else {
    return 0;
  }
}

id sub_24A114D74@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t v5 = *(void **)(v2 + 16);
  objc_msgSend(v5, sel_lock);
  swift_beginAccess();
  sub_24A114CB8(a1, *(void *)(v2 + 32), (uint64_t)&v7);
  if (v8)
  {
    sub_24A10A130(&v7, a2);
    swift_endAccess();
  }
  else
  {
    sub_24A114F34((uint64_t)&v7);
    swift_endAccess();
    sub_24A104500();
    swift_allocError();
    swift_willThrow();
  }
  return objc_msgSend(v5, sel_unlock);
}

void *sub_24A114E50()
{
  v0[2] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08958]), sel_init);
  v0[3] = 0;
  sub_24A0FA334(&qword_26976A350);
  v0[4] = Dictionary.init(dictionaryLiteral:)();
  return v0;
}

uint64_t sub_24A114EB4()
{
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_24A114EDC()
{
  sub_24A114EB4();
  return MEMORY[0x270FA0228](v0, 40, 7);
}

uint64_t type metadata accessor for RequestTracker()
{
  return self;
}

uint64_t sub_24A114F34(uint64_t a1)
{
  uint64_t v2 = sub_24A0FA334(&qword_26976A538);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t getEnumTagSinglePayload for ProcessorError(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for ProcessorError(unsigned char *result, int a2, int a3)
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
        *double result = a2;
        return result;
      case 2:
        *(_WORD *)double result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)double result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *double result = 0;
      break;
    case 2:
      *(_WORD *)double result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x24A115084);
    case 4:
      *(_DWORD *)double result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_24A1150AC()
{
  return 0;
}

ValueMetadata *type metadata accessor for ProcessorError()
{
  return &type metadata for ProcessorError;
}

unint64_t sub_24A1150C8()
{
  unint64_t result = qword_26976A588;
  if (!qword_26976A588)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26976A588);
  }
  return result;
}

void sub_24A115114()
{
}

Swift::Int sub_24A11513C()
{
  return Hasher._finalize()();
}

uint64_t sub_24A115180()
{
  return 1;
}

Swift::Int sub_24A115190()
{
  return Hasher._finalize()();
}

uint64_t sub_24A1151E0()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_24A10A208(v0, qword_26976A590);
  sub_24A1058C4(v0, (uint64_t)qword_26976A590);
  static LoggerSubsystem.server.getter();
  type metadata accessor for Engine();
  sub_24A0FA334(&qword_26976A5C8);
  String.init<A>(describing:)();
  return Logger.init(subsystem:category:)();
}

void sub_24A11527C(uint64_t a1)
{
  int v2 = v1;
  uint64_t v4 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
  uint64_t v29 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  sub_24A115C94();
  uint64_t v30 = v5;
  uint64_t v28 = type metadata accessor for OS_dispatch_queue.Attributes();
  MEMORY[0x270FA5388](v28);
  sub_24A115C94();
  uint64_t v6 = type metadata accessor for DispatchQoS();
  MEMORY[0x270FA5388](v6 - 8);
  sub_24A115C94();
  if (qword_26976A068 != -1) {
    swift_once();
  }
  uint64_t v7 = type metadata accessor for Logger();
  sub_24A1058C4(v7, (uint64_t)qword_26976A590);
  swift_retain_n();
  uint64_t v8 = Logger.logObject.getter();
  os_log_type_t v9 = static os_log_type_t.debug.getter();
  uint64_t v31 = v4;
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    uint64_t v33 = swift_slowAlloc();
    *(_DWORD *)uint64_t v10 = 136315138;
    type metadata accessor for TenantContext();
    swift_retain();
    uint64_t v11 = String.init<A>(describing:)();
    uint64_t v13 = sub_24A10590C(v11, v12, &v33);
    sub_24A115CA8(v13);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24A0F4000, v8, v9, "creating mmcs engine for %s", v10, 0xCu);
    swift_arrayDestroy();
    sub_24A10A3DC();
    sub_24A10A3DC();
  }
  else
  {

    swift_release_n();
  }
  v2[2] = sub_24A115E5C();
  v2[3] = a1;
  swift_retain();
  sub_24A115880();
  if (v32)
  {
    swift_release();
    swift_release();
    swift_deallocPartialClassInstance();
  }
  else
  {
    sub_24A115BB0();
    static DispatchQoS.unspecified.getter();
    uint64_t v33 = MEMORY[0x263F8EE78];
    sub_24A115BF0();
    sub_24A0FA334(&qword_26976A5B8);
    sub_24A115C40();
    dispatch thunk of SetAlgebra.init<A>(_:)();
    (*(void (**)(uint64_t, void, uint64_t))(v29 + 104))(v30, *MEMORY[0x263F8F130], v31);
    long long v14 = (void *)OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
    URL._bridgeToObjectiveC()((NSURL *)OBJC_IVAR____TtC16CloudAssetDaemon13TenantContext_workingDirectory);
    uint64_t v16 = v15;
    uint64_t v17 = (void *)MEMORY[0x24C5BC080](0xD00000000000001ELL, 0x800000024A11D950);
    unint64_t v18 = sub_24A115F10();
    uint64_t v19 = (void *)MEMORY[0x24C5BC080](v18);
    swift_bridgeObjectRelease();
    sub_24A115A40();
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    uint64_t v21 = MMCSEngineCreateWithTargetDispatchQueue();

    if (v21)
    {
      v2[4] = v21;
      swift_retain_n();
      BOOL v22 = Logger.logObject.getter();
      os_log_type_t v23 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v22, v23))
      {
        uint64_t v24 = (uint8_t *)swift_slowAlloc();
        uint64_t v33 = swift_slowAlloc();
        *(_DWORD *)uint64_t v24 = 136315138;
        type metadata accessor for TenantContext();
        swift_retain();
        uint64_t v25 = String.init<A>(describing:)();
        uint64_t v27 = sub_24A10590C(v25, v26, &v33);
        sub_24A115CA8(v27);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_release_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_24A0F4000, v22, v23, "created mmcs engine for %s", v24, 0xCu);
        swift_arrayDestroy();
        sub_24A10A3DC();
        sub_24A10A3DC();

        swift_release();
      }
      else
      {

        swift_release_n();
      }
    }
    else
    {
      __break(1u);
    }
  }
}

id sub_24A115880()
{
  v19[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v0 = self;
  id v1 = objc_msgSend(v0, sel_defaultManager);
  uint64_t countAndFlagsBits = URL.path(percentEncoded:)(1)._countAndFlagsBits;
  int v3 = (void *)MEMORY[0x24C5BC080](countAndFlagsBits);
  swift_bridgeObjectRelease();
  unsigned int v4 = objc_msgSend(v1, sel_fileExistsAtPath_, v3);

  if (v4)
  {
    id v5 = objc_msgSend(v0, sel_defaultManager);
    URL._bridgeToObjectiveC()(v6);
    uint64_t v8 = v7;
    v19[0] = 0;
    unsigned int v9 = objc_msgSend(v5, sel_removeItemAtURL_error_, v7, v19);

    id v10 = v19[0];
    if (!v9) {
      goto LABEL_6;
    }
    id v11 = v19[0];
  }
  id v12 = objc_msgSend(v0, sel_defaultManager);
  URL._bridgeToObjectiveC()(v13);
  uint64_t v15 = v14;
  v19[0] = 0;
  unsigned int v16 = objc_msgSend(v12, sel_createDirectoryAtURL_withIntermediateDirectories_attributes_error_, v14, 1, 0, v19);

  id v10 = v19[0];
  if (v16) {
    return v19[0];
  }
LABEL_6:
  id v18 = v10;
  _convertNSErrorToError(_:)();

  return (id)swift_willThrow();
}

uint64_t sub_24A115A40()
{
  sub_24A0FA334(&qword_26976A2D8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24A11C540;
  uint64_t result = *MEMORY[0x263F534C8];
  if (!*MEMORY[0x263F534C8])
  {
    __break(1u);
    goto LABEL_6;
  }
  *(void *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(inited + 40) = v2;
  uint64_t v3 = MEMORY[0x263F8D4F8];
  *(void *)(inited + 72) = MEMORY[0x263F8D4F8];
  *(unsigned char *)(inited + 48) = 1;
  uint64_t result = *MEMORY[0x263F534D0];
  if (!*MEMORY[0x263F534D0])
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  *(void *)(inited + 80) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(inited + 88) = v4;
  *(void *)(inited + 120) = v3;
  *(unsigned char *)(inited + 96) = 0;
  uint64_t result = *MEMORY[0x263F534C0];
  if (*MEMORY[0x263F534C0])
  {
    *(void *)(inited + 128) = static String._unconditionallyBridgeFromObjectiveC(_:)();
    *(void *)(inited + 136) = v5;
    *(void *)(inited + 168) = v3;
    *(unsigned char *)(inited + 144) = 1;
    return Dictionary.init(dictionaryLiteral:)();
  }
LABEL_7:
  __break(1u);
  return result;
}

uint64_t sub_24A115B28()
{
  MEMORY[0x24C5BCA40](*(void *)(v0 + 16), -1, -1);
  swift_release();
  return v0;
}

uint64_t sub_24A115B58()
{
  sub_24A115B28();
  return MEMORY[0x270FA0228](v0, 40, 7);
}

uint64_t type metadata accessor for Engine()
{
  return self;
}

unint64_t sub_24A115BB0()
{
  unint64_t result = qword_26976A5A8;
  if (!qword_26976A5A8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26976A5A8);
  }
  return result;
}

unint64_t sub_24A115BF0()
{
  unint64_t result = qword_26976A5B0;
  if (!qword_26976A5B0)
  {
    type metadata accessor for OS_dispatch_queue.Attributes();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26976A5B0);
  }
  return result;
}

unint64_t sub_24A115C40()
{
  unint64_t result = qword_26976A5C0;
  if (!qword_26976A5C0)
  {
    sub_24A106528(&qword_26976A5B8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26976A5C0);
  }
  return result;
}

uint64_t sub_24A115CA8(uint64_t a1)
{
  *(void *)(v1 - 88) = a1;
  return v1 - 88;
}

uint64_t sub_24A115CBC(uint64_t a1)
{
  uint64_t v3 = (void *)swift_slowAlloc();
  *(void *)(v1 + 16) = v3;
  *(void *)(v1 + 24) = a1;
  *uint64_t v3 = v1;
  swift_retain();
  swift_release();
  return v1;
}

uint64_t sub_24A115D08()
{
  uint64_t result = *(void *)(v0 + 16);
  if (result)
  {
    MEMORY[0x24C5BCA40](result, -1, -1);
    swift_bridgeObjectRelease();
    return v0;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_24A115D40()
{
  sub_24A115D08();
  return MEMORY[0x270FA0228](v0, 32, 7);
}

uint64_t type metadata accessor for RequestContext()
{
  return self;
}

uint64_t sub_24A115D98(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = *(void (**)(uint64_t))(**(void **)result + 104);
    uint64_t v2 = swift_retain();
    v1(v2);
    return swift_release();
  }
  return result;
}

void sub_24A115E08(uint64_t a1, void *a2)
{
  id v3 = a2;
  sub_24A115D98(a1);
}

void *sub_24A115E5C()
{
  uint64_t v1 = (void *)swift_slowAlloc();
  uint64_t v2 = (void *)swift_slowAlloc();
  *uint64_t v2 = v0;
  *uint64_t v1 = 9;
  v1[1] = v2;
  v1[2] = sub_24A1192D8;
  v1[3] = j_nullsub_1;
  v1[4] = sub_24A10F284;
  v1[5] = sub_24A0FFC28;
  v1[6] = sub_24A100814;
  v1[7] = sub_24A115E08;
  v1[8] = 0;
  v1[9] = 0;
  v1[10] = 0;
  swift_retain();
  return v1;
}

unint64_t sub_24A115F10()
{
  _StringGuts.grow(_:)(22);
  swift_bridgeObjectRelease();
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v1 = *(void **)(v0 + 24);
  swift_bridgeObjectRetain();
  v3._uint64_t countAndFlagsBits = v2;
  v3._object = v1;
  String.append(_:)(v3);
  swift_bridgeObjectRelease();
  return 0xD000000000000014;
}

uint64_t sub_24A115FA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a1;
  *(void *)(v4 + 24) = a2;
  uint64_t v7 = v4 + OBJC_IVAR____TtC16CloudAssetDaemon13TenantContext_workingDirectory;
  uint64_t v8 = type metadata accessor for URL();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 32))(v7, a3, v8);
  *(void *)(v4 + OBJC_IVAR____TtC16CloudAssetDaemon13TenantContext_requestTracker) = a4;
  return v4;
}

uint64_t sub_24A116028()
{
  swift_bridgeObjectRelease();
  uint64_t v1 = v0 + OBJC_IVAR____TtC16CloudAssetDaemon13TenantContext_workingDirectory;
  uint64_t v2 = type metadata accessor for URL();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  return v0;
}

uint64_t sub_24A1160A4()
{
  sub_24A116028();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t sub_24A1160FC()
{
  return type metadata accessor for TenantContext();
}

uint64_t type metadata accessor for TenantContext()
{
  uint64_t result = qword_26976A5D0;
  if (!qword_26976A5D0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24A11614C()
{
  uint64_t result = type metadata accessor for URL();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_24A1161F4()
{
  return AsyncThrowingStream.Continuation.finish(throwing:)();
}

uint64_t sub_24A116240()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC16CloudAssetDaemon22DownloadRequestContext_continuation;
  uint64_t v2 = sub_24A0FA334(&qword_26976A498);
  Swift::String v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  return v3(v1, v2);
}

uint64_t sub_24A1162B0()
{
  uint64_t v0 = sub_24A115D08();
  uint64_t v1 = v0 + OBJC_IVAR____TtC16CloudAssetDaemon22DownloadRequestContext_continuation;
  uint64_t v2 = sub_24A0FA334(&qword_26976A498);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t sub_24A11635C()
{
  return type metadata accessor for DownloadRequestContext();
}

uint64_t type metadata accessor for DownloadRequestContext()
{
  uint64_t result = qword_26976A5E0;
  if (!qword_26976A5E0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_24A1163AC()
{
  sub_24A11643C();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_24A11643C()
{
  if (!qword_26976A5F0)
  {
    type metadata accessor for Downloader.AssetDownloadResult();
    sub_24A106528(&qword_26976A248);
    unint64_t v0 = type metadata accessor for AsyncThrowingStream.Continuation();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26976A5F0);
    }
  }
}

uint64_t sub_24A1164B0()
{
  uint64_t v1 = sub_24A0FA334(&qword_26976A2B8);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_24A0FA334(&qword_26976A2C0);
  sub_24A0F600C((uint64_t)v3, 1, 1, v4);
  uint64_t v5 = v0 + OBJC_IVAR____TtC16CloudAssetDaemon20UploadRequestContext_storageReferenceContinuation;
  swift_beginAccess();
  sub_24A116AE8((uint64_t)v3, v5);
  return swift_endAccess();
}

uint64_t sub_24A116570(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = v3 + OBJC_IVAR____TtC16CloudAssetDaemon20UploadRequestContext_storageReferenceContinuation;
  uint64_t v8 = sub_24A0FA334(&qword_26976A2C0);
  sub_24A0F600C(v7, 1, 1, v8);
  swift_beginAccess();
  swift_retain();
  sub_24A116A20(a2, v7);
  swift_endAccess();
  uint64_t v9 = v3 + OBJC_IVAR____TtC16CloudAssetDaemon20UploadRequestContext_trackingNumberContinutation;
  uint64_t v10 = sub_24A0FA334(&qword_26976A2B0);
  uint64_t v11 = *(void *)(v10 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16))(v9, a3, v10);
  swift_release();
  uint64_t v12 = sub_24A115CBC(a1);
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(a3, v10);
  sub_24A116A88(a2);
  return v12;
}

uint64_t sub_24A1166B4()
{
  return AsyncThrowingStream.Continuation.finish(throwing:)();
}

uint64_t sub_24A116700()
{
  sub_24A116A88(v0 + OBJC_IVAR____TtC16CloudAssetDaemon20UploadRequestContext_storageReferenceContinuation);
  uint64_t v1 = v0 + OBJC_IVAR____TtC16CloudAssetDaemon20UploadRequestContext_trackingNumberContinutation;
  uint64_t v2 = sub_24A0FA334(&qword_26976A2B0);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  return v3(v1, v2);
}

uint64_t sub_24A116780()
{
  uint64_t v0 = sub_24A115D08();
  sub_24A116A88(v0 + OBJC_IVAR____TtC16CloudAssetDaemon20UploadRequestContext_storageReferenceContinuation);
  uint64_t v1 = v0 + OBJC_IVAR____TtC16CloudAssetDaemon20UploadRequestContext_trackingNumberContinutation;
  uint64_t v2 = sub_24A0FA334(&qword_26976A2B0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t sub_24A11683C()
{
  return type metadata accessor for UploadRequestContext();
}

uint64_t type metadata accessor for UploadRequestContext()
{
  uint64_t result = qword_26976A5F8;
  if (!qword_26976A5F8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_24A11688C()
{
  sub_24A116958();
  if (v0 <= 0x3F)
  {
    sub_24A1169B4();
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

void sub_24A116958()
{
  if (!qword_26976A608)
  {
    sub_24A106528(&qword_26976A2C0);
    unint64_t v0 = type metadata accessor for Optional();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26976A608);
    }
  }
}

void sub_24A1169B4()
{
  if (!qword_26976A610)
  {
    sub_24A106528(&qword_26976A248);
    unint64_t v0 = type metadata accessor for AsyncThrowingStream.Continuation();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26976A610);
    }
  }
}

uint64_t sub_24A116A20(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24A0FA334(&qword_26976A2B8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t sub_24A116A88(uint64_t a1)
{
  uint64_t v2 = sub_24A0FA334(&qword_26976A2B8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24A116AE8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24A0FA334(&qword_26976A2B8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

void sub_24A116B50(uint64_t a1, uint64_t (*a2)(void, char *), uint64_t a3)
{
  unint64_t v36 = a2;
  uint64_t v37 = a3;
  uint64_t v35 = sub_24A0FA334(&qword_26976A668);
  uint64_t v5 = MEMORY[0x270FA5388](v35);
  uint64_t v34 = (char *)v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v33 = (void *)((char *)v29 - v8);
  MEMORY[0x270FA5388](v7);
  uint64_t v32 = (char *)v29 - v9;
  uint64_t v10 = *(void *)(a1 + 16);
  if (v10)
  {
    v29[1] = v3;
    uint64_t v42 = MEMORY[0x263F8EE78];
    sub_24A108C9C();
    uint64_t v11 = sub_24A109A38(a1);
    if ((v11 & 0x8000000000000000) == 0)
    {
      unint64_t v13 = v11;
      if (v11 < 1 << *(unsigned char *)(a1 + 32))
      {
        uint64_t v14 = a1 + 64;
        uint64_t v30 = a1 + 64;
        uint64_t v31 = a1;
        uint64_t v15 = v32;
        while ((*(void *)(v14 + 8 * (v13 >> 6)) & (1 << v13)) != 0)
        {
          if (v12 != *(_DWORD *)(a1 + 36)) {
            goto LABEL_20;
          }
          uint64_t v40 = 1 << v13;
          unint64_t v41 = v13 >> 6;
          uint64_t v38 = v10;
          uint64_t v39 = v12;
          uint64_t v16 = v35;
          uint64_t v17 = (char *)v15 + *(int *)(v35 + 48);
          uint64_t v18 = *(void *)(a1 + 56);
          uint64_t v19 = *(void *)(*(void *)(a1 + 48) + 8 * v13);
          uint64_t v20 = type metadata accessor for AssetUploadRequest();
          uint64_t v21 = *(void *)(v20 - 8);
          BOOL v22 = *(void (**)(char *, unint64_t, uint64_t))(v21 + 16);
          v22(v17, v18 + *(void *)(v21 + 72) * v13, v20);
          *uint64_t v15 = v19;
          uint64_t v23 = (uint64_t)v33;
          *uint64_t v33 = v19;
          v22((char *)(v23 + *(int *)(v16 + 48)), (unint64_t)v17, v20);
          uint64_t v24 = v34;
          sub_24A10A088(v23, (uint64_t)v34, &qword_26976A668);
          sub_24A10A26C((uint64_t)v15, &qword_26976A668);
          uint64_t v25 = v36(*(void *)v24, &v24[*(int *)(v16 + 48)]);
          sub_24A10A26C((uint64_t)v24, &qword_26976A668);
          uint64_t v26 = v42;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            sub_24A108C9C();
            uint64_t v26 = v42;
          }
          unint64_t v27 = *(void *)(v26 + 16);
          a1 = v31;
          if (v27 >= *(void *)(v26 + 24) >> 1)
          {
            sub_24A108C9C();
            uint64_t v26 = v42;
          }
          *(void *)(v26 + 16) = v27 + 1;
          *(void *)(v26 + 8 * v27 + 32) = v25;
          if ((uint64_t)v13 >= -(-1 << *(unsigned char *)(a1 + 32))) {
            goto LABEL_21;
          }
          uint64_t v14 = v30;
          if ((*(void *)(v30 + 8 * v41) & v40) == 0) {
            goto LABEL_22;
          }
          if (v39 != *(_DWORD *)(a1 + 36)) {
            goto LABEL_23;
          }
          uint64_t v28 = _HashTable.occupiedBucket(after:)();
          uint64_t v10 = v38 - 1;
          if (v38 == 1) {
            return;
          }
          unint64_t v13 = v28;
          if ((v28 & 0x8000000000000000) == 0)
          {
            uint64_t v12 = *(unsigned int *)(a1 + 36);
            if (v28 < 1 << *(unsigned char *)(a1 + 32)) {
              continue;
            }
          }
          goto LABEL_24;
        }
        __break(1u);
LABEL_20:
        __break(1u);
LABEL_21:
        __break(1u);
LABEL_22:
        __break(1u);
LABEL_23:
        __break(1u);
      }
    }
LABEL_24:
    __break(1u);
  }
}

uint64_t sub_24A116EA0(uint64_t a1, void *a2)
{
  uint64_t v4 = type metadata accessor for AssetUploadRequest();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v50 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_24A0FA334(&qword_26976A3E8);
  uint64_t v58 = *(void *)(v8 - 8);
  uint64_t v59 = v8;
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v50 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *(void *)(a1 + 16);
  if (v11)
  {
    uint64_t v72 = MEMORY[0x263F8EE78];
    sub_24A108D1C(0, v11, 0);
    uint64_t v14 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
    uint64_t v13 = v5 + 16;
    uint64_t v12 = v14;
    uint64_t v15 = a1 + ((*(unsigned __int8 *)(v13 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 64));
    BOOL v64 = a2 + 4;
    uint64_t v51 = (void (**)(uint64_t *, char *, uint64_t))(v13 + 16);
    uint64_t v53 = *(void *)(v13 + 56);
    unint64_t v52 = (void (**)(char *, uint64_t))(v13 - 8);
    uint64_t v57 = a2;
    uint64_t v56 = v13;
    unint64_t v63 = v7;
    uint64_t v55 = (uint64_t *)v10;
    uint64_t v54 = v14;
    while (1)
    {
      uint64_t v62 = v15;
      v12(v7, v15, v4);
      uint64_t v16 = (void *)a2[2];
      objc_msgSend(v16, sel_lock);
      uint64_t v17 = a2[3];
      if (__OFADD__(v17, 1)) {
        break;
      }
      id v60 = v16;
      uint64_t v61 = v11;
      a2[3] = v17 + 1;
      swift_beginAccess();
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v71 = (void *)a2[4];
      uint64_t v19 = v71;
      a2[4] = 0x8000000000000000;
      uint64_t v69 = v4;
      uint64_t v20 = sub_24A11A2F4(&qword_26976A670, MEMORY[0x263F32198]);
      uint64_t v70 = v20;
      uint64_t v21 = sub_24A1149E8((uint64_t *)&v68);
      BOOL v22 = v7;
      uint64_t v23 = v4;
      v12((char *)v21, (uint64_t)v22, v4);
      unint64_t v24 = sub_24A106698(v17);
      uint64_t v26 = v19[2];
      BOOL v27 = (v25 & 1) == 0;
      Swift::Int v28 = v26 + v27;
      if (__OFADD__(v26, v27)) {
        goto LABEL_21;
      }
      unint64_t v29 = v24;
      char v30 = v25;
      sub_24A0FA334(&qword_26976A380);
      if (_NativeDictionary.ensureUnique(isUnique:capacity:)(isUniquelyReferenced_nonNull_native, v28))
      {
        unint64_t v31 = sub_24A106698(v17);
        if ((v30 & 1) != (v32 & 1)) {
          goto LABEL_23;
        }
        unint64_t v29 = v31;
      }
      uint64_t v33 = v71;
      if (v30)
      {
        uint64_t v34 = v71[7] + 40 * v29;
        sub_24A0FAFA4(v34);
        sub_24A10A130(&v68, v34);
      }
      else
      {
        uint64_t v35 = sub_24A114A4C((uint64_t)&v68, v69);
        MEMORY[0x270FA5388](v35);
        uint64_t v37 = (char *)&v50 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
        (*(void (**)(char *))(v38 + 16))(v37);
        uint64_t v66 = v23;
        uint64_t v67 = v20;
        uint64_t v39 = sub_24A1149E8((uint64_t *)&v65);
        (*v51)(v39, v37, v23);
        v33[(v29 >> 6) + 8] |= 1 << v29;
        *(void *)(v33[6] + 8 * v29) = v17;
        sub_24A10A130(&v65, v33[7] + 40 * v29);
        uint64_t v40 = v33[2];
        BOOL v41 = __OFADD__(v40, 1);
        uint64_t v42 = v40 + 1;
        if (v41) {
          goto LABEL_22;
        }
        v33[2] = v42;
        sub_24A0FAFA4((uint64_t)&v68);
        uint64_t v33 = v71;
      }
      uint64_t v43 = v55;
      uint64_t v44 = (char *)v55 + *(int *)(v59 + 48);
      void *v64 = v33;
      swift_bridgeObjectRelease();
      swift_endAccess();
      objc_msgSend(v60, sel_unlock);
      uint64_t v4 = v23;
      (*v52)(v63, v23);
      *uint64_t v43 = v17;
      uint64_t v45 = v62;
      uint64_t v12 = v54;
      v54(v44, v62, v23);
      uint64_t v46 = v72;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_24A108D1C(0, *(void *)(v46 + 16) + 1, 1);
        uint64_t v46 = v72;
      }
      unint64_t v48 = *(void *)(v46 + 16);
      unint64_t v47 = *(void *)(v46 + 24);
      uint64_t v7 = v63;
      if (v48 >= v47 >> 1)
      {
        sub_24A108D1C(v47 > 1, v48 + 1, 1);
        uint64_t v46 = v72;
      }
      *(void *)(v46 + 16) = v48 + 1;
      sub_24A10A088((uint64_t)v43, v46+ ((*(unsigned __int8 *)(v58 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v58 + 80))+ *(void *)(v58 + 72) * v48, &qword_26976A3E8);
      uint64_t v15 = v45 + v53;
      uint64_t v11 = v61 - 1;
      a2 = v57;
      if (v61 == 1)
      {
        swift_release();
        return v46;
      }
    }
    __break(1u);
LABEL_21:
    __break(1u);
LABEL_22:
    __break(1u);
LABEL_23:
    uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
  }
  else
  {
    swift_release();
    return MEMORY[0x263F8EE78];
  }
  return result;
}

uint64_t sub_24A117484(uint64_t a1, uint64_t (*a2)(char *, uint64_t, uint64_t, unint64_t), uint64_t a3)
{
  char v32 = a2;
  uint64_t v33 = a3;
  uint64_t v5 = sub_24A0FA334(&qword_26976A3A8);
  uint64_t v30 = *(void *)(v5 - 8);
  uint64_t v31 = v5;
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *(void *)(a1 + 16);
  uint64_t v9 = MEMORY[0x263F8EE78];
  if (!v8) {
    return v9;
  }
  uint64_t v36 = v3;
  uint64_t v37 = MEMORY[0x263F8EE78];
  sub_24A108CEC(0, v8, 0);
  uint64_t v9 = v37;
  uint64_t result = sub_24A109A38(a1);
  if ((result & 0x8000000000000000) == 0)
  {
    unint64_t v12 = result;
    if (result < 1 << *(unsigned char *)(a1 + 32))
    {
      uint64_t v13 = a1 + 64;
      uint64_t v28 = a1 + 64;
      uint64_t v29 = a1;
      while ((*(void *)(v13 + 8 * (v12 >> 6)) & (1 << v12)) != 0)
      {
        if (v11 != *(_DWORD *)(a1 + 36)) {
          goto LABEL_20;
        }
        uint64_t v34 = v8;
        uint64_t v35 = v11;
        uint64_t v14 = v9;
        uint64_t v15 = *(void *)(*(void *)(a1 + 48) + 8 * v12);
        uint64_t v16 = (uint64_t *)(*(void *)(a1 + 56) + 16 * v12);
        uint64_t v17 = (uint64_t *)v7;
        uint64_t v19 = *v16;
        unint64_t v18 = v16[1];
        uint64_t v20 = (char *)v17 + *(int *)(v31 + 48);
        sub_24A109F34(*v16, v18);
        uint64_t v21 = v15;
        uint64_t v9 = v33;
        uint64_t v22 = v36;
        uint64_t v23 = v32(v20, v21, v19, v18);
        uint64_t v36 = v22;
        if (v22)
        {
          sub_24A0FA8D8(v19, v18);
          swift_release();
          return v9;
        }
        uint64_t v24 = v23;
        sub_24A0FA8D8(v19, v18);
        uint64_t *v17 = v24;
        uint64_t v9 = v14;
        uint64_t v37 = v14;
        unint64_t v26 = *(void *)(v14 + 16);
        unint64_t v25 = *(void *)(v14 + 24);
        uint64_t v7 = (char *)v17;
        if (v26 >= v25 >> 1)
        {
          sub_24A108CEC(v25 > 1, v26 + 1, 1);
          uint64_t v9 = v37;
        }
        *(void *)(v9 + 16) = v26 + 1;
        uint64_t result = sub_24A10A088((uint64_t)v17, v9+ ((*(unsigned __int8 *)(v30 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v30 + 80))+ *(void *)(v30 + 72) * v26, &qword_26976A3A8);
        a1 = v29;
        if ((uint64_t)v12 >= -(-1 << *(unsigned char *)(v29 + 32))) {
          goto LABEL_21;
        }
        uint64_t v13 = v28;
        if ((*(void *)(v28 + 8 * (v12 >> 6)) & (1 << v12)) == 0) {
          goto LABEL_22;
        }
        if (v35 != *(_DWORD *)(v29 + 36)) {
          goto LABEL_23;
        }
        uint64_t result = _HashTable.occupiedBucket(after:)();
        uint64_t v8 = v34 - 1;
        if (v34 == 1) {
          return v9;
        }
        unint64_t v12 = result;
        if ((result & 0x8000000000000000) == 0)
        {
          uint64_t v11 = *(unsigned int *)(a1 + 36);
          if (result < 1 << *(unsigned char *)(a1 + 32)) {
            continue;
          }
        }
        goto LABEL_24;
      }
      __break(1u);
LABEL_20:
      __break(1u);
LABEL_21:
      __break(1u);
LABEL_22:
      __break(1u);
LABEL_23:
      __break(1u);
    }
  }
LABEL_24:
  __break(1u);
  return result;
}

uint64_t sub_24A11775C()
{
  sub_24A0FB204();
  v1[9] = v2;
  v1[10] = v0;
  uint64_t v3 = type metadata accessor for TaskPriority();
  v1[11] = v3;
  v1[12] = *(void *)(v3 - 8);
  v1[13] = swift_task_alloc();
  sub_24A0FB244();
  return MEMORY[0x270FA2498](v4, v5, v6);
}

uint64_t sub_24A117814()
{
  unint64_t v26 = v0;
  if (qword_26976A070 != -1) {
    swift_once();
  }
  uint64_t v1 = type metadata accessor for Logger();
  v0[14] = sub_24A1058C4(v1, (uint64_t)qword_26976A618);
  swift_bridgeObjectRetain_n();
  uint64_t v2 = Logger.logObject.getter();
  os_log_type_t v3 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v2, v3))
  {
    os_log_type_t type = v3;
    uint64_t v4 = v0[13];
    uint64_t v23 = v0[12];
    uint64_t v22 = v0[11];
    uint64_t v5 = swift_slowAlloc();
    v25[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 136315394;
    uint64_t v6 = type metadata accessor for AssetUploadRequest();
    uint64_t v7 = swift_bridgeObjectRetain();
    uint64_t v8 = MEMORY[0x24C5BC170](v7, v6);
    uint64_t v10 = v9;
    swift_bridgeObjectRelease();
    v0[7] = sub_24A10590C(v8, v10, v25);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v5 + 12) = 2080;
    static Task<>.currentPriority.getter();
    sub_24A11A2F4(&qword_26976A1E8, MEMORY[0x263F8F520]);
    uint64_t v11 = dispatch thunk of CustomStringConvertible.description.getter();
    uint64_t v13 = v12;
    (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v4, v22);
    v0[8] = sub_24A10590C(v11, v13, v25);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24A0F4000, v2, type, "processing %s with priority %s", (uint8_t *)v5, 0x16u);
    swift_arrayDestroy();
    sub_24A10A3DC();
    sub_24A10A3DC();
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  uint64_t v14 = v0[9];
  uint64_t v15 = *(void **)(*(void *)(*(void *)(v0[10] + 16) + 24)
                   + OBJC_IVAR____TtC16CloudAssetDaemon13TenantContext_requestTracker);
  v0[15] = v15;
  swift_retain_n();
  uint64_t v16 = sub_24A116EA0(v14, v15);
  uint64_t v17 = sub_24A0FDAC4(v16);
  uint64_t v18 = sub_24A109964(v17);
  v0[16] = v18;
  type metadata accessor for Registerer.OptionsBuilder();
  *(void *)(swift_initStackObject() + 16) = v17;
  uint64_t v19 = sub_24A1186DC();
  v0[17] = v19;
  swift_bridgeObjectRelease();
  uint64_t v20 = (void *)swift_task_alloc();
  v0[18] = v20;
  *uint64_t v20 = v0;
  v20[1] = sub_24A117BA4;
  return sub_24A1192F4(v18, v19);
}

uint64_t sub_24A117BA4()
{
  sub_24A0FB204();
  sub_24A0FB00C();
  *(void *)(v2 + 152) = v1;
  *(void *)(v2 + 160) = v0;
  swift_task_dealloc();
  if (!v0)
  {
    swift_bridgeObjectRelease();
    swift_release();
  }
  sub_24A0FB244();
  return MEMORY[0x270FA2498](v3, v4, v5);
}

uint64_t sub_24A117C9C()
{
  uint64_t v17 = v0;
  swift_bridgeObjectRetain_n();
  uint64_t v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    uint64_t v16 = swift_slowAlloc();
    *(_DWORD *)uint64_t v3 = 136315138;
    uint64_t v4 = type metadata accessor for AssetUploadRequest();
    uint64_t v5 = swift_bridgeObjectRetain();
    uint64_t v6 = MEMORY[0x24C5BC170](v5, v4);
    uint64_t v8 = v7;
    swift_bridgeObjectRelease();
    v0[6] = sub_24A10590C(v6, v8, &v16);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_24A0F4000, v1, v2, "finish processing %s", v3, 0xCu);
    swift_arrayDestroy();
    sub_24A10A3DC();
    sub_24A10A3DC();
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  uint64_t v9 = v0[20];
  uint64_t v10 = sub_24A117484(v0[19], (uint64_t (*)(char *, uint64_t, uint64_t, unint64_t))sub_24A11A170, v0[15]);
  if (v9)
  {
    swift_release();
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    uint64_t v11 = (uint64_t (*)(void))v0[1];
    return v11();
  }
  else
  {
    uint64_t v13 = v10;
    swift_bridgeObjectRelease();
    uint64_t v14 = sub_24A0FDAE4(v13);
    swift_release();
    swift_task_dealloc();
    uint64_t v15 = (uint64_t (*)(uint64_t))v0[1];
    return v15(v14);
  }
}

uint64_t sub_24A117F0C()
{
  sub_24A0FB204();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24A117F88()
{
  uint64_t v0 = Asset.Protector.securityKey.getter();
  uint64_t v2 = v0;
  unint64_t v3 = v1;
  switch(v1 >> 62)
  {
    case 1uLL:
      if (v0 >> 32 < (int)v0)
      {
        __break(1u);
        goto LABEL_11;
      }
      swift_retain();
      CFDataRef v6 = sub_24A11A18C((int)v2, v2 >> 32);
      sub_24A0FA8D8(v2, v3);
LABEL_8:
      sub_24A0FA8D8(v2, v3);
      uint64_t v9 = (void *)MMCSReferenceSignatureCreateWithReferenceObject();

      if (!v9)
      {
LABEL_11:
        __break(1u);
        JUMPOUT(0x24A1180E8);
      }
      uint64_t v10 = static Data._unconditionallyBridgeFromObjectiveC(_:)();

      return v10;
    case 2uLL:
      uint64_t v7 = *(void *)(v0 + 16);
      uint64_t v8 = *(void *)(v0 + 24);
      swift_retain();
      swift_retain();
      CFDataRef v6 = sub_24A11A18C(v7, v8);
      swift_release();
      swift_release();
      goto LABEL_8;
    case 3uLL:
      uint64_t v0 = 0;
      uint64_t v5 = 0;
      CFIndex v4 = 0;
      goto LABEL_7;
    default:
      CFIndex v4 = BYTE6(v1);
      uint64_t v5 = v1 & 0xFFFFFFFFFFFFLL;
LABEL_7:
      CFDataRef v6 = sub_24A11A218(v0, v5, v4);
      goto LABEL_8;
  }
}

uint64_t sub_24A1180F8()
{
  v5[2] = *v0;
  uint64_t v1 = swift_bridgeObjectRetain();
  sub_24A116B50(v1, (uint64_t (*)(void, char *))sub_24A11A2EC, (uint64_t)v5);
  uint64_t v3 = v2;
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t sub_24A11818C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v51 = a3;
  uint64_t v5 = type metadata accessor for Asset.Protector();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v47 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  AssetUploadRequest.protector.getter();
  uint64_t v9 = Asset.Protector.securityKey.getter();
  unint64_t v11 = v10;
  uint64_t v12 = *(void (**)(char *, uint64_t))(v6 + 8);
  v12(v8, v5);
  uint64_t v50 = a2;
  AssetUploadRequest.protector.getter();
  uint64_t v52 = Asset.Protector.privacyKey.getter();
  unint64_t v53 = v13;
  v12(v8, v5);
  sub_24A0FA334(&qword_26976A2D8);
  uint64_t inited = swift_initStackObject();
  long long v54 = xmmword_24A11C2F0;
  *(_OWORD *)(inited + 16) = xmmword_24A11C2F0;
  if (!*MEMORY[0x263F534E8])
  {
    __break(1u);
    goto LABEL_16;
  }
  *(void *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(inited + 40) = v15;
  *(void *)(inited + 72) = MEMORY[0x263F8D6C8];
  *(void *)(inited + 48) = a1;
  uint64_t v16 = Dictionary.init(dictionaryLiteral:)();
  if (!sub_24A0FC110(v9, v11))
  {
    uint64_t v48 = v9;
    unint64_t v49 = v11;
    uint64_t v24 = swift_initStackObject();
    long long v47 = xmmword_24A11C300;
    *(_OWORD *)(v24 + 16) = xmmword_24A11C300;
    if (*MEMORY[0x263F53598])
    {
      *(void *)(v24 + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)();
      *(void *)(v24 + 40) = v25;
      sub_24A0FA334(&qword_26976A2F8);
      uint64_t v26 = swift_initStackObject();
      *(_OWORD *)(v26 + 16) = v47;
      if (*MEMORY[0x263F534F0])
      {
        *(void *)(v26 + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)();
        *(void *)(v26 + 40) = v27;
        uint64_t v29 = v48;
        unint64_t v28 = v49;
        *(void *)(v26 + 48) = v48;
        *(void *)(v26 + 56) = v28;
        if (*MEMORY[0x263F534F8])
        {
          *(void *)(v26 + 64) = static String._unconditionallyBridgeFromObjectiveC(_:)();
          *(void *)(v26 + 72) = v30;
          sub_24A109F34(v29, v28);
          AssetUploadRequest.protector.getter();
          uint64_t v31 = sub_24A117F88();
          uint64_t v33 = v32;
          v12(v8, v5);
          *(void *)(v26 + 80) = v31;
          *(void *)(v26 + 88) = v33;
          uint64_t v34 = Dictionary.init(dictionaryLiteral:)();
          *(void *)(v24 + 72) = sub_24A0FA334(&qword_26976A300);
          *(void *)(v24 + 48) = v34;
          if (*MEMORY[0x263F53500])
          {
            *(void *)(v24 + 80) = static String._unconditionallyBridgeFromObjectiveC(_:)();
            *(void *)(v24 + 88) = v35;
            *(void *)(v24 + 120) = MEMORY[0x263F8D4F8];
            *(unsigned char *)(v24 + 96) = 1;
            uint64_t v36 = Dictionary.init(dictionaryLiteral:)();
            char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
            v55[0] = v16;
            sub_24A114190(v36, (uint64_t)sub_24A107BE0, 0, isUniquelyReferenced_nonNull_native, v55);
            uint64_t v22 = v52;
            unint64_t v21 = v53;
            uint64_t v23 = v55[0];
            swift_bridgeObjectRelease();
            uint64_t v9 = v48;
            unint64_t v11 = v49;
            goto LABEL_10;
          }
LABEL_20:
          __break(1u);
          goto LABEL_21;
        }
LABEL_19:
        __break(1u);
        goto LABEL_20;
      }
LABEL_18:
      __break(1u);
      goto LABEL_19;
    }
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  uint64_t v17 = swift_initStackObject();
  *(_OWORD *)(v17 + 16) = v54;
  if (!*MEMORY[0x263F53508])
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  *(void *)(v17 + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(v17 + 40) = v18;
  *(void *)(v17 + 72) = MEMORY[0x263F8D4F8];
  *(unsigned char *)(v17 + 48) = 1;
  uint64_t v19 = Dictionary.init(dictionaryLiteral:)();
  char v20 = swift_isUniquelyReferenced_nonNull_native();
  v55[0] = v16;
  sub_24A114190(v19, (uint64_t)sub_24A107BE0, 0, v20, v55);
  uint64_t v22 = v52;
  unint64_t v21 = v53;
  uint64_t v23 = v55[0];
  swift_bridgeObjectRelease();
LABEL_10:
  if (sub_24A0FC110(v22, v21))
  {
    uint64_t v38 = v9;
    unint64_t v39 = v11;
LABEL_14:
    sub_24A0FA8D8(v38, v39);
    sub_24A0FA8D8(v22, v21);
    return v23;
  }
  unint64_t v40 = v11;
  sub_24A0FA334(&qword_26976A2F8);
  uint64_t v41 = swift_initStackObject();
  *(_OWORD *)(v41 + 16) = v54;
  if (*MEMORY[0x263F534B8])
  {
    *(void *)(v41 + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)();
    *(void *)(v41 + 40) = v42;
    *(void *)(v41 + 48) = v22;
    *(void *)(v41 + 56) = v21;
    sub_24A109F34(v22, v21);
    Dictionary.init(dictionaryLiteral:)();
    sub_24A0FC400();
    uint64_t v44 = v43;
    swift_bridgeObjectRelease();
    char v45 = swift_isUniquelyReferenced_nonNull_native();
    v55[0] = v23;
    sub_24A114190(v44, (uint64_t)sub_24A107BE0, 0, v45, v55);
    uint64_t v23 = v55[0];
    swift_bridgeObjectRelease();
    uint64_t v38 = v9;
    unint64_t v39 = v40;
    goto LABEL_14;
  }
LABEL_21:
  __break(1u);
  uint64_t result = swift_bridgeObjectRelease();
  __break(1u);
  return result;
}

uint64_t sub_24A1186DC()
{
  sub_24A0FA334(&qword_26976A2D8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24A11C540;
  uint64_t result = *MEMORY[0x263F53538];
  if (!*MEMORY[0x263F53538])
  {
    __break(1u);
    goto LABEL_6;
  }
  *(void *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(inited + 40) = v2;
  uint64_t v3 = MEMORY[0x263F8D4F8];
  *(void *)(inited + 72) = MEMORY[0x263F8D4F8];
  *(unsigned char *)(inited + 48) = 1;
  uint64_t result = *MEMORY[0x263F53500];
  if (!*MEMORY[0x263F53500])
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  *(void *)(inited + 80) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(inited + 88) = v4;
  *(void *)(inited + 120) = v3;
  *(unsigned char *)(inited + 96) = 1;
  uint64_t result = *MEMORY[0x263F53520];
  if (*MEMORY[0x263F53520])
  {
    *(void *)(inited + 128) = static String._unconditionallyBridgeFromObjectiveC(_:)();
    *(void *)(inited + 136) = v5;
    uint64_t v6 = sub_24A1180F8();
    *(void *)(inited + 168) = sub_24A0FA334(&qword_26976A2E0);
    *(void *)(inited + 144) = v6;
    return Dictionary.init(dictionaryLiteral:)();
  }
LABEL_7:
  __break(1u);
  return result;
}

uint64_t sub_24A1187DC()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0228](v0, 24, 7);
}

uint64_t sub_24A118814()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_24A10A208(v0, qword_26976A618);
  sub_24A1058C4(v0, (uint64_t)qword_26976A618);
  static LoggerSubsystem.server.getter();
  type metadata accessor for Registerer();
  sub_24A0FA334(&qword_26976A678);
  String.init<A>(describing:)();
  return Logger.init(subsystem:category:)();
}

uint64_t sub_24A1188B0(uint64_t a1)
{
  *(void *)(v1 + 16) = swift_slowAlloc();
  uint64_t v3 = v1 + OBJC_IVAR____TtCC16CloudAssetDaemon10Registerer7Context_continutation;
  uint64_t v4 = sub_24A0FA334(&qword_26976A660);
  uint64_t v5 = *(void *)(v4 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v3, a1, v4);
  **(void **)(v1 + 16) = v1;
  swift_retain();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1, v4);
  return v1;
}

uint64_t sub_24A118990()
{
  sub_24A10A3DC();
  uint64_t v1 = v0 + OBJC_IVAR____TtCC16CloudAssetDaemon10Registerer7Context_continutation;
  sub_24A0FA334(&qword_26976A660);
  sub_24A10A3CC();
  (*(void (**)(uint64_t))(v2 + 8))(v1);
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t sub_24A118A34(uint64_t *a1, uint64_t a2, _DWORD *a3, void *a4)
{
  uint64_t v35 = a3;
  uint64_t v7 = type metadata accessor for URL();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  unint64_t v10 = (char *)v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_24A0FA334(&qword_26976A680);
  MEMORY[0x270FA5388](v11 - 8);
  unint64_t v13 = (char *)v32 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for AssetUploadRequest();
  uint64_t v15 = MEMORY[0x270FA5388](v14);
  MEMORY[0x270FA5388](v15);
  uint64_t v18 = (char *)v32 - v17;
  if (!a1)
  {
    if (qword_26976A070 != -1) {
      swift_once();
    }
    uint64_t v19 = type metadata accessor for Logger();
    sub_24A1058C4(v19, (uint64_t)qword_26976A618);
    char v20 = Logger.logObject.getter();
    os_log_type_t v21 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v22 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v22 = 0;
      _os_log_impl(&dword_24A0F4000, v20, v21, "context for registering assets can not be loaded", v22, 2u);
      MEMORY[0x24C5BCA40](v22, -1, -1);
    }
    goto LABEL_12;
  }
  if (a2 < 0)
  {
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v33 = a4;
  uint64_t v34 = v16;
  uint64_t v36 = *a1;
  swift_retain();
  sub_24A114D74(a2, (uint64_t)v37);
  sub_24A0FA334(&qword_26976A350);
  int v23 = swift_dynamicCast();
  sub_24A0F600C((uint64_t)v13, v23 ^ 1u, 1, v14);
  int v24 = sub_24A0F5F50((uint64_t)v13, 1, v14);
  if (v24 == 1)
  {
    sub_24A10A26C((uint64_t)v13, &qword_26976A680);
    if (qword_26976A070 == -1)
    {
LABEL_10:
      uint64_t v25 = type metadata accessor for Logger();
      sub_24A1058C4(v25, (uint64_t)qword_26976A618);
      char v20 = Logger.logObject.getter();
      os_log_type_t v26 = static os_log_type_t.error.getter();
      if (!os_log_type_enabled(v20, v26))
      {

        swift_release();
        return 0;
      }
      uint64_t v27 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v27 = 134349056;
      v37[0] = a2;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_24A0F4000, v20, v26, "asset request with tracking number %{public}llu can not be found", v27, 0xCu);
      MEMORY[0x24C5BCA40](v27, -1, -1);
      swift_release();
LABEL_12:

      return 0;
    }
LABEL_22:
    swift_once();
    goto LABEL_10;
  }
  (*(void (**)(char *, char *, uint64_t))(v34 + 32))(v18, v13, v14);
  AssetUploadRequest.fileURL.getter();
  URL.path(percentEncoded:)(1);
  uint64_t v29 = *(void (**)(char *, uint64_t))(v8 + 8);
  v32[5] = v8 + 8;
  v29(v10, v7);
  String.utf8CString.getter();
  swift_bridgeObjectRelease();
  int v30 = sub_24A119258();
  swift_release();
  if (v35) {
    *uint64_t v35 = v30;
  }
  uint64_t v31 = v33;
  if (v33)
  {
    *uint64_t v31 = MEMORY[0x24C5BC080](6584422, 0xE300000000000000);
    swift_release();
    (*(void (**)(char *, uint64_t))(v34 + 8))(v18, v14);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v34 + 8))(v18, v14);
    swift_release();
  }
  return 1;
}

uint64_t sub_24A119258()
{
  uint64_t v0 = static FileDescriptor._open(_:_:options:permissions:retryOnInterrupt:)();
  if ((v0 & 0x100000000) != 0)
  {
    sub_24A11A33C();
    swift_willThrowTypedImpl();
    swift_allocError();
    *uint64_t v1 = v0;
  }
  return v0;
}

uint64_t sub_24A1192D8(uint64_t *a1, uint64_t a2, _DWORD *a3, void *a4)
{
  return sub_24A118A34(a1, a2, a3, a4);
}

uint64_t sub_24A1192F4(uint64_t a1, uint64_t a2)
{
  *(void *)(v3 + 24) = a2;
  *(void *)(v3 + 32) = v2;
  return MEMORY[0x270FA2498](sub_24A119314, 0, 0);
}

uint64_t sub_24A119314()
{
  uint64_t v1 = (int8x16_t *)swift_task_alloc();
  *(void *)(v0 + 40) = v1;
  v1[1] = vextq_s8(*(int8x16_t *)(v0 + 24), *(int8x16_t *)(v0 + 24), 8uLL);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 48) = v2;
  sub_24A0FA334(&qword_26976A648);
  *uint64_t v2 = v0;
  v2[1] = sub_24A119418;
  sub_24A0FB244();
  return MEMORY[0x270FA2360]();
}

uint64_t sub_24A119418()
{
  sub_24A0FB204();
  sub_24A0FB00C();
  *(void *)(v1 + 56) = v0;
  swift_task_dealloc();
  if (!v0) {
    swift_task_dealloc();
  }
  sub_24A0FB244();
  return MEMORY[0x270FA2498](v2, v3, v4);
}

uint64_t sub_24A119508()
{
  return (*(uint64_t (**)(void))(v0 + 8))(*(void *)(v0 + 16));
}

uint64_t sub_24A119524()
{
  sub_24A0FB204();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

void sub_24A119584(uint64_t a1)
{
  uint64_t v2 = sub_24A0FA334(&qword_26976A660);
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v5 + 16))(v4, a1);
  type metadata accessor for Registerer.Context();
  swift_allocObject();
  sub_24A1188B0((uint64_t)v4);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  MMCSRegisterItems();
  swift_release();
}

void sub_24A1196CC(uint64_t *a1, uint64_t a2)
{
  if (a1)
  {
    uint64_t v2 = *a1;
    if (a2)
    {
      *(void *)&long long v11 = 0;
      swift_retain();
      static Dictionary._conditionallyBridgeFromObjectiveC(_:result:)();
    }
    else
    {
      swift_retain();
    }
    memset(v12, 0, 32);
    sub_24A10A26C((uint64_t)v12, &qword_26976A410);
    sub_24A104500();
    *(void *)&v12[0] = swift_allocError();
    sub_24A0FA334(&qword_26976A660);
    CheckedContinuation.resume(throwing:)();
    if (qword_26976A070 != -1) {
      swift_once();
    }
    uint64_t v6 = type metadata accessor for Logger();
    sub_24A1058C4(v6, (uint64_t)qword_26976A618);
    uint64_t v7 = Logger.logObject.getter();
    os_log_type_t v8 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl(&dword_24A0F4000, v7, v8, "mmcs engine returns nil results", v9, 2u);
      MEMORY[0x24C5BCA40](v9, -1, -1);
    }

    MEMORY[0x24C5BCA40](*(void *)(v2 + 16), -1, -1);
    swift_release();
  }
  else
  {
    if (qword_26976A070 != -1) {
      swift_once();
    }
    uint64_t v3 = type metadata accessor for Logger();
    sub_24A1058C4(v3, (uint64_t)qword_26976A618);
    osos_log_t log = Logger.logObject.getter();
    os_log_type_t v4 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(oslog, v4))
    {
      uint64_t v5 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_24A0F4000, oslog, v4, "context for registering assets can not be loaded", v5, 2u);
      MEMORY[0x24C5BCA40](v5, -1, -1);
    }
  }
}

void sub_24A119C68(uint64_t *a1, void *a2)
{
  id v4 = a2;
  sub_24A1196CC(a1, (uint64_t)a2);
}

uint64_t sub_24A119CBC(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v29 = a4;
  uint64_t v27 = a3;
  uint64_t v25 = a1;
  uint64_t v6 = type metadata accessor for URL();
  MEMORY[0x270FA5388](v6 - 8);
  os_log_type_t v26 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for Asset.ID();
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v9 = type metadata accessor for Asset.Protector();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for AssetUploadRequest();
  uint64_t v24 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (char *)&v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24A114D74(a2, (uint64_t)v28);
  if (!v4)
  {
    sub_24A0FA334(&qword_26976A350);
    uint64_t v22 = v13;
    swift_dynamicCast();
    type metadata accessor for Registerer.OptionsBuilder();
    uint64_t v23 = a2;
    AssetUploadRequest.protector.getter();
    uint64_t v16 = sub_24A117F88();
    unint64_t v18 = v17;
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
    AssetUploadRequest.storageLocation.getter();
    sub_24A109F34(v27, v29);
    sub_24A109F34(v16, v18);
    Asset.ID.init(storageLocation:signature:referenceSignature:)();
    AssetUploadRequest.protector.getter();
    Asset.init(id:protector:size:)();
    uint64_t v19 = v16;
    a2 = v23;
    sub_24A0FA8D8(v19, v18);
    (*(void (**)(char *, uint64_t))(v24 + 8))(v15, v22);
  }
  return a2;
}

uint64_t type metadata accessor for Registerer()
{
  return self;
}

uint64_t type metadata accessor for Registerer.OptionsBuilder()
{
  return self;
}

uint64_t sub_24A11A008()
{
  return type metadata accessor for Registerer.Context();
}

uint64_t type metadata accessor for Registerer.Context()
{
  uint64_t result = qword_26976A630;
  if (!qword_26976A630) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_24A11A058()
{
  sub_24A11A0F8();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_24A11A0F8()
{
  if (!qword_26976A640)
  {
    sub_24A106528(&qword_26976A648);
    sub_24A106528(&qword_26976A248);
    unint64_t v0 = type metadata accessor for CheckedContinuation();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26976A640);
    }
  }
}

uint64_t sub_24A11A170(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  return sub_24A119CBC(a1, a2, a3, a4);
}

CFDataRef sub_24A11A18C(uint64_t a1, uint64_t a2)
{
  CFDataRef result = (CFDataRef)__DataStorage._bytes.getter();
  uint64_t v5 = (const UInt8 *)result;
  if (result)
  {
    CFDataRef result = (CFDataRef)__DataStorage._offset.getter();
    if (__OFSUB__(a1, result))
    {
LABEL_13:
      __break(1u);
      return result;
    }
    v5 += a1 - (void)result;
  }
  BOOL v6 = __OFSUB__(a2, a1);
  uint64_t v7 = a2 - a1;
  if (v6)
  {
    __break(1u);
    goto LABEL_13;
  }
  uint64_t v8 = __DataStorage._length.getter();
  if (v8 >= v7) {
    CFIndex v9 = v7;
  }
  else {
    CFIndex v9 = v8;
  }
  if (v5) {
    CFIndex v10 = v9;
  }
  else {
    CFIndex v10 = 0;
  }
  return CFDataCreate(0, v5, v10);
}

CFDataRef sub_24A11A218(uint64_t a1, uint64_t a2, CFIndex a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t bytes = a1;
  __int16 v5 = a2;
  char v6 = BYTE2(a2);
  char v7 = BYTE3(a2);
  char v8 = BYTE4(a2);
  char v9 = BYTE5(a2);
  return CFDataCreate(0, (const UInt8 *)&bytes, a3);
}

void sub_24A11A2E4(uint64_t a1)
{
}

uint64_t sub_24A11A2EC(uint64_t a1, uint64_t a2)
{
  return sub_24A11818C(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_24A11A2F4(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_24A11A33C()
{
  unint64_t result = qword_26976A688;
  if (!qword_26976A688)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26976A688);
  }
  return result;
}

uint64_t Asset.ID.storageLocation.getter()
{
  return MEMORY[0x270F16940]();
}

uint64_t Asset.ID.init(storageLocation:signature:referenceSignature:)()
{
  return MEMORY[0x270F16948]();
}

uint64_t Asset.ID.referenceSignature.getter()
{
  return MEMORY[0x270F16950]();
}

uint64_t Asset.ID.signature.getter()
{
  return MEMORY[0x270F16958]();
}

uint64_t type metadata accessor for Asset.ID()
{
  return MEMORY[0x270F16960]();
}

uint64_t Asset.init(id:protector:size:)()
{
  return MEMORY[0x270F16968]();
}

uint64_t Asset.id.getter()
{
  return MEMORY[0x270F16970]();
}

uint64_t Asset.Protector.privacyKey.getter()
{
  return MEMORY[0x270F16978]();
}

uint64_t Asset.Protector.securityKey.getter()
{
  return MEMORY[0x270F16980]();
}

uint64_t type metadata accessor for Asset.Protector()
{
  return MEMORY[0x270F16988]();
}

uint64_t Asset.protector.getter()
{
  return MEMORY[0x270F16990]();
}

uint64_t type metadata accessor for Asset()
{
  return MEMORY[0x270F16998]();
}

uint64_t AssetUploadRequest.credential.getter()
{
  return MEMORY[0x270F169A0]();
}

uint64_t AssetUploadRequest.tenantName.getter()
{
  return MEMORY[0x270F169A8]();
}

uint64_t AssetUploadRequest.storageLocation.getter()
{
  return MEMORY[0x270F169B0]();
}

uint64_t AssetUploadRequest.workingDirectory.getter()
{
  return MEMORY[0x270F169B8]();
}

uint64_t AssetUploadRequest.fileURL.getter()
{
  return MEMORY[0x270F169C0]();
}

uint64_t AssetUploadRequest.protector.getter()
{
  return MEMORY[0x270F169C8]();
}

uint64_t type metadata accessor for AssetUploadRequest()
{
  return MEMORY[0x270F169D0]();
}

uint64_t AssetDownloadRequest.tenantName.getter()
{
  return MEMORY[0x270F169D8]();
}

uint64_t AssetDownloadRequest.applicationID.getter()
{
  return MEMORY[0x270F169E0]();
}

uint64_t AssetDownloadRequest.storageReference.getter()
{
  return MEMORY[0x270F169E8]();
}

uint64_t AssetDownloadRequest.workingDirectory.getter()
{
  return MEMORY[0x270F169F0]();
}

uint64_t AssetDownloadRequest.storageReferenceSignature.getter()
{
  return MEMORY[0x270F169F8]();
}

uint64_t AssetDownloadRequest.id.getter()
{
  return MEMORY[0x270F16A00]();
}

uint64_t AssetDownloadRequest.asset.getter()
{
  return MEMORY[0x270F16A08]();
}

uint64_t AssetDownloadRequest.range.getter()
{
  return MEMORY[0x270F16A10]();
}

uint64_t type metadata accessor for AssetDownloadRequest()
{
  return MEMORY[0x270F16A18]();
}

uint64_t AssetDownloadResponse.init(id:asset:fileURL:range:)()
{
  return MEMORY[0x270F16A20]();
}

uint64_t dispatch thunk of AssetRequest.credential.getter()
{
  return MEMORY[0x270F16A28]();
}

uint64_t AssetSkeleton.init(asset:credential:storageReference:storageReferenceSignature:)()
{
  return MEMORY[0x270F16A30]();
}

uint64_t type metadata accessor for AssetSkeleton()
{
  return MEMORY[0x270F16A38]();
}

uint64_t Credential.accessToken.getter()
{
  return MEMORY[0x270F16A40]();
}

uint64_t Credential.requestorID.getter()
{
  return MEMORY[0x270F16A48]();
}

uint64_t type metadata accessor for Credential()
{
  return MEMORY[0x270F16A50]();
}

uint64_t static LoggerSubsystem.server.getter()
{
  return MEMORY[0x270F16A58]();
}

uint64_t type metadata accessor for UploadRequestMessage()
{
  return MEMORY[0x270F16A60]();
}

uint64_t type metadata accessor for UploadResponseMessage()
{
  return MEMORY[0x270F16A68]();
}

uint64_t type metadata accessor for DownloadRequestMessage()
{
  return MEMORY[0x270F16A70]();
}

uint64_t type metadata accessor for DownloadResponseMessage()
{
  return MEMORY[0x270F16A78]();
}

uint64_t XPCAsyncSequenceRequest.id.getter()
{
  return MEMORY[0x270F16A80]();
}

uint64_t XPCAsyncSequenceRequest.data.getter()
{
  return MEMORY[0x270F16A88]();
}

uint64_t type metadata accessor for XPCAsyncSequenceRequest()
{
  return MEMORY[0x270F16A90]();
}

uint64_t XPCAsyncSequenceResponse.init(id:event:)()
{
  return MEMORY[0x270F16A98]();
}

uint64_t type metadata accessor for XPCAsyncSequenceResponse.Event()
{
  return MEMORY[0x270F16AA0]();
}

uint64_t type metadata accessor for XPCAsyncSequenceResponse()
{
  return MEMORY[0x270F16AA8]();
}

uint64_t type metadata accessor for SimultaneousTransferError()
{
  return MEMORY[0x270F16AB0]();
}

uint64_t Signal.init()()
{
  return MEMORY[0x270F16AB8]();
}

uint64_t type metadata accessor for XPCError()
{
  return MEMORY[0x270F16AC0]();
}

uint64_t dispatch thunk of JSONDecoder.decode<A>(_:from:)()
{
  return MEMORY[0x270EEDDD0]();
}

uint64_t JSONDecoder.init()()
{
  return MEMORY[0x270EEDE10]();
}

uint64_t type metadata accessor for JSONDecoder()
{
  return MEMORY[0x270EEDE18]();
}

uint64_t dispatch thunk of JSONEncoder.encode<A>(_:)()
{
  return MEMORY[0x270EEDEE8]();
}

uint64_t JSONEncoder.init()()
{
  return MEMORY[0x270EEDF30]();
}

uint64_t __DataStorage._bytes.getter()
{
  return MEMORY[0x270EEE638]();
}

uint64_t __DataStorage._length.getter()
{
  return MEMORY[0x270EEE658]();
}

uint64_t __DataStorage._offset.getter()
{
  return MEMORY[0x270EEE670]();
}

uint64_t _convertErrorToNSError(_:)()
{
  return MEMORY[0x270EEF830]();
}

uint64_t _convertNSErrorToError(_:)()
{
  return MEMORY[0x270EEF840]();
}

uint64_t type metadata accessor for URL.DirectoryHint()
{
  return MEMORY[0x270EEFC10]();
}

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
}

uint64_t static URL.== infix(_:_:)()
{
  return MEMORY[0x270EEFDF0]();
}

Swift::String __swiftcall URL.path(percentEncoded:)(Swift::Bool percentEncoded)
{
  uint64_t v1 = MEMORY[0x270EEFE68](percentEncoded);
  result._object = v2;
  result._uint64_t countAndFlagsBits = v1;
  return result;
}

uint64_t URL.init(filePath:directoryHint:relativeTo:)()
{
  return MEMORY[0x270EEFF18]();
}

uint64_t type metadata accessor for URL()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t Data._copyContents(initializing:)()
{
  return MEMORY[0x270EF0048]();
}

uint64_t static Data._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF0178]();
}

uint64_t type metadata accessor for Data.Iterator()
{
  return MEMORY[0x270EF0238]();
}

uint64_t Data.Iterator.init(_:at:)()
{
  return MEMORY[0x270EF0248]();
}

uint64_t type metadata accessor for UUID()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t Logger.logObject.getter()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t Logger.init(subsystem:category:)()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t type metadata accessor for Logger()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t dispatch thunk of XPCSession.send<A>(_:)()
{
  return MEMORY[0x270FA1B40]();
}

uint64_t dispatch thunk of XPCListener.IncomingSessionRequest.accept<A>(_:)()
{
  return MEMORY[0x270FA1C00]();
}

uint64_t XPCPeerHandler.handleCancellation(error:)()
{
  return MEMORY[0x270FA1CF8]();
}

uint64_t XPCReceivedMessage.auditToken.getter()
{
  return MEMORY[0x270FA1D38]();
}

uint64_t XPCReceivedMessage.decode<A>(as:)()
{
  return MEMORY[0x270FA1D78]();
}

uint64_t static FileDescriptor._open(_:_:options:permissions:retryOnInterrupt:)()
{
  return MEMORY[0x270FA1510]();
}

uint64_t static DispatchQoS.unspecified.getter()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t type metadata accessor for DispatchQoS()
{
  return MEMORY[0x270FA0A48]();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)MEMORY[0x270EF1818]();
}

uint64_t static Dictionary._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return MEMORY[0x270EF1830]();
}

uint64_t Dictionary.description.getter()
{
  return MEMORY[0x270F9D060]();
}

uint64_t Dictionary.init(dictionaryLiteral:)()
{
  return MEMORY[0x270F9D0A8]();
}

uint64_t Dictionary.Keys.description.getter()
{
  return MEMORY[0x270F9D0B8]();
}

uint64_t dispatch thunk of Hashable._rawHashValue(seed:)()
{
  return MEMORY[0x270F9D318]();
}

uint64_t dispatch thunk of Hashable.hash(into:)()
{
  return MEMORY[0x270F9D320]();
}

uint64_t dispatch thunk of static Equatable.== infix(_:_:)()
{
  return MEMORY[0x270F9D598]();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)MEMORY[0x270EF19B0]();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t static String.Encoding.utf8.getter()
{
  return MEMORY[0x270EF1AA8]();
}

uint64_t type metadata accessor for String.Encoding()
{
  return MEMORY[0x270EF1AD0]();
}

uint64_t String.init<A>(describing:)()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t String.utf8CString.getter()
{
  return MEMORY[0x270F9D620]();
}

uint64_t static String._fromSubstring(_:)()
{
  return MEMORY[0x270F9D648]();
}

uint64_t String.hash(into:)()
{
  return MEMORY[0x270F9D708]();
}

uint64_t String.index(after:)()
{
  return MEMORY[0x270F9D748]();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

uint64_t String.init(cString:)()
{
  return MEMORY[0x270F9D7C0]();
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t String.subscript.getter()
{
  return MEMORY[0x270F9D8B0]();
}

{
  return MEMORY[0x270F9D8F0]();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t Array.description.getter()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t dispatch thunk of Actor.unownedExecutor.getter()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t CheckedContinuation.resume(throwing:)()
{
  return MEMORY[0x270FA1E18]();
}

uint64_t CheckedContinuation.resume(returning:)()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t type metadata accessor for CheckedContinuation()
{
  return MEMORY[0x270FA1E28]();
}

uint64_t TaskPriority.rawValue.getter()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t type metadata accessor for TaskPriority()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t static Task<>.currentPriority.getter()
{
  return MEMORY[0x270FA1FE0]();
}

uint64_t dispatch thunk of AsyncSequence.makeAsyncIterator()()
{
  return MEMORY[0x270FA2080]();
}

uint64_t AsyncThrowingStream.Continuation.yield(_:)()
{
  return MEMORY[0x270FA20D8]();
}

uint64_t AsyncThrowingStream.Continuation.finish(throwing:)()
{
  return MEMORY[0x270FA20E0]();
}

uint64_t type metadata accessor for AsyncThrowingStream.Continuation()
{
  return MEMORY[0x270FA20E8]();
}

uint64_t AsyncThrowingStream.makeAsyncIterator()()
{
  return MEMORY[0x270FA20F0]();
}

uint64_t AsyncThrowingStream.init<>(_:bufferingPolicy:_:)()
{
  return MEMORY[0x270FA2120]();
}

uint64_t static os_log_type_t.debug.getter()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t static os_log_type_t.error.getter()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t static os_log_type_t.default.getter()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t type metadata accessor for OS_dispatch_queue.Attributes()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t type metadata accessor for Optional()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return MEMORY[0x270F9E530]();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return MEMORY[0x270F9E560]();
}

uint64_t StringProtocol.cString(using:)()
{
  return MEMORY[0x270EF2578]();
}

uint64_t dispatch thunk of SetAlgebra.init<A>(_:)()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t _HashTable.occupiedBucket(after:)()
{
  return MEMORY[0x270F9E7F8]();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t _print_unlocked<A, B>(_:_:)()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t AsyncMapSequence.base.getter()
{
  return MEMORY[0x270FA2210]();
}

uint64_t AsyncMapSequence.Iterator.baseIterator.modify()
{
  return MEMORY[0x270FA2218]();
}

uint64_t AsyncMapSequence.Iterator.transform.getter()
{
  return MEMORY[0x270FA2220]();
}

uint64_t AsyncMapSequence.Iterator.init(_:transform:)()
{
  return MEMORY[0x270FA2228]();
}

uint64_t AsyncMapSequence.transform.getter()
{
  return MEMORY[0x270FA2230]();
}

uint64_t AsyncMapSequence.init(_:transform:)()
{
  return MEMORY[0x270FA2240]();
}

Swift::Bool __swiftcall _NativeDictionary.ensureUnique(isUnique:capacity:)(Swift::Bool isUnique, Swift::Int capacity)
{
  return MEMORY[0x270F9EF08](isUnique, capacity);
}

Swift::Void __swiftcall _NativeDictionary.copy()()
{
}

uint64_t _NativeDictionary._delete(at:)()
{
  return MEMORY[0x270F9EF20]();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return MEMORY[0x270F9EFE8]();
}

{
  return MEMORY[0x270F9EFF0]();
}

uint64_t static _DictionaryStorage.resize(original:capacity:move:)()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t Error.localizedDescription.getter()
{
  return MEMORY[0x270EF2680]();
}

uint64_t Error._getEmbeddedNSError()()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t Error._code.getter()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t Error._domain.getter()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t Error._userInfo.getter()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t static Hasher._hash(seed:_:)()
{
  return MEMORY[0x270F9FC40]();
}

uint64_t Hasher.init(_seed:)()
{
  return MEMORY[0x270F9FC48]();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return MEMORY[0x270F9FC90]();
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x270EE47C8](allocator, bytes, length);
}

uint64_t MMCSEngineCreateWithTargetDispatchQueue()
{
  return MEMORY[0x270F49460]();
}

uint64_t MMCSGetItems()
{
  return MEMORY[0x270F49488]();
}

uint64_t MMCSPutItems()
{
  return MEMORY[0x270F494A0]();
}

uint64_t MMCSReferenceSignatureCreateWithReferenceObject()
{
  return MEMORY[0x270F494A8]();
}

uint64_t MMCSRegisterItems()
{
  return MEMORY[0x270F494B0]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
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

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t sandbox_extension_issue_file_to_process()
{
  return MEMORY[0x270EDB2C8]();
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
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

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
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

uint64_t swift_getErrorValue()
{
  return MEMORY[0x270FA0348]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
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

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x270FA04D8]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
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

uint64_t swift_unexpectedError()
{
  return MEMORY[0x270FA0588]();
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