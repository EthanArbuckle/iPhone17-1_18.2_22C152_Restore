id sub_100002AB4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v16;

  v0 = sub_1000069D8();
  v1 = *(void *)(v0 - 8);
  ((void (*)(void))__chkstk_darwin)();
  v3 = (char *)&v16 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_1000069F8();
  v5 = *(void *)(v4 - 8);
  v6 = ((uint64_t (*)(void))__chkstk_darwin)();
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v10 = (char *)&v16 - v9;
  sub_1000069B8();
  v11 = sub_1000069A8();
  sub_100006AC8();
  v12 = sub_100006AB8();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for ContactFormatter.Style.fullName(_:), v0);
  sub_100006AF8();
  sub_1000069E8();
  sub_100006A18();
  v13 = sub_100006A08();
  (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v8, v10, v4);
  v14 = sub_100005378(v11, v12, (uint64_t)v8, v13);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v14;
}

uint64_t sub_100002D38(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6 = v5;
  id v10 = [a1 people];
  uint64_t v50 = a5;
  v51 = v5;
  uint64_t v48 = a2;
  if (!v10)
  {
    uint64_t v20 = 0;
    goto LABEL_35;
  }
  v11 = v10;
  uint64_t v46 = a4;
  sub_100006998();
  unint64_t v12 = sub_100006B48();

  if (v12 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_100006C68();
    uint64_t v13 = result;
    if (!result) {
      goto LABEL_16;
    }
  }
  else
  {
    uint64_t v13 = *(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (!v13) {
      goto LABEL_16;
    }
  }
  if (v13 < 1)
  {
    __break(1u);
    goto LABEL_45;
  }
  for (uint64_t i = 0; i != v13; ++i)
  {
    if ((v12 & 0xC000000000000001) != 0) {
      id v17 = (id)sub_100006BE8();
    }
    else {
      id v17 = *(id *)(v12 + 8 * i + 32);
    }
    v18 = v17;
    id v19 = [v17 identifier];
    if (v19)
    {
      v16 = v19;
    }
    else
    {
      sub_100006C08();
      sub_100006C38();
      sub_100006C48();
      sub_100006C18();
    }
  }
LABEL_16:
  swift_bridgeObjectRelease();
  if (((unint64_t)_swiftEmptyArrayStorage & 0x8000000000000000) != 0
    || ((unint64_t)_swiftEmptyArrayStorage & 0x4000000000000000) != 0)
  {
    swift_bridgeObjectRetain();
    uint64_t v20 = sub_100006C68();
    swift_release();
  }
  else
  {
    uint64_t v20 = _swiftEmptyArrayStorage[2];
  }
  swift_release();
  if (!(v12 >> 62))
  {
    uint64_t v21 = *(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v21) {
      goto LABEL_21;
    }
LABEL_34:
    swift_bridgeObjectRelease();
    v6 = v51;
    goto LABEL_35;
  }
  swift_bridgeObjectRetain();
  uint64_t v21 = sub_100006C68();
  swift_bridgeObjectRelease();
  if (!v21) {
    goto LABEL_34;
  }
LABEL_21:
  uint64_t result = sub_100005134(0, v21 & ~(v21 >> 63), 0);
  if (v21 < 0)
  {
LABEL_45:
    __break(1u);
    return result;
  }
  uint64_t v45 = v20;
  uint64_t v22 = 0;
  do
  {
    if ((v12 & 0xC000000000000001) != 0) {
      id v23 = (id)sub_100006BE8();
    }
    else {
      id v23 = *(id *)(v12 + 8 * v22 + 32);
    }
    v24 = v23;
    id v25 = [v23 identifier];
    if (v25)
    {
      v26 = v25;
      uint64_t v27 = sub_100006AE8();
      unint64_t v29 = v28;
    }
    else
    {

      uint64_t v27 = 0;
      unint64_t v29 = 0xE000000000000000;
    }
    unint64_t v31 = _swiftEmptyArrayStorage[2];
    unint64_t v30 = _swiftEmptyArrayStorage[3];
    if (v31 >= v30 >> 1) {
      sub_100005134(v30 > 1, v31 + 1, 1);
    }
    ++v22;
    _swiftEmptyArrayStorage[2] = v31 + 1;
    v32 = (char *)&_swiftEmptyArrayStorage[2 * v31];
    *((void *)v32 + 4) = v27;
    *((void *)v32 + 5) = v29;
  }
  while (v21 != v22);
  swift_bridgeObjectRelease();
  v6 = v51;
  a4 = v46;
  a2 = v48;
  uint64_t v20 = v45;
LABEL_35:
  uint64_t v33 = swift_allocObject();
  *(unsigned char *)(v33 + 16) = v20 < sub_100006948();
  uint64_t v34 = swift_allocObject();
  *(void *)(v34 + 16) = _swiftEmptyArrayStorage;
  uint64_t v35 = OBJC_IVAR____TtC16SelectPerson_iOS13IntentHandler_allContacts;
  unint64_t v36 = *(void *)&v6[OBJC_IVAR____TtC16SelectPerson_iOS13IntentHandler_allContacts];
  if (v36 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v44 = sub_100006C68();
    swift_bridgeObjectRelease();
    if (v44) {
      goto LABEL_38;
    }
    goto LABEL_37;
  }
  if (!*(void *)((v36 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_37:
    sub_100004860(&v6[OBJC_IVAR____TtC16SelectPerson_iOS13IntentHandler_contactFetcher], *(void *)&v6[OBJC_IVAR____TtC16SelectPerson_iOS13IntentHandler_contactFetcher + 24]);
    a2 = v48;
    *(void *)&v6[v35] = sub_100006A38();
    swift_bridgeObjectRelease();
  }
LABEL_38:
  *(void *)(v34 + 16) = *(void *)&v6[v35];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v37 = (void *)swift_allocObject();
  v37[2] = _swiftEmptyArrayStorage;
  v37[3] = v6;
  v37[4] = a2;
  v37[5] = a3;
  v37[6] = v33;
  v37[7] = v34;
  v37[8] = a4;
  v37[9] = v50;
  uint64_t v38 = swift_allocObject();
  *(void *)(v38 + 16) = _swiftEmptyArrayStorage;
  v39 = &v6[OBJC_IVAR____TtC16SelectPerson_iOS13IntentHandler_widgetCenter];
  uint64_t v41 = *(void *)&v6[OBJC_IVAR____TtC16SelectPerson_iOS13IntentHandler_widgetCenter + 24];
  uint64_t v40 = *((void *)v39 + 4);
  sub_100004860(v39, v41);
  v42 = (void *)swift_allocObject();
  v42[2] = v38;
  v42[3] = sub_100004914;
  v42[4] = v37;
  v47 = *(void (**)(uint64_t (*)(unint64_t), void *, uint64_t, uint64_t))(v40 + 8);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  v43 = v51;
  v47(sub_1000049C0, v42, v41, v40);
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  return swift_release();
}

void sub_1000032C8(char *a1, uint64_t a2, uint64_t a3, char *a4, uint64_t a5, uint64_t a6, uint64_t a7, void (*a8)(id, void))
{
  uint64_t v9 = a6;
  uint64_t v10 = a5;
  *(void *)&long long v92 = a3;
  v94 = *(unsigned char **)(a2 + 16);
  if (!v94)
  {
    swift_bridgeObjectRetain();
LABEL_60:
    uint64_t v40 = (unsigned char *)(v9 + 16);
    uint64_t v41 = (uint64_t *)(a7 + 16);
    sub_100004860((void *)(v92 + OBJC_IVAR____TtC16SelectPerson_iOS13IntentHandler_contactFetcher), *(void *)(v92 + OBJC_IVAR____TtC16SelectPerson_iOS13IntentHandler_contactFetcher + 24));
    sub_100006958();
    swift_bridgeObjectRetain();
    unint64_t v42 = sub_100006A58();
    swift_bridgeObjectRelease();
    unint64_t v97 = v42;
    v94 = v40;
    if (v10)
    {
      swift_beginAccess();
      *uint64_t v40 = 0;
      swift_bridgeObjectRetain();
      uint64_t v43 = sub_100006A28();
      swift_bridgeObjectRelease_n();
      unint64_t v97 = v43;
      swift_beginAccess();
      swift_bridgeObjectRetain();
      uint64_t v44 = sub_100006A28();
      swift_bridgeObjectRelease();
      swift_beginAccess();
      *uint64_t v41 = v44;
      swift_bridgeObjectRelease();
      unint64_t v42 = v43;
    }
    swift_beginAccess();
    unint64_t v45 = *v41;
    swift_bridgeObjectRetain();
    uint64_t v46 = sub_100006978();
    uint64_t v47 = sub_100005734(v46, v45);
    uint64_t v49 = v48;
    uint64_t v51 = v50;
    unint64_t v53 = v52;
    swift_bridgeObjectRelease();
    a4 = (char *)(id)v92;
    sub_1000058C8(v47, v49, v51, v53, (uint64_t *)&v97);
    swift_unknownObjectRelease();

    sub_100006AF8();
    id v54 = objc_allocWithZone((Class)INObjectSection);
    NSString v55 = sub_100006AD8();
    swift_bridgeObjectRelease();
    sub_100006998();
    Class isa = sub_100006B38().super.isa;
    swift_bridgeObjectRelease();
    id v95 = [v54 initWithTitle:v55 items:isa];

    sub_1000052C0(&qword_10000C750);
    uint64_t v57 = swift_allocObject();
    long long v92 = xmmword_1000070E0;
    *(_OWORD *)(v57 + 16) = xmmword_1000070E0;
    sub_100006968();
    sub_100006AF8();
    swift_bridgeObjectRelease();
    id v58 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
    NSString v59 = sub_100006AD8();
    swift_bridgeObjectRelease();
    id v60 = [v58 initWithIdentifier:0 displayString:v59];

    *(void *)(v57 + 32) = v60;
    sub_100006B58();
    id v61 = objc_allocWithZone((Class)INObjectSection);
    Class v62 = sub_100006B38().super.isa;
    swift_bridgeObjectRelease();
    v8 = (char *)[v61 initWithTitle:0 items:v62];

    if (v42 >> 62)
    {
LABEL_79:
      swift_bridgeObjectRetain();
      uint64_t v80 = sub_100006C68();
      swift_bridgeObjectRelease();
      v63 = v94;
      if (v80) {
        goto LABEL_64;
      }
    }
    else
    {
      v63 = v94;
      if (*(void *)((v42 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
LABEL_64:
        v64 = a4;
        unint64_t v65 = swift_bridgeObjectRetain();
        sub_100005504(v65);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();

        sub_100006AF8();
        id v66 = objc_allocWithZone((Class)INObjectSection);
        NSString v67 = sub_100006AD8();
        swift_bridgeObjectRelease();
        Class v68 = sub_100006B38().super.isa;
        swift_bridgeObjectRelease();
        id v69 = [v66 initWithTitle:v67 items:v68];

        swift_beginAccess();
        if (*v63 == 1)
        {
          uint64_t v70 = swift_allocObject();
          *(_OWORD *)(v70 + 16) = xmmword_100007100;
          *(void *)(v70 + 32) = v8;
          *(void *)(v70 + 40) = v69;
          v71 = v95;
          *(void *)(v70 + 48) = v95;
          sub_100006B58();
          v72 = v8;
        }
        else
        {
          uint64_t v73 = swift_allocObject();
          *(_OWORD *)(v73 + 16) = xmmword_1000070F0;
          v71 = v95;
          *(void *)(v73 + 32) = v69;
          *(void *)(v73 + 40) = v95;
          sub_100006B58();
        }
        id v74 = objc_allocWithZone((Class)INObjectCollection);
        id v75 = v71;
        id v76 = v69;
        sub_1000052C0(&qword_10000C758);
        Class v77 = sub_100006B38().super.isa;
        swift_bridgeObjectRelease();
        id v78 = [v74 initWithSections:v77];

        id v79 = v78;
        a8(v78, 0);
        swift_bridgeObjectRelease();

        goto LABEL_84;
      }
    }
    swift_bridgeObjectRelease();
    swift_beginAccess();
    if (*v63 == 1)
    {
      uint64_t v81 = swift_allocObject();
      *(_OWORD *)(v81 + 16) = xmmword_1000070F0;
      v71 = v95;
      *(void *)(v81 + 32) = v8;
      *(void *)(v81 + 40) = v95;
      sub_100006B58();
      v82 = v8;
    }
    else
    {
      uint64_t v83 = swift_allocObject();
      *(_OWORD *)(v83 + 16) = v92;
      v71 = v95;
      *(void *)(v83 + 32) = v95;
      sub_100006B58();
    }
    id v84 = objc_allocWithZone((Class)INObjectCollection);
    id v85 = v71;
    sub_1000052C0(&qword_10000C758);
    Class v86 = sub_100006B38().super.isa;
    swift_bridgeObjectRelease();
    id v87 = [v84 initWithSections:v86];

    id v79 = v87;
    a8(v87, 0);
    swift_bridgeObjectRelease();
LABEL_84:

    return;
  }
  uint64_t v93 = a2 + 32;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v13 = 0;
  while (1)
  {
    v14 = (uint64_t *)(v93 + 16 * (void)v13);
    uint64_t v15 = v14[1];
    uint64_t v16 = *((void *)a1 + 2);
    if (!v16)
    {
      swift_bridgeObjectRetain();
      uint64_t v19 = 0;
      int64_t v21 = 0;
      goto LABEL_18;
    }
    uint64_t v17 = *v14;
    BOOL v18 = *((void *)a1 + 4) == *v14 && *((void *)a1 + 5) == v15;
    if (v18 || (sub_100006C98() & 1) != 0)
    {
      uint64_t v19 = 0;
    }
    else
    {
      if (v16 == 1)
      {
        int64_t v21 = *((void *)a1 + 2);
        swift_bridgeObjectRetain();
        if (!v21) {
          goto LABEL_73;
        }
        uint64_t v19 = 1;
        goto LABEL_18;
      }
      v37 = a1 + 56;
      uint64_t v19 = 1;
      while (1)
      {
        BOOL v38 = *(v37 - 1) == v17 && *v37 == v15;
        if (v38 || (sub_100006C98() & 1) != 0) {
          break;
        }
        uint64_t v39 = v19 + 1;
        if (__OFADD__(v19, 1)) {
          goto LABEL_76;
        }
        v37 += 2;
        ++v19;
        if (v39 == v16)
        {
          id v95 = v13;
          uint64_t v19 = v16;
          goto LABEL_13;
        }
      }
    }
    uint64_t v20 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      goto LABEL_77;
    }
    id v95 = v13;
    if (v20 != v16)
    {
      swift_bridgeObjectRetain();
      uint64_t v29 = 16 * v19;
      v8 = (char *)(v19 + 1);
      while ((v20 & 0x8000000000000000) == 0)
      {
        a4 = (char *)*((void *)a1 + 2);
        if (v8 >= a4) {
          goto LABEL_69;
        }
        unint64_t v31 = &a1[v29];
        BOOL v32 = *(void *)&a1[v29 + 48] == v17 && *(void *)&a1[v29 + 56] == v15;
        if (!v32 && (sub_100006C98() & 1) == 0)
        {
          if (v8 != (char *)v19)
          {
            if (v19 >= (unint64_t)a4) {
              goto LABEL_71;
            }
            uint64_t v33 = &a1[16 * v19 + 32];
            uint64_t v34 = *((void *)v33 + 1);
            uint64_t v96 = *(void *)v33;
            a4 = (char *)*((void *)v31 + 6);
            uint64_t v35 = *((void *)v31 + 7);
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
              a1 = sub_100005364((uint64_t)a1);
            }
            unint64_t v36 = &a1[16 * v19];
            *((void *)v36 + 4) = a4;
            *((void *)v36 + 5) = v35;
            swift_bridgeObjectRelease();
            if ((unint64_t)v8 >= *((void *)a1 + 2)) {
              goto LABEL_72;
            }
            unint64_t v30 = &a1[v29];
            *((void *)v30 + 6) = v96;
            *((void *)v30 + 7) = v34;
            swift_bridgeObjectRelease();
          }
          BOOL v27 = __OFADD__(v19++, 1);
          if (v27) {
            goto LABEL_70;
          }
        }
        ++v8;
        v29 += 16;
        if (v8 == *((char **)a1 + 2)) {
          goto LABEL_14;
        }
      }
      __break(1u);
LABEL_69:
      __break(1u);
LABEL_70:
      __break(1u);
LABEL_71:
      __break(1u);
LABEL_72:
      __break(1u);
LABEL_73:
      __break(1u);
LABEL_74:
      __break(1u);
LABEL_75:
      __break(1u);
LABEL_76:
      __break(1u);
LABEL_77:
      __break(1u);
LABEL_78:
      __break(1u);
      goto LABEL_79;
    }
LABEL_13:
    swift_bridgeObjectRetain();
LABEL_14:
    int64_t v21 = *((void *)a1 + 2);
    id v13 = v95;
    if (v21 < v19) {
      goto LABEL_73;
    }
    if (v19 < 0) {
      goto LABEL_74;
    }
LABEL_18:
    uint64_t v22 = v19 - v21;
    if (__OFADD__(v21, v19 - v21)) {
      goto LABEL_75;
    }
    isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
    if (!isUniquelyReferenced_nonNull_native || v19 > *((void *)a1 + 3) >> 1)
    {
      if (v21 <= v19) {
        int64_t v24 = v19;
      }
      else {
        int64_t v24 = v21;
      }
      a1 = sub_1000049CC(isUniquelyReferenced_nonNull_native, v24, 1, a1);
    }
    a4 = a1 + 32;
    swift_arrayDestroy();
    if (v21 == v19) {
      goto LABEL_3;
    }
    uint64_t v25 = *((void *)a1 + 2) - v21;
    if (v25 < 0) {
      break;
    }
    memmove(&a1[16 * v19 + 32], &a4[16 * v21], 16 * v25);
    uint64_t v26 = *((void *)a1 + 2);
    BOOL v27 = __OFADD__(v26, v22);
    uint64_t v28 = v26 + v22;
    if (v27) {
      goto LABEL_78;
    }
    *((void *)a1 + 2) = v28;
LABEL_3:
    id v13 = (char *)v13 + 1;
    swift_bridgeObjectRelease();
    if (v13 == v94)
    {
      swift_bridgeObjectRelease();
      uint64_t v10 = a5;
      uint64_t v9 = a6;
      goto LABEL_60;
    }
  }
  sub_100006C88();
  __break(1u);
}

void sub_100003DA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = sub_1000068F8();
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = (id)v5;
  (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, a1);
}

uint64_t sub_100003E9C(unint64_t a1, unint64_t a2, void (*a3)(uint64_t), uint64_t a4)
{
  v56[1] = a4;
  uint64_t v57 = a3;
  uint64_t v6 = sub_100006918();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)v56 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1 >> 62) {
    goto LABEL_39;
  }
  uint64_t v10 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  unint64_t v12 = (char **)(a2 + 16);
  while (v10)
  {
    a2 = 0;
    unint64_t v62 = a1 & 0xC000000000000001;
    uint64_t v59 = a1 & 0xFFFFFFFFFFFFFF8;
    unint64_t v58 = a1 + 32;
    id v13 = (void (**)(char *, uint64_t))(v7 + 8);
    *(void *)&long long v11 = 136315138;
    long long v67 = v11;
    id v66 = (char *)&type metadata for Any + 8;
    v14 = &OBJC_PROTOCOL___SelectPeopleIntentHandling;
    uint64_t v60 = v10;
    unint64_t v61 = a1;
    while (1)
    {
      if (v62)
      {
        id v16 = (id)sub_100006BE8();
      }
      else
      {
        if (a2 >= *(void *)(v59 + 16)) {
          goto LABEL_38;
        }
        id v16 = *(id *)(v58 + 8 * a2);
      }
      uint64_t v7 = (uint64_t)v16;
      if (__OFADD__(a2++, 1)) {
        break;
      }
      sub_100006928();
      uint64_t v18 = swift_dynamicCastClass();
      uint64_t v15 = (void *)v7;
      if (!v18) {
        goto LABEL_5;
      }
      uint64_t v19 = (void *)v18;
      v64 = v15;
      id v63 = v15;
      id v20 = [v19 people];
      if (v20)
      {
        int64_t v21 = v20;
        sub_100006998();
        unint64_t v22 = sub_100006B48();
      }
      else
      {
        unint64_t v22 = (unint64_t)&_swiftEmptyArrayStorage;
      }
      unint64_t v65 = a2;
      if (v22 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v7 = sub_100006C68();
        swift_bridgeObjectRelease();
        if (v7)
        {
LABEL_17:
          if (v7 < 1) {
            goto LABEL_37;
          }
          uint64_t v23 = 0;
          unint64_t v70 = v22 & 0xC000000000000001;
          uint64_t v71 = v7;
          unint64_t v72 = v22;
          do
          {
            if (v70) {
              id v24 = (id)sub_100006BE8();
            }
            else {
              id v24 = *(id *)(v22 + 8 * v23 + 32);
            }
            uint64_t v25 = v24;
            sub_100006938();
            id v26 = v25;
            BOOL v27 = sub_100006908();
            os_log_type_t v28 = sub_100006B98();
            BOOL v29 = os_log_type_enabled(v27, v28);
            uint64_t v73 = v23;
            id v74 = v26;
            if (v29)
            {
              unint64_t v30 = (_DWORD *)swift_slowAlloc();
              Class v68 = v30;
              uint64_t v69 = swift_slowAlloc();
              v75[0] = v69;
              *unint64_t v30 = v67;
              id v31 = [v26 debugDescription];
              BOOL v32 = v14;
              uint64_t v33 = v13;
              uint64_t v34 = v9;
              uint64_t v35 = v6;
              id v36 = v31;
              v37 = v12;
              uint64_t v38 = sub_100006AE8();
              unint64_t v40 = v39;

              uint64_t v6 = v35;
              uint64_t v9 = v34;
              id v13 = v33;
              v14 = v32;
              id v26 = v74;
              uint64_t v41 = v38;
              unint64_t v12 = v37;
              uint64_t v42 = sub_100004ADC(v41, v40, v75);
              uint64_t v43 = (uint8_t *)v68;
              *(void *)(v68 + 1) = v42;

              swift_bridgeObjectRelease();
              _os_log_impl((void *)&_mh_execute_header, v27, v28, "people in widget%s", v43, 0xCu);
              swift_arrayDestroy();
              swift_slowDealloc();
              swift_slowDealloc();
            }
            else
            {
            }
            (*v13)(v9, v6);
            id v44 = [v26 v14[16].inst_props];
            if (v44)
            {
              unint64_t v45 = v44;
              uint64_t v46 = sub_100006AE8();
              uint64_t v7 = v47;
            }
            else
            {
              uint64_t v46 = 0;
              uint64_t v7 = 0xE000000000000000;
            }
            swift_beginAccess();
            uint64_t v48 = *v12;
            char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
            *unint64_t v12 = v48;
            if ((isUniquelyReferenced_nonNull_native & 1) == 0)
            {
              uint64_t v48 = sub_1000049CC(0, *((void *)v48 + 2) + 1, 1, v48);
              *unint64_t v12 = v48;
            }
            unint64_t v51 = *((void *)v48 + 2);
            unint64_t v50 = *((void *)v48 + 3);
            if (v51 >= v50 >> 1)
            {
              uint64_t v48 = sub_1000049CC((char *)(v50 > 1), v51 + 1, 1, v48);
              *unint64_t v12 = v48;
            }
            uint64_t v52 = v73 + 1;
            *((void *)v48 + 2) = v51 + 1;
            unint64_t v53 = &v48[16 * v51];
            uint64_t v23 = v52;
            *((void *)v53 + 4) = v46;
            *((void *)v53 + 5) = v7;
            swift_endAccess();

            unint64_t v22 = v72;
          }
          while (v71 != v23);
        }
      }
      else
      {
        uint64_t v7 = *(void *)((v22 & 0xFFFFFFFFFFFFFF8) + 0x10);
        if (v7) {
          goto LABEL_17;
        }
      }

      swift_bridgeObjectRelease();
      uint64_t v10 = v60;
      a1 = v61;
      uint64_t v15 = v64;
      a2 = v65;
LABEL_5:

      if (a2 == v10) {
        goto LABEL_40;
      }
    }
    __break(1u);
LABEL_37:
    __break(1u);
LABEL_38:
    __break(1u);
LABEL_39:
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_100006C68();
    unint64_t v12 = (char **)(a2 + 16);
  }
LABEL_40:
  swift_bridgeObjectRelease();
  swift_beginAccess();
  uint64_t v54 = swift_bridgeObjectRetain();
  v57(v54);
  return swift_bridgeObjectRelease();
}

