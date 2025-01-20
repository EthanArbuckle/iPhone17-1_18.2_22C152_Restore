uint64_t sub_100003574()
{
  uint64_t v0;

  return _swift_deallocClassInstance(v0, 16, 7);
}

id sub_100003584()
{
  type metadata accessor for SomeClass();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id result = [self bundleForClass:ObjCClassFromMetadata];
  qword_100030A48 = (uint64_t)result;
  return result;
}

uint64_t variable initialization expression of ModelHeuristics.OSAvailability.visionOS()
{
  return 0;
}

uint64_t type metadata accessor for SomeClass()
{
  return self;
}

void type metadata accessor for URLResourceKey(uint64_t a1)
{
}

uint64_t sub_100003620(uint64_t a1, uint64_t a2)
{
  return sub_10000372C(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_10000364C(uint64_t a1, uint64_t a2)
{
  return sub_10000372C(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_100003664()
{
  sub_100024FC0();
  sub_100024FE0();
  return swift_bridgeObjectRelease();
}

Swift::Int sub_1000036B8()
{
  sub_100024FC0();
  sub_100025270();
  sub_100024FE0();
  Swift::Int v0 = sub_1000252A0();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_10000372C(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_100024FC0();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_100003770(uint64_t a1, id *a2)
{
  uint64_t result = sub_100024FA0();
  *a2 = 0;
  return result;
}

uint64_t sub_1000037E8(uint64_t a1, id *a2)
{
  char v3 = sub_100024FB0();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_100003868@<X0>(void *a1@<X8>)
{
  sub_100024FC0();
  NSString v2 = sub_100024F90();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_1000038B0()
{
  uint64_t v0 = sub_100024FC0();
  uint64_t v2 = v1;
  if (v0 == sub_100024FC0() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_1000251E0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_100003940(uint64_t a1)
{
  uint64_t v2 = sub_100003B48((unint64_t *)&qword_100030BE0, type metadata accessor for FileAttributeKey);
  uint64_t v3 = sub_100003B48(&qword_100030BE8, type metadata accessor for FileAttributeKey);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_1000039FC(uint64_t a1)
{
  uint64_t v2 = sub_100003B48(&qword_100030B70, type metadata accessor for URLResourceKey);
  uint64_t v3 = sub_100003B48(&qword_100030B78, type metadata accessor for URLResourceKey);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_100003AB8()
{
  return sub_100003B48(&qword_100030B58, type metadata accessor for URLResourceKey);
}

uint64_t sub_100003B00()
{
  return sub_100003B48(&qword_100030B60, type metadata accessor for URLResourceKey);
}

uint64_t sub_100003B48(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100003B90()
{
  return sub_100003B48(&qword_100030B68, type metadata accessor for URLResourceKey);
}

void type metadata accessor for FileAttributeKey(uint64_t a1)
{
}

void type metadata accessor for MIOParameterKey(uint64_t a1)
{
}

void type metadata accessor for MIOModelMetadataKey(uint64_t a1)
{
}

uint64_t sub_100003C14(uint64_t a1)
{
  uint64_t v2 = sub_100003B48(&qword_100030C00, type metadata accessor for MIOModelMetadataKey);
  uint64_t v3 = sub_100003B48(&qword_100030C08, type metadata accessor for MIOModelMetadataKey);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_100003CD0()
{
  return sub_100003B48(&qword_100030B98, type metadata accessor for MIOModelMetadataKey);
}

uint64_t sub_100003D18()
{
  return sub_100003B48(&qword_100030BA0, type metadata accessor for MIOModelMetadataKey);
}

uint64_t sub_100003D60@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100024FC0();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_100003D8C(uint64_t a1)
{
  uint64_t v2 = sub_100003B48(&qword_100030BF0, type metadata accessor for MIOParameterKey);
  uint64_t v3 = sub_100003B48(&qword_100030BF8, type metadata accessor for MIOParameterKey);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_100003E48()
{
  return sub_100003B48(&qword_100030BA8, type metadata accessor for MIOParameterKey);
}

uint64_t sub_100003E90()
{
  return sub_100003B48(&qword_100030BB0, type metadata accessor for MIOParameterKey);
}

uint64_t sub_100003ED8()
{
  return sub_100003B48(&qword_100030BB8, type metadata accessor for FileAttributeKey);
}

uint64_t sub_100003F20()
{
  return sub_100003B48(&qword_100030BC0, type metadata accessor for FileAttributeKey);
}

uint64_t sub_100003F68()
{
  return sub_100003B48(&qword_100030BC8, type metadata accessor for FileAttributeKey);
}

uint64_t sub_100003FB0()
{
  return sub_100003B48(&qword_100030BD0, type metadata accessor for MIOParameterKey);
}

uint64_t sub_100003FF8()
{
  return sub_100003B48(&qword_100030BD8, type metadata accessor for MIOModelMetadataKey);
}

uint64_t sub_100004040@<X0>(void *a1@<X8>)
{
  NSString v2 = sub_100024F90();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

void type metadata accessor for MIOModelLayerType(uint64_t a1)
{
}

void sub_10000409C(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_1000040E4(uint64_t a1)
{
  uint64_t v2 = sub_100003B48(&qword_100030C30, type metadata accessor for MIOModelLayerType);
  uint64_t v3 = sub_100003B48(&qword_100030C38, type metadata accessor for MIOModelLayerType);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_1000041A0()
{
  return sub_100003B48(&qword_100030C18, type metadata accessor for MIOModelLayerType);
}

uint64_t sub_1000041E8()
{
  return sub_100003B48(&qword_100030C20, type metadata accessor for MIOModelLayerType);
}

uint64_t sub_100004230()
{
  return sub_100003B48(&qword_100030C28, type metadata accessor for MIOModelLayerType);
}

uint64_t static DiskSize.sizeInBytes(of:)(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_100030C40);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((sub_1000043F8() & 1) == 0) {
    return sub_10000541C();
  }
  uint64_t v5 = sub_100024BF0();
  uint64_t v6 = *(void *)(v5 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v4, a1, v5);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v6 + 56))(v4, 0, 1, v5);
  uint64_t v7 = sub_100004ECC((uint64_t)v4);
  sub_100005B64((uint64_t)v4, &qword_100030C40);
  return v7;
}

uint64_t sub_1000043F8()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_100030C80);
  uint64_t v0 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v2 = (char *)&v11 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v0);
  uint64_t v4 = (char *)&v11 - v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_100030C48);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1000260E0;
  *(void *)(inited + 32) = NSURLIsDirectoryKey;
  uint64_t v6 = NSURLIsDirectoryKey;
  sub_100004C9C(inited);
  swift_setDeallocating();
  type metadata accessor for URLResourceKey(0);
  swift_arrayDestroy();
  sub_100024BA0();
  swift_bridgeObjectRelease();
  uint64_t v7 = sub_100024B50();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v4, 0, 1, v7);
  sub_100005B00((uint64_t)v4, (uint64_t)v2, &qword_100030C80);
  sub_100024B50();
  uint64_t v8 = *(void *)(v7 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v2, 1, v7) == 1)
  {
    sub_100005B64((uint64_t)v4, &qword_100030C80);
    sub_100005B64((uint64_t)v2, &qword_100030C80);
    return 0;
  }
  else
  {
    char v10 = sub_100024B40();
    sub_100005B64((uint64_t)v4, &qword_100030C80);
    (*(void (**)(char *, uint64_t))(v8 + 8))(v2, v7);
    return v10 & 1;
  }
}

uint64_t static DiskSize.folderSizeInBytes(of:)(uint64_t a1)
{
  uint64_t result = sub_100004ECC(a1);
  if (v1) {
    return v3;
  }
  return result;
}

uint64_t static DiskSize.fileSizeInBytes(of:)()
{
  return sub_10000541C();
}

uint64_t static DiskSize.fileSizeInGB(url:)()
{
  uint64_t v0 = sub_100024B50();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_100030C48);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1000260E0;
  *(void *)(inited + 32) = NSURLFileSizeKey;
  uint64_t v5 = NSURLFileSizeKey;
  sub_100004C9C(inited);
  swift_setDeallocating();
  type metadata accessor for URLResourceKey(0);
  swift_arrayDestroy();
  sub_100024BA0();
  swift_bridgeObjectRelease();
  uint64_t v6 = sub_100024B30();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_1000048B4(v6, (uint64_t)&v9);
  swift_bridgeObjectRelease();
  if (v9)
  {

    sub_100005930(&v10, v11);
    sub_100005930(v11, &v12);
    return swift_dynamicCast();
  }
  else
  {
    uint64_t result = sub_100005B64((uint64_t)&v9, &qword_100030C50);
    __break(1u);
  }
  return result;
}

uint64_t sub_1000048B4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_100004B84(a1);
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
    *(void *)(a2 + 32) = 0;
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
  }
  else
  {
    id v7 = sub_100004C0C(v10, result, v5, 0, a1);
    id v9 = v7;
    *(void *)a2 = v7;
    sub_100005950((uint64_t)v10, a2 + 8);
    id v8 = v7;
    return sub_100005B64((uint64_t)&v9, &qword_100030C58);
  }
  return result;
}

uint64_t static DiskSize.fileSizeInMB(url:)()
{
  uint64_t v0 = sub_100024B50();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_100030C48);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1000260E0;
  *(void *)(inited + 32) = NSURLFileSizeKey;
  int v5 = NSURLFileSizeKey;
  sub_100004C9C(inited);
  swift_setDeallocating();
  type metadata accessor for URLResourceKey(0);
  swift_arrayDestroy();
  sub_100024BA0();
  swift_bridgeObjectRelease();
  uint64_t v6 = sub_100024B30();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_1000048B4(v6, (uint64_t)&v9);
  swift_bridgeObjectRelease();
  if (v9)
  {

    sub_100005930(&v10, v11);
    sub_100005930(v11, &v12);
    return swift_dynamicCast();
  }
  else
  {
    uint64_t result = sub_100005B64((uint64_t)&v9, &qword_100030C50);
    __break(1u);
  }
  return result;
}

uint64_t sub_100004B84(uint64_t a1)
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
  id v9 = (unint64_t *)(a1 + 80);
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

id sub_100004C0C(id result, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  if (a2 < 0 || 1 << *(unsigned char *)(a5 + 32) <= a2)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (((*(void *)(a5 + 8 * ((unint64_t)a2 >> 6) + 64) >> a2) & 1) == 0)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if (*(_DWORD *)(a5 + 36) != a3)
  {
LABEL_10:
    __break(1u);
    return result;
  }
  id v5 = *(id *)(*(void *)(a5 + 48) + 8 * a2);
  sub_100005950(*(void *)(a5 + 56) + 32 * a2, (uint64_t)result);
  return v5;
}

void *sub_100004C9C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_100030C60);
    uint64_t v3 = sub_1000250D0();
    uint64_t v4 = 0;
    uint64_t v5 = v3 + 56;
    uint64_t v31 = v1;
    uint64_t v32 = a1 + 32;
    while (1)
    {
      unsigned int v6 = *(void **)(v32 + 8 * v4);
      sub_100024FC0();
      sub_100025270();
      id v7 = v6;
      sub_100024FE0();
      Swift::Int v8 = sub_1000252A0();
      uint64_t result = (void *)swift_bridgeObjectRelease();
      uint64_t v10 = -1 << *(unsigned char *)(v3 + 32);
      unint64_t v11 = v8 & ~v10;
      unint64_t v12 = v11 >> 6;
      uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
      uint64_t v14 = 1 << v11;
      if (((1 << v11) & v13) != 0)
      {
        uint64_t v15 = sub_100024FC0();
        uint64_t v17 = v16;
        if (v15 == sub_100024FC0() && v17 == v18)
        {
LABEL_3:
          swift_bridgeObjectRelease_n();
LABEL_4:

          goto LABEL_5;
        }
        char v20 = sub_1000251E0();
        swift_bridgeObjectRelease();
        uint64_t result = (void *)swift_bridgeObjectRelease();
        if (v20) {
          goto LABEL_4;
        }
        uint64_t v21 = ~v10;
        while (1)
        {
          unint64_t v11 = (v11 + 1) & v21;
          unint64_t v12 = v11 >> 6;
          uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
          uint64_t v14 = 1 << v11;
          if ((v13 & (1 << v11)) == 0) {
            break;
          }
          uint64_t v22 = sub_100024FC0();
          uint64_t v24 = v23;
          if (v22 == sub_100024FC0() && v24 == v25) {
            goto LABEL_3;
          }
          char v27 = sub_1000251E0();
          swift_bridgeObjectRelease();
          uint64_t result = (void *)swift_bridgeObjectRelease();
          if (v27) {
            goto LABEL_4;
          }
        }
      }
      *(void *)(v5 + 8 * v12) = v14 | v13;
      *(void *)(*(void *)(v3 + 48) + 8 * v11) = v7;
      uint64_t v28 = *(void *)(v3 + 16);
      BOOL v29 = __OFADD__(v28, 1);
      uint64_t v30 = v28 + 1;
      if (v29)
      {
        __break(1u);
        return result;
      }
      *(void *)(v3 + 16) = v30;
LABEL_5:
      if (++v4 == v31) {
        return (void *)v3;
      }
    }
  }
  return &_swiftEmptySetSingleton;
}

uint64_t sub_100004ECC(uint64_t a1)
{
  uint64_t v2 = sub_100024B90();
  uint64_t v36 = *(void *)(v2 - 8);
  uint64_t v37 = v2;
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)&v31 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_100030C40);
  __chkstk_darwin(v5 - 8);
  id v7 = (char *)&v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100024BF0();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  unint64_t v11 = (char *)&v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = a1;
  uint64_t v14 = v13;
  sub_100005B00(v12, (uint64_t)v7, &qword_100030C40);
  int v15 = (*(uint64_t (**)(char *, uint64_t, char *))(v9 + 48))(v7, 1, v14);
  if (v15 == 1)
  {
    sub_100005B64((uint64_t)v7, &qword_100030C40);
    return 0;
  }
  int v35 = v15;
  (*(void (**)(char *, char *, char *))(v9 + 32))(v11, v7, v14);
  id v17 = [self defaultManager];
  __swift_instantiateConcreteTypeFromMangledName(&qword_100030C48);
  uint64_t v18 = swift_allocObject();
  *(_OWORD *)(v18 + 16) = xmmword_1000260E0;
  *(void *)(v18 + 32) = NSURLFileSizeKey;
  v19 = v14;
  char v20 = NSURLFileSizeKey;
  uint64_t v21 = (void *)sub_100025080();

  swift_bridgeObjectRelease();
  if (!v21)
  {
LABEL_17:
    sub_1000059AC();
    swift_allocError();
    *uint64_t v28 = 0;
    swift_willThrow();
    return (*(uint64_t (**)(char *, char *))(v9 + 8))(v11, v19);
  }
  id v33 = v21;
  v34 = v19;
  sub_100025070();
  sub_100024B80();
  if (v41)
  {
    uint64_t v32 = 0;
    while (1)
    {
      sub_100005930(&v40, v39);
      sub_100005A00();
      if (!swift_dynamicCast())
      {
        sub_1000059AC();
        swift_allocError();
        *BOOL v29 = 1;
        swift_willThrow();

        (*(void (**)(char *, uint64_t))(v36 + 8))(v4, v37);
        return (*(uint64_t (**)(char *, char *))(v9 + 8))(v11, v34);
      }
      v19 = v11;
      id v22 = v38;
      id v38 = 0;
      *(void *)&v39[0] = 0;
      unsigned int v23 = [v22 getResourceValue:v39 forKey:v20 error:&v38];
      uint64_t v24 = *(void *)&v39[0];
      id v25 = v38;
      if (!v23)
      {
        uint64_t v30 = v25;
        swift_unknownObjectRetain();
        sub_100024B70();

        swift_willThrow();
        (*(void (**)(char *, uint64_t))(v36 + 8))(v4, v37);
        (*(void (**)(char *, char *))(v9 + 8))(v19, v34);
        return swift_unknownObjectRelease();
      }
      if (!v24) {
        goto LABEL_11;
      }
      swift_unknownObjectRetain_n();
      self;
      v26 = (void *)swift_dynamicCastObjCClass();
      if (!v26) {
        break;
      }
      unint64_t v11 = (char *)[v26 longLongValue];

      swift_unknownObjectRelease_n();
      BOOL v27 = __OFADD__(v32, v11);
      v32 += (uint64_t)v11;
      if (v27)
      {
        __break(1u);
        goto LABEL_17;
      }
LABEL_12:
      sub_100024B80();
      unint64_t v11 = v19;
      if (!v41) {
        goto LABEL_19;
      }
    }
    swift_unknownObjectRelease_n();
LABEL_11:

    goto LABEL_12;
  }
  uint64_t v32 = 0;
LABEL_19:

  (*(void (**)(char *, uint64_t))(v36 + 8))(v4, v37);
  (*(void (**)(char *, char *))(v9 + 8))(v11, v34);
  return v32;
}

uint64_t sub_10000541C()
{
  id v0 = [self defaultManager];
  sub_100024BE0();
  NSString v1 = sub_100024F90();
  swift_bridgeObjectRelease();
  *(void *)&long long v14 = 0;
  id v2 = [v0 attributesOfItemAtPath:v1 error:&v14];

  uint64_t v3 = (void *)v14;
  if (v2)
  {
    type metadata accessor for FileAttributeKey(0);
    sub_100005AA8();
    uint64_t v4 = sub_100024F50();
    id v5 = v3;

    if (*(void *)(v4 + 16))
    {
      uint64_t v6 = NSFileSize;
      uint64_t v7 = sub_100013CD0();
      if (v8)
      {
        sub_100005950(*(void *)(v4 + 56) + 32 * v7, (uint64_t)&v14);
      }
      else
      {
        long long v14 = 0u;
        long long v15 = 0u;
      }
    }
    else
    {
      long long v14 = 0u;
      long long v15 = 0u;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    id v9 = (id)v14;
    sub_100024B70();

    swift_willThrow();
    swift_errorRelease();
    long long v14 = 0u;
    long long v15 = 0u;
  }
  sub_100005A40((uint64_t)&v14, (uint64_t)v12);
  if (v13)
  {
    if (swift_dynamicCast()) {
      return v11;
    }
  }
  else
  {
    sub_100005B64((uint64_t)v12, &qword_100030C78);
  }
  return 0;
}

uint64_t _s30com_apple_MLKit_MLModelPreview8DiskSizeO09formattedG02ofSS10Foundation3URLV_tFZ_0(uint64_t a1)
{
  uint64_t v2 = 3157552;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_100030C40);
  __chkstk_darwin(v3 - 8);
  id v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (sub_1000043F8())
  {
    uint64_t v6 = sub_100024BF0();
    uint64_t v7 = *(void *)(v6 - 8);
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v5, a1, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v5, 0, 1, v6);
    unint64_t v9 = sub_100004ECC((uint64_t)v5);
    char v11 = v10;
    sub_100005B64((uint64_t)v5, &qword_100030C40);
    if (v11) {
      return v2;
    }
  }
  else
  {
    unint64_t v9 = sub_10000541C();
    if (v8) {
      return v2;
    }
  }
  if ((uint64_t)v9 >= 1)
  {
    id v12 = [objc_allocWithZone((Class)NSByteCountFormatter) init];
    [v12 setCountStyle:0];
    if (v9 > 0x3FE)
    {
      if (v9 >> 10 > 0x3FE)
      {
        if ((float)((float)(v9 >> 10) * 0.00097656) >= 1023.0) {
          [v12 setAllowedUnits:8];
        }
        else {
          [v12 setAllowedUnits:4];
        }
        id v14 = [v12 stringFromByteCount:v9];
      }
      else
      {
        [v12 setAllowedUnits:2];
        id v14 = [v12 stringFromByteCount:v9];
      }
      id v15 = v14;
      uint64_t v2 = sub_100024FC0();
    }
    else
    {
      [v12 setAllowedUnits:1];
      id v13 = [v12 stringFromByteCount:v9];
      uint64_t v2 = sub_100024FC0();
    }
  }
  return v2;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

_OWORD *sub_100005930(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

ValueMetadata *type metadata accessor for DiskSize()
{
  return &type metadata for DiskSize;
}

uint64_t sub_100005950(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_1000059AC()
{
  unint64_t result = qword_100030C68;
  if (!qword_100030C68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100030C68);
  }
  return result;
}

unint64_t sub_100005A00()
{
  unint64_t result = qword_100030C70;
  if (!qword_100030C70)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100030C70);
  }
  return result;
}

uint64_t sub_100005A40(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_100030C78);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_100005AA8()
{
  unint64_t result = qword_100030BE0;
  if (!qword_100030BE0)
  {
    type metadata accessor for FileAttributeKey(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100030BE0);
  }
  return result;
}

uint64_t sub_100005B00(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100005B64(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

ValueMetadata *type metadata accessor for AdditionalModelMetadataViewModel()
{
  return &type metadata for AdditionalModelMetadataViewModel;
}

uint64_t *sub_100005BD0(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v7 = sub_100024C20();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    unint64_t v9 = (uint64_t *)((char *)a1 + v8);
    char v10 = (uint64_t *)((char *)a2 + v8);
    uint64_t v11 = v10[1];
    *unint64_t v9 = *v10;
    v9[1] = v11;
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_100005CA8(uint64_t a1)
{
  uint64_t v2 = sub_100024C20();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return swift_bridgeObjectRelease();
}

uint64_t sub_100005D20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100024C20();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  unint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = v9[1];
  *uint64_t v8 = *v9;
  v8[1] = v10;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_100005DA8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100024C20();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  unint64_t v9 = (void *)(a2 + v7);
  *uint64_t v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_100005E44(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100024C20();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_100005EC0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100024C20();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  unint64_t v9 = (uint64_t *)(a2 + v7);
  uint64_t v11 = *v9;
  uint64_t v10 = v9[1];
  *uint64_t v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_100005F4C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100005F60);
}

uint64_t sub_100005F60(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100024C20();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20) + 8);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t sub_100006024(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100006038);
}

uint64_t sub_100006038(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_100024C20();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20) + 8) = (a2 - 1);
  }
  return result;
}

uint64_t type metadata accessor for ClassLabel()
{
  uint64_t result = qword_100030CE0;
  if (!qword_100030CE0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100006144()
{
  uint64_t result = sub_100024C20();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

Swift::Int sub_1000061D8()
{
  return sub_1000252A0();
}

uint64_t sub_100006298()
{
  sub_100024C20();
  sub_100006588((unint64_t *)&qword_100030D18, (void (*)(uint64_t))&type metadata accessor for UUID);
  sub_100024F70();
  swift_bridgeObjectRetain();
  sub_100024FE0();
  return swift_bridgeObjectRelease();
}

Swift::Int sub_10000634C()
{
  return sub_1000252A0();
}

uint64_t sub_100006408@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_100024C20();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);
  return v4(a1, v1, v3);
}

uint64_t sub_100006470(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((sub_100024C00() & 1) == 0) {
    return 0;
  }
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = *(void *)(a1 + v6);
  uint64_t v8 = *(void *)(a1 + v6 + 8);
  uint64_t v9 = (void *)(a2 + v6);
  if (v7 == *v9 && v8 == v9[1]) {
    return 1;
  }
  return sub_1000251E0();
}

uint64_t sub_1000064F8()
{
  return sub_100006588((unint64_t *)&qword_100030D18, (void (*)(uint64_t))&type metadata accessor for UUID);
}

uint64_t sub_100006540()
{
  return sub_100006588(&qword_100030D20, (void (*)(uint64_t))type metadata accessor for ClassLabel);
}

uint64_t sub_100006588(unint64_t *a1, void (*a2)(uint64_t))
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

ValueMetadata *type metadata accessor for ClassLabelsDataViewModel()
{
  return &type metadata for ClassLabelsDataViewModel;
}

uint64_t initializeBufferWithCopyOfBuffer for SingleValueRowView(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for SingleValueRowView()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for SingleValueRowView(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for SingleValueRowView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  return a1;
}

__n128 __swift_memcpy33_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for SingleValueRowView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for SingleValueRowView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 33)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SingleValueRowView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(unsigned char *)(result + 32) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 33) = 1;
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
    *(unsigned char *)(result + 33) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SingleValueRowView()
{
  return &type metadata for SingleValueRowView;
}

uint64_t sub_100006810(uint64_t a1)
{
  return _swift_getOpaqueTypeConformance2(a1, &unk_100027E14, 1);
}

uint64_t sub_10000682C@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v41 = a1;
  v44 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_100030D30);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  v43 = &v36[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v4);
  v42 = &v36[-v6];
  uint64_t v39 = sub_100024D10();
  sub_100006B9C(a1, (uint64_t)v46);
  uint64_t v7 = v46[0];
  uint64_t v8 = v46[1];
  uint64_t v40 = v46[0];
  char v9 = v46[2];
  uint64_t v10 = v46[3];
  uint64_t v38 = v46[4];
  char v11 = v46[5];
  uint64_t v12 = v46[6];
  uint64_t v13 = v46[7];
  uint64_t v14 = v46[8];
  uint64_t v15 = v46[9];
  int v37 = sub_100024DC0();
  sub_100024C90();
  uint64_t v17 = v16;
  uint64_t v19 = v18;
  uint64_t v21 = v20;
  uint64_t v23 = v22;
  char v76 = 1;
  char v75 = v9;
  char v74 = v11;
  char v73 = 0;
  char v24 = sub_100024DD0();
  sub_100024C90();
  char v77 = 0;
  uint64_t v48 = v39;
  uint64_t v49 = 0;
  char v50 = v76;
  uint64_t v51 = v7;
  uint64_t v52 = v8;
  char v53 = v75;
  uint64_t v54 = v10;
  uint64_t v55 = v38;
  char v56 = v74;
  uint64_t v57 = v12;
  uint64_t v58 = v13;
  uint64_t v59 = v14;
  uint64_t v60 = v15;
  char v61 = v37;
  uint64_t v62 = v17;
  uint64_t v63 = v19;
  uint64_t v64 = v21;
  uint64_t v65 = v23;
  char v66 = v73;
  char v67 = v24;
  uint64_t v68 = v25;
  uint64_t v69 = v26;
  uint64_t v70 = v27;
  uint64_t v71 = v28;
  char v72 = 0;
  sub_100024F30();
  sub_100008BFC(0.0, 1, 0.0, 1, 0.0, 1, 44.0, 0, (uint64_t)v78, 0.0, 1, INFINITY, 0);
  sub_100006FA0(v40, v8, v9);
  swift_bridgeObjectRelease();
  sub_100006FB0(v12, v13, v14, v15);
  if (*(unsigned char *)(v41 + 32))
  {
    uint64_t v30 = (uint64_t)v42;
    sub_100024F00();
    uint64_t v31 = sub_100024F10();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v31 - 8) + 56))(v30, 0, 1, v31);
  }
  else
  {
    uint64_t v29 = sub_100024F10();
    uint64_t v30 = (uint64_t)v42;
    (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v29 - 8) + 56))(v42, 1, 1, v29);
  }
  uint64_t v32 = v43;
  sub_100006FF4(v30, (uint64_t)v43);
  memcpy(v45, v78, 0x138uLL);
  v45[156] = 256;
  id v33 = v44;
  memcpy(v44, v45, 0x13AuLL);
  uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_100030D38);
  sub_100006FF4((uint64_t)v32, (uint64_t)v33 + *(int *)(v34 + 48));
  sub_10000705C((uint64_t)v45);
  sub_10000711C(v30);
  sub_10000711C((uint64_t)v32);
  memcpy(v46, v78, sizeof(v46));
  __int16 v47 = 256;
  return sub_10000717C((uint64_t)v46);
}

uint64_t sub_100006B9C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_1000071E8();
  swift_bridgeObjectRetain();
  uint64_t v2 = sub_100024E70();
  uint64_t v4 = v3;
  char v6 = v5 & 1;
  sub_100024DF0();
  uint64_t v7 = sub_100024E60();
  uint64_t v9 = v8;
  char v11 = v10;
  swift_release();
  sub_100006FA0(v2, v4, v6);
  swift_bridgeObjectRelease();
  sub_100024E10();
  uint64_t v12 = sub_100024E40();
  uint64_t v14 = v13;
  char v16 = v15 & 1;
  sub_100006FA0(v7, v9, v11 & 1);
  swift_bridgeObjectRelease();
  uint64_t v17 = self;
  id v18 = [v17 labelColor];
  sub_100024EE0();
  uint64_t v19 = sub_100024E50();
  uint64_t v21 = v20;
  char v23 = v22;
  uint64_t v25 = v24;
  swift_release();
  sub_100006FA0(v12, v14, v16);
  swift_bridgeObjectRelease();
  if (*(void *)(a1 + 24))
  {
    swift_bridgeObjectRetain();
    uint64_t v26 = sub_100024E70();
    uint64_t v28 = v27;
    char v30 = v29 & 1;
    sub_100024DE0();
    uint64_t v56 = v21;
    uint64_t v31 = sub_100024E60();
    id v54 = v17;
    uint64_t v33 = v32;
    char v55 = v23;
    char v35 = v34;
    uint64_t v59 = v25;
    swift_release();
    sub_100006FA0(v26, v28, v30);
    swift_bridgeObjectRelease();
    sub_100024E10();
    uint64_t v36 = sub_100024E40();
    uint64_t v38 = v37;
    uint64_t v57 = v19;
    char v40 = v39 & 1;
    sub_100006FA0(v31, v33, v35 & 1);
    swift_bridgeObjectRelease();
    id v41 = [v54 labelColor];
    sub_100024EE0();
    uint64_t v42 = sub_100024E50();
    uint64_t v44 = v43;
    char v46 = v45;
    uint64_t v48 = v47;
    char v23 = v55;
    swift_release();
    uint64_t v49 = v46 & 1;
    uint64_t v50 = v38;
    uint64_t v21 = v56;
    char v51 = v40;
    uint64_t v19 = v57;
    uint64_t v25 = v59;
    sub_100006FA0(v36, v50, v51);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v42 = 0;
    uint64_t v44 = 0;
    uint64_t v49 = 0;
    uint64_t v48 = 0;
  }
  char v52 = v23 & 1;
  *(void *)a2 = v19;
  *(void *)(a2 + 8) = v21;
  *(unsigned char *)(a2 + 16) = v52;
  *(void *)(a2 + 24) = v25;
  *(void *)(a2 + 32) = 0;
  *(unsigned char *)(a2 + 40) = 1;
  *(void *)(a2 + 48) = v42;
  *(void *)(a2 + 56) = v44;
  *(void *)(a2 + 64) = v49;
  *(void *)(a2 + 72) = v48;
  sub_1000070C8(v19, v21, v52);
  swift_bridgeObjectRetain();
  sub_1000070D8(v42, v44, v49, v48);
  sub_100006FB0(v42, v44, v49, v48);
  sub_100006FA0(v19, v21, v52);
  return swift_bridgeObjectRelease();
}

uint64_t sub_100006F24()
{
  return sub_100024EA0();
}

uint64_t sub_100006F40@<X0>(uint64_t a1@<X8>)
{
  long long v3 = *(_OWORD *)(v1 + 16);
  v6[0] = *(_OWORD *)v1;
  v6[1] = v3;
  char v7 = *(unsigned char *)(v1 + 32);
  *(void *)a1 = sub_100024D40();
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 0;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_100030D28);
  return sub_10000682C((uint64_t)v6, (void *)(a1 + *(int *)(v4 + 44)));
}

uint64_t sub_100006FA0(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_100006FB0(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_100006FA0(result, a2, a3 & 1);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_100006FF4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_100030D30);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000705C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 72);
  uint64_t v3 = *(void *)(a1 + 80);
  uint64_t v4 = *(void *)(a1 + 88);
  uint64_t v5 = *(void *)(a1 + 96);
  sub_1000070C8(*(void *)(a1 + 24), *(void *)(a1 + 32), *(unsigned char *)(a1 + 40));
  swift_bridgeObjectRetain();
  sub_1000070D8(v2, v3, v4, v5);
  return a1;
}

uint64_t sub_1000070C8(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_1000070D8(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_1000070C8(result, a2, a3 & 1);
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_10000711C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_100030D30);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000717C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 72);
  uint64_t v3 = *(void *)(a1 + 80);
  uint64_t v4 = *(void *)(a1 + 88);
  uint64_t v5 = *(void *)(a1 + 96);
  sub_100006FA0(*(void *)(a1 + 24), *(void *)(a1 + 32), *(unsigned char *)(a1 + 40));
  swift_bridgeObjectRelease();
  sub_100006FB0(v2, v3, v4, v5);
  return a1;
}

unint64_t sub_1000071E8()
{
  unint64_t result = qword_100030D40;
  if (!qword_100030D40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100030D40);
  }
  return result;
}

unint64_t sub_100007240()
{
  unint64_t result = qword_100030D48;
  if (!qword_100030D48)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_100030D50);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100030D48);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t *sub_1000072E4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v16 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v16 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_100024C20();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = *(int *)(a3 + 24);
    char v10 = (uint64_t *)((char *)a1 + v8);
    char v11 = (uint64_t *)((char *)a2 + v8);
    uint64_t v12 = v11[1];
    *char v10 = *v11;
    v10[1] = v12;
    uint64_t v13 = (uint64_t *)((char *)a1 + v9);
    uint64_t v14 = (uint64_t *)((char *)a2 + v9);
    uint64_t v15 = v14[1];
    *uint64_t v13 = *v14;
    v13[1] = v15;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_1000073D4(uint64_t a1)
{
  uint64_t v2 = sub_100024C20();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_10000745C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100024C20();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = (void *)(a1 + v7);
  char v10 = (void *)(a2 + v7);
  uint64_t v11 = v10[1];
  *uint64_t v9 = *v10;
  v9[1] = v11;
  uint64_t v12 = (void *)(a1 + v8);
  uint64_t v13 = (void *)(a2 + v8);
  uint64_t v14 = v13[1];
  *uint64_t v12 = *v13;
  v12[1] = v14;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_1000074FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100024C20();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  *uint64_t v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v10 = *(int *)(a3 + 24);
  uint64_t v11 = (void *)(a1 + v10);
  uint64_t v12 = (void *)(a2 + v10);
  *uint64_t v11 = *v12;
  v11[1] = v12[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1000075C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100024C20();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 24);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  *(_OWORD *)(a1 + v7) = *(_OWORD *)(a2 + v7);
  return a1;
}

uint64_t sub_100007648(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100024C20();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (uint64_t *)(a2 + v7);
  uint64_t v11 = *v9;
  uint64_t v10 = v9[1];
  *uint64_t v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  uint64_t v12 = *(int *)(a3 + 24);
  uint64_t v13 = (void *)(a1 + v12);
  uint64_t v14 = (uint64_t *)(a2 + v12);
  uint64_t v16 = *v14;
  uint64_t v15 = v14[1];
  *uint64_t v13 = v16;
  v13[1] = v15;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1000076F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100007704);
}

uint64_t sub_100007704(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100024C20();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20) + 8);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t sub_1000077C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000077DC);
}

uint64_t sub_1000077DC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_100024C20();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20) + 8) = (a2 - 1);
  }
  return result;
}

uint64_t type metadata accessor for ModelMetadataItem()
{
  uint64_t result = qword_100030DB0;
  if (!qword_100030DB0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1000078E8()
{
  uint64_t result = sub_100024C20();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void *sub_100007980()
{
  uint64_t v1 = type metadata accessor for ModelMetadataItem();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = __chkstk_darwin(v1);
  char v52 = (char *)&v51 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __chkstk_darwin(v3);
  char v51 = (char *)&v51 - v6;
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v51 - v8;
  uint64_t v10 = __chkstk_darwin(v7);
  uint64_t v12 = (char *)&v51 - v11;
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v51 - v13;
  uint64_t v15 = v0[13];
  uint64_t v16 = v0[14];
  swift_bridgeObjectRetain();
  sub_100024C10();
  uint64_t v17 = &v14[*(int *)(v1 + 20)];
  strcpy(v17, "Availability");
  v17[13] = 0;
  *((_WORD *)v17 + 7) = -5120;
  id v18 = &v14[*(int *)(v1 + 24)];
  *(void *)id v18 = v15;
  *((void *)v18 + 1) = v16;
  uint64_t v19 = (void *)sub_1000101B4(0, 1, 1, _swiftEmptyArrayStorage);
  unint64_t v21 = v19[2];
  unint64_t v20 = v19[3];
  if (v21 >= v20 >> 1) {
    uint64_t v19 = (void *)sub_1000101B4(v20 > 1, v21 + 1, 1, v19);
  }
  v19[2] = v21 + 1;
  unint64_t v22 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v23 = *(void *)(v2 + 72);
  sub_100007DF8((uint64_t)v14, (uint64_t)v19 + v22 + v23 * v21);
  uint64_t v24 = v0[9];
  uint64_t v25 = v0[10];
  swift_bridgeObjectRetain();
  sub_100024C10();
  uint64_t v26 = &v12[*(int *)(v1 + 20)];
  *(void *)uint64_t v26 = 0x7470697263736544;
  *((void *)v26 + 1) = 0xEB000000006E6F69;
  uint64_t v27 = &v12[*(int *)(v1 + 24)];
  *(void *)uint64_t v27 = v24;
  *((void *)v27 + 1) = v25;
  unint64_t v29 = v19[2];
  unint64_t v28 = v19[3];
  if (v29 >= v28 >> 1) {
    uint64_t v19 = (void *)sub_1000101B4(v28 > 1, v29 + 1, 1, v19);
  }
  v19[2] = v29 + 1;
  sub_100007DF8((uint64_t)v12, (uint64_t)v19 + v22 + v29 * v23);
  uint64_t v30 = v0[5];
  uint64_t v31 = v0[6];
  swift_bridgeObjectRetain();
  sub_100024C10();
  uint64_t v32 = &v9[*(int *)(v1 + 20)];
  *(void *)uint64_t v32 = 0x726F68747541;
  *((void *)v32 + 1) = 0xE600000000000000;
  uint64_t v33 = &v9[*(int *)(v1 + 24)];
  *(void *)uint64_t v33 = v30;
  *((void *)v33 + 1) = v31;
  unint64_t v35 = v19[2];
  unint64_t v34 = v19[3];
  if (v35 >= v34 >> 1) {
    uint64_t v19 = (void *)sub_1000101B4(v34 > 1, v35 + 1, 1, v19);
  }
  uint64_t v36 = (uint64_t)v51;
  v19[2] = v35 + 1;
  sub_100007DF8((uint64_t)v9, (uint64_t)v19 + v22 + v35 * v23);
  uint64_t v37 = v0[7];
  uint64_t v38 = v0[8];
  swift_bridgeObjectRetain();
  sub_100024C10();
  char v39 = (void *)(v36 + *(int *)(v1 + 20));
  *char v39 = 0x65736E6563694CLL;
  v39[1] = 0xE700000000000000;
  char v40 = (void *)(v36 + *(int *)(v1 + 24));
  *char v40 = v37;
  v40[1] = v38;
  unint64_t v42 = v19[2];
  unint64_t v41 = v19[3];
  if (v42 >= v41 >> 1) {
    uint64_t v19 = (void *)sub_1000101B4(v41 > 1, v42 + 1, 1, v19);
  }
  v19[2] = v42 + 1;
  sub_100007DF8(v36, (uint64_t)v19 + v22 + v42 * v23);
  uint64_t v44 = v0[11];
  uint64_t v43 = v0[12];
  swift_bridgeObjectRetain();
  uint64_t v45 = (uint64_t)v52;
  sub_100024C10();
  char v46 = (void *)(v45 + *(int *)(v1 + 20));
  *char v46 = 0x6E6F6973726556;
  v46[1] = 0xE700000000000000;
  uint64_t v47 = (void *)(v45 + *(int *)(v1 + 24));
  *uint64_t v47 = v44;
  v47[1] = v43;
  unint64_t v49 = v19[2];
  unint64_t v48 = v19[3];
  if (v49 >= v48 >> 1) {
    uint64_t v19 = (void *)sub_1000101B4(v48 > 1, v49 + 1, 1, v19);
  }
  v19[2] = v49 + 1;
  sub_100007DF8(v45, (uint64_t)v19 + v22 + v49 * v23);
  return v19;
}

unint64_t sub_100007DA0()
{
  unint64_t result = qword_100030D18;
  if (!qword_100030D18)
  {
    sub_100024C20();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100030D18);
  }
  return result;
}

uint64_t sub_100007DF8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ModelMetadataItem();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t destroy for ModelMetadataViewModel()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ModelMetadataViewModel(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  uint64_t v5 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v5;
  uint64_t v6 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v6;
  uint64_t v7 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v7;
  uint64_t v8 = *(void *)(a2 + 96);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = v8;
  uint64_t v9 = *(void *)(a2 + 112);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(void *)(a1 + 112) = v9;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ModelMetadataViewModel(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy120_8(uint64_t a1, long long *a2)
{
  long long v2 = *a2;
  long long v3 = a2[1];
  long long v4 = a2[3];
  *(_OWORD *)(a1 + 32) = a2[2];
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)a1 = v2;
  *(_OWORD *)(a1 + 16) = v3;
  __n128 result = (__n128)a2[4];
  long long v6 = a2[5];
  long long v7 = a2[6];
  *(void *)(a1 + 112) = *((void *)a2 + 14);
  *(_OWORD *)(a1 + 80) = v6;
  *(_OWORD *)(a1 + 96) = v7;
  *(__n128 *)(a1 + 64) = result;
  return result;
}

uint64_t assignWithTake for ModelMetadataViewModel(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v4 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = *(void *)(a2 + 96);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = v9;
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void *)(a2 + 112);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(void *)(a1 + 112) = v10;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ModelMetadataViewModel(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 120)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ModelMetadataViewModel(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 120) = 1;
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
    *(unsigned char *)(result + 120) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ModelMetadataViewModel()
{
  return &type metadata for ModelMetadataViewModel;
}

uint64_t sub_100008208()
{
  uint64_t v1 = 0x64696C61766E49;
  switch((unint64_t)[v0 type])
  {
    case 0uLL:
      return v1;
    case 1uLL:
      return 0x3436746E49;
    case 2uLL:
      return 0x656C62756F44;
    case 3uLL:
      return 0x676E69727453;
    case 4uLL:
      uint64_t v1 = 0x6E776F6E6B6E55;
      if ([v0 constraint])
      {
        self;
        unint64_t v2 = (void *)swift_dynamicCastObjCClass();
        if (!v2) {
          goto LABEL_21;
        }
        long long v3 = v2;
        id v4 = [v2 imageSize];
        [v4 pixelsWide];

        v25[0] = sub_1000251D0();
        v25[1] = v5;
        v26._countAndFlagsBits = 32;
        v26._object = (void *)0xE100000000000000;
        sub_100024FF0(v26);
        v27._countAndFlagsBits = 38851;
        v27._object = (void *)0xA200000000000000;
        sub_100024FF0(v27);
        v28._countAndFlagsBits = 32;
        v28._object = (void *)0xE100000000000000;
        sub_100024FF0(v28);
        id v6 = [v3 imageSize];
        [v6 pixelsHigh];

        v29._countAndFlagsBits = sub_1000251D0();
        sub_100024FF0(v29);
        swift_unknownObjectRelease();
        swift_bridgeObjectRelease();
        return v25[0];
      }
      return v1;
    case 5uLL:
      uint64_t v1 = 0x6E776F6E6B6E55;
      if (![v0 constraint]) {
        return v1;
      }
      self;
      uint64_t v7 = swift_dynamicCastObjCClass();
      if (!v7) {
        goto LABEL_21;
      }
      uint64_t v8 = (void *)v7;
      sub_1000250E0(17);
      swift_bridgeObjectRelease();
      strcpy((char *)v25, "MultiArray (");
      BYTE5(v25[1]) = 0;
      HIWORD(v25[1]) = -5120;
      uint64_t v9 = (uint64_t)[v8 dataType];
      if (v9 > 65599)
      {
        if (v9 == 65600)
        {
          v11._countAndFlagsBits = 0x656C62756F44;
          uint64_t v10 = (void *)0xE600000000000000;
          goto LABEL_31;
        }
        if (v9 == 131104)
        {
          uint64_t v10 = (void *)0xE500000000000000;
          v11._countAndFlagsBits = 0x3233746E49;
          goto LABEL_31;
        }
      }
      else
      {
        if (v9 == 65552)
        {
          uint64_t v10 = (void *)0xE700000000000000;
          v11._countAndFlagsBits = 0x363174616F6C46;
          goto LABEL_31;
        }
        if (v9 == 65568)
        {
          uint64_t v10 = (void *)0xE700000000000000;
          v11._countAndFlagsBits = 0x323374616F6C46;
LABEL_31:
          v11._object = v10;
          sub_100024FF0(v11);
          swift_bridgeObjectRelease();
          id v18 = [v8 shape];
          sub_100008938();
          unint64_t v19 = sub_100025040();

          unint64_t v20 = sub_100008978(v19);
          unint64_t v22 = v21;
          swift_bridgeObjectRelease();
          v33._countAndFlagsBits = (uint64_t)v20;
          v33._object = v22;
          sub_100024FF0(v33);
          goto LABEL_32;
        }
      }
      uint64_t v10 = (void *)0xEC00000064657A69;
      v11._countAndFlagsBits = 0x6E676F6365726E55;
      goto LABEL_31;
    case 6uLL:
      if (![v0 constraint]) {
        return 0x6E776F6E6B6E55;
      }
      self;
      uint64_t v12 = swift_dynamicCastObjCClass();
      if (v12)
      {
        uint64_t v13 = (void *)v12;
        sub_1000250E0(26);
        swift_bridgeObjectRelease();
        strcpy((char *)v25, "Dictionary (");
        BYTE5(v25[1]) = 0;
        HIWORD(v25[1]) = -5120;
        id v14 = [v13 keyType];
        uint64_t v15 = (void *)0xE700000000000000;
        switch((unint64_t)v14)
        {
          case 0uLL:
            break;
          case 1uLL:
            uint64_t v15 = (void *)0xE500000000000000;
            uint64_t v1 = 0x3436746E49;
            break;
          case 2uLL:
            uint64_t v15 = (void *)0xE600000000000000;
            uint64_t v1 = 0x656C62756F44;
            break;
          case 3uLL:
            uint64_t v15 = (void *)0xE600000000000000;
            uint64_t v1 = 0x676E69727453;
            break;
          case 4uLL:
            uint64_t v15 = (void *)0xE500000000000000;
            uint64_t v1 = 0x6567616D49;
            break;
          case 5uLL:
            uint64_t v1 = 0x72724169746C754DLL;
            uint64_t v15 = (void *)0xEA00000000007961;
            break;
          case 6uLL:
            uint64_t v15 = (void *)0xEA00000000007972;
            uint64_t v1 = 0x616E6F6974636944;
            break;
          case 7uLL:
            uint64_t v15 = (void *)0xE800000000000000;
            uint64_t v1 = 0x65636E6575716553;
            break;
          default:
            uint64_t v1 = 0x6E776F6E6B6E55;
            break;
        }
        v34._countAndFlagsBits = v1;
        v34._object = v15;
        sub_100024FF0(v34);
        swift_bridgeObjectRelease();
        v23._countAndFlagsBits = 0x756F44209286E220;
        v23._object = (void *)0xAC00000029656C62;
        goto LABEL_41;
      }
      swift_unknownObjectRelease();
      return 0x6E776F6E6B6E55;
    case 7uLL:
      uint64_t v1 = 0x6E776F6E6B6E55;
      if (![v0 constraint]) {
        return v1;
      }
      self;
      uint64_t v16 = swift_dynamicCastObjCClass();
      if (v16)
      {
        uint64_t v17 = (void *)v16;
        sub_1000250E0(18);
        swift_bridgeObjectRelease();
        strcpy((char *)v25, "Sequence (");
        BYTE3(v25[1]) = 0;
        HIDWORD(v25[1]) = -369098752;
        [v17 countRange];
        v30._countAndFlagsBits = sub_1000251D0();
        sub_100024FF0(v30);
        swift_bridgeObjectRelease();
        v31._countAndFlagsBits = 10911970;
        v31._object = (void *)0xA300000000000000;
        sub_100024FF0(v31);
        [v17 countRange];
        v32._countAndFlagsBits = sub_1000251D0();
        sub_100024FF0(v32);
LABEL_32:
        swift_bridgeObjectRelease();
        v23._countAndFlagsBits = 41;
        v23._object = (void *)0xE100000000000000;
LABEL_41:
        sub_100024FF0(v23);
        swift_unknownObjectRelease();
        return v25[0];
      }
      else
      {
LABEL_21:
        swift_unknownObjectRelease();
      }
      return v1;
    default:
      return 0x6E776F6E6B6E55;
  }
}

unint64_t sub_100008938()
{
  unint64_t result = qword_100030DF0;
  if (!qword_100030DF0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100030DF0);
  }
  return result;
}

char *sub_100008978(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v14 = sub_100025150();
    swift_bridgeObjectRelease();
    if (v14)
    {
      swift_bridgeObjectRetain();
      uint64_t v2 = sub_100025150();
      swift_bridgeObjectRelease();
      if (!v2)
      {
LABEL_14:
        __swift_instantiateConcreteTypeFromMangledName(&qword_100030DF8);
        sub_100008B74();
        uint64_t v15 = sub_100024F80();
        uint64_t v17 = v16;
        swift_bridgeObjectRelease();
        v18._countAndFlagsBits = v15;
        v18._object = v17;
        sub_100024FF0(v18);
        swift_bridgeObjectRelease();
        return (char *)32;
      }
      goto LABEL_3;
    }
    return 0;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v2) {
    return 0;
  }
LABEL_3:
  unint64_t result = sub_100010534(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    uint64_t v4 = 0;
    do
    {
      if ((a1 & 0xC000000000000001) != 0) {
        id v5 = (id)sub_100025100();
      }
      else {
        id v5 = *(id *)(a1 + 8 * v4 + 32);
      }
      id v6 = v5;
      id v7 = objc_msgSend(v5, "description", _swiftEmptyArrayStorage);
      uint64_t v8 = sub_100024FC0();
      uint64_t v10 = v9;

      unint64_t v12 = _swiftEmptyArrayStorage[2];
      unint64_t v11 = _swiftEmptyArrayStorage[3];
      if (v12 >= v11 >> 1) {
        sub_100010534((char *)(v11 > 1), v12 + 1, 1);
      }
      ++v4;
      _swiftEmptyArrayStorage[2] = v12 + 1;
      uint64_t v13 = &_swiftEmptyArrayStorage[2 * v12];
      v13[4] = v8;
      v13[5] = v10;
    }
    while (v2 != v4);
    goto LABEL_14;
  }
  __break(1u);
  return result;
}

unint64_t sub_100008B74()
{
  unint64_t result = qword_100030E00;
  if (!qword_100030E00)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_100030DF8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100030E00);
  }
  return result;
}

ValueMetadata *type metadata accessor for AdditionalMetadataSectionCardView()
{
  return &type metadata for AdditionalMetadataSectionCardView;
}

uint64_t sub_100008BE0(uint64_t a1)
{
  return _swift_getOpaqueTypeConformance2(a1, &unk_100027E9C, 1);
}

uint64_t sub_100008BFC@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13)
{
  if (a2) {
    a1 = -INFINITY;
  }
  if (a4) {
    a3 = a1;
  }
  if (a6) {
    a5 = a3;
  }
  if (a1 > a3 || a3 > a5) {
    goto LABEL_22;
  }
  if (a8) {
    a7 = -INFINITY;
  }
  if (a11) {
    a10 = a7;
  }
  if (a13) {
    a12 = a10;
  }
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_100025090();
    Swift::String v23 = (void *)sub_100024D70();
    sub_100024C40();
  }
  sub_100024D00();
  long long v24 = *(_OWORD *)(v13 + 176);
  *(_OWORD *)(a9 + 160) = *(_OWORD *)(v13 + 160);
  *(_OWORD *)(a9 + 176) = v24;
  long long v25 = *(_OWORD *)(v13 + 112);
  *(_OWORD *)(a9 + 96) = *(_OWORD *)(v13 + 96);
  *(_OWORD *)(a9 + 112) = v25;
  long long v26 = *(_OWORD *)(v13 + 144);
  *(_OWORD *)(a9 + 128) = *(_OWORD *)(v13 + 128);
  *(_OWORD *)(a9 + 144) = v26;
  long long v27 = *(_OWORD *)(v13 + 48);
  *(_OWORD *)(a9 + 32) = *(_OWORD *)(v13 + 32);
  *(_OWORD *)(a9 + 48) = v27;
  long long v28 = *(_OWORD *)(v13 + 80);
  *(_OWORD *)(a9 + 64) = *(_OWORD *)(v13 + 64);
  *(_OWORD *)(a9 + 80) = v28;
  long long v29 = *(_OWORD *)(v13 + 16);
  *(_OWORD *)a9 = *(_OWORD *)v13;
  *(_OWORD *)(a9 + 16) = v29;
  *(_OWORD *)(a9 + 248) = v34;
  *(_OWORD *)(a9 + 264) = v35;
  *(_OWORD *)(a9 + 280) = v36;
  *(_OWORD *)(a9 + 296) = v37;
  *(_OWORD *)(a9 + 200) = v31;
  *(_OWORD *)(a9 + 216) = v32;
  *(unsigned char *)(a9 + 192) = *(unsigned char *)(v13 + 192);
  *(_OWORD *)(a9 + 232) = v33;
  return sub_10000705C(v13);
}

double sub_100008DE8@<D0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15)
{
  *(void *)&double result = sub_100009270(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, &qword_100030E10, &qword_100030E18).n128_u64[0];
  return result;
}

uint64_t sub_100008E44@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13)
{
  if (a2) {
    a1 = -INFINITY;
  }
  if (a4) {
    a3 = a1;
  }
  if (a6) {
    a5 = a3;
  }
  if (a1 > a3 || a3 > a5) {
    goto LABEL_22;
  }
  if (a8) {
    a7 = -INFINITY;
  }
  if (a11) {
    a10 = a7;
  }
  if (a13) {
    a12 = a10;
  }
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_100025090();
    Swift::String v23 = (void *)sub_100024D70();
    sub_100024C40();
  }
  sub_100024D00();
  long long v24 = *(_OWORD *)(v13 + 112);
  *(_OWORD *)(a9 + 96) = *(_OWORD *)(v13 + 96);
  *(_OWORD *)(a9 + 112) = v24;
  *(_OWORD *)(a9 + 128) = *(_OWORD *)(v13 + 128);
  long long v25 = *(_OWORD *)(v13 + 48);
  *(_OWORD *)(a9 + 32) = *(_OWORD *)(v13 + 32);
  *(_OWORD *)(a9 + 48) = v25;
  long long v26 = *(_OWORD *)(v13 + 80);
  *(_OWORD *)(a9 + 64) = *(_OWORD *)(v13 + 64);
  *(_OWORD *)(a9 + 80) = v26;
  long long v27 = *(_OWORD *)(v13 + 16);
  *(_OWORD *)a9 = *(_OWORD *)v13;
  *(_OWORD *)(a9 + 16) = v27;
  *(_OWORD *)(a9 + 200) = v32;
  *(_OWORD *)(a9 + 216) = v33;
  *(_OWORD *)(a9 + 232) = v34;
  *(_OWORD *)(a9 + 248) = v35;
  *(_OWORD *)(a9 + 152) = v29;
  *(_OWORD *)(a9 + 168) = v30;
  *(unsigned char *)(a9 + 144) = *(unsigned char *)(v13 + 144);
  *(_OWORD *)(a9 + 184) = v31;
  return sub_10000A208(v13);
}

__n128 sub_100009028@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13)
{
  if (a2) {
    a1 = -INFINITY;
  }
  if (a4) {
    a3 = a1;
  }
  if (a6) {
    a5 = a3;
  }
  if (a1 > a3 || a3 > a5) {
    goto LABEL_22;
  }
  if (a8) {
    a7 = -INFINITY;
  }
  if (a11) {
    a10 = a7;
  }
  if (a13) {
    a12 = a10;
  }
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_100025090();
    Swift::String v23 = (void *)sub_100024D70();
    sub_100024C40();
  }
  sub_100024D00();
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_100030EA8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 16))(a9, v13, v24);
  long long v25 = (_OWORD *)(a9 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_100030EB0) + 36));
  v25[4] = v31;
  v25[5] = v32;
  v25[6] = v33;
  *long long v25 = v27;
  v25[1] = v28;
  __n128 result = v30;
  void v25[2] = v29;
  v25[3] = v30;
  return result;
}

double sub_100009214@<D0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15)
{
  *(void *)&double result = sub_100009270(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, &qword_100030E58, &qword_100030E60).n128_u64[0];
  return result;
}

__n128 sub_100009270@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t *a16, uint64_t *a17)
{
  unint64_t v19 = a17;
  if (a2) {
    a1 = -INFINITY;
  }
  if (a4) {
    a3 = a1;
  }
  if (a6) {
    a5 = a3;
  }
  if (a1 > a3 || a3 > a5) {
    goto LABEL_22;
  }
  if (a8) {
    a7 = -INFINITY;
  }
  if (a11) {
    a10 = a7;
  }
  if (a13) {
    a12 = a10;
  }
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_100025090();
    long long v28 = (void *)sub_100024D70();
    sub_100024C40();

    unint64_t v19 = a17;
  }
  sub_100024D00();
  sub_100005B00(v17, a9, a16);
  long long v29 = (_OWORD *)(a9 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(v19) + 36));
  v29[4] = v35;
  v29[5] = v36;
  v29[6] = v37;
  *long long v29 = v31;
  v29[1] = v32;
  __n128 result = v34;
  v29[2] = v33;
  v29[3] = v34;
  return result;
}

double sub_100009440@<D0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15)
{
  *(void *)&double result = sub_100009270(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, &qword_100030E68, &qword_100030E70).n128_u64[0];
  return result;
}

uint64_t sub_10000949C@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13)
{
  if (a2) {
    a1 = -INFINITY;
  }
  if (a4) {
    a3 = a1;
  }
  if (a6) {
    a5 = a3;
  }
  if (a1 > a3 || a3 > a5) {
    goto LABEL_22;
  }
  if (a8) {
    a7 = -INFINITY;
  }
  if (a11) {
    a10 = a7;
  }
  if (a13) {
    a12 = a10;
  }
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_100025090();
    Swift::String v23 = (void *)sub_100024D70();
    sub_100024C40();
  }
  sub_100024D00();
  long long v24 = *(_OWORD *)(v13 + 144);
  *(_OWORD *)(a9 + 128) = *(_OWORD *)(v13 + 128);
  *(_OWORD *)(a9 + 144) = v24;
  *(_OWORD *)(a9 + 160) = *(_OWORD *)(v13 + 160);
  long long v25 = *(_OWORD *)(v13 + 80);
  *(_OWORD *)(a9 + 64) = *(_OWORD *)(v13 + 64);
  *(_OWORD *)(a9 + 80) = v25;
  long long v26 = *(_OWORD *)(v13 + 112);
  *(_OWORD *)(a9 + 96) = *(_OWORD *)(v13 + 96);
  *(_OWORD *)(a9 + 112) = v26;
  long long v27 = *(_OWORD *)(v13 + 16);
  *(_OWORD *)a9 = *(_OWORD *)v13;
  *(_OWORD *)(a9 + 16) = v27;
  long long v28 = *(_OWORD *)(v13 + 48);
  *(_OWORD *)(a9 + 32) = *(_OWORD *)(v13 + 32);
  *(_OWORD *)(a9 + 48) = v28;
  *(_OWORD *)(a9 + 232) = v33;
  *(_OWORD *)(a9 + 248) = v34;
  *(_OWORD *)(a9 + 264) = v35;
  *(_OWORD *)(a9 + 280) = v36;
  *(_OWORD *)(a9 + 184) = v30;
  *(_OWORD *)(a9 + 200) = v31;
  *(unsigned char *)(a9 + 176) = *(unsigned char *)(v13 + 176);
  *(_OWORD *)(a9 + 216) = v32;
  return sub_10000A194(v13);
}

uint64_t sub_100009688@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  v26[0] = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_100030E08);
  __chkstk_darwin(v3 - 8);
  id v5 = (char *)v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_100030E10);
  uint64_t v7 = v6 - 8;
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_100030E18);
  __chkstk_darwin(v10 - 8);
  unint64_t v12 = (char *)v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)id v5 = sub_100024D40();
  *((void *)v5 + 1) = 0;
  v5[16] = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_100030E20);
  v26[1] = a1;
  *(void *)(swift_allocObject() + 16) = a1;
  swift_bridgeObjectRetain_n();
  __swift_instantiateConcreteTypeFromMangledName(&qword_100030E28);
  sub_100024C20();
  sub_10000A0FC(&qword_100030E30, &qword_100030E28);
  sub_100009DF4();
  sub_100009E48();
  sub_100024F20();
  char v13 = sub_100024DB0();
  sub_100024C90();
  uint64_t v15 = v14;
  uint64_t v17 = v16;
  uint64_t v19 = v18;
  uint64_t v21 = v20;
  sub_100005B00((uint64_t)v5, (uint64_t)v9, &qword_100030E08);
  unint64_t v22 = &v9[*(int *)(v7 + 44)];
  *unint64_t v22 = v13;
  *((void *)v22 + 1) = v15;
  *((void *)v22 + 2) = v17;
  *((void *)v22 + 3) = v19;
  *((void *)v22 + 4) = v21;
  v22[40] = 0;
  sub_100005B64((uint64_t)v5, &qword_100030E08);
  uint64_t v23 = sub_100024F40();
  sub_100009270(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v12, 0.0, 1, INFINITY, 0, v23, v24, &qword_100030E10, &qword_100030E18);
  sub_100005B64((uint64_t)v9, &qword_100030E10);
  sub_100005B00((uint64_t)v12, v26[0], &qword_100030E18);
  return sub_100005B64((uint64_t)v12, &qword_100030E18);
}

uint64_t sub_100009990@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v47 = a3;
  uint64_t v5 = type metadata accessor for ModelMetadataItem();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v41 = (uint64_t)&v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_100030E48);
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v40 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_100030E50);
  uint64_t v12 = __chkstk_darwin(v11 - 8);
  uint64_t v42 = (uint64_t)&v40 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __chkstk_darwin(v12);
  uint64_t v16 = (char *)&v40 - v15;
  __chkstk_darwin(v14);
  uint64_t v18 = (char *)&v40 - v17;
  uint64_t v19 = (uint64_t *)(a1 + *(int *)(v5 + 20));
  uint64_t v20 = *v19;
  uint64_t v21 = v19[1];
  unint64_t v22 = (uint64_t *)(a1 + *(int *)(v5 + 24));
  uint64_t v24 = *v22;
  uint64_t v23 = v22[1];
  uint64_t v43 = v20;
  uint64_t v44 = v24;
  uint64_t v45 = v21;
  uint64_t v46 = v23;
  sub_100009EA0(a1, (uint64_t)&v40 - v17);
  long long v25 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56);
  uint64_t v26 = 1;
  v25(v18, 0, 1, v5);
  uint64_t v27 = *(void *)(a2 + 16);
  if (v27)
  {
    sub_100009EA0(a2+ ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))+ *(void *)(v6 + 72) * (v27 - 1), (uint64_t)v16);
    uint64_t v26 = 0;
  }
  v25(v16, v26, 1, v5);
  uint64_t v28 = (uint64_t)&v10[*(int *)(v8 + 48)];
  sub_100005B00((uint64_t)v18, (uint64_t)v10, &qword_100030E50);
  sub_100005B00((uint64_t)v16, v28, &qword_100030E50);
  long long v29 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 48);
  if (v29((uint64_t)v10, 1, v5) != 1)
  {
    uint64_t v34 = v42;
    sub_100005B00((uint64_t)v10, v42, &qword_100030E50);
    int v35 = v29(v28, 1, v5);
    uint64_t v30 = v45;
    uint64_t v31 = v46;
    if (v35 != 1)
    {
      uint64_t v36 = v34;
      uint64_t v37 = v41;
      sub_100007DF8(v28, v41);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      char v38 = sub_100024C00();
      sub_100009F04(v37);
      sub_100005B64((uint64_t)v16, &qword_100030E50);
      sub_100005B64((uint64_t)v18, &qword_100030E50);
      sub_100009F04(v36);
      uint64_t result = sub_100005B64((uint64_t)v10, &qword_100030E50);
      char v33 = v38 ^ 1;
      goto LABEL_10;
    }
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_100005B64((uint64_t)v16, &qword_100030E50);
    sub_100005B64((uint64_t)v18, &qword_100030E50);
    sub_100009F04(v34);
    goto LABEL_8;
  }
  uint64_t v30 = v45;
  swift_bridgeObjectRetain();
  uint64_t v31 = v46;
  swift_bridgeObjectRetain();
  sub_100005B64((uint64_t)v16, &qword_100030E50);
  sub_100005B64((uint64_t)v18, &qword_100030E50);
  if (v29(v28, 1, v5) != 1)
  {
LABEL_8:
    uint64_t result = sub_100005B64((uint64_t)v10, &qword_100030E48);
    char v33 = 1;
    goto LABEL_10;
  }
  uint64_t result = sub_100005B64((uint64_t)v10, &qword_100030E50);
  char v33 = 0;
LABEL_10:
  char v39 = v47;
  *uint64_t v47 = v43;
  v39[1] = v30;
  _OWORD v39[2] = v44;
  v39[3] = v31;
  *((unsigned char *)v39 + 32) = v33 & 1;
  return result;
}

uint64_t sub_100009DAC@<X0>(uint64_t a1@<X8>)
{
  return sub_100009688(*v1, a1);
}

uint64_t sub_100009DB4()
{
  swift_bridgeObjectRelease();
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100009DEC@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return sub_100009990(a1, *(void *)(v2 + 16), a2);
}

unint64_t sub_100009DF4()
{
  unint64_t result = qword_100030E38;
  if (!qword_100030E38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100030E38);
  }
  return result;
}

unint64_t sub_100009E48()
{
  unint64_t result = qword_100030E40;
  if (!qword_100030E40)
  {
    type metadata accessor for ModelMetadataItem();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100030E40);
  }
  return result;
}

uint64_t sub_100009EA0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ModelMetadataItem();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100009F04(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ModelMetadataItem();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_100009F64()
{
  unint64_t result = qword_100030E78;
  if (!qword_100030E78)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_100030E80);
    sub_100009FE0();
    sub_10000A140();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100030E78);
  }
  return result;
}

unint64_t sub_100009FE0()
{
  unint64_t result = qword_100030E88;
  if (!qword_100030E88)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_100030E18);
    sub_10000A05C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100030E88);
  }
  return result;
}

unint64_t sub_10000A05C()
{
  unint64_t result = qword_100030E90;
  if (!qword_100030E90)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_100030E10);
    sub_10000A0FC(&qword_100030E98, &qword_100030E08);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100030E90);
  }
  return result;
}

uint64_t sub_10000A0FC(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_10000A140()
{
  unint64_t result = qword_100030EA0;
  if (!qword_100030EA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100030EA0);
  }
  return result;
}

uint64_t sub_10000A194(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 56);
  uint64_t v3 = *(void *)(a1 + 64);
  char v4 = *(unsigned char *)(a1 + 72);
  sub_1000070C8(*(void *)(a1 + 24), *(void *)(a1 + 32), *(unsigned char *)(a1 + 40));
  swift_bridgeObjectRetain();
  sub_1000070C8(v2, v3, v4);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_10000A208(uint64_t a1)
{
  return a1;
}

uint64_t sub_10000A260()
{
  uint64_t v1 = (SEL *)&ModelViewController;
  id v2 = [v0 modelDescription];
  id v3 = [v2 inputDescriptions];

  unint64_t v4 = sub_10000F258(0, &qword_100030EB8);
  unint64_t v5 = sub_100025040();

  if (v5 >> 62)
  {
LABEL_37:
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_100025150();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v6 = *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (v6 != 1) {
    return 0;
  }
  id v7 = [v0 v1[219]];
  id v8 = [v7 inputDescriptions];

  uint64_t v9 = sub_100025040();
  if ((v9 & 0xC000000000000001) != 0)
  {
    id v10 = (id)sub_100025100();
  }
  else
  {
    if (!*(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_47;
    }
    id v10 = *(id *)(v9 + 32);
  }
  uint64_t v11 = v10;
  swift_bridgeObjectRelease();
  id v12 = [v11 type];

  if (v12 != (id)4 || (sub_10000D6A4() & 1) == 0) {
    return 0;
  }
  id v13 = [v0 v1[219]];
  id v14 = [v13 outputDescriptions];

  unint64_t v4 = sub_100025040();
  if (!(v4 >> 62))
  {
    uint64_t v15 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v15) {
      goto LABEL_11;
    }
    goto LABEL_18;
  }
LABEL_47:
  swift_bridgeObjectRetain();
  uint64_t v15 = sub_100025150();
  if (!v15)
  {
LABEL_18:
    swift_bridgeObjectRelease_n();
    return 0;
  }
LABEL_11:
  uint64_t v16 = 4;
  while (1)
  {
    if ((v4 & 0xC000000000000001) != 0) {
      uint64_t v17 = (SEL *)sub_100025100();
    }
    else {
      uint64_t v17 = (SEL *)*(id *)(v4 + 8 * v16);
    }
    uint64_t v1 = v17;
    uint64_t v18 = v16 - 3;
    if (__OFADD__(v16 - 4, 1))
    {
      __break(1u);
      goto LABEL_37;
    }
    id v19 = [(SEL *)v17 type];

    if (v19 == (id)6) {
      break;
    }
    ++v16;
    if (v18 == v15) {
      goto LABEL_18;
    }
  }
  swift_bridgeObjectRelease_n();
  id v21 = [v0 modelTypeName];
  uint64_t v22 = sub_100024FC0();
  uint64_t v24 = v23;

  if (v22 == 0xD000000000000012 && v24 == 0x80000001000275B0 || (sub_1000251E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return sub_10000D7EC();
  }
  else if (v22 == 0x7373616C436D6C67 && v24 == 0xED00007265696669 {
         || (sub_1000251E0() & 1) != 0
  }
         || v22 == 0xD000000000000017 && v24 == 0x8000000100027650
         || (sub_1000251E0() & 1) != 0
         || v22 == 0xD000000000000016 && v24 == 0x8000000100027670
         || (sub_1000251E0() & 1) != 0
         || v22 == 0xD000000000000017 && v24 == 0x80000001000275F0
         || (sub_1000251E0() & 1) != 0
         || v22 == 0xD00000000000001BLL && v24 == 0x8000000100027690)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v25 = sub_1000251E0();
    swift_bridgeObjectRelease();
    return v25 & 1;
  }
}

uint64_t sub_10000A758()
{
  id v1 = [v0 modelDescription];
  id v2 = [v1 inputDescriptions];

  sub_10000F258(0, &qword_100030EB8);
  unint64_t v3 = sub_100025040();

  if (v3 >> 62) {
    goto LABEL_39;
  }
  uint64_t v4 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v4)
  {
LABEL_14:
    swift_bridgeObjectRelease_n();
    return 0;
  }
LABEL_3:
  uint64_t v5 = 4;
  while (1)
  {
    if ((v3 & 0xC000000000000001) != 0) {
      id v6 = (id)sub_100025100();
    }
    else {
      id v6 = *(id *)(v3 + 8 * v5);
    }
    id v7 = v6;
    uint64_t v8 = v5 - 3;
    if (__OFADD__(v5 - 4, 1))
    {
      __break(1u);
LABEL_39:
      swift_bridgeObjectRetain();
      uint64_t v4 = sub_100025150();
      if (!v4) {
        goto LABEL_14;
      }
      goto LABEL_3;
    }
    id v9 = [v6 name];
    uint64_t v10 = sub_100024FC0();
    uint64_t v12 = v11;

    if (v10 == 0x6E496574617473 && v12 == 0xE700000000000000) {
      break;
    }
    char v14 = sub_1000251E0();
    swift_bridgeObjectRelease();
    if (v14)
    {
      swift_bridgeObjectRelease_n();
      goto LABEL_17;
    }

    ++v5;
    if (v8 == v4) {
      goto LABEL_14;
    }
  }
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease();
LABEL_17:
  if ([v7 type] != (id)5 || !objc_msgSend(v7, "constraint"))
  {

    return 0;
  }
  self;
  id v15 = [(id)swift_dynamicCastObjCClassUnconditional() shape];
  sub_10000F258(0, (unint64_t *)&qword_100030DF0);
  unint64_t v16 = sub_100025040();

  uint64_t v17 = (__objc2_prot_list *)__swift_instantiateConcreteTypeFromMangledName(&qword_100030EC0);
  uint64_t v18 = swift_allocObject();
  *(_OWORD *)(v18 + 16) = xmmword_1000263D0;
  *(NSNumber *)(v18 + 32) = sub_1000250A0(400);
  sub_100025050();
  LOBYTE(v18) = sub_10000E1A4(v16, v18);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v18 & 1) == 0) {
    goto LABEL_64;
  }
  id v19 = [v82 modelDescription];
  id v20 = [v19 inputDescriptions];

  unint64_t v21 = sub_100025040();
  if (!(v21 >> 62))
  {
    uint64_t v22 = *(void *)((v21 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v22) {
      goto LABEL_22;
    }
LABEL_42:
    swift_bridgeObjectRelease();
    if (((unint64_t)_swiftEmptyArrayStorage & 0x8000000000000000) == 0
      && ((unint64_t)_swiftEmptyArrayStorage & 0x4000000000000000) == 0)
    {
      uint64_t v32 = _swiftEmptyArrayStorage[2];
      goto LABEL_45;
    }
    goto LABEL_109;
  }
  swift_bridgeObjectRetain();
  uint64_t v22 = sub_100025150();
  swift_bridgeObjectRelease();
  if (!v22) {
    goto LABEL_42;
  }
LABEL_22:
  if (v22 >= 1)
  {
    for (uint64_t i = 0; i != v22; ++i)
    {
      if ((v21 & 0xC000000000000001) != 0) {
        id v24 = (id)sub_100025100();
      }
      else {
        id v24 = *(id *)(v21 + 8 * i + 32);
      }
      char v25 = v24;
      id v26 = [v24 name];
      uint64_t v27 = sub_100024FC0();
      uint64_t v29 = v28;

      if (v27 == 0x6E496574617473 && v29 == 0xE700000000000000)
      {

        swift_bridgeObjectRelease();
      }
      else
      {
        char v31 = sub_1000251E0();
        swift_bridgeObjectRelease();
        if (v31)
        {
        }
        else
        {
          sub_100025110();
          sub_100025130();
          sub_100025140();
          sub_100025120();
        }
      }
    }
    goto LABEL_42;
  }
  __break(1u);
LABEL_111:
  swift_bridgeObjectRetain();
  uint64_t v36 = sub_100025150();
  swift_bridgeObjectRelease();
LABEL_48:
  swift_bridgeObjectRelease();
  if (v36 != 3) {
    goto LABEL_64;
  }
  id v37 = [v82 modelDescription];
  id v38 = [v37 (SEL)v17[221].count];

  unint64_t v39 = sub_100025040();
  if (!(v39 >> 62))
  {
    uint64_t v40 = *(void *)((v39 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v40) {
      goto LABEL_51;
    }
LABEL_63:
    swift_bridgeObjectRelease_n();
    goto LABEL_64;
  }
  while (2)
  {
    swift_bridgeObjectRetain();
    uint64_t v40 = sub_100025150();
    if (!v40) {
      goto LABEL_63;
    }
LABEL_51:
    uint64_t v41 = 4;
    while (1)
    {
      uint64_t v42 = v41 - 4;
      if ((v39 & 0xC000000000000001) != 0)
      {
        id v43 = (id)sub_100025100();
        uint64_t v44 = v41 - 3;
        if (__OFADD__(v42, 1)) {
          goto LABEL_108;
        }
      }
      else
      {
        id v43 = *(id *)(v39 + 8 * v41);
        uint64_t v44 = v41 - 3;
        if (__OFADD__(v42, 1))
        {
LABEL_108:
          __break(1u);
LABEL_109:
          swift_bridgeObjectRetain();
          uint64_t v32 = sub_100025150();
          swift_release();
LABEL_45:
          swift_release();
          if (!v32) {
            goto LABEL_64;
          }
          id v33 = [v82 modelDescription];
          uint64_t v17 = &ModelViewController;
          id v34 = [v33 outputDescriptions];

          unint64_t v35 = sub_100025040();
          if (!(v35 >> 62))
          {
            uint64_t v36 = *(void *)((v35 & 0xFFFFFFFFFFFFFF8) + 0x10);
            goto LABEL_48;
          }
          goto LABEL_111;
        }
      }
      id v81 = v43;
      id v45 = [v43 name];
      uint64_t v46 = sub_100024FC0();
      uint64_t v48 = v47;

      if (v46 == 0x6C6562616CLL && v48 == 0xE500000000000000)
      {
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        goto LABEL_69;
      }
      char v50 = sub_1000251E0();
      swift_bridgeObjectRelease();
      if (v50) {
        break;
      }

      ++v41;
      if (v44 == v40) {
        goto LABEL_63;
      }
    }
    swift_bridgeObjectRelease_n();
LABEL_69:
    if ([v81 type] != (id)3)
    {

      goto LABEL_65;
    }
    id v52 = [v82 modelDescription];
    id v53 = [v52 outputDescriptions];

    unint64_t v39 = sub_100025040();
    if (!(v39 >> 62))
    {
      uint64_t v54 = *(void *)((v39 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (v54) {
        goto LABEL_72;
      }
LABEL_81:
      swift_bridgeObjectRelease_n();
      uint64_t v63 = v81;
LABEL_82:

LABEL_64:
LABEL_65:
      swift_unknownObjectRelease();
      return 0;
    }
LABEL_116:
    swift_bridgeObjectRetain();
    uint64_t v54 = sub_100025150();
    if (!v54) {
      goto LABEL_81;
    }
LABEL_72:
    uint64_t v55 = 4;
LABEL_73:
    if ((v39 & 0xC000000000000001) != 0) {
      id v56 = (id)sub_100025100();
    }
    else {
      id v56 = *(id *)(v39 + 8 * v55);
    }
    uint64_t v57 = v55 - 3;
    if (__OFADD__(v55 - 4, 1))
    {
      __break(1u);
      continue;
    }
    break;
  }
  id v80 = v56;
  id v58 = [v56 name];
  uint64_t v59 = sub_100024FC0();
  uint64_t v61 = v60;

  if (v59 == 0xD000000000000010 && v61 == 0x8000000100027630)
  {
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    goto LABEL_86;
  }
  char v62 = sub_1000251E0();
  swift_bridgeObjectRelease();
  if ((v62 & 1) == 0)
  {

    ++v55;
    if (v57 == v54) {
      goto LABEL_81;
    }
    goto LABEL_73;
  }
  swift_bridgeObjectRelease_n();
LABEL_86:
  if ([v80 type] != (id)6)
  {

    swift_unknownObjectRelease();
    return 0;
  }
  id v64 = [v82 modelDescription];
  id v65 = [v64 outputDescriptions];

  unint64_t v39 = sub_100025040();
  if (v39 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v66 = sub_100025150();
    if (v66) {
      goto LABEL_89;
    }
LABEL_100:
    swift_bridgeObjectRelease_n();

    uint64_t v63 = v80;
    goto LABEL_82;
  }
  uint64_t v66 = *(void *)((v39 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v66) {
    goto LABEL_100;
  }
LABEL_89:
  uint64_t v67 = 4;
  while (1)
  {
    if ((v39 & 0xC000000000000001) != 0) {
      id v68 = (id)sub_100025100();
    }
    else {
      id v68 = *(id *)(v39 + 8 * v67);
    }
    uint64_t v69 = v68;
    uint64_t v70 = v67 - 3;
    if (__OFADD__(v67 - 4, 1))
    {
      __break(1u);
      goto LABEL_116;
    }
    id v71 = [v68 name];
    uint64_t v72 = sub_100024FC0();
    uint64_t v74 = v73;

    if (v72 == 0x74754F6574617473 && v74 == 0xE800000000000000)
    {
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      goto LABEL_104;
    }
    char v76 = sub_1000251E0();
    swift_bridgeObjectRelease();
    if (v76) {
      break;
    }

    ++v67;
    if (v70 == v66) {
      goto LABEL_100;
    }
  }
  swift_bridgeObjectRelease_n();
LABEL_104:
  if ([v69 type] == (id)5 && objc_msgSend(v7, "constraint"))
  {
    self;
    id v77 = [(id)swift_dynamicCastObjCClassUnconditional() shape];
    unint64_t v78 = sub_100025040();

    uint64_t v79 = swift_allocObject();
    *(_OWORD *)(v79 + 16) = xmmword_1000263D0;
    *(NSNumber *)(v79 + 32) = sub_1000250A0(400);
    sub_100025050();
    LOBYTE(v79) = sub_10000E1A4(v78, v79);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    return v79 & 1;
  }

  swift_unknownObjectRelease();
  return 0;
}

unint64_t sub_10000B388()
{
  id v1 = v0;
  id v2 = &ModelViewController;
  id v3 = [v0 modelDescription];
  id v4 = [v3 inputDescriptions];

  sub_10000F258(0, &qword_100030EB8);
  unint64_t v5 = sub_100025040();

  if (v5 >> 62) {
    goto LABEL_68;
  }
  uint64_t v6 = *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v6)
  {
LABEL_24:
    swift_bridgeObjectRelease_n();
    return 0;
  }
LABEL_3:
  uint64_t v7 = 4;
  while (1)
  {
    if ((v5 & 0xC000000000000001) != 0) {
      id v8 = (id)sub_100025100();
    }
    else {
      id v8 = *(id *)(v5 + 8 * v7);
    }
    id v9 = v8;
    uint64_t v10 = v7 - 3;
    if (__OFADD__(v7 - 4, 1))
    {
      __break(1u);
LABEL_65:

      return 0;
    }
    id v11 = [v8 type];

    if (v11 == (id)4) {
      break;
    }
    ++v7;
    if (v10 == v6) {
      goto LABEL_24;
    }
  }
  swift_bridgeObjectRelease_n();
  id v12 = [v1 (SEL)v2[219].count];
  id v13 = [v12 outputDescriptions];

  unint64_t v14 = sub_100025040();
  if (v14 >> 62)
  {
LABEL_71:
    swift_bridgeObjectRetain();
    uint64_t v15 = sub_100025150();
    if (!v15) {
      goto LABEL_24;
    }
  }
  else
  {
    uint64_t v15 = *(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (!v15) {
      goto LABEL_24;
    }
  }
  id v53 = v1;
  uint64_t v16 = 4;
  while (1)
  {
    if ((v14 & 0xC000000000000001) != 0) {
      id v17 = (id)sub_100025100();
    }
    else {
      id v17 = *(id *)(v14 + 8 * v16);
    }
    unint64_t v5 = (unint64_t)v17;
    id v2 = (__objc2_prot_list *)(v16 - 3);
    if (__OFADD__(v16 - 4, 1))
    {
      __break(1u);
LABEL_68:
      swift_bridgeObjectRetain();
      uint64_t v6 = sub_100025150();
      if (!v6) {
        goto LABEL_24;
      }
      goto LABEL_3;
    }
    id v1 = [v17 name];
    uint64_t v18 = sub_100024FC0();
    uint64_t v20 = v19;

    if (v18 == 0x6E656469666E6F63 && v20 == 0xEA00000000006563)
    {
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      goto LABEL_28;
    }
    char v22 = sub_1000251E0();
    swift_bridgeObjectRelease();
    if (v22) {
      break;
    }

    ++v16;
    if (v2 == (__objc2_prot_list *)v15) {
      goto LABEL_24;
    }
  }
  swift_bridgeObjectRelease_n();
LABEL_28:
  if (objc_msgSend((id)v5, "type", v53) != (id)5)
  {
LABEL_63:

    return 0;
  }
  id v24 = [v54 modelDescription];
  id v25 = [v24 outputDescriptions];

  unint64_t v14 = sub_100025040();
  if (v14 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v26 = sub_100025150();
    if (v26) {
      goto LABEL_31;
    }
    goto LABEL_43;
  }
  uint64_t v26 = *(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v26)
  {
LABEL_43:
    swift_bridgeObjectRelease_n();
    goto LABEL_63;
  }
LABEL_31:
  uint64_t v27 = 4;
  while (1)
  {
    uint64_t v28 = v27 - 4;
    if ((v14 & 0xC000000000000001) != 0)
    {
      id v29 = (id)sub_100025100();
      uint64_t v30 = v27 - 3;
      if (__OFADD__(v28, 1)) {
        goto LABEL_70;
      }
    }
    else
    {
      id v29 = *(id *)(v14 + 8 * v27);
      uint64_t v30 = v27 - 3;
      if (__OFADD__(v28, 1))
      {
LABEL_70:
        __break(1u);
        goto LABEL_71;
      }
    }
    char v31 = v29;
    id v1 = [v29 name];
    uint64_t v32 = sub_100024FC0();
    uint64_t v34 = v33;

    if (v32 == 0x616E6964726F6F63 && v34 == 0xEB00000000736574)
    {
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      goto LABEL_46;
    }
    char v36 = sub_1000251E0();
    swift_bridgeObjectRelease();
    if (v36) {
      break;
    }

    ++v27;
    if (v30 == v26) {
      goto LABEL_43;
    }
  }
  swift_bridgeObjectRelease_n();
LABEL_46:
  id v1 = v31;
  if ([v31 type] != (id)5) {
    goto LABEL_62;
  }
  id v37 = [v54 modelTypeName];
  uint64_t v38 = sub_100024FC0();
  uint64_t v40 = v39;

  if (v38 == 0x656E696C65706970 && v40 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v41 = sub_1000251E0();
    swift_bridgeObjectRelease();
    if ((v41 & 1) == 0) {
      goto LABEL_65;
    }
  }
  id v42 = [v54 subModels];
  if (!v42)
  {
LABEL_62:

    goto LABEL_63;
  }
  id v43 = v42;
  sub_10000F258(0, &qword_100030ED8);
  unint64_t v44 = sub_100025040();

  if (v44 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v45 = sub_100025150();
    swift_bridgeObjectRelease();
    if (!v45) {
      goto LABEL_76;
    }
LABEL_54:
    unint64_t result = v45 - 1;
    if (__OFSUB__(v45, 1))
    {
      __break(1u);
    }
    else if ((v44 & 0xC000000000000001) == 0)
    {
      if ((result & 0x8000000000000000) != 0)
      {
        __break(1u);
      }
      else if (result < *(void *)((v44 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
        id v46 = *(id *)(v44 + 8 * result + 32);
LABEL_59:
        uint64_t v47 = v46;
        swift_bridgeObjectRelease();
        id v48 = [v47 modelTypeName];

        uint64_t v49 = sub_100024FC0();
        uint64_t v51 = v50;

        if (v49 == 0xD000000000000015 && v51 == 0x8000000100027610)
        {
          swift_bridgeObjectRelease();

          return 1;
        }
        else
        {
          char v52 = sub_1000251E0();
          swift_bridgeObjectRelease();

          return v52 & 1;
        }
      }
      __break(1u);
      return result;
    }
    id v46 = (id)sub_100025100();
    goto LABEL_59;
  }
  uint64_t v45 = *(void *)((v44 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v45) {
    goto LABEL_54;
  }
LABEL_76:

  swift_bridgeObjectRelease();
  return 0;
}

void sub_10000BAB4()
{
  id v2 = [v0 modelDescription];
  id v3 = [v2 inputDescriptions];

  sub_10000F258(0, &qword_100030EB8);
  unint64_t v4 = sub_100025040();

  if (v4 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_100025150();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (v5 != 1) {
    return;
  }
  id v6 = [v0 modelDescription];
  id v7 = [v6 inputDescriptions];

  uint64_t v8 = sub_100025040();
  if ((v8 & 0xC000000000000001) != 0)
  {
    id v9 = (id)sub_100025100();
  }
  else
  {
    if (!*(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_19;
    }
    id v9 = *(id *)(v8 + 32);
  }
  uint64_t v10 = v9;
  swift_bridgeObjectRelease();
  id v11 = [v10 type];

  if (v11 != (id)4) {
    return;
  }
  id v12 = [v0 modelDescription];
  id v1 = &ModelViewController;
  id v13 = [v12 outputDescriptions];

  unint64_t v14 = sub_100025040();
  if (!(v14 >> 62))
  {
    uint64_t v15 = *(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10);
    goto LABEL_10;
  }
LABEL_19:
  swift_bridgeObjectRetain();
  uint64_t v15 = sub_100025150();
  swift_bridgeObjectRelease();
LABEL_10:
  swift_bridgeObjectRelease();
  if (v15 == 1)
  {
    id v16 = [v0 modelDescription];
    id v17 = [v16 (SEL)v1[221].count];

    uint64_t v18 = sub_100025040();
    if ((v18 & 0xC000000000000001) != 0)
    {
      id v19 = (id)sub_100025100();
      goto LABEL_14;
    }
    if (*(void *)((v18 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      id v19 = *(id *)(v18 + 32);
LABEL_14:
      uint64_t v20 = v19;
      swift_bridgeObjectRelease();
      [v20 type];

      return;
    }
    __break(1u);
  }
}

void sub_10000BD74()
{
  id v3 = v0;
  id v4 = [v0 modelDescription];
  id v5 = [v4 inputDescriptions];

  sub_10000F258(0, &qword_100030EB8);
  unint64_t v6 = sub_100025040();

  if (v6 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_100025150();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v7 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (v7 == 1)
  {
    id v8 = [v3 modelDescription];
    id v9 = [v8 inputDescriptions];

    unint64_t v10 = sub_100025040();
    if ((v10 & 0xC000000000000001) != 0)
    {
      id v11 = (id)sub_100025100();
    }
    else
    {
      if (!*(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
        __break(1u);
        goto LABEL_43;
      }
      id v11 = *(id *)(v10 + 32);
    }
    id v8 = v11;
    swift_bridgeObjectRelease();
    if ([v8 type] != (id)5 || !objc_msgSend(v8, "constraint"))
    {
LABEL_36:

      return;
    }
    self;
    id v12 = [(id)swift_dynamicCastObjCClassUnconditional() shape];
    unint64_t v10 = sub_10000F258(0, (unint64_t *)&qword_100030DF0);
    unint64_t v1 = sub_100025040();

    if (v1 >> 62) {
      goto LABEL_44;
    }
    if (*(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10) == 3)
    {
      do
      {
        unint64_t v32 = v1 & 0xC000000000000001;
        if ((v1 & 0xC000000000000001) != 0)
        {
          id v13 = (id)sub_100025100();
        }
        else
        {
          if (*(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10) < 2uLL)
          {
            __break(1u);
            goto LABEL_49;
          }
          id v13 = *(id *)(v1 + 40);
        }
        unint64_t v14 = v13;
        Class isa = sub_1000250A0(3).super.super.isa;
        char v16 = sub_1000250B0();

        if ((v16 & 1) == 0) {
          break;
        }
        if (v32)
        {
          id v17 = (id)sub_100025100();
        }
        else
        {
          if (*(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10) < 3uLL)
          {
            __break(1u);
            return;
          }
          id v17 = *(id *)(v1 + 48);
        }
        uint64_t v18 = v17;
        Class v19 = sub_1000250A0(17).super.super.isa;
        char v20 = sub_1000250B0();

        if (v20)
        {
          swift_bridgeObjectRelease();
          id v2 = &ModelViewController;
        }
        else
        {
          if (v32) {
            id v21 = (id)sub_100025100();
          }
          else {
            id v21 = *(id *)(v1 + 48);
          }
          char v22 = v21;
          id v2 = &ModelViewController;
          swift_bridgeObjectRelease();
          Class v23 = sub_1000250A0(18).super.super.isa;
          char v24 = sub_1000250B0();

          if ((v24 & 1) == 0)
          {
            swift_unknownObjectRelease();
            goto LABEL_36;
          }
        }
        id v25 = [v3 modelDescription];
        id v26 = [v25 outputDescriptions];

        unint64_t v10 = sub_100025040();
        if (!(v10 >> 62))
        {
          uint64_t v27 = *(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10);
          swift_bridgeObjectRetain();
          if (!v27) {
            goto LABEL_34;
          }
          goto LABEL_27;
        }
LABEL_49:
        swift_bridgeObjectRetain();
        uint64_t v27 = sub_100025150();
        if (!v27)
        {
LABEL_34:
          swift_bridgeObjectRelease_n();

          swift_unknownObjectRelease();
          return;
        }
LABEL_27:
        uint64_t v28 = 4;
        while (1)
        {
          id v29 = (v10 & 0xC000000000000001) != 0 ? (id)sub_100025100() : *(id *)(v10 + 8 * v28);
          id v3 = v29;
          unint64_t v1 = v28 - 3;
          if (__OFADD__(v28 - 4, 1)) {
            break;
          }
          if ([v29 (SEL)v2[208].count] == (id)6)
          {
            swift_bridgeObjectRelease_n();
            if ([v3 constraint])
            {
              self;
              uint64_t v30 = (void *)swift_dynamicCastObjCClassUnconditional();
              swift_unknownObjectRetain();
              [v30 keyType];

              swift_unknownObjectRelease_n();
              swift_unknownObjectRelease();
            }
            else
            {

              swift_unknownObjectRelease();
            }
            return;
          }

          ++v28;
          if (v1 == v27) {
            goto LABEL_34;
          }
        }
LABEL_43:
        __break(1u);
LABEL_44:
        swift_bridgeObjectRetain();
        uint64_t v31 = sub_100025150();
        swift_bridgeObjectRelease();
      }
      while (v31 == 3);
    }
    swift_unknownObjectRelease();

    swift_bridgeObjectRelease();
  }
}

unint64_t sub_10000C2E0()
{
  id v1 = [v0 modelTypeName];
  uint64_t v2 = sub_100024FC0();
  uint64_t v4 = v3;

  if (v2 == 0xD000000000000012 && v4 == 0x80000001000275B0)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v5 = sub_1000251E0();
    swift_bridgeObjectRelease();
    char v6 = 0;
    if ((v5 & 1) == 0) {
      return v6 & 1;
    }
  }
  id v7 = [v0 subModels];
  if (!v7)
  {
    char v6 = 0;
    return v6 & 1;
  }
  id v8 = v7;
  sub_10000F258(0, &qword_100030ED8);
  unint64_t v9 = sub_100025040();

  if (v9 >> 62)
  {
    swift_bridgeObjectRetain();
    unint64_t result = sub_100025150();
    unint64_t v10 = result;
    if (!result) {
      goto LABEL_37;
    }
  }
  else
  {
    unint64_t v10 = *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
    unint64_t result = swift_bridgeObjectRetain();
    if (!v10) {
      goto LABEL_37;
    }
  }
  if ((v9 & 0xC000000000000001) != 0)
  {
    id v12 = (id)sub_100025100();
  }
  else
  {
    if (!*(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_42;
    }
    id v12 = *(id *)(v9 + 32);
  }
  id v13 = v12;
  swift_bridgeObjectRelease();
  id v14 = [v13 modelTypeName];

  uint64_t v15 = sub_100024FC0();
  uint64_t v17 = v16;

  unint64_t result = v10 - 1;
  if (__OFSUB__(v10, 1))
  {
LABEL_42:
    __break(1u);
LABEL_43:
    __break(1u);
    goto LABEL_44;
  }
  if ((v9 & 0xC000000000000001) != 0)
  {
    id v18 = (id)sub_100025100();
    goto LABEL_18;
  }
  if ((result & 0x8000000000000000) != 0) {
    goto LABEL_43;
  }
  if (result < *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v18 = *(id *)(v9 + 8 * result + 32);
LABEL_18:
    Class v19 = v18;
    swift_bridgeObjectRelease();
    id v20 = [v19 modelTypeName];

    uint64_t v21 = sub_100024FC0();
    uint64_t v23 = v22;

    BOOL v24 = v15 == 0xD00000000000001ALL && v17 == 0x80000001000275D0;
    char v25 = v24;
    if (v24 || (sub_1000251E0() & 1) != 0)
    {
      if (v21 == 0x7373616C436D6C67 && v23 == 0xED00007265696669 || (sub_1000251E0() & 1) != 0) {
        goto LABEL_33;
      }
      if (v25) {
        goto LABEL_32;
      }
    }
    if (sub_1000251E0())
    {
LABEL_32:
      if (v21 != 0xD000000000000017 || v23 != 0x80000001000275F0)
      {
        char v6 = sub_1000251E0();
        swift_bridgeObjectRelease();
        goto LABEL_38;
      }
LABEL_33:
      swift_bridgeObjectRelease();
      char v6 = 1;
LABEL_38:
      swift_bridgeObjectRelease();
      return v6 & 1;
    }
LABEL_37:
    swift_bridgeObjectRelease();
    char v6 = 0;
    goto LABEL_38;
  }
LABEL_44:
  __break(1u);
  return result;
}

void sub_10000C68C()
{
  id v1 = [v0 modelTypeName];
  uint64_t v2 = sub_100024FC0();
  uint64_t v4 = v3;

  if (v2 == 0xD000000000000012 && v4 == 0x80000001000275B0)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v5 = sub_1000251E0();
    swift_bridgeObjectRelease();
    if ((v5 & 1) == 0) {
      return;
    }
  }
  id v6 = [v0 subModels];
  if (v6)
  {
    id v7 = v6;
    sub_10000F258(0, &qword_100030ED8);
    unint64_t v8 = sub_100025040();

    if (v8 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v22 = sub_100025150();
      swift_bridgeObjectRelease();
      if (v22 != 2) {
        goto LABEL_24;
      }
    }
    else if (*(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10) != 2)
    {
      goto LABEL_24;
    }
    if ((v8 & 0xC000000000000001) != 0)
    {
      id v9 = (id)sub_100025100();
    }
    else
    {
      if (!*(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
        __break(1u);
        goto LABEL_28;
      }
      id v9 = *(id *)(v8 + 32);
    }
    unint64_t v10 = v9;
    id v11 = [v9 modelTypeName];

    uint64_t v12 = sub_100024FC0();
    uint64_t v14 = v13;

    if (v12 == 0xD000000000000011 && v14 == 0x8000000100027570)
    {
      swift_bridgeObjectRelease();
LABEL_15:
      if ((v8 & 0xC000000000000001) != 0)
      {
        id v16 = (id)sub_100025100();
LABEL_19:
        uint64_t v17 = v16;
        swift_bridgeObjectRelease();
        id v18 = [v17 modelTypeName];

        uint64_t v19 = sub_100024FC0();
        uint64_t v21 = v20;

        if (v19 == 0x7373616C436D6C67 && v21 == 0xED00007265696669)
        {
          swift_bridgeObjectRelease();
        }
        else
        {
          sub_1000251E0();
          swift_bridgeObjectRelease();
        }
        return;
      }
      if (*(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10) >= 2uLL)
      {
        id v16 = *(id *)(v8 + 40);
        goto LABEL_19;
      }
LABEL_28:
      __break(1u);
      return;
    }
    char v15 = sub_1000251E0();
    swift_bridgeObjectRelease();
    if (v15) {
      goto LABEL_15;
    }
LABEL_24:
    swift_bridgeObjectRelease();
  }
}

void sub_10000C9A4()
{
  id v1 = [v0 modelTypeName];
  uint64_t v2 = sub_100024FC0();
  uint64_t v4 = v3;

  if (v2 == 0xD000000000000011 && v4 == 0x8000000100027550)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v5 = sub_1000251E0();
    swift_bridgeObjectRelease();
    if ((v5 & 1) == 0) {
      return;
    }
  }
  id v6 = [v0 subModels];
  if (v6)
  {
    id v7 = v6;
    sub_10000F258(0, &qword_100030ED8);
    unint64_t v8 = sub_100025040();

    if (v8 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v22 = sub_100025150();
      swift_bridgeObjectRelease();
      if (v22 != 2) {
        goto LABEL_24;
      }
    }
    else if (*(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10) != 2)
    {
      goto LABEL_24;
    }
    if ((v8 & 0xC000000000000001) != 0)
    {
      id v9 = (id)sub_100025100();
    }
    else
    {
      if (!*(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
        __break(1u);
        goto LABEL_28;
      }
      id v9 = *(id *)(v8 + 32);
    }
    unint64_t v10 = v9;
    id v11 = [v9 modelTypeName];

    uint64_t v12 = sub_100024FC0();
    uint64_t v14 = v13;

    if (v12 == 0xD000000000000011 && v14 == 0x8000000100027570)
    {
      swift_bridgeObjectRelease();
LABEL_15:
      if ((v8 & 0xC000000000000001) != 0)
      {
        id v16 = (id)sub_100025100();
LABEL_19:
        uint64_t v17 = v16;
        swift_bridgeObjectRelease();
        id v18 = [v17 modelTypeName];

        uint64_t v19 = sub_100024FC0();
        uint64_t v21 = v20;

        if (v19 == 0xD000000000000015 && v21 == 0x8000000100027590)
        {
          swift_bridgeObjectRelease();
        }
        else
        {
          sub_1000251E0();
          swift_bridgeObjectRelease();
        }
        return;
      }
      if (*(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10) >= 2uLL)
      {
        id v16 = *(id *)(v8 + 40);
        goto LABEL_19;
      }
LABEL_28:
      __break(1u);
      return;
    }
    char v15 = sub_1000251E0();
    swift_bridgeObjectRelease();
    if (v15) {
      goto LABEL_15;
    }
LABEL_24:
    swift_bridgeObjectRelease();
  }
}

BOOL sub_10000CC8C()
{
  uint64_t v3 = v0;
  uint64_t v4 = (uint64_t)&ModelViewController;
  id v5 = [v0 modelDescription];
  id v6 = [v5 inputDescriptions];

  sub_10000F258(0, &qword_100030EB8);
  unint64_t v7 = sub_100025040();

  if (v7 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v8 = sub_100025150();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v8 = *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (v8 != 1) {
    return 0;
  }
  id v9 = [v3 modelDescription];
  id v10 = [v9 inputDescriptions];

  unint64_t v11 = sub_100025040();
  if ((v11 & 0xC000000000000001) != 0)
  {
LABEL_28:
    id v12 = (id)sub_100025100();
  }
  else
  {
    if (!*(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_30;
    }
    id v12 = *(id *)(v11 + 32);
  }
  id v9 = v12;
  swift_bridgeObjectRelease();
  id v1 = &ModelViewController;
  if ([v9 type] != (id)5
    || (uint64_t v2 = &ModelViewController, ![v9 constraint]))
  {

    return 0;
  }
  self;
  id v13 = [(id)swift_dynamicCastObjCClassUnconditional() shape];
  sub_10000F258(0, (unint64_t *)&qword_100030DF0);
  unint64_t v14 = sub_100025040();

  __swift_instantiateConcreteTypeFromMangledName(&qword_100030EC0);
  uint64_t v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = xmmword_1000263E0;
  *(NSNumber *)(v15 + 32) = sub_1000250A0(1);
  *(NSNumber *)(v15 + 40) = sub_1000250A0(3);
  *(NSNumber *)(v15 + 48) = sub_1000250A0(21);
  sub_100025050();
  LOBYTE(v15) = sub_10000E1A4(v14, v15);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v15 & 1) == 0) {
    goto LABEL_20;
  }
  id v16 = [v3 *(SEL *)(v4 + 1752)];
  id v17 = [v16 outputDescriptions];

  unint64_t v11 = sub_100025040();
  if (!(v11 >> 62))
  {
    uint64_t v18 = *(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v18) {
      goto LABEL_12;
    }
    goto LABEL_19;
  }
LABEL_30:
  swift_bridgeObjectRetain();
  uint64_t v18 = sub_100025150();
  if (!v18)
  {
LABEL_19:
    swift_bridgeObjectRelease_n();
LABEL_20:

    swift_unknownObjectRelease();
    return 0;
  }
LABEL_12:
  uint64_t v4 = 4;
  while (1)
  {
    if ((v11 & 0xC000000000000001) != 0) {
      id v19 = (id)sub_100025100();
    }
    else {
      id v19 = *(id *)(v11 + 8 * v4);
    }
    uint64_t v3 = v19;
    uint64_t v20 = v4 - 3;
    if (__OFADD__(v4 - 4, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if ([v19 (SEL)v1[208].count] == (id)6) {
      break;
    }

    ++v4;
    if (v20 == v18) {
      goto LABEL_19;
    }
  }
  swift_bridgeObjectRelease_n();
  if ([v3 (SEL)v2[209].count])
  {
    self;
    uint64_t v22 = (void *)swift_dynamicCastObjCClassUnconditional();
    swift_unknownObjectRetain();
    id v23 = [v22 keyType];

    swift_unknownObjectRelease_n();
    swift_unknownObjectRelease();
    return v23 == (id)3;
  }

  swift_unknownObjectRelease();
  return 0;
}

uint64_t sub_10000D0E0()
{
  uint64_t v3 = v0;
  id v4 = [v0 modelDescription];
  id v5 = [v4 inputDescriptions];

  sub_10000F258(0, &qword_100030EB8);
  unint64_t v6 = sub_100025040();

  if (v6 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_100025150();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v7 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (v7 != 1) {
    return 0;
  }
  id v8 = [v3 modelDescription];
  id v9 = [v8 inputDescriptions];

  uint64_t v10 = sub_100025040();
  if ((v10 & 0xC000000000000001) != 0)
  {
LABEL_43:
    id v11 = (id)sub_100025100();
  }
  else
  {
    if (!*(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_45;
    }
    id v11 = *(id *)(v10 + 32);
  }
  id v8 = v11;
  swift_bridgeObjectRelease();
  if ([v8 type] != (id)5 || !objc_msgSend(v8, "constraint"))
  {

    return 0;
  }
  self;
  id v12 = [(id)swift_dynamicCastObjCClassUnconditional() shape];
  sub_10000F258(0, (unint64_t *)&qword_100030DF0);
  unint64_t v1 = sub_100025040();

  unint64_t v2 = v1 >> 62;
  if (!(v1 >> 62))
  {
    int64_t v13 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v13 >= 1) {
      uint64_t v14 = 1;
    }
    else {
      uint64_t v14 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    if (v13 >= (unint64_t)v14)
    {
LABEL_14:
      if ((v1 & 0xC000000000000001) != 0 && (unint64_t)v13 >= 2)
      {
        Swift::Int v15 = v14;
        do
        {
          Swift::Int v16 = v15 + 1;
          sub_1000250F0(v15);
          Swift::Int v15 = v16;
        }
        while (v13 != v16);
      }
      if (v2)
      {
        swift_bridgeObjectRetain();
        sub_100025160();
        id v9 = v17;
        uint64_t v14 = v18;
        int64_t v13 = v19;
        swift_bridgeObjectRelease_n();
      }
      else
      {
        id v9 = (id)((v1 & 0xFFFFFFFFFFFFFF8) + 32);
        int64_t v13 = (2 * v13) | 1;
      }
      __swift_instantiateConcreteTypeFromMangledName(&qword_100030EC0);
      unint64_t v1 = swift_allocObject();
      *(_OWORD *)(v1 + 16) = xmmword_1000263F0;
      *(NSNumber *)(v1 + 32) = sub_1000250A0(3);
      *(NSNumber *)(v1 + 40) = sub_1000250A0(21);
      sub_100025050();
      if ((v1 & 0x8000000000000000) == 0 && (v1 & 0x4000000000000000) == 0)
      {
        uint64_t v20 = v1 & 0xFFFFFFFFFFFFFF8;
LABEL_25:
        sub_10000ECFC((uint64_t)v9, v14, v13, v20 + 32, 0, (2 * *(void *)(v20 + 16)) | 1);
        char v22 = v21;
        swift_unknownObjectRelease();
        swift_release();
        if (v22)
        {
          id v23 = [v3 modelDescription];
          id v24 = [v23 outputDescriptions];

          unint64_t v25 = sub_100025040();
          if (v25 >> 62)
          {
            swift_bridgeObjectRetain();
            uint64_t v26 = sub_100025150();
            uint64_t v27 = &ModelViewController;
            if (v26)
            {
LABEL_28:
              id v9 = (id)(v25 & 0xC000000000000001);
              uint64_t v28 = 4;
              while (1)
              {
                if (v9) {
                  id v29 = (id)sub_100025100();
                }
                else {
                  id v29 = *(id *)(v25 + 8 * v28);
                }
                uint64_t v3 = v29;
                uint64_t v30 = v28 - 3;
                if (__OFADD__(v28 - 4, 1))
                {
                  __break(1u);
                  goto LABEL_43;
                }
                if ([v29 (SEL)v27[208].count] == (id)6) {
                  break;
                }

                ++v28;
                if (v30 == v26) {
                  goto LABEL_35;
                }
              }
              swift_bridgeObjectRelease_n();
              if ([v3 constraint])
              {
                self;
                unint64_t v32 = (void *)swift_dynamicCastObjCClassUnconditional();
                swift_unknownObjectRetain();
                id v33 = [v32 keyType];

                swift_unknownObjectRelease_n();
                swift_unknownObjectRelease();
                return v33 == (id)3;
              }

              swift_unknownObjectRelease();
              return 0;
            }
          }
          else
          {
            uint64_t v26 = *(void *)((v25 & 0xFFFFFFFFFFFFFF8) + 0x10);
            swift_bridgeObjectRetain();
            uint64_t v27 = &ModelViewController;
            if (v26) {
              goto LABEL_28;
            }
          }
LABEL_35:
          swift_bridgeObjectRelease_n();
        }

        swift_unknownObjectRelease();
        return 0;
      }
LABEL_53:
      uint64_t v20 = (uint64_t)sub_10000E490(v1);
      swift_bridgeObjectRelease();
      goto LABEL_25;
    }
    goto LABEL_52;
  }
LABEL_45:
  swift_bridgeObjectRetain();
  int64_t v13 = sub_100025150();
  uint64_t result = swift_bridgeObjectRelease();
  if ((v13 & 0x8000000000000000) == 0)
  {
    if (v13 >= 1) {
      uint64_t v14 = 1;
    }
    else {
      uint64_t v14 = v13;
    }
    swift_bridgeObjectRetain();
    id v9 = (id)sub_100025150();
    swift_bridgeObjectRelease();
    if ((uint64_t)v9 >= v14)
    {
      swift_bridgeObjectRetain();
      id v9 = (id)sub_100025150();
      swift_bridgeObjectRelease();
      if ((uint64_t)v9 >= v13) {
        goto LABEL_14;
      }
      __break(1u);
    }
LABEL_52:
    __break(1u);
    goto LABEL_53;
  }
  __break(1u);
  return result;
}

uint64_t sub_10000D6A4()
{
  unint64_t v1 = v0;
  id v2 = [v0 modelDescription];
  id v3 = [v2 predictedFeatureName];

  if (v3)
  {
    uint64_t v4 = sub_100024FC0();
    unint64_t v6 = v5;

    uint64_t v7 = HIBYTE(v6) & 0xF;
    if ((v6 & 0x2000000000000000) == 0) {
      uint64_t v7 = v4 & 0xFFFFFFFFFFFFLL;
    }
    if (v7)
    {
      id v8 = [v1 modelDescription];
      id v9 = [v8 outputDescriptions];

      sub_10000F258(0, &qword_100030EB8);
      unint64_t v10 = sub_100025040();

      swift_bridgeObjectRetain();
      char v11 = sub_10000EB5C(v10, v4, v6);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    else
    {
      char v11 = 0;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    char v11 = 0;
  }
  return v11 & 1;
}

uint64_t sub_10000D7EC()
{
  uint64_t result = (uint64_t)[v0 subModels];
  if (!result) {
    return result;
  }
  id v2 = (void *)result;
  sub_10000F258(0, &qword_100030ED8);
  unint64_t v3 = sub_100025040();

  if (v3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v39 = sub_100025150();
    swift_bridgeObjectRelease();
    if (v39 != 2) {
      goto LABEL_7;
    }
  }
  else if (*(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10) != 2)
  {
    goto LABEL_7;
  }
  id v4 = [v0 modelDescription];
  id v5 = [v4 outputDescriptions];

  sub_10000F258(0, &qword_100030EB8);
  unint64_t v6 = sub_100025040();

  if (v6 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_100025150();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v7 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (v7 >= 3) {
    goto LABEL_7;
  }
  unint64_t v8 = v3 & 0xC000000000000001;
  if ((v3 & 0xC000000000000001) != 0)
  {
    id v9 = (id)sub_100025100();
  }
  else
  {
    if (!*(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
LABEL_61:
      __break(1u);
LABEL_62:
      __break(1u);
      goto LABEL_63;
    }
    id v9 = *(id *)(v3 + 32);
  }
  unint64_t v10 = v9;
  id v11 = [v9 modelTypeName];

  uint64_t v12 = sub_100024FC0();
  uint64_t v14 = v13;

  if (v12 == 0xD000000000000012 && v14 == 0x80000001000276B0) {
    goto LABEL_25;
  }
  char v15 = sub_1000251E0();
  swift_bridgeObjectRelease();
  if (v15) {
    goto LABEL_26;
  }
  id v16 = v8 ? (id)sub_100025100() : *(id *)(v3 + 32);
  id v17 = v16;
  id v18 = [v16 modelTypeName];

  uint64_t v19 = sub_100024FC0();
  uint64_t v21 = v20;

  if (v19 == 0x654E6C617275656ELL && v21 == 0xED00006B726F7774) {
    goto LABEL_25;
  }
  char v22 = sub_1000251E0();
  swift_bridgeObjectRelease();
  if (v22) {
    goto LABEL_26;
  }
  id v23 = v8 ? (id)sub_100025100() : *(id *)(v3 + 32);
  id v24 = v23;
  id v25 = [v23 modelTypeName];

  uint64_t v26 = sub_100024FC0();
  uint64_t v28 = v27;

  if (v26 == 0x6F4D6D6F74737563 && v28 == 0xEB000000006C6564)
  {
LABEL_25:
    swift_bridgeObjectRelease();
    goto LABEL_26;
  }
  char v37 = sub_1000251E0();
  swift_bridgeObjectRelease();
  if ((v37 & 1) == 0)
  {
LABEL_7:
    swift_bridgeObjectRelease();
    return 0;
  }
LABEL_26:
  if (v3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v29 = sub_100025150();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v29 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (!v29) {
    goto LABEL_64;
  }
  unint64_t v30 = v29 - 1;
  if (__OFSUB__(v29, 1)) {
    goto LABEL_61;
  }
  if (v8)
  {
    id v31 = (id)sub_100025100();
    goto LABEL_36;
  }
  if ((v30 & 0x8000000000000000) != 0) {
    goto LABEL_62;
  }
  if (v30 >= *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_63:
    __break(1u);
LABEL_64:
    uint64_t result = swift_bridgeObjectRelease();
    __break(1u);
    return result;
  }
  id v31 = *(id *)(v3 + 8 * v30 + 32);
LABEL_36:
  unint64_t v32 = v31;
  swift_bridgeObjectRelease();
  id v33 = [v32 modelTypeName];

  uint64_t v34 = sub_100024FC0();
  uint64_t v36 = v35;

  if (v34 == 0x7373616C436D6C67 && v36 == 0xED00007265696669
    || (sub_1000251E0() & 1) != 0
    || v34 == 0xD000000000000017 && v36 == 0x8000000100027650
    || (sub_1000251E0() & 1) != 0
    || v34 == 0xD000000000000016 && v36 == 0x8000000100027670
    || (sub_1000251E0() & 1) != 0
    || v34 == 0xD000000000000017 && v36 == 0x80000001000275F0
    || (sub_1000251E0() & 1) != 0
    || v34 == 0xD00000000000001BLL && v36 == 0x8000000100027690)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v38 = sub_1000251E0();
    swift_bridgeObjectRelease();
    return v38 & 1;
  }
}

uint64_t sub_10000DE14(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SectionMetadata(0);
  uint64_t v5 = __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  unint64_t v10 = (char *)&v28 - v9;
  uint64_t v11 = *(void *)(a1 + 16);
  if (v11 != *(void *)(a2 + 16)) {
    return 0;
  }
  if (v11 && a1 != a2)
  {
    unint64_t v12 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
    uint64_t v30 = *(void *)(v8 + 72);
    unint64_t v31 = (unint64_t)"lassifier";
    unint64_t v29 = (unint64_t)"ta";
    while (1)
    {
      uint64_t v13 = a1;
      sub_10000F29C(a1 + v12, (uint64_t)v10);
      uint64_t v14 = a2;
      sub_10000F29C(a2 + v12, (uint64_t)v7);
      if ((sub_100024C00() & 1) == 0) {
        break;
      }
      uint64_t v15 = *(int *)(v4 + 20);
      uint64_t v16 = v10[v15];
      uint64_t v17 = v7[v15];
      unint64_t v18 = 0xD000000000000012;
      unint64_t v19 = v31 | 0x8000000000000000;
      switch(v16)
      {
        case 1:
          unint64_t v19 = 0xE500000000000000;
          unint64_t v18 = 0x7475706E69;
          break;
        case 2:
          unint64_t v19 = 0xE600000000000000;
          unint64_t v18 = 0x74757074756FLL;
          break;
        case 3:
          unint64_t v18 = 0x62614C7373616C63;
          unint64_t v19 = 0xEB00000000736C65;
          break;
        case 4:
          unint64_t v19 = v29 | 0x8000000000000000;
          unint64_t v18 = 0xD000000000000011;
          break;
        default:
          break;
      }
      unint64_t v20 = 0xD000000000000012;
      unint64_t v21 = v31 | 0x8000000000000000;
      switch(v17)
      {
        case 1:
          unint64_t v21 = 0xE500000000000000;
          if (v18 == 0x7475706E69) {
            goto LABEL_20;
          }
          goto LABEL_23;
        case 2:
          unint64_t v21 = 0xE600000000000000;
          if (v18 != 0x74757074756FLL) {
            goto LABEL_23;
          }
          goto LABEL_20;
        case 3:
          unint64_t v20 = 0x62614C7373616C63;
          unint64_t v21 = 0xEB00000000736C65;
          goto LABEL_19;
        case 4:
          unint64_t v21 = v29 | 0x8000000000000000;
          if (v18 != 0xD000000000000011) {
            goto LABEL_23;
          }
          goto LABEL_20;
        default:
LABEL_19:
          if (v18 != v20) {
            goto LABEL_23;
          }
LABEL_20:
          if (v19 == v21)
          {
            swift_bridgeObjectRelease_n();
          }
          else
          {
LABEL_23:
            char v22 = sub_1000251E0();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            if ((v22 & 1) == 0) {
              goto LABEL_27;
            }
          }
          uint64_t v23 = *(int *)(v4 + 24);
          uint64_t v24 = *(void *)&v7[v23];
          if (*(void *)&v10[v23])
          {
            if (!v24) {
              goto LABEL_27;
            }
            swift_bridgeObjectRetain();
            uint64_t v25 = swift_bridgeObjectRetain();
            char v26 = sub_10000DE14(v25, v24);
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            if ((v26 & 1) == 0) {
              goto LABEL_27;
            }
          }
          else if (v24)
          {
            goto LABEL_27;
          }
          sub_10000F300((uint64_t)v7);
          sub_10000F300((uint64_t)v10);
          v12 += v30;
          --v11;
          a2 = v14;
          a1 = v13;
          if (!v11) {
            return 1;
          }
          break;
      }
    }
LABEL_27:
    sub_10000F300((uint64_t)v7);
    sub_10000F300((uint64_t)v10);
    return 0;
  }
  return 1;
}

id sub_10000E1A4(unint64_t a1, uint64_t a2)
{
  uint64_t v3 = a1;
  unint64_t v4 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    unint64_t v5 = sub_100025150();
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v5 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if ((unint64_t)a2 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v29 = sub_100025150();
    swift_bridgeObjectRelease();
    if (v5 == v29) {
      goto LABEL_5;
    }
LABEL_49:
    LOBYTE(v5) = 0;
    return (id)(v5 & 1);
  }
  if (v5 != *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
    goto LABEL_49;
  }
LABEL_5:
  if (!v5) {
    goto LABEL_38;
  }
  uint64_t v6 = v3 & 0xFFFFFFFFFFFFFF8;
  if (v3 < 0) {
    uint64_t v6 = v3;
  }
  if (!v4) {
    uint64_t v6 = (v3 & 0xFFFFFFFFFFFFFF8) + 32;
  }
  uint64_t v7 = a2 & 0xFFFFFFFFFFFFFF8;
  uint64_t v8 = (a2 & 0xFFFFFFFFFFFFFF8) + 32;
  if (a2 < 0) {
    uint64_t v9 = a2;
  }
  else {
    uint64_t v9 = a2 & 0xFFFFFFFFFFFFFF8;
  }
  if ((unint64_t)a2 >> 62) {
    uint64_t v8 = v9;
  }
  if (v6 == v8)
  {
LABEL_38:
    LOBYTE(v5) = 1;
    return (id)(v5 & 1);
  }
  if ((v5 & 0x8000000000000000) != 0) {
    goto LABEL_55;
  }
  unint64_t v30 = v3 & 0xC000000000000001;
  if ((v3 & 0xC000000000000001) != 0) {
    goto LABEL_56;
  }
  for (id result = *(id *)(v3 + 32); ; id result = (id)sub_100025100())
  {
    uint64_t v11 = result;
    if ((a2 & 0xC000000000000001) == 0) {
      break;
    }
    id v12 = (id)sub_100025100();
LABEL_22:
    uint64_t v13 = v12;
    sub_10000F258(0, (unint64_t *)&qword_100030DF0);
    char v14 = sub_1000250B0();

    if ((v14 & 1) == 0) {
      goto LABEL_49;
    }
    unint64_t v15 = v5 - 1;
    if (v5 == 1) {
      return (id)(v5 & 1);
    }
    if (((a2 | v3) & 0xC000000000000001) != 0)
    {
      uint64_t v16 = 0;
      unint64_t v17 = v5 - 2;
      while (v15 != v16)
      {
        unint64_t v5 = v16 + 1;
        if (v30) {
          id v18 = (id)sub_100025100();
        }
        else {
          id v18 = *(id *)(v3 + 40 + 8 * v16);
        }
        unint64_t v19 = v18;
        if ((a2 & 0xC000000000000001) != 0)
        {
          id v20 = (id)sub_100025100();
        }
        else
        {
          if (v5 >= *(void *)(v7 + 16)) {
            goto LABEL_54;
          }
          id v20 = *(id *)(a2 + 40 + 8 * v16);
        }
        unint64_t v21 = v20;
        unint64_t v5 = sub_1000250B0();

        if ((v5 & 1) != 0 && v17 != v16++) {
          continue;
        }
        return (id)(v5 & 1);
      }
      __break(1u);
    }
    else
    {
      unint64_t v23 = *(void *)(v7 + 16);
      if (v23 <= 1) {
        unint64_t v23 = 1;
      }
      unint64_t v24 = v23 - 1;
      uint64_t v25 = (void **)(v3 + 40);
      uint64_t v7 = a2 + 40;
      while (v15)
      {
        if (!v24) {
          goto LABEL_53;
        }
        uint64_t v27 = *v25++;
        char v26 = v27;
        uint64_t v28 = *(void **)v7;
        v7 += 8;
        a2 = v26;
        uint64_t v3 = v28;
        unint64_t v5 = sub_1000250B0();

        if (v5)
        {
          --v24;
          if (--v15) {
            continue;
          }
        }
        return (id)(v5 & 1);
      }
    }
    __break(1u);
LABEL_53:
    __break(1u);
LABEL_54:
    __break(1u);
LABEL_55:
    __break(1u);
LABEL_56:
    ;
  }
  if (*(void *)(v7 + 16))
  {
    id v12 = *(id *)(a2 + 32);
    goto LABEL_22;
  }
  __break(1u);
  return result;
}

void *sub_10000E490(unint64_t a1)
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
      uint64_t v3 = _swiftEmptyArrayStorage;
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_100030EC0);
      uint64_t v3 = (void *)swift_allocObject();
      int64_t v4 = _swift_stdlib_malloc_size(v3);
      uint64_t v5 = v4 - 32;
      if (v4 < 32) {
        uint64_t v5 = v4 - 25;
      }
      v3[2] = v2;
      v3[3] = (2 * (v5 >> 3)) | 1;
    }
    swift_bridgeObjectRetain();
    sub_10000E670((uint64_t)(v3 + 4), v2, v1);
    unint64_t v1 = v6;
    swift_bridgeObjectRelease();
    if (v1 == v2) {
      break;
    }
    __break(1u);
LABEL_10:
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_100025150();
    swift_bridgeObjectRelease();
    if (!v2) {
      return _swiftEmptyArrayStorage;
    }
  }
  return v3;
}

void *sub_10000E588(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return _swiftEmptyArrayStorage;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_100030EE0);
  uint64_t v3 = (void *)swift_allocObject();
  int64_t v4 = _swift_stdlib_malloc_size(v3);
  uint64_t v5 = v4 - 32;
  if (v4 < 32) {
    uint64_t v5 = v4 - 17;
  }
  v3[2] = v1;
  v3[3] = 2 * (v5 >> 4);
  unint64_t v6 = sub_10000E958(&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_10000F294();
  if (v6 != (void *)v1)
  {
    __break(1u);
    return _swiftEmptyArrayStorage;
  }
  return v3;
}

uint64_t sub_10000E670(uint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v5 = result;
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_100025150();
    id result = swift_bridgeObjectRelease();
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
  if (v5)
  {
    if (v6)
    {
      swift_bridgeObjectRetain();
      uint64_t v8 = sub_100025150();
      id result = swift_bridgeObjectRelease();
      if (v8 <= a2)
      {
        if (v7 >= 1)
        {
          sub_10000F1FC();
          swift_bridgeObjectRetain();
          for (unint64_t i = 0; i != v7; ++i)
          {
            __swift_instantiateConcreteTypeFromMangledName(&qword_100030EC8);
            unint64_t v10 = sub_10000E820(v13, i, a3);
            id v12 = *v11;
            ((void (*)(void (**)(id *), void))v10)(v13, 0);
            *(void *)(v5 + 8 * i) = v12;
          }
          swift_bridgeObjectRelease();
          return a3;
        }
        goto LABEL_16;
      }
    }
    else
    {
      if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) <= a2)
      {
        sub_10000F258(0, (unint64_t *)&qword_100030DF0);
        swift_arrayInitWithCopy();
        return a3;
      }
      __break(1u);
    }
    __break(1u);
LABEL_16:
    __break(1u);
  }
  __break(1u);
  return result;
}

void (*sub_10000E820(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(void *a1)
{
  unint64_t v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_10000E8D0(v6, a2, a3);
  return sub_10000E888;
}

void sub_10000E888(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);
  free(v1);
}

void (*sub_10000E8D0(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  uint64_t v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    id v4 = (id)sub_100025100();
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    id v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(void *)uint64_t v3 = v4;
    return destroy for ModelHeuristics;
  }
  __break(1u);
  return result;
}

void destroy for ModelHeuristics(id *a1)
{
}

void *sub_10000E958(void *result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = result;
  uint64_t v6 = a4 + 64;
  uint64_t v7 = -1 << *(unsigned char *)(a4 + 32);
  if (-v7 < 64) {
    uint64_t v8 = ~(-1 << -(char)v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(a4 + 64);
  if (!a2)
  {
    int64_t v12 = 0;
    uint64_t v10 = 0;
LABEL_38:
    *uint64_t v5 = a4;
    v5[1] = v6;
    v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return (void *)v10;
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
  uint64_t v11 = a2;
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
    uint64_t v20 = 8 * v16;
    unint64_t v21 = *(void **)(*(void *)(a4 + 48) + v20);
    ++v13;
    uint64_t v22 = *(void *)(*(void *)(a4 + 56) + v20);
    *uint64_t v11 = v21;
    v11[1] = v22;
    if (v13 == v10)
    {
      id v23 = v21;
      goto LABEL_38;
    }
    v11 += 2;
    id result = v21;
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

uint64_t sub_10000EB5C(unint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  unint64_t v7 = a1;
  if (a1 >> 62)
  {
LABEL_20:
    swift_bridgeObjectRetain();
    uint64_t v8 = sub_100025150();
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v8 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v8)
    {
LABEL_3:
      uint64_t v22 = v4;
      unint64_t v23 = v7;
      unint64_t v24 = v7 & 0xC000000000000001;
      uint64_t v9 = 4;
      while (1)
      {
        uint64_t v10 = v9 - 4;
        if (v24)
        {
          id v11 = (id)sub_100025100();
          uint64_t v4 = v9 - 3;
          if (__OFADD__(v10, 1)) {
            goto LABEL_19;
          }
        }
        else
        {
          id v11 = *(id *)(v7 + 8 * v9);
          uint64_t v4 = v9 - 3;
          if (__OFADD__(v10, 1))
          {
LABEL_19:
            __break(1u);
            goto LABEL_20;
          }
        }
        uint64_t v12 = v8;
        uint64_t v13 = v11;
        uint64_t v14 = a3;
        id v15 = objc_msgSend(v11, "name", v22);
        uint64_t v16 = sub_100024FC0();
        uint64_t v18 = v17;

        a3 = v14;
        BOOL v19 = v16 == a2 && v18 == v14;
        if (v19)
        {
          swift_bridgeObjectRelease();

          char v20 = 1;
          goto LABEL_22;
        }
        char v20 = sub_1000251E0();

        swift_bridgeObjectRelease();
        if ((v20 & 1) == 0)
        {
          ++v9;
          uint64_t v8 = v12;
          BOOL v19 = v4 == v12;
          unint64_t v7 = v23;
          if (!v19) {
            continue;
          }
        }
        goto LABEL_22;
      }
    }
  }
  char v20 = 0;
LABEL_22:
  swift_bridgeObjectRelease();
  return v20 & 1;
}

void sub_10000ECFC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  int64_t v6 = a3 >> 1;
  uint64_t v7 = (a3 >> 1) - a2;
  if (__OFSUB__(a3 >> 1, a2))
  {
    __break(1u);
LABEL_23:
    __break(1u);
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  int64_t v9 = a6 >> 1;
  if (__OFSUB__(a6 >> 1, a5)) {
    goto LABEL_23;
  }
  if (v7 != (a6 >> 1) - a5) {
    return;
  }
  if (!v7) {
    return;
  }
  uint64_t v12 = (id *)(a1 + 8 * a2);
  if (v12 == (id *)(a4 + 8 * a5) || v6 == a2) {
    return;
  }
  if (v6 <= a2)
  {
LABEL_26:
    __break(1u);
    return;
  }
  uint64_t v19 = a2 + 1;
  id v18 = *v12;
  id v20 = *v12;
  if (v18)
  {
    uint64_t v13 = a5;
    while (v9 != v13)
    {
      if (v13 < a5 || v13 >= v9) {
        goto LABEL_24;
      }
      uint64_t v14 = *(void **)(a4 + 8 * v13);
      sub_10000F258(0, (unint64_t *)&qword_100030DF0);
      id v15 = v14;
      id v16 = v18;
      char v17 = sub_1000250B0();

      if ((v17 & 1) != 0 && v6 != v19)
      {
        if (v19 >= v6) {
          goto LABEL_25;
        }
        id v18 = *(id *)(a1 + 8 * v19);
        ++v13;
        ++v19;
        if (v18) {
          continue;
        }
      }
      return;
    }
  }
}

uint64_t sub_10000EE64(void *a1)
{
  if (sub_10000A260())
  {
    uint64_t v2 = 0x436567616D69;
    return v2 & 0xFFFFFFFFFFFFLL | 0x616C000000000000;
  }
  if (sub_10000A758()) {
    return 0xD000000000000012;
  }
  if (sub_10000B388()) {
    return 0x65447463656A626FLL;
  }
  sub_10000BAB4();
  if (v4) {
    return 0x617254656C797473;
  }
  sub_10000BD74();
  if (v5) {
    return 0xD000000000000010;
  }
  if (sub_10000C2E0())
  {
    uint64_t v2 = 0x43646E756F73;
    return v2 & 0xFFFFFFFFFFFFLL | 0x616C000000000000;
  }
  sub_10000C68C();
  if (v7) {
    return 0xD000000000000011;
  }
  sub_10000C9A4();
  if (v8) {
    return 0xD000000000000010;
  }
  uint64_t v3 = 0x6E656D6D6F636572;
  id v9 = [a1 modelTypeName];
  uint64_t v10 = sub_100024FC0();
  uint64_t v12 = v11;

  if (v10 == 0xD000000000000019 && v12 == 0x8000000100027530) {
    goto LABEL_27;
  }
  char v13 = sub_1000251E0();
  swift_bridgeObjectRelease();
  if (v13) {
    return v3;
  }
  uint64_t v3 = 0x73616C4374786574;
  id v14 = [a1 modelTypeName];
  uint64_t v15 = sub_100024FC0();
  uint64_t v17 = v16;

  if (v15 == 0x73616C4374786574 && v17 == 0xEE00726569666973) {
    goto LABEL_27;
  }
  char v18 = sub_1000251E0();
  swift_bridgeObjectRelease();
  if (v18) {
    return v3;
  }
  uint64_t v3 = 0x6767615464726F77;
  id v19 = [a1 modelTypeName];
  uint64_t v20 = sub_100024FC0();
  uint64_t v22 = v21;

  if (v20 == 0x6767615464726F77 && v22 == 0xEA00000000007265)
  {
LABEL_27:
    swift_bridgeObjectRelease();
    return v3;
  }
  char v23 = sub_1000251E0();
  swift_bridgeObjectRelease();
  if ((v23 & 1) == 0)
  {
    if (sub_10000CC8C())
    {
      return 0xD000000000000012;
    }
    else if (sub_10000D0E0())
    {
      return 0xD000000000000014;
    }
    else
    {
      id v24 = [a1 modelTypeName];
      uint64_t v3 = sub_100024FC0();
    }
  }
  return v3;
}

unint64_t sub_10000F1FC()
{
  unint64_t result = qword_100030ED0;
  if (!qword_100030ED0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_100030EC8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100030ED0);
  }
  return result;
}

uint64_t sub_10000F258(uint64_t a1, unint64_t *a2)
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

uint64_t sub_10000F294()
{
  return swift_release();
}

uint64_t sub_10000F29C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SectionMetadata(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000F300(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SectionMetadata(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t getEnumTagSinglePayload for MLFeatureFlags(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for MLFeatureFlags(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x10000F450);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_10000F478()
{
  return 0;
}

ValueMetadata *type metadata accessor for MLFeatureFlags()
{
  return &type metadata for MLFeatureFlags;
}

unint64_t sub_10000F498()
{
  unint64_t result = qword_100030EE8;
  if (!qword_100030EE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100030EE8);
  }
  return result;
}

uint64_t sub_10000F4EC()
{
  return 1;
}

Swift::Int sub_10000F4F4()
{
  return sub_1000252A0();
}

void sub_10000F538()
{
}

Swift::Int sub_10000F560()
{
  return sub_1000252A0();
}

const char *sub_10000F5A0()
{
  return "CoreML";
}

const char *sub_10000F5B4()
{
  return "MLQuickLookShowErrors";
}

uint64_t ModelHeuristics.availabilityOfSpecification.getter@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  sub_100010A40(a1, (uint64_t)v4);
  return sub_100010AD8((uint64_t)v4, a2, &qword_100030EF0);
}

uint64_t ModelHeuristics.OSAvailability.init(macOS:iOS:watchOS:tvOS:visionOS:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, void *a9@<X8>, uint64_t a10, uint64_t a11)
{
  *a9 = result;
  a9[1] = a2;
  a9[2] = a3;
  a9[3] = a4;
  a9[4] = a5;
  a9[5] = a6;
  a9[6] = a7;
  a9[7] = a8;
  a9[8] = a10;
  a9[9] = a11;
  return result;
}

uint64_t ModelHeuristics.OSAvailability.macOS.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ModelHeuristics.OSAvailability.macOS.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *int v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*ModelHeuristics.OSAvailability.macOS.modify())()
{
  return ModelHeuristics.init(model:version:);
}

uint64_t ModelHeuristics.OSAvailability.iOS.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ModelHeuristics.OSAvailability.iOS.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return result;
}

uint64_t (*ModelHeuristics.OSAvailability.iOS.modify())()
{
  return ModelHeuristics.init(model:version:);
}

uint64_t ModelHeuristics.OSAvailability.watchOS.getter()
{
  uint64_t v1 = *(void *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ModelHeuristics.OSAvailability.watchOS.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 32) = a1;
  *(void *)(v2 + 40) = a2;
  return result;
}

uint64_t (*ModelHeuristics.OSAvailability.watchOS.modify())()
{
  return ModelHeuristics.init(model:version:);
}

uint64_t ModelHeuristics.OSAvailability.tvOS.getter()
{
  uint64_t v1 = *(void *)(v0 + 48);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ModelHeuristics.OSAvailability.tvOS.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 48) = a1;
  *(void *)(v2 + 56) = a2;
  return result;
}

uint64_t (*ModelHeuristics.OSAvailability.tvOS.modify())()
{
  return ModelHeuristics.init(model:version:);
}

uint64_t ModelHeuristics.OSAvailability.visionOS.getter()
{
  uint64_t v1 = *(void *)(v0 + 64);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ModelHeuristics.OSAvailability.visionOS.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 64) = a1;
  *(void *)(v2 + 72) = a2;
  return result;
}

uint64_t (*ModelHeuristics.OSAvailability.visionOS.modify())()
{
  return ModelHeuristics.init(model:version:);
}

void *ModelHeuristics.OSAvailability.pairs.getter()
{
  sub_100010AD8(v0, (uint64_t)v58, &qword_100030EF8);
  sub_100010AD8((uint64_t)v58, (uint64_t)&v36, &qword_100030EF8);
  uint64_t v38 = 5459817;
  unint64_t v39 = 0xE300000000000000;
  sub_100010AD8(v0 + 16, (uint64_t)v57, &qword_100030EF8);
  sub_100010AD8((uint64_t)v57, (uint64_t)&v40, &qword_100030EF8);
  uint64_t v42 = 0x534F6863746177;
  unint64_t v43 = 0xE700000000000000;
  sub_100010AD8(v0 + 32, (uint64_t)v56, &qword_100030EF8);
  sub_100010AD8((uint64_t)v56, (uint64_t)&v44, &qword_100030EF8);
  uint64_t v46 = 1397716596;
  unint64_t v47 = 0xE400000000000000;
  sub_100010AD8(v0 + 48, (uint64_t)v55, &qword_100030EF8);
  sub_100010AD8((uint64_t)v55, (uint64_t)&v48, &qword_100030EF8);
  uint64_t v50 = 0x534F6E6F69736976;
  unint64_t v51 = 0xE800000000000000;
  sub_100010AD8(v0 + 64, (uint64_t)v54, &qword_100030EF8);
  sub_100010AD8((uint64_t)v54, (uint64_t)&v52, &qword_100030EF8);
  uint64_t v1 = v37;
  if (!v37)
  {
    sub_100010B3C((uint64_t)v58);
    sub_100010B3C((uint64_t)v57);
    sub_100010B3C((uint64_t)v56);
    sub_100010B3C((uint64_t)v55);
    sub_100010B3C((uint64_t)v54);
    int v3 = &_swiftEmptyArrayStorage;
    uint64_t v7 = v41;
    if (!v41) {
      goto LABEL_12;
    }
    goto LABEL_7;
  }
  uint64_t v2 = v36;
  sub_100010B3C((uint64_t)v58);
  sub_100010B3C((uint64_t)v57);
  sub_100010B3C((uint64_t)v56);
  sub_100010B3C((uint64_t)v55);
  sub_100010B3C((uint64_t)v54);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  int v3 = sub_1000101D4(0, 1, 1, &_swiftEmptyArrayStorage);
  unint64_t v5 = v3[2];
  unint64_t v4 = v3[3];
  if (v5 >= v4 >> 1) {
    int v3 = sub_1000101D4((void *)(v4 > 1), v5 + 1, 1, v3);
  }
  v3[2] = v5 + 1;
  int64_t v6 = &v3[4 * v5];
  v6[4] = 0x534F63616DLL;
  v6[5] = 0xE500000000000000;
  v6[6] = v2;
  v6[7] = v1;
  uint64_t v7 = v41;
  if (v41)
  {
LABEL_7:
    uint64_t v9 = v38;
    unint64_t v8 = v39;
    uint64_t v10 = v40;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      int v3 = sub_1000101D4(0, v3[2] + 1, 1, v3);
    }
    unint64_t v12 = v3[2];
    unint64_t v11 = v3[3];
    if (v12 >= v11 >> 1) {
      int v3 = sub_1000101D4((void *)(v11 > 1), v12 + 1, 1, v3);
    }
    v3[2] = v12 + 1;
    char v13 = &v3[4 * v12];
    v13[4] = v9;
    v13[5] = v8;
    v13[6] = v10;
    v13[7] = v7;
  }
LABEL_12:
  uint64_t v14 = v45;
  if (v45)
  {
    uint64_t v16 = v42;
    unint64_t v15 = v43;
    uint64_t v17 = v44;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      int v3 = sub_1000101D4(0, v3[2] + 1, 1, v3);
    }
    unint64_t v19 = v3[2];
    unint64_t v18 = v3[3];
    if (v19 >= v18 >> 1) {
      int v3 = sub_1000101D4((void *)(v18 > 1), v19 + 1, 1, v3);
    }
    v3[2] = v19 + 1;
    uint64_t v20 = &v3[4 * v19];
    v20[4] = v16;
    v20[5] = v15;
    v20[6] = v17;
    v20[7] = v14;
  }
  uint64_t v21 = v49;
  if (v49)
  {
    uint64_t v23 = v46;
    unint64_t v22 = v47;
    uint64_t v24 = v48;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      int v3 = sub_1000101D4(0, v3[2] + 1, 1, v3);
    }
    unint64_t v26 = v3[2];
    unint64_t v25 = v3[3];
    if (v26 >= v25 >> 1) {
      int v3 = sub_1000101D4((void *)(v25 > 1), v26 + 1, 1, v3);
    }
    v3[2] = v26 + 1;
    uint64_t v27 = &v3[4 * v26];
    v27[4] = v23;
    v27[5] = v22;
    v27[6] = v24;
    v27[7] = v21;
  }
  uint64_t v28 = v53;
  if (v53)
  {
    uint64_t v30 = v50;
    unint64_t v29 = v51;
    uint64_t v31 = v52;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      int v3 = sub_1000101D4(0, v3[2] + 1, 1, v3);
    }
    unint64_t v33 = v3[2];
    unint64_t v32 = v3[3];
    if (v33 >= v32 >> 1) {
      int v3 = sub_1000101D4((void *)(v32 > 1), v33 + 1, 1, v3);
    }
    v3[2] = v33 + 1;
    uint64_t v34 = &v3[4 * v33];
    v34[4] = v30;
    v34[5] = v29;
    v34[6] = v31;
    v34[7] = v28;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_100030F00);
  swift_arrayDestroy();
  return v3;
}

void *ModelHeuristics.OSAvailability.components.getter()
{
  uint64_t v1 = ModelHeuristics.OSAvailability.pairs.getter();
  sub_100010B68(v0);
  uint64_t v2 = sub_100010908((uint64_t)v1);
  swift_bridgeObjectRelease();
  sub_100010BD4(v0);
  return v2;
}

uint64_t ModelHeuristics.OSAvailability.description.getter()
{
  uint64_t v1 = ModelHeuristics.OSAvailability.pairs.getter();
  sub_100010B68(v0);
  sub_100010908((uint64_t)v1);
  swift_bridgeObjectRelease();
  sub_100010BD4(v0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_100030DF8);
  sub_100008B74();
  uint64_t v2 = sub_100024F80();
  swift_bridgeObjectRelease();
  return v2;
}

void ModelHeuristics.OSAvailability.hash(into:)()
{
  if (v0[1])
  {
    sub_100025290(1u);
    swift_bridgeObjectRetain();
    sub_100024FE0();
    swift_bridgeObjectRelease();
    if (v0[3]) {
      goto LABEL_3;
    }
  }
  else
  {
    sub_100025290(0);
    if (v0[3])
    {
LABEL_3:
      sub_100025290(1u);
      swift_bridgeObjectRetain();
      sub_100024FE0();
      swift_bridgeObjectRelease();
      if (v0[5]) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  sub_100025290(0);
  if (v0[5])
  {
LABEL_4:
    sub_100025290(1u);
    swift_bridgeObjectRetain();
    sub_100024FE0();
    swift_bridgeObjectRelease();
    if (v0[7]) {
      goto LABEL_5;
    }
LABEL_12:
    sub_100025290(0);
    if (v0[9]) {
      goto LABEL_6;
    }
LABEL_13:
    sub_100025290(0);
    return;
  }
LABEL_11:
  sub_100025290(0);
  if (!v0[7]) {
    goto LABEL_12;
  }
LABEL_5:
  sub_100025290(1u);
  swift_bridgeObjectRetain();
  sub_100024FE0();
  swift_bridgeObjectRelease();
  if (!v0[9]) {
    goto LABEL_13;
  }
LABEL_6:
  sub_100025290(1u);
  swift_bridgeObjectRetain();
  sub_100024FE0();
  swift_bridgeObjectRelease();
}

Swift::Int ModelHeuristics.OSAvailability.hashValue.getter()
{
  return sub_1000252A0();
}

Swift::Int sub_100010058()
{
  return sub_1000252A0();
}

uint64_t sub_100010094()
{
  long long v1 = v0[3];
  _OWORD v6[2] = v0[2];
  v6[3] = v1;
  v6[4] = v0[4];
  long long v2 = v0[1];
  v6[0] = *v0;
  v6[1] = v2;
  int v3 = ModelHeuristics.OSAvailability.pairs.getter();
  sub_100010B68((uint64_t)v6);
  sub_100010908((uint64_t)v3);
  swift_bridgeObjectRelease();
  sub_100010BD4((uint64_t)v6);
  __swift_instantiateConcreteTypeFromMangledName(&qword_100030DF8);
  sub_100008B74();
  uint64_t v4 = sub_100024F80();
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_100010158(_OWORD *a1, long long *a2)
{
  long long v2 = a1[3];
  v8[2] = a1[2];
  v8[3] = v2;
  long long v3 = a1[4];
  long long v4 = a1[1];
  v8[0] = *a1;
  v8[1] = v4;
  long long v5 = a2[3];
  v9[2] = a2[2];
  v9[3] = v5;
  v9[4] = a2[4];
  long long v6 = *a2;
  v9[1] = a2[1];
  v8[4] = v3;
  v9[0] = v6;
  return _s30com_apple_MLKit_MLModelPreview15ModelHeuristicsV14OSAvailabilityV23__derived_struct_equalsySbAE_AEtFZ_0(v8, v9) & 1;
}

size_t sub_1000101B4(size_t a1, int64_t a2, char a3, void *a4)
{
  return sub_100010358(a1, a2, a3, a4, &qword_100030F28, (uint64_t (*)(void))type metadata accessor for ModelMetadataItem);
}

void *sub_1000101D4(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = a4[3];
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_100030F18);
    uint64_t v10 = (void *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 1;
    }
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 5);
  }
  else
  {
    uint64_t v10 = &_swiftEmptyArrayStorage;
  }
  if (v5)
  {
    if (v10 != a4 || v10 + 4 >= &a4[4 * v8 + 4]) {
      memmove(v10 + 4, a4 + 4, 32 * v8);
    }
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_100030F20);
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

size_t sub_1000102F8(size_t a1, int64_t a2, char a3, void *a4)
{
  return sub_100010358(a1, a2, a3, a4, &qword_100030F48, (uint64_t (*)(void))type metadata accessor for ClassLabel);
}

size_t sub_100010318(size_t a1, int64_t a2, char a3, void *a4)
{
  return sub_100010358(a1, a2, a3, a4, &qword_100030F38, (uint64_t (*)(void))type metadata accessor for Layer);
}

size_t sub_100010338(size_t a1, int64_t a2, char a3, void *a4)
{
  return sub_100010358(a1, a2, a3, a4, &qword_100030F30, (uint64_t (*)(void))type metadata accessor for InputOutput);
}

size_t sub_100010358(size_t result, int64_t a2, char a3, void *a4, uint64_t *a5, uint64_t (*a6)(void))
{
  char v8 = result;
  if (a3)
  {
    unint64_t v9 = a4[3];
    int64_t v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
LABEL_30:
        __break(1u);
        return result;
      }
      int64_t v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v10 = a2;
      }
    }
  }
  else
  {
    int64_t v10 = a2;
  }
  uint64_t v11 = a4[2];
  if (v10 <= v11) {
    uint64_t v12 = a4[2];
  }
  else {
    uint64_t v12 = v10;
  }
  if (!v12)
  {
    uint64_t v16 = _swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(a5);
  uint64_t v13 = *(void *)(a6(0) - 8);
  uint64_t v14 = *(void *)(v13 + 72);
  unint64_t v15 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  uint64_t v16 = (void *)swift_allocObject();
  uint64_t result = _swift_stdlib_malloc_size(v16);
  if (!v14)
  {
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (result - v15 == 0x8000000000000000 && v14 == -1) {
    goto LABEL_29;
  }
  v16[2] = v11;
  v16[3] = 2 * ((uint64_t)(result - v15) / v14);
LABEL_19:
  uint64_t v18 = *(void *)(a6(0) - 8);
  if (v8)
  {
    if (v16 < a4
      || (unint64_t v19 = (*(unsigned __int8 *)(v18 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80),
          (char *)v16 + v19 >= (char *)a4 + v19 + *(void *)(v18 + 72) * v11))
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v16 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return (size_t)v16;
}

char *sub_100010534(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_100010554(a1, a2, a3, *v3);
  *long long v3 = result;
  return result;
}

char *sub_100010554(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_100030F10);
    int64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    int64_t v10 = (char *)&_swiftEmptyArrayStorage;
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
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

void *sub_100010658(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = a4[3];
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_100030EE0);
    int64_t v10 = (void *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 4);
  }
  else
  {
    int64_t v10 = _swiftEmptyArrayStorage;
  }
  if (v5)
  {
    if (v10 != a4 || v10 + 4 >= &a4[2 * v8 + 4]) {
      memmove(v10 + 4, a4 + 4, 16 * v8);
    }
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_100030F40);
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

uint64_t _s30com_apple_MLKit_MLModelPreview15ModelHeuristicsV14OSAvailabilityV23__derived_struct_equalsySbAE_AEtFZ_0(void *a1, void *a2)
{
  uint64_t v4 = a1[1];
  uint64_t v5 = a2[1];
  if (!v4)
  {
    if (v5) {
      return 0;
    }
    goto LABEL_10;
  }
  if (!v5) {
    return 0;
  }
  BOOL v6 = *a1 == *a2 && v4 == v5;
  if (v6 || (v7 = sub_1000251E0(), uint64_t result = 0, (v7 & 1) != 0))
  {
LABEL_10:
    uint64_t v9 = a1[3];
    uint64_t v10 = a2[3];
    if (v9)
    {
      if (!v10) {
        return 0;
      }
      if (a1[2] != a2[2] || v9 != v10)
      {
        char v11 = sub_1000251E0();
        uint64_t result = 0;
        if ((v11 & 1) == 0) {
          return result;
        }
      }
    }
    else if (v10)
    {
      return 0;
    }
    uint64_t v12 = a1[5];
    uint64_t v13 = a2[5];
    if (v12)
    {
      if (!v13) {
        return 0;
      }
      if (a1[4] != a2[4] || v12 != v13)
      {
        char v14 = sub_1000251E0();
        uint64_t result = 0;
        if ((v14 & 1) == 0) {
          return result;
        }
      }
    }
    else if (v13)
    {
      return 0;
    }
    uint64_t v15 = a1[7];
    uint64_t v16 = a2[7];
    if (v15)
    {
      if (!v16) {
        return 0;
      }
      if (a1[6] != a2[6] || v15 != v16)
      {
        char v17 = sub_1000251E0();
        uint64_t result = 0;
        if ((v17 & 1) == 0) {
          return result;
        }
      }
    }
    else if (v16)
    {
      return 0;
    }
    uint64_t v18 = a1[9];
    uint64_t v19 = a2[9];
    if (v18)
    {
      if (v19 && (a1[8] == a2[8] && v18 == v19 || (sub_1000251E0() & 1) != 0)) {
        return 1;
      }
    }
    else if (!v19)
    {
      return 1;
    }
    return 0;
  }
  return result;
}

void *sub_1000108F0(uint64_t a1)
{
  return sub_100010908(a1);
}

void *sub_100010908(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    sub_100010534(0, v1, 0);
    long long v3 = (void **)(a1 + 56);
    do
    {
      uint64_t v4 = (uint64_t)*(v3 - 1);
      uint64_t v5 = *v3;
      uint64_t v10 = (uint64_t)*(v3 - 3);
      uint64_t v11 = (uint64_t)*(v3 - 2);
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      v12._countAndFlagsBits = 32;
      v12._object = (void *)0xE100000000000000;
      sub_100024FF0(v12);
      v13._countAndFlagsBits = v4;
      v13._object = v5;
      sub_100024FF0(v13);
      v14._countAndFlagsBits = 43;
      v14._object = (void *)0xE100000000000000;
      sub_100024FF0(v14);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      unint64_t v7 = _swiftEmptyArrayStorage[2];
      unint64_t v6 = _swiftEmptyArrayStorage[3];
      if (v7 >= v6 >> 1) {
        sub_100010534((char *)(v6 > 1), v7 + 1, 1);
      }
      v3 += 4;
      _swiftEmptyArrayStorage[2] = v7 + 1;
      uint64_t v8 = &_swiftEmptyArrayStorage[2 * v7];
      v8[4] = v10;
      _OWORD v8[5] = v11;
      --v1;
    }
    while (v1);
  }
  return _swiftEmptyArrayStorage;
}

uint64_t sub_100010A40@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = result - 1;
  if ((unint64_t)(result - 1) > 7)
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    unint64_t v10 = 0;
    long long v9 = 0uLL;
    uint64_t v5 = 1;
  }
  else
  {
    uint64_t v3 = 8 * v2;
    uint64_t v4 = *(void *)&a1013[8 * v2];
    uint64_t v5 = qword_1000265B8[v2];
    uint64_t v6 = *(void *)&a110[8 * v2];
    uint64_t v7 = *(void *)&a40[v3];
    uint64_t v8 = *(void *)((char *)&unk_100026678 + v3);
    long long v9 = xmmword_1000264C0;
    unint64_t v10 = 0xE300000000000000;
  }
  *(void *)a2 = v4;
  *(void *)(a2 + 8) = v5;
  *(void *)(a2 + 16) = v6;
  *(void *)(a2 + 24) = v9;
  *(void *)(a2 + 32) = v7;
  *(void *)(a2 + 40) = v8;
  *(void *)(a2 + 48) = v6;
  *(_OWORD *)(a2 + 56) = v9;
  *(void *)(a2 + 72) = v10;
  return result;
}

uint64_t sub_100010AD8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_100010B3C(uint64_t a1)
{
  return a1;
}

uint64_t sub_100010B68(uint64_t a1)
{
  return a1;
}

uint64_t sub_100010BD4(uint64_t a1)
{
  return a1;
}

unint64_t sub_100010C44()
{
  unint64_t result = qword_100030F08;
  if (!qword_100030F08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100030F08);
  }
  return result;
}

uint64_t _s14OSAvailabilityVwxx()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *_s14OSAvailabilityVwcp(void *a1, void *a2)
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
  uint64_t v6 = a2[7];
  a1[6] = a2[6];
  a1[7] = v6;
  uint64_t v7 = a2[9];
  a1[8] = a2[8];
  a1[9] = v7;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *_s14OSAvailabilityVwca(void *a1, void *a2)
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
  a1[6] = a2[6];
  a1[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[8] = a2[8];
  a1[9] = a2[9];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy80_8(uint64_t a1, uint64_t a2)
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

void *_s14OSAvailabilityVwta(void *a1, void *a2)
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
  uint64_t v7 = a2[7];
  a1[6] = a2[6];
  a1[7] = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = a2[9];
  a1[8] = a2[8];
  a1[9] = v8;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s14OSAvailabilityVwet(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 80)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t _s14OSAvailabilityVwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 80) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 80) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ModelHeuristics.OSAvailability()
{
  return &type metadata for ModelHeuristics.OSAvailability;
}

void sub_100010FA4(void *a1)
{
  [v1 addSubview:a1];
  [a1 setTranslatesAutoresizingMaskIntoConstraints:0];
  unint64_t v3 = self;
  __swift_instantiateConcreteTypeFromMangledName(&qword_100030EC0);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_1000266C0;
  id v5 = [a1 leftAnchor];
  id v6 = [v1 leftAnchor];
  id v7 = [v5 constraintEqualToAnchor:v6];

  *(void *)(v4 + 32) = v7;
  id v8 = [a1 rightAnchor];
  id v9 = [v1 rightAnchor];
  id v10 = [v8 constraintEqualToAnchor:v9];

  *(void *)(v4 + 40) = v10;
  id v11 = [a1 topAnchor];
  id v12 = [v1 topAnchor];
  id v13 = [v11 constraintEqualToAnchor:v12];

  *(void *)(v4 + 48) = v13;
  id v14 = [a1 bottomAnchor];
  id v15 = [v1 bottomAnchor];
  id v16 = [v14 constraintEqualToAnchor:v15];

  *(void *)(v4 + 56) = v16;
  sub_100025050();
  sub_100011210();
  Class isa = sub_100025030().super.isa;
  swift_bridgeObjectRelease();
  [v3 activateConstraints:isa];
}

unint64_t sub_100011210()
{
  unint64_t result = qword_100030F50;
  if (!qword_100030F50)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100030F50);
  }
  return result;
}

uint64_t *sub_100011250(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v13 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v13 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_100024C20();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = *(int *)(a3 + 24);
    id v10 = (uint64_t *)((char *)a1 + v8);
    id v11 = (uint64_t *)((char *)a2 + v8);
    uint64_t v12 = v11[1];
    *id v10 = *v11;
    v10[1] = v12;
    *(uint64_t *)((char *)a1 + v9) = *(uint64_t *)((char *)a2 + v9);
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_100011330(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100024C20();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = (void *)(a1 + v7);
  id v10 = (void *)(a2 + v7);
  uint64_t v11 = v10[1];
  *uint64_t v9 = *v10;
  v9[1] = v11;
  *(void *)(a1 + v8) = *(void *)(a2 + v8);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_1000113C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100024C20();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  *uint64_t v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + *(int *)(a3 + 24)) = *(void *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t sub_100011468(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100024C20();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 24);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  return a1;
}

uint64_t sub_1000114EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100024C20();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (uint64_t *)(a2 + v7);
  uint64_t v11 = *v9;
  uint64_t v10 = v9[1];
  *uint64_t v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  *(void *)(a1 + *(int *)(a3 + 24)) = *(void *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t sub_100011584(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100011598);
}

uint64_t sub_100011598(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100024C20();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20) + 8);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t sub_10001165C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100011670);
}

uint64_t sub_100011670(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_100024C20();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20) + 8) = (a2 - 1);
  }
  return result;
}

uint64_t type metadata accessor for Layer()
{
  uint64_t result = qword_100030FB0;
  if (!qword_100030FB0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10001177C()
{
  uint64_t result = sub_100024C20();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

Swift::Int sub_100011820(uint64_t a1)
{
  sub_100025270();
  sub_100024C20();
  sub_100011B10((unint64_t *)&qword_100030D18, (void (*)(uint64_t))&type metadata accessor for UUID);
  sub_100024F70();
  swift_bridgeObjectRetain();
  sub_100024FE0();
  swift_bridgeObjectRelease();
  sub_100025280(*(void *)(v1 + *(int *)(a1 + 24)));
  return sub_1000252A0();
}

void sub_1000118F0(uint64_t a1, uint64_t a2)
{
  sub_100024C20();
  sub_100011B10((unint64_t *)&qword_100030D18, (void (*)(uint64_t))&type metadata accessor for UUID);
  sub_100024F70();
  swift_bridgeObjectRetain();
  sub_100024FE0();
  swift_bridgeObjectRelease();
  sub_100025280(*(void *)(v2 + *(int *)(a2 + 24)));
}

Swift::Int sub_1000119B0(uint64_t a1, uint64_t a2)
{
  sub_100025270();
  sub_100024C20();
  sub_100011B10((unint64_t *)&qword_100030D18, (void (*)(uint64_t))&type metadata accessor for UUID);
  sub_100024F70();
  swift_bridgeObjectRetain();
  sub_100024FE0();
  swift_bridgeObjectRelease();
  sub_100025280(*(void *)(v2 + *(int *)(a2 + 24)));
  return sub_1000252A0();
}

uint64_t sub_100011A80()
{
  return sub_100011B10((unint64_t *)&qword_100030D18, (void (*)(uint64_t))&type metadata accessor for UUID);
}

uint64_t sub_100011AC8()
{
  return sub_100011B10(&qword_100030FF0, (void (*)(uint64_t))type metadata accessor for Layer);
}

uint64_t sub_100011B10(unint64_t *a1, void (*a2)(uint64_t))
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

BOOL sub_100011B58(uint64_t a1, uint64_t a2)
{
  if ((sub_100024C00() & 1) == 0) {
    return 0;
  }
  uint64_t v4 = type metadata accessor for Layer();
  uint64_t v5 = *(int *)(v4 + 20);
  uint64_t v6 = *(void *)(a1 + v5);
  uint64_t v7 = *(void *)(a1 + v5 + 8);
  uint64_t v8 = (void *)(a2 + v5);
  if (v6 == *v8 && v7 == v8[1]) {
    return *(void *)(a1 + *(int *)(v4 + 24)) == *(void *)(a2 + *(int *)(v4 + 24));
  }
  char v10 = sub_1000251E0();
  BOOL result = 0;
  if (v10) {
    return *(void *)(a1 + *(int *)(v4 + 24)) == *(void *)(a2 + *(int *)(v4 + 24));
  }
  return result;
}

ValueMetadata *type metadata accessor for LayerDistributionDataViewModel()
{
  return &type metadata for LayerDistributionDataViewModel;
}

uint64_t ModelHeuristics.previewType.getter(void *a1)
{
  sub_10000EE64(a1);
  LODWORD(result) = _s30com_apple_MLKit_MLModelPreview13MLPreviewTypeO8rawValueACSgSS_tcfC_0();
  if (result == 19) {
    return 18;
  }
  else {
    return result;
  }
}

uint64_t sub_100011C24()
{
  uint64_t v1 = *v0;
  uint64_t v2 = (void *)v0[1];
  unint64_t v3 = (objc_class *)[self mainBundle];
  v7._countAndFlagsBits = 0xE000000000000000;
  v8._countAndFlagsBits = v1;
  v8._object = v2;
  v9.value._countAndFlagsBits = 0;
  v9.value._object = 0;
  v4.super.Class isa = v3;
  v10._countAndFlagsBits = 0;
  v10._object = (void *)0xE000000000000000;
  uint64_t v5 = sub_100024B20(v8, v9, v4, v10, v7);

  return v5;
}

uint64_t sub_100011CD4@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, BOOL *a4@<X8>)
{
  Swift::String v8 = (int *)type metadata accessor for ModelDataViewModel();
  uint64_t v9 = v8[21];
  Swift::String v10 = &a4[v8[5]];
  uint64_t v11 = sub_100024BF0();
  uint64_t v103 = *(void *)(v11 - 8);
  uint64_t v104 = v11;
  (*(void (**)(BOOL *, uint64_t))(v103 + 16))(v10, a1);
  *(void *)&a4[v9] = a3;
  *a4 = a3 == 0;
  swift_errorRetain();
  uint64_t v12 = sub_100024BB0();
  uint64_t v13 = (uint64_t *)&a4[v8[6]];
  *uint64_t v13 = v12;
  v13[1] = v14;
  uint64_t v105 = a1;
  uint64_t v15 = _s30com_apple_MLKit_MLModelPreview8DiskSizeO09formattedG02ofSS10Foundation3URLV_tFZ_0(a1);
  id v16 = (uint64_t *)&a4[v8[7]];
  *id v16 = v15;
  v16[1] = v17;
  id v18 = [a2 modelDescription];
  id v19 = [v18 metadata];

  type metadata accessor for MIOModelMetadataKey(0);
  sub_100014FA8(&qword_100030C00, type metadata accessor for MIOModelMetadataKey);
  uint64_t v20 = sub_100024F50();

  if (!*(void *)(v20 + 16))
  {
    long long v108 = 0u;
    long long v109 = 0u;
LABEL_8:
    swift_bridgeObjectRelease();
    goto LABEL_9;
  }
  id v21 = MIOModelAuthorKey;
  unint64_t v22 = sub_100013D4C((uint64_t)v21);
  if ((v23 & 1) == 0)
  {
    long long v108 = 0u;
    long long v109 = 0u;

    goto LABEL_8;
  }
  sub_100005950(*(void *)(v20 + 56) + 32 * v22, (uint64_t)&v108);

  swift_bridgeObjectRelease();
  if (!*((void *)&v109 + 1))
  {
LABEL_9:
    sub_100014F48((uint64_t)&v108);
    uint64_t v25 = 0;
    uint64_t v26 = 0;
    goto LABEL_10;
  }
  int v24 = swift_dynamicCast();
  uint64_t v26 = *((void *)&v107[0] + 1);
  uint64_t v25 = *(void *)&v107[0];
  if (!v24)
  {
    uint64_t v25 = 0;
    uint64_t v26 = 0;
  }
LABEL_10:
  uint64_t v27 = &a4[v8[8]];
  *(void *)uint64_t v27 = v25;
  *((void *)v27 + 1) = v26;
  id v28 = [a2 modelDescription];
  id v29 = [v28 metadata];

  uint64_t v30 = sub_100024F50();
  if (*(void *)(v30 + 16))
  {
    id v31 = MIOModelLicenseKey;
    unint64_t v32 = sub_100013D4C((uint64_t)v31);
    if (v33)
    {
      sub_100005950(*(void *)(v30 + 56) + 32 * v32, (uint64_t)&v108);
    }
    else
    {
      long long v108 = 0u;
      long long v109 = 0u;
    }
  }
  else
  {
    long long v108 = 0u;
    long long v109 = 0u;
  }
  swift_bridgeObjectRelease();
  if (*((void *)&v109 + 1))
  {
    int v34 = swift_dynamicCast();
    uint64_t v36 = *((void *)&v107[0] + 1);
    uint64_t v35 = *(void *)&v107[0];
    if (!v34)
    {
      uint64_t v35 = 0;
      uint64_t v36 = 0;
    }
  }
  else
  {
    sub_100014F48((uint64_t)&v108);
    uint64_t v35 = 0;
    uint64_t v36 = 0;
  }
  uint64_t v37 = &a4[v8[9]];
  *(void *)uint64_t v37 = v35;
  *((void *)v37 + 1) = v36;
  id v38 = [a2 modelDescription];
  id v39 = [v38 metadata];

  uint64_t v40 = sub_100024F50();
  if (*(void *)(v40 + 16))
  {
    id v41 = MIOModelDescriptionKey;
    unint64_t v42 = sub_100013D4C((uint64_t)v41);
    if (v43)
    {
      sub_100005950(*(void *)(v40 + 56) + 32 * v42, (uint64_t)&v108);
    }
    else
    {
      long long v108 = 0u;
      long long v109 = 0u;
    }
  }
  else
  {
    long long v108 = 0u;
    long long v109 = 0u;
  }
  swift_bridgeObjectRelease();
  if (*((void *)&v109 + 1))
  {
    int v44 = swift_dynamicCast();
    uint64_t v46 = *((void *)&v107[0] + 1);
    uint64_t v45 = *(void *)&v107[0];
    if (!v44)
    {
      uint64_t v45 = 0;
      uint64_t v46 = 0;
    }
  }
  else
  {
    sub_100014F48((uint64_t)&v108);
    uint64_t v45 = 0;
    uint64_t v46 = 0;
  }
  unint64_t v47 = &a4[v8[10]];
  *(void *)unint64_t v47 = v45;
  *((void *)v47 + 1) = v46;
  id v48 = [a2 modelDescription];
  id v49 = [v48 metadata];

  uint64_t v50 = sub_100024F50();
  if (*(void *)(v50 + 16))
  {
    id v51 = MIOModelVersionStringKey;
    unint64_t v52 = sub_100013D4C((uint64_t)v51);
    if (v53)
    {
      sub_100005950(*(void *)(v50 + 56) + 32 * v52, (uint64_t)&v108);
    }
    else
    {
      long long v108 = 0u;
      long long v109 = 0u;
    }
  }
  else
  {
    long long v108 = 0u;
    long long v109 = 0u;
  }
  swift_bridgeObjectRelease();
  if (*((void *)&v109 + 1))
  {
    int v54 = swift_dynamicCast();
    uint64_t v56 = *((void *)&v107[0] + 1);
    uint64_t v55 = *(void *)&v107[0];
    if (!v54)
    {
      uint64_t v55 = 0;
      uint64_t v56 = 0;
    }
  }
  else
  {
    sub_100014F48((uint64_t)&v108);
    uint64_t v55 = 0;
    uint64_t v56 = 0;
  }
  uint64_t v57 = &a4[v8[11]];
  *(void *)uint64_t v57 = v55;
  *((void *)v57 + 1) = v56;
  id v58 = [a2 specificationVersion];
  id v59 = [v58 majorVersion];

  *(void *)&a4[v8[15]] = v59;
  id v60 = [a2 modelDescription];
  id v61 = [v60 metadata];

  uint64_t v62 = sub_100024F50();
  if (*(void *)(v62 + 16))
  {
    id v63 = MIOModelCreatorDefinedKey;
    unint64_t v64 = sub_100013D4C((uint64_t)v63);
    if (v65)
    {
      sub_100005950(*(void *)(v62 + 56) + 32 * v64, (uint64_t)&v108);
    }
    else
    {
      long long v108 = 0u;
      long long v109 = 0u;
    }
  }
  else
  {
    long long v108 = 0u;
    long long v109 = 0u;
  }
  swift_bridgeObjectRelease();
  if (*((void *)&v109 + 1))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_100031008);
    if (swift_dynamicCast())
    {
      unint64_t v66 = *(void *)&v107[0];
      goto LABEL_51;
    }
  }
  else
  {
    sub_100014F48((uint64_t)&v108);
  }
  unint64_t v66 = sub_1000127A8((uint64_t)_swiftEmptyArrayStorage);
LABEL_51:
  *(void *)&a4[v8[19]] = v66;
  swift_bridgeObjectRetain();
  id v67 = [a2 modelTypeName];
  uint64_t v68 = sub_100024FC0();
  uint64_t v70 = v69;

  id v71 = (uint64_t *)&a4[v8[12]];
  *id v71 = v68;
  v71[1] = v70;
  if (*(void *)(v66 + 16))
  {
    unint64_t v72 = sub_100013CD4(0xD000000000000023, 0x80000001000276F0);
    uint64_t v73 = &ModelViewController;
    if (v74)
    {
      char v75 = (uint64_t *)(*(void *)(v66 + 56) + 16 * v72);
      uint64_t v77 = *v75;
      uint64_t v76 = v75[1];
      swift_bridgeObjectRetain();
    }
    else
    {
      uint64_t v77 = 0;
      uint64_t v76 = 0;
    }
  }
  else
  {
    uint64_t v77 = 0;
    uint64_t v76 = 0;
    uint64_t v73 = &ModelViewController;
  }
  swift_bridgeObjectRelease();
  unint64_t v78 = &a4[v8[13]];
  *(void *)unint64_t v78 = v77;
  *((void *)v78 + 1) = v76;
  id v79 = [a2 (SEL)v73[219].count];
  id v80 = [v79 parameterDescriptionsByKey];

  type metadata accessor for MIOParameterKey(0);
  sub_10000F258(0, &qword_100030FF8);
  sub_100014FA8(&qword_100030BF0, type metadata accessor for MIOParameterKey);
  sub_100024F50();

  uint64_t v81 = sub_100024F60();
  uint64_t v83 = v82;
  swift_bridgeObjectRelease();
  v84 = (uint64_t *)&a4[v8[14]];
  uint64_t *v84 = v81;
  v84[1] = v83;
  v85 = &a4[v8[20]];
  *(void *)v85 = a2;
  *((void *)v85 + 1) = v59;
  sub_100010A40((uint64_t)v59, (uint64_t)v106);
  sub_100014FF0((uint64_t)v106, (uint64_t)v107);
  if (*((void *)&v107[0] + 1) == 1)
  {
    id v86 = a2;
    v87 = _swiftEmptyArrayStorage;
  }
  else
  {
    long long v110 = v107[2];
    long long v111 = v107[3];
    long long v112 = v107[4];
    long long v108 = v107[0];
    long long v109 = v107[1];
    id v88 = a2;
    v89 = ModelHeuristics.OSAvailability.pairs.getter();
    sub_1000150CC(v106, (void (*)(void, void, void, void, void, void, void, void, void, void))sub_100015058);
    v87 = sub_1000108F0((uint64_t)v89);
    swift_bridgeObjectRelease();
    sub_1000150CC(v106, (void (*)(void, void, void, void, void, void, void, void, void, void))sub_100015120);
    sub_1000150CC(v106, (void (*)(void, void, void, void, void, void, void, void, void, void))sub_100015120);
  }
  *(void *)&a4[v8[16]] = v87;
  v90 = _swiftEmptyArrayStorage;
  *(void *)&a4[v8[17]] = _swiftEmptyArrayStorage;
  id v91 = [a2 modelDescription];
  id v92 = [v91 classLabels];

  if (v92)
  {
    v90 = (void *)sub_100025040();
  }
  *(void *)&a4[v8[18]] = v90;
  id v93 = [a2 layers];
  if (v93)
  {
    v94 = v93;
    sub_10000F258(0, &qword_100031000);
    v95 = (void *)sub_100025040();
  }
  else
  {
    v95 = _swiftEmptyArrayStorage;
  }
  *(void *)&a4[v8[22]] = v95;
  id v96 = [a2 modelDescription];
  id v97 = [v96 inputDescriptions];

  sub_10000F258(0, &qword_100030EB8);
  uint64_t v98 = sub_100025040();

  *(void *)&a4[v8[23]] = v98;
  id v99 = [a2 modelDescription];
  id v100 = [v99 outputDescriptions];

  uint64_t v101 = sub_100025040();
  swift_errorRelease();

  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v103 + 8))(v105, v104);
  *(void *)&a4[v8[24]] = v101;
  return result;
}

uint64_t type metadata accessor for ModelDataViewModel()
{
  uint64_t result = qword_100031070;
  if (!qword_100031070) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unint64_t sub_1000127A8(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_100031010);
  uint64_t v2 = (void *)sub_100025190();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  NSBundle v4 = (uint64_t *)(a1 + 56);
  while (1)
  {
    uint64_t v5 = *(v4 - 3);
    uint64_t v6 = *(v4 - 2);
    uint64_t v8 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t result = sub_100013CD4(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v11 = v5;
    v11[1] = v6;
    uint64_t v12 = (void *)(v2[7] + 16 * result);
    *uint64_t v12 = v8;
    v12[1] = v7;
    uint64_t v13 = v2[2];
    BOOL v14 = __OFADD__(v13, 1);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_11;
    }
    v4 += 4;
    v2[2] = v15;
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

uint64_t sub_1000128CC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = (int *)type metadata accessor for ModelDataViewModel();
  if (!*(void *)(v1 + v3[13] + 8)
    || (swift_bridgeObjectRetain(),
        char v4 = _s30com_apple_MLKit_MLModelPreview13MLPreviewTypeO8rawValueACSgSS_tcfC_0(),
        v4 == 19))
  {
    sub_10000EE64(*(void **)(v1 + v3[20]));
    char v4 = _s30com_apple_MLKit_MLModelPreview13MLPreviewTypeO8rawValueACSgSS_tcfC_0();
    if (v4 == 19) {
      char v4 = 18;
    }
  }
  char v33 = v4;
  uint64_t v5 = (uint64_t *)(v1 + v3[6]);
  uint64_t v6 = *v5;
  uint64_t v7 = v5[1];
  uint64_t v8 = (uint64_t *)(v1 + v3[7]);
  uint64_t v9 = v8[1];
  uint64_t v31 = v6;
  uint64_t v32 = *v8;
  char v10 = (uint64_t *)(v1 + v3[8]);
  unint64_t v11 = v10[1];
  if (!v11) {
    goto LABEL_10;
  }
  uint64_t v12 = *v10;
  uint64_t v13 = HIBYTE(v11) & 0xF;
  if ((v11 & 0x2000000000000000) == 0) {
    uint64_t v13 = v12 & 0xFFFFFFFFFFFFLL;
  }
  if (v13)
  {
    swift_bridgeObjectRetain();
  }
  else
  {
LABEL_10:
    unint64_t v11 = 0xE200000000000000;
    uint64_t v12 = 11565;
  }
  BOOL v14 = (uint64_t *)(v1 + v3[9]);
  unint64_t v15 = v14[1];
  if (!v15) {
    goto LABEL_16;
  }
  uint64_t v16 = *v14;
  uint64_t v17 = HIBYTE(v15) & 0xF;
  if ((v15 & 0x2000000000000000) == 0) {
    uint64_t v17 = v16 & 0xFFFFFFFFFFFFLL;
  }
  if (v17)
  {
    uint64_t v30 = v16;
    swift_bridgeObjectRetain();
  }
  else
  {
LABEL_16:
    unint64_t v15 = 0xE200000000000000;
    uint64_t v30 = 11565;
  }
  id v18 = (uint64_t *)(v1 + v3[10]);
  unint64_t v19 = v18[1];
  if (!v19) {
    goto LABEL_22;
  }
  uint64_t v20 = *v18;
  uint64_t v21 = HIBYTE(v19) & 0xF;
  if ((v19 & 0x2000000000000000) == 0) {
    uint64_t v21 = v20 & 0xFFFFFFFFFFFFLL;
  }
  if (v21)
  {
    uint64_t v29 = v20;
    swift_bridgeObjectRetain();
  }
  else
  {
LABEL_22:
    unint64_t v19 = 0xE200000000000000;
    uint64_t v29 = 11565;
  }
  unint64_t v22 = (uint64_t *)(v1 + v3[11]);
  unint64_t v23 = v22[1];
  uint64_t v34 = v12;
  if (!v23) {
    goto LABEL_28;
  }
  uint64_t v24 = *v22;
  uint64_t v25 = HIBYTE(v23) & 0xF;
  if ((v23 & 0x2000000000000000) == 0) {
    uint64_t v25 = v24 & 0xFFFFFFFFFFFFLL;
  }
  if (v25)
  {
    swift_bridgeObjectRetain();
  }
  else
  {
LABEL_28:
    unint64_t v23 = 0xE200000000000000;
    uint64_t v24 = 11565;
  }
  if (*(void *)(*(void *)(v1 + v3[16]) + 16))
  {
    uint64_t v26 = v7;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_100030DF8);
    sub_100008B74();
    uint64_t result = sub_100024F80();
  }
  else
  {
    uint64_t v26 = v7;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v28 = 0xE200000000000000;
    uint64_t result = 11565;
  }
  *(unsigned char *)a1 = v33;
  *(void *)(a1 + 8) = v31;
  *(void *)(a1 + 16) = v26;
  *(void *)(a1 + 24) = v32;
  *(void *)(a1 + 32) = v9;
  *(void *)(a1 + 40) = v34;
  *(void *)(a1 + 48) = v11;
  *(void *)(a1 + 56) = v30;
  *(void *)(a1 + 64) = v15;
  *(void *)(a1 + 72) = v29;
  *(void *)(a1 + 80) = v19;
  *(void *)(a1 + 88) = v24;
  *(void *)(a1 + 96) = v23;
  *(void *)(a1 + 104) = result;
  *(void *)(a1 + 112) = v28;
  return result;
}

uint64_t sub_100012B40()
{
  uint64_t v1 = type metadata accessor for ModelMetadataItem();
  uint64_t v31 = *(void *)(v1 - 8);
  uint64_t v32 = v1;
  __chkstk_darwin(v1);
  char v33 = (char *)&v31 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = *(void *)(v0 + *(int *)(type metadata accessor for ModelDataViewModel() + 76));
  uint64_t v4 = v3 + 64;
  uint64_t v5 = 1 << *(unsigned char *)(v3 + 32);
  uint64_t v6 = -1;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  unint64_t v7 = v6 & *(void *)(v3 + 64);
  int64_t v8 = (unint64_t)(v5 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v10 = 0;
  uint64_t v34 = _swiftEmptyArrayStorage;
  while (v7)
  {
    unint64_t v11 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    unint64_t v12 = v11 | (v10 << 6);
LABEL_20:
    uint64_t v16 = (uint64_t *)(*(void *)(v3 + 48) + 16 * v12);
    uint64_t v17 = *v16;
    uint64_t v18 = v16[1];
    if (*v16 != 0x73657373616C63 || v18 != 0xE700000000000000)
    {
      uint64_t v20 = (uint64_t *)(*(void *)(v3 + 56) + 16 * v12);
      uint64_t v22 = *v20;
      uint64_t v21 = v20[1];
      uint64_t result = sub_1000251E0();
      if ((result & 1) == 0)
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        sub_100024C10();
        uint64_t v23 = v32;
        uint64_t v24 = v33;
        uint64_t v25 = &v33[*(int *)(v32 + 20)];
        *(void *)uint64_t v25 = v17;
        *((void *)v25 + 1) = v18;
        uint64_t v26 = &v24[*(int *)(v23 + 24)];
        *(void *)uint64_t v26 = v22;
        *((void *)v26 + 1) = v21;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v34 = (void *)sub_1000101B4(0, v34[2] + 1, 1, v34);
        }
        unint64_t v28 = v34[2];
        unint64_t v27 = v34[3];
        if (v28 >= v27 >> 1) {
          uint64_t v34 = (void *)sub_1000101B4(v27 > 1, v28 + 1, 1, v34);
        }
        uint64_t v29 = (uint64_t)v33;
        uint64_t v30 = v34;
        v34[2] = v28 + 1;
        uint64_t result = sub_100016378(v29, (uint64_t)v30+ ((*(unsigned __int8 *)(v31 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v31 + 80))+ *(void *)(v31 + 72) * v28, (uint64_t (*)(void))type metadata accessor for ModelMetadataItem);
      }
    }
  }
  int64_t v13 = v10 + 1;
  if (__OFADD__(v10, 1))
  {
    __break(1u);
    goto LABEL_32;
  }
  if (v13 >= v8) {
    goto LABEL_30;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v13);
  ++v10;
  if (v14) {
    goto LABEL_19;
  }
  int64_t v10 = v13 + 1;
  if (v13 + 1 >= v8) {
    goto LABEL_30;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v10);
  if (v14) {
    goto LABEL_19;
  }
  int64_t v10 = v13 + 2;
  if (v13 + 2 >= v8) {
    goto LABEL_30;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v10);
  if (v14)
  {
LABEL_19:
    unint64_t v7 = (v14 - 1) & v14;
    unint64_t v12 = __clz(__rbit64(v14)) + (v10 << 6);
    goto LABEL_20;
  }
  int64_t v15 = v13 + 3;
  if (v15 >= v8)
  {
LABEL_30:
    swift_release();
    return (uint64_t)v34;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v15);
  if (v14)
  {
    int64_t v10 = v15;
    goto LABEL_19;
  }
  while (1)
  {
    int64_t v10 = v15 + 1;
    if (__OFADD__(v15, 1)) {
      break;
    }
    if (v10 >= v8) {
      goto LABEL_30;
    }
    unint64_t v14 = *(void *)(v4 + 8 * v10);
    ++v15;
    if (v14) {
      goto LABEL_19;
    }
  }
LABEL_32:
  __break(1u);
  return result;
}

void *sub_100012E48()
{
  uint64_t v27 = type metadata accessor for ClassLabel();
  uint64_t v1 = *(void *)(v27 - 8);
  uint64_t v2 = __chkstk_darwin(v27);
  uint64_t v4 = (char *)&v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v26 - v5;
  uint64_t v7 = *(void *)(v0 + *(int *)(type metadata accessor for ModelDataViewModel() + 72));
  uint64_t v8 = *(void *)(v7 + 16);
  if (!v8) {
    return _swiftEmptyArrayStorage;
  }
  uint64_t v9 = v7 + 32;
  uint64_t v26 = v7;
  swift_bridgeObjectRetain();
  int64_t v10 = _swiftEmptyArrayStorage;
  do
  {
    sub_100005950(v9, (uint64_t)v31);
    sub_100005950((uint64_t)v31, (uint64_t)v30);
    if (swift_dynamicCast())
    {
      v30[0] = v28;
      v30[1] = v29;
      uint64_t v13 = sub_100025000();
      uint64_t v15 = v14;
      sub_100024C10();
      uint64_t v16 = (uint64_t *)&v6[*(int *)(v27 + 20)];
      *uint64_t v16 = v13;
      v16[1] = v15;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        int64_t v10 = (void *)sub_1000102F8(0, v10[2] + 1, 1, v10);
      }
      unint64_t v18 = v10[2];
      unint64_t v17 = v10[3];
      if (v18 >= v17 >> 1) {
        int64_t v10 = (void *)sub_1000102F8(v17 > 1, v18 + 1, 1, v10);
      }
      v10[2] = v18 + 1;
      uint64_t v11 = (uint64_t)v10
          + ((*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80))
          + *(void *)(v1 + 72) * v18;
      uint64_t v12 = (uint64_t)v6;
LABEL_4:
      sub_100016378(v12, v11, (uint64_t (*)(void))type metadata accessor for ClassLabel);
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v31);
      goto LABEL_5;
    }
    sub_100005950((uint64_t)v31, (uint64_t)v30);
    if (swift_dynamicCast())
    {
      v30[0] = v28;
      uint64_t v19 = sub_1000251D0();
      uint64_t v21 = v20;
      sub_100024C10();
      uint64_t v22 = (uint64_t *)&v4[*(int *)(v27 + 20)];
      *uint64_t v22 = v19;
      v22[1] = v21;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        int64_t v10 = (void *)sub_1000102F8(0, v10[2] + 1, 1, v10);
      }
      unint64_t v24 = v10[2];
      unint64_t v23 = v10[3];
      if (v24 >= v23 >> 1) {
        int64_t v10 = (void *)sub_1000102F8(v23 > 1, v24 + 1, 1, v10);
      }
      v10[2] = v24 + 1;
      uint64_t v11 = (uint64_t)v10
          + ((*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80))
          + *(void *)(v1 + 72) * v24;
      uint64_t v12 = (uint64_t)v4;
      goto LABEL_4;
    }
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v31);
LABEL_5:
    v9 += 32;
    --v8;
  }
  while (v8);
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_1000131BC()
{
  uint64_t v1 = type metadata accessor for Layer();
  uint64_t v66 = *(void *)(v1 - 8);
  uint64_t v67 = v1;
  __chkstk_darwin(v1);
  uint64_t v3 = (char *)&v62 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v4 = *(void *)(v0 + *(int *)(type metadata accessor for ModelDataViewModel() + 88));
  if (v4 >> 62)
  {
LABEL_43:
    swift_bridgeObjectRetain_n();
    uint64_t v5 = sub_100025150();
    swift_bridgeObjectRelease();
    if (v5) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v5)
    {
LABEL_3:
      unint64_t v65 = v4 & 0xC000000000000001;
      uint64_t v6 = &_swiftEmptyDictionarySingleton;
      uint64_t v7 = 4;
      uint64_t v8 = &ModelViewController;
      id v63 = v3;
      uint64_t v64 = v5;
      while (1)
      {
        if (v65) {
          id v9 = (id)sub_100025100();
        }
        else {
          id v9 = *(id *)(v4 + 8 * v7);
        }
        int64_t v10 = v9;
        uint64_t v11 = v7 - 3;
        if (__OFADD__(v7 - 4, 1))
        {
          __break(1u);
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          goto LABEL_43;
        }
        id v12 = [v9 (SEL)v8[208].count];
        uint64_t v13 = v12;
        if (v6[2])
        {
          unint64_t v14 = sub_100013D4C((uint64_t)v12);
          if (v15)
          {
            uint64_t v3 = (char *)v4;
            uint64_t v16 = *(void *)(v6[7] + 8 * v14);

            id v17 = [v10 (SEL)v8[208].count];
            BOOL v18 = __OFADD__(v16, 1);
            unint64_t v4 = v16 + 1;
            if (v18) {
              goto LABEL_40;
            }
            uint64_t v19 = v17;
            char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
            uint64_t v68 = v6;
            unint64_t v22 = sub_100013D4C((uint64_t)v19);
            uint64_t v23 = v6[2];
            BOOL v24 = (v21 & 1) == 0;
            uint64_t v25 = v23 + v24;
            if (__OFADD__(v23, v24)) {
              goto LABEL_41;
            }
            char v26 = v21;
            if (v6[3] >= v25)
            {
              if (isUniquelyReferenced_nonNull_native)
              {
                uint64_t v6 = v68;
                if ((v21 & 1) == 0) {
                  goto LABEL_34;
                }
              }
              else
              {
                sub_100014D90();
                uint64_t v6 = v68;
                if ((v26 & 1) == 0) {
                  goto LABEL_34;
                }
              }
            }
            else
            {
              sub_100014A64(v25, isUniquelyReferenced_nonNull_native);
              unint64_t v27 = sub_100013D4C((uint64_t)v19);
              if ((v26 & 1) != (v28 & 1)) {
                goto LABEL_55;
              }
              unint64_t v22 = v27;
              uint64_t v6 = v68;
              if ((v26 & 1) == 0)
              {
LABEL_34:
                v6[(v22 >> 6) + 8] |= 1 << v22;
                uint64_t v43 = 8 * v22;
                *(void *)(v6[6] + v43) = v19;
                *(void *)(v6[7] + v43) = v4;
                uint64_t v44 = v6[2];
                BOOL v18 = __OFADD__(v44, 1);
                uint64_t v45 = v44 + 1;
                if (v18) {
                  goto LABEL_42;
                }
                _OWORD v6[2] = v45;
                id v46 = v19;
                goto LABEL_36;
              }
            }
            *(void *)(v6[7] + 8 * v22) = v4;
LABEL_36:

            swift_bridgeObjectRelease();
            unint64_t v4 = (unint64_t)v3;
            uint64_t v3 = v63;
            goto LABEL_6;
          }
        }

        id v29 = [v10 (SEL)v8[208].count];
        char v30 = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v68 = v6;
        unint64_t v32 = sub_100013D4C((uint64_t)v29);
        uint64_t v33 = v6[2];
        BOOL v34 = (v31 & 1) == 0;
        uint64_t v35 = v33 + v34;
        if (__OFADD__(v33, v34)) {
          goto LABEL_38;
        }
        char v36 = v31;
        if (v6[3] >= v35)
        {
          if (v30)
          {
            uint64_t v6 = v68;
            if ((v31 & 1) == 0) {
              goto LABEL_26;
            }
          }
          else
          {
            sub_100014D90();
            uint64_t v6 = v68;
            if ((v36 & 1) == 0) {
              goto LABEL_26;
            }
          }
        }
        else
        {
          sub_100014A64(v35, v30);
          unint64_t v37 = sub_100013D4C((uint64_t)v29);
          if ((v36 & 1) != (v38 & 1))
          {
LABEL_55:
            type metadata accessor for MIOModelLayerType(0);
            sub_100025210();
            __break(1u);
            uint64_t result = swift_release();
            __break(1u);
            return result;
          }
          unint64_t v32 = v37;
          uint64_t v6 = v68;
          if ((v36 & 1) == 0)
          {
LABEL_26:
            v6[(v32 >> 6) + 8] |= 1 << v32;
            uint64_t v39 = 8 * v32;
            *(void *)(v6[6] + v39) = v29;
            *(void *)(v6[7] + v39) = 1;
            uint64_t v40 = v6[2];
            BOOL v18 = __OFADD__(v40, 1);
            uint64_t v41 = v40 + 1;
            if (v18) {
              goto LABEL_39;
            }
            _OWORD v6[2] = v41;
            id v42 = v29;
            goto LABEL_5;
          }
        }
        *(void *)(v6[7] + 8 * v32) = 1;
LABEL_5:

        swift_bridgeObjectRelease();
LABEL_6:
        uint64_t v8 = &ModelViewController;
        ++v7;
        if (v11 == v64) {
          goto LABEL_45;
        }
      }
    }
  }
  uint64_t v6 = &_swiftEmptyDictionarySingleton;
LABEL_45:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain_n();
  unint64_t v47 = sub_10000E588((uint64_t)v6);
  swift_bridgeObjectRelease();
  uint64_t v68 = v47;
  sub_100014038(&v68);
  swift_bridgeObjectRelease();
  uint64_t v48 = v68[2];
  if (v48)
  {
    id v49 = v68 + 5;
    uint64_t v50 = _swiftEmptyArrayStorage;
    do
    {
      unint64_t v52 = (void *)*(v49 - 1);
      uint64_t v51 = *v49;
      uint64_t v53 = sub_100024FC0();
      uint64_t v55 = v54;
      id v56 = v52;
      sub_100024C10();
      uint64_t v57 = v67;
      id v58 = (uint64_t *)&v3[*(int *)(v67 + 20)];
      *id v58 = v53;
      v58[1] = v55;
      *(void *)&v3[*(int *)(v57 + 24)] = v51;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v50 = (void *)sub_100010318(0, v50[2] + 1, 1, v50);
      }
      unint64_t v60 = v50[2];
      unint64_t v59 = v50[3];
      if (v60 >= v59 >> 1) {
        uint64_t v50 = (void *)sub_100010318(v59 > 1, v60 + 1, 1, v50);
      }
      v49 += 2;
      v50[2] = v60 + 1;
      sub_100016378((uint64_t)v3, (uint64_t)v50+ ((*(unsigned __int8 *)(v66 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v66 + 80))+ *(void *)(v66 + 72) * v60, (uint64_t (*)(void))type metadata accessor for Layer);

      --v48;
    }
    while (v48);
    swift_release();
  }
  else
  {
    swift_release();
    uint64_t v50 = _swiftEmptyArrayStorage;
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v50;
}

void *sub_100013750()
{
  uint64_t v1 = type metadata accessor for InputOutput();
  uint64_t v34 = *(void *)(v1 - 8);
  uint64_t v35 = v1;
  __chkstk_darwin(v1);
  uint64_t v3 = (char *)&v30 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v4 = *(void *)(v0 + *(int *)(type metadata accessor for ModelDataViewModel() + 92));
  if (!(v4 >> 62))
  {
    uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = (void *)swift_bridgeObjectRetain();
    if (v5) {
      goto LABEL_3;
    }
LABEL_15:
    swift_bridgeObjectRelease();
    return _swiftEmptyArrayStorage;
  }
  swift_bridgeObjectRetain();
  uint64_t result = (void *)sub_100025150();
  uint64_t v5 = (uint64_t)result;
  if (!result) {
    goto LABEL_15;
  }
LABEL_3:
  if (v5 >= 1)
  {
    uint64_t v7 = 0;
    unint64_t v31 = v4 & 0xC000000000000001;
    uint64_t v8 = _swiftEmptyArrayStorage;
    unint64_t v32 = v4;
    uint64_t v33 = v3;
    uint64_t v30 = v5;
    do
    {
      if (v31) {
        id v9 = (id)sub_100025100();
      }
      else {
        id v9 = *(id *)(v4 + 8 * v7 + 32);
      }
      int64_t v10 = v9;
      id v11 = objc_msgSend(v9, "name", v30);
      uint64_t v12 = sub_100024FC0();
      uint64_t v14 = v13;

      uint64_t v15 = sub_100008208();
      uint64_t v17 = v16;
      id v18 = [v10 shortDescription];
      uint64_t v19 = sub_100024FC0();
      uint64_t v21 = v20;

      uint64_t v22 = (uint64_t)v33;
      sub_100024C10();
      uint64_t v23 = v35;
      BOOL v24 = (uint64_t *)(v22 + *(int *)(v35 + 20));
      *BOOL v24 = v12;
      v24[1] = v14;
      uint64_t v25 = (uint64_t *)(v22 + *(int *)(v23 + 24));
      *uint64_t v25 = v15;
      v25[1] = v17;
      char v26 = (uint64_t *)(v22 + *(int *)(v23 + 28));
      uint64_t *v26 = v19;
      v26[1] = v21;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v8 = (void *)sub_100010338(0, v8[2] + 1, 1, v8);
      }
      uint64_t v27 = v30;
      unint64_t v29 = v8[2];
      unint64_t v28 = v8[3];
      if (v29 >= v28 >> 1) {
        uint64_t v8 = (void *)sub_100010338(v28 > 1, v29 + 1, 1, v8);
      }
      ++v7;
      v8[2] = v29 + 1;
      sub_100016378(v22, (uint64_t)v8+ ((*(unsigned __int8 *)(v34 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v34 + 80))+ *(void *)(v34 + 72) * v29, (uint64_t (*)(void))type metadata accessor for InputOutput);

      unint64_t v4 = v32;
    }
    while (v27 != v7);
    swift_bridgeObjectRelease();
    return v8;
  }
  __break(1u);
  return result;
}

void *sub_100013A10()
{
  uint64_t v1 = type metadata accessor for InputOutput();
  uint64_t v34 = *(void *)(v1 - 8);
  uint64_t v35 = v1;
  __chkstk_darwin(v1);
  uint64_t v3 = (char *)&v30 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v4 = *(void *)(v0 + *(int *)(type metadata accessor for ModelDataViewModel() + 96));
  if (!(v4 >> 62))
  {
    uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = (void *)swift_bridgeObjectRetain();
    if (v5) {
      goto LABEL_3;
    }
LABEL_15:
    swift_bridgeObjectRelease();
    return _swiftEmptyArrayStorage;
  }
  swift_bridgeObjectRetain();
  uint64_t result = (void *)sub_100025150();
  uint64_t v5 = (uint64_t)result;
  if (!result) {
    goto LABEL_15;
  }
LABEL_3:
  if (v5 >= 1)
  {
    uint64_t v7 = 0;
    unint64_t v31 = v4 & 0xC000000000000001;
    uint64_t v8 = _swiftEmptyArrayStorage;
    unint64_t v32 = v4;
    uint64_t v33 = v3;
    uint64_t v30 = v5;
    do
    {
      if (v31) {
        id v9 = (id)sub_100025100();
      }
      else {
        id v9 = *(id *)(v4 + 8 * v7 + 32);
      }
      int64_t v10 = v9;
      id v11 = objc_msgSend(v9, "name", v30);
      uint64_t v12 = sub_100024FC0();
      uint64_t v14 = v13;

      uint64_t v15 = sub_100008208();
      uint64_t v17 = v16;
      id v18 = [v10 shortDescription];
      uint64_t v19 = sub_100024FC0();
      uint64_t v21 = v20;

      uint64_t v22 = (uint64_t)v33;
      sub_100024C10();
      uint64_t v23 = v35;
      BOOL v24 = (uint64_t *)(v22 + *(int *)(v35 + 20));
      *BOOL v24 = v12;
      v24[1] = v14;
      uint64_t v25 = (uint64_t *)(v22 + *(int *)(v23 + 24));
      *uint64_t v25 = v15;
      v25[1] = v17;
      char v26 = (uint64_t *)(v22 + *(int *)(v23 + 28));
      uint64_t *v26 = v19;
      v26[1] = v21;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v8 = (void *)sub_100010338(0, v8[2] + 1, 1, v8);
      }
      uint64_t v27 = v30;
      unint64_t v29 = v8[2];
      unint64_t v28 = v8[3];
      if (v29 >= v28 >> 1) {
        uint64_t v8 = (void *)sub_100010338(v28 > 1, v29 + 1, 1, v8);
      }
      ++v7;
      v8[2] = v29 + 1;
      sub_100016378(v22, (uint64_t)v8+ ((*(unsigned __int8 *)(v34 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v34 + 80))+ *(void *)(v34 + 72) * v29, (uint64_t (*)(void))type metadata accessor for InputOutput);

      unint64_t v4 = v32;
    }
    while (v27 != v7);
    swift_bridgeObjectRelease();
    return v8;
  }
  __break(1u);
  return result;
}

unint64_t sub_100013CD4(uint64_t a1, uint64_t a2)
{
  sub_100025270();
  sub_100024FE0();
  Swift::Int v4 = sub_1000252A0();
  return sub_100013DDC(a1, a2, v4);
}

unint64_t sub_100013D4C(uint64_t a1)
{
  sub_100024FC0();
  sub_100025270();
  sub_100024FE0();
  Swift::Int v2 = sub_1000252A0();
  swift_bridgeObjectRelease();
  return sub_100013EC0(a1, v2);
}

unint64_t sub_100013DDC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    int64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_1000251E0() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        uint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_1000251E0() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_100013EC0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = sub_100024FC0();
    uint64_t v8 = v7;
    if (v6 == sub_100024FC0() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    char v11 = sub_1000251E0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      uint64_t v12 = ~v4;
      unint64_t v5 = (v5 + 1) & v12;
      if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
      {
        while (1)
        {
          uint64_t v13 = sub_100024FC0();
          uint64_t v15 = v14;
          if (v13 == sub_100024FC0() && v15 == v16) {
            break;
          }
          char v18 = sub_1000251E0();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v18 & 1) == 0)
          {
            unint64_t v5 = (v5 + 1) & v12;
            if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5)) {
              continue;
            }
          }
          return v5;
        }
        goto LABEL_16;
      }
    }
  }
  return v5;
}

uint64_t sub_100014038(void **a1)
{
  uint64_t v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100014F34(v2);
  }
  uint64_t v3 = v2[2];
  v5[0] = (uint64_t)(v2 + 4);
  v5[1] = v3;
  uint64_t result = sub_1000140A4(v5);
  *a1 = v2;
  return result;
}

uint64_t sub_1000140A4(uint64_t *a1)
{
  Swift::Int v3 = a1[1];
  uint64_t result = sub_1000251C0(v3);
  if (result >= v3)
  {
    if (v3 < 0) {
      goto LABEL_137;
    }
    if ((unint64_t)v3 >= 2)
    {
      uint64_t v83 = 0;
      uint64_t v84 = *a1;
      for (uint64_t i = 1; i != v3; ++i)
      {
        uint64_t v86 = *(void *)(v84 + 16 * i + 8);
        uint64_t v87 = v83;
        do
        {
          uint64_t v88 = v84 + v87;
          if (*(void *)(v84 + v87 + 8) >= v86) {
            break;
          }
          if (!v84) {
            goto LABEL_141;
          }
          uint64_t v89 = *(void *)(v88 + 16);
          *(_OWORD *)(v88 + 16) = *(_OWORD *)v88;
          *(void *)uint64_t v88 = v89;
          *(void *)(v88 + 8) = v86;
          v87 -= 16;
        }
        while (v87 != -16);
        v83 += 16;
      }
    }
  }
  else
  {
    if (v3 >= 0) {
      uint64_t v5 = v3;
    }
    else {
      uint64_t v5 = v3 + 1;
    }
    if (v3 < -1) {
      goto LABEL_136;
    }
    uint64_t v6 = result;
    id v97 = a1;
    if (v3 > 1)
    {
      uint64_t v7 = v5 >> 1;
      __swift_instantiateConcreteTypeFromMangledName(&qword_100030F40);
      uint64_t result = sub_100025060();
      *(void *)(result + 16) = v7;
      id v99 = (void *)result;
      uint64_t v103 = (char *)(result + 32);
LABEL_13:
      Swift::Int v9 = 0;
      uint64_t v10 = *a1;
      uint64_t v98 = *a1 + 40;
      char v11 = (char *)_swiftEmptyArrayStorage;
      uint64_t v100 = v6;
      Swift::Int v101 = v3;
      uint64_t v102 = v10;
      while (1)
      {
        Swift::Int v13 = v9++;
        if (v9 < v3)
        {
          uint64_t v14 = *(void *)(v10 + 16 * v9 + 8);
          uint64_t v15 = *(void *)(v10 + 16 * v13 + 8);
          Swift::Int v9 = v13 + 2;
          if (v13 + 2 < v3)
          {
            uint64_t v16 = (uint64_t *)(v98 + 16 * v13);
            uint64_t v17 = v14;
            while (1)
            {
              uint64_t v19 = *v16;
              v16 += 2;
              uint64_t v18 = v19;
              if (v15 < v14 == v17 >= v19) {
                break;
              }
              ++v9;
              uint64_t v17 = v18;
              if (v3 == v9)
              {
                Swift::Int v9 = v3;
                break;
              }
            }
          }
          if (v15 < v14)
          {
            if (v9 < v13) {
              goto LABEL_138;
            }
            if (v13 < v9)
            {
              uint64_t v20 = 16 * v9;
              uint64_t v21 = 16 * v13;
              Swift::Int v22 = v9;
              Swift::Int v23 = v13;
              do
              {
                if (v23 != --v22)
                {
                  if (!v10) {
                    goto LABEL_144;
                  }
                  uint64_t v24 = v10 + v20;
                  uint64_t v25 = *(void *)(v10 + v21);
                  uint64_t v26 = *(void *)(v10 + v21 + 8);
                  *(_OWORD *)(v10 + v21) = *(_OWORD *)(v10 + v20 - 16);
                  *(void *)(v24 - 16) = v25;
                  *(void *)(v24 - 8) = v26;
                }
                ++v23;
                v20 -= 16;
                v21 += 16;
              }
              while (v23 < v22);
            }
          }
        }
        if (v9 < v3)
        {
          if (__OFSUB__(v9, v13)) {
            goto LABEL_135;
          }
          if (v9 - v13 < v6)
          {
            Swift::Int v27 = v13 + v6;
            if (__OFADD__(v13, v6)) {
              goto LABEL_139;
            }
            if (v27 >= v3) {
              Swift::Int v27 = v3;
            }
            if (v27 < v13)
            {
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
              return result;
            }
            if (v9 != v27)
            {
              unint64_t v28 = (void *)(v10 + 16 * v9);
              do
              {
                uint64_t v29 = *(void *)(v10 + 16 * v9 + 8);
                Swift::Int v30 = v13;
                unint64_t v31 = v28;
                do
                {
                  if (*(v31 - 1) >= v29) {
                    break;
                  }
                  if (!v10) {
                    goto LABEL_142;
                  }
                  uint64_t v32 = *v31;
                  *(_OWORD *)unint64_t v31 = *((_OWORD *)v31 - 1);
                  *(v31 - 1) = v29;
                  *(v31 - 2) = v32;
                  v31 -= 2;
                  ++v30;
                }
                while (v9 != v30);
                ++v9;
                v28 += 2;
              }
              while (v9 != v27);
              Swift::Int v9 = v27;
            }
          }
        }
        if (v9 < v13) {
          goto LABEL_130;
        }
        uint64_t result = swift_isUniquelyReferenced_nonNull_native();
        if ((result & 1) == 0)
        {
          uint64_t result = (uint64_t)sub_100014954(0, *((void *)v11 + 2) + 1, 1, v11);
          char v11 = (char *)result;
        }
        unint64_t v34 = *((void *)v11 + 2);
        unint64_t v33 = *((void *)v11 + 3);
        unint64_t v12 = v34 + 1;
        uint64_t v10 = v102;
        if (v34 >= v33 >> 1)
        {
          uint64_t result = (uint64_t)sub_100014954((char *)(v33 > 1), v34 + 1, 1, v11);
          uint64_t v10 = v102;
          char v11 = (char *)result;
        }
        *((void *)v11 + 2) = v12;
        uint64_t v35 = v11 + 32;
        char v36 = &v11[16 * v34 + 32];
        *(void *)char v36 = v13;
        *((void *)v36 + 1) = v9;
        if (v34)
        {
          while (1)
          {
            unint64_t v37 = v12 - 1;
            if (v12 >= 4)
            {
              id v42 = &v35[2 * v12];
              uint64_t v43 = *(v42 - 8);
              uint64_t v44 = *(v42 - 7);
              BOOL v48 = __OFSUB__(v44, v43);
              uint64_t v45 = v44 - v43;
              if (v48) {
                goto LABEL_119;
              }
              uint64_t v47 = *(v42 - 6);
              uint64_t v46 = *(v42 - 5);
              BOOL v48 = __OFSUB__(v46, v47);
              uint64_t v40 = v46 - v47;
              char v41 = v48;
              if (v48) {
                goto LABEL_120;
              }
              unint64_t v49 = v12 - 2;
              uint64_t v50 = &v35[2 * v12 - 4];
              uint64_t v52 = *v50;
              uint64_t v51 = v50[1];
              BOOL v48 = __OFSUB__(v51, v52);
              uint64_t v53 = v51 - v52;
              if (v48) {
                goto LABEL_121;
              }
              BOOL v48 = __OFADD__(v40, v53);
              uint64_t v54 = v40 + v53;
              if (v48) {
                goto LABEL_123;
              }
              if (v54 >= v45)
              {
                unint64_t v72 = &v35[2 * v37];
                uint64_t v74 = *v72;
                uint64_t v73 = v72[1];
                BOOL v48 = __OFSUB__(v73, v74);
                uint64_t v75 = v73 - v74;
                if (v48) {
                  goto LABEL_129;
                }
                BOOL v65 = v40 < v75;
                goto LABEL_83;
              }
            }
            else
            {
              if (v12 != 3)
              {
                uint64_t v66 = *((void *)v11 + 4);
                uint64_t v67 = *((void *)v11 + 5);
                BOOL v48 = __OFSUB__(v67, v66);
                uint64_t v59 = v67 - v66;
                char v60 = v48;
                goto LABEL_77;
              }
              uint64_t v39 = *((void *)v11 + 4);
              uint64_t v38 = *((void *)v11 + 5);
              BOOL v48 = __OFSUB__(v38, v39);
              uint64_t v40 = v38 - v39;
              char v41 = v48;
            }
            if (v41) {
              goto LABEL_122;
            }
            unint64_t v49 = v12 - 2;
            uint64_t v55 = &v35[2 * v12 - 4];
            uint64_t v57 = *v55;
            uint64_t v56 = v55[1];
            BOOL v58 = __OFSUB__(v56, v57);
            uint64_t v59 = v56 - v57;
            char v60 = v58;
            if (v58) {
              goto LABEL_124;
            }
            id v61 = &v35[2 * v37];
            uint64_t v63 = *v61;
            uint64_t v62 = v61[1];
            BOOL v48 = __OFSUB__(v62, v63);
            uint64_t v64 = v62 - v63;
            if (v48) {
              goto LABEL_126;
            }
            if (__OFADD__(v59, v64)) {
              goto LABEL_128;
            }
            if (v59 + v64 >= v40)
            {
              BOOL v65 = v40 < v64;
LABEL_83:
              if (v65) {
                unint64_t v37 = v49;
              }
              goto LABEL_85;
            }
LABEL_77:
            if (v60) {
              goto LABEL_125;
            }
            uint64_t v68 = &v35[2 * v37];
            uint64_t v70 = *v68;
            uint64_t v69 = v68[1];
            BOOL v48 = __OFSUB__(v69, v70);
            uint64_t v71 = v69 - v70;
            if (v48) {
              goto LABEL_127;
            }
            if (v71 < v59) {
              goto LABEL_15;
            }
LABEL_85:
            unint64_t v76 = v37 - 1;
            if (v37 - 1 >= v12)
            {
              __break(1u);
LABEL_116:
              __break(1u);
LABEL_117:
              __break(1u);
LABEL_118:
              __break(1u);
LABEL_119:
              __break(1u);
LABEL_120:
              __break(1u);
LABEL_121:
              __break(1u);
LABEL_122:
              __break(1u);
LABEL_123:
              __break(1u);
LABEL_124:
              __break(1u);
LABEL_125:
              __break(1u);
LABEL_126:
              __break(1u);
LABEL_127:
              __break(1u);
LABEL_128:
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
              goto LABEL_140;
            }
            if (!v10) {
              goto LABEL_143;
            }
            uint64_t v77 = v11;
            unint64_t v78 = &v35[2 * v76];
            uint64_t v79 = *v78;
            id v80 = &v35[2 * v37];
            uint64_t v81 = v80[1];
            uint64_t result = sub_10001472C((char *)(v10 + 16 * *v78), (char *)(v10 + 16 * *v80), v10 + 16 * v81, v103);
            if (v1) {
              goto LABEL_93;
            }
            if (v81 < v79) {
              goto LABEL_116;
            }
            if (v37 > *((void *)v77 + 2)) {
              goto LABEL_117;
            }
            *unint64_t v78 = v79;
            v35[2 * v76 + 1] = v81;
            unint64_t v82 = *((void *)v77 + 2);
            if (v37 >= v82) {
              goto LABEL_118;
            }
            char v11 = v77;
            unint64_t v12 = v82 - 1;
            uint64_t result = (uint64_t)memmove(&v35[2 * v37], v80 + 2, 16 * (v82 - 1 - v37));
            *((void *)v77 + 2) = v82 - 1;
            uint64_t v10 = v102;
            if (v82 <= 2) {
              goto LABEL_15;
            }
          }
        }
        unint64_t v12 = 1;
LABEL_15:
        uint64_t v6 = v100;
        Swift::Int v3 = v101;
        if (v9 >= v101)
        {
          uint64_t v8 = v99;
          goto LABEL_102;
        }
      }
    }
    uint64_t v8 = _swiftEmptyArrayStorage;
    uint64_t v103 = (char *)&_swiftEmptyArrayStorage[4];
    if (v3 == 1)
    {
      id v99 = _swiftEmptyArrayStorage;
      goto LABEL_13;
    }
    unint64_t v12 = _swiftEmptyArrayStorage[2];
    char v11 = (char *)_swiftEmptyArrayStorage;
LABEL_102:
    uint64_t result = (uint64_t)v11;
    id v99 = v8;
    if (v12 >= 2)
    {
      uint64_t v90 = *v97;
      do
      {
        unint64_t v91 = v12 - 2;
        if (v12 < 2) {
          goto LABEL_131;
        }
        if (!v90) {
          goto LABEL_145;
        }
        uint64_t v92 = result;
        uint64_t v93 = *(void *)(result + 32 + 16 * v91);
        uint64_t v94 = *(void *)(result + 32 + 16 * (v12 - 1) + 8);
        uint64_t result = sub_10001472C((char *)(v90 + 16 * v93), (char *)(v90 + 16 * *(void *)(result + 32 + 16 * (v12 - 1))), v90 + 16 * v94, v103);
        if (v1) {
          break;
        }
        if (v94 < v93) {
          goto LABEL_132;
        }
        uint64_t result = swift_isUniquelyReferenced_nonNull_native();
        if ((result & 1) == 0)
        {
          uint64_t result = (uint64_t)sub_100014A50(v92);
          uint64_t v92 = result;
        }
        if (v91 >= *(void *)(v92 + 16)) {
          goto LABEL_133;
        }
        v95 = (void *)(v92 + 32 + 16 * v91);
        void *v95 = v93;
        v95[1] = v94;
        unint64_t v96 = *(void *)(v92 + 16);
        if (v12 > v96) {
          goto LABEL_134;
        }
        memmove((void *)(v92 + 32 + 16 * (v12 - 1)), (const void *)(v92 + 32 + 16 * v12), 16 * (v96 - v12));
        uint64_t result = v92;
        *(void *)(v92 + 16) = v96 - 1;
        unint64_t v12 = v96 - 1;
      }
      while (v96 > 2);
    }
LABEL_93:
    swift_bridgeObjectRelease();
    v99[2] = 0;
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_10001472C(char *__dst, char *__src, unint64_t a3, char *a4)
{
  uint64_t v4 = a4;
  uint64_t v6 = __src;
  uint64_t v7 = __dst;
  int64_t v8 = __src - __dst;
  int64_t v9 = __src - __dst + 15;
  if (__src - __dst >= 0) {
    int64_t v9 = __src - __dst;
  }
  uint64_t v10 = v9 >> 4;
  uint64_t v11 = a3 - (void)__src;
  uint64_t v12 = a3 - (void)__src + 15;
  if ((uint64_t)(a3 - (void)__src) >= 0) {
    uint64_t v12 = a3 - (void)__src;
  }
  uint64_t v13 = v12 >> 4;
  if (v10 >= v12 >> 4)
  {
    if (a4 != __src || &__src[16 * v13] <= a4) {
      memmove(a4, __src, 16 * v13);
    }
    uint64_t v14 = &v4[16 * v13];
    if (v7 >= v6 || v11 < 16) {
      goto LABEL_43;
    }
    uint64_t v18 = (char *)(a3 - 16);
    while (1)
    {
      uint64_t v19 = v18 + 16;
      if (*((void *)v6 - 1) >= *((void *)v14 - 1))
      {
        uint64_t v20 = v14 - 16;
        if (v19 != v14)
        {
          v14 -= 16;
          goto LABEL_40;
        }
        BOOL v21 = v18 >= v14;
        v14 -= 16;
        if (v21) {
          goto LABEL_40;
        }
      }
      else
      {
        uint64_t v20 = v6 - 16;
        if (v19 != v6)
        {
          v6 -= 16;
LABEL_40:
          *(_OWORD *)uint64_t v18 = *(_OWORD *)v20;
          goto LABEL_41;
        }
        BOOL v21 = v18 >= v6;
        v6 -= 16;
        if (v21) {
          goto LABEL_40;
        }
      }
LABEL_41:
      if (v6 > v7)
      {
        v18 -= 16;
        if (v14 > v4) {
          continue;
        }
      }
      goto LABEL_43;
    }
  }
  if (a4 != __dst || &__dst[16 * v10] <= a4) {
    memmove(a4, __dst, 16 * v10);
  }
  uint64_t v14 = &v4[16 * v10];
  if ((unint64_t)v6 < a3 && v8 >= 16)
  {
    while (1)
    {
      if (*((void *)v4 + 1) >= *((void *)v6 + 1))
      {
        uint64_t v17 = v4 + 16;
        uint64_t v16 = v4;
        uint64_t v15 = v6;
        if (v7 == v4)
        {
          v4 += 16;
          if (v7 < v17) {
            goto LABEL_20;
          }
        }
        else
        {
          v4 += 16;
        }
      }
      else
      {
        uint64_t v15 = v6 + 16;
        uint64_t v16 = v6;
        if (v7 == v6 && v7 < v15) {
          goto LABEL_20;
        }
      }
      *(_OWORD *)uint64_t v7 = *(_OWORD *)v16;
LABEL_20:
      v7 += 16;
      if (v4 < v14)
      {
        uint64_t v6 = v15;
        if ((unint64_t)v15 < a3) {
          continue;
        }
      }
      break;
    }
  }
  uint64_t v6 = v7;
LABEL_43:
  int64_t v22 = v14 - v4 + (v14 - v4 < 0 ? 0xFuLL : 0);
  if (v6 != v4 || v6 >= &v4[v22 & 0xFFFFFFFFFFFFFFF0]) {
    memmove(v6, v4, 16 * (v22 >> 4));
  }
  return 1;
}

char *sub_100014954(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_100031108);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
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

char *sub_100014A50(uint64_t a1)
{
  return sub_100014954(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_100014A64(uint64_t a1, char a2)
{
  Swift::Int v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_100031100);
  char v38 = a2;
  uint64_t v6 = sub_100025180();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v37 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  uint64_t v35 = v2;
  int64_t v36 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v20 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v21 = v20 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v22 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v36) {
      break;
    }
    Swift::Int v23 = (void *)(v5 + 64);
    unint64_t v24 = *(void *)(v37 + 8 * v22);
    ++v13;
    if (!v24)
    {
      int64_t v13 = v22 + 1;
      if (v22 + 1 >= v36) {
        goto LABEL_33;
      }
      unint64_t v24 = *(void *)(v37 + 8 * v13);
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v36)
        {
LABEL_33:
          swift_release();
          Swift::Int v3 = v35;
          if ((v38 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v24 = *(void *)(v37 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            int64_t v13 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v36) {
              goto LABEL_33;
            }
            unint64_t v24 = *(void *)(v37 + 8 * v13);
            ++v25;
            if (v24) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v25;
      }
    }
LABEL_30:
    unint64_t v10 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v13 << 6);
LABEL_31:
    uint64_t v30 = 8 * v21;
    unint64_t v31 = *(void **)(*(void *)(v5 + 48) + v30);
    uint64_t v32 = *(void *)(*(void *)(v5 + 56) + v30);
    if ((v38 & 1) == 0) {
      id v33 = v31;
    }
    sub_100024FC0();
    sub_100025270();
    sub_100024FE0();
    Swift::Int v14 = sub_1000252A0();
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v15 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v16 = v14 & ~v15;
    unint64_t v17 = v16 >> 6;
    if (((-1 << v16) & ~*(void *)(v11 + 8 * (v16 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v11 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
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
        uint64_t v29 = *(void *)(v11 + 8 * v17);
      }
      while (v29 == -1);
      unint64_t v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }
    *(void *)(v11 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    uint64_t v19 = 8 * v18;
    *(void *)(*(void *)(v7 + 48) + v19) = v31;
    *(void *)(*(void *)(v7 + 56) + v19) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  Swift::Int v3 = v35;
  Swift::Int v23 = (void *)(v5 + 64);
  if ((v38 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
  if (v34 >= 64) {
    bzero(v23, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *Swift::Int v23 = -1 << v34;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *Swift::Int v3 = v7;
  return result;
}

id sub_100014D90()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_100031100);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_100025170();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    *uint64_t v1 = v4;
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
    int64_t v19 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v19 >= v13) {
      goto LABEL_26;
    }
    unint64_t v20 = *(void *)(v6 + 8 * v19);
    ++v9;
    if (!v20)
    {
      int64_t v9 = v19 + 1;
      if (v19 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v20 = *(void *)(v6 + 8 * v9);
      if (!v20) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v20 - 1) & v20;
    unint64_t v15 = __clz(__rbit64(v20)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    unint64_t v17 = *(void **)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = *(void *)(*(void *)(v2 + 56) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    *(void *)(*(void *)(v4 + 56) + v16) = v18;
    id result = v17;
  }
  int64_t v21 = v19 + 2;
  if (v21 >= v13) {
    goto LABEL_26;
  }
  unint64_t v20 = *(void *)(v6 + 8 * v21);
  if (v20)
  {
    int64_t v9 = v21;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v20 = *(void *)(v6 + 8 * v9);
    ++v21;
    if (v20) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_100014F34(void *a1)
{
  return sub_100010658(0, a1[2], 0, a1);
}

uint64_t sub_100014F48(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_100030C78);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100014FA8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100014FF0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_100030EF0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100015058(uint64_t a1, uint64_t a2)
{
  if (a2 != 1)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

void *sub_1000150CC(void *a1, void (*a2)(void, void, void, void, void, void, void, void, void, void))
{
  return a1;
}

uint64_t sub_100015120(uint64_t a1, uint64_t a2)
{
  if (a2 != 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

void *initializeBufferWithCopyOfBuffer for ModelError(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for ModelError()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for ModelError(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void *assignWithTake for ModelError(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ModelError(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ModelError(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for ModelError()
{
  return &type metadata for ModelError;
}

uint64_t *sub_1000152E4(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v52 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v52 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(unsigned char *)a1 = *(unsigned char *)a2;
    uint64_t v7 = a3[5];
    uint64_t v8 = (char *)a1 + v7;
    int64_t v9 = (char *)a2 + v7;
    uint64_t v10 = sub_100024BF0();
    (*(void (**)(unsigned char *, char *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
    uint64_t v11 = a3[6];
    uint64_t v12 = a3[7];
    int64_t v13 = (uint64_t *)((char *)v4 + v11);
    unint64_t v14 = (uint64_t *)((char *)a2 + v11);
    uint64_t v15 = v14[1];
    *int64_t v13 = *v14;
    v13[1] = v15;
    uint64_t v16 = (uint64_t *)((char *)v4 + v12);
    unint64_t v17 = (uint64_t *)((char *)a2 + v12);
    uint64_t v61 = v17[1];
    *uint64_t v16 = *v17;
    v16[1] = v61;
    uint64_t v18 = a3[8];
    uint64_t v19 = a3[9];
    unint64_t v20 = (uint64_t *)((char *)v4 + v18);
    int64_t v21 = (uint64_t *)((char *)a2 + v18);
    uint64_t v59 = v21[1];
    *unint64_t v20 = *v21;
    v20[1] = v59;
    int64_t v22 = (uint64_t *)((char *)v4 + v19);
    Swift::Int v23 = (uint64_t *)((char *)a2 + v19);
    uint64_t v60 = v23[1];
    *int64_t v22 = *v23;
    v22[1] = v60;
    uint64_t v24 = a3[10];
    uint64_t v25 = a3[11];
    char v26 = (uint64_t *)((char *)v4 + v24);
    unint64_t v27 = (uint64_t *)((char *)a2 + v24);
    uint64_t v57 = v27[1];
    void *v26 = *v27;
    v26[1] = v57;
    BOOL v28 = (uint64_t *)((char *)v4 + v25);
    uint64_t v29 = (uint64_t *)((char *)a2 + v25);
    uint64_t v58 = v29[1];
    *BOOL v28 = *v29;
    v28[1] = v58;
    uint64_t v30 = a3[12];
    uint64_t v31 = a3[13];
    uint64_t v32 = (uint64_t *)((char *)v4 + v30);
    id v33 = (uint64_t *)((char *)a2 + v30);
    uint64_t v55 = v33[1];
    *uint64_t v32 = *v33;
    v32[1] = v55;
    uint64_t v34 = (uint64_t *)((char *)v4 + v31);
    uint64_t v35 = (uint64_t *)((char *)a2 + v31);
    uint64_t v56 = v35[1];
    void *v34 = *v35;
    v34[1] = v56;
    uint64_t v36 = a3[14];
    uint64_t v37 = a3[15];
    char v38 = (uint64_t *)((char *)v4 + v36);
    uint64_t v39 = (uint64_t *)((char *)a2 + v36);
    uint64_t v40 = v39[1];
    *char v38 = *v39;
    v38[1] = v40;
    *(uint64_t *)((char *)v4 + v37) = *(uint64_t *)((char *)a2 + v37);
    uint64_t v41 = a3[17];
    *(uint64_t *)((char *)v4 + a3[16]) = *(uint64_t *)((char *)a2 + a3[16]);
    *(uint64_t *)((char *)v4 + v41) = *(uint64_t *)((char *)a2 + v41);
    uint64_t v42 = a3[19];
    *(uint64_t *)((char *)v4 + a3[18]) = *(uint64_t *)((char *)a2 + a3[18]);
    *(uint64_t *)((char *)v4 + v42) = *(uint64_t *)((char *)a2 + v42);
    uint64_t v43 = a3[20];
    uint64_t v44 = a3[21];
    uint64_t v54 = v44;
    uint64_t v45 = (uint64_t *)((char *)v4 + v43);
    uint64_t v46 = (char *)a2 + v43;
    BOOL v48 = *(void **)v46;
    uint64_t v47 = *((void *)v46 + 1);
    *uint64_t v45 = v48;
    v45[1] = v47;
    uint64_t v49 = *(uint64_t *)((char *)a2 + v44);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    id v50 = v48;
    swift_errorRetain();
    *(uint64_t *)((char *)v4 + v54) = v49;
    uint64_t v51 = a3[23];
    *(uint64_t *)((char *)v4 + a3[22]) = *(uint64_t *)((char *)a2 + a3[22]);
    *(uint64_t *)((char *)v4 + v51) = *(uint64_t *)((char *)a2 + v51);
    *(uint64_t *)((char *)v4 + a3[24]) = *(uint64_t *)((char *)a2 + a3[24]);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t sub_100015590(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_100024BF0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_errorRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

unsigned char *sub_100015704(unsigned char *a1, unsigned char *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = sub_100024BF0();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
  uint64_t v10 = a3[6];
  uint64_t v11 = a3[7];
  uint64_t v12 = &a1[v10];
  int64_t v13 = &a2[v10];
  uint64_t v14 = v13[1];
  *uint64_t v12 = *v13;
  v12[1] = v14;
  uint64_t v15 = &a1[v11];
  uint64_t v16 = &a2[v11];
  uint64_t v59 = v16[1];
  *uint64_t v15 = *v16;
  v15[1] = v59;
  uint64_t v17 = a3[8];
  uint64_t v18 = a3[9];
  uint64_t v19 = &a1[v17];
  unint64_t v20 = &a2[v17];
  uint64_t v57 = v20[1];
  void *v19 = *v20;
  v19[1] = v57;
  int64_t v21 = &a1[v18];
  int64_t v22 = &a2[v18];
  uint64_t v58 = v22[1];
  *int64_t v21 = *v22;
  v21[1] = v58;
  uint64_t v23 = a3[10];
  uint64_t v24 = a3[11];
  uint64_t v25 = &a1[v23];
  char v26 = &a2[v23];
  uint64_t v55 = v26[1];
  *uint64_t v25 = *v26;
  v25[1] = v55;
  unint64_t v27 = &a1[v24];
  BOOL v28 = &a2[v24];
  uint64_t v56 = v28[1];
  *unint64_t v27 = *v28;
  v27[1] = v56;
  uint64_t v29 = a3[12];
  uint64_t v30 = a3[13];
  uint64_t v31 = &a1[v29];
  uint64_t v32 = &a2[v29];
  uint64_t v53 = v32[1];
  *uint64_t v31 = *v32;
  v31[1] = v53;
  id v33 = &a1[v30];
  uint64_t v34 = &a2[v30];
  uint64_t v54 = v34[1];
  *id v33 = *v34;
  v33[1] = v54;
  uint64_t v35 = a3[14];
  uint64_t v36 = a3[15];
  uint64_t v37 = &a1[v35];
  char v38 = &a2[v35];
  uint64_t v39 = v38[1];
  *uint64_t v37 = *v38;
  v37[1] = v39;
  *(void *)&a1[v36] = *(void *)&a2[v36];
  uint64_t v40 = a3[17];
  *(void *)&a1[a3[16]] = *(void *)&a2[a3[16]];
  *(void *)&a1[v40] = *(void *)&a2[v40];
  uint64_t v41 = a3[19];
  *(void *)&a1[a3[18]] = *(void *)&a2[a3[18]];
  *(void *)&a1[v41] = *(void *)&a2[v41];
  uint64_t v42 = a3[20];
  uint64_t v43 = a3[21];
  uint64_t v52 = v43;
  uint64_t v44 = &a1[v42];
  uint64_t v45 = &a2[v42];
  uint64_t v47 = *(void **)v45;
  uint64_t v46 = *((void *)v45 + 1);
  void *v44 = v47;
  v44[1] = v46;
  uint64_t v48 = *(void *)&a2[v43];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v49 = v47;
  swift_errorRetain();
  *(void *)&a1[v52] = v48;
  uint64_t v50 = a3[23];
  *(void *)&a1[a3[22]] = *(void *)&a2[a3[22]];
  *(void *)&a1[v50] = *(void *)&a2[v50];
  *(void *)&a1[a3[24]] = *(void *)&a2[a3[24]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

unsigned char *sub_100015960(unsigned char *a1, unsigned char *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = sub_100024BF0();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  uint64_t v10 = a3[6];
  uint64_t v11 = &a1[v10];
  uint64_t v12 = &a2[v10];
  *uint64_t v11 = *v12;
  v11[1] = v12[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v13 = a3[7];
  uint64_t v14 = &a1[v13];
  uint64_t v15 = &a2[v13];
  *uint64_t v14 = *v15;
  v14[1] = v15[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v16 = a3[8];
  uint64_t v17 = &a1[v16];
  uint64_t v18 = &a2[v16];
  *uint64_t v17 = *v18;
  v17[1] = v18[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v19 = a3[9];
  unint64_t v20 = &a1[v19];
  int64_t v21 = &a2[v19];
  *unint64_t v20 = *v21;
  v20[1] = v21[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v22 = a3[10];
  uint64_t v23 = &a1[v22];
  uint64_t v24 = &a2[v22];
  *uint64_t v23 = *v24;
  v23[1] = v24[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v25 = a3[11];
  char v26 = &a1[v25];
  unint64_t v27 = &a2[v25];
  void *v26 = *v27;
  v26[1] = v27[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v28 = a3[12];
  uint64_t v29 = &a1[v28];
  uint64_t v30 = &a2[v28];
  *uint64_t v29 = *v30;
  v29[1] = v30[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v31 = a3[13];
  uint64_t v32 = &a1[v31];
  id v33 = &a2[v31];
  *uint64_t v32 = *v33;
  v32[1] = v33[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v34 = a3[14];
  uint64_t v35 = &a1[v34];
  uint64_t v36 = &a2[v34];
  *uint64_t v35 = *v36;
  v35[1] = v36[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)&a1[a3[15]] = *(void *)&a2[a3[15]];
  *(void *)&a1[a3[16]] = *(void *)&a2[a3[16]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)&a1[a3[17]] = *(void *)&a2[a3[17]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)&a1[a3[18]] = *(void *)&a2[a3[18]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)&a1[a3[19]] = *(void *)&a2[a3[19]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v37 = a3[20];
  char v38 = &a1[v37];
  uint64_t v39 = &a2[v37];
  uint64_t v40 = *(void **)&a2[v37];
  uint64_t v41 = *(void **)v38;
  *(void *)char v38 = v40;
  id v42 = v40;

  *((void *)v38 + 1) = *((void *)v39 + 1);
  uint64_t v43 = a3[21];
  uint64_t v44 = *(void *)&a2[v43];
  swift_errorRetain();
  *(void *)&a1[v43] = v44;
  swift_errorRelease();
  *(void *)&a1[a3[22]] = *(void *)&a2[a3[22]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)&a1[a3[23]] = *(void *)&a2[a3[23]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)&a1[a3[24]] = *(void *)&a2[a3[24]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

unsigned char *sub_100015C90(unsigned char *a1, unsigned char *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = sub_100024BF0();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = a3[7];
  *(_OWORD *)&a1[a3[6]] = *(_OWORD *)&a2[a3[6]];
  *(_OWORD *)&a1[v10] = *(_OWORD *)&a2[v10];
  uint64_t v11 = a3[9];
  *(_OWORD *)&a1[a3[8]] = *(_OWORD *)&a2[a3[8]];
  *(_OWORD *)&a1[v11] = *(_OWORD *)&a2[v11];
  uint64_t v12 = a3[11];
  *(_OWORD *)&a1[a3[10]] = *(_OWORD *)&a2[a3[10]];
  *(_OWORD *)&a1[v12] = *(_OWORD *)&a2[v12];
  uint64_t v13 = a3[13];
  *(_OWORD *)&a1[a3[12]] = *(_OWORD *)&a2[a3[12]];
  *(_OWORD *)&a1[v13] = *(_OWORD *)&a2[v13];
  uint64_t v14 = a3[15];
  *(_OWORD *)&a1[a3[14]] = *(_OWORD *)&a2[a3[14]];
  *(void *)&a1[v14] = *(void *)&a2[v14];
  uint64_t v15 = a3[17];
  *(void *)&a1[a3[16]] = *(void *)&a2[a3[16]];
  *(void *)&a1[v15] = *(void *)&a2[v15];
  uint64_t v16 = a3[19];
  *(void *)&a1[a3[18]] = *(void *)&a2[a3[18]];
  *(void *)&a1[v16] = *(void *)&a2[v16];
  uint64_t v17 = a3[21];
  *(_OWORD *)&a1[a3[20]] = *(_OWORD *)&a2[a3[20]];
  *(void *)&a1[v17] = *(void *)&a2[v17];
  uint64_t v18 = a3[23];
  *(void *)&a1[a3[22]] = *(void *)&a2[a3[22]];
  *(void *)&a1[v18] = *(void *)&a2[v18];
  *(void *)&a1[a3[24]] = *(void *)&a2[a3[24]];
  return a1;
}

unsigned char *sub_100015DDC(unsigned char *a1, unsigned char *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = sub_100024BF0();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v9 - 8) + 40))(v7, v8, v9);
  uint64_t v10 = a3[6];
  uint64_t v11 = &a1[v10];
  uint64_t v12 = (uint64_t *)&a2[v10];
  uint64_t v14 = *v12;
  uint64_t v13 = v12[1];
  *uint64_t v11 = v14;
  v11[1] = v13;
  swift_bridgeObjectRelease();
  uint64_t v15 = a3[7];
  uint64_t v16 = &a1[v15];
  uint64_t v17 = (uint64_t *)&a2[v15];
  uint64_t v19 = *v17;
  uint64_t v18 = v17[1];
  *uint64_t v16 = v19;
  v16[1] = v18;
  swift_bridgeObjectRelease();
  uint64_t v20 = a3[8];
  int64_t v21 = &a1[v20];
  uint64_t v22 = (uint64_t *)&a2[v20];
  uint64_t v24 = *v22;
  uint64_t v23 = v22[1];
  *int64_t v21 = v24;
  v21[1] = v23;
  swift_bridgeObjectRelease();
  uint64_t v25 = a3[9];
  char v26 = &a1[v25];
  unint64_t v27 = (uint64_t *)&a2[v25];
  uint64_t v29 = *v27;
  uint64_t v28 = v27[1];
  void *v26 = v29;
  v26[1] = v28;
  swift_bridgeObjectRelease();
  uint64_t v30 = a3[10];
  uint64_t v31 = &a1[v30];
  uint64_t v32 = (uint64_t *)&a2[v30];
  uint64_t v34 = *v32;
  uint64_t v33 = v32[1];
  *uint64_t v31 = v34;
  v31[1] = v33;
  swift_bridgeObjectRelease();
  uint64_t v35 = a3[11];
  uint64_t v36 = &a1[v35];
  uint64_t v37 = (uint64_t *)&a2[v35];
  uint64_t v39 = *v37;
  uint64_t v38 = v37[1];
  *uint64_t v36 = v39;
  v36[1] = v38;
  swift_bridgeObjectRelease();
  uint64_t v40 = a3[12];
  uint64_t v41 = &a1[v40];
  id v42 = (uint64_t *)&a2[v40];
  uint64_t v44 = *v42;
  uint64_t v43 = v42[1];
  *uint64_t v41 = v44;
  v41[1] = v43;
  swift_bridgeObjectRelease();
  uint64_t v45 = a3[13];
  uint64_t v46 = &a1[v45];
  uint64_t v47 = (uint64_t *)&a2[v45];
  uint64_t v49 = *v47;
  uint64_t v48 = v47[1];
  *uint64_t v46 = v49;
  v46[1] = v48;
  swift_bridgeObjectRelease();
  uint64_t v50 = a3[14];
  uint64_t v51 = &a1[v50];
  uint64_t v52 = (uint64_t *)&a2[v50];
  uint64_t v54 = *v52;
  uint64_t v53 = v52[1];
  *uint64_t v51 = v54;
  v51[1] = v53;
  swift_bridgeObjectRelease();
  uint64_t v55 = a3[16];
  *(void *)&a1[a3[15]] = *(void *)&a2[a3[15]];
  *(void *)&a1[v55] = *(void *)&a2[v55];
  swift_bridgeObjectRelease();
  *(void *)&a1[a3[17]] = *(void *)&a2[a3[17]];
  swift_bridgeObjectRelease();
  *(void *)&a1[a3[18]] = *(void *)&a2[a3[18]];
  swift_bridgeObjectRelease();
  *(void *)&a1[a3[19]] = *(void *)&a2[a3[19]];
  swift_bridgeObjectRelease();
  uint64_t v56 = a3[20];
  uint64_t v57 = &a1[v56];
  uint64_t v58 = &a2[v56];
  uint64_t v59 = *(void **)&a1[v56];
  *(void *)&a1[v56] = *(void *)&a2[v56];

  *((void *)v57 + 1) = *((void *)v58 + 1);
  *(void *)&a1[a3[21]] = *(void *)&a2[a3[21]];
  swift_errorRelease();
  *(void *)&a1[a3[22]] = *(void *)&a2[a3[22]];
  swift_bridgeObjectRelease();
  *(void *)&a1[a3[23]] = *(void *)&a2[a3[23]];
  swift_bridgeObjectRelease();
  *(void *)&a1[a3[24]] = *(void *)&a2[a3[24]];
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_100016030(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100016044);
}

uint64_t sub_100016044(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100024BF0();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1 + *(int *)(a3 + 20);
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v10(v9, a2, v8);
  }
  else
  {
    unint64_t v12 = *(void *)(a1 + *(int *)(a3 + 24) + 8);
    if (v12 >= 0xFFFFFFFF) {
      LODWORD(v12) = -1;
    }
    return (v12 + 1);
  }
}

uint64_t sub_10001610C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100016120);
}

uint64_t sub_100016120(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_100024BF0();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = result;
    uint64_t v11 = a1 + *(int *)(a4 + 20);
    unint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v12(v11, a2, a2, v10);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 24) + 8) = (a2 - 1);
  }
  return result;
}

uint64_t sub_1000161E4()
{
  uint64_t result = sub_100024BF0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unint64_t sub_1000162D4()
{
  unint64_t result = qword_1000310F8;
  if (!qword_1000310F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000310F8);
  }
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100016378(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

unint64_t sub_1000163E8(char a1)
{
  unint64_t v1 = 0xD000000000000014;
  switch(a1)
  {
    case 1:
      unint64_t v1 = 0xD000000000000013;
      break;
    case 2:
      unint64_t v1 = 0xD000000000000017;
      break;
    case 3:
    case 16:
      unint64_t v1 = 0xD000000000000010;
      break;
    case 4:
      unint64_t v1 = 0x6761542064726F57;
      break;
    case 5:
      unint64_t v1 = 0xD000000000000016;
      break;
    case 6:
      unint64_t v1 = 0xD000000000000012;
      break;
    case 7:
      unint64_t v1 = 0x6E656D6D6F636552;
      break;
    case 8:
      unint64_t v1 = 0xD000000000000014;
      break;
    case 9:
      unint64_t v1 = 0x725420656C797453;
      break;
    case 10:
      unint64_t v1 = 0xD000000000000015;
      break;
    case 11:
      unint64_t v1 = 0xD00000000000001ALL;
      break;
    case 12:
      unint64_t v1 = 0xD000000000000018;
      break;
    case 13:
      unint64_t v1 = 0x6553206567616D49;
      break;
    case 14:
      unint64_t v1 = 0x7473452065736F50;
      break;
    case 15:
      unint64_t v1 = 0x41512074726542;
      break;
    case 17:
      unint64_t v1 = 0xD000000000000020;
      break;
    case 18:
      if (qword_100030A78 != -1) {
        swift_once();
      }
      unint64_t v1 = qword_1000341C0;
      swift_bridgeObjectRetain();
      break;
    default:
      return v1;
  }
  return v1;
}

_UNKNOWN **static MLPreviewType.allCases.getter()
{
  return &off_10002D0B8;
}

unint64_t MLPreviewType.rawValue.getter(char a1)
{
  unint64_t result = 0x616C436567616D69;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x73616C4374786574;
      break;
    case 2:
      unint64_t result = 0xD000000000000012;
      break;
    case 3:
      unint64_t result = 0x65447463656A626FLL;
      break;
    case 4:
      unint64_t result = 0x6767615464726F77;
      break;
    case 5:
      unint64_t result = 0xD000000000000011;
      break;
    case 6:
    case 10:
      unint64_t result = 0xD000000000000010;
      break;
    case 7:
      unint64_t result = 0x6E656D6D6F636572;
      break;
    case 8:
      unint64_t result = 0x616C43646E756F73;
      break;
    case 9:
      unint64_t result = 0x617254656C797473;
      break;
    case 11:
      unint64_t result = 0xD000000000000014;
      break;
    case 12:
      unint64_t result = 0xD000000000000012;
      break;
    case 13:
      unint64_t result = 0x6765536567616D69;
      break;
    case 14:
      unint64_t result = 0x6974734565736F70;
      break;
    case 15:
      unint64_t result = 0x415174726562;
      break;
    case 16:
      unint64_t result = 0x7473456874706564;
      break;
    case 17:
      unint64_t result = 0xD000000000000019;
      break;
    case 18:
      unint64_t result = 0x6E776F6E6B6E75;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_100016904(char *a1, char *a2)
{
  char v2 = *a2;
  unint64_t v3 = MLPreviewType.rawValue.getter(*a1);
  uint64_t v5 = v4;
  if (v3 == MLPreviewType.rawValue.getter(v2) && v5 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = sub_1000251E0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

Swift::Int sub_100016990()
{
  char v1 = *v0;
  sub_100025270();
  MLPreviewType.rawValue.getter(v1);
  sub_100024FE0();
  swift_bridgeObjectRelease();
  return sub_1000252A0();
}

uint64_t sub_1000169F4()
{
  MLPreviewType.rawValue.getter(*v0);
  sub_100024FE0();
  return swift_bridgeObjectRelease();
}

Swift::Int sub_100016A48()
{
  char v1 = *v0;
  sub_100025270();
  MLPreviewType.rawValue.getter(v1);
  sub_100024FE0();
  swift_bridgeObjectRelease();
  return sub_1000252A0();
}

uint64_t sub_100016AA8()
{
  return sub_100025020();
}

uint64_t sub_100016B08()
{
  return sub_100025010();
}

void sub_100016B58(void *a1@<X8>)
{
  *a1 = &off_10002D0B8;
}

uint64_t sub_100016B68@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = _s30com_apple_MLKit_MLModelPreview13MLPreviewTypeO8rawValueACSgSS_tcfC_0();
  *a1 = result;
  return result;
}

unint64_t sub_100016B98@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = MLPreviewType.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t _s30com_apple_MLKit_MLModelPreview13MLPreviewTypeO8rawValueACSgSS_tcfC_0()
{
  unint64_t v0 = sub_1000251F0();
  swift_bridgeObjectRelease();
  if (v0 >= 0x13) {
    return 19;
  }
  else {
    return v0;
  }
}

unint64_t sub_100016C1C()
{
  unint64_t result = qword_100031110;
  if (!qword_100031110)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100031110);
  }
  return result;
}

unint64_t sub_100016C74()
{
  unint64_t result = qword_100031118;
  if (!qword_100031118)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_100031120);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100031118);
  }
  return result;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for MLPreviewType(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xEE) {
    goto LABEL_17;
  }
  if (a2 + 18 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 18) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 18;
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
      return (*a1 | (v4 << 8)) - 18;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 18;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x13;
  int v8 = v6 - 19;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for MLPreviewType(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 18 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 18) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xEE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xED)
  {
    unsigned int v6 = ((a2 - 238) >> 8) + 1;
    *unint64_t result = a2 + 18;
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
        JUMPOUT(0x100016E38);
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
          *unint64_t result = a2 + 18;
        break;
    }
  }
  return result;
}

uint64_t sub_100016E60(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_100016E68(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for MLPreviewType()
{
  return &type metadata for MLPreviewType;
}

unint64_t sub_100016E80()
{
  unint64_t result = qword_100031128;
  if (!qword_100031128)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100031128);
  }
  return result;
}

uint64_t ModelHeuristics.specificationVersion.getter(uint64_t a1, uint64_t a2)
{
  return a2;
}

void *initializeBufferWithCopyOfBuffer for ModelHeuristics(void *a1, uint64_t a2)
{
  int v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  id v5 = v3;
  return a1;
}

uint64_t assignWithCopy for ModelHeuristics(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  id v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  return a1;
}

uint64_t assignWithTake for ModelHeuristics(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void **)a1;
  *(void *)a1 = *a2;

  *(void *)(a1 + 8) = a2[1];
  return a1;
}

uint64_t getEnumTagSinglePayload for ModelHeuristics(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ModelHeuristics(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)unint64_t result = a2 ^ 0x80000000;
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
      *(void *)unint64_t result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ModelHeuristics()
{
  return &type metadata for ModelHeuristics;
}

uint64_t getEnumTagSinglePayload for FileErrors(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for FileErrors(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 1;
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
        JUMPOUT(0x10001718CLL);
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
          *unint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

unsigned char *sub_1000171B4(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for FileErrors()
{
  return &type metadata for FileErrors;
}

unint64_t sub_1000171D4()
{
  unint64_t result = qword_100031130;
  if (!qword_100031130)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100031130);
  }
  return result;
}

BOOL sub_100017228(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

Swift::Int sub_100017240()
{
  Swift::UInt v1 = *v0;
  sub_100025270();
  sub_100025280(v1);
  return sub_1000252A0();
}

void sub_100017288()
{
  sub_100025280(*v0);
}

Swift::Int sub_1000172B4()
{
  Swift::UInt v1 = *v0;
  sub_100025270();
  sub_100025280(v1);
  return sub_1000252A0();
}

ValueMetadata *type metadata accessor for MetadataSectionCardView()
{
  return &type metadata for MetadataSectionCardView;
}

uint64_t sub_100017308(uint64_t a1)
{
  return _swift_getOpaqueTypeConformance2(a1, &unk_100027FF4, 1);
}

uint64_t sub_100017324@<X0>(uint64_t a1@<X8>)
{
  uint64_t v28 = a1;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_100030E08);
  __chkstk_darwin(v2 - 8);
  unsigned int v4 = (char *)&v28 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_100030E10);
  uint64_t v6 = v5 - 8;
  __chkstk_darwin(v5);
  int v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_100030E18);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)unsigned int v4 = sub_100024D40();
  *((void *)v4 + 1) = 0;
  v4[16] = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_100030E20);
  long long v12 = v1[5];
  long long v34 = v1[4];
  long long v35 = v12;
  long long v36 = v1[6];
  uint64_t v37 = *((void *)v1 + 14);
  long long v13 = v1[1];
  long long v30 = *v1;
  long long v31 = v13;
  long long v14 = v1[3];
  long long v32 = v1[2];
  long long v33 = v14;
  uint64_t v29 = sub_100007980();
  *(void *)(swift_allocObject() + 16) = v29;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_100030E28);
  sub_100024C20();
  sub_10000A0FC(&qword_100030E30, &qword_100030E28);
  sub_100009DF4();
  sub_100009E48();
  sub_100024F20();
  char v15 = sub_100024DB0();
  sub_100024C90();
  uint64_t v17 = v16;
  uint64_t v19 = v18;
  uint64_t v21 = v20;
  uint64_t v23 = v22;
  sub_100005B00((uint64_t)v4, (uint64_t)v8, &qword_100030E08);
  uint64_t v24 = &v8[*(int *)(v6 + 44)];
  *uint64_t v24 = v15;
  *((void *)v24 + 1) = v17;
  *((void *)v24 + 2) = v19;
  *((void *)v24 + 3) = v21;
  *((void *)v24 + 4) = v23;
  v24[40] = 0;
  sub_100005B64((uint64_t)v4, &qword_100030E08);
  uint64_t v25 = sub_100024F40();
  sub_100008DE8(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v11, 0.0, 1, INFINITY, 0, v25, v26);
  sub_100005B64((uint64_t)v8, &qword_100030E10);
  sub_100005B00((uint64_t)v11, v28, &qword_100030E18);
  return sub_100005B64((uint64_t)v11, &qword_100030E18);
}

uint64_t sub_100017650@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v47 = a3;
  uint64_t v5 = type metadata accessor for ModelMetadataItem();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v41 = (uint64_t)&v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_100030E48);
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v40 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_100030E50);
  uint64_t v12 = __chkstk_darwin(v11 - 8);
  uint64_t v42 = (uint64_t)&v40 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __chkstk_darwin(v12);
  uint64_t v16 = (char *)&v40 - v15;
  __chkstk_darwin(v14);
  uint64_t v18 = (char *)&v40 - v17;
  uint64_t v19 = (uint64_t *)(a1 + *(int *)(v5 + 20));
  uint64_t v20 = *v19;
  uint64_t v21 = v19[1];
  uint64_t v22 = (uint64_t *)(a1 + *(int *)(v5 + 24));
  uint64_t v24 = *v22;
  uint64_t v23 = v22[1];
  uint64_t v43 = v20;
  uint64_t v44 = v24;
  uint64_t v45 = v21;
  uint64_t v46 = v23;
  sub_100009EA0(a1, (uint64_t)&v40 - v17);
  uint64_t v25 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56);
  uint64_t v26 = 1;
  v25(v18, 0, 1, v5);
  uint64_t v27 = *(void *)(a2 + 16);
  if (v27)
  {
    sub_100009EA0(a2+ ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))+ *(void *)(v6 + 72) * (v27 - 1), (uint64_t)v16);
    uint64_t v26 = 0;
  }
  v25(v16, v26, 1, v5);
  uint64_t v28 = (uint64_t)&v10[*(int *)(v8 + 48)];
  sub_100005B00((uint64_t)v18, (uint64_t)v10, &qword_100030E50);
  sub_100005B00((uint64_t)v16, v28, &qword_100030E50);
  uint64_t v29 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 48);
  if (v29((uint64_t)v10, 1, v5) != 1)
  {
    uint64_t v34 = v42;
    sub_100005B00((uint64_t)v10, v42, &qword_100030E50);
    int v35 = v29(v28, 1, v5);
    uint64_t v30 = v45;
    uint64_t v31 = v46;
    if (v35 != 1)
    {
      uint64_t v36 = v34;
      uint64_t v37 = v41;
      sub_100007DF8(v28, v41);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      char v38 = sub_100024C00();
      sub_100009F04(v37);
      sub_100005B64((uint64_t)v16, &qword_100030E50);
      sub_100005B64((uint64_t)v18, &qword_100030E50);
      sub_100009F04(v36);
      uint64_t result = sub_100005B64((uint64_t)v10, &qword_100030E50);
      char v33 = v38 ^ 1;
      goto LABEL_10;
    }
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_100005B64((uint64_t)v16, &qword_100030E50);
    sub_100005B64((uint64_t)v18, &qword_100030E50);
    sub_100009F04(v34);
    goto LABEL_8;
  }
  uint64_t v30 = v45;
  swift_bridgeObjectRetain();
  uint64_t v31 = v46;
  swift_bridgeObjectRetain();
  sub_100005B64((uint64_t)v16, &qword_100030E50);
  sub_100005B64((uint64_t)v18, &qword_100030E50);
  if (v29(v28, 1, v5) != 1)
  {
LABEL_8:
    uint64_t result = sub_100005B64((uint64_t)v10, &qword_100030E48);
    char v33 = 1;
    goto LABEL_10;
  }
  uint64_t result = sub_100005B64((uint64_t)v10, &qword_100030E50);
  char v33 = 0;
LABEL_10:
  uint64_t v39 = v47;
  *uint64_t v47 = v43;
  v39[1] = v30;
  _OWORD v39[2] = v44;
  v39[3] = v31;
  *((unsigned char *)v39 + 32) = v33 & 1;
  return result;
}

uint64_t sub_100017A70()
{
  swift_bridgeObjectRelease();
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100017AA8@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return sub_100017650(a1, *(void *)(v2 + 16), a2);
}

ValueMetadata *type metadata accessor for InputOutputCardsView()
{
  return &type metadata for InputOutputCardsView;
}

uint64_t sub_100017AC0(uint64_t a1)
{
  return _swift_getOpaqueTypeConformance2(a1, &unk_100028068, 1);
}

uint64_t sub_100017ADC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_100031138);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_100031140);
  uint64_t v8 = v7 - 8;
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v6 = sub_100024D30();
  *((void *)v6 + 1) = 0x402E000000000000;
  v6[16] = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_100031148);
  v23[1] = a1;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_100031150);
  sub_100024C20();
  type metadata accessor for InputOutputCardView();
  sub_10000A0FC(&qword_100031158, &qword_100031150);
  sub_100017DF8(&qword_100031160, (void (*)(uint64_t))type metadata accessor for InputOutputCardView);
  sub_100017DF8(&qword_100031168, (void (*)(uint64_t))type metadata accessor for InputOutput);
  sub_100024F20();
  char v11 = sub_100024D80();
  sub_100024C90();
  uint64_t v13 = v12;
  uint64_t v15 = v14;
  uint64_t v17 = v16;
  uint64_t v19 = v18;
  sub_100005B00((uint64_t)v6, (uint64_t)v10, &qword_100031138);
  uint64_t v20 = &v10[*(int *)(v8 + 44)];
  *uint64_t v20 = v11;
  *((void *)v20 + 1) = v13;
  *((void *)v20 + 2) = v15;
  *((void *)v20 + 3) = v17;
  *((void *)v20 + 4) = v19;
  v20[40] = 0;
  sub_100005B64((uint64_t)v6, &qword_100031138);
  sub_100005B00((uint64_t)v10, a2, &qword_100031140);
  uint64_t v21 = a2 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_100031170) + 36);
  *(unsigned char *)(v21 + 32) = 0;
  *(_OWORD *)uint64_t v21 = 0u;
  *(_OWORD *)(v21 + 16) = 0u;
  return sub_100005B64((uint64_t)v10, &qword_100031140);
}

uint64_t sub_100017D9C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_100017E40(a1, a2);
}

uint64_t sub_100017DA4@<X0>(uint64_t a1@<X8>)
{
  return sub_100017ADC(*v1, a1);
}

uint64_t type metadata accessor for InputOutputCardView()
{
  uint64_t result = qword_1000311D0;
  if (!qword_1000311D0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100017DF8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100017E40(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for InputOutput();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t *sub_100017EA4(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = type metadata accessor for InputOutput();
  int v5 = *(_DWORD *)(*(void *)(v4 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v20 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v20 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = (int *)v4;
    uint64_t v7 = sub_100024C20();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = v6[5];
    uint64_t v9 = (uint64_t *)((char *)a1 + v8);
    uint64_t v10 = (uint64_t *)((char *)a2 + v8);
    uint64_t v11 = v10[1];
    *uint64_t v9 = *v10;
    v9[1] = v11;
    uint64_t v12 = v6[6];
    uint64_t v13 = (uint64_t *)((char *)a1 + v12);
    uint64_t v14 = (uint64_t *)((char *)a2 + v12);
    uint64_t v15 = v14[1];
    *uint64_t v13 = *v14;
    v13[1] = v15;
    uint64_t v16 = v6[7];
    uint64_t v17 = (uint64_t *)((char *)a1 + v16);
    uint64_t v18 = (uint64_t *)((char *)a2 + v16);
    uint64_t v19 = v18[1];
    *uint64_t v17 = *v18;
    v17[1] = v19;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_100017FBC(uint64_t a1)
{
  uint64_t v2 = sub_100024C20();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  type metadata accessor for InputOutput();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_10001805C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100024C20();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  int v5 = (int *)type metadata accessor for InputOutput();
  uint64_t v6 = v5[5];
  uint64_t v7 = (void *)(a1 + v6);
  uint64_t v8 = (uint64_t *)(a2 + v6);
  uint64_t v10 = *v8;
  uint64_t v9 = v8[1];
  *uint64_t v7 = v10;
  v7[1] = v9;
  uint64_t v11 = v5[6];
  uint64_t v12 = (void *)(a1 + v11);
  uint64_t v13 = (void *)(a2 + v11);
  uint64_t v14 = v13[1];
  *uint64_t v12 = *v13;
  v12[1] = v14;
  uint64_t v15 = v5[7];
  uint64_t v16 = (void *)(a1 + v15);
  uint64_t v17 = (void *)(a2 + v15);
  uint64_t v18 = v17[1];
  *uint64_t v16 = *v17;
  v16[1] = v18;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_100018124(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100024C20();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  int v5 = (int *)type metadata accessor for InputOutput();
  uint64_t v6 = v5[5];
  uint64_t v7 = (void *)(a1 + v6);
  uint64_t v8 = (void *)(a2 + v6);
  *uint64_t v7 = *v8;
  v7[1] = v8[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v9 = v5[6];
  uint64_t v10 = (void *)(a1 + v9);
  uint64_t v11 = (void *)(a2 + v9);
  *uint64_t v10 = *v11;
  v10[1] = v11[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v12 = v5[7];
  uint64_t v13 = (void *)(a1 + v12);
  uint64_t v14 = (void *)(a2 + v12);
  *uint64_t v13 = *v14;
  v13[1] = v14[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_100018220(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100024C20();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  int v5 = (int *)type metadata accessor for InputOutput();
  *(_OWORD *)(a1 + v5[5]) = *(_OWORD *)(a2 + v5[5]);
  *(_OWORD *)(a1 + v5[6]) = *(_OWORD *)(a2 + v5[6]);
  *(_OWORD *)(a1 + v5[7]) = *(_OWORD *)(a2 + v5[7]);
  return a1;
}

uint64_t sub_1000182B0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100024C20();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  int v5 = (int *)type metadata accessor for InputOutput();
  uint64_t v6 = v5[5];
  uint64_t v7 = (void *)(a1 + v6);
  uint64_t v8 = (uint64_t *)(a2 + v6);
  uint64_t v10 = *v8;
  uint64_t v9 = v8[1];
  *uint64_t v7 = v10;
  v7[1] = v9;
  swift_bridgeObjectRelease();
  uint64_t v11 = v5[6];
  uint64_t v12 = (void *)(a1 + v11);
  uint64_t v13 = (uint64_t *)(a2 + v11);
  uint64_t v15 = *v13;
  uint64_t v14 = v13[1];
  *uint64_t v12 = v15;
  v12[1] = v14;
  swift_bridgeObjectRelease();
  uint64_t v16 = v5[7];
  uint64_t v17 = (void *)(a1 + v16);
  uint64_t v18 = (uint64_t *)(a2 + v16);
  uint64_t v20 = *v18;
  uint64_t v19 = v18[1];
  *uint64_t v17 = v20;
  v17[1] = v19;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_10001837C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100018390);
}

uint64_t sub_100018390(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for InputOutput();
  int v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);
  return v5(a1, a2, v4);
}

uint64_t sub_1000183FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100018410);
}

uint64_t sub_100018410(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for InputOutput();
  int v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  return v5(a1, a2, a2, v4);
}

uint64_t sub_100018480()
{
  uint64_t result = type metadata accessor for InputOutput();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unint64_t sub_100018510()
{
  unint64_t result = qword_100031208;
  if (!qword_100031208)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_100031170);
    sub_10001891C(&qword_100031210, &qword_100031140, &qword_100031218, &qword_100031138);
    sub_10000A0FC(&qword_100031220, &qword_100031228);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100031208);
  }
  return result;
}

uint64_t sub_1000185D0(uint64_t a1)
{
  return _swift_getOpaqueTypeConformance2(a1, &unk_100028090, 1);
}

void *sub_1000185EC@<X0>(void *a1@<X8>)
{
  sub_100024D40();
  sub_100018734(v1, (uint64_t)__src);
  sub_100024DB0();
  sub_100024C90();
  sub_100024F40();
  sub_100008E44(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)__src, 0.0, 1, INFINITY, 0);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return memcpy(a1, __src, 0x108uLL);
}

uint64_t sub_100018734@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = (int *)type metadata accessor for InputOutput();
  int v5 = (uint64_t *)(a1 + v4[5]);
  uint64_t v6 = *v5;
  uint64_t v7 = v5[1];
  uint64_t v8 = (uint64_t *)(a1 + v4[6]);
  uint64_t v9 = *v8;
  uint64_t v10 = v8[1];
  uint64_t v11 = (uint64_t *)(a1 + v4[7]);
  uint64_t v12 = *v11;
  uint64_t v13 = v11[1];
  *(void *)a2 = v6;
  *(void *)(a2 + 8) = v7;
  *(void *)(a2 + 16) = v9;
  *(void *)(a2 + 24) = v10;
  *(unsigned char *)(a2 + 32) = 1;
  *(void *)(a2 + 40) = 0x7470697263736544;
  *(void *)(a2 + 48) = 0xEB000000006E6F69;
  *(void *)(a2 + 56) = v12;
  *(void *)(a2 + 64) = v13;
  *(unsigned char *)(a2 + 72) = 0;
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

unint64_t sub_100018804()
{
  unint64_t result = qword_100031230;
  if (!qword_100031230)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_100031238);
    sub_100018880();
    sub_10000A140();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100031230);
  }
  return result;
}

unint64_t sub_100018880()
{
  unint64_t result = qword_100031240;
  if (!qword_100031240)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_100031248);
    sub_10001891C(&qword_100031250, &qword_100031258, &qword_100031260, &qword_100031268);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100031240);
  }
  return result;
}

uint64_t sub_10001891C(unint64_t *a1, uint64_t *a2, unint64_t *a3, uint64_t *a4)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    sub_10000A0FC(a3, a4);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t *sub_1000189BC(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v50 = *a2;
    *a1 = *a2;
    uint64_t v4 = (uint64_t *)(v50 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    *(unsigned char *)a1 = *(unsigned char *)a2;
    uint64_t v6 = (int *)type metadata accessor for ModelDataViewModel();
    uint64_t v7 = v6[5];
    uint64_t v8 = (char *)v4 + v7;
    uint64_t v9 = (char *)a2 + v7;
    uint64_t v10 = sub_100024BF0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
    uint64_t v11 = v6[6];
    uint64_t v12 = (uint64_t *)((char *)v4 + v11);
    uint64_t v13 = (uint64_t *)((char *)a2 + v11);
    uint64_t v14 = v13[1];
    *uint64_t v12 = *v13;
    v12[1] = v14;
    uint64_t v15 = v6[7];
    uint64_t v16 = (uint64_t *)((char *)v4 + v15);
    uint64_t v17 = (uint64_t *)((char *)a2 + v15);
    uint64_t v59 = v17[1];
    *uint64_t v16 = *v17;
    v16[1] = v59;
    uint64_t v18 = v6[8];
    uint64_t v19 = (uint64_t *)((char *)v4 + v18);
    uint64_t v20 = (uint64_t *)((char *)a2 + v18);
    uint64_t v58 = v20[1];
    void *v19 = *v20;
    v19[1] = v58;
    uint64_t v21 = v6[9];
    uint64_t v22 = (uint64_t *)((char *)v4 + v21);
    uint64_t v23 = (uint64_t *)((char *)a2 + v21);
    uint64_t v57 = v23[1];
    *uint64_t v22 = *v23;
    v22[1] = v57;
    uint64_t v24 = v6[10];
    uint64_t v25 = (uint64_t *)((char *)v4 + v24);
    uint64_t v26 = (uint64_t *)((char *)a2 + v24);
    uint64_t v56 = v26[1];
    *uint64_t v25 = *v26;
    v25[1] = v56;
    uint64_t v27 = v6[11];
    uint64_t v28 = (uint64_t *)((char *)v4 + v27);
    uint64_t v29 = (uint64_t *)((char *)a2 + v27);
    uint64_t v55 = v29[1];
    *uint64_t v28 = *v29;
    v28[1] = v55;
    uint64_t v30 = v6[12];
    uint64_t v31 = (uint64_t *)((char *)v4 + v30);
    long long v32 = (uint64_t *)((char *)a2 + v30);
    uint64_t v54 = v32[1];
    *uint64_t v31 = *v32;
    v31[1] = v54;
    uint64_t v33 = v6[13];
    uint64_t v34 = (uint64_t *)((char *)v4 + v33);
    int v35 = (uint64_t *)((char *)a2 + v33);
    uint64_t v53 = v35[1];
    void *v34 = *v35;
    v34[1] = v53;
    uint64_t v36 = v6[14];
    uint64_t v37 = (uint64_t *)((char *)v4 + v36);
    char v38 = (uint64_t *)((char *)a2 + v36);
    uint64_t v39 = v38[1];
    *uint64_t v37 = *v38;
    v37[1] = v39;
    *(uint64_t *)((char *)v4 + v6[15]) = *(uint64_t *)((char *)a2 + v6[15]);
    *(uint64_t *)((char *)v4 + v6[16]) = *(uint64_t *)((char *)a2 + v6[16]);
    *(uint64_t *)((char *)v4 + v6[17]) = *(uint64_t *)((char *)a2 + v6[17]);
    *(uint64_t *)((char *)v4 + v6[18]) = *(uint64_t *)((char *)a2 + v6[18]);
    *(uint64_t *)((char *)v4 + v6[19]) = *(uint64_t *)((char *)a2 + v6[19]);
    uint64_t v40 = v6[20];
    uint64_t v41 = (uint64_t *)((char *)v4 + v40);
    uint64_t v42 = (char *)a2 + v40;
    uint64_t v44 = *(void **)v42;
    uint64_t v43 = *((void *)v42 + 1);
    *uint64_t v41 = v44;
    v41[1] = v43;
    uint64_t v52 = v6[21];
    uint64_t v45 = *(uint64_t *)((char *)a2 + v52);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    id v46 = v44;
    swift_errorRetain();
    *(uint64_t *)((char *)v4 + v52) = v45;
    *(uint64_t *)((char *)v4 + v6[22]) = *(uint64_t *)((char *)a2 + v6[22]);
    *(uint64_t *)((char *)v4 + v6[23]) = *(uint64_t *)((char *)a2 + v6[23]);
    *(uint64_t *)((char *)v4 + v6[24]) = *(uint64_t *)((char *)a2 + v6[24]);
    uint64_t v47 = *(int *)(a3 + 20);
    uint64_t v48 = (char *)v4 + v47;
    uint64_t v49 = (char *)a2 + v47;
    *uint64_t v48 = *v49;
    *((void *)v48 + 1) = *((void *)v49 + 1);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  swift_retain();
  return v4;
}

uint64_t sub_100018CBC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ModelDataViewModel();
  uint64_t v3 = a1 + *(int *)(v2 + 20);
  uint64_t v4 = sub_100024BF0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_errorRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_release();
}

unsigned char *sub_100018E4C(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  int v5 = (int *)type metadata accessor for ModelDataViewModel();
  uint64_t v6 = v5[5];
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = sub_100024BF0();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
  uint64_t v10 = v5[6];
  uint64_t v11 = &a1[v10];
  uint64_t v12 = &a2[v10];
  uint64_t v13 = v12[1];
  *uint64_t v11 = *v12;
  v11[1] = v13;
  uint64_t v14 = v5[7];
  uint64_t v15 = &a1[v14];
  uint64_t v16 = &a2[v14];
  uint64_t v57 = v16[1];
  *uint64_t v15 = *v16;
  v15[1] = v57;
  uint64_t v17 = v5[8];
  uint64_t v18 = &a1[v17];
  uint64_t v19 = &a2[v17];
  uint64_t v56 = v19[1];
  *uint64_t v18 = *v19;
  v18[1] = v56;
  uint64_t v20 = v5[9];
  uint64_t v21 = &a1[v20];
  uint64_t v22 = &a2[v20];
  uint64_t v55 = v22[1];
  *uint64_t v21 = *v22;
  v21[1] = v55;
  uint64_t v23 = v5[10];
  uint64_t v24 = &a1[v23];
  uint64_t v25 = &a2[v23];
  uint64_t v54 = v25[1];
  *uint64_t v24 = *v25;
  v24[1] = v54;
  uint64_t v26 = v5[11];
  uint64_t v27 = &a1[v26];
  uint64_t v28 = &a2[v26];
  uint64_t v53 = v28[1];
  *uint64_t v27 = *v28;
  v27[1] = v53;
  uint64_t v29 = v5[12];
  uint64_t v30 = &a1[v29];
  uint64_t v31 = &a2[v29];
  uint64_t v52 = v31[1];
  *uint64_t v30 = *v31;
  v30[1] = v52;
  uint64_t v32 = v5[13];
  uint64_t v33 = &a1[v32];
  uint64_t v34 = &a2[v32];
  uint64_t v51 = v34[1];
  *uint64_t v33 = *v34;
  v33[1] = v51;
  uint64_t v35 = v5[14];
  uint64_t v36 = &a1[v35];
  uint64_t v37 = &a2[v35];
  uint64_t v38 = v37[1];
  *uint64_t v36 = *v37;
  v36[1] = v38;
  *(void *)&a1[v5[15]] = *(void *)&a2[v5[15]];
  *(void *)&a1[v5[16]] = *(void *)&a2[v5[16]];
  *(void *)&a1[v5[17]] = *(void *)&a2[v5[17]];
  *(void *)&a1[v5[18]] = *(void *)&a2[v5[18]];
  *(void *)&a1[v5[19]] = *(void *)&a2[v5[19]];
  uint64_t v39 = v5[20];
  uint64_t v40 = &a1[v39];
  uint64_t v41 = &a2[v39];
  uint64_t v43 = *(void **)v41;
  uint64_t v42 = *((void *)v41 + 1);
  *uint64_t v40 = v43;
  v40[1] = v42;
  uint64_t v50 = v5[21];
  uint64_t v44 = *(void *)&a2[v50];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v45 = v43;
  swift_errorRetain();
  *(void *)&a1[v50] = v44;
  *(void *)&a1[v5[22]] = *(void *)&a2[v5[22]];
  *(void *)&a1[v5[23]] = *(void *)&a2[v5[23]];
  *(void *)&a1[v5[24]] = *(void *)&a2[v5[24]];
  uint64_t v46 = *(int *)(a3 + 20);
  uint64_t v47 = &a1[v46];
  uint64_t v48 = &a2[v46];
  *uint64_t v47 = *v48;
  *((void *)v47 + 1) = *((void *)v48 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

unsigned char *sub_100019100(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = (int *)type metadata accessor for ModelDataViewModel();
  uint64_t v7 = v6[5];
  uint64_t v8 = &a1[v7];
  uint64_t v9 = &a2[v7];
  uint64_t v10 = sub_100024BF0();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  uint64_t v11 = v6[6];
  uint64_t v12 = &a1[v11];
  uint64_t v13 = &a2[v11];
  *uint64_t v12 = *v13;
  v12[1] = v13[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v14 = v6[7];
  uint64_t v15 = &a1[v14];
  uint64_t v16 = &a2[v14];
  *uint64_t v15 = *v16;
  v15[1] = v16[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v17 = v6[8];
  uint64_t v18 = &a1[v17];
  uint64_t v19 = &a2[v17];
  *uint64_t v18 = *v19;
  v18[1] = v19[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v20 = v6[9];
  uint64_t v21 = &a1[v20];
  uint64_t v22 = &a2[v20];
  *uint64_t v21 = *v22;
  v21[1] = v22[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v23 = v6[10];
  uint64_t v24 = &a1[v23];
  uint64_t v25 = &a2[v23];
  *uint64_t v24 = *v25;
  v24[1] = v25[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v26 = v6[11];
  uint64_t v27 = &a1[v26];
  uint64_t v28 = &a2[v26];
  *uint64_t v27 = *v28;
  v27[1] = v28[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v29 = v6[12];
  uint64_t v30 = &a1[v29];
  uint64_t v31 = &a2[v29];
  *uint64_t v30 = *v31;
  v30[1] = v31[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v32 = v6[13];
  uint64_t v33 = &a1[v32];
  uint64_t v34 = &a2[v32];
  *uint64_t v33 = *v34;
  v33[1] = v34[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v35 = v6[14];
  uint64_t v36 = &a1[v35];
  uint64_t v37 = &a2[v35];
  *uint64_t v36 = *v37;
  v36[1] = v37[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)&a1[v6[15]] = *(void *)&a2[v6[15]];
  *(void *)&a1[v6[16]] = *(void *)&a2[v6[16]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)&a1[v6[17]] = *(void *)&a2[v6[17]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)&a1[v6[18]] = *(void *)&a2[v6[18]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)&a1[v6[19]] = *(void *)&a2[v6[19]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v38 = v6[20];
  uint64_t v39 = &a1[v38];
  uint64_t v40 = &a2[v38];
  uint64_t v41 = *(void **)&a2[v38];
  uint64_t v42 = *(void **)v39;
  *(void *)uint64_t v39 = v41;
  id v43 = v41;

  *((void *)v39 + 1) = *((void *)v40 + 1);
  uint64_t v44 = v6[21];
  uint64_t v45 = *(void *)&a2[v44];
  swift_errorRetain();
  *(void *)&a1[v44] = v45;
  swift_errorRelease();
  *(void *)&a1[v6[22]] = *(void *)&a2[v6[22]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)&a1[v6[23]] = *(void *)&a2[v6[23]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)&a1[v6[24]] = *(void *)&a2[v6[24]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v46 = *(int *)(a3 + 20);
  uint64_t v47 = &a1[v46];
  uint64_t v48 = &a2[v46];
  *uint64_t v47 = *v48;
  *((void *)v47 + 1) = *((void *)v48 + 1);
  swift_retain();
  swift_release();
  return a1;
}

unsigned char *sub_100019470(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = (int *)type metadata accessor for ModelDataViewModel();
  uint64_t v7 = v6[5];
  uint64_t v8 = &a1[v7];
  uint64_t v9 = &a2[v7];
  uint64_t v10 = sub_100024BF0();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  *(_OWORD *)&a1[v6[6]] = *(_OWORD *)&a2[v6[6]];
  *(_OWORD *)&a1[v6[7]] = *(_OWORD *)&a2[v6[7]];
  *(_OWORD *)&a1[v6[8]] = *(_OWORD *)&a2[v6[8]];
  *(_OWORD *)&a1[v6[9]] = *(_OWORD *)&a2[v6[9]];
  *(_OWORD *)&a1[v6[10]] = *(_OWORD *)&a2[v6[10]];
  *(_OWORD *)&a1[v6[11]] = *(_OWORD *)&a2[v6[11]];
  *(_OWORD *)&a1[v6[12]] = *(_OWORD *)&a2[v6[12]];
  *(_OWORD *)&a1[v6[13]] = *(_OWORD *)&a2[v6[13]];
  *(_OWORD *)&a1[v6[14]] = *(_OWORD *)&a2[v6[14]];
  *(void *)&a1[v6[15]] = *(void *)&a2[v6[15]];
  *(void *)&a1[v6[16]] = *(void *)&a2[v6[16]];
  *(void *)&a1[v6[17]] = *(void *)&a2[v6[17]];
  *(void *)&a1[v6[18]] = *(void *)&a2[v6[18]];
  *(void *)&a1[v6[19]] = *(void *)&a2[v6[19]];
  *(_OWORD *)&a1[v6[20]] = *(_OWORD *)&a2[v6[20]];
  *(void *)&a1[v6[21]] = *(void *)&a2[v6[21]];
  *(void *)&a1[v6[22]] = *(void *)&a2[v6[22]];
  *(void *)&a1[v6[23]] = *(void *)&a2[v6[23]];
  *(void *)&a1[v6[24]] = *(void *)&a2[v6[24]];
  *(_OWORD *)&a1[*(int *)(a3 + 20)] = *(_OWORD *)&a2[*(int *)(a3 + 20)];
  return a1;
}

unsigned char *sub_1000195F8(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = (int *)type metadata accessor for ModelDataViewModel();
  uint64_t v7 = v6[5];
  uint64_t v8 = &a1[v7];
  uint64_t v9 = &a2[v7];
  uint64_t v10 = sub_100024BF0();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  uint64_t v11 = v6[6];
  uint64_t v12 = &a1[v11];
  uint64_t v13 = (uint64_t *)&a2[v11];
  uint64_t v15 = *v13;
  uint64_t v14 = v13[1];
  *uint64_t v12 = v15;
  v12[1] = v14;
  swift_bridgeObjectRelease();
  uint64_t v16 = v6[7];
  uint64_t v17 = &a1[v16];
  uint64_t v18 = (uint64_t *)&a2[v16];
  uint64_t v20 = *v18;
  uint64_t v19 = v18[1];
  *uint64_t v17 = v20;
  v17[1] = v19;
  swift_bridgeObjectRelease();
  uint64_t v21 = v6[8];
  uint64_t v22 = &a1[v21];
  uint64_t v23 = (uint64_t *)&a2[v21];
  uint64_t v25 = *v23;
  uint64_t v24 = v23[1];
  *uint64_t v22 = v25;
  v22[1] = v24;
  swift_bridgeObjectRelease();
  uint64_t v26 = v6[9];
  uint64_t v27 = &a1[v26];
  uint64_t v28 = (uint64_t *)&a2[v26];
  uint64_t v30 = *v28;
  uint64_t v29 = v28[1];
  *uint64_t v27 = v30;
  v27[1] = v29;
  swift_bridgeObjectRelease();
  uint64_t v31 = v6[10];
  uint64_t v32 = &a1[v31];
  uint64_t v33 = (uint64_t *)&a2[v31];
  uint64_t v35 = *v33;
  uint64_t v34 = v33[1];
  *uint64_t v32 = v35;
  v32[1] = v34;
  swift_bridgeObjectRelease();
  uint64_t v36 = v6[11];
  uint64_t v37 = &a1[v36];
  uint64_t v38 = (uint64_t *)&a2[v36];
  uint64_t v40 = *v38;
  uint64_t v39 = v38[1];
  *uint64_t v37 = v40;
  v37[1] = v39;
  swift_bridgeObjectRelease();
  uint64_t v41 = v6[12];
  uint64_t v42 = &a1[v41];
  id v43 = (uint64_t *)&a2[v41];
  uint64_t v45 = *v43;
  uint64_t v44 = v43[1];
  void *v42 = v45;
  v42[1] = v44;
  swift_bridgeObjectRelease();
  uint64_t v46 = v6[13];
  uint64_t v47 = &a1[v46];
  uint64_t v48 = (uint64_t *)&a2[v46];
  uint64_t v50 = *v48;
  uint64_t v49 = v48[1];
  *uint64_t v47 = v50;
  v47[1] = v49;
  swift_bridgeObjectRelease();
  uint64_t v51 = v6[14];
  uint64_t v52 = &a1[v51];
  uint64_t v53 = (uint64_t *)&a2[v51];
  uint64_t v55 = *v53;
  uint64_t v54 = v53[1];
  *uint64_t v52 = v55;
  v52[1] = v54;
  swift_bridgeObjectRelease();
  *(void *)&a1[v6[15]] = *(void *)&a2[v6[15]];
  *(void *)&a1[v6[16]] = *(void *)&a2[v6[16]];
  swift_bridgeObjectRelease();
  *(void *)&a1[v6[17]] = *(void *)&a2[v6[17]];
  swift_bridgeObjectRelease();
  *(void *)&a1[v6[18]] = *(void *)&a2[v6[18]];
  swift_bridgeObjectRelease();
  *(void *)&a1[v6[19]] = *(void *)&a2[v6[19]];
  swift_bridgeObjectRelease();
  uint64_t v56 = v6[20];
  uint64_t v57 = &a1[v56];
  uint64_t v58 = &a2[v56];
  uint64_t v59 = *(void **)&a1[v56];
  *(void *)&a1[v56] = *(void *)&a2[v56];

  *((void *)v57 + 1) = *((void *)v58 + 1);
  *(void *)&a1[v6[21]] = *(void *)&a2[v6[21]];
  swift_errorRelease();
  *(void *)&a1[v6[22]] = *(void *)&a2[v6[22]];
  swift_bridgeObjectRelease();
  *(void *)&a1[v6[23]] = *(void *)&a2[v6[23]];
  swift_bridgeObjectRelease();
  *(void *)&a1[v6[24]] = *(void *)&a2[v6[24]];
  swift_bridgeObjectRelease();
  uint64_t v60 = *(int *)(a3 + 20);
  uint64_t v61 = &a1[v60];
  uint64_t v62 = &a2[v60];
  *uint64_t v61 = *v62;
  *((void *)v61 + 1) = *((void *)v62 + 1);
  swift_release();
  return a1;
}

uint64_t sub_100019880(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100019894);
}

uint64_t sub_100019894(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for ModelDataViewModel();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20) + 8);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    int v11 = v10 - 1;
    if (v11 < 0) {
      int v11 = -1;
    }
    return (v11 + 1);
  }
}

uint64_t sub_100019964(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100019978);
}

uint64_t sub_100019978(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = type metadata accessor for ModelDataViewModel();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20) + 8) = a2;
  }
  return result;
}

uint64_t type metadata accessor for QLModelRootView()
{
  uint64_t result = qword_1000312C8;
  if (!qword_1000312C8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100019A84()
{
  uint64_t result = type metadata accessor for ModelDataViewModel();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_100019B18(uint64_t a1)
{
  return _swift_getOpaqueTypeConformance2(a1, &unk_1000280E0, 1);
}

uint64_t sub_100019B34@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v34 = a1;
  uint64_t v3 = sub_100024CF0();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v32 = v3;
  uint64_t v33 = v4;
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_100031300);
  uint64_t v29 = *(void *)(v7 - 8);
  uint64_t v30 = v7;
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_100031308);
  uint64_t v10 = *(void *)(v31 - 8);
  __chkstk_darwin(v31);
  uint64_t v12 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_100031310);
  __chkstk_darwin(v13 - 8);
  uint64_t v15 = (char *)&v27 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_100031318);
  uint64_t v17 = v16 - 8;
  __chkstk_darwin(v16);
  uint64_t v19 = (char *)&v27 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v15 = sub_100024D30();
  *((void *)v15 + 1) = 0;
  v15[16] = 0;
  uint64_t v28 = &v15[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_100031320) + 44)];
  uint64_t v35 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_100031328);
  sub_10000A0FC(&qword_100031330, &qword_100031328);
  sub_100024E30();
  sub_100024CE0();
  sub_10000A0FC(&qword_100031338, &qword_100031300);
  uint64_t v20 = v30;
  uint64_t v21 = v32;
  sub_100024EB0();
  (*(void (**)(char *, uint64_t))(v33 + 8))(v6, v21);
  (*(void (**)(char *, uint64_t))(v29 + 8))(v9, v20);
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v28, v12, v31);
  id v22 = [self secondarySystemBackgroundColor];
  uint64_t v23 = sub_100024EE0();
  LOBYTE(v12) = sub_100024D80();
  sub_100005B00((uint64_t)v15, (uint64_t)v19, &qword_100031310);
  uint64_t v24 = &v19[*(int *)(v17 + 44)];
  *(void *)uint64_t v24 = v23;
  v24[8] = (char)v12;
  sub_100005B64((uint64_t)v15, &qword_100031310);
  LOBYTE(v23) = sub_100024D90();
  uint64_t v25 = v34;
  sub_100005B00((uint64_t)v19, v34, &qword_100031318);
  *(unsigned char *)(v25 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_100031340) + 36)) = v23;
  return sub_100005B64((uint64_t)v19, &qword_100031318);
}

uint64_t sub_100019F60@<X0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v4 = type metadata accessor for SectionMainView(0);
  uint64_t v5 = __chkstk_darwin(v4 - 8);
  uint64_t v54 = &v49[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v5);
  uint64_t v8 = &v49[-v7];
  uint64_t v59 = sub_100024D40();
  sub_10001A4DC(a1, (uint64_t)&v81);
  unint64_t v56 = v82;
  uint64_t v57 = (ValueMetadata *)v81;
  int v9 = v83;
  unint64_t v61 = v86;
  uint64_t v62 = v85;
  uint64_t v60 = v87;
  int v10 = v88;
  uint64_t v65 = v90;
  unint64_t v66 = v89;
  uint64_t v64 = v91;
  int v11 = v92;
  uint64_t v69 = v93;
  int v68 = sub_100024DA0();
  sub_100024C90();
  uint64_t v13 = v12;
  uint64_t v15 = v14;
  uint64_t v17 = v16;
  uint64_t v19 = v18;
  char v113 = 0;
  int v58 = v9;
  char v112 = v9;
  int v63 = v10;
  char v111 = v10;
  int v67 = v11;
  char v110 = v11;
  char v109 = 0;
  unsigned __int8 v114 = 0;
  uint64_t v55 = v8;
  sub_10001AADC(a1, (uint64_t)v8, (uint64_t (*)(void))type metadata accessor for ModelDataViewModel);
  if (!*(void *)(a1 + *(int *)(type metadata accessor for ModelDataViewModel() + 84))) {
    goto LABEL_5;
  }
  v85 = &type metadata for MLFeatureFlags;
  unint64_t v86 = sub_10001ACF0();
  swift_errorRetain();
  char v20 = sub_100024C30();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)&v81);
  if ((v20 & 1) == 0)
  {
    swift_errorRelease();
LABEL_5:
    uint64_t v52 = 0;
    uint64_t v53 = 0;
    uint64_t v30 = 0;
    uint64_t v28 = 0;
    goto LABEL_6;
  }
  swift_getErrorValue();
  uint64_t v81 = sub_100025220();
  uint64_t v82 = v21;
  sub_1000071E8();
  uint64_t v22 = sub_100024E70();
  uint64_t v51 = v23;
  int v50 = v24 & 1;
  sub_100024EC0();
  uint64_t v25 = sub_100024E50();
  uint64_t v52 = v26;
  uint64_t v53 = v25;
  uint64_t v28 = v27;
  uint64_t v30 = v29 & 1;
  swift_errorRelease();
  swift_release();
  sub_100006FA0(v22, v51, v50);
  swift_bridgeObjectRelease();
LABEL_6:
  unsigned __int8 v31 = v114;
  LODWORD(v51) = v114;
  uint64_t v33 = v54;
  uint64_t v32 = (uint64_t)v55;
  sub_10001AADC((uint64_t)v55, (uint64_t)v54, type metadata accessor for SectionMainView);
  *(void *)&long long v70 = v59;
  *((void *)&v70 + 1) = 0x4014000000000000;
  LOBYTE(v71) = 0;
  *(_DWORD *)((char *)&v71 + 1) = v120[0];
  DWORD1(v71) = *(_DWORD *)((char *)v120 + 3);
  *((void *)&v71 + 1) = v57;
  *(void *)&long long v72 = v56;
  BYTE8(v72) = v58;
  *(_DWORD *)((char *)&v72 + 9) = *(_DWORD *)v119;
  HIDWORD(v72) = *(_DWORD *)&v119[3];
  *(void *)&long long v73 = v62;
  *((void *)&v73 + 1) = v61;
  *(void *)&long long v74 = v60;
  BYTE8(v74) = v63;
  *(_DWORD *)((char *)&v74 + 9) = *(_DWORD *)v118;
  HIDWORD(v74) = *(_DWORD *)&v118[3];
  *(void *)&long long v75 = v66;
  *((void *)&v75 + 1) = v65;
  *(void *)&long long v76 = v64;
  BYTE8(v76) = v67;
  *(_DWORD *)((char *)&v76 + 9) = *(_DWORD *)v117;
  HIDWORD(v76) = *(_DWORD *)&v117[3];
  *(void *)&long long v77 = v69;
  BYTE8(v77) = v68;
  HIDWORD(v77) = *(_DWORD *)&v116[3];
  *(_DWORD *)((char *)&v77 + 9) = *(_DWORD *)v116;
  *(void *)&long long v78 = v13;
  *((void *)&v78 + 1) = v15;
  *(void *)&long long v79 = v17;
  *((void *)&v79 + 1) = v19;
  LOBYTE(v80[0]) = 0;
  DWORD1(v80[0]) = *(_DWORD *)&v115[3];
  *(_DWORD *)((char *)v80 + 1) = *(_DWORD *)v115;
  *(_OWORD *)((char *)v80 + 8) = 0u;
  *(_OWORD *)((char *)&v80[1] + 8) = 0u;
  BYTE8(v80[2]) = v31;
  long long v34 = v70;
  long long v35 = v71;
  long long v36 = v73;
  a2[2] = v72;
  a2[3] = v36;
  *a2 = v34;
  a2[1] = v35;
  long long v37 = v74;
  long long v38 = v75;
  long long v39 = v77;
  a2[6] = v76;
  a2[7] = v39;
  a2[4] = v37;
  a2[5] = v38;
  long long v40 = v78;
  long long v41 = v79;
  *(_OWORD *)((char *)a2 + 185) = *(_OWORD *)((char *)&v80[1] + 9);
  long long v42 = v80[1];
  a2[10] = v80[0];
  a2[11] = v42;
  a2[8] = v40;
  a2[9] = v41;
  id v43 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_100031348);
  sub_10001AADC((uint64_t)v33, (uint64_t)a2 + v43[12], type metadata accessor for SectionMainView);
  uint64_t v44 = (char *)a2 + v43[16];
  *(void *)uint64_t v44 = 0;
  v44[8] = 1;
  uint64_t v45 = (uint64_t *)((char *)a2 + v43[20]);
  uint64_t v47 = v52;
  uint64_t v46 = v53;
  *uint64_t v45 = v53;
  v45[1] = v47;
  v45[2] = v30;
  v45[3] = v28;
  sub_10001AB44((uint64_t)&v70);
  sub_1000070D8(v46, v47, v30, v28);
  sub_10001ABEC(v32);
  sub_100006FB0(v46, v47, v30, v28);
  sub_10001ABEC((uint64_t)v33);
  uint64_t v81 = v59;
  uint64_t v82 = 0x4014000000000000;
  unsigned __int8 v83 = 0;
  *(_DWORD *)uint64_t v84 = v120[0];
  *(_DWORD *)&v84[3] = *(_DWORD *)((char *)v120 + 3);
  v85 = v57;
  unint64_t v86 = v56;
  LOBYTE(v87) = v58;
  *(_DWORD *)((char *)&v87 + 1) = *(_DWORD *)v119;
  HIDWORD(v87) = *(_DWORD *)&v119[3];
  uint64_t v88 = v62;
  unint64_t v89 = v61;
  uint64_t v90 = v60;
  LOBYTE(v91) = v63;
  *(_DWORD *)((char *)&v91 + 1) = *(_DWORD *)v118;
  HIDWORD(v91) = *(_DWORD *)&v118[3];
  unint64_t v92 = v66;
  uint64_t v93 = v65;
  uint64_t v94 = v64;
  char v95 = v67;
  *(_DWORD *)unint64_t v96 = *(_DWORD *)v117;
  *(_DWORD *)&v96[3] = *(_DWORD *)&v117[3];
  uint64_t v97 = v69;
  char v98 = v68;
  *(_DWORD *)&v99[3] = *(_DWORD *)&v116[3];
  *(_DWORD *)id v99 = *(_DWORD *)v116;
  uint64_t v100 = v13;
  uint64_t v101 = v15;
  uint64_t v102 = v17;
  uint64_t v103 = v19;
  char v104 = 0;
  *(_DWORD *)&v105[3] = *(_DWORD *)&v115[3];
  *(_DWORD *)uint64_t v105 = *(_DWORD *)v115;
  long long v106 = 0u;
  long long v107 = 0u;
  char v108 = v51;
  return sub_10001AC48((uint64_t)&v81);
}

uint64_t sub_10001A4DC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v70 = type metadata accessor for ModelDataViewModel();
  sub_1000071E8();
  swift_bridgeObjectRetain();
  uint64_t v2 = sub_100024E70();
  uint64_t v4 = v3;
  char v6 = v5 & 1;
  sub_100024E20();
  sub_100024E00();
  swift_release();
  uint64_t v7 = sub_100024E60();
  uint64_t v9 = v8;
  char v11 = v10;
  swift_release();
  sub_100006FA0(v2, v4, v6);
  swift_bridgeObjectRelease();
  uint64_t v12 = self;
  id v13 = [v12 labelColor];
  sub_100024EE0();
  uint64_t v72 = sub_100024E50();
  uint64_t v73 = v14;
  uint64_t v78 = v15;
  char v66 = v16;
  swift_release();
  sub_100006FA0(v7, v9, v11 & 1);
  swift_bridgeObjectRelease();
  unint64_t v17 = sub_10001A9E4();
  uint64_t v19 = HIBYTE(v18) & 0xF;
  if ((v18 & 0x2000000000000000) == 0) {
    uint64_t v19 = v17 & 0xFFFFFFFFFFFFLL;
  }
  if (!v19) {
    swift_bridgeObjectRelease();
  }
  uint64_t v20 = sub_100024E70();
  uint64_t v22 = v21;
  char v24 = v23 & 1;
  sub_100024DF0();
  uint64_t v25 = sub_100024E60();
  uint64_t v27 = v26;
  char v29 = v28;
  swift_release();
  sub_100006FA0(v20, v22, v24);
  swift_bridgeObjectRelease();
  sub_100024E10();
  uint64_t v30 = sub_100024E40();
  uint64_t v32 = v31;
  LOBYTE(v22) = v33 & 1;
  sub_100006FA0(v25, v27, v29 & 1);
  swift_bridgeObjectRelease();
  id v71 = v12;
  id v34 = [v12 secondaryLabelColor];
  sub_100024EE0();
  uint64_t v35 = sub_100024E50();
  uint64_t v67 = v36;
  uint64_t v68 = v35;
  char v38 = v37;
  uint64_t v69 = v39;
  swift_release();
  sub_100006FA0(v30, v32, v22);
  swift_bridgeObjectRelease();
  long long v40 = (uint64_t *)(a1 + *(int *)(v70 + 28));
  uint64_t v42 = *v40;
  unint64_t v41 = v40[1];
  uint64_t v43 = HIBYTE(v41) & 0xF;
  if ((v41 & 0x2000000000000000) == 0) {
    uint64_t v43 = v42 & 0xFFFFFFFFFFFFLL;
  }
  if (v43) {
    swift_bridgeObjectRetain();
  }
  char v76 = v38 & 1;
  uint64_t v44 = sub_100024E70();
  uint64_t v46 = v45;
  char v48 = v47 & 1;
  sub_100024DF0();
  uint64_t v49 = sub_100024E60();
  uint64_t v51 = v50;
  char v53 = v52;
  swift_release();
  sub_100006FA0(v44, v46, v48);
  swift_bridgeObjectRelease();
  sub_100024E10();
  uint64_t v54 = sub_100024E40();
  uint64_t v56 = v55;
  char v58 = v57 & 1;
  sub_100006FA0(v49, v51, v53 & 1);
  swift_bridgeObjectRelease();
  id v59 = [v71 secondaryLabelColor];
  sub_100024EE0();
  uint64_t v60 = sub_100024E50();
  uint64_t v62 = v61;
  LOBYTE(v49) = v63;
  uint64_t v77 = v64;
  swift_release();
  sub_100006FA0(v54, v56, v58);
  swift_bridgeObjectRelease();
  *(void *)a2 = v72;
  *(void *)(a2 + 8) = v78;
  *(unsigned char *)(a2 + 16) = v66 & 1;
  *(void *)(a2 + 24) = v73;
  *(void *)(a2 + 32) = v68;
  *(void *)(a2 + 40) = v67;
  *(unsigned char *)(a2 + 48) = v76;
  *(void *)(a2 + 56) = v69;
  *(void *)(a2 + 64) = v60;
  *(void *)(a2 + 72) = v62;
  *(unsigned char *)(a2 + 80) = v49 & 1;
  *(void *)(a2 + 88) = v77;
  sub_1000070C8(v72, v78, v66 & 1);
  swift_bridgeObjectRetain();
  sub_1000070C8(v68, v67, v76);
  swift_bridgeObjectRetain();
  sub_1000070C8(v60, v62, v49 & 1);
  swift_bridgeObjectRetain();
  sub_100006FA0(v60, v62, v49 & 1);
  swift_bridgeObjectRelease();
  sub_100006FA0(v68, v67, v76);
  swift_bridgeObjectRelease();
  sub_100006FA0(v72, v78, v66 & 1);
  return swift_bridgeObjectRelease();
}

unint64_t sub_10001A9E4()
{
  if (*v0 == 1)
  {
    uint64_t v1 = type metadata accessor for ModelDataViewModel();
    if (!*(void *)&v0[*(int *)(v1 + 52) + 8]
      || (swift_bridgeObjectRetain(),
          char v2 = _s30com_apple_MLKit_MLModelPreview13MLPreviewTypeO8rawValueACSgSS_tcfC_0(),
          v2 == 19))
    {
      sub_10000EE64(*(void **)&v0[*(int *)(v1 + 80)]);
      char v2 = _s30com_apple_MLKit_MLModelPreview13MLPreviewTypeO8rawValueACSgSS_tcfC_0();
      if (v2 == 19) {
        char v2 = 18;
      }
    }
    return sub_1000163E8(v2);
  }
  else
  {
    if (qword_100030A78 != -1) {
      swift_once();
    }
    uint64_t v3 = qword_1000341C0;
    swift_bridgeObjectRetain();
  }
  return v3;
}

uint64_t sub_10001AAD4@<X0>(_OWORD *a1@<X8>)
{
  return sub_100019F60(*(void *)(v1 + 16), a1);
}

uint64_t sub_10001AADC(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10001AB44(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 56);
  uint64_t v3 = *(void *)(a1 + 64);
  char v4 = *(unsigned char *)(a1 + 72);
  uint64_t v5 = *(void *)(a1 + 88);
  uint64_t v6 = *(void *)(a1 + 96);
  char v7 = *(unsigned char *)(a1 + 104);
  sub_1000070C8(*(void *)(a1 + 24), *(void *)(a1 + 32), *(unsigned char *)(a1 + 40));
  swift_bridgeObjectRetain();
  sub_1000070C8(v2, v3, v4);
  swift_bridgeObjectRetain();
  sub_1000070C8(v5, v6, v7);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_10001ABEC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SectionMainView(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10001AC48(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 56);
  uint64_t v3 = *(void *)(a1 + 64);
  char v4 = *(unsigned char *)(a1 + 72);
  uint64_t v5 = *(void *)(a1 + 88);
  uint64_t v6 = *(void *)(a1 + 96);
  char v7 = *(unsigned char *)(a1 + 104);
  sub_100006FA0(*(void *)(a1 + 24), *(void *)(a1 + 32), *(unsigned char *)(a1 + 40));
  swift_bridgeObjectRelease();
  sub_100006FA0(v2, v3, v4);
  swift_bridgeObjectRelease();
  sub_100006FA0(v5, v6, v7);
  swift_bridgeObjectRelease();
  return a1;
}

unint64_t sub_10001ACF0()
{
  unint64_t result = qword_100031350;
  if (!qword_100031350)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100031350);
  }
  return result;
}

unint64_t sub_10001AD48()
{
  unint64_t result = qword_100031358;
  if (!qword_100031358)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_100031340);
    sub_10001ADC4();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100031358);
  }
  return result;
}

unint64_t sub_10001ADC4()
{
  unint64_t result = qword_100031360;
  if (!qword_100031360)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_100031318);
    sub_10000A0FC(&qword_100031368, &qword_100031310);
    sub_10000A0FC(&qword_100031370, &qword_100031378);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100031360);
  }
  return result;
}

uint64_t *sub_10001AE88(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v20 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v20 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_100024C20();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[5];
    uint64_t v9 = a3[6];
    char v10 = (uint64_t *)((char *)a1 + v8);
    char v11 = (uint64_t *)((char *)a2 + v8);
    uint64_t v12 = v11[1];
    *char v10 = *v11;
    v10[1] = v12;
    id v13 = (uint64_t *)((char *)a1 + v9);
    uint64_t v14 = (uint64_t *)((char *)a2 + v9);
    uint64_t v15 = v14[1];
    *id v13 = *v14;
    v13[1] = v15;
    uint64_t v16 = a3[7];
    unint64_t v17 = (uint64_t *)((char *)a1 + v16);
    unint64_t v18 = (uint64_t *)((char *)a2 + v16);
    uint64_t v19 = v18[1];
    *unint64_t v17 = *v18;
    v17[1] = v19;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_10001AF94(uint64_t a1)
{
  uint64_t v2 = sub_100024C20();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_10001B02C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_100024C20();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a3[6];
  uint64_t v9 = (void *)(a1 + v7);
  char v10 = (void *)(a2 + v7);
  uint64_t v11 = v10[1];
  *uint64_t v9 = *v10;
  v9[1] = v11;
  uint64_t v12 = (void *)(a1 + v8);
  id v13 = (void *)(a2 + v8);
  uint64_t v14 = v13[1];
  *uint64_t v12 = *v13;
  v12[1] = v14;
  uint64_t v15 = a3[7];
  uint64_t v16 = (void *)(a1 + v15);
  unint64_t v17 = (void *)(a2 + v15);
  uint64_t v18 = v17[1];
  *uint64_t v16 = *v17;
  v16[1] = v18;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_10001B0E8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_100024C20();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  *uint64_t v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v10 = a3[6];
  uint64_t v11 = (void *)(a1 + v10);
  uint64_t v12 = (void *)(a2 + v10);
  *uint64_t v11 = *v12;
  v11[1] = v12[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v13 = a3[7];
  uint64_t v14 = (void *)(a1 + v13);
  uint64_t v15 = (void *)(a2 + v13);
  *uint64_t v14 = *v15;
  v14[1] = v15[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_10001B1DC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_100024C20();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(_OWORD *)(a1 + a3[5]) = *(_OWORD *)(a2 + a3[5]);
  *(_OWORD *)(a1 + v7) = *(_OWORD *)(a2 + v7);
  *(_OWORD *)(a1 + a3[7]) = *(_OWORD *)(a2 + a3[7]);
  return a1;
}

uint64_t sub_10001B26C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_100024C20();
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
  uint64_t v13 = (void *)(a1 + v12);
  uint64_t v14 = (uint64_t *)(a2 + v12);
  uint64_t v16 = *v14;
  uint64_t v15 = v14[1];
  *uint64_t v13 = v16;
  v13[1] = v15;
  swift_bridgeObjectRelease();
  uint64_t v17 = a3[7];
  uint64_t v18 = (void *)(a1 + v17);
  uint64_t v19 = (uint64_t *)(a2 + v17);
  uint64_t v21 = *v19;
  uint64_t v20 = v19[1];
  *uint64_t v18 = v21;
  v18[1] = v20;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_10001B330(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10001B344);
}

uint64_t sub_10001B344(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100024C20();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20) + 8);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t sub_10001B408(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10001B41C);
}

uint64_t sub_10001B41C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_100024C20();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20) + 8) = (a2 - 1);
  }
  return result;
}

uint64_t type metadata accessor for InputOutput()
{
  uint64_t result = qword_1000313D8;
  if (!qword_1000313D8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10001B528()
{
  uint64_t result = sub_100024C20();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for InputOutputDataViewModel()
{
  return &type metadata for InputOutputDataViewModel;
}

uint64_t sub_10001B5D0@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = type metadata accessor for ModelDataViewModel();
  __chkstk_darwin(v4);
  uint64_t v6 = &v25[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = sub_100024BF0();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v11 = &v25[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v9);
  uint64_t v13 = &v25[-v12];
  uint64_t v14 = *(void (**)(unsigned char *, uint64_t, uint64_t))(v8 + 16);
  v14(&v25[-v12], a1, v7);
  id v15 = objc_allocWithZone((Class)MIOModel);
  id v16 = sub_10001B8C8((uint64_t)v13);
  v14(v11, a1, v7);
  id v17 = v16;
  sub_100011CD4((uint64_t)v11, v17, 0, v6);
  if (!*(void *)&v6[*(int *)(v4 + 52) + 8]
    || (swift_bridgeObjectRetain(),
        char v18 = _s30com_apple_MLKit_MLModelPreview13MLPreviewTypeO8rawValueACSgSS_tcfC_0(),
        v18 == 19))
  {
    sub_10000EE64(*(void **)&v6[*(int *)(v4 + 80)]);
    char v18 = _s30com_apple_MLKit_MLModelPreview13MLPreviewTypeO8rawValueACSgSS_tcfC_0();
    if (v18 == 19) {
      char v18 = 18;
    }
  }
  if (MLPreviewType.rawValue.getter(v18) == 0x6E776F6E6B6E75 && v19 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    goto LABEL_12;
  }
  char v21 = sub_1000251E0();
  swift_bridgeObjectRelease();
  if (v21)
  {
LABEL_12:
    sub_1000162D4();
    uint64_t v22 = swift_allocError();
    *char v23 = 0xD00000000000001DLL;
    v23[1] = 0x80000001000278B0;

    sub_10001BA78((uint64_t)v6);
    *a2 = v22;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1000314C0);
    return swift_storeEnumTagMultiPayload();
  }

  sub_10001BA14((uint64_t)v6, (uint64_t)a2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1000314C0);
  return swift_storeEnumTagMultiPayload();
}

id sub_10001B8C8(uint64_t a1)
{
  uint64_t v2 = v1;
  sub_100024BC0(__stack_chk_guard);
  uint64_t v5 = v4;
  id v14 = 0;
  id v6 = [v2 initWithContentsOfURL:v4 error:&v14];

  id v7 = v14;
  if (v6)
  {
    uint64_t v8 = sub_100024BF0();
    uint64_t v9 = *(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8);
    id v10 = v7;
    v9(a1, v8);
  }
  else
  {
    id v11 = v14;
    sub_100024B70();

    swift_willThrow();
    uint64_t v12 = sub_100024BF0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8))(a1, v12);
  }
  return v6;
}

uint64_t sub_10001BA14(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ModelDataViewModel();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10001BA78(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ModelDataViewModel();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_10001BB64()
{
  v5.receiver = v0;
  v5.super_class = (Class)type metadata accessor for ModelViewController();
  objc_msgSendSuper2(&v5, "viewDidLoad");
  Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v2 = Strong;
    [Strong setHidden:1];

    uint64_t v3 = (void *)swift_unknownObjectWeakLoadStrong();
    if (v3)
    {
      uint64_t v4 = v3;
      [v3 startAnimating];

      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

id sub_10001BC44(uint64_t a1, uint64_t a2, void *a3)
{
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  uint64_t v6 = OBJC_IVAR____TtC30com_apple_MLKit_MLModelPreview19ModelViewController_previewEnvironment;
  type metadata accessor for MLPreviewEnvironment();
  swift_allocObject();
  id v7 = v3;
  *(void *)&v3[v6] = sub_100023350();

  if (a2)
  {
    NSString v8 = sub_100024F90();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v8 = 0;
  }
  v11.receiver = v7;
  v11.super_class = (Class)type metadata accessor for ModelViewController();
  id v9 = objc_msgSendSuper2(&v11, "initWithNibName:bundle:", v8, a3);

  return v9;
}

id sub_10001BDA0(void *a1)
{
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  uint64_t v3 = OBJC_IVAR____TtC30com_apple_MLKit_MLModelPreview19ModelViewController_previewEnvironment;
  type metadata accessor for MLPreviewEnvironment();
  swift_allocObject();
  uint64_t v4 = v1;
  *(void *)&v1[v3] = sub_100023350();

  v7.receiver = v4;
  v7.super_class = (Class)type metadata accessor for ModelViewController();
  id v5 = objc_msgSendSuper2(&v7, "initWithCoder:", a1);

  return v5;
}

id sub_10001BE88()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ModelViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for ModelViewController()
{
  return self;
}

void sub_10001BF3C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v22 = a2;
  uint64_t v23 = a3;
  uint64_t v4 = sub_100024BF0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  __chkstk_darwin(v4);
  objc_super v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = objc_allocWithZone((Class)type metadata accessor for QLModelDocument());
  sub_100024BC0(v9);
  objc_super v11 = v10;
  id v12 = [v8 initWithFileURL:v10];

  uint64_t v13 = swift_allocObject();
  swift_unknownObjectWeakInit();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  unint64_t v14 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  unint64_t v15 = (v6 + v14 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v16 = (v15 + 15) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v17 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v17 + v14, v7, v4);
  *(void *)(v17 + v15) = v13;
  *(void *)(v17 + v16) = v12;
  char v18 = (void *)(v17 + ((v16 + 15) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v19 = v23;
  *char v18 = v22;
  v18[1] = v19;
  aBlock[4] = sub_10001C910;
  aBlock[5] = v17;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10001C5DC;
  aBlock[3] = &block_descriptor;
  uint64_t v20 = _Block_copy(aBlock);
  id v21 = v12;
  swift_retain();
  swift_release();
  [v21 openWithCompletionHandler:v20];
  _Block_release(v20);
}

uint64_t sub_10001C190(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void (*a5)(void))
{
  uint64_t v8 = type metadata accessor for ModelDataViewModel();
  __chkstk_darwin(v8 - 8);
  id v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1000314C0);
  uint64_t v12 = __chkstk_darwin(v11);
  unint64_t v14 = (uint64_t *)((char *)&v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v12);
  unint64_t v16 = (char *)&v23 - v15;
  sub_10001B5D0(a2, (uint64_t *)((char *)&v23 - v15));
  sub_10001C9E0((uint64_t)v16, (uint64_t)v14);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v17 = *v14;
    swift_beginAccess();
    uint64_t Strong = swift_unknownObjectWeakLoadStrong();
    if (Strong)
    {
      uint64_t v19 = (void *)Strong;
      sub_10001C390(a4, v17);
      swift_errorRelease();
    }
    else
    {
      swift_errorRelease();
    }
  }
  else
  {
    sub_10001BA14((uint64_t)v14, (uint64_t)v10);
    swift_beginAccess();
    uint64_t v20 = swift_unknownObjectWeakLoadStrong();
    if (v20)
    {
      id v21 = (void *)v20;
      sub_10001CBC0((uint64_t)v10);
    }
    sub_10001CE44((uint64_t)v10, (uint64_t (*)(void))type metadata accessor for ModelDataViewModel);
  }
  a5(0);
  return sub_10001CA48((uint64_t)v16);
}

void sub_10001C390(void *a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_100024BF0();
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = &v26[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v9 = type metadata accessor for QLModelRootView();
  uint64_t v10 = v9 - 8;
  __chkstk_darwin(v9);
  uint64_t v12 = &v26[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1000314C8);
  uint64_t v14 = v13 - 8;
  __chkstk_darwin(v13);
  unint64_t v16 = &v26[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  id v17 = [a1 fileURL];
  sub_100024BD0();

  id v18 = [objc_allocWithZone((Class)MIOModel) init];
  swift_errorRetain();
  sub_100011CD4((uint64_t)v8, v18, a2, v12);
  uint64_t v19 = &v12[*(int *)(v10 + 28)];
  v26[15] = 0;
  sub_100024EF0();
  uint64_t v20 = v27;
  BOOL *v19 = v26[16];
  *((void *)v19 + 1) = v20;
  uint64_t v21 = *(void *)(v3 + OBJC_IVAR____TtC30com_apple_MLKit_MLModelPreview19ModelViewController_previewEnvironment);
  type metadata accessor for MLPreviewEnvironment();
  sub_10001CD84();
  uint64_t v22 = sub_100024C50();
  sub_10001CDDC((uint64_t)v12, (uint64_t)v16, (uint64_t (*)(void))type metadata accessor for QLModelRootView);
  uint64_t v23 = (uint64_t *)&v16[*(int *)(v14 + 44)];
  *uint64_t v23 = v22;
  v23[1] = v21;
  swift_retain();
  sub_10001CE44((uint64_t)v12, (uint64_t (*)(void))type metadata accessor for QLModelRootView);
  id v24 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_1000314D8));
  uint64_t v25 = (void *)sub_100024D50();
  sub_10001CAA8(v25);
}

uint64_t sub_10001C5DC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);
  return swift_release();
}

void sub_10001C764(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v3 = sub_100024B60();
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = (id)v3;
  (*(void (**)(uint64_t))(a2 + 16))(a2);
}

uint64_t sub_10001C7C8()
{
  _Block_release(*(const void **)(v0 + 16));
  return _swift_deallocObject(v0, 24, 7);
}

void sub_10001C800(uint64_t a1)
{
  sub_10001C764(a1, *(void *)(v1 + 16));
}

uint64_t sub_10001C808()
{
  swift_unknownObjectWeakDestroy();
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10001C840()
{
  uint64_t v1 = sub_100024BF0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();

  swift_release();
  return _swift_deallocObject(v0, ((v6 + 15) & 0xFFFFFFFFFFFFFFF8) + 16, v5);
}

uint64_t sub_10001C910(uint64_t a1)
{
  uint64_t v3 = *(void *)(sub_100024BF0() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  unint64_t v5 = (*(void *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v6 = (v5 + 15) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v7 = *(void *)(v1 + v5);
  uint64_t v8 = *(void **)(v1 + v6);
  uint64_t v9 = *(void (**)(void))(v1 + ((v6 + 15) & 0xFFFFFFFFFFFFFFF8));
  return sub_10001C190(a1, v1 + v4, v7, v8, v9);
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t sub_10001C9E0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1000314C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10001CA48(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1000314C0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

id sub_10001CAA8(void *a1)
{
  uint64_t v2 = v1;
  [a1 loadViewIfNeeded];
  id result = [a1 view];
  if (!result)
  {
    __break(1u);
    goto LABEL_9;
  }
  unint64_t v5 = result;
  [result layoutIfNeeded];

  [v2 addChildViewController:a1];
  id result = [v2 view];
  if (!result)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  unint64_t v6 = result;
  id result = [a1 view];
  if (!result)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  uint64_t v7 = result;
  sub_100010FA4(result);

  id result = (id)swift_unknownObjectWeakLoadStrong();
  if (!result)
  {
LABEL_11:
    __break(1u);
    return result;
  }
  uint64_t v8 = result;
  [result stopAnimating];

  return [a1 didMoveToParentViewController:v2];
}

void sub_10001CBC0(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for QLModelRootView();
  uint64_t v5 = v4 - 8;
  __chkstk_darwin(v4);
  uint64_t v7 = &v19[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1000314C8);
  uint64_t v9 = v8 - 8;
  __chkstk_darwin(v8);
  uint64_t v11 = &v19[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_10001CDDC(a1, (uint64_t)v7, (uint64_t (*)(void))type metadata accessor for ModelDataViewModel);
  uint64_t v12 = &v7[*(int *)(v5 + 28)];
  v19[15] = 0;
  sub_100024EF0();
  uint64_t v13 = v20;
  *uint64_t v12 = v19[16];
  *((void *)v12 + 1) = v13;
  uint64_t v14 = *(void *)(v2 + OBJC_IVAR____TtC30com_apple_MLKit_MLModelPreview19ModelViewController_previewEnvironment);
  type metadata accessor for MLPreviewEnvironment();
  sub_10001CD84();
  uint64_t v15 = sub_100024C50();
  sub_10001CDDC((uint64_t)v7, (uint64_t)v11, (uint64_t (*)(void))type metadata accessor for QLModelRootView);
  unint64_t v16 = (uint64_t *)&v11[*(int *)(v9 + 44)];
  *unint64_t v16 = v15;
  v16[1] = v14;
  swift_retain();
  sub_10001CE44((uint64_t)v7, (uint64_t (*)(void))type metadata accessor for QLModelRootView);
  id v17 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_1000314D8));
  id v18 = (void *)sub_100024D50();
  sub_10001CAA8(v18);
}

unint64_t sub_10001CD84()
{
  unint64_t result = qword_1000314D0;
  if (!qword_1000314D0)
  {
    type metadata accessor for MLPreviewEnvironment();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000314D0);
  }
  return result;
}

uint64_t sub_10001CDDC(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10001CE44(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

id sub_10001D130()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for QLModelDocument();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for QLModelDocument()
{
  return self;
}

ValueMetadata *type metadata accessor for CardViewModifier()
{
  return &type metadata for CardViewModifier;
}

uint64_t sub_10001D1A8(uint64_t a1)
{
  return _swift_getOpaqueTypeConformance2(a1, &unk_100028218, 1);
}

uint64_t sub_10001D1C4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v34 = a1;
  uint64_t v1 = sub_100024CD0();
  uint64_t v2 = v1 - 8;
  __chkstk_darwin(v1);
  uint64_t v4 = (_OWORD *)((char *)&v33 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_100030EB0);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_100031570);
  uint64_t v9 = v8 - 8;
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v33 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_100031578);
  uint64_t v13 = v12 - 8;
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v33 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100024F30();
  sub_100009028(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v7, 0.0, 1, 0.0, 1);
  id v16 = [self tertiarySystemBackgroundColor];
  uint64_t v17 = sub_100024EE0();
  char v18 = sub_100024D80();
  sub_100005B00((uint64_t)v7, (uint64_t)v11, &qword_100030EB0);
  uint64_t v19 = &v11[*(int *)(v9 + 44)];
  *(void *)uint64_t v19 = v17;
  v19[8] = v18;
  sub_100005B64((uint64_t)v7, &qword_100030EB0);
  sub_100005B00((uint64_t)v11, (uint64_t)v15, &qword_100031570);
  uint64_t v20 = &v15[*(int *)(v13 + 44)];
  v20[32] = 0;
  *(_OWORD *)uint64_t v20 = 0u;
  *((_OWORD *)v20 + 1) = 0u;
  sub_100005B64((uint64_t)v11, &qword_100031570);
  uint64_t v21 = (char *)v4 + *(int *)(v2 + 28);
  uint64_t v22 = enum case for RoundedCornerStyle.continuous(_:);
  uint64_t v23 = sub_100024D20();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v23 - 8) + 104))(v21, v22, v23);
  __asm { FMOV            V0.2D, #8.0 }
  *uint64_t v4 = _Q0;
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_100031580);
  uint64_t v30 = v34;
  uint64_t v31 = v34 + *(int *)(v29 + 36);
  sub_10001D504((uint64_t)v4, v31);
  *(_WORD *)(v31 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_100031588) + 36)) = 256;
  sub_100005B00((uint64_t)v15, v30, &qword_100031578);
  sub_10001D568((uint64_t)v4);
  return sub_100005B64((uint64_t)v15, &qword_100031578);
}

uint64_t sub_10001D4E4()
{
  return sub_100024CC0();
}

uint64_t sub_10001D504(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100024CD0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10001D568(uint64_t a1)
{
  uint64_t v2 = sub_100024CD0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_10001D5C8()
{
  unint64_t result = qword_100031590;
  if (!qword_100031590)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_100031580);
    sub_10001D668();
    sub_10000A0FC(&qword_1000315B8, &qword_100031588);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100031590);
  }
  return result;
}

unint64_t sub_10001D668()
{
  unint64_t result = qword_100031598;
  if (!qword_100031598)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_100031578);
    sub_10001D708();
    sub_10000A0FC(&qword_100031220, &qword_100031228);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100031598);
  }
  return result;
}

unint64_t sub_10001D708()
{
  unint64_t result = qword_1000315A0;
  if (!qword_1000315A0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_100031570);
    sub_10001D7A8();
    sub_10000A0FC(&qword_100031370, &qword_100031378);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000315A0);
  }
  return result;
}

unint64_t sub_10001D7A8()
{
  unint64_t result = qword_1000315A8;
  if (!qword_1000315A8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_100030EB0);
    sub_10000A0FC(&qword_1000315B0, &qword_100030EA8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000315A8);
  }
  return result;
}

void sub_10001D848()
{
  if (qword_100030A40 != -1) {
    swift_once();
  }
  uint64_t v0 = (objc_class *)(id)qword_100030A48;
  v5._countAndFlagsBits = 0x8000000100027B00;
  v6._object = (void *)0x8000000100027AE0;
  v6._countAndFlagsBits = 0xD000000000000013;
  v7.value._countAndFlagsBits = 0;
  v7.value._object = 0;
  v1.super.Class isa = v0;
  v8._countAndFlagsBits = 0xD000000000000013;
  v8._object = (void *)0x8000000100027AE0;
  uint64_t v2 = sub_100024B20(v6, v7, v1, v8, v5);
  uint64_t v4 = v3;

  qword_100034170 = v2;
  *(void *)algn_100034178 = v4;
}

void sub_10001D920()
{
  if (qword_100030A40 != -1) {
    swift_once();
  }
  uint64_t v0 = (objc_class *)(id)qword_100030A48;
  v5._countAndFlagsBits = 0x8000000100027B30;
  v6._countAndFlagsBits = 0x7475706E49;
  v6._object = (void *)0xE500000000000000;
  v7.value._countAndFlagsBits = 0;
  v7.value._object = 0;
  v1.super.Class isa = v0;
  v8._countAndFlagsBits = 0x7475706E49;
  v8._object = (void *)0xE500000000000000;
  uint64_t v2 = sub_100024B20(v6, v7, v1, v8, v5);
  uint64_t v4 = v3;

  qword_100034180 = v2;
  *(void *)algn_100034188 = v4;
}

void sub_10001D9F0()
{
  if (qword_100030A40 != -1) {
    swift_once();
  }
  uint64_t v0 = (objc_class *)(id)qword_100030A48;
  v5._countAndFlagsBits = 0x8000000100027B50;
  v6._countAndFlagsBits = 0x74757074754FLL;
  v6._object = (void *)0xE600000000000000;
  v7.value._countAndFlagsBits = 0;
  v7.value._object = 0;
  v1.super.Class isa = v0;
  v8._countAndFlagsBits = 0x74757074754FLL;
  v8._object = (void *)0xE600000000000000;
  uint64_t v2 = sub_100024B20(v6, v7, v1, v8, v5);
  uint64_t v4 = v3;

  qword_100034190 = v2;
  *(void *)algn_100034198 = v4;
}

void sub_10001DAC0()
{
  if (qword_100030A40 != -1) {
    swift_once();
  }
  uint64_t v0 = (objc_class *)(id)qword_100030A48;
  v5._countAndFlagsBits = 0x8000000100027BB0;
  v6._object = (void *)0x8000000100027B90;
  v6._countAndFlagsBits = 0xD000000000000012;
  v7.value._countAndFlagsBits = 0;
  v7.value._object = 0;
  v1.super.Class isa = v0;
  v8._countAndFlagsBits = 0xD000000000000012;
  v8._object = (void *)0x8000000100027B90;
  uint64_t v2 = sub_100024B20(v6, v7, v1, v8, v5);
  uint64_t v4 = v3;

  qword_1000341A0 = v2;
  *(void *)algn_1000341A8 = v4;
}

void sub_10001DB98()
{
  if (qword_100030A40 != -1) {
    swift_once();
  }
  uint64_t v0 = (objc_class *)(id)qword_100030A48;
  v5._countAndFlagsBits = 0x8000000100027B70;
  v6._countAndFlagsBits = 0x614C207373616C43;
  v6._object = (void *)0xEF402520736C6562;
  v7.value._countAndFlagsBits = 0;
  v7.value._object = 0;
  v1.super.Class isa = v0;
  v8._countAndFlagsBits = 0x614C207373616C43;
  v8._object = (void *)0xEF402520736C6562;
  uint64_t v2 = sub_100024B20(v6, v7, v1, v8, v5);
  uint64_t v4 = v3;

  qword_1000341B0 = v2;
  *(void *)algn_1000341B8 = v4;
}

void sub_10001DC88()
{
  if (qword_100030A40 != -1) {
    swift_once();
  }
  uint64_t v0 = (objc_class *)(id)qword_100030A48;
  v5._countAndFlagsBits = 0x8000000100027AB0;
  v6._object = (void *)0x8000000100027A90;
  v6._countAndFlagsBits = 0xD000000000000012;
  v7.value._countAndFlagsBits = 0;
  v7.value._object = 0;
  v1.super.Class isa = v0;
  v8._countAndFlagsBits = 0xD000000000000012;
  v8._object = (void *)0x8000000100027A90;
  uint64_t v2 = sub_100024B20(v6, v7, v1, v8, v5);
  uint64_t v4 = v3;

  qword_1000341C0 = v2;
  *(void *)algn_1000341C8 = v4;
}

uint64_t *sub_10001DD60(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = type metadata accessor for ModelDataViewModel();
  int v5 = *(_DWORD *)(*(void *)(v4 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v47 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v47 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    Swift::String v6 = (int *)v4;
    *(unsigned char *)a1 = *(unsigned char *)a2;
    uint64_t v7 = *(int *)(v4 + 20);
    Swift::String v8 = (char *)a1 + v7;
    uint64_t v9 = (char *)a2 + v7;
    uint64_t v10 = sub_100024BF0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
    uint64_t v11 = v6[6];
    uint64_t v12 = (uint64_t *)((char *)a1 + v11);
    uint64_t v13 = (uint64_t *)((char *)a2 + v11);
    uint64_t v14 = v13[1];
    *uint64_t v12 = *v13;
    v12[1] = v14;
    uint64_t v15 = v6[7];
    id v16 = (uint64_t *)((char *)a1 + v15);
    uint64_t v17 = (uint64_t *)((char *)a2 + v15);
    uint64_t v56 = v17[1];
    *id v16 = *v17;
    v16[1] = v56;
    uint64_t v18 = v6[8];
    uint64_t v19 = (uint64_t *)((char *)a1 + v18);
    uint64_t v20 = (uint64_t *)((char *)a2 + v18);
    uint64_t v55 = v20[1];
    void *v19 = *v20;
    v19[1] = v55;
    uint64_t v21 = v6[9];
    uint64_t v22 = (uint64_t *)((char *)a1 + v21);
    uint64_t v23 = (uint64_t *)((char *)a2 + v21);
    uint64_t v54 = v23[1];
    *uint64_t v22 = *v23;
    v22[1] = v54;
    uint64_t v24 = v6[10];
    uint64_t v25 = (uint64_t *)((char *)a1 + v24);
    uint64_t v26 = (uint64_t *)((char *)a2 + v24);
    uint64_t v53 = v26[1];
    *uint64_t v25 = *v26;
    v25[1] = v53;
    uint64_t v27 = v6[11];
    char v28 = (uint64_t *)((char *)a1 + v27);
    uint64_t v29 = (uint64_t *)((char *)a2 + v27);
    uint64_t v52 = v29[1];
    *char v28 = *v29;
    v28[1] = v52;
    uint64_t v30 = v6[12];
    uint64_t v31 = (uint64_t *)((char *)a1 + v30);
    uint64_t v32 = (uint64_t *)((char *)a2 + v30);
    uint64_t v51 = v32[1];
    *uint64_t v31 = *v32;
    v31[1] = v51;
    uint64_t v33 = v6[13];
    uint64_t v34 = (uint64_t *)((char *)a1 + v33);
    uint64_t v35 = (uint64_t *)((char *)a2 + v33);
    uint64_t v50 = v35[1];
    void *v34 = *v35;
    v34[1] = v50;
    uint64_t v36 = v6[14];
    char v37 = (uint64_t *)((char *)a1 + v36);
    char v38 = (uint64_t *)((char *)a2 + v36);
    uint64_t v39 = v38[1];
    *char v37 = *v38;
    v37[1] = v39;
    *(uint64_t *)((char *)a1 + v6[15]) = *(uint64_t *)((char *)a2 + v6[15]);
    *(uint64_t *)((char *)a1 + v6[16]) = *(uint64_t *)((char *)a2 + v6[16]);
    *(uint64_t *)((char *)a1 + v6[17]) = *(uint64_t *)((char *)a2 + v6[17]);
    *(uint64_t *)((char *)a1 + v6[18]) = *(uint64_t *)((char *)a2 + v6[18]);
    *(uint64_t *)((char *)a1 + v6[19]) = *(uint64_t *)((char *)a2 + v6[19]);
    uint64_t v40 = v6[20];
    unint64_t v41 = (uint64_t *)((char *)a1 + v40);
    uint64_t v42 = (char *)a2 + v40;
    uint64_t v44 = *(void **)v42;
    uint64_t v43 = *((void *)v42 + 1);
    *unint64_t v41 = v44;
    v41[1] = v43;
    uint64_t v49 = v6[21];
    uint64_t v45 = *(uint64_t *)((char *)a2 + v49);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    id v46 = v44;
    swift_errorRetain();
    *(uint64_t *)((char *)a1 + v49) = v45;
    *(uint64_t *)((char *)a1 + v6[22]) = *(uint64_t *)((char *)a2 + v6[22]);
    *(uint64_t *)((char *)a1 + v6[23]) = *(uint64_t *)((char *)a2 + v6[23]);
    *(uint64_t *)((char *)a1 + v6[24]) = *(uint64_t *)((char *)a2 + v6[24]);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_10001E038(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ModelDataViewModel();
  uint64_t v3 = a1 + *(int *)(v2 + 20);
  uint64_t v4 = sub_100024BF0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_errorRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

unsigned char *sub_10001E1B4(unsigned char *a1, unsigned char *a2)
{
  *a1 = *a2;
  uint64_t v4 = (int *)type metadata accessor for ModelDataViewModel();
  uint64_t v5 = v4[5];
  Swift::String v6 = &a1[v5];
  uint64_t v7 = &a2[v5];
  uint64_t v8 = sub_100024BF0();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v8 - 8) + 16))(v6, v7, v8);
  uint64_t v9 = v4[6];
  uint64_t v10 = &a1[v9];
  uint64_t v11 = &a2[v9];
  uint64_t v12 = v11[1];
  *uint64_t v10 = *v11;
  v10[1] = v12;
  uint64_t v13 = v4[7];
  uint64_t v14 = &a1[v13];
  uint64_t v15 = &a2[v13];
  uint64_t v53 = v15[1];
  *uint64_t v14 = *v15;
  v14[1] = v53;
  uint64_t v16 = v4[8];
  uint64_t v17 = &a1[v16];
  uint64_t v18 = &a2[v16];
  uint64_t v52 = v18[1];
  *uint64_t v17 = *v18;
  v17[1] = v52;
  uint64_t v19 = v4[9];
  uint64_t v20 = &a1[v19];
  uint64_t v21 = &a2[v19];
  uint64_t v51 = v21[1];
  *uint64_t v20 = *v21;
  v20[1] = v51;
  uint64_t v22 = v4[10];
  uint64_t v23 = &a1[v22];
  uint64_t v24 = &a2[v22];
  uint64_t v50 = v24[1];
  *uint64_t v23 = *v24;
  v23[1] = v50;
  uint64_t v25 = v4[11];
  uint64_t v26 = &a1[v25];
  uint64_t v27 = &a2[v25];
  uint64_t v49 = v27[1];
  void *v26 = *v27;
  v26[1] = v49;
  uint64_t v28 = v4[12];
  uint64_t v29 = &a1[v28];
  uint64_t v30 = &a2[v28];
  uint64_t v48 = v30[1];
  *uint64_t v29 = *v30;
  v29[1] = v48;
  uint64_t v31 = v4[13];
  uint64_t v32 = &a1[v31];
  uint64_t v33 = &a2[v31];
  uint64_t v47 = v33[1];
  *uint64_t v32 = *v33;
  v32[1] = v47;
  uint64_t v34 = v4[14];
  uint64_t v35 = &a1[v34];
  uint64_t v36 = &a2[v34];
  uint64_t v37 = v36[1];
  *uint64_t v35 = *v36;
  v35[1] = v37;
  *(void *)&a1[v4[15]] = *(void *)&a2[v4[15]];
  *(void *)&a1[v4[16]] = *(void *)&a2[v4[16]];
  *(void *)&a1[v4[17]] = *(void *)&a2[v4[17]];
  *(void *)&a1[v4[18]] = *(void *)&a2[v4[18]];
  *(void *)&a1[v4[19]] = *(void *)&a2[v4[19]];
  uint64_t v38 = v4[20];
  uint64_t v39 = &a1[v38];
  uint64_t v40 = &a2[v38];
  uint64_t v42 = *(void **)v40;
  uint64_t v41 = *((void *)v40 + 1);
  *uint64_t v39 = v42;
  v39[1] = v41;
  uint64_t v46 = v4[21];
  uint64_t v43 = *(void *)&a2[v46];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v44 = v42;
  swift_errorRetain();
  *(void *)&a1[v46] = v43;
  *(void *)&a1[v4[22]] = *(void *)&a2[v4[22]];
  *(void *)&a1[v4[23]] = *(void *)&a2[v4[23]];
  *(void *)&a1[v4[24]] = *(void *)&a2[v4[24]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

unsigned char *sub_10001E43C(unsigned char *a1, unsigned char *a2)
{
  *a1 = *a2;
  uint64_t v4 = (int *)type metadata accessor for ModelDataViewModel();
  uint64_t v5 = v4[5];
  Swift::String v6 = &a1[v5];
  uint64_t v7 = &a2[v5];
  uint64_t v8 = sub_100024BF0();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v8 - 8) + 24))(v6, v7, v8);
  uint64_t v9 = v4[6];
  uint64_t v10 = &a1[v9];
  uint64_t v11 = &a2[v9];
  *uint64_t v10 = *v11;
  v10[1] = v11[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v12 = v4[7];
  uint64_t v13 = &a1[v12];
  uint64_t v14 = &a2[v12];
  *uint64_t v13 = *v14;
  v13[1] = v14[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v15 = v4[8];
  uint64_t v16 = &a1[v15];
  uint64_t v17 = &a2[v15];
  *uint64_t v16 = *v17;
  v16[1] = v17[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v18 = v4[9];
  uint64_t v19 = &a1[v18];
  uint64_t v20 = &a2[v18];
  void *v19 = *v20;
  v19[1] = v20[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v21 = v4[10];
  uint64_t v22 = &a1[v21];
  uint64_t v23 = &a2[v21];
  *uint64_t v22 = *v23;
  v22[1] = v23[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v24 = v4[11];
  uint64_t v25 = &a1[v24];
  uint64_t v26 = &a2[v24];
  *uint64_t v25 = *v26;
  v25[1] = v26[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v27 = v4[12];
  uint64_t v28 = &a1[v27];
  uint64_t v29 = &a2[v27];
  *uint64_t v28 = *v29;
  v28[1] = v29[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v30 = v4[13];
  uint64_t v31 = &a1[v30];
  uint64_t v32 = &a2[v30];
  *uint64_t v31 = *v32;
  v31[1] = v32[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v33 = v4[14];
  uint64_t v34 = &a1[v33];
  uint64_t v35 = &a2[v33];
  void *v34 = *v35;
  v34[1] = v35[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)&a1[v4[15]] = *(void *)&a2[v4[15]];
  *(void *)&a1[v4[16]] = *(void *)&a2[v4[16]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)&a1[v4[17]] = *(void *)&a2[v4[17]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)&a1[v4[18]] = *(void *)&a2[v4[18]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)&a1[v4[19]] = *(void *)&a2[v4[19]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v36 = v4[20];
  uint64_t v37 = &a1[v36];
  uint64_t v38 = &a2[v36];
  uint64_t v39 = *(void **)&a2[v36];
  uint64_t v40 = *(void **)v37;
  *(void *)uint64_t v37 = v39;
  id v41 = v39;

  *((void *)v37 + 1) = *((void *)v38 + 1);
  uint64_t v42 = v4[21];
  uint64_t v43 = *(void *)&a2[v42];
  swift_errorRetain();
  *(void *)&a1[v42] = v43;
  swift_errorRelease();
  *(void *)&a1[v4[22]] = *(void *)&a2[v4[22]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)&a1[v4[23]] = *(void *)&a2[v4[23]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)&a1[v4[24]] = *(void *)&a2[v4[24]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

unsigned char *sub_10001E774(unsigned char *a1, unsigned char *a2)
{
  *a1 = *a2;
  uint64_t v4 = (int *)type metadata accessor for ModelDataViewModel();
  uint64_t v5 = v4[5];
  Swift::String v6 = &a1[v5];
  uint64_t v7 = &a2[v5];
  uint64_t v8 = sub_100024BF0();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v8 - 8) + 32))(v6, v7, v8);
  *(_OWORD *)&a1[v4[6]] = *(_OWORD *)&a2[v4[6]];
  *(_OWORD *)&a1[v4[7]] = *(_OWORD *)&a2[v4[7]];
  *(_OWORD *)&a1[v4[8]] = *(_OWORD *)&a2[v4[8]];
  *(_OWORD *)&a1[v4[9]] = *(_OWORD *)&a2[v4[9]];
  *(_OWORD *)&a1[v4[10]] = *(_OWORD *)&a2[v4[10]];
  *(_OWORD *)&a1[v4[11]] = *(_OWORD *)&a2[v4[11]];
  *(_OWORD *)&a1[v4[12]] = *(_OWORD *)&a2[v4[12]];
  *(_OWORD *)&a1[v4[13]] = *(_OWORD *)&a2[v4[13]];
  *(_OWORD *)&a1[v4[14]] = *(_OWORD *)&a2[v4[14]];
  *(void *)&a1[v4[15]] = *(void *)&a2[v4[15]];
  *(void *)&a1[v4[16]] = *(void *)&a2[v4[16]];
  *(void *)&a1[v4[17]] = *(void *)&a2[v4[17]];
  *(void *)&a1[v4[18]] = *(void *)&a2[v4[18]];
  *(void *)&a1[v4[19]] = *(void *)&a2[v4[19]];
  *(_OWORD *)&a1[v4[20]] = *(_OWORD *)&a2[v4[20]];
  *(void *)&a1[v4[21]] = *(void *)&a2[v4[21]];
  *(void *)&a1[v4[22]] = *(void *)&a2[v4[22]];
  *(void *)&a1[v4[23]] = *(void *)&a2[v4[23]];
  *(void *)&a1[v4[24]] = *(void *)&a2[v4[24]];
  return a1;
}

unsigned char *sub_10001E8EC(unsigned char *a1, unsigned char *a2)
{
  *a1 = *a2;
  uint64_t v4 = (int *)type metadata accessor for ModelDataViewModel();
  uint64_t v5 = v4[5];
  Swift::String v6 = &a1[v5];
  uint64_t v7 = &a2[v5];
  uint64_t v8 = sub_100024BF0();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v8 - 8) + 40))(v6, v7, v8);
  uint64_t v9 = v4[6];
  uint64_t v10 = &a1[v9];
  uint64_t v11 = (uint64_t *)&a2[v9];
  uint64_t v13 = *v11;
  uint64_t v12 = v11[1];
  *uint64_t v10 = v13;
  v10[1] = v12;
  swift_bridgeObjectRelease();
  uint64_t v14 = v4[7];
  uint64_t v15 = &a1[v14];
  uint64_t v16 = (uint64_t *)&a2[v14];
  uint64_t v18 = *v16;
  uint64_t v17 = v16[1];
  *uint64_t v15 = v18;
  v15[1] = v17;
  swift_bridgeObjectRelease();
  uint64_t v19 = v4[8];
  uint64_t v20 = &a1[v19];
  uint64_t v21 = (uint64_t *)&a2[v19];
  uint64_t v23 = *v21;
  uint64_t v22 = v21[1];
  *uint64_t v20 = v23;
  v20[1] = v22;
  swift_bridgeObjectRelease();
  uint64_t v24 = v4[9];
  uint64_t v25 = &a1[v24];
  uint64_t v26 = (uint64_t *)&a2[v24];
  uint64_t v28 = *v26;
  uint64_t v27 = v26[1];
  *uint64_t v25 = v28;
  v25[1] = v27;
  swift_bridgeObjectRelease();
  uint64_t v29 = v4[10];
  uint64_t v30 = &a1[v29];
  uint64_t v31 = (uint64_t *)&a2[v29];
  uint64_t v33 = *v31;
  uint64_t v32 = v31[1];
  *uint64_t v30 = v33;
  v30[1] = v32;
  swift_bridgeObjectRelease();
  uint64_t v34 = v4[11];
  uint64_t v35 = &a1[v34];
  uint64_t v36 = (uint64_t *)&a2[v34];
  uint64_t v38 = *v36;
  uint64_t v37 = v36[1];
  *uint64_t v35 = v38;
  v35[1] = v37;
  swift_bridgeObjectRelease();
  uint64_t v39 = v4[12];
  uint64_t v40 = &a1[v39];
  id v41 = (uint64_t *)&a2[v39];
  uint64_t v43 = *v41;
  uint64_t v42 = v41[1];
  *uint64_t v40 = v43;
  v40[1] = v42;
  swift_bridgeObjectRelease();
  uint64_t v44 = v4[13];
  uint64_t v45 = &a1[v44];
  uint64_t v46 = (uint64_t *)&a2[v44];
  uint64_t v48 = *v46;
  uint64_t v47 = v46[1];
  *uint64_t v45 = v48;
  v45[1] = v47;
  swift_bridgeObjectRelease();
  uint64_t v49 = v4[14];
  uint64_t v50 = &a1[v49];
  uint64_t v51 = (uint64_t *)&a2[v49];
  uint64_t v53 = *v51;
  uint64_t v52 = v51[1];
  *uint64_t v50 = v53;
  v50[1] = v52;
  swift_bridgeObjectRelease();
  *(void *)&a1[v4[15]] = *(void *)&a2[v4[15]];
  *(void *)&a1[v4[16]] = *(void *)&a2[v4[16]];
  swift_bridgeObjectRelease();
  *(void *)&a1[v4[17]] = *(void *)&a2[v4[17]];
  swift_bridgeObjectRelease();
  *(void *)&a1[v4[18]] = *(void *)&a2[v4[18]];
  swift_bridgeObjectRelease();
  *(void *)&a1[v4[19]] = *(void *)&a2[v4[19]];
  swift_bridgeObjectRelease();
  uint64_t v54 = v4[20];
  uint64_t v55 = &a1[v54];
  uint64_t v56 = &a2[v54];
  char v57 = *(void **)&a1[v54];
  *(void *)&a1[v54] = *(void *)&a2[v54];

  *((void *)v55 + 1) = *((void *)v56 + 1);
  *(void *)&a1[v4[21]] = *(void *)&a2[v4[21]];
  swift_errorRelease();
  *(void *)&a1[v4[22]] = *(void *)&a2[v4[22]];
  swift_bridgeObjectRelease();
  *(void *)&a1[v4[23]] = *(void *)&a2[v4[23]];
  swift_bridgeObjectRelease();
  *(void *)&a1[v4[24]] = *(void *)&a2[v4[24]];
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_10001EB4C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10001EB60);
}

uint64_t sub_10001EB60(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ModelDataViewModel();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);
  return v5(a1, a2, v4);
}

uint64_t sub_10001EBCC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10001EBE0);
}

uint64_t sub_10001EBE0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ModelDataViewModel();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  return v5(a1, a2, a2, v4);
}

uint64_t type metadata accessor for SectionMainView(uint64_t a1)
{
  return sub_10002049C(a1, qword_100031690);
}

uint64_t sub_10001EC70()
{
  uint64_t result = type metadata accessor for ModelDataViewModel();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_10001ECFC(uint64_t a1)
{
  return _swift_getOpaqueTypeConformance2(a1, &unk_100028298, 1);
}

uint64_t sub_10001ED18(char a1, char a2)
{
  unint64_t v3 = 0xD000000000000012;
  unint64_t v4 = 0x8000000100027450;
  switch(a1)
  {
    case 1:
      unint64_t v4 = 0xE500000000000000;
      unint64_t v3 = 0x7475706E69;
      break;
    case 2:
      unint64_t v4 = 0xE600000000000000;
      unint64_t v3 = 0x74757074756FLL;
      break;
    case 3:
      unint64_t v3 = 0x62614C7373616C63;
      unint64_t v4 = 0xEB00000000736C65;
      break;
    case 4:
      unint64_t v4 = 0x8000000100027480;
      unint64_t v3 = 0xD000000000000011;
      break;
    default:
      break;
  }
  unint64_t v5 = 0xD000000000000012;
  unint64_t v6 = 0x8000000100027450;
  switch(a2)
  {
    case 1:
      unint64_t v6 = 0xE500000000000000;
      if (v3 == 0x7475706E69) {
        goto LABEL_13;
      }
      goto LABEL_16;
    case 2:
      unint64_t v6 = 0xE600000000000000;
      if (v3 != 0x74757074756FLL) {
        goto LABEL_16;
      }
      goto LABEL_13;
    case 3:
      unint64_t v5 = 0x62614C7373616C63;
      unint64_t v6 = 0xEB00000000736C65;
      goto LABEL_12;
    case 4:
      unint64_t v6 = 0x8000000100027480;
      if (v3 != 0xD000000000000011) {
        goto LABEL_16;
      }
      goto LABEL_13;
    default:
LABEL_12:
      if (v3 != v5) {
        goto LABEL_16;
      }
LABEL_13:
      if (v4 == v6) {
        char v7 = 1;
      }
      else {
LABEL_16:
      }
        char v7 = sub_1000251E0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

Swift::Int sub_10001EEEC()
{
  return sub_1000252A0();
}

uint64_t sub_10001EFF0()
{
  sub_100024FE0();
  return swift_bridgeObjectRelease();
}

Swift::Int sub_10001F0E0()
{
  return sub_1000252A0();
}

uint64_t sub_10001F1E0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for SectionMainView(0);
  uint64_t v43 = *(void *)(v3 - 8);
  uint64_t v4 = *(void *)(v43 + 64);
  __chkstk_darwin(v3 - 8);
  uint64_t v44 = (uint64_t)&v36 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1000316C8);
  uint64_t v6 = __chkstk_darwin(v5 - 8);
  uint64_t v8 = (char *)&v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v36 - v9;
  sub_1000128CC((uint64_t)v56);
  int v52 = v56[0];
  uint64_t v11 = v58;
  uint64_t v12 = v60;
  uint64_t v50 = v59;
  uint64_t v51 = v57;
  uint64_t v13 = v62;
  uint64_t v49 = v61;
  uint64_t v14 = v64;
  uint64_t v48 = v63;
  uint64_t v15 = v66;
  uint64_t v47 = v65;
  uint64_t v46 = v67;
  uint64_t v54 = v68;
  uint64_t v45 = v69;
  uint64_t v53 = v70;
  if (*v1 == 1)
  {
    uint64_t v38 = v66;
    uint64_t v39 = v64;
    uint64_t v40 = v62;
    uint64_t v41 = v60;
    uint64_t v42 = v58;
    uint64_t v37 = *(void *)(*(void *)&v1[*(int *)(type metadata accessor for ModelDataViewModel() + 72)] + 16);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1000316E0);
    uint64_t v16 = type metadata accessor for SectionMetadata(0);
    uint64_t v17 = *(void *)(*(void *)(v16 - 8) + 72);
    unint64_t v18 = (*(unsigned __int8 *)(*(void *)(v16 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v16 - 8) + 80);
    uint64_t v19 = swift_allocObject();
    *(_OWORD *)(v19 + 16) = xmmword_100026EA0;
    uint64_t v20 = v19 + v18;
    if (qword_100030A80 != -1) {
      swift_once();
    }
    uint64_t v21 = __swift_project_value_buffer(v16, (uint64_t)qword_1000315C0);
    sub_100020944(v21, v20, type metadata accessor for SectionMetadata);
    if (qword_100030A88 != -1) {
      swift_once();
    }
    uint64_t v22 = __swift_project_value_buffer(v16, (uint64_t)qword_1000315D8);
    sub_100020944(v22, v20 + v17, type metadata accessor for SectionMetadata);
    if (qword_100030A90 != -1) {
      swift_once();
    }
    uint64_t v23 = __swift_project_value_buffer(v16, (uint64_t)qword_1000315F0);
    sub_100020944(v23, v20 + 2 * v17, type metadata accessor for SectionMetadata);
    if (qword_100030AA0 != -1) {
      swift_once();
    }
    uint64_t v24 = __swift_project_value_buffer(v16, (uint64_t)qword_100031620);
    sub_100020944(v24, v20 + 3 * v17, type metadata accessor for SectionMetadata);
    uint64_t v25 = v20 + 4 * v17;
    if (qword_100030A98 != -1) {
      swift_once();
    }
    uint64_t v26 = __swift_project_value_buffer(v16, (uint64_t)qword_100031608);
    sub_100020944(v26, v25, type metadata accessor for SectionMetadata);
    uint64_t v55 = v19;
    uint64_t v27 = v44;
    sub_100020944((uint64_t)v1, v44, type metadata accessor for SectionMainView);
    unint64_t v28 = (*(unsigned __int8 *)(v43 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v43 + 80);
    uint64_t v29 = swift_allocObject();
    *(void *)(v29 + 16) = v37;
    sub_100020B9C(v27, v29 + v28);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1000316E8);
    sub_100024C20();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1000316F0);
    sub_10000A0FC(&qword_1000316F8, &qword_1000316E8);
    sub_10000A0FC(&qword_100031700, &qword_1000316F0);
    sub_100021B18(&qword_100031708, (void (*)(uint64_t))type metadata accessor for SectionMetadata);
    sub_100024F20();
    uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_1000316D0);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v30 - 8) + 56))(v10, 0, 1, v30);
    uint64_t v11 = v42;
    uint64_t v12 = v41;
    uint64_t v13 = v40;
    uint64_t v14 = v39;
    uint64_t v15 = v38;
  }
  else
  {
    uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_1000316D0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v31 - 8) + 56))(v10, 1, 1, v31);
  }
  sub_1000203B4((uint64_t)v10, (uint64_t)v8);
  *(unsigned char *)a1 = v52;
  *(void *)(a1 + 8) = v51;
  *(void *)(a1 + 16) = v11;
  *(void *)(a1 + 24) = v50;
  *(void *)(a1 + 32) = v12;
  *(void *)(a1 + 40) = v49;
  *(void *)(a1 + 48) = v13;
  *(void *)(a1 + 56) = v48;
  *(void *)(a1 + 64) = v14;
  *(void *)(a1 + 72) = v47;
  *(void *)(a1 + 80) = v15;
  uint64_t v33 = v53;
  uint64_t v32 = v54;
  *(void *)(a1 + 88) = v46;
  *(void *)(a1 + 96) = v32;
  *(void *)(a1 + 104) = v45;
  *(void *)(a1 + 112) = v33;
  uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_1000316D8);
  sub_1000203B4((uint64_t)v8, a1 + *(int *)(v34 + 48));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_10002041C((uint64_t)v10);
  sub_10002041C((uint64_t)v8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_10001F954@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v64 = a3;
  uint64_t v5 = a1;
  uint64_t v56 = a1;
  uint64_t v60 = a4;
  uint64_t v6 = type metadata accessor for SectionMainView(0);
  uint64_t v63 = *(void *)(v6 - 8);
  uint64_t v62 = *(void *)(v63 + 64);
  __chkstk_darwin(v6 - 8);
  uint64_t v61 = (uint64_t)&v56 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_100031710);
  uint64_t v68 = *(void *)(v8 - 8);
  uint64_t v69 = v8;
  uint64_t v9 = __chkstk_darwin(v8);
  uint64_t v67 = (char *)&v56 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v65 = (char *)&v56 - v12;
  __chkstk_darwin(v11);
  uint64_t v70 = (char *)&v56 - v13;
  uint64_t v66 = sub_100024D30();
  uint64_t v14 = type metadata accessor for SectionMetadata(0);
  uint64_t v71 = sub_10001FEE8(a2, *(unsigned char *)(v5 + *(int *)(v14 + 20)));
  uint64_t v72 = v15;
  sub_1000071E8();
  uint64_t v16 = sub_100024E70();
  uint64_t v18 = v17;
  char v20 = v19 & 1;
  sub_100024E20();
  sub_100024E00();
  swift_release();
  uint64_t v21 = sub_100024E60();
  uint64_t v23 = v22;
  LOBYTE(v5) = v24;
  swift_release();
  sub_100006FA0(v16, v18, v20);
  swift_bridgeObjectRelease();
  id v25 = [self labelColor];
  sub_100024EE0();
  uint64_t v26 = sub_100024E50();
  uint64_t v58 = v27;
  uint64_t v59 = v28;
  LOBYTE(v16) = v29;
  swift_release();
  char v30 = v16 & 1;
  sub_100006FA0(v21, v23, v5 & 1);
  swift_bridgeObjectRelease();
  int v57 = sub_100024D90();
  sub_100024C90();
  uint64_t v32 = v31;
  uint64_t v34 = v33;
  uint64_t v36 = v35;
  uint64_t v38 = v37;
  uint64_t v39 = _swiftEmptyArrayStorage;
  if (*(void *)(v56 + *(int *)(v14 + 24))) {
    uint64_t v39 = *(void **)(v56 + *(int *)(v14 + 24));
  }
  uint64_t v71 = (uint64_t)v39;
  uint64_t v40 = v61;
  sub_100020944(v64, v61, type metadata accessor for SectionMainView);
  unint64_t v41 = (*(unsigned __int8 *)(v63 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v63 + 80);
  uint64_t v42 = swift_allocObject();
  sub_100020B9C(v40, v42 + v41);
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1000316E8);
  sub_100024C20();
  __swift_instantiateConcreteTypeFromMangledName(&qword_100031718);
  sub_10000A0FC(&qword_1000316F8, &qword_1000316E8);
  sub_100021050(&qword_100031720, &qword_100031718, (void (*)(void))sub_100020EF4, (void (*)(void))sub_10002112C);
  sub_100021B18(&qword_100031708, (void (*)(uint64_t))type metadata accessor for SectionMetadata);
  uint64_t v43 = v65;
  sub_100024F20();
  uint64_t v44 = v68;
  uint64_t v45 = v69;
  uint64_t v46 = v70;
  (*(void (**)(char *, char *, uint64_t))(v68 + 32))(v70, v43, v69);
  uint64_t v47 = v44;
  uint64_t v48 = *(void (**)(char *, char *, uint64_t))(v44 + 16);
  uint64_t v49 = v67;
  v48(v67, v46, v45);
  uint64_t v50 = v59;
  uint64_t v51 = v60;
  *uint64_t v60 = v66;
  v51[1] = 0;
  *((unsigned char *)v51 + 16) = 1;
  uint64_t v52 = v58;
  v51[3] = v26;
  v51[4] = v52;
  *((unsigned char *)v51 + 40) = v30;
  v51[6] = v50;
  *((unsigned char *)v51 + 56) = v57;
  v51[8] = v32;
  v51[9] = v34;
  v51[10] = v36;
  v51[11] = v38;
  *((unsigned char *)v51 + 96) = 0;
  uint64_t v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_100031778);
  v48((char *)v51 + *(int *)(v53 + 48), v49, v45);
  sub_1000070C8(v26, v52, v30);
  uint64_t v54 = *(void (**)(char *, uint64_t))(v47 + 8);
  swift_bridgeObjectRetain();
  v54(v70, v45);
  v54(v49, v45);
  sub_100006FA0(v26, v52, v30);
  return swift_bridgeObjectRelease();
}

uint64_t sub_10001FEE8(uint64_t a1, char a2)
{
  switch(a2)
  {
    case 1:
      if (qword_100030A58 != -1) {
        swift_once();
      }
      uint64_t v2 = &qword_100034180;
      goto LABEL_16;
    case 2:
      if (qword_100030A60 != -1) {
        swift_once();
      }
      uint64_t v2 = &qword_100034190;
      goto LABEL_16;
    case 3:
      if (a1 < 1)
      {
        uint64_t v3 = 0;
        unint64_t v4 = 0xE000000000000000;
      }
      else
      {
        v8._countAndFlagsBits = sub_1000251D0();
        sub_100024FF0(v8);
        swift_bridgeObjectRelease();
        uint64_t v3 = 547520738;
        unint64_t v4 = 0xA400000000000000;
      }
      if (qword_100030A70 != -1) {
        swift_once();
      }
      __swift_instantiateConcreteTypeFromMangledName(&qword_100031780);
      uint64_t v6 = swift_allocObject();
      *(_OWORD *)(v6 + 16) = xmmword_1000260E0;
      *(void *)(v6 + 56) = &type metadata for String;
      *(void *)(v6 + 64) = sub_100021180();
      *(void *)(v6 + 32) = v3;
      *(void *)(v6 + 40) = v4;
      return sub_100024FD0();
    case 4:
      if (qword_100030A68 != -1) {
        swift_once();
      }
      uint64_t v2 = &qword_1000341A0;
      goto LABEL_16;
    default:
      if (qword_100030A50 != -1) {
        swift_once();
      }
      uint64_t v2 = &qword_100034170;
LABEL_16:
      uint64_t v5 = *v2;
      swift_bridgeObjectRetain();
      return v5;
  }
}

uint64_t sub_100020144@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  switch(*(unsigned char *)(a1 + *(int *)(type metadata accessor for SectionMetadata(0) + 20)))
  {
    case 1:
      sub_100013750();
      goto LABEL_4;
    case 2:
      sub_100013A10();
      sub_100020FC0();
      sub_1000210D8();
      sub_100024D60();
      goto LABEL_8;
    case 3:
      sub_100012E48();
      goto LABEL_9;
    case 4:
      sub_1000131BC();
      sub_100020FC0();
      sub_1000210D8();
      sub_100024D60();
      goto LABEL_8;
    default:
      sub_100012B40();
LABEL_4:
      sub_100020F6C();
      sub_100020FC0();
      sub_100024D60();
LABEL_8:
      __swift_instantiateConcreteTypeFromMangledName(&qword_100031740);
      __swift_instantiateConcreteTypeFromMangledName(&qword_100031760);
      sub_100020F30();
      sub_100021014();
      sub_100024D60();
LABEL_9:
      __swift_instantiateConcreteTypeFromMangledName(&qword_100031730);
      sub_100020EF4();
      sub_10002112C();
      uint64_t result = sub_100024D60();
      *(void *)a2 = v4;
      *(_WORD *)(a2 + 8) = v5;
      *(unsigned char *)(a2 + 10) = v6;
      return result;
  }
}

uint64_t sub_1000203B4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1000316C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10002041C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1000316C8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for SectionMetadata(uint64_t a1)
{
  return sub_10002049C(a1, qword_1000317E8);
}

uint64_t sub_10002049C(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unint64_t sub_1000204D4(char a1)
{
  unint64_t result = 0xD000000000000012;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x7475706E69;
      break;
    case 2:
      unint64_t result = 0x74757074756FLL;
      break;
    case 3:
      unint64_t result = 0x62614C7373616C63;
      break;
    case 4:
      unint64_t result = 0xD000000000000011;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_100020590(char *a1, char *a2)
{
  return sub_10001ED18(*a1, *a2);
}

Swift::Int sub_10002059C()
{
  return sub_10001EEEC();
}

uint64_t sub_1000205A4()
{
  return sub_10001EFF0();
}

Swift::Int sub_1000205AC()
{
  return sub_10001F0E0();
}

uint64_t sub_1000205B4@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_1000220D0(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

unint64_t sub_1000205E4@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_1000204D4(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_100020610(uint64_t a1)
{
  return sub_100020814(a1, qword_1000315C0, 0);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

Swift::Int sub_100020658()
{
  sub_100025270();
  sub_100024C20();
  sub_100021B18((unint64_t *)&qword_100030D18, (void (*)(uint64_t))&type metadata accessor for UUID);
  sub_100024F70();
  uint64_t v1 = type metadata accessor for SectionMetadata(0);
  sub_100024FE0();
  swift_bridgeObjectRelease();
  uint64_t v2 = *(void *)(v0 + *(int *)(v1 + 24));
  if (v2)
  {
    sub_100025290(1u);
    swift_bridgeObjectRetain();
    sub_100021BA8((uint64_t)v4, v2);
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_100025290(0);
  }
  return sub_1000252A0();
}

uint64_t sub_100020804(uint64_t a1)
{
  return sub_100020814(a1, qword_1000315D8, 1);
}

uint64_t sub_100020814(uint64_t a1, uint64_t *a2, char a3)
{
  uint64_t v5 = type metadata accessor for SectionMetadata(0);
  __swift_allocate_value_buffer(v5, a2);
  uint64_t v6 = __swift_project_value_buffer(v5, (uint64_t)a2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1000316E0);
  uint64_t v7 = *(void *)(v5 - 8);
  v5 -= 8;
  unint64_t v8 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_1000260E0;
  unint64_t v10 = v9 + v8;
  sub_100024C10();
  *(unsigned char *)(v10 + *(int *)(v5 + 28)) = a3;
  *(void *)(v10 + *(int *)(v5 + 32)) = 0;
  uint64_t result = sub_100024C10();
  *(unsigned char *)(v6 + *(int *)(v5 + 28)) = a3;
  *(void *)(v6 + *(int *)(v5 + 32)) = v9;
  return result;
}

uint64_t sub_100020914(uint64_t a1)
{
  return sub_100020814(a1, qword_1000315F0, 2);
}

uint64_t sub_100020924(uint64_t a1)
{
  return sub_100020814(a1, qword_100031608, 3);
}

uint64_t sub_100020934(uint64_t a1)
{
  return sub_100020814(a1, qword_100031620, 4);
}

uint64_t sub_100020944(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1000209AC()
{
  uint64_t v1 = *(void *)(type metadata accessor for SectionMainView(0) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 24) & ~v2;
  uint64_t v4 = v3 + *(void *)(v1 + 64);
  uint64_t v5 = v2 | 7;
  uint64_t v6 = v0 + v3;
  uint64_t v7 = type metadata accessor for ModelDataViewModel();
  uint64_t v8 = v6 + *(int *)(v7 + 20);
  uint64_t v9 = sub_100024BF0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_errorRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return _swift_deallocObject(v0, v4, v5);
}

uint64_t sub_100020B9C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SectionMainView(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100020C00@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = *(void *)(type metadata accessor for SectionMainView(0) - 8);
  uint64_t v6 = *(void *)(v2 + 16);
  uint64_t v7 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
  return sub_10001F954(a1, v6, v7, a2);
}

uint64_t sub_100020C84()
{
  uint64_t v1 = *(void *)(type metadata accessor for SectionMainView(0) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v3 + *(void *)(v1 + 64);
  uint64_t v5 = v2 | 7;
  uint64_t v6 = v0 + v3;
  uint64_t v7 = type metadata accessor for ModelDataViewModel();
  uint64_t v8 = v6 + *(int *)(v7 + 20);
  uint64_t v9 = sub_100024BF0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_errorRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return _swift_deallocObject(v0, v4, v5);
}

uint64_t sub_100020E74@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  type metadata accessor for SectionMainView(0);
  return sub_100020144(a1, a2);
}

uint64_t sub_100020EF4()
{
  return sub_100021050(&qword_100031728, &qword_100031730, (void (*)(void))sub_100020F30, (void (*)(void))sub_100021014);
}

uint64_t sub_100020F30()
{
  return sub_100021050(&qword_100031738, &qword_100031740, (void (*)(void))sub_100020F6C, (void (*)(void))sub_100020FC0);
}

unint64_t sub_100020F6C()
{
  unint64_t result = qword_100031748;
  if (!qword_100031748)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100031748);
  }
  return result;
}

unint64_t sub_100020FC0()
{
  unint64_t result = qword_100031750;
  if (!qword_100031750)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100031750);
  }
  return result;
}

uint64_t sub_100021014()
{
  return sub_100021050(&qword_100031758, &qword_100031760, (void (*)(void))sub_100020FC0, (void (*)(void))sub_1000210D8);
}

uint64_t sub_100021050(unint64_t *a1, uint64_t *a2, void (*a3)(void), void (*a4)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    a3();
    a4();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1000210D8()
{
  unint64_t result = qword_100031768;
  if (!qword_100031768)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100031768);
  }
  return result;
}

unint64_t sub_10002112C()
{
  unint64_t result = qword_100031770;
  if (!qword_100031770)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100031770);
  }
  return result;
}

unint64_t sub_100021180()
{
  unint64_t result = qword_100031788;
  if (!qword_100031788)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100031788);
  }
  return result;
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

void *sub_100021238(void *a1, void *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    a1 = (void *)(v9 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_100024C20();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 24);
    *((unsigned char *)a1 + *(int *)(a3 + 20)) = *((unsigned char *)a2 + *(int *)(a3 + 20));
    *(void *)((char *)a1 + v8) = *(void *)((char *)a2 + v8);
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_100021310(uint64_t a1)
{
  uint64_t v2 = sub_100024C20();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return swift_bridgeObjectRelease();
}

uint64_t sub_100021384(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100024C20();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 24);
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_10002140C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100024C20();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  *(void *)(a1 + *(int *)(a3 + 24)) = *(void *)(a2 + *(int *)(a3 + 24));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1000214A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100024C20();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 24);
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  return a1;
}

uint64_t sub_100021528(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100024C20();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 24);
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1000215B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000215C8);
}

uint64_t sub_1000215C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100024C20();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 24));
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    int v11 = v10 - 1;
    if (v11 < 0) {
      int v11 = -1;
    }
    return (v11 + 1);
  }
}

uint64_t sub_100021694(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000216A8);
}

uint64_t sub_1000216A8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_100024C20();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 24)) = a2;
  }
  return result;
}

uint64_t sub_100021764()
{
  uint64_t result = sub_100024C20();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_100021804()
{
  return sub_10000A0FC(&qword_100031828, &qword_100031830);
}

void sub_100021844(uint64_t a1, uint64_t a2)
{
  sub_100024C20();
  sub_100021B18((unint64_t *)&qword_100030D18, (void (*)(uint64_t))&type metadata accessor for UUID);
  sub_100024F70();
  sub_10001EFF0();
  uint64_t v5 = *(void *)(v2 + *(int *)(a2 + 24));
  if (v5)
  {
    sub_100025290(1u);
    swift_bridgeObjectRetain();
    sub_100021BA8(a1, v5);
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_100025290(0);
  }
}

Swift::Int sub_10002192C(uint64_t a1, uint64_t a2)
{
  sub_100025270();
  sub_100024C20();
  sub_100021B18((unint64_t *)&qword_100030D18, (void (*)(uint64_t))&type metadata accessor for UUID);
  sub_100024F70();
  sub_100024FE0();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(v2 + *(int *)(a2 + 24));
  if (v4)
  {
    sub_100025290(1u);
    swift_bridgeObjectRetain();
    sub_100021BA8((uint64_t)v6, v4);
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_100025290(0);
  }
  return sub_1000252A0();
}

uint64_t sub_100021AD0()
{
  return sub_100021B18(&qword_100031838, (void (*)(uint64_t))type metadata accessor for SectionMetadata);
}

uint64_t sub_100021B18(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100021B60()
{
  return sub_100021B18((unint64_t *)&qword_100030D18, (void (*)(uint64_t))&type metadata accessor for UUID);
}

void sub_100021BA8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SectionMetadata(0);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  Swift::UInt v8 = *(void *)(a2 + 16);
  sub_100025280(v8);
  if (v8)
  {
    uint64_t v9 = a2 + ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
    uint64_t v10 = *(void *)(v5 + 72);
    v12[1] = "ta";
    do
    {
      sub_100020944(v9, (uint64_t)v7, type metadata accessor for SectionMetadata);
      sub_100024C20();
      sub_100021B18((unint64_t *)&qword_100030D18, (void (*)(uint64_t))&type metadata accessor for UUID);
      sub_100024F70();
      sub_100024FE0();
      swift_bridgeObjectRelease();
      uint64_t v11 = *(void *)&v7[*(int *)(v4 + 24)];
      if (v11)
      {
        sub_100025290(1u);
        swift_bridgeObjectRetain();
        sub_100021BA8(a1, v11);
        swift_bridgeObjectRelease();
      }
      else
      {
        sub_100025290(0);
      }
      sub_10000F300((uint64_t)v7);
      v9 += v10;
      --v8;
    }
    while (v8);
  }
}

uint64_t sub_100021E3C(uint64_t a1, uint64_t a2)
{
  if (sub_100024C00())
  {
    uint64_t v4 = type metadata accessor for SectionMetadata(0);
    if (sub_10001ED18(*(unsigned char *)(a1 + *(int *)(v4 + 20)), *(unsigned char *)(a2 + *(int *)(v4 + 20))))
    {
      uint64_t v5 = *(int *)(v4 + 24);
      uint64_t v6 = *(void *)(a2 + v5);
      if (*(void *)(a1 + v5))
      {
        if (v6)
        {
          swift_bridgeObjectRetain();
          uint64_t v7 = swift_bridgeObjectRetain();
          char v8 = sub_10000DE14(v7, v6);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (v8) {
            return 1;
          }
        }
      }
      else if (!v6)
      {
        return 1;
      }
    }
  }
  return 0;
}

uint64_t getEnumTagSinglePayload for SectionMetadata.MetadataViewType(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for SectionMetadata.MetadataViewType(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x100022040);
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

ValueMetadata *type metadata accessor for SectionMetadata.MetadataViewType()
{
  return &type metadata for SectionMetadata.MetadataViewType;
}

unint64_t sub_10002207C()
{
  unint64_t result = qword_100031840;
  if (!qword_100031840)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100031840);
  }
  return result;
}

uint64_t sub_1000220D0(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_10002D0F0;
  v6._object = a2;
  unint64_t v4 = sub_1000251B0(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 5) {
    return 5;
  }
  else {
    return v4;
  }
}

ValueMetadata *type metadata accessor for LayerDistributionSectionCardView()
{
  return &type metadata for LayerDistributionSectionCardView;
}

uint64_t sub_10002212C(uint64_t a1)
{
  return _swift_getOpaqueTypeConformance2(a1, &unk_1000282F8, 1);
}

uint64_t sub_100022148@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_100031848);
  __chkstk_darwin(v4 - 8);
  Swift::String v6 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_100030E58);
  uint64_t v8 = v7 - 8;
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_100030E60);
  __chkstk_darwin(v11 - 8);
  uint64_t v13 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)Swift::String v6 = sub_100024D40();
  *((void *)v6 + 1) = 0;
  v6[16] = 0;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_100031850);
  sub_100022380(a1, (uint64_t)&v6[*(int *)(v14 + 44)]);
  LOBYTE(a1) = sub_100024DB0();
  sub_100024C90();
  uint64_t v16 = v15;
  uint64_t v18 = v17;
  uint64_t v20 = v19;
  uint64_t v22 = v21;
  sub_100005B00((uint64_t)v6, (uint64_t)v10, &qword_100031848);
  uint64_t v23 = &v10[*(int *)(v8 + 44)];
  *uint64_t v23 = a1;
  *((void *)v23 + 1) = v16;
  *((void *)v23 + 2) = v18;
  *((void *)v23 + 3) = v20;
  *((void *)v23 + 4) = v22;
  v23[40] = 0;
  sub_100005B64((uint64_t)v6, &qword_100031848);
  uint64_t v24 = sub_100024F40();
  sub_100009214(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v13, 0.0, 1, INFINITY, 0, v24, v25);
  sub_100005B64((uint64_t)v10, &qword_100030E58);
  sub_100005B00((uint64_t)v13, a2, &qword_100030E60);
  return sub_100005B64((uint64_t)v13, &qword_100030E60);
}

uint64_t sub_100022380@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_100031858);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_100031860);
  __chkstk_darwin(v25);
  uint64_t v9 = (char *)v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(void *)(a1 + 16))
  {
    v26[0] = a1;
    *(void *)(swift_allocObject() + 16) = a1;
    swift_bridgeObjectRetain_n();
    __swift_instantiateConcreteTypeFromMangledName(&qword_100031868);
    sub_100024C20();
    sub_10000A0FC(&qword_100031870, &qword_100031868);
    sub_100022B68();
    sub_100022BBC();
    sub_100024F20();
    (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v9, v7, v4);
    swift_storeEnumTagMultiPayload();
    sub_100022C14();
    sub_100024D60();
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  else
  {
    strcpy((char *)v26, "Not available");
    HIWORD(v26[1]) = -4864;
    sub_1000071E8();
    uint64_t v11 = sub_100024E70();
    uint64_t v13 = v12;
    char v15 = v14 & 1;
    sub_100024ED0();
    v24[1] = v4;
    uint64_t v16 = sub_100024E50();
    v24[0] = a2;
    uint64_t v17 = v16;
    uint64_t v19 = v18;
    char v21 = v20;
    uint64_t v23 = v22;
    swift_release();
    sub_100006FA0(v11, v13, v15);
    swift_bridgeObjectRelease();
    *(void *)uint64_t v9 = v17;
    *((void *)v9 + 1) = v19;
    v9[16] = v21 & 1;
    *((void *)v9 + 3) = v23;
    swift_storeEnumTagMultiPayload();
    sub_100022C14();
    return sub_100024D60();
  }
}

uint64_t sub_1000226BC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v55 = a3;
  uint64_t v5 = type metadata accessor for Layer();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v49 = (uint64_t)&v49 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_100031890);
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v49 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_100031898);
  uint64_t v12 = __chkstk_darwin(v11 - 8);
  uint64_t v50 = (uint64_t)&v49 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __chkstk_darwin(v12);
  uint64_t v16 = (char *)&v49 - v15;
  __chkstk_darwin(v14);
  uint64_t v18 = (char *)&v49 - v17;
  uint64_t v19 = *(int *)(v5 + 24);
  char v20 = (uint64_t *)(a1 + *(int *)(v5 + 20));
  uint64_t v21 = v20[1];
  uint64_t v53 = *v20;
  uint64_t v54 = v21;
  uint64_t v56 = *(void *)(a1 + v19);
  swift_bridgeObjectRetain();
  uint64_t v22 = sub_1000251D0();
  uint64_t v51 = v23;
  uint64_t v52 = v22;
  sub_100022C88(a1, (uint64_t)v18);
  uint64_t v24 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56);
  uint64_t v25 = 1;
  v24(v18, 0, 1, v5);
  uint64_t v26 = *(void *)(a2 + 16);
  if (v26)
  {
    sub_100022C88(a2+ ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))+ *(void *)(v6 + 72) * (v26 - 1), (uint64_t)v16);
    uint64_t v25 = 0;
  }
  v24(v16, v25, 1, v5);
  uint64_t v27 = (uint64_t)&v10[*(int *)(v8 + 48)];
  sub_100005B00((uint64_t)v18, (uint64_t)v10, &qword_100031898);
  sub_100005B00((uint64_t)v16, v27, &qword_100031898);
  uint64_t v28 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 48);
  if (v28((uint64_t)v10, 1, v5) == 1)
  {
    sub_100005B64((uint64_t)v16, &qword_100031898);
    sub_100005B64((uint64_t)v18, &qword_100031898);
    int v29 = v28(v27, 1, v5);
    if (v29 == 1) {
      char v30 = &qword_100031898;
    }
    else {
      char v30 = &qword_100031890;
    }
    if (v29 == 1) {
      char v31 = -1;
    }
    else {
      char v31 = 0;
    }
    goto LABEL_12;
  }
  uint64_t v32 = v50;
  sub_100005B00((uint64_t)v10, v50, &qword_100031898);
  if (v28(v27, 1, v5) == 1)
  {
    sub_100005B64((uint64_t)v16, &qword_100031898);
    sub_100005B64((uint64_t)v18, &qword_100031898);
    sub_100022CEC(v32);
    char v31 = 0;
    char v30 = &qword_100031890;
LABEL_12:
    uint64_t v34 = v54;
    uint64_t v33 = v55;
    uint64_t v36 = v52;
    uint64_t v35 = v53;
    uint64_t v37 = v51;
    goto LABEL_22;
  }
  uint64_t v38 = v49;
  sub_100022D48(v27, v49);
  if (sub_100024C00())
  {
    uint64_t v39 = *(int *)(v5 + 20);
    uint64_t v40 = *(void *)(v32 + v39);
    uint64_t v41 = *(void *)(v32 + v39 + 8);
    uint64_t v42 = (void *)(v38 + v39);
    BOOL v43 = v40 == *v42 && v41 == v42[1];
    uint64_t v44 = v38;
    uint64_t v34 = v54;
    uint64_t v33 = v55;
    uint64_t v45 = v32;
    uint64_t v36 = v52;
    uint64_t v35 = v53;
    uint64_t v37 = v51;
    if (v43 || (v46 = v44, v47 = sub_1000251E0(), v44 = v46, v45 = v50, char v31 = 0, (v47 & 1) != 0)) {
      char v31 = *(void *)(v45 + *(int *)(v5 + 24)) == *(void *)(v44 + *(int *)(v5 + 24));
    }
  }
  else
  {
    char v31 = 0;
    uint64_t v44 = v38;
    uint64_t v34 = v54;
    uint64_t v33 = v55;
    uint64_t v36 = v52;
    uint64_t v35 = v53;
    uint64_t v37 = v51;
  }
  sub_100022CEC(v44);
  char v30 = &qword_100031898;
  sub_100005B64((uint64_t)v16, &qword_100031898);
  sub_100005B64((uint64_t)v18, &qword_100031898);
  sub_100022CEC(v50);
LABEL_22:
  uint64_t result = sub_100005B64((uint64_t)v10, v30);
  *(void *)uint64_t v33 = v35;
  *(void *)(v33 + 8) = v34;
  *(void *)(v33 + 16) = v36;
  *(void *)(v33 + 24) = v37;
  *(unsigned char *)(v33 + 32) = (v31 & 1) == 0;
  return result;
}

uint64_t sub_100022B20@<X0>(uint64_t a1@<X8>)
{
  return sub_100022148(*v1, a1);
}

uint64_t sub_100022B28()
{
  swift_bridgeObjectRelease();
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100022B60@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1000226BC(a1, *(void *)(v2 + 16), a2);
}

unint64_t sub_100022B68()
{
  unint64_t result = qword_100031878;
  if (!qword_100031878)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100031878);
  }
  return result;
}

unint64_t sub_100022BBC()
{
  unint64_t result = qword_100031880;
  if (!qword_100031880)
  {
    type metadata accessor for Layer();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100031880);
  }
  return result;
}

unint64_t sub_100022C14()
{
  unint64_t result = qword_100031888;
  if (!qword_100031888)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_100031858);
    sub_100022B68();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100031888);
  }
  return result;
}

uint64_t sub_100022C88(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Layer();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100022CEC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Layer();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100022D48(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Layer();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_100022DB0()
{
  unint64_t result = qword_1000318A0;
  if (!qword_1000318A0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1000318A8);
    sub_100022E2C();
    sub_10000A140();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000318A0);
  }
  return result;
}

unint64_t sub_100022E2C()
{
  unint64_t result = qword_1000318B0;
  if (!qword_1000318B0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_100030E60);
    sub_100022EA8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000318B0);
  }
  return result;
}

unint64_t sub_100022EA8()
{
  unint64_t result = qword_1000318B8;
  if (!qword_1000318B8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_100030E58);
    sub_10000A0FC(&qword_1000318C0, &qword_100031848);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000318B8);
  }
  return result;
}

uint64_t sub_100022F48()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC30com_apple_MLKit_MLModelPreview20MLPreviewEnvironment__screenMode;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_100031A48);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = v0 + OBJC_IVAR____TtC30com_apple_MLKit_MLModelPreview20MLPreviewEnvironment__dismissPreview;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_100031A50);
  uint64_t v5 = *(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
  v5(v0 + OBJC_IVAR____TtC30com_apple_MLKit_MLModelPreview20MLPreviewEnvironment__presentShareSheet, v4);
  uint64_t v6 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v7 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return _swift_deallocClassInstance(v0, v6, v7);
}

uint64_t sub_100023064()
{
  return type metadata accessor for MLPreviewEnvironment();
}

uint64_t type metadata accessor for MLPreviewEnvironment()
{
  uint64_t result = qword_100031908;
  if (!qword_100031908) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_1000230B8()
{
  sub_1000231A0(319, &qword_100031918);
  if (v0 <= 0x3F)
  {
    sub_1000231A0(319, (unint64_t *)&unk_100031920);
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

void sub_1000231A0(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t v3 = sub_100024C80();
    if (!v4) {
      atomic_store(v3, a2);
    }
  }
}

unsigned char *storeEnumTagSinglePayload for MLPreviewEnvironment.PreviewScreenMode(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1000232B4);
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

ValueMetadata *type metadata accessor for MLPreviewEnvironment.PreviewScreenMode()
{
  return &type metadata for MLPreviewEnvironment.PreviewScreenMode;
}

unint64_t sub_1000232F0()
{
  unint64_t result = qword_100031A40;
  if (!qword_100031A40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100031A40);
  }
  return result;
}

void *sub_100023344()
{
  return &protocol witness table for ObservableObjectPublisher;
}

uint64_t sub_100023350()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_100031A50);
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  unsigned int v4 = &v14[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_100031A48);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = &v14[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v9 = v0 + OBJC_IVAR____TtC30com_apple_MLKit_MLModelPreview20MLPreviewEnvironment__screenMode;
  v14[15] = 0;
  sub_100024C70();
  (*(void (**)(uint64_t, unsigned char *, uint64_t))(v6 + 32))(v9, v8, v5);
  uint64_t v10 = v0 + OBJC_IVAR____TtC30com_apple_MLKit_MLModelPreview20MLPreviewEnvironment__dismissPreview;
  v14[14] = 0;
  sub_100024C70();
  uint64_t v11 = *(void (**)(uint64_t, unsigned char *, uint64_t))(v2 + 32);
  v11(v10, v4, v1);
  uint64_t v12 = v0 + OBJC_IVAR____TtC30com_apple_MLKit_MLModelPreview20MLPreviewEnvironment__presentShareSheet;
  v14[13] = 0;
  sub_100024C70();
  v11(v12, v4, v1);
  return v0;
}

uint64_t sub_100023544@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for MLPreviewEnvironment();
  uint64_t result = sub_100024C60();
  *a1 = result;
  return result;
}

ValueMetadata *type metadata accessor for ClassLabelsSectionCardView()
{
  return &type metadata for ClassLabelsSectionCardView;
}

uint64_t sub_100023594(uint64_t a1)
{
  return _swift_getOpaqueTypeConformance2(a1, &unk_100028430, 1);
}

uint64_t sub_1000235B0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_100031A58);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_100030E68);
  uint64_t v8 = v7 - 8;
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_100030E70);
  __chkstk_darwin(v11 - 8);
  uint64_t v13 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v6 = sub_100024D40();
  *((void *)v6 + 1) = 0;
  v6[16] = 0;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_100031A60);
  sub_1000237E8(a1, (uint64_t)&v6[*(int *)(v14 + 44)]);
  LOBYTE(a1) = sub_100024DB0();
  sub_100024C90();
  uint64_t v16 = v15;
  uint64_t v18 = v17;
  uint64_t v20 = v19;
  uint64_t v22 = v21;
  sub_100005B00((uint64_t)v6, (uint64_t)v10, &qword_100031A58);
  uint64_t v23 = &v10[*(int *)(v8 + 44)];
  *uint64_t v23 = a1;
  *((void *)v23 + 1) = v16;
  *((void *)v23 + 2) = v18;
  *((void *)v23 + 3) = v20;
  *((void *)v23 + 4) = v22;
  v23[40] = 0;
  sub_100005B64((uint64_t)v6, &qword_100031A58);
  uint64_t v24 = sub_100024F40();
  sub_100009440(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v13, 0.0, 1, INFINITY, 0, v24, v25);
  sub_100005B64((uint64_t)v10, &qword_100030E68);
  sub_100005B00((uint64_t)v13, a2, &qword_100030E70);
  return sub_100005B64((uint64_t)v13, &qword_100030E70);
}

uint64_t sub_1000237E8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_100031A68);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_100031A70);
  __chkstk_darwin(v25);
  uint64_t v9 = (char *)v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(void *)(a1 + 16))
  {
    v26[0] = a1;
    *(void *)(swift_allocObject() + 16) = a1;
    swift_bridgeObjectRetain_n();
    __swift_instantiateConcreteTypeFromMangledName(&qword_100031A78);
    sub_100024C20();
    sub_10000A0FC(&qword_100031A80, &qword_100031A78);
    sub_100022B68();
    sub_100023F94();
    sub_100024F20();
    (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v9, v7, v4);
    swift_storeEnumTagMultiPayload();
    sub_100023FEC();
    sub_100024D60();
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  else
  {
    strcpy((char *)v26, "Not available");
    HIWORD(v26[1]) = -4864;
    sub_1000071E8();
    uint64_t v11 = sub_100024E70();
    uint64_t v13 = v12;
    char v15 = v14 & 1;
    sub_100024ED0();
    v24[1] = v4;
    uint64_t v16 = sub_100024E50();
    v24[0] = a2;
    uint64_t v17 = v16;
    uint64_t v19 = v18;
    char v21 = v20;
    uint64_t v23 = v22;
    swift_release();
    sub_100006FA0(v11, v13, v15);
    swift_bridgeObjectRelease();
    *(void *)uint64_t v9 = v17;
    *((void *)v9 + 1) = v19;
    v9[16] = v21 & 1;
    *((void *)v9 + 3) = v23;
    swift_storeEnumTagMultiPayload();
    sub_100023FEC();
    return sub_100024D60();
  }
}

uint64_t sub_100023B24@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v46 = a3;
  uint64_t v5 = type metadata accessor for ClassLabel();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v43 = (uint64_t)&v42 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_100031A98);
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v42 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_100031AA0);
  uint64_t v12 = __chkstk_darwin(v11 - 8);
  uint64_t v44 = (uint64_t)&v42 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __chkstk_darwin(v12);
  uint64_t v16 = (char *)&v42 - v15;
  __chkstk_darwin(v14);
  uint64_t v18 = (char *)&v42 - v17;
  uint64_t v19 = (uint64_t *)(a1 + *(int *)(v5 + 20));
  uint64_t v21 = *v19;
  uint64_t v20 = v19[1];
  uint64_t v45 = v21;
  uint64_t v47 = v20;
  sub_100024060(a1, (uint64_t)&v42 - v17);
  uint64_t v22 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56);
  uint64_t v23 = 1;
  v22(v18, 0, 1, v5);
  uint64_t v24 = *(void *)(a2 + 16);
  if (v24)
  {
    sub_100024060(a2+ ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))+ *(void *)(v6 + 72) * (v24 - 1), (uint64_t)v16);
    uint64_t v23 = 0;
  }
  v22(v16, v23, 1, v5);
  uint64_t v25 = (uint64_t)&v10[*(int *)(v8 + 48)];
  sub_100005B00((uint64_t)v18, (uint64_t)v10, &qword_100031AA0);
  sub_100005B00((uint64_t)v16, v25, &qword_100031AA0);
  uint64_t v26 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 48);
  if (v26((uint64_t)v10, 1, v5) == 1)
  {
    uint64_t v27 = v47;
    swift_bridgeObjectRetain();
    sub_100005B64((uint64_t)v16, &qword_100031AA0);
    sub_100005B64((uint64_t)v18, &qword_100031AA0);
    int v28 = v26(v25, 1, v5);
    uint64_t v29 = v27;
    if (v28 == 1) {
      char v30 = &qword_100031AA0;
    }
    else {
      char v30 = &qword_100031A98;
    }
    if (v28 == 1) {
      char v31 = -1;
    }
    else {
      char v31 = 0;
    }
    goto LABEL_12;
  }
  uint64_t v32 = v44;
  sub_100005B00((uint64_t)v10, v44, &qword_100031AA0);
  if (v26(v25, 1, v5) == 1)
  {
    uint64_t v29 = v47;
    swift_bridgeObjectRetain();
    sub_100005B64((uint64_t)v16, &qword_100031AA0);
    sub_100005B64((uint64_t)v18, &qword_100031AA0);
    sub_1000240C4(v32);
    char v31 = 0;
    char v30 = &qword_100031A98;
LABEL_12:
    uint64_t v34 = v45;
    uint64_t v33 = v46;
    goto LABEL_22;
  }
  uint64_t v35 = v43;
  sub_100024120(v25, v43);
  uint64_t v29 = v47;
  swift_bridgeObjectRetain();
  if (sub_100024C00())
  {
    uint64_t v36 = *(int *)(v5 + 20);
    uint64_t v37 = *(void *)(v32 + v36);
    uint64_t v38 = *(void *)(v32 + v36 + 8);
    uint64_t v39 = (void *)(v35 + v36);
    BOOL v40 = v37 == *v39 && v38 == v39[1];
    uint64_t v34 = v45;
    uint64_t v33 = v46;
    if (v40) {
      char v31 = 1;
    }
    else {
      char v31 = sub_1000251E0();
    }
  }
  else
  {
    char v31 = 0;
    uint64_t v34 = v45;
    uint64_t v33 = v46;
  }
  sub_1000240C4(v35);
  char v30 = &qword_100031AA0;
  sub_100005B64((uint64_t)v16, &qword_100031AA0);
  sub_100005B64((uint64_t)v18, &qword_100031AA0);
  sub_1000240C4(v32);
LABEL_22:
  uint64_t result = sub_100005B64((uint64_t)v10, v30);
  *(void *)uint64_t v33 = v34;
  *(void *)(v33 + 8) = v29;
  *(void *)(v33 + 16) = 0;
  *(void *)(v33 + 24) = 0;
  *(unsigned char *)(v33 + 32) = (v31 & 1) == 0;
  return result;
}

uint64_t sub_100023F4C@<X0>(uint64_t a1@<X8>)
{
  return sub_1000235B0(*v1, a1);
}

uint64_t sub_100023F54()
{
  swift_bridgeObjectRelease();
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100023F8C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_100023B24(a1, *(void *)(v2 + 16), a2);
}

unint64_t sub_100023F94()
{
  unint64_t result = qword_100031A88;
  if (!qword_100031A88)
  {
    type metadata accessor for ClassLabel();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100031A88);
  }
  return result;
}

unint64_t sub_100023FEC()
{
  unint64_t result = qword_100031A90;
  if (!qword_100031A90)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_100031A68);
    sub_100022B68();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100031A90);
  }
  return result;
}

uint64_t sub_100024060(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ClassLabel();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000240C4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ClassLabel();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100024120(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ClassLabel();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_100024188()
{
  unint64_t result = qword_100031AA8;
  if (!qword_100031AA8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_100031AB0);
    sub_100024204();
    sub_10000A140();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100031AA8);
  }
  return result;
}

unint64_t sub_100024204()
{
  unint64_t result = qword_100031AB8;
  if (!qword_100031AB8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_100030E70);
    sub_100024280();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100031AB8);
  }
  return result;
}

unint64_t sub_100024280()
{
  unint64_t result = qword_100031AC0;
  if (!qword_100031AC0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_100030E68);
    sub_10000A0FC(&qword_100031AC8, &qword_100031A58);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100031AC0);
  }
  return result;
}

ValueMetadata *type metadata accessor for MultiValueRowView()
{
  return &type metadata for MultiValueRowView;
}

uint64_t sub_100024330(uint64_t a1)
{
  return _swift_getOpaqueTypeConformance2(a1, &unk_100028474, 1);
}

uint64_t sub_10002434C@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v38 = a1;
  uint64_t v41 = a2;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_100030D30);
  uint64_t v3 = __chkstk_darwin(v2 - 8);
  uint64_t v40 = (uint64_t)&v35 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v39 = (char *)&v35 - v5;
  uint64_t v35 = sub_100024D40();
  sub_1000246A8((uint64_t)v43);
  uint64_t v6 = v43[0];
  uint64_t v7 = v43[1];
  char v8 = v43[2];
  uint64_t v9 = v43[3];
  uint64_t v10 = v43[4];
  uint64_t v11 = v43[5];
  char v12 = v43[6];
  int v36 = LOBYTE(v43[2]);
  int v37 = LOBYTE(v43[6]);
  uint64_t v13 = v43[7];
  char v14 = sub_100024DC0();
  sub_100024C90();
  uint64_t v16 = v15;
  uint64_t v18 = v17;
  uint64_t v20 = v19;
  uint64_t v22 = v21;
  char v71 = 0;
  char v70 = v8;
  char v69 = v12;
  char v68 = 0;
  char v23 = sub_100024DD0();
  sub_100024C90();
  char v72 = 0;
  uint64_t v45 = v35;
  uint64_t v46 = 0;
  char v47 = v71;
  uint64_t v48 = v6;
  uint64_t v49 = v7;
  char v50 = v70;
  uint64_t v51 = v9;
  uint64_t v52 = v10;
  uint64_t v53 = v11;
  char v54 = v69;
  uint64_t v55 = v13;
  char v56 = v14;
  uint64_t v57 = v16;
  uint64_t v58 = v18;
  uint64_t v59 = v20;
  uint64_t v60 = v22;
  char v61 = v68;
  char v62 = v23;
  uint64_t v63 = v24;
  uint64_t v64 = v25;
  uint64_t v65 = v26;
  uint64_t v66 = v27;
  char v67 = 0;
  sub_100024F40();
  sub_10000949C(0.0, 1, 0.0, 1, 0.0, 1, 60.0, 0, (uint64_t)v73, 0.0, 1, INFINITY, 0);
  sub_100006FA0(v6, v7, v36);
  swift_bridgeObjectRelease();
  sub_100006FA0(v10, v11, v37);
  swift_bridgeObjectRelease();
  if (*(unsigned char *)(v38 + 32))
  {
    uint64_t v29 = (uint64_t)v39;
    sub_100024F00();
    uint64_t v30 = sub_100024F10();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v30 - 8) + 56))(v29, 0, 1, v30);
  }
  else
  {
    uint64_t v28 = sub_100024F10();
    uint64_t v29 = (uint64_t)v39;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 56))(v39, 1, 1, v28);
  }
  uint64_t v31 = v40;
  sub_100006FF4(v29, v40);
  memcpy(v42, v73, 0x128uLL);
  v42[148] = 256;
  uint64_t v32 = v41;
  memcpy(v41, v42, 0x12AuLL);
  uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_100031AD8);
  sub_100006FF4(v31, (uint64_t)v32 + *(int *)(v33 + 48));
  sub_10000A194((uint64_t)v42);
  sub_10000711C(v29);
  sub_10000711C(v31);
  memcpy(v43, v73, sizeof(v43));
  __int16 v44 = 256;
  return sub_100024A1C((uint64_t)v43);
}

uint64_t sub_1000246A8@<X0>(uint64_t a1@<X8>)
{
  sub_1000071E8();
  swift_bridgeObjectRetain();
  uint64_t v1 = sub_100024E70();
  uint64_t v3 = v2;
  char v5 = v4 & 1;
  sub_100024DF0();
  sub_100024E00();
  swift_release();
  uint64_t v6 = sub_100024E60();
  uint64_t v8 = v7;
  char v10 = v9;
  swift_release();
  sub_100006FA0(v1, v3, v5);
  swift_bridgeObjectRelease();
  id v39 = self;
  id v11 = [v39 labelColor];
  sub_100024EE0();
  uint64_t v12 = sub_100024E50();
  uint64_t v41 = v13;
  uint64_t v42 = v12;
  uint64_t v40 = v14;
  char v16 = v15;
  swift_release();
  sub_100006FA0(v6, v8, v10 & 1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  uint64_t v17 = sub_100024E70();
  uint64_t v19 = v18;
  char v21 = v20 & 1;
  sub_100024DE0();
  uint64_t v22 = sub_100024E60();
  uint64_t v24 = v23;
  LOBYTE(v3) = v25;
  swift_release();
  sub_100006FA0(v17, v19, v21);
  swift_bridgeObjectRelease();
  sub_100024E10();
  uint64_t v26 = sub_100024E40();
  uint64_t v28 = v27;
  char v30 = v29 & 1;
  sub_100006FA0(v22, v24, v3 & 1);
  swift_bridgeObjectRelease();
  id v31 = [v39 labelColor];
  sub_100024EE0();
  uint64_t v32 = sub_100024E50();
  uint64_t v34 = v33;
  LOBYTE(v6) = v35;
  uint64_t v37 = v36;
  swift_release();
  sub_100006FA0(v26, v28, v30);
  swift_bridgeObjectRelease();
  *(void *)a1 = v42;
  *(void *)(a1 + 8) = v40;
  *(unsigned char *)(a1 + 16) = v16 & 1;
  *(void *)(a1 + 24) = v41;
  *(void *)(a1 + 32) = v32;
  *(void *)(a1 + 40) = v34;
  *(unsigned char *)(a1 + 48) = v6 & 1;
  *(void *)(a1 + 56) = v37;
  sub_1000070C8(v42, v40, v16 & 1);
  swift_bridgeObjectRetain();
  sub_1000070C8(v32, v34, v6 & 1);
  swift_bridgeObjectRetain();
  sub_100006FA0(v32, v34, v6 & 1);
  swift_bridgeObjectRelease();
  sub_100006FA0(v42, v40, v16 & 1);
  return swift_bridgeObjectRelease();
}

uint64_t sub_1000249BC@<X0>(uint64_t a1@<X8>)
{
  long long v3 = *(_OWORD *)(v1 + 16);
  v6[0] = *(_OWORD *)v1;
  v6[1] = v3;
  char v7 = *(unsigned char *)(v1 + 32);
  *(void *)a1 = sub_100024D40();
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 0;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_100031AD0);
  return sub_10002434C((uint64_t)v6, (void *)(a1 + *(int *)(v4 + 44)));
}

uint64_t sub_100024A1C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 56);
  uint64_t v3 = *(void *)(a1 + 64);
  char v4 = *(unsigned char *)(a1 + 72);
  sub_100006FA0(*(void *)(a1 + 24), *(void *)(a1 + 32), *(unsigned char *)(a1 + 40));
  swift_bridgeObjectRelease();
  sub_100006FA0(v2, v3, v4);
  swift_bridgeObjectRelease();
  return a1;
}

unint64_t sub_100024A94()
{
  unint64_t result = qword_100031AE0;
  if (!qword_100031AE0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_100031AE8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100031AE0);
  }
  return result;
}

uint64_t sub_100024AF0()
{
  return LocalizedError.helpAnchor.getter();
}

uint64_t sub_100024B00()
{
  return LocalizedError.failureReason.getter();
}

uint64_t sub_100024B10()
{
  return LocalizedError.recoverySuggestion.getter();
}

uint64_t sub_100024B20(Swift::String _, Swift::String_optional tableName, NSBundle bundle, Swift::String value, Swift::String comment)
{
  return NSLocalizedString(_:tableName:bundle:value:comment:)(_, tableName, bundle, value, comment)._countAndFlagsBits;
}

uint64_t sub_100024B30()
{
  return URLResourceValues.allValues.getter();
}

uint64_t sub_100024B40()
{
  return URLResourceValues.isDirectory.getter();
}

uint64_t sub_100024B50()
{
  return type metadata accessor for URLResourceValues();
}

uint64_t sub_100024B60()
{
  return _convertErrorToNSError(_:)();
}

uint64_t sub_100024B70()
{
  return _convertNSErrorToError(_:)();
}

uint64_t sub_100024B80()
{
  return NSFastEnumerationIterator.next()();
}

uint64_t sub_100024B90()
{
  return type metadata accessor for NSFastEnumerationIterator();
}

uint64_t sub_100024BA0()
{
  return URL.resourceValues(forKeys:)();
}

uint64_t sub_100024BB0()
{
  return URL.lastPathComponent.getter();
}

void sub_100024BC0(NSURL *retstr@<X8>)
{
}

uint64_t sub_100024BD0()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100024BE0()
{
  return URL.path.getter();
}

uint64_t sub_100024BF0()
{
  return type metadata accessor for URL();
}

uint64_t sub_100024C00()
{
  return static UUID.== infix(_:_:)();
}

uint64_t sub_100024C10()
{
  return UUID.init()();
}

uint64_t sub_100024C20()
{
  return type metadata accessor for UUID();
}

uint64_t sub_100024C30()
{
  return isFeatureEnabled(_:)();
}

uint64_t sub_100024C40()
{
  return os_log(_:dso:log:_:_:)();
}

uint64_t sub_100024C50()
{
  return static ObservableObject.environmentStore.getter();
}

uint64_t sub_100024C60()
{
  return ObservableObject<>.objectWillChange.getter();
}

uint64_t sub_100024C70()
{
  return Published.init(initialValue:)();
}

uint64_t sub_100024C80()
{
  return type metadata accessor for Published();
}

uint64_t sub_100024C90()
{
  return EdgeInsets.init(_all:)();
}

uint64_t sub_100024CA0()
{
  return static ViewModifier._makeView(modifier:inputs:body:)();
}

uint64_t sub_100024CB0()
{
  return static ViewModifier._makeViewList(modifier:inputs:body:)();
}

uint64_t sub_100024CC0()
{
  return static ViewModifier._viewListCount(inputs:body:)();
}

uint64_t sub_100024CD0()
{
  return type metadata accessor for RoundedRectangle();
}

uint64_t sub_100024CE0()
{
  return SidebarListStyle.init()();
}

uint64_t sub_100024CF0()
{
  return type metadata accessor for SidebarListStyle();
}

uint64_t sub_100024D00()
{
  return _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)();
}

uint64_t sub_100024D10()
{
  return static VerticalAlignment.center.getter();
}

uint64_t sub_100024D20()
{
  return type metadata accessor for RoundedCornerStyle();
}

uint64_t sub_100024D30()
{
  return static HorizontalAlignment.center.getter();
}

uint64_t sub_100024D40()
{
  return static HorizontalAlignment.leading.getter();
}

uint64_t sub_100024D50()
{
  return UIHostingController.init(rootView:)();
}

uint64_t sub_100024D60()
{
  return _ConditionalContent<>.init(storage:)();
}

uint64_t sub_100024D70()
{
  return static Log.runtimeIssuesLog.getter();
}

uint64_t sub_100024D80()
{
  return static Edge.Set.all.getter();
}

uint64_t sub_100024D90()
{
  return static Edge.Set.top.getter();
}

uint64_t sub_100024DA0()
{
  return static Edge.Set.bottom.getter();
}

uint64_t sub_100024DB0()
{
  return static Edge.Set.leading.getter();
}

uint64_t sub_100024DC0()
{
  return static Edge.Set.trailing.getter();
}

uint64_t sub_100024DD0()
{
  return static Edge.Set.vertical.getter();
}

uint64_t sub_100024DE0()
{
  return static Font.subheadline.getter();
}

uint64_t sub_100024DF0()
{
  return static Font.body.getter();
}

uint64_t sub_100024E00()
{
  return Font.bold()();
}

uint64_t sub_100024E10()
{
  return static Font.Weight.regular.getter();
}

uint64_t sub_100024E20()
{
  return static Font.title2.getter();
}

uint64_t sub_100024E30()
{
  return List<>.init(content:)();
}

uint64_t sub_100024E40()
{
  return Text.fontWeight(_:)();
}

uint64_t sub_100024E50()
{
  return Text.foregroundColor(_:)();
}

uint64_t sub_100024E60()
{
  return Text.font(_:)();
}

uint64_t sub_100024E70()
{
  return Text.init<A>(_:)();
}

uint64_t sub_100024E80()
{
  return static View._makeView(view:inputs:)();
}

uint64_t sub_100024E90()
{
  return static View._makeViewList(view:inputs:)();
}

uint64_t sub_100024EA0()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_100024EB0()
{
  return View.listStyle<A>(_:)();
}

uint64_t sub_100024EC0()
{
  return static Color.red.getter();
}

uint64_t sub_100024ED0()
{
  return static Color.secondary.getter();
}

uint64_t sub_100024EE0()
{
  return Color.init(_:)();
}

uint64_t sub_100024EF0()
{
  return State.init(wrappedValue:)();
}

uint64_t sub_100024F00()
{
  return Divider.init()();
}

uint64_t sub_100024F10()
{
  return type metadata accessor for Divider();
}

uint64_t sub_100024F20()
{
  return ForEach<>.init(_:content:)();
}

uint64_t sub_100024F30()
{
  return static Alignment.center.getter();
}

uint64_t sub_100024F40()
{
  return static Alignment.leading.getter();
}

uint64_t sub_100024F50()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100024F60()
{
  return Dictionary.description.getter();
}

uint64_t sub_100024F70()
{
  return dispatch thunk of Hashable.hash(into:)();
}

uint64_t sub_100024F80()
{
  return BidirectionalCollection<>.joined(separator:)();
}

NSString sub_100024F90()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_100024FA0()
{
  return static String._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_100024FB0()
{
  return static String._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_100024FC0()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100024FD0()
{
  return String.init(format:_:)();
}

uint64_t sub_100024FE0()
{
  return String.hash(into:)();
}

void sub_100024FF0(Swift::String a1)
{
}

uint64_t sub_100025000()
{
  return String.init<A>(_:)();
}

uint64_t sub_100025010()
{
  return RawRepresentable<>.encode(to:)();
}

uint64_t sub_100025020()
{
  return RawRepresentable<>.init(from:)();
}

NSArray sub_100025030()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_100025040()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100025050()
{
  return specialized Array._endMutation()();
}

uint64_t sub_100025060()
{
  return static Array._allocateBufferUninitialized(minimumCapacity:)();
}

uint64_t sub_100025070()
{
  return NSEnumerator.makeIterator()();
}

uint64_t sub_100025080()
{
  return NSFileManager.enumerator(at:includingPropertiesForKeys:options:errorHandler:)();
}

uint64_t sub_100025090()
{
  return static os_log_type_t.fault.getter();
}

NSNumber sub_1000250A0(Swift::Int integerLiteral)
{
  return NSNumber.init(integerLiteral:)(integerLiteral);
}

uint64_t sub_1000250B0()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t sub_1000250C0()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t sub_1000250D0()
{
  return static _SetStorage.allocate(capacity:)();
}

void sub_1000250E0(Swift::Int a1)
{
}

void sub_1000250F0(Swift::Int a1)
{
}

uint64_t sub_100025100()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_100025110()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_100025120()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t sub_100025130()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t sub_100025140()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_100025150()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_100025160()
{
  return _CocoaArrayWrapper.subscript.getter();
}

uint64_t sub_100025170()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t sub_100025180()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t sub_100025190()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

Swift::Int sub_1000251B0(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

Swift::Int sub_1000251C0(Swift::Int a1)
{
  return _minimumMergeRunLength(_:)(a1);
}

uint64_t sub_1000251D0()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_1000251E0()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_1000251F0()
{
  return _findStringSwitchCaseWithCache(cases:string:cache:)();
}

uint64_t sub_100025200()
{
  return _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)();
}

uint64_t sub_100025210()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_100025220()
{
  return Error.localizedDescription.getter();
}

uint64_t sub_100025230()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_100025240()
{
  return Error._code.getter();
}

uint64_t sub_100025250()
{
  return Error._domain.getter();
}

uint64_t sub_100025260()
{
  return Error._userInfo.getter();
}

uint64_t sub_100025270()
{
  return Hasher.init(_seed:)();
}

void sub_100025280(Swift::UInt a1)
{
}

void sub_100025290(Swift::UInt8 a1)
{
}

Swift::Int sub_1000252A0()
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

uint64_t swift_bridgeObjectRetain_n()
{
  return _swift_bridgeObjectRetain_n();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastObjCClass()
{
  return _swift_dynamicCastObjCClass();
}

uint64_t swift_dynamicCastObjCClassUnconditional()
{
  return _swift_dynamicCastObjCClassUnconditional();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
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

uint64_t swift_getObjCClassFromMetadata()
{
  return _swift_getObjCClassFromMetadata();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
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

uint64_t swift_storeEnumTagMultiPayload()
{
  return _swift_storeEnumTagMultiPayload();
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

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}