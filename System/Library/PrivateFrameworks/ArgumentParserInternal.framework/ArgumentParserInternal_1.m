uint64_t ArgumentInfoV0.hashValue.getter()
{
  unsigned char v1[72];

  sub_24872D030();
  ArgumentInfoV0.hash(into:)((uint64_t)v1);
  return sub_24872D070();
}

uint64_t ArgumentInfoV0.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26931E818);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  v8 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = a1[3];
  v87 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v9);
  sub_24872A5E4();
  sub_24872D0B0();
  if (v2)
  {
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v87);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v52 = v6;
    LOBYTE(v53) = 0;
    sub_24872A6E0();
    sub_24872CD40();
    int v10 = v62;
    LOBYTE(v62) = 1;
    int v51 = sub_24872CD20();
    LOBYTE(v62) = 2;
    uint64_t v11 = sub_24872CCF0();
    uint64_t v13 = v12;
    int v50 = v10;
    LOBYTE(v62) = 3;
    swift_bridgeObjectRetain();
    int v48 = sub_24872CD20();
    uint64_t v49 = v13;
    LOBYTE(v62) = 4;
    int v46 = sub_24872CD20();
    uint64_t v47 = v11;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26931E800);
    LOBYTE(v53) = 5;
    sub_24872A734(&qword_26931E828, &qword_26931E800, (void (*)(void))sub_24872A7A0);
    sub_24872CD00();
    uint64_t v14 = v62;
    LOBYTE(v53) = 6;
    sub_24872A7A0();
    swift_bridgeObjectRetain();
    sub_24872CD00();
    uint64_t v15 = v62;
    uint64_t v44 = v63;
    uint64_t v45 = v14;
    LOBYTE(v62) = 7;
    uint64_t v16 = v64;
    swift_bridgeObjectRetain();
    uint64_t v40 = sub_24872CCF0();
    uint64_t v41 = v15;
    uint64_t v42 = v16;
    uint64_t v43 = v17;
    LOBYTE(v62) = 8;
    swift_bridgeObjectRetain();
    uint64_t v39 = sub_24872CCF0();
    uint64_t v19 = v18;
    char v20 = v50;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26931E1D8);
    LOBYTE(v53) = 9;
    sub_24872A430((unint64_t *)&qword_26931E2A0);
    uint64_t v38 = v19;
    swift_bridgeObjectRetain();
    sub_24872CD00();
    uint64_t v21 = v62;
    LOBYTE(v62) = 10;
    swift_bridgeObjectRetain();
    uint64_t v37 = sub_24872CCF0();
    uint64_t v23 = v22;
    char v82 = 11;
    swift_bridgeObjectRetain();
    uint64_t v36 = sub_24872CCF0();
    uint64_t v25 = v24;
    HIDWORD(v35) = v51 & 1;
    v48 &= 1u;
    int v51 = v46 & 1;
    (*(void (**)(char *, uint64_t))(v52 + 8))(v8, v5);
    uint64_t v26 = v25;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    LOBYTE(v53) = v20;
    BYTE1(v53) = BYTE4(v35);
    uint64_t v27 = v49;
    *((void *)&v53 + 1) = v47;
    *(void *)&long long v54 = v49;
    BYTE8(v54) = v48;
    BYTE9(v54) = v51;
    uint64_t v28 = v42;
    *(void *)&long long v55 = v45;
    *((void *)&v55 + 1) = v41;
    *(void *)&long long v56 = v44;
    *((void *)&v56 + 1) = v42;
    *(void *)&long long v57 = v40;
    *((void *)&v57 + 1) = v43;
    *(void *)&long long v58 = v39;
    *((void *)&v58 + 1) = v38;
    *(void *)&long long v59 = v21;
    *((void *)&v59 + 1) = v37;
    *(void *)&long long v60 = v23;
    *((void *)&v60 + 1) = v36;
    uint64_t v61 = v25;
    sub_24872A7F4((uint64_t)&v53);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v29 = v38;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    long long v30 = v60;
    *(_OWORD *)(a2 + 96) = v59;
    *(_OWORD *)(a2 + 112) = v30;
    *(void *)(a2 + 128) = v61;
    long long v31 = v56;
    *(_OWORD *)(a2 + 32) = v55;
    *(_OWORD *)(a2 + 48) = v31;
    long long v32 = v58;
    *(_OWORD *)(a2 + 64) = v57;
    *(_OWORD *)(a2 + 80) = v32;
    long long v33 = v54;
    *(_OWORD *)a2 = v53;
    *(_OWORD *)(a2 + 16) = v33;
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v87);
    LOBYTE(v62) = v50;
    BYTE1(v62) = BYTE4(v35);
    *(_DWORD *)((char *)&v62 + 2) = v85;
    HIWORD(v62) = v86;
    uint64_t v63 = v47;
    uint64_t v64 = v27;
    char v65 = v48;
    char v66 = v51;
    int v67 = v83;
    __int16 v68 = v84;
    uint64_t v69 = v45;
    uint64_t v70 = v41;
    uint64_t v71 = v44;
    uint64_t v72 = v28;
    uint64_t v73 = v40;
    uint64_t v74 = v43;
    uint64_t v75 = v39;
    uint64_t v76 = v29;
    uint64_t v77 = v21;
    uint64_t v78 = v37;
    uint64_t v79 = v23;
    uint64_t v80 = v36;
    uint64_t v81 = v26;
    return sub_24872A888((uint64_t)&v62);
  }
}

uint64_t sub_248728D38@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return ArgumentInfoV0.init(from:)(a1, a2);
}

uint64_t sub_248728D50(void *a1)
{
  return ArgumentInfoV0.encode(to:)(a1);
}

uint64_t sub_248728D68()
{
  sub_24872D030();
  ArgumentInfoV0.hash(into:)((uint64_t)v1);
  return sub_24872D070();
}

uint64_t sub_248728DAC()
{
  sub_24872D030();
  ArgumentInfoV0.hash(into:)((uint64_t)v1);
  return sub_24872D070();
}

uint64_t sub_248728DEC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  uint64_t result = sub_24872D040();
  if (v3)
  {
    uint64_t v5 = a2 + 48;
    do
    {
      v5 += 24;
      swift_bridgeObjectRetain();
      sub_24872C4D0();
      swift_bridgeObjectRelease();
      sub_24872C4D0();
      uint64_t result = swift_bridgeObjectRelease();
      --v3;
    }
    while (v3);
  }
  return result;
}

