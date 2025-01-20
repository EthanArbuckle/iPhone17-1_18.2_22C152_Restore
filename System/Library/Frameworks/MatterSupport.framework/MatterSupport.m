double static MatterAddDeviceExtensionRequestHandler.WiFiNetworkAssociation.defaultSystemNetwork.getter@<D0>(uint64_t a1@<X8>)
{
  double result;

  result = 0.0;
  *(_OWORD *)a1 = xmmword_245134E60;
  *(void *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = 0;
  return result;
}

uint64_t static MatterAddDeviceExtensionRequestHandler.WiFiNetworkAssociation.network(ssid:credentials:)@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  *a5 = a1;
  a5[1] = a2;
  a5[2] = a3;
  a5[3] = a4;
  sub_2450FF9B4(a1, a2);

  return sub_2450FF9B4(a3, a4);
}

uint64_t sub_2450FF9B4(uint64_t a1, unint64_t a2)
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

uint64_t sub_2450FFA0C(char a1)
{
  if (a1) {
    return 0x6B726F7774656ELL;
  }
  else {
    return 0xD000000000000014;
  }
}

uint64_t sub_2450FFA50()
{
  return sub_2450FFA0C(*v0);
}

uint64_t sub_2450FFA58@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_245101BC8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2450FFA80()
{
  return 0;
}

void sub_2450FFA8C(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_2450FFA98(uint64_t a1)
{
  unint64_t v2 = sub_24510236C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2450FFAD4(uint64_t a1)
{
  unint64_t v2 = sub_24510236C();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2450FFB10(char a1)
{
  if (a1) {
    return 0x69746E6564657263;
  }
  else {
    return 1684632435;
  }
}

uint64_t sub_2450FFB48(void *a1, uint64_t a2, unint64_t a3, uint64_t a4, unint64_t a5)
{
  unint64_t v27 = a3;
  unint64_t v25 = a5;
  uint64_t v26 = a2;
  uint64_t v30 = a4;
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_268EC3760);
  uint64_t v24 = *(void *)(v29 - 8);
  MEMORY[0x270FA5388]();
  v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268EC3768);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388]();
  v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_268EC3770);
  uint64_t v12 = *(void *)(v31 - 8);
  MEMORY[0x270FA5388]();
  v14 = (char *)&v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24510236C();
  unint64_t v15 = v27;
  sub_245132D88();
  if (v15 >> 60 == 15)
  {
    LOBYTE(v32) = 0;
    sub_245102468();
    uint64_t v16 = v31;
    sub_245132BE8();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v16);
  }
  else
  {
    LOBYTE(v32) = 1;
    uint64_t v18 = v26;
    sub_2450FF9B4(v26, v15);
    unint64_t v19 = v25;
    sub_2450FF9B4(v30, v25);
    sub_2451023C0();
    sub_245132BE8();
    uint64_t v32 = v18;
    unint64_t v33 = v15;
    char v34 = 0;
    sub_245102414();
    uint64_t v20 = v28;
    sub_245132C28();
    if (v20)
    {
      sub_245100544(v30, v19);
      (*(void (**)(char *, uint64_t))(v24 + 8))(v7, v29);
      (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v31);
      uint64_t v21 = v18;
      unint64_t v22 = v15;
    }
    else
    {
      uint64_t v23 = v29;
      uint64_t v32 = v30;
      unint64_t v33 = v19;
      char v34 = 1;
      sub_245132C28();
      sub_245100544(v26, v15);
      (*(void (**)(char *, uint64_t))(v24 + 8))(v7, v23);
      (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v31);
      uint64_t v21 = v30;
      unint64_t v22 = v19;
    }
    return sub_245100544(v21, v22);
  }
}

uint64_t sub_2450FFF1C()
{
  return 0;
}

uint64_t sub_2450FFF28@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

void sub_2450FFF58(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_2450FFF64(uint64_t a1)
{
  unint64_t v2 = sub_245102468();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2450FFFA0(uint64_t a1)
{
  unint64_t v2 = sub_245102468();

  return MEMORY[0x270FA00B8](a1, v2);
}

BOOL sub_2450FFFDC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_2450FFFF4()
{
  return sub_245132D28();
}

uint64_t sub_24510003C()
{
  return sub_245132CE8();
}

uint64_t sub_245100068()
{
  return sub_245132D28();
}

uint64_t sub_2451000AC()
{
  return sub_2450FFB10(*v0);
}

uint64_t sub_2451000B4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_245101CB8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2451000DC(uint64_t a1)
{
  unint64_t v2 = sub_2451023C0();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_245100118(uint64_t a1)
{
  unint64_t v2 = sub_2451023C0();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_245100154()
{
  uint64_t v1 = *v0;
  unint64_t v2 = v0[1];
  uint64_t v3 = v0[2];
  unint64_t v4 = v0[3];
  sub_245132CD8();
  sub_245132CE8();
  if (v2 >> 60 != 15)
  {
    sub_2450FF9B4(v1, v2);
    sub_2450FF9B4(v3, v4);
    sub_2451326C8();
    sub_2451326C8();
    sub_245100544(v1, v2);
    sub_245100544(v3, v4);
  }
  return sub_245132D28();
}

uint64_t sub_245100218()
{
  unint64_t v1 = v0[1];
  if (v1 >> 60 == 15) {
    return sub_245132CE8();
  }
  uint64_t v4 = v0[2];
  unint64_t v3 = v0[3];
  uint64_t v5 = *v0;
  sub_245132CE8();
  sub_2450FF9B4(v5, v1);
  sub_2450FF9B4(v4, v3);
  sub_2451326C8();
  sub_2451326C8();
  sub_245100544(v5, v1);

  return sub_245100544(v4, v3);
}

uint64_t sub_2451002E8()
{
  uint64_t v1 = *v0;
  unint64_t v2 = v0[1];
  uint64_t v3 = v0[2];
  unint64_t v4 = v0[3];
  sub_245132CD8();
  sub_245132CE8();
  if (v2 >> 60 != 15)
  {
    sub_2450FF9B4(v1, v2);
    sub_2450FF9B4(v3, v4);
    sub_2451326C8();
    sub_2451326C8();
    sub_245100544(v1, v2);
    sub_245100544(v3, v4);
  }
  return sub_245132D28();
}

void *sub_2451003A8@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t result = sub_245101DA4(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
    a2[2] = v6;
    a2[3] = v7;
  }
  return result;
}

uint64_t sub_2451003D8(void *a1)
{
  return sub_2450FFB48(a1, *(void *)v1, *(void *)(v1 + 8), *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t MatterAddDeviceExtensionRequestHandler.WiFiNetworkAssociation.hash(into:)()
{
  unint64_t v1 = v0[1];
  if (v1 >> 60 == 15) {
    return sub_245132CE8();
  }
  uint64_t v4 = v0[2];
  unint64_t v3 = v0[3];
  uint64_t v5 = *v0;
  sub_245132CE8();
  sub_2451004F4(v5, v1, v4, v3);
  sub_2450FF9B4(v5, v1);
  sub_2450FF9B4(v4, v3);
  sub_2451326C8();
  sub_2451326C8();
  sub_245100544(v5, v1);
  sub_245100544(v4, v3);

  return sub_24510059C(v5, v1, v4, v3);
}

uint64_t sub_2451004F4(uint64_t result, unint64_t a2, uint64_t a3, unint64_t a4)
{
  if (a2 >> 60 != 15)
  {
    sub_2450FF9B4(result, a2);
    return sub_2450FF9B4(a3, a4);
  }
  return result;
}

uint64_t sub_245100544(uint64_t a1, unint64_t a2)
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

uint64_t sub_24510059C(uint64_t result, unint64_t a2, uint64_t a3, unint64_t a4)
{
  if (a2 >> 60 != 15)
  {
    sub_245100544(result, a2);
    return sub_245100544(a3, a4);
  }
  return result;
}

uint64_t static MatterAddDeviceExtensionRequestHandler.WiFiNetworkAssociation.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return sub_245100D7C(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)a2, *(void *)(a2 + 8), *(void *)(a2 + 16), *(void *)(a2 + 24));
}

uint64_t sub_245100608()
{
  return 1;
}

uint64_t sub_245100610()
{
  return sub_245132D28();
}

uint64_t sub_245100654()
{
  return sub_245132CE8();
}

uint64_t sub_24510067C()
{
  return sub_245132D28();
}

unint64_t sub_2451006BC()
{
  return 0xD000000000000012;
}

uint64_t sub_2451006D8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_2451022E4(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_245100704(uint64_t a1)
{
  unint64_t v2 = sub_245101078();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_245100740(uint64_t a1)
{
  unint64_t v2 = sub_245101078();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t MatterAddDeviceExtensionRequestHandler.WiFiNetworkAssociation.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268EC36F8);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v6 = (char *)v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10[0] = *(_OWORD *)v1;
  uint64_t v8 = *(void *)(v1 + 16);
  uint64_t v7 = *(void *)(v1 + 24);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_245101078();
  sub_245132D88();
  v10[1] = v10[0];
  uint64_t v11 = v8;
  uint64_t v12 = v7;
  sub_2451010CC();
  sub_245132C28();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t MatterAddDeviceExtensionRequestHandler.WiFiNetworkAssociation.hashValue.getter()
{
  uint64_t v1 = *v0;
  unint64_t v2 = v0[1];
  uint64_t v3 = v0[2];
  unint64_t v4 = v0[3];
  sub_245132CD8();
  sub_245132CE8();
  if (v2 >> 60 != 15)
  {
    sub_2451004F4(v1, v2, v3, v4);
    sub_2450FF9B4(v1, v2);
    sub_2450FF9B4(v3, v4);
    sub_2451326C8();
    sub_2451326C8();
    sub_245100544(v1, v2);
    sub_245100544(v3, v4);
    sub_24510059C(v1, v2, v3, v4);
  }
  return sub_245132D28();
}

uint64_t MatterAddDeviceExtensionRequestHandler.WiFiNetworkAssociation.init(from:)@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268EC3710);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v8 = (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_245101078();
  sub_245132D78();
  if (!v2)
  {
    sub_245101170();
    sub_245132B88();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    long long v9 = v11[1];
    *a2 = v11[0];
    a2[1] = v9;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_245100B34()
{
  unint64_t v1 = v0[1];
  if (v1 >> 60 == 15) {
    return sub_245132CE8();
  }
  uint64_t v4 = v0[2];
  unint64_t v3 = v0[3];
  uint64_t v5 = *v0;
  sub_245132CE8();
  sub_2451004F4(v5, v1, v4, v3);
  sub_2450FF9B4(v5, v1);
  sub_2450FF9B4(v4, v3);
  sub_2451326C8();
  sub_2451326C8();
  sub_245100544(v5, v1);
  sub_245100544(v4, v3);

  return sub_24510059C(v5, v1, v4, v3);
}

uint64_t sub_245100C2C()
{
  uint64_t v1 = *v0;
  unint64_t v2 = v0[1];
  uint64_t v3 = v0[2];
  unint64_t v4 = v0[3];
  sub_245132CD8();
  sub_245132CE8();
  if (v2 >> 60 != 15)
  {
    sub_2451004F4(v1, v2, v3, v4);
    sub_2450FF9B4(v1, v2);
    sub_2450FF9B4(v3, v4);
    sub_2451326C8();
    sub_2451326C8();
    sub_245100544(v1, v2);
    sub_245100544(v3, v4);
    sub_24510059C(v1, v2, v3, v4);
  }
  return sub_245132D28();
}

uint64_t sub_245100D14@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  return MatterAddDeviceExtensionRequestHandler.WiFiNetworkAssociation.init(from:)(a1, a2);
}

uint64_t sub_245100D2C(void *a1)
{
  return MatterAddDeviceExtensionRequestHandler.WiFiNetworkAssociation.encode(to:)(a1);
}

uint64_t sub_245100D44(uint64_t a1, uint64_t a2)
{
  return sub_245100D7C(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)a2, *(void *)(a2 + 8), *(void *)(a2 + 16), *(void *)(a2 + 24));
}

unsigned __int8 *sub_245100D60@<X0>(unsigned __int8 *result@<X0>, _WORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void sub_245100D70(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_245100D7C(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, unint64_t a6, uint64_t a7, unint64_t a8)
{
  if (a2 >> 60 == 15)
  {
    if (a6 >> 60 == 15) {
      return 1;
    }
  }
  else if (a6 >> 60 != 15)
  {
    uint64_t v17 = 0;
    switch(a2 >> 62)
    {
      case 1uLL:
        if (__OFSUB__(HIDWORD(a1), a1))
        {
          __break(1u);
LABEL_26:
          __break(1u);
LABEL_27:
          __break(1u);
LABEL_28:
          __break(1u);
          JUMPOUT(0x245100FD0);
        }
        uint64_t v17 = HIDWORD(a1) - (int)a1;
LABEL_10:
        sub_2450FF9B4(a1, a2);
        break;
      case 2uLL:
        uint64_t v19 = *(void *)(a1 + 16);
        uint64_t v18 = *(void *)(a1 + 24);
        uint64_t v17 = v18 - v19;
        if (!__OFSUB__(v18, v19)) {
          goto LABEL_10;
        }
        goto LABEL_26;
      case 3uLL:
        break;
      default:
        uint64_t v17 = BYTE6(a2);
        break;
    }
    switch(a6 >> 62)
    {
      case 1uLL:
        LODWORD(v20) = HIDWORD(a5) - a5;
        if (__OFSUB__(HIDWORD(a5), a5)) {
          goto LABEL_27;
        }
        uint64_t v20 = (int)v20;
LABEL_16:
        if (v17 != v20) {
          goto LABEL_21;
        }
        if (v17 < 1)
        {
LABEL_23:
          sub_2450FF9B4(a5, a6);
          sub_2450FF9B4(a3, a4);
          sub_2450FF9B4(a7, a8);
        }
        else
        {
          sub_2450FF9B4(a5, a6);
          sub_2450FF9B4(a5, a6);
          sub_2450FF9B4(a3, a4);
          sub_2450FF9B4(a7, a8);
          if ((sub_245110C24(a1, a2, a5, a6) & 1) == 0)
          {
            sub_245100544(a7, a8);
            sub_245100544(a3, a4);
            sub_245100544(a5, a6);
LABEL_21:
            sub_245100544(a1, a2);
            return 0;
          }
        }
        char v24 = sub_245110F0C(a3, a4, a7, a8);
        sub_245100544(a7, a8);
        sub_245100544(a3, a4);
        sub_245100544(a5, a6);
        sub_245100544(a1, a2);
        return v24 & 1;
      case 2uLL:
        uint64_t v22 = *(void *)(a5 + 16);
        uint64_t v21 = *(void *)(a5 + 24);
        BOOL v23 = __OFSUB__(v21, v22);
        uint64_t v20 = v21 - v22;
        if (!v23) {
          goto LABEL_16;
        }
        goto LABEL_28;
      case 3uLL:
        if (v17) {
          goto LABEL_21;
        }
        goto LABEL_23;
      default:
        uint64_t v20 = BYTE6(a6);
        goto LABEL_16;
    }
  }
  return 0;
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

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_245101078()
{
  unint64_t result = qword_268EC3700;
  if (!qword_268EC3700)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268EC3700);
  }
  return result;
}

unint64_t sub_2451010CC()
{
  unint64_t result = qword_268EC3708;
  if (!qword_268EC3708)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268EC3708);
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

unint64_t sub_245101170()
{
  unint64_t result = qword_268EC3718;
  if (!qword_268EC3718)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268EC3718);
  }
  return result;
}

unint64_t sub_2451011C8()
{
  unint64_t result = qword_268EC3720;
  if (!qword_268EC3720)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268EC3720);
  }
  return result;
}

uint64_t *_s22WiFiNetworkAssociationVwxx(uint64_t *result)
{
  unint64_t v1 = result[1];
  if (v1 >> 60 != 15)
  {
    unint64_t v2 = result;
    sub_245100544(*result, v1);
    uint64_t v3 = v2[2];
    unint64_t v4 = v2[3];
    return (uint64_t *)sub_245100544(v3, v4);
  }
  return result;
}

uint64_t _s22WiFiNetworkAssociationVwcp(uint64_t a1, uint64_t *a2)
{
  unint64_t v4 = a2[1];
  if (v4 >> 60 == 15)
  {
    long long v5 = *((_OWORD *)a2 + 1);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v5;
  }
  else
  {
    uint64_t v6 = *a2;
    sub_2450FF9B4(*a2, a2[1]);
    *(void *)a1 = v6;
    *(void *)(a1 + 8) = v4;
    uint64_t v8 = a2[2];
    unint64_t v7 = a2[3];
    sub_2450FF9B4(v8, v7);
    *(void *)(a1 + 16) = v8;
    *(void *)(a1 + 24) = v7;
  }
  return a1;
}

uint64_t _s22WiFiNetworkAssociationVwca(uint64_t a1, uint64_t *a2)
{
  unint64_t v4 = a2[1];
  if (*(void *)(a1 + 8) >> 60 == 15)
  {
    if (v4 >> 60 == 15)
    {
      long long v5 = *((_OWORD *)a2 + 1);
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *(_OWORD *)(a1 + 16) = v5;
    }
    else
    {
      uint64_t v7 = *a2;
      sub_2450FF9B4(*a2, a2[1]);
      *(void *)a1 = v7;
      *(void *)(a1 + 8) = v4;
      uint64_t v9 = a2[2];
      unint64_t v8 = a2[3];
      sub_2450FF9B4(v9, v8);
      *(void *)(a1 + 16) = v9;
      *(void *)(a1 + 24) = v8;
    }
  }
  else if (v4 >> 60 == 15)
  {
    sub_2451013C8(a1);
    long long v6 = *((_OWORD *)a2 + 1);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v6;
  }
  else
  {
    uint64_t v10 = *a2;
    sub_2450FF9B4(*a2, a2[1]);
    uint64_t v11 = *(void *)a1;
    unint64_t v12 = *(void *)(a1 + 8);
    *(void *)a1 = v10;
    *(void *)(a1 + 8) = v4;
    sub_245100544(v11, v12);
    uint64_t v14 = a2[2];
    unint64_t v13 = a2[3];
    sub_2450FF9B4(v14, v13);
    uint64_t v15 = *(void *)(a1 + 16);
    unint64_t v16 = *(void *)(a1 + 24);
    *(void *)(a1 + 16) = v14;
    *(void *)(a1 + 24) = v13;
    sub_245100544(v15, v16);
  }
  return a1;
}

uint64_t sub_2451013C8(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268EC3728);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
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

uint64_t *_s22WiFiNetworkAssociationVwta(uint64_t *a1, uint64_t a2)
{
  unint64_t v4 = a1[1];
  if (v4 >> 60 != 15)
  {
    unint64_t v5 = *(void *)(a2 + 8);
    if (v5 >> 60 != 15)
    {
      uint64_t v7 = *a1;
      *a1 = *(void *)a2;
      a1[1] = v5;
      sub_245100544(v7, v4);
      uint64_t v8 = a1[2];
      unint64_t v9 = a1[3];
      *((_OWORD *)a1 + 1) = *(_OWORD *)(a2 + 16);
      sub_245100544(v8, v9);
      return a1;
    }
    sub_2451013C8((uint64_t)a1);
  }
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *((_OWORD *)a1 + 1) = v6;
  return a1;
}

uint64_t _s22WiFiNetworkAssociationVwet(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xC && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 12);
  }
  uint64_t v3 = *(void *)(a1 + 8) >> 60;
  if (((4 * v3) & 0xC) != 0) {
    int v4 = 14 - ((4 * v3) & 0xC | (v3 >> 2));
  }
  else {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t _s22WiFiNetworkAssociationVwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xB)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = a2 - 12;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xC) {
      *(unsigned char *)(result + 32) = 1;
    }
  }
  else
  {
    if (a3 >= 0xC) {
      *(unsigned char *)(result + 32) = 0;
    }
    if (a2)
    {
      *(void *)__n128 result = 0;
      *(void *)(result + 8) = (unint64_t)((4 * (a2 ^ 0xF)) | ((a2 ^ 0xF) >> 2)) << 60;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MatterAddDeviceExtensionRequestHandler.WiFiNetworkAssociation()
{
  return &type metadata for MatterAddDeviceExtensionRequestHandler.WiFiNetworkAssociation;
}

void type metadata accessor for MTRNetworkCommissioningWiFiBand(uint64_t a1)
{
}

void type metadata accessor for MTRNetworkCommissioningWiFiSecurity(uint64_t a1)
{
}

void sub_245101594(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t _s22WiFiNetworkAssociationV18AssociationDetailsOwCP(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t *_s22WiFiNetworkAssociationV18AssociationDetailsOwxx(uint64_t *result)
{
  unint64_t v1 = result[1];
  if ((v1 & 0x3000000000000000) == 0)
  {
    uint64_t v2 = result;
    sub_245100544(*result, v1);
    uint64_t v3 = v2[2];
    unint64_t v4 = v2[3];
    return (uint64_t *)sub_245100544(v3, v4);
  }
  return result;
}

uint64_t _s22WiFiNetworkAssociationV18AssociationDetailsOwcp(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = a2[1];
  if ((v4 & 0x3000000000000000) != 0)
  {
    long long v5 = *((_OWORD *)a2 + 1);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v5;
  }
  else
  {
    uint64_t v6 = *a2;
    sub_2450FF9B4(*a2, a2[1]);
    *(void *)a1 = v6;
    *(void *)(a1 + 8) = v4;
    uint64_t v8 = a2[2];
    unint64_t v7 = a2[3];
    sub_2450FF9B4(v8, v7);
    *(void *)(a1 + 16) = v8;
    *(void *)(a1 + 24) = v7;
  }
  return a1;
}

uint64_t *_s22WiFiNetworkAssociationV18AssociationDetailsOwca(uint64_t *a1, uint64_t *a2)
{
  unint64_t v4 = a1[1];
  uint64_t v5 = a2[1];
  uint64_t v6 = v5 & 0x3000000000000000;
  if ((v4 & 0x3000000000000000) == 0)
  {
    if (!v6)
    {
      uint64_t v12 = *a2;
      sub_2450FF9B4(*a2, a2[1]);
      uint64_t v13 = *a1;
      unint64_t v14 = a1[1];
      *a1 = v12;
      a1[1] = v5;
      sub_245100544(v13, v14);
      uint64_t v16 = a2[2];
      unint64_t v15 = a2[3];
      sub_2450FF9B4(v16, v15);
      uint64_t v17 = a1[2];
      unint64_t v18 = a1[3];
      a1[2] = v16;
      a1[3] = v15;
      sub_245100544(v17, v18);
      return a1;
    }
    sub_245100544(*a1, v4);
    sub_245100544(a1[2], a1[3]);
    goto LABEL_6;
  }
  if (v6)
  {
LABEL_6:
    long long v10 = *((_OWORD *)a2 + 1);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *((_OWORD *)a1 + 1) = v10;
    return a1;
  }
  uint64_t v7 = *a2;
  sub_2450FF9B4(*a2, a2[1]);
  *a1 = v7;
  a1[1] = v5;
  uint64_t v9 = a2[2];
  unint64_t v8 = a2[3];
  sub_2450FF9B4(v9, v8);
  a1[2] = v9;
  a1[3] = v8;
  return a1;
}

uint64_t *_s22WiFiNetworkAssociationV18AssociationDetailsOwta(uint64_t *a1, uint64_t a2)
{
  unint64_t v4 = a1[1];
  if ((v4 & 0x3000000000000000) == 0)
  {
    uint64_t v5 = *(void *)(a2 + 8);
    if ((v5 & 0x3000000000000000) == 0)
    {
      uint64_t v8 = *a1;
      *a1 = *(void *)a2;
      a1[1] = v5;
      sub_245100544(v8, v4);
      uint64_t v9 = a1[2];
      unint64_t v10 = a1[3];
      *((_OWORD *)a1 + 1) = *(_OWORD *)(a2 + 16);
      sub_245100544(v9, v10);
      return a1;
    }
    sub_245100544(*a1, v4);
    sub_245100544(a1[2], a1[3]);
  }
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *((_OWORD *)a1 + 1) = v6;
  return a1;
}

uint64_t _s22WiFiNetworkAssociationV18AssociationDetailsOwet(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xC && *(unsigned char *)(a1 + 32)) {
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

uint64_t _s22WiFiNetworkAssociationV18AssociationDetailsOwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xB)
  {
    *(_OWORD *)__n128 result = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_DWORD *)__n128 result = a2 - 12;
    if (a3 >= 0xC) {
      *(unsigned char *)(result + 32) = 1;
    }
  }
  else
  {
    if (a3 >= 0xC) {
      *(unsigned char *)(result + 32) = 0;
    }
    if (a2)
    {
      *(void *)__n128 result = 0;
      *(void *)(result + 8) = (unint64_t)((4 * (a2 ^ 0xF)) | ((a2 ^ 0xF) >> 2)) << 60;
    }
  }
  return result;
}

uint64_t sub_2451018C4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 8) >> 60;
  if (((4 * v1) & 0xC) != 0) {
    return 16 - ((4 * v1) & 0xC | (v1 >> 2));
  }
  else {
    return 0;
  }
}

void *sub_2451018F0(void *result, unsigned int a2)
{
  if (a2 > 0xC)
  {
    result[2] = 0;
    result[3] = 0;
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

ValueMetadata *_s22WiFiNetworkAssociationV18AssociationDetailsOMa()
{
  return &_s22WiFiNetworkAssociationV18AssociationDetailsON;
}

uint64_t _s22WiFiNetworkAssociationV10CodingKeysOwet(unsigned int *a1, int a2)
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

unsigned char *_s22WiFiNetworkAssociationV10CodingKeysOwst(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x245101A28);
    case 4:
      *(_DWORD *)__n128 result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_245101A50()
{
  return 0;
}

ValueMetadata *_s22WiFiNetworkAssociationV10CodingKeysOMa()
{
  return &_s22WiFiNetworkAssociationV10CodingKeysON;
}

unint64_t sub_245101A6C()
{
  unint64_t result = qword_268EC3740;
  if (!qword_268EC3740)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268EC3740);
  }
  return result;
}

unint64_t sub_245101AC4()
{
  unint64_t result = qword_268EC3748;
  if (!qword_268EC3748)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268EC3748);
  }
  return result;
}

unint64_t sub_245101B1C()
{
  unint64_t result = qword_268EC3750;
  if (!qword_268EC3750)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268EC3750);
  }
  return result;
}

unint64_t sub_245101B74()
{
  unint64_t result = qword_268EC3758;
  if (!qword_268EC3758)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268EC3758);
  }
  return result;
}

uint64_t sub_245101BC8(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000014 && a2 == 0x8000000245137890 || (sub_245132C98() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6B726F7774656ELL && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v5 = sub_245132C98();
    swift_bridgeObjectRelease();
    if (v5) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_245101CB8(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 1684632435 && a2 == 0xE400000000000000;
  if (v3 || (sub_245132C98() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x69746E6564657263 && a2 == 0xEB00000000736C61)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_245132C98();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

void *sub_245101DA4(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268EC3798);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v24 = v2;
  uint64_t v25 = v3;
  MEMORY[0x270FA5388]();
  char v5 = (uint64_t *)((char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268EC37A0);
  uint64_t v26 = *(void **)(v6 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268EC37A8);
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v12 = (char *)&v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = a1[3];
  unint64_t v27 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v13);
  sub_24510236C();
  uint64_t v14 = v28;
  sub_245132D78();
  if (!v14)
  {
    unint64_t v15 = v26;
    uint64_t v28 = v10;
    uint64_t v16 = sub_245132BD8();
    if (*(void *)(v16 + 16) == 1)
    {
      if (*(unsigned char *)(v16 + 32))
      {
        LOBYTE(v30) = 1;
        sub_2451023C0();
        sub_245132B28();
        LOBYTE(v29) = 0;
        sub_2451024BC();
        uint64_t v17 = v24;
        sub_245132B88();
        uint64_t v21 = v5;
        char v5 = v30;
        char v31 = 1;
        uint64_t v26 = v21;
        sub_245132B88();
        uint64_t v22 = v28;
        (*(void (**)(void *, uint64_t))(v25 + 8))(v26, v17);
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v22 + 8))(v12, v9);
      }
      else
      {
        LOBYTE(v30) = 0;
        sub_245102468();
        sub_245132B28();
        ((void (*)(char *, uint64_t))v15[1])(v8, v6);
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v28 + 8))(v12, v9);
        char v5 = 0;
      }
    }
    else
    {
      uint64_t v18 = sub_245132A58();
      swift_allocError();
      char v5 = v19;
      __swift_instantiateConcreteTypeFromMangledName(&qword_268EC37B0);
      *char v5 = &_s22WiFiNetworkAssociationV18AssociationDetailsON;
      sub_245132B38();
      sub_245132A48();
      (*(void (**)(void *, void, uint64_t))(*(void *)(v18 - 8) + 104))(v5, *MEMORY[0x263F8DCB0], v18);
      swift_willThrow();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v28 + 8))(v12, v9);
    }
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v27);
  return v5;
}

uint64_t sub_2451022E4(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000012 && a2 == 0x8000000245137840)
  {
    swift_bridgeObjectRelease();
    char v2 = 0;
  }
  else
  {
    char v3 = sub_245132C98();
    swift_bridgeObjectRelease();
    char v2 = v3 ^ 1;
  }
  return v2 & 1;
}

unint64_t sub_24510236C()
{
  unint64_t result = qword_268EC3778;
  if (!qword_268EC3778)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268EC3778);
  }
  return result;
}

unint64_t sub_2451023C0()
{
  unint64_t result = qword_268EC3780;
  if (!qword_268EC3780)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268EC3780);
  }
  return result;
}

unint64_t sub_245102414()
{
  unint64_t result = qword_268EC3788;
  if (!qword_268EC3788)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268EC3788);
  }
  return result;
}

unint64_t sub_245102468()
{
  unint64_t result = qword_268EC3790;
  if (!qword_268EC3790)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268EC3790);
  }
  return result;
}

unint64_t sub_2451024BC()
{
  unint64_t result = qword_268EC37B8;
  if (!qword_268EC37B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268EC37B8);
  }
  return result;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

ValueMetadata *_s22WiFiNetworkAssociationV18AssociationDetailsO10CodingKeysOMa()
{
  return &_s22WiFiNetworkAssociationV18AssociationDetailsO10CodingKeysON;
}

ValueMetadata *_s22WiFiNetworkAssociationV18AssociationDetailsO30DefaultSystemNetworkCodingKeysOMa()
{
  return &_s22WiFiNetworkAssociationV18AssociationDetailsO30DefaultSystemNetworkCodingKeysON;
}

uint64_t _s8TopologyV10CodingKeysOwet(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s22WiFiNetworkAssociationV18AssociationDetailsO10CodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2451026A0);
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

uint64_t sub_2451026C8(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_2451026D0(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *_s22WiFiNetworkAssociationV18AssociationDetailsO17NetworkCodingKeysOMa()
{
  return &_s22WiFiNetworkAssociationV18AssociationDetailsO17NetworkCodingKeysON;
}

unint64_t sub_2451026F0()
{
  unint64_t result = qword_268EC37C0;
  if (!qword_268EC37C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268EC37C0);
  }
  return result;
}

unint64_t sub_245102748()
{
  unint64_t result = qword_268EC37C8;
  if (!qword_268EC37C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268EC37C8);
  }
  return result;
}

unint64_t sub_2451027A0()
{
  unint64_t result = qword_268EC37D0;
  if (!qword_268EC37D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268EC37D0);
  }
  return result;
}

unint64_t sub_2451027F8()
{
  unint64_t result = qword_268EC37D8;
  if (!qword_268EC37D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268EC37D8);
  }
  return result;
}

unint64_t sub_245102850()
{
  unint64_t result = qword_268EC37E0;
  if (!qword_268EC37E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268EC37E0);
  }
  return result;
}

unint64_t sub_2451028A8()
{
  unint64_t result = qword_268EC37E8;
  if (!qword_268EC37E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268EC37E8);
  }
  return result;
}

unint64_t sub_245102900()
{
  unint64_t result = qword_268EC37F0;
  if (!qword_268EC37F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268EC37F0);
  }
  return result;
}

unint64_t sub_245102958()
{
  unint64_t result = qword_268EC37F8;
  if (!qword_268EC37F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268EC37F8);
  }
  return result;
}

uint64_t static MatterAddDeviceRequest.isSupported.getter()
{
  return 1;
}

uint64_t MatterAddDeviceRequest.topology.getter@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1[2];
  uint64_t v3 = v1[3];
  *a1 = v1[1];
  a1[1] = v2;
  a1[2] = v3;
  swift_bridgeObjectRetain();

  return swift_bridgeObjectRetain();
}

__n128 MatterAddDeviceRequest.topology.setter(uint64_t a1)
{
  unint64_t v3 = *(void *)a1;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v1->n128_u64[1] = v3;
  __n128 result = *(__n128 *)(a1 + 8);
  v1[1] = result;
  return result;
}

uint64_t (*MatterAddDeviceRequest.topology.modify())()
{
  return nullsub_1;
}

void *MatterAddDeviceRequest.setupPayload.getter()
{
  uint64_t v1 = *(void **)(v0 + 32);
  id v2 = v1;
  return v1;
}

void MatterAddDeviceRequest.setupPayload.setter(uint64_t a1)
{
  *(void *)(v1 + 32) = a1;
}

uint64_t (*MatterAddDeviceRequest.setupPayload.modify())()
{
  return nullsub_1;
}

uint64_t MatterAddDeviceRequest.showDeviceCriteria.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for MatterAddDeviceRequest(0);
  return sub_245108AE4(v1 + *(int *)(v3 + 28), a1, type metadata accessor for MatterAddDeviceRequest.DeviceCriteria);
}

uint64_t type metadata accessor for MatterAddDeviceRequest(uint64_t a1)
{
  return sub_245107EF0(a1, qword_268EC3890);
}

uint64_t MatterAddDeviceRequest.showDeviceCriteria.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for MatterAddDeviceRequest(0) + 28);

  return sub_245102BA0(a1, v3);
}

uint64_t sub_245102BA0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for MatterAddDeviceRequest.DeviceCriteria(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t (*MatterAddDeviceRequest.showDeviceCriteria.modify())()
{
  return nullsub_1;
}

uint64_t MatterAddDeviceRequest.shouldScanNetworks.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for MatterAddDeviceRequest(0) + 32));
}

uint64_t MatterAddDeviceRequest.shouldScanNetworks.setter(char a1)
{
  uint64_t result = type metadata accessor for MatterAddDeviceRequest(0);
  *(unsigned char *)(v1 + *(int *)(result + 32)) = a1;
  return result;
}

uint64_t (*MatterAddDeviceRequest.shouldScanNetworks.modify())()
{
  return nullsub_1;
}

uint64_t MatterAddDeviceRequest.init(topology:setupPayload:showing:)@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8 = *a1;
  sub_245108D5C(0, &qword_268EC3800);
  long long v11 = *(_OWORD *)(a1 + 1);
  *(void *)a4 = sub_2451329B8();
  *(void *)(a4 + 8) = v8;
  *(_OWORD *)(a4 + 16) = v11;
  *(void *)(a4 + 32) = a2;
  uint64_t v9 = type metadata accessor for MatterAddDeviceRequest(0);
  uint64_t result = sub_245108BAC(a3, a4 + *(int *)(v9 + 28), type metadata accessor for MatterAddDeviceRequest.DeviceCriteria);
  *(unsigned char *)(a4 + *(int *)(v9 + 32)) = 1;
  return result;
}

uint64_t MatterAddDeviceRequest.init(topology:setupPayload:showing:shouldScanNetworks:)@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, uint64_t a5@<X8>)
{
  uint64_t v10 = *a1;
  sub_245108D5C(0, &qword_268EC3800);
  long long v13 = *(_OWORD *)(a1 + 1);
  *(void *)a5 = sub_2451329B8();
  *(void *)(a5 + 8) = v10;
  *(_OWORD *)(a5 + 16) = v13;
  *(void *)(a5 + 32) = a2;
  uint64_t v11 = type metadata accessor for MatterAddDeviceRequest(0);
  uint64_t result = sub_245108BAC(a3, a5 + *(int *)(v11 + 28), type metadata accessor for MatterAddDeviceRequest.DeviceCriteria);
  *(unsigned char *)(a5 + *(int *)(v11 + 32)) = a4;
  return result;
}

uint64_t MatterAddDeviceRequest.perform()()
{
  v1[18] = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268EC3810);
  v1[19] = v2;
  v1[20] = *(void *)(v2 - 8);
  v1[21] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_245102F9C, 0, 0);
}

uint64_t sub_245102F9C()
{
  uint64_t v1 = v0[18];
  sub_245132948();
  sub_245132708();
  v0[22] = objc_msgSend(objc_allocWithZone((Class)MTSDeviceSetupManager), sel_init);
  uint64_t v2 = swift_task_alloc();
  v0[23] = v2;
  *(void *)(v2 + 16) = v1;
  uint64_t v3 = (void *)swift_task_alloc();
  v0[24] = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_2451030D0;
  return MEMORY[0x270FA2360]();
}

