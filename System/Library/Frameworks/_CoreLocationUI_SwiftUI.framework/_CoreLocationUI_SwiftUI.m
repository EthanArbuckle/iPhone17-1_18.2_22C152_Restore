void static LocationButton.Title.currentLocation.getter(unsigned char *a1@<X8>)
{
  *a1 = 0;
}

unsigned char *LocationButton.init(_:action:)@<X0>(unsigned char *result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v4 = 1;
  switch(*result)
  {
    case 1:
      uint64_t v4 = 2;
      break;
    case 2:
      uint64_t v4 = 3;
      break;
    case 3:
      uint64_t v4 = 4;
      break;
    case 4:
      uint64_t v4 = 5;
      break;
    case 5:
      __break(1u);
      JUMPOUT(0x23D2E0C48);
    default:
      break;
  }
  *(void *)a4 = v4;
  *(unsigned char *)(a4 + 8) = 0;
  *(void *)(a4 + 16) = a2;
  *(void *)(a4 + 24) = a3;
  return result;
}

uint64_t LocationButton.body.getter@<X0>(uint64_t a1@<X8>)
{
  sub_23D2E0CAC(*(void *)v1, *(unsigned char *)(v1 + 8), *(void *)(v1 + 16), *(void *)(v1 + 24), a1);

  return swift_retain();
}

uint64_t sub_23D2E0CAC@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  *(void *)a5 = swift_getKeyPath();
  *(unsigned char *)(a5 + 8) = 0;
  *(void *)(a5 + 16) = swift_getKeyPath();
  *(unsigned char *)(a5 + 24) = 0;
  v10 = (int *)type metadata accessor for ViewRepresentable();
  v11 = (uint64_t *)(a5 + v10[6]);
  uint64_t *v11 = swift_getKeyPath();
  sub_23D2E269C(&qword_268C06C00);
  swift_storeEnumTagMultiPayload();
  v12 = (uint64_t *)(a5 + v10[7]);
  uint64_t *v12 = swift_getKeyPath();
  sub_23D2E269C(&qword_268C06C10);
  swift_storeEnumTagMultiPayload();
  uint64_t v13 = a5 + v10[8];
  *(void *)uint64_t v13 = swift_getKeyPath();
  *(unsigned char *)(v13 + 8) = 0;
  v14 = (uint64_t *)(a5 + v10[9]);
  uint64_t *v14 = swift_getKeyPath();
  sub_23D2E269C(&qword_268C06C18);
  uint64_t result = swift_storeEnumTagMultiPayload();
  uint64_t v16 = a5 + v10[10];
  *(void *)uint64_t v16 = a1;
  *(unsigned char *)(v16 + 8) = a2 & 1;
  *(void *)(v16 + 16) = a3;
  *(void *)(v16 + 24) = a4;
  return result;
}

