id sub_242EFEB70()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SeymourAwardPlugin();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for SeymourAwardPlugin()
{
  return self;
}

id sub_242EFEC0C(void *a1, uint64_t a2, uint64_t (*a3)(void))
{
  id v4 = objc_allocWithZone((Class)a3(0));
  id v5 = a1;
  id v6 = objc_msgSend(v4, sel_init);

  return v6;
}

id sub_242EFEC74()
{
  uint64_t v9 = sub_242F01150();
  uint64_t v1 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388]();
  v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_242F01140();
  MEMORY[0x270FA5388]();
  sub_242F010F0();
  MEMORY[0x270FA5388]();
  uint64_t v8 = OBJC_IVAR____TtC19SeymourAwardsPlugin21AwardProgressProvider_queue;
  sub_242EFF670(0, (unint64_t *)&unk_26B0B6040);
  id v4 = v0;
  sub_242F010E0();
  uint64_t v11 = MEMORY[0x263F8EE78];
  sub_242EFF79C();
  sub_242EFF62C(&qword_26B0B6008);
  sub_242EFF7F4();
  sub_242F01190();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x263F8F130], v9);
  *(void *)(v7 + v8) = sub_242F01170();

  id v5 = (objc_class *)type metadata accessor for AwardProgressProvider();
  v10.receiver = v4;
  v10.super_class = v5;
  return objc_msgSendSuper2(&v10, sel_init);
}

id sub_242EFEEE0()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AwardProgressProvider();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for AwardProgressProvider()
{
  return self;
}

char *sub_242EFF060(char *a1, int64_t a2, char a3)
{
  result = sub_242EFF080(a1, a2, a3, *v3);
  char *v3 = result;
  return result;
}

char *sub_242EFF080(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
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
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_242EFF62C((uint64_t *)&unk_26B0B5F58);
    objc_super v10 = (char *)swift_allocObject();
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
    objc_super v10 = (char *)MEMORY[0x263F8EE78];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

uint64_t sub_242EFF184(void *a1)
{
  id v1 = objc_msgSend(a1, sel_sourceName);
  if (v1)
  {
    objc_super v2 = v1;
    uint64_t v3 = sub_242F01110();
    uint64_t v5 = v4;
  }
  else
  {
    uint64_t v3 = 0;
    uint64_t v5 = 0;
  }
  sub_242F01080();
  uint64_t v6 = sub_242F01070();
  if (v5)
  {
    if (v3 == v6 && v5 == v7) {
      char v8 = 1;
    }
    else {
      char v8 = sub_242F011C0();
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    char v8 = 0;
  }
  swift_bridgeObjectRelease();
  return v8 & 1;
}

char *sub_242EFF248(unint64_t a1)
{
  uint64_t v2 = sub_242F010B0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v5 = (char *)v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_242EFF62C((uint64_t *)&unk_26B0B5F48);
  uint64_t v29 = *(void *)(v6 - 8);
  uint64_t v30 = v6;
  MEMORY[0x270FA5388]();
  v28 = (char *)v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_242F01060();
  sub_242EFF670(0, (unint64_t *)&unk_26B0B6040);
  sub_242F01160();
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x263F68950], v2);
  v31[3] = sub_242F010A0();
  v31[4] = MEMORY[0x263F68940];
  sub_242EFF6AC(v31);
  sub_242F01090();
  sub_242F010D0();
  swift_allocObject();
  sub_242F010C0();
  sub_242F01160();
  uint64_t v8 = sub_242F01050();
  if (a1 >> 62) {
    goto LABEL_16;
  }
  uint64_t v9 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (!v9)
    {
LABEL_14:
      v23 = v28;
      sub_242F01040();
      swift_release();
      swift_bridgeObjectRelease();
      uint64_t v24 = v30;
      v25 = (void (*)(uint64_t (*)(uint64_t), uint64_t))sub_242F01030();
      uint64_t v26 = swift_allocObject();
      *(void *)(v26 + 16) = 0;
      *(void *)(v26 + 24) = 0;
      v25(sub_242EFF750, v26);
      swift_release();
      swift_release();
      return (char *)(*(uint64_t (**)(char *, uint64_t))(v29 + 8))(v23, v24);
    }
    v31[0] = MEMORY[0x263F8EE78];
    result = sub_242EFF060(0, v9 & ~(v9 >> 63), 0);
    if (v9 < 0) {
      break;
    }
    v27[1] = v8;
    uint64_t v11 = 0;
    uint64_t v12 = v31[0];
    unint64_t v13 = a1 & 0xC000000000000001;
    while (v9 != v11)
    {
      if (v13) {
        id v14 = (id)MEMORY[0x24566F7C0](v11, a1);
      }
      else {
        id v14 = *(id *)(a1 + 8 * v11 + 32);
      }
      v15 = v14;
      uint64_t v8 = a1;
      result = (char *)objc_msgSend(v14, sel_uniqueName);
      if (!result) {
        goto LABEL_18;
      }
      v16 = result;
      uint64_t v17 = sub_242F01110();
      uint64_t v19 = v18;

      v31[0] = v12;
      unint64_t v21 = *(void *)(v12 + 16);
      unint64_t v20 = *(void *)(v12 + 24);
      if (v21 >= v20 >> 1)
      {
        sub_242EFF060((char *)(v20 > 1), v21 + 1, 1);
        uint64_t v12 = v31[0];
      }
      ++v11;
      *(void *)(v12 + 16) = v21 + 1;
      uint64_t v22 = v12 + 16 * v21;
      *(void *)(v22 + 32) = v17;
      *(void *)(v22 + 40) = v19;
      a1 = v8;
      if (v9 == v11) {
        goto LABEL_14;
      }
    }
    __break(1u);
LABEL_16:
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_242F011B0();
    swift_bridgeObjectRelease();
  }
  __break(1u);
