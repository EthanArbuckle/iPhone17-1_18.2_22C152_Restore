uint64_t sub_4B9C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  id v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t, uint64_t, uint64_t);
  void v15[5];
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t vars8;

  if (*(unsigned char *)(v1 + 81) == 1)
  {
    v15[1] = v15;
    __chkstk_darwin();
    sub_10D18();
    if (qword_18370 != -1) {
      swift_once();
    }
    v3 = (id)qword_18F80;
    v18 = sub_10D88();
    v19 = v4;
    v20 = v5 & 1;
    v21 = v6;
    sub_10D18();
    v7 = v3;
    v15[3] = sub_10D88();
    v15[4] = v8;
    v16 = v9 & 1;
    v17 = v10;
    sub_5C9C(&qword_183A0);
    sub_5EB8();
    sub_10EC8();
    v11 = sub_5C9C(&qword_18398);
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(a1, 0, 1, v11);
  }
  else
  {
    v13 = sub_5C9C(&qword_18398);
    v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
    return v14(a1, 1, 1, v13);
  }
}

uint64_t sub_4E6C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v47 = a2;
  uint64_t v44 = sub_5C9C(&qword_183C8);
  __chkstk_darwin();
  v45 = (char *)&v36 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_5C9C(&qword_18410);
  __chkstk_darwin();
  v50 = (char *)&v36 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v49 = sub_10AF8();
  uint64_t v5 = *(void *)(v49 - 8);
  __chkstk_darwin();
  v40 = (char *)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10B18();
  __chkstk_darwin();
  uint64_t v48 = sub_10AA8();
  uint64_t v7 = *(void *)(v48 - 8);
  __chkstk_darwin();
  v9 = (char *)&v36 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10F88();
  __chkstk_darwin();
  uint64_t v37 = sub_10AB8();
  uint64_t v36 = *(void *)(v37 - 8);
  __chkstk_darwin();
  v11 = (char *)&v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v39 = sub_5C9C(&qword_183D8);
  uint64_t v12 = *(void *)(v39 - 8);
  __chkstk_darwin();
  v14 = (char *)&v36 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = sub_5C9C(&qword_183B8);
  __chkstk_darwin();
  v43 = (char *)&v36 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v42 = sub_5C9C(&qword_183A0);
  __chkstk_darwin();
  uint64_t v41 = (uint64_t)&v36 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = *(void *)(a1 + 64);
  uint64_t v18 = *(void *)(a1 + 72);
  uint64_t v46 = a1;
  char v19 = *(unsigned char *)(a1 + 80);
  uint64_t v56 = v17;
  uint64_t v57 = v18;
  char v58 = v19;
  sub_5C9C(&qword_18418);
  sub_10EA8();
  uint64_t v53 = v51[0];
  uint64_t v54 = v51[1];
  char v55 = v52;
  sub_10F78();
  if (qword_18370 != -1) {
    swift_once();
  }
  id v20 = [(id)qword_18F80 bundleURL];
  sub_10AD8();

  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, enum case for LocalizedStringResource.BundleDescription.atURL(_:), v48);
  sub_10B08();
  sub_10AC8();
  v21 = v50;
  sub_10AE8();
  uint64_t v22 = v49;
  int v23 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 48))(v21, 1, v49);
  uint64_t v48 = 0xD000000000000010;
  if (v23 == 1)
  {
    __break(1u);
    JUMPOUT(0x5748);
  }
  v24 = v40;
  (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v40, v21, v22);
  uint64_t v25 = v46;
  sub_AAC0((uint64_t)v51);
  sub_10EB8();
  sub_61FC((uint64_t)v51, &qword_18420);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v24, v22);
  (*(void (**)(char *, uint64_t))(v36 + 8))(v11, v37);
  swift_release();
  swift_release();
  sub_10E78();
  uint64_t v26 = (uint64_t)v45;
  uint64_t v27 = v39;
  (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v45, v14, v39);
  uint64_t v28 = (uint64_t)v43;
  *(unsigned char *)(v26 + *(int *)(v44 + 36)) = 1;
  sub_6198(v26, v28, &qword_183C8);
  *(unsigned char *)(v28 + *(int *)(v38 + 36)) = 1;
  sub_61FC(v26, &qword_183C8);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v27);
  LOBYTE(v26) = *(unsigned char *)(v25 + 8);
  uint64_t v29 = swift_retain();
  uint64_t v30 = sub_ACCC(v29, v26);
  swift_release();
  swift_getKeyPath();
  v51[0] = v30;
  sub_6150((unint64_t *)&qword_18428, (void (*)(uint64_t))type metadata accessor for AirDropSettingsListHighlighter);
  sub_10B38();
  swift_release();
  uint64_t v31 = *(unsigned __int8 *)(v30 + 16);
  swift_release();
  uint64_t v32 = 0;
  switch(v31)
  {
    case 1:
      swift_bridgeObjectRelease();
      goto LABEL_8;
    case 2:
      uint64_t v48 = 0xD000000000000019;
      goto LABEL_7;
    case 3:
      goto LABEL_10;
    default:
LABEL_7:
      char v33 = sub_110D8();
      swift_bridgeObjectRelease();
      if (v33)
      {
LABEL_8:
        v51[0] = sub_10E28();
        swift_retain();
        uint64_t v32 = sub_10E88();
      }
      else
      {
        uint64_t v32 = 0;
      }
LABEL_10:
      uint64_t v34 = v41;
      sub_6198(v28, v41, &qword_183B8);
      swift_release();
      *(void *)(v34 + *(int *)(v42 + 36)) = v32;
      sub_61FC(v28, &qword_183B8);
      return sub_6258(v34, v47);
  }
}

uint64_t sub_5758@<X0>(uint64_t a1@<X8>)
{
  sub_10D18();
  if (qword_18370 != -1) {
    swift_once();
  }
  id v2 = (id)qword_18F80;
  uint64_t result = sub_10D88();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5 & 1;
  *(void *)(a1 + 24) = v6;
  return result;
}

uint64_t sub_5848()
{
  return sub_10E08();
}

Swift::Int sub_5868()
{
  Swift::UInt v1 = *v0;
  sub_110E8();
  sub_110F8(v1);
  return sub_11108();
}

void sub_58B0()
{
  sub_110F8(*v0);
}

Swift::Int sub_58DC()
{
  Swift::UInt v1 = *v0;
  sub_110E8();
  sub_110F8(v1);
  return sub_11108();
}

BOOL sub_5920(void *a1, void *a2)
{
  return *a1 == *a2;
}

void *sub_5934@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_5944(void *a1@<X8>)
{
  *a1 = *v1;
}

void type metadata accessor for SFAirDropDiscoverableMode()
{
  if (!qword_18380)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_18380);
    }
  }
}

