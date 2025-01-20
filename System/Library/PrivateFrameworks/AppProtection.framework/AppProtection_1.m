uint64_t sub_247DCF4EC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int64_t v5;
  uint64_t result;
  int64_t v7;
  int64_t v8;
  uint64_t v9;
  int64_t v10;

  v1 = a1 + 56;
  v2 = 1 << *(unsigned char *)(a1 + 32);
  v3 = -1;
  if (v2 < 64) {
    v3 = ~(-1 << v2);
  }
  v4 = v3 & *(void *)(a1 + 56);
  v5 = (unint64_t)(v2 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v7 = 0;
  while (1)
  {
    if (v4)
    {
      v4 &= v4 - 1;
      goto LABEL_5;
    }
    v8 = v7 + 1;
    if (__OFADD__(v7, 1))
    {
      __break(1u);
      goto LABEL_21;
    }
    if (v8 >= v5) {
      return swift_release();
    }
    v9 = *(void *)(v1 + 8 * v8);
    ++v7;
    if (!v9)
    {
      v7 = v8 + 1;
      if (v8 + 1 >= v5) {
        return swift_release();
      }
      v9 = *(void *)(v1 + 8 * v7);
      if (!v9) {
        break;
      }
    }
LABEL_18:
    v4 = (v9 - 1) & v9;
LABEL_5:
    swift_bridgeObjectRetain();
    sub_247DD2A20();
    result = swift_bridgeObjectRelease();
  }
  v10 = v8 + 2;
  if (v10 >= v5) {
    return swift_release();
  }
  v9 = *(void *)(v1 + 8 * v10);
  if (v9)
  {
    v7 = v10;
    goto LABEL_18;
  }
  while (1)
  {
    v7 = v10 + 1;
    if (__OFADD__(v10, 1)) {
      break;
    }
    if (v7 >= v5) {
      return swift_release();
    }
    v9 = *(void *)(v1 + 8 * v7);
    ++v10;
    if (v9) {
      goto LABEL_18;
    }
  }
LABEL_21:
  __break(1u);
  return result;
}

uint64_t sub_247DCF644(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_247DD2A90();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4, v6);
  v8 = (char *)v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_247DD2AD0();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9, v11);
  v13 = (char *)v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = a2;
  *(void *)(v14 + 24) = v2;
  aBlock[4] = sub_247DD0074;
  aBlock[5] = v14;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_247D9DAFC;
  aBlock[3] = &block_descriptor_4_0;
  v15 = _Block_copy(aBlock);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_247DD2AB0();
  v17[1] = MEMORY[0x263F8EE78];
  sub_247D97EF0();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B138C20);
  sub_247D97F48();
  sub_247DD30B0();
  MEMORY[0x24C56A800](0, v13, v8, v15);
  _Block_release(v15);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v9);
  return swift_release();
}

uint64_t sub_247DCF8B4(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 16);
  if (v1)
  {
    uint64_t v2 = swift_bridgeObjectRetain() + 40;
    do
    {
      swift_bridgeObjectRetain();
      sub_247DD2A20();
      swift_bridgeObjectRelease();
      v2 += 16;
      --v1;
    }
    while (v1);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_247DCF940()
{
  uint64_t v1 = *v0;
  uint64_t v2 = sub_247DD2A90();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2, v4);
  uint64_t v6 = (char *)v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_247DD2AD0();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7, v9);
  uint64_t v11 = (char *)v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(*(void *)(v1 + 120) + 8) + 8))(*(void *)(v1 + 96));
  if (result)
  {
    aBlock[4] = sub_247DD006C;
    aBlock[5] = v0;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_247D9DAFC;
    aBlock[3] = &block_descriptor_23;
    v13 = _Block_copy(aBlock);
    swift_retain();
    sub_247DD2AB0();
    v14[1] = MEMORY[0x263F8EE78];
    sub_247D97EF0();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B138C20);
    sub_247D97F48();
    sub_247DD30B0();
    MEMORY[0x24C56A800](0, v11, v6, v13);
    _Block_release(v13);
    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
    (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
    return swift_release();
  }
  return result;
}

id *sub_247DCFBF0()
{
  uint64_t v1 = *v0;
  swift_release();

  swift_release();
  swift_release();
  (*(void (**)(char *))(*(void *)(v1[10] - 8) + 8))((char *)v0 + *((void *)*v0 + 20));
  (*(void (**)(char *))(*(void *)(v1[11] - 8) + 8))((char *)v0 + *((void *)*v0 + 21));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v0 + *((void *)*v0 + 22));
  (*(void (**)(char *))(*(void *)(v1[12] - 8) + 8))((char *)v0 + *((void *)*v0 + 23));
  return v0;
}

uint64_t sub_247DCFD4C()
{
  sub_247DCFBF0();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t type metadata accessor for ServerSettingsAuthority()
{
  return swift_getGenericMetadata();
}

uint64_t destroy for SettingsAuthorityEvent(uint64_t a1)
{
  return sub_247D485BC(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t _s13AppProtection22SettingsAuthorityEventOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 16);
  sub_247D485A4(*(void *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for SettingsAuthorityEvent(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 16);
  sub_247D485A4(*(void *)a2, v4, v5);
  uint64_t v6 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  unsigned __int8 v8 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v5;
  sub_247D485BC(v6, v7, v8);
  return a1;
}

uint64_t assignWithTake for SettingsAuthorityEvent(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  unsigned __int8 v6 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v3;
  sub_247D485BC(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for SettingsAuthorityEvent(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFC && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 252);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 4) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for SettingsAuthorityEvent(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFB)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)uint64_t result = a2 - 252;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFC) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFC) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_247DCFF48(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 3u) {
    return *(unsigned __int8 *)(a1 + 16);
  }
  else {
    return (*(_DWORD *)a1 + 4);
  }
}

