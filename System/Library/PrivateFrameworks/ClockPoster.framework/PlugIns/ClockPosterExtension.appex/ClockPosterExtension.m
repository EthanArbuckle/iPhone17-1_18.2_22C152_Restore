uint64_t sub_1000051D4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  sub_10000CBC8();
  swift_allocObject();
  sub_10000CBD8();
  sub_10000CB98();
  swift_allocObject();
  swift_retain();
  sub_10000CBA8();
  sub_10000576C(&qword_100016358);
  sub_10000CB38();
  v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_10000D4A0;
  sub_1000057B0(&qword_100016360, (void (*)(uint64_t))&type metadata accessor for PRRenderingConfiguration);
  swift_retain();
  swift_retain();
  sub_10000CB28();
  sub_1000057B0(&qword_100016368, (void (*)(uint64_t))&type metadata accessor for PREditingConfiguration);
  swift_retain();
  sub_10000CB28();
  swift_release_n();
  result = swift_release_n();
  *a1 = v2;
  return result;
}

id sub_1000053FC()
{
  return sub_10000542C((uint64_t (*)(void))type metadata accessor for ClockPosterExtensionRenderingController);
}

id sub_100005414()
{
  return sub_10000542C((uint64_t (*)(void))type metadata accessor for ClockPosterExtensionEditingController);
}

id sub_10000542C(uint64_t (*a1)(void))
{
  id v1 = objc_allocWithZone((Class)a1(0));

  return [v1 init];
}

uint64_t sub_100005470()
{
  return swift_release();
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_1000055CC()
{
  unint64_t result = qword_100016330;
  if (!qword_100016330)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100016330);
  }
  return result;
}

uint64_t sub_100005620(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t variable initialization expression of ClockUpdater.descriptors()
{
  unint64_t v0 = (unint64_t)sub_100005F2C();
  if (v0 >> 62)
  {
    sub_1000056E4();
    uint64_t v1 = sub_10000CE08();
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_10000CE68();
    sub_1000056E4();
    uint64_t v1 = v0;
  }
  swift_bridgeObjectRelease();
  return v1;
}

unint64_t sub_1000056E4()
{
  unint64_t result = qword_1000165D0;
  if (!qword_1000165D0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1000165D0);
  }
  return result;
}

ValueMetadata *type metadata accessor for ClockPosterExtension()
{
  return &type metadata for ClockPosterExtension;
}

uint64_t sub_100005734()
{
  return *(void *)(*(void *)(swift_getOpaqueTypeConformance2() + 8) + 8);
}

uint64_t sub_10000576C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_1000057B0(unint64_t *a1, void (*a2)(uint64_t))
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

__n128 sub_1000057F8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_100005808(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_100005828(uint64_t result, int a2, int a3)
{
  if (a2)
  {
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
  *(unsigned char *)(result + 16) = v3;
  return result;
}

void type metadata accessor for CGPoint()
{
  if (!qword_100016430)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_100016430);
    }
  }
}

uint64_t sub_1000058A8()
{
  return sub_1000058DC(&qword_100016438);
}

uint64_t sub_1000058DC(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100005620((uint64_t *)&unk_100016340);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

id ClockUpdater.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return [v1 init];
}

id ClockUpdater.init()()
{
  sub_10000576C((uint64_t *)&unk_1000165C0);
  __chkstk_darwin();
  v2 = (char *)&v20 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_10000C9C8();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin();
  v6 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000576C(&qword_100016820);
  __chkstk_darwin();
  v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = v0;
  unint64_t v10 = (unint64_t)sub_100005F2C();
  if (v10 >> 62)
  {
    sub_1000056E4();
    uint64_t v11 = sub_10000CE08();
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_10000CE68();
    sub_1000056E4();
    uint64_t v11 = v10;
  }
  swift_bridgeObjectRelease();
  *(void *)&v9[OBJC_IVAR____TtC20ClockPosterExtension12ClockUpdater_descriptors] = v11;

  v12 = (objc_class *)type metadata accessor for ClockUpdater();
  v20.receiver = v9;
  v20.super_class = v12;
  id v13 = objc_msgSendSuper2(&v20, "init");
  sub_10000CA18();
  id v14 = v13;
  sub_10000C9A8();
  uint64_t v15 = enum case for ClockLogger.Role.update(_:);
  uint64_t v16 = sub_10000C9D8();
  uint64_t v17 = *(void *)(v16 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v17 + 104))(v8, v15, v16);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v17 + 56))(v8, 0, 1, v16);
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, enum case for ClockLogger.Host.ambient(_:), v3);
  uint64_t v18 = sub_10000CA98();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v2, 1, 1, v18);
  sub_10000C9B8();
  swift_release();

  sub_1000062B8((uint64_t)v2, (uint64_t *)&unk_1000165C0);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  sub_1000062B8((uint64_t)v8, &qword_100016820);
  return v14;
}

id ClockUpdater.__deallocating_deinit()
{
  uint64_t v1 = sub_10000C9D8();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin();
  uint64_t v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000CA18();
  sub_10000C9A8();
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, enum case for ClockLogger.Role.update(_:), v1);
  sub_10000C9F8();
  swift_release();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  uint64_t v5 = (objc_class *)type metadata accessor for ClockUpdater();
  v7.receiver = v0;
  v7.super_class = v5;
  return objc_msgSendSuper2(&v7, "dealloc");
}

void *sub_100005F2C()
{
  uint64_t v0 = sub_10000CA58();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  uint64_t v3 = (char *)v26 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_10000CA98();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  objc_super v7 = (char *)v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_10000CA38();
  uint64_t v9 = *(void *)(v8 + 16);
  if (v9)
  {
    v34 = &_swiftEmptyArrayStorage;
    sub_10000CDB8();
    unint64_t v10 = self;
    v12 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
    uint64_t v11 = v5 + 16;
    v31 = v12;
    id v32 = v10;
    unint64_t v13 = (*(unsigned __int8 *)(v11 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 64);
    v26[1] = v8;
    unint64_t v14 = v8 + v13;
    uint64_t v30 = *(void *)(v11 + 56);
    uint64_t v33 = v11;
    uint64_t v15 = (void (**)(char *, uint64_t))(v11 - 8);
    id v28 = (id)PRPosterRoleAmbient;
    v29 = (void (**)(char *, uint64_t))(v1 + 8);
    uint64_t v27 = v0;
    do
    {
      v31(v7, v14, v4);
      unint64_t v16 = *(void *)(sub_10000CA28() + 16);
      swift_bridgeObjectRelease();
      uint64_t v17 = v4;
      BOOL v18 = v16 < 2;
      sub_10000CA88();
      id v19 = v28;
      NSString v20 = sub_10000CC18();
      swift_bridgeObjectRelease();
      id v21 = [v32 mutableDescriptorWithIdentifier:v20 role:v19];

      id v22 = [objc_allocWithZone((Class)PRPosterAmbientConfiguration) initWithSupportedDataLayout:3 creationBehavior:0 editingBehavior:v18 deletionBehavior:2];
      [v21 setAmbientConfiguration:v22];
      sub_10000CA68();
      sub_10000CA48();
      (*v29)(v3, v27);
      NSString v23 = sub_10000CC18();
      uint64_t v4 = v17;
      swift_bridgeObjectRelease();
      [v21 setDisplayNameLocalizationKey:v23];

      (*v15)(v7, v17);
      sub_10000CD98();
      sub_10000CDC8();
      sub_10000CDD8();
      sub_10000CDA8();
      v14 += v30;
      --v9;
    }
    while (v9);
    v24 = v34;
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    return &_swiftEmptyArrayStorage;
  }
  return v24;
}

uint64_t type metadata accessor for ClockUpdater()
{
  return self;
}

uint64_t sub_1000062B8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_10000576C(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t ClockUpdater.updateDescriptors(_:with:completion:)(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  uint64_t v6 = *(void *)(a1 + 16);
  unint64_t v7 = *(void *)(v3 + OBJC_IVAR____TtC20ClockPosterExtension12ClockUpdater_descriptors);
  if (v7 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_10000CE18();
    swift_bridgeObjectRelease();
    if (v6 == v9) {
      goto LABEL_3;
    }
  }
  else if (v6 == *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_3:
    sub_1000063F8(a1);
    a3();
    return swift_bridgeObjectRelease();
  }
  return ((uint64_t (*)(unint64_t, void))a3)(v7, 0);
}

void *sub_1000063F8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = &_swiftEmptyArrayStorage;
  if (v2)
  {
    sub_10000CDB8();
    uint64_t result = (void *)sub_100006A60(a1);
    uint64_t v4 = (uint64_t)result;
    int v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = a1 + 64;
    uint64_t v17 = v2;
    while ((v4 & 0x8000000000000000) == 0 && v4 < 1 << *(unsigned char *)(a1 + 32))
    {
      unint64_t v10 = (unint64_t)v4 >> 6;
      if ((*(void *)(v8 + 8 * ((unint64_t)v4 >> 6)) & (1 << v4)) == 0) {
        goto LABEL_22;
      }
      if (*(_DWORD *)(a1 + 36) != v6) {
        goto LABEL_23;
      }
      uint64_t v18 = v7;
      id v11 = *(id *)(*(void *)(a1 + 56) + 8 * v4);
      sub_10000CD98();
      sub_10000CDC8();
      sub_10000CDD8();
      uint64_t result = (void *)sub_10000CDA8();
      int64_t v9 = 1 << *(unsigned char *)(a1 + 32);
      if (v4 >= v9) {
        goto LABEL_24;
      }
      uint64_t v12 = *(void *)(v8 + 8 * v10);
      if ((v12 & (1 << v4)) == 0) {
        goto LABEL_25;
      }
      if (*(_DWORD *)(a1 + 36) != v6) {
        goto LABEL_26;
      }
      unint64_t v13 = v12 & (-2 << (v4 & 0x3F));
      if (v13)
      {
        int64_t v9 = __clz(__rbit64(v13)) | v4 & 0xFFFFFFFFFFFFFFC0;
      }
      else
      {
        unint64_t v14 = v10 + 1;
        unint64_t v15 = (unint64_t)(v9 + 63) >> 6;
        if (v10 + 1 < v15)
        {
          unint64_t v16 = *(void *)(v8 + 8 * v14);
          if (v16)
          {
LABEL_18:
            int64_t v9 = __clz(__rbit64(v16)) + (v14 << 6);
          }
          else
          {
            while (v15 - 2 != v10)
            {
              unint64_t v16 = *(void *)(a1 + 80 + 8 * v10++);
              if (v16)
              {
                unint64_t v14 = v10 + 1;
                goto LABEL_18;
              }
            }
          }
        }
      }
      uint64_t v7 = v18 + 1;
      uint64_t v4 = v9;
      if (v18 + 1 == v17) {
        return &_swiftEmptyArrayStorage;
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

uint64_t ClockUpdater.updateConfiguration(_:completion:)(uint64_t a1, uint64_t (*a2)(uint64_t, void))
{
  return a2(a1, 0);
}

uint64_t ClockUpdater.updateConfiguration(_:with:completion:)(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, void))
{
  return a3(a1, 0);
}

uint64_t sub_10000681C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_10000576C((uint64_t *)&unk_1000165C0);
  __chkstk_darwin(v4 - 8);
  int v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v7 = [a1 descriptorIdentifier];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = sub_10000CC28();
    id v11 = v10;

    swift_bridgeObjectRetain();
    sub_10000CA78();
    uint64_t v12 = sub_10000CA98();
    uint64_t v13 = *(void *)(v12 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v6, 1, v12) != 1)
    {
      swift_bridgeObjectRelease();
      swift_unknownObjectRelease();
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v13 + 32))(a2, v6, v12);
    }
    sub_1000062B8((uint64_t)v6, (uint64_t *)&unk_1000165C0);
    unint64_t v15 = 0;
    unint64_t v16 = 0xE000000000000000;
    sub_10000CD58(47);
    swift_bridgeObjectRelease();
    unint64_t v15 = 0xD00000000000001CLL;
    unint64_t v16 = 0x800000010000F4B0;
    v17._countAndFlagsBits = v9;
    v17._object = v11;
    sub_10000CC58(v17);
    v18._object = (void *)0x800000010000F4D0;
    v18._countAndFlagsBits = 0xD000000000000011;
    sub_10000CC58(v18);
  }
  uint64_t result = sub_10000CDF8();
  __break(1u);
  return result;
}

