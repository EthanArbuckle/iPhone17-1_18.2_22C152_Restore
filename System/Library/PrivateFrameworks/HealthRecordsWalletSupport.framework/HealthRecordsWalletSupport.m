unint64_t static SignedClinicalDataWalletPassIdentifier.passTypeIdentifierVHR.getter()
{
  return 0xD00000000000003CLL;
}

uint64_t SignedClinicalDataWalletPassIdentifier.passTypeIdentifier.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t SignedClinicalDataWalletPassIdentifier.serialNumber.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t SignedClinicalDataWalletPassIdentifier.init(signedClinicalDataRecordSyncIdentifier:)@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  sub_235F6BF20();
  sub_235F6C020();
  swift_bridgeObjectRelease();
  uint64_t v4 = sub_235F6BF40();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  *a2 = 0xD00000000000003CLL;
  a2[1] = 0x8000000235F6D330;
  a2[2] = 762472566;
  a2[3] = 0xE400000000000000;
  return result;
}

void SignedClinicalDataWalletPassIdentifier.init(signedClinicalDataRecord:)(void *a1@<X0>, void *a2@<X8>)
{
  v24 = a2;
  sub_235F57D08();
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_235F6BF40();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v7);
  v12 = (char *)&v23 - v11;
  MEMORY[0x270FA5388](v10);
  v14 = (char *)&v23 - v13;
  id v27 = a1;
  id v15 = objc_msgSend(a1, sel_originIdentifier);
  id v16 = objc_msgSend(v15, sel_signedClinicalDataRecordIdentifier);

  if (v16)
  {
    sub_235F6BF30();

    v17 = *(void (**)(char *, char *, uint64_t))(v6 + 32);
    v17(v4, v12, v5);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v6 + 56))(v4, 0, 1, v5);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) != 1)
    {
      v17(v14, v4, v5);
      (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v9, v14, v5);
      sub_235F6BF20();
      uint64_t v25 = 762472566;
      unint64_t v26 = 0xE400000000000000;
      sub_235F6C020();
      swift_bridgeObjectRelease();
      uint64_t v18 = v25;
      unint64_t v19 = v26;
      v20 = *(void (**)(char *, uint64_t))(v6 + 8);
      v20(v9, v5);

      v20(v14, v5);
      v21 = v24;
      void *v24 = 0xD00000000000003CLL;
      v21[1] = 0x8000000235F6D330;
      v21[2] = v18;
      v21[3] = v19;
      return;
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v4, 1, 1, v5);
  }
  sub_235F57D60((uint64_t)v4);
  sub_235F57DBC();
  swift_allocError();
  _OWORD *v22 = xmmword_235F6C860;
  swift_willThrow();
}

void sub_235F57D08()
{
  if (!qword_26884DC70)
  {
    sub_235F6BF40();
    unint64_t v0 = sub_235F6C0D0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26884DC70);
    }
  }
}

uint64_t sub_235F57D60(uint64_t a1)
{
  sub_235F57D08();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_235F57DBC()
{
  unint64_t result = qword_26884DC78;
  if (!qword_26884DC78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26884DC78);
  }
  return result;
}

unint64_t static SignedClinicalDataWalletPassComponents.teamIdentifier.getter()
{
  return 0xD000000000000010;
}

void sub_235F57E2C()
{
  qword_26884DC28 = (uint64_t)&unk_26E94F0B8;
}

uint64_t static SignedClinicalDataWalletPassComponents.systemAppBundleIdentifiers.getter()
{
  if (qword_26884DC20 != -1) {
    swift_once();
  }
  return swift_bridgeObjectRetain();
}

void sub_235F57E9C()
{
  unk_26884DC47 = -18;
}

uint64_t static SignedClinicalDataWalletPassComponents.backgroundColor.getter()
{
  return sub_235F57F64(&qword_26884DC30, &qword_26884DC38);
}

unint64_t static SignedClinicalDataWalletPassComponents.foregroundColor.getter()
{
  return 0xD000000000000010;
}

void sub_235F57F10()
{
  algn_26884DC58[5] = 0;
  *(_WORD *)&algn_26884DC58[6] = -5120;
}

uint64_t static SignedClinicalDataWalletPassComponents.labelColor.getter()
{
  return sub_235F57F64(&qword_26884DC48, &qword_26884DC50);
}

uint64_t sub_235F57F64(void *a1, uint64_t *a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v3 = *a2;
  swift_bridgeObjectRetain();
  return v3;
}

unint64_t static SignedClinicalDataWalletPassComponents.groupingIdentifierGenericImmunization.getter()
{
  return 0xD00000000000002ALL;
}

unint64_t static SignedClinicalDataWalletPassComponents.groupingIdentifierCOVID19Immunization.getter()
{
  return 0xD000000000000032;
}

unint64_t static SignedClinicalDataWalletPassComponents.groupingIdentifierCOVID19Laboratory.getter()
{
  return 0xD000000000000029;
}

uint64_t SignedClinicalDataWalletPassComponents.passIdentifier.getter@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1[1];
  uint64_t v3 = v1[2];
  uint64_t v4 = v1[3];
  *a1 = *v1;
  a1[1] = v2;
  a1[2] = v3;
  a1[3] = v4;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t SignedClinicalDataWalletPassComponents.groupingIdentifier.getter()
{
  uint64_t v1 = *(void *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t SignedClinicalDataWalletPassComponents.appLaunchURL.getter()
{
  uint64_t v1 = *(void *)(v0 + 48);
  swift_bridgeObjectRetain();
  return v1;
}

id SignedClinicalDataWalletPassComponents.mainRecord.getter()
{
  return *(id *)(v0 + 64);
}

uint64_t SignedClinicalDataWalletPassComponents.medicalRecords.getter()
{
  return swift_bridgeObjectRetain();
}

id SignedClinicalDataWalletPassComponents.QRSegment.getter()
{
  return *(id *)(v0 + 80);
}

void SignedClinicalDataWalletPassComponents.init(from:)(void *a1@<X0>, void *a2@<X8>)
{
  id v5 = objc_msgSend(a1, sel_mainRecord);
  if (!v5)
  {
    sub_235F57DBC();
    swift_allocError();
    void *v17 = 0;
    v17[1] = 0;
    swift_willThrow();
LABEL_16:

    return;
  }
  uint64_t v6 = v5;
  id v7 = objc_msgSend(a1, sel_medicalRecords);
  if (!v7) {
    goto LABEL_14;
  }
  uint64_t v8 = v7;
  sub_235F58670(0, &qword_26884DC80);
  unint64_t v9 = sub_235F6C060();

  if (v9 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v18 = sub_235F6C1E0();
    swift_bridgeObjectRelease();
    if (v18) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
  if (!*(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_13:
    swift_bridgeObjectRelease();
LABEL_14:
    sub_235F57DBC();
    swift_allocError();
    long long v16 = xmmword_235F6C890;
    goto LABEL_15;
  }
LABEL_5:
  id v10 = objc_msgSend(a1, sel_QRRepresentation);
  if (!v10) {
    goto LABEL_11;
  }
  uint64_t v11 = v10;
  id v12 = objc_msgSend(v10, sel_alreadyScannedSegments);

  if (!v12) {
    goto LABEL_11;
  }
  sub_235F58670(0, &qword_26884DC88);
  unint64_t v13 = sub_235F6C060();

  if (v13 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v19 = sub_235F6C1E0();
    swift_bridgeObjectRelease();
    if (v19 >= 2) {
      goto LABEL_9;
    }
    swift_bridgeObjectRetain();
    unint64_t v14 = sub_235F6C1E0();
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v14 = *(void *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v14 > 1)
    {
LABEL_9:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_235F57DBC();
      swift_allocError();
      long long v16 = xmmword_235F6C870;
LABEL_15:
      *id v15 = v16;
      swift_willThrow();

      goto LABEL_16;
    }
  }
  if (!v14)
  {
    swift_bridgeObjectRelease();
LABEL_11:
    swift_bridgeObjectRelease();
    sub_235F57DBC();
    swift_allocError();
    long long v16 = xmmword_235F6C880;
    goto LABEL_15;
  }
  if ((v13 & 0xC000000000000001) != 0)
  {
    id v20 = (id)MEMORY[0x237DF95D0](0, v13);
LABEL_23:
    v21 = v20;
    swift_bridgeObjectRelease();
    if ((uint64_t)objc_msgSend(v21, sel_numberOfExpectedSiblings) >= 2)
    {
      swift_bridgeObjectRelease();
      sub_235F57DBC();
      swift_allocError();
      _OWORD *v22 = xmmword_235F6C870;
      swift_willThrow();

      goto LABEL_16;
    }
    id v23 = v6;
    SignedClinicalDataWalletPassIdentifier.init(signedClinicalDataRecord:)(v23, v53);
    if (v2)
    {
      swift_bridgeObjectRelease();

      goto LABEL_16;
    }
    uint64_t v54 = v53[0];
    uint64_t v51 = v53[2];
    uint64_t v52 = v53[1];
    uint64_t v50 = v53[3];
    unint64_t v24 = HKSignedClinicalDataRecord.appLaunchURL.getter();
    uint64_t v48 = v25;
    unint64_t v49 = v24;
    id v26 = v23;
    id v47 = v21;
    id v27 = objc_msgSend(v26, sel_credentialTypes);
    v28 = (void *)sub_235F6C060();

    uint64_t v29 = sub_235F6BFE0();
    char v31 = sub_235F586AC(v29, v30, v28);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    id v32 = objc_msgSend(v26, sel_credentialTypes);
    v33 = (void *)sub_235F6C060();

    uint64_t v34 = sub_235F6BFE0();
    char v36 = sub_235F586AC(v34, v35, v33);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v31)
    {
      id v37 = v47;
      if (v36)
      {

        unint64_t v38 = 0xD000000000000032;
        unint64_t v39 = 0x8000000235F6D3E0;
LABEL_39:
        *a2 = v54;
        a2[1] = v52;
        a2[2] = v51;
        a2[3] = v50;
        a2[4] = v38;
        a2[5] = v39;
        a2[6] = v49;
        a2[7] = v48;
        a2[8] = v26;
        a2[9] = v9;
        a2[10] = v37;
        return;
      }
      id v42 = objc_msgSend(v26, sel_credentialTypes);
      v43 = (void *)sub_235F6C060();

      uint64_t v44 = sub_235F6BFE0();
      char v46 = sub_235F586AC(v44, v45, v43);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

      v40 = "vid19-immunization";
      BOOL v41 = (v46 & 1) == 0;
      unint64_t v38 = 0xD000000000000029;
      if ((v46 & 1) == 0) {
        unint64_t v38 = 0;
      }
    }
    else
    {
      id v37 = v47;

      v40 = "rgb(255,255,255)";
      BOOL v41 = (v36 & 1) == 0;
      if (v36) {
        unint64_t v38 = 0xD00000000000002ALL;
      }
      else {
        unint64_t v38 = 0;
      }
    }
    unint64_t v39 = (unint64_t)v40 | 0x8000000000000000;
    if (v41) {
      unint64_t v39 = 0;
    }
    goto LABEL_39;
  }
  if (*(void *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v20 = *(id *)(v13 + 32);
    goto LABEL_23;
  }
  __break(1u);
}

uint64_t sub_235F58670(uint64_t a1, unint64_t *a2)
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

uint64_t sub_235F586AC(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = a3[2];
  if (!v3) {
    return 0;
  }
  if (a3[4] == a1 && a3[5] == a2) {
    return 1;
  }
  uint64_t result = sub_235F6C2E0();
  if (result) {
    return 1;
  }
  if (v3 == 1) {
    return 0;
  }
  unint64_t v9 = a3 + 7;
  for (uint64_t i = 1; ; ++i)
  {
    uint64_t v11 = i + 1;
    if (__OFADD__(i, 1)) {
      break;
    }
    BOOL v12 = *(v9 - 1) == a1 && *v9 == a2;
    if (v12 || (sub_235F6C2E0() & 1) != 0) {
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

uint64_t destroy for SignedClinicalDataWalletPassIdentifier()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for SignedClinicalDataWalletPassIdentifier(void *a1, void *a2)
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

void *assignWithCopy for SignedClinicalDataWalletPassIdentifier(void *a1, void *a2)
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

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

void *assignWithTake for SignedClinicalDataWalletPassIdentifier(void *a1, void *a2)
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

uint64_t getEnumTagSinglePayload for SignedClinicalDataWalletPassIdentifier(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for SignedClinicalDataWalletPassIdentifier(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for SignedClinicalDataWalletPassIdentifier()
{
  return &type metadata for SignedClinicalDataWalletPassIdentifier;
}

uint64_t initializeBufferWithCopyOfBuffer for SignedClinicalDataWalletPassComponents(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

void destroy for SignedClinicalDataWalletPassComponents(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  uint64_t v2 = *(void **)(a1 + 80);
}

void *initializeWithCopy for SignedClinicalDataWalletPassComponents(void *a1, void *a2)
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
  uint64_t v8 = (void *)a2[8];
  uint64_t v7 = a2[9];
  a1[8] = v8;
  a1[9] = v7;
  unint64_t v9 = (void *)a2[10];
  a1[10] = v9;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v10 = v8;
  swift_bridgeObjectRetain();
  id v11 = v9;
  return a1;
}

void *assignWithCopy for SignedClinicalDataWalletPassComponents(void *a1, void *a2)
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
  uint64_t v4 = (void *)a2[8];
  uint64_t v5 = (void *)a1[8];
  a1[8] = v4;
  id v6 = v4;

  a1[9] = a2[9];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v7 = (void *)a2[10];
  uint64_t v8 = (void *)a1[10];
  a1[10] = v7;
  id v9 = v7;

  return a1;
}

__n128 __swift_memcpy88_8(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  __n128 result = *(__n128 *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  long long v5 = *(_OWORD *)(a2 + 64);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  *(__n128 *)(a1 + 32) = result;
  return result;
}

uint64_t assignWithTake for SignedClinicalDataWalletPassComponents(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v6;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void **)(a1 + 64);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);

  swift_bridgeObjectRelease();
  uint64_t v8 = *(void **)(a1 + 80);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);

  return a1;
}

uint64_t getEnumTagSinglePayload for SignedClinicalDataWalletPassComponents(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 88)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SignedClinicalDataWalletPassComponents(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 88) = 1;
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
    *(unsigned char *)(result + 88) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SignedClinicalDataWalletPassComponents()
{
  return &type metadata for SignedClinicalDataWalletPassComponents;
}

uint64_t sub_235F58CD0(uint64_t a1)
{
  uint64_t result = sub_235F62FEC(a1);
  if (v4) {
    goto LABEL_8;
  }
  if (*(_DWORD *)(a1 + 36) != v3)
  {
    __break(1u);
LABEL_8:
    __break(1u);
    return result;
  }
  if (result == 1 << *(unsigned char *)(a1 + 32)) {
    return 0;
  }
  uint64_t v5 = sub_235F630A0(result, v3, 0, a1);
  swift_bridgeObjectRetain();
  return v5;
}

void sub_235F58D50()
{
  qword_26884DC90 = 0x2F3A74656C6C6177;
  *(void *)algn_26884DC98 = 0xE90000000000002FLL;
}

uint64_t static SignedClinicalDataWalletPassManager.walletBaseURL.getter()
{
  if (qword_26884DC60 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_26884DC90;
  swift_bridgeObjectRetain();
  return v0;
}

id sub_235F58DE0()
{
  uint64_t v1 = *(void **)(v0 + 16);
  if (v1)
  {
    id v2 = *(id *)(v0 + 16);
  }
  else
  {
    id v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F088C0]), sel_init);
    objc_msgSend(v3, sel_setFormatOptions_, 1907);
    char v4 = *(void **)(v0 + 16);
    *(void *)(v0 + 16) = v3;
    id v2 = v3;

    uint64_t v1 = 0;
  }
  id v5 = v1;
  return v2;
}

id sub_235F58E60()
{
  uint64_t v1 = *(void **)(v0 + 24);
  if (v1)
  {
    id v2 = *(id *)(v0 + 24);
  }
  else
  {
    id v3 = sub_235F58EB8();
    char v4 = *(void **)(v0 + 24);
    *(void *)(v0 + 24) = v3;
    id v2 = v3;

    uint64_t v1 = 0;
  }
  id v5 = v1;
  return v2;
}

id sub_235F58EB8()
{
  sub_235F5B780(0, &qword_26884DCC0, MEMORY[0x263F079C8], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v0 - 8);
  id v2 = (char *)&v8 - v1;
  id v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08790]), sel_init);
  objc_msgSend(v3, sel_setDateStyle_, 2);
  objc_msgSend(v3, sel_setTimeStyle_, 0);
  sub_235F6BF60();
  uint64_t v4 = sub_235F6BF80();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v2, 1, v4) != 1)
  {
    uint64_t v6 = (void *)sub_235F6BF70();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v2, v4);
  }
  objc_msgSend(v3, sel_setTimeZone_, v6);

  return v3;
}

id sub_235F59044()
{
  uint64_t v1 = *(void **)(v0 + 32);
  if (v1)
  {
    id v2 = *(id *)(v0 + 32);
  }
  else
  {
    id v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F5BF80]), sel_init);
    uint64_t v4 = *(void **)(v0 + 32);
    *(void *)(v0 + 32) = v3;
    id v2 = v3;

    uint64_t v1 = 0;
  }
  id v5 = v1;
  return v2;
}

void *SignedClinicalDataWalletPassManager.__allocating_init()()
{
  uint64_t result = (void *)swift_allocObject();
  result[3] = 0;
  result[4] = 0;
  result[2] = 0;
  return result;
}

void *SignedClinicalDataWalletPassManager.init()()
{
  uint64_t result = v0;
  v0[2] = 0;
  v0[3] = 0;
  v0[4] = 0;
  return result;
}

id sub_235F590EC()
{
  id v0 = sub_235F59044();
  id v1 = objc_msgSend(v0, sel_canAddPassOfType_, 0);

  return v1;
}

id static SignedClinicalDataWalletPassManager.walletIsInstalled.getter()
{
  return objc_msgSend(self, sel_isWalletVisible);
}

void sub_235F59158(void *a1)
{
  if (objc_msgSend(self, sel_isWalletVisible))
  {
    id v3 = objc_msgSend(a1, sel_mainRecord);
    if (!v3)
    {
      sub_235F57DBC();
      swift_allocError();
      *id v11 = xmmword_235F6C940;
      swift_willThrow();
      return;
    }
    uint64_t v4 = v3;
    if (HKSignedClinicalDataRecord.permanentlyIneligibleToBeAddedToWallet.getter())
    {
      sub_235F57DBC();
      swift_allocError();
      long long v6 = xmmword_235F6C950;
    }
    else
    {
      if (HKSignedClinicalDataRecord.eligibleToBeAddedToWallet.getter())
      {
        SignedClinicalDataWalletPassComponents.init(from:)(a1, v14);
        if (!v1)
        {
          BOOL v12 = (void *)v14[8];
          unint64_t v13 = (void *)v14[10];

          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          return;
        }
        goto LABEL_15;
      }
      sub_235F57DBC();
      swift_allocError();
      long long v6 = xmmword_235F6C940;
    }
    *id v5 = v6;
    swift_willThrow();
LABEL_15:

    return;
  }
  id v7 = sub_235F59044();
  unsigned int v8 = objc_msgSend(v7, sel_canAddPassOfType_, 0);

  sub_235F57DBC();
  swift_allocError();
  void *v9 = 0;
  if (v8) {
    uint64_t v10 = 7;
  }
  else {
    uint64_t v10 = 8;
  }
  v9[1] = v10;
  swift_willThrow();
}

id sub_235F59358(void *a1)
{
  SignedClinicalDataWalletPassIdentifier.init(signedClinicalDataRecord:)(a1, &v7);
  id v2 = sub_235F59044();
  id v3 = (void *)sub_235F6BFD0();
  uint64_t v4 = (void *)sub_235F6BFD0();
  id v5 = objc_msgSend(v2, sel_passWithPassTypeIdentifier_serialNumber_, v3, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  if (v5)
  {
    id v6 = objc_msgSend(v5, sel_uniqueID);

    if (v6)
    {
      id v5 = (id)sub_235F6BFE0();
    }
    else
    {
      return 0;
    }
  }
  return v5;
}

uint64_t sub_235F59468@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  SignedClinicalDataWalletPassIdentifier.init(signedClinicalDataRecord:)(a1, v11);
  id v6 = sub_235F59044();
  uint64_t v7 = (void *)sub_235F6BFD0();
  unsigned int v8 = (void *)sub_235F6BFD0();
  id v9 = objc_msgSend(v6, sel_passWithPassTypeIdentifier_serialNumber_, v7, v8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  if (v9 && (id v10 = objc_msgSend(v9, sel_uniqueID), v9, v10))
  {
    sub_235F6BFE0();

    if (qword_26884DC60 != -1) {
      swift_once();
    }
    strcpy((char *)v11, "wallet://card/");
    HIBYTE(v11[1]) = -18;
    sub_235F6C020();
    swift_bridgeObjectRelease();
    sub_235F6BE90();
    return swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = sub_235F6BEA0();
    uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 56);
    return v4(a2, 1, 1, v3);
  }
}

void sub_235F59668(void *a1, void (*a2)(uint64_t), void (*a3)(uint64_t))
{
  unint64_t v38 = a2;
  uint64_t v5 = sub_235F6BEA0();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  uint64_t v8 = MEMORY[0x270FA5388](v5);
  id v9 = (char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  BOOL v12 = (char *)&v32 - v11;
  MEMORY[0x270FA5388](v10);
  unint64_t v14 = (char *)&v32 - v13;
  if (objc_msgSend(self, sel_isWalletVisible))
  {
    sub_235F59F38(a1, v12);
    uint64_t v35 = *(void (**)(char *, char *, uint64_t))(v6 + 32);
    uint64_t v36 = v6 + 32;
    v35(v14, v12, v5);
    id v37 = sub_235F59044();
    sub_235F5B780(0, &qword_26884DCA0, MEMORY[0x263F06EA8], MEMORY[0x263F8E0F8]);
    uint64_t v21 = *(unsigned __int8 *)(v6 + 80);
    v33 = a3;
    uint64_t v22 = swift_allocObject();
    *(_OWORD *)(v22 + 16) = xmmword_235F6C960;
    id v23 = *(void (**)(uint64_t, char *, uint64_t))(v6 + 16);
    v23(v22 + ((v21 + 32) & ~v21), v14, v5);
    uint64_t v34 = sub_235F6C050();
    swift_bridgeObjectRelease();
    v23((uint64_t)v9, v14, v5);
    uint64_t v24 = (v21 + 16) & ~v21;
    unint64_t v25 = (v7 + v24 + 7) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v26 = swift_allocObject();
    v35((char *)(v26 + v24), v9, v5);
    id v27 = (void (**)(uint64_t))(v26 + v25);
    v28 = v33;
    *id v27 = v38;
    v27[1] = v28;
    aBlock[4] = sub_235F5B6C8;
    aBlock[5] = v26;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_235F59BC0;
    aBlock[3] = &block_descriptor;
    uint64_t v29 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    id v30 = v37;
    char v31 = (void *)v34;
    objc_msgSend(v37, sel_addUnsignedPassesAtURLs_withCompletionHandler_, v34, v29);
    _Block_release(v29);

    (*(void (**)(char *, uint64_t))(v6 + 8))(v14, v5);
  }
  else
  {
    id v15 = sub_235F59044();
    unsigned int v16 = objc_msgSend(v15, sel_canAddPassOfType_, 0);

    sub_235F57DBC();
    uint64_t v17 = swift_allocError();
    uint64_t v19 = (void *)v17;
    *uint64_t v18 = 0;
    if (v16) {
      uint64_t v20 = 7;
    }
    else {
      uint64_t v20 = 8;
    }
    v18[1] = v20;
    v38(v17);
  }
}

void sub_235F59A70(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  v13[1] = *(id *)MEMORY[0x263EF8340];
  id v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08850]), sel_init);
  uint64_t v6 = (void *)sub_235F6BE60();
  v13[0] = 0;
  unsigned int v7 = objc_msgSend(v5, sel_removeItemAtURL_error_, v6, v13);

  if (v7)
  {
    id v8 = v13[0];
    if (a1)
    {
LABEL_3:
      sub_235F57DBC();
      id v9 = (void *)swift_allocError();
      *uint64_t v10 = xmmword_235F6C970;
      a3();

      return;
    }
  }
  else
  {
    id v11 = v13[0];
    BOOL v12 = (void *)sub_235F6BE40();

    swift_willThrow();
    if (a1) {
      goto LABEL_3;
    }
  }
  ((void (*)(void))a3)(0);
}

uint64_t sub_235F59BC0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);
  return swift_release();
}

