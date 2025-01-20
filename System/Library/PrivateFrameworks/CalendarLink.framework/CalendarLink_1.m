uint64_t sub_229028F10()
{
  uint64_t result;
  uint64_t v1;

  result = sub_2290422B0();
  qword_26AF65E30 = result;
  qword_26AF65E38 = v1;
  return result;
}

uint64_t static EventEntity.attributionBundleIdentifier.getter()
{
  if (qword_26AF65DC8 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v0 = qword_26AF65E30;
  sub_229041250();
  return v0;
}

uint64_t static EventEntity.attributionBundleIdentifier.setter(uint64_t a1, uint64_t a2)
{
  if (qword_26AF65DC8 != -1) {
    swift_once();
  }
  swift_beginAccess();
  qword_26AF65E30 = a1;
  qword_26AF65E38 = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*static EventEntity.attributionBundleIdentifier.modify())()
{
  if (qword_26AF65DC8 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t static EventEntity.persistentIdentifier.getter()
{
  return 0x746E45746E657645;
}

uint64_t sub_2290290F8()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF665B0);
  MEMORY[0x270FA5388](v0 - 8);
  v12[0] = (char *)v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_2290414D0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  v5 = (char *)v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_229041610();
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v7 = sub_229042290();
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v8 = sub_2290414E0();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = sub_229041370();
  __swift_allocate_value_buffer(v10, qword_2682B7D40);
  __swift_project_value_buffer(v10, (uint64_t)qword_2682B7D40);
  sub_229042210();
  sub_229041600();
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x263F06D18], v2);
  sub_2290414F0();
  (*(void (**)(void, uint64_t, uint64_t, uint64_t))(v9 + 56))(v12[0], 1, 1, v8);
  return sub_229041360();
}

uint64_t static EventEntity.typeDisplayRepresentation.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_228F92510(&qword_2682B4F80, (uint64_t)qword_2682B7D40, a1);
}

uint64_t EventEntity.displayRepresentation.getter@<X0>(uint64_t a1@<X8>)
{
  v24[1] = a1;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AF65A10);
  MEMORY[0x270FA5388](v2 - 8);
  v24[0] = (char *)v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_2290415E0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)v24 - v9;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF665B0);
  MEMORY[0x270FA5388](v11 - 8);
  v13 = (char *)v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_2290414E0();
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  long long v16 = v1[7];
  v26[6] = v1[6];
  v26[7] = v16;
  long long v17 = v1[9];
  v26[8] = v1[8];
  v26[9] = v17;
  long long v18 = v1[3];
  v26[2] = v1[2];
  v26[3] = v18;
  long long v19 = v1[5];
  v26[4] = v1[4];
  v26[5] = v19;
  long long v20 = v1[1];
  v26[0] = *v1;
  v26[1] = v20;
  sub_228F7656C((uint64_t)v26);
  sub_229040DB0();
  sub_228F75D98((uint64_t)v26);
  sub_2290414C0();
  type metadata accessor for LocalizedStringUtils();
  sub_228F7656C((uint64_t)v26);
  sub_229040DB0();
  sub_229040DB0();
  sub_229040DB0();
  sub_228F75D98((uint64_t)v26);
  if (v25 == 1) {
    sub_228F99F54((uint64_t)v13);
  }
  else {
    sub_228F9A3D4((uint64_t)v13);
  }
  v21 = *(void (**)(char *, uint64_t))(v5 + 8);
  v21(v8, v4);
  v21(v10, v4);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v13, 0, 1, v14);
  uint64_t v22 = sub_229041180();
  (*(void (**)(void, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v24[0], 1, 1, v22);
  return sub_2290411B0();
}

uint64_t EventEntity.title.getter()
{
  sub_229040DB0();
  return v1;
}

uint64_t EventEntity.startDate.getter()
{
  return sub_229040DB0();
}

uint64_t EventEntity.endDate.getter()
{
  return sub_229040DB0();
}

uint64_t EventEntity.isAllDay.getter()
{
  sub_229040DB0();
  return v1;
}

uint64_t sub_22902983C()
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AF665A0);
  sub_229040BD0();
  sub_229040BC0();
  uint64_t result = sub_229040B90();
  qword_2682B7D58 = result;
  return result;
}

uint64_t static EventEntity.defaultQuery.getter@<X0>(void *a1@<X8>)
{
  if (qword_2682B4F88 != -1) {
    swift_once();
  }
  swift_beginAccess();
  *a1 = qword_2682B7D58;
  return sub_229040F70();
}

uint64_t static EventEntity.defaultQuery.setter(uint64_t *a1)
{
  uint64_t v1 = *a1;
  if (qword_2682B4F88 != -1) {
    swift_once();
  }
  swift_beginAccess();
  qword_2682B7D58 = v1;
  return swift_release();
}

uint64_t (*static EventEntity.defaultQuery.modify())()
{
  if (qword_2682B4F88 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t EventEntity.id.getter()
{
  uint64_t v1 = *v0;
  sub_229041250();
  return v1;
}

uint64_t EventEntity.id.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*EventEntity.id.modify())()
{
  return nullsub_1;
}

uint64_t EventEntity.isProposedTime.getter()
{
  return *(unsigned __int8 *)(v0 + 16);
}

uint64_t EventEntity.isProposedTime.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 16) = result;
  return result;
}

uint64_t (*EventEntity.isProposedTime.modify())()
{
  return nullsub_1;
}

uint64_t sub_229029AE4@<X0>(_OWORD *a1@<X0>, void *a2@<X8>)
{
  long long v3 = a1[7];
  v11[6] = a1[6];
  v11[7] = v3;
  long long v4 = a1[9];
  v11[8] = a1[8];
  v11[9] = v4;
  long long v5 = a1[3];
  v11[2] = a1[2];
  v11[3] = v5;
  long long v6 = a1[5];
  v11[4] = a1[4];
  v11[5] = v6;
  long long v7 = a1[1];
  v11[0] = *a1;
  v11[1] = v7;
  sub_228F7656C((uint64_t)v11);
  sub_229040DB0();
  uint64_t result = sub_228F75D98((uint64_t)v11);
  *a2 = v9;
  a2[1] = v10;
  return result;
}

uint64_t sub_229029B58(uint64_t a1, _OWORD *a2)
{
  long long v2 = a2[7];
  v8[6] = a2[6];
  v8[7] = v2;
  long long v3 = a2[9];
  v8[8] = a2[8];
  v8[9] = v3;
  long long v4 = a2[3];
  v8[2] = a2[2];
  v8[3] = v4;
  long long v5 = a2[5];
  v8[4] = a2[4];
  v8[5] = v5;
  long long v6 = a2[1];
  v8[0] = *a2;
  v8[1] = v6;
  sub_229041250();
  sub_228F7656C((uint64_t)v8);
  sub_229040DC0();
  return sub_228F75D98((uint64_t)v8);
}

uint64_t EventEntity.title.setter()
{
  return sub_229040DC0();
}

uint64_t (*EventEntity.title.modify(void *a1))()
{
  long long v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_229040DA0();
  return sub_228F74D10;
}

uint64_t EventEntity.$title.getter()
{
  return sub_229040DD0();
}

uint64_t sub_229029C80(_OWORD *a1)
{
  long long v1 = a1[7];
  v7[6] = a1[6];
  v7[7] = v1;
  long long v2 = a1[9];
  v7[8] = a1[8];
  v7[9] = v2;
  long long v3 = a1[3];
  v7[2] = a1[2];
  v7[3] = v3;
  long long v4 = a1[5];
  v7[4] = a1[4];
  v7[5] = v4;
  long long v5 = a1[1];
  v7[0] = *a1;
  v7[1] = v5;
  sub_228F7656C((uint64_t)v7);
  sub_229040DB0();
  return sub_228F75D98((uint64_t)v7);
}

uint64_t sub_229029CEC(uint64_t a1, _OWORD *a2)
{
  uint64_t v4 = sub_2290415E0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)v18 - v9;
  uint64_t v11 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v11((char *)v18 - v9, a1, v4);
  long long v12 = a2[7];
  v18[6] = a2[6];
  v18[7] = v12;
  long long v13 = a2[9];
  v18[8] = a2[8];
  v18[9] = v13;
  long long v14 = a2[3];
  v18[2] = a2[2];
  v18[3] = v14;
  long long v15 = a2[5];
  v18[4] = a2[4];
  v18[5] = v15;
  long long v16 = a2[1];
  v18[0] = *a2;
  v18[1] = v16;
  v11(v8, (uint64_t)v10, v4);
  sub_228F7656C((uint64_t)v18);
  sub_229040DC0();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
  return sub_228F75D98((uint64_t)v18);
}

uint64_t EventEntity.startDate.setter(uint64_t a1)
{
  uint64_t v2 = sub_2290415E0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v6 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
  sub_229040DC0();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
}

uint64_t (*EventEntity.startDate.modify(void *a1))()
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_229040DA0();
  return sub_228F74D10;
}

uint64_t sub_229029FA8(_OWORD *a1)
{
  long long v1 = a1[7];
  v7[6] = a1[6];
  v7[7] = v1;
  long long v2 = a1[9];
  v7[8] = a1[8];
  v7[9] = v2;
  long long v3 = a1[3];
  v7[2] = a1[2];
  v7[3] = v3;
  long long v4 = a1[5];
  v7[4] = a1[4];
  v7[5] = v4;
  long long v5 = a1[1];
  v7[0] = *a1;
  v7[1] = v5;
  sub_228F7656C((uint64_t)v7);
  sub_229040DB0();
  return sub_228F75D98((uint64_t)v7);
}

uint64_t sub_22902A014(uint64_t a1, _OWORD *a2)
{
  uint64_t v4 = sub_2290415E0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)v18 - v9;
  uint64_t v11 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v11((char *)v18 - v9, a1, v4);
  long long v12 = a2[7];
  v18[6] = a2[6];
  v18[7] = v12;
  long long v13 = a2[9];
  v18[8] = a2[8];
  v18[9] = v13;
  long long v14 = a2[3];
  v18[2] = a2[2];
  v18[3] = v14;
  long long v15 = a2[5];
  v18[4] = a2[4];
  v18[5] = v15;
  long long v16 = a2[1];
  v18[0] = *a2;
  v18[1] = v16;
  v11(v8, (uint64_t)v10, v4);
  sub_228F7656C((uint64_t)v18);
  sub_229040DC0();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
  return sub_228F75D98((uint64_t)v18);
}

uint64_t EventEntity.endDate.setter(uint64_t a1)
{
  uint64_t v2 = sub_2290415E0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v6 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
  sub_229040DC0();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
}

uint64_t (*EventEntity.endDate.modify(void *a1))()
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_229040DA0();
  return sub_228F74D10;
}

uint64_t sub_22902A2D0@<X0>(_OWORD *a1@<X0>, unsigned char *a2@<X8>)
{
  long long v3 = a1[7];
  v10[6] = a1[6];
  v10[7] = v3;
  long long v4 = a1[9];
  v10[8] = a1[8];
  v10[9] = v4;
  long long v5 = a1[3];
  v10[2] = a1[2];
  v10[3] = v5;
  long long v6 = a1[5];
  v10[4] = a1[4];
  v10[5] = v6;
  long long v7 = a1[1];
  v10[0] = *a1;
  v10[1] = v7;
  sub_228F7656C((uint64_t)v10);
  sub_229040DB0();
  uint64_t result = sub_228F75D98((uint64_t)v10);
  *a2 = v9;
  return result;
}

uint64_t sub_22902A348(uint64_t a1, _OWORD *a2)
{
  long long v2 = a2[7];
  v8[6] = a2[6];
  v8[7] = v2;
  long long v3 = a2[9];
  v8[8] = a2[8];
  v8[9] = v3;
  long long v4 = a2[3];
  v8[2] = a2[2];
  v8[3] = v4;
  long long v5 = a2[5];
  v8[4] = a2[4];
  v8[5] = v5;
  long long v6 = a2[1];
  v8[0] = *a2;
  v8[1] = v6;
  sub_228F7656C((uint64_t)v8);
  sub_229040DC0();
  return sub_228F75D98((uint64_t)v8);
}

uint64_t EventEntity.isAllDay.setter()
{
  return sub_229040DC0();
}

uint64_t (*EventEntity.isAllDay.modify(void *a1))()
{
  long long v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_229040DA0();
  return sub_228F74D10;
}

uint64_t EventEntity.startTimeZoneID.getter()
{
  sub_229040DB0();
  return v1;
}

double sub_22902A480@<D0>(_OWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  long long v3 = a1[7];
  v10[6] = a1[6];
  v10[7] = v3;
  long long v4 = a1[9];
  v10[8] = a1[8];
  v10[9] = v4;
  long long v5 = a1[3];
  v10[2] = a1[2];
  v10[3] = v5;
  long long v6 = a1[5];
  v10[4] = a1[4];
  v10[5] = v6;
  long long v7 = a1[1];
  v10[0] = *a1;
  v10[1] = v7;
  sub_228F7656C((uint64_t)v10);
  sub_229040DB0();
  sub_228F75D98((uint64_t)v10);
  double result = *(double *)&v9;
  *a2 = v9;
  return result;
}

uint64_t sub_22902A4F4(uint64_t a1, _OWORD *a2)
{
  long long v2 = a2[7];
  v8[6] = a2[6];
  v8[7] = v2;
  long long v3 = a2[9];
  v8[8] = a2[8];
  v8[9] = v3;
  long long v4 = a2[3];
  v8[2] = a2[2];
  v8[3] = v4;
  long long v5 = a2[5];
  v8[4] = a2[4];
  v8[5] = v5;
  long long v6 = a2[1];
  v8[0] = *a2;
  v8[1] = v6;
  sub_229041250();
  sub_228F7656C((uint64_t)v8);
  sub_229040DC0();
  return sub_228F75D98((uint64_t)v8);
}

uint64_t EventEntity.startTimeZoneID.setter()
{
  return sub_229040DC0();
}

uint64_t (*EventEntity.startTimeZoneID.modify(void *a1))()
{
  long long v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_229040DA0();
  return sub_228F74D10;
}

uint64_t EventEntity.$startTimeZoneID.getter()
{
  return sub_229040DD0();
}

uint64_t EventEntity.endTimeZoneID.getter()
{
  sub_229040DB0();
  return v1;
}

double sub_22902A650@<D0>(_OWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  long long v3 = a1[7];
  v10[6] = a1[6];
  v10[7] = v3;
  long long v4 = a1[9];
  v10[8] = a1[8];
  v10[9] = v4;
  long long v5 = a1[3];
  v10[2] = a1[2];
  v10[3] = v5;
  long long v6 = a1[5];
  v10[4] = a1[4];
  v10[5] = v6;
  long long v7 = a1[1];
  v10[0] = *a1;
  v10[1] = v7;
  sub_228F7656C((uint64_t)v10);
  sub_229040DB0();
  sub_228F75D98((uint64_t)v10);
  double result = *(double *)&v9;
  *a2 = v9;
  return result;
}

uint64_t sub_22902A6C4(uint64_t a1, _OWORD *a2)
{
  long long v2 = a2[7];
  v8[6] = a2[6];
  v8[7] = v2;
  long long v3 = a2[9];
  v8[8] = a2[8];
  v8[9] = v3;
  long long v4 = a2[3];
  v8[2] = a2[2];
  v8[3] = v4;
  long long v5 = a2[5];
  v8[4] = a2[4];
  v8[5] = v5;
  long long v6 = a2[1];
  v8[0] = *a2;
  v8[1] = v6;
  sub_229041250();
  sub_228F7656C((uint64_t)v8);
  sub_229040DC0();
  return sub_228F75D98((uint64_t)v8);
}

uint64_t EventEntity.endTimeZoneID.setter()
{
  return sub_229040DC0();
}

uint64_t (*EventEntity.endTimeZoneID.modify(void *a1))()
{
  long long v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_229040DA0();
  return sub_228F74D10;
}

uint64_t EventEntity.$endTimeZoneID.getter()
{
  return sub_229040DD0();
}

uint64_t EventEntity.isFloating.getter()
{
  sub_229040DB0();
  return v1;
}

uint64_t sub_22902A820@<X0>(_OWORD *a1@<X0>, unsigned char *a2@<X8>)
{
  long long v3 = a1[7];
  v10[6] = a1[6];
  v10[7] = v3;
  long long v4 = a1[9];
  v10[8] = a1[8];
  v10[9] = v4;
  long long v5 = a1[3];
  v10[2] = a1[2];
  v10[3] = v5;
  long long v6 = a1[5];
  v10[4] = a1[4];
  v10[5] = v6;
  long long v7 = a1[1];
  v10[0] = *a1;
  v10[1] = v7;
  sub_228F7656C((uint64_t)v10);
  sub_229040DB0();
  uint64_t result = sub_228F75D98((uint64_t)v10);
  *a2 = v9;
  return result;
}

uint64_t sub_22902A898(uint64_t a1, _OWORD *a2)
{
  long long v2 = a2[7];
  v8[6] = a2[6];
  v8[7] = v2;
  long long v3 = a2[9];
  v8[8] = a2[8];
  v8[9] = v3;
  long long v4 = a2[3];
  v8[2] = a2[2];
  v8[3] = v4;
  long long v5 = a2[5];
  v8[4] = a2[4];
  v8[5] = v5;
  long long v6 = a2[1];
  v8[0] = *a2;
  v8[1] = v6;
  sub_228F7656C((uint64_t)v8);
  sub_229040DC0();
  return sub_228F75D98((uint64_t)v8);
}

uint64_t EventEntity.isFloating.setter()
{
  return sub_229040DC0();
}

uint64_t (*EventEntity.isFloating.modify(void *a1))()
{
  long long v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_229040DA0();
  return sub_228F74D10;
}

uint64_t EventEntity.$isFloating.getter()
{
  return sub_229040DD0();
}

uint64_t EventEntity.location.getter()
{
  sub_229040DB0();
  return v1;
}

double sub_22902A9F4@<D0>(_OWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  long long v3 = a1[7];
  v10[6] = a1[6];
  v10[7] = v3;
  long long v4 = a1[9];
  v10[8] = a1[8];
  v10[9] = v4;
  long long v5 = a1[3];
  v10[2] = a1[2];
  v10[3] = v5;
  long long v6 = a1[5];
  v10[4] = a1[4];
  v10[5] = v6;
  long long v7 = a1[1];
  v10[0] = *a1;
  v10[1] = v7;
  sub_228F7656C((uint64_t)v10);
  sub_229040DB0();
  sub_228F75D98((uint64_t)v10);
  double result = *(double *)&v9;
  *a2 = v9;
  return result;
}

uint64_t sub_22902AA68(uint64_t a1, _OWORD *a2)
{
  long long v2 = a2[7];
  v8[6] = a2[6];
  v8[7] = v2;
  long long v3 = a2[9];
  v8[8] = a2[8];
  v8[9] = v3;
  long long v4 = a2[3];
  v8[2] = a2[2];
  v8[3] = v4;
  long long v5 = a2[5];
  v8[4] = a2[4];
  v8[5] = v5;
  long long v6 = a2[1];
  v8[0] = *a2;
  v8[1] = v6;
  sub_229041250();
  sub_228F7656C((uint64_t)v8);
  sub_229040DC0();
  return sub_228F75D98((uint64_t)v8);
}

uint64_t EventEntity.location.setter()
{
  return sub_229040DC0();
}

uint64_t (*EventEntity.location.modify(void *a1))()
{
  long long v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_229040DA0();
  return sub_228F74D10;
}

uint64_t EventEntity.$location.getter()
{
  return sub_229040DD0();
}

double EventEntity.travelTime.getter()
{
  sub_229040DB0();
  return v1;
}

double sub_22902ABC4@<D0>(_OWORD *a1@<X0>, double *a2@<X8>)
{
  long long v3 = a1[7];
  v10[6] = a1[6];
  v10[7] = v3;
  long long v4 = a1[9];
  v10[8] = a1[8];
  v10[9] = v4;
  long long v5 = a1[3];
  v10[2] = a1[2];
  v10[3] = v5;
  long long v6 = a1[5];
  v10[4] = a1[4];
  v10[5] = v6;
  long long v7 = a1[1];
  v10[0] = *a1;
  v10[1] = v7;
  sub_228F7656C((uint64_t)v10);
  sub_229040DB0();
  sub_228F75D98((uint64_t)v10);
  double result = v9;
  *a2 = v9;
  return result;
}

uint64_t sub_22902AC3C(uint64_t a1, _OWORD *a2)
{
  long long v2 = a2[7];
  v8[6] = a2[6];
  v8[7] = v2;
  long long v3 = a2[9];
  v8[8] = a2[8];
  v8[9] = v3;
  long long v4 = a2[3];
  v8[2] = a2[2];
  v8[3] = v4;
  long long v5 = a2[5];
  v8[4] = a2[4];
  v8[5] = v5;
  long long v6 = a2[1];
  v8[0] = *a2;
  v8[1] = v6;
  sub_228F7656C((uint64_t)v8);
  sub_229040DC0();
  return sub_228F75D98((uint64_t)v8);
}

uint64_t EventEntity.travelTime.setter()
{
  return sub_229040DC0();
}

uint64_t (*EventEntity.travelTime.modify(void *a1))()
{
  long long v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_229040DA0();
  return sub_228F74D10;
}

uint64_t EventEntity.$travelTime.getter()
{
  return sub_229040DD0();
}

double sub_22902AD64@<D0>(_OWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  long long v3 = a1[7];
  v14[6] = a1[6];
  v14[7] = v3;
  long long v4 = a1[9];
  v14[8] = a1[8];
  v14[9] = v4;
  long long v5 = a1[3];
  v14[2] = a1[2];
  v14[3] = v5;
  long long v6 = a1[5];
  v14[4] = a1[4];
  v14[5] = v6;
  long long v7 = a1[1];
  v14[0] = *a1;
  v14[1] = v7;
  sub_228F7656C((uint64_t)v14);
  sub_229040DB0();
  sub_228F75D98((uint64_t)v14);
  *a2 = v9;
  a2[1] = v10;
  a2[2] = v11;
  a2[3] = v12;
  double result = *(double *)&v13;
  a2[4] = v13;
  return result;
}

uint64_t sub_22902ADF0(uint64_t *a1, _OWORD *a2)
{
  uint64_t v2 = *a1;
  long long v3 = a2[7];
  v9[6] = a2[6];
  v9[7] = v3;
  long long v4 = a2[9];
  v9[8] = a2[8];
  v9[9] = v4;
  long long v5 = a2[3];
  v9[2] = a2[2];
  v9[3] = v5;
  long long v6 = a2[5];
  v9[4] = a2[4];
  v9[5] = v6;
  long long v7 = a2[1];
  v9[0] = *a2;
  v9[1] = v7;
  sub_228FCB9A0(v2);
  sub_228F7656C((uint64_t)v9);
  sub_229040DC0();
  return sub_228F75D98((uint64_t)v9);
}

uint64_t EventEntity.calendar.setter()
{
  return sub_229040DC0();
}

uint64_t (*EventEntity.calendar.modify(void *a1))()
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_229040DA0();
  return sub_228F74D10;
}

uint64_t EventEntity.$calendar.getter()
{
  return sub_229040DD0();
}

uint64_t EventEntity.privacyLevel.getter()
{
  return sub_229040DB0();
}

uint64_t sub_22902AF7C@<X0>(_OWORD *a1@<X0>, unsigned char *a2@<X8>)
{
  long long v3 = a1[7];
  v10[6] = a1[6];
  v10[7] = v3;
  long long v4 = a1[9];
  v10[8] = a1[8];
  v10[9] = v4;
  long long v5 = a1[3];
  v10[2] = a1[2];
  v10[3] = v5;
  long long v6 = a1[5];
  v10[4] = a1[4];
  v10[5] = v6;
  long long v7 = a1[1];
  v10[0] = *a1;
  v10[1] = v7;
  sub_228F7656C((uint64_t)v10);
  sub_229040DB0();
  uint64_t result = sub_228F75D98((uint64_t)v10);
  *a2 = v9;
  return result;
}

uint64_t sub_22902AFF4(uint64_t a1, _OWORD *a2)
{
  long long v2 = a2[7];
  v8[6] = a2[6];
  v8[7] = v2;
  long long v3 = a2[9];
  v8[8] = a2[8];
  v8[9] = v3;
  long long v4 = a2[3];
  v8[2] = a2[2];
  v8[3] = v4;
  long long v5 = a2[5];
  v8[4] = a2[4];
  v8[5] = v5;
  long long v6 = a2[1];
  v8[0] = *a2;
  v8[1] = v6;
  sub_228F7656C((uint64_t)v8);
  sub_229040DC0();
  return sub_228F75D98((uint64_t)v8);
}

uint64_t EventEntity.privacyLevel.setter()
{
  return sub_229040DC0();
}

uint64_t (*EventEntity.privacyLevel.modify(void *a1))()
{
  long long v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_229040DA0();
  return sub_228F74D10;
}

uint64_t EventEntity.$privacyLevel.getter()
{
  return sub_229040DD0();
}

uint64_t EventEntity.status.getter()
{
  return sub_229040DB0();
}

uint64_t sub_22902B144@<X0>(_OWORD *a1@<X0>, unsigned char *a2@<X8>)
{
  long long v3 = a1[7];
  v10[6] = a1[6];
  v10[7] = v3;
  long long v4 = a1[9];
  v10[8] = a1[8];
  v10[9] = v4;
  long long v5 = a1[3];
  v10[2] = a1[2];
  v10[3] = v5;
  long long v6 = a1[5];
  v10[4] = a1[4];
  v10[5] = v6;
  long long v7 = a1[1];
  v10[0] = *a1;
  v10[1] = v7;
  sub_228F7656C((uint64_t)v10);
  sub_229040DB0();
  uint64_t result = sub_228F75D98((uint64_t)v10);
  *a2 = v9;
  return result;
}

uint64_t sub_22902B1BC(uint64_t a1, _OWORD *a2)
{
  long long v2 = a2[7];
  v8[6] = a2[6];
  v8[7] = v2;
  long long v3 = a2[9];
  v8[8] = a2[8];
  v8[9] = v3;
  long long v4 = a2[3];
  v8[2] = a2[2];
  v8[3] = v4;
  long long v5 = a2[5];
  v8[4] = a2[4];
  v8[5] = v5;
  long long v6 = a2[1];
  v8[0] = *a2;
  v8[1] = v6;
  sub_228F7656C((uint64_t)v8);
  sub_229040DC0();
  return sub_228F75D98((uint64_t)v8);
}

uint64_t EventEntity.status.setter()
{
  return sub_229040DC0();
}

uint64_t (*EventEntity.status.modify(void *a1))()
{
  long long v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_229040DA0();
  return sub_228F74D10;
}

uint64_t EventEntity.$status.getter()
{
  return sub_229040DD0();
}

uint64_t EventEntity.alarms.getter()
{
  sub_229040DB0();
  return v1;
}

uint64_t sub_22902B31C@<X0>(_OWORD *a1@<X0>, void *a2@<X8>)
{
  long long v3 = a1[7];
  v10[6] = a1[6];
  v10[7] = v3;
  long long v4 = a1[9];
  v10[8] = a1[8];
  v10[9] = v4;
  long long v5 = a1[3];
  v10[2] = a1[2];
  v10[3] = v5;
  long long v6 = a1[5];
  v10[4] = a1[4];
  v10[5] = v6;
  long long v7 = a1[1];
  v10[0] = *a1;
  v10[1] = v7;
  sub_228F7656C((uint64_t)v10);
  sub_229040DB0();
  uint64_t result = sub_228F75D98((uint64_t)v10);
  *a2 = v9;
  return result;
}

uint64_t sub_22902B394(uint64_t a1, _OWORD *a2)
{
  long long v2 = a2[7];
  v8[6] = a2[6];
  v8[7] = v2;
  long long v3 = a2[9];
  v8[8] = a2[8];
  v8[9] = v3;
  long long v4 = a2[3];
  v8[2] = a2[2];
  v8[3] = v4;
  long long v5 = a2[5];
  v8[4] = a2[4];
  v8[5] = v5;
  long long v6 = a2[1];
  v8[0] = *a2;
  v8[1] = v6;
  sub_229041250();
  sub_228F7656C((uint64_t)v8);
  sub_229040DC0();
  return sub_228F75D98((uint64_t)v8);
}

uint64_t EventEntity.alarms.setter()
{
  return sub_229040DC0();
}

uint64_t (*EventEntity.alarms.modify(void *a1))()
{
  long long v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_229040DA0();
  return sub_228F74D10;
}

uint64_t EventEntity.$alarms.getter()
{
  return sub_229040DD0();
}

uint64_t EventEntity.notes.getter()
{
  sub_229040DB0();
  return v1;
}

double sub_22902B4F4@<D0>(_OWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  long long v3 = a1[7];
  v10[6] = a1[6];
  v10[7] = v3;
  long long v4 = a1[9];
  v10[8] = a1[8];
  v10[9] = v4;
  long long v5 = a1[3];
  v10[2] = a1[2];
  v10[3] = v5;
  long long v6 = a1[5];
  v10[4] = a1[4];
  v10[5] = v6;
  long long v7 = a1[1];
  v10[0] = *a1;
  v10[1] = v7;
  sub_228F7656C((uint64_t)v10);
  sub_229040DB0();
  sub_228F75D98((uint64_t)v10);
  double result = *(double *)&v9;
  *a2 = v9;
  return result;
}

uint64_t sub_22902B568(uint64_t a1, _OWORD *a2)
{
  long long v2 = a2[7];
  v8[6] = a2[6];
  v8[7] = v2;
  long long v3 = a2[9];
  v8[8] = a2[8];
  v8[9] = v3;
  long long v4 = a2[3];
  v8[2] = a2[2];
  v8[3] = v4;
  long long v5 = a2[5];
  v8[4] = a2[4];
  v8[5] = v5;
  long long v6 = a2[1];
  v8[0] = *a2;
  v8[1] = v6;
  sub_229041250();
  sub_228F7656C((uint64_t)v8);
  sub_229040DC0();
  return sub_228F75D98((uint64_t)v8);
}

uint64_t EventEntity.notes.setter()
{
  return sub_229040DC0();
}

uint64_t (*EventEntity.notes.modify(void *a1))()
{
  long long v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_229040DA0();
  return sub_228F74D10;
}

uint64_t EventEntity.$notes.getter()
{
  return sub_229040DD0();
}

uint64_t EventEntity.availability.getter()
{
  return sub_229040DB0();
}

uint64_t sub_22902B6B4@<X0>(_OWORD *a1@<X0>, unsigned char *a2@<X8>)
{
  long long v3 = a1[7];
  v10[6] = a1[6];
  v10[7] = v3;
  long long v4 = a1[9];
  v10[8] = a1[8];
  v10[9] = v4;
  long long v5 = a1[3];
  v10[2] = a1[2];
  v10[3] = v5;
  long long v6 = a1[5];
  v10[4] = a1[4];
  v10[5] = v6;
  long long v7 = a1[1];
  v10[0] = *a1;
  v10[1] = v7;
  sub_228F7656C((uint64_t)v10);
  sub_229040DB0();
  uint64_t result = sub_228F75D98((uint64_t)v10);
  *a2 = v9;
  return result;
}

uint64_t sub_22902B72C(uint64_t a1, _OWORD *a2)
{
  long long v2 = a2[7];
  v8[6] = a2[6];
  v8[7] = v2;
  long long v3 = a2[9];
  v8[8] = a2[8];
  v8[9] = v3;
  long long v4 = a2[3];
  v8[2] = a2[2];
  v8[3] = v4;
  long long v5 = a2[5];
  v8[4] = a2[4];
  v8[5] = v5;
  long long v6 = a2[1];
  v8[0] = *a2;
  v8[1] = v6;
  sub_228F7656C((uint64_t)v8);
  sub_229040DC0();
  return sub_228F75D98((uint64_t)v8);
}

uint64_t EventEntity.availability.setter()
{
  return sub_229040DC0();
}

uint64_t (*EventEntity.availability.modify(void *a1))()
{
  long long v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_229040DA0();
  return sub_228F74D10;
}

uint64_t EventEntity.$availability.getter()
{
  return sub_229040DD0();
}

uint64_t EventEntity.organizer.getter()
{
  return sub_229040DB0();
}

double sub_22902B87C@<D0>(_OWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  long long v3 = a1[7];
  v12[6] = a1[6];
  v12[7] = v3;
  long long v4 = a1[9];
  v12[8] = a1[8];
  v12[9] = v4;
  long long v5 = a1[3];
  void v12[2] = a1[2];
  v12[3] = v5;
  long long v6 = a1[5];
  v12[4] = a1[4];
  v12[5] = v6;
  long long v7 = a1[1];
  v12[0] = *a1;
  v12[1] = v7;
  sub_228F7656C((uint64_t)v12);
  sub_229040DB0();
  sub_228F75D98((uint64_t)v12);
  *a2 = v9;
  a2[1] = v10;
  double result = *(double *)&v11;
  a2[2] = v11;
  return result;
}

uint64_t sub_22902B8F8(uint64_t *a1, _OWORD *a2)
{
  uint64_t v2 = *a1;
  long long v3 = a2[7];
  v9[6] = a2[6];
  v9[7] = v3;
  long long v4 = a2[9];
  v9[8] = a2[8];
  v9[9] = v4;
  long long v5 = a2[3];
  v9[2] = a2[2];
  v9[3] = v5;
  long long v6 = a2[5];
  v9[4] = a2[4];
  v9[5] = v6;
  long long v7 = a2[1];
  v9[0] = *a2;
  v9[1] = v7;
  sub_229031DA4(v2);
  sub_228F7656C((uint64_t)v9);
  sub_229040DC0();
  return sub_228F75D98((uint64_t)v9);
}

uint64_t EventEntity.organizer.setter()
{
  return sub_229040DC0();
}

uint64_t (*EventEntity.organizer.modify(void *a1))()
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_229040DA0();
  return sub_228F74D10;
}

uint64_t EventEntity.$organizer.getter()
{
  return sub_229040DD0();
}

uint64_t EventEntity.url.getter()
{
  return sub_229040DB0();
}

uint64_t sub_22902BA68(_OWORD *a1)
{
  long long v1 = a1[7];
  v7[6] = a1[6];
  v7[7] = v1;
  long long v2 = a1[9];
  v7[8] = a1[8];
  v7[9] = v2;
  long long v3 = a1[3];
  v7[2] = a1[2];
  v7[3] = v3;
  long long v4 = a1[5];
  v7[4] = a1[4];
  v7[5] = v4;
  long long v5 = a1[1];
  v7[0] = *a1;
  v7[1] = v5;
  sub_228F7656C((uint64_t)v7);
  sub_229040DB0();
  return sub_228F75D98((uint64_t)v7);
}

uint64_t sub_22902BAD4(uint64_t a1, _OWORD *a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AF65A20);
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  long long v7 = (char *)v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  long long v9 = (char *)v16 - v8;
  sub_228F87874(a1, (uint64_t)v16 - v8, (uint64_t *)&unk_26AF65A20);
  long long v10 = a2[7];
  v16[6] = a2[6];
  v16[7] = v10;
  long long v11 = a2[9];
  v16[8] = a2[8];
  v16[9] = v11;
  long long v12 = a2[3];
  v16[2] = a2[2];
  v16[3] = v12;
  long long v13 = a2[5];
  v16[4] = a2[4];
  v16[5] = v13;
  long long v14 = a2[1];
  v16[0] = *a2;
  v16[1] = v14;
  sub_228F87874((uint64_t)v9, (uint64_t)v7, (uint64_t *)&unk_26AF65A20);
  sub_228F7656C((uint64_t)v16);
  sub_229040DC0();
  sub_228F878D8((uint64_t)v9, (uint64_t *)&unk_26AF65A20);
  return sub_228F75D98((uint64_t)v16);
}

uint64_t EventEntity.url.setter(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AF65A20);
  MEMORY[0x270FA5388](v2 - 8);
  sub_228F87874(a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t *)&unk_26AF65A20);
  sub_229040DC0();
  return sub_228F878D8(a1, (uint64_t *)&unk_26AF65A20);
}

uint64_t (*EventEntity.url.modify(void *a1))()
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_229040DA0();
  return sub_228F74D10;
}

uint64_t EventEntity.$url.getter()
{
  return sub_229040DD0();
}