uint64_t sub_100006A60(uint64_t a1)
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

void sub_100006AE8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a1 + 16);
  unint64_t v6 = *(void *)(a2 + OBJC_IVAR____TtC20ClockPosterExtension12ClockUpdater_descriptors);
  if (v6 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v8 = sub_10000CE18();
    swift_bridgeObjectRelease();
    if (v5 == v8) {
      goto LABEL_3;
    }
  }
  else if (v5 == *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_3:
    sub_1000063F8(a1);
    sub_1000056E4();
    Class isa = sub_10000CC88().super.isa;
    (*(void (**)(uint64_t, Class, void))(a3 + 16))(a3, isa, 0);
    swift_bridgeObjectRelease();

    return;
  }
  sub_1000056E4();
  uint64_t v9 = sub_10000CC88().super.isa;
  (*(void (**)(uint64_t, objc_class *, void))(a3 + 16))(a3, v9, 0);
}

id sub_100006C28()
{
  uint64_t v1 = sub_10000C9D8();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin();
  uint64_t v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000CA18();
  sub_10000C9A8();
  id v11 = &OBJC_PROTOCOL___PREditingDelegate;
  uint64_t v5 = swift_dynamicCastObjCProtocolConditional();
  unint64_t v6 = (unsigned int *)&enum case for ClockLogger.Role.render(_:);
  if (v5) {
    unint64_t v6 = (unsigned int *)&enum case for ClockLogger.Role.edit(_:);
  }
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, *v6, v1);
  sub_10000C9F8();
  swift_release();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  unint64_t v7 = (objc_class *)type metadata accessor for ClockPosterExtensionController();
  v10.receiver = v0;
  v10.super_class = v7;
  return objc_msgSendSuper2(&v10, "dealloc");
}

uint64_t sub_100006EF4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_10000CB88();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  unint64_t v7 = (char *)v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_10000CA98();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  id v11 = (char *)v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v35[3] = &OBJC_PROTOCOL___PRPosterEditingEnvironment;
  uint64_t v12 = (void *)swift_dynamicCastObjCProtocolConditional();
  if (v12)
  {
    uint64_t v13 = &selRef_sourceContents;
  }
  else
  {
    v35[2] = &OBJC_PROTOCOL___PRPosterRenderingEnvironment;
    uint64_t v12 = (void *)swift_dynamicCastObjCProtocolConditional();
    if (!v12)
    {
      v35[0] = 0;
      v35[1] = (id)0xE000000000000000;
      sub_10000CD58(78);
      v36._object = (void *)0x800000010000FA50;
      v36._countAndFlagsBits = 0xD00000000000004CLL;
      sub_10000CC58(v36);
      uint64_t v34 = a1;
      swift_unknownObjectRetain();
      sub_10000576C((uint64_t *)&unk_100016910);
      v37._countAndFlagsBits = sub_10000CC38();
      sub_10000CC58(v37);
      swift_bridgeObjectRelease();
      uint64_t result = sub_10000CDF8();
      __break(1u);
      return result;
    }
    uint64_t v13 = &selRef_contents;
  }
  id v14 = [v12 *v13];
  unint64_t v15 = (void *)swift_unknownObjectRetain();
  sub_10000681C(v15, (uint64_t)v11);
  v35[0] = 0;
  id v16 = [v14 loadUserInfoWithError:v35];
  id v17 = v35[0];
  if (v16)
  {
    Swift::String v18 = v16;
    sub_10000CBF8();
    id v19 = v17;
  }
  else
  {
    uint64_t v32 = v5;
    uint64_t v33 = v4;
    id v20 = v35[0];
    sub_10000C8C8();

    swift_willThrow();
    sub_10000CA18();
    sub_10000C9E8();
    swift_errorRetain();
    swift_errorRetain();
    id v21 = sub_10000CB78();
    os_log_type_t v22 = sub_10000CD18();
    if (os_log_type_enabled(v21, v22))
    {
      uint64_t v23 = swift_slowAlloc();
      uint64_t v31 = a2;
      v24 = (uint8_t *)v23;
      v29 = (void *)swift_slowAlloc();
      v35[0] = v29;
      uint64_t v30 = v8;
      *(_DWORD *)v24 = 136446210;
      v28[1] = v24 + 4;
      swift_getErrorValue();
      uint64_t v25 = sub_10000CE88();
      uint64_t v34 = sub_10000A194(v25, v26, (uint64_t *)v35);
      uint64_t v8 = v30;
      sub_10000CD38();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v21, v22, "Error loading user info contents %{public}s", v24, 0xCu);
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
    (*(void (**)(char *, uint64_t))(v32 + 8))(v7, v33);
  }
  sub_10000CAD8();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

uint64_t type metadata accessor for ClockPosterExtensionController()
{
  return self;
}

void sub_100007414(void *a1, uint64_t a2)
{
  uint64_t v3 = v2;
  swift_getObjectType();
  sub_10000B1FC(a2, v3);
  uint64_t v6 = *(void **)(v3 + OBJC_IVAR____TtC20ClockPosterExtension39ClockPosterExtensionRenderingController_renderer);
  *(void *)(v3 + OBJC_IVAR____TtC20ClockPosterExtension39ClockPosterExtensionRenderingController_renderer) = a1;
  id v7 = a1;

  id v8 = [v7 foregroundView];
  id v9 = [v8 window];

  id v10 = [v9 rootViewController];
  id v14 = [v7 foregroundView];
  uint64_t v11 = OBJC_IVAR____TtC20ClockPosterExtension30ClockPosterExtensionController_clockFaceController;
  if (!*(void *)(v3 + OBJC_IVAR____TtC20ClockPosterExtension30ClockPosterExtensionController_clockFaceController))
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  swift_retain();
  sub_10000C988();
  swift_release();
  if (!*(void *)(v3 + v11))
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  swift_retain();
  sub_100007D48();
  sub_10000C928();
  swift_release();
  if (!*(void *)(v3 + v11))
  {
LABEL_13:
    __break(1u);
    return;
  }
  swift_retain();
  char v12 = sub_10000C938();
  swift_release();
  if (v12)
  {
    aBlock[4] = sub_10000766C;
    aBlock[5] = 0;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_10000767C;
    aBlock[3] = &unk_100010980;
    uint64_t v13 = _Block_copy(aBlock);
    swift_release();
    [v7 updatePreferences:v13];

    _Block_release(v13);
    if ((swift_isEscapingClosureAtFileLocation() & 1) == 0) {
      return;
    }
    __break(1u);
    goto LABEL_11;
  }
}