uint64_t initializeBufferWithCopyOfBuffer for BringDevicesTogetherSection(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for BringDevicesTogetherSection(uint64_t a1)
{
  swift_release();
  if (*(unsigned char *)(a1 + 56))
  {
    if (*(void *)(a1 + 40)) {
      sub_5A44(a1 + 16);
    }
  }
  else
  {
    swift_release();
  }
  swift_release();

  return swift_release();
}

uint64_t sub_5A44(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t initializeWithCopy for BringDevicesTogetherSection(uint64_t a1, uint64_t a2)
{
  char v4 = *(unsigned char *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v4;
  uint64_t v5 = a2 + 16;
  char v6 = *(unsigned char *)(a2 + 56);
  swift_retain();
  if (v6)
  {
    uint64_t v7 = (_OWORD *)(a1 + 16);
    uint64_t v8 = *(void *)(a2 + 40);
    if (v8)
    {
      uint64_t v9 = *(void *)(a2 + 48);
      *(void *)(a1 + 40) = v8;
      *(void *)(a1 + 48) = v9;
      (**(void (***)(_OWORD *, uint64_t))(v8 - 8))(v7, v5);
    }
    else
    {
      long long v10 = *(_OWORD *)(v5 + 16);
      *uint64_t v7 = *(_OWORD *)v5;
      *(_OWORD *)(a1 + 32) = v10;
      *(void *)(a1 + 48) = *(void *)(v5 + 32);
    }
    *(unsigned char *)(a1 + 56) = 1;
  }
  else
  {
    *(void *)(a1 + 16) = *(void *)v5;
    *(unsigned char *)(a1 + 56) = 0;
    swift_retain();
  }
  uint64_t v11 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v11;
  *(_WORD *)(a1 + 80) = *(_WORD *)(a2 + 80);
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for BringDevicesTogetherSection(uint64_t a1, uint64_t a2)
{
  char v4 = *(unsigned char *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v4;
  swift_retain();
  swift_release();
  if (a1 != a2)
  {
    uint64_t v5 = (long long *)(a2 + 16);
    sub_61FC(a1 + 16, &qword_18388);
    if (*(unsigned char *)(a2 + 56))
    {
      uint64_t v6 = *(void *)(a2 + 40);
      if (v6)
      {
        *(void *)(a1 + 40) = v6;
        *(void *)(a1 + 48) = *(void *)(a2 + 48);
        (**(void (***)(uint64_t, uint64_t))(v6 - 8))(a1 + 16, a2 + 16);
      }
      else
      {
        long long v7 = *v5;
        long long v8 = *(_OWORD *)(a2 + 32);
        *(void *)(a1 + 48) = *(void *)(a2 + 48);
        *(_OWORD *)(a1 + 16) = v7;
        *(_OWORD *)(a1 + 32) = v8;
      }
      *(unsigned char *)(a1 + 56) = 1;
    }
    else
    {
      *(void *)(a1 + 16) = *(void *)v5;
      *(unsigned char *)(a1 + 56) = 0;
      swift_retain();
    }
  }
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_retain();
  swift_release();
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  *(unsigned char *)(a1 + 81) = *(unsigned char *)(a2 + 81);
  return a1;
}

uint64_t sub_5C9C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

__n128 initializeWithTake for BringDevicesTogetherSection(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  __n128 result = *(__n128 *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  long long v5 = *(_OWORD *)(a2 + 64);
  *(_WORD *)(a1 + 80) = *(_WORD *)(a2 + 80);
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  *(__n128 *)(a1 + 32) = result;
  return result;
}

uint64_t assignWithTake for BringDevicesTogetherSection(uint64_t a1, uint64_t a2)
{
  char v4 = *(unsigned char *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v4;
  swift_release();
  if (a1 != a2)
  {
    sub_61FC(a1 + 16, &qword_18388);
    long long v5 = *(_OWORD *)(a2 + 32);
    *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
    *(_OWORD *)(a1 + 32) = v5;
    *(_OWORD *)(a1 + 41) = *(_OWORD *)(a2 + 41);
  }
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_release();
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_release();
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  *(unsigned char *)(a1 + 81) = *(unsigned char *)(a2 + 81);
  return a1;
}

uint64_t getEnumTagSinglePayload for BringDevicesTogetherSection(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 82)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 72);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for BringDevicesTogetherSection(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_WORD *)(result + 80) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 82) = 1;
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
      *(void *)(result + 72) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 82) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for BringDevicesTogetherSection()
{
  return &type metadata for BringDevicesTogetherSection;
}

uint64_t sub_5E4C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_5E68()
{
  return sub_6150(&qword_18390, (void (*)(uint64_t))type metadata accessor for SFAirDropDiscoverableMode);
}

uint64_t sub_5EB0@<X0>(uint64_t a1@<X8>)
{
  return sub_4E6C(*(void *)(v1 + 16), a1);
}

unint64_t sub_5EB8()
{
  unint64_t result = qword_183A8;
  if (!qword_183A8)
  {
    sub_5F58(&qword_183A0);
    sub_5FA0();
    sub_6104(&qword_18400, &qword_18408);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_183A8);
  }
  return result;
}

uint64_t sub_5F58(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_5FA0()
{
  unint64_t result = qword_183B0;
  if (!qword_183B0)
  {
    sub_5F58(&qword_183B8);
    sub_6040();
    sub_6104(&qword_183F0, &qword_183F8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_183B0);
  }
  return result;
}

unint64_t sub_6040()
{
  unint64_t result = qword_183C0;
  if (!qword_183C0)
  {
    sub_5F58(&qword_183C8);
    sub_6104(&qword_183D0, &qword_183D8);
    sub_6104(&qword_183E0, &qword_183E8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_183C0);
  }
  return result;
}

uint64_t sub_6104(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_5F58(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_6150(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_6198(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_5C9C(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_61FC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_5C9C(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_6258(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_5C9C(&qword_183A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_62C4()
{
  unint64_t result = qword_18430;
  if (!qword_18430)
  {
    sub_5F58(&qword_18438);
    sub_6338();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_18430);
  }
  return result;
}

unint64_t sub_6338()
{
  unint64_t result = qword_18440;
  if (!qword_18440)
  {
    sub_5F58(&qword_18398);
    sub_5EB8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_18440);
  }
  return result;
}

uint64_t sub_63B8(uint64_t a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *(void *)a1 = *a2;
    uint64_t v4 = v12 + ((v5 + 16) & ~(unint64_t)v5);
  }
  else
  {
    char v7 = *((unsigned char *)a2 + 8);
    *(void *)a1 = *a2;
    *(unsigned char *)(a1 + 8) = v7;
    uint64_t v8 = a3[5];
    uint64_t v9 = (void *)(a1 + v8);
    long long v10 = (uint64_t *)((char *)a2 + v8);
    swift_retain();
    sub_5C9C(&qword_18448);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v11 = sub_10D58();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
    }
    else
    {
      void *v9 = *v10;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v13 = a3[6];
    uint64_t v14 = v4 + v13;
    uint64_t v15 = (uint64_t)a2 + v13;
    if (*((unsigned char *)a2 + v13 + 40))
    {
      uint64_t v16 = *(void *)(v15 + 24);
      if (v16)
      {
        uint64_t v17 = *(void *)(v15 + 32);
        *(void *)(v14 + 24) = v16;
        *(void *)(v14 + 32) = v17;
        (**(void (***)(uint64_t))(v16 - 8))(v14);
      }
      else
      {
        long long v18 = *(_OWORD *)(v15 + 16);
        *(_OWORD *)uint64_t v14 = *(_OWORD *)v15;
        *(_OWORD *)(v14 + 16) = v18;
        *(void *)(v14 + 32) = *(void *)(v15 + 32);
      }
      *(unsigned char *)(v14 + 40) = 1;
    }
    else
    {
      *(void *)uint64_t v14 = *(void *)v15;
      *(unsigned char *)(v14 + 40) = 0;
      swift_retain();
    }
    uint64_t v19 = a3[7];
    uint64_t v20 = a3[8];
    v21 = (void *)(v4 + v19);
    uint64_t v22 = (uint64_t *)((char *)a2 + v19);
    uint64_t v23 = v22[1];
    void *v21 = *v22;
    v21[1] = v23;
    v21[2] = v22[2];
    *(unsigned char *)(v4 + v20) = *((unsigned char *)a2 + v20);
    swift_retain();
  }
  swift_retain();
  return v4;
}

uint64_t sub_6594(uint64_t a1, uint64_t a2)
{
  swift_release();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  sub_5C9C(&qword_18448);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_10D58();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  }
  else
  {
    swift_release();
  }
  uint64_t v6 = a1 + *(int *)(a2 + 24);
  if (*(unsigned char *)(v6 + 40))
  {
    if (*(void *)(v6 + 24)) {
      sub_5A44(v6);
    }
  }
  else
  {
    swift_release();
  }
  swift_release();

  return swift_release();
}

uint64_t sub_6680(uint64_t a1, uint64_t a2, int *a3)
{
  char v6 = *(unsigned char *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v6;
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  swift_retain();
  sub_5C9C(&qword_18448);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_10D58();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  }
  else
  {
    *uint64_t v8 = *v9;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v11 = a3[6];
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  if (*(unsigned char *)(a2 + v11 + 40))
  {
    uint64_t v14 = *(void *)(v13 + 24);
    if (v14)
    {
      uint64_t v15 = *(void *)(v13 + 32);
      *(void *)(v12 + 24) = v14;
      *(void *)(v12 + 32) = v15;
      (**(void (***)(uint64_t))(v14 - 8))(v12);
    }
    else
    {
      long long v16 = *(_OWORD *)(v13 + 16);
      *(_OWORD *)uint64_t v12 = *(_OWORD *)v13;
      *(_OWORD *)(v12 + 16) = v16;
      *(void *)(v12 + 32) = *(void *)(v13 + 32);
    }
    *(unsigned char *)(v12 + 40) = 1;
  }
  else
  {
    *(void *)uint64_t v12 = *(void *)v13;
    *(unsigned char *)(v12 + 40) = 0;
    swift_retain();
  }
  uint64_t v17 = a3[7];
  uint64_t v18 = a3[8];
  uint64_t v19 = (void *)(a1 + v17);
  uint64_t v20 = (void *)(a2 + v17);
  uint64_t v21 = v20[1];
  *uint64_t v19 = *v20;
  v19[1] = v21;
  v19[2] = v20[2];
  *(unsigned char *)(a1 + v18) = *(unsigned char *)(a2 + v18);
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t sub_6810(uint64_t a1, uint64_t a2, int *a3)
{
  char v6 = *(unsigned char *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v6;
  swift_retain();
  swift_release();
  if (a1 != a2)
  {
    uint64_t v7 = a3[5];
    uint64_t v8 = (void *)(a1 + v7);
    uint64_t v9 = (void *)(a2 + v7);
    sub_61FC(a1 + v7, &qword_18448);
    sub_5C9C(&qword_18448);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v10 = sub_10D58();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
    }
    else
    {
      *uint64_t v8 = *v9;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v11 = a3[6];
    uint64_t v12 = a1 + v11;
    uint64_t v13 = (long long *)(a2 + v11);
    sub_61FC(a1 + v11, &qword_18388);
    if (*((unsigned char *)v13 + 40))
    {
      uint64_t v14 = *((void *)v13 + 3);
      if (v14)
      {
        *(void *)(v12 + 24) = v14;
        *(void *)(v12 + 32) = *((void *)v13 + 4);
        (**(void (***)(uint64_t, long long *))(v14 - 8))(v12, v13);
      }
      else
      {
        long long v15 = *v13;
        long long v16 = v13[1];
        *(void *)(v12 + 32) = *((void *)v13 + 4);
        *(_OWORD *)uint64_t v12 = v15;
        *(_OWORD *)(v12 + 16) = v16;
      }
      *(unsigned char *)(v12 + 40) = 1;
    }
    else
    {
      *(void *)uint64_t v12 = *(void *)v13;
      *(unsigned char *)(v12 + 40) = 0;
      swift_retain();
    }
  }
  uint64_t v17 = a3[7];
  uint64_t v18 = a1 + v17;
  uint64_t v19 = a2 + v17;
  *(void *)(a1 + v17) = *(void *)(a2 + v17);
  swift_retain();
  swift_release();
  *(void *)(v18 + 8) = *(void *)(v19 + 8);
  swift_retain();
  swift_release();
  *(void *)(v18 + 16) = *(void *)(v19 + 16);
  *(unsigned char *)(a1 + a3[8]) = *(unsigned char *)(a2 + a3[8]);
  return a1;
}

uint64_t sub_69FC(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  uint64_t v6 = a3[5];
  uint64_t v7 = (void *)(a1 + v6);
  uint64_t v8 = (const void *)(a2 + v6);
  uint64_t v9 = sub_5C9C(&qword_18448);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_10D58();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 32))(v7, v8, v10);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v7, v8, *(void *)(*(void *)(v9 - 8) + 64));
  }
  uint64_t v11 = a3[6];
  uint64_t v12 = a3[7];
  uint64_t v13 = (_OWORD *)(a1 + v11);
  uint64_t v14 = (_OWORD *)(a2 + v11);
  long long v15 = v14[1];
  *uint64_t v13 = *v14;
  v13[1] = v15;
  *(_OWORD *)((char *)v13 + 25) = *(_OWORD *)((char *)v14 + 25);
  uint64_t v16 = a1 + v12;
  uint64_t v17 = a2 + v12;
  *(void *)(v16 + 16) = *(void *)(v17 + 16);
  *(_OWORD *)uint64_t v16 = *(_OWORD *)v17;
  *(unsigned char *)(a1 + a3[8]) = *(unsigned char *)(a2 + a3[8]);
  return a1;
}

uint64_t sub_6B28(uint64_t a1, uint64_t a2, int *a3)
{
  char v6 = *(unsigned char *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v6;
  swift_release();
  if (a1 != a2)
  {
    uint64_t v7 = a3[5];
    uint64_t v8 = (void *)(a1 + v7);
    uint64_t v9 = (const void *)(a2 + v7);
    sub_61FC(a1 + v7, &qword_18448);
    uint64_t v10 = sub_5C9C(&qword_18448);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v11 = sub_10D58();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v11 - 8) + 32))(v8, v9, v11);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v8, v9, *(void *)(*(void *)(v10 - 8) + 64));
    }
    uint64_t v12 = a3[6];
    uint64_t v13 = (_OWORD *)(a2 + v12);
    uint64_t v14 = (_OWORD *)(a1 + v12);
    sub_61FC(a1 + v12, &qword_18388);
    long long v15 = v13[1];
    _OWORD *v14 = *v13;
    v14[1] = v15;
    *(_OWORD *)((char *)v14 + 25) = *(_OWORD *)((char *)v13 + 25);
  }
  uint64_t v16 = a3[7];
  uint64_t v17 = a1 + v16;
  uint64_t v18 = a2 + v16;
  *(void *)(a1 + v16) = *(void *)(a2 + v16);
  swift_release();
  *(void *)(v17 + 8) = *(void *)(v18 + 8);
  swift_release();
  *(void *)(v17 + 16) = *(void *)(v18 + 16);
  *(unsigned char *)(a1 + a3[8]) = *(unsigned char *)(a2 + a3[8]);
  return a1;
}

uint64_t sub_6CA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_6CB4);
}

uint64_t sub_6CB4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_5C9C(&qword_18450);
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
    unint64_t v12 = *(void *)(a1 + *(int *)(a3 + 28) + 8);
    if (v12 >= 0xFFFFFFFF) {
      LODWORD(v12) = -1;
    }
    return (v12 + 1);
  }
}

uint64_t sub_6D80(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_6D94);
}

uint64_t sub_6D94(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_5C9C(&qword_18450);
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
    *(void *)(a1 + *(int *)(a4 + 28) + 8) = (a2 - 1);
  }
  return result;
}

uint64_t type metadata accessor for AirDropDiscoveryModeSection()
{
  uint64_t result = qword_184B0;
  if (!qword_184B0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_6EA8()
{
  sub_6F5C();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_6F5C()
{
  if (!qword_184C0)
  {
    sub_10D58();
    unint64_t v0 = sub_10BF8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_184C0);
    }
  }
}

uint64_t sub_6FB4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_6FD0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v74 = a2;
  uint64_t v3 = sub_10D08();
  uint64_t v72 = *(void *)(v3 - 8);
  uint64_t v73 = v3;
  __chkstk_darwin(v3);
  v71 = (char *)v52 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_5C9C(&qword_18410);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)v52 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v76 = sub_10AF8();
  uint64_t v8 = *(void *)(v76 - 8);
  __chkstk_darwin(v76);
  char v58 = (char *)v52 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_10B18();
  __chkstk_darwin(v10 - 8);
  uint64_t v75 = sub_10AA8();
  uint64_t v11 = *(void *)(v75 - 8);
  __chkstk_darwin(v75);
  uint64_t v13 = (char *)v52 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_10F88();
  __chkstk_darwin(v14 - 8);
  uint64_t v57 = sub_10AB8();
  uint64_t v56 = *(void *)(v57 - 8);
  __chkstk_darwin(v57);
  uint64_t v16 = (char *)v52 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v63 = sub_5C9C(&qword_18530);
  uint64_t v62 = *(void *)(v63 - 8);
  __chkstk_darwin(v63);
  v60 = (char *)v52 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v66 = sub_5C9C(&qword_18518);
  __chkstk_darwin(v66);
  v59 = (char *)v52 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_5C9C(&qword_18510);
  uint64_t v69 = *(void *)(v19 - 8);
  uint64_t v70 = v19;
  __chkstk_darwin(v19);
  v67 = (char *)v52 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v68 = sub_5C9C(&qword_18508);
  uint64_t v65 = *(void *)(v68 - 8);
  __chkstk_darwin(v68);
  v61 = (char *)v52 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v55 = sub_10D18();
  uint64_t v54 = v22;
  v52[1] = v23;
  uint64_t v53 = v24;
  uint64_t v25 = *(int *)(type metadata accessor for AirDropDiscoveryModeSection() + 28);
  uint64_t v64 = a1;
  uint64_t v26 = (long long *)(a1 + v25);
  long long v27 = *v26;
  uint64_t v28 = *((void *)v26 + 2);
  long long v79 = v27;
  uint64_t v80 = v28;
  sub_5C9C(&qword_18570);
  sub_10EA8();
  long long v79 = v77;
  uint64_t v80 = v78;
  sub_10F78();
  if (qword_18370 != -1) {
    swift_once();
  }
  id v29 = [(id)qword_18F80 bundleURL];
  sub_10AD8();

  (*(void (**)(char *, void, uint64_t))(v11 + 104))(v13, enum case for LocalizedStringResource.BundleDescription.atURL(_:), v75);
  sub_10B08();
  sub_10AC8();
  sub_10AE8();
  uint64_t v30 = v76;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v7, 1, v76) == 1)
  {
    __break(1u);
    JUMPOUT(0x7B2CLL);
  }
  uint64_t v31 = v58;
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v58, v7, v30);
  uint64_t v32 = v64;
  sub_AAC0((uint64_t)&v77);
  sub_10EB8();
  sub_61FC((uint64_t)&v77, &qword_18420);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v31, v30);
  (*(void (**)(char *, uint64_t))(v56 + 8))(v16, v57);
  swift_release();
  uint64_t v33 = swift_release();
  long long v77 = v81;
  uint64_t v78 = v82;
  __chkstk_darwin(v33);
  type metadata accessor for SFAirDropDiscoverableMode();
  sub_5C9C(&qword_18578);
  sub_6150(&qword_18580, (void (*)(uint64_t))type metadata accessor for SFAirDropDiscoverableMode);
  sub_6104(&qword_18588, &qword_18578);
  uint64_t v34 = v60;
  sub_10E68();
  char v35 = *(unsigned char *)(v32 + 8);
  uint64_t v36 = swift_retain();
  uint64_t v37 = sub_ACCC(v36, v35);
  swift_release();
  swift_getKeyPath();
  *(void *)&long long v79 = v37;
  sub_6150((unint64_t *)&qword_18428, (void (*)(uint64_t))type metadata accessor for AirDropSettingsListHighlighter);
  sub_10B38();
  swift_release();
  uint64_t v38 = *(unsigned __int8 *)(v37 + 16);
  swift_release();
  switch(v38)
  {
    case 1:
    case 2:
      char v39 = sub_110D8();
      swift_bridgeObjectRelease();
      if ((v39 & 1) == 0) {
        goto LABEL_8;
      }
      goto LABEL_7;
    case 3:
LABEL_8:
      uint64_t v40 = 0;
      break;
    default:
      swift_bridgeObjectRelease();
LABEL_7:
      *(void *)&long long v77 = sub_10E28();
      swift_retain();
      uint64_t v40 = sub_10E88();
      break;
  }
  uint64_t v41 = v62;
  uint64_t v42 = (uint64_t)v59;
  uint64_t v43 = v63;
  (*(void (**)(char *, char *, uint64_t))(v62 + 16))(v59, v34, v63);
  swift_release();
  uint64_t v44 = v66;
  *(void *)(v42 + *(int *)(v66 + 36)) = v40;
  (*(void (**)(char *, uint64_t))(v41 + 8))(v34, v43);
  unint64_t v45 = sub_90E4();
  uint64_t v46 = v67;
  sub_10DF8();
  sub_61FC(v42, &qword_18518);
  uint64_t v47 = v71;
  sub_10CF8();
  *(void *)&long long v77 = v44;
  *((void *)&v77 + 1) = v45;
  swift_getOpaqueTypeConformance2();
  uint64_t v48 = v61;
  uint64_t v49 = v70;
  uint64_t v50 = v73;
  sub_10DE8();
  (*(void (**)(char *, uint64_t))(v72 + 8))(v47, v50);
  (*(void (**)(char *, uint64_t))(v69 + 8))(v46, v49);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v65 + 32))(v74, v48, v68);
}

