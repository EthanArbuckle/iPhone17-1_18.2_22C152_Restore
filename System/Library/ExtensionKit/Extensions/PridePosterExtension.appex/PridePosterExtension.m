uint64_t _s13ConfigurationVwCP(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 sub_1000040B4(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t sub_1000040C8(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 64)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_1000040E8(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = (a2 - 1);
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
  *(unsigned char *)(result + 64) = v3;
  return result;
}

void type metadata accessor for simd_float4x4(uint64_t a1)
{
}

id sub_100004138()
{
  return [v0 drawPrimitives:3 vertexStart:0 vertexCount:3];
}

float sub_100004154(float a1)
{
  return 1.0 / tanf(a1 * 0.5);
}

__n128 sub_100004234(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u32[0] = a2[1].n128_u32[0];
  *a1 = result;
  return result;
}

uint64_t sub_100004248(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 20)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_100004268(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(_DWORD *)(result + 16) = 0;
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
  *(unsigned char *)(result + 20) = v3;
  return result;
}

void type metadata accessor for PerStripeVertexUniforms(uint64_t a1)
{
}

__n128 sub_1000042A8(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_1000042B4(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_1000042D4(uint64_t result, int a2, int a3)
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

void type metadata accessor for PrideLightsPerInstanceValues(uint64_t a1)
{
}

void sub_100004314(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_1000044E4(int a1, void *a2, void *aBlock, void *a4)
{
  v4[2] = a2;
  v4[3] = a4;
  v4[4] = _Block_copy(aBlock);
  v4[5] = sub_100006164(0, &qword_100038E30);
  uint64_t v7 = sub_100024BA8();
  v4[6] = v7;
  v12 = (uint64_t (*)(uint64_t))((char *)&dword_100038E38 + dword_100038E38);
  id v8 = a2;
  id v9 = a4;
  v10 = (void *)swift_task_alloc();
  v4[7] = v10;
  void *v10 = v4;
  v10[1] = sub_1000045FC;
  return v12(v7);
}

uint64_t sub_1000045FC()
{
  uint64_t v2 = v0;
  uint64_t v3 = *v1;
  uint64_t v4 = *(void **)(*v1 + 24);
  v5 = *(void **)(*v1 + 16);
  uint64_t v6 = *v1;
  swift_task_dealloc();

  swift_bridgeObjectRelease();
  if (v2)
  {
    uint64_t v7 = sub_100024858();
    swift_errorRelease();
    Class isa = 0;
    id v9 = (void *)v7;
  }
  else
  {
    Class isa = sub_100024CA8().super.isa;
    swift_bridgeObjectRelease();
    uint64_t v7 = 0;
    id v9 = isa;
  }
  v10 = *(void (***)(void, void, void))(v3 + 32);
  ((void (**)(void, Class, uint64_t))v10)[2](v10, isa, v7);

  _Block_release(v10);
  v11 = *(uint64_t (**)(void))(v6 + 8);
  return v11();
}

id sub_100004800()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for UpdateController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for UpdateController()
{
  return self;
}

uint64_t sub_100004858(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_10000489C()
{
  _Block_release(*(const void **)(v0 + 32));

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_1000048EC()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = (void *)v0[3];
  v5 = (void *)v0[4];
  uint64_t v4 = (void *)v0[5];
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v6;
  *uint64_t v6 = v1;
  v6[1] = sub_1000049AC;
  uint64_t v7 = (uint64_t (*)(int, void *, void *, void *))((char *)&dword_100038DF0 + dword_100038DF0);
  return v7(v2, v3, v5, v4);
}

uint64_t sub_1000049AC()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100004AA0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  *uint64_t v4 = v3;
  v4[1] = sub_1000061A4;
  return v6();
}

uint64_t sub_100004B70()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = (int *)v0[4];
  v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  void *v5 = v1;
  v5[1] = sub_1000061A4;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_100038E00 + dword_100038E00);
  return v6(v2, v3, v4);
}

uint64_t sub_100004C30(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  void *v5 = v4;
  v5[1] = sub_1000061A4;
  return v7();
}

uint64_t sub_100004D00()
{
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_100004D40(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (int *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_1000061A4;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_100038E10 + dword_100038E10);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_100004E0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100024D28();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_100024D18();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_100004FB0(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_100024D08();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_100004FB0(uint64_t a1)
{
  uint64_t v2 = sub_100004858(&qword_100038DE8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100005010(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_1000050EC;
  return v6(a1);
}

uint64_t sub_1000050EC()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_1000051E4()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000521C(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_1000049AC;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_100038E20 + dword_100038E20);
  return v6(a1, v4);
}

char *sub_1000052D4(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = *((void *)a4 + 3);
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      uint64_t v9 = *((void *)a4 + 2);
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      sub_100004858(&qword_100038E58);
      uint64_t v10 = (char *)swift_allocObject();
      size_t v11 = j__malloc_size(v10);
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 24);
      v12 = v10 + 32;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[24 * v8 + 32]) {
          memmove(v12, a4 + 32, 24 * v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
      v12 = (char *)&_swiftEmptyArrayStorage + 32;
      if (result) {
        goto LABEL_13;
      }
    }
    sub_1000053FC(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_1000053FC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 24 * a1 + 32;
    unint64_t v6 = a3 + 24 * v4;
    if (v5 >= v6 || v5 + 24 * v4 <= a3)
    {
      sub_100004858((uint64_t *)&unk_100038E60);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_100024F88();
  __break(1u);
  return result;
}

uint64_t sub_10000550C(void *a1, char a2)
{
  uint64_t v4 = 0x73657069727473;
  if (a2 == 1)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v5 = sub_100024FC8();
    swift_bridgeObjectRelease();
    if ((v5 & 1) == 0) {
      goto LABEL_11;
    }
  }
  id v6 = [a1 preferredTimeFontConfigurations];
  sub_100006164(0, &qword_100038E48);
  unint64_t v7 = sub_100024CB8();

  if (v7 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v8 = sub_100024F38();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v8 = *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (v8)
  {
    id v9 = [a1 preferredTimeFontConfigurations];
    uint64_t v10 = sub_100024CB8();

    if ((v10 & 0xC000000000000001) != 0)
    {
      id v11 = (id)sub_100024E68();
    }
    else
    {
      if (!*(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
        __break(1u);
LABEL_29:
        swift_once();
LABEL_14:
        uint64_t v16 = sub_100024B38();
        sub_10000612C(v16, (uint64_t)qword_100039FE0);
        v17 = sub_100024B18();
        os_log_type_t v18 = sub_100024D68();
        if (os_log_type_enabled(v17, v18))
        {
          v19 = (uint8_t *)swift_slowAlloc();
          uint64_t v21 = swift_slowAlloc();
          *(_DWORD *)v19 = 136315138;
          if (a2)
          {
            if (a2 == 1) {
              uint64_t v4 = 0x656C636974726170;
            }
            else {
              uint64_t v4 = 0x73746867696CLL;
            }
            if (a2 == 1) {
              unint64_t v20 = 0xE900000000000073;
            }
            else {
              unint64_t v20 = 0xE600000000000000;
            }
          }
          else
          {
            unint64_t v20 = 0xE700000000000000;
          }
          sub_100010B4C(v4, v20, &v21);
          sub_100024DD8();
          swift_bridgeObjectRelease();
          _os_log_impl((void *)&_mh_execute_header, v17, v18, "descriptor for “%s” does not have current schema, will be updated", v19, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();
        }

        return 0;
      }
      id v11 = *(id *)(v10 + 32);
    }
    v12 = v11;
    swift_bridgeObjectRelease();
    [v12 weight];
    double v14 = v13;

    if (v14 >= 1.0)
    {
LABEL_11:
      if (sub_1000126A0(a1)) {
        return 1;
      }
      if (qword_100038BB0 == -1) {
        goto LABEL_14;
      }
      goto LABEL_29;
    }
  }
  return 0;
}

uint64_t sub_10000588C(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_1000058AC, 0, 0);
}

void sub_1000058AC()
{
  uint64_t v51 = v0;
  unint64_t v1 = 0;
  uint64_t v2 = (char *)&_swiftEmptyArrayStorage;
  do
  {
    if (v1 >= 3)
    {
      __break(1u);
      return;
    }
    int v4 = *((unsigned __int8 *)&off_100030D98 + v1 + 32);
    unint64_t v47 = v1;
    if (*((unsigned char *)&off_100030D98 + v1 + 32) && v4 != 1)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      char v5 = sub_100024FC8();
      swift_bridgeObjectRelease();
      if ((v5 & 1) == 0)
      {
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v2 = sub_1000052D4(0, *((void *)v2 + 2) + 1, 1, v2);
        }
        unint64_t v7 = *((void *)v2 + 2);
        unint64_t v6 = *((void *)v2 + 3);
        unint64_t v8 = v7 + 1;
        if (v7 >= v6 >> 1) {
          uint64_t v2 = sub_1000052D4((char *)(v6 > 1), v7 + 1, 1, v2);
        }
        *((void *)v2 + 2) = v8;
        uint64_t v3 = &v2[24 * v7];
        v3[32] = v4;
        *((void *)v3 + 5) = 0;
        *((void *)v3 + 6) = 0;
        goto LABEL_3;
      }
    }
    for (uint64_t i = 0; i != 5; ++i)
    {
      uint64_t v10 = 8 * *((char *)&off_100030DC0 + i + 32);
      uint64_t v11 = *(void *)&aOne_1[v10];
      uint64_t v12 = *(void *)((char *)&unk_100026940 + v10);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v2 = sub_1000052D4(0, *((void *)v2 + 2) + 1, 1, v2);
      }
      unint64_t v14 = *((void *)v2 + 2);
      unint64_t v13 = *((void *)v2 + 3);
      unint64_t v8 = v14 + 1;
      if (v14 >= v13 >> 1) {
        uint64_t v2 = sub_1000052D4((char *)(v13 > 1), v14 + 1, 1, v2);
      }
      *((void *)v2 + 2) = v8;
      v15 = &v2[24 * v14];
      v15[32] = v4;
      *((void *)v15 + 5) = v11;
      *((void *)v15 + 6) = v12;
    }
LABEL_3:
    unint64_t v1 = v47 + 1;
  }
  while (v47 != 2);
  uint64_t v16 = (void **)(v2 + 48);
  uint64_t v46 = *(void *)(v44 + 16);
  uint64_t v43 = PRTimeFontIdentifierRounded;
  while (2)
  {
    int v17 = *((unsigned __int8 *)v16 - 16);
    os_log_type_t v18 = *v16;
    uint64_t v48 = (uint64_t)*(v16 - 1);
    if (*v16)
    {
      uint64_t v49 = 0;
      unint64_t v50 = 0xE000000000000000;
      if (v17)
      {
        int v19 = v17;
        if (v17 == 1)
        {
          uint64_t v20 = 0x656C636974726170;
          uint64_t v21 = (void *)0xE900000000000073;
        }
        else
        {
          uint64_t v21 = (void *)0xE600000000000000;
          uint64_t v20 = 0x73746867696CLL;
        }
      }
      else
      {
        int v19 = 0;
        uint64_t v21 = (void *)0xE700000000000000;
        uint64_t v20 = 0x73657069727473;
      }
      swift_bridgeObjectRetain_n();
      v53._countAndFlagsBits = v20;
      v53._object = v21;
      sub_100024C58(v53);
      swift_bridgeObjectRelease();
      v54._countAndFlagsBits = 45;
      v54._object = (void *)0xE100000000000000;
      sub_100024C58(v54);
      v55._countAndFlagsBits = v48;
      v55._object = v18;
      sub_100024C58(v55);
      swift_bridgeObjectRelease();
      uint64_t v22 = v49;
      unint64_t v23 = v50;
      int v17 = v19;
    }
    else if (*((unsigned char *)v16 - 16))
    {
      if (v17 == 1)
      {
        uint64_t v22 = 0x656C636974726170;
        unint64_t v23 = 0xE900000000000073;
      }
      else
      {
        unint64_t v23 = 0xE600000000000000;
        uint64_t v22 = 0x73746867696CLL;
      }
    }
    else
    {
      unint64_t v23 = 0xE700000000000000;
      uint64_t v22 = 0x73657069727473;
    }
    if (*(void *)(v46 + 16))
    {
      swift_bridgeObjectRetain();
      unint64_t v24 = sub_1000086FC(v22, v23);
      if (v25)
      {
        id v26 = *(id *)(*(void *)(v46 + 56) + 8 * v24);
        swift_bridgeObjectRelease();
        if (sub_10000550C(v26, v17))
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          id v27 = v26;
          goto LABEL_49;
        }
      }
      else
      {
        swift_bridgeObjectRelease();
      }
    }
    if (qword_100038BB0 != -1) {
      swift_once();
    }
    uint64_t v28 = sub_100024B38();
    sub_10000612C(v28, (uint64_t)qword_100039FE0);
    swift_bridgeObjectRetain_n();
    v29 = sub_100024B18();
    os_log_type_t v30 = sub_100024D68();
    if (os_log_type_enabled(v29, v30))
    {
      v45 = v16;
      uint64_t v31 = swift_slowAlloc();
      uint64_t v49 = swift_slowAlloc();
      *(_DWORD *)uint64_t v31 = 136315138;
      swift_bridgeObjectRetain();
      *(void *)(v31 + 4) = sub_100010B4C(v22, v23, &v49);
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v29, v30, "building new descriptor for “%s”", (uint8_t *)v31, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      uint64_t v16 = v45;
      swift_slowDealloc();
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    NSString v32 = sub_100024BE8();
    swift_bridgeObjectRelease();
    id v33 = [self mutableDescriptorWithIdentifier:v32];

    if (v17)
    {
      if (v17 == 1)
      {
        swift_bridgeObjectRelease();
        sub_100004858(&qword_100038E40);
        uint64_t v34 = swift_allocObject();
        *(_OWORD *)(v34 + 16) = xmmword_1000268D0;
        v35 = self;
        *(void *)(v34 + 32) = [v35 vibrantMonochromeColor];
        *(void *)(v34 + 40) = [v35 vibrantMaterialColor];
        uint64_t v49 = v34;
        sub_100024CC8();
        sub_100006164(0, &qword_100038E50);
        Class isa = sub_100024CA8().super.isa;
        swift_bridgeObjectRelease();
        [v33 setPreferredTitleColors:isa];

        uint64_t v37 = swift_allocObject();
        *(_OWORD *)(v37 + 16) = xmmword_1000268C0;
        *(void *)(v37 + 32) = [objc_allocWithZone((Class)PRTimeFontConfiguration) initWithTimeFontIdentifier:v43 weight:700.0];
        uint64_t v49 = v37;
        sub_100024CC8();
        sub_100006164(0, &qword_100038E48);
        Class v38 = sub_100024CA8().super.isa;
        swift_bridgeObjectRelease();
        [v33 setPreferredTimeFontConfigurations:v38];

        goto LABEL_46;
      }
      sub_100004858(&qword_100038E40);
      uint64_t v39 = swift_allocObject();
      *(_OWORD *)(v39 + 16) = xmmword_1000268C0;
      *(void *)(v39 + 32) = [objc_allocWithZone((Class)PRTimeFontConfiguration) initWithTimeFontIdentifier:v43 weight:600.0];
      uint64_t v49 = v39;
      sub_100024CC8();
      sub_100006164(0, &qword_100038E48);
      Class v40 = sub_100024CA8().super.isa;
      swift_bridgeObjectRelease();
      [v33 setPreferredTimeFontConfigurations:v40];

      sub_100012894(v33, v48, (uint64_t)v18);
    }
    else
    {
      swift_bridgeObjectRelease();
LABEL_46:
      sub_100012894(v33, 0, 0);
    }
    swift_bridgeObjectRelease();
    id v27 = v33;
LABEL_49:
    v41 = v27;
    sub_100024C98();
    if (*(void *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_100024CD8();
    }
    sub_100024CF8();
    v16 += 3;
    sub_100024CC8();

    if (--v8) {
      continue;
    }
    break;
  }
  swift_bridgeObjectRelease();
  v42 = *(void (**)(void *))(v44 + 8);
  v42(&_swiftEmptyArrayStorage);
}

uint64_t sub_10000612C(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_100006164(uint64_t a1, unint64_t *a2)
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

uint64_t sub_1000061A8(unsigned __int8 a1, unsigned __int8 a2)
{
  int v2 = a1;
  if (a1)
  {
    if (a1 == 1) {
      uint64_t v3 = 0x656C636974726170;
    }
    else {
      uint64_t v3 = 0x73746867696CLL;
    }
    if (v2 == 1) {
      unint64_t v4 = 0xE900000000000073;
    }
    else {
      unint64_t v4 = 0xE600000000000000;
    }
    int v5 = a2;
    if (a2)
    {
LABEL_9:
      if (v5 == 1) {
        uint64_t v6 = 0x656C636974726170;
      }
      else {
        uint64_t v6 = 0x73746867696CLL;
      }
      if (v5 == 1) {
        unint64_t v7 = 0xE900000000000073;
      }
      else {
        unint64_t v7 = 0xE600000000000000;
      }
      if (v3 != v6) {
        goto LABEL_21;
      }
      goto LABEL_19;
    }
  }
  else
  {
    unint64_t v4 = 0xE700000000000000;
    uint64_t v3 = 0x73657069727473;
    int v5 = a2;
    if (a2) {
      goto LABEL_9;
    }
  }
  unint64_t v7 = 0xE700000000000000;
  if (v3 != 0x73657069727473)
  {
LABEL_21:
    char v8 = sub_100024FC8();
    goto LABEL_22;
  }
LABEL_19:
  if (v4 != v7) {
    goto LABEL_21;
  }
  char v8 = 1;
LABEL_22:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_1000062C4(unsigned __int8 a1, char a2)
{
  uint64_t v2 = 6647407;
  unint64_t v3 = 0xE300000000000000;
  uint64_t v4 = a1;
  uint64_t v5 = 6647407;
  switch(v4)
  {
    case 1:
      uint64_t v5 = 7305076;
      break;
    case 2:
      unint64_t v3 = 0xE500000000000000;
      uint64_t v5 = 0x6565726874;
      break;
    case 3:
      unint64_t v3 = 0xE400000000000000;
      uint64_t v5 = 1920298854;
      break;
    case 4:
      unint64_t v3 = 0xE400000000000000;
      uint64_t v5 = 1702259046;
      break;
    default:
      break;
  }
  unint64_t v6 = 0xE300000000000000;
  switch(a2)
  {
    case 1:
      if (v5 == 7305076) {
        goto LABEL_13;
      }
      goto LABEL_16;
    case 2:
      unint64_t v6 = 0xE500000000000000;
      if (v5 != 0x6565726874) {
        goto LABEL_16;
      }
      goto LABEL_13;
    case 3:
      unint64_t v6 = 0xE400000000000000;
      uint64_t v2 = 1920298854;
      goto LABEL_12;
    case 4:
      unint64_t v6 = 0xE400000000000000;
      if (v5 != 1702259046) {
        goto LABEL_16;
      }
      goto LABEL_13;
    default:
LABEL_12:
      if (v5 != v2) {
        goto LABEL_16;
      }
LABEL_13:
      if (v3 == v6) {
        char v7 = 1;
      }
      else {
LABEL_16:
      }
        char v7 = sub_100024FC8();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

uint64_t sub_100006440(void *a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, float a7)
{
  *(void *)&v113.f64[0] = a6;
  v124.i64[0] = a4;
  id v116 = a3;
  v122 = a1;
  uint64_t v11 = sub_100004858((uint64_t *)&unk_100039380);
  __chkstk_darwin(v11 - 8, v12);
  unint64_t v14 = (char *)&v108 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v123 = v7;
  *(void *)&v115.f64[0] = a5;
  *(void *)(v7 + 32) = a5;
  id v15 = objc_allocWithZone((Class)MTKMeshBufferAllocator);
  v127.i64[0] = a2;
  v126.i64[0] = (uint64_t)[v15 initWithDevice:a2];
  v125.i64[0] = (uint64_t)[objc_allocWithZone((Class)MDLVertexDescriptor) init];
  sub_100004858((uint64_t *)&unk_100038F40);
  uint64_t v16 = swift_allocObject();
  *(_OWORD *)(v16 + 16) = xmmword_100026970;
  sub_100024BF8();
  id v17 = objc_allocWithZone((Class)MDLVertexAttribute);
  NSString v18 = sub_100024BE8();
  swift_bridgeObjectRelease();
  id v19 = [v17 initWithName:v18 format:786435 offset:0 bufferIndex:0];

  uint64_t v20 = sub_100006164(0, (unint64_t *)&unk_100039F30);
  *(void *)(v16 + 56) = v20;
  *(void *)(v16 + 32) = v19;
  sub_100024BF8();
  id v21 = objc_allocWithZone((Class)MDLVertexAttribute);
  NSString v22 = sub_100024BE8();
  swift_bridgeObjectRelease();
  id v23 = [v21 initWithName:v22 format:786435 offset:16 bufferIndex:0];

  *(void *)(v16 + 88) = v20;
  *(void *)(v16 + 64) = v23;
  sub_100024BF8();
  id v24 = objc_allocWithZone((Class)MDLVertexAttribute);
  NSString v25 = sub_100024BE8();
  swift_bridgeObjectRelease();
  id v26 = [v24 initWithName:v25 format:786434 offset:32 bufferIndex:0];

  *(void *)(v16 + 120) = v20;
  id v27 = v122;
  *(void *)(v16 + 96) = v26;
  sub_100006164(0, (unint64_t *)&unk_100038F50);
  uint64_t v28 = (void *)sub_100024DA8();
  v29 = (void *)v125.i64[0];
  [(id)v125.i64[0] setAttributes:v28];

  uint64_t v30 = swift_allocObject();
  *(_OWORD *)(v30 + 16) = xmmword_100026980;
  id v31 = [objc_allocWithZone((Class)MDLVertexBufferLayout) initWithStride:48];
  *(void *)(v30 + 56) = sub_100006164(0, (unint64_t *)&unk_100039F40);
  *(void *)(v30 + 32) = v31;
  NSString v32 = (void *)sub_100024DA8();
  [v29 setLayouts:v32];

  uint64_t v33 = sub_100024898();
  uint64_t v34 = *(void *)(v33 - 8);
  (*(void (**)(char *, void *, uint64_t))(v34 + 16))(v14, v27, v33);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v34 + 56))(v14, 0, 1, v33);
  LODWORD(v26) = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v34 + 48))(v14, 1, v33);
  id v35 = v29;
  id v37 = (id)v126.i64[0];
  Class v38 = 0;
  if (v26 != 1)
  {
    sub_100024878(v36);
    Class v38 = v39;
    (*(void (**)(char *, uint64_t))(v34 + 8))(v14, v33);
  }
  uint64_t v120 = v33;
  uint64_t v121 = v34;
  id v40 = [objc_allocWithZone((Class)MDLAsset) initWithURL:v38 vertexDescriptor:v35 bufferAllocator:v37];

  id v117 = v35;
  id v118 = v37;

  sub_100006164(0, (unint64_t *)&unk_100038F60);
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v119 = v40;
  id v42 = [v40 childObjectsOfClass:ObjCClassFromMetadata];
  sub_100006164(0, (unint64_t *)&unk_100039F50);
  unint64_t v43 = sub_100024CB8();

  unint64_t v44 = v123;
  v45 = (void *)v127.i64[0];
  if (v43 >> 62) {
    goto LABEL_56;
  }
  uint64_t v46 = v43 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain();
  sub_100024FD8();
  if (swift_dynamicCastMetatype() || (uint64_t v84 = *(void *)((v43 & 0xFFFFFFFFFFFFFF8) + 0x10)) == 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_6;
  }
  uint64_t v85 = v46 + 32;
  while (1)
  {
    self;
    if (!swift_dynamicCastObjCClass()) {
      break;
    }
    v85 += 8;
    if (!--v84)
    {
      swift_bridgeObjectRelease();
      v45 = (void *)v127.i64[0];
      goto LABEL_6;
    }
  }
  swift_bridgeObjectRelease();
  unint64_t v43 = v46 | 1;
  v45 = (void *)v127.i64[0];
LABEL_6:
  if (v43 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v104 = sub_100024F38();
    swift_bridgeObjectRelease();
    if (v104 != 1)
    {
LABEL_58:
      swift_bridgeObjectRelease();
      sub_100008664();
      swift_allocError();
      unsigned char *v105 = 0;
      swift_willThrow();

      swift_unknownObjectRelease();
      goto LABEL_59;
    }
  }
  else if (*(void *)((v43 & 0xFFFFFFFFFFFFFF8) + 0x10) != 1)
  {
    goto LABEL_58;
  }
  if ((v43 & 0xC000000000000001) != 0) {
    goto LABEL_63;
  }
  if (!*(void *)((v43 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    __break(1u);
    goto LABEL_65;
  }
  for (id i = *(id *)(v43 + 32); ; id i = (id)sub_100024E68())
  {
    uint64_t v48 = i;
    swift_bridgeObjectRelease();
    id v49 = objc_allocWithZone((Class)MTKMesh);
    *(void *)&v130[0] = 0;
    swift_unknownObjectRetain();
    id v50 = [v49 initWithMesh:v48 device:v45 error:v130];
    if (!v50)
    {
      id v86 = *(id *)&v130[0];
      sub_100024868();

      swift_willThrow();
      swift_unknownObjectRelease_n();
LABEL_59:
      (*(void (**)(void *, uint64_t))(v121 + 8))(v27, v120);
      goto LABEL_60;
    }
    id v51 = v50;
    id v52 = *(id *)&v130[0];

    swift_unknownObjectRelease();
    *(void *)(v44 + 16) = v51;
    id v53 = [v45 newDefaultLibrary];
    if (!v53)
    {
      sub_100008664();
      swift_allocError();
      unsigned char *v87 = 0;
      swift_willThrow();

      swift_unknownObjectRelease();
      (*(void (**)(void *, uint64_t))(v121 + 8))(v27, v120);
      goto LABEL_42;
    }
    Swift::String v54 = v53;
    int64_t v55 = 0xD000000000000010;
    id v56 = [objc_allocWithZone((Class)MTLRenderPipelineDescriptor) init];
    NSString v57 = sub_100024BE8();
    v126.i64[0] = (uint64_t)v54;
    id v58 = [v54 newFunctionWithName:v57];

    [v56 setVertexFunction:v58];
    swift_unknownObjectRelease();
    [v56 setRasterSampleCount:v124.i64[0]];
    v124.i64[0] = (uint64_t)v56;
    id v59 = [v56 colorAttachments];
    id v60 = [v59 objectAtIndexedSubscript:0];

    if (!v60)
    {
      __break(1u);
      goto LABEL_68;
    }
    id v61 = v116;
    [v60 setPixelFormat:v116];
    [v60 setBlendingEnabled:1];
    [v60 setPixelFormat:v61];
    [v60 setRgbBlendOperation:0];
    [v60 setSourceRGBBlendFactor:4];
    id v116 = v60;
    [v60 setDestinationRGBBlendFactor:5];
    v125.i64[0] = (uint64_t)[objc_allocWithZone((Class)MTLFunctionConstantValues) init];
    v62 = (void *)sub_100007734((uint64_t)&_swiftEmptyArrayStorage);
    unint64_t v44 = 0;
    id v27 = (void *)0x8000000100025B70;
LABEL_17:
    if (v44 >= 5)
    {
      __break(1u);
LABEL_55:
      __break(1u);
LABEL_56:
      swift_bridgeObjectRetain();
      uint64_t v103 = sub_100024F28();
      swift_bridgeObjectRelease_n();
      unint64_t v43 = v103;
      goto LABEL_6;
    }
    unsigned __int8 v64 = *((unsigned char *)&off_100030DE8 + v44 + 32);
    LOWORD(v129) = v64;
    uint64_t v65 = v125.i64[0];
    [(id)v125.i64[0] setConstantValue:&v129 type:37 atIndex:0];
    NSString v66 = sub_100024BE8();
    *(void *)&v130[0] = 0;
    id v67 = [(id)v126.i64[0] newFunctionWithName:v66 constantValues:v65 error:v130];

    if (!v67)
    {
      id v88 = *(id *)&v130[0];
      swift_bridgeObjectRelease();
      sub_100024868();

      goto LABEL_41;
    }
    id v68 = *(id *)&v130[0];
    uint64_t v69 = v124.i64[0];
    [(id)v124.i64[0] setFragmentFunction:v67];
    swift_unknownObjectRelease();
    *(void *)&v130[0] = 0;
    id v70 = [v45 newRenderPipelineStateWithDescriptor:v69 error:v130];
    if (!v70) {
      break;
    }
    id v71 = v70;
    id v72 = *(id *)&v130[0];
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(void *)&v130[0] = v62;
    unint64_t v75 = sub_100008774(v64);
    uint64_t v76 = v62[2];
    BOOL v77 = (v74 & 1) == 0;
    uint64_t v78 = v76 + v77;
    if (__OFADD__(v76, v77)) {
      goto LABEL_55;
    }
    v45 = v74;
    if (v62[3] >= v78)
    {
      if (isUniquelyReferenced_nonNull_native)
      {
        v62 = *(void **)&v130[0];
        if ((v74 & 1) == 0) {
          goto LABEL_27;
        }
      }
      else
      {
        sub_100009F04();
        v62 = *(void **)&v130[0];
        if ((v45 & 1) == 0) {
          goto LABEL_27;
        }
      }
LABEL_15:
      uint64_t v63 = v62[7];
      swift_unknownObjectRelease();
      *(void *)(v63 + 8 * v75) = v71;
LABEL_16:
      ++v44;
      swift_bridgeObjectRelease();
      v45 = (void *)v127.i64[0];
      if (v44 == 5)
      {
        unint64_t v44 = v123;
        *(void *)(v123 + 24) = v62;
        float64_t v129 = v113.f64[0];
        float64_t v90 = v115.f64[0];
        if ((*(void *)&v115.f64[0] & 0x8000000000000000) == 0)
        {
          if (*(void *)&v115.f64[0])
          {
            type metadata accessor for PrideLightsPerInstanceValues(0);
            swift_bridgeObjectRetain();
            uint64_t v91 = sub_100024CE8();
            float64_t v90 = v115.f64[0];
            id v27 = (void *)v91;
            *(float64_t *)(v91 + 16) = v115.f64[0];
          }
          else
          {
            swift_bridgeObjectRetain();
            id v27 = &_swiftEmptyArrayStorage;
          }
          uint64_t v128 = 0;
          *(void *)&v130[0] = v27 + 4;
          *((float64_t *)v130 + 1) = v90;
          int64_t v92 = *(void *)&v90;
          int64_t v55 = *(void *)&v90;
          float64_t v93 = v114.f64[0];
          sub_100007BF0(v130, &v128, (unint64_t *)&v129, v92);
          if (v93 == 0.0)
          {
            if (v128 <= v55)
            {
              v27[2] = v128;
              if ((unint64_t)(v55 - 0x400000000000000) >> 59 == 31)
              {
                size_t v94 = 32 * v55;
                id v95 = [v45 newBufferWithLength:32 * v55 options:0];
                if (!v95)
                {
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  sub_100008664();
                  swift_allocError();
                  unsigned char *v102 = 1;
                  swift_willThrow();

                  swift_unknownObjectRelease();
                  swift_unknownObjectRelease();

                  (*(void (**)(void *, uint64_t))(v121 + 8))(v122, v120);
                  swift_bridgeObjectRelease();
                  goto LABEL_60;
                }
                v96 = v95;
                id v97 = [(id)swift_unknownObjectRetain() contents];
                id v98 = v96;
                if ((v94 & 0x8000000000000000) == 0)
                {
                  id v99 = v98;
                  memmove(v97, v27 + 4, v94);
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  *(void *)(v44 + 40) = v99;
                  swift_unknownObjectRetain();
                  sub_10000A0A8(v130, a7);
                  float64x2_t v111 = (float64x2_t)v130[1];
                  float64x2_t v108 = (float64x2_t)v130[0];
                  float64x2_t v113 = (float64x2_t)v130[3];
                  float64x2_t v109 = (float64x2_t)v130[2];
                  float64x2_t v114 = (float64x2_t)v130[5];
                  float64x2_t v110 = (float64x2_t)v130[4];
                  float64x2_t v115 = (float64x2_t)v130[7];
                  float64x2_t v112 = (float64x2_t)v130[6];

                  swift_unknownObjectRelease();
                  swift_unknownObjectRelease();
                  swift_unknownObjectRelease();

                  float32x4_t v127 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v108), v111);
                  float32x4_t v126 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v109), v113);
                  float32x4_t v125 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v110), v114);
                  float32x4_t v124 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v112), v115);
                  (*(void (**)(void *, uint64_t))(v121 + 8))(v122, v120);
                  float32x4_t v100 = v126;
                  *(float32x4_t *)(v44 + 48) = v127;
                  *(float32x4_t *)(v44 + 64) = v100;
                  float32x4_t v101 = v124;
                  *(float32x4_t *)(v44 + 80) = v125;
                  *(float32x4_t *)(v44 + 96) = v101;
                  return v44;
                }
                goto LABEL_72;
              }
LABEL_66:
              __break(1u);
            }
LABEL_65:
            __break(1u);
            goto LABEL_66;
          }
LABEL_68:
          uint64_t v107 = v128;
          if (v128 <= v55)
          {
LABEL_73:
            v27[2] = v107;
            uint64_t result = swift_bridgeObjectRelease();
            __break(1u);
            return result;
          }
          __break(1u);
LABEL_70:
          sub_100024FF8();
          __break(1u);
        }
        sub_100024F18();
        __break(1u);
LABEL_72:
        sub_100024F88();
        __break(1u);
        goto LABEL_73;
      }
      goto LABEL_17;
    }
    sub_1000090D8(v78, isUniquelyReferenced_nonNull_native);
    unint64_t v79 = sub_100008774(v64);
    if ((v45 & 1) != (v80 & 1)) {
      goto LABEL_70;
    }
    unint64_t v75 = v79;
    v62 = *(void **)&v130[0];
    if (v45) {
      goto LABEL_15;
    }
LABEL_27:
    v62[(v75 >> 6) + 8] |= 1 << v75;
    *(unsigned char *)(v62[6] + v75) = v64;
    *(void *)(v62[7] + 8 * v75) = v71;
    uint64_t v81 = v62[2];
    BOOL v82 = __OFADD__(v81, 1);
    uint64_t v83 = v81 + 1;
    if (!v82)
    {
      v62[2] = v83;
      goto LABEL_16;
    }
    __break(1u);
LABEL_63:
    ;
  }
  id v89 = *(id *)&v130[0];
  swift_bridgeObjectRelease();
  sub_100024868();

LABEL_41:
  swift_willThrow();

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  (*(void (**)(void *, uint64_t))(v121 + 8))(v122, v120);
  unint64_t v44 = v123;
LABEL_42:

LABEL_60:
  type metadata accessor for PrideLightsTextMeshDrawer();
  swift_deallocPartialClassInstance();
  return v44;
}

unint64_t sub_100007604(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    unint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100004858(&qword_100038FA8);
  uint64_t v2 = sub_100024F78();
  unint64_t v3 = (void *)v2;
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
    sub_10000B414(v6, (uint64_t)v15);
    unint64_t result = sub_1000086B8((uint64_t)v15);
    if (v8) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v9 = v3[6] + 40 * result;
    long long v10 = v15[0];
    long long v11 = v15[1];
    *(void *)(v9 + 32) = v16;
    *(_OWORD *)uint64_t v9 = v10;
    *(_OWORD *)(v9 + 16) = v11;
    unint64_t result = (unint64_t)sub_10000B47C(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 72;
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

unint64_t sub_100007734(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100004858(&qword_100038F78);
  uint64_t v2 = (void *)sub_100024F78();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (void *)(a1 + 40);
  while (1)
  {
    unsigned __int8 v5 = *((unsigned char *)v4 - 8);
    uint64_t v6 = *v4;
    swift_unknownObjectRetain();
    unint64_t result = sub_100008774(v5);
    if (v8) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(unsigned char *)(v2[6] + result) = v5;
    *(void *)(v2[7] + 8 * result) = v6;
    uint64_t v9 = v2[2];
    BOOL v10 = __OFADD__(v9, 1);
    uint64_t v11 = v9 + 1;
    if (v10) {
      goto LABEL_11;
    }
    v2[2] = v11;
    v4 += 2;
    if (!--v3)
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

unint64_t sub_100007838(uint64_t a1)
{
  return sub_100007984(a1, (uint64_t *)&unk_100038FF0, (uint64_t (*)(id))sub_100008868);
}

unint64_t sub_100007858(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100004858(&qword_100038FE8);
  uint64_t v2 = (void *)sub_100024F78();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (void **)(a1 + 40);
  while (1)
  {
    unsigned __int8 v5 = *v4;
    id v6 = *(v4 - 1);
    id v7 = v5;
    unint64_t result = sub_100008868((uint64_t)v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v10 = 8 * result;
    *(void *)(v2[6] + v10) = v6;
    *(void *)(v2[7] + v10) = v7;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v2[2] = v13;
    v4 += 2;
    if (!--v3)
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

unint64_t sub_100007964(uint64_t a1)
{
  return sub_100007984(a1, &qword_100038FC0, (uint64_t (*)(id))sub_1000088B8);
}

unint64_t sub_100007984(uint64_t a1, uint64_t *a2, uint64_t (*a3)(id))
{
  if (!*(void *)(a1 + 16))
  {
    unsigned __int8 v5 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100004858(a2);
  unsigned __int8 v5 = (void *)sub_100024F78();
  uint64_t v6 = *(void *)(a1 + 16);
  if (!v6)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v5;
  }
  swift_retain();
  id v7 = (uint64_t *)(a1 + 40);
  while (1)
  {
    uint64_t v8 = *v7;
    id v9 = (id)*(v7 - 1);
    swift_retain();
    unint64_t result = a3(v9);
    if (v11) {
      break;
    }
    *(void *)((char *)v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v12 = 8 * result;
    *(void *)(v5[6] + v12) = v9;
    *(void *)(v5[7] + v12) = v8;
    uint64_t v13 = v5[2];
    BOOL v14 = __OFADD__(v13, 1);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_11;
    }
    v5[2] = v15;
    v7 += 2;
    if (!--v6)
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

unint64_t sub_100007A9C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100004858(&qword_100038FC8);
  uint64_t v2 = sub_100024F78();
  uint64_t v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v20 = v2 + 64;
  swift_retain();
  unsigned __int8 v5 = (uint64_t *)(a1 + 80);
  while (1)
  {
    uint64_t v6 = (void *)*(v5 - 6);
    uint64_t v7 = *(v5 - 5);
    uint64_t v9 = *(v5 - 4);
    uint64_t v8 = *(v5 - 3);
    uint64_t v10 = *(v5 - 2);
    uint64_t v11 = *(v5 - 1);
    uint64_t v12 = *v5;
    swift_bridgeObjectRetain();
    id v13 = v6;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t result = sub_1000088B8((uint64_t)v13);
    if (v15) {
      break;
    }
    *(void *)(v20 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(void *)(v3[6] + 8 * result) = v13;
    uint64_t v16 = (void *)(v3[7] + 48 * result);
    *uint64_t v16 = v7;
    v16[1] = v9;
    v16[2] = v8;
    v16[3] = v10;
    v16[4] = v11;
    v16[5] = v12;
    uint64_t v17 = v3[2];
    BOOL v18 = __OFADD__(v17, 1);
    uint64_t v19 = v17 + 1;
    if (v18) {
      goto LABEL_11;
    }
    v3[2] = v19;
    v5 += 7;
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

void sub_100007BF0(void *a1, uint64_t *a2, unint64_t *a3, int64_t a4)
{
  uint64_t v4 = a4;
  unsigned __int8 v5 = a2;
  unint64_t v6 = *a3;
  do
  {
    v6 -= 0x61C8864680B583EBLL;
    unint64_t v7 = 0x94D049BB133111EBLL
       * ((0xBF58476D1CE4E5B9 * (v6 ^ (v6 >> 30))) ^ ((0xBF58476D1CE4E5B9 * (v6 ^ (v6 >> 30))) >> 27));
    float v8 = (float)((float)(((v7 >> 31) ^ v7) & 0xFFFFFF) * 0.000000059605) + 0.0;
  }
  while (v8 == 1.0);
  *a3 = v6;
  if (a4 < 0)
  {
LABEL_31:
    __break(1u);
  }
  else
  {
    if (!a4)
    {
      sub_10000B0C0((uint64_t)a3);
      swift_release();
LABEL_29:
      uint64_t *v5 = v4;
      return;
    }
    sub_10000A630(0, a4, 0);
    uint64_t v9 = 0;
    float v10 = (float)v4;
    uint64_t v38 = v4;
    do
    {
      if (v9 == v4)
      {
        __break(1u);
        goto LABEL_31;
      }
      unint64_t v11 = *a3;
      unint64_t v12 = *a3 - 0x61C8864680B583EBLL;
      *a3 = v12;
      unint64_t v13 = 0x94D049BB133111EBLL
          * ((0xBF58476D1CE4E5B9 * (v12 ^ (v12 >> 30))) ^ ((0xBF58476D1CE4E5B9 * (v12 ^ (v12 >> 30))) >> 27));
      unint64_t v14 = 16777217 * ((v13 >> 31) ^ v13);
      if (v14 < 0xFFFF01)
      {
        unint64_t v15 = v11 + 0x3C6EF372FE94F82ALL;
        do
        {
          v12 -= 0x61C8864680B583EBLL;
          unint64_t v16 = 0x94D049BB133111EBLL
              * ((0xBF58476D1CE4E5B9 * (v15 ^ (v15 >> 30))) ^ ((0xBF58476D1CE4E5B9 * (v15 ^ (v15 >> 30))) >> 27));
          unint64_t v14 = 16777217 * ((v16 >> 31) ^ v16);
          v15 -= 0x61C8864680B583EBLL;
        }
        while (v14 < 0xFFFF01);
        *a3 = v12;
      }
      float v17 = (float)((float)((float)(v14 >> 32) * 0.000000059605) * 0.2) + 0.0;
      if (HIDWORD(v14) == 0x1000000) {
        float v17 = 0.2;
      }
      float v18 = remainderf(v8 + (float)((float)(v17 + (float)v9) / v10), 1.0);
      unint64_t v20 = *((void *)&_swiftEmptyArrayStorage + 2);
      unint64_t v19 = *((void *)&_swiftEmptyArrayStorage + 3);
      if (v20 >= v19 >> 1) {
        sub_10000A630(v19 > 1, v20 + 1, 1);
      }
      ++v9;
      *((void *)&_swiftEmptyArrayStorage + 2) = v20 + 1;
      *((float *)&_swiftEmptyArrayStorage + v20 + 8) = v18;
      uint64_t v4 = v38;
    }
    while (v9 != v38);
    sub_10000B0C0((uint64_t)a3);
    uint64_t v21 = *((void *)&_swiftEmptyArrayStorage + 2);
    if (v21 && v38 - 1 < v21)
    {
      uint64_t v22 = 0;
      id v23 = (float *)(*a1 + 28);
      float32x2_t v24 = (float32x2_t)vdup_n_s32(0x3CCCCCCDu);
      do
      {
        float v36 = 0.0;
        if (v38 != 1) {
          float v36 = (float)((float)((float)((float)v22 + (float)v22) / (float)(v38 - 1)) + -1.0) * 0.05;
        }
        float v40 = v36;
        uint64_t v25 = v22 + 1;
        sub_100008030(a3, -1.0, 1.0);
        float32x2_t v27 = v26;
        float v28 = (float)((float)sub_10000B27C(0x1000001uLL) * 0.000000059605) + 0.0;
        unsigned int v29 = sub_10000B27C(0x1000001uLL);
        if (v29 == 0x1000000) {
          float v30 = 0.7;
        }
        else {
          float v30 = (float)((float)((float)v29 * 0.000000059605) * 0.5) + 0.2;
        }
        int v31 = *((_DWORD *)&_swiftEmptyArrayStorage + v22 + 8);
        float v32 = (float)((float)sub_10000B27C(0x1000001uLL) * 0.000000059605) + 1.0;
        unint64_t v33 = *a3 - 0x61C8864680B583EBLL;
        *a3 = v33;
        unint64_t v34 = 0x94D049BB133111EBLL
            * ((0xBF58476D1CE4E5B9 * (v33 ^ (v33 >> 30))) ^ ((0xBF58476D1CE4E5B9 * (v33 ^ (v33 >> 30))) >> 27));
        *(float32x2_t *)&long long v35 = vmul_f32(v27, v24);
        *((void *)&v35 + 1) = LODWORD(v40);
        *(_OWORD *)(v23 - 7) = v35;
        *(v23 - 3) = v28;
        *(v23 - 2) = v30;
        if ((HIWORD(v34) ^ (v34 >> 17))) {
          float v32 = -v32;
        }
        *((_DWORD *)v23 - 1) = v31;
        *id v23 = v32;
        v23 += 8;
        ++v22;
      }
      while (v38 != v25);
      swift_release();
      unsigned __int8 v5 = a2;
      goto LABEL_29;
    }
  }
  __break(1u);
}

unint64_t *sub_100008030(unint64_t *result, float a2, float a3)
{
  if ((~COERCE_INT(a3 - a2) & 0x7F800000) != 0)
  {
    unint64_t v3 = *result - 0x61C8864680B583EBLL;
    unint64_t v4 = 0x94D049BB133111EBLL
       * ((0xBF58476D1CE4E5B9 * (v3 ^ (v3 >> 30))) ^ ((0xBF58476D1CE4E5B9 * (v3 ^ (v3 >> 30))) >> 27));
    if (16777217 * ((v4 >> 31) ^ v4) < 0xFFFF01)
    {
      unint64_t v5 = *result + 0x3C6EF372FE94F82ALL;
      do
      {
        v3 -= 0x61C8864680B583EBLL;
        unint64_t v6 = 0x94D049BB133111EBLL
           * ((0xBF58476D1CE4E5B9 * (v5 ^ (v5 >> 30))) ^ ((0xBF58476D1CE4E5B9 * (v5 ^ (v5 >> 30))) >> 27));
        v5 -= 0x61C8864680B583EBLL;
      }
      while (16777217 * ((v6 >> 31) ^ v6) < 0xFFFF01);
    }
    unint64_t v7 = v3 - 0x61C8864680B583EBLL;
    unint64_t v8 = 0xBF58476D1CE4E5B9 * ((v3 - 0x61C8864680B583EBLL) ^ ((v3 - 0x61C8864680B583EBLL) >> 30));
    if (16777217
       * (((0x94D049BB133111EBLL * (v8 ^ (v8 >> 27))) >> 31) ^ (321982955
                                                                            * (v8 ^ (v8 >> 27)))) < 0xFFFF01)
    {
      unint64_t v9 = v3 + 0x3C6EF372FE94F82ALL;
      do
      {
        v7 -= 0x61C8864680B583EBLL;
        unint64_t v10 = 0x94D049BB133111EBLL
            * ((0xBF58476D1CE4E5B9 * (v9 ^ (v9 >> 30))) ^ ((0xBF58476D1CE4E5B9 * (v9 ^ (v9 >> 30))) >> 27));
        v9 -= 0x61C8864680B583EBLL;
      }
      while (16777217 * ((v10 >> 31) ^ v10) < 0xFFFF01);
    }
    *unint64_t result = v7;
  }
  else
  {
    __break(1u);
  }
  return result;
}

unint64_t sub_100008198(unint64_t result, unsigned __int8 a2, uint64_t a3, float a4, float a5, float a6)
{
  unint64_t v7 = v6;
  id v42 = (id)result;
  uint64_t v8 = v6[1].i64[1];
  if (*(void *)(v8 + 16))
  {
    unint64_t result = sub_100008774(a2);
    if (v13)
    {
      uint64_t v14 = *(void *)(*(void *)(v8 + 56) + 8 * result);
      swift_unknownObjectRetain();
      [v42 setRenderPipelineState:v14];
      [v42 setCullMode:0];
      unint64_t v15 = (void *)v7[1].i64[0];
      id v16 = [v15 vertexBuffers];
      sub_100006164(0, (unint64_t *)&unk_100039F60);
      uint64_t v17 = sub_100024CB8();

      if ((v17 & 0xC000000000000001) != 0)
      {
        id v18 = (id)sub_100024E68();
      }
      else
      {
        if (!*(void *)((v17 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
          __break(1u);
          goto LABEL_16;
        }
        id v18 = *(id *)(v17 + 32);
      }
      id v16 = v18;
      swift_bridgeObjectRelease();
      objc_msgSend(v42, "setVertexBuffer:offset:atIndex:", objc_msgSend(v16, "buffer"), objc_msgSend(v16, "offset"), 0);
      swift_unknownObjectRelease();
      float32x4_t v37 = v7[3];
      float32x4_t v38 = v7[4];
      float32x4_t v39 = v7[5];
      float32x4_t v41 = v7[6];
      *(double *)v24.i64 = sub_10000B4E8(*(double *)v41.i64, *(double *)v7[5].i64, v19, v20, v21, v22, v23);
      v43[0] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v37, v24.f32[0]), v38, *(float32x2_t *)v24.f32, 1), v39, v24, 2), v41, v24, 3);
      v43[1] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v37, v25.f32[0]), v38, *(float32x2_t *)v25.f32, 1), v39, v25, 2), v41, v25, 3);
      v43[2] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v37, v26.f32[0]), v38, *(float32x2_t *)v26.f32, 1), v39, v26, 2), v41, v26, 3);
      v43[3] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v37, v27.f32[0]), v38, *(float32x2_t *)v27.f32, 1), v39, v27, 2), v41, v27, 3);
      float v44 = a4;
      float v45 = a5;
      v24.i32[0] = *(_DWORD *)(a3 + 68);
      float v46 = a6;
      __int32 v47 = v24.i32[0];
      [v42 setVertexBytes:v43 length:80 atIndex:1];
      [v42 setVertexBuffer:v7[2].i64[1] offset:0 atIndex:2];
      [v42 setFragmentBytes:v43 length:80 atIndex:0];
      id v28 = [v15 submeshes];
      sub_100006164(0, (unint64_t *)&unk_100039000);
      unint64_t v29 = sub_100024CB8();

      unint64_t v40 = v29;
      if (!(v29 >> 62))
      {
        uint64_t v30 = *(void *)((v29 & 0xFFFFFFFFFFFFFF8) + 0x10);
        if (v30)
        {
LABEL_8:
          if (v30 < 1) {
            __break(1u);
          }
          uint64_t v31 = 0;
          uint64_t v32 = v7[2].i64[0];
          id v33 = v16;
          do
          {
            if ((v40 & 0xC000000000000001) != 0) {
              id v34 = (id)sub_100024E68();
            }
            else {
              id v34 = *(id *)(v40 + 8 * v31 + 32);
            }
            long long v35 = v34;
            ++v31;
            id v36 = [v34 indexBuffer];
            objc_msgSend(v42, "drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:instanceCount:", objc_msgSend(v35, "primitiveType"), objc_msgSend(v35, "indexCount"), objc_msgSend(v35, "indexType"), objc_msgSend(v36, "buffer"), objc_msgSend(v36, "offset"), v32);

            swift_unknownObjectRelease();
            id v16 = v33;
          }
          while (v30 != v31);
        }
LABEL_17:

        swift_bridgeObjectRelease();
        return swift_unknownObjectRelease();
      }
LABEL_16:
      swift_bridgeObjectRetain();
      uint64_t v30 = sub_100024F38();
      swift_bridgeObjectRelease();
      if (v30) {
        goto LABEL_8;
      }
      goto LABEL_17;
    }
  }
  return result;
}

uint64_t sub_1000085F8()
{
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for PrideLightsTextMeshDrawer()
{
  return self;
}

unint64_t sub_100008664()
{
  unint64_t result = qword_100038F70;
  if (!qword_100038F70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100038F70);
  }
  return result;
}

unint64_t sub_1000086B8(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = sub_100024E18(*(void *)(v2 + 40));

  return sub_100008908(a1, v4);
}

unint64_t sub_1000086FC(uint64_t a1, uint64_t a2)
{
  sub_100025048();
  sub_100024C28();
  Swift::Int v4 = sub_100025068();

  return sub_1000089D0(a1, a2, v4);
}

unint64_t sub_100008774(unsigned __int8 a1)
{
  sub_100025048();
  sub_100024C28();
  swift_bridgeObjectRelease();
  Swift::Int v2 = sub_100025068();

  return sub_100008AB4(a1, v2);
}

unint64_t sub_100008868(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = sub_100024DB8(*(void *)(v2 + 40));
  return sub_100008CAC(a1, v4, &qword_100038FE0);
}

unint64_t sub_1000088B8(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = sub_100024DB8(*(void *)(v2 + 40));
  return sub_100008CAC(a1, v4, &qword_100038FA0);
}

unint64_t sub_100008908(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_10000B364(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = sub_100024E28();
      sub_10000B3C0((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_1000089D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    unint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_100024FC8() & 1) == 0)
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
      while (!v14 && (sub_100024FC8() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_100008AB4(unsigned __int8 a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    uint64_t v6 = a1;
    while (1)
    {
      unint64_t v7 = 0xE300000000000000;
      uint64_t v8 = 6647407;
      switch(*(unsigned char *)(*(void *)(v2 + 48) + v4))
      {
        case 1:
          uint64_t v8 = 7305076;
          break;
        case 2:
          unint64_t v7 = 0xE500000000000000;
          uint64_t v8 = 0x6565726874;
          break;
        case 3:
          unint64_t v7 = 0xE400000000000000;
          uint64_t v8 = 1920298854;
          break;
        case 4:
          unint64_t v7 = 0xE400000000000000;
          uint64_t v8 = 1702259046;
          break;
        default:
          break;
      }
      unint64_t v9 = 0xE300000000000000;
      uint64_t v10 = 6647407;
      switch(v6)
      {
        case 1:
          if (v8 == 7305076) {
            goto LABEL_15;
          }
          goto LABEL_16;
        case 2:
          unint64_t v9 = 0xE500000000000000;
          if (v8 != 0x6565726874) {
            goto LABEL_16;
          }
          goto LABEL_15;
        case 3:
          unint64_t v9 = 0xE400000000000000;
          uint64_t v10 = 1920298854;
          goto LABEL_14;
        case 4:
          unint64_t v9 = 0xE400000000000000;
          if (v8 != 1702259046) {
            goto LABEL_16;
          }
          goto LABEL_15;
        default:
LABEL_14:
          if (v8 != v10) {
            goto LABEL_16;
          }
LABEL_15:
          if (v7 == v9)
          {
            swift_bridgeObjectRelease_n();
            return v4;
          }
LABEL_16:
          char v11 = sub_100024FC8();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (v11) {
            return v4;
          }
          unint64_t v4 = (v4 + 1) & v5;
          if (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) == 0) {
            return v4;
          }
          break;
      }
    }
  }
  return v4;
}

unint64_t sub_100008CAC(uint64_t a1, uint64_t a2, unint64_t *a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t i = a2 & ~v5;
  if ((*(void *)(v3 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    sub_100006164(0, a3);
    id v7 = *(id *)(*(void *)(v3 + 48) + 8 * i);
    char v8 = sub_100024DC8();

    if ((v8 & 1) == 0)
    {
      uint64_t v9 = ~v5;
      for (unint64_t i = (i + 1) & v9; ((*(void *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v9)
      {
        id v10 = *(id *)(*(void *)(v3 + 48) + 8 * i);
        char v11 = sub_100024DC8();

        if (v11) {
          break;
        }
      }
    }
  }
  return i;
}

uint64_t sub_100008DC0(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_100004858(&qword_100038FA8);
  uint64_t v6 = sub_100024F58();
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
    __n128 v22 = (void *)(v5 + 64);
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
      sub_10000B47C((_OWORD *)(*(void *)(v5 + 56) + 32 * v20), v37);
    }
    else
    {
      sub_10000B364(v25, (uint64_t)&v38);
      sub_10000B48C(*(void *)(v5 + 56) + 32 * v20, (uint64_t)v37);
    }
    uint64_t result = sub_100024E18(*(void *)(v7 + 40));
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
    uint64_t result = (uint64_t)sub_10000B47C(v37, (_OWORD *)(*(void *)(v7 + 56) + 32 * v15));
    ++*(void *)(v7 + 16);
  }
  swift_release();
  __n128 v22 = (void *)(v5 + 64);
  if ((a2 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v35 = 1 << *(unsigned char *)(v5 + 32);
  if (v35 >= 64) {
    bzero(v22, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *__n128 v22 = -1 << v35;
  }
  *(void *)(v5 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_1000090D8(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_100004858(&qword_100038F78);
  uint64_t v6 = sub_100024F58();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_39;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  unint64_t v32 = (void *)(v5 + 64);
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v31 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  swift_retain();
  int64_t v12 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v18 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v19 = v18 | (v12 << 6);
      goto LABEL_31;
    }
    int64_t v20 = v12 + 1;
    if (__OFADD__(v12, 1)) {
      goto LABEL_40;
    }
    if (v20 >= v31) {
      break;
    }
    unint64_t v21 = v32[v20];
    ++v12;
    if (!v21)
    {
      int64_t v12 = v20 + 1;
      if (v20 + 1 >= v31) {
        break;
      }
      unint64_t v21 = v32[v12];
      if (!v21)
      {
        int64_t v22 = v20 + 2;
        if (v22 >= v31) {
          break;
        }
        unint64_t v21 = v32[v22];
        if (!v21)
        {
          while (1)
          {
            int64_t v12 = v22 + 1;
            if (__OFADD__(v22, 1)) {
              goto LABEL_41;
            }
            if (v12 >= v31) {
              goto LABEL_34;
            }
            unint64_t v21 = v32[v12];
            ++v22;
            if (v21) {
              goto LABEL_30;
            }
          }
        }
        int64_t v12 = v22;
      }
    }
LABEL_30:
    unint64_t v10 = (v21 - 1) & v21;
    unint64_t v19 = __clz(__rbit64(v21)) + (v12 << 6);
LABEL_31:
    char v27 = *(unsigned char *)(*(void *)(v5 + 48) + v19);
    uint64_t v28 = *(void *)(*(void *)(v5 + 56) + 8 * v19);
    if ((a2 & 1) == 0) {
      swift_unknownObjectRetain();
    }
    sub_100025048();
    sub_100024C28();
    swift_bridgeObjectRelease();
    Swift::Int v13 = sub_100025068();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = v13 & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
      goto LABEL_8;
    }
    char v23 = 0;
    unint64_t v24 = (unint64_t)(63 - v14) >> 6;
    do
    {
      if (++v16 == v24 && (v23 & 1) != 0)
      {
        __break(1u);
LABEL_40:
        __break(1u);
LABEL_41:
        __break(1u);
        JUMPOUT(0x100009428);
      }
      BOOL v25 = v16 == v24;
      if (v16 == v24) {
        unint64_t v16 = 0;
      }
      v23 |= v25;
      uint64_t v26 = *(void *)(v11 + 8 * v16);
    }
    while (v26 == -1);
    unint64_t v17 = __clz(__rbit64(~v26)) + (v16 << 6);
LABEL_8:
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    *(unsigned char *)(*(void *)(v7 + 48) + v17) = v27;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v28;
    ++*(void *)(v7 + 16);
  }
LABEL_34:
  swift_release();
  uint64_t v3 = v2;
  if (a2)
  {
    uint64_t v29 = 1 << *(unsigned char *)(v5 + 32);
    if (v29 >= 64) {
      bzero(v32, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
    }
    else {
      *unint64_t v32 = -1 << v29;
    }
    *(void *)(v5 + 16) = 0;
  }
LABEL_39:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_10000943C(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_100004858(&qword_100038FE8);
  uint64_t v6 = sub_100024F58();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v36 = v2;
  uint64_t v37 = v5 + 64;
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
      unint64_t v20 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v21 = v20 | (v14 << 6);
      goto LABEL_31;
    }
    int64_t v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v11) {
      break;
    }
    char v23 = (void *)(v5 + 64);
    unint64_t v24 = *(void *)(v37 + 8 * v22);
    ++v14;
    if (!v24)
    {
      int64_t v14 = v22 + 1;
      if (v22 + 1 >= v11) {
        goto LABEL_33;
      }
      unint64_t v24 = *(void *)(v37 + 8 * v14);
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v11)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v36;
          if ((a2 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v24 = *(void *)(v37 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            int64_t v14 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_42;
            }
            if (v14 >= v11) {
              goto LABEL_33;
            }
            unint64_t v24 = *(void *)(v37 + 8 * v14);
            ++v25;
            if (v24) {
              goto LABEL_30;
            }
          }
        }
        int64_t v14 = v25;
      }
    }
LABEL_30:
    unint64_t v10 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_31:
    uint64_t v30 = 8 * v21;
    int64_t v31 = *(void **)(*(void *)(v5 + 48) + v30);
    unint64_t v32 = *(void **)(*(void *)(v5 + 56) + v30);
    if ((a2 & 1) == 0)
    {
      id v33 = v31;
      id v34 = v32;
    }
    uint64_t result = sub_100024DB8(*(void *)(v7 + 40));
    uint64_t v15 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v16 = result & ~v15;
    unint64_t v17 = v16 >> 6;
    if (((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v28 = v17 == v27;
        if (v17 == v27) {
          unint64_t v17 = 0;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v12 + 8 * v17);
      }
      while (v29 == -1);
      unint64_t v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }
    *(void *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    uint64_t v19 = 8 * v18;
    *(void *)(*(void *)(v7 + 48) + v19) = v31;
    *(void *)(*(void *)(v7 + 56) + v19) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v36;
  char v23 = (void *)(v5 + 64);
  if ((a2 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v35 = 1 << *(unsigned char *)(v5 + 32);
  if (v35 >= 64) {
    bzero(v23, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *char v23 = -1 << v35;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_100009710(uint64_t a1, char a2)
{
  return sub_100009728(a1, a2, (uint64_t *)&unk_100038FF0);
}

uint64_t sub_10000971C(uint64_t a1, char a2)
{
  return sub_100009728(a1, a2, &qword_100038FC0);
}

uint64_t sub_100009728(uint64_t a1, char a2, uint64_t *a3)
{
  uint64_t v4 = v3;
  uint64_t v6 = *v3;
  sub_100004858(a3);
  uint64_t v7 = sub_100024F58();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16)) {
    goto LABEL_40;
  }
  uint64_t v9 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v36 = v3;
  uint64_t v37 = v6 + 64;
  if (v9 < 64) {
    uint64_t v10 = ~(-1 << v9);
  }
  else {
    uint64_t v10 = -1;
  }
  unint64_t v11 = v10 & *(void *)(v6 + 64);
  int64_t v12 = (unint64_t)(v9 + 63) >> 6;
  uint64_t v13 = v7 + 64;
  uint64_t result = swift_retain();
  int64_t v15 = 0;
  while (1)
  {
    if (v11)
    {
      unint64_t v21 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v22 = v21 | (v15 << 6);
      goto LABEL_31;
    }
    int64_t v23 = v15 + 1;
    if (__OFADD__(v15, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v23 >= v12) {
      break;
    }
    unint64_t v24 = (void *)(v6 + 64);
    unint64_t v25 = *(void *)(v37 + 8 * v23);
    ++v15;
    if (!v25)
    {
      int64_t v15 = v23 + 1;
      if (v23 + 1 >= v12) {
        goto LABEL_33;
      }
      unint64_t v25 = *(void *)(v37 + 8 * v15);
      if (!v25)
      {
        int64_t v26 = v23 + 2;
        if (v26 >= v12)
        {
LABEL_33:
          swift_release();
          uint64_t v4 = v36;
          if ((a2 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v25 = *(void *)(v37 + 8 * v26);
        if (!v25)
        {
          while (1)
          {
            int64_t v15 = v26 + 1;
            if (__OFADD__(v26, 1)) {
              goto LABEL_42;
            }
            if (v15 >= v12) {
              goto LABEL_33;
            }
            unint64_t v25 = *(void *)(v37 + 8 * v15);
            ++v26;
            if (v25) {
              goto LABEL_30;
            }
          }
        }
        int64_t v15 = v26;
      }
    }
LABEL_30:
    unint64_t v11 = (v25 - 1) & v25;
    unint64_t v22 = __clz(__rbit64(v25)) + (v15 << 6);
LABEL_31:
    uint64_t v31 = 8 * v22;
    unint64_t v32 = *(void **)(*(void *)(v6 + 48) + v31);
    uint64_t v33 = *(void *)(*(void *)(v6 + 56) + v31);
    if ((a2 & 1) == 0)
    {
      id v34 = v32;
      swift_retain();
    }
    uint64_t result = sub_100024DB8(*(void *)(v8 + 40));
    uint64_t v16 = -1 << *(unsigned char *)(v8 + 32);
    unint64_t v17 = result & ~v16;
    unint64_t v18 = v17 >> 6;
    if (((-1 << v17) & ~*(void *)(v13 + 8 * (v17 >> 6))) != 0)
    {
      unint64_t v19 = __clz(__rbit64((-1 << v17) & ~*(void *)(v13 + 8 * (v17 >> 6)))) | v17 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v27 = 0;
      unint64_t v28 = (unint64_t)(63 - v16) >> 6;
      do
      {
        if (++v18 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v29 = v18 == v28;
        if (v18 == v28) {
          unint64_t v18 = 0;
        }
        v27 |= v29;
        uint64_t v30 = *(void *)(v13 + 8 * v18);
      }
      while (v30 == -1);
      unint64_t v19 = __clz(__rbit64(~v30)) + (v18 << 6);
    }
    *(void *)(v13 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
    uint64_t v20 = 8 * v19;
    *(void *)(*(void *)(v8 + 48) + v20) = v32;
    *(void *)(*(void *)(v8 + 56) + v20) = v33;
    ++*(void *)(v8 + 16);
  }
  swift_release();
  uint64_t v4 = v36;
  unint64_t v24 = (void *)(v6 + 64);
  if ((a2 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v35 = 1 << *(unsigned char *)(v6 + 32);
  if (v35 >= 64) {
    bzero(v24, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v24 = -1 << v35;
  }
  *(void *)(v6 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v4 = v8;
  return result;
}

uint64_t sub_1000099FC(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_100004858(&qword_100038FC8);
  char v41 = a2;
  uint64_t v6 = sub_100024F58();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v37 = v2;
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    long long v39 = (void *)(v5 + 64);
    if (v8 < 64) {
      uint64_t v9 = ~(-1 << v8);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & *(void *)(v5 + 64);
    int64_t v38 = (unint64_t)(v8 + 63) >> 6;
    uint64_t v11 = v6 + 64;
    uint64_t result = swift_retain();
    int64_t v13 = 0;
    for (i = v5; ; uint64_t v5 = i)
    {
      if (v10)
      {
        unint64_t v19 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        unint64_t v20 = v19 | (v13 << 6);
      }
      else
      {
        int64_t v21 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        if (v21 >= v38) {
          goto LABEL_33;
        }
        unint64_t v22 = v39[v21];
        ++v13;
        if (!v22)
        {
          int64_t v13 = v21 + 1;
          if (v21 + 1 >= v38) {
            goto LABEL_33;
          }
          unint64_t v22 = v39[v13];
          if (!v22)
          {
            int64_t v23 = v21 + 2;
            if (v23 >= v38)
            {
LABEL_33:
              swift_release();
              uint64_t v3 = v37;
              if (v41)
              {
                uint64_t v36 = 1 << *(unsigned char *)(v5 + 32);
                if (v36 >= 64) {
                  bzero(v39, ((unint64_t)(v36 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *long long v39 = -1 << v36;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v22 = v39[v23];
            if (!v22)
            {
              while (1)
              {
                int64_t v13 = v23 + 1;
                if (__OFADD__(v23, 1)) {
                  goto LABEL_40;
                }
                if (v13 >= v38) {
                  goto LABEL_33;
                }
                unint64_t v22 = v39[v13];
                ++v23;
                if (v22) {
                  goto LABEL_30;
                }
              }
            }
            int64_t v13 = v23;
          }
        }
LABEL_30:
        unint64_t v10 = (v22 - 1) & v22;
        unint64_t v20 = __clz(__rbit64(v22)) + (v13 << 6);
      }
      unint64_t v28 = *(void **)(*(void *)(v5 + 48) + 8 * v20);
      BOOL v29 = (uint64_t *)(*(void *)(v5 + 56) + 48 * v20);
      uint64_t v30 = *v29;
      uint64_t v31 = v29[1];
      uint64_t v32 = v29[2];
      uint64_t v33 = v29[3];
      uint64_t v34 = v29[5];
      uint64_t v42 = v29[4];
      if ((v41 & 1) == 0)
      {
        swift_bridgeObjectRetain();
        id v35 = v28;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
      }
      uint64_t result = sub_100024DB8(*(void *)(v7 + 40));
      uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v15 = result & ~v14;
      unint64_t v16 = v15 >> 6;
      if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
      {
        unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v24 = 0;
        unint64_t v25 = (unint64_t)(63 - v14) >> 6;
        do
        {
          if (++v16 == v25 && (v24 & 1) != 0)
          {
            __break(1u);
            goto LABEL_39;
          }
          BOOL v26 = v16 == v25;
          if (v16 == v25) {
            unint64_t v16 = 0;
          }
          v24 |= v26;
          uint64_t v27 = *(void *)(v11 + 8 * v16);
        }
        while (v27 == -1);
        unint64_t v17 = __clz(__rbit64(~v27)) + (v16 << 6);
      }
      *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      *(void *)(*(void *)(v7 + 48) + 8 * v17) = v28;
      unint64_t v18 = (void *)(*(void *)(v7 + 56) + 48 * v17);
      *unint64_t v18 = v30;
      v18[1] = v31;
      v18[2] = v32;
      v18[3] = v33;
      v18[4] = v42;
      v18[5] = v34;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

void *sub_100009D1C()
{
  uint64_t v1 = v0;
  sub_100004858(&qword_100038FA8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_100024F48();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
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
    sub_10000B364(*(void *)(v2 + 48) + 40 * v15, (uint64_t)v25);
    uint64_t v17 = 32 * v15;
    sub_10000B48C(*(void *)(v2 + 56) + v17, (uint64_t)v24);
    uint64_t v18 = *(void *)(v4 + 48) + v16;
    long long v19 = v25[0];
    long long v20 = v25[1];
    *(void *)(v18 + 32) = v26;
    *(_OWORD *)uint64_t v18 = v19;
    *(_OWORD *)(v18 + 16) = v20;
    uint64_t result = sub_10000B47C(v24, (_OWORD *)(*(void *)(v4 + 56) + v17));
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

void *sub_100009F04()
{
  uint64_t v1 = v0;
  sub_100004858(&qword_100038F78);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_100024F48();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
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
    int64_t v17 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v17 >= v13) {
      goto LABEL_26;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v9;
    if (!v18)
    {
      int64_t v9 = v17 + 1;
      if (v17 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v18 = *(void *)(v6 + 8 * v9);
      if (!v18) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v18 - 1) & v18;
    unint64_t v15 = __clz(__rbit64(v18)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = *(void *)(*(void *)(v2 + 56) + 8 * v15);
    *(unsigned char *)(*(void *)(v4 + 48) + v15) = *(unsigned char *)(*(void *)(v2 + 48) + v15);
    *(void *)(*(void *)(v4 + 56) + 8 * v15) = v16;
    uint64_t result = (void *)swift_unknownObjectRetain();
  }
  int64_t v19 = v17 + 2;
  if (v19 >= v13) {
    goto LABEL_26;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
    int64_t v9 = v19;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v9);
    ++v19;
    if (v18) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

double sub_10000A0A8@<D0>(_OWORD *a1@<X8>, double a2@<D0>)
{
  *a1 = COERCE_UNSIGNED_INT64(2.74747742 / a2);
  a1[1] = 0u;
  a1[2] = xmmword_100026990;
  a1[3] = 0u;
  a1[4] = 0u;
  a1[5] = xmmword_1000269A0;
  double result = 0.01001001;
  a1[6] = 0u;
  a1[7] = xmmword_1000269B0;
  return result;
}

id sub_10000A0EC()
{
  uint64_t v1 = v0;
  sub_100004858(&qword_100038FE8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_100024F48();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  id result = (id)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    int64_t v17 = *(void **)(*(void *)(v2 + 48) + v16);
    unint64_t v18 = *(void **)(*(void *)(v2 + 56) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    *(void *)(*(void *)(v4 + 56) + v16) = v18;
    id v19 = v17;
    id result = v18;
  }
  int64_t v22 = v20 + 2;
  if (v22 >= v13) {
    goto LABEL_26;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_10000A294()
{
  return sub_10000A2AC((uint64_t *)&unk_100038FF0);
}

void *sub_10000A2A0()
{
  return sub_10000A2AC(&qword_100038FC0);
}

void *sub_10000A2AC(uint64_t *a1)
{
  uint64_t v2 = v1;
  sub_100004858(a1);
  uint64_t v3 = *v1;
  uint64_t v4 = sub_100024F48();
  uint64_t v5 = v4;
  if (!*(void *)(v3 + 16))
  {
LABEL_26:
    id result = (void *)swift_release();
    *uint64_t v2 = v5;
    return result;
  }
  id result = (void *)(v4 + 64);
  uint64_t v7 = v3 + 64;
  unint64_t v8 = (unint64_t)((1 << *(unsigned char *)(v5 + 32)) + 63) >> 6;
  if (v5 != v3 || (unint64_t)result >= v3 + 64 + 8 * v8) {
    id result = memmove(result, (const void *)(v3 + 64), 8 * v8);
  }
  int64_t v10 = 0;
  *(void *)(v5 + 16) = *(void *)(v3 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v3 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v3 + 64);
  int64_t v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      unint64_t v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v16 = v15 | (v10 << 6);
      goto LABEL_12;
    }
    int64_t v21 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v21 >= v14) {
      goto LABEL_26;
    }
    unint64_t v22 = *(void *)(v7 + 8 * v21);
    ++v10;
    if (!v22)
    {
      int64_t v10 = v21 + 1;
      if (v21 + 1 >= v14) {
        goto LABEL_26;
      }
      unint64_t v22 = *(void *)(v7 + 8 * v10);
      if (!v22) {
        break;
      }
    }
LABEL_25:
    unint64_t v13 = (v22 - 1) & v22;
    unint64_t v16 = __clz(__rbit64(v22)) + (v10 << 6);
LABEL_12:
    uint64_t v17 = 8 * v16;
    unint64_t v18 = *(void **)(*(void *)(v3 + 48) + v17);
    uint64_t v19 = *(void *)(*(void *)(v3 + 56) + v17);
    *(void *)(*(void *)(v5 + 48) + v17) = v18;
    *(void *)(*(void *)(v5 + 56) + v17) = v19;
    id v20 = v18;
    id result = (void *)swift_retain();
  }
  int64_t v23 = v21 + 2;
  if (v23 >= v14) {
    goto LABEL_26;
  }
  unint64_t v22 = *(void *)(v7 + 8 * v23);
  if (v22)
  {
    int64_t v10 = v23;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v10 = v23 + 1;
    if (__OFADD__(v23, 1)) {
      break;
    }
    if (v10 >= v14) {
      goto LABEL_26;
    }
    unint64_t v22 = *(void *)(v7 + 8 * v10);
    ++v23;
    if (v22) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_10000A450()
{
  uint64_t v1 = v0;
  sub_100004858(&qword_100038FC8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_100024F48();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  id result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    int64_t v28 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v28 >= v13) {
      goto LABEL_26;
    }
    unint64_t v29 = *(void *)(v6 + 8 * v28);
    ++v9;
    if (!v29)
    {
      int64_t v9 = v28 + 1;
      if (v28 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v29 = *(void *)(v6 + 8 * v9);
      if (!v29) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v29 - 1) & v29;
    unint64_t v15 = __clz(__rbit64(v29)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void **)(*(void *)(v2 + 48) + 8 * v15);
    uint64_t v18 = 48 * v15;
    uint64_t v19 = (uint64_t *)(*(void *)(v2 + 56) + v18);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    uint64_t v22 = v19[2];
    uint64_t v23 = v19[3];
    uint64_t v25 = v19[4];
    uint64_t v24 = v19[5];
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    uint64_t v26 = (void *)(*(void *)(v4 + 56) + v18);
    *uint64_t v26 = v20;
    v26[1] = v21;
    v26[2] = v22;
    v26[3] = v23;
    v26[4] = v25;
    v26[5] = v24;
    swift_bridgeObjectRetain();
    id v27 = v17;
    swift_bridgeObjectRetain();
    id result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v30 = v28 + 2;
  if (v30 >= v13) {
    goto LABEL_26;
  }
  unint64_t v29 = *(void *)(v6 + 8 * v30);
  if (v29)
  {
    int64_t v9 = v30;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v30 + 1;
    if (__OFADD__(v30, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v29 = *(void *)(v6 + 8 * v9);
    ++v30;
    if (v29) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_10000A630(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_10000A710(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_10000A650(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_10000A870(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_10000A670(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_10000A9C0(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_10000A690(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_10000AB1C(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_10000A6B0(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_10000AC7C(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_10000A6D0(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_10000ADF4(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_10000A6F0(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_10000AF54(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_10000A710(char a1, int64_t a2, char a3, char *a4)
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
        goto LABEL_32;
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
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_100004858(&qword_100038F80);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 29;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 2);
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  int64_t v13 = v10 + 32;
  unint64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[4 * v8]) {
      memmove(v13, v14, 4 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[4 * v8] || v13 >= &v14[4 * v8])
  {
    memcpy(v13, v14, 4 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_100024F88();
  __break(1u);
  return result;
}

uint64_t sub_10000A870(char a1, int64_t a2, char a3, char *a4)
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
    sub_100004858(&qword_100038FD0);
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
  int64_t v13 = a4 + 32;
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
  uint64_t result = sub_100024F88();
  __break(1u);
  return result;
}

uint64_t sub_10000A9C0(char a1, int64_t a2, char a3, char *a4)
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
        goto LABEL_32;
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
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_100004858(&qword_100038F88);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    int64_t v12 = v11 - 32;
    if (v11 < 32) {
      int64_t v12 = v11 - 31;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = v12 & 0xFFFFFFFFFFFFFFFELL;
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  int64_t v13 = v10 + 32;
  unint64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[2 * v8]) {
      memmove(v13, v14, 2 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[2 * v8] || v13 >= &v14[2 * v8])
  {
    memcpy(v13, v14, 2 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_100024F88();
  __break(1u);
  return result;
}

uint64_t sub_10000AB1C(char a1, int64_t a2, char a3, char *a4)
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
        goto LABEL_32;
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
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_100004858(&qword_100038F90);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  int64_t v13 = v10 + 32;
  unint64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8]) {
      memmove(v13, v14, 8 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[8 * v8] || v13 >= &v14[8 * v8])
  {
    memcpy(v13, v14, 8 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_100024F88();
  __break(1u);
  return result;
}

uint64_t sub_10000AC7C(char a1, int64_t a2, char a3, char *a4)
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
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_100004858(&qword_100038FD8);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 20);
  }
  else
  {
    uint64_t v10 = (char *)_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  int64_t v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[20 * v8]) {
      memmove(v12, v13, 20 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[20 * v8] || v12 >= &v13[20 * v8])
  {
    memcpy(v12, v13, 20 * v8);
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_100024F88();
  __break(1u);
  return result;
}

uint64_t sub_10000ADF4(char a1, int64_t a2, char a3, char *a4)
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
        goto LABEL_32;
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
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_100004858(&qword_100038F98);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)_swiftEmptyArrayStorage;
  }
  int64_t v13 = v10 + 32;
  unint64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    memcpy(v13, v14, 16 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_100024F88();
  __break(1u);
  return result;
}

uint64_t sub_10000AF54(char a1, int64_t a2, char a3, char *a4)
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
        goto LABEL_32;
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
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_100004858(&qword_100038FB8);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)_swiftEmptyArrayStorage;
  }
  int64_t v13 = v10 + 32;
  unint64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_100024F88();
  __break(1u);
  return result;
}

uint64_t sub_10000B0C0(uint64_t result)
{
  uint64_t v2 = *v1;
  unint64_t v3 = *(void *)(*v1 + 16);
  unint64_t v4 = v3 - 2;
  if (v3 >= 2)
  {
    unint64_t v5 = 0;
    uint64_t v22 = (void *)result;
    uint64_t v6 = *(void *)result;
    while (1)
    {
      uint64_t v8 = v6 - 0x61C8864680B583EBLL;
      unint64_t v9 = 0xBF58476D1CE4E5B9 * ((v6 - 0x61C8864680B583EBLL) ^ ((unint64_t)(v6 - 0x61C8864680B583EBLL) >> 30));
      unint64_t v10 = (0x94D049BB133111EBLL * (v9 ^ (v9 >> 27))) ^ ((0x94D049BB133111EBLL * (v9 ^ (v9 >> 27))) >> 31);
      unint64_t v11 = v10 * v3;
      uint64_t v12 = (v10 * (unsigned __int128)v3) >> 64;
      if (v3 > v11)
      {
        unint64_t v13 = -(uint64_t)v3 % v3;
        if (v13 > v11)
        {
          unint64_t v14 = v6 + 0x3C6EF372FE94F82ALL;
          do
          {
            v8 -= 0x61C8864680B583EBLL;
            unint64_t v15 = 0x94D049BB133111EBLL
                * ((0xBF58476D1CE4E5B9 * (v14 ^ (v14 >> 30))) ^ ((0xBF58476D1CE4E5B9 * (v14 ^ (v14 >> 30))) >> 27));
            unint64_t v16 = v15 ^ (v15 >> 31);
            v14 -= 0x61C8864680B583EBLL;
          }
          while (v13 > v16 * v3);
          uint64_t v12 = (v16 * (unsigned __int128)v3) >> 64;
        }
      }
      uint64_t v6 = v8;
      unint64_t v17 = v5 + v12;
      if (__OFADD__(v5, v12)) {
        break;
      }
      if (v5 != v17)
      {
        unint64_t v18 = *(void *)(v2 + 16);
        if (v5 >= v18) {
          goto LABEL_21;
        }
        if (v17 >= v18) {
          goto LABEL_22;
        }
        int v19 = *(_DWORD *)(v2 + 32 + 4 * v5);
        int v20 = *(_DWORD *)(v2 + 32 + 4 * v17);
        uint64_t result = swift_isUniquelyReferenced_nonNull_native();
        if ((result & 1) == 0)
        {
          uint64_t result = sub_10000B350(v2);
          uint64_t v2 = result;
        }
        unint64_t v21 = *(void *)(v2 + 16);
        if (v5 >= v21) {
          goto LABEL_23;
        }
        *(_DWORD *)(v2 + 32 + 4 * v5) = v20;
        if (v17 >= v21) {
          goto LABEL_24;
        }
        *(_DWORD *)(v2 + 32 + 4 * v17) = v19;
        uint64_t *v1 = v2;
      }
      --v3;
      if (v5++ == v4)
      {
        *uint64_t v22 = v6;
        return result;
      }
    }
    __break(1u);
LABEL_21:
    __break(1u);
LABEL_22:
    __break(1u);
LABEL_23:
    __break(1u);
LABEL_24:
    __break(1u);
  }
  return result;
}

unint64_t sub_10000B27C(unint64_t result)
{
  if (result)
  {
    unint64_t v2 = *v1;
    unint64_t v3 = *v1 - 0x61C8864680B583EBLL;
    unint64_t *v1 = v3;
    unint64_t v4 = 0x94D049BB133111EBLL
       * ((0xBF58476D1CE4E5B9 * (v3 ^ (v3 >> 30))) ^ ((0xBF58476D1CE4E5B9 * (v3 ^ (v3 >> 30))) >> 27));
    unint64_t v5 = result * (unint64_t)((v4 >> 31) ^ v4);
    unint64_t v6 = HIDWORD(v5);
    if (v5 < result)
    {
      unsigned int v7 = -(int)result % result;
      if (v7 > v5)
      {
        unint64_t v8 = v2 + 0x3C6EF372FE94F82ALL;
        do
        {
          v3 -= 0x61C8864680B583EBLL;
          unint64_t v9 = 0x94D049BB133111EBLL
             * ((0xBF58476D1CE4E5B9 * (v8 ^ (v8 >> 30))) ^ ((0xBF58476D1CE4E5B9 * (v8 ^ (v8 >> 30))) >> 27));
          int64_t v10 = result * (unint64_t)((v9 >> 31) ^ v9);
          v8 -= 0x61C8864680B583EBLL;
        }
        while (v7 > v10);
        unint64_t v6 = v10 >> 32;
        unint64_t *v1 = v3;
      }
    }
    return v6;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_10000B350(uint64_t a1)
{
  return sub_10000A710(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_10000B364(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_10000B3C0(uint64_t a1)
{
  return a1;
}

uint64_t sub_10000B414(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004858(&qword_100038FB0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_10000B47C(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_10000B48C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

double sub_10000B4E8(double a1, double a2, double a3, double a4, __n128 a5, __n128 a6, __n128 a7)
{
  float64x2_t v8 = *(float64x2_t *)(v7 + 32);
  float64_t v9 = *(double *)(v7 + 56);
  v22.f64[0] = *(float64_t *)(v7 + 48);
  v22.f64[1] = v9;
  float64x2_t v21 = v8;
  sub_10000B830((uint64_t)&v21, (uint64_t)v23, a5, a6, a7);
  sub_10000B8E4((uint64_t)v23, (uint64_t)&v21, (__n128)v23[1], (__n128)v23[3], (__n128)v23[5]);
  float32x4_t v10 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v21), v22);
  __asm { FMOV            V5.4S, #1.0 }
  float v16 = *(float *)(v7 + 64);
  if (v16 != 0.0)
  {
    float32x4_t v20 = v10;
    unint64_t v17 = (unint64_t)__sincosf_stret(v16);
    LODWORD(v18) = HIDWORD(v17);
    *((float *)&v18 + 1) = -*(float *)&v17;
    v10.i64[0] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v18, v20.f32[0]), (float32x4_t)v17, *(float32x2_t *)v20.f32, 1), (float32x4_t)xmmword_100026A40, v20, 2), (float32x4_t)xmmword_100026A50, v20, 3).u64[0];
  }
  return *(double *)v10.i64;
}

float32x2_t sub_10000B680@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>, double a3@<D0>)
{
  *(double *)&long long v23 = a3;
  uint64_t v6 = sub_100024D48();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  float32x4_t v10 = (char *)v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(float32x2_t *)&long long v11 = vadd_f32(*(float32x2_t *)v3, vmul_n_f32(vsub_f32(*(float32x2_t *)a1, *(float32x2_t *)v3), *(float *)&v23));
  *((float *)&v11 + 2) = *(float *)(v3 + 8) + (float)((float)(*(float *)(a1 + 8) - *(float *)(v3 + 8)) * *(float *)&v23);
  HIDWORD(v11) = 0;
  float v12 = *(float *)(v3 + 16) + (float)((float)(*(float *)(a1 + 16) - *(float *)(v3 + 16)) * *(float *)&v23);
  long long v21 = *(_OWORD *)(v3 + 32);
  long long v22 = v11;
  long long v13 = *(_OWORD *)(v3 + 48);
  v19[1] = *(_OWORD *)(a1 + 32);
  long long v20 = v13;
  v19[0] = *(_OWORD *)(a1 + 48);
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v10, enum case for SPRotation3D.SlerpPath.shortest(_:), v6);
  sub_100024D38();
  long long v20 = v15;
  long long v21 = v14;
  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  float v16 = *(float *)&v23;
  *(_OWORD *)a2 = v22;
  *(float *)(a2 + 16) = v12;
  long long v17 = v20;
  *(_OWORD *)(a2 + 32) = v21;
  *(_OWORD *)(a2 + 48) = v17;
  float32x2_t result = vadd_f32(*(float32x2_t *)(v3 + 64), vmul_n_f32(vsub_f32(*(float32x2_t *)(a1 + 64), *(float32x2_t *)(v3 + 64)), v16));
  *(float32x2_t *)(a2 + 64) = result;
  return result;
}

double sub_10000B830@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>, __n128 _Q4@<Q4>, __n128 _Q5@<Q5>, __n128 a5@<Q6>)
{
  _Q1 = *(float64x2_t *)a1;
  _Q0 = *(float64x2_t *)(a1 + 16);
  _D3 = *(double *)(a1 + 8);
  __asm { FMLS            D2, D0, V0.D[0] }
  _Q5.n128_u64[0] = *(void *)(a1 + 24);
  __asm { FMLA            D2, D5, V0.D[1] }
  a5.n128_f64[0] = vmlad_n_f64(vmuld_lane_f64(_Q0.f64[0], _Q0, 1), _D3, *(double *)a1);
  v14.f64[0] = vmuld_lane_f64(_D3, _Q0, 1);
  double v15 = vmlad_n_f64(-(_D3 * _Q5.n128_f64[0]), _Q0.f64[0], *(double *)a1);
  *((double *)&_Q2 + 1) = a5.n128_f64[0] + a5.n128_f64[0];
  a5.n128_f64[0] = v15 + v15;
  double v16 = vmlad_n_f64(-(_Q0.f64[0] * _Q5.n128_f64[0]), _D3, *(double *)a1);
  *(double *)&long long v17 = v16 + v16;
  __asm
  {
    FMLA            D4, D3, V1.D[1]
    FMLA            D4, D5, V0.D[1]
    FMLS            D4, D1, V1.D[0]
    FMLA            D17, D0, V1.D[1]
  }
  *((void *)&v17 + 1) = _Q4.n128_u64[0];
  _Q4.n128_f64[0] = _D17 + _D17;
  double v19 = -(*(double *)a1 * _Q5.n128_f64[0]);
  __asm
  {
    FMLS            D5, D1, V1.D[0]
    FMLS            D5, D3, V1.D[1]
  }
  _Q1.f64[0] = *(float64_t *)(a1 + 16);
  v14.f64[1] = v19;
  float64x2_t v20 = vmlaq_f64(v14, (float64x2_t)vzip1q_s64(*(int64x2_t *)a1, (int64x2_t)_Q0), _Q1);
  *(_OWORD *)a2 = _Q2;
  *(__n128 *)(a2 + 16) = a5;
  *(_OWORD *)(a2 + 32) = v17;
  *(__n128 *)(a2 + 48) = _Q4;
  *(float64x2_t *)(a2 + 64) = vaddq_f64(v20, v20);
  *(__n128 *)(a2 + 80) = _Q5;
  *(void *)(a2 + 96) = 0;
  *(void *)(a2 + 104) = 0;
  double result = 0.0;
  *(_OWORD *)(a2 + 112) = 0u;
  return result;
}

__n128 sub_10000B8E4@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>, __n128 a3@<Q1>, __n128 a4@<Q3>, __n128 a5@<Q5>)
{
  __n128 result = *(__n128 *)a1;
  a3.n128_u64[0] = *(void *)(a1 + 16);
  long long v6 = *(_OWORD *)(a1 + 32);
  a4.n128_u64[0] = *(void *)(a1 + 48);
  long long v7 = *(_OWORD *)(a1 + 64);
  a5.n128_u64[0] = *(void *)(a1 + 80);
  long long v8 = *(_OWORD *)(a1 + 96);
  __asm { FMOV            V7.2D, #1.0 }
  *(void *)&_Q7 = *(void *)(a1 + 112);
  *(_OWORD *)a2 = *(_OWORD *)a1;
  *(__n128 *)(a2 + 16) = a3;
  *(_OWORD *)(a2 + 32) = v6;
  *(__n128 *)(a2 + 48) = a4;
  *(_OWORD *)(a2 + 64) = v7;
  *(__n128 *)(a2 + 80) = a5;
  *(_OWORD *)(a2 + 96) = v8;
  *(_OWORD *)(a2 + 112) = _Q7;
  return result;
}

id sub_10000B920()
{
  uint64_t v1 = OBJC_IVAR____TtC20PridePosterExtension17DrawingController_coordinators;
  long long v2 = v0;
  *(void *)&v0[v1] = sub_100007838((uint64_t)&_swiftEmptyArrayStorage);
  uint64_t v3 = OBJC_IVAR____TtC20PridePosterExtension17DrawingController_sensitiveUIOverlays;
  *(void *)&v2[v3] = sub_100007858((uint64_t)&_swiftEmptyArrayStorage);

  v9.receiver = v2;
  v9.super_class = (Class)type metadata accessor for DrawingController();
  id v4 = objc_msgSendSuper2(&v9, "init");
  unint64_t v5 = self;
  id v6 = v4;
  id v7 = [v5 defaultCenter];
  [v7 addObserver:v6 selector:"reduceMotionChanged" name:UIAccessibilityReduceMotionStatusDidChangeNotification object:0];

  return v6;
}

id sub_10000BA30()
{
  id v1 = [self defaultCenter];
  [v1 removeObserver:v0];

  v3.receiver = v0;
  v3.super_class = (Class)type metadata accessor for DrawingController();
  return objc_msgSendSuper2(&v3, "dealloc");
}

uint64_t sub_10000BB78(void *a1, void *a2)
{
  swift_getObjectType();
  id v4 = [a2 contents];
  unsigned __int8 v5 = sub_10000C610();
  uint64_t result = swift_unknownObjectRelease();
  if (v5 != 3)
  {
    if (qword_100038BB0 != -1) {
      swift_once();
    }
    uint64_t v7 = sub_100024B38();
    uint64_t v37 = sub_10000612C(v7, (uint64_t)qword_100039FE0);
    long long v8 = sub_100024B18();
    os_log_type_t v9 = sub_100024D68();
    id v39 = a1;
    if (os_log_type_enabled(v8, v9))
    {
      float32x4_t v10 = (uint8_t *)swift_slowAlloc();
      *(void *)&long long v46 = swift_slowAlloc();
      *(_DWORD *)float32x4_t v10 = 136446210;
      if (v5)
      {
        if (v5 == 1)
        {
          uint64_t v11 = 0x656C636974726170;
          unint64_t v12 = 0xE900000000000073;
        }
        else
        {
          unint64_t v12 = 0xE600000000000000;
          uint64_t v11 = 0x73746867696CLL;
        }
      }
      else
      {
        uint64_t v11 = 0x73657069727473;
        unint64_t v12 = 0xE700000000000000;
      }
      *(void *)&long long aBlock = sub_100010B4C(v11, v12, (uint64_t *)&v46);
      sub_100024DD8();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "setting up with identifier “%{public}s”", v10, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    if (v5)
    {
      if (v5 == 1)
      {
        type metadata accessor for PrideParticlesRenderer();
        long long v13 = (unint64_t *)&unk_100039158;
        float64x2_t v14 = type metadata accessor for PrideParticlesRenderer;
      }
      else
      {
        type metadata accessor for PrideLightsRenderer();
        long long v13 = (unint64_t *)&unk_1000390F0;
        float64x2_t v14 = type metadata accessor for PrideLightsRenderer;
      }
    }
    else
    {
      type metadata accessor for PrideStripesRenderer();
      long long v13 = (unint64_t *)&unk_100039160;
      float64x2_t v14 = type metadata accessor for PrideStripesRenderer;
    }
    sub_10000E034(v13, (void (*)(uint64_t))v14);
    uint64_t v15 = swift_unknownObjectRetain();
    sub_100011F48(v15, (uint64_t *)&v46);
    if (v50) {
      uint64_t v16 = v49;
    }
    else {
      uint64_t v16 = 0;
    }
    if (v50) {
      long long v17 = v50;
    }
    else {
      long long v17 = (void *)0xE000000000000000;
    }
    if (v5 > 1u)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      char v20 = sub_1000111A4(v16, v17);
      if (v20 != 5)
      {
        id v21 = sub_10000E07C(v20);
LABEL_27:
        long long v22 = v21;
        uint64_t v23 = swift_allocObject();
        *(unsigned char *)(v23 + 16) = v5;
        *(void *)(v23 + 24) = v22;
        uint64_t v24 = swift_allocObject();
        *(void *)(v24 + 16) = sub_10000DF5C;
        *(void *)(v24 + 24) = v23;
        float v44 = sub_10000DF78;
        uint64_t v45 = v24;
        *(void *)&long long aBlock = _NSConcreteStackBlock;
        *((void *)&aBlock + 1) = 1107296256;
        uint64_t v42 = sub_10000CB10;
        unint64_t v43 = &unk_100031548;
        uint64_t v25 = _Block_copy(&aBlock);
        id v38 = v22;
        swift_retain();
        swift_release();
        [v39 updatePreferences:v25];
        _Block_release(v25);
        uint64_t isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
        swift_release();
        if ((isEscapingClosureAtFileLocation & 1) == 0)
        {
          uint64_t v27 = v47;
          int64_t v28 = v48;
          long long v51 = v46;
          long long aBlock = v46;
          swift_bridgeObjectRetain();
          v52._countAndFlagsBits = 44;
          v52._object = (void *)0xE100000000000000;
          sub_100024C58(v52);
          swift_bridgeObjectRetain();
          v53._countAndFlagsBits = v27;
          v53._object = v28;
          sub_100024C58(v53);
          swift_bridgeObjectRelease();
          sub_10000DFB8((uint64_t)&v51);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          sub_100024AA8();
          swift_allocObject();
          swift_unknownObjectRetain();
          uint64_t v29 = sub_100024A78();
          swift_retain();
          id v30 = [v39 backgroundView];
          id v31 = [v39 floatingView];
          sub_100024A88();

          swift_beginAccess();
          swift_retain();
          uint64_t isEscapingClosureAtFileLocation = (uint64_t)v39;
          sub_10001F188(v29, isEscapingClosureAtFileLocation);
          swift_endAccess();

          uint64_t v32 = swift_allocObject();
          swift_unknownObjectWeakInit();
          sub_100024A98();
          if (v43)
          {
            sub_100004858((uint64_t *)&unk_1000390B0);
            type metadata accessor for PrideParticlesRenderer();
            if (swift_dynamicCast())
            {
              uint64_t v33 = *(void *)(v40 + 16);
              *(void *)(v40 + 16) = sub_10000E01C;
              *(void *)(v40 + 24) = v32;
              swift_retain();
              sub_10000E024(v33);
              swift_release();
            }
          }
          else
          {
            sub_10000DE34((uint64_t)&aBlock, &qword_1000390A8);
          }
          sub_100024A98();
          swift_release();
          if (v43)
          {
            sub_100004858((uint64_t *)&unk_1000390B0);
            type metadata accessor for PrideLightsRenderer();
            if (swift_dynamicCast())
            {
              uint64_t v24 = v40;
              uint64_t v34 = *(void *)(v40 + 16);
              *(void *)(v40 + 16) = sub_10000E01C;
              *(void *)(v40 + 24) = v32;
              swift_retain();
              sub_10000E024(v34);
              BOOL IsReduceMotionEnabled = UIAccessibilityIsReduceMotionEnabled();
              *(unsigned char *)(v40 + OBJC_IVAR____TtC20PridePosterExtension19PrideLightsRenderer_reduceMotion) = IsReduceMotionEnabled;
              if (!IsReduceMotionEnabled)
              {
                char v36 = 2;
                goto LABEL_41;
              }
              if (qword_100038B88 == -1)
              {
LABEL_38:
                char v36 = (byte_1000391D0 & 1) == 0;
LABEL_41:
                *(unsigned char *)(*(void *)(v24 + OBJC_IVAR____TtC20PridePosterExtension19PrideLightsRenderer_cameraController)
                         + 19) = v36;
                swift_release();
                goto LABEL_42;
              }
LABEL_45:
              swift_once();
              goto LABEL_38;
            }
          }
          else
          {
            sub_10000DE34((uint64_t)&aBlock, &qword_1000390A8);
          }
LABEL_42:
          sub_10000D0CC((void *)isEscapingClosureAtFileLocation, (char)objc_msgSend(a2, "isSnapshot", v37), v5);
          swift_release();
          swift_release();

          return swift_release();
        }
        __break(1u);
        goto LABEL_45;
      }
      id v19 = objc_msgSend(self, "whiteColor", v37);
    }
    else
    {
      unint64_t v18 = self;
      swift_bridgeObjectRetain();
      id v19 = objc_msgSend(v18, "whiteColor", v37);
    }
    id v21 = v19;
    goto LABEL_27;
  }
  return result;
}

uint64_t sub_10000C610()
{
  id v1 = [v0 descriptorIdentifier];
  if (v1)
  {
    long long v2 = v1;
    uint64_t v3 = sub_100024BF8();
    unsigned __int8 v5 = v4;

    if (qword_100038BB0 != -1) {
      swift_once();
    }
    uint64_t v6 = sub_100024B38();
    sub_10000612C(v6, (uint64_t)qword_100039FE0);
    uint64_t v7 = sub_100024B18();
    os_log_type_t v8 = sub_100024D68();
    if (os_log_type_enabled(v7, v8))
    {
      os_log_type_t v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "found descriptor identifier on contents", v9, 2u);
      swift_slowDealloc();
    }

    if (v3 == 1852399981 && v5 == (void *)0xE400000000000000 || (sub_100024FC8() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 0;
    }
    else
    {
      swift_bridgeObjectRetain();
      sub_10000E1B8(45, 0xE100000000000000, v3, (unint64_t)v5);
      char v16 = v15;
      swift_bridgeObjectRelease();
      if ((v16 & 1) == 0)
      {
        sub_100024C88();
        swift_bridgeObjectRelease();
        uint64_t v3 = sub_100024C18();
        unsigned __int8 v5 = v17;
        swift_bridgeObjectRelease();
      }
      v18._rawValue = &off_100030E10;
      v21._countAndFlagsBits = v3;
      v21._object = v5;
      unint64_t v19 = sub_100024F98(v18, v21);
      swift_bridgeObjectRelease();
      if (v19 >= 3) {
        return 3;
      }
      else {
        return v19;
      }
    }
  }
  else
  {
    if (qword_100038BB0 != -1) {
      swift_once();
    }
    uint64_t v10 = sub_100024B38();
    sub_10000612C(v10, (uint64_t)qword_100039FE0);
    uint64_t v11 = sub_100024B18();
    os_log_type_t v12 = sub_100024D78();
    if (os_log_type_enabled(v11, v12))
    {
      long long v13 = (uint8_t *)swift_slowAlloc();
      uint64_t v20 = swift_slowAlloc();
      *(_DWORD *)long long v13 = 136315138;
      sub_100010B4C(0x29656E6F6E28, 0xE600000000000000, &v20);
      sub_100024DD8();
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "unknown identifier “%s”", v13, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    return 3;
  }
}

id sub_10000C968(void *a1, uint64_t a2, char a3, uint64_t a4)
{
  if (a3 == 1)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v6 = sub_100024FC8();
    swift_bridgeObjectRelease();
    if ((v6 & 1) == 0) {
      goto LABEL_5;
    }
  }
  [a1 setHandlesWakeAnimation:1];
  uint64_t v7 = self;
  id v8 = [v7 whiteColor];
  id v9 = [v7 darkGrayColor];
  id v10 = [objc_allocWithZone((Class)UIColor) initWithWhite:0.0 alpha:0.6];
  id v11 = [self legibilitySettingsForStyle:1 primaryColor:v8 secondaryColor:v9 shadowColor:v10];

  [a1 setDesiredLegibilitySettings:v11];
LABEL_5:

  return [a1 setPreferredProminentColor:a4];
}

uint64_t sub_10000CB10(uint64_t a1, uint64_t a2, void *a3)
{
  unsigned __int8 v5 = *(void (**)(uint64_t, id))(a1 + 32);
  swift_unknownObjectRetain();
  id v6 = a3;
  v5(a2, v6);

  return swift_unknownObjectRelease();
}

void sub_10000CB78()
{
  swift_beginAccess();
  Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v1 = Strong;
    [Strong noteContentSignificantlyChanged];
  }
}

void sub_10000CC54(void *a1, void *a2, void *a3)
{
  uint64_t v7 = (uint64_t *)(v3 + OBJC_IVAR____TtC20PridePosterExtension17DrawingController_coordinators);
  swift_beginAccess();
  uint64_t v8 = *v7;
  id v9 = a1;
  swift_bridgeObjectRetain();
  uint64_t v10 = sub_10001D190(v9, v8);

  swift_bridgeObjectRelease();
  if (v10)
  {
    sub_10000D838(v9, (char)[a2 isSnapshot]);
    id v11 = [a3 animationSettings];
    sub_100024A68();

    swift_release();
  }
  else
  {
    if (qword_100038BB0 != -1) {
      swift_once();
    }
    uint64_t v12 = sub_100024B38();
    sub_10000612C(v12, (uint64_t)qword_100039FE0);
    long long v13 = sub_100024B18();
    os_log_type_t v14 = sub_100024D78();
    if (os_log_type_enabled(v13, v14))
    {
      char v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)char v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "no renderer to update", v15, 2u);
      swift_slowDealloc();
    }
  }
}

void sub_10000D0CC(void *a1, char a2, char a3)
{
  if (sub_10000D4FC(a3, (uint64_t)&_swiftEmptyArrayStorage))
  {
    id v5 = (id)MobileGestalt_get_current_device();
    if (v5)
    {
      id v6 = v5;
      int appleInternalInstallCapability = MobileGestalt_get_appleInternalInstallCapability();

      if (appleInternalInstallCapability)
      {
        id v8 = [self mainScreen];
        [v8 bounds];
        double v10 = v9;
        double v12 = v11;
        double v14 = v13;
        double v16 = v15;

        id v17 = objc_msgSend(objc_allocWithZone((Class)UIView), "initWithFrame:", v10, v12, v14, v16);
        Swift::OpaquePointer v18 = self;
        id v19 = [v18 blackColor];
        [v17 setBackgroundColor:v19];

        id v20 = [self configurationWithPointSize:100.0];
        NSString v21 = sub_100024BE8();
        id v22 = [self systemImageNamed:v21 withConfiguration:v20];

        id v23 = [objc_allocWithZone((Class)UIImageView) initWithImage:v22];
        [v23 setTranslatesAutoresizingMaskIntoConstraints:0];
        id v24 = [v18 secondaryLabelColor];
        [v23 setTintColor:v24];

        [v17 addSubview:v23];
        sub_100004858(&qword_100038E40);
        uint64_t v25 = swift_allocObject();
        *(_OWORD *)(v25 + 16) = xmmword_1000268D0;
        sub_100006164(0, &qword_1000390D0);
        uint64_t v26 = sub_100006164(0, &qword_1000390D8);
        uint64_t v40 = v26;
        v39[0] = v23;
        uint64_t v27 = sub_100006164(0, &qword_1000390E0);
        uint64_t v38 = v27;
        v37[0] = v17;
        id v28 = v23;
        char v36 = a2;
        id v29 = v17;
        *(void *)(v25 + 32) = sub_10000D664(v39, 9, 0, v37, 9, 1.0, 0.0);
        uint64_t v40 = v26;
        uint64_t v38 = v27;
        v39[0] = v28;
        v37[0] = v29;
        id v30 = v28;
        id v31 = v29;
        *(void *)(v25 + 40) = sub_10000D664(v39, 10, 0, v37, 10, 1.0, 0.0);
        v39[0] = v25;
        sub_100024CC8();
        Class isa = sub_100024CA8().super.isa;
        swift_bridgeObjectRelease();
        [v31 addConstraints:isa];

        id v33 = [a1 foregroundView];
        [v33 addSubview:v31];

        swift_beginAccess();
        id v34 = v31;
        id v35 = a1;
        sub_10001F15C((uint64_t)v34, (uint64_t)v35);
        swift_endAccess();

        sub_10000D838(v35, v36 & 1);
      }
    }
    else
    {
      __break(1u);
    }
  }
}

uint64_t sub_10000D4FC(char a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  if (!v2) {
    return 0;
  }
  swift_bridgeObjectRetain();
  uint64_t v5 = 0;
  while (1)
  {
    uint64_t v6 = a2 + v5++;
    int v7 = *(unsigned __int8 *)(v6 + 32);
    if (v7 == 1) {
      uint64_t v8 = 0x656C636974726170;
    }
    else {
      uint64_t v8 = 0x73746867696CLL;
    }
    unint64_t v9 = 0xE900000000000073;
    if (v7 != 1) {
      unint64_t v9 = 0xE600000000000000;
    }
    uint64_t v10 = v7 ? v8 : 0x73657069727473;
    unint64_t v11 = v7 ? v9 : 0xE700000000000000;
    if (a1)
    {
      if (a1 == 1) {
        uint64_t v12 = 0x656C636974726170;
      }
      else {
        uint64_t v12 = 0x73746867696CLL;
      }
      if (a1 == 1) {
        unint64_t v13 = 0xE900000000000073;
      }
      else {
        unint64_t v13 = 0xE600000000000000;
      }
      if (v10 != v12) {
        goto LABEL_25;
      }
    }
    else
    {
      unint64_t v13 = 0xE700000000000000;
      if (v10 != 0x73657069727473) {
        goto LABEL_25;
      }
    }
    if (v11 == v13)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      return 1;
    }
LABEL_25:
    char v14 = sub_100024FC8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v14) {
      break;
    }
    if (v2 == v5)
    {
      swift_bridgeObjectRelease();
      return 0;
    }
  }
  swift_bridgeObjectRelease();
  return 1;
}

id sub_10000D664(void *a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, double a6, double a7)
{
  sub_10000DE90(a1, a1[3]);
  uint64_t v14 = sub_100024FB8();
  uint64_t v15 = a4[3];
  if (v15)
  {
    double v16 = sub_10000DE90(a4, a4[3]);
    uint64_t v24 = a5;
    uint64_t v25 = a2;
    uint64_t v17 = a3;
    uint64_t v18 = *(void *)(v15 - 8);
    __chkstk_darwin(v16, v16);
    id v20 = (char *)&v24 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v18 + 16))(v20);
    uint64_t v21 = sub_100024FB8();
    (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v15);
    a3 = v17;
    a5 = v24;
    a2 = v25;
    sub_10000DED4((uint64_t)a4);
  }
  else
  {
    uint64_t v21 = 0;
  }
  id v22 = [(id)swift_getObjCClassFromMetadata() constraintWithItem:v14 attribute:a2 relatedBy:a3 toItem:v21 attribute:a5 multiplier:a6 constant:a7];
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  sub_10000DED4((uint64_t)a1);
  return v22;
}

void sub_10000D838(void *a1, char a2)
{
  id v5 = (id)MobileGestalt_get_current_device();
  if (!v5)
  {
    __break(1u);
    return;
  }
  uint64_t v6 = v5;
  int appleInternalInstallCapability = MobileGestalt_get_appleInternalInstallCapability();

  if (appleInternalInstallCapability)
  {
    uint64_t v8 = (uint64_t *)(v2 + OBJC_IVAR____TtC20PridePosterExtension17DrawingController_sensitiveUIOverlays);
    swift_beginAccess();
    uint64_t v9 = *v8;
    id v10 = a1;
    swift_bridgeObjectRetain();
    unint64_t v11 = sub_10001D0B8(v10, v9);

    swift_bridgeObjectRelease();
    if (v11)
    {
      id v12 = objc_allocWithZone((Class)NSUserDefaults);
      NSString v13 = sub_100024BE8();
      id v14 = [v12 initWithSuiteName:v13];

      if (v14)
      {
        NSString v15 = sub_100024BE8();
        id v16 = [v14 objectForKey:v15];

        if (v16)
        {
          sub_100024DF8();
          swift_unknownObjectRelease();
          sub_10000DE34((uint64_t)&v20, (uint64_t *)&unk_1000390C0);
          NSString v17 = sub_100024BE8();
          unsigned __int8 v18 = [v14 BOOLForKey:v17];

          char v19 = v18 | a2;
LABEL_9:
          objc_msgSend(v11, "setHidden:", v19 & 1, v20, v21);

          return;
        }
        long long v20 = 0u;
        long long v21 = 0u;

        sub_10000DE34((uint64_t)&v20, (uint64_t *)&unk_1000390C0);
      }
      char v19 = 1;
      goto LABEL_9;
    }
  }
}

uint64_t sub_10000DA28()
{
  BOOL IsReduceMotionEnabled = UIAccessibilityIsReduceMotionEnabled();
  uint64_t v2 = (unint64_t *)(v0 + OBJC_IVAR____TtC20PridePosterExtension17DrawingController_coordinators);
  swift_beginAccess();
  unint64_t v3 = *v2;
  if ((v3 & 0xC000000000000001) != 0)
  {
    unint64_t v23 = 0;
    uint64_t v4 = 0;
    unint64_t v5 = 0;
    unint64_t v6 = sub_100024ED8() | 0x8000000000000000;
  }
  else
  {
    uint64_t v7 = -1 << *(unsigned char *)(v3 + 32);
    uint64_t v4 = ~v7;
    unint64_t v23 = v3 + 64;
    uint64_t v8 = -v7;
    if (v8 < 64) {
      uint64_t v9 = ~(-1 << v8);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v5 = v9 & *(void *)(v3 + 64);
    unint64_t v6 = v3;
  }
  uint64_t result = swift_bridgeObjectRetain();
  uint64_t v11 = 0;
  int64_t v12 = (unint64_t)(v4 + 64) >> 6;
  while ((v6 & 0x8000000000000000) != 0)
  {
    if (!sub_100024F08()) {
      return sub_10000DE2C();
    }
    uint64_t v18 = v17;
    sub_100006164(0, &qword_100038FE0);
    swift_unknownObjectRetain();
    swift_dynamicCast();
    id v19 = (id)v25[0];
    swift_unknownObjectRelease();
    uint64_t v24 = v18;
    sub_100024AA8();
    swift_unknownObjectRetain();
    swift_dynamicCast();
    swift_unknownObjectRelease();
    uint64_t v16 = v11;
    uint64_t v14 = v5;
    if (!v19) {
      return sub_10000DE2C();
    }
LABEL_33:

    sub_100024A98();
    if (v25[3])
    {
      sub_100004858((uint64_t *)&unk_1000390B0);
      type metadata accessor for PrideLightsRenderer();
      if (swift_dynamicCast())
      {
        *(unsigned char *)(v24 + OBJC_IVAR____TtC20PridePosterExtension19PrideLightsRenderer_reduceMotion) = IsReduceMotionEnabled;
        if (IsReduceMotionEnabled)
        {
          if (qword_100038B88 != -1) {
            swift_once();
          }
          char v13 = (byte_1000391D0 & 1) == 0;
        }
        else
        {
          char v13 = 2;
        }
        *(unsigned char *)(*(void *)(v24 + OBJC_IVAR____TtC20PridePosterExtension19PrideLightsRenderer_cameraController) + 19) = v13;
        swift_release();
      }
      uint64_t result = swift_release();
    }
    else
    {
      swift_release();
      uint64_t result = sub_10000DE34((uint64_t)v25, &qword_1000390A8);
    }
    uint64_t v11 = v16;
    unint64_t v5 = v14;
  }
  if (v5)
  {
    uint64_t v14 = (v5 - 1) & v5;
    unint64_t v15 = __clz(__rbit64(v5)) | (v11 << 6);
    uint64_t v16 = v11;
LABEL_32:
    id v19 = *(id *)(*(void *)(v6 + 48) + 8 * v15);
    swift_retain();
    if (!v19) {
      return sub_10000DE2C();
    }
    goto LABEL_33;
  }
  int64_t v20 = v11 + 1;
  if (!__OFADD__(v11, 1))
  {
    if (v20 >= v12) {
      return sub_10000DE2C();
    }
    unint64_t v21 = *(void *)(v23 + 8 * v20);
    uint64_t v16 = v11 + 1;
    if (!v21)
    {
      uint64_t v16 = v11 + 2;
      if (v11 + 2 >= v12) {
        return sub_10000DE2C();
      }
      unint64_t v21 = *(void *)(v23 + 8 * v16);
      if (!v21)
      {
        uint64_t v16 = v11 + 3;
        if (v11 + 3 >= v12) {
          return sub_10000DE2C();
        }
        unint64_t v21 = *(void *)(v23 + 8 * v16);
        if (!v21)
        {
          uint64_t v16 = v11 + 4;
          if (v11 + 4 >= v12) {
            return sub_10000DE2C();
          }
          unint64_t v21 = *(void *)(v23 + 8 * v16);
          if (!v21)
          {
            uint64_t v22 = v11 + 5;
            while (v12 != v22)
            {
              unint64_t v21 = *(void *)(v23 + 8 * v22++);
              if (v21)
              {
                uint64_t v16 = v22 - 1;
                goto LABEL_31;
              }
            }
            return sub_10000DE2C();
          }
        }
      }
    }
LABEL_31:
    uint64_t v14 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v16 << 6);
    goto LABEL_32;
  }
  __break(1u);
  return result;
}

uint64_t type metadata accessor for DrawingController()
{
  return self;
}

uint64_t sub_10000DE2C()
{
  return swift_release();
}

uint64_t sub_10000DE34(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100004858(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void *sub_10000DE90(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_10000DED4(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_10000DF24()
{
  return _swift_deallocObject(v0, 32, 7);
}

id sub_10000DF5C(void *a1, uint64_t a2)
{
  return sub_10000C968(a1, a2, *(unsigned char *)(v2 + 16), *(void *)(v2 + 24));
}

uint64_t sub_10000DF68()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000DF78()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_10000DFA0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10000DFB0()
{
  return swift_release();
}

uint64_t sub_10000DFB8(uint64_t a1)
{
  return a1;
}

uint64_t sub_10000DFE4()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_10000E01C()
{
}

uint64_t sub_10000E024(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_10000E034(unint64_t *a1, void (*a2)(uint64_t))
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

id sub_10000E07C(char a1)
{
  switch(a1)
  {
    case 1:
      id v1 = objc_allocWithZone((Class)UIColor);
      double v3 = 0.435294118;
      double v4 = 0.752941176;
      goto LABEL_7;
    case 2:
      id v1 = objc_allocWithZone((Class)UIColor);
      double v2 = 0.874509804;
      double v3 = 0.376470588;
      double v4 = 1.0;
      break;
    case 3:
      id v1 = objc_allocWithZone((Class)UIColor);
      double v2 = 0.91372549;
      double v3 = 0.619607843;
      double v4 = 1.0;
      break;
    case 4:
      id v1 = objc_allocWithZone((Class)UIColor);
      double v3 = 0.929411765;
      double v4 = 0.545098039;
LABEL_7:
      double v2 = 1.0;
      break;
    default:
      id v1 = objc_allocWithZone((Class)UIColor);
      double v2 = 0.980392157;
      double v3 = 0.423529412;
      double v4 = 1.0;
      break;
  }

  return [v1 initWithRed:v2 green:v3 blue:v4 alpha:1.0];
}

unint64_t sub_10000E1B8(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v4 = HIBYTE(a4) & 0xF;
  if ((a4 & 0x2000000000000000) == 0) {
    uint64_t v4 = a3 & 0xFFFFFFFFFFFFLL;
  }
  if (!v4) {
    return 0;
  }
  uint64_t v7 = 4 * v4;
  unint64_t v8 = 15;
  while (sub_100024C78() != a1 || v9 != a2)
  {
    char v10 = sub_100024FC8();
    swift_bridgeObjectRelease();
    if (v10) {
      return v8;
    }
    unint64_t v8 = sub_100024C48();
    if (v7 == v8 >> 14) {
      return 0;
    }
  }
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t sub_10000E2A8()
{
  uint64_t v0 = sub_100004858((uint64_t *)&unk_1000393A0);
  sub_100011928(v0, qword_100039F80);
  uint64_t v1 = sub_10000612C(v0, (uint64_t)qword_100039F80);
  uint64_t v2 = sub_100024AB8();
  double v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);

  return v3(v1, 1, 1, v2);
}

uint64_t sub_10000E340(unsigned __int8 *a1, char *a2)
{
  return sub_1000062C4(*a1, *a2);
}

Swift::Int sub_10000E34C()
{
  return sub_100025068();
}

uint64_t sub_10000E41C()
{
  sub_100024C28();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_10000E4D4()
{
  return sub_100025068();
}

uint64_t sub_10000E5A0@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_1000111A4(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

void sub_10000E5D0(uint64_t *a1@<X8>)
{
  uint64_t v2 = 6647407;
  switch(*v1)
  {
    case 1:
      uint64_t v2 = 7305076;
      goto LABEL_3;
    case 2:
      *a1 = 0x6565726874;
      a1[1] = 0xE500000000000000;
      break;
    case 3:
      *a1 = 1920298854;
      a1[1] = 0xE400000000000000;
      break;
    case 4:
      *a1 = 1702259046;
      a1[1] = 0xE400000000000000;
      break;
    default:
LABEL_3:
      *a1 = v2;
      a1[1] = 0xE300000000000000;
      break;
  }
}

void sub_10000E664(void *a1@<X8>)
{
  *a1 = &off_100030F10;
}

void sub_10000E674()
{
  id v0 = [self currentDevice];
  id v1 = [v0 userInterfaceIdiom];

  byte_1000391D0 = v1 == (id)1;
}

void sub_10000E6D8(void *a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7 = v6;
  uint64_t v108 = a6;
  uint64_t v13 = sub_100004858((uint64_t *)&unk_100039380);
  __chkstk_darwin(v13 - 8, v14);
  uint64_t v16 = (char *)&v92 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_100024898();
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v106 = v17;
  uint64_t v107 = v18;
  uint64_t v20 = __chkstk_darwin(v17, v19);
  float32x4_t v100 = (char *)&v92 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = __chkstk_darwin(v20, v22);
  uint64_t v25 = (char *)&v92 - v24;
  __chkstk_darwin(v23, v26);
  uint64_t v103 = (char *)&v92 - v27;
  v7[2] = 0;
  v7[3] = 0;
  id v28 = (char *)v7 + OBJC_IVAR____TtC20PridePosterExtension19PrideLightsRenderer_lastNonSnapshotState;
  sub_1000249E8();
  *((unsigned char *)v7 + OBJC_IVAR____TtC20PridePosterExtension19PrideLightsRenderer_lastUnlockTransitionWasToUnlocked) = 0;
  *((unsigned char *)v7 + OBJC_IVAR____TtC20PridePosterExtension19PrideLightsRenderer_reduceMotion) = 0;
  id v29 = (uint64_t *)((char *)v7 + OBJC_IVAR____TtC20PridePosterExtension19PrideLightsRenderer_instanceIdentifier);
  uint64_t v102 = a2;
  uint64_t *v29 = a2;
  v29[1] = a3;
  id v30 = v29;
  swift_bridgeObjectRetain();
  id v31 = [a1 newDefaultLibrary];
  if (!v31)
  {
    swift_bridgeObjectRelease();
    sub_100008664();
    swift_allocError();
    *id v58 = 0;
    swift_willThrow();
LABEL_13:
    Swift::String v54 = v28;
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    sub_10000E024(v7[2]);
    goto LABEL_21;
  }
  id v104 = v31;
  v105 = (void *)a3;
  id v93 = self;
  uint64_t v97 = a4;
  uint64_t v98 = a5;
  id v32 = [v93 texture2DDescriptorWithPixelFormat:92 width:a4 height:a5 mipmapped:0];
  id v109 = a1;
  [v32 setSampleCount:2];
  [v32 setUsage:4];
  if ([v109 supportsFamily:1004]) {
    uint64_t v33 = 3;
  }
  else {
    uint64_t v33 = 2;
  }
  id v34 = v109;
  [v32 setStorageMode:v33];
  [v32 setTextureType:4];
  id v35 = [v34 newTextureWithDescriptor:v32];
  if (!v35)
  {
    swift_bridgeObjectRelease();
    sub_100008664();
    swift_allocError();
    *id v59 = 1;
    swift_willThrow();
    swift_unknownObjectRelease();

    goto LABEL_13;
  }
  id v99 = v32;
  id v95 = v28;
  v96 = v30;
  v7[4] = (uint64_t)v35;
  id v36 = v35;
  uint64_t v37 = self;
  id v94 = v36;
  swift_unknownObjectRetain();
  id v38 = [v37 mainBundle];
  NSString v39 = sub_100024BE8();
  NSString v40 = sub_100024BE8();
  id v41 = [v38 URLForResource:v39 withExtension:v40];

  if (!v41)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v107 + 56))(v16, 1, 1, v106);
    goto LABEL_15;
  }
  sub_100024888();

  uint64_t v42 = v107;
  unint64_t v43 = *(void (**)(char *, char *, uint64_t))(v107 + 32);
  float v44 = v25;
  uint64_t v45 = v106;
  v43(v16, v44, v106);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v42 + 56))(v16, 0, 1, v45);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v42 + 48))(v16, 1, v45) == 1)
  {
LABEL_15:
    swift_bridgeObjectRelease();
    sub_10000DE34((uint64_t)v16, (uint64_t *)&unk_100039380);
    sub_100008664();
    swift_allocError();
    *id v60 = 0;
    swift_willThrow();
    swift_unknownObjectRelease();

    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    int v55 = 0;
    int v56 = 0;
    int v57 = 0;
LABEL_16:
    Swift::String v54 = v95;
LABEL_17:
    sub_10000E024(v7[2]);
    swift_unknownObjectRelease();
    if (v55)
    {
      swift_release();
      if ((v56 & 1) == 0) {
        goto LABEL_19;
      }
    }
    else if (!v56)
    {
LABEL_19:
      if (v57) {
LABEL_20:
      }
        swift_release();
LABEL_21:
      uint64_t v61 = sub_1000249F8();
      (*(void (**)(char *, uint64_t))(*(void *)(v61 - 8) + 8))(v54, v61);
      swift_bridgeObjectRelease();
      type metadata accessor for PrideLightsRenderer();
      swift_deallocPartialClassInstance();
      return;
    }
    swift_unknownObjectRelease();
    if ((v57 & 1) == 0) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
  long long v46 = v103;
  v43(v103, v16, v45);
  uint64_t v47 = v100;
  (*(void (**)(char *, char *, uint64_t))(v42 + 16))(v100, v46, v45);
  float v48 = (float)v97 / (float)v98;
  id v49 = v109;
  swift_unknownObjectRetain();
  uint64_t v50 = sub_100011248(v102, (unint64_t)v105);
  type metadata accessor for PrideLightsTextMeshDrawer();
  swift_allocObject();
  id v51 = v101;
  uint64_t v52 = sub_100006440(v47, (uint64_t)v49, (void *)0x5C, 2, 18, v50, v48);
  uint64_t v53 = v42;
  Swift::String v54 = v95;
  if (v51)
  {
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();

    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
    (*(void (**)(char *, uint64_t))(v53 + 8))(v46, v45);
    int v55 = 0;
LABEL_10:
    int v56 = 0;
    int v57 = 0;
    goto LABEL_17;
  }
  v7[5] = v52;
  uint64_t v62 = v97;
  uint64_t v63 = v98;
  id v64 = [v93 texture2DDescriptorWithPixelFormat:92 width:v97 height:v98 mipmapped:0];
  [v64 setUsage:5];
  [v64 setStorageMode:2];
  uint64_t v65 = (char *)[v49 newTextureWithDescriptor:v64];
  if (!v65)
  {
    id v74 = v99;
    swift_bridgeObjectRelease();
    sub_100008664();
    swift_allocError();
    int v55 = 1;
    *unint64_t v75 = 1;
    swift_willThrow();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();

    swift_unknownObjectRelease();
    (*(void (**)(char *, uint64_t))(v107 + 8))(v103, v45);
    goto LABEL_10;
  }
  id v101 = v64;
  v7[6] = (uint64_t)v65;
  if (v62 >= 0) {
    uint64_t v66 = v62;
  }
  else {
    uint64_t v66 = v62 + 1;
  }
  uint64_t v67 = v66 >> 1;
  if (v63 >= 0) {
    uint64_t v68 = v63;
  }
  else {
    uint64_t v68 = v63 + 1;
  }
  uint64_t v69 = v49;
  uint64_t v70 = v68 >> 1;
  id v71 = v65;
  type metadata accessor for PrideLightsBloomer();
  swift_allocObject();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  id v72 = v104;
  swift_unknownObjectRetain();
  sub_100015A68(v69, v72, v67, v70);
  float32x4_t v100 = v71;
  v7[7] = v73;
  id v76 = [objc_allocWithZone((Class)MTLRenderPipelineDescriptor) init];
  NSString v77 = sub_100024BE8();
  id v78 = [v72 newFunctionWithName:v77];

  [v76 setVertexFunction:v78];
  swift_unknownObjectRelease();
  NSString v79 = sub_100024BE8();
  id v80 = [v72 newFunctionWithName:v79];

  [v76 setFragmentFunction:v80];
  swift_unknownObjectRelease();
  id v81 = [v76 colorAttachments];
  id v82 = [v81 objectAtIndexedSubscript:0];

  if (!v82)
  {
    __break(1u);
    return;
  }
  [v82 setPixelFormat:81];
  id v110 = 0;
  id v83 = [v109 newRenderPipelineStateWithDescriptor:v76 error:&v110];
  id v84 = v110;
  uint64_t v85 = v105;
  uint64_t v86 = v102;
  if (!v83)
  {
    id v91 = v110;
    swift_bridgeObjectRelease();
    sub_100024868();

    swift_willThrow();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();

    swift_unknownObjectRelease();
    (*(void (**)(char *, uint64_t))(v107 + 8))(v103, v106);
    int v55 = 1;
    int v56 = 1;
    int v57 = 1;
    goto LABEL_16;
  }
  v7[8] = (uint64_t)v83;
  id v87 = v84;
  v111._countAndFlagsBits = v86;
  v111._object = v85;
  char v88 = sub_1000113F0(v111);
  swift_bridgeObjectRelease();
  if (qword_100038B88 != -1) {
    swift_once();
  }
  char v89 = byte_1000391D0;
  type metadata accessor for PrideLightsCameraController();
  float64_t v90 = (unsigned char *)swift_allocObject();
  v90[17] = 21;
  v90[19] = 2;
  v90[16] = v88;
  v90[18] = v89;
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
  (*(void (**)(char *, uint64_t))(v107 + 8))(v103, v106);
  *(uint64_t *)((char *)v7 + OBJC_IVAR____TtC20PridePosterExtension19PrideLightsRenderer_cameraController) = (uint64_t)v90;
}

void sub_10000F2B0(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v5 = v4;
  uint64_t v69 = a2;
  uint64_t v77 = a1;
  uint64_t v76 = sub_100024AD8();
  uint64_t v78 = *(void *)(v76 - 8);
  __chkstk_darwin(v76, v7);
  unint64_t v75 = (char *)&v68 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v74 = sub_100024B08();
  uint64_t v73 = *(void *)(v74 - 8);
  __chkstk_darwin(v74, v9);
  id v72 = (char *)&v68 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1000249C8();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v14 = __chkstk_darwin(v11, v13);
  uint64_t v16 = (uint64_t *)((char *)&v68 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v14, v17);
  uint64_t v19 = (uint64_t *)((char *)&v68 - v18);
  id v20 = [objc_allocWithZone((Class)MTLRenderPassDescriptor) init];
  id v21 = [v20 colorAttachments];
  id v22 = [v21 objectAtIndexedSubscript:0];

  if (v22)
  {
    [v22 setTexture:*(void *)(v5 + 32)];
    uint64_t v79 = *(void *)(v5 + 48);
    uint64_t v80 = v5;
    objc_msgSend(v22, "setResolveTexture:");
    [v22 setLoadAction:2];
    objc_msgSend(v22, "setClearColor:", 0.0, 0.0, 0.0, 1.0);
    [v22 setStoreAction:2];
    id v81 = a4;
    id v82 = [a4 renderCommandEncoderWithDescriptor:v20];
    if (!v82)
    {

      return;
    }
    id v70 = v22;
    id v71 = v20;
    uint64_t v23 = v77;
    sub_1000249D8();
    uint64_t v24 = *(unsigned int (**)(uint64_t *, uint64_t))(v12 + 88);
    if (v24(v19, v11) == enum case for WallpaperMetalCoordination.WallpaperState.Look.constant(_:))
    {
      (*(void (**)(uint64_t *, uint64_t))(v12 + 96))(v19, v11);
      uint64_t v26 = *v19;
      uint64_t v25 = (void *)v19[1];
      swift_bridgeObjectRetain();
      unsigned __int8 v27 = sub_1000111A4(v26, v25);
      uint64_t v28 = v76;
      if (v27 == 5)
      {
        unsigned __int8 v29 = sub_1000111F0();
        if (v29 == 5) {
          unsigned __int8 v30 = 0;
        }
        else {
          unsigned __int8 v30 = v29;
        }
      }
      else
      {
        unsigned __int8 v30 = v27;
        swift_bridgeObjectRelease();
      }
      uint64_t v41 = v80;
      uint64_t v42 = v82;
      uint64_t v39 = v83;
    }
    else
    {
      id v31 = *(void (**)(uint64_t *, uint64_t))(v12 + 8);
      v31(v19, v11);
      sub_1000249D8();
      if (v24(v16, v11) == enum case for WallpaperMetalCoordination.WallpaperState.Look.transitioning(_:))
      {
        (*(void (**)(uint64_t *, uint64_t))(v12 + 96))(v16, v11);
        uint64_t v33 = *v16;
        unint64_t v32 = v16[1];
        unint64_t v34 = v16[3];
        uint64_t v68 = v16[2];
        if (qword_100038BB0 != -1) {
          swift_once();
        }
        uint64_t v35 = sub_100024B38();
        sub_10000612C(v35, (uint64_t)qword_100039FE0);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        id v36 = sub_100024B18();
        os_log_type_t v37 = sub_100024D78();
        BOOL v38 = os_log_type_enabled(v36, v37);
        uint64_t v39 = v83;
        if (v38)
        {
          uint64_t v40 = swift_slowAlloc();
          v85[0] = swift_slowAlloc();
          *(_DWORD *)uint64_t v40 = 136315394;
          swift_bridgeObjectRetain();
          uint64_t v84 = sub_100010B4C(v33, v32, v85);
          sub_100024DD8();
          swift_bridgeObjectRelease_n();
          *(_WORD *)(v40 + 12) = 2080;
          swift_bridgeObjectRetain();
          uint64_t v84 = sub_100010B4C(v68, v34, v85);
          sub_100024DD8();
          swift_bridgeObjectRelease_n();
          _os_log_impl((void *)&_mh_execute_header, v36, v37, "unexpected look %s → %s", (uint8_t *)v40, 0x16u);
          swift_arrayDestroy();
          swift_slowDealloc();
          uint64_t v39 = v83;
          swift_slowDealloc();
        }
        else
        {

          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease_n();
        }
        unsigned __int8 v30 = 0;
      }
      else
      {
        v31(v16, v11);
        unsigned __int8 v30 = 0;
        uint64_t v39 = v83;
      }
      uint64_t v41 = v80;
      uint64_t v42 = v82;
      uint64_t v28 = v76;
    }
    uint64_t v43 = v78;
    float v44 = v72;
    sub_100024968();
    sub_100024AF8();
    double v46 = v45;
    (*(void (**)(char *, uint64_t))(v73 + 8))(v44, v74);
    float v47 = v46;
    float v48 = v75;
    sub_100024978();
    sub_100024AC8();
    double v50 = v49;
    (*(void (**)(char *, uint64_t))(v43 + 8))(v48, v28);
    float v51 = v50;
    if ((sub_100024998() & 1) == 0) {
      sub_10000FD7C();
    }
    if (*(unsigned char *)(v41 + OBJC_IVAR____TtC20PridePosterExtension19PrideLightsRenderer_reduceMotion))
    {
      float v51 = 0.0;
      float v52 = 0.0;
    }
    else
    {
      float v52 = (float)(v47 * 0.08) + (float)(v51 * 0.2);
    }
    sub_100018898((uint64_t)v86);
    sub_100008198((unint64_t)v42, v30, (uint64_t)v86, v47, v52, v51);
    [v42 endEncoding];
    uint64_t v53 = sub_1000162C4(v79, v81);
    if (v39)
    {
      if ((sub_100024998() & 1) == 0)
      {
        uint64_t v54 = v41 + OBJC_IVAR____TtC20PridePosterExtension19PrideLightsRenderer_lastNonSnapshotState;
        swift_beginAccess();
        uint64_t v55 = sub_1000249F8();
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v55 - 8) + 24))(v54, v23, v55);
        swift_endAccess();
      }
LABEL_33:
      swift_unknownObjectRelease();

      return;
    }
    uint64_t v56 = v53;
    id v57 = objc_allocWithZone((Class)MTLRenderPassDescriptor);
    swift_unknownObjectRetain();
    id v58 = [v57 init];
    id v59 = [v58 colorAttachments];
    id v60 = [v59 objectAtIndexedSubscript:0];

    if (v60)
    {
      [v60 setLoadAction:0];
      [v60 setStoreAction:1];
      [v60 setTexture:v69];
      id v61 = [v81 renderCommandEncoderWithDescriptor:v58];
      if (v61)
      {
        uint64_t v62 = v61;
        uint64_t v83 = 0;
        swift_getObjectType();
        uint64_t v63 = v80;
        [v62 setRenderPipelineState:*(void *)(v80 + 64)];
        [v62 setFragmentTexture:v79 atIndex:0];
        [v62 setFragmentTexture:v56 atIndex:1];
        sub_100004138();
        [v62 endEncoding];
        swift_unknownObjectRelease();

        swift_unknownObjectRelease();
        if ((sub_100024998() & 1) == 0)
        {
          uint64_t v64 = v63 + OBJC_IVAR____TtC20PridePosterExtension19PrideLightsRenderer_lastNonSnapshotState;
          swift_beginAccess();
          uint64_t v65 = sub_1000249F8();
          (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v65 - 8) + 24))(v64, v23, v65);
          swift_endAccess();
        }
      }
      else
      {
        swift_unknownObjectRelease();

        if ((sub_100024998() & 1) == 0)
        {
          uint64_t v66 = v80 + OBJC_IVAR____TtC20PridePosterExtension19PrideLightsRenderer_lastNonSnapshotState;
          swift_beginAccess();
          uint64_t v67 = sub_1000249F8();
          (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v67 - 8) + 24))(v66, v23, v67);
          swift_endAccess();
        }
      }
      goto LABEL_33;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

void sub_10000FD7C()
{
  uint64_t v0 = sub_100024B08();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0, v2);
  uint64_t v4 = (char *)&v56 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1000249F8();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5, v7);
  uint64_t v9 = (char *)&v56 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100024AD8();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10, v12);
  uint64_t v14 = (char *)&v56 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100038B88 != -1) {
    swift_once();
  }
  if (byte_1000391D0)
  {
    sub_100024968();
    sub_100024AE8();
    double v16 = v15;
    uint64_t v17 = *(void (**)(char *, uint64_t))(v1 + 8);
    v17(v4, v0);
    if (v16 != 0.0)
    {
      uint64_t v18 = v56 + OBJC_IVAR____TtC20PridePosterExtension19PrideLightsRenderer_lastNonSnapshotState;
      swift_beginAccess();
      (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v9, v18, v5);
      sub_100024968();
      (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
      sub_100024AE8();
      double v20 = v19;
      v17(v4, v0);
      if (v20 == 0.0)
      {
        uint64_t v21 = v56;
        id v22 = *(void (**)(uint64_t))(v56 + 16);
        if (v22)
        {
          uint64_t v23 = swift_retain();
          v22(v23);
          sub_10000E024((uint64_t)v22);
        }
        uint64_t v24 = *(void *)(v21 + OBJC_IVAR____TtC20PridePosterExtension19PrideLightsRenderer_cameraController);
        sub_100018B84();
        LOBYTE(v24) = *(unsigned char *)(v24 + 16);
        id v25 = [self standardUserDefaults];
        sub_100016BB0(v24);
        NSString v26 = sub_100024BE8();
        swift_bridgeObjectRelease();
        Swift::String v59 = *(Swift::String *)(v21 + OBJC_IVAR____TtC20PridePosterExtension19PrideLightsRenderer_instanceIdentifier);
        uint64_t v57 = 0x2D73746867696CLL;
        unint64_t v58 = 0xE700000000000000;
        sub_100024C58(v59);
        v60._countAndFlagsBits = 45;
        v60._object = (void *)0xE100000000000000;
        sub_100024C58(v60);
        v61._object = (void *)0x8000000100025EF0;
        v61._countAndFlagsBits = 0xD000000000000010;
        sub_100024C58(v61);
        NSString v27 = sub_100024BE8();
        swift_bridgeObjectRelease();
        [v25 setObject:v26 forKey:v27];
      }
    }
    return;
  }
  sub_100024978();
  sub_100024AC8();
  double v29 = v28;
  unsigned __int8 v30 = *(void (**)(char *, uint64_t))(v11 + 8);
  v30(v14, v10);
  float v31 = v29;
  uint64_t v32 = v56;
  uint64_t v33 = v56 + OBJC_IVAR____TtC20PridePosterExtension19PrideLightsRenderer_lastNonSnapshotState;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v9, v33, v5);
  sub_100024978();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  sub_100024AC8();
  double v35 = v34;
  v30(v14, v10);
  float v36 = v35;
  if (v31 == 0.0)
  {
    if (v36 != 0.0)
    {
      uint64_t v37 = OBJC_IVAR____TtC20PridePosterExtension19PrideLightsRenderer_lastUnlockTransitionWasToUnlocked;
      if (*(unsigned char *)(v32 + OBJC_IVAR____TtC20PridePosterExtension19PrideLightsRenderer_lastUnlockTransitionWasToUnlocked) == 1)
      {
        if (qword_100038BB0 != -1) {
          swift_once();
        }
        uint64_t v38 = sub_100024B38();
        sub_10000612C(v38, (uint64_t)qword_100039FE0);
        uint64_t v39 = sub_100024B18();
        os_log_type_t v40 = sub_100024D68();
        if (os_log_type_enabled(v39, v40))
        {
          uint64_t v41 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v41 = 0;
          _os_log_impl((void *)&_mh_execute_header, v39, v40, "finished lock transition", v41, 2u);
          swift_slowDealloc();
        }

        sub_100018B84();
        *(unsigned char *)(v32 + v37) = 0;
        return;
      }
    }
  }
  else if (v36 == 0.0)
  {
    uint64_t v42 = *(void (**)(uint64_t))(v32 + 16);
    if (v42)
    {
      uint64_t v43 = swift_retain();
      v42(v43);
      sub_10000E024((uint64_t)v42);
    }
  }
  if (v31 == 1.0 && v36 != 1.0)
  {
    uint64_t v45 = OBJC_IVAR____TtC20PridePosterExtension19PrideLightsRenderer_lastUnlockTransitionWasToUnlocked;
    if ((*(unsigned char *)(v56 + OBJC_IVAR____TtC20PridePosterExtension19PrideLightsRenderer_lastUnlockTransitionWasToUnlocked) & 1) == 0)
    {
      uint64_t v46 = v56;
      uint64_t v47 = *(void *)(v56 + OBJC_IVAR____TtC20PridePosterExtension19PrideLightsRenderer_cameraController);
      int v48 = *(unsigned __int8 *)(v47 + 17);
      if (v48 == 21) {
        LOBYTE(v48) = *(unsigned char *)(v47 + 16);
      }
      else {
        *(unsigned char *)(v47 + 16) = v48;
      }
      *(unsigned char *)(v47 + 17) = 21;
      if (qword_100038BB0 != -1) {
        swift_once();
      }
      uint64_t v49 = sub_100024B38();
      sub_10000612C(v49, (uint64_t)qword_100039FE0);
      double v50 = sub_100024B18();
      os_log_type_t v51 = sub_100024D68();
      if (os_log_type_enabled(v50, v51))
      {
        float v52 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)float v52 = 0;
        _os_log_impl((void *)&_mh_execute_header, v50, v51, "finished unlock transition", v52, 2u);
        swift_slowDealloc();
      }

      id v53 = [self standardUserDefaults];
      sub_100016BB0(v48);
      NSString v54 = sub_100024BE8();
      swift_bridgeObjectRelease();
      Swift::String v62 = *(Swift::String *)(v46 + OBJC_IVAR____TtC20PridePosterExtension19PrideLightsRenderer_instanceIdentifier);
      uint64_t v57 = 0x2D73746867696CLL;
      unint64_t v58 = 0xE700000000000000;
      sub_100024C58(v62);
      v63._countAndFlagsBits = 45;
      v63._object = (void *)0xE100000000000000;
      sub_100024C58(v63);
      v64._object = (void *)0x8000000100025EF0;
      v64._countAndFlagsBits = 0xD000000000000010;
      sub_100024C58(v64);
      NSString v55 = sub_100024BE8();
      swift_bridgeObjectRelease();
      [v53 setObject:v54 forKey:v55];

      *(unsigned char *)(v46 + v45) = 1;
    }
  }
}

uint64_t sub_100010510()
{
  sub_10000E024(*(void *)(v0 + 16));
  swift_unknownObjectRelease();
  swift_release();
  swift_unknownObjectRelease();
  swift_release();
  swift_unknownObjectRelease();
  uint64_t v1 = v0 + OBJC_IVAR____TtC20PridePosterExtension19PrideLightsRenderer_lastNonSnapshotState;
  uint64_t v2 = sub_1000249F8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1000105C8()
{
  sub_100010510();

  return swift_deallocClassInstance();
}

uint64_t sub_100010620()
{
  return type metadata accessor for PrideLightsRenderer();
}

uint64_t type metadata accessor for PrideLightsRenderer()
{
  uint64_t result = qword_100039220;
  if (!qword_100039220) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100010674()
{
  uint64_t result = sub_1000249F8();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

unsigned char *initializeBufferWithCopyOfBuffer for PrideLightsCameraController.CameraIdentifier(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for PrideLightsRenderer.Palette(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFC) {
    goto LABEL_17;
  }
  if (a2 + 4 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 4) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 4;
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
      return (*a1 | (v4 << 8)) - 4;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 4;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 5;
  int v8 = v6 - 5;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for PrideLightsRenderer.Palette(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 4 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 4) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFC) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFB)
  {
    unsigned int v6 = ((a2 - 252) >> 8) + 1;
    *uint64_t result = a2 + 4;
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
        JUMPOUT(0x1000108ACLL);
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
          *uint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

uint64_t sub_1000108D4(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_1000108E0(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for PrideLightsRenderer.Palette()
{
  return &type metadata for PrideLightsRenderer.Palette;
}

unint64_t sub_1000108FC()
{
  unint64_t result = qword_100039368;
  if (!qword_100039368)
  {
    sub_100010958(&qword_100039370);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100039368);
  }
  return result;
}

uint64_t sub_100010958(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_1000109A4()
{
  unint64_t result = qword_100039378;
  if (!qword_100039378)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100039378);
  }
  return result;
}

uint64_t sub_1000109F8()
{
  return 81;
}

uint64_t sub_100010A00()
{
  return 0;
}

uint64_t sub_100010A08()
{
  return 0;
}

uint64_t sub_100010A10@<X0>(uint64_t a1@<X8>)
{
  if (qword_100038B80 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100004858((uint64_t *)&unk_1000393A0);
  uint64_t v3 = sub_10000612C(v2, (uint64_t)qword_100039F80);

  return sub_1000118C0(v3, a1);
}

void sub_100010A8C(void *a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t *a7@<X8>)
{
  type metadata accessor for PrideLightsRenderer();
  uint64_t v15 = swift_allocObject();
  sub_10000E6D8(a1, a2, a3, a4, a5, a6);
  if (!v7) {
    *a7 = v15;
  }
}

void sub_100010B28(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
}

uint64_t sub_100010B4C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100010C20(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10000B48C((uint64_t)v12, *a3);
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
      sub_10000B48C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_10000DED4((uint64_t)v12);
  return v7;
}

uint64_t sub_100010C20(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_100024DE8();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_100010DDC(a5, a6);
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
  uint64_t v8 = sub_100024E78();
  if (!v8)
  {
    sub_100024F18();
    __break(1u);
LABEL_17:
    uint64_t result = sub_100024F88();
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

uint64_t sub_100010DDC(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100010E74(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100011054(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100011054(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100010E74(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_100010FEC(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_100024E58();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_100024F18();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_100024C68();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_100024F88();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_100024F18();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_100010FEC(uint64_t a1, uint64_t a2)
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
  sub_100004858(&qword_100039390);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_100011054(char a1, int64_t a2, char a3, char *a4)
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
    sub_100004858(&qword_100039390);
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
  uint64_t result = sub_100024F88();
  __break(1u);
  return result;
}

uint64_t sub_1000111A4(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_100030E78;
  v6._object = a2;
  unint64_t v4 = sub_100024F98(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 5) {
    return 5;
  }
  else {
    return v4;
  }
}

uint64_t sub_1000111F0()
{
  uint64_t v0 = sub_100024C38();
  swift_bridgeObjectRelease();
  if ((unint64_t)(v0 - 4) >= 8) {
    return 5;
  }
  else {
    return (0x305040201050500uLL >> (8 * (v0 - 4)));
  }
}

uint64_t sub_100011248(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = sub_100004858(&qword_100039398);
  __chkstk_darwin(v4 - 8, v5);
  int64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000E1B8(44, 0xE100000000000000, a1, a2);
  if ((v8 & 1) == 0)
  {
    swift_bridgeObjectRetain();
    sub_100024C88();
    swift_bridgeObjectRelease();
    sub_100024C18();
    swift_bridgeObjectRelease();
    sub_1000248A8();
    swift_bridgeObjectRelease();
    uint64_t v9 = sub_1000248E8();
    uint64_t v10 = *(void *)(v9 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v7, 1, v9) != 1)
    {
      uint64_t v11 = sub_1000248C8();
      (*(void (**)(char *, uint64_t))(v10 + 8))(v7, v9);
      return v11;
    }
    sub_10000DE34((uint64_t)v7, &qword_100039398);
  }
  return 4;
}

uint64_t sub_1000113F0(Swift::String a1)
{
  unint64_t v1 = ((unint64_t)a1._object >> 56) & 0xF;
  if (((uint64_t)a1._object & 0x2000000000000000) == 0) {
    unint64_t v1 = a1._countAndFlagsBits & 0xFFFFFFFFFFFFLL;
  }
  if (v1)
  {
    object = a1._object;
    uint64_t countAndFlagsBits = a1._countAndFlagsBits;
    v26[0] = 0x2D73746867696CLL;
    v26[1] = 0xE700000000000000;
    sub_100024C58(a1);
    v27._uint64_t countAndFlagsBits = 45;
    v27._object = (void *)0xE100000000000000;
    sub_100024C58(v27);
    v28._object = (void *)0x8000000100025EF0;
    v28._uint64_t countAndFlagsBits = 0xD000000000000010;
    sub_100024C58(v28);
    uint64_t v4 = self;
    id v5 = [v4 standardUserDefaults];
    NSString v6 = sub_100024BE8();
    id v7 = [v5 stringForKey:v6];

    if (!v7)
    {
LABEL_10:
      if (qword_100038BB0 != -1) {
        swift_once();
      }
      uint64_t v13 = sub_100024B38();
      sub_10000612C(v13, (uint64_t)qword_100039FE0);
      uint64_t v14 = sub_100024B18();
      os_log_type_t v15 = sub_100024D68();
      if (os_log_type_enabled(v14, v15))
      {
        double v16 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)double v16 = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, v15, "did not find identifier in defaults, choosing hero", v16, 2u);
        swift_slowDealloc();
      }

      if (qword_100038BA0 != -1) {
        swift_once();
      }
      uint64_t v17 = byte_100039FC0;
      id v18 = [v4 standardUserDefaults];
      sub_100016BB0(v17);
      NSString v19 = sub_100024BE8();
      swift_bridgeObjectRelease();
      NSString v20 = sub_100024BE8();
      swift_bridgeObjectRelease();
      [v18 setValue:v19 forKey:v20];

      return v17;
    }
    uint64_t v8 = sub_100024BF8();
    unint64_t v10 = v9;

    uint64_t v11 = HIBYTE(v10) & 0xF;
    if ((v10 & 0x2000000000000000) == 0) {
      uint64_t v11 = v8 & 0xFFFFFFFFFFFFLL;
    }
    if (!v11 || (swift_bridgeObjectRetain(), uint64_t v12 = sub_100019218(), v12 == 21))
    {
      swift_bridgeObjectRelease();
      goto LABEL_10;
    }
    uint64_t v17 = v12;
    swift_bridgeObjectRelease();
    if (qword_100038BB0 != -1) {
      swift_once();
    }
    uint64_t v22 = sub_100024B38();
    sub_10000612C(v22, (uint64_t)qword_100039FE0);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    uint64_t v23 = sub_100024B18();
    os_log_type_t v24 = sub_100024D68();
    if (os_log_type_enabled(v23, v24))
    {
      uint64_t v25 = swift_slowAlloc();
      v26[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v25 = 136446466;
      swift_bridgeObjectRetain();
      sub_100010B4C(v8, v10, v26);
      sub_100024DD8();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v25 + 12) = 2082;
      swift_bridgeObjectRetain();
      sub_100010B4C(countAndFlagsBits, (unint64_t)object, v26);
      sub_100024DD8();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v23, v24, "found camera identifier “%{public}s” in defaults for configuration “%{public}s”", (uint8_t *)v25, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
    }
  }
  else
  {
    if (qword_100038BA0 != -1) {
      swift_once();
    }
    return byte_100039FC0;
  }
  return v17;
}

uint64_t sub_1000118C0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004858((uint64_t *)&unk_1000393A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t *sub_100011928(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t _s13ConfigurationVwxx()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *_s13ConfigurationVwcp(void *a1, void *a2)
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
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *_s13ConfigurationVwca(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 _s13ConfigurationVwtk(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

void *_s13ConfigurationVwta(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s13ConfigurationVwet(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 48)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t _s13ConfigurationVwst(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 48) = 1;
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
    *(unsigned char *)(result + 48) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *_s13ConfigurationVMa()
{
  return &_s13ConfigurationVN;
}

id sub_100011BC8(void *a1)
{
  v24[0] = 0;
  id v3 = objc_msgSend(objc_msgSend(a1, "sourceContents"), "loadUserInfoWithError:", v24);
  swift_unknownObjectRelease();
  id v4 = v24[0];
  if (v3)
  {
    sub_100024BA8();
    id v5 = v4;
  }
  else
  {
    id v6 = v24[0];
    sub_100024868();

    swift_willThrow();
    swift_errorRelease();
    sub_100007604((uint64_t)_swiftEmptyArrayStorage);
  }
  *(void *)&long long v22 = 0xD000000000000011;
  *((void *)&v22 + 1) = 0x80000001000260F0;
  sub_100024E38();
  uint64_t v7 = *v1;
  uint64_t v8 = v1[1];
  uint64_t v23 = &type metadata for String;
  *(void *)&long long v22 = v7;
  *((void *)&v22 + 1) = v8;
  sub_10000B47C(&v22, v21);
  swift_bridgeObjectRetain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  sub_10001FCC8(v21, (uint64_t)v24, isUniquelyReferenced_nonNull_native);
  swift_bridgeObjectRelease();
  sub_10000B3C0((uint64_t)v24);
  *(void *)&long long v22 = 0xD000000000000012;
  *((void *)&v22 + 1) = 0x8000000100025E90;
  sub_100024E38();
  uint64_t v10 = v1[2];
  uint64_t v11 = v1[3];
  uint64_t v23 = &type metadata for String;
  *(void *)&long long v22 = v10;
  *((void *)&v22 + 1) = v11;
  sub_10000B47C(&v22, v21);
  swift_bridgeObjectRetain();
  char v12 = swift_isUniquelyReferenced_nonNull_native();
  sub_10001FCC8(v21, (uint64_t)v24, v12);
  swift_bridgeObjectRelease();
  sub_10000B3C0((uint64_t)v24);
  uint64_t v13 = v1[5];
  if (v13)
  {
    uint64_t v14 = v1[4];
    strcpy((char *)&v22, "lookIdentifier");
    HIBYTE(v22) = -18;
    swift_bridgeObjectRetain();
    sub_100024E38();
    uint64_t v23 = &type metadata for String;
    *(void *)&long long v22 = v14;
    *((void *)&v22 + 1) = v13;
    sub_10000B47C(&v22, v21);
    char v15 = swift_isUniquelyReferenced_nonNull_native();
    sub_10001FCC8(v21, (uint64_t)v24, v15);
    swift_bridgeObjectRelease();
    sub_10000B3C0((uint64_t)v24);
  }
  id v16 = [a1 targetConfiguration];
  Class isa = sub_100024B98().super.isa;
  swift_bridgeObjectRelease();
  v24[0] = 0;
  unsigned int v18 = [v16 storeUserInfo:isa error:v24];

  if (v18) {
    return v24[0];
  }
  id v20 = v24[0];
  sub_100024868();

  return (id)swift_willThrow();
}

uint64_t sub_100011F48@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = sub_1000248E8();
  uint64_t v46 = *(void *)(v4 - 8);
  uint64_t v47 = v4;
  __chkstk_darwin(v4, v5);
  uint64_t v7 = (char *)v44 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  NSString v55 = &OBJC_PROTOCOL___PRPosterRenderingEnvironment;
  uint64_t v8 = (void *)swift_dynamicCastObjCProtocolConditional();
  if (v8)
  {
    unint64_t v9 = &selRef_contents;
  }
  else
  {
    NSString v54 = &OBJC_PROTOCOL___PRPosterEditingEnvironment;
    uint64_t v8 = (void *)swift_dynamicCastObjCProtocolConditional();
    if (!v8)
    {
      id v48 = 0;
      goto LABEL_9;
    }
    unint64_t v9 = &selRef_sourceContents;
  }
  id v10 = [v8 *v9];
  v51[0] = 0;
  id v48 = v10;
  id v11 = [v10 loadUserInfoWithError:v51];
  id v12 = v51[0];
  if (v11)
  {
    uint64_t v13 = v11;
    unint64_t v14 = sub_100024BA8();
    id v15 = v12;

    goto LABEL_10;
  }
  id v16 = v51[0];
  sub_100024868();

  swift_willThrow();
  swift_errorRelease();
LABEL_9:
  unint64_t v14 = sub_100007604((uint64_t)&_swiftEmptyArrayStorage);
LABEL_10:
  if (qword_100038BB0 != -1) {
    swift_once();
  }
  uint64_t v17 = sub_100024B38();
  sub_10000612C(v17, (uint64_t)qword_100039FE0);
  swift_bridgeObjectRetain_n();
  unsigned int v18 = sub_100024B18();
  os_log_type_t v19 = sub_100024D68();
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v20 = swift_slowAlloc();
    v44[1] = a1;
    uint64_t v21 = (uint8_t *)v20;
    v51[0] = (id)swift_slowAlloc();
    *(_DWORD *)uint64_t v21 = 136315138;
    uint64_t v45 = a2;
    swift_bridgeObjectRetain();
    v44[0] = v7;
    uint64_t v22 = sub_100024BB8();
    unint64_t v24 = v23;
    swift_bridgeObjectRelease();
    *(void *)&long long v52 = sub_100010B4C(v22, v24, (uint64_t *)v51);
    a2 = v45;
    sub_100024DD8();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v18, v19, "\nloaded user info: %s\n\n", v21, 0xCu);
    uint64_t v7 = (char *)v44[0];
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  unint64_t v49 = 0xD000000000000017;
  unint64_t v50 = 0x80000001000260D0;
  sub_100024E38();
  if (*(void *)(v14 + 16) && (unint64_t v25 = sub_1000086B8((uint64_t)v51), (v26 & 1) != 0))
  {
    sub_10000B48C(*(void *)(v14 + 56) + 32 * v25, (uint64_t)&v52);
  }
  else
  {
    long long v52 = 0u;
    long long v53 = 0u;
  }
  sub_10000B3C0((uint64_t)v51);
  if (!*((void *)&v53 + 1))
  {
    sub_100012640((uint64_t)&v52);
    goto LABEL_23;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_23:
    unint64_t v49 = 0xD000000000000011;
    unint64_t v50 = 0x80000001000260F0;
    sub_100024E38();
    if (*(void *)(v14 + 16) && (unint64_t v31 = sub_1000086B8((uint64_t)v51), (v32 & 1) != 0))
    {
      sub_10000B48C(*(void *)(v14 + 56) + 32 * v31, (uint64_t)&v52);
    }
    else
    {
      long long v52 = 0u;
      long long v53 = 0u;
    }
    sub_10000B3C0((uint64_t)v51);
    if (*((void *)&v53 + 1))
    {
      if (swift_dynamicCast())
      {
        uint64_t v27 = v49;
        unint64_t v28 = v50;
LABEL_32:
        unint64_t v49 = 0xD000000000000012;
        unint64_t v50 = 0x8000000100025E90;
        sub_100024E38();
        if (*(void *)(v14 + 16) && (unint64_t v34 = sub_1000086B8((uint64_t)v51), (v35 & 1) != 0))
        {
          sub_10000B48C(*(void *)(v14 + 56) + 32 * v34, (uint64_t)&v52);
        }
        else
        {
          long long v52 = 0u;
          long long v53 = 0u;
        }
        sub_10000B3C0((uint64_t)v51);
        if (*((void *)&v53 + 1))
        {
          if (swift_dynamicCast())
          {
            unint64_t v29 = v49;
            unint64_t v30 = v50;
            goto LABEL_41;
          }
        }
        else
        {
          sub_100012640((uint64_t)&v52);
        }
        sub_1000248D8();
        uint64_t v36 = sub_1000248B8();
        uint64_t v37 = v7;
        unint64_t v29 = v36;
        unint64_t v30 = v38;
        (*(void (**)(char *, uint64_t))(v46 + 8))(v37, v47);
        goto LABEL_41;
      }
    }
    else
    {
      sub_100012640((uint64_t)&v52);
    }
    sub_1000248D8();
    uint64_t v27 = sub_1000248B8();
    unint64_t v28 = v33;
    (*(void (**)(char *, uint64_t))(v46 + 8))(v7, v47);
    goto LABEL_32;
  }
  uint64_t v27 = v49;
  unint64_t v28 = v50;
  unint64_t v29 = 0xD000000000000024;
  unint64_t v30 = 0x8000000100026110;
LABEL_41:
  strcpy((char *)&v52, "lookIdentifier");
  HIBYTE(v52) = -18;
  sub_100024E38();
  if (*(void *)(v14 + 16) && (unint64_t v39 = sub_1000086B8((uint64_t)v51), (v40 & 1) != 0))
  {
    sub_10000B48C(*(void *)(v14 + 56) + 32 * v39, (uint64_t)&v52);
  }
  else
  {
    long long v52 = 0u;
    long long v53 = 0u;
  }
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  sub_10000B3C0((uint64_t)v51);
  if (*((void *)&v53 + 1))
  {
    uint64_t result = swift_dynamicCast();
    unint64_t v42 = v49;
    unint64_t v43 = v50;
    if (!result)
    {
      unint64_t v42 = 0;
      unint64_t v43 = 0;
    }
  }
  else
  {
    uint64_t result = sub_100012640((uint64_t)&v52);
    unint64_t v42 = 0;
    unint64_t v43 = 0;
  }
  *a2 = v27;
  a2[1] = v28;
  a2[2] = v29;
  a2[3] = v30;
  a2[4] = v42;
  a2[5] = v43;
  return result;
}

uint64_t sub_100012640(uint64_t a1)
{
  uint64_t v2 = sub_100004858((uint64_t *)&unk_1000390C0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1000126A0(void *a1)
{
  v15[0] = 0;
  id v1 = [a1 loadUserInfoWithError:v15];
  id v2 = v15[0];
  if (v1)
  {
    id v3 = v1;
    uint64_t v4 = sub_100024BA8();
    id v5 = v2;

    *(void *)&long long v13 = 0xD000000000000011;
    *((void *)&v13 + 1) = 0x80000001000260F0;
    sub_100024E38();
    if (*(void *)(v4 + 16) && (unint64_t v6 = sub_1000086B8((uint64_t)v15), (v7 & 1) != 0))
    {
      sub_10000B48C(*(void *)(v4 + 56) + 32 * v6, (uint64_t)&v13);
    }
    else
    {
      long long v13 = 0u;
      long long v14 = 0u;
    }
    sub_10000B3C0((uint64_t)v15);
    uint64_t v8 = *((void *)&v14 + 1);
    sub_100012640((uint64_t)&v13);
    if (v8)
    {
      *(void *)&long long v13 = 0xD000000000000012;
      *((void *)&v13 + 1) = 0x8000000100025E90;
      sub_100024E38();
      if (*(void *)(v4 + 16) && (unint64_t v9 = sub_1000086B8((uint64_t)v15), (v10 & 1) != 0))
      {
        sub_10000B48C(*(void *)(v4 + 56) + 32 * v9, (uint64_t)&v13);
      }
      else
      {
        long long v13 = 0u;
        long long v14 = 0u;
      }
      swift_bridgeObjectRelease();
      sub_10000B3C0((uint64_t)v15);
      uint64_t v8 = *((void *)&v14 + 1) != 0;
      sub_100012640((uint64_t)&v13);
    }
    else
    {
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    id v11 = v15[0];
    sub_100024868();

    swift_willThrow();
    swift_errorRelease();
    return 0;
  }
  return v8;
}

void sub_100012894(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1000248E8();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin();
  unint64_t v9 = (char *)v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100004858(&qword_100039478);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100026980;
  v29[0] = (id)0xD000000000000011;
  v29[1] = (id)0x80000001000260F0;
  sub_100024E38();
  sub_1000248D8();
  uint64_t v11 = sub_1000248B8();
  uint64_t v13 = v12;
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  *(void *)(inited + 96) = &type metadata for String;
  *(void *)(inited + 72) = v11;
  *(void *)(inited + 80) = v13;
  unint64_t v14 = sub_100007604(inited);
  if (a3)
  {
    strcpy((char *)&v27, "lookIdentifier");
    HIBYTE(v27) = -18;
    swift_bridgeObjectRetain();
    sub_100024E38();
    unint64_t v28 = &type metadata for String;
    *(void *)&long long v27 = a2;
    *((void *)&v27 + 1) = a3;
    sub_10000B47C(&v27, v26);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    _OWORD v25[2] = v14;
    sub_10001FCC8(v26, (uint64_t)v29, isUniquelyReferenced_nonNull_native);
    swift_bridgeObjectRelease();
    sub_10000B3C0((uint64_t)v29);
  }
  Class isa = sub_100024B98().super.isa;
  swift_bridgeObjectRelease();
  v29[0] = 0;
  unsigned int v17 = [a1 storeUserInfo:isa error:v29];

  id v18 = v29[0];
  if (v17)
  {
    id v19 = v18;
  }
  else
  {
    v25[1] = v29[0];
    id v20 = v29[0];
    sub_100024868();

    swift_willThrow();
    if (qword_100038BB0 != -1) {
      swift_once();
    }
    uint64_t v21 = sub_100024B38();
    sub_10000612C(v21, (uint64_t)qword_100039FE0);
    uint64_t v22 = sub_100024B18();
    os_log_type_t v23 = sub_100024D78();
    if (os_log_type_enabled(v22, v23))
    {
      unint64_t v24 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v24 = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, v23, "couldn’t store descriptor user info", v24, 2u);
      swift_slowDealloc();
    }
    swift_errorRelease();
  }
}

uint64_t sub_100012C64()
{
  uint64_t v0 = sub_100004858((uint64_t *)&unk_1000393A0);
  sub_100011928(v0, qword_100039FA0);
  uint64_t v1 = sub_10000612C(v0, (uint64_t)qword_100039FA0);
  uint64_t v2 = sub_100024AB8();
  id v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);

  return v3(v1, 1, 1, v2);
}

float32x4_t sub_100012CFC@<Q0>(float32x4_t *a1@<X8>, float a2@<S1>)
{
  long long v30 = *v2;
  float v5 = COERCE_FLOAT(*((void *)v2 + 1));
  v6.f32[0] = sub_100004154(0.17453);
  float32x4_t v26 = v6;
  float32x4_t v27 = v7;
  float32x4_t v28 = v8;
  float32x4_t v29 = v9;
  __float2 v10 = __sincosf_stret(a2);
  *(float *)&unint64_t v11 = -v10.__sinval;
  HIDWORD(v11) = LODWORD(v10.__cosval);
  float32x4_t v12 = (float32x4_t)v2[3];
  float32x4_t v13 = vaddq_f32(vmlaq_f32(vmulq_n_f32((float32x4_t)__PAIR64__(LODWORD(v10.__sinval), LODWORD(v10.__cosval)), v12.f32[0]), (float32x4_t)0, (float32x4_t)v11), (float32x4_t)0);
  float32x4_t v14 = vmulq_f32((float32x4_t)__PAIR64__(LODWORD(v10.__sinval), LODWORD(v10.__cosval)), (float32x4_t)0);
  float32x4_t v15 = vaddq_f32(vmlaq_lane_f32(v14, (float32x4_t)v11, *(float32x2_t *)v12.f32, 1), (float32x4_t)0);
  float32x4_t v16 = vmlaq_f32(v14, (float32x4_t)0, (float32x4_t)v11);
  float32x4_t v17 = vaddq_f32(vmlaq_laneq_f32(v16, (float32x4_t)xmmword_100026A40, v12, 2), (float32x4_t)0);
  float32x4_t v18 = vaddq_f32(vaddq_f32(v16, (float32x4_t)0), (float32x4_t)xmmword_100026A50);
  float32x4_t v19 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v13, v26.f32[0]), v15, *(float32x2_t *)v26.f32, 1), v17, v26, 2), v18, v26, 3);
  float32x4_t v20 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v13, v27.f32[0]), v15, *(float32x2_t *)v27.f32, 1), v17, v27, 2), v18, v27, 3);
  float32x4_t v21 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v13, v28.f32[0]), v15, *(float32x2_t *)v28.f32, 1), v17, v28, 2), v18, v28, 3);
  float32x4_t v22 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v13, v29.f32[0]), v15, *(float32x2_t *)v29.f32, 1), v17, v29, 2), v18, v29, 3);
  float32x4_t v23 = vmulq_f32(v19, (float32x4_t)0);
  __int32 v24 = *((_DWORD *)v2 + 9);
  *a1 = vmlaq_f32(vmlaq_f32(vmlaq_f32(v19, (float32x4_t)0, v20), (float32x4_t)0, v21), (float32x4_t)0, v22);
  a1[1] = vmlaq_f32(vmlaq_f32(vaddq_f32(v20, v23), (float32x4_t)0, v21), (float32x4_t)0, v22);
  float32x4_t result = vaddq_f32(v22, vmlaq_n_f32(vmlaq_n_f32(vmulq_n_f32(v19, 0.0 - *(float *)&v30), v20, 0.0 - *((float *)&v30 + 1)), v21, 0.0 - v5));
  a1[2] = vmlaq_f32(vaddq_f32(v21, vmlaq_f32(v23, (float32x4_t)0, v20)), (float32x4_t)0, v22);
  a1[3] = result;
  a1[4].i32[0] = v24;
  return result;
}

float32x4_t sub_100012E94@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>, double a3@<D0>)
{
  float32x2_t v4 = (float32x2_t)vdupq_lane_s32(*(int32x2_t *)&a3, 0).u64[0];
  *(float32x2_t *)&long long v5 = vadd_f32(*(float32x2_t *)v3, vmul_f32(vsub_f32(*(float32x2_t *)a1, *(float32x2_t *)v3), v4));
  *((float *)&v5 + 2) = *(float *)(v3 + 8) + (float)((float)(*(float *)(a1 + 8) - *(float *)(v3 + 8)) * *(float *)&a3);
  HIDWORD(v5) = 0;
  float v6 = *(float *)(v3 + 32) + (float)((float)(*(float *)(a1 + 32) - *(float *)(v3 + 32)) * *(float *)&a3);
  *(float32x2_t *)&long long v7 = vadd_f32(*(float32x2_t *)(v3 + 48), vmul_f32(vsub_f32(*(float32x2_t *)(a1 + 48), *(float32x2_t *)(v3 + 48)), v4));
  *((float *)&v7 + 2) = *(float *)(v3 + 56)
                      + (float)((float)(*(float *)(a1 + 56) - *(float *)(v3 + 56)) * *(float *)&a3);
  HIDWORD(v7) = 0;
  float32x4_t result = vaddq_f32(*(float32x4_t *)(v3 + 16), vmulq_n_f32(vsubq_f32(*(float32x4_t *)(a1 + 16), *(float32x4_t *)(v3 + 16)), *(float *)&a3));
  *(_OWORD *)a2 = v5;
  *(float32x4_t *)(a2 + 16) = result;
  *(float *)(a2 + 32) = v6;
  *(_DWORD *)(a2 + 36) = 0;
  *(_OWORD *)(a2 + 48) = v7;
  return result;
}

void sub_100012F34(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(_OWORD *)(v5 + 144) = xmmword_100026CE0;
  id v12 = [a1 newCommandQueue];
  if (!v12)
  {
    swift_bridgeObjectRelease();
LABEL_7:
    sub_100008664();
    swift_allocError();
    *float32x4_t v28 = 0;
    swift_willThrow();
    swift_unknownObjectRelease();
LABEL_36:
    swift_unknownObjectRelease();
    goto LABEL_37;
  }
  uint64_t v13 = v5;
  id v14 = v12;
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v16 = [self bundleForClass:ObjCClassFromMetadata];
  id v78 = 0;
  float32x4_t v17 = a1;
  id v18 = [a1 newDefaultLibraryWithBundle:v16 error:&v78];

  id v19 = v78;
  id v77 = v18;
  if (!v18)
  {
    id v27 = v78;
    swift_bridgeObjectRelease();
    sub_100024868();

    swift_willThrow();
    swift_unknownObjectRelease();
    swift_errorRelease();
    goto LABEL_7;
  }
  id v20 = v14;
  uint64_t v21 = v13;
  *(void *)(v13 + 32) = v17;
  *(void *)(v13 + 40) = v20;
  *(void *)(v13 + 16) = a2;
  *(void *)(v13 + 24) = a3;
  id v22 = v19;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  sub_10001473C(a4, a5, v17, v79);
  if (v6)
  {
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    BOOL v23 = 0;
    int v24 = 0;
    int v25 = 0;
    int v26 = 0;
    goto LABEL_25;
  }
  id v75 = v17;
  long long v29 = v79[1];
  *(_OWORD *)(v13 + 72) = v79[0];
  *(_OWORD *)(v13 + 88) = v29;
  *(void *)(v13 + 104) = v80;
  NSString v30 = sub_100024BE8();
  id v31 = [v77 newFunctionWithName:v30];

  if (!v31) {
    goto LABEL_23;
  }
  NSString v32 = sub_100024BE8();
  id v33 = [v77 newFunctionWithName:v32];

  if (!v33)
  {
LABEL_22:
    swift_unknownObjectRelease();
LABEL_23:
    sub_100008664();
    swift_allocError();
    *uint64_t v66 = 0;
    swift_willThrow();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    BOOL v23 = 0;
    goto LABEL_24;
  }
  NSString v34 = sub_100024BE8();
  id v35 = [v77 newFunctionWithName:v34];

  id v76 = v35;
  if (!v35)
  {
LABEL_21:
    swift_unknownObjectRelease();
    goto LABEL_22;
  }
  NSString v36 = sub_100024BE8();
  id v37 = [v77 newFunctionWithName:v36];

  id v74 = v37;
  if (!v37)
  {
    swift_unknownObjectRelease();
    goto LABEL_21;
  }
  id v38 = [objc_allocWithZone((Class)MTLRenderPipelineDescriptor) init];
  [v38 setVertexFunction:v31];
  [v38 setFragmentFunction:v33];
  id v39 = [v38 colorAttachments];
  id v40 = [v39 objectAtIndexedSubscript:0];

  if (v40)
  {
    [v40 setPixelFormat:80];

    [v38 setRasterSampleCount:4];
    [v38 setDepthAttachmentPixelFormat:250];
    id v41 = [objc_allocWithZone((Class)MTLRenderPipelineDescriptor) init];
    [v41 setVertexFunction:v76];
    [v41 setFragmentFunction:v74];
    id v42 = [v41 colorAttachments];
    id v43 = [v42 objectAtIndexedSubscript:0];

    if (v43)
    {
      [v43 setPixelFormat:10];

      [v41 setDepthAttachmentPixelFormat:250];
      id v78 = 0;
      id v44 = [v75 newRenderPipelineStateWithDescriptor:v38 error:&v78];
      id v45 = v78;
      BOOL v23 = v44 != 0;
      uint64_t v73 = v38;
      if (v44)
      {
        *(void *)(v21 + 48) = v44;
        id v78 = 0;
        id v46 = v45;
        uint64_t v47 = v41;
        id v48 = [v75 newRenderPipelineStateWithDescriptor:v41 error:&v78];
        id v45 = v78;
        if (v48)
        {
          *(void *)(v21 + 64) = v48;
          id v49 = objc_allocWithZone((Class)MTLDepthStencilDescriptor);
          id v50 = v45;
          id v51 = [v49 init];
          [v51 setDepthWriteEnabled:1];
          [v51 setDepthCompareFunction:4];
          id v52 = [v75 newDepthStencilStateWithDescriptor:v51];
          if (v52)
          {
            *(void *)(v21 + 56) = v52;
            swift_unknownObjectRetain();
            uint64_t v53 = sub_100014B74(v75);
            if (v53)
            {
              *(void *)(v21 + 120) = v53;
              *(void *)(v21 + 128) = v54;
              swift_unknownObjectRetain();
              swift_unknownObjectRetain();
              id v55 = [v75 newBufferWithLength:768 options:0];
              if (v55)
              {
                *(void *)(v21 + 136) = v55;
                uint64_t v56 = self;
                swift_unknownObjectRetain();
                swift_unknownObjectRetain();
                id v72 = v51;
                id v57 = [v56 mainScreen];
                [v57 scale];
                double v59 = v58;

                float v60 = v59;
                *(float *)&double v59 = v60 * 20.0;
                id v61 = objc_allocWithZone((Class)MPSImageGaussianBlur);
                LODWORD(v62) = LODWORD(v59);
                id v63 = [v61 initWithDevice:v75 sigma:v62];
                swift_unknownObjectRelease();
                *(void *)(v21 + 112) = v63;
                id v64 = [self currentDevice];
                id v65 = [v64 userInterfaceIdiom];

                swift_unknownObjectRelease();
                swift_unknownObjectRelease();
                swift_unknownObjectRelease();
                swift_unknownObjectRelease();
                swift_unknownObjectRelease();
                swift_unknownObjectRelease();

                swift_unknownObjectRelease();
                swift_unknownObjectRelease();
                swift_unknownObjectRelease();
                swift_unknownObjectRelease();
                swift_unknownObjectRelease();
                swift_unknownObjectRelease();
                *(unsigned char *)(v21 + 160) = v65 == (id)1;
                return;
              }
              sub_100008664();
              swift_allocError();
              *id v71 = 0;
              swift_willThrow();
              swift_unknownObjectRelease();
              swift_unknownObjectRelease();
              swift_unknownObjectRelease();
              swift_unknownObjectRelease();
              swift_unknownObjectRelease();
              swift_unknownObjectRelease();

              swift_unknownObjectRelease();
              swift_unknownObjectRelease();
              swift_unknownObjectRelease();
              swift_unknownObjectRelease();
              swift_unknownObjectRelease();
              BOOL v23 = 1;
              int v24 = 1;
              int v25 = 1;
              int v26 = 1;
            }
            else
            {
              sub_100008664();
              swift_allocError();
              *id v70 = 0;
              swift_willThrow();
              swift_unknownObjectRelease();
              swift_unknownObjectRelease();
              swift_unknownObjectRelease();
              swift_unknownObjectRelease();
              swift_unknownObjectRelease();
              swift_unknownObjectRelease();

              swift_unknownObjectRelease();
              swift_unknownObjectRelease();
              swift_unknownObjectRelease();
              int v26 = 0;
              BOOL v23 = 1;
              int v24 = 1;
              int v25 = 1;
            }
          }
          else
          {
            sub_100008664();
            swift_allocError();
            *uint64_t v69 = 0;
            swift_willThrow();
            swift_unknownObjectRelease();
            swift_unknownObjectRelease();
            swift_unknownObjectRelease();
            swift_unknownObjectRelease();
            swift_unknownObjectRelease();
            swift_unknownObjectRelease();

            swift_unknownObjectRelease();
            swift_unknownObjectRelease();
            int v24 = 0;
            int v26 = 0;
            BOOL v23 = 1;
            int v25 = 1;
          }
LABEL_25:
          swift_bridgeObjectRelease();
          swift_unknownObjectRelease();
          swift_unknownObjectRelease();
          if (v23)
          {
            swift_unknownObjectRelease();
            if (!v24)
            {
LABEL_27:
              if (!v25) {
                goto LABEL_28;
              }
              goto LABEL_33;
            }
          }
          else if (!v24)
          {
            goto LABEL_27;
          }
          swift_unknownObjectRelease();
          if (!v25)
          {
LABEL_28:
            if (v6) {
              goto LABEL_29;
            }
            goto LABEL_34;
          }
LABEL_33:
          swift_unknownObjectRelease();
          if (v6)
          {
LABEL_29:
            if (!v26) {
              goto LABEL_37;
            }
LABEL_35:
            swift_unknownObjectRelease();
            goto LABEL_36;
          }
LABEL_34:
          swift_unknownObjectRelease();
          swift_unknownObjectRelease();
          swift_unknownObjectRelease();
          swift_unknownObjectRelease();
          swift_unknownObjectRelease();
          if (!v26)
          {
LABEL_37:
            type metadata accessor for PrideStripesRenderer();
            swift_deallocPartialClassInstance();
            return;
          }
          goto LABEL_35;
        }
      }
      else
      {
        uint64_t v47 = v41;
      }
      id v67 = v45;
      sub_100024868();

      swift_willThrow();
      sub_100008664();
      swift_allocError();
      *uint64_t v68 = 0;
      swift_willThrow();
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      swift_errorRelease();
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();

LABEL_24:
      int v24 = 0;
      int v25 = 0;
      int v26 = 0;
      goto LABEL_25;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

void sub_100013A50(int a1, id a2, uint64_t a3, void *a4)
{
  [a2 width];
  [a2 height];
  sub_100013F88((uint64_t)v44);
  long long v7 = v46;
  v54[0] = v44[0];
  v54[1] = v44[1];
  v54[2] = v44[2];
  v54[3] = v44[3];
  int v55 = v45;
  v52[0] = v47;
  v52[1] = v48;
  v52[2] = v49;
  v52[3] = v50;
  int v53 = v51;
  float32x4_t v8 = *(void **)(v4 + 136);
  float32x4_t v9 = (char *)[(id)swift_unknownObjectRetain() contents];
  id v43 = v8;
  uint64_t v10 = *(void *)(v4 + 144);
  if ((unint64_t)(v10 - 0x80000000000000) >> 56 != 255)
  {
    __break(1u);
    goto LABEL_12;
  }
  unint64_t v11 = &v9[256 * v10];
  long long v12 = v7[3];
  *(_OWORD *)unint64_t v11 = v7[2];
  *((_OWORD *)v11 + 1) = v12;
  long long v13 = v7[4];
  long long v14 = v7[5];
  long long v15 = v7[7];
  *((_OWORD *)v11 + 4) = v7[6];
  *((_OWORD *)v11 + 5) = v15;
  *((_OWORD *)v11 + 2) = v13;
  *((_OWORD *)v11 + 3) = v14;
  long long v16 = v7[8];
  long long v17 = v7[9];
  long long v18 = v7[11];
  *((_OWORD *)v11 + 8) = v7[10];
  *((_OWORD *)v11 + 9) = v18;
  *((_OWORD *)v11 + 6) = v16;
  *((_OWORD *)v11 + 7) = v17;
  long long v19 = v7[12];
  long long v20 = v7[13];
  long long v21 = v7[14];
  *(_OWORD *)(v11 + 204) = *(_OWORD *)((char *)v7 + 236);
  *((_OWORD *)v11 + 11) = v20;
  *((_OWORD *)v11 + 12) = v21;
  *((_OWORD *)v11 + 10) = v19;
  swift_release();
  uint64_t v22 = *(void *)(v4 + 72);
  uint64_t v23 = *(void *)(v4 + 80);
  uint64_t v24 = *(void *)(v4 + 88);
  uint64_t v42 = *(void *)(v4 + 96);
  sub_1000156F0(v24, *(void *)(v4 + 104));
  int v26 = v25;
  id v27 = [a4 renderCommandEncoderWithDescriptor:v25];

  if (!v27) {
    goto LABEL_5;
  }
  NSString v28 = sub_100024BE8();
  [v27 setLabel:v28];

  [v27 setRenderPipelineState:*(void *)(v4 + 64)];
  [v27 setDepthStencilState:*(void *)(v4 + 56)];
  [v27 setCullMode:0];
  [v27 setVertexBuffer:*(void *)(v4 + 120) offset:0 atIndex:0];
  [v27 setVertexBytes:v52 length:80 atIndex:1];
  uint64_t v29 = *(void *)(v4 + 144);
  if ((unint64_t)(v29 - 0x80000000000000) >> 56 != 255)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  [v27 setVertexBuffer:v43 offset:v29 << 8 atIndex:2];
  [v27 drawIndexedPrimitives:3 indexCount:2400 indexType:0 indexBuffer:*(void *)(v4 + 128) indexBufferOffset:0 instanceCount:11];
  [v27 endEncoding];
  [*(id *)(v4 + 112) encodeToCommandBuffer:a4 sourceTexture:v24 destinationTexture:v42];
  swift_unknownObjectRelease();
LABEL_5:
  sub_100015834(v22, v23);
  id v31 = v30;
  id v32 = [v30 colorAttachments];
  id v33 = [v32 objectAtIndexedSubscript:0];

  if (!v33) {
    goto LABEL_15;
  }
  [v33 setResolveTexture:a2];

  id v34 = [a4 renderCommandEncoderWithDescriptor:v31];
  if (v34)
  {
    id v35 = v34;
    NSString v36 = sub_100024BE8();
    [v35 setLabel:v36];

    [v35 setRenderPipelineState:*(void *)(v4 + 48)];
    [v35 setDepthStencilState:*(void *)(v4 + 56)];
    [v35 setCullMode:0];
    [v35 setVertexBuffer:*(void *)(v4 + 120) offset:0 atIndex:0];
    [v35 setVertexBytes:v54 length:80 atIndex:1];
    uint64_t v37 = *(void *)(v4 + 144);
    if ((unint64_t)(v37 - 0x80000000000000) >> 56 == 255)
    {
      [v35 setVertexBuffer:v43 offset:v37 << 8 atIndex:2];
      [v35 setFragmentTexture:v42 atIndex:0];
      [v35 drawIndexedPrimitives:3 indexCount:2400 indexType:0 indexBuffer:*(void *)(v4 + 128) indexBufferOffset:0 instanceCount:11];
      [v35 endEncoding];
      swift_unknownObjectRelease();

      uint64_t v38 = *(void *)(v4 + 144);
      BOOL v39 = __OFADD__(v38, 1);
      uint64_t v40 = v38 + 1;
      if (!v39)
      {
        *(void *)(v4 + 144) = v40 % 3;
        return;
      }
      goto LABEL_14;
    }
LABEL_13:
    __break(1u);
LABEL_14:
    __break(1u);
LABEL_15:
    __break(1u);
  }
  sub_100008664();
  swift_allocError();
  unsigned char *v41 = 2;
  swift_willThrow();
}

__n128 sub_100013F88@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_100024B08();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3, v5);
  long long v7 = (char *)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100024AD8();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8, v10);
  long long v12 = (char *)&v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  unsigned int v13 = *(unsigned __int8 *)(v1 + 160);
  sub_1000249A8();
  float v15 = v14;
  sub_100024978();
  sub_100024AC8();
  double v17 = v16;
  (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
  sub_1000249B8();
  float32_t v19 = v18;
  sub_100024968();
  sub_100024AF8();
  double v21 = v20;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
  float v22 = v21;
  *(float *)&double v17 = v17;
  sub_100015170(v13, (uint64_t)&v38, *(float *)&v17, v19, 1.0 - v22);
  uint64_t v23 = v42;
  __n128 v43 = v38;
  long long v44 = v39;
  uint64_t v45 = v40;
  long long v46 = v41;
  float v24 = -v15;
  sub_100012CFC(v36, v24);
  float32x4_t v35 = v36[0];
  float32x4_t v34 = v36[1];
  float32x4_t v33 = v36[2];
  float32x4_t v32 = v36[3];
  LODWORD(v17) = v37;
  sub_100012CFC((float32x4_t *)&v38, v24);
  __n128 result = v38;
  long long v26 = v39;
  long long v27 = v40;
  long long v28 = v41;
  int v29 = v42;
  float32x4_t v30 = v34;
  *(float32x4_t *)a1 = v35;
  *(float32x4_t *)(a1 + 16) = v30;
  float32x4_t v31 = v32;
  *(float32x4_t *)(a1 + 32) = v33;
  *(float32x4_t *)(a1 + 48) = v31;
  *(_DWORD *)(a1 + 64) = LODWORD(v17);
  *(void *)(a1 + 80) = v23;
  *(__n128 *)(a1 + 96) = result;
  *(_OWORD *)(a1 + 112) = v26;
  *(_OWORD *)(a1 + 128) = v27;
  *(_OWORD *)(a1 + 144) = v28;
  *(_DWORD *)(a1 + 160) = v29;
  return result;
}

uint64_t sub_10001426C()
{
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return v0;
}

uint64_t sub_10001431C()
{
  sub_10001426C();

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for PrideStripesRenderer()
{
  return self;
}

uint64_t destroy for PrideStripesRenderer.Textures()
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  return swift_unknownObjectRelease();
}

void *initializeWithCopy for PrideStripesRenderer.Textures(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  a1[4] = a2[4];
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  return a1;
}

void *assignWithCopy for PrideStripesRenderer.Textures(void *a1, void *a2)
{
  *a1 = *a2;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  a1[1] = a2[1];
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  a1[2] = a2[2];
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  a1[3] = a2[3];
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  a1[4] = a2[4];
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  return a1;
}

__n128 initializeWithTake for PrideStripesRenderer.Textures(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for PrideStripesRenderer.Textures(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_unknownObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_unknownObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for PrideStripesRenderer.Textures(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 40)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PrideStripesRenderer.Textures(uint64_t result, int a2, int a3)
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PrideStripesRenderer.Textures()
{
  return &type metadata for PrideStripesRenderer.Textures;
}

uint64_t sub_1000145FC()
{
  return 80;
}

uint64_t sub_100014604@<X0>(uint64_t a1@<X8>)
{
  if (qword_100038B90 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100004858((uint64_t *)&unk_1000393A0);
  uint64_t v3 = sub_10000612C(v2, (uint64_t)qword_100039FA0);

  return sub_1000118C0(v3, a1);
}

void sub_100014680(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t *a6@<X8>)
{
  type metadata accessor for PrideStripesRenderer();
  uint64_t v13 = swift_allocObject();
  sub_100012F34(a1, a2, a3, a4, a5);
  if (!v6) {
    *a6 = v13;
  }
}

void sub_100014718(int a1, void *a2, uint64_t a3, void *a4)
{
}

void sub_10001473C(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, void *a4@<X8>)
{
  long long v7 = self;
  id v8 = [v7 texture2DDescriptorWithPixelFormat:80 width:a1 height:a2 mipmapped:0];
  [v8 setTextureType:4];
  [v8 setStorageMode:3];
  [v8 setUsage:4];
  [v8 setSampleCount:4];
  [v8 copy];
  sub_100024DF8();
  swift_unknownObjectRelease();
  sub_100015130();
  swift_dynamicCast();
  [v30 setPixelFormat:250];
  id v9 = [a3 newTextureWithDescriptor:v8];
  if (!v9) {
    goto LABEL_14;
  }
  id v10 = v9;
  id v11 = [a3 newTextureWithDescriptor:v30];
  if (!v11)
  {
    swift_unknownObjectRelease();
LABEL_14:
    sub_100008664();
    swift_allocError();
    *int v25 = 1;
    swift_willThrow();
    double v17 = v8;
    id v18 = v30;
LABEL_19:

    return;
  }
  float v12 = ceilf((float)a1 * 0.25);
  if ((~LODWORD(v12) & 0x7F800000) == 0)
  {
    __break(1u);
    goto LABEL_21;
  }
  if (v12 <= -9.2234e18)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  if (v12 >= 9.2234e18)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  float v13 = ceilf((float)a2 * 0.25);
  if ((~LODWORD(v13) & 0x7F800000) == 0)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  if (v13 <= -9.2234e18)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  if (v13 < 9.2234e18)
  {
    id v27 = v11;
    id v28 = v10;
    uint64_t v14 = (uint64_t)v12;
    uint64_t v15 = (uint64_t)v13;
    id v16 = [v7 texture2DDescriptorWithPixelFormat:10 width:(uint64_t)v12 height:(uint64_t)v13 mipmapped:0];
    [v16 setStorageMode:2];
    [v16 setUsage:5];
    [v16 copy];
    sub_100024DF8();
    swift_unknownObjectRelease();
    swift_dynamicCast();
    double v17 = v30;
    [v30 setUsage:3];
    id v18 = [v7 texture2DDescriptorWithPixelFormat:250 width:v14 height:v15 mipmapped:0];
    [v18 setStorageMode:3];
    [v18 setUsage:4];
    id v19 = [a3 newTextureWithDescriptor:v16];
    if (v19)
    {
      id v20 = v19;
      id v21 = [a3 newTextureWithDescriptor:v30];
      if (v21)
      {
        id v22 = v21;
        id v23 = [a3 newTextureWithDescriptor:v18];
        if (v23)
        {
          id v24 = v23;

          *a4 = v28;
          a4[1] = v27;
          a4[2] = v20;
          a4[3] = v22;
          a4[4] = v24;
          return;
        }
        swift_unknownObjectRelease();
      }
      swift_unknownObjectRelease();
    }
    sub_100008664();
    swift_allocError();
    *long long v26 = 1;
    swift_willThrow();

    swift_unknownObjectRelease();
    swift_unknownObjectRelease();

    goto LABEL_19;
  }
LABEL_25:
  __break(1u);
}

uint64_t sub_100014B74(void *a1)
{
  sub_10000A690(0, 802, 0);
  sub_10000A670(0, 2400, 0);
  uint64_t v1 = 0;
  uint64_t v2 = &_swiftEmptyArrayStorage;
  while (1)
  {
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      sub_10000A690(0, *((void *)&_swiftEmptyArrayStorage + 2) + 1, 1);
    }
    unint64_t v5 = *((void *)&_swiftEmptyArrayStorage + 2);
    unint64_t v4 = *((void *)&_swiftEmptyArrayStorage + 3);
    int64_t v6 = v4 >> 1;
    unint64_t v7 = v5 + 1;
    if (v4 >> 1 <= v5)
    {
      sub_10000A690(v4 > 1, v5 + 1, 1);
      unint64_t v4 = *((void *)&_swiftEmptyArrayStorage + 3);
      int64_t v6 = v4 >> 1;
    }
    *(float *)&uint64_t v8 = (float)v1 / 400.0;
    *((void *)&_swiftEmptyArrayStorage + 2) = v7;
    *((void *)&_swiftEmptyArrayStorage + v5 + 4) = v8;
    if (v6 < (uint64_t)(v5 + 2))
    {
      sub_10000A690(v4 > 1, v5 + 2, 1);
      *(float *)&uint64_t v8 = (float)v1 / 400.0;
    }
    HIDWORD(v8) = 1.0;
    *((void *)&_swiftEmptyArrayStorage + 2) = v5 + 2;
    id v9 = (char *)&_swiftEmptyArrayStorage + 32;
    *((void *)&_swiftEmptyArrayStorage + v7 + 4) = v8;
    if ((unint64_t)v1 > 0x18F) {
      goto LABEL_3;
    }
    sub_100004858(&qword_100038F88);
    uint64_t inited = swift_initStackObject();
    *(_WORD *)(inited + 32) = 2 * v1;
    unint64_t v11 = inited + 32;
    *(_OWORD *)(inited + 16) = xmmword_100026CF0;
    __int16 v12 = (2 * v1) | 1;
    *(_WORD *)(inited + 34) = v12;
    *(_WORD *)(inited + 36) = 2 * v1 + 2;
    *(_WORD *)(inited + 38) = 2 * v1 + 2;
    *(_WORD *)(inited + 40) = v12;
    *(_WORD *)(inited + 42) = 2 * v1 + 3;
    int64_t v13 = v2[2];
    int64_t v14 = v13 + 6;
    if (__OFADD__(v13, 6)) {
      goto LABEL_66;
    }
    uint64_t v15 = inited;
    int v55 = v2;
    unint64_t v16 = v2[3];
    if ((uint64_t)(v16 >> 1) >= v14)
    {
      uint64_t v17 = (v16 >> 1) - v13;
      unint64_t v18 = 6;
      if (v17 < 6) {
        break;
      }
      goto LABEL_14;
    }
    if (v13 <= v14) {
      int64_t v44 = v13 + 6;
    }
    else {
      int64_t v44 = v2[2];
    }
    uint64_t result = sub_10000A670(1, v44, 1);
    unint64_t v18 = *(void *)(v15 + 16);
    if (!v18) {
      goto LABEL_74;
    }
    int64_t v13 = v2[2];
    unint64_t v16 = v2[3];
    uint64_t v17 = (v16 >> 1) - v13;
    if (v17 < 6) {
      break;
    }
LABEL_14:
    id v19 = (void *)((char *)v2 + 2 * v13 + 32);
    if (v11 < (unint64_t)v2 + 2 * v13 + 44 && (unint64_t)v19 < v15 + 44)
    {
      uint64_t result = sub_100024F88();
      __break(1u);
LABEL_74:
      __break(1u);
      return result;
    }
    uint64_t v20 = *(void *)v11;
    *(_DWORD *)((char *)v2 + 2 * v13 + 40) = *(_DWORD *)(v11 + 8);
    void *v19 = v20;
    int64_t v21 = v13 + 6;
    if (__OFADD__(v13, 6)) {
      goto LABEL_67;
    }
    v2[2] = v21;
    if (v17 != 6 || (unint64_t v22 = *(void *)(v15 + 16), v18 == v22))
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      if (v18 >= v22) {
        goto LABEL_70;
      }
      __int16 v23 = *(_WORD *)(v11 + 2 * v18);
      unint64_t v24 = v18 + 1;
      uint64_t v25 = v15 + 34;
      unint64_t v26 = v22 - 2;
      uint64_t v27 = -(uint64_t)v22;
      uint64_t v28 = v15 + 32;
LABEL_23:
      int64_t v29 = v16 >> 1;
      int64_t v30 = v21 + 1;
      if ((uint64_t)(v16 >> 1) < v21 + 1)
      {
        uint64_t v51 = v27;
        unint64_t v52 = v26;
        uint64_t v50 = v28;
        unint64_t v43 = v22;
        uint64_t v53 = v25;
        sub_10000A670(v16 > 1, v21 + 1, 1);
        uint64_t v28 = v50;
        uint64_t v27 = v51;
        unint64_t v26 = v52;
        uint64_t v25 = v53;
        unint64_t v22 = v43;
        uint64_t v2 = v55;
        int64_t v29 = v55[3] >> 1;
        if (v21 >= v29)
        {
LABEL_21:
          int64_t v29 = v21;
          goto LABEL_22;
        }
      }
      else if (v21 >= v29)
      {
        goto LABEL_21;
      }
      *((_WORD *)v2 + v21 + 16) = v23;
      if (v24 != v22)
      {
        if ((v24 & 0x8000000000000000) != 0) {
          goto LABEL_68;
        }
        unint64_t v31 = *(void *)(v15 + 16);
        if (v24 >= v31) {
          goto LABEL_69;
        }
        __int16 v23 = *(_WORD *)(v11 + 2 * v24);
        unint64_t v32 = v24 + 1;
        if (v30 >= v29)
        {
          int64_t v29 = v21 + 1;
          ++v24;
          goto LABEL_22;
        }
        *((_WORD *)v2 + v30 + 16) = v23;
        int64_t v30 = v21 + 2;
        if (v32 == v22) {
          goto LABEL_51;
        }
        unint64_t v33 = v31 + ~v24;
        if (v33 >= v29 - v21 - 2) {
          unint64_t v33 = v29 - v21 - 2;
        }
        if (v33 >= v26 - v24) {
          unint64_t v33 = v26 - v24;
        }
        unint64_t v34 = v33 + 1;
        if (v33 + 1 > 8)
        {
          float32x4_t v35 = (char *)v2 + 2 * v21;
          NSString v36 = (char *)(v25 + 2 * v24);
          id v9 = (char *)&_swiftEmptyArrayStorage + 32;
          if ((unint64_t)(v35 - v36 + 36) >= 0x10)
          {
            uint64_t v37 = v34 & 7;
            if ((v34 & 7) == 0) {
              uint64_t v37 = 8;
            }
            unint64_t v38 = v34 - v37;
            v32 += v38;
            v30 += v38;
            long long v39 = v35 + 36;
            do
            {
              long long v40 = *(_OWORD *)v36;
              v36 += 16;
              *v39++ = v40;
              v38 -= 8;
            }
            while (v38);
          }
        }
        else
        {
          id v9 = (char *)&_swiftEmptyArrayStorage + 32;
        }
        uint64_t v41 = 0;
        unint64_t v42 = v31 - v32;
        while (v42 != v41)
        {
          __int16 v23 = *(_WORD *)(v28 + 2 * v32 + 2 * v41);
          if (v29 - v30 == v41)
          {
            unint64_t v24 = v32 + v41 + 1;
LABEL_22:
            v2[2] = v29;
            unint64_t v16 = v2[3];
            int64_t v21 = v29;
            goto LABEL_23;
          }
          *((_WORD *)v2 + v30 + v41++ + 16) = v23;
          if (!(v27 + v32 + v41))
          {
            v30 += v41;
            goto LABEL_50;
          }
        }
        __break(1u);
LABEL_66:
        __break(1u);
LABEL_67:
        __break(1u);
LABEL_68:
        __break(1u);
LABEL_69:
        __break(1u);
LABEL_70:
        __break(1u);
LABEL_71:
        __break(1u);
        goto LABEL_72;
      }
LABEL_51:
      id v9 = (char *)&_swiftEmptyArrayStorage + 32;
LABEL_50:
      v2[2] = v30;
      swift_bridgeObjectRelease();
      uint64_t v2 = v55;
    }
LABEL_3:
    if (v1++ == 400) {
      goto LABEL_58;
    }
  }
  __break(1u);
LABEL_58:
  unint64_t v46 = *((void *)&_swiftEmptyArrayStorage + 2);
  if (v46 >> 60) {
    goto LABEL_71;
  }
  id v47 = [a1 newBufferWithBytes:v9 length:8 * v46 options:0];
  swift_release();
  if (!v47)
  {
    swift_release();
    return (uint64_t)v47;
  }
  uint64_t v48 = v2[2];
  if (v48 + 0x4000000000000000 < 0) {
LABEL_72:
  }
    __break(1u);
  id v49 = [a1 newBufferWithBytes:v2 + 4 length:2 * v48 options:0];
  swift_release();
  if (!v49)
  {
    swift_unknownObjectRelease();
    return 0;
  }
  return (uint64_t)v47;
}

unint64_t sub_100015130()
{
  unint64_t result = qword_100039850;
  if (!qword_100039850)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100039850);
  }
  return result;
}

void sub_100015170(unsigned int a1@<W0>, uint64_t a2@<X8>, float a3@<S0>, float32_t a4@<S1>, float a5@<S2>)
{
  sub_10000A6B0(0, 11, 0);
  if (a4 == 0.0 || a4 == 1.0)
  {
    if (a1) {
      unsigned int v12 = -1;
    }
    else {
      unsigned int v12 = 0;
    }
    int8x16_t v58 = (int8x16_t)vdupq_n_s32(v12);
    unsigned __int32 v56 = vbslq_s8(v58, (int8x16_t)xmmword_100026D30, (int8x16_t)xmmword_100026D20).u32[0];
    int8x16_t v13 = vbslq_s8(v58, (int8x16_t)xmmword_100026D50, (int8x16_t)xmmword_100026D40);
    __int32 v64 = v13.i32[3];
    int8x16_t v60 = vbslq_s8(v58, (int8x16_t)xmmword_100026D10, (int8x16_t)xmmword_100026D00);
    v13.i32[3] = 0;
    int8x16_t v62 = v13;
    uint64_t v65 = 0;
    int v63 = 1065353216;
    unsigned __int32 v66 = v56;
    int v67 = 0;
    int8x16_t v68 = v60;
    *(float *)v13.i32 = a5;
    sub_100012E94((uint64_t)&v62, (uint64_t)v69, *(double *)v13.i64);
    int8x16_t v14 = vbslq_s8(v58, (int8x16_t)xmmword_100026D70, (int8x16_t)xmmword_100026D60);
    __int32 v72 = v14.i32[3];
    v14.i32[3] = 0;
    int8x16_t v70 = v14;
    int v71 = 1065437102;
    unint64_t v73 = 0xC035DCA73F800000;
    unsigned __int32 v74 = v56;
    int v75 = 0;
    int8x16_t v15 = vbslq_s8(v58, (int8x16_t)xmmword_100026D90, (int8x16_t)xmmword_100026D80);
    float v79 = *(float *)&v15.i32[3];
    v15.i32[3] = 0;
    int8x16_t v76 = v60;
    int8x16_t v77 = v15;
    int v78 = 1065353216;
    unint64_t v80 = 0xC0490FDA00000000;
    unsigned __int32 v81 = v56;
    int v82 = 0;
    int8x16_t v83 = v60;
    float32x4_t v16 = sub_100012E94((uint64_t)&v77, (uint64_t)&v84, COERCE_DOUBLE(LODWORD(a5) | 0xC0490FDA00000000));
    v16.f32[0] = a3;
    sub_100012E94((uint64_t)&v84, (uint64_t)v92, *(double *)v16.i64);
    float v17 = (float)(1.0 - fabsf((float)(a3 + a3) + -1.0)) * 0.5;
    uint64_t v18 = 11;
    do
    {
      *(float *)&double v19 = powf(a3, (float)((float)v18 * 0.2) + 1.0);
      sub_100012E94((uint64_t)&v84, (uint64_t)v99, v19);
      unint64_t v21 = _swiftEmptyArrayStorage[2];
      unint64_t v20 = _swiftEmptyArrayStorage[3];
      if (v21 >= v20 >> 1) {
        sub_10000A6B0(v20 > 1, v21 + 1, 1);
      }
      *(void *)&long long v22 = v100;
      int32x2_t v23 = v102;
      int v24 = v101;
      _swiftEmptyArrayStorage[2] = v21 + 1;
      uint64_t v25 = (char *)_swiftEmptyArrayStorage + 20 * v21;
      *((int32x2_t *)&v22 + 1) = vrev64_s32(v23);
      *((_OWORD *)v25 + 2) = v22;
      *((_DWORD *)v25 + 12) = v24;
      --v18;
    }
    while (v18);
    long long v49 = v98;
    LODWORD(v51) = v96;
    int v50 = v97;
    int v52 = v94;
    int v53 = v95;
    uint64_t v54 = v92;
    LODWORD(v55) = v93;
  }
  else
  {
    if (a1) {
      float v26 = 9.6;
    }
    else {
      float v26 = 9.0;
    }
    if (a1) {
      float v27 = 2.8;
    }
    else {
      float v27 = 5.2;
    }
    if (a1) {
      unsigned int v28 = -1;
    }
    else {
      unsigned int v28 = 0;
    }
    LODWORD(v10) = 1072064102;
    if ((a1 & 1) == 0) {
      *(float *)&double v10 = 2.5;
    }
    float v29 = 9.2;
    if (a1) {
      float v29 = 9.6;
    }
    float v30 = 4.8;
    if (a1) {
      float v30 = 2.4;
    }
    int8x8_t v31 = (int8x8_t)vcltz_s32(vshl_n_s32(vdup_n_s32(a1), 0x1FuLL));
    int8x8_t v32 = vbsl_s8(v31, (int8x8_t)0xBE051EB800000000, (int8x8_t)0xBE4CCCCD3DCCCCCDLL);
    int8x8_t v33 = vbsl_s8(v31, (int8x8_t)0xBD8F5C2900000000, (int8x8_t)3184315597);
    float v34 = -0.3;
    int32x2_t v35 = vdup_n_s32(a3 != 0.0);
    if (a3 != 0.0) {
      float v34 = -2.8416;
    }
    int8x8_t v36 = (int8x8_t)vcltz_s32(vshl_n_s32(v35, 0x1FuLL));
    *(int8x8_t *)v37.i8 = vbsl_s8(v36, v32, v33);
    v37.i64[1] = LODWORD(v26);
    int8x16_t v38 = vbslq_s8((int8x16_t)vdupq_n_s32(v28), (int8x16_t)xmmword_100026D10, (int8x16_t)xmmword_100026D00);
    int8x16_t v77 = v37;
    int v78 = 1065437102;
    float v79 = v27;
    LODWORD(v80) = 1065353216;
    *((float *)&v80 + 1) = v34;
    unsigned __int32 v81 = LODWORD(v10);
    int v82 = 0;
    *(int8x8_t *)&long long v39 = vbsl_s8(v36, vbsl_s8(v31, (int8x8_t)0xBE051EB800000000, (int8x8_t)1032805417), vbsl_s8(v31, (int8x8_t)0xBD8F5C2900000000, (int8x8_t)0xBE4CCCCDBD8F5C29));
    *((void *)&v39 + 1) = LODWORD(v29);
    int8x16_t v83 = v38;
    long long v84 = v39;
    int v85 = 1065353216;
    float v86 = v30;
    int v87 = 0;
    if (a3 == 0.0) {
      float v40 = 0.0;
    }
    else {
      float v40 = -3.1416;
    }
    float v88 = v40;
    int v89 = LODWORD(v10);
    int v90 = 0;
    int8x16_t v91 = v38;
    *(float *)&double v10 = a5;
    float32x4_t v41 = sub_100012E94((uint64_t)&v84, (uint64_t)v92, v10);
    v41.f32[0] = a4;
    sub_100012E94((uint64_t)v92, (uint64_t)v99, *(double *)v41.i64);
    uint64_t v42 = 0;
    *(int32x2_t *)&long long v51 = v102;
    int v53 = v101;
    *(void *)&long long v55 = v100;
    uint64_t v43 = _swiftEmptyArrayStorage[2];
    *(void *)&long long v44 = v100;
    *((int32x2_t *)&v44 + 1) = vrev64_s32(v102);
    uint64_t v45 = 20 * v43;
    do
    {
      unint64_t v46 = _swiftEmptyArrayStorage[3];
      uint64_t v47 = v43 + v42 + 1;
      if (v43 + v42 >= v46 >> 1)
      {
        long long v59 = v55;
        long long v61 = v51;
        long long v57 = v44;
        sub_10000A6B0(v46 > 1, v43 + v42 + 1, 1);
        long long v44 = v57;
        long long v55 = v59;
        long long v51 = v61;
      }
      ++v42;
      _swiftEmptyArrayStorage[2] = v47;
      uint64_t v48 = (char *)_swiftEmptyArrayStorage + v45;
      *((_OWORD *)v48 + 2) = v44;
      *((_DWORD *)v48 + 12) = v53;
      v45 += 20;
    }
    while (v42 != 11);
    long long v49 = v104;
    float v17 = v103;
    int v52 = DWORD1(v55);
    int v50 = DWORD1(v51);
    uint64_t v54 = v99;
  }
  *(_OWORD *)a2 = *(_OWORD *)v54;
  *(_DWORD *)(a2 + 16) = v55;
  *(_DWORD *)(a2 + 20) = v52;
  *(_DWORD *)(a2 + 24) = v53;
  *(_DWORD *)(a2 + 28) = v51;
  *(_DWORD *)(a2 + 32) = v50;
  *(float *)(a2 + 36) = v17;
  *(_OWORD *)(a2 + 48) = v49;
  *(void *)(a2 + 64) = _swiftEmptyArrayStorage;
}

void sub_1000156F0(uint64_t a1, uint64_t a2)
{
  id v4 = [objc_allocWithZone((Class)MTLRenderPassDescriptor) init];
  id v5 = [v4 colorAttachments];
  id v6 = [v5 objectAtIndexedSubscript:0];

  if (v6)
  {
    [v6 setTexture:a1];
    [v6 setLoadAction:2];
    [v6 setStoreAction:1];
    id v7 = [v4 depthAttachment];
    if (v7)
    {
      uint64_t v8 = v7;
      [v7 setTexture:a2];
      [v8 setLoadAction:2];
      [v8 setClearDepth:0.0];
      [v8 setStoreAction:0];

      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

void sub_100015834(uint64_t a1, uint64_t a2)
{
  id v4 = [objc_allocWithZone((Class)MTLRenderPassDescriptor) init];
  id v5 = [v4 colorAttachments];
  id v6 = [v5 objectAtIndexedSubscript:0];

  if (!v6)
  {
    __break(1u);
    goto LABEL_10;
  }
  [v6 setTexture:a1];

  id v7 = [v4 colorAttachments];
  id v8 = [v7 objectAtIndexedSubscript:0];

  if (!v8)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  [v8 setLoadAction:2];

  id v9 = [v4 colorAttachments];
  id v10 = [v9 objectAtIndexedSubscript:0];

  if (!v10)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  [v10 setStoreAction:2];

  id v11 = [v4 depthAttachment];
  if (!v11)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  unsigned int v12 = v11;
  [v11 setTexture:a2];

  id v13 = [v4 depthAttachment];
  if (!v13)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  int8x16_t v14 = v13;
  [v13 setClearDepth:0.0];

  id v15 = [v4 depthAttachment];
  if (!v15)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  float32x4_t v16 = v15;
  [v15 setStoreAction:0];

  id v17 = [v4 depthAttachment];
  if (v17)
  {
    uint64_t v18 = v17;
    [v17 setLoadAction:2];

    return;
  }
LABEL_15:
  __break(1u);
}

void sub_100015A68(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  NSString v8 = sub_100024BE8();
  id v9 = [a2 newFunctionWithName:v8];

  if (!v9) {
    goto LABEL_17;
  }
  uint64_t v43 = v4;
  NSString v10 = sub_100024BE8();
  id v11 = [a2 newFunctionWithName:v10];

  if (!v11)
  {
LABEL_16:
    swift_unknownObjectRelease();
LABEL_17:
    sub_100016270();
    swift_allocError();
    *float v30 = 0;
    swift_willThrow();
LABEL_18:
    swift_unknownObjectRelease();
LABEL_19:
    swift_unknownObjectRelease();
    type metadata accessor for PrideLightsBloomer();
    swift_deallocPartialClassInstance();
    return;
  }
  id v42 = v11;
  NSString v12 = sub_100024BE8();
  id v13 = [a2 newFunctionWithName:v12];

  if (!v13)
  {
LABEL_15:
    swift_unknownObjectRelease();
    goto LABEL_16;
  }
  NSString v14 = sub_100024BE8();
  id v15 = [a2 newFunctionWithName:v14];

  if (!v15)
  {
    swift_unknownObjectRelease();
    goto LABEL_15;
  }
  id v16 = [self texture2DDescriptorWithPixelFormat:92 width:a3 height:a4 mipmapped:1];
  [v16 setUsage:5];
  [v16 setStorageMode:2];
  id v41 = [a1 newTextureWithDescriptor:v16];
  if (!v41)
  {
LABEL_27:
    sub_100016270();
    swift_allocError();
    void *v36 = 1;
    swift_willThrow();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();

    goto LABEL_18;
  }
  id v17 = [a1 newTextureWithDescriptor:v16];
  if (!v17)
  {
    swift_unknownObjectRelease();
    goto LABEL_27;
  }
  id v40 = v15;
  v4[5] = v41;
  v4[6] = v17;
  id v18 = objc_allocWithZone((Class)MTLRenderPipelineDescriptor);
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  id v19 = [v18 init];
  id v20 = [v19 colorAttachments];
  id v21 = [v20 objectAtIndexedSubscript:0];

  if (v21)
  {
    objc_msgSend(v21, "setPixelFormat:", objc_msgSend(v16, "pixelFormat"));
    long long v39 = v21;
    [v21 setBlendingEnabled:0];
    [v19 setVertexFunction:v9];
    [v19 setFragmentFunction:v42];
    id v45 = 0;
    id v22 = [a1 newRenderPipelineStateWithDescriptor:v19 error:&v45];
    id v23 = v45;
    id v38 = v22;
    if (v22
      && (v43[2] = v22,
          id v24 = v23,
          [v19 setFragmentFunction:v13],
          id v45 = 0,
          id v25 = [a1 newRenderPipelineStateWithDescriptor:v19 error:&v45],
          id v23 = v45,
          v25))
    {
      v43[3] = v25;
      id v26 = v23;
      [v19 setFragmentFunction:v40];
      id v45 = 0;
      id v27 = [a1 newRenderPipelineStateWithDescriptor:v19 error:&v45];
      if (v27)
      {
        id v28 = v27;
        id v29 = v45;

        swift_unknownObjectRelease();
        swift_unknownObjectRelease();
        swift_unknownObjectRelease();
        swift_unknownObjectRelease();
        swift_unknownObjectRelease();
        swift_unknownObjectRelease();
        swift_unknownObjectRelease();
        swift_unknownObjectRelease();
        _OWORD v43[4] = v28;
        return;
      }
      int8x8_t v31 = v19;
      id v37 = v45;
      uint64_t v33 = sub_100024868();

      int v34 = 1;
    }
    else
    {
      int8x8_t v31 = v19;
      id v32 = v23;
      uint64_t v33 = sub_100024868();

      int v34 = 0;
    }
    swift_willThrow();
    sub_100016270();
    swift_allocError();
    uint64_t *v35 = v33;
    swift_errorRetain();
    swift_willThrow();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    swift_errorRelease();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();

    swift_unknownObjectRelease();
    swift_unknownObjectRelease();

    if (v38) {
      swift_unknownObjectRelease();
    }
    if (v34) {
      swift_unknownObjectRelease();
    }
    swift_unknownObjectRelease();
    goto LABEL_19;
  }
  __break(1u);
}

void sub_100016078()
{
  id v1 = [v0 width];
  id v2 = [v0 height];
  if ((uint64_t)v2 <= (uint64_t)v1) {
    uint64_t v3 = (uint64_t)v1;
  }
  else {
    uint64_t v3 = (uint64_t)v2;
  }
  float v4 = floorf(log2f(fmaxf((float)v3, 1.0))) + 1.0;
  if ((~LODWORD(v4) & 0x7F800000) == 0)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v4 <= -9.2234e18)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if (v4 >= 9.2234e18) {
LABEL_10:
  }
    __break(1u);
}

void sub_100016120(uint64_t a1, uint64_t a2)
{
  id v4 = objc_msgSend(objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), "init"), "colorAttachments");
  id v5 = [v4 objectAtIndexedSubscript:0];

  if (v5)
  {
    [v5 setTexture:a1];
    id v6 = v5;
    [v6 setLevel:a2];

    swift_unknownObjectRelease();
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_1000161F4()
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for PrideLightsBloomer()
{
  return self;
}

unint64_t sub_100016270()
{
  unint64_t result = qword_100039928;
  if (!qword_100039928)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100039928);
  }
  return result;
}

uint64_t sub_1000162C4(uint64_t a1, void *a2)
{
  uint64_t v3 = v2;
  NSString v6 = sub_100024BE8();
  [a2 pushDebugGroup:v6];

  uint64_t v7 = v2[6];
  swift_getObjectType();
  sub_100016078();
  uint64_t v9 = v8 - 3;
  if (__OFSUB__(v8, 3))
  {
    __break(1u);
LABEL_23:
    __break(1u);
LABEL_24:
    __break(1u);
  }
  uint64_t v10 = v7;
  if (v9 <= 2) {
    uint64_t v9 = 2;
  }
  if (v9 >= 8) {
    uint64_t v9 = 8;
  }
  uint64_t v37 = v9;
  sub_100016920();
  uint64_t v11 = v3[5];
  uint64_t v12 = swift_unknownObjectRetain();
  sub_100016120(v12, 0);
  NSString v14 = v13;
  id v15 = [a2 renderCommandEncoderWithDescriptor:v13];

  if (v15)
  {
    swift_getObjectType();
    [v15 setRenderPipelineState:v3[2]];
    NSString v16 = sub_100024BE8();
    [v15 setLabel:v16];

    [v15 setFragmentTexture:a1 atIndex:0];
    sub_100004138();
    [v15 endEncoding];
    uint64_t v17 = 1;
    id v38 = a2;
    do
    {
      id v18 = objc_allocWithZone((Class)MTLRenderPassDescriptor);
      swift_unknownObjectRetain();
      id v19 = [v18 init];
      id v20 = [v19 colorAttachments];
      id v21 = [v20 objectAtIndexedSubscript:0];

      if (!v21) {
        goto LABEL_23;
      }
      [v21 setTexture:v11];
      id v22 = v21;
      [v22 setLevel:v17];

      swift_unknownObjectRelease();
      id v23 = [a2 renderCommandEncoderWithDescriptor:v19];

      if (!v23)
      {
LABEL_19:
        sub_100016270();
        swift_allocError();
        *int v34 = 2;
        swift_willThrow();
        swift_unknownObjectRelease();
        return v10;
      }
      swift_getObjectType();
      [v23 setRenderPipelineState:v3[3]];
      uint64_t v39 = 0x206E776F64;
      unint64_t v40 = 0xE500000000000000;
      v41._uint64_t countAndFlagsBits = sub_100024FA8();
      sub_100024C58(v41);
      swift_bridgeObjectRelease();
      NSString v24 = sub_100024BE8();
      swift_bridgeObjectRelease();
      [v23 setLabel:v24];

      a2 = v38;
      [v23 setFragmentTexture:v11 atIndex:0];
      LOWORD(v39) = v17 - 1;
      [v23 setFragmentBytes:&v39 length:2 atIndex:0];
      sub_100004138();
      [v23 endEncoding];
      swift_unknownObjectRelease();
      ++v17;
    }
    while (v37 != v17);
    uint64_t v25 = 0;
    do
    {
      id v26 = objc_allocWithZone((Class)MTLRenderPassDescriptor);
      swift_unknownObjectRetain();
      id v27 = [v26 init];
      id v28 = [v27 colorAttachments];
      id v29 = [v28 objectAtIndexedSubscript:0];

      if (!v29) {
        goto LABEL_24;
      }
      [v29 setTexture:v10];
      id v30 = v29;
      [v30 setLevel:v37 + v25 - 2];

      swift_unknownObjectRelease();
      id v31 = [v38 renderCommandEncoderWithDescriptor:v27];

      if (!v31) {
        goto LABEL_19;
      }
      swift_getObjectType();
      [v31 setRenderPipelineState:v3[4]];
      uint64_t v39 = 2125941;
      unint64_t v40 = 0xE300000000000000;
      v42._uint64_t countAndFlagsBits = sub_100024FA8();
      sub_100024C58(v42);
      swift_bridgeObjectRelease();
      NSString v32 = sub_100024BE8();
      swift_bridgeObjectRelease();
      [v31 setLabel:v32];

      if (v25) {
        uint64_t v33 = v10;
      }
      else {
        uint64_t v33 = v11;
      }
      swift_unknownObjectRetain();
      [v31 setFragmentTexture:v33 atIndex:0];
      swift_unknownObjectRelease();
      [v31 setFragmentTexture:v11 atIndex:1];
      LOWORD(v39) = v37 + v25 - 1;
      [v31 setFragmentBytes:&v39 length:2 atIndex:0];
      sub_100004138();
      [v31 endEncoding];
      swift_unknownObjectRelease();
      --v25;
    }
    while (v37 + v25 != 1);
    [v38 popDebugGroup];
    swift_unknownObjectRelease();
  }
  else
  {
    sub_100016270();
    swift_allocError();
    void *v35 = 2;
    swift_willThrow();
  }
  return v10;
}

unint64_t sub_100016920()
{
  unint64_t result = qword_100039930;
  if (!qword_100039930)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100039930);
  }
  return result;
}

void *initializeBufferWithCopyOfBuffer for PrideLightsBloomer.Error(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  if ((unint64_t)*a2 >= 0xFFFFFFFF) {
    swift_errorRetain();
  }
  *a1 = v3;
  return a1;
}

unint64_t destroy for PrideLightsBloomer.Error(unint64_t *a1)
{
  unint64_t result = *a1;
  if (result >= 0xFFFFFFFF) {
    return swift_errorRelease();
  }
  return result;
}

unint64_t *assignWithCopy for PrideLightsBloomer.Error(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3 = *a2;
  if (*a1 < 0xFFFFFFFF)
  {
    if (v3 >= 0xFFFFFFFF) {
      swift_errorRetain();
    }
    *a1 = v3;
  }
  else if (v3 < 0xFFFFFFFF)
  {
    swift_errorRelease();
    *a1 = *a2;
  }
  else
  {
    swift_errorRetain();
    *a1 = v3;
    swift_errorRelease();
  }
  return a1;
}

void *initializeWithTake for PrideLightsBloomer.Error(void *result, void *a2)
{
  *unint64_t result = *a2;
  return result;
}

unint64_t *assignWithTake for PrideLightsBloomer.Error(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3 = *a2;
  if (*a1 < 0xFFFFFFFF) {
    goto LABEL_6;
  }
  if (v3 < 0xFFFFFFFF)
  {
    swift_errorRelease();
LABEL_6:
    *a1 = v3;
    return a1;
  }
  *a1 = v3;
  swift_errorRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for PrideLightsBloomer.Error(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFD && *((unsigned char *)a1 + 8)) {
    return (*(_DWORD *)a1 + 2147483645);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  unsigned int v4 = v3 + 1;
  unsigned int v5 = v3 - 2;
  if (v4 >= 4) {
    return v5;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for PrideLightsBloomer.Error(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 >= 0x7FFFFFFD)
  {
    *(void *)unint64_t result = 0;
    *(_DWORD *)unint64_t result = a2 - 2147483645;
    if (a3 >= 0x7FFFFFFD) {
      *(unsigned char *)(result + 8) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFD) {
      *(unsigned char *)(result + 8) = 0;
    }
    if (a2) {
      *(void *)unint64_t result = a2 + 2;
    }
  }
  return result;
}

uint64_t sub_100016B64(uint64_t *a1)
{
  uint64_t v1 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_100016B7C(void *result, int a2)
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

ValueMetadata *type metadata accessor for PrideLightsBloomer.Error()
{
  return &type metadata for PrideLightsBloomer.Error;
}

unint64_t sub_100016BB0(char a1)
{
  unint64_t result = 0x754664656C676E61;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x31707565736F6C63;
      break;
    case 2:
      unint64_t result = 0x32707565736F6C63;
      break;
    case 3:
      unint64_t result = 0x33707565736F6C63;
      break;
    case 4:
      unint64_t result = 0x316D756964656DLL;
      break;
    case 6:
      unint64_t result = 0x316C6C7566;
      break;
    case 7:
      unint64_t result = 0x657665526C6C7566;
      break;
    case 8:
      unint64_t result = 0x52707565736F6C63;
      break;
    case 9:
    case 11:
      unint64_t result = 0x6C676E4164617069;
      break;
    case 10:
      unint64_t result = 0x6964654D64617069;
      break;
    case 12:
    case 13:
    case 14:
    case 15:
    case 18:
    case 20:
      unint64_t result = 0x736F6C4364617069;
      break;
    case 16:
      unint64_t result = 0x6964654D64617069;
      break;
    case 17:
      unint64_t result = 0x6C6C754664617069;
      break;
    case 19:
      unint64_t result = 0xD000000000000014;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_100016E0C()
{
  id v0 = [self currentDevice];
  id v1 = [v0 userInterfaceIdiom];

  if (v1 == (id)1) {
    unsigned int v2 = &off_100031150;
  }
  else {
    unsigned int v2 = &off_100031180;
  }
  qword_100039FB8 = (uint64_t)v2;

  return swift_bridgeObjectRetain();
}

void sub_100016E90()
{
  id v0 = [self currentDevice];
  id v1 = [v0 userInterfaceIdiom];

  if (v1 == (id)1) {
    char v2 = 9;
  }
  else {
    char v2 = 5;
  }
  byte_100039FC0 = v2;
}

uint64_t sub_100016EFC(unsigned __int8 a1, uint64_t a2)
{
  if (*(void *)(a2 + 16))
  {
    sub_100025048();
    sub_100016BB0(a1);
    sub_100024C28();
    swift_bridgeObjectRelease();
    Swift::Int v4 = sub_100025068();
    uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
    unint64_t v6 = v4 & ~v5;
    if ((*(void *)(a2 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
    {
      uint64_t v7 = ~v5;
      uint64_t v8 = a1;
      while (1)
      {
        unint64_t v9 = 0xEB00000000316C6CLL;
        unint64_t v10 = 0x754664656C676E61;
        switch(*(unsigned char *)(*(void *)(a2 + 48) + v6))
        {
          case 1:
            unint64_t v9 = 0xE800000000000000;
            unint64_t v10 = 0x31707565736F6C63;
            break;
          case 2:
            unint64_t v9 = 0xE800000000000000;
            unint64_t v10 = 0x32707565736F6C63;
            break;
          case 3:
            unint64_t v9 = 0xE800000000000000;
            unint64_t v10 = 0x33707565736F6C63;
            break;
          case 4:
            unint64_t v9 = 0xE700000000000000;
            unint64_t v10 = 0x316D756964656DLL;
            break;
          case 5:
            unint64_t v9 = 0xEB00000000326C6CLL;
            break;
          case 6:
            unint64_t v9 = 0xE500000000000000;
            unint64_t v10 = 0x316C6C7566;
            break;
          case 7:
            unint64_t v10 = 0x657665526C6C7566;
            uint64_t v11 = 828732274;
            goto LABEL_25;
          case 8:
            unint64_t v9 = 0xE800000000000000;
            unint64_t v10 = 0x52707565736F6C63;
            break;
          case 9:
            unint64_t v10 = 0x6C676E4164617069;
            unint64_t v9 = 0xEF316C6C75466465;
            break;
          case 0xA:
            unint64_t v9 = 0xEB00000000316D75;
            unint64_t v10 = 0x6964654D64617069;
            break;
          case 0xB:
            unint64_t v10 = 0x6C676E4164617069;
            unint64_t v9 = 0xEF326C6C75466465;
            break;
          case 0xC:
            unint64_t v10 = 0x736F6C4364617069;
            uint64_t v11 = 829453669;
            goto LABEL_25;
          case 0xD:
            unint64_t v10 = 0x736F6C4364617069;
            uint64_t v11 = 846230885;
            goto LABEL_25;
          case 0xE:
            unint64_t v10 = 0x736F6C4364617069;
            uint64_t v11 = 863008101;
            goto LABEL_25;
          case 0xF:
            unint64_t v10 = 0x736F6C4364617069;
            uint64_t v11 = 1383101797;
            goto LABEL_25;
          case 0x10:
            unint64_t v10 = 0x6964654D64617069;
            unint64_t v9 = 0xED00004952506D75;
            break;
          case 0x11:
            unint64_t v10 = 0x6C6C754664617069;
            unint64_t v9 = 0xEF65737265766552;
            break;
          case 0x12:
            unint64_t v10 = 0x736F6C4364617069;
            uint64_t v11 = 1349547365;
            goto LABEL_25;
          case 0x13:
            unint64_t v9 = 0x8000000100025950;
            unint64_t v10 = 0xD000000000000014;
            break;
          case 0x14:
            unint64_t v10 = 0x736F6C4364617069;
            uint64_t v11 = 1148220773;
LABEL_25:
            unint64_t v9 = v11 & 0xFFFFFFFFFFFFLL | 0xEC00000000000000;
            break;
          default:
            break;
        }
        unint64_t v12 = 0x754664656C676E61;
        unint64_t v13 = 0xEB00000000316C6CLL;
        switch(v8)
        {
          case 1:
            unint64_t v13 = 0xE800000000000000;
            if (v10 == 0x31707565736F6C63) {
              goto LABEL_62;
            }
            goto LABEL_63;
          case 2:
            unint64_t v13 = 0xE800000000000000;
            if (v10 != 0x32707565736F6C63) {
              goto LABEL_63;
            }
            goto LABEL_62;
          case 3:
            unint64_t v13 = 0xE800000000000000;
            if (v10 != 0x33707565736F6C63) {
              goto LABEL_63;
            }
            goto LABEL_62;
          case 4:
            unint64_t v13 = 0xE700000000000000;
            if (v10 != 0x316D756964656DLL) {
              goto LABEL_63;
            }
            goto LABEL_62;
          case 5:
            unint64_t v13 = 0xEB00000000326C6CLL;
            if (v10 != 0x754664656C676E61) {
              goto LABEL_63;
            }
            goto LABEL_62;
          case 6:
            unint64_t v13 = 0xE500000000000000;
            if (v10 != 0x316C6C7566) {
              goto LABEL_63;
            }
            goto LABEL_62;
          case 7:
            uint64_t v14 = 0x657665526C6C7566;
            uint64_t v15 = 828732274;
            goto LABEL_61;
          case 8:
            unint64_t v13 = 0xE800000000000000;
            if (v10 != 0x52707565736F6C63) {
              goto LABEL_63;
            }
            goto LABEL_62;
          case 9:
            unint64_t v13 = 0xEF316C6C75466465;
            if (v10 != 0x6C676E4164617069) {
              goto LABEL_63;
            }
            goto LABEL_62;
          case 10:
            unint64_t v13 = 0xEB00000000316D75;
            if (v10 != 0x6964654D64617069) {
              goto LABEL_63;
            }
            goto LABEL_62;
          case 11:
            unint64_t v13 = 0xEF326C6C75466465;
            if (v10 != 0x6C676E4164617069) {
              goto LABEL_63;
            }
            goto LABEL_62;
          case 12:
            uint64_t v14 = 0x736F6C4364617069;
            uint64_t v15 = 829453669;
            goto LABEL_61;
          case 13:
            uint64_t v14 = 0x736F6C4364617069;
            uint64_t v15 = 846230885;
            goto LABEL_61;
          case 14:
            uint64_t v14 = 0x736F6C4364617069;
            uint64_t v15 = 863008101;
            goto LABEL_61;
          case 15:
            uint64_t v14 = 0x736F6C4364617069;
            uint64_t v15 = 1383101797;
            goto LABEL_61;
          case 16:
            unint64_t v13 = 0xED00004952506D75;
            if (v10 != 0x6964654D64617069) {
              goto LABEL_63;
            }
            goto LABEL_62;
          case 17:
            unint64_t v13 = 0xEF65737265766552;
            if (v10 != 0x6C6C754664617069) {
              goto LABEL_63;
            }
            goto LABEL_62;
          case 18:
            uint64_t v14 = 0x736F6C4364617069;
            uint64_t v15 = 1349547365;
            goto LABEL_61;
          case 19:
            unint64_t v13 = 0x8000000100025950;
            unint64_t v12 = 0xD000000000000014;
            goto LABEL_58;
          case 20:
            uint64_t v14 = 0x736F6C4364617069;
            uint64_t v15 = 1148220773;
LABEL_61:
            unint64_t v13 = v15 & 0xFFFFFFFFFFFFLL | 0xEC00000000000000;
            if (v10 == v14) {
              goto LABEL_62;
            }
            goto LABEL_63;
          default:
LABEL_58:
            if (v10 != v12) {
              goto LABEL_63;
            }
LABEL_62:
            if (v9 == v13)
            {
              swift_bridgeObjectRelease_n();
              char v16 = 1;
              return v16 & 1;
            }
LABEL_63:
            char v16 = sub_100024FC8();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            if (v16) {
              return v16 & 1;
            }
            unint64_t v6 = (v6 + 1) & v7;
            if (((*(void *)(a2 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
              return v16 & 1;
            }
            break;
        }
      }
    }
  }
  char v16 = 0;
  return v16 & 1;
}

void sub_1000175FC(char a1@<W0>, uint64_t a2@<X8>, float a3@<S0>, __n128 a4@<Q1>, __n128 a5@<Q2>)
{
  float v5 = a4.n128_f32[0];
  float v6 = 1.0 - a3;
  switch(a1)
  {
    case 1:
      float32x2_t v14 = vmul_n_f32((float32x2_t)0x3DCCCCCD3E4CCCCDLL, a4.n128_f32[0]);
      a5.n128_u64[0] = (unint64_t)vadd_f32(v14, (float32x2_t)0xBE2E147BBF051EB8);
      __n128 v123 = a5;
      float v9 = (float)(v6 * 0.1) + (float)(1.0 - v14.f32[0]);
      float v15 = (float)(v5 * 10.0) + 20.0;
      v16.radians = sub_10001AC0C(15.0);
      v17.radians = sub_10001AC0C(v15);
      *(double *)&uint64_t v18 = 75.0;
      goto LABEL_6;
    case 2:
      *(float *)&unint64_t v19 = (float)(a4.n128_f32[0] * -0.1) + -0.4;
      HIDWORD(v19) = -1105618534;
      __n128 v123 = (__n128)v19;
      float v9 = (float)(v6 * 0.02) + 0.9;
      float v20 = (float)(a4.n128_f32[0] * 20.0) + 30.0;
      v16.radians = sub_10001AC0C(15.0);
      v17.radians = sub_10001AC0C(v20);
      *(double *)&uint64_t v18 = 60.0;
      goto LABEL_6;
    case 3:
      *(float *)&unint64_t v21 = (float)(a4.n128_f32[0] * -0.1) + -0.1;
      *((float *)&v21 + 1) = a4.n128_f32[0] * -0.1;
      __n128 v123 = (__n128)v21;
      float v9 = (float)(v6 * 0.06) + 1.1;
      float v22 = (float)(a4.n128_f32[0] * 10.0) + 40.0;
      v16.radians = sub_10001AC0C((float)((float)(a4.n128_f32[0] * -5.0) + 10.0));
      v17.radians = sub_10001AC0C(v22);
      *(double *)&uint64_t v18 = 40.0;
LABEL_6:
      double v23 = *(double *)&v18;
      goto LABEL_23;
    case 4:
      *(float *)&unint64_t v24 = (float)(v6 * 0.02) + (float)(-0.25 - (float)(a4.n128_f32[0] * 0.15));
      HIDWORD(v24) = -1110651699;
      __n128 v122 = (__n128)v24;
      float v9 = (float)(v6 * 0.15) + (float)((float)(a4.n128_f32[0] * -0.8) + 2.4);
      float v25 = (float)(a4.n128_f32[0] * -10.0) + 40.0;
      v11.radians = sub_10001AC0C(1.0);
      v12.radians = sub_10001AC0C(v25);
      double v13 = 90.0;
      goto LABEL_10;
    case 5:
      float32x2_t v26 = vmul_n_f32((float32x2_t)0x3DCCCCCD3E800000, a4.n128_f32[0]);
      a5.n128_u32[0] = -1096223293;
      LODWORD(v27) = vadd_f32(v26, (float32x2_t)a5.n128_u64[0]).u32[0];
      HIDWORD(v27) = vsub_f32((float32x2_t)vdup_n_s32(0xBD23D70A), v26).i32[1];
      __n128 v122 = (__n128)v27;
      float v9 = (float)((float)(v6 * 0.15) + 1.85) + (float)(v5 * -0.6);
      float v28 = (float)(v5 * 5.0) + 40.0;
      v11.radians = sub_10001AC0C(-5.0);
      v12.radians = sub_10001AC0C(v28);
      double v13 = 65.0;
      goto LABEL_10;
    case 6:
      a4.n128_u64[0] = (unint64_t)vadd_f32(vmul_n_f32((float32x2_t)0xBD4CCCCDBDCCCCCDLL, a4.n128_f32[0]), (float32x2_t)0xBD23D70ABCA3D70ALL);
      __n128 v122 = a4;
      float v9 = (float)(2.8 - v5) + (float)(v6 * 0.3);
      float v29 = v5 * 20.0;
      v11.radians = sub_10001AC0C(0.0);
      v12.radians = sub_10001AC0C(v29);
      double v13 = 64.0;
      goto LABEL_10;
    case 7:
      float v9 = (float)(v6 * 0.25) + (float)((float)(a4.n128_f32[0] * -0.7) + 2.4);
      float v40 = (float)(a4.n128_f32[0] * -10.0) + -15.0;
      v41.radians = sub_10001AC0C((float)((float)(a4.n128_f32[0] * 5.0) + 6.0));
      v42.radians = sub_10001AC0C(v40);
      v43.radians = sub_10001AC0C(64.0);
      SPEulerAngleOrder v44 = sub_100024D98();
      sub_100024D58(v45, v41, v42, v43, v44);
      long long v131 = v46;
      long long v132 = v47;
      int v133 = v48;
      sub_10001AC28((uint64_t)&v131, &v128);
      uint64_t v38 = v129;
      uint64_t v37 = v130;
      float v39 = 0.0;
      long long v36 = 0uLL;
      break;
    case 8:
      a4.n128_u64[0] = (unint64_t)vadd_f32(vmul_n_f32((float32x2_t)0xBCA3D70ABE428F5CLL, a4.n128_f32[0]), (float32x2_t)0xBABF5D79BECFDF3BLL);
      __n128 v123 = a4;
      float v9 = (float)(v6 * 0.1) + (float)((float)(v5 * -0.3) + 1.16);
      float v49 = (float)(v5 * 15.0) + 42.8;
      v16.radians = sub_10001AC0C((float)((float)(v5 * -10.0) + 12.7));
      v17.radians = sub_10001AC0C(v49);
      double v23 = 21.2999992;
      goto LABEL_23;
    case 9:
      *(float *)&unint64_t v50 = (float)(a5.n128_f32[0] * 0.05)
                     + (float)((float)((float)(0.0 - (float)(a5.n128_f32[0] * 0.1)) * a4.n128_f32[0]) + -0.3);
      *((float *)&v50 + 1) = (float)((float)(a4.n128_f32[0] * 0.1) * a5.n128_f32[0])
                           + (float)(-0.1 - (float)(a5.n128_f32[0] * 0.1));
      __n128 v123 = (__n128)v50;
      float v9 = (float)(a5.n128_f32[0] * 0.1)
         + (float)((float)((float)(v6 * 0.1) + (float)((float)(a4.n128_f32[0] * -0.2) + 0.7)) * 3.0);
      float v51 = (float)((float)(a4.n128_f32[0] * 10.0) + 35.0) + (float)(a5.n128_f32[0] * -5.0);
      float v52 = (float)(a5.n128_f32[0] * -40.0) + 60.0;
      double v53 = -10.0;
      goto LABEL_22;
    case 10:
      *(float *)&unint64_t v54 = (float)((float)(a4.n128_f32[0] * -0.15) + -0.24)
                     + (float)((float)(a5.n128_f32[0] * 0.1) * a4.n128_f32[0]);
      HIDWORD(v54) = -1110651699;
      float v121 = a4.n128_f32[0];
      long long v124 = v54;
      float v9 = (float)((float)(v6 * 0.1)
                 + (float)(2.0 - (float)((float)((float)(a5.n128_f32[0] * -0.2) + 0.9) * a4.n128_f32[0])))
         + (float)(a5.n128_f32[0] * -0.6);
      v55.radians = sub_10001AC0C(1.0);
      v56.radians = sub_10001AC0C(40.0);
      v57.radians = sub_10001AC0C(90.0);
      SPEulerAngleOrder v58 = sub_100024D98();
      sub_100024D58(v59, v55, v56, v57, v58);
      long long v131 = v60;
      long long v132 = v61;
      int v133 = v62;
      sub_10001AC28((uint64_t)&v131, &v128);
      uint64_t v38 = v129;
      uint64_t v37 = v130;
      float64_t v63 = v128.f64[1];
      float64_t v64 = v128.f64[0];
      float v39 = (float)(v121 * 0.5) + 0.5;
      long long v36 = v124;
      goto LABEL_30;
    case 11:
      *(float *)&unint64_t v65 = (float)((float)(0.2 - (float)(a5.n128_f32[0] * 0.1)) * a4.n128_f32[0]) + -0.25;
      *((float *)&v65 + 1) = (float)((float)(a4.n128_f32[0] * 0.05) + -0.1)
                           + (float)((float)(0.05 - (float)(a4.n128_f32[0] * 0.05)) * a5.n128_f32[0]);
      __n128 v123 = (__n128)v65;
      float v9 = (float)((float)((float)(v6 * 0.15) + 2.1) + (float)(a4.n128_f32[0] * -0.6)) - (float)(a5.n128_f32[0] * 0.1);
      float v51 = (float)(40.0 - (float)(a4.n128_f32[0] * 5.0)) + (float)(a5.n128_f32[0] * -15.0);
      float v52 = 30.0 - (float)(a5.n128_f32[0] * 5.0);
      double v53 = (float)((float)(10.0 - (float)(a4.n128_f32[0] * 5.0)) + (float)(a5.n128_f32[0] * 5.0));
      goto LABEL_22;
    case 12:
      *(float *)&unint64_t v66 = (float)(0.0 - (float)(a4.n128_f32[0] * 0.1)) - (float)(a5.n128_f32[0] * 0.02);
      *((float *)&v66 + 1) = (float)(a5.n128_f32[0] * 0.02)
                           + (float)(0.08 - (float)((float)((float)(a5.n128_f32[0] * -0.05) + 0.1) * a4.n128_f32[0]));
      __n128 v125 = (__n128)v66;
      float v9 = (float)(v6 * 0.06) + 0.9;
      float v67 = (float)(a5.n128_f32[0] * -15.0) + 40.0;
      float v68 = (float)((float)(a4.n128_f32[0] * 10.0) + 40.0) - (float)(a5.n128_f32[0] * 5.0);
      v69.radians = sub_10001AC0C((float)(10.0 - (float)(a4.n128_f32[0] * 5.0)));
      v70.radians = sub_10001AC0C(v67);
      double v71 = v68;
      goto LABEL_28;
    case 13:
      a4.n128_u64[0] = (unint64_t)vadd_f32(vadd_f32(vmul_n_f32((float32x2_t)0x3D4CCCCD3E4CCCCDLL, a4.n128_f32[0]), (float32x2_t)0xBE19999ABF266666), vmul_n_f32((float32x2_t)0x3D4CCCCD3C23D70ALL, a5.n128_f32[0]));
      __n128 v126 = a4;
      float v39 = 1.0;
      float v9 = (float)(v6 * 0.06) + 1.0;
      float v72 = (float)(a5.n128_f32[0] * 20.0) + 30.0;
      float v73 = (float)((float)(v5 * 10.0) + 60.0) - (float)(a5.n128_f32[0] * 20.0);
      v74.radians = sub_10001AC0C(-10.0);
      v75.radians = sub_10001AC0C(v72);
      v76.radians = sub_10001AC0C(v73);
      SPEulerAngleOrder v77 = sub_100024D98();
      sub_100024D58(v78, v74, v75, v76, v77);
      long long v131 = v79;
      long long v132 = v80;
      int v133 = v81;
      sub_10001AC28((uint64_t)&v131, &v128);
      long long v36 = (__int128)v126;
      uint64_t v38 = v129;
      uint64_t v37 = v130;
      break;
    case 14:
      float v82 = a5.n128_f32[0] * -0.1;
      a5.n128_u32[0] = 1041865114;
      float32x2_t v83 = (float32x2_t)vdup_lane_s32((int32x2_t)a5.n128_u64[0], 0);
      v83.f32[0] = v82 + 0.0;
      float32x2_t v84 = vmul_n_f32(v83, a4.n128_f32[0]);
      v83.i32[0] = vadd_f32(v84, (float32x2_t)0x3F0000003F000000).u32[0];
      v83.i32[1] = vsub_f32((float32x2_t)vdup_n_s32(0x3DCCCCCDu), v84).i32[1];
      long long v127 = (unint64_t)v83;
      v85.radians = sub_10001AC0C((float)(a4.n128_f32[0] * 10.0));
      v86.radians = sub_10001AC0C(30.0);
      v87.radians = sub_10001AC0C(40.0);
      SPEulerAngleOrder v88 = sub_100024D98();
      sub_100024D58(v89, v85, v86, v87, v88);
      long long v131 = v90;
      long long v132 = v91;
      int v133 = v92;
      sub_10001AC28((uint64_t)&v131, &v128);
      long long v36 = v127;
      uint64_t v38 = v129;
      uint64_t v37 = v130;
      float64_t v63 = v128.f64[1];
      float64_t v64 = v128.f64[0];
      float v39 = 1.0;
      float v9 = 0.9;
      goto LABEL_30;
    case 15:
      LODWORD(v93) = -1091894772;
      *((float *)&v93 + 1) = (float)(a4.n128_f32[0] * 0.04) + -0.118;
      __n128 v125 = (__n128)v93;
      float v9 = (float)(v6 * 0.05) + 0.886;
      v69.radians = sub_10001AC0C((float)((float)(a4.n128_f32[0] * 10.0) + -6.0));
      v70.radians = sub_10001AC0C(28.0);
      double v71 = -33.2000008;
      goto LABEL_28;
    case 16:
      *(float *)&unint64_t v94 = (float)((float)(a4.n128_f32[0] * 0.2) + -0.506) + (float)(a5.n128_f32[0] * 0.15);
      HIDWORD(v94) = -1113550802;
      __n128 v123 = (__n128)v94;
      float v9 = (float)((float)(v6 * 0.05) + 1.51) + (float)(a4.n128_f32[0] * -0.4);
      float v51 = (float)(a4.n128_f32[0] * 10.0) + 26.0;
      float v52 = 60.0 - (float)(a5.n128_f32[0] * 10.0);
      double v53 = -9.0;
      goto LABEL_22;
    case 17:
      __n128 v95 = a5;
      v95.n128_f32[1] = v5;
      v95.n128_u64[0] = (unint64_t)vadd_f32(vmul_f32((float32x2_t)v95.n128_u64[0], (float32x2_t)0x3D4CCCCD3DCCCCCDLL), (float32x2_t)0xBDF7CED93CF5C28FLL);
      __n128 v123 = v95;
      float v9 = (float)((float)(v6 * 0.05) + 1.96) + (float)(v5 * -0.8);
      float v51 = (float)(v5 * 10.0) + -28.0;
      float v52 = (float)(a5.n128_f32[0] * -30.0) + 61.0;
      double v53 = -15.0;
LABEL_22:
      v16.radians = sub_10001AC0C(v53);
      v17.radians = sub_10001AC0C(v51);
      double v23 = v52;
LABEL_23:
      v96.radians = sub_10001AC0C(v23);
      SPEulerAngleOrder v97 = sub_100024D98();
      sub_100024D58(v98, v16, v17, v96, v97);
      long long v131 = v99;
      long long v132 = v100;
      int v133 = v101;
      sub_10001AC28((uint64_t)&v131, &v128);
      long long v36 = (__int128)v123;
      uint64_t v38 = v129;
      uint64_t v37 = v130;
      float v39 = 0.5;
      break;
    case 18:
      float v9 = (float)((float)(v6 * 0.05) + 0.905) + (float)(a4.n128_f32[0] * -0.3);
      float v102 = (float)(a4.n128_f32[0] * 10.0) + 35.0;
      float v103 = (float)(a5.n128_f32[0] * -30.0) + 75.0;
      v104.radians = sub_10001AC0C(25.0);
      v105.radians = sub_10001AC0C(v102);
      v106.radians = sub_10001AC0C(v103);
      SPEulerAngleOrder v107 = sub_100024D98();
      sub_100024D58(v108, v104, v105, v106, v107);
      long long v131 = v109;
      long long v132 = v110;
      int v133 = v111;
      sub_10001AC28((uint64_t)&v131, &v128);
      uint64_t v38 = v129;
      uint64_t v37 = v130;
      float64_t v63 = v128.f64[1];
      float64_t v64 = v128.f64[0];
      float v39 = 1.0;
      long long v36 = xmmword_100027040;
      goto LABEL_30;
    case 19:
      *(float *)&unint64_t v112 = (float)(a4.n128_f32[0] * 0.2) + -0.574;
      HIDWORD(v112) = -1107833127;
      __n128 v125 = (__n128)v112;
      float v9 = (float)((float)(v6 * 0.05) + 0.969) + (float)(a4.n128_f32[0] * -0.3);
      float v113 = (float)(a4.n128_f32[0] * -10.0) + -35.0;
      v69.radians = sub_10001AC0C(-4.84000015);
      double v114 = v113;
      goto LABEL_27;
    case 20:
      a4.n128_u64[0] = (unint64_t)vadd_f32(vmul_n_f32((float32x2_t)0x3D4CCCCD3DCCCCCDLL, a5.n128_f32[0]), (float32x2_t)0xBD4CCCCD3EB33333);
      __n128 v125 = a4;
      float v9 = (float)((float)(v6 * 0.05) + 1.15) + (float)(v5 * -0.3);
      v69.radians = sub_10001AC0C((float)((float)(v5 * -10.0) + -5.0));
      double v114 = -34.2000008;
LABEL_27:
      v70.radians = sub_10001AC0C(v114);
      double v71 = 49.2999992;
LABEL_28:
      v115.radians = sub_10001AC0C(v71);
      SPEulerAngleOrder v116 = sub_100024D98();
      sub_100024D58(v117, v69, v70, v115, v116);
      long long v131 = v118;
      long long v132 = v119;
      int v133 = v120;
      sub_10001AC28((uint64_t)&v131, &v128);
      long long v36 = (__int128)v125;
      uint64_t v38 = v129;
      uint64_t v37 = v130;
      float v39 = 1.0;
      break;
    default:
      *(float *)&unint64_t v8 = (float)(a4.n128_f32[0] * 0.1) + -0.25;
      HIDWORD(v8) = -1110651699;
      __n128 v122 = (__n128)v8;
      float v9 = (float)((float)(v6 * 0.1) + (float)((float)(a4.n128_f32[0] * -0.2) + 0.7)) * 3.0;
      float v10 = (float)(a4.n128_f32[0] * 10.0) + 35.0;
      v11.radians = sub_10001AC0C(25.0);
      v12.radians = sub_10001AC0C(v10);
      double v13 = 75.0;
LABEL_10:
      v30.radians = sub_10001AC0C(v13);
      SPEulerAngleOrder v31 = sub_100024D98();
      sub_100024D58(v32, v11, v12, v30, v31);
      long long v131 = v33;
      long long v132 = v34;
      int v133 = v35;
      sub_10001AC28((uint64_t)&v131, &v128);
      long long v36 = (__int128)v122;
      uint64_t v38 = v129;
      uint64_t v37 = v130;
      float v39 = 0.0;
      break;
  }
  float64_t v63 = v128.f64[1];
  float64_t v64 = v128.f64[0];
LABEL_30:
  *(_OWORD *)a2 = v36;
  *(float *)(a2 + 16) = v9;
  *(float64_t *)(a2 + 32) = v64;
  *(float64_t *)(a2 + 40) = v63;
  *(void *)(a2 + 48) = v38;
  *(void *)(a2 + 56) = v37;
  *(_DWORD *)(a2 + 64) = 0;
  *(float *)(a2 + 68) = v39;
}

uint64_t sub_1000185B8(char *a1, char *a2)
{
  char v2 = *a2;
  unint64_t v3 = sub_100016BB0(*a1);
  uint64_t v5 = v4;
  if (v3 == sub_100016BB0(v2) && v5 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = sub_100024FC8();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

Swift::Int sub_100018644()
{
  char v1 = *v0;
  sub_100025048();
  sub_100016BB0(v1);
  sub_100024C28();
  swift_bridgeObjectRelease();
  return sub_100025068();
}

uint64_t sub_1000186A8()
{
  sub_100016BB0(*v0);
  sub_100024C28();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_1000186FC()
{
  char v1 = *v0;
  sub_100025048();
  sub_100016BB0(v1);
  sub_100024C28();
  swift_bridgeObjectRelease();
  return sub_100025068();
}

uint64_t sub_10001875C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_100019218();
  *a1 = result;
  return result;
}

unint64_t sub_10001878C@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_100016BB0(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

void sub_1000187B8(void *a1@<X8>)
{
  *a1 = &off_1000311D8;
}

BOOL sub_1000187C8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

Swift::Int sub_1000187E0()
{
  Swift::UInt v1 = *v0;
  sub_100025048();
  sub_100025058(v1);
  return sub_100025068();
}

void sub_100018828()
{
  sub_100025058(*v0);
}

Swift::Int sub_100018854()
{
  Swift::UInt v1 = *v0;
  sub_100025048();
  sub_100025058(v1);
  return sub_100025068();
}

uint64_t sub_100018898@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_100024AD8();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4, v6);
  char v8 = (char *)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100024B08();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9, v11);
  double v13 = (char *)&v37 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100024968();
  sub_100024AF8();
  double v15 = v14;
  (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v9);
  sub_100024978();
  sub_100024AC8();
  double v17 = v16;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  sub_1000249B8();
  unsigned __int32 v21 = v18;
  int v22 = *(unsigned __int8 *)(v1 + 19);
  if (v22 != 2)
  {
    if (v22)
    {
      if (qword_100038BA0 != -1) {
        swift_once();
      }
      unint64_t v27 = &byte_100039FC0;
    }
    else
    {
      unint64_t v27 = (char *)(v1 + 16);
    }
    char v25 = *v27;
    float v26 = 1.0;
    v19.n128_u64[0] = 0;
    goto LABEL_11;
  }
  float v23 = v15;
  int v24 = *(unsigned __int8 *)(v1 + 17);
  char v25 = *(unsigned char *)(v2 + 16);
  if (v24 == 21)
  {
    float v26 = v15;
    v19.n128_f32[0] = v17;
LABEL_11:
    v20.n128_u32[0] = v21;
    sub_1000175FC(v25, (uint64_t)&v41, v26, v19, v20);
    goto LABEL_12;
  }
  v19.n128_f32[0] = v17;
  v20.n128_u32[0] = v18;
  sub_1000175FC(v25, (uint64_t)v39, v23, v19, v20);
  v28.n128_f32[0] = v17;
  v29.n128_u32[0] = v21;
  sub_1000175FC(v24, (uint64_t)v40, v23, v28, v29);
  *(float *)&double v30 = v17;
  sub_10000B680((uint64_t)v40, (uint64_t)&v41, v30);
LABEL_12:
  int v31 = v42;
  long long v38 = v43;
  uint64_t v32 = v44;
  uint64_t v33 = v45;
  int v34 = v46;
  long long v37 = v41;
  uint64_t result = sub_1000249A8();
  *(_OWORD *)a1 = v37;
  *(_DWORD *)(a1 + 16) = v31;
  *(void *)(a1 + 48) = v32;
  *(void *)(a1 + 56) = v33;
  *(_OWORD *)(a1 + 32) = v38;
  *(_DWORD *)(a1 + 64) = v36;
  *(_DWORD *)(a1 + 68) = v34;
  return result;
}

uint64_t sub_100018B84()
{
  if (v0[18] == 1)
  {
    if (qword_100038B98 != -1) {
      swift_once();
    }
    swift_retain();
    uint64_t v1 = swift_bridgeObjectRetain();
    uint64_t v2 = sub_10001926C(v1, (uint64_t)v0);
    swift_bridgeObjectRelease();
    swift_release();
    unint64_t v3 = v2[2];
    if (!v3) {
      goto LABEL_20;
    }
    unint64_t v4 = sub_10001918C(v3);
    if ((v4 & 0x8000000000000000) == 0)
    {
      if (v4 < v2[2])
      {
        char v5 = *((unsigned char *)v2 + v4 + 32);
        uint64_t result = swift_bridgeObjectRelease();
        v0[16] = v5;
        return result;
      }
      __break(1u);
      goto LABEL_18;
    }
    __break(1u);
  }
  else if (qword_100038B98 == -1)
  {
    goto LABEL_9;
  }
  swift_once();
LABEL_9:
  swift_retain();
  uint64_t v7 = swift_bridgeObjectRetain();
  char v8 = sub_10001A42C(v7, (uint64_t)v0);
  swift_bridgeObjectRelease();
  swift_release();
  unint64_t v9 = v8[2];
  if (!v9)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v11 = v0[16];
    goto LABEL_14;
  }
  unint64_t v10 = sub_10001918C(v9);
  if ((v10 & 0x8000000000000000) != 0)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (v10 < v8[2])
  {
    char v11 = *((unsigned char *)v8 + v10 + 32);
    uint64_t result = swift_bridgeObjectRelease();
LABEL_14:
    v0[17] = v11;
    return result;
  }
LABEL_19:
  __break(1u);
LABEL_20:
  uint64_t result = swift_bridgeObjectRelease();
  __break(1u);
  return result;
}

uint64_t sub_100018D14()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for PrideLightsCameraController()
{
  return self;
}

uint64_t getEnumTagSinglePayload for PrideLightsCameraController.ReducedMotionStyle(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_17;
  }
  if (a2 + 1 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 1;
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
      return (*a1 | (v4 << 8)) - 1;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for PrideLightsCameraController.ReducedMotionStyle(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *uint64_t result = a2 + 1;
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
        JUMPOUT(0x100018EA4);
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
          *uint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

unsigned char *sub_100018ECC(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for PrideLightsCameraController.ReducedMotionStyle()
{
  return &type metadata for PrideLightsCameraController.ReducedMotionStyle;
}

uint64_t getEnumTagSinglePayload for PrideLightsCameraController.CameraIdentifier(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xEC) {
    goto LABEL_17;
  }
  if (a2 + 20 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 20) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 20;
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
      return (*a1 | (v4 << 8)) - 20;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 20;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x15;
  int v8 = v6 - 21;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for PrideLightsCameraController.CameraIdentifier(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 20 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 20) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xEC) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xEB)
  {
    unsigned int v6 = ((a2 - 236) >> 8) + 1;
    *uint64_t result = a2 + 20;
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
        JUMPOUT(0x100019044);
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
          *uint64_t result = a2 + 20;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PrideLightsCameraController.CameraIdentifier()
{
  return &type metadata for PrideLightsCameraController.CameraIdentifier;
}

unint64_t sub_100019080()
{
  unint64_t result = qword_100039A58;
  if (!qword_100039A58)
  {
    sub_100010958(&qword_100039A60);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100039A58);
  }
  return result;
}

unint64_t sub_1000190E0()
{
  unint64_t result = qword_100039A68;
  if (!qword_100039A68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100039A68);
  }
  return result;
}

unint64_t sub_100019138()
{
  unint64_t result = qword_100039A70;
  if (!qword_100039A70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100039A70);
  }
  return result;
}

unint64_t sub_10001918C(unint64_t result)
{
  if (result)
  {
    unint64_t v1 = result;
    swift_stdlib_random();
    unint64_t result = (0 * (unsigned __int128)v1) >> 64;
    if (-(uint64_t)v1 % v1)
    {
      while (1)
        swift_stdlib_random();
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_100019218()
{
  unint64_t v0 = sub_100024FE8();
  swift_bridgeObjectRelease();
  if (v0 >= 0x15) {
    return 21;
  }
  else {
    return v0;
  }
}

void *sub_10001926C(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = *(void *)(a1 + 16);
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
  unint64_t v3 = 0;
  uint64_t v4 = a1 + 32;
  uint64_t v5 = &_swiftEmptyArrayStorage;
  uint64_t v23 = a1 + 32;
  while (2)
  {
    char v25 = v5;
    uint64_t v6 = 0;
    if (v3 <= v2) {
      unint64_t v7 = v2;
    }
    else {
      unint64_t v7 = v3;
    }
    unint64_t v8 = v3 - v7;
LABEL_9:
    if (!(v8 + v6))
    {
      __break(1u);
      JUMPOUT(0x100019948);
    }
    char v10 = *(unsigned char *)(v4 + v3);
    unint64_t v11 = 0xEB00000000316C6CLL;
    unint64_t v12 = 0x754664656C676E61;
    switch(v10)
    {
      case 1:
        unint64_t v11 = 0xE800000000000000;
        unint64_t v12 = 0x31707565736F6C63;
        break;
      case 2:
        unint64_t v11 = 0xE800000000000000;
        unint64_t v12 = 0x32707565736F6C63;
        break;
      case 3:
        unint64_t v11 = 0xE800000000000000;
        unint64_t v12 = 0x33707565736F6C63;
        break;
      case 4:
        unint64_t v11 = 0xE700000000000000;
        unint64_t v12 = 0x316D756964656DLL;
        break;
      case 5:
        unint64_t v11 = 0xEB00000000326C6CLL;
        break;
      case 6:
        unint64_t v11 = 0xE500000000000000;
        unint64_t v12 = 0x316C6C7566;
        break;
      case 7:
        unint64_t v12 = 0x657665526C6C7566;
        uint64_t v13 = 828732274;
        goto LABEL_31;
      case 8:
        unint64_t v11 = 0xE800000000000000;
        unint64_t v12 = 0x52707565736F6C63;
        break;
      case 9:
        unint64_t v12 = 0x6C676E4164617069;
        unint64_t v11 = 0xEF316C6C75466465;
        break;
      case 10:
        unint64_t v11 = 0xEB00000000316D75;
        unint64_t v12 = 0x6964654D64617069;
        break;
      case 11:
        unint64_t v12 = 0x6C676E4164617069;
        unint64_t v11 = 0xEF326C6C75466465;
        break;
      case 12:
        unint64_t v12 = 0x736F6C4364617069;
        uint64_t v13 = 829453669;
        goto LABEL_31;
      case 13:
        unint64_t v12 = 0x736F6C4364617069;
        uint64_t v13 = 846230885;
        goto LABEL_31;
      case 14:
        unint64_t v12 = 0x736F6C4364617069;
        uint64_t v13 = 863008101;
        goto LABEL_31;
      case 15:
        unint64_t v12 = 0x736F6C4364617069;
        uint64_t v13 = 1383101797;
        goto LABEL_31;
      case 16:
        unint64_t v12 = 0x6964654D64617069;
        unint64_t v11 = 0xED00004952506D75;
        break;
      case 17:
        unint64_t v12 = 0x6C6C754664617069;
        unint64_t v11 = 0xEF65737265766552;
        break;
      case 18:
        unint64_t v12 = 0x736F6C4364617069;
        uint64_t v13 = 1349547365;
        goto LABEL_31;
      case 19:
        unint64_t v11 = 0x8000000100025950;
        unint64_t v12 = 0xD000000000000014;
        break;
      case 20:
        unint64_t v12 = 0x736F6C4364617069;
        uint64_t v13 = 1148220773;
LABEL_31:
        unint64_t v11 = v13 & 0xFFFFFFFFFFFFLL | 0xEC00000000000000;
        break;
      default:
        break;
    }
    unint64_t v14 = 0x754664656C676E61;
    unint64_t v15 = 0xEB00000000316C6CLL;
    switch(*(unsigned char *)(a2 + 16))
    {
      case 1:
        unint64_t v15 = 0xE800000000000000;
        if (v12 != 0x31707565736F6C63) {
          goto LABEL_7;
        }
        goto LABEL_68;
      case 2:
        unint64_t v15 = 0xE800000000000000;
        if (v12 != 0x32707565736F6C63) {
          goto LABEL_7;
        }
        goto LABEL_68;
      case 3:
        unint64_t v15 = 0xE800000000000000;
        if (v12 != 0x33707565736F6C63) {
          goto LABEL_7;
        }
        goto LABEL_68;
      case 4:
        unint64_t v15 = 0xE700000000000000;
        if (v12 != 0x316D756964656DLL) {
          goto LABEL_7;
        }
        goto LABEL_68;
      case 5:
        unint64_t v15 = 0xEB00000000326C6CLL;
        if (v12 != 0x754664656C676E61) {
          goto LABEL_7;
        }
        goto LABEL_68;
      case 6:
        unint64_t v15 = 0xE500000000000000;
        if (v12 != 0x316C6C7566) {
          goto LABEL_7;
        }
        goto LABEL_68;
      case 7:
        uint64_t v16 = 0x657665526C6C7566;
        uint64_t v17 = 828732274;
        goto LABEL_67;
      case 8:
        unint64_t v15 = 0xE800000000000000;
        if (v12 != 0x52707565736F6C63) {
          goto LABEL_7;
        }
        goto LABEL_68;
      case 9:
        unint64_t v15 = 0xEF316C6C75466465;
        if (v12 != 0x6C676E4164617069) {
          goto LABEL_7;
        }
        goto LABEL_68;
      case 0xA:
        unint64_t v15 = 0xEB00000000316D75;
        if (v12 != 0x6964654D64617069) {
          goto LABEL_7;
        }
        goto LABEL_68;
      case 0xB:
        unint64_t v15 = 0xEF326C6C75466465;
        if (v12 != 0x6C676E4164617069) {
          goto LABEL_7;
        }
        goto LABEL_68;
      case 0xC:
        uint64_t v16 = 0x736F6C4364617069;
        uint64_t v17 = 829453669;
        goto LABEL_67;
      case 0xD:
        uint64_t v16 = 0x736F6C4364617069;
        uint64_t v17 = 846230885;
        goto LABEL_67;
      case 0xE:
        uint64_t v16 = 0x736F6C4364617069;
        uint64_t v17 = 863008101;
        goto LABEL_67;
      case 0xF:
        uint64_t v16 = 0x736F6C4364617069;
        uint64_t v17 = 1383101797;
        goto LABEL_67;
      case 0x10:
        unint64_t v15 = 0xED00004952506D75;
        if (v12 != 0x6964654D64617069) {
          goto LABEL_7;
        }
        goto LABEL_68;
      case 0x11:
        unint64_t v15 = 0xEF65737265766552;
        if (v12 != 0x6C6C754664617069) {
          goto LABEL_7;
        }
        goto LABEL_68;
      case 0x12:
        uint64_t v16 = 0x736F6C4364617069;
        uint64_t v17 = 1349547365;
        goto LABEL_67;
      case 0x13:
        unint64_t v15 = 0x8000000100025950;
        unint64_t v14 = 0xD000000000000014;
        goto LABEL_64;
      case 0x14:
        uint64_t v16 = 0x736F6C4364617069;
        uint64_t v17 = 1148220773;
LABEL_67:
        unint64_t v15 = v17 & 0xFFFFFFFFFFFFLL | 0xEC00000000000000;
        if (v12 == v16) {
          goto LABEL_68;
        }
        goto LABEL_7;
      default:
LABEL_64:
        if (v12 != v14) {
          goto LABEL_7;
        }
LABEL_68:
        if (v11 != v15)
        {
LABEL_7:
          char v9 = sub_100024FC8();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (v9) {
            goto LABEL_8;
          }
          uint64_t v5 = v25;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            sub_10000A650(0, v25[2] + 1, 1);
            uint64_t v5 = v25;
          }
          unint64_t v19 = v5[2];
          unint64_t v18 = v5[3];
          if (v19 >= v18 >> 1)
          {
            sub_10000A650(v18 > 1, v19 + 1, 1);
            uint64_t v5 = v25;
          }
          unint64_t v20 = v3 + 1;
          v3 += 1 + v6;
          v5[2] = v19 + 1;
          *((unsigned char *)v5 + v19 + 32) = v10;
          BOOL v21 = v20 == v2;
          unint64_t v2 = v24;
          uint64_t v4 = v23;
          if (v21) {
            return v5;
          }
          continue;
        }
        swift_bridgeObjectRelease_n();
LABEL_8:
        ++v6;
        ++v4;
        if (v3 != --v2) {
          goto LABEL_9;
        }
        return v25;
    }
  }
}

void *sub_1000199F0(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return &_swiftEmptySetSingleton;
  }
  sub_100004858(&qword_100039A78);
  uint64_t v3 = sub_100024E48();
  uint64_t v4 = 0;
  uint64_t v5 = v3 + 56;
  uint64_t v25 = v1;
  uint64_t v26 = a1 + 32;
  do
  {
    int v6 = *(unsigned __int8 *)(v26 + v4++);
    sub_100025048();
    sub_100024C28();
    swift_bridgeObjectRelease();
    Swift::Int v7 = sub_100025068();
    uint64_t v8 = ~(-1 << *(unsigned char *)(v3 + 32));
    unint64_t v9 = v7 & v8;
    unint64_t v10 = (v7 & (unint64_t)v8) >> 6;
    uint64_t v11 = *(void *)(v5 + 8 * v10);
    uint64_t v12 = 1 << (v7 & v8);
    if ((v12 & v11) != 0)
    {
      while (1)
      {
        unint64_t v13 = 0xEB00000000316C6CLL;
        unint64_t v14 = 0x754664656C676E61;
        switch(*(unsigned char *)(*(void *)(v3 + 48) + v9))
        {
          case 1:
            unint64_t v13 = 0xE800000000000000;
            unint64_t v14 = 0x31707565736F6C63;
            break;
          case 2:
            unint64_t v13 = 0xE800000000000000;
            unint64_t v14 = 0x32707565736F6C63;
            break;
          case 3:
            unint64_t v13 = 0xE800000000000000;
            unint64_t v14 = 0x33707565736F6C63;
            break;
          case 4:
            unint64_t v13 = 0xE700000000000000;
            unint64_t v14 = 0x316D756964656DLL;
            break;
          case 5:
            unint64_t v13 = 0xEB00000000326C6CLL;
            break;
          case 6:
            unint64_t v13 = 0xE500000000000000;
            unint64_t v14 = 0x316C6C7566;
            break;
          case 7:
            unint64_t v14 = 0x657665526C6C7566;
            uint64_t v15 = 828732274;
            goto LABEL_27;
          case 8:
            unint64_t v13 = 0xE800000000000000;
            unint64_t v14 = 0x52707565736F6C63;
            break;
          case 9:
            unint64_t v14 = 0x6C676E4164617069;
            unint64_t v13 = 0xEF316C6C75466465;
            break;
          case 0xA:
            unint64_t v13 = 0xEB00000000316D75;
            unint64_t v14 = 0x6964654D64617069;
            break;
          case 0xB:
            unint64_t v14 = 0x6C676E4164617069;
            unint64_t v13 = 0xEF326C6C75466465;
            break;
          case 0xC:
            unint64_t v14 = 0x736F6C4364617069;
            uint64_t v15 = 829453669;
            goto LABEL_27;
          case 0xD:
            unint64_t v14 = 0x736F6C4364617069;
            uint64_t v15 = 846230885;
            goto LABEL_27;
          case 0xE:
            unint64_t v14 = 0x736F6C4364617069;
            uint64_t v15 = 863008101;
            goto LABEL_27;
          case 0xF:
            unint64_t v14 = 0x736F6C4364617069;
            uint64_t v15 = 1383101797;
            goto LABEL_27;
          case 0x10:
            unint64_t v14 = 0x6964654D64617069;
            unint64_t v13 = 0xED00004952506D75;
            break;
          case 0x11:
            unint64_t v14 = 0x6C6C754664617069;
            unint64_t v13 = 0xEF65737265766552;
            break;
          case 0x12:
            unint64_t v14 = 0x736F6C4364617069;
            uint64_t v15 = 1349547365;
            goto LABEL_27;
          case 0x13:
            unint64_t v13 = 0x8000000100025950;
            unint64_t v14 = 0xD000000000000014;
            break;
          case 0x14:
            unint64_t v14 = 0x736F6C4364617069;
            uint64_t v15 = 1148220773;
LABEL_27:
            unint64_t v13 = v15 & 0xFFFFFFFFFFFFLL | 0xEC00000000000000;
            break;
          default:
            break;
        }
        unint64_t v16 = 0x754664656C676E61;
        unint64_t v17 = 0xEB00000000316C6CLL;
        switch(v6)
        {
          case 1:
            unint64_t v17 = 0xE800000000000000;
            if (v14 == 0x31707565736F6C63) {
              goto LABEL_64;
            }
            goto LABEL_65;
          case 2:
            unint64_t v17 = 0xE800000000000000;
            if (v14 != 0x32707565736F6C63) {
              goto LABEL_65;
            }
            goto LABEL_64;
          case 3:
            unint64_t v17 = 0xE800000000000000;
            if (v14 != 0x33707565736F6C63) {
              goto LABEL_65;
            }
            goto LABEL_64;
          case 4:
            unint64_t v17 = 0xE700000000000000;
            if (v14 != 0x316D756964656DLL) {
              goto LABEL_65;
            }
            goto LABEL_64;
          case 5:
            unint64_t v17 = 0xEB00000000326C6CLL;
            if (v14 != 0x754664656C676E61) {
              goto LABEL_65;
            }
            goto LABEL_64;
          case 6:
            unint64_t v17 = 0xE500000000000000;
            if (v14 != 0x316C6C7566) {
              goto LABEL_65;
            }
            goto LABEL_64;
          case 7:
            uint64_t v18 = 0x657665526C6C7566;
            uint64_t v19 = 828732274;
            goto LABEL_63;
          case 8:
            unint64_t v17 = 0xE800000000000000;
            if (v14 != 0x52707565736F6C63) {
              goto LABEL_65;
            }
            goto LABEL_64;
          case 9:
            unint64_t v17 = 0xEF316C6C75466465;
            if (v14 != 0x6C676E4164617069) {
              goto LABEL_65;
            }
            goto LABEL_64;
          case 10:
            unint64_t v17 = 0xEB00000000316D75;
            if (v14 != 0x6964654D64617069) {
              goto LABEL_65;
            }
            goto LABEL_64;
          case 11:
            unint64_t v17 = 0xEF326C6C75466465;
            if (v14 != 0x6C676E4164617069) {
              goto LABEL_65;
            }
            goto LABEL_64;
          case 12:
            uint64_t v18 = 0x736F6C4364617069;
            uint64_t v19 = 829453669;
            goto LABEL_63;
          case 13:
            uint64_t v18 = 0x736F6C4364617069;
            uint64_t v19 = 846230885;
            goto LABEL_63;
          case 14:
            uint64_t v18 = 0x736F6C4364617069;
            uint64_t v19 = 863008101;
            goto LABEL_63;
          case 15:
            uint64_t v18 = 0x736F6C4364617069;
            uint64_t v19 = 1383101797;
            goto LABEL_63;
          case 16:
            unint64_t v17 = 0xED00004952506D75;
            if (v14 != 0x6964654D64617069) {
              goto LABEL_65;
            }
            goto LABEL_64;
          case 17:
            unint64_t v17 = 0xEF65737265766552;
            if (v14 != 0x6C6C754664617069) {
              goto LABEL_65;
            }
            goto LABEL_64;
          case 18:
            uint64_t v18 = 0x736F6C4364617069;
            uint64_t v19 = 1349547365;
            goto LABEL_63;
          case 19:
            unint64_t v17 = 0x8000000100025950;
            unint64_t v16 = 0xD000000000000014;
            goto LABEL_60;
          case 20:
            uint64_t v18 = 0x736F6C4364617069;
            uint64_t v19 = 1148220773;
LABEL_63:
            unint64_t v17 = v19 & 0xFFFFFFFFFFFFLL | 0xEC00000000000000;
            if (v14 == v18) {
              goto LABEL_64;
            }
            goto LABEL_65;
          default:
LABEL_60:
            if (v14 != v16) {
              goto LABEL_65;
            }
LABEL_64:
            if (v13 == v17)
            {
              swift_bridgeObjectRelease_n();
              goto LABEL_4;
            }
LABEL_65:
            char v20 = sub_100024FC8();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            if (v20) {
              goto LABEL_4;
            }
            unint64_t v9 = (v9 + 1) & v8;
            unint64_t v10 = v9 >> 6;
            uint64_t v11 = *(void *)(v5 + 8 * (v9 >> 6));
            uint64_t v12 = 1 << v9;
            if ((v11 & (1 << v9)) == 0) {
              goto LABEL_67;
            }
            break;
        }
      }
    }
LABEL_67:
    *(void *)(v5 + 8 * v10) = v12 | v11;
    *(unsigned char *)(*(void *)(v3 + 48) + v9) = v6;
    uint64_t v21 = *(void *)(v3 + 16);
    BOOL v22 = __OFADD__(v21, 1);
    uint64_t v23 = v21 + 1;
    if (v22)
    {
      __break(1u);
      JUMPOUT(0x10001A330);
    }
    *(void *)(v3 + 16) = v23;
LABEL_4:
    ;
  }
  while (v4 != v25);
  return (void *)v3;
}

void *sub_10001A42C(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = *(void *)(a1 + 16);
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
  unint64_t v4 = 0;
  uint64_t v5 = &_swiftEmptyArrayStorage;
  uint64_t v6 = a1 + 32;
  unint64_t v26 = *(void *)(a1 + 16);
  while (2)
  {
    __n128 v28 = v5;
    uint64_t v7 = 0;
    if (v4 <= v2) {
      unint64_t v8 = v2;
    }
    else {
      unint64_t v8 = v4;
    }
    unint64_t v29 = v4 - v8;
LABEL_9:
    if (!(v29 + v7))
    {
      __break(1u);
      JUMPOUT(0x10001AB64);
    }
    uint64_t v10 = *(unsigned __int8 *)(v6 + v4);
    unsigned __int8 v11 = *(unsigned char *)(a2 + 16);
    uint64_t v12 = sub_1000199F0((uint64_t)&off_1000311B0);
    if (sub_100016EFC(v10, (uint64_t)v12))
    {
      char v13 = sub_100016EFC(v11, (uint64_t)v12);
      swift_bridgeObjectRelease();
      if (v13) {
        goto LABEL_8;
      }
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    unint64_t v14 = 0xEB00000000316C6CLL;
    unint64_t v15 = 0x754664656C676E61;
    switch(v10)
    {
      case 1:
        unint64_t v14 = 0xE800000000000000;
        unint64_t v15 = 0x31707565736F6C63;
        break;
      case 2:
        unint64_t v14 = 0xE800000000000000;
        unint64_t v15 = 0x32707565736F6C63;
        break;
      case 3:
        unint64_t v14 = 0xE800000000000000;
        unint64_t v15 = 0x33707565736F6C63;
        break;
      case 4:
        unint64_t v14 = 0xE700000000000000;
        unint64_t v15 = 0x316D756964656DLL;
        break;
      case 5:
        unint64_t v14 = 0xEB00000000326C6CLL;
        break;
      case 6:
        unint64_t v14 = 0xE500000000000000;
        unint64_t v15 = 0x316C6C7566;
        break;
      case 7:
        unint64_t v15 = 0x657665526C6C7566;
        uint64_t v16 = 828732274;
        goto LABEL_35;
      case 8:
        unint64_t v14 = 0xE800000000000000;
        unint64_t v15 = 0x52707565736F6C63;
        break;
      case 9:
        unint64_t v15 = 0x6C676E4164617069;
        unint64_t v14 = 0xEF316C6C75466465;
        break;
      case 10:
        unint64_t v14 = 0xEB00000000316D75;
        unint64_t v15 = 0x6964654D64617069;
        break;
      case 11:
        unint64_t v15 = 0x6C676E4164617069;
        unint64_t v14 = 0xEF326C6C75466465;
        break;
      case 12:
        unint64_t v15 = 0x736F6C4364617069;
        uint64_t v16 = 829453669;
        goto LABEL_35;
      case 13:
        unint64_t v15 = 0x736F6C4364617069;
        uint64_t v16 = 846230885;
        goto LABEL_35;
      case 14:
        unint64_t v15 = 0x736F6C4364617069;
        uint64_t v16 = 863008101;
        goto LABEL_35;
      case 15:
        unint64_t v15 = 0x736F6C4364617069;
        uint64_t v16 = 1383101797;
        goto LABEL_35;
      case 16:
        unint64_t v15 = 0x6964654D64617069;
        unint64_t v14 = 0xED00004952506D75;
        break;
      case 17:
        unint64_t v15 = 0x6C6C754664617069;
        unint64_t v14 = 0xEF65737265766552;
        break;
      case 18:
        unint64_t v15 = 0x736F6C4364617069;
        uint64_t v16 = 1349547365;
        goto LABEL_35;
      case 19:
        unint64_t v14 = 0x8000000100025950;
        unint64_t v15 = 0xD000000000000014;
        break;
      case 20:
        unint64_t v15 = 0x736F6C4364617069;
        uint64_t v16 = 1148220773;
LABEL_35:
        unint64_t v14 = v16 & 0xFFFFFFFFFFFFLL | 0xEC00000000000000;
        break;
      default:
        break;
    }
    unint64_t v17 = 0x754664656C676E61;
    unint64_t v18 = 0xEB00000000316C6CLL;
    switch(*(unsigned char *)(a2 + 16))
    {
      case 1:
        unint64_t v18 = 0xE800000000000000;
        if (v15 != 0x31707565736F6C63) {
          goto LABEL_7;
        }
        goto LABEL_72;
      case 2:
        unint64_t v18 = 0xE800000000000000;
        if (v15 != 0x32707565736F6C63) {
          goto LABEL_7;
        }
        goto LABEL_72;
      case 3:
        unint64_t v18 = 0xE800000000000000;
        if (v15 != 0x33707565736F6C63) {
          goto LABEL_7;
        }
        goto LABEL_72;
      case 4:
        unint64_t v18 = 0xE700000000000000;
        if (v15 != 0x316D756964656DLL) {
          goto LABEL_7;
        }
        goto LABEL_72;
      case 5:
        unint64_t v18 = 0xEB00000000326C6CLL;
        if (v15 != 0x754664656C676E61) {
          goto LABEL_7;
        }
        goto LABEL_72;
      case 6:
        unint64_t v18 = 0xE500000000000000;
        if (v15 != 0x316C6C7566) {
          goto LABEL_7;
        }
        goto LABEL_72;
      case 7:
        uint64_t v19 = 0x657665526C6C7566;
        uint64_t v20 = 828732274;
        goto LABEL_71;
      case 8:
        unint64_t v18 = 0xE800000000000000;
        if (v15 != 0x52707565736F6C63) {
          goto LABEL_7;
        }
        goto LABEL_72;
      case 9:
        unint64_t v18 = 0xEF316C6C75466465;
        if (v15 != 0x6C676E4164617069) {
          goto LABEL_7;
        }
        goto LABEL_72;
      case 0xA:
        unint64_t v18 = 0xEB00000000316D75;
        if (v15 != 0x6964654D64617069) {
          goto LABEL_7;
        }
        goto LABEL_72;
      case 0xB:
        unint64_t v18 = 0xEF326C6C75466465;
        if (v15 != 0x6C676E4164617069) {
          goto LABEL_7;
        }
        goto LABEL_72;
      case 0xC:
        uint64_t v19 = 0x736F6C4364617069;
        uint64_t v20 = 829453669;
        goto LABEL_71;
      case 0xD:
        uint64_t v19 = 0x736F6C4364617069;
        uint64_t v20 = 846230885;
        goto LABEL_71;
      case 0xE:
        uint64_t v19 = 0x736F6C4364617069;
        uint64_t v20 = 863008101;
        goto LABEL_71;
      case 0xF:
        uint64_t v19 = 0x736F6C4364617069;
        uint64_t v20 = 1383101797;
        goto LABEL_71;
      case 0x10:
        unint64_t v18 = 0xED00004952506D75;
        if (v15 != 0x6964654D64617069) {
          goto LABEL_7;
        }
        goto LABEL_72;
      case 0x11:
        unint64_t v18 = 0xEF65737265766552;
        if (v15 != 0x6C6C754664617069) {
          goto LABEL_7;
        }
        goto LABEL_72;
      case 0x12:
        uint64_t v19 = 0x736F6C4364617069;
        uint64_t v20 = 1349547365;
        goto LABEL_71;
      case 0x13:
        unint64_t v18 = 0x8000000100025950;
        unint64_t v17 = 0xD000000000000014;
        goto LABEL_68;
      case 0x14:
        uint64_t v19 = 0x736F6C4364617069;
        uint64_t v20 = 1148220773;
LABEL_71:
        unint64_t v18 = v20 & 0xFFFFFFFFFFFFLL | 0xEC00000000000000;
        if (v15 == v19) {
          goto LABEL_72;
        }
        goto LABEL_7;
      default:
LABEL_68:
        if (v15 != v17) {
          goto LABEL_7;
        }
LABEL_72:
        if (v14 != v18)
        {
LABEL_7:
          char v9 = sub_100024FC8();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (v9) {
            goto LABEL_8;
          }
          uint64_t v5 = v28;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            sub_10000A650(0, v28[2] + 1, 1);
            uint64_t v5 = v28;
          }
          uint64_t v6 = v27;
          unint64_t v22 = v5[2];
          unint64_t v21 = v5[3];
          if (v22 >= v21 >> 1)
          {
            sub_10000A650(v21 > 1, v22 + 1, 1);
            uint64_t v6 = v27;
            uint64_t v5 = v28;
          }
          unint64_t v23 = v4 + 1;
          v4 += 1 + v7;
          v5[2] = v22 + 1;
          *((unsigned char *)v5 + v22 + 32) = v10;
          BOOL v24 = v23 == v2;
          unint64_t v2 = v26;
          if (v24) {
            return v5;
          }
          continue;
        }
        swift_bridgeObjectRelease_n();
LABEL_8:
        ++v7;
        ++v6;
        if (v4 != --v2) {
          goto LABEL_9;
        }
        return v28;
    }
  }
}

double sub_10001AC0C(double a1)
{
  return a1 / 180.0 * 3.14159265;
}

double sub_10001AC28@<D0>(uint64_t a1@<X0>, float64x2_t *a2@<X8>)
{
  int v3 = *(_DWORD *)(a1 + 32);
  __asm { FMOV            V2.2D, #0.5 }
  simd_double2 xa = (simd_double2)vmulq_f64(*(float64x2_t *)a1, _Q2);
  simd_double2 v25 = (simd_double2)(unint64_t)*(_OWORD *)&vmulq_f64(*(float64x2_t *)(a1 + 16), _Q2);
  simd_double2 v22 = _simd_cos_d2(xa);
  int64x2_t v21 = (int64x2_t)_simd_cos_d2(v25);
  simd_double2 x = _simd_sin_d2(xa);
  simd_double2 v9 = _simd_sin_d2(v25);
  if (v3 == 2)
  {
    v18.f64[0] = v9.f64[0];
    v18.f64[1] = -v9.f64[0];
    float64x2_t v14 = vmlaq_f64(vmulq_f64((float64x2_t)vzip2q_s64((int64x2_t)x, (int64x2_t)v22), vmulq_f64((float64x2_t)vzip1q_s64((int64x2_t)v22, (int64x2_t)x), v18)), (float64x2_t)vzip2q_s64((int64x2_t)v22, (int64x2_t)x), vmulq_f64((float64x2_t)vzip1q_s64(v21, (int64x2_t)v22), (float64x2_t)vzip1q_s64((int64x2_t)x, v21)));
    float64x2_t v19 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v9.f64[0], 0);
    v19.f64[0] = -*(double *)v21.i64;
    simd_double2 v9 = (simd_double2)vzip1q_s64((int64x2_t)v9, v21);
    float64x2_t v17 = vmlaq_n_f64(vmulq_n_f64(v19, vmulq_laneq_f64((float64x2_t)x, (float64x2_t)x, 1).f64[0]), (float64x2_t)v9, vmulq_laneq_f64((float64x2_t)v22, (float64x2_t)v22, 1).f64[0]);
  }
  else
  {
    if (v3 != 1)
    {
      v9.f64[0] = INFINITY;
      *a2 = (float64x2_t)xmmword_100027220;
      a2[1] = (float64x2_t)unk_100027230;
      return v9.f64[0];
    }
    float64x2_t v10 = vmulq_f64((float64x2_t)vzip2q_s64((int64x2_t)x, (int64x2_t)v22), (float64x2_t)vzip1q_s64((int64x2_t)v9, (int64x2_t)x));
    float64x2_t v11 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v9.f64[0], 0);
    v11.f64[0] = -v22.f64[0];
    v12.f64[0] = x.f64[0];
    v12.f64[1] = vmuld_lane_f64(v22.f64[0], (float64x2_t)x, 1);
    float64x2_t v13 = (float64x2_t)vdupq_lane_s64(v21.i64[0], 0);
    v13.f64[0] = vmuld_lane_f64(*(double *)v21.i64, (float64x2_t)v22, 1);
    float64x2_t v14 = vmlaq_f64(vmulq_f64(v10, v11), v13, v12);
    float64x2_t v15 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v10.f64[0], 0);
    v15.f64[0] = vmuld_lane_f64(-x.f64[0], (float64x2_t)x, 1);
    float64x2_t v16 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v22.f64[0], 0);
    v16.f64[0] = vmuld_lane_f64(v22.f64[0], (float64x2_t)v22, 1);
    v9.f64[1] = v13.f64[0];
    float64x2_t v17 = vmlaq_f64(vmulq_f64((float64x2_t)vzip1q_s64(v21, (int64x2_t)x), v15), (float64x2_t)v9, v16);
  }
  *a2 = v14;
  a2[1] = v17;
  return v9.f64[0];
}

unint64_t sub_10001AD8C()
{
  unint64_t result = qword_100039A80;
  if (!qword_100039A80)
  {
    sub_100010958(&qword_100039A88);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100039A80);
  }
  return result;
}

void sub_10001ADE8(void *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0;
}

__n128 sub_10001ADF0@<Q0>(float32x4_t *a1@<X0>, float32x4_t *a2@<X1>, __n128 *a3@<X8>)
{
  __n128 result = (__n128)vaddq_f32(*a1, *a2);
  result.n128_u32[3] = 0;
  *a3 = result;
  return result;
}

__n128 sub_10001AE08(float32x2_t *a1, float32x2_t *a2)
{
  result.n128_u64[0] = (unint64_t)vadd_f32(*a2, *a1);
  result.n128_f32[2] = a2[1].f32[0] + a1[1].f32[0];
  result.n128_u32[3] = 0;
  *(__n128 *)a1->f32 = result;
  return result;
}

__n128 sub_10001AE30@<Q0>(float32x4_t *a1@<X0>, float32x4_t *a2@<X1>, __n128 *a3@<X8>)
{
  __n128 result = (__n128)vsubq_f32(*a1, *a2);
  result.n128_u32[3] = 0;
  *a3 = result;
  return result;
}

__n128 sub_10001AE48(float32x2_t *a1, float32x2_t *a2)
{
  result.n128_u64[0] = (unint64_t)vsub_f32(*a1, *a2);
  result.n128_f32[2] = a1[1].f32[0] - a2[1].f32[0];
  result.n128_u32[3] = 0;
  *(__n128 *)a1->f32 = result;
  return result;
}

uint64_t sub_10001AE70()
{
  uint64_t v0 = sub_100004858((uint64_t *)&unk_1000393A0);
  sub_100011928(v0, qword_100039FC8);
  uint64_t v1 = sub_10000612C(v0, (uint64_t)qword_100039FC8);
  uint64_t v2 = sub_100024AB8();
  int v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);

  return v3(v1, 1, 1, v2);
}

uint64_t sub_10001AF08(void *a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, void *a6)
{
  uint64_t v7 = v6;
  *(_DWORD *)(v6 + 96) = 0;
  *(unsigned char *)(v6 + 100) = 0;
  *(void *)(v6 + 16) = 0;
  *(void *)(v6 + 24) = 0;
  uint64_t v12 = v6 + OBJC_IVAR____TtC20PridePosterExtension22PrideParticlesRenderer_lastNonSnapshotState;
  sub_1000249E8();
  id v13 = [a1 newCommandQueue];
  if (v13)
  {
    id v14 = v13;
    double v71 = a6;
    uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    id v16 = [self bundleForClass:ObjCClassFromMetadata];
    uint64_t v72 = 0;
    id v17 = [a1 newDefaultLibraryWithBundle:v16 error:&v72];

    id v18 = (id)v72;
    if (v17)
    {
      *(void *)(v7 + 32) = a2;
      *(void *)(v7 + 40) = a3;
      uint64_t v72 = 0x73736572676F7270;
      unint64_t v73 = 0xE90000000000002DLL;
      swift_bridgeObjectRetain();
      id v19 = v18;
      v74._uint64_t countAndFlagsBits = a2;
      v74._object = a3;
      sub_100024C58(v74);
      swift_bridgeObjectRelease();
      unint64_t v20 = v73;
      int64x2_t v21 = (uint64_t *)(v7 + OBJC_IVAR____TtC20PridePosterExtension22PrideParticlesRenderer_defaultsKey);
      *int64x2_t v21 = v72;
      v21[1] = v20;
      id v22 = [self standardUserDefaults];
      swift_bridgeObjectRetain();
      NSString v23 = sub_100024BE8();
      swift_bridgeObjectRelease();
      [v22 floatForKey:v23];
      int v25 = v24;

      *(_DWORD *)(v7 + 96) = v25;
      id v26 = [self currentDevice];
      id v27 = [v26 userInterfaceIdiom];

      type metadata accessor for Particulator();
      swift_allocObject();
      swift_unknownObjectRetain();
      swift_unknownObjectRetain();
      sub_100021CA8(a1, v17, 81, 250, 2, v27 == (id)1);
      uint64_t v29 = v28;
      if (v28)
      {
        *(void *)(v7 + 48) = a1;
        *(void *)(v7 + 56) = v14;
        *(void *)(v7 + 88) = v28;
        id v30 = objc_allocWithZone((Class)MTLDepthStencilDescriptor);
        swift_unknownObjectRetain();
        swift_unknownObjectRetain();
        swift_retain();
        id v31 = [v30 init];
        [v31 setDepthWriteEnabled:1];
        [v31 setDepthCompareFunction:6];
        id v32 = [a1 newDepthStencilStateWithDescriptor:v31];
        if (v32)
        {
          *(void *)(v7 + 64) = v32;
          float v68 = v31;
          if (v71)
          {
            swift_unknownObjectRetain();
            uint64_t v33 = (void *)swift_unknownObjectRetain();
            uint64_t v34 = v29;
            sub_10002354C(v33, (float)a4 / (float)a5);
            id v35 = [v71 computeCommandEncoder];
            if (v35)
            {
              int v36 = v35;
              uint64_t v67 = v34;
              if (qword_100038BB0 != -1) {
                swift_once();
              }
              uint64_t v66 = v12;
              uint64_t v37 = sub_100024B38();
              sub_10000612C(v37, (uint64_t)qword_100039FE0);
              long long v38 = sub_100024B18();
              os_log_type_t v39 = sub_100024D68();
              if (os_log_type_enabled(v38, v39))
              {
                float v40 = (uint8_t *)swift_slowAlloc();
                *(_WORD *)float v40 = 0;
                _os_log_impl((void *)&_mh_execute_header, v38, v39, "initial update in setup command buffer", v40, 2u);
                swift_slowDealloc();
              }

              sub_1000237AC(v36, 0.0, 0.0, 0.0, 0.0, 0.0);
              [v36 endEncoding];
              swift_unknownObjectRelease();
              id v41 = [objc_allocWithZone((Class)MTLTextureDescriptor) init];
              [v41 setTextureType:4];
              [v41 setWidth:a4];
              [v41 setHeight:a5];
              [v41 setStorageMode:3];
              [v41 setUsage:4];
              [v41 setSampleCount:2];
              [v41 setPixelFormat:81];
              id v42 = [a1 newTextureWithDescriptor:v41];
              if (v42)
              {
                id v43 = v42;
                [v41 setPixelFormat:250];
                id v44 = [a1 newTextureWithDescriptor:v41];

                if (v44)
                {
                  swift_release();
                  swift_unknownObjectRelease();

                  swift_unknownObjectRelease();
                  swift_unknownObjectRelease();
                  swift_unknownObjectRelease();
                  swift_unknownObjectRelease_n();
                  *(void *)(v7 + 72) = v43;
                  *(void *)(v7 + 80) = v44;
                  return v7;
                }
                swift_unknownObjectRelease();
              }
              else
              {
              }
              sub_100008664();
              swift_allocError();
              int v55 = 1;
              *float64_t v63 = 1;
              swift_willThrow();
              swift_unknownObjectRelease();
              swift_unknownObjectRelease();
              uint64_t v29 = v67;
              swift_release();

              swift_unknownObjectRelease();
              swift_unknownObjectRelease();
              swift_unknownObjectRelease_n();
              uint64_t v12 = v66;
              goto LABEL_34;
            }
            sub_100008664();
            swift_allocError();
            unsigned char *v62 = 0;
            swift_willThrow();
            swift_unknownObjectRelease();
            swift_unknownObjectRelease();
            swift_release();

            swift_unknownObjectRelease();
            swift_unknownObjectRelease();
            swift_unknownObjectRelease_n();
          }
          else
          {
            uint64_t v56 = qword_100038BB0;
            swift_unknownObjectRetain();
            if (v56 != -1) {
              swift_once();
            }
            uint64_t v57 = sub_100024B38();
            sub_10000612C(v57, (uint64_t)qword_100039FE0);
            SPEulerAngleOrder v58 = sub_100024B18();
            os_log_type_t v59 = sub_100024D78();
            if (os_log_type_enabled(v58, v59))
            {
              long long v60 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)long long v60 = 0;
              _os_log_impl((void *)&_mh_execute_header, v58, v59, "couldn’t make setup command buffer", v60, 2u);
              swift_slowDealloc();
            }

            sub_100008664();
            swift_allocError();
            *long long v61 = 0;
            swift_willThrow();
            swift_unknownObjectRelease();
            swift_unknownObjectRelease();
            swift_release();

            swift_unknownObjectRelease();
            swift_unknownObjectRelease();
          }
          int v55 = 1;
LABEL_34:
          sub_10000E024(*(void *)(v7 + 16));
          swift_bridgeObjectRelease();
          if (v29)
          {
            swift_unknownObjectRelease();
            swift_unknownObjectRelease();
            if (v55) {
              swift_unknownObjectRelease();
            }
            swift_release();
          }
          else if (v55)
          {
            swift_unknownObjectRelease();
          }
          int v48 = 1;
          goto LABEL_41;
        }
        sub_100008664();
        swift_allocError();
        *unint64_t v54 = 0;
        swift_willThrow();
        swift_unknownObjectRelease();
        swift_unknownObjectRelease();
        swift_release();
      }
      else
      {
        if (qword_100038BB0 != -1) {
          swift_once();
        }
        uint64_t v49 = sub_100024B38();
        sub_10000612C(v49, (uint64_t)qword_100039FE0);
        unint64_t v50 = sub_100024B18();
        os_log_type_t v51 = sub_100024D78();
        if (os_log_type_enabled(v50, v51))
        {
          float v52 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)float v52 = 0;
          _os_log_impl((void *)&_mh_execute_header, v50, v51, "failed to set up Particulator", v52, 2u);
          swift_slowDealloc();
        }

        sub_100008664();
        swift_allocError();
        *double v53 = 0;
        swift_willThrow();
        swift_unknownObjectRelease();
        swift_unknownObjectRelease();
      }
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      int v55 = 0;
      goto LABEL_34;
    }
    uint64_t v45 = v12;
    id v46 = (id)v72;
    swift_bridgeObjectRelease();
    sub_100024868();

    uint64_t v12 = v45;
    swift_willThrow();
    swift_unknownObjectRelease();
    swift_errorRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  sub_100008664();
  swift_allocError();
  *long long v47 = 0;
  swift_willThrow();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  sub_10000E024(*(void *)(v7 + 16));
  int v48 = 0;
LABEL_41:
  uint64_t v64 = sub_1000249F8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v64 - 8) + 8))(v12, v64);
  if (v48) {
    swift_bridgeObjectRelease();
  }
  type metadata accessor for PrideParticlesRenderer();
  swift_deallocPartialClassInstance();
  return v7;
}

void sub_10001B9C8(char *a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v141 = a2;
  uint64_t v142 = sub_100024B08();
  uint64_t v147 = *(void *)(v142 - 8);
  __chkstk_darwin(v142, v6);
  v146 = (char *)&v132 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1000249F8();
  uint64_t v144 = *(void *)(v8 - 8);
  uint64_t v10 = __chkstk_darwin(v8, v9);
  v135 = (char *)&v132 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __chkstk_darwin(v10, v12);
  v138 = (char *)&v132 - v14;
  uint64_t v16 = __chkstk_darwin(v13, v15);
  v136 = (char *)&v132 - v17;
  uint64_t v19 = __chkstk_darwin(v16, v18);
  v137 = (char *)&v132 - v20;
  uint64_t v22 = __chkstk_darwin(v19, v21);
  int v24 = (char *)&v132 - v23;
  __chkstk_darwin(v22, v25);
  id v27 = (char *)&v132 - v26;
  uint64_t v28 = sub_100024AD8();
  uint64_t v29 = *(void *)(v28 - 8);
  __chkstk_darwin(v28, v30);
  id v32 = (char *)&v132 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100024978();
  sub_100024AC8();
  double v34 = v33;
  id v35 = *(void (**)(char *, uint64_t))(v29 + 8);
  v148 = v32;
  uint64_t v149 = v29 + 8;
  uint64_t v143 = v28;
  v150 = v35;
  v35(v32, v28);
  v152 = a1;
  char v36 = sub_100024998();
  id v37 = a4;
  id v145 = a4;
  if ((v36 & 1) == 0)
  {
    uint64_t v38 = v151 + OBJC_IVAR____TtC20PridePosterExtension22PrideParticlesRenderer_lastNonSnapshotState;
    swift_beginAccess();
    uint64_t v40 = v144 + 16;
    os_log_type_t v39 = *(void (**)(char *, uint64_t, uint64_t))(v144 + 16);
    uint64_t v133 = v38;
    v39(v27, v38, v8);
    id v41 = v148;
    sub_100024978();
    sub_100024AC8();
    id v42 = (void (*)(char *, char *, uint64_t))v39;
    double v44 = v43;
    uint64_t v45 = v143;
    id v46 = v27;
    long long v47 = v150;
    v150(v41, v143);
    v42(v24, v46, v8);
    uint64_t v134 = v40;
    v140 = v46;
    v139 = (void (*)(char *, uint64_t, uint64_t))v42;
    if (v44 == 0.0)
    {
      int v48 = *(void (**)(char *, uint64_t))(v144 + 8);
      v48(v24, v8);
      uint64_t v49 = v137;
      v42(v137, v152, v8);
      unint64_t v50 = v136;
      v42(v136, v46, v8);
      uint64_t v51 = v8;
      uint64_t v52 = v45;
      uint64_t v53 = v51;
    }
    else
    {
      sub_100024978();
      sub_100024AC8();
      int v81 = v139;
      double v83 = v82;
      v47(v41, v45);
      int v48 = *(void (**)(char *, uint64_t))(v144 + 8);
      v48(v24, v8);
      uint64_t v49 = v137;
      v81(v137, (uint64_t)v152, v8);
      unint64_t v50 = v136;
      v81(v136, (uint64_t)v46, v8);
      uint64_t v53 = v8;
      if (v83 == 0.0)
      {
        v48(v50, v8);
        v48(v49, v8);
        uint64_t v52 = v143;
        uint64_t v57 = v148;
        SPEulerAngleOrder v58 = (char *)v48;
        os_log_type_t v59 = *(void (**)(uint64_t))(v151 + 16);
        if (v59)
        {
LABEL_6:
          v137 = v58;
          uint64_t v60 = swift_retain();
          v59(v60);
          sub_10000E024((uint64_t)v59);
          SPEulerAngleOrder v58 = v137;
        }
LABEL_7:
        sub_100024978();
        sub_100024AC8();
        double v62 = v61;
        float64_t v63 = v150;
        v150(v57, v52);
        uint64_t v64 = v138;
        v139(v138, (uint64_t)v140, v53);
        v137 = v58;
        if (v62 == 1.0)
        {
          sub_100024978();
          sub_100024AC8();
          double v66 = v65;
          v63(v57, v52);
          uint64_t v67 = v144;
          ((void (*)(char *, uint64_t))v58)(v64, v53);
          if (v66 != 1.0 && (*(unsigned char *)(v151 + 100) & 1) == 0)
          {
            uint64_t v68 = v53;
            if (qword_100038BB0 != -1) {
              swift_once();
            }
            uint64_t v69 = sub_100024B38();
            sub_10000612C(v69, (uint64_t)qword_100039FE0);
            SPAngle v70 = sub_100024B18();
            os_log_type_t v71 = sub_100024D68();
            BOOL v72 = os_log_type_enabled(v70, v71);
            uint64_t v73 = v133;
            if (v72)
            {
              Swift::String v74 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)Swift::String v74 = 0;
              _os_log_impl((void *)&_mh_execute_header, v70, v71, "finished unlock transition", v74, 2u);
              swift_slowDealloc();
            }

            uint64_t v75 = v151;
            float v76 = remainderf(*(float *)(v151 + 96) + 0.2, 1.0);
            *(float *)(v75 + 96) = v76;
            *(unsigned char *)(v75 + 100) = 1;
            float v77 = v76 + -0.2;
            id v78 = [self standardUserDefaults];
            NSString v79 = sub_100024BE8();
            *(float *)&double v80 = v77;
            [v78 setFloat:v79 forKey:v80];

            id v37 = v145;
            uint64_t v53 = v68;
            goto LABEL_30;
          }
        }
        else
        {
          uint64_t v67 = v144;
          ((void (*)(char *, uint64_t))v58)(v64, v53);
        }
        sub_100024978();
        sub_100024AC8();
        double v85 = v84;
        SPAngle v86 = v150;
        v150(v57, v52);
        SPAngle v87 = v135;
        v139(v135, (uint64_t)v140, v53);
        if (v85 == 0.0)
        {
          uint64_t v144 = v53;
          uint64_t v88 = v67;
          uint64_t v89 = v151;
          sub_100024978();
          sub_100024AC8();
          double v91 = v90;
          v86(v57, v52);
          uint64_t v92 = v88;
          uint64_t v53 = v144;
          ((void (*)(char *, uint64_t))v58)(v87, v144);
          id v37 = v145;
          if (v91 == 0.0)
          {
            uint64_t v73 = v133;
          }
          else
          {
            uint64_t v73 = v133;
            if (*(unsigned char *)(v89 + 100) == 1)
            {
              uint64_t v93 = v89;
              uint64_t v67 = v92;
              if (qword_100038BB0 != -1) {
                swift_once();
              }
              uint64_t v94 = sub_100024B38();
              sub_10000612C(v94, (uint64_t)qword_100039FE0);
              __n128 v95 = sub_100024B18();
              os_log_type_t v96 = sub_100024D68();
              if (os_log_type_enabled(v95, v96))
              {
                SPEulerAngleOrder v97 = (uint8_t *)swift_slowAlloc();
                *(_WORD *)SPEulerAngleOrder v97 = 0;
                _os_log_impl((void *)&_mh_execute_header, v95, v96, "finished lock transition", v97, 2u);
                uint64_t v67 = v92;
                swift_slowDealloc();
              }

              *(unsigned char *)(v93 + 100) = 0;
              int v98 = *(_DWORD *)(v93 + 96);
              id v99 = [self standardUserDefaults];
              NSString v100 = sub_100024BE8();
              LODWORD(v101) = v98;
              [v99 setFloat:v100 forKey:v101];

              uint64_t v53 = v144;
              id v37 = v145;
              goto LABEL_30;
            }
          }
          uint64_t v67 = v92;
        }
        else
        {
          ((void (*)(char *, uint64_t))v58)(v87, v53);
          id v37 = v145;
          uint64_t v73 = v133;
        }
LABEL_30:
        ((void (*)(char *, uint64_t))v137)(v140, v53);
        swift_beginAccess();
        (*(void (**)(uint64_t, char *, uint64_t))(v67 + 24))(v73, v152, v53);
        swift_endAccess();
        goto LABEL_31;
      }
      uint64_t v52 = v143;
    }
    unint64_t v54 = v49;
    int v55 = sub_100024988() & 1;
    int v56 = sub_100024988() & 1;
    v48(v50, v53);
    v48(v54, v53);
    uint64_t v57 = v148;
    SPEulerAngleOrder v58 = (char *)v48;
    if (v55 != v56)
    {
      os_log_type_t v59 = *(void (**)(uint64_t))(v151 + 16);
      if (v59) {
        goto LABEL_6;
      }
    }
    goto LABEL_7;
  }
LABEL_31:
  float v102 = v34;
  id v103 = [v37 computeCommandEncoder];
  uint64_t v104 = v142;
  uint64_t v105 = v151;
  if (v103)
  {
    SPAngle v106 = v103;
    SPEulerAngleOrder v107 = v148;
    sub_100024978();
    sub_100024AC8();
    double v109 = v108;
    v150(v107, v143);
    float v111 = 0.3;
    if (*(unsigned char *)(v105 + 100)) {
      float v111 = 0.1;
    }
    float v110 = v109;
    float v112 = *(float *)(v105 + 96) + (float)(v111 * v110);
    float v113 = v146;
    sub_100024968();
    sub_100024AF8();
    double v115 = v114;
    (*(void (**)(char *, uint64_t))(v147 + 8))(v113, v104);
    float v116 = v115;
    *(float *)&double v115 = 1.0 - v116;
    sub_1000249A8();
    float v118 = -v117;
    sub_1000249B8();
    sub_1000237AC(v106, v112, *(float *)&v115, v102, v118, v119);
    [v106 endEncoding];
    swift_unknownObjectRelease();
  }
  id v120 = [objc_allocWithZone((Class)MTLRenderPassDescriptor) init];
  id v121 = [v120 colorAttachments];
  id v122 = [v121 objectAtIndexedSubscript:0];

  if (!v122)
  {
    __break(1u);
LABEL_45:
    __break(1u);
    return;
  }
  [v122 setTexture:*(void *)(v105 + 72)];
  [v122 setResolveTexture:v141];
  [v122 setLoadAction:2];
  if (sub_100024988()) {
    double v123 = 0.01;
  }
  else {
    double v123 = 0.98;
  }
  long long v124 = v146;
  sub_100024968();
  sub_100024AF8();
  double v126 = v125;
  (*(void (**)(char *, uint64_t))(v147 + 8))(v124, v104);
  objc_msgSend(v122, "setClearColor:", v123 * v126 * (float)((float)(v102 * -0.2) + 1.0), v123 * v126 * (float)((float)(v102 * -0.2) + 1.0), v123 * v126 * (float)((float)(v102 * -0.2) + 1.0), 1.0);
  [v122 setStoreAction:2];
  id v127 = [v120 depthAttachment];
  if (!v127) {
    goto LABEL_45;
  }
  float64x2_t v128 = v127;
  [v127 setTexture:*(void *)(v105 + 80)];
  [v128 setLoadAction:2];
  [v128 setClearDepth:0.0];
  [v128 setStoreAction:0];
  id v129 = [v145 renderCommandEncoderWithDescriptor:v120];
  if (v129)
  {
    uint64_t v130 = v129;
    sub_100023C28(v129);
    [v130 endEncoding];

    swift_unknownObjectRelease();
  }
  else
  {
    sub_100008664();
    swift_allocError();
    *long long v131 = 2;
    swift_willThrow();
  }
}

uint64_t sub_10001C7E0()
{
  sub_10000E024(*(void *)(v0 + 16));
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  uint64_t v1 = v0 + OBJC_IVAR____TtC20PridePosterExtension22PrideParticlesRenderer_lastNonSnapshotState;
  uint64_t v2 = sub_1000249F8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_10001C898()
{
  sub_10001C7E0();

  return swift_deallocClassInstance();
}

uint64_t sub_10001C8F0()
{
  return type metadata accessor for PrideParticlesRenderer();
}

uint64_t type metadata accessor for PrideParticlesRenderer()
{
  uint64_t result = qword_100039AC8;
  if (!qword_100039AC8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10001C944()
{
  uint64_t result = sub_1000249F8();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_10001CA20()
{
  return 1;
}

uint64_t sub_10001CA28@<X0>(uint64_t a1@<X8>)
{
  if (qword_100038BA8 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100004858((uint64_t *)&unk_1000393A0);
  uint64_t v3 = sub_10000612C(v2, (uint64_t)qword_100039FC8);

  return sub_1000118C0(v3, a1);
}

uint64_t sub_10001CAA4@<X0>(void *a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, void *a6@<X5>, uint64_t *a7@<X8>)
{
  type metadata accessor for PrideParticlesRenderer();
  uint64_t v15 = swift_allocObject();
  uint64_t result = sub_10001AF08(a1, a2, a3, a4, a5, a6);
  if (!v7) {
    *a7 = v15;
  }
  return result;
}

void sub_10001CB40(char *a1, uint64_t a2, uint64_t a3, void *a4)
{
}

uint64_t sub_10001CB64@<X0>(uint64_t *a1@<X8>)
{
  sub_100024B78();
  swift_allocObject();
  sub_100024B88();
  sub_100024B48();
  swift_allocObject();
  swift_retain();
  sub_100024B58();
  sub_100004858(&qword_100039C38);
  sub_100024928();
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_100027430;
  sub_10001CFF4(&qword_100039C40, (void (*)(uint64_t))&type metadata accessor for PRRenderingConfiguration);
  swift_retain();
  swift_retain();
  sub_100024918();
  sub_10001CFF4(&qword_100039C48, (void (*)(uint64_t))&type metadata accessor for PREditingConfiguration);
  swift_retain();
  sub_100024918();
  swift_release_n();
  uint64_t result = swift_release_n();
  *a1 = v2;
  return result;
}

id sub_10001CD8C()
{
  return sub_10001CDBC((uint64_t (*)(void))type metadata accessor for DrawingController);
}

id sub_10001CDA4()
{
  return sub_10001CDBC((uint64_t (*)(void))type metadata accessor for EditingController);
}

id sub_10001CDBC(uint64_t (*a1)(void))
{
  id v1 = objc_allocWithZone((Class)a1(0));

  return [v1 init];
}

uint64_t sub_10001CDFC()
{
  return swift_release();
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_10001CF58()
{
  unint64_t result = qword_100039C18;
  if (!qword_100039C18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100039C18);
  }
  return result;
}

ValueMetadata *type metadata accessor for PridePosterExtension()
{
  return &type metadata for PridePosterExtension;
}

uint64_t sub_10001CFBC()
{
  return *(void *)(*(void *)(swift_getOpaqueTypeConformance2() + 8) + 8);
}

uint64_t sub_10001CFF4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10001D03C()
{
  return sub_10001D070((unint64_t *)&unk_100039C50);
}

uint64_t sub_10001D070(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100010958(&qword_100039C28);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void *sub_10001D0B8(void *a1, uint64_t a2)
{
  if ((a2 & 0xC000000000000001) == 0)
  {
    if (*(void *)(a2 + 16))
    {
      unint64_t v6 = sub_100008868((uint64_t)a1);
      if (v7)
      {
        uint64_t v5 = *(void **)(*(void *)(a2 + 56) + 8 * v6);
        id v8 = v5;
        return v5;
      }
    }
    return 0;
  }
  id v3 = a1;
  uint64_t v4 = sub_100024EF8();

  if (!v4) {
    return 0;
  }
  sub_100006164(0, &qword_1000390E0);
  swift_unknownObjectRetain();
  swift_dynamicCast();
  uint64_t v5 = v10;
  swift_unknownObjectRelease();
  return v5;
}

uint64_t sub_10001D190(void *a1, uint64_t a2)
{
  return sub_10001D260(a1, a2, (uint64_t (*)(void))sub_100008868, (void (*)(void))&type metadata accessor for WallpaperMetalCoordination.RenderingCoordinator);
}

uint64_t sub_10001D1BC@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  if (*(void *)(a2 + 16) && (uint64_t result = sub_1000088B8(result), (v5 & 1) != 0))
  {
    unint64_t v6 = (uint64_t *)(*(void *)(a2 + 56) + 48 * result);
    uint64_t v8 = *v6;
    uint64_t v7 = v6[1];
    uint64_t v10 = v6[2];
    uint64_t v9 = v6[3];
    uint64_t v12 = v6[4];
    uint64_t v11 = v6[5];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t result = swift_bridgeObjectRetain();
  }
  else
  {
    uint64_t v8 = 0;
    uint64_t v7 = 0;
    uint64_t v10 = 0;
    uint64_t v9 = 0;
    uint64_t v12 = 0;
    uint64_t v11 = 0;
  }
  *a3 = v8;
  a3[1] = v7;
  a3[2] = v10;
  a3[3] = v9;
  a3[4] = v12;
  a3[5] = v11;
  return result;
}

uint64_t sub_10001D260(void *a1, uint64_t a2, uint64_t (*a3)(void), void (*a4)(void))
{
  if ((a2 & 0xC000000000000001) == 0)
  {
    if (*(void *)(a2 + 16))
    {
      uint64_t v9 = a3();
      if (v10)
      {
        uint64_t v8 = *(void *)(*(void *)(a2 + 56) + 8 * v9);
        swift_retain();
        return v8;
      }
    }
    return 0;
  }
  id v6 = a1;
  uint64_t v7 = sub_100024EF8();

  if (!v7) {
    return 0;
  }
  a4(0);
  swift_unknownObjectRetain();
  swift_dynamicCast();
  uint64_t v8 = v12;
  swift_unknownObjectRelease();
  return v8;
}

void sub_10001D344(void *a1, void *a2)
{
  uint64_t v3 = v2;
  id v60 = a1;
  char v5 = (void *)sub_100024A38();
  uint64_t v6 = *(v5 - 1);
  uint64_t v8 = __chkstk_darwin(v5, v7);
  double v61 = (char *)v56 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8, v10);
  uint64_t v12 = (void *)((char *)v56 - v11);
  swift_getObjectType();
  id v13 = [a2 sourceContents];
  swift_getObjectType();
  int v14 = sub_10000C610();
  swift_unknownObjectRelease();
  if (v14 != 3)
  {
    if (qword_100038BB0 != -1) {
      swift_once();
    }
    uint64_t v15 = sub_100024B38();
    v56[1] = sub_10000612C(v15, (uint64_t)qword_100039FE0);
    uint64_t v16 = sub_100024B18();
    os_log_type_t v17 = sub_100024D68();
    BOOL v18 = os_log_type_enabled(v16, v17);
    uint64_t v58 = v6;
    int v59 = v14;
    if (v18)
    {
      uint64_t v57 = v3;
      uint64_t v19 = (uint8_t *)swift_slowAlloc();
      *(void *)&long long v64 = swift_slowAlloc();
      *(_DWORD *)uint64_t v19 = 136446210;
      int v20 = v14;
      if ((_BYTE)v14)
      {
        uint64_t v21 = v5;
        if (v20 == 1)
        {
          uint64_t v22 = 0x656C636974726170;
          unint64_t v23 = 0xE900000000000073;
        }
        else
        {
          unint64_t v23 = 0xE600000000000000;
          uint64_t v22 = 0x73746867696CLL;
        }
      }
      else
      {
        uint64_t v21 = v5;
        unint64_t v23 = 0xE700000000000000;
        uint64_t v22 = 0x73657069727473;
      }
      *(void *)&long long v63 = sub_100010B4C(v22, v23, (uint64_t *)&v64);
      sub_100024DD8();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v16, v17, "setting up with identifier “%{public}s”", v19, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      uint64_t v3 = v57;
      char v5 = v21;
      int v24 = v59;
      if (!(_BYTE)v59) {
        goto LABEL_15;
      }
    }
    else
    {

      int v24 = v14;
      if (!(_BYTE)v14)
      {
LABEL_15:
        uint64_t v57 = type metadata accessor for PrideStripesRenderer();
        uint64_t v25 = (unint64_t *)&unk_100039160;
        uint64_t v26 = type metadata accessor for PrideStripesRenderer;
        goto LABEL_16;
      }
    }
    if (v24 == 1)
    {
      uint64_t v57 = type metadata accessor for PrideParticlesRenderer();
      uint64_t v25 = (unint64_t *)&unk_100039158;
      uint64_t v26 = type metadata accessor for PrideParticlesRenderer;
    }
    else
    {
      uint64_t v57 = type metadata accessor for PrideLightsRenderer();
      uint64_t v25 = (unint64_t *)&unk_1000390F0;
      uint64_t v26 = type metadata accessor for PrideLightsRenderer;
    }
LABEL_16:
    v56[2] = sub_10000E034(v25, (void (*)(uint64_t))v26);
    uint64_t v27 = swift_unknownObjectRetain();
    sub_100011F48(v27, (uint64_t *)&v64);
    v69[0] = v64;
    uint64_t v28 = v65;
    uint64_t v29 = v66;
    sub_100020998((uint64_t)&v67, (uint64_t)v68, (uint64_t *)&unk_100039D00);
    uint64_t v30 = (uint64_t *)(v3 + OBJC_IVAR____TtC20PridePosterExtension17EditingController_configurations);
    swift_beginAccess();
    id v31 = v60;
    sub_1000209FC((uint64_t)v69);
    swift_bridgeObjectRetain();
    sub_1000209FC((uint64_t)v68);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v62 = *v30;
    *uint64_t v30 = 0x8000000000000000;
    sub_100020270(&v64, v31, isUniquelyReferenced_nonNull_native);
    *uint64_t v30 = v62;

    swift_bridgeObjectRelease();
    swift_endAccess();
    if ((_BYTE)v59 && v59 != 1)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      char v33 = sub_100024FC8();
      swift_bridgeObjectRelease();
      if ((v33 & 1) == 0)
      {
        double v34 = &off_100031260;
LABEL_32:
        void *v12 = v34;
        uint64_t v52 = v58;
        (*(void (**)(void *, void, void *))(v58 + 104))(v12, enum case for WallpaperMetalCoordination.EditingCoordinator.LookSelectionStyle.paged(_:), v5);
        long long v63 = v69[0];
        swift_bridgeObjectRetain();
        v70._uint64_t countAndFlagsBits = 44;
        v70._object = (void *)0xE100000000000000;
        sub_100024C58(v70);
        swift_bridgeObjectRetain();
        v71._uint64_t countAndFlagsBits = v28;
        v71._object = v29;
        sub_100024C58(v71);
        swift_bridgeObjectRelease();
        sub_10000DFB8((uint64_t)v69);
        swift_bridgeObjectRelease();
        sub_10000DFB8((uint64_t)v68);
        swift_unknownObjectRetain();
        sub_10001DFF8(v31);
        uint64_t v53 = *(void (**)(char *, void *, void *))(v52 + 16);
        id v60 = v31;
        v53(v61, v12, v5);
        sub_100024A58();
        swift_allocObject();
        sub_100024A18();
        (*(void (**)(void *, void *))(v52 + 8))(v12, v5);
        swift_beginAccess();
        id v54 = v60;
        uint64_t v55 = swift_retain();
        sub_10001F1B4(v55, (uint64_t)v54, (void (*)(uint64_t, uint64_t, uint64_t))sub_1000200FC, sub_10001F710);
        swift_endAccess();
        swift_release();

        return;
      }
    }
    id v60 = v5;
    *(void *)&long long v63 = _swiftEmptyArrayStorage;
    sub_10000A6F0(0, 5, 0);
    double v34 = (_UNKNOWN **)v63;
    v56[0] = v28;
    unint64_t v36 = *(void *)(v63 + 16);
    unint64_t v35 = *(void *)(v63 + 24);
    unint64_t v37 = v36 + 1;
    if (v36 >= v35 >> 1)
    {
      sub_10000A6F0(v35 > 1, v36 + 1, 1);
      double v34 = (_UNKNOWN **)v63;
    }
    v34[2] = (_UNKNOWN *)v37;
    uint64_t v38 = &v34[2 * v36];
    v38[4] = (_UNKNOWN *)6647407;
    v38[5] = (_UNKNOWN *)0xE300000000000000;
    *(void *)&long long v63 = v34;
    unint64_t v39 = (unint64_t)v34[3];
    int64_t v40 = v36 + 2;
    if (v37 >= v39 >> 1)
    {
      sub_10000A6F0(v39 > 1, v40, 1);
      double v34 = (_UNKNOWN **)v63;
    }
    v34[2] = (_UNKNOWN *)v40;
    id v41 = &v34[2 * v37];
    v41[4] = (_UNKNOWN *)7305076;
    v41[5] = (_UNKNOWN *)0xE300000000000000;
    *(void *)&long long v63 = v34;
    unint64_t v43 = (unint64_t)v34[2];
    unint64_t v42 = (unint64_t)v34[3];
    unint64_t v44 = v43 + 1;
    if (v43 >= v42 >> 1)
    {
      sub_10000A6F0(v42 > 1, v43 + 1, 1);
      double v34 = (_UNKNOWN **)v63;
    }
    v34[2] = (_UNKNOWN *)v44;
    uint64_t v45 = &v34[2 * v43];
    v45[4] = (_UNKNOWN *)0x6565726874;
    v45[5] = (_UNKNOWN *)0xE500000000000000;
    *(void *)&long long v63 = v34;
    unint64_t v46 = (unint64_t)v34[3];
    int64_t v47 = v43 + 2;
    if (v44 >= v46 >> 1)
    {
      sub_10000A6F0(v46 > 1, v47, 1);
      double v34 = (_UNKNOWN **)v63;
    }
    v34[2] = (_UNKNOWN *)v47;
    int v48 = &v34[2 * v44];
    v48[4] = (_UNKNOWN *)1920298854;
    v48[5] = (_UNKNOWN *)0xE400000000000000;
    *(void *)&long long v63 = v34;
    unint64_t v50 = (unint64_t)v34[2];
    unint64_t v49 = (unint64_t)v34[3];
    if (v50 >= v49 >> 1)
    {
      sub_10000A6F0(v49 > 1, v50 + 1, 1);
      double v34 = (_UNKNOWN **)v63;
    }
    v34[2] = (_UNKNOWN *)(v50 + 1);
    uint64_t v51 = &v34[2 * v50];
    v51[4] = (_UNKNOWN *)1702259046;
    id v51[5] = (_UNKNOWN *)0xE400000000000000;
    char v5 = v60;
    uint64_t v28 = v56[0];
    goto LABEL_32;
  }
}

uint64_t sub_10001DFF8(void *a1)
{
  unint64_t v3 = (unint64_t)sub_100020498(a1);
  uint64_t v4 = (uint64_t *)(v1 + OBJC_IVAR____TtC20PridePosterExtension17EditingController_configurations);
  swift_beginAccess();
  uint64_t v5 = *v4;
  id v6 = a1;
  swift_bridgeObjectRetain();
  sub_10001D1BC((uint64_t)v6, v5, v30);
  uint64_t v7 = v30[4];
  uint64_t v8 = (void *)v30[5];

  swift_bridgeObjectRelease();
  sub_100020998((uint64_t)v30, (uint64_t)v32, &qword_100039CF8);
  if (!v33)
  {
    id v9 = [v6 environment];
    swift_getObjectType();
    sub_100011F48((uint64_t)v9, v31);
    uint64_t v7 = v31[4];
    uint64_t v8 = (void *)v31[5];
  }
  unint64_t v10 = v3 >> 62;
  if (v8)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    if (sub_1000111A4(v7, v8) == 5)
    {
      swift_bridgeObjectRetain();
      unint64_t v11 = 0xE300000000000000;
      uint64_t v12 = 6647407;
      switch(sub_1000111F0())
      {
        case 1u:
          uint64_t v12 = 7305076;
          goto LABEL_11;
        case 2u:
          uint64_t v12 = 0x6565726874;
          unint64_t v11 = 0xE500000000000000;
          goto LABEL_11;
        case 3u:
          unint64_t v11 = 0xE400000000000000;
          uint64_t v12 = 1920298854;
          goto LABEL_11;
        case 4u:
          unint64_t v11 = 0xE400000000000000;
          uint64_t v12 = 1702259046;
          goto LABEL_11;
        case 5u:
          break;
        default:
LABEL_11:
          swift_bridgeObjectRelease();
          uint64_t v8 = (void *)v11;
          uint64_t v7 = v12;
          break;
      }
    }
    if (v10) {
      goto LABEL_29;
    }
    uint64_t v13 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    for (; v13; uint64_t v13 = sub_100024F38())
    {
      unint64_t v29 = v10;
      uint64_t v14 = 4;
      while (1)
      {
        unint64_t v10 = v14 - 4;
        id v15 = (v3 & 0xC000000000000001) != 0 ? (id)sub_100024E68() : *(id *)(v3 + 8 * v14);
        uint64_t v16 = v15;
        uint64_t v17 = v14 - 3;
        if (__OFADD__(v10, 1)) {
          break;
        }
        id v18 = [v15 identifier];
        uint64_t v19 = sub_100024BF8();
        uint64_t v21 = v20;

        if (v19 == v7 && v21 == v8)
        {
          swift_bridgeObjectRelease_n();

          swift_bridgeObjectRelease();
          return v7;
        }
        char v23 = sub_100024FC8();

        swift_bridgeObjectRelease();
        if (v23)
        {
          swift_bridgeObjectRelease_n();
          return v7;
        }
        ++v14;
        if (v17 == v13)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          unint64_t v10 = v29;
          goto LABEL_31;
        }
      }
      __break(1u);
LABEL_29:
      swift_bridgeObjectRetain();
    }
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
LABEL_31:
  if (v10)
  {
    swift_bridgeObjectRetain();
    uint64_t v27 = sub_100024F38();
    swift_bridgeObjectRelease();
    if (v27) {
      goto LABEL_33;
    }
LABEL_38:
    swift_bridgeObjectRelease();
    return 0;
  }
  if (!*(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
    goto LABEL_38;
  }
LABEL_33:
  if ((v3 & 0xC000000000000001) != 0)
  {
    id v24 = (id)sub_100024E68();
  }
  else
  {
    if (!*(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      JUMPOUT(0x10001E3D0);
    }
    id v24 = *(id *)(v3 + 32);
  }
  uint64_t v25 = v24;
  swift_bridgeObjectRelease();
  id v26 = [v25 identifier];

  uint64_t v7 = sub_100024BF8();
  return v7;
}

uint64_t sub_10001E58C(void *a1, void *a2)
{
  uint64_t v5 = (uint64_t *)(v2 + OBJC_IVAR____TtC20PridePosterExtension17EditingController_coordinators);
  swift_beginAccess();
  uint64_t v6 = *v5;
  id v7 = a1;
  swift_bridgeObjectRetain();
  uint64_t v8 = sub_10001D260(v7, v6, (uint64_t (*)(void))sub_1000088B8, (void (*)(void))&type metadata accessor for WallpaperMetalCoordination.EditingCoordinator);

  uint64_t result = swift_bridgeObjectRelease();
  if (v8)
  {
    id v10 = [a2 identifier];
    sub_100024BF8();

    sub_100024A48();
    swift_release();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_10001E860(void *a1, void *a2, void *a3)
{
  id v7 = (uint64_t *)(v3 + OBJC_IVAR____TtC20PridePosterExtension17EditingController_coordinators);
  swift_beginAccess();
  uint64_t v8 = *v7;
  id v9 = a1;
  swift_bridgeObjectRetain();
  uint64_t v10 = sub_10001D260(v9, v8, (uint64_t (*)(void))sub_1000088B8, (void (*)(void))&type metadata accessor for WallpaperMetalCoordination.EditingCoordinator);

  uint64_t result = swift_bridgeObjectRelease();
  if (v10)
  {
    id v12 = [a2 backgroundView];
    id v13 = [a3 identifier];
    sub_100024BF8();

    sub_100024A28();
    swift_release();

    return swift_bridgeObjectRelease();
  }
  return result;
}

id sub_10001EDF8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for EditingController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for EditingController()
{
  return self;
}

uint64_t sub_10001EE9C(void *a1)
{
  return sub_10001EEDC(a1, (unint64_t)sub_100008868, (void (*)(void))sub_10000A294, sub_10001F4D4);
}

uint64_t sub_10001EEDC(void *a1, unint64_t a2, void (*a3)(void), uint64_t (*a4)(uint64_t, uint64_t))
{
  uint64_t v6 = v4;
  uint64_t v8 = *v4;
  if ((v8 & 0xC000000000000001) == 0)
  {
LABEL_8:
    uint64_t v16 = a3;
    swift_bridgeObjectRetain();
    a2 = ((uint64_t (*)(void *))a2)(a1);
    char v18 = v17;
    swift_bridgeObjectRelease();
    if (v18)
    {
      int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v13 = *v6;
      uint64_t v22 = *v6;
      *uint64_t v6 = 0x8000000000000000;
      if (!isUniquelyReferenced_nonNull_native)
      {
        v16();
        uint64_t v13 = v22;
      }
      goto LABEL_11;
    }
    return 0;
  }
  if (v8 < 0) {
    uint64_t v10 = v8;
  }
  else {
    uint64_t v10 = v8 & 0xFFFFFFFFFFFFFF8;
  }
  swift_bridgeObjectRetain();
  id v11 = a1;
  a1 = (void *)sub_100024EF8();

  if (!a1)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  swift_unknownObjectRelease();
  uint64_t v12 = sub_100024EE8();
  uint64_t v13 = a4(v10, v12);
  swift_retain();
  a2 = ((uint64_t (*)(id))a2)(v11);
  char v15 = v14;
  swift_release();
  if ((v15 & 1) == 0)
  {
    __break(1u);
    goto LABEL_8;
  }
LABEL_11:

  uint64_t v20 = *(void *)(*(void *)(v13 + 56) + 8 * a2);
  sub_10001F94C(a2, v13);
  *uint64_t v6 = v13;
  swift_bridgeObjectRelease();
  return v20;
}

uint64_t sub_10001F050@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_1000088B8(a1);
  LOBYTE(a1) = v7;
  uint64_t result = swift_bridgeObjectRelease();
  if (a1)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v10 = *v3;
    uint64_t v18 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_10000A450();
      uint64_t v10 = v18;
    }

    id v11 = (uint64_t *)(*(void *)(v10 + 56) + 48 * v6);
    uint64_t v12 = *v11;
    uint64_t v13 = v11[1];
    uint64_t v14 = v11[2];
    uint64_t v15 = v11[3];
    uint64_t v16 = v11[4];
    uint64_t v17 = v11[5];
    sub_10001FB00(v6, v10);
    *uint64_t v3 = v10;
    uint64_t result = swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v12 = 0;
    uint64_t v13 = 0;
    uint64_t v14 = 0;
    uint64_t v15 = 0;
    uint64_t v16 = 0;
    uint64_t v17 = 0;
  }
  *a2 = v12;
  a2[1] = v13;
  a2[2] = v14;
  a2[3] = v15;
  a2[4] = v16;
  a2[5] = v17;
  return result;
}

uint64_t sub_10001F15C(uint64_t a1, uint64_t a2)
{
  return sub_10001F1B4(a1, a2, (void (*)(uint64_t, uint64_t, uint64_t))sub_10001FE14, sub_10001F280);
}

uint64_t sub_10001F188(uint64_t a1, uint64_t a2)
{
  return sub_10001F1B4(a1, a2, (void (*)(uint64_t, uint64_t, uint64_t))sub_10001FF88, sub_10001F4D4);
}

uint64_t sub_10001F1B4(uint64_t a1, uint64_t a2, void (*a3)(uint64_t, uint64_t, uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  unint64_t v6 = v4;
  uint64_t v9 = *v4;
  if ((*v4 & 0xC000000000000001) != 0)
  {
    if (v9 < 0) {
      uint64_t v11 = *v4;
    }
    else {
      uint64_t v11 = v9 & 0xFFFFFFFFFFFFFF8;
    }
    uint64_t result = sub_100024EE8();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    *unint64_t v6 = a4(v11, result + 1);
  }
  uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v14 = *v6;
  *unint64_t v6 = 0x8000000000000000;
  a3(a1, a2, isUniquelyReferenced_nonNull_native);
  *unint64_t v6 = v14;

  return swift_bridgeObjectRelease();
}

Swift::Int sub_10001F280(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    sub_100004858(&qword_100038FE8);
    uint64_t v2 = sub_100024F68();
    uint64_t v18 = v2;
    sub_100024ED8();
    uint64_t v3 = sub_100024F08();
    if (v3)
    {
      uint64_t v4 = v3;
      sub_100006164(0, &qword_100038FE0);
      do
      {
        swift_dynamicCast();
        sub_100006164(0, &qword_1000390E0);
        swift_dynamicCast();
        uint64_t v2 = v18;
        unint64_t v12 = *(void *)(v18 + 16);
        if (*(void *)(v18 + 24) <= v12)
        {
          sub_10000943C(v12 + 1, 1);
          uint64_t v2 = v18;
        }
        Swift::Int result = sub_100024DB8(*(void *)(v2 + 40));
        uint64_t v6 = v2 + 64;
        uint64_t v7 = -1 << *(unsigned char *)(v2 + 32);
        unint64_t v8 = result & ~v7;
        unint64_t v9 = v8 >> 6;
        if (((-1 << v8) & ~*(void *)(v2 + 64 + 8 * (v8 >> 6))) != 0)
        {
          unint64_t v10 = __clz(__rbit64((-1 << v8) & ~*(void *)(v2 + 64 + 8 * (v8 >> 6)))) | v8 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          char v13 = 0;
          unint64_t v14 = (unint64_t)(63 - v7) >> 6;
          do
          {
            if (++v9 == v14 && (v13 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            BOOL v15 = v9 == v14;
            if (v9 == v14) {
              unint64_t v9 = 0;
            }
            v13 |= v15;
            uint64_t v16 = *(void *)(v6 + 8 * v9);
          }
          while (v16 == -1);
          unint64_t v10 = __clz(__rbit64(~v16)) + (v9 << 6);
        }
        *(void *)(v6 + ((v10 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v10;
        uint64_t v11 = 8 * v10;
        *(void *)(*(void *)(v2 + 48) + v11) = v17;
        *(void *)(*(void *)(v2 + 56) + v11) = v4;
        ++*(void *)(v2 + 16);
        uint64_t v4 = sub_100024F08();
      }
      while (v4);
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return (Swift::Int)&_swiftEmptyDictionarySingleton;
  }
  return v2;
}

Swift::Int sub_10001F4D4(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    sub_100004858((uint64_t *)&unk_100038FF0);
    uint64_t v2 = sub_100024F68();
    uint64_t v18 = v2;
    sub_100024ED8();
    uint64_t v3 = sub_100024F08();
    if (v3)
    {
      uint64_t v4 = v3;
      sub_100006164(0, &qword_100038FE0);
      do
      {
        swift_dynamicCast();
        sub_100024AA8();
        swift_dynamicCast();
        uint64_t v2 = v18;
        unint64_t v12 = *(void *)(v18 + 16);
        if (*(void *)(v18 + 24) <= v12)
        {
          sub_100009710(v12 + 1, 1);
          uint64_t v2 = v18;
        }
        Swift::Int result = sub_100024DB8(*(void *)(v2 + 40));
        uint64_t v6 = v2 + 64;
        uint64_t v7 = -1 << *(unsigned char *)(v2 + 32);
        unint64_t v8 = result & ~v7;
        unint64_t v9 = v8 >> 6;
        if (((-1 << v8) & ~*(void *)(v2 + 64 + 8 * (v8 >> 6))) != 0)
        {
          unint64_t v10 = __clz(__rbit64((-1 << v8) & ~*(void *)(v2 + 64 + 8 * (v8 >> 6)))) | v8 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          char v13 = 0;
          unint64_t v14 = (unint64_t)(63 - v7) >> 6;
          do
          {
            if (++v9 == v14 && (v13 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            BOOL v15 = v9 == v14;
            if (v9 == v14) {
              unint64_t v9 = 0;
            }
            v13 |= v15;
            uint64_t v16 = *(void *)(v6 + 8 * v9);
          }
          while (v16 == -1);
          unint64_t v10 = __clz(__rbit64(~v16)) + (v9 << 6);
        }
        *(void *)(v6 + ((v10 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v10;
        uint64_t v11 = 8 * v10;
        *(void *)(*(void *)(v2 + 48) + v11) = v17;
        *(void *)(*(void *)(v2 + 56) + v11) = v4;
        ++*(void *)(v2 + 16);
        uint64_t v4 = sub_100024F08();
      }
      while (v4);
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return (Swift::Int)&_swiftEmptyDictionarySingleton;
  }
  return v2;
}

Swift::Int sub_10001F710(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    sub_100004858(&qword_100038FC0);
    uint64_t v2 = sub_100024F68();
    uint64_t v18 = v2;
    sub_100024ED8();
    uint64_t v3 = sub_100024F08();
    if (v3)
    {
      uint64_t v4 = v3;
      sub_100006164(0, &qword_100038FA0);
      do
      {
        swift_dynamicCast();
        sub_100024A58();
        swift_dynamicCast();
        uint64_t v2 = v18;
        unint64_t v12 = *(void *)(v18 + 16);
        if (*(void *)(v18 + 24) <= v12)
        {
          sub_10000971C(v12 + 1, 1);
          uint64_t v2 = v18;
        }
        Swift::Int result = sub_100024DB8(*(void *)(v2 + 40));
        uint64_t v6 = v2 + 64;
        uint64_t v7 = -1 << *(unsigned char *)(v2 + 32);
        unint64_t v8 = result & ~v7;
        unint64_t v9 = v8 >> 6;
        if (((-1 << v8) & ~*(void *)(v2 + 64 + 8 * (v8 >> 6))) != 0)
        {
          unint64_t v10 = __clz(__rbit64((-1 << v8) & ~*(void *)(v2 + 64 + 8 * (v8 >> 6)))) | v8 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          char v13 = 0;
          unint64_t v14 = (unint64_t)(63 - v7) >> 6;
          do
          {
            if (++v9 == v14 && (v13 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            BOOL v15 = v9 == v14;
            if (v9 == v14) {
              unint64_t v9 = 0;
            }
            v13 |= v15;
            uint64_t v16 = *(void *)(v6 + 8 * v9);
          }
          while (v16 == -1);
          unint64_t v10 = __clz(__rbit64(~v16)) + (v9 << 6);
        }
        *(void *)(v6 + ((v10 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v10;
        uint64_t v11 = 8 * v10;
        *(void *)(*(void *)(v2 + 48) + v11) = v17;
        *(void *)(*(void *)(v2 + 56) + v11) = v4;
        ++*(void *)(v2 + 16);
        uint64_t v4 = sub_100024F08();
      }
      while (v4);
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return (Swift::Int)&_swiftEmptyDictionarySingleton;
  }
  return v2;
}

void sub_10001F94C(unint64_t a1, uint64_t a2)
{
  int64_t v3 = a1;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (a1 + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t v8 = sub_100024E08();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v9 = (v8 + 1) & v7;
      do
      {
        Swift::Int v10 = *(void *)(a2 + 40);
        id v11 = *(id *)(*(void *)(a2 + 48) + 8 * v6);
        Swift::Int v12 = sub_100024DB8(v10);

        Swift::Int v13 = v12 & v7;
        if (v3 >= (uint64_t)v9)
        {
          if (v13 >= v9 && v3 >= v13)
          {
LABEL_16:
            uint64_t v16 = *(void *)(a2 + 48);
            uint64_t v17 = (void *)(v16 + 8 * v3);
            uint64_t v18 = (void *)(v16 + 8 * v6);
            if (v3 != v6 || v17 >= v18 + 1) {
              void *v17 = *v18;
            }
            uint64_t v19 = *(void *)(a2 + 56);
            uint64_t v20 = (void *)(v19 + 8 * v3);
            uint64_t v21 = (void *)(v19 + 8 * v6);
            if (v3 != v6 || (int64_t v3 = v6, v20 >= v21 + 1))
            {
              *uint64_t v20 = *v21;
              int64_t v3 = v6;
            }
          }
        }
        else if (v13 >= v9 || v3 >= v13)
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
    uint64_t v22 = (uint64_t *)(v4 + 8 * (a1 >> 6));
    uint64_t v24 = *v22;
    uint64_t v23 = (-1 << a1) - 1;
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
}

void sub_10001FB00(unint64_t a1, uint64_t a2)
{
  int64_t v3 = a1;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (a1 + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t v8 = sub_100024E08();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v9 = (v8 + 1) & v7;
      do
      {
        Swift::Int v12 = *(void *)(a2 + 40);
        id v13 = *(id *)(*(void *)(a2 + 48) + 8 * v6);
        Swift::Int v14 = sub_100024DB8(v12);

        Swift::Int v15 = v14 & v7;
        if (v3 >= (uint64_t)v9)
        {
          if (v15 >= v9 && v3 >= v15)
          {
LABEL_16:
            uint64_t v18 = *(void *)(a2 + 48);
            uint64_t v19 = (void *)(v18 + 8 * v3);
            uint64_t v20 = (void *)(v18 + 8 * v6);
            if (v3 != v6 || v19 >= v20 + 1) {
              void *v19 = *v20;
            }
            uint64_t v21 = *(void *)(a2 + 56);
            uint64_t v22 = (long long *)(v21 + 48 * v3);
            uint64_t v23 = (long long *)(v21 + 48 * v6);
            if (v3 != v6 || (int64_t v3 = v6, v22 >= v23 + 3))
            {
              long long v10 = *v23;
              long long v11 = v23[2];
              v22[1] = v23[1];
              v22[2] = v11;
              *uint64_t v22 = v10;
              int64_t v3 = v6;
            }
          }
        }
        else if (v15 >= v9 || v3 >= v15)
        {
          goto LABEL_16;
        }
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    uint64_t v24 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v25 = *v24;
    uint64_t v26 = (-1 << v3) - 1;
  }
  else
  {
    uint64_t v24 = (uint64_t *)(v4 + 8 * (a1 >> 6));
    uint64_t v26 = *v24;
    uint64_t v25 = (-1 << a1) - 1;
  }
  *uint64_t v24 = v26 & v25;
  uint64_t v27 = *(void *)(a2 + 16);
  BOOL v28 = __OFSUB__(v27, 1);
  uint64_t v29 = v27 - 1;
  if (v28)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v29;
    ++*(_DWORD *)(a2 + 36);
  }
}

_OWORD *sub_10001FCC8(_OWORD *a1, uint64_t a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = (void *)*v3;
  unint64_t v10 = sub_1000086B8(a2);
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
      sub_100009D1C();
      goto LABEL_7;
    }
    sub_100008DC0(v13, a3 & 1);
    unint64_t v19 = sub_1000086B8(a2);
    if ((v14 & 1) == (v20 & 1))
    {
      unint64_t v10 = v19;
      uint64_t v16 = *v4;
      if (v14) {
        goto LABEL_8;
      }
LABEL_13:
      sub_10000B364(a2, (uint64_t)v21);
      return sub_10002041C(v10, (uint64_t)v21, a1, v16);
    }
LABEL_15:
    Swift::Int result = (_OWORD *)sub_100024FF8();
    __break(1u);
    return result;
  }
LABEL_7:
  uint64_t v16 = *v4;
  if ((v14 & 1) == 0) {
    goto LABEL_13;
  }
LABEL_8:
  uint64_t v17 = (_OWORD *)(v16[7] + 32 * v10);
  sub_10000DED4((uint64_t)v17);

  return sub_10000B47C(a1, v17);
}

void sub_10001FE14(uint64_t a1, void *a2, char a3)
{
  uint64_t v4 = v3;
  uint64_t v7 = *v3;
  unint64_t v9 = sub_100008868((uint64_t)a2);
  uint64_t v10 = *(void *)(v7 + 16);
  BOOL v11 = (v8 & 1) == 0;
  uint64_t v12 = v10 + v11;
  if (__OFADD__(v10, v11))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v13 = v8;
  uint64_t v14 = *(void *)(v7 + 24);
  if (v14 >= v12 && (a3 & 1) != 0) {
    goto LABEL_7;
  }
  if (v14 >= v12 && (a3 & 1) == 0)
  {
    sub_10000A0EC();
LABEL_7:
    uint64_t v15 = (void *)*v4;
    if (v13)
    {
LABEL_8:
      uint64_t v16 = v15[7];

      *(void *)(v16 + 8 * v9) = a1;
      return;
    }
    goto LABEL_11;
  }
  sub_10000943C(v12, a3 & 1);
  unint64_t v17 = sub_100008868((uint64_t)a2);
  if ((v13 & 1) != (v18 & 1))
  {
LABEL_17:
    sub_100006164(0, &qword_100038FE0);
    sub_100024FF8();
    __break(1u);
    return;
  }
  unint64_t v9 = v17;
  uint64_t v15 = (void *)*v4;
  if (v13) {
    goto LABEL_8;
  }
LABEL_11:
  v15[(v9 >> 6) + 8] |= 1 << v9;
  uint64_t v19 = 8 * v9;
  *(void *)(v15[6] + v19) = a2;
  *(void *)(v15[7] + v19) = a1;
  uint64_t v20 = v15[2];
  BOOL v21 = __OFADD__(v20, 1);
  uint64_t v22 = v20 + 1;
  if (v21)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  _OWORD v15[2] = v22;

  id v23 = a2;
}

id sub_10001FF88(uint64_t a1, void *a2, char a3)
{
  uint64_t v4 = v3;
  uint64_t v7 = *v3;
  unint64_t v9 = sub_100008868((uint64_t)a2);
  uint64_t v10 = *(void *)(v7 + 16);
  BOOL v11 = (v8 & 1) == 0;
  uint64_t v12 = v10 + v11;
  if (__OFADD__(v10, v11))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v13 = v8;
  uint64_t v14 = *(void *)(v7 + 24);
  if (v14 >= v12 && (a3 & 1) != 0) {
    goto LABEL_7;
  }
  if (v14 >= v12 && (a3 & 1) == 0)
  {
    sub_10000A294();
LABEL_7:
    uint64_t v15 = (void *)*v4;
    if (v13)
    {
LABEL_8:
      uint64_t v16 = v15[7];
      id result = (id)swift_release();
      *(void *)(v16 + 8 * v9) = a1;
      return result;
    }
    goto LABEL_11;
  }
  sub_100009710(v12, a3 & 1);
  unint64_t v18 = sub_100008868((uint64_t)a2);
  if ((v13 & 1) != (v19 & 1))
  {
LABEL_17:
    sub_100006164(0, &qword_100038FE0);
    id result = (id)sub_100024FF8();
    __break(1u);
    return result;
  }
  unint64_t v9 = v18;
  uint64_t v15 = (void *)*v4;
  if (v13) {
    goto LABEL_8;
  }
LABEL_11:
  v15[(v9 >> 6) + 8] |= 1 << v9;
  uint64_t v20 = 8 * v9;
  *(void *)(v15[6] + v20) = a2;
  *(void *)(v15[7] + v20) = a1;
  uint64_t v21 = v15[2];
  BOOL v22 = __OFADD__(v21, 1);
  uint64_t v23 = v21 + 1;
  if (v22)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  _OWORD v15[2] = v23;

  return a2;
}

id sub_1000200FC(uint64_t a1, void *a2, char a3)
{
  uint64_t v4 = v3;
  uint64_t v7 = *v3;
  unint64_t v9 = sub_1000088B8((uint64_t)a2);
  uint64_t v10 = *(void *)(v7 + 16);
  BOOL v11 = (v8 & 1) == 0;
  uint64_t v12 = v10 + v11;
  if (__OFADD__(v10, v11))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v13 = v8;
  uint64_t v14 = *(void *)(v7 + 24);
  if (v14 >= v12 && (a3 & 1) != 0) {
    goto LABEL_7;
  }
  if (v14 >= v12 && (a3 & 1) == 0)
  {
    sub_10000A2A0();
LABEL_7:
    uint64_t v15 = (void *)*v4;
    if (v13)
    {
LABEL_8:
      uint64_t v16 = v15[7];
      id result = (id)swift_release();
      *(void *)(v16 + 8 * v9) = a1;
      return result;
    }
    goto LABEL_11;
  }
  sub_10000971C(v12, a3 & 1);
  unint64_t v18 = sub_1000088B8((uint64_t)a2);
  if ((v13 & 1) != (v19 & 1))
  {
LABEL_17:
    sub_100006164(0, &qword_100038FA0);
    id result = (id)sub_100024FF8();
    __break(1u);
    return result;
  }
  unint64_t v9 = v18;
  uint64_t v15 = (void *)*v4;
  if (v13) {
    goto LABEL_8;
  }
LABEL_11:
  v15[(v9 >> 6) + 8] |= 1 << v9;
  uint64_t v20 = 8 * v9;
  *(void *)(v15[6] + v20) = a2;
  *(void *)(v15[7] + v20) = a1;
  uint64_t v21 = v15[2];
  BOOL v22 = __OFADD__(v21, 1);
  uint64_t v23 = v21 + 1;
  if (v22)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  _OWORD v15[2] = v23;

  return a2;
}

id sub_100020270(_OWORD *a1, void *a2, char a3)
{
  uint64_t v4 = v3;
  uint64_t v7 = *v3;
  unint64_t v9 = sub_1000088B8((uint64_t)a2);
  uint64_t v10 = *(void *)(v7 + 16);
  BOOL v11 = (v8 & 1) == 0;
  uint64_t v12 = v10 + v11;
  if (__OFADD__(v10, v11))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v13 = v8;
  uint64_t v14 = *(void *)(v7 + 24);
  if (v14 >= v12 && (a3 & 1) != 0) {
    goto LABEL_7;
  }
  if (v14 >= v12 && (a3 & 1) == 0)
  {
    sub_10000A450();
LABEL_7:
    uint64_t v15 = (void *)*v4;
    if (v13)
    {
LABEL_8:
      uint64_t v16 = (_OWORD *)(v15[7] + 48 * v9);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      id result = (id)swift_bridgeObjectRelease();
      long long v18 = a1[1];
      *uint64_t v16 = *a1;
      v16[1] = v18;
      v16[2] = a1[2];
      return result;
    }
    goto LABEL_11;
  }
  sub_1000099FC(v12, a3 & 1);
  unint64_t v19 = sub_1000088B8((uint64_t)a2);
  if ((v13 & 1) != (v20 & 1))
  {
LABEL_17:
    sub_100006164(0, &qword_100038FA0);
    id result = (id)sub_100024FF8();
    __break(1u);
    return result;
  }
  unint64_t v9 = v19;
  uint64_t v15 = (void *)*v4;
  if (v13) {
    goto LABEL_8;
  }
LABEL_11:
  v15[(v9 >> 6) + 8] |= 1 << v9;
  *(void *)(v15[6] + 8 * v9) = a2;
  uint64_t v21 = (_OWORD *)(v15[7] + 48 * v9);
  long long v22 = a1[1];
  *uint64_t v21 = *a1;
  v21[1] = v22;
  _OWORD v21[2] = a1[2];
  uint64_t v23 = v15[2];
  BOOL v24 = __OFADD__(v23, 1);
  uint64_t v25 = v23 + 1;
  if (v24)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  _OWORD v15[2] = v25;

  return a2;
}

_OWORD *sub_10002041C(unint64_t a1, uint64_t a2, _OWORD *a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v5 = a4[6] + 40 * a1;
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)uint64_t v5 = *(_OWORD *)a2;
  *(_OWORD *)(v5 + 16) = v6;
  *(void *)(v5 + 32) = *(void *)(a2 + 32);
  id result = sub_10000B47C(a3, (_OWORD *)(a4[7] + 32 * a1));
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

void *sub_100020498(void *a1)
{
  uint64_t v2 = sub_100024908();
  __chkstk_darwin(v2 - 8, v3);
  uint64_t v27 = sub_100024BD8();
  uint64_t v4 = *(void *)(v27 - 8);
  uint64_t v6 = __chkstk_darwin(v27, v5);
  uint64_t v8 = (char *)v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6, v9);
  BOOL v11 = (char *)v26 - v10;
  objc_msgSend(objc_msgSend(a1, "environment"), "sourceContents");
  swift_unknownObjectRelease();
  swift_getObjectType();
  char v12 = sub_10000C610();
  swift_unknownObjectRelease();
  switch(v12)
  {
    case 2:
      swift_bridgeObjectRelease();
      goto LABEL_6;
    case 3:
      goto LABEL_3;
    default:
      char v13 = sub_100024FC8();
      swift_bridgeObjectRelease();
      if (v13)
      {
LABEL_6:
        BOOL v28 = _swiftEmptyArrayStorage;
        sub_100024EA8();
        uint64_t v20 = 0;
        uint64_t v21 = (void (**)(char *, char *, uint64_t))(v4 + 32);
        v26[3] = "PLUMERIA_COLOR_3";
        v26[4] = "PLUMERIA_COLOR_2";
        v26[1] = "PLUMERIA_COLOR_5";
        _OWORD v26[2] = "PLUMERIA_COLOR_4";
        v26[0] = "";
        while (2)
        {
          int v25 = *((unsigned __int8 *)&off_100031210 + v20 + 32);
          sub_100024BC8();
          (*v21)(v11, v8, v27);
          sub_1000248F8();
          sub_100024C08();
          switch(v25)
          {
            case 0:
            case 1:
            case 2:
            case 3:
            case 4:
              ++v20;
              id v22 = objc_allocWithZone((Class)PREditingLook);
              NSString v23 = sub_100024BE8();
              swift_bridgeObjectRelease();
              NSString v24 = sub_100024BE8();
              swift_bridgeObjectRelease();
              [v22 initWithIdentifier:v23 displayName:v24];

              sub_100024E88();
              sub_100024EB8();
              sub_100024EC8();
              sub_100024E98();
              if (v20 != 5) {
                continue;
              }
              return v28;
            default:
              JUMPOUT(0);
          }
        }
      }
LABEL_3:
      sub_100004858(&qword_100038E40);
      uint64_t v14 = swift_allocObject();
      *(_OWORD *)(v14 + 16) = xmmword_1000268C0;
      id v15 = objc_allocWithZone((Class)PREditingLook);
      NSString v16 = sub_100024BE8();
      NSString v17 = sub_100024BE8();
      id v18 = [v15 initWithIdentifier:v16 displayName:v17];

      *(void *)(v14 + 32) = v18;
      BOOL v28 = (void *)v14;
      sub_100024CC8();
      return v28;
  }
}

uint64_t sub_100020998(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100004858(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_1000209FC(uint64_t a1)
{
  return a1;
}

uint64_t *sub_100020A28(uint64_t *a1)
{
  return a1;
}

uint64_t sub_100020A60(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

id sub_100020AB0(void *a1)
{
  objc_msgSend(objc_msgSend(a1, "environment"), "sourceContents");
  swift_unknownObjectRelease();
  swift_getObjectType();
  char v1 = sub_10000C610();
  swift_unknownObjectRelease();
  if (v1 != 3)
  {
    id v2 = [objc_allocWithZone((Class)PREditorColorPickerConfiguration) init];
    if (v1)
    {
      if (v1 != 1) {
        return v2;
      }
      sub_100004858((uint64_t *)&unk_100038F40);
      uint64_t v3 = swift_allocObject();
      *(_OWORD *)(v3 + 16) = xmmword_100026980;
      id v4 = [self blackColor];
      id v5 = [objc_allocWithZone((Class)PRPosterColor) initWithColor:v4];

      *(void *)(v3 + 56) = sub_100006164(0, &qword_100038E50);
      *(void *)(v3 + 32) = v5;
      id v6 = objc_allocWithZone((Class)PREditorColorPalette);
      v7.super.Class isa = sub_100024CA8().super.isa;
      swift_bridgeObjectRelease();
      uint64_t v8 = 1;
      id v9 = [v6 initWithColors:v7.super.isa localizedName:0 showsColorWell:1];
    }
    else
    {
      id v10 = objc_allocWithZone((Class)PREditorColorPalette);
      v7.super.Class isa = sub_100024CA8().super.isa;
      id v9 = [v10 initWithColors:v7.super.isa localizedName:0 showsColorWell:0];
      uint64_t v8 = 0;
    }

    [v2 setColorPalette:v9];
    [v2 setColorWellDisplayMode:v8];
    Class isa = sub_100024CA8().super.isa;
    [v2 setSuggestedColors:isa];

    return v2;
  }
  return 0;
}

double sub_100020D00(void *a1)
{
  id v1 = objc_msgSend(objc_msgSend(a1, "environment"), "sourceContents");
  swift_unknownObjectRelease();
  swift_getObjectType();
  char v2 = sub_10000C610();
  swift_unknownObjectRelease();
  switch(v2)
  {
    case 1:
      swift_bridgeObjectRelease();
      return 0.9;
    case 3:
      return PREditingLookLuminanceUnknown;
    default:
      char v3 = sub_100024FC8();
      swift_bridgeObjectRelease();
      if (v3) {
        return 0.9;
      }
      else {
        return PREditingLookLuminanceUnknown;
      }
  }
}

uint64_t sub_100020E28(void *a1, uint64_t a2, uint64_t a3)
{
  id v5 = (uint64_t *)(a2 + OBJC_IVAR____TtC20PridePosterExtension17EditingController_configurations);
  swift_beginAccess();
  uint64_t v6 = *v5;
  id v7 = a1;
  swift_bridgeObjectRetain();
  sub_10001D1BC((uint64_t)v7, v6, v20);

  swift_bridgeObjectRelease();
  sub_100020998((uint64_t)v20, (uint64_t)&v21, &qword_100039CF8);
  if (*((void *)&v21 + 1))
  {
    long long v24 = v21;
    long long v25 = v22;
    long long v26 = v23;
    long long v8 = v21;
    long long v9 = v22;
    sub_100020998((uint64_t)&v26, (uint64_t)v27, (uint64_t *)&unk_100039D00);
    sub_10000DFB8((uint64_t)v27);
    id v10 = [v7 currentLook];
    id v11 = [v10 identifier];

    uint64_t v12 = sub_100024BF8();
    uint64_t v14 = v13;

    long long v28 = v8;
    long long v29 = v9;
    uint64_t v30 = v12;
    uint64_t v31 = v14;
    swift_bridgeObjectRetain();
    sub_100011BC8([v7 environment]);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
    (*(void (**)(uint64_t))(a3 + 16))(a3);
    return swift_bridgeObjectRelease();
  }
  else
  {
    if (qword_100038BB0 != -1) {
      swift_once();
    }
    uint64_t v15 = sub_100024B38();
    sub_10000612C(v15, (uint64_t)qword_100039FE0);
    NSString v16 = sub_100024B18();
    os_log_type_t v17 = sub_100024D78();
    if (os_log_type_enabled(v16, v17))
    {
      id v18 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, v17, "no configuration identifier available, this wallpaper may forget things", v18, 2u);
      swift_slowDealloc();
    }

    return (*(uint64_t (**)(uint64_t))(a3 + 16))(a3);
  }
}

ValueMetadata *type metadata accessor for PridePosterCommon()
{
  return &type metadata for PridePosterCommon;
}

uint64_t sub_100021254(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_1000061A8(*a1, *a2);
}

Swift::Int sub_100021260()
{
  return sub_100025068();
}

uint64_t sub_100021304()
{
  sub_100024C28();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_100021394()
{
  return sub_100025068();
}

uint64_t sub_100021434@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_1000215BC(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

void sub_100021464(uint64_t *a1@<X8>)
{
  int v2 = *v1;
  unint64_t v3 = 0xE700000000000000;
  unint64_t v4 = 0xE900000000000073;
  uint64_t v5 = 0x656C636974726170;
  if (v2 != 1)
  {
    uint64_t v5 = 0x73746867696CLL;
    unint64_t v4 = 0xE600000000000000;
  }
  BOOL v6 = v2 == 0;
  if (*v1) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 0x73657069727473;
  }
  if (!v6) {
    unint64_t v3 = v4;
  }
  *a1 = v7;
  a1[1] = v3;
}

void sub_1000214C4(void *a1@<X8>)
{
  *a1 = &off_100031290;
}

uint64_t sub_1000214D4()
{
  uint64_t v1 = 0x656C636974726170;
  if (*v0 != 1) {
    uint64_t v1 = 0x73746867696CLL;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x73657069727473;
  }
}

BOOL sub_100021530(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_100021544()
{
  uint64_t v0 = sub_100024B38();
  sub_100011928(v0, qword_100039FE0);
  sub_10000612C(v0, (uint64_t)qword_100039FE0);
  return sub_100024B28();
}

uint64_t sub_1000215BC(uint64_t a1, void *a2)
{
  v6._uint64_t countAndFlagsBits = a1;
  v3._rawValue = &off_100030E10;
  v6._object = a2;
  unint64_t v4 = sub_100024F98(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 3) {
    return 3;
  }
  else {
    return v4;
  }
}

ValueMetadata *type metadata accessor for PridePosterCommon.Identifier()
{
  return &type metadata for PridePosterCommon.Identifier;
}

uint64_t _s20PridePosterExtension17PridePosterCommonO10IdentifierOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFE) {
    goto LABEL_17;
  }
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
    if (v4) {
      return (*a1 | (v4 << 8)) - 2;
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
      return (*a1 | (v4 << 8)) - 2;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v8 = v6 - 3;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *_s20PridePosterExtension17PridePosterCommonO10IdentifierOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x10002177CLL);
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

ValueMetadata *type metadata accessor for PridePosterCommon.Error()
{
  return &type metadata for PridePosterCommon.Error;
}

unint64_t sub_1000217B8()
{
  unint64_t result = qword_100039D18;
  if (!qword_100039D18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100039D18);
  }
  return result;
}

unint64_t sub_100021810()
{
  unint64_t result = qword_100039D20;
  if (!qword_100039D20)
  {
    sub_100010958(&qword_100039D28);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100039D20);
  }
  return result;
}

unint64_t sub_100021870()
{
  unint64_t result = qword_100039D30;
  if (!qword_100039D30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100039D30);
  }
  return result;
}

void *sub_1000218CC(float32x4_t *a1)
{
  int64_t v2 = a1[1].i64[0];
  unint64_t result = _swiftEmptyArrayStorage;
  if (v2)
  {
    sub_10000A6D0(0, v2, 0);
    unint64_t result = _swiftEmptyArrayStorage;
    unsigned int v4 = a1 + 2;
    float32x2_t v5 = (float32x2_t)vdup_n_s32(0xBA83126F);
    do
    {
      float32x4_t v6 = *v4;
      id v11 = result;
      unint64_t v8 = result[2];
      unint64_t v7 = result[3];
      if (v8 >= v7 >> 1)
      {
        float32x4_t v10 = *v4;
        sub_10000A6D0(v7 > 1, v8 + 1, 1);
        float32x4_t v6 = v10;
        unint64_t result = v11;
      }
      *(float32x2_t *)&long long v9 = vmul_f32(*(float32x2_t *)v6.f32, v5);
      *((void *)&v9 + 1) = COERCE_UNSIGNED_INT(vmuls_lane_f32(0.001, v6, 2));
      result[2] = v8 + 1;
      *(_OWORD *)&result[2 * v8 + 4] = v9;
      ++v4;
      --v2;
    }
    while (v2);
  }
  return result;
}

void sub_1000219D0(uint64_t a1, uint64_t a2, float a3)
{
  uint64_t v3 = a2 + 1;
  if (__OFADD__(a2, 1))
  {
    __break(1u);
    goto LABEL_15;
  }
  uint64_t v4 = *(void *)(a1 + 16);
  BOOL v5 = __OFSUB__(v3, v4);
  uint64_t v6 = v3 - v4;
  if (v5)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  float v7 = ceilf((float)(v6 & ~(v6 >> 63)) * 0.5);
  if ((~LODWORD(v7) & 0x7F800000) == 0)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  if (v7 <= -9.2234e18)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  if (v7 >= 9.2234e18)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  uint64_t v8 = (uint64_t)v7;
  if ((uint64_t)v7 + 0x4000000000000000 < 0)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v9 = v4 + 2 * v8;
  if (__OFADD__(v4, 2 * v8))
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  if (__OFSUB__(v9, a2))
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  float v10 = (float)(v9 - a2) * a3;
  float v11 = floorf(v10);
  if ((~LODWORD(v11) & 0x7F800000) == 0)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  if (v11 <= -9.2234e18)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  if (v11 >= 9.2234e18)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  if (!__OFADD__((uint64_t)v11, a2))
  {
    sub_100021AD0(a2, a2, (uint64_t)v11 + a2, a1, v8, v9, a2, v10);
    return;
  }
LABEL_25:
  __break(1u);
}

void sub_100021AD0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, float a8)
{
  if (a2)
  {
    uint64_t v13 = a6 - a7;
    if (__OFSUB__(a6, a7))
    {
      __break(1u);
    }
    else if (!__OFSUB__(a3, a7))
    {
      uint64_t v15 = (a3 - a7) & ~((a3 - a7) >> 63);
      if (v15 >= v13) {
        uint64_t v15 = a6 - a7;
      }
      uint64_t v16 = a3 + a1;
      if (!__OFADD__(a3, a1))
      {
        BOOL v17 = __OFADD__(v16, 1);
        uint64_t v18 = v16 + 1;
        if (!v17)
        {
          BOOL v17 = __OFSUB__(v18, a2);
          uint64_t v19 = v18 - a2;
          if (!v17)
          {
            BOOL v17 = __OFSUB__(v19, a7);
            uint64_t v20 = v19 - a7;
            if (!v17)
            {
              float v22 = (float)v15;
              if (v20 < 0)
              {
                if (v13 > 0)
                {
                  float v24 = 0.0;
                  float v23 = 0.0;
                  if (!v15)
                  {
LABEL_15:
                    uint64_t v25 = a2 - 1;
                    if (!__OFSUB__(a2, 1))
                    {
                      uint64_t v26 = a3 - 1;
                      if (!__OFSUB__(a3, 1))
                      {
                        float v30 = v24;
                        double v27 = sub_100021AD0(a1, a2 - 1, v26, a4, a5, a6, a7, a8);
                        if (v30 != 0.0) {
                          vadd_f32(vmul_n_f32(*(float32x2_t *)&v27, 1.0 - v30), vmul_n_f32(COERCE_FLOAT32X2_T(sub_100021AD0(a1, v25, a3, a4, a5, a6, a7, a8)), v30));
                        }
                        return;
                      }
                      goto LABEL_34;
                    }
LABEL_33:
                    __break(1u);
LABEL_34:
                    __break(1u);
                    goto LABEL_35;
                  }
LABEL_14:
                  float v24 = (float)(a8 - v22) / (float)(v23 - v22);
                  goto LABEL_15;
                }
              }
              else if (v20 < v13)
              {
                uint64_t v13 = v20;
              }
              float v23 = (float)v13;
              float v24 = 0.0;
              if (v22 == (float)v13) {
                goto LABEL_15;
              }
              goto LABEL_14;
            }
LABEL_32:
            __break(1u);
            goto LABEL_33;
          }
LABEL_31:
          __break(1u);
          goto LABEL_32;
        }
LABEL_30:
        __break(1u);
        goto LABEL_31;
      }
LABEL_29:
      __break(1u);
      goto LABEL_30;
    }
    __break(1u);
    goto LABEL_29;
  }
  if (__OFSUB__(a3, a5))
  {
LABEL_35:
    __break(1u);
LABEL_36:
    __break(1u);
    return;
  }
  unint64_t v28 = *(void *)(a4 + 16);
  uint64_t v29 = (a3 - a5) & ~((a3 - a5) >> 63);
  if (v29 >= (uint64_t)(v28 - 1)) {
    uint64_t v29 = v28 - 1;
  }
  if (v29 >= v28) {
    goto LABEL_36;
  }
}

void sub_100021CA8(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  id v7 = a1;
  uint64_t v8 = 0;
  *(void *)(v6 + 48) = 3;
  *(void *)(v6 + 168) = 0;
  *(void *)(v6 + 216) = 0;
  *(_DWORD *)(v6 + 212) = 0;
  *(void *)(v6 + 72) = 0;
  *(void *)(v6 + 80) = 0;
  *(_OWORD *)(v6 + 96) = 0u;
  *(_OWORD *)(v6 + 112) = 0u;
  *(_OWORD *)(v6 + 128) = 0u;
  *(_OWORD *)(v6 + 144) = 0u;
  uint64_t v62 = (void *)v6;
  *(unsigned char *)(v6 + 208) = a6;
  unint64_t v66 = (unint64_t)_swiftEmptyArrayStorage;
  unint64_t v67 = (unint64_t)_swiftEmptyArrayStorage;
  do
  {
    id v9 = [v7 newBufferWithLength:163840 options:32];
    if (!v9) {
      goto LABEL_11;
    }
    float v10 = v9;
    strcpy((char *)v65, "particles ");
    BYTE3(v65[1]) = 0;
    HIDWORD(v65[1]) = -369098752;
    v68._uint64_t countAndFlagsBits = sub_100024FA8();
    sub_100024C58(v68);
    swift_bridgeObjectRelease();
    NSString v11 = sub_100024BE8();
    swift_bridgeObjectRelease();
    [v10 setLabel:v11];

    swift_unknownObjectRetain();
    sub_100024C98();
    if (*(void *)((v67 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v67 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_100024CD8();
    }
    sub_100024CF8();
    sub_100024CC8();
    id v12 = [v7 newBufferWithLength:2048 options:0];
    if (!v12)
    {
      swift_unknownObjectRelease();
LABEL_11:
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_34;
    }
    uint64_t v13 = v12;
    strcpy((char *)v65, "curve points ");
    HIWORD(v65[1]) = -4864;
    v69._uint64_t countAndFlagsBits = sub_100024FA8();
    sub_100024C58(v69);
    swift_bridgeObjectRelease();
    NSString v14 = sub_100024BE8();
    swift_bridgeObjectRelease();
    [v13 setLabel:v14];

    swift_unknownObjectRetain();
    sub_100024C98();
    if (*(void *)((v66 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v66 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_100024CD8();
    }
    ++v8;
    sub_100024CF8();
    sub_100024CC8();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    id v7 = a1;
  }
  while (v8 != 3);
  unint64_t v15 = v66;
  *(void *)(v6 + 56) = v67;
  *(void *)(v6 + 160) = v15;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v16 = [a1 newBufferWithLength:0x20000 options:32];
  if (!v16)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_33;
  }
  BOOL v17 = v16;
  NSString v18 = sub_100024BE8();
  [v17 setLabel:v18];

  *(void *)(v6 + 64) = v17;
  swift_unknownObjectRetain();
  NSString v19 = sub_100024BE8();
  id v20 = [a2 newFunctionWithName:v19];

  if (!v20)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    goto LABEL_31;
  }
  NSString v21 = sub_100024BE8();
  id v22 = [a2 newFunctionWithName:v21];

  id v58 = v22;
  if (!v22)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
LABEL_30:
    swift_unknownObjectRelease();
    goto LABEL_31;
  }
  NSString v23 = sub_100024BE8();
  id v24 = [a2 newFunctionWithName:v23];

  if (!v24)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_29:
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    goto LABEL_30;
  }
  id v25 = v24;
  NSString v26 = sub_100024BE8();
  id v27 = [a2 newFunctionWithName:v26];

  if (!v27)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
    goto LABEL_29;
  }
  id v28 = v27;
  v65[0] = 0;
  id v29 = [a1 newComputePipelineStateWithFunction:v20 error:v65];
  id v30 = v65[0];
  if (!v29)
  {
    id v48 = v65[0];
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_100024868();

    swift_willThrow();
    char v49 = -16;
    goto LABEL_37;
  }
  *(void *)(v6 + 16) = v29;
  v65[0] = 0;
  id v31 = v30;
  id v32 = [a1 newComputePipelineStateWithFunction:v58 error:v65];
  id v33 = v65[0];
  if (!v32)
  {
    id v50 = v65[0];
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_100024868();

    swift_willThrow();
    char v49 = -15;
    goto LABEL_37;
  }
  *(void *)(v6 + 24) = v32;
  id v34 = objc_allocWithZone((Class)MTLRenderPipelineDescriptor);
  id v35 = v33;
  id v36 = [v34 init];
  id v37 = [v36 colorAttachments];
  id v38 = [v37 objectAtIndexedSubscript:0];

  if (v38)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    [v38 setPixelFormat:a3];
    [v38 setBlendingEnabled:0];
    [v36 setRasterSampleCount:a5];
    [v36 setDepthAttachmentPixelFormat:a4];
    [v36 setVertexFunction:v25];
    [v36 setFragmentFunction:v28];
    v65[0] = 0;
    id v39 = [a1 newRenderPipelineStateWithDescriptor:v36 error:v65];
    if (v39)
    {
      id v40 = v39;
      id v41 = v65[0];

      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      v62[4] = v40;
      id v42 = [objc_allocWithZone((Class)MTLDepthStencilDescriptor) init];
      [v42 setDepthCompareFunction:4];
      [v42 setDepthWriteEnabled:1];
      id v43 = [a1 newDepthStencilStateWithDescriptor:v42];
      if (v43)
      {
        v62[5] = v43;
        swift_unknownObjectRetain();
        id v44 = sub_1000227E0(a1);
        if (v44)
        {
          v62[22] = v44;
          v62[23] = v45;
          v62[24] = v46;
          v62[25] = v47;
          swift_unknownObjectRetain();
          swift_unknownObjectRetain();
          sub_100023E94(0.0);
          swift_unknownObjectRelease();

          swift_unknownObjectRelease();
          swift_unknownObjectRelease();
          swift_unknownObjectRelease();
          swift_unknownObjectRelease();
          swift_unknownObjectRelease();
          return;
        }
        swift_unknownObjectRelease();

        swift_unknownObjectRelease();
        swift_unknownObjectRelease();
        swift_unknownObjectRelease();
        swift_unknownObjectRelease();
        swift_unknownObjectRelease();
        swift_unknownObjectRelease();
      }
      else
      {
        swift_unknownObjectRelease();

        swift_unknownObjectRelease();
        swift_unknownObjectRelease();
        swift_unknownObjectRelease();
        swift_unknownObjectRelease();
      }
LABEL_31:
      swift_unknownObjectRelease();
LABEL_32:
      swift_bridgeObjectRelease();
      swift_unknownObjectRelease();
LABEL_33:
      swift_bridgeObjectRelease();
LABEL_34:
      type metadata accessor for Particulator();
      swift_deallocPartialClassInstance();
      return;
    }
    id v57 = v65[0];
    sub_100024868();

    swift_willThrow();
    char v49 = -13;
LABEL_37:
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    if (qword_100038BB0 != -1) {
      swift_once();
    }
    uint64_t v51 = sub_100024B38();
    sub_10000612C(v51, (uint64_t)qword_100039FE0);
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v52 = sub_100024B18();
    os_log_type_t v53 = sub_100024D78();
    if (os_log_type_enabled(v52, v53))
    {
      id v54 = (uint8_t *)swift_slowAlloc();
      uint64_t v55 = (void *)swift_slowAlloc();
      *(_DWORD *)id v54 = 138543362;
      swift_errorRetain();
      int v56 = (void *)_swift_stdlib_bridgeErrorToNSError();
      v65[0] = v56;
      sub_100024DD8();
      *uint64_t v55 = v56;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v52, v53, "couldn’t set up pipeline states: %{public}@", v54, 0xCu);
      sub_100004858(&qword_1000390E8);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      swift_errorRelease();
    }
    else
    {
      swift_unknownObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      swift_errorRelease();

      swift_unknownObjectRelease();
    }
    swift_unknownObjectRelease();
    if (v49) {
      swift_unknownObjectRelease();
    }
    if ((v49 & 2) != 0) {
      goto LABEL_31;
    }
    goto LABEL_32;
  }
  __break(1u);
}

id sub_1000227E0(void *a1)
{
  uint64_t v2 = sub_100004858((uint64_t *)&unk_100039380);
  uint64_t v4 = __chkstk_darwin(v2 - 8, v3);
  uint64_t v92 = (char *)&v85 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4, v6);
  uint64_t v8 = (char *)&v85 - v7;
  uint64_t v9 = sub_100024898();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v12 = __chkstk_darwin(v9, v11);
  NSString v14 = (char *)&v85 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12, v15);
  uint64_t v93 = (char *)&v85 - v16;
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v18 = [self bundleForClass:ObjCClassFromMetadata];
  NSString v19 = sub_100024BE8();
  NSString v20 = sub_100024BE8();
  id v21 = [v18 URLForResource:v19 withExtension:v20];

  if (!v21)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v8, 1, 1, v9);
    goto LABEL_24;
  }
  double v91 = a1;
  sub_100024888();

  id v22 = *(void (**)(char *, char *, uint64_t))(v10 + 32);
  v22(v8, v14, v9);
  NSString v23 = *(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56);
  v23(v8, 0, 1, v9);
  uint64_t v24 = v10;
  id v25 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48);
  if (v25(v8, 1, v9) == 1)
  {
LABEL_24:
    sub_1000245B8((uint64_t)v8);
    return 0;
  }
  v22(v93, v8, v9);
  id v26 = objc_allocWithZone((Class)MTKMeshBufferAllocator);
  id v90 = [v26 initWithDevice:v91];
  id v27 = [objc_allocWithZone((Class)MDLVertexDescriptor) init];
  sub_100004858((uint64_t *)&unk_100038F40);
  uint64_t v28 = swift_allocObject();
  *(_OWORD *)(v28 + 16) = xmmword_100026980;
  sub_100024BF8();
  uint64_t v88 = v23;
  uint64_t v89 = (uint64_t (*)(char *, uint64_t, uint64_t))v25;
  id v29 = objc_allocWithZone((Class)MDLVertexAttribute);
  NSString v30 = sub_100024BE8();
  swift_bridgeObjectRelease();
  id v31 = [v29 initWithName:v30 format:786435 offset:0 bufferIndex:0];

  *(void *)(v28 + 56) = sub_100006164(0, (unint64_t *)&unk_100039F30);
  *(void *)(v28 + 32) = v31;
  sub_100006164(0, (unint64_t *)&unk_100038F50);
  id v32 = (void *)sub_100024DA8();
  [v27 setAttributes:v32];

  id v33 = [v27 layouts];
  id v34 = [v33 objectAtIndexedSubscript:0];

  sub_100024DF8();
  swift_unknownObjectRelease();
  sub_100006164(0, (unint64_t *)&unk_100039F40);
  swift_dynamicCast();
  id v35 = v94;
  [v94 setStride:16];

  id v36 = v92;
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v92, v93, v9);
  v88(v36, 0, 1, v9);
  LODWORD(v31) = v89(v36, 1, v9);
  id v37 = v27;
  id v39 = v90;
  id v40 = 0;
  id v41 = (void *)v9;
  if (v31 != 1)
  {
    id v42 = v92;
    sub_100024878(v38);
    id v40 = v43;
    (*(void (**)(char *, void *))(v24 + 8))(v42, v41);
  }
  id v44 = [objc_allocWithZone((Class)MDLAsset) initWithURL:v40 vertexDescriptor:v37 bufferAllocator:v39];

  sub_100006164(0, (unint64_t *)&unk_100038F60);
  id v45 = [v44 childObjectsOfClass:swift_getObjCClassFromMetadata()];
  sub_100006164(0, (unint64_t *)&unk_100039F50);
  unint64_t v46 = sub_100024CB8();

  if (!(v46 >> 62))
  {
    if (*(void *)((v46 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_7;
    }
LABEL_33:
    swift_bridgeObjectRelease();
LABEL_34:
    if (qword_100038BB0 == -1)
    {
LABEL_35:
      uint64_t v74 = sub_100024B38();
      sub_10000612C(v74, (uint64_t)qword_100039FE0);
      uint64_t v75 = sub_100024B18();
      os_log_type_t v76 = sub_100024D78();
      if (os_log_type_enabled(v75, v76))
      {
        float v77 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)float v77 = 0;
        _os_log_impl((void *)&_mh_execute_header, v75, v76, "couldn’t find mesh", v77, 2u);
        swift_slowDealloc();
      }

      (*(void (**)(char *, void *))(v24 + 8))(v93, v41);
      return 0;
    }
LABEL_40:
    swift_once();
    goto LABEL_35;
  }
  swift_bridgeObjectRetain();
  uint64_t v73 = sub_100024F38();
  swift_bridgeObjectRelease();
  if (!v73) {
    goto LABEL_33;
  }
LABEL_7:
  if ((v46 & 0xC000000000000001) != 0)
  {
    id v47 = (id)sub_100024E68();
  }
  else
  {
    if (!*(void *)((v46 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_40;
    }
    id v47 = *(id *)(v46 + 32);
  }
  id v48 = v47;
  swift_bridgeObjectRelease();
  self;
  uint64_t v49 = swift_dynamicCastObjCClass();
  if (!v49)
  {

    goto LABEL_34;
  }
  uint64_t v50 = v49;
  id v51 = objc_allocWithZone((Class)MTKMesh);
  v95[0] = 0;
  uint64_t v52 = v48;
  os_log_type_t v53 = v91;
  swift_unknownObjectRetain();
  id v54 = [v51 initWithMesh:v50 device:v53 error:v95];
  SPAngle v87 = v41;
  if (!v54)
  {
    id v66 = v95[0];
    sub_100024868();

    swift_willThrow();
    uint64_t v92 = v52;

    swift_unknownObjectRelease();
    if (qword_100038BB0 != -1) {
      swift_once();
    }
    uint64_t v67 = sub_100024B38();
    sub_10000612C(v67, (uint64_t)qword_100039FE0);
    swift_errorRetain();
    swift_errorRetain();
    Swift::String v68 = sub_100024B18();
    os_log_type_t v69 = sub_100024D78();
    if (os_log_type_enabled(v68, v69))
    {
      Swift::String v70 = (uint8_t *)swift_slowAlloc();
      double v91 = (void *)swift_slowAlloc();
      *(_DWORD *)Swift::String v70 = 138543362;
      swift_errorRetain();
      Swift::String v71 = (void *)_swift_stdlib_bridgeErrorToNSError();
      id v90 = v44;
      BOOL v72 = v71;
      v95[0] = v71;
      sub_100024DD8();
      *double v91 = v72;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v68, v69, "couldn’t make MTKMesh: %{public}@", v70, 0xCu);
      sub_100004858(&qword_1000390E8);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_errorRelease();
      swift_errorRelease();
    }
    swift_errorRelease();

    goto LABEL_50;
  }
  uint64_t v55 = v54;
  id v56 = v95[0];

  swift_unknownObjectRelease();
  id v57 = v55;
  id v58 = [v57 submeshes];
  sub_100006164(0, (unint64_t *)&unk_100039000);
  unint64_t v59 = sub_100024CB8();

  if (!(v59 >> 62))
  {
    if (*(void *)((v59 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_14;
    }
LABEL_42:

    swift_bridgeObjectRelease();
    (*(void (**)(char *, void *))(v24 + 8))(v93, v87);
    return 0;
  }
  swift_bridgeObjectRetain();
  uint64_t v78 = sub_100024F38();
  swift_bridgeObjectRelease();
  if (!v78) {
    goto LABEL_42;
  }
LABEL_14:
  if ((v59 & 0xC000000000000001) != 0)
  {
    id v60 = (id)sub_100024E68();
  }
  else
  {
    if (!*(void *)((v59 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_45;
    }
    id v60 = *(id *)(v59 + 32);
  }
  id v41 = v60;
  swift_bridgeObjectRelease();
  id v61 = [v57 vertexBuffers];
  sub_100006164(0, (unint64_t *)&unk_100039F60);
  unint64_t v59 = sub_100024CB8();

  if (!(v59 >> 62))
  {
    if (*(void *)((v59 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_19;
    }
LABEL_46:

    swift_bridgeObjectRelease();
    if (qword_100038BB0 == -1)
    {
LABEL_47:
      uint64_t v80 = sub_100024B38();
      sub_10000612C(v80, (uint64_t)qword_100039FE0);
      int v81 = sub_100024B18();
      os_log_type_t v82 = sub_100024D78();
      if (os_log_type_enabled(v81, v82))
      {
        double v83 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)double v83 = 0;
        _os_log_impl((void *)&_mh_execute_header, v81, v82, "MTKMesh didn’t have buffers", v83, 2u);
        swift_slowDealloc();
      }

LABEL_50:
      (*(void (**)(char *, void *))(v24 + 8))(v93, v87);
      return 0;
    }
LABEL_55:
    swift_once();
    goto LABEL_47;
  }
LABEL_45:
  swift_bridgeObjectRetain();
  uint64_t v79 = sub_100024F38();
  swift_bridgeObjectRelease();
  if (!v79) {
    goto LABEL_46;
  }
LABEL_19:
  uint64_t v92 = v52;
  id v90 = v44;
  uint64_t v86 = v24;
  if ((v59 & 0xC000000000000001) != 0)
  {
    id v62 = (id)sub_100024E68();
    goto LABEL_22;
  }
  if (!*(void *)((v59 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    __break(1u);
    goto LABEL_55;
  }
  id v62 = *(id *)(v59 + 32);
LABEL_22:
  long long v63 = v62;
  swift_bridgeObjectRelease();
  id v64 = [v41 indexBuffer];
  id v65 = [v63 buffer];
  [v64 buffer];
  [v57 vertexCount];

  [v41 indexCount];
  (*(void (**)(char *, void *))(v86 + 8))(v93, v87);
  return v65;
}

BOOL sub_10002354C(void *a1, float a2)
{
  id v4 = [a1 computeCommandEncoder];
  if (v4)
  {
    NSString v5 = sub_100024BE8();
    [v4 setLabel:v5];

    [v4 setComputePipelineState:*(void *)(v2 + 16)];
    uint64_t v6 = *(void *)(v2 + 56);
    if ((v6 & 0xC000000000000001) != 0)
    {
      uint64_t v7 = sub_100024E68();
    }
    else
    {
      if (!*(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
        __break(1u);
      }
      uint64_t v7 = *(void *)(v6 + 32);
      swift_unknownObjectRetain();
    }
    [v4 setBuffer:v7 offset:0 atIndex:0];
    swift_unknownObjectRelease();
    int v31 = 4;
    __int16 v32 = 64;
    [v4 setBytes:&v31 length:8 atIndex:2];
    sub_100024800(128, (uint64_t)&v21);
    float64x2_t v19 = v21;
    float64_t v8 = v22.f64[0];
    sub_100024800(32, (uint64_t)&v21);
    float64_t v9 = v22.f64[0];
    float64x2_t v10 = v21;
    float64x2_t v21 = v19;
    v22.f64[0] = v8;
    float64x2_t v29 = v10;
    float64_t v30 = v9;
    [v4 dispatchThreadgroups:&v21 threadsPerThreadgroup:&v29];
    [v4 endEncoding];
    *(void *)(v2 + 72) = 0;
    *(CFAbsoluteTime *)(v2 + 80) = CFAbsoluteTimeGetCurrent();
    sub_100024814(&v21, a2);
    float64x2_t v12 = v21;
    float64x2_t v13 = v23;
    float64x2_t v17 = v24;
    float64x2_t v18 = v26;
    float64x2_t v14 = v25;
    float64x2_t v15 = v22;
    float64x2_t v20 = v28;
    float64x2_t v16 = v27;
    swift_unknownObjectRelease();
    *(float32x4_t *)(v2 + 96) = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v12), v15);
    *(float32x4_t *)(v2 + 112) = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v13), v17);
    *(float32x4_t *)(v2 + 128) = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v14), v18);
    *(float32x4_t *)(v2 + 144) = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v16), v20);
  }
  return v4 != 0;
}

uint64_t sub_1000237AC(void *a1, float a2, float a3, float a4, float a5, float a6)
{
  uint64_t v10 = v6;
  _S9 = a3;
  if (*(float *)(v6 + 216) == a6)
  {
    uint64_t v17 = *(void *)(v6 + 160);
    unint64_t v16 = *(void *)(v6 + 168);
    if ((v17 & 0xC000000000000001) != 0) {
      goto LABEL_30;
    }
    if ((v16 & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (v16 < *(void *)((v17 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      uint64_t v18 = *(void *)(v17 + 8 * v16 + 32);
      swift_unknownObjectRetain();
      goto LABEL_15;
    }
    __break(1u);
  }
  else
  {
    float v9 = a6;
    if (qword_100038BB0 == -1) {
      goto LABEL_7;
    }
  }
  swift_once();
LABEL_7:
  uint64_t v19 = sub_100024B38();
  sub_10000612C(v19, (uint64_t)qword_100039FE0);
  float64x2_t v20 = sub_100024B18();
  os_log_type_t v21 = sub_100024D68();
  if (os_log_type_enabled(v20, v21))
  {
    uint64_t v7 = swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 134217984;
    *(double *)&long long v45 = v9;
    sub_100024DD8();
    _os_log_impl((void *)&_mh_execute_header, v20, v21, "updating curve points for landscape amount %f", (uint8_t *)v7, 0xCu);
    swift_slowDealloc();
  }

  uint64_t v22 = *(void *)(v10 + 168);
  _VF = __OFADD__(v22, 1);
  uint64_t v24 = v22 + 1;
  if (_VF)
  {
    __break(1u);
    goto LABEL_35;
  }
  *(void *)(v10 + 168) = v24 % 3;
  sub_100023E94(v9);
  uint64_t v26 = *(void *)(v10 + 160);
  unint64_t v25 = *(void *)(v10 + 168);
  if ((v26 & 0xC000000000000001) != 0)
  {
LABEL_35:
    uint64_t v18 = sub_100024E68();
    goto LABEL_14;
  }
  if ((v25 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_37;
  }
  if (v25 >= *(void *)((v26 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_37:
    __break(1u);
    goto LABEL_38;
  }
  uint64_t v18 = *(void *)(v26 + 8 * v25 + 32);
  swift_unknownObjectRetain();
LABEL_14:
  *(float *)(v10 + 216) = v9;
LABEL_15:
  while (1)
  {
    *(float *)(v10 + 220) = a5;
    uint64_t v27 = *(void *)(v10 + 72);
    uint64_t v28 = v27 + 1;
    if (__OFADD__(v27, 1)) {
      break;
    }
    NSString v29 = sub_100024BE8();
    [a1 pushDebugGroup:v29];

    [a1 setComputePipelineState:*(void *)(v10 + 24)];
    uint64_t v7 = *(void *)(v10 + 56);
    unint64_t v30 = *(void *)(v10 + 72);
    unint64_t v8 = v7 & 0xC000000000000001;
    if ((v7 & 0xC000000000000001) != 0) {
      goto LABEL_27;
    }
    if ((v30 & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (v30 < *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      uint64_t v31 = *(void *)(v7 + 8 * v30 + 32);
      swift_unknownObjectRetain();
      goto LABEL_20;
    }
    __break(1u);
LABEL_30:
    uint64_t v18 = sub_100024E68();
  }
  __break(1u);
LABEL_27:
  uint64_t v31 = sub_100024E68();
LABEL_20:
  unint64_t v32 = v28 % 3;
  [a1 setBuffer:v31 offset:0 atIndex:0];
  swift_unknownObjectRelease();
  if (!v8)
  {
    if ((v32 & 0x8000000000000000) == 0)
    {
      if (v32 < *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
        uint64_t v33 = *(void *)(v7 + 8 * v32 + 32);
        swift_unknownObjectRetain();
        goto LABEL_25;
      }
LABEL_39:
      __break(1u);
    }
LABEL_38:
    __break(1u);
    goto LABEL_39;
  }
  uint64_t v33 = sub_100024E68();
LABEL_25:
  [a1 setBuffer:v33 offset:0 atIndex:1];
  swift_unknownObjectRelease();
  [a1 setBuffer:*(void *)(v10 + 64) offset:0 atIndex:2];
  [a1 setBuffer:v18 offset:0 atIndex:3];
  __int16 v48 = 64;
  float v47 = a2;
  __asm { FCVT            H0, S9 }
  __int16 v49 = _H0;
  [a1 setBytes:&v47 length:8 atIndex:4];
  sub_100024800(128, (uint64_t)&v45);
  long long v42 = v45;
  uint64_t v38 = v46;
  sub_100024800(32, (uint64_t)&v45);
  uint64_t v39 = v46;
  long long v40 = v45;
  long long v45 = v42;
  uint64_t v46 = v38;
  long long v43 = v40;
  uint64_t v44 = v39;
  [a1 dispatchThreadgroups:&v45 threadsPerThreadgroup:&v43];
  [a1 popDebugGroup];
  uint64_t result = swift_unknownObjectRelease();
  *(void *)(v10 + 72) = v32;
  *(float *)(v10 + 212) = a4;
  return result;
}

id sub_100023C28(void *a1)
{
  NSString v3 = sub_100024BE8();
  [a1 setLabel:v3];

  [a1 setRenderPipelineState:v1[2].i64[0]];
  [a1 setDepthStencilState:v1[2].i64[1]];
  [a1 setVertexBuffer:v1[4].i64[0] offset:0 atIndex:0];
  float32x4_t v12 = v1[6];
  float32x4_t v13 = v1[7];
  float32x4_t v14 = v1[8];
  float32x4_t v15 = v1[9];
  float v4 = 1.5708;
  if (!v1[13].i8[0]) {
    float v4 = 0.0;
  }
  __float2 v5 = __sincosf_stret(v1[13].f32[3] + v4);
  float32x4_t v6 = vmlaq_f32(vmulq_f32(v12, (float32x4_t)0), (float32x4_t)0, v13);
  v16[0] = vmlaq_f32(vmlaq_f32(vmlaq_n_f32(vmulq_n_f32(v12, v5.__cosval), v13, v5.__sinval), (float32x4_t)0, v14), (float32x4_t)0, v15);
  v16[1] = vmlaq_f32(vmlaq_f32(vmlaq_n_f32(vmulq_n_f32(v12, -v5.__sinval), v13, v5.__cosval), (float32x4_t)0, v14), (float32x4_t)0, v15);
  float v7 = v1[13].f32[1];
  *(float32x2_t *)&long long v8 = vadd_f32(vmul_n_f32((float32x2_t)0xBCAC0831BCAC0840, v7), (float32x2_t)1065353216);
  *((void *)&v8 + 1) = DWORD1(v8);
  *(float32x2_t *)&long long v9 = vadd_f32(vmul_n_f32((float32x2_t)0xBD9374C0BD9374BCLL, v7), (float32x2_t)0x3F80000000000000);
  *((void *)&v9 + 1) = v9;
  *(float *)&long long v10 = (float)(v7 * -0.007) + 0.0;
  *((float *)&v10 + 1) = *(float *)&v10;
  *((void *)&v10 + 1) = COERCE_UNSIGNED_INT((float)(v7 * -0.007) + 1.0);
  v16[2] = vmlaq_f32(vaddq_f32(v14, v6), (float32x4_t)0, v15);
  v16[3] = vaddq_f32(v15, vmlaq_f32(v6, (float32x4_t)0, v14));
  v16[4] = v8;
  v16[5] = v9;
  v16[6] = v10;
  [a1 setVertexBytes:v16 length:112 atIndex:1];
  [a1 setVertexBuffer:v1[11].i64[0] offset:0 atIndex:2];
  [a1 setCullMode:0];
  return [a1 drawIndexedPrimitives:3 indexCount:v1[12].i64[1] indexType:1 indexBuffer:v1[11].i64[1] indexBufferOffset:0 instanceCount:4096];
}

unint64_t sub_100023E94(float a1)
{
  uint64_t v4 = *(void *)(v1 + 160);
  unint64_t result = *(void *)(v1 + 168);
  if ((v4 & 0xC000000000000001) != 0)
  {
    __float2 v5 = (void *)sub_100024E68();
    goto LABEL_5;
  }
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_11;
  }
  if (result >= *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_11:
    __break(1u);
    return result;
  }
  __float2 v5 = *(void **)(v4 + 8 * result + 32);
  swift_unknownObjectRetain();
LABEL_5:
  [v5 contents];
  id v6 = v5;
  int v7 = *(unsigned __int8 *)(v1 + 208);
  sub_100004858(&qword_100038F98);
  uint64_t v8 = swift_allocObject();
  uint64_t v9 = v8;
  *(_OWORD *)(v8 + 16) = xmmword_1000276D0;
  if (v7 == 1)
  {
    *(_OWORD *)(v8 + 32) = xmmword_100027780;
    *(_OWORD *)(v8 + 48) = xmmword_100027790;
    *(_OWORD *)(v8 + 64) = xmmword_1000277A0;
    *(_OWORD *)(v8 + 80) = xmmword_1000277B0;
    *(_OWORD *)(v8 + 96) = xmmword_1000277C0;
    long long v10 = (_OWORD *)swift_allocObject();
    v10[1] = xmmword_100027730;
    v10[2] = xmmword_1000277D0;
    v10[3] = xmmword_1000277E0;
    v10[4] = xmmword_1000277F0;
    v10[5] = xmmword_100027800;
    uint64_t v11 = (_OWORD *)swift_allocObject();
    v11[1] = xmmword_1000276D0;
    v11[2] = xmmword_100027810;
    v11[3] = xmmword_100027820;
    v11[4] = xmmword_100027830;
    v11[5] = xmmword_100027840;
    v11[6] = xmmword_100027850;
    float32x4_t v12 = (_OWORD *)swift_allocObject();
    v12[1] = xmmword_100027730;
    v12[2] = xmmword_100027860;
    uint64_t v12[3] = xmmword_100027870;
    v12[4] = xmmword_100027880;
    v12[5] = xmmword_100027890;
    sub_100024690(0, 5, (double (*)(__n128))sub_100024248, a1, 0, v9, (uint64_t)v11);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_100024690(0, 4, (double (*)(__n128))sub_100024248, a1, 0, (uint64_t)v10, (uint64_t)v12);
    swift_bridgeObjectRelease();
  }
  else
  {
    *(_OWORD *)(v8 + 32) = xmmword_1000276E0;
    *(_OWORD *)(v8 + 48) = xmmword_1000276F0;
    *(_OWORD *)(v8 + 64) = xmmword_100027700;
    *(_OWORD *)(v8 + 80) = xmmword_100027710;
    *(_OWORD *)(v8 + 96) = xmmword_100027720;
    sub_1000218CC((float32x4_t *)v8);
    swift_setDeallocating();
    swift_deallocClassInstance();
    uint64_t v13 = swift_allocObject();
    *(_OWORD *)(v13 + 16) = xmmword_100027730;
    *(_OWORD *)(v13 + 32) = xmmword_100027740;
    *(_OWORD *)(v13 + 48) = xmmword_100027750;
    *(_OWORD *)(v13 + 64) = xmmword_100027760;
    *(_OWORD *)(v13 + 80) = xmmword_100027770;
    sub_1000218CC((float32x4_t *)v13);
  }
  swift_setDeallocating();
  swift_deallocClassInstance();
  uint64_t v14 = sub_100006164(0, (unint64_t *)&unk_100039F70);
  __chkstk_darwin(v14, v15);
  sub_100024D88();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

float32x2_t sub_100024248(float32x2_t a1)
{
  return vmul_f32(a1, (float32x2_t)vdup_n_s32(0xBA83126F));
}

void sub_100024278(unint64_t *a1@<X0>, double (*a2)(__n128)@<X1>, uint64_t a3@<X3>, uint64_t a4@<X4>, _OWORD *a5@<X8>, float a6@<S0>)
{
  unint64_t v7 = *a1;
  if ((*a1 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (v7 >= *(void *)(a3 + 16))
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (v7 < *(void *)(a4 + 16))
  {
    uint64_t v8 = 16 * v7;
    uint64_t v9 = (float32x2_t *)(a3 + v8);
    long long v10 = (float32x2_t *)(a4 + v8);
    float v11 = v9[5].f32[0];
    float v12 = (float)(v10[5].f32[0] - v11) * a6;
    v13.n128_u64[0] = (unint64_t)vadd_f32(v9[4], vmul_n_f32(vsub_f32(v10[4], v9[4]), a6));
    v13.n128_f32[2] = v11 + v12;
    v13.n128_u32[3] = 0;
    *(double *)&long long v14 = a2(v13);
    *a5 = v14;
    return;
  }
LABEL_7:
  __break(1u);
}

uint64_t sub_100024320()
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return v0;
}

uint64_t sub_100024388()
{
  sub_100024320();

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for Particulator()
{
  return self;
}

uint64_t destroy for Particulator.MeshData()
{
  swift_unknownObjectRelease();

  return swift_unknownObjectRelease();
}

uint64_t initializeWithCopy for Particulator.MeshData(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  return a1;
}

void *assignWithCopy for Particulator.MeshData(void *a1, void *a2)
{
  *a1 = *a2;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  a1[1] = a2[1];
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  return a1;
}

__n128 initializeWithTake for Particulator.MeshData(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

_OWORD *assignWithTake for Particulator.MeshData(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_unknownObjectRelease();
  a1[1] = a2[1];
  return a1;
}

uint64_t getEnumTagSinglePayload for Particulator.MeshData(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Particulator.MeshData(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 32) = 1;
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
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Particulator.MeshData()
{
  return &type metadata for Particulator.MeshData;
}

uint64_t sub_1000245B8(uint64_t a1)
{
  uint64_t v2 = sub_100004858((uint64_t *)&unk_100039380);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_100024618(uint64_t a1)
{
  uint64_t v3 = v1[2];
  uint64_t v4 = v1[4];
  sub_1000219D0(v1[3], 3, (float)a1 / 63.0);
  *(_OWORD *)(v3 + 16 * a1) = v5;
  if (__OFADD__(a1, 64))
  {
    __break(1u);
  }
  else
  {
    sub_1000219D0(v4, 3, (float)a1 / 63.0);
    *(_OWORD *)(v3 + 16 * (a1 + 64)) = v6;
  }
}

void sub_100024690(int64_t a1, int64_t a2, double (*a3)(__n128), float a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v8 = a2 - a1;
  if (__OFSUB__(a2, a1)) {
    goto LABEL_21;
  }
  uint64_t v9 = v7;
  if (v8)
  {
    unint64_t v25 = _swiftEmptyArrayStorage;
    sub_10000A6D0(0, v8 & ~(v8 >> 63), 0);
    if (v8 < 0)
    {
LABEL_22:
      __break(1u);
      return;
    }
    long long v14 = v25;
    if (a2 <= a1) {
      int64_t v15 = a1;
    }
    else {
      int64_t v15 = a2;
    }
    unint64_t v16 = a1;
    while (a2 != v16)
    {
      unint64_t v23 = v16;
      sub_100024278(&v23, a3, a6, a7, &v24, a4);
      if (v9)
      {
        swift_release();
        return;
      }
      uint64_t v9 = 0;
      long long v17 = v24;
      unint64_t v25 = v14;
      unint64_t v19 = v14[2];
      unint64_t v18 = v14[3];
      if (v19 >= v18 >> 1)
      {
        long long v20 = v24;
        sub_10000A6D0(v18 > 1, v19 + 1, 1);
        long long v17 = v20;
        long long v14 = v25;
      }
      v14[2] = v19 + 1;
      *(_OWORD *)&v14[2 * v19 + 4] = v17;
      if (a2 < a1) {
        goto LABEL_19;
      }
      if (v15 == v16) {
        goto LABEL_20;
      }
      if (a2 == ++v16) {
        return;
      }
    }
    __break(1u);
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
}

int64x2_t sub_100024800@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = a1;
  int64x2_t result = vdupq_n_s64(1uLL);
  *(int64x2_t *)(a2 + 8) = result;
  return result;
}

double sub_100024814@<D0>(_OWORD *a1@<X8>, double a2@<D0>)
{
  *a1 = COERCE_UNSIGNED_INT64(0.565772778 / a2);
  a1[1] = 0u;
  a1[2] = xmmword_1000278A0;
  a1[3] = 0u;
  a1[4] = 0u;
  a1[5] = xmmword_1000278B0;
  double result = 0.101010101;
  a1[6] = 0u;
  a1[7] = xmmword_1000278C0;
  return result;
}

uint64_t sub_100024858()
{
  return _convertErrorToNSError(_:)();
}

uint64_t sub_100024868()
{
  return _convertNSErrorToError(_:)();
}

void sub_100024878(NSURL *retstr@<X8>)
{
}

uint64_t sub_100024888()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100024898()
{
  return type metadata accessor for URL();
}

uint64_t sub_1000248A8()
{
  return UUID.init(uuidString:)();
}

uint64_t sub_1000248B8()
{
  return UUID.uuidString.getter();
}

uint64_t sub_1000248C8()
{
  return UUID.uuid.getter();
}

uint64_t sub_1000248D8()
{
  return UUID.init()();
}

uint64_t sub_1000248E8()
{
  return type metadata accessor for UUID();
}

uint64_t sub_1000248F8()
{
  return static Locale.current.getter();
}

uint64_t sub_100024908()
{
  return type metadata accessor for Locale();
}

uint64_t sub_100024918()
{
  return _AnySceneConfiguration.init<A>(erasing:)();
}

uint64_t sub_100024928()
{
  return type metadata accessor for _AnySceneConfiguration();
}

uint64_t sub_100024938()
{
  return static _AppExtension<>.main()();
}

uint64_t sub_100024948()
{
  return _AppExtension.hostAuditToken.getter();
}

uint64_t sub_100024958()
{
  return static _SceneBuilder.buildBlock<A>(_:)();
}

uint64_t sub_100024968()
{
  return WallpaperMetalCoordination.WallpaperState.wakeState.getter();
}

uint64_t sub_100024978()
{
  return WallpaperMetalCoordination.WallpaperState.unlockState.getter();
}

uint64_t sub_100024988()
{
  return WallpaperMetalCoordination.WallpaperState.isDarkMode.getter();
}

uint64_t sub_100024998()
{
  return WallpaperMetalCoordination.WallpaperState.isTransient.getter();
}

uint64_t sub_1000249A8()
{
  return WallpaperMetalCoordination.WallpaperState.rotationRadians.getter();
}

uint64_t sub_1000249B8()
{
  return WallpaperMetalCoordination.WallpaperState.rotationLandscapeAmount.getter();
}

uint64_t sub_1000249C8()
{
  return type metadata accessor for WallpaperMetalCoordination.WallpaperState.Look();
}

uint64_t sub_1000249D8()
{
  return WallpaperMetalCoordination.WallpaperState.look.getter();
}

uint64_t sub_1000249E8()
{
  return WallpaperMetalCoordination.WallpaperState.init()();
}

uint64_t sub_1000249F8()
{
  return type metadata accessor for WallpaperMetalCoordination.WallpaperState();
}

uint64_t sub_100024A08()
{
  return dispatch thunk of WallpaperMetalCoordination.EditingCoordinator.handleEditingEnvironmentUpdate(_:animationSettings:)();
}

uint64_t sub_100024A18()
{
  return WallpaperMetalCoordination.EditingCoordinator.init(identifier:rendering:environment:initialLookIdentifier:lookSelectionStyle:)();
}

uint64_t sub_100024A28()
{
  return dispatch thunk of WallpaperMetalCoordination.EditingCoordinator.attachToViews(background:lookIdentifier:)();
}

uint64_t sub_100024A38()
{
  return type metadata accessor for WallpaperMetalCoordination.EditingCoordinator.LookSelectionStyle();
}

uint64_t sub_100024A48()
{
  return dispatch thunk of WallpaperMetalCoordination.EditingCoordinator.finishLookTransition(toIdentifier:)();
}

uint64_t sub_100024A58()
{
  return type metadata accessor for WallpaperMetalCoordination.EditingCoordinator();
}

uint64_t sub_100024A68()
{
  return dispatch thunk of WallpaperMetalCoordination.RenderingCoordinator.handleRenderingEnvironmentUpdate(_:animationSettings:)();
}

uint64_t sub_100024A78()
{
  return WallpaperMetalCoordination.RenderingCoordinator.init(identifier:rendering:environment:lookIdentifier:)();
}

uint64_t sub_100024A88()
{
  return dispatch thunk of WallpaperMetalCoordination.RenderingCoordinator.attachToViews(background:floating:)();
}

uint64_t sub_100024A98()
{
  return dispatch thunk of WallpaperMetalCoordination.RenderingCoordinator.renderer.getter();
}

uint64_t sub_100024AA8()
{
  return type metadata accessor for WallpaperMetalCoordination.RenderingCoordinator();
}

uint64_t sub_100024AB8()
{
  return type metadata accessor for WallpaperMetalRenderingFloatingLayerStyle();
}

uint64_t sub_100024AC8()
{
  return UnlockState.progress.getter();
}

uint64_t sub_100024AD8()
{
  return type metadata accessor for UnlockState();
}

uint64_t sub_100024AE8()
{
  return WakeState.linearProgress.getter();
}

uint64_t sub_100024AF8()
{
  return WakeState.backlightProgress.getter();
}

uint64_t sub_100024B08()
{
  return type metadata accessor for WakeState();
}

uint64_t sub_100024B18()
{
  return Logger.logObject.getter();
}

uint64_t sub_100024B28()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_100024B38()
{
  return type metadata accessor for Logger();
}

uint64_t sub_100024B48()
{
  return type metadata accessor for PREditingConfiguration();
}

uint64_t sub_100024B58()
{
  return PREditingConfiguration.init(_:)();
}

uint64_t sub_100024B68()
{
  return PRProviderConfiguration.init(updatingDelegate:content:)();
}

uint64_t sub_100024B78()
{
  return type metadata accessor for PRRenderingConfiguration();
}

uint64_t sub_100024B88()
{
  return PRRenderingConfiguration.init(_:)();
}

NSDictionary sub_100024B98()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_100024BA8()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100024BB8()
{
  return Dictionary.description.getter();
}

uint64_t sub_100024BC8()
{
  return String.LocalizationValue.init(stringLiteral:)();
}

uint64_t sub_100024BD8()
{
  return type metadata accessor for String.LocalizationValue();
}

NSString sub_100024BE8()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_100024BF8()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100024C08()
{
  return String.init(localized:table:bundle:locale:comment:)();
}

uint64_t sub_100024C18()
{
  return static String._fromSubstring(_:)();
}

uint64_t sub_100024C28()
{
  return String.hash(into:)();
}

uint64_t sub_100024C38()
{
  return String.count.getter();
}

uint64_t sub_100024C48()
{
  return String.index(after:)();
}

void sub_100024C58(Swift::String a1)
{
}

Swift::Int sub_100024C68()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_100024C78()
{
  return String.subscript.getter();
}

uint64_t sub_100024C88()
{
  return String.subscript.getter();
}

uint64_t sub_100024C98()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray sub_100024CA8()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_100024CB8()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100024CC8()
{
  return specialized Array._endMutation()();
}

uint64_t sub_100024CD8()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_100024CE8()
{
  return static Array._allocateBufferUninitialized(minimumCapacity:)();
}

uint64_t sub_100024CF8()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_100024D08()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_100024D18()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_100024D28()
{
  return type metadata accessor for TaskPriority();
}

uint64_t sub_100024D38()
{
  return static SPRotation3D.slerp(from:to:t:along:)();
}

uint64_t sub_100024D48()
{
  return type metadata accessor for SPRotation3D.SlerpPath();
}

void sub_100024D58(SPEulerAngles *retstr@<X8>, SPAngle x@<D0>, SPAngle y@<D1>, SPAngle z@<D2>, SPEulerAngleOrder order@<W0>)
{
}

uint64_t sub_100024D68()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_100024D78()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_100024D88()
{
  return static OS_dispatch_queue.concurrentPerform(iterations:execute:)();
}

uint64_t sub_100024D98()
{
  return static SPEulerAngleOrder.xyz.getter();
}

uint64_t sub_100024DA8()
{
  return NSArray.init(arrayLiteral:)();
}

Swift::Int sub_100024DB8(Swift::Int seed)
{
  return NSObject._rawHashValue(seed:)(seed);
}

uint64_t sub_100024DC8()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t sub_100024DD8()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_100024DE8()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_100024DF8()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t sub_100024E08()
{
  return _HashTable.previousHole(before:)();
}

Swift::Int sub_100024E18(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t sub_100024E28()
{
  return static AnyHashable.== infix(_:_:)();
}

uint64_t sub_100024E38()
{
  return AnyHashable.init<A>(_:)();
}

uint64_t sub_100024E48()
{
  return static _SetStorage.allocate(capacity:)();
}

uint64_t sub_100024E58()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_100024E68()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_100024E78()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_100024E88()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_100024E98()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t sub_100024EA8()
{
  return specialized ContiguousArray.reserveCapacity(_:)();
}

uint64_t sub_100024EB8()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t sub_100024EC8()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_100024ED8()
{
  return __CocoaDictionary.makeIterator()();
}

uint64_t sub_100024EE8()
{
  return __CocoaDictionary.count.getter();
}

uint64_t sub_100024EF8()
{
  return __CocoaDictionary.lookup(_:)();
}

uint64_t sub_100024F08()
{
  return __CocoaDictionary.Iterator.next()();
}

uint64_t sub_100024F18()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100024F28()
{
  return _bridgeCocoaArray<A>(_:)();
}

uint64_t sub_100024F38()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_100024F48()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t sub_100024F58()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t sub_100024F68()
{
  return static _DictionaryStorage.convert(_:capacity:)();
}

uint64_t sub_100024F78()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_100024F88()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

Swift::Int sub_100024F98(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_100024FA8()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_100024FB8()
{
  return _bridgeAnythingToObjectiveC<A>(_:)();
}

uint64_t sub_100024FC8()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_100024FD8()
{
  return dispatch thunk of __ContiguousArrayStorageBase.staticElementType.getter();
}

uint64_t sub_100024FE8()
{
  return _findStringSwitchCaseWithCache(cases:string:cache:)();
}

uint64_t sub_100024FF8()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_100025008()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_100025018()
{
  return Error._code.getter();
}

uint64_t sub_100025028()
{
  return Error._domain.getter();
}

uint64_t sub_100025038()
{
  return Error._userInfo.getter();
}

uint64_t sub_100025048()
{
  return Hasher.init(_seed:)();
}

void sub_100025058(Swift::UInt a1)
{
}

Swift::Int sub_100025068()
{
  return Hasher._finalize()();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

uint64_t MobileGestalt_get_appleInternalInstallCapability()
{
  return _MobileGestalt_get_appleInternalInstallCapability();
}

uint64_t MobileGestalt_get_current_device()
{
  return _MobileGestalt_get_current_device();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

BOOL UIAccessibilityIsReduceMotionEnabled(void)
{
  return _UIAccessibilityIsReduceMotionEnabled();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

__float2 __sincosf_stret(float a1)
{
  __float2 v3 = ___sincosf_stret(a1);
  float cosval = v3.__cosval;
  float sinval = v3.__sinval;
  result.__float cosval = cosval;
  result.__float sinval = sinval;
  return result;
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

simd_double2 _simd_cos_d2(simd_double2 x)
{
  return __simd_cos_d2(x);
}

simd_double2 _simd_sin_d2(simd_double2 x)
{
  return __simd_sin_d2(x);
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return __swift_stdlib_bridgeErrorToNSError();
}

void bzero(void *a1, size_t a2)
{
}

float log2f(float a1)
{
  return _log2f(a1);
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

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
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

float powf(float a1, float a2)
{
  return _powf(a1, a2);
}

float remainderf(float a1, float a2)
{
  return _remainderf(a1, a2);
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

uint64_t swift_bridgeObjectRetain_n()
{
  return _swift_bridgeObjectRetain_n();
}

uint64_t swift_deallocClassInstance()
{
  return _swift_deallocClassInstance();
}

uint64_t swift_deallocPartialClassInstance()
{
  return _swift_deallocPartialClassInstance();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastMetatype()
{
  return _swift_dynamicCastMetatype();
}

uint64_t swift_dynamicCastObjCClass()
{
  return _swift_dynamicCastObjCClass();
}

uint64_t swift_dynamicCastObjCProtocolConditional()
{
  return _swift_dynamicCastObjCProtocolConditional();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_errorInMain()
{
  return _swift_errorInMain();
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

uint64_t swift_getOpaqueTypeConformance2()
{
  return _swift_getOpaqueTypeConformance2();
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

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return _swift_isEscapingClosureAtFileLocation();
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

uint64_t swift_setDeallocating()
{
  return _swift_setDeallocating();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_stdlib_random()
{
  return _swift_stdlib_random();
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

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

float tanf(float a1)
{
  return _tanf(a1);
}