id sub_10000766C(void *a1)
{
  return [a1 setUserTapEventsRequested:1];
}

uint64_t sub_10000767C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void (**)(uint64_t, id))(a1 + 32);
  swift_unknownObjectRetain();
  id v6 = a3;
  v5(a2, v6);

  return swift_unknownObjectRelease();
}

uint64_t sub_1000078A4(double a1, double a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  *(double *)(v6 + 48) = a1;
  *(double *)(v6 + 56) = a2;
  *(void *)(v6 + 40) = a6;
  sub_10000CCE8();
  *(void *)(v6 + 64) = sub_10000CCD8();
  uint64_t v8 = sub_10000CCC8();
  return _swift_task_switch(sub_100007940, v8, v7);
}

uint64_t sub_100007940()
{
  swift_release();
  swift_beginAccess();
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    uint64_t v2 = (void *)result;
    if (!*(void *)(result + OBJC_IVAR____TtC20ClockPosterExtension30ClockPosterExtensionController_clockFaceController))
    {
      __break(1u);
      return result;
    }
    swift_retain();
    sub_10000C8D8();
    swift_release();
  }
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_100007A10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10000CD08();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_10000CCF8();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_1000062B8(a1, &qword_100016828);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_10000CCC8();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

id sub_100007D48()
{
  uint64_t v1 = sub_10000CB88();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v19 - v6;
  uint64_t v8 = *(void **)(v0 + OBJC_IVAR____TtC20ClockPosterExtension39ClockPosterExtensionRenderingController_renderer);
  if (!v8)
  {
    sub_10000CA18();
    sub_10000CA08();
    char v12 = sub_10000CB78();
    os_log_type_t v13 = sub_10000CD18();
    if (os_log_type_enabled(v12, v13))
    {
      id v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "Render is nil. Cannot set red mode.", v14, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v1);
    return 0;
  }
  id v9 = v8;
  id v10 = objc_msgSend(objc_msgSend(v9, "environment"), "ambientEnvironment");
  swift_unknownObjectRelease();
  if (!v10)
  {
    sub_10000CA18();
    sub_10000CA08();
    unint64_t v15 = sub_10000CB78();
    os_log_type_t v16 = sub_10000CD18();
    if (os_log_type_enabled(v15, v16))
    {
      id v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, v16, "Ambient enviroment is nil. Cannot set red mode.", v17, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v2 + 8))(v7, v1);
    return 0;
  }
  id v11 = [v10 isDisplayStyleRedMode];

  swift_unknownObjectRelease();
  return v11;
}

void sub_100007FE8()
{
}

id sub_100007FF8()
{
  return sub_100009CB4(type metadata accessor for ClockPosterExtensionRenderingController);
}

uint64_t type metadata accessor for ClockPosterExtensionRenderingController()
{
  return self;
}