void sub_235F59C14(void *a1)
{
  SignedClinicalDataWalletPassComponents.init(from:)(a1, v9);
  if (!v1)
  {
    v9[12] = v9[5];
    id v8 = (void *)v9[8];
    id v2 = (void *)v9[10];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    id v3 = sub_235F59044();
    uint64_t v4 = (void *)sub_235F6BFD0();
    id v5 = (void *)sub_235F6BFD0();
    id v6 = objc_msgSend(v3, sel_passWithPassTypeIdentifier_serialNumber_, v4, v5);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    if (v6)
    {
      id v7 = sub_235F59044();
      objc_msgSend(v7, sel_removePass_, v6);
    }
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
}

void sub_235F59D6C(uint64_t a1)
{
  uint64_t v2 = sub_235F6BF40();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  id v5 = (char *)v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
  sub_235F6BF20();
  v11[0] = 762472566;
  v11[1] = 0xE400000000000000;
  sub_235F6C020();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  id v6 = sub_235F59044();
  id v7 = (void *)sub_235F6BFD0();
  id v8 = (void *)sub_235F6BFD0();
  id v9 = objc_msgSend(v6, sel_passWithPassTypeIdentifier_serialNumber_, v7, v8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  if (v9)
  {
    id v10 = sub_235F59044();
    objc_msgSend(v10, sel_removePass_, v9);
  }
}

void sub_235F59F38(void *a1@<X0>, char *a2@<X8>)
{
  id v204 = a1;
  v203 = a2;
  v209[33] = *MEMORY[0x263EF8340];
  id v198 = *v2;
  sub_235F5B780(0, &qword_26884DCA8, MEMORY[0x263F06EA8], MEMORY[0x263F8D8F0]);
  uint64_t v4 = MEMORY[0x270FA5388](v3 - 8);
  v192 = (char *)&v174 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  v193 = (char *)&v174 - v7;
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  v195 = (char *)&v174 - v9;
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  v197 = (char *)&v174 - v11;
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  v196 = (char *)&v174 - v13;
  MEMORY[0x270FA5388](v12);
  v199 = (char *)&v174 - v14;
  uint64_t v15 = sub_235F6BEA0();
  uint64_t v201 = *(void *)(v15 - 8);
  uint64_t v202 = v15;
  uint64_t v16 = MEMORY[0x270FA5388](v15);
  v191 = (char *)&v174 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  uint64_t v20 = (char *)&v174 - v19;
  uint64_t v21 = MEMORY[0x270FA5388](v18);
  id v23 = (char *)&v174 - v22;
  uint64_t v24 = MEMORY[0x270FA5388](v21);
  uint64_t v26 = (char *)&v174 - v25;
  uint64_t v27 = MEMORY[0x270FA5388](v24);
  uint64_t v29 = (char *)&v174 - v28;
  uint64_t v30 = MEMORY[0x270FA5388](v27);
  uint64_t v32 = (char *)&v174 - v31;
  uint64_t v33 = MEMORY[0x270FA5388](v30);
  uint64_t v35 = (char *)&v174 - v34;
  uint64_t v36 = MEMORY[0x270FA5388](v33);
  unint64_t v38 = (char *)&v174 - v37;
  MEMORY[0x270FA5388](v36);
  v40 = (char *)&v174 - v39;
  id v41 = v204;
  uint64_t v42 = v205;
  SignedClinicalDataWalletPassComponents.init(from:)(v41, v209);
  if (!v42)
  {
    v180 = v32;
    v181 = v38;
    v178 = v29;
    v179 = v35;
    v176 = v23;
    v177 = v26;
    v175 = v20;
    uint64_t v43 = v209[2];
    uint64_t v44 = v209[3];
    v184 = (void (*)(char *, uint64_t))v209[4];
    id v185 = (id)v209[0];
    id v204 = (id)v209[5];
    uint64_t v205 = 0;
    v183 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v209[6];
    uint64_t v186 = v209[7];
    uint64_t v188 = v209[1];
    id v189 = (id)v209[8];
    uint64_t v194 = v209[9];
    id v190 = (id)v209[10];
    uint64_t v45 = NSTemporaryDirectory();
    sub_235F6BFE0();

    sub_235F6BE50();
    swift_bridgeObjectRelease();
    v209[0] = 0;
    v209[1] = 0xE000000000000000;
    sub_235F6C140();
    swift_bridgeObjectRelease();
    v209[0] = 0xD000000000000015;
    v209[1] = 0x8000000235F6D470;
    swift_bridgeObjectRetain();
    sub_235F6C020();
    uint64_t v187 = v44;
    swift_bridgeObjectRelease();
    sub_235F6C020();
    v182 = v40;
    sub_235F6BE70();
    swift_bridgeObjectRelease();
    id v46 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08850]), sel_init);
    id v47 = (void *)sub_235F6BE60();
    v209[0] = 0;
    unsigned int v48 = objc_msgSend(v46, sel_removeItemAtURL_error_, v47, v209);

    if (v48)
    {
      id v49 = (id)v209[0];
      uint64_t v50 = v205;
    }
    else
    {
      id v51 = (id)v209[0];
      uint64_t v52 = (void *)sub_235F6BE40();

      swift_willThrow();
      uint64_t v50 = 0;
    }
    v208[0] = v185;
    v208[1] = v188;
    v208[2] = v43;
    v208[3] = v187;
    v208[4] = v184;
    v208[5] = v204;
    v208[6] = v183;
    v208[7] = v186;
    id v54 = v189;
    id v53 = v190;
    v208[8] = v189;
    v208[9] = v194;
    v208[10] = v190;
    sub_235F5BA98((uint64_t)v208, v209);
    uint64_t v205 = v50;
    if (v50)
    {

      uint64_t v55 = v202;
      v56 = *(void (**)(uint64_t, uint64_t))(v201 + 8);
      v56((uint64_t)v203, v202);
      v56((uint64_t)v182, v55);

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return;
    }
    id v200 = v46;
    memcpy(v207, v209, 0x102uLL);
    id v57 = objc_allocWithZone(MEMORY[0x263F0A970]);
    v58 = v203;
    v59 = (void *)sub_235F6BE60();
    id v60 = objc_msgSend(v57, sel_initWithURL_archiveType_, v59, 0);

    memcpy(v206, v207, sizeof(v206));
    uint64_t v61 = v205;
    uint64_t v62 = WalletPass.asData()();
    uint64_t v64 = v202;
    if (v61)
    {

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

      swift_bridgeObjectRelease();
      v65 = *(void (**)(uint64_t, uint64_t))(v201 + 8);
      v65((uint64_t)v58, v64);
      v65((uint64_t)v182, v64);
      sub_235F5C45C((uint64_t)v207);
      return;
    }
    uint64_t v66 = v62;
    unint64_t v67 = v63;
    sub_235F5C45C((uint64_t)v207);
    uint64_t v68 = sub_235F6BEB0();
    id v185 = v60;
    v69 = (void *)v68;
    sub_235F5C598(v66, v67);
    v70 = v181;
    sub_235F6BE50();
    v71 = (void *)sub_235F6BE60();
    uint64_t v72 = v201;
    v73 = (char *)(v201 + 8);
    v184 = *(void (**)(char *, uint64_t))(v201 + 8);
    v184(v70, v64);
    objc_msgSend(v185, sel_addDataToArchive_pathInArchive_, v69, v71);

    sub_235F5B7E4();
    uint64_t v74 = v72;
    v75 = v73;
    uint64_t v205 = 0;
    uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    id v77 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
    v78 = (void *)sub_235F6BFD0();
    v79 = (void *)sub_235F6BFD0();
    id v80 = objc_msgSend(v77, sel_URLForResource_withExtension_, v78, v79);

    id v198 = v77;
    if (v80)
    {
      v81 = v180;
      sub_235F6BE80();

      uint64_t v82 = v74;
      v83 = *(void (**)(char *, char *, uint64_t))(v74 + 32);
      uint64_t v84 = (uint64_t)v199;
      uint64_t v85 = v202;
      v83(v199, v81, v202);
      v183 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v82 + 56);
      v183(v84, 0, 1, v85);
      int v86 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v82 + 48))(v84, 1, v85);
      v87 = v184;
      id v88 = v190;
      if (v86 != 1)
      {
        v106 = v179;
        v83(v179, (char *)v84, v85);
        id v107 = v185;
        uint64_t v108 = v205;
        sub_235F5B914();
        uint64_t v205 = v108;
        if (v108)
        {

          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();

          swift_bridgeObjectRelease();
          v87(v106, v85);
          v87(v203, v85);
          v87(v182, v85);
          return;
        }
        v87(v106, v85);
        id v77 = v198;
LABEL_16:
        v199 = v75;
        v89 = (void *)sub_235F6BFD0();
        v90 = (void *)sub_235F6BFD0();
        id v91 = objc_msgSend(v77, sel_URLForResource_withExtension_, v89, v90);

        uint64_t v92 = (uint64_t)v197;
        if (v91)
        {
          v93 = v180;
          sub_235F6BE80();

          uint64_t v94 = v201;
          uint64_t v95 = v202;
          v96 = *(void (**)(char *, char *, uint64_t))(v201 + 32);
          uint64_t v97 = (uint64_t)v196;
          v98 = v93;
          id v99 = v198;
          v96(v196, v98, v202);
          v183(v97, 0, 1, v95);
          if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v94 + 48))(v97, 1, v95) != 1)
          {
            v100 = v178;
            uint64_t v101 = v97;
            uint64_t v102 = v202;
            v96(v178, (char *)v101, v202);
            id v103 = v185;
            uint64_t v104 = v205;
            sub_235F5B914();
            uint64_t v205 = v104;
            if (v104)
            {

              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();

              swift_bridgeObjectRelease();
              v105 = (void (*)(uint64_t, uint64_t))v184;
              v184(v100, v102);
              v105((uint64_t)v203, v102);
              v105((uint64_t)v182, v102);
              return;
            }
            v184(v100, v102);
LABEL_24:
            v109 = (void *)sub_235F6BFD0();
            v110 = (void *)sub_235F6BFD0();
            id v111 = objc_msgSend(v99, sel_URLForResource_withExtension_, v109, v110);

            v112 = v183;
            if (v111)
            {
              v113 = v180;
              sub_235F6BE80();

              uint64_t v114 = v201;
              uint64_t v115 = v202;
              v116 = *(void (**)(uint64_t, char *, uint64_t))(v201 + 32);
              v117 = v113;
              id v99 = v198;
              v116(v92, v117, v202);
              v112(v92, 0, 1, v115);
              if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v114 + 48))(v92, 1, v115) != 1)
              {
                v118 = v177;
                uint64_t v119 = v202;
                v116((uint64_t)v177, (char *)v92, v202);
                id v120 = v185;
                uint64_t v121 = v205;
                sub_235F5B914();
                uint64_t v205 = v121;
                if (v121)
                {

                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();

                  swift_bridgeObjectRelease();
                  v122 = (void (*)(uint64_t, uint64_t))v184;
                  v184(v118, v119);
                  v122((uint64_t)v203, v119);
                  v122((uint64_t)v182, v119);
                  return;
                }
                v184(v118, v119);
LABEL_30:
                v123 = (void *)sub_235F6BFD0();
                v124 = (void *)sub_235F6BFD0();
                id v125 = objc_msgSend(v99, sel_URLForResource_withExtension_, v123, v124);

                if (v125)
                {
                  v126 = v180;
                  sub_235F6BE80();

                  uint64_t v127 = v201;
                  uint64_t v128 = v202;
                  v129 = *(void (**)(char *, char *, uint64_t))(v201 + 32);
                  uint64_t v130 = (uint64_t)v195;
                  v131 = v126;
                  id v99 = v198;
                  v129(v195, v131, v202);
                  v112(v130, 0, 1, v128);
                  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v127 + 48))(v130, 1, v128) != 1)
                  {
                    v132 = v176;
                    uint64_t v133 = v130;
                    uint64_t v134 = v202;
                    v129(v176, (char *)v133, v202);
                    v135 = v132;
                    id v136 = v185;
                    uint64_t v137 = v205;
                    sub_235F5B914();
                    uint64_t v205 = v137;
                    if (v137)
                    {

                      swift_bridgeObjectRelease();
                      swift_bridgeObjectRelease();
                      swift_bridgeObjectRelease();
                      swift_bridgeObjectRelease();

                      swift_bridgeObjectRelease();
                      v138 = (void (*)(uint64_t, uint64_t))v184;
                      v184(v135, v134);
                      v138((uint64_t)v203, v134);
                      v138((uint64_t)v182, v134);
                      return;
                    }
                    v184(v135, v134);
LABEL_36:
                    id v139 = v200;
                    if (objc_msgSend(v189, sel_sourceType) != (id)1
                      || !objc_msgSend(self, sel_hk_isUSLocale))
                    {
                      v156 = v184;
                      goto LABEL_43;
                    }
                    v140 = (void *)sub_235F6BFD0();
                    v141 = (void *)sub_235F6BFD0();
                    id v142 = objc_msgSend(v99, sel_URLForResource_withExtension_, v140, v141);

                    if (v142)
                    {
                      v143 = v180;
                      sub_235F6BE80();

                      uint64_t v144 = v201;
                      v145 = *(void (**)(char *, char *, uint64_t))(v201 + 32);
                      v146 = v193;
                      v147 = v143;
                      uint64_t v148 = v202;
                      v145(v193, v147, v202);
                      v112((uint64_t)v146, 0, 1, v148);
                      uint64_t v149 = v144;
                      uint64_t v150 = (uint64_t)v146;
                      id v99 = v198;
                      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v149 + 48))(v150, 1, v148) != 1)
                      {
                        v151 = v175;
                        uint64_t v152 = v202;
                        v145(v175, (char *)v150, v202);
                        id v153 = v185;
                        uint64_t v154 = v205;
                        sub_235F5B914();
                        uint64_t v205 = v154;
                        if (v154)
                        {

                          swift_bridgeObjectRelease();
                          swift_bridgeObjectRelease();
                          swift_bridgeObjectRelease();
                          swift_bridgeObjectRelease();

                          swift_bridgeObjectRelease();
                          v155 = (void (*)(uint64_t, uint64_t))v184;
                          v184(v151, v152);
                          v155((uint64_t)v203, v152);
                          v155((uint64_t)v182, v152);
                          return;
                        }
                        v184(v151, v152);
                        id v99 = v198;
LABEL_51:
                        v160 = (void *)sub_235F6BFD0();
                        v161 = (void *)sub_235F6BFD0();
                        id v162 = objc_msgSend(v99, sel_URLForResource_withExtension_, v160, v161);

                        if (v162)
                        {
                          v163 = v180;
                          sub_235F6BE80();

                          uint64_t v164 = v201;
                          uint64_t v165 = v202;
                          uint64_t v166 = (uint64_t)v192;
                          v167 = v163;
                          id v99 = v198;
                          v199 = *(char **)(v201 + 32);
                          ((void (*)(char *, char *, uint64_t))v199)(v192, v167, v202);
                          v112(v166, 0, 1, v165);
                          int v168 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v164 + 48))(v166, 1, v165);
                          v156 = v184;
                          if (v168 != 1)
                          {
                            v169 = v191;
                            uint64_t v170 = v202;
                            ((void (*)(char *, uint64_t, uint64_t))v199)(v191, v166, v202);
                            v171 = v169;
                            id v172 = v185;
                            uint64_t v173 = v205;
                            sub_235F5B914();
                            if (v173)
                            {

                              swift_bridgeObjectRelease();
                              swift_bridgeObjectRelease();
                              swift_bridgeObjectRelease();
                              swift_bridgeObjectRelease();

                              swift_bridgeObjectRelease();
                              v156(v171, v170);
                              v156(v203, v170);
                              v158 = v182;
                              uint64_t v159 = v170;
                              goto LABEL_44;
                            }
                            v156(v171, v170);
                            id v139 = v200;
LABEL_43:
                            id v157 = v185;
                            objc_msgSend(v185, sel_closeArchive);

                            swift_bridgeObjectRelease();
                            swift_bridgeObjectRelease();
                            swift_bridgeObjectRelease();
                            swift_bridgeObjectRelease();

                            swift_bridgeObjectRelease();
                            v158 = v182;
                            uint64_t v159 = v202;
LABEL_44:
                            v156(v158, v159);
                            return;
                          }
                        }
                        else
                        {
                          uint64_t v166 = (uint64_t)v192;
                          v112((uint64_t)v192, 1, 1, v202);
                          v156 = v184;
                        }
                        sub_235F63850(v166, &qword_26884DCA8, MEMORY[0x263F06EA8]);
                        id v139 = v200;
                        goto LABEL_43;
                      }
                    }
                    else
                    {
                      uint64_t v150 = (uint64_t)v193;
                      v112((uint64_t)v193, 1, 1, v202);
                    }
                    sub_235F63850(v150, &qword_26884DCA8, MEMORY[0x263F06EA8]);
                    goto LABEL_51;
                  }
                }
                else
                {
                  uint64_t v130 = (uint64_t)v195;
                  v112((uint64_t)v195, 1, 1, v202);
                }
                sub_235F63850(v130, &qword_26884DCA8, MEMORY[0x263F06EA8]);
                goto LABEL_36;
              }
            }
            else
            {
              v183(v92, 1, 1, v202);
            }
            sub_235F63850(v92, &qword_26884DCA8, MEMORY[0x263F06EA8]);
            goto LABEL_30;
          }
        }
        else
        {
          id v99 = v77;
          uint64_t v97 = (uint64_t)v196;
          v183((uint64_t)v196, 1, 1, v202);
        }
        sub_235F63850(v97, &qword_26884DCA8, MEMORY[0x263F06EA8]);
        goto LABEL_24;
      }
      id v77 = v198;
    }
    else
    {
      uint64_t v84 = (uint64_t)v199;
      v183 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v74 + 56);
      v183((uint64_t)v199, 1, 1, v202);
    }
    sub_235F63850(v84, &qword_26884DCA8, MEMORY[0x263F06EA8]);
    goto LABEL_16;
  }
}

uint64_t sub_235F5B620()
{
  uint64_t v1 = sub_235F6BEA0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();
  return MEMORY[0x270FA0238](v0, v6, v5);
}

void sub_235F5B6C8(uint64_t a1)
{
  uint64_t v3 = *(void *)(sub_235F6BEA0() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = *(void (**)(void))(v1 + ((*(void *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8));
  sub_235F59A70(a1, v1 + v4, v5);
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

void sub_235F5B780(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v7 = a3(255);
    unint64_t v8 = a4(a1, v7);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

id sub_235F5B7E4()
{
  id result = objc_msgSend(v0, sel_archiveIsValid);
  if (!result)
  {
    sub_235F6C020();
    sub_235F6C020();
    id v2 = objc_msgSend(v0, sel_error);
    if (v2)
    {
      uint64_t v3 = v2;
      swift_getErrorValue();
      sub_235F6C300();
    }
    sub_235F6C020();
    swift_bridgeObjectRelease();
    sub_235F57DBC();
    swift_allocError();
    *unint64_t v4 = 0x20726F727265;
    v4[1] = 0xE600000000000000;
    return (id)swift_willThrow();
  }
  return result;
}

uint64_t sub_235F5B914()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_235F6BEA0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v6 = (void *)sub_235F6BE60();
  sub_235F6BE50();
  uint64_t v7 = (void *)sub_235F6BE60();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  objc_msgSend(v1, sel_addFileToArchive_pathInArchive_, v6, v7);

  v9[0] = 0x6020676E69646461;
  v9[1] = 0xE800000000000000;
  sub_235F6C020();
  sub_235F6C020();
  sub_235F5B7E4();
  return swift_bridgeObjectRelease();
}

uint64_t sub_235F5BA98@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  v87 = a2;
  sub_235F5B780(0, &qword_26884DCB0, MEMORY[0x263F07490], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v76 - v4;
  uint64_t v89 = sub_235F6BF10();
  uint64_t v93 = *(void *)(v89 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v89);
  uint64_t v85 = (char *)&v76 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v84 = (char *)&v76 - v8;
  uint64_t v96 = *(void *)a1;
  uint64_t v99 = *(void *)(a1 + 8);
  uint64_t v95 = *(void *)(a1 + 16);
  uint64_t v100 = *(void *)(a1 + 24);
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 40);
  uint64_t v97 = *(void *)(a1 + 48);
  uint64_t v98 = v9;
  uint64_t v105 = *(void *)(a1 + 56);
  uint64_t v11 = *(void **)(a1 + 80);
  long long v90 = *(_OWORD *)(a1 + 64);
  uint64_t v12 = (void *)v90;
  id v13 = objc_msgSend((id)v90, sel_credentialTypes);
  uint64_t v14 = (void *)sub_235F6C060();

  uint64_t v15 = sub_235F6BFE0();
  char v17 = sub_235F586AC(v15, v16, v14);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v88 = v5;
  if ((v17 & 1) == 0)
  {
    id v20 = objc_msgSend(v12, sel_credentialTypes);
    uint64_t v21 = (void *)sub_235F6C060();

    uint64_t v22 = sub_235F6BFE0();
    sub_235F586AC(v22, v23, v21);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  type metadata accessor for SignedClinicalDataWalletPassManager();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v19 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v86 = sub_235F6BE30();
  uint64_t v92 = v24;

  id v25 = objc_msgSend(v12, sel_sourceType);
  if (v25 == (id)2) {
    uint64_t v26 = 0x434344205545;
  }
  else {
    uint64_t v26 = 0;
  }
  if (v25 == (id)2) {
    unint64_t v27 = 0xE600000000000000;
  }
  else {
    unint64_t v27 = 0;
  }
  id v28 = objc_msgSend(v11, sel_fullQRCodeValue);
  uint64_t v29 = sub_235F6BFE0();
  uint64_t v30 = v12;
  uint64_t v32 = v31;

  v101[0] = v96;
  v101[1] = v99;
  v101[2] = v95;
  v101[3] = v100;
  v101[4] = v98;
  v101[5] = v10;
  v101[6] = v97;
  v101[7] = v105;
  long long v102 = v90;
  id v103 = v11;
  unint64_t v33 = v91;
  sub_235F5C5F0((uint64_t)v101, v104);
  uint64_t v34 = v93;
  if (v33)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  uint64_t v76 = v10;
  uint64_t v77 = v29;
  uint64_t v82 = 0;
  uint64_t v83 = v32;
  *(void *)&long long v90 = v26;
  unint64_t v91 = v27;
  uint64_t v36 = v104[0];
  uint64_t v81 = v104[1];
  uint64_t v80 = v104[2];
  uint64_t v79 = v104[3];
  uint64_t v78 = v104[4];
  id v37 = objc_msgSend(v30, sel_expirationDate);
  unint64_t v38 = v30;
  if (!v37)
  {
    uint64_t v42 = (uint64_t)v88;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v34 + 56))(v88, 1, 1, v89);
    goto LABEL_15;
  }
  uint64_t v39 = v37;
  v40 = v85;
  sub_235F6BEF0();

  id v41 = *(void (**)(char *, char *, uint64_t))(v34 + 32);
  uint64_t v42 = (uint64_t)v88;
  uint64_t v43 = v40;
  uint64_t v44 = v89;
  v41(v88, v43, v89);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v34 + 56))(v42, 0, 1, v44);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v34 + 48))(v42, 1, v44) == 1)
  {
LABEL_15:
    sub_235F63850(v42, &qword_26884DCB0, MEMORY[0x263F07490]);
    uint64_t v50 = 0;
    uint64_t v85 = 0;
    goto LABEL_16;
  }
  uint64_t v45 = v84;
  v41(v84, (char *)v42, v44);
  uint64_t v46 = v44;
  id v47 = sub_235F58DE0();
  unsigned int v48 = (void *)sub_235F6BEC0();
  id v49 = objc_msgSend(v47, sel_stringFromDate_, v48);

  uint64_t v50 = sub_235F6BFE0();
  uint64_t v85 = v51;

  (*(void (**)(char *, uint64_t))(v34 + 8))(v45, v46);
LABEL_16:
  uint64_t v52 = v86;
  uint64_t v53 = v36;
  id v54 = objc_msgSend(v38, sel_recordTypeDisplayName);
  uint64_t v94 = sub_235F6BFE0();
  uint64_t v93 = v55;

  id v56 = objc_msgSend(v38, sel_recordIssuerDisplayName);
  uint64_t v89 = sub_235F6BFE0();
  id v88 = v57;

  uint64_t v58 = qword_26884DC20;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v58 != -1) {
    swift_once();
  }
  uint64_t v59 = qword_26884DC28;
  uint64_t v60 = qword_26884DC30;
  swift_bridgeObjectRetain();
  if (v60 != -1) {
    swift_once();
  }
  uint64_t v61 = qword_26884DC38;
  uint64_t v62 = unk_26884DC40;
  uint64_t v63 = qword_26884DC48;
  swift_bridgeObjectRetain();
  uint64_t v64 = v76;
  swift_bridgeObjectRetain();
  if (v63 != -1) {
    swift_once();
  }
  uint64_t v65 = qword_26884DC50;
  uint64_t v66 = *(void *)algn_26884DC58;
  sub_235F63DD8(0, &qword_26884DCB8, (uint64_t)&type metadata for WalletPassBarcode, MEMORY[0x263F8E0F8]);
  uint64_t v67 = swift_allocObject();
  unint64_t v68 = v91;
  *(void *)(v67 + 32) = v90;
  *(void *)(v67 + 40) = v68;
  *(void *)(v67 + 48) = 0xD000000000000011;
  *(void *)(v67 + 56) = 0x8000000235F6D590;
  *(_OWORD *)(v67 + 16) = xmmword_235F6C960;
  uint64_t v69 = v83;
  *(void *)(v67 + 64) = v77;
  *(void *)(v67 + 72) = v69;
  *(void *)(v67 + 80) = 0x393538382D6F7369;
  *(void *)(v67 + 88) = 0xEA0000000000312DLL;
  v70 = v87;
  uint64_t *v87 = v94;
  v70[1] = v93;
  v70[2] = 1;
  v70[3] = v89;
  v70[4] = (uint64_t)v88;
  v70[5] = v96;
  uint64_t v71 = v100;
  v70[6] = v99;
  v70[7] = v95;
  v70[8] = v71;
  v70[9] = 0xD000000000000010;
  v70[10] = 0x8000000235F6D370;
  uint64_t v72 = v105;
  v70[11] = v97;
  v70[12] = v72;
  v70[13] = v59;
  v70[14] = v61;
  v70[15] = v62;
  v70[16] = 0xD000000000000010;
  uint64_t v73 = v98;
  v70[17] = 0x8000000235F6D390;
  v70[18] = v73;
  v70[19] = v64;
  v70[20] = v65;
  v70[21] = v66;
  v70[22] = v52;
  v70[23] = v92;
  v70[24] = v53;
  uint64_t v74 = v80;
  v70[25] = v81;
  v70[26] = v74;
  uint64_t v75 = v78;
  v70[27] = v79;
  v70[28] = v75;
  v70[29] = v67;
  v70[30] = v50;
  v70[31] = (uint64_t)v85;
  *((_WORD *)v70 + 128) = 513;
  return swift_bridgeObjectRetain();
}

uint64_t sub_235F5C45C(uint64_t a1)
{
  return a1;
}

uint64_t sub_235F5C598(uint64_t a1, unint64_t a2)
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