LABEL_18:
  __break(1u);
  return result;
}

uint64_t sub_242EFF62C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_242EFF670(uint64_t a1, unint64_t *a2)
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

uint64_t *sub_242EFF6AC(uint64_t *a1)
{
  id v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_242EFF710()
{
  if (*(void *)(v0 + 16)) {
    swift_release();
  }

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_242EFF750(uint64_t result)
{
  uint64_t v2 = *(uint64_t (**)(uint64_t *))(v1 + 16);
  char v3 = *(unsigned char *)(result + 8);
  uint64_t v4 = *(void *)result;
  char v5 = v3;
  if (v2) {
    return v2(&v4);
  }
  return result;
}

unint64_t sub_242EFF79C()
{
  unint64_t result = qword_26B0B6030;
  if (!qword_26B0B6030)
  {
    sub_242F01140();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B0B6030);
  }
  return result;
}

unint64_t sub_242EFF7F4()
{
  unint64_t result = qword_26B0B6010;
  if (!qword_26B0B6010)
  {
    sub_242EFF850(&qword_26B0B6008);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B0B6010);
  }
  return result;
}

uint64_t sub_242EFF850(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_242EFF8F8()
{
  uint64_t v0 = sub_242F01000();
  sub_242F00F6C(v0, qword_26B0B6060);
  sub_242F00F34(v0, (uint64_t)qword_26B0B6060);
  return sub_242F00FD0();
}

uint64_t sub_242EFF95C()
{
  uint64_t v0 = sub_242F01000();
  sub_242F00F6C(v0, qword_26B0B6078);
  sub_242F00F34(v0, (uint64_t)qword_26B0B6078);
  if (qword_26B0B6050 != -1) {
    swift_once();
  }
  sub_242F00F34(v0, (uint64_t)qword_26B0B6060);
  return sub_242F00FF0();
}

id sub_242EFFA88()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SeymourTemplateAssetSource();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for SeymourTemplateAssetSource()
{
  return self;
}

id sub_242EFFAF4@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v76 = sub_242F01020();
  uint64_t v74 = *(void *)(v76 - 8);
  uint64_t v4 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  v72 = (char *)&v69 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  v73 = (char *)&v69 - v6;
  uint64_t v78 = sub_242F01000();
  uint64_t v7 = *(void *)(v78 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v78);
  objc_super v10 = (char *)&v69 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x270FA5388](v8);
  unint64_t v13 = (char *)&v69 - v12;
  uint64_t v14 = MEMORY[0x270FA5388](v11);
  v75 = (char *)&v69 - v15;
  MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)&v69 - v16;
  id v18 = objc_msgSend(a1, sel_uniqueName);
  if (!v18)
  {
    __break(1u);
    goto LABEL_43;
  }
  uint64_t v19 = v18;
  uint64_t v20 = sub_242F01110();
  uint64_t v22 = v21;

  uint64_t v81 = v20;
  uint64_t v82 = v22;
  uint64_t v79 = 45;
  unint64_t v80 = 0xE100000000000000;
  sub_242F00EE0();
  v23 = (void *)sub_242F01180();
  swift_bridgeObjectRelease();
  if (!v23[2])
  {
    swift_bridgeObjectRelease();
    return (id)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 56))(a2, 1, 1, v78);
  }
  uint64_t v77 = a2;
  uint64_t v25 = v23[4];
  uint64_t v24 = v23[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if (v25 == 0xD00000000000001CLL && v24 == 0x8000000242F015F0
    || (sub_242F011C0() & 1) != 0
    || v25 == 0xD00000000000001BLL && v24 == 0x8000000242F01610
    || (sub_242F011C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    uint64_t v27 = v77;
    uint64_t v28 = v78;
    if (qword_26B0B6058 != -1) {
      swift_once();
    }
    sub_242F00F34(v28, (uint64_t)qword_26B0B6078);
    sub_242F00FF0();
    id v29 = objc_msgSend(a1, sel_uniqueName);
    if (v29)
    {
      uint64_t v30 = v29;
      sub_242F01110();

      sub_242F00FF0();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v7 + 8))(v17, v28);
      return (id)(*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v7 + 56))(v27, 0, 1, v28);
    }
