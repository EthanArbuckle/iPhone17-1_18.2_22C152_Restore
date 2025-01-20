uint64_t AlarmConfirmation.init(snippetModel:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t (*v7)(char *, uint64_t, uint64_t);
  uint64_t vars8;

  sub_2478281B0();
  sub_24781B568(&qword_2692643C0, MEMORY[0x263F77980]);
  *a2 = sub_247827DF0();
  a2[1] = v4;
  v5 = (char *)a2 + *(int *)(type metadata accessor for AlarmConfirmation() + 20);
  v6 = sub_247827C40();
  v7 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32);

  return v7(v5, a1, v6);
}

uint64_t type metadata accessor for AlarmConfirmation()
{
  uint64_t result = qword_2692643D0;
  if (!qword_2692643D0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_24781AB38(void **a1)
{
  uint64_t v2 = sub_247827BA0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388]();
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *a1;
  if (*a1)
  {
    (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x263F752B8], v2);
    id v7 = v6;
    sub_247827B90();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    type metadata accessor for AlarmConfirmation();
    sub_247827C30();
    uint64_t v8 = sub_247827B70();
    swift_bridgeObjectRelease();
    sub_247820204(v8);
    swift_bridgeObjectRelease();
    sub_2478281A0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_2478281B0();
    sub_24781B568(&qword_2692643C0, MEMORY[0x263F77980]);
    sub_247827DE0();
    __break(1u);
  }
}

uint64_t sub_24781AD10@<X0>(void (*a1)(void)@<X1>, uint64_t a2@<X8>)
{
  type metadata accessor for AlarmConfirmation();
  a1();
  sub_24781C040();
  uint64_t result = sub_247827F40();
  *(void *)a2 = result;
  *(void *)(a2 + 8) = v5;
  *(unsigned char *)(a2 + 16) = v6 & 1;
  *(void *)(a2 + 24) = v7;
  return result;
}

uint64_t AlarmConfirmation.body.getter()
{
  uint64_t v1 = *(void *)(type metadata accessor for AlarmConfirmation() - 8);
  uint64_t v2 = *(void *)(v1 + 64);
  MEMORY[0x270FA5388]();
  sub_24781B498(v0, (uint64_t)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v3 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v4 = swift_allocObject();
  sub_24781B500((uint64_t)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0), v4 + v3);
  sub_2478280D0();
  sub_24781B568(&qword_2692643C8, MEMORY[0x263F77660]);
  return sub_2478280A0();
}

uint64_t sub_24781AED4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v45 = a2;
  uint64_t v3 = sub_247828060();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v6 = (char *)&v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *(void *)(type metadata accessor for AlarmConfirmation() - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  MEMORY[0x270FA5388]();
  uint64_t v9 = (char *)&v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692643F0);
  uint64_t v46 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388]();
  v12 = (char *)&v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692643F8);
  uint64_t v47 = *(void *)(v44 - 8);
  MEMORY[0x270FA5388]();
  v14 = (char *)&v32 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v36 = a1;
  sub_24781B498(a1, (uint64_t)v9);
  uint64_t v15 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v42 = ((v15 + 16) & ~v15) + v8;
  uint64_t v16 = (v15 + 16) & ~v15;
  uint64_t v43 = v16;
  uint64_t v41 = v15 | 7;
  uint64_t v17 = swift_allocObject();
  sub_24781B500((uint64_t)v9, v17 + v16);
  uint64_t v49 = a1;
  sub_247828040();
  uint64_t v18 = *MEMORY[0x263F774D0];
  uint64_t v19 = v4;
  v40 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 104);
  uint64_t v35 = v3;
  v40(v6, v18, v3);
  uint64_t v20 = sub_24781BE68(&qword_269264400, &qword_2692643F0);
  sub_247827F60();
  v21 = *(void (**)(char *, uint64_t))(v19 + 8);
  uint64_t v38 = v19 + 8;
  v39 = v21;
  v21(v6, v3);
  v22 = *(void (**)(char *, uint64_t))(v46 + 8);
  v46 += 8;
  v37 = v22;
  uint64_t v33 = v10;
  v22(v12, v10);
  uint64_t v53 = v10;
  uint64_t v54 = v20;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v23 = v44;
  uint64_t v24 = sub_247827F50();
  v25 = *(void (**)(char *, uint64_t))(v47 + 8);
  v47 += 8;
  v32 = v25;
  v25(v14, v23);
  uint64_t v55 = MEMORY[0x263F1B720];
  uint64_t v56 = MEMORY[0x263F774B0];
  uint64_t v53 = v24;
  uint64_t v26 = v36;
  sub_24781B498(v36, (uint64_t)v9);
  uint64_t v27 = swift_allocObject();
  sub_24781B500((uint64_t)v9, v27 + v43);
  uint64_t v48 = v26;
  sub_247828040();
  uint64_t v28 = v35;
  v40(v6, *MEMORY[0x263F774D8], v35);
  uint64_t v29 = v33;
  sub_247827F60();
  v39(v6, v28);
  v37(v12, v29);
  uint64_t v30 = sub_247827F50();
  v32(v14, v23);
  uint64_t v52 = MEMORY[0x263F774B0];
  uint64_t v51 = MEMORY[0x263F1B720];
  uint64_t v50 = v30;
  return sub_2478280C0();
}

uint64_t sub_24781B498(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AlarmConfirmation();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24781B500(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AlarmConfirmation();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24781B568(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_24781B5B0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24781B5D4()
{
  return sub_247827FD0();
}

uint64_t sub_24781B5F0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 - 8);
  uint64_t v3 = *(void *)(v2 + 64);
  MEMORY[0x270FA5388]();
  sub_24781B498(v1, (uint64_t)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v4 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v5 = swift_allocObject();
  sub_24781B500((uint64_t)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v5 + v4);
  sub_2478280D0();
  sub_24781B568(&qword_2692643C8, MEMORY[0x263F77660]);
  return sub_2478280A0();
}

char *initializeBufferWithCopyOfBuffer for AlarmConfirmation(char *a1, char **a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  unint64_t v4 = *a2;
  *(void *)a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v5 = &v4[(v3 + 16) & ~(unint64_t)v3];
    swift_retain();
  }
  else
  {
    uint64_t v5 = a1;
    *((void *)a1 + 1) = a2[1];
    uint64_t v6 = *(int *)(a3 + 20);
    uint64_t v7 = &a1[v6];
    uint64_t v8 = (uint64_t)a2 + v6;
    uint64_t v9 = sub_247827C40();
    uint64_t v10 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 16);
    uint64_t v11 = v4;
    v10(v7, v8, v9);
  }
  return v5;
}

uint64_t destroy for AlarmConfirmation(id *a1, uint64_t a2)
{
  unint64_t v4 = (char *)a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_247827C40();
  uint64_t v6 = *(uint64_t (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8);

  return v6(v4, v5);
}

void *initializeWithCopy for AlarmConfirmation(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_247827C40();
  uint64_t v10 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 16);
  id v11 = v5;
  v10(v7, v8, v9);
  return a1;
}

uint64_t assignWithCopy for AlarmConfirmation(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void **)a1;
  uint64_t v7 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  id v8 = v7;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  uint64_t v9 = *(int *)(a3 + 20);
  uint64_t v10 = a1 + v9;
  uint64_t v11 = a2 + v9;
  uint64_t v12 = sub_247827C40();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 24))(v10, v11, v12);
  return a1;
}

_OWORD *initializeWithTake for AlarmConfirmation(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_247827C40();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

uint64_t assignWithTake for AlarmConfirmation(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6 = *(void **)a1;
  *(void *)a1 = *a2;

  *(void *)(a1 + 8) = a2[1];
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_247827C40();
  (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for AlarmConfirmation(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24781BAE0);
}

uint64_t sub_24781BAE0(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 2147483646)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    int v5 = v4 - 1;
    if (v5 < 0) {
      int v5 = -1;
    }
    return (v5 + 1);
  }
  else
  {
    uint64_t v9 = sub_247827C40();
    uint64_t v10 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 48);
    uint64_t v11 = v9;
    uint64_t v12 = (char *)a1 + *(int *)(a3 + 20);
    return v10(v12, a2, v11);
  }
}

uint64_t storeEnumTagSinglePayload for AlarmConfirmation(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24781BBB0);
}

void *sub_24781BBB0(void *result, uint64_t a2, int a3, uint64_t a4)
{
  int v5 = result;
  if (a3 == 2147483646)
  {
    *uint64_t result = a2;
  }
  else
  {
    uint64_t v7 = sub_247827C40();
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 20);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_24781BC58()
{
  uint64_t result = sub_247827C40();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_24781BCF0()
{
  return sub_24781BE68(&qword_2692643E0, &qword_2692643E8);
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

uint64_t sub_24781BD78@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(type metadata accessor for AlarmConfirmation() - 8);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));

  return sub_24781AED4(v4, a1);
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

void sub_24781BE30()
{
}

uint64_t sub_24781BE38@<X0>(uint64_t a1@<X8>)
{
  return sub_24781AD10(MEMORY[0x263F751E8], a1);
}

uint64_t sub_24781BE68(unint64_t *a1, uint64_t *a2)
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

uint64_t objectdestroyTm()
{
  uint64_t v1 = (int *)(type metadata accessor for AlarmConfirmation() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v3 + *(void *)(*(void *)v1 + 64);
  uint64_t v5 = v2 | 7;
  uint64_t v6 = v0 + v3;

  uint64_t v7 = v6 + v1[7];
  uint64_t v8 = sub_247827C40();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);

  return MEMORY[0x270FA0238](v0, v4, v5);
}

void sub_24781BFA4()
{
}

void sub_24781BFAC()
{
  uint64_t v1 = *(void *)(type metadata accessor for AlarmConfirmation() - 8);
  sub_24781AB38((void **)(v0
                        + ((*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80))));
}

uint64_t sub_24781C010@<X0>(uint64_t a1@<X8>)
{
  return sub_24781AD10(MEMORY[0x263F751E0], a1);
}

unint64_t sub_24781C040()
{
  unint64_t result = qword_269264408;
  if (!qword_269264408)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269264408);
  }
  return result;
}

uint64_t sub_24781C094()
{
  uint64_t v0 = sub_247827D90();
  __swift_allocate_value_buffer(v0, qword_269264410);
  __swift_project_value_buffer(v0, (uint64_t)qword_269264410);
  return sub_247827D80();
}

uint64_t AlarmSelector.init(snippetModel:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  sub_2478281B0();
  sub_24781F690(&qword_2692643C0, MEMORY[0x263F77980]);
  *a2 = sub_247827DF0();
  a2[1] = v4;
  uint64_t v5 = (char *)a2 + *(int *)(type metadata accessor for AlarmSelector(0) + 20);
  uint64_t v6 = sub_247827C20();
  uint64_t v7 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32);

  return v7(v5, a1, v6);
}

uint64_t type metadata accessor for AlarmSelector(uint64_t a1)
{
  return sub_24781E7F8(a1, (uint64_t *)&unk_269264478);
}

uint64_t AlarmSelector.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v45 = a1;
  uint64_t v1 = sub_247828180();
  uint64_t v43 = *(void *)(v1 - 8);
  uint64_t v44 = v1;
  MEMORY[0x270FA5388](v1);
  uint64_t v42 = (char *)v37 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_247827DA0();
  uint64_t v40 = *(void *)(v3 - 8);
  uint64_t v41 = v3;
  MEMORY[0x270FA5388](v3);
  v39 = (char *)v37 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269264428);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (void *)((char *)v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v8 = type metadata accessor for AlarmSelector(0);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269264430);
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  v14 = (char *)v37 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_269264438);
  uint64_t v15 = *(void *)(v38 - 8);
  MEMORY[0x270FA5388](v38);
  uint64_t v17 = (char *)v37 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v37[0] = __swift_instantiateConcreteTypeFromMangledName(&qword_269264440);
  MEMORY[0x270FA5388](v37[0]);
  uint64_t v19 = (char *)v37 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24781C9D0(v37[1], (uint64_t)v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v20 = (*(unsigned __int8 *)(v9 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  uint64_t v21 = swift_allocObject();
  sub_24781CA38((uint64_t)v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v21 + v20);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269264448);
  sub_24781BE68(&qword_269264450, &qword_269264448);
  sub_2478280A0();
  *uint64_t v7 = sub_247828000();
  uint64_t v22 = *MEMORY[0x263F775F0];
  uint64_t v23 = sub_2478280B0();
  uint64_t v24 = *(void *)(v23 - 8);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v24 + 104))(v7, v22, v23);
  (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v24 + 56))(v7, 0, 1, v23);
  uint64_t v25 = sub_24781BE68(&qword_269264458, &qword_269264430);
  MEMORY[0x24C560530](v7, v11, v25);
  sub_24781D9B0((uint64_t)v7, &qword_269264428);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v28 = v39;
  uint64_t v27 = v40;
  uint64_t v29 = v41;
  (*(void (**)(char *, void, uint64_t))(v40 + 104))(v39, *MEMORY[0x263F184F8], v41);
  uint64_t v30 = (uint64_t *)&v19[*(int *)(v37[0] + 36)];
  uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_269264460);
  (*(void (**)(char *, char *, uint64_t))(v27 + 16))((char *)v30 + *(int *)(v31 + 28), v28, v29);
  *uint64_t v30 = KeyPath;
  uint64_t v32 = v38;
  (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v19, v17, v38);
  (*(void (**)(char *, uint64_t))(v27 + 8))(v28, v29);
  (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v32);
  v34 = v42;
  uint64_t v33 = v43;
  uint64_t v35 = v44;
  (*(void (**)(char *, void, uint64_t))(v43 + 104))(v42, *MEMORY[0x263F778F0], v44);
  sub_24781D8B0();
  sub_247827FA0();
  (*(void (**)(char *, uint64_t))(v33 + 8))(v34, v35);
  return sub_24781D9B0((uint64_t)v19, &qword_269264440);
}

