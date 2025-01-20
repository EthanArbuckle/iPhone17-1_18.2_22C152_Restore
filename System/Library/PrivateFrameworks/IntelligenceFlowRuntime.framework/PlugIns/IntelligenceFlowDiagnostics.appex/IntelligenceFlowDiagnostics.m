uint64_t variable initialization expression of Diagnostics.logger()
{
  return sub_10000A0D0();
}

void type metadata accessor for BPSCompletionState()
{
  if (!qword_1000101F0)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_1000101F0);
    }
  }
}

void *initializeBufferWithCopyOfBuffer for ElementHierarchyAttachment(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for ElementHierarchyAttachment()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for ElementHierarchyAttachment(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for ElementHierarchyAttachment(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void *assignWithTake for ElementHierarchyAttachment(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ElementHierarchyAttachment(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 16))
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

uint64_t storeEnumTagSinglePayload for ElementHierarchyAttachment(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for ElementHierarchyAttachment()
{
  return &type metadata for ElementHierarchyAttachment;
}

unsigned char *initializeBufferWithCopyOfBuffer for UIAttachmentError(unsigned char *result, unsigned char *a2)
{
  *__n128 result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for UIAttachmentError(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFC)
  {
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
    int v5 = (*a1 | (v4 << 8)) - 5;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 5;
  int v5 = v6 - 5;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for UIAttachmentError(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 4;
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
        JUMPOUT(0x100002AB0);
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
          *__n128 result = a2 + 4;
        break;
    }
  }
  return result;
}

uint64_t sub_100002AD8(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_100002AE4(unsigned char *result, char a2)
{
  *__n128 result = a2;
  return result;
}

ValueMetadata *type metadata accessor for UIAttachmentError()
{
  return &type metadata for UIAttachmentError;
}

unint64_t sub_100002B00()
{
  unint64_t result = qword_1000101F8;
  if (!qword_1000101F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000101F8);
  }
  return result;
}

BOOL sub_100002B4C(char a1, char a2)
{
  return a1 == a2;
}

void sub_100002B5C(uint64_t a1, unsigned __int8 a2)
{
}

Swift::Int sub_100002B84(unsigned __int8 a1)
{
  return sub_10000A390();
}

BOOL sub_100002BCC(char *a1, char *a2)
{
  return sub_100002B4C(*a1, *a2);
}

Swift::Int sub_100002BD8()
{
  return sub_100002B84(*v0);
}

void sub_100002BE0(uint64_t a1)
{
  sub_100002B5C(a1, *v1);
}

Swift::Int sub_100002BE8()
{
  Swift::UInt v1 = *v0;
  sub_10000A370();
  sub_10000A380(v1);
  return sub_10000A390();
}

uint64_t sub_100002C40@<X0>(uint64_t a1@<X8>)
{
  sub_10000A080();
  swift_allocObject();
  sub_10000A070();
  sub_10000A060();
  swift_release();
  uint64_t v2 = sub_10000A0B0();

  return sub_100003348(a1, 0, 1, v2);
}

uint64_t sub_100002CDC()
{
  uint64_t v1 = sub_10000A180();
  __chkstk_darwin(v1 - 8);
  sub_100003380();
  uint64_t v4 = v3 - v2;
  uint64_t v5 = sub_100009E90();
  __chkstk_darwin(v5);
  sub_100003380();
  uint64_t v6 = sub_100003028(&qword_100010200);
  __chkstk_darwin(v6 - 8);
  sub_100003380();
  uint64_t v9 = v8 - v7;
  swift_bridgeObjectRetain();
  sub_100002C40(v9);
  swift_bridgeObjectRelease();
  uint64_t v10 = sub_10000A0B0();
  if (sub_10000306C(v9, 1, v10) == 1)
  {
    sub_100003094(v9);
  }
  else
  {
    sub_10000A090();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
  }
  sub_100009ED0();
  swift_allocObject();
  sub_100009EC0();
  sub_100003028(&qword_100010208);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_10000AE80;
  sub_100009E80();
  sub_100009E70();
  sub_1000032A8(&qword_100010210, (void (*)(uint64_t))&type metadata accessor for JSONEncoder.OutputFormatting);
  sub_100003028(&qword_100010218);
  sub_1000030F4();
  sub_10000A250();
  sub_100009EA0();
  sub_100003028(&qword_100010228);
  sub_100003190();
  uint64_t v11 = sub_100009EB0();
  if (v0)
  {
    swift_release();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v13 = v11;
    unint64_t v14 = v12;
    swift_bridgeObjectRelease();
    sub_10000A170();
    uint64_t v4 = sub_10000A160();
    sub_1000032F0(v13, v14);
    swift_release();
  }
  return v4;
}

uint64_t sub_100003028(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_10000306C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_100003094(uint64_t a1)
{
  uint64_t v2 = sub_100003028(&qword_100010200);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_1000030F4()
{
  unint64_t result = qword_100010220;
  if (!qword_100010220)
  {
    sub_100003148(&qword_100010218);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010220);
  }
  return result;
}

uint64_t sub_100003148(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_100003190()
{
  unint64_t result = qword_100010230;
  if (!qword_100010230)
  {
    sub_100003148(&qword_100010228);
    sub_100003204();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010230);
  }
  return result;
}

unint64_t sub_100003204()
{
  unint64_t result = qword_100010238;
  if (!qword_100010238)
  {
    sub_100003148(&qword_100010240);
    sub_1000032A8(&qword_100010248, (void (*)(uint64_t))&type metadata accessor for UIContextElement);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010238);
  }
  return result;
}

uint64_t sub_1000032A8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1000032F0(uint64_t a1, unint64_t a2)
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

uint64_t sub_100003348(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

ValueMetadata *type metadata accessor for UIElementsAttachment()
{
  return &type metadata for UIElementsAttachment;
}

uint64_t sub_100003390(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000A0E0();
  uint64_t v5 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);

  return v5(a1, a2, v4);
}

uint64_t sub_1000033FC(uint64_t a1)
{
  uint64_t v2 = sub_10000A0E0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);

  return v3(a1, v2);
}

uint64_t sub_100003460(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000A0E0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t sub_1000034C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000A0E0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t sub_100003528(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000A0E0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t sub_10000358C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000A0E0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t sub_1000035F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100003604);
}

uint64_t sub_100003604(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000A0E0();

  return sub_10000306C(a1, a2, v4);
}

uint64_t sub_10000364C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100003660);
}

uint64_t sub_100003660(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000A0E0();

  return sub_100003348(a1, a2, a2, v4);
}

uint64_t type metadata accessor for TranscriptAttachment()
{
  uint64_t result = qword_1000102A8;
  if (!qword_1000102A8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1000036F4()
{
  uint64_t result = sub_10000A0E0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_100003780()
{
  uint64_t v0 = sub_10000A180();
  sub_1000066A4();
  uint64_t v2 = v1;
  __chkstk_darwin();
  sub_100003380();
  uint64_t v5 = v4 - v3;
  sub_10000A170();
  uint64_t v6 = sub_10000A150();
  unint64_t v8 = v7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v5, v0);
  if (v8 >> 60 == 15)
  {
    sub_1000038A4();
    swift_allocError();
    *uint64_t v9 = 3;
    return swift_willThrow();
  }
  else
  {
    sub_100005580(v6, v8);
    return sub_1000056FC(v6, v8);
  }
}

unint64_t sub_1000038A4()
{
  unint64_t result = qword_1000102E0;
  if (!qword_1000102E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000102E0);
  }
  return result;
}

void *sub_1000038F0()
{
  uint64_t v1 = sub_100003028(&qword_1000102E8);
  __chkstk_darwin(v1 - 8);
  sub_100003380();
  uint64_t v107 = v3 - v2;
  uint64_t v4 = type metadata accessor for TranscriptAttachment();
  uint64_t v5 = sub_1000066C0(v4);
  uint64_t v110 = v6;
  uint64_t v8 = *(void *)(v7 + 64);
  __chkstk_darwin(v5);
  uint64_t v9 = sub_10000A180();
  sub_1000066A4();
  unint64_t v109 = v10;
  __chkstk_darwin(v11);
  sub_100003380();
  unint64_t v14 = (uint8_t *)(v13 - v12);
  sub_10000A0E0();
  sub_1000066A4();
  uint64_t v111 = v15;
  uint64_t v112 = v16;
  __chkstk_darwin(v15);
  sub_100006774();
  uint64_t v19 = v17 - v18;
  __chkstk_darwin(v20);
  v108 = (void (*)(void))((char *)v93 - v21);
  uint64_t v116 = sub_100009F60();
  sub_1000066A4();
  uint64_t v113 = v22;
  __chkstk_darwin(v23);
  sub_100006774();
  v26 = (void *)(v24 - v25);
  __chkstk_darwin(v27);
  sub_10000679C();
  uint64_t v29 = __chkstk_darwin(v28);
  v114 = (void (*)(void))((char *)v93 - v30);
  __chkstk_darwin(v29);
  v32 = (char *)v93 - v31;
  id v33 = sub_1000043D0();
  uint64_t v34 = v117;
  sub_10000454C((uint64_t)v32);
  uint64_t v117 = v34;
  if (v34)
  {

    return v26;
  }
  v100 = v0;
  v103 = v14;
  uint64_t v104 = v9;
  uint64_t v98 = v8;
  uint64_t v99 = (uint64_t)v93 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v96 = v26;
  uint64_t v97 = v19;
  id v105 = v33;
  uint64_t v36 = v111;
  uint64_t v35 = v112;
  v37 = *(void (**)(uint64_t, os_log_t, uint64_t))(v112 + 16);
  v38 = v108;
  uint64_t v95 = v112 + 16;
  v94 = v37;
  v37((uint64_t)v108, v115, v111);
  v26 = (void *)v113;
  v39 = *(void (**)(void, void, void))(v113 + 16);
  v106 = v32;
  uint64_t v102 = v113 + 16;
  v101 = v39;
  v39(v114, v32, v116);
  v40 = sub_10000A0C0();
  os_log_type_t v41 = sub_10000A210();
  if (os_log_type_enabled(v40, v41))
  {
    v42 = (uint8_t *)swift_slowAlloc();
    uint64_t aBlock = swift_slowAlloc();
    *(_DWORD *)v42 = 136315138;
    v93[1] = v42 + 4;
    sub_100006500((unint64_t *)&qword_1000102F8, (void (*)(uint64_t))&type metadata accessor for URL);
    uint64_t v43 = sub_10000A310();
    uint64_t v45 = sub_10000926C(v43, v44, &aBlock);
    sub_1000067B0(v45);
    sub_10000A220();
    swift_bridgeObjectRelease();
    v46 = (void *)v113;
    v47 = *(void (**)(void))(v113 + 8);
    sub_1000066D8();
    v47();
    _os_log_impl((void *)&_mh_execute_header, v40, v41, "TranscriptAttachment: file path: %s", v42, 0xCu);
    swift_arrayDestroy();
    sub_1000067E4();
    sub_1000067E4();

    v48 = *(void (**)(void))(v112 + 8);
    sub_100006704();
    v48();
    v26 = v46;
  }
  else
  {
    v47 = (void (*)(void))v26[1];
    sub_1000066D8();
    v47();

    v48 = *(void (**)(void))(v35 + 8);
    ((void (*)(void (*)(void), uint64_t))v48)(v38, v36);
  }
  uint64_t v49 = v110;
  sub_10000A170();
  uint64_t v50 = sub_10000A150();
  unint64_t v52 = v51;
  sub_100006740();
  v53();
  os_log_t v54 = v115;
  if (v52 >> 60 == 15)
  {
    sub_1000038A4();
    uint64_t v55 = swift_allocError();
    unsigned char *v56 = 4;
    uint64_t v117 = v55;
    swift_willThrow();

    sub_1000066D8();
    v47();
    return v26;
  }
  uint64_t v57 = v117;
  sub_100009F90();
  uint64_t v117 = v57;
  if (v57)
  {
    sub_1000066D8();
    v47();
    sub_1000056FC(v50, v52);

    return v26;
  }
  unint64_t v109 = v52;
  uint64_t v110 = v50;
  v114 = v47;
  sub_100005FF4();
  v26 = v100;
  sub_1000066E8();
  v58();
  id v59 = sub_100008488((uint64_t)v26, 1);
  if (!v59)
  {
    sub_1000038A4();
    uint64_t v71 = swift_allocError();
    unsigned char *v72 = 1;
    uint64_t v117 = v71;
    swift_willThrow();
    sub_1000056FC(v110, v109);

    goto LABEL_14;
  }
  v60 = v59;
  v108 = v48;
  [v59 open];
  uint64_t v61 = swift_allocObject();
  *(unsigned char *)(v61 + 16) = 1;
  uint64_t v62 = v99;
  sub_100006044((uint64_t)v54, v99);
  uint64_t v63 = *(unsigned __int8 *)(v49 + 80);
  uint64_t v64 = swift_allocObject();
  sub_10000614C(v62, v64 + ((v63 + 16) & ~v63));
  v122 = sub_1000061B0;
  uint64_t v123 = v64;
  uint64_t aBlock = (uint64_t)_NSConcreteStackBlock;
  uint64_t v119 = 1107296256;
  v120 = sub_100004CEC;
  v121 = &unk_10000C990;
  v65 = _Block_copy(&aBlock);
  swift_release();
  sub_100006044((uint64_t)v54, v62);
  uint64_t v66 = swift_allocObject();
  *(void *)(v66 + 16) = v61;
  *(void *)(v66 + 24) = v60;
  sub_10000614C(v62, v66 + ((v63 + 32) & ~v63));
  v122 = sub_1000062CC;
  uint64_t v123 = v66;
  uint64_t aBlock = (uint64_t)_NSConcreteStackBlock;
  uint64_t v119 = 1107296256;
  v120 = sub_100004CEC;
  v121 = &unk_10000C9E0;
  v67 = _Block_copy(&aBlock);
  swift_retain();
  id v68 = v60;
  swift_release();
  id v69 = v105;
  v26 = [v105 sinkWithCompletion:v65 receiveInput:v67];
  _Block_release(v67);
  _Block_release(v65);

  uint64_t v70 = v117;
  sub_100003780();
  uint64_t v117 = v70;
  if (v70)
  {
    swift_release();
    [v68 close];
    sub_1000056FC(v110, v109);

LABEL_14:
    sub_100006704();
    v73();
    return v26;
  }
  v94(v97, v115, v111);
  sub_1000066E8();
  v75();
  v76 = sub_10000A0C0();
  os_log_type_t v77 = sub_10000A210();
  if (os_log_type_enabled(v76, v77))
  {
    os_log_t v115 = v76;
    v78 = (uint8_t *)swift_slowAlloc();
    uint64_t v104 = swift_slowAlloc();
    uint64_t aBlock = v104;
    *(_DWORD *)v78 = 136315138;
    v103 = v78 + 4;
    sub_100006500((unint64_t *)&qword_1000102F8, (void (*)(uint64_t))&type metadata accessor for URL);
    uint64_t v79 = sub_10000A310();
    uint64_t v81 = sub_10000926C(v79, v80, &aBlock);
    sub_1000067B0(v81);
    sub_10000A220();
    swift_bridgeObjectRelease();
    sub_100006704();
    v82();
    os_log_t v83 = v115;
    _os_log_impl((void *)&_mh_execute_header, v115, v77, "TranscriptAttachment: finished writing to: %s", v78, 0xCu);
    swift_arrayDestroy();
    sub_1000067E4();
    sub_1000067E4();
  }
  else
  {
    sub_1000066D8();
    v84();
  }
  sub_100006704();
  v85();
  uint64_t v86 = v110;
  uint64_t v87 = v107;
  uint64_t v88 = v116;
  sub_1000066E8();
  v89();
  sub_100003348(v87, 0, 1, v88);
  id v90 = objc_allocWithZone((Class)DEAttachmentItem);
  unint64_t result = sub_100008FEC(v87);
  id v91 = v105;
  if (result)
  {
    v26 = result;
    swift_release();
    [v68 close];
    sub_1000056FC(v86, v109);

    sub_1000066D8();
    v92();
    return v26;
  }
  __break(1u);
  return result;
}

id sub_1000043D0()
{
  uint64_t v1 = sub_100009FC0();
  sub_1000066A4();
  uint64_t v3 = v2;
  __chkstk_darwin();
  sub_10000675C();
  id v4 = [objc_allocWithZone((Class)BMPublisherOptions) init];
  sub_100009FB0();
  Class isa = sub_100009FA0().super.isa;
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v0, v1);
  [v4 setStartDate:isa];

  id v6 = [(id)BiomeLibrary() Sage];
  swift_unknownObjectRelease();
  id v7 = [v6 Transcript];
  swift_unknownObjectRelease();
  NSString v8 = sub_10000A140();
  id v9 = [v7 publisherWithUseCase:v8 options:v4];

  return v9;
}

uint64_t sub_10000454C@<X0>(uint64_t a1@<X8>)
{
  v23[1] = a1;
  sub_100009FF0();
  sub_1000066A4();
  v23[3] = v3;
  v23[4] = v2;
  __chkstk_darwin();
  sub_100006724();
  uint64_t v4 = sub_100009F60();
  sub_1000066A4();
  uint64_t v6 = v5;
  __chkstk_darwin();
  sub_100006774();
  __chkstk_darwin();
  sub_10000679C();
  __chkstk_darwin();
  NSString v8 = (char *)v23 - v7;
  id v9 = self;
  id v10 = [v9 defaultManager];
  id v11 = [v10 temporaryDirectory];

  sub_100009F50();
  sub_100009F40();
  uint64_t v12 = *(void (**)(void))(v6 + 8);
  uint64_t v24 = v4;
  uint64_t v13 = v12;
  ((void (*)(uint64_t, uint64_t))v12)(v1, v4);
  sub_100009FE0();
  sub_100009FD0();
  sub_100006740();
  v14();
  sub_100009F40();
  swift_bridgeObjectRelease();
  id v15 = [v9 defaultManager];
  sub_100009F20(v16);
  uint64_t v18 = v17;
  id v25 = 0;
  LOBYTE(v10) = [v15 createDirectoryAtURL:v17 withIntermediateDirectories:1 attributes:0 error:&v25];

  if (v10)
  {
    id v19 = v25;
    sub_100009F30();
    sub_10000674C();
    v13();
    sub_10000674C();
    return ((uint64_t (*)(void))v13)();
  }
  else
  {
    id v21 = v25;
    sub_100009F10();

    swift_willThrow();
    uint64_t v22 = v24;
    sub_10000674C();
    v13();
    return ((uint64_t (*)(char *, uint64_t))v13)(v8, v22);
  }
}

uint64_t sub_100004850(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_10000A0E0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = ((uint64_t (*)(void))__chkstk_darwin)();
  NSString v8 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __chkstk_darwin(v6);
  id v11 = (char *)&v31 - v10;
  __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v31 - v12;
  id v14 = [a1 state];
  if (v14 == (id)1)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v11, a2, v4);
    id v19 = a1;
    uint64_t v20 = sub_10000A0C0();
    os_log_type_t v21 = sub_10000A200();
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v22 = (uint8_t *)swift_slowAlloc();
      uint64_t v32 = swift_slowAlloc();
      uint64_t v34 = v32;
      *(_DWORD *)uint64_t v22 = 136315138;
      id v33 = [v19 error];
      sub_100003028(&qword_100010330);
      uint64_t v23 = sub_10000A190();
      id v33 = (id)sub_10000926C(v23, v24, &v34);
      sub_10000A220();

      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v20, v21, "TranscriptAttachment: failed to fully publish events: %s", v22, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v11, v4);
  }
  else if (v14)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, a2, v4);
    id v25 = a1;
    v26 = sub_10000A0C0();
    os_log_type_t v27 = sub_10000A200();
    if (os_log_type_enabled(v26, v27))
    {
      uint64_t v28 = (uint8_t *)swift_slowAlloc();
      uint64_t v34 = swift_slowAlloc();
      *(_DWORD *)uint64_t v28 = 136315138;
      uint64_t v32 = (uint64_t)(v28 + 4);
      id v33 = [v25 state];
      type metadata accessor for BPSCompletionState();
      uint64_t v29 = sub_10000A190();
      id v33 = (id)sub_10000926C(v29, v30, &v34);
      sub_10000A220();

      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v26, v27, "TranscriptAttachment: unknown completion state: %s", v28, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v13, a2, v4);
    id v15 = sub_10000A0C0();
    os_log_type_t v16 = sub_10000A210();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, v16, "TranscriptAttachment: finished publishing events successfully", v17, 2u);
      swift_slowDealloc();
    }

    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v13, v4);
  }
}

