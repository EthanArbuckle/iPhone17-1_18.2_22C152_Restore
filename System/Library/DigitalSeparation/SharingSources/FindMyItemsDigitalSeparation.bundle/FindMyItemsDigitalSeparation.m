uint64_t sub_2954()
{
  void *v0;
  NSString v1;
  unsigned int v2;
  id v3;
  uint64_t v4;

  v1 = [v0 destination];
  if (!v1)
  {
    sub_13250();
    v1 = sub_13220();
    swift_bridgeObjectRelease();
  }
  v2 = [self isStringEmailAddress:v1];

  if (!v2) {
    return 0;
  }
  v3 = [v0 destination];
  v4 = sub_13250();

  return v4;
}

id sub_2A2C(void *a1, uint64_t a2, void (*a3)(void))
{
  id v4 = a1;
  a3();
  uint64_t v6 = v5;

  if (v6)
  {
    NSString v7 = sub_13220();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v7 = 0;
  }

  return v7;
}

uint64_t sub_2AAC()
{
  NSString v1 = [v0 destination];
  if (!v1)
  {
    sub_13250();
    NSString v1 = sub_13220();
    swift_bridgeObjectRelease();
  }
  unsigned __int8 v2 = [self isStringEmailAddress:v1];

  if (v2) {
    return 0;
  }
  id v4 = [v0 destination];
  uint64_t v3 = sub_13250();

  return v3;
}

id sub_2BCC()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DSHandle();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for DSHandle()
{
  return self;
}

void type metadata accessor for DSSourceName(uint64_t a1)
{
}

void type metadata accessor for DSParticipationRole(uint64_t a1)
{
}