uint64_t sub_24781C818(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for AlarmSelector(0);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = sub_247828120();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v6 = sub_247827C10();
  uint64_t v15 = MEMORY[0x263F8D310];
  uint64_t v16 = MEMORY[0x263F77998];
  uint64_t v13 = v6;
  uint64_t v14 = v7;
  uint64_t v12 = 0;
  memset(v11, 0, sizeof(v11));
  sub_247828110();
  sub_24781C9D0(a1, (uint64_t)v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v8 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v9 = swift_allocObject();
  sub_24781CA38((uint64_t)v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v9 + v8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692644C0);
  sub_24781F5BC();
  return sub_2478280E0();
}

uint64_t sub_24781C9D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AlarmSelector(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24781CA38(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AlarmSelector(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24781CA9C()
{
  return sub_24781F538(sub_24781C818);
}

uint64_t sub_24781CAB4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for AlarmSelector(0);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  MEMORY[0x270FA5388](v2 - 8);
  v10[3] = sub_247827C00();
  sub_24781C9D0(a1, (uint64_t)v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v5 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v6 = swift_allocObject();
  sub_24781CA38((uint64_t)v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v6 + v5);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692644D8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692644E0);
  sub_24781BE68(&qword_2692644E8, &qword_2692644D8);
  uint64_t v7 = type metadata accessor for AlarmItemView(255);
  uint64_t v8 = sub_24781F690(&qword_2692644D0, (void (*)(uint64_t))type metadata accessor for AlarmItemView);
  v10[1] = v7;
  v10[2] = v8;
  swift_getOpaqueTypeConformance2();
  sub_24781F690(&qword_2692644F0, MEMORY[0x263F75200]);
  return sub_247828050();
}

uint64_t sub_24781CCD8@<X0>(uint64_t a1@<X0>, void **a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v51 = a3;
  uint64_t v52 = a2;
  uint64_t v48 = *(void *)(type metadata accessor for AlarmSelector(0) - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v49 = v4;
  uint64_t v50 = (uint64_t)&v34 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2478279C0();
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v46 = (char *)&v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_247827B10();
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v45 = (char *)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_247827AF0();
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v42 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_247827AD0();
  ((void (*)(void))MEMORY[0x270FA5388])();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692644F8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v9 = (char *)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269264500);
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v11 = (char *)&v34 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_247827D60();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v41 = (char *)&v34 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v39 = v15;
  MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)&v34 - v16;
  uint64_t v18 = type metadata accessor for AlarmItemView(0);
  MEMORY[0x270FA5388](v18);
  unint64_t v20 = (char *)&v34 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692644E0);
  uint64_t v43 = *(void *)(v21 - 8);
  uint64_t v44 = v21;
  MEMORY[0x270FA5388](v21);
  uint64_t v40 = (char *)&v34 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v37 = *(void (**)(char *, uint64_t, uint64_t))(v13 + 16);
  uint64_t v38 = v17;
  uint64_t v47 = a1;
  v37(v17, a1, v12);
  uint64_t v23 = *v52;
  if (*v52)
  {
    uint64_t v36 = v18;
    v34 = &v20[*(int *)(v18 + 24)];
    id v35 = v23;
    sub_247827A10();
    uint64_t v24 = sub_247827A20();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v11, 0, 1, v24);
    sub_2478279F0();
    uint64_t v25 = sub_247827A00();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v25 - 8) + 56))(v9, 0, 1, v25);
    sub_247827AC0();
    sub_247827AE0();
    sub_247827B00();
    sub_2478279B0();
    sub_247827A40();
    uint64_t v26 = *(void (**)(char *, char *, uint64_t))(v13 + 32);
    v26(v20, v38, v12);
    *(void *)&v20[*(int *)(v36 + 20)] = v35;
    uint64_t v27 = v41;
    v37(v41, v47, v12);
    uint64_t v28 = v50;
    sub_24781C9D0((uint64_t)v52, v50);
    unint64_t v29 = (*(unsigned __int8 *)(v13 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
    unint64_t v30 = (v39 + *(unsigned __int8 *)(v48 + 80) + v29) & ~(unint64_t)*(unsigned __int8 *)(v48 + 80);
    uint64_t v31 = swift_allocObject();
    v26((char *)(v31 + v29), v27, v12);
    sub_24781CA38(v28, v31 + v30);
    sub_24781F690(&qword_2692644D0, (void (*)(uint64_t))type metadata accessor for AlarmItemView);
    uint64_t v32 = v40;
    sub_247827F80();
    swift_release();
    sub_24781F9A0((uint64_t)v20);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v43 + 32))(v51, v32, v44);
  }
  else
  {
    sub_2478281B0();
    sub_24781F690(&qword_2692643C0, MEMORY[0x263F77980]);
    uint64_t result = sub_247827DE0();
    __break(1u);
  }
  return result;
}

void sub_24781D388(uint64_t a1, void **a2)
{
  uint64_t v4 = sub_247827BA0();
  uint64_t v27 = *(void *)(v4 - 8);
  uint64_t v28 = v4;
  MEMORY[0x270FA5388]();
  uint64_t v26 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_247827D60();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2692643B0 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_247827D90();
  __swift_project_value_buffer(v10, (uint64_t)qword_269264410);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a1, v6);
  uint64_t v11 = sub_247827D70();
  os_log_type_t v12 = sub_2478281F0();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    uint64_t v30 = v14;
    uint64_t v24 = a2;
    uint64_t v25 = a1;
    *(_DWORD *)uint64_t v13 = 136315138;
    uint64_t v15 = sub_247827D10();
    uint64_t v29 = sub_24781FA34(v15, v16, &v30);
    a2 = v24;
    sub_247828200();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    _os_log_impl(&dword_247819000, v11, v12, "[AlarmItem send directInvocation: %s", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C560A90](v14, -1, -1);
    MEMORY[0x24C560A90](v13, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }

  uint64_t v17 = *a2;
  if (*a2)
  {
    uint64_t v18 = v26;
    uint64_t v19 = v27;
    uint64_t v20 = v28;
    (*(void (**)(char *, void, uint64_t))(v27 + 104))(v26, *MEMORY[0x263F752C0], v28);
    id v21 = v17;
    sub_247827B90();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v18, v20);
    sub_247827D10();
    sub_247827CC0();
    uint64_t v22 = sub_247827B80();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_247820204(v22);
    swift_bridgeObjectRelease();
    sub_2478281A0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_2478281B0();
    sub_24781F690(&qword_2692643C0, MEMORY[0x263F77980]);
    sub_247827DE0();
    __break(1u);
  }
}

uint64_t sub_24781D79C()
{
  return sub_247827E00();
}

uint64_t sub_24781D7C0()
{
  return sub_247827E00();
}

uint64_t sub_24781D7E4(uint64_t a1)
{
  uint64_t v2 = sub_247827DA0();
  MEMORY[0x270FA5388](v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_247827E10();
}

unint64_t sub_24781D8B0()
{
  unint64_t result = qword_269264468;
  if (!qword_269264468)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269264440);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269264430);
    sub_24781BE68(&qword_269264458, &qword_269264430);
    swift_getOpaqueTypeConformance2();
    sub_24781BE68(&qword_269264470, &qword_269264460);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269264468);
  }
  return result;
}

uint64_t sub_24781D9B0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_24781DA0C()
{
  return swift_getOpaqueTypeConformance2();
}

char *initializeBufferWithCopyOfBuffer for AlarmSelector(char *a1, char **a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v4 = *a2;
  *(void *)a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v5 = &v4[(v3 + 16) & ~(unint64_t)v3];
    swift_retain();
  }
  else
  {
    uint64_t v5 = a1;
    *((void *)a1 + 1) = a2[1];
    uint64_t v6 = *(int *)(a3 + 20);
    uint64_t v7 = &a1[v6];
    uint64_t v8 = (uint64_t)a2 + v6;
    uint64_t v9 = sub_247827C20();
    uint64_t v10 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 16);
    uint64_t v11 = v4;
    v10(v7, v8, v9);
  }
  return v5;
}

uint64_t destroy for AlarmSelector(id *a1, uint64_t a2)
{
  uint64_t v4 = (char *)a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_247827C20();
  uint64_t v6 = *(uint64_t (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8);

  return v6(v4, v5);
}

void *initializeWithCopy for AlarmSelector(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_247827C20();
  uint64_t v10 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 16);
  id v11 = v5;
  v10(v7, v8, v9);
  return a1;
}

uint64_t assignWithCopy for AlarmSelector(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void **)a1;
  uint64_t v7 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  id v8 = v7;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  uint64_t v9 = *(int *)(a3 + 20);
  uint64_t v10 = a1 + v9;
  uint64_t v11 = a2 + v9;
  uint64_t v12 = sub_247827C20();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 24))(v10, v11, v12);
  return a1;
}

_OWORD *initializeWithTake for AlarmSelector(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_247827C20();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

uint64_t assignWithTake for AlarmSelector(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6 = *(void **)a1;
  *(void *)a1 = *a2;

  *(void *)(a1 + 8) = a2[1];
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_247827C20();
  (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for AlarmSelector(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24781DDDC);
}

uint64_t sub_24781DDDC(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 2147483646)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    int v5 = v4 - 1;
    if (v5 < 0) {
      int v5 = -1;
    }
    return (v5 + 1);
  }
  else
  {
    uint64_t v9 = sub_247827C20();
    uint64_t v10 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 48);
    uint64_t v11 = v9;
    uint64_t v12 = (char *)a1 + *(int *)(a3 + 20);
    return v10(v12, a2, v11);
  }
}

uint64_t storeEnumTagSinglePayload for AlarmSelector(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24781DEAC);
}

void *sub_24781DEAC(void *result, uint64_t a2, int a3, uint64_t a4)
{
  int v5 = result;
  if (a3 == 2147483646)
  {
    *unint64_t result = a2;
  }
  else
  {
    uint64_t v7 = sub_247827C20();
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 20);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_24781DF54()
{
  uint64_t result = sub_247827C20();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_24781DFEC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t *sub_24781E048(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v16 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v16 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_247827D60();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = *(int *)(a3 + 24);
    uint64_t v10 = *(void **)((char *)a2 + v8);
    *(uint64_t *)((char *)a1 + v8) = (uint64_t)v10;
    uint64_t v11 = (char *)a1 + v9;
    uint64_t v12 = (char *)a2 + v9;
    uint64_t v13 = sub_247827A50();
    uint64_t v14 = *(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 16);
    id v15 = v10;
    v14(v11, v12, v13);
  }
  return a1;
}

uint64_t sub_24781E170(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_247827D60();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);

  uint64_t v5 = a1 + *(int *)(a2 + 24);
  uint64_t v6 = sub_247827A50();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);

  return v7(v5, v6);
}

uint64_t sub_24781E224(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_247827D60();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = *(void **)(a2 + v7);
  *(void *)(a1 + v7) = v9;
  uint64_t v10 = a1 + v8;
  uint64_t v11 = a2 + v8;
  uint64_t v12 = sub_247827A50();
  uint64_t v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 16);
  id v14 = v9;
  v13(v10, v11, v12);
  return a1;
}

uint64_t sub_24781E2FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_247827D60();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(void **)(a2 + v7);
  uint64_t v9 = *(void **)(a1 + v7);
  *(void *)(a1 + v7) = v8;
  id v10 = v8;

  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = sub_247827A50();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 24))(v12, v13, v14);
  return a1;
}

uint64_t sub_24781E3CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_247827D60();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 24);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_247827A50();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  return a1;
}

uint64_t sub_24781E48C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_247827D60();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(void **)(a1 + v7);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);

  uint64_t v9 = *(int *)(a3 + 24);
  uint64_t v10 = a1 + v9;
  uint64_t v11 = a2 + v9;
  uint64_t v12 = sub_247827A50();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 40))(v10, v11, v12);
  return a1;
}

uint64_t sub_24781E558(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24781E56C);
}

uint64_t sub_24781E56C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_247827D60();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else if (a2 == 0x7FFFFFFF)
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20));
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
  else
  {
    uint64_t v11 = sub_247827A50();
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 48);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a3 + 24);
    return v12(v14, a2, v13);
  }
}

uint64_t sub_24781E698(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24781E6AC);
}

uint64_t sub_24781E6AC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_247827D60();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else if (a3 == 0x7FFFFFFF)
  {
    *(void *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  }
  else
  {
    uint64_t v11 = sub_247827A50();
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a4 + 24);
    return v12(v14, a2, a2, v13);
  }
  return result;
}

uint64_t type metadata accessor for AlarmItemView(uint64_t a1)
{
  return sub_24781E7F8(a1, (uint64_t *)&unk_269264488);
}

uint64_t sub_24781E7F8(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24781E830()
{
  uint64_t result = sub_247827D60();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_247827A50();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t sub_24781E904()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24781E920@<X0>(uint64_t a1@<X8>)
{
  uint64_t v39 = a1;
  uint64_t v52 = sub_2478278D0();
  uint64_t v50 = *(void *)(v52 - 8);
  MEMORY[0x270FA5388](v52);
  uint64_t v48 = (char *)&v37 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_269264498);
  uint64_t v51 = *(void *)(v49 - 8);
  MEMORY[0x270FA5388](v49);
  uint64_t v45 = (char *)&v37 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692644A0);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v42 = v3;
  uint64_t v43 = v4;
  MEMORY[0x270FA5388](v3);
  uint64_t v41 = (char *)&v37 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_247827980();
  uint64_t v46 = *(void *)(v6 - 8);
  uint64_t v47 = v6;
  uint64_t v7 = MEMORY[0x270FA5388](v6);
  uint64_t v44 = (char *)&v37 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v40 = (char *)&v37 - v9;
  uint64_t v38 = sub_247827AA0();
  uint64_t v37 = *(void *)(v38 - 8);
  MEMORY[0x270FA5388](v38);
  uint64_t v11 = (char *)&v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_247827AD0();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  id v15 = (char *)&v37 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_247827A80();
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  uint64_t v20 = (char *)&v37 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  uint64_t v22 = (char *)&v37 - v21;
  type metadata accessor for AlarmItemView(0);
  sub_247827A30();
  sub_247827D40();
  sub_247827A70();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  uint64_t v23 = *(void (**)(char *, uint64_t))(v17 + 8);
  v23(v20, v16);
  sub_247827D50();
  sub_247827A60();
  (*(void (**)(char *, uint64_t))(v37 + 8))(v11, v38);
  v23(v22, v16);
  uint64_t KeyPath = swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v57 = sub_247828010();
  sub_24781F2B4();
  sub_247827910();
  uint64_t v55 = swift_getKeyPath();
  swift_getKeyPath();
  sub_247827E60();
  sub_247827EA0();
  uint64_t v24 = sub_247827ED0();
  swift_release();
  uint64_t v57 = v24;
  sub_24781F348();
  sub_247827910();
  uint64_t v54 = swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v25 = v41;
  sub_247827950();
  swift_release();
  uint64_t v57 = sub_247827EC0();
  uint64_t v26 = v40;
  uint64_t v27 = v42;
  sub_247827960();
  swift_release();
  (*(void (**)(char *, uint64_t))(v43 + 8))(v25, v27);
  uint64_t v53 = swift_getKeyPath();
  swift_getKeyPath();
  sub_24781F3BC();
  uint64_t v28 = v45;
  sub_247827950();
  swift_release();
  uint64_t v29 = v50;
  uint64_t v30 = v48;
  uint64_t v31 = v52;
  (*(void (**)(char *, void, uint64_t))(v50 + 104))(v48, *MEMORY[0x263F065A0], v52);
  uint64_t v32 = v44;
  uint64_t v33 = v49;
  sub_247827960();
  (*(void (**)(char *, uint64_t))(v29 + 8))(v30, v31);
  (*(void (**)(char *, uint64_t))(v51 + 8))(v28, v33);
  sub_247827920();
  uint64_t v34 = v47;
  id v35 = *(void (**)(char *, uint64_t))(v46 + 8);
  v35(v32, v47);
  return ((uint64_t (*)(char *, uint64_t))v35)(v26, v34);
}