void static LocationButton.Title.sendCurrentLocation.getter(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

void static LocationButton.Title.sendMyCurrentLocation.getter(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

void static LocationButton.Title.shareCurrentLocation.getter(unsigned char *a1@<X8>)
{
  *a1 = 3;
}

void static LocationButton.Title.shareMyCurrentLocation.getter(unsigned char *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_23D2E0E28(uint64_t a1)
{
  return MEMORY[0x270FA03F0](a1, &opaque type descriptor for <<opaque return type of LocationButton.body>>, 1);
}

BOOL sub_23D2E0E44(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_23D2E0E58()
{
  return sub_23D2E4FE0();
}

uint64_t sub_23D2E0EA0()
{
  return sub_23D2E4FD0();
}

uint64_t sub_23D2E0ECC()
{
  return sub_23D2E4FE0();
}

uint64_t sub_23D2E0F18()
{
  return sub_23D2E4F30();
}

uint64_t sub_23D2E0F34@<X0>(uint64_t a1@<X8>)
{
  sub_23D2E0CAC(*(void *)v1, *(unsigned char *)(v1 + 8), *(void *)(v1 + 16), *(void *)(v1 + 24), a1);

  return swift_retain();
}

uint64_t initializeBufferWithCopyOfBuffer for LocationButton(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for LocationButton()
{
  return swift_release();
}

__n128 initializeWithTake for Configuration(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t assignWithTake for LocationButton(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_release();
  return a1;
}

ValueMetadata *type metadata accessor for LocationButton()
{
  return &type metadata for LocationButton;
}

unsigned char *initializeBufferWithCopyOfBuffer for LocationButton.Title.Storage(unsigned char *result, unsigned char *a2)
{
  *__n128 result = *a2;
  return result;
}

ValueMetadata *type metadata accessor for LocationButton.Title()
{
  return &type metadata for LocationButton.Title;
}

void sub_23D2E1054(void *a1)
{
  uint64_t v2 = v1;
  v96 = a1;
  uint64_t v3 = sub_23D2E4F00();
  uint64_t v91 = *(void *)(v3 - 8);
  uint64_t v92 = v3;
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v90 = (uint64_t)&v82 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v98 = sub_23D2E4E10();
  uint64_t v102 = *(void *)(v98 - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  v85 = (char *)&v82 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v101 = sub_23D2E269C(&qword_268C06C68);
  uint64_t v6 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v89 = (uint64_t)&v82 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v97 = (uint64_t)&v82 - v8;
  uint64_t v9 = sub_23D2E269C(&qword_268C06C08);
  uint64_t v10 = MEMORY[0x270FA5388](v9 - 8);
  uint64_t v83 = (uint64_t)&v82 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v93 = (uint64_t)&v82 - v13;
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v88 = (uint64_t)&v82 - v15;
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  uint64_t v94 = (uint64_t)&v82 - v17;
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  v20 = (char *)&v82 - v19;
  MEMORY[0x270FA5388](v18);
  v22 = (char *)&v82 - v21;
  uint64_t v23 = sub_23D2E4D20();
  uint64_t v24 = *(void *)(v23 - 8);
  uint64_t v25 = MEMORY[0x270FA5388](v23);
  v27 = (char *)&v82 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v25);
  v29 = (char *)&v82 - v28;
  uint64_t v30 = type metadata accessor for ViewRepresentable();
  sub_23D2E3EF4(&qword_268C06C10, MEMORY[0x263F18BC8], 0x61566C6F626D7953, 0xEE0073746E616972, (uint64_t)v29);
  sub_23D2E4D00();
  char v31 = sub_23D2E4D10();
  v32 = *(void (**)(char *, uint64_t))(v24 + 8);
  v32(v27, v23);
  v32(v29, v23);
  uint64_t v33 = 1;
  if ((v31 & 1) == 0) {
    uint64_t v33 = 2;
  }
  uint64_t v99 = v30;
  uint64_t v100 = v33;
  uint64_t v34 = *(int *)(v30 + 24);
  uint64_t v35 = v98;
  uint64_t v95 = v2;
  uint64_t v36 = v2 + v34;
  sub_23D2E417C((uint64_t)v22);
  sub_23D2E4E00();
  uint64_t v37 = v102;
  uint64_t v38 = v102 + 56;
  v39 = *(void (**)(char *, void, uint64_t, uint64_t))(v102 + 56);
  v39(v20, 0, 1, v35);
  uint64_t v40 = v97;
  uint64_t v41 = v97 + *(int *)(v101 + 48);
  sub_23D2E4BD8((uint64_t)v22, v97, &qword_268C06C08);
  sub_23D2E4BD8((uint64_t)v20, v41, &qword_268C06C08);
  v42 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v37 + 48);
  int v43 = v42(v40, 1, v35);
  uint64_t v86 = v38;
  uint64_t v87 = v36;
  if (v43 == 1)
  {
    sub_23D2E43D8((uint64_t)v20, &qword_268C06C08);
    sub_23D2E43D8((uint64_t)v22, &qword_268C06C08);
    if (v42(v41, 1, v35) == 1)
    {
      sub_23D2E43D8(v40, &qword_268C06C08);
      uint64_t v45 = v95;
      v44 = v96;
LABEL_16:
      uint64_t v100 = 0;
      uint64_t v51 = v99;
      goto LABEL_19;
    }
    goto LABEL_8;
  }
  sub_23D2E4BD8(v40, v94, &qword_268C06C08);
  v82 = v42;
  if (v42(v41, 1, v35) == 1)
  {
    sub_23D2E43D8((uint64_t)v20, &qword_268C06C08);
    sub_23D2E43D8((uint64_t)v22, &qword_268C06C08);
    (*(void (**)(uint64_t, uint64_t))(v102 + 8))(v94, v35);
    v42 = v82;
LABEL_8:
    v84 = (void (*)(uint64_t, void, uint64_t, uint64_t))v39;
    sub_23D2E43D8(v40, &qword_268C06C68);
    uint64_t v45 = v95;
    v44 = v96;
    goto LABEL_9;
  }
  v84 = (void (*)(uint64_t, void, uint64_t, uint64_t))v39;
  uint64_t v53 = v102;
  v54 = v85;
  (*(void (**)(char *, uint64_t, uint64_t))(v102 + 32))(v85, v41, v35);
  sub_23D2E4C3C(&qword_268C06C78, MEMORY[0x263F19A28]);
  uint64_t v55 = v94;
  char v56 = sub_23D2E4F60();
  v57 = *(void (**)(char *, uint64_t))(v53 + 8);
  v57(v54, v35);
  sub_23D2E43D8((uint64_t)v20, &qword_268C06C08);
  sub_23D2E43D8((uint64_t)v22, &qword_268C06C08);
  v57((char *)v55, v35);
  sub_23D2E43D8(v40, &qword_268C06C08);
  uint64_t v45 = v95;
  v44 = v96;
  v42 = v82;
  if (v56) {
    goto LABEL_16;
  }
LABEL_9:
  uint64_t v46 = v88;
  sub_23D2E417C(v88);
  uint64_t v47 = v93;
  sub_23D2E4DF0();
  v84(v47, 0, 1, v35);
  uint64_t v48 = v89;
  uint64_t v49 = v89 + *(int *)(v101 + 48);
  sub_23D2E4BD8(v46, v89, &qword_268C06C08);
  sub_23D2E4BD8(v47, v49, &qword_268C06C08);
  if (v42(v48, 1, v35) == 1)
  {
    sub_23D2E43D8(v47, &qword_268C06C08);
    sub_23D2E43D8(v46, &qword_268C06C08);
    int v50 = v42(v49, 1, v35);
    uint64_t v51 = v99;
    if (v50 == 1)
    {
      sub_23D2E43D8(v48, &qword_268C06C08);
LABEL_18:
      uint64_t v62 = 0;
      goto LABEL_22;
    }
LABEL_14:
    sub_23D2E43D8(v48, &qword_268C06C68);
    goto LABEL_19;
  }
  uint64_t v52 = v83;
  sub_23D2E4BD8(v48, v83, &qword_268C06C08);
  if (v42(v49, 1, v35) == 1)
  {
    sub_23D2E43D8(v93, &qword_268C06C08);
    sub_23D2E43D8(v46, &qword_268C06C08);
    (*(void (**)(uint64_t, uint64_t))(v102 + 8))(v52, v35);
    uint64_t v51 = v99;
    goto LABEL_14;
  }
  uint64_t v58 = v102;
  v59 = v85;
  (*(void (**)(char *, uint64_t, uint64_t))(v102 + 32))(v85, v49, v35);
  sub_23D2E4C3C(&qword_268C06C78, MEMORY[0x263F19A28]);
  LODWORD(v101) = sub_23D2E4F60();
  uint64_t v60 = v46;
  v61 = *(void (**)(char *, uint64_t))(v58 + 8);
  v61(v59, v35);
  sub_23D2E43D8(v93, &qword_268C06C08);
  sub_23D2E43D8(v60, &qword_268C06C08);
  v61((char *)v52, v35);
  sub_23D2E43D8(v48, &qword_268C06C08);
  uint64_t v51 = v99;
  if (v101) {
    goto LABEL_18;
  }
LABEL_19:
  uint64_t v63 = v45 + *(int *)(v51 + 40);
  if (*(unsigned char *)(v63 + 8)) {
    uint64_t v62 = 1;
  }
  else {
    uint64_t v62 = *(void *)v63;
  }
LABEL_22:
  objc_msgSend(v44, sel_setLabel_, v62);
  objc_msgSend(v44, sel_setIcon_, v100);
  uint64_t v64 = *(void *)(v45 + 16);
  char v65 = *(unsigned char *)(v45 + 24);
  j__swift_retain();
  uint64_t v66 = sub_23D2E4434(v64, v65, 0xEF3E726F6C6F433CLL, (void (*)(uint64_t, void))j_j__swift_release);
  j__swift_release();
  if (!v66) {
    sub_23D2E4F40();
  }
  sub_23D2E4624();
  v67 = (void *)sub_23D2E4F90();
  objc_msgSend(v44, sel_setBackgroundColor_, v67);

  uint64_t v68 = *(void *)v45;
  char v69 = *(unsigned char *)(v45 + 8);
  j__swift_retain();
  uint64_t v70 = sub_23D2E4434(v68, v69, 0xEF3E726F6C6F433CLL, (void (*)(uint64_t, void))j_j__swift_release);
  j__swift_release();
  if (!v70) {
    sub_23D2E4F50();
  }
  v71 = (void *)sub_23D2E4F90();
  objc_msgSend(v44, sel_setTintColor_, v71);

  uint64_t v72 = v45 + *(int *)(v51 + 32);
  uint64_t v73 = *(void *)v72;
  char v74 = *(unsigned char *)(v72 + 8);
  j__swift_retain();
  uint64_t v75 = sub_23D2E4434(v73, v74, 0xEE003E746E6F463CLL, (void (*)(uint64_t, void))j__swift_release);
  j__swift_release();
  if (v75)
  {
    uint64_t v76 = v90;
    sub_23D2E3EF4(&qword_268C06C18, MEMORY[0x263F1A668], 0x747865746E6F43, 0xE700000000000000, v90);
    v77 = (void *)sub_23D2E4EF0();
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v91 + 8))(v76, v92);
    objc_msgSend(v77, sel_pointSize);
    id v79 = objc_msgSend(self, sel_systemFontOfSize_, v78);
    objc_msgSend(v79, sel_pointSize);
    double v81 = v80;

    objc_msgSend(v44, sel_setFontSize_, v81);
  }
  else
  {
    v77 = 0;
  }
  objc_msgSend(v44, sel_updateConstraints);
}

id sub_23D2E1BE0()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F00B60]), sel_init);
  sub_23D2E269C(&qword_268C06C88);
  sub_23D2E4ED0();
  objc_msgSend(v0, sel_addTarget_action_forControlEvents_, v2, sel_action, 64);

  return v0;
}