uint64_t sub_247DCFF60(uint64_t result, unsigned int a2)
{
  if (a2 >= 4)
  {
    *(void *)uint64_t result = a2 - 4;
    *(void *)(result + 8) = 0;
    LOBYTE(a2) = 4;
  }
  *(unsigned char *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for SettingsAuthorityEvent()
{
  return &type metadata for SettingsAuthorityEvent;
}

uint64_t sub_247DCFF88()
{
  return sub_247DCE858();
}

id sub_247DCFFAC(unsigned __int8 a1, uint64_t a2, uint64_t a3, int a4)
{
  return sub_247DCE948(a1, a2, a3, a4 & 0x10101);
}

char *sub_247DCFFDC(uint64_t a1, uint64_t a2, int a3)
{
  return sub_247DCECB8(a1, a2, a3 & 0x10101);
}

uint64_t sub_247DD000C@<X0>(uint64_t a1@<X8>)
{
  return sub_247D3A424(*(void *)v1 + *(void *)(**(void **)v1 + 176), a1);
}

uint64_t sub_247DD0050()
{
  return swift_getWitnessTable();
}

uint64_t sub_247DD0074()
{
  return sub_247DCF8B4(*(void *)(v0 + 16));
}

id sub_247DD007C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  int v63 = a2;
  uint64_t v16 = *(void *)(a7 - 8);
  uint64_t v17 = MEMORY[0x270FA5388](a1, a2);
  v19 = &v62[-((v18 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v21 = *(void *)(v20 - 8);
  MEMORY[0x270FA5388](v17, v22);
  v24 = &v62[-((v23 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v69 = v25;
  uint64_t v70 = v26;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v68);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a5 - 8) + 16))(boxed_opaque_existential_1, a1, a5);
  v28 = *(void (**)(unsigned char *, uint64_t, uint64_t))(v21 + 16);
  uint64_t v64 = a6;
  v28(v24, a3, a6);
  uint64_t v29 = (*(uint64_t (**)(unsigned char *, uint64_t, uint64_t))(v16 + 16))(v19, a4, a7);
  if (qword_26B138D40 != -1) {
    uint64_t v29 = swift_once();
  }
  v31 = (os_unfair_lock_s *)qword_26B138D60;
  MEMORY[0x270FA5388](v29, v30);
  swift_retain();
  os_unfair_lock_lock(v31 + 6);
  sub_247D3A9F4((unint64_t)&v31[4], v65);
  os_unfair_lock_unlock(v31 + 6);
  int v32 = v65[0];
  swift_release();
  if (v32 == 2)
  {
    v66 = &type metadata for AppProtectionFeatures;
    unint64_t v67 = sub_247D3BE6C();
    v65[0] = 0;
    LOBYTE(v32) = sub_247DD2920();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v65);
  }
  if ((v32 & 1) == 0)
  {
    uint64_t v33 = sub_247DD2C20();
    uint64_t v35 = v34;
    v36 = _APErrorCodeDescription(2uLL);
    if (v36)
    {
      v37 = v36;
      uint64_t v38 = sub_247DD2C20();
      uint64_t v40 = v39;
    }
    else
    {
      uint64_t v38 = 0;
      uint64_t v40 = 0;
    }
    id v53 = sub_247D8F1D4(v33, v35, 2, v38, v40, 45, 0xD000000000000066, 0x8000000247DE0220, 0);
LABEL_22:
    id v52 = v53;
    swift_bridgeObjectRelease();
    goto LABEL_23;
  }
  if ((*(uint64_t (**)(uint64_t))(a10 + 8))(a7))
  {
    uint64_t v41 = sub_247DD2C20();
    uint64_t v43 = v42;
    v44 = _APErrorCodeDescription(0xCuLL);
    if (v44)
    {
      v45 = v44;
      uint64_t v46 = sub_247DD2C20();
      uint64_t v48 = v47;
    }
    else
    {
      uint64_t v46 = 0;
      uint64_t v48 = 0;
    }
    id v53 = sub_247D8F1D4(v41, v43, 12, v46, v48, 49, 0xD000000000000066, 0x8000000247DE0220, 0);
    goto LABEL_22;
  }
  if (v63)
  {
    uint64_t v49 = sub_247DD2C20();
    id v51 = sub_247D8F1D4(v49, v50, 3, 0xD000000000000026, 0x8000000247DDFE40, 53, 0xD000000000000066, 0x8000000247DE0220, 0);
LABEL_13:
    id v52 = v51;
LABEL_23:
    swift_bridgeObjectRelease();
    goto LABEL_24;
  }
  v54 = (void **)__swift_project_boxed_opaque_existential_1(v68, v69);
  id v52 = sub_247D3E6B0(*v54, v54[1]);
  if (v52)
  {
LABEL_24:
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v68);
    (*(void (**)(unsigned char *, uint64_t))(v21 + 8))(v24, v64);
    (*(void (**)(unsigned char *, uint64_t))(v16 + 8))(v19, a7);
    return v52;
  }
  id result = objc_msgSend((id)*__swift_project_boxed_opaque_existential_1(v68, v69), sel_bundleIdentifier);
  if (result)
  {
    v56 = result;
    uint64_t v57 = sub_247DD2C20();
    uint64_t v59 = v58;

    LOBYTE(v56) = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a9 + 8))(v57, v59, v64, a9);
    swift_bridgeObjectRelease();
    if ((v56 & 1) == 0)
    {
      uint64_t v60 = sub_247DD2C20();
      id v51 = sub_247D8F1D4(v60, v61, 9, 0xD000000000000023, 0x8000000247DE0290, 61, 0xD000000000000066, 0x8000000247DE0220, 0);
      goto LABEL_13;
    }
    id v52 = 0;
    goto LABEL_24;
  }
  __break(1u);
  return result;
}

id sub_247DD05E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v16 = *(void *)(a5 - 8);
  MEMORY[0x270FA5388](a1, a2);
  uint64_t v18 = (char *)&v60 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v68 = v19;
  uint64_t v69 = v20;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v67);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a4 - 8) + 16))(boxed_opaque_existential_1, a1, a4);
  v66[3] = a6;
  v66[4] = a9;
  uint64_t v60 = a9;
  uint64_t v22 = __swift_allocate_boxed_opaque_existential_1(v66);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a6 - 8) + 16))(v22, a2, a6);
  uint64_t v61 = v16;
  uint64_t v23 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v16 + 16))(v18, a3, a5);
  if (qword_26B138D40 != -1) {
    uint64_t v23 = swift_once();
  }
  uint64_t v25 = (os_unfair_lock_s *)qword_26B138D60;
  MEMORY[0x270FA5388](v23, v24);
  swift_retain();
  os_unfair_lock_lock(v25 + 6);
  sub_247D3B60C((unint64_t)&v25[4], (char *)v63);
  os_unfair_lock_unlock(v25 + 6);
  int v26 = LOBYTE(v63[0]);
  swift_release();
  if (v26 == 2)
  {
    uint64_t v64 = &type metadata for AppProtectionFeatures;
    unint64_t v65 = sub_247D3BE6C();
    LOBYTE(v63[0]) = 0;
    LOBYTE(v26) = sub_247DD2920();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v63);
  }
  uint64_t v27 = a5;
  if ((v26 & 1) == 0)
  {
    uint64_t v28 = sub_247DD2C20();
    uint64_t v30 = v29;
    v31 = _APErrorCodeDescription(2uLL);
    if (v31)
    {
      int v32 = v31;
      uint64_t v33 = sub_247DD2C20();
      uint64_t v35 = v34;
    }
    else
    {
      uint64_t v33 = 0;
      uint64_t v35 = 0;
    }
    id v57 = sub_247D8F1D4(v28, v30, 2, v33, v35, 22, 0xD000000000000052, 0x8000000247DE0160, 0);
LABEL_21:
    id v45 = v57;
    swift_bridgeObjectRelease();
LABEL_22:
    swift_bridgeObjectRelease();
    goto LABEL_23;
  }
  if ((*(uint64_t (**)(uint64_t, uint64_t))(a8 + 8))(a5, a8))
  {
    uint64_t v36 = sub_247DD2C20();
    uint64_t v38 = v37;
    uint64_t v39 = _APErrorCodeDescription(0xCuLL);
    if (v39)
    {
      uint64_t v40 = v39;
      uint64_t v41 = sub_247DD2C20();
      uint64_t v43 = v42;
    }
    else
    {
      uint64_t v41 = 0;
      uint64_t v43 = 0;
    }
    id v57 = sub_247D8F1D4(v36, v38, 12, v41, v43, 26, 0xD000000000000052, 0x8000000247DE0160, 0);
    goto LABEL_21;
  }
  v44 = (void **)__swift_project_boxed_opaque_existential_1(v67, v68);
  id v45 = sub_247D3E43C(*v44, v44[1]);
  if (v45)
  {
LABEL_23:
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v67);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v66);
    (*(void (**)(char *, uint64_t))(v61 + 8))(v18, v27);
    return v45;
  }
  id result = objc_msgSend((id)*__swift_project_boxed_opaque_existential_1(v67, v68), sel_bundleIdentifier);
  if (result)
  {
    uint64_t v47 = result;
    uint64_t v48 = sub_247DD2C20();
    uint64_t v50 = v49;

    uint64_t v51 = v60;
    LOBYTE(v47) = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v60 + 8))(v48, v50, a6, v60);
    swift_bridgeObjectRelease();
    sub_247D3A424((uint64_t)v66, (uint64_t)v63);
    sub_247D3A424((uint64_t)v67, (uint64_t)v62);
    if ((v47 & 1) == 0)
    {
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v63);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v62);
      goto LABEL_25;
    }
    __swift_project_boxed_opaque_existential_1(v63, (uint64_t)v64);
    id result = objc_msgSend((id)*__swift_project_boxed_opaque_existential_1(v62, v62[3]), sel_bundleIdentifier);
    if (result)
    {
      id v52 = result;
      uint64_t v53 = sub_247DD2C20();
      uint64_t v55 = v54;

      char v56 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v51 + 16))(v53, v55, a6, v51);
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v63);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v62);
      if (v56)
      {
        id v45 = 0;
        goto LABEL_23;
      }