uint64_t sub_24781F014@<X0>(uint64_t a1@<X8>)
{
  v31[1] = a1;
  uint64_t v1 = sub_247827930();
  MEMORY[0x270FA5388](v1 - 8);
  sub_24781E920((uint64_t)v31 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v3 = sub_247827F30();
  uint64_t v5 = v4;
  char v7 = v6;
  uint64_t v9 = v8;
  uint64_t v49 = MEMORY[0x263F1A830];
  uint64_t v50 = MEMORY[0x263F77348];
  uint64_t v10 = swift_allocObject();
  uint64_t v48 = v10;
  *(void *)(v10 + 16) = v3;
  *(void *)(v10 + 24) = v5;
  *(unsigned char *)(v10 + 32) = v7 & 1;
  *(void *)(v10 + 40) = v9;
  uint64_t v47 = 0;
  long long v45 = 0u;
  long long v46 = 0u;
  uint64_t v41 = sub_247827D20();
  uint64_t v42 = v11;
  sub_24781C040();
  uint64_t v12 = sub_247827F40();
  uint64_t v14 = v13;
  char v16 = v15 & 1;
  sub_247827EE0();
  uint64_t v17 = sub_247827F20();
  uint64_t v19 = v18;
  char v21 = v20;
  swift_release();
  sub_24781F29C(v12, v14, v16);
  swift_bridgeObjectRelease();
  sub_247828010();
  uint64_t v22 = sub_247827F10();
  uint64_t v24 = v23;
  char v26 = v25;
  uint64_t v28 = v27;
  swift_release();
  sub_24781F29C(v17, v19, v21 & 1);
  swift_bridgeObjectRelease();
  uint64_t v43 = MEMORY[0x263F1A830];
  uint64_t v44 = MEMORY[0x263F77348];
  uint64_t v29 = swift_allocObject();
  uint64_t v41 = v29;
  *(void *)(v29 + 16) = v22;
  *(void *)(v29 + 24) = v24;
  *(unsigned char *)(v29 + 32) = v26 & 1;
  *(void *)(v29 + 40) = v28;
  uint64_t v40 = 0;
  long long v38 = 0u;
  long long v39 = 0u;
  uint64_t v37 = 0;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v34 = 0;
  long long v32 = 0u;
  long long v33 = 0u;
  return sub_247828130();
}

uint64_t sub_24781F258()
{
  sub_24781F29C(*(void *)(v0 + 16), *(void *)(v0 + 24), *(unsigned char *)(v0 + 32));
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_24781F29C(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

unint64_t sub_24781F2B4()
{
  unint64_t result = qword_2692644A8;
  if (!qword_2692644A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692644A8);
  }
  return result;
}

uint64_t sub_24781F30C()
{
  return 8;
}

uint64_t sub_24781F318()
{
  return swift_release();
}

uint64_t sub_24781F320(void *a1, void *a2)
{
  *a2 = *a1;
  return swift_retain();
}

void *sub_24781F334(void *result, void *a2)
{
  *a2 = *result;
  return result;
}

unint64_t sub_24781F348()
{
  unint64_t result = qword_2692644B0;
  if (!qword_2692644B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692644B0);
  }
  return result;
}

uint64_t sub_24781F3A0()
{
  return 8;
}

unint64_t sub_24781F3BC()
{
  unint64_t result = qword_2692644B8;
  if (!qword_2692644B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692644B8);
  }
  return result;
}

uint64_t sub_24781F414()
{
  return 8;
}

uint64_t objectdestroyTm_0()
{
  uint64_t v1 = (int *)(type metadata accessor for AlarmSelector(0) - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v3 + *(void *)(*(void *)v1 + 64);
  uint64_t v5 = v2 | 7;
  uint64_t v6 = v0 + v3;

  uint64_t v7 = v6 + v1[7];
  uint64_t v8 = sub_247827C20();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);

  return MEMORY[0x270FA0238](v0, v4, v5);
}

uint64_t sub_24781F520()
{
  return sub_24781F538(sub_24781CAB4);
}

uint64_t sub_24781F538(uint64_t (*a1)(uint64_t))
{
  uint64_t v2 = *(void *)(type metadata accessor for AlarmSelector(0) - 8);
  uint64_t v3 = v1 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));

  return a1(v3);
}

unint64_t sub_24781F5BC()
{
  unint64_t result = qword_2692644C8;
  if (!qword_2692644C8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2692644C0);
    type metadata accessor for AlarmItemView(255);
    sub_24781F690(&qword_2692644D0, (void (*)(uint64_t))type metadata accessor for AlarmItemView);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692644C8);
  }
  return result;
}

uint64_t sub_24781F690(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_24781F6DC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(type metadata accessor for AlarmSelector(0) - 8);
  uint64_t v6 = (void **)(v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80)));

  return sub_24781CCD8(a1, v6, a2);
}

uint64_t sub_24781F75C()
{
  uint64_t v1 = sub_247827D60();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = *(void *)(v2 + 64);
  uint64_t v6 = (int *)(type metadata accessor for AlarmSelector(0) - 8);
  uint64_t v7 = *(unsigned __int8 *)(*(void *)v6 + 80);
  uint64_t v8 = (v4 + v5 + v7) & ~v7;
  uint64_t v9 = v8 + *(void *)(*(void *)v6 + 64);
  uint64_t v10 = v3 | v7 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  uint64_t v11 = v0 + v8 + v6[7];
  uint64_t v12 = sub_247827C20();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8))(v11, v12);

  return MEMORY[0x270FA0238](v0, v9, v10);
}

void sub_24781F8D4()
{
  uint64_t v1 = *(void *)(sub_247827D60() - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = *(void *)(v1 + 64);
  uint64_t v4 = *(void *)(type metadata accessor for AlarmSelector(0) - 8);
  uint64_t v5 = (void **)(v0 + ((v2 + v3 + *(unsigned __int8 *)(v4 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80)));

  sub_24781D388(v0 + v2, v5);
}

uint64_t sub_24781F9A0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for AlarmItemView(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_24781FA34(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_24781FB08(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_2478200DC((uint64_t)v12, *a3);
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
      sub_2478200DC((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_24781FB08(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_247828210();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_24781FCC4(a5, a6);
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
  uint64_t v8 = sub_247828250();
  if (!v8)
  {
    sub_247828260();
    __break(1u);
LABEL_17:
    uint64_t result = sub_247828280();
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

uint64_t sub_24781FCC4(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_24781FD5C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_24781FF3C(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_24781FF3C(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_24781FD5C(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_24781FED4(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_247828240();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_247828260();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_2478281E0();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_247828280();
    __break(1u);
LABEL_14:
    uint64_t result = sub_247828260();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_24781FED4(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_269264508);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_24781FF3C(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_269264508);
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
  uint64_t result = sub_247828280();
  __break(1u);
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

uint64_t sub_2478200DC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
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

uint64_t sub_2478201A0()
{
  return sub_24781F690(&qword_269264510, MEMORY[0x263F77850]);
}

uint64_t sub_247820204(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269264690);
    uint64_t v2 = sub_247828270();
  }
  else
  {
    uint64_t v2 = MEMORY[0x263F8EE80];
  }
  uint64_t v28 = a1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v27 = (unint64_t)(63 - v3) >> 6;
  uint64_t v6 = v2 + 64;
  swift_bridgeObjectRetain();
  uint64_t result = swift_retain();
  int64_t v8 = 0;
  while (1)
  {
    if (v5)
    {
      unint64_t v11 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      unint64_t v12 = v11 | (v8 << 6);
      goto LABEL_28;
    }
    int64_t v13 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v13 >= v27) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v28 + 8 * v13);
    int64_t v15 = v8 + 1;
    if (!v14)
    {
      int64_t v15 = v8 + 2;
      if (v8 + 2 >= v27) {
        goto LABEL_37;
      }
      unint64_t v14 = *(void *)(v28 + 8 * v15);
      if (!v14)
      {
        int64_t v15 = v8 + 3;
        if (v8 + 3 >= v27) {
          goto LABEL_37;
        }
        unint64_t v14 = *(void *)(v28 + 8 * v15);
        if (!v14)
        {
          int64_t v15 = v8 + 4;
          if (v8 + 4 >= v27) {
            goto LABEL_37;
          }
          unint64_t v14 = *(void *)(v28 + 8 * v15);
          if (!v14) {
            break;
          }
        }
      }
    }
LABEL_27:
    unint64_t v5 = (v14 - 1) & v14;
    unint64_t v12 = __clz(__rbit64(v14)) + (v15 << 6);
    int64_t v8 = v15;
LABEL_28:
    uint64_t v17 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v12);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    sub_2478200DC(*(void *)(a1 + 56) + 32 * v12, (uint64_t)v40);
    *(void *)&long long v39 = v19;
    *((void *)&v39 + 1) = v18;
    void v37[2] = v39;
    v38[0] = v40[0];
    v38[1] = v40[1];
    *(void *)&v37[0] = v19;
    *((void *)&v37[0] + 1) = v18;
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    sub_2478274F8(v38, v32);
    long long v33 = v29;
    long long v34 = v30;
    uint64_t v35 = v31;
    sub_2478274F8(v32, v36);
    long long v29 = v33;
    long long v30 = v34;
    uint64_t v31 = v35;
    sub_2478274F8(v36, v37);
    sub_2478274F8(v37, &v33);
    uint64_t result = sub_247828230();
    uint64_t v20 = -1 << *(unsigned char *)(v2 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)(v6 + 8 * (v21 >> 6))) != 0)
    {
      unint64_t v9 = __clz(__rbit64((-1 << v21) & ~*(void *)(v6 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
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
        uint64_t v26 = *(void *)(v6 + 8 * v22);
      }
      while (v26 == -1);
      unint64_t v9 = __clz(__rbit64(~v26)) + (v22 << 6);
    }
    *(void *)(v6 + ((v9 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v9;
    uint64_t v10 = *(void *)(v2 + 48) + 40 * v9;
    *(_OWORD *)uint64_t v10 = v29;
    *(_OWORD *)(v10 + 16) = v30;
    *(void *)(v10 + 32) = v31;
    uint64_t result = (uint64_t)sub_2478274F8(&v33, (_OWORD *)(*(void *)(v2 + 56) + 32 * v9));
    ++*(void *)(v2 + 16);
  }
  int64_t v16 = v8 + 5;
  if (v8 + 5 >= v27)
  {
LABEL_37:
    swift_release();
    sub_247827508();
    return v2;
  }
  unint64_t v14 = *(void *)(v28 + 8 * v16);
  if (v14)
  {
    int64_t v15 = v8 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v15 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v15 >= v27) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v28 + 8 * v15);
    ++v16;
    if (v14) {
      goto LABEL_27;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_2478205CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_247820690(a1, a2, a3, &qword_269264670);
}

uint64_t sub_2478205D8(uint64_t a1, uint64_t a2)
{
  return keypath_hashTm(a1, a2, &qword_269264670);
}

void sub_2478205E4()
{
}

void sub_24782060C()
{
}

uint64_t sub_247820628(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_247820690(a1, a2, a3, &qword_269264668);
}

uint64_t sub_247820634(uint64_t a1, uint64_t a2)
{
  return keypath_hashTm(a1, a2, &qword_269264668);
}

void sub_247820640()
{
}

void sub_247820668()
{
}

uint64_t sub_247820684(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_247820690(a1, a2, a3, &qword_269264660);
}

uint64_t sub_247820690(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  return sub_2478281D0() & 1;
}

uint64_t sub_2478206E8(uint64_t a1, uint64_t a2)
{
  return keypath_hashTm(a1, a2, &qword_269264660);
}

uint64_t keypath_hashTm(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return sub_2478281C0();
}

void sub_247820738()
{
}

void sub_247820760()
{
}

uint64_t sub_24782077C()
{
  uint64_t v0 = sub_247827D90();
  __swift_allocate_value_buffer(v0, qword_269264518);
  __swift_project_value_buffer(v0, (uint64_t)qword_269264518);
  return sub_247827D80();
}

uint64_t AlarmSnippet.init(snippetModel:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  sub_2478281B0();
  sub_247821168(&qword_2692643C0, MEMORY[0x263F77980]);
  *a2 = sub_247827DF0();
  a2[1] = v4;
  unint64_t v5 = (char *)a2 + *(int *)(type metadata accessor for AlarmSnippet(0) + 20);
  uint64_t v6 = sub_247827BD0();
  int64_t v7 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32);

  return v7(v5, a1, v6);
}

uint64_t type metadata accessor for AlarmSnippet(uint64_t a1)
{
  return sub_24781E7F8(a1, (uint64_t *)&unk_2692645A8);
}

uint64_t AlarmSnippet.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v37 = a1;
  uint64_t v1 = sub_247827DA0();
  uint64_t v35 = *(void *)(v1 - 8);
  uint64_t v36 = v1;
  MEMORY[0x270FA5388](v1);
  long long v34 = (char *)&v32 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269264428);
  MEMORY[0x270FA5388](v3 - 8);
  unint64_t v5 = (uint64_t *)((char *)&v32 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v6 = type metadata accessor for AlarmSnippet(0);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269264530);
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  unint64_t v12 = (char *)&v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_269264538);
  uint64_t v13 = *(void *)(v33 - 8);
  MEMORY[0x270FA5388](v33);
  int64_t v15 = (char *)&v32 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_247826DF0(v32, (uint64_t)&v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for AlarmSnippet);
  unint64_t v16 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v17 = swift_allocObject();
  sub_247826E70((uint64_t)&v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v17 + v16, type metadata accessor for AlarmSnippet);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269264540);
  sub_247821018();
  sub_2478280A0();
  uint64_t *v5 = sub_247828000();
  uint64_t v18 = *MEMORY[0x263F775F0];
  uint64_t v19 = sub_2478280B0();
  uint64_t v20 = *(void *)(v19 - 8);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v20 + 104))(v5, v18, v19);
  (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v20 + 56))(v5, 0, 1, v19);
  uint64_t v21 = sub_24781BE68(&qword_269264570, &qword_269264530);
  MEMORY[0x24C560530](v5, v9, v21);
  sub_24781D9B0((uint64_t)v5, &qword_269264428);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  uint64_t KeyPath = swift_getKeyPath();
  unint64_t v24 = v34;
  uint64_t v23 = v35;
  uint64_t v25 = v36;
  (*(void (**)(char *, void, uint64_t))(v35 + 104))(v34, *MEMORY[0x263F184F8], v36);
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_269264578);
  uint64_t v27 = v37;
  uint64_t v28 = (uint64_t *)(v37 + *(int *)(v26 + 36));
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_269264460);
  (*(void (**)(char *, char *, uint64_t))(v23 + 16))((char *)v28 + *(int *)(v29 + 28), v24, v25);
  *uint64_t v28 = KeyPath;
  uint64_t v30 = v33;
  (*(void (**)(uint64_t, char *, uint64_t))(v13 + 16))(v27, v15, v33);
  (*(void (**)(char *, uint64_t))(v23 + 8))(v24, v25);
  return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v30);
}

uint64_t sub_247820DC4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for AlarmSnippet(0);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  MEMORY[0x270FA5388](v2 - 8);
  v8[1] = sub_247827BC0();
  sub_247826DF0(a1, (uint64_t)v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for AlarmSnippet);
  unint64_t v5 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v6 = swift_allocObject();
  sub_247826E70((uint64_t)v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v6 + v5, type metadata accessor for AlarmSnippet);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692646A0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269264558);
  sub_24781BE68(&qword_2692646A8, &qword_2692646A0);
  sub_24782108C();
  sub_247821168(&qword_2692646B0, MEMORY[0x263F751F0]);
  return sub_247828050();
}

