uint64_t sub_3E44()
{
  uint64_t result;

  sub_6790(0, &qword_C6B0);
  result = sub_6BE0();
  qword_C728 = result;
  return result;
}

BOOL sub_3EB8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_3ECC()
{
  Swift::UInt v1 = *v0;
  sub_6C90();
  sub_6CA0(v1);
  return sub_6CB0();
}

void sub_3F14()
{
  sub_6CA0(*v0);
}

Swift::Int sub_3F40()
{
  Swift::UInt v1 = *v0;
  sub_6C90();
  sub_6CA0(v1);
  return sub_6CB0();
}

uint64_t sub_3F94(uint64_t a1)
{
  Swift::UInt v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

void sub_4030(uint64_t a1, void *a2)
{
  v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

uint64_t sub_409C(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    sub_6074(&qword_C668);
    uint64_t v2 = (void *)sub_6C20();
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
  v6 = (char *)(v2 + 8);
  swift_bridgeObjectRetain();
  uint64_t result = swift_retain();
  int64_t v8 = 0;
  while (1)
  {
    if (v5)
    {
      unint64_t v11 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      unint64_t v12 = v11 | (v8 << 6);
      goto LABEL_28;
    }
    int64_t v13 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v13 >= v27) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v28 + 8 * v13);
    int64_t v15 = v8 + 1;
    if (!v14)
    {
      int64_t v15 = v8 + 2;
      if (v8 + 2 >= v27) {
        goto LABEL_37;
      }
      unint64_t v14 = *(void *)(v28 + 8 * v15);
      if (!v14)
      {
        int64_t v15 = v8 + 3;
        if (v8 + 3 >= v27) {
          goto LABEL_37;
        }
        unint64_t v14 = *(void *)(v28 + 8 * v15);
        if (!v14)
        {
          int64_t v15 = v8 + 4;
          if (v8 + 4 >= v27) {
            goto LABEL_37;
          }
          unint64_t v14 = *(void *)(v28 + 8 * v15);
          if (!v14) {
            break;
          }
        }
      }
    }
LABEL_27:
    unint64_t v5 = (v14 - 1) & v14;
    unint64_t v12 = __clz(__rbit64(v14)) + (v15 << 6);
    int64_t v8 = v15;
LABEL_28:
    v17 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v12);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    sub_61B0(*(void *)(a1 + 56) + 32 * v12, (uint64_t)v40);
    *(void *)&long long v39 = v19;
    *((void *)&v39 + 1) = v18;
    v37[2] = v39;
    v38[0] = v40[0];
    v38[1] = v40[1];
    *(void *)&v37[0] = v19;
    *((void *)&v37[0] + 1) = v18;
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    sub_6600(v38, v32);
    long long v33 = v29;
    long long v34 = v30;
    uint64_t v35 = v31;
    sub_6600(v32, v36);
    long long v29 = v33;
    long long v30 = v34;
    uint64_t v31 = v35;
    sub_6600(v36, v37);
    sub_6600(v37, &v33);
    uint64_t result = sub_6C10(v2[5]);
    uint64_t v20 = -1 << *((unsigned char *)v2 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)&v6[8 * (v21 >> 6)]) != 0)
    {
      unint64_t v9 = __clz(__rbit64((-1 << v21) & ~*(void *)&v6[8 * (v21 >> 6)])) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v23 = 0;
      unint64_t v24 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v24 && (v23 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        BOOL v25 = v22 == v24;
        if (v22 == v24) {
          unint64_t v22 = 0;
        }
        v23 |= v25;
        uint64_t v26 = *(void *)&v6[8 * v22];
      }
      while (v26 == -1);
      unint64_t v9 = __clz(__rbit64(~v26)) + (v22 << 6);
    }
    *(void *)&v6[(v9 >> 3) & 0x1FFFFFFFFFFFFFF8] |= 1 << v9;
    uint64_t v10 = v2[6] + 40 * v9;
    *(_OWORD *)uint64_t v10 = v29;
    *(_OWORD *)(v10 + 16) = v30;
    *(void *)(v10 + 32) = v31;
    uint64_t result = (uint64_t)sub_6600(&v33, (_OWORD *)(v2[7] + 32 * v9));
    ++v2[2];
  }
  int64_t v16 = v8 + 5;
  if (v8 + 5 >= v27)
  {
LABEL_37:
    swift_release();
    sub_6678();
    return (uint64_t)v2;
  }
  unint64_t v14 = *(void *)(v28 + 8 * v16);
  if (v14)
  {
    int64_t v15 = v8 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v15 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v15 >= v27) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v28 + 8 * v15);
    ++v16;
    if (v14) {
      goto LABEL_27;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

id sub_4464()
{
  Class isa = sub_6B40().super.isa;
  swift_bridgeObjectRelease();
  sub_6A50();
  Class v1 = sub_6B80().super.isa;
  swift_bridgeObjectRelease();
  id v6 = 0;
  id v2 = [(id)swift_getObjCClassFromMetadata() optionsFromJSONRepresentation:isa attachmentURLs:v1 error:&v6];

  if (v2)
  {
    id v3 = v6;
  }
  else
  {
    id v4 = v6;
    sub_6A30();

    swift_willThrow();
  }
  return v2;
}

unint64_t sub_458C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    id v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_6074(&qword_C658);
  uint64_t v2 = sub_6C20();
  id v3 = (void *)v2;
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
    sub_6610(v6, (uint64_t)&v15);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_4B58(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    unint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *unint64_t v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_6600(&v17, (_OWORD *)(v3[7] + 32 * result));
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

uint64_t sub_46B8(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v7 = sub_6B00();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = ((uint64_t (*)(void))__chkstk_darwin)();
  unint64_t v11 = (char *)&v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  BOOL v13 = (char *)&v29 - v12;
  sub_6B10();
  uint64_t result = sub_6AE0();
  if (!v4)
  {
    if (*(void *)(a3 + 16)
      && (unint64_t v15 = sub_4B58(0xD000000000000016, 0x8000000000007350), (v16 & 1) != 0)
      && (sub_61B0(*(void *)(a3 + 56) + 32 * v15, (uint64_t)v32),
          sub_6790(0, &qword_C698),
          (swift_dynamicCast() & 1) != 0)
      && (v17 = v31, unsigned int v18 = [v31 BOOLValue], v17, v18))
    {
      (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v11, v13, v7);
    }
    else
    {
      sub_6AF0();
    }
    sub_6A10();
    swift_allocObject();
    sub_6A00();
    sub_66A0(&qword_C690, (void (*)(uint64_t))&type metadata accessor for REMSuggestedAttributesTrainer.Result);
    uint64_t v20 = sub_69F0();
    unint64_t v22 = v21;
    long long v30 = a4;
    swift_release();
    char v23 = self;
    Class isa = sub_6A60().super.isa;
    v32[0] = 0;
    id v25 = [v23 JSONObjectWithData:isa options:0 error:v32];

    if (v25)
    {
      id v26 = v32[0];
      sub_6C00();
      swift_unknownObjectRelease();
      sub_6074(&qword_C620);
      sub_6A90();
      sub_65A8(v20, v22);
      sub_62C0((uint64_t)v32);
      uint64_t v28 = *(void (**)(char *, uint64_t))(v8 + 8);
      v28(v11, v7);
      v28(v13, v7);
      *long long v30 = v31;
      return swift_bridgeObjectRelease();
    }
    else
    {
      id v27 = v32[0];
      sub_6A30();

      swift_willThrow();
      sub_65A8(v20, v22);
      uint64_t v19 = *(void (**)(char *, uint64_t))(v8 + 8);
      v19(v11, v7);
      return ((uint64_t (*)(char *, uint64_t))v19)(v13, v7);
    }
  }
  return result;
}

id sub_4B00()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for RDDistributedEvaluationPlugin();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for RDDistributedEvaluationPlugin()
{
  return self;
}

unint64_t sub_4B58(uint64_t a1, uint64_t a2)
{
  sub_6C90();
  sub_6B70();
  Swift::Int v4 = sub_6CB0();

  return sub_4BD0(a1, a2, v4);
}

unint64_t sub_4BD0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_6C40() & 1) == 0)
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
      while (!v14 && (sub_6C40() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_4CB4(void *a1)
{
  uint64_t v2 = sub_6A50();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  uint64_t v5 = (char *)v39 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_6074(&qword_C6A8);
  __chkstk_darwin();
  uint64_t v7 = (char *)v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v40 = a1;
  id v8 = [a1 recipe];
  id v9 = [v8 attachments];

  uint64_t v10 = sub_6B90();
  uint64_t v11 = *(void *)(v10 + 16);
  v39[3] = v10;
  if (v11)
  {
    BOOL v13 = *(void (**)(char *, unint64_t, uint64_t))(v3 + 16);
    uint64_t v12 = v3 + 16;
    unint64_t v14 = v10 + ((*(unsigned __int8 *)(v12 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 64));
    uint64_t v41 = *(void *)(v12 + 56);
    unint64_t v15 = v12 + 40;
    char v16 = (unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 32);
    v43 = (void (**)(char *, char *, uint64_t))(v12 + 16);
    v44 = v13;
    uint64_t v45 = v12;
    id v17 = (void (**)(char *, uint64_t))(v12 - 8);
    swift_bridgeObjectRetain();
    v39[1] = v15 & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
    uint64_t v42 = v2;
    while (1)
    {
      v44(v7, v14, v2);
      unsigned int v18 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))v15;
      (*(void (**)(char *, void, uint64_t, uint64_t))v15)(v7, 0, 1, v2);
      if ((*v16)(v7, 1, v2) == 1) {
        break;
      }
      (*v43)(v5, v7, v2);
      char v19 = sub_6A40();
      uint64_t v20 = v2;
      char v21 = v19;
      (*v17)(v5, v20);
      if ((v21 & 1) == 0)
      {
        swift_bridgeObjectRelease_n();
        id v26 = dispatch_group_create();
        dispatch_group_enter(v26);
        uint64_t v27 = swift_allocObject();
        *(void *)(v27 + 16) = 0;
        id v28 = [self defaultSessionConfiguration];
        uint64_t v29 = swift_allocObject();
        *(void *)(v29 + 16) = v27;
        *(void *)(v29 + 24) = v26;
        aBlock[4] = sub_6728;
        aBlock[5] = v29;
        aBlock[0] = _NSConcreteStackBlock;
        aBlock[1] = 1107296256;
        aBlock[2] = sub_4030;
        aBlock[3] = &unk_8688;
        long long v30 = _Block_copy(aBlock);
        swift_retain();
        id v31 = v26;
        swift_release();
        id v32 = v40;
        [v40 downloadAttachmentsWithConfiguration:v28 completion:v30];
        _Block_release(v30);

        sub_6BC0();
        swift_beginAccess();
        uint64_t v33 = *(void *)(v27 + 16);
        if (!v33)
        {
          id v38 = [v32 recipe];
          id v23 = [v38 attachments];

          uint64_t v24 = sub_6B90();
          swift_release();
          goto LABEL_10;
        }
        swift_errorRetain();
        sub_6BA0();
        if (qword_C720 != -1) {
          swift_once();
        }
        uint64_t v24 = qword_C728;
        sub_6074(&qword_C618);
        uint64_t v34 = swift_allocObject();
        *(_OWORD *)(v34 + 16) = xmmword_7030;
        aBlock[7] = v33;
        swift_errorRetain();
        sub_6074(&qword_C6A0);
        uint64_t v35 = sub_6B60();
        uint64_t v37 = v36;
        *(void *)(v34 + 56) = &type metadata for String;
        *(void *)(v34 + 64) = sub_620C();
        *(void *)(v34 + 32) = v35;
        *(void *)(v34 + 40) = v37;
        sub_6B30();
        swift_bridgeObjectRelease();
        swift_willThrow();

        swift_release();
        return v24;
      }
      uint64_t v2 = v42;
      v14 += v41;
      if (!--v11) {
        goto LABEL_8;
      }
    }
  }
  else
  {
    unsigned int v18 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56);
    swift_bridgeObjectRetain();
LABEL_8:
    v18(v7, 1, 1, v2);
  }
  swift_bridgeObjectRelease_n();
  id v22 = [v40 recipe];
  id v23 = [v22 attachments];

  uint64_t v24 = sub_6B90();
LABEL_10:

  return v24;
}