void sub_235F5C5F0(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  v376 = a2;
  uint64_t v3 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x263F8D8F0];
  sub_235F5B780(0, &qword_26884DCB0, MEMORY[0x263F07490], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v4 - 8);
  v375 = (char *)&v353 - v5;
  uint64_t v381 = sub_235F6BF10();
  v380 = *(void **)(v381 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v381);
  v355 = (char *)&v353 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  *(void *)&long long v379 = (char *)&v353 - v8;
  sub_235F5B780(0, &qword_26884DCC8, MEMORY[0x263F07690], v3);
  uint64_t v10 = MEMORY[0x270FA5388](v9 - 8);
  v354 = (char *)&v353 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  v371 = (char *)&v353 - v13;
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  v370 = (char *)&v353 - v15;
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  v369 = (char *)&v353 - v17;
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  v377 = (char *)&v353 - v19;
  uint64_t v20 = MEMORY[0x270FA5388](v18);
  v385 = (char *)&v353 - v21;
  uint64_t v22 = MEMORY[0x270FA5388](v20);
  v362 = (char *)&v353 - v23;
  uint64_t v24 = MEMORY[0x270FA5388](v22);
  v361 = (char *)&v353 - v25;
  uint64_t v26 = MEMORY[0x270FA5388](v24);
  v360 = (char *)&v353 - v27;
  uint64_t v28 = MEMORY[0x270FA5388](v26);
  v359 = (char *)&v353 - v29;
  uint64_t v30 = MEMORY[0x270FA5388](v28);
  v358 = (char *)&v353 - v31;
  uint64_t v32 = MEMORY[0x270FA5388](v30);
  v357 = (char *)&v353 - v33;
  uint64_t v34 = MEMORY[0x270FA5388](v32);
  v356 = (char *)&v353 - v35;
  uint64_t v36 = MEMORY[0x270FA5388](v34);
  v368 = (char *)&v353 - v37;
  MEMORY[0x270FA5388](v36);
  v367 = (char *)&v353 - v38;
  uint64_t v39 = *(void **)(a1 + 64);
  unint64_t v388 = *(void *)(a1 + 72);
  id v390 = v39;
  id v40 = objc_msgSend(v390, sel_credentialTypes);
  id v41 = (void *)sub_235F6C060();

  uint64_t v42 = sub_235F6BFE0();
  char v44 = sub_235F586AC(v42, v43, v41);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v45 = 0;
  if (v44)
  {
    type metadata accessor for SignedClinicalDataWalletPassManager();
    uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    id v47 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
    uint64_t v48 = sub_235F6BE30();
    uint64_t v50 = v49;

    LOBYTE(v399) = 1;
    sub_235F63DD8(0, &qword_26884DCD0, (uint64_t)&type metadata for WalletPassField, MEMORY[0x263F8E0F8]);
    uint64_t v45 = swift_allocObject();
    *(_OWORD *)(v45 + 16) = xmmword_235F6C960;
    *(void *)(v45 + 32) = 1701869940;
    *(void *)(v45 + 40) = 0xE400000000000000;
    *(void *)(v45 + 48) = 0;
    *(void *)(v45 + 56) = 0;
    *(void *)(v45 + 64) = v48;
    *(void *)(v45 + 72) = v50;
    *(_OWORD *)(v45 + 80) = 0u;
    *(_OWORD *)(v45 + 96) = 0u;
    *(_OWORD *)(v45 + 112) = 0u;
    *(void *)(v45 + 128) = 0;
    *(_DWORD *)(v45 + 136) = 33686789;
    *(void *)(v45 + 144) = 0;
    *(unsigned char *)(v45 + 152) = v399;
  }
  uint64_t v374 = v45;
  sub_235F63DD8(0, &qword_26884DCD0, (uint64_t)&type metadata for WalletPassField, MEMORY[0x263F8E0F8]);
  uint64_t v52 = v51;
  uint64_t v53 = swift_allocObject();
  long long v383 = xmmword_235F6C960;
  *(_OWORD *)(v53 + 16) = xmmword_235F6C960;
  type metadata accessor for SignedClinicalDataWalletPassManager();
  uint64_t v54 = swift_getObjCClassFromMetadata();
  id v392 = self;
  uint64_t v393 = v54;
  id v55 = objc_msgSend(v392, sel_bundleForClass_, v54);
  v366 = "$__lazy_storage_$_passLibrary";
  v391 = "FIELD_TYPE_VALUE_GENERIC";
  uint64_t v378 = 0xD000000000000020;
  uint64_t v56 = sub_235F6BE30();
  uint64_t v58 = v57;

  id v59 = v390;
  id v60 = objc_msgSend(v390, sel_subject);
  id v61 = objc_msgSend(v60, sel_fullName);

  uint64_t v62 = sub_235F6BFE0();
  uint64_t v64 = v63;

  strcpy((char *)(v53 + 32), "subject-name");
  *(unsigned char *)(v53 + 45) = 0;
  *(_WORD *)(v53 + 46) = -5120;
  *(void *)(v53 + 48) = v56;
  *(void *)(v53 + 56) = v58;
  *(void *)(v53 + 64) = v62;
  *(void *)(v53 + 72) = v64;
  *(_OWORD *)(v53 + 80) = 0u;
  *(_OWORD *)(v53 + 96) = 0u;
  *(_OWORD *)(v53 + 112) = 0u;
  *(void *)(v53 + 128) = 0;
  long long v389 = 0x2020505uLL;
  *(_DWORD *)(v53 + 136) = 33686789;
  *(void *)(v53 + 144) = 0;
  unint64_t v65 = 1;
  uint64_t v373 = v53;
  *(unsigned char *)(v53 + 152) = 1;
  uint64_t v66 = (uint64_t)v59;
  uint64_t v67 = sub_235F63280(v59);
  uint64_t v69 = v68;
  uint64_t v71 = v70;
  uint64_t v73 = v72;
  v382 = v52;
  uint64_t v74 = swift_allocObject();
  *(_OWORD *)(v74 + 16) = v383;
  *(void *)(v74 + 32) = 0x6D616E2D6D657469;
  *(void *)(v74 + 40) = 0xE900000000000065;
  *(void *)(v74 + 48) = v67;
  *(void *)(v74 + 56) = v69;
  *(void *)(v74 + 64) = v71;
  *(void *)(v74 + 72) = v73;
  *(_OWORD *)(v74 + 80) = 0u;
  *(_OWORD *)(v74 + 96) = 0u;
  *(_OWORD *)(v74 + 112) = 0u;
  *(void *)(v74 + 128) = 0;
  *(_DWORD *)(v74 + 136) = v389;
  *(void *)(v74 + 144) = 0;
  uint64_t v372 = v74;
  *(unsigned char *)(v74 + 152) = 1;
  if ((v388 & 0x8000000000000000) != 0 || (v388 & 0x4000000000000000) != 0)
  {
    unint64_t v65 = v388;
    swift_bridgeObjectRetain_n();
    uint64_t v75 = sub_235F607D4(v65);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v75 = (void *)(v388 & 0xFFFFFFFFFFFFFF8);
    swift_bridgeObjectRetain_n();
  }
  uint64_t v76 = v387;
  unint64_t v399 = (unint64_t)v75;
  sub_235F60758((uint64_t *)&v399);
  unint64_t v77 = 0x264C96000uLL;
  if (!v76)
  {
    id v78 = v59;
    v387 = 0;
    swift_bridgeObjectRelease();
    unint64_t v79 = v399;
    unint64_t v399 = MEMORY[0x263F8EE78];
    if ((v79 & 0x8000000000000000) != 0 || (v79 & 0x4000000000000000) != 0)
    {
      swift_retain();
      uint64_t v80 = sub_235F6C1E0();
      if (v80)
      {
LABEL_10:
        if (v80 < 1)
        {
          __break(1u);
          goto LABEL_133;
        }
        for (uint64_t i = 0; i != v80; ++i)
        {
          if ((v79 & 0xC000000000000001) != 0) {
            id v84 = (id)MEMORY[0x237DF95D0](i, v79);
          }
          else {
            id v84 = *(id *)(v79 + 8 * i + 32);
          }
          uint64_t v85 = v84;
          self;
          uint64_t v86 = (void *)swift_dynamicCastObjCClass();
          if (!v86 || objc_msgSend(v86, sel_notGiven))
          {
          }
          else
          {
            sub_235F6C190();
            sub_235F6C1B0();
            sub_235F6C1C0();
            sub_235F6C1A0();
          }
        }
        swift_release();
        unint64_t v87 = v399;
        id v78 = v390;
        unint64_t v77 = 0x264C96000;
        if ((v399 & 0x8000000000000000) != 0)
        {
LABEL_131:
          while (1)
          {
            swift_bridgeObjectRetain();
            uint64_t v88 = sub_235F6C1E0();
            swift_release();
LABEL_27:
            uint64_t v89 = v88 >= 4 ? 4 : v88;
            uint64_t v90 = v88 >= 0 ? v89 : 4;
            if ((v90 & 0x8000000000000000) == 0) {
              break;
            }
            __break(1u);
          }
          unint64_t v365 = v79;
          sub_235F62C1C(0, v87);
          sub_235F62C1C(v90, v87);
          sub_235F62C9C(0, v90, v87);
          uint64_t v92 = v91;
          uint64_t v94 = v93;
          unint64_t v96 = v95;
          swift_release();
          swift_retain();
          uint64_t v97 = v387;
          sub_235F6369C(v92, v94, v96);
          uint64_t v99 = v98;
          id v61 = v97;
          swift_unknownObjectRelease();
          swift_release();
          unint64_t v399 = (unint64_t)v99;
          uint64_t v100 = sub_235F6BF50();
          uint64_t v101 = *(void *)(v100 - 8);
          uint64_t v102 = (uint64_t)v367;
          v387 = *(void (**)(void, void, void))(v101 + 56);
          unint64_t v388 = v100;
          uint64_t v386 = v101 + 56;
          v387(v367, 1, 1);
          id v103 = objc_msgSend(v392, sel_bundleForClass_, v393);
          v363 = "FIELD_LABEL_NAME";
          unint64_t v364 = 0xD000000000000022;
          uint64_t v104 = sub_235F6BE30();
          uint64_t v106 = v105;

          if (*(void *)(MEMORY[0x263F8EE78] + 16))
          {
            uint64_t v104 = sub_235F6BFF0();
            uint64_t v108 = v107;
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            uint64_t v106 = v108;
          }
          else
          {
            swift_bridgeObjectRelease();
          }
          sub_235F63850(v102, &qword_26884DCC8, MEMORY[0x263F07690]);
          id v109 = objc_msgSend(v78, sel_recordIssuerDisplayName);
          uint64_t v110 = sub_235F6BFE0();
          uint64_t v112 = v111;

          char v398 = 0;
          sub_235F604AC();
          v113 = (void *)v399;
          unint64_t v115 = *(void *)(v399 + 16);
          unint64_t v114 = *(void *)(v399 + 24);
          if (v115 >= v114 >> 1)
          {
            v113 = sub_235F60628((void *)(v114 > 1), v115 + 1, 1, (void *)v399);
            unint64_t v399 = (unint64_t)v113;
          }
          v113[2] = v115 + 1;
          v116 = &v113[16 * v115];
          v116[4] = 0x726575737369;
          v116[5] = 0xE600000000000000;
          v116[6] = v104;
          v116[7] = v106;
          v116[8] = v110;
          v116[9] = v112;
          *((_OWORD *)v116 + 5) = 0u;
          *((_OWORD *)v116 + 6) = 0u;
          *((_OWORD *)v116 + 7) = 0u;
          v116[16] = 0;
          *((_DWORD *)v116 + 34) = v389;
          v116[18] = 1;
          *((unsigned char *)v116 + 152) = 0;
          uint64_t v117 = swift_allocObject();
          *(_OWORD *)(v117 + 16) = v383;
          uint64_t v118 = (uint64_t)v368;
          ((void (*)(char *, uint64_t, uint64_t, unint64_t))v387)(v368, 1, 1, v388);
          id v119 = objc_msgSend(v392, sel_bundleForClass_, v393);
          uint64_t v120 = sub_235F6BE30();
          uint64_t v122 = v121;

          if (*(void *)(MEMORY[0x263F8EE78] + 16))
          {
            uint64_t v120 = sub_235F6BFF0();
            uint64_t v124 = v123;
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            uint64_t v122 = v124;
          }
          else
          {
            swift_bridgeObjectRelease();
          }
          sub_235F63850(v118, &qword_26884DCC8, MEMORY[0x263F07690]);
          id v125 = [v78 *(SEL *)(v77 + 2520)];
          id v126 = objc_msgSend(v125, sel_fullName);

          uint64_t v127 = sub_235F6BFE0();
          uint64_t v129 = v128;

          id v130 = v78;
          *(void *)(v117 + 32) = 0xD000000000000011;
          *(void *)(v117 + 40) = 0x8000000235F6D740;
          *(void *)(v117 + 48) = v120;
          *(void *)(v117 + 56) = v122;
          *(void *)(v117 + 64) = v127;
          *(void *)(v117 + 72) = v129;
          *(_OWORD *)(v117 + 80) = 0u;
          *(_OWORD *)(v117 + 96) = 0u;
          *(_OWORD *)(v117 + 112) = 0u;
          *(void *)(v117 + 128) = 0;
          *(_DWORD *)(v117 + 136) = v389;
          *(void *)(v117 + 144) = 0;
          *(unsigned char *)(v117 + 152) = 1;
          v397 = (void *)v117;
          id v131 = [v78 *(SEL *)(v77 + 2520)];
          unint64_t v65 = (unint64_t)objc_msgSend(v131, sel_birthDate);

          if (!v65)
          {
LABEL_48:
            id v144 = [v130 *(SEL *)(v77 + 2520)];
            id v145 = objc_msgSend(v144, sel_gender);

            if (v145)
            {
              uint64_t v146 = sub_235F6BFE0();
              uint64_t v148 = v147;

              uint64_t v149 = (uint64_t)v357;
              ((void (*)(char *, uint64_t, uint64_t, unint64_t))v387)(v357, 1, 1, v388);
              id v150 = objc_msgSend(v392, sel_bundleForClass_, v393);
              uint64_t v151 = sub_235F6BE30();
              uint64_t v153 = v152;

              if (*(void *)(MEMORY[0x263F8EE78] + 16))
              {
                uint64_t v151 = sub_235F6BFF0();
                uint64_t v155 = v154;
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                uint64_t v153 = v155;
              }
              else
              {
                swift_bridgeObjectRelease();
              }
              sub_235F63850(v149, &qword_26884DCC8, MEMORY[0x263F07690]);
              LOBYTE(v396) = 1;
              sub_235F604AC();
              v156 = v397;
              unint64_t v158 = v397[2];
              unint64_t v157 = v397[3];
              if (v158 >= v157 >> 1)
              {
                v156 = sub_235F60628((void *)(v157 > 1), v158 + 1, 1, v397);
                v397 = v156;
              }
              v156[2] = v158 + 1;
              uint64_t v159 = &v156[16 * v158];
              v159[4] = 0x7265646E6567;
              v159[5] = 0xE600000000000000;
              v159[6] = v151;
              v159[7] = v153;
              v159[8] = v146;
              v159[9] = v148;
              *((_OWORD *)v159 + 5) = 0u;
              *((_OWORD *)v159 + 6) = 0u;
              *((_OWORD *)v159 + 7) = 0u;
              v159[16] = 0;
              *((_DWORD *)v159 + 34) = v389;
              v159[18] = 0;
              *((unsigned char *)v159 + 152) = 1;
              id v130 = v390;
              unint64_t v77 = 0x264C96000uLL;
            }
            uint64_t v396 = 0;
            id v160 = [v130 *(SEL *)(v77 + 2520)];
            id v161 = objc_msgSend(v160, sel_identifiers);

            uint64_t v162 = (uint64_t)v385;
            if (v161)
            {
              sub_235F63DD8(0, &qword_26884DCD8, MEMORY[0x263F8D310], MEMORY[0x263F8D488]);
              uint64_t v163 = sub_235F6C060();

              uint64_t v164 = *(void *)(v163 + 16);
              if (v164)
              {
                swift_bridgeObjectRetain();
                for (uint64_t j = 0; j != v164; ++j)
                {
                  uint64_t v166 = *(void **)(v163 + 8 * j + 32);
                  v395 = v166;
                  sub_235F5F998(&v395, &v396, &v397);
                }
                swift_bridgeObjectRelease();
              }
              swift_bridgeObjectRelease();
            }
            id v167 = [v130 *(SEL *)(v77 + 2520)];
            id v168 = objc_msgSend(v167, sel_emailAddresses);

            if (v168)
            {
              v169 = (void *)sub_235F6C060();

              uint64_t v170 = (uint64_t)v358;
              ((void (*)(char *, uint64_t, uint64_t, unint64_t))v387)(v358, 1, 1, v388);
              id v171 = objc_msgSend(v392, sel_bundleForClass_, v393);
              uint64_t v172 = sub_235F6BE30();
              uint64_t v174 = v173;

              if (*(void *)(MEMORY[0x263F8EE78] + 16))
              {
                uint64_t v172 = sub_235F6BFF0();
                uint64_t v176 = v175;
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                uint64_t v174 = v176;
              }
              else
              {
                swift_bridgeObjectRelease();
              }
              sub_235F63850(v170, &qword_26884DCC8, MEMORY[0x263F07690]);
              v395 = v169;
              sub_235F63DD8(0, &qword_26884DCD8, MEMORY[0x263F8D310], MEMORY[0x263F8D488]);
              sub_235F63B78();
              uint64_t v177 = sub_235F6BFC0();
              uint64_t v179 = v178;
              swift_bridgeObjectRelease();
              LOBYTE(v394) = 1;
              sub_235F604AC();
              v180 = v397;
              unint64_t v182 = v397[2];
              unint64_t v181 = v397[3];
              if (v182 >= v181 >> 1)
              {
                v180 = sub_235F60628((void *)(v181 > 1), v182 + 1, 1, v397);
                v397 = v180;
              }
              v180[2] = v182 + 1;
              v183 = &v180[16 * v182];
              v183[4] = 0x736C69616D65;
              v183[5] = 0xE600000000000000;
              v183[6] = v172;
              v183[7] = v174;
              v183[8] = v177;
              v183[9] = v179;
              *((_OWORD *)v183 + 5) = 0u;
              *((_OWORD *)v183 + 6) = 0u;
              *((_OWORD *)v183 + 7) = 0u;
              v183[16] = 0;
              *((_DWORD *)v183 + 34) = v389;
              v183[18] = 0;
              *((unsigned char *)v183 + 152) = 1;
              uint64_t v162 = (uint64_t)v385;
              id v130 = v390;
            }
            id v184 = [v130 *(SEL *)(v77 + 2520)];
            id v185 = objc_msgSend(v184, sel_phoneNumbers);

            if (v185)
            {
              uint64_t v186 = (void *)sub_235F6C060();

              uint64_t v187 = (uint64_t)v359;
              ((void (*)(char *, uint64_t, uint64_t, unint64_t))v387)(v359, 1, 1, v388);
              id v188 = objc_msgSend(v392, sel_bundleForClass_, v393);
              uint64_t v189 = sub_235F6BE30();
              uint64_t v191 = v190;

              if (*(void *)(MEMORY[0x263F8EE78] + 16))
              {
                uint64_t v189 = sub_235F6BFF0();
                uint64_t v193 = v192;
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                uint64_t v191 = v193;
              }
              else
              {
                swift_bridgeObjectRelease();
              }
              sub_235F63850(v187, &qword_26884DCC8, MEMORY[0x263F07690]);
              v395 = v186;
              sub_235F63DD8(0, &qword_26884DCD8, MEMORY[0x263F8D310], MEMORY[0x263F8D488]);
              sub_235F63B78();
              uint64_t v194 = sub_235F6BFC0();
              uint64_t v196 = v195;
              swift_bridgeObjectRelease();
              LOBYTE(v394) = 1;
              sub_235F604AC();
              v197 = v397;
              unint64_t v199 = v397[2];
              unint64_t v198 = v397[3];
              if (v199 >= v198 >> 1)
              {
                v197 = sub_235F60628((void *)(v198 > 1), v199 + 1, 1, v397);
                v397 = v197;
              }
              v197[2] = v199 + 1;
              id v200 = &v197[16 * v199];
              v200[4] = 0x73656E6F6870;
              v200[5] = 0xE600000000000000;
              v200[6] = v189;
              v200[7] = v191;
              v200[8] = v194;
              v200[9] = v196;
              *((_OWORD *)v200 + 5) = 0u;
              *((_OWORD *)v200 + 6) = 0u;
              *((_OWORD *)v200 + 7) = 0u;
              v200[16] = 0;
              *((_DWORD *)v200 + 34) = v389;
              v200[18] = 0;
              *((unsigned char *)v200 + 152) = 1;
              uint64_t v162 = (uint64_t)v385;
              id v130 = v390;
            }
            id v201 = [v130 *(SEL *)(v77 + 2520)];
            id v202 = objc_msgSend(v201, sel_addresses);

            if (v202)
            {
              v203 = (void *)sub_235F6C060();

              uint64_t v204 = (uint64_t)v360;
              ((void (*)(char *, uint64_t, uint64_t, unint64_t))v387)(v360, 1, 1, v388);
              id v205 = objc_msgSend(v392, sel_bundleForClass_, v393);
              uint64_t v206 = sub_235F6BE30();
              uint64_t v208 = v207;

              if (*(void *)(MEMORY[0x263F8EE78] + 16))
              {
                uint64_t v206 = sub_235F6BFF0();
                uint64_t v210 = v209;
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                uint64_t v208 = v210;
              }
              else
              {
                swift_bridgeObjectRelease();
              }
              sub_235F63850(v204, &qword_26884DCC8, MEMORY[0x263F07690]);
              v395 = v203;
              sub_235F63DD8(0, &qword_26884DCD8, MEMORY[0x263F8D310], MEMORY[0x263F8D488]);
              sub_235F63B78();
              uint64_t v211 = sub_235F6BFC0();
              uint64_t v213 = v212;
              swift_bridgeObjectRelease();
              LOBYTE(v394) = 1;
              sub_235F604AC();
              v214 = v397;
              unint64_t v216 = v397[2];
              unint64_t v215 = v397[3];
              if (v216 >= v215 >> 1)
              {
                v214 = sub_235F60628((void *)(v215 > 1), v216 + 1, 1, v397);
                v397 = v214;
              }
              v214[2] = v216 + 1;
              v217 = &v214[16 * v216];
              v217[4] = 0x6573736572646461;
              v217[5] = 0xE900000000000073;
              v217[6] = v206;
              v217[7] = v208;
              v217[8] = v211;
              v217[9] = v213;
              *((_OWORD *)v217 + 5) = 0u;
              *((_OWORD *)v217 + 6) = 0u;
              *((_OWORD *)v217 + 7) = 0u;
              v217[16] = 0;
              *((_DWORD *)v217 + 34) = v389;
              v217[18] = 0;
              *((unsigned char *)v217 + 152) = 1;
              uint64_t v162 = (uint64_t)v385;
              id v130 = v390;
            }
            id v218 = [v130 *(SEL *)(v77 + 2520)];
            id v219 = objc_msgSend(v218, sel_maritalStatus);

            if (v219)
            {
              uint64_t v220 = sub_235F6BFE0();
              uint64_t v222 = v221;

              uint64_t v223 = (uint64_t)v361;
              ((void (*)(char *, uint64_t, uint64_t, unint64_t))v387)(v361, 1, 1, v388);
              id v224 = objc_msgSend(v392, sel_bundleForClass_, v393);
              uint64_t v225 = sub_235F6BE30();
              uint64_t v227 = v226;

              if (*(void *)(MEMORY[0x263F8EE78] + 16))
              {
                uint64_t v225 = sub_235F6BFF0();
                uint64_t v229 = v228;
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                uint64_t v227 = v229;
              }
              else
              {
                swift_bridgeObjectRelease();
              }
              sub_235F63850(v223, &qword_26884DCC8, MEMORY[0x263F07690]);
              LOBYTE(v395) = 1;
              sub_235F604AC();
              v230 = v397;
              unint64_t v232 = v397[2];
              unint64_t v231 = v397[3];
              if (v232 >= v231 >> 1)
              {
                v230 = sub_235F60628((void *)(v231 > 1), v232 + 1, 1, v397);
                v397 = v230;
              }
              v230[2] = v232 + 1;
              v233 = (char *)&v230[16 * v232];
              strcpy(v233 + 32, "marital-status");
              v233[47] = -18;
              *((void *)v233 + 6) = v225;
              *((void *)v233 + 7) = v227;
              *((void *)v233 + 8) = v220;
              *((void *)v233 + 9) = v222;
              *((_OWORD *)v233 + 5) = 0u;
              *((_OWORD *)v233 + 6) = 0u;
              *((_OWORD *)v233 + 7) = 0u;
              *((void *)v233 + 16) = 0;
              *((_DWORD *)v233 + 34) = v389;
              *((void *)v233 + 18) = 0;
              v233[152] = 1;
              id v130 = v390;
              uint64_t v162 = (uint64_t)v385;
              unint64_t v77 = 0x264C96000uLL;
            }
            id v234 = [v130 *(SEL *)(v77 + 2520)];
            id v235 = objc_msgSend(v234, sel_race);

            if (v235)
            {
              uint64_t v236 = sub_235F6BFE0();
              uint64_t v238 = v237;

              uint64_t v239 = (uint64_t)v362;
              ((void (*)(char *, uint64_t, uint64_t, unint64_t))v387)(v362, 1, 1, v388);
              id v240 = objc_msgSend(v392, sel_bundleForClass_, v393);
              uint64_t v241 = sub_235F6BE30();
              uint64_t v243 = v242;

              if (*(void *)(MEMORY[0x263F8EE78] + 16))
              {
                uint64_t v241 = sub_235F6BFF0();
                uint64_t v245 = v244;
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                uint64_t v243 = v245;
              }
              else
              {
                swift_bridgeObjectRelease();
              }
              sub_235F63850(v239, &qword_26884DCC8, MEMORY[0x263F07690]);
              LOBYTE(v395) = 1;
              sub_235F604AC();
              v246 = v397;
              unint64_t v248 = v397[2];
              unint64_t v247 = v397[3];
              if (v248 >= v247 >> 1)
              {
                v246 = sub_235F60628((void *)(v247 > 1), v248 + 1, 1, v397);
                v397 = v246;
              }
              v246[2] = v248 + 1;
              v249 = &v246[16 * v248];
              v249[4] = 1701011826;
              v249[5] = 0xE400000000000000;
              v249[6] = v241;
              v249[7] = v243;
              v249[8] = v236;
              v249[9] = v238;
              *((_OWORD *)v249 + 5) = 0u;
              *((_OWORD *)v249 + 6) = 0u;
              *((_OWORD *)v249 + 7) = 0u;
              v249[16] = 0;
              *((_DWORD *)v249 + 34) = v389;
              v249[18] = 0;
              *((unsigned char *)v249 + 152) = 1;
              id v130 = v390;
              uint64_t v162 = (uint64_t)v385;
              unint64_t v77 = 0x264C96000uLL;
            }
            id v250 = [v130 *(SEL *)(v77 + 2520)];
            id v251 = objc_msgSend(v250, sel_ethnicity);

            if (v251)
            {
              uint64_t v252 = sub_235F6BFE0();
              uint64_t v254 = v253;

              ((void (*)(uint64_t, uint64_t, uint64_t, unint64_t))v387)(v162, 1, 1, v388);
              id v255 = objc_msgSend(v392, sel_bundleForClass_, v393);
              uint64_t v256 = sub_235F6BE30();
              uint64_t v258 = v257;

              if (*(void *)(MEMORY[0x263F8EE78] + 16))
              {
                uint64_t v256 = sub_235F6BFF0();
                uint64_t v260 = v259;
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                uint64_t v258 = v260;
              }
              else
              {
                swift_bridgeObjectRelease();
              }
              sub_235F63850(v162, &qword_26884DCC8, MEMORY[0x263F07690]);
              LOBYTE(v395) = 1;
              sub_235F604AC();
              v261 = v397;
              unint64_t v263 = v397[2];
              unint64_t v262 = v397[3];
              if (v263 >= v262 >> 1)
              {
                v261 = sub_235F60628((void *)(v262 > 1), v263 + 1, 1, v397);
                v397 = v261;
              }
              v261[2] = v263 + 1;
              v264 = &v261[16 * v263];
              v264[4] = 0x746963696E687465;
              v264[5] = 0xE900000000000079;
              v264[6] = v256;
              v264[7] = v258;
              v264[8] = v252;
              v264[9] = v254;
              *((_OWORD *)v264 + 5) = 0u;
              *((_OWORD *)v264 + 6) = 0u;
              *((_OWORD *)v264 + 7) = 0u;
              v264[16] = 0;
              *((_DWORD *)v264 + 34) = v389;
              v264[18] = 0;
              *((unsigned char *)v264 + 152) = 1;
              id v130 = v390;
              unint64_t v77 = 0x264C96000uLL;
            }
            id v265 = [v130 *(SEL *)(v77 + 2520)];
            id v266 = objc_msgSend(v265, sel_birthSex);

            if (v266)
            {
              uint64_t v267 = sub_235F6BFE0();
              uint64_t v269 = v268;

              uint64_t v270 = (uint64_t)v377;
              ((void (*)(char *, uint64_t, uint64_t, unint64_t))v387)(v377, 1, 1, v388);
              id v271 = objc_msgSend(v392, sel_bundleForClass_, v393);
              uint64_t v272 = sub_235F6BE30();
              uint64_t v274 = v273;

              if (*(void *)(MEMORY[0x263F8EE78] + 16))
              {
                uint64_t v272 = sub_235F6BFF0();
                uint64_t v276 = v275;
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                uint64_t v274 = v276;
                uint64_t v270 = (uint64_t)v377;
              }
              else
              {
                swift_bridgeObjectRelease();
              }
              sub_235F63850(v270, &qword_26884DCC8, MEMORY[0x263F07690]);
              LOBYTE(v395) = 1;
              sub_235F604AC();
              v277 = v397;
              unint64_t v279 = v397[2];
              unint64_t v278 = v397[3];
              if (v279 >= v278 >> 1)
              {
                v277 = sub_235F60628((void *)(v278 > 1), v279 + 1, 1, v397);
                v397 = v277;
              }
              v277[2] = v279 + 1;
              v280 = &v277[16 * v279];
              v280[4] = 0x65732D6874726962;
              v280[5] = 0xE900000000000078;
              v280[6] = v272;
              v280[7] = v274;
              v280[8] = v267;
              v280[9] = v269;
              *((_OWORD *)v280 + 5) = 0u;
              *((_OWORD *)v280 + 6) = 0u;
              *((_OWORD *)v280 + 7) = 0u;
              v280[16] = 0;
              *((_DWORD *)v280 + 34) = v389;
              v280[18] = 0;
              *((unsigned char *)v280 + 152) = 1;
              id v130 = v390;
            }
            v281 = v384;
            swift_retain();
            uint64_t v378 = sub_235F639B4(v365, v281);
            *(void *)&long long v383 = v61;
            swift_release();
            swift_release();
            uint64_t v282 = swift_allocObject();
            *(_OWORD *)(v282 + 16) = xmmword_235F6C980;
            v283 = v369;
            ((void (*)(char *, uint64_t, uint64_t, unint64_t))v387)(v369, 1, 1, v388);
            id v284 = objc_msgSend(v392, sel_bundleForClass_, v393);
            uint64_t v285 = sub_235F6BE30();
            uint64_t v287 = v286;

            if (*(void *)(MEMORY[0x263F8EE78] + 16))
            {
              uint64_t v285 = sub_235F6BFF0();
              uint64_t v289 = v288;
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              uint64_t v287 = v289;
              id v130 = v390;
            }
            else
            {
              swift_bridgeObjectRelease();
            }
            uint64_t v290 = (uint64_t)v371;
            uint64_t v291 = (uint64_t)v283;
            uint64_t v292 = (uint64_t)v370;
            v385 = (char *)(v282 + 280);
            sub_235F63850(v291, &qword_26884DCC8, MEMORY[0x263F07690]);
            id v293 = objc_msgSend(v130, sel_recordIssuerDisplayName);
            uint64_t v294 = sub_235F6BFE0();
            uint64_t v296 = v295;

            *(void *)(v282 + 32) = 0x622D726575737369;
            *(void *)(v282 + 40) = 0xEB000000006B6361;
            *(void *)(v282 + 48) = v285;
            *(void *)(v282 + 56) = v287;
            *(void *)(v282 + 64) = v294;
            *(void *)(v282 + 72) = v296;
            *(_OWORD *)(v282 + 80) = 0u;
            *(_OWORD *)(v282 + 96) = 0u;
            *(void *)(v282 + 128) = 0;
            uint64_t v297 = MEMORY[0x263F8EE78];
            *(void *)(v282 + 112) = MEMORY[0x263F8EE78];
            *(void *)(v282 + 120) = 0;
            *(_DWORD *)(v282 + 136) = v389;
            *(void *)(v282 + 144) = 0;
            *(unsigned char *)(v282 + 152) = 1;
            ((void (*)(uint64_t, uint64_t, uint64_t, unint64_t))v387)(v292, 1, 1, v388);
            id v298 = objc_msgSend(v392, sel_bundleForClass_, v393);
            uint64_t v299 = sub_235F6BE30();
            uint64_t v301 = v300;

            if (*(void *)(v297 + 16))
            {
              uint64_t v299 = sub_235F6BFF0();
              uint64_t v303 = v302;
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              uint64_t v301 = v303;
            }
            else
            {
              swift_bridgeObjectRelease();
            }
            v304 = (char *)v379;
            sub_235F63850(v292, &qword_26884DCC8, MEMORY[0x263F07690]);
            id v305 = v390;
            uint64_t v306 = HKSignedClinicalDataRecord.detailSignatureStatusPlainString.getter();
            *(void *)(v282 + 160) = 0xD000000000000010;
            *(void *)(v282 + 168) = 0x8000000235F6D780;
            *(void *)(v282 + 176) = v299;
            *(void *)(v282 + 184) = v301;
            *(void *)(v282 + 192) = v306;
            *(void *)(v282 + 200) = v307;
            *(_OWORD *)(v282 + 208) = 0u;
            *(_OWORD *)(v282 + 224) = 0u;
            *(_OWORD *)(v282 + 240) = 0u;
            *(void *)(v282 + 256) = 0;
            *(_DWORD *)(v282 + 264) = v389;
            *(void *)(v282 + 272) = 0;
            char *v385 = 1;
            ((void (*)(uint64_t, uint64_t, uint64_t, unint64_t))v387)(v290, 1, 1, v388);
            id v308 = objc_msgSend(v392, sel_bundleForClass_, v393);
            uint64_t v309 = sub_235F6BE30();
            uint64_t v311 = v310;

            if (*(void *)(MEMORY[0x263F8EE78] + 16))
            {
              uint64_t v309 = sub_235F6BFF0();
              uint64_t v313 = v312;
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              uint64_t v311 = v313;
            }
            else
            {
              swift_bridgeObjectRelease();
            }
            sub_235F63850(v290, &qword_26884DCC8, MEMORY[0x263F07690]);
            id v314 = sub_235F58DE0();
            id v315 = objc_msgSend(v305, sel_issuedDate);
            sub_235F6BEF0();

            v316 = (void *)sub_235F6BEC0();
            v317 = v380;
            v318 = (void (*)(char *, uint64_t))v380[1];
            uint64_t v319 = v381;
            *(void *)&long long v389 = v380 + 1;
            v382 = v318;
            v318(v304, v381);
            v320 = v304;
            id v321 = objc_msgSend(v314, sel_stringFromDate_, v316);

            uint64_t v322 = sub_235F6BFE0();
            uint64_t v324 = v323;

            id v325 = v390;
            *(void *)(v282 + 288) = 0x642D646575737369;
            *(void *)(v282 + 296) = 0xEB00000000657461;
            *(void *)(v282 + 304) = v309;
            *(void *)(v282 + 312) = v311;
            *(void *)(v282 + 320) = v322;
            *(void *)(v282 + 328) = v324;
            *(_OWORD *)(v282 + 336) = 0u;
            *(_OWORD *)(v282 + 352) = 0u;
            *(_OWORD *)(v282 + 368) = 0u;
            *(void *)(v282 + 384) = 0;
            long long v379 = 0x2020502uLL;
            *(_DWORD *)(v282 + 392) = 33686786;
            *(void *)(v282 + 400) = 0;
            v385[128] = 1;
            v395 = (void *)v282;
            id v326 = objc_msgSend(v325, sel_expirationDate);
            if (v326)
            {
              v327 = v326;
              sub_235F6BEF0();

              v328 = (void (*)(char *, uint64_t, uint64_t))v317[4];
              uint64_t v329 = (uint64_t)v375;
              v328(v375, (uint64_t)v320, v319);
              ((void (*)(uint64_t, void, uint64_t, uint64_t))v317[7])(v329, 0, 1, v319);
              if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v317[6])(v329, 1, v319) != 1)
              {
                uint64_t v330 = v319;
                v331 = v355;
                v328(v355, v329, v330);
                uint64_t v332 = (uint64_t)v354;
                ((void (*)(char *, uint64_t, uint64_t, unint64_t))v387)(v354, 1, 1, v388);
                id v333 = objc_msgSend(v392, sel_bundleForClass_, v393);
                uint64_t v334 = sub_235F6BE30();
                uint64_t v336 = v335;

                if (*(void *)(MEMORY[0x263F8EE78] + 16))
                {
                  uint64_t v334 = sub_235F6BFF0();
                  uint64_t v338 = v337;
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  uint64_t v336 = v338;
                }
                else
                {
                  swift_bridgeObjectRelease();
                }
                sub_235F63850(v332, &qword_26884DCC8, MEMORY[0x263F07690]);
                id v339 = sub_235F58DE0();
                v340 = (void *)sub_235F6BEC0();
                id v341 = objc_msgSend(v339, sel_stringFromDate_, v340);

                uint64_t v342 = sub_235F6BFE0();
                uint64_t v344 = v343;

                LOBYTE(v394) = 1;
                sub_235F604AC();
                v345 = v395;
                unint64_t v347 = v395[2];
                unint64_t v346 = v395[3];
                if (v347 >= v346 >> 1)
                {
                  v345 = sub_235F60628((void *)(v346 > 1), v347 + 1, 1, v395);
                  v395 = v345;
                }
                v345[2] = v347 + 1;
                v348 = &v345[16 * v347];
                v348[4] = 0x6974617269707865;
                v348[5] = 0xEF657461642D6E6FLL;
                v348[6] = v334;
                v348[7] = v336;
                v348[8] = v342;
                v348[9] = v344;
                *((_OWORD *)v348 + 5) = 0u;
                *((_OWORD *)v348 + 6) = 0u;
                *((_OWORD *)v348 + 7) = 0u;
                v348[16] = 0;
                *((_DWORD *)v348 + 34) = v379;
                v348[18] = 0;
                *((unsigned char *)v348 + 152) = 1;
                v382(v331, v381);
                id v325 = v390;
                goto LABEL_129;
              }
            }
            else
            {
              uint64_t v329 = (uint64_t)v375;
              ((void (*)(char *, uint64_t, uint64_t, uint64_t))v317[7])(v375, 1, 1, v319);
            }
            sub_235F63850(v329, &qword_26884DCB0, MEMORY[0x263F07490]);
LABEL_129:
            v394 = v397;
            swift_bridgeObjectRetain();
            sub_235F608F0(v378);
            swift_bridgeObjectRetain();
            uint64_t v349 = swift_bridgeObjectRetain();
            sub_235F608F0(v349);
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();

            v350 = v394;
            unint64_t v351 = v399;
            v352 = v376;
            uint64_t *v376 = v374;
            v352[1] = v373;
            v352[2] = v372;
            v352[3] = v351;
            v352[4] = (uint64_t)v350;
            return;
          }
          uint64_t v132 = (uint64_t)v356;
          ((void (*)(char *, uint64_t, uint64_t, unint64_t))v387)(v356, 1, 1, v388);
          id v133 = objc_msgSend(v392, sel_bundleForClass_, v393);
          uint64_t v66 = sub_235F6BE30();
          unint64_t v79 = v134;

          id v78 = v380;
          if (*(void *)(MEMORY[0x263F8EE78] + 16))
          {
            uint64_t v66 = sub_235F6BFF0();
            unint64_t v136 = v135;
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            unint64_t v79 = v136;
          }
          else
          {
            swift_bridgeObjectRelease();
          }
          uint64_t v137 = v379;
          sub_235F63850(v132, &qword_26884DCC8, MEMORY[0x263F07690]);
          id v138 = sub_235F58DE0();
          id v139 = objc_msgSend((id)v65, sel_dateForUTC);
          sub_235F6BEF0();

          v140 = (void *)sub_235F6BEC0();
          (*((void (**)(uint64_t, uint64_t))v78 + 1))(v137, v381);
          id v141 = objc_msgSend(v138, sel_stringFromDate_, v140);

          uint64_t v80 = sub_235F6BFE0();
          uint64_t v73 = v142;

          LOBYTE(v78) = 1;
          LOBYTE(v396) = 1;
          sub_235F604AC();
          uint64_t v81 = v397;
          unint64_t v77 = v397[2];
          unint64_t v82 = v397[3];
          id v59 = (id)(v77 + 1);
          if (v77 < v82 >> 1)
          {
LABEL_47:
            v81[2] = v59;
            v143 = &v81[16 * v77];
            v143[4] = 6451044;
            v143[5] = 0xE300000000000000;
            v143[6] = v66;
            v143[7] = v79;
            v143[8] = v80;
            v143[9] = v73;
            *((_OWORD *)v143 + 5) = 0u;
            *((_OWORD *)v143 + 6) = 0u;
            *((_OWORD *)v143 + 7) = 0u;
            v143[16] = 0;
            *((_DWORD *)v143 + 34) = 33621250;
            v143[18] = 0;
            *((unsigned char *)v143 + 152) = (_BYTE)v78;

            id v130 = v390;
            unint64_t v77 = 0x264C96000uLL;
            goto LABEL_48;
          }
LABEL_133:
          uint64_t v81 = sub_235F60628((void *)(v82 > 1), (int64_t)v59, 1, v81);
          v397 = v81;
          goto LABEL_47;
        }
LABEL_25:
        if ((v87 & 0x4000000000000000) == 0)
        {
          uint64_t v88 = *(void *)(v87 + 16);
          goto LABEL_27;
        }
        goto LABEL_131;
      }
    }
    else
    {
      uint64_t v80 = *(void *)(v79 + 16);
      swift_retain();
      if (v80) {
        goto LABEL_10;
      }
    }
    swift_release();
    unint64_t v87 = MEMORY[0x263F8EE78];
    if ((MEMORY[0x263F8EE78] & 0x8000000000000000) != 0) {
      goto LABEL_131;
    }
    goto LABEL_25;
  }
  swift_release();
  __break(1u);
}