uint64_t sub_247820FA8()
{
  uint64_t v1 = *(void *)(type metadata accessor for AlarmSnippet(0) - 8);
  uint64_t v2 = v0 + ((*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));

  return sub_247820DC4(v2);
}

unint64_t sub_247821018()
{
  unint64_t result = qword_269264548;
  if (!qword_269264548)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269264540);
    sub_24782108C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269264548);
  }
  return result;
}

unint64_t sub_24782108C()
{
  unint64_t result = qword_269264550;
  if (!qword_269264550)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269264558);
    sub_247821168(&qword_269264560, (void (*)(uint64_t))type metadata accessor for SleepAlarmView);
    sub_247821168(&qword_269264568, (void (*)(uint64_t))type metadata accessor for AlarmView);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269264550);
  }
  return result;
}

uint64_t sub_247821168(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t type metadata accessor for SleepAlarmView(uint64_t a1)
{
  return sub_24781E7F8(a1, (uint64_t *)&unk_2692645E0);
}

uint64_t type metadata accessor for AlarmView(uint64_t a1)
{
  return sub_24781E7F8(a1, (uint64_t *)&unk_2692645D0);
}

uint64_t sub_2478211F8@<X0>(char *a1@<X0>, void **a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v65 = a3;
  uint64_t v66 = type metadata accessor for AlarmView(0);
  uint64_t v5 = MEMORY[0x270FA5388](v66);
  uint64_t v56 = (char *)v54 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v57 = (char *)v54 - v7;
  uint64_t v63 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692646B8);
  MEMORY[0x270FA5388](v63);
  uint64_t v64 = (uint64_t)v54 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_2478279C0();
  MEMORY[0x270FA5388](v9 - 8);
  v62 = (char *)v54 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_247827B10();
  MEMORY[0x270FA5388](v11 - 8);
  v61 = (char *)v54 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_247827AF0();
  MEMORY[0x270FA5388](v13 - 8);
  v59 = (char *)v54 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_247827AD0();
  MEMORY[0x270FA5388](v15 - 8);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692644F8);
  MEMORY[0x270FA5388](v16 - 8);
  uint64_t v18 = (char *)v54 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_269264500);
  MEMORY[0x270FA5388](v19 - 8);
  uint64_t v21 = (char *)v54 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v68 = sub_247827D00();
  uint64_t v22 = *(void *)(v68 - 8);
  uint64_t v23 = MEMORY[0x270FA5388](v68);
  uint64_t v25 = (char *)v54 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v23);
  uint64_t v27 = (char *)v54 - v26;
  uint64_t v67 = type metadata accessor for SleepAlarmView(0);
  uint64_t v28 = MEMORY[0x270FA5388](v67);
  uint64_t v30 = (char *)v54 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v28);
  uint64_t v32 = (char *)v54 - v31;
  char v33 = sub_247827C60();
  uint64_t v60 = v22;
  long long v34 = *(void (**)(char *, char *, uint64_t))(v22 + 16);
  v58 = v34;
  if (v33)
  {
    v34(v27, a1, v68);
    uint64_t v35 = *a2;
    if (*a2)
    {
      uint64_t v56 = &v30[*(int *)(v67 + 28)];
      uint64_t v57 = v35;
      sub_247827A10();
      uint64_t v36 = sub_247827A20();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v36 - 8) + 56))(v21, 0, 1, v36);
      sub_2478279F0();
      uint64_t v37 = sub_247827A00();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v37 - 8) + 56))(v18, 0, 1, v37);
      sub_247827AC0();
      sub_247827AE0();
      sub_247827B00();
      sub_2478279B0();
      sub_247827A40();
      uint64_t v38 = v68;
      v58(v30, v27, v68);
      uint64_t v39 = v67;
      *(void *)&v30[*(int *)(v67 + 20)] = v57;
      char v40 = sub_247827CE0();
      (*(void (**)(char *, uint64_t))(v60 + 8))(v27, v38);
      uint64_t v41 = &v30[*(int *)(v39 + 24)];
      *uint64_t v41 = v40 & 1;
      *((void *)v41 + 1) = 0;
      sub_247826E70((uint64_t)v30, (uint64_t)v32, type metadata accessor for SleepAlarmView);
      sub_247826DF0((uint64_t)v32, v64, type metadata accessor for SleepAlarmView);
      swift_storeEnumTagMultiPayload();
      sub_247821168(&qword_269264560, (void (*)(uint64_t))type metadata accessor for SleepAlarmView);
      sub_247821168(&qword_269264568, (void (*)(uint64_t))type metadata accessor for AlarmView);
      sub_247827E30();
      uint64_t v42 = type metadata accessor for SleepAlarmView;
      uint64_t v43 = (uint64_t)v32;
      return sub_2478276DC(v43, v42);
    }
  }
  else
  {
    v34(v25, a1, v68);
    uint64_t v44 = *a2;
    if (*a2)
    {
      uint64_t v45 = v66;
      uint64_t v46 = (uint64_t)v56;
      v54[1] = &v56[*(int *)(v66 + 28)];
      id v55 = v44;
      sub_247827A10();
      uint64_t v47 = sub_247827A20();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v47 - 8) + 56))(v21, 0, 1, v47);
      sub_2478279F0();
      uint64_t v48 = sub_247827A00();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v48 - 8) + 56))(v18, 0, 1, v48);
      sub_247827AC0();
      sub_247827AE0();
      sub_247827B00();
      sub_2478279B0();
      sub_247827A40();
      uint64_t v49 = v68;
      v58((char *)v46, v25, v68);
      *(void *)(v46 + *(int *)(v45 + 20)) = v55;
      char v50 = sub_247827CE0();
      (*(void (**)(char *, uint64_t))(v60 + 8))(v25, v49);
      uint64_t v51 = v46 + *(int *)(v45 + 24);
      *(unsigned char *)uint64_t v51 = v50 & 1;
      *(void *)(v51 + 8) = 0;
      uint64_t v52 = (uint64_t)v57;
      sub_247826E70(v46, (uint64_t)v57, type metadata accessor for AlarmView);
      sub_247826DF0(v52, v64, type metadata accessor for AlarmView);
      swift_storeEnumTagMultiPayload();
      sub_247821168(&qword_269264560, (void (*)(uint64_t))type metadata accessor for SleepAlarmView);
      sub_247821168(&qword_269264568, (void (*)(uint64_t))type metadata accessor for AlarmView);
      sub_247827E30();
      uint64_t v42 = type metadata accessor for AlarmView;
      uint64_t v43 = v52;
      return sub_2478276DC(v43, v42);
    }
  }
  sub_2478281B0();
  sub_247821168(&qword_2692643C0, MEMORY[0x263F77980]);
  uint64_t result = sub_247827DE0();
  __break(1u);
  return result;
}

uint64_t sub_247821B10@<X0>(uint64_t a1@<X8>)
{
  uint64_t v53 = a1;
  uint64_t v2 = sub_2478278D0();
  uint64_t v62 = *(void *)(v2 - 8);
  uint64_t v63 = v2;
  MEMORY[0x270FA5388](v2);
  v61 = (char *)&v49 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269264498);
  uint64_t v59 = *(void *)(v4 - 8);
  uint64_t v60 = v4;
  MEMORY[0x270FA5388](v4);
  v58 = (char *)&v49 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269264658);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v54 = (char *)&v49 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_247827980();
  uint64_t v56 = *(void *)(v8 - 8);
  uint64_t v57 = v8;
  uint64_t v9 = MEMORY[0x270FA5388](v8);
  id v55 = (char *)&v49 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v64 = (char *)&v49 - v11;
  uint64_t v12 = sub_247827AA0();
  uint64_t v51 = *(void *)(v12 - 8);
  uint64_t v52 = v12;
  MEMORY[0x270FA5388](v12);
  uint64_t v14 = (char *)&v49 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_247827AD0();
  uint64_t v16 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15);
  uint64_t v18 = (char *)&v49 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_247827A80();
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v21 = MEMORY[0x270FA5388](v19);
  uint64_t v23 = (char *)&v49 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v21);
  uint64_t v25 = (char *)&v49 - v24;
  uint64_t v50 = type metadata accessor for AlarmView(0);
  sub_247827A30();
  sub_247827CD0();
  sub_247827A70();
  (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
  uint64_t v26 = *(void (**)(char *, uint64_t))(v20 + 8);
  v26(v23, v19);
  sub_247827CF0();
  sub_247827A60();
  (*(void (**)(char *, uint64_t))(v51 + 8))(v14, v52);
  v26(v25, v19);
  sub_247827970();
  uint64_t KeyPath = swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v27 = (char *)(v1 + *(int *)(v50 + 24));
  char v28 = *v27;
  uint64_t v29 = *((void *)v27 + 1);
  LOBYTE(v66) = v28;
  uint64_t v67 = v29;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269264628);
  sub_247828020();
  if (v68 == 1) {
    uint64_t v30 = sub_247828010();
  }
  else {
    uint64_t v30 = sub_247827FF0();
  }
  uint64_t v66 = v30;
  sub_24781F2B4();
  sub_247827910();
  uint64_t v31 = swift_getKeyPath();
  *(&v49 - 2) = MEMORY[0x270FA5388](v31);
  swift_getKeyPath();
  uint64_t v32 = sub_247827E80();
  char v33 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v32 - 8) + 56);
  uint64_t v34 = (uint64_t)v54;
  v33(v54, 1, 1, v32);
  sub_247827EB0();
  sub_24781D9B0(v34, &qword_269264658);
  sub_247827E90();
  uint64_t v35 = sub_247827ED0();
  swift_release();
  uint64_t v66 = v35;
  sub_24781F348();
  sub_247827910();
  uint64_t v36 = swift_getKeyPath();
  *(&v49 - 2) = MEMORY[0x270FA5388](v36);
  swift_getKeyPath();
  v33((char *)v34, 1, 1, v32);
  sub_247827EB0();
  sub_24781D9B0(v34, &qword_269264658);
  sub_247827EA0();
  uint64_t v37 = sub_247827ED0();
  swift_release();
  uint64_t v66 = v37;
  uint64_t v38 = v64;
  sub_247827940();
  uint64_t v39 = swift_getKeyPath();
  *(&v49 - 2) = MEMORY[0x270FA5388](v39);
  swift_getKeyPath();
  sub_24781F3BC();
  char v40 = v58;
  sub_247827950();
  swift_release();
  uint64_t v42 = v61;
  uint64_t v41 = v62;
  uint64_t v43 = v63;
  (*(void (**)(char *, void, uint64_t))(v62 + 104))(v61, *MEMORY[0x263F065A0], v63);
  uint64_t v44 = v55;
  uint64_t v45 = v60;
  sub_247827960();
  (*(void (**)(char *, uint64_t))(v41 + 8))(v42, v43);
  (*(void (**)(char *, uint64_t))(v59 + 8))(v40, v45);
  sub_247827920();
  uint64_t v46 = v57;
  uint64_t v47 = *(void (**)(char *, uint64_t))(v56 + 8);
  v47(v44, v57);
  return ((uint64_t (*)(char *, uint64_t))v47)(v38, v46);
}