uint64_t sub_248728EDC(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 1684957547 && a2 == 0xE400000000000000;
  if (v2 || (sub_24872CEB0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1701667182 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_24872CEB0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_248728FB0(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 1684957547 && a2 == 0xE400000000000000;
  if (v2 || (sub_24872CEB0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6944646C756F6873 && a2 == 0xED000079616C7073 || (sub_24872CEB0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x546E6F6974636573 && a2 == 0xEC000000656C7469 || (sub_24872CEB0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6E6F6974704F7369 && a2 == 0xEA00000000006C61 || (sub_24872CEB0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x7461657065527369 && a2 == 0xEB00000000676E69 || (sub_24872CEB0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x73656D616ELL && a2 == 0xE500000000000000 || (sub_24872CEB0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x6572726566657270 && a2 == 0xED0000656D614E64 || (sub_24872CEB0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0x6D614E65756C6176 && a2 == 0xE900000000000065 || (sub_24872CEB0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0x56746C7561666564 && a2 == 0xEC00000065756C61 || (sub_24872CEB0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else if (a1 == 0x65756C61566C6C61 && a2 == 0xE900000000000073 || (sub_24872CEB0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 9;
  }
  else if (a1 == 0x7463617274736261 && a2 == 0xE800000000000000 || (sub_24872CEB0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 10;
  }
  else if (a1 == 0x6973737563736964 && a2 == 0xEA00000000006E6FLL)
  {
    swift_bridgeObjectRelease();
    return 11;
  }
  else
  {
    char v6 = sub_24872CEB0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 11;
    }
    else {
      return 12;
    }
  }
}

uint64_t sub_24872951C(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000014 && a2 == 0x8000000248732A40 || (sub_24872CEB0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x646E616D6D6F63 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v5 = sub_24872CEB0();
    swift_bridgeObjectRelease();
    if (v5) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_24872960C(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6D6F437265707573 && a2 == 0xED000073646E616DLL;
  if (v2 || (sub_24872CEB0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x4E646E616D6D6F63 && a2 == 0xEB00000000656D61 || (sub_24872CEB0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x7463617274736261 && a2 == 0xE800000000000000 || (sub_24872CEB0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6973737563736964 && a2 == 0xEA00000000006E6FLL || (sub_24872CEB0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x8000000248732A60 || (sub_24872CEB0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x616D6D6F63627573 && a2 == 0xEB0000000073646ELL || (sub_24872CEB0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x746E656D75677261 && a2 == 0xE900000000000073)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else
  {
    char v6 = sub_24872CEB0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 6;
    }
    else {
      return 7;
    }
  }
}

uint64_t sub_248729958(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000014 && a2 == 0x8000000248732A40)
  {
    swift_bridgeObjectRelease();
    char v2 = 0;
  }
  else
  {
    char v3 = sub_24872CEB0();
    swift_bridgeObjectRelease();
    char v2 = v3 ^ 1;
  }
  return v2 & 1;
}

BOOL _s22ArgumentParserInternal0A6InfoV0V2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = 0xEA00000000006C61;
  uint64_t v3 = 0x6E6F697469736F70;
  if (*(unsigned char *)a1)
  {
    if (*(unsigned char *)a1 == 1)
    {
      unint64_t v4 = 0xE600000000000000;
      uint64_t v5 = 0x6E6F6974706FLL;
      if (!*(unsigned char *)a2) {
        goto LABEL_11;
      }
    }
    else
    {
      unint64_t v4 = 0xE400000000000000;
      uint64_t v5 = 1734437990;
      if (!*(unsigned char *)a2) {
        goto LABEL_11;
      }
    }
  }
  else
  {
    uint64_t v5 = 0x6E6F697469736F70;
    unint64_t v4 = 0xEA00000000006C61;
    if (!*(unsigned char *)a2) {
      goto LABEL_11;
    }
  }
  if (*(unsigned char *)a2 == 1)
  {
    unint64_t v2 = 0xE600000000000000;
    uint64_t v3 = 0x6E6F6974706FLL;
  }
  else
  {
    unint64_t v2 = 0xE400000000000000;
    uint64_t v3 = 1734437990;
  }
LABEL_11:
  uint64_t v59 = *(void *)(a1 + 8);
  uint64_t v65 = *(void *)(a1 + 16);
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v49 = *(void *)(a1 + 64);
  uint64_t v54 = *(void *)(a1 + 72);
  uint64_t v55 = *(void *)(a1 + 56);
  uint64_t v47 = *(void *)(a1 + 80);
  uint64_t v51 = *(void *)(a1 + 88);
  uint64_t v7 = *(void *)(a1 + 120);
  uint64_t v43 = *(void *)(a1 + 112);
  uint64_t v8 = *(void *)(a1 + 128);
  uint64_t v58 = *(void *)(a2 + 8);
  uint64_t v64 = *(void *)(a2 + 16);
  uint64_t v10 = *(void *)(a2 + 48);
  uint64_t v9 = *(void *)(a2 + 56);
  uint64_t v48 = *(void *)(a2 + 64);
  uint64_t v53 = *(void *)(a2 + 72);
  uint64_t v46 = *(void *)(a2 + 80);
  uint64_t v50 = *(void *)(a2 + 88);
  uint64_t v42 = *(void *)(a2 + 112);
  uint64_t v38 = *(void *)(a2 + 120);
  uint64_t v39 = *(void *)(a2 + 128);
  int v11 = *(unsigned __int8 *)(a1 + 1);
  int v63 = *(unsigned __int8 *)(a1 + 24);
  int v61 = *(unsigned __int8 *)(a1 + 25);
  uint64_t v52 = *(void *)(a1 + 40);
  uint64_t v57 = *(void *)(a1 + 32);
  uint64_t v41 = *(void *)(a1 + 104);
  uint64_t v45 = *(void **)(a1 + 96);
  int v12 = *(unsigned __int8 *)(a2 + 1);
  int v62 = *(unsigned __int8 *)(a2 + 24);
  int v60 = *(unsigned __int8 *)(a2 + 25);
  uint64_t v13 = *(void *)(a2 + 40);
  uint64_t v56 = *(void *)(a2 + 32);
  uint64_t v40 = *(void *)(a2 + 104);
  uint64_t v44 = *(void **)(a2 + 96);
  if (v5 == v3 && v4 == v2)
  {
    swift_bridgeObjectRelease_n();
    if (v11 != v12) {
      return 0;
    }
  }
  else
  {
    uint64_t v37 = *(void *)(a2 + 40);
    uint64_t v13 = *(void *)(a2 + 48);
    uint64_t v14 = *(void *)(a1 + 48);
    uint64_t v15 = *(void *)(a2 + 56);
    uint64_t v16 = *(void *)(a1 + 128);
    uint64_t v17 = *(void *)(a1 + 120);
    char v18 = sub_24872CEB0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    BOOL result = 0;
    if ((v18 & 1) == 0) {
      return result;
    }
    uint64_t v7 = v17;
    uint64_t v8 = v16;
    uint64_t v9 = v15;
    uint64_t v6 = v14;
    uint64_t v10 = v13;
    LOBYTE(v13) = v37;
    if ((v11 ^ v12)) {
      return result;
    }
  }
  if (!v65)
  {
    if (v64) {
      return 0;
    }
LABEL_25:
    BOOL result = 0;
    if (v63 != v62) {
      return result;
    }
    goto LABEL_26;
  }
  if (!v64) {
    return 0;
  }
  if (v59 == v58 && v65 == v64) {
    goto LABEL_25;
  }
  char v20 = sub_24872CEB0();
  BOOL result = 0;
  if (v20 & 1) == 0 || ((v63 ^ v62)) {
    return result;
  }
LABEL_26:
  if ((v61 ^ v60)) {
    return result;
  }
  if (v57)
  {
    if (!v56) {
      return 0;
    }
    uint64_t v21 = v10;
    uint64_t v22 = v6;
    uint64_t v23 = v9;
    swift_bridgeObjectRetain();
    uint64_t v24 = swift_bridgeObjectRetain();
    char v25 = sub_248710280(v24, v56);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v25 & 1) == 0) {
      return 0;
    }
  }
  else
  {
    uint64_t v21 = v10;
    uint64_t v22 = v6;
    uint64_t v23 = v9;
    if (v56) {
      return 0;
    }
  }
  if (!v55)
  {
    if (!v23) {
      goto LABEL_61;
    }
    goto LABEL_75;
  }
  if (!v23)
  {
    swift_bridgeObjectRetain();
    goto LABEL_75;
  }
  uint64_t v26 = v23;
  unint64_t v27 = 1735290732;
  if ((_BYTE)v52)
  {
    if (v52 == 1) {
      unint64_t v28 = 0x74726F6873;
    }
    else {
      unint64_t v28 = 0xD000000000000012;
    }
    if (v52 == 1) {
      unint64_t v29 = 0xE500000000000000;
    }
    else {
      unint64_t v29 = 0x80000002487311E0;
    }
  }
  else
  {
    unint64_t v29 = 0xE400000000000000;
    unint64_t v28 = 1735290732;
  }
  if ((_BYTE)v13)
  {
    if (v13 == 1) {
      unint64_t v27 = 0x74726F6873;
    }
    else {
      unint64_t v27 = 0xD000000000000012;
    }
    if (v13 == 1) {
      unint64_t v30 = 0xE500000000000000;
    }
    else {
      unint64_t v30 = 0x80000002487311E0;
    }
  }
  else
  {
    unint64_t v30 = 0xE400000000000000;
  }
  uint64_t v31 = v8;
  if (v28 != v27 || v29 != v30)
  {
    char v32 = sub_24872CEB0();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v32) {
      goto LABEL_57;
    }
    swift_bridgeObjectRelease_n();
LABEL_75:
    swift_bridgeObjectRelease();
    return 0;
  }
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease_n();
LABEL_57:
  if (v22 == v21 && v55 == v26)
  {
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    uint64_t v8 = v31;
  }
  else
  {
    char v33 = sub_24872CEB0();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    BOOL result = 0;
    uint64_t v8 = v31;
    if ((v33 & 1) == 0) {
      return result;
    }
  }
LABEL_61:
  if (!v54)
  {
    if (v53) {
      return 0;
    }
LABEL_68:
    if (v51)
    {
      if (!v50) {
        return 0;
      }
      if (v47 != v46 || v51 != v50)
      {
        char v35 = sub_24872CEB0();
        BOOL result = 0;
        if ((v35 & 1) == 0) {
          return result;
        }
      }
    }
    else if (v50)
    {
      return 0;
    }
    if (v45)
    {
      if (!v44 || (sub_24870FC9C(v45, v44) & 1) == 0) {
        return 0;
      }
    }
    else if (v44)
    {
      return 0;
    }
    if (v43)
    {
      if (!v42) {
        return 0;
      }
      if (v41 != v40 || v43 != v42)
      {
        char v36 = sub_24872CEB0();
        BOOL result = 0;
        if ((v36 & 1) == 0) {
          return result;
        }
      }
    }
    else if (v42)
    {
      return 0;
    }
    if (v8) {
      return v39 && (v7 == v38 && v8 == v39 || (sub_24872CEB0() & 1) != 0);
    }
    return !v39;
  }
  if (!v53) {
    return 0;
  }
  if (v49 == v48 && v54 == v53) {
    goto LABEL_68;
  }
  char v34 = sub_24872CEB0();
  BOOL result = 0;
  if (v34) {
    goto LABEL_68;
  }
  return result;
}

uint64_t _s22ArgumentParserInternal13CommandInfoV0V2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = *(void **)a1;
  uint64_t v6 = *(void *)(a1 + 8);
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v7 = *(void *)(a1 + 24);
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 48);
  uint64_t v32 = *(void *)(a1 + 56);
  uint64_t v36 = *(void *)(a1 + 64);
  uint64_t v28 = *(void *)(a1 + 80);
  uint64_t v10 = *(void **)a2;
  uint64_t v12 = *(void *)(a2 + 8);
  uint64_t v11 = *(void *)(a2 + 16);
  uint64_t v14 = *(void *)(a2 + 24);
  uint64_t v13 = *(void *)(a2 + 32);
  uint64_t v15 = *(void *)(a2 + 48);
  uint64_t v33 = *(void *)(a2 + 40);
  uint64_t v34 = *(void *)(a1 + 40);
  uint64_t v30 = *(void *)(a1 + 72);
  uint64_t v31 = *(void *)(a2 + 56);
  uint64_t v35 = *(void *)(a2 + 64);
  uint64_t v17 = *(void *)(a2 + 72);
  uint64_t v16 = *(void *)(a2 + 80);
  uint64_t v29 = v17;
  if (v4)
  {
    if (!v10) {
      return 0;
    }
    uint64_t v27 = v16;
    if ((sub_24870FC9C(v4, v10) & 1) == 0) {
      return 0;
    }
  }
  else
  {
    uint64_t v27 = v16;
    if (v10) {
      return 0;
    }
  }
  if (v6 == v12 && v5 == v11 || (char v18 = sub_24872CEB0(), result = 0, (v18 & 1) != 0))
  {
    if (v8)
    {
      if (!v13) {
        return 0;
      }
      if (v7 != v14 || v8 != v13)
      {
        char v20 = sub_24872CEB0();
        uint64_t result = 0;
        if ((v20 & 1) == 0) {
          return result;
        }
      }
    }
    else if (v13)
    {
      return 0;
    }
    if (v9)
    {
      if (!v15) {
        return 0;
      }
      if (v34 != v33 || v9 != v15)
      {
        char v21 = sub_24872CEB0();
        uint64_t result = 0;
        if ((v21 & 1) == 0) {
          return result;
        }
      }
    }
    else if (v15)
    {
      return 0;
    }
    if (v36)
    {
      if (!v35) {
        return 0;
      }
      if (v32 != v31 || v36 != v35)
      {
        char v22 = sub_24872CEB0();
        uint64_t result = 0;
        if ((v22 & 1) == 0) {
          return result;
        }
      }
    }
    else if (v35)
    {
      return 0;
    }
    if (v30)
    {
      if (!v29) {
        return 0;
      }
      swift_bridgeObjectRetain();
      uint64_t v23 = swift_bridgeObjectRetain();
      char v24 = sub_2487100C4(v23, v29);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v24 & 1) == 0) {
        return 0;
      }
    }
    else if (v29)
    {
      return 0;
    }
    if (v28)
    {
      if (v27)
      {
        swift_bridgeObjectRetain();
        uint64_t v25 = swift_bridgeObjectRetain();
        BOOL v26 = sub_2487101A4(v25, v27);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v26) {
          return 1;
        }
      }
    }
    else if (!v27)
    {
      return 1;
    }
    return 0;
  }
  return result;
}

unint64_t sub_24872A28C()
{
  unint64_t result = qword_26931E740;
  if (!qword_26931E740)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26931E740);
  }
  return result;
}

unint64_t sub_24872A2E0()
{
  unint64_t result = qword_26931E748;
  if (!qword_26931E748)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26931E748);
  }
  return result;
}

unint64_t sub_24872A334()
{
  unint64_t result = qword_26931E758;
  if (!qword_26931E758)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26931E758);
  }
  return result;
}

unint64_t sub_24872A388()
{
  unint64_t result = qword_26931E768;
  if (!qword_26931E768)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26931E768);
  }
  return result;
}

unint64_t sub_24872A3DC()
{
  unint64_t result = qword_26931E798;
  if (!qword_26931E798)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26931E798);
  }
  return result;
}

uint64_t sub_24872A430(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26931E1D8);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_24872A494()
{
  unint64_t result = qword_26931E7B8;
  if (!qword_26931E7B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26931E7B8);
  }
  return result;
}