uint64_t sub_2451030D0()
{
  *(void *)(*(void *)v1 + 200) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_245103500;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = sub_2451031EC;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_2451031EC()
{
  uint64_t v1 = (void *)v0[25];
  sub_245132678();
  swift_allocObject();
  sub_245132668();
  type metadata accessor for MatterAddDeviceRequest(0);
  sub_245106FE4(&qword_268EC3818, (void (*)(uint64_t))type metadata accessor for MatterAddDeviceRequest);
  uint64_t v2 = sub_245132658();
  v0[26] = v2;
  v0[27] = v3;
  if (v1)
  {

    swift_release();
LABEL_3:
    uint64_t v4 = (void *)v0[22];
    objc_msgSend(self, sel_mts_errorWithCode_, 2);
    swift_willThrow();

    swift_task_dealloc();
    uint64_t v5 = (uint64_t (*)(void))v0[1];
    return v5();
  }
  uint64_t v7 = v2;
  unint64_t v8 = v3;
  swift_release();
  id v9 = objc_allocWithZone((Class)MTSDeviceSetupRequest);
  sub_2450FF9B4(v7, v8);
  uint64_t v10 = (void *)sub_2451326A8();
  id v11 = objc_msgSend(v9, sel_initWithSerializedRequest_, v10);
  v0[28] = v11;
  sub_245100544(v7, v8);

  if (!v11)
  {
    sub_245100544(v7, v8);
    goto LABEL_3;
  }
  uint64_t v13 = v0[21];
  uint64_t v12 = (void *)v0[22];
  uint64_t v14 = v0[19];
  uint64_t v15 = v0[20];
  v0[2] = v0;
  v0[3] = sub_245103570;
  swift_continuation_init();
  v0[17] = v14;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v0 + 14);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268EC3820);
  sub_2451328C8();
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v15 + 32))(boxed_opaque_existential_0, v13, v14);
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 1107296256;
  v0[12] = sub_24510379C;
  v0[13] = &block_descriptor;
  objc_msgSend(v12, sel_performDeviceSetupUsingRequest_completionHandler_, v11, v0 + 10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_245103500()
{
  uint64_t v1 = *(void **)(v0 + 176);
  swift_task_dealloc();

  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_245103570()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 232) = v1;
  if (v1) {
    uint64_t v2 = sub_245103704;
  }
  else {
    uint64_t v2 = sub_245103680;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_245103680()
{
  uint64_t v1 = (void *)v0[28];
  uint64_t v2 = (void *)v0[22];
  sub_245100544(v0[26], v0[27]);

  swift_task_dealloc();
  unint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_245103704()
{
  uint64_t v1 = (void *)v0[28];
  uint64_t v2 = v0[26];
  unint64_t v3 = v0[27];
  uint64_t v4 = (void *)v0[22];
  swift_willThrow();
  sub_245100544(v2, v3);

  swift_task_dealloc();
  uint64_t v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

void sub_24510379C(uint64_t a1, void *a2)
{
  __swift_project_boxed_opaque_existential_1((void *)(a1 + 32), *(void *)(a1 + 56));
  if (a2)
  {
    id v3 = a2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268EC3810);
    sub_2451328D8();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268EC3810);
    sub_2451328E8();
  }
}

uint64_t sub_245103820(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268EC39A8);
  uint64_t v4 = MEMORY[0x270FA5388](v3 - 8);
  unsigned int v6 = (char *)v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  unint64_t v8 = (char *)v16 - v7;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268EC3810);
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = v1
      + OBJC_IVAR____TtCV13MatterSupport22MatterAddDeviceRequestP33_1A83A92E88F6D049FA318E551745945D24FirstOneWinsContinuation_continuation;
  swift_beginAccess();
  sub_245108C90(v13, (uint64_t)v8, &qword_268EC39A8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1) {
    return sub_2451094B8((uint64_t)v8, &qword_268EC39A8);
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v12, v8, v9);
  v16[0] = a1;
  id v15 = a1;
  sub_2451328D8();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v6, 1, 1, v9);
  swift_beginAccess();
  sub_245108CF4((uint64_t)v6, v13);
  return swift_endAccess();
}

uint64_t sub_245103A5C()
{
  sub_2451094B8(v0+ OBJC_IVAR____TtCV13MatterSupport22MatterAddDeviceRequestP33_1A83A92E88F6D049FA318E551745945D24FirstOneWinsContinuation_continuation, &qword_268EC39A8);
  swift_defaultActor_destroy();

  return MEMORY[0x270FA2418](v0);
}

uint64_t sub_245103AA4()
{
  return v0;
}

uint64_t sub_245103AB0(uint64_t a1, uint64_t a2)
{
  uint64_t v33 = a2;
  uint64_t v36 = a1;
  uint64_t v2 = type metadata accessor for MatterAddDeviceRequest(0);
  uint64_t v39 = *(void *)(v2 - 8);
  uint64_t v38 = *(void *)(v39 + 64);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v37 = (uint64_t)&v31 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268EC39A8);
  MEMORY[0x270FA5388](v4 - 8);
  v35 = (char *)&v31 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268EC3810);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  char v34 = (char *)&v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_245132978();
  uint64_t v31 = *(void *)(v9 - 8);
  uint64_t v32 = v9;
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_245132968();
  MEMORY[0x270FA5388](v12);
  uint64_t v13 = sub_2451327F8();
  MEMORY[0x270FA5388](v13 - 8);
  uint64_t v14 = sub_245132778();
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)&v31 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_245132928();
  uint64_t v18 = MEMORY[0x263F8EE78];
  sub_245132708();
  strcpy(v17, "_matter._tcp");
  v17[13] = 0;
  *((_WORD *)v17 + 7) = -5120;
  *((void *)v17 + 2) = 0;
  *((void *)v17 + 3) = 0;
  (*(void (**)(char *, void, uint64_t))(v15 + 104))(v17, *MEMORY[0x263F14378], v14);
  sub_245132758();
  sub_245132748();
  sub_2451327D8();
  swift_allocObject();
  uint64_t v19 = sub_245132798();
  sub_245108D5C(0, &qword_268EC39B8);
  sub_2451327E8();
  uint64_t v40 = v18;
  sub_245106FE4(&qword_268EC39C0, MEMORY[0x263F8F0F8]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268EC39C8);
  sub_245108D98();
  sub_245132A08();
  (*(void (**)(char *, void, uint64_t))(v31 + 104))(v11, *MEMORY[0x263F8F130], v32);
  uint64_t v20 = (void *)sub_245132988();
  uint64_t v21 = v34;
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v34, v36, v6);
  type metadata accessor for MatterAddDeviceRequest.FirstOneWinsContinuation(0);
  uint64_t v22 = swift_allocObject();
  swift_defaultActor_initialize();
  uint64_t v23 = v22
      + OBJC_IVAR____TtCV13MatterSupport22MatterAddDeviceRequestP33_1A83A92E88F6D049FA318E551745945D24FirstOneWinsContinuation_continuation;
  uint64_t v24 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 56);
  v24(v22+ OBJC_IVAR____TtCV13MatterSupport22MatterAddDeviceRequestP33_1A83A92E88F6D049FA318E551745945D24FirstOneWinsContinuation_continuation, 1, 1, v6);
  uint64_t v25 = (uint64_t)v35;
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v35, v21, v6);
  v24(v25, 0, 1, v6);
  swift_beginAccess();
  sub_245108CF4(v25, v23);
  swift_endAccess();
  uint64_t v26 = v37;
  sub_245108AE4(v33, v37, type metadata accessor for MatterAddDeviceRequest);
  unint64_t v27 = (*(unsigned __int8 *)(v39 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v39 + 80);
  unint64_t v28 = (v38 + v27 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v29 = swift_allocObject();
  sub_245108BAC(v26, v29 + v27, type metadata accessor for MatterAddDeviceRequest);
  *(void *)(v29 + v28) = v19;
  *(void *)(v29 + ((v28 + 15) & 0xFFFFFFFFFFFFFFF8)) = v22;
  swift_retain();
  swift_retain();
  sub_245132788();
  sub_2451327B8();
  swift_release();

  return swift_release();
}

uint64_t sub_245104104(uint64_t a1)
{
  return sub_245103AB0(a1, *(void *)(v1 + 16));
}

uint64_t *__swift_allocate_boxed_opaque_existential_0(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  return sub_245104180(a2 + 32, a1 + 32);
}

uint64_t sub_245104180(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t block_destroy_helper(uint64_t a1)
{
  return __swift_destroy_boxed_opaque_existential_1(a1 + 32);
}

uint64_t sub_2451041F8(void (*a1)(char *, uint64_t), NSObject **a2, uint64_t a3, uint64_t a4)
{
  uint64_t v73 = a4;
  uint64_t v71 = a3;
  uint64_t v70 = sub_245132768();
  v76 = *(void **)(v70 - 8);
  uint64_t v6 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  v69 = (char *)&v64 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  v67 = (char *)&v64 - v9;
  uint64_t v68 = v10;
  MEMORY[0x270FA5388](v8);
  v77 = (char *)&v64 - v11;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_268EC39D8);
  MEMORY[0x270FA5388](v12 - 8);
  v72 = (char *)&v64 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_2451327A8();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  v75 = (char *)&v64 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  uint64_t v20 = (char *)&v64 - v19;
  MEMORY[0x270FA5388](v18);
  uint64_t v22 = (char *)&v64 - v21;
  os_log_type_t v23 = sub_245132928();
  uint64_t v24 = a2;
  uint64_t v25 = *a2;
  uint64_t v26 = *(void (**)(char *, void (*)(void, void), uint64_t))(v15 + 16);
  v74 = a1;
  v26(v22, (void (*)(void, void))a1, v14);
  if (os_log_type_enabled(v25, v23))
  {
    uint64_t v27 = swift_slowAlloc();
    v66 = a2;
    unint64_t v28 = (uint8_t *)v27;
    uint64_t v65 = swift_slowAlloc();
    uint64_t v79 = v65;
    *(_DWORD *)unint64_t v28 = 136315138;
    v64 = v28 + 4;
    v26(v20, (void (*)(void, void))v22, v14);
    uint64_t v29 = sub_245132848();
    uint64_t v78 = sub_24511DDEC(v29, v30, &v79);
    sub_2451329D8();
    swift_bridgeObjectRelease();
    uint64_t v31 = *(void (**)(char *, uint64_t))(v15 + 8);
    v31(v22, v14);
    _os_log_impl(&dword_2450FD000, v25, v23, "TCC state %s", v28, 0xCu);
    uint64_t v32 = v65;
    swift_arrayDestroy();
    uint64_t v33 = v32;
    char v34 = v76;
    MEMORY[0x245697ED0](v33, -1, -1);
    uint64_t v24 = v66;
    MEMORY[0x245697ED0](v28, -1, -1);
  }
  else
  {
    char v34 = v76;
    uint64_t v31 = *(void (**)(char *, uint64_t))(v15 + 8);
    v31(v22, v14);
  }
  v35 = v75;
  v26(v75, (void (*)(void, void))v74, v14);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v15 + 88))(v35, v14);
  if (result == *MEMORY[0x263F14390])
  {
    (*(void (**)(char *, uint64_t))(v15 + 96))(v35, v14);
    uint64_t v37 = v34;
    uint64_t v38 = v77;
    uint64_t v39 = v35;
    uint64_t v40 = v70;
    v75 = (char *)v34[4];
    ((void (*)(char *, char *, uint64_t))v75)(v77, v39, v70);
    os_log_type_t v41 = sub_245132938();
    v42 = *v24;
    v43 = v67;
    v76 = (void *)v37[2];
    ((void (*)(char *, char *, uint64_t))v76)(v67, v38, v40);
    os_log_type_t v44 = v41;
    uint64_t v45 = v40;
    if (os_log_type_enabled(v42, v41))
    {
      v46 = (uint8_t *)swift_slowAlloc();
      v66 = (NSObject **)swift_slowAlloc();
      v47 = v43;
      *(_DWORD *)v46 = 138412290;
      v74 = (void (*)(char *, uint64_t))(v46 + 4);
      sub_245106FE4(&qword_268EC3A00, MEMORY[0x263F14320]);
      swift_allocError();
      ((void (*)(uint64_t, char *, uint64_t))v76)(v48, v43, v45);
      uint64_t v49 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v79 = v49;
      sub_2451329D8();
      v50 = v66;
      *v66 = v49;
      v74 = (void (*)(char *, uint64_t))v37[1];
      v74(v47, v45);
      _os_log_impl(&dword_2450FD000, v42, v44, "Local browse failed; unable to start an add device operation (error: %@)",
        v46,
        0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_268EC3A08);
      swift_arrayDestroy();
      MEMORY[0x245697ED0](v50, -1, -1);
      MEMORY[0x245697ED0](v46, -1, -1);
    }
    else
    {
      v74 = (void (*)(char *, uint64_t))v37[1];
      v74(v43, v40);
    }
    v54 = v37;
    sub_2451327C8();
    uint64_t v55 = sub_245132908();
    uint64_t v56 = (uint64_t)v72;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v55 - 8) + 56))(v72, 1, 1, v55);
    v57 = v69;
    v58 = v77;
    ((void (*)(char *, char *, uint64_t))v76)(v69, v77, v45);
    unint64_t v59 = (*((unsigned __int8 *)v54 + 80) + 40) & ~(unint64_t)*((unsigned __int8 *)v54 + 80);
    v60 = (void *)swift_allocObject();
    v60[2] = 0;
    v60[3] = 0;
    v60[4] = v73;
    ((void (*)(char *, char *, uint64_t))v75)((char *)v60 + v59, v57, v45);
    swift_retain();
    sub_245104D9C(v56, (uint64_t)&unk_268EC39F8, (uint64_t)v60);
    swift_release();
    return ((uint64_t (*)(char *, uint64_t))v74)(v58, v45);
  }
  if (result == *MEMORY[0x263F14398])
  {
    sub_245132938();
    sub_245132708();
    sub_2451327C8();
    uint64_t v51 = sub_245132908();
    uint64_t v52 = (uint64_t)v72;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v51 - 8) + 56))(v72, 1, 1, v51);
    v53 = (void *)swift_allocObject();
    v53[2] = 0;
    v53[3] = 0;
    v53[4] = v73;
    swift_retain();
    sub_245104D9C(v52, (uint64_t)&unk_268EC39E8, (uint64_t)v53);
    swift_release();
    return ((uint64_t (*)(char *, uint64_t))v31)(v35, v14);
  }
  if (result == *MEMORY[0x263F14388]) {
    return result;
  }
  if (result == *MEMORY[0x263F14380])
  {
    sub_245132928();
    sub_245132708();
    sub_2451327C8();
    uint64_t v61 = sub_245132908();
    uint64_t v62 = (uint64_t)v72;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v61 - 8) + 56))(v72, 1, 1, v61);
    v63 = (void *)swift_allocObject();
    v63[2] = 0;
    v63[3] = 0;
    v63[4] = v73;
    swift_retain();
    sub_245104D9C(v62, (uint64_t)&unk_268EC3A18, (uint64_t)v63);
    return swift_release();
  }
  if (result != *MEMORY[0x263F143A0]) {
    return ((uint64_t (*)(char *, uint64_t))v31)(v35, v14);
  }
  return result;
}

uint64_t sub_245104B00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[8] = a4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268EC39A8);
  v4[9] = swift_task_alloc();
  v4[10] = swift_task_alloc();
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268EC3810);
  v4[11] = v6;
  v4[12] = *(void *)(v6 - 8);
  v4[13] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_245104C08, a4, 0);
}

uint64_t sub_245104C08()
{
  uint64_t v1 = v0[11];
  uint64_t v2 = v0[12];
  uint64_t v3 = v0[10];
  uint64_t v4 = v0[8]
     + OBJC_IVAR____TtCV13MatterSupport22MatterAddDeviceRequestP33_1A83A92E88F6D049FA318E551745945D24FirstOneWinsContinuation_continuation;
  swift_beginAccess();
  sub_245108C90(v4, v3, &qword_268EC39A8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) == 1)
  {
    sub_2451094B8(v0[10], &qword_268EC39A8);
  }
  else
  {
    uint64_t v6 = v0[12];
    uint64_t v5 = v0[13];
    uint64_t v7 = v0[11];
    uint64_t v8 = v0[9];
    (*(void (**)(uint64_t, void, uint64_t))(v6 + 32))(v5, v0[10], v7);
    sub_2451328E8();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 56))(v8, 1, 1, v7);
    swift_beginAccess();
    sub_245108CF4(v8, v4);
    swift_endAccess();
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v9 = (uint64_t (*)(void))v0[1];
  return v9();
}

uint64_t sub_245104D9C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_245132908();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_2451328F8();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_2451094B8(a1, &qword_268EC39D8);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_2451328B8();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_245104F48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[9] = a4;
  v5[10] = a5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268EC39A8);
  v5[11] = swift_task_alloc();
  v5[12] = swift_task_alloc();
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268EC3810);
  v5[13] = v6;
  v5[14] = *(void *)(v6 - 8);
  v5[15] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24510504C, 0, 0);
}

uint64_t sub_24510504C()
{
  uint64_t v1 = v0[9];
  uint64_t v2 = v0[10];
  uint64_t v3 = sub_245132768();
  sub_245106FE4(&qword_268EC3A00, MEMORY[0x263F14320]);
  v0[16] = swift_allocError();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16))(v4, v2, v3);
  return MEMORY[0x270FA2498](sub_245105144, v1, 0);
}

uint64_t sub_245105144()
{
  uint64_t v1 = *(void *)(v0 + 104);
  uint64_t v2 = *(void *)(v0 + 112);
  uint64_t v3 = *(void *)(v0 + 96);
  uint64_t v4 = *(void *)(v0 + 72)
     + OBJC_IVAR____TtCV13MatterSupport22MatterAddDeviceRequestP33_1A83A92E88F6D049FA318E551745945D24FirstOneWinsContinuation_continuation;
  swift_beginAccess();
  sub_245108C90(v4, v3, &qword_268EC39A8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) == 1)
  {
    sub_2451094B8(*(void *)(v0 + 96), &qword_268EC39A8);
  }
  else
  {
    uint64_t v6 = *(void *)(v0 + 120);
    uint64_t v5 = *(void **)(v0 + 128);
    uint64_t v7 = *(void *)(v0 + 104);
    uint64_t v8 = *(void *)(v0 + 112);
    uint64_t v9 = *(void *)(v0 + 88);
    (*(void (**)(uint64_t, void, uint64_t))(v8 + 32))(v6, *(void *)(v0 + 96), v7);
    *(void *)(v0 + 64) = v5;
    id v10 = v5;
    sub_2451328D8();
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v6, v7);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 56))(v9, 1, 1, v7);
    swift_beginAccess();
    sub_245108CF4(v9, v4);
    swift_endAccess();
  }

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v11 = *(uint64_t (**)(void))(v0 + 8);
  return v11();
}

uint64_t sub_245105300(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a4;
  return MEMORY[0x270FA2498](sub_245105320, 0, 0);
}

uint64_t sub_245105320()
{
  uint64_t v1 = *(void *)(v0 + 16);
  *(void *)(v0 + 24) = objc_msgSend(self, sel_mts_errorWithCode_, 3);
  return MEMORY[0x270FA2498](sub_2451053AC, v1, 0);
}

uint64_t sub_2451053AC()
{
  uint64_t v1 = *(void **)(v0 + 24);
  sub_245103820(v1);

  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t MatterAddDeviceRequest.hash(into:)(uint64_t a1)
{
  uint64_t v2 = v1;
  id v4 = *v1;
  sub_2451329A8();

  uint64_t v5 = v2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_245132858();
  sub_245132CE8();
  uint64_t v6 = v5[2];
  if (v6)
  {
    uint64_t v7 = v5 + 5;
    do
    {
      swift_bridgeObjectRetain();
      sub_245132858();
      swift_bridgeObjectRelease();
      v7 += 2;
      --v6;
    }
    while (v6);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v8 = v2[4];
  sub_245132CF8();
  if (v8)
  {
    id v9 = v8;
    sub_2451329A8();
  }
  type metadata accessor for MatterAddDeviceRequest(0);
  MatterAddDeviceRequest.DeviceCriteria.hash(into:)(a1);
  return sub_245132CF8();
}

uint64_t MatterAddDeviceRequest.hashValue.getter()
{
  sub_245132CD8();
  MatterAddDeviceRequest.hash(into:)((uint64_t)v1);
  return sub_245132D28();
}

unint64_t sub_245105590(char a1)
{
  unint64_t result = 0xD000000000000012;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x7961507075746573;
      break;
    case 2:
    case 3:
      return result;
    default:
      unint64_t result = 0x79676F6C6F706F74;
      break;
  }
  return result;
}

unint64_t sub_24510562C(char a1)
{
  unint64_t result = 0xD000000000000012;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x7961507075746573;
      break;
    case 2:
    case 3:
      return result;
    default:
      unint64_t result = 0x79676F6C6F706F74;
      break;
  }
  return result;
}

uint64_t sub_2451056C8()
{
  sub_245132CD8();
  MatterAddDeviceRequest.hash(into:)((uint64_t)v1);
  return sub_245132D28();
}

uint64_t sub_24510570C()
{
  sub_245132CD8();
  MatterAddDeviceRequest.hash(into:)((uint64_t)v1);
  return sub_245132D28();
}

uint64_t sub_24510574C(unsigned __int8 *a1, char *a2)
{
  return sub_24511623C(*a1, *a2);
}

uint64_t sub_245105758()
{
  return sub_2451163D0();
}

uint64_t sub_245105760()
{
  return sub_245116580();
}

uint64_t sub_245105768()
{
  return sub_245116650();
}

uint64_t sub_245105770@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_245108280();
  *a1 = result;
  return result;
}

unint64_t sub_2451057A0@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_245105590(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_2451057CC()
{
  return sub_24510562C(*v0);
}

uint64_t sub_2451057D4@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_245108280();
  *a1 = result;
  return result;
}

void sub_2451057FC(unsigned char *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_245105808(uint64_t a1)
{
  unint64_t v2 = sub_245106F3C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_245105844(uint64_t a1)
{
  unint64_t v2 = sub_245106F3C();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t MatterAddDeviceRequest.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v31 = a2;
  uint64_t v4 = type metadata accessor for MatterAddDeviceRequest.DeviceCriteria(0);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268EC3828);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  id v10 = (char *)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = a1[3];
  uint64_t v32 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v11);
  sub_245106F3C();
  sub_245132D78();
  if (!v2)
  {
    uint64_t v12 = (uint64_t)v6;
    uint64_t v30 = v8;
    char v37 = 0;
    sub_245106F90();
    sub_245132B88();
    uint64_t v13 = v7;
    uint64_t v15 = v33;
    unint64_t v14 = v34;
    uint64_t v16 = v35;
    LOBYTE(v33) = 2;
    sub_245106FE4((unint64_t *)&unk_268EC3840, (void (*)(uint64_t))type metadata accessor for MatterAddDeviceRequest.DeviceCriteria);
    uint64_t v17 = v10;
    sub_245132B88();
    unint64_t v19 = v14;
    uint64_t v20 = v15;
    LOBYTE(v33) = 3;
    int v21 = sub_245132B68();
    char v37 = 1;
    sub_2451024BC();
    sub_245132B48();
    uint64_t v28 = v19;
    uint64_t v29 = v17;
    unint64_t v22 = v34;
    if (v34 >> 60 == 15)
    {
      int v36 = v21;
      uint64_t v23 = 0;
      uint64_t v24 = v31;
    }
    else
    {
      uint64_t v25 = v33;
      sub_245108D5C(0, &qword_268EC3850);
      sub_245108D5C(0, &qword_268EC3858);
      uint64_t v26 = sub_245132958();
      sub_24510702C(v25, v22);
      uint64_t v24 = v31;
      int v36 = v21;
      uint64_t v23 = v26;
    }
    uint64_t v27 = type metadata accessor for MatterAddDeviceRequest(0);
    sub_245108AE4(v12, (uint64_t)v24 + *(int *)(v27 + 28), type metadata accessor for MatterAddDeviceRequest.DeviceCriteria);
    sub_245108D5C(0, &qword_268EC3800);
    *uint64_t v24 = sub_2451329B8();
    v24[1] = v20;
    v24[2] = v28;
    v24[3] = v16;
    v24[4] = v23;
    *((unsigned char *)v24 + *(int *)(v27 + 32)) = v36 & 1;
    sub_245108B4C(v12, type metadata accessor for MatterAddDeviceRequest.DeviceCriteria);
    (*(void (**)(char *, uint64_t))(v30 + 8))(v29, v13);
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v32);
}

uint64_t MatterAddDeviceRequest.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268EC3860);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_245106F3C();
  sub_245132D88();
  id v21 = *(id *)(v3 + 8);
  long long v22 = *(_OWORD *)(v3 + 16);
  char v20 = 0;
  sub_245107040();
  sub_245132C28();
  if (v2) {
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  type metadata accessor for MatterAddDeviceRequest(0);
  LOBYTE(v21) = 2;
  type metadata accessor for MatterAddDeviceRequest.DeviceCriteria(0);
  sub_245106FE4((unint64_t *)&unk_268EC3870, (void (*)(uint64_t))type metadata accessor for MatterAddDeviceRequest.DeviceCriteria);
  sub_245132C28();
  LOBYTE(v21) = 3;
  sub_245132C08();
  id v10 = *(void **)(v3 + 32);
  if (!v10) {
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  uint64_t v11 = self;
  id v21 = 0;
  id v12 = v10;
  id v13 = objc_msgSend(v11, sel_archivedDataWithRootObject_requiringSecureCoding_error_, v12, 1, &v21);
  id v14 = v21;
  if (!v13)
  {
    uint64_t v18 = v14;
    sub_245132698();

    swift_willThrow();
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  uint64_t v15 = (void *)sub_2451326B8();
  unint64_t v17 = v16;

  id v21 = v15;
  *(void *)&long long v22 = v17;
  char v20 = 1;
  sub_245102414();
  sub_245132C28();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);

  return sub_245100544((uint64_t)v15, v17);
}

uint64_t sub_245106038@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return MatterAddDeviceRequest.init(from:)(a1, a2);
}

uint64_t sub_245106050(void *a1)
{
  return MatterAddDeviceRequest.encode(to:)(a1);
}

BOOL sub_2451062BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unint64_t a7, uint64_t a8)
{
  uint64_t v35 = a5;
  uint64_t v33 = a3;
  uint64_t v34 = a4;
  uint64_t v32 = a1;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_268EC3990);
  MEMORY[0x270FA5388](v12 - 8);
  id v14 = (char *)&v31 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = (int *)_s14DeviceCriteriaO17DeviceDescriptionVMa(0);
  MEMORY[0x270FA5388](v15);
  unint64_t v17 = (char *)&v31 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = 0;
  unint64_t v19 = 0xF000000000000000;
  uint64_t v20 = 0;
  if (a7 >> 60 != 15 && a8)
  {
    uint64_t v36 = 0;
    char v37 = 1;
    sub_2450FF9B4(a6, a7);
    sub_245132D68();
    if (v37 == 1)
    {
      sub_24510702C(a6, a7);
      uint64_t v18 = 0;
      uint64_t v20 = 0;
    }
    else
    {
      uint64_t v20 = v36;
      uint64_t v18 = a6;
      unint64_t v19 = a7;
    }
  }
  sub_245108C90(v32, (uint64_t)v14, &qword_268EC3990);
  char v21 = 1;
  if (a2)
  {
    uint64_t v36 = 0;
    char v37 = 1;
    sub_245132918();
    a2 = v36;
    char v21 = v37;
  }
  char v22 = 1;
  if (v33)
  {
    uint64_t v36 = 0;
    char v37 = 1;
    sub_245132918();
    uint64_t v23 = v36;
    char v22 = v37;
  }
  else
  {
    uint64_t v23 = 0;
  }
  sub_245108C14((uint64_t)v14, (uint64_t)v17);
  uint64_t v24 = &v17[v15[5]];
  *(void *)uint64_t v24 = a2;
  v24[8] = v21;
  uint64_t v25 = &v17[v15[6]];
  *(void *)uint64_t v25 = v23;
  v25[8] = v22;
  uint64_t v26 = &v17[v15[7]];
  uint64_t v27 = v35;
  *(void *)uint64_t v26 = v34;
  *((void *)v26 + 1) = v27;
  uint64_t v28 = (uint64_t *)&v17[v15[8]];
  *uint64_t v28 = v18;
  v28[1] = v19;
  v28[2] = v20;
  type metadata accessor for MatterAddDeviceRequest(0);
  swift_bridgeObjectRetain();
  sub_245108C7C(v18, v19);
  BOOL v29 = !sub_24510CEB0((uint64_t)v17);
  sub_24510702C(v18, v19);
  sub_245108B4C((uint64_t)v17, _s14DeviceCriteriaO17DeviceDescriptionVMa);
  return v29;
}

id sub_24510676C(uint64_t a1, uint64_t a2, void (*a3)(char *, uint64_t))
{
  uint64_t v5 = type metadata accessor for MatterAddDeviceRequest(0);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_245108AE4(a1+ OBJC_IVAR____TtCV13MatterSupport22MatterAddDeviceRequestP33_1A83A92E88F6D049FA318E551745945D7Wrapper_wrappedRequest, (uint64_t)v7, type metadata accessor for MatterAddDeviceRequest);
  a3(v7, v5);
  uint64_t v8 = (void *)sub_245132828();
  swift_bridgeObjectRelease();

  return v8;
}

uint64_t sub_2451068AC(uint64_t a1)
{
  sub_245108C90(a1, (uint64_t)v5, &qword_268EC3998);
  if (!v6)
  {
    sub_2451094B8((uint64_t)v5, &qword_268EC3998);
    goto LABEL_5;
  }
  type metadata accessor for MatterAddDeviceRequest.Wrapper(0);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_5:
    char v2 = 0;
    return v2 & 1;
  }
  char v2 = _s13MatterSupport0A16AddDeviceRequestV2eeoiySbAC_ACtFZ_0((void *)(v1+ OBJC_IVAR____TtCV13MatterSupport22MatterAddDeviceRequestP33_1A83A92E88F6D049FA318E551745945D7Wrapper_wrappedRequest), &v4[OBJC_IVAR____TtCV13MatterSupport22MatterAddDeviceRequestP33_1A83A92E88F6D049FA318E551745945D7Wrapper_wrappedRequest]);

  return v2 & 1;
}

id sub_245106A08()
{
  return sub_245106BF0(0, (uint64_t (*)(void))type metadata accessor for MatterAddDeviceRequest.Wrapper);
}

id sub_245106BD8(uint64_t a1)
{
  return sub_245106BF0(a1, type metadata accessor for MTDeviceSetupRequestFactory);
}

id sub_245106BF0(uint64_t a1, uint64_t (*a2)(void))
{
  v4.receiver = v2;
  v4.super_class = (Class)a2();
  return objc_msgSendSuper2(&v4, sel_dealloc);
}

uint64_t sub_245106C28(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  objc_super v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *objc_super v4 = v2;
  v4[1] = sub_245106D04;
  return v6(a1);
}

uint64_t sub_245106D04()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t _s13MatterSupport0A16AddDeviceRequestV2eeoiySbAC_ACtFZ_0(void *a1, void *a2)
{
  sub_245108D5C(0, &qword_268EC39B0);
  if ((sub_245132998() & 1) == 0) {
    goto LABEL_15;
  }
  uint64_t v4 = a1[3];
  uint64_t v5 = a2[3];
  BOOL v6 = a1[1] == a2[1] && a1[2] == a2[2];
  if (v6 || (v7 = sub_245132C98(), char v8 = 0, (v7 & 1) != 0))
  {
    if (sub_24510BDB0(v4, v5))
    {
      uint64_t v9 = (void *)a1[4];
      uint64_t v10 = (void *)a2[4];
      if (v9)
      {
        if (!v10) {
          goto LABEL_15;
        }
        sub_245108D5C(0, &qword_268EC3858);
        id v11 = v10;
        id v12 = v9;
        char v13 = sub_245132998();

        if ((v13 & 1) == 0) {
          goto LABEL_15;
        }
      }
      else if (v10)
      {
        goto LABEL_15;
      }
      uint64_t v14 = type metadata accessor for MatterAddDeviceRequest(0);
      if (static MatterAddDeviceRequest.DeviceCriteria.== infix(_:_:)((uint64_t)a1 + *(int *)(v14 + 28), (uint64_t)a2 + *(int *)(v14 + 28)))
      {
        char v8 = *((unsigned char *)a1 + *(int *)(v14 + 32)) ^ *((unsigned char *)a2 + *(int *)(v14 + 32)) ^ 1;
        return v8 & 1;
      }
    }
LABEL_15:
    char v8 = 0;
  }
  return v8 & 1;
}

unint64_t sub_245106F3C()
{
  unint64_t result = qword_268EC3830;
  if (!qword_268EC3830)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268EC3830);
  }
  return result;
}

unint64_t sub_245106F90()
{
  unint64_t result = qword_268EC3838;
  if (!qword_268EC3838)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268EC3838);
  }
  return result;
}

uint64_t sub_245106FE4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_24510702C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_245100544(a1, a2);
  }
  return a1;
}

unint64_t sub_245107040()
{
  unint64_t result = qword_268EC3868;
  if (!qword_268EC3868)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268EC3868);
  }
  return result;
}

uint64_t sub_245107094()
{
  return sub_245106FE4((unint64_t *)&unk_268EC3880, (void (*)(uint64_t))type metadata accessor for MatterAddDeviceRequest);
}

char *initializeBufferWithCopyOfBuffer for MatterAddDeviceRequest(char *a1, char **a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v4 = *a2;
  *(void *)a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    char v7 = &v4[(v3 + 16) & ~(unint64_t)v3];
    swift_retain();
  }
  else
  {
    char v7 = a1;
    char v8 = a2[2];
    *((void *)a1 + 1) = a2[1];
    *((void *)a1 + 2) = v8;
    uint64_t v9 = a2[4];
    *((void *)a1 + 3) = a2[3];
    *((void *)a1 + 4) = v9;
    uint64_t v10 = *(int *)(a3 + 28);
    id v11 = (uint64_t *)&a1[v10];
    id v12 = (uint64_t *)((char *)a2 + v10);
    uint64_t v13 = type metadata accessor for MatterAddDeviceRequest.DeviceCriteria(0);
    uint64_t v14 = v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v15 = v9;
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
      case 1u:
      case 2u:
        uint64_t *v11 = *v12;
        swift_retain();
        goto LABEL_9;
      case 3u:
        uint64_t v16 = sub_2451326F8();
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v16 - 8) + 16))(v11, v12, v16);
        goto LABEL_9;
      case 6u:
        uint64_t v17 = v12[1];
        uint64_t *v11 = *v12;
        v11[1] = v17;
        swift_bridgeObjectRetain();
        goto LABEL_9;
      case 7u:
        uint64_t v18 = *v12;
        unint64_t v19 = v12[1];
        sub_2450FF9B4(*v12, v19);
        uint64_t *v11 = v18;
        v11[1] = v19;
        _OWORD v11[2] = v12[2];
LABEL_9:
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(v11, v12, *(void *)(*(void *)(v13 - 8) + 64));
        break;
    }
    v7[*(int *)(a3 + 32)] = *((unsigned char *)a2 + *(int *)(a3 + 32));
  }
  return v7;
}

uint64_t destroy for MatterAddDeviceRequest(id *a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  uint64_t v4 = (uint64_t *)((char *)a1 + *(int *)(a2 + 28));
  type metadata accessor for MatterAddDeviceRequest.DeviceCriteria(0);
  uint64_t result = swift_getEnumCaseMultiPayload();
  switch((int)result)
  {
    case 0:
    case 1:
    case 2:
      uint64_t result = swift_release();
      break;
    case 3:
      uint64_t v6 = sub_2451326F8();
      char v7 = *(uint64_t (**)(uint64_t *, uint64_t))(*(void *)(v6 - 8) + 8);
      uint64_t result = v7(v4, v6);
      break;
    case 6:
      uint64_t result = swift_bridgeObjectRelease();
      break;
    case 7:
      uint64_t v8 = *v4;
      unint64_t v9 = v4[1];
      uint64_t result = sub_245100544(v8, v9);
      break;
    default:
      return result;
  }
  return result;
}

void *initializeWithCopy for MatterAddDeviceRequest(void *a1, uint64_t a2, uint64_t a3)
{
  char v7 = *(void **)a2;
  uint64_t v6 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v6;
  uint64_t v8 = *(void *)(a2 + 24);
  a1[2] = *(void *)(a2 + 16);
  a1[3] = v8;
  unint64_t v9 = *(void **)(a2 + 32);
  a1[4] = v9;
  uint64_t v10 = *(int *)(a3 + 28);
  id v11 = (void *)((char *)a1 + v10);
  id v12 = (uint64_t *)(a2 + v10);
  uint64_t v13 = type metadata accessor for MatterAddDeviceRequest.DeviceCriteria(0);
  id v14 = v7;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v15 = v9;
  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
    case 1u:
    case 2u:
      uint64_t *v11 = *v12;
      swift_retain();
      goto LABEL_7;
    case 3u:
      uint64_t v16 = sub_2451326F8();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v16 - 8) + 16))(v11, v12, v16);
      goto LABEL_7;
    case 6u:
      uint64_t v17 = v12[1];
      uint64_t *v11 = *v12;
      v11[1] = v17;
      swift_bridgeObjectRetain();
      goto LABEL_7;
    case 7u:
      uint64_t v18 = *v12;
      unint64_t v19 = v12[1];
      sub_2450FF9B4(*v12, v19);
      uint64_t *v11 = v18;
      v11[1] = v19;
      _OWORD v11[2] = v12[2];
LABEL_7:
      swift_storeEnumTagMultiPayload();
      break;
    default:
      memcpy(v11, v12, *(void *)(*(void *)(v13 - 8) + 64));
      break;
  }
  *((unsigned char *)a1 + *(int *)(a3 + 32)) = *(unsigned char *)(a2 + *(int *)(a3 + 32));
  return a1;
}

uint64_t assignWithCopy for MatterAddDeviceRequest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void **)a2;
  char v7 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v8 = v6;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  unint64_t v9 = *(void **)(a1 + 32);
  uint64_t v10 = *(void **)(a2 + 32);
  *(void *)(a1 + 32) = v10;
  id v11 = v10;

  if (a1 != a2)
  {
    uint64_t v12 = *(int *)(a3 + 28);
    uint64_t v13 = (uint64_t *)(a1 + v12);
    id v14 = (uint64_t *)(a2 + v12);
    sub_245108B4C(a1 + v12, type metadata accessor for MatterAddDeviceRequest.DeviceCriteria);
    uint64_t v15 = type metadata accessor for MatterAddDeviceRequest.DeviceCriteria(0);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
      case 1u:
      case 2u:
        *uint64_t v13 = *v14;
        swift_retain();
        goto LABEL_8;
      case 3u:
        uint64_t v16 = sub_2451326F8();
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v16 - 8) + 16))(v13, v14, v16);
        goto LABEL_8;
      case 6u:
        *uint64_t v13 = *v14;
        v13[1] = v14[1];
        swift_bridgeObjectRetain();
        goto LABEL_8;
      case 7u:
        uint64_t v17 = *v14;
        unint64_t v18 = v14[1];
        sub_2450FF9B4(*v14, v18);
        *uint64_t v13 = v17;
        v13[1] = v18;
        v13[2] = v14[2];