uint64_t sub_2478222DC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v68 = a1;
  uint64_t v3 = type metadata accessor for AlarmView(0);
  uint64_t v4 = v3 - 8;
  uint64_t v56 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v57 = v5;
  uint64_t v67 = (uint64_t)&v51 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_247827930();
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (uint64_t)&v51 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v64 = sub_247828170();
  uint64_t v59 = *(void *)(v64 - 8);
  MEMORY[0x270FA5388](v64);
  v58 = (char *)&v51 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v66 = __swift_instantiateConcreteTypeFromMangledName(&qword_269264678);
  uint64_t v65 = *(void *)(v66 - 8);
  MEMORY[0x270FA5388](v66);
  uint64_t v63 = (char *)&v51 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_269264680);
  uint64_t v61 = *(void *)(v62 - 8);
  MEMORY[0x270FA5388](v62);
  uint64_t v60 = (char *)&v51 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = (unsigned __int8 *)(v2 + *(int *)(v4 + 32));
  LODWORD(v69) = *v12;
  uint64_t v13 = *((void *)v12 + 1);
  LOBYTE(v80) = v69;
  uint64_t v81 = v13;
  uint64_t v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_269264628);
  sub_247828030();
  uint64_t v54 = v84;
  uint64_t v53 = v85;
  int v52 = v86;
  sub_247821B10(v8);
  uint64_t v14 = sub_247827F30();
  uint64_t v16 = v15;
  LOBYTE(v8) = v17;
  uint64_t v19 = v18;
  uint64_t v87 = MEMORY[0x263F1A830];
  uint64_t v88 = MEMORY[0x263F77348];
  uint64_t v20 = swift_allocObject();
  uint64_t v84 = v20;
  *(void *)(v20 + 16) = v14;
  *(void *)(v20 + 24) = v16;
  *(unsigned char *)(v20 + 32) = v8 & 1;
  *(void *)(v20 + 40) = v19;
  uint64_t v70 = v2;
  uint64_t v80 = sub_247827C70();
  uint64_t v81 = v21;
  sub_24781C040();
  uint64_t v22 = sub_247827F40();
  uint64_t v24 = v23;
  LOBYTE(v2) = v25 & 1;
  sub_247827E70();
  uint64_t v26 = sub_247827F20();
  uint64_t v28 = v27;
  char v30 = v29;
  swift_release();
  sub_24781F29C(v22, v24, v2);
  swift_bridgeObjectRelease();
  LOBYTE(v80) = v69;
  uint64_t v55 = v13;
  uint64_t v81 = v13;
  sub_247828020();
  if (v77 == 1) {
    sub_247828010();
  }
  else {
    sub_247827FF0();
  }
  char v31 = v30 & 1;
  uint64_t v32 = sub_247827F10();
  uint64_t v34 = v33;
  char v36 = v35;
  uint64_t v38 = v37;
  swift_release();
  sub_24781F29C(v26, v28, v31);
  swift_bridgeObjectRelease();
  uint64_t v82 = MEMORY[0x263F1A830];
  uint64_t v83 = MEMORY[0x263F77348];
  uint64_t v39 = swift_allocObject();
  uint64_t v80 = v39;
  *(void *)(v39 + 16) = v32;
  *(void *)(v39 + 24) = v34;
  *(unsigned char *)(v39 + 32) = v36 & 1;
  *(void *)(v39 + 40) = v38;
  uint64_t v79 = 0;
  long long v77 = 0u;
  long long v78 = 0u;
  uint64_t v76 = 0;
  long long v75 = 0u;
  long long v74 = 0u;
  uint64_t v73 = 0;
  long long v72 = 0u;
  long long v71 = 0u;
  char v40 = v58;
  sub_247828160();
  LOBYTE(v84) = v69;
  uint64_t v85 = v55;
  sub_247828020();
  LOBYTE(v84) = v80;
  uint64_t v41 = v67;
  sub_247826DF0(v70, v67, type metadata accessor for AlarmView);
  unint64_t v42 = (*(unsigned __int8 *)(v56 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v56 + 80);
  uint64_t v69 = v42 + v57;
  uint64_t v43 = swift_allocObject();
  sub_247826E70(v41, v43 + v42, type metadata accessor for AlarmView);
  uint64_t v44 = sub_247821168(&qword_269264688, MEMORY[0x263F778B8]);
  uint64_t v45 = v63;
  uint64_t v46 = v64;
  sub_247827FE0();
  swift_release();
  (*(void (**)(char *, uint64_t))(v59 + 8))(v40, v46);
  sub_247826DF0(v70, v41, type metadata accessor for AlarmView);
  uint64_t v47 = swift_allocObject();
  sub_247826E70(v41, v47 + v42, type metadata accessor for AlarmView);
  uint64_t v84 = v46;
  uint64_t v85 = MEMORY[0x263F8D4F8];
  uint64_t v86 = v44;
  uint64_t v87 = MEMORY[0x263F8D510];
  swift_getOpaqueTypeConformance2();
  uint64_t v48 = v60;
  uint64_t v49 = v66;
  sub_247827F80();
  swift_release();
  (*(void (**)(char *, uint64_t))(v65 + 8))(v45, v49);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v61 + 32))(v68, v48, v62);
}

uint64_t sub_247822A98(char a1)
{
  uint64_t v2 = sub_247827BA0();
  uint64_t v21 = *(void *)(v2 - 8);
  uint64_t v22 = v2;
  MEMORY[0x270FA5388](v2);
  uint64_t v20 = (char *)&v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_247827BF0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2692643B8 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_247827D90();
  __swift_project_value_buffer(v8, (uint64_t)qword_269264518);
  uint64_t v9 = sub_247827D70();
  os_log_type_t v10 = sub_2478281F0();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v11 = 67109120;
    int v23 = a1 & 1;
    sub_247828200();
    _os_log_impl(&dword_247819000, v9, v10, "[AlarmView.sendDirectInvocation]: %{BOOL}d", v11, 8u);
    MEMORY[0x24C560A90](v11, -1, -1);
  }

  uint64_t v12 = *(void (**)(char *, void, uint64_t))(v5 + 104);
  v12(v7, *MEMORY[0x263F751D0], v4);
  sub_247827BE0();
  uint64_t v13 = *(void (**)(char *, uint64_t))(v5 + 8);
  v13(v7, v4);
  if ((a1 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    v12(v7, *MEMORY[0x263F751D8], v4);
    sub_247827BE0();
    v13(v7, v4);
  }
  type metadata accessor for AlarmView(0);
  uint64_t v14 = v22;
  uint64_t v15 = v20;
  uint64_t v16 = v21;
  (*(void (**)(char *, void, uint64_t))(v21 + 104))(v20, *MEMORY[0x263F752C0], v22);
  sub_247827B90();
  (*(void (**)(char *, uint64_t))(v16 + 8))(v15, v14);
  sub_247827CC0();
  uint64_t v17 = sub_247827B80();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_247820204(v17);
  swift_bridgeObjectRelease();
  sub_2478281A0();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_247822E28()
{
  uint64_t v0 = sub_247827B30();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v20 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269264580);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_2478279E0();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  os_log_type_t v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2692643B8 != -1) {
    swift_once();
  }
  uint64_t v11 = sub_247827D90();
  __swift_project_value_buffer(v11, (uint64_t)qword_269264518);
  uint64_t v12 = sub_247827D70();
  os_log_type_t v13 = sub_2478281F0();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = (uint8_t *)swift_slowAlloc();
    uint64_t v21 = v8;
    uint64_t v15 = v1;
    uint64_t v16 = v0;
    uint64_t v17 = v14;
    *(_WORD *)uint64_t v14 = 0;
    _os_log_impl(&dword_247819000, v12, v13, "[AlarmView.onSnippetTapped]: Performing punchout", v14, 2u);
    uint64_t v18 = v17;
    uint64_t v0 = v16;
    uint64_t v1 = v15;
    uint64_t v8 = v21;
    MEMORY[0x24C560A90](v18, -1, -1);
  }

  sub_247827C80();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1) {
    return sub_24781D9B0((uint64_t)v6, &qword_269264580);
  }
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v10, v6, v7);
  type metadata accessor for AlarmView(0);
  sub_2478279D0();
  sub_247827B20();
  sub_247828190();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t sub_24782316C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v50 = a1;
  uint64_t v49 = sub_2478278D0();
  uint64_t v47 = *(void *)(v49 - 8);
  MEMORY[0x270FA5388](v49);
  uint64_t v45 = (char *)&v38 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_269264498);
  uint64_t v48 = *(void *)(v46 - 8);
  MEMORY[0x270FA5388](v46);
  unint64_t v42 = (char *)&v38 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269264658);
  MEMORY[0x270FA5388](v3 - 8);
  char v40 = (char *)&v38 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_247827980();
  uint64_t v43 = *(void *)(v5 - 8);
  uint64_t v44 = v5;
  uint64_t v6 = MEMORY[0x270FA5388](v5);
  uint64_t v41 = (char *)&v38 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v51 = (char *)&v38 - v8;
  uint64_t v39 = sub_247827AA0();
  uint64_t v38 = *(void *)(v39 - 8);
  MEMORY[0x270FA5388](v39);
  os_log_type_t v10 = (char *)&v38 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_247827AD0();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v38 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_247827A80();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  uint64_t v19 = (char *)&v38 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  uint64_t v21 = (char *)&v38 - v20;
  type metadata accessor for SleepAlarmView(0);
  sub_247827A30();
  sub_247827CD0();
  sub_247827A70();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  uint64_t v22 = *(void (**)(char *, uint64_t))(v16 + 8);
  v22(v19, v15);
  sub_247827CF0();
  sub_247827A60();
  (*(void (**)(char *, uint64_t))(v38 + 8))(v10, v39);
  v22(v21, v15);
  sub_247827970();
  uint64_t KeyPath = swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v56 = sub_247828010();
  sub_24781F2B4();
  sub_247827910();
  uint64_t v54 = swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v23 = sub_247827E80();
  uint64_t v24 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56);
  uint64_t v25 = (uint64_t)v40;
  v24(v40, 1, 1, v23);
  sub_247827EB0();
  sub_24781D9B0(v25, &qword_269264658);
  sub_247827E90();
  uint64_t v26 = sub_247827ED0();
  swift_release();
  uint64_t v56 = v26;
  sub_24781F348();
  sub_247827910();
  uint64_t v53 = swift_getKeyPath();
  swift_getKeyPath();
  v24((char *)v25, 1, 1, v23);
  sub_247827EB0();
  sub_24781D9B0(v25, &qword_269264658);
  sub_247827EA0();
  uint64_t v27 = sub_247827ED0();
  swift_release();
  uint64_t v56 = v27;
  uint64_t v28 = v51;
  sub_247827940();
  uint64_t v52 = swift_getKeyPath();
  swift_getKeyPath();
  sub_24781F3BC();
  char v29 = v42;
  sub_247827950();
  swift_release();
  uint64_t v30 = v47;
  char v31 = v45;
  uint64_t v32 = v49;
  (*(void (**)(char *, void, uint64_t))(v47 + 104))(v45, *MEMORY[0x263F065A0], v49);
  uint64_t v33 = v41;
  uint64_t v34 = v46;
  sub_247827960();
  (*(void (**)(char *, uint64_t))(v30 + 8))(v31, v32);
  (*(void (**)(char *, uint64_t))(v48 + 8))(v29, v34);
  sub_247827920();
  uint64_t v35 = v44;
  char v36 = *(void (**)(char *, uint64_t))(v43 + 8);
  v36(v33, v44);
  return ((uint64_t (*)(char *, uint64_t))v36)(v28, v35);
}

uint64_t sub_2478238B0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v73 = a1;
  uint64_t v71 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692645F0);
  MEMORY[0x270FA5388](v71);
  long long v72 = (char *)&v54 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = type metadata accessor for SleepAlarmView(0);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v61 = v3 - 8;
  uint64_t v62 = v4;
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v63 = v5;
  uint64_t v64 = (uint64_t)&v54 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692645F8);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v60 = (char *)&v54 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_269264600);
  MEMORY[0x270FA5388](v67);
  uint64_t v66 = (uint64_t)&v54 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269264608);
  uint64_t v69 = *(void *)(v9 - 8);
  uint64_t v70 = v9;
  uint64_t v10 = MEMORY[0x270FA5388](v9);
  uint64_t v65 = (char *)&v54 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v68 = (char *)&v54 - v12;
  uint64_t v59 = sub_247827B40();
  uint64_t v13 = *(void *)(v59 - 8);
  MEMORY[0x270FA5388](v59);
  uint64_t v15 = (char *)&v54 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_247827B60();
  MEMORY[0x270FA5388](v16 - 8);
  uint64_t v17 = sub_247828080();
  uint64_t v18 = *(void *)(v17 - 8);
  MEMORY[0x270FA5388](v17);
  uint64_t v20 = (char *)&v54 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_269264610);
  uint64_t v21 = *(void *)(v58 - 8);
  MEMORY[0x270FA5388](v58);
  uint64_t v23 = (char *)&v54 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_269264618);
  MEMORY[0x270FA5388](v24 - 8);
  uint64_t v26 = (char *)&v54 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v55 = v1;
  uint64_t v75 = sub_247827C50();
  unint64_t v76 = v27;
  sub_247827CD0();
  uint64_t v28 = sub_247827AD0();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v28 - 8) + 56))(v26, 0, 1, v28);
  sub_24781C040();
  uint64_t v56 = sub_247828220();
  uint64_t v57 = v29;
  sub_24781D9B0((uint64_t)v26, &qword_269264618);
  swift_bridgeObjectRelease();
  sub_247827B50();
  sub_247828090();
  uint64_t v30 = v59;
  (*(void (**)(char *, void, uint64_t))(v13 + 104))(v15, *MEMORY[0x263F76618], v59);
  uint64_t v31 = sub_247821168(&qword_269264620, MEMORY[0x263F77558]);
  sub_247827F70();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v30);
  (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v17);
  uint64_t v32 = (uint64_t)v60;
  uint64_t v75 = v17;
  unint64_t v76 = v31;
  swift_getOpaqueTypeConformance2();
  uint64_t v33 = v58;
  uint64_t v34 = sub_247827F50();
  (*(void (**)(char *, uint64_t))(v21 + 8))(v23, v33);
  uint64_t v35 = v55;
  uint64_t v36 = v55 + *(int *)(v61 + 32);
  char v37 = *(unsigned char *)v36;
  unint64_t v38 = *(void *)(v36 + 8);
  LOBYTE(v75) = v37;
  unint64_t v76 = v38;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269264628);
  sub_247828020();
  int v39 = v74;
  *(void *)uint64_t v32 = sub_247827E20();
  *(void *)(v32 + 8) = 0;
  *(unsigned char *)(v32 + 16) = 1;
  char v40 = (char *)(v32 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269264630) + 44));
  if (v39 == 1) {
    sub_24782428C(v35, v34, v56, v57, v40);
  }
  else {
    sub_247824958(v35, v34, v56, v57, v40);
  }
  swift_bridgeObjectRelease();
  char v41 = sub_247827E40();
  uint64_t v42 = v66;
  sub_2478271DC(v32, v66, &qword_2692645F8);
  uint64_t v43 = v67;
  uint64_t v44 = v42 + *(int *)(v67 + 36);
  *(unsigned char *)uint64_t v44 = v41;
  *(_OWORD *)(v44 + 8) = 0u;
  *(_OWORD *)(v44 + 24) = 0u;
  *(unsigned char *)(v44 + 40) = 1;
  sub_24781D9B0(v32, &qword_2692645F8);
  uint64_t v45 = v64;
  sub_247826DF0(v35, v64, type metadata accessor for SleepAlarmView);
  unint64_t v46 = (*(unsigned __int8 *)(v62 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v62 + 80);
  uint64_t v47 = swift_allocObject();
  sub_247826E70(v45, v47 + v46, type metadata accessor for SleepAlarmView);
  unint64_t v48 = sub_247826EDC();
  uint64_t v49 = v65;
  sub_247827F80();
  swift_release();
  sub_24781D9B0(v42, &qword_269264600);
  uint64_t v51 = v68;
  uint64_t v50 = v69;
  uint64_t v52 = v70;
  (*(void (**)(char *, char *, uint64_t))(v69 + 32))(v68, v49, v70);
  (*(void (**)(char *, char *, uint64_t))(v50 + 16))(v72, v51, v52);
  swift_storeEnumTagMultiPayload();
  uint64_t v75 = v43;
  unint64_t v76 = v48;
  swift_getOpaqueTypeConformance2();
  sub_247827E30();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v50 + 8))(v51, v52);
}