unint64_t sub_24872A4E8()
{
  unint64_t result = qword_26931E7C8;
  if (!qword_26931E7C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26931E7C8);
  }
  return result;
}

unint64_t sub_24872A53C()
{
  unint64_t result = qword_26931E7D0;
  if (!qword_26931E7D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26931E7D0);
  }
  return result;
}

unint64_t sub_24872A590()
{
  unint64_t result = qword_26931E7E0;
  if (!qword_26931E7E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26931E7E0);
  }
  return result;
}

unint64_t sub_24872A5E4()
{
  unint64_t result = qword_26931E7F0;
  if (!qword_26931E7F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26931E7F0);
  }
  return result;
}

unint64_t sub_24872A638()
{
  unint64_t result = qword_26931E7F8;
  if (!qword_26931E7F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26931E7F8);
  }
  return result;
}

unint64_t sub_24872A68C()
{
  unint64_t result = qword_26931E810;
  if (!qword_26931E810)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26931E810);
  }
  return result;
}

unint64_t sub_24872A6E0()
{
  unint64_t result = qword_26931E820;
  if (!qword_26931E820)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26931E820);
  }
  return result;
}

uint64_t sub_24872A734(unint64_t *a1, uint64_t *a2, void (*a3)(void))
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

unint64_t sub_24872A7A0()
{
  unint64_t result = qword_26931E830;
  if (!qword_26931E830)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26931E830);
  }
  return result;
}