LABEL_43:
    __break(1u);
LABEL_44:
    swift_once();
LABEL_39:
    uint64_t v66 = v78;
    sub_242F00F34(v78, (uint64_t)qword_26B0B6078);
    v67 = v75;
    sub_242F00FF0();
    uint64_t v68 = v77;
    sub_242F00FF0();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v67, v66);
    return (id)(*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v7 + 56))(v68, 0, 1, v66);
  }
  if (v25 != 0xD000000000000027 || v24 != 0x8000000242F01630)
  {
    char v31 = sub_242F011C0();
    swift_bridgeObjectRelease();
    uint64_t v27 = v77;
    uint64_t v28 = v78;
    if (v31) {
      goto LABEL_21;
    }
    if (qword_26B0B6050 != -1) {
      swift_once();
    }
    uint64_t v49 = sub_242F00F34(v28, (uint64_t)qword_26B0B6060);
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v10, v49, v28);
    id result = objc_msgSend(a1, sel_uniqueName);
    if (!result) {
      goto LABEL_46;
    }
    v50 = result;
    sub_242F01110();

    sub_242F00FF0();
    swift_bridgeObjectRelease();
    v51 = *(void (**)(char *, uint64_t))(v7 + 8);
    v51(v10, v28);
    sub_242F00FF0();
    v51(v13, v28);
    return (id)(*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v7 + 56))(v27, 0, 1, v28);
  }
  swift_bridgeObjectRelease();
  uint64_t v27 = v77;
  uint64_t v28 = v78;
LABEL_21:
  id result = objc_msgSend(a1, sel_uniqueName);
  if (result)
  {
    v32 = result;
    uint64_t v33 = sub_242F01110();
    uint64_t v35 = v34;

    uint64_t v81 = v33;
    uint64_t v82 = v35;
    uint64_t v79 = 45;
    unint64_t v80 = 0xE100000000000000;
    v36 = (void *)sub_242F01180();
    swift_bridgeObjectRelease();
    if (v36[2] < 3uLL)
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 56))(v27, 1, 1, v28);
      return (id)swift_bridgeObjectRelease();
    }
    uint64_t v38 = v36[6];
    uint64_t v37 = v36[7];
    uint64_t v39 = v36[5];
    uint64_t v81 = v36[4];
    uint64_t v82 = v39;
    uint64_t v71 = v37;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_242F01120();
    if (v36[2] < 3uLL)
    {
      __break(1u);
      goto LABEL_41;
    }
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    sub_242F01120();
    swift_bridgeObjectRelease();
    uint64_t v69 = v81;
    uint64_t v70 = v82;
    v41 = v73;
    uint64_t v40 = v74;
    v42 = *(uint64_t (**)(char *, void, uint64_t))(v74 + 104);
    uint64_t v43 = v76;
    uint64_t v44 = v42(v73, *MEMORY[0x263F6A0F8], v76);
    uint64_t v45 = MEMORY[0x24566F630](v44);
    uint64_t v47 = v46;
    v48 = *(void (**)(char *, uint64_t))(v40 + 8);
    v48(v41, v43);
    if (v45 == v38 && v47 == v71) {
      goto LABEL_26;
    }
    char v52 = sub_242F011C0();
    swift_bridgeObjectRelease();
    if (v52) {
      goto LABEL_36;
    }
    v53 = v72;
    uint64_t v54 = v76;
    uint64_t v55 = v42(v72, *MEMORY[0x263F6A138], v76);
    uint64_t v56 = MEMORY[0x24566F630](v55);
    uint64_t v58 = v57;
    uint64_t v59 = v54;
    uint64_t v60 = v38;
    uint64_t v61 = v71;
    v48(v53, v59);
    if (v56 == v60 && v58 == v61)
    {
LABEL_26:
      swift_bridgeObjectRelease();
      goto LABEL_36;
    }
    char v62 = sub_242F011C0();
    swift_bridgeObjectRelease();
    if (v62)
    {
LABEL_36:
      if (qword_26B0B6058 == -1)
      {
LABEL_37:
        uint64_t v63 = v78;
        sub_242F00F34(v78, (uint64_t)qword_26B0B6078);
        v64 = v75;
        sub_242F00FF0();
        uint64_t v81 = v69;
        uint64_t v82 = v70;
        sub_242F01120();
        sub_242F01120();
        swift_bridgeObjectRelease();
        uint64_t v65 = v77;
        sub_242F00FF0();
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v7 + 8))(v64, v63);
        return (id)(*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v7 + 56))(v65, 0, 1, v63);
      }