uint64_t sub_7B3C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_5C9C(&qword_18590);
  uint64_t v5 = *(void *)(v4 - 8);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v32 = (char *)&v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_5C9C(&qword_18598);
  uint64_t v37 = *(void *)(v7 - 8);
  uint64_t v38 = v7;
  ((void (*)(void))__chkstk_darwin)();
  char v39 = (char *)&v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_5C9C(&qword_185A0);
  uint64_t v9 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v11 = (char *)&v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v31 - v12;
  uint64_t v14 = sub_5C9C(&qword_185A8);
  uint64_t v35 = *(void *)(v14 - 8);
  uint64_t v36 = v14;
  __chkstk_darwin(v14);
  uint64_t v16 = (char *)&v31 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = 0;
  type metadata accessor for SFAirDropDiscoverableMode();
  sub_5C9C(&qword_185B0);
  sub_6150(&qword_18580, (void (*)(uint64_t))type metadata accessor for SFAirDropDiscoverableMode);
  sub_96BC();
  sub_10C18();
  char v17 = PSIsInEDUMode();
  uint64_t v33 = v16;
  if (v17)
  {
    uint64_t v18 = 1;
  }
  else
  {
    uint64_t v40 = 1;
    sub_10C18();
    uint64_t v18 = 0;
  }
  uint64_t v19 = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v13, v18, 1, v4);
  uint64_t v40 = 2;
  __chkstk_darwin(v19);
  *(&v31 - 2) = a1;
  sub_5C9C(&qword_18558);
  uint64_t v20 = v4;
  uint64_t v21 = (uint64_t)v13;
  sub_92BC();
  sub_10C18();
  sub_6104(&qword_185D0, &qword_185A8);
  uint64_t v22 = v33;
  uint64_t v23 = v36;
  sub_10C58();
  uint64_t v24 = a2 + *(int *)(sub_5C9C(&qword_185D8) + 48);
  uint64_t v34 = v21;
  sub_6198(v21, (uint64_t)v11, &qword_185A0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v11, 1, v20) == 1)
  {
    uint64_t v25 = sub_5C9C(&qword_185E0);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v25 - 8) + 56))(v24, 1, 1, v25);
  }
  else
  {
    uint64_t v26 = v32;
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v32, v11, v20);
    sub_6104(&qword_185F0, &qword_18590);
    sub_10C58();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v26, v20);
    uint64_t v27 = sub_5C9C(&qword_185E0);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56))(v24, 0, 1, v27);
  }
  sub_6104(&qword_185E8, &qword_18598);
  uint64_t v28 = v38;
  id v29 = v39;
  sub_10C58();
  (*(void (**)(char *, uint64_t))(v37 + 8))(v29, v28);
  sub_61FC(v34, &qword_185A0);
  return (*(uint64_t (**)(char *, uint64_t))(v35 + 8))(v22, v23);
}

uint64_t sub_811C@<X0>(uint64_t a1@<X8>)
{
  sub_10D18();
  if (qword_18370 != -1) {
    swift_once();
  }
  id v2 = (id)qword_18F80;
  uint64_t result = sub_10D88();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5 & 1;
  *(void *)(a1 + 24) = v6;
  *(_WORD *)(a1 + 32) = 0;
  return result;
}

uint64_t sub_8210@<X0>(uint64_t a1@<X8>)
{
  sub_10D18();
  if (qword_18370 != -1) {
    swift_once();
  }
  id v2 = (id)qword_18F80;
  uint64_t result = sub_10D88();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5 & 1;
  *(void *)(a1 + 24) = v6;
  return result;
}

double sub_8300@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  if (*(unsigned char *)(a1 + *(int *)(type metadata accessor for AirDropDiscoveryModeSection() + 32)) == 1)
  {
    sub_10D18();
    if (qword_18370 == -1) {
      goto LABEL_5;
    }
    goto LABEL_6;
  }
  sub_10D18();
  if (qword_18370 != -1) {
LABEL_6:
  }
    swift_once();
LABEL_5:
  id v3 = (id)qword_18F80;
  sub_10D88();
  sub_10D38();
  double result = *(double *)&v5;
  *(_OWORD *)a2 = v5;
  *(_OWORD *)(a2 + 16) = v6;
  *(unsigned char *)(a2 + 32) = v7;
  return result;
}

uint64_t sub_84EC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_5C9C(&qword_18568) - 8;
  __chkstk_darwin();
  long long v6 = (uint64_t *)((char *)&KeyPath - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v23 = *(void *)(type metadata accessor for AirDropDiscoveryModeSection() - 8);
  uint64_t v7 = *(void *)(v23 + 64);
  __chkstk_darwin();
  uint64_t v28 = sub_10C48();
  uint64_t v8 = *(void *)(v28 - 8);
  __chkstk_darwin();
  uint64_t v10 = (char *)&KeyPath - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_87D8((uint64_t)v29);
  uint64_t v25 = v29[1];
  uint64_t v26 = v29[0];
  uint64_t v11 = v29[3];
  uint64_t v24 = v29[2];
  int v27 = v31;
  char v12 = v30;
  uint64_t KeyPath = swift_getKeyPath();
  sub_9350(a1, (uint64_t)&KeyPath - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v13 = (*(unsigned __int8 *)(v23 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v23 + 80);
  uint64_t v14 = swift_allocObject();
  sub_9520((uint64_t)&KeyPath - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v14 + v13);
  sub_10C38();
  uint64_t v15 = v28;
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))((char *)v6 + *(int *)(v4 + 36), v10, v28);
  *long long v6 = KeyPath;
  uint64_t v16 = sub_5C9C(&qword_18500);
  sub_6198((uint64_t)v6, a2 + *(int *)(v16 + 36), &qword_18568);
  uint64_t v18 = v25;
  uint64_t v17 = v26;
  *(void *)a2 = v26;
  *(void *)(a2 + 8) = v18;
  char v19 = v24;
  *(void *)(a2 + 16) = v24;
  *(void *)(a2 + 24) = v11;
  *(unsigned char *)(a2 + 32) = v12;
  *(unsigned char *)(a2 + 33) = v27;
  char v20 = v19;
  sub_9604(v17, v18, v19);
  sub_61FC((uint64_t)v6, &qword_18568);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v15);
  return sub_9658(v17, v18, v20);
}

id sub_87D8@<X0>(uint64_t a1@<X8>)
{
  int v2 = PSIsInEDUMode();
  id result = (id)MobileGestalt_get_current_device();
  if (result)
  {
    uint64_t v4 = result;
    int wapiCapability = MobileGestalt_get_wapiCapability();

    if (v2)
    {
      if (wapiCapability)
      {
        sub_10D18();
        if (qword_18370 == -1) {
          goto LABEL_12;
        }
      }
      else
      {
        sub_10D18();
        if (qword_18370 == -1) {
          goto LABEL_12;
        }
      }
    }
    else if (wapiCapability)
    {
      sub_10D18();
      if (qword_18370 == -1) {
        goto LABEL_12;
      }
    }
    else
    {
      sub_10D18();
      if (qword_18370 == -1)
      {
LABEL_12:
        id v6 = (id)qword_18F80;
        uint64_t v7 = sub_10D88();
        uint64_t v9 = v8;
        char v11 = v10 & 1;
        sub_9648(v7, v8, v10 & 1);
        swift_bridgeObjectRetain();
        sub_10D38();
        sub_5C9C(&qword_18558);
        sub_92BC();
        sub_10D38();
        sub_969C(v7, v9, v11);
        id result = (id)swift_bridgeObjectRelease();
        *(_OWORD *)a1 = v12;
        *(_OWORD *)(a1 + 16) = v13;
        *(unsigned char *)(a1 + 32) = v14;
        *(unsigned char *)(a1 + 33) = v15;
        return result;
      }
    }
    swift_once();
    goto LABEL_12;
  }
  __break(1u);
  return result;
}

uint64_t sub_8C84(uint64_t a1)
{
  sub_10C48();
  __chkstk_darwin();
  (*(void (**)(char *, uint64_t))(v3 + 16))((char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_10CB8();
}

uint64_t sub_8D4C()
{
  uint64_t v0 = sub_10D58();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for AirDropDiscoveryModeSection();
  sub_AF08((uint64_t)v3);
  sub_10D48();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return sub_10C28();
}

void sub_8E54(uint64_t a1)
{
  if (qword_18378 != -1) {
    swift_once();
  }
  NSString v2 = [(id)qword_18F88 identifier];
  if (v2)
  {
    sub_10FA8();

    NSString v2 = sub_10F98();
    swift_bridgeObjectRelease();
  }
  id v3 = [self presenterForPrivacySplashWithIdentifier:v2];

  [v3 setPresentingViewController:a1];
  [v3 present];
}

uint64_t sub_8F68()
{
  uint64_t v1 = sub_5C9C(&qword_18500);
  __chkstk_darwin(v1);
  uint64_t v10 = v0;
  sub_84EC(v0, (uint64_t)&v9[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)]);
  sub_5C9C(&qword_18508);
  uint64_t v3 = sub_5F58(&qword_18510);
  uint64_t v4 = sub_10D08();
  uint64_t v5 = sub_5F58(&qword_18518);
  unint64_t v6 = sub_90E4();
  uint64_t v11 = v5;
  unint64_t v12 = v6;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v11 = v3;
  unint64_t v12 = v4;
  uint64_t v13 = OpaqueTypeConformance2;
  char v14 = &protocol witness table for InlinePickerStyle;
  swift_getOpaqueTypeConformance2();
  sub_91A8();
  return sub_10ED8();
}

uint64_t sub_90DC@<X0>(uint64_t a1@<X8>)
{
  return sub_6FD0(*(void *)(v1 + 16), a1);
}

unint64_t sub_90E4()
{
  unint64_t result = qword_18520;
  if (!qword_18520)
  {
    sub_5F58(&qword_18518);
    sub_6104(&qword_18528, &qword_18530);
    sub_6104(&qword_18400, &qword_18408);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_18520);
  }
  return result;
}

unint64_t sub_91A8()
{
  unint64_t result = qword_18538;
  if (!qword_18538)
  {
    sub_5F58(&qword_18500);
    sub_9248();
    sub_6104(&qword_18560, &qword_18568);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_18538);
  }
  return result;
}