uint64_t sub_24872A7F4(uint64_t a1)
{
  return a1;
}

uint64_t sub_24872A888(uint64_t a1)
{
  return a1;
}

unint64_t sub_24872A920()
{
  unint64_t result = qword_26931E838;
  if (!qword_26931E838)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26931E838);
  }
  return result;
}

unint64_t sub_24872A978()
{
  unint64_t result = qword_26931E840;
  if (!qword_26931E840)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26931E840);
  }
  return result;
}

unint64_t sub_24872A9D0()
{
  unint64_t result = qword_26931E848;
  if (!qword_26931E848)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26931E848);
  }
  return result;
}

unint64_t sub_24872AA28()
{
  unint64_t result = qword_26931E850;
  if (!qword_26931E850)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26931E850);
  }
  return result;
}

unint64_t sub_24872AA80()
{
  unint64_t result = qword_26931E858;
  if (!qword_26931E858)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26931E858);
  }
  return result;
}

unint64_t sub_24872AAD8()
{
  unint64_t result = qword_26931E860;
  if (!qword_26931E860)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26931E860);
  }
  return result;
}

uint64_t sub_24872AB2C@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  *a2 = *(void *)(a1 + 96);
  return swift_bridgeObjectRetain();
}

uint64_t sub_24872AB38(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  swift_bridgeObjectRetain();
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(a2 + 96) = v3;
  return result;
}

ValueMetadata *type metadata accessor for ToolInfoHeader()
{
  return &type metadata for ToolInfoHeader;
}

uint64_t destroy for ToolInfoV0()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for ToolInfoV0(void *a1, void *a2)
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
  uint64_t v7 = a2[9];
  a1[8] = a2[8];
  a1[9] = v7;
  uint64_t v8 = a2[11];
  a1[10] = a2[10];
  a1[11] = v8;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for ToolInfoV0(void *a1, void *a2)
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
  a1[8] = a2[8];
  a1[9] = a2[9];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[10] = a2[10];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[11] = a2[11];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy96_8(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  __n128 result = *(__n128 *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  long long v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v5;
  *(__n128 *)(a1 + 32) = result;
  *(_OWORD *)(a1 + 48) = v4;
  return result;
}

uint64_t assignWithTake for ToolInfoV0(uint64_t a1, uint64_t a2)
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
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ToolInfoV0(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 96)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ToolInfoV0(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 88) = 0;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 96) = 1;
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
    *(unsigned char *)(result + 96) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ToolInfoV0()
{
  return &type metadata for ToolInfoV0;
}