LABEL_8:
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(v13, v14, *(void *)(*(void *)(v15 - 8) + 64));
        break;
    }
  }
  *(unsigned char *)(a1 + *(int *)(a3 + 32)) = *(unsigned char *)(a2 + *(int *)(a3 + 32));
  return a1;
}

uint64_t initializeWithTake for MatterAddDeviceRequest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  uint64_t v6 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v6;
  uint64_t v7 = *(int *)(a3 + 28);
  id v8 = (void *)(a1 + v7);
  unint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = type metadata accessor for MatterAddDeviceRequest.DeviceCriteria(0);
  if (swift_getEnumCaseMultiPayload() == 3)
  {
    uint64_t v11 = sub_2451326F8();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v11 - 8) + 32))(v8, v9, v11);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v8, v9, *(void *)(*(void *)(v10 - 8) + 64));
  }
  *(unsigned char *)(a1 + *(int *)(a3 + 32)) = *(unsigned char *)(a2 + *(int *)(a3 + 32));
  return a1;
}

void *assignWithTake for MatterAddDeviceRequest(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = (void *)*a1;
  *a1 = *a2;

  uint64_t v7 = a2[2];
  a1[1] = a2[1];
  a1[2] = v7;
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  swift_bridgeObjectRelease();
  id v8 = (void *)a1[4];
  a1[4] = a2[4];

  if (a1 != a2)
  {
    uint64_t v9 = *(int *)(a3 + 28);
    uint64_t v10 = (char *)a1 + v9;
    uint64_t v11 = (char *)a2 + v9;
    sub_245108B4C((uint64_t)a1 + v9, type metadata accessor for MatterAddDeviceRequest.DeviceCriteria);
    uint64_t v12 = type metadata accessor for MatterAddDeviceRequest.DeviceCriteria(0);
    if (swift_getEnumCaseMultiPayload() == 3)
    {
      uint64_t v13 = sub_2451326F8();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 32))(v10, v11, v13);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v10, v11, *(void *)(*(void *)(v12 - 8) + 64));
    }
  }
  *((unsigned char *)a1 + *(int *)(a3 + 32)) = *((unsigned char *)a2 + *(int *)(a3 + 32));
  return a1;
}

uint64_t getEnumTagSinglePayload for MatterAddDeviceRequest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_245107B3C);
}

uint64_t sub_245107B3C(uint64_t *a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = type metadata accessor for MatterAddDeviceRequest.DeviceCriteria(0);
    uint64_t v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = (char *)a1 + *(int *)(a3 + 28);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for MatterAddDeviceRequest(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_245107C00);
}

void *sub_245107C00(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *uint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = type metadata accessor for MatterAddDeviceRequest.DeviceCriteria(0);
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 28);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_245107CA8()
{
  uint64_t result = type metadata accessor for MatterAddDeviceRequest.DeviceCriteria(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_245107D60()
{
  return type metadata accessor for MatterAddDeviceRequest.FirstOneWinsContinuation(0);
}

uint64_t type metadata accessor for MatterAddDeviceRequest.FirstOneWinsContinuation(uint64_t a1)
{
  return sub_245107EF0(a1, (uint64_t *)&unk_268EC38B8);
}

void sub_245107D88()
{
  sub_245107E24();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_245107E24()
{
  if (!qword_268EC38C8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268EC3810);
    unint64_t v0 = sub_2451329C8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268EC38C8);
    }
  }
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

uint64_t sub_245107EC8()
{
  return type metadata accessor for MatterAddDeviceRequest.Wrapper(0);
}

uint64_t type metadata accessor for MatterAddDeviceRequest.Wrapper(uint64_t a1)
{
  return sub_245107EF0(a1, qword_268EC3948);
}

uint64_t sub_245107EF0(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_245107F28()
{
  uint64_t result = type metadata accessor for MatterAddDeviceRequest(319);
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t type metadata accessor for MTDeviceSetupRequestFactory()
{
  return self;
}

uint64_t getEnumTagSinglePayload for MatterAddDeviceRequest.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for MatterAddDeviceRequest.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 3;
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
        JUMPOUT(0x245108138);
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
          *uint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

unsigned char *sub_245108160(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for MatterAddDeviceRequest.CodingKeys()
{
  return &type metadata for MatterAddDeviceRequest.CodingKeys;
}

unint64_t sub_24510817C()
{
  unint64_t result = qword_268EC3960;
  if (!qword_268EC3960)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268EC3960);
  }
  return result;
}

unint64_t sub_2451081D4()
{
  unint64_t result = qword_268EC3968;
  if (!qword_268EC3968)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268EC3968);
  }
  return result;
}

unint64_t sub_24510822C()
{
  unint64_t result = qword_268EC3970;
  if (!qword_268EC3970)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268EC3970);
  }
  return result;
}

uint64_t sub_245108280()
{
  unint64_t v0 = sub_245132B18();
  swift_bridgeObjectRelease();
  if (v0 >= 4) {
    return 4;
  }
  else {
    return v0;
  }
}

id sub_2451082CC(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268EC3980);
  MEMORY[0x270FA5388](v4 - 8);
  unsigned int v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for MatterAddDeviceRequest(0);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v18 - v12;
  id v14 = 0;
  if (a2 >> 60 != 15)
  {
    sub_245132648();
    swift_allocObject();
    sub_2450FF9B4(a1, a2);
    sub_245132638();
    sub_245106FE4(&qword_268EC3988, (void (*)(uint64_t))type metadata accessor for MatterAddDeviceRequest);
    sub_245132628();
    swift_release();
    (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(v6, 0, 1, v7);
    sub_245108BAC((uint64_t)v6, (uint64_t)v13, type metadata accessor for MatterAddDeviceRequest);
    sub_245108AE4((uint64_t)v13, (uint64_t)v11, type metadata accessor for MatterAddDeviceRequest);
    uint64_t v15 = (objc_class *)type metadata accessor for MatterAddDeviceRequest.Wrapper(0);
    id v16 = objc_allocWithZone(v15);
    sub_245108AE4((uint64_t)v11, (uint64_t)v16+ OBJC_IVAR____TtCV13MatterSupport22MatterAddDeviceRequestP33_1A83A92E88F6D049FA318E551745945D7Wrapper_wrappedRequest, type metadata accessor for MatterAddDeviceRequest);
    v19.receiver = v16;
    v19.super_class = v15;
    id v14 = objc_msgSendSuper2(&v19, sel_init);
    sub_245108B4C((uint64_t)v11, type metadata accessor for MatterAddDeviceRequest);
    sub_24510702C(a1, a2);
    sub_245108B4C((uint64_t)v13, type metadata accessor for MatterAddDeviceRequest);
  }
  return v14;
}

uint64_t sub_2451085BC(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v50 = a2;
  uint64_t v48 = a1;
  uint64_t v54 = type metadata accessor for MatterAddDeviceRequest.DeviceCriteria(0);
  uint64_t v52 = *(void *)(v54 - 8);
  MEMORY[0x270FA5388](v54);
  uint64_t v7 = (uint64_t *)((char *)&v46 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v47 = type metadata accessor for MatterAddDeviceRequest(0);
  uint64_t v8 = MEMORY[0x270FA5388](v47);
  uint64_t v10 = (char *)&v46 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v49 = (uint64_t *)((char *)&v46 - v11);
  int64_t v12 = *(void *)(a3 + 16);
  uint64_t v13 = MEMORY[0x263F8EE78];
  unint64_t v53 = a4;
  if (v12)
  {
    uint64_t v56 = MEMORY[0x263F8EE78];
    sub_24511E860(0, v12, 0);
    uint64_t v13 = v56;
    id v14 = (uint64_t *)(a3 + 40);
    do
    {
      uint64_t v15 = *(v14 - 1);
      uint64_t v16 = *v14;
      uint64_t v56 = v13;
      unint64_t v18 = *(void *)(v13 + 16);
      unint64_t v17 = *(void *)(v13 + 24);
      swift_bridgeObjectRetain();
      if (v18 >= v17 >> 1)
      {
        sub_24511E860(v17 > 1, v18 + 1, 1);
        uint64_t v13 = v56;
      }
      v14 += 2;
      *(void *)(v13 + 16) = v18 + 1;
      unint64_t v19 = v13 + 16 * v18;
      *(void *)(v19 + 32) = v15;
      *(void *)(v19 + 40) = v16;
      --v12;
    }
    while (v12);
    a4 = v53;
  }
  if (a4 >> 62)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v20 = sub_245132AF8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v20 = *(void *)((a4 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
  }
  uint64_t v21 = MEMORY[0x263F8EE78];
  if (!v20) {
    goto LABEL_19;
  }
  uint64_t v56 = MEMORY[0x263F8EE78];
  uint64_t result = sub_24511E840(0, v20 & ~(v20 >> 63), 0);
  if ((v20 & 0x8000000000000000) == 0)
  {
    v46 = v10;
    uint64_t v23 = 0;
    uint64_t v21 = v56;
    unint64_t v51 = a4 & 0xC000000000000001;
    uint64_t v24 = v20;
    do
    {
      if (v51) {
        id v25 = (id)MEMORY[0x2456972C0](v23, a4);
      }
      else {
        id v25 = *(id *)(a4 + 8 * v23 + 32);
      }
      uint64_t v26 = v25;
      id v27 = objc_msgSend(v25, sel_rootPublicKey, v46);
      uint64_t v28 = sub_2451326B8();
      uint64_t v30 = v29;

      id v31 = objc_msgSend(v26, sel_nodeID);
      uint64_t v32 = sub_245132D48();

      uint64_t *v7 = v28;
      v7[1] = v30;
      v7[2] = v32;
      swift_storeEnumTagMultiPayload();

      uint64_t v56 = v21;
      unint64_t v34 = *(void *)(v21 + 16);
      unint64_t v33 = *(void *)(v21 + 24);
      if (v34 >= v33 >> 1)
      {
        sub_24511E840(v33 > 1, v34 + 1, 1);
        uint64_t v21 = v56;
      }
      ++v23;
      *(void *)(v21 + 16) = v34 + 1;
      sub_245108BAC((uint64_t)v7, v21+ ((*(unsigned __int8 *)(v52 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v52 + 80))+ *(void *)(v52 + 72) * v34, type metadata accessor for MatterAddDeviceRequest.DeviceCriteria);
      a4 = v53;
    }
    while (v24 != v23);
    uint64_t v10 = v46;
LABEL_19:
    uint64_t v35 = swift_allocBox();
    char v37 = v36;
    uint64_t v38 = swift_allocObject();
    *(void *)(v38 + 16) = v21;
    *char v37 = v38;
    swift_storeEnumTagMultiPayload();
    uint64_t v39 = v47;
    uint64_t v40 = v49;
    *(uint64_t *)((char *)v49 + *(int *)(v47 + 28)) = v35;
    swift_storeEnumTagMultiPayload();
    sub_245108D5C(0, &qword_268EC3800);
    uint64_t v41 = sub_2451329B8();
    uint64_t v42 = v48;
    *uint64_t v40 = v41;
    v40[1] = v42;
    v40[2] = v50;
    v40[3] = v13;
    v40[4] = 0;
    *((unsigned char *)v40 + *(int *)(v39 + 32)) = 1;
    sub_245108AE4((uint64_t)v40, (uint64_t)v10, type metadata accessor for MatterAddDeviceRequest);
    v43 = (objc_class *)type metadata accessor for MatterAddDeviceRequest.Wrapper(0);
    id v44 = objc_allocWithZone(v43);
    sub_245108AE4((uint64_t)v10, (uint64_t)v44+ OBJC_IVAR____TtCV13MatterSupport22MatterAddDeviceRequestP33_1A83A92E88F6D049FA318E551745945D7Wrapper_wrappedRequest, type metadata accessor for MatterAddDeviceRequest);
    v55.receiver = v44;
    v55.super_class = v43;
    id v45 = objc_msgSendSuper2(&v55, sel_init);
    sub_245108B4C((uint64_t)v10, type metadata accessor for MatterAddDeviceRequest);
    sub_245108B4C((uint64_t)v40, type metadata accessor for MatterAddDeviceRequest);
    return (uint64_t)v45;
  }
  __break(1u);
  return result;
}

uint64_t sub_245108AAC()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_245108AE4(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_245108B4C(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_245108BAC(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_245108C14(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268EC3990);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_245108C7C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_2450FF9B4(a1, a2);
  }
  return a1;
}

uint64_t sub_245108C90(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_245108CF4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268EC39A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_245108D5C(uint64_t a1, unint64_t *a2)
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

unint64_t sub_245108D98()
{
  unint64_t result = qword_268EC39D0;
  if (!qword_268EC39D0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268EC39C8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268EC39D0);
  }
  return result;
}

uint64_t sub_245108DF4()
{
  unint64_t v1 = (int *)(type metadata accessor for MatterAddDeviceRequest(0) - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)v1 + 64);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  uint64_t v5 = v0 + v3 + v1[9];
  type metadata accessor for MatterAddDeviceRequest.DeviceCriteria(0);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
    case 1u:
    case 2u:
      swift_release();
      break;
    case 3u:
      uint64_t v6 = sub_2451326F8();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
      break;
    case 6u:
      swift_bridgeObjectRelease();
      break;
    case 7u:
      sub_245100544(*(void *)v5, *(void *)(v5 + 8));
      break;
    default:
      break;
  }
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, ((((v4 + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 8, v2 | 7);
}

uint64_t sub_245108FA8(void (*a1)(char *, uint64_t))
{
  uint64_t v3 = *(void *)(type metadata accessor for MatterAddDeviceRequest(0) - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  unint64_t v5 = (*(void *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v6 = *(void *)(v1 + v5);
  uint64_t v7 = *(void *)(v1 + ((v5 + 15) & 0xFFFFFFFFFFFFFFF8));

  return sub_2451041F8(a1, (NSObject **)(v1 + v4), v6, v7);
}

uint64_t sub_245109054()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_245109604;
  v3[2] = v2;
  return MEMORY[0x270FA2498](sub_245105320, 0, 0);
}

uint64_t sub_2451090FC()
{
  uint64_t v1 = sub_245132768();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 40) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_2451091D0(uint64_t a1)
{
  uint64_t v4 = *(void *)(sub_245132768() - 8);
  uint64_t v5 = v1[2];
  uint64_t v6 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v8 = (uint64_t)v1 + ((*(unsigned __int8 *)(v4 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  *uint64_t v9 = v2;
  v9[1] = sub_2451092CC;
  return sub_245104F48(a1, v5, v6, v7, v8);
}

uint64_t sub_2451092CC()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t objectdestroy_31Tm()
{
  swift_unknownObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_245109404(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_245109604;
  return sub_245104B00(a1, v4, v5, v6);
}

uint64_t sub_2451094B8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_245109514()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24510954C(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_2451092CC;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_268EC3A20 + dword_268EC3A20);
  return v6(a1, v4);
}

uint64_t MatterAddDeviceRequest.Room.displayName.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t MatterAddDeviceRequest.Room.displayName.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*MatterAddDeviceRequest.Room.displayName.modify())()
{
  return nullsub_1;
}

uint64_t MatterAddDeviceRequest.Room.init(displayName:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  *a3 = result;
  a3[1] = a2;
  return result;
}

uint64_t MatterAddDeviceRequest.Room.hash(into:)()
{
  swift_bridgeObjectRetain();
  sub_245132858();

  return swift_bridgeObjectRelease();
}

uint64_t static MatterAddDeviceRequest.Room.== infix(_:_:)(void *a1, void *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1]) {
    return 1;
  }
  else {
    return sub_245132C98();
  }
}

uint64_t sub_245109724@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24510A130(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_245109750(uint64_t a1)
{
  unint64_t v2 = sub_245109900();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24510978C(uint64_t a1)
{
  unint64_t v2 = sub_245109900();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t MatterAddDeviceRequest.Room.encode(to:)(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268EC3A90);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_245109900();
  sub_245132D88();
  sub_245132BF8();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

unint64_t sub_245109900()
{
  unint64_t result = qword_268EC3A98;
  if (!qword_268EC3A98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268EC3A98);
  }
  return result;
}

uint64_t MatterAddDeviceRequest.Room.hashValue.getter()
{
  return sub_245132D28();
}

uint64_t MatterAddDeviceRequest.Room.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268EC3AA0);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_245109900();
  sub_245132D78();
  if (!v2)
  {
    uint64_t v9 = sub_245132B58();
    uint64_t v11 = v10;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v9;
    a2[1] = v11;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_245109B20()
{
  return sub_245132D28();
}

uint64_t sub_245109B7C()
{
  swift_bridgeObjectRetain();
  sub_245132858();

  return swift_bridgeObjectRelease();
}

uint64_t sub_245109BD4()
{
  return sub_245132D28();
}

unint64_t sub_245109C30()
{
  unint64_t result = qword_268EC3AA8;
  if (!qword_268EC3AA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268EC3AA8);
  }
  return result;
}

uint64_t sub_245109C84@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return MatterAddDeviceRequest.Room.init(from:)(a1, a2);
}

uint64_t sub_245109C9C(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268EC3A90);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_245109900();
  sub_245132D88();
  sub_245132BF8();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_245109DD4(void *a1, void *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1]) {
    return 1;
  }
  else {
    return sub_245132C98();
  }
}

void *_s4HomeVwCP(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t _s4HomeVwxx()
{
  return swift_bridgeObjectRelease();
}

void *_s4HomeVwca(void *a1, void *a2)
{
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

void *_s4HomeVwta(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s4HomeVwet(uint64_t a1, int a2)
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

uint64_t _s4HomeVwst(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for MatterAddDeviceRequest.Room()
{
  return &type metadata for MatterAddDeviceRequest.Room;
}

unsigned char *_s4RoomV10CodingKeysOwst(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x245109FF0);
    case 4:
      *(_DWORD *)__n128 result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *_s4RoomV10CodingKeysOMa()
{
  return &_s4RoomV10CodingKeysON;
}

unint64_t sub_24510A02C()
{
  unint64_t result = qword_268EC3AB0;
  if (!qword_268EC3AB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268EC3AB0);
  }
  return result;
}

unint64_t sub_24510A084()
{
  unint64_t result = qword_268EC3AB8;
  if (!qword_268EC3AB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268EC3AB8);
  }
  return result;
}

unint64_t sub_24510A0DC()
{
  unint64_t result = qword_268EC3AC0;
  if (!qword_268EC3AC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268EC3AC0);
  }
  return result;
}

uint64_t sub_24510A130(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x4E79616C70736964 && a2 == 0xEB00000000656D61)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_245132C98();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_24510A1C8()
{
  return 0x4E79616C70736964;
}

uint64_t MatterAddDeviceExtensionRequestHandler.ThreadScanResult.networkName.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t MatterAddDeviceExtensionRequestHandler.ThreadScanResult.networkName.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *unint64_t v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*MatterAddDeviceExtensionRequestHandler.ThreadScanResult.networkName.modify())()
{
  return nullsub_1;
}

uint64_t MatterAddDeviceExtensionRequestHandler.ThreadScanResult.panID.getter()
{
  return *(unsigned __int16 *)(v0 + 16);
}

uint64_t MatterAddDeviceExtensionRequestHandler.ThreadScanResult.panID.setter(uint64_t result)
{
  *(_WORD *)(v1 + 16) = result;
  return result;
}

uint64_t (*MatterAddDeviceExtensionRequestHandler.ThreadScanResult.panID.modify())()
{
  return nullsub_1;
}

uint64_t MatterAddDeviceExtensionRequestHandler.ThreadScanResult.extendedPANID.getter()
{
  return *(void *)(v0 + 24);
}

uint64_t MatterAddDeviceExtensionRequestHandler.ThreadScanResult.extendedPANID.setter(uint64_t result)
{
  *(void *)(v1 + 24) = result;
  return result;
}

uint64_t (*MatterAddDeviceExtensionRequestHandler.ThreadScanResult.extendedPANID.modify())()
{
  return nullsub_1;
}

uint64_t MatterAddDeviceExtensionRequestHandler.ThreadScanResult.channel.getter()
{
  return *(unsigned __int16 *)(v0 + 32);
}

uint64_t MatterAddDeviceExtensionRequestHandler.ThreadScanResult.channel.setter(uint64_t result)
{
  *(_WORD *)(v1 + 32) = result;
  return result;
}

uint64_t (*MatterAddDeviceExtensionRequestHandler.ThreadScanResult.channel.modify())()
{
  return nullsub_1;
}

uint64_t MatterAddDeviceExtensionRequestHandler.ThreadScanResult.extendedAddress.getter()
{
  uint64_t v1 = *(void *)(v0 + 40);
  sub_2450FF9B4(v1, *(void *)(v0 + 48));
  return v1;
}

uint64_t MatterAddDeviceExtensionRequestHandler.ThreadScanResult.extendedAddress.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_245100544(*(void *)(v2 + 40), *(void *)(v2 + 48));
  *(void *)(v2 + 40) = a1;
  *(void *)(v2 + 48) = a2;
  return result;
}

uint64_t (*MatterAddDeviceExtensionRequestHandler.ThreadScanResult.extendedAddress.modify())()
{
  return nullsub_1;
}

uint64_t MatterAddDeviceExtensionRequestHandler.ThreadScanResult.rssi.getter()
{
  return *(unsigned __int8 *)(v0 + 56);
}

uint64_t MatterAddDeviceExtensionRequestHandler.ThreadScanResult.rssi.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 56) = result;
  return result;
}

uint64_t (*MatterAddDeviceExtensionRequestHandler.ThreadScanResult.rssi.modify())()
{
  return nullsub_1;
}

uint64_t MatterAddDeviceExtensionRequestHandler.ThreadScanResult.version.getter()
{
  return *(unsigned __int8 *)(v0 + 57);
}

uint64_t MatterAddDeviceExtensionRequestHandler.ThreadScanResult.version.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 57) = result;
  return result;
}

uint64_t (*MatterAddDeviceExtensionRequestHandler.ThreadScanResult.version.modify())()
{
  return nullsub_1;
}

uint64_t MatterAddDeviceExtensionRequestHandler.ThreadScanResult.linkQualityIndicator.getter()
{
  return *(unsigned __int8 *)(v0 + 58);
}

uint64_t MatterAddDeviceExtensionRequestHandler.ThreadScanResult.linkQualityIndicator.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 58) = result;
  return result;
}

uint64_t (*MatterAddDeviceExtensionRequestHandler.ThreadScanResult.linkQualityIndicator.modify())()
{
  return nullsub_1;
}

uint64_t MatterAddDeviceExtensionRequestHandler.ThreadScanResult.init(networkName:panID:extendedPANID:channel:extendedAddress:rssi:version:linkQualityIndicator:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, __int16 a3@<W2>, uint64_t a4@<X3>, __int16 a5@<W4>, uint64_t a6@<X5>, uint64_t a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, __int16 a10)
{
  *(void *)a9 = result;
  *(void *)(a9 + 8) = a2;
  *(_WORD *)(a9 + 16) = a3;
  *(void *)(a9 + 24) = a4;
  *(_WORD *)(a9 + 32) = a5;
  *(void *)(a9 + 40) = a6;
  *(void *)(a9 + 48) = a7;
  *(unsigned char *)(a9 + 56) = a8;
  *(_WORD *)(a9 + 57) = a10;
  return result;
}

uint64_t MatterAddDeviceExtensionRequestHandler.ThreadScanResult.hash(into:)()
{
  uint64_t v1 = *(void *)(v0 + 40);
  unint64_t v2 = *(void *)(v0 + 48);
  swift_bridgeObjectRetain();
  sub_245132858();
  swift_bridgeObjectRelease();
  sub_245132D08();
  sub_245132D18();
  sub_245132D08();
  sub_2450FF9B4(v1, v2);
  sub_2451326C8();
  sub_245100544(v1, v2);
  sub_245132CF8();
  sub_245132CF8();
  return sub_245132CF8();
}

unint64_t sub_24510A530(char a1)
{
  unint64_t result = 0xD000000000000014;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x44496E6170;
      break;
    case 2:
    case 4:
      unint64_t result = 0x6465646E65747865;
      break;
    case 3:
      unint64_t result = 0x6C656E6E616863;
      break;
    case 5:
      unint64_t result = 1769173874;
      break;
    case 6:
      unint64_t result = 0x6E6F6973726576;
      break;
    case 7:
      return result;
    default:
      unint64_t result = 0x4E6B726F7774656ELL;
      break;
  }
  return result;
}

BOOL sub_24510A63C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

unint64_t sub_24510A650()
{
  return sub_24510A530(*v0);
}

uint64_t sub_24510A658@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24510B6C8(a1, a2);
  *a3 = result;
  return result;
}

void sub_24510A680(unsigned char *a1@<X8>)
{
  *a1 = 8;
}

uint64_t sub_24510A68C(uint64_t a1)
{
  unint64_t v2 = sub_24510B0F8();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24510A6C8(uint64_t a1)
{
  unint64_t v2 = sub_24510B0F8();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t MatterAddDeviceExtensionRequestHandler.ThreadScanResult.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268EC3AC8);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v23 = *(unsigned __int16 *)(v1 + 16);
  uint64_t v19 = *(void *)(v1 + 24);
  int v18 = *(unsigned __int16 *)(v1 + 32);
  uint64_t v7 = *(void *)(v1 + 40);
  uint64_t v16 = *(void *)(v1 + 48);
  uint64_t v17 = v7;
  LODWORD(v7) = *(unsigned __int8 *)(v1 + 56);
  v15[0] = *(unsigned __int8 *)(v1 + 57);
  v15[1] = v7;
  uint64_t v8 = a1[3];
  uint64_t v9 = a1;
  uint64_t v11 = v10;
  __swift_project_boxed_opaque_existential_1(v9, v8);
  sub_24510B0F8();
  sub_245132D88();
  LOBYTE(v21) = 0;
  uint64_t v12 = v20;
  sub_245132BF8();
  if (!v12)
  {
    uint64_t v13 = v17;
    LOBYTE(v21) = 1;
    sub_245132C58();
    LOBYTE(v21) = 2;
    sub_245132C68();
    LOBYTE(v21) = 3;
    sub_245132C58();
    uint64_t v21 = v13;
    uint64_t v22 = v16;
    char v24 = 4;
    sub_245102414();
    sub_245132C28();
    LOBYTE(v21) = 5;
    sub_245132C38();
    LOBYTE(v21) = 6;
    sub_245132C48();
    LOBYTE(v21) = 7;
    sub_245132C48();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v11);
}

uint64_t MatterAddDeviceExtensionRequestHandler.ThreadScanResult.hashValue.getter()
{
  uint64_t v1 = *(void *)(v0 + 40);
  unint64_t v2 = *(void *)(v0 + 48);
  sub_245132CD8();
  swift_bridgeObjectRetain();
  sub_245132858();
  swift_bridgeObjectRelease();
  sub_245132D08();
  sub_245132D18();
  sub_245132D08();
  sub_2450FF9B4(v1, v2);
  sub_2451326C8();
  sub_245100544(v1, v2);
  sub_245132CF8();
  sub_245132CF8();
  sub_245132CF8();
  return sub_245132D28();
}

uint64_t MatterAddDeviceExtensionRequestHandler.ThreadScanResult.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268EC3AD8);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24510B0F8();
  sub_245132D78();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  LOBYTE(v24) = 0;
  uint64_t v9 = sub_245132B58();
  uint64_t v11 = v10;
  LOBYTE(v24) = 1;
  swift_bridgeObjectRetain();
  int v26 = sub_245132BB8();
  LOBYTE(v24) = 2;
  uint64_t v23 = sub_245132BC8();
  LOBYTE(v24) = 3;
  int v22 = sub_245132BB8();
  char v27 = 4;
  sub_2451024BC();
  sub_245132B88();
  uint64_t v12 = v24;
  LOBYTE(v24) = 5;
  unint64_t v20 = v25;
  uint64_t v21 = v12;
  sub_2450FF9B4(v12, v25);
  int v19 = sub_245132B98();
  LOBYTE(v24) = 6;
  int v18 = sub_245132BA8();
  LOBYTE(v24) = 7;
  char v14 = sub_245132BA8();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  swift_bridgeObjectRetain();
  unint64_t v16 = v20;
  uint64_t v15 = v21;
  sub_2450FF9B4(v21, v20);
  sub_245100544(v15, v16);
  swift_bridgeObjectRelease();
  *(void *)a2 = v9;
  *(void *)(a2 + 8) = v11;
  *(_WORD *)(a2 + 16) = v26;
  *(void *)(a2 + 24) = v23;
  *(_WORD *)(a2 + 32) = v22;
  *(void *)(a2 + 40) = v15;
  *(void *)(a2 + 48) = v16;
  *(unsigned char *)(a2 + 56) = v19;
  *(unsigned char *)(a2 + 57) = v18;
  *(unsigned char *)(a2 + 58) = v14;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  return sub_245100544(v15, v16);
}

uint64_t sub_24510AE84()
{
  uint64_t v1 = *(void *)(v0 + 40);
  unint64_t v2 = *(void *)(v0 + 48);
  sub_245132CD8();
  swift_bridgeObjectRetain();
  sub_245132858();
  swift_bridgeObjectRelease();
  sub_245132D08();
  sub_245132D18();
  sub_245132D08();
  sub_2450FF9B4(v1, v2);
  sub_2451326C8();
  sub_245100544(v1, v2);
  sub_245132CF8();
  sub_245132CF8();
  sub_245132CF8();
  return sub_245132D28();
}

uint64_t sub_24510AF8C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return MatterAddDeviceExtensionRequestHandler.ThreadScanResult.init(from:)(a1, a2);
}

uint64_t sub_24510AFA4(void *a1)
{
  return MatterAddDeviceExtensionRequestHandler.ThreadScanResult.encode(to:)(a1);
}

uint64_t _s13MatterSupport0A32AddDeviceExtensionRequestHandlerC16ThreadScanResultV2eeoiySbAE_AEtFZ_0(uint64_t a1, uint64_t a2)
{
  int v2 = *(unsigned __int16 *)(a1 + 16);
  uint64_t v3 = *(void *)(a1 + 24);
  int v4 = *(unsigned __int16 *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  unint64_t v6 = *(void *)(a1 + 48);
  int v7 = *(unsigned __int8 *)(a1 + 56);
  int v8 = *(unsigned __int8 *)(a1 + 57);
  int v9 = *(unsigned __int8 *)(a1 + 58);
  int v10 = *(unsigned __int16 *)(a2 + 16);
  uint64_t v11 = *(void *)(a2 + 24);
  int v12 = *(unsigned __int16 *)(a2 + 32);
  uint64_t v13 = *(void *)(a2 + 40);
  unint64_t v14 = *(void *)(a2 + 48);
  int v15 = *(unsigned __int8 *)(a2 + 58);
  if (*(void *)a1 == *(void *)a2 && *(void *)(a1 + 8) == *(void *)(a2 + 8))
  {
    uint64_t result = 0;
    if (v2 != v10) {
      return result;
    }
    if (v3 != v11) {
      return result;
    }
    int v23 = *(unsigned __int8 *)(a2 + 56);
    int v24 = *(unsigned __int8 *)(a2 + 57);
    if (v4 != v12) {
      return result;
    }
  }
  else
  {
    unint64_t v19 = *(void *)(a2 + 48);
    uint64_t v20 = *(void *)(a2 + 40);
    int v23 = *(unsigned __int8 *)(a2 + 56);
    int v24 = *(unsigned __int8 *)(a2 + 57);
    unint64_t v21 = *(void *)(a1 + 48);
    uint64_t v22 = *(void *)(a1 + 40);
    char v17 = sub_245132C98();
    uint64_t result = 0;
    if ((v17 & 1) == 0) {
      return result;
    }
    if (v2 != v10) {
      return result;
    }
    if (v3 != v11) {
      return result;
    }
    unint64_t v6 = v21;
    uint64_t v5 = v22;
    unint64_t v14 = v19;
    uint64_t v13 = v20;
    if (v4 != v12) {
      return result;
    }
  }
  unsigned int v18 = sub_245110F0C(v5, v6, v13, v14) & (v7 == v23);
  if (v8 != v24) {
    unsigned int v18 = 0;
  }
  if (v9 == v15) {
    return v18;
  }
  else {
    return 0;
  }
}

unint64_t sub_24510B0F8()
{
  unint64_t result = qword_268EC3AD0;
  if (!qword_268EC3AD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268EC3AD0);
  }
  return result;
}

unint64_t sub_24510B150()
{
  unint64_t result = qword_268EC3AE0;
  if (!qword_268EC3AE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268EC3AE0);
  }
  return result;
}

uint64_t _s16ThreadScanResultVwxx(uint64_t a1)
{
  swift_bridgeObjectRelease();
  uint64_t v2 = *(void *)(a1 + 40);
  unint64_t v3 = *(void *)(a1 + 48);

  return sub_245100544(v2, v3);
}

uint64_t _s16ThreadScanResultVwcp(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(_WORD *)(a1 + 32) = *(_WORD *)(a2 + 32);
  uint64_t v5 = *(void *)(a2 + 40);
  unint64_t v6 = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  sub_2450FF9B4(v5, v6);
  *(void *)(a1 + 40) = v5;
  *(void *)(a1 + 48) = v6;
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  *(_WORD *)(a1 + 57) = *(_WORD *)(a2 + 57);
  return a1;
}

uint64_t _s16ThreadScanResultVwca(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(_WORD *)(a1 + 32) = *(_WORD *)(a2 + 32);
  uint64_t v4 = *(void *)(a2 + 40);
  unint64_t v5 = *(void *)(a2 + 48);
  sub_2450FF9B4(v4, v5);
  uint64_t v6 = *(void *)(a1 + 40);
  unint64_t v7 = *(void *)(a1 + 48);
  *(void *)(a1 + 40) = v4;
  *(void *)(a1 + 48) = v5;
  sub_245100544(v6, v7);
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  *(unsigned char *)(a1 + 57) = *(unsigned char *)(a2 + 57);
  *(unsigned char *)(a1 + 58) = *(unsigned char *)(a2 + 58);
  return a1;
}

__n128 __swift_memcpy59_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 43) = *(_OWORD *)(a2 + 43);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t _s16ThreadScanResultVwta(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(_WORD *)(a1 + 32) = *(_WORD *)(a2 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  unint64_t v6 = *(void *)(a1 + 48);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  sub_245100544(v5, v6);
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  *(_WORD *)(a1 + 57) = *(_WORD *)(a2 + 57);
  return a1;
}

uint64_t _s16ThreadScanResultVwet(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 59)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t _s16ThreadScanResultVwst(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 58) = 0;
    *(_WORD *)(result + 56) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 59) = 1;
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
    *(unsigned char *)(result + 59) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MatterAddDeviceExtensionRequestHandler.ThreadScanResult()
{
  return &type metadata for MatterAddDeviceExtensionRequestHandler.ThreadScanResult;
}

uint64_t _s16ThreadScanResultV10CodingKeysOwet(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF9) {
    goto LABEL_17;
  }
  if (a2 + 7 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 7) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 7;
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
      return (*a1 | (v4 << 8)) - 7;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 7;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 8;
  int v8 = v6 - 8;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *_s16ThreadScanResultV10CodingKeysOwst(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 7 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 7) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF9) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF8)
  {
    unsigned int v6 = ((a2 - 249) >> 8) + 1;
    *__n128 result = a2 + 7;
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
        JUMPOUT(0x24510B588);
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
          *__n128 result = a2 + 7;
        break;
    }
  }
  return result;
}

ValueMetadata *_s16ThreadScanResultV10CodingKeysOMa()
{
  return &_s16ThreadScanResultV10CodingKeysON;
}

unint64_t sub_24510B5C4()
{
  unint64_t result = qword_268EC3AE8;
  if (!qword_268EC3AE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268EC3AE8);
  }
  return result;
}

unint64_t sub_24510B61C()
{
  unint64_t result = qword_268EC3AF0;
  if (!qword_268EC3AF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268EC3AF0);
  }
  return result;
}

unint64_t sub_24510B674()
{
  unint64_t result = qword_268EC3AF8;
  if (!qword_268EC3AF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268EC3AF8);
  }
  return result;
}