uint64_t sub_1000084A0()
{
  uint64_t v1 = sub_10000CAB8();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = __chkstk_darwin(v1);
  uint64_t v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __chkstk_darwin(v3);
  uint64_t v8 = (char *)&v24 - v7;
  uint64_t result = __chkstk_darwin(v6);
  id v11 = (char *)&v24 - v10;
  uint64_t v12 = OBJC_IVAR____TtC20ClockPosterExtension30ClockPosterExtensionController_clockFaceController;
  if (*(void *)(v0 + OBJC_IVAR____TtC20ClockPosterExtension30ClockPosterExtensionController_clockFaceController))
  {
    swift_retain();
    unint64_t v13 = sub_10000C908();
    uint64_t result = swift_release();
    if (*(void *)(v0 + v12))
    {
      swift_bridgeObjectRetain();
      swift_retain();
      sub_10000C958();
      swift_release();
      uint64_t v30 = *(void *)(v13 + 16);
      if (v30)
      {
        uint64_t v25 = v5;
        unint64_t v14 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
        unint64_t v15 = v13 + v14;
        unint64_t v16 = v13;
        unint64_t v13 = v2 + 16;
        v29 = *(void (**)(char *, unint64_t, uint64_t))(v2 + 16);
        v29(v8, v15, v1);
        uint64_t v17 = sub_10000C570(&qword_1000167F8, (void (*)(uint64_t))&type metadata accessor for ClockFaceLook);
        unint64_t v27 = v16;
        swift_bridgeObjectRetain();
        uint64_t v31 = v11;
        uint64_t v28 = v17;
        LOBYTE(v16) = sub_10000CC08();
        uint64_t v26 = v2;
        Swift::String v18 = *(void (**)(char *, uint64_t))(v2 + 8);
        v18(v8, v1);
        if (v16)
        {
LABEL_5:
          unint64_t v13 = v27;
          swift_bridgeObjectRelease_n();
          v18(v31, v1);
          return v13;
        }
        if (v30 != 1)
        {
          unint64_t v24 = v13 & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
          id v11 = *(char **)(v26 + 72);
          uint64_t v5 = &v11[v27 + v14];
          uint64_t v2 = 1;
          uint64_t v19 = (void (*)(char *, char *, uint64_t))v29;
          while (1)
          {
            v19(v8, v5, v1);
            uint64_t v20 = v2 + 1;
            if (__OFADD__(v2, 1)) {
              break;
            }
            char v21 = sub_10000CC08();
            v18(v8, v1);
            if (v21) {
              goto LABEL_5;
            }
            ++v2;
            uint64_t v5 = &v11[(void)v5];
            uint64_t v19 = (void (*)(char *, char *, uint64_t))v29;
            if (v20 == v30)
            {
              unint64_t v13 = v27;
              swift_bridgeObjectRelease_n();
              uint64_t v5 = v25;
              uint64_t v2 = v26;
              id v11 = v31;
              v19(v25, v31, v1);
              goto LABEL_14;
            }
          }
          __break(1u);
          goto LABEL_20;
        }
        unint64_t v13 = v27;
        swift_bridgeObjectRelease_n();
        uint64_t v5 = v25;
        uint64_t v2 = v26;
        id v11 = v31;
        v29(v25, (unint64_t)v31, v1);
      }
      else
      {
        swift_bridgeObjectRelease();
        (*(void (**)(char *, char *, uint64_t))(v2 + 16))(v5, v11, v1);
      }
LABEL_14:
      if (swift_isUniquelyReferenced_nonNull_native())
      {
LABEL_15:
        unint64_t v23 = *(void *)(v13 + 16);
        unint64_t v22 = *(void *)(v13 + 24);
        if (v23 >= v22 >> 1) {
          unint64_t v13 = sub_100009F2C(v22 > 1, v23 + 1, 1, v13);
        }
        *(void *)(v13 + 16) = v23 + 1;
        (*(void (**)(unint64_t, char *, uint64_t))(v2 + 32))(v13+ ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80))+ *(void *)(v2 + 72) * v23, v5, v1);
        (*(void (**)(char *, uint64_t))(v2 + 8))(v11, v1);
        return v13;
      }
LABEL_20:
      unint64_t v13 = sub_100009F2C(0, *(void *)(v13 + 16) + 1, 1, v13);
      goto LABEL_15;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_1000088A4()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_10000CAB8();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  v58 = (char *)&v48 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v48 - v6;
  if (!*(void *)(v0 + OBJC_IVAR____TtC20ClockPosterExtension30ClockPosterExtensionController_clockFaceController)) {
    goto LABEL_24;
  }
  swift_retain();
  sub_10000C958();
  swift_release();
  id v8 = [objc_allocWithZone((Class)PREditorContentStylePickerConfiguration) init];
  [v8 setSelectedStyle:sub_100008F14()];
  swift_unknownObjectRelease();
  unint64_t v60 = (unint64_t)&_swiftEmptyArrayStorage;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = &_swiftEmptyDictionarySingleton;
  uint64_t v10 = sub_1000084A0();
  uint64_t v11 = *(void *)(v10 + 16);
  uint64_t v56 = v9;
  if (v11)
  {
    uint64_t v49 = v0;
    id v50 = v8;
    v51 = v7;
    uint64_t v52 = v3;
    unint64_t v12 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
    uint64_t v48 = v10;
    unint64_t v13 = v10 + v12;
    uint64_t v57 = *(void *)(v3 + 72);
    v54 = (void (**)(unint64_t, char *, uint64_t))(v3 + 32);
    v55 = (void (**)(char *, unint64_t, uint64_t))(v3 + 16);
    v53 = (void (**)(unint64_t, char *, uint64_t))(v3 + 40);
    while (1)
    {
      id v14 = objc_msgSend(sub_100008F14(), "identifier", v48);
      uint64_t v15 = sub_10000CC28();
      uint64_t v17 = v16;

      uint64_t v18 = v2;
      (*v55)(v58, v13, v2);
      uint64_t v19 = *(void *)(v9 + 16);
      int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      aBlock[0] = v19;
      *(void *)(v9 + 16) = 0x8000000000000000;
      unint64_t v22 = sub_10000A7EC(v15, v17);
      uint64_t v23 = *(void *)(v19 + 16);
      BOOL v24 = (v21 & 1) == 0;
      uint64_t v25 = v23 + v24;
      if (__OFADD__(v23, v24))
      {
        __break(1u);
LABEL_23:
        __break(1u);
LABEL_24:
        __break(1u);
LABEL_25:
        __break(1u);
LABEL_26:
        uint64_t result = sub_10000CE78();
        __break(1u);
        return result;
      }
      char v26 = v21;
      if (*(void *)(v19 + 24) >= v25)
      {
        if (isUniquelyReferenced_nonNull_native)
        {
          v29 = (void *)aBlock[0];
          if (v21) {
            goto LABEL_11;
          }
        }
        else
        {
          sub_10000AD30();
          v29 = (void *)aBlock[0];
          if (v26) {
            goto LABEL_11;
          }
        }
      }
      else
      {
        sub_10000A864(v25, isUniquelyReferenced_nonNull_native);
        unint64_t v27 = sub_10000A7EC(v15, v17);
        if ((v26 & 1) != (v28 & 1)) {
          goto LABEL_26;
        }
        unint64_t v22 = v27;
        v29 = (void *)aBlock[0];
        if (v26)
        {
LABEL_11:
          uint64_t v2 = v18;
          (*v53)(v29[7] + v22 * v57, v58, v18);
          goto LABEL_15;
        }
      }
      v29[(v22 >> 6) + 8] |= 1 << v22;
      uint64_t v30 = (uint64_t *)(v29[6] + 16 * v22);
      *uint64_t v30 = v15;
      v30[1] = v17;
      uint64_t v2 = v18;
      (*v54)(v29[7] + v22 * v57, v58, v18);
      uint64_t v31 = v29[2];
      BOOL v32 = __OFADD__(v31, 1);
      uint64_t v33 = v31 + 1;
      if (v32) {
        goto LABEL_23;
      }
      v29[2] = v33;
      swift_bridgeObjectRetain();
LABEL_15:
      uint64_t v9 = v56;
      *(void *)(v56 + 16) = aBlock[0];
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_unknownObjectRetain();
      sub_10000CC78();
      if (*(void *)((v60 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v60 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_10000CCA8();
      }
      sub_10000CCB8();
      sub_10000CC98();
      swift_unknownObjectRelease();
      v13 += v57;
      if (!--v11)
      {
        swift_bridgeObjectRelease();
        uint64_t v7 = v51;
        uint64_t v3 = v52;
        uint64_t v1 = v49;
        id v8 = v50;
        goto LABEL_20;
      }
    }
  }
  swift_bridgeObjectRelease();
LABEL_20:
  id v34 = objc_allocWithZone((Class)PREditorContentStylePalette);
  swift_bridgeObjectRetain();
  sub_10000576C(&qword_1000167C0);
  Class isa = sub_10000CC88().super.isa;
  swift_bridgeObjectRelease();
  id v36 = [v34 initWithContentStyles:isa localizedName:0];

  [v8 setStylePalette:v36];
  Swift::String v37 = (objc_class *)[self mainBundle];
  v47._countAndFlagsBits = 0x800000010000F690;
  v61._object = (void *)0x800000010000F670;
  v61._countAndFlagsBits = 0xD000000000000012;
  v62.value._countAndFlagsBits = 0;
  v62.value._object = 0;
  v38.super.Class isa = v37;
  v63._countAndFlagsBits = 0;
  v63._object = (void *)0xE000000000000000;
  sub_10000C8B8(v61, v62, v38, v63, v47);

  NSString v39 = sub_10000CC18();
  swift_bridgeObjectRelease();
  [v8 setPrompt:v39];

  v40 = *(void **)(v1 + OBJC_IVAR____TtC20ClockPosterExtension37ClockPosterExtensionEditingController_editor);
  if (!v40) {
    goto LABEL_25;
  }
  uint64_t v41 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v42 = swift_allocObject();
  uint64_t v43 = v56;
  *(void *)(v42 + 16) = v41;
  *(void *)(v42 + 24) = v43;
  aBlock[4] = sub_10000B06C;
  aBlock[5] = v42;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100009BB8;
  aBlock[3] = &unk_100010958;
  v44 = _Block_copy(aBlock);
  id v45 = v40;
  swift_retain();
  swift_release();
  [v45 presentContentStylePickerWithConfiguration:v8 changeHandler:v44];
  _Block_release(v44);

  (*(void (**)(char *, uint64_t))(v3 + 8))(v7, v2);
  swift_release();
  return swift_bridgeObjectRelease();
}

id sub_100008F14()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_10000CAB8();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (long long *)((char *)v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(long long *, uint64_t, uint64_t))(v3 + 16))(v5, v1, v2);
  int v6 = (*(uint64_t (**)(long long *, uint64_t))(v3 + 88))(v5, v2);
  if (v6 == enum case for ClockFaceLook.color(_:))
  {
    (*(void (**)(long long *, uint64_t))(v3 + 96))(v5, v2);
    swift_bridgeObjectRelease();
    sub_10000B0EC(v5, (uint64_t)v30);
    sub_10000576C(&qword_1000167E0);
    uint64_t v7 = swift_allocObject();
    *(_OWORD *)(v7 + 16) = xmmword_10000D570;
    sub_10000B104(v30, v31);
    *(void *)(v7 + 32) = sub_10000CAC8();
    v29[0] = v7;
    sub_10000CC98();
    id v8 = objc_allocWithZone((Class)PRPosterContentDiscreteColorsStyle);
    sub_10000C534(0, &qword_1000167E8);
    Class isa = sub_10000CC88().super.isa;
    swift_bridgeObjectRelease();
    id v10 = [v8 initWithOpaqueColors:isa];

LABEL_8:
    sub_10000B148((uint64_t)v30);
    return v10;
  }
  if (v6 == enum case for ClockFaceLook.gradient(_:))
  {
    (*(void (**)(long long *, uint64_t))(v3 + 96))(v5, v2);
    uint64_t v11 = *(void *)v5;
    swift_bridgeObjectRelease();
    uint64_t v12 = *(void *)(v11 + 16);
    if (v12 == 2)
    {
      v29[0] = &_swiftEmptyArrayStorage;
      sub_10000CDB8();
      sub_10000B198(v11 + 32, (uint64_t)v30);
      sub_10000B104(v30, v31);
      sub_10000CAC8();
      sub_10000B148((uint64_t)v30);
      sub_10000CD98();
      sub_10000CDC8();
      sub_10000CDD8();
      sub_10000CDA8();
      sub_10000B198(v11 + 72, (uint64_t)v30);
      sub_10000B104(v30, v31);
      sub_10000CAC8();
      sub_10000B148((uint64_t)v30);
      sub_10000CD98();
      sub_10000CDC8();
      sub_10000CDD8();
      sub_10000CDA8();
      swift_bridgeObjectRelease();
      id v13 = objc_allocWithZone((Class)PRPosterContentGradientStyle);
      sub_10000C534(0, &qword_1000167E8);
      Class v14 = sub_10000CC88().super.isa;
      swift_bridgeObjectRelease();
      id v10 = [v13 initWithColors:v14];

      return v10;
    }
    unint64_t v19 = (unint64_t)&_swiftEmptyArrayStorage;
    if (v12)
    {
      v29[0] = &_swiftEmptyArrayStorage;
      sub_10000CDB8();
      uint64_t v20 = v11 + 32;
      uint64_t v21 = v12;
      do
      {
        sub_10000B198(v20, (uint64_t)v30);
        sub_10000B104(v30, v31);
        sub_10000CAC8();
        sub_10000B148((uint64_t)v30);
        sub_10000CD98();
        sub_10000CDC8();
        sub_10000CDD8();
        sub_10000CDA8();
        v20 += 40;
        --v21;
      }
      while (v21);
    }
    double v22 = 1.0 / (double)v12;
    v30[0] = &_swiftEmptyArrayStorage;
    swift_bridgeObjectRelease();
    if (v12)
    {
      double v23 = v22 * 0.5;
      do
      {
        [objc_allocWithZone((Class)NSNumber) initWithDouble:v23];
        sub_10000CC78();
        if (*(void *)((v30[0] & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v30[0] & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_10000CCA8();
        }
        sub_10000CCB8();
        sub_10000CC98();
        double v23 = v22 + v23;
        --v12;
      }
      while (v12);
      unint64_t v19 = v30[0];
    }
    if ((v19 & 0xC000000000000001) != 0)
    {
      sub_10000CD78();
    }
    else
    {
      if (!*(void *)((v19 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
        __break(1u);
        goto LABEL_30;
      }
      id v24 = *(id *)(v19 + 32);
    }
    sub_10000CC78();
    if (*(void *)((v30[0] & 0xFFFFFFFFFFFFFF8) + 0x10) < *(void *)((v30[0] & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    {
LABEL_27:
      sub_10000CCB8();
      sub_10000CC98();
      id v25 = objc_allocWithZone((Class)PRPosterContentGradientStyle);
      sub_10000C534(0, &qword_1000167E8);
      swift_bridgeObjectRetain();
      Class v26 = sub_10000CC88().super.isa;
      swift_bridgeObjectRelease();
      sub_10000C534(0, &qword_1000167F0);
      Class v27 = sub_10000CC88().super.isa;
      swift_bridgeObjectRelease();
      id v10 = objc_msgSend(v25, "initWithColors:gradientType:locations:startPoint:endPoint:", v26, 2, v27, 0.5, 0.5, 1.0, v22 * 0.5);

      swift_bridgeObjectRelease();
      return v10;
    }
LABEL_30:
    sub_10000CCA8();
    goto LABEL_27;
  }
  if (v6 == enum case for ClockFaceLook.splitTone(_:))
  {
    (*(void (**)(long long *, uint64_t))(v3 + 96))(v5, v2);
    swift_bridgeObjectRelease();
    sub_10000B0EC(v5, (uint64_t)v30);
    sub_10000B0EC((long long *)((char *)v5 + 40), (uint64_t)v29);
    sub_10000576C(&qword_1000167E0);
    uint64_t v15 = swift_allocObject();
    *(_OWORD *)(v15 + 16) = xmmword_10000D560;
    sub_10000B104(v30, v31);
    *(void *)(v15 + 32) = sub_10000CAC8();
    sub_10000B104(v29, v29[3]);
    *(void *)(v15 + 40) = sub_10000CAC8();
    v28[1] = v15;
    sub_10000CC98();
    id v16 = objc_allocWithZone((Class)PRPosterContentDiscreteColorsStyle);
    sub_10000C534(0, &qword_1000167E8);
    Class v17 = sub_10000CC88().super.isa;
    swift_bridgeObjectRelease();
    id v10 = [v16 initWithOpaqueColors:v17];

    sub_10000B148((uint64_t)v29);
    goto LABEL_8;
  }
  if (v6 != enum case for ClockFaceLook.uncustomizable(_:)) {
    (*(void (**)(long long *, uint64_t))(v3 + 8))(v5, v2);
  }
  return [objc_allocWithZone((Class)PRPosterContentDiscreteColorsStyle) init];
}

uint64_t sub_1000096A0(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = sub_10000CB88();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v38 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_10000576C(&qword_1000167D0);
  __chkstk_darwin(v10 - 8);
  uint64_t v12 = (char *)&v38 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_10000CAB8();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = __chkstk_darwin(v13);
  uint64_t v43 = (char *)&v38 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  v44 = (char *)&v38 - v17;
  swift_beginAccess();
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    unint64_t v19 = (char *)result;
    uint64_t v41 = v6;
    uint64_t v42 = v9;
    NSString v39 = a1;
    uint64_t v40 = v7;
    id v20 = [a1 identifier];
    uint64_t v21 = sub_10000CC28();
    uint64_t v23 = v22;

    swift_beginAccess();
    uint64_t v24 = *(void *)(a4 + 16);
    if (*(void *)(v24 + 16) && (unint64_t v25 = sub_10000A7EC(v21, v23), (v26 & 1) != 0))
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v14 + 16))(v12, *(void *)(v24 + 56) + *(void *)(v14 + 72) * v25, v13);
      uint64_t v27 = 0;
    }
    else
    {
      uint64_t v27 = 1;
    }
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56))(v12, v27, 1, v13);
    swift_bridgeObjectRelease();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13) == 1)
    {
      sub_1000062B8((uint64_t)v12, &qword_1000167D0);
      swift_endAccess();
      sub_10000CA18();
      char v28 = v42;
      sub_10000C9E8();
      v29 = v39;
      swift_unknownObjectRetain_n();
      uint64_t v30 = sub_10000CB78();
      os_log_type_t v31 = sub_10000CD18();
      if (os_log_type_enabled(v30, v31))
      {
        BOOL v32 = (uint8_t *)swift_slowAlloc();
        v46[0] = swift_slowAlloc();
        *(_DWORD *)BOOL v32 = 136446210;
        v44 = (char *)(v32 + 4);
        id v33 = [v29 identifier];
        uint64_t v34 = sub_10000CC28();
        unint64_t v36 = v35;

        uint64_t v45 = sub_10000A194(v34, v36, v46);
        sub_10000CD38();
        swift_unknownObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v30, v31, "Unknown style provided back from content style picker. Identifier='%{public}s'. Editor failed to take effect.", v32, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        return (*(uint64_t (**)(char *, uint64_t))(v40 + 8))(v42, v41);
      }
      else
      {

        swift_unknownObjectRelease_n();
        return (*(uint64_t (**)(char *, uint64_t))(v40 + 8))(v28, v41);
      }
    }
    else
    {
      Swift::String v37 = v44;
      (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v44, v12, v13);
      uint64_t result = swift_endAccess();
      if (*(void *)&v19[OBJC_IVAR____TtC20ClockPosterExtension30ClockPosterExtensionController_clockFaceController])
      {
        (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v43, v37, v13);
        swift_retain();
        sub_10000C968();

        swift_release();
        return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v37, v13);
      }
      else
      {
        __break(1u);
      }
    }
  }
  return result;
}