double sub_235F5F1A8@<D0>(void **a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_235F6BF40();
  uint64_t v67 = *(void *)(v4 - 8);
  uint64_t v68 = v4;
  MEMORY[0x270FA5388](v4);
  uint64_t v66 = (char *)&v62 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_235F5B780(0, &qword_26884DCC8, MEMORY[0x263F07690], MEMORY[0x263F8D8F0]);
  uint64_t v7 = MEMORY[0x270FA5388](v6 - 8);
  uint64_t v9 = (char *)&v62 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v62 = (char *)&v62 - v10;
  uint64_t v11 = sub_235F6BF10();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v62 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = (char *)*a1;
  id v16 = sub_235F58DE0();
  id v17 = objc_msgSend(v15, sel_sortDate);
  id v18 = objc_msgSend(v17, sel_date);

  sub_235F6BEF0();
  uint64_t v19 = (void *)sub_235F6BEC0();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  id v20 = objc_msgSend(v16, sel_stringFromDate_, v19);

  uint64_t v21 = sub_235F6BFE0();
  uint64_t v64 = v22;
  uint64_t v65 = v21;

  self;
  uint64_t v23 = swift_dynamicCastObjCClass();
  if (!v23) {
    goto LABEL_6;
  }
  uint64_t v24 = (void *)v23;
  uint64_t v63 = v15;
  id v25 = objc_msgSend(v24, sel_doseNumber);
  if (!v25)
  {

LABEL_6:
    type metadata accessor for SignedClinicalDataWalletPassManager();
    uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    id v47 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
    uint64_t v41 = sub_235F6BE30();
    uint64_t v43 = v48;

    goto LABEL_9;
  }
  uint64_t v26 = v25;
  uint64_t v27 = sub_235F6BFE0();
  uint64_t v29 = v28;

  id v30 = objc_msgSend(v24, sel_doseQuantity);
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = sub_235F6BFE0();
    uint64_t v34 = v33;

    uint64_t v35 = sub_235F6BF50();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v35 - 8) + 56))(v9, 1, 1, v35);
    sub_235F5B780(0, &qword_26884DD08, (uint64_t (*)(uint64_t))sub_235F63CA8, MEMORY[0x263F8E0F8]);
    uint64_t v36 = swift_allocObject();
    *(_OWORD *)(v36 + 16) = xmmword_235F6C990;
    uint64_t v37 = MEMORY[0x263F8D310];
    *(void *)(v36 + 56) = MEMORY[0x263F8D310];
    unint64_t v38 = sub_235F63D00();
    *(void *)(v36 + 32) = v27;
    *(void *)(v36 + 40) = v29;
    *(void *)(v36 + 96) = v37;
    *(void *)(v36 + 104) = v38;
    *(void *)(v36 + 64) = v38;
    *(void *)(v36 + 72) = v32;
    *(void *)(v36 + 80) = v34;
    type metadata accessor for SignedClinicalDataWalletPassManager();
    uint64_t v39 = swift_getObjCClassFromMetadata();
    id v40 = objc_msgSend(self, sel_bundleForClass_, v39);
    sub_235F6BE30();
    uint64_t v62 = v15;

    uint64_t v41 = sub_235F6BFF0();
    uint64_t v43 = v42;
    swift_bridgeObjectRelease();

    uint64_t v15 = v62;
    swift_bridgeObjectRelease();
    char v44 = (uint64_t (*)(uint64_t))MEMORY[0x263F07690];
    uint64_t v45 = (uint64_t)v9;
  }
  else
  {
    uint64_t v49 = sub_235F6BF50();
    uint64_t v50 = v29;
    id v51 = v62;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v49 - 8) + 56))(v62, 1, 1, v49);
    sub_235F5B780(0, &qword_26884DD08, (uint64_t (*)(uint64_t))sub_235F63CA8, MEMORY[0x263F8E0F8]);
    uint64_t v52 = swift_allocObject();
    *(_OWORD *)(v52 + 16) = xmmword_235F6C960;
    *(void *)(v52 + 56) = MEMORY[0x263F8D310];
    *(void *)(v52 + 64) = sub_235F63D00();
    *(void *)(v52 + 32) = v27;
    *(void *)(v52 + 40) = v50;
    type metadata accessor for SignedClinicalDataWalletPassManager();
    uint64_t v53 = swift_getObjCClassFromMetadata();
    id v54 = objc_msgSend(self, sel_bundleForClass_, v53);
    sub_235F6BE30();

    uint64_t v41 = sub_235F6BFF0();
    uint64_t v43 = v55;
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
    char v44 = (uint64_t (*)(uint64_t))MEMORY[0x263F07690];
    uint64_t v45 = (uint64_t)v51;
  }
  sub_235F63850(v45, &qword_26884DCC8, v44);
LABEL_9:
  uint64_t v69 = 762869089;
  unint64_t v70 = 0xE400000000000000;
  id v56 = objc_msgSend(v15, sel_UUID);
  uint64_t v57 = v66;
  sub_235F6BF30();

  sub_235F63C60(&qword_26884DD00, MEMORY[0x263F07508]);
  uint64_t v58 = v68;
  sub_235F6C2C0();
  sub_235F6C020();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v67 + 8))(v57, v58);
  unint64_t v59 = v70;
  *(void *)a2 = v69;
  *(void *)(a2 + 8) = v59;
  *(void *)(a2 + 16) = v41;
  *(void *)(a2 + 24) = v43;
  uint64_t v60 = v64;
  *(void *)(a2 + 32) = v65;
  *(void *)(a2 + 40) = v60;
  *(_OWORD *)(a2 + 48) = 0u;
  *(_OWORD *)(a2 + 64) = 0u;
  *(_OWORD *)(a2 + 80) = 0u;
  *(void *)(a2 + 96) = 0;
  *(void *)&double result = 33621249;
  *(_DWORD *)(a2 + 104) = 33621249;
  *(void *)(a2 + 112) = 0;
  *(unsigned char *)(a2 + 120) = 0;
  return result;
}

double sub_235F5F998(void *a1, void *a2, void **a3)
{
  if (__OFADD__(*a2, 1))
  {
    __break(1u);
  }
  else
  {
    uint64_t v5 = a3;
    uint64_t v10 = (void *)*a1;
    ++*a2;
    sub_235F6C2C0();
    sub_235F6C020();
    swift_bridgeObjectRelease();
    unint64_t v8 = 0xEB000000002D7265;
    uint64_t v18 = 0x696669746E656469;
    uint64_t v11 = v10[2];
    if (v11)
    {
      uint64_t v9 = v10[4];
      uint64_t v4 = v10[5];
      uint64_t v12 = (uint64_t)&v10[2 * v11 + 4];
      uint64_t v3 = *(void *)(v12 - 16);
      unint64_t v6 = *(void *)(v12 - 8);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    else
    {
      uint64_t v3 = 0;
      uint64_t v9 = 0;
      uint64_t v4 = 0;
      unint64_t v6 = 0xE000000000000000;
    }
    char v19 = 1;
    uint64_t v7 = *v5;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *uint64_t v5 = v7;
    if (isUniquelyReferenced_nonNull_native) {
      goto LABEL_6;
    }
  }
  uint64_t v7 = sub_235F60628(0, v7[2] + 1, 1, v7);
  *uint64_t v5 = v7;
LABEL_6:
  unint64_t v15 = v7[2];
  unint64_t v14 = v7[3];
  if (v15 >= v14 >> 1)
  {
    uint64_t v7 = sub_235F60628((void *)(v14 > 1), v15 + 1, 1, v7);
    *uint64_t v5 = v7;
  }
  v7[2] = v15 + 1;
  id v16 = &v7[16 * v15];
  v16[4] = v18;
  v16[5] = v8;
  v16[6] = v9;
  v16[7] = v4;
  v16[8] = v3;
  v16[9] = v6;
  *((_OWORD *)v16 + 5) = 0u;
  *((_OWORD *)v16 + 6) = 0u;
  *((_OWORD *)v16 + 7) = 0u;
  v16[16] = 0;
  *(void *)&double result = 33686789;
  *((_DWORD *)v16 + 34) = 33686789;
  v16[18] = 0;
  *((unsigned char *)v16 + 152) = v19;
  return result;
}

double sub_235F5FB40@<D0>(void **a1@<X0>, char *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v53 = a2;
  sub_235F5B780(0, &qword_26884DCC8, MEMORY[0x263F07690], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v53 - v6;
  uint64_t v8 = sub_235F6BF40();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v53 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v54 = sub_235F6BF10();
  uint64_t v12 = *(void *)(v54 - 8);
  MEMORY[0x270FA5388](v54);
  unint64_t v14 = (char *)&v53 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v15 = *a1;
  self;
  uint64_t v16 = swift_dynamicCastObjCClass();
  if (!v16) {
    goto LABEL_5;
  }
  id v17 = (void *)v16;
  uint64_t v56 = v8;
  id v18 = v15;
  if (!objc_msgSend(v17, sel_notGiven, v53))
  {

    uint64_t v8 = v56;
LABEL_5:
    uint64_t v57 = 0x2D64726F636572;
    unint64_t v58 = 0xE700000000000000;
    id v43 = objc_msgSend(v15, sel_UUID, v53);
    sub_235F6BF30();

    sub_235F63C60(&qword_26884DD00, MEMORY[0x263F07508]);
    sub_235F6C2C0();
    sub_235F6C020();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    unint64_t v55 = v58;
    uint64_t v56 = v57;
    uint64_t v30 = sub_235F63E74();
    uint64_t v32 = v44;
    id v45 = sub_235F58DE0();
    id v46 = objc_msgSend(v15, sel_sortDate);
    id v47 = objc_msgSend(v46, sel_date);

    sub_235F6BEF0();
    uint64_t v48 = (void *)sub_235F6BEC0();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v54);
    id v49 = objc_msgSend(v45, sel_stringFromDate_, v48);

    uint64_t v38 = sub_235F6BFE0();
    uint64_t v40 = v50;

    char v41 = 1;
    char v42 = 2;
    goto LABEL_6;
  }
  id v19 = sub_235F58E60();
  uint64_t v53 = v7;
  id v20 = v19;
  id v21 = objc_msgSend(v18, sel_sortDate);
  id v22 = objc_msgSend(v21, sel_date);

  sub_235F6BEF0();
  uint64_t v23 = (void *)sub_235F6BEC0();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v54);
  id v24 = objc_msgSend(v20, sel_stringFromDate_, v23);

  uint64_t v54 = sub_235F6BFE0();
  uint64_t v26 = v25;

  uint64_t v57 = 0x2D64726F636572;
  unint64_t v58 = 0xE700000000000000;
  uint64_t v27 = v18;
  id v28 = objc_msgSend(v18, sel_UUID);
  sub_235F6BF30();

  sub_235F63C60(&qword_26884DD00, MEMORY[0x263F07508]);
  uint64_t v29 = v56;
  sub_235F6C2C0();
  sub_235F6C020();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v29);
  unint64_t v55 = v58;
  uint64_t v56 = v57;
  uint64_t v30 = sub_235F63E74();
  uint64_t v32 = v31;
  uint64_t v33 = sub_235F6BF50();
  uint64_t v34 = (uint64_t)v53;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v33 - 8) + 56))(v53, 1, 1, v33);
  sub_235F5B780(0, &qword_26884DD08, (uint64_t (*)(uint64_t))sub_235F63CA8, MEMORY[0x263F8E0F8]);
  uint64_t v35 = swift_allocObject();
  *(_OWORD *)(v35 + 16) = xmmword_235F6C960;
  *(void *)(v35 + 56) = MEMORY[0x263F8D310];
  *(void *)(v35 + 64) = sub_235F63D00();
  *(void *)(v35 + 32) = v54;
  *(void *)(v35 + 40) = v26;
  type metadata accessor for SignedClinicalDataWalletPassManager();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v37 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_235F6BE30();

  uint64_t v38 = sub_235F6BFF0();
  uint64_t v40 = v39;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_235F63850(v34, &qword_26884DCC8, MEMORY[0x263F07690]);
  char v41 = 2;
  char v42 = 5;
LABEL_6:
  unint64_t v51 = v55;
  *(void *)a3 = v56;
  *(void *)(a3 + 8) = v51;
  *(void *)(a3 + 16) = v30;
  *(void *)(a3 + 24) = v32;
  *(void *)(a3 + 32) = v38;
  *(void *)(a3 + 40) = v40;
  double result = 0.0;
  *(_OWORD *)(a3 + 48) = 0u;
  *(_OWORD *)(a3 + 64) = 0u;
  *(_OWORD *)(a3 + 80) = 0u;
  *(void *)(a3 + 96) = 0;
  *(unsigned char *)(a3 + 104) = v42;
  *(unsigned char *)(a3 + 105) = 5;
  *(unsigned char *)(a3 + 106) = v41;
  *(unsigned char *)(a3 + 107) = 2;
  *(void *)(a3 + 112) = 0;
  *(unsigned char *)(a3 + 120) = 1;
  return result;
}

id *SignedClinicalDataWalletPassManager.deinit()
{
  return v0;
}

uint64_t SignedClinicalDataWalletPassManager.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 40, 7);
}

uint64_t type metadata accessor for SignedClinicalDataWalletPassManager()
{
  return self;
}

uint64_t method lookup function for SignedClinicalDataWalletPassManager(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SignedClinicalDataWalletPassManager);
}

uint64_t dispatch thunk of SignedClinicalDataWalletPassManager.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 176))();
}

uint64_t dispatch thunk of SignedClinicalDataWalletPassManager.walletIsSupported.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 184))();
}

uint64_t dispatch thunk of SignedClinicalDataWalletPassManager.ensureCanAddPassToWallet(representing:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 192))();
}

uint64_t dispatch thunk of SignedClinicalDataWalletPassManager.passUniqueIDForPassInWallet(representing:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 200))();
}

uint64_t dispatch thunk of SignedClinicalDataWalletPassManager.directURLToPassInWallet(representing:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 208))();
}

uint64_t dispatch thunk of SignedClinicalDataWalletPassManager.addPassToWallet(representing:completion:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 216))();
}

uint64_t dispatch thunk of SignedClinicalDataWalletPassManager.removePassFromWallet(representing:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 224))();
}

uint64_t dispatch thunk of SignedClinicalDataWalletPassManager.removePassFromWallet(for:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 232))();
}

uint64_t dispatch thunk of SignedClinicalDataWalletPassManager.createPassBundle(for:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 248))();
}

uint64_t dispatch thunk of SignedClinicalDataWalletPassManager.createPass(using:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 256))();
}

void *sub_235F604AC()
{
  uint64_t v1 = *v0;
  double result = (void *)swift_isUniquelyReferenced_nonNull_native();
  id *v0 = v1;
  if (!result)
  {
    double result = sub_235F60628(result, v1[2] + 1, 1, v1);
    id *v0 = result;
  }
  return result;
}