double EventEntity.init(_:)@<D0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v189 = a1;
  v184 = a2;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AF65A20);
  uint64_t v3 = MEMORY[0x270FA5388](v2 - 8);
  uint64_t v183 = (uint64_t)&v163 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  v182 = (char *)&v163 - v5;
  uint64_t v6 = sub_229041CB0();
  uint64_t v180 = *(void *)(v6 - 8);
  uint64_t v181 = v6;
  uint64_t v7 = MEMORY[0x270FA5388](v6);
  v166 = (char *)&v163 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  v167 = (char *)&v163 - v9;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2682B7DC8);
  uint64_t v11 = MEMORY[0x270FA5388](v10 - 8);
  uint64_t v179 = (uint64_t)&v163 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v188 = (uint64_t)&v163 - v13;
  uint64_t v208 = sub_229041920();
  uint64_t v163 = *(void *)(v208 - 8);
  MEMORY[0x270FA5388](v208);
  v207 = (char *)&v163 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_229041C40();
  uint64_t v177 = *(void *)(v15 - 8);
  uint64_t v178 = v15;
  uint64_t v16 = MEMORY[0x270FA5388](v15);
  v164 = (char *)&v163 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  v165 = (char *)&v163 - v18;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2682B7DD0);
  uint64_t v20 = MEMORY[0x270FA5388](v19 - 8);
  v176 = (char *)&v163 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v20);
  uint64_t v185 = (uint64_t)&v163 - v22;
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AF65A30);
  uint64_t v24 = MEMORY[0x270FA5388](v23 - 8);
  v175 = (char *)&v163 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v24);
  v170 = (char *)&v163 - v26;
  uint64_t v27 = sub_2290415E0();
  uint64_t v173 = *(void *)(v27 - 8);
  uint64_t v174 = v27;
  uint64_t v28 = MEMORY[0x270FA5388](v27);
  v172 = (char *)&v163 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v28);
  v171 = (char *)&v163 - v30;
  uint64_t v31 = sub_2290414D0();
  uint64_t v191 = v31;
  uint64_t v32 = *(void *)(v31 - 8);
  MEMORY[0x270FA5388](v31);
  v34 = (char *)&v163 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = sub_229041610();
  MEMORY[0x270FA5388](v35 - 8);
  uint64_t v36 = sub_229042290();
  MEMORY[0x270FA5388](v36 - 8);
  uint64_t v37 = sub_2290414E0();
  MEMORY[0x270FA5388](v37 - 8);
  v39 = (char *)&v163 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AF659A0);
  sub_229042210();
  sub_229041600();
  uint64_t v40 = *MEMORY[0x263F06D18];
  v41 = *(void (**)(char *, uint64_t, uint64_t))(v32 + 104);
  uint64_t v197 = v32 + 104;
  v41(v34, v40, v31);
  sub_2290414F0();
  uint64_t v187 = MEMORY[0x22A6AE210](v39);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF65928);
  sub_229040F70();
  sub_229042210();
  sub_229041600();
  LODWORD(v209) = v40;
  uint64_t v42 = v191;
  v41(v34, v40, v191);
  sub_2290414F0();
  uint64_t v186 = MEMORY[0x22A6AE200](v39);
  sub_229040F70();
  sub_229042210();
  sub_229041600();
  uint64_t v43 = v40;
  uint64_t v44 = v42;
  v41(v34, v43, v42);
  v206 = v41;
  sub_2290414F0();
  uint64_t v196 = MEMORY[0x22A6AE200](v39);
  uint64_t v205 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AF659E0);
  sub_229040F70();
  sub_229042210();
  sub_229041600();
  v45 = v34;
  v46 = v34;
  uint64_t v47 = v209;
  v41(v46, v209, v42);
  sub_2290414F0();
  uint64_t v195 = MEMORY[0x22A6AE220](v39);
  uint64_t v199 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF659B0);
  sub_229040F70();
  sub_229042210();
  sub_229041600();
  v48 = v206;
  v206(v45, v47, v42);
  v190 = v39;
  sub_2290414F0();
  uint64_t v194 = MEMORY[0x22A6AE210](v39);
  sub_229040F70();
  sub_229042210();
  sub_229041600();
  uint64_t v49 = v209;
  v48(v45, v209, v42);
  v50 = v190;
  sub_2290414F0();
  uint64_t v193 = MEMORY[0x22A6AE210](v50);
  sub_229040F70();
  sub_229042210();
  sub_229041600();
  v48(v45, v49, v44);
  sub_2290414F0();
  uint64_t v192 = MEMORY[0x22A6AE220](v50);
  sub_229040F70();
  sub_229042210();
  sub_229041600();
  v48(v45, v49, v44);
  v51 = v190;
  sub_2290414F0();
  uint64_t v205 = MEMORY[0x22A6AE210](v51);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF659F0);
  sub_229040F70();
  sub_229042210();
  sub_229041600();
  uint64_t v52 = v209;
  v48(v45, v209, v44);
  sub_2290414F0();
  uint64_t v204 = MEMORY[0x22A6AE230](v51);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF65998);
  sub_229040F70();
  sub_229042210();
  sub_229041600();
  uint64_t v53 = v52;
  v54 = v206;
  v206(v45, v53, v44);
  sub_2290414F0();
  unint64_t v55 = sub_228FA7FCC();
  uint64_t v203 = MEMORY[0x22A6AE1E0](v51, v55);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AF65968);
  sub_229040F70();
  sub_229042210();
  sub_229041600();
  v54(v45, v209, v44);
  v56 = v54;
  sub_2290414F0();
  unint64_t v57 = sub_228FC7B9C();
  uint64_t v202 = MEMORY[0x22A6AE1D0](v51, v57);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2682B7DD8);
  sub_229040F70();
  sub_229042210();
  sub_229041600();
  uint64_t v58 = v209;
  v56(v45, v209, v44);
  v59 = v190;
  sub_2290414F0();
  unint64_t v60 = sub_228FC7BF0();
  uint64_t v201 = MEMORY[0x22A6AE1D0](v59, v60);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF659C8);
  sub_229040F70();
  sub_229042210();
  sub_229041600();
  uint64_t v61 = v191;
  v62 = v206;
  v206(v45, v58, v191);
  sub_2290414F0();
  unint64_t v63 = sub_228FC7CF8();
  uint64_t v200 = MEMORY[0x22A6AE1E0](v59, v63);
  sub_229040F70();
  sub_229042210();
  sub_229041600();
  v62(v45, v58, v61);
  sub_2290414F0();
  uint64_t v199 = MEMORY[0x22A6AE210](v59);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AF65958);
  sub_229040F70();
  sub_229042210();
  sub_229041600();
  uint64_t v64 = v191;
  v62(v45, v58, v191);
  sub_2290414F0();
  unint64_t v65 = sub_228FC7C44();
  uint64_t v198 = MEMORY[0x22A6AE1D0](v59, v65);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF65938);
  sub_229040F70();
  sub_229042210();
  sub_229041600();
  v66 = v206;
  v206(v45, v58, v64);
  sub_2290414F0();
  unint64_t v67 = sub_228F7F438();
  uint64_t v68 = MEMORY[0x22A6AE1E0](v59, v67);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF65920);
  sub_229040F70();
  sub_229042210();
  sub_229041600();
  v66(v45, v209, v64);
  sub_2290414F0();
  uint64_t v69 = MEMORY[0x22A6AE1F0](v59);
  sub_229040F70();
  uint64_t v70 = sub_2290419A0();
  v72 = v71;
  sub_229041250();
  char v73 = sub_229041990();
  uint64_t v169 = v70;
  *(void *)&long long v233 = v70;
  *((void *)&v233 + 1) = v72;
  v190 = v72;
  int v168 = v73 & 1;
  LOBYTE(v234) = v73 & 1;
  *((void *)&v234 + 1) = v187;
  *(void *)&long long v235 = v186;
  *((void *)&v235 + 1) = v196;
  *(void *)&long long v236 = v195;
  *((void *)&v236 + 1) = v194;
  *(void *)&long long v237 = v193;
  *((void *)&v237 + 1) = v192;
  *(void *)&long long v238 = v205;
  *((void *)&v238 + 1) = v204;
  *(void *)&long long v239 = v203;
  *((void *)&v239 + 1) = v202;
  *(void *)&long long v240 = v201;
  *((void *)&v240 + 1) = v200;
  *(void *)&long long v241 = v199;
  *((void *)&v241 + 1) = v198;
  *(void *)&long long v242 = v68;
  uint64_t v197 = v68;
  uint64_t v191 = v69;
  *((void *)&v242 + 1) = v69;
  sub_228F7656C((uint64_t)&v233);
  uint64_t v213 = sub_2290419D0();
  v214 = v74;
  sub_229040DC0();
  sub_228F75D98((uint64_t)&v233);
  sub_228F7656C((uint64_t)&v233);
  v75 = v171;
  sub_229041A50();
  v77 = v172;
  uint64_t v76 = v173;
  v78 = *(void (**)(char *, char *, uint64_t))(v173 + 16);
  uint64_t v79 = v174;
  v78(v172, v75, v174);
  sub_229040DC0();
  v80 = *(void (**)(char *, uint64_t))(v76 + 8);
  v80(v75, v79);
  sub_228F75D98((uint64_t)&v233);
  sub_228F7656C((uint64_t)&v233);
  sub_229041A00();
  v78(v77, v75, v79);
  sub_229040DC0();
  v80(v75, v79);
  sub_228F75D98((uint64_t)&v233);
  sub_228F7656C((uint64_t)&v233);
  LOBYTE(v213) = sub_229041A20() & 1;
  sub_229040DC0();
  sub_228F75D98((uint64_t)&v233);
  sub_228F7656C((uint64_t)&v233);
  uint64_t v81 = (uint64_t)v170;
  sub_229041980();
  uint64_t v82 = sub_2290416A0();
  uint64_t v83 = *(void *)(v82 - 8);
  v84 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v83 + 48);
  uint64_t v85 = v81;
  if (v84(v81, 1, v82) == 1)
  {
    sub_228F878D8(v81, (uint64_t *)&unk_26AF65A30);
    uint64_t v86 = 0;
    v87 = 0;
  }
  else
  {
    uint64_t v86 = sub_229041660();
    v87 = v88;
    (*(void (**)(uint64_t, uint64_t))(v83 + 8))(v85, v82);
  }
  uint64_t v213 = v86;
  v214 = v87;
  sub_229040DC0();
  sub_228F75D98((uint64_t)&v233);
  sub_228F7656C((uint64_t)&v233);
  uint64_t v89 = (uint64_t)v175;
  sub_229041950();
  if (v84(v89, 1, v82) == 1)
  {
    sub_228F878D8(v89, (uint64_t *)&unk_26AF65A30);
    uint64_t v90 = 0;
    v91 = 0;
  }
  else
  {
    uint64_t v90 = sub_229041660();
    v91 = v92;
    (*(void (**)(uint64_t, uint64_t))(v83 + 8))(v89, v82);
  }
  uint64_t v93 = (uint64_t)v176;
  uint64_t v213 = v90;
  v214 = v91;
  sub_229040DC0();
  sub_228F75D98((uint64_t)&v233);
  sub_228F7656C((uint64_t)&v233);
  LOBYTE(v213) = sub_229041930() & 1;
  sub_229040DC0();
  sub_228F75D98((uint64_t)&v233);
  sub_228F7656C((uint64_t)&v233);
  uint64_t v213 = sub_229041A30();
  v214 = v94;
  sub_229040DC0();
  sub_228F75D98((uint64_t)&v233);
  sub_228F7656C((uint64_t)&v233);
  sub_229041940();
  uint64_t v213 = v95;
  sub_229040DC0();
  sub_228F75D98((uint64_t)&v233);
  sub_228F7656C((uint64_t)&v233);
  uint64_t v96 = v185;
  sub_229041A10();
  sub_228F87874(v96, v93, &qword_2682B7DD0);
  uint64_t v98 = v177;
  uint64_t v97 = v178;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v177 + 48))(v93, 1, v178) == 1)
  {
    uint64_t v99 = 0;
    *(void *)&long long v209 = 0;
    uint64_t v100 = 0;
    uint64_t v101 = 0;
    uint64_t v102 = 0;
    uint64_t v103 = 0;
    uint64_t v104 = 0;
    uint64_t v105 = 0;
    uint64_t v106 = 0;
    uint64_t v107 = 0;
  }
  else
  {
    v108 = v165;
    (*(void (**)(char *, uint64_t, uint64_t))(v98 + 32))(v165, v93, v97);
    uint64_t v109 = (uint64_t)v164;
    (*(void (**)(char *, char *, uint64_t))(v98 + 16))(v164, v108, v97);
    CalendarEntity.init(_:)(v109, &v213);
    uint64_t v110 = v98;
    *(void *)&long long v209 = v214;
    uint64_t v100 = v215;
    uint64_t v101 = v216;
    uint64_t v102 = v217;
    uint64_t v104 = v219;
    uint64_t v105 = v220;
    uint64_t v106 = v221;
    uint64_t v107 = v222;
    uint64_t v111 = 256;
    if (!BYTE1(v218)) {
      uint64_t v111 = 0;
    }
    uint64_t v112 = v111 | v218;
    uint64_t v113 = 0x10000;
    if (!BYTE2(v218)) {
      uint64_t v113 = 0;
    }
    uint64_t v114 = v97;
    uint64_t v103 = v112 | v113;
    v115 = v108;
    uint64_t v99 = v213;
    (*(void (**)(char *, uint64_t))(v110 + 8))(v115, v114);
  }
  sub_228F878D8(v185, &qword_2682B7DD0);
  uint64_t v213 = v99;
  v214 = (char *)v209;
  uint64_t v215 = v100;
  uint64_t v216 = v101;
  uint64_t v217 = v102;
  uint64_t v218 = v103;
  uint64_t v219 = v104;
  uint64_t v220 = v105;
  uint64_t v221 = v106;
  uint64_t v222 = v107;
  sub_229040DC0();
  sub_228F75D98((uint64_t)&v233);
  sub_228F7656C((uint64_t)&v233);
  uint64_t v116 = v189;
  unint64_t v117 = sub_229041970();
  if (v117 >= 4) {
    char v118 = 0;
  }
  else {
    char v118 = v117;
  }
  LOBYTE(v213) = v118;
  sub_229040DC0();
  sub_228F75D98((uint64_t)&v233);
  sub_228F7656C((uint64_t)&v233);
  unint64_t v119 = sub_2290419F0();
  if (v119 >= 4) {
    char v120 = 0;
  }
  else {
    char v120 = v119;
  }
  LOBYTE(v213) = v120;
  sub_229040DC0();
  sub_228F75D98((uint64_t)&v233);
  sub_228F7656C((uint64_t)&v233);
  uint64_t v121 = sub_2290419E0();
  if (v121)
  {
    uint64_t v122 = v121;
    int64_t v123 = *(void *)(v121 + 16);
    if (v123)
    {
      uint64_t v212 = MEMORY[0x263F8EE78];
      sub_228F8A1CC(0, v123, 0);
      v124 = *(void (**)(char *, uint64_t, uint64_t))(v163 + 16);
      uint64_t v125 = *(unsigned __int8 *)(v163 + 80);
      uint64_t v185 = v122;
      uint64_t v126 = v122 + ((v125 + 32) & ~v125);
      v206 = *(void (**)(char *, uint64_t, uint64_t))(v163 + 72);
      v127 = (void (**)(char *, uint64_t))(v163 + 8);
      do
      {
        v129 = v207;
        uint64_t v128 = v208;
        v124(v207, v126, v208);
        uint64_t v216 = v128;
        uint64_t v217 = MEMORY[0x263F30350];
        v130 = __swift_allocate_boxed_opaque_existential_1(&v213);
        v124((char *)v130, (uint64_t)v129, v128);
        AlarmEntity.init(_:)(&v213, (uint64_t *)&v210);
        (*v127)(v129, v128);
        long long v209 = v210;
        uint64_t v132 = v211;
        uint64_t v131 = v212;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_228F8A1CC(0, *(void *)(v131 + 16) + 1, 1);
          uint64_t v131 = v212;
        }
        unint64_t v134 = *(void *)(v131 + 16);
        unint64_t v133 = *(void *)(v131 + 24);
        if (v134 >= v133 >> 1)
        {
          sub_228F8A1CC(v133 > 1, v134 + 1, 1);
          uint64_t v131 = v212;
        }
        *(void *)(v131 + 16) = v134 + 1;
        uint64_t v135 = v131 + 24 * v134;
        *(_OWORD *)(v135 + 32) = v209;
        *(void *)(v135 + 48) = v132;
        v126 += (uint64_t)v206;
        --v123;
      }
      while (v123);
      swift_bridgeObjectRelease();
      uint64_t v116 = v189;
    }
    else
    {
      swift_bridgeObjectRelease();
      uint64_t v131 = MEMORY[0x263F8EE78];
    }
  }
  else
  {
    uint64_t v131 = 0;
  }
  uint64_t v213 = v131;
  sub_229040DC0();
  sub_228F75D98((uint64_t)&v233);
  sub_228F7656C((uint64_t)&v233);
  uint64_t v213 = sub_2290419C0();
  v214 = v136;
  sub_229040DC0();
  sub_228F75D98((uint64_t)&v233);
  sub_228F7656C((uint64_t)&v233);
  unint64_t v137 = sub_229041960();
  if (v137 < 4) {
    char v138 = v137 + 1;
  }
  else {
    char v138 = 0;
  }
  LOBYTE(v213) = v138;
  sub_229040DC0();
  sub_228F75D98((uint64_t)&v233);
  sub_228F7656C((uint64_t)&v233);
  uint64_t v139 = v188;
  sub_229041A40();
  uint64_t v140 = v139;
  uint64_t v141 = v179;
  sub_228F87874(v140, v179, &qword_2682B7DC8);
  uint64_t v143 = v180;
  uint64_t v142 = v181;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v180 + 48))(v141, 1, v181) == 1)
  {
    uint64_t v144 = 0;
    v145 = 0;
    uint64_t v146 = 0;
    uint64_t v147 = 0;
    uint64_t v148 = 0;
    uint64_t v149 = 0;
  }
  else
  {
    v150 = v167;
    (*(void (**)(char *, uint64_t, uint64_t))(v143 + 32))(v167, v141, v142);
    uint64_t v151 = (uint64_t)v166;
    (*(void (**)(char *, char *, uint64_t))(v143 + 16))(v166, v150, v142);
    ParticipantEntity.init(_:)(v151, &v213);
    v145 = v214;
    uint64_t v146 = v215;
    uint64_t v147 = v216;
    uint64_t v148 = v217;
    uint64_t v149 = v218;
    v152 = v150;
    uint64_t v144 = v213;
    (*(void (**)(char *, uint64_t))(v143 + 8))(v152, v142);
  }
  sub_228F878D8(v188, &qword_2682B7DC8);
  uint64_t v213 = v144;
  v214 = v145;
  uint64_t v215 = v146;
  uint64_t v216 = v147;
  uint64_t v217 = v148;
  uint64_t v218 = v149;
  sub_229040DC0();
  sub_228F75D98((uint64_t)&v233);
  sub_228F7656C((uint64_t)&v233);
  uint64_t v153 = (uint64_t)v182;
  sub_2290419B0();
  sub_228F87874(v153, v183, (uint64_t *)&unk_26AF65A20);
  uint64_t v154 = v191;
  sub_229040DC0();
  sub_228F878D8(v153, (uint64_t *)&unk_26AF65A20);
  uint64_t v155 = sub_229041A60();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v155 - 8) + 8))(v116, v155);
  uint64_t v213 = v169;
  v214 = v190;
  LOBYTE(v215) = v168;
  *(_DWORD *)((char *)&v215 + 1) = v210;
  HIDWORD(v215) = *(_DWORD *)((char *)&v210 + 3);
  uint64_t v216 = v187;
  uint64_t v217 = v186;
  uint64_t v218 = v196;
  uint64_t v219 = v195;
  uint64_t v220 = v194;
  uint64_t v221 = v193;
  uint64_t v222 = v192;
  uint64_t v223 = v205;
  uint64_t v224 = v204;
  uint64_t v225 = v203;
  uint64_t v226 = v202;
  uint64_t v227 = v201;
  uint64_t v228 = v200;
  uint64_t v229 = v199;
  uint64_t v230 = v198;
  uint64_t v231 = v197;
  uint64_t v232 = v154;
  sub_228F75D98((uint64_t)&v213);
  sub_228F75D98((uint64_t)&v233);
  sub_228F7656C((uint64_t)&v233);
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  long long v156 = v240;
  v157 = v184;
  v184[6] = v239;
  v157[7] = v156;
  long long v158 = v242;
  v157[8] = v241;
  v157[9] = v158;
  long long v159 = v236;
  v157[2] = v235;
  v157[3] = v159;
  long long v160 = v238;
  v157[4] = v237;
  v157[5] = v160;
  double result = *(double *)&v233;
  long long v162 = v234;
  _OWORD *v157 = v233;
  v157[1] = v162;
  return result;
}

CalendarLink::EventEntity::EventEntityStatus __swiftcall EventEntity.EventEntityStatus.init(_:)(EKEventStatus a1)
{
  if ((unint64_t)a1 >= 4) {
    char v2 = 0;
  }
  else {
    char v2 = a1;
  }
  *long long v1 = v2;
  return (char)a1;
}

CalendarLink::EventEntity::Availability __swiftcall EventEntity.Availability.init(_:)(EKEventAvailability a1)
{
  if ((unint64_t)a1 < 4) {
    char v2 = a1 + 1;
  }
  else {
    char v2 = 0;
  }
  *long long v1 = v2;
  return (char)a1;
}

uint64_t sub_22902D9E8@<X0>(void *a1@<X8>)
{
  if (qword_2682B4F88 != -1) {
    swift_once();
  }
  swift_beginAccess();
  *a1 = qword_2682B7D58;
  return sub_229040F70();
}

uint64_t sub_22902DA68()
{
  if (qword_26AF65DC8 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v0 = qword_26AF65E30;
  sub_229041250();
  return v0;
}

uint64_t sub_22902DAEC@<X0>(uint64_t a1@<X8>)
{
  return sub_228F930A0(&qword_2682B4F80, (uint64_t)qword_2682B7D40, a1);
}

uint64_t sub_22902DB10(uint64_t a1)
{
  unint64_t v2 = sub_228F74A44();
  return MEMORY[0x270EE0C68](a1, v2);
}

uint64_t sub_22902DB60(uint64_t a1)
{
  unint64_t v2 = sub_2290307F4();
  return MEMORY[0x270EE1D98](a1, v2);
}

uint64_t static EventEntity.updateIntent.getter()
{
  if (qword_2682B4F90 != -1) {
    return swift_once();
  }
  return result;
}

uint64_t static EventEntity.updateIntent.setter()
{
  if (qword_2682B4F90 != -1) {
    return swift_once();
  }
  return result;
}

uint64_t (*static EventEntity.updateIntent.modify())(void)
{
  if (qword_2682B4F90 != -1) {
    swift_once();
  }
  return nullsub_1;
}

ValueMetadata *sub_22902DC74()
{
  if (qword_2682B4F90 != -1) {
    swift_once();
  }
  return &type metadata for EditEventIntent;
}

uint64_t sub_22902DCC0()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF665B0);
  MEMORY[0x270FA5388](v0 - 8);
  v12[0] = (char *)v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_2290414D0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_229041610();
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v7 = sub_229042290();
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v8 = sub_2290414E0();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = sub_229041370();
  __swift_allocate_value_buffer(v10, qword_2682B7D60);
  __swift_project_value_buffer(v10, (uint64_t)qword_2682B7D60);
  sub_229042210();
  sub_229041600();
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x263F06D18], v2);
  sub_2290414F0();
  (*(void (**)(void, uint64_t, uint64_t, uint64_t))(v9 + 56))(v12[0], 1, 1, v8);
  return sub_229041360();
}

uint64_t static EventEntity.PrivacyLevel.typeDisplayRepresentation.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_228F92510(&qword_2682B4F98, (uint64_t)qword_2682B7D60, a1);
}

uint64_t sub_22902DFEC()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AF65A10);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v52 = (char *)&v34 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF665B0);
  MEMORY[0x270FA5388](v2 - 8);
  v46 = (char *)&v34 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v50 = sub_2290414D0();
  uint64_t v4 = *(void *)(v50 - 8);
  MEMORY[0x270FA5388](v50);
  uint64_t v6 = (char *)&v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_229041610();
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_229042290();
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v11 = sub_2290414E0();
  uint64_t v47 = v11;
  uint64_t v53 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  v39 = (char *)&v34 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2682B7EE8);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2682B7EF0);
  uint64_t v42 = v13;
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v43 = *(void *)(v14 + 72);
  unint64_t v15 = (*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  uint64_t v16 = swift_allocObject();
  uint64_t v38 = v16;
  *(_OWORD *)(v16 + 16) = xmmword_2290492B0;
  unint64_t v17 = v16 + v15;
  uint64_t v36 = (unsigned char *)(v16 + v15 + *(int *)(v13 + 48));
  *(unsigned char *)(v16 + v15) = 0;
  sub_229042210();
  sub_229041600();
  unsigned int v49 = *MEMORY[0x263F06D18];
  uint64_t v40 = *(void (**)(char *))(v4 + 104);
  uint64_t v41 = v4 + 104;
  uint64_t v18 = v50;
  v40(v6);
  uint64_t v19 = v6;
  sub_2290414F0();
  uint64_t v20 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v53 + 56);
  v53 += 56;
  v51 = v20;
  uint64_t v21 = v46;
  v20(v46, 1, 1, v11);
  uint64_t v48 = sub_229041180();
  uint64_t v22 = *(void *)(v48 - 8);
  uint64_t v44 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v22 + 56);
  uint64_t v45 = v22 + 56;
  v44(v52, 1, 1, v48);
  sub_2290411B0();
  uint64_t v23 = v42;
  uint64_t v24 = v43;
  uint64_t v36 = (unsigned char *)(v17 + v43 + *(int *)(v42 + 48));
  *(unsigned char *)(v17 + v43) = 1;
  sub_229042210();
  v34 = v9;
  sub_229041600();
  uint64_t v35 = v19;
  uint64_t v25 = v19;
  uint64_t v26 = v40;
  ((void (*)(char *, void, uint64_t))v40)(v25, v49, v18);
  sub_2290414F0();
  v51(v21, 1, 1, v47);
  v44(v52, 1, 1, v48);
  sub_2290411B0();
  uint64_t v27 = (unsigned char *)(v17 + 2 * v24);
  uint64_t v36 = &v27[*(int *)(v23 + 48)];
  unint64_t v37 = v17;
  *uint64_t v27 = 2;
  sub_229042210();
  sub_229041600();
  uint64_t v28 = v35;
  ((void (*)(char *, void, uint64_t))v26)(v35, v49, v50);
  sub_2290414F0();
  uint64_t v29 = v46;
  v51(v46, 1, 1, v47);
  uint64_t v30 = v52;
  uint64_t v31 = v44;
  v44(v52, 1, 1, v48);
  sub_2290411B0();
  *(unsigned char *)(v17 + 2 * v24 + v43) = 3;
  sub_229042210();
  sub_229041600();
  ((void (*)(char *, void, uint64_t))v40)(v28, v49, v50);
  sub_2290414F0();
  v51(v29, 1, 1, v47);
  v31(v30, 1, 1, v48);
  sub_2290411B0();
  unint64_t v32 = sub_229031E74(v38, &qword_2682B7EF0, &qword_2682B7EF8, sub_228FC7EAC);
  swift_setDeallocating();
  swift_arrayDestroy();
  uint64_t result = swift_deallocClassInstance();
  qword_2682B7D78 = v32;
  return result;
}

uint64_t static EventEntity.PrivacyLevel.caseDisplayRepresentations.getter()
{
  return sub_228F92EE4(&qword_2682B4FA0);
}

uint64_t static EventEntity.PrivacyLevel.caseDisplayRepresentations.setter(uint64_t a1)
{
  return sub_228F92F64(a1, &qword_2682B4FA0, &qword_2682B7D78);
}

uint64_t (*static EventEntity.PrivacyLevel.caseDisplayRepresentations.modify())()
{
  if (qword_2682B4FA0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void *static EventEntity.PrivacyLevel.allCases.getter()
{
  return &unk_26DD51710;
}

uint64_t sub_22902E894@<X0>(uint64_t a1@<X8>)
{
  return sub_228F930A0(&qword_2682B4F98, (uint64_t)qword_2682B7D60, a1);
}

uint64_t sub_22902E8B8(uint64_t a1)
{
  unint64_t v2 = sub_228FC7B9C();
  return MEMORY[0x270EE0C40](a1, v2);
}

uint64_t sub_22902E904(uint64_t a1, uint64_t a2)
{
  return sub_228F931AC(a1, a2, &qword_2682B4FA0);
}

uint64_t sub_22902E928(uint64_t a1)
{
  unint64_t v2 = sub_229030BA0();
  return MEMORY[0x270EE1C28](a1, v2);
}

void sub_22902E974(void *a1@<X8>)
{
  *a1 = &unk_26DD517C8;
}

uint64_t sub_22902E984()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF665B0);
  MEMORY[0x270FA5388](v0 - 8);
  v12[0] = (char *)v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_2290414D0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_229041610();
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v7 = sub_229042290();
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v8 = sub_2290414E0();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = sub_229041370();
  __swift_allocate_value_buffer(v10, qword_2682B7D80);
  __swift_project_value_buffer(v10, (uint64_t)qword_2682B7D80);
  sub_229042210();
  sub_229041600();
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x263F06D18], v2);
  sub_2290414F0();
  (*(void (**)(void, uint64_t, uint64_t, uint64_t))(v9 + 56))(v12[0], 1, 1, v8);
  return sub_229041360();
}

uint64_t static EventEntity.EventEntityStatus.typeDisplayRepresentation.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_228F92510(&qword_2682B4FA8, (uint64_t)qword_2682B7D80, a1);
}

uint64_t sub_22902ECA0()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AF65A10);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v48 = (char *)v35 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF665B0);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)v35 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v51 = sub_2290414D0();
  uint64_t v5 = *(void *)(v51 - 8);
  MEMORY[0x270FA5388](v51);
  uint64_t v7 = (char *)v35 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_229041610();
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)v35 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_229042290();
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v47 = sub_2290414E0();
  uint64_t v53 = *(void *)(v47 - 8);
  MEMORY[0x270FA5388](v47);
  uint64_t v13 = (char *)v35 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2682B7ED0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2682B7ED8);
  uint64_t v52 = v14;
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v44 = *(void *)(v15 + 72);
  unint64_t v16 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  uint64_t v17 = swift_allocObject();
  *(_OWORD *)(v17 + 16) = xmmword_2290492B0;
  uint64_t v18 = *(int *)(v14 + 48);
  unint64_t v43 = v17 + v16;
  uint64_t v36 = (unsigned char *)(v17 + v16 + v18);
  uint64_t v37 = v17;
  *(unsigned char *)(v17 + v16) = 0;
  sub_229042210();
  sub_229041600();
  unsigned int v46 = *MEMORY[0x263F06D18];
  uint64_t v41 = *(void (**)(char *))(v5 + 104);
  uint64_t v42 = v5 + 104;
  uint64_t v19 = v51;
  v41(v7);
  sub_2290414F0();
  uint64_t v50 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v53 + 56);
  v53 += 56;
  v39 = v4;
  uint64_t v20 = v47;
  v50(v4, 1, 1, v47);
  uint64_t v40 = sub_229041180();
  uint64_t v21 = *(void *)(v40 - 8);
  uint64_t v45 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v21 + 56);
  uint64_t v49 = v21 + 56;
  v45(v48, 1, 1, v40);
  sub_2290411B0();
  unint64_t v23 = v43;
  uint64_t v22 = v44;
  uint64_t v36 = (unsigned char *)(v43 + v44 + *(int *)(v52 + 48));
  *(unsigned char *)(v43 + v44) = 1;
  sub_229042210();
  v35[1] = v10;
  sub_229041600();
  uint64_t v38 = v7;
  uint64_t v24 = v7;
  uint64_t v25 = v41;
  ((void (*)(char *, void, uint64_t))v41)(v24, v46, v19);
  v35[0] = v13;
  sub_2290414F0();
  v50(v39, 1, 1, v20);
  uint64_t v26 = v40;
  v45(v48, 1, 1, v40);
  sub_2290411B0();
  uint64_t v27 = 2 * v22;
  uint64_t v28 = (unsigned char *)(v23 + 2 * v22);
  uint64_t v36 = &v28[*(int *)(v52 + 48)];
  *uint64_t v28 = 2;
  sub_229042210();
  sub_229041600();
  uint64_t v29 = v46;
  ((void (*)(char *, void, uint64_t))v25)(v38, v46, v51);
  sub_2290414F0();
  uint64_t v30 = v39;
  v50(v39, 1, 1, v47);
  uint64_t v31 = v48;
  unint64_t v32 = v45;
  v45(v48, 1, 1, v26);
  sub_2290411B0();
  *(unsigned char *)(v43 + v27 + v44) = 3;
  sub_229042210();
  sub_229041600();
  ((void (*)(char *, uint64_t, uint64_t))v41)(v38, v29, v51);
  sub_2290414F0();
  v50(v30, 1, 1, v47);
  v32(v31, 1, 1, v40);
  sub_2290411B0();
  unint64_t v33 = sub_229031E74(v37, &qword_2682B7ED8, &qword_2682B7EE0, sub_228FC7EAC);
  swift_setDeallocating();
  swift_arrayDestroy();
  uint64_t result = swift_deallocClassInstance();
  qword_2682B7D98 = v33;
  return result;
}

uint64_t static EventEntity.EventEntityStatus.caseDisplayRepresentations.getter()
{
  return sub_228F92EE4(&qword_2682B4FB0);
}

uint64_t static EventEntity.EventEntityStatus.caseDisplayRepresentations.setter(uint64_t a1)
{
  return sub_228F92F64(a1, &qword_2682B4FB0, &qword_2682B7D98);
}

uint64_t (*static EventEntity.EventEntityStatus.caseDisplayRepresentations.modify())()
{
  if (qword_2682B4FB0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j__swift_endAccess;
}

CalendarLink::EventEntity::EventEntityStatus_optional __swiftcall EventEntity.EventEntityStatus.init(rawValue:)(Swift::Int rawValue)
{
  char v2 = 4;
  if ((unint64_t)rawValue < 4) {
    char v2 = rawValue;
  }
  *uint64_t v1 = v2;
  return (CalendarLink::EventEntity::EventEntityStatus_optional)rawValue;
}

void *static EventEntity.EventEntityStatus.allCases.getter()
{
  return &unk_26DD537C0;
}

CalendarLink::EventEntity::EventEntityStatus_optional sub_22902F57C(Swift::Int *a1)
{
  return EventEntity.EventEntityStatus.init(rawValue:)(*a1);
}

uint64_t sub_22902F584@<X0>(uint64_t a1@<X8>)
{
  return sub_228F930A0(&qword_2682B4FA8, (uint64_t)qword_2682B7D80, a1);
}

uint64_t sub_22902F5A8(uint64_t a1)
{
  unint64_t v2 = sub_228FC7BF0();
  return MEMORY[0x270EE0C40](a1, v2);
}

uint64_t sub_22902F5F4(uint64_t a1, uint64_t a2)
{
  return sub_228F931AC(a1, a2, &qword_2682B4FB0);
}

uint64_t sub_22902F618(uint64_t a1)
{
  unint64_t v2 = sub_229030F68();
  return MEMORY[0x270EE1C28](a1, v2);
}

void sub_22902F664(void *a1@<X8>)
{
  *a1 = &unk_26DD537E8;
}

uint64_t sub_22902F674()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF665B0);
  MEMORY[0x270FA5388](v0 - 8);
  v12[0] = (char *)v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_2290414D0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_229041610();
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v7 = sub_229042290();
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v8 = sub_2290414E0();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = sub_229041370();
  __swift_allocate_value_buffer(v10, qword_2682B7DA0);
  __swift_project_value_buffer(v10, (uint64_t)qword_2682B7DA0);
  sub_229042210();
  sub_229041600();
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x263F06D18], v2);
  sub_2290414F0();
  (*(void (**)(void, uint64_t, uint64_t, uint64_t))(v9 + 56))(v12[0], 1, 1, v8);
  return sub_229041360();
}

uint64_t static EventEntity.Availability.typeDisplayRepresentation.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_228F92510(&qword_2682B4FB8, (uint64_t)qword_2682B7DA0, a1);
}

uint64_t sub_22902F99C()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AF65A10);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v53 = (char *)v42 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF665B0);
  MEMORY[0x270FA5388](v2 - 8);
  unint64_t v57 = (char *)v42 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v56 = sub_2290414D0();
  uint64_t v4 = *(void *)(v56 - 8);
  MEMORY[0x270FA5388](v56);
  uint64_t v52 = (char *)v42 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_229041610();
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)v42 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_229042290();
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v63 = sub_2290414E0();
  uint64_t v10 = *(void *)(v63 - 8);
  MEMORY[0x270FA5388](v63);
  uint64_t v12 = (char *)v42 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2682B7EB0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2682B7EB8);
  uint64_t v67 = v13;
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v61 = *(void *)(v14 + 72);
  unint64_t v15 = (*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  uint64_t v49 = 4 * v61;
  uint64_t v16 = swift_allocObject();
  uint64_t v50 = v16;
  *(_OWORD *)(v16 + 16) = xmmword_2290448E0;
  unint64_t v17 = v16 + v15;
  uint64_t v48 = v16 + v15 + *(int *)(v13 + 48);
  *(unsigned char *)(v16 + v15) = 0;
  unint64_t v60 = v16 + v15;
  sub_229042210();
  v42[0] = v8;
  sub_229041600();
  unsigned int v62 = *MEMORY[0x263F06D18];
  uint64_t v18 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 104);
  uint64_t v51 = v4 + 104;
  v54 = v18;
  ((void (*)(char *))v18)(v52);
  sub_2290414F0();
  uint64_t v64 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56);
  uint64_t v65 = v10 + 56;
  uint64_t v19 = v57;
  uint64_t v20 = v63;
  v64(v57, 1, 1, v63);
  uint64_t v66 = sub_229041180();
  uint64_t v21 = *(void *)(v66 - 8);
  uint64_t v22 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v21 + 56);
  uint64_t v58 = v21 + 56;
  unint64_t v23 = v53;
  v22(v53, 1, 1, v66);
  v59 = v22;
  unint64_t v55 = v12;
  sub_2290411B0();
  uint64_t v48 = v17 + v61 + *(int *)(v67 + 48);
  *(unsigned char *)(v17 + v61) = 1;
  sub_229042210();
  sub_229041600();
  uint64_t v24 = v52;
  uint64_t v25 = v62;
  uint64_t v26 = v54;
  v54(v52, v62, v56);
  sub_2290414F0();
  uint64_t v27 = v20;
  uint64_t v28 = v65;
  v64(v19, 1, 1, v27);
  v22(v23, 1, 1, v66);
  uint64_t v47 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2682B57C0);
  uint64_t v29 = *(unsigned __int8 *)(v28 + 24);
  uint64_t v46 = ((v29 + 32) & ~v29) + *(void *)(v28 + 16);
  uint64_t v44 = (v29 + 32) & ~v29;
  uint64_t v45 = v29 | 7;
  uint64_t v30 = swift_allocObject();
  long long v43 = xmmword_229043680;
  *(_OWORD *)(v30 + 16) = xmmword_229043680;
  sub_229042210();
  sub_229041600();
  uint64_t v31 = v56;
  v26(v24, v25, v56);
  sub_2290414F0();
  unint64_t v32 = v57;
  unint64_t v33 = v53;
  sub_2290411A0();
  uint64_t v48 = 2 * v61;
  v34 = (unsigned char *)(v60 + 2 * v61);
  v42[1] = &v34[*(int *)(v67 + 48)];
  unsigned char *v34 = 2;
  sub_229042210();
  sub_229041600();
  uint64_t v35 = v54;
  v54(v24, v62, v31);
  sub_2290414F0();
  v64(v32, 1, 1, v63);
  v59(v33, 1, 1, v66);
  *(_OWORD *)(swift_allocObject() + 16) = v43;
  sub_229042210();
  sub_229041600();
  uint64_t v36 = v62;
  uint64_t v37 = v56;
  v35(v24, v62, v56);
  sub_2290414F0();
  uint64_t v38 = v57;
  sub_2290411A0();
  v39 = (unsigned char *)(v60 + v48 + v61);
  uint64_t v61 = (uint64_t)&v39[*(int *)(v67 + 48)];
  unsigned char *v39 = 3;
  sub_229042210();
  sub_229041600();
  v35(v24, v36, v37);
  sub_2290414F0();
  v64(v38, 1, 1, v63);
  v59(v33, 1, 1, v66);
  sub_2290411B0();
  uint64_t v61 = v60 + v49 + *(int *)(v67 + 48);
  *(unsigned char *)(v60 + v49) = 4;
  sub_229042210();
  sub_229041600();
  v54(v24, v62, v37);
  sub_2290414F0();
  v64(v38, 1, 1, v63);
  v59(v33, 1, 1, v66);
  sub_2290411B0();
  unint64_t v40 = sub_229031E74(v50, (uint64_t *)&unk_2682B7EB8, &qword_2682B7EC8, sub_228FC7EAC);
  swift_setDeallocating();
  swift_arrayDestroy();
  uint64_t result = swift_deallocClassInstance();
  qword_2682B7DB8 = v40;
  return result;
}

uint64_t static EventEntity.Availability.caseDisplayRepresentations.getter()
{
  return sub_228F92EE4(&qword_2682B4FC0);
}

uint64_t static EventEntity.Availability.caseDisplayRepresentations.setter(uint64_t a1)
{
  return sub_228F92F64(a1, &qword_2682B4FC0, &qword_2682B7DB8);
}