LABEL_41:
      swift_once();
      goto LABEL_37;
    }
    swift_bridgeObjectRelease();
    if (qword_26B0B6058 == -1) {
      goto LABEL_39;
    }
    goto LABEL_44;
  }
  __break(1u);
LABEL_46:
  __break(1u);
  return result;
}

id sub_242F004A0@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_242F01000();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  objc_super v10 = (char *)v24 - v9;
  id result = objc_msgSend(a1, sel_uniqueName);
  if (!result)
  {
    __break(1u);
    goto LABEL_26;
  }
  uint64_t v12 = result;
  uint64_t v13 = sub_242F01110();
  uint64_t v15 = v14;

  v24[2] = v13;
  v24[3] = v15;
  v24[0] = 45;
  v24[1] = 0xE100000000000000;
  sub_242F00EE0();
  uint64_t v16 = (void *)sub_242F01180();
  swift_bridgeObjectRelease();
  if (!v16[2])
  {
    swift_bridgeObjectRelease();
    uint64_t v19 = 1;
    return (id)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 56))(a2, v19, 1, v4);
  }
  uint64_t v18 = v16[4];
  uint64_t v17 = v16[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if (v18 == 0xD00000000000001CLL && v17 == 0x8000000242F015F0
    || (sub_242F011C0() & 1) != 0
    || v18 == 0xD00000000000001BLL && v17 == 0x8000000242F01610
    || (sub_242F011C0() & 1) != 0
    || v18 == 0xD000000000000027 && v17 == 0x8000000242F01630)
  {
    swift_bridgeObjectRelease();
LABEL_12:
    if (qword_26B0B6058 != -1) {
      swift_once();
    }
    sub_242F00F34(v4, (uint64_t)qword_26B0B6078);
    sub_242F00FF0();
    goto LABEL_15;
  }
  char v20 = sub_242F011C0();
  swift_bridgeObjectRelease();
  if (v20) {
    goto LABEL_12;
  }
  if (qword_26B0B6050 != -1) {
    swift_once();
  }
  uint64_t v21 = sub_242F00F34(v4, (uint64_t)qword_26B0B6060);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, v21, v4);
  id result = objc_msgSend(a1, sel_uniqueName);
  if (result)
  {
    uint64_t v22 = result;
    sub_242F01110();

    sub_242F00FF0();
    swift_bridgeObjectRelease();
    v23 = *(void (**)(char *, uint64_t))(v5 + 8);
    v23(v8, v4);
    sub_242F00FF0();
    v23(v10, v4);
LABEL_15:
    uint64_t v19 = 0;
    return (id)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 56))(a2, v19, 1, v4);
  }
LABEL_26:
  __break(1u);
  return result;
}