id sub_100004420(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_1000069D8();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = sub_1000069F8();
  uint64_t v8 = *(void *)(v27 - 8);
  __chkstk_darwin(v27);
  uint64_t v10 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v11 = [a1 identifier];
  uint64_t v12 = sub_100006AE8();
  uint64_t v14 = v13;

  uint64_t v29 = v12;
  uint64_t v30 = v14;
  sub_100004860((void *)(v2 + OBJC_IVAR____TtC16SelectPerson_iOS13IntentHandler_contactFormatter), *(void *)(v2 + OBJC_IVAR____TtC16SelectPerson_iOS13IntentHandler_contactFormatter + 24));
  sub_100006A68();
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, enum case for ContactFormatter.Style.shortName(_:), v4);
  uint64_t v15 = a1;
  sub_100006AF8();
  sub_1000069E8();
  v16.super.Class isa = (Class)a1;
  sub_1000069C8(v16);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v27);
  sub_100004860((void *)(v2 + OBJC_IVAR____TtC16SelectPerson_iOS13IntentHandler_verticalTextHelper), *(void *)(v2 + OBJC_IVAR____TtC16SelectPerson_iOS13IntentHandler_verticalTextHelper + 24));
  uint64_t v17 = sub_100006A78();
  uint64_t v19 = v18;
  swift_bridgeObjectRelease();
  if (v19)
  {
    v28._countAndFlagsBits = 124;
    v28._object = (void *)0xE100000000000000;
    v31._countAndFlagsBits = v17;
    v31._object = v19;
    sub_100006B08(v31);
    swift_bridgeObjectRelease();
    sub_100006B08(v28);
    swift_bridgeObjectRelease();
  }
  sub_100006998();
  id v20 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  NSString v21 = sub_100006AD8();
  swift_bridgeObjectRelease();
  NSString v22 = sub_100006AD8();
  swift_bridgeObjectRelease();
  id v23 = [v20 initWithIdentifier:v21 displayString:v22];

  NSString v24 = [v15 identifier];
  if (!v24)
  {
    sub_100006AE8();
    NSString v24 = sub_100006AD8();
    swift_bridgeObjectRelease();
  }
  [v23 setId:v24];

  return v23;
}