uint64_t (*static EventEntity.Availability.caseDisplayRepresentations.modify())()
{
  if (qword_2682B4FC0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

CalendarLink::EventEntity::Availability_optional __swiftcall EventEntity.Availability.init(rawValue:)(Swift::Int rawValue)
{
  char v2 = 5;
  if ((unint64_t)rawValue < 5) {
    char v2 = rawValue;
  }
  *uint64_t v1 = v2;
  return (CalendarLink::EventEntity::Availability_optional)rawValue;
}

void *static EventEntity.Availability.allCases.getter()
{
  return &unk_26DD51630;
}

CalendarLink::EventEntity::Availability_optional sub_229030594(Swift::Int *a1)
{
  return EventEntity.Availability.init(rawValue:)(*a1);
}

uint64_t sub_22903059C@<X0>(uint64_t a1@<X8>)
{
  return sub_228F930A0(&qword_2682B4FB8, (uint64_t)qword_2682B7DA0, a1);
}

uint64_t sub_2290305C0(uint64_t a1)
{
  unint64_t v2 = sub_228FC7C44();
  return MEMORY[0x270EE0C40](a1, v2);
}

uint64_t sub_22903060C(uint64_t a1, uint64_t a2)
{
  return sub_228F931AC(a1, a2, &qword_2682B4FC0);
}

uint64_t sub_229030630(uint64_t a1)
{
  unint64_t v2 = sub_229031330();
  return MEMORY[0x270EE1C28](a1, v2);
}

void sub_22903067C(void *a1@<X8>)
{
  *a1 = &unk_26DD516E8;
}

unint64_t sub_229030690()
{
  unint64_t result = qword_26AF66638;
  if (!qword_26AF66638)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AF66638);
  }
  return result;
}

unint64_t sub_2290306E8()
{
  unint64_t result = qword_26AF66670;
  if (!qword_26AF66670)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AF66670);
  }
  return result;
}

unint64_t sub_229030744()
{
  unint64_t result = qword_26AF66648;
  if (!qword_26AF66648)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AF66648);
  }
  return result;
}

unint64_t sub_22903079C()
{
  unint64_t result = qword_26AF66650;
  if (!qword_26AF66650)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AF66650);
  }
  return result;
}

unint64_t sub_2290307F4()
{
  unint64_t result = qword_26AF66660;
  if (!qword_26AF66660)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AF66660);
  }
  return result;
}

uint64_t sub_229030848()
{
  return sub_228F764D0(&qword_2682B7DE8, (uint64_t *)&unk_2682B7DF0);
}

unint64_t sub_229030888()
{
  unint64_t result = qword_26AF66668;
  if (!qword_26AF66668)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AF66668);
  }
  return result;
}

unint64_t sub_2290308E0()
{
  unint64_t result = qword_2682B7E10;
  if (!qword_2682B7E10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2682B7E10);
  }
  return result;
}

unint64_t sub_229030938()
{
  unint64_t result = qword_26AF661D8;
  if (!qword_26AF661D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AF661D8);
  }
  return result;
}

unint64_t sub_229030990()
{
  unint64_t result = qword_26AF66180;
  if (!qword_26AF66180)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AF66180);
  }
  return result;
}

unint64_t sub_2290309E8()
{
  unint64_t result = qword_26AF661A8;
  if (!qword_26AF661A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AF661A8);
  }
  return result;
}

unint64_t sub_229030A40()
{
  unint64_t result = qword_26AF661E0;
  if (!qword_26AF661E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AF661E0);
  }
  return result;
}

unint64_t sub_229030A98()
{
  unint64_t result = qword_26AF66198;
  if (!qword_26AF66198)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AF66198);
  }
  return result;
}

unint64_t sub_229030AF0()
{
  unint64_t result = qword_26AF661A0;
  if (!qword_26AF661A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AF661A0);
  }
  return result;
}

unint64_t sub_229030B48()
{
  unint64_t result = qword_26AF66188;
  if (!qword_26AF66188)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AF66188);
  }
  return result;
}

unint64_t sub_229030BA0()
{
  unint64_t result = qword_26AF66190;
  if (!qword_26AF66190)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AF66190);
  }
  return result;
}

uint64_t sub_229030BF4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_22903139C(a1, a2, a3, (void (*)(void))sub_228FC7B9C);
}

unint64_t sub_229030C10()
{
  unint64_t result = qword_26AF661B8;
  if (!qword_26AF661B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AF661B8);
  }
  return result;
}

unint64_t sub_229030C68()
{
  unint64_t result = qword_26AF661F0;
  if (!qword_26AF661F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AF661F0);
  }
  return result;
}

unint64_t sub_229030CC0()
{
  unint64_t result = qword_26AF661C8;
  if (!qword_26AF661C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AF661C8);
  }
  return result;
}

uint64_t sub_229030D14()
{
  return sub_228F764D0(&qword_2682B7E20, &qword_2682B7E28);
}

unint64_t sub_229030D54()
{
  unint64_t result = qword_2682B7E30;
  if (!qword_2682B7E30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2682B7E30);
  }
  return result;
}

unint64_t sub_229030DAC()
{
  unint64_t result = qword_2682B7E38;
  if (!qword_2682B7E38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2682B7E38);
  }
  return result;
}

unint64_t sub_229030E04()
{
  unint64_t result = qword_2682B7E40;
  if (!qword_2682B7E40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2682B7E40);
  }
  return result;
}

unint64_t sub_229030E5C()
{
  unint64_t result = qword_2682B7E48;
  if (!qword_2682B7E48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2682B7E48);
  }
  return result;
}

unint64_t sub_229030EB4()
{
  unint64_t result = qword_2682B7E50;
  if (!qword_2682B7E50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2682B7E50);
  }
  return result;
}

unint64_t sub_229030F0C()
{
  unint64_t result = qword_2682B7E58;
  if (!qword_2682B7E58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2682B7E58);
  }
  return result;
}

unint64_t sub_229030F68()
{
  unint64_t result = qword_2682B7E68;
  if (!qword_2682B7E68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2682B7E68);
  }
  return result;
}

uint64_t sub_229030FBC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_22903139C(a1, a2, a3, (void (*)(void))sub_228FC7BF0);
}

unint64_t sub_229030FD8()
{
  unint64_t result = qword_2682B7E70;
  if (!qword_2682B7E70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2682B7E70);
  }
  return result;
}

unint64_t sub_229031030()
{
  unint64_t result = qword_2682B7E78;
  if (!qword_2682B7E78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2682B7E78);
  }
  return result;
}

unint64_t sub_229031088()
{
  unint64_t result = qword_2682B7E80;
  if (!qword_2682B7E80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2682B7E80);
  }
  return result;
}

uint64_t sub_2290310DC()
{
  return sub_228F764D0(&qword_2682B7E88, (uint64_t *)&unk_2682B7E90);
}

unint64_t sub_22903111C()
{
  unint64_t result = qword_26AF66158;
  if (!qword_26AF66158)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AF66158);
  }
  return result;
}

unint64_t sub_229031174()
{
  unint64_t result = qword_26AF66100;
  if (!qword_26AF66100)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AF66100);
  }
  return result;
}

unint64_t sub_2290311CC()
{
  unint64_t result = qword_26AF66128;
  if (!qword_26AF66128)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AF66128);
  }
  return result;
}

unint64_t sub_229031224()
{
  unint64_t result = qword_26AF66160;
  if (!qword_26AF66160)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AF66160);
  }
  return result;
}

unint64_t sub_22903127C()
{
  unint64_t result = qword_26AF66118;
  if (!qword_26AF66118)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AF66118);
  }
  return result;
}

unint64_t sub_2290312D4()
{
  unint64_t result = qword_26AF66120;
  if (!qword_26AF66120)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AF66120);
  }
  return result;
}

unint64_t sub_229031330()
{
  unint64_t result = qword_26AF66110;
  if (!qword_26AF66110)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AF66110);
  }
  return result;
}

uint64_t sub_229031384(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_22903139C(a1, a2, a3, (void (*)(void))sub_228FC7C44);
}

uint64_t sub_22903139C(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_2290313F4()
{
  unint64_t result = qword_26AF66138;
  if (!qword_26AF66138)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AF66138);
  }
  return result;
}

unint64_t sub_22903144C()
{
  unint64_t result = qword_26AF66170;
  if (!qword_26AF66170)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AF66170);
  }
  return result;
}

unint64_t sub_2290314A4()
{
  unint64_t result = qword_26AF66148;
  if (!qword_26AF66148)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AF66148);
  }
  return result;
}

uint64_t sub_2290314F8()
{
  return sub_228F764D0(&qword_2682B7EA0, &qword_2682B7EA8);
}

uint64_t destroy for EventEntity()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for EventEntity(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  uint64_t v5 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v5;
  uint64_t v6 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v6;
  uint64_t v7 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v7;
  uint64_t v8 = *(void *)(a2 + 96);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = v8;
  uint64_t v9 = *(void *)(a2 + 112);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(void *)(a1 + 112) = v9;
  uint64_t v10 = *(void *)(a2 + 128);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  *(void *)(a1 + 128) = v10;
  uint64_t v11 = *(void *)(a2 + 144);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  *(void *)(a1 + 144) = v11;
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  sub_229041250();
  sub_229040F70();
  sub_229040F70();
  sub_229040F70();
  sub_229040F70();
  sub_229040F70();
  sub_229040F70();
  sub_229040F70();
  sub_229040F70();
  sub_229040F70();
  sub_229040F70();
  sub_229040F70();
  sub_229040F70();
  sub_229040F70();
  sub_229040F70();
  sub_229040F70();
  sub_229040F70();
  sub_229040F70();
  return a1;
}

uint64_t assignWithCopy for EventEntity(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  sub_229041250();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  sub_229040F70();
  swift_release();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  sub_229040F70();
  swift_release();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  sub_229040F70();
  swift_release();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  sub_229040F70();
  swift_release();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  sub_229040F70();
  swift_release();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  sub_229040F70();
  swift_release();
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  sub_229040F70();
  swift_release();
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  sub_229040F70();
  swift_release();
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  sub_229040F70();
  swift_release();
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  sub_229040F70();
  swift_release();
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  sub_229040F70();
  swift_release();
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  sub_229040F70();
  swift_release();
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  sub_229040F70();
  swift_release();
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  sub_229040F70();
  swift_release();
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  sub_229040F70();
  swift_release();
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  sub_229040F70();
  swift_release();
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  sub_229040F70();
  swift_release();
  return a1;
}

uint64_t assignWithTake for EventEntity(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  swift_release();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_release();
  swift_release();
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  swift_release();
  swift_release();
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  swift_release();
  swift_release();
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  swift_release();
  swift_release();
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  swift_release();
  swift_release();
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  swift_release();
  swift_release();
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  swift_release();
  swift_release();
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  swift_release();
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for EventEntity(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 160)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for EventEntity(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 152) = 0;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 160) = 1;
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
    *(unsigned char *)(result + 160) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for EventEntity()
{
  return &type metadata for EventEntity;
}

ValueMetadata *type metadata accessor for EventEntity.PrivacyLevel()
{
  return &type metadata for EventEntity.PrivacyLevel;
}

unsigned char *_s12CalendarLink11EventEntityV12PrivacyLevelOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 3;
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
        JUMPOUT(0x229031C68);
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
          *unint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for EventEntity.EventEntityStatus()
{
  return &type metadata for EventEntity.EventEntityStatus;
}

unsigned char *storeEnumTagSinglePayload for EventEntity.Availability(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 4;
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
        JUMPOUT(0x229031D6CLL);
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
          *unint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for EventEntity.Availability()
{
  return &type metadata for EventEntity.Availability;
}

uint64_t sub_229031DA4(uint64_t result)
{
  if (result)
  {
    sub_229040F70();
    sub_229040F70();
    sub_229040F70();
    sub_229040F70();
    sub_229040F70();
    return sub_229040F70();
  }
  return result;
}

unint64_t sub_229031E24(uint64_t a1)
{
  return sub_229031E74(a1, &qword_2682B59F8, (uint64_t *)&unk_2682B7F80, (uint64_t (*)(void))sub_228FC7EAC);
}

unint64_t sub_229031E4C(uint64_t a1)
{
  return sub_229031E74(a1, &qword_2682B59E8, (uint64_t *)&unk_2682B7F70, (uint64_t (*)(void))sub_228FC7EAC);
}

unint64_t sub_229031E74(uint64_t a1, uint64_t *a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v26 = a4;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *(void *)(a1 + 16);
  if (v11)
  {
    __swift_instantiateConcreteTypeFromMangledName(a3);
    uint64_t v12 = (void *)sub_2290427B0();
    uint64_t v13 = &v10[*(int *)(v7 + 48)];
    uint64_t v14 = a1 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
    uint64_t v15 = *(void *)(v8 + 72);
    while (1)
    {
      sub_228F87874(v14, (uint64_t)v10, a2);
      char v16 = *v10;
      unint64_t result = v26(*v10);
      if (v18) {
        break;
      }
      unint64_t v19 = result;
      *(void *)((char *)v12 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
      *(unsigned char *)(v12[6] + result) = v16;
      uint64_t v20 = v12[7];
      uint64_t v21 = sub_2290411C0();
      unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v21 - 8) + 32))(v20 + *(void *)(*(void *)(v21 - 8) + 72) * v19, v13, v21);
      uint64_t v22 = v12[2];
      BOOL v23 = __OFADD__(v22, 1);
      uint64_t v24 = v22 + 1;
      if (v23) {
        goto LABEL_10;
      }
      void v12[2] = v24;
      v14 += v15;
      if (!--v11) {
        return (unint64_t)v12;
      }
    }
    __break(1u);
LABEL_10:
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE80];
  }
  return result;
}

unint64_t sub_229032048(uint64_t a1)
{
  return sub_229031E74(a1, &qword_2682B59D8, (uint64_t *)&unk_2682B7F60, (uint64_t (*)(void))sub_228FC7EAC);
}

unint64_t sub_229032070(uint64_t a1)
{
  return sub_229031E74(a1, qword_2682B6B48, (uint64_t *)&unk_2682B7F30, (uint64_t (*)(void))sub_228FC7EAC);
}

unint64_t sub_229032098(uint64_t a1)
{
  return sub_229031E74(a1, &qword_2682B7A10, (uint64_t *)&unk_2682B7F10, (uint64_t (*)(void))sub_228FC7EAC);
}

unint64_t sub_2290320C0(uint64_t a1)
{
  return sub_229031E74(a1, &qword_2682B7A00, (uint64_t *)&unk_2682B7F00, (uint64_t (*)(void))sub_228FC7EAC);
}

uint64_t DeleteEventIntent.init()@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v49 = a1;
  uint64_t v53 = sub_2290412D0();
  uint64_t v55 = *(void *)(v53 - 8);
  MEMORY[0x270FA5388](v53);
  uint64_t v52 = (char *)v34 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF65FB0);
  uint64_t v3 = MEMORY[0x270FA5388](v2 - 8);
  uint64_t v51 = (char *)v34 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v47 = (char *)v34 - v5;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF665B0);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v50 = (char *)v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_2290414D0();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)v34 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_229041610();
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v13 = sub_229042290();
  MEMORY[0x270FA5388](v13 - 8);
  uint64_t v14 = sub_2290414E0();
  uint64_t v45 = v14;
  uint64_t v54 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  v34[1] = (char *)v34 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AF665A0);
  sub_229040BD0();
  long long v56 = 0u;
  long long v57 = 0u;
  uint64_t v58 = 0;
  sub_229040BC0();
  uint64_t v48 = sub_229040B90();
  uint64_t v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_2682B6B78);
  sub_229042210();
  sub_229041600();
  unint64_t v17 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 104);
  unsigned int v35 = *MEMORY[0x263F06D18];
  uint64_t v16 = v35;
  uint64_t v36 = v8;
  v17(v11, v35, v8);
  uint64_t v37 = v17;
  uint64_t v38 = v9 + 104;
  sub_2290414F0();
  sub_229042210();
  sub_229041600();
  v17(v11, v16, v8);
  char v18 = v50;
  sub_2290414F0();
  unint64_t v19 = *(void (**)(char *, void, uint64_t, uint64_t))(v54 + 56);
  v54 += 56;
  uint64_t v46 = v19;
  v19(v18, 0, 1, v14);
  *(void *)&long long v56 = 0;
  uint64_t v20 = sub_229040D40();
  uint64_t v21 = *(void *)(v20 - 8);
  uint64_t v22 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v21 + 56);
  unint64_t v40 = v22;
  uint64_t v41 = v21 + 56;
  BOOL v23 = v47;
  v22(v47, 1, 1, v20);
  v22(v51, 1, 1, v20);
  unsigned int v42 = *MEMORY[0x263EFBDC8];
  uint64_t v24 = *(void (**)(void))(v55 + 104);
  v55 += 104;
  long long v43 = (void (*)(char *, void, uint64_t))v24;
  v24(v52);
  sub_228F74A44();
  uint64_t v25 = v23;
  uint64_t v44 = sub_229040EE0();
  uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_2682B63F8);
  sub_229042210();
  sub_229041600();
  uint64_t v26 = v35;
  uint64_t v27 = v36;
  uint64_t v28 = v37;
  v37(v11, v35, v36);
  sub_2290414F0();
  sub_229042210();
  sub_229041600();
  v28(v11, v26, v27);
  uint64_t v29 = v50;
  sub_2290414F0();
  v46(v29, 0, 1, v45);
  LOBYTE(v56) = 3;
  uint64_t v30 = v40;
  v40(v25, 1, 1, v20);
  v30(v51, 1, 1, v20);
  v43(v52, v42, v53);
  sub_228FC7D4C();
  uint64_t result = sub_229040EC0();
  unint64_t v32 = v49;
  uint64_t v33 = v44;
  *uint64_t v49 = v48;
  v32[1] = v33;
  v32[2] = result;
  return result;
}

uint64_t DeleteEventIntent.entities.getter()
{
  sub_229040E70();
  return v1;
}

uint64_t DeleteEventIntent.entities.setter()
{
  return sub_229040E80();
}

unint64_t static DeleteEventIntent.persistentIdentifier.getter()
{
  return 0xD000000000000011;
}

uint64_t sub_229032958()
{
  uint64_t v0 = sub_2290414D0();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_229041610();
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v5 = sub_229042290();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v6 = sub_2290414E0();
  __swift_allocate_value_buffer(v6, qword_2682B7FA0);
  __swift_project_value_buffer(v6, (uint64_t)qword_2682B7FA0);
  sub_229042210();
  sub_229041600();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x263F06D18], v0);
  return sub_2290414F0();
}

uint64_t static DeleteEventIntent.title.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_228FA73F0(&qword_2682B4FC8, MEMORY[0x263F06D40], (uint64_t)qword_2682B7FA0, a1);
}

uint64_t static DeleteEventIntent.title.setter(uint64_t a1)
{
  return sub_228FA74D8(a1, &qword_2682B4FC8, MEMORY[0x263F06D40], (uint64_t)qword_2682B7FA0);
}

uint64_t (*static DeleteEventIntent.title.modify())()
{
  if (qword_2682B4FC8 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_2290414E0();
  __swift_project_value_buffer(v0, (uint64_t)qword_2682B7FA0);
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_229032C64()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF665B0);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v2 = (char *)v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12[0] = sub_2290414D0();
  uint64_t v3 = *(void *)(v12[0] - 8);
  MEMORY[0x270FA5388](v12[0]);
  uint64_t v5 = (char *)v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_229041610();
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v7 = sub_229042290();
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v8 = sub_2290414E0();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = sub_2290410B0();
  __swift_allocate_value_buffer(v10, qword_2682B7FB8);
  __swift_project_value_buffer(v10, (uint64_t)qword_2682B7FB8);
  sub_229042210();
  sub_229041600();
  (*(void (**)(char *, void, void))(v3 + 104))(v5, *MEMORY[0x263F06D18], v12[0]);
  sub_229041500();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v2, 1, 1, v8);
  return sub_2290410C0();
}

uint64_t static DeleteEventIntent.description.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_228FA73F0(&qword_2682B4FD0, MEMORY[0x263EFBA28], (uint64_t)qword_2682B7FB8, a1);
}

uint64_t static DeleteEventIntent.description.setter(uint64_t a1)
{
  return sub_228FA74D8(a1, &qword_2682B4FD0, MEMORY[0x263EFBA28], (uint64_t)qword_2682B7FB8);
}

uint64_t (*static DeleteEventIntent.description.modify())()
{
  if (qword_2682B4FD0 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_2290410B0();
  __swift_project_value_buffer(v0, (uint64_t)qword_2682B7FB8);
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t DeleteEventIntent.eventStoreProvider.getter()
{
  sub_229040B60();
  return v1;
}

uint64_t DeleteEventIntent.eventStoreProvider.setter()
{
  return swift_unknownObjectRelease();
}

uint64_t (*DeleteEventIntent.eventStoreProvider.modify(void *a1))()
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_229040B50();
  return sub_228F74D10;
}

uint64_t DeleteEventIntent.$eventStoreProvider.getter()
{
  return sub_229040B80();
}

uint64_t (*DeleteEventIntent.entities.modify(void *a1))()
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_229040E60();
  return sub_228F74D10;
}

uint64_t DeleteEventIntent.$entities.getter()
{
  return sub_229040E90();
}

uint64_t DeleteEventIntent.span.getter()
{
  return sub_229040E70();
}

uint64_t DeleteEventIntent.span.setter()
{
  return sub_229040E80();
}

uint64_t (*DeleteEventIntent.span.modify(void *a1))()
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_229040E60();
  return sub_228F74D10;
}

uint64_t DeleteEventIntent.$span.getter()
{
  return sub_229040E90();
}

uint64_t static DeleteEventIntent.parameterSummary.getter()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_2682B7FD8);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2682B7FE0);
  MEMORY[0x270FA5388](v1);
  sub_228FF1B14();
  sub_2290412B0();
  sub_2290412A0();
  swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2682B7FF0);
  sub_229041290();
  swift_release();
  sub_2290412A0();
  sub_2290412C0();
  return sub_229041280();
}

uint64_t sub_229033444()
{
  swift_getKeyPath();
  sub_228FF1B14();
  uint64_t v0 = sub_229040F70();
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2682B5D00);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_229043480;
  *(void *)(v1 + 32) = v0;
  sub_229042330();
  sub_229040F70();
  uint64_t v2 = sub_229041250();
  swift_release();
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t DeleteEventIntent.perform()(uint64_t a1)
{
  *(void *)(v2 + 120) = a1;
  uint64_t v3 = sub_229041220();
  *(void *)(v2 + 128) = v3;
  *(void *)(v2 + 136) = *(void *)(v3 - 8);
  *(void *)(v2 + 144) = swift_task_alloc();
  uint64_t v4 = sub_229040D40();
  *(void *)(v2 + 152) = v4;
  *(void *)(v2 + 160) = *(void *)(v4 - 8);
  *(void *)(v2 + 168) = swift_task_alloc();
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2682B65A0);
  *(void *)(v2 + 176) = v5;
  *(void *)(v2 + 184) = *(void *)(v5 - 8);
  *(void *)(v2 + 192) = swift_task_alloc();
  *(_OWORD *)(v2 + 200) = *(_OWORD *)v1;
  *(void *)(v2 + 216) = *(void *)(v1 + 16);
  return MEMORY[0x270FA2498](sub_2290336C4, 0, 0);
}

uint64_t sub_2290336C4()
{
  uint64_t v1 = sub_229042170();
  *(void *)(v0 + 40) = v1;
  *(void *)(v0 + 48) = sub_228F75CFC((unint64_t *)&qword_26AF65DD0, MEMORY[0x263F2FFD0]);
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v0 + 16));
  (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v1 - 8) + 104))(boxed_opaque_existential_1, *MEMORY[0x263F2FFC0], v1);
  LOBYTE(v1) = sub_2290416B0();
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  if (v1)
  {
    sub_229040F70();
    sub_229040F70();
    sub_229040F70();
    sub_229040B60();
    swift_release();
    swift_release();
    swift_release();
    id v3 = objc_msgSend(*(id *)(v0 + 88), sel_eventStore);
    *(void *)(v0 + 224) = v3;
    swift_unknownObjectRelease();
    if (v3)
    {
      sub_229040F70();
      sub_229040F70();
      sub_229040F70();
      sub_229040E70();
      swift_release();
      swift_release();
      swift_release();
      uint64_t v4 = *(void *)(v0 + 80);
      uint64_t v5 = *(void *)(v4 + 16);
      uint64_t v6 = MEMORY[0x263F8EE78];
      if (v5)
      {
        sub_229041250();
        uint64_t v7 = (uint64_t *)(v4 + 40);
        uint64_t v8 = (void *)MEMORY[0x263F8EE78];
        do
        {
          uint64_t v10 = *(v7 - 1);
          uint64_t v9 = *v7;
          sub_229041250();
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v8 = sub_228F9FA04(0, v8[2] + 1, 1, v8);
          }
          unint64_t v12 = v8[2];
          unint64_t v11 = v8[3];
          if (v12 >= v11 >> 1) {
            uint64_t v8 = sub_228F9FA04((void *)(v11 > 1), v12 + 1, 1, v8);
          }
          v8[2] = v12 + 1;
          uint64_t v13 = &v8[2 * v12];
          v13[4] = v10;
          v13[5] = v9;
          v7 += 20;
          --v5;
        }
        while (v5);
        swift_bridgeObjectRelease();
        uint64_t v6 = MEMORY[0x263F8EE78];
      }
      swift_bridgeObjectRelease();
      uint64_t v16 = (void *)sub_229042300();
      swift_bridgeObjectRelease();
      id v17 = objc_msgSend(v3, sel_eventsWithIdentifiers_, v16);

      if (v17)
      {
        sub_228F8379C();
        unint64_t v18 = sub_229042310();

        if (v18 >> 62)
        {
          sub_229041250();
          uint64_t v19 = sub_229042780();
          swift_bridgeObjectRelease();
          if (v19)
          {
LABEL_18:
            uint64_t v48 = v6;
            if (v19 < 1)
            {
              __break(1u);
            }
            else
            {
              uint64_t v47 = v0 + 96;
              sub_229041250();
              for (uint64_t i = 0; i != v19; ++i)
              {
                if ((v18 & 0xC000000000000001) != 0) {
                  id v21 = (id)MEMORY[0x22A6AFAB0](i, v18);
                }
                else {
                  id v21 = *(id *)(v18 + 8 * i + 32);
                }
                uint64_t v22 = v21;
                if (objc_msgSend(v21, sel_isDeletable, v47))
                {
                  sub_2290426F0();
                  sub_229042720();
                  sub_229042730();
                  sub_229042700();
                }
                else
                {
                }
              }
              swift_bridgeObjectRelease();
              *(void *)(v0 + 232) = v48;
              if ((v48 & 0x8000000000000000) == 0 && (v48 & 0x4000000000000000) == 0)
              {
                uint64_t v23 = *(void *)(v48 + 16);
                uint64_t v24 = v23;
                unint64_t v25 = v18 >> 62;
                if (v23) {
                  goto LABEL_30;
                }
LABEL_49:
                swift_release();
                swift_bridgeObjectRelease();
                sub_229040F70();
                sub_229040F70();
                sub_229040F70();
                sub_229040E70();
                swift_release();
                swift_release();
                swift_release();
                unint64_t v44 = *(void *)(*(void *)(v0 + 96) + 16);
                swift_bridgeObjectRelease();
                if (v44 <= 1) {
                  char v45 = 80;
                }
                else {
                  char v45 = 81;
                }
                sub_228F75D44();
                swift_allocError();
                char *v46 = v45;
                swift_willThrow();

                goto LABEL_14;
              }
            }
            sub_229040F70();
            uint64_t v23 = sub_229042780();
            swift_release();
            unint64_t v25 = v18 >> 62;
            if (v23)
            {
              sub_229041250();
              uint64_t v24 = sub_229042780();
              swift_release();
LABEL_30:
              *(void *)(v0 + 240) = v23;
              if (v25)
              {
                sub_229041250();
                uint64_t v26 = sub_229042780();
                swift_bridgeObjectRelease();
              }
              else
              {
                uint64_t v26 = *(void *)((v18 & 0xFFFFFFFFFFFFFF8) + 0x10);
              }
              swift_bridgeObjectRelease();
              uint64_t v27 = *(void *)(v0 + 208);
              uint64_t v28 = *(void *)(v0 + 216);
              if (v24 == v26)
              {
                sub_229040F70();
                sub_229040F70();
                sub_229040F70();
                uint64_t v29 = sub_229040E90();
                *(void *)(v0 + 264) = v29;
                swift_release();
                swift_release();
                swift_release();
                uint64_t v30 = dword_2682B6538;
                uint64_t v31 = (void *)swift_task_alloc();
                *(void *)(v0 + 272) = v31;
                *uint64_t v31 = v0;
                v31[1] = sub_229034288;
                uint64_t v32 = *(void *)(v0 + 232);
                return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_2682B6538 + v30))(v0 + 288, v32, v29);
              }
              else
              {
                uint64_t v35 = *(void *)(v0 + 160);
                uint64_t v34 = *(void *)(v0 + 168);
                uint64_t v36 = *(void *)(v0 + 152);
                *(void *)(v0 + 56) = *(void *)(v0 + 200);
                *(void *)(v0 + 64) = v27;
                *(void *)(v0 + 72) = v28;
                sub_229040D20();
                sub_229040D80();
                (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v34, v36);
                sub_229041210();
                uint64_t v37 = (void *)swift_task_alloc();
                *(void *)(v0 + 248) = v37;
                unint64_t v38 = sub_228FF1B14();
                uint64_t v39 = sub_228F764D0((unint64_t *)&unk_2682B5F28, (uint64_t *)&unk_2682B65A0);
                *uint64_t v37 = v0;
                v37[1] = sub_229033F7C;
                uint64_t v40 = *(void *)(v0 + 192);
                uint64_t v41 = *(void *)(v0 + 176);
                uint64_t v42 = *(void *)(v0 + 144);
                return MEMORY[0x270EE0D08](v40, v42, 1, &type metadata for DeleteEventIntent, v41, v38, v39);
              }
            }
            goto LABEL_49;
          }
        }
        else
        {
          uint64_t v19 = *(void *)((v18 & 0xFFFFFFFFFFFFFF8) + 0x10);
          if (v19) {
            goto LABEL_18;
          }
        }
        swift_bridgeObjectRelease();
      }
      long long v43 = *(void **)(v0 + 224);
      sub_229040D90();

      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      uint64_t v15 = *(uint64_t (**)(void))(v0 + 8);
      goto LABEL_43;
    }
    sub_228F75D44();
    swift_allocError();
    *uint64_t v14 = 48;
  }
  else
  {
    sub_229040BB0();
    sub_228F75CFC(qword_2682B5360, MEMORY[0x263EFB650]);
    swift_allocError();
    sub_229040BA0();
  }
  swift_willThrow();
LABEL_14:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v15 = *(uint64_t (**)(void))(v0 + 8);
LABEL_43:
  return v15();
}

uint64_t sub_229033F7C()
{
  uint64_t v2 = *(void **)v1;
  *(void *)(*(void *)v1 + 256) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v4 = v2[23];
    uint64_t v3 = v2[24];
    uint64_t v5 = v2[22];
    uint64_t v7 = v2[17];
    uint64_t v6 = v2[18];
    uint64_t v8 = v2[16];
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
    uint64_t v9 = sub_229034648;
  }
  else
  {
    uint64_t v11 = v2[23];
    uint64_t v10 = v2[24];
    uint64_t v12 = v2[22];
    (*(void (**)(void, void))(v2[17] + 8))(v2[18], v2[16]);
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v10, v12);
    uint64_t v9 = sub_229034154;
  }
  return MEMORY[0x270FA2498](v9, 0, 0);
}

uint64_t sub_229034154()
{
  sub_229040F70();
  sub_229040F70();
  sub_229040F70();
  uint64_t v1 = sub_229040E90();
  v0[33] = v1;
  swift_release();
  swift_release();
  swift_release();
  uint64_t v2 = dword_2682B6538;
  uint64_t v3 = (void *)swift_task_alloc();
  v0[34] = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_229034288;
  uint64_t v4 = v0[29];
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_2682B6538 + v2))((uint64_t)(v0 + 36), v4, v1);
}

uint64_t sub_229034288()
{
  *(void *)(*(void *)v1 + 280) = v0;
  swift_task_dealloc();
  swift_release();
  if (v0)
  {
    swift_release();
    uint64_t v2 = sub_229034700;
  }
  else
  {
    uint64_t v2 = sub_229034400;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_229034400()
{
  uint64_t v1 = 0;
  uint64_t v2 = qword_22904E738[*(char *)(v0 + 288)];
  uint64_t v3 = *(void *)(v0 + 232);
  unint64_t v4 = v3 & 0xC000000000000001;
  uint64_t v22 = v3 + 32;
  do
  {
    if (v4) {
      id v5 = (id)MEMORY[0x22A6AFAB0](v1, *(void *)(v0 + 232));
    }
    else {
      id v5 = *(id *)(v22 + 8 * v1);
    }
    uint64_t v6 = v5;
    uint64_t v7 = v1 + 1;
    if (__OFADD__(v1, 1)) {
      __break(1u);
    }
    uint64_t v8 = *(void **)(v0 + 224);
    *(void *)(v0 + 104) = 0;
    unsigned int v9 = objc_msgSend(v8, sel_removeEvent_span_commit_error_, v6, v2, 0, v0 + 104);
    uint64_t v10 = *(void **)(v0 + 104);
    if (!v9)
    {
      uint64_t v16 = *(void **)(v0 + 224);
      id v19 = v10;
      swift_release();
      sub_2290414B0();

      swift_willThrow();
      goto LABEL_12;
    }
    uint64_t v11 = *(void *)(v0 + 240);
    id v12 = v10;

    ++v1;
  }
  while (v7 != v11);
  uint64_t v13 = *(void **)(v0 + 224);
  swift_release();
  *(void *)(v0 + 112) = 0;
  unsigned int v14 = objc_msgSend(v13, sel_commitWithRollback_, v0 + 112);
  uint64_t v15 = *(void **)(v0 + 112);
  uint64_t v16 = *(void **)(v0 + 224);
  if (v14)
  {
    id v17 = v15;
    sub_229040D90();

    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    unint64_t v18 = *(uint64_t (**)(void))(v0 + 8);
    goto LABEL_13;
  }
  id v20 = v15;
  sub_2290414B0();

  swift_willThrow();
LABEL_12:

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v18 = *(uint64_t (**)(void))(v0 + 8);
LABEL_13:
  return v18();
}

uint64_t sub_229034648()
{
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_229034700()
{
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2290347B8@<X0>(uint64_t a1@<X8>)
{
  if (qword_2682B4FC8 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_2290414E0();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_2682B7FA0);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_229034878()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_2682B7FD8);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2682B7FE0);
  MEMORY[0x270FA5388](v1);
  sub_2290412B0();
  sub_2290412A0();
  swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2682B7FF0);
  sub_229041290();
  swift_release();
  sub_2290412A0();
  sub_2290412C0();
  return sub_229041280();
}

uint64_t sub_229034A14(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_228F76138;
  return DeleteEventIntent.perform()(a1);
}

unint64_t sub_229034AB0()
{
  return 0xD000000000000011;
}

unint64_t sub_229034AD0()
{
  unint64_t result = qword_2682B8000;
  if (!qword_2682B8000)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2682B8000);
  }
  return result;
}

unint64_t sub_229034B2C()
{
  unint64_t result = qword_26AF657D8;
  if (!qword_26AF657D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AF657D8);
  }
  return result;
}

unint64_t sub_229034B84()
{
  unint64_t result = qword_26AF657D0;
  if (!qword_26AF657D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AF657D0);
  }
  return result;
}

uint64_t sub_229034BD8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_229034BF4()
{
  return swift_getOpaqueTypeConformance2();
}

ValueMetadata *type metadata accessor for DeleteEventIntent()
{
  return &type metadata for DeleteEventIntent;
}

uint64_t sub_229034C38()
{
  return sub_228F764D0(&qword_2682B8010, &qword_2682B8018);
}

uint64_t sub_229034C74()
{
  return sub_228F764D0((unint64_t *)&qword_26AF65FC0, (uint64_t *)&unk_26AF65FD0);
}

uint64_t static CalendarListGrouping.groups(withEventStore:)(void *a1)
{
  return _s12CalendarLink0A12ListGroupingV6groups14withEventStore16includeDelegates12writableOnly09deletableL00I18IntegrationSourcesSayAC5GroupOGSo07EKEventH0C_S4btFZ_0(a1, 0, 0, 0, 1);
}

