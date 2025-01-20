void sub_100004FF0()
{
  byte_100010198 = 1;
  qword_1000101A0 = 0xE600000000000000;
}

void sub_10000500C()
{
  byte_1000101B0 = 1;
  qword_1000101B8 = 0xE700000000000000;
}

uint64_t sub_100005028()
{
  uint64_t v0 = sub_10000A7A0();
  sub_10000A028(v0, qword_100010990);
  sub_100009D24(v0, (uint64_t)qword_100010990);
  return sub_10000A790();
}

uint64_t sub_1000050AC()
{
  return 1;
}

Swift::Int sub_1000050B4()
{
  return sub_10000A9B0();
}

void sub_1000050F8()
{
}

Swift::Int sub_100005120()
{
  return sub_10000A9B0();
}

uint64_t sub_100005164@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, BOOL *a3@<X8>)
{
  uint64_t result = sub_100009A90(a1, a2);
  *a3 = result != 0;
  return result;
}

uint64_t sub_100005194()
{
  return 0;
}

void sub_1000051A0(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_1000051AC(uint64_t a1)
{
  unint64_t v2 = sub_100009CD0();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1000051E8(uint64_t a1)
{
  unint64_t v2 = sub_100009CD0();

  return CodingKey.debugDescription.getter(a1, v2);
}

unint64_t sub_100005224(char a1)
{
  unint64_t result = 0xD000000000000019;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000014;
      break;
    case 3:
      unint64_t result = 0xD000000000000011;
      break;
    case 4:
      unint64_t result = 0xD00000000000001ALL;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1000052BC@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = sub_100008838(&qword_100010100);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin();
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100009C8C(a1, a1[3]);
  sub_100009CD0();
  sub_10000A9F0();
  if (v2) {
    return sub_100009F10((uint64_t)a1);
  }
  uint64_t v9 = sub_10000A910();
  uint64_t v11 = v10;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  uint64_t result = sub_100009F10((uint64_t)a1);
  *a2 = v9;
  a2[1] = v11;
  return result;
}

uint64_t sub_100005434(void *a1)
{
  uint64_t v2 = sub_100008838(&qword_100010108);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100009C8C(a1, a1[3]);
  sub_100009CD0();
  sub_10000AA00();
  sub_10000A920();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_10000556C(unsigned __int8 *a1, char *a2)
{
  return sub_100005578(*a1, *a2);
}

uint64_t sub_100005578(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xD000000000000019;
  unint64_t v3 = 0x800000010000B140;
  uint64_t v4 = a1;
  unint64_t v5 = 0xD000000000000019;
  switch(v4)
  {
    case 1:
      unint64_t v5 = 0xD000000000000014;
      uint64_t v6 = "failedToFetchMLAsset";
      goto LABEL_6;
    case 2:
      uint64_t v6 = "failedToInstantiateWorker";
      goto LABEL_6;
    case 3:
      unint64_t v5 = 0xD000000000000011;
      uint64_t v6 = "failedToRunWorker";
      goto LABEL_6;
    case 4:
      unint64_t v5 = 0xD00000000000001ALL;
      uint64_t v6 = "recipeMissingExpectedEntry";
LABEL_6:
      unint64_t v3 = (unint64_t)(v6 - 32) | 0x8000000000000000;
      break;
    default:
      break;
  }
  unint64_t v7 = 0x800000010000B140;
  switch(a2)
  {
    case 1:
      unint64_t v2 = 0xD000000000000014;
      v8 = "failedToFetchMLAsset";
      goto LABEL_12;
    case 2:
      v8 = "failedToInstantiateWorker";
      goto LABEL_12;
    case 3:
      unint64_t v2 = 0xD000000000000011;
      v8 = "failedToRunWorker";
      goto LABEL_12;
    case 4:
      unint64_t v2 = 0xD00000000000001ALL;
      v8 = "recipeMissingExpectedEntry";
LABEL_12:
      unint64_t v7 = (unint64_t)(v8 - 32) | 0x8000000000000000;
      break;
    default:
      break;
  }
  if (v5 == v2 && v3 == v7) {
    char v9 = 1;
  }
  else {
    char v9 = sub_10000A940();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v9 & 1;
}

Swift::Int sub_1000056F4()
{
  return sub_1000056FC();
}

Swift::Int sub_1000056FC()
{
  return sub_10000A9B0();
}

uint64_t sub_1000057E8()
{
  return sub_1000057F0();
}

uint64_t sub_1000057F0()
{
  sub_10000A810();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_1000058BC()
{
  return sub_1000058C4();
}

Swift::Int sub_1000058C4()
{
  return sub_10000A9B0();
}

uint64_t sub_1000059AC@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_100009B48(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

unint64_t sub_1000059DC@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_100005224(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_100005A18(uint64_t a1)
{
  v2[31] = a1;
  v2[32] = v1;
  uint64_t v3 = sub_10000A600();
  v2[33] = v3;
  v2[34] = *(void *)(v3 - 8);
  v2[35] = swift_task_alloc();
  sub_100008838(&qword_100010118);
  v2[36] = swift_task_alloc();
  sub_100008838(&qword_100010120);
  v2[37] = swift_task_alloc();
  uint64_t v4 = sub_10000A640();
  v2[38] = v4;
  v2[39] = *(void *)(v4 - 8);
  v2[40] = swift_task_alloc();
  v2[41] = type metadata accessor for NLPLearnerExtension();
  v2[42] = swift_task_alloc();
  sub_100008838(&qword_100010128);
  v2[43] = swift_task_alloc();
  uint64_t v5 = sub_100008838(&qword_100010020);
  v2[44] = v5;
  v2[45] = *(void *)(v5 - 8);
  v2[46] = swift_task_alloc();
  v2[47] = swift_task_alloc();
  v2[48] = swift_task_alloc();
  v2[49] = swift_task_alloc();
  v2[50] = swift_task_alloc();
  v2[51] = swift_task_alloc();
  v2[52] = swift_task_alloc();
  v2[53] = swift_task_alloc();
  return _swift_task_switch(sub_100005CAC, 0, 0);
}

uint64_t sub_100005CAC()
{
  if (qword_1000101C0 != -1) {
    swift_once();
  }
  uint64_t v1 = (void *)v0[31];
  uint64_t v2 = sub_10000A7A0();
  v0[54] = sub_100009D24(v2, (uint64_t)qword_100010990);
  id v3 = v1;
  uint64_t v4 = sub_10000A780();
  os_log_type_t v5 = sub_10000A840();
  BOOL v6 = os_log_type_enabled(v4, v5);
  uint64_t v7 = (void *)v0[31];
  if (v6)
  {
    v8 = (uint8_t *)swift_slowAlloc();
    v18 = (void *)swift_slowAlloc();
    *(_DWORD *)v8 = 138412290;
    v0[30] = v7;
    id v9 = v7;
    sub_10000A860();
    void *v18 = v7;

    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Context: %@", v8, 0xCu);
    sub_100008838(&qword_100010150);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  uint64_t v10 = (void *)swift_task_alloc();
  v0[55] = v10;
  uint64_t v11 = sub_100008F20(&qword_1000100D8);
  unint64_t v12 = sub_100008C84();
  unint64_t v13 = sub_100008CD8();
  *uint64_t v10 = v0;
  v10[1] = sub_100005F0C;
  uint64_t v14 = v0[43];
  uint64_t v15 = v0[41];
  uint64_t v16 = v0[31];
  return MLHostExtension.loadConfig<A>(context:)(v14, v16, v15, &type metadata for NLPLearnerExtensionConfig, v11, v12, v13);
}

uint64_t sub_100005F0C()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_100006008, 0, 0);
}

uint64_t sub_100006008()
{
  v83 = v0;
  uint64_t v1 = v0[44];
  uint64_t v2 = v0[45];
  uint64_t v3 = v0[43];
  sub_100009D5C(v0[32], v0[42]);
  int v4 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1);
  uint64_t v5 = v0[53];
  uint64_t v6 = v0[44];
  uint64_t v7 = v0[45];
  uint64_t v8 = v0[43];
  if (v4 == 1)
  {
    (*(void (**)(void, void, void))(v7 + 32))(v0[53], v0[42], v0[44]);
    sub_100009EB4(v8, &qword_100010128);
  }
  else
  {
    sub_100009E58(v0[42]);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 32))(v5, v8, v6);
  }
  uint64_t v9 = v0[53];
  uint64_t v10 = v0[52];
  uint64_t v11 = v0[44];
  uint64_t v12 = v0[45];
  unint64_t v13 = *(void (**)(void, void, void))(v12 + 16);
  v0[56] = v13;
  v0[57] = (v12 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v79 = v13;
  v13(v10, v9, v11);
  uint64_t v14 = sub_10000A780();
  os_log_type_t v15 = sub_10000A840();
  BOOL v16 = os_log_type_enabled(v14, v15);
  uint64_t v17 = v0[52];
  uint64_t v19 = v0[44];
  uint64_t v18 = v0[45];
  if (v16)
  {
    v20 = (uint8_t *)swift_slowAlloc();
    v80[0] = swift_slowAlloc();
    *(_DWORD *)v20 = 136315138;
    sub_100009E14(&qword_100010148, &qword_100010020);
    uint64_t v21 = sub_10000A930();
    v0[29] = sub_1000092DC(v21, v22, v80);
    sub_10000A860();
    swift_bridgeObjectRelease();
    v23 = *(void (**)(uint64_t, uint64_t))(v18 + 8);
    v23(v17, v19);
    _os_log_impl((void *)&_mh_execute_header, v14, v15, "Configuration: %s", v20, 0xCu);
    swift_arrayDestroy();
    v24 = v23;
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    v24 = *(void (**)(uint64_t, uint64_t))(v18 + 8);
    v24(v17, v19);
  }

  v0[58] = v24;
  v79(v0[51], v0[53], v0[44]);
  v25 = sub_10000A780();
  os_log_type_t v26 = sub_10000A840();
  BOOL v27 = os_log_type_enabled(v25, v26);
  uint64_t v28 = v0[51];
  uint64_t v29 = v0[44];
  if (v27)
  {
    v30 = (uint8_t *)swift_slowAlloc();
    v80[0] = swift_slowAlloc();
    *(_DWORD *)v30 = 136315138;
    sub_10000A6F0();
    v0[28] = sub_1000092DC(v0[6], v0[7], v80);
    sub_10000A860();
    swift_bridgeObjectRelease();
    v24(v28, v29);
    _os_log_impl((void *)&_mh_execute_header, v25, v26, "Recipe: %s", v30, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    v24(v28, v29);
  }

  sub_10000A6F0();
  uint64_t v31 = sub_100007610(v0[2], v0[3]);
  swift_bridgeObjectRelease();
  if (!v31)
  {
    v79(v0[46], v0[53], v0[44]);
    v49 = sub_10000A780();
    os_log_type_t v50 = sub_10000A850();
    BOOL v51 = os_log_type_enabled(v49, v50);
    uint64_t v52 = v0[46];
    uint64_t v53 = v0[44];
    if (v51)
    {
      v54 = (uint8_t *)swift_slowAlloc();
      v80[0] = swift_slowAlloc();
      *(_DWORD *)v54 = 136315138;
      sub_10000A6F0();
      v0[27] = sub_1000092DC(v0[4], v0[5], v80);
      sub_10000A860();
      swift_bridgeObjectRelease();
      v24(v52, v53);
      _os_log_impl((void *)&_mh_execute_header, v49, v50, "Failed to parse recipeString into dictionary: %s", v54, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      v24(v0[46], v0[44]);
    }

    uint64_t v64 = v0[53];
    uint64_t v65 = v0[44];
    v81 = &type metadata for NLPLearnerExtensionErrorCode;
    unint64_t v82 = sub_100009DC0();
    LOBYTE(v80[0]) = 0;
    id v66 = objc_allocWithZone((Class)sub_10000A6B0());
    uint64_t v78 = sub_10000A690();
    v24(v64, v65);
    goto LABEL_45;
  }
  if (qword_100010190 == -1)
  {
    if (!*(void *)(v31 + 16)) {
      goto LABEL_34;
    }
  }
  else
  {
    swift_once();
    if (!*(void *)(v31 + 16)) {
      goto LABEL_34;
    }
  }
  uint64_t v32 = qword_1000101A0;
  if (byte_100010198) {
    uint64_t v33 = 0x656C61636F6CLL;
  }
  else {
    uint64_t v33 = 0;
  }
  swift_bridgeObjectRetain();
  unint64_t v34 = sub_100009934(v33, v32);
  if ((v35 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_34;
  }
  uint64_t v36 = *(void *)(*(void *)(v31 + 56) + 8 * v34);
  swift_unknownObjectRetain();
  swift_bridgeObjectRelease();
  v0[23] = v36;
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_34:
    swift_bridgeObjectRelease();
    v79(v0[47], v0[53], v0[44]);
    v55 = sub_10000A780();
    os_log_type_t v56 = sub_10000A850();
    BOOL v57 = os_log_type_enabled(v55, v56);
    uint64_t v58 = v0[47];
    uint64_t v59 = v0[44];
    if (v57)
    {
      v60 = (uint8_t *)swift_slowAlloc();
      v80[0] = swift_slowAlloc();
      *(_DWORD *)v60 = 136315138;
      sub_10000A6F0();
      v0[25] = sub_1000092DC(v0[8], v0[9], v80);
      sub_10000A860();
      swift_bridgeObjectRelease();
      v24(v58, v59);
      _os_log_impl((void *)&_mh_execute_header, v55, v56, "Evaluation Recipe does not contain locale information. %s", v60, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      v24(v0[47], v0[44]);
    }

    uint64_t v61 = v0[53];
    uint64_t v62 = v0[44];
    v81 = &type metadata for NLPLearnerExtensionErrorCode;
    unint64_t v82 = sub_100009DC0();
    LOBYTE(v80[0]) = 4;
    id v63 = objc_allocWithZone((Class)sub_10000A6B0());
    uint64_t v78 = sub_10000A690();
    v24(v61, v62);
    goto LABEL_45;
  }
  sub_10000A620();
  if (qword_1000101A8 == -1)
  {
    if (!*(void *)(v31 + 16)) {
      goto LABEL_41;
    }
  }
  else
  {
    swift_once();
    if (!*(void *)(v31 + 16)) {
      goto LABEL_41;
    }
  }
  uint64_t v37 = qword_1000101B8;
  if (byte_1000101B0) {
    uint64_t v38 = 0x7363697274656DLL;
  }
  else {
    uint64_t v38 = 0;
  }
  swift_bridgeObjectRetain();
  unint64_t v39 = sub_100009934(v38, v37);
  if (v40)
  {
    uint64_t v41 = *(void *)(*(void *)(v31 + 56) + 8 * v39);
    swift_unknownObjectRetain();
    swift_bridgeObjectRelease();
    v0[21] = v41;
    sub_100008838(&qword_100010138);
    if (swift_dynamicCast())
    {
      v0[59] = v0[18];
      if (*(void *)(v31 + 16) && (unint64_t v42 = sub_100009934(0xD000000000000018, 0x800000010000B320), (v43 & 1) != 0))
      {
        uint64_t v44 = *(void *)(*(void *)(v31 + 56) + 8 * v42);
        swift_unknownObjectRetain();
        swift_bridgeObjectRelease();
        v0[19] = v44;
        if (swift_dynamicCast())
        {
          v0[60] = v0[20];
          v45 = (void *)swift_task_alloc();
          v0[61] = v45;
          void *v45 = v0;
          v45[1] = sub_100006C68;
          uint64_t v46 = v0[53];
          uint64_t v47 = v0[31];
          return sub_1000079B0(v47, v46);
        }
      }
      else
      {
        swift_bridgeObjectRelease();
      }
      swift_bridgeObjectRelease();
      v67 = sub_10000A780();
      os_log_type_t v68 = sub_10000A850();
      if (!os_log_type_enabled(v67, v68)) {
        goto LABEL_44;
      }
      v69 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v69 = 0;
      v70 = "Evaluation Recipe does not contain a sample limit for evaluation";
      goto LABEL_43;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
  }
LABEL_41:
  swift_bridgeObjectRelease();
  v67 = sub_10000A780();
  os_log_type_t v68 = sub_10000A850();
  if (os_log_type_enabled(v67, v68))
  {
    v69 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v69 = 0;
    v70 = "Evaluation Recipe does not contain metric ACT parameters";
LABEL_43:
    _os_log_impl((void *)&_mh_execute_header, v67, v68, v70, v69, 2u);
    swift_slowDealloc();
  }
LABEL_44:
  uint64_t v71 = v0[53];
  uint64_t v72 = v0[44];
  uint64_t v74 = v0[39];
  uint64_t v73 = v0[40];
  uint64_t v75 = v0[38];

  v81 = &type metadata for NLPLearnerExtensionErrorCode;
  unint64_t v82 = sub_100009DC0();
  LOBYTE(v80[0]) = 4;
  id v76 = objc_allocWithZone((Class)sub_10000A6B0());
  uint64_t v78 = sub_10000A690();
  (*(void (**)(uint64_t, uint64_t))(v74 + 8))(v73, v75);
  v24(v71, v72);
LABEL_45:
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
  swift_task_dealloc();
  swift_task_dealloc();
  v77 = (uint64_t (*)(uint64_t))v0[1];
  return v77(v78);
}

uint64_t sub_100006C68(uint64_t a1)
{
  *(void *)(*(void *)v1 + 496) = a1;
  swift_task_dealloc();
  return _swift_task_switch(sub_100006D68, 0, 0);
}

uint64_t sub_100006D68()
{
  uint64_t v80 = v0;
  uint64_t v1 = *(void *)(v0 + 472);
  if (*(void *)(v0 + 496))
  {
    uint64_t v2 = *(void *)(v0 + 312);
    uint64_t v3 = *(void *)(v0 + 296);
    uint64_t v4 = *(void *)(v0 + 304);
    uint64_t v5 = *(void *)(v0 + 288);
    uint64_t v6 = *(void *)(v0 + 264);
    uint64_t v7 = *(void *)(v0 + 272);
    (*(void (**)(uint64_t, void, uint64_t))(v2 + 16))(v3, *(void *)(v0 + 320), v4);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v2 + 56))(v3, 0, 1, v4);
    uint64_t v8 = sub_10000A750();
    uint64_t v10 = v9;
    sub_10000A670();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v7 + 56))(v5, 0, 1, v6);
    id v11 = objc_allocWithZone((Class)NLPLearnerExtensionWorker);
    id v12 = sub_100008FAC(v3, v8, v10, v5, v1);
    if (v12)
    {
      unint64_t v13 = v12;
      uint64_t v14 = *(void *)(v0 + 480);
      uint64_t v16 = *(void *)(v0 + 272);
      uint64_t v15 = *(void *)(v0 + 280);
      uint64_t v17 = *(void *)(v0 + 264);
      sub_10000A670();
      sub_10000A5F0(v18);
      v20 = v19;
      (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v15, v17);
      LODWORD(v14) = [v13 evaluateModel:v20 sampleLimit:v14];

      if (v14)
      {
        uint64_t v71 = *(void (**)(uint64_t, uint64_t))(v0 + 464);
        uint64_t v21 = *(void *)(v0 + 424);
        uint64_t v22 = *(void *)(v0 + 352);
        uint64_t v24 = *(void *)(v0 + 312);
        uint64_t v23 = *(void *)(v0 + 320);
        uint64_t v25 = *(void *)(v0 + 304);
        id v26 = objc_allocWithZone((Class)sub_10000A6B0());
        uint64_t v75 = sub_10000A6A0();

        swift_release();
        (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v23, v25);
        v71(v21, v22);
      }
      else
      {
        (*(void (**)(void, void, void))(v0 + 448))(*(void *)(v0 + 400), *(void *)(v0 + 424), *(void *)(v0 + 352));
        char v43 = sub_10000A780();
        os_log_type_t v44 = sub_10000A850();
        BOOL v45 = os_log_type_enabled(v43, v44);
        uint64_t v46 = *(void *)(v0 + 400);
        uint64_t v47 = *(void *)(v0 + 352);
        if (v45)
        {
          uint64_t v73 = *(void (**)(uint64_t, uint64_t))(v0 + 464);
          v48 = (uint8_t *)swift_slowAlloc();
          v77[0] = swift_slowAlloc();
          *(_DWORD *)v48 = 136315138;
          sub_10000A6F0();
          *(void *)(v0 + 208) = sub_1000092DC(*(void *)(v0 + 80), *(void *)(v0 + 88), v77);
          sub_10000A860();
          swift_bridgeObjectRelease();
          v73(v46, v47);
          _os_log_impl((void *)&_mh_execute_header, v43, v44, "Failed to run extension worker. %s", v48, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();
        }
        else
        {
          (*(void (**)(void, void))(v0 + 464))(*(void *)(v0 + 400), *(void *)(v0 + 352));
        }
        uint64_t v74 = *(void (**)(uint64_t, uint64_t))(v0 + 464);
        uint64_t v63 = *(void *)(v0 + 424);
        uint64_t v64 = *(void *)(v0 + 352);
        uint64_t v66 = *(void *)(v0 + 312);
        uint64_t v65 = *(void *)(v0 + 320);
        uint64_t v67 = *(void *)(v0 + 304);
        uint64_t v78 = &type metadata for NLPLearnerExtensionErrorCode;
        unint64_t v79 = sub_100009DC0();
        LOBYTE(v77[0]) = 3;
        id v68 = objc_allocWithZone((Class)sub_10000A6B0());
        uint64_t v75 = sub_10000A690();

        swift_release();
        (*(void (**)(uint64_t, uint64_t))(v66 + 8))(v65, v67);
        v74(v63, v64);
      }
    }
    else
    {
      (*(void (**)(void, void, void))(v0 + 448))(*(void *)(v0 + 392), *(void *)(v0 + 424), *(void *)(v0 + 352));
      uint64_t v37 = sub_10000A780();
      os_log_type_t v38 = sub_10000A850();
      BOOL v39 = os_log_type_enabled(v37, v38);
      uint64_t v40 = *(void *)(v0 + 392);
      uint64_t v41 = *(void *)(v0 + 352);
      if (v39)
      {
        uint64_t v72 = *(void (**)(uint64_t, uint64_t))(v0 + 464);
        unint64_t v42 = (uint8_t *)swift_slowAlloc();
        v77[0] = swift_slowAlloc();
        *(_DWORD *)unint64_t v42 = 136315138;
        sub_10000A6F0();
        *(void *)(v0 + 192) = sub_1000092DC(*(void *)(v0 + 96), *(void *)(v0 + 104), v77);
        sub_10000A860();
        swift_bridgeObjectRelease();
        v72(v40, v41);
        _os_log_impl((void *)&_mh_execute_header, v37, v38, "Failed to instantiate extension worker. %s", v42, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
        (*(void (**)(void, void))(v0 + 464))(*(void *)(v0 + 392), *(void *)(v0 + 352));
      }

      os_log_type_t v56 = *(void (**)(uint64_t, uint64_t))(v0 + 464);
      uint64_t v57 = *(void *)(v0 + 424);
      uint64_t v58 = *(void *)(v0 + 352);
      uint64_t v60 = *(void *)(v0 + 312);
      uint64_t v59 = *(void *)(v0 + 320);
      uint64_t v61 = *(void *)(v0 + 304);
      uint64_t v78 = &type metadata for NLPLearnerExtensionErrorCode;
      unint64_t v79 = sub_100009DC0();
      LOBYTE(v77[0]) = 2;
      id v62 = objc_allocWithZone((Class)sub_10000A6B0());
      uint64_t v75 = sub_10000A690();
      swift_release();
      (*(void (**)(uint64_t, uint64_t))(v60 + 8))(v59, v61);
      v56(v57, v58);
    }
  }
  else
  {
    BOOL v27 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 448);
    uint64_t v28 = *(void *)(v0 + 424);
    uint64_t v29 = *(void *)(v0 + 384);
    uint64_t v30 = *(void *)(v0 + 352);
    swift_bridgeObjectRelease();
    v27(v29, v28, v30);
    uint64_t v31 = sub_10000A780();
    os_log_type_t v32 = sub_10000A850();
    BOOL v33 = os_log_type_enabled(v31, v32);
    uint64_t v34 = *(void *)(v0 + 384);
    uint64_t v35 = *(void *)(v0 + 352);
    if (v33)
    {
      id v76 = *(void (**)(uint64_t, uint64_t))(v0 + 464);
      uint64_t v36 = (uint8_t *)swift_slowAlloc();
      v77[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v36 = 136315138;
      sub_10000A6F0();
      *(void *)(v0 + 176) = sub_1000092DC(*(void *)(v0 + 128), *(void *)(v0 + 136), v77);
      sub_10000A860();
      swift_bridgeObjectRelease();
      v76(v34, v35);
      _os_log_impl((void *)&_mh_execute_header, v31, v32, "Failed to fetch MLHostAsset. %s", v36, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      (*(void (**)(void, void))(v0 + 464))(*(void *)(v0 + 384), *(void *)(v0 + 352));
    }

    v49 = *(void (**)(uint64_t, uint64_t))(v0 + 464);
    uint64_t v50 = *(void *)(v0 + 424);
    uint64_t v51 = *(void *)(v0 + 352);
    uint64_t v53 = *(void *)(v0 + 312);
    uint64_t v52 = *(void *)(v0 + 320);
    uint64_t v54 = *(void *)(v0 + 304);
    uint64_t v78 = &type metadata for NLPLearnerExtensionErrorCode;
    unint64_t v79 = sub_100009DC0();
    LOBYTE(v77[0]) = 1;
    id v55 = objc_allocWithZone((Class)sub_10000A6B0());
    uint64_t v75 = sub_10000A690();
    (*(void (**)(uint64_t, uint64_t))(v53 + 8))(v52, v54);
    v49(v50, v51);
  }
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
  swift_task_dealloc();
  swift_task_dealloc();
  v69 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v69(v75);
}

uint64_t sub_100007610(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = sub_10000A800();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  uint64_t v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000A7F0();
  uint64_t v8 = sub_10000A7E0();
  unint64_t v10 = v9;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  uint64_t result = 0;
  if (v10 >> 60 != 15)
  {
    id v12 = self;
    Class isa = sub_10000A610().super.isa;
    v24[0] = 0;
    id v14 = [v12 JSONObjectWithData:isa options:1 error:v24];

    if (v14)
    {
      id v15 = v24[0];
      sub_10000A880();
      sub_100009FBC(v8, v10);
      swift_unknownObjectRelease();
      sub_100008838(&qword_100010168);
      if (swift_dynamicCast()) {
        return v23;
      }
      else {
        return 0;
      }
    }
    else
    {
      id v16 = v24[0];
      uint64_t v17 = sub_10000A5E0();

      swift_willThrow();
      if (qword_1000101C0 != -1) {
        swift_once();
      }
      uint64_t v18 = sub_10000A7A0();
      sub_100009D24(v18, (uint64_t)qword_100010990);
      swift_bridgeObjectRetain_n();
      uint64_t v19 = sub_10000A780();
      os_log_type_t v20 = sub_10000A840();
      if (os_log_type_enabled(v19, v20))
      {
        uint64_t v22 = v17;
        uint64_t v21 = (uint8_t *)swift_slowAlloc();
        v24[0] = (id)swift_slowAlloc();
        *(_DWORD *)uint64_t v21 = 136315138;
        swift_bridgeObjectRetain();
        uint64_t v23 = sub_1000092DC(a1, a2, (uint64_t *)v24);
        sub_10000A860();
        swift_bridgeObjectRelease_n();
        _os_log_impl((void *)&_mh_execute_header, v19, v20, "Failed to parse dictionary from string %s", v21, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
        sub_100009FBC(v8, v10);
      }
      else
      {
        sub_100009FBC(v8, v10);
        swift_bridgeObjectRelease_n();
      }
      swift_errorRelease();

      return 0;
    }
  }
  return result;
}

uint64_t sub_1000079B0(uint64_t a1, uint64_t a2)
{
  v2[2] = a1;
  v2[3] = a2;
  sub_100008838(&qword_100010158);
  v2[4] = swift_task_alloc();
  uint64_t v3 = sub_10000A770();
  v2[5] = v3;
  v2[6] = *(void *)(v3 - 8);
  v2[7] = swift_task_alloc();
  uint64_t v4 = sub_10000A740();
  v2[8] = v4;
  v2[9] = *(void *)(v4 - 8);
  v2[10] = swift_task_alloc();
  return _swift_task_switch(sub_100007AFC, 0, 0);
}

uint64_t sub_100007AFC()
{
  uint64_t v1 = v0[8];
  uint64_t v2 = v0[9];
  uint64_t v4 = v0[6];
  uint64_t v3 = v0[7];
  uint64_t v6 = v0[4];
  uint64_t v5 = v0[5];
  sub_100008838(&qword_100010020);
  sub_10000A700();
  sub_10000A760();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v6, 1, v1) == 1)
  {
    sub_100009EB4(v0[4], &qword_100010158);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v7 = (uint64_t (*)(void))v0[1];
    return v7(0);
  }
  else
  {
    (*(void (**)(void, void, void))(v0[9] + 32))(v0[10], v0[4], v0[8]);
    sub_10000A680();
    uint64_t v9 = sub_10000A730();
    uint64_t v11 = v10;
    v0[11] = v10;
    uint64_t v12 = sub_10000A720();
    uint64_t v14 = v13;
    v0[12] = v13;
    id v15 = (void *)swift_task_alloc();
    v0[13] = v15;
    *id v15 = v0;
    v15[1] = sub_100007CE8;
    uint64_t v16 = v0[2];
    return static MLHostAsset.getRemoteAsset(context:assetType:assetSpecifier:)(v16, v9, v11, v12, v14);
  }
}

uint64_t sub_100007CE8(uint64_t a1)
{
  *(void *)(*(void *)v1 + 112) = a1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return _swift_task_switch(sub_100007E24, 0, 0);
}

uint64_t sub_100007E24()
{
  (*(void (**)(void, void))(v0[9] + 8))(v0[10], v0[8]);
  uint64_t v1 = v0[14];
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = (uint64_t (*)(uint64_t))v0[1];
  return v2(v1);
}

uint64_t sub_100007EC4()
{
  return _swift_task_switch(sub_100007EE0, 0, 0);
}

uint64_t sub_100007EE0()
{
  objc_allocWithZone((Class)sub_10000A6B0());
  uint64_t v1 = sub_10000A6A0();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_100007F54(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_100007FE8;
  return sub_100005A18(a1);
}

uint64_t sub_100007FE8(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t sub_1000080E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  id v15 = (void *)swift_task_alloc();
  *(void *)(v7 + 16) = v15;
  *id v15 = v7;
  v15[1] = sub_1000081C8;
  return MLHostExtension.loadConfig<A>(context:)(a1, a2, a6, a3, a7, a4, a5);
}

uint64_t sub_1000081C8()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_1000082BC(uint64_t a1)
{
  uint64_t v2 = sub_100008F20(&qword_1000100D8);

  return MLHostExtension.configuration.getter(a1, v2);
}

uint64_t sub_100008324()
{
  return sub_10000A6E0();
}

unint64_t sub_100008390(unint64_t a1, unint64_t a2)
{
  uint64_t v4 = sub_10000A9E0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = &type metadata for NLPLearnerExtensionConfig;
  unint64_t v14 = a1;
  unint64_t v15 = a2;
  swift_bridgeObjectRetain();
  sub_10000A9C0();
  sub_10000A9D0();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  uint64_t v8 = sub_10000854C();
  swift_release();
  unint64_t v14 = 0xD00000000000001ALL;
  unint64_t v15 = 0x800000010000B250;
  uint64_t v13 = v8;
  sub_100008838(&qword_1000100E0);
  sub_100009E14(&qword_1000100E8, &qword_1000100E0);
  uint64_t v9 = sub_10000A7C0();
  uint64_t v11 = v10;
  swift_bridgeObjectRelease();
  v17._countAndFlagsBits = v9;
  v17._object = v11;
  sub_10000A820(v17);
  swift_bridgeObjectRelease();
  v18._countAndFlagsBits = 41;
  v18._object = (void *)0xE100000000000000;
  sub_10000A820(v18);
  return v14;
}

char *sub_10000854C()
{
  swift_retain();
  sub_10000A8B0();
  swift_release();
  sub_10000A8F0();
  if (*((void *)&v9 + 1))
  {
    uint64_t v0 = (char *)&_swiftEmptyArrayStorage;
    do
    {
      v6[0] = v7;
      v6[1] = v8;
      v6[2] = v9;
      v1._object = (void *)*((void *)&v7 + 1);
      if (*((void *)&v7 + 1))
      {
        v1._countAndFlagsBits = *(void *)&v6[0];
        sub_10000A820(v1);
        v10._countAndFlagsBits = 8250;
        v10._object = (void *)0xE200000000000000;
        sub_10000A820(v10);
        sub_10000A8C0();
        sub_100009EB4((uint64_t)v6, &qword_1000100F0);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v0 = sub_1000091CC(0, *((void *)v0 + 2) + 1, 1, v0);
        }
        unint64_t v3 = *((void *)v0 + 2);
        unint64_t v2 = *((void *)v0 + 3);
        if (v3 >= v2 >> 1) {
          uint64_t v0 = sub_1000091CC((char *)(v2 > 1), v3 + 1, 1, v0);
        }
        *((void *)v0 + 2) = v3 + 1;
        uint64_t v4 = &v0[16 * v3];
        *((void *)v4 + 4) = 0;
        *((void *)v4 + 5) = 0xE000000000000000;
      }
      else
      {
        sub_100009EB4((uint64_t)v6, &qword_1000100F0);
      }
      sub_10000A8F0();
    }
    while (*((void *)&v9 + 1));
  }
  else
  {
    uint64_t v0 = (char *)&_swiftEmptyArrayStorage;
  }
  swift_release();
  return v0;
}

unint64_t sub_1000086F8()
{
  return sub_100008390(*v0, v0[1]);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

uint64_t type metadata accessor for NLPLearnerExtension()
{
  uint64_t result = qword_1000101C8;
  if (!qword_1000101C8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1000087C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100008838(&qword_100010020);
  uint64_t v5 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);

  return v5(a1, a2, v4);
}

uint64_t sub_100008838(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_10000887C(uint64_t a1)
{
  uint64_t v2 = sub_100008838(&qword_100010020);
  unint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);

  return v3(a1, v2);
}

uint64_t sub_1000088E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100008838(&qword_100010020);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t sub_10000894C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100008838(&qword_100010020);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t sub_1000089B4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100008838(&qword_100010020);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t sub_100008A1C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100008838(&qword_100010020);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t sub_100008A84(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100008A98);
}

uint64_t sub_100008A98(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100008838(&qword_100010020);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);

  return v5(a1, a2, v4);
}

uint64_t sub_100008B08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100008B1C);
}

uint64_t sub_100008B1C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100008838(&qword_100010020);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, a2, v4);
}

void sub_100008B90()
{
  sub_100008C1C();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_100008C1C()
{
  if (!qword_100010080)
  {
    sub_100008C84();
    sub_100008CD8();
    unint64_t v0 = sub_10000A710();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100010080);
    }
  }
}