uint64_t destroy for CommandInfoV0()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for CommandInfoV0(void *a1, void *a2)
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
  uint64_t v7 = a2[9];
  a1[8] = a2[8];
  a1[9] = v7;
  a1[10] = a2[10];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for CommandInfoV0(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[5] = a2[5];
  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[7] = a2[7];
  a1[8] = a2[8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[9] = a2[9];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[10] = a2[10];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
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

uint64_t assignWithTake for CommandInfoV0(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v6;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for CommandInfoV0(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 88)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CommandInfoV0(uint64_t result, int a2, int a3)
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
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 88) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CommandInfoV0()
{
  return &type metadata for CommandInfoV0;
}

uint64_t destroy for ArgumentInfoV0()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ArgumentInfoV0(uint64_t a1, uint64_t a2)
{
  *(_WORD *)a1 = *(_WORD *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  *(_WORD *)(a1 + 24) = *(_WORD *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  uint64_t v4 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v4;
  uint64_t v5 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v5;
  uint64_t v6 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v6;
  uint64_t v7 = *(void *)(a2 + 104);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = v7;
  uint64_t v8 = *(void *)(a2 + 120);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = v8;
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
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

uint64_t assignWithCopy for ArgumentInfoV0(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(unsigned char *)(a1 + 1) = *(unsigned char *)(a2 + 1);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(unsigned char *)(a1 + 25) = *(unsigned char *)(a2 + 25);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for ArgumentInfoV0(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(unsigned char *)(a1 + 1) = *(unsigned char *)(a2 + 1);
  uint64_t v4 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v4;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(unsigned char *)(a1 + 25) = *(unsigned char *)(a2 + 25);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  uint64_t v5 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v6;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 112);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(void *)(a1 + 112) = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(a2 + 128);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  *(void *)(a1 + 128) = v8;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ArgumentInfoV0(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 136)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 16);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ArgumentInfoV0(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 136) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 136) = 0;
    }
    if (a2) {
      *(void *)(result + 16) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ArgumentInfoV0()
{
  return &type metadata for ArgumentInfoV0;
}

uint64_t destroy for ArgumentInfoV0.NameInfoV0()
{
  return swift_bridgeObjectRelease();
}

uint64_t _s22ArgumentParserInternal14ArgumentInfoV0V10NameInfoV0VwCP_0(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ArgumentInfoV0.NameInfoV0(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for ArgumentInfoV0.NameInfoV0(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ArgumentInfoV0.NameInfoV0(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ArgumentInfoV0.NameInfoV0(uint64_t result, int a2, int a3)
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
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ArgumentInfoV0.NameInfoV0()
{
  return &type metadata for ArgumentInfoV0.NameInfoV0;
}

ValueMetadata *type metadata accessor for ArgumentInfoV0.NameInfoV0.KindV0()
{
  return &type metadata for ArgumentInfoV0.NameInfoV0.KindV0;
}

unsigned char *_s22ArgumentParserInternal14ArgumentInfoV0V6KindV0Owst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 2;
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
        JUMPOUT(0x24872B8D0);
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
          *__n128 result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ArgumentInfoV0.KindV0()
{
  return &type metadata for ArgumentInfoV0.KindV0;
}

uint64_t getEnumTagSinglePayload for ArgumentInfoV0.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for ArgumentInfoV0.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24872BA64);
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

ValueMetadata *type metadata accessor for ArgumentInfoV0.CodingKeys()
{
  return &type metadata for ArgumentInfoV0.CodingKeys;
}

ValueMetadata *type metadata accessor for ArgumentInfoV0.NameInfoV0.CodingKeys()
{
  return &type metadata for ArgumentInfoV0.NameInfoV0.CodingKeys;
}

unsigned char *storeEnumTagSinglePayload for CommandInfoV0.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 6 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 6) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFA) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF9)
  {
    unsigned int v6 = ((a2 - 250) >> 8) + 1;
    *__n128 result = a2 + 6;
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
        JUMPOUT(0x24872BB7CLL);
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
          *__n128 result = a2 + 6;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CommandInfoV0.CodingKeys()
{
  return &type metadata for CommandInfoV0.CodingKeys;
}

unsigned char *_s22ArgumentParserInternal14ArgumentInfoV0V10NameInfoV0V10CodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 1;
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
        JUMPOUT(0x24872BC80);
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
          *__n128 result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ToolInfoV0.CodingKeys()
{
  return &type metadata for ToolInfoV0.CodingKeys;
}

unsigned char *storeEnumTagSinglePayload for ToolInfoHeader.CodingKeys(unsigned char *result, int a2, int a3)
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
        *__n128 result = a2;
        return result;
      case 2:
        *(_WORD *)__n128 result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)__n128 result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *__n128 result = 0;
      break;
    case 2:
      *(_WORD *)__n128 result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x24872BD54);
    case 4:
      *(_DWORD *)__n128 result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for ToolInfoHeader.CodingKeys()
{
  return &type metadata for ToolInfoHeader.CodingKeys;
}

unint64_t sub_24872BD90()
{
  unint64_t result = qword_26931E868;
  if (!qword_26931E868)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26931E868);
  }
  return result;
}

unint64_t sub_24872BDE8()
{
  unint64_t result = qword_26931E870;
  if (!qword_26931E870)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26931E870);
  }
  return result;
}

unint64_t sub_24872BE40()
{
  unint64_t result = qword_26931E878;
  if (!qword_26931E878)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26931E878);
  }
  return result;
}

unint64_t sub_24872BE98()
{
  unint64_t result = qword_26931E880;
  if (!qword_26931E880)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26931E880);
  }
  return result;
}

unint64_t sub_24872BEF0()
{
  unint64_t result = qword_26931E888;
  if (!qword_26931E888)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26931E888);
  }
  return result;
}

unint64_t sub_24872BF48()
{
  unint64_t result = qword_26931E890;
  if (!qword_26931E890)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26931E890);
  }
  return result;
}