uint64_t sub_229034CCC@<X0>(void *a1@<X0>, char a2@<W1>, char a3@<W2>, uint64_t a4@<X8>)
{
  id v8 = objc_msgSend(a1, sel_calendarsForEntityType_, 0);
  sub_228F8A728(0, (unint64_t *)&qword_2682B5D80);
  sub_228FD2D88();
  uint64_t v9 = sub_229042410();

  if ((a2 & 1) == 0)
  {
LABEL_22:
    if (a3) {
      goto LABEL_27;
    }
LABEL_47:
    if ((v9 & 0xC000000000000001) != 0) {
      goto LABEL_48;
    }
    goto LABEL_51;
  }
  if ((v9 & 0xC000000000000001) == 0)
  {
    uint64_t v9 = (uint64_t)sub_2290366F8(v9, (SEL *)&selRef_allowsContentModifications);
    goto LABEL_22;
  }
  uint64_t v10 = MEMORY[0x263F8EE88];
  uint64_t v36 = MEMORY[0x263F8EE88];
  sub_2290425D0();
  if (sub_229042640())
  {
    do
    {
      swift_dynamicCast();
      if (objc_msgSend(v35, sel_allowsContentModifications))
      {
        uint64_t v11 = v36;
        if (*(void *)(v36 + 24) <= *(void *)(v36 + 16))
        {
          sub_22903E36C();
          uint64_t v11 = v36;
        }
        uint64_t result = sub_229042510();
        uint64_t v13 = v11 + 56;
        uint64_t v14 = -1 << *(unsigned char *)(v11 + 32);
        unint64_t v15 = result & ~v14;
        unint64_t v16 = v15 >> 6;
        if (((-1 << v15) & ~*(void *)(v11 + 56 + 8 * (v15 >> 6))) != 0)
        {
          unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 56 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          char v18 = 0;
          unint64_t v19 = (unint64_t)(63 - v14) >> 6;
          do
          {
            if (++v16 == v19 && (v18 & 1) != 0)
            {
              __break(1u);
              goto LABEL_54;
            }
            BOOL v20 = v16 == v19;
            if (v16 == v19) {
              unint64_t v16 = 0;
            }
            v18 |= v20;
            uint64_t v21 = *(void *)(v13 + 8 * v16);
          }
          while (v21 == -1);
          unint64_t v17 = __clz(__rbit64(~v21)) + (v16 << 6);
        }
        *(void *)(v13 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
        *(void *)(*(void *)(v11 + 48) + 8 * v17) = v35;
        ++*(void *)(v11 + 16);
      }
      else
      {
      }
    }
    while (sub_229042640());
    uint64_t v9 = v36;
  }
  else
  {
    uint64_t v9 = v10;
  }
  swift_release();
  if ((a3 & 1) == 0) {
    goto LABEL_47;
  }
LABEL_27:
  if ((v9 & 0xC000000000000001) == 0)
  {
    uint64_t v9 = (uint64_t)sub_2290366F8(v9, (SEL *)&selRef_isDeletable);
    if ((v9 & 0xC000000000000001) != 0)
    {
LABEL_48:
      if (sub_229042610())
      {
LABEL_49:
        id v32 = a1;
        uint64_t v33 = sub_228FCF40C(v9);
        uint64_t result = swift_bridgeObjectRelease();
        char v34 = 0;
LABEL_53:
        *(void *)a4 = v32;
        *(void *)(a4 + 8) = v33;
        *(unsigned char *)(a4 + 16) = v34;
        return result;
      }
LABEL_52:
      uint64_t result = swift_bridgeObjectRelease();
      id v32 = 0;
      uint64_t v33 = 0;
      char v34 = -1;
      goto LABEL_53;
    }
LABEL_51:
    if (*(void *)(v9 + 16)) {
      goto LABEL_49;
    }
    goto LABEL_52;
  }
  uint64_t v37 = MEMORY[0x263F8EE88];
  sub_2290425D0();
  if (!sub_229042640())
  {
LABEL_46:
    swift_release();
    uint64_t v9 = v37;
    goto LABEL_47;
  }
  while (1)
  {
    swift_dynamicCast();
    if (objc_msgSend(v35, sel_isDeletable)) {
      break;
    }

LABEL_31:
    if (!sub_229042640()) {
      goto LABEL_46;
    }
  }
  uint64_t v22 = v37;
  if (*(void *)(v37 + 24) <= *(void *)(v37 + 16))
  {
    sub_22903E36C();
    uint64_t v22 = v37;
  }
  uint64_t result = sub_229042510();
  uint64_t v23 = v22 + 56;
  uint64_t v24 = -1 << *(unsigned char *)(v22 + 32);
  unint64_t v25 = result & ~v24;
  unint64_t v26 = v25 >> 6;
  if (((-1 << v25) & ~*(void *)(v22 + 56 + 8 * (v25 >> 6))) != 0)
  {
    unint64_t v27 = __clz(__rbit64((-1 << v25) & ~*(void *)(v22 + 56 + 8 * (v25 >> 6)))) | v25 & 0x7FFFFFFFFFFFFFC0;
LABEL_45:
    *(void *)(v23 + ((v27 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v27;
    *(void *)(*(void *)(v22 + 48) + 8 * v27) = v35;
    ++*(void *)(v22 + 16);
    goto LABEL_31;
  }
  char v28 = 0;
  unint64_t v29 = (unint64_t)(63 - v24) >> 6;
  while (++v26 != v29 || (v28 & 1) == 0)
  {
    BOOL v30 = v26 == v29;
    if (v26 == v29) {
      unint64_t v26 = 0;
    }
    v28 |= v30;
    uint64_t v31 = *(void *)(v23 + 8 * v26);
    if (v31 != -1)
    {
      unint64_t v27 = __clz(__rbit64(~v31)) + (v26 << 6);
      goto LABEL_45;
    }
  }
LABEL_54:
  __break(1u);
  return result;
}

uint64_t sub_22903514C(uint64_t result)
{
  unint64_t v4 = v2;
  uint64_t v5 = result;
  if ((result & 0xC000000000000001) != 0)
  {
    uint64_t result = sub_229042610();
    uint64_t v6 = result;
  }
  else
  {
    uint64_t v6 = *(void *)(result + 16);
  }
  if ((unint64_t)*v4 >> 62)
  {
    sub_229041250();
    uint64_t v20 = sub_229042780();
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v8 = v20 + v6;
    if (!__OFADD__(v20, v6)) {
      goto LABEL_6;
    }
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  uint64_t v7 = *(void *)((*v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t v8 = v7 + v6;
  if (__OFADD__(v7, v6)) {
    goto LABEL_24;
  }
LABEL_6:
  unint64_t v9 = *v4;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *unint64_t v4 = v9;
  uint64_t v11 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v9 & 0x8000000000000000) == 0 && (v9 & 0x4000000000000000) == 0)
  {
    uint64_t v12 = v9 & 0xFFFFFFFFFFFFFF8;
    if (v8 <= *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      goto LABEL_16;
    }
    uint64_t v11 = 1;
  }
  if (v9 >> 62)
  {
    sub_229041250();
    uint64_t v13 = sub_229042780();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v13 = *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (v13 <= v8) {
    uint64_t v13 = v8;
  }
  sub_229041250();
  uint64_t v14 = MEMORY[0x22A6AFAC0](v11, v13, 1, v9);
  swift_bridgeObjectRelease();
  *unint64_t v4 = v14;
  uint64_t v12 = v14 & 0xFFFFFFFFFFFFFF8;
LABEL_16:
  uint64_t v15 = *(void *)(v12 + 16);
  uint64_t v16 = (*(void *)(v12 + 24) >> 1) - v15;
  uint64_t result = (uint64_t)sub_228FCF9D8(&v44, (void *)(v12 + 8 * v15 + 32), v16, v5);
  if (result < v6)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  if (result >= 1)
  {
    uint64_t v17 = *(void *)((*v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
    BOOL v18 = __OFADD__(v17, result);
    uint64_t v19 = v17 + result;
    if (v18)
    {
      __break(1u);
LABEL_33:
      if (!sub_229042640()) {
        goto LABEL_21;
      }
      sub_228F8A728(0, (unint64_t *)&qword_2682B5D80);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      uint64_t v24 = v43;
      swift_unknownObjectRelease();
      while (2)
      {
        if (!v24) {
          goto LABEL_21;
        }
        while (1)
        {
          uint64_t v26 = *v4 & 0xFFFFFFFFFFFFFF8;
          if (v3 + 1 > *(void *)(v26 + 0x18) >> 1)
          {
            sub_229042340();
            uint64_t v26 = *v4 & 0xFFFFFFFFFFFFFF8;
          }
          uint64_t v27 = *(void *)(v26 + 24) >> 1;
          if (v3 < v27) {
            break;
          }
LABEL_37:
          *(void *)(v26 + 16) = v3;
        }
        uint64_t v28 = v26 + 32;
        while (1)
        {
          *(void *)(v28 + 8 * v3++) = v24;
          int64_t v29 = v47;
          if (v44 < 0)
          {
            if (!sub_229042640()) {
              goto LABEL_74;
            }
            sub_228F8A728(0, (unint64_t *)&qword_2682B5D80);
            swift_unknownObjectRetain();
            swift_dynamicCast();
            uint64_t v24 = v43;
            swift_unknownObjectRelease();
            goto LABEL_49;
          }
          if (!v48) {
            break;
          }
          unint64_t v30 = (v48 - 1) & v48;
          unint64_t v31 = __clz(__rbit64(v48)) | (v47 << 6);
LABEL_45:
          uint64_t v24 = *(void **)(*(void *)(v44 + 48) + 8 * v31);
          id v32 = v24;
LABEL_46:
          int64_t v47 = v29;
          unint64_t v48 = v30;
LABEL_49:
          if (!v24)
          {
LABEL_74:
            *(void *)((*v4 & 0xFFFFFFFFFFFFFF8) + 0x10) = v3;
            goto LABEL_21;
          }
          if (v3 >= v27)
          {
            uint64_t v26 = *v4 & 0xFFFFFFFFFFFFFF8;
            goto LABEL_37;
          }
        }
        int64_t v33 = v47 + 1;
        if (__OFADD__(v47, 1))
        {
          __break(1u);
LABEL_98:
          uint64_t v24 = 0;
          unint64_t v22 = 0;
          int64_t v21 = v1;
LABEL_30:
          int64_t v47 = v21;
          unint64_t v48 = v22;
          continue;
        }
        break;
      }
      int64_t v34 = (unint64_t)(v46 + 64) >> 6;
      if (v33 >= v34)
      {
        uint64_t v24 = 0;
        unint64_t v30 = 0;
        goto LABEL_46;
      }
      unint64_t v35 = *(void *)(v45 + 8 * v33);
      if (!v35)
      {
        int64_t v36 = v47 + 2;
        if (v47 + 2 >= v34) {
          goto LABEL_71;
        }
        unint64_t v35 = *(void *)(v45 + 8 * v36);
        if (!v35)
        {
          int64_t v1 = v47 + 3;
          if (v47 + 3 >= v34) {
            goto LABEL_72;
          }
          unint64_t v35 = *(void *)(v45 + 8 * v1);
          if (v35)
          {
            int64_t v33 = v47 + 3;
            goto LABEL_55;
          }
          int64_t v36 = v47 + 4;
          if (v47 + 4 >= v34)
          {
            uint64_t v24 = 0;
            unint64_t v30 = 0;
            int64_t v29 = v47 + 3;
            goto LABEL_46;
          }
          unint64_t v35 = *(void *)(v45 + 8 * v36);
          if (!v35)
          {
            int64_t v33 = v47 + 5;
            if (v47 + 5 >= v34)
            {
LABEL_72:
              uint64_t v24 = 0;
              unint64_t v30 = 0;
              int64_t v29 = v36;
              goto LABEL_46;
            }
            unint64_t v35 = *(void *)(v45 + 8 * v33);
            if (!v35)
            {
              int64_t v33 = v34 - 1;
              uint64_t v37 = v47 + 6;
              while (v34 != v37)
              {
                unint64_t v35 = *(void *)(v45 + 8 * v37++);
                if (v35)
                {
                  int64_t v33 = v37 - 1;
                  goto LABEL_55;
                }
              }
LABEL_71:
              uint64_t v24 = 0;
              unint64_t v30 = 0;
              int64_t v29 = v33;
              goto LABEL_46;
            }
            goto LABEL_55;
          }
        }
        int64_t v33 = v36;
      }
LABEL_55:
      unint64_t v30 = (v35 - 1) & v35;
      unint64_t v31 = __clz(__rbit64(v35)) + (v33 << 6);
      int64_t v29 = v33;
      goto LABEL_45;
    }
    *(void *)((*v4 & 0xFFFFFFFFFFFFFF8) + 0x10) = v19;
  }
  if (result != v16)
  {
LABEL_21:
    sub_228FCC1B0();
    return sub_229042330();
  }
LABEL_26:
  uint64_t v3 = *(void *)((*v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  int64_t v21 = v47;
  if (v44 < 0) {
    goto LABEL_33;
  }
  if (v48)
  {
    unint64_t v22 = (v48 - 1) & v48;
    unint64_t v23 = __clz(__rbit64(v48)) | (v47 << 6);
LABEL_29:
    uint64_t v24 = *(void **)(*(void *)(v44 + 48) + 8 * v23);
    id v25 = v24;
    goto LABEL_30;
  }
  int64_t v38 = v47 + 1;
  if (!__OFADD__(v47, 1))
  {
    int64_t v39 = (unint64_t)(v46 + 64) >> 6;
    if (v38 >= v39)
    {
      uint64_t v24 = 0;
      unint64_t v22 = 0;
      goto LABEL_30;
    }
    unint64_t v40 = *(void *)(v45 + 8 * v38);
    if (v40) {
      goto LABEL_79;
    }
    int64_t v41 = v47 + 2;
    if (v47 + 2 >= v39)
    {
LABEL_95:
      uint64_t v24 = 0;
      unint64_t v22 = 0;
      int64_t v21 = v38;
      goto LABEL_30;
    }
    unint64_t v40 = *(void *)(v45 + 8 * v41);
    if (v40) {
      goto LABEL_83;
    }
    int64_t v1 = v47 + 3;
    if (v47 + 3 < v39)
    {
      unint64_t v40 = *(void *)(v45 + 8 * v1);
      if (v40)
      {
        int64_t v38 = v47 + 3;
        goto LABEL_79;
      }
      int64_t v41 = v47 + 4;
      if (v47 + 4 >= v39) {
        goto LABEL_98;
      }
      unint64_t v40 = *(void *)(v45 + 8 * v41);
      if (v40)
      {
LABEL_83:
        int64_t v38 = v41;
LABEL_79:
        unint64_t v22 = (v40 - 1) & v40;
        unint64_t v23 = __clz(__rbit64(v40)) + (v38 << 6);
        int64_t v21 = v38;
        goto LABEL_29;
      }
      int64_t v38 = v47 + 5;
      if (v47 + 5 < v39)
      {
        unint64_t v40 = *(void *)(v45 + 8 * v38);
        if (!v40)
        {
          int64_t v38 = v39 - 1;
          uint64_t v42 = v47 + 6;
          do
          {
            if (v39 == v42) {
              goto LABEL_95;
            }
            unint64_t v40 = *(void *)(v45 + 8 * v42++);
          }
          while (!v40);
          int64_t v38 = v42 - 1;
        }
        goto LABEL_79;
      }
    }
    uint64_t v24 = 0;
    unint64_t v22 = 0;
    int64_t v21 = v41;
    goto LABEL_30;
  }
  __break(1u);
  return result;
}

uint64_t sub_22903574C(unint64_t *a1, SEL *a2)
{
  unint64_t v4 = *a1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *a1 = v4;
  if (!isUniquelyReferenced_nonNull_bridgeObject
    || (v4 & 0x8000000000000000) != 0
    || (v4 & 0x4000000000000000) != 0)
  {
    sub_228FCF934(v4);
    unint64_t v4 = v6;
    *a1 = v6;
  }
  uint64_t v7 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  v9[0] = (v4 & 0xFFFFFFFFFFFFFF8) + 32;
  v9[1] = v7;
  sub_229035978(v9, a2);
  return sub_229042330();
}

char *sub_2290357DC(uint64_t a1, int64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v7 = *(void **)v5;
  int64_t v8 = *(void *)(*(void *)v5 + 16);
  if (v8 < a2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  uint64_t v10 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  uint64_t v11 = 1 - v10;
  if (__OFSUB__(1, v10))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  int64_t v12 = v8 + v11;
  if (__OFADD__(v8, v11))
  {
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  isUniquelyReferenced_nonNull_native = (void *)swift_isUniquelyReferenced_nonNull_native();
  if (!isUniquelyReferenced_nonNull_native || v12 > v7[3] >> 1)
  {
    if (v8 <= v12) {
      int64_t v16 = v8 + v11;
    }
    else {
      int64_t v16 = v8;
    }
    uint64_t v7 = sub_228F9F64C(isUniquelyReferenced_nonNull_native, v16, 1, v7);
  }
  uint64_t v17 = (uint64_t)&v7[3 * a1 + 4];
  uint64_t result = (char *)swift_arrayDestroy();
  if (!v11) {
    goto LABEL_20;
  }
  uint64_t v19 = v7[2];
  BOOL v20 = __OFSUB__(v19, a2);
  uint64_t v21 = v19 - a2;
  if (v20) {
    goto LABEL_26;
  }
  if ((v21 & 0x8000000000000000) == 0)
  {
    uint64_t result = (char *)(v17 + 24);
    unint64_t v22 = (char *)&v7[3 * a2 + 4];
    size_t v23 = 24 * v21;
    if ((char *)(v17 + 24) != v22 || result >= &v22[v23]) {
      uint64_t result = (char *)memmove(result, v22, v23);
    }
    uint64_t v24 = v7[2];
    BOOL v20 = __OFADD__(v24, v11);
    uint64_t v25 = v24 + v11;
    if (!v20)
    {
      v7[2] = v25;
LABEL_20:
      *(void *)uint64_t v17 = a3;
      *(void *)(v17 + 8) = a4;
      *(unsigned char *)(v17 + 16) = a5;
      *(void *)uint64_t v5 = v7;
      return result;
    }
    goto LABEL_27;
  }
LABEL_28:
  uint64_t result = (char *)sub_2290427C0();
  __break(1u);
  return result;
}

void sub_229035978(uint64_t *a1, SEL *a2)
{
  uint64_t v4 = a1[1];
  uint64_t v5 = sub_2290427E0();
  if (v5 >= v4)
  {
    if (v4 < 0) {
      goto LABEL_133;
    }
    if (v4) {
      sub_2290361FC(0, v4, 1, a1, a2);
    }
    return;
  }
  if (v4 >= 0) {
    uint64_t v6 = v4;
  }
  else {
    uint64_t v6 = v4 + 1;
  }
  if (v4 < -1) {
    goto LABEL_141;
  }
  char v120 = a1;
  uint64_t v121 = v5;
  uint64_t v128 = v2;
  if (v4 < 2)
  {
    unint64_t v9 = (char *)MEMORY[0x263F8EE78];
    uint64_t v131 = MEMORY[0x263F8EE78];
    v127 = (void **)((MEMORY[0x263F8EE78] & 0xFFFFFFFFFFFFFF8) + 32);
    if (v4 != 1)
    {
      unint64_t v12 = *(void *)(MEMORY[0x263F8EE78] + 16);
LABEL_99:
      if (v12 >= 2)
      {
        uint64_t v110 = *v120;
        do
        {
          unint64_t v111 = v12 - 2;
          if (v12 < 2) {
            goto LABEL_128;
          }
          if (!v110) {
            goto LABEL_140;
          }
          uint64_t v112 = *(void *)&v9[16 * v111 + 32];
          uint64_t v113 = *(void *)&v9[16 * v12 + 24];
          sub_22903633C((id *)(v110 + 8 * v112), (id *)(v110 + 8 * *(void *)&v9[16 * v12 + 16]), v110 + 8 * v113, v127, a2);
          if (v128) {
            break;
          }
          if (v113 < v112) {
            goto LABEL_129;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            unint64_t v9 = sub_22903E358((uint64_t)v9);
          }
          if (v111 >= *((void *)v9 + 2)) {
            goto LABEL_130;
          }
          uint64_t v114 = &v9[16 * v111 + 32];
          *(void *)uint64_t v114 = v112;
          *((void *)v114 + 1) = v113;
          unint64_t v115 = *((void *)v9 + 2);
          if (v12 > v115) {
            goto LABEL_131;
          }
          memmove(&v9[16 * v12 + 16], &v9[16 * v12 + 32], 16 * (v115 - v12));
          *((void *)v9 + 2) = v115 - 1;
          unint64_t v12 = v115 - 1;
        }
        while (v115 > 2);
      }
LABEL_110:
      swift_bridgeObjectRelease();
      *(void *)((v131 & 0xFFFFFFFFFFFFFF8) + 0x10) = 0;
      sub_229042330();
      swift_bridgeObjectRelease();
      return;
    }
  }
  else
  {
    uint64_t v7 = v6 >> 1;
    sub_228F8A728(0, (unint64_t *)&qword_2682B5D80);
    uint64_t v8 = sub_229042350();
    *(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10) = v7;
    v127 = (void **)((v8 & 0xFFFFFFFFFFFFFF8) + 32);
    uint64_t v131 = v8;
  }
  uint64_t v10 = 0;
  uint64_t v11 = *a1;
  uint64_t v116 = *a1 - 8;
  uint64_t v117 = *a1 + 16;
  unint64_t v9 = (char *)MEMORY[0x263F8EE78];
  uint64_t v123 = v4;
  uint64_t v129 = *a1;
  while (1)
  {
    uint64_t v13 = v10++;
    uint64_t v124 = v13;
    if (v10 < v4)
    {
      uint64_t v14 = *(void **)(v11 + 8 * v10);
      uint64_t v15 = *(void **)(v11 + 8 * v13);
      int64_t v16 = self;
      id v17 = v14;
      id v18 = v15;
      id v125 = v16;
      uint64_t v19 = [v16 *a2];
      BOOL v20 = (uint64_t (*)(void *, id, id))v19[2];
      id v21 = v17;
      id v22 = v18;
      uint64_t v23 = v20(v19, v21, v22);
      _Block_release(v19);

      uint64_t v13 = v124;
      uint64_t v4 = v123;
      uint64_t v10 = v124 + 2;
      if (v124 + 2 < v123)
      {
        char v118 = v9;
        uint64_t v24 = (id *)(v117 + 8 * v124);
        while (1)
        {
          uint64_t v25 = *(v24 - 1);
          id v26 = *v24;
          id v27 = v25;
          uint64_t v28 = [v125 *a2];
          int64_t v29 = (uint64_t (*)(void *, id, id))v28[2];
          id v30 = v26;
          id v31 = v27;
          uint64_t v32 = v29(v28, v30, v31);
          _Block_release(v28);

          if ((v23 == -1) == (v32 != -1)) {
            break;
          }
          ++v10;
          ++v24;
          uint64_t v4 = v123;
          if (v123 == v10)
          {
            uint64_t v10 = v123;
            unint64_t v9 = v118;
            goto LABEL_22;
          }
        }
        unint64_t v9 = v118;
        uint64_t v4 = v123;
LABEL_22:
        uint64_t v13 = v124;
      }
      if (v23 == -1)
      {
        if (v10 < v13) {
          goto LABEL_136;
        }
        if (v13 < v10)
        {
          int64_t v33 = (uint64_t *)(v116 + 8 * v10);
          uint64_t v34 = v10;
          uint64_t v35 = v13;
          int64_t v36 = (uint64_t *)(v129 + 8 * v13);
          do
          {
            if (v35 != --v34)
            {
              if (!v129) {
                goto LABEL_139;
              }
              uint64_t v37 = *v36;
              *int64_t v36 = *v33;
              *int64_t v33 = v37;
            }
            ++v35;
            --v33;
            ++v36;
          }
          while (v35 < v34);
        }
      }
    }
    if (v10 < v4)
    {
      if (__OFSUB__(v10, v13)) {
        goto LABEL_132;
      }
      if (v10 - v13 < v121) {
        break;
      }
    }
LABEL_49:
    if (v10 < v13) {
      goto LABEL_127;
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      unint64_t v9 = sub_22903E0E4(0, *((void *)v9 + 2) + 1, 1, v9);
    }
    unint64_t v55 = *((void *)v9 + 2);
    unint64_t v54 = *((void *)v9 + 3);
    unint64_t v12 = v55 + 1;
    uint64_t v11 = v129;
    if (v55 >= v54 >> 1)
    {
      uint64_t v109 = sub_22903E0E4((char *)(v54 > 1), v55 + 1, 1, v9);
      uint64_t v11 = v129;
      unint64_t v9 = v109;
    }
    *((void *)v9 + 2) = v12;
    long long v56 = v9 + 32;
    long long v57 = &v9[16 * v55 + 32];
    *(void *)long long v57 = v13;
    *((void *)v57 + 1) = v10;
    if (v55)
    {
      while (1)
      {
        unint64_t v58 = v12 - 1;
        if (v12 >= 4)
        {
          uint64_t v63 = &v56[16 * v12];
          uint64_t v64 = *((void *)v63 - 8);
          uint64_t v65 = *((void *)v63 - 7);
          BOOL v69 = __OFSUB__(v65, v64);
          uint64_t v66 = v65 - v64;
          if (v69) {
            goto LABEL_116;
          }
          uint64_t v68 = *((void *)v63 - 6);
          uint64_t v67 = *((void *)v63 - 5);
          BOOL v69 = __OFSUB__(v67, v68);
          uint64_t v61 = v67 - v68;
          char v62 = v69;
          if (v69) {
            goto LABEL_117;
          }
          unint64_t v70 = v12 - 2;
          v71 = &v56[16 * v12 - 32];
          uint64_t v73 = *(void *)v71;
          uint64_t v72 = *((void *)v71 + 1);
          BOOL v69 = __OFSUB__(v72, v73);
          uint64_t v74 = v72 - v73;
          if (v69) {
            goto LABEL_119;
          }
          BOOL v69 = __OFADD__(v61, v74);
          uint64_t v75 = v61 + v74;
          if (v69) {
            goto LABEL_122;
          }
          if (v75 >= v66)
          {
            uint64_t v93 = &v56[16 * v58];
            uint64_t v95 = *(void *)v93;
            uint64_t v94 = *((void *)v93 + 1);
            BOOL v69 = __OFSUB__(v94, v95);
            uint64_t v96 = v94 - v95;
            if (v69) {
              goto LABEL_126;
            }
            BOOL v86 = v61 < v96;
            goto LABEL_86;
          }
        }
        else
        {
          if (v12 != 3)
          {
            uint64_t v87 = *((void *)v9 + 4);
            uint64_t v88 = *((void *)v9 + 5);
            BOOL v69 = __OFSUB__(v88, v87);
            uint64_t v80 = v88 - v87;
            char v81 = v69;
            goto LABEL_80;
          }
          uint64_t v60 = *((void *)v9 + 4);
          uint64_t v59 = *((void *)v9 + 5);
          BOOL v69 = __OFSUB__(v59, v60);
          uint64_t v61 = v59 - v60;
          char v62 = v69;
        }
        if (v62) {
          goto LABEL_118;
        }
        unint64_t v70 = v12 - 2;
        uint64_t v76 = &v56[16 * v12 - 32];
        uint64_t v78 = *(void *)v76;
        uint64_t v77 = *((void *)v76 + 1);
        BOOL v79 = __OFSUB__(v77, v78);
        uint64_t v80 = v77 - v78;
        char v81 = v79;
        if (v79) {
          goto LABEL_121;
        }
        uint64_t v82 = &v56[16 * v58];
        uint64_t v84 = *(void *)v82;
        uint64_t v83 = *((void *)v82 + 1);
        BOOL v69 = __OFSUB__(v83, v84);
        uint64_t v85 = v83 - v84;
        if (v69) {
          goto LABEL_124;
        }
        if (__OFADD__(v80, v85)) {
          goto LABEL_125;
        }
        if (v80 + v85 >= v61)
        {
          BOOL v86 = v61 < v85;
LABEL_86:
          if (v86) {
            unint64_t v58 = v70;
          }
          goto LABEL_88;
        }
LABEL_80:
        if (v81) {
          goto LABEL_120;
        }
        uint64_t v89 = &v56[16 * v58];
        uint64_t v91 = *(void *)v89;
        uint64_t v90 = *((void *)v89 + 1);
        BOOL v69 = __OFSUB__(v90, v91);
        uint64_t v92 = v90 - v91;
        if (v69) {
          goto LABEL_123;
        }
        if (v92 < v80) {
          goto LABEL_14;
        }
LABEL_88:
        unint64_t v97 = v58 - 1;
        if (v58 - 1 >= v12)
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
          goto LABEL_135;
        }
        if (!v11) {
          goto LABEL_138;
        }
        uint64_t v98 = v10;
        uint64_t v99 = v9;
        uint64_t v100 = v56;
        uint64_t v101 = &v56[16 * v97];
        uint64_t v102 = *(void *)v101;
        uint64_t v103 = v100;
        unint64_t v104 = v58;
        uint64_t v105 = &v100[16 * v58];
        uint64_t v106 = *((void *)v105 + 1);
        sub_22903633C((id *)(v11 + 8 * *(void *)v101), (id *)(v11 + 8 * *(void *)v105), v11 + 8 * v106, v127, a2);
        if (v128) {
          goto LABEL_110;
        }
        if (v106 < v102) {
          goto LABEL_113;
        }
        if (v104 > *((void *)v99 + 2)) {
          goto LABEL_114;
        }
        unint64_t v107 = v104;
        *(void *)uint64_t v101 = v102;
        *(void *)&v103[16 * v97 + 8] = v106;
        unint64_t v108 = *((void *)v99 + 2);
        if (v104 >= v108) {
          goto LABEL_115;
        }
        long long v56 = v103;
        unint64_t v9 = v99;
        uint64_t v128 = 0;
        unint64_t v12 = v108 - 1;
        memmove(v105, v105 + 16, 16 * (v108 - 1 - v107));
        *((void *)v99 + 2) = v108 - 1;
        uint64_t v11 = v129;
        uint64_t v10 = v98;
        if (v108 <= 2) {
          goto LABEL_14;
        }
      }
    }
    unint64_t v12 = 1;
LABEL_14:
    uint64_t v4 = v123;
    if (v10 >= v123) {
      goto LABEL_99;
    }
  }
  if (__OFADD__(v13, v121)) {
    goto LABEL_134;
  }
  if (v13 + v121 >= v4) {
    uint64_t v38 = v4;
  }
  else {
    uint64_t v38 = v13 + v121;
  }
  if (v38 >= v13)
  {
    if (v10 != v38)
    {
      unint64_t v119 = v9;
      uint64_t v39 = self;
      uint64_t v40 = v129;
      int64_t v41 = (void *)v39;
      uint64_t v42 = (void **)(v116 + 8 * v10);
      uint64_t v122 = v38;
      do
      {
        long long v43 = *(void **)(v40 + 8 * v10);
        uint64_t v44 = v13;
        uint64_t v126 = v42;
        while (1)
        {
          uint64_t v45 = *v42;
          id v46 = v43;
          id v47 = v45;
          unint64_t v48 = [v41 *a2];
          uint64_t v49 = (uint64_t (*)(void *, id, id))v48[2];
          id v50 = v46;
          id v51 = v47;
          uint64_t v52 = v49(v48, v50, v51);
          _Block_release(v48);

          if (v52 != -1) {
            break;
          }
          uint64_t v40 = v129;
          if (!v129) {
            goto LABEL_137;
          }
          uint64_t v53 = *v42;
          long long v43 = v42[1];
          *uint64_t v42 = v43;
          v42[1] = v53;
          --v42;
          if (v10 == ++v44) {
            goto LABEL_42;
          }
        }
        uint64_t v40 = v129;
LABEL_42:
        ++v10;
        uint64_t v13 = v124;
        uint64_t v42 = v126 + 1;
      }
      while (v10 != v122);
      uint64_t v10 = v122;
      unint64_t v9 = v119;
    }
    goto LABEL_49;
  }
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
  sub_229042760();
  __break(1u);
}

void sub_2290361FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, SEL *a5)
{
  if (a3 != a2)
  {
    uint64_t v5 = a3;
    uint64_t v6 = *a4;
    id v23 = self;
    uint64_t v7 = v6;
    uint64_t v8 = v6 + 8 * v5 - 8;
LABEL_5:
    unint64_t v9 = *(void **)(v7 + 8 * v5);
    uint64_t v10 = a1;
    uint64_t v22 = v8;
    while (1)
    {
      uint64_t v11 = *(void **)v8;
      id v12 = v9;
      id v13 = v11;
      uint64_t v14 = [v23 *a5];
      uint64_t v15 = (uint64_t (*)(void *, id, id))v14[2];
      id v16 = v12;
      id v17 = v13;
      uint64_t v18 = v15(v14, v16, v17);
      _Block_release(v14);

      if (v18 != -1)
      {
LABEL_4:
        ++v5;
        uint64_t v8 = v22 + 8;
        if (v5 == a2) {
          return;
        }
        goto LABEL_5;
      }
      if (!v7) {
        break;
      }
      uint64_t v19 = *(void **)v8;
      unint64_t v9 = *(void **)(v8 + 8);
      *(void *)uint64_t v8 = v9;
      *(void *)(v8 + 8) = v19;
      v8 -= 8;
      if (v5 == ++v10) {
        goto LABEL_4;
      }
    }
    __break(1u);
  }
}

uint64_t sub_22903633C(id *a1, id *__src, unint64_t a3, void **__dst, SEL *a5)
{
  uint64_t v5 = __dst;
  uint64_t v6 = __src;
  uint64_t v7 = (char *)__src - (char *)a1;
  uint64_t v8 = (char *)__src - (char *)a1 + 7;
  if ((char *)__src - (char *)a1 >= 0) {
    uint64_t v8 = (char *)__src - (char *)a1;
  }
  uint64_t v9 = v8 >> 3;
  uint64_t v10 = a3 - (void)__src;
  uint64_t v11 = a3 - (void)__src + 7;
  if ((uint64_t)(a3 - (void)__src) >= 0) {
    uint64_t v11 = a3 - (void)__src;
  }
  uint64_t v12 = v11 >> 3;
  uint64_t v49 = a1;
  unint64_t v48 = __dst;
  if (v9 >= v11 >> 3)
  {
    if (v10 < -7) {
      goto LABEL_48;
    }
    if (__dst != __src || &__src[v12] <= __dst) {
      memmove(__dst, __src, 8 * v12);
    }
    uint64_t v25 = &v5[v12];
    id v47 = v25;
    uint64_t v49 = v6;
    if (a1 >= v6 || v10 < 8) {
      goto LABEL_47;
    }
    id v39 = self;
    uint64_t v40 = v5;
    id v26 = (id *)(a3 - 8);
    id v27 = v6;
    while (1)
    {
      uint64_t v44 = v26 + 1;
      id v46 = v6;
      uint64_t v28 = v25 - 1;
      int64_t v29 = *--v27;
      id v30 = *(v25 - 1);
      id v31 = v29;
      uint64_t v32 = [v39 *a5];
      int64_t v33 = (uint64_t (*)(void *, id, id))v32[2];
      id v34 = v30;
      id v35 = v31;
      uint64_t v36 = v33(v32, v34, v35);
      _Block_release(v32);

      if (v36 == -1)
      {
        if (v44 != v46 || v26 >= v46) {
          *id v26 = *v27;
        }
        uint64_t v49 = v27;
      }
      else
      {
        id v47 = v25 - 1;
        id v27 = v46;
        if (v44 >= v25 && v26 < v25)
        {
          uint64_t v37 = v40;
          if (v44 != v25) {
            *id v26 = *v28;
          }
          --v25;
          goto LABEL_43;
        }
        *id v26 = *v28;
        --v25;
      }
      uint64_t v37 = v40;
LABEL_43:
      if (v27 > a1)
      {
        --v26;
        uint64_t v6 = v27;
        if (v25 > v37) {
          continue;
        }
      }
      goto LABEL_47;
    }
  }
  if (v7 >= -7)
  {
    if (__dst != a1 || &a1[v9] <= __dst) {
      memmove(__dst, a1, 8 * v9);
    }
    id v13 = &v5[v9];
    id v47 = v13;
    if ((unint64_t)v6 < a3 && v7 >= 8)
    {
      long long v43 = self;
      uint64_t v14 = a1;
      do
      {
        uint64_t v15 = *v5;
        id v16 = *v6;
        id v17 = v15;
        uint64_t v18 = [v43 *a5];
        uint64_t v19 = (uint64_t (*)(void *, id, id))v18[2];
        id v20 = v16;
        id v21 = v17;
        uint64_t v22 = v6;
        uint64_t v23 = v19(v18, v20, v21);
        _Block_release(v18);

        if (v23 == -1)
        {
          uint64_t v24 = v22 + 1;
          if (v14 < v22 || v14 >= v24 || v14 != v22) {
            *uint64_t v14 = *v22;
          }
        }
        else
        {
          if (v14 != v5) {
            *uint64_t v14 = *v5;
          }
          unint64_t v48 = ++v5;
          uint64_t v24 = v22;
        }
        ++v14;
        if (v5 >= v13) {
          break;
        }
        uint64_t v6 = v24;
      }
      while ((unint64_t)v24 < a3);
      uint64_t v49 = v14;
    }
LABEL_47:
    sub_22903E1E0((void **)&v49, (const void **)&v48, &v47);
    return 1;
  }
LABEL_48:
  uint64_t result = sub_2290427C0();
  __break(1u);
  return result;
}

unint64_t *sub_2290366F8(uint64_t isStackAllocationSafe, SEL *a2)
{
  uint64_t v4 = isStackAllocationSafe;
  v11[1] = *MEMORY[0x263EF8340];
  char v5 = *(unsigned char *)(isStackAllocationSafe + 32);
  unint64_t v6 = (unint64_t)((1 << v5) + 63) >> 6;
  size_t v7 = 8 * v6;
  if ((v5 & 0x3Fu) <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x270FA5388](isStackAllocationSafe);
    bzero((char *)v11 - ((v7 + 15) & 0x3FFFFFFFFFFFFFF0), v7);
    uint64_t v8 = sub_2290369F4((void *)((char *)v11 - ((v7 + 15) & 0x3FFFFFFFFFFFFFF0)), v6, v4, a2);
    swift_release();
    if (v2) {
      swift_willThrow();
    }
  }
  else
  {
    uint64_t v9 = (void *)swift_slowAlloc();
    bzero(v9, v7);
    uint64_t v8 = sub_2290369F4((unint64_t *)v9, v6, v4, a2);
    swift_release();
    MEMORY[0x22A6B0490](v9, -1, -1);
  }
  return v8;
}

uint64_t sub_229036870(uint64_t isStackAllocationSafe, char a2, char a3)
{
  uint64_t v6 = isStackAllocationSafe;
  v15[1] = *MEMORY[0x263EF8340];
  char v7 = *(unsigned char *)(isStackAllocationSafe + 32);
  unint64_t v8 = (unint64_t)((1 << v7) + 63) >> 6;
  size_t v9 = 8 * v8;
  if ((v7 & 0x3Fu) <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x270FA5388](isStackAllocationSafe);
    bzero((char *)v15 - ((v9 + 15) & 0x3FFFFFFFFFFFFFF0), v9);
    sub_229036B90((void *)((char *)v15 - ((v9 + 15) & 0x3FFFFFFFFFFFFFF0)), v8, v6, a2 & 1, a3 & 1);
    uint64_t v11 = v10;
    swift_release();
    if (v3) {
      swift_willThrow();
    }
  }
  else
  {
    uint64_t v12 = (void *)swift_slowAlloc();
    bzero(v12, v9);
    sub_229036B90((unint64_t *)v12, v8, v6, a2 & 1, a3 & 1);
    uint64_t v11 = v13;
    swift_release();
    MEMORY[0x22A6B0490](v12, -1, -1);
  }
  return v11;
}

unint64_t *sub_2290369F4(unint64_t *result, uint64_t a2, uint64_t a3, SEL *a4)
{
  uint64_t v6 = result;
  uint64_t v7 = 0;
  int64_t v8 = 0;
  uint64_t v9 = a3 + 56;
  uint64_t v10 = 1 << *(unsigned char *)(a3 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(a3 + 56);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v8 << 6);
      goto LABEL_5;
    }
    int64_t v16 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
      goto LABEL_26;
    }
    if (v16 >= v13) {
      goto LABEL_24;
    }
    unint64_t v17 = *(void *)(v9 + 8 * v16);
    ++v8;
    if (!v17)
    {
      int64_t v8 = v16 + 1;
      if (v16 + 1 >= v13) {
        goto LABEL_24;
      }
      unint64_t v17 = *(void *)(v9 + 8 * v8);
      if (!v17)
      {
        int64_t v8 = v16 + 2;
        if (v16 + 2 >= v13) {
          goto LABEL_24;
        }
        unint64_t v17 = *(void *)(v9 + 8 * v8);
        if (!v17) {
          break;
        }
      }
    }
LABEL_20:
    unint64_t v12 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v8 << 6);
LABEL_5:
    uint64_t result = (unint64_t *)[*(id *)(*(void *)(a3 + 48) + 8 * v15) *a4];
    if (result)
    {
      *(unint64_t *)((char *)v6 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      if (__OFADD__(v7++, 1))
      {
        __break(1u);
LABEL_24:
        sub_229040F70();
        return (unint64_t *)sub_22903E970(v6, a2, v7, a3);
      }
    }
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v13) {
    goto LABEL_24;
  }
  unint64_t v17 = *(void *)(v9 + 8 * v18);
  if (v17)
  {
    int64_t v8 = v18;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v8 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v8 >= v13) {
      goto LABEL_24;
    }
    unint64_t v17 = *(void *)(v9 + 8 * v8);
    ++v18;
    if (v17) {
      goto LABEL_20;
    }
  }
LABEL_26:
  __break(1u);
  return result;
}

void sub_229036B90(unint64_t *a1, uint64_t a2, uint64_t a3, char a4, char a5)
{
  uint64_t v21 = a2;
  int64_t v7 = 0;
  uint64_t v8 = a3 + 56;
  uint64_t v9 = 1 << *(unsigned char *)(a3 + 32);
  uint64_t v10 = -1;
  if (v9 < 64) {
    uint64_t v10 = ~(-1 << v9);
  }
  unint64_t v11 = v10 & *(void *)(a3 + 56);
  int64_t v12 = (unint64_t)(v9 + 63) >> 6;
  while (v11)
  {
    unint64_t v13 = __clz(__rbit64(v11));
    v11 &= v11 - 1;
    unint64_t v14 = v13 | (v7 << 6);
LABEL_18:
    id v18 = *(id *)(*(void *)(a3 + 48) + 8 * v14);
    uint64_t v19 = v18;
    if ((a4 & 1) != 0 && !objc_msgSend(v18, sel_allowsContentModifications)
      || (a5 & 1) != 0 && !objc_msgSend(v19, sel_isDeletable)
      || (objc_msgSend(v19, sel_isSuggestedEventCalendar, v21) & 1) != 0)
    {
    }
    else
    {
      unsigned __int8 v20 = objc_msgSend(v19, sel_isNaturalLanguageSuggestedEventCalendar);

      if ((v20 & 1) == 0)
      {
        *(unint64_t *)((char *)a1 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
        BOOL v15 = __OFADD__(v23++, 1);
        if (v15) {
          goto LABEL_34;
        }
      }
    }
  }
  BOOL v15 = __OFADD__(v7++, 1);
  if (v15)
  {
    __break(1u);
    goto LABEL_33;
  }
  if (v7 >= v12) {
    goto LABEL_31;
  }
  unint64_t v16 = *(void *)(v8 + 8 * v7);
  if (v16)
  {
LABEL_17:
    unint64_t v11 = (v16 - 1) & v16;
    unint64_t v14 = __clz(__rbit64(v16)) + (v7 << 6);
    goto LABEL_18;
  }
  int64_t v17 = v7 + 1;
  if (v7 + 1 >= v12) {
    goto LABEL_31;
  }
  unint64_t v16 = *(void *)(v8 + 8 * v17);
  if (v16) {
    goto LABEL_16;
  }
  int64_t v17 = v7 + 2;
  if (v7 + 2 >= v12) {
    goto LABEL_31;
  }
  unint64_t v16 = *(void *)(v8 + 8 * v17);
  if (v16) {
    goto LABEL_16;
  }
  int64_t v17 = v7 + 3;
  if (v7 + 3 >= v12)
  {
LABEL_31:
    sub_229040F70();
    sub_22903E970(a1, v21, v23, a3);
    return;
  }
  unint64_t v16 = *(void *)(v8 + 8 * v17);
  if (v16)
  {
LABEL_16:
    int64_t v7 = v17;
    goto LABEL_17;
  }
  while (1)
  {
    int64_t v7 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v7 >= v12) {
      goto LABEL_31;
    }
    unint64_t v16 = *(void *)(v8 + 8 * v7);
    ++v17;
    if (v16) {
      goto LABEL_17;
    }
  }
LABEL_33:
  __break(1u);
LABEL_34:
  __break(1u);
}

void sub_229036DA8(unint64_t *a1, uint64_t a2, uint64_t a3, char a4, char a5, void *a6, char a7)
{
  uint64_t v30 = 0;
  int64_t v9 = 0;
  uint64_t v10 = a3 + 56;
  uint64_t v11 = 1 << *(unsigned char *)(a3 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(a3 + 56);
  int64_t v14 = (unint64_t)(v11 + 63) >> 6;
  int64_t v29 = (void *)*MEMORY[0x263F300B0];
  int64_t v31 = v14;
  while (v13)
  {
    unint64_t v15 = __clz(__rbit64(v13));
    v13 &= v13 - 1;
    unint64_t v16 = v15 | (v9 << 6);
LABEL_21:
    unint64_t v20 = v16;
    id v21 = *(id *)(*(void *)(a3 + 48) + 8 * v16);
    uint64_t v22 = v21;
    if ((a4 & 1) != 0 && !objc_msgSend(v21, sel_allowsContentModifications)
      || (a5 & 1) != 0 && !objc_msgSend(v22, sel_isDeletable))
    {
LABEL_4:
    }
    else
    {
      int64_t v23 = v9;
      if (objc_msgSend(a6, sel_sourceType) == (id)5
        || !objc_msgSend(a6, sel_sourceType)
        && objc_msgSend(v22, sel_isSuggestedEventCalendar)
        && (SGAppCanShowSiriSuggestions(v29) & 1) != 0
        || objc_msgSend(a6, sel_sourceType) == (id)4)
      {

LABEL_35:
        *(unint64_t *)((char *)a1 + ((v20 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v20;
        if (__OFADD__(v30++, 1))
        {
          __break(1u);
LABEL_38:
          sub_229040F70();
          sub_22903E970(a1, a2, v30, a3);
          return;
        }
      }
      else
      {
        if ((a7 & 1) == 0) {
          goto LABEL_4;
        }
        id v24 = objc_msgSend(a6, sel_sourceType);

        BOOL v25 = v24 == (id)6;
        int64_t v9 = v23;
        int64_t v14 = v31;
        if (v25) {
          goto LABEL_35;
        }
      }
    }
  }
  int64_t v17 = v9 + 1;
  if (__OFADD__(v9, 1))
  {
    __break(1u);
    goto LABEL_40;
  }
  if (v17 >= v14) {
    goto LABEL_38;
  }
  unint64_t v18 = *(void *)(v10 + 8 * v17);
  ++v9;
  if (v18) {
    goto LABEL_20;
  }
  int64_t v9 = v17 + 1;
  if (v17 + 1 >= v14) {
    goto LABEL_38;
  }
  unint64_t v18 = *(void *)(v10 + 8 * v9);
  if (v18) {
    goto LABEL_20;
  }
  int64_t v9 = v17 + 2;
  if (v17 + 2 >= v14) {
    goto LABEL_38;
  }
  unint64_t v18 = *(void *)(v10 + 8 * v9);
  if (v18)
  {
LABEL_20:
    unint64_t v13 = (v18 - 1) & v18;
    unint64_t v16 = __clz(__rbit64(v18)) + (v9 << 6);
    goto LABEL_21;
  }
  int64_t v19 = v17 + 3;
  if (v19 >= v14) {
    goto LABEL_38;
  }
  unint64_t v18 = *(void *)(v10 + 8 * v19);
  if (v18)
  {
    int64_t v9 = v19;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v9 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v9 >= v14) {
      goto LABEL_38;
    }
    unint64_t v18 = *(void *)(v10 + 8 * v9);
    ++v19;
    if (v18) {
      goto LABEL_20;
    }
  }
LABEL_40:
  __break(1u);
}

uint64_t sub_229037058(uint64_t a1, char a2, char a3, void *a4, char a5)
{
  v23[1] = *MEMORY[0x263EF8340];
  char v10 = *(unsigned char *)(a1 + 32);
  unsigned int v11 = v10 & 0x3F;
  unint64_t v12 = (unint64_t)((1 << v10) + 63) >> 6;
  uint64_t isStackAllocationSafe = a4;
  int64_t v14 = (void *)isStackAllocationSafe;
  if (v11 <= 0xD || (uint64_t isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    v23[0] = v23;
    MEMORY[0x270FA5388](isStackAllocationSafe);
    unint64_t v15 = (char *)v23 - ((8 * v12 + 15) & 0x3FFFFFFFFFFFFFF0);
    bzero(v15, 8 * v12);
    id v16 = v14;
    sub_229036DA8((unint64_t *)v15, v12, a1, a2 & 1, a3 & 1, v16, a5 & 1);
    uint64_t v18 = v17;
    swift_release();

    if (v5) {
      swift_willThrow();
    }
  }
  else
  {
    int64_t v19 = (void *)swift_slowAlloc();
    bzero(v19, 8 * v12);
    id v20 = v14;
    sub_229036DA8((unint64_t *)v19, v12, a1, a2 & 1, a3 & 1, v20, a5 & 1);
    uint64_t v18 = v21;
    swift_release();

    MEMORY[0x22A6B0490](v19, -1, -1);
  }
  return v18;
}

uint64_t _s12CalendarLink0A12ListGroupingV6groups14withEventStore16includeDelegates12writableOnly09deletableL00I18IntegrationSourcesSayAC5GroupOGSo07EKEventH0C_S4btFZ_0(void *a1, char a2, char a3, unint64_t a4, char a5)
{
  LOBYTE(v97) = a5;
  LOBYTE(v94) = a2;
  uint64_t v7 = (uint64_t)objc_msgSend(a1, sel_sortedSourcesEnabledForEntityType_, 0);
  sub_228F8A728(0, (unint64_t *)&qword_2682B6900);
  uint64_t v8 = sub_229042310();

  id v9 = (id)MEMORY[0x263F8EE78];
  unint64_t v107 = (void *)MEMORY[0x263F8EE78];
  if ((unint64_t)v8 >> 62) {
    goto LABEL_126;
  }
  uint64_t v10 = *(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10);
  sub_229041250();
LABEL_3:
  unsigned int v98 = a4;
  if (v10)
  {
    if (v10 >= 1)
    {
      uint64_t v11 = 0;
      unint64_t v12 = v8 & 0xC000000000000001;
      uint64_t v88 = v8 + 32;
      uint64_t v90 = v8;
      uint64_t v91 = (void *)MEMORY[0x263F8EE78];
      uint64_t v92 = v10;
      unint64_t v95 = v8 & 0xC000000000000001;
      do
      {
        if (v12) {
          id v13 = (id)MEMORY[0x22A6AFAB0](v11, v8);
        }
        else {
          id v13 = *(id *)(v8 + 8 * v11 + 32);
        }
        id v9 = v13;
        if (!objc_msgSend(v13, sel_isEnabledForEvents, v88)
          || !objc_msgSend(v9, sel_sourceType)
          || objc_msgSend(v9, sel_sourceType) == (id)5
          || objc_msgSend(v9, sel_sourceType) == (id)4
          || objc_msgSend(v9, sel_sourceType) == (id)6
          || (objc_msgSend(v9, sel_isDelegate) & 1) != 0)
        {
        }
        else
        {
          id v14 = objc_msgSend(v9, sel_calendarsForEntityType_, 0);
          sub_228F8A728(0, (unint64_t *)&qword_2682B5D80);
          sub_228FD2D88();
          uint64_t v15 = sub_229042410();

          if ((v15 & 0xC000000000000001) != 0) {
            uint64_t v16 = sub_229042610();
          }
          else {
            uint64_t v16 = *(void *)(v15 + 16);
          }
          swift_bridgeObjectRelease();
          if (!v16 || (sub_229034CCC(v9, a3 & 1, a4 & 1, (uint64_t)&v100), unsigned __int8 v17 = v102, v102 == 255))
          {

            uint64_t v8 = v90;
            unint64_t v12 = v95;
          }
          else
          {
            uint64_t v18 = v100;
            uint64_t v19 = v101;
            sub_228FA4924(v100, v101, v102);
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
              uint64_t v91 = sub_228F9F64C(0, v91[2] + 1, 1, v91);
            }
            unint64_t v21 = v91[2];
            unint64_t v20 = v91[3];
            if (v21 >= v20 >> 1) {
              uint64_t v91 = sub_228F9F64C((void *)(v20 > 1), v21 + 1, 1, v91);
            }
            v91[2] = v21 + 1;
            uint64_t v22 = &v91[3 * v21];
            v22[4] = v18;
            v22[5] = v19;
            *((unsigned char *)v22 + 48) = v17;

            sub_22903839C(v18, v19, v17);
            unint64_t v107 = v91;
            a4 = v98;
            uint64_t v8 = v90;
            uint64_t v10 = v92;
            unint64_t v12 = v95;
          }
        }
        ++v11;
      }
      while (v10 != v11);
      swift_bridgeObjectRelease();
      unint64_t v23 = 0;
      unint64_t v105 = MEMORY[0x263F8EE78];
      unint64_t v106 = MEMORY[0x263F8EE78];
      unint64_t v104 = MEMORY[0x263F8EE78];
      uint64_t v89 = v8 & 0xFFFFFFFFFFFFFF8;
      id v24 = (SEL *)&unk_264859000;
      while (1)
      {
        if (v95)
        {
          id v26 = (id)MEMORY[0x22A6AFAB0](v23, v8);
        }
        else
        {
          if (v23 >= *(void *)(v89 + 16)) {
            goto LABEL_125;
          }
          id v26 = *(id *)(v88 + 8 * v23);
        }
        id v27 = v26;
        if ([v26 v24[407]])
        {
          if ((v94 & 1) == 0) {
            goto LABEL_47;
          }
        }
        else
        {
          id v28 = v27;
          MEMORY[0x22A6AF6E0]();
          if (*(void *)((v105 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v105 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
            sub_229042340();
          }
          sub_229042360();
          sub_229042330();
          if ((v94 & 1) == 0)
          {
LABEL_47:
            id v29 = objc_msgSend(v27, sel_calendarsForEntityType_, 0);
            id v9 = (id)sub_228F8A728(0, (unint64_t *)&qword_2682B5D80);
            sub_228FD2D88();
            uint64_t v30 = sub_229042410();

            if ((v30 & 0xC000000000000001) != 0)
            {
              int64_t v31 = (void *)MEMORY[0x263F8EE88];
              uint64_t v100 = (void *)MEMORY[0x263F8EE88];
              uint64_t v8 = v27;
              sub_2290425D0();
              uint64_t v32 = sub_229042640();
              if (v32)
              {
                id v24 = (SEL *)&unk_264859000;
LABEL_52:
                id v99 = (id)v32;
                swift_dynamicCast();
                id v33 = v103[0];
                if ((a3 & 1) != 0 && !objc_msgSend(v103[0], sel_allowsContentModifications)
                  || (a4 & 1) != 0 && !objc_msgSend(v33, sel_isDeletable)
                  || [(id)v8 v24[407]] != (id)5
                  && ([(id)v8 v24[407]]
                   || !objc_msgSend(v33, sel_isSuggestedEventCalendar)
                   || (sub_2290422B0(),
                       id v34 = (void *)sub_2290422A0(),
                       swift_bridgeObjectRelease(),
                       char CanShowSiriSuggestions = SGAppCanShowSiriSuggestions(v34),
                       v34,
                       id v24 = (SEL *)&unk_264859000,
                       (CanShowSiriSuggestions & 1) == 0))
                  && [(id)v8 v24[407]] != (id)4
                  && ((v97 & 1) == 0 || [(id)v8 v24[407]] != (id)6))
                {

                  goto LABEL_51;
                }
                id v36 = v103[0];
                a4 = (unint64_t)v100;
                if (*((void *)v100 + 3) <= *((void *)v100 + 2))
                {
                  sub_22903E36C();
                  a4 = (unint64_t)v100;
                }
                uint64_t v37 = sub_229042510();
                unint64_t v38 = a4 + 56;
                uint64_t v39 = -1 << *(unsigned char *)(a4 + 32);
                unint64_t v40 = v37 & ~v39;
                unint64_t v41 = v40 >> 6;
                if (((-1 << v40) & ~*(void *)(a4 + 56 + 8 * (v40 >> 6))) != 0)
                {
                  unint64_t v42 = __clz(__rbit64((-1 << v40) & ~*(void *)(a4 + 56 + 8 * (v40 >> 6)))) | v40 & 0x7FFFFFFFFFFFFFC0;
                  goto LABEL_73;
                }
                char v43 = 0;
                unint64_t v44 = (unint64_t)(63 - v39) >> 6;
                while (++v41 != v44 || (v43 & 1) == 0)
                {
                  BOOL v45 = v41 == v44;
                  if (v41 == v44) {
                    unint64_t v41 = 0;
                  }
                  v43 |= v45;
                  uint64_t v46 = *(void *)(v38 + 8 * v41);
                  if (v46 != -1)
                  {
                    unint64_t v42 = __clz(__rbit64(~v46)) + (v41 << 6);
LABEL_73:
                    *(void *)(v38 + ((v42 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v42;
                    *(void *)(*(void *)(a4 + 48) + 8 * v42) = v36;
                    ++*(void *)(a4 + 16);
                    a4 = v98;
                    id v24 = (SEL *)&unk_264859000;
LABEL_51:
                    uint64_t v32 = sub_229042640();
                    if (!v32)
                    {
                      id v9 = v100;
                      goto LABEL_79;
                    }
                    goto LABEL_52;
                  }
                }
                __break(1u);
LABEL_123:
                __break(1u);
LABEL_124:
                __break(1u);
LABEL_125:
                __break(1u);
LABEL_126:
                if (v8 < 0) {
                  uint64_t v7 = v8;
                }
                else {
                  uint64_t v7 = v8 & 0xFFFFFFFFFFFFFF8;
                }
                sub_229041250();
                uint64_t v10 = sub_229042780();
                goto LABEL_3;
              }
              id v9 = v31;
              id v24 = (SEL *)&unk_264859000;
LABEL_79:

              swift_release();
              uint64_t v8 = v90;
            }
            else
            {
              id v25 = v27;
              id v9 = (id)sub_229037058(v30, a3 & 1, a4 & 1, v25, v97 & 1);

              id v24 = (SEL *)&unk_264859000;
            }
            sub_22903514C((uint64_t)v9);
            goto LABEL_31;
          }
        }
        if (!objc_msgSend(v27, sel_isDelegate) || !objc_msgSend(v27, sel_isEnabled)) {
          goto LABEL_47;
        }
        id v9 = v27;
        MEMORY[0x22A6AF6E0]();
        if (*(void *)((v104 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v104 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_229042340();
        }
        sub_229042360();
        sub_229042330();
        id v24 = (SEL *)&unk_264859000;
LABEL_31:
        ++v23;

        if (v23 == v92)
        {
          swift_bridgeObjectRelease();
          unint64_t v47 = v105;
          id v9 = (id)MEMORY[0x263F8EE78];
          goto LABEL_82;
        }
      }
    }
    __break(1u);
LABEL_172:
    __break(1u);
    goto LABEL_173;
  }
  swift_bridgeObjectRelease();
  unint64_t v105 = (unint64_t)v9;
  unint64_t v106 = (unint64_t)v9;
  unint64_t v104 = (unint64_t)v9;
  swift_bridgeObjectRelease();
  unint64_t v47 = (unint64_t)v9;
LABEL_82:
  sub_22903574C(&v106, (SEL *)&selRef_ekOtherCalendarComparator);
  uint64_t v100 = v9;
  if (v47 >> 62)
  {
    swift_bridgeObjectRetain_n();
    id v9 = (id)sub_229042780();
  }
  else
  {
    id v9 = *(id *)((v47 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain_n();
  }
  if (v9)
  {
    uint64_t v8 = 0;
    id v96 = v9;
    unint64_t v97 = v47 & 0xC000000000000001;
    uint64_t v93 = (char *)(v47 + 32);
    unint64_t v94 = v47;
    do
    {
      if (v97) {
        id v49 = (id)MEMORY[0x22A6AFAB0](v8, v94);
      }
      else {
        id v49 = *(id *)&v93[8 * v8];
      }
      id v50 = v49;
      if (__OFADD__(v8++, 1)) {
        goto LABEL_124;
      }
      id v52 = objc_msgSend(v49, sel_calendarsForEntityType_, 0);
      sub_228F8A728(0, (unint64_t *)&qword_2682B5D80);
      sub_228FD2D88();
      uint64_t v53 = sub_229042410();

      if ((v53 & 0xC000000000000001) != 0)
      {
        uint64_t v48 = MEMORY[0x263F8EE88];
        v103[0] = (id)MEMORY[0x263F8EE88];
        id v9 = (id)sub_2290425D0();
        if (sub_229042640())
        {
          do
          {
            swift_dynamicCast();
            if ((a3 & 1) != 0 && !objc_msgSend(v99, sel_allowsContentModifications)
              || (a4 & 1) != 0 && !objc_msgSend(v99, sel_isDeletable)
              || (objc_msgSend(v99, sel_isSuggestedEventCalendar) & 1) != 0
              || (objc_msgSend(v99, sel_isNaturalLanguageSuggestedEventCalendar) & 1) != 0)
            {
            }
            else
            {
              a4 = (unint64_t)v103[0];
              if (*((void *)v103[0] + 3) <= *((void *)v103[0] + 2))
              {
                sub_22903E36C();
                a4 = (unint64_t)v103[0];
              }
              uint64_t v54 = sub_229042510();
              unint64_t v55 = a4 + 56;
              uint64_t v56 = -1 << *(unsigned char *)(a4 + 32);
              unint64_t v57 = v54 & ~v56;
              unint64_t v58 = v57 >> 6;
              if (((-1 << v57) & ~*(void *)(a4 + 56 + 8 * (v57 >> 6))) != 0)
              {
                unint64_t v59 = __clz(__rbit64((-1 << v57) & ~*(void *)(a4 + 56 + 8 * (v57 >> 6)))) | v57 & 0x7FFFFFFFFFFFFFC0;
              }
              else
              {
                char v60 = 0;
                unint64_t v61 = (unint64_t)(63 - v56) >> 6;
                do
                {
                  if (++v58 == v61 && (v60 & 1) != 0) {
                    goto LABEL_123;
                  }
                  BOOL v62 = v58 == v61;
                  if (v58 == v61) {
                    unint64_t v58 = 0;
                  }
                  v60 |= v62;
                  uint64_t v63 = *(void *)(v55 + 8 * v58);
                }
                while (v63 == -1);
                unint64_t v59 = __clz(__rbit64(~v63)) + (v58 << 6);
              }
              *(void *)(v55 + ((v59 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v59;
              *(void *)(*(void *)(a4 + 48) + 8 * v59) = v99;
              ++*(void *)(a4 + 16);
              a4 = v98;
            }
          }
          while (sub_229042640());
          uint64_t v48 = (uint64_t)v103[0];
        }

        swift_release();
      }
      else
      {
        uint64_t v48 = sub_229036870(v53, a3 & 1, a4 & 1);
      }
      id v9 = v96;
      sub_22903514C(v48);
    }
    while ((id)v8 != v96);
    swift_bridgeObjectRelease_n();
    unint64_t v64 = (unint64_t)v100;
  }
  else
  {
    swift_bridgeObjectRelease_n();
    unint64_t v64 = MEMORY[0x263F8EE78];
  }
  v103[0] = (id)v64;
  if (v64 >> 62)
  {
    sub_229041250();
    uint64_t v65 = sub_229042780();
    swift_bridgeObjectRelease();
    if (v65) {
      goto LABEL_122;
    }
  }
  else if (*(void *)((v64 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_122:
    sub_22903574C((unint64_t *)v103, (SEL *)&selRef_ekCalendarComparator);
    swift_bridgeObjectRelease();
    sub_2290357DC(0, 0, (uint64_t)v103[0], 0, 1);
    goto LABEL_133;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
LABEL_133:
  a4 = v104;
  if (v104 >> 62) {
    goto LABEL_161;
  }
  uint64_t v7 = *(void *)((v104 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (v7)
  {
    if (v7 < 1) {
      goto LABEL_172;
    }
    uint64_t v66 = 0;
    while (1)
    {
      id v67 = (a4 & 0xC000000000000001) != 0
          ? (id)MEMORY[0x22A6AFAB0](v66, a4)
          : *(id *)(a4 + 8 * v66 + 32);
      uint64_t v68 = v67;
      id v69 = objc_msgSend(v67, sel_calendarsForEntityType_, 0);
      sub_228F8A728(0, (unint64_t *)&qword_2682B5D80);
      sub_228FD2D88();
      uint64_t v70 = sub_229042410();

      if ((v70 & 0xC000000000000001) == 0) {
        break;
      }
      if (sub_229042610())
      {
        id v71 = v68;
        uint64_t v72 = sub_229042610();
        if (v72)
        {
          uint64_t v73 = v72;
          if (v72 > 0) {
            goto LABEL_149;
          }
          uint64_t v74 = (void *)MEMORY[0x263F8EE78];
          goto LABEL_152;
        }
        swift_bridgeObjectRelease();
        uint64_t v74 = (void *)MEMORY[0x263F8EE78];
LABEL_155:
        BOOL v79 = v107;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          BOOL v79 = sub_228F9F64C(0, v79[2] + 1, 1, v79);
        }
        unint64_t v81 = v79[2];
        unint64_t v80 = v79[3];
        if (v81 >= v80 >> 1) {
          BOOL v79 = sub_228F9F64C((void *)(v80 > 1), v81 + 1, 1, v79);
        }
        v79[2] = v81 + 1;
        uint64_t v82 = &v79[3 * v81];
        v82[4] = v68;
        v82[5] = v74;
        *((unsigned char *)v82 + 48) = 0;

        unint64_t v107 = v79;
        goto LABEL_138;
      }
LABEL_137:

      swift_bridgeObjectRelease();
LABEL_138:
      if (v7 == ++v66) {
        goto LABEL_162;
      }
    }
    uint64_t v73 = *(void *)(v70 + 16);
    if (!v73) {
      goto LABEL_137;
    }
    id v75 = v68;
LABEL_149:
    __swift_instantiateConcreteTypeFromMangledName(&qword_2682B5D00);
    uint64_t v74 = (void *)swift_allocObject();
    int64_t v76 = _swift_stdlib_malloc_size(v74);
    uint64_t v77 = v76 - 32;
    if (v76 < 32) {
      uint64_t v77 = v76 - 25;
    }
    v74[2] = v73;
    v74[3] = (2 * (v77 >> 3)) | 1;
LABEL_152:
    sub_229041250();
    uint64_t v78 = sub_228FCF9D8(&v100, v74 + 4, v73, v70);
    sub_228FCC1B0();
    if (v78 == (void *)v73)
    {
      swift_bridgeObjectRelease();
      goto LABEL_155;
    }
    __break(1u);
LABEL_161:
    sub_229041250();
    uint64_t v7 = sub_229042780();
    swift_bridgeObjectRelease();
  }
LABEL_162:
  swift_bridgeObjectRelease();
  a4 = v106;
  if (!(v106 >> 62))
  {
    if (*(void *)((v106 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_164;
    }
LABEL_169:
    swift_bridgeObjectRelease();
    return (uint64_t)v107;
  }
  sub_229041250();
  uint64_t v86 = sub_229042780();
  swift_bridgeObjectRelease();
  if (!v86) {
    goto LABEL_169;
  }
LABEL_164:
  uint64_t v7 = (uint64_t)v107;
  sub_229041250();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
LABEL_173:
  }
    uint64_t v7 = (uint64_t)sub_228F9F64C(0, *(void *)(v7 + 16) + 1, 1, (void *)v7);
  unint64_t v84 = *(void *)(v7 + 16);
  unint64_t v83 = *(void *)(v7 + 24);
  if (v84 >= v83 >> 1) {
    uint64_t v7 = (uint64_t)sub_228F9F64C((void *)(v83 > 1), v84 + 1, 1, (void *)v7);
  }
  *(void *)(v7 + 16) = v84 + 1;
  uint64_t v85 = v7 + 24 * v84;
  *(void *)(v85 + 32) = a4;
  *(void *)(v85 + 40) = 0;
  *(unsigned char *)(v85 + 48) = 2;
  swift_bridgeObjectRelease();
  return v7;
}

ValueMetadata *type metadata accessor for CalendarListGrouping()
{
  return &type metadata for CalendarListGrouping;
}

void *destroy for CalendarListGrouping.Group(uint64_t a1)
{
  return sub_228FA49E4(*(void **)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t _s12CalendarLink20CalendarListGroupingV5GroupOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 16);
  sub_228FA4924(*(void **)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for CalendarListGrouping.Group(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 16);
  sub_228FA4924(*(void **)a2, v4, v5);
  uint64_t v6 = *(void **)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  unsigned __int8 v8 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v5;
  sub_228FA49E4(v6, v7, v8);
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for CalendarListGrouping.Group(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void **)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  unsigned __int8 v6 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v3;
  sub_228FA49E4(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for CalendarListGrouping.Group(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFE && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 254);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 2) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for CalendarListGrouping.Group(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 254;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_229038310(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_229038318(uint64_t result, char a2)
{
  *(unsigned char *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for CalendarListGrouping.Group()
{
  return &type metadata for CalendarListGrouping.Group;
}

uint64_t SGAppCanShowSiriSuggestions(void *a1)
{
  id v1 = a1;
  uint64_t v2 = (id)(id)CFPreferencesCopyAppValue(@"AppCanShowSiriSuggestionsBlacklist", @"com.apple.suggestions");
  int v3 = [v2 containsObject:v1];

  return v3 ^ 1u;
}

void *sub_22903839C(void *result, uint64_t a2, unsigned __int8 a3)
{
  if (a3 != 0xFF) {
    return sub_228FA49E4(result, a2, a3);
  }
  return result;
}

id sub_2290383B0()
{
  id result = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for CalendarLinkObservation()), sel_init);
  qword_26AF65E20 = (uint64_t)result;
  return result;
}

char *sub_2290383E0()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AF65DD8);
  MEMORY[0x270FA5388](v1 - 8);
  int v3 = (char *)&v17[-1] - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = OBJC_IVAR___CalendarLinkObservation_observationStatus;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF65DF0);
  uint64_t v5 = swift_allocObject();
  *(_DWORD *)(v5 + 20) = 0;
  *(unsigned char *)(v5 + 16) = 1;
  *(void *)&v0[v4] = v5;
  *(void *)&v0[OBJC_IVAR___CalendarLinkObservation_observationTask] = 0;
  unsigned __int8 v6 = (objc_class *)type metadata accessor for CalendarLinkObservation();
  v18.receiver = v0;
  v18.super_class = v6;
  id v7 = objc_msgSendSuper2(&v18, sel_init);
  uint64_t v8 = sub_229042170();
  v17[3] = v8;
  v17[4] = sub_229039DC0();
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v17);
  (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v8 - 8) + 104))(boxed_opaque_existential_1, *MEMORY[0x263F2FFC8], v8);
  uint64_t v10 = (char *)v7;
  LOBYTE(v8) = sub_2290416B0();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v17);
  if (v8)
  {
    uint64_t v11 = sub_2290423E0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v3, 1, 1, v11);
    uint64_t v12 = swift_allocObject();
    swift_unknownObjectWeakInit();
    id v13 = (void *)swift_allocObject();
    v13[2] = 0;
    v13[3] = 0;
    v13[4] = v12;
    uint64_t v14 = sub_2290394D0((uint64_t)v3, (uint64_t)&unk_2682B8038, (uint64_t)v13);

    sub_229039F44((uint64_t)v3);
    *(void *)&v10[OBJC_IVAR___CalendarLinkObservation_observationTask] = v14;
    swift_release();
  }
  else
  {
  }
  return v10;
}

uint64_t sub_2290385F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[26] = a1;
  v4[27] = a4;
  uint64_t v5 = sub_2290421C0();
  v4[28] = v5;
  v4[29] = *(void *)(v5 - 8);
  v4[30] = swift_task_alloc();
  v4[31] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2290386C0, 0, 0);
}

uint64_t sub_2290386C0()
{
  uint64_t v1 = v0[27] + 16;
  swift_beginAccess();
  uint64_t v2 = MEMORY[0x22A6B0560](v1);
  if (v2)
  {
    int v3 = (void *)v2;
    if (qword_26AF66580 != -1) {
      swift_once();
    }
    uint64_t v4 = v0[31];
    uint64_t v5 = v0[28];
    uint64_t v6 = v0[29];
    uint64_t v7 = __swift_project_value_buffer(v5, (uint64_t)qword_26AF66568);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v4, v7, v5);

    uint64_t v8 = sub_2290421A0();
    os_log_type_t v9 = sub_2290424A0();
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v10 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl(&dword_228F70000, v8, v9, "Registering for EventEntity observability state changes", v10, 2u);
      MEMORY[0x22A6B0490](v10, -1, -1);
    }
    uint64_t v11 = v0[31];
    uint64_t v12 = v0[28];
    uint64_t v13 = v0[29];

    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v11, v12);
  }
  uint64_t v14 = (void *)swift_task_alloc();
  v0[32] = v14;
  sub_228F74A44();
  *uint64_t v14 = v0;
  v14[1] = sub_22903889C;
  return MEMORY[0x270EE0C58](v0 + 2);
}

uint64_t sub_22903889C()
{
  *(void *)(*(void *)v1 + 264) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_2290392E8;
  }
  else {
    uint64_t v2 = sub_2290389B0;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_2290389B0()
{
  uint64_t v1 = v0[5];
  uint64_t v2 = __swift_project_boxed_opaque_existential_1(v0 + 2, v1);
  uint64_t v3 = *(void *)(v1 - 8);
  uint64_t v4 = swift_task_alloc();
  (*(void (**)(uint64_t, void *, uint64_t))(v3 + 16))(v4, v2, v1);
  v0[10] = swift_getAssociatedTypeWitness();
  v0[11] = swift_getAssociatedConformanceWitness();
  __swift_allocate_boxed_opaque_existential_1(v0 + 7);
  sub_229042400();
  swift_task_dealloc();
  swift_beginAccess();
  uint64_t v5 = v0[10];
  uint64_t v6 = v0[11];
  v0[34] = v5;
  v0[35] = v6;
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)(v0 + 7), v5);
  v0[36] = swift_getAssociatedTypeWitness();
  uint64_t v7 = sub_229042530();
  v0[37] = v7;
  v0[38] = *(void *)(v7 - 8);
  uint64_t v8 = swift_task_alloc();
  v0[39] = v8;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v0[40] = AssociatedTypeWitness;
  uint64_t v10 = *(void *)(AssociatedTypeWitness - 8);
  v0[41] = v10;
  v0[42] = *(void *)(v10 + 64);
  uint64_t v11 = swift_task_alloc();
  v0[43] = v11;
  uint64_t v12 = (void *)swift_task_alloc();
  v0[44] = v12;
  *uint64_t v12 = v0;
  v12[1] = sub_229038CA8;
  return MEMORY[0x270FA1E88](v8, 0, 0, v11, v5, v6);
}

uint64_t sub_229038CA8()
{
  *(void *)(*(void *)v1 + 360) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_229039354;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = sub_229038DC4;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

void sub_229038DC4()
{
  uint64_t v1 = *(void *)(v0 + 312);
  uint64_t v2 = *(void *)(v0 + 288);
  uint64_t v3 = *(void *)(v2 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2) == 1)
  {
    uint64_t v4 = *(void *)(v0 + 208);
    (*(void (**)(uint64_t, void))(*(void *)(v0 + 304) + 8))(v1, *(void *)(v0 + 296));
    swift_task_dealloc();
    __swift_destroy_boxed_opaque_existential_1(v0 + 56);
    *(void *)(v4 + 24) = MEMORY[0x263F8EE60] + 8;
LABEL_3:
    __swift_destroy_boxed_opaque_existential_1(v0 + 16);
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v5 = *(void (**)(void))(v0 + 8);
    v5();
    return;
  }
  *(void *)(v0 + 120) = v2;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v0 + 96));
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v3 + 32))(boxed_opaque_existential_1, v1, v2);
  swift_task_dealloc();
  sub_228FABE90((_OWORD *)(v0 + 96), (_OWORD *)(v0 + 128));
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_16;
  }
  int v7 = *(unsigned __int8 *)(v0 + 368);
  uint64_t v8 = (void *)MEMORY[0x22A6B0560](*(void *)(v0 + 216) + 16);
  if (!v8)
  {
    *(void *)(*(void *)(v0 + 208) + 24) = MEMORY[0x263F8EE60] + 8;
    __swift_destroy_boxed_opaque_existential_1(v0 + 56);
    goto LABEL_3;
  }
  uint64_t v9 = qword_26AF66580;
  uint64_t v10 = v8;
  if (v9 != -1) {
    swift_once();
  }
  uint64_t v12 = *(void *)(v0 + 232);
  uint64_t v11 = *(void *)(v0 + 240);
  uint64_t v13 = *(void *)(v0 + 224);
  uint64_t v14 = __swift_project_value_buffer(v13, (uint64_t)qword_26AF66568);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16))(v11, v14, v13);

  uint64_t v15 = sub_2290421A0();
  os_log_type_t v16 = sub_2290424A0();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = swift_slowAlloc();
    *(_DWORD *)uint64_t v17 = 67109120;
    *(_DWORD *)(v17 + 4) = v7;
    _os_log_impl(&dword_228F70000, v15, v16, "EventEntity observability state changed to %{BOOL}d", (uint8_t *)v17, 8u);
    MEMORY[0x22A6B0490](v17, -1, -1);
  }
  uint64_t v18 = *(void *)(v0 + 360);
  uint64_t v20 = *(void *)(v0 + 232);
  uint64_t v19 = *(void *)(v0 + 240);
  uint64_t v21 = *(void *)(v0 + 224);

  (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v19, v21);
  uint64_t v22 = *(void *)&v10[OBJC_IVAR___CalendarLinkObservation_observationStatus];
  *(unsigned char *)(swift_task_alloc() + 16) = v7;
  sub_229040F70();
  os_unfair_lock_lock((os_unfair_lock_t)(v22 + 20));
  sub_22903A230((unsigned char *)(v22 + 16));
  os_unfair_lock_unlock((os_unfair_lock_t)(v22 + 20));
  if (!v18)
  {

    swift_release();
    swift_task_dealloc();
LABEL_16:
    uint64_t v23 = *(void *)(v0 + 80);
    uint64_t v24 = *(void *)(v0 + 88);
    *(void *)(v0 + 272) = v23;
    *(void *)(v0 + 280) = v24;
    __swift_mutable_project_boxed_opaque_existential_1(v0 + 56, v23);
    *(void *)(v0 + 288) = swift_getAssociatedTypeWitness();
    uint64_t v25 = sub_229042530();
    *(void *)(v0 + 296) = v25;
    *(void *)(v0 + 304) = *(void *)(v25 - 8);
    uint64_t v26 = swift_task_alloc();
    *(void *)(v0 + 312) = v26;
    uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
    *(void *)(v0 + 320) = AssociatedTypeWitness;
    uint64_t v28 = *(void *)(AssociatedTypeWitness - 8);
    *(void *)(v0 + 328) = v28;
    *(void *)(v0 + 336) = *(void *)(v28 + 64);
    uint64_t v29 = swift_task_alloc();
    *(void *)(v0 + 344) = v29;
    uint64_t v30 = (void *)swift_task_alloc();
    *(void *)(v0 + 352) = v30;
    *uint64_t v30 = v0;
    v30[1] = sub_229038CA8;
    MEMORY[0x270FA1E88](v26, 0, 0, v29, v23, v24);
  }
}

uint64_t sub_2290392E8()
{
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_229039354()
{
  uint64_t v1 = v0[43];
  uint64_t v2 = v0[40];
  uint64_t v3 = v0[41];
  uint64_t v4 = swift_task_alloc();
  uint64_t v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 32);
  v5(v4, v1, v2);
  swift_getAssociatedConformanceWitness();
  if (sub_229042800())
  {
    (*(void (**)(uint64_t, void))(v0[41] + 8))(v4, v0[40]);
  }
  else
  {
    uint64_t v6 = v0[40];
    swift_allocError();
    v5(v7, v4, v6);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 7));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 2));
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v8 = (uint64_t (*)(void))v0[1];
  return v8();
}

uint64_t sub_2290394D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AF65DD8);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_229039FA4(a1, (uint64_t)v7);
  uint64_t v8 = sub_2290423E0();
  uint64_t v9 = *(void *)(v8 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
  {
    sub_229039F44((uint64_t)v7);
    if (*(void *)(a3 + 16))
    {
LABEL_3:
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v10 = sub_229042380();
      uint64_t v12 = v11;
      swift_unknownObjectRelease();
      goto LABEL_6;
    }
  }
  else
  {
    sub_2290423D0();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v7, v8);
    if (*(void *)(a3 + 16)) {
      goto LABEL_3;
    }
  }
  uint64_t v10 = 0;
  uint64_t v12 = 0;
LABEL_6:
  __swift_instantiateConcreteTypeFromMangledName(qword_26AF65E40);
  if (v12 | v10)
  {
    v14[0] = 0;
    v14[1] = 0;
    v14[2] = v10;
    v14[3] = v12;
  }
  return swift_task_create();
}

id sub_2290396B4()
{
  if (*(void *)&v0[OBJC_IVAR___CalendarLinkObservation_observationTask])
  {
    sub_229040F70();
    __swift_instantiateConcreteTypeFromMangledName(qword_26AF65E40);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2682B7AE0);
    sub_2290423F0();
    swift_release();
  }
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CalendarLinkObservation();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unsigned char *sub_229039840@<X0>(unsigned char *result@<X0>, unsigned char *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_229039868()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AF65DD8);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_2290423E0();
  uint64_t v5 = *(void *)(v4 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v3, 1, 1, v4);
  uint64_t v6 = (void *)swift_allocObject();
  v6[2] = 0;
  v6[3] = 0;
  v6[4] = v0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) == 1)
  {
    sub_229039F44((uint64_t)v3);
    uint64_t v7 = 0;
    uint64_t v8 = 0;
  }
  else
  {
    sub_2290423D0();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v3, v4);
    if (v6[2])
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v7 = sub_229042380();
      uint64_t v8 = v9;
      swift_unknownObjectRelease();
    }
    else
    {
      uint64_t v7 = 0;
      uint64_t v8 = 0;
    }
  }
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = &unk_2682B8048;
  *(void *)(v10 + 24) = v6;
  if (v8 | v7)
  {
    v12[0] = 0;
    v12[1] = 0;
    void v12[2] = v7;
    v12[3] = v8;
  }
  swift_task_create();
  return swift_release();
}

