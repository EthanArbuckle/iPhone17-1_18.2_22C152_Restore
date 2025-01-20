uint64_t sub_24080FE50@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for HealthArticlesPluginDelegate();
  result = swift_allocObject();
  *a1 = result;
  return result;
}

uint64_t type metadata accessor for HealthArticlesPluginDelegate()
{
  return self;
}

uint64_t sub_24080FEA8(uint64_t a1)
{
  v2 = (void *)sub_240815FB0();
  if (v2)
  {

    return MEMORY[0x263F8EE78];
  }
  else
  {
    sub_240810AF4(0, &qword_26AFCB418, (void (*)(uint64_t))sub_240811C6C);
    uint64_t v3 = swift_allocObject();
    *(_OWORD *)(v3 + 16) = xmmword_2408165D0;
    uint64_t v4 = sub_24080FF58(a1);
    sub_240810F68();
    *(void *)(v3 + 56) = v5;
    *(void *)(v3 + 64) = sub_240810FC4();
    *(void *)(v3 + 32) = v4;
  }
  return v3;
}

uint64_t sub_24080FF58(uint64_t a1)
{
  uint64_t v3 = *v1;
  uint64_t v4 = sub_240815FC0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  v7 = (char *)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_240816070();
  uint64_t v33 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388]();
  v10 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_240816050();
  swift_retain_n();
  v11 = sub_240816060();
  os_log_type_t v12 = sub_240816100();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = swift_slowAlloc();
    uint64_t v29 = v5;
    uint64_t v14 = v13;
    uint64_t v28 = swift_slowAlloc();
    uint64_t v34 = v28;
    uint64_t v35 = v3;
    *(_DWORD *)uint64_t v14 = 136446466;
    v32 = v7;
    swift_getMetatypeMetadata();
    uint64_t v31 = a1;
    uint64_t v15 = sub_240816090();
    uint64_t v35 = sub_2408102F0(v15, v16, &v34);
    uint64_t v30 = v4;
    sub_240816140();
    swift_bridgeObjectRelease();
    *(_WORD *)(v14 + 12) = 2082;
    uint64_t v17 = sub_24081062C();
    unint64_t v18 = sub_240810D10();
    uint64_t v19 = MEMORY[0x2455FD650](v17, v18);
    uint64_t v27 = v8;
    unint64_t v21 = v20;
    v7 = v32;
    swift_bridgeObjectRelease();
    uint64_t v22 = v19;
    a1 = v31;
    uint64_t v35 = sub_2408102F0(v22, v21, &v34);
    uint64_t v4 = v30;
    sub_240816140();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24080E000, v11, v12, "[%{public}s] Creating ArticlesGeneratorPipeline with managed articles: %%%{public}s@", (uint8_t *)v14, 0x16u);
    uint64_t v23 = v28;
    swift_arrayDestroy();
    MEMORY[0x2455FDA30](v23, -1, -1);
    uint64_t v24 = v14;
    uint64_t v5 = v29;
    MEMORY[0x2455FDA30](v24, -1, -1);

    (*(void (**)(char *, uint64_t))(v33 + 8))(v10, v27);
  }
  else
  {

    swift_release_n();
    (*(void (**)(char *, uint64_t))(v33 + 8))(v10, v8);
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  sub_24081062C();
  sub_240810F68();
  swift_allocObject();
  return sub_240816030();
}

uint64_t sub_2408102F0(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_240810470(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_240810414((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = MEMORY[0x263F8DBE0];
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_240810414((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_2408103C4((uint64_t)v12);
  return v7;
}

uint64_t sub_2408103C4(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_240810414(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_240810470(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_240816150();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_240811E74(a5, a6);
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
  uint64_t v8 = sub_2408161A0();
  if (!v8)
  {
    sub_2408161B0();
    __break(1u);
LABEL_17:
    uint64_t result = sub_2408161D0();
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

uint64_t sub_24081062C()
{
  uint64_t v0 = 0;
  uint64_t v1 = MEMORY[0x263F8EE78];
  do
  {
    char v2 = byte_26F4EC4E8[v0 + 32];
    switch(v2)
    {
      case 1:
      case 2:
      case 3:
        char v3 = sub_240816200();
        swift_bridgeObjectRelease();
        if ((v3 & 1) == 0)
        {
          *(void *)&long long v13 = v1;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            sub_240810B48(0, *(void *)(v1 + 16) + 1, 1);
            uint64_t v1 = v13;
          }
          unint64_t v5 = *(void *)(v1 + 16);
          unint64_t v4 = *(void *)(v1 + 24);
          if (v5 >= v4 >> 1)
          {
            sub_240810B48(v4 > 1, v5 + 1, 1);
            uint64_t v1 = v13;
          }
          *(void *)(v1 + 16) = v5 + 1;
          *(unsigned char *)(v1 + v5 + 32) = v2;
        }
        break;
      default:
        swift_bridgeObjectRelease();
        break;
    }
    ++v0;
  }
  while (v0 != 4);
  int64_t v6 = *(void *)(v1 + 16);
  if (v6)
  {
    uint64_t v17 = MEMORY[0x263F8EE78];
    sub_240810918(0, v6, 0);
    uint64_t v7 = 0;
    uint64_t v8 = v17;
    do
    {
      switch(*(unsigned char *)(v1 + v7 + 32))
      {
        case 1:
          uint64_t v14 = &type metadata for RespirationRateArticleDataProvider;
          unint64_t v15 = sub_240810DC4();
          unint64_t v9 = sub_240810D70();
          break;
        case 2:
          uint64_t v14 = &type metadata for BloodGlucoseArticleDataProvider;
          unint64_t v15 = sub_240810F14();
          unint64_t v9 = sub_240810EC0();
          break;
        case 3:
          uint64_t v14 = &type metadata for TimeInDaylightArticleDataProvider;
          unint64_t v15 = sub_240810E6C();
          unint64_t v9 = sub_240810E18();
          break;
        default:
          uint64_t v14 = &type metadata for ExampleArticleDataProvider;
          unint64_t v15 = sub_240812274();
          unint64_t v9 = sub_2408122C8();
          break;
      }
      unint64_t v16 = v9;
      uint64_t v17 = v8;
      unint64_t v11 = *(void *)(v8 + 16);
      unint64_t v10 = *(void *)(v8 + 24);
      if (v11 >= v10 >> 1)
      {
        sub_240810918(v10 > 1, v11 + 1, 1);
        uint64_t v8 = v17;
      }
      ++v7;
      *(void *)(v8 + 16) = v11 + 1;
      sub_240810900(&v13, (_OWORD *)(v8 + 48 * v11 + 32));
    }
    while (v6 != v7);
    swift_release();
  }
  else
  {
    swift_release();
    return MEMORY[0x263F8EE78];
  }
  return v8;
}

_OWORD *sub_240810900(long long *a1, _OWORD *a2)
{
  long long v2 = *a1;
  long long v3 = a1[2];
  a2[1] = a1[1];
  a2[2] = v3;
  *a2 = v2;
  return a2;
}

uint64_t sub_240810918(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_240810938(a1, a2, a3, (void *)*v3);
  *long long v3 = result;
  return result;
}

uint64_t sub_240810938(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_240810AF4(0, &qword_26AFCB420, (void (*)(uint64_t))sub_240810D10);
    unint64_t v10 = (void *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 48);
  }
  else
  {
    unint64_t v10 = (void *)MEMORY[0x263F8EE78];
  }
  unint64_t v12 = (unint64_t)(v10 + 4);
  unint64_t v13 = (unint64_t)(a4 + 4);
  if (a1)
  {
    if (v10 != a4 || v12 >= v13 + 48 * v8) {
      memmove(v10 + 4, a4 + 4, 48 * v8);
    }
    a4[2] = 0;
    goto LABEL_28;
  }
  if (v13 >= v12 + 48 * v8 || v12 >= v13 + 48 * v8)
  {
    sub_240810D10();
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_2408161D0();
  __break(1u);
  return result;
}

void sub_240810AF4(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_2408161F0();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t sub_240810B48(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_240810B68(a1, a2, a3, *v3);
  *long long v3 = (char *)result;
  return result;
}

uint64_t sub_240810B68(char a1, int64_t a2, char a3, char *a4)
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
    sub_240810CC8(0, &qword_26AFCB410);
    unint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    unint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  unint64_t v12 = v10 + 32;
  unint64_t v13 = a4 + 32;
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
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_2408161D0();
  __break(1u);
  return result;
}

void sub_240810CC8(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t v3 = sub_2408161F0();
    if (!v4) {
      atomic_store(v3, a2);
    }
  }
}

unint64_t sub_240810D10()
{
  unint64_t result = qword_26AFCB3E0;
  if (!qword_26AFCB3E0)
  {
    unint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_26AFCB3E0);
  }
  return result;
}

unint64_t sub_240810D70()
{
  unint64_t result = qword_26AFCB440;
  if (!qword_26AFCB440)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AFCB440);
  }
  return result;
}

unint64_t sub_240810DC4()
{
  unint64_t result = qword_26AFCB438;
  if (!qword_26AFCB438)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AFCB438);
  }
  return result;
}

unint64_t sub_240810E18()
{
  unint64_t result = qword_26AFCB3D0;
  if (!qword_26AFCB3D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AFCB3D0);
  }
  return result;
}

unint64_t sub_240810E6C()
{
  unint64_t result = qword_26AFCB3C8;
  if (!qword_26AFCB3C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AFCB3C8);
  }
  return result;
}