LABEL_25:
      uint64_t v58 = sub_247DD2C20();
      id v45 = sub_247D8F1D4(v58, v59, 9, 0xD000000000000023, 0x8000000247DE01C0, 34, 0xD000000000000052, 0x8000000247DE0160, 0);
      goto LABEL_22;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_247DD0B84(unsigned __int8 a1, unsigned __int8 a2)
{
  switch(a1 >> 6)
  {
    case 1:
      if ((a2 & 0xC0) != 0x40) {
        goto LABEL_10;
      }
      goto LABEL_9;
    case 2:
      if ((a2 & 0xC0) != 0x80) {
        goto LABEL_10;
      }
      goto LABEL_9;
    case 3:
      if (a2 != 192) {
        goto LABEL_10;
      }
      uint64_t result = 1;
      break;
    default:
      if (a2 < 0x40u) {
LABEL_9:
      }
        uint64_t result = (((a1 & 1) == 0) ^ a2) & 1;
      else {
LABEL_10:
      }
        uint64_t result = 0;
      break;
  }
  return result;
}

uint64_t sub_247DD0C18()
{
  swift_bridgeObjectRelease();

  return swift_deallocObject();
}

uint64_t sub_247DD0C50()
{
  return swift_deallocObject();
}

uint64_t objectdestroyTm_0()
{
  swift_bridgeObjectRelease();
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_247DD0CA4()
{
  return sub_247DCF4EC(*(void *)(v0 + 16));
}

uint64_t getEnumTagSinglePayload for PreferenceSettingAction(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0x7D) {
    goto LABEL_17;
  }
  if (a2 + 131 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 131) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 131;
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
      return (*a1 | (v4 << 8)) - 131;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 131;
    }
  }
LABEL_17:
  unsigned int v6 = ((*a1 >> 6) & 0xFFFFFF83 | (4 * ((*a1 >> 1) & 0x1F))) ^ 0x7F;
  if (v6 >= 0x7C) {
    unsigned int v6 = -1;
  }
  return v6 + 1;
}

unsigned char *storeEnumTagSinglePayload for PreferenceSettingAction(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 131 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 131) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0x7D) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0x7C)
  {
    unsigned int v6 = ((a2 - 125) >> 8) + 1;
    *uint64_t result = a2 - 125;
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
        JUMPOUT(0x247DD0E24);
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
          *uint64_t result = 2 * (((-a2 >> 2) & 0x1F) - 32 * a2);
        break;
    }
  }
  return result;
}

uint64_t sub_247DD0E4C(unsigned __int8 *a1)
{
  unsigned int v1 = *a1;
  unsigned int v2 = v1 >> 6;
  unsigned int v3 = (v1 & 1) + 3;
  if (v2 == 3) {
    return v3;
  }
  else {
    return v2;
  }
}

unsigned char *sub_247DD0E68(unsigned char *result)
{
  *result &= 0x3Fu;
  return result;
}

unsigned char *sub_247DD0E78(unsigned char *result, unsigned int a2)
{
  if (a2 < 3) {
    *uint64_t result = *result & 1 | ((_BYTE)a2 << 6);
  }
  else {
    *uint64_t result = a2 & 1 ^ 0xC1;
  }
  return result;
}

ValueMetadata *type metadata accessor for PreferenceSettingAction()
{
  return &type metadata for PreferenceSettingAction;
}

void sub_247DD0ED0(uint64_t a1, void *a2)
{
  unsigned int v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t sub_247DD0F38()
{
  uint64_t v1 = *v0;
  uint64_t v16 = v0[1];
  uint64_t v17 = v1;
  uint64_t v2 = v0[2];
  uint64_t v14 = v0[3];
  uint64_t v15 = v2;
  uint64_t v3 = v0[5];
  uint64_t v13 = v0[4];
  uint64_t v11 = MEMORY[0x263F8EE88];
  uint64_t v12 = v3;
  sub_247DD1328((uint64_t)&v17);
  sub_247DD1328((uint64_t)&v16);
  sub_247DD1328((uint64_t)&v15);
  sub_247DD1328((uint64_t)&v14);
  sub_247DD1328((uint64_t)&v13);
  sub_247DD1328((uint64_t)&v12);
  uint64_t v4 = swift_bridgeObjectRetain();
  sub_247DD105C(v4);
  uint64_t v5 = swift_bridgeObjectRetain();
  sub_247DD105C(v5);
  uint64_t v6 = swift_bridgeObjectRetain();
  sub_247DD105C(v6);
  uint64_t v7 = swift_bridgeObjectRetain();
  sub_247DD105C(v7);
  uint64_t v8 = swift_bridgeObjectRetain();
  sub_247DD105C(v8);
  uint64_t v9 = swift_bridgeObjectRetain();
  sub_247DD105C(v9);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692C96A8);
  swift_arrayDestroy();
  return v11;
}