unint64_t sub_100008C84()
{
  unint64_t result = qword_100010088;
  if (!qword_100010088)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010088);
  }
  return result;
}

unint64_t sub_100008CD8()
{
  unint64_t result = qword_100010090;
  if (!qword_100010090)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010090);
  }
  return result;
}

void *initializeBufferWithCopyOfBuffer for NLPLearnerExtensionConfig(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for NLPLearnerExtensionConfig()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for NLPLearnerExtensionConfig(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for NLPLearnerExtensionConfig(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void *assignWithTake for NLPLearnerExtensionConfig(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for NLPLearnerExtensionConfig(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for NLPLearnerExtensionConfig(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for NLPLearnerExtensionConfig()
{
  return &type metadata for NLPLearnerExtensionConfig;
}

uint64_t sub_100008E7C()
{
  return sub_100008F20(&qword_100010018);
}

uint64_t sub_100008EB0()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_100008F20(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for NLPLearnerExtension();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100008F64(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

id sub_100008FAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = v5;
  uint64_t v11 = sub_10000A640();
  uint64_t v12 = *(void *)(v11 - 8);
  Class isa = 0;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v12 + 48))(a1, 1, v11) != 1)
  {
    Class isa = sub_10000A630().super.isa;
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(a1, v11);
  }
  if (a3)
  {
    NSString v14 = sub_10000A7D0();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v14 = 0;
  }
  uint64_t v15 = sub_10000A600();
  uint64_t v16 = *(void *)(v15 - 8);
  Swift::String v18 = 0;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v16 + 48))(a4, 1, v15) != 1)
  {
    sub_10000A5F0(v17);
    Swift::String v18 = v19;
    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(a4, v15);
  }
  if (a5)
  {
    v20.super.Class isa = sub_10000A7B0().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v20.super.Class isa = 0;
  }
  id v21 = [v6 initWithLocale:isa experimentName:v14 modelURL:v18 metricParameters:v20.super.isa];

  return v21;
}

char *sub_1000091CC(char *result, int64_t a2, char a3, char *a4)
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
      sub_100008838(&qword_1000100F8);
      Swift::String v10 = (char *)swift_allocObject();
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
      Swift::String v10 = (char *)&_swiftEmptyArrayStorage;
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
    sub_100009B94(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_1000092DC(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_1000093B0(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100009F60((uint64_t)v12, *a3);
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
      sub_100009F60((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100009F10((uint64_t)v12);
  return v7;
}

uint64_t sub_1000093B0(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_10000A870();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_10000956C(a5, a6);
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
  uint64_t v8 = sub_10000A8A0();
  if (!v8)
  {
    sub_10000A8D0();
    __break(1u);
LABEL_17:
    uint64_t result = sub_10000A8E0();
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

uint64_t sub_10000956C(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100009604(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_1000097E4(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_1000097E4(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100009604(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_10000977C(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_10000A890();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_10000A8D0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_10000A830();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_10000A8E0();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_10000A8D0();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
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
  sub_100008838(&qword_100010160);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1000097E4(char a1, int64_t a2, char a3, char *a4)
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
    sub_100008838(&qword_100010160);
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
  uint64_t result = sub_10000A8E0();
  __break(1u);
  return result;
}

unint64_t sub_100009934(uint64_t a1, uint64_t a2)
{
  sub_10000A990();
  sub_10000A810();
  Swift::Int v4 = sub_10000A9B0();

  return sub_1000099AC(a1, a2, v4);
}

unint64_t sub_1000099AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_10000A940() & 1) == 0)
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
      while (!v14 && (sub_10000A940() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_100009A90(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x7453657069636572 && a2 == 0xEC000000676E6972)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_10000A940();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_100009B28()
{
  return 0x7453657069636572;
}

uint64_t sub_100009B48(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_10000C6B8;
  v6._object = a2;
  unint64_t v4 = sub_10000A900(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 5) {
    return 5;
  }
  else {
    return v4;
  }
}

uint64_t sub_100009B94(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  uint64_t result = sub_10000A8E0();
  __break(1u);
  return result;
}

void *sub_100009C8C(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_100009CD0()
{
  unint64_t result = qword_100010460[0];
  if (!qword_100010460[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_100010460);
  }
  return result;
}

uint64_t sub_100009D24(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_100009D5C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for NLPLearnerExtension();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_100009DC0()
{
  unint64_t result = qword_100010130;
  if (!qword_100010130)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010130);
  }
  return result;
}

uint64_t sub_100009E14(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100008F64(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100009E58(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for NLPLearnerExtension();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100009EB4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100008838(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100009F10(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100009F60(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100009FBC(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_100009FD0(a1, a2);
  }
  return a1;
}

uint64_t sub_100009FD0(uint64_t a1, unint64_t a2)
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

uint64_t *sub_10000A028(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

unsigned char *initializeBufferWithCopyOfBuffer for NLPLearnerExtensionErrorCode(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for NLPLearnerExtensionErrorCode(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for NLPLearnerExtensionErrorCode(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x10000A1F8);
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

uint64_t sub_10000A220(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_10000A22C(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for NLPLearnerExtensionErrorCode()
{
  return &type metadata for NLPLearnerExtensionErrorCode;
}

uint64_t getEnumTagSinglePayload for NLPLearnerExtensionConfig.CodingKeys(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for NLPLearnerExtensionConfig.CodingKeys(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x10000A334);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_10000A35C()
{
  return 0;
}

ValueMetadata *type metadata accessor for NLPLearnerExtensionConfig.CodingKeys()
{
  return &type metadata for NLPLearnerExtensionConfig.CodingKeys;
}

unint64_t sub_10000A378()
{
  unint64_t result = qword_100010570[0];
  if (!qword_100010570[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_100010570);
  }
  return result;
}

unint64_t sub_10000A3D0()
{
  unint64_t result = qword_100010170;
  if (!qword_100010170)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010170);
  }
  return result;
}

unint64_t sub_10000A428()
{
  unint64_t result = qword_100010178;
  if (!qword_100010178)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010178);
  }
  return result;
}

unint64_t sub_10000A480()
{
  unint64_t result = qword_100010180;
  if (!qword_100010180)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010180);
  }
  return result;
}

unint64_t sub_10000A4D8()
{
  unint64_t result = qword_100010188;
  if (!qword_100010188)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010188);
  }
  return result;
}

unint64_t sub_10000A530()
{
  unint64_t result = qword_100010900;
  if (!qword_100010900)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010900);
  }
  return result;
}

unint64_t sub_10000A588()
{
  unint64_t result = qword_100010908[0];
  if (!qword_100010908[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_100010908);
  }
  return result;
}

uint64_t sub_10000A5E0()
{
  return _convertNSErrorToError(_:)();
}

void sub_10000A5F0(NSURL *retstr@<X8>)
{
}

uint64_t sub_10000A600()
{
  return type metadata accessor for URL();
}

NSData sub_10000A610()
{
  return Data._bridgeToObjectiveC()();
}

uint64_t sub_10000A620()
{
  return Locale.init(identifier:)();
}

NSLocale sub_10000A630()
{
  return Locale._bridgeToObjectiveC()();
}

uint64_t sub_10000A640()
{
  return type metadata accessor for Locale();
}

uint64_t sub_10000A650()
{
  return static AppExtension.main()();
}

uint64_t sub_10000A670()
{
  return MLHostAsset.url.getter();
}

uint64_t sub_10000A680()
{
  return type metadata accessor for MLHostAsset();
}

uint64_t sub_10000A690()
{
  return MLHostResult.init(error:policy:)();
}

uint64_t sub_10000A6A0()
{
  return MLHostResult.init(status:policy:)();
}

uint64_t sub_10000A6B0()
{
  return type metadata accessor for MLHostResult();
}

uint64_t sub_10000A6E0()
{
  return MLHostParameters.init(taskParameters:)();
}

uint64_t sub_10000A6F0()
{
  return MLHostParameters.taskParameters.getter();
}

uint64_t sub_10000A700()
{
  return MLHostParameters.systemParameters.getter();
}

uint64_t sub_10000A710()
{
  return type metadata accessor for MLHostParameters();
}

uint64_t sub_10000A720()
{
  return MLHostAssetParameters.assetSpecifier.getter();
}

uint64_t sub_10000A730()
{
  return MLHostAssetParameters.assetType.getter();
}

uint64_t sub_10000A740()
{
  return type metadata accessor for MLHostAssetParameters();
}

uint64_t sub_10000A750()
{
  return MLHostExtensionContext.taskName.getter();
}

uint64_t sub_10000A760()
{
  return MLHostSystemParameters.mobileAsset.getter();
}

uint64_t sub_10000A770()
{
  return type metadata accessor for MLHostSystemParameters();
}

uint64_t sub_10000A780()
{
  return Logger.logObject.getter();
}

uint64_t sub_10000A790()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_10000A7A0()
{
  return type metadata accessor for Logger();
}

NSDictionary sub_10000A7B0()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_10000A7C0()
{
  return BidirectionalCollection<>.joined(separator:)();
}

NSString sub_10000A7D0()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_10000A7E0()
{
  return String.data(using:allowLossyConversion:)();
}

uint64_t sub_10000A7F0()
{
  return static String.Encoding.utf8.getter();
}

uint64_t sub_10000A800()
{
  return type metadata accessor for String.Encoding();
}

uint64_t sub_10000A810()
{
  return String.hash(into:)();
}

void sub_10000A820(Swift::String a1)
{
}

Swift::Int sub_10000A830()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_10000A840()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_10000A850()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_10000A860()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_10000A870()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_10000A880()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t sub_10000A890()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_10000A8A0()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_10000A8B0()
{
  return dispatch thunk of _AnySequenceBox._makeIterator()();
}

uint64_t sub_10000A8C0()
{
  return _print_unlocked<A, B>(_:_:)();
}

uint64_t sub_10000A8D0()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_10000A8E0()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_10000A8F0()
{
  return dispatch thunk of _AnyIteratorBoxBase.next()();
}

Swift::Int sub_10000A900(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_10000A910()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_10000A920()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_10000A930()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_10000A940()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_10000A950()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_10000A960()
{
  return Error._code.getter();
}

uint64_t sub_10000A970()
{
  return Error._domain.getter();
}

uint64_t sub_10000A980()
{
  return Error._userInfo.getter();
}

uint64_t sub_10000A990()
{
  return Hasher.init(_seed:)();
}

void sub_10000A9A0(Swift::UInt a1)
{
}

Swift::Int sub_10000A9B0()
{
  return Hasher._finalize()();
}

uint64_t sub_10000A9C0()
{
  return Mirror.init(reflecting:)();
}

uint64_t sub_10000A9D0()
{
  return Mirror.children.getter();
}

uint64_t sub_10000A9E0()
{
  return type metadata accessor for Mirror();
}

uint64_t sub_10000A9F0()
{
  return dispatch thunk of Decoder.container<A>(keyedBy:)();
}

uint64_t sub_10000AA00()
{
  return dispatch thunk of Encoder.container<A>(keyedBy:)();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

uint64_t self
{
  return _self;
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

uint64_t swift_errorInMain()
{
  return _swift_errorInMain();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
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

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}