uint64_t sub_24510B6C8(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x4E6B726F7774656ELL && a2 == 0xEB00000000656D61;
  if (v3 || (sub_245132C98() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x44496E6170 && a2 == 0xE500000000000000 || (sub_245132C98() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6465646E65747865 && a2 == 0xED000044494E4150 || (sub_245132C98() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6C656E6E616863 && a2 == 0xE700000000000000 || (sub_245132C98() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x6465646E65747865 && a2 == 0xEF73736572646441 || (sub_245132C98() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 1769173874 && a2 == 0xE400000000000000 || (sub_245132C98() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x6E6F6973726576 && a2 == 0xE700000000000000 || (sub_245132C98() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0xD000000000000014 && a2 == 0x8000000245137C80)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else
  {
    char v6 = sub_245132C98();
    swift_bridgeObjectRelease();
    if (v6) {
      return 7;
    }
    else {
      return 8;
    }
  }
}

uint64_t static MatterAddDeviceRequest.Topology.== infix(_:_:)(void *a1, void *a2)
{
  uint64_t v2 = a1[2];
  uint64_t v3 = a2[2];
  BOOL v4 = *a1 == *a2 && a1[1] == a2[1];
  if (!v4 && (sub_245132C98() & 1) == 0) {
    return 0;
  }

  return sub_24510BDB0(v2, v3);
}

id sub_24510BA6C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = *(void *)(v1 + 16);
  if (v2)
  {
    swift_bridgeObjectRetain();
    sub_245132A98();
    uint64_t v3 = v1 + 40;
    do
    {
      id v4 = objc_allocWithZone((Class)MTSDeviceSetupHome);
      swift_bridgeObjectRetain();
      uint64_t v5 = (void *)sub_245132828();
      swift_bridgeObjectRelease();
      objc_msgSend(v4, sel_initWithName_, v5);

      sub_245132A78();
      sub_245132AA8();
      sub_245132AB8();
      sub_245132A88();
      v3 += 16;
      --v2;
    }
    while (v2);
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  id v6 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  sub_24510CDB0();
  BOOL v7 = (void *)sub_245132888();
  swift_bridgeObjectRelease();
  id v8 = objc_msgSend(v6, sel_initWithHomes_, v7);

  return v8;
}

uint64_t MatterAddDeviceRequest.Topology.init(ecosystemName:homes:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  *a4 = result;
  a4[1] = a2;
  a4[2] = a3;
  return result;
}

uint64_t MatterAddDeviceRequest.Topology.ecosystemName.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t MatterAddDeviceRequest.Topology.ecosystemName.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*MatterAddDeviceRequest.Topology.ecosystemName.modify())()
{
  return nullsub_1;
}

uint64_t MatterAddDeviceRequest.Topology.homes.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t MatterAddDeviceRequest.Topology.homes.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 16) = a1;
  return result;
}

uint64_t (*MatterAddDeviceRequest.Topology.homes.modify())()
{
  return nullsub_1;
}

uint64_t MatterAddDeviceRequest.Topology.hash(into:)()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  sub_245132858();
  swift_bridgeObjectRelease();
  uint64_t result = sub_245132CE8();
  uint64_t v3 = *(void *)(v1 + 16);
  if (v3)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = v1 + 40;
    do
    {
      swift_bridgeObjectRetain();
      sub_245132858();
      swift_bridgeObjectRelease();
      v4 += 16;
      --v3;
    }
    while (v3);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_24510BDB0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 != *(void *)(a2 + 16)) {
    return 0;
  }
  if (v2 && a1 != a2)
  {
    uint64_t v3 = (void *)(a1 + 40);
    for (i = (void *)(a2 + 40); ; i += 2)
    {
      BOOL v5 = *(v3 - 1) == *(i - 1) && *v3 == *i;
      if (!v5 && (sub_245132C98() & 1) == 0) {
        break;
      }
      v3 += 2;
      if (!--v2) {
        return 1;
      }
    }
    return 0;
  }
  return 1;
}

uint64_t sub_24510BE38(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for MatterAddDeviceRequest.DeviceCriteria(0) - 8;
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  BOOL v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  int v10 = (char *)&v19 - v9;
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
        sub_24510CDF0(a1 + v12, (uint64_t)v10);
        sub_24510CDF0(a2 + v12, (uint64_t)v7);
        char v15 = static MatterAddDeviceRequest.DeviceCriteria.== infix(_:_:)(v10, v7);
        sub_24510CE54((uint64_t)v7);
        sub_24510CE54((uint64_t)v10);
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

uint64_t sub_24510BF98(char a1)
{
  if (a1) {
    return 0x73656D6F68;
  }
  else {
    return 0x65747379736F6365;
  }
}

uint64_t sub_24510BFD8()
{
  return sub_24510BF98(*v0);
}

uint64_t sub_24510BFE0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24510CCB4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24510C008(uint64_t a1)
{
  unint64_t v2 = sub_24510C708();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24510C044(uint64_t a1)
{
  unint64_t v2 = sub_24510C708();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t MatterAddDeviceRequest.Topology.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268EC3B00);
  uint64_t v10 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *(void *)(v1 + 16);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24510C708();
  sub_245132D88();
  char v13 = 0;
  sub_245132BF8();
  if (!v2)
  {
    uint64_t v11 = v9;
    char v12 = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268EC3B10);
    sub_24510C7B0(&qword_268EC3B18, (void (*)(void))sub_24510C75C);
    sub_245132C28();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v6, v4);
}

uint64_t MatterAddDeviceRequest.Topology.hashValue.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  sub_245132CD8();
  sub_245132858();
  sub_245132CE8();
  uint64_t v2 = *(void *)(v1 + 16);
  if (v2)
  {
    uint64_t v3 = v1 + 40;
    do
    {
      swift_bridgeObjectRetain();
      sub_245132858();
      swift_bridgeObjectRelease();
      v3 += 16;
      --v2;
    }
    while (v2);
  }
  return sub_245132D28();
}

uint64_t MatterAddDeviceRequest.Topology.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268EC3B28);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24510C708();
  sub_245132D78();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  char v16 = 0;
  uint64_t v9 = sub_245132B58();
  uint64_t v11 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268EC3B10);
  char v15 = 1;
  sub_24510C7B0(&qword_268EC3B30, (void (*)(void))sub_24510C820);
  swift_bridgeObjectRetain();
  sub_245132B88();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  uint64_t v12 = v14[1];
  *a2 = v9;
  a2[1] = v11;
  a2[2] = v12;
  swift_bridgeObjectRetain();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24510C544()
{
  uint64_t v1 = *(void *)(v0 + 16);
  sub_245132858();
  uint64_t v2 = *(void *)(v1 + 16);
  uint64_t result = sub_245132CE8();
  if (v2)
  {
    uint64_t v4 = v1 + 40;
    do
    {
      swift_bridgeObjectRetain();
      sub_245132858();
      uint64_t result = swift_bridgeObjectRelease();
      v4 += 16;
      --v2;
    }
    while (v2);
  }
  return result;
}

uint64_t sub_24510C5C8()
{
  uint64_t v1 = *(void *)(v0 + 16);
  sub_245132CD8();
  sub_245132858();
  uint64_t v2 = *(void *)(v1 + 16);
  sub_245132CE8();
  if (v2)
  {
    uint64_t v3 = v1 + 40;
    do
    {
      swift_bridgeObjectRetain();
      sub_245132858();
      swift_bridgeObjectRelease();
      v3 += 16;
      --v2;
    }
    while (v2);
  }
  return sub_245132D28();
}

uint64_t sub_24510C664@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return MatterAddDeviceRequest.Topology.init(from:)(a1, a2);
}

uint64_t sub_24510C67C(void *a1)
{
  return MatterAddDeviceRequest.Topology.encode(to:)(a1);
}

uint64_t sub_24510C694(void *a1, void *a2)
{
  uint64_t v2 = a1[2];
  uint64_t v3 = a2[2];
  BOOL v4 = *a1 == *a2 && a1[1] == a2[1];
  if (!v4 && (sub_245132C98() & 1) == 0) {
    return 0;
  }

  return sub_24510BDB0(v2, v3);
}

unint64_t sub_24510C708()
{
  unint64_t result = qword_268EC3B08;
  if (!qword_268EC3B08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268EC3B08);
  }
  return result;
}

unint64_t sub_24510C75C()
{
  unint64_t result = qword_268EC3B20;
  if (!qword_268EC3B20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268EC3B20);
  }
  return result;
}

uint64_t sub_24510C7B0(unint64_t *a1, void (*a2)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268EC3B10);
    a2();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_24510C820()
{
  unint64_t result = qword_268EC3B38;
  if (!qword_268EC3B38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268EC3B38);
  }
  return result;
}

unint64_t sub_24510C878()
{
  unint64_t result = qword_268EC3B40;
  if (!qword_268EC3B40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268EC3B40);
  }
  return result;
}

uint64_t _s8TopologyVwxx()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *_s8TopologyVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *_s8TopologyVwca(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t _s8TopologyVwta(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s8TopologyVwet(uint64_t a1, int a2)
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

uint64_t _s8TopologyVwst(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for MatterAddDeviceRequest.Topology()
{
  return &type metadata for MatterAddDeviceRequest.Topology;
}

unsigned char *_s8TopologyV10CodingKeysOwst(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24510CB74);
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

ValueMetadata *_s8TopologyV10CodingKeysOMa()
{
  return &_s8TopologyV10CodingKeysON;
}

unint64_t sub_24510CBB0()
{
  unint64_t result = qword_268EC3B48;
  if (!qword_268EC3B48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268EC3B48);
  }
  return result;
}

unint64_t sub_24510CC08()
{
  unint64_t result = qword_268EC3B50;
  if (!qword_268EC3B50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268EC3B50);
  }
  return result;
}

unint64_t sub_24510CC60()
{
  unint64_t result = qword_268EC3B58;
  if (!qword_268EC3B58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268EC3B58);
  }
  return result;
}

uint64_t sub_24510CCB4(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x65747379736F6365 && a2 == 0xED0000656D614E6DLL;
  if (v3 || (sub_245132C98() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x73656D6F68 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_245132C98();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

unint64_t sub_24510CDB0()
{
  unint64_t result = qword_268EC3B60;
  if (!qword_268EC3B60)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_268EC3B60);
  }
  return result;
}

uint64_t sub_24510CDF0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for MatterAddDeviceRequest.DeviceCriteria(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24510CE54(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for MatterAddDeviceRequest.DeviceCriteria(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

BOOL sub_24510CEB0(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268EC3D90);
  MEMORY[0x270FA5388](v4);
  uint64_t v79 = (uint64_t)&v75 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268EC3990);
  uint64_t v7 = MEMORY[0x270FA5388](v6 - 8);
  uint64_t v78 = (uint64_t)&v75 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v81 = (uint64_t)&v75 - v10;
  MEMORY[0x270FA5388](v9);
  uint64_t v82 = (uint64_t)&v75 - v11;
  uint64_t v12 = sub_2451326F8();
  uint64_t v83 = *(void *)(v12 - 8);
  uint64_t v84 = v12;
  uint64_t v13 = MEMORY[0x270FA5388](v12);
  char v15 = (char *)&v75 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  v80 = (char *)&v75 - v16;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_268EC3D98);
  MEMORY[0x270FA5388](v17 - 8);
  uint64_t v19 = (char *)&v75 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = type metadata accessor for MatterAddDeviceRequest.DeviceCriteria(0);
  uint64_t v21 = *(void *)(v20 - 8);
  uint64_t v22 = MEMORY[0x270FA5388](v20);
  int v24 = (char *)&v75 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = MEMORY[0x270FA5388](v22);
  char v27 = (char *)&v75 - v26;
  MEMORY[0x270FA5388](v25);
  uint64_t v29 = (uint64_t *)((char *)&v75 - v28);
  sub_24510CDF0(v2, (uint64_t)&v75 - v28);
  uint64_t v30 = 0;
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t v47 = *(void *)(*v29 + 16);
      uint64_t v30 = *(void *)(v47 + 16);
      if (!v30) {
        goto LABEL_39;
      }
      uint64_t v48 = v47 + ((*(unsigned __int8 *)(v21 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80));
      uint64_t v49 = *(void *)(v21 + 72);
      swift_bridgeObjectRetain();
      do
      {
        if (sub_24510CEB0(a1))
        {
          swift_release();
          goto LABEL_41;
        }
        v48 += v49;
        --v30;
      }
      while (v30);
      swift_release();
      swift_bridgeObjectRelease();
      return v30;
    case 2u:
      uint64_t v50 = swift_projectBox();
      sub_24510CDF0(v50, (uint64_t)v27);
      uint64_t v30 = sub_24510CEB0(a1) == 0;
      sub_24510CE54((uint64_t)v27);
      goto LABEL_39;
    case 3u:
      uint64_t v36 = v83;
      uint64_t v35 = v84;
      char v37 = v80;
      v76 = *(void (**)(char *, uint64_t *, uint64_t))(v83 + 32);
      v76(v80, v29, v84);
      uint64_t v38 = v82;
      sub_245113828(a1, v82);
      uint64_t v39 = v81;
      (*(void (**)(uint64_t, char *, uint64_t))(v36 + 16))(v81, v37, v35);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v36 + 56))(v39, 0, 1, v35);
      uint64_t v40 = *(int *)(v4 + 48);
      uint64_t v41 = v35;
      uint64_t v42 = v79;
      uint64_t v43 = v79 + v40;
      sub_245113828(v38, v79);
      uint64_t v77 = v43;
      sub_245113828(v39, v43);
      id v44 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v36 + 48);
      if (v44(v42, 1, v41) == 1)
      {
        sub_2451094B8(v39, &qword_268EC3990);
        sub_2451094B8(v38, &qword_268EC3990);
        id v45 = v37;
        uint64_t v46 = v84;
        (*(void (**)(char *, uint64_t))(v36 + 8))(v45, v84);
        if (v44(v77, 1, v46) == 1)
        {
          sub_2451094B8(v42, &qword_268EC3990);
          return 0;
        }
        goto LABEL_33;
      }
      uint64_t v66 = v78;
      sub_245113828(v42, v78);
      uint64_t v67 = v77;
      uint64_t v68 = v84;
      if (v44(v77, 1, v84) == 1)
      {
        sub_2451094B8(v81, &qword_268EC3990);
        sub_2451094B8(v82, &qword_268EC3990);
        v69 = *(void (**)(char *, uint64_t))(v83 + 8);
        v69(v80, v68);
        v69((char *)v66, v68);
LABEL_33:
        sub_2451094B8(v42, &qword_268EC3D90);
        return 1;
      }
      v76(v15, (uint64_t *)v67, v68);
      sub_245111260(&qword_268EC3DA0, MEMORY[0x263F07508]);
      char v72 = sub_245132818();
      uint64_t v73 = v68;
      v74 = *(void (**)(char *, uint64_t))(v83 + 8);
      v74(v15, v73);
      sub_2451094B8(v81, &qword_268EC3990);
      sub_2451094B8(v82, &qword_268EC3990);
      v74(v80, v73);
      v74((char *)v66, v73);
      sub_2451094B8(v42, &qword_268EC3990);
      return (v72 & 1) == 0;
    case 4u:
      uint64_t v51 = *(int *)(_s14DeviceCriteriaO17DeviceDescriptionVMa(0) + 20);
      goto LABEL_19;
    case 5u:
      uint64_t v51 = *(int *)(_s14DeviceCriteriaO17DeviceDescriptionVMa(0) + 24);
LABEL_19:
      uint64_t v52 = a1 + v51;
      return (*(unsigned char *)(v52 + 8) & 1) != 0 || *(void *)v52 != *v29;
    case 6u:
      uint64_t v54 = *v29;
      uint64_t v53 = v29[1];
      objc_super v55 = (void *)(a1 + *(int *)(_s14DeviceCriteriaO17DeviceDescriptionVMa(0) + 28));
      uint64_t v56 = v55[1];
      if (!v56)
      {
LABEL_41:
        swift_bridgeObjectRelease();
        return 1;
      }
      if (*v55 == v54 && v56 == v53)
      {
        swift_bridgeObjectRelease();
        return 0;
      }
      else
      {
        char v58 = sub_245132C98();
        swift_bridgeObjectRelease();
        uint64_t v30 = 0;
        if ((v58 & 1) == 0) {
          return 1;
        }
      }
      return v30;
    case 7u:
      uint64_t v59 = *v29;
      unint64_t v60 = v29[1];
      uint64_t v61 = v29[2];
      uint64_t v62 = (uint64_t *)(a1 + *(int *)(_s14DeviceCriteriaO17DeviceDescriptionVMa(0) + 32));
      uint64_t v63 = *v62;
      unint64_t v64 = v62[1];
      uint64_t v65 = v62[2];
      if (v64 >> 60 == 15)
      {
        sub_24510702C(v63, v64);
        sub_24510702C(v59, v60);
        return 1;
      }
      sub_245108C7C(v63, v64);
      sub_245108C7C(v63, v64);
      sub_2450FF9B4(v59, v60);
      BOOL v70 = sub_245112C5C(v63, v64, v65, v59, v60, v61);
      sub_245100544(v59, v60);
      sub_245100544(v59, v60);
      sub_24510702C(v63, v64);
      sub_24510702C(v63, v64);
      return !v70;
    case 8u:
      return v30;
    default:
      uint64_t v31 = *(void *)(*v29 + 16);
      uint64_t v32 = *(void *)(v31 + 16);
      if (!v32) {
        goto LABEL_7;
      }
      uint64_t v33 = v31 + ((*(unsigned __int8 *)(v21 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80));
      uint64_t v34 = *(void *)(v21 + 72);
      swift_bridgeObjectRetain();
      do
      {
        sub_24510CDF0(v33, (uint64_t)v24);
        if (!sub_24510CEB0(a1))
        {
          swift_bridgeObjectRelease();
          sub_2451113F8((uint64_t)v24, (uint64_t)v19);
          uint64_t v30 = 0;
          goto LABEL_38;
        }
        sub_24510CE54((uint64_t)v24);
        v33 += v34;
        --v32;
      }
      while (v32);
      swift_bridgeObjectRelease();
LABEL_7:
      uint64_t v30 = 1;
LABEL_38:
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v21 + 56))(v19, v30, 1, v20);
      sub_2451094B8((uint64_t)v19, &qword_268EC3D98);
LABEL_39:
      swift_release();
      return v30;
  }
}

uint64_t static MatterAddDeviceRequest.DeviceCriteria.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v69 = a1;
  uint64_t v70 = a2;
  uint64_t v2 = sub_2451326F8();
  uint64_t v67 = *(void *)(v2 - 8);
  uint64_t v68 = v2;
  MEMORY[0x270FA5388](v2);
  uint64_t v65 = (char *)&v63 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for MatterAddDeviceRequest.DeviceCriteria(0);
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  uint64_t v7 = (uint64_t *)((char *)&v63 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v8 = MEMORY[0x270FA5388](v5);
  uint64_t v10 = (uint64_t *)((char *)&v63 - v9);
  uint64_t v11 = MEMORY[0x270FA5388](v8);
  uint64_t v13 = (uint64_t *)((char *)&v63 - v12);
  uint64_t v14 = MEMORY[0x270FA5388](v11);
  uint64_t v16 = (uint64_t *)((char *)&v63 - v15);
  uint64_t v17 = MEMORY[0x270FA5388](v14);
  uint64_t v66 = (uint64_t)&v63 - v18;
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  uint64_t v64 = (uint64_t)&v63 - v20;
  uint64_t v21 = MEMORY[0x270FA5388](v19);
  uint64_t v63 = (uint64_t)&v63 - v22;
  uint64_t v23 = MEMORY[0x270FA5388](v21);
  uint64_t v25 = (char *)&v63 - v24;
  uint64_t v26 = MEMORY[0x270FA5388](v23);
  uint64_t v28 = (uint64_t *)((char *)&v63 - v27);
  MEMORY[0x270FA5388](v26);
  uint64_t v30 = (uint64_t *)((char *)&v63 - v29);
  uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_268EC3B68);
  uint64_t v32 = MEMORY[0x270FA5388](v31 - 8);
  uint64_t v34 = (char *)&v63 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = (uint64_t *)&v34[*(int *)(v32 + 56)];
  sub_24510CDF0(v69, (uint64_t)v34);
  sub_24510CDF0(v70, (uint64_t)v35);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      sub_24510CDF0((uint64_t)v34, (uint64_t)v28);
      uint64_t v36 = *v28;
      if (swift_getEnumCaseMultiPayload() != 1) {
        goto LABEL_9;
      }
      goto LABEL_5;
    case 2u:
      sub_24510CDF0((uint64_t)v34, (uint64_t)v25);
      if (swift_getEnumCaseMultiPayload() != 2) {
        goto LABEL_9;
      }
      uint64_t v38 = swift_projectBox();
      uint64_t v39 = swift_projectBox();
      uint64_t v40 = v63;
      sub_24510CDF0(v38, v63);
      uint64_t v41 = v39;
      uint64_t v42 = v64;
      sub_24510CDF0(v41, v64);
      char v37 = static MatterAddDeviceRequest.DeviceCriteria.== infix(_:_:)(v40, v42);
      sub_24510CE54(v42);
      sub_24510CE54(v40);
      goto LABEL_8;
    case 3u:
      uint64_t v43 = v66;
      sub_24510CDF0((uint64_t)v34, v66);
      if (swift_getEnumCaseMultiPayload() == 3)
      {
        uint64_t v44 = v67;
        id v45 = v65;
        uint64_t v46 = v35;
        uint64_t v47 = v68;
        (*(void (**)(char *, uint64_t *, uint64_t))(v67 + 32))(v65, v46, v68);
        char v37 = sub_2451326D8();
        uint64_t v48 = *(void (**)(char *, uint64_t))(v44 + 8);
        v48(v45, v47);
        v48((char *)v43, v47);
        goto LABEL_23;
      }
      (*(void (**)(uint64_t, uint64_t))(v67 + 8))(v43, v68);
      goto LABEL_36;
    case 4u:
      sub_24510CDF0((uint64_t)v34, (uint64_t)v16);
      if (swift_getEnumCaseMultiPayload() != 4) {
        goto LABEL_36;
      }
      uint64_t v49 = *v16;
      goto LABEL_16;
    case 5u:
      sub_24510CDF0((uint64_t)v34, (uint64_t)v13);
      if (swift_getEnumCaseMultiPayload() != 5) {
        goto LABEL_36;
      }
      uint64_t v49 = *v13;
LABEL_16:
      BOOL v50 = v49 == *v35;
      goto LABEL_20;
    case 6u:
      sub_24510CDF0((uint64_t)v34, (uint64_t)v10);
      uint64_t v59 = *v10;
      uint64_t v58 = v10[1];
      if (swift_getEnumCaseMultiPayload() != 6)
      {
        swift_bridgeObjectRelease();
        goto LABEL_36;
      }
      if (v59 == *v35 && v58 == v35[1])
      {
        swift_bridgeObjectRelease_n();
      }
      else
      {
        char v61 = sub_245132C98();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v61 & 1) == 0) {
          goto LABEL_30;
        }
      }
LABEL_40:
      sub_24510CE54((uint64_t)v34);
      char v37 = 1;
      return v37 & 1;
    case 7u:
      sub_24510CDF0((uint64_t)v34, (uint64_t)v7);
      uint64_t v51 = *v7;
      unint64_t v52 = v7[1];
      uint64_t v53 = v7[2];
      if (swift_getEnumCaseMultiPayload() != 7)
      {
        sub_245100544(v51, v52);
        goto LABEL_36;
      }
      uint64_t v54 = *v35;
      unint64_t v55 = v35[1];
      uint64_t v56 = v35[2];
      char v57 = sub_245110F0C(v51, v52, *v35, v55);
      sub_245100544(v54, v55);
      sub_245100544(v51, v52);
      if ((v57 & 1) == 0)
      {
LABEL_30:
        sub_24510CE54((uint64_t)v34);
        goto LABEL_37;
      }
      BOOL v50 = v53 == v56;
LABEL_20:
      char v37 = v50;
      goto LABEL_23;
    case 8u:
      if (swift_getEnumCaseMultiPayload() == 8) {
        goto LABEL_40;
      }
      goto LABEL_36;
    default:
      sub_24510CDF0((uint64_t)v34, (uint64_t)v30);
      uint64_t v36 = *v30;
      if (swift_getEnumCaseMultiPayload())
      {
LABEL_9:
        swift_release();
LABEL_36:
        sub_2451094B8((uint64_t)v34, &qword_268EC3B68);
LABEL_37:
        char v37 = 0;
      }
      else
      {
LABEL_5:
        char v37 = sub_24510BE38(*(void *)(v36 + 16), *(void *)(*v35 + 16));
LABEL_8:
        swift_release();
        swift_release();
LABEL_23:
        sub_24510CE54((uint64_t)v34);
      }
      return v37 & 1;
  }
}

uint64_t type metadata accessor for MatterAddDeviceRequest.DeviceCriteria(uint64_t a1)
{
  return sub_245107EF0(a1, (uint64_t *)&unk_268EC3C98);
}

uint64_t MatterAddDeviceRequest.DeviceCriteria.hash(into:)(uint64_t a1)
{
  uint64_t v3 = sub_2451326F8();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v31 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for MatterAddDeviceRequest.DeviceCriteria(0);
  uint64_t v32 = *(void *)(v7 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v31 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x270FA5388](v8);
  uint64_t v13 = (char *)&v31 - v12;
  uint64_t v14 = MEMORY[0x270FA5388](v11);
  uint64_t v16 = (char *)&v31 - v15;
  MEMORY[0x270FA5388](v14);
  uint64_t v18 = (uint64_t *)((char *)&v31 - v17);
  sub_24510CDF0(v1, (uint64_t)&v31 - v17);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t v23 = *(void *)(*v18 + 16);
      sub_245132CE8();
      sub_245132CE8();
      uint64_t v24 = *(void *)(v23 + 16);
      if (v24)
      {
        uint64_t v25 = v23 + ((*(unsigned __int8 *)(v32 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v32 + 80));
        uint64_t v26 = *(void *)(v32 + 72);
        do
        {
          sub_24510CDF0(v25, (uint64_t)v13);
          MatterAddDeviceRequest.DeviceCriteria.hash(into:)(a1);
          sub_24510CE54((uint64_t)v13);
          v25 += v26;
          --v24;
        }
        while (v24);
      }
      goto LABEL_11;
    case 2u:
      uint64_t v27 = swift_projectBox();
      sub_24510CDF0(v27, (uint64_t)v10);
      sub_245132CE8();
      MatterAddDeviceRequest.DeviceCriteria.hash(into:)(a1);
      sub_24510CE54((uint64_t)v10);
      goto LABEL_11;
    case 3u:
      (*(void (**)(char *, uint64_t *, uint64_t))(v4 + 32))(v6, v18, v3);
      sub_245132CE8();
      sub_245111260(&qword_268EC3B70, MEMORY[0x263F07508]);
      sub_245132808();
      return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    case 4u:
    case 5u:
      sub_245132CE8();
      goto LABEL_16;
    case 6u:
      sub_245132CE8();
      sub_245132858();
      return swift_bridgeObjectRelease();
    case 7u:
      uint64_t v29 = *v18;
      unint64_t v30 = v18[1];
      sub_245132CE8();
      sub_2451326C8();
      sub_245132D18();
      return sub_245100544(v29, v30);
    case 8u:
LABEL_16:
      uint64_t result = sub_245132CE8();
      break;
    default:
      uint64_t v19 = *(void *)(*v18 + 16);
      sub_245132CE8();
      sub_245132CE8();
      uint64_t v20 = *(void *)(v19 + 16);
      if (v20)
      {
        uint64_t v21 = v19 + ((*(unsigned __int8 *)(v32 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v32 + 80));
        uint64_t v22 = *(void *)(v32 + 72);
        do
        {
          sub_24510CDF0(v21, (uint64_t)v16);
          MatterAddDeviceRequest.DeviceCriteria.hash(into:)(a1);
          sub_24510CE54((uint64_t)v16);
          v21 += v22;
          --v20;
        }
        while (v20);
      }
LABEL_11:
      uint64_t result = swift_release();
      break;
  }
  return result;
}

uint64_t sub_24510E23C(char a1)
{
  return *(void *)&aAlldevicany[8 * a1];
}

uint64_t sub_24510E25C(char a1)
{
  if (a1) {
    return 0x444965646F6ELL;
  }
  else {
    return 0x6C627550746F6F72;
  }
}

uint64_t sub_24510E2A8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_245113798(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_24510E2D4(uint64_t a1)
{
  unint64_t v2 = sub_2451112FC();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24510E310(uint64_t a1)
{
  unint64_t v2 = sub_2451112FC();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24510E34C(uint64_t a1)
{
  unint64_t v2 = sub_2451113A4();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24510E388(uint64_t a1)
{
  unint64_t v2 = sub_2451113A4();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24510E3C4(uint64_t a1)
{
  unint64_t v2 = sub_245111350();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24510E400(uint64_t a1)
{
  unint64_t v2 = sub_245111350();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24510E43C()
{
  return sub_24510E23C(*v0);
}

uint64_t sub_24510E444@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24511331C(a1, a2);
  *a3 = result;
  return result;
}

void sub_24510E46C(unsigned char *a1@<X8>)
{
  *a1 = 9;
}

uint64_t sub_24510E478(uint64_t a1)
{
  unint64_t v2 = sub_245111068();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24510E4B4(uint64_t a1)
{
  unint64_t v2 = sub_245111068();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24510E4F0(uint64_t a1)
{
  unint64_t v2 = sub_24511120C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24510E52C(uint64_t a1)
{
  unint64_t v2 = sub_24511120C();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24510E568()
{
  return sub_24510E25C(*v0);
}

uint64_t sub_24510E570@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24511369C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24510E598(uint64_t a1)
{
  unint64_t v2 = sub_2451110BC();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24510E5D4(uint64_t a1)
{
  unint64_t v2 = sub_2451110BC();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24510E610(uint64_t a1)
{
  unint64_t v2 = sub_2451112A8();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24510E64C(uint64_t a1)
{
  unint64_t v2 = sub_2451112A8();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24510E688(uint64_t a1)
{
  unint64_t v2 = sub_245111164();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24510E6C4(uint64_t a1)
{
  unint64_t v2 = sub_245111164();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24510E700(uint64_t a1)
{
  unint64_t v2 = sub_245111110();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24510E73C(uint64_t a1)
{
  unint64_t v2 = sub_245111110();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24510E778(uint64_t a1)
{
  unint64_t v2 = sub_2451111B8();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24510E7B4(uint64_t a1)
{
  unint64_t v2 = sub_2451111B8();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t MatterAddDeviceRequest.DeviceCriteria.encode(to:)(void *a1)
{
  uint64_t v89 = __swift_instantiateConcreteTypeFromMangledName(&qword_268EC3B78);
  uint64_t v66 = *(void *)(v89 - 8);
  MEMORY[0x270FA5388](v89);
  v88 = (char *)v64 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v87 = __swift_instantiateConcreteTypeFromMangledName(&qword_268EC3B80);
  uint64_t v65 = *(void *)(v87 - 8);
  MEMORY[0x270FA5388](v87);
  v86 = (char *)v64 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v85 = __swift_instantiateConcreteTypeFromMangledName(&qword_268EC3B88);
  v64[2] = *(void *)(v85 - 8);
  MEMORY[0x270FA5388](v85);
  uint64_t v84 = (char *)v64 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v83 = __swift_instantiateConcreteTypeFromMangledName(&qword_268EC3B90);
  v64[1] = *(void *)(v83 - 8);
  MEMORY[0x270FA5388](v83);
  v80 = (char *)v64 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v82 = __swift_instantiateConcreteTypeFromMangledName(&qword_268EC3B98);
  v64[0] = *(void *)(v82 - 8);
  MEMORY[0x270FA5388](v82);
  uint64_t v78 = (char *)v64 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v81 = sub_2451326F8();
  uint64_t v79 = *(void *)(v81 - 8);
  MEMORY[0x270FA5388](v81);
  uint64_t v77 = (char *)v64 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v76 = __swift_instantiateConcreteTypeFromMangledName(&qword_268EC3BA0);
  uint64_t v75 = *(void *)(v76 - 8);
  MEMORY[0x270FA5388](v76);
  v74 = (char *)v64 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v73 = __swift_instantiateConcreteTypeFromMangledName(&qword_268EC3BA8);
  uint64_t v72 = *(void *)(v73 - 8);
  MEMORY[0x270FA5388](v73);
  uint64_t v71 = (char *)v64 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v70 = __swift_instantiateConcreteTypeFromMangledName(&qword_268EC3BB0);
  uint64_t v69 = *(void *)(v70 - 8);
  MEMORY[0x270FA5388](v70);
  uint64_t v68 = (char *)v64 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_268EC3BB8);
  uint64_t v67 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)v64 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for MatterAddDeviceRequest.DeviceCriteria(0);
  uint64_t v15 = MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)v64 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  uint64_t v19 = (void *)((char *)v64 - v18);
  uint64_t v92 = __swift_instantiateConcreteTypeFromMangledName(&qword_268EC3BC0);
  uint64_t v90 = *(void *)(v92 - 8);
  MEMORY[0x270FA5388](v92);
  uint64_t v21 = (char *)v64 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_245111068();
  v91 = v21;
  sub_245132D88();
  sub_24510CDF0(v94, (uint64_t)v19);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t v28 = *(void *)(*v19 + 16);
      LOBYTE(v95) = 2;
      sub_2451112FC();
      uint64_t v29 = v71;
      uint64_t v31 = v91;
      uint64_t v30 = v92;
      sub_245132BE8();
      uint64_t v95 = v28;
      __swift_instantiateConcreteTypeFromMangledName(&qword_268EC3C10);
      sub_245111494(&qword_268EC3C18, (unint64_t *)&unk_268EC3870);
      uint64_t v32 = v73;
      sub_245132C28();
      (*(void (**)(char *, uint64_t))(v72 + 8))(v29, v32);
      (*(void (**)(char *, uint64_t))(v90 + 8))(v31, v30);
      return swift_release();
    case 2u:
      uint64_t v33 = swift_projectBox();
      sub_24510CDF0(v33, (uint64_t)v17);
      LOBYTE(v95) = 3;
      sub_2451112A8();
      uint64_t v34 = v74;
      uint64_t v36 = v91;
      uint64_t v35 = v92;
      sub_245132BE8();
      sub_245111260((unint64_t *)&unk_268EC3870, (void (*)(uint64_t))type metadata accessor for MatterAddDeviceRequest.DeviceCriteria);
      uint64_t v37 = v76;
      sub_245132C28();
      (*(void (**)(char *, uint64_t))(v75 + 8))(v34, v37);
      sub_24510CE54((uint64_t)v17);
      (*(void (**)(char *, uint64_t))(v90 + 8))(v36, v35);
      return swift_release();
    case 3u:
      uint64_t v38 = v79;
      uint64_t v39 = v77;
      uint64_t v40 = v81;
      (*(void (**)(char *, uint64_t *, uint64_t))(v79 + 32))(v77, v19, v81);
      LOBYTE(v95) = 4;
      sub_24511120C();
      uint64_t v41 = v78;
      uint64_t v43 = v91;
      uint64_t v42 = v92;
      sub_245132BE8();
      sub_245111260(&qword_268EC3BF8, MEMORY[0x263F07508]);
      uint64_t v44 = v82;
      sub_245132C28();
      (*(void (**)(char *, uint64_t))(v64[0] + 8))(v41, v44);
      (*(void (**)(char *, uint64_t))(v38 + 8))(v39, v40);
      return (*(uint64_t (**)(char *, uint64_t))(v90 + 8))(v43, v42);
    case 4u:
      LOBYTE(v95) = 5;
      sub_2451111B8();
      id v45 = v80;
      uint64_t v47 = v91;
      uint64_t v46 = v92;
      sub_245132BE8();
      uint64_t v48 = v83;
      sub_245132C18();
      uint64_t v49 = &v95;
      goto LABEL_9;
    case 5u:
      LOBYTE(v95) = 6;
      sub_245111164();
      id v45 = v84;
      uint64_t v47 = v91;
      uint64_t v46 = v92;
      sub_245132BE8();
      uint64_t v48 = v85;
      sub_245132C18();
      uint64_t v49 = &v96;
LABEL_9:
      (*(void (**)(char *, uint64_t))(*(v49 - 32) + 8))(v45, v48);
      BOOL v50 = *(uint64_t (**)(char *, uint64_t))(v90 + 8);
      uint64_t v51 = v47;
      goto LABEL_11;
    case 6u:
      LOBYTE(v95) = 7;
      sub_245111110();
      unint64_t v52 = v86;
      uint64_t v53 = v91;
      uint64_t v46 = v92;
      sub_245132BE8();
      uint64_t v54 = v87;
      sub_245132BF8();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v65 + 8))(v52, v54);
      BOOL v50 = *(uint64_t (**)(char *, uint64_t))(v90 + 8);
      uint64_t v51 = v53;
LABEL_11:
      uint64_t result = v50(v51, v46);
      break;
    case 7u:
      uint64_t v56 = *v19;
      unint64_t v55 = v19[1];
      LOBYTE(v95) = 8;
      sub_2451110BC();
      char v57 = v88;
      uint64_t v59 = v91;
      uint64_t v58 = v92;
      sub_245132BE8();
      uint64_t v95 = v56;
      unint64_t v96 = v55;
      char v97 = 0;
      sub_245102414();
      uint64_t v60 = v89;
      uint64_t v61 = v93;
      sub_245132C28();
      if (v61)
      {
        (*(void (**)(char *, uint64_t))(v66 + 8))(v57, v60);
        (*(void (**)(char *, uint64_t))(v90 + 8))(v59, v58);
        uint64_t result = sub_245100544(v56, v55);
      }
      else
      {
        LOBYTE(v95) = 1;
        sub_245132C68();
        sub_245100544(v56, v55);
        (*(void (**)(char *, uint64_t))(v66 + 8))(v57, v60);
        uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v90 + 8))(v59, v58);
      }
      break;
    case 8u:
      LOBYTE(v95) = 0;
      sub_2451113A4();
      uint64_t v63 = v91;
      uint64_t v62 = v92;
      sub_245132BE8();
      (*(void (**)(char *, uint64_t))(v67 + 8))(v13, v11);
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v90 + 8))(v63, v62);
      break;
    default:
      uint64_t v22 = *(void *)(*v19 + 16);
      LOBYTE(v95) = 1;
      sub_245111350();
      uint64_t v23 = v68;
      uint64_t v25 = v91;
      uint64_t v24 = v92;
      sub_245132BE8();
      uint64_t v95 = v22;
      __swift_instantiateConcreteTypeFromMangledName(&qword_268EC3C10);
      sub_245111494(&qword_268EC3C18, (unint64_t *)&unk_268EC3870);
      uint64_t v26 = v70;
      sub_245132C28();
      (*(void (**)(char *, uint64_t))(v69 + 8))(v23, v26);
      (*(void (**)(char *, uint64_t))(v90 + 8))(v25, v24);
      uint64_t result = swift_release();
      break;
  }
  return result;
}

uint64_t MatterAddDeviceRequest.DeviceCriteria.hashValue.getter()
{
  sub_245132CD8();
  MatterAddDeviceRequest.DeviceCriteria.hash(into:)((uint64_t)v1);
  return sub_245132D28();
}

uint64_t MatterAddDeviceRequest.DeviceCriteria.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v116 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268EC3C30);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v107 = v3;
  uint64_t v108 = v4;
  MEMORY[0x270FA5388](v3);
  v123 = (char *)&v87 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v122 = __swift_instantiateConcreteTypeFromMangledName(&qword_268EC3C38);
  uint64_t v106 = *(void *)(v122 - 8);
  MEMORY[0x270FA5388](v122);
  v115 = (char *)&v87 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v105 = __swift_instantiateConcreteTypeFromMangledName(&qword_268EC3C40);
  uint64_t v104 = *(void *)(v105 - 8);
  MEMORY[0x270FA5388](v105);
  v114 = (char *)&v87 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v103 = __swift_instantiateConcreteTypeFromMangledName(&qword_268EC3C48);
  uint64_t v101 = *(void *)(v103 - 8);
  MEMORY[0x270FA5388](v103);
  v113 = (char *)&v87 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v102 = __swift_instantiateConcreteTypeFromMangledName(&qword_268EC3C50);
  uint64_t v100 = *(void *)(v102 - 8);
  MEMORY[0x270FA5388](v102);
  v110 = (char *)&v87 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v99 = __swift_instantiateConcreteTypeFromMangledName(&qword_268EC3C58);
  uint64_t v98 = *(void *)(v99 - 8);
  MEMORY[0x270FA5388](v99);
  v121 = (char *)&v87 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v97 = __swift_instantiateConcreteTypeFromMangledName(&qword_268EC3C60);
  uint64_t v96 = *(void *)(v97 - 8);
  MEMORY[0x270FA5388](v97);
  v112 = (char *)&v87 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v95 = __swift_instantiateConcreteTypeFromMangledName(&qword_268EC3C68);
  uint64_t v94 = *(void *)(v95 - 8);
  MEMORY[0x270FA5388](v95);
  v111 = (char *)&v87 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v119 = __swift_instantiateConcreteTypeFromMangledName(&qword_268EC3C70);
  uint64_t v93 = *(void *)(v119 - 8);
  MEMORY[0x270FA5388](v119);
  v109 = (char *)&v87 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v120 = __swift_instantiateConcreteTypeFromMangledName(&qword_268EC3C78);
  uint64_t v118 = *(void *)(v120 - 8);
  MEMORY[0x270FA5388](v120);
  uint64_t v15 = (char *)&v87 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v117 = type metadata accessor for MatterAddDeviceRequest.DeviceCriteria(0);
  uint64_t v16 = MEMORY[0x270FA5388](v117);
  uint64_t v92 = (uint64_t *)((char *)&v87 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  uint64_t v20 = (uint64_t *)((char *)&v87 - v19);
  uint64_t v21 = MEMORY[0x270FA5388](v18);
  uint64_t v23 = (uint64_t *)((char *)&v87 - v22);
  uint64_t v24 = MEMORY[0x270FA5388](v21);
  uint64_t v26 = (uint64_t *)((char *)&v87 - v25);
  uint64_t v27 = MEMORY[0x270FA5388](v24);
  uint64_t v29 = (char *)&v87 - v28;
  MEMORY[0x270FA5388](v27);
  uint64_t v31 = (uint64_t *)((char *)&v87 - v30);
  uint64_t v32 = a1[3];
  v124 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v32);
  sub_245111068();
  uint64_t v33 = v125;
  sub_245132D78();
  if (v33)
  {
LABEL_8:
    uint64_t v47 = (uint64_t)v124;
    return __swift_destroy_boxed_opaque_existential_1(v47);
  }
  uint64_t v87 = v26;
  v88 = v23;
  uint64_t v90 = v29;
  uint64_t v89 = v20;
  uint64_t v34 = v119;
  uint64_t v125 = 0;
  uint64_t v35 = v121;
  uint64_t v36 = v122;
  uint64_t v37 = v123;
  v91 = v31;
  uint64_t v38 = v120;
  uint64_t v39 = sub_245132BD8();
  uint64_t v40 = v39;
  if (*(void *)(v39 + 16) != 1)
  {
    uint64_t v44 = sub_245132A58();
    swift_allocError();
    uint64_t v46 = v45;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268EC37B0);
    uint64_t *v46 = v117;
    sub_245132B38();
    sub_245132A48();
    (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v44 - 8) + 104))(v46, *MEMORY[0x263F8DCB0], v44);
    swift_willThrow();
LABEL_7:
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v118 + 8))(v15, v38);
    goto LABEL_8;
  }
  switch(*(unsigned char *)(v39 + 32))
  {
    case 1:
      LOBYTE(v126) = 1;
      sub_245111350();
      uint64_t v49 = v111;
      uint64_t v50 = v125;
      sub_245132B28();
      if (v50) {
        goto LABEL_7;
      }
      uint64_t v51 = swift_allocObject();
      __swift_instantiateConcreteTypeFromMangledName(&qword_268EC3C10);
      sub_245111494(&qword_268EC3C88, (unint64_t *)&unk_268EC3840);
      uint64_t v52 = v95;
      sub_245132B88();
      (*(void (**)(char *, uint64_t))(v94 + 8))(v49, v52);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v118 + 8))(v15, v38);
      uint64_t v43 = v91;
      uint64_t *v91 = v51;
      goto LABEL_27;
    case 2:
      LOBYTE(v126) = 2;
      sub_2451112FC();
      uint64_t v53 = v112;
      uint64_t v54 = v125;
      sub_245132B28();
      if (v54) {
        goto LABEL_7;
      }
      uint64_t v55 = swift_allocObject();
      __swift_instantiateConcreteTypeFromMangledName(&qword_268EC3C10);
      sub_245111494(&qword_268EC3C88, (unint64_t *)&unk_268EC3840);
      uint64_t v56 = v97;
      sub_245132B88();
      (*(void (**)(char *, uint64_t))(v96 + 8))(v53, v56);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v118 + 8))(v15, v38);
      uint64_t v43 = v91;
      uint64_t *v91 = v55;
      goto LABEL_27;
    case 3:
      LOBYTE(v126) = 3;
      sub_2451112A8();
      char v57 = v35;
      uint64_t v58 = v125;
      sub_245132B28();
      if (v58) {
        goto LABEL_7;
      }
      uint64_t v59 = swift_allocBox();
      sub_245111260((unint64_t *)&unk_268EC3840, (void (*)(uint64_t))type metadata accessor for MatterAddDeviceRequest.DeviceCriteria);
      uint64_t v60 = v99;
      sub_245132B88();
      (*(void (**)(char *, uint64_t))(v98 + 8))(v57, v60);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v118 + 8))(v15, v38);
      uint64_t v43 = v91;
      uint64_t *v91 = v59;
      goto LABEL_27;
    case 4:
      LOBYTE(v126) = 4;
      sub_24511120C();
      uint64_t v61 = v110;
      uint64_t v62 = v125;
      sub_245132B28();
      if (v62) {
        goto LABEL_7;
      }
      sub_2451326F8();
      sub_245111260(&qword_268EC3C80, MEMORY[0x263F07508]);
      uint64_t v63 = (uint64_t)v90;
      uint64_t v64 = v102;
      sub_245132B88();
      (*(void (**)(char *, uint64_t))(v100 + 8))(v61, v64);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v118 + 8))(v15, v38);
      swift_storeEnumTagMultiPayload();
      uint64_t v65 = v63;
      goto LABEL_29;
    case 5:
      LOBYTE(v126) = 5;
      sub_2451111B8();
      uint64_t v66 = v113;
      uint64_t v67 = v125;
      sub_245132B28();
      if (v67) {
        goto LABEL_7;
      }
      uint64_t v68 = v103;
      uint64_t v76 = sub_245132B78();
      (*(void (**)(char *, uint64_t))(v101 + 8))(v66, v68);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v118 + 8))(v15, v38);
      uint64_t v77 = v87;
      *uint64_t v87 = v76;
      goto LABEL_28;
    case 6:
      LOBYTE(v126) = 6;
      sub_245111164();
      uint64_t v69 = v114;
      uint64_t v70 = v125;
      sub_245132B28();
      if (v70) {
        goto LABEL_7;
      }
      uint64_t v71 = v105;
      uint64_t v78 = sub_245132B78();
      (*(void (**)(char *, uint64_t))(v104 + 8))(v69, v71);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v118 + 8))(v15, v38);
      uint64_t v77 = v88;
      uint64_t *v88 = v78;
      goto LABEL_28;
    case 7:
      LOBYTE(v126) = 7;
      sub_245111110();
      uint64_t v72 = v115;
      uint64_t v73 = v125;
      sub_245132B28();
      if (v73)
      {
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v118 + 8))(v15, v38);
        uint64_t v47 = (uint64_t)v124;
      }
      else
      {
        uint64_t v82 = sub_245132B58();
        uint64_t v84 = v83;
        (*(void (**)(char *, uint64_t))(v106 + 8))(v72, v36);
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v118 + 8))(v15, v38);
        uint64_t v85 = v89;
        *uint64_t v89 = v82;
        v85[1] = v84;
        swift_storeEnumTagMultiPayload();
        uint64_t v65 = (uint64_t)v85;