id sub_23D2E1C70@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = (uint64_t *)(v2 + *(int *)(a1 + 40));
  uint64_t v5 = *v4;
  char v6 = *((unsigned char *)v4 + 8);
  uint64_t v8 = v4[2];
  uint64_t v7 = v4[3];
  uint64_t v9 = (objc_class *)type metadata accessor for Coordinator();
  uint64_t v10 = (char *)objc_allocWithZone(v9);
  uint64_t v11 = &v10[OBJC_IVAR____TtC23_CoreLocationUI_SwiftUIP33_8A043ABF03A1FE75D0192BCB51A8BCAD11Coordinator_config];
  *(void *)uint64_t v11 = v5;
  v11[8] = v6;
  *((void *)v11 + 2) = v8;
  *((void *)v11 + 3) = v7;
  v13.receiver = v10;
  v13.super_class = v9;
  swift_retain();
  id result = objc_msgSendSuper2(&v13, sel_init);
  *a2 = result;
  return result;
}

uint64_t sub_23D2E1D0C()
{
  return sub_23D2E4E40();
}

uint64_t sub_23D2E1D50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_23D2E4C3C(&qword_268C06C90, (void (*)(uint64_t))type metadata accessor for ViewRepresentable);

  return MEMORY[0x270F01780](a1, a2, a3, v6);
}

uint64_t sub_23D2E1DE4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_23D2E4C3C(&qword_268C06C90, (void (*)(uint64_t))type metadata accessor for ViewRepresentable);

  return MEMORY[0x270F01718](a1, a2, a3, v6);
}

void sub_23D2E1E78()
{
}

id sub_23D2E1F58()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for Coordinator();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for Coordinator()
{
  return self;
}

uint64_t sub_23D2E1FC8()
{
  return sub_23D2E4C3C(&qword_268C06BF8, (void (*)(uint64_t))type metadata accessor for ViewRepresentable);
}