unint64_t sub_240810EC0()
{
  unint64_t result = qword_26AFCB500;
  if (!qword_26AFCB500)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AFCB500);
  }
  return result;
}

unint64_t sub_240810F14()
{
  unint64_t result = qword_26AFCB4F8;
  if (!qword_26AFCB4F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AFCB4F8);
  }
  return result;
}

void sub_240810F68()
{
  if (!qword_26AFCB3F0)
  {
    sub_240811CC4();
    unint64_t v0 = sub_240816040();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26AFCB3F0);
    }
  }
}

unint64_t sub_240810FC4()
{
  unint64_t result = qword_26AFCB3E8;
  if (!qword_26AFCB3E8)
  {
    sub_240810F68();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AFCB3E8);
  }
  return result;
}

ValueMetadata *type metadata accessor for RespirationRateArticleDataProvider()
{
  return &type metadata for RespirationRateArticleDataProvider;
}

unint64_t sub_240811034()
{
  return 0xD000000000000036;
}

id sub_24081105C()
{
  return sub_24081231C(0xD000000000000023, 0x8000000240816B50);
}

uint64_t sub_2408110C0()
{
  type metadata accessor for HealthArticlesPluginDelegate();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v1 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v2 = sub_240815F90();

  return v2;
}

uint64_t sub_240811188()
{
  type metadata accessor for HealthArticlesPluginDelegate();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v1 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v2 = sub_240815F90();

  return v2;
}

uint64_t sub_240811250()
{
  type metadata accessor for HealthArticlesPluginDelegate();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v1 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v2 = sub_240815F90();

  return v2;
}

uint64_t sub_240811318()
{
  sub_240811BC4();
  unint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2408164D0;
  sub_240811C20(0, &qword_26AFCB430);
  *(void *)(inited + 32) = MEMORY[0x2455FD6A0]((id)*MEMORY[0x263F09EA8]);
  sub_2408160D0();
  if (inited >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_2408161C0();
    swift_bridgeObjectRelease();
    if (v3) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v2 = MEMORY[0x263F8EE88];
    goto LABEL_6;
  }
  if (!*(void *)((inited & 0xFFFFFFFFFFFFFF8) + 0x10)) {
    goto LABEL_5;
  }
LABEL_3:
  sub_240814B78(inited);
  uint64_t v2 = v1;
LABEL_6:
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t sub_240811404()
{
  sub_240811B6C();
  uint64_t v59 = sub_240815FD0();
  uint64_t v0 = *(void *)(v59 - 8);
  unint64_t v1 = (*(unsigned __int8 *)(v0 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0 + 80);
  uint64_t v2 = *(void *)(v0 + 72);
  uint64_t v54 = swift_allocObject();
  *(_OWORD *)(v54 + 16) = xmmword_2408164E0;
  sub_240811C20(0, &qword_26AFCB3B0);
  unint64_t v3 = v54 + v1;
  *(void *)unint64_t v3 = sub_24081231C(0xD000000000000023, 0x8000000240816B50);
  *(unsigned char *)(v3 + 8) = 0;
  uint64_t v4 = *(void (**)(void))(v0 + 104);
  ((void (*)(unint64_t, void, uint64_t))v4)(v3, *MEMORY[0x263F42AB8], v59);
  uint64_t v5 = (uint64_t *)(v3 + v2);
  uint64_t v6 = v2;
  type metadata accessor for HealthArticlesPluginDelegate();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v58 = self;
  uint64_t v55 = ObjCClassFromMetadata;
  id v8 = objc_msgSend(v58, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v9 = sub_240815F90();
  uint64_t v11 = v10;

  *uint64_t v5 = v9;
  v5[1] = v11;
  ((void (*)(uint64_t *, void, uint64_t))v4)(v5, *MEMORY[0x263F42AC0], v59);
  v57 = v4;
  unint64_t v12 = (uint64_t *)(v3 + 2 * v6);
  id v13 = objc_msgSend(v58, sel_bundleForClass_, ObjCClassFromMetadata, 0xE000000000000000);
  uint64_t v14 = sub_240815F90();
  uint64_t v16 = v15;

  *unint64_t v12 = v14;
  v12[1] = v16;
  v12[2] = 0;
  unsigned int v53 = *MEMORY[0x263F42A80];
  v4(v12);
  unint64_t v17 = v3 + 3 * v6;
  id v18 = objc_msgSend(v58, sel_bundleForClass_, v55, 0xE000000000000000);
  uint64_t v19 = sub_240815F90();
  uint64_t v21 = v20;

  *(void *)unint64_t v17 = v19;
  *(void *)(v17 + 8) = v21;
  *(unsigned char *)(v17 + 16) = 0;
  unsigned int v56 = *MEMORY[0x263F42AE0];
  v57(v17);
  uint64_t v22 = (uint64_t *)(v3 + 4 * v6);
  id v23 = objc_msgSend(v58, sel_bundleForClass_, v55, 0xE000000000000000);
  uint64_t v24 = sub_240815F90();
  uint64_t v26 = v25;

  *uint64_t v22 = v24;
  v22[1] = v26;
  v22[2] = 0;
  ((void (*)(uint64_t *, void, uint64_t))v57)(v22, v53, v59);
  unint64_t v27 = v3 + 5 * v6;
  id v28 = objc_msgSend(v58, sel_bundleForClass_, v55, 0xE000000000000000);
  uint64_t v29 = sub_240815F90();
  uint64_t v31 = v30;

  *(void *)unint64_t v27 = v29;
  *(void *)(v27 + 8) = v31;
  *(unsigned char *)(v27 + 16) = 0;
  ((void (*)(unint64_t, void, uint64_t))v57)(v27, v56, v59);
  unint64_t v32 = v3 + 6 * v6;
  id v33 = objc_msgSend(v58, sel_bundleForClass_, v55, 0xE000000000000000);
  uint64_t v34 = sub_240815F90();
  uint64_t v36 = v35;

  *(void *)unint64_t v32 = v34;
  *(void *)(v32 + 8) = v36;
  *(unsigned char *)(v32 + 16) = 0;
  ((void (*)(unint64_t, void, uint64_t))v57)(v32, v56, v59);
  unint64_t v37 = v3 + 7 * v6;
  id v38 = objc_msgSend(v58, sel_bundleForClass_, v55, 0xE000000000000000);
  uint64_t v39 = sub_240815F90();
  uint64_t v41 = v40;

  *(void *)unint64_t v37 = v39;
  *(void *)(v37 + 8) = v41;
  *(unsigned char *)(v37 + 16) = 0;
  ((void (*)(unint64_t, void, uint64_t))v57)(v37, v56, v59);
  unint64_t v42 = v3 + 8 * v6;
  id v43 = objc_msgSend(v58, sel_bundleForClass_, v55, 0xE000000000000000);
  uint64_t v44 = sub_240815F90();
  uint64_t v46 = v45;

  *(void *)unint64_t v42 = v44;
  *(void *)(v42 + 8) = v46;
  *(unsigned char *)(v42 + 16) = 0;
  ((void (*)(unint64_t, void, uint64_t))v57)(v42, v56, v59);
  unint64_t v47 = v3 + 9 * v6;
  id v48 = objc_msgSend(v58, sel_bundleForClass_, v55, 0xE000000000000000);
  uint64_t v49 = sub_240815F90();
  uint64_t v51 = v50;

  *(void *)unint64_t v47 = v49;
  *(void *)(v47 + 8) = v51;
  *(unsigned char *)(v47 + 16) = 0;
  ((void (*)(unint64_t, void, uint64_t))v57)(v47, v56, v59);
  return v54;
}

void sub_240811B6C()
{
  if (!qword_268C90250)
  {
    sub_240815FD0();
    unint64_t v0 = sub_2408161F0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268C90250);
    }
  }
}

void sub_240811BC4()
{
  if (!qword_26AFCB428)
  {
    unint64_t v0 = sub_2408161F0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26AFCB428);
    }
  }
}