uint64_t sub_24782428C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char *a5@<X8>)
{
  *(void *)&long long v74 = a3;
  *((void *)&v74 + 1) = a4;
  uint64_t v72 = a2;
  v71[0] = a1;
  uint64_t v83 = a5;
  uint64_t v5 = sub_247827930();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v73 = (uint64_t)v71 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_247828150();
  uint64_t v81 = *(void *)(v7 - 8);
  uint64_t v82 = v7;
  MEMORY[0x270FA5388](v7);
  long long v78 = (char *)v71 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v79 = __swift_instantiateConcreteTypeFromMangledName(&qword_269264648) - 8;
  uint64_t v9 = MEMORY[0x270FA5388](v79);
  unint64_t v76 = (char *)v71 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v85 = (uint64_t)v71 - v11;
  uint64_t v80 = sub_247828100();
  uint64_t v77 = *(void *)(v80 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v80);
  uint64_t v75 = (char *)v71 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v84 = (char *)v71 - v14;
  uint64_t v110 = sub_247827C90();
  uint64_t v111 = v15;
  v71[1] = sub_24781C040();
  uint64_t v16 = sub_247827F40();
  uint64_t v18 = v17;
  char v20 = v19 & 1;
  sub_247827EF0();
  uint64_t v21 = sub_247827F20();
  uint64_t v23 = v22;
  char v25 = v24;
  swift_release();
  sub_24781F29C(v16, v18, v20);
  swift_bridgeObjectRelease();
  sub_247828010();
  uint64_t v26 = sub_247827F10();
  uint64_t v28 = v27;
  LOBYTE(v16) = v29;
  uint64_t v31 = v30;
  swift_release();
  sub_24781F29C(v21, v23, v25 & 1);
  swift_bridgeObjectRelease();
  uint64_t v112 = MEMORY[0x263F1A830];
  uint64_t v113 = MEMORY[0x263F77348];
  uint64_t v32 = MEMORY[0x263F1A830];
  uint64_t v33 = swift_allocObject();
  uint64_t v110 = v33;
  *(void *)(v33 + 16) = v26;
  *(void *)(v33 + 24) = v28;
  *(unsigned char *)(v33 + 32) = v16 & 1;
  *(void *)(v33 + 40) = v31;
  uint64_t v109 = 0;
  long long v107 = 0u;
  long long v108 = 0u;
  uint64_t v106 = 0;
  long long v104 = 0u;
  long long v105 = 0u;
  uint64_t v103 = 0;
  long long v101 = 0u;
  long long v102 = 0u;
  uint64_t v100 = 0;
  long long v98 = 0u;
  long long v99 = 0u;
  uint64_t v97 = 0;
  long long v95 = 0u;
  long long v96 = 0u;
  uint64_t v94 = 0;
  long long v92 = 0u;
  long long v93 = 0u;
  uint64_t v91 = 0;
  long long v89 = 0u;
  long long v90 = 0u;
  uint64_t v87 = MEMORY[0x263F1B720];
  uint64_t v88 = MEMORY[0x263F774B0];
  uint64_t v86 = v72;
  swift_retain();
  sub_2478280F0();
  sub_24782316C(v73);
  uint64_t v34 = sub_247827F30();
  uint64_t v36 = v35;
  LOBYTE(v26) = v37;
  uint64_t v39 = v38;
  uint64_t v112 = v32;
  uint64_t v113 = MEMORY[0x263F77348];
  uint64_t v40 = swift_allocObject();
  uint64_t v110 = v40;
  *(void *)(v40 + 16) = v34;
  *(void *)(v40 + 24) = v36;
  *(unsigned char *)(v40 + 32) = v26 & 1;
  *(void *)(v40 + 40) = v39;
  long long v107 = v74;
  swift_bridgeObjectRetain();
  uint64_t v41 = sub_247827F40();
  uint64_t v43 = v42;
  LOBYTE(v39) = v44 & 1;
  sub_247827E70();
  uint64_t v45 = sub_247827F20();
  uint64_t v47 = v46;
  LOBYTE(v16) = v48;
  swift_release();
  LOBYTE(v28) = v16 & 1;
  sub_24781F29C(v41, v43, v39);
  swift_bridgeObjectRelease();
  sub_247828010();
  uint64_t v49 = sub_247827F10();
  uint64_t v51 = v50;
  LOBYTE(v39) = v52;
  uint64_t v54 = v53;
  swift_release();
  sub_24781F29C(v45, v47, v28);
  swift_bridgeObjectRelease();
  *((void *)&v108 + 1) = MEMORY[0x263F1A830];
  uint64_t v109 = MEMORY[0x263F77348];
  uint64_t v55 = swift_allocObject();
  *(void *)&long long v107 = v55;
  *(void *)(v55 + 16) = v49;
  *(void *)(v55 + 24) = v51;
  *(unsigned char *)(v55 + 32) = v39 & 1;
  *(void *)(v55 + 40) = v54;
  uint64_t v106 = 0;
  long long v104 = 0u;
  long long v105 = 0u;
  uint64_t v103 = 0;
  long long v101 = 0u;
  long long v102 = 0u;
  uint64_t v100 = 0;
  long long v98 = 0u;
  long long v99 = 0u;
  uint64_t v56 = v78;
  sub_247828140();
  LOBYTE(v41) = sub_247827E50();
  uint64_t v58 = v81;
  uint64_t v57 = v82;
  uint64_t v59 = (uint64_t)v76;
  (*(void (**)(char *, char *, uint64_t))(v81 + 16))(v76, v56, v82);
  uint64_t v60 = v59 + *(int *)(v79 + 44);
  *(unsigned char *)uint64_t v60 = v41;
  *(_OWORD *)(v60 + 8) = 0u;
  *(_OWORD *)(v60 + 24) = 0u;
  *(unsigned char *)(v60 + 40) = 1;
  (*(void (**)(char *, uint64_t))(v58 + 8))(v56, v57);
  uint64_t v61 = v85;
  sub_247827174(v59, v85);
  uint64_t v62 = v77;
  uint64_t v63 = *(void (**)(char *, char *, uint64_t))(v77 + 16);
  uint64_t v64 = v75;
  uint64_t v65 = v84;
  uint64_t v66 = v80;
  v63(v75, v84, v80);
  sub_2478271DC(v61, v59, &qword_269264648);
  uint64_t v67 = v83;
  v63(v83, v64, v66);
  uint64_t v68 = __swift_instantiateConcreteTypeFromMangledName(&qword_269264650);
  sub_2478271DC(v59, (uint64_t)&v67[*(int *)(v68 + 48)], &qword_269264648);
  sub_24781D9B0(v85, &qword_269264648);
  uint64_t v69 = *(void (**)(char *, uint64_t))(v62 + 8);
  v69(v65, v66);
  sub_24781D9B0(v59, &qword_269264648);
  return ((uint64_t (*)(char *, uint64_t))v69)(v64, v66);
}

uint64_t sub_247824958@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char *a5@<X8>)
{
  *(void *)&long long v92 = a3;
  *((void *)&v92 + 1) = a4;
  v89[1] = a1;
  uint64_t v90 = a2;
  long long v101 = a5;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269264658);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v91 = (char *)v89 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_247828150();
  uint64_t v99 = *(void *)(v7 - 8);
  uint64_t v100 = v7;
  MEMORY[0x270FA5388](v7);
  long long v96 = (char *)v89 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v97 = __swift_instantiateConcreteTypeFromMangledName(&qword_269264648) - 8;
  uint64_t v9 = MEMORY[0x270FA5388](v97);
  uint64_t v94 = (char *)v89 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v104 = (uint64_t)v89 - v11;
  uint64_t v98 = sub_247828100();
  uint64_t v95 = *(void *)(v98 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v98);
  long long v93 = (char *)v89 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v103 = (char *)v89 - v14;
  uint64_t v129 = sub_247827C90();
  uint64_t v130 = v15;
  unint64_t v102 = sub_24781C040();
  uint64_t v16 = sub_247827F40();
  uint64_t v18 = v17;
  char v20 = v19 & 1;
  sub_247827EF0();
  uint64_t v21 = sub_247827F20();
  uint64_t v23 = v22;
  char v25 = v24;
  swift_release();
  sub_24781F29C(v16, v18, v20);
  swift_bridgeObjectRelease();
  sub_247828010();
  uint64_t v26 = sub_247827F10();
  uint64_t v28 = v27;
  char v30 = v29;
  uint64_t v32 = v31;
  swift_release();
  sub_24781F29C(v21, v23, v25 & 1);
  swift_bridgeObjectRelease();
  uint64_t v131 = MEMORY[0x263F1A830];
  uint64_t v132 = MEMORY[0x263F77348];
  uint64_t v33 = swift_allocObject();
  uint64_t v129 = v33;
  *(void *)(v33 + 16) = v26;
  *(void *)(v33 + 24) = v28;
  *(unsigned char *)(v33 + 32) = v30 & 1;
  *(void *)(v33 + 40) = v32;
  uint64_t v128 = 0;
  long long v126 = 0u;
  long long v127 = 0u;
  uint64_t v125 = 0;
  long long v123 = 0u;
  long long v124 = 0u;
  uint64_t v122 = 0;
  long long v120 = 0u;
  long long v121 = 0u;
  uint64_t v119 = 0;
  long long v117 = 0u;
  long long v118 = 0u;
  uint64_t v116 = 0;
  long long v114 = 0u;
  long long v115 = 0u;
  uint64_t v113 = 0;
  long long v111 = 0u;
  long long v112 = 0u;
  uint64_t v110 = 0;
  long long v108 = 0u;
  long long v109 = 0u;
  uint64_t v106 = MEMORY[0x263F1B720];
  uint64_t v107 = MEMORY[0x263F774B0];
  uint64_t v105 = v90;
  swift_retain();
  sub_2478280F0();
  uint64_t v129 = sub_247827CA0();
  uint64_t v130 = v34;
  uint64_t v35 = sub_247827F40();
  uint64_t v37 = v36;
  LOBYTE(v23) = v38 & 1;
  uint64_t v39 = sub_247827E80();
  uint64_t v40 = (uint64_t)v91;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v39 - 8) + 56))(v91, 1, 1, v39);
  sub_247827EB0();
  sub_24781D9B0(v40, &qword_269264658);
  uint64_t v41 = sub_247827F20();
  uint64_t v43 = v42;
  char v45 = v44;
  swift_release();
  sub_24781F29C(v35, v37, v23);
  swift_bridgeObjectRelease();
  sub_247827EA0();
  uint64_t v46 = sub_247827F00();
  uint64_t v48 = v47;
  LOBYTE(v23) = v49 & 1;
  sub_24781F29C(v41, v43, v45 & 1);
  swift_bridgeObjectRelease();
  sub_247827FF0();
  uint64_t v50 = sub_247827F10();
  uint64_t v52 = v51;
  char v54 = v53;
  uint64_t v56 = v55;
  swift_release();
  sub_24781F29C(v46, v48, v23);
  swift_bridgeObjectRelease();
  uint64_t v131 = MEMORY[0x263F1A830];
  uint64_t v132 = MEMORY[0x263F77348];
  uint64_t v57 = swift_allocObject();
  uint64_t v129 = v57;
  *(void *)(v57 + 16) = v50;
  *(void *)(v57 + 24) = v52;
  *(unsigned char *)(v57 + 32) = v54 & 1;
  *(void *)(v57 + 40) = v56;
  long long v126 = v92;
  swift_bridgeObjectRetain();
  uint64_t v58 = sub_247827F40();
  uint64_t v60 = v59;
  LOBYTE(v23) = v61 & 1;
  sub_247827E70();
  uint64_t v62 = sub_247827F20();
  uint64_t v64 = v63;
  char v66 = v65;
  swift_release();
  LOBYTE(v28) = v66 & 1;
  sub_24781F29C(v58, v60, v23);
  swift_bridgeObjectRelease();
  sub_247827FF0();
  uint64_t v67 = sub_247827F10();
  uint64_t v69 = v68;
  LOBYTE(v23) = v70;
  uint64_t v72 = v71;
  swift_release();
  sub_24781F29C(v62, v64, v28);
  swift_bridgeObjectRelease();
  *((void *)&v127 + 1) = MEMORY[0x263F1A830];
  uint64_t v128 = MEMORY[0x263F77348];
  uint64_t v73 = swift_allocObject();
  *(void *)&long long v126 = v73;
  *(void *)(v73 + 16) = v67;
  *(void *)(v73 + 24) = v69;
  *(unsigned char *)(v73 + 32) = v23 & 1;
  *(void *)(v73 + 40) = v72;
  uint64_t v125 = 0;
  long long v123 = 0u;
  long long v124 = 0u;
  uint64_t v122 = 0;
  long long v120 = 0u;
  long long v121 = 0u;
  uint64_t v119 = 0;
  long long v117 = 0u;
  long long v118 = 0u;
  long long v74 = v96;
  sub_247828140();
  LOBYTE(v58) = sub_247827E50();
  uint64_t v76 = v99;
  uint64_t v75 = v100;
  uint64_t v77 = (uint64_t)v94;
  (*(void (**)(char *, char *, uint64_t))(v99 + 16))(v94, v74, v100);
  uint64_t v78 = v77 + *(int *)(v97 + 44);
  *(unsigned char *)uint64_t v78 = v58;
  *(_OWORD *)(v78 + 8) = 0u;
  *(_OWORD *)(v78 + 24) = 0u;
  *(unsigned char *)(v78 + 40) = 1;
  (*(void (**)(char *, uint64_t))(v76 + 8))(v74, v75);
  uint64_t v79 = v104;
  sub_247827174(v77, v104);
  uint64_t v80 = v95;
  uint64_t v81 = *(void (**)(char *, char *, uint64_t))(v95 + 16);
  uint64_t v82 = v93;
  uint64_t v83 = v103;
  uint64_t v84 = v98;
  v81(v93, v103, v98);
  sub_2478271DC(v79, v77, &qword_269264648);
  uint64_t v85 = v101;
  v81(v101, v82, v84);
  uint64_t v86 = __swift_instantiateConcreteTypeFromMangledName(&qword_269264650);
  sub_2478271DC(v77, (uint64_t)&v85[*(int *)(v86 + 48)], &qword_269264648);
  sub_24781D9B0(v104, &qword_269264648);
  uint64_t v87 = *(void (**)(char *, uint64_t))(v80 + 8);
  v87(v83, v84);
  sub_24781D9B0(v77, &qword_269264648);
  return ((uint64_t (*)(char *, uint64_t))v87)(v82, v84);
}