uint64_t type metadata accessor for ViewRepresentable()
{
  uint64_t result = qword_268C06C38;
  if (!qword_268C06C38) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t _s23_CoreLocationUI_SwiftUI14LocationButtonV5TitleV7StorageOwet_0(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s23_CoreLocationUI_SwiftUI14LocationButtonV5TitleV7StorageOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x23D2E21B8);
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

uint64_t sub_23D2E21E0(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_23D2E21EC(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for LocationButton.Title.Storage()
{
  return &type metadata for LocationButton.Title.Storage;
}

uint64_t _s23_CoreLocationUI_SwiftUI13ConfigurationVwcp_0(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  uint64_t v3 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v3;
  swift_retain();
  return a1;
}

uint64_t _s23_CoreLocationUI_SwiftUI13ConfigurationVwca_0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  *(unsigned char *)(a1 + 8) = *((unsigned char *)a2 + 8);
  *(void *)a1 = v3;
  uint64_t v4 = a2[3];
  *(void *)(a1 + 16) = a2[2];
  *(void *)(a1 + 24) = v4;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t _s23_CoreLocationUI_SwiftUI13ConfigurationVwet_0(uint64_t a1, int a2)
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

uint64_t sub_23D2E22D8(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for Configuration()
{
  return &type metadata for Configuration;
}

uint64_t sub_23D2E2328(uint64_t a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v17 = *a2;
    *(void *)a1 = *a2;
    a1 = v17 + ((v5 + 16) & ~(unint64_t)v5);
  }
  else
  {
    uint64_t v7 = *a2;
    char v8 = *((unsigned char *)a2 + 8);
    j__swift_retain();
    *(void *)a1 = v7;
    *(unsigned char *)(a1 + 8) = v8;
    uint64_t v9 = a2[2];
    char v10 = *((unsigned char *)a2 + 24);
    j__swift_retain();
    *(void *)(a1 + 16) = v9;
    *(unsigned char *)(a1 + 24) = v10;
    uint64_t v11 = a3[6];
    uint64_t v12 = (void *)(a1 + v11);
    objc_super v13 = (uint64_t *)((char *)a2 + v11);
    sub_23D2E269C(&qword_268C06C00);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v14 = sub_23D2E4E10();
      uint64_t v15 = *(void *)(v14 - 8);
      if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14))
      {
        uint64_t v16 = sub_23D2E269C(&qword_268C06C08);
        memcpy(v12, v13, *(void *)(*(void *)(v16 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, void *, uint64_t))(v15 + 16))(v12, v13, v14);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
      }
    }
    else
    {
      void *v12 = *v13;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v18 = a3[7];
    uint64_t v19 = (void *)(a1 + v18);
    v20 = (uint64_t *)((char *)a2 + v18);
    sub_23D2E269C(&qword_268C06C10);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v21 = sub_23D2E4D20();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v21 - 8) + 16))(v19, v20, v21);
    }
    else
    {
      *uint64_t v19 = *v20;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v22 = a3[8];
    uint64_t v23 = a1 + v22;
    uint64_t v24 = (uint64_t *)((char *)a2 + v22);
    uint64_t v25 = *v24;
    char v26 = *((unsigned char *)v24 + 8);
    j__swift_retain();
    *(void *)uint64_t v23 = v25;
    *(unsigned char *)(v23 + 8) = v26;
    uint64_t v27 = a3[9];
    uint64_t v28 = (void *)(a1 + v27);
    v29 = (uint64_t *)((char *)a2 + v27);
    sub_23D2E269C(&qword_268C06C18);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v30 = sub_23D2E4F00();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v30 - 8) + 16))(v28, v29, v30);
    }
    else
    {
      *uint64_t v28 = *v29;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v31 = a3[10];
    uint64_t v32 = a1 + v31;
    uint64_t v33 = (uint64_t)a2 + v31;
    *(void *)uint64_t v32 = *(void *)v33;
    *(unsigned char *)(v32 + 8) = *(unsigned char *)(v33 + 8);
    uint64_t v34 = *(void *)(v33 + 24);
    *(void *)(v32 + 16) = *(void *)(v33 + 16);
    *(void *)(v32 + 24) = v34;
  }
  swift_retain();
  return a1;
}

uint64_t sub_23D2E269C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_23D2E26E4(uint64_t a1, int *a2)
{
  j__swift_release();
  j__swift_release();
  uint64_t v4 = a1 + a2[6];
  sub_23D2E269C(&qword_268C06C00);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_23D2E4E10();
    uint64_t v6 = *(void *)(v5 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5)) {
      (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
    }
  }
  else
  {
    swift_release();
  }
  uint64_t v7 = a1 + a2[7];
  sub_23D2E269C(&qword_268C06C10);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v8 = sub_23D2E4D20();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  }
  else
  {
    swift_release();
  }
  j__swift_release();
  uint64_t v9 = a1 + a2[9];
  sub_23D2E269C(&qword_268C06C18);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_23D2E4F00();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
  }
  else
  {
    swift_release();
  }

  return swift_release();
}

uint64_t sub_23D2E28F8(uint64_t a1, uint64_t *a2, int *a3)
{
  uint64_t v6 = *a2;
  char v7 = *((unsigned char *)a2 + 8);
  j__swift_retain();
  *(void *)a1 = v6;
  *(unsigned char *)(a1 + 8) = v7;
  uint64_t v8 = a2[2];
  char v9 = *((unsigned char *)a2 + 24);
  j__swift_retain();
  *(void *)(a1 + 16) = v8;
  *(unsigned char *)(a1 + 24) = v9;
  uint64_t v10 = a3[6];
  uint64_t v11 = (void *)(a1 + v10);
  uint64_t v12 = (uint64_t *)((char *)a2 + v10);
  sub_23D2E269C(&qword_268C06C00);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v13 = sub_23D2E4E10();
    uint64_t v14 = *(void *)(v13 - 8);
    if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13))
    {
      uint64_t v15 = sub_23D2E269C(&qword_268C06C08);
      memcpy(v11, v12, *(void *)(*(void *)(v15 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, void *, uint64_t))(v14 + 16))(v11, v12, v13);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
    }
  }
  else
  {
    void *v11 = *v12;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v16 = a3[7];
  uint64_t v17 = (void *)(a1 + v16);
  uint64_t v18 = (uint64_t *)((char *)a2 + v16);
  sub_23D2E269C(&qword_268C06C10);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v19 = sub_23D2E4D20();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v19 - 8) + 16))(v17, v18, v19);
  }
  else
  {
    *uint64_t v17 = *v18;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v20 = a3[8];
  uint64_t v21 = a1 + v20;
  uint64_t v22 = (uint64_t *)((char *)a2 + v20);
  uint64_t v23 = *v22;
  char v24 = *((unsigned char *)v22 + 8);
  j__swift_retain();
  *(void *)uint64_t v21 = v23;
  *(unsigned char *)(v21 + 8) = v24;
  uint64_t v25 = a3[9];
  char v26 = (void *)(a1 + v25);
  uint64_t v27 = (uint64_t *)((char *)a2 + v25);
  sub_23D2E269C(&qword_268C06C18);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v28 = sub_23D2E4F00();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v28 - 8) + 16))(v26, v27, v28);
  }
  else
  {
    *char v26 = *v27;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v29 = a3[10];
  uint64_t v30 = a1 + v29;
  uint64_t v31 = (uint64_t)a2 + v29;
  *(void *)uint64_t v30 = *(void *)v31;
  *(unsigned char *)(v30 + 8) = *(unsigned char *)(v31 + 8);
  uint64_t v32 = *(void *)(v31 + 24);
  *(void *)(v30 + 16) = *(void *)(v31 + 16);
  *(void *)(v30 + 24) = v32;
  swift_retain();
  return a1;
}