uint64_t sub_247DD105C(uint64_t result)
{
  uint64_t v1 = result;
  int64_t v2 = 0;
  uint64_t v3 = result + 56;
  uint64_t v4 = 1 << *(unsigned char *)(result + 32);
  uint64_t v5 = -1;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  unint64_t v6 = v5 & *(void *)(result + 56);
  int64_t v7 = (unint64_t)(v4 + 63) >> 6;
  while (1)
  {
    if (v6)
    {
      unint64_t v8 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      unint64_t v9 = v8 | (v2 << 6);
      goto LABEL_5;
    }
    int64_t v13 = v2 + 1;
    if (__OFADD__(v2, 1))
    {
      __break(1u);
LABEL_27:
      __break(1u);
      return result;
    }
    if (v13 >= v7) {
      goto LABEL_23;
    }
    unint64_t v14 = *(void *)(v3 + 8 * v13);
    ++v2;
    if (!v14)
    {
      int64_t v2 = v13 + 1;
      if (v13 + 1 >= v7) {
        goto LABEL_23;
      }
      unint64_t v14 = *(void *)(v3 + 8 * v2);
      if (!v14)
      {
        int64_t v2 = v13 + 2;
        if (v13 + 2 >= v7) {
          goto LABEL_23;
        }
        unint64_t v14 = *(void *)(v3 + 8 * v2);
        if (!v14)
        {
          int64_t v2 = v13 + 3;
          if (v13 + 3 >= v7) {
            goto LABEL_23;
          }
          unint64_t v14 = *(void *)(v3 + 8 * v2);
          if (!v14) {
            break;
          }
        }
      }
    }
LABEL_22:
    unint64_t v6 = (v14 - 1) & v14;
    unint64_t v9 = __clz(__rbit64(v14)) + (v2 << 6);
LABEL_5:
    uint64_t v10 = (uint64_t *)(*(void *)(v1 + 48) + 16 * v9);
    uint64_t v11 = *v10;
    uint64_t v12 = v10[1];
    swift_bridgeObjectRetain();
    sub_247D35EEC(&v16, v11, v12);
    uint64_t result = swift_bridgeObjectRelease();
  }
  int64_t v15 = v13 + 4;
  if (v15 < v7)
  {
    unint64_t v14 = *(void *)(v3 + 8 * v15);
    if (!v14)
    {
      while (1)
      {
        int64_t v2 = v15 + 1;
        if (__OFADD__(v15, 1)) {
          goto LABEL_27;
        }
        if (v2 >= v7) {
          goto LABEL_23;
        }
        unint64_t v14 = *(void *)(v3 + 8 * v2);
        ++v15;
        if (v14) {
          goto LABEL_22;
        }
      }
    }
    int64_t v2 = v15;
    goto LABEL_22;
  }
LABEL_23:

  return swift_release();
}

uint64_t sub_247DD11DC()
{
  return sub_247DD34A0();
}

uint64_t sub_247DD1224()
{
  return sub_247DD3470();
}

uint64_t sub_247DD1250()
{
  return sub_247DD34A0();
}

uint64_t sub_247DD1290()
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 24);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + 72);
  __swift_destroy_boxed_opaque_existential_1(v0 + 112);

  return swift_deallocObject();
}

uint64_t sub_247DD12E8()
{
  return swift_deallocObject();
}

uint64_t sub_247DD1320(unsigned char *a1)
{
  return sub_247D85E38(a1, *(void *)(v1 + 16));
}

uint64_t sub_247DD1328(uint64_t a1)
{
  return a1;
}

ValueMetadata *type metadata accessor for ExtantApplicationMap()
{
  return &type metadata for ExtantApplicationMap;
}

uint64_t *assignWithCopy for ServerBackedClientArena(uint64_t *a1, uint64_t *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  __swift_assign_boxed_opaque_existential_1(a1 + 1, a2 + 1);
  a1[6] = a2[6];
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  __swift_assign_boxed_opaque_existential_1(a1 + 7, a2 + 7);
  __swift_assign_boxed_opaque_existential_1(a1 + 12, a2 + 12);
  return a1;
}

uint64_t assignWithTake for ServerBackedClientArena(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(a1 + 8);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  uint64_t v4 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v4;
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(a1 + 56);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  __swift_destroy_boxed_opaque_existential_1(a1 + 96);
  long long v5 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 112) = v5;
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  return a1;
}

uint64_t getEnumTagSinglePayload for ServerBackedClientArena(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 136)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ServerBackedClientArena(uint64_t result, int a2, int a3)
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
    *(_OWORD *)(result + 120) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 136) = 1;
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
      *(void *)uint64_t result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 136) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ServerBackedClientArena()
{
  return &type metadata for ServerBackedClientArena;
}

uint64_t destroy for ClientStateDiff()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ClientStateDiff(uint64_t a1, uint64_t a2)
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
  *(_DWORD *)(a1 + 48) = *(_DWORD *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ClientStateDiff(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(unsigned char *)(a1 + 49) = *(unsigned char *)(a2 + 49);
  *(unsigned char *)(a1 + 50) = *(unsigned char *)(a2 + 50);
  *(unsigned char *)(a1 + 51) = *(unsigned char *)(a2 + 51);
  return a1;
}

__n128 __swift_memcpy52_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(_DWORD *)(a1 + 48) = *(_DWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for ClientStateDiff(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(unsigned char *)(a1 + 49) = *(unsigned char *)(a2 + 49);
  *(unsigned char *)(a1 + 50) = *(unsigned char *)(a2 + 50);
  *(unsigned char *)(a1 + 51) = *(unsigned char *)(a2 + 51);
  return a1;
}

uint64_t getEnumTagSinglePayload for ClientStateDiff(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 52)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ClientStateDiff(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_DWORD *)(result + 48) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 52) = 1;
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
    *(unsigned char *)(result + 52) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

id DataAccess.__allocating_init(entity:insertInto:)(void *a1, void *a2)
{
  id v5 = objc_msgSend(objc_allocWithZone(v2), sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

id DataAccess.init(entity:insertInto:)(void *a1, void *a2)
{
  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for DataAccess();
  id v5 = objc_msgSendSuper2(&v7, sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

uint64_t type metadata accessor for DataAccess()
{
  return self;
}

id DataAccess.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DataAccess();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id static DataAccess.fetchRequest()()
{
  id v0 = objc_allocWithZone(MEMORY[0x263EFF260]);
  uint64_t v1 = (void *)sub_247DD2BF0();
  id v2 = objc_msgSend(v0, sel_initWithEntityName_, v1);

  return v2;
}

uint64_t sub_247DD1A10()
{
  return MEMORY[0x263F8D1F8];
}

void sub_247DD1A1C(id *a1@<X0>, SEL *a2@<X3>, uint64_t *a3@<X8>)
{
  id v4 = [*a1 *a2];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = sub_247DD2C20();
    uint64_t v8 = v7;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v8 = 0;
  }
  *a3 = v6;
  a3[1] = v8;
}

void sub_247DD1A80(uint64_t a1, void **a2, uint64_t a3, uint64_t a4, SEL *a5)
{
  uint64_t v6 = *a2;
  if (*(void *)(a1 + 8)) {
    uint64_t v7 = sub_247DD2BF0();
  }
  else {
    uint64_t v7 = 0;
  }
  id v8 = (id)v7;
  [v6 *a5];
}

void sub_247DD1AF0(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3 = objc_msgSend(*a1, sel_raw_audit_token);
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = sub_247DD2870();
    unint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    unint64_t v7 = 0xF000000000000000;
  }
  *a2 = v5;
  a2[1] = v7;
}

void sub_247DD1B58(uint64_t a1, void **a2)
{
  id v2 = *a2;
  if (*(void *)(a1 + 8) >> 60 == 15) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = sub_247DD2860();
  }
  id v4 = (id)v3;
  objc_msgSend(v2, sel_setRaw_audit_token_);
}

uint64_t sub_247DD1BD0@<X0>(id *a1@<X0>, uint64_t a2@<X8>)
{
  id v3 = objc_msgSend(*a1, sel_transaction_uuid);
  if (v3)
  {
    id v4 = v3;
    sub_247DD28D0();

    uint64_t v5 = sub_247DD28F0();
    unint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56);
    uint64_t v7 = v5;
    uint64_t v8 = a2;
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v10 = sub_247DD28F0();
    unint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56);
    uint64_t v7 = v10;
    uint64_t v8 = a2;
    uint64_t v9 = 1;
  }

  return v6(v8, v9, 1, v7);
}

void sub_247DD1C98(uint64_t a1, void **a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B138C40);
  MEMORY[0x270FA5388](v4 - 8, v5);
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_247D74E30(a1, (uint64_t)v7);
  uint64_t v8 = *a2;
  uint64_t v9 = sub_247DD28F0();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v7, 1, v9) != 1)
  {
    uint64_t v11 = (void *)sub_247DD28B0();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v7, v9);
  }
  objc_msgSend(v8, sel_setTransaction_uuid_, v11);
}