uint64_t sub_240811C20(uint64_t a1, unint64_t *a2)
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

uint64_t sub_240811C5C()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

unint64_t sub_240811C6C()
{
  unint64_t result = qword_26AFCB3D8;
  if (!qword_26AFCB3D8)
  {
    unint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_26AFCB3D8);
  }
  return result;
}

unint64_t sub_240811CC4()
{
  unint64_t result = qword_26AFCB3C0;
  if (!qword_26AFCB3C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AFCB3C0);
  }
  return result;
}

uint64_t sub_240811D18(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xD00000000000002ELL;
  unint64_t v3 = 0x8000000240816A60;
  uint64_t v4 = a1;
  unint64_t v5 = 0xD00000000000002ELL;
  switch(v4)
  {
    case 1:
      unint64_t v5 = 0xD000000000000036;
      uint64_t v6 = "com.apple.Health.HealthArticles.RespirationRateArticle";
      goto LABEL_5;
    case 2:
      unint64_t v5 = 0xD000000000000033;
      uint64_t v6 = "com.apple.Health.HealthArticles.BloodGlucoseArticle";
      goto LABEL_5;
    case 3:
      unint64_t v5 = 0xD000000000000035;
      uint64_t v6 = "com.apple.Health.HealthArticles.TimeInDaylightArticle";
LABEL_5:
      unint64_t v3 = (unint64_t)(v6 - 32) | 0x8000000000000000;
      break;
    default:
      break;
  }
  unint64_t v7 = 0x8000000240816A60;
  switch(a2)
  {
    case 1:
      unint64_t v2 = 0xD000000000000036;
      id v8 = "com.apple.Health.HealthArticles.RespirationRateArticle";
      goto LABEL_10;
    case 2:
      unint64_t v2 = 0xD000000000000033;
      id v8 = "com.apple.Health.HealthArticles.BloodGlucoseArticle";
      goto LABEL_10;
    case 3:
      unint64_t v2 = 0xD000000000000035;
      id v8 = "com.apple.Health.HealthArticles.TimeInDaylightArticle";
LABEL_10:
      unint64_t v7 = (unint64_t)(v8 - 32) | 0x8000000000000000;
      break;
    default:
      break;
  }
  if (v5 == v2 && v3 == v7) {
    char v9 = 1;
  }
  else {
    char v9 = sub_240816200();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v9 & 1;
}

uint64_t sub_240811E74(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_240811F0C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = (uint64_t)sub_2408120F8(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = (uint64_t)sub_2408120F8(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_240811F0C(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_240812084(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_240816180();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_2408161B0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_2408160B0();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_2408161D0();
    __break(1u);
LABEL_14:
    uint64_t result = sub_2408161B0();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_240812084(uint64_t a1, uint64_t a2)
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
  sub_240810CC8(0, &qword_268C90258);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_2408120F8(char a1, int64_t a2, char a3, char *a4)
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
    sub_240810CC8(0, &qword_268C90258);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  unint64_t v12 = v10 + 32;
  id v13 = a4 + 32;
  if ((a1 & 1) == 0)
  {
    if (v13 >= &v12[v8] || v12 >= &v13[v8])
    {
      memcpy(v12, v13, v8);
      goto LABEL_28;
    }
LABEL_30:
    sub_2408161D0();
    __break(1u);
    JUMPOUT(0x240812254);
  }
  if (v10 != a4 || v12 >= &v13[v8]) {
    memmove(v12, v13, v8);
  }
  *((void *)a4 + 2) = 0;
LABEL_28:
  swift_bridgeObjectRelease();
  return v10;
}

unint64_t sub_240812274()
{
  unint64_t result = qword_268C90260;
  if (!qword_268C90260)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C90260);
  }
  return result;
}

unint64_t sub_2408122C8()
{
  unint64_t result = qword_268C90268;
  if (!qword_268C90268)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C90268);
  }
  return result;
}

id sub_24081231C(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_240816070();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388]();
  int64_t v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26AFCB3B8 != -1) {
    swift_once();
  }
  id v10 = (id)qword_26AFCB910;
  swift_bridgeObjectRetain();
  size_t v11 = (void *)sub_240816080();
  swift_bridgeObjectRelease();
  unint64_t v12 = 0x263F82000uLL;
  id v13 = objc_msgSend(self, sel_imageNamed_inBundle_, v11, v10);

  if (!v13)
  {
    sub_240816050();
    swift_bridgeObjectRetain_n();
    uint64_t v14 = sub_240816060();
    os_log_type_t v15 = sub_2408160F0();
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v16 = swift_slowAlloc();
      uint64_t v22 = swift_slowAlloc();
      uint64_t v23 = v22;
      *(_DWORD *)uint64_t v16 = 136446466;
      uint64_t v21 = v16 + 4;
      uint64_t v24 = v3;
      swift_getMetatypeMetadata();
      uint64_t v17 = sub_240816090();
      uint64_t v24 = sub_2408102F0(v17, v18, &v23);
      sub_240816140();
      swift_bridgeObjectRelease();
      *(_WORD *)(v16 + 12) = 2082;
      swift_bridgeObjectRetain();
      uint64_t v24 = sub_2408102F0(a1, a2, &v23);
      unint64_t v12 = 0x263F82000;
      sub_240816140();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_24080E000, v14, v15, "[%{public}s] Could not find image in HealthArticles with name %{public}s", (uint8_t *)v16, 0x16u);
      uint64_t v19 = v22;
      swift_arrayDestroy();
      MEMORY[0x2455FDA30](v19, -1, -1);
      MEMORY[0x2455FDA30](v16, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    return objc_msgSend(objc_allocWithZone(*(Class *)(v12 + 2024)), sel_init);
  }
  return v13;
}

id sub_240812628()
{
  type metadata accessor for HealthArticlesPluginDelegate();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id result = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  qword_26AFCB910 = (uint64_t)result;
  return result;
}

unint64_t sub_240812680(char a1)
{
  unint64_t result = 0xD00000000000002ELL;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000036;
      break;
    case 2:
      unint64_t result = 0xD000000000000033;
      break;
    case 3:
      unint64_t result = 0xD000000000000035;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_240812708(unsigned __int8 *a1, char *a2)
{
  return sub_240811D18(*a1, *a2);
}

uint64_t sub_240812714()
{
  return sub_24081271C();
}

uint64_t sub_24081271C()
{
  return sub_240816220();
}

uint64_t sub_2408127F8()
{
  return sub_240812800();
}

uint64_t sub_240812800()
{
  sub_2408160A0();

  return swift_bridgeObjectRelease();
}

uint64_t sub_2408128BC()
{
  return sub_2408128C4();
}

uint64_t sub_2408128C4()
{
  return sub_240816220();
}

uint64_t sub_24081299C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_240812CCC();
  *a1 = result;
  return result;
}