LABEL_29:
        uint64_t v43 = v91;
        sub_2451113F8(v65, (uint64_t)v91);
LABEL_30:
        uint64_t v86 = (uint64_t)v124;
        sub_2451113F8((uint64_t)v43, v116);
        uint64_t v47 = v86;
      }
      break;
    case 8:
      LOBYTE(v126) = 8;
      sub_2451110BC();
      uint64_t v74 = v125;
      sub_245132B28();
      if (v74) {
        goto LABEL_7;
      }
      char v128 = 0;
      sub_2451024BC();
      uint64_t v75 = v107;
      sub_245132B88();
      uint64_t v125 = v40;
      uint64_t v80 = v126;
      uint64_t v79 = v127;
      char v128 = 1;
      uint64_t v122 = sub_245132BC8();
      uint64_t v81 = v118;
      (*(void (**)(char *, uint64_t))(v108 + 8))(v37, v75);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v81 + 8))(v15, v38);
      uint64_t v77 = v92;
      *uint64_t v92 = v80;
      v77[1] = v79;
      v77[2] = v122;
LABEL_28:
      swift_storeEnumTagMultiPayload();
      uint64_t v65 = (uint64_t)v77;
      goto LABEL_29;
    default:
      LOBYTE(v126) = 0;
      sub_2451113A4();
      uint64_t v41 = v109;
      uint64_t v42 = v125;
      sub_245132B28();
      if (v42) {
        goto LABEL_7;
      }
      (*(void (**)(char *, uint64_t))(v93 + 8))(v41, v34);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v118 + 8))(v15, v38);
      uint64_t v43 = v91;
LABEL_27:
      swift_storeEnumTagMultiPayload();
      goto LABEL_30;
  }
  return __swift_destroy_boxed_opaque_existential_1(v47);
}

uint64_t sub_2451108DC()
{
  sub_245132CD8();
  MatterAddDeviceRequest.DeviceCriteria.hash(into:)((uint64_t)v1);
  return sub_245132D28();
}

uint64_t sub_245110920()
{
  sub_245132CD8();
  MatterAddDeviceRequest.DeviceCriteria.hash(into:)((uint64_t)v1);
  return sub_245132D28();
}

uint64_t sub_24511095C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return MatterAddDeviceRequest.DeviceCriteria.init(from:)(a1, a2);
}

uint64_t sub_245110974(void *a1)
{
  return MatterAddDeviceRequest.DeviceCriteria.encode(to:)(a1);
}

BOOL sub_245110990(uint64_t a1, uint64_t a2)
{
  return sub_245112C5C(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)a2, *(void *)(a2 + 8), *(void *)(a2 + 16));
}

uint64_t sub_2451109B0@<X0>(uint64_t __s1@<X0>, uint64_t a2@<X2>, unint64_t a3@<X3>, char *a4@<X8>)
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
      sub_2450FF9B4(a2, a3);
      uint64_t v10 = (char *)sub_2451325F8();
      if (!v10) {
        goto LABEL_8;
      }
      uint64_t v11 = sub_245132618();
      if (__OFSUB__((int)a2, v11)) {
LABEL_33:
      }
        __break(1u);
      v10 += (int)a2 - v11;
LABEL_8:
      uint64_t v12 = sub_245132608();
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
        JUMPOUT(0x245110C14);
      }
      if (!v10) {
        goto LABEL_36;
      }
      int v14 = memcmp(v7, v10, v13);
      __s1 = sub_245100544(a2, a3);
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
      uint64_t v17 = (char *)sub_2451325F8();
      if (!v17) {
        goto LABEL_17;
      }
      uint64_t v18 = sub_245132618();
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
      uint64_t v21 = sub_245132608();
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

uint64_t sub_245110C24(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  __s1[2] = *MEMORY[0x263EF8340];
  switch(a2 >> 62)
  {
    case 1uLL:
      if (a1 >> 32 < (int)a1) {
        __break(1u);
      }
      sub_2450FF9B4(a1, a2);
      char v5 = sub_245110E54((int)a1, a1 >> 32, a2 & 0x3FFFFFFFFFFFFFFFLL, a3, a4);
      sub_245100544(a1, a2);
      goto LABEL_6;
    case 2uLL:
      uint64_t v10 = a2 & 0x3FFFFFFFFFFFFFFFLL;
      uint64_t v11 = *(void *)(a1 + 16);
      uint64_t v12 = *(void *)(a1 + 24);
      swift_retain();
      swift_retain();
      char v5 = sub_245110E54(v11, v12, v10, a3, a4);
      swift_release();
      swift_release();
LABEL_6:
      sub_245100544(a3, a4);
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
      sub_2451109B0((uint64_t)__s1, a3, a4, &v14);
      sub_245100544(a3, a4);
      if (!v4) {
        char v5 = v14;
      }
      return v5 & 1;
  }
}

uint64_t sub_245110E54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  uint64_t result = sub_2451325F8();
  uint64_t v11 = result;
  if (result)
  {
    uint64_t result = sub_245132618();
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
  sub_245132608();
  sub_2451109B0(v11, a4, a5, &v13);
  if (!v5) {
    char v12 = v13;
  }
  return v12 & 1;
}

uint64_t sub_245110F0C(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
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
        JUMPOUT(0x245111048);
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
              sub_2450FF9B4(a3, a4);
              char v15 = sub_245110C24(a1, a2, a3, a4);
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

unint64_t sub_245111068()
{
  unint64_t result = qword_268EC3BC8;
  if (!qword_268EC3BC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268EC3BC8);
  }
  return result;
}

unint64_t sub_2451110BC()
{
  unint64_t result = qword_268EC3BD0;
  if (!qword_268EC3BD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268EC3BD0);
  }
  return result;
}

unint64_t sub_245111110()
{
  unint64_t result = qword_268EC3BD8;
  if (!qword_268EC3BD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268EC3BD8);
  }
  return result;
}

unint64_t sub_245111164()
{
  unint64_t result = qword_268EC3BE0;
  if (!qword_268EC3BE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268EC3BE0);
  }
  return result;
}

unint64_t sub_2451111B8()
{
  unint64_t result = qword_268EC3BE8;
  if (!qword_268EC3BE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268EC3BE8);
  }
  return result;
}

unint64_t sub_24511120C()
{
  unint64_t result = qword_268EC3BF0;
  if (!qword_268EC3BF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268EC3BF0);
  }
  return result;
}

uint64_t sub_245111260(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_2451112A8()
{
  unint64_t result = qword_268EC3C00;
  if (!qword_268EC3C00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268EC3C00);
  }
  return result;
}

unint64_t sub_2451112FC()
{
  unint64_t result = qword_268EC3C08;
  if (!qword_268EC3C08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268EC3C08);
  }
  return result;
}

unint64_t sub_245111350()
{
  unint64_t result = qword_268EC3C20;
  if (!qword_268EC3C20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268EC3C20);
  }
  return result;
}

unint64_t sub_2451113A4()
{
  unint64_t result = qword_268EC3C28;
  if (!qword_268EC3C28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268EC3C28);
  }
  return result;
}

uint64_t sub_2451113F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for MatterAddDeviceRequest.DeviceCriteria(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24511145C()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_245111494(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268EC3C10);
    sub_245111260(a2, (void (*)(uint64_t))type metadata accessor for MatterAddDeviceRequest.DeviceCriteria);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_245111528()
{
  return sub_245111260(&qword_268EC3C90, (void (*)(uint64_t))type metadata accessor for MatterAddDeviceRequest.DeviceCriteria);
}

uint64_t *_s14DeviceCriteriaOwCP(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v7 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v7 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = *(void *)(a3 - 8);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
      case 1u:
      case 2u:
        *a1 = *a2;
        swift_retain();
        swift_storeEnumTagMultiPayload();
        break;
      case 3u:
        uint64_t v9 = sub_2451326F8();
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v9 - 8) + 16))(a1, a2, v9);
        swift_storeEnumTagMultiPayload();
        break;
      case 6u:
        uint64_t v10 = a2[1];
        *a1 = *a2;
        a1[1] = v10;
        swift_bridgeObjectRetain();
        swift_storeEnumTagMultiPayload();
        break;
      case 7u:
        uint64_t v11 = *a2;
        unint64_t v12 = a2[1];
        sub_2450FF9B4(*a2, v12);
        *a1 = v11;
        a1[1] = v12;
        a1[2] = a2[2];
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(a1, a2, *(void *)(v6 + 64));
        break;
    }
  }
  return a1;
}

uint64_t _s14DeviceCriteriaOwxx(uint64_t *a1)
{
  uint64_t result = swift_getEnumCaseMultiPayload();
  switch((int)result)
  {
    case 0:
    case 1:
    case 2:
      uint64_t result = swift_release();
      break;
    case 3:
      uint64_t v3 = sub_2451326F8();
      uint64_t v4 = *(uint64_t (**)(uint64_t *, uint64_t))(*(void *)(v3 - 8) + 8);
      uint64_t result = v4(a1, v3);
      break;
    case 6:
      uint64_t result = swift_bridgeObjectRelease();
      break;
    case 7:
      uint64_t v5 = *a1;
      unint64_t v6 = a1[1];
      uint64_t result = sub_245100544(v5, v6);
      break;
    default:
      return result;
  }
  return result;
}

uint64_t *_s14DeviceCriteriaOwcp(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
    case 1u:
    case 2u:
      *a1 = *a2;
      swift_retain();
      goto LABEL_7;
    case 3u:
      uint64_t v6 = sub_2451326F8();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
      goto LABEL_7;
    case 6u:
      uint64_t v7 = a2[1];
      *a1 = *a2;
      a1[1] = v7;
      swift_bridgeObjectRetain();
      goto LABEL_7;
    case 7u:
      uint64_t v8 = *a2;
      unint64_t v9 = a2[1];
      sub_2450FF9B4(*a2, v9);
      *a1 = v8;
      a1[1] = v9;
      a1[2] = a2[2];
LABEL_7:
      swift_storeEnumTagMultiPayload();
      break;
    default:
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
      break;
  }
  return a1;
}

uint64_t *_s14DeviceCriteriaOwca(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_24510CE54((uint64_t)a1);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
      case 1u:
      case 2u:
        *a1 = *a2;
        swift_retain();
        goto LABEL_8;
      case 3u:
        uint64_t v6 = sub_2451326F8();
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
        goto LABEL_8;
      case 6u:
        *a1 = *a2;
        a1[1] = a2[1];
        swift_bridgeObjectRetain();
        goto LABEL_8;
      case 7u:
        uint64_t v7 = *a2;
        unint64_t v8 = a2[1];
        sub_2450FF9B4(*a2, v8);
        *a1 = v7;
        a1[1] = v8;
        a1[2] = a2[2];
LABEL_8:
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
        break;
    }
  }
  return a1;
}

void *_s14DeviceCriteriaOwtk(void *a1, const void *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload() == 3)
  {
    uint64_t v6 = sub_2451326F8();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  return a1;
}

void *_s14DeviceCriteriaOwta(void *a1, const void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_24510CE54((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload() == 3)
    {
      uint64_t v6 = sub_2451326F8();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
  }
  return a1;
}

uint64_t _s14DeviceCriteriaOwet(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t _s14DeviceCriteriaOwst(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_245111DB4()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_245111DC4()
{
  uint64_t result = sub_2451326F8();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t _s14DeviceCriteriaO10CodingKeysOwet(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF8) {
    goto LABEL_17;
  }
  if (a2 + 8 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 8) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 8;
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
      return (*a1 | (v4 << 8)) - 8;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 8;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 9;
  int v8 = v6 - 9;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *_s14DeviceCriteriaO10CodingKeysOwst(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 8 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 8) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF8) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF7)
  {
    unsigned int v6 = ((a2 - 248) >> 8) + 1;
    *uint64_t result = a2 + 8;
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
        JUMPOUT(0x245111FDCLL);
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
          *uint64_t result = a2 + 8;
        break;
    }
  }
  return result;
}

ValueMetadata *_s14DeviceCriteriaO10CodingKeysOMa()
{
  return &_s14DeviceCriteriaO10CodingKeysON;
}

ValueMetadata *_s14DeviceCriteriaO20AllDevicesCodingKeysOMa()
{
  return &_s14DeviceCriteriaO20AllDevicesCodingKeysON;
}

ValueMetadata *_s14DeviceCriteriaO13AnyCodingKeysOMa()
{
  return &_s14DeviceCriteriaO13AnyCodingKeysON;
}

ValueMetadata *_s14DeviceCriteriaO13AllCodingKeysOMa()
{
  return &_s14DeviceCriteriaO13AllCodingKeysON;
}

ValueMetadata *_s14DeviceCriteriaO13NotCodingKeysOMa()
{
  return &_s14DeviceCriteriaO13NotCodingKeysON;
}

ValueMetadata *_s14DeviceCriteriaO25CommissioningIDCodingKeysOMa()
{
  return &_s14DeviceCriteriaO25CommissioningIDCodingKeysON;
}

ValueMetadata *_s14DeviceCriteriaO18VendorIDCodingKeysOMa()
{
  return &_s14DeviceCriteriaO18VendorIDCodingKeysON;
}

ValueMetadata *_s14DeviceCriteriaO19ProductIDCodingKeysOMa()
{
  return &_s14DeviceCriteriaO19ProductIDCodingKeysON;
}

unsigned char *_s14DeviceCriteriaO13AnyCodingKeysOwst_0(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x245112128);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *_s14DeviceCriteriaO22SerialNumberCodingKeysOMa()
{
  return &_s14DeviceCriteriaO22SerialNumberCodingKeysON;
}

unsigned char *_s14DeviceCriteriaO20FabricNodeCodingKeysOwst(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24511222CLL);
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

ValueMetadata *_s14DeviceCriteriaO20FabricNodeCodingKeysOMa()
{
  return &_s14DeviceCriteriaO20FabricNodeCodingKeysON;
}

unint64_t sub_245112268()
{
  unint64_t result = qword_268EC3CA8;
  if (!qword_268EC3CA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268EC3CA8);
  }
  return result;
}

unint64_t sub_2451122C0()
{
  unint64_t result = qword_268EC3CB0;
  if (!qword_268EC3CB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268EC3CB0);
  }
  return result;
}

unint64_t sub_245112318()
{
  unint64_t result = qword_268EC3CB8;
  if (!qword_268EC3CB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268EC3CB8);
  }
  return result;
}

unint64_t sub_245112370()
{
  unint64_t result = qword_268EC3CC0;
  if (!qword_268EC3CC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268EC3CC0);
  }
  return result;
}

unint64_t sub_2451123C8()
{
  unint64_t result = qword_268EC3CC8;
  if (!qword_268EC3CC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268EC3CC8);
  }
  return result;
}

unint64_t sub_245112420()
{
  unint64_t result = qword_268EC3CD0;
  if (!qword_268EC3CD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268EC3CD0);
  }
  return result;
}

unint64_t sub_245112478()
{
  unint64_t result = qword_268EC3CD8;
  if (!qword_268EC3CD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268EC3CD8);
  }
  return result;
}

unint64_t sub_2451124D0()
{
  unint64_t result = qword_268EC3CE0;
  if (!qword_268EC3CE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268EC3CE0);
  }
  return result;
}

unint64_t sub_245112528()
{
  unint64_t result = qword_268EC3CE8;
  if (!qword_268EC3CE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268EC3CE8);
  }
  return result;
}

unint64_t sub_245112580()
{
  unint64_t result = qword_268EC3CF0;
  if (!qword_268EC3CF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268EC3CF0);
  }
  return result;
}

unint64_t sub_2451125D8()
{
  unint64_t result = qword_268EC3CF8;
  if (!qword_268EC3CF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268EC3CF8);
  }
  return result;
}

unint64_t sub_245112630()
{
  unint64_t result = qword_268EC3D00;
  if (!qword_268EC3D00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268EC3D00);
  }
  return result;
}

unint64_t sub_245112688()
{
  unint64_t result = qword_268EC3D08;
  if (!qword_268EC3D08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268EC3D08);
  }
  return result;
}

unint64_t sub_2451126E0()
{
  unint64_t result = qword_268EC3D10;
  if (!qword_268EC3D10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268EC3D10);
  }
  return result;
}

unint64_t sub_245112738()
{
  unint64_t result = qword_268EC3D18;
  if (!qword_268EC3D18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268EC3D18);
  }
  return result;
}

unint64_t sub_245112790()
{
  unint64_t result = qword_268EC3D20;
  if (!qword_268EC3D20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268EC3D20);
  }
  return result;
}

unint64_t sub_2451127E8()
{
  unint64_t result = qword_268EC3D28;
  if (!qword_268EC3D28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268EC3D28);
  }
  return result;
}

unint64_t sub_245112840()
{
  unint64_t result = qword_268EC3D30;
  if (!qword_268EC3D30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268EC3D30);
  }
  return result;
}

unint64_t sub_245112898()
{
  unint64_t result = qword_268EC3D38;
  if (!qword_268EC3D38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268EC3D38);
  }
  return result;
}

unint64_t sub_2451128F0()
{
  unint64_t result = qword_268EC3D40;
  if (!qword_268EC3D40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268EC3D40);
  }
  return result;
}

unint64_t sub_245112948()
{
  unint64_t result = qword_268EC3D48;
  if (!qword_268EC3D48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268EC3D48);
  }
  return result;
}

unint64_t sub_2451129A0()
{
  unint64_t result = qword_268EC3D50;
  if (!qword_268EC3D50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268EC3D50);
  }
  return result;
}

unint64_t sub_2451129F8()
{
  unint64_t result = qword_268EC3D58;
  if (!qword_268EC3D58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268EC3D58);
  }
  return result;
}

unint64_t sub_245112A50()
{
  unint64_t result = qword_268EC3D60;
  if (!qword_268EC3D60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268EC3D60);
  }
  return result;
}

unint64_t sub_245112AA8()
{
  unint64_t result = qword_268EC3D68;
  if (!qword_268EC3D68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268EC3D68);
  }
  return result;
}

unint64_t sub_245112B00()
{
  unint64_t result = qword_268EC3D70;
  if (!qword_268EC3D70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268EC3D70);
  }
  return result;
}

unint64_t sub_245112B58()
{
  unint64_t result = qword_268EC3D78;
  if (!qword_268EC3D78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268EC3D78);
  }
  return result;
}

unint64_t sub_245112BB0()
{
  unint64_t result = qword_268EC3D80;
  if (!qword_268EC3D80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268EC3D80);
  }
  return result;
}

unint64_t sub_245112C08()
{
  unint64_t result = qword_268EC3D88;
  if (!qword_268EC3D88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268EC3D88);
  }
  return result;
}

BOOL sub_245112C5C(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6)
{
  uint64_t v12 = 0;
  switch(a2 >> 62)
  {
    case 1uLL:
      LODWORD(v12) = HIDWORD(a1) - a1;
      if (__OFSUB__(HIDWORD(a1), a1))
      {
        __break(1u);
LABEL_18:
        __break(1u);
LABEL_19:
        __break(1u);
LABEL_20:
        __break(1u);
        JUMPOUT(0x245112DA0);
      }
      uint64_t v12 = (int)v12;
LABEL_6:
      switch(a5 >> 62)
      {
        case 1uLL:
          LODWORD(v16) = HIDWORD(a4) - a4;
          if (__OFSUB__(HIDWORD(a4), a4)) {
            goto LABEL_19;
          }
          uint64_t v16 = (int)v16;
LABEL_11:
          if (v12 == v16 && (v12 < 1 || (sub_2450FF9B4(a4, a5), (sub_245110C24(a1, a2, a4, a5) & 1) != 0))) {
            return a3 == a6;
          }
          else {
            return 0;
          }
        case 2uLL:
          uint64_t v18 = *(void *)(a4 + 16);
          uint64_t v17 = *(void *)(a4 + 24);
          BOOL v15 = __OFSUB__(v17, v18);
          uint64_t v16 = v17 - v18;
          if (!v15) {
            goto LABEL_11;
          }
          goto LABEL_20;
        case 3uLL:
          if (v12) {
            return 0;
          }
          return a3 == a6;
        default:
          uint64_t v16 = BYTE6(a5);
          goto LABEL_11;
      }
    case 2uLL:
      uint64_t v14 = *(void *)(a1 + 16);
      uint64_t v13 = *(void *)(a1 + 24);
      BOOL v15 = __OFSUB__(v13, v14);
      uint64_t v12 = v13 - v14;
      if (!v15) {
        goto LABEL_6;
      }
      goto LABEL_18;
    case 3uLL:
      goto LABEL_6;
    default:
      uint64_t v12 = BYTE6(a2);
      goto LABEL_6;
  }
}

BOOL sub_245112DC0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2451326F8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  BOOL v7 = (char *)&v56 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268EC3D90);
  uint64_t v9 = v8 - 8;
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v56 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_268EC3990);
  uint64_t v13 = MEMORY[0x270FA5388](v12 - 8);
  BOOL v15 = (char *)&v56 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = MEMORY[0x270FA5388](v13);
  uint64_t v18 = (char *)&v56 - v17;
  MEMORY[0x270FA5388](v16);
  int64_t v20 = (char *)&v56 - v19;
  uint64_t v56 = a1;
  sub_245113828(a1, (uint64_t)&v56 - v19);
  uint64_t v57 = a2;
  sub_245113828(a2, (uint64_t)v18);
  uint64_t v21 = (uint64_t)&v11[*(int *)(v9 + 56)];
  sub_245113828((uint64_t)v20, (uint64_t)v11);
  sub_245113828((uint64_t)v18, v21);
  size_t v22 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48);
  if (v22((uint64_t)v11, 1, v4) == 1)
  {
    sub_2451094B8((uint64_t)v18, &qword_268EC3990);
    sub_2451094B8((uint64_t)v20, &qword_268EC3990);
    if (v22(v21, 1, v4) == 1)
    {
      sub_2451094B8((uint64_t)v11, &qword_268EC3990);
      goto LABEL_10;
    }
LABEL_6:
    sub_2451094B8((uint64_t)v11, &qword_268EC3D90);
    return 0;
  }
  sub_245113828((uint64_t)v11, (uint64_t)v15);
  if (v22(v21, 1, v4) == 1)
  {
    sub_2451094B8((uint64_t)v18, &qword_268EC3990);
    sub_2451094B8((uint64_t)v20, &qword_268EC3990);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v15, v4);
    goto LABEL_6;
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 32))(v7, v21, v4);
  sub_245111260(&qword_268EC3DA0, MEMORY[0x263F07508]);
  char v24 = sub_245132818();
  uint64_t v25 = *(void (**)(char *, uint64_t))(v5 + 8);
  v25(v7, v4);
  sub_2451094B8((uint64_t)v18, &qword_268EC3990);
  sub_2451094B8((uint64_t)v20, &qword_268EC3990);
  v25(v15, v4);
  sub_2451094B8((uint64_t)v11, &qword_268EC3990);
  if ((v24 & 1) == 0) {
    return 0;
  }
LABEL_10:
  __int16 v26 = (int *)_s14DeviceCriteriaO17DeviceDescriptionVMa(0);
  char v27 = v26;
  uint64_t v28 = v26[5];
  uint64_t v30 = v56;
  uint64_t v29 = v57;
  uint64_t v31 = (void *)(v56 + v28);
  char v32 = *(unsigned char *)(v56 + v28 + 8);
  uint64_t v33 = (void *)(v57 + v28);
  int v34 = *(unsigned __int8 *)(v57 + v28 + 8);
  if (v32)
  {
    if (!v34) {
      return 0;
    }
  }
  else
  {
    if (*v31 != *v33) {
      LOBYTE(v34) = 1;
    }
    if (v34) {
      return 0;
    }
  }
  uint64_t v35 = v26[6];
  uint64_t v36 = (void *)(v56 + v35);
  char v37 = *(unsigned char *)(v56 + v35 + 8);
  uint64_t v38 = (void *)(v57 + v35);
  int v39 = *(unsigned __int8 *)(v57 + v35 + 8);
  if (v37)
  {
    if (!v39) {
      return 0;
    }
  }
  else
  {
    if (*v36 != *v38) {
      LOBYTE(v39) = 1;
    }
    if (v39) {
      return 0;
    }
  }
  uint64_t v40 = v26[7];
  uint64_t v41 = (void *)(v56 + v40);
  uint64_t v42 = *(void *)(v56 + v40 + 8);
  uint64_t v43 = (void *)(v57 + v40);
  uint64_t v44 = v43[1];
  if (!v42)
  {
    if (v44) {
      return 0;
    }
LABEL_29:
    uint64_t v46 = v27[8];
    uint64_t v47 = v30 + v46;
    uint64_t v48 = *(void *)(v30 + v46);
    unint64_t v49 = *(void *)(v30 + v46 + 8);
    uint64_t v50 = *(void *)(v47 + 16);
    uint64_t v51 = (uint64_t *)(v29 + v46);
    uint64_t v52 = *v51;
    unint64_t v53 = v51[1];
    uint64_t v54 = v51[2];
    if (v49 >> 60 == 15)
    {
      if (v53 >> 60 == 15) {
        return 1;
      }
    }
    else if (v53 >> 60 != 15)
    {
      sub_245108C7C(v48, v49);
      sub_245108C7C(v52, v53);
      BOOL v55 = sub_245112C5C(v48, v49, v50, v52, v53, v54);
      sub_24510702C(v52, v53);
      sub_24510702C(v48, v49);
      return v55;
    }
    sub_245108C7C(v48, v49);
    sub_245108C7C(v52, v53);
    sub_24510702C(v48, v49);
    sub_24510702C(v52, v53);
    return 0;
  }
  if (!v44) {
    return 0;
  }
  if (*v41 == *v43 && v42 == v44) {
    goto LABEL_29;
  }
  char v45 = sub_245132C98();
  BOOL result = 0;
  if (v45) {
    goto LABEL_29;
  }
  return result;
}

uint64_t sub_245113310()
{
  return 12383;
}