uint64_t sub_247DD1DC4@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for DataAccess();
  uint64_t result = sub_247DD3150();
  *a1 = result;
  return result;
}

char *keypath_get_selector_accessed_bundle_id()
{
  return sel_accessed_bundle_id;
}

void sub_247DD1E14(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_247DD1E34(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

char *keypath_get_selector_accessor_bundle_id()
{
  return sel_accessor_bundle_id;
}

void sub_247DD1E60(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_247DD1E80(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

char *keypath_get_selector_raw_accessor_type()
{
  return sel_raw_accessor_type;
}

id sub_247DD1EAC@<X0>(id *a1@<X0>, _WORD *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_raw_accessor_type);
  *a2 = (_WORD)result;
  return result;
}

id sub_247DD1EE0(__int16 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setRaw_accessor_type_, *a1);
}

char *keypath_get_selector_raw_audit_token()
{
  return sel_raw_audit_token;
}

char *keypath_get_selector_transaction_uuid()
{
  return sel_transaction_uuid;
}

id PreferenceSetting.__allocating_init(entity:insertInto:)(void *a1, void *a2)
{
  id v5 = objc_msgSend(objc_allocWithZone(v2), sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

id PreferenceSetting.init(entity:insertInto:)(void *a1, void *a2)
{
  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for PreferenceSetting();
  id v5 = objc_msgSendSuper2(&v7, sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

id PreferenceSetting.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PreferenceSetting();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id static PreferenceSetting.fetchRequest()()
{
  id v0 = objc_allocWithZone(MEMORY[0x263EFF260]);
  uint64_t v1 = (void *)sub_247DD2BF0();
  id v2 = objc_msgSend(v0, sel_initWithEntityName_, v1);

  return v2;
}

void sub_247DD20D0(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3 = objc_msgSend(*a1, sel_bundleid);
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = sub_247DD2C20();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  *a2 = v5;
  a2[1] = v7;
}

void sub_247DD2138(uint64_t a1, void **a2)
{
  id v2 = *a2;
  if (*(void *)(a1 + 8)) {
    uint64_t v3 = sub_247DD2BF0();
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = (id)v3;
  objc_msgSend(v2, sel_setBundleid_);
}

uint64_t sub_247DD21A8@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for PreferenceSetting();
  uint64_t result = sub_247DD3150();
  *a1 = result;
  return result;
}

char *keypath_get_selector_bundleid()
{
  return sel_bundleid;
}

char *keypath_get_selector_hidden()
{
  return sel_hidden;
}

id sub_247DD220C@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_hidden);
  *a2 = (_BYTE)result;
  return result;
}

id sub_247DD2240(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setHidden_, *a1);
}

char *keypath_get_selector_locked()
{
  return sel_locked;
}

id sub_247DD2260@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_locked);
  *a2 = (_BYTE)result;
  return result;
}

id sub_247DD2294(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setLocked_, *a1);
}

char *keypath_get_selector_provisional()
{
  return sel_provisional;
}

id sub_247DD22B4@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_provisional);
  *a2 = (_BYTE)result;
  return result;
}

id sub_247DD22E8(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setProvisional_, *a1);
}

void APDoFirstRunWork_cold_1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_247D2E000, a2, OS_LOG_TYPE_ERROR, "Failed to open semaphore, not doing first-run work: errno=%{darwin.errno}d", (uint8_t *)v2, 8u);
}

void __APGetConnectionWithNameAndActiveCacheWithLock_block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_247D2E000, a2, OS_LOG_TYPE_ERROR, "connection to %@ interrupted", (uint8_t *)&v3, 0xCu);
}

void __APGetConnectionWithNameAndActiveCacheWithLock_block_invoke_113_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_247D2E000, a2, OS_LOG_TYPE_ERROR, "connection to %@ invalidated", (uint8_t *)&v3, 0xCu);
}

void __APGetAuditTokenForSelf_block_invoke_cold_1(int a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_247D2E000, a2, OS_LOG_TYPE_FAULT, "failed to get audit token for current process: %llx", (uint8_t *)&v2, 0xCu);
}

uint64_t sub_247DD2570()
{
  return MEMORY[0x270EEDE28]();
}

uint64_t sub_247DD2580()
{
  return MEMORY[0x270EEDE38]();
}

uint64_t sub_247DD2590()
{
  return MEMORY[0x270EEDE58]();
}

uint64_t sub_247DD25A0()
{
  return MEMORY[0x270EEDE70]();
}

uint64_t sub_247DD25B0()
{
  return MEMORY[0x270EEDEE8]();
}

uint64_t sub_247DD25C0()
{
  return MEMORY[0x270EEDF30]();
}

uint64_t sub_247DD25D0()
{
  return MEMORY[0x270EEDF38]();
}

uint64_t sub_247DD25E0()
{
  return MEMORY[0x270EEE360]();
}

uint64_t sub_247DD25F0()
{
  return MEMORY[0x270EEE378]();
}

uint64_t sub_247DD2600()
{
  return MEMORY[0x270EEE388]();
}

uint64_t sub_247DD2610()
{
  return MEMORY[0x270EEE390]();
}

uint64_t sub_247DD2620()
{
  return MEMORY[0x270EEE3B8]();
}

uint64_t sub_247DD2630()
{
  return MEMORY[0x270EEE3D0]();
}

uint64_t sub_247DD2640()
{
  return MEMORY[0x270EEE628]();
}

uint64_t sub_247DD2650()
{
  return MEMORY[0x270EEE638]();
}

uint64_t sub_247DD2660()
{
  return MEMORY[0x270EEE658]();
}

uint64_t sub_247DD2670()
{
  return MEMORY[0x270EEE670]();
}

uint64_t sub_247DD2680()
{
  return MEMORY[0x270EEE688]();
}

uint64_t sub_247DD2690()
{
  return MEMORY[0x270EEEF38]();
}

uint64_t sub_247DD26A0()
{
  return MEMORY[0x270EEEF88]();
}

uint64_t sub_247DD26B0()
{
  return MEMORY[0x270EEEFE8]();
}

uint64_t sub_247DD26C0()
{
  return MEMORY[0x270EEEFF8]();
}

uint64_t sub_247DD26D0()
{
  return MEMORY[0x270EEF238]();
}

uint64_t sub_247DD26E0()
{
  return MEMORY[0x270EEF250]();
}

uint64_t sub_247DD26F0()
{
  return MEMORY[0x270EEF268]();
}

uint64_t sub_247DD2700()
{
  return MEMORY[0x270EEF288]();
}

uint64_t sub_247DD2710()
{
  return MEMORY[0x270EEF2A8]();
}

uint64_t sub_247DD2720()
{
  return MEMORY[0x270EEF2B8]();
}

uint64_t sub_247DD2730()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_247DD2740()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_247DD2750()
{
  return MEMORY[0x270EEFA08]();
}

uint64_t sub_247DD2760()
{
  return MEMORY[0x270EEFA18]();
}

uint64_t sub_247DD2770()
{
  return MEMORY[0x270EEFC10]();
}

uint64_t sub_247DD2780()
{
  return MEMORY[0x270EEFC88]();
}

uint64_t sub_247DD2790()
{
  return MEMORY[0x270EEFCB0]();
}