uint64_t sub_229039A90()
{
  uint64_t v1 = sub_229040C00();
  v0[2] = v1;
  v0[3] = *(void *)(v1 - 8);
  v0[4] = swift_task_alloc();
  uint64_t v2 = sub_229040C20();
  v0[5] = v2;
  v0[6] = *(void *)(v2 - 8);
  v0[7] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_229039BA8, 0, 0);
}

uint64_t sub_229039BA8()
{
  if (sub_22903A418())
  {
    if (qword_26AF66580 != -1) {
      swift_once();
    }
    uint64_t v1 = sub_2290421C0();
    __swift_project_value_buffer(v1, (uint64_t)qword_26AF66568);
    uint64_t v2 = sub_2290421A0();
    os_log_type_t v3 = sub_2290424A0();
    if (os_log_type_enabled(v2, v3))
    {
      uint64_t v4 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl(&dword_228F70000, v2, v3, "Sending EventEntity update notification", v4, 2u);
      MEMORY[0x22A6B0490](v4, -1, -1);
    }
    uint64_t v6 = v0[6];
    uint64_t v5 = v0[7];
    uint64_t v8 = v0[4];
    uint64_t v7 = v0[5];
    uint64_t v9 = v0[2];
    uint64_t v10 = v0[3];

    (*(void (**)(uint64_t, void, uint64_t))(v10 + 104))(v8, *MEMORY[0x263EFB6B0], v9);
    sub_228F74A44();
    sub_229040C40();
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v8, v9);
    sub_229040C10();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v11 = (uint64_t (*)(void))v0[1];
  return v11();
}