uint64_t sub_24511331C(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x63697665446C6C61 && a2 == 0xEA00000000007365 || (sub_245132C98() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 7958113 && a2 == 0xE300000000000000 || (sub_245132C98() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 7105633 && a2 == 0xE300000000000000 || (sub_245132C98() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 7630702 && a2 == 0xE300000000000000 || (sub_245132C98() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x697373696D6D6F63 && a2 == 0xEF4449676E696E6FLL || (sub_245132C98() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x4449726F646E6576 && a2 == 0xE800000000000000 || (sub_245132C98() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x49746375646F7270 && a2 == 0xE900000000000044 || (sub_245132C98() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0x754E6C6169726573 && a2 == 0xEC0000007265626DLL || (sub_245132C98() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0x6F4E636972626166 && a2 == 0xEA00000000006564)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else
  {
    char v5 = sub_245132C98();
    swift_bridgeObjectRelease();
    if (v5) {
      return 8;
    }
    else {
      return 9;
    }
  }
}

uint64_t sub_24511369C(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x6C627550746F6F72 && a2 == 0xED000079654B6369;
  if (v3 || (sub_245132C98() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x444965646F6ELL && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_245132C98();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_245113798(uint64_t a1, uint64_t a2)
{
  if (a1 == 12383 && a2 == 0xE200000000000000)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_245132C98();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t _s14DeviceCriteriaO17DeviceDescriptionVMa(uint64_t a1)
{
  return sub_245107EF0(a1, (uint64_t *)&unk_268EC3DA8);
}

uint64_t sub_245113828(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268EC3990);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t *sub_245113890(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_2451326F8();
    uint64_t v8 = *(void *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268EC3990);
      memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(a1, a2, v7);
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
    uint64_t v11 = a3[5];
    uint64_t v12 = a3[6];
    uint64_t v13 = (char *)a1 + v11;
    uint64_t v14 = (char *)a2 + v11;
    *(void *)uint64_t v13 = *(void *)v14;
    v13[8] = v14[8];
    BOOL v15 = (char *)a1 + v12;
    uint64_t v16 = (char *)a2 + v12;
    *(void *)BOOL v15 = *(void *)v16;
    v15[8] = v16[8];
    uint64_t v17 = a3[7];
    uint64_t v18 = a3[8];
    uint64_t v19 = (uint64_t *)((char *)a1 + v17);
    int64_t v20 = (uint64_t *)((char *)a2 + v17);
    uint64_t v21 = v20[1];
    *uint64_t v19 = *v20;
    v19[1] = v21;
    size_t v22 = (char *)a1 + v18;
    int v23 = (uint64_t *)((char *)a2 + v18);
    unint64_t v24 = *(uint64_t *)((char *)a2 + v18 + 8);
    swift_bridgeObjectRetain();
    if (v24 >> 60 == 15)
    {
      *(_OWORD *)size_t v22 = *(_OWORD *)v23;
    }
    else
    {
      uint64_t v25 = *v23;
      sub_2450FF9B4(*v23, v24);
      *(void *)size_t v22 = v25;
      *((void *)v22 + 1) = v24;
    }
    *((void *)v22 + 2) = v23[2];
  }
  return a1;
}

uint64_t sub_245113A88(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2451326F8();
  uint64_t v5 = *(void *)(v4 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(a1, 1, v4)) {
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1, v4);
  }
  uint64_t result = swift_bridgeObjectRelease();
  uint64_t v7 = (uint64_t *)(a1 + *(int *)(a2 + 32));
  unint64_t v8 = v7[1];
  if (v8 >> 60 != 15)
  {
    uint64_t v9 = *v7;
    return sub_245100544(v9, v8);
  }
  return result;
}

char *sub_245113B88(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_2451326F8();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268EC3990);
    memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(a1, a2, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  uint64_t v9 = a3[5];
  uint64_t v10 = a3[6];
  uint64_t v11 = &a1[v9];
  uint64_t v12 = &a2[v9];
  *(void *)uint64_t v11 = *(void *)v12;
  v11[8] = v12[8];
  uint64_t v13 = &a1[v10];
  uint64_t v14 = &a2[v10];
  *(void *)uint64_t v13 = *(void *)v14;
  v13[8] = v14[8];
  uint64_t v15 = a3[7];
  uint64_t v16 = a3[8];
  uint64_t v17 = &a1[v15];
  uint64_t v18 = &a2[v15];
  uint64_t v19 = *((void *)v18 + 1);
  *(void *)uint64_t v17 = *(void *)v18;
  *((void *)v17 + 1) = v19;
  int64_t v20 = &a1[v16];
  uint64_t v21 = (uint64_t *)&a2[v16];
  unint64_t v22 = *(void *)&a2[v16 + 8];
  swift_bridgeObjectRetain();
  if (v22 >> 60 == 15)
  {
    *(_OWORD *)int64_t v20 = *(_OWORD *)v21;
  }
  else
  {
    uint64_t v23 = *v21;
    sub_2450FF9B4(*v21, v22);
    *(void *)int64_t v20 = v23;
    *((void *)v20 + 1) = v22;
  }
  *((void *)v20 + 2) = v21[2];
  return a1;
}

char *sub_245113D30(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_2451326F8();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (v9)
  {
    if (!v10)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 16))(a1, a2, v6);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v10)
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(a1, v6);
LABEL_6:
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_268EC3990);
    memcpy(a1, a2, *(void *)(*(void *)(v11 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 24))(a1, a2, v6);
LABEL_7:
  uint64_t v12 = a3[5];
  uint64_t v13 = &a1[v12];
  uint64_t v14 = &a2[v12];
  uint64_t v15 = *(void *)v14;
  v13[8] = v14[8];
  *(void *)uint64_t v13 = v15;
  uint64_t v16 = a3[6];
  uint64_t v17 = &a1[v16];
  uint64_t v18 = &a2[v16];
  uint64_t v19 = *(void *)v18;
  v17[8] = v18[8];
  *(void *)uint64_t v17 = v19;
  uint64_t v20 = a3[7];
  uint64_t v21 = &a1[v20];
  unint64_t v22 = &a2[v20];
  *(void *)uint64_t v21 = *(void *)v22;
  *((void *)v21 + 1) = *((void *)v22 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v23 = a3[8];
  uint64_t v24 = (uint64_t)&a1[v23];
  uint64_t v25 = (uint64_t *)&a2[v23];
  unint64_t v26 = *(void *)&a2[v23 + 8];
  if (*(void *)&a1[v23 + 8] >> 60 != 15)
  {
    if (v26 >> 60 == 15)
    {
      sub_245113FB4(v24);
      uint64_t v28 = v25[2];
      *(_OWORD *)uint64_t v24 = *(_OWORD *)v25;
LABEL_15:
      *(void *)(v24 + 16) = v28;
      return a1;
    }
    uint64_t v30 = *v25;
    sub_2450FF9B4(*v25, v26);
    uint64_t v31 = *(void *)v24;
    unint64_t v32 = *(void *)(v24 + 8);
    *(void *)uint64_t v24 = v30;
    *(void *)(v24 + 8) = v26;
    sub_245100544(v31, v32);
LABEL_14:
    uint64_t v28 = v25[2];
    goto LABEL_15;
  }
  if (v26 >> 60 != 15)
  {
    uint64_t v29 = *v25;
    sub_2450FF9B4(*v25, v26);
    *(void *)uint64_t v24 = v29;
    *(void *)(v24 + 8) = v26;
    goto LABEL_14;
  }
  long long v27 = *(_OWORD *)v25;
  *(void *)(v24 + 16) = v25[2];
  *(_OWORD *)uint64_t v24 = v27;
  return a1;
}

uint64_t sub_245113FB4(uint64_t a1)
{
  return a1;
}

char *sub_245113FE4(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_2451326F8();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268EC3990);
    memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(a1, a2, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  uint64_t v9 = a3[5];
  uint64_t v10 = a3[6];
  uint64_t v11 = &a1[v9];
  uint64_t v12 = &a2[v9];
  *(void *)uint64_t v11 = *(void *)v12;
  v11[8] = v12[8];
  uint64_t v13 = &a1[v10];
  uint64_t v14 = &a2[v10];
  *(void *)uint64_t v13 = *(void *)v14;
  v13[8] = v14[8];
  uint64_t v15 = a3[8];
  *(_OWORD *)&a1[a3[7]] = *(_OWORD *)&a2[a3[7]];
  uint64_t v16 = &a1[v15];
  uint64_t v17 = &a2[v15];
  *(_OWORD *)uint64_t v16 = *(_OWORD *)v17;
  *((void *)v16 + 2) = *((void *)v17 + 2);
  return a1;
}

char *sub_245114158(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_2451326F8();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (v9)
  {
    if (!v10)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 32))(a1, a2, v6);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v10)
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(a1, v6);
LABEL_6:
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_268EC3990);
    memcpy(a1, a2, *(void *)(*(void *)(v11 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 40))(a1, a2, v6);
LABEL_7:
  uint64_t v12 = a3[5];
  uint64_t v13 = a3[6];
  uint64_t v14 = &a1[v12];
  uint64_t v15 = &a2[v12];
  *(void *)uint64_t v14 = *(void *)v15;
  v14[8] = v15[8];
  uint64_t v16 = &a1[v13];
  uint64_t v17 = &a2[v13];
  *(void *)uint64_t v16 = *(void *)v17;
  v16[8] = v17[8];
  uint64_t v18 = a3[7];
  uint64_t v19 = &a1[v18];
  uint64_t v20 = &a2[v18];
  uint64_t v22 = *(void *)v20;
  uint64_t v21 = *((void *)v20 + 1);
  *(void *)uint64_t v19 = v22;
  *((void *)v19 + 1) = v21;
  swift_bridgeObjectRelease();
  uint64_t v23 = a3[8];
  uint64_t v24 = (uint64_t *)&a1[v23];
  uint64_t v25 = (uint64_t *)&a2[v23];
  unint64_t v26 = *(void *)&a1[v23 + 8];
  if (v26 >> 60 != 15)
  {
    unint64_t v27 = v25[1];
    if (v27 >> 60 != 15)
    {
      uint64_t v28 = *v24;
      *uint64_t v24 = *v25;
      v24[1] = v27;
      sub_245100544(v28, v26);
      goto LABEL_12;
    }
    sub_245113FB4((uint64_t)v24);
  }
  *(_OWORD *)uint64_t v24 = *(_OWORD *)v25;
LABEL_12:
  v24[2] = v25[2];
  return a1;
}

uint64_t sub_245114380(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_245114394);
}

uint64_t sub_245114394(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268EC3990);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 28) + 8);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    int v11 = v10 - 1;
    if (v11 < 0) {
      int v11 = -1;
    }
    return (v11 + 1);
  }
}

uint64_t sub_245114468(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24511447C);
}

uint64_t sub_24511447C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_268EC3990);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 28) + 8) = a2;
  }
  return result;
}

void sub_245114540()
{
  sub_2451145EC();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_2451145EC()
{
  if (!qword_268EC3DB8)
  {
    sub_2451326F8();
    unint64_t v0 = sub_2451329C8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268EC3DB8);
    }
  }
}

uint64_t _s14DeviceCriteriaO10FabricNodeVwxx(uint64_t a1)
{
  return sub_245100544(*(void *)a1, *(void *)(a1 + 8));
}

uint64_t *_s14DeviceCriteriaO10FabricNodeVwCP_0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  unint64_t v5 = a2[1];
  sub_2450FF9B4(*a2, v5);
  *a1 = v4;
  a1[1] = v5;
  a1[2] = a2[2];
  return a1;
}

uint64_t *_s14DeviceCriteriaO10FabricNodeVwca(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  unint64_t v5 = a2[1];
  sub_2450FF9B4(*a2, v5);
  uint64_t v6 = *a1;
  unint64_t v7 = a1[1];
  *a1 = v4;
  a1[1] = v5;
  sub_245100544(v6, v7);
  a1[2] = a2[2];
  return a1;
}

uint64_t *_s14DeviceCriteriaO10FabricNodeVwta(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = *a1;
  unint64_t v5 = a1[1];
  *(_OWORD *)a1 = *(_OWORD *)a2;
  sub_245100544(v4, v5);
  a1[2] = *(void *)(a2 + 16);
  return a1;
}

uint64_t _s14DeviceCriteriaO10FabricNodeVwet(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xD && *(unsigned char *)(a1 + 24)) {
    return (*(_DWORD *)a1 + 13);
  }
  unsigned int v3 = (((*(void *)(a1 + 8) >> 60) >> 2) & 0xFFFFFFF3 | (4 * ((*(void *)(a1 + 8) >> 60) & 3))) ^ 0xF;
  if (v3 >= 0xC) {
    unsigned int v3 = -1;
  }
  return v3 + 1;
}

uint64_t _s14DeviceCriteriaO10FabricNodeVwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xC)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)uint64_t result = a2 - 13;
    if (a3 >= 0xD) {
      *(unsigned char *)(result + 24) = 1;
    }
  }
  else
  {
    if (a3 >= 0xD) {
      *(unsigned char *)(result + 24) = 0;
    }
    if (a2)
    {
      *(void *)uint64_t result = 0;
      *(void *)(result + 8) = (unint64_t)(((-a2 >> 2) & 3) - 4 * a2) << 60;
    }
  }
  return result;
}

ValueMetadata *_s14DeviceCriteriaO10FabricNodeVMa()
{
  return &_s14DeviceCriteriaO10FabricNodeVN;
}

void static MatterAddDeviceExtensionRequestHandler.ThreadNetworkAssociation.defaultSystemNetwork.getter(uint64_t a1@<X8>)
{
  *(void *)a1 = 0;
  *(unsigned char *)(a1 + 8) = 1;
}

uint64_t static MatterAddDeviceExtensionRequestHandler.ThreadNetworkAssociation.network(extendedPANID:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

uint64_t sub_245114810(void *a1, uint64_t a2, int a3)
{
  int v21 = a3;
  uint64_t v18 = a2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268EC3E10);
  uint64_t v19 = *(void *)(v4 - 8);
  uint64_t v20 = v4;
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_268EC3E18);
  uint64_t v7 = *(void *)(v17 - 8);
  MEMORY[0x270FA5388](v17);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268EC3E20);
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_245115C10();
  sub_245132D88();
  if (v21)
  {
    char v22 = 0;
    sub_245115CB8();
    sub_245132BE8();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v17);
  }
  else
  {
    char v23 = 1;
    sub_245115C64();
    sub_245132BE8();
    uint64_t v14 = v20;
    sub_245132C68();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v6, v14);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v10);
}

uint64_t sub_245114AF8(uint64_t a1)
{
  unint64_t v2 = sub_245115C10();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_245114B34(uint64_t a1)
{
  unint64_t v2 = sub_245115C10();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_245114B70(uint64_t a1)
{
  unint64_t v2 = sub_245115CB8();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_245114BAC(uint64_t a1)
{
  unint64_t v2 = sub_245115CB8();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_245114BEC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_2451156A4(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_245114C18(uint64_t a1)
{
  unint64_t v2 = sub_245115C64();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_245114C54(uint64_t a1)
{
  unint64_t v2 = sub_245115C64();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_245114C90()
{
  int v1 = *(unsigned __int8 *)(v0 + 8);
  sub_245132CD8();
  sub_245132CE8();
  if (v1 != 1) {
    sub_245132D18();
  }
  return sub_245132D28();
}

uint64_t sub_245114D00()
{
  if (*(unsigned char *)(v0 + 8) == 1) {
    return sub_245132CE8();
  }
  sub_245132CE8();
  return sub_245132D18();
}

uint64_t sub_245114D50()
{
  int v1 = *(unsigned __int8 *)(v0 + 8);
  sub_245132CD8();
  sub_245132CE8();
  if (v1 != 1) {
    sub_245132D18();
  }
  return sub_245132D28();
}

uint64_t sub_245114DBC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_245115768(a1);
  if (!v2)
  {
    *(void *)a2 = result;
    *(unsigned char *)(a2 + 8) = v5 & 1;
  }
  return result;
}

uint64_t sub_245114DF0(void *a1)
{
  return sub_245114810(a1, *(void *)v1, *(unsigned __int8 *)(v1 + 8));
}

BOOL sub_245114E10(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(a1 + 8) == 1) {
    return (*(unsigned char *)(a2 + 8) & 1) != 0;
  }
  if (*(unsigned char *)(a2 + 8)) {
    return 0;
  }
  return *(void *)a1 == *(void *)a2;
}

uint64_t MatterAddDeviceExtensionRequestHandler.ThreadNetworkAssociation.hash(into:)()
{
  if (*(unsigned char *)(v0 + 8) == 1) {
    return sub_245132CE8();
  }
  sub_245132CE8();
  return sub_245132D18();
}

uint64_t static MatterAddDeviceExtensionRequestHandler.ThreadNetworkAssociation.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  int v2 = *(unsigned __int8 *)(a2 + 8);
  if (*(unsigned char *)(a1 + 8) == 1)
  {
    if (v2) {
      return 1;
    }
  }
  else
  {
    if (*(void *)a1 != *(void *)a2) {
      int v2 = 1;
    }
    if (v2 != 1) {
      return 1;
    }
  }
  return 0;
}

uint64_t sub_245114ED8(uint64_t a1)
{
  unint64_t v2 = sub_2451150A4();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_245114F14(uint64_t a1)
{
  unint64_t v2 = sub_2451150A4();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t MatterAddDeviceExtensionRequestHandler.ThreadNetworkAssociation.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268EC3DC0);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *v1;
  char v8 = *((unsigned char *)v1 + 8);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2451150A4();
  sub_245132D88();
  uint64_t v10 = v7;
  char v11 = v8;
  sub_2451150F8();
  sub_245132C28();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_2451150A4()
{
  unint64_t result = qword_268EC3DC8;
  if (!qword_268EC3DC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268EC3DC8);
  }
  return result;
}

unint64_t sub_2451150F8()
{
  unint64_t result = qword_268EC3DD0;
  if (!qword_268EC3DD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268EC3DD0);
  }
  return result;
}

uint64_t MatterAddDeviceExtensionRequestHandler.ThreadNetworkAssociation.hashValue.getter()
{
  int v1 = *(unsigned __int8 *)(v0 + 8);
  sub_245132CD8();
  sub_245132CE8();
  if (v1 != 1) {
    sub_245132D18();
  }
  return sub_245132D28();
}

uint64_t MatterAddDeviceExtensionRequestHandler.ThreadNetworkAssociation.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268EC3DD8);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  char v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2451150A4();
  sub_245132D78();
  if (!v2)
  {
    sub_245115330();
    sub_245132B88();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    char v9 = v12;
    *(void *)a2 = v11;
    *(unsigned char *)(a2 + 8) = v9;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

unint64_t sub_245115330()
{
  unint64_t result = qword_268EC3DE0;
  if (!qword_268EC3DE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268EC3DE0);
  }
  return result;
}

unint64_t sub_245115388()
{
  unint64_t result = qword_268EC3DE8;
  if (!qword_268EC3DE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268EC3DE8);
  }
  return result;
}

uint64_t sub_2451153DC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return MatterAddDeviceExtensionRequestHandler.ThreadNetworkAssociation.init(from:)(a1, a2);
}

uint64_t sub_2451153F4(void *a1)
{
  return MatterAddDeviceExtensionRequestHandler.ThreadNetworkAssociation.encode(to:)(a1);
}

uint64_t sub_24511540C(uint64_t a1, uint64_t a2)
{
  char v2 = *(unsigned char *)(a2 + 8);
  if (*(unsigned char *)(a1 + 8) == 1)
  {
    if ((*(unsigned char *)(a2 + 8) & 1) == 0) {
      return 0;
    }
  }
  else
  {
    if (*(void *)a1 != *(void *)a2) {
      char v2 = 1;
    }
    if (v2) {
      return 0;
    }
  }
  return 1;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(unsigned char *)(result + 8) = *((unsigned char *)a2 + 8);
  *(void *)unint64_t result = v2;
  return result;
}

uint64_t _s24ThreadNetworkAssociationV18AssociationDetailsOwet(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 9)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t _s24ThreadNetworkAssociationVwst(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(unsigned char *)(result + 8) = 0;
    *(void *)unint64_t result = (a2 - 1);
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
  *(unsigned char *)(result + 9) = v3;
  return result;
}

ValueMetadata *type metadata accessor for MatterAddDeviceExtensionRequestHandler.ThreadNetworkAssociation()
{
  return &type metadata for MatterAddDeviceExtensionRequestHandler.ThreadNetworkAssociation;
}

uint64_t _s24ThreadNetworkAssociationV18AssociationDetailsOwst(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)unint64_t result = 0;
    *(unsigned char *)(result + 8) = 0;
    *(_DWORD *)unint64_t result = a2 - 1;
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
  *(unsigned char *)(result + 9) = v3;
  return result;
}

uint64_t sub_2451154E4(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 8)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_245115500(uint64_t result, int a2)
{
  if (a2)
  {
    *(void *)unint64_t result = (a2 - 1);
    *(unsigned char *)(result + 8) = 1;
  }
  else
  {
    *(unsigned char *)(result + 8) = 0;
  }
  return result;
}

ValueMetadata *_s24ThreadNetworkAssociationV18AssociationDetailsOMa()
{
  return &_s24ThreadNetworkAssociationV18AssociationDetailsON;
}

ValueMetadata *_s24ThreadNetworkAssociationV10CodingKeysOMa()
{
  return &_s24ThreadNetworkAssociationV10CodingKeysON;
}

unint64_t sub_245115548()
{
  unint64_t result = qword_268EC3DF0;
  if (!qword_268EC3DF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268EC3DF0);
  }
  return result;
}

unint64_t sub_2451155A0()
{
  unint64_t result = qword_268EC3DF8;
  if (!qword_268EC3DF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268EC3DF8);
  }
  return result;
}

unint64_t sub_2451155F8()
{
  unint64_t result = qword_268EC3E00;
  if (!qword_268EC3E00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268EC3E00);
  }
  return result;
}

unint64_t sub_245115650()
{
  unint64_t result = qword_268EC3E08;
  if (!qword_268EC3E08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268EC3E08);
  }
  return result;
}

uint64_t sub_2451156A4(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x6465646E65747865 && a2 == 0xED000044494E4150)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_245132C98();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_245115744()
{
  return 0x6465646E65747865;
}

uint64_t sub_245115768(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268EC3E40);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v23 = v2;
  uint64_t v24 = v3;
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268EC3E48);
  uint64_t v26 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  char v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268EC3E50);
  uint64_t v25 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = (uint64_t)__swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_245115C10();
  uint64_t v13 = v27;
  sub_245132D78();
  if (v13) {
    goto LABEL_6;
  }
  uint64_t v14 = v26;
  uint64_t v22 = v6;
  unint64_t v27 = a1;
  uint64_t v15 = sub_245132BD8();
  if (*(void *)(v15 + 16) != 1)
  {
    uint64_t v17 = sub_245132A58();
    swift_allocError();
    uint64_t v19 = v18;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268EC37B0);
    *uint64_t v19 = &_s24ThreadNetworkAssociationV18AssociationDetailsON;
    uint64_t v12 = (uint64_t)v11;
    sub_245132B38();
    sub_245132A48();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v17 - 8) + 104))(v19, *MEMORY[0x263F8DCB0], v17);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v25 + 8))(v11, v9);
    a1 = v27;
LABEL_6:
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    return v12;
  }
  uint64_t v16 = (uint64_t)v27;
  int v28 = *(unsigned __int8 *)(v15 + 32);
  if (v28)
  {
    char v30 = 1;
    sub_245115C64();
    sub_245132B28();
    uint64_t v21 = v23;
    uint64_t v12 = sub_245132BC8();
    (*(void (**)(char *, uint64_t))(v24 + 8))(v5, v21);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v25 + 8))(v11, v9);
    uint64_t v16 = (uint64_t)v27;
  }
  else
  {
    char v29 = 0;
    sub_245115CB8();
    sub_245132B28();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v8, v22);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v25 + 8))(v11, v9);
    uint64_t v12 = 0;
  }
  __swift_destroy_boxed_opaque_existential_1(v16);
  return v12;
}

unint64_t sub_245115C10()
{
  unint64_t result = qword_268EC3E28;
  if (!qword_268EC3E28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268EC3E28);
  }
  return result;
}

unint64_t sub_245115C64()
{
  unint64_t result = qword_268EC3E30;
  if (!qword_268EC3E30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268EC3E30);
  }
  return result;
}

unint64_t sub_245115CB8()
{
  unint64_t result = qword_268EC3E38;
  if (!qword_268EC3E38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268EC3E38);
  }
  return result;
}

unsigned char *_s24ThreadNetworkAssociationV18AssociationDetailsO10CodingKeysOwst(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x245115DD8);
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

ValueMetadata *_s24ThreadNetworkAssociationV18AssociationDetailsO10CodingKeysOMa()
{
  return &_s24ThreadNetworkAssociationV18AssociationDetailsO10CodingKeysON;
}

ValueMetadata *_s24ThreadNetworkAssociationV18AssociationDetailsO30DefaultSystemNetworkCodingKeysOMa()
{
  return &_s24ThreadNetworkAssociationV18AssociationDetailsO30DefaultSystemNetworkCodingKeysON;
}

unsigned char *_s24ThreadNetworkAssociationV10CodingKeysOwst_0(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x245115EBCLL);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *_s24ThreadNetworkAssociationV18AssociationDetailsO17NetworkCodingKeysOMa()
{
  return &_s24ThreadNetworkAssociationV18AssociationDetailsO17NetworkCodingKeysON;
}

unint64_t sub_245115EF8()
{
  unint64_t result = qword_268EC3E58;
  if (!qword_268EC3E58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268EC3E58);
  }
  return result;
}

unint64_t sub_245115F50()
{
  unint64_t result = qword_268EC3E60;
  if (!qword_268EC3E60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268EC3E60);
  }
  return result;
}

unint64_t sub_245115FA8()
{
  unint64_t result = qword_268EC3E68;
  if (!qword_268EC3E68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268EC3E68);
  }
  return result;
}

unint64_t sub_245116000()
{
  unint64_t result = qword_268EC3E70;
  if (!qword_268EC3E70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268EC3E70);
  }
  return result;
}

unint64_t sub_245116058()
{
  unint64_t result = qword_268EC3E78;
  if (!qword_268EC3E78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268EC3E78);
  }
  return result;
}

unint64_t sub_2451160B0()
{
  unint64_t result = qword_268EC3E80;
  if (!qword_268EC3E80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268EC3E80);
  }
  return result;
}

unint64_t sub_245116108()
{
  unint64_t result = qword_268EC3E88;
  if (!qword_268EC3E88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268EC3E88);
  }
  return result;
}

unint64_t sub_245116160()
{
  unint64_t result = qword_268EC3E90;
  if (!qword_268EC3E90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268EC3E90);
  }
  return result;
}

uint64_t sub_2451161B4(char a1, char a2)
{
  if (*(void *)&aSsid_4[8 * a1] == *(void *)&aSsid_4[8 * a2] && qword_245137330[a1] == qword_245137330[a2]) {
    char v3 = 1;
  }
  else {
    char v3 = sub_245132C98();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_24511623C(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xD000000000000012;
  unint64_t v3 = 0x80000002451377F0;
  uint64_t v4 = a1;
  unint64_t v5 = 0xD000000000000012;
  switch(v4)
  {
    case 1:
      unint64_t v5 = 0x7961507075746573;
      unint64_t v3 = 0xEC00000064616F6CLL;
      break;
    case 2:
      break;
    case 3:
      unint64_t v3 = 0x8000000245137810;
      break;
    default:
      unint64_t v3 = 0xE800000000000000;
      unint64_t v5 = 0x79676F6C6F706F74;
      break;
  }
  unint64_t v6 = 0x80000002451377F0;
  switch(a2)
  {
    case 1:
      unint64_t v2 = 0x7961507075746573;
      unint64_t v6 = 0xEC00000064616F6CLL;
      goto LABEL_9;
    case 2:
LABEL_9:
      if (v5 != v2) {
        goto LABEL_14;
      }
      goto LABEL_12;
    case 3:
      unint64_t v6 = 0x8000000245137810;
      if (v5 == 0xD000000000000012) {
        goto LABEL_12;
      }
      goto LABEL_14;
    default:
      unint64_t v6 = 0xE800000000000000;
      if (v5 != 0x79676F6C6F706F74) {
        goto LABEL_14;
      }
LABEL_12:
      if (v3 == v6) {
        char v7 = 1;
      }
      else {
LABEL_14:
      }
        char v7 = sub_245132C98();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

uint64_t sub_2451163D0()
{
  return sub_245132D28();
}

uint64_t sub_2451164C0()
{
  return sub_245132D28();
}

uint64_t sub_24511652C()
{
  sub_245132858();

  return swift_bridgeObjectRelease();
}

uint64_t sub_245116580()
{
  sub_245132858();

  return swift_bridgeObjectRelease();
}

uint64_t sub_245116650()
{
  return sub_245132D28();
}

uint64_t sub_24511673C()
{
  return sub_245132D28();
}

uint64_t MatterAddDeviceExtensionRequestHandler.WiFiScanResult.ssid.getter()
{
  uint64_t v1 = *(void *)v0;
  sub_2450FF9B4(*(void *)v0, *(void *)(v0 + 8));
  return v1;
}

uint64_t MatterAddDeviceExtensionRequestHandler.WiFiScanResult.ssid.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_245100544(*(void *)v2, *(void *)(v2 + 8));
  *(void *)uint64_t v2 = a1;
  *(void *)(v2 + 8) = a2;
  return result;
}

uint64_t (*MatterAddDeviceExtensionRequestHandler.WiFiScanResult.ssid.modify())()
{
  return nullsub_1;
}

uint64_t MatterAddDeviceExtensionRequestHandler.WiFiScanResult.rssi.getter()
{
  return *(unsigned __int8 *)(v0 + 16);
}

uint64_t MatterAddDeviceExtensionRequestHandler.WiFiScanResult.rssi.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 16) = result;
  return result;
}

uint64_t (*MatterAddDeviceExtensionRequestHandler.WiFiScanResult.rssi.modify())()
{
  return nullsub_1;
}

uint64_t MatterAddDeviceExtensionRequestHandler.WiFiScanResult.security.getter()
{
  return *(unsigned __int8 *)(v0 + 17);
}

uint64_t MatterAddDeviceExtensionRequestHandler.WiFiScanResult.security.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 17) = result;
  return result;
}

uint64_t (*MatterAddDeviceExtensionRequestHandler.WiFiScanResult.security.modify())()
{
  return nullsub_1;
}

uint64_t MatterAddDeviceExtensionRequestHandler.WiFiScanResult.band.getter()
{
  return *(unsigned __int8 *)(v0 + 18);
}

uint64_t MatterAddDeviceExtensionRequestHandler.WiFiScanResult.band.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 18) = result;
  return result;
}

uint64_t (*MatterAddDeviceExtensionRequestHandler.WiFiScanResult.band.modify())()
{
  return nullsub_1;
}

uint64_t MatterAddDeviceExtensionRequestHandler.WiFiScanResult.init(ssid:rssi:security:band:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, char a3@<W2>, char a4@<W3>, char a5@<W4>, uint64_t a6@<X8>)
{
  *(void *)a6 = result;
  *(void *)(a6 + 8) = a2;
  *(unsigned char *)(a6 + 16) = a3;
  *(unsigned char *)(a6 + 17) = a4;
  *(unsigned char *)(a6 + 18) = a5;
  return result;
}

uint64_t MatterAddDeviceExtensionRequestHandler.WiFiScanResult.hash(into:)()
{
  uint64_t v1 = *v0;
  unint64_t v2 = v0[1];
  sub_2450FF9B4(*v0, v2);
  sub_2451326C8();
  sub_245100544(v1, v2);
  sub_245132CF8();
  sub_245132CF8();
  return sub_245132CF8();
}

uint64_t MatterAddDeviceExtensionRequestHandler.WiFiScanResult.hashValue.getter()
{
  uint64_t v1 = *v0;
  unint64_t v2 = v0[1];
  sub_245132CD8();
  sub_2450FF9B4(v1, v2);
  sub_2451326C8();
  sub_245100544(v1, v2);
  sub_245132CF8();
  sub_245132CF8();
  sub_245132CF8();
  return sub_245132D28();
}

uint64_t sub_245116A08(char a1)
{
  return *(void *)&aSsid_4[8 * a1];
}

uint64_t sub_245116A28()
{
  uint64_t v1 = *v0;
  unint64_t v2 = v0[1];
  sub_245132CD8();
  sub_2450FF9B4(v1, v2);
  sub_2451326C8();
  sub_245100544(v1, v2);
  sub_245132CF8();
  sub_245132CF8();
  sub_245132CF8();
  return sub_245132D28();
}

uint64_t sub_245116ACC()
{
  uint64_t v1 = *v0;
  unint64_t v2 = v0[1];
  sub_2450FF9B4(*v0, v2);
  sub_2451326C8();
  sub_245100544(v1, v2);
  sub_245132CF8();
  sub_245132CF8();
  return sub_245132CF8();
}

uint64_t sub_245116B58()
{
  uint64_t v1 = *v0;
  unint64_t v2 = v0[1];
  sub_245132CD8();
  sub_2450FF9B4(v1, v2);
  sub_2451326C8();
  sub_245100544(v1, v2);
  sub_245132CF8();
  sub_245132CF8();
  sub_245132CF8();
  return sub_245132D28();
}

uint64_t sub_245116BFC(char *a1, char *a2)
{
  return sub_2451161B4(*a1, *a2);
}

uint64_t sub_245116C08()
{
  return sub_2451164C0();
}

uint64_t sub_245116C10()
{
  return sub_24511652C();
}

uint64_t sub_245116C18()
{
  return sub_24511673C();
}

uint64_t sub_245116C20@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_2451177AC();
  *a1 = result;
  return result;
}

uint64_t sub_245116C50@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_245116A08(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_245116C7C()
{
  return sub_245116A08(*v0);
}

uint64_t sub_245116C84@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_2451177AC();
  *a1 = result;
  return result;
}

uint64_t sub_245116CAC(uint64_t a1)
{
  unint64_t v2 = sub_245117320();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_245116CE8(uint64_t a1)
{
  unint64_t v2 = sub_245117320();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t MatterAddDeviceExtensionRequestHandler.WiFiScanResult.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268EC3E98);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  char v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_245117320();
  sub_245132D78();
  if (!v2)
  {
    char v18 = 0;
    sub_2451024BC();
    sub_245132B88();
    uint64_t v10 = v15;
    uint64_t v9 = v16;
    LOBYTE(v15) = 1;
    int v17 = sub_245132B98();
    LOBYTE(v15) = 2;
    int v14 = sub_245132BA8();
    LOBYTE(v15) = 3;
    char v12 = sub_245132BA8();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *(void *)a2 = v10;
    *(void *)(a2 + 8) = v9;
    *(unsigned char *)(a2 + 16) = v17;
    *(unsigned char *)(a2 + 17) = v14;
    *(unsigned char *)(a2 + 18) = v12;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t MatterAddDeviceExtensionRequestHandler.WiFiScanResult.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268EC3EA8);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *v1;
  uint64_t v7 = v1[1];
  int v16 = *((unsigned __int8 *)v1 + 16);
  int v9 = *((unsigned __int8 *)v1 + 17);
  v12[0] = *((unsigned __int8 *)v1 + 18);
  v12[1] = v9;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_245117320();
  sub_245132D88();
  uint64_t v14 = v8;
  uint64_t v15 = v7;
  char v17 = 0;
  sub_245102414();
  uint64_t v10 = v13;
  sub_245132C28();
  if (!v10)
  {
    LOBYTE(v14) = 1;
    sub_245132C38();
    LOBYTE(v14) = 2;
    sub_245132C48();
    LOBYTE(v14) = 3;
    sub_245132C48();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_24511714C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return MatterAddDeviceExtensionRequestHandler.WiFiScanResult.init(from:)(a1, a2);
}

uint64_t sub_245117164(void *a1)
{
  return MatterAddDeviceExtensionRequestHandler.WiFiScanResult.encode(to:)(a1);
}

BOOL _s13MatterSupport0A32AddDeviceExtensionRequestHandlerC14WiFiScanResultV2eeoiySbAE_AEtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)a1;
  unint64_t v3 = *(void *)(a1 + 8);
  int v4 = *(unsigned __int8 *)(a1 + 16);
  int v5 = *(unsigned __int8 *)(a1 + 17);
  int v6 = *(unsigned __int8 *)(a1 + 18);
  uint64_t v7 = *(void *)a2;
  unint64_t v8 = *(void *)(a2 + 8);
  int v9 = *(unsigned __int8 *)(a2 + 16);
  int v10 = *(unsigned __int8 *)(a2 + 17);
  int v11 = *(unsigned __int8 *)(a2 + 18);
  uint64_t v12 = 0;
  switch(v3 >> 62)
  {
    case 1uLL:
      LODWORD(v12) = HIDWORD(v2) - v2;
      if (__OFSUB__(HIDWORD(v2), v2))
      {
        __break(1u);
LABEL_26:
        __break(1u);
LABEL_27:
        __break(1u);
LABEL_28:
        __break(1u);
        JUMPOUT(0x245117300);
      }
      uint64_t v12 = (int)v12;
      break;
    case 2uLL:
      uint64_t v14 = *(void *)(v2 + 16);
      uint64_t v13 = *(void *)(v2 + 24);
      BOOL v15 = __OFSUB__(v13, v14);
      uint64_t v12 = v13 - v14;
      if (!v15) {
        break;
      }
      goto LABEL_26;
    case 3uLL:
      break;
    default:
      uint64_t v12 = BYTE6(v3);
      break;
  }
  switch(v8 >> 62)
  {
    case 1uLL:
      LODWORD(v16) = HIDWORD(v7) - v7;
      if (__OFSUB__(HIDWORD(v7), v7)) {
        goto LABEL_27;
      }
      uint64_t v16 = (int)v16;
LABEL_11:
      if (v12 != v16) {
        return 0;
      }
      if (v12 < 1)
      {
LABEL_18:
        if (v4 != v9 || v5 != v10) {
          return 0;
        }
        return v6 == v11;
      }
      sub_2450FF9B4(*(void *)a2, *(void *)(a2 + 8));
      char v19 = sub_245110C24(v2, v3, v7, v8);
      BOOL result = 0;
      if ((v19 & 1) != 0 && v4 == v9 && v5 == v10) {
        return v6 == v11;
      }
      return result;
    case 2uLL:
      uint64_t v18 = *(void *)(v7 + 16);
      uint64_t v17 = *(void *)(v7 + 24);
      BOOL v15 = __OFSUB__(v17, v18);
      uint64_t v16 = v17 - v18;
      if (!v15) {
        goto LABEL_11;
      }
      goto LABEL_28;
    case 3uLL:
      if (!v12) {
        goto LABEL_18;
      }
      return 0;
    default:
      uint64_t v16 = BYTE6(v8);
      goto LABEL_11;
  }
}

unint64_t sub_245117320()
{
  unint64_t result = qword_268EC3EA0;
  if (!qword_268EC3EA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268EC3EA0);
  }
  return result;
}

unint64_t sub_245117378()
{
  unint64_t result = qword_268EC3EB0;
  if (!qword_268EC3EB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268EC3EB0);
  }
  return result;
}

uint64_t sub_2451173D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  unint64_t v5 = *(void *)(a2 + 8);
  sub_2450FF9B4(*(void *)a2, v5);
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(_WORD *)(a1 + 17) = *(_WORD *)(a2 + 17);
  return a1;
}

uint64_t _s14WiFiScanResultVwca(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  unint64_t v5 = *(void *)(a2 + 8);
  sub_2450FF9B4(*(void *)a2, v5);
  uint64_t v6 = *(void *)a1;
  unint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  sub_245100544(v6, v7);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(unsigned char *)(a1 + 17) = *(unsigned char *)(a2 + 17);
  *(unsigned char *)(a1 + 18) = *(unsigned char *)(a2 + 18);
  return a1;
}

__n128 __swift_memcpy19_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  *(_DWORD *)(a1 + 15) = *(_DWORD *)(a2 + 15);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t _s14WiFiScanResultVwta(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a1;
  unint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  sub_245100544(v4, v5);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(_WORD *)(a1 + 17) = *(_WORD *)(a2 + 17);
  return a1;
}

uint64_t _s14WiFiScanResultVwet(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xD && *(unsigned char *)(a1 + 19)) {
    return (*(_DWORD *)a1 + 13);
  }
  unsigned int v3 = (((*(void *)(a1 + 8) >> 60) >> 2) & 0xFFFFFFF3 | (4 * ((*(void *)(a1 + 8) >> 60) & 3))) ^ 0xF;
  if (v3 >= 0xC) {
    unsigned int v3 = -1;
  }
  return v3 + 1;
}

uint64_t _s14WiFiScanResultVwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xC)
  {
    *(unsigned char *)(result + 18) = 0;
    *(_WORD *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 13;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xD) {
      *(unsigned char *)(result + 19) = 1;
    }
  }
  else
  {
    if (a3 >= 0xD) {
      *(unsigned char *)(result + 19) = 0;
    }
    if (a2)
    {
      *(void *)__n128 result = 0;
      *(void *)(result + 8) = (unint64_t)(((-a2 >> 2) & 3) - 4 * a2) << 60;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MatterAddDeviceExtensionRequestHandler.WiFiScanResult()
{
  return &type metadata for MatterAddDeviceExtensionRequestHandler.WiFiScanResult;
}

unsigned char *_s14WiFiScanResultV10CodingKeysOwst(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24511766CLL);
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

ValueMetadata *_s14WiFiScanResultV10CodingKeysOMa()
{
  return &_s14WiFiScanResultV10CodingKeysON;
}

unint64_t sub_2451176A8()
{
  unint64_t result = qword_268EC3EB8;
  if (!qword_268EC3EB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268EC3EB8);
  }
  return result;
}

unint64_t sub_245117700()
{
  unint64_t result = qword_268EC3EC0;
  if (!qword_268EC3EC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268EC3EC0);
  }
  return result;
}