unint64_t sub_2408129CC@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_240812680(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unsigned char *initializeBufferWithCopyOfBuffer for HealthArticlesIdentifiers(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for HealthArticlesIdentifiers(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFD) {
    goto LABEL_17;
  }
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
    if (v4) {
      return (*a1 | (v4 << 8)) - 3;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 3;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 3;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 4;
  int v8 = v6 - 4;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for HealthArticlesIdentifiers(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x240812B64);
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

uint64_t sub_240812B8C(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_240812B98(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for HealthArticlesIdentifiers()
{
  return &type metadata for HealthArticlesIdentifiers;
}

unint64_t sub_240812BB4()
{
  unint64_t result = qword_268C90270;
  if (!qword_268C90270)
  {
    sub_240812C0C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C90270);
  }
  return result;
}

void sub_240812C0C()
{
  if (!qword_268C90278)
  {
    unint64_t v0 = sub_2408160E0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268C90278);
    }
  }
}

void sub_240812C64(void *a1@<X8>)
{
  *a1 = &unk_26F4EC590;
}

unint64_t sub_240812C78()
{
  unint64_t result = qword_268C90280;
  if (!qword_268C90280)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C90280);
  }
  return result;
}

uint64_t sub_240812CCC()
{
  unint64_t v0 = sub_2408161E0();
  swift_bridgeObjectRelease();
  if (v0 >= 4) {
    return 4;
  }
  else {
    return v0;
  }
}

ValueMetadata *type metadata accessor for HealthArticlesTileDataController()
{
  return &type metadata for HealthArticlesTileDataController;
}

double sub_240812D28@<D0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_240816070();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388]();
  int64_t v9 = (char *)v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_bridgeObjectRetain();
  switch(sub_240812CCC())
  {
    case 1u:
      *(void *)(a3 + 24) = &type metadata for RespirationRateArticleDataProvider;
      *(void *)(a3 + 32) = sub_240810DC4();
      *(void *)(a3 + 40) = sub_240810D70();
      break;
    case 2u:
      *(void *)(a3 + 24) = &type metadata for BloodGlucoseArticleDataProvider;
      *(void *)(a3 + 32) = sub_240810F14();
      *(void *)(a3 + 40) = sub_240810EC0();
      break;
    case 3u:
      *(void *)(a3 + 24) = &type metadata for TimeInDaylightArticleDataProvider;
      *(void *)(a3 + 32) = sub_240810E6C();
      *(void *)(a3 + 40) = sub_240810E18();
      break;
    case 4u:
      sub_240816050();
      swift_bridgeObjectRetain_n();
      size_t v11 = sub_240816060();
      os_log_type_t v12 = sub_2408160F0();
      int v13 = v12;
      if (os_log_type_enabled(v11, v12))
      {
        uint64_t v14 = swift_slowAlloc();
        int v21 = v13;
        uint64_t v15 = v14;
        uint64_t v16 = swift_slowAlloc();
        uint64_t v22 = v16;
        *(_DWORD *)uint64_t v15 = 136446466;
        v20[1] = v15 + 4;
        uint64_t v23 = &type metadata for HealthArticlesTileDataController;
        uint64_t v24 = v16;
        sub_24081306C();
        uint64_t v17 = sub_240816090();
        uint64_t v23 = (ValueMetadata *)sub_2408102F0(v17, v18, &v24);
        sub_240816140();
        swift_bridgeObjectRelease();
        *(_WORD *)(v15 + 12) = 2082;
        swift_bridgeObjectRetain();
        uint64_t v23 = (ValueMetadata *)sub_2408102F0(a1, a2, &v24);
        sub_240816140();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_24080E000, v11, (os_log_type_t)v21, "[%{public}s] Article identifier %{public}s could not be found in HealthArticles plugin", (uint8_t *)v15, 0x16u);
        uint64_t v19 = v22;
        swift_arrayDestroy();
        MEMORY[0x2455FDA30](v19, -1, -1);
        MEMORY[0x2455FDA30](v15, -1, -1);
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
      double result = 0.0;
      *(_OWORD *)(a3 + 16) = 0u;
      *(_OWORD *)(a3 + 32) = 0u;
      *(_OWORD *)a3 = 0u;
      break;
    default:
      *(void *)(a3 + 24) = &type metadata for ExampleArticleDataProvider;
      *(void *)(a3 + 32) = sub_240812274();
      *(void *)(a3 + 40) = sub_2408122C8();
      break;
  }
  return result;
}

unint64_t sub_24081306C()
{
  unint64_t result = qword_268C90288;
  if (!qword_268C90288)
  {
    unint64_t result = swift_getMetatypeMetadata();
    atomic_store(result, (unint64_t *)&qword_268C90288);
  }
  return result;
}

ValueMetadata *type metadata accessor for ExampleArticleDataProvider()
{
  return &type metadata for ExampleArticleDataProvider;
}

unint64_t sub_2408130BC()
{
  return 0xD00000000000002ELL;
}

id sub_2408130E4()
{
  return sub_24081231C(0xD00000000000001ALL, 0x8000000240817030);
}

uint64_t sub_24081313C()
{
  type metadata accessor for HealthArticlesPluginDelegate();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v1 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v2 = sub_240815F90();

  return v2;
}

uint64_t sub_240813200()
{
  type metadata accessor for HealthArticlesPluginDelegate();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v1 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v2 = sub_240815F90();

  return v2;
}

uint64_t sub_2408132CC()
{
  type metadata accessor for HealthArticlesPluginDelegate();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v1 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v2 = sub_240815F90();

  return v2;
}