id sub_523C(uint64_t a1)
{
  id v4 = [objc_allocWithZone((Class)REMStore) init];
  sub_6790(0, &qword_C648);
  sub_409C(a1);
  swift_bridgeObjectRetain();
  id v5 = sub_4464();
  if (v1)
  {
  }
  else
  {
    uint64_t v6 = v5;
    id v11 = 0;
    id v2 = [v4 compressedDistributedEvaluationDataWithOptions:v5 error:&v11];
    id v7 = v11;
    if (v2)
    {
      sub_6A70();

      sub_6074(&qword_C650);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_7030;
      *(void *)(inited + 32) = 0x73736563637573;
      *(void *)(inited + 40) = 0xE700000000000000;
      *(void *)(inited + 72) = &type metadata for Bool;
      *(unsigned char *)(inited + 48) = 1;
      id v2 = (id)sub_458C(inited);
    }
    else
    {
      uint64_t v10 = v7;
      sub_6A30();

      swift_willThrow();
    }
  }
  return v2;
}

void *sub_53F4(void *a1)
{
  uint64_t v4 = sub_6AD0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v29 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_6074(&qword_C670);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  id v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  BOOL v13 = (char *)&v25 - v12;
  if (a1[2] && (uint64_t v1 = a1, v14 = sub_4B58(0xD000000000000012, 0x80000000000072B0), (v15 & 1) != 0)) {
    sub_61B0(a1[7] + 32 * v14, (uint64_t)v31);
  }
  else {
    memset(v31, 0, sizeof(v31));
  }
  sub_6790(0, &qword_C678);
  sub_6A80();
  sub_6260((uint64_t)v31);
  if (!v2)
  {
    uint64_t v27 = v5;
    uint64_t v28 = v4;
    char v16 = v32;
    sub_66A0(&qword_C680, (void (*)(uint64_t))&type metadata accessor for REMSuggestedAttributesTrainer.Parameters);
    id v17 = v16;
    sub_6B20();
    uint64_t v25 = v8;
    id v26 = v17;
    (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v11, v13, v7);
    unsigned int v18 = v29;
    sub_6AC0();
    id v19 = [objc_allocWithZone((Class)REMStore) init];
    sub_6AB0();
    uint64_t v20 = (void *)sub_6AA0();
    id v21 = [objc_allocWithZone((Class)REMSuggestedAttributesPerformer) initWithQueue:v20 store:v19];

    *(void *)&v31[0] = 0;
    id v22 = (void *)sub_6AA0();
    __chkstk_darwin(v22);
    *(&v25 - 4) = (uint64_t)v21;
    *(&v25 - 3) = (uint64_t)v18;
    *(&v25 - 2) = (uint64_t)a1;
    *(&v25 - 1) = (uint64_t)v31;
    sub_6BD0();
    uint64_t v23 = v25;

    uint64_t v30 = *(void *)&v31[0];
    swift_bridgeObjectRetain();
    sub_6074(&qword_C688);
    sub_6BF0();

    swift_bridgeObjectRelease();
    uint64_t v1 = v32;
    (*(void (**)(char *, uint64_t))(v23 + 8))(v13, v7);
    (*(void (**)(char *, uint64_t))(v27 + 8))(v29, v28);
    swift_bridgeObjectRelease();
  }
  return v1;
}

