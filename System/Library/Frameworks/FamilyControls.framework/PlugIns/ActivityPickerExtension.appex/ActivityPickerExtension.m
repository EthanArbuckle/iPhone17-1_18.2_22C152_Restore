uint64_t sub_100001B80()
{
  type metadata accessor for ActivityItem();
  return sub_100031BE8();
}

uint64_t sub_100001BC4()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100031C28();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_100001C38@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 112))();
  *a2 = result;
  return result;
}

uint64_t sub_100001C84(uint64_t a1, uint64_t a2)
{
  v2 = *(uint64_t (**)(uint64_t))(**(void **)a2 + 120);
  uint64_t v3 = swift_retain();
  return v2(v3);
}

uint64_t sub_100001CD8()
{
  return sub_100031C38();
}

uint64_t (*sub_100001D48(void *a1))()
{
  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_100031C18();
  return sub_100001DD4;
}

uint64_t sub_100001DD8()
{
  return sub_1000025E8((uint64_t)&OBJC_IVAR____TtC23ActivityPickerExtension13ActivityGroup__category, &qword_100040DD8);
}

uint64_t sub_100001DEC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100001E30(uint64_t a1)
{
  return sub_10000266C(a1, &qword_100040DE0, (uint64_t)&OBJC_IVAR____TtC23ActivityPickerExtension13ActivityGroup__category, &qword_100040DD8);
}

uint64_t (*sub_100001E4C(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = sub_100001DEC(&qword_100040DE0);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC23ActivityPickerExtension13ActivityGroup__category;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = sub_100001DEC(&qword_100040DD8);
  sub_100031BF8();
  swift_endAccess();
  return sub_100001F5C;
}

uint64_t sub_100001F60()
{
  return sub_100031BE8();
}

uint64_t sub_100001FA8()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100031C28();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_10000201C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 160))();
  *a2 = result;
  return result;
}

uint64_t sub_100002068(uint64_t a1, uint64_t a2)
{
  v2 = *(uint64_t (**)(uint64_t))(**(void **)a2 + 168);
  uint64_t v3 = swift_bridgeObjectRetain();
  return v2(v3);
}

uint64_t sub_1000020BC()
{
  return sub_100031C38();
}

uint64_t (*sub_10000212C(void *a1))()
{
  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_100031C18();
  return sub_100001DD4;
}

uint64_t sub_1000021B8()
{
  return sub_1000025E8((uint64_t)&OBJC_IVAR____TtC23ActivityPickerExtension13ActivityGroup__items, &qword_100040DF0);
}

uint64_t sub_1000021CC(uint64_t a1)
{
  return sub_10000266C(a1, &qword_100040DF8, (uint64_t)&OBJC_IVAR____TtC23ActivityPickerExtension13ActivityGroup__items, &qword_100040DF0);
}

uint64_t (*sub_1000021E8(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = sub_100001DEC(&qword_100040DF8);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC23ActivityPickerExtension13ActivityGroup__items;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = sub_100001DEC(&qword_100040DF0);
  sub_100031BF8();
  swift_endAccess();
  return sub_100001F5C;
}

uint64_t sub_1000022F8()
{
  return sub_100031BE8();
}

uint64_t sub_100002330()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100031C28();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_1000023A8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 208))();
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t sub_1000023FC(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void))(**(void **)a2 + 216))(*(void *)a1, *(unsigned __int8 *)(a1 + 8));
}

uint64_t sub_100002450()
{
  return sub_100031C38();
}

uint64_t (*sub_1000024D4(void *a1))()
{
  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_100031C18();
  return sub_100001DD4;
}

void sub_100002560(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 48))(*a1, 0);
  swift_release();
  swift_release();

  free(v1);
}

uint64_t sub_1000025C8()
{
  return 0;
}

uint64_t sub_1000025D4()
{
  return sub_1000025E8((uint64_t)&OBJC_IVAR____TtC23ActivityPickerExtension13ActivityGroup__selectionIndication, &qword_100040E00);
}

uint64_t sub_1000025E8(uint64_t a1, uint64_t *a2)
{
  return swift_endAccess();
}

uint64_t sub_100002650(uint64_t a1)
{
  return sub_10000266C(a1, &qword_100040E08, (uint64_t)&OBJC_IVAR____TtC23ActivityPickerExtension13ActivityGroup__selectionIndication, &qword_100040E00);
}

uint64_t sub_10000266C(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v6 = sub_100001DEC(a2);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v10 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  swift_beginAccess();
  sub_100001DEC(a4);
  sub_100031C08();
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
}

uint64_t (*sub_10000279C(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = sub_100001DEC(&qword_100040E08);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC23ActivityPickerExtension13ActivityGroup__selectionIndication;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = sub_100001DEC(&qword_100040E00);
  sub_100031BF8();
  swift_endAccess();
  return sub_100001F5C;
}

void sub_1000028AC(uint64_t a1, char a2)
{
  uint64_t v3 = *(void **)a1;
  uint64_t v4 = *(void (**)(void, void, void))(*(void *)(*(void *)a1 + 88) + 16);
  v4(*(void *)(*(void *)a1 + 104), v3[14], v3[10]);
  uint64_t v5 = (void *)v3[14];
  size_t v6 = (void *)v3[12];
  uint64_t v7 = (void *)v3[13];
  uint64_t v8 = v3[10];
  uint64_t v9 = v3[11];
  if (a2)
  {
    v4(v3[12], v3[13], v3[10]);
    swift_beginAccess();
    sub_100031C08();
    swift_endAccess();
    uint64_t v10 = *(void (**)(void *, uint64_t))(v9 + 8);
    v10(v7, v8);
    v10(v5, v8);
  }
  else
  {
    swift_beginAccess();
    sub_100031C08();
    swift_endAccess();
    (*(void (**)(void *, uint64_t))(v9 + 8))(v5, v8);
  }
  free(v5);
  free(v7);
  free(v6);

  free(v3);
}

uint64_t sub_100002A1C()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC23ActivityPickerExtension13ActivityGroup_includeEntireCategory);
}

uint64_t sub_100002A2C(uint64_t a1, unint64_t a2, unint64_t a3, char a4)
{
  uint64_t v8 = swift_allocObject();
  sub_100002A94(a1, a2, a3, a4);
  return v8;
}

uint64_t sub_100002A94(uint64_t a1, unint64_t a2, unint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = sub_100001DEC(&qword_100040E00);
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  v13 = (char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = v5 + OBJC_IVAR____TtC23ActivityPickerExtension13ActivityGroup__selectionIndication;
  uint64_t v23 = 0;
  char v24 = 1;
  sub_100031BE8();
  (*(void (**)(uint64_t, char *, uint64_t))(v11 + 32))(v14, v13, v10);
  type metadata accessor for ActivityItem();
  uint64_t v15 = sub_1000087A4(1, a1, a2);
  swift_beginAccess();
  uint64_t v22 = v15;
  sub_100031BE8();
  swift_endAccess();
  unint64_t v16 = (unint64_t)sub_1000065DC(a3);
  swift_bridgeObjectRelease();
  if ((v16 & 0x8000000000000000) != 0 || (v16 & 0x4000000000000000) != 0)
  {
    unint64_t v20 = swift_bridgeObjectRetain();
    uint64_t v17 = (uint64_t)sub_10000462C(v20);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v17 = v16 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain();
  }
  uint64_t v23 = v17;
  sub_100004724(&v23);
  swift_bridgeObjectRelease();
  uint64_t v18 = v23;
  swift_beginAccess();
  uint64_t v22 = v18;
  sub_100001DEC(&qword_100040DE8);
  sub_100031BE8();
  swift_endAccess();
  *(unsigned char *)(v5 + OBJC_IVAR____TtC23ActivityPickerExtension13ActivityGroup_includeEntireCategory) = a4 & 1;
  return v5;
}

uint64_t sub_100002CDC()
{
  uint64_t v1 = (*(uint64_t (**)(void))(*(void *)v0 + 112))();
  char v2 = (*(uint64_t (**)(uint64_t))(*(void *)v1 + 232))(v1);
  swift_release();
  return v2 & 1;
}

void *sub_100002D54()
{
  uint64_t v15 = &_swiftEmptySetSingleton;
  v14[0] = &_swiftEmptySetSingleton;
  v14[1] = &_swiftEmptySetSingleton;
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)v0 + 112);
  uint64_t v2 = *(void *)v1();
  char v3 = (*(uint64_t (**)(void))(v2 + 328))();
  uint64_t v4 = swift_release();
  if ((v3 & 1) == 0) {
    goto LABEL_4;
  }
  uint64_t v5 = ((uint64_t (*)(uint64_t))v1)(v4);
  char v6 = (*(uint64_t (**)(uint64_t))(*(void *)v5 + 232))(v5);
  uint64_t v7 = swift_release();
  if (v6)
  {
    uint64_t v8 = ((uint64_t (*)(uint64_t))v1)(v7);
    Swift::Int v9 = *(void *)(v8 + 24);
    Swift::Int v10 = *(void *)(v8 + 32);
    swift_bridgeObjectRetain();
    swift_release();
    sub_1000057FC(&v13, v9, v10);
    swift_bridgeObjectRelease();
    if (*(unsigned char *)(v0 + OBJC_IVAR____TtC23ActivityPickerExtension13ActivityGroup_includeEntireCategory) == 1) {
LABEL_4:
    }
      sub_100002EF8(v0, (uint64_t)&v15, (uint64_t)v14);
  }
  swift_beginAccess();
  uint64_t v11 = v15;
  swift_beginAccess();
  return v11;
}

unint64_t sub_100002EF8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v29 = sub_100031BB8();
  uint64_t v6 = *(void *)(v29 - 8);
  uint64_t v7 = __chkstk_darwin(v29);
  Swift::Int v9 = (char *)v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 160))(v7);
  unint64_t v12 = result;
  if (!(result >> 62))
  {
    uint64_t v13 = *(void *)((result & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v13) {
      goto LABEL_3;
    }
LABEL_20:
    return swift_bridgeObjectRelease();
  }
  unint64_t result = sub_1000329A8();
  uint64_t v13 = result;
  if (!result) {
    goto LABEL_20;
  }
LABEL_3:
  if (v13 >= 1)
  {
    uint64_t v14 = 0;
    unint64_t v15 = v12 & 0xC000000000000001;
    v27 = (void (**)(char *, uint64_t))(v6 + 8);
    *(void *)&long long v11 = 136446210;
    long long v24 = v11;
    v23[1] = (char *)&type metadata for Any + 8;
    uint64_t v25 = a2;
    uint64_t v26 = a3;
    uint64_t v28 = v13;
    unint64_t v30 = v12;
    do
    {
      if (v15)
      {
        uint64_t v16 = sub_100032908();
      }
      else
      {
        uint64_t v16 = *(void *)(v12 + 8 * v14 + 32);
        swift_retain();
      }
      if ((*(uint64_t (**)(void))(*(void *)v16 + 328))())
      {
        uint64_t v17 = *(void *)(v16 + 24);
        unint64_t v18 = *(void *)(v16 + 32);
        if (*(unsigned char *)(v16 + 16) && *(unsigned char *)(v16 + 16) == 1)
        {
          swift_bridgeObjectRetain();
          sub_100031B98();
          swift_bridgeObjectRetain();
          v19 = sub_100031BA8();
          unint64_t v20 = v9;
          os_log_type_t v21 = sub_1000327D8();
          if (os_log_type_enabled(v19, v21))
          {
            uint64_t v22 = swift_slowAlloc();
            v31[0] = swift_slowAlloc();
            *(_DWORD *)uint64_t v22 = v24;
            swift_bridgeObjectRetain();
            *(void *)(v22 + 4) = sub_100003FD4(v17, v18, v31);
            swift_bridgeObjectRelease_n();
            _os_log_impl((void *)&_mh_execute_header, v19, v21, "Unexpected category identifier %{public}s selected", (uint8_t *)v22, 0xCu);
            swift_arrayDestroy();
            swift_slowDealloc();
            swift_slowDealloc();
            swift_release();
          }
          else
          {

            swift_bridgeObjectRelease_n();
            swift_release();
          }
          (*v27)(v20, v29);
          Swift::Int v9 = v20;
          uint64_t v13 = v28;
          unint64_t v12 = v30;
        }
        else
        {
          swift_beginAccess();
          swift_bridgeObjectRetain();
          sub_1000057FC(&v32, v17, v18);
          swift_endAccess();
          swift_release();
          swift_bridgeObjectRelease();
          unint64_t v12 = v30;
        }
      }
      else
      {
        swift_release();
      }
      ++v14;
    }
    while (v13 != v14);
    return swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

uint64_t sub_1000032E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = *(uint64_t (**)(void))(*(void *)v3 + 112);
  uint64_t v9 = v8();
  uint64_t v10 = *(void *)(v9 + 24);
  uint64_t v11 = *(void *)(v9 + 32);
  swift_bridgeObjectRetain();
  swift_release();
  char v12 = sub_100003948(v10, v11, a2);
  uint64_t v13 = swift_bridgeObjectRelease();
  if ((v12 & 1) == 0)
  {
    uint64_t v40 = a2;
    v45 = *(uint64_t (**)(uint64_t))(*(void *)v4 + 160);
    unint64_t v23 = v45(v13);
    uint64_t v8 = v4;
    if (v23 >> 62) {
      goto LABEL_56;
    }
    uint64_t v24 = *(void *)((v23 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRelease();
    goto LABEL_15;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v14 = swift_bridgeObjectRelease();
  uint64_t v15 = *(void *)((uint64_t (*)(uint64_t))v8)(v14);
  (*(void (**)(uint64_t))(v15 + 336))(1);
  uint64_t v16 = swift_release();
  a3 = *(void *)(*(void *)v4 + 160);
  a1 = *(void *)v4 + 160;
  unint64_t v17 = ((uint64_t (*)(uint64_t))a3)(v16);
  if (v17 >> 62) {
    goto LABEL_54;
  }
  uint64_t v18 = *(void *)((v17 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t result = swift_bridgeObjectRelease();
  do
  {
    if (!v18) {
      return result;
    }
    unint64_t v20 = 0;
    while (1)
    {
      uint64_t v21 = ((uint64_t (*)(uint64_t))a3)(result);
      if ((v21 & 0xC000000000000001) == 0) {
        break;
      }
      uint64_t v22 = sub_100032908();
LABEL_10:
      ++v20;
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t))(*(void *)v22 + 336))(1);
      uint64_t result = swift_release();
      if (v18 == v20) {
        return result;
      }
    }
    if ((v20 & 0x8000000000000000) == 0)
    {
      if (v20 >= *(void *)((v21 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
        goto LABEL_47;
      }
      uint64_t v22 = *(void *)(v21 + 8 * v20 + 32);
      swift_retain();
      goto LABEL_10;
    }
    __break(1u);
LABEL_47:
    __break(1u);
LABEL_48:
    __break(1u);
LABEL_49:
    __break(1u);
LABEL_50:
    __break(1u);
LABEL_51:
    __break(1u);
LABEL_52:
    __break(1u);
LABEL_53:
    __break(1u);
LABEL_54:
    uint64_t v18 = sub_1000329A8();
    uint64_t result = swift_bridgeObjectRelease();
  }
  while ((v18 & 0x8000000000000000) == 0);
  __break(1u);
LABEL_56:
  uint64_t v24 = sub_1000329A8();
  uint64_t result = swift_bridgeObjectRelease();
  if (v24 < 0)
  {
    __break(1u);
    return result;
  }
LABEL_15:
  uint64_t v25 = v40;
  if (v24)
  {
    uint64_t v41 = a3;
    uint64_t v42 = -v24;
    a3 = 4;
    uint64_t v43 = a1;
    v44 = v8;
    while (1)
    {
      unint64_t v26 = a3 - 4;
      uint64_t v27 = v45(v25);
      if ((v27 & 0xC000000000000001) != 0)
      {
        a1 = sub_100032908();
      }
      else
      {
        if ((v26 & 0x8000000000000000) != 0) {
          goto LABEL_48;
        }
        if (v26 >= *(void *)((v27 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
          goto LABEL_49;
        }
        a1 = *(void *)(v27 + 8 * a3);
        swift_retain();
      }
      swift_bridgeObjectRelease();
      uint64_t v29 = *(void *)(a1 + 24);
      uint64_t v28 = *(void *)(a1 + 32);
      sub_10000674C();
      swift_bridgeObjectRetain();
      sub_1000326D8();
      sub_1000326D8();
      if (v48 == v46 && v49 == v47) {
        break;
      }
      char v31 = sub_100032A38();
      swift_bridgeObjectRelease();
      uint64_t v30 = swift_bridgeObjectRelease();
      if (v31) {
        goto LABEL_27;
      }
      sub_1000326D8();
      sub_1000326D8();
      if (v48 == v46 && v49 == v47)
      {
        uint64_t v35 = swift_bridgeObjectRelease_n();
        uint64_t v8 = v44;
      }
      else
      {
        char v36 = sub_100032A38();
        swift_bridgeObjectRelease();
        uint64_t v35 = swift_bridgeObjectRelease();
        uint64_t v8 = v44;
        if ((v36 & 1) == 0)
        {
          swift_release();
          uint64_t v25 = swift_bridgeObjectRelease();
          goto LABEL_18;
        }
      }
      uint64_t v37 = v45(v35);
      if ((v37 & 0xC000000000000001) != 0)
      {
        uint64_t v38 = sub_100032908();
      }
      else
      {
        if ((v26 & 0x8000000000000000) != 0) {
          goto LABEL_52;
        }
        if (v26 >= *(void *)((v37 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
          goto LABEL_53;
        }
        uint64_t v38 = *(void *)(v37 + 8 * a3);
        swift_retain();
      }
      swift_bridgeObjectRelease();
      char v39 = sub_100003948(v29, v28, v41);
      swift_bridgeObjectRelease();
      (*(void (**)(void))(*(void *)v38 + 336))(v39 & 1);
      swift_release();
      uint64_t v25 = swift_release();
LABEL_18:
      ++a3;
      if (v42 + a3 == 4) {
        goto LABEL_44;
      }
    }
    uint64_t v30 = swift_bridgeObjectRelease_n();
LABEL_27:
    uint64_t v8 = v44;
    uint64_t v32 = v45(v30);
    if ((v32 & 0xC000000000000001) != 0)
    {
      uint64_t v33 = sub_100032908();
    }
    else
    {
      if ((v26 & 0x8000000000000000) != 0) {
        goto LABEL_50;
      }
      if (v26 >= *(void *)((v32 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
        goto LABEL_51;
      }
      uint64_t v33 = *(void *)(v32 + 8 * a3);
      swift_retain();
    }
    swift_bridgeObjectRelease();
    char v34 = sub_100003948(v29, v28, v43);
    swift_bridgeObjectRelease();
    (*(void (**)(void))(*(void *)v33 + 336))(v34 & 1);
    swift_release();
    uint64_t v25 = swift_release();
    goto LABEL_18;
  }
LABEL_44:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_100003948(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16))
  {
    sub_100032AB8();
    sub_100032678();
    Swift::Int v6 = sub_100032AC8();
    uint64_t v7 = -1 << *(unsigned char *)(a3 + 32);
    unint64_t v8 = v6 & ~v7;
    uint64_t v9 = a3 + 56;
    if ((*(void *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8))
    {
      uint64_t v10 = *(void *)(a3 + 48);
      uint64_t v11 = (void *)(v10 + 16 * v8);
      BOOL v12 = *v11 == a1 && v11[1] == a2;
      if (v12 || (sub_100032A38() & 1) != 0) {
        return 1;
      }
      uint64_t v14 = ~v7;
      unint64_t v15 = (v8 + 1) & v14;
      if ((*(void *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15))
      {
        while (1)
        {
          uint64_t v16 = (void *)(v10 + 16 * v15);
          BOOL v17 = *v16 == a1 && v16[1] == a2;
          if (v17 || (sub_100032A38() & 1) != 0) {
            break;
          }
          uint64_t result = 0;
          unint64_t v15 = (v15 + 1) & v14;
          if (((*(void *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15) & 1) == 0) {
            return result;
          }
        }
        return 1;
      }
    }
  }
  return 0;
}

uint64_t (*sub_100003A80(void **a1))(uint64_t *a1, char a2)
{
  a1[3] = v1;
  *a1 = sub_100002D54();
  a1[1] = v3;
  a1[2] = v4;
  return sub_100003ACC;
}

uint64_t sub_100003ACC(uint64_t *a1, char a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  uint64_t v4 = a1[2];
  if ((a2 & 1) == 0) {
    return sub_1000032E0(*a1, v2, v4);
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1000032E0(v3, v2, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t sub_100003B68()
{
  (*(void (**)(void))(*(void *)v0 + 112))();
  swift_bridgeObjectRetain();
  swift_release();
  sub_100032678();

  return swift_bridgeObjectRelease();
}

uint64_t sub_100003BF4()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC23ActivityPickerExtension13ActivityGroup__category;
  uint64_t v2 = sub_100001DEC(&qword_100040DD8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = v0 + OBJC_IVAR____TtC23ActivityPickerExtension13ActivityGroup__items;
  uint64_t v4 = sub_100001DEC(&qword_100040DF0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = v0 + OBJC_IVAR____TtC23ActivityPickerExtension13ActivityGroup__selectionIndication;
  uint64_t v6 = sub_100001DEC(&qword_100040E00);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  return v0;
}

uint64_t sub_100003CEC()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC23ActivityPickerExtension13ActivityGroup__category;
  uint64_t v2 = sub_100001DEC(&qword_100040DD8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = v0 + OBJC_IVAR____TtC23ActivityPickerExtension13ActivityGroup__items;
  uint64_t v4 = sub_100001DEC(&qword_100040DF0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = v0 + OBJC_IVAR____TtC23ActivityPickerExtension13ActivityGroup__selectionIndication;
  uint64_t v6 = sub_100001DEC(&qword_100040E00);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  uint64_t v7 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v8 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v7, v8);
}

Swift::Int sub_100003E20()
{
  sub_100032AB8();
  (*(void (**)(unsigned char *))(*(void *)v0 + 296))(v2);
  return sub_100032AC8();
}

uint64_t sub_100003E88()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 304))();
}

uint64_t sub_100003ED4()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 296))();
}

Swift::Int sub_100003F20()
{
  sub_100032AB8();
  (*(void (**)(unsigned char *))(**(void **)v0 + 296))(v2);
  return sub_100032AC8();
}

uint64_t sub_100003F88(uint64_t *a1, uint64_t *a2)
{
  return sub_1000067A0(*a1, *a2);
}

uint64_t sub_100003F94@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for ActivityGroup();
  uint64_t result = sub_100031BD8();
  *a1 = result;
  return result;
}

uint64_t sub_100003FD4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_1000040A8(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100006CBC((uint64_t)v12, *a3);
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
      sub_100006CBC((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100006C6C((uint64_t)v12);
  return v7;
}

uint64_t sub_1000040A8(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_100032868();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_100004264(a5, a6);
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
  uint64_t v8 = sub_100032928();
  if (!v8)
  {
    sub_100032988();
    __break(1u);
LABEL_17:
    uint64_t result = sub_1000329D8();
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

uint64_t sub_100004264(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_1000042FC(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_1000044DC(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_1000044DC(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_1000042FC(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_100004474(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_1000328F8();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_100032988();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_1000326A8();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_1000329D8();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_100032988();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_100004474(uint64_t a1, uint64_t a2)
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
  sub_100001DEC(&qword_100040FB8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1000044DC(char a1, int64_t a2, char a3, char *a4)
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
    sub_100001DEC(&qword_100040FB8);
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
  uint64_t result = sub_1000329D8();
  __break(1u);
  return result;
}

void *sub_10000462C(unint64_t a1)
{
  unint64_t v1 = a1;
  if (a1 >> 62) {
    goto LABEL_10;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
  while (1)
  {
    if (v2 <= 0)
    {
      unint64_t v3 = &_swiftEmptyArrayStorage;
    }
    else
    {
      sub_100001DEC(&qword_100040FC0);
      unint64_t v3 = (void *)swift_allocObject();
      int64_t v4 = j__malloc_size(v3);
      uint64_t v5 = v4 - 32;
      if (v4 < 32) {
        uint64_t v5 = v4 - 25;
      }
      v3[2] = v2;
      v3[3] = (2 * (v5 >> 3)) | 1;
    }
    swift_bridgeObjectRetain();
    sub_10000628C((unint64_t)(v3 + 4), v2, v1);
    unint64_t v1 = v6;
    swift_bridgeObjectRelease();
    if (v1 == v2) {
      break;
    }
    __break(1u);
LABEL_10:
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_1000329A8();
    swift_bridgeObjectRelease();
    if (!v2) {
      return &_swiftEmptyArrayStorage;
    }
  }
  return v3;
}

uint64_t sub_100004724(uint64_t *a1)
{
  uint64_t v2 = *a1;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *a1 = v2;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v2 = sub_1000065C8(v2);
    *a1 = v2;
  }
  uint64_t v4 = *(void *)(v2 + 16);
  v6[0] = v2 + 32;
  v6[1] = v4;
  sub_1000047A0(v6);
  return sub_100032948();
}

Swift::Int sub_1000047A0(uint64_t *a1)
{
  uint64_t v2 = a1;
  Swift::Int v3 = a1[1];
  Swift::Int result = sub_100032A18(v3);
  if (result >= v3)
  {
    if (v3 < 0) {
      goto LABEL_149;
    }
    if (v3) {
      return sub_10000506C(0, v3, 1, v2);
    }
    return result;
  }
  if (v3 >= 0) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = v3 + 1;
  }
  if (v3 < -1) {
    goto LABEL_157;
  }
  Swift::Int v113 = result;
  uint64_t v120 = v1;
  v110 = v2;
  if (v3 < 2)
  {
    int64_t v9 = (char *)_swiftEmptyArrayStorage;
    uint64_t v122 = (uint64_t)_swiftEmptyArrayStorage;
    v119 = (char *)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 32);
    if (v3 != 1)
    {
      unint64_t v12 = _swiftEmptyArrayStorage[2];
LABEL_115:
      if (v12 >= 2)
      {
        uint64_t v103 = *v110;
        do
        {
          unint64_t v104 = v12 - 2;
          if (v12 < 2) {
            goto LABEL_144;
          }
          if (!v103) {
            goto LABEL_156;
          }
          uint64_t v105 = *(void *)&v9[16 * v104 + 32];
          uint64_t v106 = *(void *)&v9[16 * v12 + 24];
          sub_1000051F0((char *)(v103 + 8 * v105), (char *)(v103 + 8 * *(void *)&v9[16 * v12 + 16]), v103 + 8 * v106, v119);
          if (v120) {
            break;
          }
          if (v106 < v105) {
            goto LABEL_145;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            int64_t v9 = sub_1000057E8((uint64_t)v9);
          }
          if (v104 >= *((void *)v9 + 2)) {
            goto LABEL_146;
          }
          v107 = &v9[16 * v104 + 32];
          *(void *)v107 = v105;
          *((void *)v107 + 1) = v106;
          unint64_t v108 = *((void *)v9 + 2);
          if (v12 > v108) {
            goto LABEL_147;
          }
          memmove(&v9[16 * v12 + 16], &v9[16 * v12 + 32], 16 * (v108 - v12));
          *((void *)v9 + 2) = v108 - 1;
          unint64_t v12 = v108 - 1;
        }
        while (v108 > 2);
      }
LABEL_126:
      swift_bridgeObjectRelease();
      *(void *)((v122 & 0xFFFFFFFFFFFFFF8) + 0x10) = 0;
      sub_100032728();
      return swift_bridgeObjectRelease();
    }
  }
  else
  {
    unint64_t v6 = v2;
    uint64_t v7 = v5 >> 1;
    type metadata accessor for ActivityItem();
    uint64_t v8 = sub_100032748();
    *(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10) = v7;
    uint64_t v2 = v6;
    v119 = (char *)((v8 & 0xFFFFFFFFFFFFFF8) + 32);
    uint64_t v122 = v8;
  }
  Swift::Int v10 = 0;
  uint64_t v11 = *v2;
  uint64_t v111 = *v2 - 8;
  uint64_t v112 = *v2 + 16;
  int64_t v9 = (char *)_swiftEmptyArrayStorage;
  Swift::Int v118 = v3;
  uint64_t v121 = *v2;
  while (1)
  {
    Swift::Int v13 = v10++;
    if (v10 < v3)
    {
      uint64_t v14 = v9;
      uint64_t v15 = *(void *)(v11 + 8 * v13);
      uint64_t v16 = *(uint64_t (**)(uint64_t))(**(void **)(v11 + 8 * v10) + 184);
      swift_retain();
      uint64_t v17 = swift_retain();
      uint64_t v18 = v16(v17);
      uint64_t v20 = v19;
      if (v18 == (*(uint64_t (**)(void))(*(void *)v15 + 184))() && v20 == v21) {
        int v116 = 0;
      }
      else {
        int v116 = sub_100032A38();
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_release();
      swift_release();
      Swift::Int v10 = v13 + 2;
      Swift::Int v3 = v118;
      if (v13 + 2 < v118)
      {
        Swift::Int v114 = v13;
        uint64_t v23 = v112 + 8 * v13;
        while (1)
        {
          uint64_t v24 = *(void *)(v23 - 8);
          uint64_t v25 = *(uint64_t (**)(uint64_t))(**(void **)v23 + 184);
          swift_retain();
          uint64_t v26 = swift_retain();
          uint64_t v27 = v25(v26);
          uint64_t v29 = v28;
          BOOL v31 = v27 == (*(uint64_t (**)(void))(*(void *)v24 + 184))() && v29 == v30;
          int v32 = v31 ? 0 : sub_100032A38();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_release();
          swift_release();
          if ((v116 ^ v32)) {
            break;
          }
          ++v10;
          v23 += 8;
          Swift::Int v3 = v118;
          if (v118 == v10)
          {
            Swift::Int v10 = v118;
            goto LABEL_34;
          }
        }
        Swift::Int v3 = v118;
LABEL_34:
        Swift::Int v13 = v114;
      }
      int64_t v9 = v14;
      uint64_t v11 = v121;
      if (v116)
      {
        if (v10 < v13) {
          goto LABEL_150;
        }
        if (v13 < v10)
        {
          uint64_t v33 = (uint64_t *)(v111 + 8 * v10);
          Swift::Int v34 = v10;
          Swift::Int v35 = v13;
          char v36 = (uint64_t *)(v121 + 8 * v13);
          do
          {
            if (v35 != --v34)
            {
              if (!v121) {
                goto LABEL_155;
              }
              uint64_t v37 = *v36;
              *char v36 = *v33;
              *uint64_t v33 = v37;
            }
            ++v35;
            --v33;
            ++v36;
          }
          while (v35 < v34);
        }
      }
    }
    if (v10 < v3)
    {
      if (__OFSUB__(v10, v13)) {
        goto LABEL_148;
      }
      if (v10 - v13 < v113) {
        break;
      }
    }
LABEL_67:
    if (v10 < v13) {
      goto LABEL_143;
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      int64_t v9 = sub_100005630(0, *((void *)v9 + 2) + 1, 1, v9);
    }
    unint64_t v54 = *((void *)v9 + 2);
    unint64_t v53 = *((void *)v9 + 3);
    unint64_t v12 = v54 + 1;
    uint64_t v11 = v121;
    if (v54 >= v53 >> 1)
    {
      v102 = sub_100005630((char *)(v53 > 1), v54 + 1, 1, v9);
      uint64_t v11 = v121;
      int64_t v9 = v102;
    }
    *((void *)v9 + 2) = v12;
    v55 = v9 + 32;
    v56 = &v9[16 * v54 + 32];
    *(void *)v56 = v13;
    *((void *)v56 + 1) = v10;
    if (v54)
    {
      while (1)
      {
        unint64_t v57 = v12 - 1;
        if (v12 >= 4)
        {
          v62 = &v55[16 * v12];
          uint64_t v63 = *((void *)v62 - 8);
          uint64_t v64 = *((void *)v62 - 7);
          BOOL v68 = __OFSUB__(v64, v63);
          uint64_t v65 = v64 - v63;
          if (v68) {
            goto LABEL_132;
          }
          uint64_t v67 = *((void *)v62 - 6);
          uint64_t v66 = *((void *)v62 - 5);
          BOOL v68 = __OFSUB__(v66, v67);
          uint64_t v60 = v66 - v67;
          char v61 = v68;
          if (v68) {
            goto LABEL_133;
          }
          unint64_t v69 = v12 - 2;
          v70 = &v55[16 * v12 - 32];
          uint64_t v72 = *(void *)v70;
          uint64_t v71 = *((void *)v70 + 1);
          BOOL v68 = __OFSUB__(v71, v72);
          uint64_t v73 = v71 - v72;
          if (v68) {
            goto LABEL_135;
          }
          BOOL v68 = __OFADD__(v60, v73);
          uint64_t v74 = v60 + v73;
          if (v68) {
            goto LABEL_138;
          }
          if (v74 >= v65)
          {
            v92 = &v55[16 * v57];
            uint64_t v94 = *(void *)v92;
            uint64_t v93 = *((void *)v92 + 1);
            BOOL v68 = __OFSUB__(v93, v94);
            uint64_t v95 = v93 - v94;
            if (v68) {
              goto LABEL_142;
            }
            BOOL v85 = v60 < v95;
            goto LABEL_104;
          }
        }
        else
        {
          if (v12 != 3)
          {
            uint64_t v86 = *((void *)v9 + 4);
            uint64_t v87 = *((void *)v9 + 5);
            BOOL v68 = __OFSUB__(v87, v86);
            uint64_t v79 = v87 - v86;
            char v80 = v68;
            goto LABEL_98;
          }
          uint64_t v59 = *((void *)v9 + 4);
          uint64_t v58 = *((void *)v9 + 5);
          BOOL v68 = __OFSUB__(v58, v59);
          uint64_t v60 = v58 - v59;
          char v61 = v68;
        }
        if (v61) {
          goto LABEL_134;
        }
        unint64_t v69 = v12 - 2;
        v75 = &v55[16 * v12 - 32];
        uint64_t v77 = *(void *)v75;
        uint64_t v76 = *((void *)v75 + 1);
        BOOL v78 = __OFSUB__(v76, v77);
        uint64_t v79 = v76 - v77;
        char v80 = v78;
        if (v78) {
          goto LABEL_137;
        }
        v81 = &v55[16 * v57];
        uint64_t v83 = *(void *)v81;
        uint64_t v82 = *((void *)v81 + 1);
        BOOL v68 = __OFSUB__(v82, v83);
        uint64_t v84 = v82 - v83;
        if (v68) {
          goto LABEL_140;
        }
        if (__OFADD__(v79, v84)) {
          goto LABEL_141;
        }
        if (v79 + v84 >= v60)
        {
          BOOL v85 = v60 < v84;
LABEL_104:
          if (v85) {
            unint64_t v57 = v69;
          }
          goto LABEL_106;
        }
LABEL_98:
        if (v80) {
          goto LABEL_136;
        }
        v88 = &v55[16 * v57];
        uint64_t v90 = *(void *)v88;
        uint64_t v89 = *((void *)v88 + 1);
        BOOL v68 = __OFSUB__(v89, v90);
        uint64_t v91 = v89 - v90;
        if (v68) {
          goto LABEL_139;
        }
        if (v91 < v79) {
          goto LABEL_14;
        }
LABEL_106:
        unint64_t v96 = v57 - 1;
        if (v57 - 1 >= v12)
        {
          __break(1u);
LABEL_129:
          __break(1u);
LABEL_130:
          __break(1u);
LABEL_131:
          __break(1u);
LABEL_132:
          __break(1u);
LABEL_133:
          __break(1u);
LABEL_134:
          __break(1u);
LABEL_135:
          __break(1u);
LABEL_136:
          __break(1u);
LABEL_137:
          __break(1u);
LABEL_138:
          __break(1u);
LABEL_139:
          __break(1u);
LABEL_140:
          __break(1u);
LABEL_141:
          __break(1u);
LABEL_142:
          __break(1u);
LABEL_143:
          __break(1u);
LABEL_144:
          __break(1u);
LABEL_145:
          __break(1u);
LABEL_146:
          __break(1u);
LABEL_147:
          __break(1u);
LABEL_148:
          __break(1u);
LABEL_149:
          __break(1u);
LABEL_150:
          __break(1u);
LABEL_151:
          __break(1u);
          goto LABEL_152;
        }
        if (!v11) {
          goto LABEL_154;
        }
        v97 = &v55[16 * v96];
        uint64_t v98 = *(void *)v97;
        v99 = &v55[16 * v57];
        uint64_t v100 = *((void *)v99 + 1);
        sub_1000051F0((char *)(v11 + 8 * *(void *)v97), (char *)(v11 + 8 * *(void *)v99), v11 + 8 * v100, v119);
        if (v120) {
          goto LABEL_126;
        }
        if (v100 < v98) {
          goto LABEL_129;
        }
        if (v57 > *((void *)v9 + 2)) {
          goto LABEL_130;
        }
        *(void *)v97 = v98;
        *(void *)&v55[16 * v96 + 8] = v100;
        unint64_t v101 = *((void *)v9 + 2);
        if (v57 >= v101) {
          goto LABEL_131;
        }
        unint64_t v12 = v101 - 1;
        memmove(&v55[16 * v57], v99 + 16, 16 * (v101 - 1 - v57));
        *((void *)v9 + 2) = v101 - 1;
        uint64_t v11 = v121;
        if (v101 <= 2) {
          goto LABEL_14;
        }
      }
    }
    unint64_t v12 = 1;
LABEL_14:
    Swift::Int v3 = v118;
    if (v10 >= v118) {
      goto LABEL_115;
    }
  }
  if (__OFADD__(v13, v113)) {
    goto LABEL_151;
  }
  if (v13 + v113 >= v3) {
    Swift::Int v38 = v3;
  }
  else {
    Swift::Int v38 = v13 + v113;
  }
  if (v38 >= v13)
  {
    if (v10 != v38)
    {
      Swift::Int v115 = v13;
      Swift::Int v117 = v38;
      v109 = v9;
      char v39 = (uint64_t *)(v111 + 8 * v10);
      do
      {
        uint64_t v40 = *(void *)(v11 + 8 * v10);
        Swift::Int v41 = v115;
        uint64_t v42 = v39;
        while (1)
        {
          uint64_t v43 = *v42;
          v44 = *(uint64_t (**)(uint64_t))(*(void *)v40 + 184);
          swift_retain();
          uint64_t v45 = swift_retain();
          uint64_t v46 = v44(v45);
          uint64_t v48 = v47;
          if (v46 == (*(uint64_t (**)(void))(*(void *)v43 + 184))() && v48 == v49) {
            break;
          }
          char v51 = sub_100032A38();
          swift_release();
          swift_release();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v51 & 1) == 0) {
            goto LABEL_55;
          }
          uint64_t v11 = v121;
          if (!v121) {
            goto LABEL_153;
          }
          uint64_t v52 = *v42;
          uint64_t v40 = v42[1];
          *uint64_t v42 = v40;
          v42[1] = v52;
          --v42;
          if (v10 == ++v41) {
            goto LABEL_56;
          }
        }
        swift_release();
        swift_release();
        swift_bridgeObjectRelease_n();
LABEL_55:
        uint64_t v11 = v121;
LABEL_56:
        ++v10;
        ++v39;
      }
      while (v10 != v117);
      Swift::Int v10 = v117;
      int64_t v9 = v109;
      Swift::Int v13 = v115;
    }
    goto LABEL_67;
  }
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
  Swift::Int result = sub_100032988();
  __break(1u);
  return result;
}

uint64_t sub_10000506C(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v20 = result;
  if (a3 != a2)
  {
    uint64_t v4 = a3;
    uint64_t v5 = *a4;
    unint64_t v6 = (void *)(*a4 + 8 * a3 - 8);
LABEL_6:
    uint64_t v7 = *(void *)(v5 + 8 * v4);
    uint64_t v8 = v20;
    uint64_t v21 = v6;
    while (1)
    {
      uint64_t v9 = *v6;
      Swift::Int v10 = *(uint64_t (**)(uint64_t))(*(void *)v7 + 184);
      swift_retain();
      uint64_t v11 = swift_retain();
      uint64_t v12 = v10(v11);
      uint64_t v14 = v13;
      if (v12 == (*(uint64_t (**)(void))(*(void *)v9 + 184))() && v14 == v15)
      {
        swift_release();
        swift_release();
        Swift::Int result = swift_bridgeObjectRelease_n();
LABEL_5:
        ++v4;
        unint64_t v6 = v21 + 1;
        if (v4 == a2) {
          return result;
        }
        goto LABEL_6;
      }
      char v17 = sub_100032A38();
      swift_release();
      swift_release();
      swift_bridgeObjectRelease();
      Swift::Int result = swift_bridgeObjectRelease();
      if ((v17 & 1) == 0) {
        goto LABEL_5;
      }
      if (!v5) {
        break;
      }
      uint64_t v18 = *v6;
      uint64_t v7 = v6[1];
      *unint64_t v6 = v7;
      v6[1] = v18;
      --v6;
      if (v4 == ++v8) {
        goto LABEL_5;
      }
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_1000051F0(char *a1, char *__src, unint64_t a3, char *__dst)
{
  uint64_t v5 = __src;
  uint64_t v6 = __src - a1;
  uint64_t v7 = __src - a1 + 7;
  if (__src - a1 >= 0) {
    uint64_t v7 = __src - a1;
  }
  uint64_t v8 = v7 >> 3;
  uint64_t v9 = a3 - (void)__src;
  uint64_t v10 = a3 - (void)__src + 7;
  if ((uint64_t)(a3 - (void)__src) >= 0) {
    uint64_t v10 = a3 - (void)__src;
  }
  uint64_t v11 = v10 >> 3;
  v50 = a1;
  uint64_t v49 = __dst;
  if (v8 >= v10 >> 3)
  {
    if (v9 >= -7)
    {
      if (__dst != __src || &__src[8 * v11] <= __dst) {
        memmove(__dst, __src, 8 * v11);
      }
      uint64_t v43 = __dst;
      uint64_t v27 = &__dst[8 * v11];
      uint64_t v48 = v27;
      v50 = v5;
      if (a1 < v5 && v9 >= 8)
      {
        uint64_t v28 = (char *)(a3 - 8);
        uint64_t v29 = v5;
        do
        {
          uint64_t v45 = v27;
          uint64_t v47 = v5;
          uint64_t v31 = *((void *)v27 - 1);
          v27 -= 8;
          uint64_t v30 = v31;
          uint64_t v32 = *((void *)v29 - 1);
          v29 -= 8;
          uint64_t v33 = *(uint64_t (**)(uint64_t))(*(void *)v30 + 184);
          swift_retain();
          uint64_t v34 = swift_retain();
          uint64_t v35 = v33(v34);
          uint64_t v37 = v36;
          if (v35 == (*(uint64_t (**)(void))(*(void *)v32 + 184))() && v37 == v38) {
            char v40 = 0;
          }
          else {
            char v40 = sub_100032A38();
          }
          Swift::Int v41 = v28 + 8;
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_release();
          swift_release();
          if (v40)
          {
            uint64_t v27 = v45;
            if (v41 != v47 || v28 >= v47) {
              *(void *)uint64_t v28 = *(void *)v29;
            }
            v50 = v29;
          }
          else
          {
            uint64_t v48 = v27;
            if (v41 < v45 || v28 >= v45)
            {
              *(void *)uint64_t v28 = *(void *)v27;
              uint64_t v29 = v47;
            }
            else
            {
              uint64_t v29 = v47;
              if (v41 != v45) {
                *(void *)uint64_t v28 = *(void *)v27;
              }
            }
          }
          if (v29 <= a1) {
            break;
          }
          v28 -= 8;
          uint64_t v5 = v29;
        }
        while (v27 > v43);
      }
LABEL_54:
      sub_10000572C((void **)&v50, (const void **)&v49, &v48);
      return 1;
    }
  }
  else if (v6 >= -7)
  {
    uint64_t v12 = a1;
    if (__dst != a1 || &a1[8 * v8] <= __dst) {
      memmove(__dst, a1, 8 * v8);
    }
    uint64_t v13 = &__dst[8 * v8];
    uint64_t v48 = v13;
    if ((unint64_t)v5 < a3 && v6 >= 8)
    {
      uint64_t v14 = __dst;
      while (1)
      {
        uint64_t v15 = v5;
        uint64_t v16 = *(void *)v5;
        uint64_t v17 = *(void *)v14;
        uint64_t v18 = *(uint64_t (**)(uint64_t))(*(void *)v16 + 184);
        swift_retain();
        uint64_t v19 = swift_retain();
        uint64_t v20 = v18(v19);
        uint64_t v22 = v21;
        if (v20 == (*(uint64_t (**)(void))(*(void *)v17 + 184))() && v22 == v23) {
          break;
        }
        char v25 = sub_100032A38();
        swift_release();
        swift_release();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v25 & 1) == 0) {
          goto LABEL_23;
        }
        uint64_t v26 = v15 + 8;
        if (v12 < v15 || v12 >= v26 || v12 != v15) {
          *(void *)uint64_t v12 = *(void *)v15;
        }
LABEL_26:
        v12 += 8;
        if (v14 < v13)
        {
          uint64_t v5 = v26;
          if ((unint64_t)v26 < a3) {
            continue;
          }
        }
        v50 = v12;
        goto LABEL_54;
      }
      swift_release();
      swift_release();
      swift_bridgeObjectRelease_n();
LABEL_23:
      if (v12 != v14) {
        *(void *)uint64_t v12 = *(void *)v14;
      }
      v14 += 8;
      uint64_t v49 = v14;
      uint64_t v26 = v15;
      goto LABEL_26;
    }
    goto LABEL_54;
  }
  uint64_t result = sub_1000329D8();
  __break(1u);
  return result;
}

char *sub_100005630(char *result, int64_t a2, char a3, char *a4)
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
    sub_100001DEC(&qword_100040FD0);
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
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_10000572C(void **a1, const void **a2, void *a3)
{
  Swift::Int v3 = (char *)*a2;
  uint64_t v4 = *a3 - (void)v3;
  uint64_t v5 = v4 + 7;
  if (v4 >= 0) {
    uint64_t v5 = *a3 - (void)v3;
  }
  if (v4 <= -8)
  {
    uint64_t result = (char *)sub_1000329D8();
    __break(1u);
  }
  else
  {
    uint64_t result = (char *)*a1;
    uint64_t v7 = v5 >> 3;
    if (result != v3 || result >= &v3[8 * v7])
    {
      return (char *)memmove(result, v3, 8 * v7);
    }
  }
  return result;
}

char *sub_1000057E8(uint64_t a1)
{
  return sub_100005630(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_1000057FC(Swift::Int *a1, Swift::Int a2, Swift::Int a3)
{
  uint64_t v7 = *v3;
  sub_100032AB8();
  swift_bridgeObjectRetain();
  sub_100032678();
  Swift::Int v8 = sub_100032AC8();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    uint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_100032A38() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v14 = (Swift::Int *)(*(void *)(*v3 + 48) + 16 * v10);
      Swift::Int v15 = v14[1];
      *a1 = *v14;
      a1[1] = v15;
      swift_bridgeObjectRetain();
      return 0;
    }
    uint64_t v17 = ~v9;
    while (1)
    {
      unint64_t v10 = (v10 + 1) & v17;
      if (((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0) {
        break;
      }
      uint64_t v18 = (void *)(v11 + 16 * v10);
      BOOL v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_100032A38() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  *Swift::Int v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_100005C8C(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *Swift::Int v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_1000059AC()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_100001DEC(&qword_100040FB0);
  uint64_t v3 = sub_1000328D8();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v30 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v6 = ~(-1 << v5);
    }
    else {
      uint64_t v6 = -1;
    }
    unint64_t v7 = v6 & *(void *)(v2 + 56);
    int64_t v8 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v9 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v11 = 0;
    while (1)
    {
      if (v7)
      {
        unint64_t v14 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        unint64_t v15 = v14 | (v11 << 6);
      }
      else
      {
        int64_t v16 = v11 + 1;
        if (__OFADD__(v11, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v8) {
          goto LABEL_33;
        }
        unint64_t v17 = v30[v16];
        ++v11;
        if (!v17)
        {
          int64_t v11 = v16 + 1;
          if (v16 + 1 >= v8) {
            goto LABEL_33;
          }
          unint64_t v17 = v30[v11];
          if (!v17)
          {
            int64_t v11 = v16 + 2;
            if (v16 + 2 >= v8) {
              goto LABEL_33;
            }
            unint64_t v17 = v30[v11];
            if (!v17)
            {
              int64_t v18 = v16 + 3;
              if (v18 >= v8)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v0;
                uint64_t v29 = 1 << *(unsigned char *)(v2 + 32);
                if (v29 > 63) {
                  bzero(v30, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v30 = -1 << v29;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v17 = v30[v18];
              if (!v17)
              {
                while (1)
                {
                  int64_t v11 = v18 + 1;
                  if (__OFADD__(v18, 1)) {
                    goto LABEL_39;
                  }
                  if (v11 >= v8) {
                    goto LABEL_33;
                  }
                  unint64_t v17 = v30[v11];
                  ++v18;
                  if (v17) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v11 = v18;
            }
          }
        }
LABEL_23:
        unint64_t v7 = (v17 - 1) & v17;
        unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
      }
      BOOL v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
      uint64_t v20 = *v19;
      uint64_t v21 = v19[1];
      sub_100032AB8();
      sub_100032678();
      uint64_t result = sub_100032AC8();
      uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v23 = result & ~v22;
      unint64_t v24 = v23 >> 6;
      if (((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6))) != 0)
      {
        unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v25 = 0;
        unint64_t v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v27 = v24 == v26;
          if (v24 == v26) {
            unint64_t v24 = 0;
          }
          v25 |= v27;
          uint64_t v28 = *(void *)(v9 + 8 * v24);
        }
        while (v28 == -1);
        unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      BOOL v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
      void *v13 = v20;
      v13[1] = v21;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

Swift::Int sub_100005C8C(Swift::Int result, Swift::Int a2, unint64_t a3, char a4)
{
  uint64_t v5 = v4;
  Swift::Int v8 = result;
  unint64_t v9 = *(void *)(*v4 + 16);
  unint64_t v10 = *(void *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0) {
    goto LABEL_22;
  }
  if (a4)
  {
    sub_1000059AC();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (Swift::Int)sub_100005E28();
      goto LABEL_22;
    }
    sub_100005FDC();
  }
  uint64_t v11 = *v4;
  sub_100032AB8();
  sub_100032678();
  uint64_t result = sub_100032AC8();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    unint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = sub_100032A38(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = sub_100032A48();
      __break(1u);
    }
    else
    {
      uint64_t v17 = ~v12;
      while (1)
      {
        a3 = (a3 + 1) & v17;
        if (((*(void *)(v13 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3) & 1) == 0) {
          break;
        }
        int64_t v18 = (void *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          uint64_t result = sub_100032A38();
          if ((result & 1) == 0) {
            continue;
          }
        }
        goto LABEL_21;
      }
    }
  }
LABEL_22:
  uint64_t v20 = *v5;
  *(void *)(*v5 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  uint64_t v21 = (Swift::Int *)(*(void *)(v20 + 48) + 16 * a3);
  *uint64_t v21 = v8;
  v21[1] = a2;
  uint64_t v22 = *(void *)(v20 + 16);
  BOOL v23 = __OFADD__(v22, 1);
  uint64_t v24 = v22 + 1;
  if (v23) {
    __break(1u);
  }
  else {
    *(void *)(v20 + 16) = v24;
  }
  return result;
}

void *sub_100005E28()
{
  uint64_t v1 = v0;
  sub_100001DEC(&qword_100040FB0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1000328C8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 56);
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
      goto LABEL_30;
    }
    if (v20 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21)
      {
        int64_t v9 = v20 + 2;
        if (v20 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v21 = *(void *)(v6 + 8 * v9);
        if (!v21) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = v17[1];
    BOOL v19 = (void *)(*(void *)(v4 + 48) + v16);
    void *v19 = *v17;
    v19[1] = v18;
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v22 = v20 + 3;
  if (v22 >= v13) {
    goto LABEL_28;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_100005FDC()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_100001DEC(&qword_100040FB0);
  uint64_t v3 = sub_1000328D8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v6 = v2 + 56;
  if (v5 < 64) {
    uint64_t v7 = ~(-1 << v5);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(v2 + 56);
  int64_t v29 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v9 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v11 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v15 = v14 | (v11 << 6);
      goto LABEL_24;
    }
    int64_t v16 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v29) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v11;
    if (!v17)
    {
      int64_t v11 = v16 + 1;
      if (v16 + 1 >= v29) {
        goto LABEL_33;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v11);
      if (!v17)
      {
        int64_t v11 = v16 + 2;
        if (v16 + 2 >= v29) {
          goto LABEL_33;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v11);
        if (!v17) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
LABEL_24:
    BOOL v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    sub_100032AB8();
    swift_bridgeObjectRetain();
    sub_100032678();
    uint64_t result = sub_100032AC8();
    uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v23 = result & ~v22;
    unint64_t v24 = v23 >> 6;
    if (((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6))) != 0)
    {
      unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v27 = v24 == v26;
        if (v24 == v26) {
          unint64_t v24 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v9 + 8 * v24);
      }
      while (v28 == -1);
      unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    int64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
    void *v13 = v20;
    v13[1] = v21;
    ++*(void *)(v4 + 16);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v29)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v0;
    goto LABEL_35;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v11 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v11 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v11 >= v29) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v11);
    ++v18;
    if (v17) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_10000628C(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_1000329A8();
    swift_bridgeObjectRelease();
    if (!v7) {
      return a3;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v7) {
      return a3;
    }
  }
  if (!a1) {
    goto LABEL_19;
  }
  uint64_t v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_1000329A8();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_100006D1C();
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          sub_100001DEC(&qword_100040DE8);
          unint64_t v12 = sub_100006490(v16, i, a3);
          uint64_t v14 = *v13;
          swift_retain();
          ((void (*)(uint64_t (**)(), void))v12)(v16, 0);
          *(void *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v9 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    type metadata accessor for ActivityItem();
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = sub_1000329D8();
  __break(1u);
  return result;
}

void (*sub_100006490(uint64_t (**a1)(), unint64_t a2, uint64_t a3))(void *a1)
{
  unint64_t v6 = (uint64_t (*)())malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_100006540(v6, a2, a3);
  return sub_1000064F8;
}

void sub_1000064F8(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);

  free(v1);
}

uint64_t (*sub_100006540(uint64_t (*result)(), unint64_t a2, uint64_t a3))()
{
  uint64_t v3 = (uint64_t *)result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    uint64_t v4 = sub_100032908();
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    uint64_t v4 = swift_retain();
LABEL_5:
    *uint64_t v3 = v4;
    return sub_1000065C0;
  }
  __break(1u);
  return result;
}

uint64_t sub_1000065C0()
{
  return swift_release();
}

uint64_t sub_1000065C8(uint64_t a1)
{
  return specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(a1 + 16), 0, a1);
}

void *sub_1000065DC(unint64_t a1)
{
  if (a1 >> 62)
  {
LABEL_16:
    uint64_t v2 = sub_1000329A8();
    if (v2) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v2)
    {
LABEL_3:
      for (unint64_t i = 0; ; ++i)
      {
        if ((a1 & 0xC000000000000001) != 0)
        {
          uint64_t v4 = sub_100032908();
          unint64_t v5 = i + 1;
          if (__OFADD__(i, 1))
          {
LABEL_13:
            __break(1u);
            return _swiftEmptyArrayStorage;
          }
        }
        else
        {
          if (i >= *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
          {
            __break(1u);
            goto LABEL_16;
          }
          uint64_t v4 = *(void *)(a1 + 8 * i + 32);
          swift_retain();
          unint64_t v5 = i + 1;
          if (__OFADD__(i, 1)) {
            goto LABEL_13;
          }
        }
        if ((*(uint64_t (**)(void))(*(void *)v4 + 232))())
        {
          sub_100032938();
          sub_100032968();
          sub_100032978();
          sub_100032948();
        }
        else
        {
          swift_release();
        }
        if (v5 == v2) {
          return _swiftEmptyArrayStorage;
        }
      }
    }
  }
  return _swiftEmptyArrayStorage;
}

unint64_t sub_10000674C()
{
  unint64_t result = qword_100040E10;
  if (!qword_100040E10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100040E10);
  }
  return result;
}

uint64_t sub_1000067A0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (*(uint64_t (**)(void))(*(void *)a1 + 112))();
  uint64_t v5 = *(void *)(v3 + 24);
  uint64_t v4 = *(void *)(v3 + 32);
  swift_bridgeObjectRetain();
  uint64_t v6 = swift_release();
  uint64_t v7 = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 112))(v6);
  uint64_t v9 = *(void *)(v7 + 24);
  uint64_t v8 = *(void *)(v7 + 32);
  swift_bridgeObjectRetain();
  swift_release();
  if (v5 == v9 && v4 == v8) {
    char v11 = 1;
  }
  else {
    char v11 = sub_100032A38();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v11 & 1;
}

unint64_t sub_10000689C()
{
  unint64_t result = qword_100040E18;
  if (!qword_100040E18)
  {
    type metadata accessor for ActivityGroup();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100040E18);
  }
  return result;
}

uint64_t type metadata accessor for ActivityGroup()
{
  uint64_t result = qword_100042330;
  if (!qword_100042330) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void *sub_100006940()
{
  return &protocol witness table for ObservableObjectPublisher;
}

uint64_t sub_10000694C()
{
  return type metadata accessor for ActivityGroup();
}

void sub_100006954()
{
  sub_100006A60();
  if (v0 <= 0x3F)
  {
    sub_100006AB8();
    if (v1 <= 0x3F)
    {
      sub_100006B5C();
      if (v2 <= 0x3F) {
        swift_updateClassMetadata2();
      }
    }
  }
}

void sub_100006A60()
{
  if (!qword_100040E48)
  {
    type metadata accessor for ActivityItem();
    unint64_t v0 = sub_100031C48();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100040E48);
    }
  }
}

void sub_100006AB8()
{
  if (!qword_100040E50)
  {
    sub_100006B14(&qword_100040DE8);
    unint64_t v0 = sub_100031C48();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100040E50);
    }
  }
}

uint64_t sub_100006B14(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

void sub_100006B5C()
{
  if (!qword_100040E58)
  {
    unint64_t v0 = sub_100031C48();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100040E58);
    }
  }
}

uint64_t initializeBufferWithCopyOfBuffer for ActivityGroup.Selection(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(unsigned char *)(result + 8) = *((unsigned char *)a2 + 8);
  *(void *)uint64_t result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for ActivityGroup.Selection(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 9)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for ActivityGroup.Selection(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)uint64_t result = 0;
    *(unsigned char *)(result + 8) = 0;
    *(_DWORD *)uint64_t result = a2 - 1;
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
  *(unsigned char *)(result + 9) = v3;
  return result;
}

uint64_t sub_100006C1C(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 8)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_100006C3C(uint64_t result, int a2)
{
  if (a2)
  {
    *(void *)uint64_t result = (a2 - 1);
    *(unsigned char *)(result + 8) = 1;
  }
  else
  {
    *(unsigned char *)(result + 8) = 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for ActivityGroup.Selection()
{
  return &type metadata for ActivityGroup.Selection;
}

uint64_t sub_100006C6C(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100006CBC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_100006D1C()
{
  unint64_t result = qword_100040FC8;
  if (!qword_100040FC8)
  {
    sub_100006B14(&qword_100040DE8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100040FC8);
  }
  return result;
}

uint64_t sub_100006D78()
{
  CFErrorRef error = 0;
  CFStringRef v1 = SecTaskCopySigningIdentifier(v0, &error);
  if (v1)
  {
    uint64_t v2 = (__CFString *)v1;
    uint64_t v3 = sub_100032638();

    swift_beginAccess();
    CFErrorRef v4 = error;
    uint64_t result = v3;
    if (!error) {
      return result;
    }
    goto LABEL_3;
  }
  uint64_t v6 = sub_100031BA8();
  os_log_type_t v7 = sub_1000327D8();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    v11[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 136446210;
    swift_beginAccess();
    sub_100001DEC(&qword_100040FD8);
    uint64_t v9 = sub_100032658();
    sub_100003FD4(v9, v10, v11);
    sub_100032858();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Failed to extract bundle identifier from SecTask: %{public}s", v8, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  swift_beginAccess();
  uint64_t v3 = 0;
  uint64_t result = 0;
  CFErrorRef v4 = error;
  if (error)
  {
LABEL_3:

    return v3;
  }
  return result;
}

uint64_t sub_100006F90()
{
  CFErrorRef error = 0;
  sub_10001CDF4(1);
  CFStringRef v1 = (__CFString *)sub_100032608();
  swift_bridgeObjectRelease();
  CFTypeRef v2 = SecTaskCopyValueForEntitlement(v0, v1, &error);

  uint64_t v14 = (uint64_t)v2;
  sub_100001DEC(&qword_100040FE8);
  if (swift_dynamicCast())
  {
    char v3 = v13;
    CFErrorRef v4 = error;
    if (!error) {
      return v3 & 1;
    }
LABEL_8:

    return v3 & 1;
  }
  if (!error)
  {
    char v3 = 2;
    return v3 & 1;
  }
  uint64_t v5 = sub_100031BA8();
  os_log_type_t v6 = sub_1000327D8();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 136315394;
    unint64_t v8 = sub_10001CDF4(1);
    sub_100003FD4(v8, v9, &v14);
    sub_100032858();
    swift_bridgeObjectRelease();
    *(_WORD *)(v7 + 12) = 2082;
    sub_100001DEC(&qword_100040FF0);
    uint64_t v10 = sub_100032658();
    sub_100003FD4(v10, v11, &v14);
    sub_100032858();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "Failed to extract entitlement %s from SecTask: %{public}s", (uint8_t *)v7, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  CFErrorRef v4 = error;
  char v3 = 2;
  if (error) {
    goto LABEL_8;
  }
  return v3 & 1;
}

void type metadata accessor for CFError()
{
  if (!qword_100040FE0)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_100040FE0);
    }
  }
}

uint64_t sub_10000720C(char a1)
{
  return qword_100033940[a1];
}

uint64_t sub_100007230(char *a1, char *a2)
{
  return sub_10000723C(*a1, *a2);
}

uint64_t sub_10000723C(char a1, char a2)
{
  if (qword_100033940[a1] == qword_100033940[a2] && qword_100033958[a1] == qword_100033958[a2]) {
    char v3 = 1;
  }
  else {
    char v3 = sub_100032A38();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

Swift::Int sub_1000072C4()
{
  return sub_1000072CC();
}

Swift::Int sub_1000072CC()
{
  return sub_100032AC8();
}

uint64_t sub_100007338()
{
  return sub_100007340();
}

uint64_t sub_100007340()
{
  sub_100032678();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_100007394()
{
  return sub_10000739C();
}

Swift::Int sub_10000739C()
{
  return sub_100032AC8();
}

uint64_t sub_100007404@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_10000B558(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

uint64_t sub_100007434@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10000720C(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_100007460()
{
  return *(unsigned __int8 *)(v0 + 16);
}

uint64_t sub_100007468()
{
  uint64_t v1 = *(void *)(v0 + 24);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_100007498(uint64_t a1)
{
  uint64_t v2 = sub_100001DEC(&qword_100040FF8);
  __chkstk_darwin(v2);
  sub_10000B5A4(a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_100040FF8);
  sub_100031BE8();
  return sub_10000B608(a1, &qword_100040FF8);
}

uint64_t sub_100007550()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100031C28();
  swift_release();

  return swift_release();
}

uint64_t sub_1000075C8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)a1 + 136))();
}

uint64_t sub_10000760C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100001DEC(&qword_100040FF8);
  __chkstk_darwin(v4 - 8);
  os_log_type_t v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000B5A4(a1, (uint64_t)v6, &qword_100040FF8);
  return (*(uint64_t (**)(char *))(**(void **)a2 + 144))(v6);
}

uint64_t sub_1000076C4(uint64_t a1)
{
  uint64_t v2 = sub_100001DEC(&qword_100040FF8);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_10000B5A4(a1, (uint64_t)v4, &qword_100040FF8);
  swift_retain();
  sub_100031C38();
  return sub_10000B608(a1, &qword_100040FF8);
}

uint64_t (*sub_10000779C(void *a1))()
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_100031C18();
  return sub_100001DD4;
}

uint64_t sub_100007828@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_100031918();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);

  return v3(a1, 1, 1, v2);
}

uint64_t sub_100007894()
{
  return sub_1000025E8((uint64_t)&OBJC_IVAR____TtC23ActivityPickerExtension12ActivityItem__iconURL, &qword_100041000);
}

uint64_t sub_1000078A8(uint64_t a1)
{
  return sub_100008538(a1, &qword_100041008, (uint64_t)&OBJC_IVAR____TtC23ActivityPickerExtension12ActivityItem__iconURL, &qword_100041000);
}

uint64_t (*sub_1000078C4(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = sub_100001DEC(&qword_100041008);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC23ActivityPickerExtension12ActivityItem__iconURL;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = sub_100001DEC(&qword_100041000);
  sub_100031BF8();
  swift_endAccess();
  return sub_100001F5C;
}

uint64_t sub_1000079D4()
{
  return sub_100031BE8();
}

uint64_t sub_100007A04()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100031C28();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_100007A78@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 184))();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_100007AC4(uint64_t *a1, uint64_t a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(**(void **)a2 + 192);
  swift_bridgeObjectRetain();
  return v4(v2, v3);
}

uint64_t sub_100007B2C()
{
  return sub_100031C38();
}

uint64_t (*sub_100007BA8(void *a1))()
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_100031C18();
  return sub_100001DD4;
}

uint64_t sub_100007C34()
{
  return sub_1000025E8((uint64_t)&OBJC_IVAR____TtC23ActivityPickerExtension12ActivityItem__localizedName, &qword_100041010);
}

uint64_t sub_100007C48(uint64_t a1)
{
  return sub_100008538(a1, &qword_100041018, (uint64_t)&OBJC_IVAR____TtC23ActivityPickerExtension12ActivityItem__localizedName, &qword_100041010);
}

uint64_t (*sub_100007C64(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = sub_100001DEC(&qword_100041018);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC23ActivityPickerExtension12ActivityItem__localizedName;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = sub_100001DEC(&qword_100041010);
  sub_100031BF8();
  swift_endAccess();
  return sub_100001F5C;
}

uint64_t sub_100007D74()
{
  return sub_1000082E8();
}

uint64_t sub_100007D88@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 232))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_100007DD8(unsigned __int8 *a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(**(void **)a2 + 240))(*a1);
}

uint64_t sub_100007E20()
{
  return sub_100008410();
}

uint64_t (*sub_100007E34(void *a1))()
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_100031C18();
  return sub_100001DD4;
}

uint64_t sub_100007EC0()
{
  return sub_1000025E8((uint64_t)&OBJC_IVAR____TtC23ActivityPickerExtension12ActivityItem__isDisplayable, &qword_100041020);
}

uint64_t sub_100007ED4(uint64_t a1)
{
  return sub_100008538(a1, &qword_100041028, (uint64_t)&OBJC_IVAR____TtC23ActivityPickerExtension12ActivityItem__isDisplayable, &qword_100041020);
}

uint64_t (*sub_100007EF0(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = sub_100001DEC(&qword_100041028);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC23ActivityPickerExtension12ActivityItem__isDisplayable;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = sub_100001DEC(&qword_100041020);
  sub_100031BF8();
  swift_endAccess();
  return sub_100001F5C;
}

uint64_t sub_100008000()
{
  return sub_1000082E8();
}

uint64_t sub_100008014@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 280))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_10000806C(unsigned __int8 *a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(**(void **)a2 + 288))(*a1);
}

uint64_t sub_1000080BC()
{
  return sub_100008410();
}

uint64_t (*sub_1000080D0(void *a1))()
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_100031C18();
  return sub_100001DD4;
}

uint64_t sub_10000815C()
{
  return 0;
}

uint64_t sub_100008164()
{
  return sub_1000025E8((uint64_t)&OBJC_IVAR____TtC23ActivityPickerExtension12ActivityItem__needsSecondFetch, &qword_100041020);
}

uint64_t sub_100008178(uint64_t a1)
{
  return sub_100008538(a1, &qword_100041028, (uint64_t)&OBJC_IVAR____TtC23ActivityPickerExtension12ActivityItem__needsSecondFetch, &qword_100041020);
}

uint64_t (*sub_100008194(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = sub_100001DEC(&qword_100041028);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC23ActivityPickerExtension12ActivityItem__needsSecondFetch;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = sub_100001DEC(&qword_100041020);
  sub_100031BF8();
  swift_endAccess();
  return sub_100001F5C;
}

uint64_t sub_1000082A4()
{
  return sub_100031BE8();
}

uint64_t sub_1000082D4()
{
  return sub_1000082E8();
}

uint64_t sub_1000082E8()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100031C28();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_100008354@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 328))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_1000083AC(unsigned __int8 *a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(**(void **)a2 + 336))(*a1);
}

uint64_t sub_1000083FC()
{
  return sub_100008410();
}

uint64_t sub_100008410()
{
  return sub_100031C38();
}

uint64_t (*sub_10000847C(void *a1))()
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_100031C18();
  return sub_100001DD4;
}

uint64_t sub_100008508()
{
  return sub_1000025E8((uint64_t)&OBJC_IVAR____TtC23ActivityPickerExtension12ActivityItem__isSelected, &qword_100041020);
}

uint64_t sub_10000851C(uint64_t a1)
{
  return sub_100008538(a1, &qword_100041028, (uint64_t)&OBJC_IVAR____TtC23ActivityPickerExtension12ActivityItem__isSelected, &qword_100041020);
}

uint64_t sub_100008538(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v6 = sub_100001DEC(a2);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v10 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  swift_beginAccess();
  sub_100001DEC(a4);
  sub_100031C08();
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
}

uint64_t (*sub_100008668(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = sub_100001DEC(&qword_100041028);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC23ActivityPickerExtension12ActivityItem__isSelected;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = sub_100001DEC(&qword_100041020);
  sub_100031BF8();
  swift_endAccess();
  return sub_100001F5C;
}

uint64_t sub_100008778()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 408))();
}

uint64_t sub_1000087A4(int a1, uint64_t a2, unint64_t a3)
{
  uint64_t v6 = swift_allocObject();
  sub_1000087FC(a1, a2, a3);
  return v6;
}

uint64_t sub_1000087FC(int a1, uint64_t a2, unint64_t a3)
{
  unint64_t v154 = a3;
  uint64_t v159 = a2;
  LODWORD(v155) = a1;
  uint64_t v4 = sub_100031BB8();
  uint64_t v150 = *(void *)(v4 - 8);
  uint64_t v151 = v4;
  uint64_t v5 = __chkstk_darwin(v4);
  v141 = (char *)v130 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  v148 = (char *)v130 - v7;
  uint64_t v145 = sub_1000319E8();
  uint64_t v144 = *(void *)(v145 - 8);
  __chkstk_darwin(v145);
  v140 = (char *)v130 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v149 = sub_100001DEC(&qword_100041030);
  uint64_t v9 = __chkstk_darwin(v149);
  uint64_t v143 = (uint64_t)v130 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v137 = (uint64_t)v130 - v11;
  uint64_t v12 = sub_100001DEC(&qword_100041038);
  uint64_t v13 = __chkstk_darwin(v12 - 8);
  uint64_t v142 = (uint64_t)v130 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __chkstk_darwin(v13);
  uint64_t v153 = (uint64_t)v130 - v16;
  uint64_t v17 = __chkstk_darwin(v15);
  uint64_t v152 = (uint64_t)v130 - v18;
  uint64_t v19 = __chkstk_darwin(v17);
  uint64_t v131 = (uint64_t)v130 - v20;
  uint64_t v21 = __chkstk_darwin(v19);
  uint64_t v138 = (uint64_t)v130 - v22;
  __chkstk_darwin(v21);
  v136 = (char *)v130 - v23;
  uint64_t v24 = sub_100031918();
  uint64_t v25 = *(void *)(v24 - 8);
  __chkstk_darwin(v24);
  v135 = (char *)v130 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = sub_100001DEC(&qword_100041020);
  uint64_t v156 = *(void *)(v27 - 8);
  uint64_t v157 = v27;
  __chkstk_darwin(v27);
  int64_t v29 = (char *)v130 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = sub_100001DEC(&qword_100041000);
  uint64_t v158 = *(void *)(v30 - 8);
  __chkstk_darwin(v30);
  uint64_t v32 = (char *)v130 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = sub_100001DEC(&qword_100040FF8);
  uint64_t v34 = __chkstk_darwin(v33);
  v146 = (char *)v130 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v36 = __chkstk_darwin(v34);
  uint64_t v38 = (char *)v130 - v37;
  __chkstk_darwin(v36);
  char v40 = (char *)v130 - v39;
  uint64_t v41 = v3 + OBJC_IVAR____TtC23ActivityPickerExtension12ActivityItem__iconURL;
  uint64_t v139 = v25;
  uint64_t v43 = *(void (**)(char *, void, uint64_t, uint64_t))(v25 + 56);
  uint64_t v42 = v25 + 56;
  uint64_t v147 = v24;
  v132 = v43;
  v43((char *)v130 - v39, 1, 1, v24);
  sub_10000B5A4((uint64_t)v40, (uint64_t)v38, &qword_100040FF8);
  uint64_t v133 = v33;
  sub_100031BE8();
  sub_10000B608((uint64_t)v40, &qword_100040FF8);
  v44 = *(void (**)(uint64_t, char *, uint64_t))(v158 + 32);
  uint64_t v134 = v30;
  v44(v41, v32, v30);
  uint64_t v45 = v3 + OBJC_IVAR____TtC23ActivityPickerExtension12ActivityItem__needsSecondFetch;
  LOBYTE(v163) = 0;
  sub_100031BE8();
  uint64_t v46 = *(void (**)(uint64_t, char *, uint64_t))(v156 + 32);
  uint64_t v47 = v45;
  uint64_t v48 = v157;
  v46(v47, v29, v157);
  uint64_t v49 = v3 + OBJC_IVAR____TtC23ActivityPickerExtension12ActivityItem__isSelected;
  LOBYTE(v163) = 0;
  unint64_t v50 = v154;
  sub_100031BE8();
  v46(v49, v29, v48);
  uint64_t v51 = v159;
  char v52 = v155;
  *(unsigned char *)(v3 + 16) = v155;
  *(void *)(v3 + 24) = v51;
  *(void *)(v3 + 32) = v50;
  uint64_t v160 = v3;
  if (!v52)
  {
    v130[1] = v42;
    uint64_t v58 = (uint64_t)v146;
    v141 = v38;
    uint64_t v59 = v158;
    uint64_t v61 = v147;
    uint64_t v60 = v148;
    sub_1000319D8();
    swift_bridgeObjectRetain();
    sub_1000319C8();
    uint64_t v62 = sub_1000319A8();
    swift_release();
    uint64_t v155 = v62;
    uint64_t v63 = sub_100031A88();
    uint64_t v65 = v149;
    if (v64)
    {
      uint64_t v66 = v63;
      unint64_t v67 = v64;
      if ((v63 != v159 || v64 != v50) && (sub_100032A38() & 1) == 0)
      {
        swift_bridgeObjectRelease();
        swift_beginAccess();
        uint64_t v161 = v66;
        unint64_t v162 = v67;
        sub_100031BE8();
        swift_endAccess();
        sub_100031A78();
        uint64_t v110 = v139;
        uint64_t v111 = v61;
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v139 + 48))(v58, 1, v61) == 1)
        {
          sub_10000B608(v58, &qword_100040FF8);
          uint64_t v112 = (uint64_t)v136;
          sub_100031A98();
          uint64_t v113 = v144;
          uint64_t v114 = v138;
          uint64_t v115 = v145;
          (*(void (**)(uint64_t, void, uint64_t))(v144 + 104))(v138, enum case for AppInfoSource.unknown(_:), v145);
          (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v113 + 56))(v114, 0, 1, v115);
          uint64_t v116 = v137;
          uint64_t v117 = v137 + *(int *)(v65 + 48);
          Swift::Int v118 = &qword_100041038;
          sub_10000B5A4(v112, v137, &qword_100041038);
          sub_10000B5A4(v114, v117, &qword_100041038);
          v119 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v113 + 48);
          if (v119(v116, 1, v115) == 1)
          {
            sub_10000B608(v114, &qword_100041038);
            sub_10000B608(v112, &qword_100041038);
            if (v119(v117, 1, v115) == 1)
            {
              char v120 = -1;
            }
            else
            {
              Swift::Int v118 = &qword_100041030;
              char v120 = 0;
            }
          }
          else
          {
            uint64_t v125 = v131;
            sub_10000B5A4(v116, v131, &qword_100041038);
            if (v119(v117, 1, v115) == 1)
            {
              sub_10000B608(v138, &qword_100041038);
              sub_10000B608(v112, &qword_100041038);
              (*(void (**)(uint64_t, uint64_t))(v113 + 8))(v125, v115);
              char v120 = 0;
              Swift::Int v118 = &qword_100041030;
            }
            else
            {
              v126 = v140;
              (*(void (**)(char *, uint64_t, uint64_t))(v113 + 32))(v140, v117, v115);
              sub_10000B878(&qword_100041040, (void (*)(uint64_t))&type metadata accessor for AppInfoSource);
              char v120 = sub_1000325F8();
              v127 = *(void (**)(char *, uint64_t))(v113 + 8);
              v127(v126, v115);
              Swift::Int v118 = &qword_100041038;
              sub_10000B608(v138, &qword_100041038);
              sub_10000B608(v112, &qword_100041038);
              v127((char *)v125, v115);
            }
          }
          uint64_t v128 = v156;
          sub_10000B608(v116, v118);
          uint64_t v129 = v160 + OBJC_IVAR____TtC23ActivityPickerExtension12ActivityItem__needsSecondFetch;
          swift_beginAccess();
          (*(void (**)(uint64_t, uint64_t))(v128 + 8))(v129, v157);
          LOBYTE(v161) = v120 & 1;
          sub_100031BE8();
          swift_endAccess();
        }
        else
        {
          uint64_t v121 = v135;
          (*(void (**)(char *, uint64_t, uint64_t))(v110 + 32))(v135, v58, v111);
          (*(void (**)(char *, char *, uint64_t))(v110 + 16))(v40, v121, v111);
          v132(v40, 0, 1, v111);
          uint64_t v122 = v160;
          uint64_t v123 = v160 + OBJC_IVAR____TtC23ActivityPickerExtension12ActivityItem__iconURL;
          swift_beginAccess();
          (*(void (**)(uint64_t, uint64_t))(v59 + 8))(v123, v134);
          sub_10000B5A4((uint64_t)v40, (uint64_t)v141, &qword_100040FF8);
          sub_100031BE8();
          sub_10000B608((uint64_t)v40, &qword_100040FF8);
          swift_endAccess();
          uint64_t v124 = v122 + OBJC_IVAR____TtC23ActivityPickerExtension12ActivityItem__needsSecondFetch;
          swift_beginAccess();
          (*(void (**)(uint64_t, uint64_t))(v156 + 8))(v124, v157);
          LOBYTE(v161) = 0;
          sub_100031BE8();
          swift_endAccess();
          (*(void (**)(char *, uint64_t))(v110 + 8))(v121, v111);
        }
        goto LABEL_24;
      }
      swift_bridgeObjectRelease();
    }
    BOOL v68 = v60;
    sub_100031B98();
    swift_bridgeObjectRetain_n();
    unint64_t v69 = sub_100031BA8();
    os_log_type_t v70 = sub_1000327C8();
    if (os_log_type_enabled(v69, v70))
    {
      uint64_t v71 = v65;
      uint64_t v72 = (uint8_t *)swift_slowAlloc();
      uint64_t v163 = swift_slowAlloc();
      *(_DWORD *)uint64_t v72 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v73 = v159;
      uint64_t v161 = sub_100003FD4(v159, v50, &v163);
      sub_100032858();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v69, v70, "Could not initially resolve app info for bundle identifier: %s", v72, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      uint64_t v65 = v71;
      swift_slowDealloc();

      (*(void (**)(char *, uint64_t))(v150 + 8))(v68, v151);
      uint64_t v74 = v145;
      uint64_t v75 = v144;
    }
    else
    {

      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v150 + 8))(v60, v151);
      uint64_t v74 = v145;
      uint64_t v75 = v144;
      uint64_t v73 = v159;
    }
    uint64_t v76 = v152;
    swift_beginAccess();
    uint64_t v161 = v73;
    unint64_t v162 = v50;
    sub_100031BE8();
    swift_endAccess();
    sub_100031A98();
    uint64_t v77 = v153;
    (*(void (**)(uint64_t, void, uint64_t))(v75 + 104))(v153, enum case for AppInfoSource.unknown(_:), v74);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v75 + 56))(v77, 0, 1, v74);
    uint64_t v78 = v143;
    uint64_t v79 = v143 + *(int *)(v65 + 48);
    char v80 = &qword_100041038;
    sub_10000B5A4(v76, v143, &qword_100041038);
    sub_10000B5A4(v77, v79, &qword_100041038);
    v81 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v75 + 48);
    if (v81(v78, 1, v74) == 1)
    {
      sub_10000B608(v77, &qword_100041038);
      sub_10000B608(v76, &qword_100041038);
      if (v81(v79, 1, v74) == 1)
      {
        char v82 = -1;
      }
      else
      {
        char v80 = &qword_100041030;
        char v82 = 0;
      }
    }
    else
    {
      uint64_t v83 = v142;
      sub_10000B5A4(v78, v142, &qword_100041038);
      if (v81(v79, 1, v74) == 1)
      {
        sub_10000B608(v153, &qword_100041038);
        sub_10000B608(v152, &qword_100041038);
        (*(void (**)(uint64_t, uint64_t))(v75 + 8))(v83, v74);
        char v82 = 0;
        char v80 = &qword_100041030;
      }
      else
      {
        uint64_t v89 = v140;
        (*(void (**)(char *, uint64_t, uint64_t))(v75 + 32))(v140, v79, v74);
        sub_10000B878(&qword_100041040, (void (*)(uint64_t))&type metadata accessor for AppInfoSource);
        char v82 = sub_1000325F8();
        uint64_t v90 = *(void (**)(char *, uint64_t))(v75 + 8);
        v90(v89, v74);
        char v80 = &qword_100041038;
        sub_10000B608(v153, &qword_100041038);
        sub_10000B608(v152, &qword_100041038);
        v90((char *)v83, v74);
      }
    }
    uint64_t v92 = v156;
    uint64_t v91 = v157;
    sub_10000B608(v78, v80);
    uint64_t v93 = v160 + OBJC_IVAR____TtC23ActivityPickerExtension12ActivityItem__needsSecondFetch;
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t))(v92 + 8))(v93, v91);
    LOBYTE(v161) = v82 & 1;
    sub_100031BE8();
    swift_endAccess();
LABEL_24:
    swift_beginAccess();
    LOBYTE(v161) = 1;
    sub_100031BE8();
    swift_endAccess();
    swift_release();
    return v160;
  }
  if (v52 == 1)
  {
    swift_bridgeObjectRetain();
    NSString v53 = sub_100032608();
    uint64_t v54 = sub_100009D1C((uint64_t)v53);
    if (v55)
    {
      uint64_t v56 = v54;
      unint64_t v57 = v55;
      swift_bridgeObjectRelease();
      swift_beginAccess();
      uint64_t v161 = v56;
      unint64_t v162 = v57;
    }
    else
    {
      uint64_t v84 = (uint64_t)v141;
      sub_100031B98();
      swift_bridgeObjectRetain_n();
      BOOL v85 = sub_100031BA8();
      os_log_type_t v86 = sub_1000327D8();
      if (os_log_type_enabled(v85, v86))
      {
        unint64_t v87 = v50;
        v88 = (uint8_t *)swift_slowAlloc();
        uint64_t v163 = swift_slowAlloc();
        *(_DWORD *)v88 = 136315138;
        swift_bridgeObjectRetain();
        uint64_t v161 = sub_100003FD4(v51, v87, &v163);
        sub_100032858();
        swift_bridgeObjectRelease_n();
        _os_log_impl((void *)&_mh_execute_header, v85, v86, "Failed to resolve localized name for category identifier: %s", v88, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        unint64_t v50 = v87;
        swift_slowDealloc();
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      (*(void (**)(uint64_t, uint64_t))(v150 + 8))(v84, v151);
      swift_beginAccess();
      uint64_t v161 = v51;
      unint64_t v162 = v50;
    }
    sub_100031BE8();
    swift_endAccess();
    uint64_t v94 = sub_100032638();
    uint64_t v96 = v95;
    if (v94 == sub_100032638() && v96 == v97) {
      goto LABEL_29;
    }
    char v99 = sub_100032A38();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    char v98 = 0;
    if (v99) {
      goto LABEL_32;
    }
    uint64_t v101 = sub_100032638();
    uint64_t v103 = v102;
    if (v101 == sub_100032638() && v103 == v104)
    {
LABEL_29:
      char v98 = 0;
    }
    else
    {
      char v105 = sub_100032A38();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      char v98 = 0;
      if (v105) {
        goto LABEL_32;
      }
      uint64_t v106 = sub_100032638();
      uint64_t v108 = v107;
      if (v106 == sub_100032638() && v108 == v109) {
        char v98 = 0;
      }
      else {
        char v98 = sub_100032A38() ^ 1;
      }
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_32:
    swift_beginAccess();
    LOBYTE(v161) = v98 & 1;
    sub_100031BE8();
    swift_endAccess();

    return v160;
  }
  swift_beginAccess();
  uint64_t v161 = v51;
  unint64_t v162 = v50;
  swift_bridgeObjectRetain();
  sub_100031BE8();
  swift_endAccess();
  swift_beginAccess();
  LOBYTE(v161) = 1;
  sub_100031BE8();
  swift_endAccess();
  return v160;
}

uint64_t sub_100009D1C(uint64_t a1)
{
  if (qword_100042340 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100032638();
  uint64_t v4 = v3;
  if (v2 == sub_100032638() && v4 == v5)
  {
    swift_bridgeObjectRelease_n();
    goto LABEL_11;
  }
  char v7 = sub_100032A38();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v7)
  {
LABEL_11:
    sub_100032638();
    uint64_t v10 = sub_100011680();
    swift_bridgeObjectRelease();
    return v10;
  }
  id v8 = [self localizedNameForIdentifier:a1];
  if (!v8) {
    return 0;
  }
  uint64_t v9 = v8;
  uint64_t v10 = sub_100032638();

  return v10;
}

uint64_t sub_100009E58()
{
  if (*(unsigned char *)(v0 + 16) == 1)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v1 = sub_100032A38();
    swift_bridgeObjectRelease();
    char v2 = 0;
    if ((v1 & 1) == 0) {
      return v2 & 1;
    }
  }
  uint64_t v4 = *(void *)(v0 + 24);
  uint64_t v3 = *(void *)(v0 + 32);
  if (qword_100042340 != -1) {
    swift_once();
  }
  if (v4 == sub_100032638() && v3 == v5) {
    char v2 = 1;
  }
  else {
    char v2 = sub_100032A38();
  }
  swift_bridgeObjectRelease();
  return v2 & 1;
}

uint64_t *sub_100009F68()
{
  if (qword_100042340 != -1) {
    swift_once();
  }
  return &qword_100043A50;
}

uint64_t sub_100009FB4()
{
  sub_100032678();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_100032678();

  return swift_bridgeObjectRelease();
}

UIImage sub_10000A040(void *a1)
{
  uint64_t v2 = sub_100031BB8();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v82 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100042340 != -1) {
    swift_once();
  }
  uint64_t v6 = 0x737070416C6C41;
  uint64_t v7 = sub_100032638();
  uint64_t v9 = v8;
  if (v7 == sub_100032638() && v9 == v10)
  {
    swift_bridgeObjectRelease_n();
    uint64_t v13 = (void *)0xE700000000000000;
    goto LABEL_18;
  }
  char v12 = sub_100032A38();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v12 & 1) == 0)
  {
    uint64_t v13 = (void *)0xEA00000000007974;
    uint64_t v6 = 0x6976697461657243;
    uint64_t v14 = sub_100032638();
    uint64_t v16 = v15;
    if (v14 != sub_100032638() || v16 != v17)
    {
      char v19 = sub_100032A38();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v19) {
        goto LABEL_18;
      }
      uint64_t v13 = (void *)0xE90000000000006ELL;
      uint64_t v6 = 0x6F69746163756445;
      uint64_t v20 = sub_100032638();
      uint64_t v22 = v21;
      if (v20 != sub_100032638() || v22 != v23)
      {
        char v25 = sub_100032A38();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v25) {
          goto LABEL_18;
        }
        uint64_t v13 = (void *)0xED0000746E656D6ELL;
        uint64_t v6 = 0x6961747265746E45;
        uint64_t v26 = sub_100032638();
        uint64_t v28 = v27;
        if (v26 != sub_100032638() || v28 != v29)
        {
          char v30 = sub_100032A38();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (v30) {
            goto LABEL_18;
          }
          uint64_t v6 = 0x73656D6147;
          uint64_t v31 = sub_100032638();
          uint64_t v33 = v32;
          if (v31 == sub_100032638() && v33 == v34)
          {
            swift_bridgeObjectRelease_n();
            uint64_t v13 = (void *)0xE500000000000000;
            goto LABEL_18;
          }
          char v35 = sub_100032A38();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (v35)
          {
            uint64_t v13 = (void *)0xE500000000000000;
            goto LABEL_18;
          }
          uint64_t v13 = (void *)0xED00007373656E74;
          uint64_t v6 = 0x694668746C616548;
          uint64_t v36 = sub_100032638();
          uint64_t v38 = v37;
          if (v36 != sub_100032638() || v38 != v39)
          {
            char v40 = sub_100032A38();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            if (v40) {
              goto LABEL_18;
            }
            uint64_t v41 = sub_100032638();
            uint64_t v43 = v42;
            if (v41 == sub_100032638() && v43 == v44)
            {
              swift_bridgeObjectRelease_n();
LABEL_35:
              uint64_t v6 = 0xD000000000000014;
              uint64_t v13 = (void *)0x8000000100038300;
              goto LABEL_18;
            }
            char v45 = sub_100032A38();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            if (v45) {
              goto LABEL_35;
            }
            uint64_t v46 = sub_100032638();
            uint64_t v48 = v47;
            if (v46 == sub_100032638() && v48 == v49)
            {
              swift_bridgeObjectRelease_n();
LABEL_40:
              uint64_t v13 = (void *)0xE500000000000000;
              uint64_t v6 = 0x726568744FLL;
              goto LABEL_18;
            }
            char v50 = sub_100032A38();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            if (v50) {
              goto LABEL_40;
            }
            uint64_t v13 = (void *)0xEC00000079746976;
            uint64_t v6 = 0x69746375646F7250;
            uint64_t v51 = sub_100032638();
            uint64_t v53 = v52;
            if (v51 != sub_100032638() || v53 != v54)
            {
              char v55 = sub_100032A38();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              if (v55) {
                goto LABEL_18;
              }
              uint64_t v13 = (void *)0xEF646F6F46646E41;
              uint64_t v6 = 0x676E6970706F6853;
              uint64_t v56 = sub_100032638();
              uint64_t v58 = v57;
              if (v56 != sub_100032638() || v58 != v59)
              {
                char v60 = sub_100032A38();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                if (v60) {
                  goto LABEL_18;
                }
                uint64_t v61 = sub_100032638();
                uint64_t v63 = v62;
                if (v61 == sub_100032638() && v63 == v64)
                {
                  swift_bridgeObjectRelease_n();
                }
                else
                {
                  char v65 = sub_100032A38();
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  if ((v65 & 1) == 0)
                  {
                    uint64_t v6 = 0x6C6576617254;
                    uint64_t v66 = sub_100032638();
                    uint64_t v68 = v67;
                    if (v66 == sub_100032638() && v68 == v69)
                    {
                      swift_bridgeObjectRelease_n();
                      uint64_t v13 = (void *)0xE600000000000000;
                      goto LABEL_18;
                    }
                    char v70 = sub_100032A38();
                    swift_bridgeObjectRelease();
                    swift_bridgeObjectRelease();
                    if (v70)
                    {
                      uint64_t v13 = (void *)0xE600000000000000;
                      goto LABEL_18;
                    }
                    uint64_t v6 = 0x656974696C697455;
                    uint64_t v71 = sub_100032638();
                    uint64_t v73 = v72;
                    if (v71 == sub_100032638() && v73 == v74)
                    {
                      swift_bridgeObjectRelease_n();
                      uint64_t v13 = (void *)0xE900000000000073;
                      goto LABEL_18;
                    }
                    char v75 = sub_100032A38();
                    swift_bridgeObjectRelease();
                    swift_bridgeObjectRelease();
                    if (v75)
                    {
                      uint64_t v13 = (void *)0xE900000000000073;
                      goto LABEL_18;
                    }
                    sub_100031B98();
                    id v76 = a1;
                    uint64_t v77 = sub_100031BA8();
                    os_log_type_t v78 = sub_1000327D8();
                    if (os_log_type_enabled(v77, v78))
                    {
                      uint64_t v79 = (uint8_t *)swift_slowAlloc();
                      uint64_t v83 = swift_slowAlloc();
                      *(_DWORD *)uint64_t v79 = 136315138;
                      v82[1] = v79 + 4;
                      uint64_t v80 = sub_100032638();
                      v82[2] = sub_100003FD4(v80, v81, &v83);
                      sub_100032858();

                      swift_bridgeObjectRelease();
                      _os_log_impl((void *)&_mh_execute_header, v77, v78, "Failed to resolve icon for category identifier: %s", v79, 0xCu);
                      swift_arrayDestroy();
                      swift_slowDealloc();
                      swift_slowDealloc();
                    }
                    else
                    {
                    }
                    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
                    goto LABEL_40;
                  }
                }
                uint64_t v13 = (void *)0x80000001000382E0;
                uint64_t v6 = 0xD000000000000010;
                goto LABEL_18;
              }
            }
          }
        }
      }
    }
    swift_bridgeObjectRelease_n();
    goto LABEL_18;
  }
  uint64_t v13 = (void *)0xE700000000000000;
LABEL_18:
  sub_10000B758();
  v84._countAndFlagsBits = v6;
  v84._object = v13;
  return sub_100032828(v84);
}

uint64_t sub_10000A978()
{
  swift_bridgeObjectRelease();
  uint64_t v1 = v0 + OBJC_IVAR____TtC23ActivityPickerExtension12ActivityItem__iconURL;
  uint64_t v2 = sub_100001DEC(&qword_100041000);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = v0 + OBJC_IVAR____TtC23ActivityPickerExtension12ActivityItem__localizedName;
  uint64_t v4 = sub_100001DEC(&qword_100041010);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = v0 + OBJC_IVAR____TtC23ActivityPickerExtension12ActivityItem__isDisplayable;
  uint64_t v6 = sub_100001DEC(&qword_100041020);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);
  v7(v5, v6);
  v7(v0 + OBJC_IVAR____TtC23ActivityPickerExtension12ActivityItem__needsSecondFetch, v6);
  v7(v0 + OBJC_IVAR____TtC23ActivityPickerExtension12ActivityItem__isSelected, v6);
  return v0;
}

uint64_t sub_10000AAC4()
{
  swift_bridgeObjectRelease();
  uint64_t v1 = v0 + OBJC_IVAR____TtC23ActivityPickerExtension12ActivityItem__iconURL;
  uint64_t v2 = sub_100001DEC(&qword_100041000);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = v0 + OBJC_IVAR____TtC23ActivityPickerExtension12ActivityItem__localizedName;
  uint64_t v4 = sub_100001DEC(&qword_100041010);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = v0 + OBJC_IVAR____TtC23ActivityPickerExtension12ActivityItem__isDisplayable;
  uint64_t v6 = sub_100001DEC(&qword_100041020);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);
  v7(v5, v6);
  v7(v0 + OBJC_IVAR____TtC23ActivityPickerExtension12ActivityItem__needsSecondFetch, v6);
  v7(v0 + OBJC_IVAR____TtC23ActivityPickerExtension12ActivityItem__isSelected, v6);
  uint64_t v8 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v9 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v8, v9);
}

Swift::Int sub_10000AC4C()
{
  sub_100032AB8();
  (*(void (**)(unsigned char *))(*(void *)v0 + 400))(v2);
  return sub_100032AC8();
}

uint64_t sub_10000ACB4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)v1 + 376))();
  *a1 = result;
  return result;
}

uint64_t sub_10000AD08()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 408))();
}

uint64_t sub_10000AD54()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 400))();
}

Swift::Int sub_10000ADA0()
{
  sub_100032AB8();
  (*(void (**)(unsigned char *))(**(void **)v0 + 400))(v2);
  return sub_100032AC8();
}

uint64_t sub_10000AE08(uint64_t *a1, uint64_t *a2)
{
  return sub_10000B664(*a1, *a2);
}

uint64_t sub_10000AE14@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for ActivityItem();
  uint64_t result = sub_100031BD8();
  *a1 = result;
  return result;
}

NSString sub_10000AE54()
{
  NSString result = sub_100032608();
  qword_100043A50 = (uint64_t)result;
  return result;
}

id sub_10000AE8C()
{
  if (qword_100042340 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_100043A50;

  return v0;
}

uint64_t sub_10000AEE8()
{
  id v0 = [self sharedCategories];
  id v1 = [v0 availableCategoryIDs];

  type metadata accessor for Identifier(0);
  uint64_t v2 = sub_100032708();

  if (qword_100042340 != -1) {
    swift_once();
  }
  id v3 = (id)qword_100043A50;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = (uint64_t)sub_10000B448(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v5 = *(void *)(v2 + 16);
  unint64_t v4 = *(void *)(v2 + 24);
  if (v5 >= v4 >> 1) {
    uint64_t v2 = (uint64_t)sub_10000B448((char *)(v4 > 1), v5 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v5 + 1;
  *(void *)(v2 + 8 * v5 + 32) = v3;
  return v2;
}

uint64_t sub_10000B014(uint64_t a1, uint64_t a2)
{
  return sub_10000B33C(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_10000B02C(uint64_t a1, id *a2)
{
  uint64_t result = sub_100032618();
  *a2 = 0;
  return result;
}

uint64_t sub_10000B0A4(uint64_t a1, id *a2)
{
  char v3 = sub_100032628();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_10000B124@<X0>(void *a1@<X8>)
{
  sub_100032638();
  NSString v2 = sub_100032608();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_10000B168()
{
  uint64_t v0 = sub_100032638();
  uint64_t v2 = v1;
  if (v0 == sub_100032638() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_100032A38();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_10000B1F4@<X0>(void *a1@<X8>)
{
  NSString v2 = sub_100032608();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_10000B23C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100032638();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_10000B268(uint64_t a1)
{
  uint64_t v2 = sub_10000B878(&qword_100041278, type metadata accessor for Identifier);
  uint64_t v3 = sub_10000B878(&qword_100041280, type metadata accessor for Identifier);

  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_10000B324(uint64_t a1, uint64_t a2)
{
  return sub_10000B33C(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_10000B33C(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_100032638();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_10000B380()
{
  sub_100032638();
  sub_100032678();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_10000B3D4()
{
  sub_100032638();
  sub_100032AB8();
  sub_100032678();
  Swift::Int v0 = sub_100032AC8();
  swift_bridgeObjectRelease();
  return v0;
}

char *sub_10000B448(char *result, int64_t a2, char a3, char *a4)
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
      sub_100001DEC(&qword_100041288);
      uint64_t v10 = (char *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 25;
      }
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * (v12 >> 3);
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
        if (v10 != a4 || v13 >= &a4[8 * v8 + 32]) {
          memmove(v13, a4 + 32, 8 * v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_10000BDA8(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_10000B558(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_10003D988;
  v6._object = a2;
  unint64_t v4 = sub_1000329F8(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 3) {
    return 3;
  }
  else {
    return v4;
  }
}

uint64_t sub_10000B5A4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100001DEC(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10000B608(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100001DEC(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10000B664(uint64_t a1, uint64_t a2)
{
  if (qword_100033940[*(char *)(a1 + 16)] == qword_100033940[*(char *)(a2 + 16)]
    && qword_100033958[*(char *)(a1 + 16)] == qword_100033958[*(char *)(a2 + 16)])
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    char v5 = sub_100032A38();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t result = 0;
    if ((v5 & 1) == 0) {
      return result;
    }
  }
  if (*(void *)(a1 + 24) == *(void *)(a2 + 24) && *(void *)(a1 + 32) == *(void *)(a2 + 32)) {
    return 1;
  }

  return sub_100032A38();
}

unint64_t sub_10000B758()
{
  unint64_t result = qword_100041048;
  if (!qword_100041048)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100041048);
  }
  return result;
}

void type metadata accessor for Identifier(uint64_t a1)
{
}

unint64_t sub_10000B7C4()
{
  unint64_t result = qword_100041050;
  if (!qword_100041050)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041050);
  }
  return result;
}

void *sub_10000B818()
{
  return &protocol witness table for String;
}

void *sub_10000B824()
{
  return &protocol witness table for Int;
}

uint64_t sub_10000B830()
{
  return sub_10000B878(&qword_100041058, (void (*)(uint64_t))type metadata accessor for ActivityItem);
}

uint64_t sub_10000B878(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t type metadata accessor for ActivityItem()
{
  uint64_t result = qword_1000427C0;
  if (!qword_1000427C0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10000B90C()
{
  return type metadata accessor for ActivityItem();
}

void sub_10000B914()
{
  sub_10000BA78();
  if (v0 <= 0x3F)
  {
    sub_10000BAD4(319, &qword_100041090, (uint64_t)&type metadata for String, (uint64_t (*)(void, uint64_t))&type metadata accessor for Published);
    if (v1 <= 0x3F)
    {
      sub_10000BAD4(319, (unint64_t *)&qword_100041098, (uint64_t)&type metadata for Bool, (uint64_t (*)(void, uint64_t))&type metadata accessor for Published);
      if (v2 <= 0x3F) {
        swift_updateClassMetadata2();
      }
    }
  }
}

void sub_10000BA78()
{
  if (!qword_100041088)
  {
    sub_100006B14(&qword_100040FF8);
    unint64_t v0 = sub_100031C48();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100041088);
    }
  }
}

void sub_10000BAD4(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void, uint64_t))
{
  if (!*a2)
  {
    unint64_t v5 = a4(0, a3);
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

unsigned char *initializeBufferWithCopyOfBuffer for ActivityItem.ActivityItemType(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ActivityItem.ActivityItemType(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for ActivityItem.ActivityItemType(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x10000BC88);
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

uint64_t sub_10000BCB0(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_10000BCB8(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for ActivityItem.ActivityItemType()
{
  return &type metadata for ActivityItem.ActivityItemType;
}

uint64_t sub_10000BCD0()
{
  return sub_10000B878(&qword_100041260, type metadata accessor for Identifier);
}

uint64_t sub_10000BD18()
{
  return sub_10000B878(&qword_100041268, type metadata accessor for Identifier);
}

uint64_t sub_10000BD60()
{
  return sub_10000B878(&qword_100041270, type metadata accessor for Identifier);
}

uint64_t sub_10000BDA8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 8 * a1 + 32;
    unint64_t v6 = a3 + 8 * v4;
    if (v5 >= v6 || v5 + 8 * v4 <= a3)
    {
      type metadata accessor for Identifier(0);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_1000329D8();
  __break(1u);
  return result;
}

uint64_t sub_10000BEB4()
{
  if (*v0)
  {
    return swift_retain();
  }
  else
  {
    type metadata accessor for ActivityProvider();
    sub_1000101A8(&qword_100041290, (void (*)(uint64_t))type metadata accessor for ActivityProvider);
    uint64_t result = sub_100031E58();
    __break(1u);
  }
  return result;
}

uint64_t sub_10000BF40()
{
  return sub_10000C0E4((void (*)(void))type metadata accessor for ActivityProvider, &qword_100041290, (void (*)(uint64_t))type metadata accessor for ActivityProvider);
}

uint64_t sub_10000BF88()
{
  type metadata accessor for ActivityProvider();
  sub_1000101A8(&qword_100041290, (void (*)(uint64_t))type metadata accessor for ActivityProvider);

  return sub_100031E48();
}

uint64_t sub_10000C010()
{
  if (*(void *)(v0 + 16))
  {
    return swift_retain();
  }
  else
  {
    type metadata accessor for ActivityGroup();
    sub_1000101A8(&qword_100041298, (void (*)(uint64_t))type metadata accessor for ActivityGroup);
    uint64_t result = sub_100031E58();
    __break(1u);
  }
  return result;
}

uint64_t sub_10000C09C()
{
  return sub_10000C0E4((void (*)(void))type metadata accessor for ActivityGroup, &qword_100041298, (void (*)(uint64_t))type metadata accessor for ActivityGroup);
}

uint64_t sub_10000C0E4(void (*a1)(void), unint64_t *a2, void (*a3)(uint64_t))
{
  a1(0);
  sub_1000101A8(a2, a3);

  return sub_100031E78();
}

uint64_t sub_10000C150()
{
  type metadata accessor for ActivityGroup();
  sub_1000101A8(&qword_100041298, (void (*)(uint64_t))type metadata accessor for ActivityGroup);

  return sub_100031E48();
}

uint64_t sub_10000C1D8()
{
  return *(unsigned __int8 *)(v0 + 32);
}

uint64_t sub_10000C1E0(uint64_t result)
{
  *(unsigned char *)(v1 + 32) = result;
  return result;
}

uint64_t (*sub_10000C1E8())()
{
  return nullsub_1;
}

uint64_t sub_10000C208()
{
  sub_100032498();
  return v1;
}

uint64_t sub_10000C244@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v45 = a1;
  uint64_t v41 = type metadata accessor for FCDisclosureGroupStyle();
  uint64_t v3 = __chkstk_darwin(v41);
  unint64_t v5 = (BOOL *)&v36 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v40 = (uint64_t)&v36 - v6;
  uint64_t v39 = sub_100001DEC(&qword_1000412A0);
  uint64_t v37 = *(void *)(v39 - 8);
  __chkstk_darwin(v39);
  int v8 = (char *)&v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100001DEC(&qword_1000412A8);
  uint64_t v43 = *(void *)(v9 - 8);
  uint64_t v44 = v9;
  __chkstk_darwin(v9);
  uint64_t v42 = (char *)&v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v36 = sub_100001DEC(&qword_1000412B0);
  __chkstk_darwin(v36);
  uint64_t v38 = (char *)&v36 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v47 = *(_OWORD *)(v1 + 40);
  sub_100001DEC(&qword_1000412B8);
  sub_1000324C8();
  uint64_t v12 = swift_allocObject();
  long long v13 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)(v12 + 16) = *(_OWORD *)v1;
  *(_OWORD *)(v12 + 32) = v13;
  *(_OWORD *)(v12 + 48) = *(_OWORD *)(v1 + 32);
  *(void *)(v12 + 64) = *(void *)(v1 + 48);
  uint64_t v46 = v1;
  sub_10000D724(v1);
  sub_100001DEC(&qword_1000412C0);
  sub_100001DEC(&qword_1000412C8);
  sub_100010310(&qword_1000412D0, &qword_1000412C0);
  sub_10000D770();
  sub_100031DD8();
  uint64_t v14 = *(void *)(v1 + 16);
  if (v14)
  {
    uint64_t v15 = *(uint64_t (**)(uint64_t))(*(void *)v14 + 112);
    uint64_t v16 = swift_retain();
    uint64_t v17 = v15(v16);
    uint64_t v18 = swift_release();
    char v19 = (*(uint64_t (**)(uint64_t))(*(void *)v17 + 392))(v18);
    swift_release();
    uint64_t v20 = *(uint64_t (**)(uint64_t))(*(void *)v14 + 160);
    uint64_t v21 = swift_retain();
    unint64_t v22 = v20(v21);
    swift_release();
    if (v22 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v23 = sub_1000329A8();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v23 = *(void *)((v22 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    uint64_t v25 = v44;
    uint64_t v24 = v45;
    uint64_t v26 = v43;
    swift_bridgeObjectRelease();
    uint64_t v27 = (uint64_t *)&v5[*(int *)(v41 + 24)];
    *uint64_t v27 = swift_getKeyPath();
    sub_100001DEC(&qword_100041310);
    swift_storeEnumTagMultiPayload();
    *unint64_t v5 = (v19 & 1) == 0;
    v5[1] = v23 == 0;
    uint64_t v28 = v40;
    sub_10000D8B0((uint64_t)v5, v40);
    sub_100010310(&qword_100041318, &qword_1000412A0);
    sub_1000101A8(&qword_100041320, (void (*)(uint64_t))type metadata accessor for FCDisclosureGroupStyle);
    uint64_t v29 = v42;
    uint64_t v30 = v39;
    sub_100032358();
    sub_10000FE98(v28, (uint64_t (*)(void))type metadata accessor for FCDisclosureGroupStyle);
    (*(void (**)(char *, uint64_t))(v37 + 8))(v8, v30);
    uint64_t v31 = swift_allocObject();
    long long v32 = *(_OWORD *)(v2 + 16);
    *(_OWORD *)(v31 + 16) = *(_OWORD *)v2;
    *(_OWORD *)(v31 + 32) = v32;
    *(_OWORD *)(v31 + 48) = *(_OWORD *)(v2 + 32);
    *(void *)(v31 + 64) = *(void *)(v2 + 48);
    uint64_t v33 = (uint64_t)v38;
    (*(void (**)(char *, char *, uint64_t))(v26 + 16))(v38, v29, v25);
    uint64_t v34 = (uint64_t (**)())(v33 + *(int *)(v36 + 36));
    *uint64_t v34 = sub_10000D918;
    v34[1] = (uint64_t (*)())v31;
    v34[2] = 0;
    v34[3] = 0;
    sub_10000D724(v2);
    (*(void (**)(char *, uint64_t))(v26 + 8))(v29, v25);
    return sub_10000FEF8(v33, v24, &qword_1000412B0);
  }
  else
  {
    type metadata accessor for ActivityGroup();
    sub_1000101A8(&qword_100041298, (void (*)(uint64_t))type metadata accessor for ActivityGroup);
    uint64_t result = sub_100031E58();
    __break(1u);
  }
  return result;
}

uint64_t sub_10000C890@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_1000320E8();
  __chkstk_darwin(v4);
  uint64_t v5 = sub_100001DEC(&qword_1000412F8);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  int v8 = &v28[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v9 = sub_100001DEC(&qword_1000412E8);
  uint64_t v10 = v9 - 8;
  __chkstk_darwin(v9);
  uint64_t v12 = &v28[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_100032018();
  uint64_t v29 = a1;
  int v30 = 0;
  sub_1000101A8(&qword_100041460, (void (*)(uint64_t))&type metadata accessor for PinnedScrollableViews);
  sub_100032AD8();
  sub_100001DEC(&qword_100041498);
  sub_1000100EC();
  sub_100031C78();
  char v13 = sub_100032218();
  sub_100031C68();
  uint64_t v15 = v14;
  uint64_t v17 = v16;
  uint64_t v19 = v18;
  uint64_t v21 = v20;
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v6 + 16))(v12, v8, v5);
  unint64_t v22 = &v12[*(int *)(v10 + 44)];
  *unint64_t v22 = v13;
  *((void *)v22 + 1) = v15;
  *((void *)v22 + 2) = v17;
  *((void *)v22 + 3) = v19;
  *((void *)v22 + 4) = v21;
  v22[40] = 0;
  (*(void (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
  id v23 = [self tertiarySystemGroupedBackgroundColor];
  sub_1000323C8();
  uint64_t v24 = sub_100032408();
  swift_release();
  char v25 = sub_100032208();
  sub_10000B5A4((uint64_t)v12, a2, &qword_1000412E8);
  uint64_t v26 = a2 + *(int *)(sub_100001DEC(&qword_1000412C8) + 36);
  *(void *)uint64_t v26 = v24;
  *(unsigned char *)(v26 + 8) = v25;
  return sub_10000B608((uint64_t)v12, &qword_1000412E8);
}

uint64_t sub_10000CB98@<X0>(void *a1@<X8>)
{
  sub_100001DEC(&qword_100041490);
  sub_1000101A8(&qword_1000414A8, (void (*)(uint64_t))type metadata accessor for ActivityItem);
  uint64_t result = sub_100032538();
  *a1 = v3;
  return result;
}

uint64_t sub_10000CC38@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v21 = a2;
  uint64_t v22 = a3;
  uint64_t v4 = type metadata accessor for ActivitySelectableRow(0);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100001DEC(&qword_100041468);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = a1[1];
  uint64_t v12 = a1[2];
  uint64_t v26 = *a1;
  uint64_t v10 = v26;
  uint64_t v27 = v11;
  uint64_t v28 = v12;
  sub_100001DEC(&qword_100041490);
  sub_100032508();
  swift_getKeyPath();
  uint64_t v26 = v10;
  uint64_t v27 = v11;
  uint64_t v28 = v12;
  swift_retain();
  swift_retain();
  swift_retain();
  sub_100032518();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v13 = v23;
  uint64_t v14 = v24;
  LOBYTE(v10) = v25;
  char v15 = sub_10000815C();
  sub_10001E1C0(v13, v14, v10, 0, 1, 1, v15 & 1, (uint64_t)v6);
  uint64_t v16 = *v21;
  if (*v21)
  {
    type metadata accessor for ActivityProvider();
    sub_1000101A8(&qword_100041290, (void (*)(uint64_t))type metadata accessor for ActivityProvider);
    swift_retain();
    uint64_t v17 = sub_100031BC8();
    sub_10000FE30((uint64_t)v6, (uint64_t)v9, type metadata accessor for ActivitySelectableRow);
    uint64_t v18 = (uint64_t *)&v9[*(int *)(v7 + 36)];
    *uint64_t v18 = v17;
    v18[1] = v16;
    sub_10000FE98((uint64_t)v6, type metadata accessor for ActivitySelectableRow);
    return sub_10000FEF8((uint64_t)v9, v22, &qword_100041468);
  }
  else
  {
    type metadata accessor for ActivityProvider();
    sub_1000101A8(&qword_100041290, (void (*)(uint64_t))type metadata accessor for ActivityProvider);
    uint64_t result = sub_100031E58();
    __break(1u);
  }
  return result;
}

uint64_t sub_10000CEF0()
{
  uint64_t v0 = sub_1000320E8();
  __chkstk_darwin(v0);
  sub_100032018();
  sub_1000101A8(&qword_100041460, (void (*)(uint64_t))&type metadata accessor for PinnedScrollableViews);
  sub_100032AD8();
  sub_100001DEC(&qword_100041468);
  sub_10000FD60();
  return sub_100031C78();
}

uint64_t sub_10000D020@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v31 = a2;
  uint64_t v3 = type metadata accessor for ActivitySelectableRow(0);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = sub_100001DEC(&qword_100041468);
  __chkstk_darwin(v30);
  uint64_t v7 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *(void *)(a1 + 16);
  if (v8)
  {
    uint64_t v9 = *(uint64_t (**)(uint64_t))(*(void *)v8 + 112);
    uint64_t v10 = swift_retain();
    uint64_t v29 = v9(v10);
    swift_release();
    type metadata accessor for ActivityGroup();
    sub_1000101A8(&qword_100041298, (void (*)(uint64_t))type metadata accessor for ActivityGroup);
    sub_100031E48();
    swift_getKeyPath();
    sub_100031E68();
    swift_release();
    swift_release();
    uint64_t v11 = v38;
    uint64_t v12 = v39;
    uint64_t v13 = v40;
    swift_getKeyPath();
    *(void *)&long long v33 = v11;
    *((void *)&v33 + 1) = v12;
    uint64_t v34 = v13;
    sub_100001DEC(&qword_100041490);
    sub_100032518();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    uint64_t v14 = v35;
    uint64_t v15 = v36;
    char v16 = v37;
    uint64_t v17 = *(uint64_t (**)(uint64_t))(*(void *)v8 + 208);
    uint64_t v18 = swift_retain();
    uint64_t v19 = v17(v18);
    char v21 = v20;
    swift_release();
    char v22 = v21 & 1;
    if (*(unsigned char *)(a1 + 32))
    {
      char v23 = 1;
    }
    else
    {
      long long v33 = *(_OWORD *)(a1 + 40);
      sub_100001DEC(&qword_1000412B8);
      sub_1000324A8();
      char v23 = v32;
    }
    char v24 = sub_10000815C();
    sub_10001E1C0(v14, v15, v16, v19, v22, v23, v24 & 1, (uint64_t)v5);
    uint64_t v25 = *(void *)a1;
    if (*(void *)a1)
    {
      type metadata accessor for ActivityProvider();
      sub_1000101A8(&qword_100041290, (void (*)(uint64_t))type metadata accessor for ActivityProvider);
      swift_retain();
      uint64_t v26 = sub_100031BC8();
      sub_10000FE30((uint64_t)v5, (uint64_t)v7, type metadata accessor for ActivitySelectableRow);
      uint64_t v27 = (uint64_t *)&v7[*(int *)(v30 + 36)];
      *uint64_t v27 = v26;
      v27[1] = v25;
      sub_10000FE98((uint64_t)v5, type metadata accessor for ActivitySelectableRow);
      return sub_10000FEF8((uint64_t)v7, v31, &qword_100041468);
    }
  }
  else
  {
    type metadata accessor for ActivityGroup();
    sub_1000101A8(&qword_100041298, (void (*)(uint64_t))type metadata accessor for ActivityGroup);
    sub_100031E58();
    __break(1u);
  }
  type metadata accessor for ActivityProvider();
  sub_1000101A8(&qword_100041290, (void (*)(uint64_t))type metadata accessor for ActivityProvider);
  uint64_t result = sub_100031E58();
  __break(1u);
  return result;
}

uint64_t sub_10000D448@<X0>(char a1@<W0>, char a2@<W1>, unsigned char *a3@<X8>)
{
  uint64_t v6 = (uint64_t *)&a3[*(int *)(type metadata accessor for FCDisclosureGroupStyle() + 24)];
  *uint64_t v6 = swift_getKeyPath();
  sub_100001DEC(&qword_100041310);
  uint64_t result = swift_storeEnumTagMultiPayload();
  *a3 = a1 ^ 1;
  a3[1] = a2;
  return result;
}

uint64_t sub_10000D4C0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, uint64_t a6@<X8>)
{
  uint64_t result = sub_100032498();
  *(void *)a6 = a1;
  *(void *)(a6 + 8) = a2;
  *(void *)(a6 + 16) = a3;
  *(void *)(a6 + 24) = a4;
  *(unsigned char *)(a6 + 32) = a5;
  *(unsigned char *)(a6 + 40) = v13;
  *(void *)(a6 + 48) = v14;
  return result;
}

uint64_t sub_10000D548()
{
  return sub_100032328();
}

uint64_t sub_10000D564@<X0>(uint64_t a1@<X8>)
{
  return sub_10000C244(a1);
}

uint64_t sub_10000D5A8()
{
  return *v0;
}

uint64_t sub_10000D5B0()
{
  return *(unsigned __int8 *)(v0 + 1);
}

uint64_t sub_10000D5B8@<X0>(uint64_t *a1@<X8>)
{
  *a1 = swift_getKeyPath();
  sub_100001DEC(&qword_100041310);

  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_10000D610()
{
  return sub_100031EB8();
}

uint64_t sub_10000D634(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_10000FBD8(a1, a2, a3, a4, (void (*)(void))&type metadata accessor for ColorScheme, (uint64_t (*)(char *))&EnvironmentValues.colorScheme.setter);
}

uint64_t sub_10000D660@<X0>(_WORD *a1@<X8>)
{
  uint64_t v2 = (uint64_t *)((char *)a1 + *(int *)(type metadata accessor for FCDisclosureGroupStyle() + 24));
  uint64_t *v2 = swift_getKeyPath();
  sub_100001DEC(&qword_100041310);
  uint64_t result = swift_storeEnumTagMultiPayload();
  *a1 = 1;
  return result;
}

uint64_t type metadata accessor for FCDisclosureGroupStyle()
{
  uint64_t result = qword_100042BE0;
  if (!qword_100042BE0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10000D714@<X0>(uint64_t a1@<X8>)
{
  return sub_10000C890(v1 + 16, a1);
}

uint64_t sub_10000D71C()
{
  return sub_10000CEF0();
}

uint64_t sub_10000D724(uint64_t a1)
{
  return a1;
}

unint64_t sub_10000D770()
{
  unint64_t result = qword_1000412D8;
  if (!qword_1000412D8)
  {
    sub_100006B14(&qword_1000412C8);
    sub_10000D810();
    sub_100010310(&qword_100041300, &qword_100041308);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000412D8);
  }
  return result;
}

unint64_t sub_10000D810()
{
  unint64_t result = qword_1000412E0;
  if (!qword_1000412E0)
  {
    sub_100006B14(&qword_1000412E8);
    sub_100010310(&qword_1000412F0, &qword_1000412F8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000412E0);
  }
  return result;
}

uint64_t sub_10000D8B0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for FCDisclosureGroupStyle();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000D918()
{
  uint64_t v1 = *(uint64_t **)(v0 + 32);
  if (!v1) {
    goto LABEL_10;
  }
  uint64_t v2 = *(uint64_t (**)(uint64_t))(*v1 + 112);
  uint64_t v3 = swift_retain();
  uint64_t v4 = v2(v3);
  uint64_t v5 = swift_release();
  LOBYTE(v2) = (*(uint64_t (**)(uint64_t))(*(void *)v4 + 328))(v5);
  swift_release();
  uint64_t v6 = *v1;
  if ((v2 & 1) == 0)
  {
    uint64_t v10 = *(uint64_t (**)(uint64_t))(v6 + 272);
    uint64_t v11 = swift_retain();
    uint64_t v12 = v10(v11);
    uint64_t v14 = v13;
    swift_release();
    uint64_t v15 = *(void *)(v12 + 16);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v16 = *(void *)(v14 + 16);
    swift_bridgeObjectRelease();
    BOOL v17 = __OFADD__(v15, v16);
    uint64_t v18 = v15 + v16;
    if (!v17)
    {
      uint64_t v19 = *(void (**)(uint64_t, BOOL))(*v1 + 216);
      swift_retain();
      v19(v18, v18 == 0);
      goto LABEL_6;
    }
    __break(1u);
LABEL_10:
    type metadata accessor for ActivityGroup();
    sub_1000101A8(&qword_100041298, (void (*)(uint64_t))type metadata accessor for ActivityGroup);
    uint64_t result = sub_100031E58();
    __break(1u);
    return result;
  }
  uint64_t v7 = *(uint64_t (**)(uint64_t))(v6 + 112);
  uint64_t v8 = swift_retain();
  uint64_t v9 = *(void *)v7(v8);
  LOBYTE(v7) = (*(uint64_t (**)(void))(v9 + 392))();
  swift_release();
  (*(void (**)(BOOL, uint64_t))(*v1 + 216))((v7 & 1) == 0, 1);
LABEL_6:

  return swift_release();
}

uint64_t sub_10000DBA4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = sub_100032018();
  *(void *)(a2 + 8) = 0;
  *(unsigned char *)(a2 + 16) = 0;
  uint64_t v5 = sub_100001DEC(&qword_100041328);
  return sub_10000DBFC(a1, v2, (char *)(a2 + *(int *)(v5 + 44)));
}

uint64_t sub_10000DBFC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X8>)
{
  uint64_t v70 = a2;
  uint64_t v63 = a3;
  uint64_t v4 = sub_1000321C8();
  uint64_t v56 = *(void *)(v4 - 8);
  uint64_t v57 = v4;
  __chkstk_darwin(v4);
  uint64_t v58 = (char *)&v55 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v62 = sub_100001DEC(&qword_1000413E0);
  uint64_t v60 = *(void *)(v62 - 8);
  __chkstk_darwin(v62);
  char v55 = (char *)&v55 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for FCDisclosureGroupStyle();
  __chkstk_darwin(v7 - 8);
  uint64_t v67 = (char *)&v55 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100001DEC(&qword_1000413E8);
  uint64_t v10 = __chkstk_darwin(v9 - 8);
  uint64_t v61 = (char *)&v55 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v59 = (char *)&v55 - v12;
  uint64_t v68 = sub_1000321E8();
  uint64_t v13 = *(void *)(v68 - 8);
  uint64_t v14 = *(void *)(v13 + 64);
  __chkstk_darwin(v68);
  uint64_t v15 = (char *)&v55 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_100001DEC(&qword_1000413F0);
  __chkstk_darwin(v16 - 8);
  uint64_t v18 = (char *)&v55 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_100001DEC(&qword_1000413F8);
  uint64_t v64 = v19;
  __chkstk_darwin(v19);
  uint64_t v21 = (uint64_t)&v55 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = sub_100001DEC(&qword_100041400);
  uint64_t v66 = *(void **)(v22 - 8);
  uint64_t v23 = __chkstk_darwin(v22);
  uint64_t v69 = (char *)&v55 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = __chkstk_darwin(v23);
  char v65 = (char *)&v55 - v26;
  __chkstk_darwin(v25);
  uint64_t v28 = (char *)&v55 - v27;
  *(void *)uint64_t v18 = sub_100031F98();
  *((void *)v18 + 1) = 0;
  v18[16] = 1;
  uint64_t v29 = sub_100001DEC(&qword_100041408);
  sub_10000E334(v70, &v18[*(int *)(v29 + 44)]);
  sub_10000B5A4((uint64_t)v18, v21, &qword_1000413F0);
  *(unsigned char *)(v21 + *(int *)(v19 + 36)) = 0;
  sub_10000B608((uint64_t)v18, &qword_1000413F0);
  uint64_t v30 = v68;
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v15, a1, v68);
  unint64_t v31 = (*(unsigned __int8 *)(v13 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  unint64_t v32 = swift_allocObject() + v31;
  uint64_t v34 = v66;
  uint64_t v33 = (uint64_t)v67;
  (*(void (**)(unint64_t, char *, uint64_t))(v13 + 32))(v32, v15, v30);
  sub_10000F7C8();
  uint64_t v35 = v65;
  sub_100032318();
  swift_release();
  sub_10000B608(v21, &qword_1000413F8);
  uint64_t v36 = (void (*)(char *, char *, uint64_t))v34[4];
  uint64_t v68 = (uint64_t)v28;
  char v65 = (char *)v22;
  v36(v28, v35, v22);
  LOBYTE(v21) = sub_100032198();
  sub_10000FE30(v70, v33, (uint64_t (*)(void))type metadata accessor for FCDisclosureGroupStyle);
  if (v21)
  {
    char v37 = v58;
    char v38 = *(unsigned char *)(v33 + 1);
    sub_10000FE98(v33, (uint64_t (*)(void))type metadata accessor for FCDisclosureGroupStyle);
    uint64_t v39 = v62;
    uint64_t v40 = v63;
    uint64_t v41 = v60;
    uint64_t v42 = (uint64_t)v61;
    uint64_t v43 = (uint64_t)v59;
    if (v38)
    {
      uint64_t v44 = 1;
    }
    else
    {
      sub_1000321D8();
      uint64_t v70 = sub_100031D28();
      uint64_t v45 = (uint64_t)v55;
      uint64_t v46 = v56;
      uint64_t v47 = v57;
      (*(void (**)(char *, char *, uint64_t))(v56 + 16))(v55, v37, v57);
      *(void *)(v45 + *(int *)(v39 + 36)) = v70;
      (*(void (**)(char *, uint64_t))(v46 + 8))(v37, v47);
      sub_10000FEF8(v45, v43, &qword_1000413E0);
      uint64_t v44 = 0;
    }
  }
  else
  {
    sub_10000FE98(v33, (uint64_t (*)(void))type metadata accessor for FCDisclosureGroupStyle);
    uint64_t v44 = 1;
    uint64_t v39 = v62;
    uint64_t v40 = v63;
    uint64_t v41 = v60;
    uint64_t v42 = (uint64_t)v61;
    uint64_t v43 = (uint64_t)v59;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v41 + 56))(v43, v44, 1, v39);
  uint64_t v48 = (void (*)(char *, uint64_t, char *))v34[2];
  uint64_t v50 = v68;
  uint64_t v49 = v69;
  uint64_t v51 = v65;
  v48(v69, v68, v65);
  sub_10000B5A4(v43, v42, &qword_1000413E8);
  v48(v40, (uint64_t)v49, v51);
  uint64_t v52 = sub_100001DEC(&qword_100041430);
  sub_10000B5A4(v42, (uint64_t)&v40[*(int *)(v52 + 48)], &qword_1000413E8);
  sub_10000B608(v43, &qword_1000413E8);
  uint64_t v53 = (void (*)(uint64_t, char *))v34[1];
  v53(v50, v51);
  sub_10000B608(v42, &qword_1000413E8);
  return ((uint64_t (*)(char *, char *))v53)(v49, v51);
}

uint64_t sub_10000E2FC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000E318()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000E334@<X0>(uint64_t a1@<X1>, char *a2@<X8>)
{
  uint64_t v73 = a1;
  v88 = a2;
  uint64_t v2 = sub_100031CA8();
  uint64_t v86 = *(void *)(v2 - 8);
  uint64_t v87 = v2;
  uint64_t v3 = __chkstk_darwin(v2);
  BOOL v85 = (char *)&v73 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v83 = (uint64_t)&v73 - v5;
  uint64_t v6 = sub_100001DEC(&qword_100041438);
  uint64_t v7 = v6 - 8;
  __chkstk_darwin(v6);
  uint64_t v9 = (uint64_t *)((char *)&v73 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v10 = sub_100032468();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v73 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_100001DEC(&qword_100041440);
  uint64_t v15 = v14 - 8;
  __chkstk_darwin(v14);
  uint64_t v17 = (double *)((char *)&v73 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v75 = sub_100001DEC(&qword_100041448) - 8;
  __chkstk_darwin(v75);
  uint64_t v74 = (uint64_t)&v73 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v82 = sub_100001DEC(&qword_100041450) - 8;
  uint64_t v19 = __chkstk_darwin(v82);
  uint64_t v84 = (uint64_t)&v73 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = __chkstk_darwin(v19);
  uint64_t v78 = (uint64_t)&v73 - v22;
  __chkstk_darwin(v21);
  uint64_t v80 = (uint64_t)&v73 - v23;
  uint64_t v81 = sub_1000321A8();
  uint64_t v79 = *(void *)(v81 - 8);
  uint64_t v24 = __chkstk_darwin(v81);
  uint64_t v77 = (char *)&v73 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v24);
  id v76 = (char *)&v73 - v26;
  sub_1000321B8();
  uint64_t v27 = sub_100032448();
  if (sub_100032198()) {
    double v28 = 1.57079633;
  }
  else {
    double v28 = 0.0;
  }
  sub_1000325B8();
  uint64_t v30 = v29;
  uint64_t v32 = v31;
  char v33 = sub_100032228();
  sub_100031C68();
  uint64_t v35 = v34;
  uint64_t v37 = v36;
  uint64_t v39 = v38;
  uint64_t v41 = v40;
  (*(void (**)(char *, void, uint64_t))(v11 + 104))(v13, enum case for Image.Scale.small(_:), v10);
  uint64_t KeyPath = swift_getKeyPath();
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))((char *)v9 + *(int *)(v7 + 36), v13, v10);
  *uint64_t v9 = KeyPath;
  sub_10000B5A4((uint64_t)v9, (uint64_t)v17 + *(int *)(v15 + 44), &qword_100041438);
  *(void *)uint64_t v17 = v27;
  v17[1] = v28;
  *((void *)v17 + 2) = v30;
  *((void *)v17 + 3) = v32;
  *((unsigned char *)v17 + 32) = v33;
  *((void *)v17 + 5) = v35;
  *((void *)v17 + 6) = v37;
  *((void *)v17 + 7) = v39;
  *((void *)v17 + 8) = v41;
  *((unsigned char *)v17 + 72) = 0;
  swift_retain();
  sub_10000B608((uint64_t)v9, &qword_100041438);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  swift_release();
  sub_100032248();
  sub_100032258();
  uint64_t v43 = sub_100032268();
  swift_release();
  uint64_t v44 = swift_getKeyPath();
  uint64_t v45 = v74;
  sub_10000B5A4((uint64_t)v17, v74, &qword_100041440);
  uint64_t v46 = (uint64_t *)(v45 + *(int *)(v75 + 44));
  *uint64_t v46 = v44;
  v46[1] = v43;
  sub_10000B608((uint64_t)v17, &qword_100041440);
  type metadata accessor for FCDisclosureGroupStyle();
  uint64_t v47 = v83;
  sub_10000F8F8(v83);
  uint64_t v48 = v85;
  uint64_t v49 = v86;
  uint64_t v50 = v87;
  (*(void (**)(char *, void, uint64_t))(v86 + 104))(v85, enum case for ColorScheme.dark(_:), v87);
  uint64_t v51 = v48;
  LOBYTE(v48) = sub_100031C98();
  uint64_t v52 = *(void (**)(char *, uint64_t))(v49 + 8);
  v52(v51, v50);
  v52((char *)v47, v50);
  uint64_t v53 = self;
  uint64_t v54 = &selRef_systemGray2Color;
  if ((v48 & 1) == 0) {
    uint64_t v54 = &selRef_systemGray4Color;
  }
  id v55 = objc_msgSend(v53, *v54, v73);
  uint64_t v56 = sub_1000323C8();
  uint64_t v57 = swift_getKeyPath();
  uint64_t v58 = v78;
  sub_10000B5A4(v45, v78, &qword_100041448);
  uint64_t v59 = (uint64_t *)(v58 + *(int *)(v82 + 44));
  *uint64_t v59 = v57;
  v59[1] = v56;
  sub_10000B608(v45, &qword_100041448);
  uint64_t v60 = v80;
  sub_10000FEF8(v58, v80, &qword_100041450);
  uint64_t v61 = v79;
  uint64_t v62 = *(void (**)(char *, char *, uint64_t))(v79 + 16);
  uint64_t v63 = v77;
  uint64_t v64 = v76;
  uint64_t v65 = v81;
  v62(v77, v76, v81);
  char v89 = 0;
  uint64_t v66 = v84;
  sub_10000B5A4(v60, v84, &qword_100041450);
  uint64_t v67 = v88;
  v62(v88, v63, v65);
  uint64_t v68 = sub_100001DEC(&qword_100041458);
  uint64_t v69 = &v67[*(int *)(v68 + 48)];
  char v70 = v89;
  *(void *)uint64_t v69 = 0;
  v69[8] = v70;
  sub_10000B5A4(v66, (uint64_t)&v67[*(int *)(v68 + 64)], &qword_100041450);
  sub_10000B608(v60, &qword_100041450);
  uint64_t v71 = *(void (**)(char *, uint64_t))(v61 + 8);
  v71(v64, v65);
  sub_10000B608(v66, &qword_100041450);
  return ((uint64_t (*)(char *, uint64_t))v71)(v63, v65);
}

uint64_t initializeBufferWithCopyOfBuffer for ActivityDisclosureGroup(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for ActivityDisclosureGroup()
{
  swift_release();
  swift_release();

  return swift_release();
}

uint64_t initializeWithCopy for ActivityDisclosureGroup(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for ActivityDisclosureGroup(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_retain();
  swift_release();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_retain();
  swift_release();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_retain();
  swift_release();
  return a1;
}

__n128 initializeWithTake for ActivityDisclosureGroup(uint64_t a1, uint64_t a2)
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

uint64_t assignWithTake for ActivityDisclosureGroup(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_release();
  uint64_t v4 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v4;
  swift_release();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for ActivityDisclosureGroup(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 56)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ActivityDisclosureGroup(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 56) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 56) = 0;
    }
    if (a2) {
      *(void *)__n128 result = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ActivityDisclosureGroup()
{
  return &type metadata for ActivityDisclosureGroup;
}

uint64_t *sub_10000ED98(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *uint64_t v3 = *a2;
    uint64_t v3 = (uint64_t *)(v9 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    *(_WORD *)a1 = *(_WORD *)a2;
    uint64_t v5 = *(int *)(a3 + 24);
    uint64_t v6 = (uint64_t *)((char *)a1 + v5);
    uint64_t v7 = (uint64_t *)((char *)a2 + v5);
    sub_100001DEC(&qword_100041310);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v8 = sub_100031CA8();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v8 - 8) + 16))(v6, v7, v8);
    }
    else
    {
      *uint64_t v6 = *v7;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return v3;
}

uint64_t sub_10000EEB4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a1 + *(int *)(a2 + 24);
  sub_100001DEC(&qword_100041310);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v3 = sub_100031CA8();
    int v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);
    return v4(v2, v3);
  }
  else
  {
    return swift_release();
  }
}

_WORD *sub_10000EF5C(_WORD *a1, _WORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 24);
  uint64_t v5 = (void *)((char *)a1 + v4);
  uint64_t v6 = (void *)((char *)a2 + v4);
  sub_100001DEC(&qword_100041310);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_100031CA8();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(v5, v6, v7);
  }
  else
  {
    *uint64_t v5 = *v6;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

unsigned char *sub_10000F020(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  if (a1 != a2)
  {
    uint64_t v4 = *(int *)(a3 + 24);
    uint64_t v5 = &a1[v4];
    uint64_t v6 = &a2[v4];
    sub_10000B608((uint64_t)&a1[v4], &qword_100041310);
    sub_100001DEC(&qword_100041310);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_100031CA8();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(v5, v6, v7);
    }
    else
    {
      *uint64_t v5 = *v6;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

_WORD *sub_10000F104(_WORD *a1, _WORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 24);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_100001DEC(&qword_100041310);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v8 = sub_100031CA8();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 32))(v5, v6, v8);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v5, v6, *(void *)(*(void *)(v7 - 8) + 64));
  }
  return a1;
}

unsigned char *sub_10000F1D8(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  if (a1 != a2)
  {
    uint64_t v4 = *(int *)(a3 + 24);
    uint64_t v5 = &a1[v4];
    uint64_t v6 = &a2[v4];
    sub_10000B608((uint64_t)&a1[v4], &qword_100041310);
    uint64_t v7 = sub_100001DEC(&qword_100041310);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v8 = sub_100031CA8();
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v8 - 8) + 32))(v5, v6, v8);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v5, v6, *(void *)(*(void *)(v7 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_10000F2CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10000F2E0);
}

uint64_t sub_10000F2E0(unsigned __int8 *a1, uint64_t a2, uint64_t a3)
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
    uint64_t v10 = sub_100001DEC(&qword_100041330);
    uint64_t v11 = *(uint64_t (**)(unsigned __int8 *, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48);
    uint64_t v12 = v10;
    uint64_t v13 = &a1[*(int *)(a3 + 24)];
    return v11(v13, a2, v12);
  }
}

uint64_t sub_10000F394(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10000F3A8);
}

unsigned char *sub_10000F3A8(unsigned char *result, uint64_t a2, int a3, uint64_t a4)
{
  BOOL v5 = result;
  if (a3 == 254)
  {
    *__n128 result = a2 + 1;
  }
  else
  {
    uint64_t v7 = sub_100001DEC(&qword_100041330);
    uint64_t v8 = *(uint64_t (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = &v5[*(int *)(a4 + 24)];
    return (unsigned char *)v8(v10, a2, a2, v9);
  }
  return result;
}

void sub_10000F450()
{
  sub_10000F4E8();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_10000F4E8()
{
  if (!qword_100041390)
  {
    sub_100031CA8();
    unint64_t v0 = sub_100031CB8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100041390);
    }
  }
}

unint64_t sub_10000F544()
{
  unint64_t result = qword_1000413C8;
  if (!qword_1000413C8)
  {
    sub_100006B14(&qword_1000412B0);
    sub_100006B14(&qword_1000412A0);
    type metadata accessor for FCDisclosureGroupStyle();
    sub_100010310(&qword_100041318, &qword_1000412A0);
    sub_1000101A8(&qword_100041320, (void (*)(uint64_t))type metadata accessor for FCDisclosureGroupStyle);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000413C8);
  }
  return result;
}

uint64_t sub_10000F668()
{
  return sub_100010310(&qword_1000413D0, &qword_1000413D8);
}

uint64_t sub_10000F6A4()
{
  uint64_t v1 = sub_1000321E8();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_10000F734()
{
  return sub_100031D48();
}

unint64_t sub_10000F7C8()
{
  unint64_t result = qword_100041410;
  if (!qword_100041410)
  {
    sub_100006B14(&qword_1000413F8);
    sub_100010310(&qword_100041418, &qword_1000413F0);
    sub_100010310(&qword_100041420, &qword_100041428);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041410);
  }
  return result;
}

uint64_t sub_10000F88C()
{
  uint64_t v0 = (uint64_t (*)(uint64_t *, void))sub_100032188();
  *uint64_t v1 = !*v1;
  return v0(&v3, 0);
}

uint64_t sub_10000F8F8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_100031F78();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100001DEC(&qword_100041310);
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000B5A4(v2, (uint64_t)v10, &qword_100041310);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v11 = sub_100031CA8();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v11 - 8) + 32))(a1, v10, v11);
  }
  else
  {
    os_log_type_t v13 = sub_1000327E8();
    uint64_t v14 = sub_1000321F8();
    if (os_log_type_enabled(v14, v13))
    {
      uint64_t v15 = swift_slowAlloc();
      uint64_t v17 = swift_slowAlloc();
      *(_DWORD *)uint64_t v15 = 136315138;
      *(void *)(v15 + 4) = sub_100003FD4(0x686353726F6C6F43, 0xEB00000000656D65, &v17);
      _os_log_impl((void *)&_mh_execute_header, v14, v13, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v15, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    sub_100031F68();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

uint64_t sub_10000FB88()
{
  return sub_100031E88();
}

uint64_t sub_10000FBAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_10000FBD8(a1, a2, a3, a4, (void (*)(void))&type metadata accessor for Image.Scale, (uint64_t (*)(char *))&EnvironmentValues.imageScale.setter);
}

uint64_t sub_10000FBD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(void), uint64_t (*a6)(char *))
{
  a5(0);
  __chkstk_darwin();
  uint64_t v9 = (char *)&v12 - v8;
  (*(void (**)(char *, uint64_t))(v10 + 16))((char *)&v12 - v8, a1);
  return a6(v9);
}

uint64_t sub_10000FCA8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100031F28();
  *a1 = result;
  return result;
}

uint64_t sub_10000FCD4()
{
  return sub_100031F38();
}

uint64_t sub_10000FD00@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100031EC8();
  *a1 = result;
  return result;
}

uint64_t sub_10000FD2C()
{
  return sub_100031ED8();
}

uint64_t sub_10000FD58@<X0>(uint64_t a1@<X8>)
{
  return sub_10000D020(*(void *)(v1 + 16), a1);
}

unint64_t sub_10000FD60()
{
  unint64_t result = qword_100041470;
  if (!qword_100041470)
  {
    sub_100006B14(&qword_100041468);
    sub_1000101A8(&qword_100041478, (void (*)(uint64_t))type metadata accessor for ActivitySelectableRow);
    sub_100010310(&qword_100041480, &qword_100041488);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041470);
  }
  return result;
}

uint64_t sub_10000FE30(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10000FE98(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10000FEF8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100001DEC(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_10000FF5C()
{
  uint64_t v1 = *(void *)(v0 + 16);
  type metadata accessor for ActivityGroup();
  sub_1000101A8(&qword_100041298, (void (*)(uint64_t))type metadata accessor for ActivityGroup);
  sub_100031E48();
  swift_getKeyPath();
  sub_100031E68();
  swift_release();
  swift_release();
  swift_getKeyPath();
  uint64_t v2 = swift_allocObject();
  long long v4 = *(_OWORD *)(v1 + 16);
  long long v3 = *(_OWORD *)(v1 + 32);
  long long v5 = *(_OWORD *)v1;
  *(void *)(v2 + 64) = *(void *)(v1 + 48);
  *(_OWORD *)(v2 + 32) = v4;
  *(_OWORD *)(v2 + 48) = v3;
  *(_OWORD *)(v2 + 16) = v5;
  sub_10000D724(v1);
  sub_100001DEC(&qword_1000414B0);
  sub_100001DEC(&qword_100041468);
  sub_100010244();
  sub_10000FD60();
  return sub_100032568();
}

unint64_t sub_1000100EC()
{
  unint64_t result = qword_1000414A0;
  if (!qword_1000414A0)
  {
    sub_100006B14(&qword_100041498);
    sub_10000FD60();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000414A0);
  }
  return result;
}

uint64_t sub_100010160()
{
  return sub_1000101A8(&qword_1000414A8, (void (*)(uint64_t))type metadata accessor for ActivityItem);
}

uint64_t sub_1000101A8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1000101F4()
{
  swift_release();
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 72, 7);
}

uint64_t sub_10001023C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_10000CC38(a1, (uint64_t *)(v2 + 16), a2);
}

unint64_t sub_100010244()
{
  unint64_t result = qword_1000414B8;
  if (!qword_1000414B8)
  {
    sub_100006B14(&qword_1000414B0);
    sub_100010310(&qword_1000414C0, &qword_100040DE8);
    sub_100010310(&qword_1000414C8, &qword_100040DE8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000414B8);
  }
  return result;
}

uint64_t sub_100010310(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100006B14(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_100010354(uint64_t a1, void (**a2)(void, void))
{
  sub_1000328E8(42);
  swift_bridgeObjectRelease();
  a2[2](a1, a2);
  v5._countAndFlagsBits = sub_100032A28();
  sub_100032698(v5);
  swift_bridgeObjectRelease();
  v6._countAndFlagsBits = 0x656C646E7562202CLL;
  v6._object = (void *)0xEB00000000204449;
  sub_100032698(v6);
  a2[3](a1, a2);
  sub_100001DEC(&qword_1000414D0);
  v7._countAndFlagsBits = sub_100032658();
  sub_100032698(v7);
  swift_bridgeObjectRelease();
  v8._countAndFlagsBits = 0x44496D616574202CLL;
  v8._object = (void *)0xE900000000000020;
  sub_100032698(v8);
  a2[4](a1, a2);
  v9._countAndFlagsBits = sub_100032658();
  sub_100032698(v9);
  swift_bridgeObjectRelease();
  return 0xD000000000000010;
}

uint64_t sub_1000104FC()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100031C28();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_100010570@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 104))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_1000105C0(unsigned __int8 *a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(**(void **)a2 + 112))(*a1);
}

uint64_t sub_100010608()
{
  return sub_100031C38();
}

uint64_t (*sub_100010678(void *a1))()
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_100031C18();
  return sub_100001DD4;
}

uint64_t sub_100010704()
{
  return sub_1000025E8((uint64_t)&OBJC_IVAR____TtC23ActivityPickerExtension31ActivityPickerViewConfiguration__isEmbedded, &qword_100041020);
}

uint64_t sub_100010718(uint64_t a1)
{
  return sub_100010DC0(a1, &qword_100041028, (uint64_t)&OBJC_IVAR____TtC23ActivityPickerExtension31ActivityPickerViewConfiguration__isEmbedded, &qword_100041020);
}

uint64_t (*sub_100010734(void *a1))()
{
  long long v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = sub_100001DEC(&qword_100041028);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  Swift::String v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC23ActivityPickerExtension31ActivityPickerViewConfiguration__isEmbedded;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = sub_100001DEC(&qword_100041020);
  sub_100031BF8();
  swift_endAccess();
  return sub_100001F5C;
}

uint64_t sub_100010848()
{
  return sub_100010B58();
}

uint64_t sub_10001085C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 152))();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_1000108A8(uint64_t *a1, uint64_t a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(**(void **)a2 + 160);
  swift_bridgeObjectRetain();
  return v4(v2, v3);
}

uint64_t sub_100010910()
{
  return sub_100010C8C();
}

uint64_t (*sub_100010924(void *a1))()
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_100031C18();
  return sub_100001DD4;
}

uint64_t sub_1000109B0()
{
  return 0;
}

uint64_t sub_1000109BC()
{
  return sub_1000025E8((uint64_t)&OBJC_IVAR____TtC23ActivityPickerExtension31ActivityPickerViewConfiguration__headerText, &qword_1000414D8);
}

uint64_t sub_1000109D0(uint64_t a1)
{
  return sub_100010DC0(a1, &qword_1000414E0, (uint64_t)&OBJC_IVAR____TtC23ActivityPickerExtension31ActivityPickerViewConfiguration__headerText, &qword_1000414D8);
}

uint64_t (*sub_1000109EC(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = sub_100001DEC(&qword_1000414E0);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  Swift::String v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC23ActivityPickerExtension31ActivityPickerViewConfiguration__headerText;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = sub_100001DEC(&qword_1000414D8);
  sub_100031BF8();
  swift_endAccess();
  return sub_100001F5C;
}

uint64_t sub_100010AFC()
{
  return sub_100031BE8();
}

uint64_t sub_100010B44()
{
  return sub_100010B58();
}

uint64_t sub_100010B58()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100031C28();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_100010BC4@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 200))();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_100010C10(uint64_t *a1, uint64_t a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(**(void **)a2 + 208);
  swift_bridgeObjectRetain();
  return v4(v2, v3);
}

uint64_t sub_100010C78()
{
  return sub_100010C8C();
}

uint64_t sub_100010C8C()
{
  return sub_100031C38();
}

uint64_t (*sub_100010D04(void *a1))()
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_100031C18();
  return sub_100001DD4;
}

uint64_t sub_100010D90()
{
  return sub_1000025E8((uint64_t)&OBJC_IVAR____TtC23ActivityPickerExtension31ActivityPickerViewConfiguration__footerText, &qword_1000414D8);
}

uint64_t sub_100010DA4(uint64_t a1)
{
  return sub_100010DC0(a1, &qword_1000414E0, (uint64_t)&OBJC_IVAR____TtC23ActivityPickerExtension31ActivityPickerViewConfiguration__footerText, &qword_1000414D8);
}

uint64_t sub_100010DC0(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v6 = sub_100001DEC(a2);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v10 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  swift_beginAccess();
  sub_100001DEC(a4);
  sub_100031C08();
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
}

uint64_t (*sub_100010EF0(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = sub_100001DEC(&qword_1000414E0);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC23ActivityPickerExtension31ActivityPickerViewConfiguration__footerText;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = sub_100001DEC(&qword_1000414D8);
  sub_100031BF8();
  swift_endAccess();
  return sub_100001F5C;
}

uint64_t sub_100011000()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC23ActivityPickerExtension31ActivityPickerViewConfiguration__isEmbedded;
  uint64_t v2 = sub_100001DEC(&qword_100041020);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = v0 + OBJC_IVAR____TtC23ActivityPickerExtension31ActivityPickerViewConfiguration__headerText;
  uint64_t v4 = sub_100001DEC(&qword_1000414D8);
  uint64_t v5 = *(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
  v5(v0 + OBJC_IVAR____TtC23ActivityPickerExtension31ActivityPickerViewConfiguration__footerText, v4);
  return v0;
}

uint64_t sub_1000110E0()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC23ActivityPickerExtension31ActivityPickerViewConfiguration__isEmbedded;
  uint64_t v2 = sub_100001DEC(&qword_100041020);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = v0 + OBJC_IVAR____TtC23ActivityPickerExtension31ActivityPickerViewConfiguration__headerText;
  uint64_t v4 = sub_100001DEC(&qword_1000414D8);
  uint64_t v5 = *(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
  v5(v0 + OBJC_IVAR____TtC23ActivityPickerExtension31ActivityPickerViewConfiguration__footerText, v4);
  uint64_t v6 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v7 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v6, v7);
}

uint64_t sub_1000111FC()
{
  uint64_t v0 = swift_allocObject();
  sub_100011234();
  return v0;
}

uint64_t sub_100011234()
{
  uint64_t v1 = sub_100001DEC(&qword_1000414D8);
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100001DEC(&qword_100041020);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = v0 + OBJC_IVAR____TtC23ActivityPickerExtension31ActivityPickerViewConfiguration__isEmbedded;
  LOBYTE(v14) = 0;
  sub_100031BE8();
  (*(void (**)(uint64_t, char *, uint64_t))(v6 + 32))(v9, v8, v5);
  uint64_t v10 = v0 + OBJC_IVAR____TtC23ActivityPickerExtension31ActivityPickerViewConfiguration__headerText;
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  sub_100001DEC(&qword_1000414D0);
  sub_100031BE8();
  uint64_t v11 = *(void (**)(uint64_t, char *, uint64_t))(v2 + 32);
  v11(v10, v4, v1);
  uint64_t v12 = v0 + OBJC_IVAR____TtC23ActivityPickerExtension31ActivityPickerViewConfiguration__footerText;
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  sub_100031BE8();
  v11(v12, v4, v1);
  return v0;
}

uint64_t sub_100011430@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for ActivityPickerViewConfiguration();
  uint64_t result = sub_100031BD8();
  *a1 = result;
  return result;
}

uint64_t sub_100011470()
{
  return type metadata accessor for ActivityPickerViewConfiguration();
}

uint64_t type metadata accessor for ActivityPickerViewConfiguration()
{
  uint64_t result = qword_100042D00;
  if (!qword_100042D00) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_1000114C4()
{
  sub_100011590();
  if (v0 <= 0x3F)
  {
    sub_1000115E8();
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

void sub_100011590()
{
  if (!qword_100041098)
  {
    unint64_t v0 = sub_100031C48();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100041098);
    }
  }
}

void sub_1000115E8()
{
  if (!qword_100041510)
  {
    sub_100006B14(&qword_1000414D0);
    unint64_t v0 = sub_100031C48();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100041510);
    }
  }
}

id sub_100011644()
{
  id result = [self mainBundle];
  qword_100042D18 = (uint64_t)result;
  return result;
}

uint64_t sub_100011680()
{
  uint64_t v0 = sub_100001DEC(&qword_100041630);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)&v10 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100042D10 != -1) {
    swift_once();
  }
  uint64_t v3 = (void *)qword_100042D18;
  NSString v4 = sub_100032608();
  NSString v5 = sub_100032608();
  id v6 = [v3 localizedStringForKey:v4 value:0 table:v5];

  sub_100032638();
  sub_100031948();
  uint64_t v7 = sub_100031958();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v2, 0, 1, v7);
  uint64_t v8 = sub_100032648();
  swift_bridgeObjectRelease();
  sub_100011830((uint64_t)v2);
  return v8;
}

uint64_t sub_100011830(uint64_t a1)
{
  uint64_t v2 = sub_100001DEC(&qword_100041630);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100011890(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100001DEC(&qword_100041630);
  __chkstk_darwin(v4 - 8);
  id v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = MGCopyAnswer();
  if (result)
  {
    uint64_t v25 = result;
    if (swift_dynamicCast())
    {
      uint64_t v23 = a1;
      uint64_t v24 = a2;
      swift_bridgeObjectRetain();
      v26._countAndFlagsBits = 95;
      v26._object = (void *)0xE100000000000000;
      sub_100032698(v26);
      uint64_t v8 = v23;
      uint64_t v9 = v24;
      uint64_t v10 = sub_100032668();
      uint64_t v12 = v11;
      swift_bridgeObjectRelease();
      uint64_t v23 = v8;
      uint64_t v24 = v9;
      swift_bridgeObjectRetain();
      v27._countAndFlagsBits = v10;
      v27._object = v12;
      sub_100032698(v27);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (qword_100042D10 != -1) {
        swift_once();
      }
      os_log_type_t v13 = (void *)qword_100042D18;
      NSString v14 = sub_100032608();
      swift_bridgeObjectRelease();
      NSString v15 = sub_100032608();
      id v16 = [v13 localizedStringForKey:v14 value:0 table:v15];
    }
    else
    {
      if (qword_100042D10 != -1) {
        swift_once();
      }
      uint64_t v17 = (void *)qword_100042D18;
      NSString v18 = sub_100032608();
      NSString v19 = sub_100032608();
      id v16 = [v17 localizedStringForKey:v18 value:0 table:v19];
    }
    sub_100032638();

    sub_100031948();
    uint64_t v20 = sub_100031958();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v6, 0, 1, v20);
    uint64_t v21 = sub_100032648();
    swift_bridgeObjectRelease();
    sub_100011830((uint64_t)v6);
    return v21;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_100011BA8(uint64_t a1)
{
  if ((sub_100031AA8() & 1) != 0 && (sub_100011CA4(), (sub_100032888() & 1) == 0))
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_1000326B8();
    sub_100032688();
    return v3;
  }
  else
  {
    swift_bridgeObjectRetain();
  }
  return a1;
}

unint64_t sub_100011CA4()
{
  unint64_t result = qword_100041638;
  if (!qword_100041638)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041638);
  }
  return result;
}

ValueMetadata *type metadata accessor for Localization()
{
  return &type metadata for Localization;
}

uint64_t sub_100011D08()
{
  return sub_1000111FC();
}

uint64_t variable initialization expression of ApplicationIcon.descriptor()
{
  return 0;
}

uint64_t sub_100011D3C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_100031BB8();
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = &v1[OBJC_IVAR___ActivityPickerServiceViewController____lazy_storage___client];
  uint64_t v7 = *(void *)&v1[OBJC_IVAR___ActivityPickerServiceViewController____lazy_storage___client];
  uint64_t v8 = *(void *)&v1[OBJC_IVAR___ActivityPickerServiceViewController____lazy_storage___client + 8];
  uint64_t v9 = *(void *)&v1[OBJC_IVAR___ActivityPickerServiceViewController____lazy_storage___client + 16];
  uint64_t v10 = *(void *)&v1[OBJC_IVAR___ActivityPickerServiceViewController____lazy_storage___client + 24];
  uint64_t v11 = *(void *)&v1[OBJC_IVAR___ActivityPickerServiceViewController____lazy_storage___client + 32];
  int v12 = v1[OBJC_IVAR___ActivityPickerServiceViewController____lazy_storage___client + 40];
  if (v9 == 1)
  {
    uint64_t v35 = *(void *)&v1[OBJC_IVAR___ActivityPickerServiceViewController____lazy_storage___client + 8];
    uint64_t v36 = v7;
    uint64_t v33 = v10;
    uint64_t v34 = 1;
    uint64_t v32 = v11;
    int v31 = v12;
    int v13 = [v1 _hostProcessIdentifier];
    [v1 _hostAuditToken];
    uint64_t v18 = *((void *)&v37 + 1);
    uint64_t v14 = v37;
    uint64_t v16 = v38;
    uint64_t v15 = v39;
    id v17 = [self currentConnection];
    sub_100031B98();
    sub_1000167EC(v13, v14, v18, v16, v15, v17, (uint64_t)v5, &v37);
    LODWORD(v18) = v37;
    uint64_t v19 = *((void *)&v37 + 1);
    uint64_t v20 = v38;
    uint64_t v21 = v39;
    uint64_t v22 = v40;
    char v23 = v41;
    uint64_t v24 = *(void *)v6;
    uint64_t v29 = *((void *)v6 + 1);
    uint64_t v30 = v24;
    uint64_t v25 = *((void *)v6 + 2);
    uint64_t v27 = *((void *)v6 + 4);
    uint64_t v28 = v25;
    *(void *)id v6 = v37;
    *((void *)v6 + 1) = v19;
    *((void *)v6 + 2) = v20;
    *((void *)v6 + 3) = v21;
    *((void *)v6 + 4) = v22;
    v6[40] = v23;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1000162EC(v30, v29, v28);
    uint64_t v9 = v34;
    uint64_t v8 = v35;
    uint64_t v7 = v36;
  }
  else
  {
    char v23 = v12 & 1;
    uint64_t v18 = *(void *)&v1[OBJC_IVAR___ActivityPickerServiceViewController____lazy_storage___client];
    uint64_t v19 = v8;
    uint64_t v20 = v9;
    uint64_t v21 = v10;
    uint64_t v22 = v11;
  }
  uint64_t result = sub_1000165D8(v7, v8, v9);
  *(_DWORD *)a1 = v18;
  *(void *)(a1 + 8) = v19;
  *(void *)(a1 + 16) = v20;
  *(void *)(a1 + 24) = v21;
  *(void *)(a1 + 32) = v22;
  *(unsigned char *)(a1 + 40) = v23;
  return result;
}

void sub_100011F20(uint64_t a1@<X8>)
{
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 24) = 0;
  *(void *)(a1 + 32) = 0;
  *(void *)(a1 + 16) = 1;
  *(unsigned char *)(a1 + 40) = 0;
}

uint64_t sub_100011F38()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR___ActivityPickerServiceViewController____lazy_storage___connectionPrivate);
  if (*(void *)(v0 + OBJC_IVAR___ActivityPickerServiceViewController____lazy_storage___connectionPrivate))
  {
    uint64_t v2 = *(void *)(v0 + OBJC_IVAR___ActivityPickerServiceViewController____lazy_storage___connectionPrivate);
  }
  else
  {
    type metadata accessor for ActivityPickerServiceViewController();
    uint64_t v2 = sub_100031968();
    uint64_t v4 = v3;
    swift_getObjectType();
    sub_1000319F8();
    *uint64_t v1 = v2;
    v1[1] = v4;
    swift_unknownObjectRetain();
    swift_unknownObjectRelease();
  }
  swift_unknownObjectRetain();
  return v2;
}

id sub_100011FC8()
{
  id v1 = objc_allocWithZone(v0);

  return [v1 init];
}

id sub_100011FFC()
{
  uint64_t v1 = OBJC_IVAR___ActivityPickerServiceViewController_viewConfiguration;
  type metadata accessor for ActivityPickerViewConfiguration();
  uint64_t v2 = v0;
  *(void *)&v0[v1] = sub_1000111FC();
  *(void *)&v2[OBJC_IVAR___ActivityPickerServiceViewController_tokenDecoder] = 0;
  *(void *)&v2[OBJC_IVAR___ActivityPickerServiceViewController_tokenEncoder] = 0;
  uint64_t v3 = &v2[OBJC_IVAR___ActivityPickerServiceViewController____lazy_storage___client];
  *(_OWORD *)uint64_t v3 = 0u;
  *((void *)v3 + 2) = 1;
  v3[40] = 0;
  *(_OWORD *)(v3 + 24) = 0u;
  uint64_t v4 = &v2[OBJC_IVAR___ActivityPickerServiceViewController____lazy_storage___connectionPrivate];
  *(void *)uint64_t v4 = 0;
  *((void *)v4 + 1) = 0;

  v6.receiver = v2;
  v6.super_class = (Class)type metadata accessor for ActivityPickerServiceViewController();
  return objc_msgSendSuper2(&v6, "initWithNibName:bundle:", 0, 0);
}

uint64_t type metadata accessor for ActivityPickerServiceViewController()
{
  return self;
}

id sub_100012108(void *a1)
{
  id v3 = [objc_allocWithZone(v1) initWithCoder:a1];

  return v3;
}

id sub_100012178()
{
  return sub_10001219C(&protocolRef__TtP14FamilyControls30ActivityPickerServiceInterface_);
}

id sub_100012190()
{
  return sub_10001219C(&protocolRef__TtP14FamilyControls29ActivityPickerClientInterface_);
}

id sub_10001219C(void *a1)
{
  id v1 = [self interfaceWithProtocol:*a1];

  return v1;
}

id sub_1000121F8(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = [self interfaceWithProtocol:*a3];

  return v3;
}

uint64_t sub_10001224C()
{
  id v1 = v0;
  uint64_t v2 = sub_100031BB8();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  aBlock[4] = sub_1000124C0;
  aBlock[5] = 0;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1000126F4;
  aBlock[3] = &unk_10003DBF0;
  objc_super v6 = _Block_copy(aBlock);
  id v7 = [v1 _remoteViewControllerProxyWithErrorHandler:v6];
  _Block_release(v6);
  if (v7)
  {
    sub_1000328A8();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v14 = 0u;
    long long v15 = 0u;
  }
  sub_10000FEF8((uint64_t)&v14, (uint64_t)aBlock, &qword_100041668);
  sub_10000B5A4((uint64_t)aBlock, (uint64_t)&v14, &qword_100041668);
  if (*((void *)&v15 + 1))
  {
    sub_100001DEC(&qword_100041670);
    if (swift_dynamicCast())
    {
      uint64_t v8 = v13[1];
      sub_100015880((uint64_t)aBlock);
      return v8;
    }
  }
  else
  {
    sub_100015880((uint64_t)&v14);
  }
  sub_100031B98();
  uint64_t v9 = sub_100031BA8();
  os_log_type_t v10 = sub_1000327D8();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "Failed to get client interface", v11, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  sub_100015880((uint64_t)aBlock);
  return 0;
}

uint64_t sub_1000124C0(uint64_t a1)
{
  uint64_t v2 = sub_100031BB8();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100031B98();
  swift_errorRetain();
  swift_errorRetain();
  objc_super v6 = sub_100031BA8();
  os_log_type_t v7 = sub_1000327D8();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = swift_slowAlloc();
    uint64_t v15 = v2;
    uint64_t v9 = (uint8_t *)v8;
    uint64_t v10 = swift_slowAlloc();
    uint64_t v16 = a1;
    uint64_t v17 = v10;
    *(_DWORD *)uint64_t v9 = 136446210;
    swift_errorRetain();
    sub_100001DEC(&qword_1000416F8);
    uint64_t v11 = sub_100032658();
    uint64_t v16 = sub_100003FD4(v11, v12, &v17);
    sub_100032858();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Failed to get client proxy: %{public}s", v9, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v15);
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();

    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
}

void sub_1000126F4(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

uint64_t sub_100012760(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v88 = a8;
  uint64_t v79 = a7;
  uint64_t v84 = a5;
  uint64_t v83 = a4;
  uint64_t v82 = a3;
  uint64_t v81 = a2;
  int v80 = a1;
  uint64_t v90 = sub_100031BB8();
  uint64_t v89 = *(void *)(v90 - 8);
  uint64_t v11 = __chkstk_darwin(v90);
  int v13 = &v73[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v14 = __chkstk_darwin(v11);
  uint64_t v77 = &v73[-v15];
  __chkstk_darwin(v14);
  uint64_t v86 = &v73[-v16];
  uint64_t v17 = sub_100031B38();
  uint64_t v18 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  uint64_t v20 = &v73[-((v19 + 15) & 0xFFFFFFFFFFFFFFF0)];
  type metadata accessor for ActivityProvider();
  uint64_t v87 = sub_1000170EC(a6);
  sub_100011D3C((uint64_t)v96);
  uint64_t v21 = v97[3];
  sub_10000FEF8((uint64_t)v97, (uint64_t)v105, &qword_1000414D0);
  sub_1000158E0((uint64_t)v105);
  if (v21)
  {
    int v74 = a6;
    uint64_t v85 = a9;
    sub_100031B28();
    uint64_t v100 = v17;
    uint64_t v101 = &protocol witness table for KeyRetriever;
    uint64_t v22 = sub_10001590C(&v98);
    uint64_t v75 = v18;
    char v23 = *(void (**)(uint64_t *, unsigned char *, uint64_t))(v18 + 16);
    v23(v22, v20, v17);
    sub_100031B58();
    swift_allocObject();
    swift_bridgeObjectRetain();
    *(void *)&v9[OBJC_IVAR___ActivityPickerServiceViewController_tokenDecoder] = sub_100031B48();
    swift_release();
    uint64_t v100 = v17;
    uint64_t v101 = &protocol witness table for KeyRetriever;
    uint64_t v24 = sub_10001590C(&v98);
    uint64_t v76 = v17;
    v23(v24, v20, v17);
    sub_100031B78();
    swift_allocObject();
    *(void *)&v9[OBJC_IVAR___ActivityPickerServiceViewController_tokenEncoder] = sub_100031B68();
    swift_release();
    uint64_t v25 = v9;
    uint64_t v26 = v79;
    uint64_t v27 = sub_100015A64(v79, (uint64_t)v25, (uint64_t (*)(char *))&dispatch thunk of TokenDecoder.decode(bundleIdentifierToken:), "Failed to decode application token: %{public}s");

    uint64_t v28 = v25;
    uint64_t v29 = sub_100015A64(v88, (uint64_t)v28, (uint64_t (*)(char *))&dispatch thunk of TokenDecoder.decode(categoryIdentifierToken:), "Failed to decode category token: %{public}s");

    uint64_t v30 = v28;
    int v31 = sub_100015A64(v85, (uint64_t)v30, (uint64_t (*)(char *))&dispatch thunk of TokenDecoder.decode(webDomainToken:), "Failed to decode web domain token: %{public}s");

    uint64_t v32 = v86;
    sub_100031B98();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v33 = sub_100031BA8();
    os_log_type_t v34 = sub_1000327C8();
    BOOL v35 = os_log_type_enabled(v33, v34);
    uint64_t v78 = v20;
    if (v35)
    {
      uint64_t v36 = swift_slowAlloc();
      *(_DWORD *)uint64_t v36 = 134219264;
      uint64_t v98 = *((void *)v27 + 2);
      sub_100032858();
      swift_bridgeObjectRelease();
      *(_WORD *)(v36 + 12) = 2048;
      uint64_t v98 = *(void *)(v26 + 16);
      sub_100032858();
      swift_bridgeObjectRelease();
      *(_WORD *)(v36 + 22) = 2048;
      uint64_t v98 = *((void *)v29 + 2);
      sub_100032858();
      swift_bridgeObjectRelease();
      *(_WORD *)(v36 + 32) = 2048;
      uint64_t v98 = *(void *)(v88 + 16);
      sub_100032858();
      swift_bridgeObjectRelease();
      *(_WORD *)(v36 + 42) = 2048;
      uint64_t v98 = *((void *)v31 + 2);
      sub_100032858();
      swift_bridgeObjectRelease();
      *(_WORD *)(v36 + 52) = 2048;
      uint64_t v98 = *(void *)(v85 + 16);
      sub_100032858();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v33, v34, "Detokenized %ld/%ld applications, %ld/%ld categories, %ld/%ld webDomains", (uint8_t *)v36, 0x3Eu);
      uint64_t v32 = v86;
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    uint64_t v41 = v89 + 8;
    uint64_t v88 = *(void *)(v89 + 8);
    ((void (*)(unsigned char *, uint64_t))v88)(v32, v90);
    uint64_t v94 = v29;
    uint64_t v95 = v27;
    uint64_t v93 = v31;
    sub_100011D3C((uint64_t)&v98);
    char v42 = v102;
    sub_10000FEF8((uint64_t)&v99, (uint64_t)v104, &qword_1000414D0);
    sub_1000158E0((uint64_t)v104);
    sub_10000FEF8((uint64_t)&v100, (uint64_t)v103, &qword_1000414D0);
    sub_1000158E0((uint64_t)v103);
    uint64_t v43 = v76;
    uint64_t v44 = v75;
    uint64_t v45 = v78;
    if (v42)
    {
      uint64_t v46 = swift_bridgeObjectRetain();
      sub_1000137BC(v46);
      uint64_t v47 = swift_bridgeObjectRetain();
      sub_1000137BC(v47);
      uint64_t v48 = swift_bridgeObjectRetain();
      sub_1000137BC(v48);
      uint64_t v49 = v77;
      sub_100031B98();
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain_n();
      uint64_t v50 = sub_100031BA8();
      os_log_type_t v51 = sub_1000327C8();
      if (os_log_type_enabled(v50, v51))
      {
        uint64_t v52 = swift_slowAlloc();
        uint64_t v86 = (unsigned char *)swift_slowAlloc();
        uint64_t v92 = v86;
        *(_DWORD *)uint64_t v52 = 136315650;
        swift_bridgeObjectRetain();
        uint64_t v53 = sub_100032718();
        uint64_t v89 = v41;
        unint64_t v55 = v54;
        swift_bridgeObjectRelease();
        uint64_t v91 = sub_100003FD4(v53, v55, (uint64_t *)&v92);
        sub_100032858();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v52 + 12) = 2080;
        swift_bridgeObjectRetain();
        uint64_t v56 = sub_100032718();
        unint64_t v58 = v57;
        swift_bridgeObjectRelease();
        uint64_t v91 = sub_100003FD4(v56, v58, (uint64_t *)&v92);
        sub_100032858();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v52 + 22) = 2080;
        swift_bridgeObjectRetain();
        uint64_t v59 = sub_100032718();
        unint64_t v61 = v60;
        swift_bridgeObjectRelease();
        uint64_t v91 = sub_100003FD4(v59, v61, (uint64_t *)&v92);
        uint64_t v43 = v76;
        sub_100032858();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v50, v51, "Untokenized applications: %s, categories %s, webDomains: %s", (uint8_t *)v52, 0x20u);
        swift_arrayDestroy();
        swift_slowDealloc();
        uint64_t v44 = v75;
        swift_slowDealloc();

        ((void (*)(unsigned char *, uint64_t))v88)(v77, v90);
      }
      else
      {

        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease_n();
        ((void (*)(unsigned char *, uint64_t))v88)(v49, v90);
      }
      uint64_t v45 = v78;
    }
    uint64_t v62 = sub_100015BCC((uint64_t)v95);
    swift_bridgeObjectRelease();
    uint64_t v63 = sub_100015BCC((uint64_t)v94);
    swift_bridgeObjectRelease();
    uint64_t v64 = sub_100015BCC((uint64_t)v93);
    swift_bridgeObjectRelease();
    uint64_t v65 = v87;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)v87 + 136))(v62, v63, v64);
    uint64_t v66 = *(void *)&v30[OBJC_IVAR___ActivityPickerServiceViewController_viewConfiguration];
    (*(void (**)(void))(*(void *)v66 + 112))(v80 & 1);
    uint64_t v67 = *(void (**)(uint64_t, uint64_t))(*(void *)v66 + 160);
    uint64_t v68 = v82;
    swift_bridgeObjectRetain();
    v67(v81, v68);
    uint64_t v69 = *(void (**)(uint64_t, uint64_t))(*(void *)v66 + 208);
    uint64_t v70 = v84;
    swift_bridgeObjectRetain();
    v69(v83, v70);
    (*(void (**)(uint64_t))((swift_isaMask & *(void *)v30) + 0xE8))(v65);
    sub_100011F38();
    swift_getObjectType();
    uint64_t v71 = swift_allocObject();
    *(unsigned char *)(v71 + 16) = v74 & 1;
    *(void *)(v71 + 24) = v65;
    *(void *)(v71 + 32) = v30;
    uint64_t v72 = v30;
    swift_retain();
    sub_100031A08();
    swift_release();
    swift_unknownObjectRelease();
    swift_release();
    return (*(uint64_t (**)(unsigned char *, uint64_t))(v44 + 8))(v45, v43);
  }
  else
  {
    sub_100031B98();
    long long v37 = sub_100031BA8();
    os_log_type_t v38 = sub_1000327D8();
    if (os_log_type_enabled(v37, v38))
    {
      uint64_t v39 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v39 = 0;
      _os_log_impl((void *)&_mh_execute_header, v37, v38, "Unable to configure activity picker: team identifier not available", v39, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(unsigned char *, uint64_t))(v89 + 8))(v13, v90);
    (*(void (**)(void *, void *, void *))(*(void *)v87 + 136))(&_swiftEmptySetSingleton, &_swiftEmptySetSingleton, &_swiftEmptySetSingleton);
    return swift_release();
  }
}

uint64_t sub_100013414@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(char *)@<X2>, const char *a4@<X3>, uint64_t *a5@<X8>)
{
  uint64_t v30 = a4;
  uint64_t v10 = sub_100031BB8();
  uint64_t v34 = *(void *)(v10 - 8);
  uint64_t v35 = v10;
  __chkstk_darwin(v10);
  uint64_t v33 = (char *)v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100001DEC(&qword_1000416B0);
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)v28 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100016528(*(void *)a1, *(void *)(a1 + 8));
  sub_100031AF8();
  if (*(void *)(a2 + OBJC_IVAR___ActivityPickerServiceViewController_tokenDecoder))
  {
    int v31 = a5;
    uint64_t v32 = v12;
    swift_retain();
    uint64_t v16 = a3(v15);
    if (!v5)
    {
      uint64_t v25 = v16;
      uint64_t v26 = v17;
      (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v32);
      uint64_t result = swift_release();
      uint64_t v27 = v31;
      *int v31 = v25;
      v27[1] = v26;
      return result;
    }
    swift_release();
    uint64_t v18 = v33;
    sub_100031B98();
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v19 = sub_100031BA8();
    os_log_type_t v20 = sub_1000327D8();
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v21 = (uint8_t *)swift_slowAlloc();
      uint64_t v29 = swift_slowAlloc();
      uint64_t v37 = v29;
      *(_DWORD *)uint64_t v21 = 136446210;
      v28[1] = v21 + 4;
      uint64_t v36 = v5;
      swift_errorRetain();
      sub_100001DEC(&qword_1000416B8);
      uint64_t v22 = sub_100032658();
      uint64_t v36 = sub_100003FD4(v22, v23, &v37);
      sub_100032858();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v19, v20, v30, v21, 0xCu);
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
    (*(void (**)(char *, uint64_t))(v34 + 8))(v18, v35);
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v32);
    a5 = v31;
  }
  else
  {
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  }
  *a5 = 0;
  a5[1] = 0;
  return result;
}

uint64_t sub_1000137BC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *v1;
  int64_t v4 = *((void *)*v1 + 2);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  char isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= *((void *)v3 + 3) >> 1)
  {
    if (*(void *)(a1 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
  if (v4 <= v5) {
    int64_t v14 = v4 + v2;
  }
  else {
    int64_t v14 = v4;
  }
  uint64_t v3 = sub_100015374(isUniquelyReferenced_nonNull_native, v14, 1, v3);
  if (!*(void *)(a1 + 16))
  {
LABEL_18:
    if (!v2) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }
LABEL_5:
  uint64_t v8 = *((void *)v3 + 2);
  if ((*((void *)v3 + 3) >> 1) - v8 < v2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  unint64_t v9 = (unint64_t)&v3[16 * v8 + 32];
  if (a1 + 32 < v9 + 16 * v2 && v9 < a1 + 32 + 16 * v2) {
    goto LABEL_24;
  }
  swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    *id v1 = v3;
    return result;
  }
  uint64_t v11 = *((void *)v3 + 2);
  BOOL v12 = __OFADD__(v11, v2);
  uint64_t v13 = v11 + v2;
  if (!v12)
  {
    *((void *)v3 + 2) = v13;
    goto LABEL_19;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = sub_1000329D8();
  __break(1u);
  return result;
}

uint64_t sub_100013910(uint64_t result)
{
  uint64_t v3 = *(void *)(result + 16);
  int64_t v4 = *v1;
  int64_t v5 = *((void *)*v1 + 2);
  int64_t v6 = v5 + v3;
  if (__OFADD__(v5, v3))
  {
    __break(1u);
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  uint64_t v7 = result;
  char isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
  if (!isUniquelyReferenced_nonNull_native || (int64_t v9 = *((void *)v4 + 3) >> 1, v9 < v6))
  {
    if (v5 <= v6) {
      int64_t v10 = v5 + v3;
    }
    else {
      int64_t v10 = v5;
    }
    int64_t v4 = sub_100015374(isUniquelyReferenced_nonNull_native, v10, 1, v4);
    int64_t v9 = *((void *)v4 + 3) >> 1;
  }
  uint64_t v11 = *((void *)v4 + 2);
  uint64_t v12 = v9 - v11;
  uint64_t result = sub_100015594((uint64_t)v38, &v4[16 * v11 + 32], v9 - v11, v7);
  if (result < v3) {
    goto LABEL_15;
  }
  if (result)
  {
    uint64_t v14 = *((void *)v4 + 2);
    BOOL v15 = __OFADD__(v14, result);
    uint64_t v16 = v14 + result;
    if (v15)
    {
      __break(1u);
      goto LABEL_48;
    }
    *((void *)v4 + 2) = v16;
  }
  if (result != v12)
  {
LABEL_13:
    uint64_t result = sub_100016334();
    *id v1 = v4;
    return result;
  }
LABEL_16:
  int64_t v2 = *((void *)v4 + 2);
  uint64_t v3 = v38[0];
  uint64_t v37 = v38[1];
  uint64_t v13 = v39;
  int64_t v6 = v40;
  if (v41)
  {
    unint64_t v17 = (v41 - 1) & v41;
    unint64_t v18 = __clz(__rbit64(v41)) | (v40 << 6);
    int64_t v36 = (unint64_t)(v39 + 64) >> 6;
    goto LABEL_18;
  }
LABEL_48:
  int64_t v32 = v6 + 1;
  if (__OFADD__(v6, 1)) {
    goto LABEL_66;
  }
  int64_t v36 = (unint64_t)(v13 + 64) >> 6;
  if (v32 >= v36) {
    goto LABEL_13;
  }
  unint64_t v33 = *(void *)(v37 + 8 * v32);
  int64_t v34 = v6 + 1;
  if (!v33)
  {
    int64_t v34 = v6 + 2;
    if (v6 + 2 >= v36) {
      goto LABEL_13;
    }
    unint64_t v33 = *(void *)(v37 + 8 * v34);
    if (!v33)
    {
      int64_t v34 = v6 + 3;
      if (v6 + 3 >= v36) {
        goto LABEL_13;
      }
      unint64_t v33 = *(void *)(v37 + 8 * v34);
      if (!v33)
      {
        int64_t v34 = v6 + 4;
        if (v6 + 4 >= v36) {
          goto LABEL_13;
        }
        unint64_t v33 = *(void *)(v37 + 8 * v34);
        if (!v33)
        {
          int64_t v34 = v6 + 5;
          if (v6 + 5 >= v36) {
            goto LABEL_13;
          }
          unint64_t v33 = *(void *)(v37 + 8 * v34);
          if (!v33)
          {
            int64_t v35 = v6 + 6;
            do
            {
              if (v36 == v35) {
                goto LABEL_13;
              }
              unint64_t v33 = *(void *)(v37 + 8 * v35++);
            }
            while (!v33);
            int64_t v34 = v35 - 1;
          }
        }
      }
    }
  }
  unint64_t v17 = (v33 - 1) & v33;
  unint64_t v18 = __clz(__rbit64(v33)) + (v34 << 6);
  int64_t v6 = v34;
LABEL_18:
  uint64_t v19 = (uint64_t *)(*(void *)(v3 + 48) + 16 * v18);
  uint64_t v21 = *v19;
  uint64_t v20 = v19[1];
  uint64_t result = swift_bridgeObjectRetain();
  while (1)
  {
    unint64_t v22 = *((void *)v4 + 3);
    int64_t v23 = v22 >> 1;
    if ((uint64_t)(v22 >> 1) < v2 + 1) {
      break;
    }
    if (v2 < v23) {
      goto LABEL_23;
    }
LABEL_20:
    *((void *)v4 + 2) = v2;
  }
  uint64_t result = (uint64_t)sub_100015374((char *)(v22 > 1), v2 + 1, 1, v4);
  int64_t v4 = (char *)result;
  int64_t v23 = *(void *)(result + 24) >> 1;
  if (v2 >= v23) {
    goto LABEL_20;
  }
  while (1)
  {
LABEL_23:
    uint64_t v24 = &v4[16 * v2 + 32];
    *(void *)uint64_t v24 = v21;
    *((void *)v24 + 1) = v20;
    ++v2;
    if (v17)
    {
      unint64_t v25 = __clz(__rbit64(v17));
      v17 &= v17 - 1;
      unint64_t v26 = v25 | (v6 << 6);
      goto LABEL_41;
    }
    int64_t v27 = v6 + 1;
    if (__OFADD__(v6, 1)) {
      break;
    }
    if (v27 >= v36) {
      goto LABEL_45;
    }
    unint64_t v28 = *(void *)(v37 + 8 * v27);
    int64_t v29 = v6 + 1;
    if (!v28)
    {
      int64_t v29 = v6 + 2;
      if (v6 + 2 >= v36) {
        goto LABEL_45;
      }
      unint64_t v28 = *(void *)(v37 + 8 * v29);
      if (!v28)
      {
        int64_t v29 = v6 + 3;
        if (v6 + 3 >= v36) {
          goto LABEL_45;
        }
        unint64_t v28 = *(void *)(v37 + 8 * v29);
        if (!v28)
        {
          int64_t v29 = v6 + 4;
          if (v6 + 4 >= v36) {
            goto LABEL_45;
          }
          unint64_t v28 = *(void *)(v37 + 8 * v29);
          if (!v28)
          {
            int64_t v29 = v6 + 5;
            if (v6 + 5 >= v36) {
              goto LABEL_45;
            }
            unint64_t v28 = *(void *)(v37 + 8 * v29);
            if (!v28)
            {
              int64_t v30 = v6 + 6;
              while (v36 != v30)
              {
                unint64_t v28 = *(void *)(v37 + 8 * v30++);
                if (v28)
                {
                  int64_t v29 = v30 - 1;
                  goto LABEL_40;
                }
              }
LABEL_45:
              *((void *)v4 + 2) = v2;
              goto LABEL_13;
            }
          }
        }
      }
    }
LABEL_40:
    unint64_t v17 = (v28 - 1) & v28;
    unint64_t v26 = __clz(__rbit64(v28)) + (v29 << 6);
    int64_t v6 = v29;
LABEL_41:
    int v31 = (uint64_t *)(*(void *)(v3 + 48) + 16 * v26);
    uint64_t v21 = *v31;
    uint64_t v20 = v31[1];
    if (v2 >= v23)
    {
      uint64_t result = swift_bridgeObjectRetain();
      goto LABEL_20;
    }
    uint64_t result = swift_bridgeObjectRetain();
  }
  __break(1u);
LABEL_66:
  __break(1u);
  return result;
}

uint64_t sub_100013CDC(uint64_t a1, char a2, uint64_t a3, void *a4)
{
  uint64_t v8 = sub_100031BB8();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000B5A4(a1, (uint64_t)v27, &qword_1000416C8);
  if (v28)
  {
    uint64_t v12 = *(void *)&v27[0];
    sub_100031B98();
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v13 = sub_100031BA8();
    os_log_type_t v14 = sub_1000327D8();
    if (os_log_type_enabled(v13, v14))
    {
      BOOL v15 = (uint8_t *)swift_slowAlloc();
      uint64_t v16 = swift_slowAlloc();
      *(_DWORD *)BOOL v15 = 136446210;
      v24[1] = v15 + 4;
      aBlock[0] = v16;
      *(void *)&v26[0] = v12;
      swift_errorRetain();
      sub_100001DEC(&qword_1000416B8);
      uint64_t v17 = sub_100032658();
      *(void *)&v26[0] = sub_100003FD4(v17, v18, aBlock);
      sub_100032858();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "%{public}s", v15, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      swift_errorRelease();
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
      swift_errorRelease();
    }
    return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  else
  {
    sub_10001633C(v27, v26);
    sub_100006CBC((uint64_t)v26, (uint64_t)aBlock);
    sub_100001DEC(&qword_1000416D0);
    if (swift_dynamicCast())
    {
      uint64_t v19 = (void *)aBlock[6];
      uint64_t v20 = swift_allocObject();
      *(unsigned char *)(v20 + 16) = a2 & 1;
      *(void *)(v20 + 24) = a3;
      *(void *)(v20 + 32) = a4;
      aBlock[4] = (uint64_t)sub_100016390;
      aBlock[5] = v20;
      aBlock[0] = (uint64_t)_NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = (uint64_t)sub_1000126F4;
      aBlock[3] = (uint64_t)&unk_10003DC68;
      uint64_t v21 = _Block_copy(aBlock);
      swift_retain();
      id v22 = a4;
      swift_release();
      [v19 fetchAllSharedActivityWithReplyHandler:v21];
      _Block_release(v21);
      swift_unknownObjectRelease();
      return sub_100006C6C((uint64_t)v26);
    }
    else
    {
      uint64_t result = sub_100032998();
      __break(1u);
    }
  }
  return result;
}

uint64_t sub_1000140AC(uint64_t a1, char a2, uint64_t a3, void *a4)
{
  uint64_t v33 = sub_100031BB8();
  uint64_t v8 = *(void *)(v33 - 8);
  __chkstk_darwin(v33);
  uint64_t v10 = (char *)&v31 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1000325C8();
  uint64_t v32 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v13 = (char *)&v31 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_1000325E8();
  __chkstk_darwin(v14);
  uint64_t v17 = (char *)&v31 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    sub_100031B98();
    swift_errorRetain();
    swift_errorRetain();
    unint64_t v18 = sub_100031BA8();
    os_log_type_t v19 = sub_1000327F8();
    if (os_log_type_enabled(v18, v19))
    {
      uint64_t v20 = (uint8_t *)swift_slowAlloc();
      uint64_t v21 = swift_slowAlloc();
      uint64_t v34 = a1;
      aBlock[0] = v21;
      *(_DWORD *)uint64_t v20 = 136446210;
      swift_errorRetain();
      sub_100001DEC(&qword_1000416F8);
      uint64_t v22 = sub_100032658();
      uint64_t v34 = sub_100003FD4(v22, v23, aBlock);
      sub_100032858();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v18, v19, "Failed to fetch family activity: %{public}s", v20, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
    }

    return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v33);
  }
  else
  {
    uint64_t v33 = v15;
    type metadata accessor for ActivityProvider();
    uint64_t v24 = sub_1000170EC(a2 & 1);
    uint64_t v25 = (*(uint64_t (**)(void))(*(void *)a3 + 128))();
    (*(void (**)(uint64_t))(*(void *)v24 + 136))(v25);
    sub_10001639C();
    unint64_t v26 = (void *)sub_100032808();
    uint64_t v27 = swift_allocObject();
    *(void *)(v27 + 16) = a4;
    *(void *)(v27 + 24) = v24;
    aBlock[4] = (uint64_t)sub_10001641C;
    aBlock[5] = v27;
    aBlock[0] = (uint64_t)_NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_100014598;
    aBlock[3] = (uint64_t)&unk_10003DCB8;
    char v28 = _Block_copy(aBlock);
    id v29 = a4;
    swift_retain();
    swift_release();
    sub_1000325D8();
    aBlock[0] = (uint64_t)_swiftEmptyArrayStorage;
    sub_100016474();
    sub_100001DEC(&qword_1000416E8);
    sub_1000164CC();
    sub_1000328B8();
    sub_100032818();
    _Block_release(v28);
    swift_release();

    (*(void (**)(char *, uint64_t))(v32 + 8))(v13, v11);
    return (*(uint64_t (**)(char *, uint64_t))(v33 + 8))(v17, v14);
  }
}

uint64_t sub_100014598(uint64_t a1)
{
  id v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

void sub_100014770()
{
  swift_retain();
  swift_retain();
  id v1 = v0;
  sub_100026700();
  uint64_t v3 = v2;
  objc_allocWithZone((Class)sub_100001DEC(&qword_100041678));
  swift_retain();
  swift_retain();
  id v4 = v3;
  int64_t v5 = (void *)sub_100032038();
  [v1 addChildViewController:v5];
  id v6 = [v1 view];
  if (!v6)
  {
    __break(1u);
    goto LABEL_14;
  }
  uint64_t v7 = v6;
  id v8 = [v5 view];
  if (!v8)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  uint64_t v9 = v8;
  [v7 addSubview:v8];

  id v10 = [v5 view];
  if (!v10)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  uint64_t v11 = v10;
  [v10 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v12 = [v5 view];
  if (!v12)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  uint64_t v13 = v12;
  id v14 = [v12 topAnchor];

  id v15 = [v1 view];
  if (!v15)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  uint64_t v16 = v15;
  id v17 = [v15 topAnchor];

  id v18 = [v14 constraintEqualToAnchor:v17];
  [v18 setActive:1];

  id v19 = [v5 view];
  if (!v19)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  uint64_t v20 = v19;
  id v21 = [v19 bottomAnchor];

  id v22 = [v1 view];
  if (!v22)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  unint64_t v23 = v22;
  id v24 = [v22 bottomAnchor];

  id v25 = [v21 constraintEqualToAnchor:v24];
  [v25 setActive:1];

  id v26 = [v5 view];
  if (!v26)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  uint64_t v27 = v26;
  id v28 = [v26 leftAnchor];

  id v29 = [v1 view];
  if (!v29)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  int64_t v30 = v29;
  id v31 = [v29 leftAnchor];

  id v32 = [v28 constraintEqualToAnchor:v31];
  [v32 setActive:1];

  id v33 = [v5 view];
  if (!v33)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  uint64_t v34 = v33;
  id v35 = [v33 rightAnchor];

  id v36 = [v1 view];
  if (v36)
  {
    uint64_t v37 = v36;
    id v38 = [v36 rightAnchor];

    id v39 = [v35 constraintEqualToAnchor:v38];
    [v39 setActive:1];

    [v5 didMoveToParentViewController:v1];
    swift_release();
    swift_release();

    return;
  }
LABEL_23:
  __break(1u);
}

uint64_t sub_100014BD0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = sub_100031BB8();
  uint64_t v37 = *(void *)(v7 - 8);
  uint64_t v38 = v7;
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v35 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v10 = v3;
  uint64_t v11 = sub_100015D68(a1, (uint64_t)v10, (void (*)(uint64_t, uint64_t))&dispatch thunk of TokenEncoder.encode(bundleIdentifier:), "Failed to encode application token: %{public}s");

  id v12 = v10;
  uint64_t v13 = sub_100015D68(a2, (uint64_t)v12, (void (*)(uint64_t, uint64_t))&dispatch thunk of TokenEncoder.encode(categoryIdentifier:), "Failed to encode category token: %{public}s");

  id v14 = v12;
  uint64_t v15 = sub_100015D68(a3, (uint64_t)v14, (void (*)(uint64_t, uint64_t))&dispatch thunk of TokenEncoder.encode(webDomain:), "Failed to encode web domain token: %{public}s");

  sub_100031B98();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v36 = v9;
  uint64_t v16 = sub_100031BA8();
  os_log_type_t v17 = sub_1000327C8();
  BOOL v18 = os_log_type_enabled(v16, v17);
  uint64_t v39 = v11;
  if (v18)
  {
    uint64_t v19 = v11;
    uint64_t v20 = swift_slowAlloc();
    *(_DWORD *)uint64_t v20 = 134219264;
    uint64_t v43 = *(void *)(v19 + 16);
    uint64_t v35 = a3;
    sub_100032858();
    swift_bridgeObjectRelease();
    *(_WORD *)(v20 + 12) = 2048;
    uint64_t v43 = *(void *)(a1 + 16);
    sub_100032858();
    swift_bridgeObjectRelease();
    *(_WORD *)(v20 + 22) = 2048;
    uint64_t v43 = *(void *)(v13 + 16);
    sub_100032858();
    swift_bridgeObjectRelease();
    *(_WORD *)(v20 + 32) = 2048;
    uint64_t v43 = *(void *)(a2 + 16);
    sub_100032858();
    swift_bridgeObjectRelease();
    *(_WORD *)(v20 + 42) = 2048;
    uint64_t v43 = *(void *)(v15 + 16);
    sub_100032858();
    swift_bridgeObjectRelease();
    *(_WORD *)(v20 + 52) = 2048;
    uint64_t v43 = *(void *)(v35 + 16);
    sub_100032858();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v16, v17, "Tokenized %ld/%ld applications, %ld/%ld categories, %ld/%ld webDomains", (uint8_t *)v20, 0x3Eu);
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  (*(void (**)(char *, uint64_t))(v37 + 8))(v36, v38);
  unint64_t v41 = _swiftEmptyArrayStorage;
  char v42 = _swiftEmptyArrayStorage;
  int64_t v40 = _swiftEmptyArrayStorage;
  sub_100011D3C((uint64_t)&v43);
  char v21 = v45[16];
  sub_10000FEF8((uint64_t)&v44, (uint64_t)v47, &qword_1000414D0);
  sub_1000158E0((uint64_t)v47);
  sub_10000FEF8((uint64_t)v45, (uint64_t)v46, &qword_1000414D0);
  uint64_t v22 = sub_1000158E0((uint64_t)v46);
  if (v21)
  {
    uint64_t v23 = swift_bridgeObjectRetain();
    sub_100013910(v23);
    uint64_t v24 = swift_bridgeObjectRetain();
    sub_100013910(v24);
    uint64_t v25 = swift_bridgeObjectRetain();
    uint64_t v22 = sub_100013910(v25);
  }
  uint64_t v26 = (*(uint64_t (**)(uint64_t))((swift_isaMask & *v14) + 0xD8))(v22);
  if (v26)
  {
    uint64_t v27 = (void *)v26;
    Class isa = sub_1000326F8().super.isa;
    swift_bridgeObjectRelease();
    Class v29 = sub_1000326F8().super.isa;
    swift_bridgeObjectRelease();
    Class v30 = sub_1000326F8().super.isa;
    swift_bridgeObjectRelease();
    Class v31 = sub_1000326F8().super.isa;
    swift_bridgeObjectRelease();
    Class v32 = sub_1000326F8().super.isa;
    swift_bridgeObjectRelease();
    Class v33 = sub_1000326F8().super.isa;
    swift_bridgeObjectRelease();
    [v27 didSelectWithApplications:isa categories:v29 webDomains:v30 untokenizedApplications:v31 untokenizedCategories:v32 untokenizedWebDomains:v33];

    return swift_unknownObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
}

void *sub_100015154()
{
  uint64_t result = (void *)(*(uint64_t (**)(void))((swift_isaMask & *v0) + 0xD8))();
  if (result)
  {
    [result didCancel];
    return (void *)swift_unknownObjectRelease();
  }
  return result;
}

id sub_1000151D8(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = v3;
  if (a2)
  {
    NSString v6 = sub_100032608();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v6 = 0;
  }
  id v7 = [objc_allocWithZone(v4) initWithNibName:v6 bundle:a3];

  return v7;
}

void sub_100015250()
{
}

id sub_1000152B4()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ActivityPickerServiceViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

char *sub_100015374(char *result, int64_t a2, char a3, char *a4)
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
      sub_100001DEC(&qword_1000416A8);
      id v10 = (char *)swift_allocObject();
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
      id v10 = (char *)&_swiftEmptyArrayStorage;
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
    sub_100015970(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_100015484(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
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
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      sub_100001DEC(&qword_1000416C0);
      id v10 = (void *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      id v10 = _swiftEmptyArrayStorage;
      uint64_t v13 = &_swiftEmptyArrayStorage[4];
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4]) {
          memmove(v13, a4 + 4, 16 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_100015C74(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_100015594(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
{
  char v5 = (void *)result;
  uint64_t v6 = a4 + 56;
  uint64_t v7 = -1 << *(unsigned char *)(a4 + 32);
  if (-v7 < 64) {
    uint64_t v8 = ~(-1 << -(char)v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(a4 + 56);
  if (!a2)
  {
    int64_t v12 = 0;
    uint64_t v10 = 0;
LABEL_38:
    *char v5 = a4;
    v5[1] = v6;
    v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return v10;
  }
  uint64_t v10 = a3;
  if (!a3)
  {
    int64_t v12 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  int64_t v11 = a2;
  int64_t v12 = 0;
  uint64_t v13 = 0;
  int64_t v14 = (unint64_t)(63 - v7) >> 6;
  if (!v9) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  unint64_t v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    uint64_t v20 = (void *)(*(void *)(a4 + 48) + 16 * v16);
    uint64_t v21 = v20[1];
    *int64_t v11 = *v20;
    v11[1] = v21;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
    v11 += 2;
    uint64_t result = swift_bridgeObjectRetain();
    if (v9) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v17 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v17 >= v14) {
      goto LABEL_33;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    if (!v18) {
      break;
    }
LABEL_18:
    unint64_t v9 = (v18 - 1) & v18;
    unint64_t v16 = __clz(__rbit64(v18)) + (v17 << 6);
    int64_t v12 = v17;
  }
  v12 += 2;
  if (v17 + 1 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18) {
    goto LABEL_14;
  }
  int64_t v19 = v17 + 2;
  if (v17 + 2 >= v14) {
    goto LABEL_33;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18) {
    goto LABEL_17;
  }
  int64_t v12 = v17 + 3;
  if (v17 + 3 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17 + 2;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18)
  {
LABEL_14:
    int64_t v17 = v12;
    goto LABEL_18;
  }
  int64_t v19 = v17 + 4;
  if (v17 + 4 >= v14)
  {
LABEL_33:
    unint64_t v9 = 0;
LABEL_37:
    uint64_t v10 = v13;
    goto LABEL_38;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_17:
    int64_t v17 = v19;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v17 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v17 >= v14)
    {
      unint64_t v9 = 0;
      int64_t v12 = v14 - 1;
      goto LABEL_37;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v19;
    if (v18) {
      goto LABEL_18;
    }
  }
LABEL_41:
  __break(1u);
  return result;
}

void sub_100015794()
{
  uint64_t v1 = OBJC_IVAR___ActivityPickerServiceViewController_viewConfiguration;
  type metadata accessor for ActivityPickerViewConfiguration();
  *(void *)&v0[v1] = sub_1000111FC();
  *(void *)&v0[OBJC_IVAR___ActivityPickerServiceViewController_tokenDecoder] = 0;
  *(void *)&v0[OBJC_IVAR___ActivityPickerServiceViewController_tokenEncoder] = 0;
  objc_super v2 = &v0[OBJC_IVAR___ActivityPickerServiceViewController____lazy_storage___client];
  *(_OWORD *)objc_super v2 = 0u;
  *((void *)v2 + 2) = 1;
  v2[40] = 0;
  *(_OWORD *)(v2 + 24) = 0u;
  uint64_t v3 = &v0[OBJC_IVAR___ActivityPickerServiceViewController____lazy_storage___connectionPrivate];
  *(void *)uint64_t v3 = 0;
  *((void *)v3 + 1) = 0;

  sub_100032998();
  __break(1u);
}

uint64_t sub_100015868(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100015878()
{
  return swift_release();
}

uint64_t sub_100015880(uint64_t a1)
{
  uint64_t v2 = sub_100001DEC(&qword_100041668);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1000158E0(uint64_t a1)
{
  return a1;
}

uint64_t *sub_10001590C(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_100015970(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  uint64_t result = sub_1000329D8();
  __break(1u);
  return result;
}

char *sub_100015A64(uint64_t a1, uint64_t a2, uint64_t (*a3)(char *), const char *a4)
{
  uint64_t v21 = a4;
  uint64_t v5 = *(void *)(a1 + 16);
  if (!v5) {
    return (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v7 = (unint64_t *)(swift_bridgeObjectRetain() + 40);
  uint64_t v8 = (char *)&_swiftEmptyArrayStorage;
  do
  {
    uint64_t v10 = *(v7 - 1);
    unint64_t v11 = *v7;
    v20[0] = v10;
    v20[1] = v11;
    sub_100016528(v10, v11);
    sub_100013414((uint64_t)v20, a2, a3, v21, &v18);
    if (v4)
    {
      sub_100016580(v10, v11);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v8;
    }
    sub_100016580(v10, v11);
    uint64_t v12 = v19;
    if (v19)
    {
      uint64_t v13 = v18;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v8 = sub_100015374(0, *((void *)v8 + 2) + 1, 1, v8);
      }
      unint64_t v15 = *((void *)v8 + 2);
      unint64_t v14 = *((void *)v8 + 3);
      if (v15 >= v14 >> 1) {
        uint64_t v8 = sub_100015374((char *)(v14 > 1), v15 + 1, 1, v8);
      }
      *((void *)v8 + 2) = v15 + 1;
      unint64_t v9 = &v8[16 * v15];
      *((void *)v9 + 4) = v13;
      *((void *)v9 + 5) = v12;
    }
    v7 += 2;
    --v5;
  }
  while (v5);
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t sub_100015BCC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = sub_100032788();
  uint64_t v8 = result;
  if (v2)
  {
    uint64_t v4 = (Swift::Int *)(a1 + 40);
    do
    {
      Swift::Int v5 = *(v4 - 1);
      Swift::Int v6 = *v4;
      swift_bridgeObjectRetain();
      sub_1000057FC(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

uint64_t sub_100015C68(uint64_t a1)
{
  return sub_100013CDC(a1, *(unsigned char *)(v1 + 16), *(void *)(v1 + 24), *(void **)(v1 + 32));
}

uint64_t sub_100015C74(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  uint64_t result = sub_1000329D8();
  __break(1u);
  return result;
}

uint64_t sub_100015D68(uint64_t a1, uint64_t a2, void (*a3)(uint64_t, uint64_t), const char *a4)
{
  uint64_t v47 = a4;
  uint64_t v52 = a3;
  uint64_t v5 = v4;
  uint64_t v8 = sub_100031BB8();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  unint64_t v11 = (char *)&v42 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v43 = sub_100001DEC(&qword_1000416B0);
  __chkstk_darwin(v43);
  unint64_t v54 = (char *)&v42 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = *(void *)(a1 + 56);
  uint64_t v51 = a1 + 56;
  uint64_t v15 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v16 = -1;
  if (v15 < 64) {
    uint64_t v16 = ~(-1 << v15);
  }
  unint64_t v17 = v16 & v14;
  uint64_t v55 = a1;
  uint64_t v56 = OBJC_IVAR___ActivityPickerServiceViewController_tokenEncoder;
  int64_t v53 = (unint64_t)(v15 + 63) >> 6;
  uint64_t v50 = (void (**)(char *, uint64_t))(v9 + 8);
  char v42 = (void (**)(char *, uint64_t))(v12 + 8);
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v19 = 0;
  uint64_t v44 = _swiftEmptyArrayStorage;
  *(void *)&long long v20 = 136446210;
  long long v46 = v20;
  uint64_t v45 = (char *)&type metadata for Any + 8;
  uint64_t v48 = v11;
  while (v17)
  {
    unint64_t v21 = __clz(__rbit64(v17));
    v17 &= v17 - 1;
    unint64_t v22 = v21 | (v19 << 6);
LABEL_19:
    if (*(void *)(a2 + v56))
    {
      unint64_t v57 = v17;
      int64_t v58 = v19;
      uint64_t v26 = (uint64_t *)(*(void *)(v55 + 48) + 16 * v22);
      uint64_t v27 = *v26;
      uint64_t v28 = v26[1];
      swift_bridgeObjectRetain();
      swift_retain();
      v52(v27, v28);
      if (v5)
      {
        swift_release();
        sub_100031B98();
        swift_errorRetain();
        swift_errorRetain();
        Class v29 = sub_100031BA8();
        os_log_type_t v30 = sub_1000327D8();
        if (os_log_type_enabled(v29, v30))
        {
          uint64_t v31 = swift_slowAlloc();
          uint64_t v49 = swift_slowAlloc();
          uint64_t v60 = v49;
          *(_DWORD *)uint64_t v31 = v46;
          uint64_t v59 = v5;
          swift_errorRetain();
          sub_100001DEC(&qword_1000416B8);
          uint64_t v32 = sub_100032658();
          *(void *)(v31 + 4) = sub_100003FD4(v32, v33, &v60);
          swift_bridgeObjectRelease();
          swift_errorRelease();
          swift_errorRelease();
          _os_log_impl((void *)&_mh_execute_header, v29, v30, v47, (uint8_t *)v31, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          unint64_t v11 = v48;
          swift_slowDealloc();

          swift_errorRelease();
        }
        else
        {
          swift_errorRelease();
          swift_errorRelease();
          swift_errorRelease();
        }
        (*v50)(v11, v8);
        uint64_t result = swift_bridgeObjectRelease();
        uint64_t v5 = 0;
      }
      else
      {
        swift_release();
        uint64_t v34 = v43;
        uint64_t v35 = v54;
        uint64_t v49 = sub_100031AE8();
        uint64_t v37 = v36;
        (*v42)(v35, v34);
        swift_bridgeObjectRelease();
        uint64_t result = swift_isUniquelyReferenced_nonNull_native();
        if ((result & 1) == 0)
        {
          uint64_t result = (uint64_t)sub_100015484(0, v44[2] + 1, 1, v44);
          uint64_t v44 = (void *)result;
        }
        unint64_t v39 = v44[2];
        unint64_t v38 = v44[3];
        if (v39 >= v38 >> 1)
        {
          uint64_t result = (uint64_t)sub_100015484((void *)(v38 > 1), v39 + 1, 1, v44);
          uint64_t v44 = (void *)result;
        }
        int64_t v40 = v44;
        v44[2] = v39 + 1;
        unint64_t v41 = &v40[2 * v39];
        v41[4] = v49;
        v41[5] = v37;
        uint64_t v5 = 0;
        unint64_t v11 = v48;
      }
      unint64_t v17 = v57;
      int64_t v19 = v58;
    }
  }
  if (__OFADD__(v19++, 1))
  {
    __break(1u);
    goto LABEL_37;
  }
  if (v19 >= v53) {
    goto LABEL_35;
  }
  unint64_t v24 = *(void *)(v51 + 8 * v19);
  if (v24)
  {
LABEL_18:
    unint64_t v17 = (v24 - 1) & v24;
    unint64_t v22 = __clz(__rbit64(v24)) + (v19 << 6);
    goto LABEL_19;
  }
  int64_t v25 = v19 + 1;
  if (v19 + 1 >= v53) {
    goto LABEL_35;
  }
  unint64_t v24 = *(void *)(v51 + 8 * v25);
  if (v24) {
    goto LABEL_17;
  }
  int64_t v25 = v19 + 2;
  if (v19 + 2 >= v53) {
    goto LABEL_35;
  }
  unint64_t v24 = *(void *)(v51 + 8 * v25);
  if (v24) {
    goto LABEL_17;
  }
  int64_t v25 = v19 + 3;
  if (v19 + 3 >= v53) {
    goto LABEL_35;
  }
  unint64_t v24 = *(void *)(v51 + 8 * v25);
  if (v24) {
    goto LABEL_17;
  }
  int64_t v25 = v19 + 4;
  if (v19 + 4 >= v53)
  {
LABEL_35:
    swift_release();
    return (uint64_t)v44;
  }
  unint64_t v24 = *(void *)(v51 + 8 * v25);
  if (v24)
  {
LABEL_17:
    int64_t v19 = v25;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v19 = v25 + 1;
    if (__OFADD__(v25, 1)) {
      break;
    }
    if (v19 >= v53) {
      goto LABEL_35;
    }
    unint64_t v24 = *(void *)(v51 + 8 * v19);
    ++v25;
    if (v24) {
      goto LABEL_18;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_1000162EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3 != 1)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_100016334()
{
  return swift_release();
}

_OWORD *sub_10001633C(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_100016350()
{
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100016390(uint64_t a1)
{
  return sub_1000140AC(a1, *(unsigned char *)(v1 + 16), *(void *)(v1 + 24), *(void **)(v1 + 32));
}

unint64_t sub_10001639C()
{
  unint64_t result = qword_1000416D8;
  if (!qword_1000416D8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1000416D8);
  }
  return result;
}

uint64_t sub_1000163DC()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10001641C()
{
  return (*(uint64_t (**)(void))((swift_isaMask & **(void **)(v0 + 16)) + 0xE8))(*(void *)(v0 + 24));
}

unint64_t sub_100016474()
{
  unint64_t result = qword_1000416E0;
  if (!qword_1000416E0)
  {
    sub_1000325C8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000416E0);
  }
  return result;
}

unint64_t sub_1000164CC()
{
  unint64_t result = qword_1000416F0;
  if (!qword_1000416F0)
  {
    sub_100006B14(&qword_1000416E8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000416F0);
  }
  return result;
}

uint64_t sub_100016528(uint64_t a1, unint64_t a2)
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

uint64_t sub_100016580(uint64_t a1, unint64_t a2)
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

uint64_t sub_1000165D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3 != 1)
  {
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

void sub_100016620()
{
}

uint64_t sub_100016644()
{
  return *v0;
}

uint64_t sub_10001664C()
{
  uint64_t v1 = *(void *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_10001667C()
{
  return *(unsigned __int8 *)(v0 + 40);
}

double sub_100016684@<D0>(void *a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t v16 = a3;
  uint64_t v5 = sub_100031BB8();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v9 = [a1 processIdentifier];
  [a1 auditToken];
  long long v10 = v17;
  long long v11 = v18[0];
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, a2, v5);
  sub_100016868(v9, v10, *((uint64_t *)&v10 + 1), v11, *((uint64_t *)&v11 + 1), a1, (uint64_t)v8, (uint64_t)&v17);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a2, v5);
  long long v12 = v18[0];
  uint64_t v13 = v16;
  *uint64_t v16 = v17;
  v13[1] = v12;
  double result = *(double *)((char *)v18 + 9);
  *(_OWORD *)((char *)v13 + 25) = *(_OWORD *)((char *)v18 + 9);
  return result;
}

double sub_1000167EC@<D0>(int a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, void *a6@<X5>, uint64_t a7@<X6>, _OWORD *a8@<X8>)
{
  sub_100016868(a1, a2, a3, a4, a5, a6, a7, (uint64_t)&v11);
  long long v9 = v12[0];
  *a8 = v11;
  a8[1] = v9;
  double result = *(double *)((char *)v12 + 9);
  *(_OWORD *)((char *)a8 + 25) = *(_OWORD *)((char *)v12 + 9);
  return result;
}

unint64_t sub_10001682C(uint64_t a1)
{
  long long v2 = (void (**)(void, void))sub_100016EE0();

  return sub_100010354(a1, v2);
}

uint64_t sub_100016868@<X0>(int a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, void *a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
{
  *(void *)token.val = a2;
  *(void *)&token.val[2] = a3;
  *(void *)&token.val[4] = a4;
  *(void *)&token.val[6] = a5;
  SecTaskRef v16 = SecTaskCreateWithAuditToken(0, &token);
  if (v16)
  {
    SecTaskRef v17 = v16;
    uint64_t v18 = sub_100006D78();
    uint64_t v33 = v19;
    uint64_t v34 = v18;
    char v32 = sub_100006F90();
    *(void *)token.val = a2;
    *(void *)&token.val[2] = a3;
    *(void *)&token.val[4] = a4;
    *(void *)&token.val[6] = a5;
    char v36 = 0;
    uint64_t v24 = sub_100031B88();
    uint64_t v26 = v25;

    uint64_t v27 = sub_100031BB8();
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v27 - 8) + 8))(a7, v27);
    uint64_t v30 = v33;
    uint64_t v29 = v34;
    char v31 = v32;
  }
  else
  {
    long long v20 = sub_100031BA8();
    os_log_type_t v21 = sub_1000327D8();
    if (os_log_type_enabled(v20, v21))
    {
      unint64_t v22 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v22 = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, v21, "Failed to create SecTask from audit token", v22, 2u);
      swift_slowDealloc();
    }

    uint64_t v23 = sub_100031BB8();
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v23 - 8) + 8))(a7, v23);
    char v31 = 0;
    uint64_t v24 = 0;
    uint64_t v26 = 0;
    uint64_t v29 = 0;
    uint64_t v30 = 0;
  }
  *(_DWORD *)a8 = a1;
  *(void *)(a8 + 8) = v29;
  *(void *)(a8 + 16) = v30;
  *(void *)(a8 + 24) = v24;
  *(void *)(a8 + 32) = v26;
  *(unsigned char *)(a8 + 40) = v31 & 1;
  return result;
}

unint64_t sub_100016C20(uint64_t a1)
{
  unint64_t result = sub_100016C48();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_100016C48()
{
  unint64_t result = qword_100041700;
  if (!qword_100041700)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041700);
  }
  return result;
}

uint64_t destroy for ClientIdentity()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ClientIdentity(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ClientIdentity(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  return a1;
}

__n128 initializeWithTake for ClientIdentity(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 25) = *(_OWORD *)(a2 + 25);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for ClientIdentity(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  uint64_t v4 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v5;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  return a1;
}

uint64_t getEnumTagSinglePayload for ClientIdentity(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 41)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 16);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ClientIdentity(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 40) = 0;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 41) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 41) = 0;
    }
    if (a2) {
      *(void *)(result + 16) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ClientIdentity()
{
  return &type metadata for ClientIdentity;
}

unint64_t sub_100016EE0()
{
  unint64_t result = qword_100041708;
  if (!qword_100041708)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041708);
  }
  return result;
}

uint64_t sub_100016F34()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_100016F3C()
{
  return swift_unknownObjectWeakLoadStrong();
}

uint64_t sub_100016F84(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  *(void *)(v2 + 32) = a2;
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

void (*sub_100016FE8(void *a1))(uint64_t a1, char a2)
{
  unint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[5] = v1;
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  uint64_t v5 = *(void *)(v1 + 32);
  v3[3] = Strong;
  v3[4] = v5;
  return sub_100017068;
}

void sub_100017068(uint64_t a1, char a2)
{
  unint64_t v3 = *(void **)a1;
  *(void *)(*(void *)(*(void *)a1 + 40) + 32) = *(void *)(*(void *)a1 + 32);
  swift_unknownObjectWeakAssign();
  if (a2)
  {
    swift_unknownObjectRelease();
    swift_endAccess();
  }
  else
  {
    swift_endAccess();
    swift_unknownObjectRelease();
  }

  free(v3);
}

uint64_t sub_1000170EC(int a1)
{
  uint64_t v2 = swift_allocObject();
  sub_10001712C(a1);
  return v2;
}

uint64_t sub_10001712C(int a1)
{
  LODWORD(v143) = a1;
  uint64_t v142 = sub_100031BB8();
  uint64_t v139 = *(char **)(v142 - 8);
  __chkstk_darwin(v142);
  uint64_t v145 = (char *)&v137 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100001DEC(&qword_100041710);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  uint64_t v6 = (char *)&v137 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v137 - v7;
  uint64_t v144 = sub_100031918();
  uint64_t v9 = *(void *)(v144 - 8);
  __chkstk_darwin(v144);
  long long v11 = (char *)&v137 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100031AD8();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v137 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v140 = v1;
  *(void *)(v1 + 32) = 0;
  swift_unknownObjectWeakInit();
  sub_100031998();
  swift_allocObject();
  uint64_t v16 = sub_100031988();
  sub_100031AB8();
  sub_100031AC8();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  uint64_t v141 = v16;
  sub_100031978();
  uint64_t v145 = 0;
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v144);
  uint64_t v155 = (char *)&_swiftEmptyDictionarySingleton;
  v148 = (char *)v141;
  sub_10001CD98(&qword_100041718, (void (*)(uint64_t))&type metadata accessor for UsageStore);
  swift_retain();
  sub_1000326C8();
  sub_10001CD98(&qword_100041720, (void (*)(uint64_t))&type metadata accessor for UsageStore);
  unint64_t v17 = v152;
  uint64_t v18 = v153;
  LOBYTE(v11) = v154;
  sub_100032798();
  if ((v11 & 1) == 0)
  {
    int v19 = v149;
    while (1)
    {
      if (v150) {
        goto LABEL_8;
      }
      if (v18 != v19) {
        break;
      }
      if ((char *)v17 == v148) {
        goto LABEL_9;
      }
      long long v20 = (void (*)(char **, void))sub_1000327B8();
      sub_10001C778(v21, (uint64_t)v8);
      v20(&v148, 0);
      v148 = (char *)v151;
      sub_1000327A8();
      sub_10001C7E0((uint64_t)v8, (uint64_t)v6);
      sub_10001856C((uint64_t *)&v155, v6);
      if (v145) {
        goto LABEL_148;
      }
      sub_10001C848((uint64_t)v6);
      unint64_t v17 = v152;
      uint64_t v18 = v153;
      char v22 = v154;
      sub_100032798();
      int v19 = v149;
      if (v22) {
        goto LABEL_8;
      }
    }
    __break(1u);
LABEL_69:
    __break(1u);
LABEL_70:
    __break(1u);
LABEL_71:
    swift_bridgeObjectRetain();
    uint64_t v52 = sub_1000329A8();
    uint64_t v144 = v52;
    uint64_t v145 = (char *)v17;
    if (!v52) {
      goto LABEL_72;
    }
    goto LABEL_30;
  }
LABEL_8:
  __break(1u);
LABEL_9:
  uint64_t v23 = v152;
  uint64_t v24 = (uint64_t)v153;
  char v25 = v154;
  swift_release();
  sub_10001C8A8(v23, v24, v25);
  uint64_t v6 = v155;
  id v26 = [self sharedCategories];
  uint64_t v27 = sub_10000AEE8();

  uint64_t v28 = *(void *)(v27 + 16);
  uint64_t v18 = (char *)_swiftEmptyArrayStorage;
  uint64_t v144 = v27;
  if (v28)
  {
    uint64_t v29 = (void **)(v27 + 32);
    do
    {
      char v31 = *v29;
      uint64_t v32 = sub_100032638();
      uint64_t v34 = v33;
      uint64_t v35 = *((void *)v6 + 2);
      id v36 = v31;
      if (v35)
      {
        sub_10001AAE0(v32, v34);
        if (v37)
        {
          swift_bridgeObjectRelease();

          goto LABEL_13;
        }
      }
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v148 = v6;
      unint64_t v17 = sub_10001AAE0(v32, v34);
      uint64_t v40 = *((void *)v6 + 2);
      BOOL v41 = (v39 & 1) == 0;
      uint64_t v42 = v40 + v41;
      if (__OFADD__(v40, v41)) {
        goto LABEL_69;
      }
      char v43 = v39;
      if (*((void *)v6 + 3) >= v42)
      {
        if (isUniquelyReferenced_nonNull_native)
        {
          uint64_t v6 = v148;
          if ((v39 & 1) == 0) {
            goto LABEL_24;
          }
        }
        else
        {
          sub_10001C3BC();
          uint64_t v6 = v148;
          if ((v43 & 1) == 0) {
            goto LABEL_24;
          }
        }
      }
      else
      {
        sub_10001BFC0(v42, isUniquelyReferenced_nonNull_native);
        unint64_t v44 = sub_10001AAE0(v32, v34);
        if ((v43 & 1) != (v45 & 1)) {
          goto LABEL_149;
        }
        unint64_t v17 = v44;
        uint64_t v6 = v148;
        if ((v43 & 1) == 0)
        {
LABEL_24:
          *(void *)&v6[8 * (v17 >> 6) + 64] |= 1 << v17;
          long long v46 = (uint64_t *)(*((void *)v6 + 6) + 16 * v17);
          *long long v46 = v32;
          v46[1] = v34;
          uint64_t v18 = (char *)_swiftEmptyArrayStorage;
          *(void *)(*((void *)v6 + 7) + 8 * v17) = _swiftEmptyArrayStorage;
          uint64_t v47 = *((void *)v6 + 2);
          BOOL v48 = __OFADD__(v47, 1);
          uint64_t v49 = v47 + 1;
          if (v48) {
            goto LABEL_70;
          }
          *((void *)v6 + 2) = v49;
          swift_bridgeObjectRetain();
          goto LABEL_12;
        }
      }
      uint64_t v30 = *((void *)v6 + 7);
      swift_bridgeObjectRelease();
      uint64_t v18 = (char *)_swiftEmptyArrayStorage;
      *(void *)(v30 + 8 * v17) = _swiftEmptyArrayStorage;
LABEL_12:

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
LABEL_13:
      ++v29;
      --v28;
    }
    while (v28);
  }
  swift_bridgeObjectRelease();
  uint64_t v50 = swift_bridgeObjectRetain();
  uint64_t v51 = v145;
  unint64_t v17 = (unint64_t)sub_100018C6C(v50, v143 & 1);
  uint64_t v139 = v51;
  swift_bridgeObjectRelease();
  uint64_t v155 = (char *)_swiftEmptyArrayStorage;
  if (v17 >> 62) {
    goto LABEL_71;
  }
  uint64_t v52 = *(void *)((v17 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  uint64_t v144 = v52;
  uint64_t v145 = (char *)v17;
  if (v52)
  {
LABEL_30:
    if (v52 < 1)
    {
      __break(1u);
LABEL_145:
      __break(1u);
      goto LABEL_146;
    }
    uint64_t v53 = 0;
    unint64_t v143 = v17 & 0xC000000000000001;
    while (1)
    {
      if (v143)
      {
        uint64_t v55 = sub_100032908();
      }
      else
      {
        uint64_t v55 = *(void *)(v17 + 8 * v53 + 32);
        swift_retain();
      }
      uint64_t v56 = sub_100009F68();
      unint64_t v57 = *(uint64_t (**)(void))(*(void *)v55 + 112);
      id v58 = (id)*v56;
      char v59 = *(unsigned char *)(v57() + 16);
      swift_release();
      char v147 = v59;
      char v146 = 1;
      sub_10000674C();
      sub_1000326D8();
      sub_1000326D8();
      if (v148 == (char *)v151 && v149 == v152)
      {
        uint64_t v60 = swift_bridgeObjectRelease_n();
      }
      else
      {
        char v61 = sub_100032A38();
        swift_bridgeObjectRelease();
        uint64_t v60 = swift_bridgeObjectRelease();
        if ((v61 & 1) == 0)
        {
          swift_release();

          uint64_t v54 = v144;
          unint64_t v17 = (unint64_t)v145;
          goto LABEL_33;
        }
      }
      uint64_t v62 = ((uint64_t (*)(uint64_t))v57)(v60);
      uint64_t v64 = *(void *)(v62 + 24);
      uint64_t v63 = *(void *)(v62 + 32);
      swift_bridgeObjectRetain();
      swift_release();
      if (v64 == sub_100032638() && v63 == v65)
      {

        swift_bridgeObjectRelease_n();
        uint64_t v54 = v144;
        unint64_t v17 = (unint64_t)v145;
LABEL_48:
        sub_100032938();
        sub_100032968();
        sub_100032978();
        sub_100032948();
        goto LABEL_33;
      }
      char v67 = sub_100032A38();

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v54 = v144;
      unint64_t v17 = (unint64_t)v145;
      if (v67) {
        goto LABEL_48;
      }
      swift_release();
LABEL_33:
      if (v54 == ++v53)
      {
        swift_bridgeObjectRelease();
        uint64_t v138 = v155;
        uint64_t v155 = (char *)_swiftEmptyArrayStorage;
        uint64_t v142 = CTCategoryIdentifierSocialNetworking;
        swift_bridgeObjectRetain();
        uint64_t v68 = 0;
        while (1)
        {
          if (v143)
          {
            uint64_t v69 = sub_100032908();
          }
          else
          {
            uint64_t v69 = *(void *)(v17 + 8 * v68 + 32);
            swift_retain();
          }
          uint64_t v70 = *(uint64_t (**)(void))(*(void *)v69 + 112);
          char v71 = *(unsigned char *)(v70() + 16);
          swift_release();
          char v147 = v71;
          char v146 = 1;
          sub_1000326D8();
          sub_1000326D8();
          if (v148 == (char *)v151 && v149 == v152)
          {
            uint64_t v72 = swift_bridgeObjectRelease_n();
          }
          else
          {
            char v73 = sub_100032A38();
            swift_bridgeObjectRelease();
            uint64_t v72 = swift_bridgeObjectRelease();
            if ((v73 & 1) == 0)
            {
              swift_release();
              uint64_t v52 = v144;
              unint64_t v17 = (unint64_t)v145;
              goto LABEL_51;
            }
          }
          uint64_t v74 = ((uint64_t (*)(uint64_t))v70)(v72);
          uint64_t v76 = *(void *)(v74 + 24);
          uint64_t v75 = *(void *)(v74 + 32);
          swift_bridgeObjectRetain();
          swift_release();
          if (v76 == sub_100032638() && v75 == v77)
          {
            swift_bridgeObjectRelease_n();
            uint64_t v52 = v144;
            unint64_t v17 = (unint64_t)v145;
LABEL_66:
            sub_100032938();
            sub_100032968();
            sub_100032978();
            sub_100032948();
            goto LABEL_51;
          }
          char v79 = sub_100032A38();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          uint64_t v52 = v144;
          unint64_t v17 = (unint64_t)v145;
          if (v79) {
            goto LABEL_66;
          }
          swift_release();
LABEL_51:
          if (v52 == ++v68)
          {
            swift_bridgeObjectRelease();
            int v80 = v155;
            uint64_t v18 = (char *)_swiftEmptyArrayStorage;
            uint64_t v81 = v138;
            goto LABEL_73;
          }
        }
      }
    }
  }
LABEL_72:
  swift_bridgeObjectRelease();
  int v80 = (char *)_swiftEmptyArrayStorage;
  uint64_t v81 = (char *)_swiftEmptyArrayStorage;
LABEL_73:
  v148 = v81;
  sub_10001AC50((unint64_t)v80);
  uint64_t v82 = (uint64_t)v148;
  uint64_t v155 = v18;
  if (v52)
  {
    if (v52 >= 1)
    {
      uint64_t v142 = (uint64_t)v148;
      unint64_t v83 = v17 & 0xC000000000000001;
      unint64_t v143 = CTCategoryIdentifierGames;
      swift_bridgeObjectRetain();
      uint64_t v84 = 0;
      while (1)
      {
        if (v83)
        {
          uint64_t v85 = sub_100032908();
        }
        else
        {
          uint64_t v85 = *(void *)(v17 + 8 * v84 + 32);
          swift_retain();
        }
        uint64_t v86 = *(uint64_t (**)(void))(*(void *)v85 + 112);
        char v87 = *(unsigned char *)(v86() + 16);
        swift_release();
        char v147 = v87;
        char v146 = 1;
        sub_10000674C();
        sub_1000326D8();
        sub_1000326D8();
        if (v148 == (char *)v151 && v149 == v152)
        {
          uint64_t v88 = swift_bridgeObjectRelease_n();
        }
        else
        {
          char v89 = sub_100032A38();
          swift_bridgeObjectRelease();
          uint64_t v88 = swift_bridgeObjectRelease();
          if ((v89 & 1) == 0)
          {
            swift_release();
            uint64_t v52 = v144;
            unint64_t v17 = (unint64_t)v145;
            goto LABEL_77;
          }
        }
        uint64_t v90 = ((uint64_t (*)(uint64_t))v86)(v88);
        uint64_t v92 = *(void *)(v90 + 24);
        uint64_t v91 = *(void *)(v90 + 32);
        swift_bridgeObjectRetain();
        swift_release();
        if (v92 == sub_100032638() && v91 == v93)
        {
          swift_bridgeObjectRelease_n();
          uint64_t v52 = v144;
          unint64_t v17 = (unint64_t)v145;
LABEL_92:
          sub_100032938();
          sub_100032968();
          sub_100032978();
          sub_100032948();
          goto LABEL_77;
        }
        char v95 = sub_100032A38();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v52 = v144;
        unint64_t v17 = (unint64_t)v145;
        if (v95) {
          goto LABEL_92;
        }
        swift_release();
LABEL_77:
        if (v52 == ++v84)
        {
          swift_bridgeObjectRelease();
          unint64_t v96 = (unint64_t)v155;
          uint64_t v18 = (char *)_swiftEmptyArrayStorage;
          uint64_t v82 = v142;
          goto LABEL_95;
        }
      }
    }
    goto LABEL_145;
  }
  unint64_t v96 = (unint64_t)v18;
LABEL_95:
  v148 = (char *)v82;
  sub_10001AC50(v96);
  uint64_t v97 = (uint64_t)v148;
  uint64_t v155 = v18;
  if (v52)
  {
    if (v52 < 1)
    {
LABEL_146:
      __break(1u);
LABEL_147:
      __break(1u);
LABEL_148:
      swift_bridgeObjectRelease();
      sub_10001C848((uint64_t)v6);
      uint64_t v134 = v152;
      uint64_t v135 = (uint64_t)v153;
      char v136 = v154;
      swift_release();
      sub_10001C8A8(v134, v135, v136);
      __break(1u);
LABEL_149:
      sub_100032A58();
      __break(1u);
      goto LABEL_150;
    }
    uint64_t v142 = (uint64_t)v148;
    unint64_t v98 = v17 & 0xC000000000000001;
    unint64_t v143 = CTCategoryIdentifierEntertainment;
    swift_bridgeObjectRetain();
    uint64_t v99 = 0;
    while (1)
    {
      if (v98)
      {
        uint64_t v100 = sub_100032908();
      }
      else
      {
        uint64_t v100 = *(void *)(v17 + 8 * v99 + 32);
        swift_retain();
      }
      uint64_t v101 = *(uint64_t (**)(void))(*(void *)v100 + 112);
      char v102 = *(unsigned char *)(v101() + 16);
      swift_release();
      char v147 = v102;
      char v146 = 1;
      sub_10000674C();
      sub_1000326D8();
      sub_1000326D8();
      if (v148 == (char *)v151 && v149 == v152)
      {
        uint64_t v103 = swift_bridgeObjectRelease_n();
      }
      else
      {
        char v104 = sub_100032A38();
        swift_bridgeObjectRelease();
        uint64_t v103 = swift_bridgeObjectRelease();
        if ((v104 & 1) == 0)
        {
          swift_release();
          uint64_t v52 = v144;
          unint64_t v17 = (unint64_t)v145;
          goto LABEL_99;
        }
      }
      uint64_t v105 = ((uint64_t (*)(uint64_t))v101)(v103);
      uint64_t v107 = *(void *)(v105 + 24);
      uint64_t v106 = *(void *)(v105 + 32);
      swift_bridgeObjectRetain();
      swift_release();
      if (v107 == sub_100032638() && v106 == v108)
      {
        swift_bridgeObjectRelease_n();
        uint64_t v52 = v144;
        unint64_t v17 = (unint64_t)v145;
LABEL_114:
        sub_100032938();
        sub_100032968();
        sub_100032978();
        sub_100032948();
        goto LABEL_99;
      }
      char v110 = sub_100032A38();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v52 = v144;
      unint64_t v17 = (unint64_t)v145;
      if (v110) {
        goto LABEL_114;
      }
      swift_release();
LABEL_99:
      if (v52 == ++v99)
      {
        swift_bridgeObjectRelease();
        unint64_t v111 = (unint64_t)v155;
        uint64_t v18 = (char *)_swiftEmptyArrayStorage;
        uint64_t v97 = v142;
        goto LABEL_117;
      }
    }
  }
  unint64_t v111 = (unint64_t)v18;
LABEL_117:
  v148 = (char *)v97;
  sub_10001AC50(v111);
  unint64_t v112 = (unint64_t)v148;
  uint64_t v155 = v18;
  if (v52)
  {
    if (v52 < 1) {
      goto LABEL_147;
    }
    uint64_t v142 = (uint64_t)v148;
    unint64_t v113 = v17 & 0xC000000000000001;
    unint64_t v143 = CTCategoryIdentifierOther;
    swift_bridgeObjectRetain();
    uint64_t v114 = 0;
    while (1)
    {
      if (v113)
      {
        uint64_t v116 = sub_100032908();
      }
      else
      {
        uint64_t v116 = *(void *)(v17 + 8 * v114 + 32);
        swift_retain();
      }
      uint64_t v117 = *(uint64_t (**)(void))(*(void *)v116 + 112);
      char v118 = *(unsigned char *)(v117() + 16);
      swift_release();
      char v147 = v118;
      char v146 = 1;
      sub_10000674C();
      sub_1000326D8();
      sub_1000326D8();
      if (v148 == (char *)v151 && v149 == v152)
      {
        uint64_t v119 = swift_bridgeObjectRelease_n();
      }
      else
      {
        char v120 = sub_100032A38();
        swift_bridgeObjectRelease();
        uint64_t v119 = swift_bridgeObjectRelease();
        if ((v120 & 1) == 0)
        {
          swift_release();
          uint64_t v115 = v144;
          unint64_t v17 = (unint64_t)v145;
          goto LABEL_121;
        }
      }
      uint64_t v121 = ((uint64_t (*)(uint64_t))v117)(v119);
      uint64_t v123 = *(void *)(v121 + 24);
      uint64_t v122 = *(void *)(v121 + 32);
      swift_bridgeObjectRetain();
      swift_release();
      if (v123 == sub_100032638() && v122 == v124)
      {
        swift_bridgeObjectRelease_n();
        uint64_t v115 = v144;
        unint64_t v17 = (unint64_t)v145;
LABEL_136:
        sub_100032938();
        sub_100032968();
        sub_100032978();
        sub_100032948();
        goto LABEL_121;
      }
      char v126 = sub_100032A38();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v115 = v144;
      unint64_t v17 = (unint64_t)v145;
      if (v126) {
        goto LABEL_136;
      }
      swift_release();
LABEL_121:
      if (v115 == ++v114)
      {
        swift_bridgeObjectRelease();
        uint64_t v18 = v155;
        unint64_t v112 = v142;
        break;
      }
    }
  }
  swift_bridgeObjectRetain();
  swift_retain();
  v127 = v139;
  unint64_t v128 = (unint64_t)sub_10001C93C(v17, v112, (unint64_t)v18);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  if ((v128 & 0x8000000000000000) != 0 || (v128 & 0x4000000000000000) != 0)
  {
    unint64_t v133 = swift_bridgeObjectRetain();
    uint64_t v129 = (uint64_t)sub_10001AB58(v133);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v129 = v128 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain();
  }
  v148 = (char *)v129;
  sub_10001AE1C((uint64_t *)&v148);
  if (!v127)
  {
    swift_bridgeObjectRelease();
    unint64_t v130 = (unint64_t)v148;
    v148 = (char *)v112;
    sub_10001AC50(v130);
    swift_retain();
    swift_bridgeObjectRetain();
    sub_10001AC50((unint64_t)v18);
    swift_bridgeObjectRelease();
    swift_release();
    swift_release();
    uint64_t v131 = v140;
    *(void *)(v140 + 16) = v148;
    swift_bridgeObjectRelease();
    return v131;
  }
LABEL_150:
  uint64_t result = swift_release();
  __break(1u);
  return result;
}

uint64_t sub_10001856C(uint64_t *a1, char *a2)
{
  char v73 = a2;
  uint64_t v3 = sub_100031BB8();
  uint64_t v67 = *(void *)(v3 - 8);
  uint64_t v68 = v3;
  __chkstk_darwin(v3);
  uint64_t v66 = (char *)&v62 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100031A28();
  uint64_t v6 = *(void **)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v65 = (char *)&v62 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __chkstk_darwin(v7);
  long long v11 = (char *)&v62 - v10;
  __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v62 - v12;
  uint64_t v14 = sub_100001DEC(&qword_100041710);
  uint64_t v15 = v14 - 8;
  __chkstk_darwin(v14);
  unint64_t v17 = (char *)&v62 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_100031A68();
  uint64_t v19 = *(void *)(v18 - 8);
  __chkstk_darwin(v18);
  uint64_t v21 = (char *)&v62 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = *(int *)(v15 + 56);
  uint64_t v23 = &v17[v22];
  (*(void (**)(char *, char *, uint64_t))(v19 + 16))(&v17[v22], &v73[v22], v18);
  uint64_t v69 = v19;
  uint64_t v70 = v18;
  (*(void (**)(char *, char *, uint64_t))(v19 + 32))(v21, v23, v18);
  sub_100031A48();
  char v73 = v21;
  uint64_t v24 = sub_100031A38();
  unint64_t v26 = v25;
  uint64_t v27 = (void (*)(char *, char *, uint64_t))v6[2];
  char v71 = v13;
  v27(v11, v13, v5);
  uint64_t v28 = (uint64_t (*)(char *, uint64_t))v6[11];
  uint64_t v72 = v5;
  int v29 = v28(v11, v5);
  if (v29 == enum case for UsageItemRecord.UsageType.application(_:))
  {
    int v30 = 0;
  }
  else
  {
    if (v29 != enum case for UsageItemRecord.UsageType.webDomain(_:))
    {
      swift_bridgeObjectRelease();
      uint64_t v53 = v66;
      sub_100031B98();
      uint64_t v54 = v65;
      uint64_t v51 = v71;
      uint64_t v50 = v72;
      v27(v65, v71, v72);
      uint64_t v55 = sub_100031BA8();
      os_log_type_t v56 = sub_1000327D8();
      if (os_log_type_enabled(v55, v56))
      {
        unint64_t v57 = (uint8_t *)swift_slowAlloc();
        uint64_t v64 = swift_slowAlloc();
        uint64_t v75 = v64;
        uint64_t v63 = v57;
        *(_DWORD *)unint64_t v57 = 136446210;
        uint64_t v58 = sub_100031A18();
        uint64_t v74 = sub_100003FD4(v58, v59, &v75);
        uint64_t v50 = v72;
        sub_100032858();
        swift_bridgeObjectRelease();
        BOOL v48 = (void (*)(char *, uint64_t))v6[1];
        v48(v54, v50);
        _os_log_impl((void *)&_mh_execute_header, v55, v56, "Unknown usage item type: %{public}s", v63, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
        BOOL v48 = (void (*)(char *, uint64_t))v6[1];
        v48(v54, v50);
      }

      (*(void (**)(char *, uint64_t))(v67 + 8))(v53, v68);
      uint64_t v52 = v70;
      v48(v11, v50);
      uint64_t v49 = 0;
      goto LABEL_20;
    }
    int v30 = 2;
  }
  type metadata accessor for ActivityItem();
  sub_1000087A4(v30, v24, v26);
  swift_retain();
  uint64_t v31 = sub_100031A58();
  uint64_t v33 = v32;
  swift_retain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v75 = *a1;
  uint64_t v35 = v75;
  *a1 = 0x8000000000000000;
  unint64_t v37 = sub_10001AAE0(v31, v33);
  uint64_t v38 = *(void *)(v35 + 16);
  BOOL v39 = (v36 & 1) == 0;
  uint64_t v40 = v38 + v39;
  if (__OFADD__(v38, v39))
  {
    __break(1u);
    goto LABEL_22;
  }
  char v41 = v36;
  if (*(void *)(v35 + 24) >= v40)
  {
    if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
      sub_10001C3BC();
    }
  }
  else
  {
    sub_10001BFC0(v40, isUniquelyReferenced_nonNull_native);
    unint64_t v42 = sub_10001AAE0(v31, v33);
    if ((v41 & 1) != (v43 & 1)) {
      goto LABEL_24;
    }
    unint64_t v37 = v42;
  }
  *a1 = v75;
  swift_bridgeObjectRelease();
  unint64_t v44 = (void *)*a1;
  if (v41) {
    goto LABEL_14;
  }
  v44[(v37 >> 6) + 8] |= 1 << v37;
  char v45 = (uint64_t *)(v44[6] + 16 * v37);
  *char v45 = v31;
  v45[1] = v33;
  *(void *)(v44[7] + 8 * v37) = &_swiftEmptyArrayStorage;
  uint64_t v46 = v44[2];
  swift_bridgeObjectRetain();
  if (!__OFADD__(v46, 1))
  {
    v44[2] = v46 + 1;
LABEL_14:
    swift_bridgeObjectRetain();
    uint64_t v47 = v44[7];
    swift_bridgeObjectRelease();
    sub_1000326E8();
    if (*(void *)((*(void *)(v47 + 8 * v37) & 0xFFFFFFFFFFFFFF8) + 0x10) < *(void *)((*(void *)(v47 + 8 * v37) & 0xFFFFFFFFFFFFFF8)
                                                                                            + 0x18) >> 1)
    {
LABEL_15:
      sub_100032758();
      sub_100032728();
      swift_bridgeObjectRelease();
      swift_release_n();
      BOOL v48 = (void (*)(char *, uint64_t))v6[1];
      uint64_t v49 = sub_100018C5C;
      uint64_t v51 = v71;
      uint64_t v50 = v72;
      uint64_t v52 = v70;
LABEL_20:
      uint64_t v60 = v69;
      v48(v51, v50);
      (*(void (**)(char *, uint64_t))(v60 + 8))(v73, v52);
      return sub_10001CDE0((uint64_t)v49);
    }
LABEL_22:
    sub_100032738();
    goto LABEL_15;
  }
  __break(1u);
LABEL_24:
  uint64_t result = sub_100032A58();
  __break(1u);
  return result;
}

void sub_100018C5C(void *a1@<X8>)
{
  *a1 = &_swiftEmptyArrayStorage;
}

void *sub_100018C6C(uint64_t a1, char a2)
{
  uint64_t v3 = *(void *)(a1 + 16);
  uint64_t result = _swiftEmptyArrayStorage;
  if (v3)
  {
    uint64_t v23 = a1;
    sub_100032958();
    uint64_t v6 = sub_10001C8B4(v23);
    int v8 = v7;
    uint64_t v9 = v23 + 64;
    uint64_t result = (void *)type metadata accessor for ActivityGroup();
    uint64_t v10 = v23;
    uint64_t v11 = 0;
    while ((v6 & 0x8000000000000000) == 0 && v6 < 1 << *(unsigned char *)(v10 + 32))
    {
      unint64_t v13 = (unint64_t)v6 >> 6;
      if ((*(void *)(v9 + 8 * ((unint64_t)v6 >> 6)) & (1 << v6)) == 0) {
        goto LABEL_22;
      }
      if (*(_DWORD *)(v10 + 36) != v8) {
        goto LABEL_23;
      }
      uint64_t v14 = (uint64_t *)(*(void *)(v10 + 48) + 16 * v6);
      uint64_t v16 = *v14;
      unint64_t v15 = v14[1];
      unint64_t v17 = *(void *)(*(void *)(v10 + 56) + 8 * v6);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_100002A2C(v16, v15, v17, a2 & 1);
      sub_100032938();
      sub_100032968();
      sub_100032978();
      uint64_t result = (void *)sub_100032948();
      uint64_t v10 = v23;
      int64_t v12 = 1 << *(unsigned char *)(v23 + 32);
      if (v6 >= v12) {
        goto LABEL_24;
      }
      uint64_t v18 = *(void *)(v9 + 8 * v13);
      if ((v18 & (1 << v6)) == 0) {
        goto LABEL_25;
      }
      if (*(_DWORD *)(v23 + 36) != v8) {
        goto LABEL_26;
      }
      unint64_t v19 = v18 & (-2 << (v6 & 0x3F));
      if (v19)
      {
        int64_t v12 = __clz(__rbit64(v19)) | v6 & 0xFFFFFFFFFFFFFFC0;
      }
      else
      {
        unint64_t v20 = v13 + 1;
        unint64_t v21 = (unint64_t)(v12 + 63) >> 6;
        if (v13 + 1 < v21)
        {
          unint64_t v22 = *(void *)(v9 + 8 * v20);
          if (v22)
          {
LABEL_18:
            int64_t v12 = __clz(__rbit64(v22)) + (v20 << 6);
          }
          else
          {
            while (v21 - 2 != v13)
            {
              unint64_t v22 = *(void *)(v23 + 80 + 8 * v13++);
              if (v22)
              {
                unint64_t v20 = v13 + 1;
                goto LABEL_18;
              }
            }
          }
        }
      }
      ++v11;
      uint64_t v6 = v12;
      if (v11 == v3) {
        return _swiftEmptyArrayStorage;
      }
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
LABEL_26:
    __break(1u);
  }
  return result;
}

uint64_t sub_100018E9C(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)a1 + 112);
  v1();
  swift_release();
  sub_10000674C();
  sub_1000326D8();
  sub_1000326D8();
  if (v13 == v11 && v14 == v12)
  {
    uint64_t v2 = swift_bridgeObjectRelease_n();
  }
  else
  {
    char v3 = sub_100032A38();
    swift_bridgeObjectRelease();
    uint64_t v2 = swift_bridgeObjectRelease();
    char v4 = 0;
    if ((v3 & 1) == 0) {
      return v4 & 1;
    }
  }
  uint64_t v5 = ((uint64_t (*)(uint64_t))v1)(v2);
  uint64_t v7 = *(void *)(v5 + 24);
  uint64_t v6 = *(void *)(v5 + 32);
  swift_bridgeObjectRetain();
  swift_release();
  if (v7 == sub_100032638() && v6 == v8) {
    char v4 = 1;
  }
  else {
    char v4 = sub_100032A38();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v4 & 1;
}

void *sub_100019024()
{
  unint64_t v1 = *(void *)(v0 + 16);
  if (!(v1 >> 62))
  {
    uint64_t v2 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = (void *)swift_bridgeObjectRetain_n();
    if (v2) {
      goto LABEL_3;
    }
LABEL_11:
    swift_bridgeObjectRelease_n();
    return &_swiftEmptySetSingleton;
  }
  swift_bridgeObjectRetain_n();
  uint64_t result = (void *)sub_1000329A8();
  uint64_t v2 = (uint64_t)result;
  if (!result) {
    goto LABEL_11;
  }
LABEL_3:
  if (v2 < 1)
  {
    __break(1u);
  }
  else
  {
    uint64_t v4 = 0;
    do
    {
      if ((v1 & 0xC000000000000001) != 0)
      {
        uint64_t v5 = sub_100032908();
      }
      else
      {
        uint64_t v5 = *(void *)(v1 + 8 * v4 + 32);
        swift_retain();
      }
      ++v4;
      (*(void (**)(void))(*(void *)v5 + 272))();
      uint64_t v7 = v6;
      uint64_t v9 = v8;
      uint64_t v10 = swift_bridgeObjectRetain();
      sub_1000191B4(v10);
      sub_1000191B4(v7);
      swift_bridgeObjectRelease();
      sub_1000191B4(v9);
      swift_release();
    }
    while (v2 != v4);
    swift_bridgeObjectRelease_n();
    return &_swiftEmptySetSingleton;
  }
  return result;
}

uint64_t sub_1000191B4(uint64_t result)
{
  uint64_t v1 = result;
  int64_t v2 = 0;
  uint64_t v3 = result + 56;
  uint64_t v4 = 1 << *(unsigned char *)(result + 32);
  uint64_t v5 = -1;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  unint64_t v6 = v5 & *(void *)(result + 56);
  int64_t v7 = (unint64_t)(v4 + 63) >> 6;
  while (1)
  {
    if (v6)
    {
      unint64_t v8 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      unint64_t v9 = v8 | (v2 << 6);
      goto LABEL_5;
    }
    int64_t v13 = v2 + 1;
    if (__OFADD__(v2, 1))
    {
      __break(1u);
LABEL_27:
      __break(1u);
      return result;
    }
    if (v13 >= v7) {
      goto LABEL_23;
    }
    unint64_t v14 = *(void *)(v3 + 8 * v13);
    ++v2;
    if (!v14)
    {
      int64_t v2 = v13 + 1;
      if (v13 + 1 >= v7) {
        goto LABEL_23;
      }
      unint64_t v14 = *(void *)(v3 + 8 * v2);
      if (!v14)
      {
        int64_t v2 = v13 + 2;
        if (v13 + 2 >= v7) {
          goto LABEL_23;
        }
        unint64_t v14 = *(void *)(v3 + 8 * v2);
        if (!v14)
        {
          int64_t v2 = v13 + 3;
          if (v13 + 3 >= v7) {
            goto LABEL_23;
          }
          unint64_t v14 = *(void *)(v3 + 8 * v2);
          if (!v14) {
            break;
          }
        }
      }
    }
LABEL_22:
    unint64_t v6 = (v14 - 1) & v14;
    unint64_t v9 = __clz(__rbit64(v14)) + (v2 << 6);
LABEL_5:
    uint64_t v10 = (Swift::Int *)(*(void *)(v1 + 48) + 16 * v9);
    Swift::Int v11 = *v10;
    Swift::Int v12 = v10[1];
    swift_bridgeObjectRetain();
    sub_1000057FC(&v16, v11, v12);
    uint64_t result = swift_bridgeObjectRelease();
  }
  int64_t v15 = v13 + 4;
  if (v15 < v7)
  {
    unint64_t v14 = *(void *)(v3 + 8 * v15);
    if (!v14)
    {
      while (1)
      {
        int64_t v2 = v15 + 1;
        if (__OFADD__(v15, 1)) {
          goto LABEL_27;
        }
        if (v2 >= v7) {
          goto LABEL_23;
        }
        unint64_t v14 = *(void *)(v3 + 8 * v2);
        ++v15;
        if (v14) {
          goto LABEL_22;
        }
      }
    }
    int64_t v2 = v15;
    goto LABEL_22;
  }
LABEL_23:

  return swift_release();
}

uint64_t sub_100019334(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v7 = *(void *)(v3 + 16);
  if (v7 >> 62)
  {
    swift_bridgeObjectRetain_n();
    uint64_t result = sub_1000329A8();
    uint64_t v8 = result;
    if (!result) {
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v8 = *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain_n();
    if (!v8) {
      goto LABEL_10;
    }
  }
  if (v8 < 1)
  {
    __break(1u);
    return result;
  }
  uint64_t v10 = 0;
  do
  {
    if ((v7 & 0xC000000000000001) != 0)
    {
      uint64_t v11 = sub_100032908();
    }
    else
    {
      uint64_t v11 = *(void *)(v7 + 8 * v10 + 32);
      swift_retain();
    }
    ++v10;
    Swift::Int v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)v11 + 280);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v12(a1, a2, a3);
    swift_release();
  }
  while (v8 != v10);
LABEL_10:
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v13 = swift_bridgeObjectRelease();
  uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)v17 + 96))(v13);
  if (result)
  {
    uint64_t v15 = v14;
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(ObjectType, v15);
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t (*sub_100019520(void **a1))(uint64_t *a1, char a2)
{
  a1[3] = v1;
  *a1 = sub_100019024();
  a1[1] = v3;
  a1[2] = v4;
  return sub_10001956C;
}

uint64_t sub_10001956C(uint64_t *a1, char a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  uint64_t v4 = a1[2];
  if ((a2 & 1) == 0) {
    return sub_100019334(*a1, v2, v4);
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_100019334(v3, v2, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t sub_100019608()
{
  unint64_t v2 = *(void *)(v0 + 16);
  if (v2 >> 62)
  {
LABEL_18:
    swift_bridgeObjectRetain_n();
    uint64_t v3 = sub_1000329A8();
    if (!v3) {
      goto LABEL_19;
    }
  }
  else
  {
    uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain_n();
    if (!v3) {
      goto LABEL_19;
    }
  }
  unint64_t v1 = v2 & 0xC000000000000001;
  if ((v2 & 0xC000000000000001) != 0) {
    goto LABEL_20;
  }
  uint64_t v4 = *(void *)(v2 + 32);
  for (i = swift_retain(); ; uint64_t v4 = i)
  {
    uint64_t v6 = (*(uint64_t (**)(uint64_t))(*(void *)v4 + 112))(i);
    char v7 = (*(uint64_t (**)(uint64_t))(*(void *)v6 + 392))(v6);
    swift_release();
    if (v7) {
      break;
    }
    swift_release();
    if (v3 != 1)
    {
      uint64_t v9 = 5;
      do
      {
        uint64_t v10 = v9 - 4;
        if (v1)
        {
          uint64_t v11 = sub_100032908();
          uint64_t v4 = v11;
          uint64_t v13 = v9 - 3;
          if (__OFADD__(v10, 1)) {
            goto LABEL_17;
          }
        }
        else
        {
          uint64_t v4 = *(void *)(v2 + 8 * v9);
          uint64_t v11 = swift_retain();
          uint64_t v13 = v9 - 3;
          if (__OFADD__(v10, 1))
          {
LABEL_17:
            __break(1u);
            goto LABEL_18;
          }
        }
        uint64_t v14 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v4 + 112))(v11, v12);
        char v15 = (*(uint64_t (**)(uint64_t))(*(void *)v14 + 392))(v14);
        swift_release();
        if (v15) {
          goto LABEL_6;
        }
        swift_release();
        ++v9;
      }
      while (v13 != v3);
    }
LABEL_19:
    swift_bridgeObjectRelease_n();
    sub_100032998();
    __break(1u);
LABEL_20:
    uint64_t i = sub_100032908();
  }
LABEL_6:
  swift_bridgeObjectRelease_n();
  return v4;
}

uint64_t sub_100019858(char a1)
{
  unint64_t v3 = *(void *)(v1 + 16);
  unint64_t v27 = v3;
  if (v3 >> 62) {
    goto LABEL_29;
  }
  uint64_t v4 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (v4)
  {
    while (1)
    {
      unint64_t v5 = 0;
      while (1)
      {
        if ((v27 & 0xC000000000000001) != 0)
        {
          uint64_t v6 = sub_100032908();
          BOOL v7 = __OFADD__(v5++, 1);
          if (v7) {
            goto LABEL_27;
          }
        }
        else
        {
          if (v5 >= *(void *)((v27 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
            goto LABEL_28;
          }
          uint64_t v6 = *(void *)(v27 + 32 + 8 * v5);
          swift_retain();
          BOOL v7 = __OFADD__(v5++, 1);
          if (v7) {
            goto LABEL_27;
          }
        }
        uint64_t v8 = *(uint64_t (**)(void))(*(void *)v6 + 112);
        uint64_t v9 = v8();
        char v10 = (*(uint64_t (**)(uint64_t))(*(void *)v9 + 392))(v9);
        uint64_t v11 = swift_release();
        if ((v10 & 1) == 0) {
          break;
        }
LABEL_4:
        swift_release();
        if (v5 == v4) {
          goto LABEL_30;
        }
      }
      uint64_t v12 = ((uint64_t (*)(uint64_t))v8)(v11);
      (*(void (**)(void))(*(void *)v12 + 336))(a1 & 1);
      swift_release();
      uint64_t v13 = (*(uint64_t (**)(void, uint64_t))(*(void *)v6 + 216))(a1 & 1, 1);
      uint64_t v14 = *(uint64_t (**)(uint64_t))(*(void *)v6 + 160);
      unint64_t v15 = v14(v13);
      if (!(v15 >> 62)) {
        break;
      }
      uint64_t v16 = sub_1000329A8();
      uint64_t v17 = swift_bridgeObjectRelease();
      if ((v16 & 0x8000000000000000) == 0) {
        goto LABEL_14;
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
      swift_bridgeObjectRetain();
      uint64_t v4 = sub_1000329A8();
      if (!v4) {
        goto LABEL_30;
      }
    }
    uint64_t v16 = *(void *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t v17 = swift_bridgeObjectRelease();
LABEL_14:
    if (v16)
    {
      unint64_t v18 = 0;
      while (1)
      {
        uint64_t v19 = v14(v17);
        if ((v19 & 0xC000000000000001) != 0)
        {
          uint64_t v20 = sub_100032908();
        }
        else
        {
          if ((v18 & 0x8000000000000000) != 0) {
            goto LABEL_25;
          }
          if (v18 >= *(void *)((v19 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
            goto LABEL_26;
          }
          uint64_t v20 = *(void *)(v19 + 8 * v18 + 32);
          swift_retain();
        }
        ++v18;
        swift_bridgeObjectRelease();
        (*(void (**)(void))(*(void *)v20 + 336))(a1 & 1);
        uint64_t v17 = swift_release();
        if (v16 == v18) {
          goto LABEL_4;
        }
      }
    }
    goto LABEL_4;
  }
LABEL_30:
  uint64_t v21 = swift_bridgeObjectRelease();
  uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)v26 + 96))(v21);
  if (result)
  {
    uint64_t v24 = v23;
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t))(v24 + 8))(ObjectType, v24);
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_100019BF8(uint64_t a1, uint64_t a2, char a3)
{
  LOBYTE(v4) = a3;
  unint64_t v7 = *(void *)(v3 + 16);
  unint64_t v8 = v7 >> 62;
  if (v7 >> 62) {
    goto LABEL_38;
  }
  uint64_t v9 = *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v9)
  {
LABEL_39:
    uint64_t v28 = swift_bridgeObjectRelease();
    goto LABEL_40;
  }
LABEL_3:
  unint64_t v48 = v8;
  uint64_t v49 = a2;
  unint64_t v10 = 0;
  uint64_t v55 = v9;
  unint64_t v56 = v7 & 0xC000000000000001;
  unint64_t v52 = v7 + 32;
  uint64_t v53 = v7 & 0xFFFFFFFFFFFFFF8;
  uint64_t v11 = v4 & 1;
  uint64_t v50 = a1;
  unint64_t v51 = v7;
  while (1)
  {
    if (v56)
    {
      uint64_t v14 = sub_100032908();
      BOOL v15 = __OFADD__(v10++, 1);
      if (v15) {
        goto LABEL_36;
      }
    }
    else
    {
      if (v10 >= *(void *)(v53 + 16)) {
        goto LABEL_37;
      }
      uint64_t v14 = *(void *)(v52 + 8 * v10);
      swift_retain();
      BOOL v15 = __OFADD__(v10++, 1);
      if (v15) {
        goto LABEL_36;
      }
    }
    uint64_t v4 = *(uint64_t (**)(uint64_t))(*(void *)v14 + 112);
    unint64_t v8 = *(void *)v14 + 112;
    uint64_t v16 = ((uint64_t (*)(void))v4)();
    char v17 = (*(uint64_t (**)(uint64_t))(*(void *)v16 + 392))(v16);
    uint64_t v18 = swift_release();
    if (v17) {
      goto LABEL_5;
    }
    unint64_t v8 = v4(v18);
    uint64_t v20 = *(void *)(v8 + 24);
    uint64_t v19 = *(void *)(v8 + 32);
    swift_bridgeObjectRetain();
    swift_release();
    if (v20 == a1 && v19 == a2)
    {
      uint64_t v23 = swift_bridgeObjectRelease();
    }
    else
    {
      char v22 = sub_100032A38();
      uint64_t v23 = swift_bridgeObjectRelease();
      if ((v22 & 1) == 0) {
        goto LABEL_5;
      }
    }
    uint64_t v4 = *(uint64_t (**)(uint64_t))(*(void *)v14 + 160);
    a2 = *(void *)v14 + 160;
    unint64_t v24 = v4(v23);
    if (v24 >> 62) {
      break;
    }
    a1 = *(void *)((v24 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t v25 = swift_bridgeObjectRelease();
LABEL_22:
    if (a1)
    {
      unint64_t v8 = 0;
      do
      {
        uint64_t v26 = v4(v25);
        if ((v26 & 0xC000000000000001) != 0)
        {
          uint64_t v27 = sub_100032908();
        }
        else
        {
          if ((v8 & 0x8000000000000000) != 0)
          {
            __break(1u);
LABEL_35:
            __break(1u);
LABEL_36:
            __break(1u);
LABEL_37:
            __break(1u);
LABEL_38:
            swift_bridgeObjectRetain();
            uint64_t v9 = sub_1000329A8();
            if (!v9) {
              goto LABEL_39;
            }
            goto LABEL_3;
          }
          if (v8 >= *(void *)((v26 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
            goto LABEL_35;
          }
          uint64_t v27 = *(void *)(v26 + 8 * v8 + 32);
          swift_retain();
        }
        ++v8;
        swift_bridgeObjectRelease();
        (*(void (**)(uint64_t))(*(void *)v27 + 336))(v11);
        uint64_t v25 = swift_release();
      }
      while (a1 != v8);
    }
    uint64_t v12 = (*(uint64_t (**)(uint64_t))(*(void *)v54 + 184))(v14);
    (*(void (**)(uint64_t, void))(*(void *)v14 + 216))(v12, v13 & 1);
    a2 = v49;
    a1 = v50;
    unint64_t v7 = v51;
LABEL_5:
    swift_release();
    if (v10 == v55) {
      goto LABEL_33;
    }
  }
  a1 = sub_1000329A8();
  uint64_t v25 = swift_bridgeObjectRelease();
  if ((a1 & 0x8000000000000000) == 0) {
    goto LABEL_22;
  }
  __break(1u);
LABEL_33:
  uint64_t v28 = swift_bridgeObjectRelease();
  unint64_t v8 = v48;
LABEL_40:
  uint64_t v29 = (*(uint64_t (**)(uint64_t))(*(void *)v54 + 152))(v28);
  uint64_t v30 = (*(uint64_t (**)(uint64_t))(*(void *)v29 + 112))(v29);
  swift_release();
  if (v8)
  {
    swift_bridgeObjectRetain_n();
    uint64_t v31 = sub_1000329A8();
    if (v31) {
      goto LABEL_42;
    }
  }
  else
  {
    uint64_t v31 = *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain_n();
    if (v31)
    {
LABEL_42:
      uint64_t v32 = 4;
      while (1)
      {
        uint64_t v33 = v32 - 4;
        if ((v7 & 0xC000000000000001) != 0)
        {
          uint64_t result = sub_100032908();
          uint64_t v35 = result;
          uint64_t v36 = v32 - 3;
          if (__OFADD__(v33, 1)) {
            goto LABEL_62;
          }
        }
        else
        {
          uint64_t v35 = *(void *)(v7 + 8 * v32);
          uint64_t result = swift_retain();
          uint64_t v36 = v32 - 3;
          if (__OFADD__(v33, 1))
          {
LABEL_62:
            __break(1u);
            return result;
          }
        }
        unint64_t v37 = *(uint64_t (**)(void))(*(void *)v35 + 112);
        uint64_t v38 = v37();
        char v39 = (*(uint64_t (**)(uint64_t))(*(void *)v38 + 392))(v38);
        uint64_t v40 = swift_release();
        if ((v39 & 1) != 0 || ((*(uint64_t (**)(uint64_t))(*(void *)v35 + 264))(v40) & 1) == 0)
        {
          swift_release();
        }
        else
        {
          uint64_t v41 = v37();
          char v42 = (*(uint64_t (**)(uint64_t))(*(void *)v41 + 328))(v41);
          swift_release();
          swift_release();
          if ((v42 & 1) == 0)
          {
            uint64_t v43 = 0;
            goto LABEL_57;
          }
        }
        ++v32;
        if (v36 == v31)
        {
          uint64_t v43 = 1;
          goto LABEL_57;
        }
      }
    }
  }
  uint64_t v43 = 1;
LABEL_57:
  swift_bridgeObjectRelease_n();
  (*(void (**)(uint64_t))(*(void *)v30 + 336))(v43);
  uint64_t v44 = swift_release();
  uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)v54 + 96))(v44);
  if (result)
  {
    uint64_t v46 = v45;
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t))(v46 + 8))(ObjectType, v46);
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_10001A254()
{
  unint64_t v1 = *(void *)(v0 + 16);
  unint64_t v2 = (uint64_t (*)(void))(v1 >> 62);
  if (v1 >> 62) {
    goto LABEL_43;
  }
  uint64_t v3 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v3; uint64_t v3 = sub_1000329A8())
  {
    unint64_t v4 = 0;
    unint64_t v53 = v1 & 0xC000000000000001;
    unint64_t v54 = v1;
    uint64_t v50 = v1 & 0xFFFFFFFFFFFFFF8;
    unint64_t v48 = v2;
    unint64_t v49 = v1 + 32;
    uint64_t v52 = v3;
    while (!v53)
    {
      if (v4 >= *(void *)(v50 + 16)) {
        goto LABEL_42;
      }
      uint64_t v8 = *(void *)(v49 + 8 * v4);
      swift_retain();
      BOOL v9 = __OFADD__(v4++, 1);
      if (v9) {
        goto LABEL_41;
      }
LABEL_13:
      unint64_t v2 = *(uint64_t (**)(void))(*(void *)v8 + 112);
      uint64_t v10 = v2();
      char v11 = (*(uint64_t (**)(uint64_t))(*(void *)v10 + 392))(v10);
      uint64_t v12 = swift_release();
      if (v11) {
        goto LABEL_6;
      }
      char v13 = *(uint64_t (**)(void))(*(void *)v8 + 160);
      unint64_t v14 = ((uint64_t (*)(uint64_t))v13)(v12);
      uint64_t v15 = v14 >> 62 ? sub_1000329A8() : *(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10);
      uint64_t v16 = swift_bridgeObjectRelease();
      if (!v15) {
        goto LABEL_6;
      }
      uint64_t v17 = ((uint64_t (*)(uint64_t))v2)(v16);
      unint64_t v18 = v13();
      unint64_t v19 = v18;
      if (v18 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v20 = sub_1000329A8();
        if (!v20) {
          goto LABEL_4;
        }
      }
      else
      {
        uint64_t v20 = *(void *)((v18 & 0xFFFFFFFFFFFFFF8) + 0x10);
        swift_bridgeObjectRetain();
        if (!v20) {
          goto LABEL_4;
        }
      }
      unint64_t v2 = (uint64_t (*)(void))(v19 & 0xC000000000000001);
      if ((v19 & 0xC000000000000001) != 0)
      {
        uint64_t v22 = sub_100032908();
        uint64_t v21 = v22;
      }
      else
      {
        uint64_t v21 = *(void *)(v19 + 32);
        uint64_t v22 = swift_retain();
      }
      char v23 = (*(uint64_t (**)(uint64_t))(*(void *)v21 + 328))(v22);
      swift_release();
      if ((v23 & 1) == 0)
      {
        char v5 = 0;
        goto LABEL_5;
      }
      if (v20 != 1)
      {
        uint64_t v24 = 5;
        while (1)
        {
          uint64_t v25 = v24 - 4;
          if (v2)
          {
            uint64_t v26 = sub_100032908();
            unint64_t v1 = v24 - 3;
            if (__OFADD__(v25, 1)) {
              goto LABEL_40;
            }
          }
          else
          {
            uint64_t v26 = *(void *)(v19 + 8 * v24);
            swift_retain();
            unint64_t v1 = v24 - 3;
            if (__OFADD__(v25, 1))
            {
LABEL_40:
              __break(1u);
              goto LABEL_41;
            }
          }
          char v5 = (*(uint64_t (**)(void))(*(void *)v26 + 328))();
          swift_release();
          if ((v5 & 1) == 0)
          {
            unint64_t v1 = v54;
            goto LABEL_5;
          }
          ++v24;
          BOOL v27 = v1 == v20;
          unint64_t v1 = v54;
          if (v27) {
            goto LABEL_5;
          }
        }
      }
LABEL_4:
      char v5 = 1;
LABEL_5:
      swift_bridgeObjectRelease_n();
      (*(void (**)(void))(*(void *)v17 + 336))(v5 & 1);
      swift_release();
      uint64_t v6 = (*(uint64_t (**)(uint64_t))(*(void *)v51 + 184))(v8);
      (*(void (**)(uint64_t, void))(*(void *)v8 + 216))(v6, v7 & 1);
LABEL_6:
      swift_release();
      if (v4 == v52)
      {
        uint64_t v28 = swift_bridgeObjectRelease();
        unint64_t v2 = v48;
        goto LABEL_45;
      }
    }
    uint64_t v8 = sub_100032908();
    BOOL v9 = __OFADD__(v4++, 1);
    if (!v9) {
      goto LABEL_13;
    }
LABEL_41:
    __break(1u);
LABEL_42:
    __break(1u);
LABEL_43:
    swift_bridgeObjectRetain();
  }
  uint64_t v28 = swift_bridgeObjectRelease();
LABEL_45:
  uint64_t v29 = (*(uint64_t (**)(uint64_t))(*(void *)v51 + 152))(v28);
  uint64_t v30 = (*(uint64_t (**)(uint64_t))(*(void *)v29 + 112))(v29);
  swift_release();
  if (v2)
  {
    swift_bridgeObjectRetain_n();
    uint64_t v31 = sub_1000329A8();
    if (v31) {
      goto LABEL_47;
    }
  }
  else
  {
    uint64_t v31 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain_n();
    if (v31)
    {
LABEL_47:
      uint64_t v32 = 4;
      while (1)
      {
        uint64_t v33 = v32 - 4;
        if ((v1 & 0xC000000000000001) != 0)
        {
          uint64_t result = sub_100032908();
          uint64_t v35 = result;
          uint64_t v36 = v32 - 3;
          if (__OFADD__(v33, 1)) {
            goto LABEL_67;
          }
        }
        else
        {
          uint64_t v35 = *(void *)(v1 + 8 * v32);
          uint64_t result = swift_retain();
          uint64_t v36 = v32 - 3;
          if (__OFADD__(v33, 1))
          {
LABEL_67:
            __break(1u);
            return result;
          }
        }
        unint64_t v37 = *(uint64_t (**)(void))(*(void *)v35 + 112);
        uint64_t v38 = v37();
        char v39 = (*(uint64_t (**)(uint64_t))(*(void *)v38 + 392))(v38);
        uint64_t v40 = swift_release();
        if ((v39 & 1) != 0 || ((*(uint64_t (**)(uint64_t))(*(void *)v35 + 264))(v40) & 1) == 0)
        {
          swift_release();
        }
        else
        {
          uint64_t v41 = v37();
          char v42 = (*(uint64_t (**)(uint64_t))(*(void *)v41 + 328))(v41);
          swift_release();
          swift_release();
          if ((v42 & 1) == 0)
          {
            uint64_t v43 = 0;
            goto LABEL_62;
          }
        }
        ++v32;
        if (v36 == v31)
        {
          uint64_t v43 = 1;
          goto LABEL_62;
        }
      }
    }
  }
  uint64_t v43 = 1;
LABEL_62:
  swift_bridgeObjectRelease_n();
  (*(void (**)(uint64_t))(*(void *)v30 + 336))(v43);
  uint64_t v44 = swift_release();
  uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)v51 + 96))(v44);
  if (result)
  {
    uint64_t v46 = v45;
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t))(v46 + 8))(ObjectType, v46);
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_10001A938(uint64_t a1)
{
  uint64_t v2 = (*(uint64_t (**)(void))(*(void *)a1 + 112))();
  char v3 = (*(uint64_t (**)(uint64_t))(*(void *)v2 + 328))(v2);
  uint64_t v4 = swift_release();
  if (v3) {
    return 1;
  }
  uint64_t v6 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 272))(v4);
  uint64_t v8 = v7;
  uint64_t v9 = *(void *)(v6 + 16);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void *)(v8 + 16);
  swift_bridgeObjectRelease();
  uint64_t result = v9 + v10;
  if (__OFADD__(v9, v10)) {
    __break(1u);
  }
  return result;
}

uint64_t sub_10001AA3C()
{
  swift_bridgeObjectRelease();
  sub_10001CCF0(v0 + 24);
  return v0;
}

uint64_t sub_10001AA64()
{
  swift_bridgeObjectRelease();
  sub_10001CCF0(v0 + 24);

  return _swift_deallocClassInstance(v0, 40, 7);
}

uint64_t sub_10001AAA4@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for ActivityProvider();
  uint64_t result = sub_100031BD8();
  *a1 = result;
  return result;
}

unint64_t sub_10001AAE0(uint64_t a1, uint64_t a2)
{
  sub_100032AB8();
  sub_100032678();
  Swift::Int v4 = sub_100032AC8();

  return sub_10001C2D8(a1, a2, v4);
}

void *sub_10001AB58(unint64_t a1)
{
  unint64_t v1 = a1;
  if (a1 >> 62) {
    goto LABEL_10;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v2) {
    return _swiftEmptyArrayStorage;
  }
  while (1)
  {
    if (v2 <= 0)
    {
      char v3 = _swiftEmptyArrayStorage;
    }
    else
    {
      sub_100001DEC(&qword_100040FC0);
      char v3 = (void *)swift_allocObject();
      int64_t v4 = j__malloc_size(v3);
      uint64_t v5 = v4 - 32;
      if (v4 < 32) {
        uint64_t v5 = v4 - 25;
      }
      v3[2] = v2;
      v3[3] = (2 * (v5 >> 3)) | 1;
    }
    swift_bridgeObjectRetain();
    sub_10001C574((unint64_t)(v3 + 4), v2, v1);
    unint64_t v1 = v6;
    swift_bridgeObjectRelease();
    if (v1 == v2) {
      break;
    }
    __break(1u);
LABEL_10:
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_1000329A8();
    swift_bridgeObjectRelease();
    if (!v2) {
      return _swiftEmptyArrayStorage;
    }
  }
  return v3;
}

uint64_t sub_10001AC50(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_1000329A8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (!((unint64_t)*v1 >> 62))
  {
    uint64_t v4 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t v5 = v4 + v3;
    if (!__OFADD__(v4, v3)) {
      goto LABEL_5;
    }
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  swift_bridgeObjectRetain();
  uint64_t v15 = sub_1000329A8();
  swift_bridgeObjectRelease();
  uint64_t v5 = v15 + v3;
  if (__OFADD__(v15, v3)) {
    goto LABEL_21;
  }
LABEL_5:
  unint64_t v6 = *v1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *unint64_t v1 = v6;
  if (isUniquelyReferenced_nonNull_bridgeObject)
  {
    if ((v6 & 0x8000000000000000) == 0 && (v6 & 0x4000000000000000) == 0)
    {
      uint64_t v8 = v6 & 0xFFFFFFFFFFFFFF8;
      if (v5 <= *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        goto LABEL_11;
      }
    }
  }
  if (v6 >> 62) {
    goto LABEL_23;
  }
  while (1)
  {
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_100032918();
    swift_bridgeObjectRelease();
    *unint64_t v1 = v9;
    uint64_t v8 = v9 & 0xFFFFFFFFFFFFFF8;
LABEL_11:
    uint64_t result = sub_10001C574(v8 + 8 * *(void *)(v8 + 16) + 32, (*(void *)(v8 + 24) >> 1) - *(void *)(v8 + 16), a1);
    if (v11 >= v3) {
      break;
    }
LABEL_22:
    __break(1u);
LABEL_23:
    swift_bridgeObjectRetain();
    sub_1000329A8();
    swift_bridgeObjectRelease();
  }
  if (v11 >= 1)
  {
    uint64_t v12 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    BOOL v13 = __OFADD__(v12, v11);
    uint64_t v14 = v12 + v11;
    if (v13)
    {
      __break(1u);
      return result;
    }
    *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v14;
  }
  swift_bridgeObjectRelease();

  return sub_100032728();
}

uint64_t sub_10001AE1C(uint64_t *a1)
{
  uint64_t v2 = *a1;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *a1 = v2;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v2 = sub_1000065C8(v2);
    *a1 = v2;
  }
  uint64_t v4 = *(void *)(v2 + 16);
  v6[0] = v2 + 32;
  v6[1] = v4;
  sub_10001AE98(v6);
  return sub_100032948();
}

Swift::Int sub_10001AE98(uint64_t *a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = a1[1];
  Swift::Int result = sub_100032A18(v4);
  if (result >= v4)
  {
    if (v4 < 0) {
      goto LABEL_150;
    }
    if (v4) {
      return sub_10001B8B8(0, v4, 1, a1);
    }
    return result;
  }
  if (v4 >= 0) {
    uint64_t v6 = v4;
  }
  else {
    uint64_t v6 = v4 + 1;
  }
  if (v4 < -1) {
    goto LABEL_158;
  }
  Swift::Int v127 = result;
  uint64_t v124 = a1;
  if (v4 < 2)
  {
    uint64_t v9 = (char *)_swiftEmptyArrayStorage;
    uint64_t v142 = (uint64_t)_swiftEmptyArrayStorage;
    __dst = (char *)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 32);
    if (v4 != 1)
    {
      unint64_t v12 = _swiftEmptyArrayStorage[2];
LABEL_116:
      if (v12 >= 2)
      {
        uint64_t v118 = *v124;
        do
        {
          unint64_t v119 = v12 - 2;
          if (v12 < 2) {
            goto LABEL_145;
          }
          if (!v118) {
            goto LABEL_157;
          }
          uint64_t v120 = *(void *)&v9[16 * v119 + 32];
          uint64_t v121 = *(void *)&v9[16 * v12 + 24];
          sub_10001BAB8((char *)(v118 + 8 * v120), (char *)(v118 + 8 * *(void *)&v9[16 * v12 + 16]), v118 + 8 * v121, __dst);
          if (v2) {
            break;
          }
          if (v121 < v120) {
            goto LABEL_146;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v9 = sub_1000057E8((uint64_t)v9);
          }
          if (v119 >= *((void *)v9 + 2)) {
            goto LABEL_147;
          }
          uint64_t v122 = &v9[16 * v119 + 32];
          *(void *)uint64_t v122 = v120;
          *((void *)v122 + 1) = v121;
          unint64_t v123 = *((void *)v9 + 2);
          if (v12 > v123) {
            goto LABEL_148;
          }
          memmove(&v9[16 * v12 + 16], &v9[16 * v12 + 32], 16 * (v123 - v12));
          *((void *)v9 + 2) = v123 - 1;
          unint64_t v12 = v123 - 1;
        }
        while (v123 > 2);
      }
LABEL_127:
      swift_bridgeObjectRelease();
      *(void *)((v142 & 0xFFFFFFFFFFFFFF8) + 0x10) = 0;
      sub_100032728();
      return swift_bridgeObjectRelease();
    }
  }
  else
  {
    uint64_t v7 = v6 >> 1;
    type metadata accessor for ActivityGroup();
    uint64_t v8 = sub_100032748();
    *(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10) = v7;
    __dst = (char *)((v8 & 0xFFFFFFFFFFFFFF8) + 32);
    uint64_t v142 = v8;
  }
  Swift::Int v10 = 0;
  uint64_t v11 = *a1;
  uint64_t v125 = *a1 - 8;
  uint64_t v126 = *a1 + 16;
  uint64_t v9 = (char *)_swiftEmptyArrayStorage;
  Swift::Int v133 = v4;
  uint64_t v138 = *a1;
  while (1)
  {
    Swift::Int v13 = v10;
    Swift::Int v14 = v10 + 1;
    Swift::Int v134 = v10;
    if (v10 + 1 < v4)
    {
      unint64_t v128 = v9;
      uint64_t v130 = v2;
      uint64_t v15 = *(void *)(v11 + 8 * v10);
      uint64_t v16 = *(uint64_t (**)(uint64_t))(**(void **)(v11 + 8 * v14) + 112);
      swift_retain();
      uint64_t v17 = swift_retain();
      uint64_t v18 = v16(v17);
      uint64_t v19 = (*(uint64_t (**)(uint64_t))(*(void *)v18 + 184))(v18);
      uint64_t v21 = v20;
      uint64_t v22 = swift_release();
      uint64_t v23 = (*(uint64_t (**)(uint64_t))(*(void *)v15 + 112))(v22);
      uint64_t v24 = (*(uint64_t (**)(void))(*(void *)v23 + 184))();
      uint64_t v26 = v25;
      swift_release();
      if (v19 == v24 && v21 == v26) {
        int v135 = 0;
      }
      else {
        int v135 = sub_100032A38();
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_release();
      swift_release();
      Swift::Int v4 = v133;
      Swift::Int v13 = v134;
      Swift::Int v14 = v134 + 2;
      if (v134 + 2 >= v133)
      {
        uint64_t v2 = v130;
      }
      else
      {
        uint64_t v28 = v126 + 8 * v134;
        while (1)
        {
          Swift::Int v139 = v14;
          uint64_t v29 = *(void *)(v28 - 8);
          uint64_t v30 = *(uint64_t (**)(uint64_t))(**(void **)v28 + 112);
          swift_retain();
          uint64_t v31 = swift_retain();
          uint64_t v32 = v30(v31);
          uint64_t v33 = (*(uint64_t (**)(uint64_t))(*(void *)v32 + 184))(v32);
          uint64_t v35 = v34;
          uint64_t v36 = swift_release();
          uint64_t v37 = (*(uint64_t (**)(uint64_t))(*(void *)v29 + 112))(v36);
          uint64_t v38 = (*(uint64_t (**)(uint64_t))(*(void *)v37 + 184))(v37);
          uint64_t v40 = v39;
          swift_release();
          BOOL v41 = v33 == v38 && v35 == v40;
          int v42 = v41 ? 0 : sub_100032A38();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_release();
          swift_release();
          if ((v135 ^ v42)) {
            break;
          }
          ++v14;
          v28 += 8;
          Swift::Int v4 = v133;
          if (v133 == v139 + 1)
          {
            Swift::Int v14 = v133;
            uint64_t v2 = v130;
            goto LABEL_35;
          }
        }
        uint64_t v2 = v130;
        Swift::Int v4 = v133;
LABEL_35:
        Swift::Int v13 = v134;
      }
      uint64_t v9 = v128;
      uint64_t v11 = v138;
      if (v135)
      {
        if (v14 < v13) {
          goto LABEL_151;
        }
        if (v13 < v14)
        {
          uint64_t v43 = (uint64_t *)(v125 + 8 * v14);
          Swift::Int v44 = v14;
          Swift::Int v45 = v13;
          uint64_t v46 = (uint64_t *)(v138 + 8 * v13);
          do
          {
            if (v45 != --v44)
            {
              if (!v138) {
                goto LABEL_156;
              }
              uint64_t v47 = *v46;
              *uint64_t v46 = *v43;
              *uint64_t v43 = v47;
            }
            ++v45;
            --v43;
            ++v46;
          }
          while (v45 < v44);
        }
      }
    }
    if (v14 < v4)
    {
      if (__OFSUB__(v14, v13)) {
        goto LABEL_149;
      }
      if (v14 - v13 < v127) {
        break;
      }
    }
LABEL_68:
    if (v14 < v13) {
      goto LABEL_144;
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v9 = sub_100005630(0, *((void *)v9 + 2) + 1, 1, v9);
    }
    unint64_t v69 = *((void *)v9 + 2);
    unint64_t v68 = *((void *)v9 + 3);
    unint64_t v12 = v69 + 1;
    uint64_t v11 = v138;
    if (v69 >= v68 >> 1)
    {
      uint64_t v117 = sub_100005630((char *)(v68 > 1), v69 + 1, 1, v9);
      uint64_t v11 = v138;
      uint64_t v9 = v117;
    }
    *((void *)v9 + 2) = v12;
    uint64_t v70 = v9 + 32;
    char v71 = &v9[16 * v69 + 32];
    *(void *)char v71 = v134;
    *((void *)v71 + 1) = v14;
    Swift::Int v141 = v14;
    if (v69)
    {
      while (1)
      {
        unint64_t v72 = v12 - 1;
        if (v12 >= 4)
        {
          uint64_t v77 = &v70[16 * v12];
          uint64_t v78 = *((void *)v77 - 8);
          uint64_t v79 = *((void *)v77 - 7);
          BOOL v83 = __OFSUB__(v79, v78);
          uint64_t v80 = v79 - v78;
          if (v83) {
            goto LABEL_133;
          }
          uint64_t v82 = *((void *)v77 - 6);
          uint64_t v81 = *((void *)v77 - 5);
          BOOL v83 = __OFSUB__(v81, v82);
          uint64_t v75 = v81 - v82;
          char v76 = v83;
          if (v83) {
            goto LABEL_134;
          }
          unint64_t v84 = v12 - 2;
          uint64_t v85 = &v70[16 * v12 - 32];
          uint64_t v87 = *(void *)v85;
          uint64_t v86 = *((void *)v85 + 1);
          BOOL v83 = __OFSUB__(v86, v87);
          uint64_t v88 = v86 - v87;
          if (v83) {
            goto LABEL_136;
          }
          BOOL v83 = __OFADD__(v75, v88);
          uint64_t v89 = v75 + v88;
          if (v83) {
            goto LABEL_139;
          }
          if (v89 >= v80)
          {
            uint64_t v107 = &v70[16 * v72];
            uint64_t v109 = *(void *)v107;
            uint64_t v108 = *((void *)v107 + 1);
            BOOL v83 = __OFSUB__(v108, v109);
            uint64_t v110 = v108 - v109;
            if (v83) {
              goto LABEL_143;
            }
            BOOL v100 = v75 < v110;
            goto LABEL_105;
          }
        }
        else
        {
          if (v12 != 3)
          {
            uint64_t v101 = *((void *)v9 + 4);
            uint64_t v102 = *((void *)v9 + 5);
            BOOL v83 = __OFSUB__(v102, v101);
            uint64_t v94 = v102 - v101;
            char v95 = v83;
            goto LABEL_99;
          }
          uint64_t v74 = *((void *)v9 + 4);
          uint64_t v73 = *((void *)v9 + 5);
          BOOL v83 = __OFSUB__(v73, v74);
          uint64_t v75 = v73 - v74;
          char v76 = v83;
        }
        if (v76) {
          goto LABEL_135;
        }
        unint64_t v84 = v12 - 2;
        uint64_t v90 = &v70[16 * v12 - 32];
        uint64_t v92 = *(void *)v90;
        uint64_t v91 = *((void *)v90 + 1);
        BOOL v93 = __OFSUB__(v91, v92);
        uint64_t v94 = v91 - v92;
        char v95 = v93;
        if (v93) {
          goto LABEL_138;
        }
        unint64_t v96 = &v70[16 * v72];
        uint64_t v98 = *(void *)v96;
        uint64_t v97 = *((void *)v96 + 1);
        BOOL v83 = __OFSUB__(v97, v98);
        uint64_t v99 = v97 - v98;
        if (v83) {
          goto LABEL_141;
        }
        if (__OFADD__(v94, v99)) {
          goto LABEL_142;
        }
        if (v94 + v99 >= v75)
        {
          BOOL v100 = v75 < v99;
LABEL_105:
          if (v100) {
            unint64_t v72 = v84;
          }
          goto LABEL_107;
        }
LABEL_99:
        if (v95) {
          goto LABEL_137;
        }
        uint64_t v103 = &v70[16 * v72];
        uint64_t v105 = *(void *)v103;
        uint64_t v104 = *((void *)v103 + 1);
        BOOL v83 = __OFSUB__(v104, v105);
        uint64_t v106 = v104 - v105;
        if (v83) {
          goto LABEL_140;
        }
        if (v106 < v94) {
          goto LABEL_14;
        }
LABEL_107:
        unint64_t v111 = v72 - 1;
        if (v72 - 1 >= v12)
        {
          __break(1u);
LABEL_130:
          __break(1u);
LABEL_131:
          __break(1u);
LABEL_132:
          __break(1u);
LABEL_133:
          __break(1u);
LABEL_134:
          __break(1u);
LABEL_135:
          __break(1u);
LABEL_136:
          __break(1u);
LABEL_137:
          __break(1u);
LABEL_138:
          __break(1u);
LABEL_139:
          __break(1u);
LABEL_140:
          __break(1u);
LABEL_141:
          __break(1u);
LABEL_142:
          __break(1u);
LABEL_143:
          __break(1u);
LABEL_144:
          __break(1u);
LABEL_145:
          __break(1u);
LABEL_146:
          __break(1u);
LABEL_147:
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
          goto LABEL_153;
        }
        if (!v11) {
          goto LABEL_155;
        }
        unint64_t v112 = &v70[16 * v111];
        uint64_t v113 = *(void *)v112;
        uint64_t v114 = &v70[16 * v72];
        uint64_t v115 = *((void *)v114 + 1);
        sub_10001BAB8((char *)(v11 + 8 * *(void *)v112), (char *)(v11 + 8 * *(void *)v114), v11 + 8 * v115, __dst);
        if (v2) {
          goto LABEL_127;
        }
        if (v115 < v113) {
          goto LABEL_130;
        }
        if (v72 > *((void *)v9 + 2)) {
          goto LABEL_131;
        }
        *(void *)unint64_t v112 = v113;
        *(void *)&v70[16 * v111 + 8] = v115;
        unint64_t v116 = *((void *)v9 + 2);
        if (v72 >= v116) {
          goto LABEL_132;
        }
        unint64_t v12 = v116 - 1;
        memmove(&v70[16 * v72], v114 + 16, 16 * (v116 - 1 - v72));
        *((void *)v9 + 2) = v116 - 1;
        uint64_t v11 = v138;
        if (v116 <= 2) {
          goto LABEL_14;
        }
      }
    }
    unint64_t v12 = 1;
LABEL_14:
    Swift::Int v4 = v133;
    Swift::Int v10 = v141;
    if (v141 >= v133) {
      goto LABEL_116;
    }
  }
  if (__OFADD__(v13, v127)) {
    goto LABEL_152;
  }
  if (v13 + v127 >= v4) {
    Swift::Int v48 = v4;
  }
  else {
    Swift::Int v48 = v13 + v127;
  }
  if (v48 >= v13)
  {
    if (v14 != v48)
    {
      uint64_t v129 = v9;
      uint64_t v131 = v2;
      unint64_t v49 = (void *)(v125 + 8 * v14);
      Swift::Int v132 = v48;
      do
      {
        uint64_t v51 = *(void *)(v11 + 8 * v14);
        Swift::Int v52 = v13;
        char v136 = v49;
        Swift::Int v140 = v14;
        while (1)
        {
          uint64_t v53 = *v49;
          unint64_t v54 = *(uint64_t (**)(uint64_t))(*(void *)v51 + 112);
          swift_retain();
          uint64_t v55 = swift_retain();
          uint64_t v56 = v54(v55);
          uint64_t v57 = (*(uint64_t (**)(uint64_t))(*(void *)v56 + 184))(v56);
          uint64_t v59 = v58;
          uint64_t v60 = swift_release();
          uint64_t v61 = (*(uint64_t (**)(uint64_t))(*(void *)v53 + 112))(v60);
          uint64_t v62 = (*(uint64_t (**)(void))(*(void *)v61 + 184))();
          uint64_t v64 = v63;
          swift_release();
          if (v57 == v62 && v59 == v64) {
            break;
          }
          char v66 = sub_100032A38();
          swift_release();
          swift_release();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v66 & 1) == 0) {
            goto LABEL_56;
          }
          uint64_t v11 = v138;
          Swift::Int v50 = v140;
          if (!v138) {
            goto LABEL_154;
          }
          uint64_t v67 = *v49;
          uint64_t v51 = v49[1];
          *unint64_t v49 = v51;
          v49[1] = v67;
          --v49;
          if (v140 == ++v52) {
            goto LABEL_57;
          }
        }
        swift_release();
        swift_release();
        swift_bridgeObjectRelease_n();
LABEL_56:
        uint64_t v11 = v138;
        Swift::Int v50 = v140;
LABEL_57:
        Swift::Int v14 = v50 + 1;
        Swift::Int v13 = v134;
        unint64_t v49 = v136 + 1;
      }
      while (v14 != v132);
      Swift::Int v14 = v132;
      uint64_t v9 = v129;
      uint64_t v2 = v131;
    }
    goto LABEL_68;
  }
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
  Swift::Int result = sub_100032988();
  __break(1u);
  return result;
}

uint64_t sub_10001B8B8(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v24 = result;
  if (a3 != a2)
  {
    uint64_t v26 = *a4;
    Swift::Int v4 = (void *)(*a4 + 8 * a3 - 8);
LABEL_6:
    uint64_t v6 = *(void *)(v26 + 8 * a3);
    uint64_t v7 = v24;
    uint64_t v25 = v4;
    uint64_t v27 = a3;
    while (1)
    {
      uint64_t v8 = *v4;
      uint64_t v9 = *(uint64_t (**)(uint64_t))(*(void *)v6 + 112);
      swift_retain();
      uint64_t v10 = swift_retain();
      uint64_t v11 = v9(v10);
      uint64_t v12 = (*(uint64_t (**)(uint64_t))(*(void *)v11 + 184))(v11);
      uint64_t v14 = v13;
      uint64_t v15 = swift_release();
      uint64_t v16 = (*(uint64_t (**)(uint64_t))(*(void *)v8 + 112))(v15);
      uint64_t v17 = (*(uint64_t (**)(uint64_t))(*(void *)v16 + 184))(v16);
      uint64_t v19 = v18;
      swift_release();
      if (v12 == v17 && v14 == v19)
      {
        swift_release();
        swift_release();
        Swift::Int result = swift_bridgeObjectRelease_n();
        uint64_t v5 = v27;
LABEL_5:
        a3 = v5 + 1;
        Swift::Int v4 = v25 + 1;
        if (a3 == a2) {
          return result;
        }
        goto LABEL_6;
      }
      char v21 = sub_100032A38();
      swift_release();
      swift_release();
      swift_bridgeObjectRelease();
      Swift::Int result = swift_bridgeObjectRelease();
      uint64_t v5 = v27;
      if ((v21 & 1) == 0) {
        goto LABEL_5;
      }
      if (!v26) {
        break;
      }
      uint64_t v22 = *v4;
      uint64_t v6 = v4[1];
      *Swift::Int v4 = v6;
      v4[1] = v22;
      --v4;
      if (v27 == ++v7) {
        goto LABEL_5;
      }
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_10001BAB8(char *a1, char *__src, unint64_t a3, char *__dst)
{
  uint64_t v5 = __src;
  uint64_t v6 = __src - a1;
  uint64_t v7 = __src - a1 + 7;
  if (__src - a1 >= 0) {
    uint64_t v7 = __src - a1;
  }
  uint64_t v8 = v7 >> 3;
  uint64_t v9 = a3 - (void)__src;
  uint64_t v10 = a3 - (void)__src + 7;
  if ((uint64_t)(a3 - (void)__src) >= 0) {
    uint64_t v10 = a3 - (void)__src;
  }
  uint64_t v11 = v10 >> 3;
  uint64_t v57 = a1;
  uint64_t v56 = __dst;
  if (v8 >= v10 >> 3)
  {
    if (v9 >= -7)
    {
      if (__dst != __src || &__src[8 * v11] <= __dst) {
        memmove(__dst, __src, 8 * v11);
      }
      Swift::Int v48 = __dst;
      uint64_t v29 = &__dst[8 * v11];
      uint64_t v55 = v29;
      uint64_t v57 = v5;
      if (a1 < v5 && v9 >= 8)
      {
        uint64_t v30 = (char *)(a3 - 8);
        uint64_t v31 = v5;
        do
        {
          uint64_t v53 = v29;
          uint64_t v51 = v29 - 8;
          uint64_t v32 = *((void *)v31 - 1);
          v31 -= 8;
          uint64_t v33 = *(uint64_t (**)(uint64_t))(**((void **)v29 - 1) + 112);
          swift_retain();
          uint64_t v34 = swift_retain();
          uint64_t v35 = v33(v34);
          uint64_t v36 = (*(uint64_t (**)(uint64_t))(*(void *)v35 + 184))(v35);
          uint64_t v38 = v37;
          uint64_t v39 = swift_release();
          uint64_t v40 = (*(uint64_t (**)(uint64_t))(*(void *)v32 + 112))(v39);
          uint64_t v41 = (*(uint64_t (**)(void))(*(void *)v40 + 184))();
          uint64_t v43 = v42;
          swift_release();
          if (v36 == v41 && v38 == v43) {
            char v45 = 0;
          }
          else {
            char v45 = sub_100032A38();
          }
          uint64_t v46 = v30 + 8;
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_release();
          swift_release();
          if (v45)
          {
            uint64_t v29 = v53;
            if (v46 != v5 || v30 >= v5) {
              *(void *)uint64_t v30 = *(void *)v31;
            }
            uint64_t v57 = v31;
          }
          else
          {
            uint64_t v29 = v51;
            uint64_t v55 = v51;
            uint64_t v31 = v5;
            if (v46 < v53 || v30 >= v53 || v46 != v53) {
              *(void *)uint64_t v30 = *(void *)v51;
            }
          }
          if (v31 <= a1) {
            break;
          }
          v30 -= 8;
          uint64_t v5 = v31;
        }
        while (v29 > v48);
      }
LABEL_53:
      sub_10000572C((void **)&v57, (const void **)&v56, &v55);
      return 1;
    }
  }
  else if (v6 >= -7)
  {
    if (__dst != a1 || &a1[8 * v8] <= __dst) {
      memmove(__dst, a1, 8 * v8);
    }
    Swift::Int v50 = &__dst[8 * v8];
    uint64_t v55 = v50;
    if ((unint64_t)v5 < a3 && v6 >= 8)
    {
      uint64_t v12 = __dst;
      uint64_t v13 = a1;
      while (1)
      {
        unint64_t v54 = v5;
        uint64_t v14 = *(void *)v12;
        uint64_t v15 = *(uint64_t (**)(uint64_t))(**(void **)v5 + 112);
        swift_retain();
        uint64_t v16 = swift_retain();
        uint64_t v17 = v15(v16);
        uint64_t v18 = (*(uint64_t (**)(uint64_t))(*(void *)v17 + 184))(v17);
        uint64_t v20 = v19;
        uint64_t v21 = swift_release();
        uint64_t v22 = (*(uint64_t (**)(uint64_t))(*(void *)v14 + 112))(v21);
        uint64_t v23 = (*(uint64_t (**)(uint64_t))(*(void *)v22 + 184))(v22);
        uint64_t v25 = v24;
        swift_release();
        if (v18 == v23 && v20 == v25) {
          break;
        }
        char v27 = sub_100032A38();
        swift_release();
        swift_release();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v27 & 1) == 0) {
          goto LABEL_23;
        }
        uint64_t v28 = v54 + 8;
        if (v13 < v54 || v13 >= v28 || v13 != v54) {
          *(void *)uint64_t v13 = *(void *)v54;
        }
LABEL_26:
        v13 += 8;
        if (v12 < v50)
        {
          uint64_t v5 = v28;
          if ((unint64_t)v28 < a3) {
            continue;
          }
        }
        uint64_t v57 = v13;
        goto LABEL_53;
      }
      swift_release();
      swift_release();
      swift_bridgeObjectRelease_n();
LABEL_23:
      if (v13 != v12) {
        *(void *)uint64_t v13 = *(void *)v12;
      }
      v12 += 8;
      uint64_t v56 = v12;
      uint64_t v28 = v54;
      goto LABEL_26;
    }
    goto LABEL_53;
  }
  uint64_t result = sub_1000329D8();
  __break(1u);
  return result;
}

uint64_t sub_10001BFC0(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_100001DEC(&qword_100041828);
  char v36 = a2;
  uint64_t v6 = sub_1000329C8();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v35 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v34 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v34) {
      break;
    }
    uint64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v35 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v34) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v35 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v34)
        {
LABEL_33:
          swift_release();
          if ((v36 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v35 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v34) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v35 + 8 * v13);
            ++v24;
            if (v23) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v24;
      }
    }
LABEL_30:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    uint64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void *)(*(void *)(v5 + 56) + 8 * v20);
    if ((v36 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_100032AB8();
    sub_100032678();
    uint64_t result = sub_100032AC8();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v27 = v16 == v26;
        if (v16 == v26) {
          unint64_t v16 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      unint64_t v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    uint64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *uint64_t v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v22 = (void *)(v5 + 64);
  if ((v36 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v22 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

unint64_t sub_10001C2D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    unint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_100032A38() & 1) == 0)
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
      while (!v14 && (sub_100032A38() & 1) == 0);
    }
  }
  return v6;
}

void *sub_10001C3BC()
{
  uint64_t v1 = v0;
  sub_100001DEC(&qword_100041828);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1000329B8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
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
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    unint64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    uint64_t v20 = *(void *)(*(void *)(v2 + 56) + v19);
    int64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *int64_t v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13) {
    goto LABEL_26;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_10001C574(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_1000329A8();
    swift_bridgeObjectRelease();
    if (!v7) {
      return a3;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v7) {
      return a3;
    }
  }
  if (!a1) {
    goto LABEL_19;
  }
  uint64_t v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_1000329A8();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_10001CD3C();
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          sub_100001DEC(&qword_100041830);
          unint64_t v12 = sub_100006490(v16, i, a3);
          uint64_t v14 = *v13;
          swift_retain();
          ((void (*)(uint64_t (**)(), void))v12)(v16, 0);
          *(void *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v9 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    type metadata accessor for ActivityGroup();
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = sub_1000329D8();
  __break(1u);
  return result;
}

uint64_t sub_10001C778(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100001DEC(&qword_100041710);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10001C7E0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100001DEC(&qword_100041710);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10001C848(uint64_t a1)
{
  uint64_t v2 = sub_100001DEC(&qword_100041710);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10001C8A8(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_10001C8B4(uint64_t a1)
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
  unint64_t v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 2) {
    unint64_t v7 = 2;
  }
  unint64_t v8 = v7 - 2;
  uint64_t v9 = (unint64_t *)(a1 + 80);
  uint64_t v2 = 64;
  while (v8)
  {
    unint64_t v10 = *v9++;
    unint64_t v1 = v10;
    --v8;
    v2 += 64;
    if (v10) {
      return __clz(__rbit64(v1)) + v2;
    }
  }
  return v3;
}

void *sub_10001C93C(unint64_t a1, unint64_t a2, unint64_t a3)
{
  uint64_t v4 = a1;
  char v25 = _swiftEmptyArrayStorage;
  if (a1 >> 62)
  {
LABEL_44:
    uint64_t v5 = sub_1000329A8();
    if (v5) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v5 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v5)
    {
LABEL_3:
      unint64_t v6 = 0;
      uint64_t v21 = v4 & 0xFFFFFFFFFFFFFF8;
      unint64_t v22 = v4 & 0xC000000000000001;
      uint64_t v20 = v5;
      while (1)
      {
        if (v22)
        {
          sub_100032908();
          BOOL v7 = __OFADD__(v6, 1);
          unint64_t v8 = v6 + 1;
          if (v7) {
            goto LABEL_43;
          }
        }
        else
        {
          if (v6 >= *(void *)(v21 + 16)) {
            goto LABEL_42;
          }
          swift_retain();
          BOOL v7 = __OFADD__(v6, 1);
          unint64_t v8 = v6 + 1;
          if (v7)
          {
LABEL_43:
            __break(1u);
            goto LABEL_44;
          }
        }
        unint64_t v23 = v8;
        if (a2 >> 62)
        {
          swift_bridgeObjectRetain();
          uint64_t v9 = sub_1000329A8();
          if (v9)
          {
LABEL_11:
            uint64_t v4 = type metadata accessor for ActivityGroup();
            uint64_t v10 = 4;
            do
            {
              uint64_t v11 = v10 - 4;
              if ((a2 & 0xC000000000000001) != 0)
              {
                sub_100032908();
                uint64_t v12 = v10 - 3;
                if (__OFADD__(v11, 1)) {
                  goto LABEL_40;
                }
              }
              else
              {
                swift_retain();
                uint64_t v12 = v10 - 3;
                if (__OFADD__(v11, 1))
                {
LABEL_40:
                  __break(1u);
LABEL_41:
                  __break(1u);
LABEL_42:
                  __break(1u);
                  goto LABEL_43;
                }
              }
              sub_10001CD98((unint64_t *)&qword_100040E18, (void (*)(uint64_t))type metadata accessor for ActivityGroup);
              char v13 = sub_1000325F8();
              swift_release();
              if (v13) {
                goto LABEL_30;
              }
              ++v10;
            }
            while (v12 != v9);
          }
        }
        else
        {
          uint64_t v9 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
          swift_bridgeObjectRetain();
          if (v9) {
            goto LABEL_11;
          }
        }
        swift_bridgeObjectRelease();
        if (a3 >> 62)
        {
          swift_bridgeObjectRetain();
          uint64_t v14 = sub_1000329A8();
          if (v14)
          {
LABEL_21:
            uint64_t v4 = type metadata accessor for ActivityGroup();
            uint64_t v15 = 4;
            while (1)
            {
              uint64_t v16 = v15 - 4;
              if ((a3 & 0xC000000000000001) != 0)
              {
                sub_100032908();
                uint64_t v17 = v15 - 3;
                if (__OFADD__(v16, 1)) {
                  goto LABEL_41;
                }
              }
              else
              {
                swift_retain();
                uint64_t v17 = v15 - 3;
                if (__OFADD__(v16, 1)) {
                  goto LABEL_41;
                }
              }
              sub_10001CD98((unint64_t *)&qword_100040E18, (void (*)(uint64_t))type metadata accessor for ActivityGroup);
              char v18 = sub_1000325F8();
              swift_release();
              if (v18) {
                break;
              }
              ++v15;
              if (v17 == v14) {
                goto LABEL_4;
              }
            }
LABEL_30:
            swift_release();
            swift_bridgeObjectRelease();
            goto LABEL_5;
          }
        }
        else
        {
          uint64_t v14 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
          swift_bridgeObjectRetain();
          if (v14) {
            goto LABEL_21;
          }
        }
LABEL_4:
        swift_bridgeObjectRelease();
        uint64_t v4 = (uint64_t)&v25;
        sub_100032938();
        sub_100032968();
        sub_100032978();
        sub_100032948();
LABEL_5:
        unint64_t v6 = v23;
        if (v23 == v20) {
          return v25;
        }
      }
    }
  }
  return _swiftEmptyArrayStorage;
}

uint64_t sub_10001CCF0(uint64_t a1)
{
  return a1;
}

uint64_t type metadata accessor for ActivityProvider()
{
  return self;
}

unint64_t sub_10001CD3C()
{
  unint64_t result = qword_100041838;
  if (!qword_100041838)
  {
    sub_100006B14(&qword_100041830);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041838);
  }
  return result;
}

uint64_t sub_10001CD98(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10001CDE0(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

unint64_t sub_10001CDF4(char a1)
{
  unint64_t result = 0xD000000000000023;
  if (a1 == 1) {
    return 0xD000000000000027;
  }
  return result;
}

uint64_t sub_10001CE50(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_10001CE5C(*a1, *a2);
}

uint64_t sub_10001CE5C(unsigned __int8 a1, unsigned __int8 a2)
{
  unint64_t v2 = 0xD000000000000023;
  unint64_t v3 = 0x8000000100038A10;
  int v4 = a1;
  if (a1)
  {
    if (a1 == 1) {
      unint64_t v5 = 0xD000000000000027;
    }
    else {
      unint64_t v5 = 0xD000000000000023;
    }
    if (v4 == 1) {
      unint64_t v6 = 0x8000000100038A40;
    }
    else {
      unint64_t v6 = 0x8000000100038A70;
    }
    int v7 = a2;
    if (!a2) {
      goto LABEL_12;
    }
  }
  else
  {
    unint64_t v5 = 0xD000000000000023;
    unint64_t v6 = 0x8000000100038A10;
    int v7 = a2;
    if (!a2) {
      goto LABEL_12;
    }
  }
  if (v7 == 1)
  {
    unint64_t v2 = 0xD000000000000027;
    unint64_t v3 = 0x8000000100038A40;
  }
  else
  {
    unint64_t v3 = 0x8000000100038A70;
  }
LABEL_12:
  if (v5 == v2 && v6 == v3) {
    char v8 = 1;
  }
  else {
    char v8 = sub_100032A38();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

Swift::Int sub_10001CF54()
{
  return sub_10001CF5C();
}

Swift::Int sub_10001CF5C()
{
  return sub_100032AC8();
}

uint64_t sub_10001D004()
{
  return sub_10001D00C();
}

uint64_t sub_10001D00C()
{
  sub_100032678();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_10001D09C()
{
  return sub_10001D0A4();
}

Swift::Int sub_10001D0A4()
{
  return sub_100032AC8();
}

uint64_t sub_10001D148@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_10001D1A4(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

unint64_t sub_10001D178@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_10001CDF4(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_10001D1A4(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_10003DD90;
  v6._object = a2;
  unint64_t v4 = sub_1000329F8(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 3) {
    return 3;
  }
  else {
    return v4;
  }
}

unint64_t sub_10001D1F4()
{
  unint64_t result = qword_100041840;
  if (!qword_100041840)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041840);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for Entitlement(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 2;
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
        JUMPOUT(0x10001D314);
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
          *unint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Entitlement()
{
  return &type metadata for Entitlement;
}

uint64_t sub_10001D34C(uint64_t a1)
{
  return a1;
}

uint64_t sub_10001D380(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a3;
}

uint64_t sub_10001D3B4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v23 = a1;
  uint64_t v24 = a2;
  uint64_t v26 = a5;
  uint64_t v25 = sub_100001DEC(&qword_100041848);
  __chkstk_darwin(v25);
  uint64_t v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1000320B8();
  __chkstk_darwin(v11 - 8);
  uint64_t v12 = sub_100001DEC(&qword_100041850);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = __chkstk_darwin(v12);
  uint64_t v16 = (char *)&v23 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  char v18 = (char *)&v23 - v17;
  sub_1000320A8();
  uint64_t v31 = a1;
  uint64_t v32 = a2;
  uint64_t v33 = a3;
  uint64_t v34 = a4;
  sub_100001DEC(&qword_100041858);
  sub_100010310(&qword_100041860, &qword_100041858);
  sub_100031CD8();
  sub_100032098();
  uint64_t v27 = v23;
  uint64_t v28 = v24;
  uint64_t v29 = a3;
  uint64_t v30 = a4;
  sub_100031CD8();
  uint64_t v19 = &v10[*(int *)(v25 + 48)];
  uint64_t v20 = *(void (**)(char *, char *, uint64_t))(v13 + 16);
  v20(v10, v18, v12);
  v20(v19, v16, v12);
  sub_100032028();
  uint64_t v21 = *(void (**)(char *, uint64_t))(v13 + 8);
  v21(v16, v12);
  return ((uint64_t (*)(char *, uint64_t))v21)(v18, v12);
}

uint64_t sub_10001D684()
{
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v1 = *(void *)(v0 + 24);
  uint64_t v3 = sub_100031FE8();
  uint64_t v5 = v4;
  char v7 = v6;
  uint64_t v9 = v8;
  swift_retain();

  return Button<>.init(_:action:)(v3, v5, v7 & 1, v9, v2, v1);
}

uint64_t sub_10001D714()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v1 = *(void *)(v0 + 40);
  uint64_t v3 = sub_100031FE8();
  uint64_t v5 = v4;
  char v7 = v6;
  uint64_t v9 = v8;
  swift_retain();

  return Button<>.init(_:action:)(v3, v5, v7 & 1, v9, v2, v1);
}

uint64_t sub_10001D7A8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10001D7C4@<X0>(uint64_t a1@<X8>)
{
  return sub_10001D3B4(*v1, v1[1], v1[2], v1[3], a1);
}

uint64_t destroy for ActivityPickerToolbar()
{
  swift_release();

  return swift_release();
}

uint64_t initializeWithCopy for ActivityPickerToolbar(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  uint64_t v3 = *(void *)(a2 + 24);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(void *)(a1 + 24) = v3;
  swift_retain();
  swift_retain();
  return a1;
}

void *assignWithCopy for ActivityPickerToolbar(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_retain();
  swift_release();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_retain();
  swift_release();
  return a1;
}

__n128 initializeWithTake for ActivityPickerToolbar(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

_OWORD *assignWithTake for ActivityPickerToolbar(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for ActivityPickerToolbar(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for ActivityPickerToolbar(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for ActivityPickerToolbar()
{
  return &type metadata for ActivityPickerToolbar;
}

uint64_t sub_10001D9AC()
{
  return sub_100010310(&qword_100041868, &qword_100041870);
}

uint64_t sub_10001D9E8()
{
  return *(void *)v0;
}

uint64_t sub_10001D9F4(uint64_t result, char a2)
{
  *(void *)uint64_t v2 = result;
  *(unsigned char *)(v2 + 8) = a2 & 1;
  return result;
}

uint64_t (*sub_10001DA04())()
{
  return nullsub_1;
}

uint64_t sub_10001DA24()
{
  if (*(void *)(v0 + 16))
  {
    return swift_retain();
  }
  else
  {
    type metadata accessor for ActivityProvider();
    sub_10001DC28(&qword_100041290, (void (*)(uint64_t))type metadata accessor for ActivityProvider);
    uint64_t result = sub_100031E58();
    __break(1u);
  }
  return result;
}

uint64_t sub_10001DAB0()
{
  type metadata accessor for ActivityProvider();
  sub_10001DC28(&qword_100041290, (void (*)(uint64_t))type metadata accessor for ActivityProvider);

  return sub_100031E78();
}

uint64_t sub_10001DB24()
{
  type metadata accessor for ActivityProvider();
  sub_10001DC28(&qword_100041290, (void (*)(uint64_t))type metadata accessor for ActivityProvider);

  return sub_100031E48();
}

uint64_t sub_10001DBAC()
{
  type metadata accessor for ActivityItem();
  sub_10001DC28(&qword_100041878, (void (*)(uint64_t))type metadata accessor for ActivityItem);

  return sub_100031D88();
}

uint64_t sub_10001DC28(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10001DC70()
{
  return swift_retain();
}

uint64_t sub_10001DC78(uint64_t a1)
{
  uint64_t result = swift_release();
  *(void *)(v1 + 40) = a1;
  return result;
}

uint64_t (*sub_10001DCA4())()
{
  return nullsub_1;
}

uint64_t sub_10001DCC4()
{
  uint64_t v1 = *(void *)(v0 + 32);
  uint64_t v2 = *(void *)(v0 + 40);
  uint64_t v3 = type metadata accessor for ActivityItem();
  uint64_t v4 = sub_10001DC28(&qword_100041878, (void (*)(uint64_t))type metadata accessor for ActivityItem);

  return ObservedObject.projectedValue.getter(v1, v2, v3, v4);
}

uint64_t sub_10001DD4C()
{
  uint64_t v1 = *(void *)(v0 + 48);
  swift_retain();
  swift_retain();
  return v1;
}

uint64_t sub_10001DD94(uint64_t a1, uint64_t a2, char a3)
{
  swift_release();
  uint64_t result = swift_release();
  *(void *)(v3 + 48) = a1;
  *(void *)(v3 + 56) = a2;
  *(unsigned char *)(v3 + 64) = a3;
  return result;
}

uint64_t (*sub_10001DDDC())()
{
  return nullsub_1;
}

uint64_t sub_10001DDFC()
{
  return *(unsigned __int8 *)(v0 + 65);
}

uint64_t sub_10001DE04(uint64_t result)
{
  *(unsigned char *)(v1 + 65) = result;
  return result;
}

uint64_t (*sub_10001DE0C())()
{
  return nullsub_1;
}

uint64_t sub_10001DE2C()
{
  return *(unsigned __int8 *)(v0 + 66);
}

uint64_t sub_10001DE34(uint64_t result)
{
  *(unsigned char *)(v1 + 66) = result;
  return result;
}

uint64_t (*sub_10001DE3C())()
{
  return nullsub_1;
}

uint64_t sub_10001DE60()
{
  sub_100032498();
  return v1;
}

uint64_t sub_10001DE9C()
{
  type metadata accessor for ActivitySelectableRow(0);
  sub_100001DEC(&qword_100041880);
  sub_1000324A8();
  return v1;
}

uint64_t type metadata accessor for ActivitySelectableRow(uint64_t a1)
{
  return sub_1000236CC(a1, (uint64_t *)&unk_1000431B0);
}

uint64_t sub_10001DF1C()
{
  return sub_1000324B8();
}

void (*sub_10001DF90(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x58uLL);
  *a1 = v3;
  uint64_t v4 = (uint64_t *)(v1 + *(int *)(type metadata accessor for ActivitySelectableRow(0) + 44));
  uint64_t v5 = *v4;
  uint64_t v6 = v4[1];
  v3[7] = *v4;
  v3[8] = v6;
  uint64_t v7 = v4[2];
  v3[9] = v7;
  *uint64_t v3 = v5;
  v3[1] = v6;
  v3[2] = v7;
  swift_retain();
  swift_bridgeObjectRetain();
  v3[10] = sub_100001DEC(&qword_100041880);
  sub_1000324A8();
  return sub_10001E038;
}

void sub_10001E038(uint64_t a1, char a2)
{
  uint64_t v2 = *(void **)a1;
  *(void *)(*(void *)a1 + 40) = *(void *)(*(void *)a1 + 24);
  uint64_t v3 = v2[4];
  uint64_t v4 = v2[9];
  uint64_t v5 = v2[8];
  void *v2 = v2[7];
  v2[1] = v5;
  v2[2] = v4;
  v2[6] = v3;
  if (a2)
  {
    swift_bridgeObjectRetain();
    sub_1000324B8();
    swift_bridgeObjectRelease();
    swift_release();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_1000324B8();
    swift_bridgeObjectRelease();
    swift_release();
  }

  free(v2);
}

uint64_t sub_10001E0F0()
{
  id v0 = [self shortLocalizedNameForIdentifier:CTCategoryIdentifierOther];
  uint64_t v1 = sub_100032638();

  return v1;
}

uint64_t sub_10001E15C()
{
  type metadata accessor for ActivitySelectableRow(0);
  sub_100001DEC(&qword_100041880);
  sub_1000324C8();
  return v1;
}

uint64_t sub_10001E1C0@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, char a3@<W3>, uint64_t a4@<X4>, char a5@<W5>, char a6@<W6>, char a7@<W7>, uint64_t a8@<X8>)
{
  type metadata accessor for ActivityProvider();
  sub_10001DC28(&qword_100041290, (void (*)(uint64_t))type metadata accessor for ActivityProvider);
  *(void *)(a8 + 16) = sub_100031E78();
  *(void *)(a8 + 24) = v13;
  uint64_t v14 = type metadata accessor for ActivitySelectableRow(0);
  uint64_t v15 = (uint64_t *)(a8 + *(int *)(v14 + 40));
  *uint64_t v15 = swift_getKeyPath();
  sub_100001DEC(&qword_100041310);
  swift_storeEnumTagMultiPayload();
  uint64_t v16 = a8 + *(int *)(v14 + 44);
  id v17 = [self shortLocalizedNameForIdentifier:CTCategoryIdentifierOther];
  sub_100032638();

  sub_100032498();
  *(_OWORD *)uint64_t v16 = v23;
  *(void *)(v16 + 16) = v24;
  type metadata accessor for ActivityItem();
  sub_10001DC28(&qword_100041878, (void (*)(uint64_t))type metadata accessor for ActivityItem);
  uint64_t result = sub_100031D88();
  *(void *)(a8 + 32) = result;
  *(void *)(a8 + 40) = v19;
  *(void *)(a8 + 48) = a1;
  *(void *)(a8 + 56) = a2;
  *(unsigned char *)(a8 + 64) = a3;
  *(void *)a8 = a4;
  *(unsigned char *)(a8 + 8) = a5 & 1;
  *(unsigned char *)(a8 + 65) = a6;
  *(unsigned char *)(a8 + 66) = a7;
  return result;
}

uint64_t sub_10001E3A0@<X0>(unsigned char *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v45 = a2;
  uint64_t v3 = sub_100032458();
  uint64_t v43 = *(void *)(v3 - 8);
  uint64_t v44 = v3;
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)v42 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100001DEC(&qword_100041888);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)v42 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100001DEC(&qword_100040FF8);
  uint64_t v10 = __chkstk_darwin(v9 - 8);
  uint64_t v12 = (char *)v42 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)v42 - v13;
  uint64_t v15 = sub_100001DEC(&qword_100041890);
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = __chkstk_darwin(v15);
  uint64_t v19 = (char *)v42 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = __chkstk_darwin(v17);
  unint64_t v22 = (char *)v42 - v21;
  if ((*(uint64_t (**)(uint64_t))(*(void *)a1 + 280))(v20))
  {
    (*(void (**)(void))(*(void *)a1 + 136))();
    sub_10000B5A4((uint64_t)v14, (uint64_t)v12, &qword_100040FF8);
    sub_100001DEC(&qword_1000418D0);
    sub_10002356C();
    sub_100031C58();
    sub_10000B608((uint64_t)v14, &qword_100040FF8);
    (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v22, v19, v15);
    (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v8, v22, v15);
    swift_storeEnumTagMultiPayload();
    sub_100001DEC(&qword_1000418B8);
    sub_100010310(&qword_1000418C0, &qword_100041890);
    sub_10001EB28();
    sub_100032058();
    return (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v22, v15);
  }
  else
  {
    v42[1] = v6;
    if (a1[16])
    {
      uint64_t v24 = v8;
      if (a1[16] == 1)
      {
        type metadata accessor for ActivityItem();
        NSString v25 = sub_100032608();
        sub_10000A040(v25);

        sub_100032428();
        uint64_t v27 = v43;
        uint64_t v26 = v44;
        (*(void (**)(char *, void, uint64_t))(v43 + 104))(v5, enum case for Image.ResizingMode.stretch(_:), v44);
        uint64_t v28 = sub_100032478();
        swift_release();
        (*(void (**)(char *, uint64_t))(v27 + 8))(v5, v26);
        uint64_t v46 = v28;
        LOBYTE(v47) = 0;
      }
      else
      {
        sub_100032488();
        uint64_t v40 = v43;
        uint64_t v39 = v44;
        (*(void (**)(char *, void, uint64_t))(v43 + 104))(v5, enum case for Image.ResizingMode.stretch(_:), v44);
        uint64_t v41 = sub_100032478();
        swift_release();
        (*(void (**)(char *, uint64_t))(v40 + 8))(v5, v39);
        uint64_t v46 = v41;
        LOBYTE(v47) = 1;
      }
      swift_retain();
      sub_100032058();
      uint64_t v46 = v51;
      uint64_t v47 = BYTE8(v51);
      uint64_t v48 = 0;
      uint64_t v49 = 0;
      char v50 = 0;
      sub_100001DEC(&qword_100041898);
      sub_100001DEC(&qword_1000418A0);
      sub_100025DC0(&qword_1000418A8, &qword_100041898);
      sub_100010310(&qword_1000418B0, &qword_1000418A0);
      sub_100032058();
      swift_release();
      long long v36 = v51;
      long long v37 = v52;
      char v38 = v53;
    }
    else
    {
      id v29 = objc_allocWithZone((Class)ISIcon);
      swift_bridgeObjectRetain();
      NSString v30 = sub_100032608();
      swift_bridgeObjectRelease();
      id v31 = [v29 initWithBundleIdentifier:v30];

      uint64_t v32 = ApplicationIcon.init<>(icon:descriptor:)(v31, 0);
      uint64_t v46 = v33;
      uint64_t v47 = v32;
      uint64_t v48 = v34;
      uint64_t v49 = v35;
      char v50 = 1;
      sub_100001DEC(&qword_100041898);
      sub_100001DEC(&qword_1000418A0);
      sub_100025DC0(&qword_1000418A8, &qword_100041898);
      sub_100010310(&qword_1000418B0, &qword_1000418A0);
      sub_100032058();
      long long v36 = v51;
      long long v37 = v52;
      char v38 = v53;
      uint64_t v24 = v8;
    }
    *(_OWORD *)uint64_t v24 = v36;
    *((_OWORD *)v24 + 1) = v37;
    v24[32] = v38;
    swift_storeEnumTagMultiPayload();
    sub_100001DEC(&qword_1000418B8);
    sub_100010310(&qword_1000418C0, &qword_100041890);
    sub_10001EB28();
    return sub_100032058();
  }
}

unint64_t sub_10001EB28()
{
  unint64_t result = qword_1000418C8;
  if (!qword_1000418C8)
  {
    sub_100006B14(&qword_1000418B8);
    sub_100025DC0(&qword_1000418A8, &qword_100041898);
    sub_100010310(&qword_1000418B0, &qword_1000418A0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000418C8);
  }
  return result;
}

uint64_t sub_10001EBF0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v73 = a1;
  uint64_t v3 = sub_100001DEC(&qword_100041910);
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)&v54 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for ActivitySelectableRow(0);
  uint64_t v71 = *(void *)(v6 - 8);
  __chkstk_darwin(v6 - 8);
  uint64_t v72 = v7;
  uint64_t v8 = (char *)&v54 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v70 = type metadata accessor for ToggleableStyle(0);
  __chkstk_darwin(v70);
  unint64_t v69 = (uint64_t *)((char *)&v54 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v61 = sub_100001DEC(&qword_100041918);
  uint64_t v60 = *(void *)(v61 - 8);
  __chkstk_darwin(v61);
  uint64_t v11 = (char *)&v54 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v59 = sub_100001DEC(&qword_100041920);
  __chkstk_darwin(v59);
  uint64_t v13 = (char *)&v54 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v62 = sub_100001DEC(&qword_100041928);
  __chkstk_darwin(v62);
  uint64_t v63 = (char *)&v54 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v68 = sub_100001DEC(&qword_100041930);
  uint64_t v66 = *(void *)(v68 - 8);
  __chkstk_darwin(v68);
  uint64_t v65 = (char *)&v54 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_100001DEC(&qword_100041938);
  uint64_t v17 = __chkstk_darwin(v16);
  uint64_t v64 = (char *)&v54 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17);
  uint64_t v67 = (uint64_t)&v54 - v19;
  uint64_t v20 = *(uint64_t (**)(uint64_t))(**(void **)(v1 + 40) + 232);
  uint64_t v21 = swift_retain();
  char v22 = v20(v21);
  uint64_t v23 = swift_release();
  if (v22)
  {
    uint64_t v55 = v16;
    uint64_t v56 = v8;
    uint64_t v57 = v3;
    uint64_t v58 = v5;
    __chkstk_darwin(v23);
    *(&v54 - 2) = v1;
    swift_retain();
    swift_retain();
    sub_100001DEC(&qword_100041968);
    sub_100010310(&qword_100041970, &qword_100041968);
    sub_1000324F8();
    char v24 = sub_100032218();
    char v79 = *(unsigned char *)(*(void *)(v1 + 40) + 16);
    char v78 = 1;
    sub_10000674C();
    sub_1000326D8();
    sub_1000326D8();
    if (v76 == v74 && v77 == v75)
    {
      swift_bridgeObjectRelease_n();
    }
    else
    {
      sub_100032A38();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    uint64_t v27 = v62;
    uint64_t v26 = (uint64_t)v63;
    sub_100031C68();
    uint64_t v29 = v28;
    uint64_t v31 = v30;
    uint64_t v33 = v32;
    uint64_t v35 = v34;
    uint64_t v36 = v60;
    uint64_t v37 = v61;
    (*(void (**)(char *, char *, uint64_t))(v60 + 16))(v13, v11, v61);
    char v38 = &v13[*(int *)(v59 + 36)];
    *char v38 = v24;
    *((void *)v38 + 1) = v29;
    *((void *)v38 + 2) = v31;
    *((void *)v38 + 3) = v33;
    *((void *)v38 + 4) = v35;
    v38[40] = 0;
    (*(void (**)(char *, uint64_t))(v36 + 8))(v11, v37);
    LOBYTE(v37) = sub_100032228();
    sub_10000B5A4((uint64_t)v13, v26, &qword_100041920);
    uint64_t v39 = v26 + *(int *)(v27 + 36);
    *(unsigned char *)uint64_t v39 = v37;
    *(_OWORD *)(v39 + 8) = 0u;
    *(_OWORD *)(v39 + 24) = 0u;
    *(unsigned char *)(v39 + 40) = 1;
    sub_10000B608((uint64_t)v13, &qword_100041920);
    uint64_t v40 = *(void *)(v2 + 16);
    if (v40)
    {
      uint64_t v41 = v26;
      uint64_t v43 = (uint64_t)v69;
      uint64_t v42 = v70;
      *unint64_t v69 = *(void *)(v2 + 40);
      *(void *)(v43 + 8) = v40;
      uint64_t v44 = (uint64_t *)(v43 + *(int *)(v42 + 24));
      *uint64_t v44 = swift_getKeyPath();
      sub_100001DEC(&qword_100041310);
      swift_storeEnumTagMultiPayload();
      sub_100023804();
      sub_10001DC28(&qword_100041960, (void (*)(uint64_t))type metadata accessor for ToggleableStyle);
      swift_retain();
      swift_retain();
      uint64_t v45 = v65;
      sub_100032308();
      sub_100026080(v43, type metadata accessor for ToggleableStyle);
      sub_10000B608(v41, &qword_100041928);
      uint64_t v46 = (uint64_t)v56;
      sub_10002398C(v2, (uint64_t)v56, type metadata accessor for ActivitySelectableRow);
      unint64_t v47 = (*(unsigned __int8 *)(v71 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v71 + 80);
      uint64_t v48 = swift_allocObject();
      sub_1000239F8(v46, v48 + v47, type metadata accessor for ActivitySelectableRow);
      uint64_t v49 = v66;
      uint64_t v50 = (uint64_t)v64;
      uint64_t v51 = v68;
      (*(void (**)(char *, char *, uint64_t))(v66 + 16))(v64, v45, v68);
      long long v52 = (uint64_t (**)())(v50 + *(int *)(v55 + 36));
      *long long v52 = sub_10002392C;
      v52[1] = (uint64_t (*)())v48;
      v52[2] = 0;
      v52[3] = 0;
      (*(void (**)(char *, uint64_t))(v49 + 8))(v45, v51);
      uint64_t v53 = v67;
      sub_10000FEF8(v50, v67, &qword_100041938);
      sub_10000B5A4(v53, (uint64_t)v58, &qword_100041938);
      swift_storeEnumTagMultiPayload();
      sub_100023704();
      sub_100032058();
      return sub_10000B608(v53, &qword_100041938);
    }
    else
    {
      type metadata accessor for ActivityProvider();
      sub_10001DC28(&qword_100041290, (void (*)(uint64_t))type metadata accessor for ActivityProvider);
      swift_retain();
      uint64_t result = sub_100031E58();
      __break(1u);
    }
  }
  else
  {
    swift_storeEnumTagMultiPayload();
    sub_100023704();
    return sub_100032058();
  }
  return result;
}

uint64_t sub_10001F500@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v109 = a2;
  uint64_t v99 = sub_100031CA8();
  uint64_t v98 = *(void *)(v99 - 8);
  uint64_t v3 = __chkstk_darwin(v99);
  uint64_t v97 = (char *)&v95 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v96 = (uint64_t)&v95 - v5;
  uint64_t v106 = type metadata accessor for ActivitySelectableRow(0);
  __chkstk_darwin(v106);
  uint64_t v102 = (char *)&v95 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100031E38();
  uint64_t v8 = v7 - 8;
  __chkstk_darwin(v7);
  uint64_t v10 = (_OWORD *)((char *)&v95 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v11 = sub_100001DEC(&qword_100041BD8);
  __chkstk_darwin(v11 - 8);
  uint64_t v13 = (char *)&v95 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_100001DEC(&qword_100041BE0);
  uint64_t v15 = v14 - 8;
  __chkstk_darwin(v14);
  uint64_t v17 = (char *)&v95 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v104 = sub_100001DEC(&qword_100041BE8);
  __chkstk_darwin(v104);
  uint64_t v105 = (uint64_t)&v95 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_100001DEC(&qword_100041AF0);
  __chkstk_darwin(v19 - 8);
  uint64_t v21 = (char *)&v95 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = sub_100001DEC(&qword_100041BF0);
  uint64_t v23 = v22 - 8;
  __chkstk_darwin(v22);
  NSString v25 = (char *)&v95 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v100 = sub_100001DEC(&qword_100041BF8);
  uint64_t v26 = __chkstk_darwin(v100);
  uint64_t v108 = (uint64_t)&v95 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = __chkstk_darwin(v26);
  uint64_t v101 = (char *)&v95 - v29;
  __chkstk_darwin(v28);
  uint64_t v107 = (uint64_t)&v95 - v30;
  uint64_t v31 = (unsigned char *)swift_retain();
  sub_10001E3A0(v31, (uint64_t)v21);
  swift_release();
  sub_100032588();
  sub_100031D18();
  sub_10000B5A4((uint64_t)v21, (uint64_t)v25, &qword_100041AF0);
  uint64_t v32 = *(int *)(v23 + 44);
  uint64_t v103 = v25;
  uint64_t v33 = &v25[v32];
  long long v34 = v115;
  *(_OWORD *)uint64_t v33 = v114;
  *((_OWORD *)v33 + 1) = v34;
  *((_OWORD *)v33 + 2) = v116;
  sub_10000B608((uint64_t)v21, &qword_100041AF0);
  uint64_t v35 = (char *)v10 + *(int *)(v8 + 28);
  uint64_t v36 = enum case for RoundedCornerStyle.continuous(_:);
  uint64_t v37 = sub_100032008();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v37 - 8) + 104))(v35, v36, v37);
  __asm { FMOV            V0.2D, #5.0 }
  *uint64_t v10 = _Q0;
  sub_100031CC8();
  sub_10002398C((uint64_t)v10, (uint64_t)v13, (uint64_t (*)(void))&type metadata accessor for RoundedRectangle);
  uint64_t v43 = &v13[*(int *)(sub_100001DEC(&qword_100041C00) + 36)];
  long long v44 = v118;
  *(_OWORD *)uint64_t v43 = v117;
  *((_OWORD *)v43 + 1) = v44;
  *((void *)v43 + 4) = v119;
  uint64_t v45 = sub_100001DEC(&qword_100041C08);
  *(_DWORD *)&v13[*(int *)(v45 + 52)] = 1048576000;
  *(_WORD *)&v13[*(int *)(v45 + 56)] = 256;
  uint64_t v46 = sub_100032588();
  uint64_t v48 = v47;
  uint64_t v49 = (uint64_t *)&v13[*(int *)(sub_100001DEC(&qword_100041C10) + 36)];
  *uint64_t v49 = v46;
  v49[1] = v48;
  sub_100026080((uint64_t)v10, (uint64_t (*)(void))&type metadata accessor for RoundedRectangle);
  sub_100032588();
  sub_100031D18();
  sub_10000B5A4((uint64_t)v13, (uint64_t)v17, &qword_100041BD8);
  uint64_t v50 = (uint64_t)v17;
  uint64_t v51 = &v17[*(int *)(v15 + 44)];
  long long v52 = v121;
  *(_OWORD *)uint64_t v51 = v120;
  *((_OWORD *)v51 + 1) = v52;
  *((_OWORD *)v51 + 2) = v122;
  uint64_t v53 = (uint64_t)v102;
  sub_10000B608((uint64_t)v13, &qword_100041BD8);
  LODWORD(v46) = *(unsigned __int8 *)(a1 + 66);
  sub_10002398C(a1, v53, type metadata accessor for ActivitySelectableRow);
  if (v46 == 1)
  {
    uint64_t v54 = v106;
    uint64_t v55 = v96;
    sub_10000F8F8(v96);
    uint64_t v56 = v98;
    uint64_t v57 = v97;
    uint64_t v58 = v99;
    (*(void (**)(char *, void, uint64_t))(v98 + 104))(v97, enum case for ColorScheme.light(_:), v99);
    char v59 = sub_100031C98();
    uint64_t v60 = *(void (**)(char *, uint64_t))(v56 + 8);
    v60(v57, v58);
    v60((char *)v55, v58);
    sub_100026080(v53, type metadata accessor for ActivitySelectableRow);
    double v61 = 1.0;
    if (v59) {
      goto LABEL_6;
    }
  }
  else
  {
    sub_100026080(v53, type metadata accessor for ActivitySelectableRow);
    uint64_t v54 = v106;
  }
  double v61 = 0.0;
LABEL_6:
  uint64_t v62 = v105;
  sub_10000B5A4(v50, v105, &qword_100041BE0);
  *(double *)(v62 + *(int *)(v104 + 36)) = v61;
  sub_10000B608(v50, &qword_100041BE0);
  uint64_t v63 = sub_100032588();
  uint64_t v65 = v64;
  uint64_t v66 = (uint64_t)v101;
  uint64_t v67 = (uint64_t)&v101[*(int *)(v100 + 36)];
  sub_10000B5A4(v62, v67, &qword_100041BE8);
  uint64_t v68 = (uint64_t *)(v67 + *(int *)(sub_100001DEC(&qword_100041C18) + 36));
  *uint64_t v68 = v63;
  v68[1] = v65;
  uint64_t v69 = (uint64_t)v103;
  sub_10000B5A4((uint64_t)v103, v66, &qword_100041BF0);
  sub_10000B608(v62, &qword_100041BE8);
  sub_10000B608(v69, &qword_100041BF0);
  uint64_t v70 = v107;
  sub_10000FEF8(v66, v107, &qword_100041BF8);
  uint64_t v106 = *(void *)a1;
  LODWORD(v105) = *(unsigned __int8 *)(a1 + 8);
  uint64_t v71 = *(uint64_t (**)(uint64_t))(**(void **)(a1 + 40) + 184);
  uint64_t v72 = swift_retain();
  uint64_t v104 = v71(v72);
  uint64_t v74 = v73;
  swift_release();
  char v75 = *(unsigned char *)(a1 + 65);
  char v76 = *(unsigned char *)(a1 + 66);
  uint64_t v77 = a1 + *(int *)(v54 + 44);
  long long v78 = *(_OWORD *)v77;
  uint64_t v79 = *(void *)(v77 + 16);
  long long v110 = v78;
  uint64_t v111 = v79;
  sub_100001DEC(&qword_100041880);
  sub_1000324A8();
  uint64_t v80 = v112;
  uint64_t v81 = v113;
  char v82 = sub_100032218();
  sub_100031C68();
  uint64_t v84 = v83;
  uint64_t v86 = v85;
  uint64_t v88 = v87;
  uint64_t v90 = v89;
  uint64_t v91 = v108;
  sub_10000B5A4(v70, v108, &qword_100041BF8);
  uint64_t v92 = v109;
  sub_10000B5A4(v91, v109, &qword_100041BF8);
  uint64_t v93 = v92 + *(int *)(sub_100001DEC(&qword_100041C20) + 48);
  *(void *)uint64_t v93 = v106;
  *(unsigned char *)(v93 + 8) = v105;
  *(void *)(v93 + 16) = v104;
  *(void *)(v93 + 24) = v74;
  *(unsigned char *)(v93 + 32) = v75;
  *(unsigned char *)(v93 + 33) = v76;
  *(void *)(v93 + 40) = v80;
  *(void *)(v93 + 48) = v81;
  *(unsigned char *)(v93 + 56) = v82;
  *(void *)(v93 + 64) = v84;
  *(void *)(v93 + 72) = v86;
  *(void *)(v93 + 80) = v88;
  *(void *)(v93 + 88) = v90;
  *(unsigned char *)(v93 + 96) = 0;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_10000B608(v70, &qword_100041BF8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return sub_10000B608(v91, &qword_100041BF8);
}

uint64_t sub_10001FE8C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  *a3 = a1;
  a3[1] = a2;
  uint64_t v3 = (void *)((char *)a3 + *(int *)(type metadata accessor for ToggleableStyle(0) + 24));
  *uint64_t v3 = swift_getKeyPath();
  sub_100001DEC(&qword_100041310);

  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_10001FEF8(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ActivitySelectableRow(0);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  uint64_t v5 = __chkstk_darwin(v2);
  uint64_t v6 = *(void *)(a1 + 16);
  if (v6)
  {
    unint64_t v7 = *(void *)(v6 + 16);
    __chkstk_darwin(v5);
    v26[-2] = a1;
    swift_bridgeObjectRetain();
    uint64_t v8 = sub_10002040C((uint64_t (*)(uint64_t *))sub_100025E28, (uint64_t)&v26[-4], v7);
    uint64_t v9 = swift_bridgeObjectRelease();
    if (v8)
    {
      (*(void (**)(uint64_t))(*(void *)v8 + 112))(v9);
      swift_bridgeObjectRetain();
      swift_release();
      NSString v10 = sub_100032608();
      swift_bridgeObjectRelease();
      id v11 = [self shortLocalizedNameForIdentifier:v10];
      uint64_t v12 = sub_100032638();
      uint64_t v14 = v13;

      uint64_t v15 = a1 + *(int *)(v2 + 44);
      long long v16 = *(_OWORD *)v15;
      uint64_t v17 = *(void *)(v15 + 16);
      long long v27 = v16;
      uint64_t v28 = v17;
      v26[0] = v12;
      v26[1] = v14;
      sub_100001DEC(&qword_100041880);
      sub_1000324B8();
      swift_release();
    }
    uint64_t v18 = *(void *)(a1 + 40);
    uint64_t v19 = *(uint64_t (**)(uint64_t))(*(void *)v18 + 280);
    uint64_t v20 = swift_retain();
    char v21 = v19(v20);
    uint64_t result = swift_release();
    if (v21)
    {
      uint64_t v23 = *(void (**)(void))(*(void *)v18 + 240);
      swift_retain();
      v23(0);
      swift_release();
      sub_1000319D8();
      sub_1000319C8();
      sub_10002398C(a1, (uint64_t)v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for ActivitySelectableRow);
      unint64_t v24 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
      uint64_t v25 = swift_allocObject();
      sub_1000239F8((uint64_t)v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v25 + v24, type metadata accessor for ActivitySelectableRow);
      swift_bridgeObjectRetain();
      sub_1000319B8();
      swift_release();
      swift_release();
      return swift_bridgeObjectRelease();
    }
  }
  else
  {
    type metadata accessor for ActivityProvider();
    sub_10001DC28(&qword_100041290, (void (*)(uint64_t))type metadata accessor for ActivityProvider);
    uint64_t result = sub_100031E58();
    __break(1u);
  }
  return result;
}

uint64_t sub_1000202A4(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62)
  {
LABEL_14:
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_1000329A8();
    if (v3) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v3 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v3)
    {
LABEL_3:
      type metadata accessor for ActivityItem();
      uint64_t v4 = 4;
      do
      {
        uint64_t v5 = v4 - 4;
        if ((a2 & 0xC000000000000001) != 0)
        {
          sub_100032908();
          uint64_t v6 = v4 - 3;
          if (__OFADD__(v5, 1)) {
            goto LABEL_13;
          }
        }
        else
        {
          swift_retain();
          uint64_t v6 = v4 - 3;
          if (__OFADD__(v5, 1))
          {
LABEL_13:
            __break(1u);
            goto LABEL_14;
          }
        }
        sub_10001DC28(&qword_100041058, (void (*)(uint64_t))type metadata accessor for ActivityItem);
        char v7 = sub_1000325F8();
        swift_release();
        if (v7)
        {
          swift_bridgeObjectRelease();
          return 1;
        }
        ++v4;
      }
      while (v6 != v3);
    }
  }
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_10002040C(uint64_t (*a1)(uint64_t *), uint64_t a2, unint64_t a3)
{
  if (a3 >> 62)
  {
LABEL_17:
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_1000329A8();
    if (v6) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v6 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v6)
    {
LABEL_3:
      uint64_t v7 = 4;
      do
      {
        uint64_t v8 = v7 - 4;
        if ((a3 & 0xC000000000000001) != 0)
        {
          uint64_t v9 = sub_100032908();
          BOOL v10 = __OFADD__(v8, 1);
          uint64_t v11 = v7 - 3;
          if (v10) {
            goto LABEL_16;
          }
        }
        else
        {
          uint64_t v9 = *(void *)(a3 + 8 * v7);
          swift_retain();
          BOOL v10 = __OFADD__(v8, 1);
          uint64_t v11 = v7 - 3;
          if (v10)
          {
LABEL_16:
            __break(1u);
            goto LABEL_17;
          }
        }
        uint64_t v14 = v9;
        char v12 = a1(&v14);
        if (v3)
        {
          swift_bridgeObjectRelease();
          swift_release();
          return v9;
        }
        if (v12)
        {
          swift_bridgeObjectRelease();
          return v9;
        }
        swift_release();
        ++v7;
      }
      while (v11 != v6);
    }
  }
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_100020548(uint64_t a1, uint64_t a2)
{
  uint64_t v39 = a2;
  uint64_t v3 = type metadata accessor for ActivitySelectableRow(0);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v36 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100031BB8();
  uint64_t v37 = *(void *)(v6 - 8);
  uint64_t v38 = v6;
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100001DEC(&qword_100040FF8);
  uint64_t v10 = __chkstk_darwin(v9 - 8);
  char v12 = (char *)&v36 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v36 - v13;
  uint64_t v15 = sub_100031918();
  uint64_t v16 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  uint64_t v18 = (char *)&v36 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    uint64_t v19 = sub_100031A88();
    if (v20)
    {
      uint64_t v21 = v19;
      uint64_t v22 = v20;
      sub_100031A78();
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15) != 1)
      {
        (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v18, v14, v15);
        uint64_t v23 = v39;
        uint64_t v31 = *(void *)(v39 + 40);
        uint64_t v32 = *(void (**)(uint64_t, uint64_t))(*(void *)v31 + 192);
        swift_retain();
        v32(v21, v22);
        swift_release();
        (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v12, v18, v15);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v12, 0, 1, v15);
        uint64_t v33 = *(void (**)(char *))(*(void *)v31 + 144);
        swift_retain();
        v33(v12);
        swift_release();
        (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
        goto LABEL_10;
      }
      swift_bridgeObjectRelease();
      sub_10000B608((uint64_t)v14, &qword_100040FF8);
    }
  }
  sub_100031B98();
  uint64_t v23 = v39;
  sub_10002398C(v39, (uint64_t)v5, type metadata accessor for ActivitySelectableRow);
  unint64_t v24 = sub_100031BA8();
  os_log_type_t v25 = sub_1000327D8();
  if (os_log_type_enabled(v24, v25))
  {
    uint64_t v26 = (uint8_t *)swift_slowAlloc();
    uint64_t v27 = swift_slowAlloc();
    *(_DWORD *)uint64_t v26 = 136315138;
    uint64_t v41 = v27;
    uint64_t v28 = *((void *)v5 + 5);
    uint64_t v30 = *(void *)(v28 + 24);
    unint64_t v29 = *(void *)(v28 + 32);
    swift_bridgeObjectRetain();
    uint64_t v40 = sub_100003FD4(v30, v29, &v41);
    uint64_t v23 = v39;
    sub_100032858();
    swift_bridgeObjectRelease();
    sub_100026080((uint64_t)v5, type metadata accessor for ActivitySelectableRow);
    _os_log_impl((void *)&_mh_execute_header, v24, v25, "Failed to resolve localized name and/or artwork URL for bundle identifier: %s", v26, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    sub_100026080((uint64_t)v5, type metadata accessor for ActivitySelectableRow);
  }

  (*(void (**)(char *, uint64_t))(v37 + 8))(v8, v38);
LABEL_10:
  long long v34 = *(void (**)(uint64_t))(**(void **)(v23 + 40) + 240);
  swift_retain();
  v34(1);
  return swift_release();
}

uint64_t sub_100020A4C()
{
  return swift_retain();
}

uint64_t sub_100020A54(uint64_t a1)
{
  uint64_t result = swift_release();
  *uint64_t v1 = a1;
  return result;
}

uint64_t sub_100020A80()
{
  return swift_retain();
}

uint64_t sub_100020A88(uint64_t a1)
{
  uint64_t result = swift_release();
  *(void *)(v1 + 8) = a1;
  return result;
}

uint64_t (*sub_100020AB4())()
{
  return nullsub_1;
}

uint64_t sub_100020AD4@<X0>(uint64_t *a1@<X8>)
{
  *a1 = swift_getKeyPath();
  sub_100001DEC(&qword_100041310);

  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_100020B2C(char a1)
{
  uint64_t v3 = (uint64_t)*v1;
  if ((*(uint64_t (**)(void))(**v1 + 392))()) {
    return (*(uint64_t (**)(void))(*v1[1] + 160))(a1 & 1);
  }
  sub_10000674C();
  sub_1000326D8();
  sub_1000326D8();
  if (v12 == v10 && v13 == v11)
  {
    swift_bridgeObjectRelease_n();
LABEL_7:
    uint64_t v7 = *(void *)(v3 + 24);
    uint64_t v8 = *(void *)(v3 + 32);
    uint64_t v9 = *(void (**)(uint64_t, uint64_t, void))(*v1[1] + 168);
    swift_bridgeObjectRetain();
    v9(v7, v8, a1 & 1);
    return swift_bridgeObjectRelease();
  }
  char v5 = sub_100032A38();
  swift_bridgeObjectRelease();
  uint64_t v6 = swift_bridgeObjectRelease();
  if (v5) {
    goto LABEL_7;
  }
  return (*(uint64_t (**)(uint64_t))(*v1[1] + 176))(v6);
}

uint64_t sub_100020CDC@<X0>(void (*a1)(char *, char *, uint64_t)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v46 = a1;
  uint64_t v50 = a2;
  uint64_t v51 = sub_100001DEC(&qword_100041978);
  __chkstk_darwin(v51);
  uint64_t v4 = (char *)&v40 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v48 = sub_100001DEC(&qword_100041980);
  __chkstk_darwin(v48);
  uint64_t v49 = (uint64_t)&v40 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for ToggleableStyle(0);
  uint64_t v41 = *(void *)(v6 - 8);
  uint64_t v7 = *(void *)(v41 + 64);
  __chkstk_darwin(v6 - 8);
  uint64_t v44 = (uint64_t)&v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v42 = sub_100032178();
  uint64_t v8 = *(void *)(v42 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  __chkstk_darwin(v42);
  uint64_t v40 = (char *)&v40 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100001DEC(&qword_100041988);
  __chkstk_darwin(v10 - 8);
  uint64_t v12 = (char *)&v40 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v52 = sub_100001DEC(&qword_100041990);
  __chkstk_darwin(v52);
  uint64_t v14 = (char *)&v40 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v47 = sub_100001DEC(&qword_100041998);
  uint64_t v45 = *(void *)(v47 - 8);
  uint64_t v15 = __chkstk_darwin(v47);
  uint64_t v17 = (char *)&v40 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  uint64_t v43 = (char *)&v40 - v18;
  uint64_t v19 = v2;
  LOBYTE(v53) = *(unsigned char *)(*(void *)v2 + 16);
  char v55 = 1;
  sub_10000B7C4();
  char v20 = sub_1000325F8();
  uint64_t v21 = sub_100031F98();
  if (v20)
  {
    *(void *)uint64_t v4 = v21;
    *((void *)v4 + 1) = 0;
    v4[16] = 1;
    uint64_t v22 = sub_100001DEC(&qword_1000419C0);
    sub_100021858(v46, v19, &v4[*(int *)(v22 + 44)]);
    sub_10000B5A4((uint64_t)v4, v49, &qword_100041978);
    swift_storeEnumTagMultiPayload();
    unint64_t v23 = sub_100023A64();
    uint64_t v53 = v52;
    unint64_t v54 = v23;
    swift_getOpaqueTypeConformance2();
    sub_100010310(&qword_1000419B8, &qword_100041978);
    sub_100032058();
    return sub_10000B608((uint64_t)v4, &qword_100041978);
  }
  else
  {
    *(void *)uint64_t v12 = v21;
    *((void *)v12 + 1) = 0;
    v12[16] = 1;
    uint64_t v25 = sub_100001DEC(&qword_1000419A0);
    uint64_t v26 = v46;
    sub_10002135C(v19, (uint64_t)&v12[*(int *)(v25 + 44)]);
    sub_10000B5A4((uint64_t)v12, (uint64_t)v14, &qword_100041988);
    v14[*(int *)(v52 + 36)] = 0;
    sub_10000B608((uint64_t)v12, &qword_100041988);
    uint64_t v27 = v40;
    uint64_t v28 = v42;
    (*(void (**)(char *, void, uint64_t))(v8 + 16))(v40, v26, v42);
    uint64_t v29 = v19;
    uint64_t v30 = v44;
    sub_10002398C(v29, v44, type metadata accessor for ToggleableStyle);
    unint64_t v31 = (*(unsigned __int8 *)(v8 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
    unint64_t v32 = (v9 + *(unsigned __int8 *)(v41 + 80) + v31) & ~(unint64_t)*(unsigned __int8 *)(v41 + 80);
    uint64_t v33 = swift_allocObject();
    (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v33 + v31, v27, v28);
    sub_1000239F8(v30, v33 + v32, type metadata accessor for ToggleableStyle);
    unint64_t v34 = sub_100023A64();
    uint64_t v35 = v52;
    sub_100032318();
    swift_release();
    sub_10000B608((uint64_t)v14, &qword_100041990);
    uint64_t v36 = v45;
    uint64_t v37 = v43;
    uint64_t v38 = v17;
    uint64_t v39 = v47;
    (*(void (**)(char *, char *, uint64_t))(v45 + 32))(v43, v38, v47);
    (*(void (**)(uint64_t, char *, uint64_t))(v36 + 16))(v49, v37, v39);
    swift_storeEnumTagMultiPayload();
    uint64_t v53 = v35;
    unint64_t v54 = v34;
    swift_getOpaqueTypeConformance2();
    sub_100010310(&qword_1000419B8, &qword_100041978);
    sub_100032058();
    return (*(uint64_t (**)(char *, uint64_t))(v36 + 8))(v37, v39);
  }
}

uint64_t sub_10002135C@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v39 = a1;
  uint64_t v48 = sub_100032158();
  uint64_t v45 = *(void *)(v48 - 8);
  uint64_t v3 = __chkstk_darwin(v48);
  uint64_t v47 = (char *)&v39 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v46 = (char *)&v39 - v5;
  uint64_t v6 = sub_100031CA8();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v39 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v39 - v11;
  uint64_t v13 = sub_100032458();
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v39 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100032148();
  sub_100032448();
  (*(void (**)(char *, void, uint64_t))(v14 + 104))(v16, enum case for Image.ResizingMode.stretch(_:), v13);
  uint64_t v44 = sub_100032478();
  swift_release();
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  sub_100032588();
  sub_100031D18();
  char v17 = v54;
  uint64_t v42 = v55;
  uint64_t v43 = v53;
  char v18 = v56;
  uint64_t v40 = v58;
  uint64_t v41 = v57;
  if (sub_100032148())
  {
    uint64_t v19 = sub_1000323E8();
  }
  else
  {
    type metadata accessor for ToggleableStyle(0);
    sub_10000F8F8((uint64_t)v12);
    (*(void (**)(char *, void, uint64_t))(v7 + 104))(v10, enum case for ColorScheme.dark(_:), v6);
    char v20 = sub_100031C98();
    uint64_t v21 = *(void (**)(char *, uint64_t))(v7 + 8);
    v21(v10, v6);
    v21(v12, v6);
    uint64_t v22 = self;
    if (v20) {
      id v23 = objc_msgSend(v22, "systemGray2Color", v39);
    }
    else {
      id v23 = objc_msgSend(v22, "systemGray4Color", v39);
    }
    id v24 = v23;
    uint64_t v19 = sub_1000323C8();
  }
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v26 = v46;
  sub_100032168();
  char v52 = 1;
  char v51 = 1;
  char v50 = v17;
  char v49 = v18;
  uint64_t v27 = v45;
  uint64_t v28 = *(void (**)(char *, char *, uint64_t))(v45 + 16);
  uint64_t v30 = v47;
  uint64_t v29 = v48;
  v28(v47, v26, v48);
  char v31 = v52;
  char v32 = v51;
  char v33 = v50;
  char v34 = v49;
  *(void *)a2 = v44;
  *(void *)(a2 + 8) = 0;
  *(unsigned char *)(a2 + 16) = v31;
  *(unsigned char *)(a2 + 17) = v32;
  *(void *)(a2 + 24) = v43;
  *(unsigned char *)(a2 + 32) = v33;
  *(void *)(a2 + 40) = v42;
  *(unsigned char *)(a2 + 48) = v34;
  uint64_t v35 = v40;
  *(void *)(a2 + 56) = v41;
  *(void *)(a2 + 64) = v35;
  *(void *)(a2 + 72) = KeyPath;
  *(void *)(a2 + 80) = v19;
  uint64_t v36 = sub_100001DEC(&qword_100041BD0);
  v28((char *)(a2 + *(int *)(v36 + 48)), v30, v29);
  uint64_t v37 = *(void (**)(char *, uint64_t))(v27 + 8);
  swift_retain();
  swift_retain();
  swift_retain();
  v37(v26, v29);
  v37(v30, v29);
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_100021858@<X0>(void (*a1)(char *, char *, uint64_t)@<X0>, uint64_t a2@<X1>, char *a3@<X8>)
{
  long long v78 = a3;
  uint64_t v5 = sub_100032158();
  uint64_t v80 = *(void *)(v5 - 8);
  uint64_t v81 = v5;
  uint64_t v6 = __chkstk_darwin(v5);
  uint64_t v79 = (char *)&v60 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v83 = (char *)&v60 - v8;
  uint64_t v62 = type metadata accessor for ToggleableStyle(0);
  uint64_t v70 = *(void *)(v62 - 8);
  __chkstk_darwin(v62);
  uint64_t v71 = v9;
  uint64_t v73 = (uint64_t)&v60 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v72 = sub_100032178();
  uint64_t v10 = *(void *)(v72 - 8);
  __chkstk_darwin(v72);
  uint64_t v68 = v11;
  uint64_t v69 = (char *)&v60 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v61 = sub_100031CA8();
  uint64_t v12 = *(void *)(v61 - 8);
  uint64_t v13 = __chkstk_darwin(v61);
  uint64_t v15 = (char *)&v60 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  char v17 = (char *)&v60 - v16;
  uint64_t v18 = sub_100032458();
  uint64_t v19 = *(void *)(v18 - 8);
  __chkstk_darwin(v18);
  uint64_t v21 = (char *)&v60 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v76 = sub_100001DEC(&qword_100041B80);
  uint64_t v74 = *(void *)(v76 - 8);
  uint64_t v22 = __chkstk_darwin(v76);
  char v75 = (char *)&v60 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = __chkstk_darwin(v22);
  uint64_t v67 = (char *)&v60 - v25;
  __chkstk_darwin(v24);
  char v82 = (char *)&v60 - v26;
  sub_100032148();
  sub_100032448();
  (*(void (**)(char *, void, uint64_t))(v19 + 104))(v21, enum case for Image.ResizingMode.stretch(_:), v18);
  uint64_t v66 = sub_100032478();
  swift_release();
  (*(void (**)(char *, uint64_t))(v19 + 8))(v21, v18);
  sub_100032588();
  sub_100031D18();
  uint64_t v27 = v95;
  char v28 = v96;
  uint64_t v29 = v97;
  int v65 = v98;
  uint64_t v64 = v99;
  uint64_t v63 = v100;
  uint64_t v77 = a1;
  if (sub_100032148())
  {
    uint64_t v30 = sub_1000323E8();
  }
  else
  {
    uint64_t v60 = v29;
    sub_10000F8F8((uint64_t)v17);
    uint64_t v31 = v61;
    (*(void (**)(char *, void, uint64_t))(v12 + 104))(v15, enum case for ColorScheme.dark(_:), v61);
    char v32 = sub_100031C98();
    char v33 = *(void (**)(char *, uint64_t))(v12 + 8);
    v33(v15, v31);
    v33(v17, v31);
    char v34 = self;
    if (v32) {
      id v35 = [v34 systemGray2Color];
    }
    else {
      id v35 = [v34 systemGray4Color];
    }
    id v36 = v35;
    uint64_t v30 = sub_1000323C8();
    uint64_t v29 = v60;
  }
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v84 = v66;
  uint64_t v85 = 0;
  __int16 v86 = 257;
  uint64_t v87 = v27;
  char v88 = v28;
  uint64_t v89 = v29;
  char v90 = v65;
  uint64_t v91 = v64;
  uint64_t v92 = v63;
  uint64_t v93 = KeyPath;
  uint64_t v94 = v30;
  uint64_t v38 = v69;
  uint64_t v39 = v72;
  (*(void (**)(char *, void, uint64_t))(v10 + 16))(v69, v77, v72);
  uint64_t v40 = v73;
  sub_10002398C(a2, v73, type metadata accessor for ToggleableStyle);
  unint64_t v41 = (*(unsigned __int8 *)(v10 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  unint64_t v42 = (v68 + *(unsigned __int8 *)(v70 + 80) + v41) & ~(unint64_t)*(unsigned __int8 *)(v70 + 80);
  uint64_t v43 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v10 + 32))(v43 + v41, v38, v39);
  sub_1000239F8(v40, v43 + v42, type metadata accessor for ToggleableStyle);
  sub_100001DEC(&qword_100041B88);
  sub_100025C84();
  uint64_t v44 = v67;
  sub_100032318();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v45 = v74;
  uint64_t v46 = v82;
  uint64_t v47 = v76;
  (*(void (**)(char *, char *, uint64_t))(v74 + 32))(v82, v44, v76);
  uint64_t v48 = v83;
  sub_100032168();
  char v49 = *(void (**)(char *, char *, uint64_t))(v45 + 16);
  char v50 = v75;
  v49(v75, v46, v47);
  uint64_t v51 = v80;
  uint64_t v77 = *(void (**)(char *, char *, uint64_t))(v80 + 16);
  char v52 = v79;
  uint64_t v53 = v48;
  uint64_t v54 = v81;
  v77(v79, v53, v81);
  uint64_t v55 = v78;
  v49(v78, v50, v47);
  uint64_t v56 = sub_100001DEC(&qword_100041BC8);
  v77(&v55[*(int *)(v56 + 48)], v52, v54);
  uint64_t v57 = *(void (**)(char *, uint64_t))(v51 + 8);
  v57(v83, v54);
  uint64_t v58 = *(void (**)(char *, uint64_t))(v45 + 8);
  v58(v82, v47);
  v57(v52, v54);
  return ((uint64_t (*)(char *, uint64_t))v58)(v50, v47);
}

uint64_t sub_100022148@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v38 = a2;
  uint64_t v33 = sub_100001DEC(&qword_100041B20);
  uint64_t v3 = __chkstk_darwin(v33);
  uint64_t v30 = (char *)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v31 = (uint64_t)&v30 - v5;
  uint64_t v32 = sub_100001DEC(&qword_100041B28);
  __chkstk_darwin(v32);
  uint64_t v7 = (char *)&v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100032558();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100001DEC(&qword_100041B30);
  uint64_t v13 = __chkstk_darwin(v12 - 8);
  uint64_t v37 = (uint64_t)&v30 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v30 - v15;
  uint64_t v40 = sub_100031F98();
  sub_100022804(a1, (uint64_t)v67);
  char v70 = 1;
  *(_OWORD *)((char *)&v69[9] + 7) = v67[9];
  *(_OWORD *)((char *)&v69[10] + 7) = v67[10];
  *(_OWORD *)((char *)&v69[11] + 7) = v67[11];
  *(_WORD *)((char *)&v69[12] + 7) = v68;
  *(_OWORD *)((char *)&v69[5] + 7) = v67[5];
  *(_OWORD *)((char *)&v69[6] + 7) = v67[6];
  *(_OWORD *)((char *)&v69[7] + 7) = v67[7];
  *(_OWORD *)((char *)&v69[8] + 7) = v67[8];
  *(_OWORD *)((char *)&v69[1] + 7) = v67[1];
  *(_OWORD *)((char *)&v69[2] + 7) = v67[2];
  *(_OWORD *)((char *)&v69[3] + 7) = v67[3];
  *(_OWORD *)((char *)&v69[4] + 7) = v67[4];
  *(_OWORD *)((char *)v69 + 7) = v67[0];
  int v39 = 1;
  long long v85 = v69[9];
  long long v86 = v69[10];
  v87[0] = v69[11];
  *(_OWORD *)((char *)v87 + 9) = *(_OWORD *)((char *)&v69[11] + 9);
  long long v82 = v69[6];
  long long v83 = v69[7];
  long long v84 = v69[8];
  long long v78 = v69[2];
  long long v79 = v69[3];
  long long v80 = v69[4];
  long long v81 = v69[5];
  long long v76 = v69[0];
  long long v77 = v69[1];
  uint64_t KeyPath = swift_getKeyPath();
  char v71 = 0;
  uint64_t v35 = swift_getKeyPath();
  char v17 = v71;
  uint64_t v34 = swift_getKeyPath();
  LOBYTE(a1) = *(unsigned char *)(a1 + 32);
  sub_100032548();
  uint64_t v18 = *(void (**)(char *, char *, uint64_t))(v9 + 16);
  if (a1)
  {
    v18(v7, v11, v8);
    swift_storeEnumTagMultiPayload();
    sub_10001DC28(&qword_100041B38, (void (*)(uint64_t))&type metadata accessor for Divider);
    sub_100025330();
    sub_100032058();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  else
  {
    uint64_t v19 = v30;
    v18(v30, v11, v8);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    uint64_t v20 = (uint64_t)v19;
    uint64_t v21 = v31;
    sub_10000FEF8(v20, v31, &qword_100041B20);
    sub_10000B5A4(v21, (uint64_t)v7, &qword_100041B20);
    swift_storeEnumTagMultiPayload();
    sub_10001DC28(&qword_100041B38, (void (*)(uint64_t))&type metadata accessor for Divider);
    sub_100025330();
    sub_100032058();
    sub_10000B608(v21, &qword_100041B20);
  }
  uint64_t v22 = v37;
  sub_10000B5A4((uint64_t)v16, v37, &qword_100041B30);
  *(_OWORD *)((char *)&v41[20] + 1) = v85;
  *(_OWORD *)((char *)&v41[22] + 1) = v86;
  *(_OWORD *)((char *)&v41[24] + 1) = v87[0];
  *(_OWORD *)((char *)&v41[25] + 2) = *(_OWORD *)((char *)v87 + 9);
  *(_OWORD *)((char *)&v41[12] + 1) = v81;
  *(_OWORD *)((char *)&v41[14] + 1) = v82;
  *(_OWORD *)((char *)&v41[16] + 1) = v83;
  *(_OWORD *)((char *)&v41[18] + 1) = v84;
  *(_OWORD *)((char *)&v41[4] + 1) = v77;
  *(_OWORD *)((char *)&v41[6] + 1) = v78;
  *(_OWORD *)((char *)&v41[8] + 1) = v79;
  *(_OWORD *)((char *)&v41[10] + 1) = v80;
  v41[0] = v40;
  v41[1] = 0;
  LOBYTE(v41[2]) = v39;
  *(_OWORD *)((char *)&v41[2] + 1) = v76;
  *(_DWORD *)((char *)&v41[27] + 2) = v74;
  HIWORD(v41[27]) = v75;
  uint64_t v23 = v35;
  uint64_t v24 = KeyPath;
  v41[28] = KeyPath;
  v41[29] = 1;
  char v25 = v17;
  LOBYTE(v41[30]) = v17;
  *(_DWORD *)((char *)&v41[30] + 1) = *(_DWORD *)v73;
  HIDWORD(v41[30]) = *(_DWORD *)&v73[3];
  v41[31] = v35;
  LOBYTE(v41[32]) = 1;
  *(_DWORD *)((char *)&v41[32] + 1) = *(_DWORD *)v72;
  HIDWORD(v41[32]) = *(_DWORD *)&v72[3];
  uint64_t v26 = v34;
  v41[33] = v34;
  v41[34] = 0x3FE0000000000000;
  uint64_t v27 = v38;
  memcpy(v38, v41, 0x118uLL);
  uint64_t v28 = sub_100001DEC(&qword_100041B50);
  sub_10000B5A4(v22, (uint64_t)v27 + *(int *)(v28 + 48), &qword_100041B30);
  sub_100025430((uint64_t)v41);
  sub_10000B608((uint64_t)v16, &qword_100041B30);
  sub_10000B608(v22, &qword_100041B30);
  long long v53 = v85;
  long long v54 = v86;
  *(_OWORD *)uint64_t v55 = v87[0];
  *(_OWORD *)&v55[9] = *(_OWORD *)((char *)v87 + 9);
  long long v49 = v81;
  long long v50 = v82;
  long long v51 = v83;
  long long v52 = v84;
  long long v45 = v77;
  long long v46 = v78;
  long long v47 = v79;
  long long v48 = v80;
  v42[0] = v40;
  v42[1] = 0;
  char v43 = v39;
  long long v44 = v76;
  int v56 = v74;
  __int16 v57 = v75;
  uint64_t v58 = v24;
  uint64_t v59 = 1;
  char v60 = v25;
  *(_DWORD *)uint64_t v61 = *(_DWORD *)v73;
  *(_DWORD *)&v61[3] = *(_DWORD *)&v73[3];
  uint64_t v62 = v23;
  char v63 = 1;
  *(_DWORD *)uint64_t v64 = *(_DWORD *)v72;
  *(_DWORD *)&v64[3] = *(_DWORD *)&v72[3];
  uint64_t v65 = v26;
  uint64_t v66 = 0x3FE0000000000000;
  return sub_10002562C((uint64_t)v42);
}

uint64_t sub_100022804@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_100031FD8();
  __chkstk_darwin(v4 - 8);
  long long v66 = *(_OWORD *)(a1 + 16);
  sub_100011CA4();
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_1000322B8();
  uint64_t v58 = v6;
  uint64_t v59 = v5;
  char v57 = v7;
  uint64_t v60 = v8;
  uint64_t v65 = sub_100032418();
  uint64_t KeyPath = swift_getKeyPath();
  if (*(unsigned char *)(a1 + 33))
  {
    sub_100031FC8();
    v84._countAndFlagsBits = 546603234;
    v84._object = (void *)0xA400000000000000;
    sub_100031FB8(v84);
    sub_100031FA8(*(Swift::String *)(a1 + 40));
    v85._countAndFlagsBits = 0;
    v85._object = (void *)0xE000000000000000;
    sub_100031FB8(v85);
    sub_100031FF8();
  }
  else
  {
    sub_100031FE8();
  }
  uint64_t v9 = sub_1000322A8();
  uint64_t v11 = v10;
  char v13 = v12 & 1;
  uint64_t v14 = self;
  id v15 = [v14 systemGray2Color];
  sub_1000323C8();
  uint64_t v16 = sub_100032288();
  uint64_t v61 = v17;
  uint64_t v62 = v16;
  char v56 = v18;
  uint64_t v63 = v19;
  swift_release();
  sub_100025784(v9, v11, v13);
  swift_bridgeObjectRelease();
  sub_100025880((uint64_t *)a1, (uint64_t)v81);
  sub_100025880(v81, (uint64_t)&v82);
  if (v83 == 1)
  {
    if (!v82)
    {
      sub_100001DEC(&qword_100041B58);
      sub_1000258DC();
      sub_100032058();
      goto LABEL_10;
    }
    sub_100031FE8();
    uint64_t v20 = sub_1000322A8();
    uint64_t v22 = v21;
    uint64_t v24 = v23;
    uint64_t v26 = v25 & 1;
    unsigned __int8 v27 = sub_100032238();
    sub_100031C68();
    uint64_t v29 = v28;
    uint64_t v31 = v30;
    uint64_t v33 = v32;
    uint64_t v35 = v34;
    id v36 = [v14 systemGray2Color];
    uint64_t v37 = sub_1000323C8();
    uint64_t v38 = swift_getKeyPath();
    sub_100025588(v20, v22, v26);
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    sub_100025588(v20, v22, v26);
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    sub_100025784(v20, v22, v26);
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
    long long v66 = xmmword_1000340D0;
    uint64_t v67 = v20;
    uint64_t v68 = v22;
    uint64_t v69 = v26;
    uint64_t v70 = v24;
    uint64_t v71 = v27;
    uint64_t v72 = v29;
    uint64_t v73 = v31;
    uint64_t v74 = v33;
    uint64_t v75 = v35;
    uint64_t v76 = 0;
    uint64_t v77 = v38;
    uint64_t v78 = v37;
    char v79 = 1;
  }
  else
  {
    sub_100025974();
    sub_100032898();
    uint64_t v20 = sub_1000322B8();
    uint64_t v22 = v39;
    uint64_t v41 = v40;
    uint64_t v26 = v42 & 1;
    unsigned __int8 v43 = sub_100032238();
    sub_100031C68();
    uint64_t v45 = v44;
    uint64_t v47 = v46;
    uint64_t v49 = v48;
    uint64_t v51 = v50;
    id v52 = [v14 systemGray2Color];
    uint64_t v53 = sub_1000323C8();
    uint64_t v54 = swift_getKeyPath();
    sub_100025588(v20, v22, v26);
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    sub_100025588(v20, v22, v26);
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    sub_100025784(v20, v22, v26);
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
    long long v66 = xmmword_1000340D0;
    uint64_t v67 = v20;
    uint64_t v68 = v22;
    uint64_t v69 = v26;
    uint64_t v70 = v41;
    uint64_t v71 = v43;
    uint64_t v72 = v45;
    uint64_t v73 = v47;
    uint64_t v74 = v49;
    uint64_t v75 = v51;
    uint64_t v76 = 0;
    uint64_t v77 = v54;
    uint64_t v78 = v53;
    char v79 = 0;
  }
  sub_100001DEC(&qword_100041B70);
  sub_100010310(&qword_100041B68, &qword_100041B70);
  sub_100032058();
  sub_100001DEC(&qword_100041B58);
  sub_1000258DC();
  sub_100032058();
  sub_100025784(v20, v22, v26);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
LABEL_10:
  *(void *)a2 = v59;
  *(void *)(a2 + 8) = v58;
  *(unsigned char *)(a2 + 16) = v57 & 1;
  *(void *)(a2 + 24) = v60;
  *(void *)(a2 + 32) = KeyPath;
  *(void *)(a2 + 40) = v65;
  *(void *)(a2 + 48) = v62;
  *(void *)(a2 + 56) = v61;
  *(unsigned char *)(a2 + 64) = v56 & 1;
  *(void *)(a2 + 72) = v63;
  *(_OWORD *)(a2 + 80) = v66;
  *(void *)(a2 + 96) = v67;
  *(void *)(a2 + 104) = v68;
  *(void *)(a2 + 112) = v69;
  *(void *)(a2 + 120) = v70;
  *(void *)(a2 + 128) = v71;
  *(void *)(a2 + 136) = v72;
  *(void *)(a2 + 144) = v73;
  *(void *)(a2 + 152) = v74;
  *(void *)(a2 + 160) = v75;
  *(void *)(a2 + 168) = v76;
  *(void *)(a2 + 176) = v77;
  *(void *)(a2 + 184) = v78;
  *(unsigned char *)(a2 + 192) = v79;
  *(unsigned char *)(a2 + 193) = v80;
  sub_100025588(v59, v58, v57 & 1);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  sub_100025588(v62, v61, v56 & 1);
  swift_bridgeObjectRetain();
  sub_100025598(v66, *((uint64_t *)&v66 + 1), v67, v68, v69, v70, v71, v72, v73, v74, v75, v76, v77, v78, v79, v80);
  sub_100025794(v66, *((uint64_t *)&v66 + 1), v67, v68, v69, v70, v71, v72, v73, v74, v75, v76, v77, v78, v79, v80);
  sub_100025784(v62, v61, v56 & 1);
  swift_bridgeObjectRelease();
  sub_100025784(v59, v58, v57 & 1);
  swift_release();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_10002300C@<X0>(uint64_t a1@<X8>)
{
  long long v3 = *(_OWORD *)(v1 + 16);
  v6[0] = *(_OWORD *)v1;
  v6[1] = v3;
  uint64_t v6[2] = *(_OWORD *)(v1 + 32);
  uint64_t v7 = *(void *)(v1 + 48);
  *(void *)a1 = sub_100032018();
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  uint64_t v4 = sub_100001DEC(&qword_100041B18);
  return sub_100022148((uint64_t)v6, (void *)(a1 + *(int *)(v4 + 44)));
}

uint64_t sub_100023078@<X0>(uint64_t a1@<X8>)
{
  uint64_t v33 = a1;
  uint64_t v34 = sub_100001DEC(&qword_100041908);
  uint64_t v29 = *(void *)(v34 - 8);
  __chkstk_darwin(v34);
  uint64_t v2 = (char *)&v29 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = sub_100001DEC(&qword_100041C28);
  __chkstk_darwin(v32);
  uint64_t v4 = (char *)&v29 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = sub_100001DEC(&qword_1000418F8);
  __chkstk_darwin(v30);
  uint64_t v6 = (char *)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100031E38();
  __chkstk_darwin(v7);
  uint64_t v9 = (_OWORD *)((char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v10 = sub_100032458();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  char v13 = (char *)&v29 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = sub_100001DEC(&qword_1000418E8);
  __chkstk_darwin(v31);
  id v15 = (uint64_t *)((char *)&v29 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (sub_100031DC8())
  {
    (*(void (**)(char *, void, uint64_t))(v11 + 104))(v13, enum case for Image.ResizingMode.stretch(_:), v10);
    uint64_t v16 = sub_100032478();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    uint64_t v17 = (char *)v9 + *(int *)(v7 + 20);
    uint64_t v18 = enum case for RoundedCornerStyle.continuous(_:);
    uint64_t v19 = sub_100032008();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v19 - 8) + 104))(v17, v18, v19);
    __asm { FMOV            V0.2D, #5.0 }
    *uint64_t v9 = _Q0;
    sub_10002398C((uint64_t)v9, (uint64_t)v6, (uint64_t (*)(void))&type metadata accessor for RoundedRectangle);
    uint64_t v25 = v31;
    *(_WORD *)&v6[*(int *)(v30 + 36)] = 256;
    sub_10000B5A4((uint64_t)v6, (uint64_t)v15 + *(int *)(v25 + 36), &qword_1000418F8);
    *id v15 = v16;
    swift_retain();
    sub_10000B608((uint64_t)v6, &qword_1000418F8);
    sub_100026080((uint64_t)v9, (uint64_t (*)(void))&type metadata accessor for RoundedRectangle);
    swift_release();
    sub_10000B5A4((uint64_t)v15, (uint64_t)v4, &qword_1000418E8);
    swift_storeEnumTagMultiPayload();
    sub_10002360C();
    sub_100010310(&qword_100041900, &qword_100041908);
    sub_100032058();
    swift_release();
    return sub_10000B608((uint64_t)v15, &qword_1000418E8);
  }
  else
  {
    sub_100031CF8();
    uint64_t v27 = v29;
    uint64_t v28 = v34;
    (*(void (**)(char *, char *, uint64_t))(v29 + 16))(v4, v2, v34);
    swift_storeEnumTagMultiPayload();
    sub_10002360C();
    sub_100010310(&qword_100041900, &qword_100041908);
    sub_100032058();
    return (*(uint64_t (**)(char *, uint64_t))(v27 + 8))(v2, v28);
  }
}

unint64_t sub_10002356C()
{
  unint64_t result = qword_1000418D8;
  if (!qword_1000418D8)
  {
    sub_100006B14(&qword_1000418D0);
    sub_10002360C();
    sub_100010310(&qword_100041900, &qword_100041908);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000418D8);
  }
  return result;
}

unint64_t sub_10002360C()
{
  unint64_t result = qword_1000418E0;
  if (!qword_1000418E0)
  {
    sub_100006B14(&qword_1000418E8);
    sub_100010310(&qword_1000418F0, &qword_1000418F8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000418E0);
  }
  return result;
}

uint64_t type metadata accessor for ToggleableStyle(uint64_t a1)
{
  return sub_1000236CC(a1, qword_1000431C0);
}

uint64_t sub_1000236CC(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unint64_t sub_100023704()
{
  unint64_t result = qword_100041940;
  if (!qword_100041940)
  {
    sub_100006B14(&qword_100041938);
    sub_100006B14(&qword_100041928);
    type metadata accessor for ToggleableStyle(255);
    sub_100023804();
    sub_10001DC28(&qword_100041960, (void (*)(uint64_t))type metadata accessor for ToggleableStyle);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041940);
  }
  return result;
}

unint64_t sub_100023804()
{
  unint64_t result = qword_100041948;
  if (!qword_100041948)
  {
    sub_100006B14(&qword_100041928);
    sub_100023880();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041948);
  }
  return result;
}

unint64_t sub_100023880()
{
  unint64_t result = qword_100041950;
  if (!qword_100041950)
  {
    sub_100006B14(&qword_100041920);
    sub_100010310(&qword_100041958, &qword_100041918);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041950);
  }
  return result;
}

uint64_t sub_100023920@<X0>(uint64_t a1@<X8>)
{
  return sub_10001F500(*(void *)(v1 + 16), a1);
}

uint64_t sub_10002392C()
{
  uint64_t v1 = *(void *)(type metadata accessor for ActivitySelectableRow(0) - 8);
  uint64_t v2 = v0 + ((*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));

  return sub_10001FEF8(v2);
}

uint64_t sub_10002398C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1000239F8(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

unint64_t sub_100023A64()
{
  unint64_t result = qword_1000419A8;
  if (!qword_1000419A8)
  {
    sub_100006B14(&qword_100041990);
    sub_100010310(&qword_1000419B0, &qword_100041988);
    sub_100010310(&qword_100041420, &qword_100041428);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000419A8);
  }
  return result;
}

uint64_t sub_100023B28()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100023B44()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100023B60(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v13 = *a2;
    *(void *)a1 = *a2;
    uint64_t v4 = v13 + ((v5 + 16) & ~(unint64_t)v5);
  }
  else
  {
    *(void *)a1 = *a2;
    *(unsigned char *)(a1 + 8) = *((unsigned char *)a2 + 8);
    *(void *)(a1 + 16) = a2[2];
    *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 3);
    uint64_t v7 = a2[6];
    *(void *)(a1 + 40) = a2[5];
    *(void *)(a1 + 48) = v7;
    uint64_t v8 = a2[7];
    *(unsigned char *)(a1 + 64) = *((unsigned char *)a2 + 64);
    *(unsigned char *)(a1 + 65) = *((unsigned char *)a2 + 65);
    *(unsigned char *)(a1 + 66) = *((unsigned char *)a2 + 66);
    uint64_t v9 = *(int *)(a3 + 40);
    uint64_t v10 = (void *)(a1 + v9);
    uint64_t v11 = (uint64_t *)((char *)a2 + v9);
    *(void *)(a1 + 56) = v8;
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    sub_100001DEC(&qword_100041310);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v12 = sub_100031CA8();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
    }
    else
    {
      *uint64_t v10 = *v11;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v14 = *(int *)(a3 + 44);
    id v15 = (void *)(v4 + v14);
    uint64_t v16 = (uint64_t *)((char *)a2 + v14);
    uint64_t v17 = v16[1];
    *id v15 = *v16;
    v15[1] = v17;
    v15[2] = v16[2];
    swift_bridgeObjectRetain();
  }
  swift_retain();
  return v4;
}

uint64_t sub_100023D0C(uint64_t a1, uint64_t a2)
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v4 = a1 + *(int *)(a2 + 40);
  sub_100001DEC(&qword_100041310);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_100031CA8();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  }
  else
  {
    swift_release();
  }
  swift_bridgeObjectRelease();

  return swift_release();
}

uint64_t sub_100023DE8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  uint64_t v6 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v6;
  uint64_t v7 = *(void *)(a2 + 56);
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  *(unsigned char *)(a1 + 65) = *(unsigned char *)(a2 + 65);
  *(unsigned char *)(a1 + 66) = *(unsigned char *)(a2 + 66);
  uint64_t v8 = *(int *)(a3 + 40);
  uint64_t v9 = (void *)(a1 + v8);
  uint64_t v10 = (void *)(a2 + v8);
  *(void *)(a1 + 56) = v7;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_100001DEC(&qword_100041310);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v11 = sub_100031CA8();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
  }
  else
  {
    *uint64_t v9 = *v10;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v12 = *(int *)(a3 + 44);
  uint64_t v13 = (void *)(a1 + v12);
  uint64_t v14 = (void *)(a2 + v12);
  uint64_t v15 = v14[1];
  void *v13 = *v14;
  v13[1] = v15;
  void v13[2] = v14[2];
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

uint64_t sub_100023F48(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6 = *a2;
  *(unsigned char *)(a1 + 8) = *((unsigned char *)a2 + 8);
  *(void *)a1 = v6;
  *(void *)(a1 + 16) = a2[2];
  swift_retain();
  swift_release();
  *(void *)(a1 + 24) = a2[3];
  *(void *)(a1 + 32) = a2[4];
  *(void *)(a1 + 40) = a2[5];
  swift_retain();
  swift_release();
  *(void *)(a1 + 48) = a2[6];
  swift_retain();
  swift_release();
  *(void *)(a1 + 56) = a2[7];
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 64) = *((unsigned char *)a2 + 64);
  *(unsigned char *)(a1 + 65) = *((unsigned char *)a2 + 65);
  *(unsigned char *)(a1 + 66) = *((unsigned char *)a2 + 66);
  if ((uint64_t *)a1 != a2)
  {
    uint64_t v7 = *(int *)(a3 + 40);
    uint64_t v8 = (void *)(a1 + v7);
    uint64_t v9 = (uint64_t *)((char *)a2 + v7);
    sub_10000B608(a1 + v7, &qword_100041310);
    sub_100001DEC(&qword_100041310);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v10 = sub_100031CA8();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
    }
    else
    {
      *uint64_t v8 = *v9;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v11 = *(int *)(a3 + 44);
  uint64_t v12 = (void *)(a1 + v11);
  uint64_t v13 = (uint64_t)a2 + v11;
  *uint64_t v12 = *(uint64_t *)((char *)a2 + v11);
  v12[1] = *(uint64_t *)((char *)a2 + v11 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  _OWORD v12[2] = *(void *)(v13 + 16);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_100024108(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  long long v6 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v6;
  long long v7 = *(_OWORD *)(a2 + 48);
  *(_WORD *)(a1 + 64) = *(_WORD *)(a2 + 64);
  *(unsigned char *)(a1 + 66) = *(unsigned char *)(a2 + 66);
  uint64_t v8 = *(int *)(a3 + 40);
  uint64_t v9 = (void *)(a1 + v8);
  uint64_t v10 = (const void *)(a2 + v8);
  *(_OWORD *)(a1 + 48) = v7;
  uint64_t v11 = sub_100001DEC(&qword_100041310);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v12 = sub_100031CA8();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v12 - 8) + 32))(v9, v10, v12);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v9, v10, *(void *)(*(void *)(v11 - 8) + 64));
  }
  uint64_t v13 = *(int *)(a3 + 44);
  uint64_t v14 = a1 + v13;
  uint64_t v15 = a2 + v13;
  *(_OWORD *)uint64_t v14 = *(_OWORD *)v15;
  *(void *)(v14 + 16) = *(void *)(v15 + 16);
  return a1;
}

uint64_t sub_100024230(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_release();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_release();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_release();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_release();
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  *(unsigned char *)(a1 + 65) = *(unsigned char *)(a2 + 65);
  *(unsigned char *)(a1 + 66) = *(unsigned char *)(a2 + 66);
  if (a1 != a2)
  {
    uint64_t v6 = *(int *)(a3 + 40);
    long long v7 = (void *)(a1 + v6);
    uint64_t v8 = (const void *)(a2 + v6);
    sub_10000B608(a1 + v6, &qword_100041310);
    uint64_t v9 = sub_100001DEC(&qword_100041310);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v10 = sub_100031CA8();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 32))(v7, v8, v10);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v7, v8, *(void *)(*(void *)(v9 - 8) + 64));
    }
  }
  uint64_t v11 = *(int *)(a3 + 44);
  uint64_t v12 = (void *)(a1 + v11);
  uint64_t v13 = (void *)(a2 + v11);
  uint64_t v14 = v13[1];
  *uint64_t v12 = *v13;
  v12[1] = v14;
  swift_bridgeObjectRelease();
  _OWORD v12[2] = v13[2];
  swift_release();
  return a1;
}

uint64_t sub_1000243C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000243D4);
}

uint64_t sub_1000243D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 40);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_100001DEC(&qword_100041330);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 40);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_100024488(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10002449C);
}

uint64_t sub_10002449C(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 40) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_100001DEC(&qword_100041330);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 40);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

void sub_100024548()
{
  sub_10000F4E8();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t *sub_100024610(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v5 = *a2;
  *a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = (uint64_t *)(v5 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    a1[1] = a2[1];
    uint64_t v6 = *(int *)(a3 + 24);
    uint64_t v7 = (uint64_t *)((char *)a1 + v6);
    uint64_t v8 = (uint64_t *)((char *)a2 + v6);
    swift_retain();
    swift_retain();
    sub_100001DEC(&qword_100041310);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v9 = sub_100031CA8();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
    }
    else
    {
      void *v7 = *v8;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_100024738(uint64_t a1, uint64_t a2)
{
  swift_release();
  swift_release();
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  sub_100001DEC(&qword_100041310);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_100031CA8();
    uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
    return v6(v4, v5);
  }
  else
  {
    return swift_release();
  }
}

void *sub_1000247F8(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = *(int *)(a3 + 24);
  uint64_t v6 = (void *)((char *)a1 + v5);
  uint64_t v7 = (void *)((char *)a2 + v5);
  swift_retain();
  swift_retain();
  sub_100001DEC(&qword_100041310);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v8 = sub_100031CA8();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v8 - 8) + 16))(v6, v7, v8);
  }
  else
  {
    *uint64_t v6 = *v7;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

void *sub_1000248C8(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  if (a1 != a2)
  {
    uint64_t v6 = *(int *)(a3 + 24);
    uint64_t v7 = (void *)((char *)a1 + v6);
    uint64_t v8 = (void *)((char *)a2 + v6);
    sub_10000B608((uint64_t)a1 + v6, &qword_100041310);
    sub_100001DEC(&qword_100041310);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v9 = sub_100031CA8();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
    }
    else
    {
      void *v7 = *v8;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

_OWORD *sub_1000249D4(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 24);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_100001DEC(&qword_100041310);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v8 = sub_100031CA8();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 32))(v5, v6, v8);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v5, v6, *(void *)(*(void *)(v7 - 8) + 64));
  }
  return a1;
}

void *sub_100024AA8(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  swift_release();
  if (a1 != a2)
  {
    uint64_t v6 = *(int *)(a3 + 24);
    uint64_t v7 = (char *)a1 + v6;
    uint64_t v8 = (char *)a2 + v6;
    sub_10000B608((uint64_t)a1 + v6, &qword_100041310);
    uint64_t v9 = sub_100001DEC(&qword_100041310);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v10 = sub_100031CA8();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32))(v7, v8, v10);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v7, v8, *(void *)(*(void *)(v9 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_100024BB4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100024BC8);
}

uint64_t sub_100024BC8(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_100001DEC(&qword_100041330);
    uint64_t v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = (char *)a1 + *(int *)(a3 + 24);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_100024C7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100024C90);
}

void *sub_100024C90(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *unint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_100001DEC(&qword_100041330);
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 24);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

void sub_100024D3C()
{
  sub_10000F4E8();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

unint64_t sub_100024DDC()
{
  unint64_t result = qword_100041AE8;
  if (!qword_100041AE8)
  {
    sub_100006B14(&qword_100041AF0);
    sub_100010310(&qword_1000418C0, &qword_100041890);
    sub_10001EB28();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041AE8);
  }
  return result;
}

unint64_t sub_100024E80()
{
  unint64_t result = qword_100041AF8;
  if (!qword_100041AF8)
  {
    sub_100006B14(&qword_100041B00);
    sub_100023704();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041AF8);
  }
  return result;
}

unint64_t sub_100024F00()
{
  unint64_t result = qword_100041B08;
  if (!qword_100041B08)
  {
    sub_100006B14(&qword_100041B10);
    sub_100006B14(&qword_100041990);
    sub_100023A64();
    swift_getOpaqueTypeConformance2();
    sub_100010310(&qword_1000419B8, &qword_100041978);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041B08);
  }
  return result;
}

uint64_t destroy for RowText()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for RowText(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  uint64_t v3 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v3;
  *(_WORD *)(a1 + 32) = *(_WORD *)(a2 + 32);
  uint64_t v4 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for RowText(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  *(unsigned char *)(a1 + 8) = *((unsigned char *)a2 + 8);
  *(void *)a1 = v4;
  *(void *)(a1 + 16) = a2[2];
  *(void *)(a1 + 24) = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 32) = *((unsigned char *)a2 + 32);
  *(unsigned char *)(a1 + 33) = *((unsigned char *)a2 + 33);
  *(void *)(a1 + 40) = a2[5];
  *(void *)(a1 + 48) = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for RowText(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(unsigned char *)(a1 + 33) = *(unsigned char *)(a2 + 33);
  uint64_t v5 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for RowText(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 56)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for RowText(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)unint64_t result = a2 ^ 0x80000000;
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
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 56) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for RowText()
{
  return &type metadata for RowText;
}

uint64_t sub_100025204()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100025220@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = sub_100031F48();
  *(void *)a1 = result;
  *(unsigned char *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_100025254()
{
  return sub_100031F58();
}

uint64_t sub_100025284@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_100031EE8();
  *a1 = result & 1;
  return result;
}

uint64_t sub_1000252B4()
{
  return sub_100031EF8();
}

uint64_t sub_1000252DC@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_100031F08();
  *a1 = v3;
  return result;
}

uint64_t sub_100025308()
{
  return sub_100031F18();
}

unint64_t sub_100025330()
{
  unint64_t result = qword_100041B40;
  if (!qword_100041B40)
  {
    sub_100006B14(&qword_100041B20);
    sub_10001DC28(&qword_100041B38, (void (*)(uint64_t))&type metadata accessor for Divider);
    sub_1000253DC();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041B40);
  }
  return result;
}

unint64_t sub_1000253DC()
{
  unint64_t result = qword_100041B48;
  if (!qword_100041B48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041B48);
  }
  return result;
}

uint64_t sub_100025430(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 72);
  uint64_t v3 = *(void *)(a1 + 80);
  char v4 = *(unsigned char *)(a1 + 88);
  uint64_t v18 = *(void *)(a1 + 112);
  uint64_t v19 = *(void *)(a1 + 104);
  uint64_t v16 = *(void *)(a1 + 128);
  uint64_t v17 = *(void *)(a1 + 120);
  uint64_t v15 = *(void *)(a1 + 136);
  uint64_t v13 = *(void *)(a1 + 152);
  uint64_t v14 = *(void *)(a1 + 144);
  long long v11 = *(_OWORD *)(a1 + 168);
  long long v10 = *(_OWORD *)(a1 + 184);
  uint64_t v5 = *(void *)(a1 + 208);
  uint64_t v9 = *(void *)(a1 + 200);
  char v6 = *(unsigned char *)(a1 + 216);
  char v7 = *(unsigned char *)(a1 + 217);
  uint64_t v12 = *(void *)(a1 + 160);
  sub_100025588(*(void *)(a1 + 24), *(void *)(a1 + 32), *(unsigned char *)(a1 + 40));
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_100025588(v2, v3, v4);
  swift_bridgeObjectRetain();
  sub_100025598(v19, v18, v17, v16, v15, v14, v13, v12, v11, *((uint64_t *)&v11 + 1), v10, *((uint64_t *)&v10 + 1), v9, v5, v6, v7);
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t sub_100025588(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_100025598(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, char a16)
{
  if ((a16 & 1) == 0) {
    return sub_1000255CC(a1, a2, a3, a4, a5);
  }
  return a1;
}

uint64_t sub_1000255CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  sub_100025588(a3, a4, a5 & 1);
  swift_retain();
  swift_bridgeObjectRetain();

  return swift_retain();
}

uint64_t sub_10002562C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 72);
  uint64_t v3 = *(void *)(a1 + 80);
  char v4 = *(unsigned char *)(a1 + 88);
  uint64_t v18 = *(void *)(a1 + 112);
  uint64_t v19 = *(void *)(a1 + 104);
  uint64_t v16 = *(void *)(a1 + 128);
  uint64_t v17 = *(void *)(a1 + 120);
  uint64_t v15 = *(void *)(a1 + 136);
  uint64_t v13 = *(void *)(a1 + 152);
  uint64_t v14 = *(void *)(a1 + 144);
  uint64_t v12 = *(void *)(a1 + 160);
  long long v11 = *(_OWORD *)(a1 + 168);
  long long v10 = *(_OWORD *)(a1 + 184);
  uint64_t v5 = *(void *)(a1 + 208);
  uint64_t v9 = *(void *)(a1 + 200);
  char v6 = *(unsigned char *)(a1 + 216);
  char v7 = *(unsigned char *)(a1 + 217);
  sub_100025784(*(void *)(a1 + 24), *(void *)(a1 + 32), *(unsigned char *)(a1 + 40));
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  sub_100025784(v2, v3, v4);
  swift_bridgeObjectRelease();
  sub_100025794(v19, v18, v17, v16, v15, v14, v13, v12, v11, *((uint64_t *)&v11 + 1), v10, *((uint64_t *)&v10 + 1), v9, v5, v6, v7);
  swift_release();
  swift_release();
  swift_release();
  return a1;
}

uint64_t sub_100025784(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_100025794(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, char a16)
{
  if ((a16 & 1) == 0) {
    return sub_1000257C8(a1, a2, a3, a4, a5);
  }
  return a1;
}

uint64_t sub_1000257C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  sub_100025784(a3, a4, a5 & 1);
  swift_release();
  swift_bridgeObjectRelease();

  return swift_release();
}

uint64_t sub_100025828@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100031E98();
  *a1 = result;
  return result;
}

uint64_t sub_100025854()
{
  return sub_100031EA8();
}

uint64_t sub_100025880(uint64_t *a1, uint64_t a2)
{
  return a2;
}

unint64_t sub_1000258DC()
{
  unint64_t result = qword_100041B60;
  if (!qword_100041B60)
  {
    sub_100006B14(&qword_100041B58);
    sub_100010310(&qword_100041B68, &qword_100041B70);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041B60);
  }
  return result;
}

unint64_t sub_100025974()
{
  unint64_t result = qword_100041B78;
  if (!qword_100041B78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041B78);
  }
  return result;
}

uint64_t sub_1000259CC()
{
  uint64_t v1 = sub_100032178();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = *(void *)(v2 + 64);
  char v6 = (int *)(type metadata accessor for ToggleableStyle(0) - 8);
  uint64_t v7 = *(unsigned __int8 *)(*(void *)v6 + 80);
  uint64_t v8 = (v4 + v5 + v7) & ~v7;
  uint64_t v9 = *(void *)(*(void *)v6 + 64);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();
  swift_release();
  uint64_t v10 = v0 + v8 + v6[8];
  sub_100001DEC(&qword_100041310);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v11 = sub_100031CA8();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(v10, v11);
  }
  else
  {
    swift_release();
  }

  return _swift_deallocObject(v0, v8 + v9, v3 | v7 | 7);
}

uint64_t sub_100025B78()
{
  sub_100032178();
  type metadata accessor for ToggleableStyle(0);
  uint64_t v0 = (void (*)(uint64_t *, void))sub_100032138();
  *uint64_t v1 = !*v1;
  v0(&v4, 0);
  char v2 = sub_100032148();
  return sub_100020B2C(v2 & 1);
}

unint64_t sub_100025C84()
{
  unint64_t result = qword_100041B90;
  if (!qword_100041B90)
  {
    sub_100006B14(&qword_100041B88);
    sub_100025D24();
    sub_100010310(&qword_100041BB8, &qword_100041BC0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041B90);
  }
  return result;
}

unint64_t sub_100025D24()
{
  unint64_t result = qword_100041B98;
  if (!qword_100041B98)
  {
    sub_100006B14(&qword_100041BA0);
    sub_100025DC0(&qword_100041BA8, &qword_100041BB0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041B98);
  }
  return result;
}

uint64_t sub_100025DC0(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100006B14(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100025E28(uint64_t a1)
{
  unint64_t v1 = (*(uint64_t (**)(void))(**(void **)a1 + 160))();
  uint64_t v2 = swift_retain();
  char v3 = sub_1000202A4(v2, v1);
  swift_release();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_100025EB4()
{
  uint64_t v1 = type metadata accessor for ActivitySelectableRow(0);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v5 = v0 + v3 + *(int *)(v1 + 40);
  sub_100001DEC(&qword_100041310);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_100031CA8();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  }
  else
  {
    swift_release();
  }
  swift_bridgeObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, v3 + v4, v2 | 7);
}

uint64_t sub_100026010(uint64_t a1)
{
  uint64_t v3 = *(void *)(type metadata accessor for ActivitySelectableRow(0) - 8);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));

  return sub_100020548(a1, v4);
}

uint64_t sub_100026080(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1000260E0()
{
  return sub_100010310(&qword_100041C30, &qword_100041C38);
}

uint64_t sub_100026124()
{
  return swift_retain();
}

uint64_t sub_10002612C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ActivityPickerViewConfiguration();
  uint64_t v5 = sub_10002B78C(&qword_100041C40, (void (*)(uint64_t))type metadata accessor for ActivityPickerViewConfiguration);

  return ObservedObject.projectedValue.getter(a1, a2, v4, v5);
}

uint64_t sub_1000261B8()
{
  return swift_retain();
}

void sub_1000261C4(uint64_t a1@<X1>, uint64_t a2@<X2>, void *a3@<X3>, uint64_t a4@<X8>)
{
  swift_retain();
  swift_retain();
  id v8 = a3;

  sub_100026230(a1, a2, v8, 1, a4);
}

void sub_100026230(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, int a4@<W3>, uint64_t a5@<X8>)
{
  int v43 = a4;
  uint64_t v9 = sub_100031938();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v39 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v15 = (char *)&v39 - v14;
  uint64_t v46 = 0;
  unint64_t v47 = 0xE000000000000000;
  sub_100032498();
  uint64_t v16 = v49;
  *(_OWORD *)(a5 + 40) = v48;
  *(void *)(a5 + 56) = v16;
  uint64_t v44 = type metadata accessor for ActivityPickerServiceEmbeddedView();
  sub_100031928();
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v13, v15, v9);
  sub_100032498();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v15, v9);
  type metadata accessor for ActivityPickerViewConfiguration();
  sub_10002B78C(&qword_100041C40, (void (*)(uint64_t))type metadata accessor for ActivityPickerViewConfiguration);
  swift_retain();
  uint64_t v45 = a1;
  *(void *)a5 = sub_100031D88();
  *(void *)(a5 + 8) = v17;
  *(void *)(a5 + 16) = a2;
  *(void *)(a5 + 32) = a3;
  unint64_t v18 = *(void *)(a2 + 16);
  *(void *)&long long v48 = _swiftEmptyArrayStorage;
  if (v18 >> 62)
  {
    swift_retain();
    id v32 = a3;
    swift_bridgeObjectRetain();
    uint64_t v19 = sub_1000329A8();
    if (v19) {
      goto LABEL_3;
    }
LABEL_20:
    uint64_t v30 = swift_bridgeObjectRelease();
    uint64_t v31 = _swiftEmptyArrayStorage;
    goto LABEL_21;
  }
  uint64_t v19 = *(void *)((v18 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_retain();
  id v20 = a3;
  swift_bridgeObjectRetain();
  if (!v19) {
    goto LABEL_20;
  }
LABEL_3:
  if (v19 < 1)
  {
    __break(1u);
    return;
  }
  uint64_t v40 = a2;
  uint64_t v41 = a5;
  char v42 = a3;
  for (uint64_t i = 0; i != v19; ++i)
  {
    if ((v18 & 0xC000000000000001) != 0)
    {
      uint64_t v22 = sub_100032908();
    }
    else
    {
      uint64_t v22 = *(void *)(v18 + 8 * i + 32);
      swift_retain();
    }
    if ((*(uint64_t (**)(void))(*(void *)v22 + 264))()) {
      goto LABEL_6;
    }
    (*(void (**)(void))(*(void *)v22 + 112))();
    swift_bridgeObjectRetain();
    swift_release();
    NSString v23 = sub_100032608();
    swift_bridgeObjectRelease();
    uint64_t v24 = sub_100032638();
    uint64_t v26 = v25;
    if (v24 == sub_100032638() && v26 == v27)
    {

      swift_bridgeObjectRelease_n();
LABEL_6:
      sub_100032938();
      sub_100032968();
      sub_100032978();
      sub_100032948();
      continue;
    }
    char v29 = sub_100032A38();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v29) {
      goto LABEL_6;
    }
    swift_release();
  }
  uint64_t v30 = swift_bridgeObjectRelease();
  uint64_t v31 = (void *)v48;
  a5 = v41;
  a3 = v42;
  a2 = v40;
LABEL_21:
  uint64_t v33 = v45;
  *(void *)(a5 + *(int *)(v44 + 40)) = v31;
  if ((*(uint64_t (**)(uint64_t))(*(void *)v33 + 104))(v30) & 1) != 0 && (v43)
  {
    type metadata accessor for ActivityPickerServiceEmbeddedView.ActivityPickerServiceSelectionsObserver();
    uint64_t v34 = a2;
    uint64_t v35 = swift_allocObject();
    *(void *)(v35 + 16) = v34;
    *(void *)(v35 + 24) = a3;
    id v36 = *(void (**)(uint64_t, _UNKNOWN **))(*(void *)v34 + 104);
    swift_retain();
    id v37 = a3;
    uint64_t v38 = swift_retain();
    v36(v38, &off_10003E038);
    swift_release();
    swift_release();
  }
  else
  {
    swift_release();
    swift_release();
    uint64_t v35 = 0;
  }

  *(void *)(a5 + 24) = v35;
}

uint64_t sub_100026700()
{
  return sub_100031D88();
}

void sub_100026788(uint64_t a1@<X8>)
{
  uint64_t v3 = v1[1];
  uint64_t v4 = v1[2];
  uint64_t v5 = (void *)v1[3];
  swift_retain();
  swift_retain();
  id v6 = v5;

  sub_100026230(v3, v4, v6, 1, a1);
}

uint64_t sub_1000267F0()
{
  type metadata accessor for ActivityPickerViewConfiguration();
  sub_10002B78C(&qword_100041C40, (void (*)(uint64_t))type metadata accessor for ActivityPickerViewConfiguration);

  return sub_100031D88();
}

uint64_t sub_10002686C()
{
  uint64_t v1 = *v0;
  uint64_t v2 = v0[1];
  uint64_t v3 = type metadata accessor for ActivityPickerViewConfiguration();
  uint64_t v4 = sub_10002B78C(&qword_100041C40, (void (*)(uint64_t))type metadata accessor for ActivityPickerViewConfiguration);

  return ObservedObject.projectedValue.getter(v1, v2, v3, v4);
}

uint64_t sub_1000268F4()
{
  return swift_retain();
}

uint64_t sub_1000268FC()
{
  return swift_retain();
}

id sub_100026904()
{
  return *(id *)(v0 + 32);
}

uint64_t sub_10002690C()
{
  return 0;
}

uint64_t sub_100026918(uint64_t a1)
{
  uint64_t v2 = sub_100031938();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v6 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
  sub_100032498();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
}

void *sub_100026A14()
{
  return &_swiftEmptyArrayStorage;
}

void *sub_100026A20(uint64_t (*a1)(uint64_t *), void *a2, unint64_t a3)
{
  unint64_t v5 = a3;
  unint64_t v18 = _swiftEmptyArrayStorage;
  if (a3 >> 62)
  {
LABEL_18:
    uint64_t v8 = sub_1000329A8();
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v8 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v8)
    {
LABEL_3:
      unint64_t v9 = 0;
      uint64_t v15 = v5 & 0xFFFFFFFFFFFFFF8;
      unint64_t v16 = v5 & 0xC000000000000001;
      unint64_t v14 = v5;
      while (1)
      {
        if (v16)
        {
          uint64_t v10 = sub_100032908();
          unint64_t v11 = v9 + 1;
          if (__OFADD__(v9, 1))
          {
LABEL_14:
            __break(1u);
LABEL_15:
            swift_bridgeObjectRelease();
            swift_release();
            swift_release();
            return v3;
          }
        }
        else
        {
          if (v9 >= *(void *)(v15 + 16))
          {
            __break(1u);
            goto LABEL_18;
          }
          uint64_t v10 = *(void *)(v5 + 8 * v9 + 32);
          swift_retain();
          unint64_t v11 = v9 + 1;
          if (__OFADD__(v9, 1)) {
            goto LABEL_14;
          }
        }
        uint64_t v17 = v10;
        uint64_t v3 = a2;
        char v12 = a1(&v17);
        if (v4) {
          goto LABEL_15;
        }
        if (v12)
        {
          sub_100032938();
          sub_100032968();
          unint64_t v5 = v14;
          sub_100032978();
          uint64_t v3 = &v18;
          sub_100032948();
        }
        else
        {
          swift_release();
        }
        ++v9;
        if (v11 == v8)
        {
          uint64_t v3 = v18;
          goto LABEL_20;
        }
      }
    }
  }
  uint64_t v3 = _swiftEmptyArrayStorage;
LABEL_20:
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t sub_100026BDC(uint64_t a1, void *a2)
{
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = a1;
  *(void *)(v4 + 24) = a2;
  unint64_t v5 = *(void (**)(uint64_t, _UNKNOWN **))(*(void *)a1 + 104);
  swift_retain();
  id v6 = a2;
  uint64_t v7 = swift_retain();
  v5(v7, &off_10003E038);
  swift_release();

  return v4;
}

uint64_t type metadata accessor for ActivityPickerServiceEmbeddedView()
{
  uint64_t result = qword_100043380;
  if (!qword_100043380) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100026CCC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v24 = a1;
  uint64_t v3 = sub_100032088();
  uint64_t v25 = *(void *)(v3 - 8);
  uint64_t v26 = v3;
  __chkstk_darwin(v3);
  uint64_t v22 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100032128();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100001DEC(&qword_100041C48);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  char v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_100001DEC(&qword_100041C50);
  uint64_t v23 = *(void *)(v21 - 8);
  __chkstk_darwin(v21);
  unint64_t v14 = (char *)&v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = v2;
  sub_100001DEC(&qword_100041C58);
  sub_100010310(&qword_100041C60, &qword_100041C58);
  sub_100031D78();
  sub_100032118();
  uint64_t v15 = sub_100010310(&qword_100041C68, &qword_100041C48);
  uint64_t v16 = sub_10002B78C(&qword_100041C70, (void (*)(uint64_t))&type metadata accessor for StackNavigationViewStyle);
  sub_1000322C8();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  uint64_t v17 = *(void *)(v2 + 56);
  long long v28 = *(_OWORD *)(v2 + 40);
  uint64_t v29 = v17;
  sub_100001DEC(&qword_100041880);
  sub_1000324C8();
  unint64_t v18 = v22;
  sub_100032078();
  uint64_t v30 = v9;
  uint64_t v31 = v5;
  uint64_t v32 = v15;
  uint64_t v33 = v16;
  swift_getOpaqueTypeConformance2();
  uint64_t v19 = v21;
  sub_1000322F8();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v25 + 8))(v18, v26);
  return (*(uint64_t (**)(char *, uint64_t))(v23 + 8))(v14, v19);
}

uint64_t sub_10002710C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v46 = a1;
  uint64_t v64 = a2;
  uint64_t v63 = sub_100031F88();
  uint64_t v60 = *(void *)(v63 - 8);
  __chkstk_darwin(v63);
  uint64_t v59 = (char *)&v45 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1000320D8();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v45 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100001DEC(&qword_100041DD8);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v45 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v48 = sub_100001DEC(&qword_100041DE0);
  uint64_t v50 = *(void *)(v48 - 8);
  __chkstk_darwin(v48);
  uint64_t v13 = (char *)&v45 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v52 = sub_100001DEC(&qword_100041DE8);
  uint64_t v53 = *(void *)(v52 - 8);
  __chkstk_darwin(v52);
  unint64_t v47 = (char *)&v45 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v58 = sub_100001DEC(&qword_100041DF0);
  uint64_t v56 = *(void *)(v58 - 8);
  __chkstk_darwin(v58);
  uint64_t v49 = (char *)&v45 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v51 = sub_100001DEC(&qword_100041DF8);
  __chkstk_darwin(v51);
  uint64_t v17 = (char *)&v45 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_100001DEC(&qword_100041E00);
  uint64_t v61 = *(void *)(v18 - 8);
  uint64_t v62 = v18;
  __chkstk_darwin(v18);
  uint64_t v54 = (char *)&v45 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v57 = sub_100001DEC(&qword_100041C58) - 8;
  __chkstk_darwin(v57);
  uint64_t v55 = (char *)&v45 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v66 = a1;
  sub_100001DEC(&qword_100041E08);
  sub_10002A980();
  sub_100032278();
  sub_1000320C8();
  uint64_t v21 = sub_100010310(&qword_100041E98, &qword_100041DD8);
  sub_1000323B8();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  sub_100031FE8();
  uint64_t v67 = v8;
  unint64_t v68 = v4;
  uint64_t v69 = v21;
  uint64_t v70 = &protocol witness table for InsetGroupedListStyle;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v23 = v47;
  uint64_t v24 = v48;
  sub_100032338();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v25 = v24;
  (*(void (**)(char *, uint64_t))(v50 + 8))(v13, v24);
  uint64_t v26 = v46;
  uint64_t v27 = *(uint64_t (**)(uint64_t))(**(void **)(v46 + 8) + 104);
  uint64_t v28 = swift_retain();
  LOBYTE(v27) = v27(v28);
  swift_release();
  uint64_t v29 = v59;
  uint64_t v30 = v60;
  uint64_t v31 = (unsigned int *)&enum case for NavigationBarItem.TitleDisplayMode.automatic(_:);
  if ((v27 & 1) == 0) {
    uint64_t v31 = (unsigned int *)&enum case for NavigationBarItem.TitleDisplayMode.inline(_:);
  }
  uint64_t v32 = v63;
  (*(void (**)(char *, void, uint64_t))(v60 + 104))(v59, *v31, v63);
  uint64_t v67 = v25;
  unint64_t v68 = OpaqueTypeConformance2;
  swift_getOpaqueTypeConformance2();
  uint64_t v33 = v49;
  uint64_t v34 = v52;
  sub_100032378();
  (*(void (**)(char *, uint64_t))(v30 + 8))(v29, v32);
  (*(void (**)(char *, uint64_t))(v53 + 8))(v23, v34);
  uint64_t v35 = sub_100032588();
  uint64_t v37 = v36;
  uint64_t v38 = (uint64_t)&v17[*(int *)(v51 + 36)];
  sub_100028650(v26, v38);
  uint64_t v39 = (uint64_t *)(v38 + *(int *)(sub_100001DEC(&qword_100041EA0) + 36));
  *uint64_t v39 = v35;
  v39[1] = v37;
  (*(void (**)(char *, char *, uint64_t))(v56 + 32))(v17, v33, v58);
  uint64_t v65 = v26;
  sub_100001DEC(&qword_100041EA8);
  sub_10002AD8C();
  uint64_t v40 = sub_100006B14(&qword_100041EC0);
  unint64_t v41 = sub_10002AF14();
  uint64_t v67 = v40;
  unint64_t v68 = v41;
  swift_getOpaqueTypeConformance2();
  char v42 = v54;
  sub_100032388();
  sub_10000B608((uint64_t)v17, &qword_100041DF8);
  type metadata accessor for ActivityPickerServiceEmbeddedView();
  uint64_t v43 = (uint64_t)v55;
  sub_100001DEC(&qword_100041C78);
  sub_1000324A8();
  (*(void (**)(uint64_t, char *, uint64_t))(v61 + 32))(v43, v42, v62);
  return sub_10000FEF8(v43, v64, &qword_100041C58);
}

uint64_t sub_10002798C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_100001DEC(&qword_100041E08);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *(void *)(a1 + 8);
  uint64_t v9 = *(uint64_t (**)(uint64_t))(*(void *)v8 + 152);
  uint64_t v10 = swift_retain();
  uint64_t v11 = v9(v10);
  uint64_t v13 = v12;
  swift_release();
  if (v13)
  {
    uint64_t v34 = v11;
    uint64_t v35 = v13;
    sub_100011CA4();
    uint64_t v14 = sub_1000322B8();
    uint64_t v18 = v17 & 1;
  }
  else
  {
    uint64_t v14 = 0;
    uint64_t v15 = 0;
    uint64_t v18 = 0;
    uint64_t v16 = 0;
  }
  uint64_t v34 = v14;
  uint64_t v35 = v15;
  uint64_t v36 = v18;
  uint64_t v37 = v16;
  uint64_t v19 = *(uint64_t (**)(uint64_t))(*(void *)v8 + 200);
  uint64_t v20 = swift_retain();
  uint64_t v21 = v19(v20);
  uint64_t v23 = v22;
  swift_release();
  if (v23)
  {
    uint64_t v30 = v21;
    uint64_t v31 = v23;
    sub_100011CA4();
    uint64_t v24 = sub_1000322B8();
    uint64_t v28 = v27 & 1;
  }
  else
  {
    uint64_t v24 = 0;
    uint64_t v25 = 0;
    uint64_t v28 = 0;
    uint64_t v26 = 0;
  }
  uint64_t v30 = v24;
  uint64_t v31 = v25;
  uint64_t v32 = v28;
  uint64_t v33 = v26;
  __chkstk_darwin(v24);
  sub_100001DEC(&qword_100041E20);
  sub_100001DEC(&qword_100041E30);
  sub_10002AA00();
  sub_10002AA6C();
  sub_100032578();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v5 + 32))(a2, v7, v4);
}

uint64_t sub_100027C04(uint64_t a1, uint64_t a2)
{
  if (!a2) {
    return 0;
  }
  sub_100011CA4();
  return sub_1000322B8();
}

uint64_t sub_100027C58@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for ActivityPickerServiceEmbeddedView();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  __chkstk_darwin(v4 - 8);
  uint64_t v7 = sub_100001DEC(&qword_100041E30);
  uint64_t v26 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v25 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v9 = *(void *)(*(void *)(a1 + 16) + 16);
  char v27 = _swiftEmptyArrayStorage;
  if (!(v9 >> 62))
  {
    uint64_t v10 = *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (v10) {
      goto LABEL_3;
    }
LABEL_14:
    swift_bridgeObjectRelease();
    uint64_t v14 = _swiftEmptyArrayStorage;
LABEL_15:
    uint64_t v29 = v14;
    swift_getKeyPath();
    sub_10002B464(a1, (uint64_t)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))type metadata accessor for ActivityPickerServiceEmbeddedView);
    unint64_t v15 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
    uint64_t v16 = swift_allocObject();
    sub_10002B00C((uint64_t)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v16 + v15);
    sub_100001DEC(&qword_100041830);
    sub_100001DEC(&qword_100041F10);
    sub_100010310(&qword_100041F18, &qword_100041830);
    sub_10002B78C(&qword_100041F20, (void (*)(uint64_t))type metadata accessor for ActivityGroup);
    uint64_t v17 = sub_100006B14(&qword_100041E38);
    uint64_t v18 = sub_100006B14(&qword_100041E40);
    unint64_t v19 = sub_10002AB50();
    char v27 = (void *)v18;
    unint64_t v28 = v19;
    uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
    char v27 = (void *)v17;
    unint64_t v28 = OpaqueTypeConformance2;
    swift_getOpaqueTypeConformance2();
    uint64_t v21 = v25;
    sub_100032568();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v26 + 32))(a2, v21, v7);
  }
  swift_bridgeObjectRetain();
  uint64_t result = sub_1000329A8();
  uint64_t v10 = result;
  if (!result) {
    goto LABEL_14;
  }
LABEL_3:
  if (v10 >= 1)
  {
    uint64_t v22 = v5;
    uint64_t v23 = v7;
    uint64_t v24 = a2;
    for (uint64_t i = 0; i != v10; ++i)
    {
      if ((v9 & 0xC000000000000001) != 0)
      {
        uint64_t v13 = sub_100032908();
      }
      else
      {
        uint64_t v13 = *(void *)(v9 + 8 * i + 32);
        swift_retain();
      }
      if ((*(uint64_t (**)(void))(*(void *)v13 + 264))())
      {
        sub_100032938();
        sub_100032968();
        sub_100032978();
        sub_100032948();
      }
      else
      {
        swift_release();
      }
    }
    swift_bridgeObjectRelease();
    uint64_t v14 = v27;
    uint64_t v7 = v23;
    a2 = v24;
    uint64_t v5 = v22;
    goto LABEL_15;
  }
  __break(1u);
  return result;
}

unint64_t sub_10002808C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_100001DEC(&qword_100041E38);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  unint64_t v9 = &v40[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v10 = sub_100001DEC(&qword_100041F10);
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = &v40[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v14 = *a1;
  uint64_t v45 = *(void *)(a2 + 16);
  unint64_t v15 = *(void *)(v45 + 16);
  if (v15 >> 62)
  {
    swift_retain();
    swift_bridgeObjectRetain();
    uint64_t v16 = sub_1000329A8();
  }
  else
  {
    uint64_t v16 = *(void *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_retain();
    swift_bridgeObjectRetain();
  }
  uint64_t v52 = a3;
  uint64_t v51 = v6;
  uint64_t v50 = v7;
  uint64_t v49 = v10;
  uint64_t v48 = v9;
  uint64_t v47 = v11;
  uint64_t v46 = v13;
  uint64_t v44 = v14;
  if (!v16)
  {
    swift_bridgeObjectRelease();
    uint64_t v72 = v14;
    goto LABEL_12;
  }
  unint64_t result = v16 - 1;
  if (__OFSUB__(v16, 1))
  {
    __break(1u);
    goto LABEL_16;
  }
  if ((v15 & 0xC000000000000001) != 0)
  {
LABEL_16:
    uint64_t v18 = sub_100032908();
LABEL_9:
    swift_bridgeObjectRelease();
    uint64_t v72 = v14;
    if (v18)
    {
      uint64_t v53 = v18;
      type metadata accessor for ActivityGroup();
      sub_10002B78C((unint64_t *)&qword_100040E18, (void (*)(uint64_t))type metadata accessor for ActivityGroup);
      swift_retain();
      char v19 = sub_1000325F8();
      swift_release();
      swift_release();
      swift_release();
      char v20 = v19 ^ 1;
LABEL_13:
      uint64_t v21 = sub_10000BF40();
      uint64_t v23 = v22;
      uint64_t v24 = sub_10000C09C();
      sub_10000D4C0(v21, v23, v24, v25, v20 & 1, (uint64_t)v73);
      uint64_t v27 = v73[0];
      unint64_t v26 = v73[1];
      uint64_t v42 = v73[0];
      uint64_t v28 = v74;
      uint64_t v29 = v75;
      uint64_t v43 = v74;
      char v30 = v76;
      int v41 = v77;
      uint64_t v31 = v78;
      type metadata accessor for ActivityProvider();
      sub_10002B78C(&qword_100041290, (void (*)(uint64_t))type metadata accessor for ActivityProvider);
      uint64_t v32 = sub_100031BC8();
      type metadata accessor for ActivityGroup();
      sub_10002B78C(&qword_100041298, (void (*)(uint64_t))type metadata accessor for ActivityGroup);
      uint64_t v33 = v45;
      swift_retain();
      uint64_t v34 = sub_100031BC8();
      char v69 = 0;
      uint64_t v53 = v27;
      unint64_t v54 = v26;
      uint64_t v55 = v28;
      uint64_t v56 = v29;
      char v57 = v30;
      *(_DWORD *)uint64_t v58 = *(_DWORD *)v71;
      *(_DWORD *)&v58[3] = *(_DWORD *)&v71[3];
      char v59 = v41;
      *(_DWORD *)uint64_t v60 = *(_DWORD *)v70;
      *(_DWORD *)&v60[3] = *(_DWORD *)&v70[3];
      uint64_t v61 = v31;
      uint64_t v62 = v32;
      uint64_t v63 = v33;
      uint64_t v64 = v34;
      uint64_t v65 = v44;
      long long v66 = 0u;
      long long v67 = 0u;
      char v68 = 0;
      swift_retain();
      sub_100031D08();
      uint64_t v35 = sub_100001DEC(&qword_100041E40);
      unint64_t v36 = sub_10002AB50();
      uint64_t v37 = v48;
      sub_100032348();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      sub_100031D08();
      uint64_t v53 = v35;
      unint64_t v54 = v36;
      swift_getOpaqueTypeConformance2();
      uint64_t v38 = v46;
      uint64_t v39 = v51;
      sub_100032368();
      (*(void (**)(unsigned char *, uint64_t))(v50 + 8))(v37, v39);
      return (*(uint64_t (**)(uint64_t, unsigned char *, uint64_t))(v47 + 32))(v52, v38, v49);
    }
LABEL_12:
    swift_release();
    char v20 = 1;
    goto LABEL_13;
  }
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (result < *(void *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    uint64_t v18 = *(void *)(v15 + 8 * result + 32);
    swift_retain();
    goto LABEL_9;
  }
  __break(1u);
  return result;
}

uint64_t sub_100028650@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for ActivityPickerServiceEmbeddedView();
  uint64_t v28 = *(void *)(v4 - 8);
  uint64_t v5 = *(void *)(v28 + 64);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = sub_100001DEC(&qword_100041EE0);
  uint64_t v29 = *(void *)(v6 - 8);
  uint64_t v30 = v6;
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100001DEC(&qword_100041EE8);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = *(void *)(a1 + 56);
  long long v31 = *(_OWORD *)(a1 + 40);
  uint64_t v32 = v13;
  sub_100001DEC(&qword_100041880);
  sub_1000324A8();
  uint64_t v15 = v33;
  unint64_t v14 = v34;
  uint64_t v16 = swift_bridgeObjectRelease();
  uint64_t v17 = HIBYTE(v14) & 0xF;
  if ((v14 & 0x2000000000000000) == 0) {
    uint64_t v17 = v15 & 0xFFFFFFFFFFFFLL;
  }
  if (v17)
  {
    uint64_t v27 = a2;
    __chkstk_darwin(v16);
    *(&v26 - 2) = a1;
    sub_100001DEC(&qword_100041EF0);
    sub_10002B204();
    sub_100032278();
    sub_10002B464(a1, (uint64_t)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))type metadata accessor for ActivityPickerServiceEmbeddedView);
    unint64_t v18 = (*(unsigned __int8 *)(v28 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v28 + 80);
    uint64_t v19 = swift_allocObject();
    uint64_t v20 = v19 + v18;
    a2 = v27;
    sub_10002B00C((uint64_t)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v20);
    uint64_t v22 = v29;
    uint64_t v21 = v30;
    (*(void (**)(char *, char *, uint64_t))(v29 + 16))(v12, v8, v30);
    uint64_t v23 = &v12[*(int *)(v9 + 36)];
    *(void *)uint64_t v23 = 0;
    *((void *)v23 + 1) = 0;
    *((void *)v23 + 2) = sub_10002B2F8;
    *((void *)v23 + 3) = v19;
    (*(void (**)(char *, uint64_t))(v22 + 8))(v8, v21);
    sub_10000FEF8((uint64_t)v12, a2, &qword_100041EE8);
    uint64_t v24 = 0;
  }
  else
  {
    uint64_t v24 = 1;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 56))(a2, v24, 1, v9);
}

uint64_t sub_1000289A4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ActivityPickerServiceEmbeddedView();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  __chkstk_darwin(v2 - 8);
  v8[1] = sub_100028B50();
  swift_getKeyPath();
  sub_10002B464(a1, (uint64_t)v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))type metadata accessor for ActivityPickerServiceEmbeddedView);
  unint64_t v5 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v6 = swift_allocObject();
  sub_10002B00C((uint64_t)v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v6 + v5);
  sub_100001DEC(&qword_100040DE8);
  sub_100001DEC(&qword_100041F08);
  sub_100010310(&qword_1000414C8, &qword_100040DE8);
  sub_10002B278();
  return sub_100032568();
}

void *sub_100028B50()
{
  uint64_t v1 = *(void *)(v0 + 56);
  long long v17 = *(_OWORD *)(v0 + 40);
  uint64_t v18 = v1;
  sub_100001DEC(&qword_100041880);
  sub_1000324A8();
  swift_bridgeObjectRelease();
  uint64_t v2 = HIBYTE(v20) & 0xF;
  if ((v20 & 0x2000000000000000) == 0) {
    uint64_t v2 = v19 & 0xFFFFFFFFFFFFLL;
  }
  unint64_t result = _swiftEmptyArrayStorage;
  if (v2)
  {
    *(void *)&long long v17 = _swiftEmptyArrayStorage;
    unint64_t v4 = *(void *)(v0 + *(int *)(type metadata accessor for ActivityPickerServiceEmbeddedView() + 40));
    if (v4 >> 62)
    {
      swift_bridgeObjectRetain_n();
      unint64_t result = (void *)sub_1000329A8();
      uint64_t v5 = (uint64_t)result;
      if (result)
      {
LABEL_6:
        if (v5 < 1)
        {
          __break(1u);
        }
        else
        {
          uint64_t v6 = 0;
          do
          {
            if ((v4 & 0xC000000000000001) != 0)
            {
              uint64_t v7 = sub_100032908();
            }
            else
            {
              uint64_t v7 = *(void *)(v4 + 8 * v6 + 32);
              swift_retain();
            }
            ++v6;
            uint64_t v8 = (*(uint64_t (**)(void))(*(void *)v7 + 112))();
            uint64_t v9 = (*(uint64_t (**)(uint64_t))(*(void *)v8 + 184))(v8);
            uint64_t v11 = v10;
            uint64_t v12 = swift_release();
            uint64_t v13 = (*(uint64_t (**)(uint64_t))(*(void *)v7 + 160))(v12);
            __chkstk_darwin(v13);
            v16[2] = v0;
            v16[3] = v9;
            v16[4] = v11;
            uint64_t v15 = sub_100026A20((uint64_t (*)(uint64_t *))sub_100029C60, v16, v14);
            swift_bridgeObjectRelease();
            sub_100029A8C((unint64_t)v15);
            swift_release();
          }
          while (v5 != v6);
          swift_bridgeObjectRelease_n();
          return (void *)v17;
        }
        return result;
      }
    }
    else
    {
      uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
      unint64_t result = (void *)swift_bridgeObjectRetain_n();
      if (v5) {
        goto LABEL_6;
      }
    }
    swift_bridgeObjectRelease_n();
    return _swiftEmptyArrayStorage;
  }
  return result;
}

uint64_t sub_100028DB0@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 376))();
  *a2 = result;
  return result;
}

uint64_t sub_100028E04@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = type metadata accessor for ActivitySelectableRow(0);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)v33 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100001DEC(&qword_100041468);
  uint64_t v10 = v9 - 8;
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = *a1;
  sub_100032778();
  swift_retain();
  uint64_t v14 = sub_100032768();
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = v14;
  v15[3] = &protocol witness table for MainActor;
  v15[4] = v13;
  swift_retain();
  uint64_t v16 = sub_100032768();
  long long v17 = (void *)swift_allocObject();
  v17[2] = v16;
  v17[3] = &protocol witness table for MainActor;
  v17[4] = v13;
  sub_100032528();
  uint64_t v18 = v33[1];
  uint64_t v19 = v33[2];
  LOBYTE(v16) = v34;
  swift_retain();
  swift_retain();
  swift_retain();
  sub_10001E1C0(v18, v19, v16, 0, 1, 0, 1, (uint64_t)v8);
  uint64_t v20 = *(void *)(a2 + 16);
  type metadata accessor for ActivityProvider();
  sub_10002B78C(&qword_100041290, (void (*)(uint64_t))type metadata accessor for ActivityProvider);
  uint64_t v21 = sub_100031BC8();
  sub_10002B464((uint64_t)v8, (uint64_t)v12, type metadata accessor for ActivitySelectableRow);
  uint64_t v22 = (uint64_t *)&v12[*(int *)(v10 + 44)];
  *uint64_t v22 = v21;
  v22[1] = v20;
  swift_retain();
  sub_10002B4CC((uint64_t)v8, type metadata accessor for ActivitySelectableRow);
  LOBYTE(v21) = sub_100032218();
  sub_100031C68();
  uint64_t v24 = v23;
  uint64_t v26 = v25;
  uint64_t v28 = v27;
  uint64_t v30 = v29;
  sub_10002B52C((uint64_t)v12, a3);
  swift_release();
  swift_release();
  uint64_t v31 = a3 + *(int *)(sub_100001DEC(&qword_100041F08) + 36);
  *(unsigned char *)uint64_t v31 = v21;
  *(void *)(v31 + 8) = v24;
  *(void *)(v31 + 16) = v26;
  *(void *)(v31 + 24) = v28;
  *(void *)(v31 + 32) = v30;
  *(unsigned char *)(v31 + 40) = 0;
  return sub_10000B608((uint64_t)v12, &qword_100041468);
}

uint64_t sub_1000290F4()
{
  uint64_t v0 = sub_100031938();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = __chkstk_darwin(v0);
  unint64_t v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v8 - v5;
  sub_100031928();
  type metadata accessor for ActivityPickerServiceEmbeddedView();
  (*(void (**)(char *, char *, uint64_t))(v1 + 16))(v4, v6, v0);
  sub_100001DEC(&qword_100041C78);
  sub_1000324B8();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v6, v0);
}

uint64_t sub_100029228@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  v28[1] = a2;
  uint64_t v3 = type metadata accessor for ActivityPickerServiceEmbeddedView();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  uint64_t v6 = __chkstk_darwin(v3 - 8);
  uint64_t v7 = (char *)v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)v28 - v8;
  v28[0] = sub_100001DEC(&qword_100041EC0);
  uint64_t v10 = __chkstk_darwin(v28[0]);
  uint64_t v12 = (char *)v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)v28 - v13;
  uint64_t v15 = *(uint64_t (**)(uint64_t))(**(void **)(a1 + 8) + 104);
  uint64_t v16 = swift_retain();
  LOBYTE(v15) = v15(v16);
  swift_release();
  if (v15)
  {
    uint64_t v17 = sub_100001DEC(&qword_100041ED8);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v12, 1, 1, v17);
    unint64_t v18 = sub_10002AFB4();
    uint64_t v29 = &type metadata for ActivityPickerToolbar;
    unint64_t v30 = v18;
    swift_getOpaqueTypeConformance2();
    sub_100032108();
    sub_10000B608((uint64_t)v12, &qword_100041EC0);
  }
  else
  {
    sub_10002B464(a1, (uint64_t)v9, (uint64_t (*)(void))type metadata accessor for ActivityPickerServiceEmbeddedView);
    unint64_t v19 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
    uint64_t v20 = swift_allocObject();
    sub_10002B00C((uint64_t)v9, v20 + v19);
    sub_10002B464(a1, (uint64_t)v7, (uint64_t (*)(void))type metadata accessor for ActivityPickerServiceEmbeddedView);
    uint64_t v21 = swift_allocObject();
    sub_10002B00C((uint64_t)v7, v21 + v19);
    uint64_t v29 = (ValueMetadata *)nullsub_1(sub_10002B070, v20, sub_10002B16C, v21);
    unint64_t v30 = v22;
    uint64_t v31 = v23;
    uint64_t v32 = v24;
    unint64_t v25 = sub_10002AFB4();
    sub_1000320F8();
    uint64_t v26 = sub_100001DEC(&qword_100041ED8);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v12, 0, 1, v26);
    uint64_t v29 = &type metadata for ActivityPickerToolbar;
    unint64_t v30 = v25;
    swift_getOpaqueTypeConformance2();
    sub_100032108();
    sub_10000B608((uint64_t)v12, &qword_100041EC0);
    swift_release();
    swift_release();
  }
  sub_10002AF14();
  sub_1000320F8();
  return sub_10000B608((uint64_t)v14, &qword_100041EC0);
}

uint64_t sub_100029610(unsigned char **a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = type metadata accessor for ActivityPickerServiceEmbeddedView();
  uint64_t v9 = __chkstk_darwin(v8 - 8);
  uint64_t v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = *a1;
  uint64_t v24 = (*(uint64_t (**)(uint64_t))(*(void *)v12 + 184))(v9);
  uint64_t v25 = v13;
  uint64_t v14 = *(void *)(a2 + 56);
  long long v21 = *(_OWORD *)(a2 + 40);
  uint64_t v22 = v14;
  sub_100001DEC(&qword_100041880);
  sub_1000324A8();
  long long v21 = v23;
  sub_100011CA4();
  char v15 = sub_100032878();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10002B464(a2, (uint64_t)v11, (uint64_t (*)(void))type metadata accessor for ActivityPickerServiceEmbeddedView);
  if (v15)
  {
    sub_10002B4CC((uint64_t)v11, (uint64_t (*)(void))type metadata accessor for ActivityPickerServiceEmbeddedView);
  }
  else
  {
    uint64_t v24 = a3;
    uint64_t v25 = a4;
    uint64_t v16 = *((void *)v11 + 7);
    long long v21 = *(_OWORD *)(v11 + 40);
    uint64_t v22 = v16;
    sub_1000324A8();
    long long v21 = v23;
    char v17 = sub_100032878();
    swift_bridgeObjectRelease();
    sub_10002B4CC((uint64_t)v11, (uint64_t (*)(void))type metadata accessor for ActivityPickerServiceEmbeddedView);
    if ((v17 & 1) == 0) {
      goto LABEL_5;
    }
  }
  LOBYTE(v21) = v12[16];
  LOBYTE(v24) = 1;
  sub_10000B7C4();
  if ((sub_1000325F8() & 1) == 0)
  {
    char v18 = (*(uint64_t (**)(void))(*(void *)v12 + 232))();
    return v18 & 1;
  }
LABEL_5:
  char v18 = 0;
  return v18 & 1;
}

id sub_100029870()
{
  return *(id *)(v0 + 24);
}

uint64_t sub_100029878(uint64_t a1, void *a2)
{
  uint64_t v3 = v2;
  *(void *)(v3 + 16) = a1;
  *(void *)(v3 + 24) = a2;
  uint64_t v5 = *(void (**)(uint64_t, _UNKNOWN **))(*(void *)a1 + 104);
  swift_retain_n();
  id v6 = a2;
  uint64_t v7 = swift_retain();
  v5(v7, &off_10003E038);
  swift_release_n();

  return v3;
}

uint64_t sub_100029910()
{
  (*(void (**)(void))(**(void **)(v0 + 16) + 128))();
  (*(void (**)(void))((swift_isaMask & **(void **)(v0 + 24)) + 0xF0))();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1000299D0()
{
  swift_release();

  return v0;
}

uint64_t sub_1000299F8()
{
  swift_release();

  return _swift_deallocClassInstance(v0, 32, 7);
}

uint64_t sub_100029A38()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 104))();
}

uint64_t type metadata accessor for ActivityPickerServiceEmbeddedView.ActivityPickerServiceSelectionsObserver()
{
  return self;
}

uint64_t sub_100029A84@<X0>(uint64_t a1@<X8>)
{
  return sub_10002710C(*(void *)(v1 + 16), a1);
}

uint64_t sub_100029A8C(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_1000329A8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (!((unint64_t)*v1 >> 62))
  {
    uint64_t v4 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t v5 = v4 + v3;
    if (!__OFADD__(v4, v3)) {
      goto LABEL_5;
    }
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  swift_bridgeObjectRetain();
  uint64_t v14 = sub_1000329A8();
  swift_bridgeObjectRelease();
  uint64_t v5 = v14 + v3;
  if (__OFADD__(v14, v3)) {
    goto LABEL_21;
  }
LABEL_5:
  unint64_t v6 = *v1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *uint64_t v1 = v6;
  if (isUniquelyReferenced_nonNull_bridgeObject)
  {
    if ((v6 & 0x8000000000000000) == 0 && (v6 & 0x4000000000000000) == 0)
    {
      uint64_t v8 = v6 & 0xFFFFFFFFFFFFFF8;
      if (v5 <= *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        goto LABEL_11;
      }
    }
  }
  if (v6 >> 62) {
    goto LABEL_23;
  }
  while (1)
  {
    swift_bridgeObjectRetain();
    *uint64_t v1 = sub_100032918();
    swift_bridgeObjectRelease();
    uint64_t v8 = *v1 & 0xFFFFFFFFFFFFFF8;
LABEL_11:
    uint64_t result = sub_10000628C(v8 + 8 * *(void *)(v8 + 16) + 32, (*(void *)(v8 + 24) >> 1) - *(void *)(v8 + 16), a1);
    if (v10 >= v3) {
      break;
    }
LABEL_22:
    __break(1u);
LABEL_23:
    swift_bridgeObjectRetain();
    sub_1000329A8();
    swift_bridgeObjectRelease();
  }
  if (v10 >= 1)
  {
    uint64_t v11 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    BOOL v12 = __OFADD__(v11, v10);
    uint64_t v13 = v11 + v10;
    if (v12)
    {
      __break(1u);
      return result;
    }
    *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v13;
  }
  swift_bridgeObjectRelease();

  return sub_100032728();
}

uint64_t sub_100029C60(unsigned char **a1)
{
  return sub_100029610(a1, v1[2], v1[3], v1[4]) & 1;
}

uint64_t sub_100029C94()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100029CB0()
{
  return swift_getOpaqueTypeConformance2();
}

void destroy for ActivityPickerServiceView(uint64_t a1)
{
  swift_release();
  swift_release();
  uint64_t v2 = *(void **)(a1 + 24);
}

void *initializeWithCopy for ActivityPickerServiceView(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = (void *)a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_retain();
  swift_retain();
  id v5 = v4;
  return a1;
}

void *assignWithCopy for ActivityPickerServiceView(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  a1[2] = a2[2];
  swift_retain();
  swift_release();
  uint64_t v4 = (void *)a2[3];
  id v5 = (void *)a1[3];
  a1[3] = v4;
  id v6 = v4;

  return a1;
}

uint64_t assignWithTake for ActivityPickerServiceView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_release();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_release();
  uint64_t v4 = *(void **)(a1 + 24);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);

  return a1;
}

uint64_t getEnumTagSinglePayload for ActivityPickerServiceView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ActivityPickerServiceView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)uint64_t result = a2 ^ 0x80000000;
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ActivityPickerServiceView()
{
  return &type metadata for ActivityPickerServiceView;
}

uint64_t *sub_100029EC8(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v16 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v16 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    uint64_t v8 = a2[3];
    a1[2] = a2[2];
    a1[3] = v8;
    uint64_t v10 = (void *)a2[4];
    uint64_t v9 = a2[5];
    a1[4] = (uint64_t)v10;
    a1[5] = v9;
    uint64_t v11 = a2[7];
    uint64_t v12 = *(int *)(a3 + 36);
    unint64_t v19 = (char *)a2 + v12;
    uint64_t v20 = (char *)a1 + v12;
    a1[6] = a2[6];
    a1[7] = v11;
    uint64_t v13 = sub_100031938();
    char v18 = *(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 16);
    swift_retain();
    swift_retain();
    swift_retain();
    id v14 = v10;
    swift_bridgeObjectRetain();
    swift_retain();
    v18(v20, v19, v13);
    uint64_t v15 = sub_100001DEC(&qword_100041C78);
    *(void *)&v20[*(int *)(v15 + 28)] = *(void *)&v19[*(int *)(v15 + 28)];
    *(uint64_t *)((char *)v4 + *(int *)(a3 + 40)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 40));
    swift_retain();
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t sub_10002A040(uint64_t a1, uint64_t a2)
{
  swift_release();
  swift_release();
  swift_release();

  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v4 = a1 + *(int *)(a2 + 36);
  uint64_t v5 = sub_100031938();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  sub_100001DEC(&qword_100041C78);
  swift_release();

  return swift_bridgeObjectRelease();
}

void *sub_10002A10C(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = a2[1];
  *a1 = *a2;
  a1[1] = v5;
  uint64_t v6 = a2[3];
  a1[2] = a2[2];
  a1[3] = v6;
  uint64_t v8 = (void *)a2[4];
  uint64_t v7 = a2[5];
  a1[4] = v8;
  a1[5] = v7;
  uint64_t v9 = a2[7];
  uint64_t v10 = *(int *)(a3 + 36);
  char v17 = (char *)a1 + v10;
  uint64_t v11 = (char *)a2 + v10;
  a1[6] = a2[6];
  a1[7] = v9;
  uint64_t v12 = sub_100031938();
  uint64_t v16 = *(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16);
  swift_retain();
  swift_retain();
  swift_retain();
  id v13 = v8;
  swift_bridgeObjectRetain();
  swift_retain();
  v16(v17, v11, v12);
  uint64_t v14 = sub_100001DEC(&qword_100041C78);
  *(void *)&v17[*(int *)(v14 + 28)] = *(void *)&v11[*(int *)(v14 + 28)];
  *(void *)((char *)a1 + *(int *)(a3 + 40)) = *(void *)((char *)a2 + *(int *)(a3 + 40));
  swift_retain();
  swift_bridgeObjectRetain();
  return a1;
}

void *sub_10002A234(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  a1[2] = a2[2];
  swift_retain();
  swift_release();
  a1[3] = a2[3];
  swift_retain();
  swift_release();
  uint64_t v6 = (void *)a2[4];
  uint64_t v7 = (void *)a1[4];
  a1[4] = v6;
  id v8 = v6;

  a1[5] = a2[5];
  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[7] = a2[7];
  swift_retain();
  swift_release();
  uint64_t v9 = *(int *)(a3 + 36);
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  uint64_t v12 = sub_100031938();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 24))(v10, v11, v12);
  uint64_t v13 = sub_100001DEC(&qword_100041C78);
  *(void *)&v10[*(int *)(v13 + 28)] = *(void *)&v11[*(int *)(v13 + 28)];
  swift_retain();
  swift_release();
  *(void *)((char *)a1 + *(int *)(a3 + 40)) = *(void *)((char *)a2 + *(int *)(a3 + 40));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_10002A398(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  uint64_t v7 = *(int *)(a3 + 36);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_100031938();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  uint64_t v11 = sub_100001DEC(&qword_100041C78);
  *(void *)(v8 + *(int *)(v11 + 28)) = *(void *)(v9 + *(int *)(v11 + 28));
  *(void *)(a1 + *(int *)(a3 + 40)) = *(void *)(a2 + *(int *)(a3 + 40));
  return a1;
}

void *sub_10002A460(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_release();
  a1[2] = a2[2];
  swift_release();
  a1[3] = a2[3];
  swift_release();
  uint64_t v7 = (void *)a1[4];
  a1[4] = a2[4];

  uint64_t v8 = a2[6];
  a1[5] = a2[5];
  a1[6] = v8;
  swift_bridgeObjectRelease();
  a1[7] = a2[7];
  swift_release();
  uint64_t v9 = *(int *)(a3 + 36);
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  uint64_t v12 = sub_100031938();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 40))(v10, v11, v12);
  uint64_t v13 = sub_100001DEC(&qword_100041C78);
  *(void *)&v10[*(int *)(v13 + 28)] = *(void *)&v11[*(int *)(v13 + 28)];
  swift_release();
  *(void *)((char *)a1 + *(int *)(a3 + 40)) = *(void *)((char *)a2 + *(int *)(a3 + 40));
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_10002A578(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10002A58C);
}

uint64_t sub_10002A58C(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_100001DEC(&qword_100041C78);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 36);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_10002A640(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10002A654);
}

uint64_t sub_10002A654(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_100001DEC(&qword_100041C78);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 36);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

void sub_10002A700()
{
  sub_10002A7D4();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_10002A7D4()
{
  if (!qword_100041CD8)
  {
    sub_100031938();
    unint64_t v0 = sub_1000324D8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100041CD8);
    }
  }
}

uint64_t sub_10002A82C()
{
  return sub_10002B78C(&qword_100041DD0, (void (*)(uint64_t))type metadata accessor for ActivityPickerServiceEmbeddedView);
}

uint64_t sub_10002A874()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10002A978@<X0>(uint64_t a1@<X8>)
{
  return sub_10002798C(*(void *)(v1 + 16), a1);
}

unint64_t sub_10002A980()
{
  unint64_t result = qword_100041E10;
  if (!qword_100041E10)
  {
    sub_100006B14(&qword_100041E08);
    sub_10002AA00();
    sub_10002AA6C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041E10);
  }
  return result;
}

unint64_t sub_10002AA00()
{
  unint64_t result = qword_100041E18;
  if (!qword_100041E18)
  {
    sub_100006B14(&qword_100041E20);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041E18);
  }
  return result;
}

unint64_t sub_10002AA6C()
{
  unint64_t result = qword_100041E28;
  if (!qword_100041E28)
  {
    sub_100006B14(&qword_100041E30);
    sub_100006B14(&qword_100041E38);
    sub_100006B14(&qword_100041E40);
    sub_10002AB50();
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041E28);
  }
  return result;
}

unint64_t sub_10002AB50()
{
  unint64_t result = qword_100041E48;
  if (!qword_100041E48)
  {
    sub_100006B14(&qword_100041E40);
    sub_10002ABF0();
    sub_100010310(&qword_100041E88, &qword_100041E90);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041E48);
  }
  return result;
}

unint64_t sub_10002ABF0()
{
  unint64_t result = qword_100041E50;
  if (!qword_100041E50)
  {
    sub_100006B14(&qword_100041E58);
    sub_10002AC90();
    sub_100010310(&qword_100041E78, &qword_100041E80);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041E50);
  }
  return result;
}

unint64_t sub_10002AC90()
{
  unint64_t result = qword_100041E60;
  if (!qword_100041E60)
  {
    sub_100006B14(&qword_100041E68);
    sub_10002AD30();
    sub_100010310(&qword_100041480, &qword_100041488);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041E60);
  }
  return result;
}

unint64_t sub_10002AD30()
{
  unint64_t result = qword_100041E70;
  if (!qword_100041E70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041E70);
  }
  return result;
}

uint64_t sub_10002AD84@<X0>(uint64_t a1@<X8>)
{
  return sub_100029228(*(void *)(v1 + 16), a1);
}

unint64_t sub_10002AD8C()
{
  unint64_t result = qword_100041EB0;
  if (!qword_100041EB0)
  {
    sub_100006B14(&qword_100041DF8);
    sub_100006B14(&qword_100041DE8);
    sub_100006B14(&qword_100041DE0);
    sub_100006B14(&qword_100041DD8);
    sub_1000320D8();
    sub_100010310(&qword_100041E98, &qword_100041DD8);
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    sub_100010310(&qword_100041EB8, &qword_100041EA0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041EB0);
  }
  return result;
}

unint64_t sub_10002AF14()
{
  unint64_t result = qword_100041EC8;
  if (!qword_100041EC8)
  {
    sub_100006B14(&qword_100041EC0);
    sub_10002AFB4();
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041EC8);
  }
  return result;
}

unint64_t sub_10002AFB4()
{
  unint64_t result = qword_100041ED0;
  if (!qword_100041ED0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041ED0);
  }
  return result;
}

uint64_t sub_10002B00C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ActivityPickerServiceEmbeddedView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10002B070()
{
  uint64_t v1 = *(void *)(type metadata accessor for ActivityPickerServiceEmbeddedView() - 8);
  uint64_t v2 = v0 + ((*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));
  (*(void (**)(void))(**(void **)(v2 + 16) + 128))();
  (*(void (**)(void))((swift_isaMask & **(void **)(v2 + 32)) + 0xF0))();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t sub_10002B16C()
{
  uint64_t v1 = *(void *)(type metadata accessor for ActivityPickerServiceEmbeddedView() - 8);
  return (*(uint64_t (**)(void))((swift_isaMask & **(void **)(v0
                                                             + ((*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80))
                                                             + 32))
                              + 0xF8))();
}

uint64_t sub_10002B1FC()
{
  return sub_1000289A4(*(void *)(v0 + 16));
}

unint64_t sub_10002B204()
{
  unint64_t result = qword_100041EF8;
  if (!qword_100041EF8)
  {
    sub_100006B14(&qword_100041EF0);
    sub_10002B278();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041EF8);
  }
  return result;
}

unint64_t sub_10002B278()
{
  unint64_t result = qword_100041F00;
  if (!qword_100041F00)
  {
    sub_100006B14(&qword_100041F08);
    sub_10000FD60();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041F00);
  }
  return result;
}

uint64_t sub_10002B2F8()
{
  type metadata accessor for ActivityPickerServiceEmbeddedView();

  return sub_1000290F4();
}

uint64_t sub_10002B35C(uint64_t a1)
{
  return sub_10002B6F8(a1, (uint64_t (*)(uint64_t, uint64_t))sub_100028E04);
}

uint64_t sub_10002B378@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)(v1 + 32) + 328))();
  *a1 = result & 1;
  return result;
}

uint64_t sub_10002B3D4()
{
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10002B414(unsigned __int8 *a1)
{
  return (*(uint64_t (**)(void))(**(void **)(v1 + 32) + 336))(*a1);
}

uint64_t sub_10002B464(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10002B4CC(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10002B52C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100001DEC(&qword_100041468);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10002B594@<X0>(uint64_t a1@<X8>)
{
  return sub_100027C58(*(void *)(v1 + 16), a1);
}

uint64_t sub_10002B5A0()
{
  uint64_t v1 = (int *)(type metadata accessor for ActivityPickerServiceEmbeddedView() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v3 + *(void *)(*(void *)v1 + 64);
  uint64_t v5 = v2 | 7;
  uint64_t v6 = v0 + v3;
  swift_release();
  swift_release();
  swift_release();

  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v7 = v6 + v1[11];
  uint64_t v8 = sub_100031938();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  sub_100001DEC(&qword_100041C78);
  swift_release();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, v4, v5);
}

uint64_t sub_10002B6E0(uint64_t a1)
{
  return sub_10002B6F8(a1, (uint64_t (*)(uint64_t, uint64_t))sub_10002808C);
}

uint64_t sub_10002B6F8(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t))
{
  uint64_t v4 = *(void *)(type metadata accessor for ActivityPickerServiceEmbeddedView() - 8);
  uint64_t v5 = v2 + ((*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));

  return a2(a1, v5);
}

uint64_t sub_10002B78C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10002B7D4()
{
  swift_beginAccess();
  return *(unsigned __int8 *)(v0 + 16);
}

uint64_t sub_10002B808(char a1)
{
  uint64_t result = swift_beginAccess();
  *(unsigned char *)(v1 + 16) = a1;
  return result;
}

uint64_t sub_10002B848()
{
  uint64_t result = swift_beginAccess();
  *(unsigned char *)(v0 + 16) = 1;
  return result;
}

uint64_t sub_10002B888()
{
  return v0;
}

uint64_t sub_10002B890()
{
  return _swift_deallocClassInstance(v0, 17, 7);
}

uint64_t sub_10002B8A0()
{
  uint64_t result = swift_allocObject();
  *(unsigned char *)(result + 16) = 0;
  return result;
}

uint64_t sub_10002B8C8()
{
  uint64_t result = v0;
  *(unsigned char *)(v0 + 16) = 0;
  return result;
}

uint64_t sub_10002B8D4()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 112))();
}

id sub_10002B918(void *a1)
{
  id result = [a1 CGImage];
  if (result)
  {
    [a1 scale];
    uint64_t v3 = sub_100032438();

    return (id)v3;
  }
  else
  {
    __break(1u);
  }
  return result;
}

double variable initialization expression of ApplicationIcon.deviceScale()
{
  id v0 = [self mainScreen];
  [v0 scale];
  double v2 = v1;

  return v2;
}

uint64_t ApplicationIcon.init<>(icon:descriptor:)(void *a1, uint64_t a2)
{
  *(void *)(swift_allocObject() + 16) = a1;
  uint64_t v4 = self;
  id v5 = a1;
  id v6 = [v4 mainScreen];
  [v6 scale];

  return a2;
}

__n128 sub_10002BA9C@<Q0>(void *a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = a1;
  id v7 = objc_allocWithZone((Class)ISImageDescriptor);
  id v8 = a1;
  id v9 = a2;
  [v7 init];
  sub_100001DEC(&qword_1000420B8);
  sub_100032498();
  __n128 result = v13;
  *(void *)a3 = v9;
  *(void *)(a3 + 8) = v8;
  *(void *)(a3 + 16) = 0;
  *(void *)(a3 + 24) = sub_100030AA0;
  *(void *)(a3 + 32) = v6;
  *(void *)(a3 + 40) = v11;
  *(void *)(a3 + 48) = v12;
  *(__n128 *)(a3 + 56) = v13;
  *(void *)(a3 + 72) = v14;
  return result;
}

uint64_t sub_10002BB8C()
{
  return _swift_deallocObject(v0, 24, 7);
}

double sub_10002BBC4@<D0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)&double result = sub_10002BA9C(a1, (void *)*(void *)(v2 + 16), a2).n128_u64[0];
  return result;
}

id sub_10002BBCC@<X0>(unint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v6 = sub_100032458();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  id v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a1 >> 62) <= 1)
  {
    (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, enum case for Image.ResizingMode.stretch(_:), v6);
    sub_10002F4C0(a1);
    uint64_t v10 = sub_100032478();
    sub_10002D328(a1);
LABEL_8:
    id result = (id)(*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    *a3 = v10;
    return result;
  }
  id v11 = [self genericApplicationIcon];
  id v12 = [v11 prepareImageForDescriptor:a2];

  if (!v12)
  {
    sub_100032488();
    (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, enum case for Image.ResizingMode.stretch(_:), v6);
    uint64_t v10 = sub_100032478();
    goto LABEL_7;
  }
  id v13 = v12;
  id result = [v13 CGImage];
  if (result)
  {
    [v13 scale];
    sub_100032438();

    (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, enum case for Image.ResizingMode.stretch(_:), v6);
    uint64_t v10 = sub_100032478();

LABEL_7:
    swift_release();
    goto LABEL_8;
  }
  __break(1u);
  return result;
}

uint64_t ApplicationIconPhase.image.getter(unint64_t a1)
{
  if ((a1 >> 62) > 1) {
    return 0;
  }
  else {
    return swift_retain();
  }
}

__n128 sub_10002BEA4@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  [objc_allocWithZone((Class)ISImageDescriptor) init];
  type metadata accessor for ResolvedApplicationIcon.LoadingState();
  sub_100032498();
  __n128 result = v15;
  *(void *)a6 = a1;
  *(void *)(a6 + 8) = a2;
  *(void *)(a6 + 16) = a3;
  *(void *)(a6 + 24) = a4;
  *(void *)(a6 + 32) = a5;
  *(void *)(a6 + 40) = v13;
  *(void *)(a6 + 48) = v14;
  *(__n128 *)(a6 + 56) = v15;
  *(void *)(a6 + 72) = v16;
  return result;
}

uint64_t sub_10002BF6C(uint64_t a1)
{
  id v2 = [self mainScreen];
  [v2 scale];

  return a1;
}

uint64_t ApplicationIcon.init<A, B>(icon:descriptor:content:fallback:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  char v17 = (void *)swift_allocObject();
  v17[2] = a7;
  v17[3] = a8;
  v17[4] = a9;
  v17[5] = a10;
  v17[6] = a1;
  v17[7] = a3;
  v17[8] = a4;
  v17[9] = a5;
  v17[10] = a6;
  sub_100032068();
  swift_getWitnessTable();

  return sub_10002BF6C(a2);
}

uint64_t sub_10002C0E0()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 88, 7);
}

__n128 sub_10002C128@<Q0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = *(void *)(v2 + 16);
  uint64_t v5 = *(void *)(v2 + 24);
  uint64_t v6 = *(void *)(v2 + 32);
  uint64_t v7 = *(void *)(v2 + 40);
  id v9 = *(void **)(v2 + 48);
  uint64_t v8 = *(void *)(v2 + 56);
  uint64_t v10 = *(void *)(v2 + 80);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v4;
  *(void *)(v11 + 24) = v5;
  *(void *)(v11 + 32) = v6;
  *(void *)(v11 + 40) = v7;
  *(void *)(v11 + 48) = v8;
  *(_OWORD *)(v11 + 56) = *(_OWORD *)(v2 + 64);
  *(void *)(v11 + 72) = v10;
  sub_100032068();
  id v12 = v9;
  id v13 = a1;
  swift_retain();
  swift_retain();
  swift_getWitnessTable();
  sub_10002BEA4((uint64_t)v12, (uint64_t)v13, 0, (uint64_t)sub_100030A6C, v11, (uint64_t)v17);
  long long v14 = v17[3];
  *(_OWORD *)(a2 + 32) = v17[2];
  *(_OWORD *)(a2 + 48) = v14;
  *(_OWORD *)(a2 + 64) = v17[4];
  __n128 result = (__n128)v17[1];
  *(_OWORD *)a2 = v17[0];
  *(__n128 *)(a2 + 16) = result;
  return result;
}

uint64_t sub_10002C264@<X0>(unint64_t a1@<X0>, void (*a2)(uint64_t)@<X1>, uint64_t a3@<X2>, void (*a4)(uint64_t)@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10)
{
  uint64_t v57 = a8;
  uint64_t v58 = a9;
  uint64_t v47 = a5;
  uint64_t v48 = a4;
  uint64_t v49 = a3;
  uint64_t v50 = a2;
  uint64_t v52 = *(void *)(a6 - 8);
  uint64_t v56 = a10;
  uint64_t v13 = __chkstk_darwin(a1);
  __n128 v15 = (char *)&v45 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  uint64_t v51 = (char *)&v45 - v16;
  uint64_t v17 = sub_100032458();
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = __chkstk_darwin(v17);
  long long v21 = (char *)&v45 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v46 = *(void *)(a7 - 8);
  uint64_t v22 = __chkstk_darwin(v19);
  uint64_t v24 = (char *)&v45 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v22);
  uint64_t v26 = (char *)&v45 - v25;
  uint64_t v55 = a7;
  uint64_t v27 = sub_100032068();
  uint64_t v53 = *(void *)(v27 - 8);
  uint64_t v54 = v27;
  uint64_t v28 = __chkstk_darwin(v27);
  unint64_t v30 = (char *)&v45 - v29;
  if ((a1 >> 62) > 1)
  {
    v48(v28);
    uint64_t v38 = v46;
    uint64_t v39 = *(void (**)(char *, char *, uint64_t))(v46 + 16);
    uint64_t v40 = v55;
    v39(v26, v24, v55);
    int v41 = *(void (**)(char *, uint64_t))(v38 + 8);
    v41(v24, v40);
    v39(v24, v26, v40);
    uint64_t v36 = v56;
    uint64_t v37 = v57;
    sub_10002C828((uint64_t)v24, a6, v40);
    v41(v24, v40);
    v41(v26, v40);
  }
  else
  {
    (*(void (**)(char *, void, uint64_t))(v18 + 104))(v21, enum case for Image.ResizingMode.stretch(_:), v17);
    sub_10002F4C0(a1);
    uint64_t v31 = sub_100032478();
    sub_10002D328(a1);
    (*(void (**)(char *, uint64_t))(v18 + 8))(v21, v17);
    v50(v31);
    uint64_t v33 = v51;
    uint64_t v32 = v52;
    char v34 = *(void (**)(char *, char *, uint64_t))(v52 + 16);
    v34(v51, v15, a6);
    uint64_t v35 = *(void (**)(char *, uint64_t))(v32 + 8);
    v35(v15, a6);
    v34(v15, v33, a6);
    uint64_t v36 = v56;
    uint64_t v37 = v57;
    sub_10002C730((uint64_t)v15, a6);
    swift_release();
    v35(v15, a6);
    v35(v33, a6);
  }
  uint64_t v59 = v37;
  uint64_t v60 = v36;
  uint64_t v42 = v54;
  swift_getWitnessTable();
  uint64_t v43 = v53;
  (*(void (**)(uint64_t, char *, uint64_t))(v53 + 16))(v58, v30, v42);
  return (*(uint64_t (**)(char *, uint64_t))(v43 + 8))(v30, v42);
}

uint64_t sub_10002C730(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100032048();
  __chkstk_darwin(v4);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(a2 - 8) + 16))((char *)&v7 - v5, a1, a2);
  swift_storeEnumTagMultiPayload();
  return sub_100032058();
}

uint64_t sub_10002C828(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_100032048();
  __chkstk_darwin(v5);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(a3 - 8) + 16))((char *)&v8 - v6, a1, a3);
  swift_storeEnumTagMultiPayload();
  return sub_100032058();
}

uint64_t ApplicationIcon.init(icon:descriptor:transaction:content:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v14 = (void *)swift_allocObject();
  void v14[2] = a6;
  v14[3] = a7;
  v14[4] = a1;
  v14[5] = a3;
  v14[6] = a4;
  v14[7] = a5;

  return sub_10002BF6C(a2);
}

__n128 sub_10002C9BC@<Q0>(void *a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  id v12 = objc_allocWithZone((Class)ISImageDescriptor);
  swift_retain();
  swift_retain();
  id v13 = a2;
  id v14 = a1;
  [v12 init];
  sub_100001DEC(&qword_1000420B0);
  sub_100032498();
  __n128 result = v18;
  *(void *)a6 = v13;
  *(void *)(a6 + 8) = v14;
  *(void *)(a6 + 16) = a3;
  *(void *)(a6 + 24) = a4;
  *(void *)(a6 + 32) = a5;
  *(void *)(a6 + 40) = v16;
  *(void *)(a6 + 48) = v17;
  *(__n128 *)(a6 + 56) = v18;
  *(void *)(a6 + 72) = v19;
  return result;
}

uint64_t sub_10002CAA4()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 64, 7);
}

__n128 sub_10002CAEC@<Q0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v6 = (void *)v2[4];
  uint64_t v5 = v2[5];
  uint64_t v8 = v2[6];
  uint64_t v7 = v2[7];
  swift_retain();
  swift_retain();
  sub_10002BEA4((uint64_t)v6, (uint64_t)a1, v5, v8, v7, (uint64_t)v11);
  long long v9 = v11[3];
  *(_OWORD *)(a2 + 32) = v11[2];
  *(_OWORD *)(a2 + 48) = v9;
  *(_OWORD *)(a2 + 64) = v11[4];
  __n128 result = (__n128)v11[1];
  *(_OWORD *)a2 = v11[0];
  *(__n128 *)(a2 + 16) = result;
  return result;
}

uint64_t ApplicationIcon.body.getter@<X0>(void *a1@<X0>, void (*a2)(_OWORD *__return_ptr)@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>, double a7@<D0>)
{
  if (a1)
  {
    id v38 = a1;
    a2(v70);
    long long v66 = v70[2];
    long long v67 = v70[3];
    long long v68 = v70[4];
    long long v64 = v70[0];
    long long v65 = v70[1];
    uint64_t v11 = type metadata accessor for ResolvedApplicationIcon();
    swift_getWitnessTable();
    id v12 = *(void (**)(long long *, long long *, uint64_t))(*(void *)(v11 - 8) + 16);
    v12(v58, &v64, v11);
    sub_10002D358((uint64_t)v70);
    uint64_t v32 = (void *)*((void *)&v58[0] + 1);
    uint64_t v33 = *(void **)&v58[0];
    char v34 = (void *)*((void *)&v59 + 1);
    uint64_t v31 = (void *)v60;
    unint64_t v36 = v61;
    long long v64 = v58[0];
    long long v65 = v58[1];
    long long v66 = v59;
    long long v67 = v60;
    long long v68 = v61;
    v12(&v49, &v64, v11);
    long long v13 = v49;
    id v14 = v53;
    __n128 v15 = v54;
    unint64_t v30 = v56;
    long long v40 = v49;
    uint64_t v41 = v50;
    uint64_t v42 = v51;
    uint64_t v43 = v52;
    uint64_t v44 = v53;
    uint64_t v45 = v54;
    uint64_t v46 = v55;
    unint64_t v47 = v56;
    uint64_t v48 = v57;
    sub_100031D68();
    swift_getWitnessTable();
    sub_10002C730((uint64_t)&v40, v11);

    swift_release();
    swift_release();

    swift_release();
    sub_10002D328(v30);

    swift_release();
    swift_release();
    swift_release();

    swift_release();
    sub_10002D328(v36);
  }
  else
  {
    uint64_t v17 = swift_allocObject();
    *(void *)(v17 + 16) = a4;
    *(void *)(v17 + 24) = a5;
    *(double *)(v17 + 32) = a7;
    *(void *)(v17 + 40) = 0;
    *(void *)(v17 + 48) = a2;
    *(void *)(v17 + 56) = a3;
    uint64_t v18 = type metadata accessor for ResolvedApplicationIcon();
    swift_retain();
    swift_getWitnessTable();
    *(void *)&long long v64 = sub_100031D58();
    *((void *)&v64 + 1) = v19;
    uint64_t v20 = sub_100031D68();
    swift_getWitnessTable();
    long long v21 = *(void (**)(_OWORD *, long long *, uint64_t))(*(void *)(v20 - 8) + 16);
    v21(v70, &v64, v20);
    swift_release();
    long long v64 = v70[0];
    v21(v58, &v64, v20);
    long long v49 = v58[0];
    sub_10002C828((uint64_t)&v49, v18, v20);
    swift_release();
  }
  swift_release();
  long long v22 = v64;
  long long v23 = v65;
  long long v24 = v68;
  char v25 = v69;
  long long v35 = v66;
  long long v37 = v67;
  type metadata accessor for ResolvedApplicationIcon();
  uint64_t WitnessTable = swift_getWitnessTable();
  sub_100031D68();
  uint64_t v27 = sub_100032068();
  uint64_t v28 = swift_getWitnessTable();
  uint64_t v62 = WitnessTable;
  uint64_t v63 = v28;
  swift_getWitnessTable();
  (*(void (**)(uint64_t, long long *, uint64_t))(*(void *)(v27 - 8) + 16))(a6, &v64, v27);
  return sub_10002D288((void *)v22, *((void **)&v22 + 1), v23, *((uint64_t *)&v23 + 1), v35, *((void **)&v35 + 1), (void *)v37, *((uint64_t *)&v37 + 1), v24, *((uint64_t *)&v24 + 1), v25);
}

uint64_t sub_10002D074()
{
  swift_release();

  return _swift_deallocObject(v0, 64, 7);
}

uint64_t sub_10002D0B4@<X0>(_OWORD *a1@<X8>)
{
  void (*v3)(_OWORD *__return_ptr);
  double v4;
  double v5;
  id v6;
  uint64_t v7;
  void (*v8)(_OWORD *, long long *, uint64_t);
  long long v9;
  void *v10;
  void *v11;
  unint64_t v13;
  long long v15;
  long long v16;
  long long v17;
  long long v18;
  long long v19;
  _OWORD v20[2];
  long long v21;
  long long v22;
  long long v23;
  _OWORD v24[5];

  double v2 = *(double *)(v1 + 32);
  uint64_t v3 = *(void (**)(_OWORD *__return_ptr))(v1 + 48);
  sub_100031D38();
  uint64_t v6 = objc_msgSend(objc_allocWithZone((Class)ISImageDescriptor), "initWithSize:scale:", v4, v5, v2);
  v3(v24);

  uint64_t v17 = v24[2];
  uint64_t v18 = v24[3];
  uint64_t v19 = v24[4];
  __n128 v15 = v24[0];
  uint64_t v16 = v24[1];
  uint64_t v7 = type metadata accessor for ResolvedApplicationIcon();
  swift_getWitnessTable();
  uint64_t v8 = *(void (**)(_OWORD *, long long *, uint64_t))(*(void *)(v7 - 8) + 16);
  v8(v20, &v15, v7);
  sub_10002D358((uint64_t)v24);
  long long v9 = v20[0];
  uint64_t v10 = (void *)*((void *)&v21 + 1);
  uint64_t v11 = (void *)v22;
  long long v13 = v23;
  __n128 v15 = v20[0];
  uint64_t v16 = v20[1];
  uint64_t v17 = v21;
  uint64_t v18 = v22;
  uint64_t v19 = v23;
  v8(a1, &v15, v7);

  swift_release();
  swift_release();

  swift_release();
  sub_10002D328(v13);
  return swift_release();
}

uint64_t type metadata accessor for ResolvedApplicationIcon()
{
  return sub_100030AA8();
}

uint64_t sub_10002D288(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, void *a7, uint64_t a8, unint64_t a9, uint64_t a10, char a11)
{
  if ((a11 & 1) == 0)
  {

    swift_release();
    swift_release();

    swift_release();
    sub_10002D328(a9);
  }

  return swift_release();
}

unint64_t sub_10002D328(unint64_t result)
{
  if (result >> 62 == 2) {
    return swift_errorRelease();
  }
  if ((result >> 62) <= 1) {
    return swift_release();
  }
  return result;
}

uint64_t sub_10002D358(uint64_t a1)
{
  double v2 = *(void **)a1;
  uint64_t v3 = *(void **)(a1 + 8);
  uint64_t v4 = *(void **)(a1 + 40);
  unint64_t v5 = *(void *)(a1 + 64);

  swift_release();
  swift_release();

  swift_release();
  sub_10002D328(v5);
  swift_release();
  return a1;
}

uint64_t sub_10002D3E8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return ApplicationIcon.body.getter(*(void **)(v2 + 8), *(void (**)(_OWORD *__return_ptr))(v2 + 16), *(void *)(v2 + 24), *(void *)(a1 + 16), *(void *)(a1 + 24), a2, *(double *)v2);
}

uint64_t ApplicationIconPhase.error.getter(unint64_t a1)
{
  if (a1 >> 62 != 2) {
    return 0;
  }
  uint64_t v1 = a1 & 0x3FFFFFFFFFFFFFFFLL;
  swift_errorRetain();
  return v1;
}

void sub_10002D440(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = (_OWORD *)v3;
  long long v7 = *(_OWORD *)(v3 + 56);
  long long v41 = *(_OWORD *)(v3 + 40);
  long long v42 = v7;
  uint64_t v43 = *(void (**)(void *))(v3 + 72);
  long long v8 = *(_OWORD *)(v3 + 56);
  long long aBlock = *(_OWORD *)(v3 + 40);
  long long v32 = v8;
  uint64_t v33 = *(void (**)(void *))(v3 + 72);
  uint64_t v10 = *(void *)(a3 + 16);
  uint64_t v9 = *(void *)(a3 + 24);
  type metadata accessor for ResolvedApplicationIcon.LoadingState();
  sub_1000324D8();
  sub_1000324A8();

  swift_release();
  sub_10002D328(*((unint64_t *)&v46 + 1));
  if (!(void)v45) {
    goto LABEL_4;
  }
  sub_100030568(0, &qword_100042050);
  id v11 = a1;
  id v12 = (id)v45;
  char v13 = sub_100032838();

  if ((v13 & 1) == 0) {
    goto LABEL_4;
  }
  sub_100030568(0, &qword_1000420A0);
  long long aBlock = v41;
  long long v32 = v42;
  uint64_t v33 = v43;
  sub_1000324A8();

  swift_release();
  sub_10002D328(*((unint64_t *)&v46 + 1));
  char v14 = sub_100032838();

  if ((v14 & 1) == 0)
  {
LABEL_4:
    long long aBlock = v41;
    long long v32 = v42;
    uint64_t v33 = v43;
    sub_1000324A8();

    unint64_t v15 = sub_10002D328(*((unint64_t *)&v46 + 1));
    if ((void)v46)
    {
      (*(void (**)(unint64_t))(*(void *)v46 + 112))(v15);
      swift_release();
    }
    long long v45 = v41;
    long long v46 = v42;
    sub_10000FEF8((uint64_t)&v45, (uint64_t)v49, &qword_100042090);
    uint64_t v16 = (void *)*((void *)&v45 + 1);
    sub_10000FEF8((uint64_t)&v46, (uint64_t)v48, &qword_100042098);
    sub_100030378((void *)&v46 + 1, &v47);
    sub_100031C88();
    uint64_t v17 = sub_100032848();
    (*(void (**)(unsigned char *, void (**)(void *), uint64_t))(*(void *)(v17 - 8) + 32))(v44, &v43, v17);
    id v18 = v16;
    sub_100030388(v49);
    sub_1000303B4((uint64_t)v48);
    sub_1000303E0(&v47);
    sub_1000303B4((uint64_t)v44);
    sub_1000324A8();
    swift_release();
    sub_1000324B8();
    sub_10003040C(v49);

    sub_100030438((uint64_t)v48);
    sub_100030464(&v47);
    sub_100030438((uint64_t)v44);
    id v19 = [a1 imageForDescriptor:a2];
    id v20 = v18;
    sub_100030388(v49);
    sub_1000303B4((uint64_t)v48);
    sub_1000303E0(&v47);
    sub_1000303B4((uint64_t)v44);
    sub_1000324A8();
    id v21 = a1;

    sub_1000324B8();
    sub_10003040C(v49);

    sub_100030438((uint64_t)v48);
    sub_100030464(&v47);
    sub_100030438((uint64_t)v44);
    id v22 = v20;
    sub_100030388(v49);
    sub_1000303B4((uint64_t)v48);
    sub_1000303E0(&v47);
    sub_1000303B4((uint64_t)v44);
    id v23 = a2;
    sub_1000324A8();

    long long aBlock = v41;
    long long v32 = v42;
    uint64_t v33 = v43;
    id v35 = v38;
    id v36 = v23;
    long long v37 = v40;
    sub_1000324B8();
    sub_10003040C(v49);

    sub_100030438((uint64_t)v48);
    sub_100030464(&v47);
    sub_100030438((uint64_t)v44);
    if (v19)
    {
      id v24 = v19;
      if ([v24 placeholder])
      {
        type metadata accessor for CancellableToken();
        uint64_t v25 = swift_allocObject();
        *(unsigned char *)(v25 + 16) = 0;
        uint64_t v26 = swift_allocObject();
        long long v27 = *v4;
        *(_OWORD *)(v26 + 56) = v4[1];
        long long v28 = v4[3];
        *(_OWORD *)(v26 + 72) = v4[2];
        *(_OWORD *)(v26 + 88) = v28;
        *(_OWORD *)(v26 + 104) = v4[4];
        *(void *)(v26 + 16) = v10;
        *(void *)(v26 + 24) = v9;
        *(void *)(v26 + 32) = v25;
        *(_OWORD *)(v26 + 40) = v27;
        uint64_t v33 = sub_100030540;
        uint64_t v34 = v26;
        *(void *)&long long aBlock = _NSConcreteStackBlock;
        *((void *)&aBlock + 1) = 1107296256;
        *(void *)&long long v32 = sub_10002DD84;
        *((void *)&v32 + 1) = &unk_10003E550;
        uint64_t v29 = _Block_copy(&aBlock);
        swift_retain();
        sub_10003016C((uint64_t)v4);
        swift_release();
        [v21 getImageForImageDescriptor:v23 completion:v29];
        _Block_release(v29);
        long long aBlock = v41;
        long long v32 = v42;
        uint64_t v33 = v43;
        id v30 = v22;
        sub_100030388(v49);
        sub_1000303B4((uint64_t)v48);
        sub_1000303E0(&v47);
        sub_1000303B4((uint64_t)v44);
        swift_retain();
        sub_1000324A8();
        swift_release();
        long long aBlock = v41;
        long long v32 = v42;
        uint64_t v33 = v43;
        id v35 = v38;
        id v36 = v39;
        *(void *)&long long v37 = v25;
        *((void *)&v37 + 1) = *((void *)&v40 + 1);
        sub_1000324B8();
        swift_release();

        sub_10003040C(v49);
        sub_100030438((uint64_t)v48);
        sub_100030464(&v47);
        sub_100030438((uint64_t)v44);
      }
      else
      {
        __chkstk_darwin(*((void *)v4 + 2));
        sub_100031E28();
      }
    }
    else
    {
      __chkstk_darwin(*((void *)v4 + 2));
      sub_100031E28();
    }
  }
}

void sub_10002DC40(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = (*(uint64_t (**)(void))(*(void *)a2 + 88))();
  if ((v5 & 1) == 0)
  {
    if (a1)
    {
      __chkstk_darwin(v5);
      id v6 = a1;
      sub_100031E28();
    }
    else
    {
      __chkstk_darwin(*(void *)(a3 + 16));
      sub_100031E28();
    }
  }
}

void sub_10002DD84(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

void sub_10002DDF0(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = v2;
  *(_OWORD *)long long v60 = *(_OWORD *)(v2 + 40);
  *(_OWORD *)&v60[16] = *(_OWORD *)(v2 + 56);
  *(void *)&v60[32] = *(void *)(v2 + 72);
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t v5 = *(void *)(a1 + 24);
  type metadata accessor for ResolvedApplicationIcon.LoadingState();
  sub_1000324D8();
  sub_1000324A8();
  sub_10002F4C0(v54);

  swift_release();
  sub_10002D328(v54);
  uint64_t v6 = *(void *)(v2 + 24);
  uint64_t v7 = *(void *)(v2 + 32);
  unint64_t v39 = v54;
  *(void *)&long long v40 = v6;
  *((void *)&v40 + 1) = v7;
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v4;
  *(void *)(v8 + 24) = v5;
  long long v9 = *(_OWORD *)(v3 + 48);
  *(_OWORD *)(v8 + 64) = *(_OWORD *)(v3 + 32);
  *(_OWORD *)(v8 + 80) = v9;
  *(_OWORD *)(v8 + 96) = *(_OWORD *)(v3 + 64);
  long long v10 = *(_OWORD *)(v3 + 16);
  *(_OWORD *)(v8 + 32) = *(_OWORD *)v3;
  *(_OWORD *)(v8 + 48) = v10;
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v4;
  *(void *)(v11 + 24) = v5;
  long long v12 = *(_OWORD *)(v3 + 48);
  *(_OWORD *)(v11 + 64) = *(_OWORD *)(v3 + 32);
  *(_OWORD *)(v11 + 80) = v12;
  *(_OWORD *)(v11 + 96) = *(_OWORD *)(v3 + 64);
  long long v13 = *(_OWORD *)(v3 + 16);
  *(_OWORD *)(v11 + 32) = *(_OWORD *)v3;
  *(_OWORD *)(v11 + 48) = v13;
  *(void *)long long v60 = sub_100030074;
  *(void *)&v60[8] = v8;
  *(void *)&v60[16] = sub_1000300C0;
  *(void *)&v60[24] = v11;
  sub_10003016C(v3);
  sub_10003016C(v3);
  type metadata accessor for ResolvedApplicationIcon.Inner();
  swift_retain();
  uint64_t WitnessTable = swift_getWitnessTable();
  sub_100032398();
  swift_release();
  swift_release();
  sub_10002D328(v39);
  swift_release();
  unint64_t v39 = (unint64_t)v52;
  long long v40 = v53;
  long long v41 = v54;
  long long v42 = v55;
  id v51 = *(id *)v3;
  id v15 = v51;
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = v4;
  *(void *)(v16 + 24) = v5;
  long long v17 = *(_OWORD *)(v3 + 48);
  *(_OWORD *)(v16 + 64) = *(_OWORD *)(v3 + 32);
  *(_OWORD *)(v16 + 80) = v17;
  *(_OWORD *)(v16 + 96) = *(_OWORD *)(v3 + 64);
  long long v18 = *(_OWORD *)(v3 + 16);
  *(_OWORD *)(v16 + 32) = *(_OWORD *)v3;
  *(_OWORD *)(v16 + 48) = v18;
  sub_10003016C(v3);
  sub_100031DE8();
  sub_100030568(0, &qword_100042050);
  uint64_t v49 = WitnessTable;
  uint64_t v50 = &protocol witness table for _AppearanceActionModifier;
  id v19 = v15;
  uint64_t v20 = swift_getWitnessTable();
  sub_100030328(&qword_100042058, &qword_100042050);
  sub_1000323A8();
  swift_release();

  sub_10002D328(v39);
  swift_release();
  sub_10001CDE0(v41);
  sub_10001CDE0(v42);
  unint64_t v39 = *(void *)v60;
  long long v40 = *(_OWORD *)&v60[8];
  long long v41 = *(_OWORD *)&v60[24];
  long long v42 = v61;
  long long v43 = v62;
  uint64_t v44 = v63;
  id v51 = *(id *)(v3 + 8);
  id v21 = v51;
  uint64_t v22 = swift_allocObject();
  *(void *)(v22 + 16) = v4;
  *(void *)(v22 + 24) = v5;
  long long v23 = *(_OWORD *)(v3 + 48);
  *(_OWORD *)(v22 + 64) = *(_OWORD *)(v3 + 32);
  *(_OWORD *)(v22 + 80) = v23;
  *(_OWORD *)(v22 + 96) = *(_OWORD *)(v3 + 64);
  long long v24 = *(_OWORD *)(v3 + 16);
  *(_OWORD *)(v22 + 32) = *(_OWORD *)v3;
  *(_OWORD *)(v22 + 48) = v24;
  sub_10003016C(v3);
  id v25 = v21;
  sub_100006B14(&qword_100042060);
  sub_100031DE8();
  sub_100030568(0, &qword_100042068);
  uint64_t v47 = v20;
  uint64_t v48 = sub_100010310(&qword_100042070, &qword_100042060);
  swift_getWitnessTable();
  sub_100030328(&qword_100042078, &qword_100042068);
  sub_1000323A8();
  swift_release();

  sub_10002D328(v39);
  swift_release();
  sub_10001CDE0(v41);
  sub_10001CDE0(v42);

  swift_release();
  unint64_t v26 = (unint64_t)v52;
  uint64_t v27 = v54;
  uint64_t v28 = v55;
  unint64_t v39 = (unint64_t)v52;
  long long v40 = v53;
  long long v41 = v54;
  long long v42 = v55;
  uint64_t v34 = (void *)v56;
  long long v43 = v56;
  uint64_t v44 = v57;
  uint64_t v33 = (void *)v58;
  long long v45 = v58;
  uint64_t v46 = v59;
  sub_100006B14(&qword_100042080);
  uint64_t v29 = sub_100031DE8();
  sub_100010310(&qword_100042088, &qword_100042080);
  swift_getWitnessTable();
  id v38 = *(void (**)(unsigned char *, unint64_t *, uint64_t))(*(void *)(v29 - 8) + 16);
  v38(v60, &v39, v29);
  sub_10002D328(v26);
  swift_release();
  sub_10001CDE0(v27);
  sub_10001CDE0(v28);
  swift_release();

  swift_release();
  unint64_t v30 = *(void *)v60;
  uint64_t v31 = *(void *)&v60[24];
  uint64_t v32 = v61;
  id v52 = *(id *)v60;
  long long v53 = *(_OWORD *)&v60[8];
  long long v54 = *(_OWORD *)&v60[24];
  long long v55 = v61;
  id v36 = (void *)v62;
  long long v56 = v62;
  uint64_t v57 = v63;
  id v35 = (void *)v64;
  long long v58 = v64;
  uint64_t v59 = v65;
  v38(a2, (unint64_t *)&v52, v29);
  sub_10002D328(v30);
  swift_release();
  sub_10001CDE0(v31);
  sub_10001CDE0(v32);
  swift_release();

  swift_release();
}

uint64_t sub_10002E490@<X0>(uint64_t a1@<X3>, char *a2@<X8>)
{
  uint64_t v4 = *(void *)(a1 - 8);
  uint64_t v5 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __chkstk_darwin(v5);
  long long v10 = (char *)&v15 - v9;
  v11(v8);
  long long v12 = *(void (**)(char *, char *, uint64_t))(v4 + 16);
  v12(v10, v7, a1);
  long long v13 = *(void (**)(char *, uint64_t))(v4 + 8);
  v13(v7, a1);
  v12(a2, v10, a1);
  return ((uint64_t (*)(char *, uint64_t))v13)(v10, a1);
}

uint64_t sub_10002E5D0@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  return sub_10002E490(*(void *)(a1 + 16), a2);
}

void sub_10002E5F4(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
}

id sub_10002E638()
{
  id result = [self genericApplicationIcon];
  qword_100043A58 = (uint64_t)result;
  return result;
}

uint64_t *sub_10002E674()
{
  if (qword_1000433A0 != -1) {
    swift_once();
  }
  return &qword_100043A58;
}

id sub_10002E6C0()
{
  return sub_10002E910(&qword_1000433A0, (void **)&qword_100043A58);
}

void sub_10002E6E4(uint64_t a1)
{
}

uint64_t *sub_10002E708()
{
  if (qword_1000433A8 != -1) {
    swift_once();
  }
  return &qword_100043A60;
}

id sub_10002E754()
{
  return sub_10002E910(&qword_1000433A8, (void **)&qword_100043A60);
}

void sub_10002E778(uint64_t a1)
{
}

uint64_t *sub_10002E79C()
{
  if (qword_1000433B0 != -1) {
    swift_once();
  }
  return &qword_100043A68;
}

id sub_10002E7E8()
{
  return sub_10002E910(&qword_1000433B0, (void **)&qword_100043A68);
}

void sub_10002E80C(uint64_t a1)
{
}

void sub_10002E830(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = objc_allocWithZone((Class)ISIcon);
  NSString v6 = sub_100032608();
  id v7 = [v5 initWithBundleIdentifier:v6];

  *a4 = v7;
}

uint64_t *sub_10002E8A0()
{
  if (qword_1000433B8 != -1) {
    swift_once();
  }
  return &qword_100043A70;
}

id sub_10002E8EC()
{
  return sub_10002E910(qword_1000433B8, (void **)&qword_100043A70);
}

id sub_10002E910(void *a1, void **a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v3 = *a2;

  return v3;
}

void sub_10002E95C(void *a1@<X8>)
{
  if (qword_1000433A8 != -1) {
    swift_once();
  }
  uint64_t v2 = (void *)qword_100043A60;
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = v2;
  uint64_t v4 = self;
  id v5 = v2;
  id v6 = [v4 mainScreen];
  [v6 scale];
  uint64_t v8 = v7;

  if (qword_1000433B0 != -1) {
    swift_once();
  }
  id v9 = (id)qword_100043A68;
  sub_1000325A8();
  sub_100032598();
  swift_release();
  uint64_t v10 = sub_100031CE8();
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = v9;
  uint64_t v11[3] = v10;
  v11[4] = sub_100031010;
  _OWORD v11[5] = 0;
  id v12 = [v4 mainScreen];
  [v12 scale];
  uint64_t v14 = v13;

  if (qword_1000433B8[0] != -1) {
    swift_once();
  }
  uint64_t v15 = (void *)qword_100043A70;
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = v15;
  v16[3] = 0;
  v16[4] = sub_10002F2D8;
  v16[5] = 0;
  id v17 = v15;
  id v18 = [v4 mainScreen];
  [v18 scale];
  uint64_t v20 = v19;

  id v21 = objc_msgSend(objc_allocWithZone((Class)ISImageDescriptor), "initWithSize:scale:", 100.0, 100.0, 1.0);
  uint64_t v22 = (void *)qword_100043A70;
  uint64_t v23 = swift_allocObject();
  *(void *)(v23 + 16) = v22;
  id v24 = v22;
  id v28 = v21;
  id v25 = [v4 mainScreen];
  [v25 scale];
  uint64_t v27 = v26;

  swift_retain();
  swift_retain();
  swift_retain();
  *a1 = v8;
  a1[1] = 0;
  a1[2] = sub_100030FF4;
  a1[3] = v3;
  a1[4] = v14;
  a1[5] = 0;
  a1[6] = sub_10002ECF4;
  a1[7] = v11;
  a1[8] = v20;
  a1[9] = 0;
  a1[10] = sub_100031004;
  a1[11] = v16;
  a1[12] = v27;
  a1[13] = v21;
  a1[14] = sub_100030FF4;
  a1[15] = v23;
  swift_release();
  swift_release();
  swift_release();
}

double sub_10002ECF4@<D0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)&double result = sub_10002C9BC(a1, (void *)v2[2], v2[3], v2[4], v2[5], a2).n128_u64[0];
  return result;
}

double sub_10002ED00@<D0>(unint64_t a1@<X0>, uint64_t a2@<X8>)
{
  switch(a1 >> 62)
  {
    case 2uLL:
      swift_getErrorValue();
      swift_errorRetain();
      *(void *)&long long v23 = sub_100032A68();
      *((void *)&v23 + 1) = v4;
      sub_100011CA4();
      uint64_t v5 = sub_1000322B8();
      uint64_t v7 = v6;
      char v9 = v8 & 1;
      sub_1000323D8();
      uint64_t v10 = sub_100032298();
      uint64_t v12 = v11;
      uint64_t v22 = a2;
      char v14 = v13;
      swift_release();
      sub_100025784(v5, v7, v9);
      swift_bridgeObjectRelease();
      char v21 = v14 & 1;
      sub_100025588(v10, v12, v14 & 1);
      swift_bridgeObjectRetain();
      sub_100001DEC(&qword_100041F28);
      sub_10002F328();
      sub_100032058();
      sub_10002F4F0(v23, *((uint64_t *)&v23 + 1), v24, SBYTE8(v24), v25, *((uint64_t *)&v25 + 1), v26, v27);
      sub_100001DEC(&qword_100041F48);
      sub_100001DEC(&qword_100041F50);
      sub_10002F3C8();
      sub_10002F444();
      sub_100032058();
      sub_10002D328(a1);
      a2 = v22;
      sub_10002F568(v23, *((uint64_t *)&v23 + 1), v24, SBYTE8(v24), v25, *((uint64_t *)&v25 + 1), v26, v27);
      sub_100025784(v10, v12, v21);
      goto LABEL_5;
    case 3uLL:
      sub_1000323F8();
      swift_retain();
      sub_100001DEC(&qword_100041F28);
      sub_10002F328();
      sub_100032058();
      sub_100001DEC(&qword_100041F48);
      sub_100001DEC(&qword_100041F50);
      sub_10002F3C8();
      sub_10002F444();
      sub_100032058();
      swift_release();
      break;
    default:
      swift_retain();
      sub_100031FE8();
      uint64_t v15 = sub_1000322A8();
      uint64_t v17 = v16;
      char v19 = v18 & 1;
      sub_100032588();
      sub_10002F4C0(a1);
      sub_100025588(v15, v17, v19);
      swift_bridgeObjectRetain();
      sub_100001DEC(&qword_100041F28);
      sub_10002F328();
      sub_100032058();
      sub_100001DEC(&qword_100041F48);
      sub_100001DEC(&qword_100041F50);
      sub_10002F3C8();
      sub_10002F444();
      sub_100032058();
      sub_10002D328(a1);
      sub_100025784(v15, v17, v19);
LABEL_5:
      swift_bridgeObjectRelease();
      break;
  }
  double result = *(double *)&v23;
  *(_OWORD *)a2 = v23;
  *(_OWORD *)(a2 + 16) = v24;
  *(_OWORD *)(a2 + 32) = v25;
  *(void *)(a2 + 48) = v26;
  *(unsigned char *)(a2 + 56) = v27;
  *(unsigned char *)(a2 + 57) = v28;
  return result;
}

uint64_t sub_10002F2E0()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

unint64_t sub_10002F328()
{
  unint64_t result = qword_100041F30;
  if (!qword_100041F30)
  {
    sub_100006B14(&qword_100041F28);
    sub_100010310(&qword_100041F38, &qword_100041F40);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041F30);
  }
  return result;
}

unint64_t sub_10002F3C8()
{
  unint64_t result = qword_100041F58;
  if (!qword_100041F58)
  {
    sub_100006B14(&qword_100041F48);
    sub_10002F328();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041F58);
  }
  return result;
}

unint64_t sub_10002F444()
{
  unint64_t result = qword_100041F60;
  if (!qword_100041F60)
  {
    sub_100006B14(&qword_100041F50);
    sub_10002F328();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041F60);
  }
  return result;
}

unint64_t sub_10002F4C0(unint64_t result)
{
  if (result >> 62 == 2) {
    return swift_errorRetain();
  }
  if ((result >> 62) <= 1) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_10002F4F0(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  if (a8)
  {
    swift_retain();
    sub_100025588(a2, a3, a4 & 1);
  }
  else
  {
    sub_100025588(a1, a2, a3 & 1);
  }

  return swift_bridgeObjectRetain();
}

uint64_t sub_10002F568(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  if (a8)
  {
    swift_release();
    sub_100025784(a2, a3, a4 & 1);
  }
  else
  {
    sub_100025784(a1, a2, a3 & 1);
  }

  return swift_bridgeObjectRelease();
}

uint64_t sub_10002F5DC()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_10002F624()
{
  unint64_t result = qword_100041F68;
  if (!qword_100041F68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041F68);
  }
  return result;
}

uint64_t sub_10002F678()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10002F69C(uint64_t a1)
{
  unint64_t v2 = sub_1000309D8();

  return static PreviewProvider._previews.getter(a1, v2);
}

uint64_t sub_10002F6E8(uint64_t a1)
{
  unint64_t v2 = sub_1000309D8();

  return static PreviewProvider._platform.getter(a1, v2);
}

uint64_t type metadata accessor for CancellableToken()
{
  return self;
}

uint64_t sub_10002F758(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_allocateGenericValueMetadata(a1, a2, a3, 32);
}

uint64_t sub_10002F760(uint64_t a1)
{
  return swift_release();
}

uint64_t sub_10002F79C(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  uint64_t v3 = *(void *)(a2 + 24);
  long long v4 = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 8) = v4;
  *(void *)(a1 + 24) = v3;
  id v5 = (id)v4;
  swift_retain();
  return a1;
}

void *sub_10002F7E8(void *a1, void *a2)
{
  *a1 = *a2;
  long long v4 = (void *)a1[1];
  id v5 = (void *)a2[1];
  a1[1] = v5;
  id v6 = v5;

  uint64_t v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_10002F84C(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;

  uint64_t v4 = *(void *)(a2 + 24);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(void *)(a1 + 24) = v4;
  swift_release();
  return a1;
}

uint64_t sub_10002F89C(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_10002F8E4(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)unint64_t result = a2 ^ 0x80000000;
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
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t type metadata accessor for ApplicationIcon()
{
  return sub_100030AA8();
}

unint64_t *initializeBufferWithCopyOfBuffer for ApplicationIconPhase(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3 = *a2;
  sub_10002F4C0(*a2);
  *a1 = v3;
  return a1;
}

unint64_t destroy for ApplicationIconPhase(unint64_t *a1)
{
  return sub_10002D328(*a1);
}

unint64_t *assignWithCopy for ApplicationIconPhase(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3 = *a2;
  sub_10002F4C0(*a2);
  unint64_t v4 = *a1;
  *a1 = v3;
  sub_10002D328(v4);
  return a1;
}

void *initializeWithTake for ApplicationIconPhase(void *result, void *a2)
{
  *unint64_t result = *a2;
  return result;
}

unint64_t *assignWithTake for ApplicationIconPhase(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3 = *a1;
  *a1 = *a2;
  sub_10002D328(v3);
  return a1;
}

uint64_t getEnumTagSinglePayload for ApplicationIconPhase(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7D && *(unsigned char *)(a1 + 8)) {
    return (*(_DWORD *)a1 + 125);
  }
  unsigned int v3 = (((*(void *)a1 >> 57) >> 5) | (4 * ((*(void *)a1 >> 57) & 0x18 | *(void *)a1 & 7))) ^ 0x7F;
  if (v3 >= 0x7C) {
    unsigned int v3 = -1;
  }
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for ApplicationIconPhase(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7C)
  {
    *(void *)unint64_t result = a2 - 125;
    if (a3 >= 0x7D) {
      *(unsigned char *)(result + 8) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7D) {
      *(unsigned char *)(result + 8) = 0;
    }
    if (a2)
    {
      uint64_t v3 = (-a2 >> 2) & 0x1F | (32 * (-a2 & 0x7F));
      *(void *)unint64_t result = (v3 | (v3 << 57)) & 0xF000000000000007;
    }
  }
  return result;
}

uint64_t sub_10002FAA0(void *a1)
{
  uint64_t v1 = *a1 >> 62;
  if (v1 == 3) {
    return (*a1 >> 3) + 3;
  }
  else {
    return v1;
  }
}

void *sub_10002FABC(void *result)
{
  *result &= 0x3FFFFFFFFFFFFFFFuLL;
  return result;
}

unint64_t *sub_10002FACC(unint64_t *result, uint64_t a2)
{
  if (a2 < 3)
  {
    uint64_t v2 = *result & 0xFFFFFFFFFFFFFF8;
    unint64_t v3 = a2 << 62;
  }
  else
  {
    uint64_t v2 = 8 * (a2 - 3);
    unint64_t v3 = 0xC000000000000000;
  }
  *unint64_t result = v2 | v3;
  return result;
}

ValueMetadata *type metadata accessor for ApplicationIconPhase()
{
  return &type metadata for ApplicationIconPhase;
}

ValueMetadata *type metadata accessor for ApplicationIcon_Previews()
{
  return &type metadata for ApplicationIcon_Previews;
}

uint64_t sub_10002FB18()
{
  return swift_getWitnessTable();
}

uint64_t sub_10002FBDC()
{
  return sub_100010310(&qword_100042030, &qword_100042038);
}

unint64_t sub_10002FC1C()
{
  unint64_t result = qword_100042040;
  if (!qword_100042040)
  {
    sub_100006B14(&qword_100042048);
    sub_10002F3C8();
    sub_10002F444();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100042040);
  }
  return result;
}

uint64_t sub_10002FC98(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_allocateGenericValueMetadata(a1, a2, a3, 40);
}

uint64_t sub_10002FCA0(uint64_t a1)
{
  swift_release();
  swift_release();

  swift_release();
  sub_10002D328(*(void *)(a1 + 64));

  return swift_release();
}

uint64_t sub_10002FD14(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = *(void **)a2;
  id v5 = *(void **)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v5;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  id v6 = *(void **)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v6;
  char v8 = *(void **)(a2 + 48);
  uint64_t v7 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = v8;
  *(void *)(a1 + 56) = v7;
  unint64_t v9 = *(void *)(a2 + 64);
  id v10 = v4;
  id v11 = v5;
  swift_retain();
  swift_retain();
  id v12 = v6;
  id v13 = v8;
  swift_retain();
  sub_10002F4C0(v9);
  uint64_t v14 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = v9;
  *(void *)(a1 + 72) = v14;
  swift_retain();
  return a1;
}

uint64_t sub_10002FDC4(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = *(void **)a2;
  id v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  uint64_t v7 = *(void **)(a2 + 8);
  char v8 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = v7;
  id v9 = v7;

  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_retain();
  swift_release();
  uint64_t v10 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v10;
  swift_retain();
  swift_release();
  id v11 = *(void **)(a1 + 40);
  id v12 = *(void **)(a2 + 40);
  *(void *)(a1 + 40) = v12;
  id v13 = v12;

  uint64_t v14 = *(void **)(a2 + 48);
  uint64_t v15 = *(void **)(a1 + 48);
  *(void *)(a1 + 48) = v14;
  id v16 = v14;

  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_retain();
  swift_release();
  unint64_t v17 = *(void *)(a2 + 64);
  sub_10002F4C0(v17);
  unint64_t v18 = *(void *)(a1 + 64);
  *(void *)(a1 + 64) = v17;
  sub_10002D328(v18);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_retain();
  swift_release();
  return a1;
}

__n128 sub_10002FEBC(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __n128 result = *(__n128 *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(__n128 *)(a1 + 16) = result;
  *(_OWORD *)(a1 + 32) = v3;
  return result;
}

uint64_t sub_10002FED8(uint64_t a1, uint64_t a2)
{
  long long v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;

  swift_release();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_release();
  id v5 = *(void **)(a1 + 40);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);

  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  swift_release();
  unint64_t v6 = *(void *)(a1 + 64);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  sub_10002D328(v6);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_release();
  return a1;
}

uint64_t sub_10002FF78(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 80)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_10002FFC0(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 80) = 1;
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
    *(unsigned char *)(result + 80) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t sub_100030014()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t type metadata accessor for ResolvedApplicationIcon.LoadingState()
{
  return sub_100030AA8();
}

void sub_100030074()
{
  uint64_t v1 = *(void **)(v0 + 32);
  uint64_t v2 = *(void **)(v0 + 40);
  uint64_t v3 = type metadata accessor for ResolvedApplicationIcon();
  sub_10002D440(v1, v2, v3);
}

unint64_t sub_1000300C0()
{
  type metadata accessor for ResolvedApplicationIcon.LoadingState();
  sub_1000324D8();
  sub_1000324A8();

  unint64_t result = sub_10002D328(v4);
  if (v3)
  {
    (*(void (**)(unint64_t))(*(void *)v3 + 112))(result);
    return swift_release();
  }
  return result;
}

uint64_t sub_10003016C(uint64_t a1)
{
  uint64_t v2 = *(void **)a1;
  uint64_t v3 = *(void **)(a1 + 8);
  unint64_t v4 = *(void **)(a1 + 40);
  id v5 = *(void **)(a1 + 48);
  unint64_t v6 = *(void *)(a1 + 64);
  swift_retain();
  id v7 = v2;
  id v8 = v3;
  swift_retain();
  swift_retain();
  id v9 = v4;
  id v10 = v5;
  sub_10002F4C0(v6);
  swift_retain();
  return a1;
}

uint64_t type metadata accessor for ResolvedApplicationIcon.Inner()
{
  return sub_100030AA8();
}

void sub_100030214(void **a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *(void **)(v1 + 40);
  uint64_t v4 = type metadata accessor for ResolvedApplicationIcon();
  sub_10002D440(v2, v3, v4);
}

uint64_t sub_100030268()
{
  swift_release();
  swift_release();

  swift_release();
  sub_10002D328(*(void *)(v0 + 96));
  swift_release();

  return _swift_deallocObject(v0, 112, 7);
}

void sub_1000302E0(void **a1)
{
  uint64_t v2 = *(void **)(v1 + 32);
  uint64_t v3 = *a1;
  uint64_t v4 = type metadata accessor for ResolvedApplicationIcon();
  sub_10002D440(v2, v3, v4);
}

uint64_t sub_100030328(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100030568(255, a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void *sub_100030378(void *a1, void *a2)
{
  *a2 = *a1;
  return a2;
}

id *sub_100030388(id *a1)
{
  id v2 = *a1;
  return a1;
}

uint64_t sub_1000303B4(uint64_t a1)
{
  return a1;
}

unint64_t *sub_1000303E0(unint64_t *a1)
{
  return a1;
}

id *sub_10003040C(id *a1)
{
  return a1;
}

uint64_t sub_100030438(uint64_t a1)
{
  return a1;
}

unint64_t *sub_100030464(unint64_t *a1)
{
  return a1;
}

uint64_t sub_100030490()
{
  return sub_1000305A4();
}

id sub_1000304A8()
{
  return sub_1000307AC();
}

uint64_t sub_1000304C0()
{
  swift_release();

  swift_release();
  swift_release();

  swift_release();
  sub_10002D328(*(void *)(v0 + 104));
  swift_release();

  return _swift_deallocObject(v0, 120, 7);
}

void sub_100030540(void *a1)
{
  sub_10002DC40(a1, *(void *)(v1 + 32), v1 + 40);
}

uint64_t sub_100030550(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100030560()
{
  return swift_release();
}

uint64_t sub_100030568(uint64_t a1, unint64_t *a2)
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

uint64_t sub_1000305A4()
{
  uint64_t v1 = *(void *)(v0 + 32);
  type metadata accessor for ResolvedApplicationIcon.LoadingError();
  swift_getWitnessTable();
  swift_allocError();
  long long v7 = *(_OWORD *)(v1 + 40);
  long long v8 = *(_OWORD *)(v1 + 56);
  uint64_t v9 = *(void *)(v1 + 72);
  type metadata accessor for ResolvedApplicationIcon.LoadingState();
  sub_100031C88();
  uint64_t v2 = sub_100032848();
  (*(void (**)(unsigned char *, uint64_t *, uint64_t))(*(void *)(v2 - 8) + 32))(v15, &v9, v2);
  long long v10 = v7;
  long long v11 = v8;
  sub_100030378((void *)&v11 + 1, &v14);
  sub_10000FEF8((uint64_t)&v11, (uint64_t)v13, &qword_100042098);
  uint64_t v3 = (void *)*((void *)&v10 + 1);
  sub_10000FEF8((uint64_t)&v10, (uint64_t)&v12, &qword_100042090);
  sub_100030388(&v12);
  id v4 = v3;
  sub_1000303B4((uint64_t)v13);
  sub_1000303E0(&v14);
  sub_1000303B4((uint64_t)v15);
  sub_1000324D8();
  sub_1000324A8();
  sub_10002D328(v6);
  sub_1000324B8();
  sub_10003040C(&v12);

  sub_100030438((uint64_t)v13);
  sub_100030464(&v14);
  return sub_100030438((uint64_t)v15);
}

id sub_1000307AC()
{
  uint64_t v1 = *(void *)(v0 + 32);
  id v2 = *(id *)(v0 + 40);
  id result = [v2 CGImage];
  if (result)
  {
    [v2 scale];
    sub_100032438();

    long long v8 = *(_OWORD *)(v1 + 40);
    long long v9 = *(_OWORD *)(v1 + 56);
    uint64_t v10 = *(void *)(v1 + 72);
    long long v12 = v8;
    long long v13 = v9;
    sub_10000FEF8((uint64_t)&v12, (uint64_t)&v16, &qword_100042090);
    id v4 = (void *)*((void *)&v12 + 1);
    sub_10000FEF8((uint64_t)&v13, (uint64_t)v15, &qword_100042098);
    sub_100030378((void *)&v13 + 1, &v14);
    type metadata accessor for ResolvedApplicationIcon.LoadingState();
    sub_100031C88();
    uint64_t v5 = sub_100032848();
    (*(void (**)(unsigned char *, uint64_t *, uint64_t))(*(void *)(v5 - 8) + 32))(v11, &v10, v5);
    sub_100030388(&v16);
    id v6 = v4;
    sub_1000303B4((uint64_t)v15);
    sub_1000303E0(&v14);
    sub_1000303B4((uint64_t)v11);
    sub_1000324D8();
    sub_1000324A8();
    sub_10002D328(v7);
    sub_1000324B8();
    sub_10003040C(&v16);

    sub_100030438((uint64_t)v15);
    sub_100030464(&v14);
    return (id)sub_100030438((uint64_t)v11);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t type metadata accessor for ResolvedApplicationIcon.LoadingError()
{
  return sub_100030AA8();
}

unint64_t sub_1000309D8()
{
  unint64_t result = qword_1000420A8;
  if (!qword_1000420A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000420A8);
  }
  return result;
}

uint64_t sub_100030A2C()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 80, 7);
}

uint64_t sub_100030A6C@<X0>(unint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_10002C264(a1, *(void (**)(uint64_t))(v2 + 48), *(void *)(v2 + 56), *(void (**)(uint64_t))(v2 + 64), *(void *)(v2 + 72), *(void *)(v2 + 16), *(void *)(v2 + 24), *(void *)(v2 + 32), a2, *(void *)(v2 + 40));
}

id sub_100030AA0@<X0>(unint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_10002BBCC(a1, *(void *)(v2 + 16), a2);
}

uint64_t sub_100030AA8()
{
  return swift_getGenericMetadata();
}

uint64_t sub_100030AD8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_allocateGenericValueMetadata(a1, a2, a3, 16);
}

uint64_t sub_100030AE0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_allocateGenericValueMetadata(a1, a2, a3, 24);
}

uint64_t sub_100030AEC(unint64_t *a1)
{
  sub_10002D328(*a1);

  return swift_release();
}

unint64_t *sub_100030B28(unint64_t *a1, unint64_t *a2)
{
  unint64_t v4 = *a2;
  sub_10002F4C0(*a2);
  unint64_t v6 = a2[1];
  unint64_t v5 = a2[2];
  *a1 = v4;
  a1[1] = v6;
  a1[2] = v5;
  swift_retain();
  return a1;
}

unint64_t *sub_100030B74(unint64_t *a1, unint64_t *a2)
{
  unint64_t v4 = *a2;
  sub_10002F4C0(*a2);
  unint64_t v5 = *a1;
  *a1 = v4;
  sub_10002D328(v5);
  unint64_t v6 = a2[2];
  a1[1] = a2[1];
  a1[2] = v6;
  swift_retain();
  swift_release();
  return a1;
}

__n128 sub_100030BD4(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t sub_100030BE8(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = *(void *)a1;
  *(void *)a1 = *(void *)a2;
  sub_10002D328(v4);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_release();
  return a1;
}

uint64_t sub_100030C30(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_100030C78(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 24) = 1;
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
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

unint64_t sub_100030CB8(uint64_t a1)
{
  swift_release();
  unint64_t v2 = *(void *)(a1 + 24);

  return sub_10002D328(v2);
}

void *sub_100030D04(void *a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  unint64_t v4 = *(void **)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  unint64_t v5 = *(void *)(a2 + 24);
  a1[2] = *(void *)(a2 + 16);
  id v6 = v3;
  id v7 = v4;
  swift_retain();
  sub_10002F4C0(v5);
  a1[3] = v5;
  return a1;
}

uint64_t sub_100030D5C(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = *(void **)a1;
  unint64_t v5 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  id v6 = v5;

  id v7 = *(void **)(a2 + 8);
  long long v8 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = v7;
  id v9 = v7;

  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_retain();
  swift_release();
  unint64_t v10 = *(void *)(a2 + 24);
  sub_10002F4C0(v10);
  unint64_t v11 = *(void *)(a1 + 24);
  *(void *)(a1 + 24) = v10;
  sub_10002D328(v11);
  return a1;
}

uint64_t sub_100030DE4(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;

  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_release();
  unint64_t v5 = *(void *)(a1 + 24);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  sub_10002D328(v5);
  return a1;
}

uint64_t sub_100030E44()
{
  return swift_getWitnessTable();
}

uint64_t sub_100030FA8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100030FEC(uint64_t a1)
{
  return *(void *)(a1 + 8);
}

uint64_t sub_100031014()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

id sub_100031024()
{
  type metadata accessor for ResourceBundleClass();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id result = [self bundleForClass:ObjCClassFromMetadata];
  qword_1000439C8 = (uint64_t)result;
  return result;
}

uint64_t sub_100031078(uint64_t a1)
{
  return sub_1000316B8(a1, qword_100043A78);
}

uint64_t sub_100031098()
{
  return sub_100031780(&qword_1000439D0, (uint64_t)qword_100043A78);
}

uint64_t sub_1000310BC(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_1000310F4@<X0>(uint64_t a1@<X8>)
{
  return sub_1000317F8(&qword_1000439D0, (uint64_t)qword_100043A78, a1);
}

uint64_t sub_100031118(uint64_t a1)
{
  return sub_1000316B8(a1, qword_100043A90);
}

uint64_t sub_10003113C()
{
  return sub_100031780(&qword_1000439D8, (uint64_t)qword_100043A90);
}

uint64_t sub_100031160@<X0>(uint64_t a1@<X8>)
{
  return sub_1000317F8(&qword_1000439D8, (uint64_t)qword_100043A90, a1);
}

uint64_t sub_100031184(uint64_t a1)
{
  return sub_1000316B8(a1, qword_100043AA8);
}

uint64_t sub_1000311A8()
{
  return sub_100031780(&qword_1000439E0, (uint64_t)qword_100043AA8);
}

uint64_t sub_1000311CC@<X0>(uint64_t a1@<X8>)
{
  return sub_1000317F8(&qword_1000439E0, (uint64_t)qword_100043AA8, a1);
}

uint64_t sub_1000311F0(uint64_t a1)
{
  return sub_1000316B8(a1, qword_100043AC0);
}

uint64_t sub_100031214()
{
  return sub_100031780(&qword_1000439E8, (uint64_t)qword_100043AC0);
}

uint64_t sub_100031238@<X0>(uint64_t a1@<X8>)
{
  return sub_1000317F8(&qword_1000439E8, (uint64_t)qword_100043AC0, a1);
}

uint64_t sub_10003125C(uint64_t a1)
{
  return sub_1000316B8(a1, qword_100043AD8);
}

uint64_t sub_100031288()
{
  return sub_100031780(&qword_1000439F0, (uint64_t)qword_100043AD8);
}

uint64_t sub_1000312AC@<X0>(uint64_t a1@<X8>)
{
  return sub_1000317F8(&qword_1000439F0, (uint64_t)qword_100043AD8, a1);
}

uint64_t sub_1000312D0(uint64_t a1)
{
  return sub_1000316B8(a1, qword_100043AF0);
}

uint64_t sub_1000312EC()
{
  return sub_100031780(&qword_1000439F8, (uint64_t)qword_100043AF0);
}

uint64_t sub_100031310@<X0>(uint64_t a1@<X8>)
{
  return sub_1000317F8(&qword_1000439F8, (uint64_t)qword_100043AF0, a1);
}

uint64_t sub_100031334(uint64_t a1)
{
  return sub_1000316B8(a1, qword_100043B08);
}

uint64_t sub_100031360()
{
  return sub_100031780(&qword_100043A00, (uint64_t)qword_100043B08);
}

uint64_t sub_100031384@<X0>(uint64_t a1@<X8>)
{
  return sub_1000317F8(&qword_100043A00, (uint64_t)qword_100043B08, a1);
}

uint64_t sub_1000313A8(uint64_t a1)
{
  return sub_1000316B8(a1, qword_100043B20);
}

uint64_t sub_1000313CC()
{
  return sub_100031780(&qword_100043A08, (uint64_t)qword_100043B20);
}

uint64_t sub_1000313F0@<X0>(uint64_t a1@<X8>)
{
  return sub_1000317F8(&qword_100043A08, (uint64_t)qword_100043B20, a1);
}

uint64_t sub_100031414(uint64_t a1)
{
  return sub_1000316B8(a1, qword_100043B38);
}

uint64_t sub_100031430()
{
  return sub_100031780(&qword_100043A10, (uint64_t)qword_100043B38);
}

uint64_t sub_100031454@<X0>(uint64_t a1@<X8>)
{
  return sub_1000317F8(&qword_100043A10, (uint64_t)qword_100043B38, a1);
}

uint64_t sub_100031478(uint64_t a1)
{
  return sub_1000316B8(a1, qword_100043B50);
}

uint64_t sub_1000314A0()
{
  return sub_100031780(&qword_100043A18, (uint64_t)qword_100043B50);
}

uint64_t sub_1000314C4@<X0>(uint64_t a1@<X8>)
{
  return sub_1000317F8(&qword_100043A18, (uint64_t)qword_100043B50, a1);
}

uint64_t sub_1000314E8(uint64_t a1)
{
  return sub_1000316B8(a1, qword_100043B68);
}

uint64_t sub_100031514()
{
  return sub_100031780(&qword_100043A20, (uint64_t)qword_100043B68);
}

uint64_t sub_100031538@<X0>(uint64_t a1@<X8>)
{
  return sub_1000317F8(&qword_100043A20, (uint64_t)qword_100043B68, a1);
}

uint64_t sub_10003155C(uint64_t a1)
{
  return sub_1000316B8(a1, qword_100043B80);
}

uint64_t sub_100031580()
{
  return sub_100031780(&qword_100043A28, (uint64_t)qword_100043B80);
}

uint64_t sub_1000315A4@<X0>(uint64_t a1@<X8>)
{
  return sub_1000317F8(&qword_100043A28, (uint64_t)qword_100043B80, a1);
}

uint64_t sub_1000315C8(uint64_t a1)
{
  return sub_1000316B8(a1, qword_100043B98);
}

uint64_t sub_1000315E4()
{
  return sub_100031780(&qword_100043A30, (uint64_t)qword_100043B98);
}

uint64_t sub_100031608@<X0>(uint64_t a1@<X8>)
{
  return sub_1000317F8(&qword_100043A30, (uint64_t)qword_100043B98, a1);
}

uint64_t sub_10003162C(uint64_t a1)
{
  return sub_1000316B8(a1, qword_100043BB0);
}

uint64_t sub_100031650()
{
  return sub_100031780(&qword_100043A38, (uint64_t)qword_100043BB0);
}

uint64_t sub_100031674@<X0>(uint64_t a1@<X8>)
{
  return sub_1000317F8(&qword_100043A38, (uint64_t)qword_100043BB0, a1);
}

uint64_t sub_100031698(uint64_t a1)
{
  return sub_1000316B8(a1, qword_100043BC8);
}

uint64_t sub_1000316B8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100031B18();
  sub_1000318B4(v3, a2);
  sub_1000310BC(v3, (uint64_t)a2);
  if (qword_1000439C0 != -1) {
    swift_once();
  }
  id v4 = (id)qword_1000439C8;
  return sub_100031B08();
}

uint64_t sub_10003175C()
{
  return sub_100031780(&qword_100043A40, (uint64_t)qword_100043BC8);
}

uint64_t sub_100031780(void *a1, uint64_t a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_100031B18();

  return sub_1000310BC(v3, a2);
}

uint64_t sub_1000317D4@<X0>(uint64_t a1@<X8>)
{
  return sub_1000317F8(&qword_100043A40, (uint64_t)qword_100043BC8, a1);
}

uint64_t sub_1000317F8@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_100031B18();
  uint64_t v6 = sub_1000310BC(v5, a2);
  id v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);

  return v7(a3, v6, v5);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t *sub_1000318B4(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_100031918()
{
  return type metadata accessor for URL();
}

uint64_t sub_100031928()
{
  return UUID.init()();
}

uint64_t sub_100031938()
{
  return type metadata accessor for UUID();
}

uint64_t sub_100031948()
{
  return static Locale.autoupdatingCurrent.getter();
}

uint64_t sub_100031958()
{
  return type metadata accessor for Locale();
}

uint64_t sub_100031968()
{
  return static FamilyControlsService.connectionPrivate<A>(exportedObject:)();
}

uint64_t sub_100031978()
{
  return dispatch thunk of UsageStore.open(from:)();
}

uint64_t sub_100031988()
{
  return UsageStore.init()();
}

uint64_t sub_100031998()
{
  return type metadata accessor for UsageStore();
}

uint64_t sub_1000319A8()
{
  return dispatch thunk of AppInfoCache.appInfo(bundleIdentifier:)();
}

uint64_t sub_1000319B8()
{
  return dispatch thunk of AppInfoCache.fetchAppInfo(bundleIdentifier:completionHandler:)();
}

uint64_t sub_1000319C8()
{
  return static AppInfoCache.shared.getter();
}

uint64_t sub_1000319D8()
{
  return type metadata accessor for AppInfoCache();
}

uint64_t sub_1000319E8()
{
  return type metadata accessor for AppInfoSource();
}

uint64_t sub_1000319F8()
{
  return dispatch thunk of XPCConnectable.resume()();
}

uint64_t sub_100031A08()
{
  return XPCConnectable.remoteObjectProxy(retryCount:proxyHandler:)();
}

uint64_t sub_100031A18()
{
  return UsageItemRecord.UsageType.rawValue.getter();
}

uint64_t sub_100031A28()
{
  return type metadata accessor for UsageItemRecord.UsageType();
}

uint64_t sub_100031A38()
{
  return UsageItemRecord.identifier.getter();
}

uint64_t sub_100031A48()
{
  return UsageItemRecord.type.getter();
}

uint64_t sub_100031A58()
{
  return UsageItemRecord.category.getter();
}

uint64_t sub_100031A68()
{
  return type metadata accessor for UsageItemRecord();
}

uint64_t sub_100031A78()
{
  return dispatch thunk of AppInfo.artworkURL.getter();
}

uint64_t sub_100031A88()
{
  return dispatch thunk of AppInfo.displayName.getter();
}

uint64_t sub_100031A98()
{
  return dispatch thunk of AppInfo.source.getter();
}

uint64_t sub_100031AA8()
{
  return static Feature.isRebrandingEnabled.getter();
}

uint64_t sub_100031AB8()
{
  return Locations.init(useExplicitLocations:)();
}

uint64_t sub_100031AC8()
{
  return Locations.familyControlsStore.getter();
}

uint64_t sub_100031AD8()
{
  return type metadata accessor for Locations();
}

uint64_t sub_100031AE8()
{
  return Token.data.getter();
}

uint64_t sub_100031AF8()
{
  return Token.init(data:)();
}

uint64_t sub_100031B08()
{
  return ImageResource.init(name:bundle:)();
}

uint64_t sub_100031B18()
{
  return type metadata accessor for ImageResource();
}

uint64_t sub_100031B28()
{
  return KeyRetriever.init()();
}

uint64_t sub_100031B38()
{
  return type metadata accessor for KeyRetriever();
}

uint64_t sub_100031B48()
{
  return TokenDecoder.init(teamIdentifier:keyRetriever:)();
}

uint64_t sub_100031B58()
{
  return type metadata accessor for TokenDecoder();
}

uint64_t sub_100031B68()
{
  return TokenEncoder.init(teamIdentifier:keyRetriever:)();
}

uint64_t sub_100031B78()
{
  return type metadata accessor for TokenEncoder();
}

uint64_t sub_100031B88()
{
  return static TeamIdentifierRetriever.teamIdentifier(from:)();
}

uint64_t sub_100031B98()
{
  return static Logger.activityPicker.getter();
}

uint64_t sub_100031BA8()
{
  return Logger.logObject.getter();
}

uint64_t sub_100031BB8()
{
  return type metadata accessor for Logger();
}

uint64_t sub_100031BC8()
{
  return static ObservableObject.environmentStore.getter();
}

uint64_t sub_100031BD8()
{
  return ObservableObject<>.objectWillChange.getter();
}

uint64_t sub_100031BE8()
{
  return Published.init(initialValue:)();
}

uint64_t sub_100031BF8()
{
  return Published.projectedValue.getter();
}

uint64_t sub_100031C08()
{
  return Published.projectedValue.setter();
}

uint64_t sub_100031C18()
{
  return static Published.subscript.modify();
}

uint64_t sub_100031C28()
{
  return static Published.subscript.getter();
}

uint64_t sub_100031C38()
{
  return static Published.subscript.setter();
}

uint64_t sub_100031C48()
{
  return type metadata accessor for Published();
}

uint64_t sub_100031C58()
{
  return AsyncImage.init(url:scale:transaction:content:)();
}

uint64_t sub_100031C68()
{
  return EdgeInsets.init(_all:)();
}

uint64_t sub_100031C78()
{
  return LazyVStack.init(alignment:spacing:pinnedViews:content:)();
}

uint64_t sub_100031C88()
{
  return type metadata accessor for AnyLocation();
}

uint64_t sub_100031C98()
{
  return static ColorScheme.== infix(_:_:)();
}

uint64_t sub_100031CA8()
{
  return type metadata accessor for ColorScheme();
}

uint64_t sub_100031CB8()
{
  return type metadata accessor for Environment.Content();
}

uint64_t sub_100031CC8()
{
  return StrokeStyle.init(lineWidth:lineCap:lineJoin:miterLimit:dash:dashPhase:)();
}

uint64_t sub_100031CD8()
{
  return ToolbarItem<>.init(placement:content:)();
}

uint64_t sub_100031CE8()
{
  return Transaction.init(animation:)();
}

uint64_t sub_100031CF8()
{
  return ProgressView<>.init<>()();
}

uint64_t sub_100031D08()
{
  return static VerticalEdge.Set.all.getter();
}

uint64_t sub_100031D18()
{
  return _FrameLayout.init(width:height:alignment:)();
}

uint64_t sub_100031D28()
{
  return static AnyTransition.verticalDisclosure.getter();
}

uint64_t sub_100031D38()
{
  return GeometryProxy.size.getter();
}

uint64_t sub_100031D48()
{
  return withAnimation<A>(_:_:)();
}

uint64_t sub_100031D58()
{
  return GeometryReader.init(content:)();
}

uint64_t sub_100031D68()
{
  return type metadata accessor for GeometryReader();
}

uint64_t sub_100031D78()
{
  return NavigationView.init(content:)();
}

uint64_t sub_100031D88()
{
  return ObservedObject.init(wrappedValue:)();
}

uint64_t sub_100031DA8()
{
  return static ToolbarContent._makeToolbar(content:inputs:)();
}

uint64_t sub_100031DB8()
{
  return static ToolbarContent._makeContent(content:inputs:resolved:)();
}

uint64_t sub_100031DC8()
{
  return AsyncImagePhase.image.getter();
}

uint64_t sub_100031DD8()
{
  return DisclosureGroup.init(isExpanded:content:label:)();
}

uint64_t sub_100031DE8()
{
  return type metadata accessor for ModifiedContent();
}

uint64_t sub_100031DF8()
{
  return static PreviewProvider.platform.getter();
}

uint64_t sub_100031E28()
{
  return withTransaction<A>(_:_:)();
}

uint64_t sub_100031E38()
{
  return type metadata accessor for RoundedRectangle();
}

uint64_t sub_100031E48()
{
  return EnvironmentObject.projectedValue.getter();
}

uint64_t sub_100031E58()
{
  return EnvironmentObject.error()();
}

uint64_t sub_100031E68()
{
  return EnvironmentObject.Wrapper.subscript.getter();
}

uint64_t sub_100031E78()
{
  return EnvironmentObject.init()();
}

uint64_t sub_100031E88()
{
  return EnvironmentValues.imageScale.getter();
}

uint64_t sub_100031E98()
{
  return EnvironmentValues.accentColor.getter();
}

uint64_t sub_100031EA8()
{
  return EnvironmentValues.accentColor.setter();
}

uint64_t sub_100031EB8()
{
  return EnvironmentValues.colorScheme.getter();
}

uint64_t sub_100031EC8()
{
  return EnvironmentValues.foregroundColor.getter();
}

uint64_t sub_100031ED8()
{
  return EnvironmentValues.foregroundColor.setter();
}

uint64_t sub_100031EE8()
{
  return EnvironmentValues.allowsTightening.getter();
}

uint64_t sub_100031EF8()
{
  return EnvironmentValues.allowsTightening.setter();
}

uint64_t sub_100031F08()
{
  return EnvironmentValues.minimumScaleFactor.getter();
}

uint64_t sub_100031F18()
{
  return EnvironmentValues.minimumScaleFactor.setter();
}

uint64_t sub_100031F28()
{
  return EnvironmentValues.font.getter();
}

uint64_t sub_100031F38()
{
  return EnvironmentValues.font.setter();
}

uint64_t sub_100031F48()
{
  return EnvironmentValues.lineLimit.getter();
}

uint64_t sub_100031F58()
{
  return EnvironmentValues.lineLimit.setter();
}

uint64_t sub_100031F68()
{
  return EnvironmentValues.init()();
}

uint64_t sub_100031F78()
{
  return type metadata accessor for EnvironmentValues();
}

uint64_t sub_100031F88()
{
  return type metadata accessor for NavigationBarItem.TitleDisplayMode();
}

uint64_t sub_100031F98()
{
  return static VerticalAlignment.center.getter();
}

void sub_100031FA8(Swift::String a1)
{
}

void sub_100031FB8(Swift::String a1)
{
}

uint64_t sub_100031FC8()
{
  return LocalizedStringKey.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t sub_100031FD8()
{
  return type metadata accessor for LocalizedStringKey.StringInterpolation();
}

uint64_t sub_100031FE8()
{
  return LocalizedStringKey.init(stringLiteral:)();
}

uint64_t sub_100031FF8()
{
  return LocalizedStringKey.init(stringInterpolation:)();
}

uint64_t sub_100032008()
{
  return type metadata accessor for RoundedCornerStyle();
}

uint64_t sub_100032018()
{
  return static HorizontalAlignment.leading.getter();
}

uint64_t sub_100032028()
{
  return TupleToolbarContent.init(_:)();
}

uint64_t sub_100032038()
{
  return UIHostingController.init(rootView:)();
}

uint64_t sub_100032048()
{
  return type metadata accessor for _ConditionalContent.Storage();
}

uint64_t sub_100032058()
{
  return _ConditionalContent<>.init(storage:)();
}

uint64_t sub_100032068()
{
  return type metadata accessor for _ConditionalContent();
}

uint64_t sub_100032078()
{
  return static SearchFieldPlacement.navigationBarDrawer.getter();
}

uint64_t sub_100032088()
{
  return type metadata accessor for SearchFieldPlacement();
}

uint64_t sub_100032098()
{
  return static ToolbarItemPlacement.cancellationAction.getter();
}

uint64_t sub_1000320A8()
{
  return static ToolbarItemPlacement.confirmationAction.getter();
}

uint64_t sub_1000320B8()
{
  return type metadata accessor for ToolbarItemPlacement();
}

uint64_t sub_1000320C8()
{
  return InsetGroupedListStyle.init()();
}

uint64_t sub_1000320D8()
{
  return type metadata accessor for InsetGroupedListStyle();
}

uint64_t sub_1000320E8()
{
  return type metadata accessor for PinnedScrollableViews();
}

uint64_t sub_1000320F8()
{
  return static ToolbarContentBuilder.buildBlock<A>(_:)();
}

uint64_t sub_100032108()
{
  return static ToolbarContentBuilder.buildIf<A>(_:)();
}

uint64_t sub_100032118()
{
  return StackNavigationViewStyle.init()();
}

uint64_t sub_100032128()
{
  return type metadata accessor for StackNavigationViewStyle();
}

uint64_t sub_100032138()
{
  return ToggleStyleConfiguration.isOn.modify();
}

uint64_t sub_100032148()
{
  return ToggleStyleConfiguration.isOn.getter();
}

uint64_t sub_100032158()
{
  return type metadata accessor for ToggleStyleConfiguration.Label();
}

uint64_t sub_100032168()
{
  return ToggleStyleConfiguration.label.getter();
}

uint64_t sub_100032178()
{
  return type metadata accessor for ToggleStyleConfiguration();
}

uint64_t sub_100032188()
{
  return DisclosureGroupStyleConfiguration.isExpanded.modify();
}

uint64_t sub_100032198()
{
  return DisclosureGroupStyleConfiguration.isExpanded.getter();
}

uint64_t sub_1000321A8()
{
  return type metadata accessor for DisclosureGroupStyleConfiguration.Label();
}

uint64_t sub_1000321B8()
{
  return DisclosureGroupStyleConfiguration.label.getter();
}

uint64_t sub_1000321C8()
{
  return type metadata accessor for DisclosureGroupStyleConfiguration.Content();
}

uint64_t sub_1000321D8()
{
  return DisclosureGroupStyleConfiguration.content.getter();
}

uint64_t sub_1000321E8()
{
  return type metadata accessor for DisclosureGroupStyleConfiguration();
}

uint64_t sub_1000321F8()
{
  return static Log.runtimeIssuesLog.getter();
}

uint64_t sub_100032208()
{
  return static Edge.Set.all.getter();
}

uint64_t sub_100032218()
{
  return static Edge.Set.top.getter();
}

uint64_t sub_100032228()
{
  return static Edge.Set.leading.getter();
}

uint64_t sub_100032238()
{
  return static Edge.Set.trailing.getter();
}

uint64_t sub_100032248()
{
  return static Font.body.getter();
}

uint64_t sub_100032258()
{
  return static Font.Weight.semibold.getter();
}

uint64_t sub_100032268()
{
  return Font.weight(_:)();
}

uint64_t sub_100032278()
{
  return List<>.init(content:)();
}

uint64_t sub_100032288()
{
  return Text.foregroundColor(_:)();
}

uint64_t sub_100032298()
{
  return Text.underline(_:color:)();
}

uint64_t sub_1000322A8()
{
  return Text.init(_:tableName:bundle:comment:)();
}

uint64_t sub_1000322B8()
{
  return Text.init<A>(_:)();
}

uint64_t sub_1000322C8()
{
  return View.navigationViewStyle<A>(_:)();
}

uint64_t sub_1000322D8()
{
  return static View._makeView(view:inputs:)();
}

uint64_t sub_1000322E8()
{
  return static View._makeViewList(view:inputs:)();
}

uint64_t sub_1000322F8()
{
  return View.searchable(text:placement:prompt:)();
}

uint64_t sub_100032308()
{
  return View.toggleStyle<A>(_:)();
}

uint64_t sub_100032318()
{
  return View.onTapGesture(count:perform:)();
}

uint64_t sub_100032328()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_100032338()
{
  return View.navigationTitle(_:)();
}

uint64_t sub_100032348()
{
  return View.listRowSeparator(_:edges:)();
}

uint64_t sub_100032358()
{
  return View.disclosureGroupStyle<A>(_:)();
}

uint64_t sub_100032368()
{
  return View.listSectionSeparator(_:edges:)();
}

uint64_t sub_100032378()
{
  return View.navigationBarTitleDisplayMode(_:)();
}

uint64_t sub_100032388()
{
  return View.toolbar<A>(content:)();
}

uint64_t sub_100032398()
{
  return View.modifier<A>(_:)();
}

uint64_t sub_1000323A8()
{
  return View.onChange<A>(of:perform:)();
}

uint64_t sub_1000323B8()
{
  return View.listStyle<A>(_:)();
}

uint64_t sub_1000323C8()
{
  return Color.init(uiColor:)();
}

uint64_t sub_1000323D8()
{
  return static Color.red.getter();
}

uint64_t sub_1000323E8()
{
  return static Color.blue.getter();
}

uint64_t sub_1000323F8()
{
  return static Color.purple.getter();
}

uint64_t sub_100032408()
{
  return Color.opacity(_:)();
}

uint64_t sub_100032418()
{
  return static Color.primary.getter();
}

uint64_t sub_100032428()
{
  return Image.init(uiImage:)();
}

uint64_t sub_100032438()
{
  return Image.init(decorative:scale:orientation:)();
}

uint64_t sub_100032448()
{
  return Image.init(systemName:)();
}

uint64_t sub_100032458()
{
  return type metadata accessor for Image.ResizingMode();
}

uint64_t sub_100032468()
{
  return type metadata accessor for Image.Scale();
}

uint64_t sub_100032478()
{
  return Image.resizable(capInsets:resizingMode:)();
}

uint64_t sub_100032488()
{
  return Image.init(_:bundle:)();
}

uint64_t sub_100032498()
{
  return State.init(wrappedValue:)();
}

uint64_t sub_1000324A8()
{
  return State.wrappedValue.getter();
}

uint64_t sub_1000324B8()
{
  return State.wrappedValue.setter();
}

uint64_t sub_1000324C8()
{
  return State.projectedValue.getter();
}

uint64_t sub_1000324D8()
{
  return type metadata accessor for State();
}

uint64_t sub_1000324F8()
{
  return Toggle.init(isOn:label:)();
}

uint64_t sub_100032508()
{
  return Binding.wrappedValue.getter();
}

uint64_t sub_100032518()
{
  return Binding.subscript.getter();
}

uint64_t sub_100032528()
{
  return Binding.init(get:set:)();
}

uint64_t sub_100032538()
{
  return Binding<A>.id.getter();
}

uint64_t sub_100032548()
{
  return Divider.init()();
}

uint64_t sub_100032558()
{
  return type metadata accessor for Divider();
}

uint64_t sub_100032568()
{
  return ForEach<>.init(_:id:content:)();
}

uint64_t sub_100032578()
{
  return Section<>.init(header:footer:content:)();
}

uint64_t sub_100032588()
{
  return static Alignment.center.getter();
}

uint64_t sub_100032598()
{
  return Animation.repeatForever(autoreverses:)();
}

uint64_t sub_1000325A8()
{
  return static Animation.easeInOut.getter();
}

uint64_t sub_1000325B8()
{
  return static UnitPoint.center.getter();
}

uint64_t sub_1000325C8()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t sub_1000325D8()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t sub_1000325E8()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t sub_1000325F8()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

NSString sub_100032608()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_100032618()
{
  return static String._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_100032628()
{
  return static String._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_100032638()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100032648()
{
  return String.init(format:locale:arguments:)();
}

uint64_t sub_100032658()
{
  return String.init<A>(describing:)();
}

uint64_t sub_100032668()
{
  return String.uppercased()()._countAndFlagsBits;
}

uint64_t sub_100032678()
{
  return String.hash(into:)();
}

uint64_t sub_100032688()
{
  return String.append<A>(contentsOf:)();
}

void sub_100032698(Swift::String a1)
{
}

Swift::Int sub_1000326A8()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_1000326B8()
{
  return String.init<A>(_:)();
}

uint64_t sub_1000326C8()
{
  return dispatch thunk of Sequence.makeIterator()();
}

uint64_t sub_1000326D8()
{
  return dispatch thunk of RawRepresentable.rawValue.getter();
}

uint64_t sub_1000326E8()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray sub_1000326F8()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_100032708()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100032718()
{
  return Array.description.getter();
}

uint64_t sub_100032728()
{
  return specialized Array._endMutation()();
}

uint64_t sub_100032738()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_100032748()
{
  return static Array._allocateBufferUninitialized(minimumCapacity:)();
}

uint64_t sub_100032758()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_100032768()
{
  return static MainActor.shared.getter();
}

uint64_t sub_100032778()
{
  return type metadata accessor for MainActor();
}

uint64_t sub_100032788()
{
  return Set.init(minimumCapacity:)();
}

uint64_t sub_100032798()
{
  return dispatch thunk of Collection.endIndex.getter();
}

uint64_t sub_1000327A8()
{
  return dispatch thunk of Collection.formIndex(after:)();
}

uint64_t sub_1000327B8()
{
  return dispatch thunk of Collection.subscript.read();
}

uint64_t sub_1000327C8()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_1000327D8()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_1000327E8()
{
  return static os_log_type_t.fault.getter();
}

uint64_t sub_1000327F8()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_100032808()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t sub_100032818()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

UIImage sub_100032828(Swift::String imageLiteralResourceName)
{
  return UIImage.init(imageLiteralResourceName:)(imageLiteralResourceName);
}

uint64_t sub_100032838()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t sub_100032848()
{
  return type metadata accessor for Optional();
}

uint64_t sub_100032858()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_100032868()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_100032878()
{
  return StringProtocol.localizedStandardContains<A>(_:)();
}

uint64_t sub_100032888()
{
  return StringProtocol.contains<A>(_:)();
}

uint64_t sub_100032898()
{
  return BinaryInteger.description.getter();
}

uint64_t sub_1000328A8()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t sub_1000328B8()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t sub_1000328C8()
{
  return static _SetStorage.copy(original:)();
}

uint64_t sub_1000328D8()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

void sub_1000328E8(Swift::Int a1)
{
}

uint64_t sub_1000328F8()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_100032908()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_100032918()
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_100032928()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_100032938()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_100032948()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t sub_100032958()
{
  return specialized ContiguousArray.reserveCapacity(_:)();
}

uint64_t sub_100032968()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t sub_100032978()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_100032988()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100032998()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_1000329A8()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_1000329B8()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t sub_1000329C8()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t sub_1000329D8()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

Swift::Int sub_1000329F8(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

Swift::Int sub_100032A18(Swift::Int a1)
{
  return _minimumMergeRunLength(_:)(a1);
}

uint64_t sub_100032A28()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_100032A38()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_100032A48()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_100032A58()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_100032A68()
{
  return Error.localizedDescription.getter();
}

uint64_t sub_100032A78()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_100032A88()
{
  return Error._code.getter();
}

uint64_t sub_100032A98()
{
  return Error._domain.getter();
}

uint64_t sub_100032AA8()
{
  return Error._userInfo.getter();
}

uint64_t sub_100032AB8()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_100032AC8()
{
  return Hasher._finalize()();
}

uint64_t sub_100032AD8()
{
  return dispatch thunk of OptionSet.init(rawValue:)();
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

CFStringRef SecTaskCopySigningIdentifier(SecTaskRef task, CFErrorRef *error)
{
  return _SecTaskCopySigningIdentifier(task, error);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return _SecTaskCopyValueForEntitlement(task, entitlement, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return _SecTaskCreateWithAuditToken(allocator, token);
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

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

void bzero(void *a1, size_t a2)
{
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

uint64_t swift_bridgeObjectRetain_n()
{
  return _swift_bridgeObjectRetain_n();
}

uint64_t swift_deletedMethodError()
{
  return _swift_deletedMethodError();
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

uint64_t swift_getAtKeyPath()
{
  return _swift_getAtKeyPath();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return _swift_getEnumCaseMultiPayload();
}

uint64_t swift_getErrorValue()
{
  return _swift_getErrorValue();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getGenericMetadata()
{
  return _swift_getGenericMetadata();
}

uint64_t swift_getKeyPath()
{
  return _swift_getKeyPath();
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

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return _swift_isUniquelyReferenced_nonNull_bridgeObject();
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

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return _swift_unknownObjectWeakAssign();
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