void *sub_235F604F8(void *result, int64_t a2, char a3, void *a4)
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
      sub_235F63DD8(0, &qword_26884DD38, MEMORY[0x263F8D310], MEMORY[0x263F8E0F8]);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
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
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      uint64_t v13 = (void *)(MEMORY[0x263F8EE78] + 32);
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
    sub_235F6318C(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_235F60628(void *result, int64_t a2, char a3, void *a4)
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
      sub_235F63DD8(0, &qword_26884DCD0, (uint64_t)&type metadata for WalletPassField, MEMORY[0x263F8E0F8]);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 + 95;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 7);
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      uint64_t v13 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[16 * v8 + 4]) {
          memmove(v13, a4 + 4, v8 << 7);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_235F638C0(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_235F60758(uint64_t *a1)
{
  uint64_t v2 = *a1;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *a1 = v2;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
    sub_235F6308C();
  }
  uint64_t v4 = *(void *)(v2 + 16);
  v6[0] = v2 + 32;
  v6[1] = v4;
  sub_235F60BF0(v6);
  return sub_235F6C1A0();
}

void *sub_235F607D4(unint64_t a1)
{
  unint64_t v1 = a1;
  if (a1 >> 62) {
    goto LABEL_10;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v2) {
    return (void *)MEMORY[0x263F8EE78];
  }
  while (1)
  {
    if (v2 <= 0)
    {
      uint64_t v3 = (void *)MEMORY[0x263F8EE78];
    }
    else
    {
      sub_235F63DD8(0, &qword_26884DCE8, MEMORY[0x263F8EE50] + 8, MEMORY[0x263F8E0F8]);
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
    sub_235F62DAC((unint64_t)(v3 + 4), v2, v1);
    unint64_t v1 = v6;
    swift_bridgeObjectRelease();
    if (v1 == v2) {
      break;
    }
    __break(1u);
LABEL_10:
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_235F6C1E0();
    swift_bridgeObjectRelease();
    if (!v2) {
      return (void *)MEMORY[0x263F8EE78];
    }
  }
  return v3;
}

uint64_t sub_235F608F0(uint64_t a1)
{
  unint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *(void **)v1;
  int64_t v4 = *(void *)(*(void *)v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
    goto LABEL_21;
  }
  char isUniquelyReferenced_nonNull_native = (void *)swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= v3[3] >> 1)
  {
    unint64_t v8 = *(void *)(a1 + 16);
    if (v8) {
      goto LABEL_5;
    }
LABEL_18:
    if (!v2) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }
  if (v4 <= v5) {
    int64_t v15 = v4 + v2;
  }
  else {
    int64_t v15 = v4;
  }
  uint64_t v3 = sub_235F60628(isUniquelyReferenced_nonNull_native, v15, 1, v3);
  unint64_t v8 = *(void *)(a1 + 16);
  if (!v8) {
    goto LABEL_18;
  }
LABEL_5:
  uint64_t v9 = v3[2];
  if ((v3[3] >> 1) - v9 < (uint64_t)v8)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  unint64_t v10 = (unint64_t)&v3[16 * v9 + 4];
  if (a1 + 32 < v10 + (v8 << 7) && v10 < a1 + 32 + (v8 << 7)) {
    goto LABEL_24;
  }
  swift_arrayInitWithCopy();
  if (v8 < v2)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v12 = v3[2];
  BOOL v13 = __OFADD__(v12, v8);
  uint64_t v14 = v12 + v8;
  if (!v13)
  {
    v3[2] = v14;
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    *(void *)uint64_t v1 = v3;
    return result;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = sub_235F6C200();
  __break(1u);
  return result;
}

uint64_t sub_235F60A48(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_235F60A68(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_235F60A68(char a1, int64_t a2, char a3, char *a4)
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
    sub_235F63DD8(0, &qword_26884DCD0, (uint64_t)&type metadata for WalletPassField, MEMORY[0x263F8E0F8]);
    unint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 + 95;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 7);
  }
  else
  {
    unint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  BOOL v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  size_t v15 = v8 << 7;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[v15]) {
      memmove(v13, v14, v15);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[v15] || v13 >= &v14[v15])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_235F6C200();
  __break(1u);
  return result;
}

void sub_235F60BF0(uint64_t *a1)
{
  uint64_t v138 = sub_235F6BF10();
  uint64_t v2 = *(void *)(v138 - 8);
  uint64_t v3 = MEMORY[0x270FA5388](v138);
  uint64_t v137 = (char *)&v123 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  unint64_t v136 = (char *)&v123 - v5;
  uint64_t v6 = a1[1];
  uint64_t v7 = sub_235F6C2B0();
  if (v7 >= v6)
  {
    if (v6 < 0) {
      goto LABEL_133;
    }
    if (v6) {
      sub_235F61630(0, v6, 1, a1);
    }
    return;
  }
  if (v6 >= 0) {
    uint64_t v8 = v6;
  }
  else {
    uint64_t v8 = v6 + 1;
  }
  if (v6 < -1) {
    goto LABEL_141;
  }
  uint64_t v128 = v7;
  uint64_t v124 = a1;
  if (v6 < 2)
  {
    int64_t v11 = (char *)MEMORY[0x263F8EE78];
    uint64_t v141 = MEMORY[0x263F8EE78];
    id v133 = (void **)((MEMORY[0x263F8EE78] & 0xFFFFFFFFFFFFFF8) + 32);
    if (v6 != 1)
    {
      unint64_t v14 = *(void *)(MEMORY[0x263F8EE78] + 16);
LABEL_100:
      uint64_t v114 = v134;
      if (v14 >= 2)
      {
        uint64_t v115 = *v124;
        do
        {
          unint64_t v116 = v14 - 2;
          if (v14 < 2) {
            goto LABEL_128;
          }
          if (!v115) {
            goto LABEL_140;
          }
          uint64_t v117 = v11;
          uint64_t v118 = v11 + 32;
          uint64_t v119 = *(void *)&v11[16 * v116 + 32];
          uint64_t v120 = *(void *)&v11[16 * v14 + 24];
          sub_235F6189C((void **)(v115 + 8 * v119), (id *)(v115 + 8 * *(void *)&v118[16 * v14 - 16]), (id *)(v115 + 8 * v120), v133);
          if (v114) {
            break;
          }
          if (v120 < v119) {
            goto LABEL_129;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v117 = sub_235F61FC8((uint64_t)v117);
          }
          if (v116 >= *((void *)v117 + 2)) {
            goto LABEL_130;
          }
          uint64_t v121 = &v117[16 * v116 + 32];
          *(void *)uint64_t v121 = v119;
          *((void *)v121 + 1) = v120;
          unint64_t v122 = *((void *)v117 + 2);
          if (v14 > v122) {
            goto LABEL_131;
          }
          int64_t v11 = v117;
          memmove(&v117[16 * v14 + 16], &v117[16 * v14 + 32], 16 * (v122 - v14));
          *((void *)v117 + 2) = v122 - 1;
          unint64_t v14 = v122 - 1;
        }
        while (v122 > 2);
      }
LABEL_111:
      swift_bridgeObjectRelease();
      *(void *)((v141 & 0xFFFFFFFFFFFFFF8) + 0x10) = 0;
      sub_235F6C070();
      swift_bridgeObjectRelease();
      return;
    }
  }
  else
  {
    uint64_t v9 = v8 >> 1;
    sub_235F58670(0, &qword_26884DC80);
    uint64_t v10 = sub_235F6C080();
    *(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10) = v9;
    id v133 = (void **)((v10 & 0xFFFFFFFFFFFFFF8) + 32);
    uint64_t v141 = v10;
  }
  uint64_t v12 = 0;
  uint64_t v13 = *a1;
  unint64_t v135 = (void (**)(char *, uint64_t))(v2 + 8);
  uint64_t v125 = v13 - 8;
  uint64_t v126 = v13 + 16;
  int64_t v11 = (char *)MEMORY[0x263F8EE78];
  id v130 = (void *)v6;
  uint64_t v139 = v13;
  while (1)
  {
    uint64_t v15 = v12++;
    uint64_t v131 = v15;
    if (v12 < v6)
    {
      uint64_t v16 = *(void **)(v13 + 8 * v15);
      id v17 = *(id *)(v13 + 8 * v12);
      id v129 = v17;
      id v18 = v16;
      id v19 = objc_msgSend(v17, sel_sortDate);
      id v20 = objc_msgSend(v19, sel_date);

      id v21 = v136;
      sub_235F6BEF0();

      id v22 = objc_msgSend(v18, sel_sortDate);
      uint64_t v15 = v131;
      id v23 = objc_msgSend(v22, sel_date);

      id v24 = v137;
      sub_235F6BEF0();

      uint64_t v6 = (uint64_t)v130;
      LODWORD(v140) = sub_235F6BED0();
      uint64_t v25 = (char *)*v135;
      uint64_t v26 = v24;
      uint64_t v27 = v138;
      (*v135)(v26, v138);
      uint64_t v132 = v25;
      ((void (*)(char *, uint64_t))v25)(v21, v27);

      uint64_t v12 = v15 + 2;
      if (v15 + 2 < v6)
      {
        uint64_t v127 = v11;
        id v28 = (id *)(v126 + 8 * v15);
        while (1)
        {
          uint64_t v29 = *(v28 - 1);
          id v30 = *v28;
          id v31 = v29;
          id v32 = objc_msgSend(v30, sel_sortDate);
          id v33 = objc_msgSend(v32, sel_date);

          uint64_t v34 = v136;
          sub_235F6BEF0();

          id v35 = objc_msgSend(v31, sel_sortDate);
          id v36 = objc_msgSend(v35, sel_date);

          id v37 = v137;
          sub_235F6BEF0();

          LODWORD(v35) = sub_235F6BED0();
          uint64_t v38 = v37;
          uint64_t v39 = v138;
          uint64_t v40 = (void (*)(char *, uint64_t))v132;
          ((void (*)(char *, uint64_t))v132)(v38, v138);
          v40(v34, v39);

          if ((v140 ^ v35)) {
            break;
          }
          ++v12;
          ++v28;
          uint64_t v6 = (uint64_t)v130;
          if (v130 == (void *)v12)
          {
            uint64_t v12 = (uint64_t)v130;
            int64_t v11 = v127;
            goto LABEL_22;
          }
        }
        int64_t v11 = v127;
        uint64_t v6 = (uint64_t)v130;
LABEL_22:
        uint64_t v15 = v131;
      }
      uint64_t v13 = v139;
      if (v140)
      {
        if (v12 < v15) {
          goto LABEL_134;
        }
        if (v15 < v12)
        {
          char v41 = (uint64_t *)(v125 + 8 * v12);
          uint64_t v42 = v12;
          uint64_t v43 = v15;
          uint64_t v44 = (uint64_t *)(v139 + 8 * v15);
          do
          {
            if (v43 != --v42)
            {
              if (!v13) {
                goto LABEL_139;
              }
              uint64_t v45 = *v44;
              *uint64_t v44 = *v41;
              *char v41 = v45;
            }
            ++v43;
            --v41;
            ++v44;
          }
          while (v43 < v42);
        }
      }
    }
    if (v12 < v6)
    {
      if (__OFSUB__(v12, v15)) {
        goto LABEL_132;
      }
      if (v12 - v15 < v128) {
        break;
      }
    }
LABEL_50:
    if (v12 < v15) {
      goto LABEL_127;
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      int64_t v11 = sub_235F61E14(0, *((void *)v11 + 2) + 1, 1, v11);
    }
    unint64_t v63 = *((void *)v11 + 2);
    unint64_t v62 = *((void *)v11 + 3);
    unint64_t v14 = v63 + 1;
    uint64_t v13 = v139;
    if (v63 >= v62 >> 1)
    {
      v113 = sub_235F61E14((char *)(v62 > 1), v63 + 1, 1, v11);
      uint64_t v13 = v139;
      int64_t v11 = v113;
    }
    *((void *)v11 + 2) = v14;
    uint64_t v64 = v11 + 32;
    uint64_t v65 = &v11[16 * v63 + 32];
    *(void *)uint64_t v65 = v15;
    *((void *)v65 + 1) = v12;
    if (v63)
    {
      while (1)
      {
        unint64_t v66 = v14 - 1;
        if (v14 >= 4)
        {
          uint64_t v71 = &v64[16 * v14];
          uint64_t v72 = *((void *)v71 - 8);
          uint64_t v73 = *((void *)v71 - 7);
          BOOL v77 = __OFSUB__(v73, v72);
          uint64_t v74 = v73 - v72;
          if (v77) {
            goto LABEL_116;
          }
          uint64_t v76 = *((void *)v71 - 6);
          uint64_t v75 = *((void *)v71 - 5);
          BOOL v77 = __OFSUB__(v75, v76);
          uint64_t v69 = v75 - v76;
          char v70 = v77;
          if (v77) {
            goto LABEL_117;
          }
          unint64_t v78 = v14 - 2;
          unint64_t v79 = &v64[16 * v14 - 32];
          uint64_t v81 = *(void *)v79;
          uint64_t v80 = *((void *)v79 + 1);
          BOOL v77 = __OFSUB__(v80, v81);
          uint64_t v82 = v80 - v81;
          if (v77) {
            goto LABEL_119;
          }
          BOOL v77 = __OFADD__(v69, v82);
          uint64_t v83 = v69 + v82;
          if (v77) {
            goto LABEL_122;
          }
          if (v83 >= v74)
          {
            uint64_t v101 = &v64[16 * v66];
            uint64_t v103 = *(void *)v101;
            uint64_t v102 = *((void *)v101 + 1);
            BOOL v77 = __OFSUB__(v102, v103);
            uint64_t v104 = v102 - v103;
            if (v77) {
              goto LABEL_126;
            }
            BOOL v94 = v69 < v104;
            goto LABEL_87;
          }
        }
        else
        {
          if (v14 != 3)
          {
            uint64_t v95 = *((void *)v11 + 4);
            uint64_t v96 = *((void *)v11 + 5);
            BOOL v77 = __OFSUB__(v96, v95);
            uint64_t v88 = v96 - v95;
            char v89 = v77;
            goto LABEL_81;
          }
          uint64_t v68 = *((void *)v11 + 4);
          uint64_t v67 = *((void *)v11 + 5);
          BOOL v77 = __OFSUB__(v67, v68);
          uint64_t v69 = v67 - v68;
          char v70 = v77;
        }
        if (v70) {
          goto LABEL_118;
        }
        unint64_t v78 = v14 - 2;
        id v84 = &v64[16 * v14 - 32];
        uint64_t v86 = *(void *)v84;
        uint64_t v85 = *((void *)v84 + 1);
        BOOL v87 = __OFSUB__(v85, v86);
        uint64_t v88 = v85 - v86;
        char v89 = v87;
        if (v87) {
          goto LABEL_121;
        }
        uint64_t v90 = &v64[16 * v66];
        uint64_t v92 = *(void *)v90;
        uint64_t v91 = *((void *)v90 + 1);
        BOOL v77 = __OFSUB__(v91, v92);
        uint64_t v93 = v91 - v92;
        if (v77) {
          goto LABEL_124;
        }
        if (__OFADD__(v88, v93)) {
          goto LABEL_125;
        }
        if (v88 + v93 >= v69)
        {
          BOOL v94 = v69 < v93;
LABEL_87:
          if (v94) {
            unint64_t v66 = v78;
          }
          goto LABEL_89;
        }
LABEL_81:
        if (v89) {
          goto LABEL_120;
        }
        uint64_t v97 = &v64[16 * v66];
        uint64_t v99 = *(void *)v97;
        uint64_t v98 = *((void *)v97 + 1);
        BOOL v77 = __OFSUB__(v98, v99);
        uint64_t v100 = v98 - v99;
        if (v77) {
          goto LABEL_123;
        }
        if (v100 < v88) {
          goto LABEL_14;
        }
LABEL_89:
        unint64_t v105 = v66 - 1;
        if (v66 - 1 >= v14)
        {
          __break(1u);
LABEL_113:
          __break(1u);
LABEL_114:
          __break(1u);
LABEL_115:
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
          goto LABEL_136;
        }
        if (!v13) {
          goto LABEL_138;
        }
        uint64_t v106 = v11;
        uint64_t v107 = &v64[16 * v105];
        uint64_t v108 = *(void *)v107;
        id v109 = &v64[16 * v66];
        uint64_t v110 = *((void *)v109 + 1);
        uint64_t v111 = v134;
        sub_235F6189C((void **)(v13 + 8 * *(void *)v107), (id *)(v13 + 8 * *(void *)v109), (id *)(v13 + 8 * v110), v133);
        uint64_t v134 = v111;
        if (v111) {
          goto LABEL_111;
        }
        if (v110 < v108) {
          goto LABEL_113;
        }
        if (v66 > *((void *)v106 + 2)) {
          goto LABEL_114;
        }
        *(void *)uint64_t v107 = v108;
        *(void *)&v64[16 * v105 + 8] = v110;
        unint64_t v112 = *((void *)v106 + 2);
        if (v66 >= v112) {
          goto LABEL_115;
        }
        int64_t v11 = v106;
        unint64_t v14 = v112 - 1;
        memmove(&v64[16 * v66], v109 + 16, 16 * (v112 - 1 - v66));
        *((void *)v106 + 2) = v112 - 1;
        uint64_t v13 = v139;
        if (v112 <= 2) {
          goto LABEL_14;
        }
      }
    }
    unint64_t v14 = 1;
LABEL_14:
    uint64_t v6 = (uint64_t)v130;
    if (v12 >= (uint64_t)v130) {
      goto LABEL_100;
    }
  }
  if (__OFADD__(v15, v128)) {
    goto LABEL_135;
  }
  if (v15 + v128 >= v6) {
    id v46 = (id)v6;
  }
  else {
    id v46 = (id)(v15 + v128);
  }
  if ((uint64_t)v46 >= v15)
  {
    if ((id)v12 != v46)
    {
      uint64_t v127 = v11;
      id v47 = (char *)(v125 + 8 * v12);
      id v129 = v46;
      do
      {
        uint64_t v48 = *(void **)(v13 + 8 * v12);
        uint64_t v132 = v47;
        while (1)
        {
          id v49 = *(void **)v47;
          id v50 = v48;
          id v140 = v50;
          id v51 = v49;
          id v52 = objc_msgSend(v50, sel_sortDate);
          id v53 = objc_msgSend(v52, sel_date);

          uint64_t v54 = v136;
          sub_235F6BEF0();

          id v55 = objc_msgSend(v51, sel_sortDate);
          id v56 = objc_msgSend(v55, sel_date);

          uint64_t v57 = v137;
          sub_235F6BEF0();

          LOBYTE(v55) = sub_235F6BED0();
          unint64_t v58 = *v135;
          unint64_t v59 = v57;
          uint64_t v60 = v138;
          (*v135)(v59, v138);
          v58(v54, v60);

          if ((v55 & 1) == 0) {
            break;
          }
          uint64_t v13 = v139;
          if (!v139) {
            goto LABEL_137;
          }
          uint64_t v61 = *(void *)v47;
          uint64_t v48 = (void *)*((void *)v47 + 1);
          *(void *)id v47 = v48;
          *((void *)v47 + 1) = v61;
          v47 -= 8;
          if (v12 == ++v15) {
            goto LABEL_43;
          }
        }
        uint64_t v13 = v139;
LABEL_43:
        ++v12;
        uint64_t v15 = v131;
        id v47 = v132 + 8;
      }
      while ((id)v12 != v129);
      uint64_t v12 = (uint64_t)v129;
      int64_t v11 = v127;
    }
    goto LABEL_50;
  }
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
  sub_235F6C1D0();
  __break(1u);
}

void sub_235F61630(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v31 = a1;
  uint64_t v36 = sub_235F6BF10();
  uint64_t v7 = MEMORY[0x270FA5388](v36);
  id v35 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v34 = (char *)&v29 - v10;
  uint64_t v30 = a2;
  if (a3 != a2)
  {
    uint64_t v11 = *a4;
    id v33 = (void (**)(char *, uint64_t))(v9 + 8);
    uint64_t v37 = v11;
    uint64_t v12 = v11 + 8 * a3 - 8;
LABEL_5:
    uint64_t v13 = *(void **)(v37 + 8 * a3);
    uint64_t v14 = v31;
    uint64_t v32 = v12;
    uint64_t v38 = a3;
    while (1)
    {
      uint64_t v15 = *(void **)v12;
      id v16 = v13;
      id v17 = v15;
      id v18 = objc_msgSend(v16, sel_sortDate);
      id v19 = objc_msgSend(v18, sel_date);

      id v20 = v34;
      sub_235F6BEF0();

      id v21 = objc_msgSend(v17, sel_sortDate);
      id v22 = objc_msgSend(v21, sel_date);

      id v23 = v35;
      sub_235F6BEF0();

      LOBYTE(v21) = sub_235F6BED0();
      id v24 = *v33;
      uint64_t v25 = v23;
      uint64_t v26 = v36;
      (*v33)(v25, v36);
      v24(v20, v26);
      uint64_t v27 = v38;

      if ((v21 & 1) == 0)
      {
LABEL_4:
        a3 = v27 + 1;
        uint64_t v12 = v32 + 8;
        if (a3 == v30) {
          return;
        }
        goto LABEL_5;
      }
      if (!v37) {
        break;
      }
      id v28 = *(void **)v12;
      uint64_t v13 = *(void **)(v12 + 8);
      *(void *)uint64_t v12 = v13;
      *(void *)(v12 + 8) = v28;
      v12 -= 8;
      if (v27 == ++v14) {
        goto LABEL_4;
      }
    }
    __break(1u);
  }
}

uint64_t sub_235F6189C(void **a1, id *a2, id *a3, void **a4)
{
  uint64_t v62 = sub_235F6BF10();
  uint64_t v8 = *(void *)(v62 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v62);
  uint64_t v61 = (char *)&v53 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  unint64_t v59 = a3;
  uint64_t v60 = (char *)&v53 - v11;
  uint64_t v12 = (char *)a2 - (char *)a1;
  uint64_t v13 = (char *)a2 - (char *)a1 + 7;
  if ((char *)a2 - (char *)a1 >= 0) {
    uint64_t v13 = (char *)a2 - (char *)a1;
  }
  uint64_t v14 = v13 >> 3;
  uint64_t v15 = (char *)a3 - (char *)a2;
  uint64_t v16 = v15 / 8;
  unint64_t v63 = a1;
  unint64_t v66 = a1;
  uint64_t v65 = a4;
  if (v13 >> 3 >= v15 / 8)
  {
    if (v15 < -7) {
      goto LABEL_43;
    }
    if (a4 != a2 || &a2[v16] <= a4) {
      memmove(a4, a2, 8 * v16);
    }
    id v33 = &a4[v16];
    uint64_t v64 = v33;
    unint64_t v66 = a2;
    if (v15 < 8 || v63 >= a2) {
      goto LABEL_42;
    }
    uint64_t v54 = (void (**)(char *, uint64_t))(v8 + 8);
    id v55 = a4;
    uint64_t v34 = v59 - 1;
    id v35 = a2;
    while (1)
    {
      unint64_t v58 = v33;
      unint64_t v59 = v34 + 1;
      uint64_t v38 = *--v33;
      uint64_t v37 = v38;
      uint64_t v39 = *--v35;
      uint64_t v40 = v37;
      uint64_t v57 = (void (**)(char *, uint64_t))v40;
      id v41 = v39;
      id v56 = v41;
      id v42 = objc_msgSend(v40, sel_sortDate);
      id v43 = objc_msgSend(v42, sel_date);

      uint64_t v44 = v60;
      sub_235F6BEF0();

      id v45 = objc_msgSend(v41, sel_sortDate);
      id v46 = objc_msgSend(v45, sel_date);

      id v47 = v61;
      sub_235F6BEF0();

      LOBYTE(v45) = sub_235F6BED0();
      uint64_t v48 = *v54;
      id v49 = v47;
      uint64_t v50 = v62;
      (*v54)(v49, v62);
      v48(v44, v50);

      if (v45) {
        break;
      }
      uint64_t v64 = v33;
      if (v59 < v58 || v34 >= v58)
      {
        *uint64_t v34 = *v33;
        id v35 = a2;
        goto LABEL_30;
      }
      unint64_t v51 = (unint64_t)v55;
      uint64_t v36 = v63;
      if (v59 != v58) {
        *uint64_t v34 = *v33;
      }
      id v35 = a2;
      if ((unint64_t)v33 <= v51) {
        goto LABEL_42;
      }
LABEL_31:
      --v34;
      a2 = v35;
      if (v35 <= v36) {
        goto LABEL_42;
      }
    }
    id v33 = v58;
    if (v59 != a2 || v34 >= a2) {
      *uint64_t v34 = *v35;
    }
    unint64_t v66 = v35;
LABEL_30:
    uint64_t v36 = v63;
    if (v33 <= v55) {
      goto LABEL_42;
    }
    goto LABEL_31;
  }
  if (v12 >= -7)
  {
    id v17 = v63;
    if (a4 != v63 || &v63[v14] <= a4) {
      memmove(a4, v63, 8 * v14);
    }
    unint64_t v58 = &a4[v14];
    uint64_t v64 = v58;
    if (v12 >= 8 && a2 < v59)
    {
      uint64_t v57 = (void (**)(char *, uint64_t))(v8 + 8);
      do
      {
        unint64_t v63 = v17;
        id v18 = *a4;
        id v19 = *a2;
        id v20 = v18;
        id v21 = a4;
        id v22 = objc_msgSend(v19, sel_sortDate);
        id v23 = objc_msgSend(v22, sel_date);

        id v24 = v60;
        sub_235F6BEF0();

        id v25 = objc_msgSend(v20, sel_sortDate);
        id v26 = objc_msgSend(v25, sel_date);

        uint64_t v27 = v61;
        sub_235F6BEF0();

        LOBYTE(v25) = sub_235F6BED0();
        id v28 = *v57;
        uint64_t v29 = v27;
        uint64_t v30 = v62;
        (*v57)(v29, v62);
        v28(v24, v30);

        if (v25)
        {
          unint64_t v31 = (unint64_t)(a2 + 1);
          uint64_t v32 = v63;
          a4 = v21;
          if (v63 < a2 || (unint64_t)v63 >= v31 || v63 != a2) {
            *unint64_t v63 = *a2;
          }
        }
        else
        {
          uint64_t v32 = v63;
          if (v63 != v21) {
            *unint64_t v63 = *v21;
          }
          a4 = v21 + 1;
          uint64_t v65 = v21 + 1;
          unint64_t v31 = (unint64_t)a2;
        }
        id v17 = v32 + 1;
        unint64_t v66 = v17;
        if (a4 >= v58) {
          break;
        }
        a2 = (id *)v31;
      }
      while (v31 < (unint64_t)v59);
    }
LABEL_42:
    sub_235F61F0C((void **)&v66, (const void **)&v65, &v64);
    return 1;
  }
LABEL_43:
  uint64_t result = sub_235F6C200();
  __break(1u);
  return result;
}

char *sub_235F61E14(char *result, int64_t a2, char a3, char *a4)
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
    sub_235F63D54();
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
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
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

char *sub_235F61F0C(void **a1, const void **a2, void *a3)
{
  uint64_t v3 = (char *)*a2;
  uint64_t v4 = *a3 - (void)v3;
  uint64_t v5 = v4 + 7;
  if (v4 >= 0) {
    uint64_t v5 = *a3 - (void)v3;
  }
  if (v4 <= -8)
  {
    uint64_t result = (char *)sub_235F6C200();
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

char *sub_235F61FC8(uint64_t a1)
{
  return sub_235F61E14(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_235F61FDC(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  sub_235F6C350();
  swift_bridgeObjectRetain();
  sub_235F6C010();
  uint64_t v8 = sub_235F6C370();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    uint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_235F6C2E0() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v14 = (uint64_t *)(*(void *)(*v3 + 48) + 16 * v10);
      uint64_t v15 = v14[1];
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
      id v18 = (void *)(v11 + 16 * v10);
      BOOL v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_235F6C2E0() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_235F62494(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *uint64_t v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_235F6218C()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_235F63E24(0, &qword_26884DD40, MEMORY[0x263F8D310], MEMORY[0x263F8D320], MEMORY[0x263F8DBD8]);
  uint64_t v3 = sub_235F6C130();
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
      sub_235F6C350();
      sub_235F6C010();
      uint64_t result = sub_235F6C370();
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
      *BOOL v13 = v20;
      v13[1] = v21;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

uint64_t sub_235F62494(uint64_t result, uint64_t a2, unint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v8 = result;
  unint64_t v9 = *(void *)(*v4 + 16);
  unint64_t v10 = *(void *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0) {
    goto LABEL_22;
  }
  if (a4)
  {
    sub_235F6218C();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (uint64_t)sub_235F62630();
      goto LABEL_22;
    }
    sub_235F6280C();
  }
  uint64_t v11 = *v4;
  sub_235F6C350();
  sub_235F6C010();
  uint64_t result = sub_235F6C370();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    unint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = sub_235F6C2E0(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = sub_235F6C2F0();
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
          uint64_t result = sub_235F6C2E0();
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
  uint64_t v21 = (uint64_t *)(*(void *)(v20 + 48) + 16 * a3);
  uint64_t *v21 = v8;
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

void *sub_235F62630()
{
  uint64_t v1 = v0;
  sub_235F63E24(0, &qword_26884DD40, MEMORY[0x263F8D310], MEMORY[0x263F8D320], MEMORY[0x263F8DBD8]);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_235F6C120();
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
    *BOOL v19 = *v17;
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

uint64_t sub_235F6280C()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_235F63E24(0, &qword_26884DD40, MEMORY[0x263F8D310], MEMORY[0x263F8D320], MEMORY[0x263F8DBD8]);
  uint64_t v3 = sub_235F6C130();
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
    sub_235F6C350();
    swift_bridgeObjectRetain();
    sub_235F6C010();
    uint64_t result = sub_235F6C370();
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
    *int64_t v13 = v20;
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

void (*sub_235F62AE4(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(void *a1)
{
  uint64_t v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_235F62B94(v6, a2, a3);
  return sub_235F62B4C;
}

void sub_235F62B4C(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);
  free(v1);
}

void (*sub_235F62B94(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  uint64_t v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    id v4 = (id)MEMORY[0x237DF95D0](a2, a3);
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
    return sub_235F62C14;
  }
  __break(1u);
  return result;
}

void sub_235F62C14(id *a1)
{
}

uint64_t sub_235F62C1C(uint64_t result, unint64_t a2)
{
  uint64_t v2 = result;
  if (!(a2 >> 62))
  {
    if (*(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10) >= result) {
      goto LABEL_3;
    }
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  swift_bridgeObjectRetain();
  uint64_t v3 = sub_235F6C1E0();
  uint64_t result = swift_bridgeObjectRelease();
  if (v3 < v2) {
    goto LABEL_6;
  }
LABEL_3:
  if (v2 < 0) {
LABEL_7:
  }
    __break(1u);
  return result;
}

uint64_t sub_235F62C9C(uint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v5 = result;
  if ((a3 & 0xC000000000000001) == 0) {
    goto LABEL_7;
  }
  if (a2 < result)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  if (result == a2)
  {
LABEL_7:
    if (a3 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v7 = sub_235F6C1F0();
      swift_bridgeObjectRelease();
      return v7;
    }
    if ((a2 & 0x8000000000000000) == 0)
    {
      uint64_t v7 = a3 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain();
      return v7;
    }
    __break(1u);
    goto LABEL_13;
  }
  if (result < a2)
  {
    sub_235F58670(0, &qword_26884DC80);
    uint64_t result = v5;
    do
    {
      uint64_t v6 = result + 1;
      sub_235F6C160();
      uint64_t result = v6;
    }
    while (a2 != v6);
    goto LABEL_7;
  }
LABEL_14:
  __break(1u);
  return result;
}

uint64_t sub_235F62DAC(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_235F6C1E0();
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
    uint64_t v10 = sub_235F6C1E0();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_235F63BF8();
        sub_235F63C60(&qword_26884DCF8, (void (*)(uint64_t))sub_235F63BF8);
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          unint64_t v12 = sub_235F62AE4(v16, i, a3);
          id v14 = *v13;
          ((void (*)(void (**)(id *), void))v12)(v16, 0);
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
    sub_235F58670(0, &qword_26884DC80);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = sub_235F6C200();
  __break(1u);
  return result;
}

uint64_t sub_235F62FEC(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 56);
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
  unint64_t v1 = *(void *)(a1 + 64);
  if (v1)
  {
    uint64_t v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  if (v6 < 8) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 72);
  if (v1)
  {
    uint64_t v2 = 128;
    return __clz(__rbit64(v1)) + v2;
  }
  unint64_t v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 3) {
    unint64_t v7 = 3;
  }
  unint64_t v8 = v7 - 3;
  uint64_t v9 = (unint64_t *)(a1 + 80);
  uint64_t v2 = 128;
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

void sub_235F6308C()
{
}

uint64_t sub_235F630A0(uint64_t result, int a2, uint64_t a3, uint64_t a4)
{
  if (result < 0 || 1 << *(unsigned char *)(a4 + 32) <= result)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (((*(void *)(a4 + 8 * ((unint64_t)result >> 6) + 56) >> result) & 1) == 0)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (*(_DWORD *)(a4 + 36) == a2) {
    return *(void *)(*(void *)(a4 + 48) + 16 * result);
  }
LABEL_8:
  __break(1u);
  return result;
}

uint64_t sub_235F630F4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = sub_235F6C0A0();
  uint64_t v8 = result;
  if (v2)
  {
    id v4 = (uint64_t *)(a1 + 40);
    do
    {
      uint64_t v5 = *(v4 - 1);
      uint64_t v6 = *v4;
      swift_bridgeObjectRetain();
      sub_235F61FDC(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

uint64_t sub_235F6318C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  uint64_t result = sub_235F6C200();
  __break(1u);
  return result;
}

uint64_t sub_235F63280(void *a1)
{
  id v2 = objc_msgSend(a1, sel_credentialTypes);
  uint64_t v3 = (void *)sub_235F6C060();

  uint64_t v4 = sub_235F6BFE0();
  sub_235F586AC(v4, v5, v3);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  type metadata accessor for SignedClinicalDataWalletPassManager();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v7 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v8 = sub_235F6BE30();

  id v9 = objc_msgSend(a1, sel_items, 0xE000000000000000);
  sub_235F58670(0, (unint64_t *)&qword_26884DD30);
  unint64_t v10 = sub_235F6C060();

  if (v10 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_235F6C1E0();
    uint64_t v11 = result;
  }
  else
  {
    uint64_t v11 = *(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
  }
  uint64_t v30 = v8;
  uint64_t v29 = ObjCClassFromMetadata;
  if (!v11)
  {
    id v14 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_18;
  }
  if (v11 >= 1)
  {
    uint64_t v13 = 0;
    id v14 = (void *)MEMORY[0x263F8EE78];
    do
    {
      if ((v10 & 0xC000000000000001) != 0) {
        id v15 = (id)MEMORY[0x237DF95D0](v13, v10);
      }
      else {
        id v15 = *(id *)(v10 + 8 * v13 + 32);
      }
      int64_t v16 = v15;
      id v17 = objc_msgSend(v15, sel_primaryConcept);
      id v18 = objc_msgSend(v17, sel_localizedPreferredName);

      if (v18)
      {
        uint64_t v19 = sub_235F6BFE0();
        uint64_t v21 = v20;

        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          id v14 = sub_235F604F8(0, v14[2] + 1, 1, v14);
        }
        unint64_t v23 = v14[2];
        unint64_t v22 = v14[3];
        if (v23 >= v22 >> 1) {
          id v14 = sub_235F604F8((void *)(v22 > 1), v23 + 1, 1, v14);
        }
        v14[2] = v23 + 1;
        unint64_t v24 = &v14[2 * v23];
        v24[4] = v19;
        v24[5] = v21;
      }
      else
      {
      }
      ++v13;
    }
    while (v11 != v13);
LABEL_18:
    swift_bridgeObjectRelease_n();
    uint64_t v25 = sub_235F630F4((uint64_t)v14);
    swift_bridgeObjectRelease();
    sub_235F58CD0(v25);
    if (v26)
    {
      uint64_t v27 = *(void *)(v25 + 16);
      swift_bridgeObjectRelease();
      if (v27 == 1) {
        return v30;
      }
      swift_bridgeObjectRelease();
      id v28 = objc_msgSend(self, sel_bundleForClass_, v29);
      sub_235F6BE30();
    }
    else
    {
      swift_bridgeObjectRelease();
      id v28 = objc_msgSend(a1, sel_recordItemsDisplayName);
      sub_235F6BFE0();
    }

    return v30;
  }
  __break(1u);
  return result;
}

void sub_235F6369C(uint64_t a1, uint64_t a2, unint64_t a3)
{
  int64_t v4 = a3 >> 1;
  uint64_t v28 = a2;
  uint64_t v5 = (a3 >> 1) - a2;
  if (__OFSUB__(a3 >> 1, a2)) {
    goto LABEL_18;
  }
  uint64_t v6 = v3;
  if (v5)
  {
    uint64_t v27 = MEMORY[0x263F8EE78];
    sub_235F60A48(0, v5 & ~(v5 >> 63), 0);
    if (v5 < 0)
    {
LABEL_19:
      __break(1u);
      return;
    }
    BOOL v8 = 0;
    uint64_t v9 = v27;
    uint64_t v10 = a1 - 8;
    uint64_t v11 = 1;
    while (!v8 && v4 > v28)
    {
      unint64_t v24 = *(void **)(v10 + 8 * v4);
      unint64_t v12 = v24;
      sub_235F5F1A8(&v24, (uint64_t)v25);
      if (v6)
      {
        swift_release();

        return;
      }
      uint64_t v6 = 0;

      long long v19 = v25[2];
      long long v20 = v25[3];
      *(_OWORD *)&v23[9] = *(_OWORD *)((char *)v26 + 9);
      long long v22 = v25[5];
      *(_OWORD *)unint64_t v23 = v26[0];
      long long v21 = v25[4];
      long long v17 = v25[0];
      long long v18 = v25[1];
      uint64_t v27 = v9;
      unint64_t v14 = *(void *)(v9 + 16);
      unint64_t v13 = *(void *)(v9 + 24);
      if (v14 >= v13 >> 1)
      {
        sub_235F60A48(v13 > 1, v14 + 1, 1);
        uint64_t v9 = v27;
      }
      *(void *)(v9 + 16) = v14 + 1;
      id v15 = (_OWORD *)(v9 + (v14 << 7));
      v15[4] = v19;
      v15[5] = v20;
      v15[2] = v17;
      v15[3] = v18;
      *(_OWORD *)((char *)v15 + 137) = *(_OWORD *)&v23[9];
      v15[7] = v22;
      v15[8] = *(_OWORD *)v23;
      v15[6] = v21;
      if (v5 == v11) {
        return;
      }
      BOOL v8 = v11 >= v5;
      --v4;
      if (__OFADD__(v11++, 1)) {
        goto LABEL_17;
      }
    }
    __break(1u);
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
}

uint64_t sub_235F63850(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t))
{
  sub_235F5B780(0, a2, a3, MEMORY[0x263F8D8F0]);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  return a1;
}

uint64_t sub_235F638C0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + (a1 << 7) + 32;
    unint64_t v6 = a3 + (v4 << 7);
    if (v5 >= v6 || v5 + (v4 << 7) <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_235F6C200();
  __break(1u);
  return result;
}

uint64_t sub_235F639B4(unint64_t a1, char *a2)
{
  uint64_t v3 = v2;
  uint64_t v25 = a2;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_235F6C1E0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v5 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v6 = MEMORY[0x263F8EE78];
  if (!v5) {
    return v6;
  }
  uint64_t v24 = MEMORY[0x263F8EE78];
  uint64_t result = sub_235F60A48(0, v5 & ~(v5 >> 63), 0);
  if ((v5 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = 0;
    uint64_t v6 = v24;
    while (1)
    {
      id v9 = (a1 & 0xC000000000000001) != 0 ? (id)MEMORY[0x237DF95D0](v8, a1) : *(id *)(a1 + 8 * v8 + 32);
      uint64_t v10 = v9;
      long long v21 = v9;
      sub_235F5FB40(&v21, v25, (uint64_t)v22);
      if (v3) {
        break;
      }
      uint64_t v3 = 0;

      long long v16 = v22[2];
      long long v17 = v22[3];
      *(_OWORD *)&v20[9] = *(_OWORD *)((char *)v23 + 9);
      long long v19 = v22[5];
      *(_OWORD *)long long v20 = v23[0];
      long long v18 = v22[4];
      long long v14 = v22[0];
      long long v15 = v22[1];
      uint64_t v24 = v6;
      unint64_t v12 = *(void *)(v6 + 16);
      unint64_t v11 = *(void *)(v6 + 24);
      if (v12 >= v11 >> 1)
      {
        sub_235F60A48(v11 > 1, v12 + 1, 1);
        uint64_t v6 = v24;
      }
      ++v8;
      *(void *)(v6 + 16) = v12 + 1;
      unint64_t v13 = (_OWORD *)(v6 + (v12 << 7));
      v13[4] = v16;
      v13[5] = v17;
      id v13[2] = v14;
      v13[3] = v15;
      *(_OWORD *)((char *)v13 + 137) = *(_OWORD *)&v20[9];
      v13[7] = v19;
      v13[8] = *(_OWORD *)v20;
      v13[6] = v18;
      if (v5 == v8) {
        return v6;
      }
    }
    swift_release();

    return v6;
  }
  __break(1u);
  return result;
}

unint64_t sub_235F63B78()
{
  unint64_t result = qword_26884DCE0;
  if (!qword_26884DCE0)
  {
    sub_235F63DD8(255, &qword_26884DCD8, MEMORY[0x263F8D310], MEMORY[0x263F8D488]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26884DCE0);
  }
  return result;
}

void sub_235F63BF8()
{
  if (!qword_26884DCF0)
  {
    sub_235F58670(255, &qword_26884DC80);
    unint64_t v0 = sub_235F6C090();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26884DCF0);
    }
  }
}

uint64_t sub_235F63C60(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_235F63CA8()
{
  unint64_t result = qword_26884DD10;
  if (!qword_26884DD10)
  {
    unint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_26884DD10);
  }
  return result;
}

unint64_t sub_235F63D00()
{
  unint64_t result = qword_26884DD18;
  if (!qword_26884DD18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26884DD18);
  }
  return result;
}

void sub_235F63D54()
{
  if (!qword_26884DD20)
  {
    sub_235F63E24(255, &qword_26884DD28, MEMORY[0x263F8D6C8], MEMORY[0x263F8D6E0], MEMORY[0x263F8D870]);
    unint64_t v0 = sub_235F6C2D0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26884DD20);
    }
  }
}

void sub_235F63DD8(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void, uint64_t))
{
  if (!*a2)
  {
    unint64_t v5 = a4(0, a3);
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

void sub_235F63E24(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void, uint64_t, uint64_t))
{
  if (!*a2)
  {
    unint64_t v6 = a5(0, a3, a4);
    if (!v7) {
      atomic_store(v6, a2);
    }
  }
}

uint64_t sub_235F63E74()
{
  id v1 = objc_msgSend(v0, sel_primaryConcept);
  id v2 = objc_msgSend(v1, sel_localizedPreferredName);

  if (v2)
  {
    uint64_t v3 = sub_235F6BFE0();
    unint64_t v5 = v4;

    uint64_t v6 = HIBYTE(v5) & 0xF;
    if ((v5 & 0x2000000000000000) == 0) {
      uint64_t v6 = v3 & 0xFFFFFFFFFFFFLL;
    }
    if (v6) {
      return v3;
    }
    swift_bridgeObjectRelease();
  }
  uint64_t v7 = sub_235F63F90();
  uint64_t v9 = HIBYTE(v8) & 0xF;
  if ((v8 & 0x2000000000000000) == 0) {
    uint64_t v9 = v7 & 0xFFFFFFFFFFFFLL;
  }
  if (v9) {
    return v7;
  }
  swift_bridgeObjectRelease();
  uint64_t v7 = sub_235F641A8();
  uint64_t v11 = HIBYTE(v10) & 0xF;
  if ((v10 & 0x2000000000000000) == 0) {
    uint64_t v11 = v7 & 0xFFFFFFFFFFFFLL;
  }
  if (v11) {
    return v7;
  }
  swift_bridgeObjectRelease();
  id v13 = objc_msgSend(v0, sel_fallbackDisplayString);
  uint64_t v14 = sub_235F6BFE0();

  return v14;
}

uint64_t sub_235F63F90()
{
  id v1 = objc_msgSend(v0, sel_medicalRecordCodings);
  sub_235F58670(0, &qword_26884DD48);
  unint64_t v2 = sub_235F6C060();

  if (v2 >> 62)
  {
LABEL_16:
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_235F6C1E0();
    if (v3) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v3)
    {
LABEL_3:
      id v15 = self;
      uint64_t v4 = 4;
      do
      {
        if ((v2 & 0xC000000000000001) != 0) {
          id v5 = (id)MEMORY[0x237DF95D0](v4 - 4, v2);
        }
        else {
          id v5 = *(id *)(v2 + 8 * v4);
        }
        uint64_t v6 = v5;
        uint64_t v7 = v4 - 3;
        if (__OFADD__(v4 - 4, 1))
        {
          __break(1u);
          goto LABEL_16;
        }
        id v8 = objc_msgSend(v5, sel_codingSystem);
        id v9 = objc_msgSend(v15, sel_textSystem);
        if (v8)
        {
          sub_235F58670(0, &qword_26884DD50);
          id v10 = v8;
          char v11 = sub_235F6C0C0();

          if (v11)
          {
            swift_bridgeObjectRelease_n();
            id v12 = objc_msgSend(v6, sel_displayString);

            if (!v12) {
              return 0;
            }
            uint64_t v13 = sub_235F6BFE0();

            return v13;
          }
          id v9 = v6;
        }
        else
        {
        }
        ++v4;
      }
      while (v7 != v3);
    }
  }
  swift_bridgeObjectRelease_n();
  return 0;
}

uint64_t sub_235F641A8()
{
  id v1 = objc_msgSend(v0, sel_medicalRecordCodings);
  sub_235F58670(0, &qword_26884DD48);
  unint64_t v2 = sub_235F6C060();

  if (!(v2 >> 62))
  {
    uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v3) {
      goto LABEL_3;
    }
LABEL_17:
    swift_bridgeObjectRelease_n();
    return 0;
  }
LABEL_16:
  swift_bridgeObjectRetain();
  uint64_t v3 = sub_235F6C1E0();
  if (!v3) {
    goto LABEL_17;
  }
LABEL_3:
  uint64_t v4 = 4;
  while (1)
  {
    if ((v2 & 0xC000000000000001) != 0) {
      id v5 = (id)MEMORY[0x237DF95D0](v4 - 4, v2);
    }
    else {
      id v5 = *(id *)(v2 + 8 * v4);
    }
    uint64_t v6 = v5;
    uint64_t v7 = v4 - 3;
    if (__OFADD__(v4 - 4, 1))
    {
      __break(1u);
      goto LABEL_16;
    }
    id v8 = objc_msgSend(v5, sel_displayString);
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = sub_235F6BFE0();
      unint64_t v12 = v11;

      swift_bridgeObjectRelease();
      uint64_t v13 = HIBYTE(v12) & 0xF;
      if ((v12 & 0x2000000000000000) == 0) {
        uint64_t v13 = v10 & 0xFFFFFFFFFFFFLL;
      }
      if (v13) {
        break;
      }
    }

    ++v4;
    if (v7 == v3) {
      goto LABEL_17;
    }
  }
  swift_bridgeObjectRelease_n();
  id v14 = objc_msgSend(v6, sel_displayString);

  if (!v14) {
    return 0;
  }
  uint64_t v15 = sub_235F6BFE0();

  return v15;
}

unint64_t HKSignedClinicalDataRecord.appLaunchURL.getter()
{
  sub_235F65B58(0, (unint64_t *)&qword_26884DC70, MEMORY[0x263F07508]);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)&v29 - v2;
  uint64_t v4 = sub_235F6BF40();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  id v8 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v29 - v9;
  id v11 = objc_msgSend(v0, sel_items);
  sub_235F64874();
  unint64_t v12 = sub_235F6C060();

  if (!(v12 >> 62))
  {
    if (*(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_3;
    }
LABEL_9:
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v3, 1, 1, v4);
    goto LABEL_10;
  }
  swift_bridgeObjectRetain();
  uint64_t v18 = sub_235F6C1E0();
  swift_bridgeObjectRelease();
  if (!v18) {
    goto LABEL_9;
  }
LABEL_3:
  if ((v12 & 0xC000000000000001) != 0)
  {
    id v13 = (id)MEMORY[0x237DF95D0](0, v12);
LABEL_6:
    id v14 = v13;
    swift_bridgeObjectRelease();
    id v15 = objc_msgSend(v14, sel_medicalRecordSampleID);

    sub_235F6BF30();
    long long v16 = *(void (**)(char *, char *, uint64_t))(v5 + 32);
    v16(v3, v8, v4);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v5 + 56))(v3, 0, 1, v4);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) != 1)
    {
      v16(v10, v3, v4);
      uint64_t v30 = 0;
      unint64_t v31 = 0xE000000000000000;
      sub_235F6C140();
      swift_bridgeObjectRelease();
      uint64_t v30 = 0xD000000000000022;
      unint64_t v31 = 0x8000000235F6DC50;
      sub_235F6BF20();
      sub_235F6C020();
      swift_bridgeObjectRelease();
      unint64_t v17 = v30;
      (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
      return v17;
    }
LABEL_10:
    sub_235F65BAC((uint64_t)v3, (unint64_t *)&qword_26884DC70, MEMORY[0x263F07508]);
    if (qword_26884DC68 == -1) {
      goto LABEL_11;
    }
    goto LABEL_17;
  }
  if (*(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v13 = *(id *)(v12 + 32);
    goto LABEL_6;
  }
  __break(1u);
LABEL_17:
  swift_once();
LABEL_11:
  uint64_t v19 = sub_235F6BFA0();
  __swift_project_value_buffer(v19, (uint64_t)qword_26884EE00);
  id v20 = v0;
  long long v21 = sub_235F6BF90();
  os_log_type_t v22 = sub_235F6C0B0();
  unint64_t v17 = 0xD000000000000022;
  if (os_log_type_enabled(v21, v22))
  {
    unint64_t v23 = (uint8_t *)swift_slowAlloc();
    uint64_t v24 = swift_slowAlloc();
    uint64_t v32 = v24;
    *(_DWORD *)unint64_t v23 = 136315138;
    id v25 = (id)HKSensitiveLogItem();
    sub_235F6C100();
    swift_unknownObjectRelease();
    uint64_t v26 = sub_235F6C000();
    uint64_t v30 = sub_235F65508(v26, v27, &v32);
    sub_235F6C0E0();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_235F56000, v21, v22, "unable to construct deep link to %s, no valid record", v23, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x237DF9C30](v24, -1, -1);
    MEMORY[0x237DF9C30](v23, -1, -1);
  }
  else
  {
  }
  return v17;
}

unint64_t sub_235F64874()
{
  unint64_t result = qword_26884DD30;
  if (!qword_26884DD30)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26884DD30);
  }
  return result;
}

