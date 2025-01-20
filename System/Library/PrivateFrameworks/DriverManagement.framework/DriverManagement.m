uint64_t DriverKitDriver.driverIdentifier.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t DriverKitDriver.source.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for DriverKitDriver();
  return sub_24CFE8154(v1 + *(int *)(v3 + 20), a1, (uint64_t (*)(void))type metadata accessor for DriverKitDriverSource);
}

uint64_t type metadata accessor for DriverKitDriver()
{
  uint64_t result = qword_26B183090;
  if (!qword_26B183090) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t DriverKitDriver.displayName.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for DriverKitDriver() + 24));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t DriverKitDriver.usageText.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for DriverKitDriver() + 28));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t DriverKitDriver.init(driverIdentifier:source:displayName:usageText:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, void *a8@<X8>)
{
  *a8 = a1;
  a8[1] = a2;
  v14 = (int *)type metadata accessor for DriverKitDriver();
  uint64_t result = sub_24CFE80EC(a3, (uint64_t)a8 + v14[5], (uint64_t (*)(void))type metadata accessor for DriverKitDriverSource);
  v16 = (void *)((char *)a8 + v14[6]);
  void *v16 = a4;
  v16[1] = a5;
  v17 = (void *)((char *)a8 + v14[7]);
  void *v17 = a6;
  v17[1] = a7;
  return result;
}

BOOL sub_24CFE602C(uint64_t *a1, uint64_t *a2)
{
  return (_s16DriverManagement0a3KitA0V1loiySbAC_ACtFZ_0(a2, a1) & 1) == 0;
}

BOOL sub_24CFE6058(uint64_t *a1, uint64_t *a2)
{
  return (_s16DriverManagement0a3KitA0V1loiySbAC_ACtFZ_0(a1, a2) & 1) == 0;
}

uint64_t sub_24CFE6078(uint64_t *a1, uint64_t *a2)
{
  return _s16DriverManagement0a3KitA0V1loiySbAC_ACtFZ_0(a2, a1);
}

uint64_t variable initialization expression of DriverKitDaemonClient.$__lazy_storage_$_connection()
{
  return 0;
}

uint64_t variable initialization expression of DriverKitDaemonClient.$__lazy_storage_$_clientIdentifier()
{
  return 0;
}

void sub_24CFE609C(void *a1@<X8>)
{
  *a1 = *v1;
}

void sub_24CFE60A8(void *a1@<X8>)
{
  *a1 = 0;
}

void *sub_24CFE60B0@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & *result;
  return result;
}

BOOL sub_24CFE60C4(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *v2 & *a2;
  if (v4 != *a2) {
    *v2 |= v3;
  }
  *a1 = v3;
  return v4 != v3;
}

void *sub_24CFE60F4(void *result)
{
  *v1 |= *result;
  return result;
}

void *sub_24CFE6108(void *result)
{
  *v1 &= *result;
  return result;
}

void *sub_24CFE611C@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t _s16DriverManagement0a3KitA0V2eeoiySbAC_ACtFZ_0(void *a1, void *a2)
{
  uint64_t v4 = (int *)type metadata accessor for DriverKitDriver();
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  v7 = (char *)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v5);
  uint64_t v38 = (uint64_t)&v37 - v9;
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  v12 = (char *)&v37 - v11;
  uint64_t v13 = MEMORY[0x270FA5388](v10);
  v15 = (char *)&v37 - v14;
  uint64_t v16 = MEMORY[0x270FA5388](v13);
  v18 = (char *)&v37 - v17;
  MEMORY[0x270FA5388](v16);
  v20 = (char *)&v37 - v19;
  if (*a1 == *a2 && a1[1] == a2[1])
  {
    sub_24CFE8154((uint64_t)a1, (uint64_t)&v37 - v19, (uint64_t (*)(void))type metadata accessor for DriverKitDriver);
    sub_24CFE8154((uint64_t)a2, (uint64_t)v18, (uint64_t (*)(void))type metadata accessor for DriverKitDriver);
  }
  else
  {
    char v21 = sub_24D006ED0();
    sub_24CFE8154((uint64_t)a1, (uint64_t)v20, (uint64_t (*)(void))type metadata accessor for DriverKitDriver);
    sub_24CFE8154((uint64_t)a2, (uint64_t)v18, (uint64_t (*)(void))type metadata accessor for DriverKitDriver);
    if ((v21 & 1) == 0)
    {
      sub_24CFE81BC((uint64_t)v18, (uint64_t (*)(void))type metadata accessor for DriverKitDriver);
      sub_24CFE81BC((uint64_t)v20, (uint64_t (*)(void))type metadata accessor for DriverKitDriver);
      sub_24CFE8154((uint64_t)a1, (uint64_t)v15, (uint64_t (*)(void))type metadata accessor for DriverKitDriver);
      sub_24CFE8154((uint64_t)a2, (uint64_t)v12, (uint64_t (*)(void))type metadata accessor for DriverKitDriver);
      goto LABEL_15;
    }
  }
  char v22 = _s16DriverManagement0a3KitA6SourceO21__derived_enum_equalsySbAC_ACtFZ_0((uint64_t)&v20[v4[5]], (uint64_t)&v18[v4[5]]);
  sub_24CFE81BC((uint64_t)v18, (uint64_t (*)(void))type metadata accessor for DriverKitDriver);
  sub_24CFE81BC((uint64_t)v20, (uint64_t (*)(void))type metadata accessor for DriverKitDriver);
  sub_24CFE8154((uint64_t)a1, (uint64_t)v15, (uint64_t (*)(void))type metadata accessor for DriverKitDriver);
  sub_24CFE8154((uint64_t)a2, (uint64_t)v12, (uint64_t (*)(void))type metadata accessor for DriverKitDriver);
  if ((v22 & 1) == 0)
  {
LABEL_15:
    sub_24CFE81BC((uint64_t)v12, (uint64_t (*)(void))type metadata accessor for DriverKitDriver);
    sub_24CFE81BC((uint64_t)v15, (uint64_t (*)(void))type metadata accessor for DriverKitDriver);
    goto LABEL_16;
  }
  uint64_t v23 = v4[6];
  v24 = &v15[v23];
  uint64_t v25 = *(void *)&v15[v23 + 8];
  v26 = &v12[v23];
  uint64_t v27 = *((void *)v26 + 1);
  if (!v25)
  {
    swift_bridgeObjectRetain();
    sub_24CFE81BC((uint64_t)v12, (uint64_t (*)(void))type metadata accessor for DriverKitDriver);
    sub_24CFE81BC((uint64_t)v15, (uint64_t (*)(void))type metadata accessor for DriverKitDriver);
    if (!v27)
    {
LABEL_24:
      uint64_t v30 = v38;
      sub_24CFE8154((uint64_t)a1, v38, (uint64_t (*)(void))type metadata accessor for DriverKitDriver);
      sub_24CFE8154((uint64_t)a2, (uint64_t)v7, (uint64_t (*)(void))type metadata accessor for DriverKitDriver);
      goto LABEL_25;
    }
    swift_bridgeObjectRelease();
LABEL_16:
    uint64_t v30 = v38;
    sub_24CFE8154((uint64_t)a1, v38, (uint64_t (*)(void))type metadata accessor for DriverKitDriver);
    sub_24CFE8154((uint64_t)a2, (uint64_t)v7, (uint64_t (*)(void))type metadata accessor for DriverKitDriver);
    goto LABEL_17;
  }
  if (!v27)
  {
    swift_bridgeObjectRetain();
    sub_24CFE81BC((uint64_t)v12, (uint64_t (*)(void))type metadata accessor for DriverKitDriver);
    sub_24CFE81BC((uint64_t)v15, (uint64_t (*)(void))type metadata accessor for DriverKitDriver);
    swift_bridgeObjectRelease();
    goto LABEL_16;
  }
  if (*(void *)v24 == *(void *)v26 && v25 == v27)
  {
    swift_bridgeObjectRetain();
    sub_24CFE81BC((uint64_t)v12, (uint64_t (*)(void))type metadata accessor for DriverKitDriver);
    sub_24CFE81BC((uint64_t)v15, (uint64_t (*)(void))type metadata accessor for DriverKitDriver);
    swift_bridgeObjectRelease();
    goto LABEL_24;
  }
  char v29 = sub_24D006ED0();
  swift_bridgeObjectRetain();
  sub_24CFE81BC((uint64_t)v12, (uint64_t (*)(void))type metadata accessor for DriverKitDriver);
  sub_24CFE81BC((uint64_t)v15, (uint64_t (*)(void))type metadata accessor for DriverKitDriver);
  swift_bridgeObjectRelease();
  uint64_t v30 = v38;
  sub_24CFE8154((uint64_t)a1, v38, (uint64_t (*)(void))type metadata accessor for DriverKitDriver);
  sub_24CFE8154((uint64_t)a2, (uint64_t)v7, (uint64_t (*)(void))type metadata accessor for DriverKitDriver);
  if ((v29 & 1) == 0)
  {
LABEL_17:
    sub_24CFE81BC((uint64_t)v7, (uint64_t (*)(void))type metadata accessor for DriverKitDriver);
    sub_24CFE81BC(v30, (uint64_t (*)(void))type metadata accessor for DriverKitDriver);
LABEL_18:
    LOBYTE(v31) = 0;
    return v31 & 1;
  }
LABEL_25:
  uint64_t v33 = v4[7];
  v34 = (void *)(v30 + v33);
  uint64_t v35 = *(void *)(v30 + v33 + 8);
  v36 = &v7[v33];
  uint64_t v31 = *((void *)v36 + 1);
  if (!v35)
  {
    swift_bridgeObjectRetain();
    sub_24CFE81BC((uint64_t)v7, (uint64_t (*)(void))type metadata accessor for DriverKitDriver);
    sub_24CFE81BC(v30, (uint64_t (*)(void))type metadata accessor for DriverKitDriver);
    if (!v31)
    {
      LOBYTE(v31) = 1;
      return v31 & 1;
    }
    swift_bridgeObjectRelease();
    goto LABEL_18;
  }
  if (v31)
  {
    if (*v34 == *(void *)v36 && v35 == v31) {
      LOBYTE(v31) = 1;
    }
    else {
      LOBYTE(v31) = sub_24D006ED0();
    }
  }
  swift_bridgeObjectRetain();
  sub_24CFE81BC((uint64_t)v7, (uint64_t (*)(void))type metadata accessor for DriverKitDriver);
  sub_24CFE81BC(v30, (uint64_t (*)(void))type metadata accessor for DriverKitDriver);
  swift_bridgeObjectRelease();
  return v31 & 1;
}

uint64_t _s16DriverManagement0a3KitA0V1loiySbAC_ACtFZ_0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v48 = type metadata accessor for SettingsApplicationRecord();
  uint64_t v4 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v47 = (uint64_t)v46 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  v51 = (char *)v46 - v6;
  uint64_t v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1830B0);
  MEMORY[0x270FA5388](v50);
  v49 = (char *)v46 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for DriverKitDriverApp();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  v12 = (char *)v46 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)v46 - v13;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1830C8);
  uint64_t v16 = v15 - 8;
  MEMORY[0x270FA5388](v15);
  v18 = (char *)v46 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = a1[1];
  uint64_t v55 = *a1;
  uint64_t v56 = v19;
  uint64_t v20 = a2[1];
  uint64_t v53 = *a2;
  uint64_t v54 = v20;
  unint64_t v21 = sub_24CFE8098();
  BOOL v52 = sub_24D006C80() == -1;
  uint64_t v22 = *(int *)(type metadata accessor for DriverKitDriver() + 20);
  uint64_t v23 = (uint64_t)a2 + v22;
  uint64_t v24 = (uint64_t)&v18[*(int *)(v16 + 56)];
  sub_24CFE8154((uint64_t)a1 + v22, (uint64_t)v18, (uint64_t (*)(void))type metadata accessor for DriverKitDriverSource);
  sub_24CFE8154(v23, v24, (uint64_t (*)(void))type metadata accessor for DriverKitDriverSource);
  uint64_t v25 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v9 + 48);
  LODWORD(v23) = v25(v18, 1, v8);
  int v26 = v25((char *)v24, 1, v8);
  if (v23 != 1)
  {
    uint64_t v31 = (uint64_t)v49;
    uint64_t v30 = v50;
    v46[1] = v21;
    uint64_t v32 = (uint64_t)v51;
    if (v26 == 1)
    {
      uint64_t v33 = type metadata accessor for DriverKitDriverApp;
      uint64_t v34 = (uint64_t)v18;
    }
    else
    {
      uint64_t v36 = (uint64_t)v18;
      uint64_t v37 = (uint64_t)v14;
      sub_24CFE80EC(v36, (uint64_t)v14, (uint64_t (*)(void))type metadata accessor for DriverKitDriverApp);
      sub_24CFE80EC(v24, (uint64_t)v12, (uint64_t (*)(void))type metadata accessor for DriverKitDriverApp);
      uint64_t v38 = v31 + *(int *)(v30 + 48);
      sub_24CFE8154(v37, v31, (uint64_t (*)(void))type metadata accessor for DriverKitDriverApp);
      sub_24CFE8154((uint64_t)v12, v38, (uint64_t (*)(void))type metadata accessor for DriverKitDriverApp);
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        sub_24CFE81BC((uint64_t)v12, (uint64_t (*)(void))type metadata accessor for DriverKitDriverApp);
        sub_24CFE81BC(v37, (uint64_t (*)(void))type metadata accessor for DriverKitDriverApp);
        sub_24CFE71CC(*(void *)v31, *(void *)(v31 + 8));
        if (swift_getEnumCaseMultiPayload() == 1)
        {
          sub_24CFE71CC(*(void *)v38, *(void *)(v38 + 8));
          return v52;
        }
        v28 = type metadata accessor for DriverKitDriverApp;
        uint64_t v29 = v38;
        goto LABEL_4;
      }
      if (swift_getEnumCaseMultiPayload() != 1)
      {
        sub_24CFE80EC(v31, v32, (uint64_t (*)(void))type metadata accessor for SettingsApplicationRecord);
        uint64_t v39 = v47;
        sub_24CFE80EC(v38, v47, (uint64_t (*)(void))type metadata accessor for SettingsApplicationRecord);
        uint64_t v40 = *(int *)(v48 + 36);
        uint64_t v41 = *(void *)(v32 + v40 + 8);
        uint64_t v55 = *(void *)(v32 + v40);
        uint64_t v56 = v41;
        v42 = (uint64_t *)(v39 + v40);
        uint64_t v44 = *v42;
        uint64_t v43 = v42[1];
        uint64_t v53 = v44;
        uint64_t v54 = v43;
        uint64_t v45 = sub_24D006C80();
        if (v45)
        {
          uint64_t v27 = v45 == -1;
          sub_24CFE81BC(v39, (uint64_t (*)(void))type metadata accessor for SettingsApplicationRecord);
          sub_24CFE81BC(v32, (uint64_t (*)(void))type metadata accessor for SettingsApplicationRecord);
          sub_24CFE81BC((uint64_t)v12, (uint64_t (*)(void))type metadata accessor for DriverKitDriverApp);
          sub_24CFE81BC(v37, (uint64_t (*)(void))type metadata accessor for DriverKitDriverApp);
        }
        else
        {
          sub_24CFE81BC(v39, (uint64_t (*)(void))type metadata accessor for SettingsApplicationRecord);
          sub_24CFE81BC(v32, (uint64_t (*)(void))type metadata accessor for SettingsApplicationRecord);
          sub_24CFE81BC((uint64_t)v12, (uint64_t (*)(void))type metadata accessor for DriverKitDriverApp);
          sub_24CFE81BC(v37, (uint64_t (*)(void))type metadata accessor for DriverKitDriverApp);
          return v52;
        }
        return v27;
      }
      sub_24CFE81BC((uint64_t)v12, (uint64_t (*)(void))type metadata accessor for DriverKitDriverApp);
      sub_24CFE81BC(v37, (uint64_t (*)(void))type metadata accessor for DriverKitDriverApp);
      sub_24CFE71CC(*(void *)v38, *(void *)(v38 + 8));
      uint64_t v33 = type metadata accessor for SettingsApplicationRecord;
      uint64_t v34 = v31;
    }
    sub_24CFE81BC(v34, (uint64_t (*)(void))v33);
    return 0;
  }
  uint64_t v27 = v52;
  if (v26 != 1)
  {
    v28 = type metadata accessor for DriverKitDriverSource;
    uint64_t v29 = v24;
LABEL_4:
    sub_24CFE81BC(v29, (uint64_t (*)(void))v28);
    return 1;
  }
  return v27;
}

unint64_t sub_24CFE6CD0()
{
  unint64_t result = qword_26984D280;
  if (!qword_26984D280)
  {
    type metadata accessor for DriverKitDriver();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26984D280);
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for DriverKitDriver(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v15 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    uint64_t v8 = a3[5];
    uint64_t v9 = (uint64_t *)((char *)a1 + v8);
    uint64_t v10 = (uint64_t *)((char *)a2 + v8);
    uint64_t v11 = type metadata accessor for DriverKitDriverApp();
    uint64_t v12 = *(void *)(v11 - 8);
    uint64_t v13 = *(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v12 + 48);
    swift_bridgeObjectRetain();
    if (v13(v10, 1, v11))
    {
      uint64_t v14 = type metadata accessor for DriverKitDriverSource();
      memcpy(v9, v10, *(void *)(*(void *)(v14 - 8) + 64));
    }
    else
    {
      int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
      uint64_t v17 = *v10;
      if (EnumCaseMultiPayload == 1)
      {
        unint64_t v18 = v10[1];
        sub_24CFE7000(v17, v18);
        *uint64_t v9 = v17;
        v9[1] = v18;
      }
      else
      {
        uint64_t v19 = v10[1];
        *uint64_t v9 = v17;
        v9[1] = v19;
        uint64_t v20 = (int *)type metadata accessor for SettingsApplicationRecord();
        uint64_t v21 = v20[5];
        v46 = (char *)v10 + v21;
        uint64_t v47 = (char *)v9 + v21;
        uint64_t v22 = sub_24D006880();
        uint64_t v45 = *(void (**)(char *, char *, uint64_t))(*(void *)(v22 - 8) + 16);
        swift_bridgeObjectRetain();
        v45(v47, v46, v22);
        uint64_t v23 = v20[6];
        uint64_t v24 = (char *)v9 + v23;
        uint64_t v25 = (uint64_t *)((char *)v10 + v23);
        unint64_t v26 = v25[1];
        if (v26 >> 60 == 15)
        {
          *(_OWORD *)uint64_t v24 = *(_OWORD *)v25;
        }
        else
        {
          uint64_t v48 = *v25;
          sub_24CFE7000(*v25, v26);
          *(void *)uint64_t v24 = v48;
          *((void *)v24 + 1) = v26;
        }
        *(uint64_t *)((char *)v9 + v20[7]) = *(uint64_t *)((char *)v10 + v20[7]);
        uint64_t v27 = v20[8];
        v49 = v20;
        v28 = (uint64_t *)((char *)v9 + v27);
        uint64_t v29 = (uint64_t *)((char *)v10 + v27);
        uint64_t v30 = *v29;
        unint64_t v31 = v29[1];
        swift_bridgeObjectRetain();
        sub_24CFE7000(v30, v31);
        uint64_t *v28 = v30;
        v28[1] = v31;
        uint64_t v32 = v49[9];
        uint64_t v33 = (uint64_t *)((char *)v9 + v32);
        uint64_t v34 = (uint64_t *)((char *)v10 + v32);
        uint64_t v35 = v34[1];
        *uint64_t v33 = *v34;
        v33[1] = v35;
        swift_bridgeObjectRetain();
      }
      swift_storeEnumTagMultiPayload();
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
    }
    uint64_t v36 = a3[6];
    uint64_t v37 = a3[7];
    uint64_t v38 = (uint64_t *)((char *)v4 + v36);
    uint64_t v39 = (uint64_t *)((char *)a2 + v36);
    uint64_t v40 = v39[1];
    *uint64_t v38 = *v39;
    v38[1] = v40;
    uint64_t v41 = (uint64_t *)((char *)v4 + v37);
    v42 = (uint64_t *)((char *)a2 + v37);
    uint64_t v43 = v42[1];
    *uint64_t v41 = *v42;
    v41[1] = v43;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t sub_24CFE7000(uint64_t a1, unint64_t a2)
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

uint64_t destroy for DriverKitDriver(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = type metadata accessor for DriverKitDriverApp();
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 48))(v4, 1, v5))
  {
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      sub_24CFE71CC(*(void *)v4, *(void *)(v4 + 8));
    }
    else
    {
      swift_bridgeObjectRelease();
      uint64_t v6 = (int *)type metadata accessor for SettingsApplicationRecord();
      uint64_t v7 = v4 + v6[5];
      uint64_t v8 = sub_24D006880();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
      uint64_t v9 = (uint64_t *)(v4 + v6[6]);
      unint64_t v10 = v9[1];
      if (v10 >> 60 != 15) {
        sub_24CFE71CC(*v9, v10);
      }
      swift_bridgeObjectRelease();
      sub_24CFE71CC(*(void *)(v4 + v6[8]), *(void *)(v4 + v6[8] + 8));
      swift_bridgeObjectRelease();
    }
  }
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t sub_24CFE71CC(uint64_t a1, unint64_t a2)
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

void *initializeWithCopy for DriverKitDriver(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)((char *)a1 + v7);
  uint64_t v9 = (void *)((char *)a2 + v7);
  uint64_t v10 = type metadata accessor for DriverKitDriverApp();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v11 + 48);
  swift_bridgeObjectRetain();
  if (v12(v9, 1, v10))
  {
    uint64_t v13 = type metadata accessor for DriverKitDriverSource();
    memcpy(v8, v9, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    uint64_t v15 = *v9;
    if (EnumCaseMultiPayload == 1)
    {
      unint64_t v16 = v9[1];
      sub_24CFE7000(v15, v16);
      *uint64_t v8 = v15;
      v8[1] = v16;
    }
    else
    {
      uint64_t v17 = v9[1];
      *uint64_t v8 = v15;
      v8[1] = v17;
      unint64_t v18 = (int *)type metadata accessor for SettingsApplicationRecord();
      uint64_t v19 = v18[5];
      uint64_t v44 = (char *)v9 + v19;
      uint64_t v45 = (char *)v8 + v19;
      uint64_t v20 = sub_24D006880();
      uint64_t v43 = *(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 16);
      swift_bridgeObjectRetain();
      v43(v45, v44, v20);
      uint64_t v21 = v18[6];
      uint64_t v22 = (char *)v8 + v21;
      uint64_t v23 = (uint64_t *)((char *)v9 + v21);
      unint64_t v24 = v23[1];
      if (v24 >> 60 == 15)
      {
        *(_OWORD *)uint64_t v22 = *(_OWORD *)v23;
      }
      else
      {
        uint64_t v46 = *v23;
        sub_24CFE7000(*v23, v24);
        *(void *)uint64_t v22 = v46;
        *((void *)v22 + 1) = v24;
      }
      *(uint64_t *)((char *)v8 + v18[7]) = *(uint64_t *)((char *)v9 + v18[7]);
      uint64_t v25 = v18[8];
      uint64_t v47 = v18;
      unint64_t v26 = (uint64_t *)((char *)v8 + v25);
      uint64_t v27 = (uint64_t *)((char *)v9 + v25);
      uint64_t v28 = *v27;
      unint64_t v29 = v27[1];
      swift_bridgeObjectRetain();
      sub_24CFE7000(v28, v29);
      uint64_t *v26 = v28;
      v26[1] = v29;
      uint64_t v30 = v47[9];
      unint64_t v31 = (uint64_t *)((char *)v8 + v30);
      uint64_t v32 = (uint64_t *)((char *)v9 + v30);
      uint64_t v33 = v32[1];
      *unint64_t v31 = *v32;
      v31[1] = v33;
      swift_bridgeObjectRetain();
    }
    swift_storeEnumTagMultiPayload();
    (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  uint64_t v34 = a3[6];
  uint64_t v35 = a3[7];
  uint64_t v36 = (void *)((char *)a1 + v34);
  uint64_t v37 = (void *)((char *)a2 + v34);
  uint64_t v38 = v37[1];
  void *v36 = *v37;
  v36[1] = v38;
  uint64_t v39 = (void *)((char *)a1 + v35);
  uint64_t v40 = (void *)((char *)a2 + v35);
  uint64_t v41 = v40[1];
  *uint64_t v39 = *v40;
  v39[1] = v41;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for DriverKitDriver(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[5];
  uint64_t v7 = (void *)((char *)a1 + v6);
  uint64_t v8 = (void *)((char *)a2 + v6);
  uint64_t v9 = type metadata accessor for DriverKitDriverApp();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(v10 + 48);
  int v12 = v11(v7, 1, v9);
  int v13 = v11(v8, 1, v9);
  if (v12)
  {
    if (!v13)
    {
      int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
      uint64_t v15 = *v8;
      if (EnumCaseMultiPayload == 1)
      {
        unint64_t v16 = v8[1];
        sub_24CFE7000(v15, v16);
        uint64_t *v7 = v15;
        v7[1] = v16;
      }
      else
      {
        uint64_t *v7 = v15;
        v7[1] = v8[1];
        uint64_t v21 = (int *)type metadata accessor for SettingsApplicationRecord();
        uint64_t v22 = v21[5];
        v61 = (char *)v8 + v22;
        v63 = (char *)v7 + v22;
        uint64_t v23 = sub_24D006880();
        v59 = *(void (**)(char *, char *, uint64_t))(*(void *)(v23 - 8) + 16);
        swift_bridgeObjectRetain();
        v59(v63, v61, v23);
        uint64_t v24 = v21[6];
        uint64_t v25 = (char *)v7 + v24;
        unint64_t v26 = (uint64_t *)((char *)v8 + v24);
        unint64_t v27 = v26[1];
        if (v27 >> 60 == 15)
        {
          *(_OWORD *)uint64_t v25 = *(_OWORD *)v26;
        }
        else
        {
          uint64_t v64 = *v26;
          sub_24CFE7000(*v26, v27);
          *(void *)uint64_t v25 = v64;
          *((void *)v25 + 1) = v27;
        }
        *(uint64_t *)((char *)v7 + v21[7]) = *(uint64_t *)((char *)v8 + v21[7]);
        uint64_t v28 = v21[8];
        v65 = v21;
        unint64_t v29 = (uint64_t *)((char *)v7 + v28);
        uint64_t v30 = (uint64_t *)((char *)v8 + v28);
        uint64_t v31 = *v30;
        unint64_t v32 = v30[1];
        swift_bridgeObjectRetain();
        sub_24CFE7000(v31, v32);
        *unint64_t v29 = v31;
        v29[1] = v32;
        uint64_t v33 = v65[9];
        uint64_t v34 = (uint64_t *)((char *)v7 + v33);
        uint64_t v35 = (uint64_t *)((char *)v8 + v33);
        void *v34 = *v35;
        v34[1] = v35[1];
        swift_bridgeObjectRetain();
      }
      swift_storeEnumTagMultiPayload();
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
      goto LABEL_16;
    }
LABEL_7:
    uint64_t v17 = type metadata accessor for DriverKitDriverSource();
    memcpy(v7, v8, *(void *)(*(void *)(v17 - 8) + 64));
    goto LABEL_16;
  }
  if (v13)
  {
    sub_24CFE81BC((uint64_t)v7, (uint64_t (*)(void))type metadata accessor for DriverKitDriverApp);
    goto LABEL_7;
  }
  if (a1 != a2)
  {
    sub_24CFE81BC((uint64_t)v7, (uint64_t (*)(void))type metadata accessor for DriverKitDriverApp);
    int v18 = swift_getEnumCaseMultiPayload();
    uint64_t v19 = *v8;
    if (v18 == 1)
    {
      unint64_t v20 = v8[1];
      sub_24CFE7000(v19, v20);
      uint64_t *v7 = v19;
      v7[1] = v20;
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      uint64_t *v7 = v19;
      v7[1] = v8[1];
      uint64_t v43 = (int *)type metadata accessor for SettingsApplicationRecord();
      uint64_t v44 = v43[5];
      v62 = (char *)v8 + v44;
      v66 = (char *)v7 + v44;
      uint64_t v45 = sub_24D006880();
      v60 = *(void (**)(char *, char *, uint64_t))(*(void *)(v45 - 8) + 16);
      swift_bridgeObjectRetain();
      v60(v66, v62, v45);
      uint64_t v46 = v43[6];
      uint64_t v47 = (char *)v7 + v46;
      uint64_t v48 = (char *)v8 + v46;
      unint64_t v49 = *((void *)v48 + 1);
      if (v49 >> 60 == 15)
      {
        *(_OWORD *)uint64_t v47 = *(_OWORD *)v48;
      }
      else
      {
        uint64_t v50 = *(void *)v48;
        sub_24CFE7000(*(void *)v48, *((void *)v48 + 1));
        *(void *)uint64_t v47 = v50;
        *((void *)v47 + 1) = v49;
      }
      *(uint64_t *)((char *)v7 + v43[7]) = *(uint64_t *)((char *)v8 + v43[7]);
      uint64_t v51 = v43[8];
      BOOL v52 = (uint64_t *)((char *)v7 + v51);
      uint64_t v53 = (uint64_t *)((char *)v8 + v51);
      uint64_t v54 = *v53;
      unint64_t v55 = v53[1];
      swift_bridgeObjectRetain();
      sub_24CFE7000(v54, v55);
      *BOOL v52 = v54;
      v52[1] = v55;
      uint64_t v56 = v43[9];
      v57 = (uint64_t *)((char *)v7 + v56);
      v58 = (uint64_t *)((char *)v8 + v56);
      void *v57 = *v58;
      v57[1] = v58[1];
      swift_bridgeObjectRetain();
      swift_storeEnumTagMultiPayload();
    }
  }
LABEL_16:
  uint64_t v36 = a3[6];
  uint64_t v37 = (void *)((char *)a1 + v36);
  uint64_t v38 = (void *)((char *)a2 + v36);
  *uint64_t v37 = *v38;
  v37[1] = v38[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v39 = a3[7];
  uint64_t v40 = (void *)((char *)a1 + v39);
  uint64_t v41 = (void *)((char *)a2 + v39);
  *uint64_t v40 = *v41;
  v40[1] = v41[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *initializeWithTake for DriverKitDriver(_OWORD *a1, _OWORD *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = (_OWORD *)((char *)a1 + v6);
  uint64_t v8 = (_OWORD *)((char *)a2 + v6);
  uint64_t v9 = type metadata accessor for DriverKitDriverApp();
  uint64_t v10 = *(void *)(v9 - 8);
  if ((*(unsigned int (**)(_OWORD *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
  {
    uint64_t v11 = type metadata accessor for DriverKitDriverSource();
    memcpy(v7, v8, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(v7, v8, *(void *)(v10 + 64));
    }
    else
    {
      _OWORD *v7 = *v8;
      int v12 = (int *)type metadata accessor for SettingsApplicationRecord();
      uint64_t v13 = v12[5];
      uint64_t v14 = (char *)v7 + v13;
      uint64_t v15 = (char *)v8 + v13;
      uint64_t v16 = sub_24D006880();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 32))(v14, v15, v16);
      *(_OWORD *)((char *)v7 + v12[6]) = *(_OWORD *)((char *)v8 + v12[6]);
      *(void *)((char *)v7 + v12[7]) = *(void *)((char *)v8 + v12[7]);
      *(_OWORD *)((char *)v7 + v12[8]) = *(_OWORD *)((char *)v8 + v12[8]);
      *(_OWORD *)((char *)v7 + v12[9]) = *(_OWORD *)((char *)v8 + v12[9]);
      swift_storeEnumTagMultiPayload();
    }
    (*(void (**)(_OWORD *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  uint64_t v17 = a3[7];
  *(_OWORD *)((char *)a1 + a3[6]) = *(_OWORD *)((char *)a2 + a3[6]);
  *(_OWORD *)((char *)a1 + v17) = *(_OWORD *)((char *)a2 + v17);
  return a1;
}

void *assignWithTake for DriverKitDriver(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a3[5];
  uint64_t v8 = (_OWORD *)((char *)a1 + v7);
  uint64_t v9 = (_OWORD *)((char *)a2 + v7);
  uint64_t v10 = type metadata accessor for DriverKitDriverApp();
  uint64_t v11 = *(void *)(v10 - 8);
  int v12 = *(uint64_t (**)(_OWORD *, uint64_t, uint64_t))(v11 + 48);
  int v13 = v12(v8, 1, v10);
  int v14 = v12(v9, 1, v10);
  if (!v13)
  {
    if (!v14)
    {
      if (a1 == a2) {
        goto LABEL_14;
      }
      sub_24CFE81BC((uint64_t)v8, (uint64_t (*)(void))type metadata accessor for DriverKitDriverApp);
      if (!swift_getEnumCaseMultiPayload())
      {
        *uint64_t v8 = *v9;
        unint64_t v32 = (int *)type metadata accessor for SettingsApplicationRecord();
        uint64_t v33 = v32[5];
        uint64_t v34 = (char *)v8 + v33;
        uint64_t v35 = (char *)v9 + v33;
        uint64_t v36 = sub_24D006880();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v36 - 8) + 32))(v34, v35, v36);
        *(_OWORD *)((char *)v8 + v32[6]) = *(_OWORD *)((char *)v9 + v32[6]);
        *(void *)((char *)v8 + v32[7]) = *(void *)((char *)v9 + v32[7]);
        *(_OWORD *)((char *)v8 + v32[8]) = *(_OWORD *)((char *)v9 + v32[8]);
        *(_OWORD *)((char *)v8 + v32[9]) = *(_OWORD *)((char *)v9 + v32[9]);
        swift_storeEnumTagMultiPayload();
        goto LABEL_14;
      }
      size_t v15 = *(void *)(v11 + 64);
      goto LABEL_8;
    }
    sub_24CFE81BC((uint64_t)v8, (uint64_t (*)(void))type metadata accessor for DriverKitDriverApp);
LABEL_7:
    size_t v15 = *(void *)(*(void *)(type metadata accessor for DriverKitDriverSource() - 8) + 64);
LABEL_8:
    memcpy(v8, v9, v15);
    goto LABEL_14;
  }
  if (v14) {
    goto LABEL_7;
  }
  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(v8, v9, *(void *)(v11 + 64));
  }
  else
  {
    *uint64_t v8 = *v9;
    uint64_t v16 = (int *)type metadata accessor for SettingsApplicationRecord();
    uint64_t v17 = v16[5];
    int v18 = (char *)v8 + v17;
    uint64_t v19 = (char *)v9 + v17;
    uint64_t v20 = sub_24D006880();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 32))(v18, v19, v20);
    *(_OWORD *)((char *)v8 + v16[6]) = *(_OWORD *)((char *)v9 + v16[6]);
    *(void *)((char *)v8 + v16[7]) = *(void *)((char *)v9 + v16[7]);
    *(_OWORD *)((char *)v8 + v16[8]) = *(_OWORD *)((char *)v9 + v16[8]);
    *(_OWORD *)((char *)v8 + v16[9]) = *(_OWORD *)((char *)v9 + v16[9]);
    swift_storeEnumTagMultiPayload();
  }
  (*(void (**)(_OWORD *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
LABEL_14:
  uint64_t v21 = a3[6];
  uint64_t v22 = (void *)((char *)a1 + v21);
  uint64_t v23 = (void *)((char *)a2 + v21);
  uint64_t v25 = *v23;
  uint64_t v24 = v23[1];
  *uint64_t v22 = v25;
  v22[1] = v24;
  swift_bridgeObjectRelease();
  uint64_t v26 = a3[7];
  unint64_t v27 = (void *)((char *)a1 + v26);
  uint64_t v28 = (void *)((char *)a2 + v26);
  uint64_t v30 = *v28;
  uint64_t v29 = v28[1];
  *unint64_t v27 = v30;
  v27[1] = v29;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for DriverKitDriver(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24CFE7E44);
}

uint64_t sub_24CFE7E44(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = type metadata accessor for DriverKitDriverSource();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 20);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for DriverKitDriver(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24CFE7F08);
}

uint64_t sub_24CFE7F08(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = type metadata accessor for DriverKitDriverSource();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 20);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_24CFE7FB0()
{
  uint64_t result = type metadata accessor for DriverKitDriverSource();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
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

unint64_t sub_24CFE8098()
{
  unint64_t result = qword_26B182FD0;
  if (!qword_26B182FD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B182FD0);
  }
  return result;
}

uint64_t sub_24CFE80EC(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_24CFE8154(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_24CFE81BC(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t DriverKitDriverApp.description.getter()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for SettingsApplicationRecord();
  MEMORY[0x270FA5388](v2);
  unint64_t v4 = &v12[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = type metadata accessor for DriverKitDriverApp();
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (uint64_t *)&v12[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_24CFE8558(v1, (uint64_t)v7);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v8 = *v7;
    unint64_t v9 = v7[1];
    unint64_t v14 = 0;
    unint64_t v15 = 0xE000000000000000;
    sub_24D006CC0();
    swift_bridgeObjectRelease();
    unint64_t v14 = 0xD00000000000002CLL;
    unint64_t v15 = 0x800000024D00A510;
    uint64_t v13 = sub_24CFE85C8(v8, v9);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B182FE0);
    sub_24CFE896C();
    sub_24D006A40();
    swift_bridgeObjectRelease();
    sub_24D006AD0();
    swift_bridgeObjectRelease();
    sub_24CFE71CC(v8, v9);
    return v14;
  }
  else
  {
    sub_24CFE8A10((uint64_t)v7, (uint64_t)v4);
    unint64_t v14 = 0;
    unint64_t v15 = 0xE000000000000000;
    sub_24D006CC0();
    swift_bridgeObjectRelease();
    unint64_t v14 = 544239681;
    unint64_t v15 = 0xE400000000000000;
    swift_bridgeObjectRetain();
    sub_24D006AD0();
    swift_bridgeObjectRelease();
    sub_24D006AD0();
    uint64_t v13 = sub_24CFE85C8(*(void *)&v4[*(int *)(v2 + 32)], *(void *)&v4[*(int *)(v2 + 32) + 8]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B182FE0);
    sub_24CFE896C();
    sub_24D006A40();
    swift_bridgeObjectRelease();
    sub_24D006AD0();
    swift_bridgeObjectRelease();
    unint64_t v10 = v14;
    sub_24CFE9478((uint64_t)v4, (uint64_t (*)(void))type metadata accessor for SettingsApplicationRecord);
  }
  return v10;
}

uint64_t type metadata accessor for DriverKitDriverApp()
{
  uint64_t result = qword_26B1830A0;
  if (!qword_26B1830A0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24CFE8558(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for DriverKitDriverApp();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24CFE85C8(uint64_t a1, unint64_t a2)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  unint64_t v2 = a2 >> 62;
  uint64_t v3 = MEMORY[0x263F8EE78];
  switch(a2 >> 62)
  {
    case 1uLL:
      if (__OFSUB__(HIDWORD(a1), a1)) {
        goto LABEL_43;
      }
      uint64_t v4 = HIDWORD(a1) - (int)a1;
LABEL_6:
      if (!v4) {
        return v3;
      }
      uint64_t v29 = MEMORY[0x263F8EE78];
      int64_t v7 = v4 & ~(v4 >> 63);
      sub_24CFEFC38(0, v7, 0);
      uint64_t v3 = v29;
      if (v2)
      {
        if (v2 == 1) {
          uint64_t v8 = (int)a1;
        }
        else {
          uint64_t v8 = *(void *)(a1 + 16);
        }
        if (v4 < 0)
        {
LABEL_42:
          __break(1u);
LABEL_43:
          __break(1u);
LABEL_44:
          __break(1u);
LABEL_45:
          __break(1u);
LABEL_46:
          __break(1u);
LABEL_47:
          __break(1u);
        }
      }
      else
      {
        if (v4 < 0) {
          goto LABEL_45;
        }
        uint64_t v8 = 0;
      }
      int v25 = v2;
      do
      {
        if (!v7)
        {
          __break(1u);
LABEL_36:
          __break(1u);
LABEL_37:
          __break(1u);
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          goto LABEL_42;
        }
        if (v2)
        {
          if (v2 == 1)
          {
            if (v8 < (int)a1 || v8 >= a1 >> 32) {
              goto LABEL_36;
            }
            uint64_t v9 = sub_24D0067D0();
            if (!v9) {
              goto LABEL_46;
            }
            uint64_t v10 = v9;
            uint64_t v11 = sub_24D0067F0();
            uint64_t v12 = v8 - v11;
            if (__OFSUB__(v8, v11)) {
              goto LABEL_39;
            }
          }
          else
          {
            if (v8 < *(void *)(a1 + 16)) {
              goto LABEL_38;
            }
            if (v8 >= *(void *)(a1 + 24)) {
              goto LABEL_40;
            }
            uint64_t v14 = sub_24D0067D0();
            if (!v14) {
              goto LABEL_47;
            }
            uint64_t v10 = v14;
            uint64_t v15 = sub_24D0067F0();
            uint64_t v12 = v8 - v15;
            if (__OFSUB__(v8, v15)) {
              goto LABEL_41;
            }
          }
          char v13 = *(unsigned char *)(v10 + v12);
        }
        else
        {
          if (v8 >= BYTE6(a2)) {
            goto LABEL_37;
          }
          uint64_t v26 = a1;
          int v27 = a2;
          __int16 v28 = WORD2(a2);
          char v13 = *((unsigned char *)&v26 + v8);
        }
        __swift_instantiateConcreteTypeFromMangledName(qword_26B1831A0);
        uint64_t v16 = swift_allocObject();
        *(_OWORD *)(v16 + 16) = xmmword_24D007930;
        *(void *)(v16 + 56) = MEMORY[0x263F8E778];
        *(void *)(v16 + 64) = MEMORY[0x263F8E7C0];
        *(unsigned char *)(v16 + 32) = v13;
        unint64_t v2 = sub_24D006A70();
        uint64_t v18 = v17;
        uint64_t v29 = v3;
        unint64_t v20 = *(void *)(v3 + 16);
        unint64_t v19 = *(void *)(v3 + 24);
        if (v20 >= v19 >> 1)
        {
          sub_24CFEFC38(v19 > 1, v20 + 1, 1);
          uint64_t v3 = v29;
        }
        *(void *)(v3 + 16) = v20 + 1;
        uint64_t v21 = v3 + 16 * v20;
        *(void *)(v21 + 32) = v2;
        *(void *)(v21 + 40) = v18;
        ++v8;
        --v7;
        --v4;
        LODWORD(v2) = v25;
      }
      while (v4);
      return v3;
    case 2uLL:
      uint64_t v6 = *(void *)(a1 + 16);
      uint64_t v5 = *(void *)(a1 + 24);
      uint64_t v4 = v5 - v6;
      if (!__OFSUB__(v5, v6)) {
        goto LABEL_6;
      }
      goto LABEL_44;
    case 3uLL:
      return v3;
    default:
      uint64_t v4 = BYTE6(a2);
      goto LABEL_6;
  }
}

unint64_t sub_24CFE896C()
{
  unint64_t result = qword_26B182FE8;
  if (!qword_26B182FE8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B182FE0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B182FE8);
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

uint64_t sub_24CFE8A10(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SettingsApplicationRecord();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24CFE8A74(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v8 = 0;
  switch(a2 >> 62)
  {
    case 1uLL:
      LODWORD(v8) = HIDWORD(a1) - a1;
      if (__OFSUB__(HIDWORD(a1), a1))
      {
        __break(1u);
LABEL_19:
        __break(1u);
LABEL_20:
        __break(1u);
LABEL_21:
        __break(1u);
        JUMPOUT(0x24CFE8BB0);
      }
      uint64_t v8 = (int)v8;
LABEL_6:
      switch(a4 >> 62)
      {
        case 1uLL:
          LODWORD(v12) = HIDWORD(a3) - a3;
          if (__OFSUB__(HIDWORD(a3), a3)) {
            goto LABEL_20;
          }
          uint64_t v12 = (int)v12;
LABEL_11:
          if (v8 == v12)
          {
            if (v8 < 1)
            {
              char v15 = 1;
            }
            else
            {
              sub_24CFE7000(a3, a4);
              char v15 = sub_24CFEFA08(a1, a2, a3, a4);
            }
          }
          else
          {
            char v15 = 0;
          }
          return v15 & 1;
        case 2uLL:
          uint64_t v14 = *(void *)(a3 + 16);
          uint64_t v13 = *(void *)(a3 + 24);
          BOOL v11 = __OFSUB__(v13, v14);
          uint64_t v12 = v13 - v14;
          if (!v11) {
            goto LABEL_11;
          }
          goto LABEL_21;
        case 3uLL:
          char v15 = v8 == 0;
          return v15 & 1;
        default:
          uint64_t v12 = BYTE6(a4);
          goto LABEL_11;
      }
    case 2uLL:
      uint64_t v10 = *(void *)(a1 + 16);
      uint64_t v9 = *(void *)(a1 + 24);
      BOOL v11 = __OFSUB__(v9, v10);
      uint64_t v8 = v9 - v10;
      if (!v11) {
        goto LABEL_6;
      }
      goto LABEL_19;
    case 3uLL:
      goto LABEL_6;
    default:
      uint64_t v8 = BYTE6(a2);
      goto LABEL_6;
  }
}

uint64_t _s16DriverManagement0a3KitA3AppO2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SettingsApplicationRecord();
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  int64_t v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v27 - v8;
  uint64_t v10 = type metadata accessor for DriverKitDriverApp();
  uint64_t v11 = MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = MEMORY[0x270FA5388](v11);
  uint64_t v16 = (uint64_t *)((char *)&v27 - v15);
  MEMORY[0x270FA5388](v14);
  uint64_t v18 = (uint64_t *)((char *)&v27 - v17);
  sub_24CFE8558(a1, (uint64_t)&v27 - v17);
  if (swift_getEnumCaseMultiPayload() != 1)
  {
    sub_24CFE8A10((uint64_t)v18, (uint64_t)v9);
    sub_24CFE8558(a2, (uint64_t)v13);
    if (swift_getEnumCaseMultiPayload() != 1)
    {
      sub_24CFE8A10((uint64_t)v13, (uint64_t)v7);
      char v23 = sub_24CFE8A74(*(void *)&v9[*(int *)(v4 + 32)], *(void *)&v9[*(int *)(v4 + 32) + 8], *(void *)&v7[*(int *)(v4 + 32)], *(void *)&v7[*(int *)(v4 + 32) + 8]);
      sub_24CFE9478((uint64_t)v7, (uint64_t (*)(void))type metadata accessor for SettingsApplicationRecord);
      sub_24CFE9478((uint64_t)v9, (uint64_t (*)(void))type metadata accessor for SettingsApplicationRecord);
      return v23 & 1;
    }
    sub_24CFE9478((uint64_t)v13, (uint64_t (*)(void))type metadata accessor for DriverKitDriverApp);
    uint64_t v24 = type metadata accessor for SettingsApplicationRecord;
    uint64_t v25 = (uint64_t)v9;
    goto LABEL_7;
  }
  uint64_t v19 = *v18;
  unint64_t v20 = v18[1];
  sub_24CFE8558(a2, (uint64_t)v16);
  if (swift_getEnumCaseMultiPayload() != 1)
  {
    sub_24CFE71CC(v19, v20);
    uint64_t v24 = type metadata accessor for DriverKitDriverApp;
    uint64_t v25 = (uint64_t)v16;
LABEL_7:
    sub_24CFE9478(v25, (uint64_t (*)(void))v24);
    char v23 = 0;
    return v23 & 1;
  }
  uint64_t v21 = *v16;
  unint64_t v22 = v16[1];
  char v23 = sub_24CFE8A74(v19, v20, *v16, v22);
  sub_24CFE71CC(v19, v20);
  sub_24CFE71CC(v21, v22);
  return v23 & 1;
}

uint64_t *initializeBufferWithCopyOfBuffer for DriverKitDriverApp(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    uint64_t v7 = *a2;
    if (EnumCaseMultiPayload == 1)
    {
      unint64_t v8 = a2[1];
      sub_24CFE7000(v7, v8);
      *a1 = v7;
      a1[1] = v8;
    }
    else
    {
      uint64_t v10 = a2[1];
      *a1 = v7;
      a1[1] = v10;
      uint64_t v11 = (int *)type metadata accessor for SettingsApplicationRecord();
      uint64_t v12 = v11[5];
      uint64_t v13 = (char *)a1 + v12;
      uint64_t v14 = (char *)a2 + v12;
      uint64_t v15 = sub_24D006880();
      uint64_t v16 = *(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16);
      swift_bridgeObjectRetain();
      v16(v13, v14, v15);
      uint64_t v17 = v11[6];
      uint64_t v18 = (char *)a1 + v17;
      uint64_t v19 = (char *)a2 + v17;
      unint64_t v20 = *((void *)v19 + 1);
      if (v20 >> 60 == 15)
      {
        *(_OWORD *)uint64_t v18 = *(_OWORD *)v19;
      }
      else
      {
        uint64_t v21 = *(void *)v19;
        sub_24CFE7000(*(void *)v19, *((void *)v19 + 1));
        *(void *)uint64_t v18 = v21;
        *((void *)v18 + 1) = v20;
      }
      *(uint64_t *)((char *)a1 + v11[7]) = *(uint64_t *)((char *)a2 + v11[7]);
      uint64_t v22 = v11[8];
      char v23 = (uint64_t *)((char *)a1 + v22);
      uint64_t v24 = (uint64_t *)((char *)a2 + v22);
      uint64_t v25 = *v24;
      unint64_t v26 = v24[1];
      swift_bridgeObjectRetain();
      sub_24CFE7000(v25, v26);
      *char v23 = v25;
      v23[1] = v26;
      uint64_t v27 = v11[9];
      __int16 v28 = (uint64_t *)((char *)a1 + v27);
      uint64_t v29 = (uint64_t *)((char *)a2 + v27);
      uint64_t v30 = v29[1];
      void *v28 = *v29;
      v28[1] = v30;
      swift_bridgeObjectRetain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t destroy for DriverKitDriverApp(uint64_t *a1)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v2 = *a1;
    unint64_t v3 = a1[1];
    return sub_24CFE71CC(v2, v3);
  }
  else
  {
    swift_bridgeObjectRelease();
    int v5 = (int *)type metadata accessor for SettingsApplicationRecord();
    uint64_t v6 = (char *)a1 + v5[5];
    uint64_t v7 = sub_24D006880();
    (*(void (**)(char *, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
    unint64_t v8 = (uint64_t *)((char *)a1 + v5[6]);
    unint64_t v9 = v8[1];
    if (v9 >> 60 != 15) {
      sub_24CFE71CC(*v8, v9);
    }
    swift_bridgeObjectRelease();
    sub_24CFE71CC(*(uint64_t *)((char *)a1 + v5[8]), *(uint64_t *)((char *)a1 + v5[8] + 8));
    return swift_bridgeObjectRelease();
  }
}

uint64_t *initializeWithCopy for DriverKitDriverApp(uint64_t *a1, uint64_t *a2)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  uint64_t v5 = *a2;
  if (EnumCaseMultiPayload == 1)
  {
    unint64_t v6 = a2[1];
    sub_24CFE7000(v5, v6);
    *a1 = v5;
    a1[1] = v6;
  }
  else
  {
    uint64_t v7 = a2[1];
    *a1 = v5;
    a1[1] = v7;
    unint64_t v8 = (int *)type metadata accessor for SettingsApplicationRecord();
    uint64_t v9 = v8[5];
    uint64_t v10 = (char *)a1 + v9;
    uint64_t v11 = (char *)a2 + v9;
    uint64_t v12 = sub_24D006880();
    uint64_t v13 = *(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16);
    swift_bridgeObjectRetain();
    v13(v10, v11, v12);
    uint64_t v14 = v8[6];
    uint64_t v15 = (char *)a1 + v14;
    uint64_t v16 = (char *)a2 + v14;
    unint64_t v17 = *((void *)v16 + 1);
    if (v17 >> 60 == 15)
    {
      *(_OWORD *)uint64_t v15 = *(_OWORD *)v16;
    }
    else
    {
      uint64_t v18 = *(void *)v16;
      sub_24CFE7000(*(void *)v16, *((void *)v16 + 1));
      *(void *)uint64_t v15 = v18;
      *((void *)v15 + 1) = v17;
    }
    *(uint64_t *)((char *)a1 + v8[7]) = *(uint64_t *)((char *)a2 + v8[7]);
    uint64_t v19 = v8[8];
    unint64_t v20 = (uint64_t *)((char *)a1 + v19);
    uint64_t v21 = (uint64_t *)((char *)a2 + v19);
    uint64_t v22 = *v21;
    unint64_t v23 = v21[1];
    swift_bridgeObjectRetain();
    sub_24CFE7000(v22, v23);
    uint64_t *v20 = v22;
    v20[1] = v23;
    uint64_t v24 = v8[9];
    uint64_t v25 = (uint64_t *)((char *)a1 + v24);
    unint64_t v26 = (uint64_t *)((char *)a2 + v24);
    uint64_t v27 = v26[1];
    *uint64_t v25 = *v26;
    v25[1] = v27;
    swift_bridgeObjectRetain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t *assignWithCopy for DriverKitDriverApp(uint64_t *a1, uint64_t *a2)
{
  if (a1 != a2)
  {
    sub_24CFE9478((uint64_t)a1, (uint64_t (*)(void))type metadata accessor for DriverKitDriverApp);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    uint64_t v5 = *a2;
    if (EnumCaseMultiPayload == 1)
    {
      unint64_t v6 = a2[1];
      sub_24CFE7000(v5, v6);
      *a1 = v5;
      a1[1] = v6;
    }
    else
    {
      *a1 = v5;
      a1[1] = a2[1];
      uint64_t v7 = (int *)type metadata accessor for SettingsApplicationRecord();
      uint64_t v8 = v7[5];
      uint64_t v9 = (char *)a1 + v8;
      uint64_t v10 = (char *)a2 + v8;
      uint64_t v11 = sub_24D006880();
      uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
      swift_bridgeObjectRetain();
      v12(v9, v10, v11);
      uint64_t v13 = v7[6];
      uint64_t v14 = (char *)a1 + v13;
      uint64_t v15 = (char *)a2 + v13;
      unint64_t v16 = *((void *)v15 + 1);
      if (v16 >> 60 == 15)
      {
        *(_OWORD *)uint64_t v14 = *(_OWORD *)v15;
      }
      else
      {
        uint64_t v17 = *(void *)v15;
        sub_24CFE7000(*(void *)v15, *((void *)v15 + 1));
        *(void *)uint64_t v14 = v17;
        *((void *)v14 + 1) = v16;
      }
      *(uint64_t *)((char *)a1 + v7[7]) = *(uint64_t *)((char *)a2 + v7[7]);
      uint64_t v18 = v7[8];
      uint64_t v19 = (uint64_t *)((char *)a1 + v18);
      unint64_t v20 = (uint64_t *)((char *)a2 + v18);
      uint64_t v21 = *v20;
      unint64_t v22 = v20[1];
      swift_bridgeObjectRetain();
      sub_24CFE7000(v21, v22);
      *uint64_t v19 = v21;
      v19[1] = v22;
      uint64_t v23 = v7[9];
      uint64_t v24 = (uint64_t *)((char *)a1 + v23);
      uint64_t v25 = (uint64_t *)((char *)a2 + v23);
      void *v24 = *v25;
      v24[1] = v25[1];
      swift_bridgeObjectRetain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_24CFE9478(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

_OWORD *initializeWithTake for DriverKitDriverApp(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    *a1 = *a2;
    unint64_t v6 = (int *)type metadata accessor for SettingsApplicationRecord();
    uint64_t v7 = v6[5];
    uint64_t v8 = (char *)a1 + v7;
    uint64_t v9 = (char *)a2 + v7;
    uint64_t v10 = sub_24D006880();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
    *(_OWORD *)((char *)a1 + v6[6]) = *(_OWORD *)((char *)a2 + v6[6]);
    *(void *)((char *)a1 + v6[7]) = *(void *)((char *)a2 + v6[7]);
    *(_OWORD *)((char *)a1 + v6[8]) = *(_OWORD *)((char *)a2 + v6[8]);
    *(_OWORD *)((char *)a1 + v6[9]) = *(_OWORD *)((char *)a2 + v6[9]);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

_OWORD *assignWithTake for DriverKitDriverApp(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_24CFE9478((uint64_t)a1, (uint64_t (*)(void))type metadata accessor for DriverKitDriverApp);
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
    else
    {
      *a1 = *a2;
      unint64_t v6 = (int *)type metadata accessor for SettingsApplicationRecord();
      uint64_t v7 = v6[5];
      uint64_t v8 = (char *)a1 + v7;
      uint64_t v9 = (char *)a2 + v7;
      uint64_t v10 = sub_24D006880();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
      *(_OWORD *)((char *)a1 + v6[6]) = *(_OWORD *)((char *)a2 + v6[6]);
      *(void *)((char *)a1 + v6[7]) = *(void *)((char *)a2 + v6[7]);
      *(_OWORD *)((char *)a1 + v6[8]) = *(_OWORD *)((char *)a2 + v6[8]);
      *(_OWORD *)((char *)a1 + v6[9]) = *(_OWORD *)((char *)a2 + v6[9]);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for DriverKitDriverApp(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t storeEnumTagSinglePayload for DriverKitDriverApp(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_24CFE976C()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_24CFE977C()
{
  uint64_t result = type metadata accessor for SettingsApplicationRecord();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

unint64_t ApprovalStateUpdateStatus.description.getter(uint64_t a1)
{
  if (a1) {
    return 0xD000000000000012;
  }
  else {
    return 0xD000000000000015;
  }
}

unint64_t sub_24CFE9848()
{
  if (*v0) {
    return 0xD000000000000012;
  }
  else {
    return 0xD000000000000015;
  }
}

BOOL static ApprovalStateUpdateStatus.__derived_enum_equals(_:_:)(uint64_t a1, uint64_t a2)
{
  BOOL result = (a1 | a2) == 0;
  if (a1)
  {
    if (a2)
    {
      swift_retain();
      swift_retain();
      char updated = _s16DriverManagement26ApprovalStateUpdateRequestC2eeoiySbAC_ACtFZ_0(a1, a2);
      swift_release();
      swift_release();
      return updated & 1;
    }
  }
  return result;
}

BOOL sub_24CFE98FC(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *a2;
  BOOL result = (*a1 | *a2) == 0;
  if (v2) {
    BOOL v5 = v3 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5)
  {
    swift_retain();
    swift_retain();
    char updated = _s16DriverManagement26ApprovalStateUpdateRequestC2eeoiySbAC_ACtFZ_0(v2, v3);
    swift_release();
    swift_release();
    return updated & 1;
  }
  return result;
}

void *initializeBufferWithCopyOfBuffer for ApprovalStateUpdateStatus(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  return a1;
}

uint64_t destroy for ApprovalStateUpdateStatus()
{
  return swift_release();
}

void *assignWithCopy for ApprovalStateUpdateStatus(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  return a1;
}

void *__swift_memcpy8_8(void *result, void *a2)
{
  *BOOL result = *a2;
  return result;
}

void *assignWithTake for ApprovalStateUpdateStatus(void *a1, void *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for ApprovalStateUpdateStatus(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 8)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  if ((v3 + 1) >= 2) {
    return v3;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for ApprovalStateUpdateStatus(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)BOOL result = 0;
    *(_DWORD *)BOOL result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 8) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 8) = 0;
    }
    if (a2) {
      *(void *)BOOL result = a2;
    }
  }
  return result;
}

uint64_t sub_24CFE9ACC(uint64_t *a1)
{
  uint64_t v1 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_24CFE9AE4(void *result, int a2)
{
  if (a2 < 0)
  {
    unsigned int v2 = a2 ^ 0x80000000;
  }
  else
  {
    if (!a2) {
      return result;
    }
    unsigned int v2 = a2 - 1;
  }
  *BOOL result = v2;
  return result;
}

ValueMetadata *type metadata accessor for ApprovalStateUpdateStatus()
{
  return &type metadata for ApprovalStateUpdateStatus;
}

void *sub_24CFE9B1C()
{
  BOOL result = (void *)sub_24D0023D8((uint64_t)&unk_26FF5F588);
  off_26B182F50 = result;
  return result;
}

DriverManagement::ApprovalState_optional __swiftcall ApprovalState.init(fromString:)(Swift::String fromString)
{
  object = fromString._object;
  uint64_t countAndFlagsBits = fromString._countAndFlagsBits;
  if (qword_26B182F58 != -1) {
    swift_once();
  }
  uint64_t v3 = off_26B182F50;
  if (*((void *)off_26B182F50 + 2)
    && (uint64_t v4 = sub_24CFF007C(countAndFlagsBits, (uint64_t)object, MEMORY[0x263F8D2A8], (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_24CFF0110), (v5 & 1) != 0))
  {
    v6.value = *(unsigned char *)(v3[7] + v4);
  }
  else
  {
    v6.value = DriverManagement_ApprovalState_unknownDefault;
  }
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t ApprovalState.stringValue.getter(uint64_t a1)
{
  char v1 = a1;
  if (qword_26B182F58 != -1) {
    a1 = swift_once();
  }
  MEMORY[0x270FA5388](a1);
  v8[16] = v1;
  uint64_t v2 = swift_bridgeObjectRetain();
  uint64_t v3 = sub_24CFF1368(v2, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_24CFF1178, (uint64_t)v8);
  swift_bridgeObjectRelease();
  uint64_t v4 = sub_24CFE9D04(v3);
  uint64_t v6 = v5;
  uint64_t result = swift_release();
  if (v6) {
    return (uint64_t)v4;
  }
  __break(1u);
  return result;
}

BOOL sub_24CFE9CF4(uint64_t a1, uint64_t a2, char a3, char a4)
{
  return a3 == a4;
}

unsigned char *sub_24CFE9D04(uint64_t a1)
{
  uint64_t result = (unsigned char *)sub_24CFFEFC0(a1);
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
  if (result == (unsigned char *)(1 << *(unsigned char *)(a1 + 32))) {
    return 0;
  }
  else {
    return sub_24CFFF048(&v5, (uint64_t)result, v3, 0, a1);
  }
}

Swift::Bool __swiftcall ApprovalState.canTransitionTo(_:)(DriverManagement::ApprovalState a1)
{
  if (v1 == 1) {
    int v2 = 2;
  }
  else {
    int v2 = 1;
  }
  return v2 == a1;
}

DriverManagement::ApprovalState_optional __swiftcall ApprovalState.init(rawValue:)(Swift::Int rawValue)
{
  if ((unint64_t)rawValue >= 3) {
    LOBYTE(rawValue) = 3;
  }
  return (DriverManagement::ApprovalState_optional)rawValue;
}

uint64_t ApprovalState.rawValue.getter(uint64_t result)
{
  return result;
}

BOOL sub_24CFE9DC4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_24CFE9DD8()
{
  return sub_24D006F60();
}

uint64_t sub_24CFE9E20()
{
  return sub_24D006F40();
}

uint64_t sub_24CFE9E4C()
{
  return sub_24D006F60();
}

uint64_t *sub_24CFE9E90@<X0>(uint64_t *result@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v2 = *result;
  if ((unint64_t)*result >= 3) {
    LOBYTE(v2) = 3;
  }
  *a2 = v2;
  return result;
}

void sub_24CFE9EA8(void *a1@<X8>)
{
  *a1 = *v1;
}

void *static ApprovalState.allCases.getter()
{
  return &unk_26FF5F560;
}

void sub_24CFE9EC0(void *a1@<X8>)
{
  *a1 = &unk_26FF5F5F0;
}

uint64_t ApprovalState.description.getter(uint64_t a1)
{
  char v1 = a1;
  if (qword_26B182F58 != -1) {
    a1 = swift_once();
  }
  MEMORY[0x270FA5388](a1);
  v8[16] = v1;
  uint64_t v2 = swift_bridgeObjectRetain();
  uint64_t v3 = sub_24CFF1368(v2, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_24CFF5888, (uint64_t)v8);
  swift_bridgeObjectRelease();
  char v4 = sub_24CFE9D04(v3);
  uint64_t v6 = v5;
  uint64_t result = swift_release();
  if (v6) {
    return (uint64_t)v4;
  }
  __break(1u);
  return result;
}

uint64_t sub_24CFE9FC0(uint64_t a1)
{
  char v2 = *v1;
  if (qword_26B182F58 != -1) {
    a1 = swift_once();
  }
  MEMORY[0x270FA5388](a1);
  v9[16] = v2;
  uint64_t v3 = swift_bridgeObjectRetain();
  uint64_t v4 = sub_24CFF1368(v3, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_24CFF5888, (uint64_t)v9);
  swift_bridgeObjectRelease();
  uint64_t v5 = sub_24CFE9D04(v4);
  uint64_t v7 = v6;
  uint64_t result = swift_release();
  if (v7) {
    return (uint64_t)v5;
  }
  __break(1u);
  return result;
}

uint64_t ApprovalState.debugDescription.getter(unsigned __int8 a1)
{
  uint64_t v10 = a1;
  uint64_t v11 = sub_24D006EC0();
  uint64_t v12 = v2;
  uint64_t v3 = sub_24D006AD0();
  if (qword_26B182F58 != -1) {
    uint64_t v3 = swift_once();
  }
  MEMORY[0x270FA5388](v3);
  v9[16] = a1;
  uint64_t v4 = swift_bridgeObjectRetain();
  uint64_t v5 = sub_24CFF1368(v4, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_24CFF5888, (uint64_t)v9);
  swift_bridgeObjectRelease();
  sub_24CFE9D04(v5);
  uint64_t v7 = v6;
  uint64_t result = swift_release();
  if (v7)
  {
    sub_24D006AD0();
    swift_bridgeObjectRelease();
    sub_24D006AD0();
    return v11;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_24CFEA1FC()
{
  return ApprovalState.debugDescription.getter(*v0);
}

uint64_t sub_24CFEA204()
{
  return sub_24D006B40();
}

uint64_t sub_24CFEA264()
{
  return sub_24D006B30();
}

unint64_t sub_24CFEA2C4(uint64_t a1, uint64_t a2, char a3)
{
  if (a3)
  {
    sub_24D006CC0();
    swift_bridgeObjectRelease();
    unint64_t v4 = 0xD000000000000010;
  }
  else
  {
    sub_24D006CC0();
    swift_bridgeObjectRelease();
    unint64_t v4 = 0xD000000000000012;
  }
  sub_24D006AD0();
  return v4;
}

unint64_t sub_24CFEA37C()
{
  return sub_24CFEA2C4(*(void *)v0, *(void *)(v0 + 8), *(unsigned char *)(v0 + 16));
}

uint64_t sub_24CFEA390()
{
  if (*v0) {
    return 0x7261506472696874;
  }
  else {
    return 0x7261507473726966;
  }
}

uint64_t sub_24CFEA3C8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24CFF1888(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24CFEA3F0()
{
  return 0;
}

void sub_24CFEA3FC(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_24CFEA408(uint64_t a1)
{
  unint64_t v2 = sub_24CFF1524();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24CFEA444(uint64_t a1)
{
  unint64_t v2 = sub_24CFF1524();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24CFEA480()
{
  return 0;
}

uint64_t sub_24CFEA48C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

void sub_24CFEA4BC(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_24CFEA4C8(uint64_t a1)
{
  unint64_t v2 = sub_24CFF1634();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24CFEA504(uint64_t a1)
{
  unint64_t v2 = sub_24CFF1634();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24CFEA540()
{
  return 1;
}

unint64_t sub_24CFEA550()
{
  return 0xD00000000000001BLL;
}

uint64_t sub_24CFEA56C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24CFF1994(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_24CFEA598(uint64_t a1)
{
  unint64_t v2 = sub_24CFF1578();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24CFEA5D4(uint64_t a1)
{
  unint64_t v2 = sub_24CFF1578();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t ApprovalDBEntrySource.encode(to:)(void *a1, uint64_t a2, unint64_t a3)
{
  uint64_t v22 = a2;
  unint64_t v23 = a3;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26984D288);
  uint64_t v20 = *(void *)(v4 - 8);
  uint64_t v21 = v4;
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_26984D290);
  uint64_t v7 = *(void *)(v19 - 8);
  MEMORY[0x270FA5388](v19);
  uint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26984D298);
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24CFF1524();
  unint64_t v14 = v23;
  sub_24D006F80();
  if (v14 >> 60 == 15)
  {
    LOBYTE(v24) = 0;
    sub_24CFF1634();
    sub_24D006E60();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v19);
    return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  }
  else
  {
    LOBYTE(v24) = 1;
    uint64_t v16 = v22;
    sub_24CFE7000(v22, v14);
    sub_24CFF1578();
    sub_24D006E60();
    uint64_t v24 = v16;
    unint64_t v25 = v14;
    sub_24CFF15CC();
    uint64_t v17 = v21;
    sub_24D006EA0();
    (*(void (**)(char *, uint64_t))(v20 + 8))(v6, v17);
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    return sub_24CFF1620(v16, v14);
  }
}

void *ApprovalDBEntrySource.init(from:)(void *a1)
{
  return sub_24CFF1A1C(a1);
}

void *sub_24CFEA948@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t result = sub_24CFF1A1C(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
  }
  return result;
}

uint64_t sub_24CFEA974(void *a1)
{
  return ApprovalDBEntrySource.encode(to:)(a1, *(void *)v1, *(void *)(v1 + 8));
}

uint64_t ApprovalDBEntrySource.hash(into:)(uint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a3 >> 60 == 15) {
    return sub_24D006F40();
  }
  sub_24D006F40();
  sub_24CFE7000(a2, a3);
  sub_24D0068B0();

  return sub_24CFF1620(a2, a3);
}

uint64_t ApprovalDBEntrySource.hashValue.getter(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
  {
    sub_24CFE7000(a1, a2);
    sub_24D0068B0();
    sub_24CFF1620(a1, a2);
  }
  return sub_24D006F60();
}

uint64_t sub_24CFEAAB4()
{
  uint64_t v1 = *v0;
  unint64_t v2 = v0[1];
  sub_24D006F30();
  sub_24D006F40();
  if (v2 >> 60 != 15)
  {
    sub_24CFE7000(v1, v2);
    sub_24D0068B0();
    sub_24CFF1620(v1, v2);
  }
  return sub_24D006F60();
}

uint64_t sub_24CFEAB44()
{
  unint64_t v1 = v0[1];
  if (v1 >> 60 == 15) {
    return sub_24D006F40();
  }
  uint64_t v3 = *v0;
  sub_24D006F40();
  sub_24CFE7000(v3, v1);
  sub_24D0068B0();

  return sub_24CFF1620(v3, v1);
}

uint64_t sub_24CFEABDC()
{
  uint64_t v1 = *v0;
  unint64_t v2 = v0[1];
  sub_24D006F30();
  sub_24D006F40();
  if (v2 >> 60 != 15)
  {
    sub_24CFE7000(v1, v2);
    sub_24D0068B0();
    sub_24CFF1620(v1, v2);
  }
  return sub_24D006F60();
}

uint64_t sub_24CFEAC6C(uint64_t a1, uint64_t a2)
{
  return _s16DriverManagement21ApprovalDBEntrySourceO21__derived_enum_equalsySbAC_ACtFZ_0(*(void *)a1, *(void *)(a1 + 8), *(void *)a2, *(void *)(a2 + 8));
}

uint64_t ApprovalDBEntrySource.description.getter(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 == 15) {
    return 0x6D6574737973;
  }
  sub_24CFE7000(a1, a2);
  sub_24D006CC0();
  swift_bridgeObjectRelease();
  sub_24CFE85C8(a1, a2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B182FE0);
  sub_24CFF35E0((unint64_t *)&qword_26B182FE8, &qword_26B182FE0);
  sub_24D006A40();
  swift_bridgeObjectRelease();
  sub_24D006AD0();
  swift_bridgeObjectRelease();
  sub_24CFF1620(a1, a2);
  return 0xD000000000000024;
}

uint64_t sub_24CFEADC0()
{
  return ApprovalDBEntrySource.description.getter(*(void *)v0, *(void *)(v0 + 8));
}

uint64_t ApprovalDBEntry.init(driverIdentifier:source:approvalState:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, uint64_t a6@<X8>)
{
  *(void *)a6 = result;
  *(void *)(a6 + 8) = a2;
  *(void *)(a6 + 16) = a3;
  *(void *)(a6 + 24) = a4;
  *(unsigned char *)(a6 + 32) = a5;
  return result;
}

unint64_t sub_24CFEADD8()
{
  uint64_t v1 = 0x656372756F73;
  if (*v0 != 1) {
    uint64_t v1 = 0x6C61766F72707061;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0xD000000000000010;
  }
}

uint64_t sub_24CFEAE40@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24CFF1FCC(a1, a2);
  *a3 = result;
  return result;
}

void sub_24CFEAE68(unsigned char *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_24CFEAE74(uint64_t a1)
{
  unint64_t v2 = sub_24CFF1EC0();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24CFEAEB0(uint64_t a1)
{
  unint64_t v2 = sub_24CFF1EC0();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t ApprovalDBEntry.description.getter()
{
  long long v14 = *v0;
  long long v15 = v14;
  sub_24CFF1E80((uint64_t)&v15);
  sub_24D006AD0();
  uint64_t v1 = *((void *)v0 + 2);
  unint64_t v2 = *((void *)v0 + 3);
  if (v2 >> 60 != 15)
  {
    sub_24CFF1EAC(v1, v2);
    sub_24CFE7000(v1, v2);
    sub_24D006CC0();
    swift_bridgeObjectRelease();
    unint64_t v12 = 0xD000000000000024;
    unint64_t v13 = 0x800000024D00A5C0;
    uint64_t v11 = sub_24CFE85C8(v1, v2);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B182FE0);
    sub_24CFF35E0((unint64_t *)&qword_26B182FE8, &qword_26B182FE0);
    sub_24D006A40();
    swift_bridgeObjectRelease();
    sub_24D006AD0();
    swift_bridgeObjectRelease();
    sub_24CFF1620(v1, v2);
  }
  sub_24D006AD0();
  swift_bridgeObjectRelease();
  sub_24CFF1620(v1, v2);
  uint64_t v3 = sub_24D006AD0();
  char v4 = *((unsigned char *)v0 + 32);
  if (qword_26B182F58 != -1) {
    uint64_t v3 = swift_once();
  }
  MEMORY[0x270FA5388](v3);
  v10[16] = v4;
  uint64_t v5 = swift_bridgeObjectRetain();
  uint64_t v6 = sub_24CFF1368(v5, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_24CFF5888, (uint64_t)v10);
  swift_bridgeObjectRelease();
  sub_24CFE9D04(v6);
  uint64_t v8 = v7;
  uint64_t result = swift_release();
  if (v8)
  {
    sub_24D006AD0();
    swift_bridgeObjectRelease();
    return v14;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t ApprovalDBEntry.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26984D2B0);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24CFF1EC0();
  sub_24D006F80();
  LOBYTE(v12) = 0;
  sub_24D006E80();
  if (!v2)
  {
    sub_24CFF1F14((_OWORD *)(v3 + 16), &v13);
    sub_24CFF1F14(&v13, &v12);
    char v11 = 1;
    sub_24CFF1F24();
    sub_24D006EA0();
    LOBYTE(v12) = *(unsigned char *)(v3 + 32);
    char v11 = 2;
    sub_24CFF1F78();
    sub_24D006EA0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

double ApprovalDBEntry.init(from:)@<D0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_24CFF213C(a1, (uint64_t)v6);
  if (!v2)
  {
    double result = *(double *)v6;
    long long v5 = v6[1];
    *(_OWORD *)a2 = v6[0];
    *(_OWORD *)(a2 + 16) = v5;
    *(unsigned char *)(a2 + 32) = v7;
  }
  return result;
}

double sub_24CFEB37C@<D0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_24CFF213C(a1, (uint64_t)v6);
  if (!v2)
  {
    double result = *(double *)v6;
    long long v5 = v6[1];
    *(_OWORD *)a2 = v6[0];
    *(_OWORD *)(a2 + 16) = v5;
    *(unsigned char *)(a2 + 32) = v7;
  }
  return result;
}

uint64_t sub_24CFEB3C4(void *a1)
{
  return ApprovalDBEntry.encode(to:)(a1);
}

BOOL static ApprovalDBEntry.__derived_struct_equals(_:_:)(uint64_t a1, uint64_t a2)
{
  BOOL v4 = *(void *)a1 == *(void *)a2 && *(void *)(a1 + 8) == *(void *)(a2 + 8);
  if (v4 || (v5 = sub_24D006ED0(), BOOL result = 0, (v5 & 1) != 0))
  {
    uint64_t v8 = *(void *)(a1 + 16);
    unint64_t v7 = *(void *)(a1 + 24);
    sub_24CFF1F14((_OWORD *)(a2 + 16), &v19);
    if (v7 >> 60 == 15)
    {
      sub_24CFF1F14(&v19, &v20);
      if (*((void *)&v20 + 1) >> 60 == 15) {
        return *(unsigned __int8 *)(a1 + 32) == *(unsigned __int8 *)(a2 + 32);
      }
    }
    else
    {
      sub_24CFF1F14(&v19, &v20);
      unint64_t v9 = *((void *)&v20 + 1);
      if (*((void *)&v20 + 1) >> 60 != 15)
      {
        uint64_t v10 = v20;
        uint64_t v11 = 0;
        switch(v7 >> 62)
        {
          case 1uLL:
            if (__OFSUB__(HIDWORD(v8), v8))
            {
              __break(1u);
LABEL_31:
              __break(1u);
LABEL_32:
              __break(1u);
LABEL_33:
              __break(1u);
              JUMPOUT(0x24CFEB5FCLL);
            }
            uint64_t v11 = HIDWORD(v8) - (int)v8;
LABEL_15:
            sub_24CFE7000(v8, v7);
LABEL_16:
            switch(v9 >> 62)
            {
              case 1uLL:
                LODWORD(v14) = HIDWORD(v10) - v10;
                if (__OFSUB__(HIDWORD(v10), v10)) {
                  goto LABEL_32;
                }
                uint64_t v14 = (int)v14;
LABEL_21:
                if (v11 != v14)
                {
LABEL_26:
                  sub_24CFF1620(v8, v7);
                  return 0;
                }
                if (v11 < 1)
                {
LABEL_29:
                  sub_24CFF1620(v8, v7);
                  return *(unsigned __int8 *)(a1 + 32) == *(unsigned __int8 *)(a2 + 32);
                }
                sub_24CFE7000(v10, v9);
                char v18 = sub_24CFEFA08(v8, v7, v10, v9);
                sub_24CFF1620(v8, v7);
                if (v18) {
                  return *(unsigned __int8 *)(a1 + 32) == *(unsigned __int8 *)(a2 + 32);
                }
                break;
              case 2uLL:
                uint64_t v16 = *(void *)(v10 + 16);
                uint64_t v15 = *(void *)(v10 + 24);
                BOOL v17 = __OFSUB__(v15, v16);
                uint64_t v14 = v15 - v16;
                if (!v17) {
                  goto LABEL_21;
                }
                goto LABEL_33;
              case 3uLL:
                if (v11) {
                  goto LABEL_26;
                }
                goto LABEL_29;
              default:
                uint64_t v14 = BYTE6(v9);
                goto LABEL_21;
            }
            break;
          case 2uLL:
            uint64_t v13 = *(void *)(v8 + 16);
            uint64_t v12 = *(void *)(v8 + 24);
            uint64_t v11 = v12 - v13;
            if (!__OFSUB__(v12, v13)) {
              goto LABEL_15;
            }
            goto LABEL_31;
          case 3uLL:
            goto LABEL_16;
          default:
            uint64_t v11 = BYTE6(v7);
            goto LABEL_16;
        }
      }
    }
    return 0;
  }
  return result;
}

uint64_t sub_24CFEB61C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  unint64_t v3 = *(void *)(a1 + 24);
  int v4 = *(unsigned __int8 *)(a1 + 32);
  uint64_t v5 = *(void *)(a2 + 16);
  unint64_t v6 = *(void *)(a2 + 24);
  int v7 = *(unsigned __int8 *)(a2 + 32);
  if (*(void *)a1 == *(void *)a2 && *(void *)(a1 + 8) == *(void *)(a2 + 8)) {
    return _s16DriverManagement21ApprovalDBEntrySourceO21__derived_enum_equalsySbAC_ACtFZ_0(v2, v3, v5, v6) & (v4 == v7);
  }
  char v9 = sub_24D006ED0();
  uint64_t result = 0;
  if (v9) {
    return _s16DriverManagement21ApprovalDBEntrySourceO21__derived_enum_equalsySbAC_ACtFZ_0(v2, v3, v5, v6) & (v4 == v7);
  }
  return result;
}

uint64_t sub_24CFEB6AC(void *a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26984D398);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  int v7 = (char *)v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24CFF4F40();
  sub_24D006F80();
  v9[1] = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26984D3A8);
  sub_24CFF52FC(&qword_26984D3B0, &qword_26984D3A8, (void (*)(void))sub_24CFF4F94);
  sub_24D006EA0();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_24CFEB834()
{
  return sub_24D006F40();
}

uint64_t sub_24CFEB85C()
{
  return 0x73656972746E65;
}

uint64_t sub_24CFEB878(uint64_t a1)
{
  unint64_t v2 = sub_24CFF4F40();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24CFEB8B4(uint64_t a1)
{
  unint64_t v2 = sub_24CFF4F40();

  return MEMORY[0x270FA00B8](a1, v2);
}

void *sub_24CFEB8F0@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t result = sub_24CFF24C4(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_24CFEB91C(void *a1)
{
  return sub_24CFEB6AC(a1, *v1);
}

uint64_t ApprovalDB.entries.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v1 = a1;
  return result;
}

uint64_t (*ApprovalDB.entries.modify(void *a1))(uint64_t *a1, char a2)
{
  *a1 = *v1;
  a1[1] = v1;
  swift_bridgeObjectRetain();
  return sub_24CFEB9B4;
}

uint64_t sub_24CFEB9B4(uint64_t *a1, char a2)
{
  uint64_t v2 = *a1;
  unint64_t v3 = (void *)a1[1];
  if (a2)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *unint64_t v3 = v2;
    return swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t result = swift_bridgeObjectRelease();
    *unint64_t v3 = v2;
  }
  return result;
}

uint64_t sub_24CFEBA28(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5)
{
  __s1[2] = *MEMORY[0x263EF8340];
  uint64_t v5 = *(void *)(a5 + 16);
  if (!v5) {
    return 3;
  }
  unint64_t v88 = HIDWORD(a3);
  BOOL v10 = __OFSUB__(HIDWORD(a3), a3);
  BOOL v91 = v10;
  size_t __n = BYTE6(a4);
  unint64_t v99 = a4 >> 62;
  uint64_t v89 = (int)a3;
  size_t v90 = HIDWORD(a3) - (int)a3;
  uint64_t v86 = (a3 >> 32) - (int)a3;
  uint64_t v87 = a3 >> 32;
  swift_bridgeObjectRetain();
  uint64_t v11 = (unsigned __int8 *)(a5 + 64);
  unint64_t v12 = a4 >> 60;
  unint64_t v95 = a4;
  unint64_t v96 = a4 >> 60;
  while (1)
  {
    uint64_t v14 = *((void *)v11 - 2);
    unint64_t v13 = *((void *)v11 - 1);
    uint64_t v15 = *v11;
    BOOL v16 = *((void *)v11 - 4) == a1 && *((void *)v11 - 3) == a2;
    if (v16 || (sub_24D006ED0() & 1) != 0)
    {
      if (v13 >> 60 == 15)
      {
        if (v12 > 0xE)
        {
          swift_bridgeObjectRetain();
          sub_24CFF1EAC(v14, v13);
          goto LABEL_133;
        }
        goto LABEL_7;
      }
      if (v12 <= 0xE) {
        break;
      }
    }
LABEL_7:
    v11 += 40;
    if (!--v5)
    {
      swift_bridgeObjectRelease();
      return 3;
    }
  }
  uint64_t v17 = 0;
  switch(v13 >> 62)
  {
    case 1uLL:
      if (__OFSUB__(HIDWORD(v14), v14))
      {
        __break(1u);
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
        __break(1u);
LABEL_142:
        __break(1u);
LABEL_143:
        __break(1u);
LABEL_144:
        __break(1u);
LABEL_145:
        __break(1u);
LABEL_146:
        __break(1u);
LABEL_147:
        __break(1u);
LABEL_148:
        __break(1u);
LABEL_149:
        __break(1u);
LABEL_150:
        __break(1u);
LABEL_151:
        __break(1u);
LABEL_152:
        __break(1u);
LABEL_153:
        __break(1u);
LABEL_154:
        __break(1u);
LABEL_155:
        __break(1u);
LABEL_156:
        __break(1u);
LABEL_157:
        __break(1u);
      }
      uint64_t v17 = HIDWORD(v14) - (int)v14;
LABEL_20:
      sub_24CFE7000(v14, v13);
      break;
    case 2uLL:
      uint64_t v19 = *(void *)(v14 + 16);
      uint64_t v18 = *(void *)(v14 + 24);
      uint64_t v17 = v18 - v19;
      if (!__OFSUB__(v18, v19)) {
        goto LABEL_20;
      }
      goto LABEL_136;
    case 3uLL:
      break;
    default:
      uint64_t v17 = BYTE6(v13);
      break;
  }
  size_t v20 = __n;
  switch((int)v99)
  {
    case 1:
      size_t v20 = v90;
      if (v91) {
        goto LABEL_137;
      }
      goto LABEL_25;
    case 2:
      uint64_t v22 = *(void *)(a3 + 16);
      uint64_t v21 = *(void *)(a3 + 24);
      BOOL v23 = __OFSUB__(v21, v22);
      size_t v20 = v21 - v22;
      if (!v23) {
        goto LABEL_25;
      }
      goto LABEL_138;
    case 3:
      if (!v17) {
        goto LABEL_132;
      }
      goto LABEL_128;
    default:
LABEL_25:
      if (v17 != v20) {
        goto LABEL_128;
      }
      if (v17 >= 1)
      {
        switch(v13 >> 62)
        {
          case 1uLL:
            unsigned int v93 = v15;
            if ((int)v14 > v14 >> 32) {
              goto LABEL_139;
            }
            sub_24CFF1EAC(v14, v13);
            swift_bridgeObjectRetain();
            sub_24CFF1EAC(v14, v13);
            sub_24CFF1EAC(a3, v95);
            uint64_t v28 = sub_24D0067D0();
            if (v28)
            {
              uint64_t v29 = v28;
              uint64_t v30 = sub_24D0067F0();
              if (__OFSUB__((int)v14, v30)) {
                goto LABEL_141;
              }
              v82 = (void *)(v29 + (int)v14 - v30);
            }
            else
            {
              v82 = 0;
            }
            uint64_t v15 = v15;
            sub_24D0067E0();
            if (!v99)
            {
              uint64_t v52 = a3;
              LODWORD(__s1[0]) = a3;
              unint64_t v53 = v95;
              BYTE4(__s1[0]) = v88;
              *(_WORD *)((char *)__s1 + 5) = *(_WORD *)((char *)&a3 + 5);
              HIBYTE(__s1[0]) = HIBYTE(a3);
              LODWORD(__s1[1]) = v95;
              WORD2(__s1[1]) = WORD2(v95);
              if (!v82) {
                goto LABEL_167;
              }
              int v83 = memcmp(v82, __s1, __n);
LABEL_100:
              sub_24CFF1620(v14, v13);
              sub_24CFF1620(v52, v53);
              sub_24CFF1620(v14, v13);
              if (!v83) {
                goto LABEL_133;
              }
              goto LABEL_127;
            }
            if (v99 == 1)
            {
              if (v87 < v89) {
                goto LABEL_150;
              }
              swift_retain();
              uint64_t v48 = (char *)sub_24D0067D0();
              if (v48)
              {
                uint64_t v49 = sub_24D0067F0();
                if (__OFSUB__(v89, v49)) {
                  goto LABEL_157;
                }
                v48 += v89 - v49;
              }
              uint64_t v50 = sub_24D0067E0();
              size_t v51 = v86;
              if (v50 < v86) {
                size_t v51 = v50;
              }
              if (!v82) {
                goto LABEL_162;
              }
              if (!v48) {
                goto LABEL_163;
              }
              int v83 = memcmp(v82, v48, v51);
              uint64_t v52 = a3;
              unint64_t v53 = v95;
              sub_24CFF1620(a3, v95);
              goto LABEL_100;
            }
            uint64_t v66 = *(void *)(a3 + 16);
            v81 = *(char **)(a3 + 24);
            swift_retain();
            swift_retain();
            v67 = (char *)sub_24D0067D0();
            if (v67)
            {
              uint64_t v68 = sub_24D0067F0();
              if (__OFSUB__(v66, v68)) {
                goto LABEL_156;
              }
              v67 += v66 - v68;
            }
            BOOL v23 = __OFSUB__(v81, v66);
            v69 = &v81[-v66];
            if (v23) {
              goto LABEL_151;
            }
            uint64_t v70 = sub_24D0067E0();
            if (v70 >= (uint64_t)v69) {
              size_t v71 = (size_t)v69;
            }
            else {
              size_t v71 = v70;
            }
            if (!v82) {
              goto LABEL_168;
            }
            uint64_t v15 = v93;
            if (!v67) {
              goto LABEL_169;
            }
            int v41 = memcmp(v82, v67, v71);
            swift_release();
            uint64_t v65 = a3;
            swift_release();
            sub_24CFF1620(v14, v13);
LABEL_112:
            sub_24CFF1620(v65, v95);
LABEL_113:
            sub_24CFF1620(v14, v13);
            if (!v41) {
              goto LABEL_133;
            }
LABEL_127:
            swift_bridgeObjectRelease();
LABEL_128:
            sub_24CFF1620(v14, v13);
            unint64_t v12 = v96;
            break;
          case 2uLL:
            unsigned int v94 = v15;
            uint64_t v31 = *(void *)(v14 + 16);
            swift_bridgeObjectRetain();
            sub_24CFF1EAC(v14, v13);
            sub_24CFF1EAC(a3, v95);
            swift_retain();
            swift_retain();
            uint64_t v32 = sub_24D0067D0();
            if (v32)
            {
              uint64_t v33 = v32;
              uint64_t v34 = sub_24D0067F0();
              if (__OFSUB__(v31, v34)) {
                goto LABEL_140;
              }
              v77 = (void *)(v33 + v31 - v34);
            }
            else
            {
              v77 = 0;
            }
            uint64_t v15 = v94;
            sub_24D0067E0();
            if (!v99)
            {
              uint64_t v46 = a3;
              LODWORD(__s1[0]) = a3;
              unint64_t v47 = v95;
              BYTE4(__s1[0]) = v88;
              *(_WORD *)((char *)__s1 + 5) = *(_WORD *)((char *)&a3 + 5);
              HIBYTE(__s1[0]) = HIBYTE(a3);
              LODWORD(__s1[1]) = v95;
              WORD2(__s1[1]) = WORD2(v95);
              if (!v77) {
                goto LABEL_164;
              }
              int v78 = memcmp(v77, __s1, __n);
LABEL_86:
              swift_release();
              swift_release();
              sub_24CFF1620(v46, v47);
              sub_24CFF1620(v14, v13);
              if (!v78) {
                goto LABEL_133;
              }
              goto LABEL_127;
            }
            if (v99 == 1)
            {
              if (v87 < v89) {
                goto LABEL_146;
              }
              swift_retain();
              v42 = (char *)sub_24D0067D0();
              if (v42)
              {
                uint64_t v43 = sub_24D0067F0();
                if (__OFSUB__(v89, v43)) {
                  goto LABEL_155;
                }
                v42 += v89 - v43;
              }
              uint64_t v44 = sub_24D0067E0();
              size_t v45 = v86;
              if (v44 < v86) {
                size_t v45 = v44;
              }
              if (!v77) {
                goto LABEL_160;
              }
              if (!v42) {
                goto LABEL_161;
              }
              int v78 = memcmp(v77, v42, v45);
              uint64_t v46 = a3;
              unint64_t v47 = v95;
              sub_24CFF1620(a3, v95);
              goto LABEL_86;
            }
            uint64_t v59 = *(void *)(a3 + 16);
            uint64_t v76 = *(void *)(a3 + 24);
            swift_retain();
            swift_retain();
            v60 = (char *)sub_24D0067D0();
            if (v60)
            {
              uint64_t v61 = sub_24D0067F0();
              if (__OFSUB__(v59, v61)) {
                goto LABEL_154;
              }
              v60 += v59 - v61;
            }
            BOOL v23 = __OFSUB__(v76, v59);
            int64_t v62 = v76 - v59;
            if (v23) {
              goto LABEL_149;
            }
            uint64_t v63 = sub_24D0067E0();
            if (v63 >= v62) {
              size_t v64 = v62;
            }
            else {
              size_t v64 = v63;
            }
            if (!v77) {
              goto LABEL_165;
            }
            uint64_t v15 = v94;
            if (!v60) {
              goto LABEL_166;
            }
            int v41 = memcmp(v77, v60, v64);
            swift_release();
            swift_release();
            swift_release();
            uint64_t v65 = a3;
            swift_release();
            goto LABEL_112;
          case 3uLL:
            memset(__s1, 0, 14);
            if (!v99) {
              goto LABEL_53;
            }
            unsigned int v92 = v15;
            if (v99 == 1)
            {
              if (v87 < v89) {
                goto LABEL_143;
              }
              swift_bridgeObjectRetain();
              sub_24CFF1EAC(v14, v13);
              sub_24CFF1EAC(a3, v95);
              uint64_t v35 = sub_24D0067D0();
              if (!v35) {
                goto LABEL_159;
              }
              uint64_t v25 = v35;
              uint64_t v36 = sub_24D0067F0();
              uint64_t v27 = v89 - v36;
              if (__OFSUB__(v89, v36)) {
                goto LABEL_145;
              }
LABEL_49:
              uint64_t v37 = sub_24D0067E0();
              if (v37 >= v86) {
                size_t v38 = v86;
              }
              else {
                size_t v38 = v37;
              }
              int v39 = memcmp(__s1, (const void *)(v25 + v27), v38);
              uint64_t v40 = a3;
            }
            else
            {
              v80 = *(char **)(a3 + 24);
              v85 = *(char **)(a3 + 16);
              swift_bridgeObjectRetain();
              sub_24CFF1EAC(v14, v13);
              sub_24CFF1EAC(a3, v95);
              swift_retain();
              swift_retain();
              uint64_t v54 = (char *)sub_24D0067D0();
              if (v54)
              {
                uint64_t v57 = sub_24D0067F0();
                v58 = v85;
                if (__OFSUB__(v85, v57)) {
                  goto LABEL_153;
                }
                uint64_t v54 = &v85[(void)v54 - v57];
              }
              else
              {
                v58 = v85;
              }
              v72 = (char *)(v80 - v58);
              if (__OFSUB__(v80, v58)) {
                goto LABEL_148;
              }
              uint64_t v73 = sub_24D0067E0();
              if (!v54) {
                goto LABEL_171;
              }
LABEL_122:
              if (v73 >= (uint64_t)v72) {
                size_t v74 = (size_t)v72;
              }
              else {
                size_t v74 = v73;
              }
              int v39 = memcmp(__s1, v54, v74);
              swift_release();
              swift_release();
              uint64_t v40 = a3;
            }
            sub_24CFF1620(v40, v95);
            sub_24CFF1620(v14, v13);
            uint64_t v15 = v92;
            if (!v39) {
              goto LABEL_133;
            }
            goto LABEL_127;
          default:
            __s1[0] = v14;
            LOWORD(__s1[1]) = v13;
            BYTE2(__s1[1]) = BYTE2(v13);
            BYTE3(__s1[1]) = BYTE3(v13);
            BYTE4(__s1[1]) = BYTE4(v13);
            BYTE5(__s1[1]) = BYTE5(v13);
            if (!v99)
            {
LABEL_53:
              int __s2 = a3;
              char v101 = v88;
              __int16 v102 = *(_WORD *)((char *)&a3 + 5);
              char v103 = HIBYTE(a3);
              int v104 = v95;
              __int16 v105 = WORD2(v95);
              swift_bridgeObjectRetain();
              sub_24CFF1EAC(v14, v13);
              int v41 = memcmp(__s1, &__s2, __n);
              goto LABEL_113;
            }
            unsigned int v92 = v15;
            if (v99 == 1)
            {
              if (v87 < v89) {
                goto LABEL_142;
              }
              swift_bridgeObjectRetain();
              sub_24CFF1EAC(v14, v13);
              sub_24CFF1EAC(a3, v95);
              uint64_t v24 = sub_24D0067D0();
              if (!v24)
              {
                sub_24D0067E0();
                __break(1u);
LABEL_159:
                sub_24D0067E0();
                __break(1u);
LABEL_160:
                __break(1u);
LABEL_161:
                __break(1u);
LABEL_162:
                __break(1u);
LABEL_163:
                __break(1u);
LABEL_164:
                __break(1u);
LABEL_165:
                __break(1u);
LABEL_166:
                __break(1u);
LABEL_167:
                __break(1u);
LABEL_168:
                __break(1u);
LABEL_169:
                __break(1u);
LABEL_170:
                __break(1u);
LABEL_171:
                __break(1u);
                JUMPOUT(0x24CFEC5A8);
              }
              uint64_t v25 = v24;
              uint64_t v26 = sub_24D0067F0();
              uint64_t v27 = v89 - v26;
              if (__OFSUB__(v89, v26)) {
                goto LABEL_144;
              }
              goto LABEL_49;
            }
            v79 = *(char **)(a3 + 24);
            v84 = *(char **)(a3 + 16);
            swift_bridgeObjectRetain();
            sub_24CFF1EAC(v14, v13);
            sub_24CFF1EAC(a3, v95);
            swift_retain();
            swift_retain();
            uint64_t v54 = (char *)sub_24D0067D0();
            if (v54)
            {
              uint64_t v55 = sub_24D0067F0();
              uint64_t v56 = v84;
              if (__OFSUB__(v84, v55)) {
                goto LABEL_152;
              }
              uint64_t v54 = &v84[(void)v54 - v55];
            }
            else
            {
              uint64_t v56 = v84;
            }
            v72 = (char *)(v79 - v56);
            if (__OFSUB__(v79, v56)) {
              goto LABEL_147;
            }
            uint64_t v73 = sub_24D0067E0();
            if (!v54) {
              goto LABEL_170;
            }
            goto LABEL_122;
        }
        goto LABEL_7;
      }
LABEL_132:
      swift_bridgeObjectRetain();
      sub_24CFF1EAC(v14, v13);
      sub_24CFF1620(v14, v13);
LABEL_133:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_24CFF1620(v14, v13);
      return v15;
  }
}

BOOL sub_24CFEC5D8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_24CFEC5F0()
{
  if (*v0) {
    return 0x6E6F6973726576;
  }
  else {
    return 12406;
  }
}

uint64_t sub_24CFEC620@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24CFF2674(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24CFEC648(uint64_t a1)
{
  unint64_t v2 = sub_24CFF241C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24CFEC684(uint64_t a1)
{
  unint64_t v2 = sub_24CFF241C();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t ApprovalDB.encode(to:)(void *a1, uint64_t a2)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26984D2D0);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24CFF241C();
  sub_24D006F80();
  uint64_t v11 = a2;
  v10[15] = 0;
  sub_24CFF2470();
  sub_24D006EA0();
  if (!v2)
  {
    v10[14] = 1;
    sub_24D006E90();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t ApprovalDB.init(from:)(void *a1)
{
  return sub_24CFF2750(a1);
}

uint64_t sub_24CFEC858@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_24CFF2750(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
  }
  return result;
}

uint64_t sub_24CFEC884(void *a1)
{
  return ApprovalDB.encode(to:)(a1, *v1);
}

uint64_t sub_24CFEC8A4(uint64_t *a1, uint64_t *a2)
{
  return _s16DriverManagement10ApprovalDBV2eeoiySbAC_ACtFZ_0(*a1, a1[1], *a2);
}

uint64_t sub_24CFEC8BC()
{
  return sub_24D006F60();
}

uint64_t sub_24CFEC900()
{
  return sub_24D006F60();
}

uint64_t sub_24CFEC940@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 0x73656972746E65 && a2 == 0xE700000000000000)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = sub_24D006ED0();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_24CFEC9D8(uint64_t a1)
{
  unint64_t v2 = sub_24CFF2934();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24CFECA14(uint64_t a1)
{
  unint64_t v2 = sub_24CFF2934();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t ApprovalSettingsState.encode(to:)(void *a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26984D2E8);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  char v7 = (char *)v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24CFF2934();
  sub_24D006F80();
  v9[1] = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B183168);
  sub_24CFF52FC(&qword_26984D2F0, &qword_26B183168, (void (*)(void))sub_24CFF2988);
  sub_24D006EA0();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

void *ApprovalSettingsState.init(from:)(void *a1)
{
  return sub_24CFF29DC(a1);
}

void *sub_24CFECBF0@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t result = sub_24CFF29DC(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_24CFECC1C(void *a1)
{
  return ApprovalSettingsState.encode(to:)(a1, *v1);
}

uint64_t sub_24CFECC3C(uint64_t a1, uint64_t a2)
{
  uint64_t v163 = *MEMORY[0x263EF8340];
  if (a1 == a2) {
    return 1;
  }
  if (*(void *)(a1 + 16) != *(void *)(a2 + 16)) {
    return 0;
  }
  int64_t v2 = 0;
  uint64_t v3 = a1 + 56;
  uint64_t v4 = 1 << *(unsigned char *)(a1 + 32);
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  else {
    uint64_t v5 = -1;
  }
  unint64_t v6 = v5 & *(void *)(a1 + 56);
  int64_t v7 = (unint64_t)(v4 + 63) >> 6;
  uint64_t v147 = a2 + 56;
  uint64_t v122 = a1 + 56;
  uint64_t v123 = a1;
  int64_t v121 = v7;
  if (!v6) {
    goto LABEL_8;
  }
LABEL_7:
  uint64_t v124 = (v6 - 1) & v6;
  int64_t v125 = v2;
  unint64_t v8 = __clz(__rbit64(v6)) | (v2 << 6);
LABEL_24:
  uint64_t v13 = *(void *)(a1 + 48) + 72 * v8;
  long long v155 = *(_OWORD *)v13;
  long long v15 = *(_OWORD *)(v13 + 32);
  long long v14 = *(_OWORD *)(v13 + 48);
  long long v16 = *(_OWORD *)(v13 + 16);
  unsigned __int8 v159 = *(unsigned char *)(v13 + 64);
  long long v158 = v14;
  long long v156 = v16;
  long long v157 = v15;
  sub_24D006F30();
  sub_24CFF51D4((uint64_t)&v155);
  ApprovalSettingsStateEntry.hash(into:)();
  uint64_t v17 = sub_24D006F60();
  uint64_t v18 = a2;
  uint64_t v19 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v20 = v17 & ~v19;
  if ((*(void *)(v147 + ((v20 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v20))
  {
    uint64_t v145 = ~v19;
    long long v21 = v155;
    do
    {
      uint64_t v22 = *(void *)(v18 + 48) + 72 * v20;
      uint64_t v23 = *(void *)(v22 + 16);
      uint64_t v24 = *(void *)(v22 + 24);
      uint64_t v25 = *(void *)(v22 + 32);
      uint64_t v26 = *(void *)(v22 + 40);
      uint64_t v28 = *(void *)(v22 + 48);
      unint64_t v27 = *(void *)(v22 + 56);
      int v146 = *(unsigned __int8 *)(v22 + 64);
      if (*(void *)v22 != (void)v21 || *(void *)(v22 + 8) != *((void *)&v21 + 1))
      {
        char v30 = sub_24D006ED0();
        uint64_t v18 = a2;
        if ((v30 & 1) == 0) {
          goto LABEL_27;
        }
      }
      if (v24)
      {
        if (!*((void *)&v156 + 1)) {
          goto LABEL_27;
        }
        if (v23 != (void)v156 || v24 != *((void *)&v156 + 1))
        {
          char v32 = sub_24D006ED0();
          uint64_t v18 = a2;
          if ((v32 & 1) == 0) {
            goto LABEL_27;
          }
        }
      }
      else if (*((void *)&v156 + 1))
      {
        goto LABEL_27;
      }
      if (v26)
      {
        if (!*((void *)&v157 + 1)) {
          goto LABEL_27;
        }
        if (v25 != (void)v157 || v26 != *((void *)&v157 + 1))
        {
          char v34 = sub_24D006ED0();
          uint64_t v18 = a2;
          if ((v34 & 1) == 0) {
            goto LABEL_27;
          }
        }
      }
      else if (*((void *)&v157 + 1))
      {
        goto LABEL_27;
      }
      sub_24CFF1F14(&v158, &v160);
      if (v27 >> 60 == 15)
      {
        sub_24CFF1F14(&v160, &v162);
        uint64_t v18 = a2;
        if (*((void *)&v162 + 1) >> 60 != 15) {
          goto LABEL_27;
        }
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        sub_24CFF1EAC(v28, v27);
      }
      else
      {
        sub_24CFF1F14(&v160, &v161);
        unint64_t v36 = *((void *)&v161 + 1);
        uint64_t v18 = a2;
        if (*((void *)&v161 + 1) >> 60 == 15) {
          goto LABEL_27;
        }
        uint64_t v37 = v161;
        unint64_t v38 = v27 >> 62;
        uint64_t v39 = 0;
        switch(v27 >> 62)
        {
          case 1uLL:
            unint64_t v126 = v27 >> 62;
            v132 = (void *)*((void *)&v161 + 1);
            if (__OFSUB__(HIDWORD(v28), v28)) {
              goto LABEL_180;
            }
            uint64_t v40 = v161;
            uint64_t v39 = HIDWORD(v28) - (int)v28;
            break;
          case 2uLL:
            unint64_t v126 = v27 >> 62;
            v132 = (void *)*((void *)&v161 + 1);
            uint64_t v42 = *(void *)(v28 + 16);
            uint64_t v41 = *(void *)(v28 + 24);
            uint64_t v39 = v41 - v42;
            if (__OFSUB__(v41, v42)) {
              goto LABEL_181;
            }
            uint64_t v40 = v161;
            break;
          case 3uLL:
            goto LABEL_62;
          default:
            uint64_t v39 = BYTE6(v27);
            goto LABEL_62;
        }
        sub_24CFE7000(v28, v27);
        uint64_t v37 = v40;
        LODWORD(v38) = v126;
        unint64_t v36 = (unint64_t)v132;
LABEL_62:
        unint64_t v43 = v36 >> 62;
        switch(v36 >> 62)
        {
          case 1uLL:
            LODWORD(v44) = HIDWORD(v37) - v37;
            if (__OFSUB__(HIDWORD(v37), v37)) {
              goto LABEL_182;
            }
            uint64_t v44 = (int)v44;
LABEL_67:
            if (v39 != v44) {
              goto LABEL_173;
            }
            if (v39 < 1)
            {
LABEL_78:
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              sub_24CFF1EAC(v28, v27);
              sub_24CFF1620(v28, v27);
            }
            else
            {
              switch((int)v38)
              {
                case 1:
                  unint64_t v115 = v36 >> 62;
                  uint64_t v128 = v37;
                  v134 = (void *)v36;
                  if ((int)v28 > v28 >> 32) {
                    goto LABEL_184;
                  }
                  swift_bridgeObjectRetain();
                  swift_bridgeObjectRetain();
                  swift_bridgeObjectRetain();
                  sub_24CFF1EAC(v28, v27);
                  sub_24CFF1EAC(v28, v27);
                  sub_24CFF529C((uint64_t)&v160);
                  uint64_t v51 = sub_24D0067D0();
                  if (v51)
                  {
                    uint64_t v52 = v51;
                    uint64_t v53 = sub_24D0067F0();
                    if (__OFSUB__((int)v28, v53)) {
                      goto LABEL_187;
                    }
                    uint64_t v54 = (const void *)(v52 + (int)v28 - v53);
                  }
                  else
                  {
                    uint64_t v54 = 0;
                  }
                  sub_24D0067E0();
                  if (!v115)
                  {
                    *(void *)__s1 = v128;
                    *(_DWORD *)&__s1[8] = v134;
                    *(_WORD *)&__s1[12] = WORD2(v134);
                    if (!v54) {
                      goto LABEL_207;
                    }
                    int v64 = memcmp(v54, __s1, BYTE6(v134));
LABEL_169:
                    sub_24CFF1620(v28, v27);
                    goto LABEL_170;
                  }
                  v112 = (void *)v54;
                  uint64_t v71 = v128;
                  if (v115 == 1)
                  {
                    uint64_t v72 = (int)v128;
                    uint64_t v131 = (v128 >> 32) - (int)v128;
                    if (v71 >> 32 < (int)v71) {
                      goto LABEL_196;
                    }
                    swift_retain();
                    uint64_t v73 = sub_24D0067D0();
                    if (v73)
                    {
                      v137 = (char *)v73;
                      uint64_t v74 = sub_24D0067F0();
                      if (__OFSUB__(v72, v74)) {
                        goto LABEL_203;
                      }
                      v75 = &v137[v72 - v74];
                    }
                    else
                    {
                      v75 = 0;
                    }
                    uint64_t v107 = sub_24D0067E0();
                    size_t v108 = v131;
                    if (v107 < v131) {
                      size_t v108 = v107;
                    }
                    if (!v112) {
                      goto LABEL_216;
                    }
                    if (!v75) {
                      goto LABEL_217;
                    }
                    int v64 = memcmp(v112, v75, v108);
                    sub_24CFF52CC((uint64_t)&v160);
                    goto LABEL_169;
                  }
                  v141 = *(char **)(v128 + 16);
                  uint64_t v120 = *(void *)(v128 + 24);
                  swift_retain();
                  swift_retain();
                  uint64_t v90 = sub_24D0067D0();
                  if (v90)
                  {
                    uint64_t v91 = v90;
                    uint64_t v92 = sub_24D0067F0();
                    unsigned int v93 = v141;
                    if (__OFSUB__(v141, v92)) {
                      goto LABEL_201;
                    }
                    unsigned int v94 = &v141[v91 - v92];
                  }
                  else
                  {
                    unsigned int v94 = 0;
                    unsigned int v93 = v141;
                  }
                  v143 = v94;
                  int64_t v104 = v120 - (void)v93;
                  if (__OFSUB__(v120, v93)) {
                    goto LABEL_197;
                  }
                  uint64_t v105 = sub_24D0067E0();
                  if (v105 >= v104) {
                    size_t v106 = v104;
                  }
                  else {
                    size_t v106 = v105;
                  }
                  if (!v112) {
                    goto LABEL_214;
                  }
                  if (!v143) {
                    goto LABEL_215;
                  }
                  int v84 = memcmp(v112, v143, v106);
                  swift_release();
                  swift_release();
                  sub_24CFF1620(v28, v27);
                  goto LABEL_147;
                case 2:
                  unint64_t v116 = v36 >> 62;
                  uint64_t v129 = v37;
                  v135 = (void *)v36;
                  uint64_t v55 = *(char **)(v28 + 16);
                  swift_bridgeObjectRetain();
                  swift_bridgeObjectRetain();
                  swift_bridgeObjectRetain();
                  sub_24CFF1EAC(v28, v27);
                  sub_24CFF529C((uint64_t)&v160);
                  swift_retain();
                  swift_retain();
                  uint64_t v56 = sub_24D0067D0();
                  if (v56)
                  {
                    v110 = v55;
                    uint64_t v57 = v56;
                    uint64_t v58 = sub_24D0067F0();
                    if (__OFSUB__(v110, v58)) {
                      goto LABEL_186;
                    }
                    uint64_t v59 = &v110[v57 - v58];
                  }
                  else
                  {
                    uint64_t v59 = 0;
                  }
                  sub_24D0067E0();
                  if (!v116)
                  {
                    *(void *)__s1 = v129;
                    *(_DWORD *)&__s1[8] = v135;
                    *(_WORD *)&__s1[12] = WORD2(v135);
                    if (!v59) {
                      goto LABEL_206;
                    }
                    int v84 = memcmp(v59, __s1, BYTE6(v135));
                    swift_release();
                    goto LABEL_146;
                  }
                  v111 = v59;
                  uint64_t v66 = v129;
                  if (v116 == 1)
                  {
                    uint64_t v67 = (int)v129;
                    uint64_t v130 = (v129 >> 32) - (int)v129;
                    if (v66 >> 32 < (int)v66) {
                      goto LABEL_190;
                    }
                    swift_retain();
                    uint64_t v68 = sub_24D0067D0();
                    if (v68)
                    {
                      v136 = (char *)v68;
                      uint64_t v69 = sub_24D0067F0();
                      if (__OFSUB__(v67, v69)) {
                        goto LABEL_202;
                      }
                      uint64_t v70 = &v136[v67 - v69];
                    }
                    else
                    {
                      uint64_t v70 = 0;
                    }
                    uint64_t v102 = sub_24D0067E0();
                    size_t v103 = v130;
                    if (v102 < v130) {
                      size_t v103 = v102;
                    }
                    if (!v111) {
                      goto LABEL_212;
                    }
                    if (!v70) {
                      goto LABEL_213;
                    }
                    int v64 = memcmp(v111, v70, v103);
                    sub_24CFF52CC((uint64_t)&v160);
                    swift_release();
                    swift_release();
                    goto LABEL_170;
                  }
                  v140 = *(char **)(v129 + 16);
                  uint64_t v119 = *(void *)(v129 + 24);
                  swift_retain();
                  swift_retain();
                  uint64_t v85 = sub_24D0067D0();
                  if (v85)
                  {
                    uint64_t v86 = v85;
                    uint64_t v87 = sub_24D0067F0();
                    unint64_t v88 = v140;
                    if (__OFSUB__(v140, v87)) {
                      goto LABEL_200;
                    }
                    uint64_t v89 = &v140[v86 - v87];
                  }
                  else
                  {
                    uint64_t v89 = 0;
                    unint64_t v88 = v140;
                  }
                  v142 = v89;
                  int64_t v99 = v119 - (void)v88;
                  if (__OFSUB__(v119, v88)) {
                    goto LABEL_195;
                  }
                  uint64_t v100 = sub_24D0067E0();
                  if (v100 >= v99) {
                    size_t v101 = v99;
                  }
                  else {
                    size_t v101 = v100;
                  }
                  if (!v111) {
                    goto LABEL_210;
                  }
                  if (!v142) {
                    goto LABEL_211;
                  }
                  int v84 = memcmp(v111, v142, v101);
                  swift_release();
                  swift_release();
                  goto LABEL_145;
                case 3:
                  *(void *)&__s1[6] = 0;
                  *(void *)__s1 = 0;
                  if (!v43) {
                    goto LABEL_95;
                  }
                  if (v43 == 1)
                  {
                    uint64_t v60 = (int)v37;
                    if (v37 >> 32 < (int)v37) {
                      goto LABEL_189;
                    }
                    v133 = (void *)((v37 >> 32) - (int)v37);
                    swift_bridgeObjectRetain();
                    swift_bridgeObjectRetain();
                    swift_bridgeObjectRetain();
                    sub_24CFF1EAC(v28, v27);
                    sub_24CFF529C((uint64_t)&v160);
                    uint64_t v127 = sub_24D0067D0();
                    if (!v127) {
                      goto LABEL_205;
                    }
                    uint64_t v61 = sub_24D0067F0();
                    BOOL v47 = __OFSUB__(v60, v61);
                    uint64_t v50 = v60 - v61;
                    if (v47) {
                      goto LABEL_194;
                    }
                    goto LABEL_91;
                  }
                  v139 = *(char **)(v37 + 16);
                  uint64_t v118 = *(void *)(v37 + 24);
                  swift_bridgeObjectRetain();
                  swift_bridgeObjectRetain();
                  swift_bridgeObjectRetain();
                  sub_24CFF1EAC(v28, v27);
                  sub_24CFF529C((uint64_t)&v160);
                  swift_retain();
                  swift_retain();
                  uint64_t v80 = sub_24D0067D0();
                  if (v80)
                  {
                    uint64_t v81 = v80;
                    uint64_t v82 = sub_24D0067F0();
                    int v83 = v139;
                    if (__OFSUB__(v139, v82)) {
                      goto LABEL_199;
                    }
                    v114 = &v139[v81 - v82];
                  }
                  else
                  {
                    v114 = 0;
                    int v83 = v139;
                  }
                  int64_t v95 = v118 - (void)v83;
                  if (__OFSUB__(v118, v83)) {
                    goto LABEL_192;
                  }
                  uint64_t v96 = sub_24D0067E0();
                  v97 = v114;
                  if (!v114) {
                    goto LABEL_209;
                  }
                  goto LABEL_133;
                default:
                  *(void *)__s1 = v28;
                  *(_WORD *)&__s1[8] = v27;
                  __s1[10] = BYTE2(v27);
                  __s1[11] = BYTE3(v27);
                  __s1[12] = BYTE4(v27);
                  __s1[13] = BYTE5(v27);
                  if (!v43)
                  {
LABEL_95:
                    uint64_t __s2 = v37;
                    __int16 v149 = v36;
                    char v150 = BYTE2(v36);
                    char v151 = BYTE3(v36);
                    char v152 = BYTE4(v36);
                    size_t v65 = BYTE6(v36);
                    char v153 = BYTE5(v36);
                    swift_bridgeObjectRetain();
                    swift_bridgeObjectRetain();
                    swift_bridgeObjectRetain();
                    sub_24CFF1EAC(v28, v27);
                    int v64 = memcmp(__s1, &__s2, v65);
LABEL_171:
                    sub_24CFF1620(v28, v27);
                    if (v64)
                    {
LABEL_172:
                      swift_bridgeObjectRelease();
                      swift_bridgeObjectRelease();
                      swift_bridgeObjectRelease();
LABEL_173:
                      sub_24CFF1620(v28, v27);
                      uint64_t v18 = a2;
                      goto LABEL_27;
                    }
                    goto LABEL_52;
                  }
                  if (v43 == 1)
                  {
                    uint64_t v48 = (int)v37;
                    if (v37 >> 32 < (int)v37) {
                      goto LABEL_188;
                    }
                    v133 = (void *)((v37 >> 32) - (int)v37);
                    swift_bridgeObjectRetain();
                    swift_bridgeObjectRetain();
                    swift_bridgeObjectRetain();
                    sub_24CFF1EAC(v28, v27);
                    sub_24CFF529C((uint64_t)&v160);
                    uint64_t v127 = sub_24D0067D0();
                    if (!v127)
                    {
                      sub_24D0067E0();
                      __break(1u);
LABEL_205:
                      sub_24D0067E0();
                      __break(1u);
LABEL_206:
                      __break(1u);
LABEL_207:
                      __break(1u);
LABEL_208:
                      __break(1u);
LABEL_209:
                      __break(1u);
LABEL_210:
                      __break(1u);
LABEL_211:
                      __break(1u);
LABEL_212:
                      __break(1u);
LABEL_213:
                      __break(1u);
LABEL_214:
                      __break(1u);
LABEL_215:
                      __break(1u);
LABEL_216:
                      __break(1u);
LABEL_217:
                      __break(1u);
                      JUMPOUT(0x24CFEDACCLL);
                    }
                    uint64_t v49 = sub_24D0067F0();
                    BOOL v47 = __OFSUB__(v48, v49);
                    uint64_t v50 = v48 - v49;
                    if (v47) {
                      goto LABEL_193;
                    }
LABEL_91:
                    uint64_t v62 = sub_24D0067E0();
                    if (v62 >= (uint64_t)v133) {
                      size_t v63 = (size_t)v133;
                    }
                    else {
                      size_t v63 = v62;
                    }
                    int v64 = memcmp(__s1, (const void *)(v127 + v50), v63);
LABEL_170:
                    sub_24CFF52CC((uint64_t)&v160);
                    goto LABEL_171;
                  }
                  v138 = *(char **)(v37 + 16);
                  uint64_t v117 = *(void *)(v37 + 24);
                  swift_bridgeObjectRetain();
                  swift_bridgeObjectRetain();
                  swift_bridgeObjectRetain();
                  sub_24CFF1EAC(v28, v27);
                  sub_24CFF529C((uint64_t)&v160);
                  swift_retain();
                  swift_retain();
                  uint64_t v76 = sub_24D0067D0();
                  if (v76)
                  {
                    uint64_t v77 = v76;
                    uint64_t v78 = sub_24D0067F0();
                    v79 = v138;
                    if (__OFSUB__(v138, v78)) {
                      goto LABEL_198;
                    }
                    v113 = &v138[v77 - v78];
                  }
                  else
                  {
                    v113 = 0;
                    v79 = v138;
                  }
                  int64_t v95 = v117 - (void)v79;
                  if (__OFSUB__(v117, v79)) {
                    goto LABEL_191;
                  }
                  uint64_t v96 = sub_24D0067E0();
                  v97 = v113;
                  if (!v113) {
                    goto LABEL_208;
                  }
LABEL_133:
                  if (v96 >= v95) {
                    size_t v98 = v95;
                  }
                  else {
                    size_t v98 = v96;
                  }
                  int v84 = memcmp(__s1, v97, v98);
LABEL_145:
                  swift_release();
LABEL_146:
                  swift_release();
LABEL_147:
                  sub_24CFF52CC((uint64_t)&v160);
                  sub_24CFF1620(v28, v27);
                  if (v84) {
                    goto LABEL_172;
                  }
                  break;
              }
            }
            break;
          case 2uLL:
            uint64_t v46 = *(void *)(v37 + 16);
            uint64_t v45 = *(void *)(v37 + 24);
            BOOL v47 = __OFSUB__(v45, v46);
            uint64_t v44 = v45 - v46;
            if (!v47) {
              goto LABEL_67;
            }
            goto LABEL_183;
          case 3uLL:
            if (!v39) {
              goto LABEL_78;
            }
            goto LABEL_173;
          default:
            uint64_t v44 = BYTE6(v36);
            goto LABEL_67;
        }
      }
LABEL_52:
      int v35 = v159;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_24CFF1620(v28, v27);
      uint64_t v18 = a2;
      if (v146 == v35)
      {
        sub_24CFF5238((uint64_t)&v155);
        uint64_t v3 = v122;
        a1 = v123;
        int64_t v7 = v121;
        unint64_t v6 = v124;
        int64_t v2 = v125;
        if (v124) {
          goto LABEL_7;
        }
LABEL_8:
        int64_t v9 = v2 + 1;
        if (__OFADD__(v2, 1))
        {
          __break(1u);
LABEL_180:
          __break(1u);
LABEL_181:
          __break(1u);
LABEL_182:
          __break(1u);
LABEL_183:
          __break(1u);
LABEL_184:
          __break(1u);
LABEL_185:
          __break(1u);
LABEL_186:
          __break(1u);
LABEL_187:
          __break(1u);
LABEL_188:
          __break(1u);
LABEL_189:
          __break(1u);
LABEL_190:
          __break(1u);
LABEL_191:
          __break(1u);
LABEL_192:
          __break(1u);
LABEL_193:
          __break(1u);
LABEL_194:
          __break(1u);
LABEL_195:
          __break(1u);
LABEL_196:
          __break(1u);
LABEL_197:
          __break(1u);
LABEL_198:
          __break(1u);
LABEL_199:
          __break(1u);
LABEL_200:
          __break(1u);
LABEL_201:
          __break(1u);
LABEL_202:
          __break(1u);
LABEL_203:
          __break(1u);
        }
        if (v9 >= v7) {
          return 1;
        }
        unint64_t v10 = *(void *)(v3 + 8 * v9);
        int64_t v11 = v2 + 1;
        if (!v10)
        {
          int64_t v11 = v9 + 1;
          if (v9 + 1 >= v7) {
            return 1;
          }
          unint64_t v10 = *(void *)(v3 + 8 * v11);
          if (!v10)
          {
            int64_t v11 = v9 + 2;
            if (v9 + 2 >= v7) {
              return 1;
            }
            unint64_t v10 = *(void *)(v3 + 8 * v11);
            if (!v10)
            {
              int64_t v11 = v9 + 3;
              if (v9 + 3 >= v7) {
                return 1;
              }
              unint64_t v10 = *(void *)(v3 + 8 * v11);
              if (!v10)
              {
                int64_t v12 = v9 + 4;
                if (v12 >= v7) {
                  return 1;
                }
                unint64_t v10 = *(void *)(v3 + 8 * v12);
                if (!v10)
                {
                  while (1)
                  {
                    int64_t v11 = v12 + 1;
                    if (__OFADD__(v12, 1)) {
                      goto LABEL_185;
                    }
                    if (v11 >= v7) {
                      return 1;
                    }
                    unint64_t v10 = *(void *)(v3 + 8 * v11);
                    ++v12;
                    if (v10) {
                      goto LABEL_23;
                    }
                  }
                }
                int64_t v11 = v12;
              }
            }
          }
        }
LABEL_23:
        uint64_t v124 = (v10 - 1) & v10;
        int64_t v125 = v11;
        unint64_t v8 = __clz(__rbit64(v10)) + (v11 << 6);
        goto LABEL_24;
      }
LABEL_27:
      unint64_t v20 = (v20 + 1) & v145;
    }
    while (((*(void *)(v147 + ((v20 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v20) & 1) != 0);
  }
  sub_24CFF5238((uint64_t)&v155);
  return 0;
}

uint64_t sub_24CFEDAFC(uint64_t *a1, uint64_t *a2)
{
  return sub_24CFECC3C(*a1, *a2);
}

unint64_t ApprovalSettingsState.debugDescription.getter(uint64_t a1)
{
  sub_24D006CC0();
  swift_bridgeObjectRelease();
  unint64_t v47 = 0xD000000000000017;
  unint64_t v48 = 0x800000024D00A5F0;
  uint64_t v65 = *(void *)(a1 + 16);
  sub_24D006EC0();
  sub_24D006AD0();
  swift_bridgeObjectRelease();
  sub_24D006AD0();
  unint64_t v2 = 0xD000000000000017;
  unint64_t v63 = 0xD000000000000017;
  unint64_t v64 = 0x800000024D00A5F0;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  uint64_t v4 = ~v3;
  uint64_t v5 = -v3;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  else {
    uint64_t v6 = -1;
  }
  uint64_t v7 = v6 & *(void *)(a1 + 56);
  uint64_t v57 = a1;
  uint64_t v58 = a1 + 56;
  uint64_t v59 = v4;
  uint64_t v60 = 0;
  uint64_t v61 = v7;
  uint64_t v62 = 0;
  swift_bridgeObjectRetain();
  sub_24CFEDF20((uint64_t)&v47);
  uint64_t v8 = v49;
  if (v49)
  {
    uint64_t v9 = v47;
    uint64_t v10 = v48;
    uint64_t v12 = v50;
    uint64_t v11 = v51;
    uint64_t v13 = v52;
    uint64_t v14 = v53;
    uint64_t v15 = v54;
    unint64_t v16 = v55;
    char v17 = v56;
    do
    {
      uint64_t v65 = v10;
      uint64_t v66 = v8;
      uint64_t v67 = v12;
      uint64_t v68 = v11;
      uint64_t v44 = v13;
      uint64_t v45 = v11;
      uint64_t v69 = v13;
      uint64_t v70 = v14;
      uint64_t v42 = v15;
      uint64_t v43 = v14;
      uint64_t v71 = v15;
      unint64_t v72 = v16;
      unint64_t v41 = v16;
      char v73 = v17;
      unint64_t v47 = 0x207865646E492020;
      unint64_t v48 = 0xE800000000000000;
      sub_24D006EC0();
      sub_24D006AD0();
      swift_bridgeObjectRelease();
      sub_24D006AD0();
      sub_24D006AD0();
      swift_bridgeObjectRelease();
      unint64_t v21 = ApprovalSettingsStateEntry.debugDescription.getter();
      uint64_t v23 = sub_24CFEE498(0x7FFFFFFFFFFFFFFFLL, 1, v21, v22);
      int64_t v24 = *(void *)(v23 + 16);
      if (v24)
      {
        uint64_t v38 = v12;
        uint64_t v39 = v10;
        uint64_t v40 = v9;
        uint64_t v37 = v8;
        unint64_t v46 = MEMORY[0x263F8EE78];
        sub_24CFEFC38(0, v24, 0);
        unint64_t v25 = v46;
        uint64_t v26 = (uint64_t *)(v23 + 56);
        do
        {
          uint64_t v27 = *(v26 - 3);
          uint64_t v28 = *(v26 - 2);
          uint64_t v29 = *(v26 - 1);
          uint64_t v30 = *v26;
          unint64_t v47 = 538976288;
          unint64_t v48 = 0xE400000000000000;
          swift_bridgeObjectRetain();
          MEMORY[0x25331AC00](v27, v28, v29, v30);
          sub_24D006AD0();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          unint64_t v31 = v47;
          unint64_t v32 = v48;
          unint64_t v34 = *(void *)(v46 + 16);
          unint64_t v33 = *(void *)(v46 + 24);
          if (v34 >= v33 >> 1) {
            sub_24CFEFC38(v33 > 1, v34 + 1, 1);
          }
          *(void *)(v46 + 16) = v34 + 1;
          unint64_t v35 = v46 + 16 * v34;
          *(void *)(v35 + 32) = v31;
          *(void *)(v35 + 40) = v32;
          v26 += 4;
          --v24;
        }
        while (v24);
        swift_bridgeObjectRelease();
        uint64_t v8 = v37;
        uint64_t v12 = v38;
        uint64_t v9 = v40;
        uint64_t v10 = v39;
      }
      else
      {
        swift_bridgeObjectRelease();
        unint64_t v25 = MEMORY[0x263F8EE78];
      }
      unint64_t v47 = v25;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B182FE0);
      sub_24CFF35E0((unint64_t *)&qword_26B182FE8, &qword_26B182FE0);
      uint64_t v18 = sub_24D006A40();
      unint64_t v20 = v19;
      swift_bridgeObjectRelease();
      unint64_t v47 = v18;
      unint64_t v48 = v20;
      swift_bridgeObjectRetain();
      sub_24D006AD0();
      swift_bridgeObjectRelease();
      sub_24D006AD0();
      swift_bridgeObjectRelease();
      sub_24CFF2B94(v9, v10, v8, v12, v45, v44, v43, v42, v41);
      sub_24CFEDF20((uint64_t)&v47);
      uint64_t v9 = v47;
      uint64_t v10 = v48;
      uint64_t v8 = v49;
      uint64_t v12 = v50;
      uint64_t v11 = v51;
      uint64_t v13 = v52;
      uint64_t v14 = v53;
      uint64_t v15 = v54;
      unint64_t v16 = v55;
      char v17 = v56;
    }
    while (v49);
    unint64_t v2 = v63;
  }
  sub_24CFF2B8C();
  return v2;
}

void sub_24CFEDF20(uint64_t a1@<X8>)
{
  int64_t v3 = v1[3];
  unint64_t v2 = v1[4];
  int64_t v4 = v3;
  if (v2)
  {
    uint64_t v5 = (v2 - 1) & v2;
    unint64_t v6 = __clz(__rbit64(v2)) | (v3 << 6);
    goto LABEL_3;
  }
  int64_t v17 = v3 + 1;
  if (__OFADD__(v3, 1))
  {
LABEL_27:
    __break(1u);
    return;
  }
  int64_t v18 = (unint64_t)(v1[2] + 64) >> 6;
  if (v17 >= v18) {
    goto LABEL_25;
  }
  uint64_t v19 = v1[1];
  unint64_t v20 = *(void *)(v19 + 8 * v17);
  if (!v20)
  {
    int64_t v21 = v3 + 2;
    int64_t v4 = v3 + 1;
    if (v3 + 2 < v18)
    {
      unint64_t v20 = *(void *)(v19 + 8 * v21);
      if (v20)
      {
LABEL_13:
        int64_t v17 = v21;
        goto LABEL_10;
      }
      int64_t v4 = v3 + 2;
      if (v3 + 3 < v18)
      {
        unint64_t v20 = *(void *)(v19 + 8 * (v3 + 3));
        if (v20)
        {
          int64_t v17 = v3 + 3;
          goto LABEL_10;
        }
        int64_t v21 = v3 + 4;
        int64_t v4 = v3 + 3;
        if (v3 + 4 < v18)
        {
          unint64_t v20 = *(void *)(v19 + 8 * v21);
          if (v20) {
            goto LABEL_13;
          }
          int64_t v17 = v3 + 5;
          int64_t v4 = v3 + 4;
          if (v3 + 5 < v18)
          {
            unint64_t v20 = *(void *)(v19 + 8 * v17);
            if (v20) {
              goto LABEL_10;
            }
            int64_t v4 = v18 - 1;
            int64_t v22 = v3 + 6;
            while (v18 != v22)
            {
              unint64_t v20 = *(void *)(v19 + 8 * v22++);
              if (v20)
              {
                int64_t v17 = v22 - 1;
                goto LABEL_10;
              }
            }
          }
        }
      }
    }
LABEL_25:
    v1[3] = v4;
    v1[4] = 0;
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
    *(_OWORD *)(a1 + 32) = 0u;
    *(_OWORD *)(a1 + 48) = 0u;
    *(_OWORD *)(a1 + 57) = 0u;
    return;
  }
LABEL_10:
  uint64_t v5 = (v20 - 1) & v20;
  unint64_t v6 = __clz(__rbit64(v20)) + (v17 << 6);
  int64_t v4 = v17;
LABEL_3:
  uint64_t v7 = *(void *)(*v1 + 48) + 72 * v6;
  uint64_t v8 = *(void *)v7;
  uint64_t v9 = *(void *)(v7 + 8);
  uint64_t v10 = *(void *)(v7 + 16);
  long long v11 = *(_OWORD *)(v7 + 24);
  uint64_t v12 = *(void *)(v7 + 40);
  uint64_t v13 = *(void *)(v7 + 48);
  unint64_t v14 = *(void *)(v7 + 56);
  char v15 = *(unsigned char *)(v7 + 64);
  v1[3] = v4;
  v1[4] = v5;
  uint64_t v16 = v1[5];
  if (__OFADD__(v16, 1))
  {
    __break(1u);
    goto LABEL_27;
  }
  v1[5] = v16 + 1;
  *(void *)a1 = v16;
  *(void *)(a1 + 8) = v8;
  *(void *)(a1 + 16) = v9;
  *(void *)(a1 + 24) = v10;
  *(_OWORD *)(a1 + 32) = v11;
  *(void *)(a1 + 48) = v12;
  *(void *)(a1 + 56) = v13;
  *(void *)(a1 + 64) = v14;
  *(unsigned char *)(a1 + 72) = v15;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();

  sub_24CFF1EAC(v13, v14);
}

uint64_t ApprovalSettingsStateEntry.debugDescription.getter()
{
  v17[0] = 0;
  v17[1] = 0xE000000000000000;
  sub_24D006CC0();
  uint64_t v14 = 0;
  unint64_t v15 = 0xE000000000000000;
  sub_24D006AD0();
  swift_bridgeObjectRetain();
  sub_24D006AD0();
  swift_bridgeObjectRelease();
  sub_24D006AD0();
  sub_24CFF2C00(v0 + 16, (uint64_t)v17);
  sub_24CFF2C00((uint64_t)v17, (uint64_t)v16);
  sub_24CFF1E80((uint64_t)v17);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B182FD8);
  sub_24D006A80();
  sub_24D006AD0();
  swift_bridgeObjectRelease();
  sub_24D006AD0();
  sub_24CFF2C00(v0 + 32, (uint64_t)v16);
  sub_24CFF2C00((uint64_t)v16, (uint64_t)&v12);
  sub_24CFF1E80((uint64_t)v16);
  sub_24D006A80();
  sub_24D006AD0();
  swift_bridgeObjectRelease();
  sub_24D006AD0();
  uint64_t v1 = *(void *)(v0 + 48);
  unint64_t v2 = *(void *)(v0 + 56);
  if (v2 >> 60 != 15)
  {
    unint64_t v12 = 0;
    unint64_t v13 = 0xE000000000000000;
    sub_24CFF1EAC(v1, v2);
    sub_24CFE7000(v1, v2);
    sub_24D006CC0();
    swift_bridgeObjectRelease();
    unint64_t v12 = 0xD000000000000024;
    unint64_t v13 = 0x800000024D00A5C0;
    uint64_t v11 = sub_24CFE85C8(v1, v2);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B182FE0);
    sub_24CFF35E0((unint64_t *)&qword_26B182FE8, &qword_26B182FE0);
    sub_24D006A40();
    swift_bridgeObjectRelease();
    sub_24D006AD0();
    swift_bridgeObjectRelease();
    sub_24CFF1620(v1, v2);
  }
  sub_24D006AD0();
  swift_bridgeObjectRelease();
  sub_24CFF1620(v1, v2);
  uint64_t v3 = sub_24D006AD0();
  char v4 = *(unsigned char *)(v0 + 64);
  if (qword_26B182F58 != -1) {
    uint64_t v3 = swift_once();
  }
  MEMORY[0x270FA5388](v3);
  unsigned char v10[16] = v4;
  uint64_t v5 = swift_bridgeObjectRetain();
  uint64_t v6 = sub_24CFF1368(v5, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_24CFF5888, (uint64_t)v10);
  swift_bridgeObjectRelease();
  sub_24CFE9D04(v6);
  uint64_t v8 = v7;
  uint64_t result = swift_release();
  if (v8)
  {
    sub_24D006AD0();
    swift_bridgeObjectRelease();
    return v14;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_24CFEE498(uint64_t a1, char a2, unint64_t a3, unint64_t a4)
{
  if (a1 < 0)
  {
LABEL_50:
    uint64_t result = sub_24D006D80();
    __break(1u);
  }
  else
  {
    uint64_t v8 = swift_allocObject();
    *(void *)(v8 + 16) = MEMORY[0x263F8EE78];
    uint64_t v9 = swift_allocObject();
    uint64_t v10 = v9;
    *(void *)(v9 + 16) = 15;
    uint64_t v11 = HIBYTE(a4) & 0xF;
    if (a1)
    {
      uint64_t v12 = (a4 & 0x2000000000000000) != 0 ? HIBYTE(a4) & 0xF : a3 & 0xFFFFFFFFFFFFLL;
      if (v12)
      {
        uint64_t v41 = a1;
        unint64_t v45 = 4 * v12;
        unint64_t v13 = (void *)MEMORY[0x263F8EE78];
        unint64_t v14 = 15;
        unint64_t v15 = 15;
        uint64_t v42 = (void *)a3;
        uint64_t v43 = v9;
        while (1)
        {
          uint64_t v16 = sub_24D006B10();
          unint64_t v18 = v17;
          if (!((v17 & 0x2000000000000000) != 0 ? HIBYTE(v17) & 0xF : v16 & 0xFFFFFFFFFFFFLL)) {
            break;
          }
          if ((v17 & 0x1000000000000000) != 0)
          {
            uint64_t v20 = sub_24D006CB0();
          }
          else
          {
            if ((v17 & 0x2000000000000000) == 0 && (v16 & 0x1000000000000000) == 0) {
              sub_24D006D20();
            }
            uint64_t v20 = sub_24D006D30();
          }
          uint64_t v4 = v20;
          swift_bridgeObjectRelease();
          if ((v4 - 14) > 0xFFFFFFFB || (v4 - 8232) < 2 || v4 == 133)
          {
            if (v15 >> 14 == v14 >> 14 && (a2 & 1) != 0)
            {
              unint64_t v14 = sub_24D006AC0();
              *(void *)(v10 + 16) = v14;
              unint64_t v15 = v14;
            }
            else
            {
              if (v14 >> 14 < v15 >> 14) {
                goto LABEL_49;
              }
              unint64_t v21 = a4;
              uint64_t v22 = sub_24D006B20();
              uint64_t v24 = v23;
              uint64_t v26 = v25;
              uint64_t v4 = v27;
              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
                unint64_t v13 = sub_24CFEF684(0, v13[2] + 1, 1, v13);
              }
              uint64_t v28 = v13;
              unint64_t v29 = v13[2];
              uint64_t v30 = v28;
              unint64_t v31 = v28[3];
              if (v29 >= v31 >> 1) {
                uint64_t v30 = sub_24CFEF684((void *)(v31 > 1), v29 + 1, 1, v30);
              }
              v30[2] = v29 + 1;
              unint64_t v32 = &v30[4 * v29];
              unint64_t v13 = v30;
              v32[4] = v22;
              v32[5] = v24;
              v32[6] = v26;
              v32[7] = v4;
              *(void *)(v8 + 16) = v30;
              a4 = v21;
              a3 = (unint64_t)v42;
              unint64_t v15 = sub_24D006AC0();
              uint64_t v10 = v43;
              *(void *)(v43 + 16) = v15;
              unint64_t v14 = v15;
              if (v13[2] == v41)
              {
LABEL_38:
                if (v45 == v15 >> 14 && (a2 & 1) != 0)
                {
                  swift_bridgeObjectRelease();
                  goto LABEL_46;
                }
                if (v45 < v15 >> 14)
                {
LABEL_49:
                  sub_24D006D80();
                  __break(1u);
                  goto LABEL_50;
                }
                a3 = (unint64_t)v13;
                unint64_t v15 = sub_24D006B20();
                unint64_t v18 = v34;
                unint64_t v13 = v35;
                uint64_t v4 = v36;
                swift_bridgeObjectRelease();
                if (swift_isUniquelyReferenced_nonNull_native())
                {
LABEL_43:
                  unint64_t v38 = *(void *)(a3 + 16);
                  unint64_t v37 = *(void *)(a3 + 24);
                  if (v38 >= v37 >> 1) {
                    a3 = (unint64_t)sub_24CFEF684((void *)(v37 > 1), v38 + 1, 1, (void *)a3);
                  }
                  *(void *)(a3 + 16) = v38 + 1;
                  uint64_t v39 = (void *)(a3 + 32 * v38);
                  v39[4] = v15;
                  v39[5] = v18;
                  v39[6] = v13;
                  v39[7] = v4;
                  unint64_t v13 = (void *)a3;
                  *(void *)(v8 + 16) = a3;
                  goto LABEL_46;
                }
LABEL_48:
                a3 = (unint64_t)sub_24CFEF684(0, *(void *)(a3 + 16) + 1, 1, (void *)a3);
                goto LABEL_43;
              }
            }
          }
          else
          {
            unint64_t v14 = sub_24D006AC0();
          }
          if (v45 == v14 >> 14) {
            goto LABEL_38;
          }
        }
        __break(1u);
        goto LABEL_48;
      }
    }
    if ((a4 & 0x2000000000000000) == 0) {
      uint64_t v11 = a3 & 0xFFFFFFFFFFFFLL;
    }
    uint64_t v33 = 7;
    if (((a4 >> 60) & ((a3 & 0x800000000000000) == 0)) != 0) {
      uint64_t v33 = 11;
    }
    sub_24CFEF528(v33 | (v11 << 16), v9, a2 & 1, v8);
    swift_bridgeObjectRelease();
    unint64_t v13 = *(void **)(v8 + 16);
LABEL_46:
    swift_bridgeObjectRetain();
    swift_release();
    swift_release();
    return (uint64_t)v13;
  }
  return result;
}

unint64_t sub_24CFEE96C()
{
  return ApprovalSettingsState.debugDescription.getter(*v0);
}

uint64_t ApprovalSettingsStateEntry.driverIdentifier.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ApprovalSettingsStateEntry.displayName.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ApprovalSettingsStateEntry.usageText.getter()
{
  uint64_t v1 = *(void *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ApprovalSettingsStateEntry.source.getter()
{
  uint64_t v1 = *(void *)(v0 + 48);
  sub_24CFF1EAC(v1, *(void *)(v0 + 56));
  return v1;
}

uint64_t ApprovalSettingsStateEntry.approvalState.getter()
{
  return *(unsigned __int8 *)(v0 + 64);
}

unint64_t sub_24CFEEA40()
{
  unint64_t result = 0xD000000000000010;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0x4E79616C70736964;
      break;
    case 2:
      unint64_t result = 0x7865546567617375;
      break;
    case 3:
      unint64_t result = 0x656372756F73;
      break;
    case 4:
      unint64_t result = 0x6C61766F72707061;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_24CFEEB04@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24CFF2DB0(a1, a2);
  *a3 = result;
  return result;
}

void sub_24CFEEB2C(unsigned char *a1@<X8>)
{
  *a1 = 5;
}

uint64_t sub_24CFEEB38(uint64_t a1)
{
  unint64_t v2 = sub_24CFF2C68();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24CFEEB74(uint64_t a1)
{
  unint64_t v2 = sub_24CFF2C68();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t ApprovalSettingsStateEntry.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26984D300);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24CFF2C68();
  sub_24D006F80();
  LOBYTE(v12) = 0;
  sub_24D006E80();
  if (!v2)
  {
    LOBYTE(v12) = 1;
    sub_24D006E70();
    LOBYTE(v12) = 2;
    sub_24D006E70();
    sub_24CFF1F14((_OWORD *)(v3 + 48), &v13);
    sub_24CFF1F14(&v13, &v12);
    char v11 = 3;
    sub_24CFF1F24();
    sub_24D006EA0();
    LOBYTE(v12) = *(unsigned char *)(v3 + 64);
    char v11 = 4;
    sub_24CFF1F78();
    sub_24D006EA0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

__n128 ApprovalSettingsStateEntry.init(from:)@<Q0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_24CFF300C(a1, (uint64_t)v6);
  if (!v2)
  {
    long long v5 = v6[3];
    *(_OWORD *)(a2 + 32) = v6[2];
    *(_OWORD *)(a2 + 48) = v5;
    *(unsigned char *)(a2 + 64) = v7;
    __n128 result = (__n128)v6[1];
    *(_OWORD *)a2 = v6[0];
    *(__n128 *)(a2 + 16) = result;
  }
  return result;
}

__n128 sub_24CFEEE1C@<Q0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_24CFF300C(a1, (uint64_t)v6);
  if (!v2)
  {
    long long v5 = v6[3];
    *(_OWORD *)(a2 + 32) = v6[2];
    *(_OWORD *)(a2 + 48) = v5;
    *(unsigned char *)(a2 + 64) = v7;
    __n128 result = (__n128)v6[1];
    *(_OWORD *)a2 = v6[0];
    *(__n128 *)(a2 + 16) = result;
  }
  return result;
}

uint64_t sub_24CFEEE70(void *a1)
{
  return ApprovalSettingsStateEntry.encode(to:)(a1);
}

BOOL sub_24CFEEEB8(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a1 + 48);
  v7[2] = *(_OWORD *)(a1 + 32);
  v7[3] = v2;
  char v8 = *(unsigned char *)(a1 + 64);
  long long v3 = *(_OWORD *)(a1 + 16);
  v7[0] = *(_OWORD *)a1;
  v7[1] = v3;
  long long v4 = *(_OWORD *)(a2 + 48);
  void v9[2] = *(_OWORD *)(a2 + 32);
  v9[3] = v4;
  char v10 = *(unsigned char *)(a2 + 64);
  long long v5 = *(_OWORD *)(a2 + 16);
  v9[0] = *(_OWORD *)a2;
  v9[1] = v5;
  return _s16DriverManagement26ApprovalSettingsStateEntryV23__derived_struct_equalsySbAC_ACtFZ_0((uint64_t)v7, (uint64_t)v9);
}

uint64_t ApprovalSettingsStateEntry.hash(into:)()
{
  swift_bridgeObjectRetain();
  sub_24D006AB0();
  swift_bridgeObjectRelease();
  if (v0[3])
  {
    sub_24D006F50();
    swift_bridgeObjectRetain();
    sub_24D006AB0();
    swift_bridgeObjectRelease();
    if (v0[5])
    {
LABEL_3:
      sub_24D006F50();
      swift_bridgeObjectRetain();
      sub_24D006AB0();
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
  }
  else
  {
    sub_24D006F50();
    if (v0[5]) {
      goto LABEL_3;
    }
  }
  sub_24D006F50();
LABEL_6:
  unint64_t v1 = v0[7];
  if (v1 >> 60 == 15)
  {
    sub_24D006F40();
  }
  else
  {
    uint64_t v2 = v0[6];
    sub_24D006F40();
    sub_24CFE7000(v2, v1);
    sub_24D0068B0();
    sub_24CFF1620(v2, v1);
  }
  return sub_24D006F40();
}

uint64_t ApprovalSettingsStateEntry.hashValue.getter()
{
  return sub_24D006F60();
}

uint64_t sub_24CFEF080()
{
  return sub_24D006F60();
}

uint64_t sub_24CFEF0C4()
{
  return sub_24D006F60();
}

uint64_t sub_24CFEF100()
{
  return ApprovalSettingsStateEntry.debugDescription.getter();
}

uint64_t ApprovalStateUpdateRequest.__allocating_init(entry:callback:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = swift_allocObject();
  long long v7 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v6 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v6 + 32) = v7;
  *(unsigned char *)(v6 + 48) = *(unsigned char *)(a1 + 32);
  *(void *)(v6 + 56) = a2;
  *(void *)(v6 + 64) = a3;
  sub_24D0068D0();
  return v6;
}

uint64_t ApprovalStateUpdateRequest.init(entry:callback:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = sub_24D0068E0();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  char v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v11 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v3 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v3 + 32) = v11;
  *(unsigned char *)(v3 + 48) = *(unsigned char *)(a1 + 32);
  *(void *)(v3 + 56) = a2;
  *(void *)(v3 + 64) = a3;
  sub_24D0068D0();
  (*(void (**)(uint64_t, char *, uint64_t))(v8 + 32))(v3 + OBJC_IVAR____TtC16DriverManagement26ApprovalStateUpdateRequest_timestamp, v10, v7);
  return v3;
}

uint64_t ApprovalStateUpdateRequest.deinit()
{
  uint64_t v1 = *(void *)(v0 + 32);
  unint64_t v2 = *(void *)(v0 + 40);
  swift_bridgeObjectRelease();
  sub_24CFF1620(v1, v2);
  swift_release();
  uint64_t v3 = v0 + OBJC_IVAR____TtC16DriverManagement26ApprovalStateUpdateRequest_timestamp;
  uint64_t v4 = sub_24D0068E0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  return v0;
}

uint64_t ApprovalStateUpdateRequest.__deallocating_deinit()
{
  uint64_t v1 = v0[4];
  unint64_t v2 = v0[5];
  swift_bridgeObjectRelease();
  sub_24CFF1620(v1, v2);
  swift_release();
  uint64_t v3 = (char *)v0 + OBJC_IVAR____TtC16DriverManagement26ApprovalStateUpdateRequest_timestamp;
  uint64_t v4 = sub_24D0068E0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = *(unsigned int *)(*v0 + 48);
  uint64_t v6 = *(unsigned __int16 *)(*v0 + 52);

  return MEMORY[0x270FA0228](v0, v5, v6);
}

unint64_t ApprovalStateUpdateRequest.description.getter()
{
  *(void *)&v3[0] = 0;
  *((void *)&v3[0] + 1) = 0xE000000000000000;
  sub_24D006CC0();
  swift_bridgeObjectRelease();
  sub_24D0068E0();
  sub_24CFF346C();
  sub_24D006EC0();
  sub_24D006AD0();
  swift_bridgeObjectRelease();
  sub_24D006AD0();
  long long v1 = *(_OWORD *)(v0 + 32);
  v3[0] = *(_OWORD *)(v0 + 16);
  v3[1] = v1;
  char v4 = *(unsigned char *)(v0 + 48);
  sub_24CFF34C4((uint64_t)v3);
  ApprovalDBEntry.description.getter();
  sub_24D006AD0();
  swift_bridgeObjectRelease();
  sub_24CFF3508((uint64_t)v3);
  return 0xD000000000000014;
}

unint64_t sub_24CFEF4F8()
{
  return ApprovalStateUpdateRequest.description.getter();
}

uint64_t sub_24CFEF51C(uint64_t *a1, uint64_t *a2)
{
  return _s16DriverManagement26ApprovalStateUpdateRequestC2eeoiySbAC_ACtFZ_0(*a1, *a2);
}

uint64_t sub_24CFEF528(unint64_t a1, uint64_t a2, unsigned __int8 a3, uint64_t a4)
{
  unint64_t v4 = *(void *)(a2 + 16) >> 14;
  int v5 = (v4 == a1 >> 14) & a3;
  if (v5 == 1) {
    return v5 ^ 1u;
  }
  if (a1 >> 14 >= v4)
  {
    uint64_t v7 = sub_24D006B20();
    uint64_t v9 = v8;
    uint64_t v11 = v10;
    uint64_t v13 = v12;
    unint64_t v14 = *(void **)(a4 + 16);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(void *)(a4 + 16) = v14;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      unint64_t v14 = sub_24CFEF684(0, v14[2] + 1, 1, v14);
      *(void *)(a4 + 16) = v14;
    }
    unint64_t v17 = v14[2];
    unint64_t v16 = v14[3];
    if (v17 >= v16 >> 1)
    {
      unint64_t v14 = sub_24CFEF684((void *)(v16 > 1), v17 + 1, 1, v14);
      *(void *)(a4 + 16) = v14;
    }
    v14[2] = v17 + 1;
    unint64_t v18 = &v14[4 * v17];
    v18[4] = v7;
    v18[5] = v9;
    v18[6] = v11;
    v18[7] = v13;
    return v5 ^ 1u;
  }
  uint64_t result = sub_24D006D80();
  __break(1u);
  return result;
}

void *sub_24CFEF684(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B183028);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 1;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 5);
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
        if (v10 != a4 || v13 >= &a4[4 * v8 + 4]) {
          memmove(v13, a4 + 4, 32 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_24CFF2CBC(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_24CFEF794@<X0>(uint64_t __s1@<X0>, uint64_t a2@<X2>, unint64_t a3@<X3>, char *a4@<X8>)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  uint64_t v7 = (const void *)__s1;
  switch(a3 >> 62)
  {
    case 1uLL:
      uint64_t v9 = (a2 >> 32) - (int)a2;
      if (a2 >> 32 < (int)a2)
      {
        __break(1u);
LABEL_31:
        __break(1u);
LABEL_32:
        __break(1u);
        goto LABEL_33;
      }
      sub_24CFE7000(a2, a3);
      uint64_t v10 = (char *)sub_24D0067D0();
      if (!v10) {
        goto LABEL_8;
      }
      uint64_t v11 = sub_24D0067F0();
      if (__OFSUB__((int)a2, v11)) {
LABEL_33:
      }
        __break(1u);
      v10 += (int)a2 - v11;
LABEL_8:
      uint64_t v12 = sub_24D0067E0();
      if (v12 >= v9) {
        size_t v13 = (a2 >> 32) - (int)a2;
      }
      else {
        size_t v13 = v12;
      }
      if (!v7)
      {
LABEL_35:
        __break(1u);
LABEL_36:
        __break(1u);
LABEL_37:
        __break(1u);
LABEL_38:
        __break(1u);
LABEL_39:
        __break(1u);
        JUMPOUT(0x24CFEF9F8);
      }
      if (!v10) {
        goto LABEL_36;
      }
      int v14 = memcmp(v7, v10, v13);
      __s1 = sub_24CFE71CC(a2, a3);
      BOOL v8 = v14 == 0;
LABEL_24:
      char v24 = v8;
LABEL_29:
      *a4 = v24;
      return __s1;
    case 2uLL:
      uint64_t v15 = *(void *)(a2 + 16);
      uint64_t v16 = *(void *)(a2 + 24);
      swift_retain();
      swift_retain();
      unint64_t v17 = (char *)sub_24D0067D0();
      if (!v17) {
        goto LABEL_17;
      }
      uint64_t v18 = sub_24D0067F0();
      if (__OFSUB__(v15, v18)) {
        goto LABEL_32;
      }
      v17 += v15 - v18;
LABEL_17:
      BOOL v19 = __OFSUB__(v16, v15);
      int64_t v20 = v16 - v15;
      if (v19) {
        goto LABEL_31;
      }
      uint64_t v21 = sub_24D0067E0();
      if (v21 >= v20) {
        size_t v22 = v20;
      }
      else {
        size_t v22 = v21;
      }
      if (!v7) {
        goto LABEL_37;
      }
      if (!v17) {
        goto LABEL_38;
      }
      int v23 = memcmp(v7, v17, v22);
      swift_release();
      __s1 = swift_release();
      BOOL v8 = v23 == 0;
      goto LABEL_24;
    case 3uLL:
      if (!__s1) {
        goto LABEL_39;
      }
      char v24 = 1;
      goto LABEL_29;
    default:
      uint64_t __s2 = a2;
      __int16 v26 = a3;
      char v27 = BYTE2(a3);
      char v28 = BYTE3(a3);
      char v29 = BYTE4(a3);
      char v30 = BYTE5(a3);
      if (__s1)
      {
        __s1 = memcmp((const void *)__s1, &__s2, BYTE6(a3));
        BOOL v8 = __s1 == 0;
        goto LABEL_24;
      }
      __break(1u);
      goto LABEL_35;
  }
}

uint64_t sub_24CFEFA08(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  __s1[2] = *MEMORY[0x263EF8340];
  switch(a2 >> 62)
  {
    case 1uLL:
      if (a1 >> 32 < (int)a1) {
        __break(1u);
      }
      sub_24CFE7000(a1, a2);
      char v5 = sub_24CFF0E38((int)a1, a1 >> 32, a2 & 0x3FFFFFFFFFFFFFFFLL, a3, a4);
      sub_24CFE71CC(a1, a2);
      goto LABEL_6;
    case 2uLL:
      uint64_t v10 = a2 & 0x3FFFFFFFFFFFFFFFLL;
      uint64_t v11 = *(void *)(a1 + 16);
      uint64_t v12 = *(void *)(a1 + 24);
      swift_retain();
      swift_retain();
      char v5 = sub_24CFF0E38(v11, v12, v10, a3, a4);
      swift_release();
      swift_release();
LABEL_6:
      sub_24CFE71CC(a3, a4);
      return v5 & 1;
    case 3uLL:
      memset(__s1, 0, 14);
      goto LABEL_8;
    default:
      __s1[0] = a1;
      LOWORD(__s1[1]) = a2;
      BYTE2(__s1[1]) = BYTE2(a2);
      BYTE3(__s1[1]) = BYTE3(a2);
      BYTE4(__s1[1]) = BYTE4(a2);
      BYTE5(__s1[1]) = BYTE5(a2);
LABEL_8:
      sub_24CFEF794((uint64_t)__s1, a3, a4, &v14);
      sub_24CFE71CC(a3, a4);
      if (!v4) {
        char v5 = v14;
      }
      return v5 & 1;
  }
}

uint64_t sub_24CFEFC38(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_24CFEFC78(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_24CFEFC58(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_24CFEFDE4(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_24CFEFC78(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B183020);
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
  size_t v13 = v10 + 32;
  char v14 = a4 + 32;
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
  uint64_t result = sub_24D006DE0();
  __break(1u);
  return result;
}

uint64_t sub_24CFEFDE4(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
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
  if (!v9)
  {
    size_t v13 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B183018);
  uint64_t v10 = *(void *)(type metadata accessor for DriverKitDriver() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  size_t v13 = (void *)swift_allocObject();
  size_t v14 = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v14 - v12 == 0x8000000000000000 && v11 == -1) {
    goto LABEL_34;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(type metadata accessor for DriverKitDriver() - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  uint64_t v18 = (char *)v13 + v17;
  BOOL v19 = (char *)a4 + v17;
  if (a1)
  {
    if (v13 < a4 || v18 >= &v19[*(void *)(v16 + 72) * v8])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  uint64_t v20 = *(void *)(v16 + 72) * v8;
  uint64_t v21 = &v18[v20];
  unint64_t v22 = (unint64_t)&v19[v20];
  if (v19 >= v21 || (unint64_t)v18 >= v22)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_36:
  uint64_t result = sub_24D006DE0();
  __break(1u);
  return result;
}

uint64_t sub_24CFF0024(uint64_t a1, uint64_t a2)
{
  return sub_24CFF007C(a1, a2, MEMORY[0x263F8D2A8], (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_24CFF0110);
}

uint64_t sub_24CFF0050(uint64_t a1, uint64_t a2)
{
  return sub_24CFF007C(a1, a2, MEMORY[0x263F06F38], (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_24CFF01F4);
}

uint64_t sub_24CFF007C(uint64_t a1, uint64_t a2, void (*a3)(unsigned char *, uint64_t, uint64_t), uint64_t (*a4)(uint64_t, uint64_t, uint64_t))
{
  sub_24D006F30();
  a3(v10, a1, a2);
  uint64_t v7 = sub_24D006F60();

  return a4(a1, a2, v7);
}

unint64_t sub_24CFF0110(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_24D006ED0() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        size_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_24D006ED0() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_24CFF01F4(uint64_t a1, unint64_t a2, uint64_t a3)
{
  __s1[2] = *MEMORY[0x263EF8340];
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v7 = v3;
    unint64_t v8 = a2;
    uint64_t v10 = ~v5;
    unint64_t v80 = HIDWORD(a1);
    size_t v86 = HIDWORD(a1) - (int)a1;
    uint64_t v87 = ~v5;
    BOOL v11 = __OFSUB__(HIDWORD(a1), a1);
    BOOL v85 = v11;
    unint64_t v88 = a2 >> 62;
    uint64_t v83 = v3 + 64;
    uint64_t v84 = (int)a1;
    uint64_t v81 = a1 >> 32;
    uint64_t v79 = (a1 >> 32) - (int)a1;
    unint64_t v89 = a2 >> 62;
    size_t __n = BYTE6(a2);
    while (1)
    {
      uint64_t v12 = (uint64_t *)(*(void *)(v7 + 48) + 16 * v6);
      uint64_t v14 = *v12;
      unint64_t v13 = v12[1];
      uint64_t v15 = 0;
      switch(v13 >> 62)
      {
        case 1uLL:
          if (__OFSUB__(HIDWORD(v14), v14))
          {
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
LABEL_140:
            __break(1u);
LABEL_141:
            __break(1u);
LABEL_142:
            __break(1u);
LABEL_143:
            __break(1u);
          }
          uint64_t v15 = HIDWORD(v14) - (int)v14;
LABEL_14:
          sub_24CFE7000(v14, v13);
          break;
        case 2uLL:
          uint64_t v17 = *(void *)(v14 + 16);
          uint64_t v16 = *(void *)(v14 + 24);
          uint64_t v15 = v16 - v17;
          if (!__OFSUB__(v16, v17)) {
            goto LABEL_14;
          }
          goto LABEL_122;
        case 3uLL:
          break;
        default:
          uint64_t v15 = BYTE6(v13);
          break;
      }
      size_t v18 = __n;
      switch(v89)
      {
        case 1uLL:
          size_t v18 = v86;
          if (v85) {
            goto LABEL_123;
          }
          goto LABEL_19;
        case 2uLL:
          uint64_t v20 = *(void *)(a1 + 16);
          uint64_t v19 = *(void *)(a1 + 24);
          BOOL v21 = __OFSUB__(v19, v20);
          size_t v18 = v19 - v20;
          if (!v21) {
            goto LABEL_19;
          }
          goto LABEL_124;
        case 3uLL:
          if (v15) {
            goto LABEL_7;
          }
          goto LABEL_119;
        default:
LABEL_19:
          if (v15 == v18)
          {
            if (v15 < 1)
            {
LABEL_119:
              sub_24CFE71CC(v14, v13);
              return v6;
            }
            switch(v13 >> 62)
            {
              case 1uLL:
                if ((int)v14 > v14 >> 32) {
                  goto LABEL_125;
                }
                uint64_t v26 = sub_24D0067D0();
                if (v26)
                {
                  uint64_t v27 = v26;
                  uint64_t v28 = sub_24D0067F0();
                  if (__OFSUB__((int)v14, v28)) {
                    goto LABEL_127;
                  }
                  char v29 = (const void *)(v27 + (int)v14 - v28);
                }
                else
                {
                  char v29 = 0;
                }
                sub_24D0067E0();
                if (!v88)
                {
                  LOWORD(__s1[0]) = a1;
                  BYTE2(__s1[0]) = BYTE2(a1);
                  BYTE3(__s1[0]) = BYTE3(a1);
                  BYTE4(__s1[0]) = v80;
                  BYTE5(__s1[0]) = BYTE5(a1);
                  BYTE6(__s1[0]) = BYTE6(a1);
                  HIBYTE(__s1[0]) = HIBYTE(a1);
                  LOWORD(__s1[1]) = v8;
                  BYTE2(__s1[1]) = BYTE2(v8);
                  BYTE3(__s1[1]) = BYTE3(v8);
                  BYTE4(__s1[1]) = BYTE4(v8);
                  BYTE5(__s1[1]) = BYTE5(v8);
                  if (!v29) {
                    goto LABEL_155;
                  }
                  int v46 = memcmp(v29, __s1, __n);
LABEL_102:
                  sub_24CFE71CC(v14, v13);
                  uint64_t v10 = v87;
                  if (!v46) {
                    return v6;
                  }
                  break;
                }
                if (v88 == 1)
                {
                  if (v81 < v84) {
                    goto LABEL_136;
                  }
                  swift_retain();
                  uint64_t v47 = sub_24D0067D0();
                  if (v47)
                  {
                    uint64_t v48 = sub_24D0067F0();
                    if (__OFSUB__(v84, v48)) {
                      goto LABEL_143;
                    }
                    v47 += v84 - v48;
                  }
                  uint64_t v49 = sub_24D0067E0();
                  size_t v50 = v79;
                  if (v49 < v79) {
                    size_t v50 = v49;
                  }
                  if (!v29) {
                    goto LABEL_148;
                  }
                  if (!v47) {
                    goto LABEL_149;
                  }
                  size_t v39 = v50;
                  uint64_t v40 = v29;
                  unint64_t v38 = (const void *)v47;
LABEL_71:
                  int v46 = memcmp(v40, v38, v39);
                  sub_24CFE71CC(a1, v8);
                  goto LABEL_102;
                }
                uint64_t v69 = *(void *)(a1 + 16);
                uint64_t v78 = *(void *)(a1 + 24);
                swift_retain();
                swift_retain();
                uint64_t v70 = sub_24D0067D0();
                if (v70)
                {
                  uint64_t v71 = v70;
                  uint64_t v72 = sub_24D0067F0();
                  if (__OFSUB__(v69, v72)) {
                    goto LABEL_142;
                  }
                  char v73 = (const void *)(v71 + v69 - v72);
                }
                else
                {
                  char v73 = 0;
                }
                if (__OFSUB__(v78, v69)) {
                  goto LABEL_137;
                }
                uint64_t v74 = sub_24D0067E0();
                if (v74 >= v78 - v69) {
                  size_t v75 = v78 - v69;
                }
                else {
                  size_t v75 = v74;
                }
                if (!v29) {
                  goto LABEL_156;
                }
                uint64_t v4 = v83;
                if (!v73) {
                  goto LABEL_157;
                }
                int v62 = memcmp(v29, v73, v75);
LABEL_115:
                swift_release();
LABEL_116:
                swift_release();
                sub_24CFE71CC(v14, v13);
                unint64_t v8 = a2;
                uint64_t v10 = v87;
                if (!v62) {
                  return v6;
                }
                break;
              case 2uLL:
                uint64_t v30 = *(void *)(v14 + 16);
                swift_retain();
                swift_retain();
                uint64_t v31 = sub_24D0067D0();
                if (v31)
                {
                  uint64_t v32 = v31;
                  uint64_t v33 = sub_24D0067F0();
                  if (__OFSUB__(v30, v33)) {
                    goto LABEL_126;
                  }
                  unint64_t v34 = (const void *)(v32 + v30 - v33);
                }
                else
                {
                  unint64_t v34 = 0;
                }
                sub_24D0067E0();
                uint64_t v4 = v83;
                if (!v88)
                {
                  LOWORD(__s1[0]) = a1;
                  BYTE2(__s1[0]) = BYTE2(a1);
                  BYTE3(__s1[0]) = BYTE3(a1);
                  BYTE4(__s1[0]) = v80;
                  BYTE5(__s1[0]) = BYTE5(a1);
                  BYTE6(__s1[0]) = BYTE6(a1);
                  HIBYTE(__s1[0]) = HIBYTE(a1);
                  LODWORD(__s1[1]) = a2;
                  WORD2(__s1[1]) = WORD2(a2);
                  if (!v34) {
                    goto LABEL_152;
                  }
                  int v62 = memcmp(v34, __s1, __n);
                  swift_release();
                  goto LABEL_116;
                }
                if (v88 == 1)
                {
                  if (v81 < v84) {
                    goto LABEL_130;
                  }
                  swift_retain();
                  uint64_t v42 = (char *)sub_24D0067D0();
                  if (v42)
                  {
                    uint64_t v43 = sub_24D0067F0();
                    if (__OFSUB__(v84, v43)) {
                      goto LABEL_141;
                    }
                    v42 += v84 - v43;
                  }
                  uint64_t v44 = sub_24D0067E0();
                  size_t v45 = v79;
                  if (v44 < v79) {
                    size_t v45 = v44;
                  }
                  if (!v34) {
                    goto LABEL_146;
                  }
                  if (!v42) {
                    goto LABEL_147;
                  }
                  int v46 = memcmp(v34, v42, v45);
                  unint64_t v8 = a2;
                  sub_24CFE71CC(a1, a2);
                  swift_release();
                  swift_release();
                  goto LABEL_102;
                }
                uint64_t v63 = *(void *)(a1 + 16);
                uint64_t v77 = *(void *)(a1 + 24);
                swift_retain();
                swift_retain();
                unint64_t v64 = (char *)sub_24D0067D0();
                if (v64)
                {
                  uint64_t v65 = sub_24D0067F0();
                  if (__OFSUB__(v63, v65)) {
                    goto LABEL_140;
                  }
                  v64 += v63 - v65;
                }
                BOOL v21 = __OFSUB__(v77, v63);
                int64_t v66 = v77 - v63;
                if (v21) {
                  goto LABEL_135;
                }
                uint64_t v67 = sub_24D0067E0();
                if (v67 >= v66) {
                  size_t v68 = v66;
                }
                else {
                  size_t v68 = v67;
                }
                if (!v34) {
                  goto LABEL_153;
                }
                uint64_t v4 = v83;
                if (!v64) {
                  goto LABEL_154;
                }
                int v62 = memcmp(v34, v64, v68);
                swift_release();
                swift_release();
                goto LABEL_115;
              case 3uLL:
                memset(__s1, 0, 14);
                if (!v88) {
                  goto LABEL_45;
                }
                if (v88 == 1)
                {
                  if (v81 < v84) {
                    goto LABEL_129;
                  }
                  sub_24CFE7000(a1, v8);
                  uint64_t v35 = sub_24D0067D0();
                  if (!v35) {
                    goto LABEL_145;
                  }
                  uint64_t v23 = v35;
                  uint64_t v36 = sub_24D0067F0();
                  uint64_t v25 = v84 - v36;
                  if (__OFSUB__(v84, v36)) {
                    goto LABEL_134;
                  }
LABEL_41:
                  uint64_t v37 = sub_24D0067E0();
                  unint64_t v38 = (const void *)(v23 + v25);
                  if (v37 >= v79) {
                    size_t v39 = v79;
                  }
                  else {
                    size_t v39 = v37;
                  }
                  uint64_t v40 = __s1;
                  goto LABEL_71;
                }
                uint64_t v57 = *(void *)(a1 + 16);
                uint64_t v58 = *(void *)(a1 + 24);
                swift_retain();
                swift_retain();
                uint64_t v53 = (char *)sub_24D0067D0();
                if (v53)
                {
                  uint64_t v59 = sub_24D0067F0();
                  if (__OFSUB__(v57, v59)) {
                    goto LABEL_139;
                  }
                  v53 += v57 - v59;
                }
                BOOL v21 = __OFSUB__(v58, v57);
                int64_t v55 = v58 - v57;
                if (v21) {
                  goto LABEL_132;
                }
                uint64_t v56 = sub_24D0067E0();
                if (!v53) {
                  goto LABEL_151;
                }
LABEL_83:
                if (v56 >= v55) {
                  size_t v60 = v55;
                }
                else {
                  size_t v60 = v56;
                }
                int v61 = memcmp(__s1, v53, v60);
                swift_release();
                swift_release();
                sub_24CFE71CC(v14, v13);
                uint64_t v4 = v83;
                uint64_t v10 = v87;
                if (!v61) {
                  return v6;
                }
                break;
              default:
                __s1[0] = v14;
                LOWORD(__s1[1]) = v13;
                BYTE2(__s1[1]) = BYTE2(v13);
                BYTE3(__s1[1]) = BYTE3(v13);
                BYTE4(__s1[1]) = BYTE4(v13);
                BYTE5(__s1[1]) = BYTE5(v13);
                if (!v88)
                {
LABEL_45:
                  __int16 __s2 = a1;
                  char v92 = BYTE2(a1);
                  char v93 = BYTE3(a1);
                  char v94 = v80;
                  char v95 = BYTE5(a1);
                  char v96 = BYTE6(a1);
                  char v97 = HIBYTE(a1);
                  __int16 v98 = v8;
                  char v99 = BYTE2(v8);
                  char v100 = BYTE3(v8);
                  char v101 = BYTE4(v8);
                  char v102 = BYTE5(v8);
                  int v41 = memcmp(__s1, &__s2, __n);
                  sub_24CFE71CC(v14, v13);
                  if (!v41) {
                    return v6;
                  }
                  break;
                }
                if (v88 == 1)
                {
                  if (v81 < v84) {
                    goto LABEL_128;
                  }
                  sub_24CFE7000(a1, v8);
                  uint64_t v22 = sub_24D0067D0();
                  if (!v22)
                  {
                    sub_24D0067E0();
                    __break(1u);
LABEL_145:
                    sub_24D0067E0();
                    __break(1u);
LABEL_146:
                    __break(1u);
LABEL_147:
                    __break(1u);
LABEL_148:
                    __break(1u);
LABEL_149:
                    __break(1u);
LABEL_150:
                    __break(1u);
LABEL_151:
                    __break(1u);
LABEL_152:
                    __break(1u);
LABEL_153:
                    __break(1u);
LABEL_154:
                    __break(1u);
LABEL_155:
                    __break(1u);
LABEL_156:
                    __break(1u);
LABEL_157:
                    __break(1u);
                    JUMPOUT(0x24CFF0B60);
                  }
                  uint64_t v23 = v22;
                  uint64_t v24 = sub_24D0067F0();
                  uint64_t v25 = v84 - v24;
                  if (__OFSUB__(v84, v24)) {
                    goto LABEL_133;
                  }
                  goto LABEL_41;
                }
                uint64_t v51 = *(void *)(a1 + 16);
                uint64_t v52 = *(void *)(a1 + 24);
                swift_retain();
                swift_retain();
                uint64_t v53 = (char *)sub_24D0067D0();
                if (v53)
                {
                  uint64_t v54 = sub_24D0067F0();
                  if (__OFSUB__(v51, v54)) {
                    goto LABEL_138;
                  }
                  v53 += v51 - v54;
                }
                BOOL v21 = __OFSUB__(v52, v51);
                int64_t v55 = v52 - v51;
                if (v21) {
                  goto LABEL_131;
                }
                uint64_t v56 = sub_24D0067E0();
                if (!v53) {
                  goto LABEL_150;
                }
                goto LABEL_83;
            }
          }
          else
          {
LABEL_7:
            sub_24CFE71CC(v14, v13);
          }
          unint64_t v6 = (v6 + 1) & v10;
          if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
            return v6;
          }
          break;
      }
    }
  }
  return v6;
}

uint64_t sub_24CFF0B90(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!a3) {
    return MEMORY[0x263F8EE80];
  }
  uint64_t v4 = a4;
  uint64_t v5 = a3;
  if (*(void *)(a4 + 16) == a3)
  {
    swift_retain();
    return v4;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B182FF0);
  uint64_t result = sub_24D006DD0();
  uint64_t v8 = result;
  uint64_t v31 = a2;
  if (a2 < 1) {
    unint64_t v9 = 0;
  }
  else {
    unint64_t v9 = *a1;
  }
  uint64_t v10 = 0;
  uint64_t v11 = result + 64;
  while (1)
  {
    if (v9)
    {
      unint64_t v12 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      unint64_t v13 = v12 | (v10 << 6);
    }
    else
    {
      uint64_t v14 = v10 + 1;
      if (__OFADD__(v10, 1)) {
        goto LABEL_40;
      }
      if (v14 >= v31) {
        return v8;
      }
      unint64_t v15 = a1[v14];
      ++v10;
      if (!v15)
      {
        uint64_t v10 = v14 + 1;
        if (v14 + 1 >= v31) {
          return v8;
        }
        unint64_t v15 = a1[v10];
        if (!v15)
        {
          uint64_t v10 = v14 + 2;
          if (v14 + 2 >= v31) {
            return v8;
          }
          unint64_t v15 = a1[v10];
          if (!v15)
          {
            uint64_t v16 = v14 + 3;
            if (v16 >= v31) {
              return v8;
            }
            unint64_t v15 = a1[v16];
            if (!v15)
            {
              while (1)
              {
                uint64_t v10 = v16 + 1;
                if (__OFADD__(v16, 1)) {
                  goto LABEL_41;
                }
                if (v10 >= v31) {
                  return v8;
                }
                unint64_t v15 = a1[v10];
                ++v16;
                if (v15) {
                  goto LABEL_24;
                }
              }
            }
            uint64_t v10 = v16;
          }
        }
      }
LABEL_24:
      unint64_t v9 = (v15 - 1) & v15;
      unint64_t v13 = __clz(__rbit64(v15)) + (v10 << 6);
    }
    uint64_t v17 = (uint64_t *)(*(void *)(v4 + 48) + 16 * v13);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    char v20 = *(unsigned char *)(*(void *)(v4 + 56) + v13);
    sub_24D006F30();
    swift_bridgeObjectRetain();
    sub_24D006AB0();
    uint64_t result = sub_24D006F60();
    uint64_t v21 = -1 << *(unsigned char *)(v8 + 32);
    unint64_t v22 = result & ~v21;
    unint64_t v23 = v22 >> 6;
    if (((-1 << v22) & ~*(void *)(v11 + 8 * (v22 >> 6))) != 0)
    {
      unint64_t v24 = __clz(__rbit64((-1 << v22) & ~*(void *)(v11 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v21) >> 6;
      do
      {
        if (++v23 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        BOOL v27 = v23 == v26;
        if (v23 == v26) {
          unint64_t v23 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v11 + 8 * v23);
      }
      while (v28 == -1);
      unint64_t v24 = __clz(__rbit64(~v28)) + (v23 << 6);
    }
    *(void *)(v11 + ((v24 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v24;
    char v29 = (void *)(*(void *)(v8 + 48) + 16 * v24);
    *char v29 = v19;
    v29[1] = v18;
    *(unsigned char *)(*(void *)(v8 + 56) + v24) = v20;
    ++*(void *)(v8 + 16);
    if (__OFSUB__(v5--, 1)) {
      break;
    }
    if (!v5) {
      return v8;
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

uint64_t sub_24CFF0E38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  uint64_t result = sub_24D0067D0();
  uint64_t v11 = result;
  if (result)
  {
    uint64_t result = sub_24D0067F0();
    if (__OFSUB__(a1, result))
    {
LABEL_9:
      __break(1u);
      return result;
    }
    v11 += a1 - result;
  }
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_9;
  }
  sub_24D0067E0();
  sub_24CFEF794(v11, a4, a5, &v13);
  if (!v5) {
    char v12 = v13;
  }
  return v12 & 1;
}

uint64_t _s16DriverManagement21ApprovalDBEntrySourceO21__derived_enum_equalsySbAC_ACtFZ_0(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  if (a2 >> 60 == 15)
  {
    if (a4 >> 60 == 15) {
      return 1;
    }
  }
  else if (a4 >> 60 != 15)
  {
    uint64_t v9 = 0;
    switch(a2 >> 62)
    {
      case 1uLL:
        if (__OFSUB__(HIDWORD(a1), a1))
        {
          __break(1u);
LABEL_25:
          __break(1u);
LABEL_26:
          __break(1u);
LABEL_27:
          __break(1u);
          JUMPOUT(0x24CFF108CLL);
        }
        uint64_t v9 = HIDWORD(a1) - (int)a1;
LABEL_10:
        sub_24CFE7000(a1, a2);
LABEL_11:
        switch(a4 >> 62)
        {
          case 1uLL:
            LODWORD(v12) = HIDWORD(a3) - a3;
            if (__OFSUB__(HIDWORD(a3), a3)) {
              goto LABEL_26;
            }
            uint64_t v12 = (int)v12;
LABEL_16:
            if (v9 != v12)
            {
LABEL_21:
              sub_24CFF1620(a1, a2);
              return 0;
            }
            if (v9 < 1)
            {
LABEL_23:
              sub_24CFF1620(a1, a2);
              return 1;
            }
            sub_24CFE7000(a3, a4);
            char v16 = sub_24CFEFA08(a1, a2, a3, a4);
            sub_24CFF1620(a1, a2);
            if (v16) {
              return 1;
            }
            break;
          case 2uLL:
            uint64_t v14 = *(void *)(a3 + 16);
            uint64_t v13 = *(void *)(a3 + 24);
            BOOL v15 = __OFSUB__(v13, v14);
            uint64_t v12 = v13 - v14;
            if (!v15) {
              goto LABEL_16;
            }
            goto LABEL_27;
          case 3uLL:
            if (v9) {
              goto LABEL_21;
            }
            goto LABEL_23;
          default:
            uint64_t v12 = BYTE6(a4);
            goto LABEL_16;
        }
        break;
      case 2uLL:
        uint64_t v11 = *(void *)(a1 + 16);
        uint64_t v10 = *(void *)(a1 + 24);
        uint64_t v9 = v10 - v11;
        if (!__OFSUB__(v10, v11)) {
          goto LABEL_10;
        }
        goto LABEL_25;
      case 3uLL:
        goto LABEL_11;
      default:
        uint64_t v9 = BYTE6(a2);
        goto LABEL_11;
    }
  }
  return 0;
}

uint64_t _s16DriverManagement26ApprovalStateUpdateRequestC2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 32);
  unint64_t v5 = *(void *)(a1 + 40);
  int v6 = *(unsigned __int8 *)(a1 + 48);
  uint64_t v7 = *(void *)(a2 + 32);
  unint64_t v8 = *(void *)(a2 + 40);
  int v9 = *(unsigned __int8 *)(a2 + 48);
  BOOL v10 = *(void *)(a1 + 16) == *(void *)(a2 + 16) && *(void *)(a1 + 24) == *(void *)(a2 + 24);
  if (!v10 && (sub_24D006ED0() & 1) == 0
    || (_s16DriverManagement21ApprovalDBEntrySourceO21__derived_enum_equalsySbAC_ACtFZ_0(v4, v5, v7, v8) & 1) == 0
    || v6 != v9)
  {
    return 0;
  }
  uint64_t v11 = a1 + OBJC_IVAR____TtC16DriverManagement26ApprovalStateUpdateRequest_timestamp;
  uint64_t v12 = a2 + OBJC_IVAR____TtC16DriverManagement26ApprovalStateUpdateRequest_timestamp;

  return MEMORY[0x270EF0B88](v11, v12);
}

BOOL sub_24CFF1178(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  return *(unsigned __int8 *)(v3 + 16) == a3;
}

uint64_t sub_24CFF1188(uint64_t result, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t, uint64_t))
{
  unint64_t v22 = (unint64_t *)result;
  int64_t v6 = 0;
  uint64_t v24 = a3 + 64;
  uint64_t v7 = 1 << *(unsigned char *)(a3 + 32);
  uint64_t v8 = -1;
  if (v7 < 64) {
    uint64_t v8 = ~(-1 << v7);
  }
  unint64_t v9 = v8 & *(void *)(a3 + 64);
  int64_t v10 = (unint64_t)(v7 + 63) >> 6;
  while (1)
  {
    if (v9)
    {
      unint64_t v11 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      unint64_t v12 = v11 | (v6 << 6);
      goto LABEL_5;
    }
    int64_t v17 = v6 + 1;
    if (__OFADD__(v6, 1))
    {
      __break(1u);
      goto LABEL_26;
    }
    if (v17 >= v10) {
      return sub_24CFF0B90(v22, a2, v23, a3);
    }
    unint64_t v18 = *(void *)(v24 + 8 * v17);
    ++v6;
    if (!v18)
    {
      int64_t v6 = v17 + 1;
      if (v17 + 1 >= v10) {
        return sub_24CFF0B90(v22, a2, v23, a3);
      }
      unint64_t v18 = *(void *)(v24 + 8 * v6);
      if (!v18)
      {
        int64_t v6 = v17 + 2;
        if (v17 + 2 >= v10) {
          return sub_24CFF0B90(v22, a2, v23, a3);
        }
        unint64_t v18 = *(void *)(v24 + 8 * v6);
        if (!v18) {
          break;
        }
      }
    }
LABEL_20:
    unint64_t v9 = (v18 - 1) & v18;
    unint64_t v12 = __clz(__rbit64(v18)) + (v6 << 6);
LABEL_5:
    uint64_t v13 = (uint64_t *)(*(void *)(a3 + 48) + 16 * v12);
    uint64_t v14 = *v13;
    uint64_t v15 = v13[1];
    uint64_t v16 = *(unsigned __int8 *)(*(void *)(a3 + 56) + v12);
    swift_bridgeObjectRetain();
    LOBYTE(v16) = a4(v14, v15, v16);
    uint64_t result = swift_bridgeObjectRelease();
    if (v16)
    {
      *(unint64_t *)((char *)v22 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      if (__OFADD__(v23++, 1))
      {
        __break(1u);
        return sub_24CFF0B90(v22, a2, v23, a3);
      }
    }
  }
  int64_t v19 = v17 + 3;
  if (v19 >= v10) {
    return sub_24CFF0B90(v22, a2, v23, a3);
  }
  unint64_t v18 = *(void *)(v24 + 8 * v19);
  if (v18)
  {
    int64_t v6 = v19;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v6 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v6 >= v10) {
      return sub_24CFF0B90(v22, a2, v23, a3);
    }
    unint64_t v18 = *(void *)(v24 + 8 * v6);
    ++v19;
    if (v18) {
      goto LABEL_20;
    }
  }
LABEL_26:
  __break(1u);
  return result;
}

uint64_t sub_24CFF1368(uint64_t isStackAllocationSafe, uint64_t (*a2)(uint64_t, uint64_t, uint64_t), uint64_t a3)
{
  uint64_t v6 = isStackAllocationSafe;
  v13[1] = *MEMORY[0x263EF8340];
  char v7 = *(unsigned char *)(isStackAllocationSafe + 32);
  unint64_t v8 = (unint64_t)((1 << v7) + 63) >> 6;
  size_t v9 = 8 * v8;
  if ((v7 & 0x3Fu) <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x270FA5388](isStackAllocationSafe);
    bzero((char *)v13 - ((v9 + 15) & 0x3FFFFFFFFFFFFFF0), v9);
    uint64_t v10 = sub_24CFF1188((uint64_t)v13 - ((v9 + 15) & 0x3FFFFFFFFFFFFFF0), v8, v6, a2);
    if (v3) {
      swift_willThrow();
    }
    else {
      return v10;
    }
  }
  else
  {
    unint64_t v11 = (void *)swift_slowAlloc();
    bzero(v11, v9);
    a3 = sub_24CFF1188((uint64_t)v11, v8, v6, a2);
    MEMORY[0x25331B630](v11, -1, -1);
  }
  return a3;
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_24CFF1524()
{
  unint64_t result = qword_26B182F70;
  if (!qword_26B182F70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B182F70);
  }
  return result;
}

unint64_t sub_24CFF1578()
{
  unint64_t result = qword_26984D2A0;
  if (!qword_26984D2A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26984D2A0);
  }
  return result;
}

unint64_t sub_24CFF15CC()
{
  unint64_t result = qword_26984D2A8;
  if (!qword_26984D2A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26984D2A8);
  }
  return result;
}

uint64_t sub_24CFF1620(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_24CFE71CC(a1, a2);
  }
  return a1;
}

unint64_t sub_24CFF1634()
{
  unint64_t result = qword_26B182F88;
  if (!qword_26B182F88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B182F88);
  }
  return result;
}

uint64_t _s16DriverManagement10ApprovalDBV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3 == *(void *)(a3 + 16))
  {
    if (!v3) {
      return 1;
    }
    for (i = (unsigned __int8 *)(swift_bridgeObjectRetain() + 64); ; i += 40)
    {
      uint64_t v6 = *((void *)i - 2);
      unint64_t v7 = *((void *)i - 1);
      int v8 = *i;
      uint64_t v9 = *((void *)i - 4);
      uint64_t v10 = *((void *)i - 3);
      swift_bridgeObjectRetain();
      sub_24CFF1EAC(v6, v7);
      unsigned __int8 v11 = sub_24CFEBA28(v9, v10, v6, v7, a3);
      swift_bridgeObjectRelease();
      if (v11 == 3)
      {
        swift_bridgeObjectRelease();
        sub_24CFF1620(v6, v7);
        return 0;
      }
      sub_24CFF1620(v6, v7);
      if (v8 != v11) {
        break;
      }
      if (!--v3)
      {
        swift_bridgeObjectRelease();
        return 1;
      }
    }
    swift_bridgeObjectRelease();
  }
  return 0;
}

BOOL _s16DriverManagement26ApprovalSettingsStateEntryV23__derived_struct_equalsySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  if (*(void *)a1 != *(void *)a2 || *(void *)(a1 + 8) != *(void *)(a2 + 8))
  {
    char v5 = sub_24D006ED0();
    BOOL result = 0;
    if ((v5 & 1) == 0) {
      return result;
    }
  }
  uint64_t v7 = *(void *)(a1 + 24);
  uint64_t v8 = *(void *)(a2 + 24);
  if (!v7)
  {
    if (v8) {
      return 0;
    }
    goto LABEL_15;
  }
  if (!v8) {
    return 0;
  }
  BOOL v9 = *(void *)(a1 + 16) == *(void *)(a2 + 16) && v7 == v8;
  if (v9 || (v10 = sub_24D006ED0(), BOOL result = 0, (v10 & 1) != 0))
  {
LABEL_15:
    uint64_t v11 = *(void *)(a1 + 40);
    uint64_t v12 = *(void *)(a2 + 40);
    if (v11)
    {
      if (v12)
      {
        if (*(void *)(a1 + 32) != *(void *)(a2 + 32) || v11 != v12)
        {
          char v13 = sub_24D006ED0();
          BOOL result = 0;
          if ((v13 & 1) == 0) {
            return result;
          }
        }
        goto LABEL_22;
      }
    }
    else if (!v12)
    {
LABEL_22:
      if (_s16DriverManagement21ApprovalDBEntrySourceO21__derived_enum_equalsySbAC_ACtFZ_0(*(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a2 + 48), *(void *)(a2 + 56)))return *(unsigned __int8 *)(a1 + 64) == *(unsigned __int8 *)(a2 + 64); {
    }
      }
    return 0;
  }
  return result;
}

uint64_t sub_24CFF1888(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x7261507473726966 && a2 == 0xEA00000000007974;
  if (v2 || (sub_24D006ED0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x7261506472696874 && a2 == 0xEA00000000007974)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_24D006ED0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_24CFF1994(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD00000000000001BLL && a2 == 0x800000024D00A6C0)
  {
    swift_bridgeObjectRelease();
    char v2 = 0;
  }
  else
  {
    char v3 = sub_24D006ED0();
    swift_bridgeObjectRelease();
    char v2 = v3 ^ 1;
  }
  return v2 & 1;
}

void *sub_24CFF1A1C(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B183008);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v23 = v2;
  uint64_t v24 = v3;
  MEMORY[0x270FA5388](v2);
  char v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B183000);
  uint64_t v25 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B182FF8);
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = a1[3];
  unint64_t v26 = a1;
  uint64_t v14 = __swift_project_boxed_opaque_existential_1(a1, v13);
  sub_24CFF1524();
  uint64_t v15 = v28;
  sub_24D006F70();
  if (!v15)
  {
    uint64_t v16 = v25;
    uint64_t v28 = v10;
    uint64_t v14 = v12;
    uint64_t v17 = sub_24D006E50();
    if (*(void *)(v17 + 16) == 1)
    {
      if (*(unsigned char *)(v17 + 32))
      {
        LOBYTE(v27) = 1;
        sub_24CFF1578();
        sub_24D006DF0();
        sub_24CFF5410();
        uint64_t v18 = v23;
        sub_24D006E40();
        (*(void (**)(char *, uint64_t))(v24 + 8))(v5, v18);
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v28 + 8))(v12, v9);
        uint64_t v14 = v27;
      }
      else
      {
        LOBYTE(v27) = 0;
        sub_24CFF1634();
        sub_24D006DF0();
        (*(void (**)(char *, uint64_t))(v16 + 8))(v8, v6);
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v28 + 8))(v12, v9);
        uint64_t v14 = 0;
      }
    }
    else
    {
      uint64_t v19 = sub_24D006D10();
      swift_allocError();
      uint64_t v21 = v20;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26984D3F0);
      *uint64_t v21 = &type metadata for ApprovalDBEntrySource;
      sub_24D006E00();
      sub_24D006D00();
      (*(void (**)(void *, void, uint64_t))(*(void *)(v19 - 8) + 104))(v21, *MEMORY[0x263F8DCB0], v19);
      swift_willThrow();
      swift_bridgeObjectRelease();
      (*(void (**)(void *, uint64_t))(v28 + 8))(v14, v9);
    }
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
  return v14;
}

uint64_t sub_24CFF1E80(uint64_t a1)
{
  return a1;
}

uint64_t sub_24CFF1EAC(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_24CFE7000(a1, a2);
  }
  return a1;
}

unint64_t sub_24CFF1EC0()
{
  unint64_t result = qword_26984D2B8;
  if (!qword_26984D2B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26984D2B8);
  }
  return result;
}

_OWORD *sub_24CFF1F14(_OWORD *a1, _OWORD *a2)
{
  *a2 = *a1;
  return a2;
}

unint64_t sub_24CFF1F24()
{
  unint64_t result = qword_26984D2C0;
  if (!qword_26984D2C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26984D2C0);
  }
  return result;
}

unint64_t sub_24CFF1F78()
{
  unint64_t result = qword_26984D2C8;
  if (!qword_26984D2C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26984D2C8);
  }
  return result;
}

uint64_t sub_24CFF1FCC(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000010 && a2 == 0x800000024D00A6E0 || (sub_24D006ED0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x656372756F73 && a2 == 0xE600000000000000 || (sub_24D006ED0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6C61766F72707061 && a2 == 0xED00006574617453)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v5 = sub_24D006ED0();
    swift_bridgeObjectRelease();
    if (v5) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_24CFF213C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26984D3E8);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24CFF1EC0();
  sub_24D006F70();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  LOBYTE(v20) = 0;
  uint64_t v9 = sub_24D006E20();
  uint64_t v11 = v10;
  uint64_t v19 = v9;
  char v22 = 1;
  sub_24CFF50E4();
  swift_bridgeObjectRetain();
  sub_24D006E40();
  char v22 = 2;
  unint64_t v17 = v21;
  uint64_t v18 = v20;
  sub_24CFF1EAC(v20, v21);
  sub_24CFF5138();
  sub_24D006E40();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  char v12 = v20;
  swift_bridgeObjectRetain();
  unint64_t v14 = v17;
  uint64_t v13 = v18;
  sub_24CFF1EAC(v18, v17);
  sub_24CFF1620(v13, v14);
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  uint64_t result = sub_24CFF1620(v13, v14);
  *(void *)a2 = v19;
  *(void *)(a2 + 8) = v11;
  *(void *)(a2 + 16) = v13;
  *(void *)(a2 + 24) = v14;
  *(unsigned char *)(a2 + 32) = v12;
  return result;
}

unint64_t sub_24CFF241C()
{
  unint64_t result = qword_26984D2D8;
  if (!qword_26984D2D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26984D2D8);
  }
  return result;
}

unint64_t sub_24CFF2470()
{
  unint64_t result = qword_26984D2E0;
  if (!qword_26984D2E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26984D2E0);
  }
  return result;
}

void *sub_24CFF24C4(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26984D3C0);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24CFF4F40();
  sub_24D006F70();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26984D3A8);
    sub_24CFF52FC(&qword_26984D3C8, &qword_26984D3A8, (void (*)(void))sub_24CFF5038);
    sub_24D006E40();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    uint64_t v7 = (void *)v9[1];
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  return v7;
}

uint64_t sub_24CFF2674(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 12406 && a2 == 0xE200000000000000;
  if (v2 || (sub_24D006ED0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6E6F6973726576 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_24D006ED0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_24CFF2750(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26984D3D8);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  char v6 = &v9[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = a1[3];
  __swift_project_boxed_opaque_existential_1(a1, v7);
  sub_24CFF241C();
  sub_24D006F70();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    v9[7] = 0;
    sub_24CFF53BC();
    sub_24D006E40();
    uint64_t v7 = v10;
    v9[6] = 1;
    swift_bridgeObjectRetain();
    sub_24D006E30();
    (*(void (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    swift_bridgeObjectRelease();
  }
  return v7;
}

unint64_t sub_24CFF2934()
{
  unint64_t result = qword_26B1830D0;
  if (!qword_26B1830D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1830D0);
  }
  return result;
}

unint64_t sub_24CFF2988()
{
  unint64_t result = qword_26984D2F8;
  if (!qword_26984D2F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26984D2F8);
  }
  return result;
}

void *sub_24CFF29DC(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B183198);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  char v6 = (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24CFF2934();
  sub_24D006F70();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B183168);
    sub_24CFF52FC(&qword_26B183170, &qword_26B183168, (void (*)(void))sub_24CFF5368);
    sub_24D006E40();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    uint64_t v7 = (void *)v9[1];
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  return v7;
}

uint64_t sub_24CFF2B8C()
{
  return swift_release();
}

void sub_24CFF2B94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unint64_t a9)
{
  if (a3)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_24CFF1620(a8, a9);
  }
}

uint64_t sub_24CFF2C00(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B182FD8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_24CFF2C68()
{
  unint64_t result = qword_26B182FB8;
  if (!qword_26B182FB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B182FB8);
  }
  return result;
}

uint64_t sub_24CFF2CBC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 32 * a1 + 32;
    unint64_t v6 = a3 + 32 * v4;
    if (v5 >= v6 || v5 + 32 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_24D006DE0();
  __break(1u);
  return result;
}

uint64_t sub_24CFF2DB0(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000010 && a2 == 0x800000024D00A6E0 || (sub_24D006ED0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x4E79616C70736964 && a2 == 0xEB00000000656D61 || (sub_24D006ED0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x7865546567617375 && a2 == 0xE900000000000074 || (sub_24D006ED0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x656372756F73 && a2 == 0xE600000000000000 || (sub_24D006ED0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x6C61766F72707061 && a2 == 0xED00006574617453)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    char v5 = sub_24D006ED0();
    swift_bridgeObjectRelease();
    if (v5) {
      return 4;
    }
    else {
      return 5;
    }
  }
}

uint64_t sub_24CFF300C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B183010);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24CFF2C68();
  sub_24D006F70();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  LOBYTE(v31) = 0;
  uint64_t v9 = sub_24D006E20();
  uint64_t v11 = v10;
  uint64_t v29 = v9;
  LOBYTE(v31) = 1;
  swift_bridgeObjectRetain();
  uint64_t v12 = sub_24D006E10();
  uint64_t v30 = v13;
  uint64_t v26 = v12;
  LOBYTE(v31) = 2;
  swift_bridgeObjectRetain();
  uint64_t v28 = 0;
  uint64_t v25 = sub_24D006E10();
  char v33 = 3;
  uint64_t v15 = v14;
  sub_24CFF50E4();
  swift_bridgeObjectRetain();
  sub_24D006E40();
  uint64_t v27 = v15;
  uint64_t v16 = v31;
  char v33 = 4;
  unint64_t v24 = v32;
  sub_24CFF1EAC(v31, v32);
  sub_24CFF5138();
  sub_24D006E40();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  char v17 = v31;
  swift_bridgeObjectRetain();
  uint64_t v18 = v16;
  uint64_t v19 = v30;
  swift_bridgeObjectRetain();
  uint64_t v20 = v27;
  swift_bridgeObjectRetain();
  unint64_t v21 = v24;
  sub_24CFF1EAC(v18, v24);
  sub_24CFF1620(v18, v21);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t result = sub_24CFF1620(v18, v21);
  *(void *)a2 = v29;
  *(void *)(a2 + 8) = v11;
  *(void *)(a2 + 16) = v26;
  *(void *)(a2 + 24) = v19;
  *(void *)(a2 + 32) = v25;
  *(void *)(a2 + 40) = v20;
  *(void *)(a2 + 48) = v18;
  *(void *)(a2 + 56) = v21;
  *(unsigned char *)(a2 + 64) = v17;
  return result;
}

unint64_t sub_24CFF346C()
{
  unint64_t result = qword_26984D308;
  if (!qword_26984D308)
  {
    sub_24D0068E0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26984D308);
  }
  return result;
}

uint64_t sub_24CFF34C4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  unint64_t v3 = *(void *)(a1 + 24);
  swift_bridgeObjectRetain();
  sub_24CFF1EAC(v2, v3);
  return a1;
}

uint64_t sub_24CFF3508(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  unint64_t v3 = *(void *)(a1 + 24);
  swift_bridgeObjectRelease();
  sub_24CFF1620(v2, v3);
  return a1;
}

unint64_t sub_24CFF3550()
{
  unint64_t result = qword_26984D310;
  if (!qword_26984D310)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26984D310);
  }
  return result;
}

uint64_t sub_24CFF35A4()
{
  return sub_24CFF35E0(&qword_26984D318, &qword_26984D320);
}

uint64_t sub_24CFF35E0(unint64_t *a1, uint64_t *a2)
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

unint64_t sub_24CFF3628()
{
  unint64_t result = qword_26984D328;
  if (!qword_26984D328)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26984D328);
  }
  return result;
}

unint64_t sub_24CFF3680()
{
  unint64_t result = qword_26B183108;
  if (!qword_26B183108)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B183108);
  }
  return result;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t sub_24CFF36EC(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_24CFF36F4(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for ApprovalState()
{
  return &type metadata for ApprovalState;
}

uint64_t *destroy for ApprovalDBEntrySource(uint64_t *result)
{
  unint64_t v1 = result[1];
  if ((v1 & 0x3000000000000000) == 0) {
    return (uint64_t *)sub_24CFE71CC(*result, v1);
  }
  return result;
}

uint64_t _s16DriverManagement21ApprovalDBEntrySourceOwCP_0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = a2[1];
  if ((v3 & 0x3000000000000000) != 0)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  else
  {
    uint64_t v4 = *a2;
    sub_24CFE7000(*a2, a2[1]);
    *(void *)a1 = v4;
    *(void *)(a1 + 8) = v3;
  }
  return a1;
}

uint64_t *assignWithCopy for ApprovalDBEntrySource(uint64_t *a1, uint64_t *a2)
{
  unint64_t v4 = a1[1];
  unint64_t v5 = a2[1];
  uint64_t v6 = v5 & 0x3000000000000000;
  if ((v4 & 0x3000000000000000) == 0)
  {
    if (!v6)
    {
      uint64_t v9 = *a2;
      sub_24CFE7000(v9, v5);
      uint64_t v10 = *a1;
      unint64_t v11 = a1[1];
      *a1 = v9;
      a1[1] = v5;
      sub_24CFE71CC(v10, v11);
      return a1;
    }
    sub_24CFE71CC(*a1, v4);
    goto LABEL_6;
  }
  if (v6)
  {
LABEL_6:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  uint64_t v7 = *a2;
  sub_24CFE7000(v7, v5);
  *a1 = v7;
  a1[1] = v5;
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t *assignWithTake for ApprovalDBEntrySource(uint64_t *a1, uint64_t *a2)
{
  unint64_t v4 = a1[1];
  if ((v4 & 0x3000000000000000) == 0)
  {
    uint64_t v5 = a2[1];
    if ((v5 & 0x3000000000000000) == 0)
    {
      uint64_t v7 = *a1;
      *a1 = *a2;
      a1[1] = v5;
      sub_24CFE71CC(v7, v4);
      return a1;
    }
    sub_24CFE71CC(*a1, v4);
  }
  *(_OWORD *)a1 = *(_OWORD *)a2;
  return a1;
}

uint64_t getEnumTagSinglePayload for ApprovalDBEntrySource(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xC && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 12);
  }
  unsigned int v3 = (((*(void *)(a1 + 8) >> 60) >> 2) & 0xFFFFFFF3 | (4 * ((*(void *)(a1 + 8) >> 60) & 3))) ^ 0xF;
  if (v3 >= 0xC) {
    unsigned int v3 = -1;
  }
  if (v3 + 1 >= 2) {
    return v3;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for ApprovalDBEntrySource(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xB)
  {
    *(void *)__n128 result = 0;
    *(void *)(result + 8) = 0;
    *(_DWORD *)__n128 result = a2 - 12;
    if (a3 >= 0xC) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0xC) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2)
    {
      *(void *)__n128 result = 0;
      *(void *)(result + 8) = (unint64_t)((4 * (a2 ^ 0xF)) | ((a2 ^ 0xF) >> 2)) << 60;
    }
  }
  return result;
}

uint64_t sub_24CFF3928(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 8) >> 60;
  if (((4 * v1) & 0xC) != 0) {
    return 16 - ((4 * v1) & 0xC | (v1 >> 2));
  }
  else {
    return 0;
  }
}

void *sub_24CFF3950(void *result, unsigned int a2)
{
  if (a2 > 0xC)
  {
    *__n128 result = a2 - 13;
    result[1] = 0;
  }
  else if (a2)
  {
    *__n128 result = 0;
    result[1] = (unint64_t)(((-a2 >> 2) & 3) - 4 * a2) << 60;
  }
  return result;
}

ValueMetadata *type metadata accessor for ApprovalDBEntrySource()
{
  return &type metadata for ApprovalDBEntrySource;
}

uint64_t initializeBufferWithCopyOfBuffer for ApprovalDBEntry(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for ApprovalDBEntry(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  unint64_t v3 = *(void *)(a1 + 24);
  if (v3 >> 60 != 15)
  {
    uint64_t v4 = *(void *)(a1 + 16);
    return sub_24CFE71CC(v4, v3);
  }
  return result;
}

uint64_t initializeWithCopy for ApprovalDBEntry(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  uint64_t v5 = (_OWORD *)(a2 + 16);
  unint64_t v6 = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  if (v6 >> 60 == 15)
  {
    *(_OWORD *)(a1 + 16) = *v5;
  }
  else
  {
    uint64_t v7 = *(void *)v5;
    sub_24CFE7000(v7, v6);
    *(void *)(a1 + 16) = v7;
    *(void *)(a1 + 24) = v6;
  }
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  return a1;
}

uint64_t assignWithCopy for ApprovalDBEntry(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = (uint64_t *)(a2 + 16);
  unint64_t v5 = *(void *)(a2 + 24);
  if (*(void *)(a1 + 24) >> 60 != 15)
  {
    if (v5 >> 60 != 15)
    {
      uint64_t v7 = *v4;
      sub_24CFE7000(*v4, *(void *)(a2 + 24));
      uint64_t v8 = *(void *)(a1 + 16);
      unint64_t v9 = *(void *)(a1 + 24);
      *(void *)(a1 + 16) = v7;
      *(void *)(a1 + 24) = v5;
      sub_24CFE71CC(v8, v9);
      goto LABEL_8;
    }
    sub_24CFF3B74(a1 + 16);
    goto LABEL_6;
  }
  if (v5 >> 60 == 15)
  {
LABEL_6:
    *(_OWORD *)(a1 + 16) = *(_OWORD *)v4;
    goto LABEL_8;
  }
  uint64_t v6 = *v4;
  sub_24CFE7000(*v4, *(void *)(a2 + 24));
  *(void *)(a1 + 16) = v6;
  *(void *)(a1 + 24) = v5;
LABEL_8:
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  return a1;
}

uint64_t sub_24CFF3B74(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26984D330);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
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

uint64_t assignWithTake for ApprovalDBEntry(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  unint64_t v5 = (void *)(a2 + 16);
  unint64_t v6 = *(void *)(a1 + 24);
  if (v6 >> 60 != 15)
  {
    unint64_t v7 = *(void *)(a2 + 24);
    if (v7 >> 60 != 15)
    {
      uint64_t v8 = *(void *)(a1 + 16);
      *(void *)(a1 + 16) = *v5;
      *(void *)(a1 + 24) = v7;
      sub_24CFE71CC(v8, v6);
      goto LABEL_6;
    }
    sub_24CFF3B74(a1 + 16);
  }
  *(_OWORD *)(a1 + 16) = *(_OWORD *)v5;
LABEL_6:
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for ApprovalDBEntry(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for ApprovalDBEntry(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for ApprovalDBEntry()
{
  return &type metadata for ApprovalDBEntry;
}

void *initializeBufferWithCopyOfBuffer for ApprovalDB(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for ApprovalDB()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for ApprovalDB(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  return a1;
}

void *assignWithTake for ApprovalDB(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  return a1;
}

uint64_t getEnumTagSinglePayload for ApprovalDB(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for ApprovalDB(uint64_t result, int a2, int a3)
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ApprovalDB()
{
  return &type metadata for ApprovalDB;
}

ValueMetadata *type metadata accessor for ApprovalSettingsState()
{
  return &type metadata for ApprovalSettingsState;
}

uint64_t destroy for ApprovalSettingsStateEntry(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  unint64_t v3 = *(void *)(a1 + 56);
  if (v3 >> 60 != 15)
  {
    uint64_t v4 = *(void *)(a1 + 48);
    return sub_24CFE71CC(v4, v3);
  }
  return result;
}

uint64_t initializeWithCopy for ApprovalSettingsStateEntry(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  uint64_t v6 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v6;
  unint64_t v7 = (uint64_t *)(a2 + 48);
  unint64_t v8 = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v8 >> 60 == 15)
  {
    *(_OWORD *)(a1 + 48) = *(_OWORD *)v7;
  }
  else
  {
    uint64_t v9 = *v7;
    sub_24CFE7000(*v7, v8);
    *(void *)(a1 + 48) = v9;
    *(void *)(a1 + 56) = v8;
  }
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  return a1;
}

uint64_t assignWithCopy for ApprovalSettingsStateEntry(uint64_t a1, uint64_t a2)
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
  uint64_t v4 = (uint64_t *)(a2 + 48);
  unint64_t v5 = *(void *)(a2 + 56);
  if (*(void *)(a1 + 56) >> 60 != 15)
  {
    if (v5 >> 60 != 15)
    {
      uint64_t v7 = *v4;
      sub_24CFE7000(*v4, *(void *)(a2 + 56));
      uint64_t v8 = *(void *)(a1 + 48);
      unint64_t v9 = *(void *)(a1 + 56);
      *(void *)(a1 + 48) = v7;
      *(void *)(a1 + 56) = v5;
      sub_24CFE71CC(v8, v9);
      goto LABEL_8;
    }
    sub_24CFF3B74(a1 + 48);
    goto LABEL_6;
  }
  if (v5 >> 60 == 15)
  {
LABEL_6:
    *(_OWORD *)(a1 + 48) = *(_OWORD *)v4;
    goto LABEL_8;
  }
  uint64_t v6 = *v4;
  sub_24CFE7000(*v4, *(void *)(a2 + 56));
  *(void *)(a1 + 48) = v6;
  *(void *)(a1 + 56) = v5;
LABEL_8:
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  return a1;
}

__n128 __swift_memcpy65_8(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __n128 result = *(__n128 *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t assignWithTake for ApprovalSettingsStateEntry(uint64_t a1, uint64_t a2)
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
  uint64_t v7 = (void *)(a2 + 48);
  unint64_t v8 = *(void *)(a1 + 56);
  if (v8 >> 60 != 15)
  {
    unint64_t v9 = *(void *)(a2 + 56);
    if (v9 >> 60 != 15)
    {
      uint64_t v10 = *(void *)(a1 + 48);
      *(void *)(a1 + 48) = *v7;
      *(void *)(a1 + 56) = v9;
      sub_24CFE71CC(v10, v8);
      goto LABEL_6;
    }
    sub_24CFF3B74(a1 + 48);
  }
  *(_OWORD *)(a1 + 48) = *(_OWORD *)v7;
LABEL_6:
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  return a1;
}

uint64_t getEnumTagSinglePayload for ApprovalSettingsStateEntry(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 65)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ApprovalSettingsStateEntry(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 64) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 65) = 1;
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
    *(unsigned char *)(result + 65) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ApprovalSettingsStateEntry()
{
  return &type metadata for ApprovalSettingsStateEntry;
}

uint64_t sub_24CFF4230()
{
  return type metadata accessor for ApprovalStateUpdateRequest();
}

uint64_t type metadata accessor for ApprovalStateUpdateRequest()
{
  uint64_t result = qword_26984D338;
  if (!qword_26984D338) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24CFF4284()
{
  uint64_t result = sub_24D0068E0();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t getEnumTagSinglePayload for ApprovalSettingsStateEntry.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for ApprovalSettingsStateEntry.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24CFF4488);
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

ValueMetadata *type metadata accessor for ApprovalSettingsStateEntry.CodingKeys()
{
  return &type metadata for ApprovalSettingsStateEntry.CodingKeys;
}

uint64_t sub_24CFF44CC()
{
  return 0;
}

ValueMetadata *type metadata accessor for ApprovalSettingsState.CodingKeys()
{
  return &type metadata for ApprovalSettingsState.CodingKeys;
}

ValueMetadata *type metadata accessor for ApprovalDB.V0()
{
  return &type metadata for ApprovalDB.V0;
}

unsigned char *sub_24CFF44FC(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for ApprovalDB.CodingKeys()
{
  return &type metadata for ApprovalDB.CodingKeys;
}

uint64_t _s16DriverManagement13ApprovalStateOwet_0(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s16DriverManagement13ApprovalStateOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24CFF4674);
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

ValueMetadata *type metadata accessor for ApprovalDBEntry.CodingKeys()
{
  return &type metadata for ApprovalDBEntry.CodingKeys;
}

uint64_t _s16DriverManagement10ApprovalDBV10CodingKeysOwet_0(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s16DriverManagement10ApprovalDBV10CodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24CFF4808);
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

ValueMetadata *type metadata accessor for ApprovalDBEntrySource.CodingKeys()
{
  return &type metadata for ApprovalDBEntrySource.CodingKeys;
}

ValueMetadata *type metadata accessor for ApprovalDBEntrySource.FirstPartyCodingKeys()
{
  return &type metadata for ApprovalDBEntrySource.FirstPartyCodingKeys;
}

ValueMetadata *type metadata accessor for ApprovalDBEntrySource.ThirdPartyCodingKeys()
{
  return &type metadata for ApprovalDBEntrySource.ThirdPartyCodingKeys;
}

unint64_t sub_24CFF4864()
{
  unint64_t result = qword_26984D348;
  if (!qword_26984D348)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26984D348);
  }
  return result;
}

unint64_t sub_24CFF48BC()
{
  unint64_t result = qword_26984D350;
  if (!qword_26984D350)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26984D350);
  }
  return result;
}

unint64_t sub_24CFF4914()
{
  unint64_t result = qword_26984D358;
  if (!qword_26984D358)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26984D358);
  }
  return result;
}

unint64_t sub_24CFF496C()
{
  unint64_t result = qword_26984D360;
  if (!qword_26984D360)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26984D360);
  }
  return result;
}

unint64_t sub_24CFF49C4()
{
  unint64_t result = qword_26984D368;
  if (!qword_26984D368)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26984D368);
  }
  return result;
}

unint64_t sub_24CFF4A1C()
{
  unint64_t result = qword_26984D370;
  if (!qword_26984D370)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26984D370);
  }
  return result;
}

unint64_t sub_24CFF4A74()
{
  unint64_t result = qword_26B182FC8;
  if (!qword_26B182FC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B182FC8);
  }
  return result;
}

unint64_t sub_24CFF4ACC()
{
  unint64_t result = qword_26B182FC0;
  if (!qword_26B182FC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B182FC0);
  }
  return result;
}

unint64_t sub_24CFF4B24()
{
  unint64_t result = qword_26B1830E0;
  if (!qword_26B1830E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1830E0);
  }
  return result;
}

unint64_t sub_24CFF4B7C()
{
  unint64_t result = qword_26B1830D8;
  if (!qword_26B1830D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1830D8);
  }
  return result;
}

unint64_t sub_24CFF4BD4()
{
  unint64_t result = qword_26984D378;
  if (!qword_26984D378)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26984D378);
  }
  return result;
}

unint64_t sub_24CFF4C2C()
{
  unint64_t result = qword_26984D380;
  if (!qword_26984D380)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26984D380);
  }
  return result;
}

unint64_t sub_24CFF4C84()
{
  unint64_t result = qword_26984D388;
  if (!qword_26984D388)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26984D388);
  }
  return result;
}

unint64_t sub_24CFF4CDC()
{
  unint64_t result = qword_26984D390;
  if (!qword_26984D390)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26984D390);
  }
  return result;
}

unint64_t sub_24CFF4D34()
{
  unint64_t result = qword_26B182F98;
  if (!qword_26B182F98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B182F98);
  }
  return result;
}

unint64_t sub_24CFF4D8C()
{
  unint64_t result = qword_26B182F90;
  if (!qword_26B182F90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B182F90);
  }
  return result;
}

unint64_t sub_24CFF4DE4()
{
  unint64_t result = qword_26B182FA8;
  if (!qword_26B182FA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B182FA8);
  }
  return result;
}

unint64_t sub_24CFF4E3C()
{
  unint64_t result = qword_26B182FA0;
  if (!qword_26B182FA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B182FA0);
  }
  return result;
}

unint64_t sub_24CFF4E94()
{
  unint64_t result = qword_26B182F80;
  if (!qword_26B182F80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B182F80);
  }
  return result;
}

unint64_t sub_24CFF4EEC()
{
  unint64_t result = qword_26B182F78;
  if (!qword_26B182F78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B182F78);
  }
  return result;
}

unint64_t sub_24CFF4F40()
{
  unint64_t result = qword_26984D3A0;
  if (!qword_26984D3A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26984D3A0);
  }
  return result;
}

unint64_t sub_24CFF4F94()
{
  unint64_t result = qword_26984D3B8;
  if (!qword_26984D3B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26984D3B8);
  }
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

unint64_t sub_24CFF5038()
{
  unint64_t result = qword_26984D3D0;
  if (!qword_26984D3D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26984D3D0);
  }
  return result;
}

unint64_t sub_24CFF5090()
{
  unint64_t result = qword_26B182F60;
  if (!qword_26B182F60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B182F60);
  }
  return result;
}

unint64_t sub_24CFF50E4()
{
  unint64_t result = qword_26B182FB0;
  if (!qword_26B182FB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B182FB0);
  }
  return result;
}

unint64_t sub_24CFF5138()
{
  unint64_t result = qword_26B182F68;
  if (!qword_26B182F68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B182F68);
  }
  return result;
}

uint64_t sub_24CFF518C()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_24CFF51C4()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_24CFF51D4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  unint64_t v3 = *(void *)(a1 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_24CFF1EAC(v2, v3);
  return a1;
}

uint64_t sub_24CFF5238(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  unint64_t v3 = *(void *)(a1 + 56);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_24CFF1620(v2, v3);
  return a1;
}

uint64_t sub_24CFF529C(uint64_t a1)
{
  return a1;
}

uint64_t sub_24CFF52CC(uint64_t a1)
{
  return a1;
}

uint64_t sub_24CFF52FC(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_24CFF5368()
{
  unint64_t result = qword_26B183110;
  if (!qword_26B183110)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B183110);
  }
  return result;
}

unint64_t sub_24CFF53BC()
{
  unint64_t result = qword_26984D3E0;
  if (!qword_26984D3E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26984D3E0);
  }
  return result;
}

unint64_t sub_24CFF5410()
{
  unint64_t result = qword_26984D3F8;
  if (!qword_26984D3F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26984D3F8);
  }
  return result;
}

uint64_t _s16DriverManagement21ApprovalSettingsStateV10CodingKeysOwet_0(unsigned int *a1, int a2)
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

unsigned char *_s16DriverManagement21ApprovalSettingsStateV10CodingKeysOwst_0(unsigned char *result, int a2, int a3)
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
        *unint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)unint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)unint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *unint64_t result = 0;
      break;
    case 2:
      *(_WORD *)unint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x24CFF5550);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for ApprovalDB.V0.CodingKeys()
{
  return &type metadata for ApprovalDB.V0.CodingKeys;
}

uint64_t sub_24CFF558C()
{
  return swift_bridgeObjectRetain();
}

uint64_t destroy for ApprovalsError()
{
  return sub_24CFF55A4();
}

uint64_t sub_24CFF55A4()
{
  return swift_bridgeObjectRelease();
}

uint64_t _s16DriverManagement14ApprovalsErrorOwCP_0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  char v5 = *((unsigned char *)a2 + 16);
  sub_24CFF558C();
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for ApprovalsError(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  char v5 = *((unsigned char *)a2 + 16);
  sub_24CFF558C();
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  sub_24CFF55A4();
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for ApprovalsError(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = v3;
  sub_24CFF55A4();
  return a1;
}

uint64_t getEnumTagSinglePayload for ApprovalsError(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 1) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ApprovalsError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 255;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_24CFF5738(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_24CFF5740(uint64_t result, char a2)
{
  *(unsigned char *)(result + 16) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for ApprovalsError()
{
  return &type metadata for ApprovalsError;
}

unint64_t sub_24CFF5760()
{
  unint64_t result = qword_26984D400;
  if (!qword_26984D400)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26984D400);
  }
  return result;
}

unint64_t sub_24CFF57B8()
{
  unint64_t result = qword_26984D408;
  if (!qword_26984D408)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26984D408);
  }
  return result;
}

unint64_t sub_24CFF5810()
{
  unint64_t result = qword_26984D410;
  if (!qword_26984D410)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26984D410);
  }
  return result;
}

uint64_t property wrapper backing initializer of DriverManager.driverApprovalStates()
{
  return sub_24D006970();
}

uint64_t sub_24CFF58D4()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24D0069B0();
  swift_release();
  swift_release();
  return v1;
}

id sub_24CFF5948()
{
  id result = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for DriverManager()), sel_init);
  static DriverManager.shared = (uint64_t)result;
  return result;
}

uint64_t *DriverManager.shared.unsafeMutableAddressor()
{
  if (qword_26B183078 != -1) {
    swift_once();
  }
  return &static DriverManager.shared;
}

id static DriverManager.shared.getter()
{
  if (qword_26B183078 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)static DriverManager.shared;

  return v0;
}

id static DriverManager.sharedManager()()
{
  uint64_t v0 = sub_24D006950();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  unsigned int v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24D006C40();
  sub_24D000014(0, (unint64_t *)&qword_26B183188);
  int v4 = (void *)sub_24D006C50();
  sub_24D006940();
  sub_24D006930();

  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  if (qword_26B183078 != -1) {
    swift_once();
  }
  char v5 = (void *)static DriverManager.shared;

  return v5;
}

id DriverManager.addObserver(_:)(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_24D006950();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24D006C40();
  sub_24D000014(0, (unint64_t *)&qword_26B183188);
  int v8 = (void *)sub_24D006C50();
  sub_24D006940();
  sub_24D006930();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  unint64_t v9 = *(void **)(v2 + OBJC_IVAR____SwiftDriverManager_observerLock);
  objc_msgSend(v9, sel_lock);
  uint64_t v10 = (void *)(v2 + OBJC_IVAR____SwiftDriverManager_observers);
  swift_beginAccess();
  swift_unknownObjectRetain();
  unint64_t v11 = swift_bridgeObjectRetain();
  LOBYTE(v2) = sub_24CFFF148(v11, a1);
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  if ((v2 & 1) == 0)
  {
    swift_beginAccess();
    uint64_t v12 = swift_unknownObjectRetain();
    MEMORY[0x25331ACB0](v12);
    if (*(void *)((*v10 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v10 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_24D006B90();
    }
    sub_24D006BB0();
    sub_24D006B80();
    swift_endAccess();
  }
  return objc_msgSend(v9, sel_unlock);
}

id DriverManager.removeObserver(_:)(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_24D006950();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24D006C40();
  sub_24D000014(0, (unint64_t *)&qword_26B183188);
  int v8 = (void *)sub_24D006C50();
  sub_24D006940();
  sub_24D006930();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  unint64_t v9 = *(void **)(v2 + OBJC_IVAR____SwiftDriverManager_observerLock);
  objc_msgSend(v9, sel_lock);
  uint64_t v10 = (unint64_t *)(v2 + OBJC_IVAR____SwiftDriverManager_observers);
  swift_beginAccess();
  swift_unknownObjectRetain();
  uint64_t v11 = sub_24CFFF340(v10, a1);
  id result = (id)swift_unknownObjectRelease();
  if (*v10 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v13 = sub_24D006DA0();
    id result = (id)swift_bridgeObjectRelease();
    if (v13 >= v11) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v13 = *(void *)((*v10 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v13 >= v11)
    {
LABEL_3:
      sub_24CFFF660(v11, v13);
      swift_endAccess();
      return objc_msgSend(v9, sel_unlock);
    }
  }
  __break(1u);
  return result;
}

void sub_24CFF614C(void *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  swift_unknownObjectRetain();
  id v7 = a1;
  a4(a3);
  swift_unknownObjectRelease();
}

Swift::Int __swiftcall DriverManager.driverCount()()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_24D006950();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24D006C40();
  sub_24D000014(0, (unint64_t *)&qword_26B183188);
  uint64_t v6 = (void *)sub_24D006C50();
  sub_24D006940();
  sub_24D006930();

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  id v7 = *(void **)(v1 + OBJC_IVAR____SwiftDriverManager_driverApprovalStatesLock);
  objc_msgSend(v7, sel_lock);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24D0069B0();
  swift_release();
  swift_release();
  if (v11 >> 62)
  {
    swift_bridgeObjectRetain();
    Swift::Int v8 = sub_24D006DA0();
    swift_bridgeObjectRelease();
  }
  else
  {
    Swift::Int v8 = *(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  objc_msgSend(v7, sel_unlock);
  return v8;
}

Swift::Int __swiftcall DriverManager.thirdPartyDriverCount()()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for DriverKitDriverSource();
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_24D006950();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  Swift::Int v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24D006C40();
  sub_24D000014(0, (unint64_t *)&qword_26B183188);
  unint64_t v9 = (void *)sub_24D006C50();
  sub_24D006940();
  sub_24D006930();

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  uint64_t v10 = *(void **)(v1 + OBJC_IVAR____SwiftDriverManager_driverApprovalStatesLock);
  objc_msgSend(v10, sel_lock);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24D0069B0();
  swift_release();
  swift_release();
  unint64_t v11 = v25;
  unint64_t v25 = MEMORY[0x263F8EE78];
  if (v11 >> 62) {
    goto LABEL_16;
  }
  uint64_t v12 = *(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v12)
  {
    while (1)
    {
      uint64_t v23 = v10;
      unint64_t v13 = 0;
      unint64_t v24 = v4;
      while ((v11 & 0xC000000000000001) != 0)
      {
        id v14 = (id)MEMORY[0x25331AE40](v13, v11);
LABEL_9:
        uint64_t v15 = v14;
        uint64_t v10 = (void *)(v13 + 1);
        if (__OFADD__(v13, 1)) {
          goto LABEL_15;
        }
        uint64_t v16 = OBJC_IVAR____SwiftDriverApprovalState_driver;
        uint64_t v17 = type metadata accessor for DriverKitDriver();
        sub_24D000864((uint64_t)v15 + *(int *)(v17 + 20) + v16, (uint64_t)v4, (uint64_t (*)(void))type metadata accessor for DriverKitDriverSource);
        uint64_t v18 = type metadata accessor for DriverKitDriverApp();
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v18 - 8) + 48))(v4, 1, v18) == 1)
        {
        }
        else
        {
          sub_24D0008CC((uint64_t)v4, (uint64_t (*)(void))type metadata accessor for DriverKitDriverSource);
          sub_24D006D40();
          sub_24D006D60();
          uint64_t v4 = v24;
          sub_24D006D70();
          sub_24D006D50();
        }
        ++v13;
        if (v10 == (void *)v12)
        {
          unint64_t v19 = v25;
          uint64_t v10 = v23;
          goto LABEL_18;
        }
      }
      if (v13 < *(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
        break;
      }
      __break(1u);
LABEL_15:
      __break(1u);
LABEL_16:
      uint64_t v12 = sub_24D006DA0();
      if (!v12) {
        goto LABEL_17;
      }
    }
    id v14 = *(id *)(v11 + 8 * v13 + 32);
    goto LABEL_9;
  }
LABEL_17:
  unint64_t v19 = MEMORY[0x263F8EE78];
LABEL_18:
  swift_bridgeObjectRelease();
  objc_msgSend(v10, sel_unlock);
  if ((v19 & 0x8000000000000000) != 0 || (v19 & 0x4000000000000000) != 0)
  {
    swift_bridgeObjectRetain();
    Swift::Int v20 = sub_24D006DA0();
    swift_release();
  }
  else
  {
    Swift::Int v20 = *(void *)(v19 + 16);
  }
  swift_release();
  return v20;
}

uint64_t DriverManager.driverApprovalStates(filter:)(uint64_t a1, unint64_t a2)
{
  uint64_t v5 = *(void **)(v2 + OBJC_IVAR____SwiftDriverManager_driverApprovalStatesLock);
  objc_msgSend(v5, sel_lock);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24D0069B0();
  swift_release();
  swift_release();
  sub_24CFFFFCC(a1, a2);
  uint64_t v6 = sub_24CFFF978(v8, a1, a2);
  sub_24CFFFFE0(a1, a2);
  swift_bridgeObjectRelease();
  objc_msgSend(v5, sel_unlock);
  return v6;
}

Swift::Int __swiftcall DriverManager.driverCount(forAppID:)(Swift::String forAppID)
{
  uint64_t v2 = v1;
  object = forAppID._object;
  uint64_t countAndFlagsBits = forAppID._countAndFlagsBits;
  uint64_t v5 = sub_24D006950();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  unint64_t v8 = &v14[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_24D006C40();
  sub_24D000014(0, (unint64_t *)&qword_26B183188);
  unint64_t v9 = (void *)sub_24D006C50();
  sub_24D006940();
  sub_24D006930();

  (*(void (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
  uint64_t v10 = *(void **)(v2 + OBJC_IVAR____SwiftDriverManager_driverApprovalStatesLock);
  objc_msgSend(v10, sel_lock);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24D0069B0();
  swift_release();
  swift_release();
  uint64_t v15 = countAndFlagsBits;
  uint64_t v16 = object;
  unint64_t v11 = sub_24CFFBDD8((uint64_t (*)(id *))sub_24CFFFFF4, (uint64_t)v14, v17);
  objc_msgSend(v10, sel_unlock);
  if (v11 >> 62)
  {
    swift_bridgeObjectRetain();
    Swift::Int v12 = sub_24D006DA0();
    swift_bridgeObjectRelease();
  }
  else
  {
    Swift::Int v12 = *(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  return v12;
}

Swift::Void __swiftcall DriverManager.refresh()()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_24D0069E0();
  uint64_t v18 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_24D006A00();
  uint64_t v5 = *(void *)(v17 - 8);
  MEMORY[0x270FA5388](v17);
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_24D006950();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  unint64_t v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24D006C40();
  sub_24D000014(0, (unint64_t *)&qword_26B183188);
  Swift::Int v12 = (void *)sub_24D006C50();
  sub_24D006940();
  sub_24D006930();

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  sub_24D000014(0, &qword_26B183180);
  unint64_t v13 = (void *)sub_24D006C10();
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = v1;
  aBlock[4] = sub_24D000088;
  aBlock[5] = v14;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_24CFF7198;
  aBlock[3] = &block_descriptor;
  uint64_t v15 = _Block_copy(aBlock);
  id v16 = v1;
  swift_release();
  sub_24D0069F0();
  aBlock[0] = MEMORY[0x263F8EE78];
  sub_24D000558(&qword_26B183130, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B183148);
  sub_24CFF35E0(&qword_26B183150, &qword_26B183148);
  sub_24D006CA0();
  MEMORY[0x25331AD80](0, v7, v4, v15);
  _Block_release(v15);

  (*(void (**)(char *, uint64_t))(v18 + 8))(v4, v2);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v17);
}

uint64_t sub_24CFF6F24()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_24D006A10();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (uint64_t *)((char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v6 = sub_24D006950();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24D006C40();
  sub_24D000014(0, (unint64_t *)&qword_26B183188);
  uint64_t v10 = sub_24D006C50();
  sub_24D006940();
  sub_24D006930();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  sub_24D000014(0, &qword_26B183180);
  *uint64_t v5 = sub_24D006C10();
  (*(void (**)(uint64_t *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x263F8F0E0], v2);
  LOBYTE(v10) = sub_24D006A20();
  uint64_t result = (*(uint64_t (**)(uint64_t *, uint64_t))(v3 + 8))(v5, v2);
  if (v10)
  {
    uint64_t v12 = swift_allocObject();
    *(void *)(v12 + 16) = v1;
    id v13 = v1;
    DriverKitDaemonClient.getApprovalStateForSettings(_:)((uint64_t)sub_24D0005E0, v12);
    return swift_release();
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_24CFF71E4()
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v1 = sub_24D006C00();
  uint64_t v21 = *(void *)(v1 - 8);
  uint64_t v22 = v1;
  MEMORY[0x270FA5388](v1);
  uint64_t v3 = (char *)&v20 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_24D006BF0();
  MEMORY[0x270FA5388](v4);
  uint64_t v5 = sub_24D006A00();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v6 = sub_24D006950();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = v0;
  sub_24D006C40();
  sub_24D000014(0, (unint64_t *)&qword_26B183188);
  unint64_t v11 = (void *)sub_24D006C50();
  sub_24D006940();
  sub_24D006930();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  type metadata accessor for DriverKitDaemonClient();
  uint64_t v12 = (void *)swift_allocObject();
  v12[3] = 0;
  v12[4] = 0;
  v12[2] = 0;
  *(void *)&v10[OBJC_IVAR____SwiftDriverManager_client] = v12;
  id v13 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08958]), sel_init);
  *(void *)&v10[OBJC_IVAR____SwiftDriverManager_driverApprovalStatesLock] = v13;
  swift_beginAccess();
  uint64_t v14 = MEMORY[0x263F8EE78];
  uint64_t v25 = MEMORY[0x263F8EE78];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B183140);
  sub_24D006970();
  swift_endAccess();
  sub_24D000014(0, &qword_26B183180);
  sub_24D0069F0();
  uint64_t v26 = v14;
  sub_24D000558(&qword_26B183178, MEMORY[0x263F8F0F8]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B183158);
  sub_24CFF35E0(&qword_26B183160, &qword_26B183158);
  sub_24D006CA0();
  (*(void (**)(char *, void, uint64_t))(v21 + 104))(v3, *MEMORY[0x263F8F130], v22);
  *(void *)&v10[OBJC_IVAR____SwiftDriverManager_launchServicesQueue] = sub_24D006C30();
  id v15 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08958]), sel_init);
  *(void *)&v10[OBJC_IVAR____SwiftDriverManager_observerLock] = v15;
  *(void *)&v10[OBJC_IVAR____SwiftDriverManager_observers] = v14;

  v24.receiver = v10;
  v24.super_class = ObjectType;
  id v16 = objc_msgSendSuper2(&v24, sel_init);
  uint64_t v17 = swift_allocObject();
  swift_unknownObjectWeakInit();
  id v18 = v16;
  swift_retain();
  swift_retain();
  DriverKitDaemonClient.registerForApprovalsChangeNotification(_:)((uint64_t)sub_24D0005D8, v17);
  swift_release();
  swift_release_n();

  return v18;
}

void sub_24CFF76B0(uint64_t a1)
{
  uint64_t v2 = sub_24D0069E0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_24D006A00();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t v10 = MEMORY[0x25331B6B0](a1 + 16);
  if (v10)
  {
    unint64_t v11 = (void *)v10;
    sub_24D006BC0();
    uint64_t v21 = v3;
    uint64_t v22 = v6;
    sub_24D000014(0, (unint64_t *)&qword_26B183188);
    uint64_t v12 = (void *)sub_24D006C50();
    uint64_t v13 = v7;
    uint64_t v14 = MEMORY[0x263F8EE78];
    sub_24D006920();

    sub_24D000014(0, &qword_26B183180);
    id v15 = (void *)sub_24D006C10();
    uint64_t v16 = swift_allocObject();
    *(void *)(v16 + 16) = v11;
    aBlock[4] = sub_24D0009A8;
    aBlock[5] = v16;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_24CFF7198;
    aBlock[3] = &block_descriptor_24;
    uint64_t v17 = _Block_copy(aBlock);
    id v18 = v11;
    swift_release();
    sub_24D0069F0();
    aBlock[0] = v14;
    sub_24D000558(&qword_26B183130, MEMORY[0x263F8F030]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B183148);
    sub_24CFF35E0(&qword_26B183150, &qword_26B183148);
    sub_24D006CA0();
    MEMORY[0x25331AD80](0, v9, v5, v17);
    _Block_release(v17);

    (*(void (**)(char *, uint64_t))(v21 + 8))(v5, v2);
    (*(void (**)(char *, uint64_t))(v13 + 8))(v9, v22);
  }
  else
  {
    sub_24D006BD0();
    sub_24D000014(0, (unint64_t *)&qword_26B183188);
    unint64_t v19 = (void *)sub_24D006C50();
    sub_24D006920();
  }
}

id DriverManager.__deallocating_deinit()
{
  ObjectType = (objc_class *)swift_getObjectType();
  swift_retain();
  sub_24D0031DC();
  sub_24D006A90();
  swift_bridgeObjectRelease();
  xpc_set_event();
  swift_release();
  swift_release();
  v3.receiver = v0;
  v3.super_class = ObjectType;
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

id sub_24CFF7CC0(void *a1, uint64_t a2)
{
  uint64_t v146 = a2;
  uint64_t v156 = type metadata accessor for DriverKitDriver();
  uint64_t v152 = *(void *)(v156 - 8);
  uint64_t v3 = MEMORY[0x270FA5388](v156);
  v137 = (uint64_t *)((char *)&v136 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  uint64_t v151 = (uint64_t)&v136 - v6;
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  *(void *)&long long v153 = (char *)&v136 - v8;
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (unint64_t *)((char *)&v136 - v9);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B183100);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v145 = (char *)&v136 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v144 = type metadata accessor for SettingsApplicationRecord();
  uint64_t v148 = *(void *)(v144 - 8);
  MEMORY[0x270FA5388](v144);
  uint64_t v139 = (uint64_t)&v136 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for DriverKitDriverSource();
  MEMORY[0x270FA5388](v14 - 8);
  uint64_t v147 = (uint64_t *)((char *)&v136 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v16 = sub_24D006A10();
  uint64_t v17 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  KeyPath = (uint64_t *)((char *)&v136 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v20 = sub_24D006950();
  uint64_t v21 = *(void *)(v20 - 8);
  MEMORY[0x270FA5388](v20);
  uint64_t v23 = (uint64_t)&v136 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24D006C40();
  uint64_t v140 = sub_24D000014(0, (unint64_t *)&qword_26B183188);
  uint64_t v24 = sub_24D006C50();
  sub_24D006940();
  sub_24D006930();

  uint64_t v26 = *(void (**)(void, void))(v21 + 8);
  unint64_t v25 = v21 + 8;
  v26(v23, v20);
  sub_24D000014(0, &qword_26B183180);
  void *KeyPath = sub_24D006C10();
  (*(void (**)(void *, void, uint64_t))(v17 + 104))(KeyPath, *MEMORY[0x263F8F0E0], v16);
  LOBYTE(v24) = sub_24D006A20();
  (*(void (**)(void *, uint64_t))(v17 + 8))(KeyPath, v16);
  if ((v24 & 1) == 0)
  {
LABEL_49:
    __break(1u);
LABEL_50:
    swift_bridgeObjectRetain();
    uint64_t v64 = sub_24D006DA0();
    swift_bridgeObjectRelease();
    long long v157 = (void *)v25;
    if (v64) {
      goto LABEL_38;
    }
    goto LABEL_51;
  }
  unint64_t v164 = MEMORY[0x263F8EE78];
  uint64_t v27 = a1[7];
  __int16 v149 = a1 + 7;
  uint64_t v28 = 1 << *((unsigned char *)a1 + 32);
  uint64_t v29 = -1;
  if (v28 < 64) {
    uint64_t v29 = ~(-1 << v28);
  }
  unint64_t v30 = v29 & v27;
  int64_t v150 = (unint64_t)(v28 + 63) >> 6;
  v143 = (void (**)(void, void, void, void))(v148 + 56);
  v142 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v148 + 48);
  swift_bridgeObjectRetain();
  uint64_t v31 = 0;
  long long v138 = xmmword_24D007930;
  long long v155 = a1;
  uint64_t v23 = (uint64_t)v147;
  if (!v30) {
    goto LABEL_6;
  }
LABEL_5:
  uint64_t v158 = (v30 - 1) & v30;
  uint64_t v159 = v31;
  for (unint64_t i = __clz(__rbit64(v30)) | (v31 << 6); ; unint64_t i = __clz(__rbit64(v34)) + (v35 << 6))
  {
    uint64_t v37 = a1[6] + 72 * i;
    unint64_t v25 = *(void *)(v37 + 8);
    unint64_t v160 = *(void *)v37;
    size_t v39 = *(uint64_t **)(v37 + 16);
    unint64_t v38 = *(uint64_t **)(v37 + 24);
    uint64_t v41 = *(void *)(v37 + 32);
    uint64_t v40 = *(void *)(v37 + 40);
    KeyPath = *(void **)(v37 + 48);
    unint64_t v42 = *(void *)(v37 + 56);
    LODWORD(v157) = *(unsigned __int8 *)(v37 + 64);
    if (v42 >> 60 == 15)
    {
      uint64_t v43 = type metadata accessor for DriverKitDriverApp();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v43 - 8) + 56))(v23, 1, 1, v43);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_24CFF1EAC((uint64_t)KeyPath, v42);
    }
    else
    {
      v154 = v39;
      uint64_t v44 = v146;
      uint64_t v45 = (uint64_t)v145;
      uint64_t v46 = v148;
      if (*(void *)(v146 + 16))
      {
        sub_24CFF1EAC((uint64_t)KeyPath, v42);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        sub_24CFF1EAC((uint64_t)KeyPath, v42);
        sub_24CFF1EAC((uint64_t)KeyPath, v42);
        uint64_t v47 = sub_24CFF0050((uint64_t)KeyPath, v42);
        if (v48)
        {
          sub_24D000864(*(void *)(v44 + 56) + *(void *)(v46 + 72) * v47, v45, (uint64_t (*)(void))type metadata accessor for SettingsApplicationRecord);
          uint64_t v49 = v144;
          (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v46 + 56))(v45, 0, 1, v144);
        }
        else
        {
          uint64_t v49 = v144;
          (*v143)(v45, 1, 1, v144);
        }
        sub_24CFF1620((uint64_t)KeyPath, v42);
      }
      else
      {
        uint64_t v49 = v144;
        (*v143)(v145, 1, 1, v144);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        sub_24CFF1EAC((uint64_t)KeyPath, v42);
        sub_24CFF1EAC((uint64_t)KeyPath, v42);
      }
      if ((*v142)(v45, 1, v49) == 1)
      {
        sub_24D000728(v45);
        sub_24D006BD0();
        __swift_instantiateConcreteTypeFromMangledName(qword_26B1831A0);
        uint64_t v50 = swift_allocObject();
        *(_OWORD *)(v50 + 16) = v138;
        *(void *)(v50 + 56) = MEMORY[0x263F8D310];
        *(void *)(v50 + 64) = sub_24D000120();
        *(void *)(v50 + 32) = v160;
        *(void *)(v50 + 40) = v25;
        swift_bridgeObjectRetain();
        uint64_t v51 = (void *)sub_24D006C50();
        sub_24D006920();
        swift_bridgeObjectRelease();

        uint64_t v23 = (uint64_t)v147;
        *uint64_t v147 = KeyPath;
        *(void *)(v23 + 8) = v42;
      }
      else
      {
        sub_24CFF1620((uint64_t)KeyPath, v42);
        uint64_t v53 = v45;
        uint64_t v54 = v139;
        sub_24D0007FC(v53, v139, (uint64_t (*)(void))type metadata accessor for SettingsApplicationRecord);
        uint64_t v55 = v54;
        uint64_t v23 = (uint64_t)v147;
        sub_24D0007FC(v55, (uint64_t)v147, (uint64_t (*)(void))type metadata accessor for SettingsApplicationRecord);
      }
      uint64_t v52 = type metadata accessor for DriverKitDriverApp();
      swift_storeEnumTagMultiPayload();
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v52 - 8) + 56))(v23, 0, 1, v52);
      size_t v39 = v154;
    }
    uint64_t v56 = v156;
    sub_24D000864(v23, (uint64_t)v10 + *(int *)(v156 + 20), (uint64_t (*)(void))type metadata accessor for DriverKitDriverSource);
    *uint64_t v10 = v160;
    v10[1] = v25;
    uint64_t v57 = (uint64_t **)((char *)v10 + *(int *)(v56 + 24));
    void *v57 = v39;
    v57[1] = v38;
    uint64_t v58 = (unint64_t *)((char *)v10 + *(int *)(v56 + 28));
    void *v58 = v41;
    v58[1] = v40;
    uint64_t v59 = (objc_class *)type metadata accessor for DriverApprovalState();
    uint64_t v60 = v23;
    id v61 = objc_allocWithZone(v59);
    sub_24D000864((uint64_t)v10, (uint64_t)v61 + OBJC_IVAR____SwiftDriverApprovalState_driver, (uint64_t (*)(void))type metadata accessor for DriverKitDriver);
    swift_beginAccess();
    LOBYTE(v163) = (_BYTE)v157;
    swift_bridgeObjectRetain();
    id v62 = v61;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_24D006970();
    swift_endAccess();
    swift_beginAccess();
    uint64_t v163 = 0;
    sub_24D006970();
    swift_endAccess();

    v162.receiver = v62;
    v162.super_class = v59;
    objc_msgSendSuper2(&v162, sel_init);
    uint64_t v63 = sub_24D0008CC((uint64_t)v10, (uint64_t (*)(void))type metadata accessor for DriverKitDriver);
    MEMORY[0x25331ACB0](v63);
    if (*(void *)((v164 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v164 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_24D006B90();
    }
    sub_24D006BB0();
    sub_24D006B80();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_24CFF1620((uint64_t)KeyPath, v42);
    sub_24D0008CC(v60, (uint64_t (*)(void))type metadata accessor for DriverKitDriverSource);
    a1 = v155;
    uint64_t v23 = v60;
    unint64_t v30 = v158;
    uint64_t v31 = v159;
    if (v158) {
      goto LABEL_5;
    }
LABEL_6:
    int64_t v33 = v31 + 1;
    if (__OFADD__(v31, 1))
    {
      __break(1u);
LABEL_48:
      __break(1u);
      goto LABEL_49;
    }
    if (v33 >= v150) {
      goto LABEL_36;
    }
    unint64_t v34 = v149[v33];
    int64_t v35 = v31 + 1;
    if (!v34)
    {
      int64_t v35 = v31 + 2;
      if (v31 + 2 >= v150) {
        goto LABEL_36;
      }
      unint64_t v34 = v149[v35];
      if (!v34)
      {
        int64_t v35 = v31 + 3;
        if (v31 + 3 >= v150) {
          goto LABEL_36;
        }
        unint64_t v34 = v149[v35];
        if (!v34) {
          break;
        }
      }
    }
LABEL_19:
    uint64_t v158 = (v34 - 1) & v34;
    uint64_t v159 = v35;
  }
  uint64_t v36 = v31 + 4;
  if (v31 + 4 < v150)
  {
    unint64_t v34 = v149[v36];
    if (!v34)
    {
      while (1)
      {
        int64_t v35 = v36 + 1;
        if (__OFADD__(v36, 1)) {
          goto LABEL_48;
        }
        if (v35 >= v150) {
          goto LABEL_36;
        }
        unint64_t v34 = v149[v35];
        ++v36;
        if (v34) {
          goto LABEL_19;
        }
      }
    }
    int64_t v35 = v31 + 4;
    goto LABEL_19;
  }
LABEL_36:
  swift_release();
  KeyPath = 0;
  sub_24CFF9638(&v164);
  unint64_t v25 = *(void *)(v141 + OBJC_IVAR____SwiftDriverManager_driverApprovalStatesLock);
  objc_msgSend((id)v25, sel_lock);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24D0069B0();
  swift_release();
  swift_release();
  uint64_t v23 = *(void *)v161;
  if (*(void *)v161 >> 62) {
    goto LABEL_50;
  }
  uint64_t v64 = *(void *)((*(void *)v161 & 0xFFFFFFFFFFFFFF8) + 0x10);
  long long v157 = (void *)v25;
  if (!v64)
  {
LABEL_51:
    swift_bridgeObjectRelease();
    uint64_t v66 = MEMORY[0x263F8EE78];
    goto LABEL_52;
  }
LABEL_38:
  *(void *)long long v161 = MEMORY[0x263F8EE78];
  sub_24CFEFC58(0, v64 & ~(v64 >> 63), 0);
  if (v64 < 0)
  {
LABEL_113:
    __break(1u);
LABEL_114:
    __break(1u);
    goto LABEL_115;
  }
  uint64_t v65 = 0;
  uint64_t v66 = *(void *)v161;
  do
  {
    if ((v23 & 0xC000000000000001) != 0)
    {
      uint64_t v67 = MEMORY[0x25331AE40](v65, v23);
      sub_24D000864(v67 + OBJC_IVAR____SwiftDriverApprovalState_driver, v153, (uint64_t (*)(void))type metadata accessor for DriverKitDriver);
      swift_unknownObjectRelease();
    }
    else
    {
      sub_24D000864(*(void *)(v23 + 8 * v65 + 32) + OBJC_IVAR____SwiftDriverApprovalState_driver, v153, (uint64_t (*)(void))type metadata accessor for DriverKitDriver);
    }
    *(void *)long long v161 = v66;
    unint64_t v69 = *(void *)(v66 + 16);
    unint64_t v68 = *(void *)(v66 + 24);
    if (v69 >= v68 >> 1)
    {
      sub_24CFEFC58(v68 > 1, v69 + 1, 1);
      uint64_t v66 = *(void *)v161;
    }
    ++v65;
    *(void *)(v66 + 16) = v69 + 1;
    sub_24D0007FC(v153, v66+ ((*(unsigned __int8 *)(v152 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v152 + 80))+ *(void *)(v152 + 72) * v69, (uint64_t (*)(void))type metadata accessor for DriverKitDriver);
  }
  while (v64 != v65);
  swift_bridgeObjectRelease();
LABEL_52:
  unint64_t v25 = v164;
  if (v164 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v70 = sub_24D006DA0();
    if (!v70) {
      goto LABEL_64;
    }
LABEL_54:
    *(void *)long long v161 = MEMORY[0x263F8EE78];
    sub_24CFEFC58(0, v70 & ~(v70 >> 63), 0);
    if ((v70 & 0x8000000000000000) == 0)
    {
      uint64_t v71 = 0;
      uint64_t v72 = *(void *)v161;
      do
      {
        if ((v25 & 0xC000000000000001) != 0)
        {
          uint64_t v73 = MEMORY[0x25331AE40](v71, v25);
          sub_24D000864(v73 + OBJC_IVAR____SwiftDriverApprovalState_driver, v151, (uint64_t (*)(void))type metadata accessor for DriverKitDriver);
          swift_unknownObjectRelease();
        }
        else
        {
          sub_24D000864(*(void *)(v25 + 8 * v71 + 32) + OBJC_IVAR____SwiftDriverApprovalState_driver, v151, (uint64_t (*)(void))type metadata accessor for DriverKitDriver);
        }
        *(void *)long long v161 = v72;
        unint64_t v75 = *(void *)(v72 + 16);
        unint64_t v74 = *(void *)(v72 + 24);
        if (v75 >= v74 >> 1)
        {
          sub_24CFEFC58(v74 > 1, v75 + 1, 1);
          uint64_t v72 = *(void *)v161;
        }
        ++v71;
        *(void *)(v72 + 16) = v75 + 1;
        sub_24D0007FC(v151, v72+ ((*(unsigned __int8 *)(v152 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v152 + 80))+ *(void *)(v152 + 72) * v75, (uint64_t (*)(void))type metadata accessor for DriverKitDriver);
      }
      while (v70 != v71);
      swift_bridgeObjectRelease();
      goto LABEL_65;
    }
    goto LABEL_114;
  }
  uint64_t v70 = *(void *)((v164 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (v70) {
    goto LABEL_54;
  }
LABEL_64:
  swift_bridgeObjectRelease();
  uint64_t v72 = MEMORY[0x263F8EE78];
LABEL_65:
  int v76 = sub_24CFF96C0(v66, v72);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  LODWORD(v156) = v76;
  if ((v76 & 1) == 0)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    size_t v106 = (void (*)(void, void))sub_24D0069A0();
    *uint64_t v107 = MEMORY[0x263F8EE78];
    swift_bridgeObjectRelease();
    v106(v161, 0);
    swift_release();
    swift_release();
    unint64_t v108 = v164;
    if (v164 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v109 = sub_24D006DA0();
      swift_bridgeObjectRelease();
      if (!v109) {
        goto LABEL_118;
      }
    }
    else
    {
      uint64_t v109 = *(void *)((v164 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (!v109) {
        goto LABEL_118;
      }
    }
    if (v109 < 1) {
      goto LABEL_141;
    }
    uint64_t v110 = 0;
    do
    {
      if ((v108 & 0xC000000000000001) != 0) {
        id v111 = (id)MEMORY[0x25331AE40](v110, v108);
      }
      else {
        id v111 = *(id *)(v108 + 8 * v110 + 32);
      }
      v112 = v111;
      swift_getKeyPath();
      swift_getKeyPath();
      id v113 = v112;
      v114 = (void (*)(void, void))sub_24D0069A0();
      unint64_t v116 = v115;
      MEMORY[0x25331ACB0]();
      if (*(void *)((*v116 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v116 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_24D006B90();
      }
      ++v110;
      sub_24D006BB0();
      sub_24D006B80();
      v114(v161, 0);

      swift_release();
      swift_release();
    }
    while (v109 != v110);
LABEL_118:
    swift_bridgeObjectRelease();
    uint64_t v117 = v157;
LABEL_119:
    uint64_t v118 = v141;
    uint64_t v119 = *(void **)(v141 + OBJC_IVAR____SwiftDriverManager_observerLock);
    objc_msgSend(v119, sel_lock);
    sub_24D006BC0();
    __swift_instantiateConcreteTypeFromMangledName(qword_26B1831A0);
    uint64_t v120 = swift_allocObject();
    *(_OWORD *)(v120 + 16) = xmmword_24D0089E0;
    int64_t v121 = (unint64_t *)(v118 + OBJC_IVAR____SwiftDriverManager_observers);
    swift_beginAccess();
    unint64_t v122 = *v121;
    if (*v121 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v123 = sub_24D006DA0();
      swift_bridgeObjectRelease();
      unint64_t v122 = *v121;
    }
    else
    {
      uint64_t v123 = *(void *)((v122 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    uint64_t v124 = MEMORY[0x263F8D750];
    *(void *)(v120 + 56) = MEMORY[0x263F8D6C8];
    *(void *)(v120 + 64) = v124;
    *(void *)(v120 + 32) = v123;
    if (v122 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v125 = sub_24D006DA0();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v125 = *(void *)((v122 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    unint64_t v126 = sub_24D000120();
    uint64_t v127 = 115;
    if (v125 <= 1) {
      uint64_t v127 = 0;
    }
    unint64_t v128 = 0xE000000000000000;
    *(void *)(v120 + 96) = MEMORY[0x263F8D310];
    *(void *)(v120 + 104) = v126;
    if (v125 > 1) {
      unint64_t v128 = 0xE100000000000000;
    }
    *(void *)(v120 + 72) = v127;
    *(void *)(v120 + 80) = v128;
    uint64_t v129 = (void *)sub_24D006C50();
    sub_24D006920();
    swift_bridgeObjectRelease();

    unint64_t v130 = *v121;
    if (*v121 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v131 = sub_24D006DA0();
      if (v131) {
        goto LABEL_129;
      }
    }
    else
    {
      uint64_t v131 = *(void *)((v130 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (v131)
      {
LABEL_129:
        if (v131 >= 1)
        {
          uint64_t v132 = 0;
          uint64_t v133 = v156 & 1;
          do
          {
            if ((v130 & 0xC000000000000001) != 0)
            {
              v134 = (void *)MEMORY[0x25331AE40](v132, v130);
            }
            else
            {
              v134 = *(void **)(v130 + 8 * v132 + 32);
              swift_unknownObjectRetain();
            }
            ++v132;
            objc_msgSend(v134, sel_approvalStateDidChange_, v133);
            swift_unknownObjectRelease();
          }
          while (v131 != v132);
          goto LABEL_138;
        }
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
LABEL_146:
        id result = (id)swift_release();
        __break(1u);
        return result;
      }
    }
LABEL_138:
    swift_bridgeObjectRelease();
    objc_msgSend(v119, sel_unlock);
    return objc_msgSend(v117, sel_unlock);
  }
  if (v25 >> 62)
  {
LABEL_115:
    swift_bridgeObjectRetain();
    uint64_t v77 = sub_24D006DA0();
    swift_bridgeObjectRelease();
    if (!v77) {
      goto LABEL_116;
    }
LABEL_68:
    long long v155 = KeyPath;
    int v78 = 0;
    uint64_t v79 = 0;
    unint64_t v160 = v25 & 0xC000000000000001;
    uint64_t v158 = v25 & 0xFFFFFFFFFFFFFF8;
    long long v153 = xmmword_24D0089E0;
    uint64_t v159 = v77;
    while (2)
    {
      LODWORD(v154) = v78;
      uint64_t v80 = v79 + 4;
      while (1)
      {
        unint64_t v81 = v80 - 4;
        if (v160)
        {
          id v82 = (id)MEMORY[0x25331AE40](v80 - 4, v25);
        }
        else
        {
          if (v81 >= *(void *)(v158 + 16)) {
            goto LABEL_112;
          }
          id v82 = *(id *)(v25 + 8 * v80);
        }
        uint64_t v83 = v82;
        uint64_t v79 = v80 - 3;
        if (__OFADD__(v81, 1))
        {
          __break(1u);
LABEL_111:
          __break(1u);
LABEL_112:
          __break(1u);
          goto LABEL_113;
        }
        swift_getKeyPath();
        swift_getKeyPath();
        sub_24D0069B0();
        swift_release();
        swift_release();
        KeyPath = *(void **)v161;
        if ((*(void *)v161 & 0xC000000000000001) != 0)
        {
          id v84 = (id)MEMORY[0x25331AE40](v80 - 4, *(void *)v161);
        }
        else
        {
          if (v81 >= *(void *)((*(void *)v161 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
            goto LABEL_111;
          }
          id v84 = *(id *)(*(void *)v161 + 8 * v80);
        }
        BOOL v85 = v84;
        swift_bridgeObjectRelease();
        swift_getKeyPath();
        swift_getKeyPath();
        sub_24D0069B0();

        swift_release();
        swift_release();
        LODWORD(v85) = v161[0];
        KeyPath = (void *)swift_getKeyPath();
        swift_getKeyPath();
        sub_24D0069B0();
        swift_release();
        swift_release();
        if (v85 != v161[0]) {
          break;
        }

        ++v80;
        if (v79 == v159)
        {
          swift_bridgeObjectRelease();
          uint64_t v117 = v157;
          if (v154) {
            goto LABEL_119;
          }
          return objc_msgSend(v117, sel_unlock);
        }
      }
      swift_getKeyPath();
      swift_getKeyPath();
      sub_24D0069B0();
      swift_release();
      swift_release();
      if ((*(void *)v161 & 0xC000000000000001) != 0)
      {
        MEMORY[0x25331AE40](v80 - 4, *(void *)v161);
      }
      else
      {
        if (v81 >= *(void *)((*(void *)v161 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
          goto LABEL_142;
        }
        id v86 = *(id *)(*(void *)v161 + 8 * v80);
      }
      swift_bridgeObjectRelease();
      swift_getKeyPath();
      swift_getKeyPath();
      sub_24D0069B0();
      swift_release();
      swift_release();
      unsigned __int8 v87 = v161[0];
      swift_getKeyPath();
      swift_getKeyPath();
      v161[0] = v87;
      sub_24D0069C0();
      sub_24D006BC0();
      __swift_instantiateConcreteTypeFromMangledName(qword_26B1831A0);
      uint64_t v88 = swift_allocObject();
      *(_OWORD *)(v88 + 16) = v153;
      swift_getKeyPath();
      swift_getKeyPath();
      sub_24D0069B0();
      swift_release();
      swift_release();
      if ((*(void *)v161 & 0xC000000000000001) != 0)
      {
        id v89 = (id)MEMORY[0x25331AE40](v80 - 4, *(void *)v161);
      }
      else
      {
        if (v81 >= *(void *)((*(void *)v161 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
          goto LABEL_143;
        }
        id v89 = *(id *)(*(void *)v161 + 8 * v80);
      }
      uint64_t v90 = v89;
      swift_bridgeObjectRelease();
      uint64_t v91 = v137;
      sub_24D000864((uint64_t)v90 + OBJC_IVAR____SwiftDriverApprovalState_driver, (uint64_t)v137, (uint64_t (*)(void))type metadata accessor for DriverKitDriver);

      uint64_t v92 = *v91;
      uint64_t v93 = v91[1];
      swift_bridgeObjectRetain();
      sub_24D0008CC((uint64_t)v91, (uint64_t (*)(void))type metadata accessor for DriverKitDriver);
      *(void *)(v88 + 56) = MEMORY[0x263F8D310];
      unint64_t v94 = sub_24D000120();
      *(void *)(v88 + 64) = v94;
      *(void *)(v88 + 32) = v92;
      *(void *)(v88 + 40) = v93;
      swift_getKeyPath();
      swift_getKeyPath();
      sub_24D0069B0();
      swift_release();
      uint64_t v95 = swift_release();
      unsigned __int8 v96 = v161[0];
      if (qword_26B182F58 != -1) {
        uint64_t v95 = swift_once();
      }
      v154 = &v136;
      MEMORY[0x270FA5388](v95);
      *((unsigned char *)&v136 - 16) = v96;
      uint64_t v97 = swift_bridgeObjectRetain();
      __int16 v98 = v155;
      uint64_t v99 = sub_24CFF1368(v97, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_24D0007F4, (uint64_t)(&v136 - 4));
      long long v155 = v98;
      swift_bridgeObjectRelease();
      uint64_t v100 = sub_24CFFEFC0(v99);
      if (v102) {
        goto LABEL_145;
      }
      if (*(_DWORD *)(v99 + 36) != v101) {
        goto LABEL_144;
      }
      if (v100 != 1 << *(unsigned char *)(v99 + 32))
      {
        KeyPath = sub_24CFFF048(v161, v100, v101, 0, v99);
        uint64_t v104 = v103;
        swift_release();
        *(void *)(v88 + 96) = MEMORY[0x263F8D310];
        *(void *)(v88 + 104) = v94;
        *(void *)(v88 + 72) = KeyPath;
        *(void *)(v88 + 80) = v104;
        uint64_t v105 = (void *)sub_24D006C50();
        sub_24D006920();
        swift_bridgeObjectRelease();

        int v78 = 1;
        if (v79 != v159) {
          continue;
        }
        goto LABEL_118;
      }
      goto LABEL_146;
    }
  }
  uint64_t v77 = *(void *)((v25 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v77) {
    goto LABEL_68;
  }
LABEL_116:
  swift_bridgeObjectRelease();
  uint64_t v117 = v157;
  return objc_msgSend(v117, sel_unlock);
}

uint64_t sub_24CFF9638(unint64_t *a1)
{
  unint64_t v2 = *a1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *a1 = v2;
  if (!isUniquelyReferenced_nonNull_bridgeObject
    || (v2 & 0x8000000000000000) != 0
    || (v2 & 0x4000000000000000) != 0)
  {
    sub_24CFFF0CC(v2);
    unint64_t v2 = v4;
    *a1 = v4;
  }
  uint64_t v5 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  v7[0] = (v2 & 0xFFFFFFFFFFFFFF8) + 32;
  v7[1] = v5;
  sub_24CFFCC5C(v7);
  return sub_24D006B80();
}

uint64_t sub_24CFF96C0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for DriverKitDriver() - 8;
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  uint64_t v7 = (uint64_t *)((char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v5);
  uint64_t v10 = (uint64_t *)((char *)&v19 - v9);
  uint64_t v11 = *(void *)(a1 + 16);
  if (v11 == *(void *)(a2 + 16))
  {
    if (!v11 || a1 == a2)
    {
      char v15 = 1;
    }
    else
    {
      unint64_t v12 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
      uint64_t v13 = *(void *)(v8 + 72);
      uint64_t v14 = v11 - 1;
      do
      {
        sub_24D000864(a1 + v12, (uint64_t)v10, (uint64_t (*)(void))type metadata accessor for DriverKitDriver);
        sub_24D000864(a2 + v12, (uint64_t)v7, (uint64_t (*)(void))type metadata accessor for DriverKitDriver);
        char v15 = _s16DriverManagement0a3KitA0V2eeoiySbAC_ACtFZ_0(v10, v7);
        sub_24D0008CC((uint64_t)v7, (uint64_t (*)(void))type metadata accessor for DriverKitDriver);
        sub_24D0008CC((uint64_t)v10, (uint64_t (*)(void))type metadata accessor for DriverKitDriver);
        BOOL v17 = v14-- != 0;
        if ((v15 & 1) == 0) {
          break;
        }
        v12 += v13;
      }
      while (v17);
    }
  }
  else
  {
    char v15 = 0;
  }
  return v15 & 1;
}

void sub_24CFF9860(void *a1, char a2, void *a3)
{
  uint64_t v6 = sub_24D0069E0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v37 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_24D006A00();
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v37 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    id v25 = a1;
    sub_24D006BD0();
    __swift_instantiateConcreteTypeFromMangledName(qword_26B1831A0);
    uint64_t v26 = swift_allocObject();
    *(_OWORD *)(v26 + 16) = xmmword_24D007930;
    aBlock[0] = (uint64_t)a1;
    id v27 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26984D438);
    uint64_t v28 = sub_24D006A80();
    uint64_t v30 = v29;
    *(void *)(v26 + 56) = MEMORY[0x263F8D310];
    *(void *)(v26 + 64) = sub_24D000120();
    *(void *)(v26 + 32) = v28;
    *(void *)(v26 + 40) = v30;
    sub_24D000014(0, (unint64_t *)&qword_26B183188);
    uint64_t v31 = (void *)sub_24D006C50();
    sub_24D006920();
    swift_bridgeObjectRelease();

    sub_24D0005EC(a1, 1);
  }
  else
  {
    size_t v39 = v13;
    uint64_t v40 = v11;
    uint64_t v41 = v9;
    swift_bridgeObjectRetain();
    sub_24D006BC0();
    sub_24D000014(0, (unint64_t *)&qword_26B183188);
    uint64_t v14 = (void *)sub_24D006C50();
    uint64_t v15 = MEMORY[0x263F8EE78];
    sub_24D006920();

    os_log_type_t v16 = sub_24D006BC0();
    swift_bridgeObjectRetain_n();
    BOOL v17 = sub_24D006C50();
    os_log_type_t v18 = v16;
    if (os_log_type_enabled(v17, v16))
    {
      uint64_t v19 = swift_slowAlloc();
      uint64_t v37 = a3;
      uint64_t v20 = (uint8_t *)v19;
      uint64_t v21 = swift_slowAlloc();
      aBlock[0] = v21;
      *(_DWORD *)uint64_t v20 = 136315138;
      uint64_t v38 = v10;
      unint64_t v22 = ApprovalSettingsState.debugDescription.getter((uint64_t)a1);
      uint64_t v42 = sub_24CFFC298(v22, v23, aBlock);
      uint64_t v10 = v38;
      sub_24D006C60();
      uint64_t v15 = MEMORY[0x263F8EE78];
      swift_bridgeObjectRelease();
      sub_24D0005EC(a1, 0);
      sub_24D0005EC(a1, 0);
      _os_log_impl(&dword_24CFE4000, v17, v18, "%s", v20, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25331B630](v21, -1, -1);
      uint64_t v24 = v20;
      a3 = v37;
      MEMORY[0x25331B630](v24, -1, -1);
    }
    else
    {

      sub_24D0005EC(a1, 0);
      sub_24D0005EC(a1, 0);
    }
    uint64_t v32 = swift_allocObject();
    *(void *)(v32 + 16) = a3;
    *(void *)(v32 + 24) = a1;
    aBlock[4] = (uint64_t)sub_24D000638;
    aBlock[5] = v32;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_24CFF7198;
    aBlock[3] = (uint64_t)&block_descriptor_33;
    int64_t v33 = _Block_copy(aBlock);
    id v34 = a3;
    int64_t v35 = v39;
    sub_24D0069F0();
    uint64_t v42 = v15;
    sub_24D000558(&qword_26B183130, MEMORY[0x263F8F030]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B183148);
    sub_24CFF35E0(&qword_26B183150, &qword_26B183148);
    uint64_t v36 = v41;
    sub_24D006CA0();
    MEMORY[0x25331AD80](0, v35, v36, v33);
    _Block_release(v33);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v36, v6);
    (*(void (**)(char *, uint64_t))(v40 + 8))(v35, v10);
    swift_release();
  }
}

uint64_t sub_24CFF9DE4(void *a1, uint64_t a2)
{
  uint64_t v97 = a2;
  unsigned __int8 v96 = a1;
  uint64_t v137 = *MEMORY[0x263EF8340];
  uint64_t v103 = sub_24D0069E0();
  uint64_t v102 = *(void *)(v103 - 8);
  MEMORY[0x270FA5388](v103);
  uint64_t v100 = (char *)&v96 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v101 = sub_24D006A00();
  uint64_t v99 = *(void *)(v101 - 8);
  MEMORY[0x270FA5388](v101);
  __int16 v98 = (char *)&v96 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v114 = sub_24D006880();
  uint64_t v4 = *(void *)(v114 - 8);
  MEMORY[0x270FA5388](v114);
  uint64_t v119 = (char *)&v96 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v124 = type metadata accessor for SettingsApplicationRecord();
  uint64_t v106 = *(void *)(v124 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v124);
  uint64_t v113 = (uint64_t)&v96 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  v112 = (unint64_t *)((char *)&v96 - v8);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B183100);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v96 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = sub_24D002610(MEMORY[0x263F8EE78]);
  id v118 = objc_msgSend(self, sel_enumeratorWithOptions_, 0);
  id v13 = objc_msgSend(v118, sel_nextObject);
  if (v13)
  {
    id v14 = v13;
    uint64_t v117 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v106 + 56);
    uint64_t v110 = (unsigned int (**)(char *, uint64_t, uint64_t))(v106 + 48);
    id v111 = (void (**)(char *, char *, uint64_t))(v4 + 32);
    long long v104 = xmmword_24D0089E0;
    long long v126 = xmmword_24D007930;
    uint64_t v116 = v12;
    unint64_t v115 = v11;
    while (1)
    {
      id v31 = objc_msgSend(v14, sel_installSessionIdentifier, v96, v97);
      if (!v31)
      {

        goto LABEL_59;
      }
      uint64_t v32 = v31;
      uint64_t v33 = sub_24D0068A0();
      unint64_t v35 = v34;

      uint64_t v36 = *(void *)(v12 + 16);
      uint64_t v37 = *(void *)(v36 + 16);
      unint64_t v125 = v35;
      if (!v37) {
        break;
      }
      sub_24CFE7000(v33, v35);
      uint64_t v38 = sub_24CFF0050(v33, v35);
      if (v39)
      {
        sub_24D000864(*(void *)(v36 + 56) + *(void *)(v106 + 72) * v38, (uint64_t)v11, (uint64_t (*)(void))type metadata accessor for SettingsApplicationRecord);
        uint64_t v40 = 0;
      }
      else
      {
        uint64_t v40 = 1;
      }
      uint64_t v41 = v124;
      (*v117)(v11, v40, 1, v124);
      sub_24CFE71CC(v33, v35);
      if ((*v110)(v11, 1, v41) == 1) {
        goto LABEL_13;
      }
      unint64_t v129 = v35 >> 62;
      sub_24D000728((uint64_t)v11);
      int v109 = sub_24D006BD0();
      uint64_t v128 = __swift_instantiateConcreteTypeFromMangledName(qword_26B1831A0);
      uint64_t v46 = swift_allocObject();
      *(_OWORD *)(v46 + 16) = v104;
      id v47 = v14;
      id v48 = objc_msgSend(v47, sel_description);
      uint64_t v49 = sub_24D006A60();
      uint64_t v51 = v50;

      *(void *)(v46 + 56) = MEMORY[0x263F8D310];
      unint64_t v107 = sub_24D000120();
      *(void *)(v46 + 64) = v107;
      *(void *)(v46 + 32) = v49;
      *(void *)(v46 + 40) = v51;
      unint64_t v108 = (void *)v46;
      int v52 = v129;
      uint64_t v53 = MEMORY[0x263F8EE78];
      switch((int)v129)
      {
        case 1:
          if (__OFSUB__(HIDWORD(v33), v33)) {
            goto LABEL_68;
          }
          id v105 = v47;
          uint64_t v54 = HIDWORD(v33) - (int)v33;
LABEL_26:
          if (v54)
          {
            uint64_t v130 = MEMORY[0x263F8EE78];
            int64_t v64 = v54 & ~(v54 >> 63);
            sub_24CFEFC38(0, v64, 0);
            uint64_t v53 = v130;
            uint64_t v123 = (int)v33;
            unint64_t v120 = HIDWORD(v33);
            if (v52)
            {
              if (v52 == 1) {
                uint64_t v65 = v123;
              }
              else {
                uint64_t v65 = *(void *)(v33 + 16);
              }
              if ((v54 & 0x8000000000000000) == 0) {
                goto LABEL_35;
              }
              goto LABEL_67;
            }
            if ((v54 & 0x8000000000000000) == 0)
            {
              uint64_t v65 = 0;
LABEL_35:
              uint64_t v121 = v33 >> 32;
              uint64_t v122 = BYTE6(v125);
              unint64_t v127 = v125 & 0x3FFFFFFFFFFFFFFFLL;
              while (v64)
              {
                if (v52)
                {
                  if (v52 == 1)
                  {
                    if (v65 < v123 || v65 >= v121) {
                      goto LABEL_61;
                    }
                    uint64_t v66 = sub_24D0067D0();
                    if (!v66) {
                      goto LABEL_71;
                    }
                    uint64_t v67 = v66;
                    uint64_t v68 = sub_24D0067F0();
                    uint64_t v69 = v65 - v68;
                    if (__OFSUB__(v65, v68)) {
                      goto LABEL_64;
                    }
                  }
                  else
                  {
                    if (v65 < *(void *)(v33 + 16)) {
                      goto LABEL_63;
                    }
                    if (v65 >= *(void *)(v33 + 24)) {
                      goto LABEL_65;
                    }
                    uint64_t v71 = sub_24D0067D0();
                    if (!v71) {
                      goto LABEL_72;
                    }
                    uint64_t v67 = v71;
                    uint64_t v72 = sub_24D0067F0();
                    uint64_t v69 = v65 - v72;
                    if (__OFSUB__(v65, v72)) {
                      goto LABEL_66;
                    }
                  }
                  char v70 = *(unsigned char *)(v67 + v69);
                }
                else
                {
                  if (v65 >= v122) {
                    goto LABEL_62;
                  }
                  LOWORD(aBlock) = v33;
                  BYTE2(aBlock) = BYTE2(v33);
                  BYTE3(aBlock) = BYTE3(v33);
                  BYTE4(aBlock) = v120;
                  BYTE5(aBlock) = BYTE5(v33);
                  BYTE6(aBlock) = BYTE6(v33);
                  HIBYTE(aBlock) = HIBYTE(v33);
                  LODWORD(v132) = v125;
                  WORD2(v132) = WORD2(v125);
                  char v70 = *((unsigned char *)&aBlock + v65);
                }
                uint64_t v73 = swift_allocObject();
                *(_OWORD *)(v73 + 16) = v126;
                *(void *)(v73 + 56) = MEMORY[0x263F8E778];
                *(void *)(v73 + 64) = MEMORY[0x263F8E7C0];
                *(unsigned char *)(v73 + 32) = v70;
                uint64_t v74 = sub_24D006A70();
                uint64_t v76 = v75;
                uint64_t v130 = v53;
                unint64_t v78 = *(void *)(v53 + 16);
                unint64_t v77 = *(void *)(v53 + 24);
                if (v78 >= v77 >> 1)
                {
                  sub_24CFEFC38(v77 > 1, v78 + 1, 1);
                  uint64_t v53 = v130;
                }
                *(void *)(v53 + 16) = v78 + 1;
                uint64_t v79 = v53 + 16 * v78;
                *(void *)(v79 + 32) = v74;
                *(void *)(v79 + 40) = v76;
                ++v65;
                --v64;
                --v54;
                int v52 = v129;
                if (!v54)
                {
                  uint64_t v12 = v116;
                  uint64_t v11 = v115;
                  unint64_t v35 = v125;
                  goto LABEL_56;
                }
              }
              __break(1u);
LABEL_61:
              __break(1u);
LABEL_62:
              __break(1u);
LABEL_63:
              __break(1u);
LABEL_64:
              __break(1u);
LABEL_65:
              __break(1u);
LABEL_66:
              __break(1u);
LABEL_67:
              __break(1u);
LABEL_68:
              __break(1u);
LABEL_69:
              __break(1u);
            }
            __break(1u);
LABEL_71:
            __break(1u);
LABEL_72:
            __break(1u);
          }
          uint64_t v12 = v116;
LABEL_56:
          id v47 = v105;
LABEL_57:
          uint64_t aBlock = v53;
          __swift_instantiateConcreteTypeFromMangledName(&qword_26B182FE0);
          sub_24CFF35E0((unint64_t *)&qword_26B182FE8, &qword_26B182FE0);
          uint64_t v80 = sub_24D006A40();
          uint64_t v82 = v81;
          swift_bridgeObjectRelease();
          uint64_t v83 = v108;
          unint64_t v84 = v107;
          v108[12] = MEMORY[0x263F8D310];
          v83[13] = v84;
          v83[9] = v80;
          v83[10] = v82;
          sub_24D000014(0, (unint64_t *)&qword_26B183188);
          BOOL v85 = (void *)sub_24D006C50();
          sub_24D006920();
          swift_bridgeObjectRelease();

          sub_24CFE71CC(v33, v35);
          break;
        case 2:
          id v105 = v47;
          uint64_t v63 = *(void *)(v33 + 16);
          uint64_t v62 = *(void *)(v33 + 24);
          uint64_t v54 = v62 - v63;
          if (!__OFSUB__(v62, v63)) {
            goto LABEL_26;
          }
          goto LABEL_69;
        case 3:
          goto LABEL_57;
        default:
          id v105 = v47;
          uint64_t v54 = BYTE6(v35);
          goto LABEL_26;
      }
LABEL_5:
      id v14 = objc_msgSend(v118, sel_nextObject);
      if (!v14) {
        goto LABEL_59;
      }
    }
    (*v117)(v11, 1, 1, v124);
LABEL_13:
    sub_24D000728((uint64_t)v11);
    id v42 = objc_msgSend(v14, sel_bundleIdentifier);
    if (v42)
    {
      uint64_t v43 = v42;
      unint64_t v129 = sub_24D006A60();
      unint64_t v45 = v44;
    }
    else
    {
      unint64_t v129 = 0;
      unint64_t v45 = 0;
    }
    id v55 = objc_msgSend(v14, sel_URL);
    sub_24D006870();

    id v56 = objc_msgSend(v14, sel_uniqueInstallIdentifier);
    if (v56)
    {
      uint64_t v57 = v56;
      uint64_t v58 = sub_24D0068A0();
      unint64_t v60 = v59;
    }
    else
    {
      uint64_t v58 = 0;
      unint64_t v60 = 0xF000000000000000;
    }
    id v61 = objc_msgSend(v14, sel_driverExtensionPaths);
    if (v61)
    {
      uint64_t v15 = v61;
      uint64_t v16 = sub_24D006B70();
    }
    else
    {
      uint64_t v16 = 0;
    }
    unint64_t v17 = v125;
    sub_24CFE7000(v33, v125);
    id v18 = objc_msgSend(v14, sel_localizedName);
    uint64_t v19 = sub_24D006A60();
    uint64_t v21 = v20;

    unint64_t v22 = v112;
    unint64_t *v112 = v129;
    v22[1] = v45;
    unint64_t v23 = (int *)v124;
    (*v111)((char *)v22 + *(int *)(v124 + 20), v119, v114);
    uint64_t v24 = (uint64_t *)((char *)v22 + v23[6]);
    uint64_t *v24 = v58;
    v24[1] = v60;
    *(unint64_t *)((char *)v22 + v23[7]) = v16;
    id v25 = (uint64_t *)((char *)v22 + v23[8]);
    *id v25 = v33;
    v25[1] = v17;
    uint64_t v26 = (uint64_t *)((char *)v22 + v23[9]);
    uint64_t *v26 = v19;
    v26[1] = v21;
    uint64_t v27 = (uint64_t)v22;
    uint64_t v28 = v113;
    sub_24D0007FC(v27, v113, (uint64_t (*)(void))type metadata accessor for SettingsApplicationRecord);
    sub_24CFE7000(v33, v17);
    uint64_t v12 = v116;
    uint64_t v29 = *(void *)(v116 + 16);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t aBlock = v29;
    *(void *)(v12 + 16) = 0x8000000000000000;
    sub_24CFFEB14(v28, v33, v17, isUniquelyReferenced_nonNull_native);
    *(void *)(v12 + 16) = aBlock;
    swift_bridgeObjectRelease();
    sub_24CFE71CC(v33, v17);

    sub_24CFE71CC(v33, v17);
    uint64_t v11 = v115;
    goto LABEL_5;
  }
LABEL_59:
  sub_24D000014(0, &qword_26B183180);
  id v86 = (void *)sub_24D006C10();
  unsigned __int8 v87 = (void *)swift_allocObject();
  uint64_t v88 = v96;
  uint64_t v89 = v97;
  v87[2] = v96;
  v87[3] = v89;
  v87[4] = v12;
  v135 = sub_24D00071C;
  uint64_t v136 = v87;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v132 = 1107296256;
  uint64_t v133 = sub_24CFF7198;
  v134 = &block_descriptor_42;
  uint64_t v90 = _Block_copy(&aBlock);
  id v91 = v88;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_release();
  uint64_t v92 = v98;
  sub_24D0069F0();
  uint64_t aBlock = MEMORY[0x263F8EE78];
  sub_24D000558(&qword_26B183130, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B183148);
  sub_24CFF35E0(&qword_26B183150, &qword_26B183148);
  uint64_t v93 = v100;
  uint64_t v94 = v103;
  sub_24D006CA0();
  MEMORY[0x25331AD80](0, v92, v93, v90);
  _Block_release(v90);

  (*(void (**)(char *, uint64_t))(v102 + 8))(v93, v94);
  (*(void (**)(char *, uint64_t))(v99 + 8))(v92, v101);
  return swift_release();
}

uint64_t sub_24CFFABC0(uint64_t a1, void *a2, uint64_t a3)
{
  swift_beginAccess();
  uint64_t v5 = *(void *)(a3 + 16);
  swift_bridgeObjectRetain();
  sub_24CFF7CC0(a2, v5);
  return swift_bridgeObjectRelease();
}

uint64_t sub_24CFFAC30(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t DriverManager.setDriverState(_:approved:)(char *a1, char a2)
{
  if (a2) {
    int v2 = 1;
  }
  else {
    int v2 = 2;
  }
  return DriverManager.setDriverState(driverApprovalState:state:)(a1, v2);
}

uint64_t DriverManager.setDriverState(driverApprovalState:state:)(char *a1, int a2)
{
  int v28 = a2;
  uint64_t v3 = sub_24D0068E0();
  uint64_t v30 = *(void *)(v3 - 8);
  uint64_t v31 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_24D006A10();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (void *)((char *)v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v10 = sub_24D006950();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  id v13 = (char *)v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24D006C40();
  v27[1] = sub_24D000014(0, (unint64_t *)&qword_26B183188);
  id v14 = (void *)sub_24D006C50();
  sub_24D006940();
  sub_24D006930();

  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  sub_24D000014(0, &qword_26B183180);
  *uint64_t v9 = sub_24D006C10();
  (*(void (**)(uint64_t *, void, uint64_t))(v7 + 104))(v9, *MEMORY[0x263F8F0E0], v6);
  LOBYTE(v13) = sub_24D006A20();
  uint64_t result = (*(uint64_t (**)(uint64_t *, uint64_t))(v7 + 8))(v9, v6);
  if (v13)
  {
    uint64_t v17 = *(void *)&a1[OBJC_IVAR____SwiftDriverApprovalState_driver];
    uint64_t v16 = *(void *)&a1[OBJC_IVAR____SwiftDriverApprovalState_driver + 8];
    type metadata accessor for DriverKitDriver();
    swift_bridgeObjectRetain();
    uint64_t v18 = sub_24D000A64();
    uint64_t v20 = v19;
    uint64_t v21 = swift_allocObject();
    *(void *)(v21 + 16) = a1;
    char v22 = v28;
    *(unsigned char *)(v21 + 24) = v28;
    unint64_t v23 = v29;
    *(void *)(v21 + 32) = v29;
    type metadata accessor for ApprovalStateUpdateRequest();
    uint64_t v24 = swift_allocObject();
    *(void *)(v24 + 16) = v17;
    *(void *)(v24 + 24) = v16;
    *(void *)(v24 + 32) = v18;
    *(void *)(v24 + 40) = v20;
    *(unsigned char *)(v24 + 48) = v22;
    *(void *)(v24 + 56) = sub_24D000104;
    *(void *)(v24 + 64) = v21;
    id v25 = a1;
    v23;
    sub_24D0068D0();
    (*(void (**)(uint64_t, char *, uint64_t))(v30 + 32))(v24 + OBJC_IVAR____TtC16DriverManagement26ApprovalStateUpdateRequest_timestamp, v5, v31);
    swift_getKeyPath();
    swift_getKeyPath();
    uint64_t v32 = v24;
    uint64_t v26 = v25;
    swift_retain();
    sub_24D0069C0();
    DriverKitDaemonClient.enqueueApprovalStateUpdate(request:)(v24);
    return swift_release();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_24CFFB1D8(void *a1, char a2, void *a3, char a4, void *a5)
{
  uint64_t v10 = sub_24D0069E0();
  uint64_t v26 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = sub_24D006A00();
  uint64_t v13 = *(void *)(v25 - 8);
  MEMORY[0x270FA5388](v25);
  uint64_t v15 = (char *)&v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24D000014(0, &qword_26B183180);
  uint64_t v24 = sub_24D006C10();
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = a3;
  *(void *)(v16 + 24) = a1;
  char v17 = a2 & 1;
  *(unsigned char *)(v16 + 32) = a2 & 1;
  *(unsigned char *)(v16 + 33) = a4;
  *(void *)(v16 + 40) = a5;
  aBlock[4] = sub_24D000984;
  aBlock[5] = v16;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_24CFF7198;
  aBlock[3] = &block_descriptor_54;
  uint64_t v18 = _Block_copy(aBlock);
  id v19 = a3;
  sub_24D000998(a1, v17);
  id v20 = a5;
  swift_release();
  sub_24D0069F0();
  aBlock[0] = MEMORY[0x263F8EE78];
  sub_24D000558(&qword_26B183130, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B183148);
  sub_24CFF35E0(&qword_26B183150, &qword_26B183148);
  sub_24D006CA0();
  uint64_t v21 = (void *)v24;
  MEMORY[0x25331AD80](0, v15, v12, v18);
  _Block_release(v18);

  (*(void (**)(char *, uint64_t))(v26 + 8))(v12, v10);
  return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v25);
}

uint64_t sub_24CFFB4EC(void *a1, uint64_t a2, char a3, char a4)
{
  swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v25 = 0;
  id v7 = a1;
  uint64_t result = sub_24D0069C0();
  if (a3)
  {
    sub_24D006BD0();
    __swift_instantiateConcreteTypeFromMangledName(qword_26B1831A0);
    uint64_t v9 = swift_allocObject();
    *(_OWORD *)(v9 + 16) = xmmword_24D0089E0;
    id v10 = v7;
    id v11 = objc_msgSend(v10, sel_description);
    uint64_t v12 = sub_24D006A60();
    uint64_t v14 = v13;

    uint64_t v15 = MEMORY[0x263F8D310];
    *(void *)(v9 + 56) = MEMORY[0x263F8D310];
    unint64_t v16 = sub_24D000120();
    unint64_t v17 = v16;
    *(void *)(v9 + 64) = v16;
    *(void *)(v9 + 32) = v12;
    *(void *)(v9 + 40) = v14;
    if (qword_26B182F58 != -1) {
      unint64_t v16 = swift_once();
    }
    MEMORY[0x270FA5388](v16);
    v24[16] = a4;
    uint64_t v18 = swift_bridgeObjectRetain();
    uint64_t v19 = sub_24CFF1368(v18, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_24D0009EC, (uint64_t)v24);
    swift_bridgeObjectRelease();
    id v20 = sub_24CFE9D04(v19);
    uint64_t v22 = v21;
    uint64_t result = swift_release();
    if (v22)
    {
      *(void *)(v9 + 96) = v15;
      *(void *)(v9 + 104) = v17;
      *(void *)(v9 + 72) = v20;
      *(void *)(v9 + 80) = v22;
      sub_24D000014(0, (unint64_t *)&qword_26B183188);
      uint64_t v23 = (void *)sub_24D006C50();
      sub_24D006920();
      swift_bridgeObjectRelease();

      return sub_24CFF6F24();
    }
    else
    {
      __break(1u);
    }
  }
  return result;
}

uint64_t DriverManager.driverApprovalStatesForThirdPartyApp(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void **)(v2 + OBJC_IVAR____SwiftDriverManager_driverApprovalStatesLock);
  objc_msgSend(v5, sel_lock);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24D0069B0();
  swift_release();
  swift_release();
  v8[2] = a1;
  v8[3] = a2;
  uint64_t v6 = sub_24CFFBDD8((uint64_t (*)(id *))sub_24D0009D0, (uint64_t)v8, v8[5]);
  objc_msgSend(v5, sel_unlock);
  return v6;
}

unint64_t sub_24CFFB92C(uint64_t *a1, uint64_t a2, unint64_t a3)
{
  uint64_t v34 = a2;
  uint64_t v5 = type metadata accessor for SettingsApplicationRecord();
  MEMORY[0x270FA5388](v5 - 8);
  unint64_t v35 = (uint64_t *)((char *)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v7 = type metadata accessor for DriverKitDriverApp();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  id v11 = (char *)&v34 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v34 - v12;
  uint64_t v14 = type metadata accessor for DriverKitDriverSource();
  uint64_t v15 = MEMORY[0x270FA5388](v14 - 8);
  unint64_t v17 = (char *)&v34 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = MEMORY[0x270FA5388](v15);
  id v20 = (char *)&v34 - v19;
  MEMORY[0x270FA5388](v18);
  uint64_t v22 = (char *)&v34 - v21;
  uint64_t v23 = *a1;
  if (!a3)
  {
    uint64_t v26 = OBJC_IVAR____SwiftDriverApprovalState_driver;
    uint64_t v27 = type metadata accessor for DriverKitDriver();
    sub_24D000864(v23 + *(int *)(v27 + 20) + v26, (uint64_t)v22, (uint64_t (*)(void))type metadata accessor for DriverKitDriverSource);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v22, 1, v7) != 1)
    {
      sub_24D0008CC((uint64_t)v22, (uint64_t (*)(void))type metadata accessor for DriverKitDriverSource);
      LOBYTE(a3) = 1;
      return a3 & 1;
    }
    goto LABEL_17;
  }
  if (a3 == 1)
  {
    uint64_t v24 = OBJC_IVAR____SwiftDriverApprovalState_driver;
    uint64_t v25 = type metadata accessor for DriverKitDriver();
    sub_24D000864(v23 + *(int *)(v25 + 20) + v24, (uint64_t)v17, (uint64_t (*)(void))type metadata accessor for DriverKitDriverSource);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v17, 1, v7) != 1)
    {
      sub_24D0008CC((uint64_t)v17, (uint64_t (*)(void))type metadata accessor for DriverKitDriverSource);
      LOBYTE(a3) = 0;
    }
    return a3 & 1;
  }
  uint64_t v28 = OBJC_IVAR____SwiftDriverApprovalState_driver;
  uint64_t v29 = type metadata accessor for DriverKitDriver();
  sub_24D000864(v23 + *(int *)(v29 + 20) + v28, (uint64_t)v20, (uint64_t (*)(void))type metadata accessor for DriverKitDriverSource);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v20, 1, v7) == 1)
  {
LABEL_17:
    LOBYTE(a3) = 0;
    return a3 & 1;
  }
  sub_24D0007FC((uint64_t)v20, (uint64_t)v13, (uint64_t (*)(void))type metadata accessor for DriverKitDriverApp);
  sub_24D000864((uint64_t)v13, (uint64_t)v11, (uint64_t (*)(void))type metadata accessor for DriverKitDriverApp);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_24D0008CC((uint64_t)v13, (uint64_t (*)(void))type metadata accessor for DriverKitDriverApp);
    sub_24D0008CC((uint64_t)v11, (uint64_t (*)(void))type metadata accessor for DriverKitDriverApp);
    goto LABEL_17;
  }
  uint64_t v30 = v35;
  sub_24D0007FC((uint64_t)v11, (uint64_t)v35, (uint64_t (*)(void))type metadata accessor for SettingsApplicationRecord);
  uint64_t v31 = v30[1];
  if (!v31)
  {
    swift_bridgeObjectRetain();
    sub_24D0008CC((uint64_t)v30, (uint64_t (*)(void))type metadata accessor for SettingsApplicationRecord);
    sub_24D0008CC((uint64_t)v13, (uint64_t (*)(void))type metadata accessor for DriverKitDriverApp);
    sub_24CFFFFE0(v34, a3);
    goto LABEL_17;
  }
  if (*v30 == v34 && v31 == a3) {
    LOBYTE(a3) = 1;
  }
  else {
    LOBYTE(a3) = sub_24D006ED0();
  }
  swift_bridgeObjectRetain();
  sub_24D0008CC((uint64_t)v30, (uint64_t (*)(void))type metadata accessor for SettingsApplicationRecord);
  sub_24D0008CC((uint64_t)v13, (uint64_t (*)(void))type metadata accessor for DriverKitDriverApp);
  swift_bridgeObjectRelease();
  return a3 & 1;
}

uint64_t sub_24CFFBDD8(uint64_t (*a1)(id *), uint64_t a2, unint64_t a3)
{
  unint64_t v4 = a3;
  uint64_t v19 = MEMORY[0x263F8EE78];
  if (a3 >> 62) {
    goto LABEL_18;
  }
  uint64_t v7 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v7)
  {
    while (1)
    {
      unint64_t v8 = 0;
      uint64_t v16 = v4 & 0xFFFFFFFFFFFFFF8;
      unint64_t v17 = v4 & 0xC000000000000001;
      unint64_t v15 = v4;
      while (v17)
      {
        id v9 = (id)MEMORY[0x25331AE40](v8, v4);
LABEL_9:
        uint64_t v10 = v9;
        unint64_t v11 = v8 + 1;
        if (__OFADD__(v8, 1)) {
          goto LABEL_17;
        }
        id v18 = v9;
        uint64_t v12 = a2;
        char v13 = a1(&v18);
        if (v3)
        {
          swift_bridgeObjectRelease();

          swift_release();
          return v12;
        }
        if (v13)
        {
          sub_24D006D40();
          sub_24D006D60();
          unint64_t v4 = v15;
          sub_24D006D70();
          sub_24D006D50();
        }
        else
        {
        }
        ++v8;
        if (v11 == v7)
        {
          uint64_t v12 = v19;
          goto LABEL_20;
        }
      }
      if (v8 < *(void *)(v16 + 16)) {
        break;
      }
      __break(1u);
LABEL_17:
      __break(1u);
LABEL_18:
      uint64_t v7 = sub_24D006DA0();
      if (!v7) {
        goto LABEL_19;
      }
    }
    id v9 = *(id *)(v4 + 8 * v8 + 32);
    goto LABEL_9;
  }
LABEL_19:
  uint64_t v12 = MEMORY[0x263F8EE78];
LABEL_20:
  swift_bridgeObjectRelease();
  return v12;
}

uint64_t sub_24CFFBF84@<X0>(uint64_t *a1@<X8>)
{
  swift_getObjectType();
  uint64_t result = sub_24D006960();
  *a1 = result;
  return result;
}

uint64_t sub_24CFFBFC4@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24D0069B0();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_24CFFC044(uint64_t a1, void **a2)
{
  uint64_t v2 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  id v3 = v2;
  return sub_24D0069C0();
}

uint64_t sub_24CFFC0BC@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24D0069B0();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_24CFFC13C(uint64_t a1, void **a2)
{
  uint64_t v2 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  id v3 = v2;
  return sub_24D0069C0();
}

void *sub_24CFFC1B4(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_26984D448);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_24CFFC21C(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3 = a1;
  uint64_t v4 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    uint64_t v10 = sub_24D006B00();
    uint64_t v11 = v10 + (v4 << 16);
    unint64_t v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v13 = v12;
    }
    return v13 | 4;
  }
  else
  {
    uint64_t v5 = MEMORY[0x25331AC50](15, a1 >> 16);
    uint64_t v6 = v5 + (v4 << 16);
    unint64_t v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v8 = v7;
    }
    return v8 | 8;
  }
}

uint64_t sub_24CFFC298(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_24CFFC36C(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_24D000640((uint64_t)v12, *a3);
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
      sub_24D000640((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_24CFFC36C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_24D006C70();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_24CFFC528(a5, a6);
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
  uint64_t v8 = sub_24D006D20();
  if (!v8)
  {
    sub_24D006D80();
    __break(1u);
LABEL_17:
    uint64_t result = sub_24D006DE0();
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

uint64_t sub_24CFFC528(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_24CFFC5C0(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_24CFFC738(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_24CFFC738(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_24CFFC5C0(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_24CFFC1B4(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_24D006CD0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_24D006D80();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_24D006AE0();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_24D006DE0();
    __break(1u);
LABEL_14:
    uint64_t result = sub_24D006D80();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

uint64_t sub_24CFFC738(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26984D448);
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
  unint64_t v13 = a4 + 32;
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
  uint64_t result = sub_24D006DE0();
  __break(1u);
  return result;
}

uint64_t sub_24CFFC888(uint64_t a1, char a2)
{
  unint64_t v3 = v2;
  uint64_t v5 = type metadata accessor for SettingsApplicationRecord();
  uint64_t v40 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5 - 8);
  int64_t v7 = (char *)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B183190);
  char v9 = a2;
  uint64_t v10 = sub_24D006DC0();
  uint64_t v11 = v10;
  if (*(void *)(v8 + 16))
  {
    uint64_t v37 = v2;
    uint64_t v12 = 1 << *(unsigned char *)(v8 + 32);
    uint64_t v13 = *(void *)(v8 + 64);
    char v39 = (void *)(v8 + 64);
    if (v12 < 64) {
      uint64_t v14 = ~(-1 << v12);
    }
    else {
      uint64_t v14 = -1;
    }
    unint64_t v15 = v14 & v13;
    int64_t v38 = (unint64_t)(v12 + 63) >> 6;
    uint64_t v16 = v10 + 64;
    uint64_t result = swift_retain();
    int64_t v18 = 0;
    while (1)
    {
      if (v15)
      {
        unint64_t v21 = __clz(__rbit64(v15));
        v15 &= v15 - 1;
        unint64_t v22 = v21 | (v18 << 6);
      }
      else
      {
        int64_t v23 = v18 + 1;
        if (__OFADD__(v18, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v23 >= v38) {
          goto LABEL_34;
        }
        unint64_t v24 = v39[v23];
        ++v18;
        if (!v24)
        {
          int64_t v18 = v23 + 1;
          if (v23 + 1 >= v38) {
            goto LABEL_34;
          }
          unint64_t v24 = v39[v18];
          if (!v24)
          {
            int64_t v25 = v23 + 2;
            if (v25 >= v38)
            {
LABEL_34:
              swift_release();
              unint64_t v3 = v37;
              if (v9)
              {
                uint64_t v36 = 1 << *(unsigned char *)(v8 + 32);
                if (v36 >= 64) {
                  bzero(v39, ((unint64_t)(v36 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *char v39 = -1 << v36;
                }
                *(void *)(v8 + 16) = 0;
              }
              break;
            }
            unint64_t v24 = v39[v25];
            if (!v24)
            {
              while (1)
              {
                int64_t v18 = v25 + 1;
                if (__OFADD__(v25, 1)) {
                  goto LABEL_41;
                }
                if (v18 >= v38) {
                  goto LABEL_34;
                }
                unint64_t v24 = v39[v18];
                ++v25;
                if (v24) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v18 = v25;
          }
        }
LABEL_21:
        unint64_t v15 = (v24 - 1) & v24;
        unint64_t v22 = __clz(__rbit64(v24)) + (v18 << 6);
      }
      uint64_t v26 = *(void *)(v40 + 72);
      uint64_t v27 = *(void *)(v8 + 56) + v26 * v22;
      unint64_t v28 = *(void *)(*(void *)(v8 + 48) + 16 * v22 + 8);
      long long v41 = *(_OWORD *)(*(void *)(v8 + 48) + 16 * v22);
      if (v9)
      {
        sub_24D0007FC(v27, (uint64_t)v7, (uint64_t (*)(void))type metadata accessor for SettingsApplicationRecord);
      }
      else
      {
        sub_24D000864(v27, (uint64_t)v7, (uint64_t (*)(void))type metadata accessor for SettingsApplicationRecord);
        sub_24CFE7000(v41, v28);
      }
      sub_24D006F30();
      sub_24D0068B0();
      uint64_t result = sub_24D006F60();
      uint64_t v29 = -1 << *(unsigned char *)(v11 + 32);
      unint64_t v30 = result & ~v29;
      unint64_t v31 = v30 >> 6;
      if (((-1 << v30) & ~*(void *)(v16 + 8 * (v30 >> 6))) != 0)
      {
        unint64_t v19 = __clz(__rbit64((-1 << v30) & ~*(void *)(v16 + 8 * (v30 >> 6)))) | v30 & 0x7FFFFFFFFFFFFFC0;
        long long v20 = v41;
      }
      else
      {
        char v32 = 0;
        unint64_t v33 = (unint64_t)(63 - v29) >> 6;
        long long v20 = v41;
        do
        {
          if (++v31 == v33 && (v32 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          BOOL v34 = v31 == v33;
          if (v31 == v33) {
            unint64_t v31 = 0;
          }
          v32 |= v34;
          uint64_t v35 = *(void *)(v16 + 8 * v31);
        }
        while (v35 == -1);
        unint64_t v19 = __clz(__rbit64(~v35)) + (v31 << 6);
      }
      *(void *)(v16 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
      *(_OWORD *)(*(void *)(v11 + 48) + 16 * v19) = v20;
      uint64_t result = sub_24D0007FC((uint64_t)v7, *(void *)(v11 + 56) + v26 * v19, (uint64_t (*)(void))type metadata accessor for SettingsApplicationRecord);
      ++*(void *)(v11 + 16);
    }
  }
  uint64_t result = swift_release();
  *unint64_t v3 = v11;
  return result;
}

void sub_24CFFCC5C(uint64_t *a1)
{
  uint64_t v2 = v1;
  uint64_t v203 = type metadata accessor for SettingsApplicationRecord();
  uint64_t v4 = MEMORY[0x270FA5388](v203);
  uint64_t v202 = (uint64_t)&v184 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v201 = (uint64_t)&v184 - v7;
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v184 - v9;
  MEMORY[0x270FA5388](v8);
  uint64_t v191 = (uint64_t)&v184 - v11;
  uint64_t v204 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1830B0);
  uint64_t v12 = MEMORY[0x270FA5388](v204);
  uint64_t v207 = (uint64_t)&v184 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v194 = (uint64_t)&v184 - v14;
  uint64_t v214 = type metadata accessor for DriverKitDriverApp();
  uint64_t v15 = *(void *)(v214 - 8);
  uint64_t v16 = MEMORY[0x270FA5388](v214);
  int64_t v18 = (char *)&v184 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = MEMORY[0x270FA5388](v16);
  unint64_t v21 = (char *)&v184 - v20;
  uint64_t v22 = MEMORY[0x270FA5388](v19);
  unint64_t v24 = (char *)&v184 - v23;
  MEMORY[0x270FA5388](v22);
  uint64_t v26 = (char *)&v184 - v25;
  uint64_t v209 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1830C8);
  uint64_t v27 = MEMORY[0x270FA5388](v209);
  uint64_t v213 = (uint64_t)&v184 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v27);
  uint64_t v197 = (uint64_t)&v184 - v29;
  uint64_t v30 = a1[1];
  uint64_t v31 = sub_24D006EB0();
  if (v31 >= v30)
  {
    if (v30 < 0) {
      goto LABEL_170;
    }
    if (v30) {
      sub_24CFFDF88(0, v30, 1, a1);
    }
    return;
  }
  if (v30 >= 0) {
    uint64_t v32 = v30;
  }
  else {
    uint64_t v32 = v30 + 1;
  }
  if (v30 < -1) {
    goto LABEL_178;
  }
  v188 = v10;
  uint64_t v190 = v31;
  v192 = v26;
  v193 = v24;
  v206 = v18;
  v185 = a1;
  if (v30 < 2)
  {
    uint64_t v36 = (char *)MEMORY[0x263F8EE78];
    uint64_t v221 = MEMORY[0x263F8EE78];
    v200 = (void **)((MEMORY[0x263F8EE78] & 0xFFFFFFFFFFFFFF8) + 32);
    if (v30 != 1)
    {
      unint64_t v39 = *(void *)(MEMORY[0x263F8EE78] + 16);
LABEL_136:
      if (v39 >= 2)
      {
        uint64_t v178 = *v185;
        do
        {
          unint64_t v179 = v39 - 2;
          if (v39 < 2) {
            goto LABEL_165;
          }
          if (!v178) {
            goto LABEL_177;
          }
          uint64_t v180 = *(void *)&v36[16 * v179 + 32];
          uint64_t v181 = *(void *)&v36[16 * v39 + 24];
          sub_24CFFE63C((void **)(v178 + 8 * v180), (id *)(v178 + 8 * *(void *)&v36[16 * v39 + 16]), v178 + 8 * v181, v200);
          if (v2) {
            break;
          }
          if (v181 < v180) {
            goto LABEL_166;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v36 = sub_24CFFEB00((uint64_t)v36);
          }
          if (v179 >= *((void *)v36 + 2)) {
            goto LABEL_167;
          }
          v182 = &v36[16 * v179 + 32];
          *(void *)v182 = v180;
          *((void *)v182 + 1) = v181;
          unint64_t v183 = *((void *)v36 + 2);
          if (v39 > v183) {
            goto LABEL_168;
          }
          memmove(&v36[16 * v39 + 16], &v36[16 * v39 + 32], 16 * (v183 - v39));
          *((void *)v36 + 2) = v183 - 1;
          unint64_t v39 = v183 - 1;
        }
        while (v183 > 2);
      }
LABEL_147:
      swift_bridgeObjectRelease();
      *(void *)((v221 & 0xFFFFFFFFFFFFFF8) + 0x10) = 0;
      sub_24D006B80();
      swift_bridgeObjectRelease();
      return;
    }
  }
  else
  {
    unint64_t v33 = a1;
    uint64_t v34 = v32 >> 1;
    type metadata accessor for DriverApprovalState();
    uint64_t v35 = sub_24D006BA0();
    *(void *)((v35 & 0xFFFFFFFFFFFFFF8) + 0x10) = v34;
    a1 = v33;
    v200 = (void **)((v35 & 0xFFFFFFFFFFFFFF8) + 32);
    uint64_t v221 = v35;
  }
  uint64_t v37 = *a1;
  v208 = (uint64_t (**)(uint64_t, uint64_t, uint64_t))(v15 + 48);
  uint64_t v187 = v37 + 16;
  uint64_t v186 = v37 - 8;
  uint64_t v36 = (char *)MEMORY[0x263F8EE78];
  v205 = v21;
  uint64_t v38 = 0;
  uint64_t v196 = v30;
  uint64_t v210 = v37;
LABEL_15:
  uint64_t v40 = v38;
  uint64_t v41 = v38 + 1;
  uint64_t v198 = v38;
  if (v38 + 1 < v30)
  {
    id v42 = *(char **)(v37 + 8 * v41);
    uint64_t v43 = *(char **)(v37 + 8 * v40);
    unint64_t v44 = (uint64_t *)&v42[OBJC_IVAR____SwiftDriverApprovalState_driver];
    unint64_t v45 = (uint64_t *)&v43[OBJC_IVAR____SwiftDriverApprovalState_driver];
    uint64_t v46 = v42;
    id v47 = v43;
    uint64_t v30 = v196;
    id v48 = v47;
    LODWORD(v195) = _s16DriverManagement0a3KitA0V1loiySbAC_ACtFZ_0(v44, v45);

    uint64_t v40 = v198;
    uint64_t v41 = v198 + 2;
    if (v198 + 2 < v30)
    {
      v189 = v36;
      uint64_t v49 = v198;
      unint64_t v199 = sub_24CFE8098();
      uint64_t v50 = (void **)(v187 + 8 * v49);
      int v51 = v195;
      while (1)
      {
        uint64_t v212 = v41;
        uint64_t v54 = v2;
        id v56 = (char *)*(v50 - 1);
        id v55 = *v50;
        uint64_t v57 = (uint64_t *)((char *)*v50 + OBJC_IVAR____SwiftDriverApprovalState_driver);
        uint64_t v58 = &v56[OBJC_IVAR____SwiftDriverApprovalState_driver];
        uint64_t v59 = v57[1];
        uint64_t v219 = *v57;
        uint64_t v220 = v59;
        uint64_t v60 = *(void *)&v56[OBJC_IVAR____SwiftDriverApprovalState_driver + 8];
        uint64_t v217 = *(void *)&v56[OBJC_IVAR____SwiftDriverApprovalState_driver];
        uint64_t v218 = v60;
        v215 = v55;
        v216 = v56;
        uint64_t v211 = sub_24D006C80();
        uint64_t v61 = *(int *)(type metadata accessor for DriverKitDriver() + 20);
        uint64_t v62 = (uint64_t)&v58[v61];
        uint64_t v63 = v197;
        uint64_t v64 = v197 + *(int *)(v209 + 48);
        sub_24D000864((uint64_t)v57 + v61, v197, (uint64_t (*)(void))type metadata accessor for DriverKitDriverSource);
        sub_24D000864(v62, v64, (uint64_t (*)(void))type metadata accessor for DriverKitDriverSource);
        uint64_t v65 = *v208;
        uint64_t v66 = v214;
        LODWORD(v62) = (*v208)(v63, 1, v214);
        int v67 = v65(v64, 1, v66);
        if (v62 == 1)
        {
          uint64_t v2 = v54;
          uint64_t v30 = v196;
          uint64_t v41 = v212;
          id v53 = v215;
          int v52 = v216;
          if (v67 != 1)
          {
            sub_24D0008CC(v64, (uint64_t (*)(void))type metadata accessor for DriverKitDriverSource);

            if ((v51 & 1) == 0) {
              goto LABEL_83;
            }
            goto LABEL_21;
          }
        }
        else
        {
          if (v67 == 1)
          {
            sub_24D0008CC(v197, (uint64_t (*)(void))type metadata accessor for DriverKitDriverApp);

            uint64_t v2 = v54;
            uint64_t v30 = v196;
            uint64_t v41 = v212;
            if (v51) {
              goto LABEL_132;
            }
            goto LABEL_21;
          }
          uint64_t v68 = (uint64_t)v192;
          sub_24D0007FC(v197, (uint64_t)v192, (uint64_t (*)(void))type metadata accessor for DriverKitDriverApp);
          uint64_t v69 = (uint64_t)v193;
          sub_24D0007FC(v64, (uint64_t)v193, (uint64_t (*)(void))type metadata accessor for DriverKitDriverApp);
          uint64_t v70 = v194;
          uint64_t v71 = v194 + *(int *)(v204 + 48);
          sub_24D000864(v68, v194, (uint64_t (*)(void))type metadata accessor for DriverKitDriverApp);
          sub_24D000864(v69, v71, (uint64_t (*)(void))type metadata accessor for DriverKitDriverApp);
          if (swift_getEnumCaseMultiPayload() == 1)
          {
            sub_24D0008CC(v69, (uint64_t (*)(void))type metadata accessor for DriverKitDriverApp);
            sub_24D0008CC(v68, (uint64_t (*)(void))type metadata accessor for DriverKitDriverApp);
            sub_24CFE71CC(*(void *)v70, *(void *)(v70 + 8));
            uint64_t v2 = v54;
            if (swift_getEnumCaseMultiPayload() != 1)
            {
              sub_24D0008CC(v71, (uint64_t (*)(void))type metadata accessor for DriverKitDriverApp);

              uint64_t v30 = v196;
              uint64_t v41 = v212;
              int v51 = v195;
              if ((v195 & 1) == 0)
              {
LABEL_83:
                uint64_t v36 = v189;
LABEL_84:
                uint64_t v40 = v198;
                if (v41 >= v30) {
                  goto LABEL_85;
                }
                goto LABEL_50;
              }
              goto LABEL_21;
            }
            sub_24CFE71CC(*(void *)v71, *(void *)(v71 + 8));
          }
          else
          {
            uint64_t v2 = v54;
            if (swift_getEnumCaseMultiPayload() == 1)
            {
              sub_24D0008CC((uint64_t)v193, (uint64_t (*)(void))type metadata accessor for DriverKitDriverApp);
              sub_24D0008CC((uint64_t)v192, (uint64_t (*)(void))type metadata accessor for DriverKitDriverApp);
              sub_24CFE71CC(*(void *)v71, *(void *)(v71 + 8));
              sub_24D0008CC(v194, (uint64_t (*)(void))type metadata accessor for SettingsApplicationRecord);

              uint64_t v30 = v196;
              uint64_t v41 = v212;
              int v51 = v195;
              if (v195)
              {
LABEL_132:
                uint64_t v36 = v189;
                uint64_t v81 = v210;
                uint64_t v40 = v198;
                if (v41 < v198) {
                  goto LABEL_171;
                }
                goto LABEL_41;
              }
              goto LABEL_21;
            }
            uint64_t v72 = v191;
            sub_24D0007FC(v194, v191, (uint64_t (*)(void))type metadata accessor for SettingsApplicationRecord);
            uint64_t v73 = (uint64_t)v188;
            sub_24D0007FC(v71, (uint64_t)v188, (uint64_t (*)(void))type metadata accessor for SettingsApplicationRecord);
            uint64_t v74 = *(int *)(v203 + 36);
            uint64_t v75 = *(void *)(v72 + v74 + 8);
            uint64_t v219 = *(void *)(v72 + v74);
            uint64_t v220 = v75;
            uint64_t v76 = (uint64_t *)(v73 + v74);
            uint64_t v78 = *v76;
            uint64_t v77 = v76[1];
            uint64_t v217 = v78;
            uint64_t v218 = v77;
            uint64_t v79 = sub_24D006C80();
            sub_24D0008CC(v73, (uint64_t (*)(void))type metadata accessor for SettingsApplicationRecord);
            sub_24D0008CC(v72, (uint64_t (*)(void))type metadata accessor for SettingsApplicationRecord);
            sub_24D0008CC((uint64_t)v193, (uint64_t (*)(void))type metadata accessor for DriverKitDriverApp);
            sub_24D0008CC((uint64_t)v192, (uint64_t (*)(void))type metadata accessor for DriverKitDriverApp);
            uint64_t v80 = v211;
            if (v79) {
              uint64_t v80 = v79;
            }
            uint64_t v211 = v80;
          }
          uint64_t v30 = v196;
          uint64_t v41 = v212;
          int v51 = v195;
          id v53 = v215;
          int v52 = v216;
        }

        if ((v51 ^ (v211 == -1))) {
          goto LABEL_48;
        }
LABEL_21:
        ++v41;
        ++v50;
        if (v30 == v41)
        {
          uint64_t v41 = v30;
LABEL_48:
          uint64_t v36 = v189;
          uint64_t v81 = v210;
          uint64_t v40 = v198;
          if (v51) {
            goto LABEL_40;
          }
          goto LABEL_49;
        }
      }
    }
    uint64_t v81 = v210;
    if (v195)
    {
LABEL_40:
      if (v41 < v40) {
        goto LABEL_171;
      }
LABEL_41:
      if (v40 < v41)
      {
        uint64_t v82 = (uint64_t *)(v186 + 8 * v41);
        uint64_t v83 = v41;
        uint64_t v84 = v40;
        BOOL v85 = (uint64_t *)(v81 + 8 * v40);
        while (1)
        {
          if (v84 != --v83)
          {
            if (!v81) {
              goto LABEL_176;
            }
            uint64_t v86 = *v85;
            uint64_t *v85 = *v82;
            uint64_t *v82 = v86;
          }
          ++v84;
          --v82;
          ++v85;
          if (v84 >= v83) {
            goto LABEL_84;
          }
        }
      }
    }
  }
LABEL_49:
  if (v41 >= v30) {
    goto LABEL_85;
  }
LABEL_50:
  if (__OFSUB__(v41, v40)) {
    goto LABEL_169;
  }
  if (v41 - v40 >= v190) {
    goto LABEL_85;
  }
  if (__OFADD__(v40, v190)) {
    goto LABEL_172;
  }
  if (v40 + v190 >= v30) {
    uint64_t v87 = v30;
  }
  else {
    uint64_t v87 = v40 + v190;
  }
  if (v87 >= v40)
  {
    if (v41 == v87) {
      goto LABEL_85;
    }
    v189 = v36;
    uint64_t v184 = v2;
    unint64_t v88 = sub_24CFE8098();
    uint64_t v89 = v210;
    uint64_t v211 = v88;
    unint64_t v90 = v186 + 8 * v41;
    uint64_t v195 = v87;
LABEL_60:
    id v91 = *(char **)(v89 + 8 * v41);
    uint64_t v92 = v198;
    unint64_t v199 = v90;
    uint64_t v212 = v41;
    while (1)
    {
      uint64_t v93 = *(void **)v90;
      uint64_t v94 = &v91[OBJC_IVAR____SwiftDriverApprovalState_driver];
      uint64_t v95 = (uint64_t *)(*(void *)v90 + OBJC_IVAR____SwiftDriverApprovalState_driver);
      uint64_t v96 = *(void *)&v91[OBJC_IVAR____SwiftDriverApprovalState_driver + 8];
      uint64_t v219 = *(void *)&v91[OBJC_IVAR____SwiftDriverApprovalState_driver];
      uint64_t v220 = v96;
      uint64_t v97 = v95[1];
      uint64_t v217 = *v95;
      uint64_t v218 = v97;
      v216 = v91;
      id v98 = v93;
      v215 = (char *)sub_24D006C80();
      uint64_t v99 = *(int *)(type metadata accessor for DriverKitDriver() + 20);
      uint64_t v100 = (uint64_t)v95 + v99;
      uint64_t v101 = v213;
      uint64_t v102 = v213 + *(int *)(v209 + 48);
      sub_24D000864((uint64_t)&v94[v99], v213, (uint64_t (*)(void))type metadata accessor for DriverKitDriverSource);
      sub_24D000864(v100, v102, (uint64_t (*)(void))type metadata accessor for DriverKitDriverSource);
      uint64_t v103 = *v208;
      uint64_t v104 = v101;
      uint64_t v105 = v214;
      LODWORD(v94) = (*v208)(v104, 1, v214);
      int v106 = v103(v102, 1, v105);
      if (v94 == 1)
      {
        unint64_t v107 = v98;
        unint64_t v108 = v215;
        int v109 = v216;
        if (v106 != 1)
        {
          sub_24D0008CC(v102, (uint64_t (*)(void))type metadata accessor for DriverKitDriverSource);
          goto LABEL_76;
        }
      }
      else
      {
        if (v106 == 1)
        {
          sub_24D0008CC(v213, (uint64_t (*)(void))type metadata accessor for DriverKitDriverApp);
          unint64_t v107 = v98;
          int v109 = v216;
          goto LABEL_81;
        }
        uint64_t v110 = (uint64_t)v205;
        sub_24D0007FC(v213, (uint64_t)v205, (uint64_t (*)(void))type metadata accessor for DriverKitDriverApp);
        uint64_t v111 = (uint64_t)v206;
        sub_24D0007FC(v102, (uint64_t)v206, (uint64_t (*)(void))type metadata accessor for DriverKitDriverApp);
        uint64_t v112 = v207;
        uint64_t v113 = v207 + *(int *)(v204 + 48);
        sub_24D000864(v110, v207, (uint64_t (*)(void))type metadata accessor for DriverKitDriverApp);
        sub_24D000864(v111, v113, (uint64_t (*)(void))type metadata accessor for DriverKitDriverApp);
        if (swift_getEnumCaseMultiPayload() == 1)
        {
          sub_24D0008CC(v111, (uint64_t (*)(void))type metadata accessor for DriverKitDriverApp);
          sub_24D0008CC(v110, (uint64_t (*)(void))type metadata accessor for DriverKitDriverApp);
          sub_24CFE71CC(*(void *)v112, *(void *)(v112 + 8));
          if (swift_getEnumCaseMultiPayload() != 1)
          {
            sub_24D0008CC(v113, (uint64_t (*)(void))type metadata accessor for DriverKitDriverApp);
            unint64_t v107 = v98;
            int v109 = v216;
LABEL_76:

            uint64_t v124 = v212;
            uint64_t v89 = v210;
            if (!v210) {
              goto LABEL_174;
            }
            goto LABEL_77;
          }
          sub_24CFE71CC(*(void *)v113, *(void *)(v113 + 8));
          unint64_t v107 = v98;
          unint64_t v108 = v215;
          int v109 = v216;
        }
        else
        {
          int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
          unint64_t v107 = v98;
          int v109 = v216;
          if (EnumCaseMultiPayload == 1)
          {
            sub_24D0008CC((uint64_t)v206, (uint64_t (*)(void))type metadata accessor for DriverKitDriverApp);
            sub_24D0008CC((uint64_t)v205, (uint64_t (*)(void))type metadata accessor for DriverKitDriverApp);
            sub_24CFE71CC(*(void *)v113, *(void *)(v113 + 8));
            sub_24D0008CC(v207, (uint64_t (*)(void))type metadata accessor for SettingsApplicationRecord);
LABEL_81:

            uint64_t v89 = v210;
            uint64_t v124 = v212;
LABEL_59:
            uint64_t v41 = v124 + 1;
            unint64_t v90 = v199 + 8;
            if (v41 != v195) {
              goto LABEL_60;
            }
            uint64_t v41 = v195;
            uint64_t v2 = v184;
            uint64_t v36 = v189;
            uint64_t v40 = v198;
LABEL_85:
            if (v41 < v40) {
              goto LABEL_164;
            }
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
              uint64_t v36 = sub_24CFFE948(0, *((void *)v36 + 2) + 1, 1, v36);
            }
            unint64_t v127 = *((void *)v36 + 2);
            unint64_t v126 = *((void *)v36 + 3);
            unint64_t v39 = v127 + 1;
            uint64_t v37 = v210;
            uint64_t v128 = v198;
            if (v127 >= v126 >> 1)
            {
              v177 = sub_24CFFE948((char *)(v126 > 1), v127 + 1, 1, v36);
              uint64_t v128 = v198;
              uint64_t v37 = v210;
              uint64_t v36 = v177;
            }
            *((void *)v36 + 2) = v39;
            unint64_t v129 = v36 + 32;
            uint64_t v130 = &v36[16 * v127 + 32];
            *(void *)uint64_t v130 = v128;
            *((void *)v130 + 1) = v41;
            uint64_t v212 = v41;
            if (v127)
            {
LABEL_91:
              unint64_t v131 = v39 - 1;
              if (v39 >= 4)
              {
                uint64_t v136 = &v129[16 * v39];
                uint64_t v137 = *((void *)v136 - 8);
                uint64_t v138 = *((void *)v136 - 7);
                BOOL v142 = __OFSUB__(v138, v137);
                uint64_t v139 = v138 - v137;
                if (v142) {
                  goto LABEL_153;
                }
                uint64_t v141 = *((void *)v136 - 6);
                uint64_t v140 = *((void *)v136 - 5);
                BOOL v142 = __OFSUB__(v140, v141);
                uint64_t v134 = v140 - v141;
                char v135 = v142;
                if (v142) {
                  goto LABEL_154;
                }
                unint64_t v143 = v39 - 2;
                uint64_t v144 = &v129[16 * v39 - 32];
                uint64_t v146 = *(void *)v144;
                uint64_t v145 = *((void *)v144 + 1);
                BOOL v142 = __OFSUB__(v145, v146);
                uint64_t v147 = v145 - v146;
                if (v142) {
                  goto LABEL_156;
                }
                BOOL v142 = __OFADD__(v134, v147);
                uint64_t v148 = v134 + v147;
                if (v142) {
                  goto LABEL_159;
                }
                if (v148 >= v139)
                {
                  v166 = &v129[16 * v131];
                  uint64_t v168 = *(void *)v166;
                  uint64_t v167 = *((void *)v166 + 1);
                  BOOL v142 = __OFSUB__(v167, v168);
                  uint64_t v169 = v167 - v168;
                  if (v142) {
                    goto LABEL_163;
                  }
                  BOOL v159 = v134 < v169;
                }
                else
                {
LABEL_104:
                  if (v135) {
                    goto LABEL_155;
                  }
                  unint64_t v143 = v39 - 2;
                  __int16 v149 = &v129[16 * v39 - 32];
                  uint64_t v151 = *(void *)v149;
                  uint64_t v150 = *((void *)v149 + 1);
                  BOOL v152 = __OFSUB__(v150, v151);
                  uint64_t v153 = v150 - v151;
                  char v154 = v152;
                  if (v152) {
                    goto LABEL_158;
                  }
                  long long v155 = &v129[16 * v131];
                  uint64_t v157 = *(void *)v155;
                  uint64_t v156 = *((void *)v155 + 1);
                  BOOL v142 = __OFSUB__(v156, v157);
                  uint64_t v158 = v156 - v157;
                  if (v142) {
                    goto LABEL_161;
                  }
                  if (__OFADD__(v153, v158)) {
                    goto LABEL_162;
                  }
                  if (v153 + v158 < v134) {
                    goto LABEL_116;
                  }
                  BOOL v159 = v134 < v158;
                }
                if (v159) {
                  unint64_t v131 = v143;
                }
              }
              else
              {
                if (v39 == 3)
                {
                  uint64_t v133 = *((void *)v36 + 4);
                  uint64_t v132 = *((void *)v36 + 5);
                  BOOL v142 = __OFSUB__(v132, v133);
                  uint64_t v134 = v132 - v133;
                  char v135 = v142;
                  goto LABEL_104;
                }
                uint64_t v160 = *((void *)v36 + 4);
                uint64_t v161 = *((void *)v36 + 5);
                BOOL v142 = __OFSUB__(v161, v160);
                uint64_t v153 = v161 - v160;
                char v154 = v142;
LABEL_116:
                if (v154) {
                  goto LABEL_157;
                }
                objc_super v162 = &v129[16 * v131];
                uint64_t v164 = *(void *)v162;
                uint64_t v163 = *((void *)v162 + 1);
                BOOL v142 = __OFSUB__(v163, v164);
                uint64_t v165 = v163 - v164;
                if (v142) {
                  goto LABEL_160;
                }
                if (v165 < v153) {
                  goto LABEL_14;
                }
              }
              unint64_t v170 = v131 - 1;
              if (v131 - 1 >= v39)
              {
                __break(1u);
LABEL_150:
                __break(1u);
LABEL_151:
                __break(1u);
LABEL_152:
                __break(1u);
LABEL_153:
                __break(1u);
LABEL_154:
                __break(1u);
LABEL_155:
                __break(1u);
LABEL_156:
                __break(1u);
LABEL_157:
                __break(1u);
LABEL_158:
                __break(1u);
LABEL_159:
                __break(1u);
LABEL_160:
                __break(1u);
LABEL_161:
                __break(1u);
LABEL_162:
                __break(1u);
LABEL_163:
                __break(1u);
LABEL_164:
                __break(1u);
LABEL_165:
                __break(1u);
LABEL_166:
                __break(1u);
LABEL_167:
                __break(1u);
LABEL_168:
                __break(1u);
LABEL_169:
                __break(1u);
LABEL_170:
                __break(1u);
LABEL_171:
                __break(1u);
LABEL_172:
                __break(1u);
                break;
              }
              if (!v37) {
                goto LABEL_175;
              }
              v171 = v36;
              v172 = &v129[16 * v170];
              uint64_t v173 = *(void *)v172;
              v174 = &v129[16 * v131];
              uint64_t v175 = *((void *)v174 + 1);
              sub_24CFFE63C((void **)(v37 + 8 * *(void *)v172), (id *)(v37 + 8 * *(void *)v174), v37 + 8 * v175, v200);
              if (v2) {
                goto LABEL_147;
              }
              if (v175 < v173) {
                goto LABEL_150;
              }
              if (v131 > *((void *)v171 + 2)) {
                goto LABEL_151;
              }
              *(void *)v172 = v173;
              *(void *)&v129[16 * v170 + 8] = v175;
              unint64_t v176 = *((void *)v171 + 2);
              if (v131 >= v176) {
                goto LABEL_152;
              }
              uint64_t v36 = v171;
              unint64_t v39 = v176 - 1;
              memmove(&v129[16 * v131], v174 + 16, 16 * (v176 - 1 - v131));
              *((void *)v171 + 2) = v176 - 1;
              uint64_t v37 = v210;
              if (v176 <= 2) {
                goto LABEL_14;
              }
              goto LABEL_91;
            }
            unint64_t v39 = 1;
LABEL_14:
            uint64_t v30 = v196;
            uint64_t v38 = v212;
            if (v212 >= v196) {
              goto LABEL_136;
            }
            goto LABEL_15;
          }
          uint64_t v115 = v201;
          sub_24D0007FC(v207, v201, (uint64_t (*)(void))type metadata accessor for SettingsApplicationRecord);
          uint64_t v116 = v202;
          sub_24D0007FC(v113, v202, (uint64_t (*)(void))type metadata accessor for SettingsApplicationRecord);
          uint64_t v117 = *(int *)(v203 + 36);
          uint64_t v118 = *(void *)(v115 + v117 + 8);
          uint64_t v219 = *(void *)(v115 + v117);
          uint64_t v220 = v118;
          uint64_t v119 = (uint64_t *)(v116 + v117);
          uint64_t v121 = *v119;
          uint64_t v120 = v119[1];
          uint64_t v217 = v121;
          uint64_t v218 = v120;
          uint64_t v122 = sub_24D006C80();
          sub_24D0008CC(v116, (uint64_t (*)(void))type metadata accessor for SettingsApplicationRecord);
          sub_24D0008CC(v115, (uint64_t (*)(void))type metadata accessor for SettingsApplicationRecord);
          sub_24D0008CC((uint64_t)v206, (uint64_t (*)(void))type metadata accessor for DriverKitDriverApp);
          sub_24D0008CC((uint64_t)v205, (uint64_t (*)(void))type metadata accessor for DriverKitDriverApp);
          unint64_t v108 = v215;
          if (v122) {
            unint64_t v108 = (char *)v122;
          }
        }
      }

      BOOL v123 = v108 + 1 == 0;
      uint64_t v124 = v212;
      if (!v123)
      {
        uint64_t v89 = v210;
        goto LABEL_59;
      }
      uint64_t v89 = v210;
      if (!v210) {
        goto LABEL_174;
      }
LABEL_77:
      unint64_t v125 = *(void **)v90;
      id v91 = *(char **)(v90 + 8);
      *(void *)unint64_t v90 = v91;
      *(void *)(v90 + 8) = v125;
      v90 -= 8;
      if (v124 == ++v92) {
        goto LABEL_59;
      }
    }
  }
  __break(1u);
LABEL_174:
  __break(1u);
LABEL_175:
  __break(1u);
LABEL_176:
  __break(1u);
LABEL_177:
  __break(1u);
LABEL_178:
  sub_24D006D80();
  __break(1u);
}

void sub_24CFFDF88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v53 = a1;
  uint64_t v57 = type metadata accessor for SettingsApplicationRecord();
  uint64_t v7 = MEMORY[0x270FA5388](v57);
  uint64_t v56 = (uint64_t)&v51 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v55 = (uint64_t)&v51 - v9;
  uint64_t v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1830B0);
  MEMORY[0x270FA5388](v59);
  uint64_t v60 = (uint64_t)&v51 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v63 = type metadata accessor for DriverKitDriverApp();
  uint64_t v11 = *(void *)(v63 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v63);
  uint64_t v14 = (char *)&v51 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v58 = (uint64_t)&v51 - v15;
  uint64_t v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1830C8);
  MEMORY[0x270FA5388](v62);
  uint64_t v67 = (uint64_t)&v51 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v52 = a2;
  if (a3 != a2)
  {
    uint64_t v17 = *a4;
    uint64_t v61 = (uint64_t (**)(uint64_t, uint64_t, uint64_t))(v11 + 48);
    unint64_t v66 = sub_24CFE8098();
    uint64_t v64 = v17;
    uint64_t v18 = v17 + 8 * a3 - 8;
LABEL_7:
    uint64_t v20 = *(char **)(v64 + 8 * a3);
    uint64_t v21 = v53;
    uint64_t v54 = v18;
    uint64_t v65 = a3;
    while (1)
    {
      uint64_t v22 = (uint64_t)v14;
      uint64_t v23 = *(void **)v18;
      unint64_t v24 = &v20[OBJC_IVAR____SwiftDriverApprovalState_driver];
      uint64_t v25 = (uint64_t *)(*(void *)v18 + OBJC_IVAR____SwiftDriverApprovalState_driver);
      uint64_t v26 = *(void *)&v20[OBJC_IVAR____SwiftDriverApprovalState_driver + 8];
      uint64_t v72 = *(void *)&v20[OBJC_IVAR____SwiftDriverApprovalState_driver];
      uint64_t v73 = v26;
      uint64_t v27 = v25[1];
      uint64_t v70 = *v25;
      uint64_t v71 = v27;
      uint64_t v69 = v20;
      id v74 = v23;
      uint64_t v68 = sub_24D006C80();
      uint64_t v28 = *(int *)(type metadata accessor for DriverKitDriver() + 20);
      uint64_t v29 = (uint64_t)&v24[v28];
      uint64_t v30 = (uint64_t)v25 + v28;
      uint64_t v31 = v67;
      uint64_t v32 = v67 + *(int *)(v62 + 48);
      sub_24D000864(v29, v67, (uint64_t (*)(void))type metadata accessor for DriverKitDriverSource);
      sub_24D000864(v30, v32, (uint64_t (*)(void))type metadata accessor for DriverKitDriverSource);
      unint64_t v33 = *v61;
      uint64_t v34 = v63;
      LODWORD(v23) = (*v61)(v31, 1, v63);
      int v35 = v33(v32, 1, v34);
      if (v23 == 1)
      {
        uint64_t v19 = v65;
        uint64_t v14 = (char *)v22;
        id v36 = v74;
        uint64_t v38 = v68;
        uint64_t v37 = v69;
        if (v35 == 1) {
          goto LABEL_19;
        }
        sub_24D0008CC(v32, (uint64_t (*)(void))type metadata accessor for DriverKitDriverSource);
      }
      else
      {
        if (v35 == 1)
        {
          sub_24D0008CC(v67, (uint64_t (*)(void))type metadata accessor for DriverKitDriverApp);
          uint64_t v14 = (char *)v22;
LABEL_5:

          uint64_t v19 = v65;
LABEL_6:
          a3 = v19 + 1;
          uint64_t v18 = v54 + 8;
          if (a3 == v52) {
            return;
          }
          goto LABEL_7;
        }
        uint64_t v39 = v58;
        sub_24D0007FC(v67, v58, (uint64_t (*)(void))type metadata accessor for DriverKitDriverApp);
        sub_24D0007FC(v32, v22, (uint64_t (*)(void))type metadata accessor for DriverKitDriverApp);
        uint64_t v40 = v60;
        uint64_t v41 = v60 + *(int *)(v59 + 48);
        sub_24D000864(v39, v60, (uint64_t (*)(void))type metadata accessor for DriverKitDriverApp);
        sub_24D000864(v22, v41, (uint64_t (*)(void))type metadata accessor for DriverKitDriverApp);
        if (swift_getEnumCaseMultiPayload() != 1)
        {
          if (swift_getEnumCaseMultiPayload() == 1)
          {
            uint64_t v14 = (char *)v22;
            sub_24D0008CC(v22, (uint64_t (*)(void))type metadata accessor for DriverKitDriverApp);
            sub_24D0008CC(v39, (uint64_t (*)(void))type metadata accessor for DriverKitDriverApp);
            sub_24CFE71CC(*(void *)v41, *(void *)(v41 + 8));
            sub_24D0008CC(v60, (uint64_t (*)(void))type metadata accessor for SettingsApplicationRecord);
            goto LABEL_5;
          }
          uint64_t v42 = v55;
          sub_24D0007FC(v60, v55, (uint64_t (*)(void))type metadata accessor for SettingsApplicationRecord);
          uint64_t v43 = v56;
          sub_24D0007FC(v41, v56, (uint64_t (*)(void))type metadata accessor for SettingsApplicationRecord);
          uint64_t v44 = *(int *)(v57 + 36);
          uint64_t v45 = *(void *)(v42 + v44 + 8);
          uint64_t v72 = *(void *)(v42 + v44);
          uint64_t v73 = v45;
          uint64_t v46 = (uint64_t *)(v43 + v44);
          uint64_t v48 = *v46;
          uint64_t v47 = v46[1];
          uint64_t v70 = v48;
          uint64_t v71 = v47;
          uint64_t v49 = sub_24D006C80();
          sub_24D0008CC(v43, (uint64_t (*)(void))type metadata accessor for SettingsApplicationRecord);
          sub_24D0008CC(v42, (uint64_t (*)(void))type metadata accessor for SettingsApplicationRecord);
          uint64_t v14 = (char *)v22;
          sub_24D0008CC(v22, (uint64_t (*)(void))type metadata accessor for DriverKitDriverApp);
          sub_24D0008CC(v39, (uint64_t (*)(void))type metadata accessor for DriverKitDriverApp);
          uint64_t v38 = v68;
          uint64_t v37 = v69;
          if (v49) {
            uint64_t v38 = v49;
          }
          uint64_t v19 = v65;
          id v36 = v74;
          goto LABEL_19;
        }
        sub_24D0008CC(v22, (uint64_t (*)(void))type metadata accessor for DriverKitDriverApp);
        sub_24D0008CC(v39, (uint64_t (*)(void))type metadata accessor for DriverKitDriverApp);
        sub_24CFE71CC(*(void *)v40, *(void *)(v40 + 8));
        if (swift_getEnumCaseMultiPayload() == 1)
        {
          sub_24CFE71CC(*(void *)v41, *(void *)(v41 + 8));
          uint64_t v19 = v65;
          uint64_t v14 = (char *)v22;
          id v36 = v74;
          uint64_t v38 = v68;
          uint64_t v37 = v69;
LABEL_19:

          if (v38 != -1) {
            goto LABEL_6;
          }
          if (!v64) {
            goto LABEL_27;
          }
          goto LABEL_24;
        }
        sub_24D0008CC(v41, (uint64_t (*)(void))type metadata accessor for DriverKitDriverApp);
        uint64_t v19 = v65;
        uint64_t v14 = (char *)v22;
        id v36 = v74;
        uint64_t v37 = v69;
      }

      if (!v64)
      {
LABEL_27:
        __break(1u);
        return;
      }
LABEL_24:
      uint64_t v50 = *(void **)v18;
      uint64_t v20 = *(char **)(v18 + 8);
      *(void *)uint64_t v18 = v20;
      *(void *)(v18 + 8) = v50;
      v18 -= 8;
      if (v19 == ++v21) {
        goto LABEL_6;
      }
    }
  }
}

uint64_t sub_24CFFE63C(void **__src, id *a2, unint64_t a3, void **a4)
{
  uint64_t v4 = a2;
  uint64_t v5 = __src;
  int64_t v6 = (char *)a2 - (char *)__src;
  int64_t v7 = (char *)a2 - (char *)__src + 7;
  if ((char *)a2 - (char *)__src >= 0) {
    int64_t v7 = (char *)a2 - (char *)__src;
  }
  uint64_t v8 = v7 >> 3;
  uint64_t v9 = a3 - (void)a2;
  uint64_t v10 = a3 - (void)a2 + 7;
  if ((uint64_t)(a3 - (void)a2) >= 0) {
    uint64_t v10 = a3 - (void)a2;
  }
  uint64_t v11 = v10 >> 3;
  uint64_t v37 = __src;
  id v36 = a4;
  if (v8 >= v10 >> 3)
  {
    if (v9 >= -7)
    {
      if (a4 != a2 || &a2[v11] <= a4) {
        memmove(a4, a2, 8 * v11);
      }
      uint64_t v20 = (char *)&a4[v11];
      int v35 = v20;
      uint64_t v37 = v4;
      if (v5 < v4 && v9 >= 8)
      {
        uint64_t v21 = (id *)(a3 - 8);
        uint64_t v22 = v4;
        uint64_t v31 = v5;
        do
        {
          uint64_t v34 = v4;
          uint64_t v23 = (char *)*((void *)v20 - 1);
          unint64_t v24 = v21 + 1;
          uint64_t v25 = (char *)*--v22;
          uint64_t v26 = (uint64_t *)&v23[OBJC_IVAR____SwiftDriverApprovalState_driver];
          uint64_t v27 = (uint64_t *)&v25[OBJC_IVAR____SwiftDriverApprovalState_driver];
          uint64_t v28 = v23;
          uint64_t v29 = v25;
          LOBYTE(v26) = _s16DriverManagement0a3KitA0V1loiySbAC_ACtFZ_0(v26, v27);

          if (v26)
          {
            if (v24 != v34 || v21 >= v34) {
              *uint64_t v21 = *v22;
            }
            uint64_t v37 = v22;
          }
          else
          {
            int v35 = v20 - 8;
            if (v24 < (id *)v20 || v21 >= (id *)v20 || v24 != (id *)v20) {
              *uint64_t v21 = (id)*((void *)v20 - 1);
            }
            uint64_t v22 = v34;
            v20 -= 8;
          }
          if (v22 <= v31) {
            break;
          }
          --v21;
          uint64_t v4 = v22;
        }
        while (v20 > (char *)a4);
      }
      goto LABEL_43;
    }
  }
  else if (v6 >= -7)
  {
    if (a4 != __src || &__src[v8] <= a4) {
      memmove(a4, __src, 8 * v8);
    }
    uint64_t v12 = &a4[v8];
    int v35 = (char *)v12;
    if ((unint64_t)v4 < a3 && v6 >= 8)
    {
      uint64_t v13 = a4;
      do
      {
        uint64_t v14 = *v13;
        uint64_t v15 = (uint64_t *)((char *)*v4 + OBJC_IVAR____SwiftDriverApprovalState_driver);
        uint64_t v16 = (uint64_t *)((char *)*v13 + OBJC_IVAR____SwiftDriverApprovalState_driver);
        id v17 = *v4;
        id v18 = v14;
        LOBYTE(v15) = _s16DriverManagement0a3KitA0V1loiySbAC_ACtFZ_0(v15, v16);

        if (v15)
        {
          uint64_t v19 = v4 + 1;
          if (v5 < v4 || v5 >= v19 || v5 != v4) {
            *uint64_t v5 = *v4;
          }
        }
        else
        {
          if (v5 != v13) {
            *uint64_t v5 = *v13;
          }
          id v36 = ++v13;
          uint64_t v19 = v4;
        }
        ++v5;
        if (v13 >= v12) {
          break;
        }
        uint64_t v4 = v19;
      }
      while ((unint64_t)v19 < a3);
      uint64_t v37 = v5;
    }
LABEL_43:
    sub_24CFFEA44((void **)&v37, (const void **)&v36, &v35);
    return 1;
  }
  uint64_t result = sub_24D006DE0();
  __break(1u);
  return result;
}

char *sub_24CFFE948(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26984D450);
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

char *sub_24CFFEA44(void **a1, const void **a2, void *a3)
{
  unint64_t v3 = (char *)*a2;
  uint64_t v4 = *a3 - (void)v3;
  uint64_t v5 = v4 + 7;
  if (v4 >= 0) {
    uint64_t v5 = *a3 - (void)v3;
  }
  if (v4 <= -8)
  {
    uint64_t result = (char *)sub_24D006DE0();
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

char *sub_24CFFEB00(uint64_t a1)
{
  return sub_24CFFE948(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_24CFFEB14(uint64_t a1, uint64_t a2, unint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  uint64_t v10 = (void *)*v4;
  unint64_t v12 = sub_24CFF0050(a2, a3);
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
      sub_24CFFED28();
      goto LABEL_7;
    }
    sub_24CFFC888(v15, a4 & 1);
    uint64_t v22 = sub_24CFF0050(a2, a3);
    if ((v16 & 1) == (v23 & 1))
    {
      unint64_t v12 = v22;
      id v18 = *v5;
      if (v16) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    uint64_t result = sub_24D006EE0();
    __break(1u);
    return result;
  }
LABEL_7:
  id v18 = *v5;
  if (v16)
  {
LABEL_8:
    uint64_t v19 = v18[7];
    uint64_t v20 = v19 + *(void *)(*(void *)(type metadata accessor for SettingsApplicationRecord() - 8) + 72) * v12;
    return sub_24D000788(a1, v20);
  }
LABEL_13:
  sub_24CFFEC7C(v12, a2, a3, a1, v18);

  return sub_24CFE7000(a2, a3);
}

uint64_t sub_24CFFEC7C(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v8 = (void *)(a5[6] + 16 * a1);
  *uint64_t v8 = a2;
  v8[1] = a3;
  uint64_t v9 = a5[7];
  uint64_t v10 = type metadata accessor for SettingsApplicationRecord();
  uint64_t result = sub_24D0007FC(a4, v9 + *(void *)(*(void *)(v10 - 8) + 72) * a1, (uint64_t (*)(void))type metadata accessor for SettingsApplicationRecord);
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

void *sub_24CFFED28()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for SettingsApplicationRecord();
  uint64_t v29 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B183190);
  uint64_t v5 = *v0;
  uint64_t v6 = sub_24D006DB0();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_25:
    *uint64_t v1 = v7;
    return result;
  }
  uint64_t v27 = v1;
  uint64_t result = (void *)(v6 + 64);
  unint64_t v9 = (unint64_t)((1 << *(unsigned char *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v5 + 64 + 8 * v9) {
    uint64_t result = memmove(result, (const void *)(v5 + 64), 8 * v9);
  }
  uint64_t v28 = v5 + 64;
  int64_t v10 = 0;
  *(void *)(v7 + 16) = *(void *)(v5 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v5 + 64);
  int64_t v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      unint64_t v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v16 = v15 | (v10 << 6);
      goto LABEL_9;
    }
    int64_t v23 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v23 >= v14) {
      goto LABEL_23;
    }
    unint64_t v24 = *(void *)(v28 + 8 * v23);
    ++v10;
    if (!v24)
    {
      int64_t v10 = v23 + 1;
      if (v23 + 1 >= v14) {
        goto LABEL_23;
      }
      unint64_t v24 = *(void *)(v28 + 8 * v10);
      if (!v24) {
        break;
      }
    }
LABEL_22:
    unint64_t v13 = (v24 - 1) & v24;
    unint64_t v16 = __clz(__rbit64(v24)) + (v10 << 6);
LABEL_9:
    uint64_t v17 = 16 * v16;
    id v18 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v16);
    uint64_t v19 = *v18;
    unint64_t v20 = v18[1];
    unint64_t v21 = *(void *)(v29 + 72) * v16;
    sub_24D000864(*(void *)(v5 + 56) + v21, (uint64_t)v4, (uint64_t (*)(void))type metadata accessor for SettingsApplicationRecord);
    uint64_t v22 = (uint64_t *)(*(void *)(v7 + 48) + v17);
    *uint64_t v22 = v19;
    v22[1] = v20;
    sub_24D0007FC((uint64_t)v4, *(void *)(v7 + 56) + v21, (uint64_t (*)(void))type metadata accessor for SettingsApplicationRecord);
    uint64_t result = (void *)sub_24CFE7000(v19, v20);
  }
  int64_t v25 = v23 + 2;
  if (v25 >= v14)
  {
LABEL_23:
    uint64_t result = (void *)swift_release();
    uint64_t v1 = v27;
    goto LABEL_25;
  }
  unint64_t v24 = *(void *)(v28 + 8 * v25);
  if (v24)
  {
    int64_t v10 = v25;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v10 = v25 + 1;
    if (__OFADD__(v25, 1)) {
      break;
    }
    if (v10 >= v14) {
      goto LABEL_23;
    }
    unint64_t v24 = *(void *)(v28 + 8 * v10);
    ++v25;
    if (v24) {
      goto LABEL_22;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_24CFFEFC0(uint64_t a1)
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
  unint64_t v9 = (unint64_t *)(a1 + 80);
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

unsigned char *sub_24CFFF048(unsigned char *result, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  if (a2 < 0 || 1 << *(unsigned char *)(a5 + 32) <= a2)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (((*(void *)(a5 + 8 * ((unint64_t)a2 >> 6) + 64) >> a2) & 1) == 0)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (*(_DWORD *)(a5 + 36) == a3)
  {
    uint64_t v5 = *(void *)(*(void *)(a5 + 48) + 16 * a2);
    *uint64_t result = *(unsigned char *)(*(void *)(a5 + 56) + a2);
    swift_bridgeObjectRetain();
    return (unsigned char *)v5;
  }
LABEL_8:
  __break(1u);
  return result;
}

void sub_24CFFF0CC(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_24D006DA0();
    swift_bridgeObjectRelease();
  }

  JUMPOUT(0x25331AE50);
}

BOOL sub_24CFFF148(unint64_t a1, uint64_t a2)
{
  if (a1 >> 62)
  {
LABEL_13:
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_24D006DA0();
    if (v4) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v4)
    {
LABEL_3:
      uint64_t v5 = 4;
      while (1)
      {
        uint64_t v6 = v5 - 4;
        if ((a1 & 0xC000000000000001) != 0)
        {
          uint64_t v7 = MEMORY[0x25331AE40](v5 - 4, a1);
          uint64_t v8 = v5 - 3;
          if (__OFADD__(v6, 1)) {
            goto LABEL_12;
          }
        }
        else
        {
          uint64_t v7 = *(void *)(a1 + 8 * v5);
          swift_unknownObjectRetain();
          uint64_t v8 = v5 - 3;
          if (__OFADD__(v6, 1))
          {
LABEL_12:
            __break(1u);
            goto LABEL_13;
          }
        }
        swift_unknownObjectRelease();
        BOOL v9 = v7 == a2;
        if (v7 != a2)
        {
          ++v5;
          if (v8 != v4) {
            continue;
          }
        }
        goto LABEL_15;
      }
    }
  }
  BOOL v9 = 0;
LABEL_15:
  swift_bridgeObjectRelease();
  return v9;
}

uint64_t sub_24CFFF24C(unint64_t a1, uint64_t a2)
{
  if (a1 >> 62) {
    goto LABEL_11;
  }
  uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t v5 = 0;
  if (v4)
  {
    while (1)
    {
      if ((a1 & 0xC000000000000001) != 0)
      {
        uint64_t v6 = MEMORY[0x25331AE40](v5, a1);
      }
      else
      {
        uint64_t v6 = *(void *)(a1 + 8 * v5 + 32);
        swift_unknownObjectRetain();
      }
      swift_unknownObjectRelease();
      if (v6 == a2) {
        break;
      }
      uint64_t v7 = v5 + 1;
      if (__OFADD__(v5, 1))
      {
        __break(1u);
LABEL_11:
        swift_bridgeObjectRetain();
        uint64_t v4 = sub_24D006DA0();
        swift_bridgeObjectRelease();
        uint64_t v5 = 0;
        if (!v4) {
          return v5;
        }
      }
      else
      {
        ++v5;
        if (v7 == v4) {
          return 0;
        }
      }
    }
  }
  return v5;
}

uint64_t sub_24CFFF340(unint64_t *a1, uint64_t a2)
{
  unint64_t v5 = swift_bridgeObjectRetain();
  unint64_t v6 = sub_24CFFF24C(v5, a2);
  char v8 = v7;
  swift_bridgeObjectRelease();
  if (v2) {
    return v6;
  }
  if ((v8 & 1) == 0)
  {
    unint64_t v9 = v6 + 1;
    if (__OFADD__(v6, 1)) {
      goto LABEL_54;
    }
    if (*a1 >> 62)
    {
LABEL_55:
      swift_bridgeObjectRetain();
      uint64_t v24 = sub_24D006DA0();
      swift_bridgeObjectRelease();
      if (v9 != v24) {
        goto LABEL_6;
      }
    }
    else if (v9 != *(void *)((*a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
LABEL_6:
      for (unint64_t i = v6 + 5; ; ++i)
      {
        unint64_t v11 = i - 4;
        unint64_t v12 = *a1;
        if ((*a1 & 0xC000000000000001) != 0)
        {
          uint64_t v13 = MEMORY[0x25331AE40](i - 4);
        }
        else
        {
          if ((v11 & 0x8000000000000000) != 0)
          {
            __break(1u);
LABEL_45:
            __break(1u);
LABEL_46:
            __break(1u);
LABEL_47:
            __break(1u);
LABEL_48:
            __break(1u);
LABEL_49:
            __break(1u);
LABEL_50:
            __break(1u);
LABEL_51:
            __break(1u);
LABEL_52:
            __break(1u);
LABEL_53:
            __break(1u);
LABEL_54:
            __break(1u);
            goto LABEL_55;
          }
          if (v11 >= *(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
            goto LABEL_45;
          }
          uint64_t v13 = *(void *)(v12 + 8 * i);
          swift_unknownObjectRetain();
        }
        swift_unknownObjectRelease();
        if (v13 != a2) {
          break;
        }
LABEL_32:
        unint64_t v9 = i - 3;
        if (__OFADD__(v11, 1)) {
          goto LABEL_46;
        }
        if (*a1 >> 62)
        {
          swift_bridgeObjectRetain();
          uint64_t v21 = sub_24D006DA0();
          swift_bridgeObjectRelease();
        }
        else
        {
          uint64_t v21 = *(void *)((*a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
        }
        if (v9 == v21) {
          return v6;
        }
      }
      if (v11 == v6)
      {
LABEL_31:
        if (__OFADD__(v6++, 1)) {
          goto LABEL_47;
        }
        goto LABEL_32;
      }
      unint64_t v9 = *a1;
      if ((*a1 & 0xC000000000000001) != 0)
      {
        uint64_t v14 = MEMORY[0x25331AE40](v6, *a1);
        unint64_t v9 = *a1;
        if ((*a1 & 0xC000000000000001) == 0)
        {
LABEL_17:
          if ((v11 & 0x8000000000000000) != 0) {
            goto LABEL_50;
          }
          if (v11 >= *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
            goto LABEL_51;
          }
          uint64_t v15 = *(void *)(v9 + 8 * i);
          swift_unknownObjectRetain();
          goto LABEL_20;
        }
      }
      else
      {
        if ((v6 & 0x8000000000000000) != 0) {
          goto LABEL_48;
        }
        if (v6 >= *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
          goto LABEL_49;
        }
        uint64_t v14 = *(void *)(v9 + 8 * v6 + 32);
        swift_unknownObjectRetain();
        if ((v9 & 0xC000000000000001) == 0) {
          goto LABEL_17;
        }
      }
      uint64_t v15 = MEMORY[0x25331AE40](i - 4, v9);
      unint64_t v9 = *a1;
LABEL_20:
      int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
      *a1 = v9;
      if (!isUniquelyReferenced_nonNull_bridgeObject
        || (v9 & 0x8000000000000000) != 0
        || (v9 & 0x4000000000000000) != 0)
      {
        sub_24CFFF0CC(v9);
        unint64_t v9 = v17;
        *a1 = v17;
      }
      *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 8 * v6 + 0x20) = v15;
      swift_unknownObjectRelease();
      sub_24D006B80();
      unint64_t v9 = *a1;
      int v18 = swift_isUniquelyReferenced_nonNull_bridgeObject();
      *a1 = v9;
      if (!v18 || (v9 & 0x8000000000000000) != 0 || (v9 & 0x4000000000000000) != 0)
      {
        sub_24CFFF0CC(v9);
        unint64_t v9 = v19;
        *a1 = v19;
      }
      if ((v11 & 0x8000000000000000) != 0) {
        goto LABEL_52;
      }
      if (v11 >= *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
        goto LABEL_53;
      }
      *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 8 * i) = v14;
      swift_unknownObjectRelease();
      sub_24D006B80();
      goto LABEL_31;
    }
    return v6;
  }
  unint64_t v22 = *a1;
  if (!(v22 >> 62)) {
    return *(void *)((v22 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRetain();
  uint64_t v25 = sub_24D006DA0();
  swift_bridgeObjectRelease();
  return v25;
}

uint64_t sub_24CFFF660(uint64_t a1, uint64_t a2)
{
  if (a1 < 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v2 = a2;
    uint64_t v4 = a1;
    if (!(*v3 >> 62))
    {
      if (*(void *)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x10) >= a2) {
        goto LABEL_4;
      }
LABEL_33:
      __break(1u);
      goto LABEL_34;
    }
  }
  swift_bridgeObjectRetain();
  uint64_t v21 = sub_24D006DA0();
  swift_bridgeObjectRelease();
  if (v21 < v2) {
    goto LABEL_33;
  }
LABEL_4:
  uint64_t v6 = v2 - v4;
  if (__OFSUB__(v2, v4))
  {
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  uint64_t v5 = v4 - v2;
  if (__OFSUB__(0, v6))
  {
LABEL_35:
    __break(1u);
LABEL_36:
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_24D006DA0();
    swift_bridgeObjectRelease();
    uint64_t v8 = v7 + v5;
    if (!__OFADD__(v7, v5)) {
      goto LABEL_8;
    }
LABEL_38:
    __break(1u);
LABEL_39:
    swift_bridgeObjectRetain();
    uint64_t v12 = sub_24D006DA0();
    swift_bridgeObjectRelease();
    unint64_t v9 = *v3;
    goto LABEL_15;
  }
  if (*v3 >> 62) {
    goto LABEL_36;
  }
  uint64_t v7 = *(void *)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t v8 = v7 - v6;
  if (__OFADD__(v7, v5)) {
    goto LABEL_38;
  }
LABEL_8:
  unint64_t v9 = *v3;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *uint64_t v3 = v9;
  uint64_t v7 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v9 & 0x8000000000000000) == 0 && (v9 & 0x4000000000000000) == 0)
  {
    uint64_t v11 = v9 & 0xFFFFFFFFFFFFFF8;
    if (v8 <= *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      goto LABEL_18;
    }
    uint64_t v7 = 1;
  }
  if (v9 >> 62) {
    goto LABEL_39;
  }
  uint64_t v12 = *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
LABEL_15:
  if (v12 <= v8) {
    uint64_t v12 = v8;
  }
  swift_bridgeObjectRetain();
  *uint64_t v3 = MEMORY[0x25331AE50](v7, v12, 1, v9);
  swift_bridgeObjectRelease();
  uint64_t v11 = *v3 & 0xFFFFFFFFFFFFFF8;
LABEL_18:
  uint64_t v13 = v11 + 32;
  uint64_t v14 = (char *)(v11 + 32 + 8 * v4);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B183060);
  swift_arrayDestroy();
  if (v5)
  {
    if (*v3 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v22 = sub_24D006DA0();
      swift_bridgeObjectRelease();
      uint64_t v16 = v22 - v2;
      if (!__OFSUB__(v22, v2))
      {
LABEL_21:
        if (v16 < 0)
        {
LABEL_46:
          uint64_t result = sub_24D006DE0();
          __break(1u);
          return result;
        }
        unint64_t v17 = (char *)(v13 + 8 * v2);
        if (v4 != v2 || v14 >= &v17[8 * v16]) {
          memmove(v14, v17, 8 * v16);
        }
        if (!(*v3 >> 62))
        {
          uint64_t v18 = *(void *)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
          uint64_t v19 = v18 + v5;
          if (!__OFADD__(v18, v5))
          {
LABEL_27:
            *(void *)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x10) = v19;
            goto LABEL_28;
          }
          goto LABEL_45;
        }
LABEL_43:
        swift_bridgeObjectRetain();
        uint64_t v23 = sub_24D006DA0();
        swift_bridgeObjectRelease();
        uint64_t v19 = v23 + v5;
        if (!__OFADD__(v23, v5)) {
          goto LABEL_27;
        }
LABEL_45:
        __break(1u);
        goto LABEL_46;
      }
    }
    else
    {
      uint64_t v15 = *(void *)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
      uint64_t v16 = v15 - v2;
      if (!__OFSUB__(v15, v2)) {
        goto LABEL_21;
      }
    }
    __break(1u);
    goto LABEL_43;
  }
LABEL_28:

  return sub_24D006B80();
}

uint64_t sub_24CFFF978(unint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v43 = a2;
  uint64_t v7 = type metadata accessor for SettingsApplicationRecord();
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v42 = &v39[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v9 = type metadata accessor for DriverKitDriverApp();
  unint64_t v10 = *(unsigned int (***)(uint64_t (*)(), uint64_t, uint64_t))(v9 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v44 = &v39[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = &v39[-v13];
  uint64_t v15 = type metadata accessor for DriverKitDriverSource();
  uint64_t v16 = MEMORY[0x270FA5388](v15 - 8);
  uint64_t v49 = (uint64_t (*)())&v39[-((v17 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  unint64_t v20 = (uint64_t (*)())&v39[-v19];
  MEMORY[0x270FA5388](v18);
  uint64_t v47 = (uint64_t (*)())&v39[-v21];
  uint64_t v53 = MEMORY[0x263F8EE78];
  unint64_t v52 = a1;
  if (a1 >> 62) {
    goto LABEL_32;
  }
  uint64_t v22 = *(void *)((v52 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v22)
  {
    while (1)
    {
      uint64_t v41 = v4;
      unint64_t v23 = 0;
      unint64_t v24 = v52 & 0xC000000000000001;
      uint64_t v51 = v9;
      uint64_t v9 = v52 & 0xFFFFFFFFFFFFFF8;
      uint64_t v50 = v10 + 6;
      uint64_t v48 = v22;
      uint64_t v45 = v52 & 0xFFFFFFFFFFFFFF8;
      uint64_t v46 = v20;
      while (v24)
      {
        uint64_t v25 = (char *)MEMORY[0x25331AE40](v23, v52);
LABEL_10:
        unint64_t v10 = (unsigned int (**)(uint64_t (*)(), uint64_t, uint64_t))v25;
        unint64_t v20 = (uint64_t (*)())(v23 + 1);
        if (__OFADD__(v23, 1)) {
          goto LABEL_31;
        }
        if (a3)
        {
          if (a3 == 1)
          {
            uint64_t v26 = OBJC_IVAR____SwiftDriverApprovalState_driver;
            uint64_t v27 = (uint64_t)&v25[*(int *)(type metadata accessor for DriverKitDriver() + 20) + v26];
            uint64_t v4 = v49;
            sub_24D000864(v27, (uint64_t)v49, (uint64_t (*)(void))type metadata accessor for DriverKitDriverSource);
            if ((*v50)(v4, 1, v51) != 1)
            {
              sub_24D0008CC((uint64_t)v49, (uint64_t (*)(void))type metadata accessor for DriverKitDriverSource);

              goto LABEL_6;
            }
          }
          else
          {
            uint64_t v30 = OBJC_IVAR____SwiftDriverApprovalState_driver;
            uint64_t v31 = (uint64_t)&v25[*(int *)(type metadata accessor for DriverKitDriver() + 20) + v30];
            uint64_t v4 = v46;
            sub_24D000864(v31, (uint64_t)v46, (uint64_t (*)(void))type metadata accessor for DriverKitDriverSource);
            if ((*v50)(v4, 1, v51) == 1) {
              goto LABEL_20;
            }
            sub_24D0007FC((uint64_t)v4, (uint64_t)v14, (uint64_t (*)(void))type metadata accessor for DriverKitDriverApp);
            uint64_t v32 = v44;
            sub_24D000864((uint64_t)v14, (uint64_t)v44, (uint64_t (*)(void))type metadata accessor for DriverKitDriverApp);
            if (swift_getEnumCaseMultiPayload() == 1)
            {
              unint64_t v33 = v32;
              uint64_t v4 = type metadata accessor for DriverKitDriverApp;
              sub_24D0008CC((uint64_t)v14, (uint64_t (*)(void))type metadata accessor for DriverKitDriverApp);
              uint64_t v34 = (uint64_t)v33;
              uint64_t v22 = v48;
              sub_24D0008CC(v34, (uint64_t (*)(void))type metadata accessor for DriverKitDriverApp);
LABEL_20:

              uint64_t v9 = v45;
              goto LABEL_6;
            }
            uint64_t v35 = (uint64_t)v32;
            id v36 = v42;
            sub_24D0007FC(v35, (uint64_t)v42, (uint64_t (*)(void))type metadata accessor for SettingsApplicationRecord);
            uint64_t v37 = v36;
            uint64_t v4 = (uint64_t (*)())*((void *)v36 + 1);
            if (!v4)
            {
              swift_bridgeObjectRetain();
              sub_24D0008CC((uint64_t)v37, (uint64_t (*)(void))type metadata accessor for SettingsApplicationRecord);
              sub_24D0008CC((uint64_t)v14, (uint64_t (*)(void))type metadata accessor for DriverKitDriverApp);
              sub_24CFFFFE0(v43, a3);
              uint64_t v9 = v45;
LABEL_16:

              goto LABEL_6;
            }
            uint64_t v9 = v45;
            if (*v37 == v43 && v4 == (uint64_t (*)())a3)
            {
              swift_bridgeObjectRetain();
              sub_24D0008CC((uint64_t)v37, (uint64_t (*)(void))type metadata accessor for SettingsApplicationRecord);
              sub_24D0008CC((uint64_t)v14, (uint64_t (*)(void))type metadata accessor for DriverKitDriverApp);
              swift_bridgeObjectRelease();
            }
            else
            {
              int v40 = sub_24D006ED0();
              swift_bridgeObjectRetain();
              uint64_t v22 = v48;
              sub_24D0008CC((uint64_t)v37, (uint64_t (*)(void))type metadata accessor for SettingsApplicationRecord);
              sub_24D0008CC((uint64_t)v14, (uint64_t (*)(void))type metadata accessor for DriverKitDriverApp);
              swift_bridgeObjectRelease();
              if ((v40 & 1) == 0) {
                goto LABEL_16;
              }
            }
          }
        }
        else
        {
          uint64_t v28 = OBJC_IVAR____SwiftDriverApprovalState_driver;
          uint64_t v29 = (uint64_t)&v25[*(int *)(type metadata accessor for DriverKitDriver() + 20) + v28];
          uint64_t v4 = v47;
          sub_24D000864(v29, (uint64_t)v47, (uint64_t (*)(void))type metadata accessor for DriverKitDriverSource);
          if ((*v50)(v4, 1, v51) == 1) {
            goto LABEL_16;
          }
          sub_24D0008CC((uint64_t)v4, (uint64_t (*)(void))type metadata accessor for DriverKitDriverSource);
        }
        uint64_t v4 = (uint64_t (*)())&v53;
        sub_24D006D40();
        sub_24D006D60();
        uint64_t v22 = v48;
        sub_24D006D70();
        sub_24D006D50();
LABEL_6:
        ++v23;
        if (v20 == (uint64_t (*)())v22) {
          return v53;
        }
      }
      if (v23 < *(void *)(v9 + 16)) {
        break;
      }
      __break(1u);
LABEL_31:
      __break(1u);
LABEL_32:
      uint64_t v22 = sub_24D006DA0();
      if (!v22) {
        return MEMORY[0x263F8EE78];
      }
    }
    uint64_t v25 = (char *)*(id *)(v52 + 8 * v23 + 32);
    goto LABEL_10;
  }
  return MEMORY[0x263F8EE78];
}

uint64_t sub_24CFFFFCC(uint64_t a1, unint64_t a2)
{
  if (a2 >= 2) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_24CFFFFE0(uint64_t a1, unint64_t a2)
{
  if (a2 >= 2) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

unint64_t sub_24CFFFFF4(uint64_t *a1)
{
  return sub_24CFFB92C(a1, *(void *)(v1 + 16), *(void *)(v1 + 24)) & 1;
}

uint64_t sub_24D000014(uint64_t a1, unint64_t *a2)
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

uint64_t sub_24D000050()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_24D000088()
{
  return sub_24CFF6F24();
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

uint64_t sub_24D0000C4()
{
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_24D000104(void *a1, char a2)
{
  return sub_24CFFB1D8(a1, a2 & 1, *(void **)(v2 + 16), *(unsigned char *)(v2 + 24), *(void **)(v2 + 32));
}

unint64_t sub_24D000120()
{
  unint64_t result = qword_26B183138;
  if (!qword_26B183138)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B183138);
  }
  return result;
}

uint64_t sub_24D000174()
{
  return MEMORY[0x263EFDDD8];
}

unint64_t destroy for DriverKitSettingsFilter(uint64_t a1)
{
  unint64_t result = *(void *)(a1 + 8);
  if (result >= 0xFFFFFFFF) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t _s16DriverManagement23DriverKitSettingsFilterOwCP_0(uint64_t a1, uint64_t a2)
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

void *assignWithCopy for DriverKitSettingsFilter(void *a1, void *a2)
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

uint64_t assignWithTake for DriverKitSettingsFilter(uint64_t a1, uint64_t a2)
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

uint64_t getEnumTagSinglePayload for DriverKitSettingsFilter(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFE && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 2147483646);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  unsigned int v4 = v3 + 1;
  unsigned int v5 = v3 - 1;
  if (v4 >= 3) {
    return v5;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for DriverKitSettingsFilter(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFD)
  {
    *(void *)unint64_t result = 0;
    *(void *)(result + 8) = 0;
    *(_DWORD *)unint64_t result = a2 - 2147483646;
    if (a3 >= 0x7FFFFFFE) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFE) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2 + 1;
    }
  }
  return result;
}

uint64_t sub_24D0003A0(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_24D0003B8(void *result, int a2)
{
  if (a2 < 0)
  {
    *unint64_t result = a2 ^ 0x80000000;
    result[1] = 0;
  }
  else if (a2)
  {
    result[1] = (a2 - 1);
  }
  return result;
}

ValueMetadata *type metadata accessor for DriverKitSettingsFilter()
{
  return &type metadata for DriverKitSettingsFilter;
}

uint64_t sub_24D0003E8()
{
  return type metadata accessor for DriverManager();
}

uint64_t type metadata accessor for DriverManager()
{
  uint64_t result = qword_26B183080;
  if (!qword_26B183080) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_24D00043C()
{
  sub_24D0004FC();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_24D0004FC()
{
  if (!qword_26B183128)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B183140);
    unint64_t v0 = sub_24D0069D0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B183128);
    }
  }
}

uint64_t sub_24D000558(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_24D0005A0()
{
  swift_unknownObjectWeakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_24D0005D8()
{
  sub_24CFF76B0(v0);
}

void sub_24D0005E0(void *a1, char a2)
{
  sub_24CFF9860(a1, a2 & 1, *(void **)(v2 + 16));
}

void sub_24D0005EC(id a1, char a2)
{
  if (a2) {

  }
  else {
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_24D0005F8()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24D000638()
{
  return sub_24CFF9DE4(*(void **)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_24D000640(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_24D00069C()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_24D0006D4()
{
  swift_bridgeObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_24D00071C()
{
  return sub_24CFFABC0(*(void *)(v0 + 16), *(void **)(v0 + 24), *(void *)(v0 + 32));
}

uint64_t sub_24D000728(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B183100);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24D000788(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SettingsApplicationRecord();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

BOOL sub_24D0007F4(uint64_t a1, uint64_t a2, char a3)
{
  return sub_24CFE9CF4(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

uint64_t sub_24D0007FC(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_24D000864(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_24D0008CC(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_24D00092C()
{
  sub_24D000978(*(id *)(v0 + 24), *(unsigned char *)(v0 + 32));

  return MEMORY[0x270FA0238](v0, 48, 7);
}

void sub_24D000978(id a1, char a2)
{
  if (a2) {
}
  }

uint64_t sub_24D000984()
{
  return sub_24CFFB4EC(*(void **)(v0 + 16), *(void *)(v0 + 24), *(unsigned char *)(v0 + 32), *(unsigned char *)(v0 + 33));
}

id sub_24D000998(id result, char a2)
{
  if (a2) {
    return result;
  }
  return result;
}

unint64_t sub_24D0009D0(uint64_t *a1)
{
  return sub_24CFFFFF4(a1) & 1;
}

void *DriverKitDaemonXPC.serverName.unsafeMutableAddressor()
{
  return &static DriverKitDaemonXPC.serverName;
}

unint64_t static DriverKitDaemonXPC.serverName.getter()
{
  return 0xD000000000000022;
}

void *DriverKitDaemonXPC.NotificationType.approvalsChanged.unsafeMutableAddressor()
{
  return &static DriverKitDaemonXPC.NotificationType.approvalsChanged;
}

unint64_t static DriverKitDaemonXPC.NotificationType.approvalsChanged.getter()
{
  return 0xD00000000000002BLL;
}

ValueMetadata *type metadata accessor for DriverKitDaemonXPC()
{
  return &type metadata for DriverKitDaemonXPC;
}

ValueMetadata *type metadata accessor for DriverKitDaemonXPC.NotificationType()
{
  return &type metadata for DriverKitDaemonXPC.NotificationType;
}

uint64_t sub_24D000A64()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for SettingsApplicationRecord();
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for DriverKitDriverApp();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for DriverKitDriverSource();
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24D001150(v1, (uint64_t)v11);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v11, 1, v5) == 1) {
    return 0;
  }
  sub_24D0022B0((uint64_t)v11, (uint64_t)v8, (uint64_t (*)(void))type metadata accessor for DriverKitDriverApp);
  if (swift_getEnumCaseMultiPayload() == 1) {
    return *(void *)v8;
  }
  sub_24D0022B0((uint64_t)v8, (uint64_t)v4, (uint64_t (*)(void))type metadata accessor for SettingsApplicationRecord);
  uint64_t v13 = &v4[*(int *)(v2 + 32)];
  uint64_t v12 = *(void *)v13;
  sub_24CFE7000(*(void *)v13, *((void *)v13 + 1));
  sub_24D002378((uint64_t)v4, (uint64_t (*)(void))type metadata accessor for SettingsApplicationRecord);
  return v12;
}

uint64_t DriverKitDriverSource.description.getter()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for DriverKitDriverApp();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for DriverKitDriverSource();
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24D001150(v1, (uint64_t)v8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v8, 1, v2) == 1) {
    return 0x6150207473726946;
  }
  sub_24D0022B0((uint64_t)v8, (uint64_t)v5, (uint64_t (*)(void))type metadata accessor for DriverKitDriverApp);
  unint64_t v11 = 0;
  unint64_t v12 = 0xE000000000000000;
  sub_24D006CC0();
  swift_bridgeObjectRelease();
  unint64_t v11 = 0xD000000000000014;
  unint64_t v12 = 0x800000024D00B060;
  DriverKitDriverApp.description.getter();
  sub_24D006AD0();
  swift_bridgeObjectRelease();
  unint64_t v9 = v11;
  sub_24D002378((uint64_t)v5, (uint64_t (*)(void))type metadata accessor for DriverKitDriverApp);
  return v9;
}

uint64_t _s16DriverManagement0a3KitA6SourceO21__derived_enum_equalsySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for DriverKitDriverApp();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for DriverKitDriverSource();
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1830C8);
  uint64_t v12 = MEMORY[0x270FA5388](v11 - 8);
  uint64_t v14 = (char *)&v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = (uint64_t)&v14[*(int *)(v12 + 56)];
  sub_24D001150(a1, (uint64_t)v14);
  sub_24D001150(a2, v15);
  uint64_t v16 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48);
  if (v16((uint64_t)v14, 1, v4) != 1)
  {
    sub_24D001150((uint64_t)v14, (uint64_t)v10);
    if (v16(v15, 1, v4) != 1)
    {
      sub_24D0022B0(v15, (uint64_t)v7, (uint64_t (*)(void))type metadata accessor for DriverKitDriverApp);
      char v17 = _s16DriverManagement0a3KitA3AppO2eeoiySbAC_ACtFZ_0((uint64_t)v10, (uint64_t)v7);
      sub_24D002378((uint64_t)v7, (uint64_t (*)(void))type metadata accessor for DriverKitDriverApp);
      sub_24D002378((uint64_t)v10, (uint64_t (*)(void))type metadata accessor for DriverKitDriverApp);
      sub_24D002378((uint64_t)v14, (uint64_t (*)(void))type metadata accessor for DriverKitDriverSource);
      return v17 & 1;
    }
    sub_24D002378((uint64_t)v10, (uint64_t (*)(void))type metadata accessor for DriverKitDriverApp);
    goto LABEL_6;
  }
  if (v16(v15, 1, v4) != 1)
  {
LABEL_6:
    sub_24D002318((uint64_t)v14);
    char v17 = 0;
    return v17 & 1;
  }
  sub_24D002378((uint64_t)v14, (uint64_t (*)(void))type metadata accessor for DriverKitDriverSource);
  char v17 = 1;
  return v17 & 1;
}

uint64_t type metadata accessor for DriverKitDriverSource()
{
  uint64_t result = qword_26B1830B8;
  if (!qword_26B1830B8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24D001150(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for DriverKitDriverSource();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t *initializeBufferWithCopyOfBuffer for DriverKitDriverSource(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v7 = type metadata accessor for DriverKitDriverApp();
    uint64_t v8 = *(void *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      memcpy(a1, a2, *(void *)(v6 + 64));
    }
    else
    {
      int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
      uint64_t v11 = *a2;
      if (EnumCaseMultiPayload == 1)
      {
        unint64_t v12 = a2[1];
        sub_24CFE7000(v11, v12);
        *a1 = v11;
        a1[1] = v12;
      }
      else
      {
        uint64_t v13 = a2[1];
        *a1 = v11;
        a1[1] = v13;
        uint64_t v14 = (int *)type metadata accessor for SettingsApplicationRecord();
        uint64_t v15 = v14[5];
        uint64_t v34 = (char *)a1 + v15;
        uint64_t v16 = (char *)a2 + v15;
        uint64_t v17 = sub_24D006880();
        uint64_t v18 = *(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 16);
        swift_bridgeObjectRetain();
        v18(v34, v16, v17);
        uint64_t v19 = v14[6];
        unint64_t v20 = (char *)a1 + v19;
        uint64_t v21 = (char *)a2 + v19;
        unint64_t v22 = *((void *)v21 + 1);
        if (v22 >> 60 == 15)
        {
          *(_OWORD *)unint64_t v20 = *(_OWORD *)v21;
        }
        else
        {
          uint64_t v23 = *(void *)v21;
          sub_24CFE7000(*(void *)v21, *((void *)v21 + 1));
          *(void *)unint64_t v20 = v23;
          *((void *)v20 + 1) = v22;
        }
        *(uint64_t *)((char *)a1 + v14[7]) = *(uint64_t *)((char *)a2 + v14[7]);
        uint64_t v24 = v14[8];
        uint64_t v25 = (uint64_t *)((char *)a1 + v24);
        uint64_t v26 = (uint64_t *)((char *)a2 + v24);
        uint64_t v27 = *v26;
        unint64_t v28 = v26[1];
        swift_bridgeObjectRetain();
        sub_24CFE7000(v27, v28);
        *uint64_t v25 = v27;
        v25[1] = v28;
        uint64_t v29 = v14[9];
        uint64_t v30 = (uint64_t *)((char *)a1 + v29);
        uint64_t v31 = (uint64_t *)((char *)a2 + v29);
        uint64_t v32 = v31[1];
        *uint64_t v30 = *v31;
        v30[1] = v32;
        swift_bridgeObjectRetain();
      }
      swift_storeEnumTagMultiPayload();
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
  }
  return a1;
}

uint64_t destroy for DriverKitDriverSource(uint64_t *a1)
{
  uint64_t v2 = type metadata accessor for DriverKitDriverApp();
  uint64_t result = (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v2 - 8) + 48))(a1, 1, v2);
  if (!result)
  {
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v4 = *a1;
      unint64_t v5 = a1[1];
      return sub_24CFE71CC(v4, v5);
    }
    else
    {
      swift_bridgeObjectRelease();
      uint64_t v6 = (int *)type metadata accessor for SettingsApplicationRecord();
      uint64_t v7 = (char *)a1 + v6[5];
      uint64_t v8 = sub_24D006880();
      (*(void (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
      uint64_t v9 = (uint64_t *)((char *)a1 + v6[6]);
      unint64_t v10 = v9[1];
      if (v10 >> 60 != 15) {
        sub_24CFE71CC(*v9, v10);
      }
      swift_bridgeObjectRelease();
      sub_24CFE71CC(*(uint64_t *)((char *)a1 + v6[8]), *(uint64_t *)((char *)a1 + v6[8] + 8));
      return swift_bridgeObjectRelease();
    }
  }
  return result;
}

uint64_t *initializeWithCopy for DriverKitDriverSource(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for DriverKitDriverApp();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    uint64_t v9 = *a2;
    if (EnumCaseMultiPayload == 1)
    {
      unint64_t v10 = a2[1];
      sub_24CFE7000(v9, v10);
      *a1 = v9;
      a1[1] = v10;
    }
    else
    {
      uint64_t v11 = a2[1];
      *a1 = v9;
      a1[1] = v11;
      unint64_t v12 = (int *)type metadata accessor for SettingsApplicationRecord();
      uint64_t v13 = v12[5];
      uint64_t v32 = (char *)a1 + v13;
      uint64_t v14 = (char *)a2 + v13;
      uint64_t v15 = sub_24D006880();
      uint64_t v16 = *(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16);
      swift_bridgeObjectRetain();
      v16(v32, v14, v15);
      uint64_t v17 = v12[6];
      uint64_t v18 = (char *)a1 + v17;
      uint64_t v19 = (char *)a2 + v17;
      unint64_t v20 = *((void *)v19 + 1);
      if (v20 >> 60 == 15)
      {
        *(_OWORD *)uint64_t v18 = *(_OWORD *)v19;
      }
      else
      {
        uint64_t v21 = *(void *)v19;
        sub_24CFE7000(*(void *)v19, *((void *)v19 + 1));
        *(void *)uint64_t v18 = v21;
        *((void *)v18 + 1) = v20;
      }
      *(uint64_t *)((char *)a1 + v12[7]) = *(uint64_t *)((char *)a2 + v12[7]);
      uint64_t v22 = v12[8];
      uint64_t v23 = (uint64_t *)((char *)a1 + v22);
      uint64_t v24 = (uint64_t *)((char *)a2 + v22);
      uint64_t v25 = *v24;
      unint64_t v26 = v24[1];
      swift_bridgeObjectRetain();
      sub_24CFE7000(v25, v26);
      *uint64_t v23 = v25;
      v23[1] = v26;
      uint64_t v27 = v12[9];
      unint64_t v28 = (uint64_t *)((char *)a1 + v27);
      uint64_t v29 = (uint64_t *)((char *)a2 + v27);
      uint64_t v30 = v29[1];
      void *v28 = *v29;
      v28[1] = v30;
      swift_bridgeObjectRetain();
    }
    swift_storeEnumTagMultiPayload();
    (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  return a1;
}

uint64_t *assignWithCopy for DriverKitDriverSource(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for DriverKitDriverApp();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (v9)
  {
    if (!v10)
    {
      int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
      uint64_t v12 = *a2;
      if (EnumCaseMultiPayload == 1)
      {
        unint64_t v13 = a2[1];
        sub_24CFE7000(v12, v13);
        *a1 = v12;
        a1[1] = v13;
      }
      else
      {
        *a1 = v12;
        a1[1] = a2[1];
        uint64_t v17 = (int *)type metadata accessor for SettingsApplicationRecord();
        uint64_t v18 = v17[5];
        uint64_t v55 = (char *)a1 + v18;
        uint64_t v19 = (char *)a2 + v18;
        uint64_t v20 = sub_24D006880();
        uint64_t v21 = *(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 16);
        swift_bridgeObjectRetain();
        v21(v55, v19, v20);
        uint64_t v22 = v17[6];
        uint64_t v23 = (char *)a1 + v22;
        uint64_t v24 = (char *)a2 + v22;
        unint64_t v25 = *((void *)v24 + 1);
        if (v25 >> 60 == 15)
        {
          *(_OWORD *)uint64_t v23 = *(_OWORD *)v24;
        }
        else
        {
          uint64_t v26 = *(void *)v24;
          sub_24CFE7000(*(void *)v24, *((void *)v24 + 1));
          *(void *)uint64_t v23 = v26;
          *((void *)v23 + 1) = v25;
        }
        *(uint64_t *)((char *)a1 + v17[7]) = *(uint64_t *)((char *)a2 + v17[7]);
        uint64_t v27 = v17[8];
        unint64_t v28 = (uint64_t *)((char *)a1 + v27);
        uint64_t v29 = (uint64_t *)((char *)a2 + v27);
        uint64_t v30 = *v29;
        unint64_t v31 = v29[1];
        swift_bridgeObjectRetain();
        sub_24CFE7000(v30, v31);
        uint64_t *v28 = v30;
        v28[1] = v31;
        uint64_t v32 = v17[9];
        unint64_t v33 = (uint64_t *)((char *)a1 + v32);
        uint64_t v34 = (uint64_t *)((char *)a2 + v32);
        *unint64_t v33 = *v34;
        v33[1] = v34[1];
        swift_bridgeObjectRetain();
      }
      swift_storeEnumTagMultiPayload();
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
      return a1;
    }
LABEL_7:
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    return a1;
  }
  if (v10)
  {
    sub_24D002378((uint64_t)a1, (uint64_t (*)(void))type metadata accessor for DriverKitDriverApp);
    goto LABEL_7;
  }
  if (a1 != a2)
  {
    sub_24D002378((uint64_t)a1, (uint64_t (*)(void))type metadata accessor for DriverKitDriverApp);
    int v14 = swift_getEnumCaseMultiPayload();
    uint64_t v15 = *a2;
    if (v14 == 1)
    {
      unint64_t v16 = a2[1];
      sub_24CFE7000(v15, v16);
      *a1 = v15;
      a1[1] = v16;
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      *a1 = v15;
      a1[1] = a2[1];
      id v36 = (int *)type metadata accessor for SettingsApplicationRecord();
      uint64_t v37 = v36[5];
      uint64_t v38 = (char *)a1 + v37;
      uint64_t v39 = (char *)a2 + v37;
      uint64_t v40 = sub_24D006880();
      uint64_t v41 = *(void (**)(char *, char *, uint64_t))(*(void *)(v40 - 8) + 16);
      swift_bridgeObjectRetain();
      v41(v38, v39, v40);
      uint64_t v42 = v36[6];
      uint64_t v43 = (char *)a1 + v42;
      uint64_t v44 = (char *)a2 + v42;
      unint64_t v45 = *((void *)v44 + 1);
      if (v45 >> 60 == 15)
      {
        *(_OWORD *)uint64_t v43 = *(_OWORD *)v44;
      }
      else
      {
        uint64_t v46 = *(void *)v44;
        sub_24CFE7000(*(void *)v44, *((void *)v44 + 1));
        *(void *)uint64_t v43 = v46;
        *((void *)v43 + 1) = v45;
      }
      *(uint64_t *)((char *)a1 + v36[7]) = *(uint64_t *)((char *)a2 + v36[7]);
      uint64_t v47 = v36[8];
      uint64_t v48 = (uint64_t *)((char *)a1 + v47);
      uint64_t v49 = (uint64_t *)((char *)a2 + v47);
      uint64_t v50 = *v49;
      unint64_t v51 = v49[1];
      swift_bridgeObjectRetain();
      sub_24CFE7000(v50, v51);
      *uint64_t v48 = v50;
      v48[1] = v51;
      uint64_t v52 = v36[9];
      uint64_t v53 = (uint64_t *)((char *)a1 + v52);
      uint64_t v54 = (uint64_t *)((char *)a2 + v52);
      *uint64_t v53 = *v54;
      v53[1] = v54[1];
      swift_bridgeObjectRetain();
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

_OWORD *initializeWithTake for DriverKitDriverSource(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for DriverKitDriverApp();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(_OWORD *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(a1, a2, *(void *)(v7 + 64));
    }
    else
    {
      *a1 = *a2;
      uint64_t v8 = (int *)type metadata accessor for SettingsApplicationRecord();
      uint64_t v9 = v8[5];
      int v10 = (char *)a1 + v9;
      uint64_t v11 = (char *)a2 + v9;
      uint64_t v12 = sub_24D006880();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(v10, v11, v12);
      *(_OWORD *)((char *)a1 + v8[6]) = *(_OWORD *)((char *)a2 + v8[6]);
      *(void *)((char *)a1 + v8[7]) = *(void *)((char *)a2 + v8[7]);
      *(_OWORD *)((char *)a1 + v8[8]) = *(_OWORD *)((char *)a2 + v8[8]);
      *(_OWORD *)((char *)a1 + v8[9]) = *(_OWORD *)((char *)a2 + v8[9]);
      swift_storeEnumTagMultiPayload();
    }
    (*(void (**)(_OWORD *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  return a1;
}

_OWORD *assignWithTake for DriverKitDriverSource(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for DriverKitDriverApp();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(_OWORD *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (!v10)
    {
      if (a1 == a2) {
        return a1;
      }
      sub_24D002378((uint64_t)a1, (uint64_t (*)(void))type metadata accessor for DriverKitDriverApp);
      if (!swift_getEnumCaseMultiPayload())
      {
        *a1 = *a2;
        uint64_t v18 = (int *)type metadata accessor for SettingsApplicationRecord();
        uint64_t v19 = v18[5];
        uint64_t v20 = (char *)a1 + v19;
        uint64_t v21 = (char *)a2 + v19;
        uint64_t v22 = sub_24D006880();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v22 - 8) + 32))(v20, v21, v22);
        *(_OWORD *)((char *)a1 + v18[6]) = *(_OWORD *)((char *)a2 + v18[6]);
        *(void *)((char *)a1 + v18[7]) = *(void *)((char *)a2 + v18[7]);
        *(_OWORD *)((char *)a1 + v18[8]) = *(_OWORD *)((char *)a2 + v18[8]);
        *(_OWORD *)((char *)a1 + v18[9]) = *(_OWORD *)((char *)a2 + v18[9]);
        swift_storeEnumTagMultiPayload();
        return a1;
      }
      size_t v11 = *(void *)(v7 + 64);
      goto LABEL_8;
    }
    sub_24D002378((uint64_t)a1, (uint64_t (*)(void))type metadata accessor for DriverKitDriverApp);
LABEL_7:
    size_t v11 = *(void *)(*(void *)(a3 - 8) + 64);
LABEL_8:
    memcpy(a1, a2, v11);
    return a1;
  }
  if (v10) {
    goto LABEL_7;
  }
  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(a1, a2, *(void *)(v7 + 64));
  }
  else
  {
    *a1 = *a2;
    uint64_t v12 = (int *)type metadata accessor for SettingsApplicationRecord();
    uint64_t v13 = v12[5];
    int v14 = (char *)a1 + v13;
    uint64_t v15 = (char *)a2 + v13;
    uint64_t v16 = sub_24D006880();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 32))(v14, v15, v16);
    *(_OWORD *)((char *)a1 + v12[6]) = *(_OWORD *)((char *)a2 + v12[6]);
    *(void *)((char *)a1 + v12[7]) = *(void *)((char *)a2 + v12[7]);
    *(_OWORD *)((char *)a1 + v12[8]) = *(_OWORD *)((char *)a2 + v12[8]);
    *(_OWORD *)((char *)a1 + v12[9]) = *(_OWORD *)((char *)a2 + v12[9]);
    swift_storeEnumTagMultiPayload();
  }
  (*(void (**)(_OWORD *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for DriverKitDriverSource(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24D002060);
}

uint64_t sub_24D002060(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for DriverKitDriverApp();
  unsigned int v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48))(a1, a2, v4);
  if (v5 >= 2) {
    return v5 - 1;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for DriverKitDriverSource(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24D0020E0);
}

uint64_t sub_24D0020E0(uint64_t a1, int a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = (a2 + 1);
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = type metadata accessor for DriverKitDriverApp();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56);

  return v7(a1, v5, a3, v6);
}

uint64_t sub_24D002160(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for DriverKitDriverApp();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 48);

  return v3(a1, 1, v2);
}

uint64_t sub_24D0021C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for DriverKitDriverApp();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, 1, v4);
}

uint64_t sub_24D002238()
{
  uint64_t result = type metadata accessor for DriverKitDriverApp();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataSinglePayload();
    return 0;
  }
  return result;
}

uint64_t sub_24D0022B0(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_24D002318(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1830C8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24D002378(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_24D0023D8(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B182FF0);
  uint64_t v2 = (void *)sub_24D006DD0();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (unsigned char *)(a1 + 48);
  while (1)
  {
    uint64_t v5 = *((void *)v4 - 2);
    uint64_t v6 = *((void *)v4 - 1);
    char v7 = *v4;
    swift_bridgeObjectRetain();
    unint64_t result = sub_24CFF0024(v5, v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    int v10 = (uint64_t *)(v2[6] + 16 * result);
    *int v10 = v5;
    v10[1] = v6;
    *(unsigned char *)(v2[7] + result) = v7;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v4 += 24;
    v2[2] = v13;
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

unint64_t sub_24D0024EC(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26984D460);
  uint64_t v2 = (void *)sub_24D006DD0();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 56);
  while (1)
  {
    uint64_t v5 = *(v4 - 3);
    uint64_t v6 = *(v4 - 2);
    uint64_t v8 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t result = sub_24CFF0024(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v11 = v5;
    v11[1] = v6;
    BOOL v12 = (void *)(v2[7] + 16 * result);
    void *v12 = v8;
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

unint64_t sub_24D002610(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B183030);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (void *)((char *)v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (!*(void *)(a1 + 16))
  {
    uint64_t v7 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B183190);
  uint64_t v6 = sub_24D006DD0();
  uint64_t v7 = (void *)v6;
  uint64_t v8 = *(void *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  uint64_t v9 = (uint64_t)v5 + *(int *)(v2 + 48);
  uint64_t v10 = v6 + 64;
  unint64_t v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v25[1] = a1;
  uint64_t v12 = a1 + v11;
  uint64_t v13 = *(void *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_24D0045AC(v12, (uint64_t)v5);
    uint64_t v14 = *v5;
    uint64_t v15 = v5[1];
    unint64_t result = sub_24CFF0050(*v5, v15);
    if (v17) {
      break;
    }
    unint64_t v18 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v19 = (uint64_t *)(v7[6] + 16 * result);
    *uint64_t v19 = v14;
    v19[1] = v15;
    uint64_t v20 = v7[7];
    uint64_t v21 = type metadata accessor for SettingsApplicationRecord();
    unint64_t result = sub_24CFE8A10(v9, v20 + *(void *)(*(void *)(v21 - 8) + 72) * v18);
    uint64_t v22 = v7[2];
    BOOL v23 = __OFADD__(v22, 1);
    uint64_t v24 = v22 + 1;
    if (v23) {
      goto LABEL_11;
    }
    uint64_t v7[2] = v24;
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

void *DriverKitDaemonClient.__allocating_init()()
{
  unint64_t result = (void *)swift_allocObject();
  result[3] = 0;
  result[4] = 0;
  result[2] = 0;
  return result;
}

uint64_t DriverKitDaemonClient.registerForApprovalsChangeNotification(_:)(uint64_t a1, uint64_t a2)
{
  sub_24D0024EC(MEMORY[0x263F8EE78]);
  uint64_t v4 = (void *)sub_24D006A30();
  swift_bridgeObjectRelease();
  _CFXPCCreateXPCObjectFromCFObject();

  sub_24D0031DC();
  sub_24D006A90();
  swift_bridgeObjectRelease();
  xpc_set_event();
  swift_release();
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = a1;
  *(void *)(v5 + 24) = a2;
  v8[4] = sub_24D004390;
  v8[5] = v5;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 1107296256;
  v8[2] = sub_24D004398;
  v8[3] = &block_descriptor_0;
  uint64_t v6 = _Block_copy(v8);
  swift_retain();
  swift_release();
  xpc_set_event_stream_handler("com.apple.driverkitd.DriverApprovalsChanged", 0, v6);
  _Block_release(v6);
  return swift_unknownObjectRelease();
}

Swift::Void __swiftcall DriverKitDaemonClient.unregisterForApprovalsChangeNotification()()
{
  sub_24D0031DC();
  sub_24D006A90();
  swift_bridgeObjectRelease();
  xpc_set_event();

  swift_release();
}

uint64_t DriverKitDaemonClient.getApprovalStateForSettings(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)sub_24D002E88();
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = a1;
  *(void *)(v5 + 24) = a2;
  uint64_t v16 = sub_24D004410;
  uint64_t v17 = v5;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v13 = 1107296256;
  uint64_t v14 = sub_24D0036A4;
  uint64_t v15 = &block_descriptor_6;
  uint64_t v6 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  id v7 = objc_msgSend(v4, sel_remoteObjectProxyWithErrorHandler_, v6);
  _Block_release(v6);

  sub_24D006C90();
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B183068);
  swift_dynamicCast();
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a1;
  *(void *)(v8 + 24) = a2;
  uint64_t v16 = sub_24D004418;
  uint64_t v17 = v8;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v13 = 1107296256;
  uint64_t v14 = sub_24D003F74;
  uint64_t v15 = &block_descriptor_12;
  uint64_t v9 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v11, sel_getApprovalStateForSettingsWithReplyBlock_, v9);
  _Block_release(v9);
  return swift_unknownObjectRelease();
}

uint64_t DriverKitDaemonClient.enqueueApprovalStateUpdate(request:)(uint64_t a1)
{
  uint64_t v3 = (void *)sub_24D002E88();
  uint64_t v21 = sub_24D004420;
  uint64_t v22 = a1;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v18 = 1107296256;
  uint64_t v19 = sub_24D0036A4;
  uint64_t v20 = &block_descriptor_15;
  uint64_t v4 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  id v5 = objc_msgSend(v3, sel_remoteObjectProxyWithErrorHandler_, v4);
  _Block_release(v4);

  sub_24D006C90();
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B183068);
  swift_dynamicCast();
  sub_24D006850();
  swift_allocObject();
  sub_24D006840();
  uint64_t v6 = *(void *)(a1 + 24);
  uint64_t v7 = *(void *)(a1 + 32);
  unint64_t v8 = *(void *)(a1 + 40);
  char v9 = *(unsigned char *)(a1 + 48);
  uint64_t aBlock = *(void *)(a1 + 16);
  uint64_t v18 = v6;
  uint64_t v19 = (void (*)(uint64_t, void *))v7;
  uint64_t v20 = (void *)v8;
  LOBYTE(v21) = v9;
  swift_bridgeObjectRetain();
  sub_24CFF1EAC(v7, v8);
  sub_24CFF4F94();
  uint64_t v10 = sub_24D006830();
  unint64_t v12 = v11;
  swift_bridgeObjectRelease();
  sub_24CFF1620(v7, v8);
  if (v1)
  {
    swift_unknownObjectRelease();
    return swift_release();
  }
  else
  {
    swift_release();
    uint64_t v14 = (void *)sub_24D006890();
    uint64_t v21 = sub_24D004428;
    uint64_t v22 = a1;
    uint64_t aBlock = MEMORY[0x263EF8330];
    uint64_t v18 = 1107296256;
    uint64_t v19 = sub_24D004198;
    uint64_t v20 = &block_descriptor_18;
    uint64_t v15 = _Block_copy(&aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v16, sel_enqueueApprovalStateUpdateWithEntry_replyBlock_, v14, v15);
    _Block_release(v15);

    sub_24CFE71CC(v10, v12);
    return swift_unknownObjectRelease();
  }
}

uint64_t sub_24D002E88()
{
  uint64_t v1 = *(void **)(v0 + 16);
  if (v1)
  {
    id v2 = *(id *)(v0 + 16);
LABEL_5:
    id v11 = v1;
    return (uint64_t)v2;
  }
  id v3 = objc_allocWithZone(MEMORY[0x263F08D68]);
  uint64_t v4 = (void *)sub_24D006A50();
  id v5 = objc_msgSend(v3, sel_initWithMachServiceName_options_, v4, 4096);

  uint64_t v17 = sub_24D003100;
  uint64_t v18 = 0;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v14 = 1107296256;
  uint64_t v15 = sub_24CFF7198;
  uint64_t v16 = &block_descriptor_48;
  uint64_t v6 = _Block_copy(&aBlock);
  objc_msgSend(v5, sel_setInterruptionHandler_, v6);
  _Block_release(v6);
  uint64_t v17 = sub_24D003100;
  uint64_t v18 = 0;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v14 = 1107296256;
  uint64_t v15 = sub_24CFF7198;
  uint64_t v16 = &block_descriptor_51;
  uint64_t v7 = _Block_copy(&aBlock);
  objc_msgSend(v5, sel_setInvalidationHandler_, v7);
  _Block_release(v7);
  id v8 = objc_msgSend(self, sel_interfaceWithProtocol_, &unk_26FF62760);
  objc_msgSend(v5, sel_setRemoteObjectInterface_, v8);

  id v9 = objc_msgSend(v5, sel_remoteObjectInterface);
  if (v9)
  {
    objc_msgSend(v5, sel_resume);
    uint64_t v10 = *(void **)(v0 + 16);
    *(void *)(v0 + 16) = v5;
    id v2 = v5;

    uint64_t v1 = 0;
    goto LABEL_5;
  }
  uint64_t result = sub_24D006D90();
  __break(1u);
  return result;
}

void sub_24D003104()
{
  __swift_instantiateConcreteTypeFromMangledName(qword_26B1831A0);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_24D007930;
  *(void *)(v0 + 56) = MEMORY[0x263F8D310];
  *(void *)(v0 + 64) = sub_24D000120();
  *(void *)(v0 + 32) = 0xD000000000000022;
  *(void *)(v0 + 40) = 0x800000024D00B030;
  sub_24D004614();
  id v1 = (id)sub_24D006C50();
  sub_24D006BE0();
  sub_24D006910();
  swift_bridgeObjectRelease();
}

unint64_t sub_24D0031DC()
{
  if (*(void *)(v0 + 32))
  {
    unint64_t v1 = *(void *)(v0 + 24);
  }
  else
  {
    unint64_t v1 = sub_24D003248();
    *(void *)(v0 + 24) = v1;
    *(void *)(v0 + 32) = v2;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v1;
}

unint64_t sub_24D003248()
{
  uint64_t v0 = sub_24D006900();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  id v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v5 = 0;
  unint64_t v6 = 0xE000000000000000;
  sub_24D006CC0();
  swift_bridgeObjectRelease();
  unint64_t v5 = 0xD00000000000002BLL;
  unint64_t v6 = 0x800000024D00B280;
  sub_24D0068F0();
  sub_24D0046A8();
  sub_24D006EC0();
  sub_24D006AD0();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return v5;
}

void *DriverKitDaemonClient.init()()
{
  uint64_t result = v0;
  v0[2] = 0;
  v0[3] = 0;
  v0[4] = 0;
  return result;
}

Swift::String_optional __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> DriverKitDaemonClient.dumpState()()
{
  uint64_t v0 = swift_allocObject();
  *(void *)(v0 + 16) = 0;
  uint64_t v1 = (void **)(v0 + 16);
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 16) = 0;
  *(void *)(v2 + 24) = 0;
  id v3 = (void *)sub_24D002E88();
  uint64_t v17 = sub_24D0044A0;
  uint64_t v18 = v0;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v14 = 1107296256;
  uint64_t v15 = sub_24D0036A4;
  uint64_t v16 = &block_descriptor_27;
  uint64_t v4 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  id v5 = objc_msgSend(v3, sel_synchronousRemoteObjectProxyWithErrorHandler_, v4);
  _Block_release(v4);

  sub_24D006C90();
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B183068);
  if (swift_dynamicCast())
  {
    unint64_t v6 = v12;
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v0;
    *(void *)(v7 + 24) = v2;
    uint64_t v17 = (void (*)(void *))sub_24D004730;
    uint64_t v18 = v7;
    uint64_t aBlock = MEMORY[0x263EF8330];
    uint64_t v14 = 1107296256;
    uint64_t v15 = sub_24D00370C;
    uint64_t v16 = &block_descriptor_33_0;
    id v8 = _Block_copy(&aBlock);
    swift_retain();
    swift_retain();
    swift_release();
    objc_msgSend(v12, sel_dumpStateWithReplyBlock_, v8);
    _Block_release(v8);
    swift_beginAccess();
    uint64_t v1 = *(void ***)(v0 + 16);
    if (v1)
    {
      v1;
      swift_willThrow();
      swift_release();
      swift_release();
      swift_unknownObjectRelease();
    }
    else
    {
      swift_unknownObjectRelease();
      swift_beginAccess();
      unint64_t v6 = *(void **)(v2 + 16);
      uint64_t v1 = *(void ***)(v2 + 24);
      swift_bridgeObjectRetain();
      swift_release();
      swift_release();
    }
  }
  else
  {
    swift_beginAccess();
    unint64_t v6 = *v1;
    if (*v1) {
      v6;
    }
    else {
      objc_msgSend(objc_allocWithZone(MEMORY[0x263F087E8]), sel_init);
    }
    swift_willThrow();
    swift_release();
    swift_release();
  }
  uint64_t v9 = (uint64_t)v6;
  uint64_t v10 = v1;
  result.value._object = v10;
  result.value._uint64_t countAndFlagsBits = v9;
  return result;
}

void sub_24D0036A4(uint64_t a1, void *a2)
{
  id v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t sub_24D00370C(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = *(void (**)(uint64_t, uint64_t, void *))(a1 + 32);
  if (a2)
  {
    uint64_t v5 = sub_24D006A60();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  swift_retain();
  id v8 = a3;
  v4(v5, v7, a3);
  swift_release();

  return swift_bridgeObjectRelease();
}

Swift::String_optional __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> DriverKitDaemonClient.launchDriver(bundleID:userServerName:tag:)(Swift::String bundleID, Swift::String userServerName, Swift::String_optional tag)
{
  object = tag.value._object;
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = 0;
  uint64_t v5 = (void **)(v4 + 16);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = 0;
  *(void *)(v6 + 24) = 0;
  uint64_t v7 = (void *)sub_24D002E88();
  BOOL v23 = sub_24D0044A0;
  uint64_t v24 = v4;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v20 = 1107296256;
  uint64_t v21 = sub_24D0036A4;
  uint64_t v22 = &block_descriptor_38;
  id v8 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  id v9 = objc_msgSend(v7, sel_synchronousRemoteObjectProxyWithErrorHandler_, v8);
  _Block_release(v8);

  sub_24D006C90();
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B183068);
  if (swift_dynamicCast())
  {
    uint64_t v7 = v18;
    uint64_t v10 = (void *)sub_24D006A50();
    id v11 = (void *)sub_24D006A50();
    if (object) {
      object = (void *)sub_24D006A50();
    }
    uint64_t v12 = swift_allocObject();
    *(void *)(v12 + 16) = v4;
    *(void *)(v12 + 24) = v6;
    BOOL v23 = sub_24D004504;
    uint64_t v24 = v12;
    uint64_t aBlock = MEMORY[0x263EF8330];
    uint64_t v20 = 1107296256;
    uint64_t v21 = sub_24D00370C;
    uint64_t v22 = &block_descriptor_44;
    uint64_t v13 = _Block_copy(&aBlock);
    swift_retain();
    swift_retain();
    swift_release();
    objc_msgSend(v18, sel_launchDriverWithBundleID_userServerName_tag_replyBlock_, v10, v11, object, v13);
    _Block_release(v13);

    swift_beginAccess();
    uint64_t v14 = *(void **)(v4 + 16);
    if (v14)
    {
      v14;
      swift_willThrow();
      swift_release();
      swift_release();
      swift_unknownObjectRelease();
    }
    else
    {
      swift_unknownObjectRelease();
      swift_beginAccess();
      uint64_t v14 = *(void **)(v6 + 16);
      uint64_t v7 = *(void **)(v6 + 24);
      swift_bridgeObjectRetain();
      swift_release();
      swift_release();
    }
  }
  else
  {
    swift_beginAccess();
    uint64_t v14 = *v5;
    if (*v5) {
      v14;
    }
    else {
      objc_msgSend(objc_allocWithZone(MEMORY[0x263F087E8]), sel_init);
    }
    swift_willThrow();
    swift_release();
    swift_release();
  }
  uint64_t v15 = (uint64_t)v14;
  uint64_t v16 = v7;
  result.value._object = v16;
  result.value._uint64_t countAndFlagsBits = v15;
  return result;
}

void sub_24D003B24(void *a1, uint64_t a2)
{
  sub_24D006BD0();
  __swift_instantiateConcreteTypeFromMangledName(qword_26B1831A0);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_24D007930;
  id v5 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26984D438);
  uint64_t v6 = sub_24D006A80();
  uint64_t v8 = v7;
  *(void *)(v4 + 56) = MEMORY[0x263F8D310];
  *(void *)(v4 + 64) = sub_24D000120();
  *(void *)(v4 + 32) = v6;
  *(void *)(v4 + 40) = v8;
  sub_24D004614();
  id v9 = (void *)sub_24D006C50();
  sub_24D006920();
  swift_bridgeObjectRelease();

  uint64_t v10 = sub_24D006860();
  swift_beginAccess();
  id v11 = *(void **)(a2 + 16);
  *(void *)(a2 + 16) = v10;
}

uint64_t sub_24D003C54(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  swift_beginAccess();
  uint64_t v10 = *(void **)(a4 + 16);
  *(void *)(a4 + 16) = a3;
  id v11 = a3;

  swift_beginAccess();
  *(void *)(a5 + 16) = a1;
  *(void *)(a5 + 24) = a2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24D003CF8(void *a1, uint64_t (*a2)(void *, uint64_t))
{
  sub_24D006BD0();
  __swift_instantiateConcreteTypeFromMangledName(qword_26B1831A0);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_24D007930;
  id v5 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26984D438);
  uint64_t v6 = sub_24D006A80();
  uint64_t v8 = v7;
  *(void *)(v4 + 56) = MEMORY[0x263F8D310];
  *(void *)(v4 + 64) = sub_24D000120();
  *(void *)(v4 + 32) = v6;
  *(void *)(v4 + 40) = v8;
  sub_24D004614();
  id v9 = (void *)sub_24D006C50();
  sub_24D006920();
  swift_bridgeObjectRelease();

  return a2(a1, 1);
}

void sub_24D003E10(uint64_t a1, unint64_t a2, void *a3, void (*a4)(id, uint64_t))
{
  if (a2 >> 60 == 15)
  {
    if (a3) {
      id v9 = a3;
    }
    else {
      id v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F087E8]), sel_init);
    }
    id v8 = a3;
    a4(v9, 1);
  }
  else
  {
    sub_24D006820();
    swift_allocObject();
    sub_24CFE7000(a1, a2);
    sub_24D006810();
    sub_24D004654();
    sub_24D006800();
    swift_release();
    a4(v10, 0);
    sub_24CFF1620(a1, a2);
    sub_24D0005EC(v10, 0);
  }
}

uint64_t sub_24D003F74(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = a2;
  id v5 = *(void (**)(void *, unint64_t, void *))(a1 + 32);
  if (a2)
  {
    swift_retain();
    id v6 = v4;
    uint64_t v4 = (void *)sub_24D0068A0();
    unint64_t v8 = v7;
  }
  else
  {
    swift_retain();
    unint64_t v8 = 0xF000000000000000;
  }
  id v9 = a3;
  v5(v4, v8, a3);

  sub_24CFF1620((uint64_t)v4, v8);

  return swift_release();
}

void sub_24D004020(void *a1, uint64_t a2)
{
  sub_24D006BD0();
  __swift_instantiateConcreteTypeFromMangledName(qword_26B1831A0);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_24D007930;
  id v5 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26984D438);
  uint64_t v6 = sub_24D006A80();
  uint64_t v8 = v7;
  *(void *)(v4 + 56) = MEMORY[0x263F8D310];
  *(void *)(v4 + 64) = sub_24D000120();
  *(void *)(v4 + 32) = v6;
  *(void *)(v4 + 40) = v8;
  sub_24D004614();
  id v9 = (void *)sub_24D006C50();
  sub_24D006920();
  swift_bridgeObjectRelease();

  uint64_t v10 = *(void (**)(void *, uint64_t))(a2 + 56);
  id v11 = (void *)sub_24D006860();
  v10(v11, 1);
}

void sub_24D004138(void *a1, uint64_t a2)
{
  BOOL v3 = a1 != 0;
  uint64_t v4 = *(void (**)(void *, BOOL))(a2 + 56);
  id v5 = a1;
  v4(a1, v3);

  sub_24D000978(a1, v3);
}

void sub_24D004198(uint64_t a1, void *a2)
{
  BOOL v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

void sub_24D004204(void *a1, void (*a2)(void))
{
  if (xpc_dictionary_get_BOOL(a1, "com.apple.driverkitd.DriverApprovalsChanged"))
  {
    a2();
  }
  else if (xpc_dictionary_create_reply(a1))
  {
    xpc_dictionary_send_reply();
    swift_unknownObjectRelease();
  }
  else
  {
    sub_24D006BD0();
    __swift_instantiateConcreteTypeFromMangledName(qword_26B1831A0);
    uint64_t v4 = swift_allocObject();
    *(_OWORD *)(v4 + 16) = xmmword_24D007930;
    *(void *)(v4 + 56) = MEMORY[0x263F8D310];
    *(void *)(v4 + 64) = sub_24D000120();
    *(void *)(v4 + 32) = 0xD00000000000002BLL;
    *(void *)(v4 + 40) = 0x800000024D00A940;
    sub_24D004614();
    id v5 = (id)sub_24D006C50();
    sub_24D006920();
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_24D004358()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_24D004390(void *a1)
{
  sub_24D004204(a1, *(void (**)(void))(v1 + 16));
}

uint64_t sub_24D004398(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  uint64_t v2 = swift_unknownObjectRetain();
  v1(v2);
  swift_release();

  return swift_unknownObjectRelease();
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

uint64_t sub_24D004410(void *a1)
{
  return sub_24D003CF8(a1, *(uint64_t (**)(void *, uint64_t))(v1 + 16));
}

void sub_24D004418(uint64_t a1, unint64_t a2, void *a3)
{
  sub_24D003E10(a1, a2, a3, *(void (**)(id, uint64_t))(v3 + 16));
}

void sub_24D004420(void *a1)
{
  sub_24D004020(a1, v1);
}

void sub_24D004428(void *a1)
{
  sub_24D004138(a1, v1);
}

uint64_t sub_24D004430()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_24D004468()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_24D0044A0(void *a1)
{
  sub_24D003B24(a1, v1);
}

uint64_t objectdestroy_29Tm()
{
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24D004504(uint64_t a1, uint64_t a2, void *a3)
{
  return sub_24D003C54(a1, a2, a3, *(void *)(v3 + 16), *(void *)(v3 + 24));
}

uint64_t DriverKitDaemonClient.deinit()
{
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t DriverKitDaemonClient.__deallocating_deinit()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0228](v0, 40, 7);
}

uint64_t type metadata accessor for DriverKitDaemonClient()
{
  return self;
}

uint64_t sub_24D0045AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B183030);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_24D004614()
{
  unint64_t result = qword_26B183188;
  if (!qword_26B183188)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26B183188);
  }
  return result;
}

unint64_t sub_24D004654()
{
  unint64_t result = qword_26B1830E8;
  if (!qword_26B1830E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1830E8);
  }
  return result;
}

unint64_t sub_24D0046A8()
{
  unint64_t result = qword_26B183038;
  if (!qword_26B183038)
  {
    sub_24D006900();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B183038);
  }
  return result;
}

uint64_t DriverApprovalState.approvalState.getter()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24D0069B0();
  swift_release();
  swift_release();
  return v1;
}

uint64_t DriverApprovalState.approvalState.setter()
{
  swift_getKeyPath();
  swift_getKeyPath();
  id v1 = v0;
  return sub_24D0069C0();
}

uint64_t DriverApprovalState.updateStatus.setter()
{
  swift_getKeyPath();
  swift_getKeyPath();
  id v1 = v0;
  return sub_24D0069C0();
}

uint64_t DriverApprovalState.driver.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_24D004C64(v1 + OBJC_IVAR____SwiftDriverApprovalState_driver, a1);
}

uint64_t property wrapper backing initializer of DriverApprovalState.approvalState()
{
  return sub_24D006970();
}

uint64_t sub_24D0048EC@<X0>(unsigned char *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24D0069B0();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_24D004970(uint64_t a1, void **a2)
{
  uint64_t v2 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  id v3 = v2;
  return sub_24D0069C0();
}

uint64_t (*DriverApprovalState.approvalState.modify(void *a1))()
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_24D0069A0();
  return sub_24D004A70;
}

uint64_t DriverApprovalState.$approvalState.getter()
{
  return sub_24D004DD0((uint64_t)&OBJC_IVAR____SwiftDriverApprovalState__approvalState, &qword_26984D468);
}

uint64_t DriverApprovalState.$approvalState.setter(uint64_t a1)
{
  return sub_24D004E54(a1, &qword_26984D470, (uint64_t)&OBJC_IVAR____SwiftDriverApprovalState__approvalState, &qword_26984D468);
}

uint64_t (*DriverApprovalState.$approvalState.modify(void *a1))()
{
  id v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26984D470);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____SwiftDriverApprovalState__approvalState;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_26984D468);
  sub_24D006980();
  swift_endAccess();
  return sub_24D004BB4;
}

uint64_t property wrapper backing initializer of DriverApprovalState.updateStatus()
{
  return sub_24D006970();
}

uint64_t DriverApprovalState.updateStatus.getter()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24D0069B0();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_24D004C64(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for DriverKitDriver();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t (*DriverApprovalState.updateStatus.modify(void *a1))()
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_24D0069A0();
  return sub_24D004A70;
}

void sub_24D004D54(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 48))(*a1, 0);
  swift_release();
  swift_release();

  free(v1);
}

uint64_t DriverApprovalState.$updateStatus.getter()
{
  return sub_24D004DD0((uint64_t)&OBJC_IVAR____SwiftDriverApprovalState__updateStatus, &qword_26984D478);
}

uint64_t sub_24D004DD0(uint64_t a1, uint64_t *a2)
{
  return swift_endAccess();
}

uint64_t DriverApprovalState.$updateStatus.setter(uint64_t a1)
{
  return sub_24D004E54(a1, (uint64_t *)&unk_26984D480, (uint64_t)&OBJC_IVAR____SwiftDriverApprovalState__updateStatus, &qword_26984D478);
}

uint64_t sub_24D004E54(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v10 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(a4);
  sub_24D006990();
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
}

uint64_t (*DriverApprovalState.$updateStatus.modify(void *a1))()
{
  id v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26984D480);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____SwiftDriverApprovalState__updateStatus;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_26984D478);
  sub_24D006980();
  swift_endAccess();
  return sub_24D004BB4;
}

void sub_24D005094(uint64_t a1, char a2)
{
  id v3 = *(void **)a1;
  uint64_t v4 = *(void (**)(void, void, void))(*(void *)(*(void *)a1 + 88) + 16);
  v4(*(void *)(*(void *)a1 + 104), v3[14], v3[10]);
  uint64_t v5 = (void *)v3[14];
  size_t v6 = (void *)v3[12];
  uint64_t v7 = (void *)v3[13];
  uint64_t v8 = v3[10];
  uint64_t v9 = v3[11];
  if (a2)
  {
    v4(v3[12], v3[13], v3[10]);
    swift_beginAccess();
    sub_24D006990();
    swift_endAccess();
    uint64_t v10 = *(void (**)(void *, uint64_t))(v9 + 8);
    v10(v7, v8);
    v10(v5, v8);
  }
  else
  {
    swift_beginAccess();
    sub_24D006990();
    swift_endAccess();
    (*(void (**)(void *, uint64_t))(v9 + 8))(v5, v8);
  }
  free(v5);
  free(v7);
  free(v6);

  free(v3);
}

uint64_t DriverApprovalState.displayName.getter()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____SwiftDriverApprovalState_driver);
  uint64_t v2 = (uint64_t *)((char *)v1 + *(int *)(type metadata accessor for DriverKitDriver() + 24));
  if (v2[1])
  {
    uint64_t v3 = *v2;
  }
  else
  {
    uint64_t v3 = *v1;
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRetain();
  return v3;
}

uint64_t DriverApprovalState.usageText.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR____SwiftDriverApprovalState_driver;
  uint64_t v2 = *(void *)(v1 + *(int *)(type metadata accessor for DriverKitDriver() + 28));
  swift_bridgeObjectRetain();
  return v2;
}

Swift::Bool __swiftcall DriverApprovalState.updatePending()()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24D0069B0();
  swift_release();
  swift_release();
  if (v1) {
    swift_release();
  }
  return v1 != 0;
}

Swift::Bool __swiftcall DriverApprovalState.driverIsApproved()()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24D0069B0();
  swift_release();
  swift_release();
  if (v3)
  {
    int v0 = *(unsigned __int8 *)(v3 + 48);
    swift_release();
  }
  else
  {
    swift_getKeyPath();
    swift_getKeyPath();
    sub_24D0069B0();
    swift_release();
    swift_release();
    int v0 = v2;
  }
  return v0 == 1;
}

Swift::String __swiftcall DriverApprovalState.bundleIdentifier()()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____SwiftDriverApprovalState_driver);
  unsigned __int8 v2 = *(void **)(v0 + OBJC_IVAR____SwiftDriverApprovalState_driver + 8);
  swift_bridgeObjectRetain();
  uint64_t v3 = v1;
  uint64_t v4 = v2;
  result._object = v4;
  result._uint64_t countAndFlagsBits = v3;
  return result;
}

id DriverApprovalState.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

void DriverApprovalState.init()()
{
}

id DriverApprovalState.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t DriverApprovalState.id.getter()
{
  uint64_t v2 = *(void *)(v0 + OBJC_IVAR____SwiftDriverApprovalState_driver);
  swift_bridgeObjectRetain();
  sub_24D006AD0();
  type metadata accessor for DriverKitDriver();
  DriverKitDriverSource.description.getter();
  sub_24D006AD0();
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t sub_24D005898()
{
  return MEMORY[0x263F8D320];
}

uint64_t sub_24D0058A4@<X0>(void *a1@<X8>)
{
  uint64_t v3 = (uint64_t *)(*v1 + OBJC_IVAR____SwiftDriverApprovalState_driver);
  uint64_t v5 = *v3;
  uint64_t v6 = v3[1];
  swift_bridgeObjectRetain();
  sub_24D006AD0();
  type metadata accessor for DriverKitDriver();
  DriverKitDriverSource.description.getter();
  sub_24D006AD0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v5;
  a1[1] = v6;
  return result;
}

uint64_t sub_24D005934()
{
  return type metadata accessor for DriverApprovalState();
}

uint64_t type metadata accessor for DriverApprovalState()
{
  uint64_t result = qword_26B183050;
  if (!qword_26B183050) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_24D005988()
{
  type metadata accessor for DriverKitDriver();
  if (v0 <= 0x3F)
  {
    sub_24D005AAC(319, &qword_26B183118);
    if (v1 <= 0x3F)
    {
      sub_24D005AAC(319, &qword_26B183120);
      if (v2 <= 0x3F) {
        swift_updateClassMetadata2();
      }
    }
  }
}

void sub_24D005AAC(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t v3 = sub_24D0069D0();
    if (!v4) {
      atomic_store(v3, a2);
    }
  }
}

uint64_t sub_24D005AF4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for DriverKitDriver();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t SettingsApplicationRecord.init(bundleIdentifier:url:uniqueInstallIdentifier:driverExtensionPaths:installSessionIdentifier:localizedName:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, void *a9@<X8>, uint64_t a10, uint64_t a11)
{
  *a9 = a1;
  a9[1] = a2;
  uint64_t v17 = (int *)type metadata accessor for SettingsApplicationRecord();
  uint64_t v18 = (char *)a9 + v17[5];
  uint64_t v19 = sub_24D006880();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v19 - 8) + 32))(v18, a3, v19);
  uint64_t v21 = (void *)((char *)a9 + v17[6]);
  *uint64_t v21 = a4;
  v21[1] = a5;
  *(void *)((char *)a9 + v17[7]) = a6;
  uint64_t v22 = (void *)((char *)a9 + v17[8]);
  *uint64_t v22 = a7;
  v22[1] = a8;
  BOOL v23 = (void *)((char *)a9 + v17[9]);
  *BOOL v23 = a10;
  v23[1] = a11;
  return result;
}

uint64_t type metadata accessor for SettingsApplicationRecord()
{
  uint64_t result = qword_26B1830F0;
  if (!qword_26B1830F0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t SettingsApplicationRecord.bundleIdentifier.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t SettingsApplicationRecord.url.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for SettingsApplicationRecord() + 20);
  uint64_t v4 = sub_24D006880();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a1, v3, v4);
}

uint64_t SettingsApplicationRecord.uniqueInstallIdentifier.getter()
{
  uint64_t v1 = v0 + *(int *)(type metadata accessor for SettingsApplicationRecord() + 24);
  uint64_t v2 = *(void *)v1;
  sub_24CFF1EAC(*(void *)v1, *(void *)(v1 + 8));
  return v2;
}

uint64_t SettingsApplicationRecord.driverExtensionPaths.getter()
{
  type metadata accessor for SettingsApplicationRecord();

  return swift_bridgeObjectRetain();
}

uint64_t SettingsApplicationRecord.installSessionIdentifier.getter()
{
  uint64_t v1 = v0 + *(int *)(type metadata accessor for SettingsApplicationRecord() + 32);
  uint64_t v2 = *(void *)v1;
  sub_24CFE7000(*(void *)v1, *(void *)(v1 + 8));
  return v2;
}

uint64_t SettingsApplicationRecord.localizedName.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for SettingsApplicationRecord() + 36));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t *initializeBufferWithCopyOfBuffer for SettingsApplicationRecord(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v17 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v17 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    uint64_t v8 = a3[5];
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_24D006880();
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    uint64_t v13 = a3[6];
    uint64_t v14 = (char *)v4 + v13;
    uint64_t v15 = (char *)a2 + v13;
    unint64_t v16 = *((void *)v15 + 1);
    if (v16 >> 60 == 15)
    {
      *(_OWORD *)uint64_t v14 = *(_OWORD *)v15;
    }
    else
    {
      uint64_t v18 = *(void *)v15;
      sub_24CFE7000(*(void *)v15, *((void *)v15 + 1));
      *(void *)uint64_t v14 = v18;
      *((void *)v14 + 1) = v16;
    }
    uint64_t v19 = a3[8];
    *(uint64_t *)((char *)v4 + a3[7]) = *(uint64_t *)((char *)a2 + a3[7]);
    uint64_t v20 = (uint64_t *)((char *)v4 + v19);
    uint64_t v21 = *(uint64_t *)((char *)a2 + v19);
    unint64_t v22 = *(uint64_t *)((char *)a2 + v19 + 8);
    swift_bridgeObjectRetain();
    sub_24CFE7000(v21, v22);
    uint64_t *v20 = v21;
    v20[1] = v22;
    uint64_t v23 = a3[9];
    uint64_t v24 = (uint64_t *)((char *)v4 + v23);
    unint64_t v25 = (uint64_t *)((char *)a2 + v23);
    uint64_t v26 = v25[1];
    void *v24 = *v25;
    v24[1] = v26;
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t destroy for SettingsApplicationRecord(uint64_t a1, int *a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + a2[5];
  uint64_t v5 = sub_24D006880();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  uint64_t v6 = (uint64_t *)(a1 + a2[6]);
  unint64_t v7 = v6[1];
  if (v7 >> 60 != 15) {
    sub_24CFE71CC(*v6, v7);
  }
  swift_bridgeObjectRelease();
  sub_24CFE71CC(*(void *)(a1 + a2[8]), *(void *)(a1 + a2[8] + 8));

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for SettingsApplicationRecord(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = a3[5];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_24D006880();
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  uint64_t v12 = a3[6];
  uint64_t v13 = (char *)a1 + v12;
  uint64_t v14 = (char *)a2 + v12;
  unint64_t v15 = *((void *)v14 + 1);
  if (v15 >> 60 == 15)
  {
    *(_OWORD *)uint64_t v13 = *(_OWORD *)v14;
  }
  else
  {
    uint64_t v16 = *(void *)v14;
    sub_24CFE7000(*(void *)v14, *((void *)v14 + 1));
    *(void *)uint64_t v13 = v16;
    *((void *)v13 + 1) = v15;
  }
  uint64_t v17 = a3[8];
  *(void *)((char *)a1 + a3[7]) = *(void *)((char *)a2 + a3[7]);
  uint64_t v18 = (void *)((char *)a1 + v17);
  uint64_t v19 = *(void *)((char *)a2 + v17);
  unint64_t v20 = *(void *)((char *)a2 + v17 + 8);
  swift_bridgeObjectRetain();
  sub_24CFE7000(v19, v20);
  uint64_t *v18 = v19;
  v18[1] = v20;
  uint64_t v21 = a3[9];
  unint64_t v22 = (void *)((char *)a1 + v21);
  uint64_t v23 = (void *)((char *)a2 + v21);
  uint64_t v24 = v23[1];
  *unint64_t v22 = *v23;
  v22[1] = v24;
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for SettingsApplicationRecord(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_24D006880();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  uint64_t v10 = a3[6];
  uint64_t v11 = (void *)((char *)a1 + v10);
  uint64_t v12 = (void *)((char *)a2 + v10);
  unint64_t v13 = *(void *)((char *)a2 + v10 + 8);
  if (*(void *)((char *)a1 + v10 + 8) >> 60 != 15)
  {
    if (v13 >> 60 != 15)
    {
      uint64_t v15 = *v12;
      sub_24CFE7000(v15, v13);
      uint64_t v16 = *v11;
      unint64_t v17 = v11[1];
      *uint64_t v11 = v15;
      v11[1] = v13;
      sub_24CFE71CC(v16, v17);
      goto LABEL_8;
    }
    sub_24D006328((uint64_t)v11);
    goto LABEL_6;
  }
  if (v13 >> 60 == 15)
  {
LABEL_6:
    *(_OWORD *)uint64_t v11 = *(_OWORD *)v12;
    goto LABEL_8;
  }
  uint64_t v14 = *v12;
  sub_24CFE7000(v14, v13);
  *uint64_t v11 = v14;
  v11[1] = v13;
LABEL_8:
  *(void *)((char *)a1 + a3[7]) = *(void *)((char *)a2 + a3[7]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v18 = a3[8];
  uint64_t v19 = (void *)((char *)a1 + v18);
  unint64_t v20 = (void *)((char *)a2 + v18);
  uint64_t v21 = *v20;
  unint64_t v22 = v20[1];
  sub_24CFE7000(*v20, v22);
  uint64_t v23 = *v19;
  unint64_t v24 = v19[1];
  *uint64_t v19 = v21;
  v19[1] = v22;
  sub_24CFE71CC(v23, v24);
  uint64_t v25 = a3[9];
  uint64_t v26 = (void *)((char *)a1 + v25);
  uint64_t v27 = (void *)((char *)a2 + v25);
  void *v26 = *v27;
  v26[1] = v27[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_24D006328(uint64_t a1)
{
  return a1;
}

_OWORD *initializeWithTake for SettingsApplicationRecord(_OWORD *a1, _OWORD *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_24D006880();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = a3[7];
  *(_OWORD *)((char *)a1 + a3[6]) = *(_OWORD *)((char *)a2 + a3[6]);
  *(void *)((char *)a1 + v10) = *(void *)((char *)a2 + v10);
  uint64_t v11 = a3[9];
  *(_OWORD *)((char *)a1 + a3[8]) = *(_OWORD *)((char *)a2 + a3[8]);
  *(_OWORD *)((char *)a1 + v11) = *(_OWORD *)((char *)a2 + v11);
  return a1;
}

void *assignWithTake for SettingsApplicationRecord(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a3[5];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_24D006880();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  uint64_t v11 = a3[6];
  uint64_t v12 = (void *)((char *)a1 + v11);
  unint64_t v13 = (void *)((char *)a2 + v11);
  unint64_t v14 = *(void *)((char *)a1 + v11 + 8);
  if (v14 >> 60 != 15)
  {
    unint64_t v15 = v13[1];
    if (v15 >> 60 != 15)
    {
      uint64_t v16 = *v12;
      uint64_t *v12 = *v13;
      v12[1] = v15;
      sub_24CFE71CC(v16, v14);
      goto LABEL_6;
    }
    sub_24D006328((uint64_t)v12);
  }
  *(_OWORD *)uint64_t v12 = *(_OWORD *)v13;
LABEL_6:
  *(void *)((char *)a1 + a3[7]) = *(void *)((char *)a2 + a3[7]);
  swift_bridgeObjectRelease();
  uint64_t v17 = a3[8];
  uint64_t v18 = *(void *)((char *)a1 + v17);
  unint64_t v19 = *(void *)((char *)a1 + v17 + 8);
  *(_OWORD *)((char *)a1 + v17) = *(_OWORD *)((char *)a2 + v17);
  sub_24CFE71CC(v18, v19);
  uint64_t v20 = a3[9];
  uint64_t v21 = (void *)((char *)a1 + v20);
  unint64_t v22 = (void *)((char *)a2 + v20);
  uint64_t v24 = *v22;
  uint64_t v23 = v22[1];
  *uint64_t v21 = v24;
  v21[1] = v23;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SettingsApplicationRecord(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24D006570);
}

uint64_t sub_24D006570(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24D006880();
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
    unint64_t v12 = *(void *)(a1 + *(int *)(a3 + 36) + 8);
    if (v12 >= 0xFFFFFFFF) {
      LODWORD(v12) = -1;
    }
    return (v12 + 1);
  }
}

uint64_t storeEnumTagSinglePayload for SettingsApplicationRecord(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24D00664C);
}

uint64_t sub_24D00664C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_24D006880();
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
    *(void *)(a1 + *(int *)(a4 + 36) + 8) = (a2 - 1);
  }
  return result;
}

uint64_t sub_24D006710()
{
  uint64_t result = sub_24D006880();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_24D0067D0()
{
  return MEMORY[0x270EEE638]();
}

uint64_t sub_24D0067E0()
{
  return MEMORY[0x270EEE658]();
}

uint64_t sub_24D0067F0()
{
  return MEMORY[0x270EEE670]();
}

uint64_t sub_24D006800()
{
  return MEMORY[0x270EEF238]();
}

uint64_t sub_24D006810()
{
  return MEMORY[0x270EEF250]();
}

uint64_t sub_24D006820()
{
  return MEMORY[0x270EEF268]();
}

uint64_t sub_24D006830()
{
  return MEMORY[0x270EEF288]();
}

uint64_t sub_24D006840()
{
  return MEMORY[0x270EEF2A8]();
}

uint64_t sub_24D006850()
{
  return MEMORY[0x270EEF2B8]();
}

uint64_t sub_24D006860()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_24D006870()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_24D006880()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_24D006890()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_24D0068A0()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_24D0068B0()
{
  return MEMORY[0x270EF0190]();
}

uint64_t sub_24D0068D0()
{
  return MEMORY[0x270EF0BB8]();
}

uint64_t sub_24D0068E0()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_24D0068F0()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_24D006900()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_24D006910()
{
  return MEMORY[0x270FA2C68]();
}

uint64_t sub_24D006920()
{
  return MEMORY[0x270FA2C78]();
}

uint64_t sub_24D006930()
{
  return MEMORY[0x270FA2C98]();
}

uint64_t sub_24D006940()
{
  return MEMORY[0x270FA2CF8]();
}

uint64_t sub_24D006950()
{
  return MEMORY[0x270FA2D00]();
}

uint64_t sub_24D006960()
{
  return MEMORY[0x270EE3C20]();
}

uint64_t sub_24D006970()
{
  return MEMORY[0x270EE3DA8]();
}

uint64_t sub_24D006980()
{
  return MEMORY[0x270EE3DB0]();
}

uint64_t sub_24D006990()
{
  return MEMORY[0x270EE3DB8]();
}

uint64_t sub_24D0069A0()
{
  return MEMORY[0x270EE3DD0]();
}

uint64_t sub_24D0069B0()
{
  return MEMORY[0x270EE3DD8]();
}

uint64_t sub_24D0069C0()
{
  return MEMORY[0x270EE3DE0]();
}

uint64_t sub_24D0069D0()
{
  return MEMORY[0x270EE3DF0]();
}

uint64_t sub_24D0069E0()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_24D0069F0()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_24D006A00()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_24D006A10()
{
  return MEMORY[0x270FA0BA8]();
}

uint64_t sub_24D006A20()
{
  return MEMORY[0x270FA0BF0]();
}

uint64_t sub_24D006A30()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_24D006A40()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_24D006A50()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_24D006A60()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_24D006A70()
{
  return MEMORY[0x270EF1A50]();
}

uint64_t sub_24D006A80()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_24D006A90()
{
  return MEMORY[0x270F9D620]();
}

uint64_t sub_24D006AA0()
{
  return MEMORY[0x270F9D648]();
}

uint64_t sub_24D006AB0()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_24D006AC0()
{
  return MEMORY[0x270F9D748]();
}

uint64_t sub_24D006AD0()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_24D006AE0()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_24D006AF0()
{
  return MEMORY[0x270F9D800]();
}

uint64_t sub_24D006B00()
{
  return MEMORY[0x270F9D860]();
}

uint64_t sub_24D006B10()
{
  return MEMORY[0x270F9D8B0]();
}

uint64_t sub_24D006B20()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_24D006B30()
{
  return MEMORY[0x270F9DA98]();
}

uint64_t sub_24D006B40()
{
  return MEMORY[0x270F9DB18]();
}

uint64_t sub_24D006B50()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_24D006B60()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_24D006B70()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_24D006B80()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_24D006B90()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_24D006BA0()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_24D006BB0()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_24D006BC0()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_24D006BD0()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_24D006BE0()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_24D006BF0()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t sub_24D006C00()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_24D006C10()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_24D006C20()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_24D006C30()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t sub_24D006C40()
{
  return MEMORY[0x270FA2EB8]();
}

uint64_t sub_24D006C50()
{
  return MEMORY[0x270FA2ED0]();
}

uint64_t sub_24D006C60()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_24D006C70()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_24D006C80()
{
  return MEMORY[0x270EF2438]();
}

uint64_t sub_24D006C90()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_24D006CA0()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_24D006CB0()
{
  return MEMORY[0x270F9E9A0]();
}

uint64_t sub_24D006CC0()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_24D006CD0()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_24D006CE0()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_24D006CF0()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t sub_24D006D00()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t sub_24D006D10()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_24D006D20()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_24D006D30()
{
  return MEMORY[0x270F9EB30]();
}

uint64_t sub_24D006D40()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_24D006D50()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_24D006D60()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_24D006D70()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_24D006D80()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_24D006D90()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_24D006DA0()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_24D006DB0()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_24D006DC0()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_24D006DD0()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_24D006DE0()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_24D006DF0()
{
  return MEMORY[0x270F9F250]();
}

uint64_t sub_24D006E00()
{
  return MEMORY[0x270F9F258]();
}

uint64_t sub_24D006E10()
{
  return MEMORY[0x270F9F270]();
}

uint64_t sub_24D006E20()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_24D006E30()
{
  return MEMORY[0x270F9F308]();
}

uint64_t sub_24D006E40()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_24D006E50()
{
  return MEMORY[0x270F9F360]();
}

uint64_t sub_24D006E60()
{
  return MEMORY[0x270F9F390]();
}

uint64_t sub_24D006E70()
{
  return MEMORY[0x270F9F3B0]();
}

uint64_t sub_24D006E80()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_24D006E90()
{
  return MEMORY[0x270F9F448]();
}

uint64_t sub_24D006EA0()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_24D006EB0()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_24D006EC0()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_24D006ED0()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_24D006EE0()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_24D006EF0()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_24D006F00()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_24D006F10()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_24D006F20()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_24D006F30()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_24D006F40()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_24D006F50()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_24D006F60()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_24D006F70()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_24D006F80()
{
  return MEMORY[0x270F9FD98]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return MEMORY[0x270EE57A8]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
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

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDA468](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_enumerationMutation(id obj)
{
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

void objc_storeStrong(id *location, id obj)
{
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

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x270FA0200]();
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

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
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

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x270FA0460]();
}

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x270FA0470]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x270FA04C0]();
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

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x270FA0568]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x270FA0578]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x270FA05E8]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x270FA05F0]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x270FA05F8]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x270EDC020](original);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x270EDC050](xdict, key);
}

uint64_t xpc_dictionary_send_reply()
{
  return MEMORY[0x270EDC0D8]();
}

uint64_t xpc_set_event()
{
  return MEMORY[0x270EDC398]();
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}