void sub_58D4(void *a1)
{
  id v2 = [a1 recipe];
  id v3 = [v2 recipeUserInfo];

  uint64_t v4 = sub_6B50();
  if (!*(void *)(v4 + 16)
    || (unint64_t v5 = sub_4B58(0x6E6F69746361, 0xE600000000000000), (v6 & 1) == 0)
    || (sub_61B0(*(void *)(v4 + 56) + 32 * v5, (uint64_t)&aBlock), (swift_dynamicCast() & 1) == 0))
  {
    sub_6BA0();
    if (qword_C720 != -1) {
      swift_once();
    }
    sub_6074(&qword_C618);
    uint64_t v17 = swift_allocObject();
    *(_OWORD *)(v17 + 16) = xmmword_7030;
    *(void *)(v17 + 56) = sub_6074(&qword_C620);
    *(void *)(v17 + 64) = sub_60B8();
    *(void *)(v17 + 32) = v4;
    sub_6B30();
    swift_bridgeObjectRelease();
    sub_615C();
    swift_allocError();
    *unsigned int v18 = 0;
    goto LABEL_19;
  }
  v7._rawValue = &off_8548;
  unint64_t v8 = sub_6C30(v7, v41);
  swift_bridgeObjectRelease();
  if (v8 > 1)
  {
    swift_bridgeObjectRelease();
    sub_6BA0();
    if (qword_C720 != -1) {
      swift_once();
    }
    sub_6B30();
    sub_615C();
    swift_allocError();
    *id v21 = 1;
LABEL_19:
    id v19 = (void *)sub_6A20();
    swift_errorRelease();
    [a1 completeWithError:v19 completionHandler:0];

    return;
  }
  sub_6BB0();
  if (qword_C720 != -1) {
    swift_once();
  }
  sub_6074(&qword_C618);
  uint64_t v9 = swift_allocObject();
  uint64_t v10 = (void *)v9;
  *(_OWORD *)(v9 + 16) = xmmword_7030;
  char v11 = v8;
  if (v8) {
    unint64_t v12 = 0xD00000000000001ALL;
  }
  else {
    unint64_t v12 = 0xD000000000000013;
  }
  if (v8) {
    unint64_t v13 = 0x8000000000007130;
  }
  else {
    unint64_t v13 = 0x8000000000007110;
  }
  *(void *)(v9 + 56) = &type metadata for String;
  unint64_t v14 = sub_620C();
  v10[8] = v14;
  v10[4] = v12;
  v10[5] = v13;
  sub_6B30();
  swift_bridgeObjectRelease();
  if (*(void *)(v4 + 16) && (unint64_t v15 = sub_4B58(0xD000000000000010, 0x8000000000007200), (v16 & 1) != 0))
  {
    sub_61B0(*(void *)(v4 + 56) + 32 * v15, (uint64_t)&aBlock);
  }
  else
  {
    long long aBlock = 0u;
    long long v37 = 0u;
  }
  char v20 = v11;
  swift_bridgeObjectRelease();
  if (*((void *)&v37 + 1))
  {
    sub_6600(&aBlock, &v41);
  }
  else
  {
    uint64_t v42 = sub_6074(&qword_C620);
    v41._countAndFlagsBits = (uint64_t)&_swiftEmptyDictionarySingleton;
    sub_6260((uint64_t)&aBlock);
  }
  sub_61B0((uint64_t)&v41, (uint64_t)&aBlock);
  sub_6074(&qword_C620);
  if (swift_dynamicCast())
  {
    id v22 = v40;
    sub_4CB4(a1);
    if (v11) {
      sub_53F4(v22);
    }
    else {
      sub_523C((uint64_t)v22);
    }
    uint64_t v30 = v28;
    unint64_t v31 = v29;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    Class isa = sub_6B40().super.isa;
    swift_bridgeObjectRelease();
    Class v33 = sub_6A60().super.isa;
    uint64_t v34 = swift_allocObject();
    *(unsigned char *)(v34 + 16) = v20;
    id v38 = sub_6484;
    uint64_t v39 = v34;
    *(void *)&long long aBlock = _NSConcreteStackBlock;
    *((void *)&aBlock + 1) = 1107296256;
    *(void *)&long long v37 = sub_3F94;
    *((void *)&v37 + 1) = &unk_8610;
    uint64_t v35 = _Block_copy(&aBlock);
    swift_release();
    [a1 completeWithJSONResult:isa binaryResult:v33 completionHandler:v35];
    sub_65A8(v30, v31);
    _Block_release(v35);
  }
  else
  {
    sub_6BA0();
    uint64_t v23 = swift_allocObject();
    *(_OWORD *)(v23 + 16) = xmmword_7030;
    sub_61B0((uint64_t)&v41, (uint64_t)&aBlock);
    uint64_t v24 = sub_6B60();
    *(void *)(v23 + 56) = &type metadata for String;
    *(void *)(v23 + 64) = v14;
    *(void *)(v23 + 32) = v24;
    *(void *)(v23 + 40) = v25;
    sub_6B30();
    swift_bridgeObjectRelease();
    sub_615C();
    swift_allocError();
    *id v26 = 2;
    uint64_t v27 = (void *)sub_6A20();
    swift_errorRelease();
    [a1 completeWithError:v27 completionHandler:0];
  }
  sub_62C0((uint64_t)&v41);
}