uint64_t HKSignedClinicalDataRecord.isCOVID19RecordType.getter()
{
  return sub_235F648D8();
}

uint64_t HKSignedClinicalDataRecord.isImmunizationRecordType.getter()
{
  return sub_235F648D8();
}

uint64_t HKSignedClinicalDataRecord.isLabRecordType.getter()
{
  return sub_235F648D8();
}

uint64_t sub_235F648D8()
{
  id v1 = objc_msgSend(v0, sel_credentialTypes);
  uint64_t v2 = (void *)sub_235F6C060();

  uint64_t v3 = sub_235F6BFE0();
  LOBYTE(v1) = sub_235F586AC(v3, v4, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v1 & 1;
}

BOOL HKSignedClinicalDataRecord.permanentlyIneligibleToBeAddedToWallet.getter()
{
  sub_235F65B58(0, &qword_26884DCB0, MEMORY[0x263F07490]);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)&v17 - v2;
  uint64_t v4 = sub_235F6BF10();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  id v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v17 - v9;
  if ((HKSignedClinicalDataRecord.hasAddToWalletEligibleCredentialTypes.getter() & 1) == 0) {
    return 1;
  }
  id v11 = objc_msgSend(v0, sel_expirationDate);
  if (!v11)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v3, 1, 1, v4);
    goto LABEL_7;
  }
  unint64_t v12 = v11;
  sub_235F6BEF0();

  id v13 = *(void (**)(char *, char *, uint64_t))(v5 + 32);
  v13(v3, v8, v4);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v5 + 56))(v3, 0, 1, v4);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) == 1)
  {
LABEL_7:
    sub_235F65BAC((uint64_t)v3, &qword_26884DCB0, MEMORY[0x263F07490]);
    return objc_msgSend(v0, sel_signatureStatus) == (id)3;
  }
  v13(v10, v3, v4);
  sub_235F6BF00();
  char v14 = sub_235F6BEE0();
  id v15 = *(void (**)(char *, uint64_t))(v5 + 8);
  v15(v8, v4);
  v15(v10, v4);
  if (v14) {
    return 1;
  }
  return objc_msgSend(v0, sel_signatureStatus) == (id)3;
}

BOOL HKSignedClinicalDataRecord.eligibleToBeAddedToWallet.getter()
{
  sub_235F65B58(0, &qword_26884DCB0, MEMORY[0x263F07490]);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)&v17 - v2;
  uint64_t v4 = sub_235F6BF10();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  id v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v17 - v9;
  if ((HKSignedClinicalDataRecord.hasAddToWalletEligibleCredentialTypes.getter() & 1) == 0) {
    return 0;
  }
  id v11 = objc_msgSend(v0, sel_expirationDate);
  if (!v11)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v3, 1, 1, v4);
    goto LABEL_7;
  }
  unint64_t v12 = v11;
  sub_235F6BEF0();

  id v13 = *(void (**)(char *, char *, uint64_t))(v5 + 32);
  v13(v3, v8, v4);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v5 + 56))(v3, 0, 1, v4);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) == 1)
  {
LABEL_7:
    sub_235F65BAC((uint64_t)v3, &qword_26884DCB0, MEMORY[0x263F07490]);
    goto LABEL_8;
  }
  v13(v10, v3, v4);
  sub_235F6BF00();
  char v14 = sub_235F6BEE0();
  id v15 = *(void (**)(char *, uint64_t))(v5 + 8);
  v15(v8, v4);
  v15(v10, v4);
  if (v14) {
    return 0;
  }
LABEL_8:
  if (objc_msgSend(v0, sel_signatureStatus) == (id)3) {
    return 0;
  }
  return objc_msgSend(v0, sel_signatureStatus) == (id)2;
}

uint64_t HKSignedClinicalDataRecord.detailSignatureStatusPlainString.getter()
{
  sub_235F65B58(0, &qword_26884DCB0, MEMORY[0x263F07490]);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)&v22 - v2;
  uint64_t v4 = sub_235F6BF10();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  id v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v22 - v9;
  id v11 = objc_msgSend(v0, sel_expirationDate);
  if (!v11)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v3, 1, 1, v4);
    goto LABEL_6;
  }
  unint64_t v12 = v11;
  sub_235F6BEF0();

  id v13 = *(void (**)(char *, char *, uint64_t))(v5 + 32);
  v13(v3, v8, v4);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v5 + 56))(v3, 0, 1, v4);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) == 1)
  {
LABEL_6:
    sub_235F65BAC((uint64_t)v3, &qword_26884DCB0, MEMORY[0x263F07490]);
LABEL_7:
    objc_msgSend(v0, sel_signatureStatus);
    type metadata accessor for SignedClinicalDataWalletPassManager();
    uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    id v20 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
    uint64_t v18 = sub_235F6BE30();

    return v18;
  }
  v13(v10, v3, v4);
  sub_235F6BF00();
  char v14 = sub_235F6BEE0();
  id v15 = *(void (**)(char *, uint64_t))(v5 + 8);
  v15(v8, v4);
  if ((v14 & 1) == 0)
  {
    v15(v10, v4);
    goto LABEL_7;
  }
  type metadata accessor for SignedClinicalDataWalletPassManager();
  uint64_t v16 = swift_getObjCClassFromMetadata();
  id v17 = objc_msgSend(self, sel_bundleForClass_, v16);
  uint64_t v18 = sub_235F6BE30();

  v15(v10, v4);
  return v18;
}

