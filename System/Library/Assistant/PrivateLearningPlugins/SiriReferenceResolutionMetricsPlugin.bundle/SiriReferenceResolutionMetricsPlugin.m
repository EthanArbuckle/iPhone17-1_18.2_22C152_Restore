id sub_3F50()
{
  void *v0;
  id result;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  result = [objc_allocWithZone((Class)SiriLinkRRProvisionalLinkEntityPresent) init];
  if (result)
  {
    v2 = result;
    v3 = v0[10];
    v4 = v0[11];
    swift_bridgeObjectRetain();
    sub_45AC(v3, v4, v2);
    swift_bridgeObjectRelease();
    v6 = v0[8];
    v5 = v0[9];
    swift_bridgeObjectRetain();
    sub_4604(v6, v5, v2);
    swift_bridgeObjectRelease();
    return v2;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_3FE4()
{
  uint64_t v0 = sub_10520();
  sub_4694(v0, qword_19830);
  sub_465C(v0, (uint64_t)qword_19830);
  type metadata accessor for SiriReferenceResolutionMetricsPlugin();
  return sub_104C0();
}

uint64_t sub_4040(unint64_t a1)
{
  uint64_t v21 = sub_10280();
  uint64_t v2 = *(void *)(v21 - 8);
  __chkstk_darwin();
  v4 = (char *)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!(a1 >> 62))
  {
    uint64_t v5 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
    uint64_t result = swift_bridgeObjectRetain();
    if (v5) {
      goto LABEL_3;
    }
LABEL_17:
    return swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  uint64_t result = sub_107C0();
  uint64_t v5 = result;
  if (!result) {
    goto LABEL_17;
  }
LABEL_3:
  if (v5 >= 1)
  {
    uint64_t v7 = 0;
    v8 = (void (**)(char *, uint64_t))(v2 + 8);
    do
    {
      if ((a1 & 0xC000000000000001) != 0) {
        v9 = (objc_class *)sub_10760();
      }
      else {
        v9 = (objc_class *)*(id *)(a1 + 8 * v7 + 32);
      }
      Class v10 = v9;
      if (qword_190A0 != -1) {
        swift_once();
      }
      uint64_t v11 = sub_10520();
      sub_465C(v11, (uint64_t)qword_19830);
      v12 = sub_10510();
      os_log_type_t v13 = sub_106D0();
      if (os_log_type_enabled(v12, v13))
      {
        v14 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v14 = 0;
        _os_log_impl(&dword_0, v12, v13, "Emiting Link Entity Reference Resolution Instrumentation.", v14, 2u);
        swift_slowDealloc();
      }

      id v15 = [objc_allocWithZone((Class)SiriLinkRRProvisionalSRRLinkMetricClientEvent) init];
      if (v15)
      {
        v16 = v15;
        [v15 setLinkEntityPresent:v10];
        id v17 = [self sharedAnalytics];
        id v18 = [v17 defaultMessageStream];

        sub_10270();
        Class isa = sub_10260().super.isa;
        (*v8)(v4, v21);
        [v18 emitMessage:v16 isolatedStreamUUID:isa];

        Class v10 = isa;
      }
      ++v7;
    }
    while (v5 != v7);
    return swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

void *sub_4344(uint64_t a1)
{
  id v2 = sub_3F50();
  [v2 setExecutionStage:1];
  [v2 setEntityPresent:1];
  id v3 = v2;
  sub_10640();
  sub_471C();
  if (v4) {
    sub_46F8();
  }
  sub_10670();
  sub_10650();
  id v5 = sub_3F50();
  [v5 setExecutionStage:7];
  [v5 setEntityPresent:*(void *)(a1 + 128) != 0];
  id v6 = v5;
  sub_10640();
  sub_471C();
  if (v4) {
    sub_46F8();
  }
  sub_10670();
  sub_10650();

  return &_swiftEmptyArrayStorage;
}

void *sub_4464(unint64_t a1)
{
  if (!(a1 >> 62))
  {
    uint64_t v2 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
    uint64_t result = (void *)swift_bridgeObjectRetain();
    if (v2) {
      goto LABEL_3;
    }
LABEL_13:
    swift_bridgeObjectRelease();
    return &_swiftEmptyArrayStorage;
  }
  swift_bridgeObjectRetain();
  uint64_t result = (void *)sub_107C0();
  uint64_t v2 = (uint64_t)result;
  if (!result) {
    goto LABEL_13;
  }
LABEL_3:
  if (v2 < 1)
  {
    __break(1u);
  }
  else
  {
    for (uint64_t i = 0; i != v2; ++i)
    {
      if ((a1 & 0xC000000000000001) != 0)
      {
        uint64_t v5 = sub_10760();
      }
      else
      {
        uint64_t v5 = *(void *)(a1 + 8 * i + 32);
        swift_retain();
      }
      id v6 = sub_4344(v5);
      if (v6) {
        sub_8DB4((unint64_t)v6);
      }
      swift_release();
    }
    swift_bridgeObjectRelease();
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

uint64_t variable initialization expression of SiriReferenceResolutionMetricsPlugin.logger()
{
  type metadata accessor for SiriReferenceResolutionMetricsPlugin();

  return sub_104C0();
}

void sub_45AC(uint64_t a1, uint64_t a2, void *a3)
{
  NSString v4 = sub_10550();
  [a3 setSourceBundleId:v4];
}

void sub_4604(uint64_t a1, uint64_t a2, void *a3)
{
  NSString v4 = sub_10550();
  [a3 setLinkEntityType:v4];
}

uint64_t sub_465C(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t *sub_4694(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_46F8()
{
  return sub_10660();
}

id sub_4730()
{
  id v1 = [v0 eventData];
  uint64_t v2 = sub_10200();
  unint64_t v4 = v3;

  id v5 = objc_allocWithZone((Class)SISchemaAnyEvent);
  id v6 = sub_510C(v2, v4);
  if (!v6) {
    return 0;
  }
  uint64_t v7 = v6;
  id v8 = [v6 unwrap];
  if (!v8)
  {

    return 0;
  }
  id v9 = v8;
  self;
  id v10 = (id)swift_dynamicCastObjCClass();
  if (!v10)
  {

    goto LABEL_8;
  }
  id v9 = v9;
  id v11 = [v10 event];
  if (!v11)
  {

    return 0;
  }
  v12 = v11;
  id v10 = [v11 unwrap];

LABEL_8:
  return v10;
}

uint64_t sub_4860()
{
  *(_OWORD *)(v0 + 16) = xmmword_12240;
  *(void *)(v0 + 32) = [objc_allocWithZone((Class)BMSiriPrivateLearningSELFEventStream) init];
  return v0;
}

uint64_t sub_48A0(uint64_t a1, double a2, double a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = sub_4F9C(&qword_192F8);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  id v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = sub_10540();
  id v13 = [*(id *)(v4 + 32) publisherFromStartTime:a2 + -300.0];
  sub_4F9C(&qword_19300);
  sub_102E0();
  uint64_t v14 = swift_allocObject();
  *(double *)(v14 + 16) = a3;
  *(void *)(v14 + 24) = v4;
  *(void *)(v14 + 32) = a1;
  *(void *)(v14 + 40) = v12;
  sub_5070();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();

  swift_release();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  swift_beginAccess();
  uint64_t v15 = *(void *)(v12 + 16);
  swift_bridgeObjectRetain();
  swift_release();
  return v15;
}

BOOL sub_4AD4(void *a1, double a2, uint64_t a3, void *a4)
{
  uint64_t v7 = sub_10280();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  id v11 = (char *)&v41 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  id v13 = (char *)&v41 - v12;
  [a1 timestamp];
  double v15 = v14;
  double v16 = a2 + 900.0;
  if (v16 >= v14)
  {
    id v17 = [a1 eventBody];
    if (v17)
    {
      id v18 = v17;
      id v19 = sub_4730();

      if (v19)
      {
        if ([v19 getAnyEventType] == 9)
        {
          self;
          uint64_t v20 = swift_dynamicCastObjCClass();
          if (v20)
          {
            uint64_t v21 = (void *)v20;
            id v19 = v19;
            id v22 = [v21 target];
            if (v22)
            {
              v23 = v22;
              id v41 = v19;
              unsigned int v24 = [v22 component];

              if (v24 == 1)
              {
                id v25 = [v21 source];
                if (v25)
                {
                  v26 = v25;
                  unsigned int v27 = [v25 component];

                  if (v27 == 3)
                  {
                    id v28 = [v21 target];
                    if (v28)
                    {
                      v29 = v28;
                      id v30 = [v28 uuid];

                      if (v30)
                      {
                        sub_106B0();

                        uint64_t v31 = sub_10250();
                        uint64_t v33 = v32;
                        v34 = *(void (**)(char *, uint64_t))(v8 + 8);
                        v34(v13, v7);
                        if (sub_4E78(v31, v33, a4))
                        {
                          v35 = v34;
                          id v36 = [v21 source];
                          v37 = v36;
                          if (v36)
                          {
                            id v38 = [v36 uuid];

                            if (v38)
                            {
                              sub_106B0();

                              v37 = (void *)sub_10250();
                              id v38 = v39;
                              v35(v11, v7);
                            }
                            else
                            {
                              v37 = 0;
                            }
                          }
                          else
                          {
                            id v38 = 0;
                          }
                          swift_beginAccess();
                          if (v38)
                          {
                            sub_DDF8((uint64_t)v37, (uint64_t)v38, v31, v33);
                          }
                          else
                          {
                            sub_5180(v31, v33);
                            swift_bridgeObjectRelease();
                          }
                          swift_bridgeObjectRelease();
                          swift_endAccess();
                        }
                        else
                        {
                          swift_bridgeObjectRelease();
                        }
                      }
                    }
                  }
                }
              }
              id v19 = v41;
            }
          }
        }
      }
    }
  }
  return v16 >= v15;
}

uint64_t sub_4E78(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = a3[2];
  if (!v3) {
    return 0;
  }
  if (a3[4] == a1 && a3[5] == a2) {
    return 1;
  }
  uint64_t result = sub_10810();
  if (result) {
    return 1;
  }
  if (v3 == 1) {
    return 0;
  }
  uint64_t v9 = a3 + 7;
  for (uint64_t i = 1; ; ++i)
  {
    uint64_t v11 = i + 1;
    if (__OFADD__(i, 1)) {
      break;
    }
    BOOL v12 = *(v9 - 1) == a1 && *v9 == a2;
    if (v12 || (sub_10810() & 1) != 0) {
      return 1;
    }
    uint64_t result = 0;
    v9 += 2;
    if (v11 == v3) {
      return result;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_4F40()
{
  return _swift_deallocClassInstance(v0, 40, 7);
}

uint64_t type metadata accessor for FlowIdBiomeBackedProvider()
{
  return self;
}

uint64_t sub_4F9C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_4FE0()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_5018()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

BOOL sub_5060(void *a1)
{
  return sub_4AD4(a1, *(double *)(v1 + 16), *(void *)(v1 + 24), *(void **)(v1 + 32));
}

unint64_t sub_5070()
{
  unint64_t result = qword_19308;
  if (!qword_19308)
  {
    sub_50C4(&qword_192F8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_19308);
  }
  return result;
}

uint64_t sub_50C4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

id sub_510C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 == 15)
  {
    Class isa = 0;
  }
  else
  {
    Class isa = sub_101F0().super.isa;
    sub_5290(a1, a2);
  }
  id v6 = [v2 initWithData:isa];

  return v6;
}

uint64_t sub_5180(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_DC9C(a1, a2);
  LOBYTE(a2) = v7;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0) {
    return 0;
  }
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v13 = *v3;
  uint64_t v9 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  Swift::Int v10 = *(void *)(v9 + 24);
  sub_4F9C(&qword_19310);
  sub_10790(isUniquelyReferenced_nonNull_native, v10);
  swift_bridgeObjectRelease();
  uint64_t v11 = *(void *)(*(void *)(v13 + 56) + 16 * v6);
  sub_107A0();
  *uint64_t v3 = v13;
  swift_bridgeObjectRelease();
  return v11;
}

uint64_t sub_5290(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_52A4(a1, a2);
  }
  return a1;
}

uint64_t sub_52A4(uint64_t a1, unint64_t a2)
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

void sub_52FC()
{
  sub_8D4C();
  uint64_t v1 = sub_10410();
  sub_8BE4();
  uint64_t v3 = v2;
  __chkstk_darwin(v4);
  sub_8CD4();
  uint64_t v5 = sub_4F9C(&qword_19508);
  uint64_t v6 = sub_8CC8(v5);
  uint64_t v7 = __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v25 - v10;
  uint64_t v12 = sub_10460();
  uint64_t v13 = *(void *)(v12 + 16);
  if (!v13)
  {
    uint64_t v22 = 1;
    goto LABEL_14;
  }
  id v25 = v11;
  v26 = v9;
  uint64_t v27 = v3;
  uint64_t v28 = v12;
  double v15 = *(char **)(v3 + 16);
  uint64_t v14 = v3 + 16;
  uint64_t v11 = v15;
  unint64_t v16 = v12 + ((*(unsigned __int8 *)(v14 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 64));
  uint64_t v17 = *(void *)(v14 + 56);
  swift_bridgeObjectRetain();
  while (1)
  {
    ((void (*)(uint64_t, unint64_t, uint64_t))v11)(v0, v16, v1);
    uint64_t v18 = sub_10400();
    if (!v19) {
      goto LABEL_9;
    }
    if (v18 == 0x69746E655F707061 && v19 == 0xEF657079745F7974) {
      break;
    }
    char v21 = sub_10810();
    swift_bridgeObjectRelease();
    if (v21) {
      goto LABEL_13;
    }
LABEL_9:
    (*(void (**)(uint64_t, uint64_t))(v14 - 8))(v0, v1);
    v16 += v17;
    if (!--v13)
    {
      sub_8D64();
      uint64_t v22 = 1;
      uint64_t v9 = v26;
      uint64_t v3 = v27;
      uint64_t v11 = v25;
      goto LABEL_14;
    }
  }
  sub_8D64();
LABEL_13:
  swift_bridgeObjectRelease();
  uint64_t v3 = v27;
  uint64_t v23 = sub_8C58();
  v24(v23);
  uint64_t v22 = 0;
  uint64_t v9 = v26;
LABEL_14:
  sub_7630((uint64_t)v11, v22, 1, v1);
  swift_bridgeObjectRelease();
  sub_7658((uint64_t)v11, (uint64_t)v9);
  if (sub_76C0((uint64_t)v9, 1, v1) == 1)
  {
    sub_8608((uint64_t)v11, &qword_19508);
    sub_8608((uint64_t)v9, &qword_19508);
  }
  else
  {
    sub_103F0();
    sub_8608((uint64_t)v11, &qword_19508);
    (*(void (**)(char *, uint64_t))(v3 + 8))(v9, v1);
  }
  sub_8C94();
}

uint64_t sub_55B8()
{
  uint64_t v0 = sub_4F9C(&qword_19508);
  uint64_t v1 = sub_8CC8(v0);
  __chkstk_darwin(v1);
  sub_8C00();
  uint64_t v4 = v3 - v2;
  uint64_t v5 = sub_10460();
  sub_56BC(v5, v4);
  swift_bridgeObjectRelease();
  uint64_t v6 = sub_10410();
  if (sub_76C0(v4, 1, v6) == 1)
  {
    sub_8608(v4, &qword_19508);
    return 0;
  }
  else
  {
    uint64_t v7 = sub_103E0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v4, v6);
  }
  return v7;
}

uint64_t sub_56BC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t v5 = sub_10410();
  uint64_t v6 = v5;
  if (v4)
  {
    (*(void (**)(uint64_t, unint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1+ ((*(unsigned __int8 *)(*(void *)(v5 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v5 - 8) + 80)), v5);
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v7 = 1;
  }

  return sub_7630(a2, v7, 1, v6);
}

void sub_5764()
{
  sub_8D4C();
  uint64_t v1 = sub_10410();
  sub_8BE4();
  uint64_t v3 = v2;
  __chkstk_darwin(v4);
  sub_8CD4();
  uint64_t v5 = sub_4F9C(&qword_19508);
  uint64_t v6 = sub_8CC8(v5);
  uint64_t v7 = __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v26 - v10;
  uint64_t v12 = sub_10460();
  uint64_t v13 = *(void *)(v12 + 16);
  if (!v13)
  {
    uint64_t v23 = 1;
    goto LABEL_14;
  }
  v26 = v11;
  uint64_t v27 = v9;
  uint64_t v28 = v3;
  uint64_t v29 = v12;
  unint64_t v16 = *(void (**)(uint64_t, unint64_t, uint64_t))(v3 + 16);
  uint64_t v14 = v3 + 16;
  double v15 = v16;
  unint64_t v17 = v12 + ((*(unsigned __int8 *)(v14 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 64));
  uint64_t v11 = (char *)(v14 - 8);
  uint64_t v18 = *(void *)(v14 + 56);
  swift_bridgeObjectRetain();
  while (1)
  {
    v15(v0, v17, v1);
    uint64_t v19 = sub_10400();
    if (!v20) {
      goto LABEL_9;
    }
    if (v19 == 0x64695F6D657469 && v20 == 0xE700000000000000) {
      break;
    }
    char v22 = sub_10810();
    swift_bridgeObjectRelease();
    if (v22) {
      goto LABEL_13;
    }
LABEL_9:
    (*(void (**)(uint64_t, uint64_t))v11)(v0, v1);
    v17 += v18;
    if (!--v13)
    {
      sub_8D64();
      uint64_t v23 = 1;
      uint64_t v9 = v27;
      uint64_t v3 = v28;
      uint64_t v11 = v26;
      goto LABEL_14;
    }
  }
  sub_8D64();
LABEL_13:
  swift_bridgeObjectRelease();
  uint64_t v3 = v28;
  uint64_t v24 = sub_8C58();
  v25(v24);
  uint64_t v23 = 0;
  uint64_t v9 = v27;
LABEL_14:
  sub_7630((uint64_t)v11, v23, 1, v1);
  swift_bridgeObjectRelease();
  sub_7658((uint64_t)v11, (uint64_t)v9);
  if (sub_76C0((uint64_t)v9, 1, v1) == 1)
  {
    sub_8608((uint64_t)v11, &qword_19508);
    sub_8608((uint64_t)v9, &qword_19508);
  }
  else
  {
    sub_103F0();
    sub_8608((uint64_t)v11, &qword_19508);
    (*(void (**)(char *, uint64_t))(v3 + 8))(v9, v1);
  }
  sub_8C94();
}

BOOL sub_5A08(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

void sub_5A18(uint64_t a1, char a2)
{
}

uint64_t sub_5A40(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x7463617265746E69 && a2 == 0xED000064496E6F69;
  if (v3 || (sub_10810() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x65727574616566 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v7 = sub_10810();
    swift_bridgeObjectRelease();
    if (v7) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_5B40()
{
  return 2;
}

Swift::Int sub_5B48(char a1)
{
  return sub_10860();
}

uint64_t sub_5B90()
{
  return 0;
}

uint64_t sub_5B9C(char a1)
{
  if (a1) {
    return 0x65727574616566;
  }
  else {
    return 0x7463617265746E69;
  }
}

BOOL sub_5BE0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_5A08(*a1, *a2);
}

Swift::Int sub_5BEC()
{
  return sub_5B48(*v0);
}

void sub_5BF4(uint64_t a1)
{
  sub_5A18(a1, *v1);
}

Swift::Int sub_5BFC()
{
  Swift::UInt v1 = *v0;
  sub_10840();
  sub_10850(v1);
  return sub_10860();
}

uint64_t sub_5C40()
{
  return sub_5B9C(*v0);
}

uint64_t sub_5C48@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_5A40(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_5C70()
{
  return sub_5B90();
}

uint64_t sub_5C90@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_5B40();
  *a1 = result;
  return result;
}

uint64_t sub_5CB8(uint64_t a1)
{
  unint64_t v2 = sub_88A8();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_5CF4(uint64_t a1)
{
  unint64_t v2 = sub_88A8();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_5D30(void *a1)
{
  uint64_t v4 = sub_4F9C(&qword_19548);
  sub_8BE4();
  uint64_t v6 = v5;
  __chkstk_darwin();
  sub_8C34();
  sub_8864(a1, a1[3]);
  sub_88A8();
  sub_10880();
  sub_107F0();
  if (!v1) {
    sub_107F0();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v2, v4);
}

uint64_t sub_5E6C(void *a1)
{
  sub_4F9C(&qword_19538);
  sub_8BE4();
  __chkstk_darwin();
  sub_8C00();
  uint64_t v3 = a1[4];
  sub_8864(a1, a1[3]);
  sub_88A8();
  sub_10870();
  if (v1)
  {
    sub_88F4((uint64_t)a1);
  }
  else
  {
    uint64_t v3 = sub_107E0();
    swift_bridgeObjectRetain();
    sub_107E0();
    uint64_t v5 = sub_8D1C();
    v6(v5);
    swift_bridgeObjectRetain();
    sub_88F4((uint64_t)a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v3;
}

uint64_t sub_6024@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_5E6C(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
    a2[2] = v6;
    a2[3] = v7;
  }
  return result;
}

uint64_t sub_6054(void *a1)
{
  return sub_5D30(a1);
}

void sub_6074()
{
  sub_8D4C();
  uint64_t v3 = v2;
  uint64_t v4 = sub_104A0();
  uint64_t v5 = sub_8CC8(v4);
  __chkstk_darwin(v5);
  sub_8CEC();
  uint64_t v6 = sub_4F9C(&qword_197E0);
  uint64_t v7 = sub_8CC8(v6);
  __chkstk_darwin(v7);
  sub_8C34();
  uint64_t v8 = sub_7FA0(v0);
  if (v9 >> 60 == 15)
  {
    sub_103C0();
    sub_8C94();
    sub_7630(v10, v11, v12, v13);
  }
  else
  {
    uint64_t v15 = v8;
    unint64_t v16 = v9;
    sub_10150();
    swift_allocObject();
    sub_10140();
    sub_8574();
    sub_10130();
    swift_release();
    sub_101E0();
    if (v17 >> 60 == 15)
    {
      uint64_t v18 = sub_103C0();
      sub_8D94(v18);
    }
    else
    {
      uint64_t v19 = sub_103C0();
      sub_10490();
      sub_85C0(&qword_19530, 255, (void (*)(uint64_t))&type metadata accessor for Siri_Nlu_External_Cdm_NluRequest);
      sub_104B0();
      sub_7630(v1, 0, 1, v19);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 32))(v3, v1, v19);
      sub_7630(v3, 0, 1, v19);
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_5290(v15, v16);
    sub_8C94();
  }
}

uint64_t sub_6348()
{
  uint64_t v0 = sub_10520();
  sub_4694(v0, qword_19848);
  sub_465C(v0, (uint64_t)qword_19848);
  type metadata accessor for SiriReferenceResolutionMetricsPlugin();
  return sub_104C0();
}

uint64_t sub_63A4()
{
  sub_10420();
  sub_10450();
  swift_allocObject();
  uint64_t result = sub_10440();
  qword_19860 = result;
  return result;
}

void sub_63F0()
{
  sub_8D4C();
  uint64_t v0 = sub_10330();
  sub_8BE4();
  uint64_t v2 = v1;
  __chkstk_darwin(v3);
  sub_8C00();
  uint64_t v6 = v5 - v4;
  sub_103B0();
  sub_10320();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v6, v0);
  sub_76E8();
  uint64_t v7 = sub_10710();
  swift_bridgeObjectRelease();
  if (*(void *)(v7 + 16))
  {
    uint64_t v8 = sub_65C4(v7);
    unint64_t v10 = v9;
    uint64_t v12 = v11;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    if (v12)
    {
      sub_10580();
      swift_bridgeObjectRelease();
      if ((v8 ^ v10) >= 0x4000)
      {
        uint64_t v13 = sub_8D34();
        sub_8004(v13, v14, v15, v16, v17);
        if ((v18 & 0x100) != 0)
        {
          uint64_t v19 = sub_8D34();
          sub_7734(v19, v20, v21, v22, v23);
        }
      }
    }
  }
  swift_bridgeObjectRelease();
  sub_8C94();
}

uint64_t sub_65C4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = *(void *)(a1 + 32 * v1);
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_6628(double a1)
{
  sub_102F0();
  sub_8BE4();
  __chkstk_darwin(v3);
  sub_8C00();
  uint64_t v58 = sub_10390();
  sub_8BE4();
  uint64_t v60 = v4;
  __chkstk_darwin(v5);
  sub_8C34();
  sub_10310();
  sub_8BE4();
  __chkstk_darwin(v6);
  sub_8CEC();
  uint64_t v7 = sub_10370();
  sub_8BE4();
  uint64_t v9 = v8;
  __chkstk_darwin(v10);
  sub_8C00();
  uint64_t v13 = v12 - v11;
  uint64_t v14 = sub_10350();
  sub_8BE4();
  uint64_t v16 = v15;
  __chkstk_darwin(v17);
  sub_8C00();
  uint64_t v20 = v19 - v18;
  unint64_t v64 = (unint64_t)&_swiftEmptyArrayStorage;
  sub_63F0();
  uint64_t v56 = v23;
  uint64_t v57 = v22;
  uint64_t v59 = v24;
  if (!v24) {
    goto LABEL_33;
  }
  if (v21)
  {
    swift_bridgeObjectRelease();
LABEL_33:
    swift_bridgeObjectRelease();
    return 0;
  }
  sub_103A0();
  sub_10340();
  (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v20, v14);
  sub_10360();
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v13, v7);
  uint64_t v25 = sub_10300();
  sub_8C4C();
  v26();
  uint64_t v27 = *(void *)(v25 + 16);
  if (v27)
  {
    v62 = *(void (**)(uint64_t, unint64_t, uint64_t))(v60 + 16);
    unint64_t v28 = v25 + ((*(unsigned __int8 *)(v60 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v60 + 80));
    uint64_t v61 = *(void *)(v60 + 72);
    uint64_t v29 = v58;
    do
    {
      v62(v1, v28, v29);
      sub_10380();
      if (qword_190B0 != -1) {
        swift_once();
      }
      sub_103D0();
      sub_8C4C();
      v30();
      uint64_t v31 = sub_10430();
      if (v31)
      {
        uint64_t v32 = v31;
        if (sub_10470() == 0xD000000000000010 && v33 == 0x8000000000012980)
        {
          swift_bridgeObjectRelease();
LABEL_13:
          type metadata accessor for LinkEntityRecord();
          swift_allocObject();
          swift_retain();
          swift_bridgeObjectRetain();
          if (sub_6F5C(v57, v59, v56, v32, a1))
          {
            if (qword_190A8 != -1) {
              swift_once();
            }
            uint64_t v36 = sub_10520();
            sub_465C(v36, (uint64_t)qword_19848);
            swift_retain_n();
            v37 = sub_10510();
            os_log_type_t v38 = sub_106D0();
            if (os_log_type_enabled(v37, v38))
            {
              os_log_type_t v54 = v38;
              v39 = (uint8_t *)swift_slowAlloc();
              v63[0] = swift_slowAlloc();
              v53 = v39;
              *(_DWORD *)v39 = 136315138;
              swift_retain();
              uint64_t v52 = sub_7134();
              unint64_t v41 = v40;
              swift_release();
              sub_9D84(v52, v41, v63);
              sub_106F0();
              swift_release_n();
              swift_bridgeObjectRelease();
              _os_log_impl(&dword_0, v37, v54, "Creating linkEntityRecord: %s", v53, 0xCu);
              swift_arrayDestroy();
              sub_8D7C();
              sub_8D7C();
            }
            else
            {

              swift_release_n();
            }
            swift_retain();
            sub_10640();
            if (*(void *)((char *)&dword_10 + (v64 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                           + (v64 & 0xFFFFFFFFFFFFFF8)) >> 1)
              sub_10660();
            sub_10670();
            sub_10650();
            swift_release();
            swift_release();
          }
          else
          {
            if (qword_190A8 != -1) {
              swift_once();
            }
            uint64_t v42 = sub_10520();
            sub_465C(v42, (uint64_t)qword_19848);
            swift_retain_n();
            v43 = sub_10510();
            os_log_type_t v44 = sub_106E0();
            if (os_log_type_enabled(v43, v44))
            {
              v55 = v43;
              uint64_t v45 = swift_slowAlloc();
              v63[0] = swift_slowAlloc();
              *(_DWORD *)uint64_t v45 = 136315138;
              sub_10480();
              swift_retain();
              uint64_t v46 = sub_10570();
              *(void *)(v45 + 4) = sub_9D84(v46, v47, v63);
              swift_release_n();
              swift_bridgeObjectRelease();
              _os_log_impl(&dword_0, v55, v44, "Failed to create record from: %s", (uint8_t *)v45, 0xCu);
              swift_arrayDestroy();
              sub_8D7C();
              sub_8D7C();
              swift_release();
            }
            else
            {
              swift_release_n();
            }
          }
          swift_release();
          uint64_t v29 = v58;
          sub_8C4C();
          v49();
          goto LABEL_30;
        }
        char v35 = sub_10810();
        swift_bridgeObjectRelease();
        if (v35) {
          goto LABEL_13;
        }
        uint64_t v29 = v58;
        sub_8C4C();
        v48();
        swift_release();
      }
      else
      {
        sub_8C4C();
        v34();
      }
      swift_release();
LABEL_30:
      v28 += v61;
      --v27;
    }
    while (v27);
  }
  swift_bridgeObjectRelease();
  unint64_t v51 = v64;
  type metadata accessor for NLRequestEntityRecordWrapper();
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = v57;
  *(void *)(result + 24) = v59;
  *(void *)(result + 32) = v56;
  *(double *)(result + 40) = a1;
  *(void *)(result + 48) = v51;
  return result;
}

uint64_t sub_6EDC()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_6F04()
{
  sub_6EDC();

  return _swift_deallocClassInstance(v0, 56, 7);
}

uint64_t type metadata accessor for NLRequestEntityRecordWrapper()
{
  return self;
}

uint64_t sub_6F5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, double a5)
{
  uint64_t v6 = v5;
  *(void *)(v5 + 24) = a2;
  *(_OWORD *)(v5 + 120) = 0u;
  *(_OWORD *)(v5 + 136) = 0u;
  *(_OWORD *)(v5 + 104) = 0u;
  *(void *)(v5 + 16) = a1;
  *(void *)(v5 + 32) = a3;
  *(double *)(v5 + 40) = a5;
  *(void *)(v5 + 96) = a4;
  swift_retain();
  uint64_t v7 = sub_55B8();
  if (!v8)
  {
    swift_release();
LABEL_9:
    swift_bridgeObjectRelease();
    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    type metadata accessor for LinkEntityRecord();
    swift_deallocPartialClassInstance();
    return 0;
  }
  *(void *)(v5 + 88) = v8;
  *(void *)(v5 + 80) = v7;
  sub_52FC();
  if (!v10)
  {
    swift_release();
LABEL_8:
    swift_bridgeObjectRelease();
    goto LABEL_9;
  }
  *(void *)(v5 + 72) = v10;
  *(void *)(v5 + 64) = v9;
  sub_5764();
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  swift_release();
  if (!v14)
  {
    swift_bridgeObjectRelease();
    goto LABEL_8;
  }
  *(void *)(v5 + 48) = v12;
  *(void *)(v5 + 56) = v14;
  return v6;
}

uint64_t sub_7084()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_70DC()
{
  sub_7084();

  return _swift_deallocClassInstance(v0, 152, 7);
}

uint64_t type metadata accessor for LinkEntityRecord()
{
  return self;
}

uint64_t sub_7134()
{
  uint64_t v1 = 7104878;
  sub_10740(183);
  v2._countAndFlagsBits = 0xD00000000000001BLL;
  sub_8CAC(v2, (uint64_t)"LinkEntityRecord<requestId:");
  swift_bridgeObjectRetain();
  sub_8C78();
  swift_bridgeObjectRelease();
  v3._countAndFlagsBits = 0xD000000000000014;
  sub_8CAC(v3, (uint64_t)", resultCandidateId:");
  v11._countAndFlagsBits = sub_10800();
  sub_105B0(v11);
  swift_bridgeObjectRelease();
  v12._countAndFlagsBits = 0x736575716572202CLL;
  v12._object = (void *)0xEE003A656D695474;
  sub_105B0(v12);
  sub_10680();
  sub_8C10((uint64_t)", sourceBundleId:");
  swift_bridgeObjectRetain();
  sub_8C78();
  swift_bridgeObjectRelease();
  sub_8C10((uint64_t)", linkEntityType:");
  swift_bridgeObjectRetain();
  sub_8C78();
  swift_bridgeObjectRelease();
  v13._countAndFlagsBits = 0x6E456B6E696C202CLL;
  v13._object = (void *)0xEF3A644979746974;
  sub_105B0(v13);
  swift_bridgeObjectRetain();
  sub_8C78();
  swift_bridgeObjectRelease();
  sub_8C10((uint64_t)" executionFlowId:");
  if (v0[14])
  {
    uint64_t v4 = v0[13];
    uint64_t v5 = (void *)v0[14];
  }
  else
  {
    uint64_t v5 = (void *)0xE300000000000000;
    uint64_t v4 = 7104878;
  }
  swift_bridgeObjectRetain();
  v14._countAndFlagsBits = v4;
  v14._object = v5;
  sub_105B0(v14);
  swift_bridgeObjectRelease();
  v15._countAndFlagsBits = 0x737261506C6E202CLL;
  v15._object = (void *)0xEC0000003A644965;
  sub_105B0(v15);
  if (v0[18])
  {
    uint64_t v6 = v0[17];
    uint64_t v7 = (void *)v0[18];
  }
  else
  {
    uint64_t v7 = (void *)0xE300000000000000;
    uint64_t v6 = 7104878;
  }
  swift_bridgeObjectRetain();
  v16._countAndFlagsBits = v6;
  v16._object = v7;
  sub_105B0(v16);
  swift_bridgeObjectRelease();
  v8._countAndFlagsBits = 0xD000000000000019;
  sub_8CAC(v8, (uint64_t)", linkTranscriptRecordId:");
  if (v0[16])
  {
    uint64_t v1 = v0[15];
    uint64_t v9 = (void *)v0[16];
  }
  else
  {
    uint64_t v9 = (void *)0xE300000000000000;
  }
  swift_bridgeObjectRetain();
  v17._countAndFlagsBits = v1;
  v17._object = v9;
  sub_105B0(v17);
  swift_bridgeObjectRelease();
  v18._countAndFlagsBits = 62;
  v18._object = (void *)0xE100000000000000;
  sub_105B0(v18);
  return 0;
}

uint64_t sub_73D4()
{
  return sub_7134();
}

BOOL sub_73F8(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

void sub_7404()
{
  sub_10850(v0);
}

Swift::Int sub_7430()
{
  sub_10840();
  sub_10850(v0);
  return sub_10860();
}

Swift::Int sub_7478()
{
  return sub_7430();
}

void sub_749C()
{
}

Swift::Int sub_74C0()
{
  return sub_10860();
}

BOOL sub_7500(uint64_t *a1, uint64_t *a2)
{
  return sub_73F8(*a1, *a2);
}

uint64_t sub_7524(uint64_t a1, uint64_t a2)
{
  return sub_85C0(&qword_19500, a2, (void (*)(uint64_t))type metadata accessor for LinkEntityRecord);
}

void *sub_756C(uint64_t a1, uint64_t a2)
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
  sub_4F9C(&qword_19520);
  uint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_75D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    uint64_t v6 = sub_10610();
    sub_8D04(v6);
    return v7 | 4;
  }
  else
  {
    uint64_t v3 = sub_105E0();
    sub_8D04(v3);
    return v4 | 8;
  }
}

uint64_t sub_7630(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_7658(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_4F9C(&qword_19508);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_76C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

unint64_t sub_76E8()
{
  unint64_t result = qword_19510;
  if (!qword_19510)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_19510);
  }
  return result;
}

unsigned __int8 *sub_7734(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v16 = a1;
  uint64_t v17 = a2;
  uint64_t v18 = a3;
  uint64_t v19 = a4;
  sub_80E0();
  swift_bridgeObjectRetain();
  uint64_t v6 = sub_10620();
  uint64_t v8 = v6;
  unint64_t v9 = v7;
  if ((v7 & 0x1000000000000000) == 0)
  {
    if ((v7 & 0x2000000000000000) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v11 = HIBYTE(v9) & 0xF;
    uint64_t v16 = v8;
    uint64_t v17 = v9 & 0xFFFFFFFFFFFFFFLL;
    uint64_t v10 = (unsigned __int8 *)&v16;
    goto LABEL_7;
  }
  uint64_t v8 = sub_7AA4(v6, v7);
  unint64_t v13 = v12;
  swift_bridgeObjectRelease();
  unint64_t v9 = v13;
  if ((v13 & 0x2000000000000000) != 0) {
    goto LABEL_6;
  }
LABEL_3:
  if ((v8 & 0x1000000000000000) != 0)
  {
    uint64_t v10 = (unsigned __int8 *)((v9 & 0xFFFFFFFFFFFFFFFLL) + 32);
    uint64_t v11 = v8 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    uint64_t v10 = (unsigned __int8 *)sub_10780();
  }
LABEL_7:
  Swift::String v14 = sub_7828(v10, v11, a5);
  swift_bridgeObjectRelease();
  return v14;
}

unsigned __int8 *sub_7828(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a2;
  int v4 = *result;
  if (v4 == 43)
  {
    if (a2 >= 1)
    {
      uint64_t v15 = a2 - 1;
      if (a2 != 1)
      {
        unsigned __int8 v16 = a3 + 48;
        unsigned __int8 v17 = a3 + 55;
        unsigned __int8 v18 = a3 + 87;
        if (a3 > 10)
        {
          unsigned __int8 v16 = 58;
        }
        else
        {
          unsigned __int8 v18 = 97;
          unsigned __int8 v17 = 65;
        }
        if (result)
        {
          uint64_t v9 = 0;
          uint64_t v19 = result + 1;
          do
          {
            unsigned int v20 = *v19;
            if (v20 < 0x30 || v20 >= v16)
            {
              if (v20 < 0x41 || v20 >= v17)
              {
                uint64_t v13 = 0;
                if (v20 < 0x61 || v20 >= v18) {
                  return (unsigned __int8 *)v13;
                }
                char v21 = -87;
              }
              else
              {
                char v21 = -55;
              }
            }
            else
            {
              char v21 = -48;
            }
            uint64_t v22 = v9 * a3;
            if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63) {
              return 0;
            }
            uint64_t v9 = v22 + (v20 + v21);
            if (__OFADD__(v22, (v20 + v21))) {
              return 0;
            }
            ++v19;
            --v15;
          }
          while (v15);
          return (unsigned __int8 *)v9;
        }
        return 0;
      }
      return 0;
    }
  }
  else
  {
    if (v4 != 45)
    {
      if (a2)
      {
        unsigned __int8 v23 = a3 + 48;
        unsigned __int8 v24 = a3 + 55;
        unsigned __int8 v25 = a3 + 87;
        if (a3 > 10)
        {
          unsigned __int8 v23 = 58;
        }
        else
        {
          unsigned __int8 v25 = 97;
          unsigned __int8 v24 = 65;
        }
        if (result)
        {
          uint64_t v26 = 0;
          do
          {
            unsigned int v27 = *result;
            if (v27 < 0x30 || v27 >= v23)
            {
              if (v27 < 0x41 || v27 >= v24)
              {
                uint64_t v13 = 0;
                if (v27 < 0x61 || v27 >= v25) {
                  return (unsigned __int8 *)v13;
                }
                char v28 = -87;
              }
              else
              {
                char v28 = -55;
              }
            }
            else
            {
              char v28 = -48;
            }
            uint64_t v29 = v26 * a3;
            if ((unsigned __int128)(v26 * (__int128)a3) >> 64 != (v26 * a3) >> 63) {
              return 0;
            }
            uint64_t v26 = v29 + (v27 + v28);
            if (__OFADD__(v29, (v27 + v28))) {
              return 0;
            }
            ++result;
            --v3;
          }
          while (v3);
          return (unsigned __int8 *)(v29 + (v27 + v28));
        }
        return 0;
      }
      return 0;
    }
    if (a2 >= 1)
    {
      uint64_t v5 = a2 - 1;
      if (a2 != 1)
      {
        unsigned __int8 v6 = a3 + 48;
        unsigned __int8 v7 = a3 + 55;
        unsigned __int8 v8 = a3 + 87;
        if (a3 > 10)
        {
          unsigned __int8 v6 = 58;
        }
        else
        {
          unsigned __int8 v8 = 97;
          unsigned __int8 v7 = 65;
        }
        if (result)
        {
          uint64_t v9 = 0;
          for (uint64_t i = result + 1; ; ++i)
          {
            unsigned int v11 = *i;
            if (v11 < 0x30 || v11 >= v6)
            {
              if (v11 < 0x41 || v11 >= v7)
              {
                uint64_t v13 = 0;
                if (v11 < 0x61 || v11 >= v8) {
                  return (unsigned __int8 *)v13;
                }
                char v12 = -87;
              }
              else
              {
                char v12 = -55;
              }
            }
            else
            {
              char v12 = -48;
            }
            uint64_t v14 = v9 * a3;
            if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63) {
              return 0;
            }
            uint64_t v9 = v14 - (v11 + v12);
            if (__OFSUB__(v14, (v11 + v12))) {
              return 0;
            }
            if (!--v5) {
              return (unsigned __int8 *)v9;
            }
          }
        }
        return 0;
      }
      return 0;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_7AA4(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = sub_7B10((uint64_t)sub_7B0C, 0, a1, a2);
  uint64_t v6 = sub_7B44(v2, v3, v4, v5);
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_7B10(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v4 = HIBYTE(a4) & 0xF;
  if ((a4 & 0x2000000000000000) == 0) {
    uint64_t v4 = a3;
  }
  uint64_t v5 = 7;
  if (((a4 >> 60) & ((a3 & 0x800000000000000) == 0)) != 0) {
    uint64_t v5 = 11;
  }
  return String.subscript.getter(15, v5 | (v4 << 16));
}

uint64_t sub_7B44(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  if ((a4 & 0x1000000000000000) != 0)
  {
    uint64_t v9 = sub_7C9C(a1, a2, a3, a4);
    if (!v9
      || (uint64_t v10 = v9,
          unsigned int v11 = sub_756C(v9, 0),
          unint64_t v12 = sub_7D9C((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4),
          swift_bridgeObjectRetain(),
          swift_bridgeObjectRelease(),
          v12 == v10))
    {
      uint64_t v13 = sub_10590();
      swift_release();
      return v13;
    }
    __break(1u);
  }
  else
  {
    if ((a4 & 0x2000000000000000) != 0)
    {
      v14[0] = a3;
      v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
      return sub_10590();
    }
    if ((a3 & 0x1000000000000000) != 0) {
      goto LABEL_4;
    }
  }
  sub_10780();
LABEL_4:

  return sub_10590();
}

uint64_t sub_7C9C(uint64_t result, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v7 = result;
  uint64_t v8 = (a3 >> 59) & 1;
  if ((a4 & 0x1000000000000000) == 0) {
    LOBYTE(v8) = 1;
  }
  uint64_t v9 = 4 << v8;
  if ((result & 0xC) == 4 << v8)
  {
    unint64_t result = sub_75D4(result, a3, a4);
    unint64_t v7 = result;
  }
  if ((a2 & 0xC) == v9)
  {
    unint64_t result = sub_75D4(a2, a3, a4);
    a2 = result;
    if ((a4 & 0x1000000000000000) == 0) {
      return (a2 >> 16) - (v7 >> 16);
    }
  }
  else if ((a4 & 0x1000000000000000) == 0)
  {
    return (a2 >> 16) - (v7 >> 16);
  }
  unint64_t v10 = HIBYTE(a4) & 0xF;
  if ((a4 & 0x2000000000000000) == 0) {
    unint64_t v10 = a3 & 0xFFFFFFFFFFFFLL;
  }
  if (v10 < v7 >> 16)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v10 < a2 >> 16)
  {
LABEL_17:
    __break(1u);
    return result;
  }

  return sub_105F0();
}

unint64_t sub_7D9C(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  uint64_t v9 = (void *)result;
  if (!a2) {
    goto LABEL_5;
  }
  if (!a3)
  {
    unint64_t v12 = a4;
    uint64_t v11 = 0;
    goto LABEL_35;
  }
  if (a3 < 0) {
    goto LABEL_38;
  }
  unint64_t v10 = a5 >> 14;
  unint64_t v27 = a4 >> 14;
  if (a4 >> 14 == a5 >> 14)
  {
LABEL_5:
    uint64_t v11 = 0;
    unint64_t v12 = a4;
LABEL_35:
    void *v9 = a4;
    v9[1] = a5;
    v9[2] = a6;
    v9[3] = a7;
    v9[4] = v12;
    return v11;
  }
  uint64_t v11 = 0;
  uint64_t v14 = (a6 >> 59) & 1;
  if ((a7 & 0x1000000000000000) == 0) {
    LOBYTE(v14) = 1;
  }
  uint64_t v15 = 4 << v14;
  uint64_t v21 = (a7 & 0xFFFFFFFFFFFFFFFLL) + 32;
  uint64_t v22 = a7 & 0xFFFFFFFFFFFFFFLL;
  uint64_t v16 = HIBYTE(a7) & 0xF;
  if ((a7 & 0x2000000000000000) == 0) {
    uint64_t v16 = a6 & 0xFFFFFFFFFFFFLL;
  }
  unint64_t v23 = v16;
  uint64_t v26 = a3 - 1;
  unint64_t v12 = a4;
  while (1)
  {
    unint64_t result = v12;
    if ((v12 & 0xC) == v15) {
      unint64_t result = sub_75D4(v12, a6, a7);
    }
    if (result >> 14 < v27 || result >> 14 >= v10) {
      break;
    }
    if ((a7 & 0x1000000000000000) != 0)
    {
      unint64_t result = sub_10600();
      char v19 = result;
    }
    else
    {
      unint64_t v18 = result >> 16;
      if ((a7 & 0x2000000000000000) != 0)
      {
        v28[0] = a6;
        v28[1] = v22;
        char v19 = *((unsigned char *)v28 + v18);
      }
      else
      {
        unint64_t result = v21;
        if ((a6 & 0x1000000000000000) == 0) {
          unint64_t result = sub_10780();
        }
        char v19 = *(unsigned char *)(result + v18);
      }
    }
    if ((v12 & 0xC) == v15)
    {
      unint64_t result = sub_75D4(v12, a6, a7);
      unint64_t v12 = result;
      if ((a7 & 0x1000000000000000) == 0)
      {
LABEL_27:
        unint64_t v12 = (v12 & 0xFFFFFFFFFFFF0000) + 65540;
        goto LABEL_31;
      }
    }
    else if ((a7 & 0x1000000000000000) == 0)
    {
      goto LABEL_27;
    }
    if (v23 <= v12 >> 16) {
      goto LABEL_37;
    }
    unint64_t v12 = sub_105D0();
LABEL_31:
    *(unsigned char *)(a2 + v11) = v19;
    if (v26 == v11)
    {
      uint64_t v11 = a3;
      goto LABEL_35;
    }
    ++v11;
    if (v10 == v12 >> 14) {
      goto LABEL_35;
    }
  }
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
  return result;
}

uint64_t sub_7FA0(void *a1)
{
  id v1 = [a1 json];
  if (!v1) {
    return 0;
  }
  unint64_t v2 = v1;
  uint64_t v3 = sub_10200();

  return v3;
}

uint64_t sub_8004(uint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4, uint64_t a5)
{
  if ((a4 & 0x1000000000000000) != 0)
  {
    uint64_t result = 0;
    goto LABEL_8;
  }
  if ((a4 & 0x2000000000000000) != 0)
  {
    uint64_t v12 = HIBYTE(a4) & 0xF;
    v15[0] = a3;
    v15[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    uint64_t v11 = v15;
  }
  else if ((a3 & 0x1000000000000000) != 0)
  {
    uint64_t v11 = (void *)((a4 & 0xFFFFFFFFFFFFFFFLL) + 32);
    uint64_t v12 = a3 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    uint64_t v11 = (void *)sub_10780();
  }
  uint64_t result = sub_8130((uint64_t)v11, v12, a1, a2, a3, a4, a5);
  if (!v5)
  {
    char v16 = v14 & 1;
LABEL_8:
    LOBYTE(v15[0]) = (a4 & 0x1000000000000000) != 0;
  }
  return result;
}

unint64_t sub_80E0()
{
  unint64_t result = qword_19518;
  if (!qword_19518)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_19518);
  }
  return result;
}

uint64_t sub_8130(uint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, uint64_t a7)
{
  unint64_t v11 = a3;
  uint64_t v12 = result;
  uint64_t v13 = (a5 >> 59) & 1;
  if ((a6 & 0x1000000000000000) == 0) {
    LOBYTE(v13) = 1;
  }
  uint64_t v14 = 4 << v13;
  uint64_t v15 = a3 & 0xC;
  unint64_t v16 = a3;
  if (v15 == 4 << v13)
  {
    unint64_t result = sub_75D4(a3, a5, a6);
    unint64_t v16 = result;
  }
  uint64_t v17 = HIBYTE(a6) & 0xF;
  if ((a6 & 0x1000000000000000) != 0)
  {
    unint64_t v19 = a5 & 0xFFFFFFFFFFFFLL;
    if ((a6 & 0x2000000000000000) != 0) {
      unint64_t v19 = HIBYTE(a6) & 0xF;
    }
    if (v19 < v16 >> 16) {
      goto LABEL_96;
    }
    unint64_t result = sub_105F0();
    uint64_t v18 = result;
    uint64_t v17 = HIBYTE(a6) & 0xF;
  }
  else
  {
    uint64_t v18 = v16 >> 16;
  }
  if (v15 == v14)
  {
    uint64_t v20 = v17;
    unint64_t result = sub_75D4(v11, a5, a6);
    uint64_t v17 = v20;
    unint64_t v11 = result;
  }
  if ((a4 & 0xC) == v14)
  {
    uint64_t v21 = a4;
    uint64_t v22 = v17;
    unint64_t result = sub_75D4(v21, a5, a6);
    uint64_t v17 = v22;
    a4 = result;
    if ((a6 & 0x1000000000000000) == 0) {
      goto LABEL_11;
    }
  }
  else if ((a6 & 0x1000000000000000) == 0)
  {
LABEL_11:
    unint64_t result = (a4 >> 16) - (v11 >> 16);
    goto LABEL_22;
  }
  unint64_t v23 = a5 & 0xFFFFFFFFFFFFLL;
  if ((a6 & 0x2000000000000000) != 0) {
    unint64_t v23 = v17;
  }
  if (v23 < v11 >> 16) {
    goto LABEL_92;
  }
  if (v23 < a4 >> 16)
  {
LABEL_93:
    __break(1u);
    goto LABEL_94;
  }
  unint64_t result = sub_105F0();
LABEL_22:
  uint64_t v24 = v18 + result;
  if (__OFADD__(v18, result))
  {
    __break(1u);
    goto LABEL_91;
  }
  if (v24 < v18)
  {
LABEL_91:
    __break(1u);
LABEL_92:
    __break(1u);
    goto LABEL_93;
  }
  unsigned __int8 v25 = (unsigned __int8 *)(v12 + v18);
  if (!v12) {
    unsigned __int8 v25 = 0;
  }
  int v26 = *v25;
  if (v26 == 43)
  {
    if (result >= 1)
    {
      if (result != 1)
      {
        unsigned __int8 v37 = a7 + 48;
        unsigned __int8 v38 = a7 + 55;
        unsigned __int8 v39 = a7 + 87;
        if (a7 > 10)
        {
          unsigned __int8 v37 = 58;
        }
        else
        {
          unsigned __int8 v39 = 97;
          unsigned __int8 v38 = 65;
        }
        if (v25)
        {
          uint64_t v30 = 0;
          unint64_t v40 = v25 + 1;
          uint64_t v41 = result - 1;
          do
          {
            unsigned int v42 = *v40;
            if (v42 < 0x30 || v42 >= v37)
            {
              if (v42 < 0x41 || v42 >= v38)
              {
                uint64_t v35 = 0;
                if (v42 < 0x61 || v42 >= v39) {
                  return v35;
                }
                char v43 = -87;
              }
              else
              {
                char v43 = -55;
              }
            }
            else
            {
              char v43 = -48;
            }
            uint64_t v44 = v30 * a7;
            if ((unsigned __int128)(v30 * (__int128)a7) >> 64 != (v30 * a7) >> 63) {
              return 0;
            }
            uint64_t v30 = v44 + (v42 + v43);
            if (__OFADD__(v44, (v42 + v43))) {
              return 0;
            }
            ++v40;
            --v41;
          }
          while (v41);
          return v30;
        }
        return 0;
      }
      return 0;
    }
    goto LABEL_95;
  }
  if (v26 != 45)
  {
    if (v24 != v18)
    {
      unsigned __int8 v45 = a7 + 48;
      unsigned __int8 v46 = a7 + 55;
      unsigned __int8 v47 = a7 + 87;
      if (a7 > 10)
      {
        unsigned __int8 v45 = 58;
      }
      else
      {
        unsigned __int8 v47 = 97;
        unsigned __int8 v46 = 65;
      }
      if (v25)
      {
        uint64_t v48 = 0;
        do
        {
          unsigned int v49 = *v25;
          if (v49 < 0x30 || v49 >= v45)
          {
            if (v49 < 0x41 || v49 >= v46)
            {
              uint64_t v35 = 0;
              if (v49 < 0x61 || v49 >= v47) {
                return v35;
              }
              char v50 = -87;
            }
            else
            {
              char v50 = -55;
            }
          }
          else
          {
            char v50 = -48;
          }
          uint64_t v51 = v48 * a7;
          if ((unsigned __int128)(v48 * (__int128)a7) >> 64 != (v48 * a7) >> 63) {
            return 0;
          }
          uint64_t v48 = v51 + (v49 + v50);
          if (__OFADD__(v51, (v49 + v50))) {
            return 0;
          }
          ++v25;
          --result;
        }
        while (result);
        return v51 + (v49 + v50);
      }
      return 0;
    }
    return 0;
  }
  if (result >= 1)
  {
    if (result != 1)
    {
      unsigned __int8 v27 = a7 + 48;
      unsigned __int8 v28 = a7 + 55;
      unsigned __int8 v29 = a7 + 87;
      if (a7 > 10)
      {
        unsigned __int8 v27 = 58;
      }
      else
      {
        unsigned __int8 v29 = 97;
        unsigned __int8 v28 = 65;
      }
      if (v25)
      {
        uint64_t v30 = 0;
        uint64_t v31 = v25 + 1;
        uint64_t v32 = result - 1;
        while (1)
        {
          unsigned int v33 = *v31;
          if (v33 < 0x30 || v33 >= v27)
          {
            if (v33 < 0x41 || v33 >= v28)
            {
              uint64_t v35 = 0;
              if (v33 < 0x61 || v33 >= v29) {
                return v35;
              }
              char v34 = -87;
            }
            else
            {
              char v34 = -55;
            }
          }
          else
          {
            char v34 = -48;
          }
          uint64_t v36 = v30 * a7;
          if ((unsigned __int128)(v30 * (__int128)a7) >> 64 != (v30 * a7) >> 63) {
            return 0;
          }
          uint64_t v30 = v36 - (v33 + v34);
          if (__OFSUB__(v36, (v33 + v34))) {
            return 0;
          }
          ++v31;
          if (!--v32) {
            return v30;
          }
        }
      }
      return 0;
    }
    return 0;
  }
LABEL_94:
  __break(1u);
LABEL_95:
  __break(1u);
LABEL_96:
  __break(1u);
  return result;
}

unint64_t sub_8574()
{
  unint64_t result = qword_19528;
  if (!qword_19528)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_19528);
  }
  return result;
}

uint64_t sub_85C0(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a3(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_8608(uint64_t a1, uint64_t *a2)
{
  sub_4F9C(a2);
  sub_8C4C();
  v3();
  return a1;
}

uint64_t initializeBufferWithCopyOfBuffer for FSFFeatureSwiftStruct(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for FSFFeatureSwiftStruct()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for FSFFeatureSwiftStruct(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for FSFFeatureSwiftStruct(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for FSFFeatureSwiftStruct(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

void *assignWithTake for FSFFeatureSwiftStruct(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for FSFFeatureSwiftStruct(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 32))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 8);
      if (v2 >= 0xFFFFFFFF) {
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

uint64_t storeEnumTagSinglePayload for FSFFeatureSwiftStruct(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for FSFFeatureSwiftStruct()
{
  return &type metadata for FSFFeatureSwiftStruct;
}

void *sub_8864(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_88A8()
{
  unint64_t result = qword_19540;
  if (!qword_19540)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_19540);
  }
  return result;
}

uint64_t sub_88F4(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

unsigned char *initializeBufferWithCopyOfBuffer for FSFFeatureSwiftStruct.CodingKeys(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for FSFFeatureSwiftStruct.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFF)
  {
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
      if (!v4) {
        goto LABEL_17;
      }
    }
    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }
    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }
    int v5 = (*a1 | (v4 << 8)) - 2;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v5 = v6 - 2;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for FSFFeatureSwiftStruct.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x8AA8);
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

uint64_t sub_8AD0(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_8AD8(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for FSFFeatureSwiftStruct.CodingKeys()
{
  return &type metadata for FSFFeatureSwiftStruct.CodingKeys;
}

unint64_t sub_8AF8()
{
  unint64_t result = qword_19550;
  if (!qword_19550)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_19550);
  }
  return result;
}

unint64_t sub_8B48()
{
  unint64_t result = qword_19558;
  if (!qword_19558)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_19558);
  }
  return result;
}

unint64_t sub_8B98()
{
  unint64_t result = qword_19560;
  if (!qword_19560)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_19560);
  }
  return result;
}

void sub_8C10(uint64_t a1@<X8>)
{
  v2._countAndFlagsBits = 0xD000000000000011;
  v2._object = (void *)((a1 - 32) | 0x8000000000000000);
  sub_105B0(v2);
}

uint64_t sub_8C58()
{
  return *(void *)(v0 - 112);
}

void sub_8C78()
{
  v3._countAndFlagsBits = v0;
  v3._object = v1;
  sub_105B0(v3);
}

void sub_8CAC(Swift::String a1@<X1:X0>, uint64_t a2@<X8>)
{
  a1._object = (void *)((a2 - 32) | 0x8000000000000000);
  sub_105B0(a1);
}

uint64_t sub_8CC8(uint64_t a1)
{
  return a1 - 8;
}

unint64_t sub_8D04(uint64_t a1)
{
  return a1 & 0xFFFFFFFFFFFFFFFCLL | v1 & 3;
}

uint64_t sub_8D1C()
{
  return v0;
}

uint64_t sub_8D34()
{
  return v0;
}

uint64_t sub_8D64()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_8D7C()
{
  return swift_slowDealloc();
}

uint64_t sub_8D94(uint64_t a1)
{
  return sub_7630(v1, 1, 1, a1);
}

uint64_t sub_8DB4(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_107C0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
  }
  if ((unint64_t)*v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_107C0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = *(void *)((char *)&dword_10 + (*v1 & 0xFFFFFFFFFFFFFF8));
  }
  if (__OFADD__(v4, v3))
  {
    __break(1u);
    goto LABEL_22;
  }
  unint64_t v5 = *v1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *uint64_t v1 = v5;
  if (isUniquelyReferenced_nonNull_bridgeObject)
  {
    if ((v5 & 0x8000000000000000) == 0 && (v5 & 0x4000000000000000) == 0)
    {
      uint64_t v7 = v5 & 0xFFFFFFFFFFFFFF8;
      if (v4 + v3 <= *(void *)((char *)&dword_18 + (v5 & 0xFFFFFFFFFFFFFF8)) >> 1) {
        goto LABEL_12;
      }
    }
  }
  if (v5 >> 62) {
    goto LABEL_23;
  }
  while (1)
  {
    swift_bridgeObjectRetain();
    uint64_t v8 = sub_10770();
    swift_bridgeObjectRelease();
    *uint64_t v1 = v8;
    uint64_t v7 = v8 & 0xFFFFFFFFFFFFFF8;
LABEL_12:
    uint64_t result = sub_A56C(v7 + 8 * *(void *)(v7 + 16) + 32, (*(void *)(v7 + 24) >> 1) - *(void *)(v7 + 16), a1);
    if (v10 >= v3) {
      break;
    }
LABEL_22:
    __break(1u);
LABEL_23:
    swift_bridgeObjectRetain();
    sub_107C0();
    swift_bridgeObjectRelease();
  }
  if (v10 >= 1)
  {
    uint64_t v11 = *(void *)((char *)&dword_10 + (*v1 & 0xFFFFFFFFFFFFFF8));
    BOOL v12 = __OFADD__(v11, v10);
    uint64_t v13 = v11 + v10;
    if (v12)
    {
      __break(1u);
      return result;
    }
    *(void *)((char *)&dword_10 + (*v1 & 0xFFFFFFFFFFFFFF8)) = v13;
  }
  swift_bridgeObjectRelease();

  return sub_10650();
}

uint64_t sub_8F7C(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_107C0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
  }
  if ((unint64_t)*v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_107C0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = *(void *)((char *)&dword_10 + (*v1 & 0xFFFFFFFFFFFFFF8));
  }
  if (__OFADD__(v4, v3))
  {
    __break(1u);
    goto LABEL_22;
  }
  unint64_t v5 = *v1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *uint64_t v1 = v5;
  if (isUniquelyReferenced_nonNull_bridgeObject)
  {
    if ((v5 & 0x8000000000000000) == 0 && (v5 & 0x4000000000000000) == 0)
    {
      uint64_t v7 = v5 & 0xFFFFFFFFFFFFFF8;
      if (v4 + v3 <= *(void *)((char *)&dword_18 + (v5 & 0xFFFFFFFFFFFFFF8)) >> 1) {
        goto LABEL_12;
      }
    }
  }
  if (v5 >> 62) {
    goto LABEL_23;
  }
  while (1)
  {
    swift_bridgeObjectRetain();
    uint64_t v8 = sub_10770();
    swift_bridgeObjectRelease();
    *uint64_t v1 = v8;
    uint64_t v7 = v8 & 0xFFFFFFFFFFFFFF8;
LABEL_12:
    uint64_t result = sub_A708(v7 + 8 * *(void *)(v7 + 16) + 32, (*(void *)(v7 + 24) >> 1) - *(void *)(v7 + 16), a1);
    if (v10 >= v3) {
      break;
    }
LABEL_22:
    __break(1u);
LABEL_23:
    swift_bridgeObjectRetain();
    sub_107C0();
    swift_bridgeObjectRelease();
  }
  if (v10 >= 1)
  {
    uint64_t v11 = *(void *)((char *)&dword_10 + (*v1 & 0xFFFFFFFFFFFFFF8));
    BOOL v12 = __OFADD__(v11, v10);
    uint64_t v13 = v11 + v10;
    if (v12)
    {
      __break(1u);
      return result;
    }
    *(void *)((char *)&dword_10 + (*v1 & 0xFFFFFFFFFFFFFF8)) = v13;
  }
  swift_bridgeObjectRelease();

  return sub_10650();
}

uint64_t SiriReferenceResolutionMetricsPlugin.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  sub_104C0();
  return v0;
}

uint64_t SiriReferenceResolutionMetricsPlugin.init()()
{
  type metadata accessor for SiriReferenceResolutionMetricsPlugin();
  sub_104C0();
  return v0;
}

uint64_t type metadata accessor for SiriReferenceResolutionMetricsPlugin()
{
  uint64_t result = qword_195A0;
  if (!qword_195A0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t SiriReferenceResolutionMetricsPlugin.run(context:completion:)(uint64_t a1, void (*a2)(char *), uint64_t a3)
{
  uint64_t v92 = a3;
  v93 = a2;
  sub_104E0();
  sub_8BE4();
  uint64_t v94 = v5;
  uint64_t v95 = v4;
  __chkstk_darwin(v4);
  sub_AA38();
  sub_AAE8();
  __chkstk_darwin(v6);
  v91 = (char *)v81 - v7;
  uint64_t v8 = sub_4F9C(&qword_197F0);
  __chkstk_darwin(v8 - 8);
  sub_AA38();
  sub_AAE8();
  __chkstk_darwin(v9);
  sub_AA74((uint64_t)v81 - v10);
  sub_102B0();
  sub_8BE4();
  uint64_t v88 = v12;
  v89 = v11;
  __chkstk_darwin(v11);
  sub_AA4C();
  sub_AA74(v13);
  uint64_t v87 = sub_102C0();
  sub_8BE4();
  uint64_t v86 = v14;
  __chkstk_darwin(v15);
  sub_AA4C();
  uint64_t v83 = v16;
  uint64_t v17 = sub_4F9C(&qword_19568);
  __chkstk_darwin(v17 - 8);
  sub_AA4C();
  sub_AA74(v18);
  uint64_t v90 = sub_10240();
  sub_8BE4();
  uint64_t v84 = v19;
  __chkstk_darwin(v20);
  sub_AA38();
  sub_AAE8();
  uint64_t v22 = __chkstk_darwin(v21);
  uint64_t v24 = (char *)v81 - v23;
  __chkstk_darwin(v22);
  sub_AA74((uint64_t)v81 - v25);
  uint64_t v26 = sub_10500();
  sub_8BE4();
  uint64_t v28 = v27;
  uint64_t v30 = __chkstk_darwin(v29);
  uint64_t v32 = (char *)v81 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v30);
  char v34 = (char *)v81 - v33;
  (*(void (**)(char *, void, uint64_t))(v28 + 104))((char *)v81 - v33, enum case for PrivateLearningPluginRunContext.maintenance(_:), v26);
  char v35 = sub_104F0();
  uint64_t v36 = *(void (**)(char *, uint64_t))(v28 + 8);
  v36(v34, v26);
  if (v35)
  {
    v96 += OBJC_IVAR____TtC36SiriReferenceResolutionMetricsPlugin36SiriReferenceResolutionMetricsPlugin_logger;
    unsigned __int8 v37 = sub_10510();
    os_log_type_t v38 = sub_106D0();
    if (os_log_type_enabled(v37, v38))
    {
      unsigned __int8 v39 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unsigned __int8 v39 = 0;
      _os_log_impl(&dword_0, v37, v38, "About to start SiriReferenceResolutionMetricsPlugin run", v39, 2u);
      sub_AA98();
    }

    uint64_t v40 = v83;
    sub_102A0();
    uint64_t v41 = sub_AA60();
    v42(v41);
    sub_10230();
    uint64_t v43 = v85;
    sub_10290();
    uint64_t v44 = v84;
    unsigned __int8 v45 = *(void (**)(char *, uint64_t))(v84 + 8);
    uint64_t v46 = v90;
    v45(v24, v90);
    uint64_t v47 = sub_AA20();
    v48(v47);
    (*(void (**)(uint64_t, uint64_t))(v86 + 8))(v40, v87);
    if (sub_76C0(v43, 1, v46) == 1)
    {
      return sub_A524(v43, &qword_19568);
    }
    else
    {
      uint64_t v55 = v82;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v44 + 32))(v82, v43, v46);
      (*(void (**)(void, uint64_t, uint64_t))(v44 + 16))(v81[3], v55, v46);
      uint64_t v56 = sub_101C0();
      sub_AAB4((uint64_t)&v100);
      type metadata accessor for MetricsCollector();
      swift_allocObject();
      sub_AAF8();
      uint64_t v58 = v57;
      uint64_t v59 = sub_D000();
      uint64_t v60 = v59;
      if (v59)
      {
        uint64_t v87 = v56;
        uint64_t v88 = v58;
        v89 = v45;
        v97 = &_swiftEmptyArrayStorage;
        sub_A8A4(v59, v98);
        uint64_t v61 = v98[1];
        uint64_t v62 = v98[3];
        uint64_t v63 = v98[4];
        int64_t v64 = (unint64_t)(v98[2] + 64) >> 6;
        uint64_t result = swift_bridgeObjectRetain();
        if (!v63) {
          goto LABEL_11;
        }
LABEL_10:
        v63 &= v63 - 1;
        while (1)
        {
          unint64_t v69 = swift_bridgeObjectRetain();
          uint64_t result = sub_8F7C(v69);
          if (v63) {
            goto LABEL_10;
          }
LABEL_11:
          int64_t v65 = v62 + 1;
          if (__OFADD__(v62, 1)) {
            break;
          }
          if (v65 >= v64) {
            goto LABEL_33;
          }
          uint64_t v66 = *(void *)(v61 + 8 * v65);
          uint64_t v67 = v62 + 1;
          if (!v66)
          {
            uint64_t v67 = v62 + 2;
            if (v62 + 2 >= v64) {
              goto LABEL_33;
            }
            uint64_t v66 = *(void *)(v61 + 8 * v67);
            if (!v66)
            {
              uint64_t v67 = v62 + 3;
              if (v62 + 3 >= v64) {
                goto LABEL_33;
              }
              uint64_t v66 = *(void *)(v61 + 8 * v67);
              if (!v66)
              {
                uint64_t v67 = v62 + 4;
                if (v62 + 4 >= v64) {
                  goto LABEL_33;
                }
                uint64_t v66 = *(void *)(v61 + 8 * v67);
                if (!v66)
                {
                  uint64_t v67 = v62 + 5;
                  if (v62 + 5 >= v64) {
                    goto LABEL_33;
                  }
                  uint64_t v66 = *(void *)(v61 + 8 * v67);
                  if (!v66)
                  {
                    uint64_t v67 = v62 + 6;
                    if (v62 + 6 >= v64) {
                      goto LABEL_33;
                    }
                    uint64_t v66 = *(void *)(v61 + 8 * v67);
                    if (!v66)
                    {
                      int64_t v68 = v62 + 7;
                      while (v68 < v64)
                      {
                        uint64_t v66 = *(void *)(v61 + 8 * v68++);
                        if (v66)
                        {
                          uint64_t v67 = v68 - 1;
                          goto LABEL_28;
                        }
                      }
LABEL_33:
                      swift_bridgeObjectRelease();
                      swift_release();
                      uint64_t v60 = (uint64_t)v97;
                      v75 = sub_4464((unint64_t)v97);
                      swift_bridgeObjectRelease();
                      sub_4040((unint64_t)v75);
                      swift_bridgeObjectRelease();
                      unsigned __int8 v45 = v89;
                      goto LABEL_34;
                    }
                  }
                }
              }
            }
          }
LABEL_28:
          uint64_t v63 = (v66 - 1) & v66;
          uint64_t v62 = v67;
        }
        __break(1u);
      }
      else
      {
LABEL_34:
        sub_AAB4((uint64_t)v99);
        sub_B75C();
        sub_A524(v60, &qword_197F0);
        v76 = v91;
        uint64_t v77 = sub_AA60();
        v78(v77);
        v93(v76);
        swift_release();
        uint64_t v79 = sub_AA20();
        v80(v79);
        return ((uint64_t (*)(uint64_t, uint64_t))v45)(v82, v46);
      }
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v28 + 16))(v32, a1, v26);
    char v50 = sub_10510();
    os_log_type_t v51 = sub_106C0();
    if (os_log_type_enabled(v50, v51))
    {
      uint64_t v52 = (uint8_t *)swift_slowAlloc();
      v98[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v52 = 136315138;
      v96 = v52 + 4;
      sub_A4D4();
      uint64_t v53 = sub_10800();
      v97 = (void *)sub_9D84(v53, v54, v98);
      sub_106F0();
      swift_bridgeObjectRelease();
      v36(v32, v26);
      _os_log_impl(&dword_0, v50, v51, "Skipping SiriReferenceResolutionMetricsPlugin: context is %s", v52, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      sub_AA98();
    }
    else
    {

      v36(v32, v26);
    }
    v70 = v91;
    uint64_t v71 = sub_AA60();
    v72(v71);
    v93(v70);
    uint64_t v73 = sub_AA20();
    return v74(v73);
  }
  return result;
}

uint64_t SiriReferenceResolutionMetricsPlugin.deinit()
{
  sub_10520();
  sub_AA84();
  uint64_t v1 = sub_AAD8();
  v2(v1);
  return v0;
}

uint64_t SiriReferenceResolutionMetricsPlugin.__deallocating_deinit()
{
  sub_10520();
  sub_AA84();
  uint64_t v1 = sub_AAD8();
  v2(v1);
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v3, v4);
}

uint64_t sub_9D84(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_9E58(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_A9C4((uint64_t)v12, *a3);
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
      sub_A9C4((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_88F4((uint64_t)v12);
  return v7;
}

uint64_t sub_9E58(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_9FB0((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_10700();
      uint64_t result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    uint64_t result = (uint64_t)sub_A088(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    uint64_t v8 = sub_10780();
    if (!v8)
    {
      uint64_t result = sub_107B0();
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

void *sub_9FB0(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_107D0();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

void *sub_A088(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_A120(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_A294(0, v2[2] + 1, 1, (uint64_t)v2);
  }
  unint64_t v4 = v2[2];
  unint64_t v3 = v2[3];
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_A294((char *)(v3 > 1), v4 + 1, 1, (uint64_t)v2);
  }
  v2[2] = v4 + 1;
  *((unsigned char *)v2 + v4 + 32) = 0;
  return v2;
}

void *sub_A120(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    Swift::Int v2 = sub_105C0();
    if (v2) {
      goto LABEL_6;
    }
    return &_swiftEmptyArrayStorage;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    Swift::Int v2 = HIBYTE(a2) & 0xF;
  }
  else {
    Swift::Int v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
LABEL_6:
  unint64_t v3 = sub_756C(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    unint64_t v4 = v3;
    uint64_t v5 = sub_10750();
    if ((v6 & 1) != 0 || v5 != v2) {
      goto LABEL_14;
    }
    return v4;
  }
  sub_107D0();
  __break(1u);
LABEL_14:
  uint64_t result = (void *)sub_107B0();
  __break(1u);
  return result;
}

char *sub_A294(char *result, int64_t a2, char a3, uint64_t a4)
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
    sub_4F9C(&qword_19520);
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
  uint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_A444(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_A36C(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_A36C(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_107D0();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

char *sub_A444(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_107D0();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

unint64_t sub_A4D4()
{
  unint64_t result = qword_19570;
  if (!qword_19570)
  {
    sub_10500();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_19570);
  }
  return result;
}

uint64_t sub_A524(uint64_t a1, uint64_t *a2)
{
  sub_4F9C(a2);
  sub_AA84();
  uint64_t v3 = sub_AAD8();
  v4(v3);
  return a1;
}

uint64_t sub_A56C(uint64_t result, uint64_t a2, unint64_t a3)
{
  unint64_t v5 = result;
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_107C0();
    unint64_t result = swift_bridgeObjectRelease();
    if (!v7) {
      return a3;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((char *)&dword_10 + (a3 & 0xFFFFFFFFFFFFFF8));
    if (!v7) {
      return a3;
    }
  }
  if (v5)
  {
    if (v6)
    {
      swift_bridgeObjectRetain();
      uint64_t v8 = sub_107C0();
      unint64_t result = swift_bridgeObjectRelease();
      if (v8 <= a2)
      {
        if (v7 >= 1)
        {
          sub_A974(&qword_19638, &qword_19630);
          swift_bridgeObjectRetain();
          for (uint64_t i = 0; i != v7; ++i)
          {
            sub_4F9C(&qword_19630);
            uint64_t v10 = sub_E44C();
            id v12 = *v11;
            ((void (*)(uint64_t *, void))v10)(&v13, 0);
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
      if (*(void *)((char *)&dword_10 + (a3 & 0xFFFFFFFFFFFFFF8)) <= a2)
      {
        sub_DA84((a3 & 0xFFFFFFFFFFFFFF8) + 32, *(void *)((char *)&dword_10 + (a3 & 0xFFFFFFFFFFFFFF8)), v5);
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

uint64_t sub_A708(uint64_t result, uint64_t a2, unint64_t a3)
{
  unint64_t v5 = result;
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_107C0();
    unint64_t result = swift_bridgeObjectRelease();
    if (!v7) {
      return a3;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((char *)&dword_10 + (a3 & 0xFFFFFFFFFFFFFF8));
    if (!v7) {
      return a3;
    }
  }
  if (v5)
  {
    if (v6)
    {
      swift_bridgeObjectRetain();
      uint64_t v8 = sub_107C0();
      unint64_t result = swift_bridgeObjectRelease();
      if (v8 <= a2)
      {
        if (v7 >= 1)
        {
          sub_A974(&qword_19648, &qword_19640);
          swift_bridgeObjectRetain();
          for (uint64_t i = 0; i != v7; ++i)
          {
            sub_4F9C(&qword_19640);
            uint64_t v10 = sub_E49C();
            uint64_t v12 = *v11;
            swift_retain();
            ((void (*)(uint64_t *, void))v10)(&v13, 0);
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
      if (*(void *)((char *)&dword_10 + (a3 & 0xFFFFFFFFFFFFFF8)) <= a2)
      {
        sub_DB78((a3 & 0xFFFFFFFFFFFFFF8) + 32, *(void *)((char *)&dword_10 + (a3 & 0xFFFFFFFFFFFFFF8)), v5);
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

uint64_t sub_A8A4@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v2 = -1;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  *a2 = a1;
  uint64_t v6 = *(void *)(a1 + 64);
  uint64_t result = a1 + 64;
  uint64_t v5 = v6;
  if (-v3 < 64) {
    uint64_t v2 = ~(-1 << -(char)v3);
  }
  a2[1] = result;
  a2[2] = ~v3;
  a2[3] = 0;
  a2[4] = v2 & v5;
  return result;
}

uint64_t sub_A8DC()
{
  return type metadata accessor for SiriReferenceResolutionMetricsPlugin();
}

uint64_t sub_A8E4()
{
  uint64_t result = sub_10520();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_A974(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_50C4(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_A9C4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_AA20()
{
  return v0;
}

uint64_t sub_AA60()
{
  return v0;
}

uint64_t sub_AA74@<X0>(uint64_t a1@<X8>)
{
  *(void *)(v1 - 256) = a1;
  return 0;
}

uint64_t sub_AA98()
{
  return swift_slowDealloc();
}

uint64_t sub_AAB4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(a1 - 256);
  return sub_7630(v3, 1, 1, v1);
}

uint64_t sub_AAD8()
{
  return v0;
}

void sub_AAE8()
{
  *(void *)(v1 - 256) = v0;
}

void sub_AAF8()
{
  sub_EBB4();
  uint64_t v46 = v2;
  uint64_t v47 = v1;
  uint64_t v3 = v0;
  uint64_t v48 = v4;
  uint64_t v45 = v5;
  uint64_t v7 = v6;
  sub_4F9C(&qword_197F0);
  __chkstk_darwin();
  sub_8C00();
  uint64_t v10 = v9 - v8;
  uint64_t v11 = sub_101C0();
  sub_8BE4();
  uint64_t v13 = v12;
  __chkstk_darwin();
  sub_EBA4();
  uint64_t v42 = v14 - v15;
  __chkstk_darwin();
  uint64_t v41 = (char *)v35 - v16;
  uint64_t v17 = v3 + OBJC_IVAR____TtC36SiriReferenceResolutionMetricsPlugin16MetricsCollector_logger;
  type metadata accessor for SiriReferenceResolutionMetricsPlugin();
  uint64_t v37 = v17;
  sub_104C0();
  uint64_t v18 = (void *)(v3 + OBJC_IVAR____TtC36SiriReferenceResolutionMetricsPlugin16MetricsCollector_nlStreamId);
  *uint64_t v18 = 0xD000000000000014;
  v18[1] = 0x8000000000012EA0;
  uint64_t v40 = v18;
  uint64_t v19 = (void *)(v3 + OBJC_IVAR____TtC36SiriReferenceResolutionMetricsPlugin16MetricsCollector_nlBookmarkFileName);
  *uint64_t v19 = 0xD000000000000020;
  v19[1] = 0x8000000000012EC0;
  uint64_t v38 = OBJC_IVAR____TtC36SiriReferenceResolutionMetricsPlugin16MetricsCollector_nlRequestBiomeBookmark;
  unsigned __int8 v39 = v19;
  *(void *)(v3 + OBJC_IVAR____TtC36SiriReferenceResolutionMetricsPlugin16MetricsCollector_nlRequestBiomeBookmark) = 0;
  uint64_t v20 = v3 + OBJC_IVAR____TtC36SiriReferenceResolutionMetricsPlugin16MetricsCollector_fromDate;
  uint64_t v21 = sub_10240();
  uint64_t v22 = *(void *)(v21 - 8);
  uint64_t v36 = v20;
  uint64_t v43 = v21;
  uint64_t v44 = v7;
  sub_EC10();
  v23();
  type metadata accessor for FlowIdBiomeBackedProvider();
  swift_allocObject();
  uint64_t v24 = sub_4860();
  v35[1] = OBJC_IVAR____TtC36SiriReferenceResolutionMetricsPlugin16MetricsCollector_flowIdLookup;
  *(void *)(v3 + OBJC_IVAR____TtC36SiriReferenceResolutionMetricsPlugin16MetricsCollector_flowIdLookup) = v24;
  type metadata accessor for NLRequestEntityRecordWrapper();
  uint64_t v25 = sub_10540();
  v35[0] = OBJC_IVAR____TtC36SiriReferenceResolutionMetricsPlugin16MetricsCollector_entitiesByRequest;
  *(void *)(v3 + OBJC_IVAR____TtC36SiriReferenceResolutionMetricsPlugin16MetricsCollector_entitiesByRequest) = v25;
  uint64_t v26 = (void *)(v3
                 + OBJC_IVAR____TtC36SiriReferenceResolutionMetricsPlugin16MetricsCollector_requestIdForTestingFixtures);
  uint64_t v27 = v46;
  void *v26 = v45;
  v26[1] = v27;
  *(void *)(v3 + OBJC_IVAR____TtC36SiriReferenceResolutionMetricsPlugin16MetricsCollector_testFixtures) = sub_10540();
  sub_E284(v48, v10);
  if (sub_76C0(v10, 1, v11) == 1)
  {
    sub_A524(v10, &qword_197F0);
    type metadata accessor for MetricsCollector();
    uint64_t v28 = v47;
    sub_AFAC();
    uint64_t v29 = v28;
    if (v28)
    {
      sub_A524(v48, &qword_197F0);
      uint64_t v30 = *(void (**)(uint64_t, uint64_t))(v22 + 8);
      uint64_t v31 = v43;
      v30(v44, v43);
      sub_10520();
      sub_AA84();
      (*(void (**)(uint64_t))(v32 + 8))(v37);
      v30(v36, v31);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_unknownObjectRelease();
      swift_release();
      swift_deallocPartialClassInstance();
      goto LABEL_8;
    }
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 32))(v3 + OBJC_IVAR____TtC36SiriReferenceResolutionMetricsPlugin16MetricsCollector_bookmarkFolderURL, v42, v11);
  }
  else
  {
    uint64_t v33 = *(void (**)(char *, uint64_t, uint64_t))(v13 + 32);
    char v34 = v41;
    v33(v41, v10, v11);
    v33((char *)(v3 + OBJC_IVAR____TtC36SiriReferenceResolutionMetricsPlugin16MetricsCollector_bookmarkFolderURL), (uint64_t)v34, v11);
    uint64_t v29 = v47;
  }
  sub_B1D0();
  sub_A524(v48, &qword_197F0);
  (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v44, v43);
  if (v29) {
    swift_release();
  }
LABEL_8:
  sub_EB6C();
}

void sub_AFAC()
{
  sub_EBB4();
  sub_101C0();
  sub_8BE4();
  uint64_t v1 = v0;
  __chkstk_darwin();
  sub_EBA4();
  __chkstk_darwin();
  sub_ECC4();
  __chkstk_darwin();
  id v2 = [self defaultManager];
  id v8 = 0;
  id v3 = [v2 URLForDirectory:5 inDomain:1 appropriateForURL:0 create:1 error:&v8];

  id v4 = v8;
  if (v3)
  {
    sub_101A0();
    id v5 = v4;

    sub_10180();
    sub_10180();
    uint64_t v6 = *(void (**)(void))(v1 + 8);
    sub_EB94();
    v6();
    sub_10180();
    sub_EB94();
    v6();
    sub_EB94();
    v6();
  }
  else
  {
    id v7 = v8;
    sub_10160();

    swift_willThrow();
  }
  sub_EB6C();
}

void sub_B1D0()
{
  sub_EBB4();
  uint64_t v2 = v1;
  uint64_t v3 = v0;
  sub_101C0();
  sub_8BE4();
  id v5 = v4;
  __chkstk_darwin();
  sub_EACC();
  __chkstk_darwin();
  sub_EB84();
  sub_EC10();
  v6();
  id v7 = sub_10510();
  os_log_type_t v8 = sub_106D0();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = sub_EA98();
    v44[0] = (id)sub_EA60();
    *(_DWORD *)uint64_t v9 = 136315138;
    id v5 = (void (*)(uint64_t))(v9 + 12);
    sub_E97C((unint64_t *)&unk_19810, (void (*)(uint64_t))&type metadata accessor for URL);
    uint64_t v10 = sub_10800();
    uint64_t v43 = sub_9D84(v10, v11, (uint64_t *)v44);
    sub_106F0();
    swift_bridgeObjectRelease();
    uint64_t v2 = v1;
    uint64_t v12 = sub_ECB0();
    ((void (*)(uint64_t))(v9 + 12))(v12);
    _os_log_impl(&dword_0, v7, v8, "Loading bookmarks from: %s", (uint8_t *)v9, 0xCu);
    swift_arrayDestroy();
    sub_8D7C();
    uint64_t v3 = v0;
    sub_8D7C();
  }
  else
  {

    uint64_t v13 = sub_ECB0();
    v5(v13);
  }
  sub_10190();
  sub_101D0();
  if (v2)
  {
    swift_errorRelease();
    uint64_t v14 = sub_EAB0();
    v5(v14);
    uint64_t v15 = (void *)sub_10510();
    os_log_type_t v16 = sub_106C0();
    if (sub_EA0C(v16))
    {
      *(_WORD *)sub_EA48() = 0;
      sub_EA28(&dword_0, v17, v18, "No NLRequest Bookmark to load");
      sub_8D7C();
    }

    goto LABEL_26;
  }
  uint64_t v19 = sub_EAB0();
  v5(v19);
  uint64_t v20 = self;
  id v21 = objc_msgSend(self, "bm_allowedClassesForSecureCodingBMBookmark");
  sub_106A0();

  Class isa = sub_10690().super.isa;
  swift_bridgeObjectRelease();
  Class v23 = sub_101F0().super.isa;
  v44[0] = 0;
  id v24 = [v20 unarchivedObjectOfClasses:isa fromData:v23 error:v44];

  if (!v24)
  {
    id v38 = v44[0];
    sub_10160();

    swift_willThrow();
    sub_EBCC();
    goto LABEL_26;
  }
  id v25 = v44[0];
  sub_10720();
  swift_unknownObjectRelease();
  sub_4F9C(&qword_19808);
  if ((swift_dynamicCast() & 1) == 0 || (self, (uint64_t v26 = swift_dynamicCastObjCClass()) == 0))
  {
    unsigned __int8 v39 = (void *)sub_10510();
    os_log_type_t v40 = sub_106E0();
    if (sub_EA0C(v40))
    {
      *(_WORD *)sub_EA48() = 0;
      sub_EC3C(&dword_0, v41, v42, "Failed to convert nlRequestBiomeBookmark to BMStoreBookmark");
      sub_8D7C();
    }
    sub_EBCC();

    goto LABEL_25;
  }
  uint64_t v27 = (void *)v26;
  swift_unknownObjectRetain();
  id v28 = [v27 streamId];
  uint64_t v29 = sub_10560();
  uint64_t v31 = v30;

  if (v29 == *(void *)(v3 + OBJC_IVAR____TtC36SiriReferenceResolutionMetricsPlugin16MetricsCollector_nlStreamId)
    && v31 == *(void *)(v3 + OBJC_IVAR____TtC36SiriReferenceResolutionMetricsPlugin16MetricsCollector_nlStreamId + 8))
  {
    swift_bridgeObjectRelease();
    goto LABEL_24;
  }
  char v33 = sub_10810();
  swift_bridgeObjectRelease();
  if (v33)
  {
LABEL_24:
    sub_EBCC();
    swift_unknownObjectRelease();
    *(void *)(v3 + OBJC_IVAR____TtC36SiriReferenceResolutionMetricsPlugin16MetricsCollector_nlRequestBiomeBookmark) = v43;
LABEL_25:
    swift_unknownObjectRelease();
    goto LABEL_26;
  }
  char v34 = (void *)sub_10510();
  os_log_type_t v35 = sub_106E0();
  if (sub_EA0C(v35))
  {
    *(_WORD *)sub_EA48() = 0;
    sub_EC3C(&dword_0, v36, v37, "nlRequestBiomeBookmark using incorrect streamId");
    sub_8D7C();
  }
  sub_EBCC();

  swift_unknownObjectRelease_n();
LABEL_26:
  sub_EB6C();
}

void sub_B75C()
{
  sub_EBB4();
  uint64_t v59 = v0;
  uint64_t v5 = v4;
  sub_4F9C(&qword_197F0);
  ((void (*)(void))__chkstk_darwin)();
  sub_8C00();
  uint64_t v8 = v7 - v6;
  uint64_t v9 = sub_101C0();
  sub_8BE4();
  uint64_t v11 = v10;
  ((void (*)(void))__chkstk_darwin)();
  sub_EACC();
  uint64_t v12 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v14 = (char *)&v53 - v13;
  uint64_t v15 = __chkstk_darwin(v12);
  uint64_t v17 = (char *)&v53 - v16;
  __chkstk_darwin(v15);
  sub_EB84();
  sub_E284(v5, v8);
  if (sub_76C0(v8, 1, v9) != 1
    || (sub_A524(v8, &qword_197F0), type metadata accessor for MetricsCollector(), sub_AFAC(), uint64_t v8 = (uint64_t)v17, !v1))
  {
    uint64_t v58 = v1;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 32))(v2, v8, v9);
    id v18 = [objc_allocWithZone((Class)NSFileManager) init];
    sub_10170(v19);
    id v21 = v20;
    v61[0] = 0;
    unsigned int v22 = [v18 createDirectoryAtURL:v20 withIntermediateDirectories:1 attributes:0 error:v61];

    id v23 = v61[0];
    if (v22)
    {
      uint64_t v56 = v3;
      uint64_t v24 = v59 + OBJC_IVAR____TtC36SiriReferenceResolutionMetricsPlugin16MetricsCollector_logger;
      sub_EC10();
      v25();
      id v26 = v23;
      uint64_t v27 = sub_10510();
      os_log_type_t v28 = sub_106E0();
      BOOL v29 = os_log_type_enabled(v27, v28);
      uint64_t v57 = v11;
      if (v29)
      {
        uint64_t v30 = (uint8_t *)sub_EA98();
        unint64_t v54 = (void *)sub_EA60();
        v61[0] = v54;
        uint64_t v55 = v24;
        *(_DWORD *)uint64_t v30 = 136315138;
        uint64_t v53 = v30 + 4;
        sub_E97C((unint64_t *)&unk_19810, (void (*)(uint64_t))&type metadata accessor for URL);
        uint64_t v31 = sub_10800();
        uint64_t v60 = sub_9D84(v31, v32, (uint64_t *)v61);
        sub_106F0();
        swift_bridgeObjectRelease();
        char v33 = *(void (**)(char *, uint64_t))(v11 + 8);
        v33(v14, v9);
        _os_log_impl(&dword_0, v27, v28, "Saving bookmarks to: %s", v30, 0xCu);
        swift_arrayDestroy();
        sub_8D7C();
        sub_8D7C();
      }
      else
      {

        char v33 = *(void (**)(char *, uint64_t))(v11 + 8);
        v33(v14, v9);
      }
      uint64_t v37 = v58;
      uint64_t v38 = *(void *)(v59
                      + OBJC_IVAR____TtC36SiriReferenceResolutionMetricsPlugin16MetricsCollector_nlRequestBiomeBookmark);
      unsigned __int8 v39 = v56;
      if (v38)
      {
        os_log_type_t v40 = self;
        v61[0] = 0;
        swift_unknownObjectRetain();
        id v41 = [v40 archivedDataWithRootObject:v38 requiringSecureCoding:1 error:v61];
        id v42 = v61[0];
        if (!v41)
        {
          char v50 = v42;
          sub_10160();

          swift_willThrow();
          swift_unknownObjectRelease();
          uint64_t v51 = sub_ECEC();
          ((void (*)(uint64_t))v33)(v51);
          goto LABEL_18;
        }
        uint64_t v43 = sub_10200();
        unint64_t v45 = v44;

        sub_10180();
        sub_10210();
        if (v37)
        {
          sub_52A4(v43, v45);
          swift_unknownObjectRelease();
          v33(v39, v9);
          uint64_t v46 = sub_ECEC();
          ((void (*)(uint64_t))v33)(v46);
          goto LABEL_18;
        }
        sub_52A4(v43, v45);
        swift_unknownObjectRelease();
        v33(v39, v9);
      }
      else
      {
        uint64_t v47 = sub_10510();
        os_log_type_t v48 = sub_106C0();
        if (os_log_type_enabled(v47, v48))
        {
          unsigned int v49 = (uint8_t *)sub_EA48();
          *(_WORD *)unsigned int v49 = 0;
          _os_log_impl(&dword_0, v47, v48, "No NLRequest Bookmark to save", v49, 2u);
          sub_8D7C();
        }
      }
      uint64_t v52 = sub_ECEC();
      ((void (*)(uint64_t))v33)(v52);
      goto LABEL_18;
    }
    id v34 = v61[0];
    sub_10160();

    swift_willThrow();
    uint64_t v35 = sub_ECEC();
    v36(v35);
  }
LABEL_18:
  sub_EB6C();
}

void sub_BD2C()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC36SiriReferenceResolutionMetricsPlugin16MetricsCollector_entitiesByRequest);
  swift_beginAccess();
  uint64_t v2 = swift_bridgeObjectRetain();
  uint64_t v3 = sub_C224(v2);
  swift_bridgeObjectRelease();
  uint64_t v4 = sub_C3D4(v3);
  char v6 = v5;
  uint64_t v7 = sub_C418(v3);
  char v9 = v6 | v8;
  swift_bridgeObjectRelease();
  if (v9)
  {
    id v42 = (void *)sub_10510();
    os_log_type_t v43 = sub_106E0();
    if (sub_EA0C(v43))
    {
      *(_WORD *)sub_EA48() = 0;
      sub_EA28(&dword_0, v44, v45, "Unable to calculate request times");
      sub_8D7C();
    }

    return;
  }
  uint64_t v10 = swift_bridgeObjectRetain();
  uint64_t v11 = sub_E610(v10);
  swift_bridgeObjectRelease();
  uint64_t v12 = sub_48A0((uint64_t)v11, *(double *)&v4, *(double *)&v7);
  swift_release();
  uint64_t v13 = *v1;
  uint64_t v14 = v13 + 64;
  sub_EB10();
  unint64_t v17 = v16 & v15;
  int64_t v19 = (unint64_t)(v18 + 63) >> 6;
  swift_bridgeObjectRetain();
  int64_t v20 = 0;
  uint64_t v47 = v13 + 64;
  uint64_t v48 = v12;
  uint64_t v49 = v13;
  int64_t v46 = v19;
  while (v17)
  {
    unint64_t v21 = __clz(__rbit64(v17));
    v17 &= v17 - 1;
    unint64_t v22 = v21 | (v20 << 6);
LABEL_19:
    if (*(void *)(v12 + 16))
    {
      id v26 = (uint64_t *)(*(void *)(v13 + 48) + 16 * v22);
      uint64_t v28 = *v26;
      unint64_t v27 = v26[1];
      uint64_t v29 = *(void *)(*(void *)(v13 + 56) + 8 * v22);
      swift_bridgeObjectRetain_n();
      swift_retain();
      unint64_t v30 = sub_DC9C(v28, v27);
      if (v31)
      {
        uint64_t v51 = v29;
        unint64_t v32 = (uint64_t *)(*(void *)(v12 + 56) + 16 * v30);
        uint64_t v34 = *v32;
        unint64_t v33 = v32[1];
        swift_bridgeObjectRetain_n();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRetain();
        uint64_t v35 = sub_10510();
        os_log_type_t v36 = sub_106D0();
        int64_t v50 = v20;
        if (os_log_type_enabled(v35, v36))
        {
          uint64_t v37 = swift_slowAlloc();
          uint64_t v52 = swift_slowAlloc();
          *(_DWORD *)uint64_t v37 = 136315394;
          swift_bridgeObjectRetain();
          *(void *)(v37 + 4) = sub_9D84(v34, v33, &v52);
          swift_bridgeObjectRelease_n();
          *(_WORD *)(v37 + 12) = 2080;
          swift_bridgeObjectRetain();
          *(void *)(v37 + 14) = sub_9D84(v28, v27, &v52);
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_0, v35, v36, "Found flowId: %s for orchRequestId %s", (uint8_t *)v37, 0x16u);
          swift_arrayDestroy();
          sub_8D7C();
          sub_8D7C();
        }
        else
        {
          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease_n();
        }

        unint64_t v38 = *(void *)(v51 + 48);
        if (v38 >> 62)
        {
          swift_bridgeObjectRetain();
          uint64_t v39 = sub_107C0();
          if (!v39) {
            goto LABEL_33;
          }
        }
        else
        {
          uint64_t v39 = *(void *)((char *)&dword_10 + (v38 & 0xFFFFFFFFFFFFFF8));
          swift_bridgeObjectRetain();
          if (!v39) {
            goto LABEL_33;
          }
        }
        if (v39 < 1) {
          goto LABEL_41;
        }
        uint64_t v40 = 0;
        do
        {
          if ((v38 & 0xC000000000000001) != 0)
          {
            uint64_t v41 = sub_10760();
          }
          else
          {
            uint64_t v41 = *(void *)(v38 + 8 * v40 + 32);
            swift_retain();
          }
          ++v40;
          *(void *)(v41 + 104) = v34;
          *(void *)(v41 + 112) = v33;
          swift_bridgeObjectRetain();
          swift_release();
          swift_bridgeObjectRelease();
        }
        while (v39 != v40);
LABEL_33:
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_release();
        uint64_t v12 = v48;
        uint64_t v13 = v49;
        int64_t v19 = v46;
        uint64_t v14 = v47;
        int64_t v20 = v50;
      }
      else
      {
        swift_release();
        swift_bridgeObjectRelease_n();
      }
    }
  }
  int64_t v23 = v20 + 1;
  if (__OFADD__(v20, 1))
  {
    __break(1u);
LABEL_41:
    __break(1u);
    goto LABEL_42;
  }
  if (v23 >= v19) {
    goto LABEL_39;
  }
  unint64_t v24 = *(void *)(v14 + 8 * v23);
  ++v20;
  if (v24) {
    goto LABEL_18;
  }
  int64_t v20 = v23 + 1;
  if (v23 + 1 >= v19) {
    goto LABEL_39;
  }
  unint64_t v24 = *(void *)(v14 + 8 * v20);
  if (v24) {
    goto LABEL_18;
  }
  int64_t v20 = v23 + 2;
  if (v23 + 2 >= v19) {
    goto LABEL_39;
  }
  unint64_t v24 = *(void *)(v14 + 8 * v20);
  if (v24)
  {
LABEL_18:
    unint64_t v17 = (v24 - 1) & v24;
    unint64_t v22 = __clz(__rbit64(v24)) + (v20 << 6);
    goto LABEL_19;
  }
  int64_t v25 = v23 + 3;
  if (v25 >= v19)
  {
LABEL_39:
    swift_bridgeObjectRelease();
    swift_release();
    return;
  }
  unint64_t v24 = *(void *)(v14 + 8 * v25);
  if (v24)
  {
    int64_t v20 = v25;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v20 = v25 + 1;
    if (__OFADD__(v25, 1)) {
      break;
    }
    if (v20 >= v19) {
      goto LABEL_39;
    }
    unint64_t v24 = *(void *)(v14 + 8 * v20);
    ++v25;
    if (v24) {
      goto LABEL_18;
    }
  }
LABEL_42:
  __break(1u);
}

uint64_t sub_C224(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = &_swiftEmptyArrayStorage;
  if (!v1) {
    return (uint64_t)v2;
  }
  sub_E2EC(0, v1, 0);
  uint64_t v2 = v14;
  uint64_t result = sub_E8FC(a1);
  if ((result & 0x8000000000000000) == 0)
  {
    unint64_t v6 = result;
    if (result < 1 << *(unsigned char *)(a1 + 32))
    {
      int v7 = v5;
      uint64_t v8 = a1 + 64;
      while ((*(void *)(v8 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
      {
        if (v7 != *(_DWORD *)(a1 + 36)) {
          goto LABEL_18;
        }
        uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8 * v6) + 40);
        unint64_t v11 = v14[2];
        unint64_t v10 = v14[3];
        if (v11 >= v10 >> 1)
        {
          uint64_t v13 = v8;
          uint64_t result = (uint64_t)sub_E2EC((char *)(v10 > 1), v11 + 1, 1);
          uint64_t v8 = v13;
        }
        v14[2] = v11 + 1;
        v14[v11 + 4] = v9;
        if ((uint64_t)v6 >= -(-1 << *(unsigned char *)(a1 + 32))) {
          goto LABEL_19;
        }
        if ((*(void *)(v8 + 8 * (v6 >> 6)) & (1 << v6)) == 0) {
          goto LABEL_20;
        }
        if (v7 != *(_DWORD *)(a1 + 36)) {
          goto LABEL_21;
        }
        uint64_t v12 = v8;
        uint64_t result = sub_10730();
        if (!--v1) {
          return (uint64_t)v2;
        }
        unint64_t v6 = result;
        if ((result & 0x8000000000000000) == 0)
        {
          uint64_t v8 = v12;
          int v7 = *(_DWORD *)(a1 + 36);
          if (result < 1 << *(unsigned char *)(a1 + 32)) {
            continue;
          }
        }
        goto LABEL_22;
      }
      __break(1u);
LABEL_18:
      __break(1u);
LABEL_19:
      __break(1u);
LABEL_20:
      __break(1u);
LABEL_21:
      __break(1u);
    }
  }
LABEL_22:
  __break(1u);
  return result;
}

uint64_t sub_C3D4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return 0;
  }
  double v2 = *(double *)(a1 + 32);
  uint64_t v3 = v1 - 1;
  if (v1 != 1)
  {
    uint64_t v4 = (double *)(a1 + 40);
    do
    {
      double v5 = *v4++;
      double v6 = v5;
      if (v5 < v2) {
        double v2 = v6;
      }
      --v3;
    }
    while (v3);
  }
  return *(void *)&v2;
}

uint64_t sub_C418(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return 0;
  }
  double v2 = *(double *)(a1 + 32);
  uint64_t v3 = v1 - 1;
  if (v1 != 1)
  {
    uint64_t v4 = (double *)(a1 + 40);
    do
    {
      double v5 = *v4++;
      double v6 = v5;
      if (v2 < v5) {
        double v2 = v6;
      }
      --v3;
    }
    while (v3);
  }
  return *(void *)&v2;
}

uint64_t sub_C45C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16) && (sub_DC9C(a1, a2), (v3 & 1) != 0)) {
    return swift_retain();
  }
  else {
    return 0;
  }
}

id sub_C4A0()
{
  uint64_t v3 = v0;
  uint64_t v4 = sub_101C0();
  sub_8BE4();
  uint64_t v6 = v5;
  __chkstk_darwin(v7);
  sub_8C00();
  uint64_t v10 = v9 - v8;
  uint64_t v11 = sub_4F9C(&qword_197F0);
  __chkstk_darwin(v11 - 8);
  sub_EBA4();
  uint64_t v14 = v12 - v13;
  __chkstk_darwin(v15);
  sub_ECC4();
  __chkstk_darwin(v16);
  sub_EB84();
  id v17 = [self getStreamURL];
  if (v17)
  {
    uint64_t v18 = v17;
    sub_101A0();

    uint64_t v19 = 0;
  }
  else
  {
    uint64_t v19 = 1;
  }
  sub_7630(v2, v19, 1, v4);
  sub_E21C(v2, v1);
  sub_E284(v1, v14);
  if (sub_76C0(v14, 1, v4) == 1)
  {
    sub_A524(v1, &qword_197F0);
    sub_A524(v14, &qword_197F0);
    return 0;
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 32))(v10, v14, v4);
    unint64_t v21 = self;
    uint64_t v22 = sub_101B0();
    id v24 = sub_E3F0(v22, v23, v21);
    uint64_t v25 = v3 + OBJC_IVAR____TtC36SiriReferenceResolutionMetricsPlugin16MetricsCollector_nlStreamId;
    uint64_t v26 = *(void *)(v3 + OBJC_IVAR____TtC36SiriReferenceResolutionMetricsPlugin16MetricsCollector_nlStreamId);
    uint64_t v27 = *(void *)(v25 + 8);
    objc_allocWithZone((Class)BMStoreStream);
    swift_bridgeObjectRetain();
    id v20 = sub_D98C(v26, v27, v24);
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v10, v4);
    sub_A524(v1, &qword_197F0);
  }
  return v20;
}

uint64_t sub_C6E8(void *a1)
{
  uint64_t v4 = a1[2];
  uint64_t v3 = a1[3];
  uint64_t v5 = (uint64_t *)(v1 + OBJC_IVAR____TtC36SiriReferenceResolutionMetricsPlugin16MetricsCollector_entitiesByRequest);
  swift_beginAccess();
  uint64_t v6 = *v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v7 = sub_C45C(v4, v3, v6);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v7)
  {
    if (a1[4] < *(void *)(v7 + 32)) {
      return swift_release();
    }
    sub_EC90();
    swift_bridgeObjectRetain();
    uint64_t v10 = swift_retain();
    sub_DE90(v10, v4, v3);
    swift_endAccess();
    swift_release();
  }
  else
  {
    sub_EC90();
    swift_bridgeObjectRetain();
    uint64_t v9 = swift_retain();
    sub_DE90(v9, v4, v3);
    swift_endAccess();
  }
  return swift_bridgeObjectRelease();
}

id sub_C808()
{
  uint64_t v1 = v0;
  sub_10240();
  sub_8BE4();
  __chkstk_darwin(v2);
  sub_8C00();
  id result = sub_C4A0();
  if (result)
  {
    uint64_t v4 = result;
    sub_10220();
    id v5 = objc_msgSend(v4, "publisherFromStartTime:");
    uint64_t v6 = *(void **)(v0 + OBJC_IVAR____TtC36SiriReferenceResolutionMetricsPlugin16MetricsCollector_nlRequestBiomeBookmark);
    id v32 = v5;
    unint64_t v33 = v4;
    uint64_t v31 = OBJC_IVAR____TtC36SiriReferenceResolutionMetricsPlugin16MetricsCollector_nlRequestBiomeBookmark;
    if (v6)
    {
      swift_unknownObjectRetain_n();
      uint64_t v7 = sub_10510();
      os_log_type_t v8 = sub_106C0();
      if (os_log_type_enabled(v7, v8))
      {
        uint64_t v9 = (uint8_t *)sub_EA98();
        uint64_t aBlock = sub_EA60();
        *(_DWORD *)uint64_t v9 = 136315138;
        unint64_t v30 = v9;
        id v10 = [v6 description];
        uint64_t v11 = sub_10560();
        unint64_t v13 = v12;

        uint64_t v14 = sub_9D84(v11, v13, &aBlock);
        sub_EB54(v14);
        sub_106F0();
        swift_unknownObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_0, v7, v8, "Reading stream with %s", v30, 0xCu);
        swift_arrayDestroy();
        sub_8D7C();
        sub_8D7C();

        swift_unknownObjectRelease();
      }
      else
      {

        swift_unknownObjectRelease_n();
      }
    }
    else
    {
      sub_EC10();
      v15();
      uint64_t v16 = sub_10510();
      os_log_type_t v17 = sub_106C0();
      if (os_log_type_enabled(v16, v17))
      {
        uint64_t v18 = (uint8_t *)sub_EA98();
        uint64_t aBlock = sub_EA60();
        *(_DWORD *)uint64_t v18 = 136315138;
        sub_E97C(&qword_197D8, (void (*)(uint64_t))&type metadata accessor for Date);
        uint64_t v19 = sub_10800();
        uint64_t v21 = sub_9D84(v19, v20, &aBlock);
        sub_EB54(v21);
        sub_106F0();
        swift_bridgeObjectRelease();
        uint64_t v22 = sub_EBFC();
        v23(v22);
        _os_log_impl(&dword_0, v16, v17, "nlRequestBiomeBookmark nil. Reading stream from date: %s", v18, 0xCu);
        swift_arrayDestroy();
        sub_8D7C();
        sub_8D7C();
      }
      else
      {

        uint64_t v24 = sub_EBFC();
        v25(v24);
      }
    }
    uint64_t v26 = *(void *)(v1 + v31);
    unint64_t v38 = sub_D964;
    uint64_t v39 = v1;
    uint64_t aBlock = (uint64_t)_NSConcreteStackBlock;
    uint64_t v35 = 1107296256;
    os_log_type_t v36 = sub_CD3C;
    uint64_t v37 = &unk_14C08;
    uint64_t v27 = _Block_copy(&aBlock);
    swift_unknownObjectRetain();
    swift_retain();
    swift_release();
    unint64_t v38 = sub_D984;
    uint64_t v39 = v1;
    uint64_t aBlock = (uint64_t)_NSConcreteStackBlock;
    uint64_t v35 = 1107296256;
    os_log_type_t v36 = sub_CF98;
    uint64_t v37 = &unk_14C30;
    uint64_t v28 = _Block_copy(&aBlock);
    swift_retain();
    swift_release();
    id v29 = [v32 sinkWithBookmark:v26 completion:v27 receiveInput:v28];

    _Block_release(v28);
    _Block_release(v27);

    swift_unknownObjectRelease();
    swift_beginAccess();
    return (id)swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_CCF4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a3 + OBJC_IVAR____TtC36SiriReferenceResolutionMetricsPlugin16MetricsCollector_nlRequestBiomeBookmark) = a2;
  swift_unknownObjectRetain();

  return swift_unknownObjectRelease();
}

void sub_CD3C(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void (**)(id, uint64_t))(a1 + 32);
  swift_retain();
  id v6 = a2;
  swift_unknownObjectRetain();
  v5(v6, a3);
  swift_release();
  swift_unknownObjectRelease();
}

uint64_t sub_CDC4(void *a1)
{
  uint64_t v2 = sub_4F9C(&qword_197E0);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_103C0();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  os_log_type_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v9 = [a1 eventBody];
  if (!v9)
  {
    sub_7630((uint64_t)v4, 1, 1, v5);
    return sub_A524((uint64_t)v4, &qword_197E0);
  }
  id v10 = v9;
  sub_6074();

  if (sub_76C0((uint64_t)v4, 1, v5) == 1) {
    return sub_A524((uint64_t)v4, &qword_197E0);
  }
  (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v4, v5);
  [a1 timestamp];
  unint64_t v12 = (void *)sub_6628(v11);
  if (v12)
  {
    sub_C6E8(v12);
    swift_release();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

void sub_CF98(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t sub_D000()
{
  uint64_t result = (uint64_t)sub_C808();
  if (v1) {
    return result;
  }
  if (!result)
  {
    unint64_t v13 = (void *)sub_10510();
    os_log_type_t v14 = sub_106C0();
    if (sub_EA0C(v14))
    {
      *(_WORD *)sub_EA48() = 0;
      sub_EA28(&dword_0, v15, v16, "Found no salientLinkEntities. Exiting");
      sub_8D7C();
    }

    return 0;
  }
  os_log_type_t v3 = v0 + OBJC_IVAR____TtC36SiriReferenceResolutionMetricsPlugin16MetricsCollector_logger;
  swift_bridgeObjectRetain_n();
  id v4 = sub_10510();
  os_log_type_t v5 = sub_106C0();
  uint64_t v6 = "naryRepresentation:";
  os_log_type_t v52 = v3;
  if (os_log_type_enabled(v4, v5))
  {
    sub_EA98();
    v54[0] = sub_EA60();
    sub_EAE8(4.8149e-34);
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_10530();
    unint64_t v9 = v8;
    swift_bridgeObjectRelease();
    uint64_t v10 = sub_9D84(v7, v9, v54);
    sub_EA78(v10);
    uint64_t v6 = "willProduceDictionaryRepresentation:" + 17;
    sub_106F0();
    sub_EBE4();
    os_log_type_t v3 = v52;
    swift_bridgeObjectRelease();
    sub_EC1C(&dword_0, v11, v12, "Found salientLinkEntities: %s");
    swift_arrayDestroy();
    sub_8D7C();
    sub_8D7C();
  }
  else
  {
    sub_EBE4();
  }

  sub_BD2C();
  swift_bridgeObjectRetain();
  os_log_type_t v17 = sub_10510();
  os_log_type_t v18 = sub_106D0();
  if (os_log_type_enabled(v17, v18))
  {
    sub_EA98();
    v54[0] = sub_EA60();
    sub_EAE8(COERCE_FLOAT(*((void *)v6 + 90)));
    swift_bridgeObjectRetain();
    uint64_t v19 = sub_10530();
    unint64_t v21 = v20;
    swift_bridgeObjectRelease();
    uint64_t v22 = sub_9D84(v19, v21, v54);
    sub_EA78(v22);
    sub_106F0();
    sub_EBE4();
    os_log_type_t v3 = v52;
    swift_bridgeObjectRelease();
    sub_EC1C(&dword_0, v23, v24, "salientLinkEntities after FlowId lookup: %s");
    swift_arrayDestroy();
    sub_8D7C();
    sub_8D7C();
  }
  else
  {
    sub_EBE4();
  }

  uint64_t v25 = sub_10510();
  os_log_type_t v26 = sub_106D0();
  if (sub_EA0C(v26))
  {
    uint64_t v27 = (uint8_t *)sub_EA48();
    *(_WORD *)uint64_t v27 = 0;
    _os_log_impl(&dword_0, v25, v3, "After processing:", v27, 2u);
    sub_8D7C();
  }

  uint64_t v28 = (void *)(v0 + OBJC_IVAR____TtC36SiriReferenceResolutionMetricsPlugin16MetricsCollector_entitiesByRequest);
  swift_beginAccess();
  uint64_t v48 = *v28 + 64;
  sub_EB10();
  unint64_t v31 = v30 & v29;
  int64_t v49 = (unint64_t)(v32 + 63) >> 6;
  uint64_t v50 = v33;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v34 = 0;
  if (!v31) {
    goto LABEL_16;
  }
LABEL_15:
  unint64_t v35 = __clz(__rbit64(v31));
  v31 &= v31 - 1;
  for (unint64_t i = v35 | (v34 << 6); ; unint64_t i = __clz(__rbit64(v38)) + (v34 << 6))
  {
    unint64_t v40 = *(void *)(*(void *)(*(void *)(v50 + 56) + 8 * i) + 48);
    unint64_t v53 = v40;
    if (v40 >> 62)
    {
      swift_retain();
      swift_bridgeObjectRetain();
      uint64_t result = sub_107C0();
      uint64_t v41 = result;
      if (!result)
      {
LABEL_43:
        swift_release();
        goto LABEL_44;
      }
    }
    else
    {
      uint64_t v41 = *(void *)((char *)&dword_10 + (v40 & 0xFFFFFFFFFFFFFF8));
      swift_retain();
      uint64_t result = swift_bridgeObjectRetain();
      if (!v41) {
        goto LABEL_43;
      }
    }
    if (v41 < 1)
    {
      __break(1u);
LABEL_49:
      __break(1u);
      goto LABEL_50;
    }
    unint64_t v51 = v31;
    for (uint64_t j = 0; j != v41; ++j)
    {
      if ((v53 & 0xC000000000000001) != 0) {
        sub_10760();
      }
      else {
        swift_retain();
      }
      swift_retain_n();
      os_log_type_t v43 = sub_10510();
      os_log_type_t v44 = sub_106D0();
      if (os_log_type_enabled(v43, v44))
      {
        uint64_t v45 = sub_EA98();
        uint64_t v55 = sub_EA60();
        *(_DWORD *)uint64_t v45 = 136315138;
        uint64_t v46 = sub_7134();
        *(void *)(v45 + 4) = sub_9D84(v46, v47, &v55);
        swift_release_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_0, v43, v44, "%s", (uint8_t *)v45, 0xCu);
        swift_arrayDestroy();
        sub_8D7C();
        sub_8D7C();

        swift_release();
      }
      else
      {

        swift_release_n();
      }
    }
    swift_release();
    unint64_t v31 = v51;
LABEL_44:
    uint64_t result = swift_bridgeObjectRelease();
    if (v31) {
      goto LABEL_15;
    }
LABEL_16:
    int64_t v37 = v34 + 1;
    if (__OFADD__(v34, 1)) {
      goto LABEL_49;
    }
    if (v37 >= v49) {
      goto LABEL_46;
    }
    unint64_t v38 = *(void *)(v48 + 8 * v37);
    ++v34;
    if (!v38)
    {
      int64_t v34 = v37 + 1;
      if (v37 + 1 >= v49) {
        goto LABEL_46;
      }
      unint64_t v38 = *(void *)(v48 + 8 * v34);
      if (!v38)
      {
        int64_t v34 = v37 + 2;
        if (v37 + 2 >= v49) {
          goto LABEL_46;
        }
        unint64_t v38 = *(void *)(v48 + 8 * v34);
        if (!v38) {
          break;
        }
      }
    }
LABEL_29:
    unint64_t v31 = (v38 - 1) & v38;
  }
  int64_t v39 = v37 + 3;
  if (v39 >= v49)
  {
LABEL_46:
    swift_release();
    return swift_bridgeObjectRetain();
  }
  unint64_t v38 = *(void *)(v48 + 8 * v39);
  if (v38)
  {
    int64_t v34 = v39;
    goto LABEL_29;
  }
  while (1)
  {
    int64_t v34 = v39 + 1;
    if (__OFADD__(v39, 1)) {
      break;
    }
    if (v34 >= v49) {
      goto LABEL_46;
    }
    unint64_t v38 = *(void *)(v48 + 8 * v34);
    ++v39;
    if (v38) {
      goto LABEL_29;
    }
  }
LABEL_50:
  __break(1u);
  return result;
}

uint64_t sub_D650()
{
  sub_10520();
  sub_AA84();
  uint64_t v1 = sub_AAD8();
  v2(v1);
  sub_10240();
  sub_AA84();
  uint64_t v3 = sub_AAD8();
  v4(v3);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_101C0();
  sub_AA84();
  uint64_t v5 = sub_AAD8();
  v6(v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  return v0;
}

uint64_t sub_D77C()
{
  sub_D650();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v1, v2);
}

uint64_t sub_D7D4()
{
  return type metadata accessor for MetricsCollector();
}

uint64_t type metadata accessor for MetricsCollector()
{
  uint64_t result = qword_19678;
  if (!qword_19678) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_D824()
{
  uint64_t result = sub_10520();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_10240();
    if (v2 <= 0x3F)
    {
      uint64_t result = sub_101C0();
      if (v3 <= 0x3F) {
        return swift_updateClassMetadata2();
      }
    }
  }
  return result;
}

uint64_t sub_D964(uint64_t a1, uint64_t a2)
{
  return sub_CCF4(a1, a2, v2);
}

uint64_t sub_D96C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_D97C()
{
  return swift_release();
}

uint64_t sub_D984(void *a1)
{
  return sub_CDC4(a1);
}

id sub_D98C(uint64_t a1, uint64_t a2, void *a3)
{
  NSString v5 = sub_10550();
  swift_bridgeObjectRelease();
  id v6 = [v3 initWithPrivateStreamIdentifier:v5 storeConfig:a3];

  return v6;
}

char *sub_D9F0(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_107D0();
    __break(1u);
  }
  else if (__dst != __src || &__src[8 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 8 * a2);
  }
  return __src;
}

uint64_t sub_DA84(unint64_t a1, uint64_t a2, unint64_t a3)
{
  return sub_DB90(a1, a2, a3, (uint64_t (*)(void))sub_E9C4);
}

void *sub_DA9C(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0 || (&__dst[8 * a2] > __src ? (BOOL v3 = &__src[8 * a2] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_107D0();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, 8 * a2);
  }
  return result;
}

uint64_t sub_DB78(unint64_t a1, uint64_t a2, unint64_t a3)
{
  return sub_DB90(a1, a2, a3, (uint64_t (*)(void))type metadata accessor for LinkEntityRecord);
}

uint64_t sub_DB90(unint64_t a1, uint64_t a2, unint64_t a3, uint64_t (*a4)(void))
{
  if (a2 < 0 || (a3 + 8 * a2 > a1 ? (BOOL v7 = a1 + 8 * a2 > a3) : (BOOL v7 = 0), v7))
  {
    sub_ECD8();
    uint64_t v9 = sub_107D0();
    __break(1u);
  }
  else
  {
    uint64_t v8 = a4(0);
    uint64_t v9 = a3;
    unint64_t v10 = a1;
    uint64_t v11 = a2;
  }
  return _swift_arrayInitWithCopy(v9, v10, v11, v8);
}

unint64_t sub_DC78(unint64_t result, char a2, uint64_t a3)
{
  if (a2)
  {
    if ((result & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (*(void *)((char *)&dword_10 + (a3 & 0xFFFFFFFFFFFFFF8)) > result)
    {
      return result;
    }
    __break(1u);
  }
  return result;
}

unint64_t sub_DC9C(uint64_t a1, uint64_t a2)
{
  sub_10840();
  sub_105A0();
  Swift::Int v4 = sub_10860();

  return sub_DD14(a1, a2, v4);
}

unint64_t sub_DD14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    unint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_10810() & 1) == 0)
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
      while (!v14 && (sub_10810() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_DDF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v11 = *v4;
  uint64_t *v4 = 0x8000000000000000;
  sub_DF20(a1, a2, a3, a4, isUniquelyReferenced_nonNull_native);
  uint64_t *v4 = v11;

  return swift_bridgeObjectRelease();
}

uint64_t sub_DE90(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v9 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  sub_E060(a1, a2, a3, isUniquelyReferenced_nonNull_native);
  *uint64_t v3 = v9;

  return swift_bridgeObjectRelease();
}

uint64_t sub_DF20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  unint64_t v6 = (void **)v5;
  uint64_t v12 = (void *)*v5;
  unint64_t v13 = sub_DC9C(a3, a4);
  uint64_t v15 = v12[2];
  BOOL v16 = (v14 & 1) == 0;
  Swift::Int v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_11;
  }
  unint64_t v18 = v13;
  char v19 = v14;
  sub_4F9C(&qword_19310);
  if (!sub_10790(a5 & 1, v17)) {
    goto LABEL_5;
  }
  unint64_t v20 = sub_DC9C(a3, a4);
  if ((v19 & 1) != (v21 & 1))
  {
LABEL_11:
    uint64_t result = sub_10820();
    __break(1u);
    return result;
  }
  unint64_t v18 = v20;
LABEL_5:
  uint64_t v22 = *v6;
  if (v19)
  {
    uint64_t v23 = (uint64_t *)(v22[7] + 16 * v18);
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t *v23 = a1;
    v23[1] = a2;
  }
  else
  {
    sub_E188(v18, a3, a4, a1, a2, v22);
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_E060(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  unint64_t v10 = (void *)*v4;
  unint64_t v11 = sub_DC9C(a2, a3);
  uint64_t v13 = v10[2];
  BOOL v14 = (v12 & 1) == 0;
  Swift::Int v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_11;
  }
  unint64_t v16 = v11;
  char v17 = v12;
  sub_4F9C(&qword_197E8);
  if (!sub_10790(a4 & 1, v15)) {
    goto LABEL_5;
  }
  unint64_t v18 = sub_DC9C(a2, a3);
  if ((v17 & 1) != (v19 & 1))
  {
LABEL_11:
    uint64_t result = sub_10820();
    __break(1u);
    return result;
  }
  unint64_t v16 = v18;
LABEL_5:
  unint64_t v20 = *v5;
  if (v17)
  {
    uint64_t v21 = v20[7];
    uint64_t result = swift_release();
    *(void *)(v21 + 8 * v16) = a1;
  }
  else
  {
    sub_E1D4(v16, a2, a3, a1, v20);
    return swift_bridgeObjectRetain();
  }
  return result;
}

unint64_t sub_E188(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  a6[(result >> 6) + 8] |= 1 << result;
  unint64_t v6 = (void *)(a6[6] + 16 * result);
  *unint64_t v6 = a2;
  v6[1] = a3;
  BOOL v7 = (void *)(a6[7] + 16 * result);
  *BOOL v7 = a4;
  v7[1] = a5;
  uint64_t v8 = a6[2];
  BOOL v9 = __OFADD__(v8, 1);
  uint64_t v10 = v8 + 1;
  if (v9) {
    __break(1u);
  }
  else {
    a6[2] = v10;
  }
  return result;
}

unint64_t sub_E1D4(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  a5[(result >> 6) + 8] |= 1 << result;
  uint64_t v5 = (void *)(a5[6] + 16 * result);
  *uint64_t v5 = a2;
  v5[1] = a3;
  *(void *)(a5[7] + 8 * result) = a4;
  uint64_t v6 = a5[2];
  BOOL v7 = __OFADD__(v6, 1);
  uint64_t v8 = v6 + 1;
  if (v7) {
    __break(1u);
  }
  else {
    a5[2] = v8;
  }
  return result;
}

uint64_t sub_E21C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_4F9C(&qword_197F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_E284(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_4F9C(&qword_197F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

char *sub_E2EC(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_E30C(a1, a2, a3, *v3);
  *uint64_t v3 = (uint64_t)result;
  return result;
}

char *sub_E30C(char *result, int64_t a2, char a3, uint64_t a4)
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
    sub_4F9C(&qword_19800);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 8);
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  char v12 = v10 + 32;
  uint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_D9F0(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_DA9C(v13, v8, v12);
  }
  swift_release();
  return v10;
}

id sub_E3F0(uint64_t a1, uint64_t a2, void *a3)
{
  NSString v4 = sub_10550();
  swift_bridgeObjectRelease();
  id v5 = [a3 newPrivateStreamDefaultConfigurationWithStoreBasePath:v4];

  return v5;
}

uint64_t (*sub_E44C())()
{
  unint64_t v1 = sub_EC5C();
  uint64_t v2 = sub_EC7C((uint64_t)v1);
  *(void *)(v0 + 32) = sub_E530(v2, v3, v4);
  return sub_E498;
}

uint64_t (*sub_E49C())()
{
  unint64_t v1 = sub_EC5C();
  uint64_t v2 = sub_EC7C((uint64_t)v1);
  *(void *)(v0 + 32) = sub_E5A0(v2, v3, v4);
  return sub_E498;
}

void sub_E4E8(void *a1)
{
  unint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);

  free(v1);
}

void (*sub_E530(uint64_t a1, unint64_t a2, uint64_t a3))(id *a1)
{
  sub_EB2C(a1, a2, a3);
  if (v6) {
    id v7 = (id)sub_10760();
  }
  else {
    id v7 = *(id *)(v4 + 8 * v5 + 32);
  }
  *unint64_t v3 = v7;
  return sub_E598;
}

void sub_E598(id *a1)
{
}

uint64_t (*sub_E5A0(uint64_t a1, unint64_t a2, uint64_t a3))()
{
  sub_EB2C(a1, a2, a3);
  if (v4) {
    uint64_t v5 = sub_10760();
  }
  else {
    uint64_t v5 = swift_retain();
  }
  *unint64_t v3 = v5;
  return sub_E608;
}

uint64_t sub_E608()
{
  return swift_release();
}

void *sub_E610(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return &_swiftEmptyArrayStorage;
  }
  sub_4F9C(&qword_197F8);
  unint64_t v3 = (void *)swift_allocObject();
  size_t v4 = j__malloc_size(v3);
  v3[2] = v1;
  v3[3] = 2 * ((uint64_t)(v4 - 32) / 16);
  uint64_t v5 = sub_E6F4((uint64_t)&v7, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_E8F4();
  if (v5 != v1)
  {
    __break(1u);
    return &_swiftEmptyArrayStorage;
  }
  return v3;
}

uint64_t sub_E6F4(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = (void *)result;
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
  size_t v11 = a2;
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
    unint64_t v20 = (void *)(*(void *)(a4 + 48) + 16 * v16);
    uint64_t v21 = v20[1];
    *size_t v11 = *v20;
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

uint64_t sub_E8F4()
{
  return swift_release();
}

uint64_t sub_E8FC(uint64_t a1)
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

uint64_t sub_E97C(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_E9C4()
{
  unint64_t result = qword_19820;
  if (!qword_19820)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_19820);
  }
  return result;
}

BOOL sub_EA0C(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

void sub_EA28(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

uint64_t sub_EA48()
{
  return swift_slowAlloc();
}

uint64_t sub_EA60()
{
  return swift_slowAlloc();
}

uint64_t sub_EA78(uint64_t a1)
{
  *(void *)(v1 - 72) = a1;
  return v1 - 72;
}

uint64_t sub_EA98()
{
  return swift_slowAlloc();
}

uint64_t sub_EAB0()
{
  return v0;
}

uint64_t sub_EAE8(float a1)
{
  *uint64_t v1 = a1;
  return type metadata accessor for NLRequestEntityRecordWrapper();
}

unint64_t sub_EB2C(uint64_t a1, unint64_t a2, uint64_t a3)
{
  return sub_DC78(a2, (a3 & 0xC000000000000001) == 0, a3);
}

uint64_t sub_EB54(uint64_t a1)
{
  *(void *)(v1 - 136) = a1;
  return v1 - 136;
}

uint64_t sub_EBCC()
{
  return sub_52A4(v1, v0);
}

uint64_t sub_EBE4()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t sub_EBFC()
{
  return v0;
}

void sub_EC1C(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v6, a4, v5, 0xCu);
}

void sub_EC3C(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

void *sub_EC5C()
{
  return malloc(0x28uLL);
}

uint64_t sub_EC7C(uint64_t result)
{
  *uint64_t v1 = result;
  return result;
}

uint64_t sub_EC90()
{
  return swift_beginAccess();
}

uint64_t sub_ECB0()
{
  return v0;
}

uint64_t sub_ECEC()
{
  return v0;
}

uint64_t SiriLinkRRProvisionalLinkEntityPresentReadFrom(void *a1, uint64_t a2)
{
  while (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      break;
    }
    char v4 = 0;
    unsigned int v5 = 0;
    unint64_t v6 = 0;
    while (1)
    {
      unint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v7 == -1 || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v8 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
      v6 |= (unint64_t)(v8 & 0x7F) << v4;
      if ((v8 & 0x80) == 0) {
        goto LABEL_11;
      }
      v4 += 7;
      BOOL v9 = v5++ >= 9;
      if (v9)
      {
        unint64_t v6 = 0;
        int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v6 = 0;
    }
LABEL_13:
    if (v10 || (v6 & 7) == 4) {
      break;
    }
    switch((v6 >> 3))
    {
      case 1u:
        int64_t v12 = PBReaderReadString();
        [a1 setSourceBundleId:v12];
        goto LABEL_22;
      case 2u:
        int64_t v12 = PBReaderReadString();
        [a1 setLinkEntityType:v12];
LABEL_22:

        continue;
      case 3u:
        char v14 = 0;
        unsigned int v15 = 0;
        uint64_t v16 = 0;
        while (2)
        {
          unint64_t v17 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v17 == -1 || v17 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v18 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v17);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v17 + 1;
            v16 |= (unint64_t)(v18 & 0x7F) << v14;
            if (v18 < 0)
            {
              v14 += 7;
              BOOL v9 = v15++ >= 9;
              if (v9)
              {
                uint64_t v19 = 0;
                goto LABEL_41;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v19 = 0;
        }
        else {
          uint64_t v19 = v16;
        }
LABEL_41:
        [a1 setExecutionStage:v19];
        continue;
      case 4u:
        char v20 = 0;
        unsigned int v21 = 0;
        uint64_t v22 = 0;
        break;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        continue;
    }
    while (1)
    {
      unint64_t v23 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v23 == -1 || v23 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v24 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v23);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v23 + 1;
      v22 |= (unint64_t)(v24 & 0x7F) << v20;
      if ((v24 & 0x80) == 0) {
        goto LABEL_43;
      }
      v20 += 7;
      BOOL v9 = v21++ >= 9;
      if (v9)
      {
        uint64_t v22 = 0;
        goto LABEL_45;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_43:
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      uint64_t v22 = 0;
    }
LABEL_45:
    [a1 setEntityPresent:v22 != 0];
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

uint64_t SiriLinkRRProvisionalSRRLinkMetricClientEventReadFrom(void *a1, uint64_t a2)
{
  while (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      break;
    }
    char v4 = 0;
    unsigned int v5 = 0;
    unint64_t v6 = 0;
    while (1)
    {
      unint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v7 == -1 || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v8 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
      v6 |= (unint64_t)(v8 & 0x7F) << v4;
      if ((v8 & 0x80) == 0) {
        goto LABEL_11;
      }
      v4 += 7;
      if (v5++ >= 9)
      {
        unint64_t v6 = 0;
        int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v6 = 0;
    }
LABEL_13:
    if (v10 || (v6 & 7) == 4) {
      break;
    }
    if ((v6 >> 3) == 101)
    {
      int64_t v12 = objc_alloc_init(SiriLinkRRProvisionalLinkEntityPresent);
      if (!PBReaderPlaceMark() || (SiriLinkRRProvisionalLinkEntityPresentReadFrom(v12, a2) & 1) == 0)
      {

        return 0;
      }
      PBReaderRecallMark();
      objc_msgSend(a1, "setLinkEntityPresent:", v12, 0, 0);
    }
    else
    {
      uint64_t result = PBReaderSkipValueWithTag();
      if (!result) {
        return result;
      }
    }
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

uint64_t sub_10130()
{
  return dispatch thunk of JSONDecoder.decode<A>(_:from:)();
}

uint64_t sub_10140()
{
  return JSONDecoder.init()();
}

uint64_t sub_10150()
{
  return type metadata accessor for JSONDecoder();
}

uint64_t sub_10160()
{
  return _convertNSErrorToError(_:)();
}

void sub_10170(NSURL *retstr@<X8>)
{
}

uint64_t sub_10180()
{
  return URL.appendingPathComponent(_:isDirectory:)();
}

uint64_t sub_10190()
{
  return URL.appendingPathComponent(_:)();
}

uint64_t sub_101A0()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_101B0()
{
  return URL.path.getter();
}

uint64_t sub_101C0()
{
  return type metadata accessor for URL();
}

uint64_t sub_101D0()
{
  return Data.init(contentsOf:options:)();
}

uint64_t sub_101E0()
{
  return Data.init(base64Encoded:options:)();
}

NSData sub_101F0()
{
  return Data._bridgeToObjectiveC()();
}

uint64_t sub_10200()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10210()
{
  return Data.write(to:options:)();
}

uint64_t sub_10220()
{
  return Date.timeIntervalSinceReferenceDate.getter();
}

uint64_t sub_10230()
{
  return Date.init()();
}

uint64_t sub_10240()
{
  return type metadata accessor for Date();
}

uint64_t sub_10250()
{
  return UUID.uuidString.getter();
}

NSUUID sub_10260()
{
  return UUID._bridgeToObjectiveC()();
}

uint64_t sub_10270()
{
  return UUID.init()();
}

uint64_t sub_10280()
{
  return type metadata accessor for UUID();
}

uint64_t sub_10290()
{
  return Calendar.date(byAdding:value:to:wrappingComponents:)();
}

uint64_t sub_102A0()
{
  return static Calendar.current.getter();
}

uint64_t sub_102B0()
{
  return type metadata accessor for Calendar.Component();
}

uint64_t sub_102C0()
{
  return type metadata accessor for Calendar();
}

uint64_t sub_102D0()
{
  return PublisherProtocol<>.sink(with:completion:shouldContinue:)();
}

uint64_t sub_102E0()
{
  return BookmarkablePublisher.init(_:)();
}

uint64_t sub_102F0()
{
  return type metadata accessor for Siri_Nlu_External_UsoGraph();
}

uint64_t sub_10300()
{
  return Siri_Nlu_External_NLContext.salientEntities.getter();
}

uint64_t sub_10310()
{
  return type metadata accessor for Siri_Nlu_External_NLContext();
}

uint64_t sub_10320()
{
  return Siri_Nlu_External_RequestID.id.getter();
}

uint64_t sub_10330()
{
  return type metadata accessor for Siri_Nlu_External_RequestID();
}

uint64_t sub_10340()
{
  return Siri_Nlu_External_TurnInput.turnContext.getter();
}

uint64_t sub_10350()
{
  return type metadata accessor for Siri_Nlu_External_TurnInput();
}

uint64_t sub_10360()
{
  return Siri_Nlu_External_TurnContext.nlContext.getter();
}

uint64_t sub_10370()
{
  return type metadata accessor for Siri_Nlu_External_TurnContext();
}

uint64_t sub_10380()
{
  return Siri_Nlu_External_EntityCandidate.entity.getter();
}

uint64_t sub_10390()
{
  return type metadata accessor for Siri_Nlu_External_EntityCandidate();
}

uint64_t sub_103A0()
{
  return Siri_Nlu_External_Cdm_NluRequest.currentTurnInput.getter();
}

uint64_t sub_103B0()
{
  return Siri_Nlu_External_Cdm_NluRequest.requestID.getter();
}

uint64_t sub_103C0()
{
  return type metadata accessor for Siri_Nlu_External_Cdm_NluRequest();
}

uint64_t sub_103D0()
{
  return static UsoGraphProtoReader.fromSwiftProtobuf(protobufGraph:vocabManager:)();
}

uint64_t sub_103E0()
{
  return UsoIdentifier.appBundleId.getter();
}

uint64_t sub_103F0()
{
  return UsoIdentifier.value.getter();
}

uint64_t sub_10400()
{
  return UsoIdentifier.namespace.getter();
}

uint64_t sub_10410()
{
  return type metadata accessor for UsoIdentifier();
}

uint64_t sub_10420()
{
  return static UsoGraphUnitIndex.NAMES.getter();
}

uint64_t sub_10430()
{
  return static UsoConversionUtils.extractFirstEntityFromGraph(graph:)();
}

uint64_t sub_10440()
{
  return UsoGraphVocabManager.init(withListOfNames:)();
}

uint64_t sub_10450()
{
  return type metadata accessor for UsoGraphVocabManager();
}

uint64_t sub_10460()
{
  return UsoEntity.usoIdentifiers.getter();
}

uint64_t sub_10470()
{
  return UsoEntity.valueTypeString.getter();
}

uint64_t sub_10480()
{
  return type metadata accessor for UsoEntity();
}

uint64_t sub_10490()
{
  return JSONDecodingOptions.init()();
}

uint64_t sub_104A0()
{
  return type metadata accessor for JSONDecodingOptions();
}

uint64_t sub_104B0()
{
  return Message.init(jsonUTF8Data:options:)();
}

uint64_t sub_104C0()
{
  return static SRRLog.logger<A>(_:)();
}

uint64_t sub_104D0()
{
  return PrivateLearningPluginError.init(message:)();
}

uint64_t sub_104E0()
{
  return type metadata accessor for PrivateLearningPluginResult();
}

uint64_t sub_104F0()
{
  return static PrivateLearningPluginRunContext.== infix(_:_:)();
}

uint64_t sub_10500()
{
  return type metadata accessor for PrivateLearningPluginRunContext();
}

uint64_t sub_10510()
{
  return Logger.logObject.getter();
}

uint64_t sub_10520()
{
  return type metadata accessor for Logger();
}

uint64_t sub_10530()
{
  return Dictionary.description.getter();
}

uint64_t sub_10540()
{
  return Dictionary.init(dictionaryLiteral:)();
}

NSString sub_10550()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_10560()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10570()
{
  return String.init<A>(describing:)();
}

uint64_t sub_10580()
{
  return static String._fromSubstring(_:)();
}

uint64_t sub_10590()
{
  return static String._uncheckedFromUTF8(_:)();
}

uint64_t sub_105A0()
{
  return String.hash(into:)();
}

void sub_105B0(Swift::String a1)
{
}

Swift::Int sub_105C0()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_105D0()
{
  return String.UTF8View._foreignIndex(after:)();
}

uint64_t sub_105E0()
{
  return String.UTF8View._foreignIndex(_:offsetBy:)();
}

uint64_t sub_105F0()
{
  return String.UTF8View._foreignDistance(from:to:)();
}

uint64_t sub_10600()
{
  return String.UTF8View._foreignSubscript(position:)();
}

uint64_t sub_10610()
{
  return String.UTF16View.index(_:offsetBy:)();
}

uint64_t sub_10620()
{
  return String.init<A>(_:)();
}

uint64_t sub_10640()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_10650()
{
  return specialized Array._endMutation()();
}

uint64_t sub_10660()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_10670()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_10680()
{
  return Double.write<A>(to:)();
}

NSSet sub_10690()
{
  return Set._bridgeToObjectiveC()();
}

uint64_t sub_106A0()
{
  return static Set._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_106B0()
{
  return SISchemaUUID.toNSUUID()();
}

uint64_t sub_106C0()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_106D0()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_106E0()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_106F0()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_10700()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_10710()
{
  return StringProtocol<>.split(separator:maxSplits:omittingEmptySubsequences:)();
}

uint64_t sub_10720()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t sub_10730()
{
  return _HashTable.occupiedBucket(after:)();
}

void sub_10740(Swift::Int a1)
{
}

uint64_t sub_10750()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_10760()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_10770()
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_10780()
{
  return _StringObject.sharedUTF8.getter();
}

BOOL sub_10790(Swift::Bool isUnique, Swift::Int capacity)
{
  return _NativeDictionary.ensureUnique(isUnique:capacity:)(isUnique, capacity);
}

uint64_t sub_107A0()
{
  return _NativeDictionary._delete(at:)();
}

uint64_t sub_107B0()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_107C0()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_107D0()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_107E0()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_107F0()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_10800()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_10810()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_10820()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_10830()
{
  return Error.localizedDescription.getter();
}

uint64_t sub_10840()
{
  return Hasher.init(_seed:)();
}

void sub_10850(Swift::UInt a1)
{
}

Swift::Int sub_10860()
{
  return Hasher._finalize()();
}

uint64_t sub_10870()
{
  return dispatch thunk of Decoder.container<A>(keyedBy:)();
}

uint64_t sub_10880()
{
  return dispatch thunk of Encoder.container<A>(keyedBy:)();
}

uint64_t PBDataWriterWriteBOOLField()
{
  return _PBDataWriterWriteBOOLField();
}

uint64_t PBDataWriterWriteInt32Field()
{
  return _PBDataWriterWriteInt32Field();
}

uint64_t PBDataWriterWriteStringField()
{
  return _PBDataWriterWriteStringField();
}

uint64_t PBDataWriterWriteSubmessage()
{
  return _PBDataWriterWriteSubmessage();
}

uint64_t PBReaderPlaceMark()
{
  return _PBReaderPlaceMark();
}

uint64_t PBReaderReadString()
{
  return _PBReaderReadString();
}

uint64_t PBReaderRecallMark()
{
  return _PBReaderRecallMark();
}

uint64_t PBReaderSkipValueWithTag()
{
  return _PBReaderSkipValueWithTag();
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

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
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

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
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

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastObjCClass()
{
  return _swift_dynamicCastObjCClass();
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

uint64_t swift_getErrorValue()
{
  return _swift_getErrorValue();
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

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return _swift_getTypeByMangledNameInContextInMetadataState2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
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

id objc_msgSend_JSONObjectWithData_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "JSONObjectWithData:options:error:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_dataWithJSONObject_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithJSONObject:options:error:");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _[a1 dictionary];
}

id objc_msgSend_dictionaryRepresentation(void *a1, const char *a2, ...)
{
  return _[a1 dictionaryRepresentation];
}

id objc_msgSend_entityPresent(void *a1, const char *a2, ...)
{
  return _[a1 entityPresent];
}

id objc_msgSend_executionStage(void *a1, const char *a2, ...)
{
  return _[a1 executionStage];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return _[a1 hash];
}

id objc_msgSend_initWithDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDictionary:");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return _[a1 intValue];
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isMemberOfClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isMemberOfClass:");
}

id objc_msgSend_isValidJSONObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isValidJSONObject:");
}

id objc_msgSend_linkEntityPresent(void *a1, const char *a2, ...)
{
  return _[a1 linkEntityPresent];
}

id objc_msgSend_linkEntityType(void *a1, const char *a2, ...)
{
  return _[a1 linkEntityType];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return _[a1 null];
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_setEntityPresent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEntityPresent:");
}

id objc_msgSend_setExecutionStage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExecutionStage:");
}

id objc_msgSend_setLinkEntityPresent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLinkEntityPresent:");
}

id objc_msgSend_setLinkEntityType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLinkEntityType:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setSourceBundleId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSourceBundleId:");
}

id objc_msgSend_sourceBundleId(void *a1, const char *a2, ...)
{
  return _[a1 sourceBundleId];
}

id objc_msgSend_whichEvent_Type(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "whichEvent_Type");
}

id objc_msgSend_willProduceDictionaryRepresentation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "willProduceDictionaryRepresentation:");
}