unint64_t sub_245117758()
{
  unint64_t result = qword_268EC3EC8;
  if (!qword_268EC3EC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268EC3EC8);
  }
  return result;
}

uint64_t sub_2451177AC()
{
  unint64_t v0 = sub_245132B18();
  swift_bridgeObjectRelease();
  if (v0 >= 4) {
    return 4;
  }
  else {
    return v0;
  }
}

uint64_t MatterAddDeviceRequest.Home.init(displayName:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  *a3 = result;
  a3[1] = a2;
  return result;
}

uint64_t MatterAddDeviceRequest.Home.displayName.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t MatterAddDeviceRequest.Home.displayName.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*MatterAddDeviceRequest.Home.displayName.modify())()
{
  return nullsub_1;
}

uint64_t MatterAddDeviceRequest.Home.hash(into:)()
{
  swift_bridgeObjectRetain();
  sub_245132858();

  return swift_bridgeObjectRelease();
}

uint64_t static MatterAddDeviceRequest.Home.== infix(_:_:)(void *a1, void *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1]) {
    return 1;
  }
  else {
    return sub_245132C98();
  }
}

uint64_t sub_245117910(uint64_t a1)
{
  unint64_t v2 = sub_245117AC0();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24511794C(uint64_t a1)
{
  unint64_t v2 = sub_245117AC0();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t MatterAddDeviceRequest.Home.encode(to:)(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268EC3ED0);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_245117AC0();
  sub_245132D88();
  sub_245132BF8();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

unint64_t sub_245117AC0()
{
  unint64_t result = qword_268EC3ED8;
  if (!qword_268EC3ED8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268EC3ED8);
  }
  return result;
}

uint64_t MatterAddDeviceRequest.Home.hashValue.getter()
{
  return sub_245132D28();
}

uint64_t MatterAddDeviceRequest.Home.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268EC3EE0);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  unint64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_245117AC0();
  sub_245132D78();
  if (!v2)
  {
    uint64_t v9 = sub_245132B58();
    uint64_t v11 = v10;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v9;
    a2[1] = v11;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_245117CD0()
{
  return sub_245132D28();
}

uint64_t sub_245117D1C()
{
  return sub_245132858();
}

uint64_t sub_245117D24()
{
  return sub_245132D28();
}

unint64_t sub_245117D70()
{
  unint64_t result = qword_268EC3EE8;
  if (!qword_268EC3EE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268EC3EE8);
  }
  return result;
}

uint64_t sub_245117DC4@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return MatterAddDeviceRequest.Home.init(from:)(a1, a2);
}

uint64_t sub_245117DDC(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268EC3ED0);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_245117AC0();
  sub_245132D88();
  sub_245132BF8();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

ValueMetadata *type metadata accessor for MatterAddDeviceRequest.Home()
{
  return &type metadata for MatterAddDeviceRequest.Home;
}

unsigned char *_s4HomeV10CodingKeysOwst(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x245117FC0);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *_s4HomeV10CodingKeysOMa()
{
  return &_s4HomeV10CodingKeysON;
}

unint64_t sub_245117FFC()
{
  unint64_t result = qword_268EC3EF0;
  if (!qword_268EC3EF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268EC3EF0);
  }
  return result;
}

unint64_t sub_245118054()
{
  unint64_t result = qword_268EC3EF8;
  if (!qword_268EC3EF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268EC3EF8);
  }
  return result;
}

unint64_t sub_2451180AC()
{
  unint64_t result = qword_268EC3F00;
  if (!qword_268EC3F00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268EC3F00);
  }
  return result;
}

uint64_t sub_245118100()
{
  return MEMORY[0x270FA2498](sub_24511811C, 0, 0);
}

uint64_t sub_24511811C()
{
  return sub_245132AE8();
}

uint64_t sub_2451181B8()
{
  return MEMORY[0x270FA2498](sub_2451181D4, 0, 0);
}

uint64_t sub_2451181D4()
{
  return sub_245132AE8();
}

uint64_t sub_245118270()
{
  return MEMORY[0x270FA2498](sub_24511828C, 0, 0);
}

uint64_t sub_24511828C()
{
  return sub_245132AE8();
}

uint64_t sub_245118328()
{
  return MEMORY[0x270FA2498](sub_245118344, 0, 0);
}

uint64_t sub_245118344()
{
  return sub_245132AE8();
}

uint64_t sub_2451183E0()
{
  return MEMORY[0x270FA2498](sub_2451183FC, 0, 0);
}

uint64_t sub_2451183FC()
{
  return sub_245132AE8();
}

uint64_t sub_245118498()
{
  return MEMORY[0x270FA2498](sub_2451184B4, 0, 0);
}

uint64_t sub_2451184B4()
{
  return sub_245132AE8();
}

id MatterAddDeviceExtensionRequestHandler.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

id MatterAddDeviceExtensionRequestHandler.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MatterAddDeviceExtensionRequestHandler();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for MatterAddDeviceExtensionRequestHandler()
{
  return self;
}

id MatterAddDeviceExtensionRequestHandler.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MatterAddDeviceExtensionRequestHandler();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for MatterAddDeviceExtensionRequestHandler(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for MatterAddDeviceExtensionRequestHandler);
}

uint64_t dispatch thunk of MatterAddDeviceExtensionRequestHandler.validateDeviceCredential(_:)(uint64_t a1)
{
  unsigned int v4 = *(int **)((*MEMORY[0x263F8EED0] & *v1) + 0x50);
  uint64_t v7 = (uint64_t (*)(uint64_t))((char *)v4 + *v4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_245109604;
  return v7(a1);
}

uint64_t dispatch thunk of MatterAddDeviceExtensionRequestHandler.selectWiFiNetwork(from:)(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *(int **)((*MEMORY[0x263F8EED0] & *v2) + 0x58);
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t))((char *)v6 + *v6);
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  void *v7 = v3;
  v7[1] = sub_245109604;
  return v9(a1, a2);
}

uint64_t dispatch thunk of MatterAddDeviceExtensionRequestHandler.selectThreadNetwork(from:)(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *(int **)((*MEMORY[0x263F8EED0] & *v2) + 0x60);
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t))((char *)v6 + *v6);
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  void *v7 = v3;
  v7[1] = sub_245109604;
  return v9(a1, a2);
}

uint64_t dispatch thunk of MatterAddDeviceExtensionRequestHandler.commissionDevice(in:onboardingPayload:commissioningID:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v10 = *(int **)((*MEMORY[0x263F8EED0] & *v4) + 0x68);
  uint64_t v13 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))((char *)v10 + *v10);
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v11;
  void *v11 = v5;
  v11[1] = sub_2451092CC;
  return v13(a1, a2, a3, a4);
}

uint64_t dispatch thunk of MatterAddDeviceExtensionRequestHandler.rooms(in:)(uint64_t a1)
{
  unsigned int v4 = *(int **)((*MEMORY[0x263F8EED0] & *v1) + 0x70);
  uint64_t v7 = (uint64_t (*)(uint64_t))((char *)v4 + *v4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_245118C04;
  return v7(a1);
}

uint64_t sub_245118C04(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t dispatch thunk of MatterAddDeviceExtensionRequestHandler.configureDevice(named:in:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v8 = *(int **)((*MEMORY[0x263F8EED0] & *v3) + 0x78);
  uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)v8 + *v8);
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *uint64_t v9 = v4;
  v9[1] = sub_2451092CC;
  return v11(a1, a2, a3);
}

uint64_t sub_245118E3C(uint64_t a1)
{
  uint64_t v2 = v1;
  ObjectType = (objc_class *)swift_getObjectType();
  sub_245104180(a1, (uint64_t)v10);
  type metadata accessor for MatterAddDeviceExtensionRequestHandler();
  uint64_t v5 = v2;
  if (swift_dynamicCast())
  {
    *(void *)&v5[OBJC_IVAR____TtC13MatterSupport41MatterAddDeviceExtensionConnectionHandler_extensionRequestHandler] = v9;

    v8.receiver = v5;
    v8.super_class = ObjectType;
    id v6 = objc_msgSendSuper2(&v8, sel_init);
    __swift_destroy_boxed_opaque_existential_1(a1);
    return (uint64_t)v6;
  }
  else
  {
    sub_245104180(a1, (uint64_t)v10);
    sub_245132A18();
    sub_245132868();
    __swift_project_boxed_opaque_existential_1(v10, v11);
    sub_245132C88();
    sub_245132868();
    __swift_project_boxed_opaque_existential_1(v10, v11);
    swift_getDynamicType();
    sub_245132DB8();
    sub_245132868();
    swift_bridgeObjectRelease();
    sub_245132868();
    uint64_t result = sub_245132AE8();
    __break(1u);
  }
  return result;
}

uint64_t sub_245119038(void *a1)
{
  uint64_t v2 = v1;
  if (qword_268EC36F0 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_245132738();
  __swift_project_value_buffer(v4, (uint64_t)qword_268ECA3C0);
  id v5 = a1;
  id v6 = sub_245132718();
  os_log_type_t v7 = sub_245132928();
  if (os_log_type_enabled(v6, v7))
  {
    objc_super v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v9 = (void *)swift_slowAlloc();
    *(_DWORD *)objc_super v8 = 138412290;
    id v10 = v5;
    sub_2451329D8();
    *uint64_t v9 = v5;

    _os_log_impl(&dword_2450FD000, v6, v7, "Accepting XPC connection: %@", v8, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268EC3A08);
    swift_arrayDestroy();
    MEMORY[0x245697ED0](v9, -1, -1);
    MEMORY[0x245697ED0](v8, -1, -1);
  }
  else
  {
  }
  id v11 = objc_msgSend(self, sel_mts_deviceSetupExtensionInterface);
  objc_msgSend(v5, sel_setExportedInterface_, v11);

  objc_msgSend(v5, sel_setExportedObject_, v2);
  objc_msgSend(v5, sel_activate);
  return 1;
}

uint64_t sub_24511928C(uint64_t a1)
{
  *(void *)(v2 + 56) = a1;
  *(void *)(v2 + 64) = v1;
  return MEMORY[0x270FA2498](sub_2451192AC, 0, 0);
}

uint64_t sub_2451192AC()
{
  uint64_t v40 = v0;
  if (qword_268EC36F0 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_245132738();
  __swift_project_value_buffer(v1, (uint64_t)qword_268ECA3C0);
  swift_bridgeObjectRetain_n();
  uint64_t v2 = sub_245132718();
  os_log_type_t v3 = sub_245132928();
  uint64_t v36 = v0 + 7;
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v5 = swift_slowAlloc();
    uint64_t v39 = v5;
    *(_DWORD *)uint64_t v4 = 136315138;
    uint64_t v6 = sub_245108D5C(0, &qword_268EC4188);
    uint64_t v7 = swift_bridgeObjectRetain();
    uint64_t v8 = MEMORY[0x245697130](v7, v6);
    unint64_t v10 = v9;
    swift_bridgeObjectRelease();
    v0[6] = sub_24511DDEC(v8, v10, &v39);
    sub_2451329D8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_2450FD000, v2, v3, "Selecting WiFi network from WiFi scan results: %s", v4, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x245697ED0](v5, -1, -1);
    MEMORY[0x245697ED0](v4, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  unint64_t v11 = v0[7];
  uint64_t v12 = *(void **)(v0[8]
                   + OBJC_IVAR____TtC13MatterSupport41MatterAddDeviceExtensionConnectionHandler_extensionRequestHandler);
  if (v11 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v13 = sub_245132AF8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v13 = *(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v14 = MEMORY[0x263F8EE78];
  if (v13)
  {
    uint64_t v39 = MEMORY[0x263F8EE78];
    uint64_t result = sub_24511E880(0, v13 & ~(v13 >> 63), 0);
    if (v13 < 0)
    {
      __break(1u);
      return result;
    }
    uint64_t v33 = v12;
    int v34 = v0;
    uint64_t v16 = 0;
    unint64_t v38 = v11 & 0xC000000000000001;
    uint64_t v35 = *v36 + 32;
    uint64_t v14 = v39;
    uint64_t v17 = v13;
    do
    {
      if (v38) {
        id v18 = (id)MEMORY[0x2456972C0](v16, *v36);
      }
      else {
        id v18 = *(id *)(v35 + 8 * v16);
      }
      char v19 = v18;
      id v20 = objc_msgSend(v18, sel_ssid);
      uint64_t v21 = sub_2451326B8();
      uint64_t v23 = v22;

      id v24 = objc_msgSend(v19, sel_rssi);
      char v25 = sub_245132CB8();

      unsigned __int8 v26 = objc_msgSend(v19, sel_security);
      unsigned __int8 v27 = objc_msgSend(v19, sel_band);

      uint64_t v39 = v14;
      unint64_t v29 = *(void *)(v14 + 16);
      unint64_t v28 = *(void *)(v14 + 24);
      if (v29 >= v28 >> 1)
      {
        sub_24511E880(v28 > 1, v29 + 1, 1);
        uint64_t v14 = v39;
      }
      ++v16;
      *(void *)(v14 + 16) = v29 + 1;
      uint64_t v30 = v14 + 24 * v29;
      *(void *)(v30 + 32) = v21;
      *(void *)(v30 + 40) = v23;
      *(unsigned char *)(v30 + 48) = v25;
      *(unsigned char *)(v30 + 49) = v26;
      *(unsigned char *)(v30 + 50) = v27;
    }
    while (v17 != v16);
    uint64_t v12 = v33;
    unint64_t v0 = v34;
  }
  v0[9] = v14;
  uint64_t v31 = *(int **)((*MEMORY[0x263F8EED0] & *v12) + 0x58);
  char v37 = (int *)((char *)v31 + *v31);
  unint64_t v32 = (void *)swift_task_alloc();
  v0[10] = v32;
  *unint64_t v32 = v0;
  v32[1] = sub_245119754;
  return ((uint64_t (*)(void *, uint64_t))v37)(v0 + 2, v14);
}

uint64_t sub_245119754()
{
  *(void *)(*(void *)v1 + 88) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_2451199AC;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v2 = sub_245119870;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_245119870()
{
  uint64_t v2 = v0[2];
  unint64_t v1 = v0[3];
  uint64_t v3 = v0[4];
  unint64_t v4 = v0[5];
  if (v1 >> 60 == 15)
  {
    sub_24510059C(v0[2], v0[3], v0[4], v0[5]);
    id v5 = 0;
  }
  else
  {
    id v6 = objc_allocWithZone((Class)MTSWiFiNetworkAssociation);
    sub_2451004F4(v2, v1, v3, v4);
    uint64_t v7 = (void *)sub_2451326A8();
    uint64_t v8 = (void *)sub_2451326A8();
    id v5 = objc_msgSend(v6, sel_initWithSSID_credentials_, v7, v8);
    sub_245100544(v2, v1);
    sub_245100544(v3, v4);

    sub_24510059C(v2, v1, v3, v4);
  }
  unint64_t v9 = (uint64_t (*)(id))v0[1];
  return v9(v5);
}

uint64_t sub_2451199AC()
{
  swift_bridgeObjectRelease();
  unint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_245119B8C(int a1, void *aBlock, void *a3)
{
  v3[2] = a3;
  v3[3] = _Block_copy(aBlock);
  sub_245108D5C(0, &qword_268EC4188);
  uint64_t v5 = sub_245132898();
  v3[4] = v5;
  id v6 = a3;
  uint64_t v7 = (void *)swift_task_alloc();
  v3[5] = v7;
  void *v7 = v3;
  v7[1] = sub_245119C8C;
  v7[7] = v5;
  v7[8] = v6;
  return MEMORY[0x270FA2498](sub_2451192AC, 0, 0);
}

uint64_t sub_245119C8C(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = *v2;
  id v6 = *(void **)(*v2 + 16);
  uint64_t v7 = *v2;
  swift_task_dealloc();

  swift_bridgeObjectRelease();
  uint64_t v8 = *(void (***)(void, void, void))(v5 + 24);
  if (v3)
  {
    uint64_t v9 = (void *)sub_245132688();

    ((void (**)(void, void, void *))v8)[2](v8, 0, v9);
    _Block_release(v8);
  }
  else
  {
    ((void (**)(void, void *, void))v8)[2](v8, a1, 0);
    _Block_release(v8);
  }
  unint64_t v10 = *(uint64_t (**)(void))(v7 + 8);
  return v10();
}

uint64_t sub_245119E48(uint64_t a1)
{
  *(void *)(v2 + 40) = a1;
  *(void *)(v2 + 48) = v1;
  return MEMORY[0x270FA2498](sub_245119E68, 0, 0);
}

uint64_t sub_245119E68()
{
  BOOL v55 = v0;
  if (qword_268EC36F0 != -1) {
    swift_once();
  }
  uint64_t v1 = v0 + 5;
  uint64_t v2 = sub_245132738();
  __swift_project_value_buffer(v2, (uint64_t)qword_268ECA3C0);
  swift_bridgeObjectRetain_n();
  uint64_t v3 = sub_245132718();
  os_log_type_t v4 = sub_245132928();
  uint64_t v46 = v0 + 5;
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 136315138;
    uint64_t v54 = v6;
    uint64_t v7 = sub_245108D5C(0, &qword_268EC4150);
    uint64_t v8 = swift_bridgeObjectRetain();
    uint64_t v9 = MEMORY[0x245697130](v8, v7);
    unint64_t v11 = v10;
    swift_bridgeObjectRelease();
    v0[4] = sub_24511DDEC(v9, v11, &v54);
    uint64_t v1 = v0 + 5;
    sub_2451329D8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_2450FD000, v3, v4, "Selecting Thread network from Thread scan results: %s", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x245697ED0](v6, -1, -1);
    MEMORY[0x245697ED0](v5, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  unint64_t v12 = v0[5];
  uint64_t v13 = *(void **)(v0[6]
                   + OBJC_IVAR____TtC13MatterSupport41MatterAddDeviceExtensionConnectionHandler_extensionRequestHandler);
  if (v12 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v14 = sub_245132AF8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v14 = *(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v15 = MEMORY[0x263F8EE78];
  if (v14)
  {
    uint64_t v54 = MEMORY[0x263F8EE78];
    uint64_t result = sub_24511E8A0(0, v14 & ~(v14 >> 63), 0);
    if (v14 < 0)
    {
      __break(1u);
      return result;
    }
    uint64_t v43 = v13;
    uint64_t v44 = v0;
    uint64_t v17 = v1;
    uint64_t v18 = 0;
    unint64_t v47 = v12 & 0xC000000000000001;
    uint64_t v48 = v14;
    uint64_t v45 = *v17 + 32;
    uint64_t v15 = v54;
    do
    {
      if (v47) {
        id v19 = (id)MEMORY[0x2456972C0](v18, *v46);
      }
      else {
        id v19 = *(id *)(v45 + 8 * v18);
      }
      id v20 = v19;
      id v21 = objc_msgSend(v19, sel_networkName, v43, v44);
      uint64_t v22 = sub_245132838();
      uint64_t v51 = v23;
      uint64_t v53 = v22;

      id v24 = objc_msgSend(v20, sel_panID);
      __int16 v50 = sub_245132D38();

      id v25 = objc_msgSend(v20, sel_extendedPANID);
      uint64_t v49 = sub_245132D48();

      id v26 = objc_msgSend(v20, sel_channel);
      __int16 v27 = sub_245132D38();

      id v28 = objc_msgSend(v20, sel_extendedAddress);
      uint64_t v29 = sub_2451326B8();
      uint64_t v31 = v30;

      id v32 = objc_msgSend(v20, sel_rssi);
      char v33 = sub_245132CB8();

      id v34 = objc_msgSend(v20, sel_version);
      char v35 = sub_245132CC8();

      id v36 = [v20 lqi];
      char v37 = sub_245132CC8();

      uint64_t v54 = v15;
      unint64_t v39 = *(void *)(v15 + 16);
      unint64_t v38 = *(void *)(v15 + 24);
      if (v39 >= v38 >> 1)
      {
        sub_24511E8A0(v38 > 1, v39 + 1, 1);
        uint64_t v15 = v54;
      }
      ++v18;
      *(void *)(v15 + 16) = v39 + 1;
      uint64_t v40 = v15 + (v39 << 6);
      *(void *)(v40 + 32) = v53;
      *(void *)(v40 + 40) = v51;
      *(_WORD *)(v40 + 48) = v50;
      *(void *)(v40 + 56) = v49;
      *(_WORD *)(v40 + 64) = v27;
      *(void *)(v40 + 72) = v29;
      *(void *)(v40 + 80) = v31;
      *(unsigned char *)(v40 + 88) = v33;
      *(unsigned char *)(v40 + 89) = v35;
      *(unsigned char *)(v40 + 90) = v37;
    }
    while (v48 != v18);
    uint64_t v13 = v43;
    uint64_t v0 = v44;
  }
  v0[7] = v15;
  uint64_t v41 = *(int **)((*MEMORY[0x263F8EED0] & *v13) + 0x60);
  uint64_t v52 = (int *)((char *)v41 + *v41);
  uint64_t v42 = (void *)swift_task_alloc();
  v0[8] = v42;
  void *v42 = v0;
  v42[1] = sub_24511A3E8;
  return ((uint64_t (*)(void *, uint64_t))v52)(v0 + 2, v15);
}

uint64_t sub_24511A3E8()
{
  *(void *)(*(void *)v1 + 72) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_24511A5B8;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v2 = sub_24511A504;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24511A504()
{
  if (*(unsigned char *)(v0 + 24))
  {
    id v1 = 0;
  }
  else
  {
    id v2 = objc_allocWithZone((Class)MTSThreadNetworkAssociation);
    uint64_t v3 = (void *)sub_245132D58();
    id v1 = objc_msgSend(v2, sel_initWithExtendedPANID_, v3);
  }
  uint64_t v4 = *(uint64_t (**)(id))(v0 + 8);
  return v4(v1);
}

uint64_t sub_24511A5B8()
{
  swift_bridgeObjectRelease();
  id v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24511A798(int a1, void *aBlock, void *a3)
{
  v3[2] = a3;
  v3[3] = _Block_copy(aBlock);
  sub_245108D5C(0, &qword_268EC4150);
  uint64_t v5 = sub_245132898();
  v3[4] = v5;
  id v6 = a3;
  uint64_t v7 = (void *)swift_task_alloc();
  v3[5] = v7;
  void *v7 = v3;
  v7[1] = sub_24511F098;
  v7[5] = v5;
  v7[6] = v6;
  return MEMORY[0x270FA2498](sub_245119E68, 0, 0);
}

uint64_t sub_24511A898(uint64_t a1)
{
  *(void *)(v2 + 72) = a1;
  *(void *)(v2 + 80) = v1;
  return MEMORY[0x270FA2498](sub_24511A8B8, 0, 0);
}

uint64_t sub_24511A8B8()
{
  if (qword_268EC36F0 != -1) {
    swift_once();
  }
  uint64_t v1 = *(void **)(v0 + 72);
  uint64_t v2 = sub_245132738();
  __swift_project_value_buffer(v2, (uint64_t)qword_268ECA3C0);
  id v3 = v1;
  uint64_t v4 = sub_245132718();
  os_log_type_t v5 = sub_245132928();
  BOOL v6 = os_log_type_enabled(v4, v5);
  uint64_t v7 = *(void **)(v0 + 72);
  if (v6)
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    id v28 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 138412290;
    *(void *)(v0 + 64) = v7;
    id v9 = v7;
    sub_2451329D8();
    *id v28 = v7;

    _os_log_impl(&dword_2450FD000, v4, v5, "Validating device credential: %@", v8, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268EC3A08);
    swift_arrayDestroy();
    MEMORY[0x245697ED0](v28, -1, -1);
    MEMORY[0x245697ED0](v8, -1, -1);
  }
  else
  {
  }
  unint64_t v10 = *(void **)(*(void *)(v0 + 80)
                   + OBJC_IVAR____TtC13MatterSupport41MatterAddDeviceExtensionConnectionHandler_extensionRequestHandler);
  id v11 = *(id *)(v0 + 72);
  id v12 = objc_msgSend(v11, sel_certificationDeclaration);
  uint64_t v13 = sub_2451326B8();
  uint64_t v15 = v14;

  *(void *)(v0 + 88) = v13;
  *(void *)(v0 + 96) = v15;
  id v16 = objc_msgSend(v11, sel_deviceAttestationCertificate);
  uint64_t v17 = sub_2451326B8();
  uint64_t v19 = v18;

  *(void *)(v0 + 104) = v17;
  *(void *)(v0 + 112) = v19;
  id v20 = objc_msgSend(v11, sel_productAttestationIntermediateCertificate);
  uint64_t v21 = sub_2451326B8();
  uint64_t v23 = v22;

  *(void *)(v0 + 120) = v21;
  *(void *)(v0 + 128) = v23;
  *(void *)(v0 + 16) = v13;
  *(void *)(v0 + 24) = v15;
  *(void *)(v0 + 32) = v17;
  *(void *)(v0 + 40) = v19;
  *(void *)(v0 + 48) = v21;
  *(void *)(v0 + 56) = v23;
  id v24 = *(int **)((*MEMORY[0x263F8EED0] & *v10) + 0x50);
  __int16 v27 = (uint64_t (*)(uint64_t))((char *)v24 + *v24);
  id v25 = (void *)swift_task_alloc();
  *(void *)(v0 + 136) = v25;
  *id v25 = v0;
  v25[1] = sub_24511ABF4;
  return v27(v0 + 16);
}

uint64_t sub_24511ABF4()
{
  unint64_t v2 = *(void *)(*v1 + 128);
  uint64_t v3 = *(void *)(*v1 + 120);
  unint64_t v4 = *(void *)(*v1 + 112);
  uint64_t v5 = *(void *)(*v1 + 104);
  unint64_t v6 = *(void *)(*v1 + 96);
  uint64_t v7 = *(void *)(*v1 + 88);
  uint64_t v8 = *v1;
  *(void *)(v8 + 144) = v0;
  swift_task_dealloc();
  sub_245100544(v7, v6);
  sub_245100544(v5, v4);
  sub_245100544(v3, v2);
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_24511ADE8, 0, 0);
  }
  else
  {
    id v9 = *(uint64_t (**)(void))(v8 + 8);
    return v9();
  }
}

uint64_t sub_24511ADE8()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_24511AF7C(void *a1, void *aBlock, void *a3)
{
  v3[2] = a1;
  v3[3] = a3;
  v3[4] = _Block_copy(aBlock);
  id v6 = a1;
  id v7 = a3;
  uint64_t v8 = (void *)swift_task_alloc();
  v3[5] = v8;
  *uint64_t v8 = v3;
  v8[1] = sub_24511B058;
  v8[9] = v6;
  v8[10] = v7;
  return MEMORY[0x270FA2498](sub_24511A8B8, 0, 0);
}

uint64_t sub_24511B058()
{
  unint64_t v2 = v0;
  uint64_t v4 = *v1;
  uint64_t v3 = *v1;
  uint64_t v5 = *(void **)(*v1 + 24);
  id v6 = *(void **)(*v1 + 16);
  uint64_t v7 = *v1;
  swift_task_dealloc();

  uint64_t v8 = *(void *)(v3 + 32);
  if (v2)
  {
    id v9 = (void *)sub_245132688();

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

uint64_t sub_24511B1F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[11] = a4;
  v5[12] = v4;
  v5[9] = a2;
  v5[10] = a3;
  v5[8] = a1;
  uint64_t v6 = sub_2451326F8();
  v5[13] = v6;
  v5[14] = *(void *)(v6 - 8);
  v5[15] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24511B2E8, 0, 0);
}

uint64_t sub_24511B2E8()
{
  uint64_t v46 = v0;
  v45[1] = *MEMORY[0x263EF8340];
  if (qword_268EC36F0 != -1) {
    swift_once();
  }
  uint64_t v1 = v0 + 8;
  unint64_t v2 = (void *)v0[8];
  uint64_t v4 = v0[14];
  uint64_t v3 = v0[15];
  uint64_t v5 = v0[13];
  uint64_t v6 = v0[11];
  uint64_t v7 = sub_245132738();
  __swift_project_value_buffer(v7, (uint64_t)qword_268ECA3C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v3, v6, v5);
  id v8 = v2;
  swift_bridgeObjectRetain_n();
  id v9 = v8;
  uint64_t v10 = sub_245132718();
  os_log_type_t v11 = sub_245132928();
  if (os_log_type_enabled(v10, v11))
  {
    os_log_type_t v41 = v11;
    uint64_t v12 = *v1;
    uint64_t v13 = swift_slowAlloc();
    uint64_t v14 = (void *)swift_slowAlloc();
    uint64_t v42 = swift_slowAlloc();
    v45[0] = v42;
    *(_DWORD *)uint64_t v13 = 138412802;
    log = v10;
    if (v12)
    {
      v0[7] = v9;
      id v15 = v9;
    }
    else
    {
      v0[4] = 0;
    }
    sub_2451329D8();
    id v24 = v9;
    uint64_t v26 = v0[14];
    uint64_t v25 = v0[15];
    uint64_t v27 = v0[13];
    uint64_t v29 = v0[9];
    unint64_t v28 = v0[10];
    void *v14 = v0[8];
    uint64_t v30 = v24;
    uint64_t v40 = v24;

    *(_WORD *)(v13 + 12) = 2080;
    swift_bridgeObjectRetain();
    v0[5] = sub_24511DDEC(v29, v28, v45);
    sub_2451329D8();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v13 + 22) = 2080;
    sub_24511E668();
    uint64_t v31 = sub_245132C78();
    v0[6] = sub_24511DDEC(v31, v32, v45);
    sub_2451329D8();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v25, v27);
    _os_log_impl(&dword_2450FD000, log, v41, "Pairing device in home: %@, onboarding payload: %s, uuid: %s", (uint8_t *)v13, 0x20u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268EC3A08);
    swift_arrayDestroy();
    MEMORY[0x245697ED0](v14, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x245697ED0](v42, -1, -1);
    MEMORY[0x245697ED0](v13, -1, -1);

    id v9 = v40;
    if (!*v1) {
      goto LABEL_10;
    }
LABEL_7:
    id v19 = v9;
    id v20 = objc_msgSend(v19, sel_name);
    uint64_t v21 = sub_245132838();
    uint64_t v23 = v22;

    goto LABEL_11;
  }
  uint64_t v17 = v0[14];
  uint64_t v16 = v0[15];
  uint64_t v18 = v0[13];

  swift_bridgeObjectRelease_n();
  (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v16, v18);

  if (*v1) {
    goto LABEL_7;
  }
LABEL_10:
  uint64_t v21 = 0;
  uint64_t v23 = 0;
LABEL_11:
  v0[16] = v23;
  char v33 = *(void **)(v0[12]
                   + OBJC_IVAR____TtC13MatterSupport41MatterAddDeviceExtensionConnectionHandler_extensionRequestHandler);
  v0[2] = v21;
  v0[3] = v23;
  id v34 = *(int **)((*MEMORY[0x263F8EED0] & *v33) + 0x68);
  os_log_t loga = (os_log_t)((char *)v34 + *v34);
  char v35 = (void *)swift_task_alloc();
  v0[17] = v35;
  void *v35 = v0;
  v35[1] = sub_24511B7B4;
  uint64_t v36 = v0[10];
  uint64_t v37 = v0[11];
  uint64_t v38 = v0[9];
  return ((uint64_t (*)(void *, uint64_t, uint64_t, uint64_t))loga)(v0 + 2, v38, v36, v37);
}

uint64_t sub_24511B7B4()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 144) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_24511B94C, 0, 0);
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_24511B94C()
{
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24511BB7C(void *a1, uint64_t a2, uint64_t a3, const void *a4, void *a5)
{
  v5[2] = a1;
  v5[3] = a5;
  uint64_t v9 = sub_2451326F8();
  v5[4] = v9;
  v5[5] = *(void *)(v9 - 8);
  uint64_t v10 = swift_task_alloc();
  v5[6] = v10;
  v5[7] = _Block_copy(a4);
  uint64_t v11 = sub_245132838();
  uint64_t v13 = v12;
  v5[8] = v12;
  sub_2451326E8();
  id v14 = a1;
  a5;
  id v15 = (void *)swift_task_alloc();
  v5[9] = v15;
  *id v15 = v5;
  v15[1] = sub_24511BCE0;
  return sub_24511B1F4((uint64_t)a1, v11, v13, v10);
}

uint64_t sub_24511BCE0()
{
  uint64_t v2 = v0;
  uint64_t v3 = *v1;
  uint64_t v4 = *v1;
  uint64_t v5 = *(void *)(*v1 + 48);
  uint64_t v6 = *(void *)(*v1 + 40);
  uint64_t v7 = *(void *)(*v1 + 32);
  id v8 = *(void **)(*v1 + 24);
  uint64_t v9 = *(void **)(*v1 + 16);
  uint64_t v10 = *v1;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);

  swift_bridgeObjectRelease();
  uint64_t v11 = *(void *)(v3 + 56);
  if (v2)
  {
    uint64_t v12 = (void *)sub_245132688();

    (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v12);
  }
  else
  {
    (*(void (**)(void, void))(v11 + 16))(*(void *)(v3 + 56), 0);
  }
  _Block_release(*(const void **)(v4 + 56));
  swift_task_dealloc();
  uint64_t v13 = *(uint64_t (**)(void))(v10 + 8);
  return v13();
}

uint64_t sub_24511BF0C(uint64_t a1)
{
  *(void *)(v2 + 112) = a1;
  *(void *)(v2 + 120) = v1;
  return MEMORY[0x270FA2498](sub_24511BF9C, 0, 0);
}

uint64_t sub_24511BF9C()
{
  if (qword_268EC36F0 != -1) {
    swift_once();
  }
  uint64_t v1 = (id *)(v0 + 11);
  uint64_t v3 = v0 + 14;
  uint64_t v2 = (void *)v0[14];
  uint64_t v4 = sub_245132738();
  __swift_project_value_buffer(v4, (uint64_t)qword_268ECA3C0);
  id v5 = v2;
  uint64_t v6 = sub_245132718();
  os_log_type_t v7 = sub_245132928();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v22 = *v3;
    id v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v9 = (void *)swift_slowAlloc();
    *(_DWORD *)id v8 = 138412290;
    if (v22)
    {
      v0[13] = v5;
      id v10 = v5;
    }
    else
    {
      v0[12] = 0;
    }
    sub_2451329D8();
    *uint64_t v9 = *v3;

    _os_log_impl(&dword_2450FD000, v6, v7, "Fetching rooms in home: %@", v8, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268EC3A08);
    swift_arrayDestroy();
    MEMORY[0x245697ED0](v9, -1, -1);
    MEMORY[0x245697ED0](v8, -1, -1);
    uint64_t v1 = (id *)(v0 + 11);
  }
  else
  {
  }
  uint64_t v11 = *(void **)(v0[15]
                 + OBJC_IVAR____TtC13MatterSupport41MatterAddDeviceExtensionConnectionHandler_extensionRequestHandler);
  v0[5] = type metadata accessor for MatterAddDeviceExtensionRequestHandler();
  v0[2] = v11;
  uint64_t v12 = v11;
  if (swift_dynamicCast())
  {
    uint64_t v13 = *v3;

    if (v13)
    {
      id v14 = v5;
      id v15 = objc_msgSend(v14, sel_name);
      uint64_t v16 = sub_245132838();
      uint64_t v18 = v17;
    }
    else
    {
      uint64_t v16 = 0;
      uint64_t v18 = 0;
    }
    v0[16] = v18;
    v0[6] = v16;
    v0[7] = v18;
    id v20 = *(int **)((*MEMORY[0x263F8EED0] & *v12) + 0x70);
    uint64_t v23 = (uint64_t (*)(void *))((char *)v20 + *v20);
    uint64_t v21 = (void *)swift_task_alloc();
    v0[17] = v21;
    *uint64_t v21 = v0;
    v21[1] = sub_24511C3F4;
    return v23(v0 + 6);
  }
  else
  {
    sub_245132A18();
    v0[8] = 0;
    v0[9] = 0xE000000000000000;
    sub_245132868();
    v0[10] = v12;
    sub_245132AC8();
    return sub_245132AE8();
  }
}

uint64_t sub_24511C3F4(uint64_t a1)
{
  *(void *)(*(void *)v1 + 144) = a1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA2498](sub_24511C540, 0, 0);
}

uint64_t sub_24511C540()
{
  uint64_t v1 = *(void *)(v0 + 144);
  uint64_t v2 = *(void *)(v1 + 16);
  if (v2)
  {
    uint64_t v9 = MEMORY[0x263F8EE78];
    sub_245132A98();
    uint64_t v3 = v1 + 40;
    do
    {
      id v4 = objc_allocWithZone((Class)MTSDeviceSetupRoom);
      swift_bridgeObjectRetain();
      id v5 = (void *)sub_245132828();
      swift_bridgeObjectRelease();
      objc_msgSend(v4, sel_initWithName_, v5);

      sub_245132A78();
      sub_245132AA8();
      sub_245132AB8();
      sub_245132A88();
      v3 += 16;
      --v2;
    }
    while (v2);
    uint64_t v6 = v9;
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v6 = MEMORY[0x263F8EE78];
  }
  os_log_type_t v7 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v7(v6);
}

uint64_t sub_24511C838(void *a1, void *aBlock, void *a3)
{
  v3[2] = a1;
  v3[3] = a3;
  v3[4] = _Block_copy(aBlock);
  id v6 = a1;
  id v7 = a3;
  id v8 = (void *)swift_task_alloc();
  v3[5] = v8;
  *id v8 = v3;
  v8[1] = sub_24511C910;
  v8[14] = a1;
  v8[15] = v7;
  return MEMORY[0x270FA2498](sub_24511BF9C, 0, 0);
}

uint64_t sub_24511C910()
{
  uint64_t v2 = v0;
  uint64_t v3 = *v1;
  id v4 = *(void **)(*v1 + 24);
  id v5 = *(void **)(*v1 + 16);
  uint64_t v6 = *v1;
  swift_task_dealloc();

  if (v2)
  {
    uint64_t v7 = sub_245132688();

    uint64_t v8 = 0;
    uint64_t v9 = (void *)v7;
  }
  else
  {
    sub_245108D5C(0, &qword_268EC40D0);
    uint64_t v8 = sub_245132888();
    swift_bridgeObjectRelease();
    uint64_t v7 = 0;
    uint64_t v9 = (void *)v8;
  }
  uint64_t v10 = *(void (***)(void, void, void))(v3 + 32);
  v10[2](v10, v8, v7);

  _Block_release(v10);
  uint64_t v11 = *(uint64_t (**)(void))(v6 + 8);
  return v11();
}

uint64_t sub_24511CAD0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[17] = a3;
  v4[18] = v3;
  v4[15] = a1;
  v4[16] = a2;
  return MEMORY[0x270FA2498](sub_24511CB64, 0, 0);
}