uint64_t sub_23D2E2C20(uint64_t a1, uint64_t *a2, int *a3)
{
  uint64_t v6 = *a2;
  char v7 = *((unsigned char *)a2 + 8);
  j__swift_retain();
  *(void *)a1 = v6;
  *(unsigned char *)(a1 + 8) = v7;
  j__swift_release();
  uint64_t v8 = a2[2];
  char v9 = *((unsigned char *)a2 + 24);
  j__swift_retain();
  *(void *)(a1 + 16) = v8;
  *(unsigned char *)(a1 + 24) = v9;
  j__swift_release();
  if ((uint64_t *)a1 != a2)
  {
    uint64_t v10 = a3[6];
    uint64_t v11 = (void *)(a1 + v10);
    uint64_t v12 = (uint64_t *)((char *)a2 + v10);
    sub_23D2E43D8(a1 + v10, &qword_268C06C00);
    sub_23D2E269C(&qword_268C06C00);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v13 = sub_23D2E4E10();
      uint64_t v14 = *(void *)(v13 - 8);
      if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13))
      {
        uint64_t v15 = sub_23D2E269C(&qword_268C06C08);
        memcpy(v11, v12, *(void *)(*(void *)(v15 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, void *, uint64_t))(v14 + 16))(v11, v12, v13);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
      }
    }
    else
    {
      void *v11 = *v12;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v16 = a3[7];
    uint64_t v17 = (void *)(a1 + v16);
    uint64_t v18 = (uint64_t *)((char *)a2 + v16);
    sub_23D2E43D8(a1 + v16, &qword_268C06C10);
    sub_23D2E269C(&qword_268C06C10);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v19 = sub_23D2E4D20();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v19 - 8) + 16))(v17, v18, v19);
    }
    else
    {
      *uint64_t v17 = *v18;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v20 = a3[8];
  uint64_t v21 = a1 + v20;
  uint64_t v22 = (uint64_t *)((char *)a2 + v20);
  uint64_t v23 = *v22;
  char v24 = *((unsigned char *)v22 + 8);
  j__swift_retain();
  *(void *)uint64_t v21 = v23;
  *(unsigned char *)(v21 + 8) = v24;
  j__swift_release();
  if ((uint64_t *)a1 != a2)
  {
    uint64_t v25 = a3[9];
    char v26 = (void *)(a1 + v25);
    uint64_t v27 = (uint64_t *)((char *)a2 + v25);
    sub_23D2E43D8(a1 + v25, &qword_268C06C18);
    sub_23D2E269C(&qword_268C06C18);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v28 = sub_23D2E4F00();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v28 - 8) + 16))(v26, v27, v28);
    }
    else
    {
      *char v26 = *v27;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v29 = a3[10];
  uint64_t v30 = a1 + v29;
  uint64_t v31 = (uint64_t *)((char *)a2 + v29);
  uint64_t v32 = *v31;
  *(unsigned char *)(v30 + 8) = *((unsigned char *)v31 + 8);
  *(void *)uint64_t v30 = v32;
  uint64_t v33 = v31[3];
  *(void *)(v30 + 16) = v31[2];
  *(void *)(v30 + 24) = v33;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_23D2E2FB8(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  uint64_t v6 = a3[6];
  char v7 = (void *)(a1 + v6);
  uint64_t v8 = (const void *)(a2 + v6);
  uint64_t v9 = sub_23D2E269C(&qword_268C06C00);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_23D2E4E10();
    uint64_t v11 = *(void *)(v10 - 8);
    if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48))(v8, 1, v10))
    {
      uint64_t v12 = sub_23D2E269C(&qword_268C06C08);
      memcpy(v7, v8, *(void *)(*(void *)(v12 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, const void *, uint64_t))(v11 + 32))(v7, v8, v10);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v7, 0, 1, v10);
    }
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v7, v8, *(void *)(*(void *)(v9 - 8) + 64));
  }
  uint64_t v13 = a3[7];
  uint64_t v14 = (void *)(a1 + v13);
  uint64_t v15 = (const void *)(a2 + v13);
  uint64_t v16 = sub_23D2E269C(&qword_268C06C10);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v17 = sub_23D2E4D20();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v17 - 8) + 32))(v14, v15, v17);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v14, v15, *(void *)(*(void *)(v16 - 8) + 64));
  }
  uint64_t v18 = a3[8];
  uint64_t v19 = a3[9];
  uint64_t v20 = a1 + v18;
  uint64_t v21 = a2 + v18;
  *(void *)uint64_t v20 = *(void *)v21;
  *(unsigned char *)(v20 + 8) = *(unsigned char *)(v21 + 8);
  uint64_t v22 = (void *)(a1 + v19);
  uint64_t v23 = (const void *)(a2 + v19);
  uint64_t v24 = sub_23D2E269C(&qword_268C06C18);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v25 = sub_23D2E4F00();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v25 - 8) + 32))(v22, v23, v25);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v22, v23, *(void *)(*(void *)(v24 - 8) + 64));
  }
  uint64_t v26 = a3[10];
  uint64_t v27 = (_OWORD *)(a1 + v26);
  uint64_t v28 = (_OWORD *)(a2 + v26);
  long long v29 = v28[1];
  _OWORD *v27 = *v28;
  v27[1] = v29;
  return a1;
}