uint64_t sub_100004CF0(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = sub_10000A0E0();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  if ((*(unsigned char *)(a2 + 16) & 1) == 0) {
    sub_100003780();
  }
  v32[0] = v7;
  swift_beginAccess();
  *(unsigned char *)(a2 + 16) = 0;
  id v11 = [a1 jsonDictionary];
  uint64_t v12 = sub_10000A120();

  v32[1] = v12;
  id v13 = sub_10000518C();
  id v23 = v13;
  if (v13)
  {
    strcpy((char *)v33, "eventPayload");
    BYTE5(v33[1]) = 0;
    HIWORD(v33[1]) = -5120;
    sub_10000A280();
    v33[3] = sub_100003028(&qword_100010308);
    v33[0] = v23;
    sub_100005510((uint64_t)v33, (uint64_t)v34);
  }
  unint64_t v24 = self;
  Class isa = sub_10000A110().super.isa;
  swift_bridgeObjectRelease();
  v34[0] = 0;
  id v26 = [v24 dataWithJSONObject:isa options:3 error:v34];

  id v27 = v34[0];
  if (v26)
  {
    uint64_t v28 = sub_100009F80();
    unint64_t v30 = v29;

    sub_100005580(v28, v30);
    return sub_1000032F0(v28, v30);
  }
  else
  {
    uint64_t v31 = v27;
    sub_100009F10();

    swift_willThrow();
    uint64_t v14 = v32[0];
    (*(void (**)(char *, uint64_t, void))(v8 + 16))(v10, a4, v32[0]);
    swift_errorRetain();
    swift_errorRetain();
    id v15 = sub_10000A0C0();
    os_log_type_t v16 = sub_10000A200();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v17 = (uint8_t *)swift_slowAlloc();
      v32[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v17 = 138412290;
      swift_errorRetain();
      uint64_t v18 = v10;
      uint64_t v19 = v8;
      uint64_t v20 = v14;
      os_log_type_t v21 = (void *)_swift_stdlib_bridgeErrorToNSError();
      v34[0] = v21;
      sub_10000A220();
      *(void *)v32[0] = v21;
      uint64_t v14 = v20;
      uint64_t v8 = v19;
      uint64_t v10 = v18;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v15, v16, "TranscriptAttachment: error during event processing: %@", v17, 0xCu);
      sub_100003028(&qword_100010300);
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
    return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v14);
  }
}