uint64_t sub_24511CB64()
{
  uint64_t v32 = v0;
  uint64_t v31 = *MEMORY[0x263EF8340];
  if (qword_268EC36F0 != -1) {
    swift_once();
  }
  uint64_t v1 = *(void **)(v0 + 136);
  uint64_t v2 = sub_245132738();
  __swift_project_value_buffer(v2, (uint64_t)qword_268ECA3C0);
  id v3 = v1;
  swift_bridgeObjectRetain_n();
  id v4 = v3;
  id v5 = sub_245132718();
  os_log_type_t v6 = sub_245132928();
  if (os_log_type_enabled(v5, v6))
  {
    unint64_t v7 = *(void *)(v0 + 128);
    uint64_t v25 = *(void *)(v0 + 120);
    uint64_t v26 = *(void *)(v0 + 136);
    uint64_t v8 = swift_slowAlloc();
    uint64_t v9 = (void *)swift_slowAlloc();
    uint64_t v27 = swift_slowAlloc();
    uint64_t v29 = v27;
    *(_DWORD *)uint64_t v8 = 136315394;
    swift_bridgeObjectRetain();
    *(void *)(v0 + 96) = sub_24511DDEC(v25, v7, &v29);
    sub_2451329D8();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v8 + 12) = 2112;
    if (v26)
    {
      *(void *)(v0 + 112) = v4;
      id v10 = v4;
    }
    else
    {
      *(void *)(v0 + 104) = 0;
    }
    sub_2451329D8();
    *uint64_t v9 = *(void *)(v0 + 136);

    _os_log_impl(&dword_2450FD000, v5, v6, "Configuring device with name: %s, room: %@", (uint8_t *)v8, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268EC3A08);
    swift_arrayDestroy();
    MEMORY[0x245697ED0](v9, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x245697ED0](v27, -1, -1);
    MEMORY[0x245697ED0](v8, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }
  uint64_t v11 = *(void **)(*(void *)(v0 + 144)
                 + OBJC_IVAR____TtC13MatterSupport41MatterAddDeviceExtensionConnectionHandler_extensionRequestHandler);
  *(void *)(v0 + 40) = type metadata accessor for MatterAddDeviceExtensionRequestHandler();
  *(void *)(v0 + 16) = v11;
  uint64_t v12 = v11;
  if (swift_dynamicCast())
  {
    uint64_t v13 = *(void *)(v0 + 136);

    if (v13)
    {
      id v14 = v4;
      id v15 = objc_msgSend(v14, sel_name);
      uint64_t v16 = sub_245132838();
      uint64_t v18 = v17;
    }
    else
    {
      uint64_t v16 = 0;
      uint64_t v18 = 0;
    }
    *(void *)(v0 + 152) = v18;
    *(void *)(v0 + 48) = v16;
    *(void *)(v0 + 56) = v18;
    uint64_t v21 = *(int **)((*MEMORY[0x263F8EED0] & *v12) + 0x78);
    unint64_t v28 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)v21 + *v21);
    uint64_t v22 = (void *)swift_task_alloc();
    *(void *)(v0 + 160) = v22;
    *uint64_t v22 = v0;
    v22[1] = sub_24511D0A0;
    uint64_t v24 = *(void *)(v0 + 120);
    uint64_t v23 = *(void *)(v0 + 128);
    return v28(v24, v23, v0 + 48);
  }
  else
  {
    uint64_t v29 = 0;
    unint64_t v30 = 0xE000000000000000;
    sub_245132A18();
    unint64_t v19 = v30;
    *(void *)(v0 + 64) = v29;
    *(void *)(v0 + 72) = v19;
    sub_245132868();
    *(void *)(v0 + 80) = v12;
    sub_245132AC8();
    return sub_245132AE8();
  }
}

uint64_t sub_24511D0A0()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_24511D364(int a1, void *a2, void *aBlock, void *a4)
{
  v4[2] = a2;
  v4[3] = a4;
  v4[4] = _Block_copy(aBlock);
  uint64_t v7 = sub_245132838();
  uint64_t v9 = v8;
  v4[5] = v8;
  id v10 = a2;
  id v11 = a4;
  uint64_t v12 = (void *)swift_task_alloc();
  v4[6] = v12;
  *uint64_t v12 = v4;
  v12[1] = sub_24511D460;
  v12[17] = a2;
  v12[18] = v11;
  v12[15] = v7;
  v12[16] = v9;
  return MEMORY[0x270FA2498](sub_24511CB64, 0, 0);
}

uint64_t sub_24511D460()
{
  uint64_t v2 = v0;
  uint64_t v4 = *v1;
  uint64_t v3 = *v1;
  id v5 = *(void **)(*v1 + 24);
  os_log_type_t v6 = *(void **)(*v1 + 16);
  uint64_t v7 = *v1;
  swift_task_dealloc();

  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(v3 + 32);
  if (v2)
  {
    uint64_t v9 = (void *)sub_245132688();

    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);
  }
  else
  {
    (*(void (**)(uint64_t, void))(v8 + 16))(v8, 0);
  }
  _Block_release(*(const void **)(v4 + 32));
  id v10 = *(uint64_t (**)(void))(v7 + 8);
  return v10();
}

id sub_24511D650()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for MatterAddDeviceExtensionConnectionHandler()
{
  return self;
}

uint64_t sub_24511D6BC()
{
  _Block_release(*(const void **)(v0 + 32));

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_24511D70C()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = (void *)v0[3];
  id v5 = (void *)v0[4];
  uint64_t v4 = (void *)v0[5];
  os_log_type_t v6 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v6;
  *os_log_type_t v6 = v1;
  v6[1] = sub_245109604;
  uint64_t v7 = (uint64_t (*)(int, void *, void *, void *))((char *)&dword_268EC4050 + dword_268EC4050);
  return v7(v2, v3, v5, v4);
}

uint64_t sub_24511D7CC(uint64_t a1, uint64_t a2, int *a3)
{
  os_log_type_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  *uint64_t v4 = v3;
  v4[1] = sub_245109604;
  return v6();
}

uint64_t sub_24511D89C()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = (int *)v0[4];
  id v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *id v5 = v1;
  v5[1] = sub_245109604;
  os_log_type_t v6 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_268EC4060 + dword_268EC4060);
  return v6(v2, v3, v4);
}

uint64_t sub_24511D95C(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  id v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  *id v5 = v4;
  v5[1] = sub_245109604;
  return v7();
}

uint64_t sub_24511DA2C(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  os_log_type_t v6 = (int *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_245109604;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_268EC4070 + dword_268EC4070);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_24511DAF8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_245132908();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_2451328F8();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_24511DC9C(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_2451328B8();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_24511DC9C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268EC39D8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24511DCFC()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24511DD34(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_245109604;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_268EC4080 + dword_268EC4080);
  return v6(a1, v4);
}

uint64_t sub_24511DDEC(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_24511DEC0(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_245104180((uint64_t)v12, *a3);
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
      sub_245104180((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_24511DEC0(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_2451329E8();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_24511E07C(a5, a6);
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
  uint64_t v8 = sub_245132A68();
  if (!v8)
  {
    sub_245132AD8();
    __break(1u);
LABEL_17:
    uint64_t result = sub_245132B08();
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

uint64_t sub_24511E07C(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_24511E114(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_24511E2F4(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_24511E2F4(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_24511E114(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_24511E28C(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_245132A28();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_245132AD8();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_245132878();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_245132B08();
    __break(1u);
LABEL_14:
    uint64_t result = sub_245132AD8();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_24511E28C(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_268EC40A0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_24511E2F4(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_268EC40A0);
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
  uint64_t result = sub_245132B08();
  __break(1u);
  return result;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_24511E484()
{
  uint64_t v2 = (void *)v0[2];
  unint64_t v3 = (void *)v0[3];
  unint64_t v4 = (void *)v0[4];
  size_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *size_t v5 = v1;
  v5[1] = sub_245109604;
  unint64_t v6 = (uint64_t (*)(void *, void *, void *))((char *)&dword_268EC40A8 + dword_268EC40A8);
  return v6(v2, v3, v4);
}

uint64_t sub_24511E540()
{
  _Block_release(*(const void **)(v0 + 40));

  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_24511E598()
{
  uint64_t v2 = (void *)v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = v0[4];
  size_t v5 = (const void *)v0[5];
  unint64_t v6 = (void *)v0[6];
  int64_t v7 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v7;
  void *v7 = v1;
  v7[1] = sub_245109604;
  uint64_t v8 = (uint64_t (*)(void *, uint64_t, uint64_t, const void *, void *))((char *)&dword_268EC40D8
                                                                              + dword_268EC40D8);
  return v8(v2, v3, v4, v5, v6);
}

unint64_t sub_24511E668()
{
  unint64_t result = qword_268EC4100;
  if (!qword_268EC4100)
  {
    sub_2451326F8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268EC4100);
  }
  return result;
}

uint64_t sub_24511E6C4()
{
  uint64_t v2 = (void *)v0[2];
  uint64_t v3 = (void *)v0[3];
  uint64_t v4 = (void *)v0[4];
  size_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *size_t v5 = v1;
  v5[1] = sub_245109604;
  unint64_t v6 = (uint64_t (*)(void *, void *, void *))((char *)&dword_268EC4108 + dword_268EC4108);
  return v6(v2, v3, v4);
}

uint64_t sub_24511E784()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = (void *)v0[3];
  uint64_t v4 = (void *)v0[4];
  size_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *size_t v5 = v1;
  v5[1] = sub_245109604;
  unint64_t v6 = (uint64_t (*)(int, void *, void *))((char *)&dword_268EC4130 + dword_268EC4130);
  return v6(v2, v3, v4);
}

uint64_t sub_24511E840(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_24511E8C0(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_24511E860(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_24511EB00(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_24511E880(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_24511EC6C(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_24511E8A0(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_24511EDE8(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_24511E8C0(char a1, int64_t a2, char a3, void *a4)
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
    uint64_t v13 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268EC41A0);
  uint64_t v10 = *(void *)(type metadata accessor for MatterAddDeviceRequest.DeviceCriteria(0) - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
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
  uint64_t v16 = *(void *)(type metadata accessor for MatterAddDeviceRequest.DeviceCriteria(0) - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  uint64_t v18 = (char *)v13 + v17;
  unint64_t v19 = (char *)a4 + v17;
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
  uint64_t result = sub_245132B08();
  __break(1u);
  return result;
}

uint64_t sub_24511EB00(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_268EC41A8);
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
  size_t v14 = a4 + 32;
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
  uint64_t result = sub_245132B08();
  __break(1u);
  return result;
}

uint64_t sub_24511EC6C(char a1, int64_t a2, char a3, char *a4)
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
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268EC4198);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  size_t v14 = 24 * v8;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v14]) {
      memmove(v12, v13, v14);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v14] || v12 >= &v13[v14])
  {
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_245132B08();
  __break(1u);
  return result;
}

uint64_t sub_24511EDE8(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_268EC4160);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 + 31;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 6);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  size_t v14 = a4 + 32;
  size_t v15 = v8 << 6;
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
  uint64_t result = sub_245132B08();
  __break(1u);
  return result;
}

uint64_t objectdestroy_33Tm()
{
  _Block_release(*(const void **)(v0 + 24));

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_24511EF9C()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = (void *)v0[3];
  uint64_t v4 = (void *)v0[4];
  size_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *size_t v5 = v1;
  v5[1] = sub_245109604;
  unint64_t v6 = (uint64_t (*)(int, void *, void *))((char *)&dword_268EC4168 + dword_268EC4168);
  return v6(v2, v3, v4);
}

uint64_t objectdestroy_16Tm()
{
  swift_unknownObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_24511F09C()
{
  uint64_t v0 = sub_245132738();
  __swift_allocate_value_buffer(v0, qword_268ECA3C0);
  __swift_project_value_buffer(v0, (uint64_t)qword_268ECA3C0);
  sub_245132838();
  return sub_245132728();
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

uint64_t MatterAddDeviceExtensionRequestHandler.DeviceCredential.certificationDeclaration.getter()
{
  uint64_t v1 = *(void *)v0;
  sub_2450FF9B4(*(void *)v0, *(void *)(v0 + 8));
  return v1;
}

uint64_t MatterAddDeviceExtensionRequestHandler.DeviceCredential.certificationDeclaration.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_245100544(*(void *)v2, *(void *)(v2 + 8));
  *(void *)uint64_t v2 = a1;
  *(void *)(v2 + 8) = a2;
  return result;
}

uint64_t (*MatterAddDeviceExtensionRequestHandler.DeviceCredential.certificationDeclaration.modify())()
{
  return nullsub_1;
}

uint64_t MatterAddDeviceExtensionRequestHandler.DeviceCredential.deviceAttestationCertificate.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  sub_2450FF9B4(v1, *(void *)(v0 + 24));
  return v1;
}

uint64_t MatterAddDeviceExtensionRequestHandler.DeviceCredential.deviceAttestationCertificate.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_245100544(*(void *)(v2 + 16), *(void *)(v2 + 24));
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return result;
}

uint64_t (*MatterAddDeviceExtensionRequestHandler.DeviceCredential.deviceAttestationCertificate.modify())()
{
  return nullsub_1;
}

uint64_t MatterAddDeviceExtensionRequestHandler.DeviceCredential.productAttestationIntermediateCertificate.getter()
{
  uint64_t v1 = *(void *)(v0 + 32);
  sub_2450FF9B4(v1, *(void *)(v0 + 40));
  return v1;
}

uint64_t MatterAddDeviceExtensionRequestHandler.DeviceCredential.productAttestationIntermediateCertificate.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_245100544(*(void *)(v2 + 32), *(void *)(v2 + 40));
  *(void *)(v2 + 32) = a1;
  *(void *)(v2 + 40) = a2;
  return result;
}

uint64_t (*MatterAddDeviceExtensionRequestHandler.DeviceCredential.productAttestationIntermediateCertificate.modify())()
{
  return nullsub_1;
}

uint64_t MatterAddDeviceExtensionRequestHandler.DeviceCredential.init(certificationDeclaration:deviceAttestationCertificate:productAttestationIntermediateCertificate:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, void *a7@<X8>)
{
  *a7 = result;
  a7[1] = a2;
  a7[2] = a3;
  a7[3] = a4;
  a7[4] = a5;
  a7[5] = a6;
  return result;
}

uint64_t MatterAddDeviceExtensionRequestHandler.DeviceCredential.hash(into:)()
{
  uint64_t v1 = *v0;
  unint64_t v2 = v0[1];
  uint64_t v3 = v0[2];
  unint64_t v4 = v0[3];
  uint64_t v6 = v0[4];
  unint64_t v5 = v0[5];
  sub_2450FF9B4(v1, v2);
  sub_2451326C8();
  sub_245100544(v1, v2);
  sub_2450FF9B4(v3, v4);
  sub_2451326C8();
  sub_245100544(v3, v4);
  sub_2450FF9B4(v6, v5);
  sub_2451326C8();

  return sub_245100544(v6, v5);
}

unint64_t sub_24511F3F8(char a1)
{
  unint64_t result = 0xD000000000000018;
  if (a1)
  {
    if (a1 == 1) {
      return 0xD00000000000001CLL;
    }
    else {
      return 0xD000000000000029;
    }
  }
  return result;
}

unint64_t sub_24511F458()
{
  return sub_24511F3F8(*v0);
}

uint64_t sub_24511F460@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24512050C(a1, a2);
  *a3 = result;
  return result;
}

void sub_24511F488(unsigned char *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_24511F494(uint64_t a1)
{
  unint64_t v2 = sub_24511FF5C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24511F4D0(uint64_t a1)
{
  unint64_t v2 = sub_24511FF5C();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t MatterAddDeviceExtensionRequestHandler.DeviceCredential.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268EC4210);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *v1;
  uint64_t v7 = v1[1];
  uint64_t v9 = v1[2];
  uint64_t v18 = v1[3];
  uint64_t v19 = v9;
  uint64_t v10 = v1[4];
  uint64_t v16 = v1[5];
  uint64_t v17 = v10;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24511FF5C();
  sub_245132D88();
  uint64_t v21 = v8;
  uint64_t v22 = v7;
  char v23 = 0;
  sub_245102414();
  uint64_t v11 = v20;
  sub_245132C28();
  if (!v11)
  {
    uint64_t v13 = v16;
    uint64_t v12 = v17;
    uint64_t v21 = v19;
    uint64_t v22 = v18;
    char v23 = 1;
    sub_245132C28();
    uint64_t v21 = v12;
    uint64_t v22 = v13;
    char v23 = 2;
    sub_245132C28();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t MatterAddDeviceExtensionRequestHandler.DeviceCredential.hashValue.getter()
{
  uint64_t v1 = *v0;
  unint64_t v2 = v0[1];
  uint64_t v3 = v0[2];
  unint64_t v4 = v0[3];
  uint64_t v6 = v0[4];
  unint64_t v5 = v0[5];
  sub_245132CD8();
  sub_2450FF9B4(v1, v2);
  sub_2451326C8();
  sub_245100544(v1, v2);
  sub_2450FF9B4(v3, v4);
  sub_2451326C8();
  sub_245100544(v3, v4);
  sub_2450FF9B4(v6, v5);
  sub_2451326C8();
  sub_245100544(v6, v5);
  return sub_245132D28();
}

uint64_t MatterAddDeviceExtensionRequestHandler.DeviceCredential.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268EC4220);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24511FF5C();
  sub_245132D78();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  char v27 = 0;
  sub_2451024BC();
  sub_245132B88();
  uint64_t v24 = a2;
  uint64_t v10 = v25;
  unint64_t v9 = v26;
  char v27 = 1;
  sub_2450FF9B4(v25, v26);
  sub_245132B88();
  unint64_t v23 = v9;
  uint64_t v11 = v10;
  char v27 = 2;
  uint64_t v12 = v25;
  unint64_t v22 = v26;
  sub_2450FF9B4(v25, v26);
  sub_245132B88();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  uint64_t v13 = v25;
  unint64_t v14 = v26;
  uint64_t v15 = v11;
  uint64_t v16 = v11;
  unint64_t v17 = v23;
  sub_2450FF9B4(v16, v23);
  unint64_t v18 = v22;
  sub_2450FF9B4(v12, v22);
  sub_2450FF9B4(v13, v14);
  sub_245100544(v12, v18);
  sub_245100544(v15, v17);
  uint64_t v19 = v24;
  *uint64_t v24 = v15;
  v19[1] = v17;
  v19[2] = v12;
  v19[3] = v18;
  v19[4] = v13;
  v19[5] = v14;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  sub_245100544(v15, v17);
  sub_245100544(v12, v18);
  return sub_245100544(v13, v14);
}

uint64_t sub_24511FAE8()
{
  uint64_t v1 = *v0;
  unint64_t v2 = v0[1];
  uint64_t v3 = v0[2];
  unint64_t v4 = v0[3];
  uint64_t v6 = v0[4];
  unint64_t v5 = v0[5];
  sub_245132CD8();
  sub_2450FF9B4(v1, v2);
  sub_2451326C8();
  sub_245100544(v1, v2);
  sub_2450FF9B4(v3, v4);
  sub_2451326C8();
  sub_245100544(v3, v4);
  sub_2450FF9B4(v6, v5);
  sub_2451326C8();
  sub_245100544(v6, v5);
  return sub_245132D28();
}

uint64_t sub_24511FBB4()
{
  uint64_t v1 = *v0;
  unint64_t v2 = v0[1];
  uint64_t v3 = v0[2];
  unint64_t v4 = v0[3];
  uint64_t v6 = v0[4];
  unint64_t v5 = v0[5];
  sub_2450FF9B4(v1, v2);
  sub_2451326C8();
  sub_245100544(v1, v2);
  sub_2450FF9B4(v3, v4);
  sub_2451326C8();
  sub_245100544(v3, v4);
  sub_2450FF9B4(v6, v5);
  sub_2451326C8();

  return sub_245100544(v6, v5);
}

uint64_t sub_24511FC7C()
{
  uint64_t v1 = *v0;
  unint64_t v2 = v0[1];
  uint64_t v3 = v0[2];
  unint64_t v4 = v0[3];
  uint64_t v6 = v0[4];
  unint64_t v5 = v0[5];
  sub_245132CD8();
  sub_2450FF9B4(v1, v2);
  sub_2451326C8();
  sub_245100544(v1, v2);
  sub_2450FF9B4(v3, v4);
  sub_2451326C8();
  sub_245100544(v3, v4);
  sub_2450FF9B4(v6, v5);
  sub_2451326C8();
  sub_245100544(v6, v5);
  return sub_245132D28();
}

uint64_t sub_24511FD44@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return MatterAddDeviceExtensionRequestHandler.DeviceCredential.init(from:)(a1, a2);
}

uint64_t sub_24511FD5C(void *a1)
{
  return MatterAddDeviceExtensionRequestHandler.DeviceCredential.encode(to:)(a1);
}

uint64_t _s13MatterSupport0A32AddDeviceExtensionRequestHandlerC0D10CredentialV2eeoiySbAE_AEtFZ_0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  unint64_t v3 = a1[1];
  uint64_t v4 = a1[2];
  unint64_t v5 = a1[3];
  uint64_t v6 = a1[4];
  unint64_t v7 = a1[5];
  uint64_t v8 = *a2;
  unint64_t v9 = a2[1];
  uint64_t v11 = a2[2];
  unint64_t v10 = a2[3];
  uint64_t v13 = a2[4];
  unint64_t v12 = a2[5];
  uint64_t v14 = 0;
  switch(v3 >> 62)
  {
    case 1uLL:
      LODWORD(v14) = HIDWORD(v2) - v2;
      if (__OFSUB__(HIDWORD(v2), v2))
      {
        __break(1u);
LABEL_22:
        __break(1u);
LABEL_23:
        __break(1u);
LABEL_24:
        __break(1u);
        JUMPOUT(0x24511FF3CLL);
      }
      uint64_t v14 = (int)v14;
LABEL_6:
      switch(v9 >> 62)
      {
        case 1uLL:
          LODWORD(v18) = HIDWORD(v8) - v8;
          if (__OFSUB__(HIDWORD(v8), v8)) {
            goto LABEL_23;
          }
          uint64_t v18 = (int)v18;
LABEL_11:
          if (v14 != v18) {
            return 0;
          }
          if (v14 >= 1)
          {
            uint64_t v27 = a2[4];
            unint64_t v28 = a2[5];
            unint64_t v21 = a1[5];
            uint64_t v22 = a1[4];
            unint64_t v23 = a2[3];
            sub_2450FF9B4(*a2, a2[1]);
            char v24 = sub_245110C24(v2, v3, v8, v9);
            unint64_t v10 = v23;
            uint64_t v6 = v22;
            unint64_t v7 = v21;
            uint64_t v13 = v27;
            unint64_t v12 = v28;
            if ((v24 & 1) == 0) {
              return 0;
            }
          }
LABEL_16:
          uint64_t v25 = v6;
          if ((sub_245110F0C(v4, v5, v11, v10) & 1) == 0) {
            return 0;
          }
          return sub_245110F0C(v25, v7, v13, v12);
        case 2uLL:
          uint64_t v20 = *(void *)(v8 + 16);
          uint64_t v19 = *(void *)(v8 + 24);
          BOOL v17 = __OFSUB__(v19, v20);
          uint64_t v18 = v19 - v20;
          if (!v17) {
            goto LABEL_11;
          }
          goto LABEL_24;
        case 3uLL:
          if (!v14) {
            goto LABEL_16;
          }
          return 0;
        default:
          uint64_t v18 = BYTE6(v9);
          goto LABEL_11;
      }
    case 2uLL:
      uint64_t v16 = *(void *)(v2 + 16);
      uint64_t v15 = *(void *)(v2 + 24);
      BOOL v17 = __OFSUB__(v15, v16);
      uint64_t v14 = v15 - v16;
      if (!v17) {
        goto LABEL_6;
      }
      goto LABEL_22;
    case 3uLL:
      goto LABEL_6;
    default:
      uint64_t v14 = BYTE6(v3);
      goto LABEL_6;
  }
}

unint64_t sub_24511FF5C()
{
  unint64_t result = qword_268EC4218;
  if (!qword_268EC4218)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268EC4218);
  }
  return result;
}

unint64_t sub_24511FFB4()
{
  unint64_t result = qword_268EC4228;
  if (!qword_268EC4228)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268EC4228);
  }
  return result;
}

uint64_t _s16DeviceCredentialVwxx(uint64_t *a1)
{
  sub_245100544(*a1, a1[1]);
  sub_245100544(a1[2], a1[3]);
  uint64_t v2 = a1[4];
  unint64_t v3 = a1[5];

  return sub_245100544(v2, v3);
}

uint64_t *_s16DeviceCredentialVwcp(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  unint64_t v5 = a2[1];
  sub_2450FF9B4(*a2, v5);
  *a1 = v4;
  a1[1] = v5;
  uint64_t v6 = a2[2];
  unint64_t v7 = a2[3];
  sub_2450FF9B4(v6, v7);
  a1[2] = v6;
  a1[3] = v7;
  uint64_t v9 = a2[4];
  unint64_t v8 = a2[5];
  sub_2450FF9B4(v9, v8);
  a1[4] = v9;
  a1[5] = v8;
  return a1;
}

uint64_t *_s16DeviceCredentialVwca(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  unint64_t v5 = a2[1];
  sub_2450FF9B4(*a2, v5);
  uint64_t v6 = *a1;
  unint64_t v7 = a1[1];
  *a1 = v4;
  a1[1] = v5;
  sub_245100544(v6, v7);
  uint64_t v8 = a2[2];
  unint64_t v9 = a2[3];
  sub_2450FF9B4(v8, v9);
  uint64_t v10 = a1[2];
  unint64_t v11 = a1[3];
  a1[2] = v8;
  a1[3] = v9;
  sub_245100544(v10, v11);
  uint64_t v13 = a2[4];
  unint64_t v12 = a2[5];
  sub_2450FF9B4(v13, v12);
  uint64_t v14 = a1[4];
  unint64_t v15 = a1[5];
  a1[4] = v13;
  a1[5] = v12;
  sub_245100544(v14, v15);
  return a1;
}

__n128 __swift_memcpy48_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t *_s16DeviceCredentialVwta(uint64_t *a1, _OWORD *a2)
{
  uint64_t v4 = *a1;
  unint64_t v5 = a1[1];
  *(_OWORD *)a1 = *a2;
  sub_245100544(v4, v5);
  uint64_t v6 = a1[2];
  unint64_t v7 = a1[3];
  *((_OWORD *)a1 + 1) = a2[1];
  sub_245100544(v6, v7);
  uint64_t v8 = a1[4];
  unint64_t v9 = a1[5];
  *((_OWORD *)a1 + 2) = a2[2];
  sub_245100544(v8, v9);
  return a1;
}

uint64_t _s16DeviceCredentialVwet(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xD && *(unsigned char *)(a1 + 48)) {
    return (*(_DWORD *)a1 + 13);
  }
  unsigned int v3 = (((*(void *)(a1 + 8) >> 60) >> 2) & 0xFFFFFFF3 | (4 * ((*(void *)(a1 + 8) >> 60) & 3))) ^ 0xF;
  if (v3 >= 0xC) {
    unsigned int v3 = -1;
  }
  return v3 + 1;
}

uint64_t _s16DeviceCredentialVwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xC)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 - 13;
    if (a3 >= 0xD) {
      *(unsigned char *)(result + 48) = 1;
    }
  }
  else
  {
    if (a3 >= 0xD) {
      *(unsigned char *)(result + 48) = 0;
    }
    if (a2)
    {
      *(void *)__n128 result = 0;
      *(void *)(result + 8) = (unint64_t)(((-a2 >> 2) & 3) - 4 * a2) << 60;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MatterAddDeviceExtensionRequestHandler.DeviceCredential()
{
  return &type metadata for MatterAddDeviceExtensionRequestHandler.DeviceCredential;
}

uint64_t _s16DeviceCredentialV10CodingKeysOwet(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s16DeviceCredentialV10CodingKeysOwst(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2451203CCLL);
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

ValueMetadata *_s16DeviceCredentialV10CodingKeysOMa()
{
  return &_s16DeviceCredentialV10CodingKeysON;
}

unint64_t sub_245120408()
{
  unint64_t result = qword_268EC4230;
  if (!qword_268EC4230)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268EC4230);
  }
  return result;
}

unint64_t sub_245120460()
{
  unint64_t result = qword_268EC4238;
  if (!qword_268EC4238)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268EC4238);
  }
  return result;
}

unint64_t sub_2451204B8()
{
  unint64_t result = qword_268EC4240;
  if (!qword_268EC4240)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268EC4240);
  }
  return result;
}

uint64_t sub_24512050C(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000018 && a2 == 0x8000000245138490 || (sub_245132C98() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD00000000000001CLL && a2 == 0x80000002451384B0 || (sub_245132C98() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000029 && a2 == 0x80000002451384D0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v5 = sub_245132C98();
    swift_bridgeObjectRelease();
    if (v5) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

void sub_245122A78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_24512DA08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2451301AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_245130324(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_245131C24(_Unwind_Exception *a1)
{
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak((id *)(v4 - 72));
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_245131E78(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_245131EF0(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_245131F78(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_2451325F8()
{
  return MEMORY[0x270EEE638]();
}

uint64_t sub_245132608()
{
  return MEMORY[0x270EEE658]();
}

uint64_t sub_245132618()
{
  return MEMORY[0x270EEE670]();
}

uint64_t sub_245132628()
{
  return MEMORY[0x270EEF238]();
}

uint64_t sub_245132638()
{
  return MEMORY[0x270EEF250]();
}

uint64_t sub_245132648()
{
  return MEMORY[0x270EEF268]();
}

uint64_t sub_245132658()
{
  return MEMORY[0x270EEF288]();
}

uint64_t sub_245132668()
{
  return MEMORY[0x270EEF2A8]();
}

uint64_t sub_245132678()
{
  return MEMORY[0x270EEF2B8]();
}

uint64_t sub_245132688()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_245132698()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_2451326A8()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_2451326B8()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_2451326C8()
{
  return MEMORY[0x270EF0190]();
}

uint64_t sub_2451326D8()
{
  return MEMORY[0x270EF0CB0]();
}

uint64_t sub_2451326E8()
{
  return MEMORY[0x270EF0CB8]();
}

uint64_t sub_2451326F8()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_245132708()
{
  return MEMORY[0x270FA2C78]();
}

uint64_t sub_245132718()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_245132728()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_245132738()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_245132748()
{
  return MEMORY[0x270EF74F0]();
}

uint64_t sub_245132758()
{
  return MEMORY[0x270EF7510]();
}

uint64_t sub_245132768()
{
  return MEMORY[0x270EF77E0]();
}

uint64_t sub_245132778()
{
  return MEMORY[0x270EF7838]();
}

uint64_t sub_245132788()
{
  return MEMORY[0x270EF7850]();
}

uint64_t sub_245132798()
{
  return MEMORY[0x270EF7860]();
}

uint64_t sub_2451327A8()
{
  return MEMORY[0x270EF7868]();
}

uint64_t sub_2451327B8()
{
  return MEMORY[0x270EF7870]();
}

uint64_t sub_2451327C8()
{
  return MEMORY[0x270EF78B8]();
}

uint64_t sub_2451327D8()
{
  return MEMORY[0x270EF78C0]();
}

uint64_t sub_2451327E8()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_2451327F8()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_245132808()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_245132818()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_245132828()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_245132838()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_245132848()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_245132858()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_245132868()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_245132878()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_245132888()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_245132898()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_2451328A8()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_2451328B8()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_2451328C8()
{
  return MEMORY[0x270FA1E10]();
}

uint64_t sub_2451328D8()
{
  return MEMORY[0x270FA1E18]();
}

uint64_t sub_2451328E8()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_2451328F8()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_245132908()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_245132918()
{
  return MEMORY[0x270EF1CF8]();
}

uint64_t sub_245132928()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_245132938()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_245132948()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_245132958()
{
  return MEMORY[0x270EF1F60]();
}

uint64_t sub_245132968()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t sub_245132978()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_245132988()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t sub_245132998()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_2451329A8()
{
  return MEMORY[0x270FA1190]();
}

uint64_t sub_2451329B8()
{
  return MEMORY[0x270FA2F00]();
}

uint64_t sub_2451329C8()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_2451329D8()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_2451329E8()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_2451329F8()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_245132A08()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_245132A18()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_245132A28()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_245132A38()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_245132A48()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t sub_245132A58()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_245132A68()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_245132A78()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_245132A88()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_245132A98()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_245132AA8()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_245132AB8()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_245132AC8()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_245132AD8()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_245132AE8()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_245132AF8()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_245132B08()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_245132B18()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_245132B28()
{
  return MEMORY[0x270F9F250]();
}

uint64_t sub_245132B38()
{
  return MEMORY[0x270F9F258]();
}

uint64_t sub_245132B48()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t sub_245132B58()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_245132B68()
{
  return MEMORY[0x270F9F2F0]();
}

uint64_t sub_245132B78()
{
  return MEMORY[0x270F9F308]();
}

uint64_t sub_245132B88()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_245132B98()
{
  return MEMORY[0x270F9F320]();
}

uint64_t sub_245132BA8()
{
  return MEMORY[0x270F9F340]();
}

uint64_t sub_245132BB8()
{
  return MEMORY[0x270F9F348]();
}

uint64_t sub_245132BC8()
{
  return MEMORY[0x270F9F358]();
}

uint64_t sub_245132BD8()
{
  return MEMORY[0x270F9F360]();
}

uint64_t sub_245132BE8()
{
  return MEMORY[0x270F9F390]();
}

uint64_t sub_245132BF8()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_245132C08()
{
  return MEMORY[0x270F9F430]();
}

uint64_t sub_245132C18()
{
  return MEMORY[0x270F9F448]();
}

uint64_t sub_245132C28()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_245132C38()
{
  return MEMORY[0x270F9F460]();
}

uint64_t sub_245132C48()
{
  return MEMORY[0x270F9F480]();
}

uint64_t sub_245132C58()
{
  return MEMORY[0x270F9F488]();
}

uint64_t sub_245132C68()
{
  return MEMORY[0x270F9F498]();
}

uint64_t sub_245132C78()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_245132C88()
{
  return MEMORY[0x270F9F770]();
}

uint64_t sub_245132C98()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_245132CB8()
{
  return MEMORY[0x270EF2648]();
}

uint64_t sub_245132CC8()
{
  return MEMORY[0x270EF2718]();
}

uint64_t sub_245132CD8()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_245132CE8()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_245132CF8()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_245132D08()
{
  return MEMORY[0x270F9FC70]();
}

uint64_t sub_245132D18()
{
  return MEMORY[0x270F9FC80]();
}

uint64_t sub_245132D28()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_245132D38()
{
  return MEMORY[0x270EF2738]();
}

uint64_t sub_245132D48()
{
  return MEMORY[0x270EF2790]();
}

uint64_t sub_245132D58()
{
  return MEMORY[0x270EF27A0]();
}

uint64_t sub_245132D68()
{
  return MEMORY[0x270EF27A8]();
}

uint64_t sub_245132D78()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_245132D88()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t sub_245132DB8()
{
  return MEMORY[0x270FA0128]();
}

uint64_t CFPrefs_GetInt64()
{
  return MEMORY[0x270F23E88]();
}

uint64_t DebugGetErrorString()
{
  return MEMORY[0x270F24148]();
}

uint64_t HMFCreateOSLogHandle()
{
  return MEMORY[0x270F30820]();
}

uint64_t HMFEqualObjects()
{
  return MEMORY[0x270F30850]();
}

uint64_t HMFGetLogIdentifier()
{
  return MEMORY[0x270F30858]();
}

uint64_t HMFGetOSLogHandle()
{
  return MEMORY[0x270F30860]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

uint64_t OPACKDecodeData()
{
  return MEMORY[0x270F24588]();
}

uint64_t OPACKEncoderCreateData()
{
  return MEMORY[0x270F24598]();
}

CFStringRef SecCopyErrorMessageString(OSStatus status, void *reserved)
{
  return (CFStringRef)MEMORY[0x270EFD8F0](*(void *)&status, reserved);
}

OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)
{
  return MEMORY[0x270EFD970](attributes, result);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x270EFD978](query, result);
}

OSStatus SecItemDelete(CFDictionaryRef query)
{
  return MEMORY[0x270EFD980](query);
}

OSStatus SecItemUpdate(CFDictionaryRef query, CFDictionaryRef attributesToUpdate)
{
  return MEMORY[0x270EFD988](query, attributesToUpdate);
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

uint64_t _HMFPreconditionFailure()
{
  return MEMORY[0x270F30900]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
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

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t os_unfair_lock_lock_with_options()
{
  return MEMORY[0x270EDAAD0]();
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
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

uint64_t swift_deallocBox()
{
  return MEMORY[0x270FA0220]();
}

uint64_t swift_deallocUninitializedObject()
{
  return MEMORY[0x270FA0248]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x270FA2420]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x270FA2428]();
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

uint64_t swift_getDynamicType()
{
  return MEMORY[0x270FA0330]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
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

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_projectBox()
{
  return MEMORY[0x270FA04F8]();
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

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x270EDB7D8](a1, a2, a3, a4, a5);
}