unint64_t sub_24872BFA0()
{
  unint64_t result = qword_26931E898;
  if (!qword_26931E898)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26931E898);
  }
  return result;
}

unint64_t sub_24872BFF8()
{
  unint64_t result = qword_26931E8A0;
  if (!qword_26931E8A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26931E8A0);
  }
  return result;
}

unint64_t sub_24872C050()
{
  unint64_t result = qword_26931E8A8;
  if (!qword_26931E8A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26931E8A8);
  }
  return result;
}

unint64_t sub_24872C0A8()
{
  unint64_t result = qword_26931E8B0;
  if (!qword_26931E8B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26931E8B0);
  }
  return result;
}

unint64_t sub_24872C100()
{
  unint64_t result = qword_26931E8B8;
  if (!qword_26931E8B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26931E8B8);
  }
  return result;
}

unint64_t sub_24872C158()
{
  unint64_t result = qword_26931E8C0;
  if (!qword_26931E8C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26931E8C0);
  }
  return result;
}

unint64_t sub_24872C1B0()
{
  unint64_t result = qword_26931E8C8;
  if (!qword_26931E8C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26931E8C8);
  }
  return result;
}

unint64_t sub_24872C208()
{
  unint64_t result = qword_26931E8D0;
  if (!qword_26931E8D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26931E8D0);
  }
  return result;
}

unint64_t sub_24872C260()
{
  unint64_t result = qword_26931E8D8;
  if (!qword_26931E8D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26931E8D8);
  }
  return result;
}

unint64_t sub_24872C2B4()
{
  unint64_t result = qword_26931E8E0;
  if (!qword_26931E8E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26931E8E0);
  }
  return result;
}

unint64_t sub_24872C308()
{
  unint64_t result = qword_26931E8E8;
  if (!qword_26931E8E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26931E8E8);
  }
  return result;
}

uint64_t sub_24872C370()
{
  return MEMORY[0x270EEDE28]();
}

uint64_t sub_24872C380()
{
  return MEMORY[0x270EEDE38]();
}

uint64_t sub_24872C390()
{
  return MEMORY[0x270EEDE58]();
}

uint64_t sub_24872C3A0()
{
  return MEMORY[0x270EEDE60]();
}

uint64_t sub_24872C3B0()
{
  return MEMORY[0x270EEDE70]();
}

uint64_t sub_24872C3C0()
{
  return MEMORY[0x270EEDEE8]();
}

uint64_t sub_24872C3D0()
{
  return MEMORY[0x270EEDF30]();
}

uint64_t sub_24872C3E0()
{
  return MEMORY[0x270EEDF38]();
}

uint64_t sub_24872C3F0()
{
  return MEMORY[0x270EEE908]();
}

uint64_t sub_24872C400()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_24872C410()
{
  return MEMORY[0x270FA08B0]();
}

uint64_t sub_24872C420()
{
  return MEMORY[0x270FA08D8]();
}

uint64_t sub_24872C430()
{
  return MEMORY[0x270FA2C58]();
}

uint64_t sub_24872C440()
{
  return MEMORY[0x270F9CFC0]();
}

uint64_t sub_24872C450()
{
  return MEMORY[0x270F9CFC8]();
}

uint64_t sub_24872C460()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_24872C470()
{
  return MEMORY[0x270F9D360]();
}

uint64_t sub_24872C480()
{
  return MEMORY[0x270F9D368]();
}

uint64_t sub_24872C490()
{
  return MEMORY[0x270F9D370]();
}

uint64_t sub_24872C4A0()
{
  return MEMORY[0x270F9D388]();
}

uint64_t sub_24872C4B0()
{
  return MEMORY[0x270F9D390]();
}

uint64_t sub_24872C4C0()
{
  return MEMORY[0x270F9D3A8]();
}

uint64_t sub_24872C4D0()
{
  return MEMORY[0x270F9D3C0]();
}

uint64_t sub_24872C4E0()
{
  return MEMORY[0x270F9D3C8]();
}

uint64_t sub_24872C4F0()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_24872C500()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_24872C510()
{
  return MEMORY[0x270EF1A10]();
}

uint64_t sub_24872C520()
{
  return MEMORY[0x270EF1AA8]();
}

uint64_t sub_24872C530()
{
  return MEMORY[0x270EF1AD0]();
}

uint64_t sub_24872C540()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_24872C550()
{
  return MEMORY[0x270F9D610]();
}

uint64_t sub_24872C560()
{
  return MEMORY[0x270F9D648]();
}

uint64_t sub_24872C570()
{
  return MEMORY[0x270F9D658]();
}

uint64_t sub_24872C580()
{
  return MEMORY[0x270F9D6B8]();
}

uint64_t sub_24872C590()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_24872C5A0()
{
  return MEMORY[0x270F9D740]();
}

uint64_t sub_24872C5B0()
{
  return MEMORY[0x270F9D748]();
}

uint64_t sub_24872C5C0()
{
  return MEMORY[0x270F9D750]();
}

uint64_t sub_24872C5D0()
{
  return MEMORY[0x270F9D758]();
}

uint64_t sub_24872C5E0()
{
  return MEMORY[0x270F9D760]();
}

uint64_t sub_24872C5F0()
{
  return MEMORY[0x270F9D788]();
}

uint64_t sub_24872C600()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_24872C610()
{
  return MEMORY[0x270F9D7C0]();
}

uint64_t sub_24872C620()
{
  return MEMORY[0x270F9D7D8]();
}

uint64_t sub_24872C630()
{
  return MEMORY[0x270F9D7E8]();
}

uint64_t sub_24872C640()
{
  return MEMORY[0x270F9D800]();
}

uint64_t sub_24872C660()
{
  return MEMORY[0x270F9D810]();
}

uint64_t sub_24872C670()
{
  return MEMORY[0x270F9D820]();
}

uint64_t sub_24872C680()
{
  return MEMORY[0x270F9D860]();
}

uint64_t sub_24872C690()
{
  return MEMORY[0x270F9D898]();
}

uint64_t sub_24872C6A0()
{
  return MEMORY[0x270F9D8B0]();
}

uint64_t sub_24872C6B0()
{
  return MEMORY[0x270F9D8D8]();
}

uint64_t sub_24872C6C0()
{
  return MEMORY[0x270F9D8E0]();
}

uint64_t sub_24872C6D0()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_24872C6E0()
{
  return MEMORY[0x270F9D8F8]();
}

uint64_t sub_24872C6F0()
{
  return MEMORY[0x270F9D908]();
}