id sub_10000518C()
{
  sub_10000A010();
  sub_1000066A4();
  __chkstk_darwin(v2);
  sub_100006724();
  uint64_t v3 = sub_10000A030();
  __chkstk_darwin(v3 - 8);
  sub_10000675C();
  uint64_t v4 = sub_10000A100();
  sub_1000066A4();
  uint64_t v6 = v5;
  __chkstk_darwin(v7);
  sub_100003380();
  uint64_t v10 = v9 - v8;
  id result = [v0 eventBody];
  if (result)
  {
    uint64_t v12 = sub_100006490(result);
    if (v13 >> 60 == 15)
    {
      return 0;
    }
    else
    {
      uint64_t v24 = v6;
      uint64_t v28 = 0;
      long long v26 = 0u;
      long long v27 = 0u;
      sub_100005E90(v12, v13);
      sub_10000A020();
      sub_100006500(&qword_100010320, (void (*)(uint64_t))&type metadata accessor for TranscriptProtoEvent);
      sub_10000A050();
      if (v1)
      {
        return (id)sub_100006784();
      }
      else
      {
        sub_10000A0F0();
        sub_10000A000();
        uint64_t v14 = sub_10000A040();
        unint64_t v16 = v15;
        sub_100006740();
        v17();
        uint64_t v18 = self;
        Class isa = sub_100009F70().super.isa;
        id v25 = 0;
        id v20 = [v18 JSONObjectWithData:isa options:0 error:&v25];

        id v21 = v25;
        if (v20)
        {
          sub_10000A240();
          sub_1000032F0(v14, v16);
          swift_unknownObjectRelease();
          sub_100006784();
          sub_100006740();
          v22();
          sub_100003028(&qword_100010328);
          swift_dynamicCast();
          return v25;
        }
        else
        {
          id v23 = v21;
          sub_100009F10();

          swift_willThrow();
          sub_1000032F0(v14, v16);
          sub_100006784();
          return (id)(*(uint64_t (**)(uint64_t, uint64_t))(v24 + 8))(v10, v4);
        }
      }
    }
  }
  return result;
}

uint64_t sub_100005510(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 24))
  {
    sub_1000063D4((_OWORD *)a1, v4);
    sub_100005A94(v4, a2);
    return sub_100006380(a2);
  }
  else
  {
    sub_100006320(a1);
    sub_100005964(a2, v4);
    sub_100006380(a2);
    return sub_100006320((uint64_t)v4);
  }
}

uint64_t sub_100005580(uint64_t a1, unint64_t a2)
{
  switch(a2 >> 62)
  {
    case 1uLL:
      if (a1 >> 32 < (int)a1)
      {
        __break(1u);
        JUMPOUT(0x1000056ECLL);
      }
      id v6 = v2;
      sub_100005E90(a1, a2);
      uint64_t result = sub_1000067C4((int)a1, a1 >> 32, a2 & 0x3FFFFFFFFFFFFFFFLL);
      break;
    case 2uLL:
      uint64_t v7 = *(void *)(a1 + 16);
      uint64_t v8 = *(void *)(a1 + 24);
      id v9 = v2;
      sub_100005E90(a1, a2);
      swift_retain();
      swift_retain();
      sub_1000067C4(v7, v8, a2 & 0x3FFFFFFFFFFFFFFFLL);
      swift_release();
      uint64_t result = swift_release();
      break;
    case 3uLL:
      uint64_t result = sub_100005EE8(0, 0, 0, v2, a1, a2);
      break;
    default:
      uint64_t result = sub_100005EE8(a1, a2 & 0xFFFFFFFFFFFFLL, BYTE6(a2), v2, a1, a2);
      break;
  }
  return result;
}

uint64_t sub_1000056FC(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_1000032F0(a1, a2);
  }
  return a1;
}