uint64_t sub_23D2E32CC(uint64_t a1, uint64_t a2, int *a3)
{
  char v6 = *(unsigned char *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v6;
  j__swift_release();
  char v7 = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = v7;
  j__swift_release();
  if (a1 != a2)
  {
    uint64_t v8 = a3[6];
    uint64_t v9 = (void *)(a1 + v8);
    uint64_t v10 = (const void *)(a2 + v8);
    sub_23D2E43D8(a1 + v8, &qword_268C06C00);
    uint64_t v11 = sub_23D2E269C(&qword_268C06C00);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v12 = sub_23D2E4E10();
      uint64_t v13 = *(void *)(v12 - 8);
      if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v13 + 48))(v10, 1, v12))
      {
        uint64_t v14 = sub_23D2E269C(&qword_268C06C08);
        memcpy(v9, v10, *(void *)(*(void *)(v14 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, const void *, uint64_t))(v13 + 32))(v9, v10, v12);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v13 + 56))(v9, 0, 1, v12);
      }
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v9, v10, *(void *)(*(void *)(v11 - 8) + 64));
    }
    uint64_t v15 = a3[7];
    uint64_t v16 = (void *)(a1 + v15);
    uint64_t v17 = (const void *)(a2 + v15);
    sub_23D2E43D8(a1 + v15, &qword_268C06C10);
    uint64_t v18 = sub_23D2E269C(&qword_268C06C10);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v19 = sub_23D2E4D20();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v19 - 8) + 32))(v16, v17, v19);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v16, v17, *(void *)(*(void *)(v18 - 8) + 64));
    }
  }
  uint64_t v20 = a3[8];
  uint64_t v21 = a1 + v20;
  uint64_t v22 = (uint64_t *)(a2 + v20);
  uint64_t v23 = *v22;
  LOBYTE(v22) = *((unsigned char *)v22 + 8);
  *(void *)uint64_t v21 = v23;
  *(unsigned char *)(v21 + 8) = (_BYTE)v22;
  j__swift_release();
  if (a1 != a2)
  {
    uint64_t v24 = a3[9];
    uint64_t v25 = (void *)(a1 + v24);
    uint64_t v26 = (const void *)(a2 + v24);
    sub_23D2E43D8(a1 + v24, &qword_268C06C18);
    uint64_t v27 = sub_23D2E269C(&qword_268C06C18);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v28 = sub_23D2E4F00();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v28 - 8) + 32))(v25, v26, v28);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v25, v26, *(void *)(*(void *)(v27 - 8) + 64));
    }
  }
  uint64_t v29 = a3[10];
  uint64_t v30 = a1 + v29;
  uint64_t v31 = a2 + v29;
  *(void *)uint64_t v30 = *(void *)v31;
  *(unsigned char *)(v30 + 8) = *(unsigned char *)(v31 + 8);
  *(_OWORD *)(v30 + 16) = *(_OWORD *)(v31 + 16);
  swift_release();
  return a1;
}

uint64_t sub_23D2E3660(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_23D2E3674);
}

uint64_t sub_23D2E3674(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_23D2E269C(&qword_268C06C20);
  if (*(_DWORD *)(*(void *)(v6 - 8) + 84) == a2)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)(v6 - 8);
    uint64_t v9 = a3[6];
LABEL_7:
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 48);
    return v12(a1 + v9, a2, v7);
  }
  uint64_t v10 = sub_23D2E269C(&qword_268C06C28);
  if (*(_DWORD *)(*(void *)(v10 - 8) + 84) == a2)
  {
    uint64_t v7 = v10;
    uint64_t v8 = *(void *)(v10 - 8);
    uint64_t v9 = a3[7];
    goto LABEL_7;
  }
  uint64_t v11 = sub_23D2E269C(&qword_268C06C30);
  if (*(_DWORD *)(*(void *)(v11 - 8) + 84) == a2)
  {
    uint64_t v7 = v11;
    uint64_t v8 = *(void *)(v11 - 8);
    uint64_t v9 = a3[9];
    goto LABEL_7;
  }
  unint64_t v14 = *(void *)(a1 + a3[10] + 16);
  if (v14 >= 0xFFFFFFFF) {
    LODWORD(v14) = -1;
  }
  return (v14 + 1);
}

uint64_t sub_23D2E37E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_23D2E37F4);
}

uint64_t sub_23D2E37F4(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8 = sub_23D2E269C(&qword_268C06C20);
  if (*(_DWORD *)(*(void *)(v8 - 8) + 84) == a3)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)(v8 - 8);
    uint64_t v11 = a4[6];
  }
  else
  {
    uint64_t v12 = sub_23D2E269C(&qword_268C06C28);
    if (*(_DWORD *)(*(void *)(v12 - 8) + 84) == a3)
    {
      uint64_t v9 = v12;
      uint64_t v10 = *(void *)(v12 - 8);
      uint64_t v11 = a4[7];
    }
    else
    {
      uint64_t result = sub_23D2E269C(&qword_268C06C30);
      if (*(_DWORD *)(*(void *)(result - 8) + 84) != a3)
      {
        *(void *)(a1 + a4[10] + 16) = (a2 - 1);
        return result;
      }
      uint64_t v9 = result;
      uint64_t v10 = *(void *)(result - 8);
      uint64_t v11 = a4[9];
    }
  }
  unint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 56);

  return v14(a1 + v11, a2, a2, v9);
}

void sub_23D2E395C()
{
  sub_23D2E3AAC();
  if (v0 <= 0x3F)
  {
    sub_23D2E3B50(319, &qword_268C06C50, MEMORY[0x263F18BC8]);
    if (v1 <= 0x3F)
    {
      sub_23D2E3B50(319, &qword_268C06C58, MEMORY[0x263F1A668]);
      if (v2 <= 0x3F) {
        swift_initStructMetadata();
      }
    }
  }
}

void sub_23D2E3AAC()
{
  if (!qword_268C06C48)
  {
    sub_23D2E3B08(&qword_268C06C08);
    unint64_t v0 = sub_23D2E4CF0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268C06C48);
    }
  }
}