uint64_t sub_24872C700()
{
  return MEMORY[0x270F9D940]();
}

uint64_t sub_24872C710()
{
  return MEMORY[0x270F9D968]();
}

uint64_t sub_24872C720()
{
  return MEMORY[0x270F9D980]();
}

uint64_t sub_24872C730()
{
  return MEMORY[0x270F9D990]();
}

uint64_t sub_24872C740()
{
  return MEMORY[0x270F9DA28]();
}

uint64_t sub_24872C750()
{
  return MEMORY[0x270F9DA70]();
}

uint64_t sub_24872C760()
{
  return MEMORY[0x270F9DA78]();
}

uint64_t sub_24872C770()
{
  return MEMORY[0x270F9DA80]();
}

uint64_t sub_24872C780()
{
  return MEMORY[0x270F9DB00]();
}

uint64_t sub_24872C790()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_24872C7A0()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_24872C7B0()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_24872C7C0()
{
  return MEMORY[0x270F9DC10]();
}

uint64_t sub_24872C7D0()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_24872C7E0()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_24872C7F0()
{
  return MEMORY[0x270F9DC60]();
}

uint64_t sub_24872C800()
{
  return MEMORY[0x270F9DC88]();
}

uint64_t sub_24872C810()
{
  return MEMORY[0x270F9DCA8]();
}

uint64_t sub_24872C820()
{
  return MEMORY[0x270F9DCC8]();
}

uint64_t sub_24872C830()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t sub_24872C840()
{
  return MEMORY[0x270F9DD28]();
}

uint64_t sub_24872C850()
{
  return MEMORY[0x270F9DDF0]();
}

uint64_t sub_24872C860()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_24872C870()
{
  return MEMORY[0x270F9DF58]();
}

uint64_t sub_24872C880()
{
  return MEMORY[0x270F9DFD0]();
}

uint64_t sub_24872C890()
{
  return MEMORY[0x270F9E080]();
}

uint64_t sub_24872C8A0()
{
  return MEMORY[0x270F9E0A0]();
}

uint64_t sub_24872C8B0()
{
  return MEMORY[0x270F9E0E0]();
}

uint64_t sub_24872C8C0()
{
  return MEMORY[0x270F9E178]();
}

uint64_t sub_24872C8D0()
{
  return MEMORY[0x270F9E1E0]();
}

uint64_t sub_24872C8E0()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_24872C8F0()
{
  return MEMORY[0x270F9E4A0]();
}

uint64_t sub_24872C900()
{
  return MEMORY[0x270F9E4A8]();
}

uint64_t sub_24872C910()
{
  return MEMORY[0x270F9E4B0]();
}

uint64_t sub_24872C920()
{
  return MEMORY[0x270F9E4E8]();
}

uint64_t sub_24872C930()
{
  return MEMORY[0x270F9E4F8]();
}

uint64_t sub_24872C940()
{
  return MEMORY[0x270F9E500]();
}

uint64_t sub_24872C950()
{
  return MEMORY[0x270F9E508]();
}

uint64_t sub_24872C960()
{
  return MEMORY[0x270F9E518]();
}

uint64_t sub_24872C970()
{
  return MEMORY[0x270EF24A0]();
}

uint64_t sub_24872C980()
{
  return MEMORY[0x270EF2560]();
}

uint64_t sub_24872C990()
{
  return MEMORY[0x270EF25B0]();
}

uint64_t sub_24872C9A0()
{
  return MEMORY[0x270F9E740]();
}

uint64_t sub_24872C9B0()
{
  return MEMORY[0x270F9E798]();
}

uint64_t sub_24872C9D0()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_24872C9E0()
{
  return MEMORY[0x270F9E800]();
}

uint64_t sub_24872C9F0()
{
  return MEMORY[0x270F9E818]();
}

uint64_t sub_24872CA00()
{
  return MEMORY[0x270F9E848]();
}

uint64_t sub_24872CA10()
{
  return MEMORY[0x270F9E858]();
}

uint64_t sub_24872CA20()
{
  return MEMORY[0x270F9E870]();
}

uint64_t sub_24872CA30()
{
  return MEMORY[0x270F9E878]();
}

uint64_t sub_24872CA40()
{
  return MEMORY[0x270F9E920]();
}

uint64_t sub_24872CA50()
{
  return MEMORY[0x270F9E928]();
}

uint64_t sub_24872CA60()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_24872CA70()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_24872CA80()
{
  return MEMORY[0x270F9E968]();
}

uint64_t sub_24872CA90()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_24872CAA0()
{
  return MEMORY[0x270F9E988]();
}

uint64_t sub_24872CAC0()
{
  return MEMORY[0x270F9E9A0]();
}

uint64_t sub_24872CAD0()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_24872CAE0()
{
  return MEMORY[0x270F9E9C8]();
}

uint64_t sub_24872CAF0()
{
  return MEMORY[0x270F9E9E0]();
}

uint64_t sub_24872CB00()
{
  return MEMORY[0x270F9EA30]();
}

uint64_t sub_24872CB10()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_24872CB20()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t sub_24872CB30()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_24872CB40()
{
  return MEMORY[0x270F9EB30]();
}

uint64_t sub_24872CB50()
{
  return MEMORY[0x270F9EBD8]();
}

uint64_t sub_24872CB60()
{
  return MEMORY[0x270F9EC48]();
}

uint64_t sub_24872CB70()
{
  return MEMORY[0x270F9EC88]();
}

uint64_t sub_24872CB80()
{
  return MEMORY[0x270F9EC90]();
}

uint64_t sub_24872CB90()
{
  return MEMORY[0x270F9ED00]();
}

uint64_t sub_24872CBA0()
{
  return MEMORY[0x270F9ED20]();
}

uint64_t sub_24872CBB0()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_24872CBC0()
{
  return MEMORY[0x270F9EDC0]();
}

uint64_t sub_24872CBD0()
{
  return MEMORY[0x270F9EDC8]();
}

uint64_t sub_24872CBE0()
{
  return MEMORY[0x270F9EDD0]();
}

uint64_t sub_24872CBF0()
{
  return MEMORY[0x270F9EDF8]();
}

uint64_t sub_24872CC00()
{
  return MEMORY[0x270F9EF50]();
}

uint64_t sub_24872CC10()
{
  return MEMORY[0x270F9EF88]();
}

uint64_t sub_24872CC20()
{
  return MEMORY[0x270F9EFB0]();
}

uint64_t sub_24872CC30()
{
  return MEMORY[0x270F9EFC0]();
}