void sub_100005710(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

id sub_100005778(uint64_t a1, int a2, id a3, uint64_t a4, unint64_t a5, uint64_t *a6)
{
  if (a1)
  {
    switch(a5 >> 62)
    {
      case 1uLL:
        if (__OFSUB__(HIDWORD(a4), a4))
        {
          __break(1u);
LABEL_17:
          __break(1u);
LABEL_18:
          __break(1u);
          JUMPOUT(0x1000058ACLL);
        }
        unint64_t v8 = HIDWORD(a4) - (int)a4;
LABEL_7:
        id result = [a3 write:a1 maxLength:v8];
LABEL_10:
        if (result == (id)v8) {
          return result;
        }
LABEL_13:
        char v9 = 2;
        break;
      case 2uLL:
        uint64_t v12 = *(void *)(a4 + 16);
        uint64_t v11 = *(void *)(a4 + 24);
        if (__OFSUB__(v11, v12)) {
          goto LABEL_17;
        }
        id result = [a3 write:a1 maxLength:v11 - v12];
        uint64_t v14 = *(void *)(a4 + 16);
        uint64_t v13 = *(void *)(a4 + 24);
        unint64_t v8 = v13 - v14;
        if (!__OFSUB__(v13, v14)) {
          goto LABEL_10;
        }
        goto LABEL_18;
      case 3uLL:
        id result = [a3 write:a1 maxLength:0];
        if (result) {
          goto LABEL_13;
        }
        return result;
      default:
        unint64_t v8 = BYTE6(a5);
        goto LABEL_7;
    }
  }
  else
  {
    char v9 = 0;
  }
  sub_1000038A4();
  uint64_t v15 = swift_allocError();
  *unint64_t v16 = v9;
  id result = (id)swift_willThrow();
  *a6 = v15;
  return result;
}

uint64_t sub_1000058BC(uint64_t a1, int a2, id a3, uint64_t a4, unint64_t a5)
{
  if (a1)
  {
    sub_100005778(a1, a2 - a1, a3, a4, a5, &v10);
  }
  else
  {
    sub_1000038A4();
    swift_allocError();
    *unint64_t v8 = 0;
    swift_willThrow();
  }

  return sub_1000032F0(a4, a5);
}

double sub_100005964@<D0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_100005B14(a1);
  LOBYTE(a1) = v7;
  swift_bridgeObjectRelease();
  if (a1)
  {
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v12 = *v3;
    uint64_t v9 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    Swift::Int v10 = *(void *)(v9 + 24);
    sub_100003028(&qword_100010318);
    sub_10000A2C0(isUniquelyReferenced_nonNull_native, v10);
    sub_100006380(*(void *)(v12 + 48) + 40 * v6);
    sub_1000063D4((_OWORD *)(*(void *)(v12 + 56) + 32 * v6), a2);
    sub_10000A2D0();
    *uint64_t v3 = v12;
    swift_bridgeObjectRelease();
  }
  else
  {
    double result = 0.0;
    *a2 = 0u;
    a2[1] = 0u;
  }
  return result;
}

uint64_t sub_100005A94(_OWORD *a1, uint64_t a2)
{
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v7 = *v2;
  *uint64_t v2 = 0x8000000000000000;
  sub_100005B58(a1, a2, isUniquelyReferenced_nonNull_native);
  *uint64_t v2 = v7;

  return swift_bridgeObjectRelease();
}

unint64_t sub_100005B14(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = sub_10000A260(*(void *)(v2 + 40));

  return sub_100005D0C(a1, v4);
}

_OWORD *sub_100005B58(_OWORD *a1, uint64_t a2, char a3)
{
  Swift::Int v4 = (void **)v3;
  unint64_t v8 = (void *)*v3;
  unint64_t v9 = sub_100005B14(a2);
  uint64_t v11 = v8[2];
  BOOL v12 = (v10 & 1) == 0;
  Swift::Int v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
    goto LABEL_11;
  }
  unint64_t v14 = v9;
  char v15 = v10;
  sub_100003028(&qword_100010318);
  if (!sub_10000A2C0(a3 & 1, v13)) {
    goto LABEL_5;
  }
  unint64_t v16 = sub_100005B14(a2);
  if ((v15 & 1) != (v17 & 1))
  {
LABEL_11:
    double result = (_OWORD *)sub_10000A320();
    __break(1u);
    return result;
  }
  unint64_t v14 = v16;
LABEL_5:
  uint64_t v18 = *v4;
  if (v15)
  {
    uint64_t v19 = (_OWORD *)(v18[7] + 32 * v14);
    sub_100006440((uint64_t)v19);
    return sub_1000063D4(a1, v19);
  }
  else
  {
    sub_1000063E4(a2, (uint64_t)v21);
    return sub_100005C90(v14, (uint64_t)v21, a1, v18);
  }
}

_OWORD *sub_100005C90(unint64_t a1, uint64_t a2, _OWORD *a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v5 = a4[6] + 40 * a1;
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)uint64_t v5 = *(_OWORD *)a2;
  *(_OWORD *)(v5 + 16) = v6;
  *(void *)(v5 + 32) = *(void *)(a2 + 32);
  double result = sub_1000063D4(a3, (_OWORD *)(a4[7] + 32 * a1));
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