uint64_t HKSignedClinicalDataRecord.hasAddToWalletEligibleCredentialTypes.getter()
{
  id v1 = objc_msgSend(v0, sel_credentialTypes);
  uint64_t v2 = (void *)sub_235F6C060();

  uint64_t v3 = sub_235F6BFE0();
  char v5 = sub_235F586AC(v3, v4, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v5 & 1) == 0) {
    return 0;
  }
  id v6 = objc_msgSend(v0, sel_credentialTypes);
  uint64_t v7 = (void *)sub_235F6C060();

  uint64_t v8 = sub_235F6BFE0();
  char v10 = sub_235F586AC(v8, v9, v7);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v10 & 1;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_235F65508(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_235F655DC(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_235F65C58((uint64_t)v12, *a3);
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
      sub_235F65C58((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_235F655DC(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_235F6C0F0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_235F65798(a5, a6);
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
  uint64_t v8 = sub_235F6C180();
  if (!v8)
  {
    sub_235F6C1D0();
    __break(1u);
LABEL_17:
    uint64_t result = sub_235F6C200();
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

uint64_t sub_235F65798(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_235F65830(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_235F65A0C(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_235F65A0C(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_235F65830(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_235F659A8(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_235F6C150();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_235F6C1D0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_235F6C030();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_235F6C200();
    __break(1u);
LABEL_14:
    uint64_t result = sub_235F6C1D0();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_235F659A8(uint64_t a1, uint64_t a2)
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
  sub_235F65CB4();
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_235F65A0C(char a1, int64_t a2, char a3, char *a4)
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
    sub_235F65CB4();
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
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
  uint64_t result = sub_235F6C200();
  __break(1u);
  return result;
}

void sub_235F65B58(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_235F6C0D0();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t sub_235F65BAC(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  sub_235F65B58(0, a2, a3);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  return a1;
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

uint64_t sub_235F65C58(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void sub_235F65CB4()
{
  if (!qword_26884DD58)
  {
    unint64_t v0 = sub_235F6C2D0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26884DD58);
    }
  }
}

uint64_t WalletPass.asData()()
{
  uint64_t v1 = sub_235F6BDB0();
  MEMORY[0x270FA5388](v1);
  memcpy(v5, v0, sizeof(v5));
  sub_235F6BDF0();
  swift_allocObject();
  sub_235F6BDE0();
  sub_235F65F7C(0, &qword_26884DD60, MEMORY[0x263F8E0F8]);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_235F6C990;
  sub_235F6BD90();
  sub_235F6BDA0();
  sub_235F65F24();
  sub_235F65F7C(0, &qword_26884DD70, MEMORY[0x263F8D488]);
  sub_235F65FDC();
  sub_235F6C110();
  sub_235F6BDC0();
  memcpy(v4, v5, sizeof(v4));
  sub_235F66050();
  uint64_t v2 = sub_235F6BDD0();
  swift_release();
  return v2;
}

unint64_t sub_235F65F24()
{
  unint64_t result = qword_26884DD68;
  if (!qword_26884DD68)
  {
    sub_235F6BDB0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26884DD68);
  }
  return result;
}

void sub_235F65F7C(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v6 = sub_235F6BDB0();
    unint64_t v7 = a3(a1, v6);
    if (!v8) {
      atomic_store(v7, a2);
    }
  }
}

unint64_t sub_235F65FDC()
{
  unint64_t result = qword_26884DD78;
  if (!qword_26884DD78)
  {
    sub_235F65F7C(255, &qword_26884DD70, MEMORY[0x263F8D488]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26884DD78);
  }
  return result;
}

unint64_t sub_235F66050()
{
  unint64_t result = qword_26884DD80;
  if (!qword_26884DD80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26884DD80);
  }
  return result;
}

unint64_t SignedClinicalDataWalletPassError.errorDescription.getter()
{
  unint64_t result = 0xD000000000000013;
  switch(*(void *)(v0 + 8))
  {
    case 0:
      return result;
    case 1:
      unint64_t result = 0xD000000000000035;
      break;
    case 2:
      unint64_t result = 0xD000000000000037;
      break;
    case 3:
      unint64_t result = 0xD000000000000019;
      break;
    case 4:
      unint64_t result = 0xD000000000000017;
      break;
    case 5:
      unint64_t result = 0xD000000000000019;
      break;
    case 6:
      unint64_t result = 0xD00000000000002CLL;
      break;
    case 7:
      unint64_t result = 0xD00000000000002FLL;
      break;
    case 8:
      unint64_t result = 0xD000000000000017;
      break;
    case 9:
      unint64_t result = 0xD000000000000012;
      break;
    default:
      sub_235F6C140();
      swift_bridgeObjectRelease();
      sub_235F6C020();
      unint64_t result = 0xD000000000000012;
      break;
  }
  return result;
}

uint64_t _s26HealthRecordsWalletSupport018SignedClinicalDataC9PassErrorO2eeoiySbAC_ACtFZ_0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  unint64_t v3 = a1[1];
  uint64_t v4 = *a2;
  unint64_t v5 = a2[1];
  switch(v3)
  {
    case 0uLL:
      if (v5) {
        goto LABEL_28;
      }
      unint64_t v3 = 0;
      char v6 = 1;
      break;
    case 1uLL:
      if (v5 != 1) {
        goto LABEL_28;
      }
      unint64_t v3 = 1;
      char v6 = 1;
      break;
    case 2uLL:
      if (v5 != 2) {
        goto LABEL_28;
      }
      char v6 = 1;
      unint64_t v3 = 2;
      break;
    case 3uLL:
      if (v5 != 3) {
        goto LABEL_28;
      }
      char v6 = 1;
      unint64_t v3 = 3;
      break;
    case 4uLL:
      if (v5 != 4) {
        goto LABEL_28;
      }
      char v6 = 1;
      unint64_t v3 = 4;
      break;
    case 5uLL:
      if (v5 != 5) {
        goto LABEL_28;
      }
      char v6 = 1;
      unint64_t v3 = 5;
      break;
    case 6uLL:
      if (v5 != 6) {
        goto LABEL_28;
      }
      char v6 = 1;
      unint64_t v3 = 6;
      break;
    case 7uLL:
      if (v5 != 7) {
        goto LABEL_28;
      }
      char v6 = 1;
      unint64_t v3 = 7;
      break;
    case 8uLL:
      if (v5 != 8) {
        goto LABEL_28;
      }
      char v6 = 1;
      unint64_t v3 = 8;
      break;
    case 9uLL:
      if (v5 != 9) {
        goto LABEL_28;
      }
      char v6 = 1;
      unint64_t v3 = 9;
      break;
    default:
      if (v5 < 0xA)
      {
LABEL_28:
        char v6 = 0;
      }
      else if (v2 == v4 && v3 == v5)
      {
        char v6 = 1;
      }
      else
      {
        char v6 = sub_235F6C2E0();
      }
      sub_235F6668C(v4, v5);
      sub_235F6668C(v2, v3);
      break;
  }
  sub_235F666A0(v2, v3);
  sub_235F666A0(v4, v5);
  return v6 & 1;
}

unint64_t destroy for SignedClinicalDataWalletPassError(uint64_t a1)
{
  unint64_t result = *(void *)(a1 + 8);
  if (result >= 0xFFFFFFFF) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t _s26HealthRecordsWalletSupport33SignedClinicalDataWalletPassErrorOwCP_0(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if (v3 < 0xFFFFFFFF)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  else
  {
    *(void *)a1 = *(void *)a2;
    *(void *)(a1 + 8) = v3;
    swift_bridgeObjectRetain();
  }
  return a1;
}

void *assignWithCopy for SignedClinicalDataWalletPassError(void *a1, void *a2)
{
  unint64_t v4 = a2[1];
  if (a1[1] < 0xFFFFFFFFuLL)
  {
    if (v4 >= 0xFFFFFFFF)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      swift_bridgeObjectRetain();
      return a1;
    }
LABEL_7:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
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

uint64_t assignWithTake for SignedClinicalDataWalletPassError(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 8) < 0xFFFFFFFFuLL) {
    goto LABEL_5;
  }
  unint64_t v4 = *(void *)(a2 + 8);
  if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
LABEL_5:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SignedClinicalDataWalletPassError(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 > 0x7FFFFFF5 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 2147483638);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  unsigned int v4 = v3 + 1;
  unsigned int v5 = v3 - 9;
  if (v4 >= 0xB) {
    return v5;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for SignedClinicalDataWalletPassError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 >= 0x7FFFFFF6)
  {
    *(void *)__n128 result = 0;
    *(void *)(result + 8) = 0;
    *(_DWORD *)__n128 result = a2 - 2147483638;
    if (a3 >= 0x7FFFFFF6) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFF6) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2 + 9;
    }
  }
  return result;
}

uint64_t sub_235F66640(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_235F6665C(void *result, int a2)
{
  if (a2 < 0)
  {
    *__n128 result = a2 ^ 0x80000000;
    result[1] = 0;
  }
  else if (a2)
  {
    result[1] = (a2 - 1);
  }
  return result;
}

ValueMetadata *type metadata accessor for SignedClinicalDataWalletPassError()
{
  return &type metadata for SignedClinicalDataWalletPassError;
}

uint64_t sub_235F6668C(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xA) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_235F666A0(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xA) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_235F666B4()
{
  uint64_t v0 = sub_235F6BFA0();
  __swift_allocate_value_buffer(v0, qword_26884EE00);
  __swift_project_value_buffer(v0, (uint64_t)qword_26884EE00);
  _HKInitializeLogging();
  id v1 = (id)*MEMORY[0x263F09908];
  return sub_235F6BFB0();
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

uint64_t sub_235F6677C(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xD000000000000010;
  unint64_t v3 = 0x8000000235F6D2D0;
  uint64_t v4 = a1;
  unint64_t v5 = 0xD000000000000010;
  switch(v4)
  {
    case 1:
      goto LABEL_7;
    case 2:
      unint64_t v5 = 0xD000000000000011;
      unint64_t v3 = 0x8000000235F6D2F0;
      goto LABEL_7;
    case 3:
      unint64_t v3 = 0xEF676E6F4C656C79;
      goto LABEL_6;
    case 4:
      unint64_t v3 = 0xEF6C6C7546656C79;
      goto LABEL_6;
    default:
      unint64_t v3 = 0xEF656E6F4E656C79;
LABEL_6:
      unint64_t v5 = 0x7453657461444B50;
LABEL_7:
      unint64_t v6 = 0x8000000235F6D2D0;
      switch(a2)
      {
        case 1:
          goto LABEL_13;
        case 2:
          unint64_t v2 = 0xD000000000000011;
          unint64_t v6 = 0x8000000235F6D2F0;
          goto LABEL_13;
        case 3:
          unint64_t v6 = 0xEF676E6F4C656C79;
          goto LABEL_12;
        case 4:
          unint64_t v6 = 0xEF6C6C7546656C79;
          goto LABEL_12;
        default:
          unint64_t v6 = 0xEF656E6F4E656C79;
LABEL_12:
          unint64_t v2 = 0x7453657461444B50;
LABEL_13:
          if (v5 == v2 && v3 == v6) {
            char v7 = 1;
          }
          else {
            char v7 = sub_235F6C2E0();
          }
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          return v7 & 1;
      }
  }
}

uint64_t WalletPass.description.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t WalletPass.formatVersion.getter()
{
  return *(void *)(v0 + 16);
}

uint64_t WalletPass.organizationName.getter()
{
  uint64_t v1 = *(void *)(v0 + 24);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t WalletPass.passTypeIdentifier.getter()
{
  uint64_t v1 = *(void *)(v0 + 40);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t WalletPass.serialNumber.getter()
{
  uint64_t v1 = *(void *)(v0 + 56);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t WalletPass.teamIdentifier.getter()
{
  uint64_t v1 = *(void *)(v0 + 72);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t WalletPass.appLaunchURL.getter()
{
  uint64_t v1 = *(void *)(v0 + 88);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t WalletPass.systemAppBundleIdentifiers.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t WalletPass.backgroundColor.getter()
{
  uint64_t v1 = *(void *)(v0 + 112);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t WalletPass.foregroundColor.getter()
{
  uint64_t v1 = *(void *)(v0 + 128);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t WalletPass.groupingIdentifier.getter()
{
  uint64_t v1 = *(void *)(v0 + 144);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t WalletPass.labelColor.getter()
{
  uint64_t v1 = *(void *)(v0 + 160);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t WalletPass.logoText.getter()
{
  uint64_t v1 = *(void *)(v0 + 176);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t WalletPass.healthPass.getter@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1[25];
  uint64_t v3 = v1[26];
  uint64_t v4 = v1[27];
  uint64_t v5 = v1[28];
  *a1 = v1[24];
  a1[1] = v2;
  a1[2] = v3;
  a1[3] = v4;
  a1[4] = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t WalletPass.barcodes.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t WalletPass.expirationDate.getter()
{
  uint64_t v1 = *(void *)(v0 + 240);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t WalletPass.sharingProhibited.getter()
{
  return *(unsigned __int8 *)(v0 + 256);
}

uint64_t WalletPass.voided.getter()
{
  return *(unsigned __int8 *)(v0 + 257);
}

uint64_t sub_235F66C10(char a1)
{
  uint64_t result = 0xD000000000000010;
  switch(a1)
  {
    case 1:
      uint64_t result = 0x655674616D726F66;
      break;
    case 2:
      return result;
    case 3:
    case 10:
      uint64_t result = 0xD000000000000012;
      break;
    case 4:
      uint64_t result = 0x754E6C6169726573;
      break;
    case 5:
      uint64_t result = 0x6E6564496D616574;
      break;
    case 6:
      uint64_t result = 0x636E75614C707061;
      break;
    case 7:
      uint64_t result = 0xD00000000000001ALL;
      break;
    case 8:
      unsigned int v3 = 1801675106;
      goto LABEL_10;
    case 9:
      unsigned int v3 = 1701998438;
LABEL_10:
      uint64_t result = v3 | 0x756F726700000000;
      break;
    case 11:
      uint64_t result = 0x6C6F436C6562616CLL;
      break;
    case 12:
      uint64_t result = 0x747865546F676F6CLL;
      break;
    case 13:
      uint64_t result = 0x615068746C616568;
      break;
    case 14:
      uint64_t result = 0x7365646F63726162;
      break;
    case 15:
      uint64_t result = 0x6974617269707865;
      break;
    case 16:
      uint64_t result = 0xD000000000000011;
      break;
    case 17:
      uint64_t result = 0x646564696F76;
      break;
    default:
      uint64_t result = 0x7470697263736564;
      break;
  }
  return result;
}

uint64_t sub_235F66E70()
{
  return sub_235F66C10(*v0);
}

uint64_t sub_235F66E78@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_235F6AD28(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_235F66EA0()
{
  return 0;
}

void sub_235F66EAC(unsigned char *a1@<X8>)
{
  *a1 = 18;
}

uint64_t sub_235F66EB8(uint64_t a1)
{
  unint64_t v2 = sub_235F675AC();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_235F66EF4(uint64_t a1)
{
  unint64_t v2 = sub_235F675AC();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t WalletPass.encode(to:)(void *a1)
{
  sub_235F69138(0, &qword_26884DD88, (void (*)(void))sub_235F675AC);
  uint64_t v4 = v3;
  uint64_t v5 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  char v7 = (char *)v17 - v6;
  uint64_t v8 = *(void *)(v1 + 16);
  uint64_t v46 = *(void *)(v1 + 24);
  uint64_t v47 = v8;
  uint64_t v9 = *(void *)(v1 + 32);
  uint64_t v44 = *(void *)(v1 + 40);
  uint64_t v45 = v9;
  uint64_t v10 = *(void *)(v1 + 48);
  uint64_t v11 = *(void *)(v1 + 56);
  uint64_t v42 = *(void *)(v1 + 64);
  uint64_t v43 = v10;
  uint64_t v12 = *(void *)(v1 + 72);
  uint64_t v40 = *(void *)(v1 + 80);
  uint64_t v41 = v11;
  uint64_t v13 = *(void *)(v1 + 88);
  uint64_t v38 = *(void *)(v1 + 96);
  uint64_t v39 = v12;
  uint64_t v36 = *(void *)(v1 + 104);
  uint64_t v37 = v13;
  uint64_t v14 = *(void *)(v1 + 120);
  uint64_t v34 = *(void *)(v1 + 112);
  uint64_t v35 = v14;
  uint64_t v32 = *(void *)(v1 + 128);
  uint64_t v33 = *(void *)(v1 + 136);
  uint64_t v30 = *(void *)(v1 + 144);
  uint64_t v31 = *(void *)(v1 + 152);
  uint64_t v29 = *(void *)(v1 + 160);
  uint64_t v28 = *(void *)(v1 + 168);
  uint64_t v27 = *(void *)(v1 + 176);
  uint64_t v26 = *(void *)(v1 + 184);
  uint64_t v21 = *(void *)(v1 + 192);
  uint64_t v22 = *(void *)(v1 + 200);
  uint64_t v23 = *(void *)(v1 + 208);
  uint64_t v25 = *(void *)(v1 + 216);
  uint64_t v24 = *(void *)(v1 + 224);
  uint64_t v20 = *(void *)(v1 + 232);
  uint64_t v19 = *(void *)(v1 + 240);
  uint64_t v18 = *(void *)(v1 + 248);
  int v54 = *(unsigned __int8 *)(v1 + 256);
  v17[1] = *(unsigned __int8 *)(v1 + 257);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_235F675AC();
  sub_235F6C380();
  LOBYTE(v49) = 0;
  uint64_t v15 = v48;
  sub_235F6C260();
  if (v15) {
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  uint64_t v48 = v5;
  LOBYTE(v49) = 1;
  sub_235F6C270();
  LOBYTE(v49) = 2;
  sub_235F6C260();
  LOBYTE(v49) = 3;
  sub_235F6C260();
  LOBYTE(v49) = 4;
  sub_235F6C260();
  LOBYTE(v49) = 5;
  sub_235F6C260();
  LOBYTE(v49) = 6;
  sub_235F6C220();
  uint64_t v49 = v36;
  char v55 = 7;
  sub_235F67B74(0, &qword_26884DCD8);
  sub_235F67644();
  sub_235F6C250();
  LOBYTE(v49) = 8;
  sub_235F6C220();
  LOBYTE(v49) = 9;
  sub_235F6C220();
  LOBYTE(v49) = 10;
  sub_235F6C220();
  LOBYTE(v49) = 11;
  sub_235F6C220();
  LOBYTE(v49) = 12;
  sub_235F6C220();
  uint64_t v49 = v21;
  uint64_t v50 = v22;
  uint64_t v51 = v23;
  uint64_t v52 = v25;
  uint64_t v53 = v24;
  char v55 = 13;
  sub_235F676BC();
  sub_235F6C280();
  uint64_t v49 = v20;
  char v55 = 14;
  sub_235F67B74(0, &qword_26884DDA8);
  sub_235F67BBC(&qword_26884DDB0, &qword_26884DDA8, (uint64_t)&type metadata for WalletPassBarcode, (void (*)(void))sub_235F67710);
  sub_235F6C250();
  LOBYTE(v49) = 15;
  sub_235F6C220();
  LOBYTE(v49) = 16;
  sub_235F6C230();
  LOBYTE(v49) = 17;
  sub_235F6C230();
  return (*(uint64_t (**)(char *, uint64_t))(v48 + 8))(v7, v4);
}

unint64_t sub_235F675AC()
{
  unint64_t result = qword_26884DD90;
  if (!qword_26884DD90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26884DD90);
  }
  return result;
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_235F67644()
{
  unint64_t result = qword_26884DD98;
  if (!qword_26884DD98)
  {
    sub_235F67B74(255, &qword_26884DCD8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26884DD98);
  }
  return result;
}

unint64_t sub_235F676BC()
{
  unint64_t result = qword_26884DDA0;
  if (!qword_26884DDA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26884DDA0);
  }
  return result;
}

unint64_t sub_235F67710()
{
  unint64_t result = qword_26884DDB8;
  if (!qword_26884DDB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26884DDB8);
  }
  return result;
}

uint64_t sub_235F67764(void *a1)
{
  return WalletPass.encode(to:)(a1);
}

uint64_t WalletPassContent.headerFields.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t WalletPassContent.primaryFields.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t WalletPassContent.secondaryFields.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t WalletPassContent.auxiliaryFields.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t WalletPassContent.backFields.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_235F677A4(char a1)
{
  return *(void *)&aHeaderfiprimar[8 * a1];
}

uint64_t sub_235F677C4()
{
  return sub_235F677A4(*v0);
}

uint64_t sub_235F677CC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_235F6B45C(a1, a2);
  *a3 = result;
  return result;
}

void sub_235F677F4(unsigned char *a1@<X8>)
{
  *a1 = 5;
}

uint64_t sub_235F67800(uint64_t a1)
{
  unint64_t v2 = sub_235F67B20();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_235F6783C(uint64_t a1)
{
  unint64_t v2 = sub_235F67B20();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t WalletPassContent.encode(to:)(void *a1)
{
  sub_235F69138(0, &qword_26884DDC0, (void (*)(void))sub_235F67B20);
  uint64_t v4 = v3;
  uint64_t v5 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  char v7 = (char *)&v15 - v6;
  uint64_t v9 = *v1;
  uint64_t v8 = v1[1];
  uint64_t v17 = v1[2];
  uint64_t v18 = v8;
  uint64_t v10 = v1[3];
  uint64_t v15 = v1[4];
  uint64_t v16 = v10;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_235F67B20();
  sub_235F6C380();
  uint64_t v21 = v9;
  char v20 = 0;
  sub_235F67B74(0, &qword_26884DDD0);
  sub_235F67BBC(&qword_26884DDD8, &qword_26884DDD0, (uint64_t)&type metadata for WalletPassField, (void (*)(void))sub_235F67C34);
  uint64_t v11 = v19;
  sub_235F6C250();
  if (!v11)
  {
    uint64_t v13 = v16;
    uint64_t v12 = v17;
    uint64_t v21 = v18;
    char v20 = 1;
    sub_235F6C250();
    uint64_t v21 = v12;
    char v20 = 2;
    sub_235F6C250();
    uint64_t v21 = v13;
    char v20 = 3;
    sub_235F6C250();
    uint64_t v21 = v15;
    char v20 = 4;
    sub_235F6C250();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

unint64_t sub_235F67B20()
{
  unint64_t result = qword_26884DDC8;
  if (!qword_26884DDC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26884DDC8);
  }
  return result;
}

void sub_235F67B74(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t v3 = sub_235F6C090();
    if (!v4) {
      atomic_store(v3, a2);
    }
  }
}

uint64_t sub_235F67BBC(unint64_t *a1, unint64_t *a2, uint64_t a3, void (*a4)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_235F67B74(255, a2);
    a4();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_235F67C34()
{
  unint64_t result = qword_26884DDE0;
  if (!qword_26884DDE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26884DDE0);
  }
  return result;
}

uint64_t sub_235F67C88(void *a1)
{
  return WalletPassContent.encode(to:)(a1);
}

HealthRecordsWalletSupport::WalletPassField::DateTimeStyle_optional __swiftcall WalletPassField.DateTimeStyle.init(rawValue:)(Swift::String rawValue)
{
  unint64_t v2 = v1;
  unint64_t v3 = sub_235F6C210();
  result.value = swift_bridgeObjectRelease();
  char v5 = 5;
  if (v3 < 5) {
    char v5 = v3;
  }
  *unint64_t v2 = v5;
  return result;
}

unint64_t WalletPassField.DateTimeStyle.rawValue.getter()
{
  unint64_t result = 0xD000000000000010;
  switch(*v0)
  {
    case 1:
      return result;
    case 2:
      unint64_t result = 0xD000000000000011;
      break;
    default:
      unint64_t result = 0x7453657461444B50;
      break;
  }
  return result;
}

uint64_t sub_235F67DB0(unsigned __int8 *a1, char *a2)
{
  return sub_235F6677C(*a1, *a2);
}

uint64_t sub_235F67DBC()
{
  return sub_235F67DC4();
}

uint64_t sub_235F67DC4()
{
  return sub_235F6C370();
}

uint64_t sub_235F67ED0()
{
  return sub_235F67ED8();
}

uint64_t sub_235F67ED8()
{
  sub_235F6C010();
  return swift_bridgeObjectRelease();
}

uint64_t sub_235F67FC4()
{
  return sub_235F67FCC();
}

uint64_t sub_235F67FCC()
{
  return sub_235F6C370();
}

HealthRecordsWalletSupport::WalletPassField::DateTimeStyle_optional sub_235F680D4(Swift::String *a1)
{
  return WalletPassField.DateTimeStyle.init(rawValue:)(*a1);
}

unint64_t sub_235F680E0@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = WalletPassField.DateTimeStyle.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_235F68108()
{
  return sub_235F6C040();
}

uint64_t WalletPassField.key.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t WalletPassField.label.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t WalletPassField.label.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return result;
}

uint64_t (*WalletPassField.label.modify())()
{
  return nullsub_1;
}

uint64_t WalletPassField.value.getter()
{
  uint64_t v1 = *(void *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t WalletPassField.value.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 32) = a1;
  *(void *)(v2 + 40) = a2;
  return result;
}

uint64_t (*WalletPassField.value.modify())()
{
  return nullsub_1;
}

uint64_t WalletPassField.textAlignment.getter()
{
  uint64_t v1 = *(void *)(v0 + 48);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t WalletPassField.textAlignment.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 48) = a1;
  *(void *)(v2 + 56) = a2;
  return result;
}

uint64_t (*WalletPassField.textAlignment.modify())()
{
  return nullsub_1;
}

uint64_t WalletPassField.attributedValue.getter()
{
  uint64_t v1 = *(void *)(v0 + 64);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t WalletPassField.attributedValue.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 64) = a1;
  *(void *)(v2 + 72) = a2;
  return result;
}

uint64_t (*WalletPassField.attributedValue.modify())()
{
  return nullsub_1;
}

uint64_t WalletPassField.dataDetectorTypes.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t WalletPassField.dataDetectorTypes.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 80) = a1;
  return result;
}

uint64_t (*WalletPassField.dataDetectorTypes.modify())()
{
  return nullsub_1;
}

uint64_t WalletPassField.numberStyle.getter()
{
  uint64_t v1 = *(void *)(v0 + 88);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t WalletPassField.numberStyle.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 88) = a1;
  *(void *)(v2 + 96) = a2;
  return result;
}

uint64_t (*WalletPassField.numberStyle.modify())()
{
  return nullsub_1;
}

void WalletPassField.dateStyle.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 104);
}

unsigned char *WalletPassField.dateStyle.setter(unsigned char *result)
{
  *(unsigned char *)(v1 + 104) = *result;
  return result;
}

uint64_t (*WalletPassField.dateStyle.modify())()
{
  return nullsub_1;
}

void WalletPassField.timeStyle.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 105);
}

unsigned char *WalletPassField.timeStyle.setter(unsigned char *result)
{
  *(unsigned char *)(v1 + 105) = *result;
  return result;
}

uint64_t (*WalletPassField.timeStyle.modify())()
{
  return nullsub_1;
}

uint64_t WalletPassField.ignoresTimeZone.getter()
{
  return *(unsigned __int8 *)(v0 + 106);
}

uint64_t WalletPassField.ignoresTimeZone.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 106) = result;
  return result;
}

uint64_t (*WalletPassField.ignoresTimeZone.modify())()
{
  return nullsub_1;
}

uint64_t WalletPassField.isRelative.getter()
{
  return *(unsigned __int8 *)(v0 + 107);
}

uint64_t WalletPassField.isRelative.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 107) = result;
  return result;
}

uint64_t (*WalletPassField.isRelative.modify())()
{
  return nullsub_1;
}

uint64_t WalletPassField.row.getter()
{
  return *(void *)(v0 + 112);
}

uint64_t WalletPassField.row.setter(uint64_t result, char a2)
{
  *(void *)(v2 + 112) = result;
  *(unsigned char *)(v2 + 120) = a2 & 1;
  return result;
}

uint64_t (*WalletPassField.row.modify())()
{
  return nullsub_1;
}

uint64_t sub_235F68590(char a1)
{
  uint64_t result = 0xD000000000000011;
  switch(a1)
  {
    case 1:
      uint64_t result = 0x6C6562616CLL;
      break;
    case 2:
      uint64_t result = 0x65756C6176;
      break;
    case 3:
      uint64_t result = 0x67696C4174786574;
      break;
    case 4:
      uint64_t result = 0x7475626972747461;
      break;
    case 5:
      return result;
    case 6:
      uint64_t result = 0x74537265626D756ELL;
      break;
    case 7:
      unsigned int v3 = 1702125924;
      goto LABEL_10;
    case 8:
      unsigned int v3 = 1701669236;
LABEL_10:
      uint64_t result = v3 | 0x6C79745300000000;
      break;
    case 9:
      uint64_t result = 0x547365726F6E6769;
      break;
    case 10:
      uint64_t result = 0x6974616C65527369;
      break;
    case 11:
      uint64_t result = 7827314;
      break;
    default:
      uint64_t result = 7955819;
      break;
  }
  return result;
}

uint64_t sub_235F68718()
{
  return sub_235F68590(*v0);
}

uint64_t sub_235F68720@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_235F6B6B4(a1, a2);
  *a3 = result;
  return result;
}

void sub_235F68748(unsigned char *a1@<X8>)
{
  *a1 = 12;
}

uint64_t sub_235F68754(uint64_t a1)
{
  unint64_t v2 = sub_235F68C08();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_235F68790(uint64_t a1)
{
  unint64_t v2 = sub_235F68C08();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t WalletPassField.encode(to:)(void *a1)
{
  sub_235F69138(0, &qword_26884DDE8, (void (*)(void))sub_235F68C08);
  uint64_t v4 = v3;
  uint64_t v5 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  char v7 = (char *)v15 - v6;
  uint64_t v8 = *(void *)(v1 + 16);
  uint64_t v30 = *(void *)(v1 + 24);
  uint64_t v31 = v8;
  uint64_t v9 = *(void *)(v1 + 32);
  uint64_t v28 = *(void *)(v1 + 40);
  uint64_t v29 = v9;
  uint64_t v10 = *(void *)(v1 + 48);
  uint64_t v26 = *(void *)(v1 + 56);
  uint64_t v27 = v10;
  uint64_t v11 = *(void *)(v1 + 72);
  uint64_t v24 = *(void *)(v1 + 64);
  uint64_t v25 = v11;
  uint64_t v12 = *(void *)(v1 + 80);
  uint64_t v22 = *(void *)(v1 + 88);
  uint64_t v23 = v12;
  uint64_t v21 = *(void *)(v1 + 96);
  LODWORD(v12) = *(unsigned __int8 *)(v1 + 104);
  int v19 = *(unsigned __int8 *)(v1 + 105);
  int v20 = v12;
  LODWORD(v12) = *(unsigned __int8 *)(v1 + 106);
  int v17 = *(unsigned __int8 *)(v1 + 107);
  int v18 = v12;
  v15[1] = *(void *)(v1 + 112);
  int v16 = *(unsigned __int8 *)(v1 + 120);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_235F68C08();
  sub_235F6C380();
  LOBYTE(v34) = 0;
  uint64_t v13 = v32;
  sub_235F6C260();
  if (!v13)
  {
    LOBYTE(v34) = 1;
    sub_235F6C220();
    LOBYTE(v34) = 2;
    sub_235F6C260();
    uint64_t v32 = v5;
    LOBYTE(v34) = 3;
    sub_235F6C220();
    LOBYTE(v34) = 4;
    sub_235F6C220();
    uint64_t v34 = v23;
    char v33 = 5;
    sub_235F67B74(0, &qword_26884DCD8);
    sub_235F67644();
    sub_235F6C250();
    LOBYTE(v34) = 6;
    sub_235F6C220();
    LOBYTE(v34) = v20;
    char v33 = 7;
    sub_235F68C5C();
    sub_235F6C250();
    LOBYTE(v34) = v19;
    char v33 = 8;
    sub_235F6C250();
    LOBYTE(v34) = 9;
    sub_235F6C230();
    LOBYTE(v34) = 10;
    sub_235F6C230();
    LOBYTE(v34) = 11;
    sub_235F6C240();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

unint64_t sub_235F68C08()
{
  unint64_t result = qword_26884DDF0;
  if (!qword_26884DDF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26884DDF0);
  }
  return result;
}

unint64_t sub_235F68C5C()
{
  unint64_t result = qword_26884DDF8;
  if (!qword_26884DDF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26884DDF8);
  }
  return result;
}

uint64_t sub_235F68CB0(void *a1)
{
  return WalletPassField.encode(to:)(a1);
}

uint64_t WalletPassBarcode.altText.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t WalletPassBarcode.format.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t WalletPassBarcode.message.getter()
{
  uint64_t v1 = *(void *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t WalletPassBarcode.messageEncoding.getter()
{
  uint64_t v1 = *(void *)(v0 + 48);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_235F68D88(char a1)
{
  return *(void *)&aAlttext_0[8 * a1];
}

BOOL sub_235F68DA8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_235F68DBC()
{
  return sub_235F6C370();
}

uint64_t sub_235F68E04()
{
  return sub_235F6C360();
}

uint64_t sub_235F68E30()
{
  return sub_235F6C370();
}

uint64_t sub_235F68E74()
{
  return sub_235F68D88(*v0);
}

uint64_t sub_235F68E7C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_235F6BB78(a1, a2);
  *a3 = result;
  return result;
}

void sub_235F68EA4(unsigned char *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_235F68EB0(uint64_t a1)
{
  unint64_t v2 = sub_235F69198();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_235F68EEC(uint64_t a1)
{
  unint64_t v2 = sub_235F69198();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t WalletPassBarcode.encode(to:)(void *a1)
{
  sub_235F69138(0, &qword_26884DE00, (void (*)(void))sub_235F69198);
  uint64_t v4 = v3;
  uint64_t v5 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  char v7 = (char *)v13 - v6;
  uint64_t v8 = v1[2];
  v13[5] = v1[3];
  v13[6] = v8;
  uint64_t v9 = v1[4];
  v13[3] = v1[5];
  v13[4] = v9;
  uint64_t v10 = v1[6];
  v13[1] = v1[7];
  id v13[2] = v10;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_235F69198();
  sub_235F6C380();
  char v17 = 0;
  uint64_t v11 = v13[7];
  sub_235F6C220();
  if (!v11)
  {
    char v16 = 1;
    sub_235F6C260();
    char v15 = 2;
    sub_235F6C260();
    char v14 = 3;
    sub_235F6C260();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

void sub_235F69138(uint64_t a1, unint64_t *a2, void (*a3)(void))
{
  if (!*a2)
  {
    a3();
    unint64_t v4 = sub_235F6C290();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

unint64_t sub_235F69198()
{
  unint64_t result = qword_26884DE08;
  if (!qword_26884DE08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26884DE08);
  }
  return result;
}

unint64_t sub_235F691F0()
{
  unint64_t result = qword_26884DE10;
  if (!qword_26884DE10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26884DE10);
  }
  return result;
}

uint64_t sub_235F69244(void *a1)
{
  return WalletPassBarcode.encode(to:)(a1);
}

uint64_t destroy for WalletPass()
{
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
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for WalletPass(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  uint64_t v4 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v4;
  uint64_t v5 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v5;
  uint64_t v6 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v6;
  uint64_t v7 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v7;
  uint64_t v8 = *(void *)(a2 + 104);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = v8;
  uint64_t v9 = *(void *)(a2 + 120);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = v9;
  uint64_t v10 = *(void *)(a2 + 136);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(void *)(a1 + 136) = v10;
  uint64_t v11 = *(void *)(a2 + 152);
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  *(void *)(a1 + 152) = v11;
  uint64_t v12 = *(void *)(a2 + 168);
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  *(void *)(a1 + 168) = v12;
  uint64_t v13 = *(void *)(a2 + 184);
  *(void *)(a1 + 176) = *(void *)(a2 + 176);
  *(void *)(a1 + 184) = v13;
  uint64_t v16 = *(void *)(a2 + 200);
  *(void *)(a1 + 192) = *(void *)(a2 + 192);
  *(void *)(a1 + 200) = v16;
  uint64_t v17 = *(void *)(a2 + 216);
  *(void *)(a1 + 208) = *(void *)(a2 + 208);
  *(void *)(a1 + 216) = v17;
  uint64_t v18 = *(void *)(a2 + 232);
  *(void *)(a1 + 224) = *(void *)(a2 + 224);
  *(void *)(a1 + 232) = v18;
  uint64_t v14 = *(void *)(a2 + 248);
  *(void *)(a1 + 240) = *(void *)(a2 + 240);
  *(void *)(a1 + 248) = v14;
  *(unsigned char *)(a1 + 256) = *(unsigned char *)(a2 + 256);
  *(unsigned char *)(a1 + 257) = *(unsigned char *)(a2 + 257);
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
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for WalletPass(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
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
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  *(void *)(a1 + 168) = *(void *)(a2 + 168);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 176) = *(void *)(a2 + 176);
  *(void *)(a1 + 184) = *(void *)(a2 + 184);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 192) = *(void *)(a2 + 192);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 200) = *(void *)(a2 + 200);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 208) = *(void *)(a2 + 208);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 216) = *(void *)(a2 + 216);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 224) = *(void *)(a2 + 224);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 232) = *(void *)(a2 + 232);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 240) = *(void *)(a2 + 240);
  *(void *)(a1 + 248) = *(void *)(a2 + 248);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 256) = *(unsigned char *)(a2 + 256);
  *(unsigned char *)(a1 + 257) = *(unsigned char *)(a2 + 257);
  return a1;
}

void *__swift_memcpy258_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x102uLL);
}

uint64_t assignWithTake for WalletPass(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v7;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(a2 + 120);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = *(void *)(a2 + 136);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(void *)(a1 + 136) = v9;
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void *)(a2 + 152);
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  *(void *)(a1 + 152) = v10;
  swift_bridgeObjectRelease();
  uint64_t v11 = *(void *)(a2 + 168);
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  *(void *)(a1 + 168) = v11;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 176) = *(void *)(a2 + 176);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 184) = *(_OWORD *)(a2 + 184);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 200) = *(_OWORD *)(a2 + 200);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 216) = *(_OWORD *)(a2 + 216);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 232) = *(void *)(a2 + 232);
  swift_bridgeObjectRelease();
  uint64_t v12 = *(void *)(a2 + 248);
  *(void *)(a1 + 240) = *(void *)(a2 + 240);
  *(void *)(a1 + 248) = v12;
  swift_bridgeObjectRelease();
  *(_WORD *)(a1 + 256) = *(_WORD *)(a2 + 256);
  return a1;
}

uint64_t getEnumTagSinglePayload for WalletPass(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 258)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for WalletPass(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 248) = 0;
    *(_OWORD *)(result + 232) = 0u;
    *(_OWORD *)(result + 216) = 0u;
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_WORD *)(result + 256) = 0;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 258) = 1;
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
    *(unsigned char *)(result + 258) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for WalletPass()
{
  return &type metadata for WalletPass;
}