uint64_t type metadata accessor for CalendarLinkObservation()
{
  return self;
}

unint64_t sub_229039DC0()
{
  unint64_t result = qword_26AF65DD0;
  if (!qword_26AF65DD0)
  {
    sub_229042170();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AF65DD0);
  }
  return result;
}

uint64_t sub_229039E18()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_229039E50()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_229039E90(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_228F76138;
  return sub_2290385F0(a1, v4, v5, v6);
}

uint64_t sub_229039F44(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AF65DD8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_229039FA4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AF65DD8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_22903A00C(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_22903A0E8;
  return v6(a1);
}

uint64_t sub_22903A0E8()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t __swift_mutable_project_boxed_opaque_existential_1(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

unsigned char *sub_22903A230(unsigned char *result)
{
  *uint64_t result = *(unsigned char *)(v1 + 16);
  return result;
}

uint64_t sub_22903A23C()
{
  swift_unknownObjectRelease();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_22903A274()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_228F76138;
  return sub_229039A90();
}

uint64_t sub_22903A328()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_22903A360(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_228F81344;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_2682B8050 + dword_2682B8050);
  return v6(a1, v4);
}

uint64_t sub_22903A418()
{
  uint64_t v0 = sub_229042170();
  v9[3] = v0;
  v9[4] = sub_229039DC0();
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v9);
  (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v0 - 8) + 104))(boxed_opaque_existential_1, *MEMORY[0x263F2FFC8], v0);
  LOBYTE(v0) = sub_2290416B0();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
  if ((v0 & 1) == 0) {
    return 0;
  }
  if (qword_26AF65DB8 != -1) {
    swift_once();
  }
  uint64_t v2 = *(void *)(qword_26AF65E20 + OBJC_IVAR___CalendarLinkObservation_observationStatus);
  sub_229040F70();
  os_unfair_lock_lock((os_unfair_lock_t)(v2 + 20));
  sub_229039840((unsigned char *)(v2 + 16), v9);
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 20));
  uint64_t v3 = LOBYTE(v9[0]);
  swift_release();
  if (qword_26AF66580 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_2290421C0();
  __swift_project_value_buffer(v4, (uint64_t)qword_26AF66568);
  uint64_t v5 = sub_2290421A0();
  os_log_type_t v6 = sub_2290424A0();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 67109120;
    LODWORD(v9[0]) = v3;
    sub_229042540();
    _os_log_impl(&dword_228F70000, v5, v6, "Returning EventEntity observability state: %{BOOL}d", v7, 8u);
    MEMORY[0x22A6B0490](v7, -1, -1);
  }

  return v3;
}

uint64_t sub_22903A628(uint64_t *a1)
{
  uint64_t v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_229040824(v2);
  }
  uint64_t v3 = *(void *)(v2 + 16);
  v5[0] = v2 + 32;
  v5[1] = v3;
  uint64_t result = sub_22903D68C(v5);
  *a1 = v2;
  return result;
}

uint64_t SetCalendarFocusConfiguration.init()@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v32 = a1;
  uint64_t v1 = sub_2290412D0();
  uint64_t v30 = *(void *)(v1 - 8);
  uint64_t v31 = v1;
  MEMORY[0x270FA5388](v1);
  uint64_t v29 = (char *)&v23 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF65FB0);
  uint64_t v4 = MEMORY[0x270FA5388](v3 - 8);
  uint64_t v28 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  id v27 = (char *)&v23 - v6;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF665B0);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v26 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = sub_2290414D0();
  uint64_t v9 = *(void *)(v24 - 8);
  MEMORY[0x270FA5388](v24);
  uint64_t v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_229041610();
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v13 = sub_229042290();
  MEMORY[0x270FA5388](v13 - 8);
  uint64_t v14 = sub_2290414E0();
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AF665A0);
  sub_229040BD0();
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v36 = 0;
  sub_229040BC0();
  uint64_t v25 = sub_229040B90();
  sub_229042210();
  sub_229041600();
  (*(void (**)(char *, void, uint64_t))(v9 + 104))(v11, *MEMORY[0x263F06D18], v24);
  sub_229041500();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56))(v26, 1, 1, v14);
  uint64_t v33 = 0;
  uint64_t v16 = sub_229040D40();
  uint64_t v17 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56);
  v17(v27, 1, 1, v16);
  v17(v28, 1, 1, v16);
  uint64_t v36 = 0;
  long long v34 = 0u;
  long long v35 = 0u;
  sub_229040BC0();
  uint64_t v18 = sub_229040B90();
  uint64_t v19 = unk_26DD50DD0;
  if ((unk_26DD50DD0 & ~qword_26DD50DC8) == 0) {
    uint64_t v19 = 0;
  }
  uint64_t v20 = v19 | qword_26DD50DC8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF65FB8);
  *(void *)&long long v34 = v18;
  *((void *)&v34 + 1) = v20;
  (*(void (**)(char *, void, uint64_t))(v30 + 104))(v29, *MEMORY[0x263EFBDC8], v31);
  sub_228FA7F78();
  sub_228FA7FCC();
  uint64_t result = sub_229040ED0();
  uint64_t v22 = v32;
  *uint64_t v32 = v25;
  v22[1] = result;
  return result;
}

uint64_t sub_22903AB98()
{
  uint64_t v0 = sub_229041610();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_2290414D0();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_229042290();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v6 = sub_2290414E0();
  __swift_allocate_value_buffer(v6, qword_2682B8060);
  __swift_project_value_buffer(v6, (uint64_t)qword_2682B8060);
  sub_229042210();
  if (qword_2682B4DE8 != -1) {
    swift_once();
  }
  uint64_t v7 = __swift_project_value_buffer(v1, (uint64_t)qword_2682C2E88);
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v7, v1);
  sub_229041600();
  return sub_229041500();
}

uint64_t static SetCalendarFocusConfiguration.title.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_228FA73F0(&qword_2682B4FE0, MEMORY[0x263F06D40], (uint64_t)qword_2682B8060, a1);
}

uint64_t static SetCalendarFocusConfiguration.title.setter(uint64_t a1)
{
  return sub_228FA74D8(a1, &qword_2682B4FE0, MEMORY[0x263F06D40], (uint64_t)qword_2682B8060);
}

uint64_t (*static SetCalendarFocusConfiguration.title.modify())()
{
  if (qword_2682B4FE0 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_2290414E0();
  __swift_project_value_buffer(v0, (uint64_t)qword_2682B8060);
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_22903AEB4()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF665B0);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v2 = (char *)v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12[0] = sub_2290414D0();
  uint64_t v3 = *(void *)(v12[0] - 8);
  MEMORY[0x270FA5388](v12[0]);
  uint64_t v5 = (char *)v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_229041610();
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v7 = sub_229042290();
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v8 = sub_2290414E0();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = sub_2290410B0();
  __swift_allocate_value_buffer(v10, qword_2682B8078);
  __swift_project_value_buffer(v10, (uint64_t)qword_2682B8078);
  sub_229042210();
  sub_229041600();
  (*(void (**)(char *, void, void))(v3 + 104))(v5, *MEMORY[0x263F06D18], v12[0]);
  sub_229041500();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v2, 1, 1, v8);
  return sub_2290410C0();
}

uint64_t static SetCalendarFocusConfiguration.description.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_228FA73F0(&qword_2682B4FE8, MEMORY[0x263EFBA28], (uint64_t)qword_2682B8078, a1);
}

uint64_t static SetCalendarFocusConfiguration.description.setter(uint64_t a1)
{
  return sub_228FA74D8(a1, &qword_2682B4FE8, MEMORY[0x263EFBA28], (uint64_t)qword_2682B8078);
}

uint64_t (*static SetCalendarFocusConfiguration.description.modify())()
{
  if (qword_2682B4FE8 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_2290410B0();
  __swift_project_value_buffer(v0, (uint64_t)qword_2682B8078);
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t SetCalendarFocusConfiguration.appContext.getter()
{
  uint64_t v0 = sub_2290421C0();
  MEMORY[0x270FA5388](v0);
  uint64_t v1 = sub_22903B538();
  uint64_t v2 = v1;
  if (v1)
  {
    sub_228F8A728(0, &qword_2682B8090);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2682B8098);
    uint64_t v3 = swift_allocObject();
    *(_OWORD *)(v3 + 16) = xmmword_229043680;
    *(void *)(v3 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_2682B80A0);
    *(void *)(v3 + 64) = sub_228F764D0(&qword_2682B80A8, &qword_2682B80A0);
    *(void *)(v3 + 32) = v2;
    sub_229042460();
  }
  return sub_229040B20();
}

uint64_t sub_22903B538()
{
  sub_229040F70();
  sub_229040F70();
  sub_229040E70();
  swift_release();
  swift_release();
  uint64_t v4 = v47[0];
  if (!v47[0]) {
    return 0;
  }
  sub_229040F70();
  sub_229040F70();
  id v5 = sub_228F9D80C();
  swift_release();
  swift_release();
  if (v0) {
    return swift_bridgeObjectRelease();
  }
  uint64_t v7 = MEMORY[0x263F8EE78];
  v47[0] = MEMORY[0x263F8EE78];
  uint64_t v8 = *(void *)(v4 + 16);
  id v43 = v5;
  if (!v8)
  {
    uint64_t v12 = MEMORY[0x263F8EE78];
LABEL_15:
    swift_bridgeObjectRelease();
    id v13 = objc_msgSend(v5, sel_calendarsForEntityType_, 0);
    sub_228F8A728(0, (unint64_t *)&qword_2682B5D80);
    unint64_t v14 = sub_229042310();

    uint64_t v15 = sub_229040838(v14);
    swift_bridgeObjectRelease();
    if ((v15 & 0xC000000000000001) != 0)
    {
      if (v15 < 0) {
        uint64_t v16 = v15;
      }
      else {
        uint64_t v16 = v15 & 0xFFFFFFFFFFFFFF8;
      }
      sub_229041250();
      uint64_t v17 = sub_229042610();
      uint64_t v18 = sub_22903F020(v16, v17);
      swift_bridgeObjectRelease();
      uint64_t v15 = v18;
    }
    uint64_t v19 = sub_22903FDC8(v12, v15);
    swift_bridgeObjectRelease();
    unint64_t v44 = v19 & 0xC000000000000001;
    uint64_t v46 = v19;
    if ((v19 & 0xC000000000000001) != 0)
    {
      uint64_t v20 = sub_229042610();
      if (v20)
      {
LABEL_22:
        uint64_t v51 = v7;
        sub_228F8A1EC(0, v20 & ~(v20 >> 63), 0);
        uint64_t v21 = v19;
        if (v44)
        {
          uint64_t v22 = (void *)sub_2290425C0();
          char v24 = 1;
        }
        else
        {
          uint64_t v22 = (void *)sub_22904079C(v19);
          char v24 = v25 & 1;
        }
        id v48 = v22;
        uint64_t v49 = v23;
        char v50 = v24;
        if (v20 < 0)
        {
          __break(1u);
        }
        else
        {
          while (1)
          {
LABEL_30:
            id v2 = v48;
            uint64_t v1 = v49;
            LOBYTE(v3) = v50;
            sub_229040524((uint64_t)v48, v49, v50, v21);
            uint64_t v33 = v32;
            id v34 = objc_msgSend(v32, sel_calendarIdentifier);
            uint64_t v35 = sub_2290422B0();
            uint64_t v37 = v36;

            uint64_t v38 = v51;
            uint64_t result = swift_isUniquelyReferenced_nonNull_native();
            if ((result & 1) == 0)
            {
              uint64_t result = sub_228F8A1EC(0, *(void *)(v38 + 16) + 1, 1);
              uint64_t v38 = v51;
            }
            unint64_t v40 = *(void *)(v38 + 16);
            unint64_t v39 = *(void *)(v38 + 24);
            if (v40 >= v39 >> 1)
            {
              uint64_t result = sub_228F8A1EC(v39 > 1, v40 + 1, 1);
              uint64_t v38 = v51;
            }
            *(void *)(v38 + 16) = v40 + 1;
            uint64_t v41 = v38 + 16 * v40;
            *(void *)(v41 + 32) = v35;
            *(void *)(v41 + 40) = v37;
            if (!v44) {
              break;
            }
            uint64_t v21 = v46;
            if ((v3 & 1) == 0) {
              goto LABEL_41;
            }
            if (sub_2290425E0()) {
              swift_isUniquelyReferenced_nonNull_native();
            }
            uint64_t v31 = v43;
            __swift_instantiateConcreteTypeFromMangledName(&qword_2682B80E8);
            unint64_t v42 = (void (*)(uint64_t *, void))sub_229042430();
            sub_229042650();
            v42(v47, 0);
            if (!--v20) {
              goto LABEL_39;
            }
          }
        }
        uint64_t v21 = v46;
        uint64_t v26 = (void *)sub_229040440((int64_t)v2, v1, v3, v46);
        uint64_t v28 = v27;
        char v30 = v29;
        sub_22904098C((uint64_t)v2, v1, v3);
        id v48 = v26;
        uint64_t v49 = v28;
        char v50 = v30 & 1;
        uint64_t v31 = v43;
        if (--v20) {
          goto LABEL_30;
        }
LABEL_39:
        sub_22904098C((uint64_t)v48, v49, v50);
        swift_release();

        return v51;
      }
    }
    else
    {
      uint64_t v20 = *(void *)(v19 + 16);
      if (v20) {
        goto LABEL_22;
      }
    }
    swift_release();

    return MEMORY[0x263F8EE78];
  }
  sub_229041250();
  uint64_t v1 = v4 + 64;
  while (1)
  {
    id v2 = *(id *)(v1 + 24);
    uint64_t v3 = *(void *)(v1 + 32);
    uint64_t v45 = v8;
    swift_bridgeObjectRetain_n();
    swift_retain_n();
    swift_retain_n();
    swift_retain_n();
    swift_retain_n();
    swift_retain_n();
    swift_bridgeObjectRetain_n();
    sub_229040B60();
    id v9 = objc_msgSend(v48, sel_eventStore);
    uint64_t result = swift_unknownObjectRelease();
    if (!v9) {
      break;
    }
    uint64_t v10 = (void *)sub_2290422A0();
    id v11 = objc_msgSend(v9, sel_calendarWithIdentifier_, v10);
    swift_release_n();
    swift_release_n();
    swift_release_n();
    swift_release_n();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    swift_release_n();

    if (v11)
    {
      MEMORY[0x22A6AF6E0]();
      if (*(void *)((v47[0] & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v47[0] & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_229042340();
      }
      sub_229042360();
      sub_229042330();
    }
    v1 += 80;
    --v8;
    if (v45 == 1)
    {
      swift_bridgeObjectRelease();
      uint64_t v12 = v47[0];
      id v5 = v43;
      uint64_t v7 = MEMORY[0x263F8EE78];
      goto LABEL_15;
    }
  }
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

uint64_t SetCalendarFocusConfiguration.perform()(uint64_t a1)
{
  *(void *)(v2 + 24) = a1;
  uint64_t v3 = sub_2290421C0();
  *(void *)(v2 + 32) = v3;
  *(void *)(v2 + 40) = *(void *)(v3 - 8);
  *(void *)(v2 + 48) = swift_task_alloc();
  *(void *)(v2 + 56) = swift_task_alloc();
  *(_OWORD *)(v2 + 64) = *v1;
  sub_2290423C0();
  *(void *)(v2 + 80) = sub_2290423B0();
  uint64_t v5 = sub_229042380();
  return MEMORY[0x270FA2498](sub_22903BC00, v5, v4);
}

uint64_t sub_22903BC00()
{
  uint64_t v38 = v0;
  long long v34 = *(_OWORD *)(v0 + 64);
  swift_release();
  *(_OWORD *)uint64_t v36 = v34;
  uint64_t v1 = sub_22903B538();
  if (v1)
  {
    uint64_t v2 = qword_26AF66580;
    sub_229040F70();
    sub_229040F70();
    if (v2 != -1) {
      swift_once();
    }
    uint64_t v3 = *(void *)(v0 + 56);
    uint64_t v4 = *(void *)(v0 + 32);
    uint64_t v5 = *(void *)(v0 + 40);
    uint64_t v6 = __swift_project_value_buffer(v4, (uint64_t)qword_26AF66568);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v3, v6, v4);
    swift_release();
    swift_release();
    swift_bridgeObjectRetain_n();
    uint64_t v7 = sub_2290421A0();
    os_log_type_t v8 = sub_2290424A0();
    if (os_log_type_enabled(v7, v8))
    {
      id v9 = (uint8_t *)swift_slowAlloc();
      uint64_t v10 = swift_slowAlloc();
      uint64_t v37 = v10;
      *(_DWORD *)id v9 = 136446210;
      v36[0] = v1;
      sub_229041250();
      sub_22903A628(v36);
      uint64_t v32 = *(void *)(v0 + 40);
      uint64_t v33 = *(void *)(v0 + 32);
      uint64_t v35 = *(void *)(v0 + 56);
      uint64_t v25 = MEMORY[0x22A6AF710](v36[0], MEMORY[0x263F8D310]);
      unint64_t v27 = v26;
      swift_release();
      *(void *)(v0 + 16) = sub_228FE5100(v25, v27, &v37);
      sub_229042540();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_228F70000, v7, v8, "Entering focus with unselected identifiers = %{public}s", v9, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22A6B0490](v10, -1, -1);
      MEMORY[0x22A6B0490](v9, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v35, v33);
    }
    else
    {
      uint64_t v22 = *(void *)(v0 + 56);
      uint64_t v23 = *(void *)(v0 + 32);
      uint64_t v24 = *(void *)(v0 + 40);
      swift_bridgeObjectRelease_n();

      (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v22, v23);
    }
    uint64_t v28 = self;
    char v29 = (void *)sub_229042300();
    swift_bridgeObjectRelease();
    objc_msgSend(v28, sel_setUnselectedCalendarIdentifiersForFocusMode_, v29);
  }
  else
  {
    uint64_t v11 = qword_26AF66580;
    sub_229040F70();
    sub_229040F70();
    if (v11 != -1) {
      swift_once();
    }
    uint64_t v13 = *(void *)(v0 + 40);
    uint64_t v12 = *(void *)(v0 + 48);
    uint64_t v14 = *(void *)(v0 + 32);
    uint64_t v15 = __swift_project_value_buffer(v14, (uint64_t)qword_26AF66568);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 16))(v12, v15, v14);
    swift_release();
    swift_release();
    uint64_t v16 = sub_2290421A0();
    os_log_type_t v17 = sub_2290424A0();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v18 = 0;
      _os_log_impl(&dword_228F70000, v16, v17, "Exiting focus", v18, 2u);
      MEMORY[0x22A6B0490](v18, -1, -1);
    }
    uint64_t v20 = *(void *)(v0 + 40);
    uint64_t v19 = *(void *)(v0 + 48);
    uint64_t v21 = *(void *)(v0 + 32);

    (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v19, v21);
    objc_msgSend(self, sel_setUnselectedCalendarIdentifiersForFocusMode_, 0);
  }
  sub_229040D90();
  swift_task_dealloc();
  swift_task_dealloc();
  char v30 = *(uint64_t (**)(void))(v0 + 8);
  return v30();
}

uint64_t SetCalendarFocusConfiguration.displayRepresentation.getter()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AF65A10);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)v14 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF665B0);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_2290414E0();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14[0] = *v0;
  if (qword_2682B4FE0 != -1) {
    swift_once();
  }
  uint64_t v11 = __swift_project_value_buffer(v7, (uint64_t)qword_2682B8060);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v11, v7);
  v14[1] = v14[0];
  sub_22903C2F0((uint64_t)v6);
  uint64_t v12 = sub_229041180();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v3, 1, 1, v12);
  return sub_2290411B0();
}

uint64_t sub_22903C2F0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v4 = sub_229041610();
  MEMORY[0x270FA5388](v4 - 8);
  unint64_t v61 = (char *)v54 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_2290414D0();
  uint64_t v57 = *(void *)(v6 - 8);
  uint64_t v58 = v6;
  MEMORY[0x270FA5388](v6);
  char v60 = (char *)v54 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_229042290();
  MEMORY[0x270FA5388](v8 - 8);
  unint64_t v59 = (char *)v54 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_229042270();
  MEMORY[0x270FA5388](v10 - 8);
  BOOL v62 = (char *)v54 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_2290414E0();
  unint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v63 = (char *)v54 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v56 = (char *)v54 - v16;
  sub_229040F70();
  sub_229040F70();
  sub_229040E70();
  swift_release();
  swift_release();
  unint64_t v17 = v69;
  if (!v69) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v13 + 56))(a1, 1, 1, v12);
  }
  uint64_t v64 = v12;
  unint64_t v65 = v13;
  unint64_t v18 = MEMORY[0x263F8EE78];
  unint64_t v69 = MEMORY[0x263F8EE78];
  uint64_t v19 = *(void *)(v17 + 16);
  uint64_t v55 = a1;
  if (!v19)
  {
    unint64_t v26 = MEMORY[0x263F8EE78];
LABEL_13:
    swift_bridgeObjectRelease();
    if (v26 >> 62)
    {
      sub_229041250();
      uint64_t v27 = sub_229042780();
      swift_bridgeObjectRelease();
      if (v27) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v27 = *(void *)((v26 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (v27)
      {
LABEL_15:
        unint64_t v69 = v18;
        sub_228F8A288(0, v27 & ~(v27 >> 63), 0);
        if (v27 < 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        uint64_t v28 = v69;
        uint64_t v67 = type metadata accessor for LocalizedStringUtils();
        uint64_t v29 = 0;
        unint64_t v30 = v26 & 0xC000000000000001;
        unint64_t v2 = v65 + 32;
        uint64_t v31 = v56;
        unint64_t v32 = v26;
        do
        {
          if (v30) {
            id v33 = (id)MEMORY[0x22A6AFAB0](v29, v26);
          }
          else {
            id v33 = *(id *)(v26 + 8 * v29 + 32);
          }
          long long v34 = v33;
          static LocalizedStringUtils.localizedTitle(forCalendar:)(v33);

          unint64_t v69 = v28;
          unint64_t v36 = *(void *)(v28 + 16);
          unint64_t v35 = *(void *)(v28 + 24);
          if (v36 >= v35 >> 1)
          {
            sub_228F8A288(v35 > 1, v36 + 1, 1);
            uint64_t v28 = v69;
          }
          ++v29;
          *(void *)(v28 + 16) = v36 + 1;
          (*(void (**)(unint64_t, char *, uint64_t))(v65 + 32))(v28+ ((*(unsigned __int8 *)(v65 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v65 + 80))+ *(void *)(v65 + 72) * v36, v31, v64);
          unint64_t v26 = v32;
        }
        while (v27 != v29);
        swift_bridgeObjectRelease();
LABEL_26:
        uint64_t v37 = *(void *)(v28 + 16);
        uint64_t v38 = v63;
        uint64_t v1 = v64;
        if (!v37)
        {
          (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v65 + 56))(v55, 1, 1, v64);
          return swift_bridgeObjectRelease();
        }
        unint64_t v39 = v37 - 1;
        if (v37 != 1)
        {
          if (v37 != 2)
          {
            unint64_t v50 = v65;
            (*(void (**)(char *, unint64_t, uint64_t))(v65 + 16))(v63, v28 + ((*(unsigned __int8 *)(v65 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v65 + 80)), v64);
            swift_bridgeObjectRelease();
            sub_229042260();
            sub_229042250();
            sub_229042240();
            sub_229042250();
            unint64_t v69 = v39;
            sub_229042220();
            sub_229042250();
            sub_229042280();
            if (qword_2682B4DE8 != -1) {
              swift_once();
            }
            uint64_t v51 = v58;
            uint64_t v52 = __swift_project_value_buffer(v58, (uint64_t)qword_2682C2E88);
            (*(void (**)(char *, uint64_t, uint64_t))(v57 + 16))(v60, v52, v51);
            sub_229041600();
            uint64_t v53 = v55;
            sub_2290414F0();
            (*(void (**)(char *, uint64_t))(v50 + 8))(v38, v1);
            return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v50 + 56))(v53, 0, 1, v1);
          }
          sub_229042260();
          sub_229042250();
          if (*(void *)(v28 + 16))
          {
            unint64_t v2 = v65;
            uint64_t v40 = v28 + ((*(unsigned __int8 *)(v65 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v65 + 80));
            uint64_t v41 = *(void (**)(char *, uint64_t, uint64_t))(v65 + 16);
            unint64_t v42 = v63;
            v41(v63, v40, v1);
            sub_229042240();
            id v43 = *(void (**)(char *, uint64_t))(v2 + 8);
            v43(v42, v1);
            sub_229042250();
            if (*(void *)(v28 + 16) >= 2uLL)
            {
              v41(v42, v40 + *(void *)(v2 + 72), v1);
              swift_bridgeObjectRelease();
              sub_229042240();
              v43(v42, v1);
              sub_229042250();
              sub_229042280();
              if (qword_2682B4DE8 == -1)
              {
LABEL_32:
                uint64_t v44 = v58;
                uint64_t v45 = __swift_project_value_buffer(v58, (uint64_t)qword_2682C2E88);
                (*(void (**)(char *, uint64_t, uint64_t))(v57 + 16))(v60, v45, v44);
                sub_229041600();
                uint64_t v46 = v55;
                sub_2290414F0();
                return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v2 + 56))(v46, 0, 1, v1);
              }
LABEL_43:
              swift_once();
              goto LABEL_32;
            }
LABEL_42:
            __break(1u);
            goto LABEL_43;
          }
LABEL_41:
          __break(1u);
          goto LABEL_42;
        }
        sub_229042260();
        sub_229042250();
        if (*(void *)(v28 + 16))
        {
          unint64_t v39 = v65;
          unint64_t v47 = v63;
          (*(void (**)(char *, unint64_t, uint64_t))(v65 + 16))(v63, v28 + ((*(unsigned __int8 *)(v39 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v39 + 80)), v1);
          swift_bridgeObjectRelease();
          sub_229042240();
          (*(void (**)(char *, uint64_t))(v39 + 8))(v47, v1);
          sub_229042250();
          sub_229042280();
          uint64_t v28 = v55;
          if (qword_2682B4DE8 == -1)
          {
LABEL_36:
            uint64_t v48 = v58;
            uint64_t v49 = __swift_project_value_buffer(v58, (uint64_t)qword_2682C2E88);
            (*(void (**)(char *, uint64_t, uint64_t))(v57 + 16))(v60, v49, v48);
            sub_229041600();
            sub_2290414F0();
            return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v39 + 56))(v28, 0, 1, v1);
          }
        }
        else
        {
          __break(1u);
        }
        swift_once();
        goto LABEL_36;
      }
    }
    swift_bridgeObjectRelease();
    uint64_t v28 = MEMORY[0x263F8EE78];
    goto LABEL_26;
  }
  sub_229041250();
  v54[1] = v17;
  uint64_t v20 = (uint64_t *)(v17 + 64);
  while (1)
  {
    uint64_t v1 = v20[4];
    unint64_t v2 = v20[5];
    uint64_t v66 = *v20;
    uint64_t v67 = v19;
    swift_bridgeObjectRetain_n();
    swift_retain_n();
    swift_retain_n();
    swift_retain_n();
    swift_retain_n();
    swift_retain_n();
    swift_bridgeObjectRetain_n();
    sub_229040B60();
    id v21 = objc_msgSend(v68, sel_eventStore);
    uint64_t result = swift_unknownObjectRelease();
    if (!v21) {
      break;
    }
    uint64_t v23 = (void *)sub_2290422A0();
    id v24 = objc_msgSend(v21, sel_calendarWithIdentifier_, v23);
    swift_release_n();
    swift_release_n();
    swift_release_n();
    swift_release_n();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    swift_release_n();

    uint64_t v25 = v67;
    if (v24)
    {
      MEMORY[0x22A6AF6E0]();
      if (*(void *)((v69 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v69 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_229042340();
      }
      sub_229042360();
      sub_229042330();
    }
    v20 += 10;
    uint64_t v19 = v25 - 1;
    if (!v19)
    {
      swift_bridgeObjectRelease();
      unint64_t v26 = v69;
      unint64_t v18 = MEMORY[0x263F8EE78];
      goto LABEL_13;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_22903CE64(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_22903CF14;
  return MEMORY[0x270EE1840](a1, a2, a3);
}

uint64_t sub_22903CF14(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t sub_22903D010@<X0>(uint64_t a1@<X8>)
{
  if (qword_2682B4FE0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_2290414E0();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_2682B8060);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_22903D0D0(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_228F76138;
  return SetCalendarFocusConfiguration.perform()(a1);
}

uint64_t sub_22903D16C()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AF65A10);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)v14 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF665B0);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_2290414E0();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14[0] = *v0;
  if (qword_2682B4FE0 != -1) {
    swift_once();
  }
  uint64_t v11 = __swift_project_value_buffer(v7, (uint64_t)qword_2682B8060);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v11, v7);
  v14[1] = v14[0];
  sub_22903C2F0((uint64_t)v6);
  uint64_t v12 = sub_229041180();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v3, 1, 1, v12);
  return sub_2290411B0();
}

uint64_t sub_22903D394(uint64_t a1)
{
  unint64_t v2 = sub_22903D420();
  return MEMORY[0x270EE0D28](a1, v2);
}

uint64_t sub_22903D3D0(uint64_t a1)
{
  unint64_t v2 = sub_22903D478();
  return MEMORY[0x270EE1D98](a1, v2);
}

unint64_t sub_22903D420()
{
  unint64_t result = qword_26AF65FF0;
  if (!qword_26AF65FF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AF65FF0);
  }
  return result;
}

unint64_t sub_22903D478()
{
  unint64_t result = qword_26AF66008;
  if (!qword_26AF66008)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AF66008);
  }
  return result;
}

unint64_t sub_22903D4D0()
{
  unint64_t result = qword_26AF65FF8;
  if (!qword_26AF65FF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AF65FF8);
  }
  return result;
}

unint64_t sub_22903D528()
{
  unint64_t result = qword_26AF65FE0;
  if (!qword_26AF65FE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AF65FE0);
  }
  return result;
}

uint64_t sub_22903D57C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_22903D598()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_22903D5EC()
{
  unint64_t result = qword_26AF66010;
  if (!qword_26AF66010)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AF66010);
  }
  return result;
}

ValueMetadata *type metadata accessor for SetCalendarFocusConfiguration()
{
  return &type metadata for SetCalendarFocusConfiguration;
}

uint64_t sub_22903D650()
{
  return sub_228F764D0((unint64_t *)&qword_26AF65FC0, (uint64_t *)&unk_26AF65FD0);
}

