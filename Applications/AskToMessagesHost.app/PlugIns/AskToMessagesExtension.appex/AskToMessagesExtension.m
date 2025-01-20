uint64_t sub_100003268()
{
  return swift_initClassMetadata2();
}

void sub_1000032B8()
{
}

uint64_t sub_100003314(uint64_t a1)
{
  id v3 = v1;
  return a1;
}

void sub_10000332C()
{
  v3.receiver = v0;
  v3.super_class = (Class)type metadata accessor for HostingController();
  [super viewDidLoad];
  sub_100021128();
  id v1 = [v0 view];
  if (v1)
  {
    v2 = v1;
    sub_100020FA8();
    if (swift_dynamicCastClass()) {
      sub_100020F98();
    }
  }
}

void sub_100003418(void *a1)
{
  id v1 = a1;
  sub_10000332C();
}

void sub_100003460()
{
}

void sub_100003490()
{
}

id sub_1000034C0()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HostingController();
  return [super dealloc];
}

uint64_t type metadata accessor for HostingController()
{
  return sub_10000361C();
}

__n128 sub_100003554(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_100003564(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_100003584(uint64_t result, int a2, int a3)
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

void type metadata accessor for CGSize(uint64_t a1)
{
}

void sub_1000035C0()
{
}

uint64_t sub_10000361C()
{
  return swift_getGenericMetadata();
}

void type metadata accessor for Style(uint64_t a1)
{
}

void sub_100003660(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t initializeBufferWithCopyOfBuffer for StatusView(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for StatusView()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_release();
}

void *initializeWithCopy for StatusView(void *a1, void *a2)
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
  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

void *assignWithCopy for StatusView(void *a1, void *a2)
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
  swift_retain();
  swift_release();
  return a1;
}

__n128 initializeWithTake for StatusView(uint64_t a1, uint64_t a2)
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

uint64_t assignWithTake for StatusView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for StatusView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 56)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for StatusView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 56) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for StatusView()
{
  return &type metadata for StatusView;
}

uint64_t sub_100003960()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000397C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_1000046A4(&qword_10002C850);
  uint64_t v6 = __chkstk_darwin(v4 - 8, v5);
  v8 = (char *)&v54 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6, v9);
  v11 = (char *)&v54 - v10;
  uint64_t v12 = sub_1000046A4(&qword_10002C858);
  __chkstk_darwin(v12 - 8, v13);
  v15 = (char *)&v54 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_1000046A4(&qword_10002C860);
  uint64_t v18 = __chkstk_darwin(v16 - 8, v17);
  v20 = (char *)&v54 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v18, v21);
  v23 = (char *)&v54 - v22;
  *(void *)v15 = sub_1000210E8();
  *((void *)v15 + 1) = 0x4010000000000000;
  v15[16] = 0;
  uint64_t v24 = sub_1000046A4(&qword_10002C868);
  sub_100003E90(a1, (uint64_t)&v15[*(int *)(v24 + 44)]);
  sub_1000213A8();
  sub_100005BD4(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v20, 0.0, 1, 0.0, 1);
  sub_100004CE4((uint64_t)v15, &qword_10002C858);
  v59 = v23;
  sub_100004D40((uint64_t)v20, (uint64_t)v23, &qword_10002C860);
  uint64_t v25 = a1[3];
  if (v25)
  {
    *(void *)&v60[0] = a1[2];
    *((void *)&v60[0] + 1) = v25;
    sub_1000046E8();
    swift_bridgeObjectRetain();
    uint64_t v26 = sub_100021248();
    uint64_t v28 = v27;
    char v30 = v29 & 1;
    sub_1000211E8();
    v58 = v8;
    uint64_t v31 = sub_100021238();
    v55 = v20;
    v56 = v11;
    uint64_t v33 = v32;
    uint64_t v57 = a2;
    char v35 = v34;
    swift_release();
    char v36 = v35 & 1;
    sub_10000473C(v26, v28, v30);
    swift_bridgeObjectRelease();
    sub_100021318();
    uint64_t v37 = sub_100021228();
    uint64_t v39 = v38;
    char v41 = v40;
    uint64_t v43 = v42;
    swift_release();
    uint64_t v44 = v33;
    v20 = v55;
    char v45 = v36;
    v8 = v58;
    sub_10000473C(v31, v44, v45);
    v11 = v56;
    swift_bridgeObjectRelease();
    uint64_t v46 = sub_1000213A8();
    sub_100005D94(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v60, 0.0, 1, 0.0, 1, v46, v47, v37, v39, v41 & 1, v43);
    uint64_t v48 = v37;
    a2 = v57;
    sub_10000473C(v48, v39, v41 & 1);
    swift_bridgeObjectRelease();
    v62[6] = v60[6];
    v62[7] = v60[7];
    v62[8] = v60[8];
    v62[2] = v60[2];
    v62[3] = v60[3];
    v62[4] = v60[4];
    v62[5] = v60[5];
    v62[0] = v60[0];
    v62[1] = v60[1];
    __int16 v61 = 256;
    sub_1000046A4(&qword_10002C888);
    sub_10000474C();
    sub_100021298();
    sub_100004884((uint64_t)v62);
    uint64_t v49 = sub_1000046A4(&qword_10002C870);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v49 - 8) + 56))(v11, 0, 1, v49);
  }
  else
  {
    uint64_t v50 = sub_1000046A4(&qword_10002C870);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v50 - 8) + 56))(v11, 1, 1, v50);
  }
  uint64_t v51 = (uint64_t)v59;
  sub_100004C80((uint64_t)v59, (uint64_t)v20, &qword_10002C860);
  sub_100004C80((uint64_t)v11, (uint64_t)v8, &qword_10002C850);
  sub_100004C80((uint64_t)v20, a2, &qword_10002C860);
  uint64_t v52 = sub_1000046A4(&qword_10002C878);
  sub_100004C80((uint64_t)v8, a2 + *(int *)(v52 + 48), &qword_10002C850);
  sub_100004CE4((uint64_t)v11, &qword_10002C850);
  sub_100004CE4(v51, &qword_10002C860);
  sub_100004CE4((uint64_t)v8, &qword_10002C850);
  return sub_100004CE4((uint64_t)v20, &qword_10002C860);
}

uint64_t sub_100003E90@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v93 = a2;
  uint64_t v80 = sub_1000046A4(&qword_10002C8A8);
  __chkstk_darwin(v80, v3);
  v86 = (uint64_t *)((char *)&v75 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v85 = sub_100021358();
  uint64_t v82 = *(void *)(v85 - 8);
  __chkstk_darwin(v85, v5);
  v79 = (char *)&v75 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v76 = sub_1000046A4(&qword_10002C8B0);
  __chkstk_darwin(v76, v7);
  v81 = (uint64_t *)((char *)&v75 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v78 = sub_1000046A4(&qword_10002C8B8);
  __chkstk_darwin(v78, v9);
  uint64_t v77 = (uint64_t)&v75 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1000046A4(&qword_10002C8C0);
  uint64_t v90 = *(void *)(v11 - 8);
  uint64_t v91 = v11;
  uint64_t v13 = __chkstk_darwin(v11, v12);
  uint64_t v84 = (uint64_t)&v75 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13, v15);
  uint64_t v83 = (uint64_t)&v75 - v16;
  uint64_t v17 = sub_1000046A4(&qword_10002C8C8);
  uint64_t v19 = __chkstk_darwin(v17 - 8, v18);
  v92 = (char *)&v75 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v19, v21);
  uint64_t v89 = (uint64_t)&v75 - v22;
  uint64_t v23 = sub_1000046A4(&qword_10002C8D0);
  uint64_t v25 = __chkstk_darwin(v23 - 8, v24);
  v88 = (char *)&v75 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v25, v27);
  char v29 = (char *)&v75 - v28;
  v95 = a1;
  uint64_t v30 = *a1;
  uint64_t v31 = a1[1];
  uint64_t v96 = v30;
  uint64_t v97 = v31;
  sub_1000046E8();
  swift_bridgeObjectRetain();
  uint64_t v32 = sub_100021248();
  uint64_t v34 = v33;
  char v36 = v35 & 1;
  sub_1000211F8();
  uint64_t v37 = sub_100021238();
  uint64_t v39 = v38;
  char v41 = v40;
  uint64_t v43 = v42;
  uint64_t v94 = v42;
  swift_release();
  sub_10000473C(v32, v34, v36);
  swift_bridgeObjectRelease();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v45 = sub_100021308();
  uint64_t v46 = swift_getKeyPath();
  uint64_t v96 = v37;
  uint64_t v97 = v39;
  char v98 = v41 & 1;
  uint64_t v99 = v43;
  uint64_t v100 = KeyPath;
  uint64_t v47 = 1;
  uint64_t v101 = 1;
  char v102 = 0;
  uint64_t v103 = v46;
  uint64_t v104 = v45;
  sub_1000046A4(&qword_10002C8D8);
  sub_10000497C();
  v87 = v29;
  sub_100021298();
  uint64_t v48 = v39;
  uint64_t v49 = v95;
  sub_10000473C(v37, v48, v41 & 1);
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  if (v49[5])
  {
    swift_bridgeObjectRetain();
    uint64_t v50 = sub_100021338();
    uint64_t v51 = v82;
    uint64_t v52 = v79;
    uint64_t v53 = v85;
    (*(void (**)(char *, void, uint64_t))(v82 + 104))(v79, enum case for Image.Scale.small(_:), v85);
    uint64_t v54 = swift_getKeyPath();
    v55 = v86;
    (*(void (**)(char *, char *, uint64_t))(v51 + 16))((char *)v86 + *(int *)(v80 + 28), v52, v53);
    uint64_t *v55 = v54;
    v56 = v81;
    sub_100004C80((uint64_t)v55, (uint64_t)v81 + *(int *)(v76 + 36), &qword_10002C8A8);
    uint64_t *v56 = v50;
    swift_retain();
    sub_100004CE4((uint64_t)v55, &qword_10002C8A8);
    (*(void (**)(char *, uint64_t))(v51 + 8))(v52, v53);
    swift_release();
    uint64_t v57 = sub_1000211E8();
    uint64_t v58 = swift_getKeyPath();
    uint64_t v59 = v77;
    sub_100004C80((uint64_t)v56, v77, &qword_10002C8B0);
    v60 = (uint64_t *)(v59 + *(int *)(v78 + 36));
    uint64_t *v60 = v58;
    v60[1] = v57;
    sub_100004CE4((uint64_t)v56, &qword_10002C8B0);
    uint64_t v61 = v49[6];
    if (!v61) {
      uint64_t v61 = sub_1000212D8();
    }
    uint64_t v62 = swift_getKeyPath();
    uint64_t v63 = v84;
    sub_100004C80(v59, v84, &qword_10002C8B8);
    uint64_t v64 = v91;
    v65 = (uint64_t *)(v63 + *(int *)(v91 + 36));
    uint64_t *v65 = v62;
    v65[1] = v61;
    swift_retain();
    sub_100004CE4(v59, &qword_10002C8B8);
    uint64_t v66 = v83;
    sub_100004D40(v63, v83, &qword_10002C8C0);
    uint64_t v67 = v89;
    sub_100004D40(v66, v89, &qword_10002C8C0);
    uint64_t v47 = 0;
    uint64_t v69 = (uint64_t)v92;
    uint64_t v68 = v93;
    uint64_t v70 = v90;
  }
  else
  {
    uint64_t v69 = (uint64_t)v92;
    uint64_t v68 = v93;
    uint64_t v70 = v90;
    uint64_t v64 = v91;
    uint64_t v67 = v89;
  }
  uint64_t v72 = (uint64_t)v87;
  uint64_t v71 = (uint64_t)v88;
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v70 + 56))(v67, v47, 1, v64);
  sub_100004C80(v72, v71, &qword_10002C8D0);
  sub_100004C80(v67, v69, &qword_10002C8C8);
  sub_100004C80(v71, v68, &qword_10002C8D0);
  uint64_t v73 = sub_1000046A4(&qword_10002C918);
  sub_100004C80(v69, v68 + *(int *)(v73 + 48), &qword_10002C8C8);
  sub_100004CE4(v67, &qword_10002C8C8);
  sub_100004CE4(v72, &qword_10002C8D0);
  sub_100004CE4(v69, &qword_10002C8C8);
  return sub_100004CE4(v71, &qword_10002C8D0);
}

uint64_t sub_100004620()
{
  return sub_100021278();
}

uint64_t sub_10000463C@<X0>(uint64_t a1@<X8>)
{
  long long v3 = *(_OWORD *)(v1 + 16);
  v6[0] = *(_OWORD *)v1;
  v6[1] = v3;
  v6[2] = *(_OWORD *)(v1 + 32);
  uint64_t v7 = *(void *)(v1 + 48);
  *(void *)a1 = sub_100021118();
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 0;
  uint64_t v4 = sub_1000046A4(&qword_10002C848);
  return sub_10000397C(v6, a1 + *(int *)(v4 + 44));
}

uint64_t sub_1000046A4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_1000046E8()
{
  unint64_t result = qword_10002C880;
  if (!qword_10002C880)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002C880);
  }
  return result;
}

uint64_t sub_10000473C(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

unint64_t sub_10000474C()
{
  unint64_t result = qword_10002C890;
  if (!qword_10002C890)
  {
    sub_1000047C8(&qword_10002C888);
    sub_100004810();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002C890);
  }
  return result;
}

uint64_t sub_1000047C8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_100004810()
{
  unint64_t result = qword_10002C898;
  if (!qword_10002C898)
  {
    sub_1000047C8(&qword_10002C8A0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002C898);
  }
  return result;
}

uint64_t sub_100004884(uint64_t a1)
{
  return a1;
}

uint64_t sub_1000048CC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100021038();
  *a1 = result;
  return result;
}

uint64_t sub_1000048F8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100021038();
  *a1 = result;
  return result;
}

uint64_t sub_100004924()
{
  return sub_100021048();
}

uint64_t sub_100004950()
{
  return sub_100021048();
}

unint64_t sub_10000497C()
{
  unint64_t result = qword_10002C8E0;
  if (!qword_10002C8E0)
  {
    sub_1000047C8(&qword_10002C8D8);
    sub_100004A1C();
    sub_100004DE0(&qword_10002C908, &qword_10002C910);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002C8E0);
  }
  return result;
}

unint64_t sub_100004A1C()
{
  unint64_t result = qword_10002C8E8;
  if (!qword_10002C8E8)
  {
    sub_1000047C8(&qword_10002C8F0);
    sub_100004DE0(&qword_10002C8F8, &qword_10002C900);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002C8E8);
  }
  return result;
}

uint64_t sub_100004ABC()
{
  return sub_100020FF8();
}

uint64_t sub_100004AE0()
{
  return sub_100020FF8();
}

uint64_t sub_100004B04(uint64_t a1)
{
  uint64_t v2 = sub_100021358();
  __chkstk_darwin(v2, v3);
  (*(void (**)(char *, uint64_t))(v5 + 16))((char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_100021008();
}

uint64_t sub_100004BD0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100021058();
  *a1 = result;
  return result;
}

uint64_t sub_100004BFC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100021058();
  *a1 = result;
  return result;
}

uint64_t sub_100004C28()
{
  return sub_100021068();
}

uint64_t sub_100004C54()
{
  return sub_100021068();
}

uint64_t sub_100004C80(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_1000046A4(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100004CE4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_1000046A4(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100004D40(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_1000046A4(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_100004DA4()
{
  return sub_100004DE0(&qword_10002C920, &qword_10002C928);
}

uint64_t sub_100004DE0(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1000047C8(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t *sub_100004E24(uint64_t *a1, uint64_t a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v35 = *(void *)a2;
    *a1 = *(void *)a2;
    uint64_t v4 = (uint64_t *)(v35 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    uint64_t v7 = *(void *)a2;
    char v8 = *(unsigned char *)(a2 + 8);
    sub_10000501C(*(void *)a2, v8);
    *uint64_t v4 = v7;
    *((unsigned char *)v4 + 8) = v8;
    uint64_t v9 = *(void **)(a2 + 16);
    uint64_t v10 = *(void **)(a2 + 24);
    v4[2] = (uint64_t)v9;
    v4[3] = (uint64_t)v10;
    uint64_t v11 = a3[7];
    uint64_t v12 = (char *)v4 + v11;
    uint64_t v13 = a2 + v11;
    uint64_t v14 = sub_1000214F8();
    uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v14 - 8) + 16);
    id v16 = v9;
    id v17 = v10;
    v15(v12, v13, v14);
    uint64_t v18 = a3[8];
    uint64_t v19 = (char *)v4 + v18;
    uint64_t v20 = a2 + v18;
    uint64_t v21 = *(void *)(a2 + v18 + 8);
    *(void *)uint64_t v19 = *(void *)(a2 + v18);
    *((void *)v19 + 1) = v21;
    uint64_t v22 = *(void *)(a2 + v18 + 24);
    *((void *)v19 + 2) = *(void *)(a2 + v18 + 16);
    *((void *)v19 + 3) = v22;
    v19[32] = *(unsigned char *)(a2 + v18 + 32);
    uint64_t v23 = type metadata accessor for MessagesContext();
    uint64_t v24 = *(int *)(v23 + 28);
    uint64_t v38 = v20 + v24;
    uint64_t v39 = &v19[v24];
    uint64_t v25 = sub_100020CE8();
    uint64_t v37 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v25 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v37(v39, v38, v25);
    uint64_t v26 = v20 + *(int *)(v23 + 32);
    *(void *)(swift_unknownObjectWeakCopyInit() + 8) = *(void *)(v26 + 8);
    uint64_t v27 = a3[9];
    uint64_t v28 = a3[10];
    char v29 = (uint64_t *)((char *)v4 + v27);
    uint64_t v30 = (void *)(a2 + v27);
    uint64_t v31 = v30[1];
    *char v29 = *v30;
    v29[1] = v31;
    uint64_t v32 = (uint64_t *)((char *)v4 + v28);
    uint64_t v33 = (void *)(a2 + v28);
    uint64_t v34 = v33[1];
    *uint64_t v32 = *v33;
    v32[1] = v34;
    swift_bridgeObjectRetain();
  }
  swift_retain();
  return v4;
}

uint64_t sub_10000501C(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_100005028(uint64_t a1, uint64_t a2)
{
  sub_100005154(*(void *)a1, *(unsigned char *)(a1 + 8));

  uint64_t v4 = a1 + *(int *)(a2 + 28);
  uint64_t v5 = sub_1000214F8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  uint64_t v6 = a1 + *(int *)(a2 + 32);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v7 = v6 + *(int *)(type metadata accessor for MessagesContext() + 28);
  uint64_t v8 = sub_100020CE8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  swift_unknownObjectWeakDestroy();
  swift_bridgeObjectRelease();

  return swift_release();
}

uint64_t sub_100005154(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    return swift_release();
  }
  return result;
}

uint64_t sub_100005160(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)a2;
  char v7 = *(unsigned char *)(a2 + 8);
  sub_10000501C(*(void *)a2, v7);
  *(void *)a1 = v6;
  *(unsigned char *)(a1 + 8) = v7;
  uint64_t v8 = *(void **)(a2 + 16);
  uint64_t v9 = *(void **)(a2 + 24);
  *(void *)(a1 + 16) = v8;
  *(void *)(a1 + 24) = v9;
  uint64_t v10 = *(int *)(a3 + 28);
  uint64_t v38 = a3;
  uint64_t v11 = a1 + v10;
  uint64_t v12 = a2 + v10;
  uint64_t v13 = sub_1000214F8();
  uint64_t v14 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 16);
  id v15 = v8;
  id v16 = v9;
  v14(v11, v12, v13);
  uint64_t v17 = *(int *)(a3 + 32);
  uint64_t v18 = a1 + v17;
  uint64_t v19 = a2 + v17;
  uint64_t v20 = *(void *)(a2 + v17 + 8);
  *(void *)uint64_t v18 = *(void *)(a2 + v17);
  *(void *)(v18 + 8) = v20;
  uint64_t v21 = *(void *)(a2 + v17 + 24);
  *(void *)(v18 + 16) = *(void *)(a2 + v17 + 16);
  *(void *)(v18 + 24) = v21;
  *(unsigned char *)(v18 + 32) = *(unsigned char *)(a2 + v17 + 32);
  uint64_t v22 = type metadata accessor for MessagesContext();
  uint64_t v23 = *(int *)(v22 + 28);
  uint64_t v36 = v19 + v23;
  uint64_t v37 = v18 + v23;
  uint64_t v24 = sub_100020CE8();
  uint64_t v25 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v25(v37, v36, v24);
  uint64_t v26 = v19 + *(int *)(v22 + 32);
  *(void *)(swift_unknownObjectWeakCopyInit() + 8) = *(void *)(v26 + 8);
  uint64_t v27 = *(int *)(v38 + 36);
  uint64_t v28 = *(int *)(v38 + 40);
  char v29 = (void *)(a1 + v27);
  uint64_t v30 = (void *)(a2 + v27);
  uint64_t v31 = v30[1];
  *char v29 = *v30;
  v29[1] = v31;
  uint64_t v32 = (void *)(a1 + v28);
  uint64_t v33 = (void *)(a2 + v28);
  uint64_t v34 = v33[1];
  *uint64_t v32 = *v33;
  v32[1] = v34;
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

uint64_t sub_10000530C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void *)a2;
  char v7 = *(unsigned char *)(a2 + 8);
  sub_10000501C(*(void *)a2, v7);
  uint64_t v8 = *(void *)a1;
  char v9 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v6;
  *(unsigned char *)(a1 + 8) = v7;
  sub_100005154(v8, v9);
  uint64_t v10 = *(void **)(a2 + 16);
  uint64_t v11 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = v10;
  id v12 = v10;

  uint64_t v13 = *(void **)(a1 + 24);
  uint64_t v14 = *(void **)(a2 + 24);
  *(void *)(a1 + 24) = v14;
  id v15 = v14;

  uint64_t v16 = a3[7];
  uint64_t v17 = a1 + v16;
  uint64_t v18 = a2 + v16;
  uint64_t v19 = sub_1000214F8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 24))(v17, v18, v19);
  uint64_t v20 = a3[8];
  uint64_t v21 = a1 + v20;
  uint64_t v22 = a2 + v20;
  *(void *)uint64_t v21 = *(void *)(a2 + v20);
  *(void *)(v21 + 8) = *(void *)(a2 + v20 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(v21 + 16) = *(void *)(v22 + 16);
  *(void *)(v21 + 24) = *(void *)(v22 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(v21 + 32) = *(unsigned char *)(v22 + 32);
  uint64_t v23 = type metadata accessor for MessagesContext();
  uint64_t v24 = *(int *)(v23 + 28);
  uint64_t v25 = v21 + v24;
  uint64_t v26 = v22 + v24;
  uint64_t v27 = sub_100020CE8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 24))(v25, v26, v27);
  uint64_t v28 = v22 + *(int *)(v23 + 32);
  *(void *)(swift_unknownObjectWeakCopyAssign() + 8) = *(void *)(v28 + 8);
  uint64_t v29 = a3[9];
  uint64_t v30 = (void *)(a1 + v29);
  uint64_t v31 = (void *)(a2 + v29);
  *uint64_t v30 = *v31;
  v30[1] = v31[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v32 = a3[10];
  uint64_t v33 = (void *)(a1 + v32);
  uint64_t v34 = (void *)(a2 + v32);
  *uint64_t v33 = *v34;
  v33[1] = v34[1];
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_100005504(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  uint64_t v6 = a3[7];
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_1000214F8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = a3[8];
  uint64_t v11 = a1 + v10;
  uint64_t v12 = a2 + v10;
  long long v13 = *(_OWORD *)(a2 + v10 + 16);
  *(_OWORD *)uint64_t v11 = *(_OWORD *)(a2 + v10);
  *(_OWORD *)(v11 + 16) = v13;
  *(unsigned char *)(v11 + 32) = *(unsigned char *)(a2 + v10 + 32);
  uint64_t v14 = type metadata accessor for MessagesContext();
  uint64_t v15 = *(int *)(v14 + 28);
  uint64_t v16 = v11 + v15;
  uint64_t v17 = v12 + v15;
  uint64_t v18 = sub_100020CE8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 32))(v16, v17, v18);
  uint64_t v19 = v12 + *(int *)(v14 + 32);
  *(void *)(swift_unknownObjectWeakTakeInit() + 8) = *(void *)(v19 + 8);
  uint64_t v20 = a3[10];
  *(_OWORD *)(a1 + a3[9]) = *(_OWORD *)(a2 + a3[9]);
  *(_OWORD *)(a1 + v20) = *(_OWORD *)(a2 + v20);
  return a1;
}

uint64_t sub_100005648(uint64_t a1, uint64_t *a2, int *a3)
{
  uint64_t v6 = *a2;
  char v7 = *((unsigned char *)a2 + 8);
  uint64_t v8 = *(void *)a1;
  char v9 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v6;
  *(unsigned char *)(a1 + 8) = v7;
  sub_100005154(v8, v9);
  uint64_t v10 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = a2[2];

  uint64_t v11 = *(void **)(a1 + 24);
  *(void *)(a1 + 24) = a2[3];

  uint64_t v12 = a3[7];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = (uint64_t)a2 + v12;
  uint64_t v15 = sub_1000214F8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 40))(v13, v14, v15);
  uint64_t v16 = a3[8];
  uint64_t v17 = a1 + v16;
  uint64_t v18 = (uint64_t)a2 + v16;
  uint64_t v19 = *(uint64_t *)((char *)a2 + v16 + 8);
  *(void *)uint64_t v17 = *(uint64_t *)((char *)a2 + v16);
  *(void *)(v17 + 8) = v19;
  swift_bridgeObjectRelease();
  uint64_t v20 = *(void *)(v18 + 24);
  *(void *)(v17 + 16) = *(void *)(v18 + 16);
  *(void *)(v17 + 24) = v20;
  swift_bridgeObjectRelease();
  *(unsigned char *)(v17 + 32) = *(unsigned char *)(v18 + 32);
  uint64_t v21 = type metadata accessor for MessagesContext();
  uint64_t v22 = *(int *)(v21 + 28);
  uint64_t v23 = v17 + v22;
  uint64_t v24 = v18 + v22;
  uint64_t v25 = sub_100020CE8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v25 - 8) + 40))(v23, v24, v25);
  uint64_t v26 = v18 + *(int *)(v21 + 32);
  *(void *)(swift_unknownObjectWeakTakeAssign() + 8) = *(void *)(v26 + 8);
  uint64_t v27 = a3[9];
  uint64_t v28 = (void *)(a1 + v27);
  uint64_t v29 = (uint64_t *)((char *)a2 + v27);
  uint64_t v31 = *v29;
  uint64_t v30 = v29[1];
  *uint64_t v28 = v31;
  v28[1] = v30;
  swift_bridgeObjectRelease();
  uint64_t v32 = a3[10];
  uint64_t v33 = (void *)(a1 + v32);
  uint64_t v34 = (uint64_t *)((char *)a2 + v32);
  uint64_t v36 = *v34;
  uint64_t v35 = v34[1];
  *uint64_t v33 = v36;
  v33[1] = v35;
  swift_release();
  return a1;
}

uint64_t sub_1000057EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100005800);
}

uint64_t sub_100005800(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 16);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_1000214F8();
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a2)
    {
      uint64_t v10 = v8;
      uint64_t v11 = a1 + *(int *)(a3 + 28);
      uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48);
      return v12(v11, a2, v10);
    }
    else
    {
      uint64_t v13 = type metadata accessor for MessagesContext();
      uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 48);
      uint64_t v15 = v13;
      uint64_t v16 = a1 + *(int *)(a3 + 32);
      return v14(v16, a2, v15);
    }
  }
}

uint64_t sub_10000592C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100005940);
}

uint64_t sub_100005940(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 16) = (a2 - 1);
  }
  else
  {
    uint64_t v8 = sub_1000214F8();
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      uint64_t v10 = v8;
      uint64_t v11 = v5 + *(int *)(a4 + 28);
      uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
      return v12(v11, a2, a2, v10);
    }
    else
    {
      uint64_t v13 = type metadata accessor for MessagesContext();
      uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
      uint64_t v15 = v13;
      uint64_t v16 = v5 + *(int *)(a4 + 32);
      return v14(v16, a2, a2, v15);
    }
  }
  return result;
}

uint64_t type metadata accessor for BalloonView()
{
  uint64_t result = qword_10002C988;
  if (!qword_10002C988) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100005AB8()
{
  uint64_t result = sub_1000214F8();
  if (v1 <= 0x3F)
  {
    uint64_t result = type metadata accessor for MessagesContext();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t sub_100005BB8()
{
  return swift_getOpaqueTypeConformance2();
}

__n128 sub_100005BD4@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13)
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
    sub_100021738();
    uint64_t v23 = (void *)sub_100021188();
    sub_100020CF8();
  }
  sub_100020FE8();
  sub_100004C80(v13, a9, &qword_10002C858);
  uint64_t v24 = (_OWORD *)(a9 + *(int *)(sub_1000046A4(&qword_10002C860) + 36));
  v24[4] = v30;
  v24[5] = v31;
  v24[6] = v32;
  *uint64_t v24 = v26;
  v24[1] = v27;
  __n128 result = v29;
  v24[2] = v28;
  v24[3] = v29;
  return result;
}

uint64_t sub_100005D94@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19)
{
  uint64_t v20 = a19;
  char v21 = a18;
  uint64_t v22 = a17;
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
    sub_100021738();
    long long v31 = (void *)sub_100021188();
    sub_100020CF8();

    char v21 = a18;
    uint64_t v20 = a19;
    uint64_t v22 = a17;
  }
  sub_100020FE8();
  *(void *)a9 = a16;
  *(void *)(a9 + 8) = v22;
  *(unsigned char *)(a9 + 16) = v21 & 1;
  *(void *)(a9 + 24) = v20;
  *(_OWORD *)(a9 + 96) = v37;
  *(_OWORD *)(a9 + 112) = v38;
  *(_OWORD *)(a9 + 128) = v39;
  *(_OWORD *)(a9 + 32) = v33;
  *(_OWORD *)(a9 + 48) = v34;
  *(_OWORD *)(a9 + 64) = v35;
  *(_OWORD *)(a9 + 80) = v36;
  sub_10000B3C4(a16, v22, v21 & 1);

  return swift_bridgeObjectRetain();
}

uint64_t sub_100005F88@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13)
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
    sub_100021738();
    uint64_t v23 = (void *)sub_100021188();
    sub_100020CF8();
  }
  sub_100020FE8();
  long long v24 = v13[1];
  long long v37 = *v13;
  long long v38 = v24;
  sub_10000B3D4((uint64_t)&v37, (uint64_t)v40);
  long long v26 = v13[1];
  long long v35 = v13[2];
  long long v25 = v35;
  *(_OWORD *)a9 = *v13;
  *(_OWORD *)(a9 + 16) = v26;
  *(_OWORD *)(a9 + 32) = v25;
  *(_OWORD *)(a9 + 152) = v34;
  *(_OWORD *)(a9 + 136) = v33;
  *(_OWORD *)(a9 + 120) = v32;
  *(_OWORD *)(a9 + 104) = v31;
  *(_OWORD *)(a9 + 56) = v28;
  uint64_t v39 = *((void *)&v38 + 1);
  char v36 = *((unsigned char *)v13 + 48);
  *(unsigned char *)(a9 + 48) = v36;
  *(_OWORD *)(a9 + 72) = v29;
  *(_OWORD *)(a9 + 88) = v30;
  sub_10000B430((uint64_t)v40);
  sub_10000B464((uint64_t)&v39);
  return sub_10000B490((uint64_t)&v35);
}

__n128 sub_100006170@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17)
{
  char v18 = a17;
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
    sub_100021738();
    long long v27 = (void *)sub_100021188();
    sub_100020CF8();

    char v18 = a17;
  }
  sub_100020FE8();
  *(void *)a9 = a16;
  *(unsigned char *)(a9 + 8) = v18 & 1;
  *(_OWORD *)(a9 + 80) = v33;
  *(_OWORD *)(a9 + 96) = v34;
  *(_OWORD *)(a9 + 112) = v35;
  *(_OWORD *)(a9 + 16) = v29;
  *(_OWORD *)(a9 + 32) = v30;
  __n128 result = v32;
  *(_OWORD *)(a9 + 48) = v31;
  *(__n128 *)(a9 + 64) = v32;
  return result;
}

uint64_t sub_10000631C()
{
  unint64_t v1 = *(void **)(v0 + 24);
  uint64_t v2 = (uint64_t)v1;
  if (!v1)
  {
    uint64_t v5 = type metadata accessor for BalloonView();
    swift_getKeyPath();
    swift_getKeyPath();
    sub_100020F28();
    swift_release();
    swift_release();
    if (v7 != 255)
    {
      uint64_t v2 = (uint64_t)v6;
      if ((v7 & 1) == 0) {
        goto LABEL_2;
      }
      sub_10000B270(v6, v7);
    }
    swift_getKeyPath();
    swift_getKeyPath();
    sub_100020F28();
    swift_release();
    swift_release();
    if (v7 != 255 && (sub_10000B270(v6, v7), (v7 & 1) != 0))
    {
      uint64_t v2 = 3;
    }
    else if (sub_10000646C())
    {
      uint64_t v2 = 2;
    }
    else
    {
      uint64_t v2 = ~*(unsigned __int8 *)(v0 + *(int *)(v5 + 32) + 32) & 1;
    }
  }
LABEL_2:
  id v3 = v1;
  return v2;
}

BOOL sub_10000646C()
{
  uint64_t v0 = type metadata accessor for BalloonView();
  __chkstk_darwin(v0 - 8, v1);
  id v3 = (char *)v30 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100020CA8();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  __chkstk_darwin(v4, v7);
  sub_100020C98();
  uint64_t v8 = sub_1000046A4(&qword_10002CB50);
  uint64_t v9 = *(void *)(*(void *)(v8 - 8) + 64);
  __chkstk_darwin(v8 - 8, v10);
  unint64_t v31 = (v9 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v11 = (char *)v30 - v31;
  sub_100020D58();
  __n128 v32 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 48);
  int v12 = v32(v11, 1, v4);
  sub_100004CE4((uint64_t)v11, &qword_10002CB50);
  uint64_t v13 = sub_10000AAC0((uint64_t)v34, (uint64_t)v3, (uint64_t (*)(void))type metadata accessor for BalloonView);
  long long v33 = v30;
  v30[1] = v6;
  __chkstk_darwin(v13, v14);
  uint64_t v15 = (char *)v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = *(uint64_t (**)(char *, char *, uint64_t))(v5 + 16);
  long long v34 = v15;
  uint64_t v17 = v16(v15, v15, v4);
  if (v12 == 1)
  {
    BOOL v19 = 0;
  }
  else
  {
    v30[0] = v3;
    __chkstk_darwin(v17, v18);
    uint64_t v20 = (char *)v30 - v31;
    sub_100020D58();
    uint64_t v21 = v32(v20, 1, v4);
    if (v21)
    {
      sub_100004CE4((uint64_t)v20, &qword_10002CB50);
      double v23 = 0.0;
    }
    else
    {
      __chkstk_darwin(v21, v22);
      long long v25 = (char *)v30 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
      v16(v25, v20, v4);
      sub_100004CE4((uint64_t)v20, &qword_10002CB50);
      sub_100020C88();
      double v23 = v26;
      (*(void (**)(char *, uint64_t))(v5 + 8))(v25, v4);
    }
    sub_100020C88();
    BOOL v19 = v23 < v27;
    id v3 = (char *)v30[0];
  }
  long long v28 = *(void (**)(char *, uint64_t))(v5 + 8);
  v28(v15, v4);
  v28(v34, v4);
  sub_10000AB60((uint64_t)v3, (uint64_t (*)(void))type metadata accessor for BalloonView);
  return v19;
}

uint64_t sub_1000067EC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v86 = a1;
  uint64_t v92 = sub_1000046A4(&qword_10002C9D8);
  uint64_t v3 = __chkstk_darwin(v92, v2);
  uint64_t v85 = (char *)&v79 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3, v5);
  uint64_t v82 = (char *)&v79 - v6;
  uint64_t v91 = sub_100020FB8();
  uint64_t v89 = *(void **)(v91 - 8);
  uint64_t v8 = __chkstk_darwin(v91, v7);
  uint64_t v90 = (char *)&v79 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8, v10);
  v88 = (char *)&v79 - v11;
  uint64_t v84 = sub_1000046A4(&qword_10002C9E0);
  uint64_t v13 = __chkstk_darwin(v84, v12);
  v81 = (char *)&v79 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13, v15);
  uint64_t v83 = (uint64_t)&v79 - v16;
  uint64_t v87 = sub_1000046A4(&qword_10002C9E8);
  __chkstk_darwin(v87, v17);
  BOOL v19 = (char *)&v79 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_1000046A4(&qword_10002C9F0);
  __chkstk_darwin(v20 - 8, v21);
  double v23 = (char *)&v79 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = sub_1000046A4(&qword_10002C9F8);
  uint64_t v25 = v24 - 8;
  __chkstk_darwin(v24, v26);
  long long v28 = (char *)&v79 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v93 = sub_1000046A4(&qword_10002CA00);
  __chkstk_darwin(v93, v29);
  unint64_t v31 = (char *)&v79 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)BOOL v19 = sub_100021118();
  *((void *)v19 + 1) = 0;
  v19[16] = 0;
  uint64_t v32 = sub_1000046A4(&qword_10002CA08);
  sub_100006FCC(v1, (uint64_t)&v19[*(int *)(v32 + 44)]);
  uint64_t v94 = 0x65757165526B7341;
  unint64_t v95 = 0xEB000000003A7473;
  uint64_t v33 = sub_100020CE8();
  uint64_t v34 = *(void *)(v33 - 8);
  __chkstk_darwin(v33, v35);
  long long v37 = (char *)&v79 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100020DF8();
  sub_10000A484();
  v96._countAndFlagsBits = sub_100021888();
  sub_100021658(v96);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v34 + 8))(v37, v33);
  sub_100004DE0(&qword_10002CA18, &qword_10002C9E8);
  sub_100021298();
  long long v38 = v88;
  swift_bridgeObjectRelease();
  uint64_t v39 = v89;
  sub_100004CE4((uint64_t)v19, &qword_10002C9E8);
  char v40 = sub_1000211B8();
  sub_100020F58();
  uint64_t v42 = v41;
  uint64_t v44 = v43;
  uint64_t v46 = v45;
  uint64_t v48 = v47;
  sub_100004C80((uint64_t)v23, (uint64_t)v28, &qword_10002C9F0);
  uint64_t v49 = &v28[*(int *)(v25 + 44)];
  *uint64_t v49 = v40;
  *((void *)v49 + 1) = v42;
  *((void *)v49 + 2) = v44;
  *((void *)v49 + 3) = v46;
  *((void *)v49 + 4) = v48;
  v49[40] = 0;
  uint64_t v50 = (uint64_t)v23;
  uint64_t v51 = v90;
  sub_100004CE4(v50, &qword_10002C9F0);
  char v52 = sub_100021198();
  sub_100020F58();
  uint64_t v54 = v53;
  uint64_t v56 = v55;
  uint64_t v58 = v57;
  uint64_t v60 = v59;
  sub_100004C80((uint64_t)v28, (uint64_t)v31, &qword_10002C9F8);
  uint64_t v61 = *(int *)(v93 + 36);
  uint64_t v87 = (uint64_t)v31;
  uint64_t v62 = &v31[v61];
  *uint64_t v62 = v52;
  *((void *)v62 + 1) = v54;
  *((void *)v62 + 2) = v56;
  *((void *)v62 + 3) = v58;
  *((void *)v62 + 4) = v60;
  v62[40] = 0;
  sub_100004CE4((uint64_t)v28, &qword_10002C9F8);
  uint64_t v63 = v39;
  uint64_t v64 = (void (*)(char *, void, uint64_t))v39[13];
  uint64_t v65 = v91;
  v64(v38, enum case for DynamicTypeSize.small(_:), v91);
  v64(v51, enum case for DynamicTypeSize.accessibility3(_:), v65);
  sub_10000A6A0(&qword_10002CA20, (void (*)(uint64_t))&type metadata accessor for DynamicTypeSize);
  uint64_t result = sub_1000215F8();
  if (result)
  {
    uint64_t v67 = v92;
    uint64_t v68 = v82;
    uint64_t v69 = &v82[*(int *)(v92 + 48)];
    uint64_t v70 = (void (*)(char *, char *, uint64_t))v63[4];
    v70(v82, v38, v65);
    uint64_t v80 = v69;
    v70(v69, v51, v65);
    uint64_t v71 = v85;
    uint64_t v72 = &v85[*(int *)(v67 + 48)];
    uint64_t v73 = (void (*)(char *, char *, uint64_t))v63[2];
    v73(v85, v68, v65);
    v73(v72, v69, v65);
    uint64_t v74 = (uint64_t)v81;
    v70(v81, v71, v65);
    uint64_t v75 = (void (*)(char *, uint64_t))v63[1];
    v75(v72, v65);
    uint64_t v76 = &v71[*(int *)(v92 + 48)];
    v70(v71, v68, v65);
    v70(v76, v80, v65);
    v70((char *)(v74 + *(int *)(v84 + 36)), v76, v65);
    v75(v71, v65);
    uint64_t v77 = v83;
    sub_100004D40(v74, v83, &qword_10002C9E0);
    sub_10000B348(&qword_10002CA28, &qword_10002CA00, (void (*)(void))sub_10000A4D0);
    sub_100004DE0(&qword_10002CA48, &qword_10002C9E0);
    uint64_t v78 = v87;
    sub_100021288();
    sub_100004CE4(v77, &qword_10002C9E0);
    return sub_100004CE4(v78, &qword_10002CA00);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_100006FCC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v194 = a2;
  uint64_t v168 = sub_1000046A4(&qword_10002CA50);
  __chkstk_darwin(v168, v3);
  v164 = (uint64_t *)((char *)&v164 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v196 = sub_1000046A4(&qword_10002CA58);
  __chkstk_darwin(v196, v5);
  v197 = (uint64_t *)((char *)&v164 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v175 = sub_1000046A4(&qword_10002CA60);
  __chkstk_darwin(v175, v7);
  v177 = (_OWORD *)((char *)&v164 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v165 = sub_1000046A4(&qword_10002CA68);
  __chkstk_darwin(v165, v9);
  v166 = (uint64_t *)((char *)&v164 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v176 = sub_1000046A4(&qword_10002CA70);
  __chkstk_darwin(v176, v11);
  v167 = (char *)&v164 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v195 = sub_1000046A4(&qword_10002CA78);
  __chkstk_darwin(v195, v13);
  v178 = (char *)&v164 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_1000046A4(&qword_10002CA80);
  uint64_t v17 = __chkstk_darwin(v15 - 8, v16);
  uint64_t v193 = (uint64_t)&v164 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17, v19);
  uint64_t v21 = (char *)&v164 - v20;
  uint64_t v198 = sub_1000046A4(&qword_10002CA88);
  uint64_t v23 = __chkstk_darwin(v198, v22);
  v173 = (char *)&v164 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v23, v25);
  uint64_t v174 = (uint64_t)&v164 - v26;
  uint64_t v27 = sub_1000046A4(&qword_10002CA90);
  __chkstk_darwin(v27, v28);
  uint64_t v30 = (char *)&v164 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = sub_1000046A4(&qword_10002CA98);
  __chkstk_darwin(v31, v32);
  v181 = (char *)&v164 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = sub_100021398();
  uint64_t v182 = *(void *)(v34 - 8);
  uint64_t v183 = v34;
  uint64_t v36 = __chkstk_darwin(v34, v35);
  v180 = (char *)&v164 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v36, v38);
  char v40 = (char *)&v164 - v39;
  uint64_t v41 = sub_1000046A4(&qword_10002CAA0);
  uint64_t v43 = __chkstk_darwin(v41 - 8, v42);
  uint64_t v192 = (uint64_t)&v164 - ((v44 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v43, v45);
  uint64_t v200 = (uint64_t)&v164 - v46;
  uint64_t v47 = sub_1000046A4(&qword_10002CAA8);
  uint64_t v49 = __chkstk_darwin(v47 - 8, v48);
  uint64_t v191 = (uint64_t)&v164 - ((v50 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v52 = __chkstk_darwin(v49, v51);
  uint64_t v54 = (char *)&v164 - v53;
  __chkstk_darwin(v52, v55);
  uint64_t v57 = (char *)&v164 - v56;
  *(void *)uint64_t v54 = sub_1000210D8();
  *((void *)v54 + 1) = 0;
  v54[16] = 1;
  uint64_t v58 = sub_1000046A4(&qword_10002CAB0);
  sub_1000083B0(a1, (uint64_t)&v54[*(int *)(v58 + 44)]);
  v190 = v57;
  sub_100004D40((uint64_t)v54, (uint64_t)v57, &qword_10002CAA8);
  sub_1000213B8();
  sub_100020F78();
  uint64_t v189 = v213;
  int v188 = v214;
  uint64_t v187 = v215;
  int v186 = v216;
  uint64_t v184 = v218;
  uint64_t v185 = v217;
  uint64_t v199 = a1;
  uint64_t v59 = (char *)sub_10000631C();
  v201 = v21;
  if ((unint64_t)(v59 - 2) < 2 || !v59) {
    goto LABEL_6;
  }
  if (v59 != (char *)1)
  {
    sub_10000A8CC(v59);
LABEL_6:
    uint64_t v68 = v40;
    v179 = v40;
    sub_100021388();
    sub_1000213B8();
    sub_100020F78();
    uint64_t v172 = v219;
    v173 = (char *)v27;
    char v69 = v220;
    char v70 = v222;
    uint64_t v170 = v223;
    uint64_t v171 = v221;
    uint64_t v169 = v224;
    uint64_t v71 = v182;
    uint64_t v174 = v31;
    uint64_t v72 = (uint64_t)v30;
    uint64_t v73 = *(void (**)(char *, char *, uint64_t))(v182 + 16);
    uint64_t v74 = v180;
    uint64_t v75 = v68;
    uint64_t v76 = v183;
    v73(v180, v75, v183);
    LOBYTE(v208) = 1;
    LOBYTE(v202) = v69;
    LOBYTE(v225) = v70;
    uint64_t v77 = (uint64_t)v181;
    v73(v181, v74, v76);
    uint64_t v78 = v77 + *(int *)(sub_1000046A4(&qword_10002CB20) + 48);
    char v79 = v208;
    char v80 = v202;
    char v81 = v225;
    *(void *)uint64_t v78 = 0;
    *(unsigned char *)(v78 + 8) = v79;
    *(void *)(v78 + 16) = v172;
    *(unsigned char *)(v78 + 24) = v80;
    *(void *)(v78 + 32) = v171;
    *(unsigned char *)(v78 + 40) = v81;
    uint64_t v82 = v169;
    *(void *)(v78 + 48) = v170;
    *(void *)(v78 + 56) = v82;
    uint64_t v83 = *(void (**)(char *, uint64_t))(v71 + 8);
    v83(v74, v76);
    sub_100004C80(v77, v72, &qword_10002CA98);
    swift_storeEnumTagMultiPayload();
    sub_100004DE0(&qword_10002CAB8, &qword_10002CA98);
    sub_10000A5D0();
    sub_100021158();
    sub_100004CE4(v77, &qword_10002CA98);
    v83(v179, v76);
    goto LABEL_7;
  }
  sub_100021388();
  id v60 = [self systemGray5Color];
  uint64_t v61 = sub_1000212B8();
  char v62 = sub_1000211A8();
  uint64_t v64 = v182;
  uint64_t v63 = v183;
  uint64_t v65 = (uint64_t)v173;
  (*(void (**)(char *, char *, uint64_t))(v182 + 16))(v173, v40, v183);
  uint64_t v66 = v65 + *(int *)(v198 + 36);
  *(void *)uint64_t v66 = v61;
  *(unsigned char *)(v66 + 8) = v62;
  (*(void (**)(char *, uint64_t))(v64 + 8))(v40, v63);
  uint64_t v67 = v174;
  sub_100004D40(v65, v174, &qword_10002CA88);
  sub_100004C80(v67, (uint64_t)v30, &qword_10002CA88);
  swift_storeEnumTagMultiPayload();
  sub_100004DE0(&qword_10002CAB8, &qword_10002CA98);
  sub_10000A5D0();
  sub_100021158();
  sub_100004CE4(v67, &qword_10002CA88);
LABEL_7:
  sub_1000213B8();
  sub_100020F78();
  uint64_t v84 = v225;
  int v85 = v226;
  uint64_t v86 = v227;
  int v87 = v228;
  v88 = v229;
  v179 = v230;
  uint64_t v89 = (void *)sub_10000631C();
  uint64_t v198 = v84;
  LODWORD(v183) = v85;
  uint64_t v182 = v86;
  LODWORD(v181) = v87;
  v180 = v88;
  switch((unint64_t)v89)
  {
    case 0uLL:
      type metadata accessor for MessageParser();
      uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
      uint64_t v91 = self;
      id v92 = [v91 bundleForClass:ObjCClassFromMetadata];
      uint64_t v93 = sub_100020BE8();
      uint64_t v95 = v94;

      id v96 = [v91 bundleForClass:ObjCClassFromMetadata];
      uint64_t v97 = sub_100020BE8();
      uint64_t v99 = v98;

      uint64_t v100 = v166;
      uint64_t *v166 = v93;
      v100[1] = v95;
      v100[2] = v97;
      v100[3] = v99;
      v100[5] = 0;
      v100[6] = 0;
      v100[4] = 0;
      swift_storeEnumTagMultiPayload();
      sub_10000A804();
      sub_100004DE0(&qword_10002CAF8, &qword_10002CA50);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v101 = (uint64_t)v167;
      sub_100021158();
      sub_100004C80(v101, (uint64_t)v177, &qword_10002CA70);
      swift_storeEnumTagMultiPayload();
      sub_1000046A4(&qword_10002CB08);
      sub_10000A764();
      sub_10000A858();
      uint64_t v102 = (uint64_t)v178;
      sub_100021158();
      sub_100004CE4(v101, &qword_10002CA70);
      sub_100004C80(v102, (uint64_t)v197, &qword_10002CA78);
      swift_storeEnumTagMultiPayload();
      sub_10000A6E8();
      sub_100021158();
      sub_100004CE4(v102, &qword_10002CA78);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_31;
    case 1uLL:
      uint64_t v108 = sub_1000210E8();
      uint64_t v109 = (uint64_t)v164;
      uint64_t *v164 = v108;
      *(void *)(v109 + 8) = 0x4014000000000000;
      *(unsigned char *)(v109 + 16) = 0;
      uint64_t v110 = sub_1000046A4(&qword_10002CB18);
      sub_100008CC4(v199, v109 + *(int *)(v110 + 44));
      sub_100004C80(v109, (uint64_t)v166, &qword_10002CA50);
      swift_storeEnumTagMultiPayload();
      sub_10000A804();
      sub_100004DE0(&qword_10002CAF8, &qword_10002CA50);
      uint64_t v111 = (uint64_t)v167;
      sub_100021158();
      sub_100004C80(v111, (uint64_t)v177, &qword_10002CA70);
      swift_storeEnumTagMultiPayload();
      sub_1000046A4(&qword_10002CB08);
      sub_10000A764();
      sub_10000A858();
      uint64_t v112 = (uint64_t)v178;
      sub_100021158();
      sub_100004CE4(v111, &qword_10002CA70);
      sub_100004C80(v112, (uint64_t)v197, &qword_10002CA78);
      swift_storeEnumTagMultiPayload();
      sub_10000A6E8();
      sub_100021158();
      sub_100004CE4(v112, &qword_10002CA78);
      sub_100004CE4(v109, &qword_10002CA50);
      goto LABEL_32;
    case 2uLL:
      long long v202 = xmmword_1000222A0;
      long long v203 = xmmword_1000222A0;
      unint64_t v205 = 0;
      uint64_t v206 = 0;
      unint64_t v204 = 0;
      char v207 = 1;
      sub_10000A804();
      sub_100021158();
      uint64_t v113 = v211;
      char v114 = v212;
      long long v115 = v209;
      v116 = v177;
      _OWORD *v177 = v208;
      v116[1] = v115;
      v116[2] = v210;
      *((void *)v116 + 6) = v113;
      *((unsigned char *)v116 + 56) = v114;
      swift_storeEnumTagMultiPayload();
      sub_1000046A4(&qword_10002CB08);
      sub_10000A764();
      sub_10000A858();
      uint64_t v117 = (uint64_t)v178;
      sub_100021158();
      sub_100004C80(v117, (uint64_t)v197, &qword_10002CA78);
      swift_storeEnumTagMultiPayload();
      sub_10000A6E8();
      sub_100021158();
      sub_100004CE4(v117, &qword_10002CA78);
      goto LABEL_32;
    case 3uLL:
      type metadata accessor for MessageParser();
      uint64_t v118 = swift_getObjCClassFromMetadata();
      v119 = self;
      id v120 = [v119 bundleForClass:v118];
      uint64_t v121 = sub_100020BE8();
      uint64_t v123 = v122;

      id v124 = [v119 bundleForClass:v118];
      uint64_t v125 = sub_100020BE8();
      uint64_t v127 = v126;

      uint64_t v128 = sub_1000212C8();
      v129 = v197;
      uint64_t *v197 = v121;
      v129[1] = v123;
      v129[2] = v125;
      v129[3] = v127;
      v129[4] = 0xD00000000000001BLL;
      v129[5] = 0x8000000100023350;
      v129[6] = v128;
      swift_storeEnumTagMultiPayload();
      sub_10000A6E8();
      sub_10000A804();
      sub_100021158();
      goto LABEL_32;
    default:
      uint64_t v103 = v199 + *(int *)(type metadata accessor for BalloonView() + 32);
      uint64_t v105 = *(void *)(v103 + 16);
      uint64_t v104 = *(void *)(v103 + 24);
      if (v105 == sub_1000213D8() && v104 == v106) {
        char v107 = 1;
      }
      else {
        char v107 = sub_100021898();
      }
      swift_bridgeObjectRelease();
      char v130 = v107 & 1;
      uint64_t v131 = sub_10001FF70(v130);
      uint64_t v133 = v132;
      uint64_t v134 = sub_1000203EC(v130);
      uint64_t v136 = v135;
      v137 = (void *)sub_1000213C8();
      __int16 v138 = sub_100020E38();

      unint64_t v139 = 0xD000000000000011;
      unint64_t v140 = 0x8000000100023370;
      if (v138 != 2)
      {
        unint64_t v139 = 0;
        unint64_t v140 = 0;
      }
      if (v138 == 1) {
        unint64_t v141 = 0xD000000000000015;
      }
      else {
        unint64_t v141 = v139;
      }
      if (v138 == 1) {
        unint64_t v142 = 0x8000000100023390;
      }
      else {
        unint64_t v142 = v140;
      }
      v143 = (void *)sub_1000213C8();
      __int16 v144 = sub_100020E38();

      switch(v144)
      {
        case 0:
          goto LABEL_28;
        case 2:
          uint64_t v145 = sub_1000212C8();
          break;
        case 1:
          uint64_t v145 = sub_1000212F8();
          break;
        default:
LABEL_28:
          uint64_t v145 = sub_1000212D8();
          break;
      }
      *(void *)&long long v202 = v131;
      *((void *)&v202 + 1) = v133;
      *(void *)&long long v203 = v134;
      *((void *)&v203 + 1) = v136;
      unint64_t v204 = v141;
      unint64_t v205 = v142;
      uint64_t v206 = v145;
      char v207 = 0;
      sub_10000A804();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_retain();
      sub_100021158();
      uint64_t v146 = v211;
      char v147 = v212;
      long long v148 = v209;
      uint64_t v199 = v133;
      v149 = v177;
      _OWORD *v177 = v208;
      v149[1] = v148;
      v149[2] = v210;
      *((void *)v149 + 6) = v146;
      *((unsigned char *)v149 + 56) = v147;
      swift_storeEnumTagMultiPayload();
      sub_1000046A4(&qword_10002CB08);
      sub_10000A764();
      sub_10000A858();
      uint64_t v150 = (uint64_t)v178;
      sub_100021158();
      sub_100004C80(v150, (uint64_t)v197, &qword_10002CA78);
      swift_storeEnumTagMultiPayload();
      sub_10000A6E8();
      sub_100021158();
      sub_10000A8CC(v89);
      sub_100004CE4(v150, &qword_10002CA78);
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
LABEL_31:
      swift_bridgeObjectRelease();
LABEL_32:
      uint64_t v152 = (uint64_t)v190;
      uint64_t v151 = v191;
      sub_100004C80((uint64_t)v190, v191, &qword_10002CAA8);
      uint64_t v153 = v200;
      uint64_t v154 = v192;
      sub_100004C80(v200, v192, &qword_10002CAA0);
      uint64_t v155 = (uint64_t)v201;
      uint64_t v156 = v193;
      sub_100004C80((uint64_t)v201, v193, &qword_10002CA80);
      uint64_t v157 = v194;
      sub_100004C80(v151, v194, &qword_10002CAA8);
      v158 = (int *)sub_1000046A4(&qword_10002CB10);
      uint64_t v159 = v157 + v158[12];
      *(void *)uint64_t v159 = 0;
      *(unsigned char *)(v159 + 8) = 1;
      *(void *)(v159 + 16) = v189;
      *(unsigned char *)(v159 + 24) = v188;
      *(void *)(v159 + 32) = v187;
      *(unsigned char *)(v159 + 40) = v186;
      uint64_t v160 = v184;
      *(void *)(v159 + 48) = v185;
      *(void *)(v159 + 56) = v160;
      sub_100004C80(v154, v157 + v158[16], &qword_10002CAA0);
      uint64_t v161 = v157 + v158[20];
      *(void *)uint64_t v161 = 0;
      *(unsigned char *)(v161 + 8) = 1;
      *(void *)(v161 + 16) = v198;
      *(unsigned char *)(v161 + 24) = v183;
      *(void *)(v161 + 32) = v182;
      *(unsigned char *)(v161 + 40) = (_BYTE)v181;
      v162 = v179;
      *(void *)(v161 + 48) = v180;
      *(void *)(v161 + 56) = v162;
      sub_100004C80(v156, v157 + v158[24], &qword_10002CA80);
      sub_100004CE4(v155, &qword_10002CA80);
      sub_100004CE4(v153, &qword_10002CAA0);
      sub_100004CE4(v152, &qword_10002CAA8);
      sub_100004CE4(v156, &qword_10002CA80);
      sub_100004CE4(v154, &qword_10002CAA0);
      return sub_100004CE4(v151, &qword_10002CAA8);
  }
}

uint64_t sub_1000083B0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_1000046A4(&qword_10002CB58);
  uint64_t v6 = __chkstk_darwin(v4 - 8, v5);
  uint64_t v8 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6, v9);
  uint64_t v11 = (char *)&v31 - v10;
  uint64_t v12 = sub_100021348();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12, v14);
  uint64_t v16 = (char *)&v31 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for BalloonView();
  if (sub_1000214D8()) {
    sub_100021428();
  }
  else {
    sub_100021438();
  }
  uint64_t v17 = (void *)sub_1000214E8();
  uint64_t v18 = *(void *)a1;
  char v19 = *(unsigned char *)(a1 + 8);
  sub_10000501C(*(void *)a1, v19);
  double v20 = sub_10000ABC0(v18, v19);
  sub_100005154(v18, v19);
  id v21 = [objc_allocWithZone((Class)UIImage) initWithCGImage:v17 scale:0 orientation:v20];

  id v34 = v21;
  sub_100021328();
  (*(void (**)(char *, void, uint64_t))(v13 + 104))(v16, enum case for Image.ResizingMode.stretch(_:), v12);
  uint64_t v22 = sub_100021368();
  swift_release();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v16, v12);
  sub_1000213B8();
  sub_100020F78();
  uint64_t v23 = v35;
  char v24 = v36;
  LOBYTE(v17) = v38;
  uint64_t v32 = v39;
  uint64_t v33 = v37;
  uint64_t v31 = v40;
  uint64_t v25 = sub_1000212E8();
  char v26 = sub_1000211A8();
  *(void *)uint64_t v11 = sub_100021108();
  *((void *)v11 + 1) = 0x4008000000000000;
  v11[16] = 0;
  uint64_t v27 = sub_1000046A4(&qword_10002CB60);
  sub_100008728(a1, (uint64_t)&v11[*(int *)(v27 + 44)]);
  sub_100004C80((uint64_t)v11, (uint64_t)v8, &qword_10002CB58);
  *(void *)a2 = v22;
  *(void *)(a2 + 8) = v23;
  *(unsigned char *)(a2 + 16) = v24;
  *(void *)(a2 + 24) = v33;
  *(unsigned char *)(a2 + 32) = (_BYTE)v17;
  uint64_t v28 = v31;
  *(void *)(a2 + 40) = v32;
  *(void *)(a2 + 48) = v28;
  *(void *)(a2 + 56) = v25;
  *(unsigned char *)(a2 + 64) = v26;
  uint64_t v29 = sub_1000046A4(&qword_10002CB68);
  sub_100004C80((uint64_t)v8, a2 + *(int *)(v29 + 48), &qword_10002CB58);
  swift_retain_n();
  swift_retain_n();

  sub_100004CE4((uint64_t)v11, &qword_10002CB58);
  swift_release();
  swift_release();
  sub_100004CE4((uint64_t)v8, &qword_10002CB58);
  swift_release();
  return swift_release();
}

uint64_t sub_100008728@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  v49[2] = a1;
  uint64_t v53 = a2;
  uint64_t v2 = sub_1000046A4(&qword_10002C870);
  uint64_t v4 = __chkstk_darwin(v2 - 8, v3);
  uint64_t v52 = (uint64_t)v49 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4, v6);
  uint64_t v51 = (char *)v49 - v7;
  uint64_t v8 = sub_1000046A4(&qword_10002CB70);
  uint64_t v10 = __chkstk_darwin(v8 - 8, v9);
  uint64_t v50 = (uint64_t)v49 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10, v12);
  uint64_t v54 = (uint64_t)v49 - v13;
  *(void *)&v84[0] = sub_100020DC8();
  *((void *)&v84[0] + 1) = v14;
  v49[1] = sub_1000046E8();
  uint64_t v15 = sub_100021248();
  uint64_t v17 = v16;
  char v19 = v18 & 1;
  sub_1000211C8();
  sub_1000211D8();
  swift_release();
  uint64_t v20 = sub_100021238();
  uint64_t v22 = v21;
  char v24 = v23;
  uint64_t v26 = v25;
  swift_release();
  v24 &= 1u;
  sub_10000473C(v15, v17, v19);
  swift_bridgeObjectRelease();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v77 = v20;
  uint64_t v78 = v22;
  char v79 = v24;
  uint64_t v80 = v26;
  uint64_t v81 = KeyPath;
  uint64_t v82 = 1;
  char v83 = 0;
  sub_1000213A8();
  sub_100005F88(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)&v66, 0.0, 1, 0.0, 1);
  sub_10000473C(v20, v22, v24);
  swift_release();
  swift_bridgeObjectRelease();
  v84[8] = v74;
  v84[9] = v75;
  v84[4] = v70;
  v84[5] = v71;
  v84[6] = v72;
  v84[7] = v73;
  v84[0] = v66;
  v84[1] = v67;
  v84[2] = v68;
  v84[3] = v69;
  long long v63 = v74;
  long long v64 = v75;
  long long v59 = v70;
  long long v60 = v71;
  long long v61 = v72;
  long long v62 = v73;
  long long v55 = v66;
  long long v56 = v67;
  uint64_t v85 = v76;
  uint64_t v65 = v76;
  long long v57 = v68;
  long long v58 = v69;
  sub_1000046A4(&qword_10002CB78);
  sub_10000B348(&qword_10002CB80, &qword_10002CB78, (void (*)(void))sub_100004A1C);
  sub_100021298();
  sub_10000B2F8((uint64_t)v84);
  *(void *)&long long v66 = sub_100020DE8();
  *((void *)&v66 + 1) = v28;
  uint64_t v29 = sub_100021248();
  uint64_t v31 = v30;
  LOBYTE(v20) = v32 & 1;
  sub_1000211F8();
  uint64_t v33 = sub_100021238();
  uint64_t v35 = v34;
  char v37 = v36;
  uint64_t v39 = v38;
  swift_release();
  sub_10000473C(v29, v31, v20);
  swift_bridgeObjectRelease();
  uint64_t v40 = sub_1000213A8();
  sub_100005D94(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)&v66, 0.0, 1, 0.0, 1, v40, v41, v33, v35, v37 & 1, v39);
  sub_10000473C(v33, v35, v37 & 1);
  swift_bridgeObjectRelease();
  long long v61 = v72;
  long long v62 = v73;
  long long v63 = v74;
  long long v57 = v68;
  long long v58 = v69;
  long long v59 = v70;
  long long v60 = v71;
  long long v55 = v66;
  long long v56 = v67;
  LOWORD(v75) = 256;
  sub_1000046A4(&qword_10002C888);
  sub_10000B348((unint64_t *)&qword_10002C890, &qword_10002C888, (void (*)(void))sub_100004810);
  uint64_t v42 = (uint64_t)v51;
  sub_100021298();
  sub_100004884((uint64_t)&v55);
  uint64_t v43 = v54;
  uint64_t v44 = v50;
  sub_100004C80(v54, v50, &qword_10002CB70);
  uint64_t v45 = v52;
  sub_100004C80(v42, v52, &qword_10002C870);
  uint64_t v46 = v53;
  sub_100004C80(v44, v53, &qword_10002CB70);
  uint64_t v47 = sub_1000046A4(&qword_10002CB88);
  sub_100004C80(v45, v46 + *(int *)(v47 + 48), &qword_10002C870);
  sub_100004CE4(v42, &qword_10002C870);
  sub_100004CE4(v43, &qword_10002CB70);
  sub_100004CE4(v45, &qword_10002C870);
  return sub_100004CE4(v44, &qword_10002CB70);
}

uint64_t sub_100008CC4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_1000046A4(&qword_10002CB28);
  uint64_t v6 = __chkstk_darwin(v4 - 8, v5);
  uint64_t v23 = (uint64_t)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6, v8);
  uint64_t v10 = (char *)&v23 - v9;
  uint64_t v11 = type metadata accessor for BalloonView();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(void *)(v12 + 64);
  __chkstk_darwin(v11 - 8, v14);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100020F28();
  swift_release();
  swift_release();
  char v15 = v25;
  sub_10000AAC0(a1, (uint64_t)&v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))type metadata accessor for BalloonView);
  unint64_t v16 = (*(unsigned __int8 *)(v12 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  uint64_t v17 = swift_allocObject();
  sub_10000A9DC((uint64_t)&v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), v17 + v16);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100020F28();
  swift_release();
  swift_release();
  if (v24 == 1)
  {
    sub_100020F68();
    uint64_t v18 = sub_1000046A4(&qword_10002CB30);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v10, 0, 1, v18);
  }
  else
  {
    uint64_t v19 = sub_1000046A4(&qword_10002CB30);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v10, 1, 1, v19);
  }
  uint64_t v20 = v23;
  sub_100004C80((uint64_t)v10, v23, &qword_10002CB28);
  *(unsigned char *)a2 = v15 ^ 1;
  *(unsigned char *)(a2 + 1) = 1;
  *(void *)(a2 + 8) = sub_10000AA40;
  *(void *)(a2 + 16) = v17;
  uint64_t v21 = sub_1000046A4(&qword_10002CB38);
  sub_100004C80(v20, a2 + *(int *)(v21 + 48), &qword_10002CB28);
  sub_10000AAA0((uint64_t)sub_10000AA40);
  sub_100004CE4((uint64_t)v10, &qword_10002CB28);
  sub_100004CE4(v20, &qword_10002CB28);
  return sub_10000AAB0((uint64_t)sub_10000AA40);
}

void sub_100008FFC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for BalloonView();
  uint64_t v28 = *(void *)(v2 - 8);
  uint64_t v3 = *(void *)(v28 + 64);
  uint64_t v5 = __chkstk_darwin(v2, v4);
  uint64_t v6 = (char *)&v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5, v7);
  uint64_t v9 = (char *)&v27 - v8;
  uint64_t v10 = type metadata accessor for MessagesContext();
  __chkstk_darwin(v10, v11);
  uint64_t v13 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = (void *)sub_100020DD8();
  sub_100021558();

  char v15 = (int64_t *)sub_1000093F4();
  sub_10000AAC0(a1 + *(int *)(v2 + 32), (uint64_t)v13, (uint64_t (*)(void))type metadata accessor for MessagesContext);
  Strong = (void *)swift_unknownObjectWeakLoadStrong();
  sub_10000AB60((uint64_t)v13, (uint64_t (*)(void))type metadata accessor for MessagesContext);
  if (Strong)
  {
    sub_10000AAC0(a1, (uint64_t)v6, (uint64_t (*)(void))type metadata accessor for BalloonView);
    unint64_t v17 = (*(unsigned __int8 *)(v28 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v28 + 80);
    uint64_t v18 = swift_allocObject();
    sub_10000A9DC((uint64_t)v6, v18 + v17);
    sub_1000147C0(v15, (uint64_t)sub_10000B098, v18);
    swift_release();

    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    if (qword_10002C7A8 != -1) {
      swift_once();
    }
    uint64_t v19 = sub_100020D28();
    sub_10000AB28(v19, (uint64_t)qword_10002D318);
    sub_10000AAC0(a1, (uint64_t)v9, (uint64_t (*)(void))type metadata accessor for BalloonView);
    uint64_t v20 = sub_100020D08();
    os_log_type_t v21 = sub_100021728();
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v22 = (uint8_t *)swift_slowAlloc();
      uint64_t v23 = swift_slowAlloc();
      *(_DWORD *)uint64_t v22 = 136315138;
      uint64_t v30 = v23;
      char v24 = (uint64_t *)&v9[*(int *)(v2 + 32)];
      uint64_t v25 = *v24;
      unint64_t v26 = v24[1];
      swift_bridgeObjectRetain();
      uint64_t v29 = sub_100014C7C(v25, v26, &v30);
      sub_100021768();
      swift_bridgeObjectRelease();
      sub_10000AB60((uint64_t)v9, (uint64_t (*)(void))type metadata accessor for BalloonView);
      _os_log_impl((void *)&_mh_execute_header, v20, v21, "%s: User tapped options dropdown, but menu presenter was nil", v22, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      sub_10000AB60((uint64_t)v9, (uint64_t (*)(void))type metadata accessor for BalloonView);
    }
  }
}

unint64_t sub_1000093F4()
{
  unint64_t result = sub_100020D38();
  unint64_t v1 = result;
  if (result >> 62)
  {
    unint64_t result = sub_100021838();
    uint64_t v2 = result;
    if (result) {
      goto LABEL_3;
    }
LABEL_15:
    uint64_t v4 = (char *)&_swiftEmptyArrayStorage;
    goto LABEL_16;
  }
  uint64_t v2 = *(void *)((result & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v2) {
    goto LABEL_15;
  }
LABEL_3:
  if (v2 < 1)
  {
    __break(1u);
    return result;
  }
  uint64_t v3 = 0;
  unint64_t v23 = v1 & 0xC000000000000001;
  uint64_t v4 = (char *)&_swiftEmptyArrayStorage;
  unint64_t v5 = v1;
  do
  {
    if (v23) {
      id v6 = (id)sub_1000217A8();
    }
    else {
      id v6 = *(id *)(v1 + 8 * v3 + 32);
    }
    uint64_t v7 = v6;
    BOOL v8 = (unsigned __int16)sub_100020E38() == 2;
    uint64_t v9 = sub_100020E58();
    uint64_t v11 = v10;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v4 = sub_10000ADCC(0, *((void *)v4 + 2) + 1, 1, v4);
    }
    unint64_t v13 = *((void *)v4 + 2);
    unint64_t v12 = *((void *)v4 + 3);
    if (v13 >= v12 >> 1) {
      uint64_t v4 = sub_10000ADCC((char *)(v12 > 1), v13 + 1, 1, v4);
    }
    ++v3;
    *((void *)v4 + 2) = v13 + 1;
    uint64_t v14 = &v4[24 * v13];
    *((void *)v14 + 4) = v9;
    *((void *)v14 + 5) = v11;
    *((void *)v14 + 6) = 2 * v8;

    unint64_t v1 = v5;
  }
  while (v2 != v3);
LABEL_16:
  swift_bridgeObjectRelease();
  type metadata accessor for MessageParser();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v16 = [self bundleForClass:ObjCClassFromMetadata];
  uint64_t v17 = sub_100020BE8();
  uint64_t v19 = v18;

  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v4 = sub_10000ADCC(0, *((void *)v4 + 2) + 1, 1, v4);
  }
  unint64_t v21 = *((void *)v4 + 2);
  unint64_t v20 = *((void *)v4 + 3);
  if (v21 >= v20 >> 1) {
    uint64_t v4 = sub_10000ADCC((char *)(v20 > 1), v21 + 1, 1, v4);
  }
  *((void *)v4 + 2) = v21 + 1;
  uint64_t v22 = &v4[24 * v21];
  *((void *)v22 + 4) = v17;
  *((void *)v22 + 5) = v19;
  *((void *)v22 + 6) = 1;
  return (unint64_t)v4;
}

void sub_100009670(int a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for BalloonView();
  uint64_t v6 = __chkstk_darwin(v4, v5);
  BOOL v8 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6, v9);
  uint64_t v11 = (char *)&v34 - v10;
  unint64_t v12 = *(void **)(a2 + 16);
  unint64_t v13 = sub_100020D38();
  if (v13 >> 62) {
    uint64_t v14 = sub_100021838();
  }
  else {
    uint64_t v14 = *(void *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (v14 > a1)
  {
    uint64_t v15 = sub_100020D38();
    if ((v15 & 0xC000000000000001) == 0)
    {
      if (a1 < 0)
      {
        __break(1u);
      }
      else if (*(void *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x10) > a1)
      {
        id v16 = *(id *)(v15 + 8 * a1 + 32);
        goto LABEL_8;
      }
      __break(1u);
      goto LABEL_23;
    }
    id v16 = (id)sub_1000217A8();
LABEL_8:
    unint64_t v12 = v16;
    swift_bridgeObjectRelease();
    if (qword_10002C7A8 == -1)
    {
LABEL_9:
      uint64_t v17 = sub_100020D28();
      sub_10000AB28(v17, (uint64_t)qword_10002D318);
      sub_10000AAC0(a2, (uint64_t)v11, (uint64_t (*)(void))type metadata accessor for BalloonView);
      id v18 = v12;
      uint64_t v19 = sub_100020D08();
      os_log_type_t v20 = sub_100021748();
      if (os_log_type_enabled(v19, v20))
      {
        uint64_t v21 = swift_slowAlloc();
        uint64_t v22 = (void *)swift_slowAlloc();
        uint64_t v35 = swift_slowAlloc();
        uint64_t v37 = v35;
        *(_DWORD *)uint64_t v21 = 136315394;
        unint64_t v23 = (uint64_t *)&v11[*(int *)(v4 + 32)];
        uint64_t v24 = *v23;
        unint64_t v25 = v23[1];
        swift_bridgeObjectRetain();
        uint64_t v36 = sub_100014C7C(v24, v25, &v37);
        sub_100021768();
        swift_bridgeObjectRelease();
        sub_10000AB60((uint64_t)v11, (uint64_t (*)(void))type metadata accessor for BalloonView);
        *(_WORD *)(v21 + 12) = 2112;
        uint64_t v36 = (uint64_t)v18;
        id v26 = v18;
        sub_100021768();
        *uint64_t v22 = v18;

        _os_log_impl((void *)&_mh_execute_header, v19, v20, "%s: User tapped answer: %@", (uint8_t *)v21, 0x16u);
        sub_1000046A4(&qword_10002CB40);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
        sub_10000AB60((uint64_t)v11, (uint64_t (*)(void))type metadata accessor for BalloonView);
      }
      sub_100009BFC(v18);

      return;
    }
LABEL_23:
    swift_once();
    goto LABEL_9;
  }
  if (qword_10002C7A8 != -1) {
    swift_once();
  }
  uint64_t v27 = sub_100020D28();
  sub_10000AB28(v27, (uint64_t)qword_10002D318);
  sub_10000AAC0(a2, (uint64_t)v8, (uint64_t (*)(void))type metadata accessor for BalloonView);
  uint64_t v28 = sub_100020D08();
  os_log_type_t v29 = sub_100021728();
  if (os_log_type_enabled(v28, v29))
  {
    uint64_t v30 = swift_slowAlloc();
    uint64_t v37 = swift_slowAlloc();
    *(_DWORD *)uint64_t v30 = 136315650;
    uint64_t v31 = (uint64_t *)&v8[*(int *)(v4 + 32)];
    uint64_t v32 = *v31;
    unint64_t v33 = v31[1];
    swift_bridgeObjectRetain();
    uint64_t v36 = sub_100014C7C(v32, v33, &v37);
    sub_100021768();
    swift_bridgeObjectRelease();
    sub_10000AB60((uint64_t)v8, (uint64_t (*)(void))type metadata accessor for BalloonView);
    *(_WORD *)(v30 + 12) = 1024;
    LODWORD(v36) = a1;
    sub_100021768();
    *(_WORD *)(v30 + 18) = 2048;
    uint64_t v36 = v14;
    sub_100021768();
    _os_log_impl((void *)&_mh_execute_header, v28, v29, "%s: Index (%d) was selected, but the index is >= number of answer choices (%ld).", (uint8_t *)v30, 0x1Cu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    sub_10000AB60((uint64_t)v8, (uint64_t (*)(void))type metadata accessor for BalloonView);
  }
}

void sub_100009BFC(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for MessagesContext();
  __chkstk_darwin(v4, v5);
  long long v57 = &v48[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = type metadata accessor for BalloonView();
  __chkstk_darwin(v7, v8);
  uint64_t v10 = &v48[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v11 = (void *)sub_100020DD8();
  sub_100021558();

  unint64_t v12 = (uint64_t *)(v2 + *(int *)(v7 + 32));
  uint64_t v14 = *v12;
  unint64_t v13 = v12[1];
  uint64_t v55 = v7;
  long long v56 = v12;
  uint64_t v15 = qword_10002C7A8;
  swift_bridgeObjectRetain();
  if (v15 != -1) {
    swift_once();
  }
  uint64_t v16 = sub_100020D28();
  uint64_t v17 = sub_10000AB28(v16, (uint64_t)qword_10002D318);
  sub_10000AAC0(v2, (uint64_t)v10, (uint64_t (*)(void))type metadata accessor for BalloonView);
  swift_bridgeObjectRetain_n();
  id v18 = a1;
  uint64_t v19 = sub_100020D08();
  os_log_type_t v20 = sub_100021748();
  int v21 = v20;
  if (os_log_type_enabled(v19, v20))
  {
    uint64_t v22 = swift_slowAlloc();
    uint64_t v53 = v17;
    uint64_t v23 = v22;
    uint64_t v24 = swift_slowAlloc();
    os_log_t v50 = v19;
    unint64_t v25 = (void *)v24;
    uint64_t v51 = swift_slowAlloc();
    uint64_t v59 = v51;
    *(_DWORD *)uint64_t v23 = 136315650;
    swift_bridgeObjectRetain();
    uint64_t v58 = sub_100014C7C(v14, v13, &v59);
    uint64_t v54 = v14;
    sub_100021768();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v23 + 12) = 2112;
    uint64_t v52 = v4;
    uint64_t v58 = (uint64_t)v18;
    id v26 = v18;
    int v49 = v21;
    uint64_t v27 = v2;
    unint64_t v28 = v13;
    id v29 = v26;
    sub_100021768();
    *unint64_t v25 = v18;

    unint64_t v13 = v28;
    *(_WORD *)(v23 + 22) = 2112;
    uint64_t v30 = (void *)*((void *)v10 + 2);
    uint64_t v58 = (uint64_t)v30;
    id v31 = v30;
    uint64_t v14 = v54;
    sub_100021768();
    v25[1] = v30;
    uint64_t v2 = v27;
    sub_10000AB60((uint64_t)v10, (uint64_t (*)(void))type metadata accessor for BalloonView);
    os_log_t v32 = v50;
    _os_log_impl((void *)&_mh_execute_header, v50, (os_log_type_t)v49, "%s: User selected answer choice. answerChoice: %@, question: %@", (uint8_t *)v23, 0x20u);
    sub_1000046A4(&qword_10002CB40);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
    sub_10000AB60((uint64_t)v10, (uint64_t (*)(void))type metadata accessor for BalloonView);
  }
  unint64_t v33 = v57;
  sub_10000AAC0((uint64_t)v56, (uint64_t)v57, (uint64_t (*)(void))type metadata accessor for MessagesContext);
  Strong = (void *)swift_unknownObjectWeakLoadStrong();
  sub_10000AB60((uint64_t)v33, (uint64_t (*)(void))type metadata accessor for MessagesContext);
  if (Strong
    && (id v35 = [Strong activeConversation], Strong, v35))
  {
    id v36 = *(id *)(v2 + 16);
    id v37 = [v35 senderAddress];
    sub_100021638();

    id v38 = objc_allocWithZone((Class)sub_100021408());
    id v39 = v18;
    uint64_t v40 = (void *)sub_1000213E8();
    sub_100016860(v40, v35);
    swift_bridgeObjectRelease();
  }
  else
  {
    id v41 = v18;
    swift_bridgeObjectRetain();
    id v42 = v41;
    uint64_t v43 = sub_100020D08();
    os_log_type_t v44 = sub_100021728();
    if (os_log_type_enabled(v43, v44))
    {
      uint64_t v45 = swift_slowAlloc();
      uint64_t v46 = (void *)swift_slowAlloc();
      uint64_t v59 = swift_slowAlloc();
      *(_DWORD *)uint64_t v45 = 136315394;
      swift_bridgeObjectRetain();
      uint64_t v58 = sub_100014C7C(v14, v13, &v59);
      sub_100021768();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v45 + 12) = 2112;
      uint64_t v58 = (uint64_t)v42;
      id v47 = v42;
      sub_100021768();
      *uint64_t v46 = v42;

      _os_log_impl((void *)&_mh_execute_header, v43, v44, "%s: Could not send response because activeConversation was nil. answerChoice: %@", (uint8_t *)v45, 0x16u);
      sub_1000046A4(&qword_10002CB40);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

unint64_t sub_10000A484()
{
  unint64_t result = qword_10002CA10;
  if (!qword_10002CA10)
  {
    sub_100020CE8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002CA10);
  }
  return result;
}

uint64_t sub_10000A4D0()
{
  return sub_10000B348(&qword_10002CA30, &qword_10002C9F8, (void (*)(void))sub_10000A500);
}

unint64_t sub_10000A500()
{
  unint64_t result = qword_10002CA38;
  if (!qword_10002CA38)
  {
    sub_1000047C8(&qword_10002C9F0);
    sub_100004DE0(&qword_10002CA18, &qword_10002C9E8);
    sub_10000A6A0((unint64_t *)&qword_10002CA40, (void (*)(uint64_t))&type metadata accessor for AccessibilityAttachmentModifier);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002CA38);
  }
  return result;
}

unint64_t sub_10000A5D0()
{
  unint64_t result = qword_10002CAC0;
  if (!qword_10002CAC0)
  {
    sub_1000047C8(&qword_10002CA88);
    sub_10000A6A0(&qword_10002CAC8, (void (*)(uint64_t))&type metadata accessor for Divider);
    sub_100004DE0(&qword_10002CAD0, &qword_10002CAD8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002CAC0);
  }
  return result;
}

uint64_t sub_10000A6A0(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_10000A6E8()
{
  unint64_t result = qword_10002CAE0;
  if (!qword_10002CAE0)
  {
    sub_1000047C8(&qword_10002CA78);
    sub_10000A764();
    sub_10000A858();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002CAE0);
  }
  return result;
}

unint64_t sub_10000A764()
{
  unint64_t result = qword_10002CAE8;
  if (!qword_10002CAE8)
  {
    sub_1000047C8(&qword_10002CA70);
    sub_10000A804();
    sub_100004DE0(&qword_10002CAF8, &qword_10002CA50);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002CAE8);
  }
  return result;
}

unint64_t sub_10000A804()
{
  unint64_t result = qword_10002CAF0;
  if (!qword_10002CAF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002CAF0);
  }
  return result;
}

unint64_t sub_10000A858()
{
  unint64_t result = qword_10002CB00;
  if (!qword_10002CB00)
  {
    sub_1000047C8(&qword_10002CB08);
    sub_10000A804();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002CB00);
  }
  return result;
}

void sub_10000A8CC(id a1)
{
  if ((unint64_t)a1 >= 4) {
}
  }

uint64_t sub_10000A8DC@<X0>(unsigned char *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100020F28();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_10000A960()
{
  return sub_100020F38();
}

uint64_t sub_10000A9DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for BalloonView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_10000AA40()
{
  uint64_t v1 = *(void *)(type metadata accessor for BalloonView() - 8);
  uint64_t v2 = v0 + ((*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));

  sub_100008FFC(v2);
}

uint64_t sub_10000AAA0(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_10000AAB0(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_10000AAC0(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10000AB28(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_10000AB60(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

double sub_10000ABC0(uint64_t a1, char a2)
{
  uint64_t v4 = sub_1000210C8();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4, v6);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2) {
    return *(double *)&a1;
  }
  swift_retain();
  os_log_type_t v9 = sub_100021738();
  uint64_t v10 = sub_100021188();
  os_log_type_t v11 = v9;
  if (os_log_type_enabled(v10, v9))
  {
    unint64_t v12 = (uint8_t *)swift_slowAlloc();
    uint64_t v15 = swift_slowAlloc();
    *(_DWORD *)unint64_t v12 = 136315138;
    uint64_t v14 = sub_100014C7C(0x74616F6C464743, 0xE700000000000000, &v15);
    sub_100021768();
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v12, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  sub_1000210B8();
  swift_getAtKeyPath();
  sub_100005154(a1, 0);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  return *(double *)&v15;
}

char *sub_10000ADCC(char *result, int64_t a2, char a3, char *a4)
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
      sub_1000046A4(&qword_10002CB48);
      uint64_t v10 = (char *)swift_allocObject();
      size_t v11 = j__malloc_size(v10);
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 24);
      unint64_t v12 = v10 + 32;
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
      unint64_t v12 = (char *)&_swiftEmptyArrayStorage + 32;
      if (result) {
        goto LABEL_13;
      }
    }
    sub_10000B16C(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_10000AEF8()
{
  uint64_t v1 = (int *)(type metadata accessor for BalloonView() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v3 + *(void *)(*(void *)v1 + 64);
  uint64_t v5 = v2 | 7;
  uint64_t v6 = v0 + v3;
  sub_100005154(*(void *)(v0 + v3), *(unsigned char *)(v0 + v3 + 8));

  uint64_t v7 = v6 + v1[9];
  uint64_t v8 = sub_1000214F8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  uint64_t v9 = v6 + v1[10];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v10 = v9 + *(int *)(type metadata accessor for MessagesContext() + 28);
  uint64_t v11 = sub_100020CE8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(v10, v11);
  swift_unknownObjectWeakDestroy();
  swift_bridgeObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, v4, v5);
}

void sub_10000B098(int a1)
{
  uint64_t v3 = *(void *)(type metadata accessor for BalloonView() - 8);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));

  sub_100009670(a1, v4);
}

uint64_t sub_10000B108@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = sub_100021098();
  *(void *)a1 = result;
  *(unsigned char *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_10000B13C()
{
  return sub_1000210A8();
}

uint64_t sub_10000B16C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_100021878();
  __break(1u);
  return result;
}

void sub_10000B270(void *a1, unsigned __int8 a2)
{
  if (a2 != 255) {
    sub_10000B288(a1, a2 & 1);
  }
}

void sub_10000B288(void *a1, char a2)
{
  if (a2) {
    swift_errorRelease();
  }
  else {
}
  }

uint64_t sub_10000B294@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = sub_100021098();
  *(void *)a1 = result;
  *(unsigned char *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_10000B2C8()
{
  return sub_1000210A8();
}

uint64_t sub_10000B2F8(uint64_t a1)
{
  return a1;
}

uint64_t sub_10000B348(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1000047C8(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10000B3C4(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_10000B3D4(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_10000B430(uint64_t a1)
{
  return a1;
}

uint64_t sub_10000B464(uint64_t a1)
{
  return a1;
}

uint64_t sub_10000B490(uint64_t a1)
{
  return a1;
}

uint64_t sub_10000B4BC()
{
  return swift_getOpaqueTypeConformance2();
}

ValueMetadata *type metadata accessor for AskToBalloonContentFactory()
{
  return &type metadata for AskToBalloonContentFactory;
}

uint64_t sub_10000B59C()
{
  return sub_100020BC8();
}

uint64_t sub_10000B5B4()
{
  return sub_100020BB8();
}

uint64_t sub_10000B5CC()
{
  return sub_100020BD8();
}

uint64_t sub_10000B5E4()
{
  return sub_100020BA8();
}

uint64_t sub_10000B60C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v80 = a2;
  uint64_t v3 = sub_1000214F8();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3, v5);
  long long v73 = (char *)&v69 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1000046A4(&qword_10002CC28);
  __chkstk_darwin(v7 - 8, v8);
  uint64_t v10 = (char *)&v69 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100021488();
  uint64_t v74 = *(void *)(v11 - 8);
  uint64_t v75 = v11;
  __chkstk_darwin(v11, v12);
  long long v71 = (char *)&v69 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_1000046A4(&qword_10002CC30);
  uint64_t v16 = __chkstk_darwin(v14 - 8, v15);
  long long v72 = (char *)&v69 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = __chkstk_darwin(v16, v18);
  long long v70 = (char *)&v69 - v20;
  __chkstk_darwin(v19, v21);
  uint64_t v77 = (uint64_t)&v69 - v22;
  uint64_t v23 = sub_100021468();
  uint64_t v78 = *(void *)(v23 - 8);
  uint64_t v79 = v23;
  __chkstk_darwin(v23, v24);
  uint64_t v81 = (char *)&v69 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100021458();
  uint64_t v26 = sub_100020C38();
  uint64_t v27 = *(void *)(v26 - 8);
  uint64_t v28 = *(void *)(v27 + 64);
  __chkstk_darwin(v26, v29);
  unint64_t v30 = (v28 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v76 = (char *)&v69 - v30;
  id v31 = [a1 URL];
  uint64_t v32 = sub_1000046A4(&qword_10002CC38);
  uint64_t v34 = __chkstk_darwin(v32 - 8, v33);
  id v37 = (char *)&v69 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v31)
  {
    uint64_t v69 = v3;
    __chkstk_darwin(v34, v35);
    id v38 = (char *)&v69 - v30;
    sub_100020C28();

    id v39 = *(void (**)(char *, char *, uint64_t))(v27 + 32);
    v39(v37, v38, v26);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v27 + 56))(v37, 0, 1, v26);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v27 + 48))(v37, 1, v26) != 1)
    {
      v39(v76, v37, v26);
      uint64_t v40 = v4;
      uint64_t v41 = v69;
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v4 + 56))(v77, 1, 1, v69);
      sub_10000C008((uint64_t)v10);
      uint64_t v43 = v74;
      uint64_t v42 = v75;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v74 + 48))(v10, 1, v75) == 1)
      {
        sub_100004CE4((uint64_t)v10, &qword_10002CC28);
        os_log_type_t v44 = v73;
        if (qword_10002C7A0 != -1) {
          swift_once();
        }
        uint64_t v45 = sub_100020D28();
        sub_10000AB28(v45, (uint64_t)qword_10002D300);
        uint64_t v46 = sub_100020D08();
        os_log_type_t v47 = sub_100021748();
        if (os_log_type_enabled(v46, v47))
        {
          uint64_t v48 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v48 = 0;
          _os_log_impl((void *)&_mh_execute_header, v46, v47, "No payload image in message URL", v48, 2u);
          uint64_t v41 = v69;
          swift_slowDealloc();
        }

        uint64_t v49 = v77;
        uint64_t v50 = (uint64_t)v72;
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v43 + 32))(v71, v10, v42);
        uint64_t v59 = sub_1000215B8();
        uint64_t v50 = (uint64_t)v72;
        os_log_type_t v44 = v73;
        if (v60)
        {
          if (v59 != 0xD000000000000019 || v60 != 0x8000000100023510) {
            sub_100021898();
          }
          swift_bridgeObjectRelease();
        }
        uint64_t v62 = (uint64_t)v70;
        long long v61 = v71;
        sub_100021448();
        (*(void (**)(char *, uint64_t))(v74 + 8))(v61, v75);
        uint64_t v49 = v77;
        sub_100004CE4(v77, &qword_10002CC30);
        sub_100004D40(v62, v49, &qword_10002CC30);
      }
      sub_100004C80(v49, v50, &qword_10002CC30);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v40 + 48))(v50, 1, v41) == 1)
      {
        sub_100004CE4(v50, &qword_10002CC30);
        if (qword_10002C798 != -1) {
          swift_once();
        }
        uint64_t v63 = sub_100020D28();
        sub_10000AB28(v63, (uint64_t)qword_10002D2E8);
        long long v64 = sub_100020D08();
        os_log_type_t v65 = sub_100021728();
        if (os_log_type_enabled(v64, v65))
        {
          long long v66 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)long long v66 = 0;
          _os_log_impl((void *)&_mh_execute_header, v64, v65, "iconFromMessageURL was nil. Trying to use icon for the ATPayload instead as a last resort. This means that a blank icon might end up being shown to the user.", v66, 2u);
          uint64_t v41 = v69;
          swift_slowDealloc();
        }

        long long v67 = v81;
        sub_100021418();
        sub_100004CE4(v77, &qword_10002CC30);
        (*(void (**)(char *, uint64_t))(v27 + 8))(v76, v26);
        (*(void (**)(char *, uint64_t))(v78 + 8))(v67, v79);
        return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v40 + 32))(v80, v44, v41);
      }
      else
      {
        sub_100004CE4(v49, &qword_10002CC30);
        (*(void (**)(char *, uint64_t))(v27 + 8))(v76, v26);
        (*(void (**)(char *, uint64_t))(v78 + 8))(v81, v79);
        long long v68 = *(void (**)(char *, uint64_t, uint64_t))(v40 + 32);
        v68(v44, v50, v41);
        return ((uint64_t (*)(uint64_t, char *, uint64_t))v68)(v80, v44, v41);
      }
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v27 + 56))(v37, 1, 1, v26);
  }
  sub_100004CE4((uint64_t)v37, &qword_10002CC38);
  if (qword_10002C7A0 != -1) {
    swift_once();
  }
  uint64_t v51 = sub_100020D28();
  sub_10000AB28(v51, (uint64_t)qword_10002D300);
  uint64_t v52 = sub_100020D08();
  os_log_type_t v53 = sub_100021748();
  if (os_log_type_enabled(v52, v53))
  {
    uint64_t v54 = (uint8_t *)swift_slowAlloc();
    uint64_t v83 = swift_slowAlloc();
    *(_DWORD *)uint64_t v54 = 136315138;
    uint64_t v82 = sub_100014C7C(0xD00000000000001ELL, 0x80000001000234F0, &v83);
    sub_100021768();
    _os_log_impl((void *)&_mh_execute_header, v52, v53, "%s nil message url", v54, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  uint64_t v55 = v79;
  uint64_t v56 = v78;
  long long v57 = v81;
  sub_100021418();
  return (*(uint64_t (**)(char *, uint64_t))(v56 + 8))(v57, v55);
}

uint64_t sub_10000C008@<X0>(uint64_t a1@<X8>)
{
  uint64_t v137 = a1;
  uint64_t v1 = sub_1000046A4(&qword_10002CC40);
  uint64_t v2 = *(void *)(*(void *)(v1 - 8) + 64);
  __chkstk_darwin(v1 - 8, v3);
  uint64_t v4 = (char *)v115 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100020B78();
  uint64_t v5 = sub_1000046A4(&qword_10002CC48);
  uint64_t v6 = *(void (**)(void, void, void))(*(void *)(v5 - 8) + 64);
  uint64_t v8 = __chkstk_darwin(v5 - 8, v7);
  uint64_t v136 = (char *)v115 - (((unint64_t)v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8, v9);
  uint64_t v10 = (uint64_t)v4;
  sub_100004C80((uint64_t)v4, (uint64_t)v4, &qword_10002CC40);
  uint64_t v11 = sub_100020B98();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
  if (v13(v4, 1, v11) == 1)
  {
    uint64_t v14 = &qword_10002CC40;
LABEL_18:
    sub_100004CE4(v10, v14);
    goto LABEL_19;
  }
  uint64_t v133 = (uint64_t (*)(char *, uint64_t, uint64_t))v13;
  uint64_t v134 = (void *)(v12 + 48);
  uint64_t v135 = v6;
  uint64_t v15 = sub_100020B58();
  uint64_t v17 = *(void (**)(char *, uint64_t))(v12 + 8);
  uint64_t v16 = v12 + 8;
  uint64_t v132 = v17;
  v17(v4, v11);
  if (!v15)
  {
LABEL_19:
    sub_100004CE4((uint64_t)v4, &qword_10002CC40);
    uint64_t v37 = sub_100021488();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v37 - 8) + 56))(v137, 1, 1, v37);
  }
  uint64_t v18 = *(void *)(v15 + 16);
  if (v18)
  {
    uint64_t v129 = v16;
    uint64_t v130 = v11;
    uint64_t v131 = v2;
    uint64_t v128 = (char *)v115 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v19 = sub_100020B48();
    uint64_t v20 = *(char **)(v19 - 8);
    uint64_t v21 = v20[80];
    unint64_t v139 = (void (*)(char *, uint64_t, uint64_t))*((void *)v20 + 2);
    uint64_t v138 = *((void *)v20 + 9);
    uint64_t v22 = *((void *)v20 + 8);
    uint64_t v125 = v20;
    uint64_t v126 = (v19 - 8) & 0xFFFFFFFFFFFFLL | 0x2E3F000000000000;
    uint64_t v23 = v15 + ((v21 + 32) & ~v21);
    uint64_t v24 = (uint64_t (**)(char *, uint64_t))(v20 + 8);
    uint64_t v127 = v15;
    uint64_t v25 = swift_bridgeObjectRetain();
    while (1)
    {
      __chkstk_darwin(v25, v26);
      uint64_t v27 = v19;
      v139((char *)v115 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0), v23, v19);
      if (sub_100020B28() == 0x69616E626D756874 && v28 == 0xED0000617461446CLL) {
        break;
      }
      char v30 = sub_100021898();
      swift_bridgeObjectRelease();
      if (v30) {
        goto LABEL_15;
      }
      uint64_t v19 = v27;
      uint64_t v25 = (*v24)((char *)v115 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0), v27);
      v23 += v138;
      if (!--v18)
      {
        swift_bridgeObjectRelease();
        uint64_t v4 = v128;
        uint64_t v16 = v129;
        uint64_t v11 = v130;
        uint64_t v2 = v131;
        goto LABEL_13;
      }
    }
    swift_bridgeObjectRelease();
LABEL_15:
    uint64_t v31 = v27;
    swift_bridgeObjectRelease();
    uint64_t v32 = v125;
    uint64_t v10 = (uint64_t)v136;
    (*((void (**)(void))v125 + 4))();
    (*((void (**)(uint64_t, void, uint64_t, uint64_t))v32 + 7))(v10, 0, 1, v27);
    swift_bridgeObjectRelease();
    uint64_t v4 = v128;
    uint64_t v16 = v129;
    uint64_t v11 = v130;
    uint64_t v2 = v131;
  }
  else
  {
LABEL_13:
    uint64_t v31 = sub_100020B48();
    uint64_t v10 = (uint64_t)v136;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v31 - 8) + 56))(v136, 1, 1, v31);
    swift_bridgeObjectRelease();
  }
  sub_100020B48();
  uint64_t v33 = *(void *)(v31 - 8);
  uint64_t v34 = v33;
  uint64_t v35 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v33 + 48);
  uint64_t v36 = v33 + 48;
  if (v35(v10, 1, v31) == 1)
  {
    uint64_t v14 = &qword_10002CC48;
    goto LABEL_18;
  }
  uint64_t v127 = v36;
  sub_100020B38();
  uint64_t v40 = v39;
  uint64_t v138 = v34;
  unint64_t v139 = *(void (**)(char *, uint64_t, uint64_t))(v34 + 8);
  uint64_t v136 = (char *)(v34 + 8);
  ((void (*)(uint64_t, uint64_t))v139)(v10, v31);
  if (!v40) {
    goto LABEL_19;
  }
  uint64_t v41 = sub_100020C48();
  unint64_t v43 = v42;
  swift_bridgeObjectRelease();
  if (v43 >> 60 == 15) {
    goto LABEL_19;
  }
  os_log_type_t v44 = (void *)sub_100020C58();
  id v140 = 0;
  id v45 = [v44 decompressedDataUsingAlgorithm:3 error:&v140];

  id v46 = v140;
  if (!v45)
  {
    long long v57 = v46;
    sub_100020BF8();

    swift_willThrow();
    sub_10000F2B4(v41, v43);
    swift_errorRelease();
    goto LABEL_19;
  }
  uint64_t v119 = v41;
  unint64_t v121 = v43;
  uint64_t v123 = (unsigned int (*)(char *, uint64_t, uint64_t))v35;
  uint64_t v129 = v16;
  uint64_t v47 = sub_100020C68();
  uint64_t v48 = v11;
  unint64_t v50 = v49;

  id v120 = v115;
  uint64_t v53 = __chkstk_darwin(v51, v52);
  uint64_t v125 = (char *)v115 - ((v54 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v53, v55);
  uint64_t v131 = v2;
  sub_100004C80((uint64_t)v4, (uint64_t)v115 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_10002CC40);
  int v56 = v133((char *)v115 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0), 1, v48);
  sub_10000F320(v47, v50);
  uint64_t v126 = v31;
  uint64_t v130 = v48;
  if (v56 == 1)
  {
    sub_100004CE4((uint64_t)v115 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_10002CC40);
LABEL_35:
    uint64_t v67 = (uint64_t)v125;
    id v124 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v138 + 56);
    uint64_t v68 = v124(v125, 1, 1, v31);
    goto LABEL_36;
  }
  uint64_t v58 = sub_100020B58();
  v132((char *)v115 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0), v48);
  if (!v58) {
    goto LABEL_35;
  }
  uint64_t v59 = *(void *)(v58 + 16);
  if (v59)
  {
    v115[1] = v115;
    unint64_t v116 = v50;
    uint64_t v117 = v47;
    uint64_t v128 = v4;
    uint64_t v60 = v31;
    id v124 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v138 + 16);
    unint64_t v61 = v58 + ((*(unsigned __int8 *)(v138 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v138 + 80));
    uint64_t v62 = *(void *)(v138 + 64);
    uint64_t v122 = *(void *)(v138 + 72);
    v115[0] = v58;
    uint64_t v63 = swift_bridgeObjectRetain();
    unint64_t v118 = 0x8000000100023530;
    while (1)
    {
      __chkstk_darwin(v63, v64);
      ((void (*)(char *, unint64_t, uint64_t))v124)((char *)v115 - ((v62 + 15) & 0xFFFFFFFFFFFFFFF0), v61, v60);
      if (sub_100020B28() == 0xD000000000000023 && v65 == v118) {
        break;
      }
      char v66 = sub_100021898();
      swift_bridgeObjectRelease();
      if (v66) {
        goto LABEL_62;
      }
      uint64_t v60 = v126;
      uint64_t v63 = ((uint64_t (*)(char *, uint64_t))v139)((char *)v115 - ((v62 + 15) & 0xFFFFFFFFFFFFFFF0), v126);
      v61 += v122;
      if (!--v59)
      {
        swift_bridgeObjectRelease();
        uint64_t v4 = v128;
        uint64_t v31 = v60;
        uint64_t v47 = v117;
        unint64_t v50 = v116;
        goto LABEL_34;
      }
    }
    swift_bridgeObjectRelease();
LABEL_62:
    swift_bridgeObjectRelease();
    uint64_t v101 = v138;
    uint64_t v67 = (uint64_t)v125;
    uint64_t v31 = v126;
    (*(void (**)(char *, char *, uint64_t))(v138 + 32))(v125, (char *)v115 - ((v62 + 15) & 0xFFFFFFFFFFFFFFF0), v126);
    id v124 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v101 + 56);
    v124((char *)v67, 0, 1, v31);
    uint64_t v68 = swift_bridgeObjectRelease();
    uint64_t v4 = v128;
    uint64_t v47 = v117;
    unint64_t v50 = v116;
  }
  else
  {
LABEL_34:
    uint64_t v67 = (uint64_t)v125;
    id v124 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v138 + 56);
    v124(v125, 1, 1, v31);
    uint64_t v68 = swift_bridgeObjectRelease();
  }
LABEL_36:
  long long v70 = v135;
  __chkstk_darwin(v68, v69);
  long long v71 = (char *)v115 - (((unint64_t)v70 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100004C80(v67, (uint64_t)v71, &qword_10002CC48);
  if (v123(v71, 1, v31) == 1)
  {
    sub_10000F2B4(v119, v121);
    sub_10000F2C8(v47, v50);
    sub_100004CE4((uint64_t)v115 - (((unint64_t)v70 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_10002CC48);
    int v72 = 0;
LABEL_43:
    uint64_t v77 = (uint64_t)v125;
    goto LABEL_44;
  }
  uint64_t v73 = sub_100020B38();
  uint64_t v75 = v74;
  ((void (*)(char *, uint64_t))v139)(v71, v31);
  if (!v75)
  {
    sub_10000F2B4(v119, v121);
    sub_10000F2C8(v47, v50);
    int v72 = 0;
    long long v70 = v135;
    goto LABEL_43;
  }
  unint64_t v76 = v121;
  uint64_t v77 = (uint64_t)v125;
  if (v73 == 1702195828 && v75 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    sub_10000F2B4(v119, v76);
    sub_10000F2C8(v47, v50);
    int v72 = 1;
    long long v70 = v135;
  }
  else
  {
    int v72 = sub_100021898();
    swift_bridgeObjectRelease();
    sub_10000F2B4(v119, v76);
    sub_10000F2C8(v47, v50);
    long long v70 = v135;
  }
LABEL_44:
  uint64_t v78 = sub_100004CE4(v77, &qword_10002CC48);
  uint64_t v80 = __chkstk_darwin(v78, v79);
  uint64_t v125 = (char *)v115 - (((unint64_t)v70 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v80, v81);
  uint64_t v83 = (char *)v115 - ((v82 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100004C80((uint64_t)v4, (uint64_t)v83, &qword_10002CC40);
  uint64_t v84 = v130;
  int v85 = v133(v83, 1, v130);
  sub_10000F320(v47, v50);
  if (v85 == 1)
  {
    sub_100004CE4((uint64_t)v83, &qword_10002CC40);
  }
  else
  {
    uint64_t v134 = v115;
    uint64_t v86 = sub_100020B58();
    v132(v83, v84);
    if (v86)
    {
      uint64_t v87 = *(void *)(v86 + 16);
      uint64_t v88 = v137;
      if (v87)
      {
        uint64_t v132 = (void (*)(char *, uint64_t))v115;
        LODWORD(v133) = v72;
        unint64_t v116 = v50;
        uint64_t v117 = v47;
        uint64_t v128 = v4;
        uint64_t v135 = *(void (**)(void, void, void))(v138 + 16);
        unint64_t v89 = v86 + ((*(unsigned __int8 *)(v138 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v138 + 80));
        uint64_t v90 = v86;
        uint64_t v91 = *(void *)(v138 + 64);
        uint64_t v92 = *(void *)(v138 + 72);
        uint64_t v131 = v90;
        uint64_t v93 = swift_bridgeObjectRetain();
        while (1)
        {
          __chkstk_darwin(v93, v94);
          v135((char *)v115 - ((v91 + 15) & 0xFFFFFFFFFFFFFFF0), v89, v31);
          if (sub_100020B28() == 0x6349746E65696C63 && v95 == 0xEE00617461446E6FLL)
          {
            swift_bridgeObjectRelease();
            goto LABEL_64;
          }
          char v97 = sub_100021898();
          swift_bridgeObjectRelease();
          if (v97) {
            break;
          }
          uint64_t v31 = v126;
          uint64_t v93 = ((uint64_t (*)(char *, uint64_t))v139)((char *)v115 - ((v91 + 15) & 0xFFFFFFFFFFFFFFF0), v126);
          v89 += v92;
          if (!--v87)
          {
            swift_bridgeObjectRelease();
            uint64_t v88 = v137;
            uint64_t v4 = v128;
            uint64_t v47 = v117;
            unint64_t v50 = v116;
            goto LABEL_56;
          }
        }
        uint64_t v31 = v126;
LABEL_64:
        swift_bridgeObjectRelease();
        uint64_t v102 = v125;
        (*(void (**)(char *, char *, uint64_t))(v138 + 32))(v125, (char *)v115 - ((v91 + 15) & 0xFFFFFFFFFFFFFFF0), v31);
        uint64_t v98 = (uint64_t)v102;
        v124(v102, 0, 1, v31);
        swift_bridgeObjectRelease();
        uint64_t v88 = v137;
        uint64_t v4 = v128;
        uint64_t v47 = v117;
        unint64_t v50 = v116;
        unsigned int v99 = v123(v102, 1, v31);
      }
      else
      {
LABEL_56:
        uint64_t v98 = (uint64_t)v125;
        v124(v125, 1, 1, v31);
        swift_bridgeObjectRelease();
        unsigned int v99 = v123((char *)v98, 1, v31);
      }
      if (v99 == 1)
      {
        sub_100004CE4(v98, &qword_10002CC48);
      }
      else
      {
        uint64_t v103 = v88;
        sub_100020B38();
        uint64_t v104 = v98;
        uint64_t v106 = v105;
        ((void (*)(uint64_t, uint64_t))v139)(v104, v31);
        if (v106)
        {
          unint64_t v107 = v50;
          uint64_t v108 = sub_100020C48();
          unint64_t v110 = v109;
          swift_bridgeObjectRelease();
          if (v110 >> 60 == 15)
          {
            unint64_t v50 = v107;
          }
          else
          {
            uint64_t v111 = (void *)sub_100020C58();
            id v140 = 0;
            id v112 = [v111 decompressedDataUsingAlgorithm:3 error:&v140];

            id v113 = v140;
            if (v112)
            {
              sub_100020C68();
              sub_10000F2B4(v108, v110);
            }
            else
            {
              char v114 = v113;
              sub_100020BF8();

              swift_willThrow();
              sub_10000F2B4(v108, v110);
              swift_errorRelease();
            }
            unint64_t v50 = v107;
          }
        }
        uint64_t v88 = v103;
      }
      goto LABEL_58;
    }
  }
  uint64_t v88 = v137;
LABEL_58:
  sub_100021478();
  sub_10000F2C8(v47, v50);
  sub_100004CE4((uint64_t)v4, &qword_10002CC40);
  uint64_t v100 = sub_100021488();
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v100 - 8) + 56))(v88, 0, 1, v100);
}

uint64_t sub_10000D0D4(void *a1)
{
  uint64_t v2 = sub_100021528();
  uint64_t v126 = *(void *)(v2 - 8);
  uint64_t v127 = (void *)v2;
  __chkstk_darwin(v2, v3);
  uint64_t v5 = &v113[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v6 = sub_100020C38();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  __chkstk_darwin(v6, v9);
  unint64_t v10 = (v8 + 15) & 0xFFFFFFFFFFFFFFF0;
  id v11 = [a1 URL];
  uint64_t v12 = sub_1000046A4(&qword_10002CC38);
  uint64_t v14 = __chkstk_darwin(v12 - 8, v13);
  uint64_t v17 = &v113[-((v16 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (!v11)
  {
    (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(v17, 1, 1, v6);
    goto LABEL_9;
  }
  uint64_t v129 = &v113[-v10];
  uint64_t v130 = v6;
  __chkstk_darwin(v14, v15);
  sub_100020C28();

  uint64_t v18 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(v7 + 32);
  v18(v17, &v113[-v10], v130);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v7 + 56))(v17, 0, 1, v130);
  uint64_t v19 = v130;
  uint64_t v124 = v7;
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v7 + 48))(v17, 1, v130) == 1)
  {
LABEL_9:
    sub_100004CE4((uint64_t)v17, &qword_10002CC38);
    type metadata accessor for MessageParser.Error();
    sub_10000F3C4(&qword_10002CC50, (void (*)(uint64_t))type metadata accessor for MessageParser.Error);
    swift_allocError();
    swift_storeEnumTagMultiPayload();
    swift_willThrow();
    return v8;
  }
  v18(v129, v17, v19);
  sub_100021518();
  sub_1000215E8();
  sub_10000F3C4(&qword_10002CC58, (void (*)(uint64_t))&type metadata accessor for ATPayload);
  sub_10000F3C4(&qword_10002CC60, (void (*)(uint64_t))&type metadata accessor for ATPayload);
  uint64_t v20 = v128;
  sub_100021508();
  if (v20)
  {
    (*(void (**)(unsigned char *, void *))(v126 + 8))(v5, v127);
    if (qword_10002C7A0 != -1) {
      swift_once();
    }
    uint64_t v21 = sub_100020D28();
    uint64_t v22 = sub_10000AB28(v21, (uint64_t)qword_10002D300);
    uint64_t v23 = a1;
    uint64_t v128 = (void *)v22;
    uint64_t v24 = sub_100020D08();
    os_log_type_t v25 = sub_100021748();
    BOOL v26 = os_log_type_enabled(v24, v25);
    uint64_t v123 = v20;
    if (v26)
    {
      uint64_t v27 = (uint8_t *)swift_slowAlloc();
      uint64_t v127 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v27 = 138412290;
      id v132 = v23;
      uint64_t v28 = v23;
      sub_100021768();
      *uint64_t v127 = v23;

      _os_log_impl((void *)&_mh_execute_header, v24, v25, "Failed to parse an ATPayload from the MSMessage. Trying to parse MessageDetails instead. MSMessage: %@", v27, 0xCu);
      sub_1000046A4(&qword_10002CB40);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      uint64_t v24 = v23;
    }

    id v45 = [v23 guid];
    if (v45)
    {
      id v46 = v45;
      uint64_t v122 = v23;
      uint64_t v126 = sub_100021638();
      uint64_t v127 = v47;

      uint64_t v48 = sub_100020EF8();
      uint64_t v49 = *(void *)(v48 - 8);
      __chkstk_darwin(v48, v50);
      uint64_t v52 = &v113[-((v51 + 15) & 0xFFFFFFFFFFFFFFF0)];
      uint64_t v53 = sub_1000046A4(&qword_10002CC68);
      __chkstk_darwin(v53 - 8, v54);
      int v56 = &v113[-((v55 + 15) & 0xFFFFFFFFFFFFFFF0)];
      long long v57 = v129;
      sub_10000EBA0((uint64_t)v129, (uint64_t)v56);
      if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v49 + 48))(v56, 1, v48) == 1)
      {
        swift_bridgeObjectRelease();
        uint64_t v58 = sub_100004CE4((uint64_t)v56, &qword_10002CC68);
        uint64_t v125 = v113;
        __chkstk_darwin(v58, v59);
        uint64_t v60 = &v113[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
        uint64_t v61 = v124;
        uint64_t v126 = *(void *)(v124 + 16);
        uint64_t v127 = (void *)(v124 + 16);
        ((void (*)(unsigned char *, unsigned char *, uint64_t))v126)(v60, v57, v130);
        uint64_t v62 = v122;
        uint64_t v63 = sub_100020D08();
        os_log_type_t v64 = sub_100021728();
        if (os_log_type_enabled(v63, v64))
        {
          uint64_t v65 = swift_slowAlloc();
          unint64_t v121 = (void *)swift_slowAlloc();
          uint64_t v128 = (void *)swift_slowAlloc();
          id v132 = v128;
          *(_DWORD *)uint64_t v65 = 138412546;
          uint64_t v122 = v63;
          uint64_t v131 = (uint64_t)v62;
          char v66 = v62;
          sub_100021768();
          *unint64_t v121 = v62;

          *(_WORD *)(v65 + 12) = 2080;
          uint64_t v67 = sub_100020C08();
          uint64_t v131 = sub_100014C7C(v67, v68, (uint64_t *)&v132);
          sub_100021768();
          swift_bridgeObjectRelease();
          uint64_t v69 = *(void (**)(unsigned char *, uint64_t))(v61 + 8);
          uint64_t v8 = (v61 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
          long long v70 = v60;
          uint64_t v71 = v130;
          v69(v70, v130);
          int v72 = v122;
          _os_log_impl((void *)&_mh_execute_header, v122, v64, "Failed to parse an ATPayload or MessageDetails from the MSMessage. MSMessage: %@ url: %s", (uint8_t *)v65, 0x16u);
          sub_1000046A4(&qword_10002CB40);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();
        }
        else
        {

          uint64_t v69 = *(void (**)(unsigned char *, uint64_t))(v61 + 8);
          uint64_t v8 = (v61 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
          unint64_t v89 = v60;
          uint64_t v71 = v130;
          v69(v89, v130);
        }
        type metadata accessor for MessageParser.Error();
        sub_10000F3C4(&qword_10002CC50, (void (*)(uint64_t))type metadata accessor for MessageParser.Error);
        swift_allocError();
        uint64_t v90 = v129;
        ((void (*)(uint64_t, unsigned char *, uint64_t))v126)(v91, v129, v71);
        swift_storeEnumTagMultiPayload();
        swift_willThrow();
        swift_errorRelease();
        v69(v90, v71);
      }
      else
      {
        uint64_t v125 = v113;
        uint64_t v122 = v49;
        (*(void (**)(NSObject *, unsigned char *, uint64_t))(v49 + 32))(v52, v56, v48);
        unint64_t v79 = (unint64_t)v127;
        swift_bridgeObjectRetain_n();
        uint64_t v80 = sub_100020D08();
        os_log_type_t v81 = sub_100021748();
        BOOL v82 = os_log_type_enabled(v80, v81);
        uint64_t v128 = (void *)v48;
        uint64_t v83 = v52;
        if (v82)
        {
          uint64_t v84 = (uint8_t *)swift_slowAlloc();
          id v132 = (id)swift_slowAlloc();
          *(_DWORD *)uint64_t v84 = 136315138;
          swift_bridgeObjectRetain();
          uint64_t v85 = v126;
          uint64_t v131 = sub_100014C7C(v126, v79, (uint64_t *)&v132);
          sub_100021768();
          swift_bridgeObjectRelease_n();
          _os_log_impl((void *)&_mh_execute_header, v80, v81, "Successfully parsed MessageDetails from MSMessage. messageGUID: %s", v84, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();

          uint64_t v86 = v124;
        }
        else
        {

          swift_bridgeObjectRelease_n();
          uint64_t v86 = v124;
          uint64_t v85 = v126;
        }
        uint64_t v8 = sub_10000F46C(v83, v85, v79);
        swift_errorRelease();
        swift_bridgeObjectRelease();
        ((void (*)(NSObject *, void *))v122[1].isa)(v83, v128);
        (*(void (**)(unsigned char *, uint64_t))(v86 + 8))(v129, v130);
      }
    }
    else
    {
      uint64_t v73 = v23;
      uint64_t v74 = sub_100020D08();
      os_log_type_t v75 = sub_100021728();
      if (os_log_type_enabled(v74, v75))
      {
        unint64_t v76 = (uint8_t *)swift_slowAlloc();
        uint64_t v77 = (void *)swift_slowAlloc();
        *(_DWORD *)unint64_t v76 = 138412290;
        id v132 = v73;
        uint64_t v8 = (uint64_t)&v133;
        uint64_t v78 = v73;
        sub_100021768();
        *uint64_t v77 = v73;

        _os_log_impl((void *)&_mh_execute_header, v74, v75, "Failed to parse ATPayload and there was no GUID on the MSMessage. %@", v76, 0xCu);
        sub_1000046A4(&qword_10002CB40);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {

        uint64_t v74 = v73;
      }
      uint64_t v88 = v129;
      uint64_t v87 = v130;

      type metadata accessor for MessageParser.Error();
      sub_10000F3C4(&qword_10002CC50, (void (*)(uint64_t))type metadata accessor for MessageParser.Error);
      swift_allocError();
      swift_storeEnumTagMultiPayload();
      swift_willThrow();
      swift_errorRelease();
      (*(void (**)(unsigned char *, uint64_t))(v124 + 8))(v88, v87);
    }
  }
  else
  {
    uint64_t v128 = v5;
    uint64_t v8 = (uint64_t)v132;
    uint64_t v29 = (void *)sub_1000215C8();
    uint64_t v30 = sub_1000046A4(&qword_10002CB50);
    uint64_t v122 = v113;
    uint64_t v31 = *(void *)(*(void *)(v30 - 8) + 64);
    __chkstk_darwin(v30 - 8, v32);
    unint64_t v33 = (v31 + 15) & 0xFFFFFFFFFFFFFFF0;
    sub_100020D58();

    uint64_t v34 = sub_100020CA8();
    uint64_t v35 = *(void *)(v34 - 8);
    uint64_t v36 = *(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v35 + 48);
    if (v36(&v113[-v33], 1, v34) == 1)
    {
      uint64_t v37 = sub_100004CE4((uint64_t)&v113[-v33], &qword_10002CB50);
      unint64_t v121 = v113;
      uint64_t v39 = __chkstk_darwin(v37, v38);
      unint64_t v118 = v40;
      uint64_t v119 = v31;
      uint64_t v122 = &v113[-(((unint64_t)v40 + 15) & 0xFFFFFFFFFFFFFFF0)];
      id v120 = v113;
      __chkstk_darwin(v39, v41);
      unint64_t v42 = &v113[-v33];
      unint64_t v43 = v129;
      uint64_t v44 = v35;
      sub_10000E380((uint64_t)v42);
      if (v36(v42, 1, v34) == 1)
      {

        (*(void (**)(void *, void *))(v126 + 8))(v128, v127);
        (*(void (**)(unsigned char *, uint64_t))(v124 + 8))(v43, v130);
        sub_100004CE4((uint64_t)v42, &qword_10002CB50);
      }
      else
      {
        uint64_t v92 = v122;
        (*(void (**)(NSObject *, unsigned char *, uint64_t))(v35 + 32))(v122, v42, v34);
        if (qword_10002C7A0 != -1) {
          swift_once();
        }
        uint64_t v93 = sub_100020D28();
        uint64_t v94 = sub_10000AB28(v93, (uint64_t)qword_10002D300);
        uint64_t v117 = v113;
        __chkstk_darwin(v94, v95);
        char v97 = &v113[-((v96 + 15) & 0xFFFFFFFFFFFFFFF0)];
        uint64_t v98 = *(unsigned char **)(v35 + 16);
        uint64_t v125 = (unsigned char *)(v35 + 16);
        id v120 = v98;
        ((void (*)(NSObject *, NSObject *, uint64_t))v98)(v97, v92, v34);
        unsigned int v99 = sub_100020D08();
        os_log_type_t v100 = sub_100021748();
        int v101 = v100;
        if (os_log_type_enabled(v99, v100))
        {
          os_log_t v116 = v99;
          uint64_t v102 = swift_slowAlloc();
          int v114 = v101;
          uint64_t v103 = (uint8_t *)v102;
          long long v115 = (void *)swift_slowAlloc();
          id v132 = v115;
          *(_DWORD *)uint64_t v103 = 136315138;
          sub_10001077C(&qword_10002CC70, (void (*)(uint64_t))&type metadata accessor for Date);
          uint64_t v104 = sub_100021888();
          uint64_t v131 = sub_100014C7C(v104, v105, (uint64_t *)&v132);
          sub_100021768();
          swift_bridgeObjectRelease();
          unint64_t v118 = *(void (**)(NSObject *, uint64_t))(v44 + 8);
          v118(v97, v34);
          unsigned int v99 = v116;
          _os_log_impl((void *)&_mh_execute_header, v116, (os_log_type_t)v114, "Using legacy payload expiration date: %s", v103, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();
        }
        else
        {
          unint64_t v118 = *(void (**)(NSObject *, uint64_t))(v44 + 8);
          v118(v97, v34);
        }

        uint64_t v106 = v119;
        unint64_t v107 = (void *)sub_1000215C8();

        __chkstk_darwin(v108, v109);
        unint64_t v110 = &v113[-((v106 + 15) & 0xFFFFFFFFFFFFFFF0)];
        uint64_t v111 = v122;
        ((void (*)(unsigned char *, NSObject *, uint64_t))v120)(v110, v122, v34);
        (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v44 + 56))(v110, 0, 1, v34);
        sub_100020D68();

        v118(v111, v34);
        (*(void (**)(void *, void *))(v126 + 8))(v128, v127);
        (*(void (**)(unsigned char *, uint64_t))(v124 + 8))(v129, v130);
      }
    }
    else
    {

      sub_100004CE4((uint64_t)&v113[-v33], &qword_10002CB50);
      (*(void (**)(void *, void *))(v126 + 8))(v128, v127);
      (*(void (**)(unsigned char *, uint64_t))(v124 + 8))(v129, v130);
    }
  }
  return v8;
}

uint64_t sub_10000E380@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_100020CA8();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v3 + 56);
  uint64_t v5 = v3 + 56;
  v4(a1, 1, 1, v2);
  uint64_t v6 = sub_1000046A4(&qword_10002CC40);
  uint64_t v7 = *(void *)(*(void *)(v6 - 8) + 64);
  __chkstk_darwin(v6 - 8, v8);
  uint64_t v9 = (char *)v56 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100020B78();
  uint64_t v10 = sub_1000046A4(&qword_10002CC48);
  uint64_t v12 = __chkstk_darwin(v10 - 8, v11);
  uint64_t v62 = (char *)v56 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12, v14);
  uint64_t v15 = (uint64_t)v9;
  sub_100004C80((uint64_t)v9, (uint64_t)v9, &qword_10002CC40);
  uint64_t v16 = sub_100020B98();
  uint64_t v17 = *(void *)(v16 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v9, 1, v16) == 1)
  {
    uint64_t v18 = &qword_10002CC40;
LABEL_18:
    sub_100004CE4(v15, v18);
    goto LABEL_19;
  }
  uint64_t v19 = sub_100020B58();
  (*(void (**)(char *, uint64_t))(v17 + 8))(v9, v16);
  if (v19)
  {
    uint64_t v20 = *(void *)(v19 + 16);
    if (v20)
    {
      uint64_t v60 = (char *)v56 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v61 = v5;
      long long v57 = v4;
      uint64_t v58 = v2;
      uint64_t v59 = a1;
      uint64_t v21 = sub_100020B48();
      uint64_t v22 = *(void *)(v21 - 8);
      uint64_t v23 = *(unsigned __int8 *)(v22 + 80);
      os_log_type_t v64 = *(void (**)(char *, uint64_t, uint64_t))(v22 + 16);
      uint64_t v63 = *(void *)(v22 + 72);
      uint64_t v24 = *(void *)(v22 + 64);
      v56[0] = v22;
      v56[1] = (v21 - 8) & 0xFFFFFFFFFFFFLL | 0x2E3F000000000000;
      uint64_t v25 = v19 + ((v23 + 32) & ~v23);
      BOOL v26 = (uint64_t (**)(char *, uint64_t))(v22 + 8);
      v56[2] = v19;
      uint64_t v27 = swift_bridgeObjectRetain();
      while (1)
      {
        __chkstk_darwin(v27, v28);
        v64((char *)v56 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0), v25, v21);
        if (sub_100020B28() == 0x73657269707865 && v29 == 0xE700000000000000) {
          break;
        }
        char v31 = sub_100021898();
        swift_bridgeObjectRelease();
        if (v31) {
          goto LABEL_15;
        }
        uint64_t v27 = (*v26)((char *)v56 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0), v21);
        v25 += v63;
        if (!--v20)
        {
          swift_bridgeObjectRelease();
          a1 = v59;
          uint64_t v9 = v60;
          uint64_t v4 = v57;
          uint64_t v2 = v58;
          goto LABEL_13;
        }
      }
      swift_bridgeObjectRelease();
LABEL_15:
      a1 = v59;
      uint64_t v9 = v60;
      uint64_t v4 = v57;
      uint64_t v2 = v58;
      swift_bridgeObjectRelease();
      uint64_t v32 = v56[0];
      uint64_t v15 = (uint64_t)v62;
      (*(void (**)(void))(v56[0] + 32))();
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v32 + 56))(v15, 0, 1, v21);
      swift_bridgeObjectRelease();
    }
    else
    {
LABEL_13:
      uint64_t v21 = sub_100020B48();
      uint64_t v15 = (uint64_t)v62;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v62, 1, 1, v21);
      swift_bridgeObjectRelease();
    }
    sub_100020B48();
    uint64_t v33 = *(void *)(v21 - 8);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v33 + 48))(v15, 1, v21) == 1)
    {
      uint64_t v18 = &qword_10002CC48;
      goto LABEL_18;
    }
    uint64_t v39 = v15;
    uint64_t v40 = sub_100020B38();
    uint64_t v42 = v41;
    uint64_t v43 = (*(uint64_t (**)(uint64_t, uint64_t))(v33 + 8))(v39, v21);
    if (v42)
    {
      uint64_t v68 = 0;
      uint64_t v45 = __chkstk_darwin(v43, v44);
      v56[-2] = &v68;
      if ((v42 & 0x1000000000000000) != 0 || !(v42 & 0x2000000000000000 | v40 & 0x1000000000000000))
      {
        sub_100021788();
        swift_bridgeObjectRelease();
        if ((v67 & 1) == 0) {
          goto LABEL_19;
        }
      }
      else
      {
        __chkstk_darwin(v45, &v56[-4]);
        v56[-2] = sub_1000106C8;
        v56[-1] = v46;
        if ((v42 & 0x2000000000000000) != 0)
        {
          uint64_t v65 = v40;
          uint64_t v66 = v42 & 0xFFFFFFFFFFFFFFLL;
          if (v40 <= 0x20u && ((1 << v40) & 0x100003E01) != 0
            || (uint64_t v54 = (unsigned __int8 *)_swift_stdlib_strtod_clocale()) == 0)
          {
            swift_bridgeObjectRelease();
            goto LABEL_19;
          }
          int v55 = *v54;
          swift_bridgeObjectRelease();
          if (v55) {
            goto LABEL_19;
          }
        }
        else
        {
          if ((v40 & 0x1000000000000000) != 0)
          {
            uint64_t v47 = (v42 & 0xFFFFFFFFFFFFFFFLL) + 32;
            uint64_t v48 = v40 & 0xFFFFFFFFFFFFLL;
          }
          else
          {
            uint64_t v47 = sub_1000217B8();
          }
          char v49 = sub_10000F40C(v47, v48, (void (*)(uint64_t *__return_ptr))sub_100010738);
          swift_bridgeObjectRelease();
          if ((v49 & 1) == 0) {
            goto LABEL_19;
          }
        }
      }
      uint64_t v50 = sub_1000046A4(&qword_10002CB50);
      __chkstk_darwin(v50 - 8, v51);
      uint64_t v53 = (char *)v56 - ((v52 + 15) & 0xFFFFFFFFFFFFFFF0);
      sub_100020C78();
      sub_100004CE4((uint64_t)v9, &qword_10002CC40);
      sub_100004CE4(a1, &qword_10002CB50);
      v4((uint64_t)v53, 0, 1, v2);
      return sub_100004D40((uint64_t)v53, a1, &qword_10002CB50);
    }
  }
LABEL_19:
  if (qword_10002C798 != -1) {
    swift_once();
  }
  uint64_t v34 = sub_100020D28();
  sub_10000AB28(v34, (uint64_t)qword_10002D2E8);
  uint64_t v35 = sub_100020D08();
  os_log_type_t v36 = sub_100021728();
  if (os_log_type_enabled(v35, v36))
  {
    uint64_t v37 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v37 = 0;
    _os_log_impl((void *)&_mh_execute_header, v35, v36, "Failed to get expiration date from URL", v37, 2u);
    swift_slowDealloc();
  }

  return sub_100004CE4((uint64_t)v9, &qword_10002CC40);
}

uint64_t sub_10000EBA0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_100020B98();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4, v6);
  uint64_t v8 = (char *)v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1000046A4(&qword_10002CC40);
  __chkstk_darwin(v9 - 8, v10);
  uint64_t v12 = (char *)v37 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100020B78();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v12, 1, v4) == 1)
  {
    sub_100004CE4((uint64_t)v12, &qword_10002CC40);
    if (qword_10002C7A0 != -1) {
      swift_once();
    }
    uint64_t v13 = sub_100020D28();
    sub_10000AB28(v13, (uint64_t)qword_10002D300);
    uint64_t v14 = sub_100020C38();
    uint64_t v15 = *(void *)(v14 - 8);
    __chkstk_darwin(v14, v16);
    uint64_t v18 = (char *)v37 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v18, a1, v14);
    uint64_t v19 = sub_100020D08();
    os_log_type_t v20 = sub_100021728();
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v21 = swift_slowAlloc();
      uint64_t v38 = a2;
      uint64_t v22 = (uint8_t *)v21;
      uint64_t v23 = swift_slowAlloc();
      v37[3] = v37;
      uint64_t v40 = v23;
      *(_DWORD *)uint64_t v22 = 136315138;
      uint64_t v24 = sub_100020C08();
      uint64_t v39 = sub_100014C7C(v24, v25, &v40);
      sub_100021768();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v15 + 8))(v18, v14);
      _os_log_impl((void *)&_mh_execute_header, v19, v20, "Couldn't parse MessageDetails because the URLComponents derived from %s were nil.", v22, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      a2 = v38;
      swift_slowDealloc();
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v15 + 8))(v18, v14);
    }

    uint64_t v34 = sub_100020EF8();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v34 - 8) + 56))(a2, 1, 1, v34);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v8, v12, v4);
    uint64_t v26 = sub_1000046A4(&qword_10002CC68);
    uint64_t v28 = __chkstk_darwin(v26 - 8, v27);
    uint64_t v30 = (char *)v37 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
    __chkstk_darwin(v28, v31);
    uint64_t v33 = (char *)v37 - v32;
    sub_100020EA8();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    uint64_t v35 = sub_100020EF8();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v35 - 8) + 56))(v33, 0, 1, v35);
    sub_100004D40((uint64_t)v33, (uint64_t)v30, &qword_10002CC68);
    return sub_100004D40((uint64_t)v30, a2, &qword_10002CC68);
  }
}

uint64_t sub_10000F280()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for MessageParser()
{
  return self;
}

uint64_t sub_10000F2B4(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_10000F2C8(a1, a2);
  }
  return a1;
}

uint64_t sub_10000F2C8(uint64_t a1, unint64_t a2)
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

uint64_t sub_10000F320(uint64_t a1, unint64_t a2)
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

uint64_t type metadata accessor for MessageParser.Error()
{
  uint64_t result = qword_10002CD00;
  if (!qword_10002CD00) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10000F3C4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10000F40C(uint64_t a1, uint64_t a2, void (*a3)(uint64_t *__return_ptr))
{
  if (a1)
  {
    a3(&var2);
    if (!v3) {
      char v4 = var2;
    }
  }
  else
  {
    ((void (*)(uint64_t *__return_ptr, void, void))a3)((uint64_t *)((char *)&var2 + 1), 0, 0);
    if (!v3) {
      char v4 = BYTE1(var2);
    }
  }
  return v4 & 1;
}

uint64_t sub_10000F46C(NSObject *a1, uint64_t a2, unint64_t a3)
{
  uint64_t v115 = a2;
  uint64_t v117 = a1;
  if (qword_10002C7A0 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_100020D28();
  uint64_t v6 = sub_10000AB28(v5, (uint64_t)qword_10002D300);
  swift_bridgeObjectRetain_n();
  os_log_t v116 = (void *)v6;
  uint64_t v7 = sub_100020D08();
  os_log_type_t v8 = sub_100021748();
  uint64_t v113 = v3;
  unint64_t v114 = a3;
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    unint64_t v119 = swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v118 = sub_100014C7C(v115, a3, (uint64_t *)&v119);
    sub_100021768();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "Trying to derive ATPayload from MessageDetails with GUID %s", v9, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v10 = sub_100020E98();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void *)(v11 + 64);
  __chkstk_darwin(v10, v13);
  unint64_t v14 = (v12 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v15 = (void (*)(char *, uint64_t))((char *)&v101 - v14);
  uint64_t v16 = sub_1000046A4(&qword_10002CC78);
  __chkstk_darwin(v16 - 8, v17);
  uint64_t v19 = (char *)&v101 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100020EB8();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v19, 1, v10) == 1)
  {
    sub_100004CE4((uint64_t)v19, &qword_10002CC78);
LABEL_10:
    unint64_t v25 = sub_100020D08();
    os_log_type_t v26 = sub_100021728();
    if (os_log_type_enabled(v25, v26))
    {
      uint64_t v27 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v27 = 0;
      _os_log_impl((void *)&_mh_execute_header, v25, v26, "MessageDetails.eventSource was unknown", v27, 2u);
      swift_slowDealloc();
    }

    type metadata accessor for MessageParser.Error();
    sub_10000F3C4(&qword_10002CC50, (void (*)(uint64_t))type metadata accessor for MessageParser.Error);
    swift_allocError();
    swift_storeEnumTagMultiPayload();
    swift_willThrow();
    return (uint64_t)v15;
  }
  id v112 = &v101;
  uint64_t v20 = (*(uint64_t (**)(char *, char *, uint64_t))(v11 + 32))((char *)&v101 - v14, v19, v10);
  __chkstk_darwin(v20, v21);
  uint64_t v22 = *(void (**)(char *))(v11 + 104);
  LODWORD(v110) = enum case for MessageDetails.EventSource.unknown(_:);
  v22((char *)&v101 - v14);
  sub_10001077C(&qword_10002CC80, (void (*)(uint64_t))&type metadata accessor for MessageDetails.EventSource);
  char v23 = sub_100021608();
  uint64_t v24 = *(void (**)(char *, uint64_t))(v11 + 8);
  v24((char *)&v101 - v14, v10);
  if (v23)
  {
    v24((char *)v15, v10);
    goto LABEL_10;
  }
  unint64_t v107 = v24;
  uint64_t v108 = v11 + 8;
  uint64_t v109 = v10;
  uint64_t v111 = (char *)&v101 - v14;
  uint64_t v28 = sub_100020EE8();
  unint64_t v30 = v29;
  uint64_t v31 = swift_bridgeObjectRelease();
  uint64_t v33 = HIBYTE(v30) & 0xF;
  if ((v30 & 0x2000000000000000) == 0) {
    uint64_t v33 = v28 & 0xFFFFFFFFFFFFLL;
  }
  if (!v33)
  {
    uint64_t v47 = sub_100020D08();
    os_log_type_t v48 = sub_100021728();
    BOOL v49 = os_log_type_enabled(v47, v48);
    uint64_t v50 = v109;
    uint64_t v15 = v107;
    if (v49)
    {
      uint64_t v51 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v51 = 0;
      _os_log_impl((void *)&_mh_execute_header, v47, v48, "MessageDetails.requestID was empty", v51, 2u);
      swift_slowDealloc();
    }

    type metadata accessor for MessageParser.Error();
    sub_10000F3C4(&qword_10002CC50, (void (*)(uint64_t))type metadata accessor for MessageParser.Error);
    swift_allocError();
    swift_storeEnumTagMultiPayload();
    swift_willThrow();
    uint64_t v52 = v111;
    uint64_t v53 = v50;
    goto LABEL_37;
  }
  __chkstk_darwin(v31, v32);
  uint64_t v34 = (char *)&v101 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = v111;
  uint64_t v36 = v109;
  uint64_t v106 = *(void (**)(char *, char *, uint64_t))(v11 + 16);
  v106(v34, v111, v109);
  uint64_t v37 = (*(uint64_t (**)(char *, uint64_t))(v11 + 88))(v34, v36);
  id v105 = (id)(v11 + 16);
  if (&enum case for MessageDetails.EventSource.unknown(_:) && v37 == v110
    || &enum case for MessageDetails.EventSource.askToBuy(_:)
    && v37 == enum case for MessageDetails.EventSource.askToBuy(_:))
  {
    __chkstk_darwin(v37, v38);
    uint64_t v39 = (char *)&v101 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
    v106(v39, v35, v36);
    uint64_t v40 = sub_100020D08();
    os_log_type_t v41 = sub_100021728();
    if (os_log_type_enabled(v40, v41))
    {
      uint64_t v42 = (uint8_t *)swift_slowAlloc();
      uint64_t v43 = swift_slowAlloc();
      uint64_t v117 = &v101;
      unint64_t v119 = v43;
      *(_DWORD *)uint64_t v42 = 136315138;
      uint64_t v44 = sub_100020E88();
      uint64_t v118 = sub_100014C7C(v44, v45, (uint64_t *)&v119);
      sub_100021768();
      swift_bridgeObjectRelease();
      uint64_t v46 = v39;
      uint64_t v15 = v107;
      v107(v46, v36);
      _os_log_impl((void *)&_mh_execute_header, v40, v41, "MessageDetails.eventSource was unsupported \"%s\"", v42, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      os_log_type_t v75 = v39;
      uint64_t v15 = v107;
      v107(v75, v36);
    }

    type metadata accessor for MessageParser.Error();
    sub_10000F3C4(&qword_10002CC50, (void (*)(uint64_t))type metadata accessor for MessageParser.Error);
    swift_allocError();
    unint64_t v76 = v111;
    v106(v77, v111, v36);
    swift_storeEnumTagMultiPayload();
    swift_willThrow();
    uint64_t v52 = v76;
    uint64_t v53 = v36;
LABEL_37:
    v15(v52, v53);
    return (uint64_t)v15;
  }
  if (!&enum case for MessageDetails.EventSource.screenTime(_:)
    || v37 != enum case for MessageDetails.EventSource.screenTime(_:))
  {
    uint64_t v117 = &v101;
    __chkstk_darwin(v37, v38);
    uint64_t v78 = (char *)&v101 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
    v106(v78, v35, v36);
    unint64_t v79 = sub_100020D08();
    os_log_type_t v80 = sub_100021728();
    if (os_log_type_enabled(v79, v80))
    {
      uint64_t v81 = swift_slowAlloc();
      os_log_t v116 = &v101;
      BOOL v82 = (uint8_t *)v81;
      uint64_t v115 = swift_slowAlloc();
      unint64_t v119 = v115;
      *(_DWORD *)BOOL v82 = 136315138;
      uint64_t v83 = sub_100020E88();
      uint64_t v118 = sub_100014C7C(v83, v84, (uint64_t *)&v119);
      sub_100021768();
      swift_bridgeObjectRelease();
      uint64_t v85 = v78;
      uint64_t v15 = v107;
      v107(v85, v36);
      _os_log_impl((void *)&_mh_execute_header, v79, v80, "MessageDetails.eventSource was unsupported \"%s\"", v82, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      uint64_t v86 = v78;
      uint64_t v15 = v107;
      v107(v86, v36);
    }

    type metadata accessor for MessageParser.Error();
    sub_10000F3C4(&qword_10002CC50, (void (*)(uint64_t))type metadata accessor for MessageParser.Error);
    swift_allocError();
    uint64_t v87 = v111;
    v106(v88, v111, v36);
    swift_storeEnumTagMultiPayload();
    swift_willThrow();
    v15(v87, v36);
    v15(v34, v36);
    return (uint64_t)v15;
  }
  id v54 = objc_allocWithZone((Class)sub_100020DB8());
  int v55 = (void *)sub_100020DA8();
  uint64_t v110 = sub_100020E08();
  uint64_t v106 = (void (*)(char *, char *, uint64_t))sub_100020EE8();
  type metadata accessor for MessageParser();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  long long v57 = self;
  id v58 = v55;
  id v59 = [v57 bundleForClass:ObjCClassFromMetadata];
  sub_100020BE8();

  sub_100020EC8();
  id v105 = v58;
  uint64_t v60 = (void *)sub_100020D88();
  sub_1000046A4(&qword_10002CC88);
  uint64_t v61 = swift_allocObject();
  *(_OWORD *)(v61 + 16) = xmmword_1000224A0;
  unint64_t v119 = 1;
  id v103 = v60;
  uint64_t v110 = sub_100021888();
  id v62 = [v57 bundleForClass:ObjCClassFromMetadata];
  uint64_t v106 = (void (*)(char *, char *, uint64_t))0xD000000000000019;
  sub_100020BE8();

  uint64_t v63 = (objc_class *)sub_100020E68();
  id v64 = objc_allocWithZone(v63);
  *(void *)(v61 + 32) = sub_100020E28();
  unint64_t v119 = 2;
  uint64_t v110 = sub_100021888();
  id v65 = [v57 bundleForClass:ObjCClassFromMetadata];
  sub_100020BE8();

  id v66 = objc_allocWithZone(v63);
  *(void *)(v61 + 40) = sub_100020E28();
  unint64_t v119 = 3;
  uint64_t v110 = sub_100021888();
  id v104 = v57;
  uint64_t v101 = ObjCClassFromMetadata;
  id v67 = [v57 bundleForClass:ObjCClassFromMetadata];
  sub_100020BE8();

  Class v102 = v63;
  id v68 = objc_allocWithZone(v63);
  *(void *)(v61 + 48) = sub_100020E28();
  unint64_t v119 = v61;
  sub_1000216B8();
  unint64_t v69 = v119;
  if (v119 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_100021838();
    uint64_t v70 = result;
    if (!result) {
      goto LABEL_44;
    }
  }
  else
  {
    uint64_t v70 = *(void *)((v119 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (!v70) {
      goto LABEL_44;
    }
  }
  if (v70 >= 1)
  {
    for (uint64_t i = 0; i != v70; ++i)
    {
      if ((v69 & 0xC000000000000001) != 0) {
        id v73 = (id)sub_1000217A8();
      }
      else {
        id v73 = *(id *)(v69 + 8 * i + 32);
      }
      uint64_t v74 = v73;
      sub_100020E48();
    }
LABEL_44:
    swift_bridgeObjectRelease();
    unint64_t v119 = 0;
    sub_100021888();
    id v89 = [v104 bundleForClass:v101];
    sub_100020BE8();

    id v90 = objc_allocWithZone(v102);
    uint64_t v91 = (void *)sub_100020E28();
    sub_100020E48();
    unint64_t v119 = v69;
    id v92 = v91;
    sub_100021678();
    if (*(void *)((v119 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v119 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_1000216C8();
    }
    sub_1000216D8();
    sub_1000216B8();

    id v93 = v103;
    sub_100020D48();
    sub_100020ED8();
    sub_100020D98();

    sub_1000215E8();
    swift_bridgeObjectRetain();
    sub_100020E78();
    uint64_t v94 = v93;
    uint64_t v15 = (void (*)(char *, uint64_t))(id)sub_1000215A8();
    uint64_t v95 = sub_100020D08();
    os_log_type_t v96 = sub_100021748();
    uint64_t v117 = v95;
    if (os_log_type_enabled(v95, v96))
    {
      char v97 = (uint8_t *)swift_slowAlloc();
      uint64_t v98 = (void *)swift_slowAlloc();
      *(_DWORD *)char v97 = 138412290;
      unint64_t v119 = (unint64_t)v15;
      unsigned int v99 = v15;
      sub_100021768();
      *uint64_t v98 = v15;

      _os_log_impl((void *)&_mh_execute_header, v117, v96, "Got payload from MessageDetails: %@", v97, 0xCu);
      sub_1000046A4(&qword_10002CB40);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    os_log_type_t v100 = v111;

    v107(v100, v109);
    return (uint64_t)v15;
  }
  __break(1u);
  return result;
}

unsigned char *sub_1000106C8@<X0>(unsigned char *result@<X0>, BOOL *a2@<X8>)
{
  unsigned int v3 = *result;
  BOOL v4 = v3 > 0x20;
  uint64_t v5 = (1 << v3) & 0x100003E01;
  BOOL v6 = v4 || v5 == 0;
  v7 = v6 && (uint64_t result = (unsigned char *)_swift_stdlib_strtod_clocale()) != 0 && *result == 0;
  *a2 = v7;
  return result;
}

void *sub_100010738@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = (*(void *(**)(uint64_t *__return_ptr))(v1 + 16))(&v5);
  if (!v2) {
    *a1 = v5;
  }
  return result;
}

uint64_t sub_10001077C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t *sub_1000107C4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = *(void *)(a3 - 8);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      uint64_t v10 = sub_100020E98();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v10 - 8) + 16))(a1, a2, v10);
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload)
    {
      memcpy(a1, a2, *(void *)(v6 + 64));
    }
    else
    {
      uint64_t v8 = sub_100020C38();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v8 - 8) + 16))(a1, a2, v8);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t sub_100010914(uint64_t a1)
{
  uint64_t result = swift_getEnumCaseMultiPayload();
  if (result == 1)
  {
    uint64_t v3 = sub_100020E98();
  }
  else
  {
    if (result) {
      return result;
    }
    uint64_t v3 = sub_100020C38();
  }
  BOOL v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);

  return v4(a1, v3);
}

void *sub_1000109A0(void *a1, const void *a2, uint64_t a3)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {
    uint64_t v8 = sub_100020E98();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v8 - 8) + 16))(a1, a2, v8);
    swift_storeEnumTagMultiPayload();
  }
  else if (EnumCaseMultiPayload)
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v7 = sub_100020C38();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *sub_100010AAC(void *a1, const void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_100010BC8((uint64_t)a1);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      uint64_t v8 = sub_100020E98();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v8 - 8) + 16))(a1, a2, v8);
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload)
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
    else
    {
      uint64_t v7 = sub_100020C38();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t sub_100010BC8(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for MessageParser.Error();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void *sub_100010C24(void *a1, const void *a2, uint64_t a3)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {
    uint64_t v8 = sub_100020E98();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v8 - 8) + 32))(a1, a2, v8);
    swift_storeEnumTagMultiPayload();
  }
  else if (EnumCaseMultiPayload)
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v7 = sub_100020C38();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *sub_100010D30(void *a1, const void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_100010BC8((uint64_t)a1);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      uint64_t v8 = sub_100020E98();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v8 - 8) + 32))(a1, a2, v8);
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload)
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
    else
    {
      uint64_t v7 = sub_100020C38();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t sub_100010E4C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_100010E74(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_100010EA4()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_100010EB4()
{
  uint64_t result = sub_100020C38();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_100020E98();
    if (v2 <= 0x3F)
    {
      swift_initEnumMetadataMultiPayload();
      return 0;
    }
  }
  return result;
}

uint64_t sub_100010F78()
{
  return sub_10000F3C4(&qword_10002CC50, (void (*)(uint64_t))type metadata accessor for MessageParser.Error);
}

uint64_t destroy for MenuOption()
{
  return swift_bridgeObjectRelease();
}

void *_s22AskToMessagesExtension10MenuOptionVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for MenuOption(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  return a1;
}

__n128 initializeWithTake for MenuOption(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

void *assignWithTake for MenuOption(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  return a1;
}

uint64_t getEnumTagSinglePayload for MenuOption(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for MenuOption(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for MenuOption()
{
  return &type metadata for MenuOption;
}

uint64_t sub_100011148(uint64_t a1)
{
  return sub_100011250(a1, qword_10002D2E8);
}

uint64_t *sub_10001116C(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_1000111D0(uint64_t a1)
{
  return sub_100011250(a1, qword_10002D300);
}

uint64_t sub_1000111FC(uint64_t a1)
{
  return sub_100011250(a1, qword_10002D318);
}

uint64_t sub_100011224(uint64_t a1)
{
  return sub_100011250(a1, qword_10002D330);
}

uint64_t sub_100011250(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100020D28();
  sub_10001116C(v3, a2);
  sub_10000AB28(v3, (uint64_t)a2);
  return sub_100020D18();
}

uint64_t sub_1000112D0()
{
  sub_10001133C(v0 + 32);

  return _swift_deallocClassInstance(v0, 72, 7);
}

uint64_t type metadata accessor for BalloonContentContainer()
{
  return self;
}

uint64_t sub_10001133C(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

double sub_10001138C(CGFloat a1, CGFloat a2)
{
  if (qword_10002C798 != -1) {
    swift_once();
  }
  uint64_t v5 = 0x3E656E6F6E3CLL;
  uint64_t v6 = sub_100020D28();
  sub_10000AB28(v6, (uint64_t)qword_10002D2E8);
  uint64_t v7 = v2;
  uint64_t v8 = sub_100020D08();
  os_log_type_t v9 = sub_100021748();
  unint64_t v69 = v7;
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = swift_slowAlloc();
    uint64_t v70 = swift_slowAlloc();
    *(_DWORD *)uint64_t v10 = 136315394;
    uint64_t v11 = *(void **)&v7[OBJC_IVAR____TtC22AskToMessagesExtension22MessagesViewController_selectedPayload];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = sub_100021568();
      unint64_t v15 = v14;
    }
    else
    {
      unint64_t v15 = 0xE600000000000000;
      uint64_t v13 = 0x3E656E6F6E3CLL;
    }
    sub_100014C7C(v13, v15, &v70);
    sub_100021768();
    uint64_t v7 = v69;

    swift_bridgeObjectRelease();
    *(_WORD *)(v10 + 12) = 2080;
    sub_100014C7C(0xD000000000000017, 0x8000000100023AA0, &v70);
    sub_100021768();
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "%s: %s called", (uint8_t *)v10, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  if (a1 > 300.0) {
    a1 = 300.0;
  }
  uint64_t v16 = (double *)&v7[OBJC_IVAR____TtC22AskToMessagesExtension22MessagesViewController_cachedSizeInfo];
  if ((v7[OBJC_IVAR____TtC22AskToMessagesExtension22MessagesViewController_cachedSizeInfo + 32] & 1) == 0)
  {
    double v17 = v16[2];
    v71.width = a1;
    v71.height = a2;
    if (CGSizeEqualToSize(v71, *(CGSize *)v16))
    {
      uint64_t v18 = v7;
      uint64_t v19 = sub_100020D08();
      os_log_type_t v20 = sub_100021748();
      if (os_log_type_enabled(v19, v20))
      {
        uint64_t v21 = swift_slowAlloc();
        uint64_t v70 = swift_slowAlloc();
        *(_DWORD *)uint64_t v21 = 136316162;
        uint64_t v22 = *(void **)&v18[OBJC_IVAR____TtC22AskToMessagesExtension22MessagesViewController_selectedPayload];
        if (v22)
        {
          id v23 = v22;
          uint64_t v24 = sub_100021568();
          unint64_t v26 = v25;
        }
        else
        {
          unint64_t v26 = 0xE600000000000000;
          uint64_t v24 = 0x3E656E6F6E3CLL;
        }
        sub_100014C7C(v24, v26, &v70);
        sub_100021768();

        swift_bridgeObjectRelease();
        *(_WORD *)(v21 + 12) = 2048;
        sub_100021768();
        *(_WORD *)(v21 + 22) = 2048;
        sub_100021768();
        *(_WORD *)(v21 + 32) = 2048;
        sub_100021768();
        *(_WORD *)(v21 + 42) = 2048;
        sub_100021768();
        _os_log_impl((void *)&_mh_execute_header, v19, v20, "%s: contentSizeThatFits using cached size %f x %f in fitting size %f x %f", (uint8_t *)v21, 0x34u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        uint64_t v5 = 0x3E656E6F6E3CLL;
      }
      else
      {
      }
LABEL_40:
      uint64_t v7 = v69;
      goto LABEL_41;
    }
  }
  uint64_t v27 = v7;
  uint64_t v28 = sub_100020D08();
  os_log_type_t v29 = sub_100021748();
  if (os_log_type_enabled(v28, v29))
  {
    uint64_t v30 = swift_slowAlloc();
    uint64_t v70 = swift_slowAlloc();
    *(_DWORD *)uint64_t v30 = 136315650;
    uint64_t v31 = *(void **)&v27[OBJC_IVAR____TtC22AskToMessagesExtension22MessagesViewController_selectedPayload];
    if (v31)
    {
      id v32 = v31;
      uint64_t v33 = sub_100021568();
      unint64_t v35 = v34;
    }
    else
    {
      unint64_t v35 = 0xE600000000000000;
      uint64_t v33 = 0x3E656E6F6E3CLL;
    }
    sub_100014C7C(v33, v35, &v70);
    sub_100021768();

    swift_bridgeObjectRelease();
    *(_WORD *)(v30 + 12) = 2048;
    sub_100021768();
    *(_WORD *)(v30 + 22) = 2048;
    sub_100021768();
    _os_log_impl((void *)&_mh_execute_header, v28, v29, "%s: contentSizeThatFits cache miss for fitting size %f x %f", (uint8_t *)v30, 0x20u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v5 = 0x3E656E6F6E3CLL;
    uint64_t v7 = v69;
  }
  else
  {
  }
  uint64_t v36 = *(void **)(*(void *)&v27[OBJC_IVAR____TtC22AskToMessagesExtension22MessagesViewController_balloonContentContainer]
                 + 24);
  if (!v36 || (id v37 = [v36 view]) == 0)
  {
    uint64_t v51 = v27;
    uint64_t v52 = sub_100020D08();
    os_log_type_t v53 = sub_100021748();
    if (os_log_type_enabled(v52, v53))
    {
      uint64_t v54 = swift_slowAlloc();
      uint64_t v70 = swift_slowAlloc();
      *(_DWORD *)uint64_t v54 = 136316162;
      int v55 = *(void **)&v51[OBJC_IVAR____TtC22AskToMessagesExtension22MessagesViewController_selectedPayload];
      if (v55)
      {
        id v56 = v55;
        uint64_t v57 = sub_100021568();
        unint64_t v59 = v58;
      }
      else
      {
        unint64_t v59 = 0xE600000000000000;
        uint64_t v57 = 0x3E656E6F6E3CLL;
      }
      sub_100014C7C(v57, v59, &v70);
      sub_100021768();

      swift_bridgeObjectRelease();
      *(_WORD *)(v54 + 12) = 2048;
      sub_100021768();
      *(_WORD *)(v54 + 22) = 2048;
      sub_100021768();
      *(_WORD *)(v54 + 32) = 2048;
      sub_100021768();
      *(_WORD *)(v54 + 42) = 2048;
      sub_100021768();
      _os_log_impl((void *)&_mh_execute_header, v52, v53, "%s: contentSizeThatFits using constant size %f x %f in fitting size %f x %f", (uint8_t *)v54, 0x34u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      double v17 = a1;
    }
    else
    {

      double v17 = a1;
    }
    goto LABEL_40;
  }
  uint64_t v38 = v37;
  [v37 sizeThatFits:a1, a2];
  double v17 = floor(v39);
  double v41 = floor(v40);
  uint64_t v42 = v27;
  uint64_t v43 = sub_100020D08();
  os_log_type_t v44 = sub_100021748();
  if (os_log_type_enabled(v43, v44))
  {
    uint64_t v45 = swift_slowAlloc();
    uint64_t v70 = swift_slowAlloc();
    *(_DWORD *)uint64_t v45 = 136316162;
    uint64_t v46 = *(void **)&v42[OBJC_IVAR____TtC22AskToMessagesExtension22MessagesViewController_selectedPayload];
    if (v46)
    {
      id v47 = v46;
      uint64_t v48 = sub_100021568();
      unint64_t v50 = v49;
    }
    else
    {
      unint64_t v50 = 0xE600000000000000;
      uint64_t v48 = 0x3E656E6F6E3CLL;
    }
    sub_100014C7C(v48, v50, &v70);
    sub_100021768();

    swift_bridgeObjectRelease();
    *(_WORD *)(v45 + 12) = 2048;
    sub_100021768();
    *(_WORD *)(v45 + 22) = 2048;
    sub_100021768();
    *(_WORD *)(v45 + 32) = 2048;
    sub_100021768();
    *(_WORD *)(v45 + 42) = 2048;
    sub_100021768();
    _os_log_impl((void *)&_mh_execute_header, v43, v44, "%s: contentSizeThatFits calculated size %f x %f in fitting size %f x %f", (uint8_t *)v45, 0x34u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v7 = v69;
  }
  else
  {
  }
  *uint64_t v16 = a1;
  v16[1] = a2;
  v16[2] = v17;
  v16[3] = v41;
  *((unsigned char *)v16 + 32) = 0;
  uint64_t v5 = 0x3E656E6F6E3CLL;
LABEL_41:
  uint64_t v60 = v7;
  uint64_t v61 = sub_100020D08();
  os_log_type_t v62 = sub_100021748();
  if (os_log_type_enabled(v61, v62))
  {
    uint64_t v63 = swift_slowAlloc();
    uint64_t v70 = swift_slowAlloc();
    *(_DWORD *)uint64_t v63 = 136316162;
    id v64 = *(void **)&v60[OBJC_IVAR____TtC22AskToMessagesExtension22MessagesViewController_selectedPayload];
    if (v64)
    {
      id v65 = v64;
      uint64_t v5 = sub_100021568();
      unint64_t v67 = v66;
    }
    else
    {
      unint64_t v67 = 0xE600000000000000;
    }
    sub_100014C7C(v5, v67, &v70);
    sub_100021768();

    swift_bridgeObjectRelease();
    *(_WORD *)(v63 + 12) = 2048;
    sub_100021768();
    *(_WORD *)(v63 + 22) = 2048;
    sub_100021768();
    *(_WORD *)(v63 + 32) = 2048;
    sub_100021768();
    *(_WORD *)(v63 + 42) = 2048;
    sub_100021768();
    _os_log_impl((void *)&_mh_execute_header, v61, v62, "%s: contentSizeThatFits returning %f x %f in fitting size %f x %f", (uint8_t *)v63, 0x34u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  return v17;
}

void sub_100011FD8(void *a1)
{
  uint64_t v2 = sub_1000214F8();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2, v4);
  uint64_t v6 = (char *)&v98 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for MessagesContext();
  __chkstk_darwin(v7, v8);
  uint64_t v10 = (char *)&v98 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v11 = [a1 selectedMessage];
  if (v11)
  {
    id v12 = v11;
    uint64_t v107 = v2;
    uint64_t v108 = a1;
    uint64_t v103 = v7;
    id v104 = v10;
    id v105 = v6;
    uint64_t v106 = v3;
    uint64_t v13 = sub_100020CE8();
    uint64_t v14 = *(void *)(v13 - 8);
    __chkstk_darwin(v13, v15);
    uint64_t v102 = v16;
    uint64_t v111 = (char *)&v98 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v17 = sub_1000046A4(&qword_10002CE48);
    uint64_t v18 = *(void *)(*(void *)(v17 - 8) + 64);
    __chkstk_darwin(v17 - 8, v19);
    unint64_t v20 = (v18 + 15) & 0xFFFFFFFFFFFFFFF0;
    id v21 = [v12 session];
    if (!v21)
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56))((char *)&v98 - v20, 1, 1, v13);
LABEL_13:
      sub_1000153E0((uint64_t)&v98 - v20);
      if (qword_10002C798 != -1) {
        swift_once();
      }
      uint64_t v35 = sub_100020D28();
      sub_10000AB28(v35, (uint64_t)qword_10002D2E8);
      uint64_t v36 = sub_100020D08();
      os_log_type_t v37 = sub_100021728();
      if (os_log_type_enabled(v36, v37))
      {
        uint64_t v38 = (uint8_t *)swift_slowAlloc();
        uint64_t v114 = swift_slowAlloc();
        *(_DWORD *)uint64_t v38 = 136315138;
        uint64_t v113 = sub_100014C7C(0xD00000000000001DLL, 0x8000000100023A20, &v114);
        sub_100021768();
        _os_log_impl((void *)&_mh_execute_header, v36, v37, "%s called with nil message.session", v38, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }

      sub_100014024();
      return;
    }
    uint64_t v22 = v21;
    uint64_t v109 = v14;
    uint64_t v110 = v13;
    id v23 = [v21 identifier];

    __chkstk_darwin(v24, v25);
    if (v23)
    {
      sub_100020CD8();

      uint64_t v26 = v109;
      uint64_t v27 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v109 + 56);
      uint64_t v28 = (char *)&v98 - v20;
      uint64_t v29 = 0;
    }
    else
    {
      uint64_t v26 = v109;
      uint64_t v27 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v109 + 56);
      uint64_t v28 = (char *)&v98 - v20;
      uint64_t v29 = 1;
    }
    uint64_t v34 = v110;
    v27(v28, v29, 1, v110);
    sub_100015440((uint64_t)&v98 - v20, (uint64_t)&v98 - v20);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v26 + 48))((char *)&v98 - v20, 1, v34) == 1) {
      goto LABEL_13;
    }
    os_log_type_t v100 = &v98;
    (*(void (**)(char *, char *, uint64_t))(v26 + 32))(v111, (char *)&v98 - v20, v34);
    if (qword_10002C798 != -1) {
      swift_once();
    }
    uint64_t v39 = sub_100020D28();
    sub_10000AB28(v39, (uint64_t)qword_10002D2E8);
    id v40 = v12;
    double v41 = sub_100020D08();
    os_log_type_t v42 = sub_100021748();
    if (os_log_type_enabled(v41, v42))
    {
      uint64_t v43 = swift_slowAlloc();
      uint64_t v98 = (void *)swift_slowAlloc();
      uint64_t v44 = swift_slowAlloc();
      uint64_t v101 = v40;
      uint64_t v99 = v44;
      uint64_t v114 = v44;
      *(_DWORD *)uint64_t v43 = 136315394;
      uint64_t v113 = sub_100014C7C(0xD00000000000001DLL, 0x8000000100023A20, &v114);
      sub_100021768();
      *(_WORD *)(v43 + 12) = 2112;
      uint64_t v113 = (uint64_t)v101;
      uint64_t v45 = v101;
      sub_100021768();
      *uint64_t v98 = v12;

      _os_log_impl((void *)&_mh_execute_header, v41, v42, "%s called with message %@", (uint8_t *)v43, 0x16u);
      sub_1000046A4(&qword_10002CB40);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      id v40 = v101;
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    uint64_t v46 = v108;
    uint64_t v47 = *(void *)(v112 + OBJC_IVAR____TtC22AskToMessagesExtension22MessagesViewController_messageParser);
    uint64_t v48 = (void *)sub_10000D0D4(v40);
    uint64_t v99 = v47;
    uint64_t v49 = qword_10002C7A0;
    id v50 = v48;
    if (v49 != -1) {
      swift_once();
    }
    sub_10000AB28(v39, (uint64_t)qword_10002D300);
    id v51 = v50;
    uint64_t v52 = sub_100020D08();
    os_log_type_t v53 = sub_100021748();
    int v54 = v53;
    if (os_log_type_enabled(v52, v53))
    {
      uint64_t v55 = swift_slowAlloc();
      LODWORD(v98) = v54;
      uint64_t v56 = v55;
      uint64_t v57 = (void *)swift_slowAlloc();
      uint64_t v114 = swift_slowAlloc();
      *(_DWORD *)uint64_t v56 = 136315650;
      uint64_t v58 = sub_100021568();
      uint64_t v113 = sub_100014C7C(v58, v59, &v114);
      sub_100021768();

      swift_bridgeObjectRelease();
      *(_WORD *)(v56 + 12) = 2080;
      uint64_t v60 = sub_1000215B8();
      if (v61)
      {
        unint64_t v62 = v61;
      }
      else
      {
        uint64_t v60 = 7104878;
        unint64_t v62 = 0xE300000000000000;
      }
      uint64_t v113 = sub_100014C7C(v60, v62, &v114);
      sub_100021768();

      swift_bridgeObjectRelease();
      *(_WORD *)(v56 + 22) = 2112;
      uint64_t v63 = sub_1000215C8();
      uint64_t v113 = v63;
      sub_100021768();
      *uint64_t v57 = v63;

      _os_log_impl((void *)&_mh_execute_header, v52, (os_log_type_t)v98, "Parsed AskTo payload from MSMessage. Messages GUID: %s, clientBundleIdentifier: %s question: %@", (uint8_t *)v56, 0x20u);
      sub_1000046A4(&qword_10002CB40);
      swift_arrayDestroy();
      uint64_t v46 = v108;
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    id v64 = *(void **)(v112 + OBJC_IVAR____TtC22AskToMessagesExtension22MessagesViewController_selectedPayload);
    *(void *)(v112 + OBJC_IVAR____TtC22AskToMessagesExtension22MessagesViewController_selectedPayload) = v51;
    id v65 = v51;

    unsigned __int8 v66 = [v40 isFromMe];
    uint64_t v101 = v40;
    if (v66) {
      goto LABEL_41;
    }
    id v67 = [v40 senderAddress];
    if (v67)
    {
      id v68 = v67;
      uint64_t v69 = sub_100021638();
      uint64_t v71 = v70;
    }
    else
    {
      uint64_t v69 = 0;
      uint64_t v71 = 0;
    }
    id v72 = [v46 senderAddress];
    uint64_t v73 = sub_100021638();
    uint64_t v75 = v74;

    if (v71)
    {
      if (v69 == v73 && v71 == v75)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
LABEL_41:
        LODWORD(v102) = 1;
LABEL_43:
        uint64_t v84 = sub_100021568();
        uint64_t v86 = v85;
        id v87 = [v46 senderAddress];
        uint64_t v88 = sub_100021638();
        uint64_t v90 = v89;

        uint64_t v91 = v103;
        uint64_t v92 = (uint64_t)v104;
        uint64_t v94 = v109;
        uint64_t v93 = v110;
        uint64_t v95 = v111;
        (*(void (**)(char *, char *, uint64_t))(v109 + 16))(&v104[*(int *)(v103 + 28)], v111, v110);
        *(void *)uint64_t v92 = v84;
        *(void *)(v92 + 8) = v86;
        *(void *)(v92 + 16) = v88;
        *(void *)(v92 + 24) = v90;
        *(unsigned char *)(v92 + 32) = v102 & 1;
        *(void *)(v92 + *(int *)(v91 + 32) + 8) = &off_1000294F0;
        swift_unknownObjectWeakInit();
        uint64_t v96 = (uint64_t)v105;
        char v97 = v101;
        sub_10000B60C(v101, (uint64_t)v105);

        sub_100015634(v96, v92);
        (*(void (**)(uint64_t, uint64_t))(v106 + 8))(v96, v107);
        sub_10000AB60(v92, (uint64_t (*)(void))type metadata accessor for MessagesContext);
        (*(void (**)(char *, uint64_t))(v94 + 8))(v95, v93);
        return;
      }
      char v76 = sub_100021898();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v76) {
        goto LABEL_41;
      }
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    id v77 = [v101 senderParticipantIdentifier];
    uint64_t v78 = v102;
    __chkstk_darwin(v77, v79);
    sub_100020CD8();

    id v80 = [v46 localParticipantIdentifier];
    __chkstk_darwin(v80, v81);
    sub_100020CD8();

    LODWORD(v102) = sub_100020CC8();
    BOOL v82 = *(void (**)(char *, uint64_t))(v109 + 8);
    uint64_t v83 = v110;
    v82((char *)&v98 - ((v78 + 15) & 0xFFFFFFFFFFFFFFF0), v110);
    v82((char *)&v98 - ((v78 + 15) & 0xFFFFFFFFFFFFFFF0), v83);
    uint64_t v46 = v108;
    goto LABEL_43;
  }
  if (qword_10002C798 != -1) {
    swift_once();
  }
  uint64_t v30 = sub_100020D28();
  sub_10000AB28(v30, (uint64_t)qword_10002D2E8);
  uint64_t v31 = sub_100020D08();
  os_log_type_t v32 = sub_100021728();
  if (os_log_type_enabled(v31, v32))
  {
    uint64_t v33 = (uint8_t *)swift_slowAlloc();
    uint64_t v114 = swift_slowAlloc();
    *(_DWORD *)uint64_t v33 = 136315138;
    uint64_t v113 = sub_100014C7C(0xD00000000000001DLL, 0x8000000100023A20, &v114);
    sub_100021768();
    _os_log_impl((void *)&_mh_execute_header, v31, v32, "%s called with conversation that had no selected message", v33, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  sub_100014024();
}

void sub_100012ECC(void *a1)
{
  uint64_t v2 = v1;
  if (qword_10002C798 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_100020D28();
  sub_10000AB28(v4, (uint64_t)qword_10002D2E8);
  uint64_t v5 = sub_100020D08();
  os_log_type_t v6 = sub_100021718();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 136315138;
    sub_100014C7C(0xD000000000000017, 0x8000000100023A80, &v8);
    sub_100021768();
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "%s called", v7, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  [v2 setProvidesExplicitSizeSnapshot];
  [v2 setNeedsSizeMatchBeforeSnapshotSwap];
  sub_100011FD8(a1);
}

uint64_t sub_1000131F8(double a1, double a2)
{
  id v5 = [v2 view];
  id v6 = [objc_allocWithZone((Class)UIGraphicsImageRenderer) initWithSize:a1, a2];
  uint64_t v7 = swift_allocObject();
  *(double *)(v7 + 16) = a1;
  *(double *)(v7 + 24) = a2;
  *(void *)(v7 + 32) = v5;
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = sub_100015368;
  *(void *)(v8 + 24) = v7;
  v13[4] = sub_1000153A0;
  v13[5] = v8;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 1107296256;
  v13[2] = sub_1000133C0;
  v13[3] = &unk_100029560;
  uint64_t v9 = _Block_copy(v13);
  id v10 = v5;
  swift_retain();
  swift_release();
  id v11 = [v6 imageWithActions:v9];

  _Block_release(v9);
  LOBYTE(v6) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if ((v6 & 1) == 0) {
    return (uint64_t)v11;
  }
  __break(1u);
  return result;
}

void sub_1000133C0(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void (**)(void))(a1 + 32);
  id v3 = a2;
  v2();
}

void sub_10001340C(void *a1, void *a2)
{
  if (qword_10002C798 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_100020D28();
  uint64_t v6 = sub_10000AB28(v5, (uint64_t)qword_10002D2E8);
  uint64_t v7 = v2;
  uint64_t v8 = sub_100020D08();
  os_log_type_t v9 = sub_100021748();
  if (os_log_type_enabled(v8, v9))
  {
    id v89 = a2;
    uint64_t v10 = swift_slowAlloc();
    uint64_t v92 = swift_slowAlloc();
    *(_DWORD *)uint64_t v10 = 136315394;
    id v11 = *(void **)&v7[OBJC_IVAR____TtC22AskToMessagesExtension22MessagesViewController_selectedPayload];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = sub_100021568();
      unint64_t v15 = v14;
    }
    else
    {
      unint64_t v15 = 0xE600000000000000;
      uint64_t v13 = 0x3E656E6F6E3CLL;
    }
    sub_100014C7C(v13, v15, &v92);
    sub_100021768();

    swift_bridgeObjectRelease();
    *(_WORD *)(v10 + 12) = 2080;
    sub_100014C7C(0xD000000000000023, 0x80000001000237E0, &v92);
    sub_100021768();
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "%s: %s called", (uint8_t *)v10, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    a2 = v89;
    uint64_t v16 = (SEL *)&unk_10002C000;
    if (a1) {
      goto LABEL_15;
    }
  }
  else
  {

    uint64_t v16 = (SEL *)&unk_10002C000;
    if (a1)
    {
LABEL_15:
      uint64_t v43 = v7;
      id v44 = a1;
      uint64_t v45 = sub_100020D08();
      os_log_type_t v46 = sub_100021748();
      if (os_log_type_enabled(v45, v46))
      {
        uint64_t v88 = v6;
        id v91 = a2;
        uint64_t v47 = (uint8_t *)swift_slowAlloc();
        uint64_t v92 = swift_slowAlloc();
        *(_DWORD *)uint64_t v47 = 136315138;
        uint64_t v48 = *(void **)&v43[OBJC_IVAR____TtC22AskToMessagesExtension22MessagesViewController_selectedPayload];
        if (v48)
        {
          id v49 = v48;
          uint64_t v50 = sub_100021568();
          unint64_t v52 = v51;
        }
        else
        {
          unint64_t v52 = 0xE600000000000000;
          uint64_t v50 = 0x3E656E6F6E3CLL;
        }
        sub_100014C7C(v50, v52, &v92);
        sub_100021768();

        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v45, v46, "%s: Removing existing child view controller", v47, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        a2 = v91;
      }
      else
      {
      }
      [v44 willMoveToParentViewController:0, v88];
      uint64_t v16 = (SEL *)&unk_10002C000;
      id v62 = [v44 view];
      if (!v62)
      {
        __break(1u);
        return;
      }
      uint64_t v63 = v62;
      [v62 removeFromSuperview];

      [v44 removeFromParentViewController];
      if (!a2) {
        goto LABEL_29;
      }
      goto LABEL_8;
    }
  }
  if (!a2)
  {
LABEL_29:
    id v64 = v7;
    id v65 = sub_100020D08();
    os_log_type_t v66 = sub_100021728();
    if (os_log_type_enabled(v65, v66))
    {
      id v67 = (uint8_t *)swift_slowAlloc();
      uint64_t v92 = swift_slowAlloc();
      *(_DWORD *)id v67 = 136315138;
      id v68 = *(void **)&v64[OBJC_IVAR____TtC22AskToMessagesExtension22MessagesViewController_selectedPayload];
      if (v68)
      {
        id v69 = v68;
        uint64_t v70 = sub_100021568();
        unint64_t v72 = v71;
      }
      else
      {
        unint64_t v72 = 0xE600000000000000;
        uint64_t v70 = 0x3E656E6F6E3CLL;
      }
      sub_100014C7C(v70, v72, &v92);
      sub_100021768();

      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v65, v66, "%s: Received request to replace child view controller with nil.", v67, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    return;
  }
LABEL_8:
  id v17 = a2;
  id v18 = [v7 v16[134]];
  if (!v18) {
    goto LABEL_20;
  }
  uint64_t v19 = v18;
  id v20 = [v17 v16[134]];
  if (!v20)
  {

LABEL_20:
    os_log_type_t v53 = v7;
    int v54 = sub_100020D08();
    os_log_type_t v55 = sub_100021728();
    if (os_log_type_enabled(v54, v55))
    {
      uint64_t v56 = (uint8_t *)swift_slowAlloc();
      uint64_t v92 = swift_slowAlloc();
      *(_DWORD *)uint64_t v56 = 136315138;
      uint64_t v57 = *(void **)&v53[OBJC_IVAR____TtC22AskToMessagesExtension22MessagesViewController_selectedPayload];
      if (v57)
      {
        id v58 = v57;
        uint64_t v59 = sub_100021568();
        unint64_t v61 = v60;
      }
      else
      {
        unint64_t v61 = 0xE600000000000000;
        uint64_t v59 = 0x3E656E6F6E3CLL;
      }
      sub_100014C7C(v59, v61, &v92);
      sub_100021768();

      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v54, v55, "%s: Missing views. Not adding new child view controller to view hierarchy.", v56, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    return;
  }
  id v21 = v20;
  id v90 = v17;
  [v7 addChildViewController:v17];
  uint64_t v22 = self;
  id v23 = [v22 systemGray5Color];
  [v19 setBackgroundColor:v23];

  id v24 = [v22 clearColor];
  [v21 setBackgroundColor:v24];

  [v21 setMinimumContentSizeCategory:UIContentSizeCategorySmall];
  [v21 setMaximumContentSizeCategory:UIContentSizeCategoryAccessibilityExtraLarge];
  [v19 addSubview:v21];
  [v21 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v7 _balloonMaskEdgeInsets];
  double v26 = v25;
  double v28 = v27;
  double v30 = v29;
  double v32 = v31;
  uint64_t v33 = v7;
  uint64_t v34 = sub_100020D08();
  os_log_type_t v35 = sub_100021748();
  if (os_log_type_enabled(v34, v35))
  {
    uint64_t v36 = swift_slowAlloc();
    uint64_t v92 = swift_slowAlloc();
    *(_DWORD *)uint64_t v36 = 136316162;
    os_log_type_t v37 = v33;
    uint64_t v38 = *(void **)&v33[OBJC_IVAR____TtC22AskToMessagesExtension22MessagesViewController_selectedPayload];
    if (v38)
    {
      id v39 = v38;
      uint64_t v40 = sub_100021568();
      unint64_t v42 = v41;
    }
    else
    {
      unint64_t v42 = 0xE600000000000000;
      uint64_t v40 = 0x3E656E6F6E3CLL;
    }
    sub_100014C7C(v40, v42, &v92);
    sub_100021768();
    uint64_t v33 = v37;

    swift_bridgeObjectRelease();
    *(_WORD *)(v36 + 12) = 2048;
    sub_100021768();
    *(_WORD *)(v36 + 22) = 2048;
    sub_100021768();
    *(_WORD *)(v36 + 32) = 2048;
    sub_100021768();
    *(_WORD *)(v36 + 42) = 2048;
    sub_100021768();
    _os_log_impl((void *)&_mh_execute_header, v34, v35, "%s: Adding insets to child view: {%f, %f, %f, %f}", (uint8_t *)v36, 0x34u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  uint64_t v73 = self;
  sub_1000046A4(&qword_10002CC88);
  uint64_t v74 = swift_allocObject();
  *(_OWORD *)(v74 + 16) = xmmword_1000225F0;
  id v75 = [v21 leadingAnchor];
  id v76 = [v19 leadingAnchor];
  id v77 = [v75 constraintEqualToAnchor:v76 constant:v28];

  *(void *)(v74 + 32) = v77;
  id v78 = [v19 trailingAnchor];
  id v79 = [v21 trailingAnchor];
  id v80 = [v78 constraintEqualToAnchor:v79 constant:v32];

  *(void *)(v74 + 40) = v80;
  id v81 = [v21 topAnchor];
  id v82 = [v19 topAnchor];
  id v83 = [v81 constraintEqualToAnchor:v82 constant:v26];

  *(void *)(v74 + 48) = v83;
  id v84 = [v19 bottomAnchor];
  id v85 = [v21 bottomAnchor];
  id v86 = [v84 constraintEqualToAnchor:v85 constant:v30];

  *(void *)(v74 + 56) = v86;
  uint64_t v92 = v74;
  sub_1000216B8();
  sub_100015F5C(0, &qword_10002CE38);
  id v87 = (void *)sub_100021688();
  swift_bridgeObjectRelease();
  [v73 activateConstraints:v87];

  [v90 didMoveToParentViewController:v33];
}

void sub_100014024()
{
  uint64_t v1 = v0;
  uint64_t v2 = *(void *)&v0[OBJC_IVAR____TtC22AskToMessagesExtension22MessagesViewController_balloonContentContainer];
  id v3 = *(void **)(v2 + 16);
  uint64_t v4 = *(void **)(v2 + 24);
  *(void *)(v2 + 16) = 0;
  id v5 = v4;

  uint64_t v6 = objc_allocWithZone((Class)sub_1000046A4(&qword_10002CE30));
  v6[*(void *)(qword_10002D2D8 + (swift_isaMask & *(void *)v6) + 16)] = 0;
  uint64_t v7 = sub_100021138();
  uint64_t v8 = *(void **)(v2 + 24);
  *(void *)(v2 + 24) = v7;

  os_log_type_t v9 = *(void **)(v2 + 24);
  id v10 = v9;
  sub_10001340C(v4, v9);

  [v1 requestResize];
}

id sub_100014188(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = OBJC_IVAR____TtC22AskToMessagesExtension22MessagesViewController_messageParser;
  type metadata accessor for MessageParser();
  *(void *)&v3[v6] = swift_allocObject();
  uint64_t v7 = OBJC_IVAR____TtC22AskToMessagesExtension22MessagesViewController_balloonContentContainer;
  uint64_t v19 = &type metadata for AskToBalloonContentFactory;
  id v20 = &off_100029448;
  type metadata accessor for BalloonContentContainer();
  uint64_t v8 = (void *)swift_allocObject();
  uint64_t v9 = sub_100015CD8((uint64_t)v18, (uint64_t)&type metadata for AskToBalloonContentFactory);
  __chkstk_darwin(v9, v9);
  (*(void (**)(void))(v10 + 16))();
  v8[7] = &type metadata for AskToBalloonContentFactory;
  v8[8] = &off_100029448;
  v8[2] = 0;
  v8[3] = 0;
  id v11 = v3;
  sub_10001133C((uint64_t)v18);
  *(void *)&v3[v7] = v8;
  id v12 = &v11[OBJC_IVAR____TtC22AskToMessagesExtension22MessagesViewController_cachedSizeInfo];
  *(_OWORD *)id v12 = 0u;
  *((_OWORD *)v12 + 1) = 0u;
  v12[32] = 1;
  *(void *)&v11[OBJC_IVAR____TtC22AskToMessagesExtension22MessagesViewController_selectedPayload] = 0;

  if (a2)
  {
    uint64_t v13 = (void *)sub_100021618();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v13 = 0;
  }
  unint64_t v14 = (objc_class *)type metadata accessor for MessagesViewController();
  v17.receiver = v11;
  v17.super_class = v14;
  id v15 = [super initWithNibName:v13 bundle:a3];

  return v15;
}

id sub_1000143B0(void *a1)
{
  uint64_t v3 = OBJC_IVAR____TtC22AskToMessagesExtension22MessagesViewController_messageParser;
  type metadata accessor for MessageParser();
  *(void *)&v1[v3] = swift_allocObject();
  uint64_t v4 = OBJC_IVAR____TtC22AskToMessagesExtension22MessagesViewController_balloonContentContainer;
  id v15 = &type metadata for AskToBalloonContentFactory;
  uint64_t v16 = &off_100029448;
  type metadata accessor for BalloonContentContainer();
  id v5 = (void *)swift_allocObject();
  uint64_t v6 = sub_100015CD8((uint64_t)v14, (uint64_t)&type metadata for AskToBalloonContentFactory);
  __chkstk_darwin(v6, v6);
  (*(void (**)(void))(v7 + 16))();
  v5[7] = &type metadata for AskToBalloonContentFactory;
  v5[8] = &off_100029448;
  v5[2] = 0;
  v5[3] = 0;
  uint64_t v8 = v1;
  sub_10001133C((uint64_t)v14);
  *(void *)&v1[v4] = v5;
  uint64_t v9 = &v8[OBJC_IVAR____TtC22AskToMessagesExtension22MessagesViewController_cachedSizeInfo];
  *(_OWORD *)uint64_t v9 = 0u;
  *((_OWORD *)v9 + 1) = 0u;
  v9[32] = 1;
  *(void *)&v8[OBJC_IVAR____TtC22AskToMessagesExtension22MessagesViewController_selectedPayload] = 0;

  uint64_t v10 = (objc_class *)type metadata accessor for MessagesViewController();
  v13.receiver = v8;
  v13.super_class = v10;
  [super initWithCoder:a1];

  return v11;
}

id sub_100014564(char a1)
{
  uint64_t v3 = OBJC_IVAR____TtC22AskToMessagesExtension22MessagesViewController_messageParser;
  type metadata accessor for MessageParser();
  *(void *)&v1[v3] = swift_allocObject();
  uint64_t v4 = OBJC_IVAR____TtC22AskToMessagesExtension22MessagesViewController_balloonContentContainer;
  unint64_t v14 = &type metadata for AskToBalloonContentFactory;
  id v15 = &off_100029448;
  type metadata accessor for BalloonContentContainer();
  id v5 = (void *)swift_allocObject();
  uint64_t v6 = sub_100015CD8((uint64_t)v13, (uint64_t)&type metadata for AskToBalloonContentFactory);
  __chkstk_darwin(v6, v6);
  (*(void (**)(void))(v7 + 16))();
  v5[7] = &type metadata for AskToBalloonContentFactory;
  v5[8] = &off_100029448;
  v5[2] = 0;
  v5[3] = 0;
  uint64_t v8 = v1;
  sub_10001133C((uint64_t)v13);
  *(void *)&v1[v4] = v5;
  uint64_t v9 = &v8[OBJC_IVAR____TtC22AskToMessagesExtension22MessagesViewController_cachedSizeInfo];
  *(_OWORD *)uint64_t v9 = 0u;
  *((_OWORD *)v9 + 1) = 0u;
  v9[32] = 1;
  *(void *)&v8[OBJC_IVAR____TtC22AskToMessagesExtension22MessagesViewController_selectedPayload] = 0;

  uint64_t v10 = (objc_class *)type metadata accessor for MessagesViewController();
  v12.receiver = v8;
  v12.super_class = v10;
  return [super initWithShouldBeSheetPresentationControllerDelegate:a1 & 1];
}

id sub_10001470C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MessagesViewController();
  return [super dealloc];
}

uint64_t type metadata accessor for MessagesViewController()
{
  return self;
}

void sub_1000147C0(int64_t *a1, uint64_t a2, uint64_t a3)
{
  if (qword_10002C798 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_100020D28();
  sub_10000AB28(v7, (uint64_t)qword_10002D2E8);
  uint64_t v8 = v3;
  uint64_t v9 = sub_100020D08();
  os_log_type_t v10 = sub_100021748();
  if (os_log_type_enabled(v9, v10))
  {
    os_log_type_t v35 = a1;
    uint64_t v11 = swift_slowAlloc();
    aBlock[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v11 = 136315394;
    objc_super v12 = *(void **)&v8[OBJC_IVAR____TtC22AskToMessagesExtension22MessagesViewController_selectedPayload];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = sub_100021568();
      unint64_t v16 = v15;
    }
    else
    {
      unint64_t v16 = 0xE600000000000000;
      uint64_t v14 = 0x3E656E6F6E3CLL;
    }
    sub_100014C7C(v14, v16, aBlock);
    sub_100021768();

    swift_bridgeObjectRelease();
    *(_WORD *)(v11 + 12) = 2080;
    sub_100014C7C(0xD00000000000001BLL, 0x8000000100023AD0, aBlock);
    sub_100021768();
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "%s: %s called", (uint8_t *)v11, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    a1 = v35;
  }
  else
  {
  }
  id v36 = v8;
  int64_t v17 = a1[2];
  if (v17)
  {
    uint64_t v33 = a3;
    uint64_t v34 = a2;
    aBlock[0] = (uint64_t)&_swiftEmptyArrayStorage;
    sub_1000154A8(0, v17, 0);
    uint64_t v18 = aBlock[0];
    uint64_t v19 = a1;
    id v20 = a1 + 5;
    int64_t v21 = v17;
    do
    {
      uint64_t v23 = *(v20 - 1);
      uint64_t v22 = *v20;
      aBlock[0] = v18;
      unint64_t v24 = *(void *)(v18 + 16);
      unint64_t v25 = *(void *)(v18 + 24);
      swift_bridgeObjectRetain();
      if (v24 >= v25 >> 1)
      {
        sub_1000154A8(v25 > 1, v24 + 1, 1);
        uint64_t v18 = aBlock[0];
      }
      v20 += 3;
      *(void *)(v18 + 16) = v24 + 1;
      uint64_t v26 = v18 + 16 * v24;
      *(void *)(v26 + 32) = v23;
      *(void *)(v26 + 40) = v22;
      --v21;
    }
    while (v21);
    a3 = v33;
    a1 = v19;
    a2 = v34;
  }
  double v27 = (void *)sub_100021688();
  swift_bridgeObjectRelease();
  if (v17)
  {
    aBlock[0] = (uint64_t)&_swiftEmptyArrayStorage;
    sub_1000217E8();
    double v28 = a1 + 6;
    do
    {
      uint64_t v29 = *v28;
      v28 += 3;
      [objc_allocWithZone((Class)NSNumber) initWithInteger:v29];
      sub_1000217C8();
      sub_1000217F8();
      sub_100021808();
      sub_1000217D8();
      --v17;
    }
    while (v17);
  }
  sub_100015F5C(0, &qword_10002CE60);
  double v30 = (void *)sub_100021688();
  swift_bridgeObjectRelease();
  uint64_t v31 = swift_allocObject();
  *(void *)(v31 + 16) = a2;
  *(void *)(v31 + 24) = a3;
  aBlock[4] = (uint64_t)sub_100015FD0;
  aBlock[5] = v31;
  aBlock[0] = (uint64_t)_NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_100014C28;
  aBlock[3] = (uint64_t)&unk_1000295B0;
  double v32 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  [v36 _presentAlertSheetWith:v27 styles:v30 completion:v32];
  _Block_release(v32);
}

uint64_t sub_100014C28(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);

  return swift_release();
}

uint64_t sub_100014C7C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100014D50(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_1000152D4((uint64_t)v12, *a3);
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
      sub_1000152D4((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_10001133C((uint64_t)v12);
  return v7;
}

uint64_t sub_100014D50(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_100021778();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_100014F0C(a5, a6);
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
  uint64_t v8 = sub_1000217B8();
  if (!v8)
  {
    sub_100021818();
    __break(1u);
LABEL_17:
    uint64_t result = sub_100021878();
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

uint64_t sub_100014F0C(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100014FA4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100015184(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100015184(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100014FA4(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_10001511C(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_100021798();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_100021818();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_100021668();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_100021878();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_100021818();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_10001511C(uint64_t a1, uint64_t a2)
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
  sub_1000046A4(&qword_10002CE40);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_100015184(char a1, int64_t a2, char a3, char *a4)
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
    sub_1000046A4(&qword_10002CE40);
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
  id v13 = a4 + 32;
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
  uint64_t result = sub_100021878();
  __break(1u);
  return result;
}

uint64_t sub_1000152D4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100015330()
{
  return _swift_deallocObject(v0, 40, 7);
}

id sub_100015368()
{
  id result = *(id *)(v0 + 32);
  if (result) {
    return [result drawViewHierarchyInRect:1 afterScreenUpdates:0.0, 0.0, *(double *)(v0 + 16), *(double *)(v0 + 24)];
  }
  return result;
}

uint64_t sub_100015390()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000153A0()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_1000153C8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1000153D8()
{
  return swift_release();
}

uint64_t sub_1000153E0(uint64_t a1)
{
  uint64_t v2 = sub_1000046A4(&qword_10002CE48);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100015440(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000046A4(&qword_10002CE48);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000154A8(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_1000154C8(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_1000154C8(char a1, int64_t a2, char a3, char *a4)
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
    sub_1000046A4(&qword_10002CE68);
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
  id v13 = v10 + 32;
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
  uint64_t result = sub_100021878();
  __break(1u);
  return result;
}

void sub_100015634(uint64_t a1, uint64_t a2)
{
  uint64_t v67 = a2;
  uint64_t v4 = type metadata accessor for MessagesContext();
  uint64_t v6 = __chkstk_darwin(v4 - 8, v5);
  uint64_t v8 = (char *)&v58 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6, v9);
  int64_t v11 = (char *)&v58 - v10;
  uint64_t v12 = sub_1000214F8();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12, v14);
  unint64_t v16 = (char *)&v58 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = type metadata accessor for BalloonView();
  uint64_t v19 = __chkstk_darwin(v17, v18);
  uint64_t v21 = __chkstk_darwin(v19, v20);
  unint64_t v24 = (char *)&v58 - v23;
  unint64_t v25 = v2;
  uint64_t v26 = *(void **)&v2[OBJC_IVAR____TtC22AskToMessagesExtension22MessagesViewController_selectedPayload];
  if (v26)
  {
    uint64_t v27 = *(void *)&v2[OBJC_IVAR____TtC22AskToMessagesExtension22MessagesViewController_balloonContentContainer];
    uint64_t v61 = v13;
    uint64_t v62 = v27;
    unint64_t v60 = v8;
    uint64_t v29 = *(void **)(v27 + 16);
    id v65 = *(void **)(v27 + 24);
    double v28 = v65;
    *(void *)(v27 + 16) = v26;
    uint64_t v63 = v22;
    id v58 = (int *)v21;
    uint64_t v30 = v12;
    id v31 = v26;
    id v66 = v28;

    double v32 = *(void (**)(char *, uint64_t, uint64_t))(v13 + 16);
    uint64_t v59 = v16;
    uint64_t v33 = v30;
    v32(v16, a1, v30);
    id v64 = v25;
    sub_100015C70(v67, (uint64_t)v11, (uint64_t (*)(void))type metadata accessor for MessagesContext);
    *(void *)unint64_t v24 = swift_getKeyPath();
    v24[8] = 0;
    id v34 = v31;
    *((void *)v24 + 2) = sub_1000215C8();
    *((void *)v24 + 3) = sub_1000215D8();
    os_log_type_t v35 = v58;
    v32(&v24[v58[7]], (uint64_t)v16, v33);
    sub_100015C70((uint64_t)v11, (uint64_t)&v24[v35[8]], (uint64_t (*)(void))type metadata accessor for MessagesContext);
    uint64_t v36 = sub_1000215B8();
    os_log_type_t v37 = (uint64_t *)&v24[v35[9]];
    *os_log_type_t v37 = v36;
    v37[1] = v38;
    uint64_t v39 = (uint64_t)v60;
    sub_100015C70((uint64_t)v11, (uint64_t)v60, (uint64_t (*)(void))type metadata accessor for MessagesContext);
    type metadata accessor for ResponseSender();
    swift_allocObject();
    id v40 = v34;
    sub_100016C80(v39, (uint64_t)v40);
    unint64_t v41 = (uint64_t *)&v24[v35[10]];
    sub_100015C18();
    uint64_t v42 = sub_100020F88();
    uint64_t v44 = v43;

    sub_10000AB60((uint64_t)v11, (uint64_t (*)(void))type metadata accessor for MessagesContext);
    (*(void (**)(char *, uint64_t))(v61 + 8))(v59, v33);
    *unint64_t v41 = v42;
    v41[1] = v44;
    uint64_t v45 = objc_allocWithZone((Class)sub_1000046A4(&qword_10002CE58));
    v45[*(void *)(qword_10002D2D8 + (swift_isaMask & *(void *)v45) + 16)] = 0;
    sub_100015C70((uint64_t)v24, v63, (uint64_t (*)(void))type metadata accessor for BalloonView);
    uint64_t v46 = sub_100021138();
    sub_10000AB60((uint64_t)v24, (uint64_t (*)(void))type metadata accessor for BalloonView);
    uint64_t v47 = v62;
    uint64_t v48 = *(void **)(v62 + 24);
    *(void *)(v62 + 24) = v46;
    uint64_t v49 = v47;

    uint64_t v50 = *(void **)(v49 + 24);
    id v51 = v50;
    unint64_t v52 = v50;
    os_log_type_t v53 = v64;
    sub_10001340C(v65, v52);

    [v53 requestResize];
  }
  else
  {
    if (qword_10002C798 != -1) {
      swift_once();
    }
    uint64_t v54 = sub_100020D28();
    sub_10000AB28(v54, (uint64_t)qword_10002D2E8);
    os_log_type_t v55 = sub_100020D08();
    os_log_type_t v56 = sub_100021728();
    if (os_log_type_enabled(v55, v56))
    {
      uint64_t v57 = (uint8_t *)swift_slowAlloc();
      uint64_t v69 = swift_slowAlloc();
      *(_DWORD *)uint64_t v57 = 136315138;
      uint64_t v68 = sub_100014C7C(0xD00000000000001FLL, 0x8000000100023A40, &v69);
      sub_100021768();
      _os_log_impl((void *)&_mh_execute_header, v55, v56, "%s called with nil selectedPayload", v57, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    sub_100014024();
  }
}

uint64_t sub_100015BC4@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_100021018();
  *a1 = v3;
  return result;
}

uint64_t sub_100015BF0()
{
  return sub_100021028();
}

unint64_t sub_100015C18()
{
  unint64_t result = qword_10002CE50;
  if (!qword_10002CE50)
  {
    type metadata accessor for ResponseSender();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002CE50);
  }
  return result;
}

uint64_t sub_100015C70(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100015CD8(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

void sub_100015D28(void *a1)
{
  if (qword_10002C798 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_100020D28();
  sub_10000AB28(v3, (uint64_t)qword_10002D2E8);
  uint64_t v4 = v1;
  uint64_t v5 = sub_100020D08();
  os_log_type_t v6 = sub_100021718();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 136315394;
    uint64_t v8 = *(void **)&v4[OBJC_IVAR____TtC22AskToMessagesExtension22MessagesViewController_selectedPayload];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = sub_100021568();
      unint64_t v12 = v11;
    }
    else
    {
      unint64_t v12 = 0xE600000000000000;
      uint64_t v10 = 0x3E656E6F6E3CLL;
    }
    sub_100014C7C(v10, v12, &v13);
    sub_100021768();

    swift_bridgeObjectRelease();
    *(_WORD *)(v7 + 12) = 2080;
    sub_100014C7C(0xD00000000000001BLL, 0x8000000100023A60, &v13);
    sub_100021768();
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "%s: %s called", (uint8_t *)v7, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  sub_100011FD8(a1);
}

uint64_t sub_100015F5C(uint64_t a1, unint64_t *a2)
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

uint64_t sub_100015F98()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100015FD0()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

void *sub_100016000(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = (void *)a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v15 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (void *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *(void *)a1 = *a2;
    *(void *)(a1 + 8) = v7;
    uint64_t v8 = a2[3];
    *(void *)(a1 + 16) = a2[2];
    *(void *)(a1 + 24) = v8;
    uint64_t v9 = *(int *)(a3 + 28);
    uint64_t v10 = a1 + v9;
    uint64_t v11 = (uint64_t)a2 + v9;
    *(unsigned char *)(a1 + 32) = *((unsigned char *)a2 + 32);
    uint64_t v12 = sub_100020CE8();
    uint64_t v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v13(v10, v11, v12);
    uint64_t v14 = (uint64_t)a2 + *(int *)(a3 + 32);
    *(void *)(swift_unknownObjectWeakCopyInit() + 8) = *(void *)(v14 + 8);
  }
  return v4;
}

uint64_t sub_10001612C(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 28);
  uint64_t v5 = sub_100020CE8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);

  return swift_unknownObjectWeakDestroy();
}

uint64_t sub_1000161C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  uint64_t v7 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v7;
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  uint64_t v8 = *(int *)(a3 + 28);
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = sub_100020CE8();
  uint64_t v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v12(v9, v10, v11);
  uint64_t v13 = a2 + *(int *)(a3 + 32);
  *(void *)(swift_unknownObjectWeakCopyInit() + 8) = *(void *)(v13 + 8);
  return a1;
}

uint64_t sub_10001629C(uint64_t a1, uint64_t a2, uint64_t a3)
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
  uint64_t v6 = *(int *)(a3 + 28);
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_100020CE8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  uint64_t v10 = a2 + *(int *)(a3 + 32);
  *(void *)(swift_unknownObjectWeakCopyAssign() + 8) = *(void *)(v10 + 8);
  return a1;
}

uint64_t sub_100016384(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  uint64_t v7 = *(int *)(a3 + 28);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_100020CE8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  uint64_t v11 = a2 + *(int *)(a3 + 32);
  *(void *)(swift_unknownObjectWeakTakeInit() + 8) = *(void *)(v11 + 8);
  return a1;
}

uint64_t sub_100016434(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v7;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  uint64_t v8 = *(int *)(a3 + 28);
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = sub_100020CE8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 40))(v9, v10, v11);
  uint64_t v12 = a2 + *(int *)(a3 + 32);
  *(void *)(swift_unknownObjectWeakTakeAssign() + 8) = *(void *)(v12 + 8);
  return a1;
}

uint64_t sub_1000164FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100016510);
}

uint64_t sub_100016510(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_100020CE8();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 28);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_1000165C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000165D4);
}

uint64_t sub_1000165D4(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_100020CE8();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 28);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t type metadata accessor for MessagesContext()
{
  uint64_t result = qword_10002CEC8;
  if (!qword_10002CEC8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1000166C8()
{
  uint64_t result = sub_100020CE8();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_100016774()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100020F28();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_1000167EC()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100020F28();
  swift_release();
  swift_release();
  return v1;
}

void sub_100016860(void *a1, void *a2)
{
  uint64_t v5 = sub_1000046A4(&qword_10002D018);
  __chkstk_darwin(v5 - 8, v6);
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100020F28();
  swift_release();
  swift_release();
  if (v18)
  {
    if (qword_10002C7B0 != -1) {
      swift_once();
    }
    uint64_t v9 = sub_100020D28();
    sub_10000AB28(v9, (uint64_t)qword_10002D330);
    uint64_t v10 = sub_100020D08();
    os_log_type_t v11 = sub_100021748();
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "Not sending response because one is already in-flight.", v12, 2u);
      swift_slowDealloc();
    }
  }
  else
  {
    uint64_t v13 = sub_100021708();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v8, 1, 1, v13);
    uint64_t v14 = (void *)swift_allocObject();
    v14[2] = 0;
    v14[3] = 0;
    v14[4] = v2;
    v14[5] = a1;
    v14[6] = a2;
    swift_retain();
    id v15 = a1;
    id v16 = a2;
    *(void *)(v2 + 16) = sub_100018C00((uint64_t)v8, (uint64_t)&unk_10002D028, (uint64_t)v14);
    swift_release();
  }
}

uint64_t sub_100016A98()
{
  return 1;
}

Swift::Int sub_100016AA0()
{
  return sub_100021928();
}

void sub_100016AE4()
{
}

Swift::Int sub_100016B0C()
{
  return sub_100021928();
}

unint64_t sub_100016B4C()
{
  return 0xD00000000000003FLL;
}

uint64_t sub_100016B68@<X0>(uint64_t a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100020F28();
  swift_release();
  uint64_t result = swift_release();
  *(void *)a1 = v3;
  *(unsigned char *)(a1 + 8) = v4;
  return result;
}

uint64_t sub_100016BF0(uint64_t a1)
{
  unsigned __int8 v1 = *(void **)a1;
  unsigned __int8 v2 = *(unsigned char *)(a1 + 8);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_10001ACC8(v1, v2);
  swift_retain();
  return sub_100020F38();
}

uint64_t sub_100016C80(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_1000046A4(&qword_10002D010);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5, v7);
  uint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1000046A4(&qword_10002D008);
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10, v12);
  uint64_t v14 = (char *)&v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)(v2 + 16) = 0;
  uint64_t v15 = v2 + OBJC_IVAR____TtC22AskToMessagesExtension14ResponseSender__isWaitingForSendResult;
  char v20 = 0;
  sub_100020F18();
  (*(void (**)(uint64_t, char *, uint64_t))(v11 + 32))(v15, v14, v10);
  uint64_t v16 = v2 + OBJC_IVAR____TtC22AskToMessagesExtension14ResponseSender__sendResult;
  uint64_t v18 = 0;
  char v19 = -1;
  sub_1000046A4((uint64_t *)&unk_10002CF68);
  sub_100020F18();
  (*(void (**)(uint64_t, char *, uint64_t))(v6 + 32))(v16, v9, v5);
  sub_10001AA5C(a1, v2 + OBJC_IVAR____TtC22AskToMessagesExtension14ResponseSender_messagesContext);
  *(void *)(v2 + OBJC_IVAR____TtC22AskToMessagesExtension14ResponseSender_originalPayload) = a2;
  return v2;
}

uint64_t sub_100016E7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[8] = a5;
  v6[9] = a6;
  v6[7] = a4;
  return _swift_task_switch(sub_100016EA0, 0, 0);
}

uint64_t sub_100016EA0()
{
  swift_getKeyPath();
  swift_getKeyPath();
  *(unsigned char *)(v0 + 25) = 1;
  swift_retain();
  sub_100020F38();
  uint64_t v1 = swift_task_alloc();
  *(void *)(v0 + 80) = v1;
  *(void *)uint64_t v1 = v0;
  *(void *)(v1 + 8) = sub_100016FA8;
  long long v2 = *(_OWORD *)(v0 + 64);
  *(void *)(v1 + 120) = *(void *)(v0 + 56);
  *(_OWORD *)(v1 + 104) = v2;
  return _swift_task_switch(sub_100017474, 0, 0);
}

uint64_t sub_100016FA8()
{
  *(void *)(*(void *)v1 + 88) = v0;
  swift_task_dealloc();
  if (v0) {
    long long v2 = sub_1000171C0;
  }
  else {
    long long v2 = sub_1000170BC;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_1000170BC()
{
  uint64_t v1 = *(void **)(v0 + 64);
  swift_getKeyPath();
  swift_getKeyPath();
  *(void *)(v0 + 32) = v1;
  *(unsigned char *)(v0 + 40) = 0;
  swift_retain();
  id v2 = v1;
  sub_100020F38();
  swift_getKeyPath();
  swift_getKeyPath();
  *(unsigned char *)(v0 + 26) = 0;
  swift_retain();
  sub_100020F38();
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_1000171C0()
{
  if (qword_10002C7B0 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_100020D28();
  sub_10000AB28(v1, (uint64_t)qword_10002D330);
  swift_errorRetain();
  swift_errorRetain();
  id v2 = sub_100020D08();
  os_log_type_t v3 = sub_100021728();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v5 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 138412290;
    swift_errorRetain();
    uint64_t v6 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 48) = v6;
    sub_100021768();
    *uint64_t v5 = v6;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Error sending response: %@", v4, 0xCu);
    sub_1000046A4(&qword_10002CB40);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }
  uint64_t v7 = *(void *)(v0 + 88);

  swift_getKeyPath();
  swift_getKeyPath();
  *(void *)(v0 + 16) = v7;
  *(unsigned char *)(v0 + 24) = 1;
  swift_retain();
  sub_100020F38();
  swift_getKeyPath();
  swift_getKeyPath();
  *(unsigned char *)(v0 + 26) = 0;
  swift_retain();
  sub_100020F38();
  uint64_t v8 = *(uint64_t (**)(void))(v0 + 8);
  return v8();
}

uint64_t sub_100017450(uint64_t a1, uint64_t a2)
{
  v3[14] = a2;
  v3[15] = v2;
  v3[13] = a1;
  return _swift_task_switch(sub_100017474, 0, 0);
}

uint64_t sub_100017474()
{
  uint64_t v33 = v0;
  uint64_t v2 = v0 + 104;
  uint64_t v1 = *(void **)(v0 + 104);
  os_log_type_t v3 = *(void **)(v0 + 112);
  uint64_t v4 = *(void *)(v0 + 120);
  sub_1000215E8();
  uint64_t v5 = *(void **)(v4 + OBJC_IVAR____TtC22AskToMessagesExtension14ResponseSender_originalPayload);
  *(void *)(v0 + 128) = v5;
  v5;
  id v6 = v1;
  uint64_t v7 = (void *)sub_100021588();
  uint64_t v8 = OBJC_IVAR____TtC22AskToMessagesExtension14ResponseSender_messagesContext;
  *(void *)(v0 + 136) = v7;
  *(void *)(v0 + 144) = v8;
  uint64_t v9 = (uint64_t *)(v4 + v8);
  uint64_t v10 = *v9;
  *(void *)(v0 + 152) = *v9;
  unint64_t v11 = v9[1];
  *(void *)(v0 + 160) = v11;
  swift_bridgeObjectRetain();
  id v12 = [v3 recipientAddresses];
  uint64_t v13 = sub_100021698();
  *(void *)(v0 + 168) = v13;

  if (qword_10002C7B0 != -1) {
    swift_once();
  }
  uint64_t v14 = sub_100020D28();
  *(void *)(v0 + 176) = sub_10000AB28(v14, (uint64_t)qword_10002D330);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  id v15 = v7;
  uint64_t v16 = sub_100020D08();
  os_log_type_t v17 = sub_100021748();
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v30 = (void *)(v0 + 96);
    uint64_t v31 = v0;
    uint64_t v18 = swift_slowAlloc();
    char v19 = (void *)swift_slowAlloc();
    v32[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v18 = 136315650;
    swift_bridgeObjectRetain();
    *(void *)(v2 - 24) = sub_100014C7C(v10, v11, v32);
    sub_100021768();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v18 + 12) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v20 = sub_1000216A8();
    unint64_t v22 = v21;
    swift_bridgeObjectRelease();
    *(void *)(v2 - 16) = sub_100014C7C(v20, v22, v32);
    sub_100021768();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v18 + 22) = 2112;
    *uint64_t v30 = v15;
    id v23 = v15;
    sub_100021768();
    *char v19 = v15;

    _os_log_impl((void *)&_mh_execute_header, v16, v17, "%s: Calling into daemon to send response payload. recipientAddresses: %s, responsePayload: %@", (uint8_t *)v18, 0x20u);
    sub_1000046A4(&qword_10002CB40);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v0 = v31;
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
  uint64_t v24 = sub_1000215D8();
  *(void *)(v0 + 184) = v24;
  if (v24)
  {
    sub_1000215B8();
    unint64_t v25 = (void *)sub_1000215C8();
    uint64_t v26 = (void *)sub_100020DD8();

    sub_100021558();
    swift_bridgeObjectRelease();
    sub_1000214C8();
    swift_allocObject();
    *(void *)(v0 + 192) = sub_1000214B8();
    uint64_t v27 = (void *)swift_task_alloc();
    *(void *)(v0 + 200) = v27;
    *uint64_t v27 = v0;
    v27[1] = sub_100017964;
    return ATDaemonConnectionManager.sendResponse(_:to:)(v15, v13);
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_10001ACEC();
    swift_allocError();
    swift_willThrow();

    double v28 = *(uint64_t (**)(void))(v0 + 8);
    return v28();
  }
}

uint64_t sub_100017964()
{
  *(void *)(*(void *)v1 + 208) = v0;
  swift_task_dealloc();
  if (v0)
  {
    swift_bridgeObjectRelease();
    uint64_t v2 = sub_100018834;
  }
  else
  {
    uint64_t v2 = sub_100017A80;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100017A80()
{
  uint64_t v90 = v0;
  uint64_t v1 = *(void **)(v0 + 136);
  sub_1000215B8();
  uint64_t v2 = (void *)sub_1000215C8();
  os_log_type_t v3 = (void *)sub_100020DD8();

  sub_100021558();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  id v4 = v1;
  uint64_t v5 = sub_100020D08();
  os_log_type_t v6 = sub_100021748();
  if (os_log_type_enabled(v5, v6))
  {
    unint64_t v7 = *(void *)(v0 + 160);
    uint64_t v8 = *(void *)(v0 + 152);
    id v86 = *(void **)(v0 + 136);
    uint64_t v9 = swift_slowAlloc();
    id v84 = (void *)swift_slowAlloc();
    v89[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 136315650;
    swift_bridgeObjectRetain();
    *(void *)(v0 + 56) = sub_100014C7C(v8, v7, v89);
    sub_100021768();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v9 + 12) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_1000216A8();
    unint64_t v12 = v11;
    swift_bridgeObjectRelease();
    *(void *)(v0 + 64) = sub_100014C7C(v10, v12, v89);
    sub_100021768();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v9 + 22) = 2112;
    *(void *)(v0 + 72) = v86;
    id v13 = v86;
    sub_100021768();
    *id v84 = v86;

    _os_log_impl((void *)&_mh_execute_header, v5, v6, "%s: Daemon successfully sent response payload over IDS. recipientAddresses: %s, responsePayload: %@", (uint8_t *)v9, 0x20u);
    sub_1000046A4(&qword_10002CB40);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    uint64_t v14 = *(void **)(v0 + 136);
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
  uint64_t v15 = *(void *)(v0 + 120) + *(void *)(v0 + 144);
  sub_1000046A4(&qword_10002CE48);
  uint64_t v16 = swift_task_alloc();
  uint64_t v17 = v15 + *(int *)(type metadata accessor for MessagesContext() + 28);
  uint64_t v18 = sub_100020CE8();
  uint64_t v19 = *(void *)(v18 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 16))(v16, v17, v18);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v19 + 56))(v16, 0, 1, v18);
  uint64_t v20 = 0;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v19 + 48))(v16, 1, v18) != 1)
  {
    uint64_t v20 = (void *)sub_100020CB8();
    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v16, v18);
  }
  id v21 = [objc_allocWithZone((Class)MSSession) initWithIdentifier:v20];

  uint64_t result = swift_task_dealloc();
  if (v21)
  {
    id v23 = *(void **)(v0 + 112);
    sub_1000046A4(&qword_10002CC38);
    uint64_t v24 = swift_task_alloc();
    id v25 = [v23 selectedMessage];
    uint64_t v88 = v18;
    if (v25)
    {
      uint64_t v26 = v25;
      id v27 = [v25 URL];

      uint64_t v28 = swift_task_alloc();
      if (v27)
      {
        sub_100020C28();

        uint64_t v29 = sub_100020C38();
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v29 - 8) + 56))(v28, 0, 1, v29);
      }
      else
      {
        uint64_t v31 = sub_100020C38();
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v31 - 8) + 56))(v28, 1, 1, v31);
      }
      sub_10001AD40(v28, v24);
      swift_task_dealloc();
    }
    else
    {
      uint64_t v30 = sub_100020C38();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v30 - 8) + 56))(v24, 1, 1, v30);
    }
    double v32 = *(void **)(v0 + 208);
    id v33 = sub_100018D88(*(void *)(v0 + 136), (uint64_t)v21, v24);
    id v87 = v32;
    if (v32)
    {
      sub_100004CE4(v24, &qword_10002CC38);

      swift_bridgeObjectRelease();
      swift_task_dealloc();
      sub_1000214A8();
      swift_release();
      swift_errorRetain();
      swift_bridgeObjectRetain();
      swift_errorRetain();
      uint64_t v34 = sub_100020D08();
      os_log_type_t v35 = sub_100021728();
      BOOL v36 = os_log_type_enabled(v34, v35);
      os_log_type_t v37 = v32;
      unint64_t v38 = *(void *)(v0 + 160);
      if (v36)
      {
        uint64_t v39 = *(void *)(v0 + 152);
        uint64_t v40 = swift_slowAlloc();
        unint64_t v41 = (void *)swift_slowAlloc();
        v89[0] = swift_slowAlloc();
        *(_DWORD *)uint64_t v40 = 136315394;
        swift_bridgeObjectRetain();
        *(void *)(v0 + 16) = sub_100014C7C(v39, v38, v89);
        sub_100021768();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v40 + 12) = 2112;
        swift_errorRetain();
        uint64_t v42 = _swift_stdlib_bridgeErrorToNSError();
        *(void *)(v0 + 24) = v42;
        sub_100021768();
        *unint64_t v41 = v42;
        swift_errorRelease();
        swift_errorRelease();
        _os_log_impl((void *)&_mh_execute_header, v34, v35, "%s: Received error from daemon while sending response over IDS: %@", (uint8_t *)v40, 0x16u);
        sub_1000046A4(&qword_10002CB40);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
        swift_bridgeObjectRelease_n();
        swift_errorRelease();
        swift_errorRelease();
      }

      uint64_t v69 = v37;
    }
    else
    {
      uint64_t v43 = v33;
      sub_100004CE4(v24, &qword_10002CC38);

      swift_task_dealloc();
      sub_1000215B8();
      uint64_t v44 = (void *)sub_1000215C8();
      uint64_t v45 = (void *)sub_100020DD8();

      sub_100021558();
      swift_bridgeObjectRelease();
      uint64_t v46 = (void *)sub_100021618();
      id v83 = v43;
      id v47 = [v43 _pluginPayloadWithAppIconData:0 appName:v46 allowDataPayloads:0];

      sub_100021568();
      uint64_t v48 = (void *)sub_100021618();
      swift_bridgeObjectRelease();
      id v82 = v47;
      id v49 = [v47 data];
      uint64_t v85 = v19;
      if (v49)
      {
        uint64_t v50 = sub_100020C68();
        unint64_t v52 = v51;

        id v49 = (id)sub_100020C58();
        sub_10000F2C8(v50, v52);
      }
      os_log_type_t v53 = *(void **)(v0 + 136);
      IMSPIUpdatePluginMessageWithGUID();

      sub_1000215B8();
      uint64_t v54 = (void *)sub_1000215C8();
      os_log_type_t v55 = (void *)sub_100020DD8();

      sub_100021558();
      swift_bridgeObjectRelease();
      id v56 = v53;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      id v57 = v56;
      id v58 = sub_100020D08();
      os_log_type_t v59 = sub_100021748();
      BOOL v60 = os_log_type_enabled(v58, v59);
      unint64_t v61 = *(void *)(v0 + 160);
      if (v60)
      {
        uint64_t v62 = *(void *)(v0 + 152);
        uint64_t v63 = *(void **)(v0 + 136);
        uint64_t v64 = swift_slowAlloc();
        id v81 = (void *)swift_slowAlloc();
        v89[0] = swift_slowAlloc();
        *(_DWORD *)uint64_t v64 = 136315650;
        swift_bridgeObjectRetain();
        *(void *)(v0 + 32) = sub_100014C7C(v62, v61, v89);
        sub_100021768();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v64 + 12) = 2080;
        swift_bridgeObjectRetain();
        uint64_t v65 = sub_1000216A8();
        unint64_t v67 = v66;
        swift_bridgeObjectRelease();
        *(void *)(v0 + 40) = sub_100014C7C(v65, v67, v89);
        sub_100021768();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v64 + 22) = 2112;
        *(void *)(v0 + 48) = v63;
        id v68 = v63;
        sub_100021768();
        void *v81 = v63;

        _os_log_impl((void *)&_mh_execute_header, v58, v59, "%s: Updated Messages DB with response. recipientAddresses: %s, responsePayload: %@", (uint8_t *)v64, 0x20u);
        sub_1000046A4(&qword_10002CB40);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
        uint64_t v70 = *(void **)(v0 + 136);
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease_n();
      }
      uint64_t v19 = v85;
      id v71 = *(id *)(v0 + 184);
      sub_1000214A8();
      swift_release();
      uint64_t v69 = *(void **)(v0 + 184);
    }
    unint64_t v72 = (void *)sub_1000215C8();
    uint64_t v73 = swift_task_alloc();
    sub_100020DF8();

    sub_1000215B8();
    sub_100021598();
    uint64_t v74 = (void *)sub_1000213C8();
    sub_100020E38();

    unint64_t v75 = sub_100021578();
    if (v75)
    {
      if (v75 >> 62) {
        sub_100021838();
      }
      swift_bridgeObjectRelease();
    }
    sub_100021548();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v73, v88);
    swift_task_dealloc();
    id v76 = *(void **)(v0 + 184);
    if (v87)
    {
      swift_willThrow();
    }
    else
    {
      id v78 = *(void **)(v0 + 136);
      sub_1000215B8();
      id v79 = (void *)sub_1000215C8();
      id v80 = (void *)sub_100020DD8();

      sub_100021558();
      sub_10000B288(v69, 0);

      swift_bridgeObjectRelease();
    }
    id v77 = *(uint64_t (**)(void))(v0 + 8);
    return v77();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_100018834()
{
  uint64_t v18 = v0;
  sub_1000214A8();
  swift_release();
  swift_errorRetain();
  swift_bridgeObjectRetain();
  swift_errorRetain();
  uint64_t v1 = sub_100020D08();
  os_log_type_t v2 = sub_100021728();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v4 = *(void *)(v0 + 152);
    unint64_t v3 = *(void *)(v0 + 160);
    uint64_t v5 = swift_slowAlloc();
    os_log_type_t v6 = (void *)swift_slowAlloc();
    uint64_t v17 = swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 136315394;
    swift_bridgeObjectRetain();
    *(void *)(v0 + 16) = sub_100014C7C(v4, v3, &v17);
    sub_100021768();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v5 + 12) = 2112;
    swift_errorRetain();
    uint64_t v7 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 24) = v7;
    sub_100021768();
    *os_log_type_t v6 = v7;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "%s: Received error from daemon while sending response over IDS: %@", (uint8_t *)v5, 0x16u);
    sub_1000046A4(&qword_10002CB40);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease_n();
    swift_errorRelease();
    swift_errorRelease();
  }

  uint64_t v8 = (void *)sub_1000215C8();
  uint64_t v9 = sub_100020CE8();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = swift_task_alloc();
  sub_100020DF8();

  sub_1000215B8();
  sub_100021598();
  unint64_t v12 = (void *)sub_1000213C8();
  sub_100020E38();

  unint64_t v13 = sub_100021578();
  if (v13)
  {
    if (v13 >> 62) {
      sub_100021838();
    }
    swift_bridgeObjectRelease();
  }
  sub_100021548();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v11, v9);
  swift_task_dealloc();
  uint64_t v14 = *(void **)(v0 + 184);
  swift_willThrow();

  uint64_t v15 = *(uint64_t (**)(void))(v0 + 8);
  return v15();
}

uint64_t sub_100018C00(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_100021708();
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_1000216F8();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(void *)(a3 + 16)) {
      return swift_task_create();
    }
    goto LABEL_3;
  }
  sub_100004CE4(a1, &qword_10002D018);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1000216E8();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

id sub_100018D88(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = v4;
  unint64_t v8 = *(void *)(v3 + OBJC_IVAR____TtC22AskToMessagesExtension14ResponseSender_messagesContext + 8);
  uint64_t v224 = *(uint64_t **)(v3 + OBJC_IVAR____TtC22AskToMessagesExtension14ResponseSender_messagesContext);
  uint64_t v9 = qword_10002C798;
  swift_bridgeObjectRetain();
  if (v9 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_100020D28();
  uint64_t v11 = sub_10000AB28(v10, (uint64_t)qword_10002D2E8);
  swift_bridgeObjectRetain_n();
  unint64_t v12 = sub_100020D08();
  os_log_type_t v13 = sub_100021748();
  uint64_t v219 = (char *)a3;
  uint64_t v221 = (uint64_t *)v11;
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = (uint8_t *)swift_slowAlloc();
    uint64_t v223 = a2;
    unsigned __int8 v226 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v14 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v225 = sub_100014C7C((uint64_t)v224, v8, (uint64_t *)&v226);
    sub_100021768();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "%s: Creating Messages payload", v14, 0xCu);
    swift_arrayDestroy();
    a2 = v223;
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  id v15 = [objc_allocWithZone((Class)MSMessageTemplateLayout) init];
  uint64_t v16 = (void *)sub_1000215C8();
  sub_100020DC8();

  uint64_t v17 = (void *)sub_100021618();
  swift_bridgeObjectRelease();
  [v15 setCaption:v17];

  uint64_t v18 = (void *)sub_1000215C8();
  sub_100020DE8();

  uint64_t v19 = (void *)sub_100021618();
  swift_bridgeObjectRelease();
  [v15 setSubcaption:v19];

  id v20 = [objc_allocWithZone((Class)MSMessageLiveLayout) initWithAlternateLayout:v15];
  id v21 = (void *)sub_100021688();
  [v20 setRequiredCapabilities:v21];

  id v22 = [objc_allocWithZone((Class)MSMessage) initWithSession:a2];
  [v22 setLayout:v20];
  id v23 = (void *)sub_1000215C8();
  sub_100020D78();
  uint64_t v25 = v24;

  if (!v25)
  {
    uint64_t v26 = (void *)sub_1000215C8();
    sub_100020DE8();
  }
  id v27 = (void *)sub_100021618();
  swift_bridgeObjectRelease();
  [v22 setSummaryText:v27];

  uint64_t v28 = sub_1000046A4(&qword_10002CC38);
  uint64_t v29 = *(void *)(*(void *)(v28 - 8) + 64);
  __chkstk_darwin(v28 - 8, v30);
  unint64_t v31 = (v29 + 15) & 0xFFFFFFFFFFFFFFF0;
  sub_100021538();
  if (v5)
  {
    swift_bridgeObjectRelease();

    return v22;
  }
  id v210 = v20;
  uint64_t v211 = 0;
  id v33 = (char *)&v187 - v31;
  uint64_t v220 = __chkstk_darwin((char *)&v187 - v31, v32);
  sub_100004C80(v220, (uint64_t)&v187 - v31, &qword_10002CC38);
  uint64_t v34 = sub_100020C38();
  char v222 = *(uint64_t **)(v34 - 8);
  os_log_type_t v35 = v222 + 6;
  uint64_t v218 = (unsigned int (*)(char *, uint64_t, uint64_t))v222[6];
  unsigned int v36 = v218((char *)&v187 - v31, 1, v34);
  os_log_type_t v37 = 0;
  if (v36 != 1)
  {
    os_log_type_t v37 = (void *)sub_100020C18();
    ((void (*)(char *, uint64_t))v222[1])(v33, v34);
  }
  uint64_t v223 = v34;
  [v22 setURL:v37];

  uint64_t v217 = &v187;
  __chkstk_darwin(v38, v39);
  unint64_t v40 = (v29 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v41 = v29;
  uint64_t v42 = (char *)&v187 - v40;
  sub_100004C80(v220, (uint64_t)&v187 - v40, &qword_10002CC38);
  swift_bridgeObjectRetain();
  uint64_t v43 = sub_100020D08();
  int v44 = sub_100021748();
  BOOL v45 = os_log_type_enabled(v43, (os_log_type_t)v44);
  id v212 = v22;
  uint64_t v213 = v35;
  uint64_t v214 = v41;
  if (v45)
  {
    LODWORD(v221) = v44;
    id v206 = v15;
    uint64_t v46 = swift_slowAlloc();
    unsigned __int8 v216 = (uint64_t *)swift_slowAlloc();
    unsigned __int8 v226 = v216;
    *(_DWORD *)uint64_t v46 = 136315394;
    swift_bridgeObjectRetain();
    uint64_t v225 = sub_100014C7C((uint64_t)v224, v8, (uint64_t *)&v226);
    sub_100021768();
    uint64_t v47 = swift_bridgeObjectRelease_n();
    *(_WORD *)(v46 + 12) = 2080;
    __chkstk_darwin(v47, v48);
    id v49 = (char *)&v187 - v40;
    sub_100004C80((uint64_t)v42, (uint64_t)v49, &qword_10002CC38);
    uint64_t v50 = v223;
    if (v218(v49, 1, v223) == 1)
    {
      sub_100004CE4((uint64_t)v49, &qword_10002CC38);
      unint64_t v51 = 0xE300000000000000;
      uint64_t v52 = 7104878;
    }
    else
    {
      uint64_t v52 = sub_100020C08();
      unint64_t v51 = v55;
      ((void (*)(char *, uint64_t))v222[1])(v49, v50);
    }
    uint64_t v225 = sub_100014C7C(v52, v51, (uint64_t *)&v226);
    sub_100021768();
    swift_bridgeObjectRelease();
    sub_100004CE4((uint64_t)v42, &qword_10002CC38);
    _os_log_impl((void *)&_mh_execute_header, v43, (os_log_type_t)v221, "%s: Generated AskTo URL: %s", (uint8_t *)v46, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    id v15 = v206;
  }
  else
  {
    swift_bridgeObjectRelease_n();
    sub_100004CE4((uint64_t)&v187 - v40, &qword_10002CC38);
  }
  long long v209 = &v187;
  uint64_t v56 = v222[8];
  uint64_t v57 = __chkstk_darwin(v53, v54);
  unint64_t v58 = (v56 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v215 = (char *)&v187 - v58;
  uint64_t v224 = &v187;
  uint64_t v59 = v214;
  __chkstk_darwin(v57, v60);
  unint64_t v61 = (v59 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v62 = v220;
  sub_100004C80(v220, (uint64_t)&v187 - v61, &qword_10002CC38);
  uint64_t v63 = v218;
  if (v218((char *)&v187 - v61, 1, v223) == 1)
  {
    sub_100004CE4(v62, &qword_10002CC38);

    sub_100004CE4((uint64_t)&v187 - v61, &qword_10002CC38);
    return v212;
  }
  uint64_t v64 = v222 + 4;
  uint64_t v198 = (uint64_t (*)(char *, char *, uint64_t))v222[4];
  uint64_t v65 = v198(v215, (char *)&v187 - v61, v223);
  uint64_t v224 = &v187;
  uint64_t v208 = v56;
  uint64_t v67 = __chkstk_darwin(v65, v66);
  id v68 = (char *)&v187 - v58;
  __chkstk_darwin(v67, v69);
  sub_100004C80((uint64_t)v219, (uint64_t)&v187 - v61, &qword_10002CC38);
  if (v63((char *)&v187 - v61, 1, v223) == 1)
  {

    ((void (*)(char *, uint64_t))v222[1])(v215, v223);
    sub_100004CE4(v220, &qword_10002CC38);
    sub_100004CE4((uint64_t)&v187 - v61, &qword_10002CC38);
    return v212;
  }
  id v206 = v15;
  uint64_t v70 = v223;
  uint64_t v193 = v64;
  v198(v68, (char *)&v187 - v61, v223);
  uint64_t v71 = sub_100020B98();
  uint64_t v194 = &v187;
  uint64_t v72 = *(void *)(v71 - 8);
  uint64_t v73 = *(void *)(v72 + 64);
  __chkstk_darwin(v71, v74);
  uint64_t v219 = (char *)((v73 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v195 = (char *)((char *)&v187 - v219);
  uint64_t v75 = sub_1000046A4(&qword_10002CC40);
  uint64_t v221 = &v187;
  id v76 = v68;
  uint64_t v77 = *(void *)(*(void *)(v75 - 8) + 64);
  __chkstk_darwin(v75 - 8, v78);
  unint64_t v79 = (v77 + 15) & 0xFFFFFFFFFFFFFFF0;
  sub_100020B78();
  uint64_t v207 = v72;
  id v80 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v72 + 48);
  if (v80((char *)&v187 - v79, 1, v71) == 1)
  {

    id v81 = (void (*)(char *, uint64_t))v222[1];
    v81(v76, v70);
    v81(v215, v70);
    sub_100004CE4(v220, &qword_10002CC38);
    sub_100004CE4((uint64_t)&v187 - v79, &qword_10002CC40);
    return v212;
  }
  uint64_t v192 = v76;
  id v82 = *(uint64_t (**)(char *, char *, uint64_t))(v207 + 32);
  uint64_t v83 = v82(v195, (char *)&v187 - v79, v71);
  uint64_t v191 = &v187;
  uint64_t v205 = v73;
  uint64_t v85 = __chkstk_darwin(v83, v84);
  id v86 = (char *)((char *)&v187 - v219);
  uint64_t v221 = &v187;
  __chkstk_darwin(v85, v87);
  uint64_t v88 = (char *)&v187 - v79;
  id v89 = v215;
  sub_100020B78();
  if (v80(v88, 1, v71) == 1)
  {

    (*(void (**)(char *, uint64_t))(v207 + 8))(v195, v71);
    uint64_t v90 = v223;
    uint64_t v91 = (void (*)(char *, uint64_t))v222[1];
    v91(v192, v223);
    v91(v89, v90);
    sub_100004CE4(v220, &qword_10002CC38);
    sub_100004CE4((uint64_t)v88, &qword_10002CC40);
    return v212;
  }
  v190 = v86;
  uint64_t v189 = v71;
  v82(v86, v88, v71);
  uint64_t v92 = &_swiftEmptyArrayStorage;
  unint64_t v93 = sub_10001A46C((uint64_t)&_swiftEmptyArrayStorage);
  uint64_t v94 = v195;
  uint64_t v95 = sub_100020B58();
  if (v95) {
    uint64_t v96 = (void *)v95;
  }
  else {
    uint64_t v96 = &_swiftEmptyArrayStorage;
  }
  char v97 = (uint64_t *)v96[2];
  if (!v97)
  {
    swift_bridgeObjectRelease();
    uint64_t v104 = v208;
    uint64_t v105 = v205;
LABEL_47:
    uint64_t v131 = sub_100020B58();
    if (v131) {
      uint64_t v92 = (void *)v131;
    }
    id v132 = (uint64_t *)v92[2];
    uint64_t v133 = v207;
    if (v132)
    {
      uint64_t v134 = sub_100020B48();
      uint64_t v136 = v134;
      uint64_t v137 = *(void *)(v134 - 8);
      unint64_t v204 = *(void (**)(char *, char *, uint64_t))(v137 + 16);
      unint64_t v138 = (*(unsigned __int8 *)(v137 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v137 + 80);
      int v188 = v92;
      uint64_t v139 = (uint64_t)v92 + v138;
      v197 = (void (**)(unint64_t, char *, uint64_t))(v137 + 32);
      uint64_t v196 = (void (**)(unint64_t, char *, uint64_t))(v137 + 40);
      uint64_t v199 = (uint64_t (**)(char *, uint64_t))(v137 + 8);
      uint64_t v203 = v137 + 16;
      uint64_t v140 = *(void *)(v137 + 72);
      uint64_t v202 = *(void *)(v137 + 64);
      uint64_t v200 = v134;
      uint64_t v201 = v140;
      while (1)
      {
        uint64_t v221 = v132;
        uint64_t v217 = &v187;
        uint64_t v143 = v93;
        uint64_t v144 = v202;
        __chkstk_darwin(v134, v135);
        uint64_t v145 = (char *)&v187 - ((v144 + 15) & 0xFFFFFFFFFFFFFFF0);
        uint64_t v219 = (char *)v139;
        uint64_t v146 = v204;
        v204(v145, (char *)v139, v136);
        uint64_t v147 = sub_100020B28();
        uint64_t v149 = v148;
        unsigned __int8 v216 = &v187;
        __chkstk_darwin(v147, v148);
        v146(v145, v145, v136);
        uint64_t v150 = v149;
        int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        unsigned __int8 v226 = (void *)v143;
        unint64_t v153 = sub_10001ADA8(v147, v149);
        uint64_t v154 = *(void *)(v143 + 16);
        BOOL v155 = (v152 & 1) == 0;
        uint64_t v156 = v154 + v155;
        if (__OFADD__(v154, v155)) {
          goto LABEL_70;
        }
        char v157 = v152;
        if (*(void *)(v143 + 24) >= v156)
        {
          if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
            sub_10001B2FC();
          }
        }
        else
        {
          sub_10001AE20(v156, isUniquelyReferenced_nonNull_native);
          unint64_t v158 = sub_10001ADA8(v147, v149);
          if ((v157 & 1) != (v159 & 1)) {
            goto LABEL_73;
          }
          unint64_t v153 = v158;
        }
        uint64_t v160 = v201;
        uint64_t v161 = v226;
        if (v157)
        {
          uint64_t v136 = v200;
          (*v196)(v226[7] + v153 * v201, v145, v200);
          uint64_t v133 = v207;
          unint64_t v141 = v221;
        }
        else
        {
          v226[(v153 >> 6) + 8] |= 1 << v153;
          v162 = (uint64_t *)(v161[6] + 16 * v153);
          uint64_t *v162 = v147;
          v162[1] = v150;
          uint64_t v136 = v200;
          (*v197)(v161[7] + v153 * v160, v145, v200);
          uint64_t v163 = v161[2];
          BOOL v129 = __OFADD__(v163, 1);
          uint64_t v164 = v163 + 1;
          if (v129) {
            goto LABEL_72;
          }
          v161[2] = v164;
          swift_bridgeObjectRetain();
          uint64_t v133 = v207;
          unint64_t v141 = v221;
        }
        uint64_t v142 = (uint64_t)v219;
        unint64_t v93 = (unint64_t)v226;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v134 = (*v199)(v145, v136);
        uint64_t v139 = v142 + v160;
        id v132 = (uint64_t *)((char *)v141 - 1);
        if (!v132)
        {
          uint64_t v165 = swift_bridgeObjectRelease();
          uint64_t v94 = v195;
          uint64_t v104 = v208;
          uint64_t v105 = v205;
          goto LABEL_64;
        }
      }
    }
    uint64_t v165 = swift_bridgeObjectRelease();
LABEL_64:
    uint64_t v219 = (char *)v93;
    __chkstk_darwin(v165, v166);
    v167 = (char *)&v187 - ((v105 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v168 = v189;
    (*(void (**)(char *, char *, uint64_t))(v133 + 16))(v167, v94, v189);
    uint64_t v169 = swift_bridgeObjectRetain();
    sub_10001B5D8(v169);
    swift_bridgeObjectRelease();
    uint64_t v170 = sub_100020B68();
    uint64_t v221 = &v187;
    uint64_t v172 = __chkstk_darwin(v170, v171);
    v173 = (char *)&v187 - ((v104 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v217 = &v187;
    __chkstk_darwin(v172, v174);
    uint64_t v176 = (char *)&v187 - ((v175 + 15) & 0xFFFFFFFFFFFFFFF0);
    sub_100020B88();
    uint64_t v177 = v223;
    unsigned int v178 = v218(v176, 1, v223);
    v179 = (void (**)(char *, uint64_t))(v222 + 1);
    if (v178 != 1)
    {
      v198(v173, v176, v177);
      uint64_t v182 = (void *)sub_100020C18();
      char v222 = &v187;
      id v183 = v212;
      [v212 setURL:v182];

      uint64_t v184 = *v179;
      (*v179)(v173, v177);
      uint64_t v185 = *(void (**)(char *, uint64_t))(v133 + 8);
      v185(v167, v168);
      v185(v190, v168);
      v185(v195, v168);
      v184(v192, v177);
      v184(v215, v177);
      id v22 = v183;
      sub_100004CE4(v220, &qword_10002CC38);
      swift_bridgeObjectRelease();
      return v22;
    }

    v180 = *(void (**)(char *, uint64_t))(v133 + 8);
    v180(v167, v168);
    v180(v190, v168);
    v180(v195, v168);
    v181 = *v179;
    (*v179)(v192, v177);
    v181(v215, v177);
    sub_100004CE4(v220, &qword_10002CC38);
    sub_100004CE4((uint64_t)v176, &qword_10002CC38);
    swift_bridgeObjectRelease();
    return v212;
  }
  uint64_t v98 = sub_100020B48();
  uint64_t v99 = *(void *)(v98 - 8);
  unint64_t v204 = *(void (**)(char *, char *, uint64_t))(v99 + 16);
  unint64_t v100 = (*(unsigned __int8 *)(v99 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v99 + 80);
  int v188 = v96;
  uint64_t v101 = (char *)v96 + v100;
  v197 = (void (**)(unint64_t, char *, uint64_t))(v99 + 32);
  uint64_t v196 = (void (**)(unint64_t, char *, uint64_t))(v99 + 40);
  uint64_t v199 = (uint64_t (**)(char *, uint64_t))(v99 + 8);
  uint64_t v203 = v99 + 16;
  uint64_t v102 = *(void *)(v99 + 72);
  uint64_t v202 = *(void *)(v99 + 64);
  uint64_t v201 = v98;
  uint64_t v200 = v102;
  while (1)
  {
    unsigned __int8 v216 = v97;
    uint64_t v219 = (char *)&v187;
    uint64_t v107 = v202;
    __chkstk_darwin(v98, v101);
    uint64_t v108 = (char *)&v187 - ((v107 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v221 = v109;
    uint64_t v110 = (void (*)(char *, char *))v204;
    ((void (*)(char *))v204)(v108);
    uint64_t v111 = sub_100020B28();
    uint64_t v113 = v112;
    uint64_t v217 = &v187;
    __chkstk_darwin(v111, v112);
    v110(v108, v108);
    int v114 = swift_isUniquelyReferenced_nonNull_native();
    unsigned __int8 v226 = (void *)v93;
    unint64_t v115 = sub_10001ADA8(v111, v113);
    unint64_t v117 = v93;
    unint64_t v118 = v115;
    uint64_t v119 = *(void *)(v117 + 16);
    BOOL v120 = (v116 & 1) == 0;
    uint64_t v121 = v119 + v120;
    if (__OFADD__(v119, v120)) {
      break;
    }
    char v122 = v116;
    if (*(void *)(v117 + 24) >= v121)
    {
      uint64_t v125 = v200;
      if (v114)
      {
        uint64_t v126 = v226;
        if ((v116 & 1) == 0) {
          goto LABEL_41;
        }
      }
      else
      {
        sub_10001B2FC();
        uint64_t v126 = v226;
        if ((v122 & 1) == 0) {
          goto LABEL_41;
        }
      }
    }
    else
    {
      sub_10001AE20(v121, v114);
      unint64_t v123 = sub_10001ADA8(v111, v113);
      uint64_t v125 = v200;
      if ((v122 & 1) != (v124 & 1)) {
        goto LABEL_73;
      }
      unint64_t v118 = v123;
      uint64_t v126 = v226;
      if ((v122 & 1) == 0)
      {
LABEL_41:
        v126[(v118 >> 6) + 8] |= 1 << v118;
        uint64_t v127 = (uint64_t *)(v126[6] + 16 * v118);
        *uint64_t v127 = v111;
        v127[1] = v113;
        uint64_t v103 = v201;
        (*v197)(v126[7] + v118 * v125, v108, v201);
        uint64_t v128 = v126[2];
        BOOL v129 = __OFADD__(v128, 1);
        uint64_t v130 = v128 + 1;
        if (v129) {
          goto LABEL_71;
        }
        v126[2] = v130;
        swift_bridgeObjectRetain();
        goto LABEL_33;
      }
    }
    uint64_t v103 = v201;
    (*v196)(v126[7] + v118 * v125, v108, v201);
LABEL_33:
    uint64_t v104 = v208;
    uint64_t v105 = v205;
    uint64_t v106 = v216;
    unint64_t v93 = (unint64_t)v226;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v98 = (*v199)(v108, v103);
    uint64_t v101 = (char *)v221 + v125;
    char v97 = (uint64_t *)((char *)v106 - 1);
    if (!v97)
    {
      swift_bridgeObjectRelease();
      uint64_t v94 = v195;
      uint64_t v92 = &_swiftEmptyArrayStorage;
      goto LABEL_47;
    }
  }
  __break(1u);
LABEL_70:
  __break(1u);
LABEL_71:
  __break(1u);
LABEL_72:
  __break(1u);
LABEL_73:
  id result = (id)sub_1000218A8();
  __break(1u);
  return result;
}

unint64_t sub_10001A46C(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    sub_1000046A4(&qword_10002D040);
    os_log_type_t v2 = (void *)sub_100021868();
  }
  else
  {
    os_log_type_t v2 = &_swiftEmptyDictionarySingleton;
  }
  uint64_t v3 = sub_1000046A4(&qword_10002D050);
  uint64_t v5 = __chkstk_darwin(v3, v4);
  unint64_t v8 = (void *)((char *)v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v9 = *(void *)(a1 + 16);
  if (v9)
  {
    uint64_t v10 = (char *)v8 + *(int *)(v5 + 48);
    unint64_t v11 = (*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
    v25[1] = a1;
    uint64_t v12 = a1 + v11;
    uint64_t v13 = *(void *)(v6 + 72);
    swift_retain();
    while (1)
    {
      sub_100004C80(v12, (uint64_t)v8, &qword_10002D050);
      uint64_t v14 = *v8;
      uint64_t v15 = v8[1];
      unint64_t result = sub_10001ADA8(*v8, v15);
      if (v17) {
        break;
      }
      unint64_t v18 = result;
      *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
      uint64_t v19 = (uint64_t *)(v2[6] + 16 * result);
      *uint64_t v19 = v14;
      v19[1] = v15;
      uint64_t v20 = v2[7];
      uint64_t v21 = sub_100020B48();
      unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v21 - 8) + 32))(v20 + *(void *)(*(void *)(v21 - 8) + 72) * v18, v10, v21);
      uint64_t v22 = v2[2];
      BOOL v23 = __OFADD__(v22, 1);
      uint64_t v24 = v22 + 1;
      if (v23) {
        goto LABEL_12;
      }
      v2[2] = v24;
      v12 += v13;
      if (!--v9)
      {
        swift_release();
        goto LABEL_10;
      }
    }
    __break(1u);
LABEL_12:
    __break(1u);
  }
  else
  {
LABEL_10:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  return result;
}

uint64_t sub_10001A66C()
{
  swift_release();
  uint64_t v1 = v0 + OBJC_IVAR____TtC22AskToMessagesExtension14ResponseSender__isWaitingForSendResult;
  uint64_t v2 = sub_1000046A4(&qword_10002D008);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = v0 + OBJC_IVAR____TtC22AskToMessagesExtension14ResponseSender__sendResult;
  uint64_t v4 = sub_1000046A4(&qword_10002D010);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  sub_10001AA00(v0 + OBJC_IVAR____TtC22AskToMessagesExtension14ResponseSender_messagesContext);

  uint64_t v5 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v6 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v5, v6);
}

uint64_t sub_10001A780()
{
  return type metadata accessor for ResponseSender();
}

uint64_t type metadata accessor for ResponseSender()
{
  uint64_t result = qword_10002CF48;
  if (!qword_10002CF48) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_10001A7D4()
{
  sub_10001A8F0();
  if (v0 <= 0x3F)
  {
    sub_10001A948();
    if (v1 <= 0x3F)
    {
      type metadata accessor for MessagesContext();
      if (v2 <= 0x3F) {
        swift_updateClassMetadata2();
      }
    }
  }
}

void sub_10001A8F0()
{
  if (!qword_10002CF58)
  {
    unint64_t v0 = sub_100020F48();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_10002CF58);
    }
  }
}

void sub_10001A948()
{
  if (!qword_10002CF60)
  {
    sub_1000047C8((uint64_t *)&unk_10002CF68);
    unint64_t v0 = sub_100020F48();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_10002CF60);
    }
  }
}

void *sub_10001A9A4()
{
  return &protocol witness table for ObservableObjectPublisher;
}

uint64_t sub_10001A9B0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100020F08();
  *a1 = result;
  return result;
}

uint64_t sub_10001AA00(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for MessagesContext();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10001AA5C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for MessagesContext();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10001AAC8()
{
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_10001AB18()
{
  uint64_t v2 = *(void *)(v0 + 48);
  uint64_t v3 = swift_task_alloc();
  long long v4 = *(_OWORD *)(v0 + 32);
  *(void *)(v1 + 16) = v3;
  *(void *)uint64_t v3 = v1;
  *(void *)(v3 + 8) = sub_10001ABCC;
  *(void *)(v3 + 72) = v2;
  *(_OWORD *)(v3 + 56) = v4;
  return _swift_task_switch(sub_100016EA0, 0, 0);
}

uint64_t sub_10001ABCC()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

id sub_10001ACC8(id result, unsigned __int8 a2)
{
  if (a2 != 255) {
    return sub_10001ACE0(result, a2 & 1);
  }
  return result;
}

id sub_10001ACE0(void *a1, char a2)
{
  if (a2) {
    return (id)swift_errorRetain();
  }
  else {
    return a1;
  }
}

unint64_t sub_10001ACEC()
{
  unint64_t result = qword_10002D038;
  if (!qword_10002D038)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002D038);
  }
  return result;
}

uint64_t sub_10001AD40(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000046A4(&qword_10002CC38);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_10001ADA8(uint64_t a1, uint64_t a2)
{
  sub_100021908();
  sub_100021648();
  Swift::Int v4 = sub_100021928();

  return sub_10001B218(a1, a2, v4);
}

uint64_t sub_10001AE20(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_1000046A4(&qword_10002D040);
  int v48 = a2;
  uint64_t v6 = sub_100021858();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    int v44 = v2;
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v9 = *(void *)(v5 + 64);
    uint64_t v46 = (void *)(v5 + 64);
    if (v8 < 64) {
      uint64_t v10 = ~(-1 << v8);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v11 = v10 & v9;
    int64_t v45 = (unint64_t)(v8 + 63) >> 6;
    uint64_t v12 = v6 + 64;
    uint64_t result = swift_retain();
    int64_t v14 = 0;
    for (i = v5; ; uint64_t v5 = i)
    {
      if (v11)
      {
        unint64_t v17 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        int64_t v49 = v14;
        unint64_t v18 = v17 | (v14 << 6);
      }
      else
      {
        int64_t v19 = v14 + 1;
        if (__OFADD__(v14, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v19 >= v45) {
          goto LABEL_34;
        }
        unint64_t v20 = v46[v19];
        int64_t v21 = v14 + 1;
        if (!v20)
        {
          int64_t v21 = v14 + 2;
          if (v14 + 2 >= v45) {
            goto LABEL_34;
          }
          unint64_t v20 = v46[v21];
          if (!v20)
          {
            uint64_t v22 = v14 + 3;
            if (v14 + 3 >= v45)
            {
LABEL_34:
              swift_release();
              uint64_t v3 = v44;
              if (v48)
              {
                uint64_t v43 = 1 << *(unsigned char *)(v5 + 32);
                if (v43 >= 64) {
                  bzero(v46, ((unint64_t)(v43 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v46 = -1 << v43;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v20 = v46[v22];
            if (!v20)
            {
              while (1)
              {
                int64_t v21 = v22 + 1;
                if (__OFADD__(v22, 1)) {
                  goto LABEL_41;
                }
                if (v21 >= v45) {
                  goto LABEL_34;
                }
                unint64_t v20 = v46[v21];
                ++v22;
                if (v20) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v21 = v14 + 3;
          }
        }
LABEL_21:
        unint64_t v11 = (v20 - 1) & v20;
        int64_t v49 = v21;
        unint64_t v18 = __clz(__rbit64(v20)) + (v21 << 6);
      }
      uint64_t v23 = sub_100020B48();
      uint64_t v24 = *(void *)(v23 - 8);
      __chkstk_darwin(v23, v25);
      id v27 = (char *)&v44 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v28 = *(void *)(v5 + 56);
      uint64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v18);
      uint64_t v31 = *v29;
      uint64_t v30 = v29[1];
      uint64_t v33 = *(void *)(v32 + 72);
      uint64_t v34 = v28 + v33 * v18;
      uint64_t v50 = v35;
      if (v48)
      {
        (*(void (**)(char *, uint64_t, uint64_t))(v24 + 32))((char *)&v44 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0), v34, v23);
      }
      else
      {
        (*(void (**)(char *, uint64_t, uint64_t))(v24 + 16))((char *)&v44 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0), v34, v23);
        swift_bridgeObjectRetain();
      }
      sub_100021908();
      sub_100021648();
      uint64_t result = sub_100021928();
      uint64_t v36 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v37 = result & ~v36;
      unint64_t v38 = v37 >> 6;
      if (((-1 << v37) & ~*(void *)(v12 + 8 * (v37 >> 6))) != 0)
      {
        unint64_t v15 = __clz(__rbit64((-1 << v37) & ~*(void *)(v12 + 8 * (v37 >> 6)))) | v37 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v39 = 0;
        unint64_t v40 = (unint64_t)(63 - v36) >> 6;
        do
        {
          if (++v38 == v40 && (v39 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          BOOL v41 = v38 == v40;
          if (v38 == v40) {
            unint64_t v38 = 0;
          }
          v39 |= v41;
          uint64_t v42 = *(void *)(v12 + 8 * v38);
        }
        while (v42 == -1);
        unint64_t v15 = __clz(__rbit64(~v42)) + (v38 << 6);
      }
      *(void *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      uint64_t v16 = (void *)(*(void *)(v7 + 48) + 16 * v15);
      *uint64_t v16 = v31;
      v16[1] = v30;
      uint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v24 + 32))(*(void *)(v7 + 56) + v33 * v15, v27, v23);
      ++*(void *)(v7 + 16);
      int64_t v14 = v49;
    }
  }
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

unint64_t sub_10001B218(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_100021898() & 1) == 0)
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
      while (!v14 && (sub_100021898() & 1) == 0);
    }
  }
  return v6;
}

void *sub_10001B2FC()
{
  sub_1000046A4(&qword_10002D040);
  uint64_t v34 = v0;
  uint64_t v1 = *v0;
  uint64_t v2 = sub_100021848();
  uint64_t v3 = *(void *)(v1 + 16);
  uint64_t v38 = v2;
  if (!v3)
  {
    uint64_t result = (void *)swift_release();
    uint64_t v33 = v38;
    uint64_t v32 = v34;
LABEL_28:
    *uint64_t v32 = v33;
    return result;
  }
  uint64_t v4 = v2;
  uint64_t result = (void *)(v2 + 64);
  unint64_t v6 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v1 || (unint64_t)result >= v1 + 64 + 8 * v6)
  {
    uint64_t result = memmove(result, (const void *)(v1 + 64), 8 * v6);
    uint64_t v4 = v38;
  }
  int64_t v8 = 0;
  *(void *)(v4 + 16) = *(void *)(v1 + 16);
  uint64_t v9 = 1 << *(unsigned char *)(v1 + 32);
  uint64_t v37 = v1;
  uint64_t v10 = -1;
  if (v9 < 64) {
    uint64_t v10 = ~(-1 << v9);
  }
  unint64_t v11 = v10 & *(void *)(v1 + 64);
  uint64_t v35 = v1 + 64;
  int64_t v36 = (unint64_t)(v9 + 63) >> 6;
  uint64_t v12 = v1;
  while (1)
  {
    if (v11)
    {
      unint64_t v13 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      int64_t v39 = v8;
      unint64_t v14 = v13 | (v8 << 6);
      goto LABEL_12;
    }
    int64_t v28 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v28 >= v36) {
      goto LABEL_26;
    }
    unint64_t v29 = *(void *)(v35 + 8 * v28);
    int64_t v30 = v8 + 1;
    if (!v29)
    {
      int64_t v30 = v28 + 1;
      if (v28 + 1 >= v36) {
        goto LABEL_26;
      }
      unint64_t v29 = *(void *)(v35 + 8 * v30);
      if (!v29) {
        break;
      }
    }
LABEL_25:
    unint64_t v11 = (v29 - 1) & v29;
    int64_t v39 = v30;
    unint64_t v14 = __clz(__rbit64(v29)) + (v30 << 6);
LABEL_12:
    uint64_t v15 = 16 * v14;
    uint64_t v16 = (uint64_t *)(*(void *)(v12 + 48) + 16 * v14);
    uint64_t v18 = *v16;
    uint64_t v17 = v16[1];
    uint64_t v19 = sub_100020B48();
    uint64_t v20 = *(void *)(v19 - 8);
    __chkstk_darwin(v19, v21);
    uint64_t v23 = (char *)&v34 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
    unint64_t v25 = *(void *)(v24 + 72) * v14;
    (*(void (**)(char *, unint64_t, uint64_t))(v20 + 16))(v23, *(void *)(v12 + 56) + v25, v19);
    uint64_t v26 = v38;
    id v27 = (void *)(*(void *)(v38 + 48) + v15);
    *id v27 = v18;
    v27[1] = v17;
    (*(void (**)(unint64_t, char *, uint64_t))(v20 + 32))(*(void *)(v26 + 56) + v25, v23, v19);
    uint64_t result = (void *)swift_bridgeObjectRetain();
    int64_t v8 = v39;
  }
  int64_t v31 = v28 + 2;
  if (v31 >= v36)
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    uint64_t v32 = v34;
    uint64_t v33 = v38;
    goto LABEL_28;
  }
  unint64_t v29 = *(void *)(v35 + 8 * v31);
  if (v29)
  {
    int64_t v30 = v31;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v30 = v31 + 1;
    if (__OFADD__(v31, 1)) {
      break;
    }
    if (v30 >= v36) {
      goto LABEL_26;
    }
    unint64_t v29 = *(void *)(v35 + 8 * v30);
    ++v31;
    if (v29) {
      goto LABEL_25;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

char *sub_10001B5D8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (char *)&_swiftEmptyArrayStorage;
  }
  sub_1000046A4(&qword_10002D048);
  uint64_t v3 = *(void *)(sub_100020B48() - 8);
  uint64_t v4 = *(void *)(v3 + 72);
  unint64_t v5 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  unint64_t v6 = (void *)swift_allocObject();
  uint64_t result = (char *)j__malloc_size(v6);
  if (v4)
  {
    if (&result[-v5] != (char *)0x8000000000000000 || v4 != -1)
    {
      v6[2] = v1;
      _OWORD v6[3] = 2 * ((uint64_t)&result[-v5] / v4);
      uint64_t v9 = sub_10001B72C(&v10, (uint64_t)v6 + v5, v1, a1);
      swift_bridgeObjectRetain();
      sub_10001BA88();
      if (v9 == (void *)v1) {
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

void *sub_10001B72C(void *result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v43 = a4;
  uint64_t v6 = *(void *)(a4 + 64);
  uint64_t v4 = a4 + 64;
  uint64_t v5 = v6;
  uint64_t v7 = -1 << *(unsigned char *)(v4 - 32);
  if (-v7 < 64) {
    uint64_t v8 = ~(-1 << -(char)v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & v5;
  if (!a2)
  {
    int64_t v22 = 0;
    uint64_t v13 = 0;
LABEL_36:
    *uint64_t result = v43;
    result[1] = v4;
    result[2] = ~v7;
    result[3] = v22;
    result[4] = v9;
    return (void *)v13;
  }
  if (!a3)
  {
    int64_t v22 = 0;
    uint64_t v13 = 0;
    goto LABEL_36;
  }
  if (a3 < 0)
  {
LABEL_38:
    __break(1u);
    goto LABEL_39;
  }
  uint64_t v45 = a2;
  uint64_t v34 = result;
  uint64_t v35 = v4;
  uint64_t v11 = sub_100020B48();
  uint64_t v13 = 0;
  uint64_t v38 = v11;
  uint64_t v14 = *(void *)(v11 - 8);
  uint64_t v15 = *(void *)(v14 + 64);
  uint64_t v41 = a3;
  uint64_t v42 = v15;
  int64_t v36 = (unint64_t)(63 - v7) >> 6;
  uint64_t v37 = v14;
  uint64_t v39 = v14 + 32;
  uint64_t v40 = v14 + 16;
  int64_t v32 = v36 - 1;
  uint64_t v33 = v7;
  uint64_t v16 = v11;
  while (1)
  {
    uint64_t v17 = __chkstk_darwin(v11, v12);
    uint64_t v19 = (char *)&v32 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t result = (void *)__chkstk_darwin(v17, v20);
    uint64_t v23 = (char *)&v32 - v21;
    if (v9)
    {
      uint64_t v44 = (v9 - 1) & v9;
      int64_t v24 = v22;
      unint64_t v25 = __clz(__rbit64(v9)) | (v22 << 6);
      goto LABEL_23;
    }
    int64_t v24 = v22 + 1;
    if (__OFADD__(v22, 1))
    {
      __break(1u);
      goto LABEL_38;
    }
    uint64_t v4 = v35;
    if (v24 >= v36) {
      goto LABEL_35;
    }
    unint64_t v26 = *(void *)(v35 + 8 * v24);
    if (!v26) {
      break;
    }
LABEL_22:
    uint64_t v44 = (v26 - 1) & v26;
    unint64_t v25 = __clz(__rbit64(v26)) + (v24 << 6);
LABEL_23:
    ++v13;
    uint64_t v28 = v37;
    uint64_t v29 = *(void *)(v37 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v37 + 16))((char *)&v32 - v21, *(void *)(v43 + 56) + v29 * v25, v16);
    int64_t v30 = *(void (**)(char *, char *, uint64_t))(v28 + 32);
    v30(v19, v23, v16);
    uint64_t v31 = v45;
    uint64_t v11 = ((uint64_t (*)(uint64_t, char *, uint64_t))v30)(v45, v19, v16);
    if (v13 == v41)
    {
      uint64_t v13 = v41;
      uint64_t result = v34;
      uint64_t v4 = v35;
      uint64_t v7 = v33;
      int64_t v22 = v24;
      unint64_t v9 = v44;
      goto LABEL_36;
    }
    uint64_t v45 = v31 + v29;
    unint64_t v9 = v44;
  }
  int64_t v27 = v22 + 2;
  ++v22;
  if (v24 + 1 >= v36) {
    goto LABEL_35;
  }
  unint64_t v26 = *(void *)(v35 + 8 * v27);
  if (v26) {
    goto LABEL_15;
  }
  int64_t v22 = v24 + 1;
  if (v24 + 2 >= v36) {
    goto LABEL_35;
  }
  unint64_t v26 = *(void *)(v35 + 8 * (v24 + 2));
  if (v26)
  {
    v24 += 2;
    goto LABEL_22;
  }
  int64_t v22 = v24 + 2;
  if (v24 + 3 >= v36) {
    goto LABEL_35;
  }
  unint64_t v26 = *(void *)(v35 + 8 * (v24 + 3));
  if (v26)
  {
    v24 += 3;
    goto LABEL_22;
  }
  int64_t v27 = v24 + 4;
  int64_t v22 = v24 + 3;
  if (v24 + 4 >= v36)
  {
LABEL_35:
    unint64_t v9 = 0;
    uint64_t v7 = v33;
    uint64_t result = v34;
    goto LABEL_36;
  }
  unint64_t v26 = *(void *)(v35 + 8 * v27);
  if (v26)
  {
LABEL_15:
    int64_t v24 = v27;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v24 = v27 + 1;
    if (__OFADD__(v27, 1)) {
      break;
    }
    if (v24 >= v36)
    {
      int64_t v22 = v32;
      goto LABEL_35;
    }
    unint64_t v26 = *(void *)(v35 + 8 * v24);
    ++v27;
    if (v26) {
      goto LABEL_22;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_10001BA88()
{
  return swift_release();
}

uint64_t getEnumTagSinglePayload for ResponseSender.Error(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for ResponseSender.Error(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x10001BB80);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_10001BBA8()
{
  return 0;
}

ValueMetadata *type metadata accessor for ResponseSender.Error()
{
  return &type metadata for ResponseSender.Error;
}

unint64_t sub_10001BBC8()
{
  unint64_t result = qword_10002D058[0];
  if (!qword_10002D058[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_10002D058);
  }
  return result;
}

uint64_t sub_10001BC1C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_allocateGenericValueMetadata(a1, a2, a3, 32);
}

uint64_t sub_10001BC24()
{
  uint64_t result = sub_100021758();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_10001BCC8(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v3 = a1;
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = v5;
  int v7 = *(_DWORD *)(v5 + 80);
  uint64_t v8 = v7;
  if (*(_DWORD *)(v5 + 84)) {
    size_t v9 = *(void *)(v5 + 64);
  }
  else {
    size_t v9 = *(void *)(v5 + 64) + 1;
  }
  size_t v10 = v9 + 7;
  unint64_t v11 = ((v9 + 7 + ((v7 + 1) & ~(unint64_t)v7)) & 0xFFFFFFFFFFFFFFF8) + 16;
  int v12 = v7 & 0x100000;
  if (v8 > 7 || v12 != 0 || v11 > 0x18)
  {
    uint64_t v15 = *a2;
    *int v3 = *a2;
    int v3 = (uint64_t *)(v15 + ((v8 & 0xF8 ^ 0x1F8) & (v8 + 16)));
  }
  else
  {
    *(unsigned char *)a1 = *(unsigned char *)a2;
    uint64_t v16 = (void *)(((unint64_t)a1 + v8 + 1) & ~v8);
    uint64_t v17 = (const void *)(((unint64_t)a2 + v8 + 1) & ~v8);
    if ((*(unsigned int (**)(unint64_t, uint64_t, uint64_t))(v5 + 48))(((unint64_t)a2 + v8 + 1) & ~v8, 1, v4))
    {
      memcpy(v16, v17, v9);
    }
    else
    {
      (*(void (**)(void *, const void *, uint64_t))(v6 + 16))(v16, v17, v4);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56))(v16, 0, 1, v4);
    }
    unint64_t v18 = ((unint64_t)v16 + v10) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v19 = ((unint64_t)v17 + v10) & 0xFFFFFFFFFFFFFFF8;
    if (*(void *)v19 < 0xFFFFFFFFuLL)
    {
      *(_OWORD *)unint64_t v18 = *(_OWORD *)v19;
      return v3;
    }
    uint64_t v20 = *(void *)(v19 + 8);
    *(void *)unint64_t v18 = *(void *)v19;
    *(void *)(v18 + 8) = v20;
  }
  swift_retain();
  return v3;
}

uint64_t sub_10001BE7C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  uint64_t v3 = *(void *)(v2 - 8);
  unint64_t v4 = (a1 + *(unsigned __int8 *)(v3 + 80) + 1) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v3 + 48))(v4, 1, v2);
  if (!result) {
    uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t))(v3 + 8))(v4, v2);
  }
  unint64_t v6 = v4 + *(void *)(v3 + 64);
  if (!*(_DWORD *)(v3 + 84)) {
    ++v6;
  }
  if (*(void *)((v6 + 7) & 0xFFFFFFFFFFFFFFF8) >= 0xFFFFFFFFuLL)
  {
    return swift_release();
  }
  return result;
}

unsigned char *sub_10001BF84(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(unsigned __int8 *)(v5 + 80);
  int v7 = (void *)((unint64_t)&a1[v6 + 1] & ~v6);
  uint64_t v8 = (const void *)((unint64_t)&a2[v6 + 1] & ~v6);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v5 + 48))(v8, 1, v4))
  {
    int v9 = *(_DWORD *)(v5 + 84);
    size_t v10 = *(void *)(v5 + 64);
    if (v9) {
      size_t v11 = v10;
    }
    else {
      size_t v11 = v10 + 1;
    }
    memcpy(v7, v8, v11);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v5 + 16))(v7, v8, v4);
    uint64_t v13 = *(void (**)(void *, void, uint64_t, uint64_t))(v5 + 56);
    uint64_t v12 = v5 + 56;
    v13(v7, 0, 1, v4);
    int v9 = *(_DWORD *)(v12 + 28);
    size_t v10 = *(void *)(v12 + 8);
  }
  if (v9) {
    size_t v14 = v10;
  }
  else {
    size_t v14 = v10 + 1;
  }
  unint64_t v15 = ((unint64_t)v7 + v14 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v16 = ((unint64_t)v8 + v14 + 7) & 0xFFFFFFFFFFFFFFF8;
  if (*(void *)v16 < 0xFFFFFFFFuLL)
  {
    *(_OWORD *)unint64_t v15 = *(_OWORD *)v16;
  }
  else
  {
    uint64_t v17 = *(void *)(v16 + 8);
    *(void *)unint64_t v15 = *(void *)v16;
    *(void *)(v15 + 8) = v17;
    swift_retain();
  }
  return a1;
}

unsigned char *sub_10001C0F0(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(unsigned __int8 *)(v5 + 80);
  int v7 = (void *)((unint64_t)&a1[v6 + 1] & ~v6);
  uint64_t v8 = (void *)((unint64_t)&a2[v6 + 1] & ~v6);
  int v9 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v5 + 48);
  int v10 = v9(v7, 1, v4);
  int v11 = v9(v8, 1, v4);
  if (v10)
  {
    if (!v11)
    {
      (*(void (**)(void *, void *, uint64_t))(v5 + 16))(v7, v8, v4);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v5 + 56))(v7, 0, 1, v4);
      goto LABEL_12;
    }
    int v12 = *(_DWORD *)(v5 + 84);
    size_t v13 = *(void *)(v5 + 64);
  }
  else
  {
    if (!v11)
    {
      (*(void (**)(void *, void *, uint64_t))(v5 + 24))(v7, v8, v4);
      goto LABEL_12;
    }
    (*(void (**)(void *, uint64_t))(v5 + 8))(v7, v4);
    int v12 = *(_DWORD *)(v5 + 84);
    size_t v13 = *(void *)(v5 + 64);
  }
  if (v12) {
    size_t v14 = v13;
  }
  else {
    size_t v14 = v13 + 1;
  }
  memcpy(v7, v8, v14);
LABEL_12:
  if (*(_DWORD *)(v5 + 84)) {
    uint64_t v15 = *(void *)(v5 + 64);
  }
  else {
    uint64_t v15 = *(void *)(v5 + 64) + 1;
  }
  unint64_t v16 = (void *)(((unint64_t)v7 + v15 + 7) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v17 = (unint64_t *)(((unint64_t)v8 + v15 + 7) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v18 = *v17;
  if (*v16 < 0xFFFFFFFFuLL)
  {
    if (v18 >= 0xFFFFFFFF)
    {
      unint64_t v20 = v17[1];
      *unint64_t v16 = v18;
      v16[1] = v20;
      swift_retain();
      return a1;
    }
LABEL_21:
    *(_OWORD *)unint64_t v16 = *(_OWORD *)v17;
    return a1;
  }
  if (v18 < 0xFFFFFFFF)
  {
    swift_release();
    goto LABEL_21;
  }
  unint64_t v19 = v17[1];
  *unint64_t v16 = v18;
  v16[1] = v19;
  swift_retain();
  swift_release();
  return a1;
}

unsigned char *sub_10001C318(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(unsigned __int8 *)(v5 + 80);
  int v7 = (void *)((unint64_t)&a1[v6 + 1] & ~v6);
  uint64_t v8 = (const void *)((unint64_t)&a2[v6 + 1] & ~v6);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v5 + 48))(v8, 1, v4))
  {
    int v9 = *(_DWORD *)(v5 + 84);
    size_t v10 = *(void *)(v5 + 64);
    if (v9) {
      size_t v11 = v10;
    }
    else {
      size_t v11 = v10 + 1;
    }
    memcpy(v7, v8, v11);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v5 + 32))(v7, v8, v4);
    size_t v13 = *(void (**)(void *, void, uint64_t, uint64_t))(v5 + 56);
    uint64_t v12 = v5 + 56;
    v13(v7, 0, 1, v4);
    int v9 = *(_DWORD *)(v12 + 28);
    size_t v10 = *(void *)(v12 + 8);
  }
  if (v9) {
    size_t v14 = v10;
  }
  else {
    size_t v14 = v10 + 1;
  }
  unint64_t v15 = ((unint64_t)v7 + v14 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v16 = (uint64_t *)(((unint64_t)v8 + v14 + 7) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v17 = *v16;
  if ((unint64_t)*v16 < 0xFFFFFFFF)
  {
    *(_OWORD *)unint64_t v15 = *(_OWORD *)v16;
  }
  else
  {
    uint64_t v18 = v16[1];
    *(void *)unint64_t v15 = v17;
    *(void *)(v15 + 8) = v18;
  }
  return a1;
}

unsigned char *sub_10001C480(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(unsigned __int8 *)(v5 + 80);
  int v7 = (void *)((unint64_t)&a1[v6 + 1] & ~v6);
  uint64_t v8 = (void *)((unint64_t)&a2[v6 + 1] & ~v6);
  int v9 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v5 + 48);
  int v10 = v9(v7, 1, v4);
  int v11 = v9(v8, 1, v4);
  if (v10)
  {
    if (!v11)
    {
      (*(void (**)(void *, void *, uint64_t))(v5 + 32))(v7, v8, v4);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v5 + 56))(v7, 0, 1, v4);
      goto LABEL_12;
    }
    int v12 = *(_DWORD *)(v5 + 84);
    size_t v13 = *(void *)(v5 + 64);
  }
  else
  {
    if (!v11)
    {
      (*(void (**)(void *, void *, uint64_t))(v5 + 40))(v7, v8, v4);
      goto LABEL_12;
    }
    (*(void (**)(void *, uint64_t))(v5 + 8))(v7, v4);
    int v12 = *(_DWORD *)(v5 + 84);
    size_t v13 = *(void *)(v5 + 64);
  }
  if (v12) {
    size_t v14 = v13;
  }
  else {
    size_t v14 = v13 + 1;
  }
  memcpy(v7, v8, v14);
LABEL_12:
  if (*(_DWORD *)(v5 + 84)) {
    uint64_t v15 = *(void *)(v5 + 64);
  }
  else {
    uint64_t v15 = *(void *)(v5 + 64) + 1;
  }
  unint64_t v16 = (void *)(((unint64_t)v7 + v15 + 7) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v17 = (unint64_t *)(((unint64_t)v8 + v15 + 7) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v18 = *v17;
  if (*v16 < 0xFFFFFFFFuLL)
  {
    if (v18 >= 0xFFFFFFFF)
    {
      unint64_t v20 = v17[1];
      *unint64_t v16 = v18;
      v16[1] = v20;
      return a1;
    }
LABEL_21:
    *(_OWORD *)unint64_t v16 = *(_OWORD *)v17;
    return a1;
  }
  if (v18 < 0xFFFFFFFF)
  {
    swift_release();
    goto LABEL_21;
  }
  unint64_t v19 = v17[1];
  *unint64_t v16 = v18;
  v16[1] = v19;
  swift_release();
  return a1;
}

uint64_t sub_10001C69C(_DWORD *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v5 = v4;
  int v6 = *(_DWORD *)(v4 + 84);
  if (v6) {
    unsigned int v7 = v6 - 1;
  }
  else {
    unsigned int v7 = 0;
  }
  if (v7 <= 0x7FFFFFFE) {
    unsigned int v8 = 2147483646;
  }
  else {
    unsigned int v8 = v7;
  }
  uint64_t v9 = *(unsigned __int8 *)(v4 + 80);
  uint64_t v10 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  if (!v6) {
    ++v10;
  }
  if (!a2) {
    return 0;
  }
  uint64_t v11 = v10 + 7;
  if (v8 < a2)
  {
    unint64_t v12 = ((v11 + ((v9 + 1) & ~v9)) & 0xFFFFFFFFFFFFFFF8) + 16;
    unsigned int v13 = a2 - v8;
    uint64_t v14 = v12 & 0xFFFFFFF8;
    if ((v12 & 0xFFFFFFF8) != 0) {
      unsigned int v15 = 2;
    }
    else {
      unsigned int v15 = v13 + 1;
    }
    if (v15 >= 0x10000) {
      LODWORD(v16) = 4;
    }
    else {
      LODWORD(v16) = 2;
    }
    if (v15 < 0x100) {
      LODWORD(v16) = 1;
    }
    if (v15 >= 2) {
      uint64_t v16 = v16;
    }
    else {
      uint64_t v16 = 0;
    }
    switch(v16)
    {
      case 1:
        int v17 = *((unsigned __int8 *)a1 + v12);
        if (!v17) {
          break;
        }
        goto LABEL_27;
      case 2:
        int v17 = *(unsigned __int16 *)((char *)a1 + v12);
        if (v17) {
          goto LABEL_27;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x10001C848);
      case 4:
        int v17 = *(_DWORD *)((char *)a1 + v12);
        if (!v17) {
          break;
        }
LABEL_27:
        int v19 = v17 - 1;
        if (v14)
        {
          int v19 = 0;
          LODWORD(v14) = *a1;
        }
        return v8 + (v14 | v19) + 1;
      default:
        break;
    }
  }
  uint64_t v20 = ((unint64_t)a1 + v9 + 1) & ~v9;
  if (v7 < 0x7FFFFFFE)
  {
    unint64_t v22 = *(void *)((v11 + v20) & 0xFFFFFFFFFFFFFFF8);
    if (v22 >= 0xFFFFFFFF) {
      LODWORD(v22) = -1;
    }
    if ((v22 + 1) >= 2) {
      return v22;
    }
    else {
      return 0;
    }
  }
  else
  {
    unsigned int v21 = (*(uint64_t (**)(uint64_t))(v5 + 48))(v20);
    if (v21 >= 2) {
      return v21 - 1;
    }
    else {
      return 0;
    }
  }
}

void sub_10001C85C(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  int v6 = 0;
  uint64_t v7 = *(void *)(*(void *)(a4 + 16) - 8);
  int v8 = *(_DWORD *)(v7 + 84);
  unsigned int v9 = v8 - 1;
  if (!v8) {
    unsigned int v9 = 0;
  }
  if (v9 <= 0x7FFFFFFE) {
    unsigned int v10 = 2147483646;
  }
  else {
    unsigned int v10 = v9;
  }
  uint64_t v11 = *(unsigned __int8 *)(v7 + 80);
  size_t v12 = *(void *)(*(void *)(*(void *)(a4 + 16) - 8) + 64);
  if (!v8) {
    ++v12;
  }
  size_t v13 = ((v12 + 7 + ((v11 + 1) & ~v11)) & 0xFFFFFFFFFFFFFFF8) + 16;
  if (v10 < a3)
  {
    unsigned int v14 = a3 - v10;
    if (((v12 + 7 + ((v11 + 1) & ~v11)) & 0xFFFFFFF8) == 0xFFFFFFF0) {
      unsigned int v15 = v14 + 1;
    }
    else {
      unsigned int v15 = 2;
    }
    if (v15 >= 0x10000) {
      int v16 = 4;
    }
    else {
      int v16 = 2;
    }
    if (v15 < 0x100) {
      int v16 = 1;
    }
    if (v15 >= 2) {
      int v6 = v16;
    }
    else {
      int v6 = 0;
    }
  }
  if (a2 > v10)
  {
    if (((v12 + 7 + ((v11 + 1) & ~v11)) & 0xFFFFFFF8) == 0xFFFFFFF0) {
      int v17 = a2 - v10;
    }
    else {
      int v17 = 1;
    }
    if (((v12 + 7 + ((v11 + 1) & ~v11)) & 0xFFFFFFF8) != 0xFFFFFFF0)
    {
      unsigned int v18 = ~v10 + a2;
      bzero(a1, v13);
      *(_DWORD *)a1 = v18;
    }
    switch(v6)
    {
      case 1:
        a1[v13] = v17;
        return;
      case 2:
        *(_WORD *)&a1[v13] = v17;
        return;
      case 3:
        goto LABEL_58;
      case 4:
        *(_DWORD *)&a1[v13] = v17;
        return;
      default:
        return;
    }
  }
  switch(v6)
  {
    case 1:
      a1[v13] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_35;
    case 2:
      *(_WORD *)&a1[v13] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_35;
    case 3:
LABEL_58:
      __break(1u);
      JUMPOUT(0x10001CB0CLL);
    case 4:
      *(_DWORD *)&a1[v13] = 0;
      goto LABEL_34;
    default:
LABEL_34:
      if (a2)
      {
LABEL_35:
        unint64_t v19 = (unint64_t)&a1[v11 + 1] & ~v11;
        if (v9 < 0x7FFFFFFE)
        {
          uint64_t v23 = (void *)((v12 + 7 + v19) & 0xFFFFFFFFFFFFFFF8);
          if (a2 > 0x7FFFFFFE)
          {
            void *v23 = 0;
            v23[1] = 0;
            *(_DWORD *)uint64_t v23 = a2 - 0x7FFFFFFF;
          }
          else
          {
            void *v23 = a2;
          }
        }
        else if (v9 >= a2)
        {
          uint64_t v24 = a2 + 1;
          unint64_t v25 = *(void (**)(unint64_t, uint64_t))(v7 + 56);
          unint64_t v26 = (unint64_t)&a1[v11 + 1] & ~v11;
          v25(v26, v24);
        }
        else
        {
          if (v12 <= 3) {
            int v20 = ~(-1 << (8 * v12));
          }
          else {
            int v20 = -1;
          }
          if (v12)
          {
            int v21 = v20 & (~v9 + a2);
            if (v12 <= 3) {
              int v22 = v12;
            }
            else {
              int v22 = 4;
            }
            bzero((void *)((unint64_t)&a1[v11 + 1] & ~v11), v12);
            switch(v22)
            {
              case 2:
                *(_WORD *)unint64_t v19 = v21;
                break;
              case 3:
                *(_WORD *)unint64_t v19 = v21;
                *(unsigned char *)(v19 + 2) = BYTE2(v21);
                break;
              case 4:
                *(_DWORD *)unint64_t v19 = v21;
                break;
              default:
                *(unsigned char *)unint64_t v19 = v21;
                break;
            }
          }
        }
      }
      return;
  }
}

uint64_t type metadata accessor for OptionsDropdown()
{
  return sub_10000361C();
}

uint64_t sub_10001CB5C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10001CBA0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100021148();
  __chkstk_darwin(v4, v5);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(a2 - 8) + 16))((char *)&v8 - v6, a1, a2);
  swift_storeEnumTagMultiPayload();
  return sub_100021158();
}

uint64_t sub_10001CC98(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_100021148();
  __chkstk_darwin(v5, v6);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(a3 - 8) + 16))((char *)&v9 - v7, a1, a3);
  swift_storeEnumTagMultiPayload();
  return sub_100021158();
}

uint64_t sub_10001CD90@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v168 = a2;
  uint64_t v3 = sub_1000046A4(&qword_10002D0E0);
  __chkstk_darwin(v3, v4);
  uint64_t v139 = (uint64_t)&v135 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1000046A4(&qword_10002D0E8);
  uint64_t v8 = __chkstk_darwin(v6, v7);
  unint64_t v138 = (char *)&v135 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8, v10);
  uint64_t v140 = (uint64_t)&v135 - v11;
  uint64_t v144 = sub_1000046A4(&qword_10002D0F0);
  uint64_t v143 = *(void *)(v144 - 8);
  __chkstk_darwin(v144, v12);
  unint64_t v141 = (char *)&v135 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_1000046A4(&qword_10002D0F8);
  __chkstk_darwin(v14 - 8, v15);
  uint64_t v145 = (char *)&v135 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_1000046A4(&qword_10002D100);
  uint64_t v19 = __chkstk_darwin(v17, v18);
  uint64_t v142 = (uint64_t)&v135 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v19, v21);
  uint64_t v146 = (uint64_t)&v135 - v22;
  uint64_t v156 = a1;
  uint64_t v23 = *(void *)(a1 + 16);
  unint64_t v24 = sub_10001EA00();
  uint64_t v25 = *(void *)(a1 + 24);
  uint64_t v161 = v3;
  uint64_t v196 = v3;
  uint64_t v197 = v23;
  unint64_t v160 = v24;
  unint64_t v198 = v24;
  uint64_t v199 = v25;
  uint64_t v157 = v25;
  uint64_t v26 = sub_100021218();
  sub_100021178();
  uint64_t v27 = sub_100020FC8();
  sub_1000047C8(&qword_10002D188);
  uint64_t v28 = sub_100020FC8();
  uint64_t v155 = v17;
  uint64_t v29 = sub_100021168();
  uint64_t v154 = *(void *)(v29 - 8);
  uint64_t v31 = __chkstk_darwin(v29, v30);
  unint64_t v153 = (char *)&v135 - v32;
  uint64_t v169 = v26;
  uint64_t v148 = *(void *)(v26 - 8);
  uint64_t v34 = __chkstk_darwin(v31, v33);
  uint64_t v147 = (char *)&v135 - v35;
  uint64_t v166 = v27;
  uint64_t v150 = *(void *)(v27 - 8);
  uint64_t v37 = __chkstk_darwin(v34, v36);
  uint64_t v149 = (char *)&v135 - v38;
  uint64_t v158 = v28;
  uint64_t v152 = *(void *)(v28 - 8);
  uint64_t v40 = __chkstk_darwin(v37, v39);
  uint64_t v42 = (char *)&v135 - ((v41 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v40, v43);
  uint64_t v151 = (char *)&v135 - v44;
  uint64_t v45 = sub_100021758();
  uint64_t v46 = *(void *)(v45 - 8);
  uint64_t v48 = __chkstk_darwin(v45, v47);
  uint64_t v50 = (char *)&v135 - v49;
  uint64_t v51 = *(void *)(v23 - 8);
  __chkstk_darwin(v48, v52);
  uint64_t v54 = (char *)&v135 - ((v53 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v162 = v29;
  uint64_t v55 = v156;
  uint64_t v167 = v6;
  uint64_t v165 = sub_100021168();
  uint64_t v164 = *(void *)(v165 - 8);
  __chkstk_darwin(v165, v56);
  uint64_t v163 = (char *)&v135 - v57;
  unint64_t v58 = v159;
  (*(void (**)(char *, char *, uint64_t))(v46 + 16))(v50, &v159[*(int *)(v55 + 36)], v45);
  uint64_t v59 = v51;
  uint64_t v60 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v51 + 48);
  uint64_t v61 = v23;
  if (v60(v50, 1, v23) == 1)
  {
    uint64_t v62 = v157;
    uint64_t v63 = v158;
    (*(void (**)(char *, uint64_t))(v46 + 8))(v50, v45);
    uint64_t v64 = (uint64_t *)&v58[*(int *)(v55 + 40)];
    uint64_t v65 = *v64;
    if (*v64)
    {
      uint64_t v66 = v64[1];
      uint64_t v67 = swift_allocObject();
      *(void *)(v67 + 16) = v65;
      *(void *)(v67 + 24) = v66;
      __chkstk_darwin(v67, v68);
      uint64_t v156 = v65;
      *(&v135 - 4) = v61;
      *(&v135 - 3) = v62;
      *(&v135 - 2) = (uint64_t)v58;
      swift_retain_n();
      uint64_t v69 = v141;
      sub_100021378();
      sub_100004DE0(&qword_10002D1A8, &qword_10002D0F0);
      uint64_t v70 = (uint64_t)v145;
      uint64_t v71 = v144;
      sub_100021298();
      (*(void (**)(char *, uint64_t))(v143 + 8))(v69, v71);
      char v72 = *v58;
      uint64_t KeyPath = swift_getKeyPath();
      uint64_t v74 = swift_allocObject();
      *(unsigned char *)(v74 + 16) = (v72 & 1) == 0;
      uint64_t v75 = v142;
      sub_100004C80(v70, v142, &qword_10002D0F8);
      uint64_t v76 = v155;
      uint64_t v77 = (uint64_t *)(v75 + *(int *)(v155 + 36));
      *uint64_t v77 = KeyPath;
      v77[1] = (uint64_t)sub_10001EFDC;
      v77[2] = v74;
      sub_100004CE4(v70, &qword_10002D0F8);
      uint64_t v78 = v146;
      sub_100004D40(v75, v146, &qword_10002D100);
      uint64_t WitnessTable = swift_getWitnessTable();
      unint64_t v80 = sub_10001ECFC();
      uint64_t v180 = WitnessTable;
      unint64_t v181 = v80;
      uint64_t v81 = swift_getWitnessTable();
      uint64_t v82 = sub_100004DE0(&qword_10002D190, &qword_10002D188);
      uint64_t v178 = v81;
      uint64_t v179 = v82;
      uint64_t v83 = v63;
      uint64_t v84 = swift_getWitnessTable();
      unint64_t v85 = sub_10001ED54();
      uint64_t v86 = (uint64_t)v153;
      sub_10001CC98(v78, v83, v76);
      uint64_t v176 = v84;
      unint64_t v177 = v85;
      uint64_t v87 = v162;
      swift_getWitnessTable();
      sub_10001EE94();
      uint64_t v88 = v163;
      sub_10001CBA0(v86, v87);
      sub_10000AAB0(v156);
      (*(void (**)(uint64_t, uint64_t))(v154 + 8))(v86, v87);
      uint64_t v89 = v78;
      uint64_t v90 = &qword_10002D100;
    }
    else
    {
      uint64_t v114 = v139;
      sub_10001DF98(v139);
      uint64_t v115 = (uint64_t)v138;
      sub_100021298();
      sub_100004CE4(v114, &qword_10002D0E0);
      uint64_t v116 = v140;
      sub_100004D40(v115, v140, &qword_10002D0E8);
      uint64_t v117 = swift_getWitnessTable();
      unint64_t v118 = sub_10001ECFC();
      uint64_t v194 = v117;
      unint64_t v195 = v118;
      uint64_t v119 = swift_getWitnessTable();
      uint64_t v120 = sub_100004DE0(&qword_10002D190, &qword_10002D188);
      uint64_t v192 = v119;
      uint64_t v193 = v120;
      uint64_t v121 = swift_getWitnessTable();
      unint64_t v122 = sub_10001ED54();
      uint64_t v190 = v121;
      unint64_t v191 = v122;
      uint64_t v123 = v162;
      swift_getWitnessTable();
      sub_10001EE94();
      uint64_t v88 = v163;
      sub_10001CC98(v116, v123, v167);
      uint64_t v89 = v116;
      uint64_t v90 = &qword_10002D0E8;
    }
    sub_100004CE4(v89, v90);
  }
  else
  {
    uint64_t v137 = v59;
    uint64_t v91 = *(uint64_t (**)(char *, char *, uint64_t))(v59 + 32);
    uint64_t v136 = v54;
    uint64_t v92 = v91(v54, v50, v23);
    uint64_t v94 = __chkstk_darwin(v92, v93);
    uint64_t v95 = v157;
    *(&v135 - 4) = v23;
    *(&v135 - 3) = v95;
    *(&v135 - 2) = (uint64_t)v54;
    __chkstk_darwin(v94, &v135 - 6);
    uint64_t v135 = v23;
    *(&v135 - 4) = v23;
    *(&v135 - 3) = v96;
    *(&v135 - 2) = (uint64_t)v58;
    char v97 = v147;
    sub_100021208();
    uint64_t v98 = v169;
    uint64_t v99 = swift_getWitnessTable();
    unint64_t v100 = v149;
    sub_100021298();
    (*(void (**)(char *, uint64_t))(v148 + 8))(v97, v98);
    unint64_t v101 = sub_10001ECFC();
    uint64_t v174 = v99;
    unint64_t v175 = v101;
    uint64_t v102 = v166;
    uint64_t v103 = swift_getWitnessTable();
    sub_1000212A8();
    (*(void (**)(char *, uint64_t))(v150 + 8))(v100, v102);
    uint64_t v104 = sub_100004DE0(&qword_10002D190, &qword_10002D188);
    uint64_t v172 = v103;
    uint64_t v173 = v104;
    uint64_t v105 = v158;
    uint64_t v106 = swift_getWitnessTable();
    uint64_t v107 = v152;
    uint64_t v108 = *(void (**)(char *, char *, uint64_t))(v152 + 16);
    uint64_t v109 = v151;
    v108(v151, v42, v105);
    uint64_t v110 = *(void (**)(char *, uint64_t))(v107 + 8);
    v110(v42, v105);
    v108(v42, v109, v105);
    unint64_t v111 = sub_10001ED54();
    uint64_t v112 = (uint64_t)v153;
    sub_10001CBA0((uint64_t)v42, v105);
    v110(v42, v105);
    uint64_t v170 = v106;
    unint64_t v171 = v111;
    uint64_t v113 = v162;
    swift_getWitnessTable();
    sub_10001EE94();
    uint64_t v88 = v163;
    sub_10001CBA0(v112, v113);
    (*(void (**)(uint64_t, uint64_t))(v154 + 8))(v112, v113);
    v110(v109, v105);
    (*(void (**)(char *, uint64_t))(v137 + 8))(v136, v135);
  }
  uint64_t v124 = swift_getWitnessTable();
  unint64_t v125 = sub_10001ECFC();
  uint64_t v188 = v124;
  unint64_t v189 = v125;
  uint64_t v126 = swift_getWitnessTable();
  uint64_t v127 = sub_100004DE0(&qword_10002D190, &qword_10002D188);
  uint64_t v186 = v126;
  uint64_t v187 = v127;
  uint64_t v128 = swift_getWitnessTable();
  unint64_t v129 = sub_10001ED54();
  uint64_t v184 = v128;
  unint64_t v185 = v129;
  uint64_t v130 = swift_getWitnessTable();
  unint64_t v131 = sub_10001EE94();
  uint64_t v182 = v130;
  unint64_t v183 = v131;
  uint64_t v132 = v165;
  swift_getWitnessTable();
  uint64_t v133 = v164;
  (*(void (**)(uint64_t, char *, uint64_t))(v164 + 16))(v168, v88, v132);
  return (*(uint64_t (**)(char *, uint64_t))(v133 + 8))(v88, v132);
}

uint64_t sub_10001DEA4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = *(void *)(a2 - 8);
  __chkstk_darwin(a1, a1);
  uint64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *(void (**)(char *))(v5 + 16);
  v8(v7);
  ((void (*)(uint64_t, char *, uint64_t))v8)(a3, v7, a2);
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, a2);
}

uint64_t sub_10001DF98@<X0>(uint64_t a1@<X8>)
{
  uint64_t v72 = a1;
  uint64_t v1 = sub_100021358();
  uint64_t v70 = *(void *)(v1 - 8);
  uint64_t v71 = v1;
  __chkstk_darwin(v1, v2);
  uint64_t v69 = (char *)&v65 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v68 = sub_100020FD8() - 8;
  __chkstk_darwin(v68, v4);
  uint64_t v67 = (char *)&v65 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1000046A4(&qword_10002D158);
  __chkstk_darwin(v6 - 8, v7);
  uint64_t v9 = (char *)&v65 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1000046A4(&qword_10002D148);
  uint64_t v11 = v10 - 8;
  __chkstk_darwin(v10, v12);
  uint64_t v14 = (char *)&v65 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_1000046A4(&qword_10002D138);
  uint64_t v16 = v15 - 8;
  __chkstk_darwin(v15, v17);
  uint64_t v19 = (char *)&v65 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_1000046A4(&qword_10002D128);
  uint64_t v21 = v20 - 8;
  __chkstk_darwin(v20, v22);
  unint64_t v24 = (char *)&v65 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = sub_1000046A4(&qword_10002D118);
  uint64_t v26 = v25 - 8;
  __chkstk_darwin(v25, v27);
  uint64_t v66 = (char *)&v65 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v9 = sub_1000210E8();
  *((void *)v9 + 1) = 0;
  v9[16] = 1;
  uint64_t v29 = sub_1000046A4(&qword_10002D1B8);
  sub_10001E4FC(&v9[*(int *)(v29 + 44)]);
  char v30 = sub_1000211B8();
  sub_100020F58();
  uint64_t v32 = v31;
  uint64_t v34 = v33;
  uint64_t v36 = v35;
  uint64_t v38 = v37;
  sub_100004C80((uint64_t)v9, (uint64_t)v14, &qword_10002D158);
  uint64_t v39 = &v14[*(int *)(v11 + 44)];
  *uint64_t v39 = v30;
  *((void *)v39 + 1) = v32;
  *((void *)v39 + 2) = v34;
  *((void *)v39 + 3) = v36;
  *((void *)v39 + 4) = v38;
  v39[40] = 0;
  sub_100004CE4((uint64_t)v9, &qword_10002D158);
  sub_1000213B8();
  sub_100020F78();
  sub_100004C80((uint64_t)v14, (uint64_t)v19, &qword_10002D148);
  uint64_t v40 = &v19[*(int *)(v16 + 44)];
  long long v41 = v74;
  *(_OWORD *)uint64_t v40 = v73;
  *((_OWORD *)v40 + 1) = v41;
  *((_OWORD *)v40 + 2) = v75;
  sub_100004CE4((uint64_t)v14, &qword_10002D148);
  id v42 = [self tertiarySystemFillColor];
  uint64_t v43 = sub_1000212B8();
  LOBYTE(v16) = sub_1000211A8();
  sub_100004C80((uint64_t)v19, (uint64_t)v24, &qword_10002D138);
  uint64_t v44 = &v24[*(int *)(v21 + 44)];
  *(void *)uint64_t v44 = v43;
  v44[8] = v16;
  sub_100004CE4((uint64_t)v19, &qword_10002D138);
  uint64_t v45 = v67;
  uint64_t v46 = &v67[*(int *)(v68 + 28)];
  uint64_t v47 = enum case for RoundedCornerStyle.continuous(_:);
  uint64_t v48 = sub_1000210F8();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v48 - 8) + 104))(v46, v47, v48);
  __asm { FMOV            V0.2D, #10.0 }
  *uint64_t v45 = _Q0;
  uint64_t v54 = (uint64_t)v66;
  uint64_t v55 = (uint64_t)&v66[*(int *)(v26 + 44)];
  sub_10001F038((uint64_t)v45, v55);
  *(_WORD *)(v55 + *(int *)(sub_1000046A4(&qword_10002D178) + 36)) = 256;
  sub_100004C80((uint64_t)v24, v54, &qword_10002D128);
  sub_10001F09C((uint64_t)v45);
  sub_100004CE4((uint64_t)v24, &qword_10002D128);
  uint64_t v57 = v69;
  uint64_t v56 = v70;
  uint64_t v58 = v71;
  (*(void (**)(char *, void, uint64_t))(v70 + 104))(v69, enum case for Image.Scale.small(_:), v71);
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v60 = sub_1000046A4(&qword_10002D0E0);
  uint64_t v61 = v72;
  uint64_t v62 = (uint64_t *)(v72 + *(int *)(v60 + 36));
  uint64_t v63 = sub_1000046A4(&qword_10002C8A8);
  (*(void (**)(char *, char *, uint64_t))(v56 + 16))((char *)v62 + *(int *)(v63 + 28), v57, v58);
  *uint64_t v62 = KeyPath;
  sub_100004C80(v54, v61, &qword_10002D118);
  (*(void (**)(char *, uint64_t))(v56 + 8))(v57, v58);
  return sub_100004CE4(v54, &qword_10002D118);
}

uint64_t sub_10001E4FC@<X0>(_OWORD *a1@<X8>)
{
  uint64_t v50 = a1;
  uint64_t v1 = sub_1000046A4(&qword_10002D1C0);
  uint64_t v3 = __chkstk_darwin(v1 - 8, v2);
  uint64_t v54 = (uint64_t)&v50 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3, v5);
  uint64_t v53 = (uint64_t)&v50 - v6;
  uint64_t v7 = sub_1000213B8();
  sub_100006170(0.0, 1, 0.0, 1, 12.0, 0, 0.0, 1, (uint64_t)v55, 0.0, 1, 0.0, 1, v7, v8, 0, 1);
  type metadata accessor for MessageParser();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v10 = [self bundleForClass:ObjCClassFromMetadata];
  uint64_t v11 = sub_100020BE8();
  uint64_t v13 = v12;

  *(void *)&long long v56 = v11;
  *((void *)&v56 + 1) = v13;
  sub_1000046E8();
  uint64_t v14 = sub_100021248();
  uint64_t v51 = v14;
  uint64_t v16 = v15;
  uint64_t v18 = v17;
  LOBYTE(v13) = v19 & 1;
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v52 = KeyPath;
  uint64_t v21 = sub_1000211C8();
  uint64_t v22 = swift_getKeyPath();
  uint64_t v23 = sub_100021308();
  uint64_t v24 = swift_getKeyPath();
  *(void *)&long long v56 = v14;
  *((void *)&v56 + 1) = v16;
  LOBYTE(v57) = v13;
  *((void *)&v57 + 1) = v18;
  *(void *)&long long v58 = KeyPath;
  *((void *)&v58 + 1) = 1;
  LOBYTE(v59) = 0;
  *((void *)&v59 + 1) = v22;
  *(void *)&long long v60 = v21;
  *((void *)&v60 + 1) = v24;
  *(void *)&long long v61 = v23;
  sub_1000046A4(&qword_10002D1C8);
  sub_10001F118();
  sub_100021298();
  sub_10000473C(v51, v16, v13);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v52 = sub_100021338();
  uint64_t v51 = swift_getKeyPath();
  uint64_t v25 = sub_1000211C8();
  uint64_t v26 = swift_getKeyPath();
  id v27 = [self tertiaryLabelColor];
  uint64_t v28 = sub_1000212B8();
  uint64_t v29 = swift_getKeyPath();
  uint64_t v30 = sub_1000213B8();
  sub_100006170(0.0, 1, 0.0, 1, 12.0, 0, 0.0, 1, (uint64_t)&v56, 0.0, 1, 0.0, 1, v30, v31, 0, 1);
  uint64_t v33 = v53;
  uint64_t v32 = v54;
  sub_100004C80(v53, v54, &qword_10002D1C0);
  long long v34 = v55[5];
  uint64_t v35 = v50;
  v50[4] = v55[4];
  v35[5] = v34;
  long long v36 = v55[7];
  v35[6] = v55[6];
  v35[7] = v36;
  long long v37 = v55[1];
  *uint64_t v35 = v55[0];
  v35[1] = v37;
  long long v38 = v55[3];
  v35[2] = v55[2];
  v35[3] = v38;
  uint64_t v39 = v35;
  uint64_t v40 = (int *)sub_1000046A4(&qword_10002D1F8);
  sub_100004C80(v32, (uint64_t)v39 + v40[12], &qword_10002D1C0);
  long long v41 = (char *)v39 + v40[16];
  *(void *)long long v41 = 0;
  v41[8] = 1;
  id v42 = (char *)v39 + v40[20];
  uint64_t v43 = v51;
  *(void *)id v42 = v52;
  *((void *)v42 + 1) = v43;
  *((void *)v42 + 2) = 1;
  v42[24] = 0;
  *((void *)v42 + 4) = v26;
  *((void *)v42 + 5) = v25;
  *((void *)v42 + 6) = v29;
  *((void *)v42 + 7) = v28;
  uint64_t v44 = (_OWORD *)((char *)v39 + v40[24]);
  long long v45 = v61;
  v44[4] = v60;
  v44[5] = v45;
  long long v46 = v63;
  v44[6] = v62;
  v44[7] = v46;
  long long v47 = v57;
  *uint64_t v44 = v56;
  v44[1] = v47;
  long long v48 = v59;
  v44[2] = v58;
  v44[3] = v48;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_100004CE4(v33, &qword_10002D1C0);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return sub_100004CE4(v54, &qword_10002D1C0);
}

unint64_t sub_10001EA00()
{
  unint64_t result = qword_10002D108;
  if (!qword_10002D108)
  {
    sub_1000047C8(&qword_10002D0E0);
    sub_10001EAA0();
    sub_100004DE0(&qword_10002D180, &qword_10002C8A8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002D108);
  }
  return result;
}

unint64_t sub_10001EAA0()
{
  unint64_t result = qword_10002D110;
  if (!qword_10002D110)
  {
    sub_1000047C8(&qword_10002D118);
    sub_10001EB40();
    sub_100004DE0(&qword_10002D170, &qword_10002D178);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002D110);
  }
  return result;
}

unint64_t sub_10001EB40()
{
  unint64_t result = qword_10002D120;
  if (!qword_10002D120)
  {
    sub_1000047C8(&qword_10002D128);
    sub_10001EBE0();
    sub_100004DE0(&qword_10002D160, &qword_10002D168);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002D120);
  }
  return result;
}

unint64_t sub_10001EBE0()
{
  unint64_t result = qword_10002D130;
  if (!qword_10002D130)
  {
    sub_1000047C8(&qword_10002D138);
    sub_10001EC5C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002D130);
  }
  return result;
}

unint64_t sub_10001EC5C()
{
  unint64_t result = qword_10002D140;
  if (!qword_10002D140)
  {
    sub_1000047C8(&qword_10002D148);
    sub_100004DE0(&qword_10002D150, &qword_10002D158);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002D140);
  }
  return result;
}

unint64_t sub_10001ECFC()
{
  unint64_t result = qword_10002CA40;
  if (!qword_10002CA40)
  {
    sub_100021178();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002CA40);
  }
  return result;
}

unint64_t sub_10001ED54()
{
  unint64_t result = qword_10002D198;
  if (!qword_10002D198)
  {
    sub_1000047C8(&qword_10002D100);
    sub_10001EDF4();
    sub_100004DE0(&qword_10002D190, &qword_10002D188);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002D198);
  }
  return result;
}

unint64_t sub_10001EDF4()
{
  unint64_t result = qword_10002D1A0;
  if (!qword_10002D1A0)
  {
    sub_1000047C8(&qword_10002D0F8);
    sub_100004DE0(&qword_10002D1A8, &qword_10002D0F0);
    sub_10001ECFC();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002D1A0);
  }
  return result;
}

unint64_t sub_10001EE94()
{
  unint64_t result = qword_10002D1B0;
  if (!qword_10002D1B0)
  {
    sub_1000047C8(&qword_10002D0E8);
    sub_10001EA00();
    sub_10001ECFC();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002D1B0);
  }
  return result;
}

uint64_t sub_10001EF10()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10001EF48()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_10001EF74@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_100021078();
  *a1 = result & 1;
  return result;
}

uint64_t sub_10001EFA4()
{
  return sub_100021088();
}

uint64_t sub_10001EFCC()
{
  return _swift_deallocObject(v0, 17, 7);
}

unsigned char *sub_10001EFDC(unsigned char *result)
{
  *result &= ~*(unsigned char *)(v1 + 16) & 1;
  return result;
}

uint64_t sub_10001EFF4@<X0>(uint64_t a1@<X8>)
{
  return sub_10001DEA4(*(void *)(v1 + 32), *(void *)(v1 + 16), a1);
}

uint64_t sub_10001F000@<X0>(uint64_t a1@<X8>)
{
  return sub_10001DF98(a1);
}

uint64_t sub_10001F038(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100020FD8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10001F09C(uint64_t a1)
{
  uint64_t v2 = sub_100020FD8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_10001F118()
{
  unint64_t result = qword_10002D1D0;
  if (!qword_10002D1D0)
  {
    sub_1000047C8(&qword_10002D1C8);
    sub_10001F1B8();
    sub_100004DE0(&qword_10002C908, &qword_10002C910);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002D1D0);
  }
  return result;
}

unint64_t sub_10001F1B8()
{
  unint64_t result = qword_10002D1D8;
  if (!qword_10002D1D8)
  {
    sub_1000047C8(&qword_10002D1E0);
    sub_100004A1C();
    sub_100004DE0(&qword_10002D1E8, &qword_10002D1F0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002D1D8);
  }
  return result;
}

uint64_t sub_10001F258()
{
  return swift_getWitnessTable();
}

unsigned char *initializeBufferWithCopyOfBuffer for RenderingError(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for RenderingError(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for ErrorView(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x10001F578);
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

ValueMetadata *type metadata accessor for ErrorView()
{
  return &type metadata for ErrorView;
}

uint64_t sub_10001F5B0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10001F5CC@<X0>(uint64_t a1@<X8>)
{
  type metadata accessor for MessageParser();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  int v3 = self;
  id v4 = [v3 bundleForClass:ObjCClassFromMetadata];
  sub_100020BE8();

  sub_1000046E8();
  uint64_t v5 = sub_100021248();
  uint64_t v7 = v6;
  char v9 = v8 & 1;
  sub_1000211C8();
  sub_1000211D8();
  swift_release();
  uint64_t v10 = sub_100021238();
  uint64_t v34 = v11;
  uint64_t v35 = v10;
  char v33 = v12;
  uint64_t v36 = v13;
  swift_release();
  sub_10000473C(v5, v7, v9);
  swift_bridgeObjectRelease();
  uint64_t KeyPath = swift_getKeyPath();
  sub_1000213A8();
  sub_100020F78();
  if (os_variant_has_internal_ui())
  {
    sub_1000046A4(&qword_10002D210);
    uint64_t v14 = swift_allocObject();
    *(_OWORD *)(v14 + 16) = xmmword_100022A80;
    sub_10001FE74();
    uint64_t v15 = sub_1000218B8();
    uint64_t v17 = v16;
    *(void *)(v14 + 56) = &type metadata for String;
    *(void *)(v14 + 64) = sub_10001FEC8();
    *(void *)(v14 + 32) = v15;
    *(void *)(v14 + 40) = v17;
    id v18 = [v3 bundleForClass:ObjCClassFromMetadata];
    id v19 = [v3 bundleForClass:ObjCClassFromMetadata];
    sub_100020BE8();

    uint64_t v20 = sub_100021628();
    uint64_t v22 = v21;
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
    uint64_t v38 = v20;
    uint64_t v39 = v22;
  }
  else
  {
    id v28 = [v3 bundleForClass:ObjCClassFromMetadata];
    uint64_t v29 = sub_100020BE8();
    uint64_t v31 = v30;

    uint64_t v38 = v29;
    uint64_t v39 = v31;
  }
  uint64_t v23 = sub_100021248();
  uint64_t v25 = v24;
  char v27 = v26 & 1;
  sub_1000211F8();
  sub_100021238();
  swift_release();
  sub_10000473C(v23, v25, v27);
  swift_bridgeObjectRelease();
  sub_1000213A8();
  sub_100020F78();
  sub_1000046A4(&qword_10002D200);
  sub_10001FD88();
  sub_100021158();
  *(void *)a1 = v35;
  *(void *)(a1 + 8) = v34;
  *(unsigned char *)(a1 + 16) = v33 & 1;
  *(void *)(a1 + 24) = v36;
  *(void *)(a1 + 32) = KeyPath;
  *(void *)(a1 + 40) = 1;
  *(unsigned char *)(a1 + 48) = 0;
  *(void *)(a1 + 56) = v49;
  *(unsigned char *)(a1 + 64) = v50;
  *(void *)(a1 + 72) = v51;
  *(unsigned char *)(a1 + 80) = v52;
  *(void *)(a1 + 88) = v53;
  *(void *)(a1 + 96) = v54;
  *(void *)(a1 + 104) = v38;
  *(void *)(a1 + 112) = v39;
  *(void *)(a1 + 120) = v40;
  *(void *)(a1 + 128) = v41;
  *(void *)(a1 + 136) = v42;
  *(void *)(a1 + 144) = v43;
  *(void *)(a1 + 152) = v44;
  *(void *)(a1 + 160) = v45;
  *(void *)(a1 + 168) = v46;
  *(void *)(a1 + 176) = v47;
  *(unsigned char *)(a1 + 184) = v48;
  sub_10000B3C4(v35, v34, v33 & 1);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_10001FDFC(v38, v39, v40);
  sub_10001FE38(v38, v39, v40);
  sub_10000473C(v35, v34, v33 & 1);
  swift_release();
  return swift_bridgeObjectRelease();
}

double sub_10001FC34@<D0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_100021118();
  sub_10001F5CC((uint64_t)v10);
  *(_OWORD *)&v12[135] = v10[8];
  *(_OWORD *)&v12[151] = v10[9];
  *(_OWORD *)&v12[167] = v11[0];
  *(_OWORD *)&v12[176] = *(_OWORD *)((char *)v11 + 9);
  *(_OWORD *)&v12[71] = v10[4];
  *(_OWORD *)&v12[87] = v10[5];
  *(_OWORD *)&v12[103] = v10[6];
  *(_OWORD *)&v12[119] = v10[7];
  *(_OWORD *)&v12[7] = v10[0];
  *(_OWORD *)&v12[23] = v10[1];
  *(_OWORD *)&v12[39] = v10[2];
  *(_OWORD *)&v12[55] = v10[3];
  long long v3 = *(_OWORD *)&v12[144];
  *(_OWORD *)(a1 + 145) = *(_OWORD *)&v12[128];
  *(_OWORD *)(a1 + 161) = v3;
  long long v4 = *(_OWORD *)&v12[176];
  *(_OWORD *)(a1 + 177) = *(_OWORD *)&v12[160];
  *(_OWORD *)(a1 + 193) = v4;
  long long v5 = *(_OWORD *)&v12[80];
  *(_OWORD *)(a1 + 81) = *(_OWORD *)&v12[64];
  *(_OWORD *)(a1 + 97) = v5;
  long long v6 = *(_OWORD *)&v12[112];
  *(_OWORD *)(a1 + 113) = *(_OWORD *)&v12[96];
  *(_OWORD *)(a1 + 129) = v6;
  long long v7 = *(_OWORD *)&v12[16];
  *(_OWORD *)(a1 + 17) = *(_OWORD *)v12;
  *(_OWORD *)(a1 + 33) = v7;
  double result = *(double *)&v12[32];
  long long v9 = *(_OWORD *)&v12[48];
  *(_OWORD *)(a1 + 49) = *(_OWORD *)&v12[32];
  *(void *)a1 = v2;
  *(void *)(a1 + 8) = 0x4020000000000000;
  *(unsigned char *)(a1 + 16) = 0;
  *(_OWORD *)(a1 + 65) = v9;
  return result;
}

unint64_t sub_10001FD88()
{
  unint64_t result = qword_10002D208;
  if (!qword_10002D208)
  {
    sub_1000047C8(&qword_10002D200);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002D208);
  }
  return result;
}

uint64_t sub_10001FDFC(uint64_t a1, uint64_t a2, char a3)
{
  sub_10000B3C4(a1, a2, a3 & 1);

  return swift_bridgeObjectRetain();
}

uint64_t sub_10001FE38(uint64_t a1, uint64_t a2, char a3)
{
  sub_10000473C(a1, a2, a3 & 1);

  return swift_bridgeObjectRelease();
}

unint64_t sub_10001FE74()
{
  unint64_t result = qword_10002D218;
  if (!qword_10002D218)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002D218);
  }
  return result;
}

unint64_t sub_10001FEC8()
{
  unint64_t result = qword_10002D220;
  if (!qword_10002D220)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002D220);
  }
  return result;
}

unint64_t sub_10001FF14()
{
  unint64_t result = qword_10002D228;
  if (!qword_10002D228)
  {
    sub_1000047C8(&qword_10002D230);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002D228);
  }
  return result;
}

uint64_t sub_10001FF70(char a1)
{
  uint64_t v2 = (void *)sub_1000213C8();
  unsigned __int16 v3 = sub_100020E38();

  if (v3 - 1 >= 2)
  {
    if (v3)
    {
      sub_1000046A4(&qword_10002D210);
      if (a1)
      {
LABEL_8:
        uint64_t v9 = swift_allocObject();
        *(_OWORD *)(v9 + 16) = xmmword_100022A80;
        uint64_t v10 = (void *)sub_1000213C8();
        uint64_t v11 = sub_100020E58();
        uint64_t v13 = v12;

        *(void *)(v9 + 56) = &type metadata for String;
        *(void *)(v9 + 64) = sub_10001FEC8();
        *(void *)(v9 + 32) = v11;
        *(void *)(v9 + 40) = v13;
        type metadata accessor for MessageParser();
        uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
        uint64_t v15 = self;
        id v16 = [v15 bundleForClass:ObjCClassFromMetadata];
        id v17 = [v15 bundleForClass:ObjCClassFromMetadata];
        sub_100020BE8();

        uint64_t v5 = sub_100021628();
        swift_bridgeObjectRelease();

LABEL_10:
        swift_bridgeObjectRelease();
        return v5;
      }
    }
    else
    {
      sub_1000046A4(&qword_10002D210);
      if (a1) {
        goto LABEL_8;
      }
    }
    uint64_t v18 = swift_allocObject();
    *(_OWORD *)(v18 + 16) = xmmword_100022B30;
    id v19 = (void *)sub_1000213C8();
    uint64_t v20 = sub_100020E58();
    uint64_t v22 = v21;

    *(void *)(v18 + 56) = &type metadata for String;
    unint64_t v23 = sub_10001FEC8();
    *(void *)(v18 + 64) = v23;
    *(void *)(v18 + 32) = v20;
    *(void *)(v18 + 40) = v22;
    uint64_t v24 = sub_1000213F8();
    *(void *)(v18 + 96) = &type metadata for String;
    *(void *)(v18 + 104) = v23;
    *(void *)(v18 + 72) = v24;
    *(void *)(v18 + 80) = v25;
    type metadata accessor for MessageParser();
    uint64_t v26 = swift_getObjCClassFromMetadata();
    char v27 = self;
    id v28 = [v27 bundleForClass:v26];
    id v29 = [v27 bundleForClass:v26];
    sub_100020BE8();

    uint64_t v5 = sub_100021628();
    swift_bridgeObjectRelease();

    goto LABEL_10;
  }
  long long v4 = (void *)sub_1000213C8();
  uint64_t v5 = sub_100020E18();
  uint64_t v7 = v6;

  if (!v7)
  {
    char v8 = (void *)sub_1000213C8();
    uint64_t v5 = sub_100020E58();
  }
  return v5;
}

uint64_t sub_1000203EC(char a1)
{
  uint64_t v2 = (void *)sub_1000213C8();
  __int16 v3 = sub_100020E38();

  if (v3 == 2)
  {
    if (a1) {
      goto LABEL_6;
    }
LABEL_8:
    sub_1000046A4(&qword_10002D210);
    uint64_t v7 = swift_allocObject();
    *(_OWORD *)(v7 + 16) = xmmword_100022A80;
    uint64_t v8 = sub_1000213F8();
    uint64_t v10 = v9;
    *(void *)(v7 + 56) = &type metadata for String;
    *(void *)(v7 + 64) = sub_10001FEC8();
    *(void *)(v7 + 32) = v8;
    *(void *)(v7 + 40) = v10;
    type metadata accessor for MessageParser();
    uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    uint64_t v12 = self;
    id v13 = [v12 bundleForClass:ObjCClassFromMetadata];
    id v14 = [v12 bundleForClass:ObjCClassFromMetadata];
    sub_100020BE8();

    uint64_t v6 = sub_100021628();
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
    return v6;
  }
  if (v3 != 1) {
    return 0;
  }
  if ((a1 & 1) == 0) {
    goto LABEL_8;
  }
LABEL_6:
  type metadata accessor for MessageParser();
  uint64_t v4 = swift_getObjCClassFromMetadata();
  id v5 = [self bundleForClass:v4];
  uint64_t v6 = sub_100020BE8();

  return v6;
}

unsigned char *storeEnumTagSinglePayload for RenderingError(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x100020804);
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

uint64_t sub_10002082C(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_100020834(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for RenderingError()
{
  return &type metadata for RenderingError;
}

uint64_t sub_100020854()
{
  type metadata accessor for MessageParser();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  uint64_t v1 = self;
  id v2 = [v1 bundleForClass:ObjCClassFromMetadata];
  uint64_t v3 = sub_100020BE8();

  id v4 = [v1 bundleForClass:ObjCClassFromMetadata];
  uint64_t v5 = sub_100020BE8();
  uint64_t v7 = v6;

  v9._countAndFlagsBits = v5;
  v9._object = v7;
  sub_100021658(v9);
  swift_bridgeObjectRelease();
  return v3;
}

BOOL sub_1000209D4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

Swift::Int sub_1000209EC()
{
  Swift::UInt v1 = *v0;
  sub_100021908();
  sub_100021918(v1);
  return sub_100021928();
}

void sub_100020A34()
{
  sub_100021918(*v0);
}

Swift::Int sub_100020A60()
{
  Swift::UInt v1 = *v0;
  sub_100021908();
  sub_100021918(v1);
  return sub_100021928();
}

uint64_t sub_100020AA4()
{
  return sub_100020854();
}

unint64_t sub_100020AB0()
{
  unint64_t result = qword_10002D238;
  if (!qword_10002D238)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002D238);
  }
  return result;
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t sub_100020B28()
{
  return URLQueryItem.name.getter();
}

uint64_t sub_100020B38()
{
  return URLQueryItem.value.getter();
}

uint64_t sub_100020B48()
{
  return type metadata accessor for URLQueryItem();
}

uint64_t sub_100020B58()
{
  return URLComponents.queryItems.getter();
}

uint64_t sub_100020B68()
{
  return URLComponents.queryItems.setter();
}

uint64_t sub_100020B78()
{
  return URLComponents.init(url:resolvingAgainstBaseURL:)();
}

uint64_t sub_100020B88()
{
  return URLComponents.url.getter();
}

uint64_t sub_100020B98()
{
  return type metadata accessor for URLComponents();
}

uint64_t sub_100020BA8()
{
  return LocalizedError.helpAnchor.getter();
}

uint64_t sub_100020BB8()
{
  return LocalizedError.failureReason.getter();
}

uint64_t sub_100020BC8()
{
  return LocalizedError.errorDescription.getter();
}

uint64_t sub_100020BD8()
{
  return LocalizedError.recoverySuggestion.getter();
}

uint64_t sub_100020BE8()
{
  return NSLocalizedString(_:tableName:bundle:value:comment:)();
}

uint64_t sub_100020BF8()
{
  return _convertNSErrorToError(_:)();
}

uint64_t sub_100020C08()
{
  return URL.absoluteString.getter();
}

uint64_t sub_100020C18()
{
  return URL._bridgeToObjectiveC()();
}

uint64_t sub_100020C28()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100020C38()
{
  return type metadata accessor for URL();
}

uint64_t sub_100020C48()
{
  return Data.init(base64Encoded:options:)();
}

uint64_t sub_100020C58()
{
  return Data._bridgeToObjectiveC()();
}

uint64_t sub_100020C68()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100020C78()
{
  return Date.init(timeIntervalSinceReferenceDate:)();
}

uint64_t sub_100020C88()
{
  return Date.timeIntervalSinceReferenceDate.getter();
}

uint64_t sub_100020C98()
{
  return Date.init()();
}

uint64_t sub_100020CA8()
{
  return type metadata accessor for Date();
}

uint64_t sub_100020CB8()
{
  return UUID._bridgeToObjectiveC()();
}

uint64_t sub_100020CC8()
{
  return static UUID.== infix(_:_:)();
}

uint64_t sub_100020CD8()
{
  return static UUID._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100020CE8()
{
  return type metadata accessor for UUID();
}

uint64_t sub_100020CF8()
{
  return os_log(_:dso:log:_:_:)();
}

uint64_t sub_100020D08()
{
  return Logger.logObject.getter();
}

uint64_t sub_100020D18()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_100020D28()
{
  return type metadata accessor for Logger();
}

uint64_t sub_100020D38()
{
  return ATQuestion.answerChoices.getter();
}

uint64_t sub_100020D48()
{
  return ATQuestion.answerChoices.setter();
}

uint64_t sub_100020D58()
{
  return ATQuestion.expirationDate.getter();
}

uint64_t sub_100020D68()
{
  return ATQuestion.expirationDate.setter();
}

uint64_t sub_100020D78()
{
  return ATQuestion.notificationText.getter();
}

uint64_t sub_100020D88()
{
  return ATQuestion.__allocating_init(id:topic:title:summary:)();
}

uint64_t sub_100020D98()
{
  return ATQuestion.associatedContentBundleIdentifier.setter();
}

uint64_t sub_100020DA8()
{
  return ATQuestion.Topic.init(rawValue:)();
}

uint64_t sub_100020DB8()
{
  return type metadata accessor for ATQuestion.Topic();
}

uint64_t sub_100020DC8()
{
  return ATQuestion.title.getter();
}

uint64_t sub_100020DD8()
{
  return ATQuestion.topic.getter();
}

uint64_t sub_100020DE8()
{
  return ATQuestion.summary.getter();
}

uint64_t sub_100020DF8()
{
  return ATQuestion.systemId.getter();
}

uint64_t sub_100020E08()
{
  return type metadata accessor for ATQuestion();
}

uint64_t sub_100020E18()
{
  return ATAnswerChoice.completedRequestTitle.getter();
}

uint64_t sub_100020E28()
{
  return ATAnswerChoice.init(id:title:completedRequestTitle:)();
}

uint64_t sub_100020E38()
{
  return ATAnswerChoice.kind.getter();
}

uint64_t sub_100020E48()
{
  return ATAnswerChoice.kind.setter();
}

uint64_t sub_100020E58()
{
  return ATAnswerChoice.title.getter();
}

uint64_t sub_100020E68()
{
  return type metadata accessor for ATAnswerChoice();
}

uint64_t sub_100020E78()
{
  return ATRecipientGroup.rawValue.getter();
}

uint64_t sub_100020E88()
{
  return MessageDetails.EventSource.rawValue.getter();
}

uint64_t sub_100020E98()
{
  return type metadata accessor for MessageDetails.EventSource();
}

uint64_t sub_100020EA8()
{
  return static MessageDetails.detailsFrom(_:)();
}

uint64_t sub_100020EB8()
{
  return MessageDetails.eventSource.getter();
}

uint64_t sub_100020EC8()
{
  return MessageDetails.bubbleCaption.getter();
}

uint64_t sub_100020ED8()
{
  return MessageDetails.bundleId.getter();
}

uint64_t sub_100020EE8()
{
  return MessageDetails.requestID.getter();
}

uint64_t sub_100020EF8()
{
  return type metadata accessor for MessageDetails();
}

uint64_t sub_100020F08()
{
  return ObservableObject<>.objectWillChange.getter();
}

uint64_t sub_100020F18()
{
  return Published.init(initialValue:)();
}

uint64_t sub_100020F28()
{
  return static Published.subscript.getter();
}

uint64_t sub_100020F38()
{
  return static Published.subscript.setter();
}

uint64_t sub_100020F48()
{
  return type metadata accessor for Published();
}

uint64_t sub_100020F58()
{
  return EdgeInsets.init(_all:)();
}

uint64_t sub_100020F68()
{
  return ProgressView<>.init<>()();
}

uint64_t sub_100020F78()
{
  return _FrameLayout.init(width:height:alignment:)();
}

uint64_t sub_100020F88()
{
  return ObservedObject.init(wrappedValue:)();
}

uint64_t sub_100020F98()
{
  return dispatch thunk of _UIHostingView.safeAreaRegions.setter();
}

uint64_t sub_100020FA8()
{
  return type metadata accessor for _UIHostingView();
}

uint64_t sub_100020FB8()
{
  return type metadata accessor for DynamicTypeSize();
}

uint64_t sub_100020FC8()
{
  return type metadata accessor for ModifiedContent();
}

uint64_t sub_100020FD8()
{
  return type metadata accessor for RoundedRectangle();
}

uint64_t sub_100020FE8()
{
  return _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)();
}

uint64_t sub_100020FF8()
{
  return EnvironmentValues.imageScale.getter();
}

uint64_t sub_100021008()
{
  return EnvironmentValues.imageScale.setter();
}

uint64_t sub_100021018()
{
  return EnvironmentValues.displayScale.getter();
}

uint64_t sub_100021028()
{
  return EnvironmentValues.displayScale.setter();
}

uint64_t sub_100021038()
{
  return EnvironmentValues.foregroundColor.getter();
}

uint64_t sub_100021048()
{
  return EnvironmentValues.foregroundColor.setter();
}

uint64_t sub_100021058()
{
  return EnvironmentValues.font.getter();
}

uint64_t sub_100021068()
{
  return EnvironmentValues.font.setter();
}

uint64_t sub_100021078()
{
  return EnvironmentValues.isEnabled.getter();
}

uint64_t sub_100021088()
{
  return EnvironmentValues.isEnabled.setter();
}

uint64_t sub_100021098()
{
  return EnvironmentValues.lineLimit.getter();
}

uint64_t sub_1000210A8()
{
  return EnvironmentValues.lineLimit.setter();
}

uint64_t sub_1000210B8()
{
  return EnvironmentValues.init()();
}

uint64_t sub_1000210C8()
{
  return type metadata accessor for EnvironmentValues();
}

uint64_t sub_1000210D8()
{
  return static VerticalAlignment.top.getter();
}

uint64_t sub_1000210E8()
{
  return static VerticalAlignment.center.getter();
}

uint64_t sub_1000210F8()
{
  return type metadata accessor for RoundedCornerStyle();
}

uint64_t sub_100021108()
{
  return static HorizontalAlignment.center.getter();
}

uint64_t sub_100021118()
{
  return static HorizontalAlignment.leading.getter();
}

uint64_t sub_100021128()
{
  return UIHostingController.safeAreaRegions.setter();
}

uint64_t sub_100021138()
{
  return UIHostingController.init(rootView:)();
}

uint64_t sub_100021148()
{
  return type metadata accessor for _ConditionalContent.Storage();
}

uint64_t sub_100021158()
{
  return _ConditionalContent<>.init(storage:)();
}

uint64_t sub_100021168()
{
  return type metadata accessor for _ConditionalContent();
}

uint64_t sub_100021178()
{
  return type metadata accessor for AccessibilityAttachmentModifier();
}

uint64_t sub_100021188()
{
  return static Log.runtimeIssuesLog.getter();
}

uint64_t sub_100021198()
{
  return static Edge.Set.horizontal.getter();
}

uint64_t sub_1000211A8()
{
  return static Edge.Set.all.getter();
}

uint64_t sub_1000211B8()
{
  return static Edge.Set.vertical.getter();
}

uint64_t sub_1000211C8()
{
  return static Font.subheadline.getter();
}

uint64_t sub_1000211D8()
{
  return Font.bold()();
}

uint64_t sub_1000211E8()
{
  return static Font.caption2.getter();
}

uint64_t sub_1000211F8()
{
  return static Font.footnote.getter();
}

uint64_t sub_100021208()
{
  return Menu.init(content:label:)();
}

uint64_t sub_100021218()
{
  return type metadata accessor for Menu();
}

uint64_t sub_100021228()
{
  return Text.foregroundColor(_:)();
}

uint64_t sub_100021238()
{
  return Text.font(_:)();
}

uint64_t sub_100021248()
{
  return Text.init<A>(_:)();
}

uint64_t sub_100021258()
{
  return static View._makeView(view:inputs:)();
}

uint64_t sub_100021268()
{
  return static View._makeViewList(view:inputs:)();
}

uint64_t sub_100021278()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_100021288()
{
  return View.dynamicTypeSize<A>(_:)();
}

uint64_t sub_100021298()
{
  return View.accessibilityIdentifier(_:)();
}

uint64_t sub_1000212A8()
{
  return View.disabled(_:)();
}

uint64_t sub_1000212B8()
{
  return Color.init(uiColor:)();
}

uint64_t sub_1000212C8()
{
  return static Color.red.getter();
}

uint64_t sub_1000212D8()
{
  return static Color.gray.getter();
}

uint64_t sub_1000212E8()
{
  return static Color.clear.getter();
}

uint64_t sub_1000212F8()
{
  return static Color.green.getter();
}

uint64_t sub_100021308()
{
  return static Color.primary.getter();
}

uint64_t sub_100021318()
{
  return static Color.secondary.getter();
}

uint64_t sub_100021328()
{
  return Image.init(uiImage:)();
}

uint64_t sub_100021338()
{
  return Image.init(systemName:)();
}

uint64_t sub_100021348()
{
  return type metadata accessor for Image.ResizingMode();
}

uint64_t sub_100021358()
{
  return type metadata accessor for Image.Scale();
}

uint64_t sub_100021368()
{
  return Image.resizable(capInsets:resizingMode:)();
}

uint64_t sub_100021378()
{
  return Button.init(action:label:)();
}

uint64_t sub_100021388()
{
  return Divider.init()();
}

uint64_t sub_100021398()
{
  return type metadata accessor for Divider();
}

uint64_t sub_1000213A8()
{
  return static Alignment.topLeading.getter();
}

uint64_t sub_1000213B8()
{
  return static Alignment.center.getter();
}

uint64_t sub_1000213C8()
{
  return ATResponse.chosenAnswer.getter();
}

uint64_t sub_1000213D8()
{
  return ATResponse.responderHandle.getter();
}

uint64_t sub_1000213E8()
{
  return ATResponse.init(originalQuestion:responderHandle:chosenAnswer:)();
}

uint64_t sub_1000213F8()
{
  return ATResponse.responderDisplayName.getter();
}

uint64_t sub_100021408()
{
  return type metadata accessor for ATResponse();
}

uint64_t sub_100021418()
{
  return IconProvider.compositeIcon(for:)();
}

uint64_t sub_100021428()
{
  return static IconProvider.Spec.effectiveSizeWithBadge.getter();
}

uint64_t sub_100021438()
{
  return static IconProvider.Spec.effectiveSizeWithoutBadge.getter();
}

uint64_t sub_100021448()
{
  return IconProvider.icon(from:isScreenTimeRequest:)();
}

uint64_t sub_100021458()
{
  return IconProvider.init()();
}

uint64_t sub_100021468()
{
  return type metadata accessor for IconProvider();
}

uint64_t sub_100021478()
{
  return PayloadImage.init(clientIconImageData:associatedContentIconImageData:cornerRadiusIncluded:)();
}

uint64_t sub_100021488()
{
  return type metadata accessor for PayloadImage();
}

void sub_1000214A8()
{
}

uint64_t sub_1000214B8()
{
  return ATDaemonConnectionManager.init()();
}

uint64_t sub_1000214C8()
{
  return type metadata accessor for ATDaemonConnectionManager();
}

uint64_t sub_1000214D8()
{
  return Icon.isComposite.getter();
}

uint64_t sub_1000214E8()
{
  return Icon.image.getter();
}

uint64_t sub_1000214F8()
{
  return type metadata accessor for Icon();
}

uint64_t sub_100021508()
{
  return ATURL.Parser.parse<A>(_:from:)();
}

uint64_t sub_100021518()
{
  return ATURL.Parser.init()();
}

uint64_t sub_100021528()
{
  return type metadata accessor for ATURL.Parser();
}

uint64_t sub_100021538()
{
  return static ATURL.create(using:)();
}

uint64_t sub_100021548()
{
  return static Metrics.ResponseSend.log(requestIdentifier:clientBundleIdentifier:sentSuccessfully:rawOriginalRecipientGroup:answerKind:responseCount:)();
}

uint64_t sub_100021558()
{
  return static Metrics.ResponseJourney.log(clientBundleIdentifier:questionTopic:checkpoint:entryPoint:)();
}

uint64_t sub_100021568()
{
  return ATPayload.messageGUID.getter();
}

uint64_t sub_100021578()
{
  return ATPayload.allResponses.getter();
}

uint64_t sub_100021588()
{
  return ATPayload.__allocating_init(originalPayload:newResponse:)();
}

uint64_t sub_100021598()
{
  return ATPayload.rawRecipientGroup.getter();
}

uint64_t sub_1000215A8()
{
  return ATPayload.__allocating_init(clientBundleIdentifier:clientAdamIdentifier:messageGUID:rawRecipientGroup:isForFamily:question:)();
}

uint64_t sub_1000215B8()
{
  return ATPayload.clientBundleIdentifier.getter();
}

uint64_t sub_1000215C8()
{
  return ATPayload.question.getter();
}

uint64_t sub_1000215D8()
{
  return ATPayload.response.getter();
}

uint64_t sub_1000215E8()
{
  return type metadata accessor for ATPayload();
}

uint64_t sub_1000215F8()
{
  return dispatch thunk of static Comparable.<= infix(_:_:)();
}

uint64_t sub_100021608()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

uint64_t sub_100021618()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_100021628()
{
  return static String.localizedStringWithFormat(_:_:)();
}

uint64_t sub_100021638()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100021648()
{
  return String.hash(into:)();
}

void sub_100021658(Swift::String a1)
{
}

Swift::Int sub_100021668()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_100021678()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_100021688()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_100021698()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000216A8()
{
  return Array.description.getter();
}

uint64_t sub_1000216B8()
{
  return specialized Array._endMutation()();
}

uint64_t sub_1000216C8()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_1000216D8()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_1000216E8()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_1000216F8()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_100021708()
{
  return type metadata accessor for TaskPriority();
}

uint64_t sub_100021718()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_100021728()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_100021738()
{
  return static os_log_type_t.fault.getter();
}

uint64_t sub_100021748()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_100021758()
{
  return type metadata accessor for Optional();
}

uint64_t sub_100021768()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_100021778()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_100021788()
{
  return _StringGuts._slowWithCString<A>(_:)();
}

uint64_t sub_100021798()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_1000217A8()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_1000217B8()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_1000217C8()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_1000217D8()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t sub_1000217E8()
{
  return specialized ContiguousArray.reserveCapacity(_:)();
}

uint64_t sub_1000217F8()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t sub_100021808()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_100021818()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100021828()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100021838()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_100021848()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t sub_100021858()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t sub_100021868()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_100021878()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_100021888()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_100021898()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_1000218A8()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_1000218B8()
{
  return Error.localizedDescription.getter();
}

uint64_t sub_1000218C8()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_1000218D8()
{
  return Error._code.getter();
}

uint64_t sub_1000218E8()
{
  return Error._domain.getter();
}

uint64_t sub_1000218F8()
{
  return Error._userInfo.getter();
}

uint64_t sub_100021908()
{
  return Hasher.init(_seed:)();
}

void sub_100021918(Swift::UInt a1)
{
}

Swift::Int sub_100021928()
{
  return Hasher._finalize()();
}

BOOL CGSizeEqualToSize(CGSize size1, CGSize size2)
{
  return _CGSizeEqualToSize(size1, size2);
}

uint64_t IMSPIUpdatePluginMessageWithGUID()
{
  return _IMSPIUpdatePluginMessageWithGUID();
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

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

uint64_t _swift_stdlib_strtod_clocale()
{
  return __swift_stdlib_strtod_clocale();
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_variant_has_internal_ui()
{
  return _os_variant_has_internal_ui();
}

uint64_t swift_allocError()
{
  return _swift_allocError();
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return _swift_allocateGenericClassMetadata();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_arrayInitWithCopy()
{
  return _swift_arrayInitWithCopy();
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

uint64_t swift_getAtKeyPath()
{
  return _swift_getAtKeyPath();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return _swift_getEnumCaseMultiPayload();
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

uint64_t swift_initClassMetadata2()
{
  return _swift_initClassMetadata2();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return _swift_initEnumMetadataMultiPayload();
}

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return _swift_isEscapingClosureAtFileLocation();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_makeBoxUnique()
{
  return _swift_makeBoxUnique();
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

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_unknownObjectWeakCopyAssign()
{
  return _swift_unknownObjectWeakCopyAssign();
}

uint64_t swift_unknownObjectWeakCopyInit()
{
  return _swift_unknownObjectWeakCopyInit();
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

uint64_t swift_unknownObjectWeakTakeAssign()
{
  return _swift_unknownObjectWeakTakeAssign();
}

uint64_t swift_unknownObjectWeakTakeInit()
{
  return _swift_unknownObjectWeakTakeInit();
}

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}