unint64_t sub_100005D0C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_1000063E4(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = sub_10000A270();
      sub_100006380((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_100005DD4(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, unint64_t a6)
{
  uint64_t result = sub_100009EE0();
  uint64_t v12 = result;
  if (result)
  {
    uint64_t result = sub_100009F00();
    if (__OFSUB__(a1, result))
    {
LABEL_13:
      __break(1u);
      return result;
    }
    v12 += a1 - result;
  }
  BOOL v13 = __OFSUB__(a2, a1);
  uint64_t v14 = a2 - a1;
  if (v13)
  {
    __break(1u);
    goto LABEL_13;
  }
  uint64_t v15 = sub_100009EF0();
  if (v15 >= v14) {
    int v16 = v14;
  }
  else {
    int v16 = v15;
  }
  int v17 = v12 + v16;
  if (v12) {
    int v18 = v17;
  }
  else {
    int v18 = 0;
  }
  return sub_1000058BC(v12, v18, a4, a5, a6);
}

uint64_t sub_100005E90(uint64_t a1, unint64_t a2)
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

uint64_t sub_100005EE8(uint64_t a1, uint64_t a2, int a3, id a4, uint64_t a5, unint64_t a6)
{
  uint64_t v11 = a1;
  __int16 v12 = a2;
  char v13 = BYTE2(a2);
  char v14 = BYTE3(a2);
  char v15 = BYTE4(a2);
  char v16 = BYTE5(a2);
  sub_100005778((uint64_t)&v11, a3, a4, a5, a6, &v10);

  return sub_1000032F0(a5, a6);
}

unint64_t sub_100005FF4()
{
  unint64_t result = qword_1000102F0;
  if (!qword_1000102F0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1000102F0);
  }
  return result;
}

uint64_t sub_100006034()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_100006044(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for TranscriptAttachment();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000060A8()
{
  uint64_t v1 = type metadata accessor for TranscriptAttachment();
  sub_1000066C0(v1);
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v6 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v7 = ((v6 + 16) & ~v6) + *(void *)(v5 + 64);
  uint64_t v8 = v6 | 7;
  sub_10000A0E0();
  sub_1000067FC();
  sub_100006740();
  v9();

  return _swift_deallocObject(v0, v7, v8);
}

uint64_t sub_10000614C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for TranscriptAttachment();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000061B0(void *a1)
{
  uint64_t v3 = type metadata accessor for TranscriptAttachment();
  sub_100006710(v3);
  uint64_t v5 = v1 + ((*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));

  return sub_100004850(a1, v5);
}

uint64_t sub_100006200(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100006210()
{
  return swift_release();
}

uint64_t sub_100006218()
{
  uint64_t v1 = type metadata accessor for TranscriptAttachment();
  sub_1000066C0(v1);
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v6 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v7 = ((v6 + 32) & ~v6) + *(void *)(v5 + 64);
  uint64_t v8 = v6 | 7;
  swift_release();

  sub_10000A0E0();
  sub_1000067FC();
  sub_100006740();
  v9();

  return _swift_deallocObject(v0, v7, v8);
}

uint64_t sub_1000062CC(void *a1)
{
  uint64_t v3 = type metadata accessor for TranscriptAttachment();
  sub_100006710(v3);
  uint64_t v5 = *(void *)(v1 + 16);
  uint64_t v6 = *(void *)(v1 + 24);
  uint64_t v7 = v1 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));

  return sub_100004CF0(a1, v5, v6, v7);
}

uint64_t sub_100006320(uint64_t a1)
{
  uint64_t v2 = sub_100003028(&qword_100010310);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100006380(uint64_t a1)
{
  return a1;
}

_OWORD *sub_1000063D4(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_1000063E4(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_100006440(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100006490(void *a1)
{
  id v2 = [a1 eventPayload];

  if (!v2) {
    return 0;
  }
  uint64_t v3 = sub_100009F80();

  return v3;
}

uint64_t sub_100006500(unint64_t *a1, void (*a2)(uint64_t))
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

unsigned char *storeEnumTagSinglePayload for TranscriptAttachment.TranscriptAttachmentError(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x100006614);
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

ValueMetadata *type metadata accessor for TranscriptAttachment.TranscriptAttachmentError()
{
  return &type metadata for TranscriptAttachment.TranscriptAttachmentError;
}

unint64_t sub_100006650()
{
  unint64_t result = qword_100010338;
  if (!qword_100010338)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010338);
  }
  return result;
}

uint64_t sub_1000066C0(uint64_t a1)
{
  return a1 - 8;
}

uint64_t sub_100006710(uint64_t a1)
{
  return a1 - 8;
}

uint64_t sub_100006724()
{
  return 0;
}

uint64_t sub_100006784()
{
  return sub_1000056FC(v1, v0);
}

uint64_t sub_1000067B0(uint64_t a1)
{
  *(void *)(v1 - 144) = a1;
  return v1 - 144;
}

uint64_t sub_1000067C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100005DD4(a1, a2, a3, v4, v3, v5);
}

uint64_t sub_1000067E4()
{
  return swift_slowDealloc();
}

NSObject *sub_100006810(uint64_t a1, void *a2)
{
  uint64_t v4 = sub_100003028(&qword_1000102E8);
  __chkstk_darwin(v4 - 8);
  v96 = (char *)&v83 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100003028(&qword_100010200);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v83 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_10000A0E0();
  uint64_t v99 = *(void *)(v9 - 8);
  uint64_t v100 = v9;
  uint64_t v10 = __chkstk_darwin(v9);
  __int16 v12 = (char *)&v83 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __chkstk_darwin(v10);
  char v15 = (char *)&v83 - v14;
  uint64_t v16 = __chkstk_darwin(v13);
  int v18 = ((char *)&v83 - v17);
  __chkstk_darwin(v16);
  uint64_t v97 = (char *)&v83 - v19;
  uint64_t v104 = sub_100009F60();
  uint64_t v102 = *(void *)(v104 - 8);
  uint64_t v20 = __chkstk_darwin(v104);
  uint64_t v22 = (char *)&v83 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = __chkstk_darwin(v20);
  id v25 = (char *)&v83 - v24;
  uint64_t v26 = __chkstk_darwin(v23);
  uint64_t v98 = (char *)&v83 - v27;
  __chkstk_darwin(v26);
  v103 = (char *)&v83 - v28;
  unint64_t v29 = v101;
  sub_100008160(a1, a2, (uint64_t)&v83 - v28);
  if (v29) {
    return v18;
  }
  uint64_t v90 = a1;
  id v91 = v25;
  uint64_t v93 = (uint64_t)a2;
  v94 = 0;
  uint64_t v88 = v18;
  v89 = v8;
  uint64_t v86 = v22;
  uint64_t v87 = v15;
  uint64_t v95 = v12;
  v92 = "Swift/UnsafeBufferPointer.swift";
  unint64_t v30 = v97;
  sub_10000A0D0();
  uint64_t v31 = v102 + 16;
  v101 = *(void (**)(void, void, void))(v102 + 16);
  v101(v98, v103, v104);
  uint64_t v32 = sub_10000A0C0();
  os_log_type_t v33 = sub_10000A210();
  if (os_log_type_enabled(v32, v33))
  {
    uint64_t v34 = swift_slowAlloc();
    uint64_t v85 = v31;
    uint64_t v35 = v34;
    uint64_t v84 = swift_slowAlloc();
    uint64_t v106 = v84;
    *(_DWORD *)uint64_t v35 = 136315394;
    id v105 = &type metadata for ElementHierarchyAttachment;
    sub_100003028(&qword_100010398);
    uint64_t v36 = v104;
    uint64_t v37 = sub_10000A190();
    id v105 = (ValueMetadata *)sub_10000926C(v37, v38, &v106);
    sub_10000A220();
    swift_bridgeObjectRelease();
    *(_WORD *)(v35 + 12) = 2080;
    sub_100009BB0();
    v39 = v98;
    uint64_t v40 = sub_10000A310();
    id v105 = (ValueMetadata *)sub_10000926C(v40, v41, &v106);
    sub_10000A220();
    swift_bridgeObjectRelease();
    uint64_t v98 = *(char **)(v102 + 8);
    ((void (*)(char *, uint64_t))v98)(v39, v36);
    _os_log_impl((void *)&_mh_execute_header, v32, v33, "%s: file path: %s", (uint8_t *)v35, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    v42 = v98;
    uint64_t v98 = *(char **)(v102 + 8);
    ((void (*)(char *, uint64_t))v98)(v42, v104);
  }

  uint64_t v43 = *(void (**)(char *, uint64_t))(v99 + 8);
  v43(v30, v100);
  uint64_t v44 = v93;
  uint64_t v45 = (uint64_t)v91;
  sub_100009C74(0, (unint64_t *)&qword_1000102F0);
  v101(v45, v103, v104);
  id v46 = sub_100008488(v45, 1);
  v47 = v95;
  uint64_t v48 = v90;
  if (!v46)
  {
    unint64_t v52 = v88;
    sub_10000A0D0();
    int v18 = sub_10000A0C0();
    os_log_type_t v53 = sub_10000A200();
    if (os_log_type_enabled(v18, v53))
    {
      os_log_t v54 = (uint8_t *)swift_slowAlloc();
      uint64_t v106 = swift_slowAlloc();
      *(_DWORD *)os_log_t v54 = 136315138;
      id v105 = &type metadata for ElementHierarchyAttachment;
      sub_100003028(&qword_100010398);
      uint64_t v55 = sub_10000A190();
      id v105 = (ValueMetadata *)sub_10000926C(v55, v56, &v106);
      sub_10000A220();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v18, v53, "%s: failed to open stream", v54, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    v43((char *)v52, v100);
    sub_100009B64();
    swift_allocError();
    unsigned char *v78 = 1;
    swift_willThrow();
    goto LABEL_19;
  }
  uint64_t v49 = v46;
  [v46 open];
  swift_bridgeObjectRetain();
  uint64_t v50 = (uint64_t)v89;
  sub_100002C3C(v48, v44);
  swift_bridgeObjectRelease();
  uint64_t v51 = sub_10000A0B0();
  if (sub_10000306C(v50, 1, v51) == 1)
  {
    sub_100009C00(v50, &qword_100010200);
  }
  else
  {
    sub_10000A0A0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v51 - 8) + 8))(v50, v51);
  }
  uint64_t v57 = v94;
  sub_100003780();
  if (v57)
  {
    swift_bridgeObjectRelease();
    sub_10000A0D0();
    swift_errorRetain();
    swift_errorRetain();
    int v18 = sub_10000A0C0();
    os_log_type_t v58 = sub_10000A200();
    if (os_log_type_enabled(v18, v58))
    {
      uint64_t v59 = swift_slowAlloc();
      uint64_t v106 = swift_slowAlloc();
      *(_DWORD *)uint64_t v59 = 136315394;
      id v105 = &type metadata for ElementHierarchyAttachment;
      sub_100003028(&qword_100010398);
      uint64_t v60 = sub_10000A190();
      uint64_t v97 = (char *)v43;
      id v105 = (ValueMetadata *)sub_10000926C(v60, v61, &v106);
      sub_10000A220();
      swift_bridgeObjectRelease();
      *(_WORD *)(v59 + 12) = 2080;
      id v105 = v57;
      swift_errorRetain();
      sub_100003028(&qword_100010390);
      uint64_t v62 = sub_10000A190();
      id v105 = (ValueMetadata *)sub_10000926C(v62, v63, &v106);
      sub_10000A220();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v18, v58, "%s: failed to fully publish events: %s", (uint8_t *)v59, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      ((void (*)(char *, uint64_t))v97)(v95, v100);
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();

      v43(v47, v100);
    }
    swift_willThrow();
    [v49 close];

LABEL_19:
    ((void (*)(char *, uint64_t))v98)(v103, v104);
    return v18;
  }
  v94 = 0;
  swift_bridgeObjectRelease();
  uint64_t v64 = v87;
  sub_10000A0D0();
  v65 = v86;
  v101(v86, v103, v104);
  uint64_t v66 = sub_10000A0C0();
  os_log_type_t v67 = sub_10000A210();
  int v68 = v67;
  if (os_log_type_enabled(v66, v67))
  {
    uint64_t v69 = swift_slowAlloc();
    LODWORD(v95) = v68;
    uint64_t v70 = v69;
    uint64_t v93 = swift_slowAlloc();
    uint64_t v106 = v93;
    *(_DWORD *)uint64_t v70 = 136315394;
    id v105 = &type metadata for ElementHierarchyAttachment;
    sub_100003028(&qword_100010398);
    uint64_t v71 = sub_10000A190();
    uint64_t v97 = (char *)v43;
    id v105 = (ValueMetadata *)sub_10000926C(v71, v72, &v106);
    sub_10000A220();
    swift_bridgeObjectRelease();
    *(_WORD *)(v70 + 12) = 2080;
    sub_100009BB0();
    v73 = v49;
    uint64_t v74 = v104;
    uint64_t v75 = sub_10000A310();
    id v105 = (ValueMetadata *)sub_10000926C(v75, v76, &v106);
    sub_10000A220();
    swift_bridgeObjectRelease();
    uint64_t v77 = v74;
    uint64_t v49 = v73;
    ((void (*)(char *, uint64_t))v98)(v65, v77);
    _os_log_impl((void *)&_mh_execute_header, v66, (os_log_type_t)v95, "%s: finished writing to: %s", (uint8_t *)v70, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    ((void (*)(char *, uint64_t))v97)(v87, v100);
  }
  else
  {
    ((void (*)(char *, uint64_t))v98)(v65, v104);

    v43(v64, v100);
  }
  uint64_t v80 = (uint64_t)v96;
  uint64_t v81 = v104;
  v101(v96, v103, v104);
  sub_100003348(v80, 0, 1, v81);
  id v82 = objc_allocWithZone((Class)DEAttachmentItem);
  unint64_t result = sub_100008FEC(v80);
  if (result)
  {
    int v18 = result;
    [v49 close];

    ((void (*)(char *, uint64_t))v98)(v103, v104);
    return v18;
  }
  __break(1u);
  return result;
}

NSObject *sub_100007534(uint64_t a1, void *a2)
{
  uint64_t v4 = sub_100003028(&qword_1000102E8);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = &v74[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v91 = sub_10000A0E0();
  uint64_t v89 = *(void *)(v91 - 8);
  uint64_t v7 = __chkstk_darwin(v91);
  uint64_t v9 = &v74[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v10 = __chkstk_darwin(v7);
  __int16 v12 = &v74[-v11];
  uint64_t v13 = __chkstk_darwin(v10);
  char v15 = &v74[-v14];
  __chkstk_darwin(v13);
  uint64_t v90 = (void (*)(NSObject *, uint64_t))&v74[-v16];
  uint64_t v95 = sub_100009F60();
  uint64_t v93 = *(void *)(v95 - 8);
  uint64_t v17 = __chkstk_darwin(v95);
  uint64_t v19 = &v74[-((v18 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v20 = __chkstk_darwin(v17);
  uint64_t v22 = &v74[-v21];
  uint64_t v23 = __chkstk_darwin(v20);
  uint64_t v88 = &v74[-v24];
  __chkstk_darwin(v23);
  v94 = &v74[-v25];
  uint64_t v26 = v92;
  sub_100008160(a1, a2, (uint64_t)&v74[-v25]);
  if (v26) {
    return v15;
  }
  id v82 = a2;
  uint64_t v83 = v22;
  uint64_t v85 = a1;
  uint64_t v86 = v9;
  uint64_t v79 = v6;
  uint64_t v80 = v15;
  uint64_t v77 = v19;
  v78 = v12;
  uint64_t v81 = 0;
  uint64_t v84 = "Swift/UnsafeBufferPointer.swift";
  sub_10000A0D0();
  uint64_t v27 = v93 + 16;
  uint64_t v28 = v88;
  uint64_t v87 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(v93 + 16);
  v87(v88, v94, v95);
  unint64_t v29 = sub_10000A0C0();
  os_log_type_t v30 = sub_10000A210();
  int v31 = v30;
  if (os_log_type_enabled(v29, v30))
  {
    uint64_t v32 = swift_slowAlloc();
    int v75 = v31;
    uint64_t v33 = v32;
    uint64_t v97 = (unsigned char *)swift_slowAlloc();
    *(_DWORD *)uint64_t v33 = 136315394;
    v96 = &type metadata for UIElementsAttachment;
    sub_100003028(&qword_100010388);
    uint64_t v76 = v27;
    uint64_t v34 = sub_10000A190();
    uint64_t v35 = v95;
    v96 = (ValueMetadata *)sub_10000926C(v34, v36, (uint64_t *)&v97);
    sub_10000A220();
    swift_bridgeObjectRelease();
    *(_WORD *)(v33 + 12) = 2080;
    sub_100009BB0();
    uint64_t v37 = sub_10000A310();
    v96 = (ValueMetadata *)sub_10000926C(v37, v38, (uint64_t *)&v97);
    uint64_t v27 = v76;
    sub_10000A220();
    swift_bridgeObjectRelease();
    v92 = *(void (**)(void, void))(v93 + 8);
    v92(v28, v35);
    _os_log_impl((void *)&_mh_execute_header, v29, (os_log_type_t)v75, "%s: file path: %s", (uint8_t *)v33, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    v92 = *(void (**)(void, void))(v93 + 8);
    v92(v28, v95);
  }

  v39 = *(unsigned char **)(v89 + 8);
  ((void (*)(void, uint64_t))v39)(v90, v91);
  uint64_t v40 = v86;
  sub_100009C74(0, (unint64_t *)&qword_1000102F0);
  uint64_t v41 = (uint64_t)v83;
  v42 = v87;
  v87(v83, v94, v95);
  id v43 = sub_100008488(v41, 1);
  if (!v43)
  {
    unint64_t v52 = v80;
    sub_10000A0D0();
    char v15 = sub_10000A0C0();
    os_log_type_t v53 = sub_10000A200();
    if (os_log_type_enabled(v15, v53))
    {
      os_log_t v54 = (uint8_t *)swift_slowAlloc();
      uint64_t v55 = swift_slowAlloc();
      uint64_t v90 = (void (*)(NSObject *, uint64_t))v39;
      uint64_t v97 = (unsigned char *)v55;
      *(_DWORD *)os_log_t v54 = 136315138;
      v96 = &type metadata for UIElementsAttachment;
      sub_100003028(&qword_100010388);
      uint64_t v56 = sub_10000A190();
      v96 = (ValueMetadata *)sub_10000926C(v56, v57, (uint64_t *)&v97);
      sub_10000A220();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v15, v53, "%s: failed to open stream", v54, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      v90(v52, v91);
    }
    else
    {

      ((void (*)(NSObject *, uint64_t))v39)(v52, v91);
    }
    sub_100009B64();
    swift_allocError();
    *os_log_type_t v58 = 1;
    swift_willThrow();
    goto LABEL_16;
  }
  uint64_t v44 = v43;
  uint64_t v90 = (void (*)(NSObject *, uint64_t))v39;
  [v43 open];
  uint64_t v45 = v81;
  sub_100002CDC();
  if (v45)
  {
    sub_10000A0D0();
    swift_errorRetain();
    swift_errorRetain();
    char v15 = sub_10000A0C0();
    os_log_type_t v46 = sub_10000A200();
    if (os_log_type_enabled(v15, v46))
    {
      uint64_t v47 = swift_slowAlloc();
      uint64_t v88 = (unsigned char *)swift_slowAlloc();
      uint64_t v97 = v88;
      *(_DWORD *)uint64_t v47 = 136315394;
      v96 = &type metadata for UIElementsAttachment;
      sub_100003028(&qword_100010388);
      uint64_t v48 = sub_10000A190();
      v96 = (ValueMetadata *)sub_10000926C(v48, v49, (uint64_t *)&v97);
      sub_10000A220();
      swift_bridgeObjectRelease();
      *(_WORD *)(v47 + 12) = 2080;
      v96 = v45;
      swift_errorRetain();
      sub_100003028(&qword_100010390);
      uint64_t v50 = sub_10000A190();
      v96 = (ValueMetadata *)sub_10000926C(v50, v51, (uint64_t *)&v97);
      sub_10000A220();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v15, v46, "%s: failed to fully publish events: %s", (uint8_t *)v47, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
    }

    v90(v40, v91);
    swift_willThrow();
    [v44 close];

LABEL_16:
    v92(v94, v95);
    return v15;
  }
  sub_100003780();
  uint64_t v81 = 0;
  swift_bridgeObjectRelease();
  uint64_t v60 = v78;
  sub_10000A0D0();
  unint64_t v61 = v77;
  v42(v77, v94, v95);
  uint64_t v62 = sub_10000A0C0();
  os_log_type_t v63 = sub_10000A210();
  int v64 = v63;
  if (os_log_type_enabled(v62, v63))
  {
    uint64_t v65 = swift_slowAlloc();
    uint64_t v97 = (unsigned char *)swift_slowAlloc();
    *(_DWORD *)uint64_t v65 = 136315394;
    LODWORD(v86) = v64;
    v96 = &type metadata for UIElementsAttachment;
    sub_100003028(&qword_100010388);
    uint64_t v76 = v27;
    uint64_t v66 = sub_10000A190();
    uint64_t v67 = v95;
    uint64_t v88 = v44;
    v96 = (ValueMetadata *)sub_10000926C(v66, v68, (uint64_t *)&v97);
    sub_10000A220();
    swift_bridgeObjectRelease();
    *(_WORD *)(v65 + 12) = 2080;
    sub_100009BB0();
    uint64_t v69 = sub_10000A310();
    v96 = (ValueMetadata *)sub_10000926C(v69, v70, (uint64_t *)&v97);
    uint64_t v44 = v88;
    sub_10000A220();
    swift_bridgeObjectRelease();
    v92(v61, v67);
    _os_log_impl((void *)&_mh_execute_header, v62, (os_log_type_t)v86, "%s: finished writing to: %s", (uint8_t *)v65, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    v42 = v87;
    swift_slowDealloc();
  }
  else
  {
    v92(v61, v95);
  }

  v90(v60, v91);
  uint64_t v71 = (uint64_t)v79;
  uint64_t v72 = v95;
  v42(v79, v94, v95);
  sub_100003348(v71, 0, 1, v72);
  id v73 = objc_allocWithZone((Class)DEAttachmentItem);
  unint64_t result = sub_100008FEC(v71);
  if (result)
  {
    char v15 = result;
    [v44 close];

    v92(v94, v95);
    return v15;
  }
  __break(1u);
  return result;
}

uint64_t sub_100008160@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v34 = a2;
  v33[1] = a3;
  v33[2] = a1;
  uint64_t v36 = sub_100009FF0();
  sub_1000066A4();
  uint64_t v4 = v3;
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100009F60();
  sub_1000066A4();
  uint64_t v10 = v9;
  uint64_t v12 = __chkstk_darwin(v11);
  uint64_t v35 = (char *)v33 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __chkstk_darwin(v12);
  uint64_t v16 = (char *)v33 - v15;
  __chkstk_darwin(v14);
  uint64_t v18 = (char *)v33 - v17;
  uint64_t v19 = self;
  id v20 = [v19 defaultManager];
  id v21 = [v20 temporaryDirectory];

  sub_100009F50();
  sub_100009E64();
  sub_100009F40();
  uint64_t v22 = *(void (**)(uint64_t))(v10 + 8);
  uint64_t v37 = v8;
  uint64_t v23 = v8;
  uint64_t v24 = v22;
  ((void (*)(char *, uint64_t))v22)(v16, v23);
  sub_100009FE0();
  sub_100009FD0();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v36);
  sub_100009F40();
  swift_bridgeObjectRelease();
  id v25 = [v19 defaultManager];
  sub_100009F20(v26);
  uint64_t v28 = v27;
  id v38 = 0;
  LOBYTE(v20) = [v25 createDirectoryAtURL:v27 withIntermediateDirectories:1 attributes:0 error:&v38];

  if (v20)
  {
    id v29 = v38;
    id v30 = v34;
    swift_bridgeObjectRetain();
    sub_100009F30();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v30 = v38;
    sub_100009F10();

    swift_willThrow();
  }
  uint64_t v31 = sub_100009DDC();
  v24(v31);
  return ((uint64_t (*)(char *, id))v24)(v18, v30);
}

id sub_100008488(uint64_t a1, char a2)
{
  id v4 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  sub_100009F20(v5);
  uint64_t v7 = v6;
  id v8 = [v4 initWithURL:v6 append:a2 & 1];

  sub_100009F60();
  sub_100009DF4();
  (*(void (**)(uint64_t))(v9 + 8))(a1);
  return v8;
}

Swift::OpaquePointer_optional __swiftcall Diagnostics.attachments(forParameters:)(Swift::OpaquePointer_optional forParameters)
{
  rawValue = forParameters.value._rawValue;
  uint64_t v3 = type metadata accessor for TranscriptAttachment();
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v35 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = v1 + OBJC_IVAR____TtC27IntelligenceFlowDiagnostics11Diagnostics_logger;
  swift_bridgeObjectRetain_n();
  uint64_t v7 = sub_10000A0C0();
  os_log_type_t v8 = sub_10000A210();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v36 = v5;
    uint64_t v37 = v6;
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = (void *)swift_slowAlloc();
    v40[0] = (uint64_t)v10;
    *(_DWORD *)uint64_t v9 = 136315138;
    if (rawValue)
    {
      swift_bridgeObjectRetain();
      uint64_t v12 = sub_10000A130();
      unint64_t v14 = v13;
      swift_bridgeObjectRelease();
      *(void *)&long long v41 = sub_10000926C(v12, v14, v40);
      sub_10000A220();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "IntelligenceFlowDiagnostics: gathering attachments with parameters: %s", v9, 0xCu);
      swift_arrayDestroy();
      sub_1000067E4();
      sub_1000067E4();

      unint64_t v43 = (unint64_t)&_swiftEmptyArrayStorage;
      uint64_t v5 = v36;
      goto LABEL_5;
    }
    __break(1u);
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  swift_bridgeObjectRelease_n();

  unint64_t v43 = (unint64_t)&_swiftEmptyArrayStorage;
  if (!rawValue) {
    goto LABEL_24;
  }
LABEL_5:
  unint64_t v38 = 0xD00000000000002DLL;
  unint64_t v39 = 0x800000010000A880;
  sub_10000A280();
  sub_100008BB8((uint64_t)v40, (uint64_t)rawValue, &v41);
  sub_100006380((uint64_t)v40);
  if (!v42)
  {
    sub_100009C00((uint64_t)&v41, &qword_100010310);
LABEL_10:
    uint64_t v15 = sub_10000A0C0();
    os_log_type_t v16 = sub_10000A210();
    if (os_log_type_enabled(v15, v16))
    {
      *(_WORD *)swift_slowAlloc() = 0;
      sub_100009E24((void *)&_mh_execute_header, v17, v18, "IntelligenceFlowDiagnostics: user did not give consent.");
      sub_1000067E4();
    }

    uint64_t v19 = &_swiftEmptyArrayStorage;
    goto LABEL_13;
  }
  if (!swift_dynamicCast() || (v38 & 1) == 0) {
    goto LABEL_10;
  }
  sub_100009E64();
  sub_10000A0D0();
  sub_1000038F0();
  sub_100009210((uint64_t)v5);
  sub_10000A1B0();
  unint64_t v22 = *(void *)((v43 & 0xFFFFFFFFFFFFFF8) + 0x10);
  unint64_t v21 = *(void *)((v43 & 0xFFFFFFFFFFFFFF8) + 0x18);
  if (v22 >= v21 >> 1) {
    sub_100009DC0(v22 + 1, v21);
  }
  sub_10000A1F0();
  sub_10000A1D0();
  sub_100009E64();
  sub_100006810(v23, v24);
  sub_10000A1B0();
  unint64_t v26 = *(void *)((v43 & 0xFFFFFFFFFFFFFF8) + 0x10);
  unint64_t v25 = *(void *)((v43 & 0xFFFFFFFFFFFFFF8) + 0x18);
  if (v26 >= v25 >> 1) {
    sub_100009DC0(v26 + 1, v25);
  }
  sub_10000A1F0();
  sub_10000A1D0();
  sub_100009E64();
  sub_100007534(v27, v28);
  sub_10000A1B0();
  unint64_t v30 = *(void *)((v43 & 0xFFFFFFFFFFFFFF8) + 0x10);
  unint64_t v29 = *(void *)((v43 & 0xFFFFFFFFFFFFFF8) + 0x18);
  if (v30 >= v29 >> 1) {
    sub_100009DC0(v30 + 1, v29);
  }
  sub_10000A1F0();
  sub_10000A1D0();
  uint64_t v31 = sub_10000A0C0();
  os_log_type_t v32 = sub_10000A210();
  if (os_log_type_enabled(v31, v32))
  {
    *(_WORD *)swift_slowAlloc() = 0;
    sub_100009E24((void *)&_mh_execute_header, v33, v34, "IntelligenceFlowDiagnostics: done");
    sub_1000067E4();
  }

  uint64_t v19 = (void *)v43;
LABEL_13:
  id v20 = sub_100008C1C((unint64_t)v19);
  swift_bridgeObjectRelease();
  uint64_t v10 = v20;
LABEL_25:
  result.value._rawValue = v10;
  result.is_nil = v11;
  return result;
}

double sub_100008BB8@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  if (*(void *)(a2 + 16) && (unint64_t v5 = sub_100005B14(a1), (v6 & 1) != 0))
  {
    uint64_t v7 = *(void *)(a2 + 56) + 32 * v5;
    sub_100009B04(v7, (uint64_t)a3);
  }
  else
  {
    double result = 0.0;
    *a3 = 0u;
    a3[1] = 0u;
  }
  return result;
}

char *sub_100008C1C(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_10000A2F0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v3 = &_swiftEmptyArrayStorage;
  if (!v2) {
    return (char *)v3;
  }
  uint64_t v10 = &_swiftEmptyArrayStorage;
  double result = sub_100009C54(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    for (uint64_t i = 0; i != v2; ++i)
    {
      if ((a1 & 0xC000000000000001) != 0) {
        sub_10000A2A0();
      }
      else {
        id v6 = *(id *)(a1 + 8 * i + 32);
      }
      sub_100009C74(0, &qword_1000103A0);
      swift_dynamicCast();
      uint64_t v3 = v10;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_100009C54(0, v3[2] + 1, 1);
        uint64_t v3 = v10;
      }
      unint64_t v8 = v3[2];
      unint64_t v7 = v3[3];
      if (v8 >= v7 >> 1)
      {
        sub_100009C54((char *)(v7 > 1), v8 + 1, 1);
        uint64_t v3 = v10;
      }
      v3[2] = v8 + 1;
      sub_1000063D4(&v9, &v3[4 * v8 + 4]);
    }
    return (char *)v3;
  }
  __break(1u);
  return result;
}

id Diagnostics.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return [v1 init];
}

id Diagnostics.init()()
{
  ObjectType = (objc_class *)swift_getObjectType();
  sub_10000A0D0();
  v3.receiver = v0;
  v3.super_class = ObjectType;
  return objc_msgSendSuper2(&v3, "init");
}

id Diagnostics.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, "dealloc");
}

id sub_100008FEC(uint64_t a1)
{
  objc_super v2 = v1;
  uint64_t v4 = sub_100009F60();
  id v6 = 0;
  if (sub_10000306C(a1, 1, v4) != 1)
  {
    sub_100009F20(v5);
    id v6 = v7;
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  }
  id v8 = [v2 initWithPathURL:v6];

  return v8;
}

char *sub_100009098(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_10000A300();
    __break(1u);
  }
  else if (__dst != __src || &__src[32 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 32 * a2);
  }
  return __src;
}

uint64_t sub_10000912C(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0 || ((unint64_t v5 = a1, a3 + 32 * a2 > a1) ? (v6 = a1 + 32 * a2 > a3) : (v6 = 0), v6))
  {
    uint64_t v7 = sub_10000A300();
    __break(1u);
  }
  else
  {
    uint64_t v7 = a3;
  }
  return _swift_arrayInitWithCopy(v7, v5);
}