uint64_t sub_23D2E3B08(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

void sub_23D2E3B50(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_23D2E4CF0();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

unint64_t sub_23D2E3BA8()
{
  unint64_t result = qword_268C06C60;
  if (!qword_268C06C60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C06C60);
  }
  return result;
}

uint64_t sub_23D2E3BFC()
{
  return MEMORY[0x263F1BB58];
}

uint64_t sub_23D2E3C08()
{
  return sub_23D2E4C3C(&qword_268C06BF8, (void (*)(uint64_t))type metadata accessor for ViewRepresentable);
}

uint64_t sub_23D2E3C50@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_23D2E4DA0();
  *a1 = result;
  return result;
}

uint64_t sub_23D2E3C7C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_23D2E4D30();
  *a1 = result;
  return result;
}

uint64_t sub_23D2E3CA8()
{
  uint64_t v0 = swift_retain();
  return MEMORY[0x23ECFC990](v0);
}

uint64_t sub_23D2E3CD4()
{
  return sub_23D2E4D70();
}

uint64_t sub_23D2E3CF8(uint64_t a1)
{
  uint64_t v2 = sub_23D2E269C(&qword_268C06C08);
  MEMORY[0x270FA5388](v2 - 8);
  sub_23D2E4BD8(a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_268C06C08);
  return sub_23D2E4D80();
}

uint64_t sub_23D2E3D8C()
{
  return sub_23D2E4D50();
}

uint64_t sub_23D2E3DB0(uint64_t a1)
{
  uint64_t v2 = sub_23D2E4D20();
  MEMORY[0x270FA5388](v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_23D2E4D60();
}

uint64_t sub_23D2E3E78@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_23D2E4DB0();
  *a1 = result;
  return result;
}

uint64_t sub_23D2E3EA4()
{
  return sub_23D2E4DC0();
}

uint64_t sub_23D2E3ED0()
{
  return sub_23D2E4D90();
}

uint64_t sub_23D2E3EF4@<X0>(uint64_t *a1@<X0>, uint64_t (*a2)(void)@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X8>)
{
  unint64_t v23 = a4;
  uint64_t v9 = v5;
  uint64_t v11 = sub_23D2E4DE0();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388]();
  unint64_t v14 = (char *)&v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23D2E269C(a1);
  MEMORY[0x270FA5388]();
  uint64_t v16 = (char *)&v23 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23D2E4BD8(v9, (uint64_t)v16, a1);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v17 = a2(0);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v17 - 8) + 32))(a5, v16, v17);
  }
  else
  {
    os_log_type_t v19 = sub_23D2E4F80();
    uint64_t v20 = sub_23D2E4EE0();
    if (os_log_type_enabled(v20, v19))
    {
      uint64_t v21 = swift_slowAlloc();
      uint64_t v22 = swift_slowAlloc();
      uint64_t v24 = v22;
      *(_DWORD *)uint64_t v21 = 136315138;
      *(void *)(v21 + 4) = sub_23D2E4664(a3, v23, &v24);
      _os_log_impl(&dword_23D2DF000, v20, v19, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v21, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23ECFCEA0](v22, -1, -1);
      MEMORY[0x23ECFCEA0](v21, -1, -1);
    }

    sub_23D2E4DD0();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
}

uint64_t sub_23D2E417C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_23D2E4DE0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23D2E269C(&qword_268C06C00);
  MEMORY[0x270FA5388]();
  uint64_t v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23D2E4BD8(v2, (uint64_t)v9, &qword_268C06C00);
  if (swift_getEnumCaseMultiPayload() == 1) {
    return sub_23D2E4B70((uint64_t)v9, a1);
  }
  os_log_type_t v11 = sub_23D2E4F80();
  uint64_t v12 = sub_23D2E4EE0();
  if (os_log_type_enabled(v12, v11))
  {
    uint64_t v13 = swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    uint64_t v16 = v14;
    *(_DWORD *)uint64_t v13 = 136315138;
    *(void *)(v13 + 4) = sub_23D2E4664(0xD00000000000001DLL, 0x800000023D2E5C90, &v16);
    _os_log_impl(&dword_23D2DF000, v12, v11, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23ECFCEA0](v14, -1, -1);
    MEMORY[0x23ECFCEA0](v13, -1, -1);
  }

  sub_23D2E4DD0();
  swift_getAtKeyPath();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_23D2E43D8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_23D2E269C(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_23D2E4434(uint64_t a1, char a2, unint64_t a3, void (*a4)(uint64_t, void))
{
  uint64_t v8 = sub_23D2E4DE0();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388]();
  os_log_type_t v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  if ((a2 & 1) == 0)
  {
    os_log_type_t v12 = sub_23D2E4F80();
    uint64_t v13 = sub_23D2E4EE0();
    if (os_log_type_enabled(v13, v12))
    {
      uint64_t v14 = swift_slowAlloc();
      uint64_t v15 = swift_slowAlloc();
      uint64_t v18 = v15;
      *(_DWORD *)uint64_t v14 = 136315138;
      *(void *)(v14 + 4) = sub_23D2E4664(0x6C616E6F6974704FLL, a3, &v18);
      _os_log_impl(&dword_23D2DF000, v13, v12, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v14, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23ECFCEA0](v15, -1, -1);
      MEMORY[0x23ECFCEA0](v14, -1, -1);
    }

    sub_23D2E4DD0();
    swift_getAtKeyPath();
    a4(a1, 0);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    return v18;
  }
  return a1;
}

unint64_t sub_23D2E4624()
{
  unint64_t result = qword_268C06C70;
  if (!qword_268C06C70)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_268C06C70);
  }
  return result;
}