uint64_t sub_247825178()
{
  uint64_t v0 = sub_247827B30();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269264580);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_2478279E0();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_247827C80();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1) {
    return sub_24781D9B0((uint64_t)v6, &qword_269264580);
  }
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v10, v6, v7);
  type metadata accessor for SleepAlarmView(0);
  sub_2478279D0();
  sub_247827B20();
  sub_247828190();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t static AlarmSnippet_Previews.previews.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v42 = a1;
  uint64_t v1 = sub_247827BD0();
  uint64_t v40 = *(void *)(v1 - 8);
  uint64_t v41 = v1;
  uint64_t v2 = MEMORY[0x270FA5388](v1);
  uint64_t v39 = (char *)&v29 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v2);
  char v38 = (char *)&v29 - v4;
  uint64_t v5 = sub_247827AD0();
  uint64_t v6 = MEMORY[0x270FA5388](v5 - 8);
  uint64_t v37 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v36 = (char *)&v29 - v9;
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v33 = (char *)&v29 - v11;
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_269264580);
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v14 = (char *)&v29 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_247827AA0();
  uint64_t v16 = MEMORY[0x270FA5388](v15 - 8);
  uint64_t v35 = (char *)&v29 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  uint64_t v32 = (char *)&v29 - v19;
  uint64_t v20 = MEMORY[0x270FA5388](v18);
  MEMORY[0x270FA5388](v20);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269264588);
  sub_247827D00();
  uint64_t v34 = swift_allocObject();
  *(_OWORD *)(v34 + 16) = xmmword_2478288A0;
  sub_247827A90();
  sub_247827AB0();
  uint64_t v21 = sub_2478279E0();
  uint64_t v22 = *(void *)(v21 - 8);
  char v30 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v22 + 56);
  uint64_t v31 = v22 + 56;
  uint64_t v29 = v21;
  v30(v14, 1, 1, v21);
  sub_247827CB0();
  sub_247827A90();
  sub_247827AB0();
  uint64_t v23 = v30;
  v30(v14, 1, 1, v21);
  sub_247827CB0();
  sub_247827A90();
  sub_247827AB0();
  uint64_t v24 = v29;
  v23(v14, 1, 1, v29);
  sub_247827CB0();
  sub_247827A90();
  sub_247827AB0();
  v23(v14, 1, 1, v24);
  sub_247827CB0();
  char v25 = v38;
  sub_247827BB0();
  uint64_t v26 = v40;
  uint64_t v27 = v41;
  (*(void (**)(char *, char *, uint64_t))(v40 + 16))(v39, v25, v41);
  type metadata accessor for AlarmSnippet(0);
  sub_247821168(&qword_269264590, MEMORY[0x263F751C8]);
  sub_247821168(&qword_269264598, (void (*)(uint64_t))type metadata accessor for AlarmSnippet);
  sub_247828070();
  return (*(uint64_t (**)(char *, uint64_t))(v26 + 8))(v25, v27);
}

uint64_t sub_247825B38@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = (char *)a2 + *(int *)(type metadata accessor for AlarmSnippet(0) + 20);
  uint64_t v5 = sub_247827BD0();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(v4, a1, v5);
  sub_2478281B0();
  sub_247821168(&qword_2692643C0, MEMORY[0x263F77980]);
  uint64_t result = sub_247827DF0();
  *a2 = result;
  a2[1] = v7;
  return result;
}

uint64_t sub_247825C00()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_247825C20()
{
  unint64_t result = qword_2692645A0;
  if (!qword_2692645A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692645A0);
  }
  return result;
}

uint64_t sub_247825C74()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_247825C98(uint64_t a1)
{
  unint64_t v2 = sub_247827510();

  return MEMORY[0x270F00208](a1, v2);
}

uint64_t sub_247825CE4(uint64_t a1)
{
  unint64_t v2 = sub_247827510();

  return MEMORY[0x270F001F8](a1, v2);
}

char *initializeBufferWithCopyOfBuffer for AlarmSnippet(char *a1, char **a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v4 = *a2;
  *(void *)a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v5 = &v4[(v3 + 16) & ~(unint64_t)v3];
    swift_retain();
  }
  else
  {
    uint64_t v5 = a1;
    *((void *)a1 + 1) = a2[1];
    uint64_t v6 = *(int *)(a3 + 20);
    uint64_t v7 = &a1[v6];
    uint64_t v8 = (uint64_t)a2 + v6;
    uint64_t v9 = sub_247827BD0();
    uint64_t v10 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 16);
    uint64_t v11 = v4;
    v10(v7, v8, v9);
  }
  return v5;
}

uint64_t destroy for AlarmSnippet(id *a1, uint64_t a2)
{
  uint64_t v4 = (char *)a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_247827BD0();
  uint64_t v6 = *(uint64_t (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8);

  return v6(v4, v5);
}

void *initializeWithCopy for AlarmSnippet(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_247827BD0();
  uint64_t v10 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 16);
  id v11 = v5;
  v10(v7, v8, v9);
  return a1;
}

uint64_t assignWithCopy for AlarmSnippet(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void **)a1;
  uint64_t v7 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  id v8 = v7;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  uint64_t v9 = *(int *)(a3 + 20);
  uint64_t v10 = a1 + v9;
  uint64_t v11 = a2 + v9;
  uint64_t v12 = sub_247827BD0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 24))(v10, v11, v12);
  return a1;
}

_OWORD *initializeWithTake for AlarmSnippet(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_247827BD0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

uint64_t assignWithTake for AlarmSnippet(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6 = *(void **)a1;
  *(void *)a1 = *a2;

  *(void *)(a1 + 8) = a2[1];
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_247827BD0();
  (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for AlarmSnippet(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2478260E0);
}

uint64_t sub_2478260E0(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 2147483646)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    int v5 = v4 - 1;
    if (v5 < 0) {
      int v5 = -1;
    }
    return (v5 + 1);
  }
  else
  {
    uint64_t v9 = sub_247827BD0();
    uint64_t v10 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 48);
    uint64_t v11 = v9;
    uint64_t v12 = (char *)a1 + *(int *)(a3 + 20);
    return v10(v12, a2, v11);
  }
}

uint64_t storeEnumTagSinglePayload for AlarmSnippet(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2478261B0);
}

void *sub_2478261B0(void *result, uint64_t a2, int a3, uint64_t a4)
{
  int v5 = result;
  if (a3 == 2147483646)
  {
    *unint64_t result = a2;
  }
  else
  {
    uint64_t v7 = sub_247827BD0();
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 20);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_247826258()
{
  uint64_t result = sub_247827BD0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for AlarmSnippet_Previews()
{
  return &type metadata for AlarmSnippet_Previews;
}

unint64_t sub_247826304()
{
  unint64_t result = qword_2692645B8;
  if (!qword_2692645B8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269264578);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269264530);
    sub_24781BE68(&qword_269264570, &qword_269264530);
    swift_getOpaqueTypeConformance2();
    sub_24781BE68(&qword_269264470, &qword_269264460);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692645B8);
  }
  return result;
}

uint64_t sub_247826404()
{
  return sub_24781BE68(&qword_2692645C0, &qword_2692645C8);
}

uint64_t sub_247826458(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, j____swift_get_extra_inhabitant_index_5Tm);
}

uint64_t sub_247826470(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, j____swift_store_extra_inhabitant_index_6Tm);
}

uint64_t *sub_24782648C(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v19 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v19 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_247827D00();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[5];
    uint64_t v9 = a3[6];
    uint64_t v10 = *(void **)((char *)a2 + v8);
    *(uint64_t *)((char *)a1 + v8) = (uint64_t)v10;
    uint64_t v11 = (char *)a1 + v9;
    uint64_t v12 = (char *)a2 + v9;
    *uint64_t v11 = *v12;
    *((void *)v11 + 1) = *((void *)v12 + 1);
    uint64_t v13 = a3[7];
    uint64_t v14 = (char *)a1 + v13;
    uint64_t v15 = (char *)a2 + v13;
    uint64_t v16 = sub_247827A50();
    uint64_t v17 = *(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 16);
    id v18 = v10;
    swift_retain();
    v17(v14, v15, v16);
  }
  return a1;
}

uint64_t sub_2478265D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_247827D00();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);

  swift_release();
  uint64_t v5 = a1 + *(int *)(a2 + 28);
  uint64_t v6 = sub_247827A50();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);

  return v7(v5, v6);
}

uint64_t sub_24782669C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_247827D00();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a3[6];
  uint64_t v9 = *(void **)(a2 + v7);
  *(void *)(a1 + v7) = v9;
  uint64_t v10 = a1 + v8;
  uint64_t v11 = a2 + v8;
  *(unsigned char *)uint64_t v10 = *(unsigned char *)v11;
  *(void *)(v10 + 8) = *(void *)(v11 + 8);
  uint64_t v12 = a3[7];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = sub_247827A50();
  uint64_t v16 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 16);
  id v17 = v9;
  swift_retain();
  v16(v13, v14, v15);
  return a1;
}

uint64_t sub_247826798(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_247827D00();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = *(void **)(a2 + v7);
  uint64_t v9 = *(void **)(a1 + v7);
  *(void *)(a1 + v7) = v8;
  id v10 = v8;

  uint64_t v11 = a3[6];
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  *(unsigned char *)uint64_t v12 = *(unsigned char *)v13;
  *(void *)(v12 + 8) = *(void *)(v13 + 8);
  swift_retain();
  swift_release();
  uint64_t v14 = a3[7];
  uint64_t v15 = a1 + v14;
  uint64_t v16 = a2 + v14;
  uint64_t v17 = sub_247827A50();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 24))(v15, v16, v17);
  return a1;
}

uint64_t sub_247826894(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_247827D00();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  *(_OWORD *)(a1 + v7) = *(_OWORD *)(a2 + v7);
  uint64_t v8 = a3[7];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = sub_247827A50();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 32))(v9, v10, v11);
  return a1;
}

uint64_t sub_247826960(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_247827D00();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = *(void **)(a1 + v7);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);

  uint64_t v9 = a3[6];
  uint64_t v10 = a1 + v9;
  uint64_t v11 = a2 + v9;
  *(unsigned char *)uint64_t v10 = *(unsigned char *)v11;
  *(void *)(v10 + 8) = *(void *)(v11 + 8);
  swift_release();
  uint64_t v12 = a3[7];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = sub_247827A50();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 40))(v13, v14, v15);
  return a1;
}

uint64_t sub_247826A50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_247826A64);
}

uint64_t __swift_get_extra_inhabitant_index_5Tm(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_247827D00();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else if (a2 == 0x7FFFFFFF)
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20));
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
  else
  {
    uint64_t v11 = sub_247827A50();
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 48);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a3 + 28);
    return v12(v14, a2, v13);
  }
}

uint64_t sub_247826B94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_247826BA8);
}

uint64_t __swift_store_extra_inhabitant_index_6Tm(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_247827D00();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else if (a3 == 0x7FFFFFFF)
  {
    *(void *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  }
  else
  {
    uint64_t v11 = sub_247827A50();
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a4 + 28);
    return v12(v14, a2, a2, v13);
  }
  return result;
}

uint64_t sub_247826CD8()
{
  uint64_t result = sub_247827D00();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_247827A50();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t sub_247826DB8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_247826DD4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_247826DF0(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_247826E58()
{
  return objectdestroy_13Tm(type metadata accessor for SleepAlarmView);
}

uint64_t sub_247826E70(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

unint64_t sub_247826EDC()
{
  unint64_t result = qword_269264638;
  if (!qword_269264638)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269264600);
    sub_24781BE68(&qword_269264640, &qword_2692645F8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269264638);
  }
  return result;
}

uint64_t sub_247826F7C()
{
  return objectdestroy_13Tm(type metadata accessor for SleepAlarmView);
}

uint64_t objectdestroy_13Tm(uint64_t (*a1)(void))
{
  unint64_t v2 = (int *)(a1(0) - 8);
  uint64_t v3 = *(unsigned __int8 *)(*(void *)v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(*(void *)v2 + 64);
  uint64_t v6 = v3 | 7;
  uint64_t v7 = v1 + v4;
  uint64_t v8 = sub_247827D00();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);

  swift_release();
  uint64_t v9 = v7 + v2[9];
  uint64_t v10 = sub_247827A50();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);

  return MEMORY[0x270FA0238](v1, v5, v6);
}

uint64_t sub_2478270DC()
{
  return sub_247825178();
}

uint64_t sub_247827130()
{
  sub_24781F29C(*(void *)(v0 + 16), *(void *)(v0 + 24), *(unsigned char *)(v0 + 32));
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_247827174(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269264648);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2478271DC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

void sub_247827240()
{
}

void sub_247827260()
{
}

uint64_t sub_247827288()
{
  return 8;
}

uint64_t sub_247827294()
{
  return swift_release();
}

uint64_t sub_24782729C(void *a1, void *a2)
{
  *a2 = *a1;
  return swift_retain();
}

uint64_t sub_2478272A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_247820690(a1, a2, a3, &qword_269264670) & 1;
}

uint64_t sub_2478272CC(uint64_t a1, uint64_t a2)
{
  return keypath_hashTm(a1, a2, &qword_269264670);
}

void *sub_2478272D8(void *result, void *a2)
{
  *a2 = *result;
  return result;
}

void sub_2478272E4()
{
}

void sub_247827304()
{
}

uint64_t sub_24782732C()
{
  return 8;
}

uint64_t sub_247827338(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_247820690(a1, a2, a3, &qword_269264668) & 1;
}

uint64_t sub_24782735C(uint64_t a1, uint64_t a2)
{
  return keypath_hashTm(a1, a2, &qword_269264668);
}

void sub_247827368()
{
}

void sub_247827388()
{
}