uint64_t sub_247DD27A0()
{
  return MEMORY[0x270EEFCE8]();
}

uint64_t sub_247DD27B0()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_247DD27C0()
{
  return MEMORY[0x270EEFE08]();
}

uint64_t sub_247DD27D0()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_247DD27E0()
{
  return MEMORY[0x270EEFE68]();
}

uint64_t sub_247DD27F0()
{
  return MEMORY[0x270EEFE80]();
}

uint64_t sub_247DD2800()
{
  return MEMORY[0x270EEFF00]();
}

uint64_t sub_247DD2810()
{
  return MEMORY[0x270EEFF58]();
}

uint64_t sub_247DD2820()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_247DD2830()
{
  return MEMORY[0x270EEFFC8]();
}

uint64_t sub_247DD2840()
{
  return MEMORY[0x270EF0070]();
}

uint64_t sub_247DD2850()
{
  return MEMORY[0x270EF0108]();
}

uint64_t sub_247DD2860()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_247DD2870()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_247DD2880()
{
  return MEMORY[0x270EF01C0]();
}

uint64_t sub_247DD2890()
{
  return MEMORY[0x270EF0C58]();
}

uint64_t sub_247DD28A0()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_247DD28B0()
{
  return MEMORY[0x270EF0C88]();
}

uint64_t sub_247DD28C0()
{
  return MEMORY[0x270EF0CB0]();
}

uint64_t sub_247DD28D0()
{
  return MEMORY[0x270EF0CB8]();
}

uint64_t sub_247DD28E0()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_247DD28F0()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_247DD2900()
{
  return MEMORY[0x270EF0FA0]();
}

uint64_t sub_247DD2910()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_247DD2920()
{
  return MEMORY[0x270F28690]();
}

uint64_t sub_247DD2930()
{
  return MEMORY[0x270FA2C98]();
}

uint64_t sub_247DD2940()
{
  return MEMORY[0x270FA2CC0]();
}

uint64_t sub_247DD2950()
{
  return MEMORY[0x270FA2D00]();
}

uint64_t sub_247DD2960()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_247DD2970()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_247DD2980()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_247DD2990()
{
  return MEMORY[0x270FA1978]();
}

uint64_t sub_247DD29A0()
{
  return MEMORY[0x270FA19C0]();
}

uint64_t sub_247DD29B0()
{
  return MEMORY[0x270FA19D0]();
}

uint64_t sub_247DD29C0()
{
  return MEMORY[0x270FA1A00]();
}

uint64_t sub_247DD29D0()
{
  return MEMORY[0x270FA1A18]();
}

uint64_t sub_247DD29E0()
{
  return MEMORY[0x270FA1A28]();
}

uint64_t sub_247DD29F0()
{
  return MEMORY[0x270FA1A48]();
}

uint64_t sub_247DD2A00()
{
  return MEMORY[0x270FA1A50]();
}

uint64_t sub_247DD2A10()
{
  return MEMORY[0x270FA2C30]();
}

uint64_t sub_247DD2A20()
{
  return MEMORY[0x270EE3C50]();
}

uint64_t sub_247DD2A30()
{
  return MEMORY[0x270EE3C60]();
}

uint64_t sub_247DD2A40()
{
  return MEMORY[0x270EE3C70]();
}

uint64_t sub_247DD2A50()
{
  return MEMORY[0x270EE3C78]();
}

uint64_t sub_247DD2A60()
{
  return MEMORY[0x270EE3E08]();
}

uint64_t sub_247DD2A70()
{
  return MEMORY[0x270EE4008]();
}

uint64_t sub_247DD2A80()
{
  return MEMORY[0x270FA0970]();
}

uint64_t sub_247DD2A90()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_247DD2AA0()
{
  return MEMORY[0x270FA09D0]();
}

uint64_t sub_247DD2AB0()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_247DD2AC0()
{
  return MEMORY[0x270FA0A00]();
}

uint64_t sub_247DD2AD0()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_247DD2AE0()
{
  return MEMORY[0x270FA0AC0]();
}

uint64_t sub_247DD2AF0()
{
  return MEMORY[0x270FA0B00]();
}

uint64_t sub_247DD2B00()
{
  return MEMORY[0x270FA0B50]();
}

uint64_t sub_247DD2B10()
{
  return MEMORY[0x270FA0B60]();
}

uint64_t sub_247DD2B20()
{
  return MEMORY[0x270FA0B98]();
}

uint64_t sub_247DD2B30()
{
  return MEMORY[0x270FA0BA8]();
}

uint64_t sub_247DD2B40()
{
  return MEMORY[0x270FA0BB0]();
}

uint64_t sub_247DD2B50()
{
  return MEMORY[0x270FA0BF0]();
}

uint64_t sub_247DD2B60()
{
  return MEMORY[0x270F9CFC8]();
}

uint64_t sub_247DD2B70()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_247DD2B80()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_247DD2B90()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_247DD2BA0()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_247DD2BC0()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_247DD2BD0()
{
  return MEMORY[0x270EF18D0]();
}

uint64_t sub_247DD2BE0()
{
  return MEMORY[0x270EF1958]();
}

uint64_t sub_247DD2BF0()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_247DD2C00()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_247DD2C10()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_247DD2C20()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_247DD2C30()
{
  return MEMORY[0x270EF19F8]();
}

uint64_t sub_247DD2C40()
{
  return MEMORY[0x270EF1A10]();
}

uint64_t sub_247DD2C50()
{
  return MEMORY[0x270EF1A50]();
}

uint64_t sub_247DD2C60()
{
  return MEMORY[0x270EF1AA8]();
}

uint64_t sub_247DD2C70()
{
  return MEMORY[0x270EF1AD0]();
}

uint64_t sub_247DD2C80()
{
  return MEMORY[0x270EF1AE8]();
}

uint64_t sub_247DD2C90()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_247DD2CA0()
{
  return MEMORY[0x270F9D620]();
}

uint64_t sub_247DD2CB0()
{
  return MEMORY[0x270F9D658]();
}

uint64_t sub_247DD2CC0()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_247DD2CD0()
{
  return MEMORY[0x270F9D740]();
}

uint64_t sub_247DD2CE0()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_247DD2CF0()
{
  return MEMORY[0x270F9D7C0]();
}

uint64_t sub_247DD2D00()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_247DD2D10()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_247DD2D20()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_247DD2D30()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_247DD2D40()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_247DD2D50()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_247DD2D60()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_247DD2D70()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_247DD2D80()
{
  return MEMORY[0x270EF1BD8]();
}

uint64_t sub_247DD2D90()
{
  return MEMORY[0x270EF1C98]();
}

uint64_t sub_247DD2DA0()
{
  return MEMORY[0x270EF1CC0]();
}

uint64_t sub_247DD2DB0()
{
  return MEMORY[0x270F9DEB0]();
}

uint64_t sub_247DD2DC0()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_247DD2DD0()
{
  return MEMORY[0x270F9DF58]();
}

uint64_t sub_247DD2DE0()
{
  return MEMORY[0x270F9DF60]();
}

uint64_t sub_247DD2DF0()
{
  return MEMORY[0x270F9DFD0]();
}

uint64_t sub_247DD2E00()
{
  return MEMORY[0x270EF1CE0]();
}

uint64_t sub_247DD2E10()
{
  return MEMORY[0x270EF1DB8]();
}

