uint64_t FriendshipExpiration.wrapped.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  int v5;
  uint64_t result;
  uint64_t v7;

  v1 = sub_24E4D17A0();
  v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388]();
  v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v0, v1);
  v5 = (*(uint64_t (**)(char *, uint64_t))(v2 + 88))(v4, v1);
  result = 0;
  if (v5 != *MEMORY[0x263F3CDC8])
  {
    if (v5 == *MEMORY[0x263F3CDD0])
    {
      return 1;
    }
    else if (v5 == *MEMORY[0x263F3CDC0])
    {
      return 2;
    }
    else
    {
      result = sub_24E4D1F80();
      __break(1u);
    }
  }
  return result;
}

uint64_t FMLFriend.fmlFriend.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v35 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698ED9C0);
  ((void (*)(void))MEMORY[0x270FA5388])();
  v34 = (char *)&v28 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_24E4D1730();
  uint64_t v31 = *(void *)(v3 - 8);
  uint64_t v32 = v3;
  ((void (*)(void))MEMORY[0x270FA5388])();
  v33 = (char *)&v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698ED9C8);
  uint64_t v5 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  v30 = (char *)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  v8 = (char *)&v28 - v7;
  uint64_t v9 = sub_24E4D1710();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  v12 = (char *)&v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_24E4D1950();
  uint64_t v28 = *(void *)(v13 - 8);
  uint64_t v29 = v13;
  MEMORY[0x270FA5388](v13);
  id v14 = objc_msgSend(v1, sel_handle);
  id v15 = objc_msgSend(v14, sel_identifier);
  sub_24E4D1CC0();

  sub_24E4ABDFC(MEMORY[0x263F8EE78]);
  sub_24E4D1940();

  id v16 = objc_msgSend(v1, sel_handleType);
  if ((unint64_t)v16 >= 5) {
    goto LABEL_10;
  }
  (*(void (**)(char *, void, uint64_t))(v10 + 104))(v12, **((unsigned int **)&unk_26531C4A0 + (void)v16), v9);
  id v17 = objc_msgSend(v1, sel_expiry);
  if (v17)
  {
    v18 = v17;
    sub_24E4D16E0();

    uint64_t v19 = sub_24E4D16F0();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v8, 0, 1, v19);
  }
  else
  {
    uint64_t v20 = sub_24E4D16F0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v8, 1, 1, v20);
  }
  v21 = v30;
  id v22 = objc_msgSend(v1, sel_createdAt);
  if (v22)
  {
    v23 = v22;
    sub_24E4D16E0();

    uint64_t v24 = sub_24E4D16F0();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v21, 0, 1, v24);
  }
  else
  {
    uint64_t v25 = sub_24E4D16F0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v25 - 8) + 56))(v21, 1, 1, v25);
  }
  id v26 = objc_msgSend(v1, sel_origin);
  if ((unint64_t)v26 >= 3)
  {
LABEL_10:
    uint64_t result = sub_24E4D1F80();
    __break(1u);
  }
  else
  {
    (*(void (**)(char *, void, uint64_t))(v31 + 104))(v33, **((unsigned int **)&unk_26531C4C8 + (void)v26), v32);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v28 + 56))(v34, 1, 1, v29);
    return sub_24E4D18D0();
  }
  return result;
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

uint64_t FMLFriend.init(_:)(uint64_t a1)
{
  uint64_t v2 = sub_24E4D1730();
  uint64_t v54 = *(void *)(v2 - 8);
  uint64_t v55 = v2;
  uint64_t v3 = MEMORY[0x270FA5388](v2);
  v52 = (char *)&v47 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  v53 = (char *)&v47 - v5;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698ED9C8);
  uint64_t v7 = MEMORY[0x270FA5388](v6 - 8);
  v51 = (char *)&v47 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  v49 = (char *)&v47 - v9;
  uint64_t v10 = sub_24E4D1710();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  id v14 = (char *)&v47 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  id v16 = (char *)&v47 - v15;
  uint64_t v17 = sub_24E4D1950();
  uint64_t v18 = *(void *)(v17 - 8);
  MEMORY[0x270FA5388](v17);
  uint64_t v20 = (char *)&v47 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24E4D18E0();
  sub_24E4D1910();
  (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v17);
  uint64_t v21 = a1;
  id v22 = (void *)sub_24E4D1CB0();
  swift_bridgeObjectRelease();
  id v23 = objc_msgSend(self, sel_handleWithIdentifier_, v22);

  sub_24E4D18B0();
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v14, v16, v10);
  int v24 = (*(uint64_t (**)(char *, uint64_t))(v11 + 88))(v14, v10);
  uint64_t v25 = 0;
  if (v24 != *MEMORY[0x263F3CCD8])
  {
    if (v24 == *MEMORY[0x263F3CCE0])
    {
      uint64_t v25 = 1;
    }
    else if (v24 == *MEMORY[0x263F3CCC8])
    {
      uint64_t v25 = 2;
    }
    else if (v24 == *MEMORY[0x263F3CCD0])
    {
      uint64_t v25 = 3;
    }
    else
    {
      if (v24 != *MEMORY[0x263F3CCC0]) {
        goto LABEL_22;
      }
      uint64_t v25 = 4;
    }
  }
  uint64_t v48 = v25;
  id v50 = v23;
  (*(void (**)(char *, uint64_t))(v11 + 8))(v16, v10);
  id v26 = v49;
  sub_24E4D18F0();
  uint64_t v27 = sub_24E4D16F0();
  uint64_t v28 = *(void *)(v27 - 8);
  uint64_t v29 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v28 + 48);
  v30 = 0;
  if (v29(v26, 1, v27) != 1)
  {
    v30 = (void *)sub_24E4D16C0();
    (*(void (**)(char *, uint64_t))(v28 + 8))(v26, v27);
  }
  uint64_t v31 = v51;
  sub_24E4D18C0();
  unsigned int v32 = v29(v31, 1, v27);
  v33 = v53;
  if (v32 == 1)
  {
    v34 = 0;
  }
  else
  {
    v34 = (void *)sub_24E4D16C0();
    (*(void (**)(char *, uint64_t))(v28 + 8))(v31, v27);
  }
  uint64_t v35 = v54;
  sub_24E4D1890();
  v36 = v52;
  uint64_t v37 = v55;
  (*(void (**)(char *, char *, uint64_t))(v35 + 16))(v52, v33, v55);
  int v38 = (*(uint64_t (**)(char *, uint64_t))(v35 + 88))(v36, v37);
  if (v38 == *MEMORY[0x263F3CCF8])
  {
    uint64_t v39 = 0;
LABEL_21:
    id v40 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
    (*(void (**)(char *, uint64_t))(v35 + 8))(v33, v37);
    uint64_t v41 = sub_24E4D18A0() & 1;
    v42 = v40;
    v43 = v50;
    id v44 = objc_msgSend(v42, sel_initWithHandle_handleType_createDate_expiry_origin_originatedFromTheSameClient_, v50, v48, v30, v34, v39, v41);

    uint64_t v45 = sub_24E4D1900();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v45 - 8) + 8))(v21, v45);
    return (uint64_t)v44;
  }
  if (v38 == *MEMORY[0x263F3CD00])
  {
    uint64_t v39 = 1;
    goto LABEL_21;
  }
  if (v38 == *MEMORY[0x263F3CD10])
  {
    uint64_t v39 = 2;
    goto LABEL_21;
  }
LABEL_22:
  uint64_t result = sub_24E4D1F80();
  __break(1u);
  return result;
}

uint64_t sub_24E4AB964(uint64_t a1)
{
  uint64_t v2 = sub_24E4ABFDC(&qword_2698ED9F8, type metadata accessor for FMLSessionError);

  return MEMORY[0x270EF2670](a1, v2);
}

uint64_t sub_24E4AB9D0(uint64_t a1)
{
  uint64_t v2 = sub_24E4ABFDC(&qword_2698ED9F8, type metadata accessor for FMLSessionError);

  return MEMORY[0x270EF2668](a1, v2);
}

uint64_t sub_24E4ABA40(uint64_t a1)
{
  uint64_t v2 = sub_24E4ABFDC(&qword_2698EDA30, type metadata accessor for FMLSessionError);

  return MEMORY[0x270EEF788](a1, v2);
}

id sub_24E4ABAAC()
{
  return *v0;
}

uint64_t sub_24E4ABAB4@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t sub_24E4ABABC()
{
  return sub_24E4D1CC0();
}

uint64_t sub_24E4ABACC(uint64_t a1)
{
  uint64_t v2 = sub_24E4ABFDC(&qword_2698EDA30, type metadata accessor for FMLSessionError);

  return MEMORY[0x270EEF7E8](a1, v2);
}

uint64_t sub_24E4ABB38(uint64_t a1)
{
  uint64_t v2 = sub_24E4ABFDC(&qword_2698EDA30, type metadata accessor for FMLSessionError);

  return MEMORY[0x270EEF7A0](a1, v2);
}

uint64_t sub_24E4ABBA4(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_24E4ABFDC(&qword_2698EDA30, type metadata accessor for FMLSessionError);
  id v5 = a1;

  return MEMORY[0x270EEF790](v5, a2, v4);
}

uint64_t sub_24E4ABC34()
{
  id v1 = *v0;
  uint64_t v2 = sub_24E4D1EA0();

  return v2;
}

uint64_t sub_24E4ABC6C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24E4ABFDC(&qword_2698EDA30, type metadata accessor for FMLSessionError);

  return MEMORY[0x270EEF7D0](a1, a2, v4);
}

uint64_t sub_24E4ABCE8()
{
  return sub_24E4D2070();
}

void *sub_24E4ABD48@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_24E4ABD58(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_24E4ABD64(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24E4ABFDC(&qword_2698EDA30, type metadata accessor for FMLSessionError);

  return MEMORY[0x270EEF7B8](a1, a2, a3, v6);
}

BOOL sub_24E4ABDE8(void *a1, void *a2)
{
  return *a1 == *a2;
}

unint64_t sub_24E4ABDFC(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698EDA38);
  uint64_t v2 = (void *)sub_24E4D1FD0();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 48);
  while (1)
  {
    uint64_t v5 = *(v4 - 2);
    uint64_t v6 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    unint64_t result = sub_24E4CA4B0(v5, v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v10 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v10 = v5;
    v10[1] = v6;
    *(void *)(v2[7] + 8 * result) = v7;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v2[2] = v13;
    v4 += 3;
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

void type metadata accessor for FMLFriendshipUpdateType(uint64_t a1)
{
}

void type metadata accessor for FMLLocationShareState(uint64_t a1)
{
}

void type metadata accessor for FMLSessionError(uint64_t a1)
{
}

uint64_t sub_24E4ABF4C()
{
  return sub_24E4ABFDC(&qword_2698ED9E8, type metadata accessor for FMLSessionError);
}

uint64_t sub_24E4ABF94()
{
  return sub_24E4ABFDC(&qword_2698ED9F0, type metadata accessor for FMLSessionError);
}

uint64_t sub_24E4ABFDC(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_24E4AC024()
{
  return sub_24E4ABFDC(&qword_2698ED9F8, type metadata accessor for FMLSessionError);
}

uint64_t sub_24E4AC06C()
{
  return sub_24E4ABFDC(&qword_2698EDA00, type metadata accessor for FMLSessionError);
}

uint64_t sub_24E4AC0B4()
{
  return sub_24E4ABFDC(&qword_2698EDA08, type metadata accessor for FMLSessionError);
}

uint64_t sub_24E4AC0FC()
{
  return sub_24E4ABFDC(&qword_2698EDA10, type metadata accessor for Code);
}

void type metadata accessor for Code(uint64_t a1)
{
}

uint64_t sub_24E4AC158()
{
  return sub_24E4ABFDC(&qword_2698EDA18, type metadata accessor for Code);
}

unint64_t sub_24E4AC1A4()
{
  unint64_t result = qword_2698EDA20;
  if (!qword_2698EDA20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698EDA20);
  }
  return result;
}

uint64_t sub_24E4AC1F8()
{
  return sub_24E4ABFDC(&qword_2698EDA28, type metadata accessor for Code);
}

uint64_t sub_24E4AC240()
{
  return sub_24E4ABFDC(&qword_2698EDA30, type metadata accessor for FMLSessionError);
}

void type metadata accessor for FMLFriendshipExpiration(uint64_t a1)
{
}

void type metadata accessor for FMLLocatePriority(uint64_t a1)
{
}

void type metadata accessor for FMLHandleType(uint64_t a1)
{
}

void sub_24E4AC2C4(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

id sub_24E4AC30C(uint64_t a1)
{
  sub_24E4D1BD0();
  uint64_t v2 = (void *)sub_24E4D1CB0();
  swift_bridgeObjectRelease();
  sub_24E4D1BA0();
  uint64_t v3 = (void *)sub_24E4D1CB0();
  swift_bridgeObjectRelease();
  sub_24E4D1BC0();
  uint64_t v4 = (void *)sub_24E4D1CB0();
  swift_bridgeObjectRelease();
  sub_24E4D1BE0();
  uint64_t v5 = (void *)sub_24E4D1CB0();
  swift_bridgeObjectRelease();
  sub_24E4D1B90();
  uint64_t v6 = (void *)sub_24E4D1CB0();
  swift_bridgeObjectRelease();
  sub_24E4D1B80();
  uint64_t v7 = (void *)sub_24E4D1CB0();
  swift_bridgeObjectRelease();
  sub_24E4D1BB0();
  id v8 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  char v9 = (void *)sub_24E4D1D20();
  swift_bridgeObjectRelease();
  id v10 = objc_msgSend(v8, sel_initWithLocality_administrativeArea_country_stateCode_streetAddress_streetName_formattedAddressLines_, v2, v3, v4, v5, v6, v7, v9);

  uint64_t v11 = sub_24E4D1BF0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(a1, v11);
  return v10;
}

uint64_t sub_24E4AC4FC(uint64_t a1)
{
  uint64_t v45 = sub_24E4D1740();
  uint64_t v2 = *(void *)(v45 - 8);
  uint64_t v3 = MEMORY[0x270FA5388](v45);
  uint64_t v5 = (char *)&v44 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)&v44 - v6;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698EDA60);
  MEMORY[0x270FA5388](v8 - 8);
  id v10 = (char *)&v44 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_24E4D1BF0();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v44 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)&v44 - v16;
  sub_24E4D1B20();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1)
  {
    sub_24E4AC9FC((uint64_t)v10);
    id v18 = 0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v17, v10, v11);
    sub_24E4ACA5C();
    (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v15, v17, v11);
    id v18 = sub_24E4AC30C((uint64_t)v15);
    (*(void (**)(char *, uint64_t))(v12 + 8))(v17, v11);
  }
  sub_24E4D1B30();
  double v20 = v19;
  sub_24E4D1B50();
  double v22 = v21;
  sub_24E4D1B00();
  double v24 = v23;
  uint64_t v25 = sub_24E4D1AB0();
  if (v25 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_19;
  }
  uint64_t v26 = v25;
  if (v25 > 0x7FFFFFFF)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  sub_24E4D1AF0();
  double v28 = v27;
  sub_24E4D1B10();
  uint64_t v29 = (void *)sub_24E4D1D20();
  swift_bridgeObjectRelease();
  sub_24E4D1B40();
  double v31 = v30;
  sub_24E4D1B60();
  double v33 = v32;
  sub_24E4D1AD0();
  double v35 = v34;
  sub_24E4D1AC0();
  uint64_t v36 = v45;
  (*(void (**)(char *, char *, uint64_t))(v2 + 16))(v5, v7, v45);
  int v37 = (*(uint64_t (**)(char *, uint64_t))(v2 + 88))(v5, v36);
  if (v37 != *MEMORY[0x263F3CD38])
  {
    if (v37 == *MEMORY[0x263F3CD28])
    {
      uint64_t v38 = 1;
      goto LABEL_14;
    }
    if (v37 == *MEMORY[0x263F3CD30])
    {
      uint64_t v38 = 2;
      goto LABEL_14;
    }
    if (v37 == *MEMORY[0x263F3CD40])
    {
      uint64_t v38 = 3;
      goto LABEL_14;
    }
LABEL_20:
    uint64_t result = sub_24E4D1F80();
    __break(1u);
    return result;
  }
  uint64_t v38 = 0;
LABEL_14:
  (*(void (**)(char *, uint64_t))(v2 + 8))(v7, v36);
  sub_24E4D1AE0();
  if (v39)
  {
    id v40 = (void *)sub_24E4D1CB0();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v40 = 0;
  }
  id v41 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithAddress_altitude_longitude_speed_floorLevel_horizontalAccuracy_labels_latitude_timestamp_verticalAccuracy_locationType_coarseAddressLabel_, v18, v26, v29, v38, v40, v20, v22, v24, v28, v31, v33, v35);

  uint64_t v42 = sub_24E4D1B70();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v42 - 8) + 8))(a1, v42);
  return (uint64_t)v41;
}

uint64_t sub_24E4AC9FC(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698EDA60);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_24E4ACA5C()
{
  unint64_t result = qword_2698EDA68;
  if (!qword_2698EDA68)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2698EDA68);
  }
  return result;
}

id sub_24E4ACA9C(uint64_t a1)
{
  id v2 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  sub_24E4D1830();
  uint64_t v3 = (void *)sub_24E4D1CB0();
  swift_bridgeObjectRelease();
  sub_24E4D1820();
  uint64_t v4 = (void *)sub_24E4D1CB0();
  swift_bridgeObjectRelease();
  sub_24E4D1800();
  uint64_t v5 = (void *)sub_24E4D1CB0();
  swift_bridgeObjectRelease();
  char v6 = sub_24E4D1860();
  char v7 = sub_24E4D1810();
  char v8 = sub_24E4D1840();
  LOBYTE(v12) = sub_24E4D1850() & 1;
  id v9 = objc_msgSend(v2, sel_initWithIdentifier_deviceName_idsDeviceId_isActive_isThisDevice_isCompanion_isAutoMeCapable_, v3, v4, v5, v6 & 1, v7 & 1, v8 & 1, v12);

  uint64_t v10 = sub_24E4D1870();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(a1, v10);
  return v9;
}

uint64_t sub_24E4ACBD0()
{
  uint64_t v0 = sub_24E4D1C20();
  __swift_allocate_value_buffer(v0, qword_26B1C13D8);
  __swift_project_value_buffer(v0, (uint64_t)qword_26B1C13D8);
  return sub_24E4D1C10();
}

uint64_t sub_24E4ACC48()
{
  uint64_t v0 = sub_24E4D1C20();
  __swift_allocate_value_buffer(v0, qword_26B1C13C0);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)qword_26B1C13C0);
  if (qword_26B1C1320 != -1) {
    swift_once();
  }
  uint64_t v2 = __swift_project_value_buffer(v0, (uint64_t)qword_26B1C13D8);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);

  return v3(v1, v2, v0);
}

uint64_t sub_24E4ACDEC()
{
  return sub_24E4AD630(&OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap_locationUpdateCallback, (void (*)(void, void))sub_24E4ACE0C);
}

uint64_t sub_24E4ACE0C(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

void sub_24E4ACE1C(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void (**)(void *, id))(a1 + 32);
  swift_retain();
  id v7 = a2;
  id v6 = a3;
  v5(a2, v6);
  swift_release();
}

uint64_t sub_24E4ACF44(uint64_t a1, uint64_t a2)
{
  return sub_24E4AD7C8(a1, a2, &OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap_locationUpdateCallback, (uint64_t (*)(uint64_t, uint64_t))sub_24E4ACF64);
}

uint64_t sub_24E4ACF64(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_24E4ACF74@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = (uint64_t *)(*a1 + OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap_locationUpdateCallback);
  swift_beginAccess();
  uint64_t v4 = *v3;
  uint64_t v5 = v3[1];
  if (v4)
  {
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v4;
    *(void *)(v6 + 24) = v5;
    id v7 = sub_24E4B0304;
  }
  else
  {
    id v7 = 0;
    uint64_t v6 = 0;
  }
  *a2 = v7;
  a2[1] = v6;
  return sub_24E4ACE0C(v4);
}

uint64_t sub_24E4AD014(uint64_t *a1, void *a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = a1[1];
  if (*a1)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v3;
    *(void *)(v5 + 24) = v4;
    uint64_t v6 = sub_24E4B0298;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v5 = 0;
  }
  id v7 = (uint64_t *)(*a2 + OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap_locationUpdateCallback);
  swift_beginAccess();
  uint64_t v8 = *v7;
  *id v7 = (uint64_t)v6;
  v7[1] = v5;
  sub_24E4ACE0C(v3);
  return sub_24E4ACF64(v8);
}

uint64_t (*sub_24E4AD0DC())()
{
  return j__swift_endAccess;
}

uint64_t sub_24E4AD218()
{
  return sub_24E4AD630(&OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap_friendshipUpdateCallback, (void (*)(void, void))sub_24E4B0AB8);
}

void sub_24E4AD238(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t sub_24E4AD350(uint64_t a1, uint64_t a2)
{
  return sub_24E4AD7C8(a1, a2, &OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap_friendshipUpdateCallback, (uint64_t (*)(uint64_t, uint64_t))sub_24E4B0ABC);
}

uint64_t sub_24E4AD370@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = (uint64_t *)(*a1 + OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap_friendshipUpdateCallback);
  swift_beginAccess();
  uint64_t v4 = *v3;
  uint64_t v5 = v3[1];
  if (v4)
  {
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v4;
    *(void *)(v6 + 24) = v5;
    id v7 = sub_24E4B02D4;
  }
  else
  {
    id v7 = 0;
    uint64_t v6 = 0;
  }
  *a2 = v7;
  a2[1] = v6;
  return sub_24E4ACE0C(v4);
}

uint64_t sub_24E4AD410(uint64_t *a1, void *a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = a1[1];
  if (*a1)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v3;
    *(void *)(v5 + 24) = v4;
    uint64_t v6 = sub_24E4B0298;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v5 = 0;
  }
  id v7 = (uint64_t *)(*a2 + OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap_friendshipUpdateCallback);
  swift_beginAccess();
  uint64_t v8 = *v7;
  *id v7 = (uint64_t)v6;
  v7[1] = v5;
  sub_24E4ACE0C(v3);
  return sub_24E4ACF64(v8);
}

uint64_t (*sub_24E4AD4D8())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_24E4AD610()
{
  return sub_24E4AD630(&OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap_meDeviceUpdateCallback, (void (*)(void, void))sub_24E4B0AB8);
}

uint64_t sub_24E4AD630(void *a1, void (*a2)(void, void))
{
  uint64_t v4 = (void *)(v2 + *a1);
  swift_beginAccess();
  uint64_t v5 = *v4;
  a2(*v4, v4[1]);
  return v5;
}

void sub_24E4AD698(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

uint64_t sub_24E4AD7A8(uint64_t a1, uint64_t a2)
{
  return sub_24E4AD7C8(a1, a2, &OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap_meDeviceUpdateCallback, (uint64_t (*)(uint64_t, uint64_t))sub_24E4B0ABC);
}

uint64_t sub_24E4AD7C8(uint64_t a1, uint64_t a2, void *a3, uint64_t (*a4)(uint64_t, uint64_t))
{
  uint64_t v8 = (uint64_t *)(v4 + *a3);
  swift_beginAccess();
  uint64_t v9 = *v8;
  uint64_t v10 = v8[1];
  uint64_t *v8 = a1;
  v8[1] = a2;
  return a4(v9, v10);
}

uint64_t sub_24E4AD82C@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = (uint64_t *)(*a1 + OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap_meDeviceUpdateCallback);
  swift_beginAccess();
  uint64_t v4 = *v3;
  uint64_t v5 = v3[1];
  if (v4)
  {
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v4;
    *(void *)(v6 + 24) = v5;
    id v7 = sub_24E4B026C;
  }
  else
  {
    id v7 = 0;
    uint64_t v6 = 0;
  }
  *a2 = v7;
  a2[1] = v6;
  return sub_24E4ACE0C(v4);
}

uint64_t sub_24E4AD8CC(uint64_t *a1, void *a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = a1[1];
  if (*a1)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v3;
    *(void *)(v5 + 24) = v4;
    uint64_t v6 = sub_24E4B0234;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v5 = 0;
  }
  id v7 = (uint64_t *)(*a2 + OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap_meDeviceUpdateCallback);
  swift_beginAccess();
  uint64_t v8 = *v7;
  *id v7 = (uint64_t)v6;
  v7[1] = v5;
  sub_24E4ACE0C(v3);
  return sub_24E4ACF64(v8);
}

uint64_t (*sub_24E4AD994())()
{
  return j_j__swift_endAccess;
}

id ObjCBootstrap.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

id ObjCBootstrap.init()()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C1360);
  MEMORY[0x270FA5388](v1 - 8);
  double v30 = (char *)v27 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_24E4D1E30();
  MEMORY[0x270FA5388](v3);
  uint64_t v29 = (char *)v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_24E4D1C50();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v6 = sub_24E4D1E40();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = &v0[OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap_locationUpdateCallback];
  *uint64_t v10 = 0;
  v10[1] = 0;
  uint64_t v11 = &v0[OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap_friendshipUpdateCallback];
  *uint64_t v11 = 0;
  v11[1] = 0;
  uint64_t v12 = &v0[OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap_meDeviceUpdateCallback];
  void *v12 = 0;
  v12[1] = 0;
  uint64_t v13 = &v0[OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap_locationRefreshTaskLock];
  *(_DWORD *)uint64_t v13 = 0;
  *((void *)v13 + 1) = 0;
  uint64_t v14 = &v0[OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap_friendsUpdateTaskLock];
  *(_DWORD *)uint64_t v14 = 0;
  *((void *)v14 + 1) = 0;
  *(void *)&v0[OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap__session] = 0;
  v0[OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap_isInitialized] = 0;
  uint64_t v15 = MEMORY[0x263F8EE78];
  *(void *)&v0[OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap_initContinuations] = MEMORY[0x263F8EE78];
  uint64_t v28 = OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap_serialQueue;
  v27[1] = sub_24E4ADE3C();
  uint64_t v16 = *MEMORY[0x263F8F138];
  uint64_t v17 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 104);
  id v18 = v0;
  v17(v9, v16, v6);
  sub_24E4D1C40();
  uint64_t v32 = v15;
  sub_24E4B07AC(&qword_26B1C1378, MEMORY[0x263F8F0F8]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C1348);
  sub_24E4B07F4(&qword_26B1C1350, &qword_26B1C1348);
  sub_24E4D1EE0();
  *(void *)&v0[v28] = sub_24E4D1E70();
  uint64_t v19 = MEMORY[0x263F8EE80];
  *(void *)&v18[OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap_followings] = MEMORY[0x263F8EE80];
  *(void *)&v18[OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap_followers] = v19;
  *(void *)&v18[OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap_pendingOffers] = v19;
  *(void *)&v18[OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap_locationForHandles] = v19;

  double v20 = (objc_class *)type metadata accessor for ObjCBootstrap();
  v31.receiver = v18;
  v31.super_class = v20;
  id v21 = objc_msgSendSuper2(&v31, sel_init);
  uint64_t v22 = sub_24E4D1DB0();
  uint64_t v23 = (uint64_t)v30;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v30, 1, 1, v22);
  double v24 = (void *)swift_allocObject();
  v24[2] = 0;
  v24[3] = 0;
  v24[4] = v21;
  id v25 = v21;
  sub_24E4AE180(v23, (uint64_t)&unk_2698EDAE0, (uint64_t)v24);
  swift_release();
  return v25;
}

unint64_t sub_24E4ADE3C()
{
  unint64_t result = qword_26B1C1380;
  if (!qword_26B1C1380)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26B1C1380);
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

uint64_t type metadata accessor for ObjCBootstrap()
{
  return self;
}

uint64_t sub_24E4ADEE8()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_24E4B0B04;
  return sub_24E4AE350();
}

uint64_t sub_24E4ADF78()
{
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_24E4ADFB8()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_24E4AE08C;
  uint64_t v2 = (void *)swift_task_alloc();
  v1[2] = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_24E4B0B04;
  return sub_24E4AE350();
}

uint64_t sub_24E4AE08C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_24E4AE180(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24E4D1DB0();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_24E4D1DA0();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_24E4B09A4(a1, &qword_26B1C1360);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_24E4D1D80();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_24E4AE350()
{
  v1[19] = v0;
  v1[20] = swift_getObjectType();
  uint64_t v2 = sub_24E4D1730();
  v1[21] = v2;
  v1[22] = *(void *)(v2 - 8);
  v1[23] = swift_task_alloc();
  v1[24] = swift_task_alloc();
  v1[25] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24E4AE438, 0, 0);
}

uint64_t sub_24E4AE438()
{
  v49 = v0;
  id v1 = objc_msgSend(self, sel_mainBundle);
  id v2 = objc_msgSend(v1, sel_bundleIdentifier);

  uint64_t v3 = (unsigned int *)MEMORY[0x263F3CD00];
  if (v2)
  {
    uint64_t v4 = sub_24E4D1CC0();
    uint64_t v6 = v5;

    v0[8] = v4;
    v0[10] = 0xD000000000000013;
    v0[9] = v6;
    v0[11] = 0x800000024E4D32E0;
    sub_24E4B0144();
    if (sub_24E4D1ED0())
    {
      swift_bridgeObjectRelease();
LABEL_5:
      uint64_t v8 = v0[25];
      uint64_t v9 = v0[21];
      uint64_t v10 = v0[22];
      uint64_t v11 = *v3;
      goto LABEL_7;
    }
    v0[12] = v4;
    v0[13] = v6;
    v0[14] = 0xD000000000000012;
    v0[15] = 0x800000024E4D3300;
    char v7 = sub_24E4D1ED0();
    swift_bridgeObjectRelease();
    if (v7) {
      goto LABEL_5;
    }
  }
  uint64_t v8 = v0[25];
  uint64_t v9 = v0[21];
  uint64_t v10 = v0[22];
  uint64_t v11 = *MEMORY[0x263F3CD10];
LABEL_7:
  uint64_t v47 = *(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 104);
  v47(v8, v11, v9);
  if (qword_26B1C1318 != -1) {
    swift_once();
  }
  uint64_t v13 = v0[24];
  uint64_t v12 = v0[25];
  uint64_t v15 = v0[21];
  uint64_t v14 = v0[22];
  uint64_t v16 = sub_24E4D1C20();
  v0[26] = __swift_project_value_buffer(v16, (uint64_t)qword_26B1C13C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 16))(v13, v12, v15);
  uint64_t v17 = sub_24E4D1C00();
  os_log_type_t v18 = sub_24E4D1E20();
  BOOL v19 = os_log_type_enabled(v17, v18);
  uint64_t v20 = v0[24];
  uint64_t v22 = v0[21];
  uint64_t v21 = v0[22];
  if (v19)
  {
    uint64_t v23 = (uint8_t *)swift_slowAlloc();
    uint64_t v24 = swift_slowAlloc();
    uint64_t v48 = v24;
    *(_DWORD *)uint64_t v23 = 136315138;
    sub_24E4B07AC(&qword_2698EDB00, MEMORY[0x263F3CD18]);
    uint64_t v25 = sub_24E4D1FF0();
    v0[17] = sub_24E4CAAA0(v25, v26, &v48);
    sub_24E4D1EB0();
    swift_bridgeObjectRelease();
    double v27 = *(void (**)(uint64_t, uint64_t))(v21 + 8);
    v27(v20, v22);
    _os_log_impl(&dword_24E4A6000, v17, v18, "Init Session with origin: %s", v23, 0xCu);
    swift_arrayDestroy();
    uint64_t v28 = v24;
    uint64_t v3 = (unsigned int *)MEMORY[0x263F3CD00];
    MEMORY[0x25333CC90](v28, -1, -1);
    MEMORY[0x25333CC90](v23, -1, -1);
  }
  else
  {
    double v27 = *(void (**)(uint64_t, uint64_t))(v21 + 8);
    v27(v0[24], v0[21]);
  }

  v0[27] = v27;
  double v30 = (char *)v0[19];
  uint64_t v29 = v0[20];
  sub_24E4D1AA0();
  uint64_t v31 = sub_24E4D19B0();
  v0[28] = v31;
  uint64_t v32 = *(NSObject **)&v30[OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap_serialQueue];
  double v33 = (void *)swift_allocObject();
  v0[29] = v33;
  v33[2] = v30;
  v33[3] = v31;
  v33[4] = v29;
  uint64_t v34 = swift_allocObject();
  *(void *)(v34 + 16) = sub_24E4AF5EC;
  *(void *)(v34 + 24) = v33;
  v0[6] = sub_24E4AF608;
  v0[7] = v34;
  v0[2] = MEMORY[0x263EF8330];
  v0[3] = 1107296256;
  v0[4] = sub_24E4AF1E4;
  v0[5] = &block_descriptor;
  double v35 = _Block_copy(v0 + 2);
  uint64_t v36 = v30;
  swift_retain();
  swift_retain();
  swift_release();
  dispatch_sync(v32, v35);
  _Block_release(v35);
  LOBYTE(v35) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  if (v35)
  {
    __break(1u);
    return MEMORY[0x270F29748]();
  }
  uint64_t v38 = v0[22];
  uint64_t v37 = v0[23];
  uint64_t v39 = v0[21];
  v47(v37, *v3, v39);
  char v40 = sub_24E4D1720();
  v0[30] = (v38 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v27(v37, v39);
  if (v40)
  {
    id v41 = sub_24E4D1C00();
    os_log_type_t v42 = sub_24E4D1E20();
    if (os_log_type_enabled(v41, v42))
    {
      v43 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v43 = 0;
      _os_log_impl(&dword_24E4A6000, v41, v42, "Subscribing to background proactive locations", v43, 2u);
      MEMORY[0x25333CC90](v43, -1, -1);
    }

    uint64_t v44 = (void *)swift_task_alloc();
    v0[31] = v44;
    *uint64_t v44 = v0;
    v44[1] = sub_24E4AEACC;
    return MEMORY[0x270F29748]();
  }
  v27(v0[25], v0[21]);
  swift_release();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v45 = (uint64_t (*)(void))v0[1];
  return v45();
}

uint64_t sub_24E4AEACC()
{
  *(void *)(*(void *)v1 + 256) = v0;
  swift_task_dealloc();
  if (v0) {
    id v2 = sub_24E4AED10;
  }
  else {
    id v2 = sub_24E4AEBE0;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24E4AEBE0()
{
  uint64_t v1 = sub_24E4D1C00();
  os_log_type_t v2 = sub_24E4D1E20();
  BOOL v3 = os_log_type_enabled(v1, v2);
  uint64_t v4 = (void (*)(uint64_t, uint64_t))v0[27];
  uint64_t v5 = v0[25];
  uint64_t v6 = v0[21];
  if (v3)
  {
    char v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)char v7 = 0;
    _os_log_impl(&dword_24E4A6000, v1, v2, "Finished subscribing to background proactive locations", v7, 2u);
    MEMORY[0x25333CC90](v7, -1, -1);
  }

  swift_release();
  v4(v5, v6);
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v8 = (uint64_t (*)(void))v0[1];
  return v8();
}

uint64_t sub_24E4AED10()
{
  uint64_t v22 = v0;
  uint64_t v1 = (void *)v0[32];
  id v2 = v1;
  id v3 = v1;
  uint64_t v4 = sub_24E4D1C00();
  os_log_type_t v5 = sub_24E4D1E10();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (void *)v0[32];
    uint64_t v19 = v0[25];
    uint64_t v20 = (void (*)(uint64_t, uint64_t))v0[27];
    uint64_t v18 = v0[21];
    char v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    *(_DWORD *)char v7 = 136446210;
    uint64_t v21 = v8;
    v0[18] = v6;
    id v9 = v6;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2698EDAF8);
    uint64_t v10 = sub_24E4D1CD0();
    v0[16] = sub_24E4CAAA0(v10, v11, &v21);
    sub_24E4D1EB0();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_24E4A6000, v4, v5, "Background proactive locations subscription error: %{public}s", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25333CC90](v8, -1, -1);
    MEMORY[0x25333CC90](v7, -1, -1);

    swift_release();
    v20(v19, v18);
  }
  else
  {
    uint64_t v12 = (void *)v0[32];
    uint64_t v13 = (void (*)(uint64_t, uint64_t))v0[27];
    uint64_t v14 = v0[25];
    uint64_t v15 = v0[21];

    swift_release();
    v13(v14, v15);
  }
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v16 = (uint64_t (*)(void))v0[1];
  return v16();
}

uint64_t sub_24E4AEF74(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C1358);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  char v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26B1C1318 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_24E4D1C20();
  __swift_project_value_buffer(v8, (uint64_t)qword_26B1C13C0);
  id v9 = sub_24E4D1C00();
  os_log_type_t v10 = sub_24E4D1E20();
  if (os_log_type_enabled(v9, v10))
  {
    unint64_t v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v11 = 0;
    _os_log_impl(&dword_24E4A6000, v9, v10, "FindMyLocate.Session async init is done.", v11, 2u);
    MEMORY[0x25333CC90](v11, -1, -1);
  }

  *(void *)(a1 + OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap__session) = a2;
  swift_retain();
  swift_release();
  uint64_t v12 = (uint64_t *)(a1 + OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap_initContinuations);
  swift_beginAccess();
  uint64_t v13 = *v12;
  uint64_t v14 = *(void *)(*v12 + 16);
  if (v14)
  {
    uint64_t v22 = v12;
    uint64_t v23 = a1;
    uint64_t v17 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
    uint64_t v15 = v5 + 16;
    uint64_t v16 = v17;
    uint64_t v18 = v13 + ((*(unsigned __int8 *)(v15 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 64));
    uint64_t v19 = *(void *)(v15 + 56);
    swift_bridgeObjectRetain();
    do
    {
      v16(v7, v18, v4);
      sub_24E4D1D90();
      (*(void (**)(char *, uint64_t))(v15 - 8))(v7, v4);
      v18 += v19;
      --v14;
    }
    while (v14);
    swift_bridgeObjectRelease();
    uint64_t v12 = v22;
    a1 = v23;
  }
  uint64_t *v12 = MEMORY[0x263F8EE78];
  uint64_t result = swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap_isInitialized) = 1;
  return result;
}

uint64_t sub_24E4AF1E4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

id ObjCBootstrap.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ObjCBootstrap();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for ObjCBootstrap(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ObjCBootstrap);
}

uint64_t dispatch thunk of ObjCBootstrap.locationUpdateCallback.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of ObjCBootstrap.locationUpdateCallback.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of ObjCBootstrap.locationUpdateCallback.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of ObjCBootstrap.friendshipUpdateCallback.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of ObjCBootstrap.friendshipUpdateCallback.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of ObjCBootstrap.friendshipUpdateCallback.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of ObjCBootstrap.meDeviceUpdateCallback.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of ObjCBootstrap.meDeviceUpdateCallback.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xF0))();
}

uint64_t dispatch thunk of ObjCBootstrap.meDeviceUpdateCallback.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xF8))();
}

uint64_t sub_24E4AF54C()
{
  if (MEMORY[0x263F8EEE0]) {
    return __swift_instantiateConcreteTypeFromMangledName(&qword_2698EDAF0);
  }
  else {
    return MEMORY[0x263F8EE60] + 8;
  }
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_24E4AF5AC()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_24E4AF5EC()
{
  return sub_24E4AEF74(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_24E4AF5F8()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24E4AF608()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
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

uint64_t sub_24E4AF648(uint64_t a1, char *a2, uint64_t a3)
{
  v19[0] = a3;
  uint64_t v5 = sub_24E4D1C30();
  uint64_t v22 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  char v7 = (char *)v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_24E4D1C50();
  uint64_t v20 = *(void *)(v8 - 8);
  uint64_t v21 = v8;
  MEMORY[0x270FA5388](v8);
  os_log_type_t v10 = (char *)v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C1358);
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(void *)(v12 + 64);
  MEMORY[0x270FA5388](v11);
  v19[1] = *(void *)&a2[OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap_serialQueue];
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))((char *)v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v11);
  unint64_t v14 = (*(unsigned __int8 *)(v12 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = a2;
  (*(void (**)(unint64_t, char *, uint64_t))(v12 + 32))(v15 + v14, (char *)v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), v11);
  *(void *)(v15 + ((v13 + v14 + 7) & 0xFFFFFFFFFFFFFFF8)) = v19[0];
  aBlock[4] = sub_24E4B0718;
  aBlock[5] = v15;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_24E4B0B08;
  aBlock[3] = &block_descriptor_78;
  uint64_t v16 = _Block_copy(aBlock);
  uint64_t v17 = a2;
  sub_24E4D1C40();
  uint64_t v23 = MEMORY[0x263F8EE78];
  sub_24E4B07AC(&qword_26B1C1328, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C1338);
  sub_24E4B07F4((unint64_t *)&qword_26B1C1340, &qword_26B1C1338);
  sub_24E4D1EE0();
  MEMORY[0x25333C4D0](0, v10, v7, v16);
  _Block_release(v16);
  (*(void (**)(char *, uint64_t))(v22 + 8))(v7, v5);
  (*(void (**)(char *, uint64_t))(v20 + 8))(v10, v21);
  return swift_release();
}

uint64_t sub_24E4AF9DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C1358);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  char v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(unsigned char *)(a1 + OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap_isInitialized))
  {
    if (qword_26B1C1318 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_24E4D1C20();
    __swift_project_value_buffer(v8, (uint64_t)qword_26B1C13C0);
    uint64_t v9 = sub_24E4D1C00();
    os_log_type_t v10 = sub_24E4D1E20();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_24E4A6000, v9, v10, "Init is done. Resume all.", v11, 2u);
      MEMORY[0x25333CC90](v11, -1, -1);
    }

    return sub_24E4D1D90();
  }
  else
  {
    if (qword_26B1C1318 != -1) {
      swift_once();
    }
    uint64_t v13 = sub_24E4D1C20();
    __swift_project_value_buffer(v13, (uint64_t)qword_26B1C13C0);
    unint64_t v14 = sub_24E4D1C00();
    os_log_type_t v15 = sub_24E4D1E00();
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v16 = 0;
      _os_log_impl(&dword_24E4A6000, v14, v15, "Init in progress; appending continuation.", v16, 2u);
      MEMORY[0x25333CC90](v16, -1, -1);
    }

    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a2, v4);
    uint64_t v17 = (unint64_t *)(a1 + OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap_initContinuations);
    swift_beginAccess();
    unint64_t v18 = *v17;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *uint64_t v17 = v18;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      unint64_t v18 = sub_24E4AFED4(0, *(void *)(v18 + 16) + 1, 1, v18);
      *uint64_t v17 = v18;
    }
    unint64_t v21 = *(void *)(v18 + 16);
    unint64_t v20 = *(void *)(v18 + 24);
    if (v21 >= v20 >> 1)
    {
      unint64_t v18 = sub_24E4AFED4(v20 > 1, v21 + 1, 1, v18);
      *uint64_t v17 = v18;
    }
    *(void *)(v18 + 16) = v21 + 1;
    (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v18+ ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))+ *(void *)(v5 + 72) * v21, v7, v4);
    return swift_endAccess();
  }
}

uint64_t sub_24E4AFD00(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_24E4AFDDC;
  return v6(a1);
}

uint64_t sub_24E4AFDDC()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_24E4AFED4(char a1, int64_t a2, char a3, unint64_t a4)
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
    uint64_t v13 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C1388);
  uint64_t v10 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B1C1358) - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (BOOL v15 = v11 == -1) : (BOOL v15 = 0), v15))
  {
LABEL_29:
    uint64_t result = sub_24E4D1F70();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B1C1358) - 8);
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
    sub_24E4B0844(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

unint64_t sub_24E4B0144()
{
  unint64_t result = qword_26B1C1330;
  if (!qword_26B1C1330)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1C1330);
  }
  return result;
}

uint64_t sub_24E4B0198()
{
  _Block_release(*(const void **)(v0 + 16));

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_24E4B01D0()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t sub_24E4B01E4()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t sub_24E4B01FC()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24E4B0234(uint64_t a1)
{
  uint64_t v2 = *(uint64_t (**)(uint64_t *))(v1 + 16);
  uint64_t v4 = a1;
  return v2(&v4);
}

uint64_t sub_24E4B026C(void *a1)
{
  return (*(uint64_t (**)(void))(v1 + 16))(*a1);
}

uint64_t sub_24E4B0298(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(uint64_t (**)(uint64_t *, uint64_t *))(v2 + 16);
  uint64_t v5 = a2;
  uint64_t v6 = a1;
  return v3(&v6, &v5);
}

uint64_t sub_24E4B02D4(void *a1, void *a2)
{
  return (*(uint64_t (**)(void, void))(v2 + 16))(*a1, *a2);
}

uint64_t sub_24E4B0304(void *a1, void *a2)
{
  return (*(uint64_t (**)(void, void))(v2 + 16))(*a1, *a2);
}

uint64_t sub_24E4B0334()
{
  *(void *)(v1 + 16) = v0;
  *(void *)(v1 + 24) = swift_getObjectType();
  return MEMORY[0x270FA2498](sub_24E4B03A4, 0, 0);
}

uint64_t sub_24E4B03A4()
{
  uint64_t v1 = swift_task_alloc();
  *(void *)(v0 + 32) = v1;
  *(_OWORD *)(v1 + 16) = *(_OWORD *)(v0 + 16);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 40) = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_24E4B0494;
  return MEMORY[0x270FA2318]();
}

uint64_t sub_24E4B0494()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_24E4B05AC, 0, 0);
}

uint64_t sub_24E4B05AC()
{
  return (*(uint64_t (**)(void))(v0 + 8))(*(void *)(*(void *)(v0 + 16)
                                                                + OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap__session));
}

uint64_t sub_24E4B05D0(uint64_t a1)
{
  return sub_24E4AF648(a1, *(char **)(v1 + 16), *(void *)(v1 + 24));
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

uint64_t sub_24E4B063C()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C1358);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x270FA0238](v0, v6, v5);
}

uint64_t sub_24E4B0718()
{
  uint64_t v1 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B1C1358) - 8);
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = v0 + ((*(unsigned __int8 *)(v1 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));

  return sub_24E4AF9DC(v2, v3);
}

uint64_t sub_24E4B07AC(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_24E4B07F4(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_24E4B0844(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B1C1358) - 8);
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
  uint64_t result = sub_24E4D1FE0();
  __break(1u);
  return result;
}

uint64_t sub_24E4B09A4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_24E4B0A00(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_24E4AE08C;
  unint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_2698EDB10 + dword_2698EDB10);
  return v6(a1, v4);
}

uint64_t sub_24E4B0B08(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t ObjCBootstrap.sendFriendshipOffer(to:from:end:isFromGroup:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  *(unsigned char *)(v5 + 280) = a4;
  *(void *)(v5 + 96) = a3;
  *(void *)(v5 + 104) = v4;
  *(void *)(v5 + 80) = a1;
  *(void *)(v5 + 88) = a2;
  *(void *)(v5 + 112) = swift_getObjectType();
  uint64_t v6 = sub_24E4D17F0();
  *(void *)(v5 + 120) = v6;
  *(void *)(v5 + 128) = *(void *)(v6 - 8);
  *(void *)(v5 + 136) = swift_task_alloc();
  *(void *)(v5 + 144) = swift_task_alloc();
  *(void *)(v5 + 152) = swift_task_alloc();
  uint64_t v7 = sub_24E4D17A0();
  *(void *)(v5 + 160) = v7;
  *(void *)(v5 + 168) = *(void *)(v7 - 8);
  *(void *)(v5 + 176) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698ED9C0);
  *(void *)(v5 + 184) = swift_task_alloc();
  uint64_t v8 = sub_24E4D17D0();
  *(void *)(v5 + 192) = v8;
  *(void *)(v5 + 200) = *(void *)(v8 - 8);
  *(void *)(v5 + 208) = swift_task_alloc();
  *(void *)(v5 + 216) = swift_task_alloc();
  *(void *)(v5 + 224) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24E4B0D40, 0, 0);
}

uint64_t sub_24E4B0D40()
{
  uint64_t v1 = swift_task_alloc();
  *(void *)(v0 + 232) = v1;
  *(_OWORD *)(v1 + 16) = *(_OWORD *)(v0 + 104);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 240) = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_24E4B0E30;
  return MEMORY[0x270FA2318]();
}

uint64_t sub_24E4B0E30()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_24E4B0F48, 0, 0);
}

uint64_t sub_24E4B0F48()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 104) + OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap__session);
  *(void *)(v0 + 248) = v1;
  swift_retain();
  if (v1)
  {
    uint64_t v2 = *(void *)(v0 + 88);
    uint64_t v3 = sub_24E4B1F98(*(void *)(v0 + 80));
    *(void *)(v0 + 256) = v3;
    uint64_t v4 = *(void *)(v0 + 184);
    if (v2)
    {
      id v5 = objc_msgSend(*(id *)(v0 + 88), sel_identifier);
      sub_24E4D1CC0();

      sub_24E4ABDFC(MEMORY[0x263F8EE78]);
      sub_24E4D1940();
      uint64_t v6 = sub_24E4D1950();
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v4, 0, 1, v6);
    }
    else
    {
      uint64_t v13 = sub_24E4D1950();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v4, 1, 1, v13);
    }
    unint64_t v14 = *(void *)(v0 + 96);
    if (v14 > 2)
    {
      return sub_24E4D1F80();
    }
    else
    {
      (*(void (**)(void, void, void))(*(void *)(v0 + 168) + 104))(*(void *)(v0 + 176), **((unsigned int **)&unk_26531C558 + v14), *(void *)(v0 + 160));
      BOOL v15 = (void *)swift_task_alloc();
      *(void *)(v0 + 264) = v15;
      *BOOL v15 = v0;
      v15[1] = sub_24E4B1388;
      uint64_t v16 = *(void *)(v0 + 224);
      uint64_t v18 = *(void *)(v0 + 176);
      uint64_t v17 = *(void *)(v0 + 184);
      uint64_t v19 = *(unsigned __int8 *)(v0 + 280);
      return MEMORY[0x270F29698](v16, v3, v17, v18, v19);
    }
  }
  else
  {
    if (qword_26B1C1318 != -1) {
      swift_once();
    }
    uint64_t v7 = sub_24E4D1C20();
    __swift_project_value_buffer(v7, (uint64_t)qword_26B1C13C0);
    uint64_t v8 = sub_24E4D1C00();
    os_log_type_t v9 = sub_24E4D1E10();
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v10 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl(&dword_24E4A6000, v8, v9, "Missing FindMyLocate.Session!", v10, 2u);
      MEMORY[0x25333CC90](v10, -1, -1);
    }

    type metadata accessor for FMLSessionError(0);
    *(void *)(v0 + 24) = 5;
    sub_24E4CA610(MEMORY[0x263F8EE78]);
    sub_24E4D13C4(&qword_2698EDA30, type metadata accessor for FMLSessionError);
    sub_24E4D16A0();
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    unint64_t v11 = *(uint64_t (**)(void))(v0 + 8);
    return v11();
  }
}

uint64_t sub_24E4B1388()
{
  uint64_t v2 = *(void **)v1;
  *(void *)(*(void *)v1 + 272) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v4 = v2[22];
    uint64_t v3 = v2[23];
    uint64_t v7 = v2 + 20;
    uint64_t v5 = v2[20];
    uint64_t v6 = v7[1];
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
    sub_24E4B09A4(v3, &qword_2698ED9C0);
    uint64_t v8 = sub_24E4B1ECC;
  }
  else
  {
    uint64_t v9 = v2[23];
    (*(void (**)(void, void))(v2[21] + 8))(v2[22], v2[20]);
    sub_24E4B09A4(v9, &qword_2698ED9C0);
    uint64_t v8 = sub_24E4B1504;
  }
  return MEMORY[0x270FA2498](v8, 0, 0);
}

uint64_t sub_24E4B1504()
{
  v73 = v0;
  if (qword_26B1C1318 != -1) {
LABEL_41:
  }
    swift_once();
  uint64_t v2 = v0[27];
  uint64_t v1 = v0[28];
  uint64_t v3 = v0[24];
  uint64_t v4 = v0[25];
  uint64_t v5 = sub_24E4D1C20();
  __swift_project_value_buffer(v5, (uint64_t)qword_26B1C13C0);
  v62 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
  v62(v2, v1, v3);
  uint64_t v6 = sub_24E4D1C00();
  os_log_type_t v7 = sub_24E4D1E20();
  BOOL v8 = os_log_type_enabled(v6, v7);
  uint64_t v9 = v0[27];
  uint64_t v11 = v0[24];
  uint64_t v10 = v0[25];
  if (v8)
  {
    unint64_t v12 = (uint8_t *)swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    *(_DWORD *)unint64_t v12 = 136315138;
    v72[0] = v13;
    sub_24E4D13C4(&qword_2698EDB30, MEMORY[0x263F3CE30]);
    uint64_t v14 = sub_24E4D1FF0();
    v0[9] = sub_24E4CAAA0(v14, v15, v72);
    sub_24E4D1EB0();
    swift_bridgeObjectRelease();
    v63 = *(void (**)(uint64_t, uint64_t))(v10 + 8);
    v63(v9, v11);
    _os_log_impl(&dword_24E4A6000, v6, v7, "sendFriendshipOffer result: %s", v12, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25333CC90](v13, -1, -1);
    MEMORY[0x25333CC90](v12, -1, -1);
  }
  else
  {
    v63 = *(void (**)(uint64_t, uint64_t))(v10 + 8);
    v63(v9, v11);
  }

  uint64_t v16 = v0[16];
  uint64_t v17 = sub_24E4D17C0();
  uint64_t v64 = v17 + 64;
  uint64_t v18 = -1;
  uint64_t v19 = -1 << *(unsigned char *)(v17 + 32);
  if (-v19 < 64) {
    uint64_t v18 = ~(-1 << -(char)v19);
  }
  unint64_t v20 = v18 & *(void *)(v17 + 64);
  int64_t v65 = (unint64_t)(63 - v19) >> 6;
  unsigned int v66 = *MEMORY[0x263F3CE40];
  uint64_t v69 = v17;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v22 = 0;
  while (v20)
  {
    unint64_t v23 = __clz(__rbit64(v20));
    v20 &= v20 - 1;
    unint64_t v24 = v23 | (v22 << 6);
LABEL_9:
    uint64_t v26 = v0[18];
    uint64_t v25 = v0[19];
    uint64_t v27 = v0[17];
    uint64_t v28 = v0[15];
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v16 + 16))(v25, *(void *)(v69 + 56) + *(void *)(v16 + 72) * v24, v28);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 32))(v26, v25, v28);
    (*(void (**)(uint64_t, void, uint64_t))(v16 + 104))(v27, v66, v28);
    LOBYTE(v25) = sub_24E4D17E0();
    uint64_t v29 = *(void (**)(uint64_t, uint64_t))(v16 + 8);
    v29(v27, v28);
    uint64_t result = ((uint64_t (*)(uint64_t, uint64_t))v29)(v26, v28);
    if ((v25 & 1) == 0)
    {
      uint64_t v33 = v0[28];
      uint64_t v34 = v0[26];
      uint64_t v35 = v0[24];
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v62(v34, v33, v35);
      uint64_t v36 = sub_24E4D1C00();
      os_log_type_t v37 = sub_24E4D1E10();
      BOOL v38 = os_log_type_enabled(v36, v37);
      uint64_t v39 = v0[26];
      if (v38)
      {
        uint64_t v68 = v0[24];
        char v40 = (uint8_t *)swift_slowAlloc();
        uint64_t v70 = swift_slowAlloc();
        v72[0] = v70;
        *(_DWORD *)char v40 = 136315138;
        sub_24E4D17C0();
        sub_24E4D1950();
        sub_24E4D13C4(&qword_2698EDB28, MEMORY[0x263F3CF58]);
        uint64_t v41 = sub_24E4D1C60();
        unint64_t v43 = v42;
        swift_bridgeObjectRelease();
        v0[7] = sub_24E4CAAA0(v41, v43, v72);
        sub_24E4D1EB0();
        swift_bridgeObjectRelease();
        uint64_t v44 = v63;
        v63(v39, v68);
        _os_log_impl(&dword_24E4A6000, v36, v37, "sendFriendshipOffer failed %s", v40, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x25333CC90](v70, -1, -1);
        MEMORY[0x25333CC90](v40, -1, -1);
      }
      else
      {
        uint64_t v44 = v63;
        v63(v0[26], v0[24]);
      }

      uint64_t v59 = v0[28];
      uint64_t v60 = v0[24];
      type metadata accessor for FMLSessionError(0);
      v0[6] = 7;
      sub_24E4CA610(MEMORY[0x263F8EE78]);
      sub_24E4D13C4(&qword_2698EDA30, type metadata accessor for FMLSessionError);
      sub_24E4D16A0();
      swift_willThrow();
      swift_release();
      v44(v59, v60);
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      v61 = (uint64_t (*)(void))v0[1];
LABEL_37:
      return v61();
    }
  }
  int64_t v30 = v22 + 1;
  if (__OFADD__(v22, 1))
  {
    __break(1u);
    goto LABEL_41;
  }
  if (v30 >= v65)
  {
LABEL_31:
    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    uint64_t v45 = sub_24E4D1C00();
    os_log_type_t v46 = sub_24E4D1E20();
    BOOL v47 = os_log_type_enabled(v45, v46);
    uint64_t v48 = v0[28];
    uint64_t v49 = v0[24];
    if (v47)
    {
      uint64_t v71 = v0[28];
      uint64_t v50 = (uint8_t *)swift_slowAlloc();
      uint64_t v67 = v49;
      uint64_t v51 = swift_slowAlloc();
      v72[0] = v51;
      *(_DWORD *)uint64_t v50 = 136315138;
      uint64_t v52 = sub_24E4D1950();
      uint64_t v53 = swift_bridgeObjectRetain();
      uint64_t v54 = MEMORY[0x25333C3B0](v53, v52);
      unint64_t v56 = v55;
      swift_bridgeObjectRelease();
      v0[8] = sub_24E4CAAA0(v54, v56, v72);
      sub_24E4D1EB0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_24E4A6000, v45, v46, "Successfully sent friendship offer to %s", v50, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25333CC90](v51, -1, -1);
      MEMORY[0x25333CC90](v50, -1, -1);
      swift_release();

      uint64_t v57 = v67;
      uint64_t v58 = v71;
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_release();
      uint64_t v58 = v48;
      uint64_t v57 = v49;
    }
    v63(v58, v57);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v61 = (uint64_t (*)(void))v0[1];
    goto LABEL_37;
  }
  unint64_t v31 = *(void *)(v64 + 8 * v30);
  ++v22;
  if (v31) {
    goto LABEL_28;
  }
  int64_t v22 = v30 + 1;
  if (v30 + 1 >= v65) {
    goto LABEL_31;
  }
  unint64_t v31 = *(void *)(v64 + 8 * v22);
  if (v31) {
    goto LABEL_28;
  }
  int64_t v22 = v30 + 2;
  if (v30 + 2 >= v65) {
    goto LABEL_31;
  }
  unint64_t v31 = *(void *)(v64 + 8 * v22);
  if (v31) {
    goto LABEL_28;
  }
  int64_t v22 = v30 + 3;
  if (v30 + 3 >= v65) {
    goto LABEL_31;
  }
  unint64_t v31 = *(void *)(v64 + 8 * v22);
  if (v31) {
    goto LABEL_28;
  }
  int64_t v22 = v30 + 4;
  if (v30 + 4 >= v65) {
    goto LABEL_31;
  }
  unint64_t v31 = *(void *)(v64 + 8 * v22);
  if (v31)
  {
LABEL_28:
    unint64_t v20 = (v31 - 1) & v31;
    unint64_t v24 = __clz(__rbit64(v31)) + (v22 << 6);
    goto LABEL_9;
  }
  int64_t v32 = v30 + 5;
  if (v32 >= v65) {
    goto LABEL_31;
  }
  unint64_t v31 = *(void *)(v64 + 8 * v32);
  if (v31)
  {
    int64_t v22 = v32;
    goto LABEL_28;
  }
  while (1)
  {
    int64_t v22 = v32 + 1;
    if (__OFADD__(v32, 1)) {
      break;
    }
    if (v22 >= v65) {
      goto LABEL_31;
    }
    unint64_t v31 = *(void *)(v64 + 8 * v22);
    ++v32;
    if (v31) {
      goto LABEL_28;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_24E4B1ECC()
{
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24E4B1F98(unint64_t a1)
{
  unint64_t v2 = v1;
  uint64_t v22 = sub_24E4D1950();
  uint64_t v4 = *(void *)(v22 - 8);
  MEMORY[0x270FA5388](v22);
  uint64_t v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1 >> 62) {
    goto LABEL_15;
  }
  uint64_t v7 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    uint64_t v8 = MEMORY[0x263F8EE78];
    if (!v7) {
      return v8;
    }
    uint64_t v23 = MEMORY[0x263F8EE78];
    uint64_t result = sub_24E4CB0F8(0, v7 & ~(v7 >> 63), 0);
    if (v7 < 0) {
      break;
    }
    uint64_t v10 = 0;
    uint64_t v8 = v23;
    unint64_t v19 = a1 & 0xC000000000000001;
    unint64_t v17 = v2;
    uint64_t v18 = v4 + 32;
    uint64_t v11 = MEMORY[0x263F8EE78];
    unint64_t v20 = v6;
    unint64_t v21 = a1;
    while (v7 != v10)
    {
      if (v19) {
        id v12 = (id)MEMORY[0x25333C580](v10, a1);
      }
      else {
        id v12 = *(id *)(a1 + 8 * v10 + 32);
      }
      uint64_t v13 = v12;
      id v14 = objc_msgSend(v12, sel_identifier, v17, v18);
      sub_24E4D1CC0();

      sub_24E4ABDFC(v11);
      uint64_t v6 = v20;
      sub_24E4D1940();

      uint64_t v23 = v8;
      unint64_t v16 = *(void *)(v8 + 16);
      unint64_t v15 = *(void *)(v8 + 24);
      unint64_t v2 = v16 + 1;
      if (v16 >= v15 >> 1)
      {
        sub_24E4CB0F8(v15 > 1, v16 + 1, 1);
        uint64_t v8 = v23;
      }
      ++v10;
      *(void *)(v8 + 16) = v2;
      (*(void (**)(unint64_t, char *, uint64_t))(v4 + 32))(v8+ ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80))+ *(void *)(v4 + 72) * v16, v6, v22);
      a1 = v21;
      if (v7 == v10) {
        return v8;
      }
    }
    __break(1u);
LABEL_15:
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_24E4D1F90();
    swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

uint64_t sub_24E4B23A0(int a1, void *a2, uint64_t a3, char a4, void *aBlock, void *a6)
{
  v6[2] = a2;
  v6[3] = a6;
  v6[4] = _Block_copy(aBlock);
  sub_24E4D0CB4(0, &qword_26B1C12E0);
  uint64_t v11 = sub_24E4D1D30();
  v6[5] = v11;
  id v12 = a2;
  a6;
  uint64_t v13 = (void *)swift_task_alloc();
  v6[6] = v13;
  *uint64_t v13 = v6;
  v13[1] = sub_24E4B24B0;
  return ObjCBootstrap.sendFriendshipOffer(to:from:end:isFromGroup:)(v11, (uint64_t)a2, a3, a4);
}

uint64_t sub_24E4B24B0()
{
  unint64_t v2 = v0;
  uint64_t v4 = *v1;
  uint64_t v3 = *v1;
  uint64_t v5 = *(void **)(*v1 + 24);
  uint64_t v6 = *(void **)(*v1 + 16);
  uint64_t v7 = *v1;
  swift_task_dealloc();

  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(v3 + 32);
  if (v2)
  {
    uint64_t v9 = (void *)sub_24E4D16B0();

    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);
  }
  else
  {
    (*(void (**)(uint64_t, void))(v8 + 16))(v8, 0);
  }
  _Block_release(*(const void **)(v4 + 32));
  uint64_t v10 = *(uint64_t (**)(void))(v7 + 8);
  return v10();
}

uint64_t ObjCBootstrap.sendFriendshipInvite(to:from:isFromGroup:)(uint64_t a1, uint64_t a2, char a3)
{
  *(void *)(v4 + 80) = a2;
  *(void *)(v4 + 88) = v3;
  *(unsigned char *)(v4 + 264) = a3;
  *(void *)(v4 + 72) = a1;
  *(void *)(v4 + 96) = swift_getObjectType();
  uint64_t v5 = sub_24E4D17F0();
  *(void *)(v4 + 104) = v5;
  *(void *)(v4 + 112) = *(void *)(v5 - 8);
  *(void *)(v4 + 120) = swift_task_alloc();
  *(void *)(v4 + 128) = swift_task_alloc();
  *(void *)(v4 + 136) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698ED9C0);
  *(void *)(v4 + 144) = swift_task_alloc();
  uint64_t v6 = sub_24E4D17D0();
  *(void *)(v4 + 152) = v6;
  *(void *)(v4 + 160) = *(void *)(v6 - 8);
  *(void *)(v4 + 168) = swift_task_alloc();
  *(void *)(v4 + 176) = swift_task_alloc();
  *(void *)(v4 + 184) = swift_task_alloc();
  uint64_t v7 = sub_24E4D1950();
  *(void *)(v4 + 192) = v7;
  *(void *)(v4 + 200) = *(void *)(v7 - 8);
  *(void *)(v4 + 208) = swift_task_alloc();
  *(void *)(v4 + 216) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24E4B2874, 0, 0);
}

uint64_t sub_24E4B2874()
{
  uint64_t v1 = swift_task_alloc();
  *(void *)(v0 + 224) = v1;
  *(_OWORD *)(v1 + 16) = *(_OWORD *)(v0 + 88);
  unint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 232) = v2;
  *unint64_t v2 = v0;
  v2[1] = sub_24E4B2964;
  return MEMORY[0x270FA2318]();
}

uint64_t sub_24E4B2964()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_24E4B2A7C, 0, 0);
}

uint64_t sub_24E4B2A7C()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 88) + OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap__session);
  *(void *)(v0 + 240) = v1;
  swift_retain();
  if (v1)
  {
    uint64_t v2 = *(void *)(v0 + 80);
    id v3 = objc_msgSend(*(id *)(v0 + 72), sel_identifier);
    sub_24E4D1CC0();

    sub_24E4ABDFC(MEMORY[0x263F8EE78]);
    sub_24E4D1940();
    if (v2)
    {
      id v4 = objc_msgSend(*(id *)(v0 + 80), sel_identifier);
      sub_24E4D1CC0();

      sub_24E4ABDFC(MEMORY[0x263F8EE78]);
      sub_24E4D1940();
      uint64_t v5 = 0;
    }
    else
    {
      uint64_t v5 = 1;
    }
    (*(void (**)(void, uint64_t, uint64_t, void))(*(void *)(v0 + 200) + 56))(*(void *)(v0 + 144), v5, 1, *(void *)(v0 + 192));
    uint64_t v12 = (void *)swift_task_alloc();
    *(void *)(v0 + 248) = v12;
    void *v12 = v0;
    v12[1] = sub_24E4B2E24;
    uint64_t v13 = *(void *)(v0 + 216);
    uint64_t v14 = *(void *)(v0 + 184);
    uint64_t v15 = *(void *)(v0 + 144);
    uint64_t v16 = *(unsigned __int8 *)(v0 + 264);
    return MEMORY[0x270F296B0](v14, v13, v15, v16);
  }
  else
  {
    if (qword_26B1C1318 != -1) {
      swift_once();
    }
    uint64_t v6 = sub_24E4D1C20();
    __swift_project_value_buffer(v6, (uint64_t)qword_26B1C13C0);
    uint64_t v7 = sub_24E4D1C00();
    os_log_type_t v8 = sub_24E4D1E10();
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl(&dword_24E4A6000, v7, v8, "Missing FindMyLocate.Session!", v9, 2u);
      MEMORY[0x25333CC90](v9, -1, -1);
    }

    type metadata accessor for FMLSessionError(0);
    *(void *)(v0 + 24) = 5;
    sub_24E4CA610(MEMORY[0x263F8EE78]);
    sub_24E4D13C4(&qword_2698EDA30, type metadata accessor for FMLSessionError);
    sub_24E4D16A0();
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v10 = *(uint64_t (**)(void))(v0 + 8);
    return v10();
  }
}

uint64_t sub_24E4B2E24()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 256) = v0;
  swift_task_dealloc();
  sub_24E4B09A4(*(void *)(v2 + 144), &qword_2698ED9C0);
  if (v0) {
    id v3 = sub_24E4B39D4;
  }
  else {
    id v3 = sub_24E4B2F60;
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

uint64_t sub_24E4B2F60()
{
  v80 = v0;
  if (qword_26B1C1318 != -1) {
LABEL_41:
  }
    swift_once();
  uint64_t v1 = v0[22];
  uint64_t v2 = v0[23];
  uint64_t v3 = v0[19];
  uint64_t v4 = v0[20];
  uint64_t v5 = sub_24E4D1C20();
  __swift_project_value_buffer(v5, (uint64_t)qword_26B1C13C0);
  uint64_t v67 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
  v67(v1, v2, v3);
  uint64_t v6 = sub_24E4D1C00();
  os_log_type_t v7 = sub_24E4D1E20();
  BOOL v8 = os_log_type_enabled(v6, v7);
  uint64_t v9 = v0[22];
  uint64_t v11 = v0[19];
  uint64_t v10 = v0[20];
  if (v8)
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    *(_DWORD *)uint64_t v12 = 136315138;
    v79[0] = v13;
    sub_24E4D13C4(&qword_2698EDB30, MEMORY[0x263F3CE30]);
    uint64_t v14 = sub_24E4D1FF0();
    v0[8] = sub_24E4CAAA0(v14, v15, v79);
    sub_24E4D1EB0();
    swift_bridgeObjectRelease();
    uint64_t v16 = *(void (**)(uint64_t, uint64_t))(v10 + 8);
    v16(v9, v11);
    _os_log_impl(&dword_24E4A6000, v6, v7, "sendFriendshipInvite result: %s", v12, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25333CC90](v13, -1, -1);
    MEMORY[0x25333CC90](v12, -1, -1);
  }
  else
  {
    uint64_t v16 = *(void (**)(uint64_t, uint64_t))(v10 + 8);
    v16(v9, v11);
  }

  v78 = v16;
  uint64_t v17 = v0[14];
  uint64_t v18 = sub_24E4D17C0();
  uint64_t v68 = v18 + 64;
  uint64_t v19 = -1;
  uint64_t v20 = -1 << *(unsigned char *)(v18 + 32);
  if (-v20 < 64) {
    uint64_t v19 = ~(-1 << -(char)v20);
  }
  unint64_t v21 = v19 & *(void *)(v18 + 64);
  int64_t v69 = (unint64_t)(63 - v20) >> 6;
  unsigned int v70 = *MEMORY[0x263F3CE40];
  uint64_t v75 = v18;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v23 = 0;
  while (v21)
  {
    unint64_t v24 = __clz(__rbit64(v21));
    v21 &= v21 - 1;
    unint64_t v25 = v24 | (v23 << 6);
LABEL_9:
    uint64_t v27 = v0[16];
    uint64_t v26 = v0[17];
    uint64_t v28 = v0[15];
    uint64_t v29 = v0[13];
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v17 + 16))(v26, *(void *)(v75 + 56) + *(void *)(v17 + 72) * v25, v29);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 32))(v27, v26, v29);
    (*(void (**)(uint64_t, void, uint64_t))(v17 + 104))(v28, v70, v29);
    LOBYTE(v26) = sub_24E4D17E0();
    int64_t v30 = *(void (**)(uint64_t, uint64_t))(v17 + 8);
    v30(v28, v29);
    uint64_t result = ((uint64_t (*)(uint64_t, uint64_t))v30)(v27, v29);
    if ((v26 & 1) == 0)
    {
      uint64_t v34 = v0[23];
      uint64_t v35 = v0[21];
      uint64_t v36 = v0[19];
      swift_release();
      swift_bridgeObjectRelease();
      v67(v35, v34, v36);
      os_log_type_t v37 = sub_24E4D1C00();
      os_log_type_t v38 = sub_24E4D1E10();
      if (os_log_type_enabled(v37, v38))
      {
        uint64_t v72 = v0[21];
        uint64_t v76 = v0[19];
        uint64_t v39 = (uint8_t *)swift_slowAlloc();
        uint64_t v40 = swift_slowAlloc();
        v79[0] = v40;
        *(_DWORD *)uint64_t v39 = 136315138;
        sub_24E4D17C0();
        sub_24E4D13C4(&qword_2698EDB28, MEMORY[0x263F3CF58]);
        uint64_t v41 = sub_24E4D1C60();
        unint64_t v43 = v42;
        swift_bridgeObjectRelease();
        v0[6] = sub_24E4CAAA0(v41, v43, v79);
        sub_24E4D1EB0();
        swift_bridgeObjectRelease();
        v78(v72, v76);
        _os_log_impl(&dword_24E4A6000, v37, v38, "sendFriendshipInvitefailed %s", v39, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x25333CC90](v40, -1, -1);
        MEMORY[0x25333CC90](v39, -1, -1);
      }
      else
      {
        v78(v0[21], v0[19]);
      }

      uint64_t v62 = v0[25];
      uint64_t v74 = v0[24];
      uint64_t v77 = v0[27];
      uint64_t v63 = v0[23];
      uint64_t v64 = v0[19];
      type metadata accessor for FMLSessionError(0);
      v0[5] = 7;
      sub_24E4CA610(MEMORY[0x263F8EE78]);
      sub_24E4D13C4(&qword_2698EDA30, type metadata accessor for FMLSessionError);
      sub_24E4D16A0();
      swift_willThrow();
      swift_release();
      v78(v63, v64);
      (*(void (**)(uint64_t, uint64_t))(v62 + 8))(v77, v74);
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      int64_t v65 = (uint64_t (*)(void))v0[1];
LABEL_37:
      return v65();
    }
  }
  int64_t v31 = v23 + 1;
  if (__OFADD__(v23, 1))
  {
    __break(1u);
    goto LABEL_41;
  }
  if (v31 >= v69)
  {
LABEL_31:
    uint64_t v45 = v0[26];
    uint64_t v44 = v0[27];
    uint64_t v47 = v0[24];
    uint64_t v46 = v0[25];
    swift_release();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v46 + 16))(v45, v44, v47);
    uint64_t v48 = sub_24E4D1C00();
    os_log_type_t v49 = sub_24E4D1E20();
    BOOL v50 = os_log_type_enabled(v48, v49);
    uint64_t v51 = v0[26];
    uint64_t v52 = v0[27];
    uint64_t v53 = v0[24];
    uint64_t v54 = v0[25];
    uint64_t v55 = v0[23];
    uint64_t v56 = v0[19];
    if (v50)
    {
      uint64_t v73 = v0[19];
      uint64_t v57 = (uint8_t *)swift_slowAlloc();
      uint64_t v71 = v52;
      uint64_t v58 = swift_slowAlloc();
      v79[0] = v58;
      *(_DWORD *)uint64_t v57 = 136315138;
      sub_24E4D13C4(&qword_2698EDB40, MEMORY[0x263F3CF58]);
      uint64_t v59 = sub_24E4D1FF0();
      v0[7] = sub_24E4CAAA0(v59, v60, v79);
      sub_24E4D1EB0();
      swift_bridgeObjectRelease();
      v61 = *(void (**)(uint64_t, uint64_t))(v54 + 8);
      v61(v51, v53);
      _os_log_impl(&dword_24E4A6000, v48, v49, "Successfully sent friendship invite to %s", v57, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25333CC90](v58, -1, -1);
      MEMORY[0x25333CC90](v57, -1, -1);
      swift_release();

      v78(v55, v73);
      v61(v71, v53);
    }
    else
    {

      swift_release();
      unsigned int v66 = *(void (**)(uint64_t, uint64_t))(v54 + 8);
      v66(v51, v53);
      v78(v55, v56);
      v66(v52, v53);
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
    int64_t v65 = (uint64_t (*)(void))v0[1];
    goto LABEL_37;
  }
  unint64_t v32 = *(void *)(v68 + 8 * v31);
  ++v23;
  if (v32) {
    goto LABEL_28;
  }
  int64_t v23 = v31 + 1;
  if (v31 + 1 >= v69) {
    goto LABEL_31;
  }
  unint64_t v32 = *(void *)(v68 + 8 * v23);
  if (v32) {
    goto LABEL_28;
  }
  int64_t v23 = v31 + 2;
  if (v31 + 2 >= v69) {
    goto LABEL_31;
  }
  unint64_t v32 = *(void *)(v68 + 8 * v23);
  if (v32) {
    goto LABEL_28;
  }
  int64_t v23 = v31 + 3;
  if (v31 + 3 >= v69) {
    goto LABEL_31;
  }
  unint64_t v32 = *(void *)(v68 + 8 * v23);
  if (v32) {
    goto LABEL_28;
  }
  int64_t v23 = v31 + 4;
  if (v31 + 4 >= v69) {
    goto LABEL_31;
  }
  unint64_t v32 = *(void *)(v68 + 8 * v23);
  if (v32)
  {
LABEL_28:
    unint64_t v21 = (v32 - 1) & v32;
    unint64_t v25 = __clz(__rbit64(v32)) + (v23 << 6);
    goto LABEL_9;
  }
  int64_t v33 = v31 + 5;
  if (v33 >= v69) {
    goto LABEL_31;
  }
  unint64_t v32 = *(void *)(v68 + 8 * v33);
  if (v32)
  {
    int64_t v23 = v33;
    goto LABEL_28;
  }
  while (1)
  {
    int64_t v23 = v33 + 1;
    if (__OFADD__(v33, 1)) {
      break;
    }
    if (v23 >= v69) {
      goto LABEL_31;
    }
    unint64_t v32 = *(void *)(v68 + 8 * v23);
    ++v33;
    if (v32) {
      goto LABEL_28;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_24E4B39D4()
{
  uint64_t v1 = v0[27];
  uint64_t v2 = v0[24];
  uint64_t v3 = v0[25];
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_24E4B3C64(void *a1, void *a2, char a3, void *aBlock, void *a5)
{
  v5[3] = a2;
  v5[4] = a5;
  v5[2] = a1;
  v5[5] = _Block_copy(aBlock);
  id v10 = a1;
  id v11 = a2;
  a5;
  uint64_t v12 = (void *)swift_task_alloc();
  v5[6] = v12;
  void *v12 = v5;
  v12[1] = sub_24E4B3D48;
  return ObjCBootstrap.sendFriendshipInvite(to:from:isFromGroup:)((uint64_t)v10, (uint64_t)a2, a3);
}

uint64_t sub_24E4B3D48()
{
  uint64_t v2 = v0;
  uint64_t v4 = *v1;
  uint64_t v3 = *v1;
  uint64_t v5 = *(void **)(*v1 + 32);
  uint64_t v6 = *(void **)(*v1 + 24);
  os_log_type_t v7 = *(void **)(*v1 + 16);
  uint64_t v8 = *v1;
  swift_task_dealloc();

  uint64_t v9 = *(void *)(v3 + 40);
  if (v2)
  {
    id v10 = (void *)sub_24E4D16B0();

    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);
  }
  else
  {
    (*(void (**)(uint64_t, void))(v9 + 16))(v9, 0);
  }
  _Block_release(*(const void **)(v4 + 40));
  id v11 = *(uint64_t (**)(void))(v8 + 8);
  return v11();
}

uint64_t ObjCBootstrap.stopSharingLocation(with:from:isFromGroup:)(uint64_t a1, uint64_t a2, char a3)
{
  *(void *)(v4 + 88) = a2;
  *(void *)(v4 + 96) = v3;
  *(unsigned char *)(v4 + 248) = a3;
  *(void *)(v4 + 80) = a1;
  *(void *)(v4 + 104) = swift_getObjectType();
  uint64_t v5 = sub_24E4D17F0();
  *(void *)(v4 + 112) = v5;
  *(void *)(v4 + 120) = *(void *)(v5 - 8);
  *(void *)(v4 + 128) = swift_task_alloc();
  *(void *)(v4 + 136) = swift_task_alloc();
  *(void *)(v4 + 144) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698ED9C0);
  *(void *)(v4 + 152) = swift_task_alloc();
  uint64_t v6 = sub_24E4D17D0();
  *(void *)(v4 + 160) = v6;
  *(void *)(v4 + 168) = *(void *)(v6 - 8);
  *(void *)(v4 + 176) = swift_task_alloc();
  *(void *)(v4 + 184) = swift_task_alloc();
  *(void *)(v4 + 192) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24E4B409C, 0, 0);
}

uint64_t sub_24E4B409C()
{
  uint64_t v1 = swift_task_alloc();
  *(void *)(v0 + 200) = v1;
  *(_OWORD *)(v1 + 16) = *(_OWORD *)(v0 + 96);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 208) = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_24E4B418C;
  return MEMORY[0x270FA2318]();
}

uint64_t sub_24E4B418C()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_24E4B42A4, 0, 0);
}

uint64_t sub_24E4B42A4()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 96) + OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap__session);
  *(void *)(v0 + 216) = v1;
  swift_retain();
  if (v1)
  {
    uint64_t v2 = *(void *)(v0 + 88);
    uint64_t v3 = sub_24E4B1F98(*(void *)(v0 + 80));
    *(void *)(v0 + 224) = v3;
    uint64_t v4 = *(void *)(v0 + 152);
    if (v2)
    {
      id v5 = objc_msgSend(*(id *)(v0 + 88), sel_identifier);
      sub_24E4D1CC0();

      sub_24E4ABDFC(MEMORY[0x263F8EE78]);
      sub_24E4D1940();
      uint64_t v6 = sub_24E4D1950();
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v4, 0, 1, v6);
    }
    else
    {
      uint64_t v13 = sub_24E4D1950();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v4, 1, 1, v13);
    }
    uint64_t v14 = (void *)swift_task_alloc();
    *(void *)(v0 + 232) = v14;
    *uint64_t v14 = v0;
    v14[1] = sub_24E4B4630;
    uint64_t v15 = *(void *)(v0 + 192);
    uint64_t v16 = *(void *)(v0 + 152);
    uint64_t v17 = *(unsigned __int8 *)(v0 + 248);
    return MEMORY[0x270F29620](v15, v3, v16, v17);
  }
  else
  {
    if (qword_26B1C1318 != -1) {
      swift_once();
    }
    uint64_t v7 = sub_24E4D1C20();
    __swift_project_value_buffer(v7, (uint64_t)qword_26B1C13C0);
    uint64_t v8 = sub_24E4D1C00();
    os_log_type_t v9 = sub_24E4D1E10();
    if (os_log_type_enabled(v8, v9))
    {
      id v10 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v10 = 0;
      _os_log_impl(&dword_24E4A6000, v8, v9, "Missing FindMyLocate.Session!", v10, 2u);
      MEMORY[0x25333CC90](v10, -1, -1);
    }

    type metadata accessor for FMLSessionError(0);
    *(void *)(v0 + 24) = 5;
    sub_24E4CA610(MEMORY[0x263F8EE78]);
    sub_24E4D13C4(&qword_2698EDA30, type metadata accessor for FMLSessionError);
    sub_24E4D16A0();
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    id v11 = *(uint64_t (**)(void))(v0 + 8);
    return v11();
  }
}

uint64_t sub_24E4B4630()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 240) = v0;
  swift_task_dealloc();
  sub_24E4B09A4(*(void *)(v2 + 152), &qword_2698ED9C0);
  if (v0)
  {
    swift_bridgeObjectRelease();
    uint64_t v3 = sub_24E4B5120;
  }
  else
  {
    uint64_t v3 = sub_24E4B4770;
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

uint64_t sub_24E4B4770()
{
  uint64_t v73 = v0;
  if (qword_26B1C1318 != -1) {
LABEL_41:
  }
    swift_once();
  uint64_t v2 = v0[23];
  uint64_t v1 = v0[24];
  uint64_t v3 = v0[20];
  uint64_t v4 = v0[21];
  uint64_t v5 = sub_24E4D1C20();
  __swift_project_value_buffer(v5, (uint64_t)qword_26B1C13C0);
  uint64_t v62 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
  v62(v2, v1, v3);
  uint64_t v6 = sub_24E4D1C00();
  os_log_type_t v7 = sub_24E4D1E20();
  BOOL v8 = os_log_type_enabled(v6, v7);
  uint64_t v9 = v0[23];
  uint64_t v11 = v0[20];
  uint64_t v10 = v0[21];
  if (v8)
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    *(_DWORD *)uint64_t v12 = 136315138;
    v72[0] = v13;
    sub_24E4D13C4(&qword_2698EDB30, MEMORY[0x263F3CE30]);
    uint64_t v14 = sub_24E4D1FF0();
    v0[9] = sub_24E4CAAA0(v14, v15, v72);
    sub_24E4D1EB0();
    swift_bridgeObjectRelease();
    uint64_t v63 = *(void (**)(uint64_t, uint64_t))(v10 + 8);
    v63(v9, v11);
    _os_log_impl(&dword_24E4A6000, v6, v7, "stopSharingLocation result: %s", v12, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25333CC90](v13, -1, -1);
    MEMORY[0x25333CC90](v12, -1, -1);
  }
  else
  {
    uint64_t v63 = *(void (**)(uint64_t, uint64_t))(v10 + 8);
    v63(v9, v11);
  }

  uint64_t v16 = v0[15];
  uint64_t v17 = sub_24E4D17C0();
  uint64_t v64 = v17 + 64;
  uint64_t v18 = -1;
  uint64_t v19 = -1 << *(unsigned char *)(v17 + 32);
  if (-v19 < 64) {
    uint64_t v18 = ~(-1 << -(char)v19);
  }
  unint64_t v20 = v18 & *(void *)(v17 + 64);
  int64_t v65 = (unint64_t)(63 - v19) >> 6;
  unsigned int v66 = *MEMORY[0x263F3CE40];
  uint64_t v69 = v17;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v22 = 0;
  while (v20)
  {
    unint64_t v23 = __clz(__rbit64(v20));
    v20 &= v20 - 1;
    unint64_t v24 = v23 | (v22 << 6);
LABEL_9:
    uint64_t v26 = v0[17];
    uint64_t v25 = v0[18];
    uint64_t v27 = v0[16];
    uint64_t v28 = v0[14];
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v16 + 16))(v25, *(void *)(v69 + 56) + *(void *)(v16 + 72) * v24, v28);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 32))(v26, v25, v28);
    (*(void (**)(uint64_t, void, uint64_t))(v16 + 104))(v27, v66, v28);
    LOBYTE(v25) = sub_24E4D17E0();
    uint64_t v29 = *(void (**)(uint64_t, uint64_t))(v16 + 8);
    v29(v27, v28);
    uint64_t result = ((uint64_t (*)(uint64_t, uint64_t))v29)(v26, v28);
    if ((v25 & 1) == 0)
    {
      uint64_t v33 = v0[24];
      uint64_t v34 = v0[22];
      uint64_t v35 = v0[20];
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v62(v34, v33, v35);
      uint64_t v36 = sub_24E4D1C00();
      os_log_type_t v37 = sub_24E4D1E10();
      BOOL v38 = os_log_type_enabled(v36, v37);
      uint64_t v39 = v0[22];
      if (v38)
      {
        uint64_t v68 = v0[20];
        uint64_t v40 = (uint8_t *)swift_slowAlloc();
        uint64_t v70 = swift_slowAlloc();
        v72[0] = v70;
        *(_DWORD *)uint64_t v40 = 136315138;
        sub_24E4D17C0();
        sub_24E4D1950();
        sub_24E4D13C4(&qword_2698EDB28, MEMORY[0x263F3CF58]);
        uint64_t v41 = sub_24E4D1C60();
        unint64_t v43 = v42;
        swift_bridgeObjectRelease();
        v0[7] = sub_24E4CAAA0(v41, v43, v72);
        sub_24E4D1EB0();
        swift_bridgeObjectRelease();
        uint64_t v44 = v63;
        v63(v39, v68);
        _os_log_impl(&dword_24E4A6000, v36, v37, "stopSharingLocationFailed %s", v40, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x25333CC90](v70, -1, -1);
        MEMORY[0x25333CC90](v40, -1, -1);
      }
      else
      {
        uint64_t v44 = v63;
        v63(v0[22], v0[20]);
      }

      uint64_t v59 = v0[24];
      uint64_t v60 = v0[20];
      type metadata accessor for FMLSessionError(0);
      v0[6] = 7;
      sub_24E4CA610(MEMORY[0x263F8EE78]);
      sub_24E4D13C4(&qword_2698EDA30, type metadata accessor for FMLSessionError);
      sub_24E4D16A0();
      swift_willThrow();
      swift_release();
      v44(v59, v60);
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      v61 = (uint64_t (*)(void))v0[1];
LABEL_37:
      return v61();
    }
  }
  int64_t v30 = v22 + 1;
  if (__OFADD__(v22, 1))
  {
    __break(1u);
    goto LABEL_41;
  }
  if (v30 >= v65)
  {
LABEL_31:
    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    uint64_t v45 = sub_24E4D1C00();
    os_log_type_t v46 = sub_24E4D1E20();
    BOOL v47 = os_log_type_enabled(v45, v46);
    uint64_t v48 = v0[24];
    uint64_t v49 = v0[20];
    if (v47)
    {
      uint64_t v71 = v0[24];
      BOOL v50 = (uint8_t *)swift_slowAlloc();
      uint64_t v67 = v49;
      uint64_t v51 = swift_slowAlloc();
      v72[0] = v51;
      *(_DWORD *)BOOL v50 = 136315138;
      uint64_t v52 = sub_24E4D1950();
      uint64_t v53 = swift_bridgeObjectRetain();
      uint64_t v54 = MEMORY[0x25333C3B0](v53, v52);
      unint64_t v56 = v55;
      swift_bridgeObjectRelease();
      v0[8] = sub_24E4CAAA0(v54, v56, v72);
      sub_24E4D1EB0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_24E4A6000, v45, v46, "Successfully stop location share with %s", v50, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25333CC90](v51, -1, -1);
      MEMORY[0x25333CC90](v50, -1, -1);
      swift_release();

      uint64_t v57 = v67;
      uint64_t v58 = v71;
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_release();
      uint64_t v58 = v48;
      uint64_t v57 = v49;
    }
    v63(v58, v57);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v61 = (uint64_t (*)(void))v0[1];
    goto LABEL_37;
  }
  unint64_t v31 = *(void *)(v64 + 8 * v30);
  ++v22;
  if (v31) {
    goto LABEL_28;
  }
  int64_t v22 = v30 + 1;
  if (v30 + 1 >= v65) {
    goto LABEL_31;
  }
  unint64_t v31 = *(void *)(v64 + 8 * v22);
  if (v31) {
    goto LABEL_28;
  }
  int64_t v22 = v30 + 2;
  if (v30 + 2 >= v65) {
    goto LABEL_31;
  }
  unint64_t v31 = *(void *)(v64 + 8 * v22);
  if (v31) {
    goto LABEL_28;
  }
  int64_t v22 = v30 + 3;
  if (v30 + 3 >= v65) {
    goto LABEL_31;
  }
  unint64_t v31 = *(void *)(v64 + 8 * v22);
  if (v31) {
    goto LABEL_28;
  }
  int64_t v22 = v30 + 4;
  if (v30 + 4 >= v65) {
    goto LABEL_31;
  }
  unint64_t v31 = *(void *)(v64 + 8 * v22);
  if (v31)
  {
LABEL_28:
    unint64_t v20 = (v31 - 1) & v31;
    unint64_t v24 = __clz(__rbit64(v31)) + (v22 << 6);
    goto LABEL_9;
  }
  int64_t v32 = v30 + 5;
  if (v32 >= v65) {
    goto LABEL_31;
  }
  unint64_t v31 = *(void *)(v64 + 8 * v32);
  if (v31)
  {
    int64_t v22 = v32;
    goto LABEL_28;
  }
  while (1)
  {
    int64_t v22 = v32 + 1;
    if (__OFADD__(v32, 1)) {
      break;
    }
    if (v22 >= v65) {
      goto LABEL_31;
    }
    unint64_t v31 = *(void *)(v64 + 8 * v22);
    ++v32;
    if (v31) {
      goto LABEL_28;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_24E4B5120()
{
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24E4B5374(int a1, void *a2, char a3, void *aBlock, void *a5)
{
  v5[2] = a2;
  v5[3] = a5;
  v5[4] = _Block_copy(aBlock);
  sub_24E4D0CB4(0, &qword_26B1C12E0);
  uint64_t v9 = sub_24E4D1D30();
  v5[5] = v9;
  id v10 = a2;
  a5;
  uint64_t v11 = (void *)swift_task_alloc();
  v5[6] = v11;
  *uint64_t v11 = v5;
  v11[1] = sub_24E4D1530;
  return ObjCBootstrap.stopSharingLocation(with:from:isFromGroup:)(v9, (uint64_t)a2, a3);
}

uint64_t ObjCBootstrap.startRefreshingLocation(for:priority:isFromGroup:reverseGeocode:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v9 = (uint64_t (*)(uint64_t, char))((char *)&dword_2698EDB58 + dword_2698EDB58);
  os_log_type_t v7 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v7;
  *os_log_type_t v7 = v4;
  v7[1] = sub_24E4B0B04;
  return v9(a1, a4);
}

uint64_t sub_24E4B5534(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[22] = a4;
  v5[23] = a5;
  uint64_t v6 = sub_24E4D1C30();
  v5[24] = v6;
  v5[25] = *(void *)(v6 - 8);
  v5[26] = swift_task_alloc();
  uint64_t v7 = sub_24E4D1C50();
  v5[27] = v7;
  v5[28] = *(void *)(v7 - 8);
  v5[29] = swift_task_alloc();
  uint64_t v8 = sub_24E4D1950();
  v5[30] = v8;
  v5[31] = *(void *)(v8 - 8);
  v5[32] = swift_task_alloc();
  v5[33] = swift_task_alloc();
  v5[34] = swift_task_alloc();
  v5[35] = swift_task_alloc();
  uint64_t v9 = sub_24E4D1B70();
  v5[36] = v9;
  v5[37] = *(void *)(v9 - 8);
  v5[38] = swift_task_alloc();
  v5[39] = swift_task_alloc();
  v5[40] = swift_task_alloc();
  uint64_t v10 = sub_24E4D17B0();
  v5[41] = v10;
  v5[42] = *(void *)(v10 - 8);
  v5[43] = swift_task_alloc();
  v5[44] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C12A0);
  v5[45] = swift_task_alloc();
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C12C0);
  v5[46] = v11;
  v5[47] = *(void *)(v11 - 8);
  v5[48] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24E4B5848, 0, 0);
}

uint64_t sub_24E4B5848()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C12D0);
  sub_24E4D1DC0();
  uint64_t v1 = OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap_locationUpdateCallback;
  *(void *)(v0 + 392) = OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap_serialQueue;
  *(void *)(v0 + 400) = v1;
  swift_beginAccess();
  uint64_t v2 = (_DWORD *)MEMORY[0x263F3CDE0];
  *(_DWORD *)(v0 + 416) = *MEMORY[0x263F3CDE8];
  *(_DWORD *)(v0 + 420) = *v2;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 408) = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_24E4B5964;
  uint64_t v4 = *(void *)(v0 + 360);
  uint64_t v5 = *(void *)(v0 + 368);
  return MEMORY[0x270FA1F68](v4, 0, 0, v5);
}

uint64_t sub_24E4B5964()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_24E4B5A60, 0, 0);
}

uint64_t sub_24E4B5A60()
{
  v147 = v0;
  uint64_t v1 = v0;
  uint64_t v2 = v0[45];
  uint64_t v3 = v0[42];
  uint64_t v4 = v1[41];
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v2, 1, v4) == 1)
  {
    (*(void (**)(void, void))(v1[47] + 8))(v1[48], v1[46]);
LABEL_14:
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
    unint64_t v56 = (uint64_t (*)(void))v1[1];
    return v56();
  }
  (*(void (**)(void, uint64_t, uint64_t))(v3 + 32))(v1[44], v2, v4);
  if (sub_24E4D1DF0())
  {
    if (qword_26B1C1318 != -1) {
      swift_once();
    }
    uint64_t v5 = sub_24E4D1C20();
    __swift_project_value_buffer(v5, (uint64_t)qword_26B1C13C0);
    uint64_t v6 = sub_24E4D1C00();
    os_log_type_t v7 = sub_24E4D1E20();
    BOOL v8 = os_log_type_enabled(v6, v7);
    uint64_t v10 = v1[47];
    uint64_t v9 = v1[48];
    uint64_t v11 = v1[46];
    uint64_t v12 = v1[44];
    uint64_t v14 = v1[41];
    uint64_t v13 = v1[42];
    if (v8)
    {
      aBlockb = (void *)v1[48];
      v140 = (void *)v1[44];
      unint64_t v15 = (uint8_t *)swift_slowAlloc();
      uint64_t v135 = v14;
      uint64_t v16 = swift_slowAlloc();
      uint64_t v146 = v16;
      *(_DWORD *)unint64_t v15 = 136446210;
      v1[21] = sub_24E4CAAA0(0xD000000000000041, 0x800000024E4D3950, &v146);
      sub_24E4D1EB0();
      _os_log_impl(&dword_24E4A6000, v6, v7, "%{public}s has been canceled", v15, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25333CC90](v16, -1, -1);
      MEMORY[0x25333CC90](v15, -1, -1);

      (*(void (**)(void *, uint64_t))(v13 + 8))(v140, v135);
      (*(void (**)(void *, uint64_t))(v10 + 8))(aBlockb, v11);
    }
    else
    {

      (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v12, v14);
      (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v11);
    }
    goto LABEL_14;
  }
  int v17 = *((_DWORD *)v1 + 104);
  uint64_t v18 = v1[43];
  uint64_t v19 = v1[41];
  uint64_t v20 = v1[42];
  (*(void (**)(uint64_t, void, uint64_t))(v20 + 16))(v18, v1[44], v19);
  int v21 = (*(uint64_t (**)(uint64_t, uint64_t))(v20 + 88))(v18, v19);
  if (v21 == v17)
  {
    aBlock = v1 + 8;
    uint64_t v22 = v1[43];
    uint64_t v23 = v1[40];
    uint64_t v24 = v1[39];
    uint64_t v26 = v1[36];
    uint64_t v25 = v1[37];
    uint64_t v27 = v1[35];
    uint64_t v28 = v1[30];
    uint64_t v29 = v1[31];
    (*(void (**)(uint64_t, void))(v1[42] + 96))(v22, v1[41]);
    uint64_t v30 = v22 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2698EDE80) + 48);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v25 + 32))(v23, v22, v26);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v29 + 32))(v27, v30, v28);
    sub_24E4D1910();
    unint64_t v31 = (void *)sub_24E4D1CB0();
    swift_bridgeObjectRelease();
    id v138 = objc_msgSend(self, sel_handleWithIdentifier_, v31);

    sub_24E4D0CB4(0, &qword_2698EDE50);
    int64_t v32 = *(void (**)(uint64_t, uint64_t, uint64_t))(v25 + 16);
    v32(v24, v23, v26);
    v136 = (void *)sub_24E4AC4FC(v24);
    if (qword_26B1C1318 != -1) {
      swift_once();
    }
    uint64_t v33 = v1[40];
    uint64_t v34 = v1[38];
    uint64_t v36 = v1[35];
    uint64_t v35 = v1[36];
    uint64_t v37 = v1[34];
    BOOL v38 = v1;
    uint64_t v39 = v1[31];
    uint64_t v40 = v38[30];
    uint64_t v41 = sub_24E4D1C20();
    __swift_project_value_buffer(v41, (uint64_t)qword_26B1C13C0);
    v32(v34, v33, v35);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v39 + 16))(v37, v36, v40);
    unint64_t v42 = sub_24E4D1C00();
    os_log_type_t v43 = sub_24E4D1E20();
    BOOL v44 = os_log_type_enabled(v42, v43);
    uint64_t v46 = v38[37];
    uint64_t v45 = v38[38];
    uint64_t v47 = v38[36];
    uint64_t v48 = v38[34];
    uint64_t v49 = v38[30];
    uint64_t v50 = v38[31];
    if (v44)
    {
      log = v42;
      uint64_t v51 = swift_slowAlloc();
      uint64_t v128 = swift_slowAlloc();
      uint64_t v146 = v128;
      *(_DWORD *)uint64_t v51 = 136315394;
      sub_24E4D13C4(&qword_2698EDE88, MEMORY[0x263F3D0D0]);
      uint64_t v52 = sub_24E4D1FF0();
      v38[19] = sub_24E4CAAA0(v52, v53, &v146);
      sub_24E4D1EB0();
      swift_bridgeObjectRelease();
      v133 = *(void (**)(uint64_t, uint64_t))(v46 + 8);
      v133(v45, v47);
      *(_WORD *)(v51 + 12) = 2080;
      uint64_t v54 = sub_24E4D1910();
      v38[20] = sub_24E4CAAA0(v54, v55, &v146);
      sub_24E4D1EB0();
      swift_bridgeObjectRelease();
      v132 = *(void (**)(uint64_t, uint64_t))(v50 + 8);
      v132(v48, v49);
      _os_log_impl(&dword_24E4A6000, log, v43, "locationStreams received location %s for handle: %s", (uint8_t *)v51, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x25333CC90](v128, -1, -1);
      MEMORY[0x25333CC90](v51, -1, -1);
    }
    else
    {
      v133 = *(void (**)(uint64_t, uint64_t))(v46 + 8);
      v133(v38[38], v38[36]);
      v132 = *(void (**)(uint64_t, uint64_t))(v50 + 8);
      v132(v48, v49);
    }
    uint64_t v81 = v38[29];
    uint64_t v82 = v38[26];
    uint64_t v130 = v38[27];
    *(void *)type = v38[50];
    uint64_t v84 = v38[24];
    uint64_t v83 = v38[25];
    v85 = (char *)v38[23];
    uint64_t v129 = v38[28];
    v86 = (void *)swift_allocObject();
    v86[2] = v85;
    v86[3] = v138;
    v86[4] = v136;
    v38[12] = sub_24E4D13B8;
    v38[13] = v86;
    v38[8] = MEMORY[0x263EF8330];
    v38[9] = 1107296256;
    v38[10] = sub_24E4B0B08;
    v38[11] = &block_descriptor_413;
    v87 = _Block_copy(aBlock);
    v88 = v85;
    id aBlocka = v138;
    id v89 = v136;
    sub_24E4D1C40();
    v38[18] = MEMORY[0x263F8EE78];
    sub_24E4D13C4(&qword_26B1C1328, MEMORY[0x263F8F030]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C1338);
    sub_24E4CF1EC();
    sub_24E4D1EE0();
    MEMORY[0x25333C4D0](0, v81, v82, v87);
    _Block_release(v87);
    (*(void (**)(uint64_t, uint64_t))(v83 + 8))(v82, v84);
    (*(void (**)(uint64_t, uint64_t))(v129 + 8))(v81, v130);
    swift_release();
    v90 = *(void (**)(id, id))&v85[*(void *)type];
    v91 = v38;
    if (v90)
    {
      id v92 = v89;
      sub_24E4ACE0C((uint64_t)v90);
      v90(v89, aBlocka);

      sub_24E4ACF64((uint64_t)v90);
    }
    uint64_t v93 = v38[44];
    uint64_t v94 = v38[41];
    uint64_t v95 = v38[42];
    uint64_t v96 = v91[40];
    uint64_t v97 = v91[36];
    uint64_t v98 = v91[35];
    uint64_t v99 = v91[30];

    uint64_t v1 = v91;
    v132(v98, v99);
    v133(v96, v97);
    (*(void (**)(uint64_t, uint64_t))(v95 + 8))(v93, v94);
  }
  else if (v21 == *((_DWORD *)v1 + 105))
  {
    v141 = v1 + 2;
    uint64_t v58 = v1[43];
    uint64_t v59 = v1[33];
    uint64_t v61 = v1[30];
    uint64_t v60 = v1[31];
    (*(void (**)(uint64_t, void))(v1[42] + 96))(v58, v1[41]);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v60 + 32))(v59, v58, v61);
    sub_24E4D1910();
    uint64_t v62 = (void *)sub_24E4D1CB0();
    swift_bridgeObjectRelease();
    id v63 = objc_msgSend(self, sel_handleWithIdentifier_, v62);

    if (qword_26B1C1318 != -1) {
      swift_once();
    }
    uint64_t v64 = v1[32];
    uint64_t v65 = v1[33];
    uint64_t v67 = v1[30];
    uint64_t v66 = v1[31];
    uint64_t v68 = sub_24E4D1C20();
    __swift_project_value_buffer(v68, (uint64_t)qword_26B1C13C0);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v66 + 16))(v64, v65, v67);
    uint64_t v69 = sub_24E4D1C00();
    os_log_type_t v70 = sub_24E4D1E20();
    BOOL v71 = os_log_type_enabled(v69, v70);
    uint64_t v72 = v1[32];
    uint64_t v73 = v1[30];
    uint64_t v74 = (void (**)(uint64_t, uint64_t))(v1[31] + 8);
    if (v71)
    {
      uint64_t v75 = swift_slowAlloc();
      uint64_t v76 = v1;
      uint64_t v77 = swift_slowAlloc();
      uint64_t v146 = v77;
      *(_DWORD *)uint64_t v75 = 141558275;
      *(void *)(v75 + 4) = 1752392040;
      *(_WORD *)(v75 + 12) = 2081;
      uint64_t v78 = sub_24E4D1910();
      *(void *)(v75 + 14) = sub_24E4CAAA0(v78, v79, &v146);
      swift_bridgeObjectRelease();
      v139 = *v74;
      (*v74)(v72, v73);
      _os_log_impl(&dword_24E4A6000, v69, v70, "locationStreams received unavailable location for handle: %{private,mask.hash}s", (uint8_t *)v75, 0x16u);
      swift_arrayDestroy();
      uint64_t v80 = v77;
      uint64_t v1 = v76;
      MEMORY[0x25333CC90](v80, -1, -1);
      MEMORY[0x25333CC90](v75, -1, -1);
    }
    else
    {
      v139 = *v74;
      (*v74)(v1[32], v1[30]);
    }

    uint64_t v110 = v1[28];
    uint64_t v109 = v1[29];
    uint64_t v111 = v1[26];
    uint64_t v134 = v1[27];
    uint64_t v137 = v1[50];
    uint64_t v113 = v1[24];
    uint64_t v112 = v1[25];
    v114 = (char *)v1[23];
    uint64_t v115 = swift_allocObject();
    *(void *)(v115 + 16) = v114;
    *(void *)(v115 + 24) = v63;
    v1[6] = sub_24E4D1368;
    v1[7] = v115;
    v1[2] = MEMORY[0x263EF8330];
    v1[3] = 1107296256;
    v1[4] = sub_24E4B0B08;
    v1[5] = &block_descriptor_407;
    v116 = _Block_copy(v141);
    v117 = v114;
    id v142 = v63;
    sub_24E4D1C40();
    v1[17] = MEMORY[0x263F8EE78];
    sub_24E4D13C4(&qword_26B1C1328, MEMORY[0x263F8F030]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C1338);
    sub_24E4CF1EC();
    sub_24E4D1EE0();
    MEMORY[0x25333C4D0](0, v109, v111, v116);
    _Block_release(v116);
    (*(void (**)(uint64_t, uint64_t))(v112 + 8))(v111, v113);
    (*(void (**)(uint64_t, uint64_t))(v110 + 8))(v109, v134);
    swift_release();
    v118 = *(void (**)(void, id))&v114[v137];
    if (v118)
    {
      swift_retain();
      v118(0, v142);
      sub_24E4ACF64((uint64_t)v118);
    }
    uint64_t v119 = v1[44];
    uint64_t v120 = v1[41];
    uint64_t v121 = v1[42];
    uint64_t v122 = v1[33];
    uint64_t v123 = v1[30];

    v139(v122, v123);
    (*(void (**)(uint64_t, uint64_t))(v121 + 8))(v119, v120);
  }
  else
  {
    if (qword_26B1C1318 != -1) {
      swift_once();
    }
    uint64_t v100 = sub_24E4D1C20();
    __swift_project_value_buffer(v100, (uint64_t)qword_26B1C13C0);
    v101 = sub_24E4D1C00();
    os_log_type_t v102 = sub_24E4D1E10();
    if (os_log_type_enabled(v101, v102))
    {
      v103 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v103 = 0;
      _os_log_impl(&dword_24E4A6000, v101, v102, "Unknown location update case", v103, 2u);
      MEMORY[0x25333CC90](v103, -1, -1);
    }
    uint64_t v105 = v1[43];
    uint64_t v104 = v1[44];
    uint64_t v107 = v1[41];
    uint64_t v106 = v1[42];

    v108 = *(void (**)(uint64_t, uint64_t))(v106 + 8);
    v108(v104, v107);
    v108(v105, v107);
  }
  v124 = (void *)swift_task_alloc();
  v1[51] = v124;
  void *v124 = v1;
  v124[1] = sub_24E4B5964;
  uint64_t v125 = v1[45];
  uint64_t v126 = v1[46];
  return MEMORY[0x270FA1F68](v125, 0, 0, v126);
}

void sub_24E4B69D8(uint64_t a1, void *a2, void *a3)
{
  swift_beginAccess();
  id v5 = a2;
  sub_24E4CB6C4((uint64_t)a3, v5);
  swift_endAccess();
}

uint64_t sub_24E4B6A54(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698EDDE0);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_24E4D1900();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v12 + 48))(a1, 1, v11) == 1)
  {
    sub_24E4B09A4(a1, &qword_2698EDDE0);
    sub_24E4CB508(a2, a3, (uint64_t)v10);
    swift_bridgeObjectRelease();
    return sub_24E4B09A4((uint64_t)v10, &qword_2698EDDE0);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v12 + 32))(v14, a1, v11);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v18 = *v4;
    *uint64_t v4 = 0x8000000000000000;
    sub_24E4CC720((uint64_t)v14, a2, a3, isUniquelyReferenced_nonNull_native);
    *uint64_t v4 = v18;
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
}

void sub_24E4B6C30(uint64_t a1, unint64_t a2)
{
  swift_beginAccess();
  uint64_t v3 = (void *)sub_24E4CB3B8(a2);
  swift_endAccess();
}

uint64_t sub_24E4B6E2C(int a1, int a2, int a3, uint64_t a4, void *aBlock, void *a6)
{
  v6[2] = a6;
  v6[3] = _Block_copy(aBlock);
  sub_24E4D0CB4(0, &qword_26B1C12E0);
  uint64_t v9 = sub_24E4D1D30();
  v6[4] = v9;
  uint64_t v12 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_2698EDB58 + dword_2698EDB58);
  a6;
  uint64_t v10 = (void *)swift_task_alloc();
  v6[5] = v10;
  *uint64_t v10 = v6;
  v10[1] = sub_24E4D163C;
  return v12(v9, a4);
}

uint64_t ObjCBootstrap.stopRefreshingLocation(for:priority:isFromGroup:)(uint64_t a1)
{
  id v5 = (uint64_t (*)(uint64_t))((char *)&dword_2698EDB68 + dword_2698EDB68);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_24E4AE08C;
  return v5(a1);
}

uint64_t sub_24E4B6FE0(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2698EDAF8);
    uint64_t v4 = swift_allocError();
    *id v5 = a2;
    id v6 = a2;
    return MEMORY[0x270FA2410](v2, v4);
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 32);
    return MEMORY[0x270FA2408](v7);
  }
}

uint64_t sub_24E4B7208(int a1, int a2, int a3, void *aBlock, void *a5)
{
  v5[2] = a5;
  v5[3] = _Block_copy(aBlock);
  sub_24E4D0CB4(0, &qword_26B1C12E0);
  uint64_t v7 = sub_24E4D1D30();
  v5[4] = v7;
  uint64_t v10 = (uint64_t (*)(uint64_t))((char *)&dword_2698EDB68 + dword_2698EDB68);
  a5;
  uint64_t v8 = (void *)swift_task_alloc();
  v5[5] = v8;
  void *v8 = v5;
  v8[1] = sub_24E4B7304;
  return v10(v7);
}

uint64_t sub_24E4B7304()
{
  uint64_t v2 = v0;
  uint64_t v4 = *v1;
  uint64_t v3 = *v1;
  id v5 = *(void **)(*v1 + 16);
  uint64_t v6 = *v1;
  swift_task_dealloc();

  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(v3 + 24);
  if (v2)
  {
    uint64_t v8 = (void *)sub_24E4D16B0();

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

uint64_t ObjCBootstrap.stopRefreshingLocation()()
{
  *(void *)(v1 + 24) = v0;
  return MEMORY[0x270FA2498](sub_24E4B74C4, 0, 0);
}

uint64_t sub_24E4B74C4()
{
  uint64_t v10 = v0;
  if (qword_26B1C1318 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_24E4D1C20();
  __swift_project_value_buffer(v1, (uint64_t)qword_26B1C13C0);
  uint64_t v2 = sub_24E4D1C00();
  os_log_type_t v3 = sub_24E4D1E20();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v5 = swift_slowAlloc();
    uint64_t v9 = v5;
    *(_DWORD *)uint64_t v4 = 136446210;
    v0[2] = sub_24E4CAAA0(0xD000000000000018, 0x800000024E4D3500, &v9);
    sub_24E4D1EB0();
    _os_log_impl(&dword_24E4A6000, v2, v3, "%{public}s", v4, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25333CC90](v5, -1, -1);
    MEMORY[0x25333CC90](v4, -1, -1);
  }

  uint64_t v6 = v0[3] + OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap_locationRefreshTaskLock;
  os_unfair_lock_lock((os_unfair_lock_t)v6);
  if (*(void *)(v6 + 8))
  {
    sub_24E4D1DE0();
    swift_release();
  }
  *(void *)(v6 + 8) = 0;
  os_unfair_lock_unlock((os_unfair_lock_t)v6);
  uint64_t v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

uint64_t sub_24E4B783C(const void *a1, void *a2)
{
  v2[2] = a2;
  v2[3] = _Block_copy(a1);
  id v4 = a2;
  uint64_t v5 = (void *)swift_task_alloc();
  v2[4] = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_24E4D152C;
  v5[3] = v4;
  return MEMORY[0x270FA2498](sub_24E4B74C4, 0, 0);
}

uint64_t ObjCBootstrap.startUpdatingFriends(initialUpdates:)(char a1)
{
  *(void *)(v2 + 32) = v1;
  *(unsigned char *)(v2 + 120) = a1;
  *(void *)(v2 + 40) = swift_getObjectType();
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C1370);
  *(void *)(v2 + 48) = v3;
  *(void *)(v2 + 56) = *(void *)(v3 - 8);
  *(void *)(v2 + 64) = swift_task_alloc();
  *(void *)(v2 + 72) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24E4B79E4, 0, 0);
}

uint64_t sub_24E4B79E4()
{
  uint64_t v1 = swift_task_alloc();
  *(void *)(v0 + 80) = v1;
  *(_OWORD *)(v1 + 16) = *(_OWORD *)(v0 + 32);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 88) = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_24E4B7AD4;
  return MEMORY[0x270FA2318]();
}

uint64_t sub_24E4B7AD4()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_24E4B7BEC, 0, 0);
}

uint64_t sub_24E4B7BEC()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 32) + OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap__session);
  *(void *)(v0 + 96) = v1;
  swift_retain();
  if (v1)
  {
    uint64_t v2 = (void *)swift_task_alloc();
    *(void *)(v0 + 104) = v2;
    *uint64_t v2 = v0;
    v2[1] = sub_24E4B7E3C;
    uint64_t v3 = *(void *)(v0 + 72);
    uint64_t v4 = *(unsigned __int8 *)(v0 + 120);
    return MEMORY[0x270F296B8](v3, v4);
  }
  else
  {
    if (qword_26B1C1318 != -1) {
      swift_once();
    }
    uint64_t v5 = sub_24E4D1C20();
    __swift_project_value_buffer(v5, (uint64_t)qword_26B1C13C0);
    uint64_t v6 = sub_24E4D1C00();
    os_log_type_t v7 = sub_24E4D1E10();
    if (os_log_type_enabled(v6, v7))
    {
      uint64_t v8 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl(&dword_24E4A6000, v6, v7, "Missing FindMyLocate.Session!", v8, 2u);
      MEMORY[0x25333CC90](v8, -1, -1);
    }

    type metadata accessor for FMLSessionError(0);
    *(void *)(v0 + 24) = 5;
    sub_24E4CA610(MEMORY[0x263F8EE78]);
    sub_24E4D13C4(&qword_2698EDA30, type metadata accessor for FMLSessionError);
    sub_24E4D16A0();
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v9 = *(uint64_t (**)(void))(v0 + 8);
    return v9();
  }
}

uint64_t sub_24E4B7E3C()
{
  *(void *)(*(void *)v1 + 112) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_24E4B818C;
  }
  else {
    uint64_t v2 = sub_24E4B7F50;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

void sub_24E4B7F50()
{
  if (qword_26B1C1318 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_24E4D1C20();
  __swift_project_value_buffer(v1, (uint64_t)qword_26B1C13C0);
  uint64_t v2 = sub_24E4D1C00();
  os_log_type_t v3 = sub_24E4D1E20();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_24E4A6000, v2, v3, "Successfully startUpdatingFriends stream", v4, 2u);
    MEMORY[0x25333CC90](v4, -1, -1);
  }
  uint64_t v5 = v0[14];
  uint64_t v7 = v0[8];
  uint64_t v6 = v0[9];
  uint64_t v8 = v0[6];
  uint64_t v9 = v0[7];
  uint64_t v11 = (char *)v0[4];
  uint64_t v10 = v0[5];

  (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(v7, v6, v8);
  uint64_t v12 = (uint64_t *)&v11[OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap_friendsUpdateTaskLock];
  os_unfair_lock_lock((os_unfair_lock_t)&v11[OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap_friendsUpdateTaskLock]);
  sub_24E4B8200(v12 + 1, v7, v11, v10, v13, &qword_26B1C1370, (uint64_t)&unk_270051320, (uint64_t)&unk_2698EDE60);
  if (v5)
  {
    os_unfair_lock_unlock((os_unfair_lock_t)v12);
  }
  else
  {
    uint64_t v15 = v0[8];
    uint64_t v14 = v0[9];
    uint64_t v16 = v0[6];
    uint64_t v17 = v0[7];
    os_unfair_lock_unlock((os_unfair_lock_t)v12);
    swift_release();
    uint64_t v18 = *(void (**)(uint64_t, uint64_t))(v17 + 8);
    v18(v14, v16);
    v18(v15, v16);
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v19 = (void (*)(void))v0[1];
    v19();
  }
}

uint64_t sub_24E4B818C()
{
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24E4B8200(uint64_t *a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t *a6, uint64_t a7, uint64_t a8)
{
  uint64_t v28 = a3;
  uint64_t v29 = a8;
  uint64_t v26 = a7;
  uint64_t v27 = a4;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(a6);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void *)(v11 + 64);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C1360);
  MEMORY[0x270FA5388](v14 - 8);
  uint64_t v16 = (char *)&v26 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*a1) {
    sub_24E4D1DE0();
  }
  uint64_t v17 = sub_24E4D1DB0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v16, 1, 1, v17);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))((char *)&v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), a2, v10);
  unint64_t v18 = (*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  unint64_t v19 = (v12 + v18 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = 0;
  *(void *)(v20 + 24) = 0;
  (*(void (**)(unint64_t, char *, uint64_t))(v11 + 32))(v20 + v18, v13, v10);
  uint64_t v22 = v27;
  int v21 = v28;
  *(void *)(v20 + v19) = v28;
  *(void *)(v20 + ((v19 + 15) & 0xFFFFFFFFFFFFFFF8)) = v22;
  id v23 = v21;
  uint64_t v24 = sub_24E4AE180((uint64_t)v16, v29, v20);
  uint64_t result = swift_release();
  *a1 = v24;
  return result;
}

uint64_t sub_24E4B8428(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[70] = a5;
  v5[69] = a4;
  uint64_t v6 = sub_24E4D1C30();
  v5[71] = v6;
  v5[72] = *(void *)(v6 - 8);
  v5[73] = swift_task_alloc();
  uint64_t v7 = sub_24E4D1C50();
  v5[74] = v7;
  v5[75] = *(void *)(v7 - 8);
  v5[76] = swift_task_alloc();
  uint64_t v8 = sub_24E4D1710();
  v5[77] = v8;
  v5[78] = *(void *)(v8 - 8);
  v5[79] = swift_task_alloc();
  v5[80] = swift_task_alloc();
  v5[81] = swift_task_alloc();
  v5[82] = swift_task_alloc();
  uint64_t v9 = sub_24E4D1900();
  v5[83] = v9;
  uint64_t v10 = *(void *)(v9 - 8);
  v5[84] = v10;
  v5[85] = *(void *)(v10 + 64);
  v5[86] = swift_task_alloc();
  v5[87] = swift_task_alloc();
  v5[88] = swift_task_alloc();
  v5[89] = swift_task_alloc();
  v5[90] = swift_task_alloc();
  v5[91] = swift_task_alloc();
  v5[92] = swift_task_alloc();
  v5[93] = swift_task_alloc();
  v5[94] = swift_task_alloc();
  v5[95] = swift_task_alloc();
  uint64_t v11 = sub_24E4D1790();
  v5[96] = v11;
  v5[97] = *(void *)(v11 - 8);
  v5[98] = swift_task_alloc();
  v5[99] = swift_task_alloc();
  v5[100] = swift_task_alloc();
  v5[101] = swift_task_alloc();
  v5[102] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C1310);
  v5[103] = swift_task_alloc();
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C1368);
  v5[104] = v12;
  v5[105] = *(void *)(v12 - 8);
  v5[106] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24E4B87C0, 0, 0);
}

uint64_t sub_24E4B87C0()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C1370);
  sub_24E4D1DC0();
  *(void *)(v0 + 856) = OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap_serialQueue;
  *(void *)(v0 + 864) = OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap_friendshipUpdateCallback;
  swift_beginAccess();
  uint64_t v1 = (_DWORD *)MEMORY[0x263F3CD80];
  *(_DWORD *)(v0 + 880) = *MEMORY[0x263F3CD78];
  *(_DWORD *)(v0 + 884) = *v1;
  *(_DWORD *)(v0 + 888) = *MEMORY[0x263F3CD88];
  uint64_t v2 = (_DWORD *)MEMORY[0x263F3CCE0];
  *(_DWORD *)(v0 + 892) = *MEMORY[0x263F3CCD8];
  *(_DWORD *)(v0 + 896) = *v2;
  *(_DWORD *)(v0 + 900) = *MEMORY[0x263F3CCC8];
  uint64_t v3 = (_DWORD *)MEMORY[0x263F3CCC0];
  *(_DWORD *)(v0 + 904) = *MEMORY[0x263F3CCD0];
  *(_DWORD *)(v0 + 908) = *v3;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 872) = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_24E4B8948;
  uint64_t v5 = *(void *)(v0 + 832);
  uint64_t v6 = *(void *)(v0 + 824);
  return MEMORY[0x270FA1F68](v6, 0, 0, v5);
}

uint64_t sub_24E4B8948()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_24E4B8A44, 0, 0);
}

uint64_t sub_24E4B8A44()
{
  v361 = v0;
  uint64_t v1 = v0;
  uint64_t v2 = v0[103];
  uint64_t v3 = v0[97];
  uint64_t v4 = v0[96];
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v2, 1, v4) == 1)
  {
    (*(void (**)(void, void))(v1[105] + 8))(v1[106], v1[104]);
LABEL_13:
    if (qword_26B1C1318 != -1) {
      swift_once();
    }
    uint64_t v36 = sub_24E4D1C20();
    __swift_project_value_buffer(v36, (uint64_t)qword_26B1C13C0);
    uint64_t v37 = sub_24E4D1C00();
    os_log_type_t v38 = sub_24E4D1E20();
    if (os_log_type_enabled(v37, v38))
    {
      uint64_t v39 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v39 = 0;
      _os_log_impl(&dword_24E4A6000, v37, v38, "Successfully startUpdatingFriends", v39, 2u);
      MEMORY[0x25333CC90](v39, -1, -1);
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
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v40 = (uint64_t (*)(void))v1[1];
    return v40();
  }
  (*(void (**)(void, uint64_t, uint64_t))(v3 + 32))(v1[102], v2, v4);
  if (sub_24E4D1DF0())
  {
    if (qword_26B1C1318 != -1) {
      swift_once();
    }
    uint64_t v5 = sub_24E4D1C20();
    __swift_project_value_buffer(v5, (uint64_t)qword_26B1C13C0);
    uint64_t v6 = sub_24E4D1C00();
    os_log_type_t v7 = sub_24E4D1E20();
    BOOL v8 = os_log_type_enabled(v6, v7);
    uint64_t v9 = v1[106];
    uint64_t v10 = v1[105];
    uint64_t v11 = v1[104];
    uint64_t v12 = v1[102];
    uint64_t v13 = v1[97];
    uint64_t v14 = v1[96];
    if (v8)
    {
      uint64_t v356 = v1[104];
      uint64_t v15 = (uint8_t *)swift_slowAlloc();
      uint64_t v354 = v12;
      uint64_t v16 = swift_slowAlloc();
      uint64_t v360 = v16;
      *(_DWORD *)uint64_t v15 = 136446210;
      v1[68] = sub_24E4CAAA0(0xD000000000000025, 0x800000024E4D3900, &v360);
      sub_24E4D1EB0();
      _os_log_impl(&dword_24E4A6000, v6, v7, "%{public}s has been canceled", v15, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25333CC90](v16, -1, -1);
      MEMORY[0x25333CC90](v15, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v354, v14);
      (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v356);
    }
    else
    {

      (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v12, v14);
      (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v11);
    }
    goto LABEL_13;
  }
  if (qword_26B1C1318 != -1) {
    swift_once();
  }
  uint64_t v17 = v1[102];
  uint64_t v18 = v1[101];
  uint64_t v19 = v1[97];
  uint64_t v20 = v1[96];
  uint64_t v21 = sub_24E4D1C20();
  __swift_project_value_buffer(v21, (uint64_t)qword_26B1C13C0);
  uint64_t v22 = *(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 16);
  v22(v18, v17, v20);
  id v23 = sub_24E4D1C00();
  os_log_type_t v24 = sub_24E4D1E20();
  BOOL v25 = os_log_type_enabled(v23, v24);
  uint64_t v26 = v1[101];
  v290 = v1;
  v357 = v1 + 102;
  if (v25)
  {
    uint64_t v27 = v1[100];
    uint64_t v28 = v1[97];
    uint64_t v29 = v1[96];
    uint64_t v30 = swift_slowAlloc();
    uint64_t v31 = swift_slowAlloc();
    uint64_t v360 = v31;
    *(_DWORD *)uint64_t v30 = 136446466;
    *(void *)(v30 + 4) = sub_24E4CAAA0(0xD000000000000025, 0x800000024E4D3900, &v360);
    *(_WORD *)(v30 + 12) = 2080;
    v22(v27, v26, v29);
    uint64_t v32 = sub_24E4D1CD0();
    *(void *)(v30 + 14) = sub_24E4CAAA0(v32, v33, &v360);
    swift_bridgeObjectRelease();
    uint64_t v34 = *(void (**)(uint64_t, uint64_t))(v28 + 8);
    v34(v26, v29);
    _os_log_impl(&dword_24E4A6000, v23, v24, "%{public}s friendshipUpdate: %s", (uint8_t *)v30, 0x16u);
    swift_arrayDestroy();
    uint64_t v35 = v31;
    uint64_t v1 = v290;
    MEMORY[0x25333CC90](v35, -1, -1);
    MEMORY[0x25333CC90](v30, -1, -1);
  }
  else
  {
    uint64_t v34 = *(void (**)(uint64_t, uint64_t))(v1[97] + 8);
    v34(v26, v1[96]);
  }

  int v42 = *((_DWORD *)v1 + 220);
  uint64_t v43 = v1[99];
  uint64_t v44 = v1[97];
  uint64_t v45 = v1[96];
  v22(v43, v1[102], v45);
  int v46 = (*(uint64_t (**)(uint64_t, uint64_t))(v44 + 88))(v43, v45);
  v355 = v34;
  if (v46 != v42)
  {
    if (v46 == *((_DWORD *)v1 + 221))
    {
      int v69 = *((_DWORD *)v1 + 223);
      uint64_t v70 = v1[99];
      uint64_t v71 = v1[91];
      uint64_t v72 = v1[84];
      uint64_t v73 = v1[83];
      uint64_t v74 = v1[80];
      uint64_t v75 = v1[78];
      uint64_t v76 = v1[77];
      (*(void (**)(uint64_t, void))(v1[97] + 96))(v70, v1[96]);
      uint64_t v77 = *(void (**)(uint64_t, uint64_t, uint64_t))(v72 + 32);
      v77(v71, v70, v73);
      sub_24E4D18B0();
      int v78 = (*(uint64_t (**)(uint64_t, uint64_t))(v75 + 88))(v74, v76);
      if (v78 == v69)
      {
        uint64_t v79 = v1[94];
        uint64_t v80 = (void (*)(unint64_t, uint64_t, uint64_t))v77;
        uint64_t v81 = v1[84];
        uint64_t v82 = v1[83];
        uint64_t v83 = v1[76];
        uint64_t v325 = v1[75];
        uint64_t v337 = v1[74];
        os_log_t loga = (os_log_t)v1[72];
        uint64_t v292 = v1[73];
        uint64_t v301 = v1[71];
        uint64_t v84 = (void *)v1[70];
        v85 = *(void (**)(uint64_t, void, uint64_t))(v81 + 16);
        v85(v79, v1[91], v82);
        unint64_t v86 = (*(unsigned __int8 *)(v81 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v81 + 80);
        uint64_t v87 = swift_allocObject();
        *(void *)(v87 + 16) = v84;
        v80(v87 + v86, v79, v82);
        v1[54] = sub_24E4D1014;
        v1[55] = v87;
        v1[50] = MEMORY[0x263EF8330];
        v1[51] = 1107296256;
        v1[52] = sub_24E4B0B08;
        v1[53] = &block_descriptor_372;
        v88 = _Block_copy(v1 + 50);
        id v89 = v84;
        sub_24E4D1C40();
        v1[61] = MEMORY[0x263F8EE78];
        sub_24E4D13C4(&qword_26B1C1328, MEMORY[0x263F8F030]);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C1338);
        sub_24E4CF1EC();
        v90 = v85;
        sub_24E4D1EE0();
        MEMORY[0x25333C4D0](0, v83, v292, v88);
        _Block_release(v88);
        ((void (*)(uint64_t, uint64_t))loga[1].isa)(v292, v301);
        (*(void (**)(uint64_t, uint64_t))(v325 + 8))(v83, v337);
      }
      else if (v78 == *((_DWORD *)v1 + 224))
      {
        uint64_t v142 = v1[94];
        v143 = (void (*)(unint64_t, uint64_t, uint64_t))v77;
        uint64_t v144 = v1[84];
        uint64_t v145 = v1[83];
        uint64_t v146 = v1[76];
        uint64_t v328 = v1[75];
        uint64_t v340 = v1[74];
        os_log_t logd = (os_log_t)v1[72];
        uint64_t v295 = v1[73];
        uint64_t v304 = v1[71];
        v147 = (void *)v1[70];
        uint64_t v148 = *(void (**)(uint64_t, void, uint64_t))(v144 + 16);
        v148(v142, v1[91], v145);
        unint64_t v149 = (*(unsigned __int8 *)(v144 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v144 + 80);
        uint64_t v150 = swift_allocObject();
        *(void *)(v150 + 16) = v147;
        v143(v150 + v149, v142, v145);
        v1[36] = sub_24E4D0FAC;
        v1[37] = v150;
        v1[32] = MEMORY[0x263EF8330];
        v1[33] = 1107296256;
        v1[34] = sub_24E4B0B08;
        v1[35] = &block_descriptor_366;
        v151 = _Block_copy(v1 + 32);
        id v152 = v147;
        sub_24E4D1C40();
        v1[59] = MEMORY[0x263F8EE78];
        sub_24E4D13C4(&qword_26B1C1328, MEMORY[0x263F8F030]);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C1338);
        sub_24E4CF1EC();
        v90 = v148;
        sub_24E4D1EE0();
        MEMORY[0x25333C4D0](0, v146, v295, v151);
        _Block_release(v151);
        ((void (*)(uint64_t, uint64_t))logd[1].isa)(v295, v304);
        (*(void (**)(uint64_t, uint64_t))(v328 + 8))(v146, v340);
      }
      else
      {
        if (v78 == *((_DWORD *)v1 + 225) || v78 == *((_DWORD *)v1 + 226))
        {
          v90 = *(void (**)(void, void, void))(v1[84] + 16);
          goto LABEL_42;
        }
        if (v78 != *((_DWORD *)v1 + 227))
        {
          v90 = *(void (**)(void, void, void))(v1[84] + 16);
          v90(v1[90], v1[91], v1[83]);
          v261 = sub_24E4D1C00();
          os_log_type_t v262 = sub_24E4D1E10();
          BOOL v263 = os_log_type_enabled(v261, v262);
          uint64_t v264 = v1[84];
          if (v263)
          {
            uint64_t v265 = v1[81];
            uint64_t v266 = v1[78];
            uint64_t v267 = v1[77];
            uint64_t v334 = v1[90];
            uint64_t v346 = v1[83];
            uint64_t v268 = swift_slowAlloc();
            uint64_t v352 = swift_slowAlloc();
            uint64_t v360 = v352;
            *(_DWORD *)uint64_t v268 = 136446466;
            *(void *)(v268 + 4) = sub_24E4CAAA0(0xD000000000000025, 0x800000024E4D3900, &v360);
            *(_WORD *)(v268 + 12) = 2080;
            sub_24E4D18B0();
            sub_24E4D13C4(&qword_2698EDE18, MEMORY[0x263F3CCE8]);
            uint64_t v269 = sub_24E4D1FF0();
            logj = v261;
            v270 = v90;
            unint64_t v272 = v271;
            os_log_type_t typea = v262;
            v273 = *(void (**)(uint64_t, uint64_t))(v266 + 8);
            v273(v265, v267);
            *(void *)(v268 + 14) = sub_24E4CAAA0(v269, v272, &v360);
            v90 = v270;
            swift_bridgeObjectRelease();
            (*(void (**)(uint64_t, uint64_t))(v264 + 8))(v334, v346);
            _os_log_impl(&dword_24E4A6000, logj, typea, "%{public}s Unknown friend.type %s!", (uint8_t *)v268, 0x16u);
            swift_arrayDestroy();
            MEMORY[0x25333CC90](v352, -1, -1);
            MEMORY[0x25333CC90](v268, -1, -1);
          }
          else
          {
            uint64_t v288 = v1[78];
            (*(void (**)(void, void))(v264 + 8))(v1[90], v1[83]);

            v273 = *(void (**)(uint64_t, uint64_t))(v288 + 8);
          }
          v273(v1[80], v1[77]);
          goto LABEL_42;
        }
        uint64_t v216 = v1[94];
        v217 = (void (*)(unint64_t, uint64_t, uint64_t))v77;
        uint64_t v218 = v1[84];
        uint64_t v219 = v1[83];
        uint64_t v220 = v1[76];
        uint64_t v331 = v1[75];
        uint64_t v343 = v1[74];
        os_log_t logg = (os_log_t)v1[72];
        uint64_t v298 = v1[73];
        uint64_t v307 = v1[71];
        v221 = (void *)v1[70];
        v222 = *(void (**)(uint64_t, void, uint64_t))(v218 + 16);
        v222(v216, v1[91], v219);
        unint64_t v223 = (*(unsigned __int8 *)(v218 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v218 + 80);
        uint64_t v224 = swift_allocObject();
        *(void *)(v224 + 16) = v221;
        v217(v224 + v223, v216, v219);
        v1[48] = sub_24E4D0F34;
        v1[49] = v224;
        v1[44] = MEMORY[0x263EF8330];
        v1[45] = 1107296256;
        v1[46] = sub_24E4B0B08;
        v1[47] = &block_descriptor_360;
        v225 = _Block_copy(v1 + 44);
        id v226 = v221;
        sub_24E4D1C40();
        v1[60] = MEMORY[0x263F8EE78];
        sub_24E4D13C4(&qword_26B1C1328, MEMORY[0x263F8F030]);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C1338);
        sub_24E4CF1EC();
        v90 = v222;
        sub_24E4D1EE0();
        MEMORY[0x25333C4D0](0, v220, v298, v225);
        _Block_release(v225);
        ((void (*)(uint64_t, uint64_t))logg[1].isa)(v298, v307);
        (*(void (**)(uint64_t, uint64_t))(v331 + 8))(v220, v343);
      }
      swift_release();
LABEL_42:
      v349 = v90;
      v90(v1[89], v1[91], v1[83]);
      v153 = sub_24E4D1C00();
      os_log_type_t v154 = sub_24E4D1E20();
      BOOL v155 = os_log_type_enabled(v153, v154);
      uint64_t v156 = v1[89];
      uint64_t v157 = v1[83];
      v158 = (void (**)(uint64_t, uint64_t))(v1[84] + 8);
      if (v155)
      {
        uint64_t v159 = swift_slowAlloc();
        uint64_t v160 = swift_slowAlloc();
        uint64_t v360 = v160;
        *(_DWORD *)uint64_t v159 = 136446466;
        *(void *)(v159 + 4) = sub_24E4CAAA0(0xD000000000000025, 0x800000024E4D3900, &v360);
        *(_WORD *)(v159 + 12) = 2080;
        sub_24E4D13C4(&qword_2698EDE20, MEMORY[0x263F3CF40]);
        uint64_t v161 = sub_24E4D1FF0();
        *(void *)(v159 + 14) = sub_24E4CAAA0(v161, v162, &v360);
        swift_bridgeObjectRelease();
        uint64_t v112 = *v158;
        (*v158)(v156, v157);
        _os_log_impl(&dword_24E4A6000, v153, v154, "%{public}s Removed friend: %s", (uint8_t *)v159, 0x16u);
        swift_arrayDestroy();
        uint64_t v163 = v160;
        uint64_t v1 = v290;
        MEMORY[0x25333CC90](v163, -1, -1);
        MEMORY[0x25333CC90](v159, -1, -1);
      }
      else
      {
        uint64_t v112 = *v158;
        (*v158)(v1[89], v1[83]);
      }

      v189 = *(void (**)(void *, void))(v1[70] + v1[108]);
      if (v189)
      {
        uint64_t v190 = v1[94];
        uint64_t v191 = v1[91];
        uint64_t v192 = v1[83];
        sub_24E4D0CB4(0, &qword_26B1C12D8);
        v349(v190, v191, v192);
        swift_retain();
        v193 = (void *)FMLFriend.init(_:)(v190);
        v189(v193, 0);

        sub_24E4ACF64((uint64_t)v189);
      }
      uint64_t v141 = v1[91];
      goto LABEL_69;
    }
    if (v46 != *((_DWORD *)v1 + 222))
    {
      v175 = v1 + 99;
      v22(v1[98], v1[102], v1[96]);
      v176 = sub_24E4D1C00();
      os_log_type_t v177 = sub_24E4D1E10();
      BOOL v178 = os_log_type_enabled(v176, v177);
      uint64_t v179 = v1[102];
      if (v178)
      {
        v358 = v1 + 99;
        v180 = v1;
        uint64_t v181 = v1[100];
        uint64_t v182 = v180[98];
        uint64_t v183 = v180[96];
        uint64_t v359 = v179;
        uint64_t v184 = swift_slowAlloc();
        uint64_t v185 = swift_slowAlloc();
        uint64_t v360 = v185;
        *(_DWORD *)uint64_t v184 = 136315138;
        v22(v181, v182, v183);
        uint64_t v186 = sub_24E4D1CD0();
        *(void *)(v184 + 4) = sub_24E4CAAA0(v186, v187, &v360);
        uint64_t v1 = v180;
        v175 = v358;
        swift_bridgeObjectRelease();
        uint64_t v188 = v182;
        uint64_t v34 = v355;
        v355(v188, v183);
        _os_log_impl(&dword_24E4A6000, v176, v177, "Unknown friendship update type %s", (uint8_t *)v184, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x25333CC90](v185, -1, -1);
        MEMORY[0x25333CC90](v184, -1, -1);

        v355(v359, v183);
      }
      else
      {
        uint64_t v227 = v1[98];
        uint64_t v228 = v1[96];

        v34(v227, v228);
        v34(v179, v228);
      }
      goto LABEL_70;
    }
    int v114 = *((_DWORD *)v1 + 223);
    uint64_t v115 = v1[99];
    uint64_t v116 = v1[88];
    uint64_t v117 = v1[84];
    uint64_t v118 = v1[83];
    uint64_t v119 = v1[79];
    uint64_t v120 = v1[78];
    uint64_t v121 = v1[77];
    (*(void (**)(uint64_t, void))(v1[97] + 96))(v115, v1[96]);
    uint64_t v122 = *(void (**)(uint64_t, uint64_t, uint64_t))(v117 + 32);
    v122(v116, v115, v118);
    sub_24E4D18B0();
    int v123 = (*(uint64_t (**)(uint64_t, uint64_t))(v120 + 88))(v119, v121);
    if (v123 == v114)
    {
      uint64_t v124 = v1[94];
      uint64_t v125 = (void (*)(unint64_t, uint64_t, uint64_t))v122;
      uint64_t v126 = v1[84];
      uint64_t v127 = v1[83];
      uint64_t v128 = v1[76];
      uint64_t v327 = v1[75];
      uint64_t v339 = v1[74];
      os_log_t logc = (os_log_t)v1[72];
      uint64_t v294 = v1[73];
      uint64_t v303 = v1[71];
      uint64_t v129 = (void *)v1[70];
      uint64_t v130 = *(void (**)(uint64_t, void, uint64_t))(v126 + 16);
      v130(v124, v1[88], v127);
      unint64_t v131 = (*(unsigned __int8 *)(v126 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v126 + 80);
      uint64_t v132 = swift_allocObject();
      *(void *)(v132 + 16) = v129;
      v125(v132 + v131, v124, v127);
      v1[6] = sub_24E4D0F24;
      v1[7] = v132;
      v1[2] = MEMORY[0x263EF8330];
      v1[3] = 1107296256;
      v1[4] = sub_24E4B0B08;
      v1[5] = &block_descriptor_354;
      v133 = _Block_copy(v1 + 2);
      id v134 = v129;
      sub_24E4D1C40();
      v1[62] = MEMORY[0x263F8EE78];
      sub_24E4D13C4(&qword_26B1C1328, MEMORY[0x263F8F030]);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C1338);
      sub_24E4CF1EC();
      uint64_t v135 = v130;
      sub_24E4D1EE0();
      MEMORY[0x25333C4D0](0, v128, v294, v133);
      _Block_release(v133);
      ((void (*)(uint64_t, uint64_t))logc[1].isa)(v294, v303);
      (*(void (**)(uint64_t, uint64_t))(v327 + 8))(v128, v339);
    }
    else if (v123 == *((_DWORD *)v1 + 224))
    {
      uint64_t v194 = v1[94];
      v195 = (void (*)(unint64_t, uint64_t, uint64_t))v122;
      uint64_t v196 = v1[84];
      uint64_t v197 = v1[83];
      uint64_t v198 = v1[76];
      uint64_t v330 = v1[75];
      uint64_t v342 = v1[74];
      os_log_t logf = (os_log_t)v1[72];
      uint64_t v297 = v1[73];
      uint64_t v306 = v1[71];
      v199 = (void *)v1[70];
      v200 = *(void (**)(uint64_t, void, uint64_t))(v196 + 16);
      v200(v194, v1[88], v197);
      unint64_t v201 = (*(unsigned __int8 *)(v196 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v196 + 80);
      uint64_t v202 = swift_allocObject();
      *(void *)(v202 + 16) = v199;
      v195(v202 + v201, v194, v197);
      v1[24] = sub_24E4D0EAC;
      v1[25] = v202;
      v1[20] = MEMORY[0x263EF8330];
      v1[21] = 1107296256;
      v1[22] = sub_24E4B0B08;
      v1[23] = &block_descriptor_348;
      v203 = _Block_copy(v1 + 20);
      id v204 = v199;
      sub_24E4D1C40();
      v1[64] = MEMORY[0x263F8EE78];
      sub_24E4D13C4(&qword_26B1C1328, MEMORY[0x263F8F030]);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C1338);
      sub_24E4CF1EC();
      uint64_t v135 = v200;
      sub_24E4D1EE0();
      MEMORY[0x25333C4D0](0, v198, v297, v203);
      _Block_release(v203);
      ((void (*)(uint64_t, uint64_t))logf[1].isa)(v297, v306);
      (*(void (**)(uint64_t, uint64_t))(v330 + 8))(v198, v342);
    }
    else
    {
      if (v123 == *((_DWORD *)v1 + 225) || v123 == *((_DWORD *)v1 + 226))
      {
        uint64_t v135 = *(void (**)(void, void, void))(v1[84] + 16);
        goto LABEL_57;
      }
      if (v123 != *((_DWORD *)v1 + 227))
      {
        uint64_t v135 = *(void (**)(void, void, void))(v1[84] + 16);
        v135(v1[87], v1[88], v1[83]);
        v275 = sub_24E4D1C00();
        os_log_type_t v276 = sub_24E4D1E10();
        BOOL v277 = os_log_type_enabled(v275, v276);
        uint64_t v278 = v1[84];
        if (v277)
        {
          uint64_t v279 = v1[81];
          uint64_t v280 = v1[78];
          uint64_t v281 = v1[77];
          uint64_t v335 = v1[87];
          uint64_t v347 = v1[83];
          uint64_t v282 = swift_slowAlloc();
          uint64_t v353 = swift_slowAlloc();
          uint64_t v360 = v353;
          *(_DWORD *)uint64_t v282 = 136446466;
          *(void *)(v282 + 4) = sub_24E4CAAA0(0xD000000000000025, 0x800000024E4D3900, &v360);
          *(_WORD *)(v282 + 12) = 2080;
          sub_24E4D18B0();
          sub_24E4D13C4(&qword_2698EDE18, MEMORY[0x263F3CCE8]);
          uint64_t v283 = sub_24E4D1FF0();
          logk = v275;
          v284 = v135;
          unint64_t v286 = v285;
          os_log_type_t typeb = v276;
          v287 = *(void (**)(uint64_t, uint64_t))(v280 + 8);
          v287(v279, v281);
          *(void *)(v282 + 14) = sub_24E4CAAA0(v283, v286, &v360);
          uint64_t v135 = v284;
          swift_bridgeObjectRelease();
          (*(void (**)(uint64_t, uint64_t))(v278 + 8))(v335, v347);
          _os_log_impl(&dword_24E4A6000, logk, typeb, "%{public}s Unknown friend.type %s!", (uint8_t *)v282, 0x16u);
          swift_arrayDestroy();
          MEMORY[0x25333CC90](v353, -1, -1);
          MEMORY[0x25333CC90](v282, -1, -1);
        }
        else
        {
          uint64_t v289 = v1[78];
          (*(void (**)(void, void))(v278 + 8))(v1[87], v1[83]);

          v287 = *(void (**)(uint64_t, uint64_t))(v289 + 8);
        }
        v287(v1[79], v1[77]);
        goto LABEL_57;
      }
      uint64_t v250 = v1[94];
      v251 = (void (*)(unint64_t, uint64_t, uint64_t))v122;
      uint64_t v252 = v1[84];
      uint64_t v253 = v1[83];
      uint64_t v254 = v1[76];
      uint64_t v333 = v1[75];
      uint64_t v345 = v1[74];
      os_log_t logi = (os_log_t)v1[72];
      uint64_t v299 = v1[73];
      uint64_t v308 = v1[71];
      v255 = (void *)v1[70];
      v256 = *(void (**)(uint64_t, void, uint64_t))(v252 + 16);
      v256(v250, v1[88], v253);
      unint64_t v257 = (*(unsigned __int8 *)(v252 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v252 + 80);
      uint64_t v258 = swift_allocObject();
      *(void *)(v258 + 16) = v255;
      v251(v258 + v257, v250, v253);
      v1[12] = sub_24E4D0E9C;
      v1[13] = v258;
      v1[8] = MEMORY[0x263EF8330];
      v1[9] = 1107296256;
      v1[10] = sub_24E4B0B08;
      v1[11] = &block_descriptor_342;
      v259 = _Block_copy(v1 + 8);
      id v260 = v255;
      sub_24E4D1C40();
      v1[66] = MEMORY[0x263F8EE78];
      sub_24E4D13C4(&qword_26B1C1328, MEMORY[0x263F8F030]);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C1338);
      sub_24E4CF1EC();
      uint64_t v135 = v256;
      sub_24E4D1EE0();
      MEMORY[0x25333C4D0](0, v254, v299, v259);
      _Block_release(v259);
      ((void (*)(uint64_t, uint64_t))logi[1].isa)(v299, v308);
      (*(void (**)(uint64_t, uint64_t))(v333 + 8))(v254, v345);
    }
    swift_release();
LABEL_57:
    v350 = v135;
    v135(v1[86], v1[88], v1[83]);
    v205 = sub_24E4D1C00();
    os_log_type_t v206 = sub_24E4D1E20();
    BOOL v207 = os_log_type_enabled(v205, v206);
    uint64_t v208 = v1[86];
    uint64_t v209 = v1[83];
    v210 = (void (**)(uint64_t, uint64_t))(v1[84] + 8);
    if (v207)
    {
      uint64_t v211 = swift_slowAlloc();
      uint64_t v212 = swift_slowAlloc();
      uint64_t v360 = v212;
      *(_DWORD *)uint64_t v211 = 136446466;
      *(void *)(v211 + 4) = sub_24E4CAAA0(0xD000000000000025, 0x800000024E4D3900, &v360);
      *(_WORD *)(v211 + 12) = 2080;
      sub_24E4D13C4(&qword_2698EDE20, MEMORY[0x263F3CF40]);
      uint64_t v213 = sub_24E4D1FF0();
      *(void *)(v211 + 14) = sub_24E4CAAA0(v213, v214, &v360);
      swift_bridgeObjectRelease();
      uint64_t v112 = *v210;
      (*v210)(v208, v209);
      _os_log_impl(&dword_24E4A6000, v205, v206, "%{public}s Modified friend: %s", (uint8_t *)v211, 0x16u);
      swift_arrayDestroy();
      uint64_t v215 = v212;
      uint64_t v1 = v290;
      MEMORY[0x25333CC90](v215, -1, -1);
      MEMORY[0x25333CC90](v211, -1, -1);
    }
    else
    {
      uint64_t v112 = *v210;
      (*v210)(v1[86], v1[83]);
    }

    v229 = *(void (**)(void *, uint64_t))(v1[70] + v1[108]);
    if (v229)
    {
      uint64_t v230 = v1[94];
      uint64_t v231 = v1[88];
      uint64_t v232 = v1[83];
      sub_24E4D0CB4(0, &qword_26B1C12D8);
      v350(v230, v231, v232);
      swift_retain();
      v233 = (void *)FMLFriend.init(_:)(v230);
      v229(v233, 2);

      sub_24E4ACF64((uint64_t)v229);
    }
    uint64_t v141 = v1[88];
    goto LABEL_69;
  }
  int v47 = *((_DWORD *)v1 + 223);
  uint64_t v48 = v1[99];
  uint64_t v49 = v1[95];
  uint64_t v50 = v1[84];
  uint64_t v51 = v1[83];
  uint64_t v52 = v1[82];
  uint64_t v53 = v1[78];
  uint64_t v54 = v1[77];
  (*(void (**)(uint64_t, void))(v1[97] + 96))(v48, v1[96]);
  unint64_t v55 = *(void (**)(uint64_t, uint64_t, uint64_t))(v50 + 32);
  v55(v49, v48, v51);
  sub_24E4D18B0();
  int v56 = (*(uint64_t (**)(uint64_t, uint64_t))(v53 + 88))(v52, v54);
  if (v56 == v47)
  {
    uint64_t v57 = v1[94];
    uint64_t v58 = v1[84];
    uint64_t v59 = (void (*)(unint64_t, uint64_t, uint64_t))v55;
    uint64_t v60 = v1[83];
    uint64_t v61 = v1[76];
    uint64_t v324 = v1[75];
    uint64_t v336 = v1[74];
    os_log_t log = (os_log_t)v1[72];
    uint64_t v291 = v1[73];
    uint64_t v300 = v1[71];
    uint64_t v62 = (void *)v1[70];
    id v63 = *(void (**)(uint64_t, void, uint64_t))(v58 + 16);
    v63(v57, v1[95], v60);
    unint64_t v64 = (*(unsigned __int8 *)(v58 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v58 + 80);
    uint64_t v65 = swift_allocObject();
    *(void *)(v65 + 16) = v62;
    v59(v65 + v64, v57, v60);
    v1[18] = sub_24E4D0F24;
    v1[19] = v65;
    v1[14] = MEMORY[0x263EF8330];
    v1[15] = 1107296256;
    v1[16] = sub_24E4B0B08;
    v1[17] = &block_descriptor_390;
    uint64_t v66 = _Block_copy(v1 + 14);
    id v67 = v62;
    sub_24E4D1C40();
    v1[67] = MEMORY[0x263F8EE78];
    sub_24E4D13C4(&qword_26B1C1328, MEMORY[0x263F8F030]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C1338);
    sub_24E4CF1EC();
    uint64_t v68 = v63;
    sub_24E4D1EE0();
    MEMORY[0x25333C4D0](0, v61, v291, v66);
    _Block_release(v66);
    ((void (*)(uint64_t, uint64_t))log[1].isa)(v291, v300);
    (*(void (**)(uint64_t, uint64_t))(v324 + 8))(v61, v336);
  }
  else if (v56 == *((_DWORD *)v1 + 224))
  {
    uint64_t v91 = v1[94];
    id v92 = (void (*)(unint64_t, uint64_t, uint64_t))v55;
    uint64_t v93 = v1[84];
    uint64_t v94 = v1[83];
    uint64_t v95 = v1[76];
    uint64_t v326 = v1[75];
    uint64_t v338 = v1[74];
    os_log_t logb = (os_log_t)v1[72];
    uint64_t v293 = v1[73];
    uint64_t v302 = v1[71];
    uint64_t v96 = (void *)v1[70];
    uint64_t v97 = *(void (**)(uint64_t, void, uint64_t))(v93 + 16);
    v97(v91, v1[95], v94);
    unint64_t v98 = (*(unsigned __int8 *)(v93 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v93 + 80);
    uint64_t v99 = swift_allocObject();
    *(void *)(v99 + 16) = v96;
    v92(v99 + v98, v91, v94);
    v1[30] = sub_24E4D0EAC;
    v1[31] = v99;
    v1[26] = MEMORY[0x263EF8330];
    v1[27] = 1107296256;
    v1[28] = sub_24E4B0B08;
    v1[29] = &block_descriptor_384;
    uint64_t v100 = _Block_copy(v1 + 26);
    id v101 = v96;
    sub_24E4D1C40();
    v1[65] = MEMORY[0x263F8EE78];
    sub_24E4D13C4(&qword_26B1C1328, MEMORY[0x263F8F030]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C1338);
    sub_24E4CF1EC();
    uint64_t v68 = v97;
    sub_24E4D1EE0();
    MEMORY[0x25333C4D0](0, v95, v293, v100);
    _Block_release(v100);
    ((void (*)(uint64_t, uint64_t))logb[1].isa)(v293, v302);
    (*(void (**)(uint64_t, uint64_t))(v326 + 8))(v95, v338);
  }
  else
  {
    if (v56 == *((_DWORD *)v1 + 225) || v56 == *((_DWORD *)v1 + 226))
    {
      uint64_t v68 = *(void (**)(void, void, void))(v1[84] + 16);
      goto LABEL_30;
    }
    if (v56 != *((_DWORD *)v1 + 227))
    {
      uint64_t v68 = *(void (**)(void, void, void))(v1[84] + 16);
      v68(v1[93], v1[95], v1[83]);
      v237 = sub_24E4D1C00();
      os_log_type_t v238 = sub_24E4D1E10();
      BOOL v239 = os_log_type_enabled(v237, v238);
      uint64_t v240 = v1[84];
      if (v239)
      {
        uint64_t v241 = v1[81];
        uint64_t v242 = v1[78];
        uint64_t v243 = v1[77];
        uint64_t v332 = v1[93];
        uint64_t v344 = v1[83];
        uint64_t v244 = swift_slowAlloc();
        uint64_t v351 = swift_slowAlloc();
        uint64_t v360 = v351;
        *(_DWORD *)uint64_t v244 = 136446466;
        *(void *)(v244 + 4) = sub_24E4CAAA0(0xD000000000000025, 0x800000024E4D3900, &v360);
        *(_WORD *)(v244 + 12) = 2080;
        sub_24E4D18B0();
        sub_24E4D13C4(&qword_2698EDE18, MEMORY[0x263F3CCE8]);
        uint64_t v245 = sub_24E4D1FF0();
        logh = v237;
        v246 = v68;
        unint64_t v248 = v247;
        os_log_type_t type = v238;
        v249 = *(void (**)(uint64_t, uint64_t))(v242 + 8);
        v249(v241, v243);
        *(void *)(v244 + 14) = sub_24E4CAAA0(v245, v248, &v360);
        uint64_t v68 = v246;
        swift_bridgeObjectRelease();
        (*(void (**)(uint64_t, uint64_t))(v240 + 8))(v332, v344);
        _os_log_impl(&dword_24E4A6000, logh, type, "%{public}s Unknown friend.type %s!", (uint8_t *)v244, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x25333CC90](v351, -1, -1);
        MEMORY[0x25333CC90](v244, -1, -1);
      }
      else
      {
        uint64_t v274 = v1[78];
        (*(void (**)(void, void))(v240 + 8))(v1[93], v1[83]);

        v249 = *(void (**)(uint64_t, uint64_t))(v274 + 8);
      }
      v249(v1[82], v1[77]);
      goto LABEL_30;
    }
    uint64_t v164 = v1[94];
    v165 = (void (*)(unint64_t, uint64_t, uint64_t))v55;
    uint64_t v166 = v1[84];
    uint64_t v167 = v1[83];
    uint64_t v168 = v1[76];
    uint64_t v329 = v1[75];
    uint64_t v341 = v1[74];
    os_log_t loge = (os_log_t)v1[72];
    uint64_t v296 = v1[73];
    uint64_t v305 = v1[71];
    v169 = (void *)v1[70];
    v170 = *(void (**)(uint64_t, void, uint64_t))(v166 + 16);
    v170(v164, v1[95], v167);
    unint64_t v171 = (*(unsigned __int8 *)(v166 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v166 + 80);
    uint64_t v172 = swift_allocObject();
    *(void *)(v172 + 16) = v169;
    v165(v172 + v171, v164, v167);
    v1[42] = sub_24E4D0E9C;
    v1[43] = v172;
    v1[38] = MEMORY[0x263EF8330];
    v1[39] = 1107296256;
    v1[40] = sub_24E4B0B08;
    v1[41] = &block_descriptor_378;
    v173 = _Block_copy(v1 + 38);
    id v174 = v169;
    sub_24E4D1C40();
    v1[63] = MEMORY[0x263F8EE78];
    sub_24E4D13C4(&qword_26B1C1328, MEMORY[0x263F8F030]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C1338);
    sub_24E4CF1EC();
    uint64_t v68 = v170;
    sub_24E4D1EE0();
    MEMORY[0x25333C4D0](0, v168, v296, v173);
    _Block_release(v173);
    ((void (*)(uint64_t, uint64_t))loge[1].isa)(v296, v305);
    (*(void (**)(uint64_t, uint64_t))(v329 + 8))(v168, v341);
  }
  swift_release();
LABEL_30:
  v348 = v68;
  v68(v1[92], v1[95], v1[83]);
  os_log_type_t v102 = sub_24E4D1C00();
  os_log_type_t v103 = sub_24E4D1E20();
  BOOL v104 = os_log_type_enabled(v102, v103);
  uint64_t v105 = v1[92];
  uint64_t v106 = v1[83];
  uint64_t v107 = (void (**)(uint64_t, uint64_t))(v1[84] + 8);
  if (v104)
  {
    uint64_t v108 = swift_slowAlloc();
    uint64_t v109 = swift_slowAlloc();
    uint64_t v360 = v109;
    *(_DWORD *)uint64_t v108 = 136446466;
    *(void *)(v108 + 4) = sub_24E4CAAA0(0xD000000000000025, 0x800000024E4D3900, &v360);
    *(_WORD *)(v108 + 12) = 2080;
    sub_24E4D13C4(&qword_2698EDE20, MEMORY[0x263F3CF40]);
    uint64_t v110 = sub_24E4D1FF0();
    *(void *)(v108 + 14) = sub_24E4CAAA0(v110, v111, &v360);
    swift_bridgeObjectRelease();
    uint64_t v112 = *v107;
    (*v107)(v105, v106);
    _os_log_impl(&dword_24E4A6000, v102, v103, "%{public}s Added friend: %s", (uint8_t *)v108, 0x16u);
    swift_arrayDestroy();
    uint64_t v113 = v109;
    uint64_t v1 = v290;
    MEMORY[0x25333CC90](v113, -1, -1);
    MEMORY[0x25333CC90](v108, -1, -1);
  }
  else
  {
    uint64_t v112 = *v107;
    (*v107)(v1[92], v1[83]);
  }

  v136 = *(void (**)(void *, uint64_t))(v1[70] + v1[108]);
  if (v136)
  {
    uint64_t v137 = v1[95];
    uint64_t v138 = v1[94];
    uint64_t v139 = v1[83];
    sub_24E4D0CB4(0, &qword_26B1C12D8);
    v348(v138, v137, v139);
    swift_retain();
    v140 = (void *)FMLFriend.init(_:)(v138);
    v136(v140, 1);

    sub_24E4ACF64((uint64_t)v136);
  }
  uint64_t v141 = v1[95];
LABEL_69:
  v112(v141, v1[83]);
  v175 = v357;
  uint64_t v34 = v355;
LABEL_70:
  v34(*v175, v1[96]);
  v234 = (void *)swift_task_alloc();
  v1[109] = v234;
  void *v234 = v1;
  v234[1] = sub_24E4B8948;
  uint64_t v235 = v1[104];
  uint64_t v236 = v1[103];
  return MEMORY[0x270FA1F68](v236, 0, 0, v235);
}

void sub_24E4BB50C(uint64_t a1)
{
  uint64_t v15 = a1;
  uint64_t v1 = sub_24E4D1950();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698EDDE0);
  MEMORY[0x270FA5388](v5 - 8);
  os_log_type_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24E4D18E0();
  uint64_t v8 = sub_24E4D1910();
  uint64_t v10 = v9;
  uint64_t v11 = *(void (**)(char *, uint64_t))(v2 + 8);
  v11(v4, v1);
  swift_beginAccess();
  sub_24E4CB508(v8, v10, (uint64_t)v7);
  sub_24E4B09A4((uint64_t)v7, &qword_2698EDDE0);
  swift_endAccess();
  swift_bridgeObjectRelease();
  sub_24E4D18E0();
  sub_24E4D1910();
  uint64_t v12 = (void *)sub_24E4D1CB0();
  swift_bridgeObjectRelease();
  id v13 = objc_msgSend(self, sel_handleWithIdentifier_, v12, v15);

  v11(v4, v1);
  swift_beginAccess();
  uint64_t v14 = (void *)sub_24E4CB3B8((unint64_t)v13);
  swift_endAccess();
}

uint64_t sub_24E4BB754()
{
  uint64_t v0 = sub_24E4D1950();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698EDDE0);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24E4D18E0();
  uint64_t v7 = sub_24E4D1910();
  uint64_t v9 = v8;
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  swift_beginAccess();
  sub_24E4CB508(v7, v9, (uint64_t)v6);
  sub_24E4B09A4((uint64_t)v6, &qword_2698EDDE0);
  swift_endAccess();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24E4BB8E4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698EDDE0);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_24E4D1950();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24E4D18E0();
  uint64_t v10 = sub_24E4D1910();
  uint64_t v12 = v11;
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  uint64_t v13 = sub_24E4D1900();
  uint64_t v14 = *(void *)(v13 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v5, a2, v13);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v5, 0, 1, v13);
  swift_beginAccess();
  sub_24E4B6A54((uint64_t)v5, v10, v12);
  return swift_endAccess();
}

uint64_t sub_24E4BBC50(char a1, void *aBlock, void *a3)
{
  v3[2] = a3;
  v3[3] = _Block_copy(aBlock);
  a3;
  uint64_t v6 = (void *)swift_task_alloc();
  v3[4] = v6;
  *uint64_t v6 = v3;
  v6[1] = sub_24E4D152C;
  return ObjCBootstrap.startUpdatingFriends(initialUpdates:)(a1);
}

uint64_t ObjCBootstrap.stopUpdatingFriends()()
{
  *(void *)(v1 + 32) = v0;
  *(void *)(v1 + 40) = swift_getObjectType();
  return MEMORY[0x270FA2498](sub_24E4BBD7C, 0, 0);
}

uint64_t sub_24E4BBD7C()
{
  uint64_t v1 = swift_task_alloc();
  *(void *)(v0 + 48) = v1;
  *(_OWORD *)(v1 + 16) = *(_OWORD *)(v0 + 32);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 56) = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_24E4BBE6C;
  return MEMORY[0x270FA2318]();
}

uint64_t sub_24E4BBE6C()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_24E4BBF84, 0, 0);
}

uint64_t sub_24E4BBF84()
{
  uint64_t v1 = v0[4];
  uint64_t v2 = *(void *)(v1 + OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap__session);
  v0[8] = v2;
  swift_retain();
  if (v2)
  {
    uint64_t v3 = v1 + OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap_friendsUpdateTaskLock;
    os_unfair_lock_lock((os_unfair_lock_t)v3);
    if (*(void *)(v3 + 8))
    {
      sub_24E4D1DE0();
      swift_release();
    }
    *(void *)(v3 + 8) = 0;
    os_unfair_lock_unlock((os_unfair_lock_t)v3);
    uint64_t v4 = (void *)swift_task_alloc();
    v0[9] = v4;
    *uint64_t v4 = v0;
    v4[1] = sub_24E4BC210;
    return MEMORY[0x270F296A0]();
  }
  else
  {
    if (qword_26B1C1318 != -1) {
      swift_once();
    }
    uint64_t v5 = sub_24E4D1C20();
    __swift_project_value_buffer(v5, (uint64_t)qword_26B1C13C0);
    uint64_t v6 = sub_24E4D1C00();
    os_log_type_t v7 = sub_24E4D1E10();
    if (os_log_type_enabled(v6, v7))
    {
      uint64_t v8 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl(&dword_24E4A6000, v6, v7, "Missing FindMyLocate.Session!", v8, 2u);
      MEMORY[0x25333CC90](v8, -1, -1);
    }

    type metadata accessor for FMLSessionError(0);
    v0[3] = 5;
    sub_24E4CA610(MEMORY[0x263F8EE78]);
    sub_24E4D13C4(&qword_2698EDA30, type metadata accessor for FMLSessionError);
    sub_24E4D16A0();
    swift_willThrow();
    uint64_t v9 = (uint64_t (*)(void))v0[1];
    return v9();
  }
}

uint64_t sub_24E4BC210()
{
  *(void *)(*(void *)v1 + 80) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_24E4BC448;
  }
  else {
    uint64_t v2 = sub_24E4BC324;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24E4BC324()
{
  if (qword_26B1C1318 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_24E4D1C20();
  __swift_project_value_buffer(v1, (uint64_t)qword_26B1C13C0);
  uint64_t v2 = sub_24E4D1C00();
  os_log_type_t v3 = sub_24E4D1E20();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_24E4A6000, v2, v3, "Successfully stopUpdatingFriends", v4, 2u);
    MEMORY[0x25333CC90](v4, -1, -1);
  }

  swift_release();
  uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
  return v5();
}

uint64_t sub_24E4BC448()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24E4BC614(const void *a1, void *a2)
{
  v2[2] = a2;
  v2[3] = _Block_copy(a1);
  id v4 = a2;
  uint64_t v5 = (void *)swift_task_alloc();
  v2[4] = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_24E4BC6E8;
  v5[4] = v4;
  v5[5] = swift_getObjectType();
  return MEMORY[0x270FA2498](sub_24E4BBD7C, 0, 0);
}

uint64_t sub_24E4BC6E8()
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
    uint64_t v8 = (void *)sub_24E4D16B0();

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

uint64_t ObjCBootstrap.startMonitoringActiveLocationSharingDevice()()
{
  v1[4] = v0;
  v1[5] = swift_getObjectType();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C1360);
  v1[6] = swift_task_alloc();
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C12C8);
  v1[7] = v2;
  uint64_t v3 = *(void *)(v2 - 8);
  v1[8] = v3;
  v1[9] = *(void *)(v3 + 64);
  v1[10] = swift_task_alloc();
  v1[11] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24E4BC984, 0, 0);
}

uint64_t sub_24E4BC984()
{
  uint64_t v1 = swift_task_alloc();
  *(void *)(v0 + 96) = v1;
  *(_OWORD *)(v1 + 16) = *(_OWORD *)(v0 + 32);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 104) = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_24E4BCA74;
  return MEMORY[0x270FA2318]();
}

uint64_t sub_24E4BCA74()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_24E4BCB8C, 0, 0);
}

uint64_t sub_24E4BCB8C()
{
  uint64_t v1 = *(void *)(v0[4] + OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap__session);
  v0[14] = v1;
  swift_retain();
  if (v1)
  {
    uint64_t v2 = (void *)swift_task_alloc();
    v0[15] = v2;
    *uint64_t v2 = v0;
    v2[1] = sub_24E4BCDE4;
    uint64_t v3 = v0[11];
    return MEMORY[0x270F29750](v3);
  }
  else
  {
    if (qword_26B1C1318 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_24E4D1C20();
    __swift_project_value_buffer(v4, (uint64_t)qword_26B1C13C0);
    uint64_t v5 = sub_24E4D1C00();
    os_log_type_t v6 = sub_24E4D1E10();
    if (os_log_type_enabled(v5, v6))
    {
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_24E4A6000, v5, v6, "Missing FindMyLocate.Session!", v7, 2u);
      MEMORY[0x25333CC90](v7, -1, -1);
    }

    type metadata accessor for FMLSessionError(0);
    v0[3] = 5;
    sub_24E4CA610(MEMORY[0x263F8EE78]);
    sub_24E4D13C4(&qword_2698EDA30, type metadata accessor for FMLSessionError);
    sub_24E4D16A0();
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v8 = (uint64_t (*)(void))v0[1];
    return v8();
  }
}

uint64_t sub_24E4BCDE4()
{
  *(void *)(*(void *)v1 + 128) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_24E4BD0C0;
  }
  else {
    uint64_t v2 = sub_24E4BCEF8;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24E4BCEF8()
{
  uint64_t v1 = v0[10];
  uint64_t v2 = v0[11];
  uint64_t v4 = v0[8];
  uint64_t v3 = v0[9];
  uint64_t v5 = v0[6];
  uint64_t v6 = v0[7];
  uint64_t v7 = (void *)v0[4];
  uint64_t v15 = v0[5];
  uint64_t v8 = sub_24E4D1DB0();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v5, 1, 1, v8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v1, v2, v6);
  unint64_t v9 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  unint64_t v10 = (v3 + v9 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = 0;
  *(void *)(v11 + 24) = 0;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v4 + 32))(v11 + v9, v1, v6);
  *(void *)(v11 + v10) = v7;
  *(void *)(v11 + ((v10 + 15) & 0xFFFFFFFFFFFFFFF8)) = v15;
  id v12 = v7;
  sub_24E4AE180(v5, (uint64_t)&unk_2698EDB98, v11);
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2, v6);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v13 = (uint64_t (*)(void))v0[1];
  return v13();
}

uint64_t sub_24E4BD0C0()
{
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24E4BD148(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[5] = a4;
  v5[6] = a5;
  v5[7] = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C12A8);
  v5[8] = swift_task_alloc();
  v5[9] = swift_task_alloc();
  v5[10] = swift_task_alloc();
  v5[11] = swift_task_alloc();
  uint64_t v6 = sub_24E4D1780();
  v5[12] = v6;
  v5[13] = *(void *)(v6 - 8);
  v5[14] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C1298);
  v5[15] = swift_task_alloc();
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C12B8);
  v5[16] = v7;
  v5[17] = *(void *)(v7 - 8);
  v5[18] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24E4BD2F4, 0, 0);
}

uint64_t sub_24E4BD2F4()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C12C8);
  sub_24E4D1DC0();
  *(void *)(v0 + 152) = OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap_meDeviceUpdateCallback;
  swift_beginAccess();
  *(_DWORD *)(v0 + 168) = *MEMORY[0x263F3CD70];
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 160) = v1;
  void *v1 = v0;
  v1[1] = sub_24E4BD3F4;
  uint64_t v2 = *(void *)(v0 + 120);
  uint64_t v3 = *(void *)(v0 + 128);
  return MEMORY[0x270FA1F68](v2, 0, 0, v3);
}

uint64_t sub_24E4BD3F4()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_24E4BD4F0, 0, 0);
}

uint64_t sub_24E4BD4F0()
{
  uint64_t v56 = v0;
  uint64_t v1 = *(void *)(v0 + 120);
  uint64_t v2 = *(void *)(v0 + 96);
  uint64_t v3 = *(void *)(v0 + 104);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2) != 1)
  {
    int v10 = *(_DWORD *)(v0 + 168);
    uint64_t v11 = *(void *)(v0 + 112);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 32))(v11, v1, v2);
    if ((*(unsigned int (**)(uint64_t, uint64_t))(v3 + 88))(v11, v2) == v10)
    {
      uint64_t v12 = *(void *)(v0 + 112);
      uint64_t v13 = *(void *)(v0 + 88);
      (*(void (**)(uint64_t, void))(*(void *)(v0 + 104) + 96))(v12, *(void *)(v0 + 96));
      sub_24E4D0CF0(v12, v13, &qword_26B1C12A8);
      if (qword_26B1C1318 != -1) {
        swift_once();
      }
      uint64_t v14 = *(void *)(v0 + 80);
      uint64_t v15 = *(void *)(v0 + 88);
      uint64_t v16 = sub_24E4D1C20();
      __swift_project_value_buffer(v16, (uint64_t)qword_26B1C13C0);
      sub_24E4D14B8(v15, v14, &qword_26B1C12A8);
      uint64_t v17 = sub_24E4D1C00();
      os_log_type_t v18 = sub_24E4D1E20();
      BOOL v19 = os_log_type_enabled(v17, v18);
      uint64_t v20 = *(void *)(v0 + 80);
      if (v19)
      {
        uint64_t v21 = *(void *)(v0 + 72);
        uint64_t v22 = swift_slowAlloc();
        uint64_t v23 = swift_slowAlloc();
        uint64_t v55 = v23;
        *(_DWORD *)uint64_t v22 = 136315138;
        sub_24E4D14B8(v20, v21, &qword_26B1C12A8);
        uint64_t v24 = sub_24E4D1CD0();
        *(void *)(v22 + 4) = sub_24E4CAAA0(v24, v25, &v55);
        swift_bridgeObjectRelease();
        sub_24E4B09A4(v20, &qword_26B1C12A8);
        _os_log_impl(&dword_24E4A6000, v17, v18, "meDeviceStreams receive meDevice updated: %s", (uint8_t *)v22, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x25333CC90](v23, -1, -1);
        MEMORY[0x25333CC90](v22, -1, -1);
      }
      else
      {
        sub_24E4B09A4(*(void *)(v0 + 80), &qword_26B1C12A8);
      }

      unint64_t v33 = *(void (**)(id))(*(void *)(v0 + 48) + *(void *)(v0 + 152));
      if (v33)
      {
        uint64_t v34 = *(void *)(v0 + 88);
        uint64_t v35 = sub_24E4D1870();
        uint64_t v36 = *(void *)(v35 - 8);
        uint64_t v37 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v36 + 48);
        if (v37(v34, 1, v35) == 1)
        {
          swift_retain();
          id v38 = 0;
        }
        else
        {
          uint64_t v54 = v36;
          uint64_t v39 = *(void *)(v0 + 64);
          sub_24E4D14B8(v34, v39, &qword_26B1C12A8);
          uint64_t v40 = v37(v39, 1, v35);
          if (v40 == 1)
          {
            __break(1u);
            return MEMORY[0x270FA1F68](v40, v41, v42, v43);
          }
          uint64_t v44 = *(void *)(v0 + 64);
          id v53 = objc_allocWithZone((Class)FMLDevice);
          swift_retain();
          sub_24E4D1830();
          uint64_t v52 = (void *)sub_24E4D1CB0();
          swift_bridgeObjectRelease();
          sub_24E4D1820();
          uint64_t v45 = (void *)sub_24E4D1CB0();
          swift_bridgeObjectRelease();
          sub_24E4D1800();
          int v46 = (void *)sub_24E4D1CB0();
          swift_bridgeObjectRelease();
          char v47 = sub_24E4D1860();
          char v48 = sub_24E4D1810();
          char v49 = sub_24E4D1840();
          LOBYTE(v51) = sub_24E4D1850() & 1;
          id v38 = objc_msgSend(v53, sel_initWithIdentifier_deviceName_idsDeviceId_isActive_isThisDevice_isCompanion_isAutoMeCapable_, v52, v45, v46, v47 & 1, v48 & 1, v49 & 1, v51);

          (*(void (**)(uint64_t, uint64_t))(v54 + 8))(v44, v35);
        }
        v33(v38);

        sub_24E4ACF64((uint64_t)v33);
      }
      sub_24E4B09A4(*(void *)(v0 + 88), &qword_26B1C12A8);
    }
    else
    {
      if (qword_26B1C1318 != -1) {
        swift_once();
      }
      uint64_t v26 = sub_24E4D1C20();
      __swift_project_value_buffer(v26, (uint64_t)qword_26B1C13C0);
      uint64_t v27 = sub_24E4D1C00();
      os_log_type_t v28 = sub_24E4D1E10();
      if (os_log_type_enabled(v27, v28))
      {
        uint64_t v29 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v29 = 0;
        _os_log_impl(&dword_24E4A6000, v27, v28, "Unknown me device update type", v29, 2u);
        MEMORY[0x25333CC90](v29, -1, -1);
      }
      uint64_t v31 = *(void *)(v0 + 104);
      uint64_t v30 = *(void *)(v0 + 112);
      uint64_t v32 = *(void *)(v0 + 96);

      (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v30, v32);
    }
    uint64_t v50 = (void *)swift_task_alloc();
    *(void *)(v0 + 160) = v50;
    *uint64_t v50 = v0;
    v50[1] = sub_24E4BD3F4;
    uint64_t v40 = *(void *)(v0 + 120);
    uint64_t v43 = *(void *)(v0 + 128);
    uint64_t v41 = 0;
    uint64_t v42 = 0;
    return MEMORY[0x270FA1F68](v40, v41, v42, v43);
  }
  (*(void (**)(void, void))(*(void *)(v0 + 136) + 8))(*(void *)(v0 + 144), *(void *)(v0 + 128));
  if (qword_26B1C1318 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_24E4D1C20();
  __swift_project_value_buffer(v4, (uint64_t)qword_26B1C13C0);
  uint64_t v5 = sub_24E4D1C00();
  os_log_type_t v6 = sub_24E4D1E20();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_24E4A6000, v5, v6, "Successfully startMonitoringActiveLocationSharingDevice", v7, 2u);
    MEMORY[0x25333CC90](v7, -1, -1);
  }

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v8 = *(uint64_t (**)(void))(v0 + 8);
  return v8();
}

uint64_t sub_24E4BDD58(const void *a1, void *a2)
{
  v2[2] = a2;
  v2[3] = _Block_copy(a1);
  a2;
  uint64_t v4 = (void *)swift_task_alloc();
  v2[4] = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_24E4D152C;
  return ObjCBootstrap.startMonitoringActiveLocationSharingDevice()();
}

uint64_t ObjCBootstrap.setActiveLocationSharingDevice(_:)(uint64_t a1, uint64_t a2)
{
  v3[6] = a2;
  v3[7] = v2;
  v3[5] = a1;
  v3[8] = swift_getObjectType();
  return MEMORY[0x270FA2498](sub_24E4BDE74, 0, 0);
}

uint64_t sub_24E4BDE74()
{
  uint64_t v1 = swift_task_alloc();
  *(void *)(v0 + 72) = v1;
  *(_OWORD *)(v1 + 16) = *(_OWORD *)(v0 + 56);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 80) = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_24E4BDF64;
  return MEMORY[0x270FA2318]();
}

uint64_t sub_24E4BDF64()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_24E4BE07C, 0, 0);
}

uint64_t sub_24E4BE07C()
{
  uint64_t v1 = *(void *)(v0[7] + OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap__session);
  v0[11] = v1;
  swift_retain();
  if (v1)
  {
    uint64_t v2 = (void *)swift_task_alloc();
    v0[12] = v2;
    *uint64_t v2 = v0;
    v2[1] = sub_24E4BE2B8;
    uint64_t v4 = v0[5];
    uint64_t v3 = v0[6];
    return MEMORY[0x270F29720](v4, v3);
  }
  else
  {
    if (qword_26B1C1318 != -1) {
      swift_once();
    }
    uint64_t v5 = sub_24E4D1C20();
    __swift_project_value_buffer(v5, (uint64_t)qword_26B1C13C0);
    uint64_t v6 = sub_24E4D1C00();
    os_log_type_t v7 = sub_24E4D1E10();
    if (os_log_type_enabled(v6, v7))
    {
      uint64_t v8 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl(&dword_24E4A6000, v6, v7, "Missing FindMyLocate.Session!", v8, 2u);
      MEMORY[0x25333CC90](v8, -1, -1);
    }

    type metadata accessor for FMLSessionError(0);
    v0[3] = 5;
    sub_24E4CA610(MEMORY[0x263F8EE78]);
    sub_24E4D13C4(&qword_2698EDA30, type metadata accessor for FMLSessionError);
    sub_24E4D16A0();
    swift_willThrow();
    uint64_t v9 = (uint64_t (*)(void))v0[1];
    return v9();
  }
}

uint64_t sub_24E4BE2B8()
{
  *(void *)(*(void *)v1 + 104) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_24E4BE4F0;
  }
  else {
    uint64_t v2 = sub_24E4BE3CC;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24E4BE3CC()
{
  if (qword_26B1C1318 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_24E4D1C20();
  __swift_project_value_buffer(v1, (uint64_t)qword_26B1C13C0);
  uint64_t v2 = sub_24E4D1C00();
  os_log_type_t v3 = sub_24E4D1E20();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_24E4A6000, v2, v3, "Successfully set active location sharing device", v4, 2u);
    MEMORY[0x25333CC90](v4, -1, -1);
  }

  swift_release();
  uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
  return v5();
}

uint64_t sub_24E4BE4F0()
{
  if (qword_26B1C1318 != -1) {
    swift_once();
  }
  uint64_t v1 = (void *)v0[13];
  uint64_t v2 = sub_24E4D1C20();
  __swift_project_value_buffer(v2, (uint64_t)qword_26B1C13C0);
  id v3 = v1;
  uint64_t v4 = sub_24E4D1C00();
  os_log_type_t v5 = sub_24E4D1E10();
  BOOL v6 = os_log_type_enabled(v4, v5);
  uint64_t v7 = (void *)v0[13];
  if (v6)
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v9 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 138543362;
    uint64_t v10 = sub_24E4D16B0();
    v0[4] = v10;
    sub_24E4D1EB0();
    *uint64_t v9 = v10;

    _os_log_impl(&dword_24E4A6000, v4, v5, "Error setting active location sharing device: %{public}@", v8, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C1300);
    swift_arrayDestroy();
    MEMORY[0x25333CC90](v9, -1, -1);
    MEMORY[0x25333CC90](v8, -1, -1);
  }
  else
  {
  }
  swift_willThrow();
  swift_release();
  uint64_t v11 = (uint64_t (*)(void))v0[1];
  return v11();
}

uint64_t sub_24E4BE854(int a1, void *aBlock, void *a3)
{
  v3[2] = a3;
  v3[3] = _Block_copy(aBlock);
  uint64_t v5 = sub_24E4D1CC0();
  uint64_t v7 = v6;
  v3[4] = v6;
  id v8 = a3;
  uint64_t v9 = (void *)swift_task_alloc();
  v3[5] = v9;
  *uint64_t v9 = v3;
  v9[1] = sub_24E4D163C;
  v9[6] = v7;
  v9[7] = v8;
  v9[5] = v5;
  v9[8] = swift_getObjectType();
  return MEMORY[0x270FA2498](sub_24E4BDE74, 0, 0);
}

uint64_t ObjCBootstrap.getActiveLocationSharingDevice()()
{
  v1[6] = v0;
  v1[7] = swift_getObjectType();
  uint64_t v2 = sub_24E4D1870();
  v1[8] = v2;
  v1[9] = *(void *)(v2 - 8);
  v1[10] = swift_task_alloc();
  v1[11] = swift_task_alloc();
  v1[12] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24E4BEA38, 0, 0);
}

uint64_t sub_24E4BEA38()
{
  uint64_t v1 = swift_task_alloc();
  *(void *)(v0 + 104) = v1;
  *(_OWORD *)(v1 + 16) = *(_OWORD *)(v0 + 48);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 112) = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_24E4BEB28;
  return MEMORY[0x270FA2318]();
}

uint64_t sub_24E4BEB28()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_24E4BEC40, 0, 0);
}

uint64_t sub_24E4BEC40()
{
  uint64_t v1 = *(void *)(v0[6] + OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap__session);
  v0[15] = v1;
  swift_retain();
  if (v1)
  {
    uint64_t v2 = (void *)swift_task_alloc();
    v0[16] = v2;
    *uint64_t v2 = v0;
    v2[1] = sub_24E4BEE9C;
    uint64_t v3 = v0[12];
    return MEMORY[0x270F29700](v3, 1);
  }
  else
  {
    if (qword_26B1C1318 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_24E4D1C20();
    __swift_project_value_buffer(v4, (uint64_t)qword_26B1C13C0);
    uint64_t v5 = sub_24E4D1C00();
    os_log_type_t v6 = sub_24E4D1E10();
    if (os_log_type_enabled(v5, v6))
    {
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_24E4A6000, v5, v6, "Missing FindMyLocate.Session!", v7, 2u);
      MEMORY[0x25333CC90](v7, -1, -1);
    }

    type metadata accessor for FMLSessionError(0);
    v0[3] = 5;
    sub_24E4CA610(MEMORY[0x263F8EE78]);
    sub_24E4D13C4(&qword_2698EDA30, type metadata accessor for FMLSessionError);
    sub_24E4D16A0();
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    id v8 = (uint64_t (*)(void))v0[1];
    return v8();
  }
}

uint64_t sub_24E4BEE9C()
{
  *(void *)(*(void *)v1 + 136) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_24E4BF2A0;
  }
  else {
    uint64_t v2 = sub_24E4BEFB0;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24E4BEFB0()
{
  unint64_t v25 = v0;
  if (qword_26B1C1318 != -1) {
    swift_once();
  }
  uint64_t v1 = v0[11];
  uint64_t v2 = v0[12];
  uint64_t v3 = v0[8];
  uint64_t v4 = v0[9];
  uint64_t v5 = sub_24E4D1C20();
  __swift_project_value_buffer(v5, (uint64_t)qword_26B1C13C0);
  uint64_t v23 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
  v23(v1, v2, v3);
  os_log_type_t v6 = sub_24E4D1C00();
  os_log_type_t v7 = sub_24E4D1E20();
  BOOL v8 = os_log_type_enabled(v6, v7);
  uint64_t v9 = v0[11];
  uint64_t v10 = v0[8];
  uint64_t v11 = v0[9];
  if (v8)
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    uint64_t v24 = v13;
    *(_DWORD *)uint64_t v12 = 136315138;
    sub_24E4D13C4(&qword_2698EDBB8, MEMORY[0x263F3CF30]);
    uint64_t v14 = sub_24E4D1FF0();
    v0[5] = sub_24E4CAAA0(v14, v15, &v24);
    sub_24E4D1EB0();
    swift_bridgeObjectRelease();
    uint64_t v16 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
    v16(v9, v10);
    _os_log_impl(&dword_24E4A6000, v6, v7, "Successfully get active location sharing device: %s", v12, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25333CC90](v13, -1, -1);
    MEMORY[0x25333CC90](v12, -1, -1);
  }
  else
  {
    uint64_t v16 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
    v16(v0[11], v0[8]);
  }

  uint64_t v17 = v0[12];
  uint64_t v18 = v0[10];
  uint64_t v19 = v0[8];
  sub_24E4D0CB4(0, &qword_2698EDBB0);
  v23(v18, v17, v19);
  id v20 = sub_24E4ACA9C(v18);
  swift_release();
  v16(v17, v19);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v21 = (uint64_t (*)(id))v0[1];
  return v21(v20);
}

uint64_t sub_24E4BF2A0()
{
  if (qword_26B1C1318 != -1) {
    swift_once();
  }
  uint64_t v1 = (void *)v0[17];
  uint64_t v2 = sub_24E4D1C20();
  __swift_project_value_buffer(v2, (uint64_t)qword_26B1C13C0);
  id v3 = v1;
  uint64_t v4 = sub_24E4D1C00();
  os_log_type_t v5 = sub_24E4D1E10();
  BOOL v6 = os_log_type_enabled(v4, v5);
  os_log_type_t v7 = (void *)v0[17];
  if (v6)
  {
    BOOL v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v9 = (void *)swift_slowAlloc();
    *(_DWORD *)BOOL v8 = 138543362;
    uint64_t v10 = sub_24E4D16B0();
    v0[4] = v10;
    sub_24E4D1EB0();
    *uint64_t v9 = v10;

    _os_log_impl(&dword_24E4A6000, v4, v5, "Error getting active location sharing device: %{public}@", v8, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C1300);
    swift_arrayDestroy();
    MEMORY[0x25333CC90](v9, -1, -1);
    MEMORY[0x25333CC90](v8, -1, -1);
  }
  else
  {
  }
  swift_willThrow();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v11 = (uint64_t (*)(void))v0[1];
  return v11();
}

uint64_t sub_24E4BF60C(const void *a1, void *a2)
{
  v2[2] = a2;
  v2[3] = _Block_copy(a1);
  a2;
  uint64_t v4 = (void *)swift_task_alloc();
  v2[4] = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_24E4BF6B4;
  return ObjCBootstrap.getActiveLocationSharingDevice()();
}

uint64_t sub_24E4BF6B4(void *a1)
{
  id v3 = v1;
  uint64_t v5 = *v2;
  uint64_t v6 = *(void **)(*v2 + 16);
  uint64_t v7 = *v2;
  swift_task_dealloc();

  BOOL v8 = *(void (***)(void, void, void))(v5 + 24);
  if (v3)
  {
    uint64_t v9 = (void *)sub_24E4D16B0();

    ((void (**)(void, void, void *))v8)[2](v8, 0, v9);
    _Block_release(v8);
  }
  else
  {
    ((void (**)(void, void *, void))v8)[2](v8, a1, 0);
    _Block_release(v8);
  }
  uint64_t v10 = *(uint64_t (**)(void))(v7 + 8);
  return v10();
}

uint64_t ObjCBootstrap.getFriends(with:)(uint64_t a1)
{
  v2[28] = a1;
  v2[29] = v1;
  v2[30] = swift_getObjectType();
  uint64_t v3 = sub_24E4D1900();
  v2[31] = v3;
  v2[32] = *(void *)(v3 - 8);
  v2[33] = swift_task_alloc();
  v2[34] = swift_task_alloc();
  v2[35] = swift_task_alloc();
  v2[36] = swift_task_alloc();
  uint64_t v4 = sub_24E4D1C30();
  v2[37] = v4;
  v2[38] = *(void *)(v4 - 8);
  v2[39] = swift_task_alloc();
  uint64_t v5 = sub_24E4D1C50();
  v2[40] = v5;
  v2[41] = *(void *)(v5 - 8);
  v2[42] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24E4BFA00, 0, 0);
}

uint64_t sub_24E4BFA00()
{
  uint64_t v1 = swift_task_alloc();
  *(void *)(v0 + 344) = v1;
  *(_OWORD *)(v1 + 16) = *(_OWORD *)(v0 + 232);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 352) = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_24E4BFAF0;
  return MEMORY[0x270FA2318]();
}

uint64_t sub_24E4BFAF0()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_24E4BFC08, 0, 0);
}

uint64_t sub_24E4BFC08()
{
  uint64_t v1 = *(void *)(v0[29] + OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap__session);
  v0[45] = v1;
  swift_retain();
  if (v1)
  {
    switch(v0[28])
    {
      case 0:
        uint64_t v16 = (void *)swift_task_alloc();
        v0[46] = v16;
        *uint64_t v16 = v0;
        v16[1] = sub_24E4C0188;
        uint64_t result = MEMORY[0x270F29628]();
        break;
      case 1:
        uint64_t v17 = (void *)swift_task_alloc();
        v0[49] = v17;
        *uint64_t v17 = v0;
        v17[1] = sub_24E4C07C0;
        uint64_t result = MEMORY[0x270F29718]();
        break;
      case 2:
      case 3:
        if (qword_26B1C1318 != -1) {
          swift_once();
        }
        uint64_t v2 = sub_24E4D1C20();
        __swift_project_value_buffer(v2, (uint64_t)qword_26B1C13C0);
        uint64_t v3 = sub_24E4D1C00();
        os_log_type_t v4 = sub_24E4D1E20();
        if (!os_log_type_enabled(v3, v4)) {
          goto LABEL_19;
        }
        uint64_t v5 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v5 = 0;
        uint64_t v6 = "getFriends with unsupported handle Type, return emtpy list";
        goto LABEL_18;
      case 4:
        uint64_t v18 = (void *)swift_task_alloc();
        v0[52] = v18;
        void *v18 = v0;
        v18[1] = sub_24E4C0DF8;
        uint64_t result = MEMORY[0x270F296E8]();
        break;
      default:
        if (qword_26B1C1318 != -1) {
          swift_once();
        }
        uint64_t v13 = sub_24E4D1C20();
        __swift_project_value_buffer(v13, (uint64_t)qword_26B1C13C0);
        uint64_t v3 = sub_24E4D1C00();
        os_log_type_t v4 = sub_24E4D1E10();
        if (os_log_type_enabled(v3, v4))
        {
          uint64_t v5 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v5 = 0;
          uint64_t v6 = "getFriends with unknown handle Type, return empty list";
LABEL_18:
          _os_log_impl(&dword_24E4A6000, v3, v4, v6, v5, 2u);
          MEMORY[0x25333CC90](v5, -1, -1);
        }
LABEL_19:
        swift_release();

        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        uint64_t v14 = (uint64_t (*)(uint64_t))v0[1];
        uint64_t v15 = MEMORY[0x263F8EE78];
        uint64_t result = v14(v15);
        break;
    }
  }
  else
  {
    if (qword_26B1C1318 != -1) {
      swift_once();
    }
    uint64_t v7 = sub_24E4D1C20();
    __swift_project_value_buffer(v7, (uint64_t)qword_26B1C13C0);
    BOOL v8 = sub_24E4D1C00();
    os_log_type_t v9 = sub_24E4D1E10();
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v10 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl(&dword_24E4A6000, v8, v9, "Missing FindMyLocate.Session!", v10, 2u);
      MEMORY[0x25333CC90](v10, -1, -1);
    }

    type metadata accessor for FMLSessionError(0);
    v0[25] = 5;
    sub_24E4CA610(MEMORY[0x263F8EE78]);
    sub_24E4D13C4(&qword_2698EDA30, type metadata accessor for FMLSessionError);
    sub_24E4D16A0();
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v11 = (uint64_t (*)(void))v0[1];
    return v11();
  }
  return result;
}

uint64_t sub_24E4C0188(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 376) = a1;
  *(void *)(v3 + 384) = v1;
  swift_task_dealloc();
  if (v1) {
    os_log_type_t v4 = sub_24E4C1434;
  }
  else {
    os_log_type_t v4 = sub_24E4C029C;
  }
  return MEMORY[0x270FA2498](v4, 0, 0);
}

uint64_t sub_24E4C029C()
{
  id v38 = v0;
  uint64_t v1 = v0[47];
  uint64_t v3 = v0[41];
  uint64_t v2 = v0[42];
  uint64_t v4 = v0[39];
  uint64_t v36 = v0[40];
  uint64_t v5 = v0[37];
  uint64_t v6 = v0[38];
  uint64_t v7 = (void *)v0[29];
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v7;
  *(void *)(v8 + 24) = v1;
  v0[12] = sub_24E4CF274;
  v0[13] = v8;
  v0[8] = MEMORY[0x263EF8330];
  v0[9] = 1107296256;
  v0[10] = sub_24E4B0B08;
  v0[11] = &block_descriptor_57;
  os_log_type_t v9 = _Block_copy(v0 + 8);
  id v10 = v7;
  swift_bridgeObjectRetain();
  sub_24E4D1C40();
  v0[26] = MEMORY[0x263F8EE78];
  sub_24E4D13C4(&qword_26B1C1328, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C1338);
  sub_24E4CF1EC();
  sub_24E4D1EE0();
  MEMORY[0x25333C4D0](0, v2, v4, v9);
  _Block_release(v9);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v36);
  swift_release();
  if (qword_26B1C1318 != -1) {
    swift_once();
  }
  uint64_t v11 = sub_24E4D1C20();
  __swift_project_value_buffer(v11, (uint64_t)qword_26B1C13C0);
  swift_bridgeObjectRetain_n();
  uint64_t v12 = sub_24E4D1C00();
  os_log_type_t v13 = sub_24E4D1E20();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = v0[31];
    uint64_t v15 = (uint8_t *)swift_slowAlloc();
    uint64_t v16 = swift_slowAlloc();
    uint64_t v37 = v16;
    *(_DWORD *)uint64_t v15 = 136315138;
    uint64_t v17 = swift_bridgeObjectRetain();
    uint64_t v18 = MEMORY[0x25333C3B0](v17, v14);
    unint64_t v20 = v19;
    swift_bridgeObjectRelease();
    v0[27] = sub_24E4CAAA0(v18, v20, &v37);
    sub_24E4D1EB0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_24E4A6000, v12, v13, "Followers: %s)", v15, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25333CC90](v16, -1, -1);
    MEMORY[0x25333CC90](v15, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  uint64_t v21 = MEMORY[0x263F8EE78];
  uint64_t v22 = v0[47];
  uint64_t v37 = MEMORY[0x263F8EE78];
  uint64_t v23 = *(void *)(v22 + 16);
  if (v23)
  {
    uint64_t v24 = v0[32];
    sub_24E4D0CB4(0, &qword_26B1C12D8);
    uint64_t v27 = *(void (**)(uint64_t, uint64_t, uint64_t))(v24 + 16);
    uint64_t v25 = v24 + 16;
    uint64_t v26 = v27;
    uint64_t v28 = v22 + ((*(unsigned __int8 *)(v25 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v25 + 64));
    uint64_t v35 = *(void *)(v25 + 56);
    swift_bridgeObjectRetain();
    do
    {
      uint64_t v29 = v0[35];
      uint64_t v30 = v0[36];
      uint64_t v31 = v0[31];
      v26(v30, v28, v31);
      v26(v29, v30, v31);
      FMLFriend.init(_:)(v29);
      uint64_t v32 = (*(uint64_t (**)(uint64_t, uint64_t))(v25 - 8))(v30, v31);
      MEMORY[0x25333C380](v32);
      if (*(void *)((v37 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v37 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_24E4D1D60();
      }
      sub_24E4D1D70();
      sub_24E4D1D50();
      v28 += v35;
      --v23;
    }
    while (v23);
    swift_bridgeObjectRelease();
    uint64_t v21 = v37;
  }
  swift_bridgeObjectRelease();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v33 = (uint64_t (*)(uint64_t))v0[1];
  return v33(v21);
}

uint64_t sub_24E4C07C0(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 400) = a1;
  *(void *)(v3 + 408) = v1;
  swift_task_dealloc();
  if (v1) {
    uint64_t v4 = sub_24E4C14E4;
  }
  else {
    uint64_t v4 = sub_24E4C08D4;
  }
  return MEMORY[0x270FA2498](v4, 0, 0);
}

uint64_t sub_24E4C08D4()
{
  id v38 = v0;
  uint64_t v1 = v0[50];
  uint64_t v3 = v0[41];
  uint64_t v2 = v0[42];
  uint64_t v4 = v0[39];
  uint64_t v36 = v0[40];
  uint64_t v5 = v0[37];
  uint64_t v6 = v0[38];
  uint64_t v7 = (void *)v0[29];
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v7;
  *(void *)(v8 + 24) = v1;
  v0[6] = sub_24E4CF24C;
  v0[7] = v8;
  v0[2] = MEMORY[0x263EF8330];
  v0[3] = 1107296256;
  v0[4] = sub_24E4B0B08;
  v0[5] = &block_descriptor_50;
  os_log_type_t v9 = _Block_copy(v0 + 2);
  id v10 = v7;
  swift_bridgeObjectRetain();
  sub_24E4D1C40();
  v0[23] = MEMORY[0x263F8EE78];
  sub_24E4D13C4(&qword_26B1C1328, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C1338);
  sub_24E4CF1EC();
  sub_24E4D1EE0();
  MEMORY[0x25333C4D0](0, v2, v4, v9);
  _Block_release(v9);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v36);
  swift_release();
  if (qword_26B1C1318 != -1) {
    swift_once();
  }
  uint64_t v11 = sub_24E4D1C20();
  __swift_project_value_buffer(v11, (uint64_t)qword_26B1C13C0);
  swift_bridgeObjectRetain_n();
  uint64_t v12 = sub_24E4D1C00();
  os_log_type_t v13 = sub_24E4D1E20();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = v0[31];
    uint64_t v15 = (uint8_t *)swift_slowAlloc();
    uint64_t v16 = swift_slowAlloc();
    uint64_t v37 = v16;
    *(_DWORD *)uint64_t v15 = 136315138;
    uint64_t v17 = swift_bridgeObjectRetain();
    uint64_t v18 = MEMORY[0x25333C3B0](v17, v14);
    unint64_t v20 = v19;
    swift_bridgeObjectRelease();
    v0[24] = sub_24E4CAAA0(v18, v20, &v37);
    sub_24E4D1EB0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_24E4A6000, v12, v13, "Followings: %s)", v15, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25333CC90](v16, -1, -1);
    MEMORY[0x25333CC90](v15, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  uint64_t v21 = MEMORY[0x263F8EE78];
  uint64_t v22 = v0[50];
  uint64_t v37 = MEMORY[0x263F8EE78];
  uint64_t v23 = *(void *)(v22 + 16);
  if (v23)
  {
    uint64_t v24 = v0[32];
    sub_24E4D0CB4(0, &qword_26B1C12D8);
    uint64_t v27 = *(void (**)(uint64_t, uint64_t, uint64_t))(v24 + 16);
    uint64_t v25 = v24 + 16;
    uint64_t v26 = v27;
    uint64_t v28 = v22 + ((*(unsigned __int8 *)(v25 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v25 + 64));
    uint64_t v35 = *(void *)(v25 + 56);
    swift_bridgeObjectRetain();
    do
    {
      uint64_t v30 = v0[34];
      uint64_t v29 = v0[35];
      uint64_t v31 = v0[31];
      v26(v30, v28, v31);
      v26(v29, v30, v31);
      FMLFriend.init(_:)(v29);
      uint64_t v32 = (*(uint64_t (**)(uint64_t, uint64_t))(v25 - 8))(v30, v31);
      MEMORY[0x25333C380](v32);
      if (*(void *)((v37 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v37 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_24E4D1D60();
      }
      sub_24E4D1D70();
      sub_24E4D1D50();
      v28 += v35;
      --v23;
    }
    while (v23);
    swift_bridgeObjectRelease();
    uint64_t v21 = v37;
  }
  swift_bridgeObjectRelease();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v33 = (uint64_t (*)(uint64_t))v0[1];
  return v33(v21);
}

uint64_t sub_24E4C0DF8(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 424) = a1;
  *(void *)(v3 + 432) = v1;
  swift_task_dealloc();
  if (v1) {
    uint64_t v4 = sub_24E4C1594;
  }
  else {
    uint64_t v4 = sub_24E4C0F0C;
  }
  return MEMORY[0x270FA2498](v4, 0, 0);
}

uint64_t sub_24E4C0F0C()
{
  id v38 = v0;
  uint64_t v1 = v0[53];
  uint64_t v3 = v0[41];
  uint64_t v2 = v0[42];
  uint64_t v4 = v0[39];
  uint64_t v36 = v0[40];
  uint64_t v5 = v0[37];
  uint64_t v6 = v0[38];
  uint64_t v7 = (void *)v0[29];
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v7;
  *(void *)(v8 + 24) = v1;
  v0[18] = sub_24E4CF1B0;
  v0[19] = v8;
  v0[14] = MEMORY[0x263EF8330];
  v0[15] = 1107296256;
  v0[16] = sub_24E4B0B08;
  v0[17] = &block_descriptor_0;
  os_log_type_t v9 = _Block_copy(v0 + 14);
  id v10 = v7;
  swift_bridgeObjectRetain();
  sub_24E4D1C40();
  v0[20] = MEMORY[0x263F8EE78];
  sub_24E4D13C4(&qword_26B1C1328, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C1338);
  sub_24E4CF1EC();
  sub_24E4D1EE0();
  MEMORY[0x25333C4D0](0, v2, v4, v9);
  _Block_release(v9);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v36);
  swift_release();
  if (qword_26B1C1318 != -1) {
    swift_once();
  }
  uint64_t v11 = sub_24E4D1C20();
  __swift_project_value_buffer(v11, (uint64_t)qword_26B1C13C0);
  swift_bridgeObjectRetain_n();
  uint64_t v12 = sub_24E4D1C00();
  os_log_type_t v13 = sub_24E4D1E20();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = v0[31];
    uint64_t v15 = (uint8_t *)swift_slowAlloc();
    uint64_t v16 = swift_slowAlloc();
    uint64_t v37 = v16;
    *(_DWORD *)uint64_t v15 = 136315138;
    uint64_t v17 = swift_bridgeObjectRetain();
    uint64_t v18 = MEMORY[0x25333C3B0](v17, v14);
    unint64_t v20 = v19;
    swift_bridgeObjectRelease();
    v0[21] = sub_24E4CAAA0(v18, v20, &v37);
    sub_24E4D1EB0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_24E4A6000, v12, v13, "Pending Offers: %s)", v15, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25333CC90](v16, -1, -1);
    MEMORY[0x25333CC90](v15, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  uint64_t v21 = MEMORY[0x263F8EE78];
  uint64_t v22 = v0[53];
  uint64_t v37 = MEMORY[0x263F8EE78];
  uint64_t v23 = *(void *)(v22 + 16);
  if (v23)
  {
    uint64_t v24 = v0[32];
    sub_24E4D0CB4(0, &qword_26B1C12D8);
    uint64_t v27 = *(void (**)(uint64_t, uint64_t, uint64_t))(v24 + 16);
    uint64_t v25 = v24 + 16;
    uint64_t v26 = v27;
    uint64_t v28 = v22 + ((*(unsigned __int8 *)(v25 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v25 + 64));
    uint64_t v35 = *(void *)(v25 + 56);
    swift_bridgeObjectRetain();
    do
    {
      uint64_t v29 = v0[35];
      uint64_t v30 = v0[33];
      uint64_t v31 = v0[31];
      v26(v30, v28, v31);
      v26(v29, v30, v31);
      FMLFriend.init(_:)(v29);
      uint64_t v32 = (*(uint64_t (**)(uint64_t, uint64_t))(v25 - 8))(v30, v31);
      MEMORY[0x25333C380](v32);
      if (*(void *)((v37 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v37 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_24E4D1D60();
      }
      sub_24E4D1D70();
      sub_24E4D1D50();
      v28 += v35;
      --v23;
    }
    while (v23);
    swift_bridgeObjectRelease();
    uint64_t v21 = v37;
  }
  swift_bridgeObjectRelease();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v33 = (uint64_t (*)(uint64_t))v0[1];
  return v33(v21);
}

uint64_t sub_24E4C1434()
{
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24E4C14E4()
{
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24E4C1594()
{
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

unint64_t sub_24E4C1644(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C1308);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (void *)((char *)v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (!*(void *)(a1 + 16))
  {
    uint64_t v7 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698EDE30);
  uint64_t v6 = sub_24E4D1FD0();
  uint64_t v7 = (void *)v6;
  uint64_t v8 = *(void *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  os_log_type_t v9 = (char *)v5 + *(int *)(v2 + 48);
  uint64_t v10 = v6 + 64;
  unint64_t v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v25[1] = a1;
  uint64_t v12 = a1 + v11;
  uint64_t v13 = *(void *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_24E4D14B8(v12, (uint64_t)v5, &qword_26B1C1308);
    uint64_t v14 = *v5;
    uint64_t v15 = v5[1];
    unint64_t result = sub_24E4CBA10(*v5, v15, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_24E4CCA94);
    if (v17) {
      break;
    }
    unint64_t v18 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    unint64_t v19 = (uint64_t *)(v7[6] + 16 * result);
    *unint64_t v19 = v14;
    v19[1] = v15;
    uint64_t v20 = v7[7];
    uint64_t v21 = sub_24E4D1900();
    unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v21 - 8) + 32))(v20 + *(void *)(*(void *)(v21 - 8) + 72) * v18, v9, v21);
    uint64_t v22 = v7[2];
    BOOL v23 = __OFADD__(v22, 1);
    uint64_t v24 = v22 + 1;
    if (v23) {
      goto LABEL_11;
    }
    v7[2] = v24;
    v12 += v13;
    if (!--v8)
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

uint64_t sub_24E4C1858(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v58 = sub_24E4D1950();
  uint64_t v6 = *(void *)(v58 - 8);
  MEMORY[0x270FA5388](v58);
  uint64_t v57 = (char *)&v46 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_24E4D1900();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v46 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v46 - v13;
  unint64_t v15 = sub_24E4C1644(MEMORY[0x263F8EE78]);
  if (*(void *)(a2 + 16))
  {
    uint64_t v60 = *(void *)(a2 + 16);
    uint64_t v47 = a1;
    char v48 = a3;
    char v17 = *(void (**)(char *, char *, uint64_t))(v9 + 16);
    uint64_t v16 = v9 + 16;
    unint64_t v18 = (char *)(a2 + ((*(unsigned __int8 *)(v16 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 64)));
    uint64_t v19 = *(void *)(v16 + 56);
    uint64_t v55 = (void (**)(char *, uint64_t))(v6 + 8);
    uint64_t v56 = v17;
    char v49 = (void (**)(unint64_t, char *, uint64_t))(v16 + 24);
    uint64_t v50 = (void (**)(unint64_t, char *, uint64_t))(v16 + 16);
    uint64_t v51 = (void (**)(char *, uint64_t))(v16 - 8);
    uint64_t v46 = a2;
    swift_bridgeObjectRetain();
    uint64_t v52 = v16;
    uint64_t v53 = v19;
    uint64_t v54 = v14;
    while (1)
    {
      uint64_t v59 = v18;
      uint64_t v20 = v8;
      uint64_t v21 = v8;
      uint64_t v22 = v56;
      v56(v14, v18, v20);
      BOOL v23 = v57;
      sub_24E4D18E0();
      uint64_t v24 = sub_24E4D1910();
      uint64_t v26 = v25;
      (*v55)(v23, v58);
      uint64_t v27 = v14;
      uint64_t v28 = v21;
      v22(v12, v27, v21);
      int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v61 = (void *)v15;
      unint64_t v31 = sub_24E4CBA10(v24, v26, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_24E4CCA94);
      uint64_t v32 = *(void *)(v15 + 16);
      BOOL v33 = (v30 & 1) == 0;
      uint64_t v34 = v32 + v33;
      if (__OFADD__(v32, v33)) {
        break;
      }
      char v35 = v30;
      if (*(void *)(v15 + 24) >= v34)
      {
        if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
          sub_24E4CCEE0();
        }
      }
      else
      {
        sub_24E4CBE00(v34, isUniquelyReferenced_nonNull_native);
        uint64_t v36 = sub_24E4CBA10(v24, v26, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_24E4CCA94);
        if ((v35 & 1) != (v37 & 1)) {
          goto LABEL_18;
        }
        unint64_t v31 = v36;
      }
      uint64_t v8 = v21;
      uint64_t v38 = v53;
      uint64_t v39 = v61;
      if (v35)
      {
        (*v49)(v61[7] + v31 * v53, v12, v28);
        uint64_t v14 = v54;
      }
      else
      {
        v61[(v31 >> 6) + 8] |= 1 << v31;
        uint64_t v40 = (uint64_t *)(v39[6] + 16 * v31);
        *uint64_t v40 = v24;
        v40[1] = v26;
        (*v50)(v39[7] + v31 * v38, v12, v28);
        uint64_t v41 = v39[2];
        BOOL v42 = __OFADD__(v41, 1);
        uint64_t v43 = v41 + 1;
        uint64_t v14 = v54;
        if (v42) {
          goto LABEL_17;
        }
        v39[2] = v43;
        swift_bridgeObjectRetain();
      }
      unint64_t v15 = (unint64_t)v61;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      (*v51)(v14, v8);
      unint64_t v18 = &v59[v38];
      if (!--v60)
      {
        swift_bridgeObjectRelease();
        a1 = v47;
        a3 = v48;
        goto LABEL_15;
      }
    }
    __break(1u);
LABEL_17:
    __break(1u);
LABEL_18:
    uint64_t result = sub_24E4D2020();
    __break(1u);
  }
  else
  {
LABEL_15:
    uint64_t v44 = (unint64_t *)(a1 + *a3);
    swift_beginAccess();
    *uint64_t v44 = v15;
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_24E4C1E08(uint64_t a1, void *aBlock, void *a3)
{
  v3[2] = a3;
  v3[3] = _Block_copy(aBlock);
  a3;
  uint64_t v6 = (void *)swift_task_alloc();
  v3[4] = v6;
  *uint64_t v6 = v3;
  v6[1] = sub_24E4C1EC4;
  return ObjCBootstrap.getFriends(with:)(a1);
}

uint64_t sub_24E4C1EC4()
{
  uint64_t v2 = v0;
  uint64_t v3 = *v1;
  uint64_t v4 = *(void **)(*v1 + 16);
  uint64_t v5 = *v1;
  swift_task_dealloc();

  if (v2)
  {
    uint64_t v6 = sub_24E4D16B0();

    uint64_t v7 = 0;
    uint64_t v8 = (void *)v6;
  }
  else
  {
    sub_24E4D0CB4(0, &qword_26B1C12D8);
    uint64_t v7 = sub_24E4D1D20();
    swift_bridgeObjectRelease();
    uint64_t v6 = 0;
    uint64_t v8 = (void *)v7;
  }
  uint64_t v9 = *(void (***)(void, void, void))(v3 + 24);
  v9[2](v9, v7, v6);

  _Block_release(v9);
  uint64_t v10 = *(uint64_t (**)(void))(v5 + 8);
  return v10();
}

uint64_t ObjCBootstrap.canShareLocationWithHandle(_:isFromGroup:)(uint64_t a1, char a2)
{
  *(unsigned char *)(v3 + 152) = a2;
  *(void *)(v3 + 128) = a1;
  *(void *)(v3 + 136) = v2;
  return MEMORY[0x270FA2498](sub_24E4C2088, 0, 0);
}

uint64_t sub_24E4C2088()
{
  uint64_t v1 = *(unsigned __int8 *)(v0 + 152);
  uint64_t v3 = *(void *)(v0 + 128);
  uint64_t v2 = *(void **)(v0 + 136);
  *(void *)(v0 + 16) = v0;
  *(void *)(v0 + 56) = v0 + 120;
  *(void *)(v0 + 24) = sub_24E4C2198;
  uint64_t v4 = swift_continuation_init();
  *(void *)(v0 + 80) = MEMORY[0x263EF8330];
  *(void *)(v0 + 88) = 0x40000000;
  *(void *)(v0 + 96) = sub_24E4C2330;
  *(void *)(v0 + 104) = &block_descriptor_58;
  *(void *)(v0 + 112) = v4;
  objc_msgSend(v2, sel_friendshipStateWithHandle_isFromGroup_completionHandler_, v3, v1, v0 + 80);
  return MEMORY[0x270FA23F0](v0 + 16);
}

uint64_t sub_24E4C2198()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 144) = v1;
  if (v1) {
    uint64_t v2 = sub_24E4C22C4;
  }
  else {
    uint64_t v2 = sub_24E4C22A8;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24E4C22A8()
{
  return (*(uint64_t (**)(void))(v0 + 8))(*(void *)(v0 + 120));
}

uint64_t sub_24E4C22C4()
{
  swift_willThrow();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24E4C2330(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2698EDAF8);
    uint64_t v5 = swift_allocError();
    *uint64_t v6 = a3;
    id v7 = a3;
    return MEMORY[0x270FA2410](v3, v5);
  }
  else
  {
    **(void **)(*(void *)(v3 + 64) + 40) = a2;
    return MEMORY[0x270FA2408](v3);
  }
}

uint64_t sub_24E4C2568(void *a1, char a2, void *aBlock, void *a4)
{
  *(unsigned char *)(v4 + 160) = a2;
  *(void *)(v4 + 128) = a1;
  *(void *)(v4 + 136) = a4;
  *(void *)(v4 + 144) = _Block_copy(aBlock);
  id v7 = a1;
  id v8 = a4;
  return MEMORY[0x270FA2498](sub_24E4C25F8, 0, 0);
}

uint64_t sub_24E4C25F8()
{
  uint64_t v1 = *(unsigned __int8 *)(v0 + 160);
  uint64_t v3 = *(void *)(v0 + 128);
  uint64_t v2 = *(void **)(v0 + 136);
  *(void *)(v0 + 16) = v0;
  *(void *)(v0 + 56) = v0 + 120;
  *(void *)(v0 + 24) = sub_24E4C2708;
  uint64_t v4 = swift_continuation_init();
  *(void *)(v0 + 80) = MEMORY[0x263EF8330];
  *(void *)(v0 + 88) = 0x40000000;
  *(void *)(v0 + 96) = sub_24E4C2330;
  *(void *)(v0 + 104) = &block_descriptor_123;
  *(void *)(v0 + 112) = v4;
  objc_msgSend(v2, sel_friendshipStateWithHandle_isFromGroup_completionHandler_, v3, v1, v0 + 80);
  return MEMORY[0x270FA23F0](v0 + 16);
}

uint64_t sub_24E4C2708()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 152) = v1;
  if (v1) {
    uint64_t v2 = sub_24E4C28A8;
  }
  else {
    uint64_t v2 = sub_24E4C2818;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24E4C2818()
{
  uint64_t v2 = *(void **)(v0 + 136);
  uint64_t v1 = *(void *)(v0 + 144);
  uint64_t v3 = *(void *)(v0 + 120);

  (*(void (**)(uint64_t, uint64_t, void))(v1 + 16))(v1, v3, 0);
  _Block_release(*(const void **)(v0 + 144));
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_24E4C28A8()
{
  uint64_t v1 = *(void *)(v0 + 144);
  uint64_t v2 = *(void **)(v0 + 152);
  uint64_t v4 = *(void **)(v0 + 128);
  uint64_t v3 = *(void **)(v0 + 136);
  swift_willThrow();

  uint64_t v5 = (void *)sub_24E4D16B0();
  (*(void (**)(uint64_t))(v1 + 16))(v1);

  _Block_release(*(const void **)(v0 + 144));
  uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
  return v6();
}

uint64_t ObjCBootstrap.friendshipStateWithHandle(_:isFromGroup:)(uint64_t a1, char a2)
{
  *(unsigned char *)(v3 + 144) = a2;
  *(void *)(v3 + 32) = a1;
  *(void *)(v3 + 40) = v2;
  *(void *)(v3 + 48) = swift_getObjectType();
  uint64_t v4 = sub_24E4D1950();
  *(void *)(v3 + 56) = v4;
  *(void *)(v3 + 64) = *(void *)(v4 - 8);
  *(void *)(v3 + 72) = swift_task_alloc();
  uint64_t v5 = sub_24E4D1770();
  *(void *)(v3 + 80) = v5;
  *(void *)(v3 + 88) = *(void *)(v5 - 8);
  *(void *)(v3 + 96) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24E4C2A88, 0, 0);
}

uint64_t sub_24E4C2A88()
{
  uint64_t v1 = swift_task_alloc();
  *(void *)(v0 + 104) = v1;
  *(_OWORD *)(v1 + 16) = *(_OWORD *)(v0 + 40);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 112) = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_24E4C2B78;
  return MEMORY[0x270FA2318]();
}

uint64_t sub_24E4C2B78()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_24E4C2C90, 0, 0);
}

uint64_t sub_24E4C2C90()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 40) + OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap__session);
  *(void *)(v0 + 120) = v1;
  swift_retain();
  if (v1)
  {
    uint64_t v2 = *(unsigned __int8 *)(v0 + 144);
    id v3 = objc_msgSend(*(id *)(v0 + 32), sel_identifier);
    sub_24E4D1CC0();

    sub_24E4ABDFC(MEMORY[0x263F8EE78]);
    sub_24E4D1940();
    uint64_t v4 = (void *)swift_task_alloc();
    *(void *)(v0 + 128) = v4;
    *uint64_t v4 = v0;
    v4[1] = sub_24E4C2F5C;
    uint64_t v5 = *(void *)(v0 + 96);
    uint64_t v6 = *(void *)(v0 + 72);
    return MEMORY[0x270F29670](v5, v6, v2);
  }
  else
  {
    if (qword_26B1C1318 != -1) {
      swift_once();
    }
    uint64_t v7 = sub_24E4D1C20();
    __swift_project_value_buffer(v7, (uint64_t)qword_26B1C13C0);
    uint64_t v8 = sub_24E4D1C00();
    os_log_type_t v9 = sub_24E4D1E10();
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v10 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl(&dword_24E4A6000, v8, v9, "Missing FindMyLocate.Session!", v10, 2u);
      MEMORY[0x25333CC90](v10, -1, -1);
    }

    type metadata accessor for FMLSessionError(0);
    *(void *)(v0 + 24) = 5;
    sub_24E4CA610(MEMORY[0x263F8EE78]);
    sub_24E4D13C4(&qword_2698EDA30, type metadata accessor for FMLSessionError);
    sub_24E4D16A0();
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v11 = *(uint64_t (**)(void))(v0 + 8);
    return v11();
  }
}

uint64_t sub_24E4C2F5C()
{
  uint64_t v2 = *(void **)v1;
  *(void *)(*(void *)v1 + 136) = v0;
  swift_task_dealloc();
  (*(void (**)(void, void))(v2[8] + 8))(v2[9], v2[7]);
  if (v0) {
    id v3 = sub_24E4C31B8;
  }
  else {
    id v3 = sub_24E4C30C4;
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

uint64_t sub_24E4C30C4()
{
  char v1 = sub_24E4D1750();
  uint64_t v3 = v0[11];
  uint64_t v2 = v0[12];
  uint64_t v4 = v0[10];
  if (v1)
  {
    int v5 = sub_24E4D1760();
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
    uint64_t v6 = ~v5 & 1;
  }
  else
  {
    (*(void (**)(void, void))(v3 + 8))(v0[12], v0[10]);
    swift_release();
    uint64_t v6 = 2;
  }
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = (uint64_t (*)(uint64_t))v0[1];
  return v7(v6);
}

uint64_t sub_24E4C31B8()
{
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  char v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24E4C33B4(void *a1, char a2, void *aBlock, void *a4)
{
  v4[2] = a1;
  v4[3] = a4;
  v4[4] = _Block_copy(aBlock);
  id v8 = a1;
  a4;
  uint64_t v9 = (void *)swift_task_alloc();
  v4[5] = v9;
  *uint64_t v9 = v4;
  v9[1] = sub_24E4C3480;
  return ObjCBootstrap.friendshipStateWithHandle(_:isFromGroup:)((uint64_t)v8, a2);
}

uint64_t sub_24E4C3480(uint64_t a1)
{
  uint64_t v3 = v1;
  uint64_t v6 = *v2;
  uint64_t v5 = *v2;
  uint64_t v7 = *(void **)(*v2 + 24);
  id v8 = *(void **)(*v2 + 16);
  uint64_t v9 = *v2;
  swift_task_dealloc();

  uint64_t v10 = *(void *)(v5 + 32);
  if (v3)
  {
    uint64_t v11 = (void *)sub_24E4D16B0();

    (*(void (**)(uint64_t))(v10 + 16))(v10);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, void))(v10 + 16))(v10, a1, 0);
  }
  _Block_release(*(const void **)(v6 + 32));
  uint64_t v12 = *(uint64_t (**)(void))(v9 + 8);
  return v12();
}

uint64_t ObjCBootstrap.getOfferExpirationForHandle(_:groupId:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[7] = a4;
  v5[8] = v4;
  v5[5] = a2;
  v5[6] = a3;
  v5[4] = a1;
  v5[9] = swift_getObjectType();
  uint64_t v6 = sub_24E4D1950();
  v5[10] = v6;
  v5[11] = *(void *)(v6 - 8);
  v5[12] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24E4C3700, 0, 0);
}

uint64_t sub_24E4C3700()
{
  uint64_t v1 = swift_task_alloc();
  *(void *)(v0 + 104) = v1;
  *(_OWORD *)(v1 + 16) = *(_OWORD *)(v0 + 64);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 112) = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_24E4C37F0;
  return MEMORY[0x270FA2318]();
}

uint64_t sub_24E4C37F0()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_24E4C3908, 0, 0);
}

uint64_t sub_24E4C3908()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 64) + OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap__session);
  *(void *)(v0 + 120) = v1;
  swift_retain();
  if (v1)
  {
    id v2 = objc_msgSend(*(id *)(v0 + 40), sel_identifier);
    sub_24E4D1CC0();

    sub_24E4ABDFC(MEMORY[0x263F8EE78]);
    sub_24E4D1940();
    uint64_t v3 = (void *)swift_task_alloc();
    *(void *)(v0 + 128) = v3;
    *uint64_t v3 = v0;
    v3[1] = sub_24E4C3BB8;
    uint64_t v4 = *(void *)(v0 + 96);
    uint64_t v5 = *(void *)(v0 + 48);
    uint64_t v6 = *(void *)(v0 + 56);
    uint64_t v7 = *(void *)(v0 + 32);
    return MEMORY[0x270F29678](v7, v4, v5, v6);
  }
  else
  {
    if (qword_26B1C1318 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_24E4D1C20();
    __swift_project_value_buffer(v8, (uint64_t)qword_26B1C13C0);
    uint64_t v9 = sub_24E4D1C00();
    os_log_type_t v10 = sub_24E4D1E10();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_24E4A6000, v9, v10, "Missing FindMyLocate.Session!", v11, 2u);
      MEMORY[0x25333CC90](v11, -1, -1);
    }

    type metadata accessor for FMLSessionError(0);
    *(void *)(v0 + 24) = 5;
    sub_24E4CA610(MEMORY[0x263F8EE78]);
    sub_24E4D13C4(&qword_2698EDA30, type metadata accessor for FMLSessionError);
    sub_24E4D16A0();
    swift_willThrow();
    swift_task_dealloc();
    uint64_t v12 = *(uint64_t (**)(void))(v0 + 8);
    return v12();
  }
}

uint64_t sub_24E4C3BB8()
{
  id v2 = *(void **)v1;
  *(void *)(*(void *)v1 + 136) = v0;
  swift_task_dealloc();
  (*(void (**)(void, void))(v2[11] + 8))(v2[12], v2[10]);
  if (v0) {
    uint64_t v3 = sub_24E4C3D90;
  }
  else {
    uint64_t v3 = sub_24E4C3D20;
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

uint64_t sub_24E4C3D20()
{
  swift_release();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24E4C3D90()
{
  swift_release();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24E4C3F80(void *a1, uint64_t a2, const void *a3, void *a4)
{
  v4[2] = a1;
  v4[3] = a4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698ED9C8);
  v4[4] = swift_task_alloc();
  uint64_t v9 = swift_task_alloc();
  v4[5] = v9;
  v4[6] = _Block_copy(a3);
  if (a2)
  {
    a2 = sub_24E4D1CC0();
    uint64_t v11 = v10;
  }
  else
  {
    uint64_t v11 = 0;
  }
  v4[7] = v11;
  id v12 = a1;
  a4;
  uint64_t v13 = (void *)swift_task_alloc();
  v4[8] = v13;
  *uint64_t v13 = v4;
  v13[1] = sub_24E4C40C8;
  return ObjCBootstrap.getOfferExpirationForHandle(_:groupId:)(v9, (uint64_t)v12, a2, v11);
}

uint64_t sub_24E4C40C8()
{
  id v2 = (void *)*v1;
  uint64_t v3 = *(void **)(*v1 + 24);
  uint64_t v4 = *(void **)(*v1 + 16);
  uint64_t v5 = *v1;
  swift_task_dealloc();

  swift_bridgeObjectRelease();
  if (v0)
  {
    uint64_t v6 = (void (**)(void, void, void))v2[6];
    uint64_t v7 = (void *)sub_24E4D16B0();

    ((void (**)(void, void, void *))v6)[2](v6, 0, v7);
    _Block_release(v6);
  }
  else
  {
    uint64_t v8 = v2[4];
    sub_24E4D0CF0(v2[5], v8, &qword_2698ED9C8);
    uint64_t v9 = sub_24E4D16F0();
    uint64_t v10 = *(void *)(v9 - 8);
    int v11 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9);
    id v12 = 0;
    if (v11 != 1)
    {
      uint64_t v13 = v2[4];
      id v12 = (void *)sub_24E4D16C0();
      (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v13, v9);
    }
    uint64_t v14 = (void (**)(void, void, void))v2[6];
    ((void (**)(void, void *, void))v14)[2](v14, v12, 0);
    _Block_release(v14);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v15 = *(uint64_t (**)(void))(v5 + 8);
  return v15();
}

void __swiftcall ObjCBootstrap.cachedLocation(for:includeAddress:)(FMLLocation_optional *__return_ptr retstr, FMLHandle a2, Swift::Bool includeAddress)
{
}

void sub_24E4C43CC(void *a1@<X0>, char a2@<W1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  if (qword_26B1C1318 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_24E4D1C20();
  __swift_project_value_buffer(v8, (uint64_t)qword_26B1C13C0);
  id v9 = a1;
  uint64_t v10 = sub_24E4D1C00();
  os_log_type_t v11 = sub_24E4D1E20();
  if (os_log_type_enabled(v10, v11))
  {
    BOOL v42 = a4;
    uint64_t v12 = swift_slowAlloc();
    uint64_t v39 = (void *)swift_slowAlloc();
    uint64_t v40 = swift_slowAlloc();
    v45[0] = v40;
    *(_DWORD *)uint64_t v12 = 136446722;
    uint64_t v46 = sub_24E4CAAA0(0xD000000000000023, 0x800000024E4D38D0, v45);
    sub_24E4D1EB0();
    *(_WORD *)(v12 + 12) = 2112;
    uint64_t v46 = (uint64_t)v9;
    id v13 = v9;
    sub_24E4D1EB0();
    *uint64_t v39 = v9;

    *(_WORD *)(v12 + 22) = 1024;
    LODWORD(v46) = a2 & 1;
    sub_24E4D1EB0();
    _os_log_impl(&dword_24E4A6000, v10, v11, "%{public}s for handle: %@ includeAddress: %{BOOL}d", (uint8_t *)v12, 0x1Cu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C1300);
    swift_arrayDestroy();
    MEMORY[0x25333CC90](v39, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x25333CC90](v40, -1, -1);
    uint64_t v14 = v12;
    a4 = v42;
    MEMORY[0x25333CC90](v14, -1, -1);
  }
  else
  {
  }
  uint64_t v15 = (uint64_t *)(a3 + OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap_locationForHandles);
  swift_beginAccess();
  uint64_t v16 = *v15;
  id v17 = v9;
  swift_bridgeObjectRetain();
  unint64_t v18 = sub_24E4C497C(v17, v16);

  swift_bridgeObjectRelease();
  if (v18 && (a2 & 1) != 0)
  {
    id v19 = objc_msgSend(v18, sel_address);

    id v20 = v18;
    uint64_t v21 = sub_24E4D1C00();
    os_log_type_t v22 = sub_24E4D1E20();
    BOOL v23 = os_log_type_enabled(v21, v22);
    if (v19)
    {
      if (v23)
      {
        uint64_t v24 = (uint8_t *)swift_slowAlloc();
        uint64_t v44 = swift_slowAlloc();
        uint64_t v46 = v44;
        *(_DWORD *)uint64_t v24 = 136315138;
        id v25 = v20;
        id v26 = objc_msgSend(v25, sel_description);
        os_log_type_t v41 = v22;
        uint64_t v27 = a4;
        uint64_t v28 = sub_24E4D1CC0();
        unint64_t v30 = v29;

        uint64_t v31 = v28;
        a4 = v27;
        sub_24E4CAAA0(v31, v30, &v46);
        sub_24E4D1EB0();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_24E4A6000, v21, v41, "Cached location: %s", v24, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x25333CC90](v44, -1, -1);
        MEMORY[0x25333CC90](v24, -1, -1);
      }
      else
      {
      }
    }
    else
    {
      if (v23)
      {
        uint64_t v32 = (uint8_t *)swift_slowAlloc();
        uint64_t v33 = swift_slowAlloc();
        uint64_t v46 = v33;
        *(_DWORD *)uint64_t v32 = 136315138;
        id v34 = v20;
        id v35 = objc_msgSend(v34, sel_description);
        uint64_t v36 = sub_24E4D1CC0();
        uint64_t v43 = a4;
        unint64_t v38 = v37;

        sub_24E4CAAA0(v36, v38, &v46);
        sub_24E4D1EB0();

        a4 = v43;
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_24E4A6000, v21, v22, "Found cached location: %s, but no address!", v32, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x25333CC90](v33, -1, -1);
        MEMORY[0x25333CC90](v32, -1, -1);
      }
      else
      {
      }
      unint64_t v18 = 0;
    }
  }
  *a4 = v18;
}

void *sub_24E4C497C(void *a1, uint64_t a2)
{
  if ((a2 & 0xC000000000000001) == 0)
  {
    if (*(void *)(a2 + 16))
    {
      unint64_t v6 = sub_24E4CB9CC((uint64_t)a1);
      if (v7)
      {
        uint64_t v5 = *(void **)(*(void *)(a2 + 56) + 8 * v6);
        id v8 = v5;
        return v5;
      }
    }
    return 0;
  }
  id v3 = a1;
  uint64_t v4 = sub_24E4D1F50();

  if (!v4) {
    return 0;
  }
  sub_24E4D0CB4(0, &qword_2698EDE50);
  swift_unknownObjectRetain();
  swift_dynamicCast();
  uint64_t v5 = v10;
  swift_unknownObjectRelease();
  return v5;
}

uint64_t ObjCBootstrap.cachedFriendsSharingLocationWithMe()()
{
  return sub_24E4C66E8();
}

size_t sub_24E4C4B24(unint64_t a1)
{
  uint64_t isUniquelyReferenced_nonNull_native = v1;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C1360);
  MEMORY[0x270FA5388](v5 - 8);
  v151 = (char *)&v145 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_24E4D1710();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v145 = (char *)&v145 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  v147 = (char *)&v145 - v11;
  uint64_t v163 = sub_24E4D1C20();
  uint64_t v154 = *(void *)(v163 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v163);
  v153 = (char *)&v145 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v145 - v14;
  uint64_t v179 = sub_24E4D1950();
  uint64_t v16 = *(void (**)(char *, uint64_t))(v179 - 8);
  uint64_t v17 = MEMORY[0x270FA5388](v179);
  uint64_t v164 = (char *)&v145 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  uint64_t v168 = (char *)&v145 - v20;
  uint64_t v21 = MEMORY[0x270FA5388](v19);
  uint64_t v167 = (char *)&v145 - v22;
  MEMORY[0x270FA5388](v21);
  v169 = (char *)&v145 - v23;
  uint64_t v24 = sub_24E4D1900();
  uint64_t v178 = *(void *)(v24 - 8);
  uint64_t v25 = MEMORY[0x270FA5388](v24);
  v170 = (char *)&v145 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = MEMORY[0x270FA5388](v25);
  unint64_t v29 = (char *)&v145 - v28;
  uint64_t v30 = MEMORY[0x270FA5388](v27);
  uint64_t v166 = (char *)&v145 - v31;
  uint64_t v32 = MEMORY[0x270FA5388](v30);
  v165 = (char *)&v145 - v33;
  uint64_t v34 = MEMORY[0x270FA5388](v32);
  unint64_t v171 = (char *)&v145 - v35;
  MEMORY[0x270FA5388](v34);
  unint64_t v187 = (char *)&v145 - v36;
  uint64_t v159 = sub_24E4D16F0();
  uint64_t v158 = *(void *)(v159 - 8);
  MEMORY[0x270FA5388](v159);
  unint64_t v38 = (char *)&v145 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24E4D1AA0();
  v173 = v38;
  sub_24E4D19C0();
  unint64_t v155 = a1;
  uint64_t v152 = ObjectType;
  uint64_t v149 = v7;
  uint64_t v148 = v8;
  uint64_t v150 = v15;
  unint64_t v162 = v29;
  uint64_t v186 = v16;
  switch(a1)
  {
    case 0uLL:
    case 1uLL:
    case 4uLL:
      swift_beginAccess();
      uint64_t v39 = swift_bridgeObjectRetain();
      size_t v40 = sub_24E4CD1A4(v39);
      uint64_t v41 = swift_bridgeObjectRelease();
      break;
    default:
      uint64_t v41 = sub_24E4D048C(a1);
      size_t v40 = v41;
      break;
  }
  uint64_t v42 = v179;
  uint64_t v43 = (uint64_t)v187;
  MEMORY[0x270FA5388](v41);
  uint64_t v44 = v173;
  uint64_t v143 = (uint64_t)v173;
  swift_bridgeObjectRetain();
  uint64_t v45 = sub_24E4C825C((uint64_t (*)(char *))sub_24E4D0854, (uint64_t)(&v145 - 4), v40);
  uint64_t v184 = *(void *)(v45 + 16);
  if (!v184)
  {
    (*(void (**)(char *, uint64_t))(v158 + 8))(v44, v159);
    goto LABEL_64;
  }
  unint64_t v183 = sub_24E4C1644(MEMORY[0x263F8EE78]);
  uint64_t v46 = *(void *)(v40 + 16);
  size_t v177 = v40;
  uint64_t v176 = v46;
  if (!v46)
  {
    swift_bridgeObjectRelease();
    goto LABEL_43;
  }
  uint64_t v181 = 0;
  uint64_t v146 = isUniquelyReferenced_nonNull_native;
  unint64_t v47 = (*(unsigned __int8 *)(v178 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v178 + 80);
  size_t v175 = v40 + v47;
  unint64_t v180 = v45 + v47;
  uint64_t v188 = v178 + 8;
  uint64_t v189 = v178 + 16;
  uint64_t isUniquelyReferenced_nonNull_native = (uint64_t)v186 + 8;
  uint64_t v161 = (void (**)(unint64_t, char *, uint64_t))(v178 + 32);
  uint64_t v160 = (void (**)(unint64_t, char *, uint64_t))(v178 + 40);
  swift_bridgeObjectRetain();
  unint64_t v48 = 0;
  *(void *)&long long v49 = 141558275;
  long long v157 = v49;
  uint64_t v156 = MEMORY[0x263F8EE58] + 8;
  uint64_t v50 = v171;
  uint64_t v182 = v45;
  id v174 = (uint64_t (**)(uint64_t, uint64_t))isUniquelyReferenced_nonNull_native;
  uint64_t v172 = v24;
  while (2)
  {
    if (v48 >= *(void *)(v40 + 16)) {
      goto LABEL_66;
    }
    uint64_t v72 = v178;
    uint64_t v73 = *(void *)(v178 + 72);
    unint64_t v185 = v48;
    uint64_t v74 = *(void (**)(uint64_t, size_t, uint64_t))(v178 + 16);
    v74(v43, v175 + v73 * v48, v24);
    v74((uint64_t)v50, v180, v24);
    sub_24E4D13C4(&qword_2698EDE00, MEMORY[0x263F3CF40]);
    swift_bridgeObjectRetain();
    char v75 = sub_24E4D1CA0();
    uint64_t v186 = *(void (**)(char *, uint64_t))(v72 + 8);
    v186(v50, v24);
    if (v75) {
      goto LABEL_8;
    }
    if (v184 == 1) {
      goto LABEL_15;
    }
    v74((uint64_t)v50, v180 + v73, v24);
    char v87 = sub_24E4D1CA0();
    v186(v50, v24);
    if (v87)
    {
      uint64_t v42 = v179;
      goto LABEL_8;
    }
    if (v184 == 2)
    {
LABEL_15:
      swift_bridgeObjectRelease();
      uint64_t v42 = (uint64_t)v164;
      uint64_t v76 = v187;
      sub_24E4D18E0();
      uint64_t v77 = sub_24E4D1910();
      uint64_t v43 = v78;
      (*v174)(v42, v179);
      v74((uint64_t)v170, (size_t)v76, v24);
      uint64_t v79 = v183;
      uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v190 = (void *)v79;
      unint64_t v81 = sub_24E4CBA10(v77, v43, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_24E4CCA94);
      uint64_t v82 = *(void *)(v79 + 16);
      BOOL v83 = (v80 & 1) == 0;
      uint64_t v84 = v82 + v83;
      if (!__OFADD__(v82, v83))
      {
        uint64_t v42 = v80;
        if (*(void *)(v79 + 24) >= v84)
        {
          if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
            sub_24E4CCEE0();
          }
        }
        else
        {
          sub_24E4CBE00(v84, isUniquelyReferenced_nonNull_native);
          uint64_t v85 = sub_24E4CBA10(v77, v43, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_24E4CCA94);
          if ((v42 & 1) != (v86 & 1))
          {
            sub_24E4D2020();
            __break(1u);
            goto LABEL_71;
          }
          unint64_t v81 = v85;
        }
        id v101 = v190;
        if (v42)
        {
          (*v160)(v190[7] + v81 * v73, v170, v24);
        }
        else
        {
          v190[(v81 >> 6) + 8] |= 1 << v81;
          os_log_type_t v102 = (uint64_t *)(v101[6] + 16 * v81);
          *os_log_type_t v102 = v77;
          v102[1] = v43;
          (*v161)(v101[7] + v81 * v73, v170, v24);
          uint64_t v103 = v101[2];
          BOOL v104 = __OFADD__(v103, 1);
          uint64_t v105 = v103 + 1;
          if (v104) {
            goto LABEL_68;
          }
          v101[2] = v105;
          swift_bridgeObjectRetain();
        }
        unint64_t v183 = (unint64_t)v190;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v43 = (uint64_t)v187;
        v186(v187, v24);
        size_t v40 = v177;
LABEL_37:
        uint64_t v42 = v179;
        unint64_t v71 = v185;
        goto LABEL_11;
      }
LABEL_67:
      __break(1u);
LABEL_68:
      __break(1u);
LABEL_69:
      swift_once();
LABEL_45:
      uint64_t v108 = __swift_project_value_buffer(v42, (uint64_t)qword_26B1C13C0);
      uint64_t v107 = v150;
      (*(void (**)(char *, uint64_t, uint64_t))(v43 + 16))(v150, v108, v42);
      uint64_t v109 = sub_24E4D1C00();
      os_log_type_t v110 = sub_24E4D1E20();
      if (!os_log_type_enabled(v109, v110))
      {
LABEL_57:

        (*(void (**)(char *, uint64_t))(v43 + 8))(v107, v42);
LABEL_58:
        uint64_t v128 = v173;
        goto LABEL_63;
      }
      uint64_t v146 = isUniquelyReferenced_nonNull_native;
      unint64_t v111 = v50;
      uint64_t v112 = swift_slowAlloc();
      uint64_t v113 = swift_slowAlloc();
      uint64_t v190 = (void *)v113;
      *(_DWORD *)uint64_t v112 = 141558275;
      uint64_t v191 = 1752392040;
      sub_24E4D1EB0();
      *(_WORD *)(v112 + 12) = 2081;
      uint64_t v189 = v113;
      if (v111 == (char *)2)
      {
        int v114 = (unsigned int *)MEMORY[0x263F3CCC8];
LABEL_61:
        uint64_t v129 = v148;
        uint64_t v130 = v147;
        uint64_t v131 = v149;
        (*(void (**)(char *, void, uint64_t))(v148 + 104))(v147, *v114, v149);
        sub_24E4D13C4(&qword_2698EDE18, MEMORY[0x263F3CCE8]);
        uint64_t v132 = sub_24E4D1FF0();
        unint64_t v134 = v133;
        (*(void (**)(char *, uint64_t))(v129 + 8))(v130, v131);
        uint64_t v191 = sub_24E4CAAA0(v132, v134, (uint64_t *)&v190);
        sub_24E4D1EB0();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_24E4A6000, v109, v110, "validFriends: %{private,mask.hash}s not supported", (uint8_t *)v112, 0x16u);
        uint64_t v135 = v189;
        swift_arrayDestroy();
        MEMORY[0x25333CC90](v135, -1, -1);
        MEMORY[0x25333CC90](v112, -1, -1);

        (*(void (**)(char *, uint64_t))(v154 + 8))(v150, v163);
        goto LABEL_62;
      }
      if (v111 == (char *)3)
      {
        int v114 = (unsigned int *)MEMORY[0x263F3CCD0];
        goto LABEL_61;
      }
LABEL_71:
      int v144 = 0;
      uint64_t v143 = 72;
      sub_24E4D1F80();
      __break(1u);
      JUMPOUT(0x24E4C6190);
    }
    uint64_t v42 = v180 + 2 * v73;
    uint64_t v43 = 2;
    v88 = v186;
    while (1)
    {
      v74((uint64_t)v50, v42, v24);
      uint64_t isUniquelyReferenced_nonNull_native = v43 + 1;
      if (__OFADD__(v43, 1))
      {
        __break(1u);
LABEL_66:
        __break(1u);
        goto LABEL_67;
      }
      char v89 = sub_24E4D1CA0();
      v88(v50, v24);
      if (v89) {
        break;
      }
      ++v43;
      v42 += v73;
      if (isUniquelyReferenced_nonNull_native == v184) {
        goto LABEL_15;
      }
    }
    uint64_t v42 = v179;
    uint64_t v43 = (uint64_t)v187;
LABEL_8:
    swift_bridgeObjectRelease();
    uint64_t v51 = v169;
    sub_24E4D18E0();
    uint64_t v52 = sub_24E4D1920();
    uint64_t isUniquelyReferenced_nonNull_native = (uint64_t)v174;
    uint64_t v53 = *v174;
    uint64_t v54 = (*v174)((uint64_t)v51, v42);
    MEMORY[0x270FA5388](v54);
    uint64_t v143 = (uint64_t)v173;
    uint64_t v55 = v181;
    uint64_t v56 = sub_24E4CD2F8((uint64_t)sub_24E4D0990, (uint64_t)(&v145 - 4), v52);
    swift_bridgeObjectRelease();
    uint64_t v57 = *(void *)(v56 + 16);
    uint64_t v181 = v55;
    if (v57)
    {
      uint64_t v58 = v168;
      sub_24E4D18E0();
      uint64_t v59 = v42;
      uint64_t v60 = v167;
      sub_24E4D1930();
      swift_release();
      v53((uint64_t)v58, v42);
      uint64_t v61 = v165;
      sub_24E4D1880();
      sub_24E4D18E0();
      uint64_t v62 = sub_24E4D1910();
      uint64_t v64 = v63;
      v53((uint64_t)v58, v59);
      uint64_t v65 = v166;
      v74((uint64_t)v166, (size_t)v61, v172);
      uint64_t v66 = v183;
      char v67 = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v190 = (void *)v66;
      uint64_t v68 = (uint64_t)v65;
      uint64_t v43 = (uint64_t)v187;
      sub_24E4CC720(v68, v62, v64, v67);
      unint64_t v183 = (unint64_t)v190;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      int v69 = v61;
      uint64_t v24 = v172;
      uint64_t v70 = (void (*)(uint64_t, uint64_t))v186;
      v186(v69, v172);
      v53((uint64_t)v60, v59);
      v70(v43, v24);
      uint64_t v42 = v59;
      uint64_t v50 = v171;
      goto LABEL_10;
    }
    swift_release();
    if (qword_26B1C1318 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v163, (uint64_t)qword_26B1C13C0);
    v90 = v162;
    v74((uint64_t)v162, v43, v24);
    uint64_t v91 = sub_24E4D1C00();
    os_log_type_t v92 = sub_24E4D1E20();
    BOOL v93 = os_log_type_enabled(v91, v92);
    uint64_t v50 = v171;
    if (v93)
    {
      uint64_t v94 = swift_slowAlloc();
      uint64_t v95 = swift_slowAlloc();
      uint64_t v190 = (void *)v95;
      *(_DWORD *)uint64_t v94 = v157;
      *(void *)(v94 + 4) = 1752392040;
      *(_WORD *)(v94 + 12) = 2081;
      sub_24E4D13C4(&qword_2698EDE20, MEMORY[0x263F3CF40]);
      uint64_t v96 = sub_24E4D1FF0();
      *(void *)(v94 + 14) = sub_24E4CAAA0(v96, v97, (uint64_t *)&v190);
      swift_bridgeObjectRelease();
      unint64_t v98 = v90;
      uint64_t v99 = (void (*)(uint64_t, uint64_t))v186;
      v186(v98, v24);
      _os_log_impl(&dword_24E4A6000, v91, v92, "friend: %{private,mask.hash}s expired", (uint8_t *)v94, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x25333CC90](v95, -1, -1);
      uint64_t v100 = v94;
      uint64_t v43 = (uint64_t)v187;
      size_t v40 = v177;
      MEMORY[0x25333CC90](v100, -1, -1);

      v99(v43, v24);
      goto LABEL_37;
    }

    uint64_t v106 = (void (*)(uint64_t, uint64_t))v186;
    v186(v90, v24);
    v106(v43, v24);
    uint64_t v42 = v179;
LABEL_10:
    unint64_t v71 = v185;
    size_t v40 = v177;
LABEL_11:
    unint64_t v48 = v71 + 1;
    if (v48 != v176) {
      continue;
    }
    break;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t isUniquelyReferenced_nonNull_native = v146;
LABEL_43:
  uint64_t v50 = (char *)v155;
  uint64_t v42 = v163;
  uint64_t v43 = v154;
  uint64_t v107 = v153;
  switch(v155)
  {
    case 0uLL:
      uint64_t v115 = &OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap_followers;
      goto LABEL_51;
    case 1uLL:
      uint64_t v115 = &OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap_followings;
      goto LABEL_51;
    case 2uLL:
    case 3uLL:
      if (qword_26B1C1318 == -1) {
        goto LABEL_45;
      }
      goto LABEL_69;
    case 4uLL:
      uint64_t v115 = &OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap_pendingOffers;
LABEL_51:
      uint64_t v116 = (unint64_t *)(isUniquelyReferenced_nonNull_native + *v115);
      swift_beginAccess();
      unint64_t *v116 = v183;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      goto LABEL_58;
    default:
      if (qword_26B1C1318 != -1) {
        swift_once();
      }
      uint64_t v117 = __swift_project_value_buffer(v42, (uint64_t)qword_26B1C13C0);
      (*(void (**)(char *, uint64_t, uint64_t))(v43 + 16))(v107, v117, v42);
      uint64_t v109 = sub_24E4D1C00();
      os_log_type_t v118 = sub_24E4D1E20();
      if (!os_log_type_enabled(v109, v118)) {
        goto LABEL_57;
      }
      uint64_t v146 = isUniquelyReferenced_nonNull_native;
      uint64_t v119 = v50;
      uint64_t v120 = swift_slowAlloc();
      uint64_t v189 = swift_slowAlloc();
      uint64_t v190 = (void *)v189;
      *(_DWORD *)uint64_t v120 = 141558275;
      uint64_t v191 = 1752392040;
      sub_24E4D1EB0();
      *(_WORD *)(v120 + 12) = 2081;
      if (v119 != (char *)4) {
        goto LABEL_71;
      }
      uint64_t v121 = v148;
      uint64_t v122 = v145;
      uint64_t v123 = v149;
      (*(void (**)(char *, void, uint64_t))(v148 + 104))(v145, *MEMORY[0x263F3CCC0], v149);
      sub_24E4D13C4(&qword_2698EDE18, MEMORY[0x263F3CCE8]);
      uint64_t v124 = sub_24E4D1FF0();
      unint64_t v126 = v125;
      (*(void (**)(char *, uint64_t))(v121 + 8))(v122, v123);
      uint64_t v191 = sub_24E4CAAA0(v124, v126, (uint64_t *)&v190);
      sub_24E4D1EB0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24E4A6000, v109, v118, "validFriends: %{private,mask.hash}s not supported", (uint8_t *)v120, 0x16u);
      uint64_t v127 = v189;
      swift_arrayDestroy();
      MEMORY[0x25333CC90](v127, -1, -1);
      MEMORY[0x25333CC90](v120, -1, -1);

      (*(void (**)(char *, uint64_t))(v154 + 8))(v153, v163);
      break;
  }
LABEL_62:
  uint64_t isUniquelyReferenced_nonNull_native = v146;
  uint64_t v50 = (char *)v155;
  uint64_t v128 = v173;
LABEL_63:
  uint64_t v136 = sub_24E4D1DB0();
  uint64_t v137 = (uint64_t)v151;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v136 - 8) + 56))(v151, 1, 1, v136);
  uint64_t v138 = (void *)swift_allocObject();
  v138[2] = 0;
  v138[3] = 0;
  v138[4] = isUniquelyReferenced_nonNull_native;
  v138[5] = v50;
  uint64_t v139 = v152;
  v138[6] = v177;
  v138[7] = v139;
  id v140 = (id)isUniquelyReferenced_nonNull_native;
  sub_24E4CA328(v137, (uint64_t)&unk_2698EDE10, (uint64_t)v138);
  swift_release();
  uint64_t v141 = swift_bridgeObjectRetain();
  size_t v40 = sub_24E4CD1A4(v141);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v158 + 8))(v128, v159);
LABEL_64:
  swift_bridgeObjectRelease();
  return v40;
}

uint64_t ObjCBootstrap.cachedFriendsFollowingMyLocation()()
{
  return sub_24E4C66E8();
}

uint64_t sub_24E4C61E8@<X0>(unint64_t a1@<X2>, uint64_t a2@<X3>, unint64_t a3@<X4>, uint64_t *a4@<X8>)
{
  uint64_t v43 = sub_24E4D1900();
  uint64_t v39 = *(void *)(v43 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v43);
  uint64_t v42 = (char *)v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v41 = (char *)v36 - v11;
  size_t v12 = sub_24E4C4B24(a1);
  if (qword_26B1C1318 != -1) {
    swift_once();
  }
  uint64_t v13 = sub_24E4D1C20();
  __swift_project_value_buffer(v13, (uint64_t)qword_26B1C13C0);
  swift_bridgeObjectRetain_n();
  uint64_t v14 = sub_24E4D1C00();
  os_log_type_t v15 = sub_24E4D1E20();
  int v16 = v15;
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v17 = swift_slowAlloc();
    LODWORD(v40) = v16;
    uint64_t v18 = v17;
    uint64_t v19 = swift_slowAlloc();
    uint64_t v45 = v19;
    *(_DWORD *)uint64_t v18 = 136446466;
    uint64_t v44 = sub_24E4CAAA0(a2, a3, &v45);
    sub_24E4D1EB0();
    *(_WORD *)(v18 + 12) = 2080;
    uint64_t v38 = v18 + 14;
    uint64_t v20 = swift_bridgeObjectRetain();
    uint64_t v21 = MEMORY[0x25333C3B0](v20, v43);
    unint64_t v23 = v22;
    swift_bridgeObjectRelease();
    uint64_t v44 = sub_24E4CAAA0(v21, v23, &v45);
    sub_24E4D1EB0();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24E4A6000, v14, (os_log_type_t)v40, "%{public}s: %s", (uint8_t *)v18, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x25333CC90](v19, -1, -1);
    MEMORY[0x25333CC90](v18, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v24 = MEMORY[0x263F8EE78];
  uint64_t v45 = MEMORY[0x263F8EE78];
  uint64_t v25 = *(void *)(v12 + 16);
  if (v25)
  {
    uint64_t v37 = a4;
    uint64_t v38 = v4;
    uint64_t v26 = sub_24E4D0CB4(0, &qword_26B1C12D8);
    uint64_t v27 = v39 + 16;
    uint64_t v28 = *(void (**)(char *, size_t, uint64_t))(v39 + 16);
    size_t v29 = v12 + ((*(unsigned __int8 *)(v39 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v39 + 80));
    uint64_t v39 = *(void *)(v39 + 72);
    uint64_t v40 = v26;
    uint64_t v30 = (uint64_t (**)(char *, uint64_t))(v27 - 8);
    v36[1] = v12;
    swift_bridgeObjectRetain();
    uint64_t v31 = v41;
    do
    {
      uint64_t v32 = v43;
      v28(v31, v29, v43);
      uint64_t v33 = (uint64_t)v42;
      v28(v42, (size_t)v31, v32);
      FMLFriend.init(_:)(v33);
      uint64_t v34 = (*v30)(v31, v32);
      MEMORY[0x25333C380](v34);
      if (*(void *)((v45 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v45 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_24E4D1D60();
      }
      sub_24E4D1D70();
      sub_24E4D1D50();
      v29 += v39;
      --v25;
    }
    while (v25);
    swift_bridgeObjectRelease();
    uint64_t v24 = v45;
    a4 = v37;
  }
  uint64_t result = swift_bridgeObjectRelease();
  *a4 = v24;
  return result;
}

id sub_24E4C660C(void *a1)
{
  swift_getObjectType();
  id v1 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C12B0);
  sub_24E4D1E50();

  sub_24E4D0CB4(0, &qword_26B1C12D8);
  id v2 = (void *)sub_24E4D1D20();
  swift_bridgeObjectRelease();

  return v2;
}

uint64_t ObjCBootstrap.cachedFriendsWithPendingOffers()()
{
  return sub_24E4C66E8();
}

uint64_t sub_24E4C66E8()
{
  swift_getObjectType();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C12B0);
  sub_24E4D1E50();
  return v1;
}

uint64_t ObjCBootstrap.cachedOfferExpiration(for:groupId:)()
{
  return sub_24E4D1E50();
}

uint64_t sub_24E4C6818@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, void *a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v74 = a4;
  id v71 = a3;
  uint64_t v72 = a2;
  uint64_t v5 = sub_24E4D1950();
  uint64_t v68 = *(void *)(v5 - 8);
  uint64_t v69 = v5;
  MEMORY[0x270FA5388](v5);
  char v67 = (char *)&v65 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v66 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698ED9C8);
  uint64_t v7 = MEMORY[0x270FA5388](v66);
  uint64_t v65 = (uint64_t)&v65 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v65 - v10;
  MEMORY[0x270FA5388](v9);
  uint64_t v70 = (char *)&v65 - v12;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698EDDE0);
  MEMORY[0x270FA5388](v13 - 8);
  os_log_type_t v15 = (char *)&v65 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_24E4D1900();
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v75 = v16;
  uint64_t v76 = v17;
  MEMORY[0x270FA5388](v16);
  uint64_t v73 = (char *)&v65 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698EDDF8);
  MEMORY[0x270FA5388](v19 - 8);
  uint64_t v21 = (char *)&v65 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = sub_24E4D1980();
  uint64_t v23 = *(void *)(v22 - 8);
  uint64_t v24 = MEMORY[0x270FA5388](v22);
  uint64_t v26 = (char *)&v65 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v24);
  uint64_t v77 = (uint64_t)&v65 - v27;
  if (!a1)
  {
    (*(void (**)(char *, void, uint64_t))(v23 + 104))(v26, *MEMORY[0x263F3CF80], v22);
    sub_24E4D1970();
    (*(void (**)(char *, uint64_t))(v23 + 8))(v26, v22);
  }
  swift_bridgeObjectRetain();
  sub_24E4D1960();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48))(v21, 1, v22) == 1)
  {
    (*(void (**)(uint64_t, void, uint64_t))(v23 + 104))(v77, *MEMORY[0x263F3CF88], v22);
    sub_24E4B09A4((uint64_t)v21, &qword_2698EDDF8);
  }
  else
  {
    (*(void (**)(uint64_t, char *, uint64_t))(v23 + 32))(v77, v21, v22);
  }
  uint64_t v28 = v76;
  id v29 = objc_msgSend(v71, sel_identifier);
  sub_24E4D1CC0();

  uint64_t v30 = sub_24E4D1CE0();
  uint64_t v32 = v31;
  swift_bridgeObjectRelease();
  uint64_t v33 = (uint64_t *)(v72 + OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap_followers);
  swift_beginAccess();
  uint64_t v34 = *v33;
  if (*(void *)(v34 + 16))
  {
    swift_bridgeObjectRetain();
    uint64_t v35 = sub_24E4CBA10(v30, v32, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_24E4CCA94);
    uint64_t v36 = (uint64_t)v11;
    uint64_t v38 = v75;
    if (v37)
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v28 + 16))(v15, *(void *)(v34 + 56) + *(void *)(v28 + 72) * v35, v75);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v28 + 56))(v15, 0, 1, v38);
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v28 + 56))(v15, 1, 1, v75);
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v38 = v75;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v28 + 56))(v15, 1, 1, v75);
    swift_bridgeObjectRelease();
    uint64_t v36 = (uint64_t)v11;
  }
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v28 + 48))(v15, 1, v38) == 1)
  {
    sub_24E4B09A4((uint64_t)v15, &qword_2698EDDE0);
    if (qword_26B1C1318 != -1) {
      swift_once();
    }
    uint64_t v39 = sub_24E4D1C20();
    __swift_project_value_buffer(v39, (uint64_t)qword_26B1C13C0);
    uint64_t v40 = sub_24E4D1C00();
    os_log_type_t v41 = sub_24E4D1E20();
    if (os_log_type_enabled(v40, v41))
    {
      uint64_t v42 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v42 = 0;
      _os_log_impl(&dword_24E4A6000, v40, v41, "Trying to get cached offer expiration for handle that is not a follower, returning nil", v42, 2u);
      MEMORY[0x25333CC90](v42, -1, -1);
    }

    (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v77, v22);
    uint64_t v43 = sub_24E4D16F0();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v43 - 8) + 56))(v74, 1, 1, v43);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v28 + 32))(v73, v15, v38);
    uint64_t v45 = v67;
    sub_24E4D18E0();
    uint64_t v46 = sub_24E4D1920();
    (*(void (**)(char *, uint64_t))(v68 + 8))(v45, v69);
    if (*(void *)(v46 + 16))
    {
      unint64_t v47 = sub_24E4CBA94(v77);
      uint64_t v48 = (uint64_t)v70;
      if (v49)
      {
        unint64_t v50 = v47;
        uint64_t v51 = *(void *)(v46 + 56);
        uint64_t v52 = sub_24E4D16F0();
        uint64_t v53 = *(void *)(v52 - 8);
        uint64_t v54 = v53;
        uint64_t v55 = v51 + *(void *)(v53 + 72) * v50;
        uint64_t v38 = v75;
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v53 + 16))(v48, v55, v52);
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v54 + 56))(v48, 0, 1, v52);
        uint64_t v36 = (uint64_t)v11;
      }
      else
      {
        uint64_t v57 = sub_24E4D16F0();
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v57 - 8) + 56))(v48, 1, 1, v57);
      }
    }
    else
    {
      uint64_t v56 = sub_24E4D16F0();
      uint64_t v48 = (uint64_t)v70;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v56 - 8) + 56))(v70, 1, 1, v56);
    }
    swift_bridgeObjectRelease();
    if (qword_26B1C1318 != -1) {
      swift_once();
    }
    uint64_t v58 = sub_24E4D1C20();
    __swift_project_value_buffer(v58, (uint64_t)qword_26B1C13C0);
    sub_24E4D14B8(v48, v36, &qword_2698ED9C8);
    uint64_t v59 = sub_24E4D1C00();
    os_log_type_t v60 = sub_24E4D1E20();
    if (os_log_type_enabled(v59, v60))
    {
      uint64_t v72 = v22;
      uint64_t v61 = (uint8_t *)swift_slowAlloc();
      uint64_t v62 = swift_slowAlloc();
      uint64_t v79 = v62;
      *(_DWORD *)uint64_t v61 = 136315138;
      sub_24E4D14B8(v36, v65, &qword_2698ED9C8);
      uint64_t v63 = sub_24E4D1CD0();
      uint64_t v78 = sub_24E4CAAA0(v63, v64, &v79);
      sub_24E4D1EB0();
      uint64_t v48 = (uint64_t)v70;
      swift_bridgeObjectRelease();
      sub_24E4B09A4(v36, &qword_2698ED9C8);
      _os_log_impl(&dword_24E4A6000, v59, v60, "Expiration date: %s", v61, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25333CC90](v62, -1, -1);
      MEMORY[0x25333CC90](v61, -1, -1);

      (*(void (**)(char *, uint64_t))(v76 + 8))(v73, v75);
      (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v77, v72);
    }
    else
    {

      sub_24E4B09A4(v36, &qword_2698ED9C8);
      (*(void (**)(char *, uint64_t))(v76 + 8))(v73, v38);
      (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v77, v22);
    }
    return sub_24E4D0CF0(v48, v74, &qword_2698ED9C8);
  }
}

uint64_t ObjCBootstrap.cachedCanShareLocationWithHandle(_:isFromGroup:)()
{
  swift_getObjectType();
  type metadata accessor for FMLLocationShareState(0);
  sub_24E4D1E50();
  return v1;
}

uint64_t sub_24E4C74E8@<X0>(void *a1@<X0>, int a2@<W1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  id v101 = a4;
  int v106 = a2;
  uint64_t v6 = sub_24E4D1980();
  uint64_t v97 = *(void *)(v6 - 8);
  uint64_t v98 = v6;
  uint64_t v7 = MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v84 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  BOOL v93 = (char *)&v84 - v10;
  uint64_t v11 = sub_24E4D1950();
  uint64_t v94 = *(void *)(v11 - 8);
  uint64_t v95 = v11;
  uint64_t v12 = MEMORY[0x270FA5388](v11);
  char v89 = (char *)&v84 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  os_log_type_t v92 = (char *)&v84 - v14;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698EDDE0);
  uint64_t v16 = MEMORY[0x270FA5388](v15 - 8);
  uint64_t v96 = (char *)&v84 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  uint64_t v100 = (char *)&v84 - v18;
  uint64_t v102 = sub_24E4D1900();
  uint64_t v19 = *(void *)(v102 - 8);
  uint64_t v20 = MEMORY[0x270FA5388](v102);
  uint64_t v91 = (char *)&v84 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v20);
  uint64_t v23 = (char *)&v84 - v22;
  if (qword_26B1C1318 != -1) {
    swift_once();
  }
  uint64_t v24 = sub_24E4D1C20();
  uint64_t v25 = __swift_project_value_buffer(v24, (uint64_t)qword_26B1C13C0);
  uint64_t v26 = a1;
  uint64_t v99 = v25;
  uint64_t v27 = sub_24E4D1C00();
  os_log_type_t v28 = sub_24E4D1E20();
  BOOL v29 = os_log_type_enabled(v27, v28);
  v90 = v9;
  if (v29)
  {
    uint64_t v30 = swift_slowAlloc();
    uint64_t v88 = a3;
    uint64_t v31 = v30;
    uint64_t v32 = swift_slowAlloc();
    char v87 = v23;
    uint64_t v85 = (void *)v32;
    uint64_t v86 = swift_slowAlloc();
    v105[0] = v86;
    *(_DWORD *)uint64_t v31 = 136446722;
    uint64_t v104 = sub_24E4CAAA0(0xD000000000000030, 0x800000024E4D3800, v105);
    sub_24E4D1EB0();
    *(_WORD *)(v31 + 12) = 2112;
    uint64_t v104 = (uint64_t)v26;
    uint64_t v33 = v19;
    uint64_t v34 = v26;
    sub_24E4D1EB0();
    uint64_t v35 = v85;
    void *v85 = v26;

    uint64_t v19 = v33;
    *(_WORD *)(v31 + 22) = 1024;
    LODWORD(v104) = v106 & 1;
    sub_24E4D1EB0();
    _os_log_impl(&dword_24E4A6000, v27, v28, "%{public}s for handle: %@ isFromGroup: %{BOOL}d", (uint8_t *)v31, 0x1Cu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C1300);
    swift_arrayDestroy();
    uint64_t v23 = v87;
    MEMORY[0x25333CC90](v35, -1, -1);
    uint64_t v36 = v86;
    swift_arrayDestroy();
    MEMORY[0x25333CC90](v36, -1, -1);
    uint64_t v37 = v31;
    a3 = v88;
    MEMORY[0x25333CC90](v37, -1, -1);
  }
  else
  {
  }
  char v107 = 0;
  id v38 = objc_msgSend(v26, sel_identifier);
  sub_24E4D1CC0();

  uint64_t v39 = sub_24E4D1CE0();
  uint64_t v41 = v40;
  swift_bridgeObjectRelease();
  uint64_t v42 = (uint64_t *)(a3 + OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap_followers);
  swift_beginAccess();
  uint64_t v43 = *v42;
  if (*(void *)(v43 + 16))
  {
    swift_bridgeObjectRetain();
    uint64_t v44 = sub_24E4CBA10(v39, v41, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_24E4CCA94);
    uint64_t v45 = v102;
    if (v46)
    {
      unint64_t v47 = v100;
      (*(void (**)(char *, uint64_t, uint64_t))(v19 + 16))(v100, *(void *)(v43 + 56) + *(void *)(v19 + 72) * v44, v102);
      uint64_t v48 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v19 + 56);
      v48(v47, 0, 1, v45);
    }
    else
    {
      uint64_t v48 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v19 + 56);
      unint64_t v47 = v100;
      v48(v100, 1, 1, v102);
    }
    swift_bridgeObjectRelease();
    uint64_t v49 = (uint64_t)v47;
  }
  else
  {
    uint64_t v48 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v19 + 56);
    uint64_t v49 = (uint64_t)v100;
    uint64_t v45 = v102;
    v48(v100, 1, 1, v102);
  }
  swift_bridgeObjectRelease();
  unint64_t v50 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v19 + 48);
  if (v50(v49, 1, v45) == 1)
  {
    uint64_t v51 = v19;
    sub_24E4B09A4(v49, &qword_2698EDDE0);
    if (v107)
    {
LABEL_14:
      char v52 = 1;
      goto LABEL_36;
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v19 + 32))(v23, v49, v45);
    if ((v106 & 1) == 0)
    {
      (*(void (**)(char *, uint64_t))(v19 + 8))(v23, v45);
      goto LABEL_33;
    }
    uint64_t v100 = v26;
    uint64_t v53 = v23;
    uint64_t v51 = v19;
    uint64_t v54 = v92;
    uint64_t v55 = v53;
    sub_24E4D18E0();
    uint64_t v56 = sub_24E4D1920();
    (*(void (**)(char *, uint64_t))(v94 + 8))(v54, v95);
    uint64_t v57 = (uint64_t)v93;
    (*(void (**)(char *, void, uint64_t))(v97 + 104))(v93, *MEMORY[0x263F3CF78], v98);
    if (*(void *)(v56 + 16))
    {
      sub_24E4CBA94(v57);
      uint64_t v58 = v57;
      char v60 = v59;
    }
    else
    {
      uint64_t v58 = v57;
      char v60 = 0;
    }
    (*(void (**)(uint64_t, uint64_t))(v97 + 8))(v58, v98);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v55, v45);
    char v107 = v60 & 1;
    uint64_t v26 = v100;
    if (v60) {
      goto LABEL_14;
    }
  }
  id v61 = objc_msgSend(v26, sel_identifier);
  sub_24E4D1CC0();

  uint64_t v62 = sub_24E4D1CE0();
  uint64_t v64 = v63;
  swift_bridgeObjectRelease();
  uint64_t v65 = (uint64_t *)(a3 + OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap_pendingOffers);
  swift_beginAccess();
  uint64_t v66 = *v65;
  if (*(void *)(v66 + 16))
  {
    swift_bridgeObjectRetain();
    uint64_t v67 = sub_24E4CBA10(v62, v64, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_24E4CCA94);
    uint64_t v69 = (uint64_t)v96;
    if (v68)
    {
      uint64_t v70 = v102;
      (*(void (**)(char *, uint64_t, uint64_t))(v51 + 16))(v96, *(void *)(v66 + 56) + *(void *)(v51 + 72) * v67, v102);
      uint64_t v71 = v70;
      uint64_t v72 = (char *)v69;
      uint64_t v73 = 0;
      uint64_t v74 = v70;
    }
    else
    {
      uint64_t v72 = v96;
      uint64_t v73 = 1;
      uint64_t v71 = v102;
      uint64_t v74 = v102;
    }
    v48(v72, v73, 1, v74);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v69 = (uint64_t)v96;
    uint64_t v71 = v102;
    v48(v96, 1, 1, v102);
  }
  swift_bridgeObjectRelease();
  if (v50(v69, 1, v71) == 1)
  {
    sub_24E4B09A4(v69, &qword_2698EDDE0);
    char v52 = v107;
    goto LABEL_36;
  }
  uint64_t v75 = v91;
  (*(void (**)(char *, uint64_t, uint64_t))(v51 + 32))(v91, v69, v71);
  if (v106)
  {
    uint64_t v76 = v89;
    sub_24E4D18E0();
    uint64_t v77 = sub_24E4D1920();
    (*(void (**)(char *, uint64_t))(v94 + 8))(v76, v95);
    uint64_t v78 = (uint64_t)v90;
    (*(void (**)(char *, void, uint64_t))(v97 + 104))(v90, *MEMORY[0x263F3CF78], v98);
    if (*(void *)(v77 + 16))
    {
      sub_24E4CBA94(v78);
      char v52 = v79;
    }
    else
    {
      char v52 = 0;
    }
    (*(void (**)(uint64_t, uint64_t))(v97 + 8))(v78, v98);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v51 + 8))(v75, v102);
    char v107 = v52 & 1;
    goto LABEL_36;
  }
  (*(void (**)(char *, uint64_t))(v51 + 8))(v75, v71);
LABEL_33:
  char v52 = 1;
  char v107 = 1;
LABEL_36:
  uint64_t v80 = sub_24E4D1C00();
  os_log_type_t v81 = sub_24E4D1E20();
  if (os_log_type_enabled(v80, v81))
  {
    uint64_t v82 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v82 = 67109120;
    int v103 = v52 & 1;
    sub_24E4D1EB0();
    _os_log_impl(&dword_24E4A6000, v80, v81, "hasShared: %{BOOL}d", v82, 8u);
    MEMORY[0x25333CC90](v82, -1, -1);
  }

  uint64_t result = swift_beginAccess();
  void *v101 = (v107 & 1) == 0;
  return result;
}

uint64_t sub_24E4C80AC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_24E4D1950();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = &v10[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_24E4D18E0();
  uint64_t v7 = sub_24E4D1920();
  (*(void (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
  uint64_t v11 = a2;
  char v8 = sub_24E4D09F8(v7, (uint64_t (*)(char *, char *))sub_24E4D09F0);
  swift_bridgeObjectRelease();
  return v8 & 1;
}

BOOL sub_24E4C81D0()
{
  return (sub_24E4D1C90() & 1) == 0;
}

uint64_t sub_24E4C825C(uint64_t (*a1)(char *), uint64_t a2, uint64_t a3)
{
  uint64_t v28 = sub_24E4D1900();
  uint64_t v7 = *(void *)(v28 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v28);
  uint64_t v27 = (char *)v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)v20 - v11;
  uint64_t v13 = MEMORY[0x263F8EE78];
  uint64_t v29 = MEMORY[0x263F8EE78];
  uint64_t v26 = *(void *)(a3 + 16);
  if (v26)
  {
    unint64_t v14 = 0;
    uint64_t v21 = a3;
    uint64_t v22 = (void (**)(char *, uint64_t))(v7 + 8);
    uint64_t v24 = (void (**)(char *, char *, uint64_t))(v7 + 32);
    uint64_t v25 = v7 + 16;
    v20[0] = a1;
    v20[1] = a2;
    while (v14 < *(void *)(a3 + 16))
    {
      unint64_t v15 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
      uint64_t v13 = *(void *)(v7 + 72);
      (*(void (**)(char *, unint64_t, uint64_t))(v7 + 16))(v12, a3 + v15 + v13 * v14, v28);
      char v16 = a1(v12);
      if (v3)
      {
        (*v22)(v12, v28);
        swift_bridgeObjectRelease();
        swift_release();
        return v13;
      }
      if (v16)
      {
        uint64_t v23 = *v24;
        v23(v27, v12, v28);
        uint64_t v17 = v29;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_24E4CB134(0, *(void *)(v17 + 16) + 1, 1);
          uint64_t v17 = v29;
        }
        unint64_t v19 = *(void *)(v17 + 16);
        unint64_t v18 = *(void *)(v17 + 24);
        if (v19 >= v18 >> 1)
        {
          sub_24E4CB134(v18 > 1, v19 + 1, 1);
          uint64_t v17 = v29;
        }
        *(void *)(v17 + 16) = v19 + 1;
        uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))v23)(v17 + v15 + v19 * v13, v27, v28);
        uint64_t v29 = v17;
        a3 = v21;
        a1 = (uint64_t (*)(char *))v20[0];
      }
      else
      {
        uint64_t result = ((uint64_t (*)(char *, uint64_t))*v22)(v12, v28);
      }
      if (v26 == ++v14)
      {
        uint64_t v13 = v29;
        goto LABEL_15;
      }
    }
    __break(1u);
  }
  else
  {
LABEL_15:
    swift_bridgeObjectRelease();
    return v13;
  }
  return result;
}

uint64_t sub_24E4C8500(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[29] = a5;
  v6[30] = a6;
  v6[28] = a4;
  uint64_t v7 = sub_24E4D1710();
  v6[31] = v7;
  v6[32] = *(void *)(v7 - 8);
  v6[33] = swift_task_alloc();
  v6[34] = swift_task_alloc();
  uint64_t v8 = sub_24E4D1C20();
  v6[35] = v8;
  v6[36] = *(void *)(v8 - 8);
  v6[37] = swift_task_alloc();
  v6[38] = swift_task_alloc();
  uint64_t v9 = sub_24E4D1C30();
  v6[39] = v9;
  v6[40] = *(void *)(v9 - 8);
  v6[41] = swift_task_alloc();
  uint64_t v10 = sub_24E4D1C50();
  v6[42] = v10;
  v6[43] = *(void *)(v10 - 8);
  v6[44] = swift_task_alloc();
  uint64_t v13 = (uint64_t (*)(void))((char *)&dword_2698EDB08 + dword_2698EDB08);
  uint64_t v11 = (void *)swift_task_alloc();
  v6[45] = v11;
  *uint64_t v11 = v6;
  v11[1] = sub_24E4C8740;
  return v13();
}

uint64_t sub_24E4C8740(uint64_t a1)
{
  *(void *)(*(void *)v1 + 368) = a1;
  swift_task_dealloc();
  swift_retain();
  return MEMORY[0x270FA2498](sub_24E4C8850, 0, 0);
}

uint64_t sub_24E4C8850()
{
  uint64_t v55 = v0;
  if (v0[46])
  {
    switch(v0[29])
    {
      case 0:
        uint64_t v25 = (void *)swift_task_alloc();
        v0[47] = v25;
        *uint64_t v25 = v0;
        v25[1] = sub_24E4C91A8;
        return MEMORY[0x270F29628]();
      case 1:
        uint64_t v26 = (void *)swift_task_alloc();
        v0[50] = v26;
        *uint64_t v26 = v0;
        v26[1] = sub_24E4C96C0;
        return MEMORY[0x270F29718]();
      case 2:
      case 3:
        if (qword_26B1C1318 != -1) {
          swift_once();
        }
        uint64_t v1 = v0[38];
        uint64_t v3 = v0[35];
        uint64_t v2 = v0[36];
        uint64_t v4 = __swift_project_value_buffer(v3, (uint64_t)qword_26B1C13C0);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
        uint64_t v5 = sub_24E4D1C00();
        os_log_type_t v6 = sub_24E4D1E20();
        if (!os_log_type_enabled(v5, v6))
        {
          uint64_t v28 = v0[38];
          goto LABEL_26;
        }
        uint64_t v7 = v0[29];
        uint64_t v8 = swift_slowAlloc();
        uint64_t v9 = swift_slowAlloc();
        uint64_t v54 = v9;
        *(_DWORD *)uint64_t v8 = 141558275;
        v0[20] = 1752392040;
        sub_24E4D1EB0();
        *(_WORD *)(v8 + 12) = 2081;
        if (v7 == 2)
        {
          uint64_t v10 = (unsigned int *)MEMORY[0x263F3CCC8];
        }
        else
        {
          if (v7 != 3) {
            return sub_24E4D1F80();
          }
          uint64_t v10 = (unsigned int *)MEMORY[0x263F3CCD0];
        }
        uint64_t v48 = v0[36];
        uint64_t v31 = v0[34];
        uint64_t v49 = v0[35];
        uint64_t v51 = v0[38];
        uint64_t v32 = v0[31];
        uint64_t v33 = v0[32];
        (*(void (**)(uint64_t, void, uint64_t))(v33 + 104))(v31, *v10, v32);
        sub_24E4D13C4(&qword_2698EDE18, MEMORY[0x263F3CCE8]);
        uint64_t v34 = sub_24E4D1FF0();
        unint64_t v36 = v35;
        (*(void (**)(uint64_t, uint64_t))(v33 + 8))(v31, v32);
        v0[21] = sub_24E4CAAA0(v34, v36, &v54);
        sub_24E4D1EB0();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_24E4A6000, v5, v6, "validFriends: %{private,mask.hash}s not supported", (uint8_t *)v8, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x25333CC90](v9, -1, -1);
        MEMORY[0x25333CC90](v8, -1, -1);

        (*(void (**)(uint64_t, uint64_t))(v48 + 8))(v51, v49);
        goto LABEL_29;
      case 4:
        uint64_t v27 = (void *)swift_task_alloc();
        v0[53] = v27;
        *uint64_t v27 = v0;
        v27[1] = sub_24E4C9BD8;
        return MEMORY[0x270F296E8]();
      default:
        if (qword_26B1C1318 != -1) {
          swift_once();
        }
        uint64_t v12 = v0[36];
        uint64_t v11 = v0[37];
        uint64_t v13 = v0[35];
        uint64_t v14 = __swift_project_value_buffer(v13, (uint64_t)qword_26B1C13C0);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16))(v11, v14, v13);
        uint64_t v5 = sub_24E4D1C00();
        os_log_type_t v15 = sub_24E4D1E20();
        if (os_log_type_enabled(v5, v15))
        {
          uint64_t v16 = v0[29];
          uint64_t v17 = swift_slowAlloc();
          uint64_t v18 = swift_slowAlloc();
          uint64_t v54 = v18;
          *(_DWORD *)uint64_t v17 = 141558275;
          v0[26] = 1752392040;
          sub_24E4D1EB0();
          *(_WORD *)(v17 + 12) = 2081;
          if (v16 != 4) {
            return sub_24E4D1F80();
          }
          uint64_t v50 = v0[36];
          uint64_t v52 = v0[35];
          uint64_t v53 = v0[37];
          uint64_t v20 = v0[32];
          uint64_t v19 = v0[33];
          uint64_t v21 = v0[31];
          (*(void (**)(uint64_t, void, uint64_t))(v20 + 104))(v19, *MEMORY[0x263F3CCC0], v21);
          sub_24E4D13C4(&qword_2698EDE18, MEMORY[0x263F3CCE8]);
          uint64_t v22 = sub_24E4D1FF0();
          unint64_t v24 = v23;
          (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v19, v21);
          v0[24] = sub_24E4CAAA0(v22, v24, &v54);
          sub_24E4D1EB0();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_24E4A6000, v5, v15, "validFriends: %{private,mask.hash}s not supported", (uint8_t *)v17, 0x16u);
          swift_arrayDestroy();
          MEMORY[0x25333CC90](v18, -1, -1);
          MEMORY[0x25333CC90](v17, -1, -1);

          (*(void (**)(uint64_t, uint64_t))(v50 + 8))(v53, v52);
        }
        else
        {
          uint64_t v28 = v0[37];
LABEL_26:
          uint64_t v29 = v0[35];
          uint64_t v30 = v0[36];

          (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v28, v29);
        }
LABEL_29:
        if (qword_26B1C1318 != -1) {
          swift_once();
        }
        __swift_project_value_buffer(v0[35], (uint64_t)qword_26B1C13C0);
        swift_bridgeObjectRetain_n();
        uint64_t v37 = sub_24E4D1C00();
        os_log_type_t v38 = sub_24E4D1E20();
        if (os_log_type_enabled(v37, v38))
        {
          uint64_t v39 = (uint8_t *)swift_slowAlloc();
          uint64_t v40 = swift_slowAlloc();
          uint64_t v54 = v40;
          *(_DWORD *)uint64_t v39 = 136315138;
          uint64_t v41 = sub_24E4D1900();
          uint64_t v42 = swift_bridgeObjectRetain();
          uint64_t v43 = MEMORY[0x25333C3B0](v42, v41);
          unint64_t v45 = v44;
          swift_bridgeObjectRelease();
          v0[22] = sub_24E4CAAA0(v43, v45, &v54);
          sub_24E4D1EB0();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_24E4A6000, v37, v38, "Updated friends: %s) when expired", v39, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x25333CC90](v40, -1, -1);
          MEMORY[0x25333CC90](v39, -1, -1);
          swift_release();
        }
        else
        {
          swift_bridgeObjectRelease_n();

          swift_release();
        }
        break;
    }
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  char v46 = (uint64_t (*)(void))v0[1];
  return v46();
}

uint64_t sub_24E4C91A8(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 384) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = sub_24E4CA0F4;
  }
  else
  {
    *(void *)(v4 + 392) = a1;
    uint64_t v5 = sub_24E4C92D0;
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

uint64_t sub_24E4C92D0()
{
  unint64_t v24 = v0;
  uint64_t v1 = v0[49];
  uint64_t v3 = v0[43];
  uint64_t v2 = v0[44];
  uint64_t v4 = v0[41];
  uint64_t v22 = v0[42];
  uint64_t v5 = v0[39];
  uint64_t v6 = v0[40];
  uint64_t v7 = (void *)v0[28];
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v7;
  *(void *)(v8 + 24) = v1;
  v0[12] = sub_24E4D153C;
  v0[13] = v8;
  v0[8] = MEMORY[0x263EF8330];
  v0[9] = 1107296256;
  v0[10] = sub_24E4B0B08;
  v0[11] = &block_descriptor_330;
  uint64_t v9 = _Block_copy(v0 + 8);
  id v10 = v7;
  sub_24E4D1C40();
  v0[27] = MEMORY[0x263F8EE78];
  sub_24E4D13C4(&qword_26B1C1328, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C1338);
  sub_24E4CF1EC();
  sub_24E4D1EE0();
  MEMORY[0x25333C4D0](0, v2, v4, v9);
  _Block_release(v9);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v22);
  swift_release();
  if (qword_26B1C1318 != -1) {
    swift_once();
  }
  __swift_project_value_buffer(v0[35], (uint64_t)qword_26B1C13C0);
  swift_bridgeObjectRetain_n();
  uint64_t v11 = sub_24E4D1C00();
  os_log_type_t v12 = sub_24E4D1E20();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    uint64_t v23 = v14;
    *(_DWORD *)uint64_t v13 = 136315138;
    uint64_t v15 = sub_24E4D1900();
    uint64_t v16 = swift_bridgeObjectRetain();
    uint64_t v17 = MEMORY[0x25333C3B0](v16, v15);
    unint64_t v19 = v18;
    swift_bridgeObjectRelease();
    v0[22] = sub_24E4CAAA0(v17, v19, &v23);
    sub_24E4D1EB0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_24E4A6000, v11, v12, "Updated friends: %s) when expired", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25333CC90](v14, -1, -1);
    MEMORY[0x25333CC90](v13, -1, -1);
    swift_release();
  }
  else
  {
    swift_bridgeObjectRelease_n();

    swift_release();
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v20 = (uint64_t (*)(void))v0[1];
  return v20();
}

uint64_t sub_24E4C96C0(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 408) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = sub_24E4CA1B0;
  }
  else
  {
    *(void *)(v4 + 416) = a1;
    uint64_t v5 = sub_24E4C97E8;
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

uint64_t sub_24E4C97E8()
{
  unint64_t v24 = v0;
  uint64_t v1 = v0[52];
  uint64_t v3 = v0[43];
  uint64_t v2 = v0[44];
  uint64_t v4 = v0[41];
  uint64_t v22 = v0[42];
  uint64_t v5 = v0[39];
  uint64_t v6 = v0[40];
  uint64_t v7 = (void *)v0[28];
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v7;
  *(void *)(v8 + 24) = v1;
  v0[18] = sub_24E4D1538;
  v0[19] = v8;
  v0[14] = MEMORY[0x263EF8330];
  v0[15] = 1107296256;
  v0[16] = sub_24E4B0B08;
  v0[17] = &block_descriptor_323;
  uint64_t v9 = _Block_copy(v0 + 14);
  id v10 = v7;
  sub_24E4D1C40();
  v0[25] = MEMORY[0x263F8EE78];
  sub_24E4D13C4(&qword_26B1C1328, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C1338);
  sub_24E4CF1EC();
  sub_24E4D1EE0();
  MEMORY[0x25333C4D0](0, v2, v4, v9);
  _Block_release(v9);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v22);
  swift_release();
  if (qword_26B1C1318 != -1) {
    swift_once();
  }
  __swift_project_value_buffer(v0[35], (uint64_t)qword_26B1C13C0);
  swift_bridgeObjectRetain_n();
  uint64_t v11 = sub_24E4D1C00();
  os_log_type_t v12 = sub_24E4D1E20();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    uint64_t v23 = v14;
    *(_DWORD *)uint64_t v13 = 136315138;
    uint64_t v15 = sub_24E4D1900();
    uint64_t v16 = swift_bridgeObjectRetain();
    uint64_t v17 = MEMORY[0x25333C3B0](v16, v15);
    unint64_t v19 = v18;
    swift_bridgeObjectRelease();
    v0[22] = sub_24E4CAAA0(v17, v19, &v23);
    sub_24E4D1EB0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_24E4A6000, v11, v12, "Updated friends: %s) when expired", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25333CC90](v14, -1, -1);
    MEMORY[0x25333CC90](v13, -1, -1);
    swift_release();
  }
  else
  {
    swift_bridgeObjectRelease_n();

    swift_release();
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v20 = (uint64_t (*)(void))v0[1];
  return v20();
}

uint64_t sub_24E4C9BD8(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 432) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = sub_24E4CA26C;
  }
  else
  {
    *(void *)(v4 + 440) = a1;
    uint64_t v5 = sub_24E4C9D00;
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

uint64_t sub_24E4C9D00()
{
  unint64_t v24 = v0;
  uint64_t v1 = v0[55];
  uint64_t v3 = v0[43];
  uint64_t v2 = v0[44];
  uint64_t v4 = v0[41];
  uint64_t v22 = v0[42];
  uint64_t v5 = v0[39];
  uint64_t v6 = v0[40];
  uint64_t v7 = (void *)v0[28];
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v7;
  *(void *)(v8 + 24) = v1;
  v0[6] = sub_24E4D1534;
  v0[7] = v8;
  v0[2] = MEMORY[0x263EF8330];
  v0[3] = 1107296256;
  v0[4] = sub_24E4B0B08;
  v0[5] = &block_descriptor_316;
  uint64_t v9 = _Block_copy(v0 + 2);
  id v10 = v7;
  sub_24E4D1C40();
  v0[23] = MEMORY[0x263F8EE78];
  sub_24E4D13C4(&qword_26B1C1328, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C1338);
  sub_24E4CF1EC();
  sub_24E4D1EE0();
  MEMORY[0x25333C4D0](0, v2, v4, v9);
  _Block_release(v9);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v22);
  swift_release();
  if (qword_26B1C1318 != -1) {
    swift_once();
  }
  __swift_project_value_buffer(v0[35], (uint64_t)qword_26B1C13C0);
  swift_bridgeObjectRetain_n();
  uint64_t v11 = sub_24E4D1C00();
  os_log_type_t v12 = sub_24E4D1E20();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    uint64_t v23 = v14;
    *(_DWORD *)uint64_t v13 = 136315138;
    uint64_t v15 = sub_24E4D1900();
    uint64_t v16 = swift_bridgeObjectRetain();
    uint64_t v17 = MEMORY[0x25333C3B0](v16, v15);
    unint64_t v19 = v18;
    swift_bridgeObjectRelease();
    v0[22] = sub_24E4CAAA0(v17, v19, &v23);
    sub_24E4D1EB0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_24E4A6000, v11, v12, "Updated friends: %s) when expired", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25333CC90](v14, -1, -1);
    MEMORY[0x25333CC90](v13, -1, -1);
    swift_release();
  }
  else
  {
    swift_bridgeObjectRelease_n();

    swift_release();
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v20 = (uint64_t (*)(void))v0[1];
  return v20();
}

uint64_t sub_24E4CA0F4()
{
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24E4CA1B0()
{
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24E4CA26C()
{
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24E4CA328(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_24E4D1DB0();
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_24E4D1DA0();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(void *)(a3 + 16)) {
      return swift_task_create();
    }
    goto LABEL_3;
  }
  sub_24E4B09A4(a1, &qword_26B1C1360);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_24E4D1D80();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

uint64_t sub_24E4CA4B0(uint64_t a1, uint64_t a2)
{
  return sub_24E4CBA10(a1, a2, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_24E4CA4C8);
}

unint64_t sub_24E4CA4C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t i = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    id v10 = (void *)(v9 + 16 * i);
    if ((*v10 != a1 || v10[1] != a2) && (sub_24E4D2010() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      unint64_t i = (i + 1) & v12;
      if ((*(void *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
      {
        uint64_t v13 = (void *)(v9 + 16 * i);
        if ((*v13 != a1 || v13[1] != a2) && (sub_24E4D2010() & 1) == 0)
        {
          for (unint64_t i = (i + 1) & v12; ((*(void *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v12)
          {
            uint64_t v15 = (void *)(v9 + 16 * i);
            if (*v15 == a1 && v15[1] == a2) {
              break;
            }
            if (sub_24E4D2010()) {
              break;
            }
          }
        }
      }
    }
  }
  return i;
}

unint64_t sub_24E4CA610(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698EDE90);
  uint64_t v2 = sub_24E4D1FD0();
  uint64_t v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_24E4D14B8(v6, (uint64_t)&v15, &qword_2698EDE98);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_24E4CBA10(v15, v16, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_24E4CA4C8);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *uint64_t v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_24E4D151C(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 48;
    if (!--v4)
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

uint64_t sub_24E4CA75C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  *uint64_t v4 = v3;
  v4[1] = sub_24E4B0B04;
  return v6();
}

uint64_t sub_24E4CA828(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  *uint64_t v5 = v4;
  v5[1] = sub_24E4B0B04;
  return v7();
}

uint64_t sub_24E4CA8F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24E4D1DB0();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_24E4D1DA0();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_24E4B09A4(a1, &qword_26B1C1360);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_24E4D1D80();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_24E4CAAA0(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_24E4CAB74(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_24E4D145C((uint64_t)v12, *a3);
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
      sub_24E4D145C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_24E4CAB74(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_24E4D1EC0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_24E4CAD30(a5, a6);
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
  uint64_t v8 = sub_24E4D1F20();
  if (!v8)
  {
    sub_24E4D1F70();
    __break(1u);
LABEL_17:
    uint64_t result = sub_24E4D1FE0();
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

uint64_t sub_24E4CAD30(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_24E4CADC8(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_24E4CAFA8(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_24E4CAFA8(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_24E4CADC8(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_24E4CAF40(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_24E4D1F00();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_24E4D1F70();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_24E4D1D00();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_24E4D1FE0();
    __break(1u);
LABEL_14:
    uint64_t result = sub_24E4D1F70();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_24E4CAF40(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C12F0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_24E4CAFA8(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C12F0);
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
  BOOL v13 = a4 + 32;
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
  uint64_t result = sub_24E4D1FE0();
  __break(1u);
  return result;
}

uint64_t sub_24E4CB0F8(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_24E4CB170(a1, a2, a3, (void *)*v3, &qword_26B1C12E8, MEMORY[0x263F3CF58]);
  *unint64_t v3 = result;
  return result;
}

uint64_t sub_24E4CB134(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_24E4CB170(a1, a2, a3, (void *)*v3, &qword_2698EDE38, MEMORY[0x263F3CF40]);
  *unint64_t v3 = result;
  return result;
}

uint64_t sub_24E4CB170(char a1, int64_t a2, char a3, void *a4, uint64_t *a5, uint64_t (*a6)(void))
{
  if (a3)
  {
    unint64_t v9 = a4[3];
    int64_t v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
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
    uint64_t v16 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(a5);
  uint64_t v13 = *(void *)(a6(0) - 8);
  uint64_t v14 = *(void *)(v13 + 72);
  unint64_t v15 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  uint64_t v16 = (void *)swift_allocObject();
  size_t v17 = _swift_stdlib_malloc_size(v16);
  if (!v14)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v17 - v15 == 0x8000000000000000 && v14 == -1) {
    goto LABEL_34;
  }
  v16[2] = v11;
  v16[3] = 2 * ((uint64_t)(v17 - v15) / v14);
LABEL_19:
  uint64_t v19 = *(void *)(a6(0) - 8);
  unint64_t v20 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  uint64_t v21 = (char *)v16 + v20;
  uint64_t v22 = (char *)a4 + v20;
  if (a1)
  {
    if (v16 < a4 || v21 >= &v22[*(void *)(v19 + 72) * v11])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v16 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  uint64_t v23 = *(void *)(v19 + 72) * v11;
  unint64_t v24 = &v21[v23];
  unint64_t v25 = (unint64_t)&v22[v23];
  if (v22 >= v24 || (unint64_t)v21 >= v25)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v16;
  }
LABEL_36:
  uint64_t result = sub_24E4D1FE0();
  __break(1u);
  return result;
}

uint64_t sub_24E4CB3B8(unint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *v1;
  if ((v4 & 0xC000000000000001) == 0)
  {
LABEL_8:
    swift_bridgeObjectRetain();
    a1 = sub_24E4CB9CC(a1);
    char v13 = v12;
    swift_bridgeObjectRelease();
    if (v13)
    {
      int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v9 = *v2;
      uint64_t v17 = *v2;
      *uint64_t v2 = 0x8000000000000000;
      if (!isUniquelyReferenced_nonNull_native)
      {
        sub_24E4CCD38();
        uint64_t v9 = v17;
      }
      goto LABEL_11;
    }
    return 0;
  }
  if (v4 < 0) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = v4 & 0xFFFFFFFFFFFFFF8;
  }
  swift_bridgeObjectRetain();
  id v6 = (id)a1;
  uint64_t v7 = sub_24E4D1F50();

  if (!v7)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  swift_unknownObjectRelease();
  uint64_t v8 = sub_24E4D1F40();
  uint64_t v9 = sub_24E4CB778(v5, v8);
  swift_retain();
  a1 = sub_24E4CB9CC((uint64_t)v6);
  char v11 = v10;
  swift_release();
  if ((v11 & 1) == 0)
  {
    __break(1u);
    goto LABEL_8;
  }
LABEL_11:

  uint64_t v15 = *(void *)(*(void *)(v9 + 56) + 8 * a1);
  sub_24E4CC1E8(a1, v9);
  *uint64_t v2 = v9;
  swift_bridgeObjectRelease();
  return v15;
}

uint64_t sub_24E4CB508@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4 = v3;
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_24E4CBA10(a1, a2, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_24E4CCA94);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if (a2)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v11 = *v4;
    uint64_t v21 = *v4;
    *uint64_t v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_24E4CCEE0();
      uint64_t v11 = v21;
    }
    swift_bridgeObjectRelease();
    uint64_t v12 = *(void *)(v11 + 56);
    uint64_t v13 = sub_24E4D1900();
    uint64_t v20 = *(void *)(v13 - 8);
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v20 + 32))(a3, v12 + *(void *)(v20 + 72) * v8, v13);
    sub_24E4CC39C(v8, v11);
    *uint64_t v4 = v11;
    swift_bridgeObjectRelease();
    uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v20 + 56);
    uint64_t v15 = a3;
    uint64_t v16 = 0;
    uint64_t v17 = v13;
  }
  else
  {
    uint64_t v18 = sub_24E4D1900();
    uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56);
    uint64_t v17 = v18;
    uint64_t v15 = a3;
    uint64_t v16 = 1;
  }

  return v14(v15, v16, 1, v17);
}

uint64_t sub_24E4CB6C4(uint64_t a1, void *a2)
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
    uint64_t result = sub_24E4D1F40();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    *unint64_t v3 = sub_24E4CB778(v7, result + 1);
  }
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v10 = *v3;
  *unint64_t v3 = 0x8000000000000000;
  sub_24E4CC5AC(a1, a2, isUniquelyReferenced_nonNull_native);
  *unint64_t v3 = v10;

  return swift_bridgeObjectRelease();
}

uint64_t sub_24E4CB778(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2698EDE68);
    uint64_t v2 = sub_24E4D1FC0();
    uint64_t v18 = v2;
    sub_24E4D1F30();
    uint64_t v3 = sub_24E4D1F60();
    if (v3)
    {
      uint64_t v4 = v3;
      sub_24E4D0CB4(0, &qword_26B1C12E0);
      do
      {
        swift_dynamicCast();
        sub_24E4D0CB4(0, &qword_2698EDE50);
        swift_dynamicCast();
        uint64_t v2 = v18;
        unint64_t v12 = *(void *)(v18 + 16);
        if (*(void *)(v18 + 24) <= v12)
        {
          sub_24E4CBB2C(v12 + 1, 1);
          uint64_t v2 = v18;
        }
        uint64_t result = sub_24E4D1E80();
        uint64_t v6 = v2 + 64;
        uint64_t v7 = -1 << *(unsigned char *)(v2 + 32);
        unint64_t v8 = result & ~v7;
        unint64_t v9 = v8 >> 6;
        if (((-1 << v8) & ~*(void *)(v2 + 64 + 8 * (v8 >> 6))) != 0)
        {
          unint64_t v10 = __clz(__rbit64((-1 << v8) & ~*(void *)(v2 + 64 + 8 * (v8 >> 6)))) | v8 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          char v13 = 0;
          unint64_t v14 = (unint64_t)(63 - v7) >> 6;
          do
          {
            if (++v9 == v14 && (v13 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            BOOL v15 = v9 == v14;
            if (v9 == v14) {
              unint64_t v9 = 0;
            }
            v13 |= v15;
            uint64_t v16 = *(void *)(v6 + 8 * v9);
          }
          while (v16 == -1);
          unint64_t v10 = __clz(__rbit64(~v16)) + (v9 << 6);
        }
        *(void *)(v6 + ((v10 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v10;
        uint64_t v11 = 8 * v10;
        *(void *)(*(void *)(v2 + 48) + v11) = v17;
        *(void *)(*(void *)(v2 + 56) + v11) = v4;
        ++*(void *)(v2 + 16);
        uint64_t v4 = sub_24E4D1F60();
      }
      while (v4);
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return MEMORY[0x263F8EE80];
  }
  return v2;
}

unint64_t sub_24E4CB9CC(uint64_t a1)
{
  uint64_t v2 = sub_24E4D1E80();

  return sub_24E4CC978(a1, v2);
}

uint64_t sub_24E4CBA10(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, uint64_t))
{
  sub_24E4D2060();
  sub_24E4D1CF0();
  uint64_t v5 = sub_24E4D2070();

  return a3(a1, a2, v5);
}

unint64_t sub_24E4CBA94(uint64_t a1)
{
  sub_24E4D1980();
  sub_24E4D13C4(&qword_2698EDDE8, MEMORY[0x263F3CF90]);
  uint64_t v2 = sub_24E4D1C70();

  return sub_24E4CCB78(a1, v2);
}

uint64_t sub_24E4CBB2C(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698EDE68);
  uint64_t v6 = sub_24E4D1FB0();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  unint64_t v36 = v2;
  uint64_t v37 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v11 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v12 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v20 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v21 = v20 | (v14 << 6);
      goto LABEL_31;
    }
    int64_t v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v11) {
      break;
    }
    uint64_t v23 = (void *)(v5 + 64);
    unint64_t v24 = *(void *)(v37 + 8 * v22);
    ++v14;
    if (!v24)
    {
      int64_t v14 = v22 + 1;
      if (v22 + 1 >= v11) {
        goto LABEL_33;
      }
      unint64_t v24 = *(void *)(v37 + 8 * v14);
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v11)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v36;
          if ((a2 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v24 = *(void *)(v37 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            int64_t v14 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_42;
            }
            if (v14 >= v11) {
              goto LABEL_33;
            }
            unint64_t v24 = *(void *)(v37 + 8 * v14);
            ++v25;
            if (v24) {
              goto LABEL_30;
            }
          }
        }
        int64_t v14 = v25;
      }
    }
LABEL_30:
    unint64_t v10 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_31:
    uint64_t v30 = 8 * v21;
    uint64_t v31 = *(void **)(*(void *)(v5 + 48) + v30);
    uint64_t v32 = *(void **)(*(void *)(v5 + 56) + v30);
    if ((a2 & 1) == 0)
    {
      id v33 = v31;
      id v34 = v32;
    }
    uint64_t result = sub_24E4D1E80();
    uint64_t v15 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v16 = result & ~v15;
    unint64_t v17 = v16 >> 6;
    if (((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
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
        uint64_t v29 = *(void *)(v12 + 8 * v17);
      }
      while (v29 == -1);
      unint64_t v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }
    *(void *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    uint64_t v19 = 8 * v18;
    *(void *)(*(void *)(v7 + 48) + v19) = v31;
    *(void *)(*(void *)(v7 + 56) + v19) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v36;
  uint64_t v23 = (void *)(v5 + 64);
  if ((a2 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v35 = 1 << *(unsigned char *)(v5 + 32);
  if (v35 >= 64) {
    bzero(v23, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v23 = -1 << v35;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_24E4CBE00(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v49 = sub_24E4D1900();
  uint64_t v5 = *(void *)(v49 - 8);
  MEMORY[0x270FA5388](v49);
  uint64_t v48 = (char *)&v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698EDE30);
  int v47 = a2;
  uint64_t v8 = sub_24E4D1FB0();
  uint64_t v9 = v8;
  if (!*(void *)(v7 + 16)) {
    goto LABEL_41;
  }
  uint64_t v10 = 1 << *(unsigned char *)(v7 + 32);
  uint64_t v11 = *(void *)(v7 + 64);
  unint64_t v44 = (void *)(v7 + 64);
  if (v10 < 64) {
    uint64_t v12 = ~(-1 << v10);
  }
  else {
    uint64_t v12 = -1;
  }
  unint64_t v13 = v12 & v11;
  uint64_t v42 = v2;
  int64_t v43 = (unint64_t)(v10 + 63) >> 6;
  unint64_t v45 = (void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  uint64_t v46 = v5;
  int64_t v14 = (void (**)(char *, uint64_t, uint64_t))(v5 + 32);
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
          uint64_t v3 = v42;
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
    BOOL v28 = (uint64_t *)(*(void *)(v7 + 48) + 16 * v21);
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
    sub_24E4D2060();
    sub_24E4D1CF0();
    uint64_t result = sub_24E4D2070();
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
    uint64_t v19 = (void *)(*(void *)(v9 + 48) + 16 * v18);
    *uint64_t v19 = v29;
    v19[1] = v30;
    uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))*v14)(*(void *)(v9 + 56) + v31 * v18, v48, v49);
    ++*(void *)(v9 + 16);
    uint64_t v7 = v27;
  }
  swift_release();
  uint64_t v3 = v42;
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
    void *v23 = -1 << v40;
  }
  *(void *)(v7 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v9;
  return result;
}

void sub_24E4CC1E8(unint64_t a1, uint64_t a2)
{
  int64_t v3 = a1;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (a1 + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t v8 = sub_24E4D1EF0();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v9 = (v8 + 1) & v7;
      do
      {
        id v10 = *(id *)(*(void *)(a2 + 48) + 8 * v6);
        uint64_t v11 = sub_24E4D1E80();

        unint64_t v12 = v11 & v7;
        if (v3 >= (uint64_t)v9)
        {
          if (v12 >= v9 && v3 >= (uint64_t)v12)
          {
LABEL_16:
            uint64_t v15 = *(void *)(a2 + 48);
            unint64_t v16 = (void *)(v15 + 8 * v3);
            int64_t v17 = (void *)(v15 + 8 * v6);
            if (v3 != v6 || v16 >= v17 + 1) {
              *unint64_t v16 = *v17;
            }
            uint64_t v18 = *(void *)(a2 + 56);
            uint64_t v19 = (void *)(v18 + 8 * v3);
            unint64_t v20 = (void *)(v18 + 8 * v6);
            if (v3 != v6 || (int64_t v3 = v6, v19 >= v20 + 1))
            {
              *uint64_t v19 = *v20;
              int64_t v3 = v6;
            }
          }
        }
        else if (v12 >= v9 || v3 >= (uint64_t)v12)
        {
          goto LABEL_16;
        }
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    unint64_t v21 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v22 = *v21;
    uint64_t v23 = (-1 << v3) - 1;
  }
  else
  {
    unint64_t v21 = (uint64_t *)(v4 + 8 * (a1 >> 6));
    uint64_t v23 = *v21;
    uint64_t v22 = (-1 << a1) - 1;
  }
  uint64_t *v21 = v23 & v22;
  uint64_t v24 = *(void *)(a2 + 16);
  BOOL v25 = __OFSUB__(v24, 1);
  uint64_t v26 = v24 - 1;
  if (v25)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v26;
    ++*(_DWORD *)(a2 + 36);
  }
}

unint64_t sub_24E4CC39C(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_24E4D1EF0();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      while (1)
      {
        sub_24E4D2060();
        swift_bridgeObjectRetain();
        sub_24E4D1CF0();
        uint64_t v9 = sub_24E4D2070();
        uint64_t result = swift_bridgeObjectRelease();
        unint64_t v10 = v9 & v7;
        if (v3 >= (uint64_t)v8) {
          break;
        }
        if (v10 < v8) {
          goto LABEL_11;
        }
LABEL_12:
        uint64_t v11 = *(void *)(a2 + 48);
        unint64_t v12 = (_OWORD *)(v11 + 16 * v3);
        unint64_t v13 = (_OWORD *)(v11 + 16 * v6);
        if (v3 != v6 || v12 >= v13 + 1) {
          _OWORD *v12 = *v13;
        }
        uint64_t v14 = *(void *)(a2 + 56);
        uint64_t v15 = *(void *)(*(void *)(sub_24E4D1900() - 8) + 72);
        int64_t v16 = v15 * v3;
        uint64_t result = v14 + v15 * v3;
        int64_t v17 = v15 * v6;
        unint64_t v18 = v14 + v15 * v6 + v15;
        if (v16 < v17 || result >= v18)
        {
          uint64_t result = swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          int64_t v3 = v6;
          if (v16 == v17) {
            goto LABEL_6;
          }
          uint64_t result = swift_arrayInitWithTakeBackToFront();
        }
        int64_t v3 = v6;
LABEL_6:
        unint64_t v6 = (v6 + 1) & v7;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          goto LABEL_21;
        }
      }
      if (v10 < v8) {
        goto LABEL_6;
      }
LABEL_11:
      if (v3 < (uint64_t)v10) {
        goto LABEL_6;
      }
      goto LABEL_12;
    }
LABEL_21:
    unint64_t v20 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v21 = *v20;
    uint64_t v22 = (-1 << v3) - 1;
  }
  else
  {
    unint64_t v20 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v22 = *v20;
    uint64_t v21 = (-1 << result) - 1;
  }
  *unint64_t v20 = v22 & v21;
  uint64_t v23 = *(void *)(a2 + 16);
  BOOL v24 = __OFSUB__(v23, 1);
  uint64_t v25 = v23 - 1;
  if (v24)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v25;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

void sub_24E4CC5AC(uint64_t a1, void *a2, char a3)
{
  uint64_t v4 = v3;
  uint64_t v7 = *v3;
  unint64_t v9 = sub_24E4CB9CC((uint64_t)a2);
  uint64_t v10 = *(void *)(v7 + 16);
  BOOL v11 = (v8 & 1) == 0;
  uint64_t v12 = v10 + v11;
  if (__OFADD__(v10, v11))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v13 = v8;
  uint64_t v14 = *(void *)(v7 + 24);
  if (v14 >= v12 && (a3 & 1) != 0) {
    goto LABEL_7;
  }
  if (v14 >= v12 && (a3 & 1) == 0)
  {
    sub_24E4CCD38();
LABEL_7:
    uint64_t v15 = (void *)*v4;
    if (v13)
    {
LABEL_8:
      uint64_t v16 = v15[7];

      *(void *)(v16 + 8 * v9) = a1;
      return;
    }
    goto LABEL_11;
  }
  sub_24E4CBB2C(v12, a3 & 1);
  unint64_t v17 = sub_24E4CB9CC((uint64_t)a2);
  if ((v13 & 1) != (v18 & 1))
  {
LABEL_17:
    sub_24E4D0CB4(0, &qword_26B1C12E0);
    sub_24E4D2020();
    __break(1u);
    return;
  }
  unint64_t v9 = v17;
  uint64_t v15 = (void *)*v4;
  if (v13) {
    goto LABEL_8;
  }
LABEL_11:
  v15[(v9 >> 6) + 8] |= 1 << v9;
  uint64_t v19 = 8 * v9;
  *(void *)(v15[6] + v19) = a2;
  *(void *)(v15[7] + v19) = a1;
  uint64_t v20 = v15[2];
  BOOL v21 = __OFADD__(v20, 1);
  uint64_t v22 = v20 + 1;
  if (v21)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v15[2] = v22;

  id v23 = a2;
}

uint64_t sub_24E4CC720(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  uint64_t v10 = (void *)*v4;
  unint64_t v12 = sub_24E4CBA10(a2, a3, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_24E4CCA94);
  uint64_t v13 = v10[2];
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_17;
  }
  char v16 = v11;
  uint64_t v17 = v10[3];
  if (v17 < v15 || (a4 & 1) == 0)
  {
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_24E4CCEE0();
      goto LABEL_7;
    }
    sub_24E4CBE00(v15, a4 & 1);
    uint64_t v26 = sub_24E4CBA10(a2, a3, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_24E4CCA94);
    if ((v16 & 1) == (v27 & 1))
    {
      unint64_t v12 = v26;
      char v18 = *v5;
      if (v16) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    uint64_t result = sub_24E4D2020();
    __break(1u);
    return result;
  }
LABEL_7:
  char v18 = *v5;
  if (v16)
  {
LABEL_8:
    uint64_t v19 = v18[7];
    uint64_t v20 = sub_24E4D1900();
    uint64_t v21 = *(void *)(v20 - 8);
    uint64_t v22 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v21 + 40);
    uint64_t v23 = v20;
    uint64_t v24 = v19 + *(void *)(v21 + 72) * v12;
    return v22(v24, a1, v23);
  }
LABEL_13:
  sub_24E4CC8C8(v12, a2, a3, a1, v18);

  return swift_bridgeObjectRetain();
}

uint64_t sub_24E4CC8C8(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  char v8 = (void *)(a5[6] + 16 * a1);
  void *v8 = a2;
  v8[1] = a3;
  uint64_t v9 = a5[7];
  uint64_t v10 = sub_24E4D1900();
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v9 + *(void *)(*(void *)(v10 - 8) + 72) * a1, a4, v10);
  uint64_t v12 = a5[2];
  BOOL v13 = __OFADD__(v12, 1);
  uint64_t v14 = v12 + 1;
  if (v13) {
    __break(1u);
  }
  else {
    a5[2] = v14;
  }
  return result;
}

unint64_t sub_24E4CC978(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t i = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    sub_24E4D0CB4(0, &qword_26B1C12E0);
    id v6 = *(id *)(*(void *)(v2 + 48) + 8 * i);
    char v7 = sub_24E4D1E90();

    if ((v7 & 1) == 0)
    {
      uint64_t v8 = ~v4;
      for (unint64_t i = (i + 1) & v8; ((*(void *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v8)
      {
        id v9 = *(id *)(*(void *)(v2 + 48) + 8 * i);
        char v10 = sub_24E4D1E90();

        if (v10) {
          break;
        }
      }
    }
  }
  return i;
}

unint64_t sub_24E4CCA94(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    char v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_24E4D2010() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        BOOL v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_24E4D2010() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_24E4CCB78(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = a1;
  uint64_t v4 = sub_24E4D1980();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  char v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = v2;
  uint64_t v8 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v9 = a2 & ~v8;
  uint64_t v18 = v2 + 64;
  if ((*(void *)(v2 + 64 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9))
  {
    uint64_t v10 = ~v8;
    BOOL v13 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
    uint64_t v12 = v5 + 16;
    BOOL v11 = v13;
    uint64_t v14 = *(void *)(v12 + 56);
    do
    {
      v11(v7, *(void *)(v20 + 48) + v14 * v9, v4);
      sub_24E4D13C4(&qword_2698EDDF0, MEMORY[0x263F3CF90]);
      char v15 = sub_24E4D1CA0();
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

id sub_24E4CCD38()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698EDE68);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_24E4D1FA0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    uint64_t *v1 = v4;
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
    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void **)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = *(void **)(*(void *)(v2 + 56) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    *(void *)(*(void *)(v4 + 56) + v16) = v18;
    id v19 = v17;
    id result = v18;
  }
  int64_t v22 = v20 + 2;
  if (v22 >= v13) {
    goto LABEL_26;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_24E4CCEE0()
{
  uint64_t v35 = sub_24E4D1900();
  uint64_t v1 = *(void *)(v35 - 8);
  MEMORY[0x270FA5388](v35);
  uint64_t v3 = (char *)&v29 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698EDE30);
  uint64_t v30 = v0;
  uint64_t v4 = *v0;
  uint64_t v5 = sub_24E4D1FA0();
  uint64_t v6 = *(void *)(v4 + 16);
  uint64_t v36 = v5;
  if (!v6)
  {
    id result = (void *)swift_release();
    uint64_t v28 = v36;
    char v27 = v30;
LABEL_25:
    *char v27 = v28;
    return result;
  }
  uint64_t v7 = v5;
  id result = (void *)(v5 + 64);
  unint64_t v9 = (unint64_t)((1 << *(unsigned char *)(v7 + 32)) + 63) >> 6;
  if (v7 != v4 || (unint64_t)result >= v4 + 64 + 8 * v9)
  {
    id result = memmove(result, (const void *)(v4 + 64), 8 * v9);
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
    uint64_t v18 = (uint64_t *)(*(void *)(v4 + 48) + 16 * v16);
    uint64_t v19 = *v18;
    uint64_t v20 = v18[1];
    unint64_t v21 = *(void *)(v1 + 72) * v16;
    (*(void (**)(char *, unint64_t, uint64_t))(v1 + 16))(v3, *(void *)(v4 + 56) + v21, v14);
    uint64_t v22 = v36;
    uint64_t v23 = (void *)(*(void *)(v36 + 48) + v17);
    void *v23 = v19;
    v23[1] = v20;
    (*(void (**)(unint64_t, char *, uint64_t))(v1 + 32))(*(void *)(v22 + 56) + v21, v3, v14);
    id result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v26 = v24 + 2;
  if (v26 >= v32)
  {
LABEL_23:
    id result = (void *)swift_release();
    char v27 = v30;
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

size_t sub_24E4CD1A4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698EDE38);
  uint64_t v3 = *(void *)(sub_24E4D1900() - 8);
  uint64_t v4 = *(void *)(v3 + 72);
  unint64_t v5 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v6 = (void *)swift_allocObject();
  size_t result = _swift_stdlib_malloc_size(v6);
  if (v4)
  {
    if (result - v5 != 0x8000000000000000 || v4 != -1)
    {
      v6[2] = v1;
      v6[3] = 2 * ((uint64_t)(result - v5) / v4);
      uint64_t v9 = sub_24E4CDD38(&v10, (uint64_t)v6 + v5, v1, a1);
      swift_bridgeObjectRetain();
      sub_24E4D099C();
      if (v9 == v1) {
        return (size_t)v6;
      }
      __break(1u);
      return MEMORY[0x263F8EE78];
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_24E4CD2F8(uint64_t isStackAllocationSafe, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = (uint64_t (*)(char *, char *))isStackAllocationSafe;
  v13[1] = *MEMORY[0x263EF8340];
  char v7 = *(unsigned char *)(a3 + 32);
  unint64_t v8 = (unint64_t)((1 << v7) + 63) >> 6;
  size_t v9 = 8 * v8;
  if ((v7 & 0x3Fu) <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x270FA5388](isStackAllocationSafe);
    bzero((char *)v13 - ((v9 + 15) & 0x3FFFFFFFFFFFFFF0), v9);
    uint64_t v10 = sub_24E4CD470((void *)((char *)v13 - ((v9 + 15) & 0x3FFFFFFFFFFFFFF0)), v8, (void *)a3, v6);
    if (v3) {
      swift_willThrow();
    }
    else {
      return v10;
    }
  }
  else
  {
    uint64_t v11 = (void *)swift_slowAlloc();
    bzero(v11, v9);
    a2 = sub_24E4CD470((unint64_t *)v11, v8, (void *)a3, v6);
    MEMORY[0x25333CC90](v11, -1, -1);
  }
  return a2;
}

uint64_t sub_24E4CD470(unint64_t *a1, uint64_t a2, void *a3, uint64_t (*a4)(char *, char *))
{
  unint64_t v45 = a4;
  uint64_t v33 = a2;
  uint64_t v34 = a1;
  uint64_t v44 = sub_24E4D16F0();
  uint64_t v5 = *(void *)(v44 - 8);
  MEMORY[0x270FA5388](v44);
  int v47 = (char *)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_24E4D1980();
  uint64_t result = MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = 0;
  int64_t v13 = 0;
  uint64_t v46 = a3;
  uint64_t v16 = a3[8];
  unint64_t v15 = a3 + 8;
  uint64_t v14 = v16;
  uint64_t v17 = 1 << *((unsigned char *)v15 - 32);
  uint64_t v18 = -1;
  if (v17 < 64) {
    uint64_t v18 = ~(-1 << v17);
  }
  unint64_t v19 = v18 & v14;
  uint64_t v36 = v15;
  int64_t v37 = (unint64_t)(v17 + 63) >> 6;
  uint64_t v38 = v5 + 16;
  uint64_t v39 = v9 + 16;
  uint64_t v42 = v9;
  uint64_t v43 = v5;
  uint64_t v40 = (void (**)(char *, uint64_t))(v5 + 8);
  uint64_t v41 = (uint64_t (**)(char *, uint64_t))(v9 + 8);
  uint64_t v20 = v44;
LABEL_4:
  uint64_t v35 = v12;
  while (v19)
  {
    unint64_t v21 = __clz(__rbit64(v19));
    v19 &= v19 - 1;
    unint64_t v22 = v21 | (v13 << 6);
    uint64_t v23 = v47;
LABEL_18:
    char v27 = v46;
    (*(void (**)(char *, unint64_t, uint64_t))(v42 + 16))(v11, v46[6] + *(void *)(v42 + 72) * v22, v7);
    (*(void (**)(char *, unint64_t, uint64_t))(v43 + 16))(v23, v27[7] + *(void *)(v43 + 72) * v22, v20);
    uint64_t v28 = v48;
    char v29 = v45(v11, v23);
    uint64_t v48 = v28;
    if (v28) {
      goto LABEL_28;
    }
    char v30 = v29;
    (*v40)(v23, v20);
    uint64_t result = (*v41)(v11, v7);
    if (v30)
    {
      uint64_t v31 = v35;
      *(unint64_t *)((char *)v34 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v22;
      BOOL v24 = __OFADD__(v31, 1);
      uint64_t v12 = v31 + 1;
      if (!v24) {
        goto LABEL_4;
      }
      __break(1u);
LABEL_28:
      (*v40)(v23, v20);
      return (*v41)(v11, v7);
    }
  }
  BOOL v24 = __OFADD__(v13++, 1);
  uint64_t v23 = v47;
  if (v24)
  {
    __break(1u);
    goto LABEL_32;
  }
  if (v13 >= v37) {
    return sub_24E4CD840(v34, v33, v35, v46);
  }
  unint64_t v25 = v36[v13];
  if (v25)
  {
LABEL_17:
    unint64_t v19 = (v25 - 1) & v25;
    unint64_t v22 = __clz(__rbit64(v25)) + (v13 << 6);
    goto LABEL_18;
  }
  int64_t v26 = v13 + 1;
  if (v13 + 1 >= v37) {
    return sub_24E4CD840(v34, v33, v35, v46);
  }
  unint64_t v25 = v36[v26];
  if (v25) {
    goto LABEL_16;
  }
  int64_t v26 = v13 + 2;
  if (v13 + 2 >= v37) {
    return sub_24E4CD840(v34, v33, v35, v46);
  }
  unint64_t v25 = v36[v26];
  if (v25) {
    goto LABEL_16;
  }
  int64_t v26 = v13 + 3;
  if (v13 + 3 >= v37) {
    return sub_24E4CD840(v34, v33, v35, v46);
  }
  unint64_t v25 = v36[v26];
  if (v25)
  {
LABEL_16:
    int64_t v13 = v26;
    goto LABEL_17;
  }
  while (1)
  {
    int64_t v13 = v26 + 1;
    if (__OFADD__(v26, 1)) {
      break;
    }
    if (v13 >= v37) {
      return sub_24E4CD840(v34, v33, v35, v46);
    }
    unint64_t v25 = v36[v13];
    ++v26;
    if (v25) {
      goto LABEL_17;
    }
  }
LABEL_32:
  __break(1u);
  return result;
}

uint64_t sub_24E4CD840(unint64_t *a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v64 = sub_24E4D16F0();
  uint64_t v56 = *(void *)(v64 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v64);
  uint64_t v63 = (char *)&v47 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v54 = (char *)&v47 - v10;
  uint64_t v11 = sub_24E4D1980();
  uint64_t v55 = *(void *)(v11 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v11);
  uint64_t v62 = (char *)&v47 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v53 = (char *)&v47 - v14;
  if (!a3) {
    return MEMORY[0x263F8EE80];
  }
  if (a4[2] == a3)
  {
    swift_retain();
    return (uint64_t)a4;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698EDE28);
  uint64_t result = sub_24E4D1FD0();
  uint64_t v16 = result;
  int v47 = a1;
  uint64_t v48 = a2;
  if (a2 < 1) {
    unint64_t v17 = 0;
  }
  else {
    unint64_t v17 = *a1;
  }
  uint64_t v18 = 0;
  uint64_t v51 = v55 + 16;
  uint64_t v52 = result;
  uint64_t v49 = a4;
  uint64_t v50 = v56 + 16;
  uint64_t v60 = v56 + 32;
  uint64_t v61 = v55 + 32;
  uint64_t v19 = result + 64;
  uint64_t v20 = v62;
  while (1)
  {
    uint64_t v59 = a3;
    if (v17)
    {
      uint64_t v57 = (v17 - 1) & v17;
      uint64_t v58 = v18;
      unint64_t v21 = __clz(__rbit64(v17)) | (v18 << 6);
    }
    else
    {
      uint64_t v22 = v18 + 1;
      if (__OFADD__(v18, 1)) {
        goto LABEL_40;
      }
      if (v22 >= v48) {
        return v16;
      }
      unint64_t v23 = v47[v22];
      uint64_t v24 = v18 + 1;
      if (!v23)
      {
        uint64_t v24 = v18 + 2;
        if (v18 + 2 >= v48) {
          return v16;
        }
        unint64_t v23 = v47[v24];
        if (!v23)
        {
          uint64_t v24 = v18 + 3;
          if (v18 + 3 >= v48) {
            return v16;
          }
          unint64_t v23 = v47[v24];
          if (!v23)
          {
            uint64_t v25 = v18 + 4;
            if (v18 + 4 >= v48) {
              return v16;
            }
            unint64_t v23 = v47[v25];
            if (!v23)
            {
              while (1)
              {
                uint64_t v24 = v25 + 1;
                if (__OFADD__(v25, 1)) {
                  goto LABEL_41;
                }
                if (v24 >= v48) {
                  return v16;
                }
                unint64_t v23 = v47[v24];
                ++v25;
                if (v23) {
                  goto LABEL_24;
                }
              }
            }
            uint64_t v24 = v18 + 4;
          }
        }
      }
LABEL_24:
      uint64_t v57 = (v23 - 1) & v23;
      uint64_t v58 = v24;
      unint64_t v21 = __clz(__rbit64(v23)) + (v24 << 6);
    }
    uint64_t v26 = v55;
    uint64_t v27 = *(void *)(v55 + 72);
    uint64_t v28 = v53;
    (*(void (**)(char *, unint64_t, uint64_t))(v55 + 16))(v53, a4[6] + v27 * v21, v11);
    uint64_t v29 = a4[7];
    uint64_t v30 = v56;
    uint64_t v31 = *(void *)(v56 + 72);
    uint64_t v32 = v29 + v31 * v21;
    uint64_t v33 = v11;
    uint64_t v34 = v54;
    uint64_t v35 = v64;
    (*(void (**)(char *, uint64_t, uint64_t))(v56 + 16))(v54, v32, v64);
    uint64_t v36 = *(void (**)(char *, char *, uint64_t))(v26 + 32);
    v36(v20, v28, v33);
    int64_t v37 = *(void (**)(char *, char *, uint64_t))(v30 + 32);
    uint64_t v38 = v34;
    uint64_t v11 = v33;
    v37(v63, v38, v35);
    uint64_t v16 = v52;
    sub_24E4D13C4(&qword_2698EDDE8, MEMORY[0x263F3CF90]);
    uint64_t result = sub_24E4D1C70();
    uint64_t v39 = -1 << *(unsigned char *)(v16 + 32);
    unint64_t v40 = result & ~v39;
    unint64_t v41 = v40 >> 6;
    if (((-1 << v40) & ~*(void *)(v19 + 8 * (v40 >> 6))) != 0)
    {
      unint64_t v42 = __clz(__rbit64((-1 << v40) & ~*(void *)(v19 + 8 * (v40 >> 6)))) | v40 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v43 = 0;
      unint64_t v44 = (unint64_t)(63 - v39) >> 6;
      do
      {
        if (++v41 == v44 && (v43 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        BOOL v45 = v41 == v44;
        if (v41 == v44) {
          unint64_t v41 = 0;
        }
        v43 |= v45;
        uint64_t v46 = *(void *)(v19 + 8 * v41);
      }
      while (v46 == -1);
      unint64_t v42 = __clz(__rbit64(~v46)) + (v41 << 6);
    }
    *(void *)(v19 + ((v42 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v42;
    v36((char *)(*(void *)(v16 + 48) + v42 * v27), v62, v11);
    uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))v37)(*(void *)(v16 + 56) + v42 * v31, v63, v64);
    ++*(void *)(v16 + 16);
    a3 = v59 - 1;
    if (__OFSUB__(v59, 1)) {
      break;
    }
    a4 = v49;
    unint64_t v17 = v57;
    uint64_t v18 = v58;
    if (v59 == 1) {
      return v16;
    }
  }
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_24E4CDD38(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = sub_24E4D1900();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  unint64_t v42 = (char *)&v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = MEMORY[0x270FA5388](v10);
  unint64_t v41 = (char *)&v32 - v13;
  uint64_t v43 = a4;
  uint64_t v16 = *(void *)(a4 + 64);
  uint64_t v15 = a4 + 64;
  uint64_t v14 = v16;
  uint64_t v37 = v15;
  uint64_t v17 = -1 << *(unsigned char *)(v15 - 32);
  if (-v17 < 64) {
    uint64_t v18 = ~(-1 << -(char)v17);
  }
  else {
    uint64_t v18 = -1;
  }
  unint64_t v19 = v18 & v14;
  if (!a2)
  {
    int64_t v20 = 0;
    a3 = 0;
LABEL_38:
    uint64_t v31 = v37;
    *a1 = v43;
    a1[1] = v31;
    a1[2] = ~v17;
    a1[3] = v20;
    a1[4] = v19;
    return a3;
  }
  if (!a3)
  {
    int64_t v20 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  uint64_t v34 = -1 << *(unsigned char *)(v15 - 32);
  uint64_t v35 = a1;
  int64_t v20 = 0;
  uint64_t v21 = 0;
  uint64_t v38 = v9 + 32;
  uint64_t v39 = v9 + 16;
  int64_t v36 = (unint64_t)(63 - v17) >> 6;
  int64_t v33 = v36 - 1;
  uint64_t v40 = a3;
  uint64_t v22 = v41;
  if (!v19) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v23 = __clz(__rbit64(v19));
  v19 &= v19 - 1;
  unint64_t v24 = v23 | (v20 << 6);
  while (1)
  {
    ++v21;
    uint64_t v28 = v42;
    uint64_t v29 = *(void *)(v9 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v9 + 16))(v42, *(void *)(v43 + 56) + v29 * v24, v8);
    uint64_t v30 = *(void (**)(char *, char *, uint64_t))(v9 + 32);
    v30(v22, v28, v8);
    uint64_t result = ((uint64_t (*)(uint64_t, char *, uint64_t))v30)(a2, v22, v8);
    a3 = v40;
    if (v21 == v40) {
      goto LABEL_37;
    }
    a2 += v29;
    if (v19) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v25 = v20 + 1;
    if (__OFADD__(v20, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v25 >= v36) {
      goto LABEL_32;
    }
    unint64_t v26 = *(void *)(v37 + 8 * v25);
    if (!v26) {
      break;
    }
LABEL_18:
    unint64_t v19 = (v26 - 1) & v26;
    unint64_t v24 = __clz(__rbit64(v26)) + (v25 << 6);
    int64_t v20 = v25;
  }
  v20 += 2;
  if (v25 + 1 >= v36)
  {
    unint64_t v19 = 0;
    int64_t v20 = v25;
    goto LABEL_36;
  }
  unint64_t v26 = *(void *)(v37 + 8 * v20);
  if (v26) {
    goto LABEL_14;
  }
  int64_t v27 = v25 + 2;
  if (v25 + 2 >= v36) {
    goto LABEL_32;
  }
  unint64_t v26 = *(void *)(v37 + 8 * v27);
  if (v26) {
    goto LABEL_17;
  }
  int64_t v20 = v25 + 3;
  if (v25 + 3 >= v36)
  {
    unint64_t v19 = 0;
    int64_t v20 = v25 + 2;
    goto LABEL_36;
  }
  unint64_t v26 = *(void *)(v37 + 8 * v20);
  if (v26)
  {
LABEL_14:
    int64_t v25 = v20;
    goto LABEL_18;
  }
  int64_t v27 = v25 + 4;
  if (v25 + 4 >= v36)
  {
LABEL_32:
    unint64_t v19 = 0;
LABEL_36:
    a3 = v21;
LABEL_37:
    uint64_t v17 = v34;
    a1 = v35;
    goto LABEL_38;
  }
  unint64_t v26 = *(void *)(v37 + 8 * v27);
  if (v26)
  {
LABEL_17:
    int64_t v25 = v27;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v25 = v27 + 1;
    if (__OFADD__(v27, 1)) {
      break;
    }
    if (v25 >= v36)
    {
      unint64_t v19 = 0;
      int64_t v20 = v33;
      goto LABEL_36;
    }
    unint64_t v26 = *(void *)(v37 + 8 * v25);
    ++v27;
    if (v26) {
      goto LABEL_18;
    }
  }
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_24E4CE080(uint64_t a1, char a2)
{
  *(unsigned char *)(v3 + 196) = a2;
  *(void *)(v3 + 56) = a1;
  *(void *)(v3 + 64) = v2;
  *(void *)(v3 + 72) = swift_getObjectType();
  uint64_t v4 = sub_24E4D1700();
  *(void *)(v3 + 80) = v4;
  *(void *)(v3 + 88) = *(void *)(v4 - 8);
  *(void *)(v3 + 96) = swift_task_alloc();
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C12D0);
  *(void *)(v3 + 104) = v5;
  *(void *)(v3 + 112) = *(void *)(v5 - 8);
  *(void *)(v3 + 120) = swift_task_alloc();
  *(void *)(v3 + 128) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24E4CE1C0, 0, 0);
}

uint64_t sub_24E4CE1C0()
{
  uint64_t v16 = v0;
  if (qword_26B1C1318 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_24E4D1C20();
  *(void *)(v0 + 136) = __swift_project_value_buffer(v1, (uint64_t)qword_26B1C13C0);
  swift_bridgeObjectRetain_n();
  uint64_t v2 = sub_24E4D1C00();
  os_log_type_t v3 = sub_24E4D1E20();
  if (os_log_type_enabled(v2, v3))
  {
    int v14 = *(unsigned __int8 *)(v0 + 196);
    uint64_t v4 = swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    uint64_t v15 = v13;
    *(_DWORD *)uint64_t v4 = 136446722;
    *(void *)(v0 + 40) = sub_24E4CAAA0(0xD000000000000041, 0x800000024E4D3950, &v15);
    sub_24E4D1EB0();
    *(_WORD *)(v4 + 12) = 2080;
    uint64_t v5 = sub_24E4D0CB4(0, &qword_26B1C12E0);
    uint64_t v6 = swift_bridgeObjectRetain();
    uint64_t v7 = MEMORY[0x25333C3B0](v6, v5);
    unint64_t v9 = v8;
    swift_bridgeObjectRelease();
    *(void *)(v0 + 48) = sub_24E4CAAA0(v7, v9, &v15);
    sub_24E4D1EB0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v4 + 22) = 1024;
    *(_DWORD *)(v0 + 192) = v14;
    sub_24E4D1EB0();
    _os_log_impl(&dword_24E4A6000, v2, v3, "%{public}s handles %s reverseGeocode: %{BOOL}d", (uint8_t *)v4, 0x1Cu);
    swift_arrayDestroy();
    MEMORY[0x25333CC90](v13, -1, -1);
    MEMORY[0x25333CC90](v4, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  uint64_t v10 = swift_task_alloc();
  *(void *)(v0 + 168) = v10;
  *(_OWORD *)(v10 + 16) = *(_OWORD *)(v0 + 64);
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v0 + 176) = v11;
  *uint64_t v11 = v0;
  v11[1] = sub_24E4CE67C;
  return MEMORY[0x270FA2318]();
}

uint64_t sub_24E4CE4F8()
{
  uint64_t v2 = *(void **)v1;
  *(void *)(*(void *)v1 + 160) = v0;
  swift_task_dealloc();
  (*(void (**)(void, void))(v2[11] + 8))(v2[12], v2[10]);
  swift_bridgeObjectRelease();
  if (v0) {
    os_log_type_t v3 = sub_24E4CEB78;
  }
  else {
    os_log_type_t v3 = sub_24E4CE9F8;
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

uint64_t sub_24E4CE67C()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_24E4CE794, 0, 0);
}

uint64_t sub_24E4CE794()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 64) + OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap__session);
  *(void *)(v0 + 184) = v1;
  swift_retain();
  if (v1)
  {
    uint64_t v3 = *(void *)(v0 + 88);
    uint64_t v2 = *(void *)(v0 + 96);
    uint64_t v4 = *(void *)(v0 + 80);
    uint64_t v5 = sub_24E4B1F98(*(void *)(v0 + 56));
    *(void *)(v0 + 144) = v5;
    (*(void (**)(uint64_t, void, uint64_t))(v3 + 104))(v2, *MEMORY[0x263F3CC90], v4);
    uint64_t v6 = (void *)swift_task_alloc();
    *(void *)(v0 + 152) = v6;
    *uint64_t v6 = v0;
    v6[1] = sub_24E4CE4F8;
    uint64_t v7 = *(void *)(v0 + 128);
    uint64_t v8 = *(void *)(v0 + 96);
    uint64_t v9 = *(unsigned __int8 *)(v0 + 196);
    return MEMORY[0x270F296D8](v7, v5, v8, v9);
  }
  else
  {
    uint64_t v10 = sub_24E4D1C00();
    os_log_type_t v11 = sub_24E4D1E10();
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl(&dword_24E4A6000, v10, v11, "Missing FindMyLocate.Session!", v12, 2u);
      MEMORY[0x25333CC90](v12, -1, -1);
    }

    type metadata accessor for FMLSessionError(0);
    *(void *)(v0 + 24) = 5;
    sub_24E4CA610(MEMORY[0x263F8EE78]);
    sub_24E4D13C4(&qword_2698EDA30, type metadata accessor for FMLSessionError);
    sub_24E4D16A0();
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v13 = *(uint64_t (**)(void))(v0 + 8);
    return v13();
  }
}

void sub_24E4CE9F8()
{
  uint64_t v1 = v0[20];
  uint64_t v2 = v0[15];
  uint64_t v4 = (char *)v0[8];
  uint64_t v3 = v0[9];
  (*(void (**)(uint64_t, void, void))(v0[14] + 16))(v2, v0[16], v0[13]);
  uint64_t v5 = (uint64_t *)&v4[OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap_locationRefreshTaskLock];
  os_unfair_lock_lock((os_unfair_lock_t)&v4[OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap_locationRefreshTaskLock]);
  sub_24E4B8200(v5 + 1, v2, v4, v3, v6, &qword_26B1C12D0, (uint64_t)&unk_270051618, (uint64_t)&unk_2698EDE78);
  if (v1)
  {
    os_unfair_lock_unlock((os_unfair_lock_t)v5);
  }
  else
  {
    uint64_t v8 = v0[15];
    uint64_t v7 = v0[16];
    uint64_t v9 = v0[13];
    uint64_t v10 = v0[14];
    os_unfair_lock_unlock((os_unfair_lock_t)v5);
    swift_release();
    os_log_type_t v11 = *(void (**)(uint64_t, uint64_t))(v10 + 8);
    v11(v7, v9);
    v11(v8, v9);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v12 = (void (*)(void))v0[1];
    v12();
  }
}

uint64_t sub_24E4CEB78()
{
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24E4CEC00(uint64_t a1)
{
  *(void *)(v2 + 120) = a1;
  *(void *)(v2 + 128) = v1;
  return MEMORY[0x270FA2498](sub_24E4CEC20, 0, 0);
}

uint64_t sub_24E4CEC20()
{
  uint64_t v17 = v0;
  uint64_t v1 = v0;
  uint64_t v2 = v0 + 10;
  if (qword_26B1C1318 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_24E4D1C20();
  __swift_project_value_buffer(v3, (uint64_t)qword_26B1C13C0);
  swift_bridgeObjectRetain_n();
  uint64_t v4 = sub_24E4D1C00();
  os_log_type_t v5 = sub_24E4D1E20();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v7 = swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 136315138;
    uint64_t v16 = v7;
    uint64_t v8 = sub_24E4D0CB4(0, &qword_26B1C12E0);
    uint64_t v9 = swift_bridgeObjectRetain();
    uint64_t v10 = MEMORY[0x25333C3B0](v9, v8);
    unint64_t v12 = v11;
    swift_bridgeObjectRelease();
    v1[10] = sub_24E4CAAA0(v10, v12, &v16);
    sub_24E4D1EB0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    swift_arrayDestroy();
    MEMORY[0x25333CC90](v7, -1, -1);
    MEMORY[0x25333CC90](v6, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  uint64_t v13 = (void *)v1[16];
  v1[2] = v1;
  v1[3] = sub_24E4CEED4;
  uint64_t v14 = swift_continuation_init();
  v1[10] = MEMORY[0x263EF8330];
  v1[11] = 0x40000000;
  v1[12] = sub_24E4B6FE0;
  v1[13] = &block_descriptor_391;
  v1[14] = v14;
  objc_msgSend(v13, sel_stopRefreshingLocationWithCompletionHandler_, v2);
  return MEMORY[0x270FA23F0](v1 + 2);
}

uint64_t sub_24E4CEED4()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 136) = v1;
  if (v1) {
    uint64_t v2 = sub_24E4CEFFC;
  }
  else {
    uint64_t v2 = sub_24E4CEFE4;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24E4CEFE4()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_24E4CEFFC()
{
  swift_willThrow();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24E4CF068()
{
  return objectdestroyTm(&qword_26B1C12C8);
}

uint64_t sub_24E4CF074(uint64_t a1)
{
  uint64_t v4 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B1C12C8) - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = *(void *)(v1 + 16);
  uint64_t v7 = *(void *)(v1 + 24);
  uint64_t v8 = v1 + v5;
  uint64_t v9 = *(void *)(v1 + ((*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v10;
  *uint64_t v10 = v2;
  v10[1] = sub_24E4B0B04;
  return sub_24E4BD148(a1, v6, v7, v8, v9);
}

uint64_t sub_24E4CF1B0()
{
  return sub_24E4C1858(*(void *)(v0 + 16), *(void *)(v0 + 24), &OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap_pendingOffers);
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

unint64_t sub_24E4CF1EC()
{
  unint64_t result = qword_26B1C1340;
  if (!qword_26B1C1340)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B1C1338);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1C1340);
  }
  return result;
}

uint64_t sub_24E4CF24C()
{
  return sub_24E4C1858(*(void *)(v0 + 16), *(void *)(v0 + 24), &OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap_followings);
}

uint64_t sub_24E4CF274()
{
  return sub_24E4C1858(*(void *)(v0 + 16), *(void *)(v0 + 24), &OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap_followers);
}

void sub_24E4CF298(void *a1@<X8>)
{
  sub_24E4C43CC(*(void **)(v1 + 16), *(unsigned char *)(v1 + 24), *(void *)(v1 + 32), a1);
}

uint64_t sub_24E4CF2BC@<X0>(uint64_t *a1@<X8>)
{
  return sub_24E4C61E8(1uLL, 0xD000000000000024, 0x800000024E4D38A0, a1);
}

uint64_t sub_24E4CF2F4@<X0>(uint64_t *a1@<X8>)
{
  return sub_24E4C61E8(0, 0xD000000000000022, 0x800000024E4D3870, a1);
}

uint64_t sub_24E4CF32C@<X0>(uint64_t *a1@<X8>)
{
  return sub_24E4C61E8(4uLL, 0xD000000000000020, 0x800000024E4D3840, a1);
}

uint64_t sub_24E4CF364@<X0>(uint64_t a1@<X8>)
{
  return sub_24E4CF3A0(a1);
}

uint64_t sub_24E4CF37C@<X0>(void *a1@<X8>)
{
  return sub_24E4C74E8(*(void **)(v1 + 16), *(unsigned __int8 *)(v1 + 24), *(void *)(v1 + 32), a1);
}

uint64_t sub_24E4CF3A0@<X0>(uint64_t a1@<X8>)
{
  return sub_24E4C6818(*(void *)(v1 + 24), *(void *)(v1 + 32), *(void **)(v1 + 40), a1);
}

uint64_t sub_24E4CF3C4()
{
  _Block_release(*(const void **)(v0 + 32));

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_24E4CF414()
{
  uint64_t v2 = (void *)v0[2];
  uint64_t v3 = v0[3];
  unint64_t v5 = (const void *)v0[4];
  uint64_t v4 = (void *)v0[5];
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v6;
  *uint64_t v6 = v1;
  v6[1] = sub_24E4B0B04;
  uint64_t v7 = (uint64_t (*)(void *, uint64_t, const void *, void *))((char *)&dword_2698EDBE0 + dword_2698EDBE0);
  return v7(v2, v3, v5, v4);
}

uint64_t sub_24E4CF4D8()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = (int *)v0[4];
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *unint64_t v5 = v1;
  v5[1] = sub_24E4B0B04;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_2698EDBF0 + dword_2698EDBF0);
  return v6(v2, v3, v4);
}

uint64_t sub_24E4CF59C(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (int *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_24E4B0B04;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_2698EDC00 + dword_2698EDC00);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_24E4CF668()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24E4CF6A0(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_24E4B0B04;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_2698EDC10 + dword_2698EDC10);
  return v6(a1, v4);
}

uint64_t sub_24E4CF75C()
{
  uint64_t v2 = *(void **)(v0 + 16);
  char v3 = *(unsigned char *)(v0 + 24);
  uint64_t v5 = *(void **)(v0 + 32);
  uint64_t v4 = *(void **)(v0 + 40);
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v6;
  *uint64_t v6 = v1;
  v6[1] = sub_24E4B0B04;
  uint64_t v7 = (uint64_t (*)(void *, char, void *, void *))((char *)&dword_2698EDC20 + dword_2698EDC20);
  return v7(v2, v3, v5, v4);
}

uint64_t objectdestroy_95Tm()
{
  _Block_release(*(const void **)(v0 + 32));

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_24E4CF874()
{
  uint64_t v2 = *(void **)(v0 + 16);
  char v3 = *(unsigned char *)(v0 + 24);
  uint64_t v5 = *(void **)(v0 + 32);
  uint64_t v4 = *(void **)(v0 + 40);
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v6;
  *uint64_t v6 = v1;
  v6[1] = sub_24E4B0B04;
  uint64_t v7 = (uint64_t (*)(void *, char, void *, void *))((char *)&dword_2698EDC40 + dword_2698EDC40);
  return v7(v2, v3, v5, v4);
}

uint64_t sub_24E4CF944()
{
  uint64_t v2 = v0[2];
  char v3 = (void *)v0[3];
  uint64_t v4 = (void *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_24E4AE08C;
  uint64_t v6 = (uint64_t (*)(uint64_t, void *, void *))((char *)&dword_2698EDC60 + dword_2698EDC60);
  return v6(v2, v3, v4);
}

uint64_t sub_24E4CFA04()
{
  uint64_t v2 = *(const void **)(v0 + 16);
  char v3 = *(void **)(v0 + 24);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *uint64_t v4 = v1;
  v4[1] = sub_24E4B0B04;
  uint64_t v5 = (uint64_t (*)(const void *, void *))((char *)&dword_2698EDC80 + dword_2698EDC80);
  return v5(v2, v3);
}

uint64_t sub_24E4CFAB8()
{
  _Block_release(*(const void **)(v0 + 24));

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_24E4CFB00()
{
  uint64_t v2 = v0[2];
  char v3 = (void *)v0[3];
  uint64_t v4 = (void *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_24E4B0B04;
  uint64_t v6 = (uint64_t (*)(int, void *, void *))((char *)&dword_2698EDCA0 + dword_2698EDCA0);
  return v6(v2, v3, v4);
}

uint64_t sub_24E4CFBC0()
{
  uint64_t v2 = *(const void **)(v0 + 16);
  char v3 = *(void **)(v0 + 24);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *uint64_t v4 = v1;
  v4[1] = sub_24E4B0B04;
  uint64_t v5 = (uint64_t (*)(const void *, void *))((char *)&dword_2698EDCC0 + dword_2698EDCC0);
  return v5(v2, v3);
}

uint64_t sub_24E4CFC78()
{
  uint64_t v2 = *(const void **)(v0 + 16);
  char v3 = *(void **)(v0 + 24);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *uint64_t v4 = v1;
  v4[1] = sub_24E4B0B04;
  uint64_t v5 = (uint64_t (*)(const void *, void *))((char *)&dword_2698EDCE0 + dword_2698EDCE0);
  return v5(v2, v3);
}

uint64_t objectdestroy_125Tm()
{
  _Block_release(*(const void **)(v0 + 24));

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_24E4CFD70()
{
  char v2 = *(unsigned char *)(v0 + 16);
  uint64_t v4 = *(void **)(v0 + 24);
  char v3 = *(void **)(v0 + 32);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_24E4B0B04;
  uint64_t v6 = (uint64_t (*)(char, void *, void *))((char *)&dword_2698EDD00 + dword_2698EDD00);
  return v6(v2, v4, v3);
}

uint64_t objectdestroy_140Tm()
{
  _Block_release(*(const void **)(v0 + 16));

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24E4CFE70()
{
  char v2 = *(const void **)(v0 + 16);
  char v3 = *(void **)(v0 + 24);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *uint64_t v4 = v1;
  v4[1] = sub_24E4B0B04;
  uint64_t v5 = (uint64_t (*)(const void *, void *))((char *)&dword_2698EDD20 + dword_2698EDD20);
  return v5(v2, v3);
}

uint64_t sub_24E4CFF28()
{
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 24);
  int v4 = *(unsigned __int8 *)(v0 + 32);
  uint64_t v6 = *(void **)(v0 + 40);
  uint64_t v5 = *(void **)(v0 + 48);
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v7;
  *uint64_t v7 = v1;
  v7[1] = sub_24E4B0B04;
  uint64_t v8 = (uint64_t (*)(int, int, int, void *, void *))((char *)&dword_2698EDD40 + dword_2698EDD40);
  return v8(v2, v3, v4, v6, v5);
}

uint64_t objectdestroy_230Tm()
{
  _Block_release(*(const void **)(v0 + 40));

  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_24E4D0044()
{
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 24);
  int v4 = *(unsigned __int8 *)(v0 + 32);
  uint64_t v5 = *(unsigned __int8 *)(v0 + 33);
  uint64_t v7 = *(void **)(v0 + 40);
  uint64_t v6 = *(void **)(v0 + 48);
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v8;
  void *v8 = v1;
  v8[1] = sub_24E4B0B04;
  uint64_t v9 = (uint64_t (*)(int, int, int, uint64_t, void *, void *))((char *)&dword_2698EDD60 + dword_2698EDD60);
  return v9(v2, v3, v4, v5, v7, v6);
}

uint64_t sub_24E4D0128()
{
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = *(void **)(v0 + 24);
  char v4 = *(unsigned char *)(v0 + 32);
  uint64_t v6 = *(void **)(v0 + 40);
  uint64_t v5 = *(void **)(v0 + 48);
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v7;
  *uint64_t v7 = v1;
  v7[1] = sub_24E4B0B04;
  uint64_t v8 = (uint64_t (*)(int, void *, char, void *, void *))((char *)&dword_2698EDD80 + dword_2698EDD80);
  return v8(v2, v3, v4, v6, v5);
}

uint64_t objectdestroy_260Tm()
{
  _Block_release(*(const void **)(v0 + 40));

  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_24E4D024C()
{
  uint64_t v2 = *(void **)(v0 + 16);
  uint64_t v3 = *(void **)(v0 + 24);
  char v4 = *(unsigned char *)(v0 + 32);
  uint64_t v6 = *(void **)(v0 + 40);
  uint64_t v5 = *(void **)(v0 + 48);
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v7;
  *uint64_t v7 = v1;
  v7[1] = sub_24E4B0B04;
  uint64_t v8 = (uint64_t (*)(void *, void *, char, void *, void *))((char *)&dword_2698EDDA0 + dword_2698EDDA0);
  return v8(v2, v3, v4, v6, v5);
}

uint64_t sub_24E4D031C()
{
  _Block_release(*(const void **)(v0 + 48));

  return MEMORY[0x270FA0238](v0, 64, 7);
}

uint64_t sub_24E4D036C()
{
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = *(void **)(v0 + 24);
  uint64_t v4 = *(void *)(v0 + 32);
  char v5 = *(unsigned char *)(v0 + 40);
  uint64_t v7 = *(void **)(v0 + 48);
  uint64_t v6 = *(void **)(v0 + 56);
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v8;
  void *v8 = v1;
  v8[1] = sub_24E4B0B04;
  uint64_t v9 = (uint64_t (*)(int, void *, uint64_t, char, void *, void *))((char *)&dword_2698EDDC0 + dword_2698EDDC0);
  return v9(v2, v3, v4, v5, v7, v6);
}

uint64_t objectdestroy_79Tm()
{
  swift_unknownObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_24E4D048C(unint64_t a1)
{
  unint64_t v22 = a1;
  uint64_t v1 = sub_24E4D1710();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_24E4D1C20();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26B1C1318 != -1) {
    swift_once();
  }
  uint64_t v9 = __swift_project_value_buffer(v5, (uint64_t)qword_26B1C13C0);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v9, v5);
  uint64_t v10 = sub_24E4D1C00();
  os_log_type_t v11 = sub_24E4D1E20();
  if (!os_log_type_enabled(v10, v11)) {
    goto LABEL_6;
  }
  uint64_t v12 = swift_slowAlloc();
  uint64_t v13 = swift_slowAlloc();
  uint64_t v21 = v13;
  *(_DWORD *)uint64_t v12 = 141558275;
  uint64_t v23 = 1752392040;
  uint64_t v24 = v13;
  v20[1] = &v24;
  sub_24E4D1EB0();
  *(_WORD *)(v12 + 12) = 2081;
  if (v22 < 5)
  {
    (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, **((unsigned int **)&unk_26531C570 + v22), v1);
    unint64_t v22 = v12 + 14;
    sub_24E4D13C4(&qword_2698EDE18, MEMORY[0x263F3CCE8]);
    uint64_t v14 = sub_24E4D1FF0();
    uint64_t v15 = v2;
    unint64_t v17 = v16;
    (*(void (**)(char *, uint64_t))(v15 + 8))(v4, v1);
    uint64_t v23 = sub_24E4CAAA0(v14, v17, &v24);
    sub_24E4D1EB0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24E4A6000, v10, v11, "validFriends: %{private,mask.hash}s not supported", (uint8_t *)v12, 0x16u);
    uint64_t v18 = v21;
    swift_arrayDestroy();
    MEMORY[0x25333CC90](v18, -1, -1);
    MEMORY[0x25333CC90](v12, -1, -1);
LABEL_6:

    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    return MEMORY[0x263F8EE78];
  }
  uint64_t result = sub_24E4D1F80();
  __break(1u);
  return result;
}

uint64_t sub_24E4D0854(uint64_t a1)
{
  return sub_24E4C80AC(a1, *(void *)(v1 + 16)) & 1;
}

uint64_t sub_24E4D0874()
{
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 64, 7);
}

uint64_t sub_24E4D08BC(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  *uint64_t v9 = v2;
  v9[1] = sub_24E4AE08C;
  return sub_24E4C8500(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_24E4D0990(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270EF09A8](a2, *(void *)(v2 + 16));
}

uint64_t sub_24E4D099C()
{
  return swift_release();
}

uint64_t objectdestroy_42Tm()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

BOOL sub_24E4D09F0()
{
  return sub_24E4C81D0();
}

uint64_t sub_24E4D09F8(uint64_t a1, uint64_t (*a2)(char *, char *))
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698EDE40);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *(void *)(a1 + 64);
  uint64_t v27 = a1 + 64;
  uint64_t v8 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v9 = -1;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  unint64_t v10 = v9 & v7;
  int64_t v28 = (unint64_t)(v8 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v12 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v13 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v14 = v13 | (v12 << 6);
      goto LABEL_5;
    }
    int64_t v22 = v12 + 1;
    if (__OFADD__(v12, 1)) {
      break;
    }
    if (v22 >= v28) {
      goto LABEL_24;
    }
    unint64_t v23 = *(void *)(v27 + 8 * v22);
    ++v12;
    if (!v23)
    {
      int64_t v12 = v22 + 1;
      if (v22 + 1 >= v28) {
        goto LABEL_24;
      }
      unint64_t v23 = *(void *)(v27 + 8 * v12);
      if (!v23)
      {
        int64_t v12 = v22 + 2;
        if (v22 + 2 >= v28) {
          goto LABEL_24;
        }
        unint64_t v23 = *(void *)(v27 + 8 * v12);
        if (!v23)
        {
          int64_t v12 = v22 + 3;
          if (v22 + 3 >= v28) {
            goto LABEL_24;
          }
          unint64_t v23 = *(void *)(v27 + 8 * v12);
          if (!v23)
          {
            int64_t v24 = v22 + 4;
            if (v24 >= v28)
            {
LABEL_24:
              uint64_t v25 = 0;
              goto LABEL_25;
            }
            unint64_t v23 = *(void *)(v27 + 8 * v24);
            if (!v23)
            {
              while (1)
              {
                int64_t v12 = v24 + 1;
                if (__OFADD__(v24, 1)) {
                  goto LABEL_27;
                }
                if (v12 >= v28) {
                  goto LABEL_24;
                }
                unint64_t v23 = *(void *)(v27 + 8 * v12);
                ++v24;
                if (v23) {
                  goto LABEL_22;
                }
              }
            }
            int64_t v12 = v24;
          }
        }
      }
    }
LABEL_22:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v14 = __clz(__rbit64(v23)) + (v12 << 6);
LABEL_5:
    uint64_t v15 = *(void *)(a1 + 48);
    uint64_t v16 = sub_24E4D1980();
    (*(void (**)(char *, unint64_t, uint64_t))(*(void *)(v16 - 8) + 16))(v6, v15 + *(void *)(*(void *)(v16 - 8) + 72) * v14, v16);
    uint64_t v17 = *(void *)(a1 + 56);
    uint64_t v18 = sub_24E4D16F0();
    uint64_t v19 = *(void *)(v18 - 8);
    uint64_t v20 = v17 + *(void *)(v19 + 72) * v14;
    uint64_t v21 = &v6[*(int *)(v4 + 48)];
    (*(void (**)(char *, uint64_t, uint64_t))(v19 + 16))(v21, v20, v18);
    LOBYTE(v21) = a2(v6, v21);
    uint64_t result = sub_24E4B09A4((uint64_t)v6, &qword_2698EDE40);
    if (v21)
    {
      uint64_t v25 = 1;
LABEL_25:
      swift_release();
      return v25;
    }
  }
  __break(1u);
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_24E4D0CB4(uint64_t a1, unint64_t *a2)
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

uint64_t sub_24E4D0CF0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_24E4D0D54()
{
  return objectdestroyTm(&qword_26B1C1370);
}

uint64_t sub_24E4D0D60(uint64_t a1)
{
  uint64_t v4 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B1C1370) - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = *(void *)(v1 + 16);
  uint64_t v7 = *(void *)(v1 + 24);
  uint64_t v8 = v1 + v5;
  uint64_t v9 = *(void *)(v1 + ((*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8));
  unint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v10;
  *unint64_t v10 = v2;
  v10[1] = sub_24E4B0B04;
  return sub_24E4B8428(a1, v6, v7, v8, v9);
}

uint64_t sub_24E4D0E9C()
{
  return sub_24E4D0EB8();
}

uint64_t sub_24E4D0EAC()
{
  return sub_24E4D0EB8();
}

uint64_t sub_24E4D0EB8()
{
  uint64_t v1 = *(void *)(sub_24E4D1900() - 8);
  return sub_24E4BB8E4(*(void *)(v0 + 16), v0 + ((*(unsigned __int8 *)(v1 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80)));
}

uint64_t sub_24E4D0F24()
{
  return sub_24E4D0EB8();
}

uint64_t sub_24E4D0F34()
{
  return sub_24E4D0F40();
}

uint64_t sub_24E4D0F40()
{
  return sub_24E4BB754();
}

void sub_24E4D0FAC()
{
  sub_24E4D1900();
  uint64_t v1 = *(void *)(v0 + 16);

  sub_24E4BB50C(v1);
}

uint64_t sub_24E4D1014()
{
  return sub_24E4D0F40();
}

uint64_t objectdestroy_338Tm()
{
  uint64_t v1 = sub_24E4D1900();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_24E4D10F8()
{
  return objectdestroyTm(&qword_26B1C12D0);
}

uint64_t objectdestroyTm(uint64_t *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(a1);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = (v4 + 32) & ~v4;
  uint64_t v6 = v4 | 7;
  unint64_t v7 = (*(void *)(v3 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8;
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1 + v5, v2);

  return MEMORY[0x270FA0238](v1, ((v7 + 15) & 0xFFFFFFFFFFFFFFF8) + 8, v6);
}

uint64_t sub_24E4D11F0(uint64_t a1)
{
  uint64_t v4 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B1C12D0) - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = *(void *)(v1 + 16);
  uint64_t v7 = *(void *)(v1 + 24);
  uint64_t v8 = v1 + v5;
  uint64_t v9 = *(void *)(v1 + ((*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8));
  unint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v10;
  *unint64_t v10 = v2;
  v10[1] = sub_24E4B0B04;
  return sub_24E4B5534(a1, v6, v7, v8, v9);
}

uint64_t sub_24E4D1328()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_24E4D1368()
{
  sub_24E4B6C30(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_24E4D1370()
{
  return MEMORY[0x270FA0238](v0, 40, 7);
}

void sub_24E4D13B8()
{
  sub_24E4B69D8(*(void *)(v0 + 16), *(void **)(v0 + 24), *(void **)(v0 + 32));
}

uint64_t sub_24E4D13C4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_24E4D145C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_24E4D14B8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

_OWORD *sub_24E4D151C(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_24E4D1580@<X0>(void *a1@<X8>)
{
  return sub_24E4CF37C(a1);
}

void sub_24E4D1598(void *a1@<X8>)
{
}

uint64_t sub_24E4D15F0@<X0>(uint64_t *a1@<X8>)
{
  return sub_24E4CF32C(a1);
}

uint64_t sub_24E4D1608@<X0>(uint64_t *a1@<X8>)
{
  return sub_24E4CF2F4(a1);
}

uint64_t sub_24E4D1620@<X0>(uint64_t *a1@<X8>)
{
  return sub_24E4CF2BC(a1);
}

uint64_t sub_24E4D16A0()
{
  return MEMORY[0x270EEF800]();
}

uint64_t sub_24E4D16B0()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_24E4D16C0()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_24E4D16E0()
{
  return MEMORY[0x270EF0BA8]();
}

uint64_t sub_24E4D16F0()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_24E4D1700()
{
  return MEMORY[0x270F29208]();
}

uint64_t sub_24E4D1710()
{
  return MEMORY[0x270F29218]();
}

uint64_t sub_24E4D1720()
{
  return MEMORY[0x270F29220]();
}

uint64_t sub_24E4D1730()
{
  return MEMORY[0x270F29228]();
}

uint64_t sub_24E4D1740()
{
  return MEMORY[0x270F29238]();
}

uint64_t sub_24E4D1750()
{
  return MEMORY[0x270F29288]();
}

uint64_t sub_24E4D1760()
{
  return MEMORY[0x270F29290]();
}

uint64_t sub_24E4D1770()
{
  return MEMORY[0x270F29298]();
}

uint64_t sub_24E4D1780()
{
  return MEMORY[0x270F292F8]();
}

uint64_t sub_24E4D1790()
{
  return MEMORY[0x270F29300]();
}

uint64_t sub_24E4D17A0()
{
  return MEMORY[0x270F29320]();
}

uint64_t sub_24E4D17B0()
{
  return MEMORY[0x270F29328]();
}

uint64_t sub_24E4D17C0()
{
  return MEMORY[0x270F29340]();
}

uint64_t sub_24E4D17D0()
{
  return MEMORY[0x270F29350]();
}

uint64_t sub_24E4D17E0()
{
  return MEMORY[0x270F29358]();
}

uint64_t sub_24E4D17F0()
{
  return MEMORY[0x270F29360]();
}

uint64_t sub_24E4D1800()
{
  return MEMORY[0x270F29508]();
}

uint64_t sub_24E4D1810()
{
  return MEMORY[0x270F29510]();
}

uint64_t sub_24E4D1820()
{
  return MEMORY[0x270F29528]();
}

uint64_t sub_24E4D1830()
{
  return MEMORY[0x270F29538]();
}

uint64_t sub_24E4D1840()
{
  return MEMORY[0x270F29548]();
}

uint64_t sub_24E4D1850()
{
  return MEMORY[0x270F29550]();
}

uint64_t sub_24E4D1860()
{
  return MEMORY[0x270F29558]();
}

uint64_t sub_24E4D1870()
{
  return MEMORY[0x270F29568]();
}

uint64_t sub_24E4D1880()
{
  return MEMORY[0x270F29570]();
}

uint64_t sub_24E4D1890()
{
  return MEMORY[0x270F29578]();
}

uint64_t sub_24E4D18A0()
{
  return MEMORY[0x270F29580]();
}

uint64_t sub_24E4D18B0()
{
  return MEMORY[0x270F29588]();
}

uint64_t sub_24E4D18C0()
{
  return MEMORY[0x270F29590]();
}

uint64_t sub_24E4D18D0()
{
  return MEMORY[0x270F29598]();
}

uint64_t sub_24E4D18E0()
{
  return MEMORY[0x270F295A0]();
}

uint64_t sub_24E4D18F0()
{
  return MEMORY[0x270F295A8]();
}

uint64_t sub_24E4D1900()
{
  return MEMORY[0x270F295B0]();
}

uint64_t sub_24E4D1910()
{
  return MEMORY[0x270F295B8]();
}

uint64_t sub_24E4D1920()
{
  return MEMORY[0x270F295D0]();
}

uint64_t sub_24E4D1930()
{
  return MEMORY[0x270F295E0]();
}

uint64_t sub_24E4D1940()
{
  return MEMORY[0x270F295E8]();
}

uint64_t sub_24E4D1950()
{
  return MEMORY[0x270F295F8]();
}

uint64_t sub_24E4D1960()
{
  return MEMORY[0x270F29608]();
}

uint64_t sub_24E4D1970()
{
  return MEMORY[0x270F29610]();
}

uint64_t sub_24E4D1980()
{
  return MEMORY[0x270F29618]();
}

uint64_t sub_24E4D19B0()
{
  return MEMORY[0x270F29638]();
}

uint64_t sub_24E4D19C0()
{
  return MEMORY[0x270F29650]();
}

uint64_t sub_24E4D1AA0()
{
  return MEMORY[0x270F29768]();
}

uint64_t sub_24E4D1AB0()
{
  return MEMORY[0x270F29788]();
}

uint64_t sub_24E4D1AC0()
{
  return MEMORY[0x270F29798]();
}

uint64_t sub_24E4D1AD0()
{
  return MEMORY[0x270F297A0]();
}

uint64_t sub_24E4D1AE0()
{
  return MEMORY[0x270F297A8]();
}

uint64_t sub_24E4D1AF0()
{
  return MEMORY[0x270F297B0]();
}

uint64_t sub_24E4D1B00()
{
  return MEMORY[0x270F297C8]();
}

uint64_t sub_24E4D1B10()
{
  return MEMORY[0x270F297D0]();
}

uint64_t sub_24E4D1B20()
{
  return MEMORY[0x270F297D8]();
}

uint64_t sub_24E4D1B30()
{
  return MEMORY[0x270F297E0]();
}

uint64_t sub_24E4D1B40()
{
  return MEMORY[0x270F297F0]();
}

uint64_t sub_24E4D1B50()
{
  return MEMORY[0x270F297F8]();
}

uint64_t sub_24E4D1B60()
{
  return MEMORY[0x270F29800]();
}

uint64_t sub_24E4D1B70()
{
  return MEMORY[0x270F29808]();
}

uint64_t sub_24E4D1B80()
{
  return MEMORY[0x270F29818]();
}

uint64_t sub_24E4D1B90()
{
  return MEMORY[0x270F29840]();
}

uint64_t sub_24E4D1BA0()
{
  return MEMORY[0x270F29848]();
}

uint64_t sub_24E4D1BB0()
{
  return MEMORY[0x270F29850]();
}

uint64_t sub_24E4D1BC0()
{
  return MEMORY[0x270F29860]();
}

uint64_t sub_24E4D1BD0()
{
  return MEMORY[0x270F29870]();
}

uint64_t sub_24E4D1BE0()
{
  return MEMORY[0x270F29878]();
}

uint64_t sub_24E4D1BF0()
{
  return MEMORY[0x270F29888]();
}

uint64_t sub_24E4D1C00()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_24E4D1C10()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_24E4D1C20()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_24E4D1C30()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_24E4D1C40()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_24E4D1C50()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_24E4D1C60()
{
  return MEMORY[0x270F9D060]();
}

uint64_t sub_24E4D1C70()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_24E4D1C80()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_24E4D1C90()
{
  return MEMORY[0x270F9D488]();
}

uint64_t sub_24E4D1CA0()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_24E4D1CB0()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_24E4D1CC0()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_24E4D1CD0()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_24E4D1CE0()
{
  return MEMORY[0x270F9D5F8]();
}

uint64_t sub_24E4D1CF0()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_24E4D1D00()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_24E4D1D10()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_24E4D1D20()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_24E4D1D30()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_24E4D1D40()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_24E4D1D50()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_24E4D1D60()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_24E4D1D70()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_24E4D1D80()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_24E4D1D90()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_24E4D1DA0()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_24E4D1DB0()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_24E4D1DC0()
{
  return MEMORY[0x270FA1F60]();
}

uint64_t sub_24E4D1DE0()
{
  return MEMORY[0x270FA1FB0]();
}

uint64_t sub_24E4D1DF0()
{
  return MEMORY[0x270FA1FD8]();
}

uint64_t sub_24E4D1E00()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_24E4D1E10()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_24E4D1E20()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_24E4D1E30()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t sub_24E4D1E40()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_24E4D1E50()
{
  return MEMORY[0x270FA0D88]();
}

uint64_t sub_24E4D1E60()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_24E4D1E70()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t sub_24E4D1E80()
{
  return MEMORY[0x270FA1170]();
}

uint64_t sub_24E4D1E90()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_24E4D1EA0()
{
  return MEMORY[0x270FA11A0]();
}

uint64_t sub_24E4D1EB0()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_24E4D1EC0()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_24E4D1ED0()
{
  return MEMORY[0x270EF25B0]();
}

uint64_t sub_24E4D1EE0()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_24E4D1EF0()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_24E4D1F00()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_24E4D1F10()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_24E4D1F20()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_24E4D1F30()
{
  return MEMORY[0x270F9EF50]();
}

uint64_t sub_24E4D1F40()
{
  return MEMORY[0x270F9EF88]();
}

uint64_t sub_24E4D1F50()
{
  return MEMORY[0x270F9EFB0]();
}

uint64_t sub_24E4D1F60()
{
  return MEMORY[0x270F9EFC0]();
}

uint64_t sub_24E4D1F70()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_24E4D1F80()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_24E4D1F90()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_24E4D1FA0()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_24E4D1FB0()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_24E4D1FC0()
{
  return MEMORY[0x270F9F0A8]();
}

uint64_t sub_24E4D1FD0()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_24E4D1FE0()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_24E4D1FF0()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_24E4D2010()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_24E4D2020()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_24E4D2050()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_24E4D2060()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_24E4D2070()
{
  return MEMORY[0x270F9FC90]();
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x270F95F98]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
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

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
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

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
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

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x270FA01D0]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x270FA01D8]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
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

uint64_t swift_continuation_init()
{
  return MEMORY[0x270FA23F8]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x270FA02D0]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
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

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x270FA0498]();
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

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x270FA0568]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x270FA2450]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x270FA2458]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x270FA2460]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}