uint64_t sub_6074(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_60B8()
{
  unint64_t result = qword_C628;
  if (!qword_C628)
  {
    sub_6114(&qword_C620);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_C628);
  }
  return result;
}

uint64_t sub_6114(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_615C()
{
  unint64_t result = qword_C630;
  if (!qword_C630)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_C630);
  }
  return result;
}

uint64_t sub_61B0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_620C()
{
  unint64_t result = qword_C638;
  if (!qword_C638)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_C638);
  }
  return result;
}

uint64_t sub_6260(uint64_t a1)
{
  uint64_t v2 = sub_6074(&qword_C640);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_62C0(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_6310()
{
  swift_errorRelease();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_6348()
{
  sub_6BA0();
  if (qword_C720 != -1) {
    swift_once();
  }
  sub_6074(&qword_C618);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_7030;
  swift_errorRetain();
  sub_6074(&qword_C6A0);
  uint64_t v1 = sub_6B60();
  uint64_t v3 = v2;
  *(void *)(v0 + 56) = &type metadata for String;
  *(void *)(v0 + 64) = sub_620C();
  *(void *)(v0 + 32) = v1;
  *(void *)(v0 + 40) = v3;
  sub_6B30();
  return swift_bridgeObjectRelease();
}

uint64_t sub_645C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_646C()
{
  return swift_release();
}

uint64_t sub_6474()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_6484()
{
  int v1 = *(unsigned __int8 *)(v0 + 16);
  sub_6BB0();
  if (qword_C720 != -1) {
    swift_once();
  }
  sub_6074(&qword_C618);
  uint64_t v2 = swift_allocObject();
  uint64_t v3 = v2;
  *(_OWORD *)(v2 + 16) = xmmword_7030;
  BOOL v4 = v1 == 0;
  if (v1) {
    unint64_t v5 = 0xD00000000000001ALL;
  }
  else {
    unint64_t v5 = 0xD000000000000013;
  }
  if (v4) {
    unint64_t v6 = 0x8000000000007110;
  }
  else {
    unint64_t v6 = 0x8000000000007130;
  }
  *(void *)(v2 + 56) = &type metadata for String;
  *(void *)(v2 + 64) = sub_620C();
  *(void *)(v3 + 32) = v5;
  *(void *)(v3 + 40) = v6;
  sub_6B30();

  return swift_bridgeObjectRelease();
}

uint64_t sub_65A8(uint64_t a1, unint64_t a2)
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

_OWORD *sub_6600(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_6610(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_6074(&qword_C660);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_6678()
{
  return swift_release();
}

uint64_t sub_6680()
{
  return sub_46B8(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(void **)(v0 + 40));
}

uint64_t sub_66A0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_66E8()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

void sub_6728(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v3 = *(NSObject **)(v1 + 24);
  swift_beginAccess();
  *(void *)(v4 + 16) = a1;
  swift_errorRetain();
  swift_errorRelease();
  dispatch_group_leave(v3);
}

uint64_t sub_6790(uint64_t a1, unint64_t *a2)
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

unsigned char *initializeBufferWithCopyOfBuffer for RDDistributedEvaluationPlugin.Error(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for RDDistributedEvaluationPlugin.Error(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for RDDistributedEvaluationPlugin.Error(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x6938);
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

uint64_t sub_6960(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_696C(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for RDDistributedEvaluationPlugin.Error()
{
  return &type metadata for RDDistributedEvaluationPlugin.Error;
}

unint64_t sub_6988()
{
  unint64_t result = qword_C6B8;
  if (!qword_C6B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_C6B8);
  }
  return result;
}

uint64_t sub_69F0()
{
  return dispatch thunk of JSONEncoder.encode<A>(_:)();
}

uint64_t sub_6A00()
{
  return JSONEncoder.init()();
}

uint64_t sub_6A10()
{
  return type metadata accessor for JSONEncoder();
}

uint64_t sub_6A20()
{
  return _convertErrorToNSError(_:)();
}

uint64_t sub_6A30()
{
  return _convertNSErrorToError(_:)();
}

uint64_t sub_6A40()
{
  return URL.isFileURL.getter();
}

uint64_t sub_6A50()
{
  return type metadata accessor for URL();
}

NSData sub_6A60()
{
  return Data._bridgeToObjectiveC()();
}

uint64_t sub_6A70()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_6A80()
{
  return throwingCast<A>(_:as:failureMessage:)();
}

uint64_t sub_6A90()
{
  return throwingCast<A>(_:as:failureMessage:)();
}

uint64_t sub_6AA0()
{
  return static RDIDispatchQueue.utilityQueue.getter();
}

uint64_t sub_6AB0()
{
  return type metadata accessor for RDIDispatchQueue();
}

uint64_t sub_6AC0()
{
  return REMSuggestedAttributesTrainer.Parameters.init(partial:)();
}

uint64_t sub_6AD0()
{
  return type metadata accessor for REMSuggestedAttributesTrainer.Parameters();
}

uint64_t sub_6AE0()
{
  return static REMSuggestedAttributesTrainer.train(in:parameters:)();
}

uint64_t sub_6AF0()
{
  return REMSuggestedAttributesTrainer.Result.droppingSensitiveFields.getter();
}

uint64_t sub_6B00()
{
  return type metadata accessor for REMSuggestedAttributesTrainer.Result();
}

uint64_t sub_6B10()
{
  return type metadata accessor for REMSuggestedAttributesTrainer();
}

uint64_t sub_6B20()
{
  return Partial<A>.init(dictionary:)();
}

uint64_t sub_6B30()
{
  return os_log(_:dso:log:_:_:)();
}

NSDictionary sub_6B40()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_6B50()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_6B60()
{
  return String.init<A>(describing:)();
}

uint64_t sub_6B70()
{
  return String.hash(into:)();
}

NSArray sub_6B80()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_6B90()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_6BA0()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_6BB0()
{
  return static os_log_type_t.default.getter();
}

void sub_6BC0()
{
}

uint64_t sub_6BD0()
{
  return OS_dispatch_queue.sync<A>(execute:)();
}

uint64_t sub_6BE0()
{
  return OS_os_log.init(subsystem:category:)();
}

uint64_t sub_6BF0()
{
  return Optional.tryUnwrap(_:file:line:)();
}

uint64_t sub_6C00()
{
  return _bridgeAnyObjectToAny(_:)();
}

Swift::Int sub_6C10(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t sub_6C20()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

Swift::Int sub_6C30(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_6C40()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_6C50()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_6C60()
{
  return Error._code.getter();
}

uint64_t sub_6C70()
{
  return Error._domain.getter();
}

uint64_t sub_6C80()
{
  return Error._userInfo.getter();
}

uint64_t sub_6C90()
{
  return Hasher.init(_seed:)();
}

void sub_6CA0(Swift::UInt a1)
{
}

Swift::Int sub_6CB0()
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

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

uint64_t swift_allocError()
{
  return _swift_allocError();
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
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

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}