id sub_240813394()
{
  sub_240811BC4();
  unint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2408164D0;
  sub_240811C20(0, &qword_26AFCB430);
  id result = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_quantityTypeForIdentifier_, *MEMORY[0x263F09EF8]);
  if (result)
  {
    *(void *)(inited + 32) = result;
    sub_2408160D0();
    if (inited >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v4 = sub_2408161C0();
      swift_bridgeObjectRelease();
      if (v4) {
        goto LABEL_4;
      }
    }
    else if (*(void *)((inited & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
LABEL_4:
      sub_240814B78(inited);
      uint64_t v3 = v2;
LABEL_7:
      swift_bridgeObjectRelease();
      return (id)v3;
    }
    uint64_t v3 = MEMORY[0x263F8EE88];
    goto LABEL_7;
  }
  __break(1u);
  return result;
}

uint64_t sub_240813494()
{
  sub_240811B6C();
  uint64_t v0 = sub_240815FD0();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = *(void *)(v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v29 = 4 * v2;
  uint64_t v30 = swift_allocObject();
  *(_OWORD *)(v30 + 16) = xmmword_2408167D0;
  unint64_t v4 = v30 + v3;
  sub_240811C20(0, &qword_26AFCB3B0);
  *(void *)unint64_t v4 = sub_24081231C(0xD00000000000001ALL, 0x8000000240817030);
  *(unsigned char *)(v4 + 8) = 0;
  uint64_t v31 = *(void (**)(unint64_t, uint64_t, uint64_t))(v1 + 104);
  uint64_t v28 = v0;
  v31(v4, *MEMORY[0x263F42AB8], v0);
  uint64_t v5 = (uint64_t *)(v4 + v2);
  type metadata accessor for HealthArticlesPluginDelegate();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v32 = self;
  id v7 = objc_msgSend(v32, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v8 = sub_240815F90();
  uint64_t v10 = v9;

  *uint64_t v5 = v8;
  v5[1] = v10;
  v31(v4 + v2, *MEMORY[0x263F42AC0], v0);
  size_t v11 = (uint64_t *)(v4 + 2 * v2);
  id v12 = objc_msgSend(v32, sel_bundleForClass_, ObjCClassFromMetadata, 0xE000000000000000);
  uint64_t v13 = sub_240815F90();
  uint64_t v15 = v14;

  uint64_t *v11 = v13;
  v11[1] = v15;
  v11[2] = 0;
  v31((unint64_t)v11, *MEMORY[0x263F42A80], v0);
  unint64_t v16 = v4 + 3 * v2;
  id v17 = objc_msgSend(v32, sel_bundleForClass_, ObjCClassFromMetadata, 0xE000000000000000);
  uint64_t v18 = sub_240815F90();
  uint64_t v20 = v19;

  *(void *)unint64_t v16 = v18;
  *(void *)(v16 + 8) = v20;
  *(unsigned char *)(v16 + 16) = 0;
  uint64_t v21 = *MEMORY[0x263F42AE0];
  v31(v16, v21, v0);
  unint64_t v22 = v4 + v29;
  id v23 = objc_msgSend(v32, sel_bundleForClass_, ObjCClassFromMetadata, 0xE000000000000000);
  uint64_t v24 = sub_240815F90();
  uint64_t v26 = v25;

  *(void *)unint64_t v22 = v24;
  *(void *)(v22 + 8) = v26;
  *(unsigned char *)(v22 + 16) = 0;
  v31(v22, v21, v28);
  return v30;
}

ValueMetadata *type metadata accessor for BloodGlucoseArticleDataProvider()
{
  return &type metadata for BloodGlucoseArticleDataProvider;
}

unint64_t sub_2408138B4()
{
  return 0xD000000000000033;
}

id sub_2408138DC()
{
  return sub_24081231C(0xD00000000000001ALL, 0x80000002408170D0);
}

uint64_t sub_240813934()
{
  type metadata accessor for HealthArticlesPluginDelegate();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v1 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v2 = sub_240815F90();

  return v2;
}

uint64_t sub_2408139FC()
{
  type metadata accessor for HealthArticlesPluginDelegate();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v1 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v2 = sub_240815F90();

  return v2;
}

uint64_t sub_240813AC4()
{
  type metadata accessor for HealthArticlesPluginDelegate();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v1 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v2 = sub_240815F90();

  return v2;
}

uint64_t sub_240813B8C()
{
  sub_240811BC4();
  unint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2408164D0;
  sub_240811C20(0, &qword_26AFCB430);
  *(void *)(inited + 32) = MEMORY[0x2455FD6A0]((id)*MEMORY[0x263F09C18]);
  sub_2408160D0();
  if (inited >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_2408161C0();
    swift_bridgeObjectRelease();
    if (v3) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v2 = MEMORY[0x263F8EE88];
    goto LABEL_6;
  }
  if (!*(void *)((inited & 0xFFFFFFFFFFFFFF8) + 0x10)) {
    goto LABEL_5;
  }
LABEL_3:
  sub_240814B78(inited);
  uint64_t v2 = v1;
LABEL_6:
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t sub_240813C78()
{
  sub_240811B6C();
  uint64_t v0 = sub_240815FD0();
  uint64_t v1 = *(void *)(v0 - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = *(void *)(v1 + 72);
  uint64_t v111 = swift_allocObject();
  *(_OWORD *)(v111 + 16) = xmmword_2408168A0;
  unint64_t v4 = v111 + v2;
  sub_240811C20(0, &qword_26AFCB3B0);
  *(void *)unint64_t v4 = sub_24081231C(0xD00000000000001ALL, 0x80000002408170D0);
  *(unsigned char *)(v4 + 8) = 0;
  uint64_t v5 = *(void (**)(void))(v1 + 104);
  unint64_t v116 = v4;
  ((void (*)(unint64_t, void, uint64_t))v5)(v4, *MEMORY[0x263F42AB8], v0);
  uint64_t v6 = (uint64_t *)(v4 + v3);
  uint64_t v7 = v3;
  uint64_t v117 = v3;
  type metadata accessor for HealthArticlesPluginDelegate();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  uint64_t v9 = self;
  id v10 = objc_msgSend(v9, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v11 = sub_240815F90();
  uint64_t v13 = v12;

  *uint64_t v6 = v11;
  v6[1] = v13;
  uint64_t v115 = v0;
  ((void (*)(uint64_t *, void, uint64_t))v5)(v6, *MEMORY[0x263F42AC0], v0);
  uint64_t v14 = (uint64_t *)(v116 + 2 * v7);
  uint64_t v15 = ObjCClassFromMetadata;
  uint64_t v113 = ObjCClassFromMetadata;
  id v16 = objc_msgSend(v9, sel_bundleForClass_, ObjCClassFromMetadata, 0xE000000000000000);
  uint64_t v17 = sub_240815F90();
  uint64_t v19 = v18;

  *uint64_t v14 = v17;
  v14[1] = v19;
  v14[2] = 0;
  unsigned int v112 = *MEMORY[0x263F42A80];
  v5(v14);
  unint64_t v20 = v116 + 2 * v7 + v117;
  id v21 = objc_msgSend(v9, sel_bundleForClass_, v15, 0xE000000000000000);
  uint64_t v22 = sub_240815F90();
  uint64_t v24 = v23;

  *(void *)unint64_t v20 = v22;
  *(void *)(v20 + 8) = v24;
  *(unsigned char *)(v20 + 16) = 0;
  unsigned int v114 = *MEMORY[0x263F42AE0];
  v5(v20);
  unint64_t v25 = v116 + 4 * v117;
  id v26 = objc_msgSend(v9, sel_bundleForClass_, v113, 0xE000000000000000);
  uint64_t v27 = sub_240815F90();
  uint64_t v29 = v28;

  *(void *)unint64_t v25 = v27;
  *(void *)(v25 + 8) = v29;
  *(unsigned char *)(v25 + 16) = 0;
  ((void (*)(unint64_t, void, uint64_t))v5)(v25, v114, v0);
  unint64_t v30 = v116 + 5 * v117;
  id v31 = objc_msgSend(v9, sel_bundleForClass_, v113, 0xE000000000000000);
  uint64_t v32 = sub_240815F90();
  uint64_t v34 = v33;

  *(void *)unint64_t v30 = v32;
  *(void *)(v30 + 8) = v34;
  *(unsigned char *)(v30 + 16) = 0;
  ((void (*)(unint64_t, void, uint64_t))v5)(v30, v114, v0);
  uint64_t v35 = (uint64_t *)(v116 + 6 * v117);
  id v36 = objc_msgSend(v9, sel_bundleForClass_, v113, 0xE000000000000000);
  uint64_t v37 = sub_240815F90();
  uint64_t v39 = v38;

  *uint64_t v35 = v37;
  v35[1] = v39;
  v35[2] = 0;
  ((void (*)(uint64_t *, void, uint64_t))v5)(v35, v112, v0);
  unint64_t v40 = v116 + 7 * v117;
  id v41 = objc_msgSend(v9, sel_bundleForClass_, v113, 0xE000000000000000);
  uint64_t v42 = sub_240815F90();
  uint64_t v44 = v43;

  *(void *)unint64_t v40 = v42;
  *(void *)(v40 + 8) = v44;
  *(unsigned char *)(v40 + 16) = 0;
  ((void (*)(unint64_t, void, uint64_t))v5)(v40, v114, v0);
  unint64_t v45 = v116 + 8 * v117;
  id v46 = objc_msgSend(v9, sel_bundleForClass_, v113, 0xE000000000000000);
  uint64_t v47 = sub_240815F90();
  uint64_t v49 = v48;

  *(void *)unint64_t v45 = v47;
  *(void *)(v45 + 8) = v49;
  *(unsigned char *)(v45 + 16) = 0;
  ((void (*)(unint64_t, void, uint64_t))v5)(v45, v114, v0);
  uint64_t v50 = (uint64_t *)(v116 + 9 * v117);
  id v51 = objc_msgSend(v9, sel_bundleForClass_, v113, 0xE000000000000000);
  uint64_t v52 = sub_240815F90();
  uint64_t v54 = v53;

  *uint64_t v50 = v52;
  v50[1] = v54;
  v50[2] = 0;
  ((void (*)(uint64_t *, void, uint64_t))v5)(v50, v112, v0);
  unint64_t v55 = v116 + 10 * v117;
  id v56 = objc_msgSend(v9, sel_bundleForClass_, v113, 0xE000000000000000);
  uint64_t v57 = sub_240815F90();
  uint64_t v59 = v58;

  *(void *)unint64_t v55 = v57;
  *(void *)(v55 + 8) = v59;
  *(unsigned char *)(v55 + 16) = 0;
  ((void (*)(unint64_t, void, uint64_t))v5)(v55, v114, v0);
  unint64_t v60 = v116 + 11 * v117;
  id v61 = objc_msgSend(v9, sel_bundleForClass_, v113, 0xE000000000000000);
  uint64_t v62 = sub_240815F90();
  uint64_t v64 = v63;

  *(void *)unint64_t v60 = v62;
  *(void *)(v60 + 8) = v64;
  *(unsigned char *)(v60 + 16) = 0;
  ((void (*)(unint64_t, void, uint64_t))v5)(v60, v114, v0);
  unint64_t v65 = v116 + 12 * v117;
  id v66 = objc_msgSend(v9, sel_bundleForClass_, v113, 0xE000000000000000);
  uint64_t v67 = sub_240815F90();
  uint64_t v69 = v68;

  *(void *)unint64_t v65 = v67;
  *(void *)(v65 + 8) = v69;
  *(unsigned char *)(v65 + 16) = 0;
  ((void (*)(unint64_t, void, uint64_t))v5)(v65, v114, v0);
  unint64_t v70 = v116 + 13 * v117;
  id v71 = objc_msgSend(v9, sel_bundleForClass_, v113, 0xE000000000000000);
  uint64_t v72 = sub_240815F90();
  uint64_t v74 = v73;

  *(void *)unint64_t v70 = v72;
  *(void *)(v70 + 8) = v74;
  *(unsigned char *)(v70 + 16) = 0;
  ((void (*)(unint64_t, void, uint64_t))v5)(v70, v114, v0);
  unint64_t v75 = v116 + 14 * v117;
  id v76 = objc_msgSend(v9, sel_bundleForClass_, v113, 0xE000000000000000);
  uint64_t v77 = sub_240815F90();
  uint64_t v79 = v78;

  *(void *)unint64_t v75 = v77;
  *(void *)(v75 + 8) = v79;
  *(unsigned char *)(v75 + 16) = 0;
  ((void (*)(unint64_t, void, uint64_t))v5)(v75, v114, v0);
  unint64_t v80 = v116 + 15 * v117;
  id v81 = objc_msgSend(v9, sel_bundleForClass_, v113, 0xE000000000000000);
  uint64_t v82 = sub_240815F90();
  uint64_t v84 = v83;

  *(void *)unint64_t v80 = v82;
  *(void *)(v80 + 8) = v84;
  *(unsigned char *)(v80 + 16) = 0;
  ((void (*)(unint64_t, void, uint64_t))v5)(v80, v114, v0);
  v85 = (uint64_t *)(v116 + 16 * v117);
  id v86 = objc_msgSend(v9, sel_bundleForClass_, v113, 0xE000000000000000);
  uint64_t v87 = sub_240815F90();
  uint64_t v89 = v88;

  uint64_t *v85 = v87;
  v85[1] = v89;
  v85[2] = 0;
  ((void (*)(uint64_t *, void, uint64_t))v5)(v85, v112, v0);
  unint64_t v90 = v116 + 17 * v117;
  id v91 = objc_msgSend(v9, sel_bundleForClass_, v113, 0xE000000000000000);
  uint64_t v92 = sub_240815F90();
  uint64_t v94 = v93;

  *(void *)unint64_t v90 = v92;
  *(void *)(v90 + 8) = v94;
  *(unsigned char *)(v90 + 16) = 0;
  ((void (*)(unint64_t, void, uint64_t))v5)(v90, v114, v0);
  unint64_t v95 = v116 + 18 * v117;
  id v96 = objc_msgSend(v9, sel_bundleForClass_, v113, 0xE000000000000000);
  uint64_t v97 = sub_240815F90();
  uint64_t v99 = v98;

  *(void *)unint64_t v95 = v97;
  *(void *)(v95 + 8) = v99;
  *(unsigned char *)(v95 + 16) = 0;
  ((void (*)(unint64_t, void, uint64_t))v5)(v95, v114, v0);
  unint64_t v100 = v116 + 19 * v117;
  id v101 = objc_msgSend(v9, sel_bundleForClass_, v113, 0xE000000000000000);
  uint64_t v102 = sub_240815F90();
  uint64_t v104 = v103;

  *(void *)unint64_t v100 = v102;
  *(void *)(v100 + 8) = v104;
  *(unsigned char *)(v100 + 16) = 0;
  ((void (*)(unint64_t, void, uint64_t))v5)(v100, v114, v0);
  unint64_t v105 = v116 + 20 * v117;
  id v106 = objc_msgSend(v9, sel_bundleForClass_, v113, 0xE000000000000000);
  uint64_t v107 = sub_240815F90();
  uint64_t v109 = v108;

  *(void *)unint64_t v105 = v107;
  *(void *)(v105 + 8) = v109;
  *(unsigned char *)(v105 + 16) = 0;
  ((void (*)(unint64_t, void, uint64_t))v5)(v105, v114, v115);
  return v111;
}

ValueMetadata *type metadata accessor for TimeInDaylightArticleDataProvider()
{
  return &type metadata for TimeInDaylightArticleDataProvider;
}

unint64_t sub_240814AF8()
{
  return 0xD000000000000035;
}

id sub_240814B20()
{
  return sub_24081231C(0xD000000000000023, 0x80000002408174D0);
}

void sub_240814B78(unint64_t a1)
{
  unint64_t v1 = a1;
  unint64_t v2 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_2408161C0();
    swift_bridgeObjectRelease();
    if (v6)
    {
LABEL_3:
      sub_240815E90();
      uint64_t v3 = sub_240816160();
      uint64_t v4 = v1 & 0xFFFFFFFFFFFFFF8;
      if (!v2) {
        goto LABEL_4;
      }
LABEL_8:
      swift_bridgeObjectRetain();
      uint64_t v5 = sub_2408161C0();
      swift_bridgeObjectRelease();
      if (!v5) {
        return;
      }
      goto LABEL_9;
    }
  }
  else if (*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    goto LABEL_3;
  }
  uint64_t v3 = MEMORY[0x263F8EE88];
  uint64_t v4 = v1 & 0xFFFFFFFFFFFFFF8;
  if (v2) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v5 = *(void *)(v4 + 16);
  if (!v5) {
    return;
  }
LABEL_9:
  uint64_t v7 = v3 + 56;
  uint64_t v43 = v5;
  if ((v1 & 0xC000000000000001) != 0)
  {
    uint64_t v8 = 0;
    unint64_t v41 = v1;
    while (1)
    {
      while (1)
      {
        uint64_t v9 = MEMORY[0x2455FD720](v8, v1);
        BOOL v10 = __OFADD__(v8++, 1);
        if (v10)
        {
          __break(1u);
          goto LABEL_36;
        }
        uint64_t v11 = v9;
        uint64_t v12 = sub_240816120();
        uint64_t v13 = -1 << *(unsigned char *)(v3 + 32);
        unint64_t v14 = v12 & ~v13;
        unint64_t v15 = v14 >> 6;
        uint64_t v16 = *(void *)(v7 + 8 * (v14 >> 6));
        uint64_t v17 = 1 << v14;
        if (((1 << v14) & v16) != 0) {
          break;
        }
LABEL_20:
        *(void *)(v7 + 8 * v15) = v17 | v16;
        *(void *)(*(void *)(v3 + 48) + 8 * v14) = v11;
        uint64_t v23 = *(void *)(v3 + 16);
        BOOL v10 = __OFADD__(v23, 1);
        uint64_t v24 = v23 + 1;
        if (v10) {
          goto LABEL_37;
        }
        *(void *)(v3 + 16) = v24;
        if (v8 == v5) {
          return;
        }
      }
      sub_240811C20(0, &qword_26AFCB3F8);
      id v18 = *(id *)(*(void *)(v3 + 48) + 8 * v14);
      char v19 = sub_240816130();

      if ((v19 & 1) == 0)
      {
        uint64_t v20 = ~v13;
        while (1)
        {
          unint64_t v14 = (v14 + 1) & v20;
          unint64_t v15 = v14 >> 6;
          uint64_t v16 = *(void *)(v7 + 8 * (v14 >> 6));
          uint64_t v17 = 1 << v14;
          if ((v16 & (1 << v14)) == 0) {
            break;
          }
          id v21 = *(id *)(*(void *)(v3 + 48) + 8 * v14);
          char v22 = sub_240816130();

          if (v22) {
            goto LABEL_11;
          }
        }
        unint64_t v1 = v41;
        uint64_t v5 = v43;
        goto LABEL_20;
      }
LABEL_11:
      swift_unknownObjectRelease();
      unint64_t v1 = v41;
      uint64_t v5 = v43;
      if (v8 == v43) {
        return;
      }
    }
  }
  uint64_t v25 = 0;
  unint64_t v40 = v1 + 32;
  uint64_t v42 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (v25 != v42)
  {
    id v26 = *(id *)(v40 + 8 * v25);
    uint64_t v27 = sub_240816120();
    uint64_t v28 = -1 << *(unsigned char *)(v3 + 32);
    unint64_t v29 = v27 & ~v28;
    unint64_t v30 = v29 >> 6;
    uint64_t v31 = *(void *)(v7 + 8 * (v29 >> 6));
    uint64_t v32 = 1 << v29;
    if (((1 << v29) & v31) != 0)
    {
      sub_240811C20(0, &qword_26AFCB3F8);
      id v33 = *(id *)(*(void *)(v3 + 48) + 8 * v29);
      char v34 = sub_240816130();

      if (v34)
      {
LABEL_24:

        goto LABEL_25;
      }
      uint64_t v35 = ~v28;
      while (1)
      {
        unint64_t v29 = (v29 + 1) & v35;
        unint64_t v30 = v29 >> 6;
        uint64_t v31 = *(void *)(v7 + 8 * (v29 >> 6));
        uint64_t v32 = 1 << v29;
        if ((v31 & (1 << v29)) == 0) {
          break;
        }
        id v36 = *(id *)(*(void *)(v3 + 48) + 8 * v29);
        char v37 = sub_240816130();

        if (v37) {
          goto LABEL_24;
        }
      }
    }
    *(void *)(v7 + 8 * v30) = v32 | v31;
    *(void *)(*(void *)(v3 + 48) + 8 * v29) = v26;
    uint64_t v38 = *(void *)(v3 + 16);
    BOOL v10 = __OFADD__(v38, 1);
    uint64_t v39 = v38 + 1;
    if (v10) {
      goto LABEL_38;
    }
    *(void *)(v3 + 16) = v39;
LABEL_25:
    if (++v25 == v43) {
      return;
    }
  }
LABEL_36:
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
}

uint64_t sub_240814ED0()
{
  type metadata accessor for HealthArticlesPluginDelegate();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v1 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v2 = sub_240815F90();

  return v2;
}

uint64_t sub_240814F98()
{
  type metadata accessor for HealthArticlesPluginDelegate();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v1 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v2 = sub_240815F90();

  return v2;
}

uint64_t sub_240815060()
{
  type metadata accessor for HealthArticlesPluginDelegate();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v1 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v2 = sub_240815F90();

  return v2;
}

id sub_240815128()
{
  sub_240811BC4();
  unint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2408164D0;
  sub_240811C20(0, &qword_26AFCB430);
  id result = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_quantityTypeForIdentifier_, *MEMORY[0x263F09F08]);
  if (result)
  {
    *(void *)(inited + 32) = result;
    sub_2408160D0();
    if (inited >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v4 = sub_2408161C0();
      swift_bridgeObjectRelease();
      if (v4) {
        goto LABEL_4;
      }
    }
    else if (*(void *)((inited & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
LABEL_4:
      sub_240814B78(inited);
      uint64_t v3 = v2;
LABEL_7:
      swift_bridgeObjectRelease();
      return (id)v3;
    }
    uint64_t v3 = MEMORY[0x263F8EE88];
    goto LABEL_7;
  }
  __break(1u);
  return result;
}

uint64_t sub_240815228()
{
  sub_240811B6C();
  uint64_t v0 = sub_240815FD0();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = *(void *)(v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v95 = swift_allocObject();
  *(_OWORD *)(v95 + 16) = xmmword_240816980;
  unint64_t v4 = v95 + v3;
  sub_240811C20(0, &qword_26AFCB3B0);
  *(void *)unint64_t v4 = sub_24081231C(0xD000000000000023, 0x80000002408174D0);
  *(unsigned char *)(v4 + 8) = 0;
  uint64_t v5 = *(void (**)(void))(v1 + 104);
  unint64_t v101 = v4;
  ((void (*)(unint64_t, void, uint64_t))v5)(v4, *MEMORY[0x263F42AB8], v0);
  uint64_t v6 = (uint64_t *)(v4 + v2);
  type metadata accessor for HealthArticlesPluginDelegate();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v98 = self;
  id v7 = objc_msgSend(v98, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v8 = sub_240815F90();
  uint64_t v10 = v9;

  *uint64_t v6 = v8;
  v6[1] = v10;
  uint64_t v99 = v0;
  ((void (*)(unint64_t, void, uint64_t))v5)(v4 + v2, *MEMORY[0x263F42AC0], v0);
  uint64_t v11 = v2;
  uint64_t v12 = 2 * v2;
  unint64_t v13 = v4;
  unint64_t v14 = (uint64_t *)(v4 + v12);
  id v15 = objc_msgSend(v98, sel_bundleForClass_, ObjCClassFromMetadata, 0xE000000000000000);
  uint64_t v16 = sub_240815F90();
  uint64_t v18 = v17;

  *unint64_t v14 = v16;
  v14[1] = v18;
  v14[2] = 0;
  unsigned int v96 = *MEMORY[0x263F42A80];
  v5(v13 + v12);
  unint64_t v19 = v13 + v12 + v11;
  id v20 = objc_msgSend(v98, sel_bundleForClass_, ObjCClassFromMetadata, 0xE000000000000000);
  uint64_t v21 = sub_240815F90();
  uint64_t v23 = v22;

  *(void *)unint64_t v19 = v21;
  *(void *)(v19 + 8) = v23;
  *(unsigned char *)(v19 + 16) = 0;
  unsigned int v97 = *MEMORY[0x263F42AE0];
  v5(v19);
  uint64_t v24 = (uint64_t *)(v101 + 4 * v11);
  id v25 = objc_msgSend(v98, sel_bundleForClass_, ObjCClassFromMetadata, 0xE000000000000000);
  uint64_t v26 = sub_240815F90();
  uint64_t v28 = v27;

  *uint64_t v24 = v26;
  v24[1] = v28;
  v24[2] = 0;
  ((void (*)(uint64_t *, void, uint64_t))v5)(v24, v96, v0);
  unint64_t v29 = (uint64_t *)(v101 + 5 * v11);
  id v30 = objc_msgSend(v98, sel_bundleForClass_, ObjCClassFromMetadata, 0xE000000000000000);
  uint64_t v31 = sub_240815F90();
  uint64_t v33 = v32;

  *unint64_t v29 = v31;
  v29[1] = v33;
  v29[2] = 0;
  ((void (*)(uint64_t *, void, uint64_t))v5)(v29, v96, v0);
  unint64_t v34 = v101 + 6 * v11;
  id v35 = objc_msgSend(v98, sel_bundleForClass_, ObjCClassFromMetadata, 0xE000000000000000);
  uint64_t v36 = sub_240815F90();
  uint64_t v38 = v37;

  *(void *)unint64_t v34 = v36;
  *(void *)(v34 + 8) = v38;
  *(unsigned char *)(v34 + 16) = 0;
  ((void (*)(unint64_t, void, uint64_t))v5)(v34, v97, v0);
  unint64_t v39 = v101 + 7 * v11;
  id v40 = objc_msgSend(v98, sel_bundleForClass_, ObjCClassFromMetadata, 0xE000000000000000);
  uint64_t v41 = sub_240815F90();
  uint64_t v43 = v42;

  *(void *)unint64_t v39 = v41;
  *(void *)(v39 + 8) = v43;
  *(unsigned char *)(v39 + 16) = 0;
  ((void (*)(unint64_t, void, uint64_t))v5)(v39, v97, v0);
  unint64_t v44 = v101 + 8 * v11;
  id v45 = objc_msgSend(v98, sel_bundleForClass_, ObjCClassFromMetadata, 0xE000000000000000);
  uint64_t v46 = sub_240815F90();
  uint64_t v48 = v47;

  *(void *)unint64_t v44 = v46;
  *(void *)(v44 + 8) = v48;
  *(unsigned char *)(v44 + 16) = 0;
  ((void (*)(unint64_t, void, uint64_t))v5)(v44, v97, v0);
  uint64_t v49 = (uint64_t *)(v101 + 9 * v11);
  id v50 = objc_msgSend(v98, sel_bundleForClass_, ObjCClassFromMetadata, 0xE000000000000000);
  uint64_t v51 = sub_240815F90();
  uint64_t v53 = v52;

  *uint64_t v49 = v51;
  v49[1] = v53;
  v49[2] = 0;
  ((void (*)(uint64_t *, void, uint64_t))v5)(v49, v96, v0);
  unint64_t v54 = v101 + 10 * v11;
  id v55 = objc_msgSend(v98, sel_bundleForClass_, ObjCClassFromMetadata, 0xE000000000000000);
  uint64_t v56 = sub_240815F90();
  uint64_t v58 = v57;

  *(void *)unint64_t v54 = v56;
  *(void *)(v54 + 8) = v58;
  *(unsigned char *)(v54 + 16) = 0;
  ((void (*)(unint64_t, void, uint64_t))v5)(v54, v97, v0);
  unint64_t v59 = v101 + 11 * v11;
  id v60 = objc_msgSend(v98, sel_bundleForClass_, ObjCClassFromMetadata, 0xE000000000000000);
  uint64_t v61 = sub_240815F90();
  uint64_t v63 = v62;

  *(void *)unint64_t v59 = v61;
  *(void *)(v59 + 8) = v63;
  *(unsigned char *)(v59 + 16) = 0;
  ((void (*)(unint64_t, void, uint64_t))v5)(v59, v97, v0);
  uint64_t v64 = (uint64_t *)(v101 + 12 * v11);
  id v65 = objc_msgSend(v98, sel_bundleForClass_, ObjCClassFromMetadata, 0xE000000000000000);
  uint64_t v66 = sub_240815F90();
  uint64_t v68 = v67;

  *uint64_t v64 = v66;
  v64[1] = v68;
  v64[2] = 0;
  ((void (*)(uint64_t *, void, uint64_t))v5)(v64, v96, v0);
  unint64_t v69 = v101 + 13 * v11;
  id v70 = objc_msgSend(v98, sel_bundleForClass_, ObjCClassFromMetadata, 0xE000000000000000);
  uint64_t v71 = sub_240815F90();
  uint64_t v73 = v72;

  *(void *)unint64_t v69 = v71;
  *(void *)(v69 + 8) = v73;
  *(unsigned char *)(v69 + 16) = 0;
  ((void (*)(unint64_t, void, uint64_t))v5)(v69, v97, v0);
  unint64_t v74 = v101 + 14 * v11;
  id v75 = objc_msgSend(v98, sel_bundleForClass_, ObjCClassFromMetadata, 0xE000000000000000);
  uint64_t v76 = sub_240815F90();
  uint64_t v78 = v77;

  *(void *)unint64_t v74 = v76;
  *(void *)(v74 + 8) = v78;
  *(unsigned char *)(v74 + 16) = 0;
  ((void (*)(unint64_t, void, uint64_t))v5)(v74, v97, v0);
  uint64_t v79 = (uint64_t *)(v101 + 15 * v11);
  id v80 = objc_msgSend(v98, sel_bundleForClass_, ObjCClassFromMetadata, 0xE000000000000000);
  uint64_t v81 = sub_240815F90();
  uint64_t v83 = v82;

  *uint64_t v79 = v81;
  v79[1] = v83;
  v79[2] = 0;
  ((void (*)(uint64_t *, void, uint64_t))v5)(v79, v96, v0);
  unint64_t v84 = v101 + 16 * v11;
  id v85 = objc_msgSend(v98, sel_bundleForClass_, ObjCClassFromMetadata, 0xE000000000000000);
  uint64_t v86 = sub_240815F90();
  uint64_t v88 = v87;

  *(void *)unint64_t v84 = v86;
  *(void *)(v84 + 8) = v88;
  *(unsigned char *)(v84 + 16) = 0;
  ((void (*)(unint64_t, void, uint64_t))v5)(v84, v97, v0);
  unint64_t v89 = v101 + 17 * v11;
  id v90 = objc_msgSend(v98, sel_bundleForClass_, ObjCClassFromMetadata, 0xE000000000000000);
  uint64_t v91 = sub_240815F90();
  uint64_t v93 = v92;

  *(void *)unint64_t v89 = v91;
  *(void *)(v89 + 8) = v93;
  *(unsigned char *)(v89 + 16) = 0;
  ((void (*)(unint64_t, void, uint64_t))v5)(v89, v97, v99);
  return v95;
}

void sub_240815E90()
{
  if (!qword_26AFCB408)
  {
    sub_240811C20(255, &qword_26AFCB3F8);
    sub_240815F04();
    unint64_t v0 = sub_240816170();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26AFCB408);
    }
  }
}

unint64_t sub_240815F04()
{
  unint64_t result = qword_26AFCB400;
  if (!qword_26AFCB400)
  {
    sub_240811C20(255, &qword_26AFCB3F8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AFCB400);
  }
  return result;
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t sub_240815F90()
{
  return MEMORY[0x270EEEEC0]();
}

uint64_t sub_240815FA0()
{
  return MEMORY[0x270F36178]();
}

uint64_t sub_240815FB0()
{
  return MEMORY[0x270F36630]();
}

uint64_t sub_240815FC0()
{
  return MEMORY[0x270F36660]();
}

uint64_t sub_240815FD0()
{
  return MEMORY[0x270F30F18]();
}

uint64_t sub_240815FE0()
{
  return MEMORY[0x270F30F80]();
}

uint64_t sub_240815FF0()
{
  return MEMORY[0x270F30F88]();
}

uint64_t sub_240816000()
{
  return MEMORY[0x270F30F90]();
}

uint64_t sub_240816010()
{
  return MEMORY[0x270F30FB0]();
}

uint64_t sub_240816020()
{
  return MEMORY[0x270F30FB8]();
}

uint64_t sub_240816030()
{
  return MEMORY[0x270F30ED8]();
}

uint64_t sub_240816040()
{
  return MEMORY[0x270F30EF0]();
}

uint64_t sub_240816050()
{
  return MEMORY[0x270F36E90]();
}

uint64_t sub_240816060()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_240816070()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_240816080()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_240816090()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_2408160A0()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_2408160B0()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_2408160C0()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_2408160D0()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_2408160E0()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t sub_2408160F0()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_240816100()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_240816110()
{
  return MEMORY[0x270EF33F8]();
}

uint64_t sub_240816120()
{
  return MEMORY[0x270FA1170]();
}

uint64_t sub_240816130()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_240816140()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_240816150()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_240816160()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_240816170()
{
  return MEMORY[0x270F9E978]();
}

uint64_t sub_240816180()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_240816190()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_2408161A0()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_2408161B0()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_2408161C0()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_2408161D0()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_2408161E0()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_2408161F0()
{
  return MEMORY[0x270F9F4F8]();
}

uint64_t sub_240816200()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_240816210()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_240816220()
{
  return MEMORY[0x270F9FC90]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
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

uint64_t swift_getExistentialTypeMetadata()
{
  return MEMORY[0x270FA0358]();
}

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x270FA03C8]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x270FA03D0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
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

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}