uint64_t sub_247DD2E20()
{
  return MEMORY[0x270EF1E40]();
}

uint64_t sub_247DD2E30()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_247DD2E40()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_247DD2E50()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_247DD2E60()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_247DD2E70()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_247DD2E80()
{
  return MEMORY[0x270EF1F60]();
}

uint64_t sub_247DD2E90()
{
  return MEMORY[0x270FA0C20]();
}

uint64_t sub_247DD2EA0()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t sub_247DD2EB0()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_247DD2EC0()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_247DD2ED0()
{
  return MEMORY[0x270FA0D88]();
}

uint64_t sub_247DD2EE0()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_247DD2EF0()
{
  return MEMORY[0x270FA0DB0]();
}

uint64_t sub_247DD2F00()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t sub_247DD2F10()
{
  return MEMORY[0x270FA0DD0]();
}

uint64_t sub_247DD2F20()
{
  return MEMORY[0x270FA0DE8]();
}

uint64_t sub_247DD2F30()
{
  return MEMORY[0x270FA0DF8]();
}

uint64_t sub_247DD2F40()
{
  return MEMORY[0x270FA0E00]();
}

uint64_t sub_247DD2F50()
{
  return MEMORY[0x270FA0E28]();
}

uint64_t sub_247DD2F60()
{
  return MEMORY[0x270FA0E40]();
}

uint64_t sub_247DD2F70()
{
  return MEMORY[0x270FA0EA0]();
}

uint64_t sub_247DD2F80()
{
  return MEMORY[0x270FA0EB0]();
}

uint64_t sub_247DD2F90()
{
  return MEMORY[0x270FA0EC0]();
}

uint64_t sub_247DD2FA0()
{
  return MEMORY[0x270FA0EC8]();
}

uint64_t sub_247DD2FB0()
{
  return MEMORY[0x270FA0EE0]();
}

uint64_t sub_247DD2FC0()
{
  return MEMORY[0x270FA2E90]();
}

uint64_t sub_247DD2FD0()
{
  return MEMORY[0x270FA2EA8]();
}

uint64_t sub_247DD2FE0()
{
  return MEMORY[0x270EE4218]();
}

uint64_t sub_247DD2FF0()
{
  return MEMORY[0x270FA0F58]();
}

uint64_t sub_247DD3000()
{
  return MEMORY[0x270EF20D8]();
}

uint64_t sub_247DD3010()
{
  return MEMORY[0x270EF20F8]();
}

uint64_t sub_247DD3020()
{
  return MEMORY[0x270EF2180]();
}

uint64_t sub_247DD3030()
{
  return MEMORY[0x270EF2198]();
}

uint64_t sub_247DD3040()
{
  return MEMORY[0x270FA1170]();
}

uint64_t sub_247DD3050()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_247DD3060()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_247DD3070()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_247DD3080()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_247DD3090()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_247DD30B0()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_247DD30C0()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_247DD30D0()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_247DD30E0()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t sub_247DD30F0()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t sub_247DD3100()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_247DD3110()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_247DD3120()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_247DD3130()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_247DD3140()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_247DD3150()
{
  return MEMORY[0x270F9E9D8]();
}

uint64_t sub_247DD3160()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_247DD3170()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t sub_247DD3180()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_247DD3190()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_247DD31A0()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_247DD31B0()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_247DD31C0()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_247DD31D0()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_247DD31E0()
{
  return MEMORY[0x270F9ED40]();
}

uint64_t sub_247DD31F0()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_247DD3200()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_247DD3210()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_247DD3220()
{
  return MEMORY[0x270F9F000]();
}

uint64_t sub_247DD3230()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_247DD3240()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_247DD3250()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_247DD3260()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_247DD3270()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_247DD3290()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_247DD32A0()
{
  return MEMORY[0x270F9F2F0]();
}

uint64_t sub_247DD32B0()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_247DD32C0()
{
  return MEMORY[0x270F9F328]();
}

uint64_t sub_247DD32D0()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_247DD32E0()
{
  return MEMORY[0x270F9F430]();
}

uint64_t sub_247DD32F0()
{
  return MEMORY[0x270F9F438]();
}

uint64_t sub_247DD3300()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_247DD3310()
{
  return MEMORY[0x270F9F468]();
}

uint64_t sub_247DD3320()
{
  return MEMORY[0x270F9F470]();
}

uint64_t sub_247DD3330()
{
  return MEMORY[0x270F9F4C0]();
}

uint64_t sub_247DD3340()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_247DD3350()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_247DD3360()
{
  return MEMORY[0x270F9F770]();
}

uint64_t sub_247DD3370()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t sub_247DD3380()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_247DD3390()
{
  return MEMORY[0x270F9F918]();
}

uint64_t sub_247DD33A0()
{
  return MEMORY[0x270F9FA68]();
}

uint64_t sub_247DD33B0()
{
  return MEMORY[0x270F9FA88]();
}

uint64_t sub_247DD33C0()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_247DD33D0()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_247DD33E0()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_247DD33F0()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_247DD3400()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_247DD3410()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_247DD3420()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_247DD3430()
{
  return MEMORY[0x270EF26A8]();
}

uint64_t sub_247DD3440()
{
  return MEMORY[0x270F9FC28]();
}

uint64_t sub_247DD3450()
{
  return MEMORY[0x270F9FC40]();
}

uint64_t sub_247DD3460()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_247DD3470()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_247DD3480()
{
  return MEMORY[0x270F9FC70]();
}

uint64_t sub_247DD3490()
{
  return MEMORY[0x270F9FC78]();
}

uint64_t sub_247DD34A0()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_247DD34B0()
{
  return MEMORY[0x270F9FCA8]();
}

uint64_t sub_247DD34C0()
{
  return MEMORY[0x270F9FCD0]();
}

uint64_t sub_247DD34D0()
{
  return MEMORY[0x270F9FCD8]();
}

uint64_t sub_247DD34E0()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_247DD34F0()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t sub_247DD3520()
{
  return MEMORY[0x270FA0128]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x270F18A38]();
}

uint64_t DMIsMigrationNeeded()
{
  return MEMORY[0x270F25408]();
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x270F4AE40]();
}

uint64_t _AXSClarityBoardEnabled()
{
  return MEMORY[0x270F90660]();
}