unint64_t sub_9248()
{
  unint64_t result = qword_18540;
  if (!qword_18540)
  {
    sub_5F58(&qword_18548);
    sub_92BC();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_18540);
  }
  return result;
}

unint64_t sub_92BC()
{
  unint64_t result = qword_18550;
  if (!qword_18550)
  {
    sub_5F58(&qword_18558);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_18550);
  }
  return result;
}

uint64_t sub_9328()
{
  return sub_10CA8();
}

uint64_t sub_9350(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AirDropDiscoveryModeSection();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_93B4()
{
  uint64_t v1 = type metadata accessor for AirDropDiscoveryModeSection();
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);
  swift_release();
  uint64_t v5 = v0 + v3 + *(int *)(v1 + 20);
  sub_5C9C(&qword_18448);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_10D58();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  }
  else
  {
    swift_release();
  }
  uint64_t v7 = v0 + v3 + *(int *)(v1 + 24);
  if (*(unsigned char *)(v7 + 40))
  {
    if (*(void *)(v7 + 24)) {
      sub_5A44(v7);
    }
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, v3 + v4, v2 | 7);
}

uint64_t sub_9520(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AirDropDiscoveryModeSection();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_9584()
{
  type metadata accessor for AirDropDiscoveryModeSection();

  return sub_8D4C();
}

uint64_t sub_9604(uint64_t a1, uint64_t a2, char a3)
{
  return sub_960C(a1, a2, a3);
}

uint64_t sub_960C(uint64_t a1, uint64_t a2, char a3)
{
  sub_9648(a1, a2, a3 & 1);

  return swift_bridgeObjectRetain();
}

uint64_t sub_9648(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_9658(uint64_t a1, uint64_t a2, char a3)
{
  return sub_9660(a1, a2, a3);
}

uint64_t sub_9660(uint64_t a1, uint64_t a2, char a3)
{
  sub_969C(a1, a2, a3 & 1);

  return swift_bridgeObjectRelease();
}

uint64_t sub_969C(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_96AC@<X0>(uint64_t a1@<X8>)
{
  return sub_7B3C(*(void *)(v1 + 16), a1);
}

unint64_t sub_96BC()
{
  unint64_t result = qword_185B8;
  if (!qword_185B8)
  {
    sub_5F58(&qword_185B0);
    sub_975C();
    sub_6104(&qword_183F0, &qword_183F8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_185B8);
  }
  return result;
}

unint64_t sub_975C()
{
  unint64_t result = qword_185C0;
  if (!qword_185C0)
  {
    sub_5F58(&qword_185C8);
    sub_6104(&qword_183E0, &qword_183E8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_185C0);
  }
  return result;
}

double sub_97FC@<D0>(uint64_t a1@<X8>)
{
  return sub_8300(*(void *)(v1 + 16), a1);
}

unint64_t sub_9808()
{
  unint64_t result = qword_185F8;
  if (!qword_185F8)
  {
    sub_5F58(&qword_18600);
    sub_5F58(&qword_18510);
    sub_10D08();
    sub_5F58(&qword_18518);
    sub_90E4();
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    sub_91A8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_185F8);
  }
  return result;
}

uint64_t initializeWithCopy for UseCellularDataSection(uint64_t a1, uint64_t a2)
{
  char v4 = *(unsigned char *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v4;
  uint64_t v5 = a2 + 16;
  char v6 = *(unsigned char *)(a2 + 56);
  swift_retain();
  if (v6)
  {
    uint64_t v7 = (_OWORD *)(a1 + 16);
    uint64_t v8 = *(void *)(a2 + 40);
    if (v8)
    {
      uint64_t v9 = *(void *)(a2 + 48);
      *(void *)(a1 + 40) = v8;
      *(void *)(a1 + 48) = v9;
      (**(void (***)(_OWORD *, uint64_t))(v8 - 8))(v7, v5);
    }
    else
    {
      long long v10 = *(_OWORD *)(v5 + 16);
      *uint64_t v7 = *(_OWORD *)v5;
      *(_OWORD *)(a1 + 32) = v10;
      *(void *)(a1 + 48) = *(void *)(v5 + 32);
    }
    *(unsigned char *)(a1 + 56) = 1;
  }
  else
  {
    *(void *)(a1 + 16) = *(void *)v5;
    *(unsigned char *)(a1 + 56) = 0;
    swift_retain();
  }
  uint64_t v11 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v11;
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for UseCellularDataSection(uint64_t a1, uint64_t a2)
{
  char v4 = *(unsigned char *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v4;
  swift_retain();
  swift_release();
  if (a1 != a2)
  {
    uint64_t v5 = (long long *)(a2 + 16);
    sub_61FC(a1 + 16, &qword_18388);
    if (*(unsigned char *)(a2 + 56))
    {
      uint64_t v6 = *(void *)(a2 + 40);
      if (v6)
      {
        *(void *)(a1 + 40) = v6;
        *(void *)(a1 + 48) = *(void *)(a2 + 48);
        (**(void (***)(uint64_t, uint64_t))(v6 - 8))(a1 + 16, a2 + 16);
      }
      else
      {
        long long v7 = *v5;
        long long v8 = *(_OWORD *)(a2 + 32);
        *(void *)(a1 + 48) = *(void *)(a2 + 48);
        *(_OWORD *)(a1 + 16) = v7;
        *(_OWORD *)(a1 + 32) = v8;
      }
      *(unsigned char *)(a1 + 56) = 1;
    }
    else
    {
      *(void *)(a1 + 16) = *(void *)v5;
      *(unsigned char *)(a1 + 56) = 0;
      swift_retain();
    }
  }
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_retain();
  swift_release();
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  return a1;
}

__n128 initializeWithTake for UseCellularDataSection(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  __n128 result = *(__n128 *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  long long v5 = *(_OWORD *)(a2 + 64);
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  *(__n128 *)(a1 + 32) = result;
  return result;
}

uint64_t assignWithTake for UseCellularDataSection(uint64_t a1, uint64_t a2)
{
  char v4 = *(unsigned char *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v4;
  swift_release();
  if (a1 != a2)
  {
    sub_61FC(a1 + 16, &qword_18388);
    long long v5 = *(_OWORD *)(a2 + 32);
    *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
    *(_OWORD *)(a1 + 32) = v5;
    *(_OWORD *)(a1 + 41) = *(_OWORD *)(a2 + 41);
  }
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_release();
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_release();
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  return a1;
}

uint64_t getEnumTagSinglePayload for UseCellularDataSection(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 81)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 72);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for UseCellularDataSection(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 80) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 81) = 1;
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
      *(void *)(result + 72) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 81) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for UseCellularDataSection()
{
  return &type metadata for UseCellularDataSection;
}

uint64_t sub_9C7C()
{
  return swift_getOpaqueTypeConformance2();
}

id sub_9C98@<X0>(uint64_t a1@<X8>)
{
  id result = (id)MobileGestalt_get_current_device();
  if (result)
  {
    uint64_t v3 = result;
    int hasBaseband = MobileGestalt_get_hasBaseband();

    if (hasBaseband)
    {
      __chkstk_darwin(v5);
      sub_10D18();
      if (qword_18370 != -1) {
        swift_once();
      }
      id v6 = (id)qword_18F80;
      uint64_t v14 = sub_10D88();
      uint64_t v15 = v7;
      char v16 = v8 & 1;
      uint64_t v17 = v9;
      sub_A8B4((uint64_t)v13);
      sub_5C9C(&qword_183A0);
      sub_5C9C(&qword_18558);
      sub_5EB8();
      sub_92BC();
      sub_10EC8();
      uint64_t v10 = sub_5C9C(&qword_18608);
      return (id)(*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(a1, 0, 1, v10);
    }
    else
    {
      uint64_t v11 = sub_5C9C(&qword_18608);
      unint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56);
      return (id)v12(a1, 1, 1, v11);
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_9F14@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v49 = a2;
  uint64_t v46 = sub_5C9C(&qword_183C8);
  __chkstk_darwin(v46);
  uint64_t v47 = (char *)&v38 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_5C9C(&qword_18410);
  __chkstk_darwin(v4 - 8);
  char v52 = (char *)&v38 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v51 = sub_10AF8();
  uint64_t v6 = *(void *)(v51 - 8);
  __chkstk_darwin(v51);
  uint64_t v42 = (char *)&v38 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_10B18();
  __chkstk_darwin(v8 - 8);
  uint64_t v50 = sub_10AA8();
  uint64_t v9 = *(void *)(v50 - 8);
  __chkstk_darwin(v50);
  uint64_t v11 = (char *)&v38 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_10F88();
  __chkstk_darwin(v12 - 8);
  uint64_t v39 = sub_10AB8();
  uint64_t v38 = *(void *)(v39 - 8);
  __chkstk_darwin(v39);
  uint64_t v14 = (char *)&v38 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v41 = sub_5C9C(&qword_183D8);
  uint64_t v15 = *(void *)(v41 - 8);
  __chkstk_darwin(v41);
  uint64_t v17 = (char *)&v38 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = sub_5C9C(&qword_183B8);
  __chkstk_darwin(v40);
  unint64_t v45 = (char *)&v38 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v44 = sub_5C9C(&qword_183A0);
  __chkstk_darwin(v44);
  uint64_t v43 = (uint64_t)&v38 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = *(void *)(a1 + 64);
  uint64_t v21 = *(void *)(a1 + 72);
  uint64_t v48 = a1;
  char v22 = *(unsigned char *)(a1 + 80);
  uint64_t v58 = v20;
  uint64_t v59 = v21;
  char v60 = v22;
  sub_5C9C(&qword_18418);
  sub_10EA8();
  uint64_t v55 = v53[0];
  uint64_t v56 = v53[1];
  char v57 = v54;
  sub_10F78();
  if (qword_18370 != -1) {
    swift_once();
  }
  id v23 = [(id)qword_18F80 bundleURL];
  sub_10AD8();

  (*(void (**)(char *, void, uint64_t))(v9 + 104))(v11, enum case for LocalizedStringResource.BundleDescription.atURL(_:), v50);
  sub_10B08();
  sub_10AC8();
  uint64_t v24 = v52;
  sub_10AE8();
  uint64_t v25 = v51;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v24, 1, v51) == 1)
  {
    __break(1u);
    JUMPOUT(0xA7BCLL);
  }
  uint64_t v26 = v42;
  (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v42, v24, v25);
  uint64_t v27 = v48;
  sub_AAC0((uint64_t)v53);
  sub_10EB8();
  sub_61FC((uint64_t)v53, &qword_18420);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v26, v25);
  (*(void (**)(char *, uint64_t))(v38 + 8))(v14, v39);
  swift_release();
  swift_release();
  sub_10E78();
  uint64_t v28 = (uint64_t)v47;
  uint64_t v29 = v41;
  (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v47, v17, v41);
  uint64_t v30 = (uint64_t)v45;
  *(unsigned char *)(v28 + *(int *)(v46 + 36)) = 2;
  sub_6198(v28, v30, &qword_183C8);
  *(unsigned char *)(v30 + *(int *)(v40 + 36)) = 2;
  sub_61FC(v28, &qword_183C8);
  (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v29);
  LOBYTE(v28) = *(unsigned char *)(v27 + 8);
  uint64_t v31 = swift_retain();
  uint64_t v32 = sub_ACCC(v31, v28);
  swift_release();
  swift_getKeyPath();
  v53[0] = v32;
  sub_AEB0();
  sub_10B38();
  swift_release();
  uint64_t v33 = *(unsigned __int8 *)(v32 + 16);
  swift_release();
  uint64_t v34 = 0;
  switch(v33)
  {
    case 2:
      swift_bridgeObjectRelease();
      goto LABEL_8;
    case 3:
      break;
    default:
      char v35 = sub_110D8();
      swift_bridgeObjectRelease();
      if (v35)
      {
LABEL_8:
        v53[0] = sub_10E28();
        swift_retain();
        uint64_t v34 = sub_10E88();
      }
      else
      {
        uint64_t v34 = 0;
      }
      break;
  }
  uint64_t v36 = v43;
  sub_6198(v30, v43, &qword_183B8);
  swift_release();
  *(void *)(v36 + *(int *)(v44 + 36)) = v34;
  sub_61FC(v30, &qword_183B8);
  return sub_B650(v36, v49, &qword_183A0);
}

uint64_t sub_A7CC@<X0>(uint64_t a1@<X8>)
{
  sub_10D18();
  if (qword_18370 != -1) {
    swift_once();
  }
  id v2 = (id)qword_18F80;
  uint64_t result = sub_10D88();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5 & 1;
  *(void *)(a1 + 24) = v6;
  return result;
}

id sub_A8B4@<X0>(uint64_t a1@<X8>)
{
  id result = (id)MobileGestalt_get_current_device();
  if (result)
  {
    uint64_t v3 = result;
    int wapiCapability = MobileGestalt_get_wapiCapability();

    if (wapiCapability)
    {
      sub_10D18();
      if (qword_18370 == -1) {
        goto LABEL_6;
      }
    }
    else
    {
      sub_10D18();
      if (qword_18370 == -1)
      {
LABEL_6:
        id v5 = (id)qword_18F80;
        sub_10D88();
        id result = (id)sub_10D38();
        *(_OWORD *)a1 = v6;
        *(_OWORD *)(a1 + 16) = v7;
        *(unsigned char *)(a1 + 32) = v8;
        return result;
      }
    }
    swift_once();
    goto LABEL_6;
  }
  __break(1u);
  return result;
}

uint64_t sub_AAB8@<X0>(uint64_t a1@<X8>)
{
  return sub_9F14(*(void *)(v1 + 16), a1);
}

uint64_t sub_AAC0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_10CE8();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  long long v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_6198(v2, (uint64_t)v14, &qword_18388);
  if (v15 == 1) {
    return sub_B650((uint64_t)v14, a1, &qword_18420);
  }
  os_log_type_t v9 = sub_11028();
  uint64_t v10 = sub_10D68();
  if (os_log_type_enabled(v10, v9))
  {
    uint64_t v11 = swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    *(_DWORD *)uint64_t v11 = 136315138;
    *(void *)(v11 + 4) = sub_B194(0xD00000000000001BLL, 0x80000000000121E0, &v13);
    _os_log_impl(&dword_0, v10, v9, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v11, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  sub_10CD8();
  swift_getAtKeyPath();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_ACCC(uint64_t a1, char a2)
{
  uint64_t v4 = sub_10CE8();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  long long v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  if ((a2 & 1) == 0)
  {
    os_log_type_t v8 = sub_11028();
    os_log_type_t v9 = sub_10D68();
    if (os_log_type_enabled(v9, v8))
    {
      uint64_t v10 = swift_slowAlloc();
      uint64_t v13 = swift_slowAlloc();
      *(_DWORD *)uint64_t v10 = 136315138;
      *(void *)(v10 + 4) = sub_B194(0xD00000000000001ELL, 0x80000000000121A0, &v13);
      _os_log_impl(&dword_0, v9, v8, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v10, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    sub_10CD8();
    swift_getAtKeyPath();
    swift_release();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    return v13;
  }
  return a1;
}

unint64_t sub_AEB0()
{
  unint64_t result = qword_18428;
  if (!qword_18428)
  {
    type metadata accessor for AirDropSettingsListHighlighter();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_18428);
  }
  return result;
}

uint64_t sub_AF08@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_10CE8();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  long long v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_5C9C(&qword_18448);
  __chkstk_darwin();
  os_log_type_t v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_6198(v2, (uint64_t)v9, &qword_18448);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_10D58();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v10 - 8) + 32))(a1, v9, v10);
  }
  else
  {
    os_log_type_t v12 = sub_11028();
    uint64_t v13 = sub_10D68();
    if (os_log_type_enabled(v13, v12))
    {
      uint64_t v14 = swift_slowAlloc();
      uint64_t v16 = swift_slowAlloc();
      *(_DWORD *)uint64_t v14 = 136315138;
      *(void *)(v14 + 4) = sub_B194(0xD000000000000022, 0x8000000000012200, &v16);
      _os_log_impl(&dword_0, v13, v12, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v14, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    sub_10CD8();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

unint64_t sub_B194(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  unint64_t v6 = sub_B268(v12, 0, 0, 1, a1, a2);
  unint64_t v7 = v12[0];
  if (v6)
  {
    unint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_B368((uint64_t)v12, *a3);
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
      sub_B368((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_5A44((uint64_t)v12);
  return v7;
}

unint64_t sub_B268(unint64_t *a1, void *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    unint64_t result = (unint64_t)sub_B3C4(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    unint64_t result = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    unint64_t result = sub_110B8();
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

uint64_t sub_B368(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

char *sub_B3C4(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (char *)sub_B45C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_B560(0, *((void *)v2 + 2) + 1, 1, v2);
  }
  unint64_t v4 = *((void *)v2 + 2);
  unint64_t v3 = *((void *)v2 + 3);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_B560((char *)(v3 > 1), v4 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v4 + 1;
  v2[v4 + 32] = 0;
  return v2;
}

void *sub_B45C(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_B4F8(v2, 0);
      unint64_t result = (void *)sub_110A8();
      if (v5) {
        break;
      }
      if (result == (void *)v2) {
        return v3;
      }
      __break(1u);
LABEL_9:
      uint64_t v2 = sub_10FC8();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_B4F8(uint64_t a1, uint64_t a2)
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
  sub_5C9C(&qword_18610);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_B560(char *result, int64_t a2, char a3, char *a4)
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
    sub_5C9C(&qword_18610);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
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

uint64_t sub_B650(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_5C9C(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

unint64_t sub_B6B8()
{
  unint64_t result = qword_18618;
  if (!qword_18618)
  {
    sub_5F58(&qword_18620);
    sub_B72C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_18618);
  }
  return result;
}

unint64_t sub_B72C()
{
  unint64_t result = qword_18628;
  if (!qword_18628)
  {
    sub_5F58(&qword_18608);
    sub_5EB8();
    sub_92BC();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_18628);
  }
  return result;
}

uint64_t sub_B7B4()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for FindAirDropSettingsClass()
{
  return self;
}

id sub_B7E8()
{
  type metadata accessor for FindAirDropSettingsClass();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id result = [self bundleForClass:ObjCClassFromMetadata];
  qword_18F80 = (uint64_t)result;
  return result;
}

void sub_B840()
{
  NSString v0 = sub_10F98();
  id v1 = [self bundleWithIdentifier:v0];

  if (v1) {
    qword_18F88 = (uint64_t)v1;
  }
  else {
    __break(1u);
  }
}

uint64_t sub_B8B8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v6 = sub_10B18();
  __chkstk_darwin(v6 - 8);
  uint64_t v7 = sub_10AA8();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_10F88();
  __chkstk_darwin(v11 - 8);
  type metadata accessor for AirDropSettingsList();
  sub_10F78();
  if (qword_18370 != -1) {
    swift_once();
  }
  id v12 = [(id)qword_18F80 bundleURL];
  sub_10AD8();

  (*(void (**)(char *, void, uint64_t))(v8 + 104))(v10, enum case for LocalizedStringResource.BundleDescription.atURL(_:), v7);
  sub_10B08();
  sub_10AC8();
  uint64_t v16 = a1;
  type metadata accessor for AirDropSettingsListHighlighter();
  swift_retain();
  sub_10E38();
  uint64_t v13 = v18;
  *a3 = v17;
  a3[1] = v13;
  uint64_t v16 = a2;
  sub_10BE8();
  sub_10E38();
  uint64_t result = swift_release();
  uint64_t v15 = v18;
  a3[2] = v17;
  a3[3] = v15;
  return result;
}

uint64_t type metadata accessor for AirDropSettingsList()
{
  uint64_t result = qword_18720;
  if (!qword_18720) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t *sub_BB90(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v5 = (uint64_t *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
    swift_retain();
  }
  else
  {
    uint64_t v5 = a1;
    uint64_t v6 = (void *)a2[2];
    a1[1] = a2[1];
    a1[2] = (uint64_t)v6;
    a1[3] = a2[3];
    uint64_t v7 = *(int *)(a3 + 24);
    uint64_t v8 = (char *)a1 + v7;
    uint64_t v9 = (char *)a2 + v7;
    uint64_t v10 = sub_10AB8();
    uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
    swift_retain();
    swift_retain();
    id v12 = v6;
    swift_retain();
    v11(v8, v9, v10);
  }
  return v5;
}

uint64_t sub_BCA0(uint64_t a1, uint64_t a2)
{
  swift_release();
  swift_release();

  swift_release();
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  uint64_t v5 = sub_10AB8();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);

  return v6(v4, v5);
}

void *sub_BD30(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v6 = (void *)a2[2];
  uint64_t v5 = a2[3];
  a1[2] = v6;
  a1[3] = v5;
  uint64_t v7 = *(int *)(a3 + 24);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_10AB8();
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
  swift_retain();
  swift_retain();
  id v12 = v6;
  swift_retain();
  v11(v8, v9, v10);
  return a1;
}

void *sub_BDEC(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  uint64_t v6 = (void *)a2[2];
  uint64_t v7 = (void *)a1[2];
  a1[2] = v6;
  id v8 = v6;

  a1[3] = a2[3];
  swift_retain();
  swift_release();
  uint64_t v9 = *(int *)(a3 + 24);
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  uint64_t v12 = sub_10AB8();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 24))(v10, v11, v12);
  return a1;
}

_OWORD *sub_BEC4(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  long long v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = *(int *)(a3 + 24);
  uint64_t v6 = (char *)a1 + v5;
  uint64_t v7 = (char *)a2 + v5;
  uint64_t v8 = sub_10AB8();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 32))(v6, v7, v8);
  return a1;
}

void *sub_BF40(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  swift_release();
  uint64_t v6 = (void *)a1[2];
  a1[2] = a2[2];

  a1[3] = a2[3];
  swift_release();
  uint64_t v7 = *(int *)(a3 + 24);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_10AB8();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t sub_BFFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_C010);
}

uint64_t sub_C010(uint64_t *a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_10AB8();
    uint64_t v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = (char *)a1 + *(int *)(a3 + 24);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_C0C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_C0D4);
}

void *sub_C0D4(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *uint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_10AB8();
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 24);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_C17C()
{
  uint64_t result = sub_10AB8();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_C214()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_C230@<X0>(uint64_t a1@<X8>)
{
  uint64_t v49 = a1;
  uint64_t v2 = sub_5C9C(&qword_18410);
  __chkstk_darwin(v2 - 8);
  uint64_t v55 = (char *)&v40 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_10AF8();
  uint64_t v53 = *(void *)(v4 - 8);
  uint64_t v54 = v4;
  __chkstk_darwin(v4);
  uint64_t v48 = (char *)&v40 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10F58();
  uint64_t v56 = *(void *)(v6 - 8);
  uint64_t v57 = v6;
  __chkstk_darwin(v6);
  char v52 = (char *)&v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v44 = type metadata accessor for AirDropSettingsList();
  uint64_t v8 = *(void *)(v44 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  __chkstk_darwin(v44);
  uint64_t v10 = sub_5C9C(&qword_18760);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v50 = v10;
  uint64_t v51 = v11;
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v40 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_5C9C(&qword_18768);
  uint64_t v46 = *(void *)(v14 - 8);
  uint64_t v47 = v14;
  __chkstk_darwin(v14);
  uint64_t v16 = (char *)&v40 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v45 = sub_5C9C(&qword_18770);
  uint64_t v42 = *(void *)(v45 - 8);
  __chkstk_darwin(v45);
  uint64_t v41 = (char *)&v40 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_E47C((uint64_t)v1, (uint64_t)&v40 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))type metadata accessor for AirDropSettingsList);
  unint64_t v18 = (*(unsigned __int8 *)(v8 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v19 = swift_allocObject();
  sub_E364((uint64_t)&v40 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v19 + v18, (uint64_t (*)(void))type metadata accessor for AirDropSettingsList);
  uint64_t v20 = sub_10EE8();
  uint64_t v21 = v1[1];
  uint64_t v58 = *v1;
  unint64_t v59 = (unint64_t)v21;
  sub_5C9C(&qword_18778);
  sub_10E48();
  uint64_t v22 = v62;
  swift_getKeyPath();
  uint64_t v58 = (uint64_t (*)@<X0>(uint64_t@<X0>, uint64_t@<X8>))v22;
  uint64_t v23 = sub_E20C((unint64_t *)&qword_18428, (void (*)(uint64_t))type metadata accessor for AirDropSettingsListHighlighter);
  sub_10B38();
  swift_release();
  LOBYTE(v18) = *(unsigned char *)(v22 + 16);
  swift_release();
  uint64_t v58 = sub_DB54;
  unint64_t v59 = v19;
  uint64_t v60 = v20;
  LOBYTE(v61) = v18;
  uint64_t v24 = sub_5C9C(&qword_18780);
  unint64_t v25 = sub_DBDC();
  sub_10D98();
  swift_release();
  swift_release();
  uint64_t v26 = v1[1];
  uint64_t v58 = *v1;
  unint64_t v59 = (unint64_t)v26;
  sub_10E48();
  uint64_t v27 = type metadata accessor for AirDropSettingsListHighlighter();
  uint64_t v58 = (uint64_t (*)@<X0>(uint64_t@<X0>, uint64_t@<X8>))v24;
  unint64_t v59 = v25;
  uint64_t v28 = v53;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v43 = v16;
  uint64_t v30 = v52;
  uint64_t v31 = (uint64_t (*)@<X0>(uint64_t@<X0>, uint64_t@<X8>))v50;
  uint64_t v40 = v23;
  sub_10DD8();
  swift_release();
  uint64_t v32 = v13;
  uint64_t v33 = v54;
  (*(void (**)(char *, uint64_t (*)@<X0>(uint64_t@<X0>, uint64_t@<X8>)))(v51 + 8))(v32, v31);
  *uint64_t v30 = 0xD00000000000001ELL;
  v30[1] = 0x80000000000122B0;
  (*(void (**)(void *, void, uint64_t))(v56 + 104))(v30, enum case for SettingsEventImage.graphicIcon(_:), v57);
  sub_D8B4();
  uint64_t v34 = v55;
  sub_10AE8();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v28 + 48))(v34, 1, v33);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    uint64_t v36 = v48;
    (*(void (**)(char *, char *, uint64_t))(v28 + 32))(v48, v34, v33);
    uint64_t v58 = v31;
    unint64_t v59 = v27;
    uint64_t v60 = OpaqueTypeConformance2;
    uint64_t v61 = v40;
    swift_getOpaqueTypeConformance2();
    uint64_t v37 = v41;
    uint64_t v38 = v47;
    uint64_t v39 = v43;
    sub_10DA8();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v28 + 8))(v36, v33);
    (*(void (**)(void *, uint64_t))(v56 + 8))(v30, v57);
    (*(void (**)(char *, uint64_t))(v46 + 8))(v39, v38);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v42 + 32))(v49, v37, v45);
  }
  return result;
}