uint64_t sub_22903D68C(uint64_t *a1)
{
  uint64_t v3 = a1[1];
  uint64_t result = sub_2290427E0();
  if (result >= v3)
  {
    if (v3 < 0) {
      goto LABEL_152;
    }
    if (v3) {
      return sub_22903DD78(0, v3, 1, a1);
    }
    return result;
  }
  if (v3 >= 0) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = v3 + 1;
  }
  if (v3 < -1) {
    goto LABEL_160;
  }
  uint64_t v105 = result;
  uint64_t v102 = a1;
  if (v3 < 2)
  {
    uint64_t v8 = MEMORY[0x263F8EE78];
    __dst = (char *)(MEMORY[0x263F8EE78] + 32);
    if (v3 != 1)
    {
      unint64_t v12 = *(void *)(MEMORY[0x263F8EE78] + 16);
      uint64_t v11 = (char *)MEMORY[0x263F8EE78];
LABEL_118:
      unint64_t v94 = v11;
      uint64_t v104 = v8;
      if (v12 >= 2)
      {
        uint64_t v95 = *v102;
        do
        {
          unint64_t v96 = v12 - 2;
          if (v12 < 2) {
            goto LABEL_147;
          }
          if (!v95) {
            goto LABEL_159;
          }
          unint64_t v97 = v94;
          uint64_t v98 = *(void *)&v94[16 * v96 + 32];
          uint64_t v99 = *(void *)&v94[16 * v12 + 24];
          sub_22903DE48((char *)(v95 + 16 * v98), (char *)(v95 + 16 * *(void *)&v94[16 * v12 + 16]), v95 + 16 * v99, __dst);
          if (v1) {
            break;
          }
          if (v99 < v98) {
            goto LABEL_148;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            unint64_t v97 = sub_22903E358((uint64_t)v97);
          }
          if (v96 >= *((void *)v97 + 2)) {
            goto LABEL_149;
          }
          uint64_t v100 = &v97[16 * v96 + 32];
          *(void *)uint64_t v100 = v98;
          *((void *)v100 + 1) = v99;
          unint64_t v101 = *((void *)v97 + 2);
          if (v12 > v101) {
            goto LABEL_150;
          }
          memmove(&v97[16 * v12 + 16], &v97[16 * v12 + 32], 16 * (v101 - v12));
          unint64_t v94 = v97;
          *((void *)v97 + 2) = v101 - 1;
          unint64_t v12 = v101 - 1;
        }
        while (v101 > 2);
      }
LABEL_115:
      swift_bridgeObjectRelease();
      *(void *)(v104 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
    uint64_t v104 = MEMORY[0x263F8EE78];
  }
  else
  {
    uint64_t v6 = v5 >> 1;
    uint64_t v7 = sub_229042350();
    *(void *)(v7 + 16) = v6;
    uint64_t v104 = v7;
    __dst = (char *)(v7 + 32);
  }
  uint64_t v9 = 0;
  uint64_t v10 = *a1;
  uint64_t v103 = v10 + 8;
  uint64_t v11 = (char *)MEMORY[0x263F8EE78];
  uint64_t v106 = v3;
  while (1)
  {
    uint64_t v13 = v9++;
    if (v9 >= v3) {
      goto LABEL_46;
    }
    uint64_t v14 = (uint64_t *)(v10 + 16 * v9);
    uint64_t v15 = *v14;
    uint64_t v16 = v14[1];
    unint64_t v17 = (void *)(v10 + 16 * v13);
    if (v15 == *v17 && v16 == v17[1])
    {
      uint64_t v20 = v13 + 2;
      if (v13 + 2 >= v3) {
        goto LABEL_45;
      }
      int v19 = 0;
    }
    else
    {
      int v19 = sub_229042810();
      uint64_t v20 = v13 + 2;
      if (v13 + 2 >= v3) {
        goto LABEL_36;
      }
    }
    id v21 = (void *)(v103 + 16 * v20);
    do
    {
      uint64_t v23 = (void *)(v10 + 16 * v9);
      if (*(v21 - 1) == *v23 && *v21 == v23[1])
      {
        if (v19) {
          goto LABEL_37;
        }
      }
      else if ((v19 ^ sub_229042810()))
      {
        goto LABEL_36;
      }
      v21 += 2;
      uint64_t v22 = v20 + 1;
      uint64_t v9 = v20;
      uint64_t v20 = v22;
    }
    while (v22 < v3);
    uint64_t v20 = v22;
LABEL_36:
    uint64_t v9 = v20;
    if (v19)
    {
LABEL_37:
      if (v20 < v13) {
        goto LABEL_155;
      }
      if (v13 < v20)
      {
        uint64_t v25 = 16 * v20;
        uint64_t v26 = 16 * v13;
        uint64_t v27 = v20;
        uint64_t v28 = v13;
        do
        {
          if (v28 != --v27)
          {
            if (!v10) {
              goto LABEL_158;
            }
            uint64_t v29 = v10 + v25;
            uint64_t v30 = *(void *)(v10 + v26);
            uint64_t v31 = *(void *)(v10 + v26 + 8);
            *(_OWORD *)(v10 + v26) = *(_OWORD *)(v10 + v25 - 16);
            *(void *)(v29 - 16) = v30;
            *(void *)(v29 - 8) = v31;
          }
          ++v28;
          v25 -= 16;
          v26 += 16;
        }
        while (v28 < v27);
      }
LABEL_45:
      uint64_t v9 = v20;
    }
LABEL_46:
    if (v9 < v3)
    {
      if (__OFSUB__(v9, v13)) {
        goto LABEL_151;
      }
      if (v9 - v13 < v105) {
        break;
      }
    }
LABEL_67:
    if (v9 < v13) {
      goto LABEL_146;
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v11 = sub_22903E0E4(0, *((void *)v11 + 2) + 1, 1, v11);
    }
    unint64_t v41 = *((void *)v11 + 2);
    unint64_t v40 = *((void *)v11 + 3);
    unint64_t v12 = v41 + 1;
    if (v41 >= v40 >> 1) {
      uint64_t v11 = sub_22903E0E4((char *)(v40 > 1), v41 + 1, 1, v11);
    }
    *((void *)v11 + 2) = v12;
    unint64_t v42 = v11 + 32;
    id v43 = &v11[16 * v41 + 32];
    *(void *)id v43 = v13;
    *((void *)v43 + 1) = v9;
    if (v41)
    {
      uint64_t v107 = v9;
      while (1)
      {
        unint64_t v44 = v12 - 1;
        if (v12 >= 4)
        {
          uint64_t v49 = &v42[16 * v12];
          uint64_t v50 = *((void *)v49 - 8);
          uint64_t v51 = *((void *)v49 - 7);
          BOOL v55 = __OFSUB__(v51, v50);
          uint64_t v52 = v51 - v50;
          if (v55) {
            goto LABEL_135;
          }
          uint64_t v54 = *((void *)v49 - 6);
          uint64_t v53 = *((void *)v49 - 5);
          BOOL v55 = __OFSUB__(v53, v54);
          uint64_t v47 = v53 - v54;
          char v48 = v55;
          if (v55) {
            goto LABEL_136;
          }
          unint64_t v56 = v12 - 2;
          uint64_t v57 = &v42[16 * v12 - 32];
          uint64_t v59 = *(void *)v57;
          uint64_t v58 = *((void *)v57 + 1);
          BOOL v55 = __OFSUB__(v58, v59);
          uint64_t v60 = v58 - v59;
          if (v55) {
            goto LABEL_138;
          }
          BOOL v55 = __OFADD__(v47, v60);
          uint64_t v61 = v47 + v60;
          if (v55) {
            goto LABEL_141;
          }
          if (v61 >= v52)
          {
            BOOL v79 = &v42[16 * v44];
            uint64_t v81 = *(void *)v79;
            uint64_t v80 = *((void *)v79 + 1);
            BOOL v55 = __OFSUB__(v80, v81);
            uint64_t v82 = v80 - v81;
            if (v55) {
              goto LABEL_145;
            }
            BOOL v72 = v47 < v82;
            goto LABEL_105;
          }
        }
        else
        {
          if (v12 != 3)
          {
            uint64_t v73 = *((void *)v11 + 4);
            uint64_t v74 = *((void *)v11 + 5);
            BOOL v55 = __OFSUB__(v74, v73);
            uint64_t v66 = v74 - v73;
            char v67 = v55;
            goto LABEL_99;
          }
          uint64_t v46 = *((void *)v11 + 4);
          uint64_t v45 = *((void *)v11 + 5);
          BOOL v55 = __OFSUB__(v45, v46);
          uint64_t v47 = v45 - v46;
          char v48 = v55;
        }
        if (v48) {
          goto LABEL_137;
        }
        unint64_t v56 = v12 - 2;
        BOOL v62 = &v42[16 * v12 - 32];
        uint64_t v64 = *(void *)v62;
        uint64_t v63 = *((void *)v62 + 1);
        BOOL v65 = __OFSUB__(v63, v64);
        uint64_t v66 = v63 - v64;
        char v67 = v65;
        if (v65) {
          goto LABEL_140;
        }
        id v68 = &v42[16 * v44];
        uint64_t v70 = *(void *)v68;
        uint64_t v69 = *((void *)v68 + 1);
        BOOL v55 = __OFSUB__(v69, v70);
        uint64_t v71 = v69 - v70;
        if (v55) {
          goto LABEL_143;
        }
        if (__OFADD__(v66, v71)) {
          goto LABEL_144;
        }
        if (v66 + v71 >= v47)
        {
          BOOL v72 = v47 < v71;
LABEL_105:
          if (v72) {
            unint64_t v44 = v56;
          }
          goto LABEL_107;
        }
LABEL_99:
        if (v67) {
          goto LABEL_139;
        }
        id v75 = &v42[16 * v44];
        uint64_t v77 = *(void *)v75;
        uint64_t v76 = *((void *)v75 + 1);
        BOOL v55 = __OFSUB__(v76, v77);
        uint64_t v78 = v76 - v77;
        if (v55) {
          goto LABEL_142;
        }
        if (v78 < v66) {
          goto LABEL_15;
        }
LABEL_107:
        unint64_t v83 = v44 - 1;
        if (v44 - 1 >= v12)
        {
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
          goto LABEL_154;
        }
        uint64_t v84 = v10;
        if (!v10) {
          goto LABEL_157;
        }
        uint64_t v85 = v11;
        uint64_t v86 = &v42[16 * v83];
        uint64_t v87 = *(void *)v86;
        uint64_t v88 = v42;
        unint64_t v89 = v44;
        uint64_t v90 = &v42[16 * v44];
        uint64_t v91 = *((void *)v90 + 1);
        uint64_t v92 = v84;
        sub_22903DE48((char *)(v84 + 16 * *(void *)v86), (char *)(v84 + 16 * *(void *)v90), v84 + 16 * v91, __dst);
        if (v1) {
          goto LABEL_115;
        }
        if (v91 < v87) {
          goto LABEL_132;
        }
        if (v89 > *((void *)v85 + 2)) {
          goto LABEL_133;
        }
        *(void *)uint64_t v86 = v87;
        *(void *)&v88[16 * v83 + 8] = v91;
        unint64_t v93 = *((void *)v85 + 2);
        if (v89 >= v93) {
          goto LABEL_134;
        }
        uint64_t v11 = v85;
        unint64_t v12 = v93 - 1;
        memmove(v90, v90 + 16, 16 * (v93 - 1 - v89));
        unint64_t v42 = v88;
        *((void *)v85 + 2) = v93 - 1;
        uint64_t v10 = v92;
        uint64_t v9 = v107;
        if (v93 <= 2) {
          goto LABEL_15;
        }
      }
    }
    unint64_t v12 = 1;
LABEL_15:
    uint64_t v3 = v106;
    if (v9 >= v106)
    {
      uint64_t v8 = v104;
      goto LABEL_118;
    }
  }
  if (__OFADD__(v13, v105)) {
    goto LABEL_153;
  }
  if (v13 + v105 >= v3) {
    uint64_t v32 = v3;
  }
  else {
    uint64_t v32 = v13 + v105;
  }
  if (v32 >= v13)
  {
    if (v9 != v32)
    {
      id v33 = (void *)(v10 + 16 * v9);
      do
      {
        long long v34 = (uint64_t *)(v10 + 16 * v9);
        uint64_t v35 = *v34;
        uint64_t v36 = v34[1];
        uint64_t v37 = v13;
        uint64_t v38 = v33;
        do
        {
          BOOL v39 = v35 == *(v38 - 2) && v36 == *(v38 - 1);
          if (v39 || (sub_229042810() & 1) == 0) {
            break;
          }
          if (!v10) {
            goto LABEL_156;
          }
          uint64_t v35 = *v38;
          uint64_t v36 = v38[1];
          *(_OWORD *)uint64_t v38 = *((_OWORD *)v38 - 1);
          *(v38 - 1) = v36;
          *(v38 - 2) = v35;
          v38 -= 2;
          ++v37;
        }
        while (v9 != v37);
        ++v9;
        v33 += 2;
      }
      while (v9 != v32);
      uint64_t v9 = v32;
    }
    goto LABEL_67;
  }
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
  uint64_t result = sub_229042760();
  __break(1u);
  return result;
}

uint64_t sub_22903DD78(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (a3 != a2)
  {
    uint64_t v4 = a3;
    uint64_t v6 = result;
    uint64_t v7 = *a4;
    uint64_t v8 = *a4 + 16 * a3;
LABEL_5:
    uint64_t v9 = (uint64_t *)(v7 + 16 * v4);
    uint64_t result = *v9;
    uint64_t v10 = v9[1];
    uint64_t v11 = v6;
    unint64_t v12 = (uint64_t *)v8;
    while (1)
    {
      BOOL v13 = result == *(v12 - 2) && v10 == *(v12 - 1);
      if (v13 || (uint64_t result = sub_229042810(), (result & 1) == 0))
      {
LABEL_4:
        ++v4;
        v8 += 16;
        if (v4 == a2) {
          return result;
        }
        goto LABEL_5;
      }
      if (!v7) {
        break;
      }
      uint64_t result = *v12;
      uint64_t v10 = v12[1];
      *(_OWORD *)unint64_t v12 = *((_OWORD *)v12 - 1);
      *(v12 - 1) = v10;
      *(v12 - 2) = result;
      v12 -= 2;
      if (v4 == ++v11) {
        goto LABEL_4;
      }
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_22903DE48(char *__src, char *a2, unint64_t a3, char *__dst)
{
  uint64_t v4 = __dst;
  uint64_t v6 = a2;
  uint64_t v7 = __src;
  int64_t v8 = a2 - __src;
  int64_t v9 = a2 - __src + 15;
  if (a2 - __src >= 0) {
    int64_t v9 = a2 - __src;
  }
  uint64_t v10 = v9 >> 4;
  uint64_t v11 = a3 - (void)a2;
  uint64_t v12 = a3 - (void)a2 + 15;
  if ((uint64_t)(a3 - (void)a2) >= 0) {
    uint64_t v12 = a3 - (void)a2;
  }
  uint64_t v13 = v12 >> 4;
  uint64_t v27 = __src;
  uint64_t v26 = __dst;
  if (v10 >= v12 >> 4)
  {
    if (v11 >= -15)
    {
      if (__dst != a2 || &a2[16 * v13] <= __dst) {
        memmove(__dst, a2, 16 * v13);
      }
      unint64_t v17 = &v4[16 * v13];
      uint64_t v25 = v17;
      uint64_t v27 = v6;
      if (v7 < v6 && v11 >= 16)
      {
        unint64_t v18 = (char *)(a3 - 16);
        int v19 = v6;
        while (1)
        {
          uint64_t v20 = v18 + 16;
          uint64_t v21 = *((void *)v19 - 2);
          uint64_t v22 = *((void *)v19 - 1);
          v19 -= 16;
          BOOL v23 = *((void *)v17 - 2) == v21 && *((void *)v17 - 1) == v22;
          if (v23 || (sub_229042810() & 1) == 0)
          {
            uint64_t v25 = v17 - 16;
            if (v20 < v17 || v18 >= v17 || v20 != v17) {
              *(_OWORD *)unint64_t v18 = *((_OWORD *)v17 - 1);
            }
            int v19 = v6;
            v17 -= 16;
            if (v6 <= v7) {
              goto LABEL_50;
            }
          }
          else
          {
            if (v20 != v6 || v18 >= v6) {
              *(_OWORD *)unint64_t v18 = *(_OWORD *)v19;
            }
            uint64_t v27 = v19;
            if (v19 <= v7) {
              goto LABEL_50;
            }
          }
          v18 -= 16;
          uint64_t v6 = v19;
          if (v17 <= v4) {
            goto LABEL_50;
          }
        }
      }
      goto LABEL_50;
    }
  }
  else if (v8 >= -15)
  {
    if (__dst != __src || &__src[16 * v10] <= __dst) {
      memmove(__dst, __src, 16 * v10);
    }
    uint64_t v14 = &v4[16 * v10];
    uint64_t v25 = v14;
    if ((unint64_t)v6 < a3 && v8 >= 16)
    {
      do
      {
        BOOL v15 = *(void *)v6 == *(void *)v4 && *((void *)v6 + 1) == *((void *)v4 + 1);
        if (v15 || (sub_229042810() & 1) == 0)
        {
          if (v7 != v4) {
            *(_OWORD *)uint64_t v7 = *(_OWORD *)v4;
          }
          v4 += 16;
          uint64_t v26 = v4;
          uint64_t v16 = v6;
        }
        else
        {
          uint64_t v16 = v6 + 16;
          if (v7 < v6 || v7 >= v16 || v7 != v6) {
            *(_OWORD *)uint64_t v7 = *(_OWORD *)v6;
          }
        }
        v7 += 16;
        if (v4 >= v14) {
          break;
        }
        uint64_t v6 = v16;
      }
      while ((unint64_t)v16 < a3);
      uint64_t v27 = v7;
    }
LABEL_50:
    sub_22903E29C((void **)&v27, (const void **)&v26, &v25);
    return 1;
  }
  uint64_t result = sub_2290427C0();
  __break(1u);
  return result;
}

char *sub_22903E0E4(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2682B80D8);
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

char *sub_22903E1E0(void **a1, const void **a2, void *a3)
{
  uint64_t v3 = (char *)*a2;
  uint64_t v4 = *a3 - (void)v3;
  uint64_t v5 = v4 + 7;
  if (v4 >= 0) {
    uint64_t v5 = *a3 - (void)v3;
  }
  if (v4 <= -8)
  {
    uint64_t result = (char *)sub_2290427C0();
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

char *sub_22903E29C(void **a1, const void **a2, void *a3)
{
  uint64_t v3 = (char *)*a2;
  uint64_t v4 = *a3 - (void)v3;
  uint64_t v5 = v4 + 15;
  if (v4 >= 0) {
    uint64_t v5 = *a3 - (void)v3;
  }
  if (v4 <= -16)
  {
    uint64_t result = (char *)sub_2290427C0();
    __break(1u);
  }
  else
  {
    uint64_t result = (char *)*a1;
    uint64_t v7 = v5 >> 4;
    if (result != v3 || result >= &v3[16 * v7])
    {
      return (char *)memmove(result, v3, 16 * v7);
    }
  }
  return result;
}

char *sub_22903E358(uint64_t a1)
{
  return sub_22903E0E4(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_22903E36C()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2682B80F0);
  uint64_t v3 = sub_229042670();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v28 = v0;
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    unint64_t v6 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v7 = ~(-1 << v5);
    }
    else {
      uint64_t v7 = -1;
    }
    unint64_t v8 = v7 & *(void *)(v2 + 56);
    int64_t v9 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v10 = v3 + 56;
    uint64_t result = sub_229040F70();
    int64_t v12 = 0;
    while (1)
    {
      if (v8)
      {
        unint64_t v14 = __clz(__rbit64(v8));
        v8 &= v8 - 1;
        unint64_t v15 = v14 | (v12 << 6);
      }
      else
      {
        int64_t v16 = v12 + 1;
        if (__OFADD__(v12, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v9) {
          goto LABEL_33;
        }
        unint64_t v17 = v6[v16];
        ++v12;
        if (!v17)
        {
          int64_t v12 = v16 + 1;
          if (v16 + 1 >= v9) {
            goto LABEL_33;
          }
          unint64_t v17 = v6[v12];
          if (!v17)
          {
            int64_t v12 = v16 + 2;
            if (v16 + 2 >= v9) {
              goto LABEL_33;
            }
            unint64_t v17 = v6[v12];
            if (!v17)
            {
              int64_t v18 = v16 + 3;
              if (v18 >= v9)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v28;
                uint64_t v27 = 1 << *(unsigned char *)(v2 + 32);
                if (v27 > 63) {
                  bzero((void *)(v2 + 56), ((unint64_t)(v27 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *unint64_t v6 = -1 << v27;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v17 = v6[v18];
              if (!v17)
              {
                while (1)
                {
                  int64_t v12 = v18 + 1;
                  if (__OFADD__(v18, 1)) {
                    goto LABEL_39;
                  }
                  if (v12 >= v9) {
                    goto LABEL_33;
                  }
                  unint64_t v17 = v6[v12];
                  ++v18;
                  if (v17) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v12 = v18;
            }
          }
        }
LABEL_23:
        unint64_t v8 = (v17 - 1) & v17;
        unint64_t v15 = __clz(__rbit64(v17)) + (v12 << 6);
      }
      uint64_t v19 = *(void *)(*(void *)(v2 + 48) + 8 * v15);
      uint64_t result = sub_229042510();
      uint64_t v20 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v21 = result & ~v20;
      unint64_t v22 = v21 >> 6;
      if (((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6))) != 0)
      {
        unint64_t v13 = __clz(__rbit64((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v23 = 0;
        unint64_t v24 = (unint64_t)(63 - v20) >> 6;
        do
        {
          if (++v22 == v24 && (v23 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v25 = v22 == v24;
          if (v22 == v24) {
            unint64_t v22 = 0;
          }
          v23 |= v25;
          uint64_t v26 = *(void *)(v10 + 8 * v22);
        }
        while (v26 == -1);
        unint64_t v13 = __clz(__rbit64(~v26)) + (v22 << 6);
      }
      *(void *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
      *(void *)(*(void *)(v4 + 48) + 8 * v13) = v19;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

uint64_t sub_22903E60C()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2682B8100);
  uint64_t v3 = sub_229042670();
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
    uint64_t result = sub_229040F70();
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
      uint64_t v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
      uint64_t v20 = *v19;
      uint64_t v21 = v19[1];
      sub_2290428B0();
      sub_2290422C0();
      uint64_t result = sub_2290428D0();
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
      unint64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
      void *v13 = v20;
      v13[1] = v21;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

unint64_t sub_22903E8EC(uint64_t a1, uint64_t a2)
{
  sub_229042510();
  unint64_t result = sub_2290425B0();
  *(void *)(a2 + 56 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
  *(void *)(*(void *)(a2 + 48) + 8 * result) = a1;
  ++*(void *)(a2 + 16);
  return result;
}

uint64_t sub_22903E970(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  if (!a3)
  {
    uint64_t v9 = MEMORY[0x263F8EE88];
LABEL_36:
    swift_release();
    return v9;
  }
  uint64_t v5 = a3;
  if (*(void *)(a4 + 16) == a3) {
    return v4;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2682B80F0);
  uint64_t result = sub_229042690();
  uint64_t v9 = result;
  uint64_t v28 = a1;
  if (a2 < 1) {
    unint64_t v10 = 0;
  }
  else {
    unint64_t v10 = *a1;
  }
  uint64_t v11 = 0;
  uint64_t v12 = result + 56;
  while (1)
  {
    if (v10)
    {
      unint64_t v13 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v14 = v13 | (v11 << 6);
      goto LABEL_24;
    }
    uint64_t v15 = v11 + 1;
    if (__OFADD__(v11, 1)) {
      goto LABEL_39;
    }
    if (v15 >= a2) {
      goto LABEL_36;
    }
    unint64_t v16 = v28[v15];
    ++v11;
    if (!v16)
    {
      uint64_t v11 = v15 + 1;
      if (v15 + 1 >= a2) {
        goto LABEL_36;
      }
      unint64_t v16 = v28[v11];
      if (!v16)
      {
        uint64_t v11 = v15 + 2;
        if (v15 + 2 >= a2) {
          goto LABEL_36;
        }
        unint64_t v16 = v28[v11];
        if (!v16) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v10 = (v16 - 1) & v16;
    unint64_t v14 = __clz(__rbit64(v16)) + (v11 << 6);
LABEL_24:
    id v18 = *(id *)(*(void *)(v4 + 48) + 8 * v14);
    uint64_t result = sub_229042510();
    uint64_t v19 = -1 << *(unsigned char *)(v9 + 32);
    unint64_t v20 = result & ~v19;
    unint64_t v21 = v20 >> 6;
    if (((-1 << v20) & ~*(void *)(v12 + 8 * (v20 >> 6))) != 0)
    {
      unint64_t v22 = __clz(__rbit64((-1 << v20) & ~*(void *)(v12 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v23 = 0;
      unint64_t v24 = (unint64_t)(63 - v19) >> 6;
      do
      {
        if (++v21 == v24 && (v23 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        BOOL v25 = v21 == v24;
        if (v21 == v24) {
          unint64_t v21 = 0;
        }
        v23 |= v25;
        uint64_t v26 = *(void *)(v12 + 8 * v21);
      }
      while (v26 == -1);
      unint64_t v22 = __clz(__rbit64(~v26)) + (v21 << 6);
    }
    *(void *)(v12 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v22;
    *(void *)(*(void *)(v9 + 48) + 8 * v22) = v18;
    ++*(void *)(v9 + 16);
    if (__OFSUB__(v5--, 1))
    {
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    if (!v5) {
      goto LABEL_36;
    }
  }
  uint64_t v17 = v15 + 3;
  if (v17 >= a2) {
    goto LABEL_36;
  }
  unint64_t v16 = v28[v17];
  if (v16)
  {
    uint64_t v11 = v17;
    goto LABEL_23;
  }
  while (1)
  {
    uint64_t v11 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v11 >= a2) {
      goto LABEL_36;
    }
    unint64_t v16 = v28[v11];
    ++v17;
    if (v16) {
      goto LABEL_23;
    }
  }
LABEL_40:
  __break(1u);
  return result;
}

uint64_t sub_22903EBD0(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  sub_2290428B0();
  sub_229041250();
  sub_2290422C0();
  uint64_t v8 = sub_2290428D0();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    uint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_229042810() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      unint64_t v14 = (uint64_t *)(*(void *)(*v3 + 48) + 16 * v10);
      uint64_t v15 = v14[1];
      *a1 = *v14;
      a1[1] = v15;
      sub_229041250();
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
      if (v19 || (sub_229042810() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  sub_229041250();
  sub_22903F218(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *uint64_t v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_22903ED80(void *a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = *v2;
  if ((*v2 & 0xC000000000000001) != 0)
  {
    if (v6 < 0) {
      uint64_t v7 = *v2;
    }
    else {
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFF8;
    }
    sub_229041250();
    id v8 = a2;
    uint64_t v9 = sub_229042620();

    if (v9)
    {
      swift_bridgeObjectRelease();

      sub_228F8A728(0, (unint64_t *)&qword_2682B5D80);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      *a1 = v26;
      swift_unknownObjectRelease();
      return 0;
    }
    uint64_t result = sub_229042610();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    uint64_t v21 = sub_22903F020(v7, result + 1);
    uint64_t v27 = v21;
    if (*(void *)(v21 + 24) <= *(void *)(v21 + 16))
    {
      id v25 = v8;
      sub_22903E36C();
      uint64_t v22 = v27;
    }
    else
    {
      uint64_t v22 = v21;
      id v23 = v8;
    }
    sub_22903E8EC((uint64_t)v8, v22);
    *uint64_t v3 = v22;
  }
  else
  {
    sub_229041250();
    uint64_t v11 = sub_229042510();
    uint64_t v12 = -1 << *(unsigned char *)(v6 + 32);
    unint64_t v13 = v11 & ~v12;
    if ((*(void *)(v6 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13))
    {
      sub_228F8A728(0, (unint64_t *)&qword_2682B5D80);
      id v14 = *(id *)(*(void *)(v6 + 48) + 8 * v13);
      char v15 = sub_229042520();

      if (v15)
      {
LABEL_12:

        swift_bridgeObjectRelease();
        BOOL v19 = *(void **)(*(void *)(*v2 + 48) + 8 * v13);
        *a1 = v19;
        id v20 = v19;
        return 0;
      }
      uint64_t v16 = ~v12;
      while (1)
      {
        unint64_t v13 = (v13 + 1) & v16;
        if (((*(void *)(v6 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13) & 1) == 0) {
          break;
        }
        id v17 = *(id *)(*(void *)(v6 + 48) + 8 * v13);
        char v18 = sub_229042520();

        if (v18) {
          goto LABEL_12;
        }
      }
    }
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v28 = *v2;
    *uint64_t v2 = 0x8000000000000000;
    id v8 = a2;
    sub_22903F3B4((uint64_t)v8, v13, isUniquelyReferenced_nonNull_native);
    *uint64_t v2 = v28;
  }
  swift_bridgeObjectRelease();
  *a1 = v8;
  return 1;
}

uint64_t sub_22903F020(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2682B80F0);
    uint64_t v2 = sub_229042680();
    uint64_t v14 = v2;
    sub_2290425D0();
    if (sub_229042640())
    {
      sub_228F8A728(0, (unint64_t *)&qword_2682B5D80);
      do
      {
        swift_dynamicCast();
        uint64_t v2 = v14;
        if (*(void *)(v14 + 24) <= *(void *)(v14 + 16))
        {
          sub_22903E36C();
          uint64_t v2 = v14;
        }
        uint64_t result = sub_229042510();
        uint64_t v4 = v2 + 56;
        uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
        unint64_t v6 = result & ~v5;
        unint64_t v7 = v6 >> 6;
        if (((-1 << v6) & ~*(void *)(v2 + 56 + 8 * (v6 >> 6))) != 0)
        {
          unint64_t v8 = __clz(__rbit64((-1 << v6) & ~*(void *)(v2 + 56 + 8 * (v6 >> 6)))) | v6 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          char v9 = 0;
          unint64_t v10 = (unint64_t)(63 - v5) >> 6;
          do
          {
            if (++v7 == v10 && (v9 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            BOOL v11 = v7 == v10;
            if (v7 == v10) {
              unint64_t v7 = 0;
            }
            v9 |= v11;
            uint64_t v12 = *(void *)(v4 + 8 * v7);
          }
          while (v12 == -1);
          unint64_t v8 = __clz(__rbit64(~v12)) + (v7 << 6);
        }
        *(void *)(v4 + ((v8 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v8;
        *(void *)(*(void *)(v2 + 48) + 8 * v8) = v13;
        ++*(void *)(v2 + 16);
      }
      while (sub_229042640());
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return MEMORY[0x263F8EE88];
  }
  return v2;
}

uint64_t sub_22903F218(uint64_t result, uint64_t a2, unint64_t a3, char a4)
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
    sub_22903E60C();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (uint64_t)sub_22903F53C();
      goto LABEL_22;
    }
    sub_22903F89C();
  }
  uint64_t v11 = *v4;
  sub_2290428B0();
  sub_2290422C0();
  uint64_t result = sub_2290428D0();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    char v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = sub_229042810(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = sub_229042850();
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
        char v18 = (void *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          uint64_t result = sub_229042810();
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
  *uint64_t v21 = v8;
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

void sub_22903F3B4(uint64_t a1, unint64_t a2, char a3)
{
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  if (a3)
  {
    sub_22903E36C();
  }
  else
  {
    if (v7 > v6)
    {
      sub_22903F6F0();
      goto LABEL_14;
    }
    sub_22903FB4C();
  }
  uint64_t v8 = *v3;
  uint64_t v9 = sub_229042510();
  uint64_t v10 = -1 << *(unsigned char *)(v8 + 32);
  a2 = v9 & ~v10;
  if ((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    sub_228F8A728(0, (unint64_t *)&qword_2682B5D80);
    id v11 = *(id *)(*(void *)(v8 + 48) + 8 * a2);
    char v12 = sub_229042520();

    if (v12)
    {
LABEL_13:
      sub_229042850();
      __break(1u);
    }
    else
    {
      uint64_t v13 = ~v10;
      while (1)
      {
        a2 = (a2 + 1) & v13;
        if (((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
          break;
        }
        id v14 = *(id *)(*(void *)(v8 + 48) + 8 * a2);
        char v15 = sub_229042520();

        if (v15) {
          goto LABEL_13;
        }
      }
    }
  }
LABEL_14:
  uint64_t v16 = *v3;
  *(void *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(void *)(*(void *)(v16 + 48) + 8 * a2) = a1;
  uint64_t v17 = *(void *)(v16 + 16);
  BOOL v18 = __OFADD__(v17, 1);
  uint64_t v19 = v17 + 1;
  if (v18) {
    __break(1u);
  }
  else {
    *(void *)(v16 + 16) = v19;
  }
}

void *sub_22903F53C()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2682B8100);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_229042660();
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
    uint64_t v19 = (void *)(*(void *)(v4 + 48) + v16);
    *uint64_t v19 = *v17;
    v19[1] = v18;
    uint64_t result = (void *)sub_229041250();
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

id sub_22903F6F0()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2682B80F0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_229042660();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    id result = (id)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (id)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 56), 8 * v7);
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
    int64_t v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v18 >= v13) {
      goto LABEL_28;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      int64_t v9 = v18 + 1;
      if (v18 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v19 = *(void *)(v6 + 8 * v9);
      if (!v19)
      {
        int64_t v9 = v18 + 2;
        if (v18 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v19 = *(void *)(v6 + 8 * v9);
        if (!v19) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v19 - 1) & v19;
    unint64_t v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void **)(*(void *)(v2 + 48) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    id result = v17;
  }
  int64_t v20 = v18 + 3;
  if (v20 >= v13) {
    goto LABEL_28;
  }
  unint64_t v19 = *(void *)(v6 + 8 * v20);
  if (v19)
  {
    int64_t v9 = v20;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v9);
    ++v20;
    if (v19) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_22903F89C()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2682B8100);
  uint64_t v3 = sub_229042670();
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
  uint64_t result = sub_229040F70();
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
    unint64_t v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    sub_2290428B0();
    sub_229041250();
    sub_2290422C0();
    uint64_t result = sub_2290428D0();
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
    void *v13 = v20;
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

uint64_t sub_22903FB4C()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2682B80F0);
  uint64_t v3 = sub_229042670();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v1 = v4;
    return result;
  }
  BOOL v27 = v0;
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v6 = v2 + 56;
  if (v5 < 64) {
    uint64_t v7 = ~(-1 << v5);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(v2 + 56);
  int64_t v9 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v10 = v3 + 56;
  uint64_t result = sub_229040F70();
  int64_t v12 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v15 = v14 | (v12 << 6);
      goto LABEL_24;
    }
    int64_t v16 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v9) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v12;
    if (!v17)
    {
      int64_t v12 = v16 + 1;
      if (v16 + 1 >= v9) {
        goto LABEL_33;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v12);
      if (!v17)
      {
        int64_t v12 = v16 + 2;
        if (v16 + 2 >= v9) {
          goto LABEL_33;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v12);
        if (!v17) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v12 << 6);
LABEL_24:
    id v19 = *(id *)(*(void *)(v2 + 48) + 8 * v15);
    uint64_t result = sub_229042510();
    uint64_t v20 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6))) != 0)
    {
      unint64_t v13 = __clz(__rbit64((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v23 = 0;
      unint64_t v24 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v24 && (v23 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v25 = v22 == v24;
        if (v22 == v24) {
          unint64_t v22 = 0;
        }
        v23 |= v25;
        uint64_t v26 = *(void *)(v10 + 8 * v22);
      }
      while (v26 == -1);
      unint64_t v13 = __clz(__rbit64(~v26)) + (v22 << 6);
    }
    *(void *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
    *(void *)(*(void *)(v4 + 48) + 8 * v13) = v19;
    ++*(void *)(v4 + 16);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v9)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v27;
    goto LABEL_35;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v12 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v12 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v12 >= v9) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v12);
    ++v18;
    if (v17) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_22903FDC8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  void v35[2] = *MEMORY[0x263EF8340];
  if (!*(void *)(a2 + 16))
  {
    swift_release();
    return MEMORY[0x263F8EE88];
  }
  v35[0] = a1;
  unint64_t v33 = (unint64_t)a1 >> 62;
  if ((unint64_t)a1 >> 62)
  {
LABEL_30:
    sub_229041250();
    if (sub_229042780()) {
      goto LABEL_4;
    }
LABEL_21:
    swift_bridgeObjectRelease();
    return v2;
  }
  uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  sub_229041250();
  if (!v4) {
    goto LABEL_21;
  }
LABEL_4:
  unint64_t v5 = 0;
  uint64_t v6 = v2 + 56;
  unint64_t v34 = a1 & 0xC000000000000001;
  uint64_t v7 = a1 & 0xFFFFFFFFFFFFFF8;
  uint64_t v32 = a1 & 0xFFFFFFFFFFFFFF8;
  if (a1 < 0) {
    uint64_t v7 = a1;
  }
  uint64_t v30 = a1 + 32;
  uint64_t v31 = v7;
  while (1)
  {
    if (v34)
    {
      id v8 = (id)MEMORY[0x22A6AFAB0](v5, a1);
    }
    else
    {
      if (v5 >= *(void *)(v32 + 16)) {
        __break(1u);
      }
      id v8 = *(id *)(v30 + 8 * v5);
    }
    int64_t v9 = v8;
    if (__OFADD__(v5++, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    uint64_t v11 = sub_229042510();
    uint64_t v12 = -1 << *(unsigned char *)(v2 + 32);
    unint64_t v13 = v11 & ~v12;
    if ((*(void *)(v6 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13)) {
      break;
    }
LABEL_19:

    if (v33)
    {
      sub_229041250();
      uint64_t v19 = sub_229042780();
      swift_bridgeObjectRelease();
      if (v5 == v19) {
        goto LABEL_21;
      }
    }
    else if (v5 == *(void *)(v32 + 16))
    {
      goto LABEL_21;
    }
  }
  sub_228F8A728(0, (unint64_t *)&qword_2682B5D80);
  id v14 = *(id *)(*(void *)(v2 + 48) + 8 * v13);
  char v15 = sub_229042520();

  if ((v15 & 1) == 0)
  {
    uint64_t v16 = ~v12;
    do
    {
      unint64_t v13 = (v13 + 1) & v16;
      if (((*(void *)(v6 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13) & 1) == 0) {
        goto LABEL_19;
      }
      id v17 = *(id *)(*(void *)(v2 + 48) + 8 * v13);
      char v18 = sub_229042520();
    }
    while ((v18 & 1) == 0);
  }

  v35[1] = v5;
  char v21 = *(unsigned char *)(v2 + 32);
  unint64_t v22 = (unint64_t)((1 << v21) + 63) >> 6;
  size_t v23 = 8 * v22;
  if ((v21 & 0x3Fu) < 0xE
    || (uint64_t isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), isStackAllocationSafe))
  {
    MEMORY[0x270FA5388](isStackAllocationSafe);
    memcpy((char *)&v29 - ((v23 + 15) & 0x3FFFFFFFFFFFFFF0), (const void *)(v2 + 56), v23);
    sub_229040174((unint64_t *)((char *)&v29 - ((v23 + 15) & 0x3FFFFFFFFFFFFFF0)), v22, v2, v13, v35);
    uint64_t v25 = v24;
    swift_release();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v26 = (void *)swift_slowAlloc();
    memcpy(v26, (const void *)(v2 + 56), v23);
    sub_229040174((unint64_t *)v26, v22, v2, v13, v35);
    uint64_t v25 = v27;
    swift_release();
    swift_bridgeObjectRelease();
    MEMORY[0x22A6B0490](v26, -1, -1);
  }
  return v25;
}

void sub_229040174(unint64_t *a1, uint64_t a2, uint64_t a3, unint64_t a4, void *a5)
{
  unint64_t v5 = a5;
  uint64_t v7 = *(void *)(a3 + 16);
  *(unint64_t *)((char *)a1 + ((a4 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a4) - 1;
  uint64_t v33 = v7 - 1;
  unint64_t v8 = a5[1];
  if (*a5 >> 62)
  {
    sub_229041250();
    uint64_t v9 = sub_229042780();
    swift_bridgeObjectRelease();
    if (v8 == v9) {
      goto LABEL_3;
    }
  }
  else if (v8 == *(void *)((*a5 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_3:
    sub_229040F70();
    sub_22903E970(a1, a2, v33, a3);
    return;
  }
  uint64_t v35 = a3 + 56;
  unint64_t v34 = v5;
  while (1)
  {
    uint64_t v10 = *v5;
    if ((*v5 & 0xC000000000000001) != 0)
    {
      id v11 = (id)MEMORY[0x22A6AFAB0](v8);
      goto LABEL_10;
    }
    if ((v8 & 0x8000000000000000) != 0) {
      break;
    }
    if (v8 >= *(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_32;
    }
    id v11 = *(id *)(v10 + 8 * v8 + 32);
LABEL_10:
    uint64_t v12 = v11;
    uint64_t v13 = v5[1];
    BOOL v14 = __OFADD__(v13, 1);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_33;
    }
    v5[1] = v15;
    uint64_t v16 = sub_229042510();
    uint64_t v17 = -1 << *(unsigned char *)(a3 + 32);
    unint64_t v18 = v16 & ~v17;
    unint64_t v19 = v18 >> 6;
    uint64_t v20 = 1 << v18;
    if (((1 << v18) & *(void *)(v35 + 8 * (v18 >> 6))) == 0) {
      goto LABEL_18;
    }
    sub_228F8A728(0, (unint64_t *)&qword_2682B5D80);
    id v21 = *(id *)(*(void *)(a3 + 48) + 8 * v18);
    char v22 = sub_229042520();

    if ((v22 & 1) == 0)
    {
      uint64_t v23 = ~v17;
      for (unint64_t i = v18 + 1; ; unint64_t i = v25 + 1)
      {
        unint64_t v25 = i & v23;
        if (((*(void *)(v35 + (((i & v23) >> 3) & 0xFFFFFFFFFFFFFF8)) >> (i & v23)) & 1) == 0) {
          break;
        }
        id v26 = *(id *)(*(void *)(a3 + 48) + 8 * v25);
        char v27 = sub_229042520();

        if (v27)
        {

          unint64_t v19 = v25 >> 6;
          uint64_t v20 = 1 << v25;
          goto LABEL_20;
        }
      }
LABEL_18:

LABEL_24:
      unint64_t v5 = v34;
      goto LABEL_25;
    }

LABEL_20:
    unint64_t v28 = a1[v19];
    a1[v19] = v28 & ~v20;
    if ((v20 & v28) == 0) {
      goto LABEL_24;
    }
    unint64_t v5 = v34;
    uint64_t v29 = v33 - 1;
    if (__OFSUB__(v33, 1)) {
      goto LABEL_34;
    }
    --v33;
    if (!v29) {
      return;
    }
LABEL_25:
    unint64_t v8 = v5[1];
    if (*v5 >> 62)
    {
      sub_229041250();
      uint64_t v30 = sub_229042780();
      swift_bridgeObjectRelease();
      if (v8 == v30) {
        goto LABEL_3;
      }
    }
    else if (v8 == *(void *)((*v5 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      goto LABEL_3;
    }
  }
  __break(1u);
LABEL_32:
  __break(1u);
LABEL_33:
  __break(1u);
LABEL_34:
  __break(1u);
}

int64_t sub_229040440(int64_t result, int a2, char a3, uint64_t a4)
{
  if (a3) {
    goto LABEL_20;
  }
  unint64_t v4 = result;
  if (result < 0 || (uint64_t result = 1 << *(unsigned char *)(a4 + 32), result <= (uint64_t)v4))
  {
    __break(1u);
    goto LABEL_18;
  }
  unint64_t v5 = v4 >> 6;
  uint64_t v6 = a4 + 56;
  unint64_t v7 = *(void *)(a4 + 56 + 8 * (v4 >> 6));
  if (((v7 >> v4) & 1) == 0)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (*(_DWORD *)(a4 + 36) != a2)
  {
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
    return result;
  }
  unint64_t v8 = v7 & (-2 << (v4 & 0x3F));
  if (v8) {
    return __clz(__rbit64(v8)) | v4 & 0xFFFFFFFFFFFFFFC0;
  }
  unint64_t v9 = v5 + 1;
  unint64_t v10 = (unint64_t)(result + 63) >> 6;
  if (v5 + 1 < v10)
  {
    unint64_t v11 = *(void *)(v6 + 8 * v9);
    if (v11) {
      return __clz(__rbit64(v11)) + (v9 << 6);
    }
    unint64_t v9 = v5 + 2;
    if (v5 + 2 < v10)
    {
      unint64_t v11 = *(void *)(v6 + 8 * v9);
      if (v11) {
        return __clz(__rbit64(v11)) + (v9 << 6);
      }
      while (v10 - 3 != v5)
      {
        unint64_t v11 = *(void *)(a4 + 80 + 8 * v5++);
        if (v11)
        {
          unint64_t v9 = v5 + 2;
          return __clz(__rbit64(v11)) + (v9 << 6);
        }
      }
    }
  }
  return result;
}

void sub_229040524(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  unint64_t v6 = a1;
  if ((a4 & 0xC000000000000001) != 0)
  {
    if (a3)
    {
      if (a4 < 0) {
        uint64_t v7 = a4;
      }
      else {
        uint64_t v7 = a4 & 0xFFFFFFFFFFFFFF8;
      }
      MEMORY[0x22A6AFA20](a1, a2, v7);
      sub_228F8A728(0, (unint64_t *)&qword_2682B5D80);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      swift_unknownObjectRelease();
      return;
    }
LABEL_27:
    __break(1u);
    return;
  }
  if (a3) {
    goto LABEL_13;
  }
  if (a1 < 0 || 1 << *(unsigned char *)(a4 + 32) <= a1)
  {
    __break(1u);
    goto LABEL_24;
  }
  if (((*(void *)(a4 + 8 * ((unint64_t)a1 >> 6) + 56) >> a1) & 1) == 0)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  if (*(_DWORD *)(a4 + 36) == a2) {
    goto LABEL_20;
  }
  __break(1u);
LABEL_13:
  if (sub_2290425F0() != *(_DWORD *)(a4 + 36))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  sub_229042600();
  sub_228F8A728(0, (unint64_t *)&qword_2682B5D80);
  swift_unknownObjectRetain();
  swift_dynamicCast();
  unint64_t v4 = v17;
  swift_unknownObjectRelease();
  uint64_t v8 = sub_229042510();
  uint64_t v9 = -1 << *(unsigned char *)(a4 + 32);
  unint64_t v6 = v8 & ~v9;
  if (((*(void *)(a4 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
  {
LABEL_26:

    __break(1u);
    goto LABEL_27;
  }
  id v10 = *(id *)(*(void *)(a4 + 48) + 8 * v6);
  char v11 = sub_229042520();

  if ((v11 & 1) == 0)
  {
    uint64_t v12 = ~v9;
    do
    {
      unint64_t v6 = (v6 + 1) & v12;
      if (((*(void *)(a4 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
        goto LABEL_26;
      }
      id v13 = *(id *)(*(void *)(a4 + 48) + 8 * v6);
      char v14 = sub_229042520();
    }
    while ((v14 & 1) == 0);
  }

LABEL_20:
  uint64_t v15 = *(void **)(*(void *)(a4 + 48) + 8 * v6);
  id v16 = v15;
}

uint64_t sub_22904079C(uint64_t a1)
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
  unint64_t v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 2) {
    unint64_t v7 = 2;
  }
  unint64_t v8 = v7 - 2;
  uint64_t v9 = (unint64_t *)(a1 + 72);
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

uint64_t sub_229040824(uint64_t a1)
{
  return sub_228F8A5B8(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_229040838(unint64_t a1)
{
  unint64_t v2 = a1 >> 62;
  if (a1 >> 62)
  {
    sub_229041250();
    sub_229042780();
    swift_bridgeObjectRelease();
  }
  sub_228F8A728(0, (unint64_t *)&qword_2682B5D80);
  sub_228FD2D88();
  uint64_t result = sub_229042420();
  uint64_t v10 = result;
  if (v2)
  {
    sub_229041250();
    uint64_t v4 = sub_229042780();
    uint64_t result = swift_bridgeObjectRelease();
    if (!v4) {
      return v10;
    }
  }
  else
  {
    uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v4) {
      return v10;
    }
  }
  if (v4 >= 1)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        unsigned int v6 = (void *)MEMORY[0x22A6AFAB0](i, a1);
        sub_22903ED80(&v9, v6);
      }
    }
    else
    {
      unint64_t v7 = (void **)(a1 + 32);
      do
      {
        unint64_t v8 = *v7++;
        sub_22903ED80(&v9, v8);

        --v4;
      }
      while (v4);
    }
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_22904098C(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

void __getREMStoreClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  unint64_t v1 = [NSString stringWithUTF8String:"Class getREMStoreClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"CalLinkREMStoreWrapper.m", 17, @"Unable to find class %s", "REMStore");

  __break(1u);
}

void ReminderKitLibrary_cold_1(void *a1)
{
  unint64_t v2 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *ReminderKitLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"CalLinkREMStoreWrapper.m", 16, @"%s", *a1);

  __break(1u);
}

void __getREMObjectIDClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  unint64_t v1 = [NSString stringWithUTF8String:"Class getREMObjectIDClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"CalLinkREMStoreWrapper.m", 19, @"Unable to find class %s", "REMObjectID");

  __break(1u);
  sub_229040B10();
}

uint64_t sub_229040B10()
{
  return MEMORY[0x270EE0998]();
}

uint64_t sub_229040B20()
{
  return MEMORY[0x270EE09B0]();
}

uint64_t sub_229040B50()
{
  return MEMORY[0x270EE0A10]();
}

uint64_t sub_229040B60()
{
  return MEMORY[0x270EE0A18]();
}

uint64_t sub_229040B70()
{
  return MEMORY[0x270EE0A28]();
}

uint64_t sub_229040B80()
{
  return MEMORY[0x270EE0A38]();
}

uint64_t sub_229040B90()
{
  return MEMORY[0x270EE0A48]();
}

uint64_t sub_229040BA0()
{
  return MEMORY[0x270EE0A88]();
}

uint64_t sub_229040BB0()
{
  return MEMORY[0x270EE0A98]();
}

uint64_t sub_229040BC0()
{
  return MEMORY[0x270EE0B70]();
}

uint64_t sub_229040BD0()
{
  return MEMORY[0x270EE0B80]();
}

uint64_t sub_229040BE0()
{
  return MEMORY[0x270EE0B90]();
}

uint64_t sub_229040BF0()
{
  return MEMORY[0x270EE0BA8]();
}

uint64_t sub_229040C00()
{
  return MEMORY[0x270EE0BB0]();
}

uint64_t sub_229040C10()
{
  return MEMORY[0x270EE0BB8]();
}

uint64_t sub_229040C20()
{
  return MEMORY[0x270EE0BC0]();
}

uint64_t sub_229040C40()
{
  return MEMORY[0x270EE0C50]();
}

uint64_t sub_229040C70()
{
  return MEMORY[0x270EE0C80]();
}

uint64_t sub_229040C80()
{
  return MEMORY[0x270EE0CB0]();
}

uint64_t sub_229040C90()
{
  return MEMORY[0x270EE0CB8]();
}

uint64_t sub_229040CA0()
{
  return MEMORY[0x270EE0CC0]();
}

uint64_t sub_229040CB0()
{
  return MEMORY[0x270EE0CD0]();
}

uint64_t sub_229040CD0()
{
  return MEMORY[0x270EE0D18]();
}

uint64_t sub_229040CF0()
{
  return MEMORY[0x270EE0E08]();
}

uint64_t sub_229040D20()
{
  return MEMORY[0x270EE0E68]();
}

uint64_t sub_229040D30()
{
  return MEMORY[0x270EE0E78]();
}

uint64_t sub_229040D40()
{
  return MEMORY[0x270EE0E88]();
}

uint64_t sub_229040D50()
{
  return MEMORY[0x270EE0F60]();
}

uint64_t sub_229040D60()
{
  return MEMORY[0x270EE0F78]();
}

uint64_t sub_229040D70()
{
  return MEMORY[0x270EE0F98]();
}

uint64_t sub_229040D80()
{
  return MEMORY[0x270EE0FA8]();
}

uint64_t sub_229040D90()
{
  return MEMORY[0x270EE0FB0]();
}

uint64_t sub_229040DA0()
{
  return MEMORY[0x270EE1040]();
}

uint64_t sub_229040DB0()
{
  return MEMORY[0x270EE1050]();
}

uint64_t sub_229040DC0()
{
  return MEMORY[0x270EE1060]();
}

uint64_t sub_229040DD0()
{
  return MEMORY[0x270EE1068]();
}

uint64_t sub_229040DE0()
{
  return MEMORY[0x270EE1088]();
}

uint64_t sub_229040DF0()
{
  return MEMORY[0x270EE1098]();
}

uint64_t sub_229040E00()
{
  return MEMORY[0x270EE10E8]();
}

uint64_t sub_229040E10()
{
  return MEMORY[0x270EE10F0]();
}

uint64_t sub_229040E20()
{
  return MEMORY[0x270EE1100]();
}

uint64_t sub_229040E30()
{
  return MEMORY[0x270EE1118]();
}

uint64_t sub_229040E40()
{
  return MEMORY[0x270EE1120]();
}

uint64_t sub_229040E50()
{
  return MEMORY[0x270EE1128]();
}

uint64_t sub_229040E60()
{
  return MEMORY[0x270EE11C0]();
}

uint64_t sub_229040E70()
{
  return MEMORY[0x270EE11D8]();
}

uint64_t sub_229040E80()
{
  return MEMORY[0x270EE11E0]();
}

uint64_t sub_229040E90()
{
  return MEMORY[0x270EE11F8]();
}

uint64_t sub_229040EA0()
{
  return MEMORY[0x270EE1208]();
}

uint64_t sub_229040EC0()
{
  return MEMORY[0x270EE1250]();
}

uint64_t sub_229040ED0()
{
  return MEMORY[0x270EE1258]();
}

uint64_t sub_229040EE0()
{
  return MEMORY[0x270EE1270]();
}

uint64_t sub_229040EF0()
{
  return MEMORY[0x270EE12C8]();
}

uint64_t sub_229040F00()
{
  return MEMORY[0x270EE12D0]();
}

uint64_t sub_229040F10()
{
  return MEMORY[0x270EE1300]();
}

uint64_t sub_229040F20()
{
  return MEMORY[0x270EE1308]();
}

uint64_t sub_229040F30()
{
  return MEMORY[0x270EE1318]();
}

uint64_t sub_229040F40()
{
  return MEMORY[0x270EE1338]();
}

uint64_t sub_229040F50()
{
  return MEMORY[0x270EE1348]();
}

uint64_t sub_229040F60()
{
  return MEMORY[0x270EE13C8]();
}

uint64_t sub_229040F70()
{
  return MEMORY[0x270EE1410]();
}

uint64_t sub_229040F80()
{
  return MEMORY[0x270EE1420]();
}

uint64_t sub_229040F90()
{
  return MEMORY[0x270EE1428]();
}

uint64_t sub_229040FA0()
{
  return MEMORY[0x270EE1438]();
}

uint64_t sub_229040FB0()
{
  return MEMORY[0x270EE1450]();
}

uint64_t sub_229040FC0()
{
  return MEMORY[0x270EE1458]();
}

uint64_t sub_229040FD0()
{
  return MEMORY[0x270EE1480]();
}

uint64_t sub_229040FE0()
{
  return MEMORY[0x270EE1488]();
}

uint64_t sub_229040FF0()
{
  return MEMORY[0x270EE1498]();
}

uint64_t sub_229041000()
{
  return MEMORY[0x270EE14A8]();
}

uint64_t sub_229041010()
{
  return MEMORY[0x270EE14C8]();
}

uint64_t sub_229041020()
{
  return MEMORY[0x270EE14D8]();
}

uint64_t sub_229041030()
{
  return MEMORY[0x270EE14E0]();
}

uint64_t sub_229041040()
{
  return MEMORY[0x270EE14F8]();
}

uint64_t sub_229041050()
{
  return MEMORY[0x270EE1500]();
}

uint64_t sub_229041060()
{
  return MEMORY[0x270EE1510]();
}

uint64_t sub_229041070()
{
  return MEMORY[0x270EE1518]();
}

uint64_t sub_229041080()
{
  return MEMORY[0x270EE1520]();
}

uint64_t sub_229041090()
{
  return MEMORY[0x270EE1530]();
}

uint64_t sub_2290410A0()
{
  return MEMORY[0x270EE1570]();
}

uint64_t sub_2290410B0()
{
  return MEMORY[0x270EE1588]();
}

uint64_t sub_2290410C0()
{
  return MEMORY[0x270EE15A0]();
}

uint64_t sub_2290410D0()
{
  return MEMORY[0x270EE15C0]();
}

uint64_t sub_2290410E0()
{
  return MEMORY[0x270EE16A0]();
}

uint64_t sub_2290410F0()
{
  return MEMORY[0x270EE16B0]();
}

uint64_t sub_229041100()
{
  return MEMORY[0x270EE1710]();
}

uint64_t sub_229041110()
{
  return MEMORY[0x270EE1718]();
}

uint64_t sub_229041120()
{
  return MEMORY[0x270EE1720]();
}

uint64_t sub_229041130()
{
  return MEMORY[0x270EE1748]();
}

uint64_t sub_229041140()
{
  return MEMORY[0x270EE1750]();
}

uint64_t sub_229041160()
{
  return MEMORY[0x270EE18A0]();
}

uint64_t sub_229041170()
{
  return MEMORY[0x270F07E88]();
}

uint64_t sub_229041180()
{
  return MEMORY[0x270EE1918]();
}

uint64_t sub_229041190()
{
  return MEMORY[0x270EE1920]();
}

uint64_t sub_2290411A0()
{
  return MEMORY[0x270EE1930]();
}

uint64_t sub_2290411B0()
{
  return MEMORY[0x270EE1938]();
}

uint64_t sub_2290411C0()
{
  return MEMORY[0x270EE1958]();
}

uint64_t sub_2290411D0()
{
  return MEMORY[0x270EE1968]();
}

uint64_t sub_2290411F0()
{
  return MEMORY[0x270EE1980]();
}

uint64_t sub_229041200()
{
  return MEMORY[0x270EE19D0]();
}

uint64_t sub_229041210()
{
  return MEMORY[0x270EE19E0]();
}

uint64_t sub_229041220()
{
  return MEMORY[0x270EE19E8]();
}

uint64_t sub_229041240()
{
  return MEMORY[0x270EE1A20]();
}

uint64_t sub_229041250()
{
  return MEMORY[0x270EE1A40]();
}

uint64_t sub_229041260()
{
  return MEMORY[0x270EE1A48]();
}

uint64_t sub_229041270()
{
  return MEMORY[0x270EE1A50]();
}

uint64_t sub_229041280()
{
  return MEMORY[0x270EE1A58]();
}

uint64_t sub_229041290()
{
  return MEMORY[0x270EE1AB0]();
}

uint64_t sub_2290412A0()
{
  return MEMORY[0x270EE1AB8]();
}

uint64_t sub_2290412B0()
{
  return MEMORY[0x270EE1AC0]();
}

uint64_t sub_2290412C0()
{
  return MEMORY[0x270EE1AD0]();
}

uint64_t sub_2290412D0()
{
  return MEMORY[0x270EE1B80]();
}

uint64_t sub_2290412F0()
{
  return MEMORY[0x270EE1C48]();
}

uint64_t sub_229041300()
{
  return MEMORY[0x270EE1C60]();
}

uint64_t sub_229041310()
{
  return MEMORY[0x270EE1C70]();
}

uint64_t sub_229041320()
{
  return MEMORY[0x270EE1C78]();
}

uint64_t sub_229041330()
{
  return MEMORY[0x270EE1C88]();
}

uint64_t sub_229041340()
{
  return MEMORY[0x270EE1C90]();
}

uint64_t sub_229041350()
{
  return MEMORY[0x270EE1CA0]();
}

uint64_t sub_229041360()
{
  return MEMORY[0x270EE1CB0]();
}

uint64_t sub_229041370()
{
  return MEMORY[0x270EE1CC0]();
}

uint64_t sub_229041380()
{
  return MEMORY[0x270EE1D78]();
}

uint64_t sub_229041390()
{
  return MEMORY[0x270EE1D88]();
}

uint64_t sub_2290413B0()
{
  return MEMORY[0x270EE1DD0]();
}

uint64_t sub_2290413C0()
{
  return MEMORY[0x270EE1DF0]();
}

uint64_t sub_2290413E0()
{
  return MEMORY[0x270EED980]();
}

uint64_t sub_2290413F0()
{
  return MEMORY[0x270EEDA00]();
}

uint64_t sub_229041400()
{
  return MEMORY[0x270EEDA90]();
}

uint64_t sub_229041410()
{
  return MEMORY[0x270EEDAA0]();
}

uint64_t sub_229041420()
{
  return MEMORY[0x270EEDDC0]();
}

uint64_t sub_229041430()
{
  return MEMORY[0x270EEDDD0]();
}

uint64_t sub_229041440()
{
  return MEMORY[0x270EEDE10]();
}

uint64_t sub_229041450()
{
  return MEMORY[0x270EEDE18]();
}

uint64_t sub_229041460()
{
  return MEMORY[0x270EEDED8]();
}

uint64_t sub_229041470()
{
  return MEMORY[0x270EEDEE8]();
}

uint64_t sub_229041480()
{
  return MEMORY[0x270EEDF30]();
}

uint64_t sub_229041490()
{
  return MEMORY[0x270EEDF38]();
}

uint64_t sub_2290414A0()
{
  return MEMORY[0x270EEF800]();
}

uint64_t sub_2290414B0()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_2290414C0()
{
  return MEMORY[0x270EEF868]();
}

uint64_t sub_2290414D0()
{
  return MEMORY[0x270EEF870]();
}

uint64_t sub_2290414E0()
{
  return MEMORY[0x270EEF8C0]();
}

uint64_t sub_2290414F0()
{
  return MEMORY[0x270EEF8C8]();
}

uint64_t sub_229041500()
{
  return MEMORY[0x270EEF8D8]();
}

uint64_t sub_229041510()
{
  return MEMORY[0x270EEFC58]();
}

uint64_t sub_229041520()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_229041530()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_229041540()
{
  return MEMORY[0x270EEFF00]();
}

uint64_t sub_229041550()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_229041560()
{
  return MEMORY[0x270EF0060]();
}

uint64_t sub_229041570()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_229041580()
{
  return MEMORY[0x270EF0130]();
}

uint64_t sub_229041590()
{
  return MEMORY[0x270EF0700]();
}

uint64_t sub_2290415A0()
{
  return MEMORY[0x270EF07A0]();
}

uint64_t sub_2290415B0()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_2290415C0()
{
  return MEMORY[0x270EF0B88]();
}

uint64_t sub_2290415D0()
{
  return MEMORY[0x270EF0BA8]();
}

uint64_t sub_2290415E0()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_2290415F0()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_229041600()
{
  return MEMORY[0x270EF0FA0]();
}

uint64_t sub_229041610()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_229041620()
{
  return MEMORY[0x270EF12C8]();
}

uint64_t sub_229041630()
{
  return MEMORY[0x270EF1350]();
}

uint64_t sub_229041640()
{
  return MEMORY[0x270EF1440]();
}

uint64_t sub_229041650()
{
  return MEMORY[0x270EF1570]();
}

uint64_t sub_229041660()
{
  return MEMORY[0x270EF1580]();
}

uint64_t sub_229041670()
{
  return MEMORY[0x270EF15C8]();
}

uint64_t sub_229041680()
{
  return MEMORY[0x270EF15E8]();
}

uint64_t sub_229041690()
{
  return MEMORY[0x270EF1600]();
}

uint64_t sub_2290416A0()
{
  return MEMORY[0x270EF1608]();
}

uint64_t sub_2290416B0()
{
  return MEMORY[0x270F28690]();
}

uint64_t sub_2290416C0()
{
  return MEMORY[0x270F149E0]();
}

uint64_t sub_2290416D0()
{
  return MEMORY[0x270F149E8]();
}

uint64_t sub_2290416E0()
{
  return MEMORY[0x270F149F0]();
}

uint64_t sub_2290416F0()
{
  return MEMORY[0x270F149F8]();
}

uint64_t _s12CalendarLink012TransferableA6EntityV2idSSvg_0()
{
  return MEMORY[0x270F14A00]();
}

uint64_t sub_229041710()
{
  return MEMORY[0x270F14A08]();
}

uint64_t sub_229041720()
{
  return MEMORY[0x270F14A10]();
}

uint64_t sub_229041730()
{
  return MEMORY[0x270F14A18]();
}

uint64_t sub_229041740()
{
  return MEMORY[0x270F14A20]();
}

uint64_t sub_229041750()
{
  return MEMORY[0x270F14A28]();
}

uint64_t sub_229041760()
{
  return MEMORY[0x270F14A30]();
}

uint64_t sub_229041770()
{
  return MEMORY[0x270F14A38]();
}

uint64_t sub_229041780()
{
  return MEMORY[0x270F14A40]();
}

uint64_t sub_229041790()
{
  return MEMORY[0x270F14A48]();
}

uint64_t sub_2290417A0()
{
  return MEMORY[0x270F14A50]();
}

uint64_t sub_2290417B0()
{
  return MEMORY[0x270F14A58]();
}

uint64_t sub_2290417C0()
{
  return MEMORY[0x270F14A60]();
}

uint64_t sub_2290417D0()
{
  return MEMORY[0x270F14A68]();
}

uint64_t sub_2290417E0()
{
  return MEMORY[0x270F14A70]();
}

uint64_t _s12CalendarLink23TransferableEventEntityV2idSSvg_0()
{
  return MEMORY[0x270F14A78]();
}

uint64_t sub_229041800()
{
  return MEMORY[0x270F14A80]();
}

uint64_t sub_229041810()
{
  return MEMORY[0x270F14A88]();
}

uint64_t sub_229041820()
{
  return MEMORY[0x270F14A90]();
}

uint64_t sub_229041830()
{
  return MEMORY[0x270F14A98]();
}

uint64_t sub_229041840()
{
  return MEMORY[0x270F14AA0]();
}

uint64_t sub_229041850()
{
  return MEMORY[0x270F14AA8]();
}

uint64_t sub_229041860()
{
  return MEMORY[0x270F14AB0]();
}

uint64_t sub_229041870()
{
  return MEMORY[0x270F14AB8]();
}

uint64_t sub_229041880()
{
  return MEMORY[0x270F14AC0]();
}

uint64_t sub_229041890()
{
  return MEMORY[0x270F14AC8]();
}

uint64_t sub_2290418A0()
{
  return MEMORY[0x270F14AD0]();
}

uint64_t sub_2290418B0()
{
  return MEMORY[0x270F14AD8]();
}

uint64_t sub_2290418C0()
{
  return MEMORY[0x270F14AE0]();
}

uint64_t sub_2290418D0()
{
  return MEMORY[0x270F14AE8]();
}

uint64_t sub_2290418E0()
{
  return MEMORY[0x270F14AF0]();
}

uint64_t sub_2290418F0()
{
  return MEMORY[0x270F14AF8]();
}

uint64_t sub_229041900()
{
  return MEMORY[0x270F14B00]();
}

uint64_t sub_229041910()
{
  return MEMORY[0x270F14B08]();
}

uint64_t sub_229041920()
{
  return MEMORY[0x270F14B10]();
}

uint64_t sub_229041930()
{
  return MEMORY[0x270F14B18]();
}

uint64_t sub_229041940()
{
  return MEMORY[0x270F14B20]();
}

uint64_t sub_229041950()
{
  return MEMORY[0x270F14B28]();
}

uint64_t sub_229041960()
{
  return MEMORY[0x270F14B30]();
}

uint64_t sub_229041970()
{
  return MEMORY[0x270F14B38]();
}

uint64_t sub_229041980()
{
  return MEMORY[0x270F14B40]();
}

uint64_t sub_229041990()
{
  return MEMORY[0x270F14B48]();
}

uint64_t sub_2290419A0()
{
  return MEMORY[0x270F14B50]();
}

uint64_t sub_2290419B0()
{
  return MEMORY[0x270F14B58]();
}

uint64_t sub_2290419C0()
{
  return MEMORY[0x270F14B60]();
}

uint64_t sub_2290419D0()
{
  return MEMORY[0x270F14B68]();
}

uint64_t sub_2290419E0()
{
  return MEMORY[0x270F14B70]();
}

uint64_t sub_2290419F0()
{
  return MEMORY[0x270F14B78]();
}

uint64_t sub_229041A00()
{
  return MEMORY[0x270F14B80]();
}

uint64_t sub_229041A10()
{
  return MEMORY[0x270F14B88]();
}

uint64_t sub_229041A20()
{
  return MEMORY[0x270F14B90]();
}

uint64_t sub_229041A30()
{
  return MEMORY[0x270F14B98]();
}

uint64_t sub_229041A40()
{
  return MEMORY[0x270F14BA0]();
}

uint64_t sub_229041A50()
{
  return MEMORY[0x270F14BA8]();
}

uint64_t sub_229041A60()
{
  return MEMORY[0x270F14BB0]();
}

uint64_t sub_229041A70()
{
  return MEMORY[0x270F14BB8]();
}

uint64_t sub_229041A80()
{
  return MEMORY[0x270F14BC0]();
}

uint64_t sub_229041A90()
{
  return MEMORY[0x270F14BC8]();
}

uint64_t sub_229041AA0()
{
  return MEMORY[0x270F14BD0]();
}

uint64_t sub_229041AB0()
{
  return MEMORY[0x270F14BD8]();
}

uint64_t sub_229041AC0()
{
  return MEMORY[0x270F14BE0]();
}

uint64_t sub_229041AD0()
{
  return MEMORY[0x270F14BE8]();
}

uint64_t sub_229041AE0()
{
  return MEMORY[0x270F14BF0]();
}

uint64_t sub_229041AF0()
{
  return MEMORY[0x270F14BF8]();
}

uint64_t sub_229041B00()
{
  return MEMORY[0x270F14C00]();
}

uint64_t sub_229041B10()
{
  return MEMORY[0x270F14C08]();
}

uint64_t sub_229041B20()
{
  return MEMORY[0x270F14C10]();
}

uint64_t sub_229041B30()
{
  return MEMORY[0x270F14C18]();
}

uint64_t sub_229041B40()
{
  return MEMORY[0x270F14C20]();
}

uint64_t sub_229041B50()
{
  return MEMORY[0x270F14C28]();
}

uint64_t sub_229041B60()
{
  return MEMORY[0x270F14C30]();
}

uint64_t sub_229041B70()
{
  return MEMORY[0x270F14C38]();
}

uint64_t sub_229041B80()
{
  return MEMORY[0x270F14C40]();
}

uint64_t sub_229041B90()
{
  return MEMORY[0x270F14C48]();
}

uint64_t sub_229041BA0()
{
  return MEMORY[0x270F14C50]();
}

uint64_t sub_229041BB0()
{
  return MEMORY[0x270F14C58]();
}

uint64_t sub_229041BC0()
{
  return MEMORY[0x270F14C60]();
}

uint64_t sub_229041BD0()
{
  return MEMORY[0x270F14C68]();
}

uint64_t sub_229041BE0()
{
  return MEMORY[0x270F14C70]();
}

uint64_t sub_229041BF0()
{
  return MEMORY[0x270F14C78]();
}

uint64_t sub_229041C00()
{
  return MEMORY[0x270F14C80]();
}

uint64_t sub_229041C10()
{
  return MEMORY[0x270F14C88]();
}

uint64_t sub_229041C20()
{
  return MEMORY[0x270F14C90]();
}

uint64_t sub_229041C30()
{
  return MEMORY[0x270F14C98]();
}

uint64_t sub_229041C40()
{
  return MEMORY[0x270F14CA0]();
}

uint64_t sub_229041C50()
{
  return MEMORY[0x270F14CA8]();
}

uint64_t sub_229041C60()
{
  return MEMORY[0x270F14CB0]();
}

uint64_t sub_229041C70()
{
  return MEMORY[0x270F14CB8]();
}

uint64_t _s12CalendarLink24TransferableSourceEntityV2idSSvg_0()
{
  return MEMORY[0x270F14CC0]();
}

uint64_t sub_229041C90()
{
  return MEMORY[0x270F14CC8]();
}

uint64_t sub_229041CA0()
{
  return MEMORY[0x270F14CD0]();
}

uint64_t sub_229041CB0()
{
  return MEMORY[0x270F14CD8]();
}

uint64_t sub_229041CC0()
{
  return MEMORY[0x270F14CE0]();
}

uint64_t sub_229041CD0()
{
  return MEMORY[0x270F14CE8]();
}

uint64_t sub_229041CE0()
{
  return MEMORY[0x270F14CF8]();
}

uint64_t sub_229041CF0()
{
  return MEMORY[0x270F14D00]();
}

uint64_t sub_229041D00()
{
  return MEMORY[0x270F14D08]();
}

uint64_t sub_229041D10()
{
  return MEMORY[0x270F14D10]();
}

uint64_t sub_229041D20()
{
  return MEMORY[0x270F14D18]();
}

uint64_t sub_229041D30()
{
  return MEMORY[0x270F14D20]();
}

uint64_t sub_229041D40()
{
  return MEMORY[0x270F14D28]();
}

uint64_t sub_229041D50()
{
  return MEMORY[0x270F14D30]();
}

uint64_t sub_229041D60()
{
  return MEMORY[0x270F14D38]();
}

uint64_t sub_229041D70()
{
  return MEMORY[0x270F14D40]();
}

uint64_t sub_229041D80()
{
  return MEMORY[0x270F14D48]();
}

uint64_t sub_229041D90()
{
  return MEMORY[0x270F14D50]();
}

uint64_t sub_229041DA0()
{
  return MEMORY[0x270F14D58]();
}

uint64_t sub_229041DB0()
{
  return MEMORY[0x270F14D60]();
}

uint64_t sub_229041DC0()
{
  return MEMORY[0x270F14D68]();
}

uint64_t sub_229041DD0()
{
  return MEMORY[0x270F14D70]();
}

uint64_t sub_229041DE0()
{
  return MEMORY[0x270F14D78]();
}

uint64_t sub_229041DF0()
{
  return MEMORY[0x270F14D80]();
}

uint64_t sub_229041E00()
{
  return MEMORY[0x270F14D88]();
}

uint64_t sub_229041E10()
{
  return MEMORY[0x270F14D90]();
}

uint64_t sub_229041E20()
{
  return MEMORY[0x270F14D98]();
}

uint64_t sub_229041E30()
{
  return MEMORY[0x270F14DA0]();
}

uint64_t sub_229041E40()
{
  return MEMORY[0x270F14DA8]();
}

uint64_t sub_229041E50()
{
  return MEMORY[0x270F14DB0]();
}

uint64_t sub_229041E60()
{
  return MEMORY[0x270F14DB8]();
}

uint64_t sub_229041E70()
{
  return MEMORY[0x270F14DC0]();
}

uint64_t sub_229041E80()
{
  return MEMORY[0x270F14DC8]();
}

uint64_t sub_229041E90()
{
  return MEMORY[0x270F14DD0]();
}

uint64_t sub_229041EA0()
{
  return MEMORY[0x270F14DD8]();
}

uint64_t sub_229041EB0()
{
  return MEMORY[0x270F14DE0]();
}

uint64_t sub_229041EC0()
{
  return MEMORY[0x270F14DE8]();
}

uint64_t sub_229041ED0()
{
  return MEMORY[0x270F14DF0]();
}

uint64_t sub_229041EE0()
{
  return MEMORY[0x270F14DF8]();
}

uint64_t sub_229041EF0()
{
  return MEMORY[0x270F14E00]();
}

uint64_t sub_229041F00()
{
  return MEMORY[0x270F14E08]();
}

uint64_t sub_229041F10()
{
  return MEMORY[0x270F14E10]();
}

uint64_t sub_229041F20()
{
  return MEMORY[0x270F14E18]();
}

uint64_t sub_229041F30()
{
  return MEMORY[0x270F14E20]();
}

uint64_t sub_229041F40()
{
  return MEMORY[0x270F14E28]();
}

uint64_t sub_229041F50()
{
  return MEMORY[0x270F14E30]();
}

uint64_t sub_229041F60()
{
  return MEMORY[0x270EE9F40]();
}

uint64_t sub_229041F70()
{
  return MEMORY[0x270F07E98]();
}

uint64_t sub_229041F80()
{
  return MEMORY[0x270F07EA8]();
}

uint64_t sub_229041F90()
{
  return MEMORY[0x270F0C7E8]();
}

uint64_t sub_229041FA0()
{
  return MEMORY[0x270F0C820]();
}

uint64_t sub_229041FB0()
{
  return MEMORY[0x270F0C830]();
}

uint64_t sub_229041FC0()
{
  return MEMORY[0x270F0C840]();
}

uint64_t sub_229041FD0()
{
  return MEMORY[0x270F0C858]();
}

uint64_t sub_229041FE0()
{
  return MEMORY[0x270F0C868]();
}

uint64_t sub_229041FF0()
{
  return MEMORY[0x270F0C870]();
}

uint64_t sub_229042000()
{
  return MEMORY[0x270F0C888]();
}

uint64_t sub_229042010()
{
  return MEMORY[0x270F0C898]();
}

uint64_t sub_229042020()
{
  return MEMORY[0x270F0C8A8]();
}

uint64_t _s12CalendarLink41LocationSearchResultsEntityRepresentationCfd_0()
{
  return MEMORY[0x270F0C8B0]();
}

uint64_t sub_229042040()
{
  return MEMORY[0x270F0C8C0]();
}

uint64_t sub_229042090()
{
  return MEMORY[0x270F0CA30]();
}

uint64_t sub_2290420A0()
{
  return MEMORY[0x270F0CAC8]();
}

uint64_t sub_2290420B0()
{
  return MEMORY[0x270F0CAD8]();
}

uint64_t sub_2290420C0()
{
  return MEMORY[0x270F0CAE8]();
}

uint64_t sub_2290420D0()
{
  return MEMORY[0x270F0CAF0]();
}

uint64_t sub_2290420E0()
{
  return MEMORY[0x270F0CB08]();
}

uint64_t sub_2290420F0()
{
  return MEMORY[0x270F0CB10]();
}

uint64_t sub_229042100()
{
  return MEMORY[0x270F0CB20]();
}

uint64_t sub_229042110()
{
  return MEMORY[0x270F0CB38]();
}

uint64_t sub_229042120()
{
  return MEMORY[0x270F0CB48]();
}

uint64_t sub_229042130()
{
  return MEMORY[0x270F0CB50]();
}

uint64_t sub_229042170()
{
  return MEMORY[0x270F14968]();
}

uint64_t sub_229042180()
{
  return MEMORY[0x270FA16A0]();
}

uint64_t sub_229042190()
{
  return MEMORY[0x270FA1938]();
}

uint64_t sub_2290421A0()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_2290421B0()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_2290421C0()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_2290421D0()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_2290421E0()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_2290421F0()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_229042200()
{
  return MEMORY[0x270EE1EF0]();
}

uint64_t sub_229042210()
{
  return MEMORY[0x270EF18D0]();
}

uint64_t sub_229042220()
{
  return MEMORY[0x270EF18F0]();
}

uint64_t sub_229042230()
{
  return MEMORY[0x270EF1908]();
}

uint64_t sub_229042240()
{
  return MEMORY[0x270EF1910]();
}

uint64_t sub_229042250()
{
  return MEMORY[0x270EF1918]();
}

uint64_t sub_229042260()
{
  return MEMORY[0x270EF1928]();
}

uint64_t sub_229042270()
{
  return MEMORY[0x270EF1938]();
}

uint64_t sub_229042280()
{
  return MEMORY[0x270EF1950]();
}

uint64_t sub_229042290()
{
  return MEMORY[0x270EF1958]();
}

uint64_t sub_2290422A0()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_2290422B0()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_2290422C0()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_2290422D0()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_2290422E0()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_2290422F0()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_229042300()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_229042310()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_229042320()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_229042330()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_229042340()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_229042350()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_229042360()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_229042370()
{
  return MEMORY[0x270EE1F10]();
}

uint64_t sub_229042380()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_229042390()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_2290423B0()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_2290423C0()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_2290423D0()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_2290423E0()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_2290423F0()
{
  return MEMORY[0x270FA1FB0]();
}

uint64_t sub_229042400()
{
  return MEMORY[0x270FA2080]();
}

uint64_t sub_229042410()
{
  return MEMORY[0x270EF1CC0]();
}

uint64_t sub_229042420()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_229042430()
{
  return MEMORY[0x270F9DF28]();
}

uint64_t sub_229042440()
{
  return MEMORY[0x270F9DF80]();
}

uint64_t sub_229042450()
{
  return MEMORY[0x270EF1CE0]();
}

uint64_t sub_229042460()
{
  return MEMORY[0x270EF1DB8]();
}

uint64_t sub_229042470()
{
  return MEMORY[0x270EEB658]();
}

uint64_t sub_229042480()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_229042490()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_2290424A0()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_2290424B0()
{
  return MEMORY[0x270EE1F30]();
}

uint64_t sub_2290424C0()
{
  return MEMORY[0x270EEB668]();
}

uint64_t sub_2290424D0()
{
  return MEMORY[0x270EEB670]();
}

uint64_t sub_2290424E0()
{
  return MEMORY[0x270F07EB8]();
}

uint64_t sub_2290424F0()
{
  return MEMORY[0x270F07EC0]();
}

uint64_t sub_229042500()
{
  return MEMORY[0x270F07EC8]();
}

uint64_t sub_229042510()
{
  return MEMORY[0x270FA1170]();
}

uint64_t sub_229042520()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_229042530()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_229042540()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_229042550()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_229042560()
{
  return MEMORY[0x270EF2518]();
}

uint64_t sub_229042570()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_229042590()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_2290425A0()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_2290425B0()
{
  return MEMORY[0x270F9E800]();
}

uint64_t sub_2290425C0()
{
  return MEMORY[0x270F9E810]();
}

uint64_t sub_2290425D0()
{
  return MEMORY[0x270F9E818]();
}

uint64_t sub_2290425E0()
{
  return MEMORY[0x270F9E820]();
}

uint64_t sub_2290425F0()
{
  return MEMORY[0x270F9E838]();
}

uint64_t sub_229042600()
{
  return MEMORY[0x270F9E840]();
}

uint64_t sub_229042610()
{
  return MEMORY[0x270F9E848]();
}

uint64_t sub_229042620()
{
  return MEMORY[0x270F9E858]();
}

uint64_t sub_229042630()
{
  return MEMORY[0x270F9E860]();
}

uint64_t sub_229042640()
{
  return MEMORY[0x270F9E870]();
}

uint64_t sub_229042650()
{
  return MEMORY[0x270F9E888]();
}

uint64_t sub_229042660()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_229042670()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_229042680()
{
  return MEMORY[0x270F9E968]();
}

uint64_t sub_229042690()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_2290426A0()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_2290426B0()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_2290426C0()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_2290426D0()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t sub_2290426E0()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_2290426F0()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_229042700()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_229042710()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_229042720()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_229042730()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_229042740()
{
  return MEMORY[0x270F9ED68]();
}

uint64_t sub_229042750()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_229042760()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_229042770()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_229042780()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_229042790()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_2290427A0()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_2290427B0()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_2290427C0()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_2290427D0()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_2290427E0()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_229042800()
{
  return MEMORY[0x270F9F730]();
}

uint64_t sub_229042810()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_229042830()
{
  return MEMORY[0x270F9FA68]();
}

uint64_t sub_229042840()
{
  return MEMORY[0x270F9FA88]();
}

uint64_t sub_229042850()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_229042860()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_229042870()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_229042880()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_229042890()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_2290428A0()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_2290428B0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_2290428C0()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_2290428D0()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_2290428E0()
{
  return MEMORY[0x270FA0128]();
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CA0](key, applicationID);
}

uint64_t CUIKCalendar()
{
  return MEMORY[0x270F14E40]();
}

uint64_t CUIKLongDayStringForDate()
{
  return MEMORY[0x270F14E68]();
}

uint64_t CUIKNewTimeProposerForNotification()
{
  return MEMORY[0x270F14E80]();
}

uint64_t CUIKStringForTime()
{
  return MEMORY[0x270F14E90]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
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

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
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

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
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

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x270FA2408]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x270FA0228]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x270FA0288]();
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

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x270FA03F0]();
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

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x270FA0458]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x270FA0460]();
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