id sub_242F008B8@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v31 = a2;
  uint64_t v3 = sub_242F01000();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)&v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v5);
  uint64_t v30 = (char *)&v30 - v9;
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v30 - v11;
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v30 - v13;
  id result = objc_msgSend(a1, sel_uniqueName);
  if (!result)
  {
    __break(1u);
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  uint64_t v16 = result;
  uint64_t v17 = sub_242F01110();
  uint64_t v19 = v18;

  uint64_t v34 = v17;
  uint64_t v35 = v19;
  uint64_t v32 = 45;
  unint64_t v33 = 0xE100000000000000;
  sub_242F00EE0();
  char v20 = (void *)sub_242F01180();
  swift_bridgeObjectRelease();
  if (!v20[2])
  {
    swift_bridgeObjectRelease();
    uint64_t v23 = 1;
    uint64_t v24 = v31;
    return (id)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v4 + 56))(v24, v23, 1, v3);
  }
  uint64_t v22 = v20[4];
  uint64_t v21 = v20[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if (v22 == 0xD00000000000001CLL && v21 == 0x8000000242F015F0
    || (sub_242F011C0() & 1) != 0
    || v22 == 0xD00000000000001BLL && v21 == 0x8000000242F01610
    || (sub_242F011C0() & 1) != 0
    || v22 == 0xD000000000000027 && v21 == 0x8000000242F01630)
  {
    swift_bridgeObjectRelease();
    goto LABEL_12;
  }
  char v27 = sub_242F011C0();
  swift_bridgeObjectRelease();
  if (v27)
  {
LABEL_12:
    if (qword_26B0B6058 != -1) {
      swift_once();
    }
    sub_242F00F34(v3, (uint64_t)qword_26B0B6078);
    sub_242F00FF0();
    id result = objc_msgSend(a1, sel_uniqueName);
    if (result)
    {
      uint64_t v25 = result;
      sub_242F01110();

      sub_242F00FF0();
      swift_bridgeObjectRelease();
      uint64_t v26 = *(void (**)(char *, uint64_t))(v4 + 8);
      v26(v12, v3);
      uint64_t v24 = v31;
LABEL_16:
      sub_242F00FF0();
      v26(v14, v3);
      uint64_t v23 = 0;
      return (id)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v4 + 56))(v24, v23, 1, v3);
    }
    goto LABEL_27;
  }
  if (qword_26B0B6050 != -1) {
    swift_once();
  }
  uint64_t v28 = sub_242F00F34(v3, (uint64_t)qword_26B0B6060);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v7, v28, v3);
  id result = objc_msgSend(a1, sel_uniqueName);
  uint64_t v24 = v31;
  if (result)
  {
    id v29 = result;
    sub_242F01110();

    uint64_t v14 = v30;
    sub_242F00FF0();
    swift_bridgeObjectRelease();
    uint64_t v26 = *(void (**)(char *, uint64_t))(v4 + 8);
    v26(v7, v3);
    goto LABEL_16;
  }
LABEL_28:
  __break(1u);
  return result;
}

id sub_242F00D9C(void *a1, uint64_t a2, void *a3, void (*a4)(id))
{
  uint64_t v7 = sub_242EFF62C(&qword_26B0B5FF0);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v10 = a3;
  id v11 = a1;
  a4(v10);

  uint64_t v12 = sub_242F01000();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v9, 1, v12) != 1)
  {
    uint64_t v14 = (void *)sub_242F00FE0();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v9, v12);
  }

  return v14;
}

unint64_t sub_242F00EE0()
{
  unint64_t result = qword_26B0B5FF8;
  if (!qword_26B0B5FF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B0B5FF8);
  }
  return result;
}

uint64_t sub_242F00F34(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t *sub_242F00F6C(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_242F00FD0()
{
  return MEMORY[0x270EEFCB0]();
}

uint64_t sub_242F00FE0()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_242F00FF0()
{
  return MEMORY[0x270EEFD78]();
}

uint64_t sub_242F01000()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_242F01010()
{
  return MEMORY[0x270F60350]();
}

uint64_t sub_242F01020()
{
  return MEMORY[0x270F60358]();
}

uint64_t sub_242F01030()
{
  return MEMORY[0x270F61D68]();
}

uint64_t sub_242F01040()
{
  return MEMORY[0x270F5D400]();
}

uint64_t sub_242F01050()
{
  return MEMORY[0x270F5D410]();
}

uint64_t sub_242F01060()
{
  return MEMORY[0x270F5D418]();
}

uint64_t sub_242F01070()
{
  return MEMORY[0x270F5E240]();
}

uint64_t sub_242F01080()
{
  return MEMORY[0x270F5E290]();
}

uint64_t sub_242F01090()
{
  return MEMORY[0x270F5E3A0]();
}

uint64_t sub_242F010A0()
{
  return MEMORY[0x270F5E3A8]();
}

uint64_t sub_242F010B0()
{
  return MEMORY[0x270F5E3D0]();
}

uint64_t sub_242F010C0()
{
  return MEMORY[0x270F5E9D8]();
}

uint64_t sub_242F010D0()
{
  return MEMORY[0x270F5E9E0]();
}

uint64_t sub_242F010E0()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_242F010F0()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_242F01100()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_242F01110()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_242F01120()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_242F01130()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_242F01140()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t sub_242F01150()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_242F01160()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_242F01170()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t sub_242F01180()
{
  return MEMORY[0x270EF23E8]();
}

uint64_t sub_242F01190()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_242F011A0()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_242F011B0()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_242F011C0()
{
  return MEMORY[0x270F9F7D0]();
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
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

uint64_t swift_allocBox()
{
  return MEMORY[0x270FA0180]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x270FA01C8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
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

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}