uint64_t _AXSClarityBundleIdentifierForStandardBundleIdentifier()
{
  return MEMORY[0x270F90678]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return MEMORY[0x270EE5798]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

{
  return MEMORY[0x270F9A3C0]();
}

{
  return MEMORY[0x270F9A3C8]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

pid_t audit_token_to_pid(audit_token_t *atoken)
{
  return MEMORY[0x270F98178](atoken);
}

int audit_token_to_pidversion(audit_token_t *atoken)
{
  return MEMORY[0x270F98180](atoken);
}

void bzero(void *a1, size_t a2)
{
}

__uint64_t clock_gettime_nsec_np(clockid_t __clock_id)
{
  return MEMORY[0x270ED8EF8](*(void *)&__clock_id);
}

uint64_t container_copy_sandbox_token()
{
  return MEMORY[0x270ED8F88]();
}

uint64_t container_error_copy()
{
  return MEMORY[0x270ED8FC8]();
}

uint64_t container_error_copy_unlocalized_description()
{
  return MEMORY[0x270ED8FD0]();
}

uint64_t container_error_free()
{
  return MEMORY[0x270ED8FD8]();
}

uint64_t container_get_path()
{
  return MEMORY[0x270ED9008]();
}

uint64_t container_query_create()
{
  return MEMORY[0x270ED9060]();
}

uint64_t container_query_free()
{
  return MEMORY[0x270ED9068]();
}

uint64_t container_query_get_last_error()
{
  return MEMORY[0x270ED9070]();
}

uint64_t container_query_get_single_result()
{
  return MEMORY[0x270ED9078]();
}

uint64_t container_query_operation_set_flags()
{
  return MEMORY[0x270ED9090]();
}

uint64_t container_query_set_class()
{
  return MEMORY[0x270ED90A0]();
}

uint64_t container_query_set_persona_unique_string()
{
  return MEMORY[0x270ED90C0]();
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_main(void)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x270ED9628](__path, *(void *)&__mode);
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

uint32_t notify_cancel(int token)
{
  return MEMORY[0x270EDA738](*(void *)&token);
}

uint32_t notify_check(int token, int *check)
{
  return MEMORY[0x270EDA740](*(void *)&token, check);
}

BOOL notify_is_valid_token(int val)
{
  return MEMORY[0x270EDA750](*(void *)&val);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x270EDA760](name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x270EDA768](name, out_token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x270EDA770](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
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

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
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

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x270EDAA90]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

BOOL os_unfair_lock_trylock(os_unfair_lock_t lock)
{
  return MEMORY[0x270EDAAD8](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x270EDAB30]();
}

uint64_t os_variant_has_internal_ui()
{
  return MEMORY[0x270EDAB48]();
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x270EDB2B8]();
}

int sem_close(sem_t *a1)
{
  return MEMORY[0x270EDB330](a1);
}

sem_t *sem_open(const char *a1, int a2, ...)
{
  return (sem_t *)MEMORY[0x270EDB348](a1, *(void *)&a2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x270EDB5D8](*(void *)&__errnum);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x270FA0180]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x270FA0190]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x270FA01A0]();
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

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x270FA0208]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x270FA0238]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x270FA0288]();
}

uint64_t swift_dynamicCastObjCClassUnconditional()
{
  return MEMORY[0x270FA0290]();
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

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x270FA02F8]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x270FA0300]();
}

uint64_t swift_getDynamicType()
{
  return MEMORY[0x270FA0330]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x270FA0348]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
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

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x270FA0428]();
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

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x270FA0458]();
}

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x270FA0470]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x270FA0498]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x270FA04C0]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x270FA04D8]();
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

uint64_t swift_retain_n()
{
  return MEMORY[0x270FA0538]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x270FA0550]();
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

uint64_t swift_unexpectedError()
{
  return MEMORY[0x270FA0588]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x270FA0598]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x270FA05A8]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x270FA05D0]();
}

uint64_t swift_unknownObjectWeakCopyAssign()
{
  return MEMORY[0x270FA05D8]();
}

uint64_t swift_unknownObjectWeakCopyInit()
{
  return MEMORY[0x270FA05E0]();
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

uint64_t swift_unknownObjectWeakTakeAssign()
{
  return MEMORY[0x270FA0600]();
}

uint64_t swift_unknownObjectWeakTakeInit()
{
  return MEMORY[0x270FA0608]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}

uint64_t swift_weakAssign()
{
  return MEMORY[0x270FA0630]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x270FA0648]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x270FA0650]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x270FA0658]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}

uint64_t swift_willThrowTypedImpl()
{
  return MEMORY[0x270FA0678]();
}

kern_return_t task_info(task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return MEMORY[0x270EDB868](*(void *)&target_task, *(void *)&flavor, task_info_out, task_info_outCnt);
}

uint64_t tcc_authorization_record_get_authorization_reason()
{
  return MEMORY[0x270F79680]();
}

uint64_t tcc_authorization_record_get_authorization_right()
{
  return MEMORY[0x270F79688]();
}

uint64_t tcc_authorization_record_get_subject_identity()
{
  return MEMORY[0x270F796A8]();
}

uint64_t tcc_credential_create_for_process_with_audit_token()
{
  return MEMORY[0x270F796B0]();
}

uint64_t tcc_identity_get_identifier()
{
  return MEMORY[0x270F796E8]();
}

uint64_t tcc_identity_get_type()
{
  return MEMORY[0x270F796F0]();
}

uint64_t tcc_message_options_create()
{
  return MEMORY[0x270F796F8]();
}

uint64_t tcc_message_options_set_reply_handler_policy()
{
  return MEMORY[0x270F79700]();
}

uint64_t tcc_message_options_set_request_prompt_policy()
{
  return MEMORY[0x270F79708]();
}

uint64_t tcc_server_create()
{
  return MEMORY[0x270F79710]();
}

uint64_t tcc_server_message_get_authorization_records_by_service()
{
  return MEMORY[0x270F79720]();
}

uint64_t tcc_server_message_request_authorization()
{
  return MEMORY[0x270F79730]();
}

uint64_t tcc_service_singleton_for_name()
{
  return MEMORY[0x270F79760]();
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return MEMORY[0x270EDBCB8](activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return MEMORY[0x270EDBCE8](activity, state);
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x270EDBD10](xarray, applier);
}

xpc_object_t xpc_array_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x270EDBD20]();
}

void xpc_array_set_string(xpc_object_t xarray, size_t index, const char *string)
{
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return MEMORY[0x270EDBDE0](xBOOL);
}

uint64_t xpc_connection_set_non_launching()
{
  return MEMORY[0x270EDBEF8]();
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x270EDBF40](object);
}

uint64_t xpc_copy_entitlement_for_self()
{
  return MEMORY[0x270EDBF48]();
}

uint64_t xpc_copy_entitlement_for_token()
{
  return MEMORY[0x270EDBF50]();
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x270EDC008](keys, values, count);
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x270EDC018]();
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x270EDC020](original);
}

uint64_t xpc_dictionary_get_audit_token()
{
  return MEMORY[0x270EDC048]();
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x270EDC050](xdict, key);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x270EDC060](xdict, key, length);
}

xpc_object_t xpc_dictionary_get_dictionary(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x270EDC078](xdict, key);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x270EDC088](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x270EDC0A8](xdict, key);
}

uint64_t xpc_dictionary_send_reply()
{
  return MEMORY[0x270EDC0D8]();
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

uint64_t xpc_event_publisher_activate()
{
  return MEMORY[0x270EDC198]();
}

uint64_t xpc_event_publisher_create()
{
  return MEMORY[0x270EDC1A0]();
}

uint64_t xpc_event_publisher_fire()
{
  return MEMORY[0x270EDC1A8]();
}

uint64_t xpc_event_publisher_fire_with_reply()
{
  return MEMORY[0x270EDC1B0]();
}

uint64_t xpc_event_publisher_set_error_handler()
{
  return MEMORY[0x270EDC1B8]();
}

uint64_t xpc_event_publisher_set_handler()
{
  return MEMORY[0x270EDC1C0]();
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x270EDC200](object);
}

uint64_t xpc_set_event()
{
  return MEMORY[0x270EDC398]();
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x270EDC3F8](xstring);
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_PrivacyDisclosureCore(double a1)
{
  return a1;
}

void gotLoadHelper_x21__OBJC_CLASS___PDCPreflightManager(double a1)
{
  if (!atomic_load((unsigned int *)&dlopenHelperFlag_PrivacyDisclosureCore)) {
    dlopenHelper_PrivacyDisclosureCore(a1);
  }
}