uint64_t sub_24872CC40()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_24872CC50()
{
  return MEMORY[0x270F9F050]();
}

uint64_t sub_24872CC60()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_24872CC70()
{
  return MEMORY[0x270F9F088]();
}

uint64_t sub_24872CC80()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_24872CC90()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_24872CCA0()
{
  return MEMORY[0x270F9F0A8]();
}

uint64_t sub_24872CCB0()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_24872CCC0()
{
  return MEMORY[0x270F9F0D0]();
}

uint64_t sub_24872CCD0()
{
  return MEMORY[0x270F9F148]();
}

uint64_t sub_24872CCE0()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_24872CCF0()
{
  return MEMORY[0x270F9F270]();
}

uint64_t sub_24872CD00()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t sub_24872CD10()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_24872CD20()
{
  return MEMORY[0x270F9F2F0]();
}

uint64_t sub_24872CD30()
{
  return MEMORY[0x270F9F308]();
}

uint64_t sub_24872CD40()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_24872CD50()
{
  return MEMORY[0x270F9F378]();
}

uint64_t sub_24872CD60()
{
  return MEMORY[0x270F9F380]();
}

uint64_t sub_24872CD70()
{
  return MEMORY[0x270F9F3B0]();
}

uint64_t sub_24872CD80()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t sub_24872CD90()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_24872CDA0()
{
  return MEMORY[0x270F9F430]();
}

uint64_t sub_24872CDB0()
{
  return MEMORY[0x270F9F448]();
}

uint64_t sub_24872CDC0()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_24872CDD0()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_24872CDE0()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_24872CDF0()
{
  return MEMORY[0x270F9F5B0]();
}

uint64_t sub_24872CE00()
{
  return MEMORY[0x270F9F5B8]();
}

uint64_t sub_24872CE10()
{
  return MEMORY[0x270F9F5C0]();
}

uint64_t sub_24872CE20()
{
  return MEMORY[0x270F9F5C8]();
}

uint64_t sub_24872CE30()
{
  return MEMORY[0x270F9F5D0]();
}

uint64_t sub_24872CE40()
{
  return MEMORY[0x270F9F5D8]();
}

uint64_t sub_24872CE50()
{
  return MEMORY[0x270F9F5E0]();
}

uint64_t sub_24872CE60()
{
  return MEMORY[0x270F9F5E8]();
}

uint64_t sub_24872CE70()
{
  return MEMORY[0x270F9F5F0]();
}

uint64_t sub_24872CE80()
{
  return MEMORY[0x270F9F5F8]();
}

uint64_t sub_24872CE90()
{
  return MEMORY[0x270F9F758]();
}

uint64_t sub_24872CEA0()
{
  return MEMORY[0x270F9F770]();
}

uint64_t sub_24872CEB0()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_24872CEC0()
{
  return MEMORY[0x270F9F860]();
}

uint64_t sub_24872CED0()
{
  return MEMORY[0x270F9F868]();
}

uint64_t sub_24872CEE0()
{
  return MEMORY[0x270F9F920]();
}

uint64_t sub_24872CEF0()
{
  return MEMORY[0x270F9F960]();
}

uint64_t sub_24872CF00()
{
  return MEMORY[0x270F9F968]();
}

uint64_t sub_24872CF10()
{
  return MEMORY[0x270F9F970]();
}

uint64_t sub_24872CF20()
{
  return MEMORY[0x270F9F978]();
}

uint64_t sub_24872CF30()
{
  return MEMORY[0x270F9F980]();
}

uint64_t sub_24872CF40()
{
  return MEMORY[0x270F9F990]();
}

uint64_t sub_24872CF50()
{
  return MEMORY[0x270F9F998]();
}

uint64_t sub_24872CF60()
{
  return MEMORY[0x270F9F9A0]();
}

uint64_t sub_24872CF70()
{
  return MEMORY[0x270F9F9A8]();
}

uint64_t sub_24872CF90()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_24872CFA0()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_24872CFB0()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_24872CFC0()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_24872CFD0()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_24872CFE0()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_24872CFF0()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_24872D010()
{
  return MEMORY[0x270F9FC20]();
}

uint64_t sub_24872D020()
{
  return MEMORY[0x270F9FC28]();
}

uint64_t sub_24872D030()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_24872D040()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_24872D050()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_24872D060()
{
  return MEMORY[0x270F9FC78]();
}

uint64_t sub_24872D070()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_24872D080()
{
  return MEMORY[0x270F9FCA8]();
}

uint64_t sub_24872D090()
{
  return MEMORY[0x270F9FCD0]();
}

uint64_t sub_24872D0A0()
{
  return MEMORY[0x270F9FCD8]();
}

uint64_t sub_24872D0B0()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_24872D0C0()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t sub_24872D0D0()
{
  return MEMORY[0x270F9FE68]();
}

uint64_t sub_24872D0E0()
{
  return MEMORY[0x270F9FE70]();
}

uint64_t sub_24872D0F0()
{
  return MEMORY[0x270F9FF18]();
}

uint64_t sub_24872D100()
{
  return MEMORY[0x270F9FF30]();
}

uint64_t sub_24872D110()
{
  return MEMORY[0x270F9FF38]();
}

uint64_t sub_24872D120()
{
  return MEMORY[0x270FA0090]();
}

uint64_t sub_24872D150()
{
  return MEMORY[0x270FA0128]();
}

uint64_t _swift_stdlib_strtod_clocale()
{
  return MEMORY[0x270FA0170]();
}

uint64_t _swift_stdlib_strtof_clocale()
{
  return MEMORY[0x270FA0178]();
}

void bzero(void *a1, size_t a2)
{
}

void exit(int a1)
{
}

void free(void *a1)
{
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x270ED9BE8](a1);
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

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

int putc(int a1, FILE *a2)
{
  return MEMORY[0x270EDB088](*(void *)&a1, a2);
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

uint64_t swift_conformsToProtocol2()
{
  return MEMORY[0x270FA0218]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x270FA0228]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x270FA0268]();
}

uint64_t swift_dynamicCastMetatype()
{
  return MEMORY[0x270FA0278]();
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

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x270FA0310]();
}

uint64_t swift_getDynamicType()
{
  return MEMORY[0x270FA0330]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x270FA0348]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x270FA03B8]();
}

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x270FA03C8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
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

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x270FA0460]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
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

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x270FA0578]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x270FA2450]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x270FA2460]();
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

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}