uint64_t sub_2478273B0()
{
  return 8;
}

uint64_t sub_2478273BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_247820690(a1, a2, a3, &qword_269264660) & 1;
}

uint64_t sub_2478273E0(uint64_t a1, uint64_t a2)
{
  return keypath_hashTm(a1, a2, &qword_269264660);
}

uint64_t sub_2478273EC()
{
  return objectdestroy_13Tm(type metadata accessor for AlarmView);
}

uint64_t sub_247827404(unsigned __int8 *a1, unsigned __int8 *a2)
{
  type metadata accessor for AlarmView(0);
  uint64_t result = *a2;
  if (*a1 != result) {
    return sub_247822A98(result);
  }
  return result;
}

uint64_t sub_247827480()
{
  return objectdestroy_13Tm(type metadata accessor for AlarmView);
}

uint64_t sub_247827498()
{
  type metadata accessor for AlarmView(0);

  return sub_247822E28();
}

_OWORD *sub_2478274F8(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_247827508()
{
  return swift_release();
}

unint64_t sub_247827510()
{
  unint64_t result = qword_269264698;
  if (!qword_269264698)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269264698);
  }
  return result;
}

uint64_t objectdestroyTm_1()
{
  uint64_t v1 = (int *)(type metadata accessor for AlarmSnippet(0) - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v3 + *(void *)(*(void *)v1 + 64);
  uint64_t v5 = v2 | 7;
  uint64_t v6 = v0 + v3;

  uint64_t v7 = v6 + v1[7];
  uint64_t v8 = sub_247827BD0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);

  return MEMORY[0x270FA0238](v0, v4, v5);
}

uint64_t sub_24782765C@<X0>(char *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(type metadata accessor for AlarmSnippet(0) - 8);
  uint64_t v6 = (void **)(v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80)));

  return sub_2478211F8(a1, v6, a2);
}

uint64_t sub_2478276DC(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_247827740()
{
  unint64_t result = qword_2692646C0;
  if (!qword_2692646C0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2692646C8);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269264600);
    sub_247826EDC();
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692646C0);
  }
  return result;
}

uint64_t sub_2478277E8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2478278D0()
{
  return MEMORY[0x270EEEA00]();
}

uint64_t sub_2478278E0()
{
  return MEMORY[0x270EEEA40]();
}

uint64_t sub_2478278F0()
{
  return MEMORY[0x270EFEAE8]();
}

uint64_t sub_247827900()
{
  return MEMORY[0x270EFEB00]();
}

uint64_t sub_247827910()
{
  return MEMORY[0x270EEEB18]();
}

uint64_t sub_247827920()
{
  return MEMORY[0x270EEEBC0]();
}

uint64_t sub_247827930()
{
  return MEMORY[0x270EEEDD8]();
}

uint64_t sub_247827940()
{
  return MEMORY[0x270EEF020]();
}

uint64_t sub_247827950()
{
  return MEMORY[0x270EEF040]();
}

uint64_t sub_247827960()
{
  return MEMORY[0x270EEF050]();
}

uint64_t sub_247827970()
{
  return MEMORY[0x270EEF060]();
}

uint64_t sub_247827980()
{
  return MEMORY[0x270EEF070]();
}

uint64_t sub_247827990()
{
  return MEMORY[0x270EEF810]();
}

uint64_t sub_2478279A0()
{
  return MEMORY[0x270EFEB28]();
}

uint64_t sub_2478279B0()
{
  return MEMORY[0x270EEFB78]();
}

uint64_t sub_2478279C0()
{
  return MEMORY[0x270EEFB88]();
}

uint64_t sub_2478279D0()
{
  return MEMORY[0x270EEFC58]();
}

uint64_t sub_2478279E0()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_2478279F0()
{
  return MEMORY[0x270EF0310]();
}

uint64_t sub_247827A00()
{
  return MEMORY[0x270EF0320]();
}

uint64_t sub_247827A10()
{
  return MEMORY[0x270EF0358]();
}

uint64_t sub_247827A20()
{
  return MEMORY[0x270EF0360]();
}

uint64_t sub_247827A30()
{
  return MEMORY[0x270EF0400]();
}

uint64_t sub_247827A40()
{
  return MEMORY[0x270EF0428]();
}

uint64_t sub_247827A50()
{
  return MEMORY[0x270EF06E0]();
}

uint64_t sub_247827A60()
{
  return MEMORY[0x270EF07A8]();
}

uint64_t sub_247827A70()
{
  return MEMORY[0x270EF07B0]();
}

uint64_t sub_247827A80()
{
  return MEMORY[0x270EF07B8]();
}

uint64_t sub_247827A90()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t sub_247827AA0()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_247827AB0()
{
  return MEMORY[0x270EF0D78]();
}

uint64_t sub_247827AC0()
{
  return MEMORY[0x270EF0EF8]();
}

uint64_t sub_247827AD0()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_247827AE0()
{
  return MEMORY[0x270EF12E0]();
}

uint64_t sub_247827AF0()
{
  return MEMORY[0x270EF1440]();
}

uint64_t sub_247827B00()
{
  return MEMORY[0x270EF15D0]();
}

uint64_t sub_247827B10()
{
  return MEMORY[0x270EF1608]();
}

uint64_t sub_247827B20()
{
  return MEMORY[0x270F73A60]();
}

uint64_t sub_247827B30()
{
  return MEMORY[0x270F73A80]();
}

uint64_t sub_247827B40()
{
  return MEMORY[0x270F73C68]();
}

uint64_t sub_247827B50()
{
  return MEMORY[0x270F75648]();
}

uint64_t sub_247827B60()
{
  return MEMORY[0x270F75670]();
}

uint64_t sub_247827B70()
{
  return MEMORY[0x270F72700]();
}

uint64_t sub_247827B80()
{
  return MEMORY[0x270F72708]();
}

uint64_t sub_247827B90()
{
  return MEMORY[0x270F72710]();
}

uint64_t sub_247827BA0()
{
  return MEMORY[0x270F72718]();
}

uint64_t sub_247827BB0()
{
  return MEMORY[0x270F724F8]();
}

uint64_t sub_247827BC0()
{
  return MEMORY[0x270F72500]();
}

uint64_t sub_247827BD0()
{
  return MEMORY[0x270F72508]();
}

uint64_t sub_247827BE0()
{
  return MEMORY[0x270F72510]();
}

uint64_t sub_247827BF0()
{
  return MEMORY[0x270F72518]();
}

uint64_t sub_247827C00()
{
  return MEMORY[0x270F72520]();
}

uint64_t sub_247827C10()
{
  return MEMORY[0x270F72528]();
}

uint64_t sub_247827C20()
{
  return MEMORY[0x270F72530]();
}

uint64_t sub_247827C30()
{
  return MEMORY[0x270F72538]();
}

uint64_t sub_247827C40()
{
  return MEMORY[0x270F72540]();
}

uint64_t sub_247827C50()
{
  return MEMORY[0x270F72548]();
}

uint64_t sub_247827C60()
{
  return MEMORY[0x270F72550]();
}

uint64_t sub_247827C70()
{
  return MEMORY[0x270F72558]();
}

uint64_t sub_247827C80()
{
  return MEMORY[0x270F72560]();
}

uint64_t sub_247827C90()
{
  return MEMORY[0x270F72568]();
}

uint64_t sub_247827CA0()
{
  return MEMORY[0x270F72570]();
}

uint64_t sub_247827CB0()
{
  return MEMORY[0x270F72578]();
}

uint64_t sub_247827CC0()
{
  return MEMORY[0x270F72580]();
}

uint64_t sub_247827CD0()
{
  return MEMORY[0x270F72588]();
}

uint64_t sub_247827CE0()
{
  return MEMORY[0x270F72590]();
}

uint64_t sub_247827CF0()
{
  return MEMORY[0x270F72598]();
}

uint64_t sub_247827D00()
{
  return MEMORY[0x270F725A0]();
}

uint64_t sub_247827D10()
{
  return MEMORY[0x270F725A8]();
}

uint64_t sub_247827D20()
{
  return MEMORY[0x270F725B0]();
}

uint64_t sub_247827D30()
{
  return MEMORY[0x270F725B8]();
}

uint64_t sub_247827D40()
{
  return MEMORY[0x270F725C0]();
}

uint64_t sub_247827D50()
{
  return MEMORY[0x270F725C8]();
}

uint64_t sub_247827D60()
{
  return MEMORY[0x270F725D0]();
}

uint64_t sub_247827D70()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_247827D80()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_247827D90()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_247827DA0()
{
  return MEMORY[0x270EFEF30]();
}

uint64_t sub_247827DB0()
{
  return MEMORY[0x270F001F0]();
}

uint64_t sub_247827DE0()
{
  return MEMORY[0x270F00828]();
}

uint64_t sub_247827DF0()
{
  return MEMORY[0x270F00840]();
}

uint64_t sub_247827E00()
{
  return MEMORY[0x270F008D0]();
}

uint64_t sub_247827E10()
{
  return MEMORY[0x270F008D8]();
}

uint64_t sub_247827E20()
{
  return MEMORY[0x270F01510]();
}

uint64_t sub_247827E30()
{
  return MEMORY[0x270F01800]();
}

uint64_t sub_247827E40()
{
  return MEMORY[0x270F02A38]();
}

uint64_t sub_247827E50()
{
  return MEMORY[0x270F02A48]();
}

uint64_t sub_247827E60()
{
  return MEMORY[0x270F02AD0]();
}

uint64_t sub_247827E70()
{
  return MEMORY[0x270F02AE8]();
}

uint64_t sub_247827E80()
{
  return MEMORY[0x270F02BA8]();
}

uint64_t sub_247827E90()
{
  return MEMORY[0x270F02BC8]();
}

uint64_t sub_247827EA0()
{
  return MEMORY[0x270F02BE8]();
}

uint64_t sub_247827EB0()
{
  return MEMORY[0x270F02C40]();
}

uint64_t sub_247827EC0()
{
  return MEMORY[0x270F02C88]();
}

uint64_t sub_247827ED0()
{
  return MEMORY[0x270F02C98]();
}

uint64_t sub_247827EE0()
{
  return MEMORY[0x270F02D08]();
}

uint64_t sub_247827EF0()
{
  return MEMORY[0x270F02D10]();
}

uint64_t sub_247827F00()
{
  return MEMORY[0x270F02F28]();
}

uint64_t sub_247827F10()
{
  return MEMORY[0x270F03008]();
}

uint64_t sub_247827F20()
{
  return MEMORY[0x270F030A8]();
}

uint64_t sub_247827F30()
{
  return MEMORY[0x270F03238]();
}

uint64_t sub_247827F40()
{
  return MEMORY[0x270F03250]();
}

uint64_t sub_247827F50()
{
  return MEMORY[0x270F75950]();
}

uint64_t sub_247827F60()
{
  return MEMORY[0x270F75970]();
}

uint64_t sub_247827F70()
{
  return MEMORY[0x270F75990]();
}

uint64_t sub_247827F80()
{
  return MEMORY[0x270F759D8]();
}

uint64_t sub_247827F90()
{
  return MEMORY[0x270F75A28]();
}

uint64_t sub_247827FA0()
{
  return MEMORY[0x270F75A70]();
}

uint64_t sub_247827FB0()
{
  return MEMORY[0x270F032C0]();
}

uint64_t sub_247827FC0()
{
  return MEMORY[0x270F032D0]();
}

uint64_t sub_247827FD0()
{
  return MEMORY[0x270F036C0]();
}

uint64_t sub_247827FE0()
{
  return MEMORY[0x270F04188]();
}

uint64_t sub_247827FF0()
{
  return MEMORY[0x270F04410]();
}

uint64_t sub_247828000()
{
  return MEMORY[0x270F04460]();
}

uint64_t sub_247828010()
{
  return MEMORY[0x270F04498]();
}

uint64_t sub_247828020()
{
  return MEMORY[0x270F04820]();
}

uint64_t sub_247828030()
{
  return MEMORY[0x270F04848]();
}

uint64_t sub_247828040()
{
  return MEMORY[0x270F048B0]();
}

uint64_t sub_247828050()
{
  return MEMORY[0x270F04CA8]();
}

uint64_t sub_247828060()
{
  return MEMORY[0x270F75AD0]();
}

uint64_t sub_247828070()
{
  return MEMORY[0x270F75AF0]();
}

uint64_t sub_247828080()
{
  return MEMORY[0x270F75B20]();
}

uint64_t sub_247828090()
{
  return MEMORY[0x270F75B38]();
}

uint64_t sub_2478280A0()
{
  return MEMORY[0x270F75C30]();
}

uint64_t sub_2478280B0()
{
  return MEMORY[0x270F75C50]();
}

uint64_t sub_2478280C0()
{
  return MEMORY[0x270F75C80]();
}

uint64_t sub_2478280D0()
{
  return MEMORY[0x270F75C90]();
}

uint64_t sub_2478280E0()
{
  return MEMORY[0x270F75D90]();
}

uint64_t sub_2478280F0()
{
  return MEMORY[0x270F75DB8]();
}

uint64_t sub_247828100()
{
  return MEMORY[0x270F75DC0]();
}

uint64_t sub_247828110()
{
  return MEMORY[0x270F75E08]();
}

uint64_t sub_247828120()
{
  return MEMORY[0x270F75E18]();
}

uint64_t sub_247828130()
{
  return MEMORY[0x270F75F70]();
}

uint64_t sub_247828140()
{
  return MEMORY[0x270F75FC8]();
}

uint64_t sub_247828150()
{
  return MEMORY[0x270F75FE0]();
}

uint64_t sub_247828160()
{
  return MEMORY[0x270F75FE8]();
}

uint64_t sub_247828170()
{
  return MEMORY[0x270F75FF0]();
}

uint64_t sub_247828180()
{
  return MEMORY[0x270F760C0]();
}

uint64_t sub_247828190()
{
  return MEMORY[0x270F76250]();
}

uint64_t sub_2478281A0()
{
  return MEMORY[0x270F76260]();
}

uint64_t sub_2478281B0()
{
  return MEMORY[0x270F76280]();
}

uint64_t sub_2478281C0()
{
  return MEMORY[0x270F9D328]();
}

uint64_t sub_2478281D0()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_2478281E0()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_2478281F0()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_247828200()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_247828210()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_247828220()
{
  return MEMORY[0x270EF2400]();
}

uint64_t sub_247828230()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_247828240()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_247828250()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_247828260()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_247828270()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_247828280()
{
  return MEMORY[0x270F9F0C0]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x270FA03B8]();
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