void sub_2C4C(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_2C94(uint64_t a1, uint64_t a2)
{
  return sub_2FB8(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_2CAC(uint64_t a1, id *a2)
{
  uint64_t result = sub_13230();
  *a2 = 0;
  return result;
}

uint64_t sub_2D24(uint64_t a1, id *a2)
{
  char v3 = sub_13240();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_2DA4@<X0>(void *a1@<X8>)
{
  sub_13250();
  NSString v2 = sub_13220();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_2DE8@<X0>(void *a1@<X8>)
{
  NSString v2 = sub_13220();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_2E30@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_13250();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_2E5C(uint64_t a1)
{
  uint64_t v2 = sub_2F5C(&qword_1F410);
  uint64_t v3 = sub_2F5C(&qword_1F418);

  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_2EF4()
{
  return sub_2F5C(&qword_1F3F8);
}

uint64_t sub_2F28()
{
  return sub_2F5C(&qword_1F400);
}

uint64_t sub_2F5C(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for DSSourceName(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2FA0(uint64_t a1, uint64_t a2)
{
  return sub_2FB8(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_2FB8(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_13250();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_2FFC()
{
  sub_13250();
  sub_13260();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_3050()
{
  sub_13250();
  sub_13520();
  sub_13260();
  Swift::Int v0 = sub_13530();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_30C4()
{
  uint64_t v0 = sub_13250();
  uint64_t v2 = v1;
  if (v0 == sub_13250() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_134F0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_3150()
{
  return sub_2F5C(&qword_1F408);
}

void sub_3184()
{
  FMISDSSDefaultBeaconOwnerIdentifier._countAndFlagsBits = 0x6F6C4072656E776FLL;
  FMISDSSDefaultBeaconOwnerIdentifier._object = (void *)0xEF74736F686C6163;
}

Swift::String *FMISDSSDefaultBeaconOwnerIdentifier.unsafeMutableAddressor()
{
  if (qword_1F340 != -1) {
    swift_once();
  }
  return &FMISDSSDefaultBeaconOwnerIdentifier;
}

uint64_t sub_3200()
{
  uint64_t v0 = sub_131F0();
  sub_113F0(v0, qword_1F4E0);
  uint64_t v1 = sub_11318(v0, (uint64_t)qword_1F4E0);
  if (qword_1F350 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_11318(v0, (uint64_t)qword_1FBF0);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);

  return v3(v1, v2, v0);
}

id sub_32D8()
{
  uint64_t v1 = (void *)DSSourceNameItemSharing;
  *(void *)&v0[OBJC_IVAR____TtC28FindMyItemsDigitalSeparation34FindMyItemsDigitalSeparationSource_name] = DSSourceNameItemSharing;
  uint64_t v2 = OBJC_IVAR____TtC28FindMyItemsDigitalSeparation34FindMyItemsDigitalSeparationSource_beaconSharingSession;
  id v3 = objc_allocWithZone((Class)SPOwnerInterface);
  uint64_t v4 = v0;
  id v5 = v1;
  id v6 = [v3 init];
  id v7 = [v6 beaconSharingSession];

  *(void *)&v0[v2] = v7;
  uint64_t v8 = OBJC_IVAR____TtC28FindMyItemsDigitalSeparation34FindMyItemsDigitalSeparationSource_ownerSession;
  id v9 = [objc_allocWithZone((Class)SPOwnerInterface) init];
  id v10 = [v9 ownerSession];

  *(void *)&v4[v8] = v10;
  v12.receiver = v4;
  v12.super_class = (Class)type metadata accessor for FindMyItemsDigitalSeparationSource();
  return objc_msgSendSuper2(&v12, "init");
}

uint64_t sub_33FC(uint64_t (*a1)(void *, void), uint64_t a2)
{
  id v3 = v2;
  uint64_t ObjectType = swift_getObjectType();
  sub_DCC4(&qword_1F6F0);
  __chkstk_darwin();
  uint64_t v8 = (char *)&v16[-1] - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_13180();
  v16[3] = v9;
  v16[4] = sub_1145C(&qword_1F6F8, (void (*)(uint64_t))&type metadata accessor for Feature.FindMy);
  id v10 = sub_114A4(v16);
  (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v9 - 8) + 104))(v10, enum case for Feature.FindMy.itemSharing(_:), v9);
  LOBYTE(v9) = sub_13170();
  sub_11508((uint64_t)v16);
  if ((v9 & 1) == 0) {
    return a1(&_swiftEmptyArrayStorage, 0);
  }
  uint64_t v11 = sub_132F0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v8, 1, 1, v11);
  objc_super v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = v3;
  v12[5] = a1;
  v12[6] = a2;
  v12[7] = ObjectType;
  id v13 = v3;
  swift_retain();
  sub_5E88((uint64_t)v8, (uint64_t)&unk_1F708, (uint64_t)v12);
  return swift_release();
}

uint64_t sub_35DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[49] = a5;
  v6[50] = a6;
  v6[48] = a4;
  uint64_t v7 = sub_131C0();
  v6[51] = v7;
  v6[52] = *(void *)(v7 - 8);
  v6[53] = swift_task_alloc();
  v6[54] = swift_task_alloc();
  v6[55] = swift_task_alloc();
  v6[56] = swift_task_alloc();
  v6[57] = swift_task_alloc();
  v6[58] = swift_task_alloc();
  v6[59] = swift_task_alloc();
  v6[60] = swift_task_alloc();
  v6[61] = swift_task_alloc();
  v6[62] = swift_task_alloc();
  sub_DCC4(&qword_1F720);
  v6[63] = swift_task_alloc();
  v6[64] = swift_task_alloc();
  return _swift_task_switch(sub_3750, 0, 0);
}

uint64_t sub_3750()
{
  objc_super v12 = v0;
  v0[44] = &_swiftEmptyArrayStorage;
  if (qword_1F348 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_131F0();
  v0[65] = sub_11318(v1, (uint64_t)qword_1F4E0);
  uint64_t v2 = sub_131D0();
  os_log_type_t v3 = sub_13350();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 136315138;
    v0[47] = sub_C490(0xD000000000000021, 0x8000000000014350, &v11);
    sub_13380();
    _os_log_impl(&dword_0, v2, v3, "%s Attempting to fetch shared resources", v4, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  id v5 = (void *)v0[48];
  uint64_t v6 = swift_allocObject();
  v0[66] = v6;
  *(void *)(v6 + 16) = v5;
  id v7 = v5;
  uint64_t v8 = (void *)swift_task_alloc();
  v0[67] = v8;
  uint64_t v9 = sub_DCC4(&qword_1F738);
  *uint64_t v8 = v0;
  v8[1] = sub_39B8;
  return withTimeout<A>(_:block:)(v0 + 43, 0x40AAD21B3B700000, 3, &unk_1F730, v6, v9);
}

uint64_t sub_39B8()
{
  *(void *)(*(void *)v1 + 544) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_544C;
  }
  else
  {
    swift_release();
    uint64_t v2 = sub_3AD4;
  }
  return _swift_task_switch(v2, 0, 0);
}

void sub_3AD4()
{
  uint64_t v202 = v0;
  v184 = (uint64_t *)(v0 + 56);
  v181 = (void *)(v0 + 176);
  uint64_t v1 = *(void *)(v0 + 344);
  v200 = &_swiftEmptyDictionarySingleton;
  if ((v1 & 0xC000000000000001) != 0)
  {
    sub_133C0();
    sub_11350();
    sub_1145C((unint64_t *)&qword_1F6E8, (void (*)(uint64_t))sub_11350);
    sub_13330();
    uint64_t v1 = *(void *)(v0 + 16);
    uint64_t v189 = *(void *)(v0 + 24);
    uint64_t v2 = *(void *)(v0 + 32);
    uint64_t v3 = *(void *)(v0 + 40);
    unint64_t v4 = *(void *)(v0 + 48);
  }
  else
  {
    uint64_t v3 = 0;
    uint64_t v5 = -1 << *(unsigned char *)(v1 + 32);
    uint64_t v189 = v1 + 56;
    uint64_t v2 = ~v5;
    uint64_t v6 = -v5;
    if (v6 < 64) {
      uint64_t v7 = ~(-1 << v6);
    }
    else {
      uint64_t v7 = -1;
    }
    unint64_t v4 = v7 & *(void *)(v1 + 56);
  }
  uint64_t v8 = (id *)(v0 + 328);
  uint64_t v9 = *(void *)(v0 + 416);
  int64_t v188 = (unint64_t)(v2 + 64) >> 6;
  uint64_t v186 = v9;
  v198 = (void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16);
  id v10 = (void (**)(uint64_t, uint64_t))(v9 + 8);
  v197 = (void (**)(uint64_t, uint64_t))(v9 + 8);
  uint64_t v192 = v1;
  while (v1 < 0)
  {
    uint64_t v17 = sub_133F0();
    if (!v17) {
      goto LABEL_54;
    }
    *(void *)(v0 + 368) = v17;
    sub_11350();
    swift_unknownObjectRetain();
    swift_dynamicCast();
    id v18 = *(id *)(v0 + 360);
    swift_unknownObjectRelease();
    uint64_t v16 = v3;
    uint64_t v14 = v4;
    if (!v18) {
      goto LABEL_54;
    }
LABEL_32:
    unint64_t v195 = v14;
    id v22 = [v18 beaconIdentifier];
    sub_131B0();

    v23 = v200;
    uint64_t v199 = v16;
    if (!v200[2])
    {
      v24 = *v10;
      v25 = &_swiftEmptySetSingleton;
LABEL_37:
      v24(*(void *)(v0 + 496), *(void *)(v0 + 408));
      id v33 = [v18 beaconIdentifier];
      sub_131B0();

      sub_DCC4(&qword_1F748);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_15720;
      *(void *)(inited + 32) = v18;
      v201[0] = (id)inited;
      sub_132A0();
      id v35 = v201[0];
      if ((unint64_t)v201[0] >> 62)
      {
        id v55 = v18;
        swift_bridgeObjectRetain();
        uint64_t v56 = sub_13490();
        swift_bridgeObjectRelease();
        if (!v56)
        {
LABEL_40:
          uint64_t v39 = *(void *)(v0 + 480);
          swift_bridgeObjectRelease();
          int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          v201[0] = v200;
          unint64_t v42 = sub_CAE8(v39);
          uint64_t v43 = v200[2];
          BOOL v44 = (v41 & 1) == 0;
          uint64_t v45 = v43 + v44;
          if (__OFADD__(v43, v44))
          {
            __break(1u);
LABEL_144:
            __break(1u);
LABEL_145:
            __break(1u);
LABEL_146:
            __break(1u);
LABEL_147:
            __break(1u);
            return;
          }
          char v46 = v41;
          if (v200[3] < v45)
          {
            uint64_t v47 = *(void *)(v0 + 480);
            sub_E318(v45, isUniquelyReferenced_nonNull_native);
            v23 = v201[0];
            unint64_t v48 = sub_CAE8(v47);
            if ((v46 & 1) != (v49 & 1))
            {
LABEL_140:
              sub_13510();
              return;
            }
            unint64_t v42 = v48;
            if ((v46 & 1) == 0) {
              goto LABEL_47;
            }
LABEL_8:
            uint64_t v11 = v23[7];
            swift_bridgeObjectRelease();
            *(void *)(v11 + 8 * v42) = v25;
LABEL_9:
            uint64_t v12 = *(void *)(v0 + 480);
            uint64_t v13 = *(void *)(v0 + 408);
            v200 = v23;
            swift_bridgeObjectRelease();
            v24(v12, v13);
            id v10 = v197;

            goto LABEL_10;
          }
          if (isUniquelyReferenced_nonNull_native)
          {
            if (v41) {
              goto LABEL_8;
            }
          }
          else
          {
            sub_ECAC();
            v23 = v201[0];
            if (v46) {
              goto LABEL_8;
            }
          }
LABEL_47:
          uint64_t v50 = *(void *)(v0 + 480);
          uint64_t v51 = *(void *)(v0 + 408);
          v23[(v42 >> 6) + 8] |= 1 << v42;
          (*(void (**)(unint64_t, uint64_t, uint64_t))(v186 + 16))(v23[6] + *(void *)(v186 + 72) * v42, v50, v51);
          *(void *)(v23[7] + 8 * v42) = v25;
          uint64_t v52 = v23[2];
          BOOL v53 = __OFADD__(v52, 1);
          uint64_t v54 = v52 + 1;
          if (v53) {
            goto LABEL_146;
          }
          v23[2] = v54;
          goto LABEL_9;
        }
      }
      else
      {
        uint64_t v36 = *(void *)((char *)&dword_10 + ((unint64_t)v201[0] & 0xFFFFFFFFFFFFFF8));
        id v37 = v18;
        if (!v36) {
          goto LABEL_40;
        }
      }
      sub_10BC0((unint64_t)v35);
      v25 = v38;
      goto LABEL_40;
    }
    sub_CAE8(*(void *)(v0 + 496));
    v24 = *v10;
    v25 = &_swiftEmptySetSingleton;
    if ((v26 & 1) == 0) {
      goto LABEL_37;
    }
    v24(*(void *)(v0 + 496), *(void *)(v0 + 408));
    id v27 = [v18 beaconIdentifier];
    sub_131B0();

    v28 = sub_5A0C(v181);
    uint64_t v30 = *(void *)(v0 + 488);
    uint64_t v31 = *(void *)(v0 + 408);
    if (*v29)
    {
      id v32 = v18;
      sub_CD38(v201, v32);
      ((void (*)(void *, void))v28)(v181, 0);

      v24(v30, v31);
    }
    else
    {
      ((void (*)(void *, void))v28)(v181, 0);

      v24(v30, v31);
    }
LABEL_10:
    uint64_t v3 = v199;
    uint64_t v1 = v192;
    unint64_t v4 = v195;
  }
  if (v4)
  {
    uint64_t v14 = (v4 - 1) & v4;
    unint64_t v15 = __clz(__rbit64(v4)) | (v3 << 6);
    uint64_t v16 = v3;
    goto LABEL_31;
  }
  int64_t v19 = v3 + 1;
  if (__OFADD__(v3, 1)) {
    goto LABEL_147;
  }
  if (v19 < v188)
  {
    unint64_t v20 = *(void *)(v189 + 8 * v19);
    uint64_t v16 = v3 + 1;
    if (!v20)
    {
      uint64_t v16 = v3 + 2;
      if (v3 + 2 >= v188) {
        goto LABEL_54;
      }
      unint64_t v20 = *(void *)(v189 + 8 * v16);
      if (!v20)
      {
        uint64_t v16 = v3 + 3;
        if (v3 + 3 >= v188) {
          goto LABEL_54;
        }
        unint64_t v20 = *(void *)(v189 + 8 * v16);
        if (!v20)
        {
          uint64_t v16 = v3 + 4;
          if (v3 + 4 >= v188) {
            goto LABEL_54;
          }
          unint64_t v20 = *(void *)(v189 + 8 * v16);
          if (!v20)
          {
            uint64_t v21 = v3 + 5;
            do
            {
              if (v188 == v21) {
                goto LABEL_54;
              }
              unint64_t v20 = *(void *)(v189 + 8 * v21++);
            }
            while (!v20);
            uint64_t v16 = v21 - 1;
          }
        }
      }
    }
    uint64_t v14 = (v20 - 1) & v20;
    unint64_t v15 = __clz(__rbit64(v20)) + (v16 << 6);
LABEL_31:
    id v18 = *(id *)(*(void *)(v1 + 48) + 8 * v15);
    if (!v18) {
      goto LABEL_54;
    }
    goto LABEL_32;
  }
LABEL_54:
  uint64_t v57 = *(void *)(v0 + 416);
  sub_11454();
  v179 = (char *)(v200 + 8);
  uint64_t v58 = -1 << *((unsigned char *)v200 + 32);
  if (-v58 < 64) {
    uint64_t v59 = ~(-1 << -(char)v58);
  }
  else {
    uint64_t v59 = -1;
  }
  unint64_t v60 = v59 & v200[8];
  unint64_t v61 = (unint64_t)(63 - v58) >> 6;
  v185 = (void (**)(uint64_t))(v57 + 32);
  unsigned int v183 = enum case for Feature.FindMy.cowardlyCarrot(_:);
  unint64_t v176 = v61 - 1;
  uint64_t v62 = swift_bridgeObjectRetain();
  unint64_t v63 = v60;
  unint64_t v64 = 0;
  uint64_t v182 = v62;
  int64_t v180 = v61;
  uint64_t v177 = v62 + 104;
  unint64_t v178 = v61 - 5;
  v65 = v10;
  while (2)
  {
    if (v63)
    {
      uint64_t v191 = (v63 - 1) & v63;
      unint64_t v66 = __clz(__rbit64(v63)) | (v64 << 6);
      goto LABEL_62;
    }
    int64_t v70 = v64 + 1;
    if (__OFADD__(v64, 1)) {
      goto LABEL_144;
    }
    if (v70 >= v180)
    {
LABEL_71:
      uint64_t v72 = *(void *)(v0 + 504);
      uint64_t v73 = sub_DCC4(&qword_1F740);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v73 - 8) + 56))(v72, 1, 1, v73);
      uint64_t v191 = 0;
      goto LABEL_72;
    }
    unint64_t v71 = *(void *)&v179[8 * v70];
    if (!v71)
    {
      if ((uint64_t)(v64 + 2) >= v180)
      {
        ++v64;
      }
      else
      {
        unint64_t v71 = *(void *)&v179[8 * v64 + 16];
        if (v71)
        {
          int64_t v70 = v64 + 2;
          goto LABEL_66;
        }
        if ((uint64_t)(v64 + 3) >= v180)
        {
          v64 += 2;
        }
        else
        {
          unint64_t v71 = *(void *)&v179[8 * v64 + 24];
          if (v71)
          {
            int64_t v70 = v64 + 3;
            goto LABEL_66;
          }
          int64_t v70 = v64 + 4;
          if ((uint64_t)(v64 + 4) >= v180)
          {
            v64 += 3;
          }
          else
          {
            unint64_t v71 = *(void *)&v179[8 * v70];
            if (v71) {
              goto LABEL_66;
            }
            while (v178 != v64)
            {
              unint64_t v71 = *(void *)(v177 + 8 * v64++);
              if (v71)
              {
                int64_t v70 = v64 + 4;
                goto LABEL_66;
              }
            }
            unint64_t v64 = v176;
          }
        }
      }
      goto LABEL_71;
    }
LABEL_66:
    uint64_t v191 = (v71 - 1) & v71;
    unint64_t v66 = __clz(__rbit64(v71)) + (v70 << 6);
    unint64_t v64 = v70;
LABEL_62:
    uint64_t v67 = *(void *)(v0 + 504);
    (*(void (**)(uint64_t, unint64_t, void))(v186 + 16))(v67, *(void *)(v182 + 48) + *(void *)(v186 + 72) * v66, *(void *)(v0 + 408));
    uint64_t v68 = *(void *)(v182 + 56);
    uint64_t v69 = sub_DCC4(&qword_1F740);
    *(void *)(v67 + *(int *)(v69 + 48)) = *(void *)(v68 + 8 * v66);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v69 - 8) + 56))(v67, 0, 1, v69);
    swift_bridgeObjectRetain();
LABEL_72:
    uint64_t v74 = *(void *)(v0 + 512);
    sub_1199C(*(void *)(v0 + 504), v74);
    uint64_t v75 = sub_DCC4(&qword_1F740);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v75 - 8) + 48))(v74, 1, v75) != 1)
    {
      uint64_t v77 = *(void *)(v0 + 464);
      uint64_t v76 = *(void *)(v0 + 472);
      uint64_t v78 = *(void *)(v0 + 408);
      uint64_t v79 = *(void *)(*(void *)(v0 + 512) + *(int *)(v75 + 48));
      (*v185)(v76);
      v196 = *v198;
      (*v198)(v77, v76, v78);
      swift_bridgeObjectRetain_n();
      v80 = sub_131D0();
      os_log_type_t v81 = sub_13350();
      BOOL v82 = os_log_type_enabled(v80, v81);
      uint64_t v83 = *(void *)(v0 + 464);
      uint64_t v84 = *(void *)(v0 + 408);
      unint64_t v190 = v64;
      if (v82)
      {
        uint64_t v85 = swift_slowAlloc();
        v201[0] = (id)swift_slowAlloc();
        *(_DWORD *)uint64_t v85 = 136315650;
        *(void *)(v85 + 4) = sub_C490(0xD000000000000021, 0x8000000000014350, (uint64_t *)v201);
        *(_WORD *)(v85 + 12) = 2080;
        sub_1145C(&qword_1F698, (void (*)(uint64_t))&type metadata accessor for UUID);
        uint64_t v86 = sub_134E0();
        *(void *)(v85 + 14) = sub_C490(v86, v87, (uint64_t *)v201);
        swift_bridgeObjectRelease();
        v193 = *v197;
        (*v197)(v83, v84);
        *(_WORD *)(v85 + 22) = 2080;
        sub_11350();
        sub_1145C((unint64_t *)&qword_1F6E8, (void (*)(uint64_t))sub_11350);
        swift_bridgeObjectRetain();
        uint64_t v88 = sub_13310();
        unint64_t v90 = v89;
        swift_bridgeObjectRelease();
        *(void *)(v85 + 24) = sub_C490(v88, v90, (uint64_t *)v201);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_0, v80, v81, "%s beacon identifier: %s with shares: %s", (uint8_t *)v85, 0x20u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
        v193 = *v65;
        (*v65)(v83, v84);
        swift_bridgeObjectRelease_n();
      }

      if ((v79 & 0xC000000000000001) != 0)
      {
        uint64_t v91 = (uint64_t)&_swiftEmptySetSingleton;
        v201[0] = &_swiftEmptySetSingleton;
        swift_bridgeObjectRetain();
        sub_133C0();
        uint64_t v92 = sub_133F0();
        if (v92)
        {
          uint64_t v93 = v92;
          sub_11350();
          do
          {
            *(void *)(v0 + 336) = v93;
            swift_dynamicCast();
            id v94 = [*v8 sharee];
            v95 = (char *)[v94 type];

            id v96 = *v8;
            if (v95 == (unsigned char *)&dword_0 + 2)
            {
            }
            else
            {
              if (*(void *)(v91 + 24) <= *(void *)(v91 + 16))
              {
                sub_D2DC();
                uint64_t v91 = (uint64_t)v201[0];
              }
              Swift::Int v97 = sub_13360(*(void *)(v91 + 40));
              uint64_t v98 = v91 + 56;
              uint64_t v99 = -1 << *(unsigned char *)(v91 + 32);
              unint64_t v100 = v97 & ~v99;
              unint64_t v101 = v100 >> 6;
              if (((-1 << v100) & ~*(void *)(v91 + 56 + 8 * (v100 >> 6))) != 0)
              {
                unint64_t v102 = __clz(__rbit64((-1 << v100) & ~*(void *)(v91 + 56 + 8 * (v100 >> 6)))) | v100 & 0x7FFFFFFFFFFFFFC0;
              }
              else
              {
                char v103 = 0;
                unint64_t v104 = (unint64_t)(63 - v99) >> 6;
                do
                {
                  if (++v101 == v104 && (v103 & 1) != 0)
                  {
                    __break(1u);
                    goto LABEL_140;
                  }
                  BOOL v105 = v101 == v104;
                  if (v101 == v104) {
                    unint64_t v101 = 0;
                  }
                  v103 |= v105;
                  uint64_t v106 = *(void *)(v98 + 8 * v101);
                }
                while (v106 == -1);
                unint64_t v102 = __clz(__rbit64(~v106)) + (v101 << 6);
              }
              *(void *)(v98 + ((v102 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v102;
              *(void *)(*(void *)(v91 + 48) + 8 * v102) = v96;
              ++*(void *)(v91 + 16);
            }
            uint64_t v93 = sub_133F0();
          }
          while (v93);
        }
        swift_release();
        unint64_t v107 = v91 & 0xC000000000000001;
        if ((v91 & 0xC000000000000001) != 0)
        {
LABEL_96:
          if (sub_133D0()) {
            goto LABEL_97;
          }
LABEL_102:
          swift_release();
          v65 = v197;
          v113 = (SEL *)&unk_1E000;
          v114 = v193;
          goto LABEL_109;
        }
      }
      else
      {
        uint64_t v112 = swift_bridgeObjectRetain();
        uint64_t v91 = sub_D9FC(v112);
        unint64_t v107 = v91 & 0xC000000000000001;
        if ((v91 & 0xC000000000000001) != 0) {
          goto LABEL_96;
        }
      }
      if (!*(void *)(v91 + 16)) {
        goto LABEL_102;
      }
LABEL_97:
      v196(*(void *)(v0 + 456), *(void *)(v0 + 472), *(void *)(v0 + 408));
      swift_retain();
      v108 = sub_131D0();
      os_log_type_t v109 = sub_13350();
      uint64_t v187 = v79;
      if (os_log_type_enabled(v108, v109))
      {
        uint64_t v110 = swift_slowAlloc();
        v201[0] = (id)swift_slowAlloc();
        *(_DWORD *)uint64_t v110 = 134218499;
        if (v107) {
          uint64_t v111 = sub_133D0();
        }
        else {
          uint64_t v111 = *(void *)(v91 + 16);
        }
        uint64_t v118 = *(void *)(v0 + 456);
        uint64_t v119 = *(void *)(v0 + 408);
        *(void *)(v0 + 304) = v111;
        sub_13380();
        swift_release();
        *(_WORD *)(v110 + 12) = 2160;
        *(void *)(v0 + 312) = 1752392040;
        sub_13380();
        *(_WORD *)(v110 + 22) = 2081;
        sub_1145C(&qword_1F698, (void (*)(uint64_t))&type metadata accessor for UUID);
        uint64_t v120 = sub_134E0();
        *(void *)(v0 + 320) = sub_C490(v120, v121, (uint64_t *)v201);
        sub_13380();
        swift_bridgeObjectRelease();
        uint64_t v122 = v119;
        v117 = v193;
        v193(v118, v122);
        _os_log_impl(&dword_0, v108, v109, "Adding privates shares[%ld] for beacon %{private,mask.hash}s", (uint8_t *)v110, 0x20u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
        uint64_t v115 = *(void *)(v0 + 456);
        uint64_t v116 = *(void *)(v0 + 408);
        swift_release();
        v117 = v193;
        v193(v115, v116);
      }

      uint64_t v123 = *(void *)(v0 + 448);
      uint64_t v124 = *(void *)(v0 + 408);
      v196(v123, *(void *)(v0 + 472), v124);
      v125 = (objc_class *)type metadata accessor for DSBeacon();
      v126 = (char *)objc_allocWithZone(v125);
      v196((uint64_t)&v126[OBJC_IVAR____TtC28FindMyItemsDigitalSeparation8DSBeacon_dsBeaconIdentifier], v123, v124);
      *(void *)&v126[OBJC_IVAR____TtC28FindMyItemsDigitalSeparation8DSBeacon_beaconShares] = v91;
      *(void *)(v0 + 224) = v126;
      *(void *)(v0 + 232) = v125;
      v113 = (SEL *)&unk_1E000;
      objc_msgSendSuper2((objc_super *)(v0 + 224), "init");
      v117(v123, v124);
      sub_13280();
      v114 = v117;
      if (*(void *)((char *)&dword_10 + (*(void *)(v0 + 352) & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18 + (*(void *)(v0 + 352) & 0xFFFFFFFFFFFFFF8)) >> 1) {
        sub_132B0();
      }
      sub_132C0();
      sub_132A0();
      v65 = v197;
      uint64_t v79 = v187;
LABEL_109:
      uint64_t v127 = sub_13180();
      *(void *)(v0 + 80) = v127;
      *(void *)(v0 + 88) = sub_1145C(&qword_1F6F8, (void (*)(uint64_t))&type metadata accessor for Feature.FindMy);
      v128 = sub_114A4(v184);
      (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v127 - 8) + 104))(v128, v183, v127);
      LOBYTE(v127) = sub_13170();
      sub_11508((uint64_t)v184);
      if (v127)
      {
        sub_5B74(v79);
        v130 = v129;
        swift_bridgeObjectRelease();
        uint64_t v131 = *(void *)(v0 + 472);
        uint64_t v132 = *(void *)(v0 + 408);
        if (v130)
        {
          v196(*(void *)(v0 + 432), v131, v132);
          v133 = sub_131D0();
          os_log_type_t v134 = sub_13350();
          BOOL v135 = os_log_type_enabled(v133, v134);
          uint64_t v136 = *(void *)(v0 + 432);
          uint64_t v137 = *(void *)(v0 + 408);
          if (v135)
          {
            uint64_t v138 = swift_slowAlloc();
            v201[0] = (id)swift_slowAlloc();
            *(_DWORD *)uint64_t v138 = 141558275;
            *(void *)(v0 + 288) = 1752392040;
            sub_13380();
            *(_WORD *)(v138 + 12) = 2081;
            sub_1145C(&qword_1F698, (void (*)(uint64_t))&type metadata accessor for UUID);
            uint64_t v139 = sub_134E0();
            *(void *)(v0 + 296) = sub_C490(v139, v140, (uint64_t *)v201);
            sub_13380();
            v113 = (SEL *)&unk_1E000;
            swift_bridgeObjectRelease();
            v193(v136, v137);
            _os_log_impl(&dword_0, v133, v134, "Adding delegated share for beacon %{private,mask.hash}s", (uint8_t *)v138, 0x16u);
            swift_arrayDestroy();
            swift_slowDealloc();
            swift_slowDealloc();
          }
          else
          {
            v193(*(void *)(v0 + 432), *(void *)(v0 + 408));
          }

          v196(*(void *)(v0 + 424), *(void *)(v0 + 472), *(void *)(v0 + 408));
          sub_DCC4(&qword_1F748);
          uint64_t v150 = swift_initStackObject();
          *(_OWORD *)(v150 + 16) = xmmword_15720;
          *(void *)(v150 + 32) = v130;
          v201[0] = (id)v150;
          sub_132A0();
          id v151 = v201[0];
          if ((unint64_t)v201[0] >> 62)
          {
            id v156 = v130;
            swift_bridgeObjectRetain();
            uint64_t v157 = sub_13490();
            swift_bridgeObjectRelease();
            if (!v157) {
              goto LABEL_132;
            }
LABEL_118:
            sub_10BC0((unint64_t)v151);
            v155 = v154;
          }
          else
          {
            uint64_t v152 = *(void *)((char *)&dword_10 + ((unint64_t)v201[0] & 0xFFFFFFFFFFFFFF8));
            id v153 = v130;
            if (v152) {
              goto LABEL_118;
            }
LABEL_132:
            v155 = &_swiftEmptySetSingleton;
          }
          uint64_t v158 = *(void *)(v0 + 424);
          uint64_t v159 = *(void *)(v0 + 408);
          swift_bridgeObjectRelease();
          v160 = (objc_class *)type metadata accessor for DSBeacon();
          v161 = (char *)objc_allocWithZone(v160);
          v196((uint64_t)&v161[OBJC_IVAR____TtC28FindMyItemsDigitalSeparation8DSBeacon_dsBeaconIdentifier], v158, v159);
          *(void *)&v161[OBJC_IVAR____TtC28FindMyItemsDigitalSeparation8DSBeacon_beaconShares] = v155;
          *(void *)(v0 + 240) = v161;
          *(void *)(v0 + 248) = v160;
          id v162 = objc_msgSendSuper2((objc_super *)(v0 + 240), v113[492]);
          v193(v158, v159);
          v163 = (objc_class *)type metadata accessor for DSDelegatedBeaconShare();
          id v164 = objc_allocWithZone(v163);
          id v165 = v130;
          id v166 = v162;
          v167 = (char *)v164;
          id v168 = [v165 sharee];
          v169 = (char *)[v168 type];

          if (v169 != (unsigned char *)&dword_0 + 2) {
            goto LABEL_145;
          }
          *(void *)&v167[OBJC_IVAR____TtC28FindMyItemsDigitalSeparation22DSDelegatedBeaconShare_beaconShare] = v165;
          *(void *)&v167[OBJC_IVAR____TtC28FindMyItemsDigitalSeparation22DSDelegatedBeaconShare_beacon] = v166;
          id v170 = v165;
          id v171 = v166;

          *(void *)(v0 + 208) = v167;
          *(void *)(v0 + 216) = v163;
          objc_msgSendSuper2((objc_super *)(v0 + 208), v113[492]);

          sub_13280();
          if (*(void *)((char *)&dword_10 + (*(void *)(v0 + 352) & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18 + (*(void *)(v0 + 352) & 0xFFFFFFFFFFFFFF8)) >> 1) {
            sub_132B0();
          }
          uint64_t v172 = *(void *)(v0 + 472);
          uint64_t v173 = *(void *)(v0 + 408);
          sub_132C0();
          sub_132A0();

          v65 = v197;
          v193(v172, v173);
        }
        else
        {
          v196(*(void *)(v0 + 440), v131, v132);
          v141 = sub_131D0();
          os_log_type_t v142 = sub_13350();
          BOOL v143 = os_log_type_enabled(v141, v142);
          uint64_t v144 = *(void *)(v0 + 472);
          uint64_t v145 = *(void *)(v0 + 440);
          uint64_t v146 = *(void *)(v0 + 408);
          if (v143)
          {
            v194 = v114;
            uint64_t v147 = swift_slowAlloc();
            v201[0] = (id)swift_slowAlloc();
            *(_DWORD *)uint64_t v147 = 141558275;
            *(void *)(v0 + 264) = 1752392040;
            sub_13380();
            *(_WORD *)(v147 + 12) = 2081;
            sub_1145C(&qword_1F698, (void (*)(uint64_t))&type metadata accessor for UUID);
            uint64_t v148 = sub_134E0();
            *(void *)(v0 + 256) = sub_C490(v148, v149, (uint64_t *)v201);
            sub_13380();
            swift_bridgeObjectRelease();
            v194(v145, v146);
            _os_log_impl(&dword_0, v141, v142, "No delegated share for beacon %{private,mask.hash}s", (uint8_t *)v147, 0x16u);
            swift_arrayDestroy();
            v65 = v197;
            swift_slowDealloc();
            swift_slowDealloc();

            v194(v144, v146);
          }
          else
          {

            v114(v145, v146);
            v114(v144, v146);
          }
        }
      }
      else
      {
        v114(*(void *)(v0 + 472), *(void *)(v0 + 408));
        swift_bridgeObjectRelease();
      }
      unint64_t v64 = v190;
      unint64_t v63 = v191;
      continue;
    }
    break;
  }
  v174 = *(void (**)(void, void))(v0 + 392);
  swift_release();
  v174(*(void *)(v0 + 352), 0);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
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
  v175 = *(void (**)(void))(v0 + 8);
  v175();
}

uint64_t sub_544C()
{
  uint64_t v12 = v0;
  swift_release();
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v1 = sub_131D0();
  os_log_type_t v2 = sub_13340();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = swift_slowAlloc();
    unint64_t v4 = (void *)swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    *(_DWORD *)uint64_t v3 = 136315394;
    v0[35] = sub_C490(0xD000000000000021, 0x8000000000014350, &v11);
    sub_13380();
    *(_WORD *)(v3 + 12) = 2114;
    swift_errorRetain();
    uint64_t v5 = _swift_stdlib_bridgeErrorToNSError();
    v0[34] = v5;
    sub_13380();
    *unint64_t v4 = v5;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl(&dword_0, v1, v2, "%s error %{public}@", (uint8_t *)v3, 0x16u);
    sub_DCC4((uint64_t *)&unk_1F6A0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }

  uint64_t v6 = v0[68];
  uint64_t v7 = (void (*)(uint64_t, uint64_t))v0[49];
  uint64_t v8 = v0[44];
  swift_errorRetain();
  v7(v8, v6);
  swift_errorRelease();
  swift_bridgeObjectRelease();
  swift_errorRelease();
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
  uint64_t v9 = (uint64_t (*)(void))v0[1];
  return v9();
}

uint64_t sub_5738(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 128) = a1;
  *(void *)(v2 + 136) = a2;
  return _swift_task_switch(sub_5758, 0, 0);
}

uint64_t sub_5758()
{
  uint64_t v1 = *(void **)(v0[17]
                + OBJC_IVAR____TtC28FindMyItemsDigitalSeparation34FindMyItemsDigitalSeparationSource_beaconSharingSession);
  v0[2] = v0;
  v0[7] = v0 + 15;
  v0[3] = sub_5860;
  uint64_t v2 = swift_continuation_init();
  v0[10] = _NSConcreteStackBlock;
  v0[11] = 0x40000000;
  v0[12] = sub_5960;
  v0[13] = &unk_18868;
  v0[14] = v2;
  [v1 allSharesWithCompletion:v0 + 10];
  return _swift_continuation_await(v0 + 2);
}

uint64_t sub_5860()
{
  return _swift_task_switch(sub_5940, 0, 0);
}

uint64_t sub_5940()
{
  **(void **)(v0 + 128) = *(void *)(v0 + 120);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_5960(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  sub_11350();
  sub_1145C((unint64_t *)&qword_1F6E8, (void (*)(uint64_t))sub_11350);
  **(void **)(*(void *)(v1 + 64) + 40) = sub_13300();

  return _swift_continuation_resume(v1);
}

void (*sub_5A0C(void *a1))(void *a1)
{
  uint64_t v2 = malloc(0x40uLL);
  *a1 = v2;
  uint64_t v3 = sub_131C0();
  v2[4] = v3;
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = v4;
  v2[5] = v4;
  uint64_t v6 = malloc(*(void *)(v4 + 64));
  v2[6] = v6;
  (*(void (**)(void))(v5 + 16))();
  v2[7] = sub_CB80(v2, (uint64_t)v6);
  return sub_5AFC;
}

void sub_5AFC(void *a1)
{
  uint64_t v1 = (void *)*a1;
  uint64_t v2 = *(void **)(*a1 + 48);
  uint64_t v3 = *(void *)(*a1 + 32);
  uint64_t v4 = *(void *)(*a1 + 40);
  (*(void (**)(void, void))(*a1 + 56))(*a1, 0);
  (*(void (**)(void *, uint64_t))(v4 + 8))(v2, v3);
  free(v2);

  free(v1);
}

void sub_5B74(uint64_t a1)
{
  uint64_t v1 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    sub_133C0();
    sub_11350();
    sub_1145C((unint64_t *)&qword_1F6E8, (void (*)(uint64_t))sub_11350);
    sub_13330();
    uint64_t v1 = v20;
    uint64_t v19 = v21;
    uint64_t v2 = v22;
    uint64_t v3 = v23;
    unint64_t v4 = v24;
  }
  else
  {
    uint64_t v5 = -1 << *(unsigned char *)(a1 + 32);
    uint64_t v19 = a1 + 56;
    uint64_t v6 = ~v5;
    uint64_t v7 = -v5;
    if (v7 < 64) {
      uint64_t v8 = ~(-1 << v7);
    }
    else {
      uint64_t v8 = -1;
    }
    unint64_t v4 = v8 & *(void *)(a1 + 56);
    swift_bridgeObjectRetain();
    uint64_t v2 = v6;
    uint64_t v3 = 0;
  }
  int64_t v18 = (unint64_t)(v2 + 64) >> 6;
  if (v1 < 0) {
    goto LABEL_10;
  }
LABEL_8:
  if (v4)
  {
    uint64_t v9 = (v4 - 1) & v4;
    unint64_t v10 = __clz(__rbit64(v4)) | (v3 << 6);
    uint64_t v11 = v3;
    goto LABEL_29;
  }
  int64_t v13 = v3 + 1;
  if (!__OFADD__(v3, 1))
  {
    if (v13 < v18)
    {
      unint64_t v14 = *(void *)(v19 + 8 * v13);
      uint64_t v11 = v3 + 1;
      if (v14) {
        goto LABEL_28;
      }
      uint64_t v11 = v3 + 2;
      if (v3 + 2 >= v18) {
        goto LABEL_33;
      }
      unint64_t v14 = *(void *)(v19 + 8 * v11);
      if (v14) {
        goto LABEL_28;
      }
      uint64_t v11 = v3 + 3;
      if (v3 + 3 >= v18) {
        goto LABEL_33;
      }
      unint64_t v14 = *(void *)(v19 + 8 * v11);
      if (v14) {
        goto LABEL_28;
      }
      uint64_t v11 = v3 + 4;
      if (v3 + 4 >= v18) {
        goto LABEL_33;
      }
      unint64_t v14 = *(void *)(v19 + 8 * v11);
      if (v14)
      {
LABEL_28:
        uint64_t v9 = (v14 - 1) & v14;
        unint64_t v10 = __clz(__rbit64(v14)) + (v11 << 6);
LABEL_29:
        id v12 = *(id *)(*(void *)(v1 + 48) + 8 * v10);
        if (v12)
        {
          do
          {
            id v16 = [v12 sharee];
            uint64_t v17 = (char *)[v16 type];

            if (v17 == (unsigned char *)&dword_0 + 2) {
              break;
            }

            uint64_t v3 = v11;
            unint64_t v4 = v9;
            if ((v1 & 0x8000000000000000) == 0) {
              goto LABEL_8;
            }
LABEL_10:
            if (!sub_133F0()) {
              break;
            }
            sub_11350();
            swift_unknownObjectRetain();
            swift_dynamicCast();
            id v12 = v25;
            swift_unknownObjectRelease();
            uint64_t v11 = v3;
            uint64_t v9 = v4;
          }
          while (v25);
        }
        goto LABEL_33;
      }
      uint64_t v11 = v3 + 5;
      if (v3 + 5 < v18)
      {
        unint64_t v14 = *(void *)(v19 + 8 * v11);
        if (!v14)
        {
          uint64_t v15 = v3 + 6;
          while (v18 != v15)
          {
            unint64_t v14 = *(void *)(v19 + 8 * v15++);
            if (v14)
            {
              uint64_t v11 = v15 - 1;
              goto LABEL_28;
            }
          }
          goto LABEL_33;
        }
        goto LABEL_28;
      }
    }
LABEL_33:
    sub_11454();
    return;
  }
  __break(1u);
}

uint64_t sub_5E88(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_132F0();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_132E0();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_11674(a1, &qword_1F6F0);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_132D0();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

void sub_60D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_DCC4(&qword_1F838);
  v5.super.isa = sub_13290().super.isa;
  if (a2) {
    uint64_t v6 = sub_13190();
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = (id)v6;
  (*(void (**)(uint64_t, Class))(a3 + 16))(a3, v5.super.isa);
}

uint64_t sub_6170(uint64_t a1)
{
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 32) = v1;
  return _swift_task_switch(sub_6190, 0, 0);
}

uint64_t sub_6190()
{
  unint64_t v14 = v0;
  type metadata accessor for DSBeacon();
  uint64_t v1 = swift_dynamicCastClass();
  if (v1)
  {
    uint64_t v2 = v1;
    swift_unknownObjectRetain();
    uint64_t v3 = (void *)swift_task_alloc();
    v0[5] = v3;
    *uint64_t v3 = v0;
    v3[1] = sub_64A0;
    return sub_8284(v2);
  }
  else
  {
    type metadata accessor for DSDelegatedBeaconShare();
    uint64_t v5 = swift_dynamicCastClass();
    if (v5)
    {
      uint64_t v6 = v5;
      swift_unknownObjectRetain();
      id v7 = (void *)swift_task_alloc();
      v0[7] = v7;
      *id v7 = v0;
      v7[1] = sub_6618;
      return sub_A128(v6);
    }
    else
    {
      if (qword_1F348 != -1) {
        swift_once();
      }
      uint64_t v8 = sub_131F0();
      sub_11318(v8, (uint64_t)qword_1F4E0);
      uint64_t v9 = sub_131D0();
      os_log_type_t v10 = sub_13340();
      if (os_log_type_enabled(v9, v10))
      {
        uint64_t v11 = (uint8_t *)swift_slowAlloc();
        uint64_t v13 = swift_slowAlloc();
        *(_DWORD *)uint64_t v11 = 136315138;
        v0[2] = sub_C490(0x72616853706F7473, 0xEF293A5F28676E69, &v13);
        sub_13380();
        _os_log_impl(&dword_0, v9, v10, "%s Shared resource isn't the right type", v11, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }

      id v12 = (uint64_t (*)(void))v0[1];
      return v12();
    }
  }
}

uint64_t sub_64A0()
{
  *(void *)(*(void *)v1 + 48) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_672C;
  }
  else {
    uint64_t v2 = sub_65B4;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_65B4()
{
  swift_unknownObjectRelease();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_6618()
{
  *(void *)(*(void *)v1 + 64) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_6790;
  }
  else {
    uint64_t v2 = sub_11F8C;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_672C()
{
  swift_unknownObjectRelease();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_6790()
{
  swift_unknownObjectRelease();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_6974(uint64_t a1, void *aBlock, void *a3)
{
  v3[2] = a1;
  v3[3] = a3;
  v3[4] = _Block_copy(aBlock);
  swift_unknownObjectRetain();
  id v6 = a3;
  id v7 = (void *)swift_task_alloc();
  v3[5] = v7;
  *id v7 = v3;
  v7[1] = sub_11F90;
  v7[3] = a1;
  v7[4] = v6;
  return _swift_task_switch(sub_6190, 0, 0);
}

uint64_t sub_6A50(uint64_t a1)
{
  *(void *)(v2 + 120) = a1;
  *(void *)(v2 + 128) = v1;
  return _swift_task_switch(sub_6A70, 0, 0);
}

uint64_t sub_6A70()
{
  uint64_t v20 = v0;
  type metadata accessor for DSHandle();
  uint64_t v1 = swift_dynamicCastClass();
  v0[17] = v1;
  if (v1)
  {
    uint64_t v2 = (void *)v1;
    swift_unknownObjectRetain();
    id v3 = [v2 destination];
    sub_13250();

    NSString v4 = sub_13220();
    swift_bridgeObjectRelease();
    id v5 = [self handleWithString:v4];
    v0[18] = v5;

    if (v5)
    {
      if (qword_1F348 != -1) {
        swift_once();
      }
      uint64_t v6 = sub_131F0();
      v0[19] = sub_11318(v6, (uint64_t)qword_1F4E0);
      swift_unknownObjectRetain_n();
      id v7 = sub_131D0();
      os_log_type_t v8 = sub_13350();
      if (os_log_type_enabled(v7, v8))
      {
        uint64_t v9 = swift_slowAlloc();
        int64_t v18 = (void *)swift_slowAlloc();
        uint64_t v19 = swift_slowAlloc();
        *(_DWORD *)uint64_t v9 = 136315394;
        v0[10] = sub_C490(0xD00000000000001DLL, 0x8000000000014330, &v19);
        sub_13380();
        *(_WORD *)(v9 + 12) = 2112;
        v0[10] = v2;
        swift_unknownObjectRetain();
        sub_13380();
        *int64_t v18 = v2;
        swift_unknownObjectRelease_n();
        _os_log_impl(&dword_0, v7, v8, "%s Trying to stop sharing with participant: %@", (uint8_t *)v9, 0x16u);
        sub_DCC4((uint64_t *)&unk_1F6A0);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
        swift_unknownObjectRelease_n();
      }
      id v16 = *(void **)(v0[16]
                     + OBJC_IVAR____TtC28FindMyItemsDigitalSeparation34FindMyItemsDigitalSeparationSource_beaconSharingSession);
      v0[2] = v0;
      v0[7] = v0 + 21;
      v0[3] = sub_6FB8;
      uint64_t v17 = swift_continuation_init();
      v0[10] = _NSConcreteStackBlock;
      v0[11] = 0x40000000;
      v0[12] = sub_73A4;
      v0[13] = &unk_187D8;
      v0[14] = v17;
      [v16 forceBreakAllSharesWithUser:v5 completion:v0 + 10];
      return _swift_continuation_await(v0 + 2);
    }
    swift_unknownObjectRelease();
  }
  if (qword_1F348 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_131F0();
  sub_11318(v10, (uint64_t)qword_1F4E0);
  uint64_t v11 = sub_131D0();
  os_log_type_t v12 = sub_13340();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    uint64_t v19 = swift_slowAlloc();
    *(_DWORD *)uint64_t v13 = 136315138;
    v0[10] = sub_C490(0xD00000000000001DLL, 0x8000000000014330, &v19);
    sub_13380();
    _os_log_impl(&dword_0, v11, v12, "%s Shared resource isn't the right type", v13, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  unint64_t v14 = (uint64_t (*)(void))v0[1];
  return v14();
}

uint64_t sub_6FB8()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 160) = v1;
  if (v1) {
    uint64_t v2 = sub_7324;
  }
  else {
    uint64_t v2 = sub_70C8;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_70C8()
{
  uint64_t v11 = v0;
  if (*(unsigned char *)(v0 + 168))
  {
    uint64_t v1 = *(NSObject **)(v0 + 144);
    swift_unknownObjectRelease();
  }
  else
  {
    swift_unknownObjectRetain_n();
    uint64_t v1 = sub_131D0();
    os_log_type_t v2 = sub_13340();
    BOOL v3 = os_log_type_enabled(v1, v2);
    uint64_t v4 = *(void **)(v0 + 144);
    if (v3)
    {
      uint64_t v9 = *(void *)(v0 + 136);
      uint64_t v5 = swift_slowAlloc();
      os_log_type_t v8 = (void *)swift_slowAlloc();
      uint64_t v10 = swift_slowAlloc();
      *(_DWORD *)uint64_t v5 = 136315394;
      *(void *)(v0 + 80) = sub_C490(0xD00000000000001DLL, 0x8000000000014330, &v10);
      sub_13380();
      *(_WORD *)(v5 + 12) = 2112;
      *(void *)(v0 + 80) = v9;
      swift_unknownObjectRetain();
      sub_13380();
      *os_log_type_t v8 = v9;
      swift_unknownObjectRelease_n();
      _os_log_impl(&dword_0, v1, v2, "%s Failed to stop sharing with participant %@", (uint8_t *)v5, 0x16u);
      sub_DCC4((uint64_t *)&unk_1F6A0);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      swift_unknownObjectRelease();
      goto LABEL_7;
    }
    swift_unknownObjectRelease_n();
  }
LABEL_7:
  uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
  return v6();
}

uint64_t sub_7324()
{
  uint64_t v1 = *(void **)(v0 + 144);
  swift_willThrow();
  swift_unknownObjectRelease();

  os_log_type_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_73A4(uint64_t a1, char a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    sub_DCC4(&qword_1F6C0);
    uint64_t v5 = swift_allocError();
    *uint64_t v6 = a3;
    id v7 = a3;
    return _swift_continuation_throwingResumeWithError(v3, v5);
  }
  else
  {
    **(unsigned char **)(*(void *)(v3 + 64) + 40) = a2;
    return _swift_continuation_throwingResume(v3);
  }
}

uint64_t sub_75D8(uint64_t a1, void *aBlock, void *a3)
{
  v3[2] = a1;
  v3[3] = a3;
  v3[4] = _Block_copy(aBlock);
  swift_unknownObjectRetain();
  id v6 = a3;
  id v7 = (void *)swift_task_alloc();
  v3[5] = v7;
  *id v7 = v3;
  v7[1] = sub_76B4;
  v7[15] = a1;
  v7[16] = v6;
  return _swift_task_switch(sub_6A70, 0, 0);
}

uint64_t sub_76B4()
{
  uint64_t v2 = v0;
  uint64_t v4 = *v1;
  uint64_t v3 = *v1;
  uint64_t v5 = *(void **)(*v1 + 24);
  uint64_t v6 = *v1;
  swift_task_dealloc();
  swift_unknownObjectRelease();

  uint64_t v7 = *(void *)(v3 + 32);
  if (v2)
  {
    os_log_type_t v8 = (void *)sub_13190();
    swift_errorRelease();
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
  }
  else
  {
    (*(void (**)(uint64_t, void))(v7 + 16))(v7, 0);
  }
  _Block_release(*(const void **)(v4 + 32));
  uint64_t v9 = *(uint64_t (**)(void))(v6 + 8);
  return v9();
}

uint64_t sub_7854()
{
  *(void *)(v1 + 136) = v0;
  return _swift_task_switch(sub_7874, 0, 0);
}

uint64_t sub_7874()
{
  uint64_t v9 = v0;
  if (qword_1F348 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_131F0();
  sub_11318(v1, (uint64_t)qword_1F4E0);
  uint64_t v2 = sub_131D0();
  os_log_type_t v3 = sub_13350();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 136315138;
    v0[16] = sub_C490(0xD000000000000010, 0x8000000000014310, &v8);
    sub_13380();
    _os_log_impl(&dword_0, v2, v3, "%s", v4, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  uint64_t v5 = *(void **)(v0[17]
                + OBJC_IVAR____TtC28FindMyItemsDigitalSeparation34FindMyItemsDigitalSeparationSource_beaconSharingSession);
  v0[2] = v0;
  v0[7] = v0 + 15;
  v0[3] = sub_7ACC;
  uint64_t v6 = swift_continuation_init();
  v0[10] = _NSConcreteStackBlock;
  v0[11] = 0x40000000;
  v0[12] = sub_5960;
  v0[13] = &unk_187C0;
  v0[14] = v6;
  [v5 allSharesWithCompletion:v0 + 10];
  return _swift_continuation_await(v0 + 2);
}

uint64_t sub_7ACC()
{
  return _swift_task_switch(sub_7BAC, 0, 0);
}

uint64_t sub_7BAC()
{
  uint64_t v1 = v0[15];
  v0[18] = v1;
  uint64_t v2 = (void *)swift_task_alloc();
  v0[19] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_7C48;
  return sub_8B58(v1);
}

uint64_t sub_7C48()
{
  uint64_t v2 = *v1;
  uint64_t v3 = *v1;
  swift_task_dealloc();
  if (v0)
  {
    swift_bridgeObjectRelease();
    uint64_t v4 = *(uint64_t (**)(void))(v3 + 8);
    return v4();
  }
  else
  {
    uint64_t v6 = (void *)swift_task_alloc();
    *(void *)(v2 + 160) = v6;
    *uint64_t v6 = v3;
    v6[1] = sub_7DC4;
    uint64_t v7 = *(void *)(v2 + 144);
    return sub_ADB4(v7);
  }
}

uint64_t sub_7DC4()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_803C(const void *a1, void *a2)
{
  v2[2] = a2;
  v2[3] = _Block_copy(a1);
  id v4 = a2;
  uint64_t v5 = (void *)swift_task_alloc();
  v2[4] = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_8100;
  v5[17] = v4;
  return _swift_task_switch(sub_7874, 0, 0);
}

uint64_t sub_8100()
{
  uint64_t v2 = v0;
  uint64_t v4 = *v1;
  uint64_t v3 = *v1;
  uint64_t v5 = *(void **)(*v1 + 16);
  uint64_t v6 = *v1;
  swift_task_dealloc();

  uint64_t v7 = *(void *)(v3 + 24);
  if (v2)
  {
    uint64_t v8 = (void *)sub_13190();
    swift_errorRelease();
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
  }
  else
  {
    (*(void (**)(uint64_t, void))(v7 + 16))(v7, 0);
  }
  _Block_release(*(const void **)(v4 + 24));
  uint64_t v9 = *(uint64_t (**)(void))(v6 + 8);
  return v9();
}

uint64_t sub_8284(uint64_t a1)
{
  v2[20] = a1;
  v2[21] = v1;
  uint64_t v3 = sub_131C0();
  v2[22] = v3;
  v2[23] = *(void *)(v3 - 8);
  v2[24] = swift_task_alloc();
  return _swift_task_switch(sub_8344, 0, 0);
}

uint64_t sub_8344()
{
  uint64_t v28 = v0;
  if (qword_1F348 != -1) {
    swift_once();
  }
  uint64_t v2 = (id *)(v0 + 160);
  uint64_t v1 = *(void **)(v0 + 160);
  uint64_t v3 = sub_131F0();
  *(void *)(v0 + 200) = sub_11318(v3, (uint64_t)qword_1F4E0);
  id v4 = v1;
  uint64_t v5 = sub_131D0();
  os_log_type_t v6 = sub_13350();
  uint64_t v7 = (SEL *)&unk_1E000;
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v9 = *(void *)(v0 + 184);
    uint64_t v8 = *(void *)(v0 + 192);
    uint64_t v26 = *(void *)(v0 + 176);
    id v25 = *(id *)(v0 + 160);
    uint64_t v10 = swift_slowAlloc();
    uint64_t v27 = swift_slowAlloc();
    *(_DWORD *)uint64_t v10 = 136315651;
    *(void *)(v0 + 144) = sub_C490(0xD000000000000014, 0x80000000000142E0, &v27);
    sub_13380();
    *(_WORD *)(v10 + 12) = 2160;
    *(void *)(v0 + 152) = 1752392040;
    sub_13380();
    *(_WORD *)(v10 + 22) = 2081;
    id v11 = [v25 identifier];
    sub_131B0();

    sub_1145C(&qword_1F698, (void (*)(uint64_t))&type metadata accessor for UUID);
    uint64_t v12 = sub_134E0();
    unint64_t v14 = v13;
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v26);
    *(void *)(v0 + 136) = sub_C490(v12, v14, &v27);
    sub_13380();
    swift_bridgeObjectRelease();

    uint64_t v7 = (SEL *)&unk_1E000;
    _os_log_impl(&dword_0, v5, v6, "%s Trying to stop sharing resource: %{private,mask.hash}s", (uint8_t *)v10, 0x20u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    id v15 = *v2;
  }
  uint64_t v17 = *(void *)(v0 + 184);
  uint64_t v16 = *(void *)(v0 + 192);
  uint64_t v18 = *(void *)(v0 + 176);
  uint64_t v19 = *(void **)(*(void *)(v0 + 168)
                 + OBJC_IVAR____TtC28FindMyItemsDigitalSeparation34FindMyItemsDigitalSeparationSource_beaconSharingSession);
  id v20 = [*(id *)(v0 + 160) v7[487]];
  sub_131B0();

  Class isa = sub_131A0().super.isa;
  *(void *)(v0 + 208) = isa;
  uint64_t v22 = *(void (**)(uint64_t, uint64_t))(v17 + 8);
  *(void *)(v0 + 216) = v22;
  *(void *)(v0 + 224) = (v17 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v22(v16, v18);
  *(void *)(v0 + 16) = v0;
  *(void *)(v0 + 56) = v0 + 240;
  *(void *)(v0 + 24) = sub_8740;
  uint64_t v23 = swift_continuation_init();
  *(void *)(v0 + 80) = _NSConcreteStackBlock;
  *(void *)(v0 + 88) = 0x40000000;
  *(void *)(v0 + 96) = sub_73A4;
  *(void *)(v0 + 104) = &unk_187A8;
  *(void *)(v0 + 112) = v23;
  [v19 stopSharing:isa completion:v0 + 80];
  return _swift_continuation_await(v0 + 16);
}

uint64_t sub_8740()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 232) = v1;
  if (v1) {
    uint64_t v2 = sub_8AD8;
  }
  else {
    uint64_t v2 = sub_8850;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_8850()
{
  uint64_t v18 = v0;
  char v1 = *(unsigned char *)(v0 + 240);

  if ((v1 & 1) == 0)
  {
    id v2 = *(id *)(v0 + 160);
    uint64_t v3 = sub_131D0();
    os_log_type_t v4 = sub_13340();
    if (os_log_type_enabled(v3, v4))
    {
      uint64_t v16 = *(void (**)(uint64_t, uint64_t))(v0 + 216);
      uint64_t v5 = *(void *)(v0 + 192);
      uint64_t v6 = *(void *)(v0 + 176);
      uint64_t v7 = *(void **)(v0 + 160);
      uint64_t v8 = swift_slowAlloc();
      uint64_t v17 = swift_slowAlloc();
      *(_DWORD *)uint64_t v8 = 136315394;
      *(void *)(v0 + 128) = sub_C490(0xD000000000000014, 0x80000000000142E0, &v17);
      sub_13380();
      *(_WORD *)(v8 + 12) = 2080;
      id v9 = [v7 identifier];
      sub_131B0();

      sub_1145C(&qword_1F698, (void (*)(uint64_t))&type metadata accessor for UUID);
      uint64_t v10 = sub_134E0();
      unint64_t v12 = v11;
      v16(v5, v6);
      *(void *)(v0 + 120) = sub_C490(v10, v12, &v17);
      sub_13380();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_0, v3, v4, "%s Failed to stop sharing %s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      unint64_t v13 = *(void **)(v0 + 160);
    }
  }
  swift_task_dealloc();
  unint64_t v14 = *(uint64_t (**)(void))(v0 + 8);
  return v14();
}

uint64_t sub_8AD8()
{
  char v1 = *(void **)(v0 + 208);
  swift_willThrow();

  swift_task_dealloc();
  id v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_8B58(uint64_t a1)
{
  v2[18] = a1;
  v2[19] = v1;
  uint64_t v3 = sub_131C0();
  v2[20] = v3;
  v2[21] = *(void *)(v3 - 8);
  v2[22] = swift_task_alloc();
  v2[23] = swift_task_alloc();
  sub_DCC4(&qword_1F690);
  v2[24] = swift_task_alloc();
  return _swift_task_switch(sub_8C58, 0, 0);
}

uint64_t sub_8C58()
{
  uint64_t v43 = v0;
  uint64_t v1 = (id *)(v0 + 128);
  uint64_t v2 = *(void *)(v0 + 144);
  sub_98C4(v2, 0xD00000000000001ELL, 0x80000000000142C0);
  if ((v2 & 0xC000000000000001) != 0)
  {
    uint64_t v3 = &_swiftEmptySetSingleton;
    unint64_t v42 = &_swiftEmptySetSingleton;
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_133C0();
    uint64_t v5 = sub_133F0();
    if (v5)
    {
      uint64_t v6 = v5;
      sub_11350();
      do
      {
        *(void *)(v0 + 136) = v6;
        swift_dynamicCast();
        id v7 = [*v1 sharee];
        uint64_t v8 = (char *)[v7 type];

        id v9 = *v1;
        if (v8 == (unsigned char *)&dword_0 + 2)
        {
        }
        else
        {
          if (v3[3] <= v3[2])
          {
            sub_D2DC();
            uint64_t v3 = v42;
          }
          Swift::Int v10 = sub_13360(v3[5]);
          unint64_t v11 = (char *)(v3 + 7);
          uint64_t v12 = -1 << *((unsigned char *)v3 + 32);
          unint64_t v13 = v10 & ~v12;
          unint64_t v14 = v13 >> 6;
          if (((-1 << v13) & ~v3[(v13 >> 6) + 7]) != 0)
          {
            unint64_t v15 = __clz(__rbit64((-1 << v13) & ~v3[(v13 >> 6) + 7])) | v13 & 0x7FFFFFFFFFFFFFC0;
          }
          else
          {
            char v16 = 0;
            unint64_t v17 = (unint64_t)(63 - v12) >> 6;
            do
            {
              if (++v14 == v17 && (v16 & 1) != 0)
              {
                __break(1u);
                goto LABEL_34;
              }
              BOOL v18 = v14 == v17;
              if (v14 == v17) {
                unint64_t v14 = 0;
              }
              v16 |= v18;
              uint64_t v19 = *(void *)&v11[8 * v14];
            }
            while (v19 == -1);
            unint64_t v15 = __clz(__rbit64(~v19)) + (v14 << 6);
          }
          *(void *)&v11[(v15 >> 3) & 0x1FFFFFFFFFFFFFF8] |= 1 << v15;
          *(void *)(v3[6] + 8 * v15) = v9;
          ++v3[2];
        }
        uint64_t v6 = sub_133F0();
      }
      while (v6);
    }
    swift_release();
  }
  else
  {
    uint64_t v20 = swift_bridgeObjectRetain();
    uint64_t v3 = (void *)sub_D9FC(v20);
  }
  uint64_t v4 = (uint64_t)sub_9BD4((uint64_t)v3);
  swift_release();
  if (qword_1F348 != -1) {
LABEL_34:
  }
    swift_once();
  uint64_t v21 = sub_131F0();
  *(void *)(v0 + 200) = sub_11318(v21, (uint64_t)qword_1F4E0);
  uint64_t v22 = sub_131D0();
  os_log_type_t v23 = sub_13350();
  if (os_log_type_enabled(v22, v23))
  {
    unint64_t v24 = (uint8_t *)swift_slowAlloc();
    unint64_t v42 = (void *)swift_slowAlloc();
    *(_DWORD *)unint64_t v24 = 136315138;
    *(void *)(v0 + 120) = sub_C490(0xD00000000000001ELL, 0x80000000000142C0, (uint64_t *)&v42);
    sub_13380();
    _os_log_impl(&dword_0, v22, v23, "%s Trying to stop all private sharing", v24, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  uint64_t v25 = sub_11070(v4);
  swift_bridgeObjectRelease();
  uint64_t v26 = sub_106A8(v25);
  *(void *)(v0 + 208) = v26;
  swift_bridgeObjectRelease();
  uint64_t v27 = *((void *)v26 + 2);
  *(void *)(v0 + 216) = v27;
  uint64_t v28 = *(void *)(v0 + 168);
  if (v27)
  {
    *(void *)(v0 + 224) = OBJC_IVAR____TtC28FindMyItemsDigitalSeparation34FindMyItemsDigitalSeparationSource_beaconSharingSession;
    int v29 = *(_DWORD *)(v28 + 80);
    *(_DWORD *)(v0 + 288) = v29;
    *(void *)(v0 + 232) = *(void *)(v28 + 72);
    uint64_t v30 = *(void (**)(uint64_t, unint64_t, uint64_t))(v28 + 16);
    *(void *)(v0 + 240) = v30;
    *(void *)(v0 + 248) = 0;
    uint64_t v31 = *(void *)(v0 + 192);
    uint64_t v32 = *(void *)(v0 + 160);
    unint64_t v33 = *(void *)(v0 + 208) + ((v29 + 32) & ~(unint64_t)v29);
    *(void *)(v0 + 256) = (v28 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
    v30(v31, v33, v32);
    v34 = *(void (**)(uint64_t, void, uint64_t, uint64_t))(v28 + 56);
    *(void *)(v0 + 264) = v34;
    v34(v31, 0, 1, v32);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v28 + 48))(v31, 1, v32) != 1)
    {
      uint64_t v35 = *(void *)(v0 + 224);
      uint64_t v36 = *(void *)(v0 + 152);
      (*(void (**)(void, void, void))(*(void *)(v0 + 168) + 32))(*(void *)(v0 + 184), *(void *)(v0 + 192), *(void *)(v0 + 160));
      id v37 = *(void **)(v36 + v35);
      Class isa = sub_131A0().super.isa;
      *(void *)(v0 + 272) = isa;
      *(void *)(v0 + 16) = v0;
      *(void *)(v0 + 56) = v0 + 292;
      *(void *)(v0 + 24) = sub_9278;
      uint64_t v39 = swift_continuation_init();
      *(void *)(v0 + 80) = _NSConcreteStackBlock;
      *(void *)(v0 + 88) = 0x40000000;
      *(void *)(v0 + 96) = sub_73A4;
      *(void *)(v0 + 104) = &unk_18790;
      *(void *)(v0 + 112) = v39;
      [v37 stopSharing:isa completion:v0 + 80];
      return _swift_continuation_await(v0 + 16);
    }
  }
  else
  {
    (*(void (**)(void, uint64_t, uint64_t, void))(v28 + 56))(*(void *)(v0 + 192), 1, 1, *(void *)(v0 + 160));
  }
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  v40 = *(uint64_t (**)(void))(v0 + 8);
  return v40();
}

uint64_t sub_9278()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 280) = v1;
  if (v1)
  {
    swift_release();
    uint64_t v2 = sub_9808;
  }
  else
  {
    uint64_t v2 = sub_9390;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_9390()
{
  uint64_t v29 = v0;
  char v1 = *(unsigned char *)(v0 + 292);

  if (v1)
  {
    (*(void (**)(void, void))(*(void *)(v0 + 168) + 8))(*(void *)(v0 + 184), *(void *)(v0 + 160));
  }
  else
  {
    (*(void (**)(void, void, void))(v0 + 240))(*(void *)(v0 + 176), *(void *)(v0 + 184), *(void *)(v0 + 160));
    uint64_t v2 = sub_131D0();
    os_log_type_t v3 = sub_13340();
    BOOL v4 = os_log_type_enabled(v2, v3);
    uint64_t v5 = *(void *)(v0 + 176);
    uint64_t v6 = *(void *)(v0 + 184);
    uint64_t v7 = *(void *)(v0 + 160);
    uint64_t v8 = *(void *)(v0 + 168);
    if (v4)
    {
      uint64_t v9 = swift_slowAlloc();
      uint64_t v28 = swift_slowAlloc();
      *(_DWORD *)uint64_t v9 = 136315651;
      *(void *)(v9 + 4) = sub_C490(0xD00000000000001ELL, 0x80000000000142C0, &v28);
      *(_WORD *)(v9 + 12) = 2160;
      *(void *)(v9 + 14) = 1752392040;
      *(_WORD *)(v9 + 22) = 2081;
      sub_1145C(&qword_1F698, (void (*)(uint64_t))&type metadata accessor for UUID);
      uint64_t v10 = sub_134E0();
      *(void *)(v9 + 24) = sub_C490(v10, v11, &v28);
      swift_bridgeObjectRelease();
      uint64_t v12 = *(void (**)(uint64_t, uint64_t))(v8 + 8);
      v12(v5, v7);
      _os_log_impl(&dword_0, v2, v3, "%s Failed to stop sharing %{private,mask.hash}s", (uint8_t *)v9, 0x20u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      v12(v6, v7);
    }
    else
    {

      unint64_t v13 = *(void (**)(uint64_t, uint64_t))(v8 + 8);
      v13(v5, v7);
      v13(v6, v7);
    }
  }
  uint64_t v14 = *(void *)(v0 + 248) + 1;
  if (v14 == *(void *)(v0 + 216))
  {
    (*(void (**)(void, uint64_t, uint64_t, void))(v0 + 264))(*(void *)(v0 + 192), 1, 1, *(void *)(v0 + 160));
LABEL_9:
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v21 = *(uint64_t (**)(void))(v0 + 8);
    return v21();
  }
  unint64_t v15 = *(void (**)(uint64_t, unint64_t, uint64_t))(v0 + 240);
  uint64_t v16 = *(void *)(v0 + 192);
  uint64_t v17 = *(void *)(v0 + 160);
  uint64_t v18 = *(void *)(v0 + 168);
  unint64_t v19 = *(void *)(v0 + 208)
      + ((*(unsigned __int8 *)(v0 + 288) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0 + 288))
      + *(void *)(v0 + 232) * v14;
  *(void *)(v0 + 248) = v14;
  *(void *)(v0 + 256) = (v18 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v15(v16, v19, v17);
  uint64_t v20 = *(void (**)(uint64_t, void, uint64_t, uint64_t))(v18 + 56);
  *(void *)(v0 + 264) = v20;
  v20(v16, 0, 1, v17);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17) == 1) {
    goto LABEL_9;
  }
  uint64_t v23 = *(void *)(v0 + 224);
  uint64_t v24 = *(void *)(v0 + 152);
  (*(void (**)(void, void, void))(*(void *)(v0 + 168) + 32))(*(void *)(v0 + 184), *(void *)(v0 + 192), *(void *)(v0 + 160));
  uint64_t v25 = *(void **)(v24 + v23);
  Class isa = sub_131A0().super.isa;
  *(void *)(v0 + 272) = isa;
  *(void *)(v0 + 16) = v0;
  *(void *)(v0 + 56) = v0 + 292;
  *(void *)(v0 + 24) = sub_9278;
  uint64_t v27 = swift_continuation_init();
  *(void *)(v0 + 80) = _NSConcreteStackBlock;
  *(void *)(v0 + 88) = 0x40000000;
  *(void *)(v0 + 96) = sub_73A4;
  *(void *)(v0 + 104) = &unk_18790;
  *(void *)(v0 + 112) = v27;
  [v25 stopSharing:isa completion:v0 + 80];
  return _swift_continuation_await(v0 + 16);
}

uint64_t sub_9808()
{
  char v1 = (void *)v0[34];
  uint64_t v2 = v0[23];
  uint64_t v3 = v0[21];
  uint64_t v4 = v0[20];
  swift_willThrow();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

void sub_98C4(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v5 = v3;
  uint64_t v6 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    sub_133C0();
    sub_11350();
    sub_1145C((unint64_t *)&qword_1F6E8, (void (*)(uint64_t))sub_11350);
    sub_13330();
    uint64_t v6 = v24;
    uint64_t v22 = v25;
    uint64_t v7 = v26;
    int64_t v8 = v27;
    unint64_t v9 = v28;
  }
  else
  {
    uint64_t v10 = -1 << *(unsigned char *)(a1 + 32);
    uint64_t v22 = a1 + 56;
    uint64_t v11 = ~v10;
    uint64_t v12 = -v10;
    if (v12 < 64) {
      uint64_t v13 = ~(-1 << v12);
    }
    else {
      uint64_t v13 = -1;
    }
    unint64_t v9 = v13 & *(void *)(a1 + 56);
    swift_bridgeObjectRetain();
    uint64_t v7 = v11;
    int64_t v8 = 0;
  }
  int64_t v21 = (unint64_t)(v7 + 64) >> 6;
  if ((v6 & 0x8000000000000000) == 0) {
    goto LABEL_11;
  }
LABEL_8:
  if (sub_133F0())
  {
    sub_11350();
    swift_unknownObjectRetain();
    swift_dynamicCast();
    id v14 = v29;
    swift_unknownObjectRelease();
    int64_t v15 = v8;
    uint64_t v16 = v9;
    while (v14)
    {
      uint64_t v29 = v14;
      sub_107DC(&v29, a2, a3);

      if (v5) {
        break;
      }
      int64_t v8 = v15;
      unint64_t v9 = v16;
      if (v6 < 0) {
        goto LABEL_8;
      }
LABEL_11:
      if (v9)
      {
        uint64_t v16 = (v9 - 1) & v9;
        unint64_t v17 = __clz(__rbit64(v9)) | (v8 << 6);
        int64_t v15 = v8;
      }
      else
      {
        int64_t v15 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
          __break(1u);
          return;
        }
        if (v15 >= v21) {
          break;
        }
        unint64_t v18 = *(void *)(v22 + 8 * v15);
        if (!v18)
        {
          int64_t v19 = v8 + 2;
          if (v8 + 2 >= v21) {
            break;
          }
          unint64_t v18 = *(void *)(v22 + 8 * v19);
          if (v18) {
            goto LABEL_22;
          }
          int64_t v19 = v8 + 3;
          if (v8 + 3 >= v21) {
            break;
          }
          unint64_t v18 = *(void *)(v22 + 8 * v19);
          if (v18) {
            goto LABEL_22;
          }
          int64_t v19 = v8 + 4;
          if (v8 + 4 >= v21) {
            break;
          }
          unint64_t v18 = *(void *)(v22 + 8 * v19);
          if (v18)
          {
LABEL_22:
            int64_t v15 = v19;
          }
          else
          {
            int64_t v15 = v8 + 5;
            if (v8 + 5 >= v21) {
              break;
            }
            unint64_t v18 = *(void *)(v22 + 8 * v15);
            if (!v18)
            {
              int64_t v20 = v8 + 6;
              while (v21 != v20)
              {
                unint64_t v18 = *(void *)(v22 + 8 * v20++);
                if (v18)
                {
                  int64_t v15 = v20 - 1;
                  goto LABEL_23;
                }
              }
              break;
            }
          }
        }
LABEL_23:
        uint64_t v16 = (v18 - 1) & v18;
        unint64_t v17 = __clz(__rbit64(v18)) + (v15 << 6);
      }
      id v14 = *(id *)(*(void *)(v6 + 48) + 8 * v17);
    }
  }
  sub_11454();
}

char *sub_9BD4(uint64_t a1)
{
  sub_DCC4(&qword_1F690);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v3 = (char *)&v34 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v46 = sub_131C0();
  uint64_t v4 = *(void *)(v46 - 8);
  uint64_t v5 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v39 = (char *)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v35 = (char *)&v34 - v7;
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    sub_133C0();
    sub_11350();
    sub_1145C((unint64_t *)&qword_1F6E8, (void (*)(uint64_t))sub_11350);
    uint64_t result = (char *)sub_13330();
    a1 = v48;
    uint64_t v43 = v49;
    uint64_t v9 = v50;
    uint64_t v10 = v51;
    uint64_t v11 = v52;
  }
  else
  {
    uint64_t v12 = -1 << *(unsigned char *)(a1 + 32);
    uint64_t v13 = *(void *)(a1 + 56);
    uint64_t v43 = a1 + 56;
    uint64_t v9 = ~v12;
    uint64_t v14 = -v12;
    if (v14 < 64) {
      uint64_t v15 = ~(-1 << v14);
    }
    else {
      uint64_t v15 = -1;
    }
    uint64_t v11 = v15 & v13;
    uint64_t result = (char *)swift_bridgeObjectRetain();
    uint64_t v10 = 0;
  }
  uint64_t v36 = v4;
  uint64_t v37 = v9;
  int64_t v42 = (unint64_t)(v9 + 64) >> 6;
  uint64_t v44 = (void (**)(char *, void, uint64_t, uint64_t))(v4 + 56);
  uint64_t v16 = (unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48);
  v38 = (void (**)(char *, char *, uint64_t))(v4 + 32);
  v40 = (char *)&_swiftEmptyArrayStorage;
  char v41 = (char *)&type metadata for Swift.AnyObject + 8;
  uint64_t v45 = a1;
LABEL_8:
  uint64_t v17 = v10;
  unint64_t v18 = v11;
  if (a1 < 0)
  {
    do
    {
      uint64_t v20 = sub_133F0();
      if (!v20) {
        goto LABEL_39;
      }
      uint64_t v47 = v20;
      sub_11350();
      swift_unknownObjectRetain();
      swift_dynamicCast();
      id v21 = v53;
      swift_unknownObjectRelease();
      uint64_t v10 = v17;
      uint64_t v11 = v18;
      if (!v21) {
        goto LABEL_39;
      }
LABEL_31:
      id v25 = [v21 beaconIdentifier];
      sub_131B0();

      uint64_t v26 = v46;
      (*v44)(v3, 0, 1, v46);

      if ((*v16)(v3, 1, v26) != 1)
      {
        int64_t v27 = *v38;
        unint64_t v28 = v35;
        uint64_t v29 = v46;
        (*v38)(v35, v3, v46);
        v27(v39, v28, v29);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          v40 = (char *)sub_C228(0, *((void *)v40 + 2) + 1, 1, (unint64_t)v40);
        }
        a1 = v45;
        unint64_t v31 = *((void *)v40 + 2);
        unint64_t v30 = *((void *)v40 + 3);
        if (v31 >= v30 >> 1) {
          v40 = (char *)sub_C228(v30 > 1, v31 + 1, 1, (unint64_t)v40);
        }
        uint64_t v32 = v39;
        unint64_t v33 = v40;
        *((void *)v40 + 2) = v31 + 1;
        uint64_t result = (char *)((uint64_t (*)(char *, char *, uint64_t))v27)(&v33[((*(unsigned __int8 *)(v36 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v36 + 80))+ *(void *)(v36 + 72) * v31], v32, v46);
        goto LABEL_8;
      }
      uint64_t result = (char *)sub_11674((uint64_t)v3, &qword_1F690);
      uint64_t v17 = v10;
      unint64_t v18 = v11;
      a1 = v45;
    }
    while (v45 < 0);
  }
  if (v18)
  {
    uint64_t v11 = (v18 - 1) & v18;
    unint64_t v19 = __clz(__rbit64(v18)) | (v17 << 6);
    uint64_t v10 = v17;
    goto LABEL_30;
  }
  int64_t v22 = v17 + 1;
  if (!__OFADD__(v17, 1))
  {
    if (v22 < v42)
    {
      unint64_t v23 = *(void *)(v43 + 8 * v22);
      uint64_t v10 = v17 + 1;
      if (v23) {
        goto LABEL_29;
      }
      uint64_t v10 = v17 + 2;
      if (v17 + 2 >= v42) {
        goto LABEL_39;
      }
      unint64_t v23 = *(void *)(v43 + 8 * v10);
      if (v23) {
        goto LABEL_29;
      }
      uint64_t v10 = v17 + 3;
      if (v17 + 3 >= v42) {
        goto LABEL_39;
      }
      unint64_t v23 = *(void *)(v43 + 8 * v10);
      if (v23) {
        goto LABEL_29;
      }
      uint64_t v10 = v17 + 4;
      if (v17 + 4 >= v42) {
        goto LABEL_39;
      }
      unint64_t v23 = *(void *)(v43 + 8 * v10);
      if (v23)
      {
LABEL_29:
        uint64_t v11 = (v23 - 1) & v23;
        unint64_t v19 = __clz(__rbit64(v23)) + (v10 << 6);
LABEL_30:
        id v21 = *(id *)(*(void *)(a1 + 48) + 8 * v19);
        if (v21) {
          goto LABEL_31;
        }
        goto LABEL_39;
      }
      uint64_t v10 = v17 + 5;
      if (v17 + 5 < v42)
      {
        unint64_t v23 = *(void *)(v43 + 8 * v10);
        if (!v23)
        {
          uint64_t v24 = v17 + 6;
          while (v42 != v24)
          {
            unint64_t v23 = *(void *)(v43 + 8 * v24++);
            if (v23)
            {
              uint64_t v10 = v24 - 1;
              a1 = v45;
              goto LABEL_29;
            }
          }
          goto LABEL_39;
        }
        goto LABEL_29;
      }
    }
LABEL_39:
    sub_11454();
    return v40;
  }
  __break(1u);
  return result;
}

uint64_t sub_A128(uint64_t a1)
{
  v2[25] = a1;
  v2[26] = v1;
  uint64_t v3 = sub_131C0();
  v2[27] = v3;
  v2[28] = *(void *)(v3 - 8);
  v2[29] = swift_task_alloc();
  v2[30] = swift_task_alloc();
  v2[31] = swift_task_alloc();
  v2[32] = swift_task_alloc();
  return _swift_task_switch(sub_A210, 0, 0);
}

uint64_t sub_A210()
{
  uint64_t v26 = v0;
  id v1 = [*(id *)(v0[25] + OBJC_IVAR____TtC28FindMyItemsDigitalSeparation22DSDelegatedBeaconShare_beaconShare) beaconIdentifier];
  sub_131B0();

  if (qword_1F348 != -1) {
    swift_once();
  }
  uint64_t v2 = v0[31];
  uint64_t v3 = v0[32];
  uint64_t v4 = v0[27];
  uint64_t v5 = v0[28];
  uint64_t v6 = sub_131F0();
  v0[33] = sub_11318(v6, (uint64_t)qword_1F4E0);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
  v0[34] = v7;
  v0[35] = (v5 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v7(v2, v3, v4);
  int64_t v8 = sub_131D0();
  os_log_type_t v9 = sub_13350();
  BOOL v10 = os_log_type_enabled(v8, v9);
  uint64_t v11 = v0[31];
  uint64_t v12 = v0[27];
  uint64_t v13 = v0[28];
  if (v10)
  {
    uint64_t v14 = swift_slowAlloc();
    uint64_t v25 = swift_slowAlloc();
    *(_DWORD *)uint64_t v14 = 136315651;
    v0[23] = sub_C490(0xD00000000000001CLL, 0x80000000000142A0, &v25);
    sub_13380();
    *(_WORD *)(v14 + 12) = 2160;
    v0[24] = 1752392040;
    sub_13380();
    *(_WORD *)(v14 + 22) = 2081;
    sub_1145C(&qword_1F698, (void (*)(uint64_t))&type metadata accessor for UUID);
    uint64_t v15 = sub_134E0();
    v0[19] = sub_C490(v15, v16, &v25);
    sub_13380();
    swift_bridgeObjectRelease();
    uint64_t v17 = *(void (**)(uint64_t, uint64_t))(v13 + 8);
    v17(v11, v12);
    _os_log_impl(&dword_0, v8, v9, "%s for beacon %{private,mask.hash}s", (uint8_t *)v14, 0x20u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    uint64_t v17 = *(void (**)(uint64_t, uint64_t))(v13 + 8);
    v17(v0[31], v0[27]);
  }

  v0[36] = v17;
  uint64_t v18 = v0[26];
  id v19 = objc_allocWithZone((Class)SPBeaconLocationShareContext);
  Class isa = sub_131A0().super.isa;
  id v21 = [v19 initWithBeaconIdentifier:isa];
  v0[37] = v21;

  int64_t v22 = *(void **)(v18
                 + OBJC_IVAR____TtC28FindMyItemsDigitalSeparation34FindMyItemsDigitalSeparationSource_beaconSharingSession);
  v0[2] = v0;
  v0[7] = v0 + 39;
  v0[3] = sub_A608;
  uint64_t v23 = swift_continuation_init();
  v0[10] = _NSConcreteStackBlock;
  v0[11] = 0x40000000;
  v0[12] = sub_73A4;
  v0[13] = &unk_18778;
  v0[14] = v23;
  [v22 stopTemporaryItemLocationShare:v21 completion:v0 + 10];
  return _swift_continuation_await(v0 + 2);
}

uint64_t sub_A608()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 304) = v1;
  if (v1) {
    uint64_t v2 = sub_AA0C;
  }
  else {
    uint64_t v2 = sub_A718;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_A718()
{
  uint64_t v18 = v0;
  (*(void (**)(void, void, void))(v0 + 272))(*(void *)(v0 + 240), *(void *)(v0 + 256), *(void *)(v0 + 216));
  uint64_t v1 = sub_131D0();
  os_log_type_t v2 = sub_13350();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v14 = *(void (**)(uint64_t, uint64_t))(v0 + 288);
    uint64_t v15 = *(void **)(v0 + 296);
    uint64_t v16 = *(void *)(v0 + 256);
    uint64_t v3 = *(void *)(v0 + 240);
    uint64_t v4 = *(void *)(v0 + 216);
    uint64_t v5 = swift_slowAlloc();
    uint64_t v17 = swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 136315651;
    *(void *)(v0 + 160) = sub_C490(0xD00000000000001CLL, 0x80000000000142A0, &v17);
    sub_13380();
    *(_WORD *)(v5 + 12) = 2160;
    *(void *)(v0 + 168) = 1752392040;
    sub_13380();
    *(_WORD *)(v5 + 22) = 2081;
    sub_1145C(&qword_1F698, (void (*)(uint64_t))&type metadata accessor for UUID);
    uint64_t v6 = sub_134E0();
    *(void *)(v0 + 176) = sub_C490(v6, v7, &v17);
    sub_13380();
    swift_bridgeObjectRelease();
    v14(v3, v4);
    _os_log_impl(&dword_0, v1, v2, "%s Successfully stopped delegated sharing for beacon %{private,mask.hash}s", (uint8_t *)v5, 0x20u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    v14(v16, v4);
  }
  else
  {
    int64_t v8 = *(void (**)(uint64_t, uint64_t))(v0 + 288);
    uint64_t v9 = *(void *)(v0 + 256);
    uint64_t v10 = *(void *)(v0 + 240);
    uint64_t v11 = *(void *)(v0 + 216);

    v8(v10, v11);
    v8(v9, v11);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v12 = *(uint64_t (**)(void))(v0 + 8);
  return v12();
}

uint64_t sub_AA0C()
{
  uint64_t v23 = v0;
  uint64_t v1 = (void (*)(uint64_t, uint64_t, uint64_t))v0[34];
  uint64_t v2 = v0[32];
  uint64_t v3 = v0[29];
  uint64_t v4 = v0[27];
  swift_willThrow();
  v1(v3, v2, v4);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v5 = sub_131D0();
  os_log_type_t v6 = sub_13340();
  if (os_log_type_enabled(v5, v6))
  {
    id v21 = (void (*)(uint64_t, uint64_t))v0[36];
    uint64_t v7 = v0[29];
    log = v5;
    uint64_t v8 = v0[27];
    uint64_t v9 = swift_slowAlloc();
    uint64_t v20 = (void *)swift_slowAlloc();
    v22[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 136315907;
    v0[16] = sub_C490(0xD00000000000001CLL, 0x80000000000142A0, v22);
    sub_13380();
    *(_WORD *)(v9 + 12) = 2160;
    v0[17] = 1752392040;
    sub_13380();
    *(_WORD *)(v9 + 22) = 2081;
    sub_1145C(&qword_1F698, (void (*)(uint64_t))&type metadata accessor for UUID);
    uint64_t v10 = sub_134E0();
    v0[18] = sub_C490(v10, v11, v22);
    sub_13380();
    swift_bridgeObjectRelease();
    v21(v7, v8);
    *(_WORD *)(v9 + 32) = 2114;
    swift_errorRetain();
    uint64_t v12 = _swift_stdlib_bridgeErrorToNSError();
    v0[15] = v12;
    sub_13380();
    *uint64_t v20 = v12;
    swift_errorRelease();
    swift_errorRelease();
    uint64_t v5 = log;
    _os_log_impl(&dword_0, log, v6, "%s Failed to stop delegated share with beacon identifier %{private,mask.hash}s\nError %{public}@", (uint8_t *)v9, 0x2Au);
    sub_DCC4((uint64_t *)&unk_1F6A0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    ((void (*)(void, void))v0[36])(v0[29], v0[27]);
    swift_errorRelease();
    swift_errorRelease();
  }

  uint64_t v13 = (void *)v0[37];
  uint64_t v14 = (void (*)(uint64_t, uint64_t))v0[36];
  uint64_t v15 = v0[32];
  uint64_t v16 = v0[27];
  swift_willThrow();

  v14(v15, v16);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v17 = (uint64_t (*)(void))v0[1];
  return v17();
}

uint64_t sub_ADB4(uint64_t a1)
{
  v2[21] = a1;
  v2[22] = v1;
  uint64_t v3 = sub_131C0();
  v2[23] = v3;
  v2[24] = *(void *)(v3 - 8);
  v2[25] = swift_task_alloc();
  v2[26] = swift_task_alloc();
  sub_DCC4(&qword_1F690);
  v2[27] = swift_task_alloc();
  return _swift_task_switch(sub_AEB4, 0, 0);
}

uint64_t sub_AEB4()
{
  uint64_t v1 = *(void *)(v0 + 168);
  sub_98C4(v1, 0xD00000000000001DLL, 0x8000000000013FA0);
  if ((v1 & 0xC000000000000001) != 0)
  {
    uint64_t v2 = &_swiftEmptySetSingleton;
    swift_bridgeObjectRetain();
    sub_133C0();
    uint64_t v3 = sub_133F0();
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = (id *)(v0 + 160);
      sub_11350();
      do
      {
        *(void *)(v0 + 136) = v4;
        swift_dynamicCast();
        id v6 = [*v5 sharee];
        uint64_t v7 = (char *)[v6 type];

        id v8 = *v5;
        if (v7 == (unsigned char *)&dword_0 + 2)
        {
          if (*((void *)&_swiftEmptySetSingleton + 3) <= *((void *)&_swiftEmptySetSingleton + 2))
          {
            sub_D2DC();
            uint64_t v2 = &_swiftEmptySetSingleton;
          }
          Swift::Int v9 = sub_13360(*((void *)&_swiftEmptySetSingleton + 5));
          uint64_t v10 = (char *)&_swiftEmptySetSingleton + 56;
          uint64_t v11 = -1 << *((unsigned char *)&_swiftEmptySetSingleton + 32);
          unint64_t v12 = v9 & ~v11;
          unint64_t v13 = v12 >> 6;
          if (((-1 << v12) & ~*((void *)&_swiftEmptySetSingleton + (v12 >> 6) + 7)) != 0)
          {
            unint64_t v14 = __clz(__rbit64((-1 << v12) & ~*((void *)&_swiftEmptySetSingleton + (v12 >> 6) + 7))) | v12 & 0x7FFFFFFFFFFFFFC0;
          }
          else
          {
            char v15 = 0;
            unint64_t v16 = (unint64_t)(63 - v11) >> 6;
            do
            {
              if (++v13 == v16 && (v15 & 1) != 0)
              {
                __break(1u);
                return _swift_continuation_await(v9);
              }
              BOOL v17 = v13 == v16;
              if (v13 == v16) {
                unint64_t v13 = 0;
              }
              v15 |= v17;
              uint64_t v18 = *(void *)&v10[8 * v13];
            }
            while (v18 == -1);
            unint64_t v14 = __clz(__rbit64(~v18)) + (v13 << 6);
          }
          *(void *)&v10[(v14 >> 3) & 0x1FFFFFFFFFFFFFF8] |= 1 << v14;
          *(void *)(*((void *)&_swiftEmptySetSingleton + 6) + 8 * v14) = v8;
          ++*((void *)&_swiftEmptySetSingleton + 2);
        }
        else
        {
        }
        uint64_t v4 = sub_133F0();
      }
      while (v4);
    }
    swift_release();
  }
  else
  {
    uint64_t v19 = swift_bridgeObjectRetain();
    uint64_t v2 = (void *)sub_DB60(v19);
  }
  uint64_t v20 = sub_9BD4((uint64_t)v2);
  swift_release();
  uint64_t v21 = sub_11070((uint64_t)v20);
  swift_bridgeObjectRelease();
  int64_t v22 = sub_106A8(v21);
  *(void *)(v0 + 224) = v22;
  swift_bridgeObjectRelease();
  uint64_t v23 = *((void *)v22 + 2);
  *(void *)(v0 + 232) = v23;
  uint64_t v24 = *(void *)(v0 + 192);
  if (!v23)
  {
    (*(void (**)(void, uint64_t, uint64_t, void))(v24 + 56))(*(void *)(v0 + 216), 1, 1, *(void *)(v0 + 184));
    goto LABEL_28;
  }
  *(void *)(v0 + 240) = OBJC_IVAR____TtC28FindMyItemsDigitalSeparation34FindMyItemsDigitalSeparationSource_beaconSharingSession;
  int v25 = *(_DWORD *)(v24 + 80);
  *(_DWORD *)(v0 + 304) = v25;
  *(void *)(v0 + 248) = *(void *)(v24 + 72);
  uint64_t v26 = *(void (**)(uint64_t, unint64_t, uint64_t))(v24 + 16);
  *(void *)(v0 + 256) = v26;
  *(void *)(v0 + 264) = 0;
  uint64_t v27 = *(void *)(v0 + 216);
  uint64_t v28 = *(void *)(v0 + 184);
  unint64_t v29 = *(void *)(v0 + 224) + ((v25 + 32) & ~(unint64_t)v25);
  *(void *)(v0 + 272) = (v24 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v26(v27, v29, v28);
  unint64_t v30 = *(void (**)(uint64_t, void, uint64_t, uint64_t))(v24 + 56);
  *(void *)(v0 + 280) = v30;
  v30(v27, 0, 1, v28);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v24 + 48))(v27, 1, v28) == 1)
  {
LABEL_28:
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v38 = *(uint64_t (**)(void))(v0 + 8);
    return v38();
  }
  uint64_t v31 = *(void *)(v0 + 240);
  uint64_t v32 = *(void *)(v0 + 176);
  (*(void (**)(void, void, void))(*(void *)(v0 + 192) + 32))(*(void *)(v0 + 208), *(void *)(v0 + 216), *(void *)(v0 + 184));
  id v33 = objc_allocWithZone((Class)SPBeaconLocationShareContext);
  Class isa = sub_131A0().super.isa;
  id v35 = [v33 initWithBeaconIdentifier:isa];
  *(void *)(v0 + 288) = v35;

  uint64_t v36 = *(void **)(v32 + v31);
  *(void *)(v0 + 16) = v0;
  *(void *)(v0 + 56) = v0 + 308;
  *(void *)(v0 + 24) = sub_B3C0;
  uint64_t v37 = swift_continuation_init();
  *(void *)(v0 + 80) = _NSConcreteStackBlock;
  *(void *)(v0 + 88) = 0x40000000;
  *(void *)(v0 + 96) = sub_73A4;
  *(void *)(v0 + 104) = &unk_18760;
  *(void *)(v0 + 112) = v37;
  [v36 stopTemporaryItemLocationShare:v35 completion:v0 + 80];
  Swift::Int v9 = v0 + 16;
  return _swift_continuation_await(v9);
}

uint64_t sub_B3C0()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 296) = v1;
  if (v1)
  {
    swift_release();
    uint64_t v2 = sub_B7B0;
  }
  else
  {
    uint64_t v2 = sub_B4D8;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_B4D8()
{
  uint64_t v1 = *(void *)(v0 + 264);
  uint64_t v2 = *(void *)(v0 + 232);
  uint64_t v3 = *(void *)(v0 + 208);
  uint64_t v4 = *(void *)(v0 + 184);
  uint64_t v5 = *(void *)(v0 + 192);

  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v4);
  if (v1 + 1 == v2)
  {
    (*(void (**)(void, uint64_t, uint64_t, void))(v0 + 280))(*(void *)(v0 + 216), 1, 1, *(void *)(v0 + 184));
LABEL_4:
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    unint64_t v13 = *(uint64_t (**)(void))(v0 + 8);
    return v13();
  }
  id v6 = *(void (**)(uint64_t, unint64_t, uint64_t))(v0 + 256);
  uint64_t v7 = *(void *)(v0 + 264) + 1;
  uint64_t v8 = *(void *)(v0 + 216);
  uint64_t v9 = *(void *)(v0 + 184);
  uint64_t v10 = *(void *)(v0 + 192);
  unint64_t v11 = *(void *)(v0 + 224)
      + ((*(unsigned __int8 *)(v0 + 304) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0 + 304))
      + *(void *)(v0 + 248) * v7;
  *(void *)(v0 + 264) = v7;
  *(void *)(v0 + 272) = (v10 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v6(v8, v11, v9);
  unint64_t v12 = *(void (**)(uint64_t, void, uint64_t, uint64_t))(v10 + 56);
  *(void *)(v0 + 280) = v12;
  v12(v8, 0, 1, v9);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1) {
    goto LABEL_4;
  }
  uint64_t v15 = *(void *)(v0 + 240);
  uint64_t v16 = *(void *)(v0 + 176);
  (*(void (**)(void, void, void))(*(void *)(v0 + 192) + 32))(*(void *)(v0 + 208), *(void *)(v0 + 216), *(void *)(v0 + 184));
  id v17 = objc_allocWithZone((Class)SPBeaconLocationShareContext);
  Class isa = sub_131A0().super.isa;
  id v19 = [v17 initWithBeaconIdentifier:isa];
  *(void *)(v0 + 288) = v19;

  uint64_t v20 = *(void **)(v16 + v15);
  *(void *)(v0 + 16) = v0;
  *(void *)(v0 + 56) = v0 + 308;
  *(void *)(v0 + 24) = sub_B3C0;
  uint64_t v21 = swift_continuation_init();
  *(void *)(v0 + 80) = _NSConcreteStackBlock;
  *(void *)(v0 + 88) = 0x40000000;
  *(void *)(v0 + 96) = sub_73A4;
  *(void *)(v0 + 104) = &unk_18760;
  *(void *)(v0 + 112) = v21;
  [v20 stopTemporaryItemLocationShare:v19 completion:v0 + 80];
  return _swift_continuation_await(v0 + 16);
}

uint64_t sub_B7B0()
{
  int v25 = v0;
  swift_willThrow();
  if (qword_1F348 != -1) {
    swift_once();
  }
  uint64_t v1 = (void (*)(uint64_t, uint64_t, uint64_t))v0[32];
  uint64_t v3 = v0[25];
  uint64_t v2 = v0[26];
  uint64_t v4 = v0[23];
  uint64_t v5 = sub_131F0();
  sub_11318(v5, (uint64_t)qword_1F4E0);
  v1(v3, v2, v4);
  swift_errorRetain();
  swift_errorRetain();
  id v6 = sub_131D0();
  os_log_type_t v7 = sub_13340();
  BOOL v8 = os_log_type_enabled(v6, v7);
  uint64_t v9 = v0[25];
  uint64_t v10 = v0[23];
  unint64_t v11 = (void (**)(uint64_t, uint64_t))(v0[24] + 8);
  if (v8)
  {
    os_log_type_t type = v7;
    uint64_t v12 = swift_slowAlloc();
    uint64_t v22 = (void *)swift_slowAlloc();
    v24[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v12 = 136315907;
    v0[16] = sub_C490(0xD00000000000001DLL, 0x8000000000013FA0, v24);
    sub_13380();
    *(_WORD *)(v12 + 12) = 2160;
    v0[15] = 1752392040;
    sub_13380();
    *(_WORD *)(v12 + 22) = 2081;
    sub_1145C(&qword_1F698, (void (*)(uint64_t))&type metadata accessor for UUID);
    uint64_t v13 = sub_134E0();
    v0[18] = sub_C490(v13, v14, v24);
    sub_13380();
    swift_bridgeObjectRelease();
    uint64_t v15 = *v11;
    (*v11)(v9, v10);
    *(_WORD *)(v12 + 32) = 2114;
    swift_errorRetain();
    uint64_t v16 = _swift_stdlib_bridgeErrorToNSError();
    v0[19] = v16;
    sub_13380();
    *uint64_t v22 = v16;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl(&dword_0, v6, type, "%s: Failed to stop sharing %{private,mask.hash}s error %{public}@", (uint8_t *)v12, 0x2Au);
    sub_DCC4((uint64_t *)&unk_1F6A0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    uint64_t v15 = *v11;
    (*v11)(v0[25], v0[23]);
    swift_errorRelease();
    swift_errorRelease();
  }

  id v17 = (void *)v0[36];
  uint64_t v18 = v0[26];
  uint64_t v19 = v0[23];
  swift_willThrow();

  v15(v18, v19);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v20 = (uint64_t (*)(void))v0[1];
  return v20();
}

id sub_BB80()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FindMyItemsDigitalSeparationSource();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for FindMyItemsDigitalSeparationSource()
{
  return self;
}

uint64_t sub_BC34(uint64_t a1, int *a2)
{
  id v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_BD10;
  return v6(a1);
}

uint64_t sub_BD10()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_BE08(uint64_t a1, uint64_t a2, int *a3)
{
  id v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  *uint64_t v4 = v3;
  v4[1] = sub_11F84;
  return v6();
}

uint64_t sub_BED4(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  *uint64_t v5 = v4;
  v5[1] = sub_11F84;
  return v7();
}

uint64_t sub_BFA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_132F0();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_132E0();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_11674(a1, &qword_1F6F0);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_132D0();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_C14C(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_11F94;
  return v6(a1);
}

uint64_t sub_C228(char a1, int64_t a2, char a3, unint64_t a4)
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
  sub_DCC4(&qword_1F6C8);
  uint64_t v10 = *(void *)(sub_131C0() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t v14 = j__malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (BOOL v15 = v11 == -1) : (BOOL v15 = 0), v15))
  {
LABEL_29:
    uint64_t result = sub_13470();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(sub_131C0() - 8);
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
    sub_10F18(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

uint64_t sub_C490(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_C564(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_11390((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_11390((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_11508((uint64_t)v12);
  return v7;
}

uint64_t sub_C564(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_13390();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_C720(a5, a6);
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
  uint64_t v8 = sub_13460();
  if (!v8)
  {
    sub_13470();
    __break(1u);
LABEL_17:
    uint64_t result = sub_134C0();
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

uint64_t sub_C720(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_C7B8(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_C998(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_C998(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_C7B8(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_C930(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_13440();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_13470();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_13270();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_134C0();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_13470();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_C930(uint64_t a1, uint64_t a2)
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
  sub_DCC4(&qword_1F6B8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_C998(char a1, int64_t a2, char a3, char *a4)
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
    sub_DCC4(&qword_1F6B8);
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
  uint64_t result = sub_134C0();
  __break(1u);
  return result;
}

unint64_t sub_CAE8(uint64_t a1)
{
  sub_131C0();
  sub_1145C(&qword_1F6D0, (void (*)(uint64_t))&type metadata accessor for UUID);
  uint64_t v2 = sub_13200();

  return sub_EAEC(a1, v2);
}

void (*sub_CB80(void *a1, uint64_t a2))(uint64_t a1)
{
  unint64_t v4 = malloc(0x68uLL);
  *a1 = v4;
  uint64_t v5 = sub_131C0();
  v4[8] = v5;
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = v6;
  v4[9] = v6;
  int64_t v8 = malloc(*(void *)(v6 + 64));
  v4[10] = v8;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  (*(void (**)(void *, uint64_t, uint64_t))(v7 + 16))(v8, a2, v5);
  v4[11] = sub_10140(v4);
  v4[12] = sub_FFC0(v4 + 4, (uint64_t)v8, isUniquelyReferenced_nonNull_native);
  return sub_CCA0;
}

void sub_CCA0(uint64_t a1)
{
  uint64_t v1 = *(void **)a1;
  uint64_t v2 = *(void (**)(void *, void))(*(void *)a1 + 88);
  uint64_t v4 = *(void *)(*(void *)a1 + 72);
  unint64_t v3 = *(void **)(*(void *)a1 + 80);
  uint64_t v5 = *(void *)(*(void *)a1 + 64);
  (*(void (**)(void))(*(void *)a1 + 96))();
  (*(void (**)(void *, uint64_t))(v4 + 8))(v3, v5);
  v2(v1, 0);
  free(v3);

  free(v1);
}

uint64_t sub_CD38(void *a1, void *a2)
{
  unint64_t v3 = v2;
  uint64_t v6 = *v2;
  if ((*v2 & 0xC000000000000001) != 0)
  {
    if (v6 < 0) {
      uint64_t v7 = *v2;
    }
    else {
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFF8;
    }
    swift_bridgeObjectRetain();
    id v8 = a2;
    uint64_t v9 = sub_133E0();

    if (v9)
    {
      swift_bridgeObjectRelease();

      sub_11350();
      swift_unknownObjectRetain();
      swift_dynamicCast();
      *a1 = v27;
      swift_unknownObjectRelease();
      return 0;
    }
    uint64_t result = sub_133D0();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    Swift::Int v22 = sub_EF44(v7, result + 1);
    uint64_t v28 = (void *)v22;
    if (*(void *)(v22 + 24) <= *(void *)(v22 + 16))
    {
      id v26 = v8;
      sub_D2DC();
      uint64_t v23 = v28;
    }
    else
    {
      uint64_t v23 = (void *)v22;
      id v24 = v8;
    }
    sub_D978((uint64_t)v8, v23);
    *unint64_t v3 = (uint64_t)v23;
  }
  else
  {
    Swift::Int v11 = *(void *)(v6 + 40);
    swift_bridgeObjectRetain();
    Swift::Int v12 = sub_13360(v11);
    uint64_t v13 = -1 << *(unsigned char *)(v6 + 32);
    unint64_t v14 = v12 & ~v13;
    if ((*(void *)(v6 + 56 + ((v14 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v14))
    {
      sub_11350();
      id v15 = *(id *)(*(void *)(v6 + 48) + 8 * v14);
      char v16 = sub_13370();

      if (v16)
      {
LABEL_12:

        swift_bridgeObjectRelease();
        uint64_t v20 = *(void **)(*(void *)(*v3 + 48) + 8 * v14);
        *a1 = v20;
        id v21 = v20;
        return 0;
      }
      uint64_t v17 = ~v13;
      while (1)
      {
        unint64_t v14 = (v14 + 1) & v17;
        if (((*(void *)(v6 + 56 + ((v14 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v14) & 1) == 0) {
          break;
        }
        id v18 = *(id *)(*(void *)(v6 + 48) + 8 * v14);
        char v19 = sub_13370();

        if (v19) {
          goto LABEL_12;
        }
      }
    }
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v29 = *v3;
    *unint64_t v3 = 0x8000000000000000;
    id v8 = a2;
    sub_F12C((uint64_t)v8, v14, isUniquelyReferenced_nonNull_native);
    *unint64_t v3 = v29;
  }
  swift_bridgeObjectRelease();
  *a1 = v8;
  return 1;
}

uint64_t sub_CFB8(uint64_t a1, char *a2)
{
  unint64_t v3 = v2;
  uint64_t v6 = sub_131C0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *v2;
  sub_1145C(&qword_1F6D0, (void (*)(uint64_t))&type metadata accessor for UUID);
  swift_bridgeObjectRetain();
  id v33 = a2;
  uint64_t v11 = sub_13200();
  uint64_t v12 = -1 << *(unsigned char *)(v10 + 32);
  unint64_t v13 = v11 & ~v12;
  uint64_t v32 = v10 + 56;
  if ((*(void *)(v10 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13))
  {
    uint64_t v28 = v2;
    uint64_t v29 = a1;
    uint64_t v30 = ~v12;
    uint64_t v27 = v7;
    char v16 = *(void (**)(void, void, void))(v7 + 16);
    uint64_t v15 = v7 + 16;
    unint64_t v14 = v16;
    uint64_t v31 = *(void *)(v15 + 56);
    uint64_t v17 = (void (**)(char *, uint64_t))(v15 - 8);
    v26[1] = v15 & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
    while (1)
    {
      uint64_t v18 = v10;
      unint64_t v19 = v31 * v13;
      uint64_t v20 = v14;
      v14(v9, *(void *)(v10 + 48) + v31 * v13, v6);
      sub_1145C(&qword_1F6D8, (void (*)(uint64_t))&type metadata accessor for UUID);
      char v21 = sub_13210();
      Swift::Int v22 = *v17;
      (*v17)(v9, v6);
      if (v21) {
        break;
      }
      unint64_t v13 = (v13 + 1) & v30;
      uint64_t v10 = v18;
      unint64_t v14 = v20;
      if (((*(void *)(v32 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13) & 1) == 0)
      {
        swift_bridgeObjectRelease();
        unint64_t v3 = v28;
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
    unint64_t v14 = *(void (**)(void, void, void))(v7 + 16);
LABEL_7:
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    id v24 = v33;
    v14(v9, v33, v6);
    uint64_t v34 = *v3;
    *unint64_t v3 = 0x8000000000000000;
    sub_F2A4((uint64_t)v9, v13, isUniquelyReferenced_nonNull_native);
    *unint64_t v3 = v34;
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(a1, v24, v6);
    return 1;
  }
}

uint64_t sub_D2DC()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_DCC4(&qword_1F6B0);
  uint64_t v3 = sub_13410();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v28 = v0;
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v6 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v7 = ~(-1 << v5);
    }
    else {
      uint64_t v7 = -1;
    }
    unint64_t v8 = v7 & *(void *)(v2 + 56);
    int64_t v9 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v10 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v12 = 0;
    while (1)
    {
      if (v8)
      {
        unint64_t v14 = __clz(__rbit64(v8));
        v8 &= v8 - 1;
        unint64_t v15 = v14 | (v12 << 6);
      }
      else
      {
        int64_t v16 = v12 + 1;
        if (__OFADD__(v12, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v9) {
          goto LABEL_33;
        }
        unint64_t v17 = v6[v16];
        ++v12;
        if (!v17)
        {
          int64_t v12 = v16 + 1;
          if (v16 + 1 >= v9) {
            goto LABEL_33;
          }
          unint64_t v17 = v6[v12];
          if (!v17)
          {
            int64_t v12 = v16 + 2;
            if (v16 + 2 >= v9) {
              goto LABEL_33;
            }
            unint64_t v17 = v6[v12];
            if (!v17)
            {
              int64_t v18 = v16 + 3;
              if (v18 >= v9)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v28;
                uint64_t v27 = 1 << *(unsigned char *)(v2 + 32);
                if (v27 > 63) {
                  bzero((void *)(v2 + 56), ((unint64_t)(v27 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v6 = -1 << v27;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v17 = v6[v18];
              if (!v17)
              {
                while (1)
                {
                  int64_t v12 = v18 + 1;
                  if (__OFADD__(v18, 1)) {
                    goto LABEL_39;
                  }
                  if (v12 >= v9) {
                    goto LABEL_33;
                  }
                  unint64_t v17 = v6[v12];
                  ++v18;
                  if (v17) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v12 = v18;
            }
          }
        }
LABEL_23:
        unint64_t v8 = (v17 - 1) & v17;
        unint64_t v15 = __clz(__rbit64(v17)) + (v12 << 6);
      }
      uint64_t v19 = *(void *)(*(void *)(v2 + 48) + 8 * v15);
      uint64_t result = sub_13360(*(void *)(v4 + 40));
      uint64_t v20 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v21 = result & ~v20;
      unint64_t v22 = v21 >> 6;
      if (((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6))) != 0)
      {
        unint64_t v13 = __clz(__rbit64((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
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
          uint64_t v26 = *(void *)(v10 + 8 * v22);
        }
        while (v26 == -1);
        unint64_t v13 = __clz(__rbit64(~v26)) + (v22 << 6);
      }
      *(void *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
      *(void *)(*(void *)(v4 + 48) + 8 * v13) = v19;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

uint64_t sub_D57C()
{
  uint64_t v1 = v0;
  uint64_t v42 = sub_131C0();
  uint64_t v2 = *(void *)(v42 - 8);
  __chkstk_darwin(v42);
  char v41 = (char *)&v35 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = *v0;
  sub_DCC4(&qword_1F6E0);
  uint64_t v5 = sub_13410();
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
    id v35 = v0;
    int64_t v36 = (unint64_t)(v7 + 63) >> 6;
    uint64_t v39 = v2;
    uint64_t v11 = v5 + 56;
    uint64_t result = swift_retain();
    int64_t v13 = 0;
    uint64_t v38 = v6;
    unint64_t v14 = v41;
    uint64_t v15 = v42;
    while (1)
    {
      if (v10)
      {
        unint64_t v17 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        int64_t v40 = v13;
        unint64_t v18 = v17 | (v13 << 6);
      }
      else
      {
        int64_t v19 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v19 >= v36) {
          goto LABEL_33;
        }
        unint64_t v20 = v37[v19];
        int64_t v21 = v13 + 1;
        if (!v20)
        {
          int64_t v21 = v13 + 2;
          if (v13 + 2 >= v36) {
            goto LABEL_33;
          }
          unint64_t v20 = v37[v21];
          if (!v20)
          {
            int64_t v21 = v13 + 3;
            if (v13 + 3 >= v36) {
              goto LABEL_33;
            }
            unint64_t v20 = v37[v21];
            if (!v20)
            {
              uint64_t v22 = v13 + 4;
              if (v13 + 4 >= v36)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v35;
                uint64_t v34 = 1 << *(unsigned char *)(v4 + 32);
                if (v34 > 63) {
                  bzero(v37, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v37 = -1 << v34;
                }
                *(void *)(v4 + 16) = 0;
                break;
              }
              unint64_t v20 = v37[v22];
              if (!v20)
              {
                while (1)
                {
                  int64_t v21 = v22 + 1;
                  if (__OFADD__(v22, 1)) {
                    goto LABEL_39;
                  }
                  if (v21 >= v36) {
                    goto LABEL_33;
                  }
                  unint64_t v20 = v37[v21];
                  ++v22;
                  if (v20) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v21 = v13 + 4;
            }
          }
        }
LABEL_23:
        unint64_t v10 = (v20 - 1) & v20;
        int64_t v40 = v21;
        unint64_t v18 = __clz(__rbit64(v20)) + (v21 << 6);
      }
      uint64_t v23 = v4;
      uint64_t v24 = *(void *)(v4 + 48);
      uint64_t v25 = *(void *)(v39 + 72);
      uint64_t v26 = *(void (**)(char *, unint64_t, uint64_t))(v39 + 32);
      v26(v14, v24 + v25 * v18, v15);
      uint64_t v6 = v38;
      sub_1145C(&qword_1F6D0, (void (*)(uint64_t))&type metadata accessor for UUID);
      uint64_t result = sub_13200();
      uint64_t v27 = -1 << *(unsigned char *)(v6 + 32);
      unint64_t v28 = result & ~v27;
      unint64_t v29 = v28 >> 6;
      if (((-1 << v28) & ~*(void *)(v11 + 8 * (v28 >> 6))) != 0)
      {
        unint64_t v16 = __clz(__rbit64((-1 << v28) & ~*(void *)(v11 + 8 * (v28 >> 6)))) | v28 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v30 = 0;
        unint64_t v31 = (unint64_t)(63 - v27) >> 6;
        do
        {
          if (++v29 == v31 && (v30 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v32 = v29 == v31;
          if (v29 == v31) {
            unint64_t v29 = 0;
          }
          v30 |= v32;
          uint64_t v33 = *(void *)(v11 + 8 * v29);
        }
        while (v33 == -1);
        unint64_t v16 = __clz(__rbit64(~v33)) + (v29 << 6);
      }
      *(void *)(v11 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
      uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))v26)(*(void *)(v6 + 48) + v16 * v25, v41, v42);
      ++*(void *)(v6 + 16);
      uint64_t v4 = v23;
      int64_t v13 = v40;
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v6;
  return result;
}

unint64_t sub_D978(uint64_t a1, void *a2)
{
  sub_13360(a2[5]);
  unint64_t result = sub_133B0();
  *(void *)((char *)a2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 56) |= 1 << result;
  *(void *)(a2[6] + 8 * result) = a1;
  ++a2[2];
  return result;
}

uint64_t sub_D9FC(uint64_t isStackAllocationSafe)
{
  uint64_t v2 = isStackAllocationSafe;
  char v3 = *(unsigned char *)(isStackAllocationSafe + 32);
  unint64_t v4 = (unint64_t)((1 << v3) + 63) >> 6;
  size_t v5 = 8 * v4;
  if ((v3 & 0x3Fu) <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    __chkstk_darwin(isStackAllocationSafe);
    bzero((char *)&v11 - ((v5 + 15) & 0x3FFFFFFFFFFFFFF0), v5);
    sub_DD08((unint64_t *)((char *)&v11 - ((v5 + 15) & 0x3FFFFFFFFFFFFFF0)), v4, v2);
    uint64_t v7 = v6;
    swift_release();
    if (v1) {
      swift_willThrow();
    }
  }
  else
  {
    uint64_t v8 = (void *)swift_slowAlloc();
    bzero(v8, v5);
    sub_DD08((unint64_t *)v8, v4, v2);
    uint64_t v7 = v9;
    swift_release();
    swift_slowDealloc();
  }
  return v7;
}

uint64_t sub_DB60(uint64_t isStackAllocationSafe)
{
  uint64_t v2 = isStackAllocationSafe;
  char v3 = *(unsigned char *)(isStackAllocationSafe + 32);
  unint64_t v4 = (unint64_t)((1 << v3) + 63) >> 6;
  size_t v5 = 8 * v4;
  if ((v3 & 0x3Fu) <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    __chkstk_darwin(isStackAllocationSafe);
    bzero((char *)&v11 - ((v5 + 15) & 0x3FFFFFFFFFFFFFF0), v5);
    sub_DEE0((unint64_t *)((char *)&v11 - ((v5 + 15) & 0x3FFFFFFFFFFFFFF0)), v4, v2);
    uint64_t v7 = v6;
    swift_release();
    if (v1) {
      swift_willThrow();
    }
  }
  else
  {
    uint64_t v8 = (void *)swift_slowAlloc();
    bzero(v8, v5);
    sub_DEE0((unint64_t *)v8, v4, v2);
    uint64_t v7 = v9;
    swift_release();
    swift_slowDealloc();
  }
  return v7;
}

uint64_t sub_DCC4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

void sub_DD08(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v21 = 0;
  int64_t v4 = 0;
  uint64_t v5 = a3 + 56;
  uint64_t v6 = 1 << *(unsigned char *)(a3 + 32);
  uint64_t v7 = -1;
  if (v6 < 64) {
    uint64_t v7 = ~(-1 << v6);
  }
  unint64_t v8 = v7 & *(void *)(a3 + 56);
  int64_t v9 = (unint64_t)(v6 + 63) >> 6;
  while (1)
  {
    if (v8)
    {
      unint64_t v10 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v11 = v10 | (v4 << 6);
      goto LABEL_5;
    }
    int64_t v15 = v4 + 1;
    if (__OFADD__(v4, 1))
    {
      __break(1u);
      goto LABEL_26;
    }
    if (v15 >= v9) {
      goto LABEL_24;
    }
    unint64_t v16 = *(void *)(v5 + 8 * v15);
    ++v4;
    if (!v16)
    {
      int64_t v4 = v15 + 1;
      if (v15 + 1 >= v9) {
        goto LABEL_24;
      }
      unint64_t v16 = *(void *)(v5 + 8 * v4);
      if (!v16)
      {
        int64_t v4 = v15 + 2;
        if (v15 + 2 >= v9) {
          goto LABEL_24;
        }
        unint64_t v16 = *(void *)(v5 + 8 * v4);
        if (!v16) {
          break;
        }
      }
    }
LABEL_20:
    unint64_t v8 = (v16 - 1) & v16;
    unint64_t v11 = __clz(__rbit64(v16)) + (v4 << 6);
LABEL_5:
    id v12 = *(id *)(*(void *)(a3 + 48) + 8 * v11);
    id v13 = [v12 sharee];
    unint64_t v14 = (char *)[v13 type];

    if (v14 != (unsigned char *)&dword_0 + 2)
    {
      *(unint64_t *)((char *)a1 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
      if (__OFADD__(v21++, 1))
      {
        __break(1u);
LABEL_24:
        swift_retain();
        sub_E0B8(a1, a2, v21, a3);
        return;
      }
    }
  }
  int64_t v17 = v15 + 3;
  if (v17 >= v9) {
    goto LABEL_24;
  }
  unint64_t v16 = *(void *)(v5 + 8 * v17);
  if (v16)
  {
    int64_t v4 = v17;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v4 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v4 >= v9) {
      goto LABEL_24;
    }
    unint64_t v16 = *(void *)(v5 + 8 * v4);
    ++v17;
    if (v16) {
      goto LABEL_20;
    }
  }
LABEL_26:
  __break(1u);
}

void sub_DEE0(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v21 = 0;
  int64_t v4 = 0;
  uint64_t v5 = a3 + 56;
  uint64_t v6 = 1 << *(unsigned char *)(a3 + 32);
  uint64_t v7 = -1;
  if (v6 < 64) {
    uint64_t v7 = ~(-1 << v6);
  }
  unint64_t v8 = v7 & *(void *)(a3 + 56);
  int64_t v9 = (unint64_t)(v6 + 63) >> 6;
  while (1)
  {
    if (v8)
    {
      unint64_t v10 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v11 = v10 | (v4 << 6);
      goto LABEL_5;
    }
    int64_t v15 = v4 + 1;
    if (__OFADD__(v4, 1))
    {
      __break(1u);
      goto LABEL_26;
    }
    if (v15 >= v9) {
      goto LABEL_24;
    }
    unint64_t v16 = *(void *)(v5 + 8 * v15);
    ++v4;
    if (!v16)
    {
      int64_t v4 = v15 + 1;
      if (v15 + 1 >= v9) {
        goto LABEL_24;
      }
      unint64_t v16 = *(void *)(v5 + 8 * v4);
      if (!v16)
      {
        int64_t v4 = v15 + 2;
        if (v15 + 2 >= v9) {
          goto LABEL_24;
        }
        unint64_t v16 = *(void *)(v5 + 8 * v4);
        if (!v16) {
          break;
        }
      }
    }
LABEL_20:
    unint64_t v8 = (v16 - 1) & v16;
    unint64_t v11 = __clz(__rbit64(v16)) + (v4 << 6);
LABEL_5:
    id v12 = *(id *)(*(void *)(a3 + 48) + 8 * v11);
    id v13 = [v12 sharee];
    unint64_t v14 = (char *)[v13 type];

    if (v14 == (unsigned char *)&dword_0 + 2)
    {
      *(unint64_t *)((char *)a1 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
      if (__OFADD__(v21++, 1))
      {
        __break(1u);
LABEL_24:
        swift_retain();
        sub_E0B8(a1, a2, v21, a3);
        return;
      }
    }
  }
  int64_t v17 = v15 + 3;
  if (v17 >= v9) {
    goto LABEL_24;
  }
  unint64_t v16 = *(void *)(v5 + 8 * v17);
  if (v16)
  {
    int64_t v4 = v17;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v4 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v4 >= v9) {
      goto LABEL_24;
    }
    unint64_t v16 = *(void *)(v5 + 8 * v4);
    ++v17;
    if (v16) {
      goto LABEL_20;
    }
  }
LABEL_26:
  __break(1u);
}

uint64_t sub_E0B8(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  if (!a3)
  {
    int64_t v9 = &_swiftEmptySetSingleton;
LABEL_36:
    swift_release();
    return (uint64_t)v9;
  }
  uint64_t v5 = a3;
  if (*(void *)(a4 + 16) == a3) {
    return v4;
  }
  sub_DCC4(&qword_1F6B0);
  uint64_t result = sub_13430();
  int64_t v9 = (void *)result;
  unint64_t v29 = a1;
  if (a2 < 1) {
    unint64_t v10 = 0;
  }
  else {
    unint64_t v10 = *a1;
  }
  uint64_t v11 = 0;
  uint64_t v12 = result + 56;
  while (1)
  {
    if (v10)
    {
      unint64_t v13 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v14 = v13 | (v11 << 6);
      goto LABEL_24;
    }
    uint64_t v15 = v11 + 1;
    if (__OFADD__(v11, 1)) {
      goto LABEL_39;
    }
    if (v15 >= a2) {
      goto LABEL_36;
    }
    unint64_t v16 = v29[v15];
    ++v11;
    if (!v16)
    {
      uint64_t v11 = v15 + 1;
      if (v15 + 1 >= a2) {
        goto LABEL_36;
      }
      unint64_t v16 = v29[v11];
      if (!v16)
      {
        uint64_t v11 = v15 + 2;
        if (v15 + 2 >= a2) {
          goto LABEL_36;
        }
        unint64_t v16 = v29[v11];
        if (!v16) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v10 = (v16 - 1) & v16;
    unint64_t v14 = __clz(__rbit64(v16)) + (v11 << 6);
LABEL_24:
    Swift::Int v18 = v9[5];
    id v19 = *(id *)(*(void *)(v4 + 48) + 8 * v14);
    uint64_t result = sub_13360(v18);
    uint64_t v20 = -1 << *((unsigned char *)v9 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)(v12 + 8 * (v21 >> 6))) != 0)
    {
      unint64_t v23 = __clz(__rbit64((-1 << v21) & ~*(void *)(v12 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v24 = 0;
      unint64_t v25 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v25 && (v24 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        BOOL v26 = v22 == v25;
        if (v22 == v25) {
          unint64_t v22 = 0;
        }
        v24 |= v26;
        uint64_t v27 = *(void *)(v12 + 8 * v22);
      }
      while (v27 == -1);
      unint64_t v23 = __clz(__rbit64(~v27)) + (v22 << 6);
    }
    *(void *)(v12 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
    *(void *)(v9[6] + 8 * v23) = v19;
    ++v9[2];
    if (__OFSUB__(v5--, 1))
    {
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    if (!v5) {
      goto LABEL_36;
    }
  }
  uint64_t v17 = v15 + 3;
  if (v17 >= a2) {
    goto LABEL_36;
  }
  unint64_t v16 = v29[v17];
  if (v16)
  {
    uint64_t v11 = v17;
    goto LABEL_23;
  }
  while (1)
  {
    uint64_t v11 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v11 >= a2) {
      goto LABEL_36;
    }
    unint64_t v16 = v29[v11];
    ++v17;
    if (v16) {
      goto LABEL_23;
    }
  }
LABEL_40:
  __break(1u);
  return result;
}

uint64_t sub_E318(uint64_t a1, int a2)
{
  char v3 = v2;
  uint64_t v5 = sub_131C0();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  unint64_t v8 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *v2;
  sub_DCC4(&qword_1F750);
  int v46 = a2;
  uint64_t v10 = sub_134B0();
  uint64_t v11 = v9;
  uint64_t v12 = v10;
  if (!*(void *)(v11 + 16)) {
    goto LABEL_41;
  }
  uint64_t v13 = 1 << *(unsigned char *)(v11 + 32);
  uint64_t v14 = *(void *)(v11 + 64);
  uint64_t v42 = (void *)(v11 + 64);
  if (v13 < 64) {
    uint64_t v15 = ~(-1 << v13);
  }
  else {
    uint64_t v15 = -1;
  }
  unint64_t v16 = v15 & v14;
  int64_t v40 = v3;
  int64_t v41 = (unint64_t)(v13 + 63) >> 6;
  uint64_t v43 = (void (**)(char *, unint64_t, uint64_t))(v6 + 16);
  uint64_t v45 = v6;
  uint64_t v17 = (void (**)(char *, unint64_t, uint64_t))(v6 + 32);
  uint64_t v18 = v10 + 64;
  uint64_t result = swift_retain();
  int64_t v20 = 0;
  for (i = v11; ; uint64_t v11 = i)
  {
    if (v16)
    {
      unint64_t v22 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      unint64_t v23 = v22 | (v20 << 6);
      goto LABEL_22;
    }
    int64_t v24 = v20 + 1;
    if (__OFADD__(v20, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v24 >= v41) {
      break;
    }
    unint64_t v25 = v42;
    unint64_t v26 = v42[v24];
    ++v20;
    if (!v26)
    {
      int64_t v20 = v24 + 1;
      if (v24 + 1 >= v41) {
        goto LABEL_34;
      }
      unint64_t v26 = v42[v20];
      if (!v26)
      {
        int64_t v27 = v24 + 2;
        if (v27 >= v41)
        {
LABEL_34:
          swift_release();
          char v3 = v40;
          if ((v46 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v26 = v42[v27];
        if (!v26)
        {
          while (1)
          {
            int64_t v20 = v27 + 1;
            if (__OFADD__(v27, 1)) {
              goto LABEL_43;
            }
            if (v20 >= v41) {
              goto LABEL_34;
            }
            unint64_t v26 = v42[v20];
            ++v27;
            if (v26) {
              goto LABEL_21;
            }
          }
        }
        int64_t v20 = v27;
      }
    }
LABEL_21:
    unint64_t v16 = (v26 - 1) & v26;
    unint64_t v23 = __clz(__rbit64(v26)) + (v20 << 6);
LABEL_22:
    uint64_t v28 = *(void *)(v45 + 72);
    unint64_t v29 = *(void *)(v11 + 48) + v28 * v23;
    if (v46)
    {
      (*v17)(v8, v29, v5);
      uint64_t v30 = *(void *)(*(void *)(v11 + 56) + 8 * v23);
    }
    else
    {
      (*v43)(v8, v29, v5);
      uint64_t v30 = *(void *)(*(void *)(v11 + 56) + 8 * v23);
      swift_bridgeObjectRetain();
    }
    sub_1145C(&qword_1F6D0, (void (*)(uint64_t))&type metadata accessor for UUID);
    uint64_t result = sub_13200();
    uint64_t v31 = -1 << *(unsigned char *)(v12 + 32);
    unint64_t v32 = result & ~v31;
    unint64_t v33 = v32 >> 6;
    if (((-1 << v32) & ~*(void *)(v18 + 8 * (v32 >> 6))) != 0)
    {
      unint64_t v21 = __clz(__rbit64((-1 << v32) & ~*(void *)(v18 + 8 * (v32 >> 6)))) | v32 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v34 = 0;
      unint64_t v35 = (unint64_t)(63 - v31) >> 6;
      do
      {
        if (++v33 == v35 && (v34 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v36 = v33 == v35;
        if (v33 == v35) {
          unint64_t v33 = 0;
        }
        v34 |= v36;
        uint64_t v37 = *(void *)(v18 + 8 * v33);
      }
      while (v37 == -1);
      unint64_t v21 = __clz(__rbit64(~v37)) + (v33 << 6);
    }
    *(void *)(v18 + ((v21 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v21;
    uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))*v17)(*(void *)(v12 + 48) + v28 * v21, v8, v5);
    *(void *)(*(void *)(v12 + 56) + 8 * v21) = v30;
    ++*(void *)(v12 + 16);
  }
  swift_release();
  char v3 = v40;
  unint64_t v25 = v42;
  if ((v46 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v38 = 1 << *(unsigned char *)(v11 + 32);
  if (v38 >= 64) {
    bzero(v25, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v25 = -1 << v38;
  }
  *(void *)(v11 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *char v3 = v12;
  return result;
}

unint64_t sub_E73C(int64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_131C0();
  uint64_t v5 = *(void *)(v4 - 8);
  unint64_t result = __chkstk_darwin(v4);
  unint64_t v8 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v10 = (a1 + 1) & ~v9;
  if (((1 << v10) & *(void *)(a2 + 64 + 8 * (v10 >> 6))) != 0)
  {
    uint64_t v11 = ~v9;
    uint64_t v34 = a2 + 64;
    unint64_t result = sub_133A0();
    uint64_t v12 = v34;
    if ((*(void *)(v34 + 8 * (v10 >> 6)) & (1 << v10)) != 0)
    {
      unint64_t v31 = (result + 1) & v11;
      unint64_t v32 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
      uint64_t v33 = v5 + 16;
      uint64_t v13 = (uint64_t (**)(char *, uint64_t))(v5 + 8);
      uint64_t v14 = *(void *)(v5 + 72);
      do
      {
        uint64_t v15 = v14;
        int64_t v16 = v14 * v10;
        v32(v8, *(void *)(a2 + 48) + v14 * v10, v4);
        sub_1145C(&qword_1F6D0, (void (*)(uint64_t))&type metadata accessor for UUID);
        uint64_t v17 = sub_13200();
        unint64_t result = (*v13)(v8, v4);
        unint64_t v18 = v17 & v11;
        if (a1 >= (uint64_t)v31)
        {
          if (v18 >= v31 && a1 >= (uint64_t)v18)
          {
LABEL_16:
            uint64_t v21 = *(void *)(a2 + 48);
            uint64_t v14 = v15;
            unint64_t result = v21 + v15 * a1;
            if (v15 * a1 < v16 || result >= v21 + v16 + v15)
            {
              unint64_t result = swift_arrayInitWithTakeFrontToBack();
            }
            else if (v15 * a1 != v16)
            {
              unint64_t result = swift_arrayInitWithTakeBackToFront();
            }
            uint64_t v22 = *(void *)(a2 + 56);
            unint64_t v23 = (void *)(v22 + 8 * a1);
            int64_t v24 = (void *)(v22 + 8 * v10);
            uint64_t v12 = v34;
            if (a1 != v10 || (a1 = v10, v23 >= v24 + 1))
            {
              void *v23 = *v24;
              a1 = v10;
            }
            goto LABEL_5;
          }
        }
        else if (v18 >= v31 || a1 >= (uint64_t)v18)
        {
          goto LABEL_16;
        }
        uint64_t v12 = v34;
        uint64_t v14 = v15;
LABEL_5:
        unint64_t v10 = (v10 + 1) & v11;
      }
      while (((*(void *)(v12 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
    }
    unint64_t v25 = (uint64_t *)(v12 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v26 = *v25;
    uint64_t v27 = (-1 << a1) - 1;
  }
  else
  {
    unint64_t v25 = (uint64_t *)(a2 + 64 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v27 = *v25;
    uint64_t v26 = (-1 << a1) - 1;
  }
  uint64_t *v25 = v27 & v26;
  uint64_t v28 = *(void *)(a2 + 16);
  BOOL v29 = __OFSUB__(v28, 1);
  uint64_t v30 = v28 - 1;
  if (v29)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v30;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_EA34(unint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v8 = a4[6];
  uint64_t v9 = sub_131C0();
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v8 + *(void *)(*(void *)(v9 - 8) + 72) * a1, a2, v9);
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

unint64_t sub_EAEC(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = a1;
  uint64_t v4 = sub_131C0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = v2;
  uint64_t v8 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v9 = a2 & ~v8;
  uint64_t v18 = v2 + 64;
  if ((*(void *)(v2 + 64 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9))
  {
    uint64_t v10 = ~v8;
    uint64_t v13 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
    uint64_t v12 = v5 + 16;
    uint64_t v11 = v13;
    uint64_t v14 = *(void *)(v12 + 56);
    do
    {
      v11(v7, *(void *)(v20 + 48) + v14 * v9, v4);
      sub_1145C(&qword_1F6D8, (void (*)(uint64_t))&type metadata accessor for UUID);
      char v15 = sub_13210();
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

void *sub_ECAC()
{
  uint64_t v1 = sub_131C0();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_DCC4(&qword_1F750);
  unint64_t v23 = v0;
  uint64_t v5 = *v0;
  uint64_t v6 = sub_134A0();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16))
  {
LABEL_23:
    uint64_t result = (void *)swift_release();
    uint64_t *v23 = v7;
    return result;
  }
  uint64_t result = (void *)(v6 + 64);
  unint64_t v9 = (unint64_t)((1 << *(unsigned char *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v5 + 64 + 8 * v9) {
    uint64_t result = memmove(result, (const void *)(v5 + 64), 8 * v9);
  }
  int64_t v10 = 0;
  *(void *)(v7 + 16) = *(void *)(v5 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v5 + 64);
  uint64_t v24 = v5 + 64;
  int64_t v25 = (unint64_t)(v11 + 63) >> 6;
  uint64_t v26 = v2 + 32;
  uint64_t v27 = v2 + 16;
  while (1)
  {
    if (v13)
    {
      unint64_t v14 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v15 = v14 | (v10 << 6);
      goto LABEL_9;
    }
    int64_t v19 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v19 >= v25) {
      goto LABEL_23;
    }
    unint64_t v20 = *(void *)(v24 + 8 * v19);
    ++v10;
    if (!v20)
    {
      int64_t v10 = v19 + 1;
      if (v19 + 1 >= v25) {
        goto LABEL_23;
      }
      unint64_t v20 = *(void *)(v24 + 8 * v10);
      if (!v20) {
        break;
      }
    }
LABEL_22:
    unint64_t v13 = (v20 - 1) & v20;
    unint64_t v15 = __clz(__rbit64(v20)) + (v10 << 6);
LABEL_9:
    unint64_t v16 = *(void *)(v2 + 72) * v15;
    (*(void (**)(char *, unint64_t, uint64_t))(v2 + 16))(v4, *(void *)(v5 + 48) + v16, v1);
    uint64_t v17 = 8 * v15;
    uint64_t v18 = *(void *)(*(void *)(v5 + 56) + 8 * v15);
    (*(void (**)(unint64_t, char *, uint64_t))(v2 + 32))(*(void *)(v7 + 48) + v16, v4, v1);
    *(void *)(*(void *)(v7 + 56) + v17) = v18;
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v21 = v19 + 2;
  if (v21 >= v25) {
    goto LABEL_23;
  }
  unint64_t v20 = *(void *)(v24 + 8 * v21);
  if (v20)
  {
    int64_t v10 = v21;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v10 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v10 >= v25) {
      goto LABEL_23;
    }
    unint64_t v20 = *(void *)(v24 + 8 * v10);
    ++v21;
    if (v20) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

Swift::Int sub_EF44(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    sub_DCC4(&qword_1F6B0);
    uint64_t v2 = sub_13420();
    uint64_t v14 = v2;
    sub_133C0();
    if (sub_133F0())
    {
      sub_11350();
      do
      {
        swift_dynamicCast();
        uint64_t v2 = v14;
        if (*(void *)(v14 + 24) <= *(void *)(v14 + 16))
        {
          sub_D2DC();
          uint64_t v2 = v14;
        }
        Swift::Int result = sub_13360(*(void *)(v2 + 40));
        uint64_t v4 = v2 + 56;
        uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
        unint64_t v6 = result & ~v5;
        unint64_t v7 = v6 >> 6;
        if (((-1 << v6) & ~*(void *)(v2 + 56 + 8 * (v6 >> 6))) != 0)
        {
          unint64_t v8 = __clz(__rbit64((-1 << v6) & ~*(void *)(v2 + 56 + 8 * (v6 >> 6)))) | v6 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          char v9 = 0;
          unint64_t v10 = (unint64_t)(63 - v5) >> 6;
          do
          {
            if (++v7 == v10 && (v9 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            BOOL v11 = v7 == v10;
            if (v7 == v10) {
              unint64_t v7 = 0;
            }
            v9 |= v11;
            uint64_t v12 = *(void *)(v4 + 8 * v7);
          }
          while (v12 == -1);
          unint64_t v8 = __clz(__rbit64(~v12)) + (v7 << 6);
        }
        *(void *)(v4 + ((v8 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v8;
        *(void *)(*(void *)(v2 + 48) + 8 * v8) = v13;
        ++*(void *)(v2 + 16);
      }
      while (sub_133F0());
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return (Swift::Int)&_swiftEmptySetSingleton;
  }
  return v2;
}

void sub_F12C(uint64_t a1, unint64_t a2, char a3)
{
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  if (a3)
  {
    sub_D2DC();
  }
  else
  {
    if (v7 > v6)
    {
      sub_F544();
      goto LABEL_14;
    }
    sub_F994();
  }
  uint64_t v8 = *v3;
  Swift::Int v9 = sub_13360(*(void *)(*v3 + 40));
  uint64_t v10 = -1 << *(unsigned char *)(v8 + 32);
  a2 = v9 & ~v10;
  if ((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    sub_11350();
    id v11 = *(id *)(*(void *)(v8 + 48) + 8 * a2);
    char v12 = sub_13370();

    if (v12)
    {
LABEL_13:
      sub_13500();
      __break(1u);
    }
    else
    {
      uint64_t v13 = ~v10;
      while (1)
      {
        a2 = (a2 + 1) & v13;
        if (((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
          break;
        }
        id v14 = *(id *)(*(void *)(v8 + 48) + 8 * a2);
        char v15 = sub_13370();

        if (v15) {
          goto LABEL_13;
        }
      }
    }
  }
LABEL_14:
  uint64_t v16 = *v3;
  *(void *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(void *)(*(void *)(v16 + 48) + 8 * a2) = a1;
  uint64_t v17 = *(void *)(v16 + 16);
  BOOL v18 = __OFADD__(v17, 1);
  uint64_t v19 = v17 + 1;
  if (v18) {
    __break(1u);
  }
  else {
    *(void *)(v16 + 16) = v19;
  }
}

uint64_t sub_F2A4(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t v31 = a1;
  uint64_t v6 = sub_131C0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  Swift::Int v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v10 = *(void *)(*v3 + 16);
  unint64_t v11 = *(void *)(*v3 + 24);
  uint64_t v28 = v3;
  uint64_t v29 = v7;
  if (v11 > v10 && (a3 & 1) != 0) {
    goto LABEL_12;
  }
  if (a3)
  {
    sub_D57C();
  }
  else
  {
    if (v11 > v10)
    {
      sub_F6F0();
      goto LABEL_12;
    }
    sub_FC10();
  }
  uint64_t v12 = *v3;
  sub_1145C(&qword_1F6D0, (void (*)(uint64_t))&type metadata accessor for UUID);
  uint64_t v13 = sub_13200();
  uint64_t v14 = -1 << *(unsigned char *)(v12 + 32);
  a2 = v13 & ~v14;
  uint64_t v30 = v12;
  uint64_t v15 = v12 + 56;
  if ((*(void *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    uint64_t v16 = ~v14;
    uint64_t v19 = *(void (**)(char *, unint64_t, uint64_t))(v7 + 16);
    uint64_t v18 = v7 + 16;
    uint64_t v17 = v19;
    uint64_t v20 = *(void *)(v18 + 56);
    do
    {
      v17(v9, *(void *)(v30 + 48) + v20 * a2, v6);
      sub_1145C(&qword_1F6D8, (void (*)(uint64_t))&type metadata accessor for UUID);
      char v21 = sub_13210();
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
  uint64_t result = sub_13500();
  __break(1u);
  return result;
}

id sub_F544()
{
  uint64_t v1 = v0;
  sub_DCC4(&qword_1F6B0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_13400();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    id result = (id)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (id)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 56), 8 * v7);
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
    int64_t v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v18 >= v13) {
      goto LABEL_28;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      int64_t v9 = v18 + 1;
      if (v18 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v19 = *(void *)(v6 + 8 * v9);
      if (!v19)
      {
        int64_t v9 = v18 + 2;
        if (v18 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v19 = *(void *)(v6 + 8 * v9);
        if (!v19) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v19 - 1) & v19;
    unint64_t v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void **)(*(void *)(v2 + 48) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    id result = v17;
  }
  int64_t v20 = v18 + 3;
  if (v20 >= v13) {
    goto LABEL_28;
  }
  unint64_t v19 = *(void *)(v6 + 8 * v20);
  if (v19)
  {
    int64_t v9 = v20;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v9);
    ++v20;
    if (v19) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_F6F0()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_131C0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_DCC4(&qword_1F6E0);
  uint64_t v6 = *v0;
  uint64_t v7 = sub_13400();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
    id result = (void *)swift_release();
LABEL_27:
    *uint64_t v1 = v8;
    return result;
  }
  uint64_t v22 = v1;
  id result = (void *)(v7 + 56);
  unint64_t v10 = (unint64_t)((1 << *(unsigned char *)(v8 + 32)) + 63) >> 6;
  if (v8 != v6 || (unint64_t)result >= v6 + 56 + 8 * v10) {
    id result = memmove(result, (const void *)(v6 + 56), 8 * v10);
  }
  uint64_t v23 = v6 + 56;
  int64_t v11 = 0;
  *(void *)(v8 + 16) = *(void *)(v6 + 16);
  uint64_t v12 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v13 = -1;
  if (v12 < 64) {
    uint64_t v13 = ~(-1 << v12);
  }
  unint64_t v14 = v13 & *(void *)(v6 + 56);
  int64_t v24 = (unint64_t)(v12 + 63) >> 6;
  while (1)
  {
    if (v14)
    {
      unint64_t v15 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      unint64_t v16 = v15 | (v11 << 6);
      goto LABEL_9;
    }
    int64_t v18 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_29;
    }
    if (v18 >= v24) {
      goto LABEL_25;
    }
    unint64_t v19 = *(void *)(v23 + 8 * v18);
    ++v11;
    if (!v19)
    {
      int64_t v11 = v18 + 1;
      if (v18 + 1 >= v24) {
        goto LABEL_25;
      }
      unint64_t v19 = *(void *)(v23 + 8 * v11);
      if (!v19)
      {
        int64_t v11 = v18 + 2;
        if (v18 + 2 >= v24) {
          goto LABEL_25;
        }
        unint64_t v19 = *(void *)(v23 + 8 * v11);
        if (!v19) {
          break;
        }
      }
    }
LABEL_24:
    unint64_t v14 = (v19 - 1) & v19;
    unint64_t v16 = __clz(__rbit64(v19)) + (v11 << 6);
LABEL_9:
    unint64_t v17 = *(void *)(v3 + 72) * v16;
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v5, *(void *)(v6 + 48) + v17, v2);
    id result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(void *)(v8 + 48) + v17, v5, v2);
  }
  int64_t v20 = v18 + 3;
  if (v20 >= v24)
  {
LABEL_25:
    id result = (void *)swift_release();
    uint64_t v1 = v22;
    goto LABEL_27;
  }
  unint64_t v19 = *(void *)(v23 + 8 * v20);
  if (v19)
  {
    int64_t v11 = v20;
    goto LABEL_24;
  }
  while (1)
  {
    int64_t v11 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v11 >= v24) {
      goto LABEL_25;
    }
    unint64_t v19 = *(void *)(v23 + 8 * v11);
    ++v20;
    if (v19) {
      goto LABEL_24;
    }
  }
LABEL_29:
  __break(1u);
  return result;
}

uint64_t sub_F994()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_DCC4(&qword_1F6B0);
  uint64_t v3 = sub_13410();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t v28 = v0;
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v6 = v2 + 56;
  if (v5 < 64) {
    uint64_t v7 = ~(-1 << v5);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(v2 + 56);
  int64_t v9 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v10 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v12 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v15 = v14 | (v12 << 6);
      goto LABEL_24;
    }
    int64_t v16 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v9) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v12;
    if (!v17)
    {
      int64_t v12 = v16 + 1;
      if (v16 + 1 >= v9) {
        goto LABEL_33;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v12);
      if (!v17)
      {
        int64_t v12 = v16 + 2;
        if (v16 + 2 >= v9) {
          goto LABEL_33;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v12);
        if (!v17) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v12 << 6);
LABEL_24:
    Swift::Int v19 = *(void *)(v4 + 40);
    id v20 = *(id *)(*(void *)(v2 + 48) + 8 * v15);
    uint64_t result = sub_13360(v19);
    uint64_t v21 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v22 = result & ~v21;
    unint64_t v23 = v22 >> 6;
    if (((-1 << v22) & ~*(void *)(v10 + 8 * (v22 >> 6))) != 0)
    {
      unint64_t v13 = __clz(__rbit64((-1 << v22) & ~*(void *)(v10 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v24 = 0;
      unint64_t v25 = (unint64_t)(63 - v21) >> 6;
      do
      {
        if (++v23 == v25 && (v24 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v26 = v23 == v25;
        if (v23 == v25) {
          unint64_t v23 = 0;
        }
        v24 |= v26;
        uint64_t v27 = *(void *)(v10 + 8 * v23);
      }
      while (v27 == -1);
      unint64_t v13 = __clz(__rbit64(~v27)) + (v23 << 6);
    }
    *(void *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
    *(void *)(*(void *)(v4 + 48) + 8 * v13) = v20;
    ++*(void *)(v4 + 16);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v9)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v28;
    goto LABEL_35;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v12 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v12 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v12 >= v9) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v12);
    ++v18;
    if (v17) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_FC10()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_131C0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *v0;
  sub_DCC4(&qword_1F6E0);
  uint64_t v7 = sub_13410();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v1 = v8;
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
  unint64_t v14 = (uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32);
  uint64_t result = swift_retain();
  int64_t v16 = 0;
  while (1)
  {
    if (v12)
    {
      unint64_t v18 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v19 = v18 | (v16 << 6);
      goto LABEL_24;
    }
    int64_t v20 = v16 + 1;
    if (__OFADD__(v16, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v20 >= v36) {
      goto LABEL_33;
    }
    unint64_t v21 = *(void *)(v35 + 8 * v20);
    ++v16;
    if (!v21)
    {
      int64_t v16 = v20 + 1;
      if (v20 + 1 >= v36) {
        goto LABEL_33;
      }
      unint64_t v21 = *(void *)(v35 + 8 * v16);
      if (!v21)
      {
        int64_t v16 = v20 + 2;
        if (v20 + 2 >= v36) {
          goto LABEL_33;
        }
        unint64_t v21 = *(void *)(v35 + 8 * v16);
        if (!v21) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v19 = __clz(__rbit64(v21)) + (v16 << 6);
LABEL_24:
    uint64_t v23 = v6;
    uint64_t v24 = *(void *)(v6 + 48);
    uint64_t v25 = *(void *)(v38 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v38 + 16))(v5, v24 + v25 * v19, v2);
    sub_1145C(&qword_1F6D0, (void (*)(uint64_t))&type metadata accessor for UUID);
    uint64_t result = sub_13200();
    uint64_t v26 = -1 << *(unsigned char *)(v8 + 32);
    unint64_t v27 = result & ~v26;
    unint64_t v28 = v27 >> 6;
    if (((-1 << v27) & ~*(void *)(v13 + 8 * (v27 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v27) & ~*(void *)(v13 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v29 = 0;
      unint64_t v30 = (unint64_t)(63 - v26) >> 6;
      do
      {
        if (++v28 == v30 && (v29 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v31 = v28 == v30;
        if (v28 == v30) {
          unint64_t v28 = 0;
        }
        v29 |= v31;
        uint64_t v32 = *(void *)(v13 + 8 * v28);
      }
      while (v32 == -1);
      unint64_t v17 = __clz(__rbit64(~v32)) + (v28 << 6);
    }
    *(void *)(v13 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    uint64_t result = (*v14)(*(void *)(v8 + 48) + v17 * v25, v5, v2);
    ++*(void *)(v8 + 16);
    uint64_t v6 = v23;
  }
  int64_t v22 = v20 + 3;
  if (v22 >= v36)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v34;
    goto LABEL_35;
  }
  unint64_t v21 = *(void *)(v35 + 8 * v22);
  if (v21)
  {
    int64_t v16 = v22;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v16 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v16 >= v36) {
      goto LABEL_33;
    }
    unint64_t v21 = *(void *)(v35 + 8 * v16);
    ++v22;
    if (v21) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

void (*sub_FFC0(void *a1, uint64_t a2, char a3))(uint64_t **a1)
{
  uint64_t v4 = v3;
  uint64_t v8 = malloc(0x28uLL);
  *a1 = v8;
  v8[1] = a2;
  v8[2] = v3;
  uint64_t v9 = *v3;
  unint64_t v11 = sub_CAE8(a2);
  *((unsigned char *)v8 + 32) = v10 & 1;
  uint64_t v12 = *(void *)(v9 + 16);
  BOOL v13 = (v10 & 1) == 0;
  uint64_t v14 = v12 + v13;
  if (__OFADD__(v12, v13))
  {
    __break(1u);
  }
  else
  {
    char v15 = v10;
    uint64_t v16 = *(void *)(v9 + 24);
    if (v16 >= v14 && (a3 & 1) != 0)
    {
LABEL_7:
      v8[3] = v11;
      if (v15)
      {
LABEL_8:
        uint64_t v17 = *(void *)(*(void *)(*v4 + 56) + 8 * v11);
LABEL_12:
        *uint64_t v8 = v17;
        return sub_100F0;
      }
LABEL_11:
      uint64_t v17 = 0;
      goto LABEL_12;
    }
    if (v16 >= v14 && (a3 & 1) == 0)
    {
      sub_ECAC();
      goto LABEL_7;
    }
    sub_E318(v14, a3 & 1);
    unint64_t v18 = sub_CAE8(a2);
    if ((v15 & 1) == (v19 & 1))
    {
      unint64_t v11 = v18;
      v8[3] = v18;
      if (v15) {
        goto LABEL_8;
      }
      goto LABEL_11;
    }
  }
  sub_131C0();
  uint64_t result = (void (*)(uint64_t **))sub_13510();
  __break(1u);
  return result;
}

void sub_100F0(uint64_t **a1)
{
  uint64_t v1 = *a1;
  sub_1017C(*a1, *((unsigned char *)*a1 + 32), (uint64_t *)(*a1)[2], (*a1)[3], (*a1)[1]);
  swift_bridgeObjectRelease();

  free(v1);
}

uint64_t (*sub_10140(void *a1))(uint64_t result)
{
  *a1 = *v1;
  a1[1] = v1;
  *uint64_t v1 = 0x8000000000000000;
  return sub_10170;
}

uint64_t sub_10170(uint64_t result)
{
  **(void **)(result + 8) = *(void *)result;
  return result;
}

uint64_t sub_1017C(uint64_t *a1, char a2, uint64_t *a3, unint64_t a4, uint64_t a5)
{
  uint64_t v10 = sub_131C0();
  __chkstk_darwin(v10);
  BOOL v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = *a1;
  if (v14)
  {
    char v15 = (void *)*a3;
    if (a2)
    {
      *(void *)(v15[7] + 8 * a4) = v14;
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v11 + 16))(v13, a5);
      sub_EA34(a4, (uint64_t)v13, v14, v15);
    }
  }
  else if (a2)
  {
    swift_arrayDestroy();
    sub_E73C(a4, *a3);
  }
  return swift_bridgeObjectRetain();
}

uint64_t sub_102B4(void *a1, char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = sub_DCC4(&qword_1F690);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_131C0();
  uint64_t v41 = *(void *)(v11 - 8);
  uint64_t result = __chkstk_darwin(v11);
  int64_t v40 = (char *)&v29 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v42 = a4;
  uint64_t v15 = a4 + 56;
  uint64_t v14 = *(void *)(a4 + 56);
  uint64_t v32 = -1 << *(unsigned char *)(a4 + 32);
  if (-v32 < 64) {
    uint64_t v16 = ~(-1 << -(char)v32);
  }
  else {
    uint64_t v16 = -1;
  }
  unint64_t v17 = v16 & v14;
  if (!a2)
  {
    int64_t v18 = 0;
    a3 = 0;
LABEL_39:
    uint64_t v28 = ~v32;
    *a1 = v42;
    a1[1] = v15;
    a1[2] = v28;
    a1[3] = v18;
    a1[4] = v17;
    return a3;
  }
  if (!a3)
  {
    int64_t v18 = 0;
    goto LABEL_39;
  }
  if (a3 < 0) {
    goto LABEL_41;
  }
  uint64_t v36 = a3;
  int64_t v18 = 0;
  a3 = 0;
  char v19 = v40;
  uint64_t v38 = v41 + 16;
  uint64_t v39 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v41 + 56);
  uint64_t v37 = v41 + 48;
  uint64_t v35 = (uint64_t (**)(char *, char *, uint64_t))(v41 + 32);
  uint64_t v33 = v15;
  int64_t v34 = (unint64_t)(63 - v32) >> 6;
  int64_t v30 = v34 - 1;
  BOOL v31 = a1;
  if (!v17) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v20 = __clz(__rbit64(v17));
  v17 &= v17 - 1;
  unint64_t v21 = v20 | (v18 << 6);
  while (1)
  {
    uint64_t v25 = v41;
    uint64_t v26 = *(void *)(v41 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v41 + 16))(v10, *(void *)(v42 + 48) + v26 * v21, v11);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v25 + 56))(v10, 0, 1, v11);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48))(v10, 1, v11) == 1)
    {
      uint64_t v15 = v33;
      goto LABEL_38;
    }
    ++a3;
    unint64_t v27 = *v35;
    (*v35)(v19, v10, v11);
    uint64_t result = v27(a2, v19, v11);
    if (a3 == v36)
    {
      a3 = v36;
      a1 = v31;
      uint64_t v15 = v33;
      goto LABEL_39;
    }
    a2 += v26;
    if (v17) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v22 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    uint64_t v15 = v33;
    if (v22 >= v34) {
      goto LABEL_37;
    }
    unint64_t v23 = *(void *)(v33 + 8 * v22);
    if (!v23)
    {
      int64_t v24 = v18 + 2;
      ++v18;
      if (v22 + 1 >= v34) {
        goto LABEL_37;
      }
      unint64_t v23 = *(void *)(v33 + 8 * v24);
      if (v23) {
        goto LABEL_14;
      }
      int64_t v18 = v22 + 1;
      if (v22 + 2 >= v34) {
        goto LABEL_37;
      }
      unint64_t v23 = *(void *)(v33 + 8 * (v22 + 2));
      if (v23)
      {
        v22 += 2;
      }
      else
      {
        int64_t v18 = v22 + 2;
        if (v22 + 3 >= v34) {
          goto LABEL_37;
        }
        unint64_t v23 = *(void *)(v33 + 8 * (v22 + 3));
        if (!v23)
        {
          int64_t v24 = v22 + 4;
          int64_t v18 = v22 + 3;
          if (v22 + 4 < v34)
          {
            unint64_t v23 = *(void *)(v33 + 8 * v24);
            if (!v23)
            {
              while (1)
              {
                int64_t v22 = v24 + 1;
                if (__OFADD__(v24, 1)) {
                  goto LABEL_42;
                }
                if (v22 >= v34)
                {
                  int64_t v18 = v30;
                  goto LABEL_37;
                }
                unint64_t v23 = *(void *)(v33 + 8 * v22);
                ++v24;
                if (v23) {
                  goto LABEL_21;
                }
              }
            }
LABEL_14:
            int64_t v22 = v24;
            goto LABEL_21;
          }
LABEL_37:
          (*v39)(v10, 1, 1, v11);
          unint64_t v17 = 0;
LABEL_38:
          sub_11674((uint64_t)v10, &qword_1F690);
          a1 = v31;
          goto LABEL_39;
        }
        v22 += 3;
      }
    }
LABEL_21:
    unint64_t v17 = (v23 - 1) & v23;
    unint64_t v21 = __clz(__rbit64(v23)) + (v22 << 6);
    int64_t v18 = v22;
  }
  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  __break(1u);
  return result;
}

char *sub_106A8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (char *)&_swiftEmptyArrayStorage;
  }
  sub_DCC4(&qword_1F6C8);
  uint64_t v3 = *(void *)(sub_131C0() - 8);
  uint64_t v4 = *(void *)(v3 + 72);
  unint64_t v5 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v6 = (void *)swift_allocObject();
  uint64_t result = (char *)j__malloc_size(v6);
  if (v4)
  {
    if (&result[-v5] != (char *)0x8000000000000000 || v4 != -1)
    {
      v6[2] = v1;
      v6[3] = 2 * ((uint64_t)&result[-v5] / v4);
      swift_bridgeObjectRetain();
      uint64_t v9 = sub_102B4(&v10, (char *)v6 + v5, v1, a1);
      sub_11454();
      if (v9 == v1) {
        return (char *)v6;
      }
      __break(1u);
      return (char *)&_swiftEmptyArrayStorage;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

void sub_107DC(void **a1, uint64_t a2, unint64_t a3)
{
  uint64_t v6 = sub_131C0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin();
  uint64_t v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *a1;
  if (qword_1F348 != -1) {
    swift_once();
  }
  uint64_t v11 = sub_131F0();
  sub_11318(v11, (uint64_t)qword_1F4E0);
  id v12 = v10;
  uint64_t v13 = sub_131D0();
  os_log_type_t v14 = sub_13350();
  int v15 = v14;
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v16 = swift_slowAlloc();
    uint64_t v32 = swift_slowAlloc();
    uint64_t v34 = v32;
    *(_DWORD *)uint64_t v16 = 136315907;
    os_log_t v31 = v13;
    uint64_t v33 = sub_C490(a2, a3, &v34);
    sub_13380();
    *(_WORD *)(v16 + 12) = 2082;
    id v17 = [v12 identifier];
    sub_131B0();

    uint64_t v29 = sub_1145C(&qword_1F698, (void (*)(uint64_t))&type metadata accessor for UUID);
    uint64_t v18 = sub_134E0();
    int v30 = v15;
    uint64_t v19 = v7;
    unint64_t v21 = v20;
    uint64_t v28 = *(void (**)(char *, uint64_t))(v19 + 8);
    v28(v9, v6);
    uint64_t v33 = sub_C490(v18, v21, &v34);
    sub_13380();

    swift_bridgeObjectRelease();
    *(_WORD *)(v16 + 22) = 2160;
    uint64_t v33 = 1752392040;
    sub_13380();
    *(_WORD *)(v16 + 32) = 2081;
    id v22 = [v12 beaconIdentifier];
    sub_131B0();

    uint64_t v23 = sub_134E0();
    unint64_t v25 = v24;
    v28(v9, v6);
    uint64_t v33 = sub_C490(v23, v25, &v34);
    sub_13380();

    swift_bridgeObjectRelease();
    os_log_t v26 = v31;
    _os_log_impl(&dword_0, v31, (os_log_type_t)v30, "%s identifier: %{public}s beacon: %{private,mask.hash}s", (uint8_t *)v16, 0x2Au);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
}

void sub_10BC0(unint64_t a1)
{
  unint64_t v2 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_13490();
    swift_bridgeObjectRelease();
    if (v6)
    {
LABEL_3:
      sub_DCC4(&qword_1F6B0);
      uint64_t v3 = (void *)sub_13430();
      uint64_t v4 = a1 & 0xFFFFFFFFFFFFFF8;
      if (!v2) {
        goto LABEL_4;
      }
LABEL_8:
      swift_bridgeObjectRetain();
      uint64_t v5 = sub_13490();
      swift_bridgeObjectRelease();
      if (!v5) {
        return;
      }
      goto LABEL_9;
    }
  }
  else if (*(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8)))
  {
    goto LABEL_3;
  }
  uint64_t v3 = &_swiftEmptySetSingleton;
  uint64_t v4 = a1 & 0xFFFFFFFFFFFFFF8;
  if (v2) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v5 = *(void *)(v4 + 16);
  if (!v5) {
    return;
  }
LABEL_9:
  uint64_t v7 = (char *)(v3 + 7);
  uint64_t v42 = v5;
  if ((a1 & 0xC000000000000001) != 0)
  {
    uint64_t v8 = 0;
    while (1)
    {
      uint64_t v9 = sub_13450();
      BOOL v10 = __OFADD__(v8++, 1);
      if (v10)
      {
        __break(1u);
        goto LABEL_36;
      }
      uint64_t v11 = v9;
      Swift::Int v12 = sub_13360(v3[5]);
      uint64_t v13 = -1 << *((unsigned char *)v3 + 32);
      unint64_t v14 = v12 & ~v13;
      unint64_t v15 = v14 >> 6;
      uint64_t v16 = *(void *)&v7[8 * (v14 >> 6)];
      uint64_t v17 = 1 << v14;
      if (((1 << v14) & v16) != 0)
      {
        sub_11350();
        id v18 = *(id *)(v3[6] + 8 * v14);
        char v19 = sub_13370();

        if (v19)
        {
LABEL_11:
          swift_unknownObjectRelease();
          goto LABEL_12;
        }
        uint64_t v20 = ~v13;
        while (1)
        {
          unint64_t v14 = (v14 + 1) & v20;
          unint64_t v15 = v14 >> 6;
          uint64_t v16 = *(void *)&v7[8 * (v14 >> 6)];
          uint64_t v17 = 1 << v14;
          if ((v16 & (1 << v14)) == 0) {
            break;
          }
          id v21 = *(id *)(v3[6] + 8 * v14);
          char v22 = sub_13370();

          if (v22) {
            goto LABEL_11;
          }
        }
      }
      *(void *)&v7[8 * v15] = v17 | v16;
      *(void *)(v3[6] + 8 * v14) = v11;
      uint64_t v23 = v3[2];
      BOOL v10 = __OFADD__(v23, 1);
      uint64_t v24 = v23 + 1;
      if (v10) {
        goto LABEL_37;
      }
      v3[2] = v24;
LABEL_12:
      if (v8 == v42) {
        return;
      }
    }
  }
  uint64_t v25 = 0;
  uint64_t v41 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
  while (v25 != v41)
  {
    Swift::Int v26 = v3[5];
    id v27 = *(id *)(a1 + 32 + 8 * v25);
    Swift::Int v28 = sub_13360(v26);
    uint64_t v29 = -1 << *((unsigned char *)v3 + 32);
    unint64_t v30 = v28 & ~v29;
    unint64_t v31 = v30 >> 6;
    uint64_t v32 = *(void *)&v7[8 * (v30 >> 6)];
    uint64_t v33 = 1 << v30;
    if (((1 << v30) & v32) != 0)
    {
      sub_11350();
      id v34 = *(id *)(v3[6] + 8 * v30);
      char v35 = sub_13370();

      if (v35) {
        goto LABEL_23;
      }
      uint64_t v36 = ~v29;
      unint64_t v30 = (v30 + 1) & v36;
      unint64_t v31 = v30 >> 6;
      uint64_t v32 = *(void *)&v7[8 * (v30 >> 6)];
      uint64_t v33 = 1 << v30;
      if ((v32 & (1 << v30)) != 0)
      {
        while (1)
        {
          id v37 = *(id *)(v3[6] + 8 * v30);
          char v38 = sub_13370();

          if (v38) {
            break;
          }
          unint64_t v30 = (v30 + 1) & v36;
          unint64_t v31 = v30 >> 6;
          uint64_t v32 = *(void *)&v7[8 * (v30 >> 6)];
          uint64_t v33 = 1 << v30;
          if ((v32 & (1 << v30)) == 0) {
            goto LABEL_31;
          }
        }
LABEL_23:

        uint64_t v5 = v42;
        goto LABEL_24;
      }
LABEL_31:
      uint64_t v5 = v42;
    }
    *(void *)&v7[8 * v31] = v33 | v32;
    *(void *)(v3[6] + 8 * v30) = v27;
    uint64_t v39 = v3[2];
    BOOL v10 = __OFADD__(v39, 1);
    uint64_t v40 = v39 + 1;
    if (v10) {
      goto LABEL_38;
    }
    v3[2] = v40;
LABEL_24:
    if (++v25 == v5) {
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

uint64_t sub_10F18(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = *(void *)(sub_131C0() - 8);
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
  uint64_t result = sub_134C0();
  __break(1u);
  return result;
}

uint64_t sub_11070(uint64_t a1)
{
  uint64_t v2 = sub_131C0();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  Swift::Int v28 = (char *)v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  id v27 = (char *)v21 - v6;
  uint64_t v7 = sub_DCC4(&qword_1F690);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *(void *)(a1 + 16);
  sub_1145C(&qword_1F6D0, (void (*)(uint64_t))&type metadata accessor for UUID);
  uint64_t v29 = sub_13320();
  if (v10)
  {
    unint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    uint64_t v11 = v3 + 16;
    uint64_t v13 = a1 + ((*(unsigned __int8 *)(v11 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 64));
    uint64_t v14 = *(void *)(v11 + 56);
    unint64_t v15 = v11 + 40;
    uint64_t v24 = (unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 32);
    uint64_t v25 = v12;
    char v22 = (void (**)(char *, char *, uint64_t))(v11 + 16);
    uint64_t v23 = v14;
    uint64_t v26 = v11;
    uint64_t v16 = (void (**)(uint64_t, uint64_t))(v11 - 8);
    v21[1] = v15 & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
    uint64_t v18 = (uint64_t)v27;
    uint64_t v17 = v28;
    while (1)
    {
      v25(v9, v13, v2);
      char v19 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))v15;
      (*(void (**)(char *, void, uint64_t, uint64_t))v15)(v9, 0, 1, v2);
      if ((*v24)(v9, 1, v2) == 1) {
        break;
      }
      (*v22)(v17, v9, v2);
      sub_CFB8(v18, v17);
      (*v16)(v18, v2);
      v13 += v23;
      if (!--v10) {
        goto LABEL_7;
      }
    }
  }
  else
  {
    char v19 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56);
LABEL_7:
    v19(v9, 1, 1, v2);
  }
  return v29;
}

uint64_t sub_11318(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

unint64_t sub_11350()
{
  unint64_t result = qword_1F880;
  if (!qword_1F880)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1F880);
  }
  return result;
}

uint64_t sub_11390(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t *sub_113F0(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_11454()
{
  return swift_release();
}

uint64_t sub_1145C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t *sub_114A4(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_11508(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_11558()
{
  swift_unknownObjectRelease();

  swift_release();

  return _swift_deallocObject(v0, 64, 7);
}

uint64_t sub_115A0(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  *uint64_t v9 = v2;
  v9[1] = sub_11F84;
  return sub_35DC(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_11674(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_DCC4(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_116D0()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_11708(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_11F84;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_1F710 + dword_1F710);
  return v6(a1, v4);
}

uint64_t sub_117C0()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_117F8(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_118A8;
  v5[16] = a1;
  v5[17] = v4;
  return _swift_task_switch(sub_5758, 0, 0);
}

uint64_t sub_118A8()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_1199C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_DCC4(&qword_1F720);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_11A04()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_11A44()
{
  uint64_t v2 = *(const void **)(v0 + 16);
  uint64_t v3 = *(void **)(v0 + 24);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *uint64_t v4 = v1;
  v4[1] = sub_11F84;
  uint64_t v5 = (uint64_t (*)(const void *, void *))((char *)&dword_1F758 + dword_1F758);
  return v5(v2, v3);
}

uint64_t sub_11AF4()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = (int *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_11F84;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_1F768 + dword_1F768);
  return v6(v2, v3, v4);
}

uint64_t sub_11BB8(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (int *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_11F84;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_1F778 + dword_1F778);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_11C84(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_11F84;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_1F788 + dword_1F788);
  return v6(a1, v4);
}

uint64_t sub_11D40()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = (void *)v0[3];
  uint64_t v4 = (void *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_118A8;
  uint64_t v6 = (uint64_t (*)(uint64_t, void *, void *))((char *)&dword_1F798 + dword_1F798);
  return v6(v2, v3, v4);
}

uint64_t sub_11E00()
{
  swift_unknownObjectRelease();
  _Block_release(*(const void **)(v0 + 24));

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_11E48()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = (void *)v0[3];
  uint64_t v4 = (void *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_11F84;
  uint64_t v6 = (uint64_t (*)(uint64_t, void *, void *))((char *)&dword_1F818 + dword_1F818);
  return v6(v2, v3, v4);
}

uint64_t sub_11F04()
{
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_11F44()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

void sub_11F7C(uint64_t a1, uint64_t a2)
{
  sub_60D4(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_11F98()
{
  uint64_t v0 = sub_131F0();
  sub_113F0(v0, qword_1FBF0);
  sub_11318(v0, (uint64_t)qword_1FBF0);
  return sub_131E0();
}

void sub_120E0()
{
  unint64_t v47 = (unint64_t)&_swiftEmptyArrayStorage;
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC28FindMyItemsDigitalSeparation8DSBeacon_beaconShares);
  if ((v1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    sub_133C0();
    sub_11350();
    sub_12924();
    sub_13330();
    uint64_t v1 = v48;
    uint64_t v2 = v49;
    uint64_t v3 = v50;
    uint64_t v4 = v51;
    unint64_t v5 = v52;
  }
  else
  {
    uint64_t v6 = -1 << *(unsigned char *)(v1 + 32);
    uint64_t v2 = v1 + 56;
    uint64_t v7 = ~v6;
    uint64_t v8 = -v6;
    if (v8 < 64) {
      uint64_t v9 = ~(-1 << v8);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v5 = v9 & *(void *)(v1 + 56);
    swift_bridgeObjectRetain();
    uint64_t v3 = v7;
    uint64_t v4 = 0;
  }
  int64_t v43 = (unint64_t)(v3 + 64) >> 6;
  uint64_t v10 = (SEL *)&unk_1E000;
  uint64_t v42 = v2;
  while (1)
  {
    if (v1 < 0)
    {
      if (!sub_133F0()) {
        goto LABEL_52;
      }
      sub_11350();
      swift_unknownObjectRetain();
      swift_dynamicCast();
      id v14 = v44;
      swift_unknownObjectRelease();
      uint64_t v13 = v4;
      uint64_t v11 = v5;
      if (!v44) {
        goto LABEL_52;
      }
      goto LABEL_30;
    }
    if (!v5) {
      break;
    }
    uint64_t v11 = (v5 - 1) & v5;
    unint64_t v12 = __clz(__rbit64(v5)) | (v4 << 6);
    uint64_t v13 = v4;
LABEL_29:
    id v14 = *(id *)(*(void *)(v1 + 48) + 8 * v12);
    if (!v14) {
      goto LABEL_52;
    }
LABEL_30:
    if ((SPBeaconShare.shouldBeListed.getter() & 1) == 0
      || (id v18 = [v14 v10[484]],
          char v19 = (char *)[v18 type],
          v18,
          v19 == (unsigned char *)&dword_0 + 2))
    {
LABEL_8:

      uint64_t v4 = v13;
      unint64_t v5 = v11;
    }
    else
    {
      id v20 = [v14 owner];
      id v21 = [v20 destination];

      uint64_t v22 = sub_13250();
      uint64_t v24 = v23;

      if (qword_1F340 != -1) {
        swift_once();
      }
      if (v22 == FMISDSSDefaultBeaconOwnerIdentifier._countAndFlagsBits
        && v24 == FMISDSSDefaultBeaconOwnerIdentifier._object)
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        char v25 = sub_134F0();
        swift_bridgeObjectRelease();
        if ((v25 & 1) == 0)
        {
          id v26 = [v14 owner];
          id v27 = (objc_class *)type metadata accessor for DSHandle();
          Swift::Int v28 = (char *)objc_allocWithZone(v27);
          *(void *)&v28[OBJC_IVAR____TtC28FindMyItemsDigitalSeparation8DSHandle_role] = 1;
          id v29 = [v26 type];
          NSString v30 = [v26 destination];
          if (!v30)
          {
            sub_13250();
            NSString v30 = sub_13220();
            swift_bridgeObjectRelease();
          }
          v46.receiver = v28;
          v46.super_class = v27;
          objc_msgSendSuper2(&v46, "initWithType:destination:", v29, v30);

          sub_13280();
          if (*(void *)((char *)&dword_10 + (v47 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                         + (v47 & 0xFFFFFFFFFFFFFF8)) >> 1)
            sub_132B0();
          sub_132C0();
          sub_132A0();
        }
      }
      uint64_t v10 = (SEL *)&unk_1E000;
      id v31 = [v14 sharee];
      id v32 = [v31 destination];

      uint64_t v33 = sub_13250();
      char v35 = v34;

      if (v33 == FMISDSSDefaultBeaconOwnerIdentifier._countAndFlagsBits
        && v35 == FMISDSSDefaultBeaconOwnerIdentifier._object)
      {

        swift_bridgeObjectRelease();
        uint64_t v4 = v13;
        unint64_t v5 = v11;
        uint64_t v2 = v42;
      }
      else
      {
        char v36 = sub_134F0();
        swift_bridgeObjectRelease();
        uint64_t v2 = v42;
        if (v36) {
          goto LABEL_8;
        }
        id v37 = [v14 sharee];
        char v38 = (objc_class *)type metadata accessor for DSHandle();
        uint64_t v39 = (char *)objc_allocWithZone(v38);
        *(void *)&v39[OBJC_IVAR____TtC28FindMyItemsDigitalSeparation8DSHandle_role] = 2;
        id v40 = [v37 type];
        NSString v41 = [v37 destination];
        if (!v41)
        {
          sub_13250();
          NSString v41 = sub_13220();
          uint64_t v2 = v42;
          swift_bridgeObjectRelease();
        }
        v45.receiver = v39;
        v45.super_class = v38;
        objc_msgSendSuper2(&v45, "initWithType:destination:", v40, v41);

        sub_13280();
        if (*(void *)((char *)&dword_10 + (v47 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                       + (v47 & 0xFFFFFFFFFFFFFF8)) >> 1)
          sub_132B0();
        sub_132C0();
        sub_132A0();

        uint64_t v4 = v13;
        unint64_t v5 = v11;
        uint64_t v10 = (SEL *)&unk_1E000;
      }
    }
  }
  int64_t v15 = v4 + 1;
  if (!__OFADD__(v4, 1))
  {
    if (v15 >= v43) {
      goto LABEL_52;
    }
    unint64_t v16 = *(void *)(v2 + 8 * v15);
    uint64_t v13 = v4 + 1;
    if (!v16)
    {
      uint64_t v13 = v4 + 2;
      if (v4 + 2 >= v43) {
        goto LABEL_52;
      }
      unint64_t v16 = *(void *)(v2 + 8 * v13);
      if (!v16)
      {
        uint64_t v13 = v4 + 3;
        if (v4 + 3 >= v43) {
          goto LABEL_52;
        }
        unint64_t v16 = *(void *)(v2 + 8 * v13);
        if (!v16)
        {
          uint64_t v13 = v4 + 4;
          if (v4 + 4 >= v43) {
            goto LABEL_52;
          }
          unint64_t v16 = *(void *)(v2 + 8 * v13);
          if (!v16)
          {
            uint64_t v17 = v4 + 5;
            while (v43 != v17)
            {
              unint64_t v16 = *(void *)(v2 + 8 * v17++);
              if (v16)
              {
                uint64_t v13 = v17 - 1;
                goto LABEL_28;
              }
            }
LABEL_52:
            sub_11454();
            return;
          }
        }
      }
    }
LABEL_28:
    uint64_t v11 = (v16 - 1) & v16;
    unint64_t v12 = __clz(__rbit64(v16)) + (v13 << 6);
    goto LABEL_29;
  }
  __break(1u);
}

id sub_12778()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DSBeacon();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_12830()
{
  return type metadata accessor for DSBeacon();
}

uint64_t type metadata accessor for DSBeacon()
{
  uint64_t result = qword_1F870;
  if (!qword_1F870) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_12884()
{
  uint64_t result = sub_131C0();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

unint64_t sub_12924()
{
  unint64_t result = qword_1F6E8;
  if (!qword_1F6E8)
  {
    sub_11350();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1F6E8);
  }
  return result;
}

id sub_129AC()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for DSDelegatedBeaconShare()
{
  return self;
}

BOOL SPBeaconShare.isDelegated.getter()
{
  id v1 = [v0 sharee];
  objc_super v2 = (char *)[v1 type];

  return v2 == (unsigned char *)&dword_0 + 2;
}

uint64_t SPBeaconShare.shouldBeListed.getter()
{
  unint64_t v1 = (unint64_t)[v0 state];
  if (v1 <= 6)
  {
    if (((1 << v1) & 0x1E) != 0)
    {
      id v2 = [v0 owner];
      id v3 = [v2 destination];

      uint64_t v4 = sub_13250();
      uint64_t v6 = v5;

      if (qword_1F340 != -1) {
        swift_once();
      }
      if (v4 == FMISDSSDefaultBeaconOwnerIdentifier._countAndFlagsBits
        && v6 == FMISDSSDefaultBeaconOwnerIdentifier._object)
      {
        goto LABEL_12;
      }
      char v8 = sub_134F0();
      swift_bridgeObjectRelease();
      if (v8) {
        goto LABEL_13;
      }
      id v9 = [v0 sharee];
      id v10 = [v9 destination];

      uint64_t v11 = sub_13250();
      uint64_t v13 = v12;

      if (v11 == FMISDSSDefaultBeaconOwnerIdentifier._countAndFlagsBits
        && v13 == FMISDSSDefaultBeaconOwnerIdentifier._object)
      {
LABEL_12:
        swift_bridgeObjectRelease();
      }
      else
      {
        char v40 = sub_134F0();
        swift_bridgeObjectRelease();
        uint64_t v19 = 0;
        if ((v40 & 1) == 0) {
          return v19;
        }
      }
LABEL_13:
      if (qword_1F350 != -1) {
        swift_once();
      }
      uint64_t v14 = sub_131F0();
      sub_11318(v14, (uint64_t)qword_1FBF0);
      int64_t v15 = sub_131D0();
      os_log_type_t v16 = sub_13350();
      if (os_log_type_enabled(v15, v16))
      {
        uint64_t v17 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v17 = 0;
        id v18 = "FindMyItemsDigitalSeparation: Owner is invited or has invited someone. Showing.";
LABEL_17:
        _os_log_impl(&dword_0, v15, v16, v18, v17, 2u);
        uint64_t v19 = 1;
        goto LABEL_33;
      }
      goto LABEL_50;
    }
    id v20 = [v0 owner];
    id v21 = [v20 destination];

    uint64_t v22 = sub_13250();
    uint64_t v24 = v23;

    id v25 = [v0 sharee];
    id v26 = [v25 destination];

    uint64_t v27 = sub_13250();
    uint64_t v29 = v28;

    if (v22 == v27 && v24 == v29)
    {
      swift_bridgeObjectRelease_n();
    }
    else
    {
      char v31 = sub_134F0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v31 & 1) == 0)
      {
        id v32 = [v0 owner];
        id v33 = [v32 destination];

        uint64_t v34 = sub_13250();
        char v36 = v35;

        if (qword_1F340 != -1) {
          swift_once();
        }
        if (v34 != FMISDSSDefaultBeaconOwnerIdentifier._countAndFlagsBits
          || v36 != FMISDSSDefaultBeaconOwnerIdentifier._object)
        {
          char v41 = sub_134F0();
          swift_bridgeObjectRelease();
          if (v41)
          {
LABEL_42:
            if (qword_1F350 != -1) {
              swift_once();
            }
            uint64_t v48 = sub_131F0();
            sub_11318(v48, (uint64_t)qword_1FBF0);
            int64_t v15 = sub_131D0();
            os_log_type_t v16 = sub_13350();
            if (os_log_type_enabled(v15, v16))
            {
              uint64_t v17 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)uint64_t v17 = 0;
              id v18 = "FindMyItemsDigitalSeparation: Owner is part of the share record- showing.";
              goto LABEL_17;
            }
LABEL_50:
            uint64_t v19 = 1;
            goto LABEL_51;
          }
          id v42 = [v0 sharee];
          id v43 = [v42 destination];

          uint64_t v44 = sub_13250();
          objc_super v46 = v45;

          if (v44 != FMISDSSDefaultBeaconOwnerIdentifier._countAndFlagsBits
            || v46 != FMISDSSDefaultBeaconOwnerIdentifier._object)
          {
            char v47 = sub_134F0();
            swift_bridgeObjectRelease();
            if ((v47 & 1) == 0)
            {
              if (qword_1F350 != -1) {
                swift_once();
              }
              uint64_t v49 = sub_131F0();
              sub_11318(v49, (uint64_t)qword_1FBF0);
              int64_t v15 = sub_131D0();
              os_log_type_t v16 = sub_13350();
              if (os_log_type_enabled(v15, v16))
              {
                uint64_t v17 = (uint8_t *)swift_slowAlloc();
                *(_WORD *)uint64_t v17 = 0;
                id v18 = "FindMyItemsDigitalSeparation: Owner is not part of the share record- this is a one to many share. Showing.";
                goto LABEL_17;
              }
              goto LABEL_50;
            }
            goto LABEL_42;
          }
        }
        swift_bridgeObjectRelease();
        goto LABEL_42;
      }
    }
    if (qword_1F350 != -1) {
      swift_once();
    }
    uint64_t v37 = sub_131F0();
    sub_11318(v37, (uint64_t)qword_1FBF0);
    int64_t v15 = sub_131D0();
    os_log_type_t v38 = sub_13350();
    if (!os_log_type_enabled(v15, v38))
    {
      uint64_t v19 = 0;
      goto LABEL_51;
    }
    uint64_t v39 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v39 = 0;
    _os_log_impl(&dword_0, v15, v38, "FindMyItemsDigitalSeparation: Owner and sharee destinations match- not showing", v39, 2u);
    uint64_t v19 = 0;
LABEL_33:
    swift_slowDealloc();
LABEL_51:

    return v19;
  }
  return 0;
}

uint64_t sub_13150(uint64_t result, unsigned char **a2)
{
  id v2 = *a2;
  *id v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_13170()
{
  return isFeatureEnabled(_:)();
}

uint64_t sub_13180()
{
  return type metadata accessor for Feature.FindMy();
}

uint64_t sub_13190()
{
  return _convertErrorToNSError(_:)();
}

NSUUID sub_131A0()
{
  return UUID._bridgeToObjectiveC()();
}

uint64_t sub_131B0()
{
  return static UUID._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_131C0()
{
  return type metadata accessor for UUID();
}

uint64_t sub_131D0()
{
  return Logger.logObject.getter();
}

uint64_t sub_131E0()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_131F0()
{
  return type metadata accessor for Logger();
}

uint64_t sub_13200()
{
  return dispatch thunk of Hashable._rawHashValue(seed:)();
}

uint64_t sub_13210()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

NSString sub_13220()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_13230()
{
  return static String._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_13240()
{
  return static String._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_13250()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_13260()
{
  return String.hash(into:)();
}

Swift::Int sub_13270()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_13280()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray sub_13290()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_132A0()
{
  return specialized Array._endMutation()();
}

uint64_t sub_132B0()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_132C0()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_132D0()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_132E0()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_132F0()
{
  return type metadata accessor for TaskPriority();
}

uint64_t sub_13300()
{
  return static Set._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_13310()
{
  return Set.description.getter();
}

uint64_t sub_13320()
{
  return Set.init(minimumCapacity:)();
}

uint64_t sub_13330()
{
  return Set.Iterator.init(_cocoa:)();
}

uint64_t sub_13340()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_13350()
{
  return static os_log_type_t.default.getter();
}

Swift::Int sub_13360(Swift::Int seed)
{
  return NSObject._rawHashValue(seed:)(seed);
}

uint64_t sub_13370()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t sub_13380()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_13390()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_133A0()
{
  return _HashTable.previousHole(before:)();
}

uint64_t sub_133B0()
{
  return _HashTable.nextHole(atOrAfter:)();
}

uint64_t sub_133C0()
{
  return __CocoaSet.makeIterator()();
}

uint64_t sub_133D0()
{
  return __CocoaSet.count.getter();
}

uint64_t sub_133E0()
{
  return __CocoaSet.member(for:)();
}

uint64_t sub_133F0()
{
  return __CocoaSet.Iterator.next()();
}

uint64_t sub_13400()
{
  return static _SetStorage.copy(original:)();
}

uint64_t sub_13410()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

uint64_t sub_13420()
{
  return static _SetStorage.convert(_:capacity:)();
}

uint64_t sub_13430()
{
  return static _SetStorage.allocate(capacity:)();
}

uint64_t sub_13440()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_13450()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_13460()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_13470()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_13480()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_13490()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_134A0()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t sub_134B0()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t sub_134C0()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_134E0()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_134F0()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_13500()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_13510()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_13520()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_13530()
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

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return __swift_stdlib_bridgeErrorToNSError();
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

uint64_t swift_continuation_init()
{
  return _swift_continuation_init();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastClass()
{
  return _swift_dynamicCastClass();
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

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
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

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return _swift_stdlib_isStackAllocationSafe();
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

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}