uint64_t sub_100009BB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void (**)(uint64_t, uint64_t))(a1 + 32);
  swift_retain();
  uint64_t v5 = swift_unknownObjectRetain();
  v4(v5, a3);
  swift_release();

  return swift_unknownObjectRelease();
}

id sub_100009C40(char *a1, uint64_t a2, void *a3, uint64_t (*a4)(void))
{
  *(void *)&a1[*a3] = 0;
  v5.receiver = a1;
  v5.super_class = (Class)a4();
  return objc_msgSendSuper2(&v5, "init");
}

void sub_100009C8C()
{
}

id sub_100009C9C()
{
  return sub_100009CB4(type metadata accessor for ClockPosterExtensionEditingController);
}

id sub_100009CB4(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, "dealloc");
}

uint64_t type metadata accessor for ClockPosterExtensionEditingController()
{
  return self;
}

uint64_t sub_100009D20()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100009D58(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_100009E34;
  return v6(a1);
}

uint64_t sub_100009E34()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100009F2C(char a1, int64_t a2, char a3, unint64_t a4)
{
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
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
    uint64_t v13 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_10000576C(&qword_100016800);
  uint64_t v10 = *(void *)(sub_10000CAB8() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t v14 = j__malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (BOOL v15 = v11 == -1) : (BOOL v15 = 0), v15))
  {
LABEL_29:
    uint64_t result = sub_10000CDE8();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(sub_10000CAB8() - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  unint64_t v18 = (unint64_t)v13 + v17;
  if (a1)
  {
    if ((unint64_t)v13 < a4 || v18 >= a4 + v17 + *(void *)(v16 + 72) * v8)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != (void *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_10000C030(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

uint64_t sub_10000A194(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_10000A268(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10000B08C((uint64_t)v12, *a3);
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
      sub_10000B08C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_10000B148((uint64_t)v12);
  return v7;
}

uint64_t sub_10000A268(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_10000CD48();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_10000A424(a5, a6);
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
  uint64_t v8 = sub_10000CD88();
  if (!v8)
  {
    sub_10000CDE8();
    __break(1u);
LABEL_17:
    uint64_t result = sub_10000CE48();
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

uint64_t sub_10000A424(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_10000A4BC(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_10000A69C(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_10000A69C(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_10000A4BC(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_10000A634(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_10000CD68();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_10000CDE8();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_10000CC68();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_10000CE48();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_10000CDE8();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_10000A634(uint64_t a1, uint64_t a2)
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
  sub_10000576C(&qword_1000167D8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_10000A69C(char a1, int64_t a2, char a3, char *a4)
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
    sub_10000576C(&qword_1000167D8);
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
  uint64_t result = sub_10000CE48();
  __break(1u);
  return result;
}

unint64_t sub_10000A7EC(uint64_t a1, uint64_t a2)
{
  sub_10000CE98();
  sub_10000CC48();
  Swift::Int v4 = sub_10000CEA8();

  return sub_10000AC4C(a1, a2, v4);
}

uint64_t sub_10000A864(uint64_t a1, int a2)
{
  unint64_t v3 = v2;
  uint64_t v49 = sub_10000CAB8();
  uint64_t v5 = *(void *)(v49 - 8);
  __chkstk_darwin(v49);
  uint64_t v48 = (char *)&v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *v2;
  sub_10000576C(&qword_1000167C8);
  int v47 = a2;
  uint64_t v8 = sub_10000CE38();
  uint64_t v9 = v8;
  if (!*(void *)(v7 + 16)) {
    goto LABEL_41;
  }
  uint64_t v10 = 1 << *(unsigned char *)(v7 + 32);
  uint64_t v11 = *(void *)(v7 + 64);
  v44 = (void *)(v7 + 64);
  if (v10 < 64) {
    uint64_t v12 = ~(-1 << v10);
  }
  else {
    uint64_t v12 = -1;
  }
  unint64_t v13 = v12 & v11;
  uint64_t v42 = v2;
  int64_t v43 = (unint64_t)(v10 + 63) >> 6;
  uint64_t v45 = (void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  uint64_t v46 = v5;
  size_t v14 = (void (**)(char *, uint64_t, uint64_t))(v5 + 32);
  uint64_t v15 = v8 + 64;
  uint64_t result = swift_retain();
  int64_t v17 = 0;
  while (1)
  {
    if (v13)
    {
      unint64_t v20 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v21 = v20 | (v17 << 6);
      goto LABEL_22;
    }
    int64_t v22 = v17 + 1;
    if (__OFADD__(v17, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v22 >= v43) {
      break;
    }
    uint64_t v23 = v44;
    unint64_t v24 = v44[v22];
    ++v17;
    if (!v24)
    {
      int64_t v17 = v22 + 1;
      if (v22 + 1 >= v43) {
        goto LABEL_34;
      }
      unint64_t v24 = v44[v17];
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v43)
        {
LABEL_34:
          swift_release();
          unint64_t v3 = v42;
          if ((v47 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v24 = v44[v25];
        if (!v24)
        {
          while (1)
          {
            int64_t v17 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_43;
            }
            if (v17 >= v43) {
              goto LABEL_34;
            }
            unint64_t v24 = v44[v17];
            ++v25;
            if (v24) {
              goto LABEL_21;
            }
          }
        }
        int64_t v17 = v25;
      }
    }
LABEL_21:
    unint64_t v13 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v17 << 6);
LABEL_22:
    uint64_t v26 = *(void *)(v7 + 56);
    uint64_t v27 = v7;
    char v28 = (uint64_t *)(*(void *)(v7 + 48) + 16 * v21);
    uint64_t v29 = *v28;
    uint64_t v30 = v28[1];
    uint64_t v31 = *(void *)(v46 + 72);
    uint64_t v32 = v26 + v31 * v21;
    if (v47)
    {
      (*v14)(v48, v32, v49);
    }
    else
    {
      (*v45)(v48, v32, v49);
      swift_bridgeObjectRetain();
    }
    sub_10000CE98();
    sub_10000CC48();
    uint64_t result = sub_10000CEA8();
    uint64_t v33 = -1 << *(unsigned char *)(v9 + 32);
    unint64_t v34 = result & ~v33;
    unint64_t v35 = v34 >> 6;
    if (((-1 << v34) & ~*(void *)(v15 + 8 * (v34 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v34) & ~*(void *)(v15 + 8 * (v34 >> 6)))) | v34 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v36 = 0;
      unint64_t v37 = (unint64_t)(63 - v33) >> 6;
      do
      {
        if (++v35 == v37 && (v36 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v38 = v35 == v37;
        if (v35 == v37) {
          unint64_t v35 = 0;
        }
        v36 |= v38;
        uint64_t v39 = *(void *)(v15 + 8 * v35);
      }
      while (v39 == -1);
      unint64_t v18 = __clz(__rbit64(~v39)) + (v35 << 6);
    }
    *(void *)(v15 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    unint64_t v19 = (void *)(*(void *)(v9 + 48) + 16 * v18);
    *unint64_t v19 = v29;
    v19[1] = v30;
    uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))*v14)(*(void *)(v9 + 56) + v31 * v18, v48, v49);
    ++*(void *)(v9 + 16);
    uint64_t v7 = v27;
  }
  swift_release();
  unint64_t v3 = v42;
  uint64_t v23 = v44;
  if ((v47 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v40 = 1 << *(unsigned char *)(v7 + 32);
  if (v40 >= 64) {
    bzero(v23, ((unint64_t)(v40 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v23 = -1 << v40;
  }
  *(void *)(v7 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *unint64_t v3 = v9;
  return result;
}

unint64_t sub_10000AC4C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_10000CE58() & 1) == 0)
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
      while (!v14 && (sub_10000CE58() & 1) == 0);
    }
  }
  return v6;
}

void *sub_10000AD30()
{
  uint64_t v35 = sub_10000CAB8();
  uint64_t v1 = *(void *)(v35 - 8);
  __chkstk_darwin(v35);
  uint64_t v3 = (char *)&v29 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000576C(&qword_1000167C8);
  uint64_t v30 = v0;
  uint64_t v4 = *v0;
  uint64_t v5 = sub_10000CE28();
  uint64_t v6 = *(void *)(v4 + 16);
  uint64_t v36 = v5;
  if (!v6)
  {
    uint64_t result = (void *)swift_release();
    uint64_t v28 = v36;
    uint64_t v27 = v30;
LABEL_25:
    *uint64_t v27 = v28;
    return result;
  }
  uint64_t v7 = v5;
  uint64_t result = (void *)(v5 + 64);
  unint64_t v9 = (unint64_t)((1 << *(unsigned char *)(v7 + 32)) + 63) >> 6;
  if (v7 != v4 || (unint64_t)result >= v4 + 64 + 8 * v9)
  {
    uint64_t result = memmove(result, (const void *)(v4 + 64), 8 * v9);
    uint64_t v7 = v36;
  }
  int64_t v10 = 0;
  *(void *)(v7 + 16) = *(void *)(v4 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v4 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v4 + 64);
  uint64_t v31 = v4 + 64;
  int64_t v32 = (unint64_t)(v11 + 63) >> 6;
  uint64_t v33 = v1 + 32;
  uint64_t v34 = v1 + 16;
  uint64_t v14 = v35;
  while (1)
  {
    if (v13)
    {
      unint64_t v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v16 = v15 | (v10 << 6);
      goto LABEL_9;
    }
    int64_t v24 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v24 >= v32) {
      goto LABEL_23;
    }
    unint64_t v25 = *(void *)(v31 + 8 * v24);
    ++v10;
    if (!v25)
    {
      int64_t v10 = v24 + 1;
      if (v24 + 1 >= v32) {
        goto LABEL_23;
      }
      unint64_t v25 = *(void *)(v31 + 8 * v10);
      if (!v25) {
        break;
      }
    }
LABEL_22:
    unint64_t v13 = (v25 - 1) & v25;
    unint64_t v16 = __clz(__rbit64(v25)) + (v10 << 6);
LABEL_9:
    uint64_t v17 = 16 * v16;
    unint64_t v18 = (uint64_t *)(*(void *)(v4 + 48) + 16 * v16);
    uint64_t v19 = *v18;
    uint64_t v20 = v18[1];
    unint64_t v21 = *(void *)(v1 + 72) * v16;
    (*(void (**)(char *, unint64_t, uint64_t))(v1 + 16))(v3, *(void *)(v4 + 56) + v21, v14);
    uint64_t v22 = v36;
    uint64_t v23 = (void *)(*(void *)(v36 + 48) + v17);
    *uint64_t v23 = v19;
    v23[1] = v20;
    (*(void (**)(unint64_t, char *, uint64_t))(v1 + 32))(*(void *)(v22 + 56) + v21, v3, v14);
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v26 = v24 + 2;
  if (v26 >= v32)
  {
LABEL_23:
    uint64_t result = (void *)swift_release();
    uint64_t v27 = v30;
    uint64_t v28 = v36;
    goto LABEL_25;
  }
  unint64_t v25 = *(void *)(v31 + 8 * v26);
  if (v25)
  {
    int64_t v10 = v26;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v10 = v26 + 1;
    if (__OFADD__(v26, 1)) {
      break;
    }
    if (v10 >= v32) {
      goto LABEL_23;
    }
    unint64_t v25 = *(void *)(v31 + 8 * v10);
    ++v26;
    if (v25) {
      goto LABEL_22;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_10000AFF4()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10000B02C()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000B06C(void *a1, uint64_t a2)
{
  return sub_1000096A0(a1, a2, *(void *)(v2 + 16), *(void *)(v2 + 24));
}

uint64_t sub_10000B074(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10000B084()
{
  return swift_release();
}

uint64_t sub_10000B08C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10000B0EC(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

void *sub_10000B104(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_10000B148(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_10000B198(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10000B1FC(uint64_t a1, uint64_t a2)
{
  uint64_t v26 = a2;
  uint64_t v3 = sub_10000576C((uint64_t *)&unk_1000165C0);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = sub_10000C9C8();
  uint64_t v6 = *(void *)(v27 - 8);
  __chkstk_darwin(v27);
  uint64_t v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_10000576C(&qword_100016820);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = sub_10000CB18();
  uint64_t v12 = *(void *)(v29 - 8);
  uint64_t v13 = __chkstk_darwin(v29);
  uint64_t v28 = (char *)&v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  unint64_t v16 = (char *)&v25 - v15;
  sub_100006EF4(a1, (uint64_t)&v25 - v15);
  sub_10000CA18();
  sub_10000C9A8();
  uint64_t v30 = &OBJC_PROTOCOL___PREditingDelegate;
  uint64_t v17 = swift_dynamicCastObjCProtocolConditional();
  uint64_t v18 = sub_10000C9D8();
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v20 = (unsigned int *)&enum case for ClockLogger.Role.render(_:);
  if (v17) {
    uint64_t v20 = (unsigned int *)&enum case for ClockLogger.Role.edit(_:);
  }
  (*(void (**)(char *, void, uint64_t))(*(void *)(v18 - 8) + 104))(v11, *v20, v18);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v19 + 56))(v11, 0, 1, v18);
  uint64_t v21 = v27;
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, enum case for ClockLogger.Host.ambient(_:), v27);
  sub_10000CAF8();
  uint64_t v22 = sub_10000CA98();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v5, 0, 1, v22);
  sub_10000C9B8();
  swift_release();
  sub_1000062B8((uint64_t)v5, (uint64_t *)&unk_1000165C0);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v21);
  sub_1000062B8((uint64_t)v11, &qword_100016820);
  uint64_t v23 = v29;
  (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v28, v16, v29);
  sub_10000C998();
  swift_allocObject();
  *(void *)(v26 + OBJC_IVAR____TtC20ClockPosterExtension30ClockPosterExtensionController_clockFaceController) = sub_10000C978();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v16, v23);
}

void sub_10000B604(char *a1, char *a2)
{
  uint64_t v4 = sub_10000CAB8();
  __chkstk_darwin(v4 - 8);
  uint64_t v49 = (char *)v40 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10000CB88();
  uint64_t v45 = *(void *)(v6 - 8);
  uint64_t v46 = v6;
  __chkstk_darwin(v6);
  uint64_t v48 = (char *)v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_10000CA98();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v12 = (char *)v40 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)v40 - v13;
  uint64_t v51 = sub_10000CB18();
  uint64_t v15 = *(void *)(v51 - 8);
  uint64_t v16 = __chkstk_darwin(v51);
  int v47 = (char *)v40 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  uint64_t v19 = (char *)v40 - v18;
  sub_100006EF4((uint64_t)a1, (uint64_t)v40 - v18);
  sub_10000CAF8();
  uint64_t v50 = OBJC_IVAR____TtC20ClockPosterExtension30ClockPosterExtensionController_clockFaceController;
  uint64_t v52 = a2;
  if (!*(void *)&a2[OBJC_IVAR____TtC20ClockPosterExtension30ClockPosterExtensionController_clockFaceController])
  {
    __break(1u);
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  swift_retain();
  sub_10000C948();
  swift_release();
  sub_10000C570((unint64_t *)&unk_100016810, (void (*)(uint64_t))&type metadata accessor for ClockFaceKind);
  char v20 = sub_10000CC08();
  uint64_t v21 = *(void (**)(char *, uint64_t))(v9 + 8);
  v21(v12, v8);
  v21(v14, v8);
  uint64_t v22 = v51;
  if (v20)
  {
LABEL_7:
    a1 = *(char **)&v52[v50];
    if (a1)
    {
      swift_retain();
      sub_10000CB08();
      sub_10000C968();
      swift_release();
      (*(void (**)(char *, uint64_t))(v15 + 8))(v19, v22);
      return;
    }
    goto LABEL_10;
  }
  sub_10000CA18();
  uint64_t v23 = v48;
  sub_10000C9E8();
  int64_t v24 = *(void (**)(char *, char *, uint64_t))(v15 + 16);
  uint64_t v44 = v15;
  uint64_t v25 = v47;
  v24(v47, v19, v22);
  uint64_t v26 = v52;
  uint64_t v27 = sub_10000CB78();
  int v43 = sub_10000CD28();
  if (!os_log_type_enabled(v27, (os_log_type_t)v43))
  {

    uint64_t v39 = v44;
    (*(void (**)(char *, uint64_t))(v44 + 8))(v25, v22);

    (*(void (**)(char *, uint64_t))(v45 + 8))(v23, v46);
    uint64_t v15 = v39;
    goto LABEL_7;
  }
  a1 = v26;
  os_log_t v42 = v27;
  uint64_t v28 = swift_slowAlloc();
  uint64_t v41 = swift_slowAlloc();
  uint64_t v54 = v41;
  *(_DWORD *)uint64_t v28 = 136446466;
  if (*(void *)&v52[v50])
  {
    swift_retain();
    sub_10000C948();
    swift_release();
    uint64_t v29 = sub_10000CA88();
    unint64_t v31 = v30;
    v21(v12, v8);
    uint64_t v53 = sub_10000A194(v29, v31, &v54);
    v40[1] = &v54;
    sub_10000CD38();

    swift_bridgeObjectRelease();
    *(_WORD *)(v28 + 12) = 2082;
    int64_t v32 = v47;
    sub_10000CAF8();
    uint64_t v33 = sub_10000CA88();
    unint64_t v35 = v34;
    v21(v12, v8);
    uint64_t v53 = sub_10000A194(v33, v35, &v54);
    sub_10000CD38();
    swift_bridgeObjectRelease();
    uint64_t v36 = v32;
    uint64_t v15 = v44;
    uint64_t v37 = v51;
    (*(void (**)(char *, uint64_t))(v44 + 8))(v36, v51);
    os_log_t v38 = v42;
    _os_log_impl((void *)&_mh_execute_header, v42, (os_log_type_t)v43, "Cannot change kind when switching configuration from %{public}s to %{public}s", (uint8_t *)v28, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v22 = v37;
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v45 + 8))(v48, v46);
    goto LABEL_7;
  }
LABEL_11:

  __break(1u);
}

id sub_10000BC1C(uint64_t a1, void *a2)
{
  uint64_t v3 = sub_10000CB88();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v24 - v8;
  if (sub_10000CAE8())
  {
    id v10 = [a2 targetConfiguration];
    Class isa = sub_10000CBE8().super.isa;
    swift_bridgeObjectRelease();
    id v27 = 0;
    unsigned int v12 = [v10 storeUserInfo:isa error:&v27];

    id v13 = v27;
    if (v12)
    {
      return v13;
    }
    else
    {
      id v25 = v27;
      id v18 = v27;
      sub_10000C8C8();

      swift_willThrow();
      sub_10000CA18();
      sub_10000C9E8();
      swift_errorRetain();
      swift_errorRetain();
      uint64_t v19 = sub_10000CB78();
      os_log_type_t v20 = sub_10000CD18();
      if (os_log_type_enabled(v19, v20))
      {
        uint64_t v21 = (uint8_t *)swift_slowAlloc();
        id v27 = (id)swift_slowAlloc();
        *(_DWORD *)uint64_t v21 = 136446210;
        id v25 = v21 + 4;
        swift_getErrorValue();
        uint64_t v22 = sub_10000CE88();
        uint64_t v26 = sub_10000A194(v22, v23, (uint64_t *)&v27);
        sub_10000CD38();
        swift_bridgeObjectRelease();
        swift_errorRelease();
        swift_errorRelease();
        _os_log_impl((void *)&_mh_execute_header, v19, v20, "Error storing user info: %{public}s", v21, 0xCu);
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
      return (id)(*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v7, v3);
    }
  }
  else
  {
    sub_10000CA18();
    sub_10000C9E8();
    uint64_t v15 = sub_10000CB78();
    os_log_type_t v16 = sub_10000CD18();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, v16, "Dictionary must not be nil for configuration", v17, 2u);
      swift_slowDealloc();
    }

    return (id)(*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v9, v3);
  }
}

uint64_t sub_10000C030(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = *(void *)(sub_10000CAB8() - 8);
    uint64_t v9 = a4 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
    uint64_t v10 = *(void *)(v8 + 72);
    unint64_t v11 = v9 + v10 * a1;
    unint64_t v12 = a3 + v10 * v4;
    if (v11 >= v12 || v11 + v10 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v12;
    }
  }
  uint64_t result = sub_10000CE48();
  __break(1u);
  return result;
}

void sub_10000C188(void *a1)
{
  uint64_t v2 = OBJC_IVAR____TtC20ClockPosterExtension30ClockPosterExtensionController_clockFaceController;
  if (!*(void *)(v1 + OBJC_IVAR____TtC20ClockPosterExtension30ClockPosterExtensionController_clockFaceController))
  {
    __break(1u);
    goto LABEL_7;
  }
  swift_retain();
  sub_10000C8E8();
  swift_release();
  if (!*(void *)(v1 + v2))
  {
LABEL_7:
    __break(1u);
    return;
  }
  swift_retain();
  sub_10000C8F8();
  swift_release();
  *(void *)(v1 + v2) = 0;
  swift_release();
  uint64_t v4 = *(void **)(v1 + *a1);
  *(void *)(v1 + *a1) = 0;
}

void *sub_10000C224()
{
  uint64_t v1 = sub_10000CAB8();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t result = (void *)__chkstk_darwin(v1);
  uint64_t v5 = (char *)v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(void *)(v0 + OBJC_IVAR____TtC20ClockPosterExtension30ClockPosterExtensionController_clockFaceController))
  {
    swift_retain();
    uint64_t v6 = sub_10000C908();
    swift_release();
    uint64_t v7 = *(void *)(v6 + 16);
    if (v7)
    {
      id v18 = &_swiftEmptyArrayStorage;
      sub_10000CDB8();
      uint64_t v9 = *(void (**)(char *, unint64_t, uint64_t))(v2 + 16);
      uint64_t v8 = v2 + 16;
      v16[1] = v6;
      uint64_t v17 = v9;
      unint64_t v10 = v6 + ((*(unsigned __int8 *)(v8 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 64));
      uint64_t v11 = *(void *)(v8 + 56);
      do
      {
        v17(v5, v10, v1);
        sub_10000CAA8();
        id v12 = objc_allocWithZone((Class)PREditingLook);
        NSString v13 = sub_10000CC18();
        swift_bridgeObjectRelease();
        NSString v14 = sub_10000CC18();
        [v12 initWithIdentifier:v13 displayName:v14];

        (*(void (**)(char *, uint64_t))(v8 - 8))(v5, v1);
        sub_10000CD98();
        sub_10000CDC8();
        sub_10000CDD8();
        sub_10000CDA8();
        v10 += v11;
        --v7;
      }
      while (v7);
      uint64_t v15 = v18;
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
      return &_swiftEmptyArrayStorage;
    }
    return v15;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_10000C444(void *a1)
{
  if (*(void *)(v1 + OBJC_IVAR____TtC20ClockPosterExtension30ClockPosterExtensionController_clockFaceController))
  {
    swift_retain();
    id v3 = [a1 foregroundView];
    id v4 = [v3 window];

    id v5 = [v4 rootViewController];
    id v6 = [a1 foregroundView];
    sub_10000C988();
    swift_release();
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_10000C534(uint64_t a1, unint64_t *a2)
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

uint64_t sub_10000C570(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10000C5B8()
{
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_10000C5F8(uint64_t a1)
{
  uint64_t v4 = *((void *)v1 + 2);
  uint64_t v5 = *((void *)v1 + 3);
  uint64_t v6 = *((void *)v1 + 4);
  double v7 = v1[5];
  double v8 = v1[6];
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  void *v9 = v2;
  v9[1] = sub_10000C6C8;
  return sub_1000078A4(v7, v8, a1, v4, v5, v6);
}

uint64_t sub_10000C6C8()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_10000C7BC()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000C7F4(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_10000C6C8;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_100016840 + dword_100016840);
  return v6(a1, v4);
}

uint64_t sub_10000C8B8(Swift::String _, Swift::String_optional tableName, NSBundle bundle, Swift::String value, Swift::String comment)
{
  return NSLocalizedString(_:tableName:bundle:value:comment:)(_, tableName, bundle, value, comment)._countAndFlagsBits;
}

uint64_t sub_10000C8C8()
{
  return _convertNSErrorToError(_:)();
}

uint64_t sub_10000C8D8()
{
  return ClockFaceController.didReceive(tapAt:)();
}

uint64_t sub_10000C8E8()
{
  return dispatch thunk of ClockFaceController.cleanupViews()();
}

uint64_t sub_10000C8F8()
{
  return dispatch thunk of ClockFaceController.saveViewState()();
}

uint64_t sub_10000C908()
{
  return dispatch thunk of ClockFaceController.suggestedLooks.getter();
}

uint64_t sub_10000C918()
{
  return dispatch thunk of ClockFaceController.updatedConfiguration.getter();
}

uint64_t sub_10000C928()
{
  return dispatch thunk of ClockFaceController.isDisplayStyleRedMode.setter();
}

uint64_t sub_10000C938()
{
  return ClockFaceController.shouldRecieveTapEvents.getter();
}

uint64_t sub_10000C948()
{
  return ClockFaceController.kind.getter();
}

uint64_t sub_10000C958()
{
  return dispatch thunk of ClockFaceController.look.getter();
}

uint64_t sub_10000C968()
{
  return dispatch thunk of ClockFaceController.look.setter();
}

uint64_t sub_10000C978()
{
  return ClockFaceController.init(with:)();
}

uint64_t sub_10000C988()
{
  return dispatch thunk of ClockFaceController.configure(withParent:superview:)();
}

uint64_t sub_10000C998()
{
  return type metadata accessor for ClockFaceController();
}

uint64_t sub_10000C9A8()
{
  return static ClockLogger.sharedInstance.getter();
}

uint64_t sub_10000C9B8()
{
  return dispatch thunk of ClockLogger.add(role:host:lifeCycleOfProcessDedicatedTo:)();
}

uint64_t sub_10000C9C8()
{
  return type metadata accessor for ClockLogger.Host();
}

uint64_t sub_10000C9D8()
{
  return type metadata accessor for ClockLogger.Role();
}

uint64_t sub_10000C9E8()
{
  return static ClockLogger.data.getter();
}

uint64_t sub_10000C9F8()
{
  return dispatch thunk of ClockLogger.remove(role:)();
}

uint64_t sub_10000CA08()
{
  return static ClockLogger.rendering.getter();
}

uint64_t sub_10000CA18()
{
  return type metadata accessor for ClockLogger();
}

uint64_t sub_10000CA28()
{
  return ClockFaceKind.suggestedLooks.getter();
}

uint64_t sub_10000CA38()
{
  return static ClockFaceKind.orderedStockKinds.getter();
}

uint64_t sub_10000CA48()
{
  return ClockFaceKind.DescriptorLocalizedStringKey.rawValue.getter();
}

uint64_t sub_10000CA58()
{
  return type metadata accessor for ClockFaceKind.DescriptorLocalizedStringKey();
}

uint64_t sub_10000CA68()
{
  return ClockFaceKind.displayNameLocalizedStringKey.getter();
}

uint64_t sub_10000CA78()
{
  return ClockFaceKind.init(rawValue:)();
}

uint64_t sub_10000CA88()
{
  return ClockFaceKind.rawValue.getter();
}

uint64_t sub_10000CA98()
{
  return type metadata accessor for ClockFaceKind();
}

uint64_t sub_10000CAA8()
{
  return ClockFaceLook.identifier.getter();
}

uint64_t sub_10000CAB8()
{
  return type metadata accessor for ClockFaceLook();
}

uint64_t sub_10000CAC8()
{
  return dispatch thunk of ClockFaceColor.primaryUIColor.getter();
}

uint64_t sub_10000CAD8()
{
  return static ClockPosterConfiguration.configuration(from:kind:)();
}

uint64_t sub_10000CAE8()
{
  return ClockPosterConfiguration.dictionaryRepresentation.getter();
}

uint64_t sub_10000CAF8()
{
  return ClockPosterConfiguration.kind.getter();
}

uint64_t sub_10000CB08()
{
  return ClockPosterConfiguration.look.getter();
}

uint64_t sub_10000CB18()
{
  return type metadata accessor for ClockPosterConfiguration();
}

uint64_t sub_10000CB28()
{
  return _AnySceneConfiguration.init<A>(erasing:)();
}

uint64_t sub_10000CB38()
{
  return type metadata accessor for _AnySceneConfiguration();
}

uint64_t sub_10000CB48()
{
  return static _AppExtension<>.main()();
}

uint64_t sub_10000CB58()
{
  return _AppExtension.hostAuditToken.getter();
}

uint64_t sub_10000CB68()
{
  return static _SceneBuilder.buildBlock<A>(_:)();
}

uint64_t sub_10000CB78()
{
  return Logger.logObject.getter();
}

uint64_t sub_10000CB88()
{
  return type metadata accessor for Logger();
}

uint64_t sub_10000CB98()
{
  return type metadata accessor for PREditingConfiguration();
}

uint64_t sub_10000CBA8()
{
  return PREditingConfiguration.init(_:)();
}

uint64_t sub_10000CBB8()
{
  return PRProviderConfiguration.init(updatingDelegate:content:)();
}

uint64_t sub_10000CBC8()
{
  return type metadata accessor for PRRenderingConfiguration();
}

uint64_t sub_10000CBD8()
{
  return PRRenderingConfiguration.init(_:)();
}

NSDictionary sub_10000CBE8()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_10000CBF8()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10000CC08()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

NSString sub_10000CC18()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_10000CC28()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10000CC38()
{
  return String.init<A>(describing:)();
}

uint64_t sub_10000CC48()
{
  return String.hash(into:)();
}

void sub_10000CC58(Swift::String a1)
{
}

Swift::Int sub_10000CC68()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_10000CC78()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray sub_10000CC88()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_10000CC98()
{
  return specialized Array._endMutation()();
}

uint64_t sub_10000CCA8()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_10000CCB8()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_10000CCC8()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_10000CCD8()
{
  return static MainActor.shared.getter();
}

uint64_t sub_10000CCE8()
{
  return type metadata accessor for MainActor();
}

uint64_t sub_10000CCF8()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_10000CD08()
{
  return type metadata accessor for TaskPriority();
}

uint64_t sub_10000CD18()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_10000CD28()
{
  return static os_log_type_t.fault.getter();
}

uint64_t sub_10000CD38()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_10000CD48()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

void sub_10000CD58(Swift::Int a1)
{
}

uint64_t sub_10000CD68()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_10000CD78()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_10000CD88()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_10000CD98()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_10000CDA8()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t sub_10000CDB8()
{
  return specialized ContiguousArray.reserveCapacity(_:)();
}

uint64_t sub_10000CDC8()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t sub_10000CDD8()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_10000CDE8()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_10000CDF8()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_10000CE08()
{
  return _bridgeCocoaArray<A>(_:)();
}

uint64_t sub_10000CE18()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_10000CE28()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t sub_10000CE38()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t sub_10000CE48()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_10000CE58()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_10000CE68()
{
  return dispatch thunk of __ContiguousArrayStorageBase.staticElementType.getter();
}

uint64_t sub_10000CE78()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_10000CE88()
{
  return Error.localizedDescription.getter();
}

uint64_t sub_10000CE98()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_10000CEA8()
{
  return Hasher._finalize()();
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

void bzero(void *a1, size_t a2)
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

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return _swift_arrayInitWithTakeBackToFront();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return _swift_arrayInitWithTakeFrontToBack();
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

uint64_t swift_getErrorValue()
{
  return _swift_getErrorValue();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
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

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return _swift_isEscapingClosureAtFileLocation();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
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

uint64_t swift_unknownObjectRelease_n()
{
  return _swift_unknownObjectRelease_n();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_unknownObjectRetain_n()
{
  return _swift_unknownObjectRetain_n();
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

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}