uint64_t sub_100009210(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for TranscriptAttachment();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000926C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100009340(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100009B04((uint64_t)v12, *a3);
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
      sub_100009B04((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100006440((uint64_t)v12);
  return v7;
}

uint64_t sub_100009340(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_100009498((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_10000A230();
      uint64_t result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    uint64_t result = (uint64_t)sub_100009570(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    uint64_t v8 = sub_10000A2B0();
    if (!v8)
    {
      uint64_t result = sub_10000A2E0();
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

void *sub_100009498(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_10000A300();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

void *sub_100009570(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_100009608(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_1000097E4(0, v2[2] + 1, 1, (uint64_t)v2);
  }
  unint64_t v4 = v2[2];
  unint64_t v3 = v2[3];
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_1000097E4((char *)(v3 > 1), v4 + 1, 1, (uint64_t)v2);
  }
  v2[2] = v4 + 1;
  *((unsigned char *)v2 + v4 + 32) = 0;
  return v2;
}

void *sub_100009608(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    Swift::Int v2 = sub_10000A1A0();
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
  unint64_t v3 = sub_10000977C(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    unint64_t v4 = v3;
    uint64_t v5 = sub_10000A290();
    if ((v6 & 1) != 0 || v5 != v2) {
      goto LABEL_14;
    }
    return v4;
  }
  sub_10000A300();
  __break(1u);
LABEL_14:
  uint64_t result = (void *)sub_10000A2E0();
  __break(1u);
  return result;
}

void *sub_10000977C(uint64_t a1, uint64_t a2)
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
  sub_100003028(&qword_100010378);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  _OWORD v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_1000097E4(char *result, int64_t a2, char a3, uint64_t a4)
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
    sub_100003028(&qword_100010378);
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
  unint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_100009994(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_1000098BC(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_1000098BC(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_10000A300();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

char *sub_100009994(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_10000A300();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

uint64_t sub_100009A24()
{
  return type metadata accessor for Diagnostics();
}

uint64_t type metadata accessor for Diagnostics()
{
  uint64_t result = qword_100010368;
  if (!qword_100010368) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100009A74()
{
  uint64_t result = sub_10000A0E0();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_100009B04(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_100009B64()
{
  unint64_t result = qword_100010380;
  if (!qword_100010380)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010380);
  }
  return result;
}

unint64_t sub_100009BB0()
{
  unint64_t result = qword_1000102F8;
  if (!qword_1000102F8)
  {
    sub_100009F60();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000102F8);
  }
  return result;
}

uint64_t sub_100009C00(uint64_t a1, uint64_t *a2)
{
  sub_100003028(a2);
  sub_100009DF4();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

char *sub_100009C54(char *a1, int64_t a2, char a3)
{
  unint64_t result = sub_100009CB0(a1, a2, a3, *v3);
  *uint64_t v3 = (uint64_t)result;
  return result;
}

uint64_t sub_100009C74(uint64_t a1, unint64_t *a2)
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

char *sub_100009CB0(char *result, int64_t a2, char a3, uint64_t a4)
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
    sub_100003028(&qword_1000103A8);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 32);
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  unint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_100009098(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_10000912C((unint64_t)v13, v8, (unint64_t)v12);
  }
  swift_release();
  return v10;
}

uint64_t sub_100009D94(uint64_t a1)
{
  *(void *)(v1 - 160) = a1;
  return sub_10000A220();
}

uint64_t sub_100009DC0@<X0>(uint64_t a1@<X1>, unint64_t a2@<X8>)
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(a2 > 1, a1, 1);
}

uint64_t sub_100009DDC()
{
  return v0;
}

void sub_100009E04(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v6, a4, v5, 0xCu);
}

void sub_100009E24(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

uint64_t sub_100009E44(float a1)
{
  *uint64_t v1 = a1;
  return swift_errorRetain();
}

uint64_t sub_100009E70()
{
  return static JSONEncoder.OutputFormatting.sortedKeys.getter();
}

uint64_t sub_100009E80()
{
  return static JSONEncoder.OutputFormatting.prettyPrinted.getter();
}

uint64_t sub_100009E90()
{
  return type metadata accessor for JSONEncoder.OutputFormatting();
}

uint64_t sub_100009EA0()
{
  return dispatch thunk of JSONEncoder.outputFormatting.setter();
}

uint64_t sub_100009EB0()
{
  return dispatch thunk of JSONEncoder.encode<A>(_:)();
}

uint64_t sub_100009EC0()
{
  return JSONEncoder.init()();
}

uint64_t sub_100009ED0()
{
  return type metadata accessor for JSONEncoder();
}

uint64_t sub_100009EE0()
{
  return __DataStorage._bytes.getter();
}

uint64_t sub_100009EF0()
{
  return __DataStorage._length.getter();
}

uint64_t sub_100009F00()
{
  return __DataStorage._offset.getter();
}

uint64_t sub_100009F10()
{
  return _convertNSErrorToError(_:)();
}

void sub_100009F20(NSURL *retstr@<X8>)
{
}

uint64_t sub_100009F30()
{
  return URL.appendingPathComponent(_:isDirectory:)();
}

uint64_t sub_100009F40()
{
  return URL.appendingPathComponent(_:)();
}

uint64_t sub_100009F50()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100009F60()
{
  return type metadata accessor for URL();
}

NSData sub_100009F70()
{
  return Data._bridgeToObjectiveC()();
}

uint64_t sub_100009F80()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100009F90()
{
  return Data.write(to:options:)();
}

NSDate sub_100009FA0()
{
  return Date._bridgeToObjectiveC()();
}

uint64_t sub_100009FB0()
{
  return Date.init(timeIntervalSinceNow:)();
}

uint64_t sub_100009FC0()
{
  return type metadata accessor for Date();
}

uint64_t sub_100009FD0()
{
  return UUID.uuidString.getter();
}

uint64_t sub_100009FE0()
{
  return UUID.init()();
}

uint64_t sub_100009FF0()
{
  return type metadata accessor for UUID();
}

uint64_t sub_10000A000()
{
  return JSONEncodingOptions.init()();
}

uint64_t sub_10000A010()
{
  return type metadata accessor for JSONEncodingOptions();
}

uint64_t sub_10000A020()
{
  return BinaryDecodingOptions.init()();
}

uint64_t sub_10000A030()
{
  return type metadata accessor for BinaryDecodingOptions();
}

uint64_t sub_10000A040()
{
  return Message.jsonUTF8Data(options:)();
}

uint64_t sub_10000A050()
{
  return Message.init(serializedData:extensions:partial:options:)();
}

uint64_t sub_10000A060()
{
  return ContextRetrieval.dumpUIContextFromCache()();
}

uint64_t sub_10000A070()
{
  return ContextRetrieval.init()();
}

uint64_t sub_10000A080()
{
  return type metadata accessor for ContextRetrieval();
}

uint64_t sub_10000A090()
{
  return UIContextCacheRepresentation.elements.getter();
}

uint64_t sub_10000A0A0()
{
  return UIContextCacheRepresentation.hierarchy.getter();
}

uint64_t sub_10000A0B0()
{
  return type metadata accessor for UIContextCacheRepresentation();
}

uint64_t sub_10000A0C0()
{
  return Logger.logObject.getter();
}

uint64_t sub_10000A0D0()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_10000A0E0()
{
  return type metadata accessor for Logger();
}

void sub_10000A0F0()
{
}

uint64_t sub_10000A100()
{
  return type metadata accessor for TranscriptProtoEvent();
}

NSDictionary sub_10000A110()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_10000A120()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10000A130()
{
  return Dictionary.description.getter();
}

NSString sub_10000A140()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_10000A150()
{
  return String.data(using:allowLossyConversion:)();
}

uint64_t sub_10000A160()
{
  return String.init(data:encoding:)();
}

uint64_t sub_10000A170()
{
  return static String.Encoding.utf8.getter();
}

uint64_t sub_10000A180()
{
  return type metadata accessor for String.Encoding();
}

uint64_t sub_10000A190()
{
  return String.init<A>(describing:)();
}

Swift::Int sub_10000A1A0()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_10000A1B0()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray sub_10000A1C0()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_10000A1D0()
{
  return specialized Array._endMutation()();
}

uint64_t sub_10000A1F0()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_10000A200()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_10000A210()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_10000A220()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_10000A230()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_10000A240()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t sub_10000A250()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

Swift::Int sub_10000A260(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t sub_10000A270()
{
  return static AnyHashable.== infix(_:_:)();
}

uint64_t sub_10000A280()
{
  return AnyHashable.init<A>(_:)();
}

uint64_t sub_10000A290()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_10000A2A0()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_10000A2B0()
{
  return _StringObject.sharedUTF8.getter();
}

BOOL sub_10000A2C0(Swift::Bool isUnique, Swift::Int capacity)
{
  return _NativeDictionary.ensureUnique(isUnique:capacity:)(isUnique, capacity);
}

uint64_t sub_10000A2D0()
{
  return _NativeDictionary._delete(at:)();
}

uint64_t sub_10000A2E0()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_10000A2F0()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_10000A300()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_10000A310()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_10000A320()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_10000A330()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_10000A340()
{
  return Error._code.getter();
}

uint64_t sub_10000A350()
{
  return Error._domain.getter();
}

uint64_t sub_10000A360()
{
  return Error._userInfo.getter();
}

uint64_t sub_10000A370()
{
  return Hasher.init(_seed:)();
}

void sub_10000A380(Swift::UInt a1)
{
}

Swift::Int sub_10000A390()
{
  return Hasher._finalize()();
}

uint64_t BiomeLibrary()
{
  return _BiomeLibrary();
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

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return __swift_stdlib_bridgeErrorToNSError();
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

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}