id sub_10000478C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IntentHandler();
  return [super dealloc];
}

uint64_t type metadata accessor for IntentHandler()
{
  return self;
}

void *sub_100004860(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_1000048A4()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_1000048B4()
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 80, 7);
}

void sub_100004914(char *a1)
{
  sub_1000032C8(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(char **)(v1 + 32), *(void *)(v1 + 40), *(void *)(v1 + 48), *(void *)(v1 + 56), *(void (**)(id, void))(v1 + 64));
}

uint64_t sub_100004948()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100004980()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_1000049C0(unint64_t a1)
{
  return sub_100003E9C(a1, *(void *)(v1 + 16), *(void (**)(uint64_t))(v1 + 24), *(void *)(v1 + 32));
}

char *sub_1000049CC(char *result, int64_t a2, char a3, char *a4)
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
      sub_1000052C0(&qword_10000C740);
      uint64_t v10 = (char *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * (v12 >> 4);
      uint64_t v13 = v10 + 32;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
      uint64_t v13 = (char *)&_swiftEmptyArrayStorage + 32;
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[16 * v8 + 32]) {
          memmove(v13, a4 + 32, 16 * v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_100005640(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_100004ADC(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100004BB0(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100005308((uint64_t)v12, *a3);
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
      sub_100005308((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_1000064C4((uint64_t)v12);
  return v7;
}

uint64_t sub_100004BB0(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_100006BB8();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_100004D6C(a5, a6);
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
  uint64_t v8 = sub_100006BF8();
  if (!v8)
  {
    sub_100006C58();
    __break(1u);
LABEL_17:
    uint64_t result = sub_100006C88();
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

uint64_t sub_100004D6C(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100004E04(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100004FE4(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100004FE4(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100004E04(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_100004F7C(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_100006BC8();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_100006C58();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_100006B18();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_100006C88();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_100006C58();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_100004F7C(uint64_t a1, uint64_t a2)
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
  sub_1000052C0(&qword_10000C748);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_100004FE4(char a1, int64_t a2, char a3, char *a4)
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
    sub_1000052C0(&qword_10000C748);
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
  uint64_t result = sub_100006C88();
  __break(1u);
  return result;
}

uint64_t sub_100005134(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_100005154(a1, a2, a3, *v3);
  *unint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_100005154(char a1, int64_t a2, char a3, char *a4)
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
    sub_1000052C0(&qword_10000C740);
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
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
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
  uint64_t result = sub_100006C88();
  __break(1u);
  return result;
}

uint64_t sub_1000052C0(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100005308(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

char *sub_100005364(uint64_t a1)
{
  return sub_1000049CC(0, *(void *)(a1 + 16), 0, (char *)a1);
}

id sub_100005378(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = sub_1000069F8();
  v18[3] = v8;
  v18[4] = (uint64_t)&protocol witness table for ContactFormatter;
  uint64_t v9 = sub_1000063FC(v18);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 32))(v9, a3, v8);
  v17[3] = sub_100006A18();
  v17[4] = &protocol witness table for VerticalTextHelper;
  v17[0] = a4;
  v16[3] = sub_1000069B8();
  v16[4] = &protocol witness table for ContactFetcher;
  v16[0] = a1;
  v15[3] = sub_100006AC8();
  v15[4] = &protocol witness table for WidgetCenter;
  v15[0] = a2;
  uint64_t v10 = (objc_class *)type metadata accessor for IntentHandler();
  int64_t v11 = (char *)objc_allocWithZone(v10);
  *(void *)&v11[OBJC_IVAR____TtC16SelectPerson_iOS13IntentHandler_allContacts] = &_swiftEmptyArrayStorage;
  sub_100006460((uint64_t)v16, (uint64_t)&v11[OBJC_IVAR____TtC16SelectPerson_iOS13IntentHandler_contactFetcher]);
  sub_100006460((uint64_t)v15, (uint64_t)&v11[OBJC_IVAR____TtC16SelectPerson_iOS13IntentHandler_widgetCenter]);
  sub_100006460((uint64_t)v18, (uint64_t)&v11[OBJC_IVAR____TtC16SelectPerson_iOS13IntentHandler_contactFormatter]);
  sub_100006460((uint64_t)v17, (uint64_t)&v11[OBJC_IVAR____TtC16SelectPerson_iOS13IntentHandler_verticalTextHelper]);
  v14.receiver = v11;
  v14.super_class = v10;
  [super init];
  sub_1000064C4((uint64_t)v17);
  sub_1000064C4((uint64_t)v18);
  sub_1000064C4((uint64_t)v15);
  sub_1000064C4((uint64_t)v16);
  return v12;
}

void *sub_100005504(unint64_t a1)
{
  if (a1 >> 62) {
    goto LABEL_14;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    uint64_t result = &_swiftEmptyArrayStorage;
    if (!v2) {
      break;
    }
    uint64_t result = (void *)sub_100006C28();
    if (v2 < 0)
    {
      __break(1u);
      return result;
    }
    uint64_t v4 = 0;
    while (v2 != v4)
    {
      if ((a1 & 0xC000000000000001) != 0) {
        id v5 = (id)sub_100006BE8();
      }
      else {
        id v5 = *(id *)(a1 + 8 * v4 + 32);
      }
      unint64_t v6 = v5;
      ++v4;
      sub_100004420(v5);

      sub_100006C08();
      sub_100006C38();
      sub_100006C48();
      sub_100006C18();
      if (v2 == v4) {
        return &_swiftEmptyArrayStorage;
      }
    }
    __break(1u);
LABEL_14:
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_100006C68();
    swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_100005640(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      return v6;
    }
  }
  uint64_t result = sub_100006C88();
  __break(1u);
  return result;
}

uint64_t sub_100005734(uint64_t result, unint64_t a2)
{
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    unint64_t v2 = a2;
    uint64_t v3 = result;
    unint64_t v4 = a2 >> 62;
    if (!(a2 >> 62))
    {
      uint64_t v5 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
      goto LABEL_4;
    }
  }
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_100006C68();
  uint64_t result = swift_bridgeObjectRelease();
LABEL_4:
  if (v5 >= v3) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v5;
  }
  if (v5 < 0) {
    uint64_t v6 = v3;
  }
  if (v3) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  if (v4)
  {
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_100006C68();
    uint64_t result = swift_bridgeObjectRelease();
    if (v9 < 0)
    {
LABEL_28:
      __break(1u);
      return result;
    }
    swift_bridgeObjectRetain();
    uint64_t v8 = sub_100006C68();
    uint64_t result = swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v8 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (v8 < v7)
  {
    __break(1u);
    goto LABEL_28;
  }
  if ((v2 & 0xC000000000000001) != 0 && v7)
  {
    sub_100005B70();
    Swift::Int v10 = 0;
    do
    {
      Swift::Int v11 = v10 + 1;
      sub_100006BD8(v10);
      Swift::Int v10 = v11;
    }
    while (v7 != v11);
  }
  if (v4)
  {
    swift_bridgeObjectRetain();
    uint64_t v12 = sub_100006C78();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v12 = v2 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain();
  }
  return v12;
}

void sub_1000058C8(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t *a5)
{
  int64_t v5 = a4 >> 1;
  if (a4 >> 1 == a3) {
    return;
  }
  uint64_t v6 = a3;
  uint64_t v29 = a1;
  swift_unknownObjectRetain();
  uint64_t v30 = v5;
  while (1)
  {
    if (v6 >= v5) {
      goto LABEL_30;
    }
    uint64_t v8 = *(void **)(a2 + 8 * v6);
    uint64_t v9 = *a5;
    uint64_t v33 = v6;
    if ((unint64_t)*a5 >> 62) {
      break;
    }
    uint64_t v10 = *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain_n();
    id v11 = v8;
    if (v10) {
      goto LABEL_9;
    }
LABEL_21:
    swift_bridgeObjectRelease_n();
    sub_100004420(v8);

    sub_100006B28();
    if (*(void *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_100006B68();
    }
    sub_100006B88();
    sub_100006B58();
    uint64_t v7 = v33;
    int64_t v5 = v30;
LABEL_5:
    uint64_t v6 = v7 + 1;
    if (v6 == v5)
    {
      swift_unknownObjectRelease();
      return;
    }
  }
  swift_bridgeObjectRetain_n();
  id v28 = v8;
  uint64_t v10 = sub_100006C68();
  if (!v10) {
    goto LABEL_21;
  }
LABEL_9:
  uint64_t v34 = v9;
  unint64_t v35 = v9 & 0xC000000000000001;
  uint64_t v12 = 4;
  while (1)
  {
    uint64_t v13 = v12 - 4;
    if (!v35) {
      break;
    }
    id v14 = (id)sub_100006BE8();
    uint64_t v15 = v12 - 3;
    if (__OFADD__(v13, 1)) {
      goto LABEL_29;
    }
LABEL_15:
    uint64_t v36 = v15;
    CNContact v16 = v14;
    id v17 = [v14 identifier:v29];
    uint64_t v18 = sub_100006AE8();
    uint64_t v20 = v19;

    NSString v21 = v8;
    id v22 = [v8 identifier];
    uint64_t v23 = sub_100006AE8();
    uint64_t v25 = v24;

    if (v18 == v23 && v20 == v25)
    {
      swift_bridgeObjectRelease_n();

LABEL_4:
      uint64_t v7 = v33;
      int64_t v5 = v30;
      swift_bridgeObjectRelease_n();

      goto LABEL_5;
    }
    char v27 = sub_100006C98();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v27) {
      goto LABEL_4;
    }
    ++v12;
    uint64_t v8 = v21;
    uint64_t v9 = v34;
    if (v36 == v10) {
      goto LABEL_21;
    }
  }
  id v14 = *(id *)(v9 + 8 * v12);
  uint64_t v15 = v12 - 3;
  if (!__OFADD__(v13, 1)) {
    goto LABEL_15;
  }
LABEL_29:
  __break(1u);
LABEL_30:
  __break(1u);
}

unint64_t sub_100005B70()
{
  unint64_t result = qword_10000C760;
  if (!qword_10000C760)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10000C760);
  }
  return result;
}

unint64_t sub_100005BB0()
{
  uint64_t v1 = v0;
  uint64_t v47 = sub_100006918();
  uint64_t v46 = *(void *)(v47 - 8);
  __chkstk_darwin(v47);
  uint64_t v48 = (char *)&v46 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = &v0[OBJC_IVAR____TtC16SelectPerson_iOS13IntentHandler_contactFetcher];
  sub_100004860(&v0[OBJC_IVAR____TtC16SelectPerson_iOS13IntentHandler_contactFetcher], *(void *)&v0[OBJC_IVAR____TtC16SelectPerson_iOS13IntentHandler_contactFetcher + 24]);
  sub_100006988();
  unint64_t v4 = sub_100006A58();
  uint64_t v5 = v1;
  unint64_t v6 = (unint64_t)sub_100005504(v4);
  swift_bridgeObjectRelease();

  unint64_t v60 = v6;
  if (v6 >> 62) {
    goto LABEL_66;
  }
  uint64_t v7 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
LABEL_3:
  if (v7 < sub_100006988())
  {
    sub_100004860(v3, *((void *)v3 + 3));
    unint64_t v8 = sub_100006A48();
    id v9 = (id)v5;
    unint64_t v10 = (unint64_t)sub_100005504(v8);
    swift_bridgeObjectRelease();

    if (v10 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v3 = (char *)sub_100006C68();
      swift_bridgeObjectRelease();
      if (v3)
      {
LABEL_6:
        unint64_t v6 = 0;
        unint64_t v52 = v10;
        unint64_t v53 = v10 & 0xC000000000000001;
        uint64_t v49 = (char *)(v10 + 32);
        uint64_t v50 = v10 & 0xFFFFFFFFFFFFFF8;
        id v11 = &OBJC_PROTOCOL___SelectPeopleIntentHandling;
        unint64_t v51 = v3;
        while (1)
        {
          if (v53)
          {
            id v12 = (id)sub_100006BE8();
          }
          else
          {
            if (v6 >= *(void *)(v50 + 16)) {
              goto LABEL_65;
            }
            id v12 = *(id *)&v49[8 * v6];
          }
          id v57 = v12;
          if (__OFADD__(v6++, 1)) {
            goto LABEL_64;
          }
          unint64_t v14 = v60;
          if (!(v60 >> 62))
          {
            uint64_t v15 = *(void *)((v60 & 0xFFFFFFFFFFFFFF8) + 0x10);
            swift_bridgeObjectRetain_n();
            if (v15) {
              break;
            }
            goto LABEL_40;
          }
          swift_bridgeObjectRetain_n();
          uint64_t v15 = sub_100006C68();
          if (v15) {
            break;
          }
LABEL_40:
          swift_bridgeObjectRelease_n();
LABEL_41:
          if (v14 >> 62)
          {
            swift_bridgeObjectRetain();
            uint64_t v31 = sub_100006C68();
            swift_bridgeObjectRelease();
          }
          else
          {
            uint64_t v31 = *(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10);
          }
          if (v31 < sub_100006988())
          {
            id v32 = v57;
            sub_100006B28();
            if (*(void *)((v60 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v60 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
              sub_100006B68();
            }
            sub_100006B88();
            sub_100006B58();
          }
LABEL_9:

          if ((char *)v6 == v3)
          {
            swift_bridgeObjectRelease();
            unint64_t v6 = v60;
            goto LABEL_49;
          }
        }
        unint64_t v54 = v6;
        unint64_t v55 = v14;
        unint64_t v56 = v14 & 0xC000000000000001;
        uint64_t v5 = 4;
        while (1)
        {
          if (v56) {
            id v17 = (id)sub_100006BE8();
          }
          else {
            id v17 = *(id *)(v14 + 8 * v5);
          }
          uint64_t v18 = v17;
          unint64_t v6 = v5 - 3;
          if (__OFADD__(v5 - 4, 1))
          {
            __break(1u);
LABEL_64:
            __break(1u);
LABEL_65:
            __break(1u);
LABEL_66:
            swift_bridgeObjectRetain();
            uint64_t v7 = sub_100006C68();
            swift_bridgeObjectRelease();
            goto LABEL_3;
          }
          unint64_t v19 = v15;
          id v20 = [v17 v11[16].inst_props];
          if (v20)
          {
            NSString v21 = v20;
            uint64_t v22 = sub_100006AE8();
            uint64_t v24 = v23;
          }
          else
          {
            uint64_t v22 = 0;
            uint64_t v24 = 0;
          }
          uint64_t v25 = v11;
          uint64_t v26 = (char *)[v57 v11[16].inst_props:v46];
          if (v26)
          {
            uint64_t v3 = v26;
            uint64_t v27 = sub_100006AE8();
            uint64_t v29 = v28;

            if (v24)
            {
              if (v29)
              {
                if (v22 == v27 && v24 == v29)
                {
                  swift_bridgeObjectRelease_n();

                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  goto LABEL_8;
                }
                char v30 = sub_100006C98();

                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                if (v30)
                {
                  swift_bridgeObjectRelease_n();
                  goto LABEL_8;
                }
                goto LABEL_20;
              }
            }
            else if (!v29)
            {
LABEL_7:
              swift_bridgeObjectRelease_n();

LABEL_8:
              uint64_t v3 = v51;
              unint64_t v6 = v54;
              id v11 = v25;
              goto LABEL_9;
            }
          }
          else if (!v24)
          {
            goto LABEL_7;
          }

          swift_bridgeObjectRelease();
LABEL_20:
          ++v5;
          uint64_t v15 = v19;
          BOOL v16 = v6 == v19;
          id v11 = v25;
          unint64_t v14 = v55;
          if (v16)
          {
            swift_bridgeObjectRelease_n();
            unint64_t v14 = v60;
            uint64_t v3 = v51;
            unint64_t v6 = v54;
            goto LABEL_41;
          }
        }
      }
    }
    else
    {
      uint64_t v3 = *(char **)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (v3) {
        goto LABEL_6;
      }
    }
    swift_bridgeObjectRelease();
    if (v6 >> 62) {
      goto LABEL_69;
    }
LABEL_50:
    uint64_t v33 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
    goto LABEL_51;
  }
LABEL_49:
  if (!(v6 >> 62)) {
    goto LABEL_50;
  }
LABEL_69:
  swift_bridgeObjectRetain();
  uint64_t v33 = sub_100006C68();
  swift_bridgeObjectRelease();
LABEL_51:
  if (v33 < sub_100006988())
  {
    sub_100006998();
    ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata();
    do
    {
      sub_100006968();
      sub_100006AF8();
      swift_bridgeObjectRelease();
      id v35 = objc_allocWithZone(ObjCClassFromMetadata);
      NSString v36 = sub_100006AD8();
      swift_bridgeObjectRelease();
      [v35 initWithIdentifier:0 displayString:v36];

      sub_100006B28();
      if (*(void *)((v60 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v60 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_100006B68();
      }
      sub_100006B88();
      sub_100006B58();
      if (v60 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v37 = sub_100006C68();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v37 = *(void *)((v60 & 0xFFFFFFFFFFFFFF8) + 0x10);
      }
    }
    while (v37 < sub_100006988());
  }
  uint64_t v38 = v48;
  sub_100006938();
  unint64_t v39 = sub_100006908();
  os_log_type_t v40 = sub_100006B98();
  if (os_log_type_enabled(v39, v40))
  {
    uint64_t v41 = (uint8_t *)swift_slowAlloc();
    v59[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v41 = 136315138;
    swift_beginAccess();
    sub_100006998();
    swift_bridgeObjectRetain();
    uint64_t v42 = sub_100006B78();
    unint64_t v44 = v43;
    swift_bridgeObjectRelease();
    uint64_t v58 = sub_100004ADC(v42, v44, v59);
    sub_100006BA8();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v39, v40, "Default contacts for widget: %s", v41, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v46 + 8))(v38, v47);
  swift_beginAccess();
  return v60;
}

uint64_t sub_1000063BC()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

void sub_1000063F4(uint64_t a1, uint64_t a2)
{
  sub_100003DA4(a1, a2, *(void *)(v2 + 16));
}

uint64_t *sub_1000063FC(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_100006460(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1000064C4(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t WidgetCenter.getCurrentWidgetConfigurations(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = _swiftEmptyArrayStorage;
  uint64_t v5 = (void *)swift_allocObject();
  v5[2] = v4;
  v5[3] = a1;
  v5[4] = a2;
  swift_retain();
  swift_retain();
  sub_100006AA8();
  swift_release();

  return swift_release();
}

uint64_t sub_1000065D8()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100006610(uint64_t a1, char a2, uint64_t a3, void (*a4)(uint64_t))
{
  if (a2)
  {
    sub_1000052C0(&qword_10000C7C8);
    return swift_willThrowTypedImpl();
  }
  else
  {
    unint64_t v6 = (void *)(a3 + 16);
    uint64_t v7 = *(void *)(a1 + 16);
    if (v7)
    {
      uint64_t v8 = *(void *)(sub_100006A98() - 8);
      unint64_t v9 = a1 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
      uint64_t v10 = *(void *)(v8 + 72);
      swift_bridgeObjectRetain();
      do
      {
        uint64_t v11 = sub_100006A88();
        if (v11)
        {
          id v12 = (void *)v11;
          swift_beginAccess();
          id v13 = v12;
          sub_100006B28();
          if (*(void *)((*v6 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v6 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
            sub_100006B68();
          }
          sub_100006B88();
          sub_100006B58();
          swift_endAccess();
        }
        v9 += v10;
        --v7;
      }
      while (v7);
      sub_1000068E8(a1, 0);
    }
    swift_beginAccess();
    uint64_t v15 = swift_bridgeObjectRetain();
    a4(v15);
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_1000067D0(uint64_t a1, char a2)
{
  return sub_100006610(a1, a2 & 1, *(void *)(v2 + 16), *(void (**)(uint64_t))(v2 + 24));
}

uint64_t sub_1000067E0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = _swiftEmptyArrayStorage;
  uint64_t v5 = (void *)swift_allocObject();
  v5[2] = v4;
  v5[3] = a1;
  v5[4] = a2;
  swift_retain();
  swift_retain();
  sub_100006AA8();
  swift_release();

  return swift_release();
}

uint64_t sub_1000068A8()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_1000068E8(uint64_t a1, char a2)
{
  if (a2) {
    return _swift_errorRelease();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_1000068F8()
{
  return _convertErrorToNSError(_:)();
}

uint64_t sub_100006908()
{
  return Logger.logObject.getter();
}

uint64_t sub_100006918()
{
  return type metadata accessor for Logger();
}

uint64_t sub_100006928()
{
  return type metadata accessor for SelectPeopleIntent();
}

uint64_t sub_100006938()
{
  return static PeopleLogger.extension.getter();
}

uint64_t sub_100006948()
{
  return static PeopleConstants.noneOptionMaxCount.getter();
}

uint64_t sub_100006958()
{
  return static PeopleConstants.maxContactSuggestions.getter();
}

uint64_t sub_100006968()
{
  return static PeopleConstants.noneOptionDisplayString.getter();
}

uint64_t sub_100006978()
{
  return static PeopleConstants.maxDisplayedWidgetContacts.getter();
}

uint64_t sub_100006988()
{
  return static PeopleConstants.maxContactsInMultipleWidget.getter();
}

uint64_t sub_100006998()
{
  return type metadata accessor for PersonType();
}

uint64_t sub_1000069A8()
{
  return static ContactFetcher.shared.getter();
}

uint64_t sub_1000069B8()
{
  return type metadata accessor for ContactFetcher();
}

uint64_t sub_1000069C8(CNContact a1)
{
  return ContactFormatter.displayName(for:)(a1)._countAndFlagsBits;
}

uint64_t sub_1000069D8()
{
  return type metadata accessor for ContactFormatter.Style();
}

uint64_t sub_1000069E8()
{
  return ContactFormatter.init(style:fallback:)();
}

uint64_t sub_1000069F8()
{
  return type metadata accessor for ContactFormatter();
}

uint64_t sub_100006A08()
{
  return static VerticalTextHelper.shared.getter();
}

uint64_t sub_100006A18()
{
  return type metadata accessor for VerticalTextHelper();
}

uint64_t sub_100006A28()
{
  return static SimpleContactFilter.phraseMatching(for:with:)();
}

uint64_t sub_100006A38()
{
  return dispatch thunk of ContactFetcherProtocol.allContacts(limit:)();
}

uint64_t sub_100006A48()
{
  return dispatch thunk of ContactFetcherProtocol.preferredContacts()();
}

uint64_t sub_100006A58()
{
  return dispatch thunk of ContactFetcherProtocol.recommendedContacts(maxSuggestions:excludeContactIdentifiers:)();
}

uint64_t sub_100006A68()
{
  return dispatch thunk of ContactFormatterProtocol.displayName(for:)();
}

uint64_t sub_100006A78()
{
  return dispatch thunk of VerticalTextHelperProtocol.makeIdentifier(for:)();
}

uint64_t sub_100006A88()
{
  return WidgetInfo.configuration.getter();
}

uint64_t sub_100006A98()
{
  return type metadata accessor for WidgetInfo();
}

uint64_t sub_100006AA8()
{
  return dispatch thunk of WidgetCenter.getCurrentConfigurations(_:)();
}

uint64_t sub_100006AB8()
{
  return static WidgetCenter.shared.getter();
}

uint64_t sub_100006AC8()
{
  return type metadata accessor for WidgetCenter();
}

NSString sub_100006AD8()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_100006AE8()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100006AF8()
{
  return String.localized.getter();
}

void sub_100006B08(Swift::String a1)
{
}

Swift::Int sub_100006B18()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_100006B28()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray sub_100006B38()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_100006B48()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100006B58()
{
  return specialized Array._endMutation()();
}

uint64_t sub_100006B68()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_100006B78()
{
  return Array.debugDescription.getter();
}

uint64_t sub_100006B88()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_100006B98()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_100006BA8()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_100006BB8()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_100006BC8()
{
  return _StringGuts.copyUTF8(into:)();
}

void sub_100006BD8(Swift::Int a1)
{
}

uint64_t sub_100006BE8()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_100006BF8()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_100006C08()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_100006C18()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t sub_100006C28()
{
  return specialized ContiguousArray.reserveCapacity(_:)();
}

uint64_t sub_100006C38()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t sub_100006C48()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_100006C58()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100006C68()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_100006C78()
{
  return _CocoaArrayWrapper.subscript.getter();
}

uint64_t sub_100006C88()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_100006C98()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
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
  return [super a2];
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
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

uint64_t swift_deallocPartialClassInstance()
{
  return _swift_deallocPartialClassInstance();
}

uint64_t swift_dynamicCastClass()
{
  return _swift_dynamicCastClass();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
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

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_willThrowTypedImpl()
{
  return _swift_willThrowTypedImpl();
}