uint64_t sub_C94C@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v29 = a3;
  uint64_t v5 = type metadata accessor for AirDropSettingsList();
  uint64_t v26 = *(void *)(v5 - 8);
  v25[1] = *(void *)(v26 + 64);
  __chkstk_darwin(v5 - 8);
  v25[0] = (uint64_t)v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_10C88();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  __chkstk_darwin(v7);
  uint64_t v10 = sub_5C9C(&qword_187B8);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v27 = v10;
  uint64_t v28 = v11;
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = a2;
  sub_5C9C(&qword_187C0);
  sub_6104(&qword_187C8, &qword_187C0);
  sub_10D78();
  uint64_t v14 = a2[1];
  uint64_t v31 = *a2;
  uint64_t v32 = v14;
  sub_5C9C(&qword_18778);
  sub_10E48();
  uint64_t v15 = v33;
  swift_getKeyPath();
  uint64_t v31 = v15;
  sub_E20C((unint64_t *)&qword_18428, (void (*)(uint64_t))type metadata accessor for AirDropSettingsListHighlighter);
  sub_10B38();
  swift_release();
  char v16 = *(unsigned char *)(v15 + 16);
  swift_release();
  LOBYTE(v31) = v16;
  uint64_t v17 = a1;
  uint64_t v18 = v7;
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))((char *)v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v17, v7);
  uint64_t v19 = v25[0];
  sub_E47C((uint64_t)a2, v25[0], (uint64_t (*)(void))type metadata accessor for AirDropSettingsList);
  unint64_t v20 = (*(unsigned __int8 *)(v8 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  unint64_t v21 = (v9 + *(unsigned __int8 *)(v26 + 80) + v20) & ~(unint64_t)*(unsigned __int8 *)(v26 + 80);
  uint64_t v22 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v22 + v20, (char *)v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v18);
  sub_E364(v19, v22 + v21, (uint64_t (*)(void))type metadata accessor for AirDropSettingsList);
  sub_5C9C(&qword_187D0);
  sub_6104(&qword_187D8, &qword_187B8);
  sub_DF1C();
  uint64_t v23 = v27;
  sub_10E18();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v28 + 8))(v13, v23);
}