unint64_t sub_23D2E4664(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  unint64_t v6 = sub_23D2E4738(v12, 0, 0, 1, a1, a2);
  unint64_t v7 = v12[0];
  if (v6)
  {
    unint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_23D2E4888((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = MEMORY[0x263F8DBE0];
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_23D2E4888((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_23D2E4838((uint64_t)v12);
  return v7;
}

unint64_t sub_23D2E4738(unint64_t *a1, void *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v10 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v10)
        {
          v12[0] = a5;
          v12[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          memcpy(__dst, v12, HIBYTE(a6) & 0xF);
          unint64_t result = 0;
          *((unsigned char *)__dst + v10) = 0;
          *a1 = (unint64_t)__dst;
          return result;
        }
      }
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    unint64_t result = sub_23D2E48E4(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    unint64_t result = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    unint64_t result = sub_23D2E4FB0();
    if (!result)
    {
      __break(1u);
      return result;
    }
  }
  *a1 = result;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_23D2E4838(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_23D2E4888(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_23D2E48E4(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_23D2E497C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = (uint64_t)sub_23D2E4A80(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = (uint64_t)sub_23D2E4A80((char *)(v3 > 1), v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_23D2E497C(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_9;
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
      unint64_t v3 = sub_23D2E4A18(v2, 0);
      uint64_t result = sub_23D2E4FA0();
      if (v5) {
        break;
      }
      if (result == v2) {
        return (uint64_t)v3;
      }
      __break(1u);
LABEL_9:
      uint64_t v2 = sub_23D2E4F70();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_23D2E4A18(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return (void *)MEMORY[0x263F8EE78];
  }
  sub_23D2E269C(&qword_268C06C80);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_23D2E4A80(char *result, int64_t a2, char a3, char *a4)
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
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    sub_23D2E269C(&qword_268C06C80);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  os_log_type_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_23D2E4B70(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_23D2E269C(&qword_268C06C08);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_23D2E4BD8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_23D2E269C(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_23D2E4C3C(unint64_t *a1, void (*a2)(uint64_t))
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

void type metadata accessor for CLLocationButtonLabel()
{
  if (!qword_268C06C98)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_268C06C98);
    }
  }
}

uint64_t sub_23D2E4CF0()
{
  return MEMORY[0x270EFEFD0]();
}

uint64_t sub_23D2E4D00()
{
  return MEMORY[0x270EFFCB8]();
}

uint64_t sub_23D2E4D10()
{
  return MEMORY[0x270EFFCE8]();
}

uint64_t sub_23D2E4D20()
{
  return MEMORY[0x270EFFCF8]();
}

uint64_t sub_23D2E4D30()
{
  return MEMORY[0x270F00850]();
}

uint64_t sub_23D2E4D40()
{
  return MEMORY[0x270F00858]();
}

uint64_t sub_23D2E4D50()
{
  return MEMORY[0x270F009C0]();
}

uint64_t sub_23D2E4D60()
{
  return MEMORY[0x270F009C8]();
}

uint64_t sub_23D2E4D70()
{
  return MEMORY[0x270F00BB8]();
}

uint64_t sub_23D2E4D80()
{
  return MEMORY[0x270F00BC0]();
}

uint64_t sub_23D2E4D90()
{
  return MEMORY[0x270F00C48]();
}

uint64_t sub_23D2E4DA0()
{
  return MEMORY[0x270F00CC0]();
}

uint64_t sub_23D2E4DB0()
{
  return MEMORY[0x270F00D80]();
}

uint64_t sub_23D2E4DC0()
{
  return MEMORY[0x270F00D90]();
}

uint64_t sub_23D2E4DD0()
{
  return MEMORY[0x270F00ED8]();
}

uint64_t sub_23D2E4DE0()
{
  return MEMORY[0x270F00EE0]();
}

uint64_t sub_23D2E4DF0()
{
  return MEMORY[0x270F014D0]();
}

uint64_t sub_23D2E4E00()
{
  return MEMORY[0x270F014D8]();
}

uint64_t sub_23D2E4E10()
{
  return MEMORY[0x270F014E0]();
}

uint64_t sub_23D2E4E20()
{
  return MEMORY[0x270F016E0]();
}

uint64_t sub_23D2E4E30()
{
  return MEMORY[0x270F016F8]();
}

uint64_t sub_23D2E4E40()
{
  return MEMORY[0x270F01708]();
}

uint64_t sub_23D2E4E60()
{
  return MEMORY[0x270F01728]();
}

uint64_t sub_23D2E4E70()
{
  return MEMORY[0x270F01738]();
}

uint64_t sub_23D2E4E80()
{
  return MEMORY[0x270F01748]();
}

uint64_t sub_23D2E4E90()
{
  return MEMORY[0x270F01758]();
}

uint64_t sub_23D2E4EA0()
{
  return MEMORY[0x270F01768]();
}

uint64_t sub_23D2E4EB0()
{
  return MEMORY[0x270F01778]();
}

uint64_t sub_23D2E4ED0()
{
  return MEMORY[0x270F02418]();
}

uint64_t sub_23D2E4EE0()
{
  return MEMORY[0x270F029E0]();
}

uint64_t sub_23D2E4EF0()
{
  return MEMORY[0x270F02AB8]();
}

uint64_t sub_23D2E4F00()
{
  return MEMORY[0x270F02CA0]();
}

uint64_t sub_23D2E4F10()
{
  return MEMORY[0x270F032C0]();
}

uint64_t sub_23D2E4F20()
{
  return MEMORY[0x270F032D0]();
}

uint64_t sub_23D2E4F30()
{
  return MEMORY[0x270F036C0]();
}

uint64_t sub_23D2E4F40()
{
  return MEMORY[0x270F043F8]();
}

uint64_t sub_23D2E4F50()
{
  return MEMORY[0x270F04498]();
}

uint64_t sub_23D2E4F60()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_23D2E4F70()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_23D2E4F80()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_23D2E4F90()
{
  return MEMORY[0x270F05438]();
}

uint64_t sub_23D2E4FA0()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_23D2E4FB0()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_23D2E4FC0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_23D2E4FD0()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_23D2E4FE0()
{
  return MEMORY[0x270F9FC90]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
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

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x270FA0310]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x270FA03B8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
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

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x270FA0578]();
}