uint64_t destroy for WalletPassContent()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for WalletPassContent(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for WalletPassContent(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy40_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for WalletPassContent(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for WalletPassContent(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 40)) {
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

uint64_t storeEnumTagSinglePayload for WalletPassContent(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 40) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 40) = 0;
    }
    if (a2) {
      *(void *)__n128 result = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for WalletPassContent()
{
  return &type metadata for WalletPassContent;
}

uint64_t destroy for WalletPassField()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for WalletPassField(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  uint64_t v6 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v6;
  uint64_t v7 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v7;
  uint64_t v8 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v8;
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(_DWORD *)(a1 + 104) = *(_DWORD *)(a2 + 104);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(unsigned char *)(a1 + 120) = *(unsigned char *)(a2 + 120);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for WalletPassField(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 104) = *(unsigned char *)(a2 + 104);
  *(unsigned char *)(a1 + 105) = *(unsigned char *)(a2 + 105);
  *(unsigned char *)(a1 + 106) = *(unsigned char *)(a2 + 106);
  *(unsigned char *)(a1 + 107) = *(unsigned char *)(a2 + 107);
  uint64_t v4 = *(void *)(a2 + 112);
  *(unsigned char *)(a1 + 120) = *(unsigned char *)(a2 + 120);
  *(void *)(a1 + 112) = v4;
  return a1;
}

__n128 __swift_memcpy121_8(uint64_t a1, long long *a2)
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
  *(_OWORD *)(a1 + 105) = *(long long *)((char *)a2 + 105);
  *(_OWORD *)(a1 + 80) = v6;
  *(_OWORD *)(a1 + 96) = v7;
  *(__n128 *)(a1 + 64) = result;
  return result;
}

uint64_t assignWithTake for WalletPassField(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v7;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(a2 + 96);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = v8;
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 104) = *(_DWORD *)(a2 + 104);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(unsigned char *)(a1 + 120) = *(unsigned char *)(a2 + 120);
  return a1;
}

uint64_t getEnumTagSinglePayload for WalletPassField(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 121)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for WalletPassField(uint64_t result, int a2, int a3)
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
    *(unsigned char *)(result + 120) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 121) = 1;
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
    *(unsigned char *)(result + 121) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for WalletPassField()
{
  return &type metadata for WalletPassField;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *__n128 result = *a2;
  return result;
}

ValueMetadata *type metadata accessor for WalletPassField.DateTimeStyle()
{
  return &type metadata for WalletPassField.DateTimeStyle;
}

uint64_t destroy for WalletPassBarcode()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for WalletPassBarcode(void *a1, void *a2)
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
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for WalletPassBarcode(void *a1, void *a2)
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
  return a1;
}

__n128 __swift_memcpy64_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

void *assignWithTake for WalletPassBarcode(void *a1, void *a2)
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
  return a1;
}

uint64_t getEnumTagSinglePayload for WalletPassBarcode(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 64)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for WalletPassBarcode(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 64) = 1;
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
    *(unsigned char *)(result + 64) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for WalletPassBarcode()
{
  return &type metadata for WalletPassBarcode;
}

uint64_t getEnumTagSinglePayload for WalletPassBarcode.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFD) {
    goto LABEL_17;
  }
  if (a2 + 3 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 3) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 3;
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
      return (*a1 | (v4 << 8)) - 3;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 3;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 4;
  int v8 = v6 - 4;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for WalletPassBarcode.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 3 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 3) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFD) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFC)
  {
    unsigned int v6 = ((a2 - 253) >> 8) + 1;
    *__n128 result = a2 + 3;
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
        JUMPOUT(0x235F6A404);
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
          *__n128 result = a2 + 3;
        break;
    }
  }
  return result;
}

uint64_t sub_235F6A42C(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_235F6A434(unsigned char *result, char a2)
{
  *__n128 result = a2;
  return result;
}

ValueMetadata *type metadata accessor for WalletPassBarcode.CodingKeys()
{
  return &type metadata for WalletPassBarcode.CodingKeys;
}

uint64_t getEnumTagSinglePayload for WalletPassField.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF5) {
    goto LABEL_17;
  }
  if (a2 + 11 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 11) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 11;
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
      return (*a1 | (v4 << 8)) - 11;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 11;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xC;
  int v8 = v6 - 12;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for WalletPassField.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 11 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 11) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF5) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF4)
  {
    unsigned int v6 = ((a2 - 245) >> 8) + 1;
    *__n128 result = a2 + 11;
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
        JUMPOUT(0x235F6A5A8);
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
          *__n128 result = a2 + 11;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for WalletPassField.CodingKeys()
{
  return &type metadata for WalletPassField.CodingKeys;
}

uint64_t _s26HealthRecordsWalletSupport15WalletPassFieldV13DateTimeStyleOwet_0(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s26HealthRecordsWalletSupport15WalletPassFieldV13DateTimeStyleOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x235F6A73CLL);
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

ValueMetadata *type metadata accessor for WalletPassContent.CodingKeys()
{
  return &type metadata for WalletPassContent.CodingKeys;
}

uint64_t getEnumTagSinglePayload for WalletPass.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xEF) {
    goto LABEL_17;
  }
  if (a2 + 17 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 17) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 17;
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
      return (*a1 | (v4 << 8)) - 17;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 17;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x12;
  int v8 = v6 - 18;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for WalletPass.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 17 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 17) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xEF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xEE)
  {
    unsigned int v6 = ((a2 - 239) >> 8) + 1;
    *__n128 result = a2 + 17;
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
        JUMPOUT(0x235F6A8D0);
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
          *__n128 result = a2 + 17;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for WalletPass.CodingKeys()
{
  return &type metadata for WalletPass.CodingKeys;
}

unint64_t sub_235F6A90C()
{
  unint64_t result = qword_26884DE18;
  if (!qword_26884DE18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26884DE18);
  }
  return result;
}

unint64_t sub_235F6A964()
{
  unint64_t result = qword_26884DE20;
  if (!qword_26884DE20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26884DE20);
  }
  return result;
}

unint64_t sub_235F6A9BC()
{
  unint64_t result = qword_26884DE28;
  if (!qword_26884DE28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26884DE28);
  }
  return result;
}

unint64_t sub_235F6AA14()
{
  unint64_t result = qword_26884DE30;
  if (!qword_26884DE30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26884DE30);
  }
  return result;
}

unint64_t sub_235F6AA6C()
{
  unint64_t result = qword_26884DE38;
  if (!qword_26884DE38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26884DE38);
  }
  return result;
}

unint64_t sub_235F6AAC4()
{
  unint64_t result = qword_26884DE40;
  if (!qword_26884DE40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26884DE40);
  }
  return result;
}

unint64_t sub_235F6AB1C()
{
  unint64_t result = qword_26884DE48;
  if (!qword_26884DE48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26884DE48);
  }
  return result;
}

unint64_t sub_235F6AB74()
{
  unint64_t result = qword_26884DE50;
  if (!qword_26884DE50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26884DE50);
  }
  return result;
}

unint64_t sub_235F6ABCC()
{
  unint64_t result = qword_26884DE58;
  if (!qword_26884DE58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26884DE58);
  }
  return result;
}

unint64_t sub_235F6AC24()
{
  unint64_t result = qword_26884DE60;
  if (!qword_26884DE60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26884DE60);
  }
  return result;
}

unint64_t sub_235F6AC7C()
{
  unint64_t result = qword_26884DE68;
  if (!qword_26884DE68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26884DE68);
  }
  return result;
}

unint64_t sub_235F6ACD4()
{
  unint64_t result = qword_26884DE70;
  if (!qword_26884DE70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26884DE70);
  }
  return result;
}

uint64_t sub_235F6AD28(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x7470697263736564 && a2 == 0xEB000000006E6F69;
  if (v3 || (sub_235F6C2E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x655674616D726F66 && a2 == 0xED00006E6F697372 || (sub_235F6C2E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x8000000235F6E0E0 || (sub_235F6C2E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x8000000235F6E100 || (sub_235F6C2E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x754E6C6169726573 && a2 == 0xEC0000007265626DLL || (sub_235F6C2E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x6E6564496D616574 && a2 == 0xEE00726569666974 || (sub_235F6C2E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x636E75614C707061 && a2 == 0xEC0000004C525568 || (sub_235F6C2E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0xD00000000000001ALL && a2 == 0x8000000235F6E120 || (sub_235F6C2E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0x756F72676B636162 && a2 == 0xEF726F6C6F43646ELL || (sub_235F6C2E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else if (a1 == 0x756F726765726F66 && a2 == 0xEF726F6C6F43646ELL || (sub_235F6C2E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 9;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x8000000235F6E140 || (sub_235F6C2E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 10;
  }
  else if (a1 == 0x6C6F436C6562616CLL && a2 == 0xEA0000000000726FLL || (sub_235F6C2E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 11;
  }
  else if (a1 == 0x747865546F676F6CLL && a2 == 0xE800000000000000 || (sub_235F6C2E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 12;
  }
  else if (a1 == 0x615068746C616568 && a2 == 0xEA00000000007373 || (sub_235F6C2E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 13;
  }
  else if (a1 == 0x7365646F63726162 && a2 == 0xE800000000000000 || (sub_235F6C2E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 14;
  }
  else if (a1 == 0x6974617269707865 && a2 == 0xEE00657461446E6FLL || (sub_235F6C2E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 15;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x8000000235F6E160 || (sub_235F6C2E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 16;
  }
  else if (a1 == 0x646564696F76 && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    return 17;
  }
  else
  {
    char v6 = sub_235F6C2E0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 17;
    }
    else {
      return 18;
    }
  }
}

uint64_t sub_235F6B45C(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x6946726564616568 && a2 == 0xEC00000073646C65;
  if (v3 || (sub_235F6C2E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x467972616D697270 && a2 == 0xED000073646C6569 || (sub_235F6C2E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x7261646E6F636573 && a2 == 0xEF73646C65694679 || (sub_235F6C2E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x7261696C69787561 && a2 == 0xEF73646C65694679 || (sub_235F6C2E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x6C6569466B636162 && a2 == 0xEA00000000007364)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    char v6 = sub_235F6C2E0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 4;
    }
    else {
      return 5;
    }
  }
}

uint64_t sub_235F6B6B4(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 7955819 && a2 == 0xE300000000000000;
  if (v3 || (sub_235F6C2E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6C6562616CLL && a2 == 0xE500000000000000 || (sub_235F6C2E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x65756C6176 && a2 == 0xE500000000000000 || (sub_235F6C2E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x67696C4174786574 && a2 == 0xED0000746E656D6ELL || (sub_235F6C2E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x7475626972747461 && a2 == 0xEF65756C61566465 || (sub_235F6C2E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x8000000235F6E180 || (sub_235F6C2E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x74537265626D756ELL && a2 == 0xEB00000000656C79 || (sub_235F6C2E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0x6C79745365746164 && a2 == 0xE900000000000065 || (sub_235F6C2E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0x6C797453656D6974 && a2 == 0xE900000000000065 || (sub_235F6C2E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else if (a1 == 0x547365726F6E6769 && a2 == 0xEF656E6F5A656D69 || (sub_235F6C2E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 9;
  }
  else if (a1 == 0x6974616C65527369 && a2 == 0xEA00000000006576 || (sub_235F6C2E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 10;
  }
  else if (a1 == 7827314 && a2 == 0xE300000000000000)
  {
    swift_bridgeObjectRelease();
    return 11;
  }
  else
  {
    char v6 = sub_235F6C2E0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 11;
    }
    else {
      return 12;
    }
  }
}

uint64_t sub_235F6BB78(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x74786554746C61 && a2 == 0xE700000000000000;
  if (v3 || (sub_235F6C2E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x74616D726F66 && a2 == 0xE600000000000000 || (sub_235F6C2E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6567617373656DLL && a2 == 0xE700000000000000 || (sub_235F6C2E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x456567617373656DLL && a2 == 0xEF676E69646F636ELL)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v6 = sub_235F6C2E0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

unint64_t sub_235F6BD2C()
{
  unint64_t result = qword_26884DE78;
  if (!qword_26884DE78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26884DE78);
  }
  return result;
}

uint64_t sub_235F6BD90()
{
  return MEMORY[0x270EEDE28]();
}

uint64_t sub_235F6BDA0()
{
  return MEMORY[0x270EEDE48]();
}

uint64_t sub_235F6BDB0()
{
  return MEMORY[0x270EEDE58]();
}

uint64_t sub_235F6BDC0()
{
  return MEMORY[0x270EEDE70]();
}

uint64_t sub_235F6BDD0()
{
  return MEMORY[0x270EEDEE8]();
}

uint64_t sub_235F6BDE0()
{
  return MEMORY[0x270EEDF30]();
}

uint64_t sub_235F6BDF0()
{
  return MEMORY[0x270EEDF38]();
}

uint64_t sub_235F6BE00()
{
  return MEMORY[0x270EEE920]();
}

uint64_t sub_235F6BE10()
{
  return MEMORY[0x270EEE930]();
}

uint64_t sub_235F6BE20()
{
  return MEMORY[0x270EEE950]();
}

uint64_t sub_235F6BE30()
{
  return MEMORY[0x270EEEEC0]();
}

uint64_t sub_235F6BE40()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_235F6BE50()
{
  return MEMORY[0x270EEFCB0]();
}

uint64_t sub_235F6BE60()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_235F6BE70()
{
  return MEMORY[0x270EEFD78]();
}

uint64_t sub_235F6BE80()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_235F6BE90()
{
  return MEMORY[0x270EEFF00]();
}

uint64_t sub_235F6BEA0()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_235F6BEB0()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_235F6BEC0()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_235F6BED0()
{
  return MEMORY[0x270EF09A8]();
}

uint64_t sub_235F6BEE0()
{
  return MEMORY[0x270EF09B8]();
}

uint64_t sub_235F6BEF0()
{
  return MEMORY[0x270EF0BA8]();
}

uint64_t sub_235F6BF00()
{
  return MEMORY[0x270EF0BB8]();
}

uint64_t sub_235F6BF10()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_235F6BF20()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_235F6BF30()
{
  return MEMORY[0x270EF0CB8]();
}

uint64_t sub_235F6BF40()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_235F6BF50()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_235F6BF60()
{
  return MEMORY[0x270EF15A8]();
}

uint64_t sub_235F6BF70()
{
  return MEMORY[0x270EF15C8]();
}

uint64_t sub_235F6BF80()
{
  return MEMORY[0x270EF1608]();
}

uint64_t sub_235F6BF90()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_235F6BFA0()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_235F6BFB0()
{
  return MEMORY[0x270FA2E30]();
}

uint64_t sub_235F6BFC0()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_235F6BFD0()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_235F6BFE0()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_235F6BFF0()
{
  return MEMORY[0x270EF1A28]();
}

uint64_t sub_235F6C000()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_235F6C010()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_235F6C020()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_235F6C030()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_235F6C040()
{
  return MEMORY[0x270F9DA80]();
}

uint64_t sub_235F6C050()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_235F6C060()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_235F6C070()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_235F6C080()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_235F6C090()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t sub_235F6C0A0()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_235F6C0B0()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_235F6C0C0()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_235F6C0D0()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_235F6C0E0()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_235F6C0F0()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_235F6C100()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_235F6C110()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_235F6C120()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_235F6C130()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_235F6C140()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_235F6C150()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_235F6C160()
{
  return MEMORY[0x270F9EA30]();
}

uint64_t sub_235F6C170()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_235F6C180()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_235F6C190()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_235F6C1A0()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_235F6C1B0()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_235F6C1C0()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_235F6C1D0()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_235F6C1E0()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_235F6C1F0()
{
  return MEMORY[0x270F9F088]();
}

uint64_t sub_235F6C200()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_235F6C210()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_235F6C220()
{
  return MEMORY[0x270F9F3B0]();
}

uint64_t sub_235F6C230()
{
  return MEMORY[0x270F9F3B8]();
}

uint64_t sub_235F6C240()
{
  return MEMORY[0x270F9F3D0]();
}

uint64_t sub_235F6C250()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t sub_235F6C260()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_235F6C270()
{
  return MEMORY[0x270F9F448]();
}

uint64_t sub_235F6C280()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_235F6C290()
{
  return MEMORY[0x270F9F4A8]();
}

uint64_t sub_235F6C2A0()
{
  return MEMORY[0x270F9F4C0]();
}

uint64_t sub_235F6C2B0()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_235F6C2C0()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_235F6C2D0()
{
  return MEMORY[0x270F9F4F8]();
}

uint64_t sub_235F6C2E0()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_235F6C2F0()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_235F6C300()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_235F6C310()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_235F6C320()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_235F6C330()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_235F6C340()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_235F6C350()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_235F6C360()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_235F6C370()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_235F6C380()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t HKSensitiveLogItem()
{
  return MEMORY[0x270EF3808]();
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x270EF2C48]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

uint64_t _HKInitializeLogging()
{
  return MEMORY[0x270EF3970]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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
  return (void *)MEMORY[0x270EDA328](__size);
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

uint64_t swift_allocError()
{
  return MEMORY[0x270FA0190]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x270FA01C8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x270FA01F0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x270FA0200]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x270FA0288]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x270FA02D0]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x270FA0348]();
}

uint64_t swift_getExistentialTypeMetadata()
{
  return MEMORY[0x270FA0358]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x270FA03D0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x270FA0528]();
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

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}