uint64_t sub_CD64@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v49 = a2;
  uint64_t v3 = type metadata accessor for AirDropDiscoveryModeSection();
  uint64_t v4 = (int *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t v7 = (char *)v43 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v52 = (uint64_t)v43 - v8;
  uint64_t v50 = a1;
  uint64_t v9 = *(void *)(a1 + 24);
  *(void *)&long long v54 = *(void *)(a1 + 16);
  uint64_t v10 = v54;
  *((void *)&v54 + 1) = v9;
  v43[1] = sub_5C9C(&qword_18818);
  sub_10E58();
  long long v11 = v69;
  uint64_t v12 = v70;
  swift_getKeyPath();
  long long v54 = v11;
  *(void *)&long long v55 = v12;
  uint64_t v51 = sub_5C9C(&qword_18820);
  sub_10E98();

  swift_release();
  swift_release();
  swift_release();
  long long v48 = v69;
  uint64_t v13 = v70;
  *(void *)&long long v54 = v10;
  *((void *)&v54 + 1) = v9;
  sub_10E48();
  uint64_t v14 = v58;
  char v15 = sub_10BD8();

  type metadata accessor for AirDropSettingsListHighlighter();
  uint64_t v46 = sub_E20C((unint64_t *)&qword_18428, (void (*)(uint64_t))type metadata accessor for AirDropSettingsListHighlighter);
  *(void *)uint64_t v7 = sub_10C08();
  v7[8] = v16 & 1;
  uint64_t v17 = (uint64_t *)&v7[v4[7]];
  *uint64_t v17 = swift_getKeyPath();
  sub_5C9C(&qword_18448);
  swift_storeEnumTagMultiPayload();
  uint64_t v18 = &v7[v4[8]];
  *(void *)uint64_t v18 = swift_getKeyPath();
  v18[40] = 0;
  uint64_t v19 = &v7[v4[9]];
  *(_OWORD *)uint64_t v19 = v48;
  *((void *)v19 + 2) = v13;
  v7[v4[10]] = v15 & 1;
  uint64_t v47 = v7;
  *(void *)&long long v48 = type metadata accessor for AirDropDiscoveryModeSection;
  sub_E364((uint64_t)v7, v52, (uint64_t (*)(void))type metadata accessor for AirDropDiscoveryModeSection);
  uint64_t v20 = *(void *)(v50 + 24);
  *(void *)&long long v54 = *(void *)(v50 + 16);
  uint64_t v21 = v54;
  *((void *)&v54 + 1) = v20;
  sub_10E58();
  long long v22 = v69;
  uint64_t v23 = v70;
  swift_getKeyPath();
  long long v69 = v22;
  uint64_t v70 = v23;
  sub_10E98();

  swift_release();
  swift_release();
  swift_release();
  uint64_t v44 = *((void *)&v54 + 1);
  uint64_t v45 = v54;
  LOBYTE(v23) = v55;
  *(void *)&long long v69 = v21;
  *((void *)&v69 + 1) = v20;
  sub_10E48();
  uint64_t v24 = v58;
  char v25 = sub_10BC8();

  uint64_t v26 = sub_10C08();
  LOBYTE(v56[0]) = v27 & 1;
  uint64_t KeyPath = swift_getKeyPath();
  long long v71 = v54;
  char v68 = 0;
  *(void *)&long long v69 = v26;
  BYTE8(v69) = v56[0];
  *(_DWORD *)((char *)&v69 + 9) = v58;
  HIDWORD(v69) = *(_DWORD *)((char *)&v58 + 3);
  uint64_t v70 = (void *)KeyPath;
  long long v72 = v55;
  char v73 = 0;
  *(_DWORD *)&v74[3] = *(_DWORD *)&v53[3];
  *(_DWORD *)uint64_t v74 = *(_DWORD *)v53;
  uint64_t v75 = v45;
  uint64_t v76 = v44;
  char v77 = (char)v23;
  char v78 = v25 & 1;
  uint64_t v29 = *(void *)(v50 + 24);
  uint64_t v58 = *(void **)(v50 + 16);
  uint64_t v59 = v29;
  sub_10E58();
  long long v30 = v54;
  uint64_t v31 = (void *)v55;
  swift_getKeyPath();
  long long v54 = v30;
  *(void *)&long long v55 = v31;
  sub_10E98();

  swift_release();
  swift_release();
  swift_release();
  uint64_t v32 = v58;
  uint64_t v33 = v59;
  LOBYTE(v21) = v60;
  uint64_t v34 = sub_10C08();
  char v68 = v35 & 1;
  uint64_t v36 = swift_getKeyPath();
  long long v61 = v54;
  char v57 = 0;
  uint64_t v58 = (void *)v34;
  LOBYTE(v59) = v68;
  *(_DWORD *)((char *)&v59 + 1) = *(_DWORD *)v53;
  HIDWORD(v59) = *(_DWORD *)&v53[3];
  uint64_t v60 = v36;
  long long v62 = v55;
  char v63 = 0;
  *(_DWORD *)&v64[3] = *(_DWORD *)((char *)v56 + 3);
  *(_DWORD *)uint64_t v64 = v56[0];
  uint64_t v65 = v32;
  uint64_t v66 = v33;
  char v67 = v21;
  uint64_t v37 = v52;
  uint64_t v39 = (uint64_t)v47;
  uint64_t v38 = (uint64_t (*)(void))v48;
  sub_E47C(v52, (uint64_t)v47, (uint64_t (*)(void))v48);
  sub_E4E4((uint64_t)&v69, (uint64_t)&v54);
  sub_E540((uint64_t)&v58, (uint64_t)v53);
  uint64_t v40 = v49;
  sub_E47C(v39, v49, v38);
  uint64_t v41 = sub_5C9C(&qword_18828);
  sub_E4E4((uint64_t)&v54, v40 + *(int *)(v41 + 48));
  sub_E540((uint64_t)v53, v40 + *(int *)(v41 + 64));
  sub_E59C((uint64_t)&v58);
  sub_E5F0((uint64_t)&v69);
  sub_E644(v37);
  sub_E59C((uint64_t)v53);
  sub_E5F0((uint64_t)&v54);
  return sub_E644(v39);
}

uint64_t sub_D290(uint64_t a1, unsigned char *a2, void (*a3)(char *, uint64_t), uint64_t a4)
{
  uint64_t v36 = a4;
  uint64_t v6 = sub_10EF8();
  uint64_t v39 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_10F18();
  uint64_t v37 = *(void *)(v9 - 8);
  uint64_t v38 = v9;
  __chkstk_darwin(v9);
  long long v11 = (char *)&v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for AirDropSettingsList();
  uint64_t v35 = *(void *)(v12 - 8);
  uint64_t v13 = *(void *)(v35 + 64);
  __chkstk_darwin(v12 - 8);
  uint64_t v14 = sub_10F38();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = __chkstk_darwin(v14);
  uint64_t v18 = (char *)&v31 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = __chkstk_darwin(v16);
  uint64_t v21 = (char *)&v31 - v20;
  if (*a2 != 3)
  {
    uint64_t v34 = v6;
    uint64_t v22 = __chkstk_darwin(result);
    *(&v31 - 2) = a3;
    *((unsigned char *)&v31 - 8) = v23;
    uint64_t v32 = v22;
    uint64_t v33 = v8;
    uint64_t v24 = v22;
    sub_10EE8();
    sub_10C68();
    swift_release();
    sub_E044();
    char v25 = (void *)sub_11048();
    sub_10F28();
    sub_10F48();
    uint64_t v31 = *(void (**)(char *, uint64_t))(v15 + 8);
    v31(v18, v24);
    sub_E47C(v36, (uint64_t)&v31 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))type metadata accessor for AirDropSettingsList);
    unint64_t v26 = (*(unsigned __int8 *)(v35 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v35 + 80);
    uint64_t v27 = swift_allocObject();
    sub_E364((uint64_t)&v31 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), v27 + v26, (uint64_t (*)(void))type metadata accessor for AirDropSettingsList);
    aBlock[4] = sub_E194;
    aBlock[5] = v27;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_D870;
    aBlock[3] = &unk_14CF0;
    uint64_t v28 = _Block_copy(aBlock);
    swift_release();
    sub_10F08();
    aBlock[0] = &_swiftEmptyArrayStorage;
    sub_E20C(&qword_187F8, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
    sub_5C9C(&qword_18800);
    sub_6104(&qword_18808, &qword_18800);
    uint64_t v29 = v33;
    uint64_t v30 = v34;
    sub_11068();
    sub_11038();
    _Block_release(v28);

    (*(void (**)(char *, uint64_t))(v39 + 8))(v29, v30);
    (*(void (**)(char *, uint64_t))(v37 + 8))(v11, v38);
    return ((uint64_t (*)(char *, uint64_t))v31)(v21, v32);
  }
  return result;
}

uint64_t sub_D778()
{
  return swift_release();
}

uint64_t sub_D870(uint64_t a1)
{
  unint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_D8B4()
{
  uint64_t v0 = sub_10B18();
  __chkstk_darwin(v0 - 8);
  uint64_t v1 = sub_10AA8();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_10F88();
  __chkstk_darwin(v5 - 8);
  sub_5C9C(&qword_187B0);
  sub_10AB8();
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_119B0;
  sub_10F78();
  if (qword_18370 != -1) {
    swift_once();
  }
  id v7 = [(id)qword_18F80 bundleURL];
  sub_10AD8();

  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, enum case for LocalizedStringResource.BundleDescription.atURL(_:), v1);
  sub_10B08();
  sub_10AC8();
  return v6;
}

uint64_t sub_DB54@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(type metadata accessor for AirDropSettingsList() - 8);
  uint64_t v6 = (void *)(v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80)));

  return sub_C94C(a1, v6, a2);
}

unint64_t sub_DBDC()
{
  unint64_t result = qword_18788;
  if (!qword_18788)
  {
    sub_5F58(&qword_18780);
    sub_6104(&qword_18790, &qword_18798);
    sub_6104(&qword_187A0, &qword_187A8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_18788);
  }
  return result;
}

uint64_t sub_DCA0@<X0>(uint64_t a1@<X8>)
{
  return sub_CD64(*(void *)(v1 + 16), a1);
}

uint64_t sub_DCA8()
{
  uint64_t v1 = sub_10C88();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = *(void *)(v2 + 64);
  uint64_t v6 = (int *)(type metadata accessor for AirDropSettingsList() - 8);
  uint64_t v7 = *(unsigned __int8 *)(*(void *)v6 + 80);
  uint64_t v8 = (v4 + v5 + v7) & ~v7;
  uint64_t v9 = v8 + *(void *)(*(void *)v6 + 64);
  uint64_t v10 = v3 | v7 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();
  swift_release();

  swift_release();
  uint64_t v11 = v0 + v8 + v6[8];
  uint64_t v12 = sub_10AB8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8))(v11, v12);

  return _swift_deallocObject(v0, v9, v10);
}

uint64_t sub_DE38(uint64_t a1, unsigned char *a2)
{
  uint64_t v5 = *(void *)(sub_10C88() - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v7 = *(void *)(v5 + 64);
  uint64_t v8 = *(void *)(type metadata accessor for AirDropSettingsList() - 8);
  uint64_t v9 = v2 + ((v6 + v7 + *(unsigned __int8 *)(v8 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));

  return sub_D290(a1, a2, (void (*)(char *, uint64_t))(v2 + v6), v9);
}

unint64_t sub_DF1C()
{
  unint64_t result = qword_187E0;
  if (!qword_187E0)
  {
    sub_5F58(&qword_187D0);
    sub_DF90();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_187E0);
  }
  return result;
}

unint64_t sub_DF90()
{
  unint64_t result = qword_187E8;
  if (!qword_187E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_187E8);
  }
  return result;
}

uint64_t sub_DFE4()
{
  return sub_10C78();
}

unint64_t sub_E044()
{
  unint64_t result = qword_187F0;
  if (!qword_187F0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_187F0);
  }
  return result;
}

uint64_t sub_E088()
{
  uint64_t v1 = (int *)(type metadata accessor for AirDropSettingsList() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v3 + *(void *)(*(void *)v1 + 64);
  uint64_t v5 = v2 | 7;
  uint64_t v6 = v0 + v3;
  swift_release();
  swift_release();

  swift_release();
  uint64_t v7 = v6 + v1[8];
  uint64_t v8 = sub_10AB8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);

  return _swift_deallocObject(v0, v4, v5);
}

uint64_t sub_E194()
{
  type metadata accessor for AirDropSettingsList();

  return sub_D778();
}

uint64_t sub_E1F4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_E204()
{
  return swift_release();
}

uint64_t sub_E20C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_E254()
{
  return sub_EC0C(*(void *)(v0 + 16), *(unsigned char *)(v0 + 24));
}

unint64_t sub_E274()
{
  unint64_t result = qword_18810;
  if (!qword_18810)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_18810);
  }
  return result;
}

uint64_t sub_E2C8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10B68();
  *a1 = result;
  return result;
}

uint64_t sub_E2F4()
{
  return sub_10B78();
}

uint64_t sub_E31C()
{
  return sub_10C98();
}

uint64_t sub_E340()
{
  return sub_10CC8();
}

uint64_t sub_E364(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_E3CC@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_10BA8();
  *a1 = result & 1;
  return result;
}

uint64_t sub_E3FC()
{
  return sub_10BB8();
}

uint64_t sub_E424@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_10B88();
  *a1 = result & 1;
  return result;
}

uint64_t sub_E454()
{
  return sub_10B98();
}

uint64_t sub_E47C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_E4E4(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_E540(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_E59C(uint64_t a1)
{
  return a1;
}

uint64_t sub_E5F0(uint64_t a1)
{
  return a1;
}

uint64_t sub_E644(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for AirDropDiscoveryModeSection();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_E6A0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_E7B4()
{
  swift_getKeyPath();
  sub_AEB0();
  sub_10B38();
  swift_release();
  return *(unsigned __int8 *)(v0 + 16);
}

uint64_t sub_E824(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_E830(*a1, *a2);
}

uint64_t sub_E830(unsigned __int8 a1, unsigned __int8 a2)
{
  unint64_t v2 = 0xD000000000000010;
  unint64_t v3 = 0x8000000000011CD0;
  int v4 = a1;
  if (a1)
  {
    if (a1 == 1) {
      unint64_t v5 = 0x5F504F5244524941;
    }
    else {
      unint64_t v5 = 0xD000000000000019;
    }
    if (v4 == 1) {
      unint64_t v6 = 0xEE0044495F43464ELL;
    }
    else {
      unint64_t v6 = 0x8000000000011CF0;
    }
    int v7 = a2;
    if (!a2) {
      goto LABEL_15;
    }
    goto LABEL_9;
  }
  unint64_t v5 = 0xD000000000000010;
  unint64_t v6 = 0x8000000000011CD0;
  int v7 = a2;
  if (a2)
  {
LABEL_9:
    if (v7 == 1) {
      unint64_t v2 = 0x5F504F5244524941;
    }
    else {
      unint64_t v2 = 0xD000000000000019;
    }
    if (v7 == 1) {
      unint64_t v3 = 0xEE0044495F43464ELL;
    }
    else {
      unint64_t v3 = 0x8000000000011CF0;
    }
  }
LABEL_15:
  if (v5 == v2 && v6 == v3) {
    char v8 = 1;
  }
  else {
    char v8 = sub_110D8();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_E950@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_EF60(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

void sub_E980(unint64_t *a1@<X8>)
{
  unint64_t v2 = 0xD000000000000010;
  unint64_t v3 = 0xEE0044495F43464ELL;
  unint64_t v4 = 0x5F504F5244524941;
  if (*v1 != 1)
  {
    unint64_t v4 = 0xD000000000000019;
    unint64_t v3 = 0x8000000000011CF0;
  }
  if (*v1)
  {
    unint64_t v2 = v4;
    unint64_t v5 = v3;
  }
  else
  {
    unint64_t v5 = 0x8000000000011CD0;
  }
  *a1 = v2;
  a1[1] = v5;
}

Swift::Int sub_E9F0()
{
  return sub_E9F8();
}

Swift::Int sub_E9F8()
{
  return sub_11108();
}

uint64_t sub_EAB0()
{
  sub_10FB8();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_EB50()
{
  return sub_EB58();
}

Swift::Int sub_EB58()
{
  return sub_11108();
}

uint64_t sub_EC0C(uint64_t result, char a2)
{
  *(unsigned char *)(result + 16) = a2;
  return result;
}

uint64_t sub_EC14()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC15AirDropSettings30AirDropSettingsListHighlighter___observationRegistrar;
  uint64_t v2 = sub_10B58();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v3, v4);
}

uint64_t sub_ECB4()
{
  return type metadata accessor for AirDropSettingsListHighlighter();
}

uint64_t type metadata accessor for AirDropSettingsListHighlighter()
{
  uint64_t result = qword_18860;
  if (!qword_18860) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_ED08()
{
  uint64_t result = sub_10B58();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

unsigned char *initializeBufferWithCopyOfBuffer for HighlightableItem(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for HighlightableItem(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for HighlightableItem(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0xEF10);
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

uint64_t sub_EF38(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_EF44(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for HighlightableItem()
{
  return &type metadata for HighlightableItem;
}

uint64_t sub_EF60(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_14AB8;
  v6._object = a2;
  unint64_t v4 = sub_110C8(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 3) {
    return 3;
  }
  else {
    return v4;
  }
}

uint64_t sub_EFB4@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_AEB0();
  sub_10B38();
  uint64_t result = swift_release();
  *a2 = *(unsigned char *)(v3 + 16);
  return result;
}

uint64_t sub_F02C()
{
  return swift_release();
}

uint64_t sub_F0CC()
{
  uint64_t v1 = OBJC_IVAR____TtC15AirDropSettings19AirDropSettingsRoot____lazy_storage___airDropSettingsListHighlighter;
  if (*(void *)(v0
                 + OBJC_IVAR____TtC15AirDropSettings19AirDropSettingsRoot____lazy_storage___airDropSettingsListHighlighter))
  {
    uint64_t v2 = *(void *)(v0
                   + OBJC_IVAR____TtC15AirDropSettings19AirDropSettingsRoot____lazy_storage___airDropSettingsListHighlighter);
  }
  else
  {
    type metadata accessor for AirDropSettingsListHighlighter();
    uint64_t v2 = swift_allocObject();
    *(unsigned char *)(v2 + 16) = 3;
    sub_10B48();
    *(void *)(v0 + v1) = v2;
    swift_retain();
    swift_release();
  }
  swift_retain();
  return v2;
}

id sub_F158()
{
  uint64_t v1 = OBJC_IVAR____TtC15AirDropSettings19AirDropSettingsRoot____lazy_storage___airDropSettingsState;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC15AirDropSettings19AirDropSettingsRoot____lazy_storage___airDropSettingsState);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR____TtC15AirDropSettings19AirDropSettingsRoot____lazy_storage___airDropSettingsState);
  }
  else
  {
    id v4 = [objc_allocWithZone((Class)sub_10BE8()) init];
    uint64_t v5 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v3 = v4;

    uint64_t v2 = 0;
  }
  id v6 = v2;
  return v3;
}

void sub_F1CC()
{
  uint64_t v1 = v0;
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v3 = type metadata accessor for AirDropSettingsList();
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (id *)((char *)&v23.receiver - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v23.receiver = v1;
  v23.super_class = ObjectType;
  objc_msgSendSuper2(&v23, "viewDidLoad");
  uint64_t v6 = sub_F0CC();
  id v7 = sub_F158();
  sub_B8B8(v6, (uint64_t)v7, v5);
  id v8 = objc_allocWithZone((Class)sub_5C9C(&qword_18988));
  uint64_t v9 = (void *)sub_10D28();
  if (qword_18370 != -1) {
    swift_once();
  }
  v10.super.isa = (Class)qword_18F80;
  v22._countAndFlagsBits = 0x8000000000011F10;
  v24._countAndFlagsBits = 0x706F7244726941;
  v24._object = (void *)0xE700000000000000;
  v25.value._countAndFlagsBits = 0;
  v25.value._object = 0;
  v26._countAndFlagsBits = 0;
  v26._object = (void *)0xE000000000000000;
  sub_10A98(v24, v25, v10, v26, v22);
  NSString v11 = sub_10F98();
  swift_bridgeObjectRelease();
  [v1 setTitle:v11];

  id v12 = [v9 view];
  if (!v12)
  {
    uint64_t v13 = v9;
    goto LABEL_8;
  }
  uint64_t v13 = v12;
  id v14 = [v1 view];
  if (v14)
  {
    uint64_t v15 = v14;
    [v14 addSubview:v13];

    id v16 = [v1 view];
    if (v16)
    {
      uint64_t v17 = v16;
      [v16 bounds];
      double v19 = v18;
      double v21 = v20;

      objc_msgSend(v13, "setFrame:", 0.0, 0.0, v19, v21);
      [v13 setAutoresizingMask:18];
      [v1 addChildViewController:v9];
      [v9 didMoveToParentViewController:v1];

LABEL_8:
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

uint64_t sub_F49C(uint64_t a1)
{
  v2[13] = a1;
  v2[14] = v1;
  sub_10FF8();
  v2[15] = sub_10FE8();
  uint64_t v4 = sub_10FD8();
  return _swift_task_switch(sub_F534, v4, v3);
}

uint64_t sub_F534()
{
  uint64_t v1 = (_OWORD *)(v0 + 56);
  uint64_t v2 = *(void *)(v0 + 104);
  swift_release();
  if (!v2)
  {
    *uint64_t v1 = 0u;
    *(_OWORD *)(v0 + 72) = 0u;
LABEL_12:
    sub_61FC(v0 + 56, &qword_18978);
    goto LABEL_13;
  }
  *(void *)(v0 + 88) = 1752457584;
  uint64_t v3 = *(void *)(v0 + 104);
  *(void *)(v0 + 96) = 0xE400000000000000;
  sub_11098();
  if (*(void *)(v3 + 16) && (unint64_t v4 = sub_10844(v0 + 16), (v5 & 1) != 0))
  {
    sub_B368(*(void *)(v3 + 56) + 32 * v4, v0 + 56);
  }
  else
  {
    *uint64_t v1 = 0u;
    *(_OWORD *)(v0 + 72) = 0u;
  }
  sub_10950(v0 + 16);
  if (!*(void *)(v0 + 80)) {
    goto LABEL_12;
  }
  if (swift_dynamicCast())
  {
    *(void *)(v0 + 56) = 35;
    *(void *)(v0 + 64) = 0xE100000000000000;
    sub_109A4();
    uint64_t v6 = sub_11058();
    swift_bridgeObjectRelease();
    uint64_t v7 = *(void *)(v6 + 16);
    if (v7)
    {
      uint64_t v8 = v6 + 16 * v7;
      uint64_t v9 = *(void *)(v8 + 16);
      NSBundle v10 = *(void **)(v8 + 24);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      v11._rawValue = &off_14AB8;
      v18._countAndFlagsBits = v9;
      v18._object = v10;
      unint64_t v12 = sub_110C8(v11, v18);
      swift_bridgeObjectRelease();
      if (v12 < 3)
      {
        uint64_t v13 = *(void *)(v0 + 112);
        uint64_t v14 = swift_task_alloc();
        *(void *)(v14 + 16) = v13;
        *(unsigned char *)(v14 + 24) = v12;
        sub_10EE8();
        sub_10C68();
        swift_release();
        swift_task_dealloc();
      }
    }
    else
    {
      swift_bridgeObjectRelease();
    }
  }
LABEL_13:
  uint64_t v15 = *(uint64_t (**)(void))(v0 + 8);
  return v15();
}

uint64_t sub_F75C()
{
  return swift_release();
}

uint64_t sub_F99C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  sub_10FF8();
  v3[5] = sub_10FE8();
  uint64_t v5 = sub_10FD8();
  return _swift_task_switch(sub_FA38, v5, v4);
}

uint64_t sub_FA38()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(const void **)(v0 + 24);
  swift_release();
  *(void *)(v0 + 48) = _Block_copy(v2);
  if (v1) {
    uint64_t v3 = sub_10F68();
  }
  else {
    uint64_t v3 = 0;
  }
  *(void *)(v0 + 56) = v3;
  id v4 = *(id *)(v0 + 32);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v0 + 64) = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_FB30;
  return sub_F49C(v3);
}

uint64_t sub_FB30()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 48);
  uint64_t v3 = *(void **)(*v0 + 32);
  uint64_t v4 = *v0;
  swift_task_dealloc();

  swift_bridgeObjectRelease();
  if (v2)
  {
    uint64_t v5 = *(void (***)(void))(v1 + 48);
    v5[2](v5);
    _Block_release(v5);
  }
  uint64_t v6 = *(uint64_t (**)(void))(v4 + 8);
  return v6();
}

id sub_FDD0()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for AirDropSettingsRoot()
{
  return self;
}

uint64_t sub_FE78()
{
  _Block_release(*(const void **)(v0 + 24));

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_FEC0()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_FF74;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_18930 + dword_18930);
  return v6(v2, v3, v4);
}

uint64_t sub_FF74()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_10068(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  *uint64_t v4 = v3;
  v4[1] = sub_10A94;
  return v6();
}

uint64_t sub_10138()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = (int *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_10A94;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_18940 + dword_18940);
  return v6(v2, v3, v4);
}

uint64_t sub_101F8(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  *uint64_t v5 = v4;
  v5[1] = sub_10A94;
  return v7();
}

uint64_t sub_102C8()
{
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10308(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (int *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_10A94;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_18950 + dword_18950);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_103D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_11018();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_11008();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_61FC(a1, &qword_18928);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_10FD8();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_10580(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_1065C;
  return v6(a1);
}

uint64_t sub_1065C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_10754()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1078C(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_FF74;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_18960 + dword_18960);
  return v6(a1, v4);
}

unint64_t sub_10844(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = sub_11078(*(void *)(v2 + 40));

  return sub_10888(a1, v4);
}

unint64_t sub_10888(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_10A20(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = sub_11088();
      sub_10950((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_10950(uint64_t a1)
{
  return a1;
}

unint64_t sub_109A4()
{
  unint64_t result = qword_18980;
  if (!qword_18980)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_18980);
  }
  return result;
}

uint64_t sub_109F8()
{
  return sub_F75C();
}

uint64_t sub_10A20(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_10A7C()
{
  return sub_E254();
}

uint64_t sub_10A98(Swift::String _, Swift::String_optional tableName, NSBundle bundle, Swift::String value, Swift::String comment)
{
  return NSLocalizedString(_:tableName:bundle:value:comment:)(_, tableName, bundle, value, comment)._countAndFlagsBits;
}

uint64_t sub_10AA8()
{
  return type metadata accessor for LocalizedStringResource.BundleDescription();
}

uint64_t sub_10AB8()
{
  return type metadata accessor for LocalizedStringResource();
}

uint64_t sub_10AC8()
{
  return LocalizedStringResource.init(_:table:locale:bundle:comment:)();
}

uint64_t sub_10AD8()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10AE8()
{
  return URL.init(string:)();
}

uint64_t sub_10AF8()
{
  return type metadata accessor for URL();
}

uint64_t sub_10B08()
{
  return static Locale.current.getter();
}

uint64_t sub_10B18()
{
  return type metadata accessor for Locale();
}

uint64_t sub_10B28()
{
  return ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
}

uint64_t sub_10B38()
{
  return ObservationRegistrar.access<A, B>(_:keyPath:)();
}

uint64_t sub_10B48()
{
  return ObservationRegistrar.init()();
}

uint64_t sub_10B58()
{
  return type metadata accessor for ObservationRegistrar();
}

uint64_t sub_10B68()
{
  return AirDropSettingsState.discoverableMode.getter();
}

uint64_t sub_10B78()
{
  return AirDropSettingsState.discoverableMode.setter();
}

uint64_t sub_10B88()
{
  return AirDropSettingsState.isCellularUsageEnabled.getter();
}

uint64_t sub_10B98()
{
  return AirDropSettingsState.isCellularUsageEnabled.setter();
}

uint64_t sub_10BA8()
{
  return AirDropSettingsState.isNearbySharingEnabled.getter();
}

uint64_t sub_10BB8()
{
  return AirDropSettingsState.isNearbySharingEnabled.setter();
}

uint64_t sub_10BC8()
{
  return AirDropSettingsState.isNearbySharingSupported.getter();
}

uint64_t sub_10BD8()
{
  return AirDropSettingsState.isTimeLimitedEveryoneMode.getter();
}

uint64_t sub_10BE8()
{
  return type metadata accessor for AirDropSettingsState();
}

uint64_t sub_10BF8()
{
  return type metadata accessor for Environment.Content();
}

uint64_t sub_10C08()
{
  return Environment.init<A>(_:)();
}

uint64_t sub_10C18()
{
  return PickerOption.init(value:content:)();
}

uint64_t sub_10C28()
{
  return static OpenURLAction.Result.handled.getter();
}

uint64_t sub_10C38()
{
  return OpenURLAction.init(handler:)();
}

uint64_t sub_10C48()
{
  return type metadata accessor for OpenURLAction();
}

uint64_t sub_10C58()
{
  return dispatch thunk of PickerContent._identifiedView.getter();
}

uint64_t sub_10C68()
{
  return withAnimation<A>(_:_:)();
}

uint64_t sub_10C78()
{
  return ScrollViewProxy.scrollTo<A>(_:anchor:)();
}

uint64_t sub_10C88()
{
  return type metadata accessor for ScrollViewProxy();
}

uint64_t sub_10C98()
{
  return EnvironmentValues.withCurrentHostingController.getter();
}

uint64_t sub_10CA8()
{
  return EnvironmentValues.openURL.getter();
}

uint64_t sub_10CB8()
{
  return EnvironmentValues.openURL.setter();
}

uint64_t sub_10CC8()
{
  return EnvironmentValues.settingsUndoProxy.getter();
}

uint64_t sub_10CD8()
{
  return EnvironmentValues.init()();
}

uint64_t sub_10CE8()
{
  return type metadata accessor for EnvironmentValues();
}

uint64_t sub_10CF8()
{
  return InlinePickerStyle.init()();
}

uint64_t sub_10D08()
{
  return type metadata accessor for InlinePickerStyle();
}

uint64_t sub_10D18()
{
  return LocalizedStringKey.init(stringLiteral:)();
}

uint64_t sub_10D28()
{
  return UIHostingController.init(rootView:)();
}

uint64_t sub_10D38()
{
  return _ConditionalContent<>.init(storage:)();
}

uint64_t sub_10D48()
{
  return WithCurrentHostingControllerAction.callAsFunction(_:)();
}

uint64_t sub_10D58()
{
  return type metadata accessor for WithCurrentHostingControllerAction();
}

uint64_t sub_10D68()
{
  return static Log.runtimeIssuesLog.getter();
}

uint64_t sub_10D78()
{
  return List<>.init(content:)();
}

uint64_t sub_10D88()
{
  return Text.init(_:tableName:bundle:comment:)();
}

uint64_t sub_10D98()
{
  return View.settingsListAppearance()();
}

uint64_t sub_10DA8()
{
  return View.emitNavigationEventOnAppearForSystemSetting(icon:title:localizedNavigationComponents:deepLink:)();
}

uint64_t sub_10DB8()
{
  return static View._makeView(view:inputs:)();
}

uint64_t sub_10DC8()
{
  return static View._makeViewList(view:inputs:)();
}

uint64_t sub_10DD8()
{
  return View.environment<A>(_:)();
}

uint64_t sub_10DE8()
{
  return View.pickerStyle<A>(_:)();
}

uint64_t sub_10DF8()
{
  return View.labelsHidden()();
}

uint64_t sub_10E08()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_10E18()
{
  return View.onChange<A>(of:initial:_:)();
}

uint64_t sub_10E28()
{
  return static Color.emphasizedGroupBackground.getter();
}

uint64_t sub_10E38()
{
  return State.init(wrappedValue:)();
}

uint64_t sub_10E48()
{
  return State.wrappedValue.getter();
}

uint64_t sub_10E58()
{
  return State.projectedValue.getter();
}

uint64_t sub_10E68()
{
  return Picker<>.init<A>(_:selection:content:)();
}

uint64_t sub_10E78()
{
  return Toggle.init(isOn:label:)();
}

uint64_t sub_10E88()
{
  return AnyView.init<A>(_:)();
}

uint64_t sub_10E98()
{
  return Binding.subscript.getter();
}

uint64_t sub_10EA8()
{
  return Binding.projectedValue.getter();
}

uint64_t sub_10EB8()
{
  return Binding.settingsUndoableBinding(actionName:deepLink:settingsUndoProxy:)();
}

uint64_t sub_10EC8()
{
  return Section<>.init(header:footer:content:)();
}

uint64_t sub_10ED8()
{
  return Section<>.init(footer:content:)();
}

uint64_t sub_10EE8()
{
  return static Animation.default.getter();
}

uint64_t sub_10EF8()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t sub_10F08()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t sub_10F18()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t sub_10F28()
{
  return static DispatchTime.now()();
}

uint64_t sub_10F38()
{
  return type metadata accessor for DispatchTime();
}

uint64_t sub_10F48()
{
  return + infix(_:_:)();
}

uint64_t sub_10F58()
{
  return type metadata accessor for SettingsEventImage();
}

uint64_t sub_10F68()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10F78()
{
  return String.LocalizationValue.init(stringLiteral:)();
}

uint64_t sub_10F88()
{
  return type metadata accessor for String.LocalizationValue();
}

NSString sub_10F98()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_10FA8()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10FB8()
{
  return String.hash(into:)();
}

Swift::Int sub_10FC8()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_10FD8()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_10FE8()
{
  return static MainActor.shared.getter();
}

uint64_t sub_10FF8()
{
  return type metadata accessor for MainActor();
}

uint64_t sub_11008()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_11018()
{
  return type metadata accessor for TaskPriority();
}

uint64_t sub_11028()
{
  return static os_log_type_t.fault.getter();
}

uint64_t sub_11038()
{
  return OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)();
}

uint64_t sub_11048()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t sub_11058()
{
  return StringProtocol.components<A>(separatedBy:)();
}

uint64_t sub_11068()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

Swift::Int sub_11078(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t sub_11088()
{
  return static AnyHashable.== infix(_:_:)();
}

uint64_t sub_11098()
{
  return AnyHashable.init<A>(_:)();
}

uint64_t sub_110A8()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_110B8()
{
  return _StringObject.sharedUTF8.getter();
}

Swift::Int sub_110C8(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_110D8()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_110E8()
{
  return Hasher.init(_seed:)();
}

void sub_110F8(Swift::UInt a1)
{
}

Swift::Int sub_11108()
{
  return Hasher._finalize()();
}

uint64_t MobileGestalt_get_current_device()
{
  return _MobileGestalt_get_current_device();
}

uint64_t MobileGestalt_get_hasBaseband()
{
  return _MobileGestalt_get_hasBaseband();
}

uint64_t MobileGestalt_get_wapiCapability()
{
  return _MobileGestalt_get_wapiCapability();
}

uint64_t PSIsInEDUMode()
{
  return _PSIsInEDUMode();
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

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
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

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}